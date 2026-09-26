// SPDX-License-Identifier: AGPL-3.0-only
//! Loosely-coupled GNSS/INS scenario pack.
//!
//! This is the runnable scenario that drives the three-axis closed-loop navigator
//! ([`ClosedLoopInsGnss`]) over a GNSS availability timeline and scores it. It is
//! the wiring that turns the strapdown mechanization + 15-state error-state EKF
//! from a unit-tested kernel into a pack with a figure of merit, replacing the
//! 1-DOF scalar dead-reckoner's *truth-snap reset* (which teleports the position
//! back onto truth at every fix) with genuine fusion: while GNSS is nominal the
//! filter disciplines the strapdown solution against noisy fixes; through the
//! outage it coasts on the corrected state. The reported error is the real
//! horizontal residual of the fused solution against truth, and each run also
//! carries the open-loop free-INS RMS so the filter's value is explicit.
//!
//! The two IMUs (quantum/classical) differ only in their *true* inertial errors.
//! The findings this pack demonstrates are (a) fusion bounds the error and beats
//! unaided dead-reckoning over the outage for a biased sensor, and (b) a lower-bias
//! sensor has the better unaided coast. With only constant biases and no noise the
//! filter learns them during the aided arc, so the fused coast is a best case: what
//! ends a real coast is error the filter has not seen, such as a bias that keeps
//! drifting (the `error_model` rate-ramps; see `scenarios/small-uas-jammed-nav.toml`).
//!
//! **Revision, 0.27.3.** Until 0.27.3 the filter's gyro-bias coupling had the wrong
//! sign (see [`super::gnss_ins_ekf`]), so every gyro-bias estimate pushed the wrong
//! way and only the tight default prior kept the pack stable. The published outage
//! figures then carried a floor of tens of metres, which this module's documentation
//! read as a hand-over attitude floor. That reading was an artefact of the bug and is
//! withdrawn; the CHANGELOG records the before and after figures.
//!
//! Each sensor may set its own filter prior (`[imu_*.filter_prior]`); without one the
//! pack keeps its historical tactical-grade prior.
//!
//! Honest scope: loosely-coupled, single deterministic driving trajectory (a
//! forward-acceleration and yaw square wave that gives the filter observability),
//! flat-Earth tangent-plane INS↔GNSS comparison. Per-bias calibration is not
//! claimed; the delivered quantity is the bounded, corrected state and its outage
//! coast.

use super::closed_loop::ClosedLoopInsGnss;
use super::gnss_ins_ekf::{EkfNoise, GnssInsEkf};
use crate::frames::{Geodetic, Vec3};
use crate::inertial::attitude::Quaternion;
use crate::inertial::imu_errors::ImuErrorModel;
use crate::inertial::mechanization::{normal_gravity, radii_of_curvature, NavState};
use crate::inertial::{score_position, PosSample, PositionFoM};
use crate::scenario::{GnssState, GnssTimeline, TimeCfg};
use crate::types::ModelSpec;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// The TOML-exposed deterministic IMU error schema, applied *on top of* the
/// constant turn-on biases ([`ImuCfg::accel_bias`] / [`ImuCfg::gyro_bias`]).
///
/// Every field defaults to zero, so an omitted `[imu_*.error_model]` block leaves
/// the sensor model as a pure constant-bias source — the pack's behaviour is then
/// byte-identical to before this schema existed. Set any field to drive the full
/// deterministic error chain of [`ImuErrorModel`] (IEEE Std 952-1997 §A.2; Groves
/// 2013 §4.3) through the three-axis strapdown mechanization. Scale-factor is given
/// in **ppm**; the other terms are in the model's SI units.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(default)]
pub struct ImuErrorCfg {
    /// Per-axis gyro scale-factor error (ppm).
    pub scale_gyro_ppm: Vec3,
    /// Per-axis accelerometer scale-factor error (ppm).
    pub scale_accel_ppm: Vec3,
    /// Gyro misalignment / cross-coupling matrix (rad, off-diagonal).
    pub misalignment_gyro: [[f64; 3]; 3],
    /// Accelerometer misalignment / cross-coupling matrix (rad, off-diagonal).
    pub misalignment_accel: [[f64; 3]; 3],
    /// Gyro g-sensitivity (rad/s per m/s²), mapping specific force to rate bias.
    pub g_sensitivity: Vec3,
    /// Gyro output quantization step (rad/s; 0 disables).
    pub quant_gyro: Vec3,
    /// Accelerometer output quantization step (m/s²; 0 disables).
    pub quant_accel: Vec3,
    /// Gyro rate-ramp (rad/s²) — linear-in-time drift.
    pub rate_ramp_gyro: Vec3,
    /// Accelerometer rate-ramp (m/s³) — linear-in-time drift.
    pub rate_ramp_accel: Vec3,
}

/// One IMU's *true* error sources: the constant turn-on biases that distinguish
/// the quantum-grade from the classical sensor, plus an optional deterministic
/// error model exposing the full [`ImuErrorModel`] chain through TOML.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ImuCfg {
    pub id: String,
    pub provenance: String,
    /// True constant accelerometer bias (m/s²), body axes.
    pub accel_bias: Vec3,
    /// True constant gyro bias (rad/s), body axes.
    pub gyro_bias: Vec3,
    /// Optional deterministic error model applied on top of the biases. When
    /// absent the sensor is a pure constant-bias source (the historical default).
    #[serde(default)]
    pub error_model: Option<ImuErrorCfg>,
    /// Optional filter prior for this sensor: the 1-sigma turn-on bias the error-state
    /// filter starts out believing. When absent the filter uses the pack's historical
    /// constants ([`DEFAULT_SIGMA_ACCEL_BIAS`], [`DEFAULT_SIGMA_GYRO_BIAS`]), which suit a
    /// tactical-grade unit, and the run is byte-identical to before this field existed.
    /// A consumer-grade sensor whose residual bias sits many sigma outside that prior
    /// needs its own, or the filter never learns the bias and the coast is a
    /// tuning artefact rather than a property of the sensor.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub filter_prior: Option<FilterPriorCfg>,
}

/// The pack's historical accelerometer-bias prior, 1-sigma (m/s²).
pub const DEFAULT_SIGMA_ACCEL_BIAS: f64 = 0.05;
/// The pack's historical gyro-bias prior, 1-sigma (rad/s).
pub const DEFAULT_SIGMA_GYRO_BIAS: f64 = 1e-4;

/// A sensor's filter prior on its own turn-on biases (1-sigma, per axis).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct FilterPriorCfg {
    /// Accelerometer-bias prior, 1-sigma (m/s²).
    pub sigma_accel_bias: f64,
    /// Gyro-bias prior, 1-sigma (rad/s).
    pub sigma_gyro_bias: f64,
}

impl FilterPriorCfg {
    fn validate(&self, slot: &str) -> Result<(), String> {
        for (name, v) in [
            ("sigma_accel_bias", self.sigma_accel_bias),
            ("sigma_gyro_bias", self.sigma_gyro_bias),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!(
                    "{slot}.filter_prior.{name} must be finite and > 0, got {v}"
                ));
            }
        }
        Ok(())
    }
}

impl ImuCfg {
    /// Build the deterministic [`ImuErrorModel`] this sensor drives: the constant
    /// turn-on biases always, plus the systematic error terms when an
    /// `[error_model]` block is supplied. With no block, `distort` reduces exactly
    /// to adding the constant bias.
    fn build_error_model(&self) -> ImuErrorModel {
        let mut m = ImuErrorModel::ideal()
            .with_provenance(&self.provenance)
            .with_bias(self.gyro_bias, self.accel_bias);
        if let Some(e) = &self.error_model {
            m = m
                .with_scale_gyro_ppm(e.scale_gyro_ppm)
                .with_scale_accel_ppm(e.scale_accel_ppm)
                .with_misalignment_gyro(e.misalignment_gyro)
                .with_misalignment_accel(e.misalignment_accel)
                .with_g_sensitivity(e.g_sensitivity)
                .with_quantization(e.quant_gyro, e.quant_accel)
                .with_rate_ramp(e.rate_ramp_gyro, e.rate_ramp_accel);
        }
        m
    }
}

/// Unit and provenance class for every numeric field the `gnss-ins` report emits.
///
/// The `quantum.*` and `classical.*` halves are the same [`FusedRun`] shape run with two
/// different IMU bias sets, so every row appears twice under a literal prefix; the table is
/// keyed by the path in *this* document, so the shared-struct rows live here too.
///
/// The `fom` block is [`crate::inertial::PositionFoM`] — the **position**-domain figures of
/// merit — not the timing-domain `FoMScores` that `docs/SCHEMA.md` tabulates field by field.
/// The one field the two share by construction is `holdover_s`, which this pack scores
/// through the same `crate::fom::worst_case_holdover` helper, breaching on
/// `|error_m| > threshold_m` instead of a timing threshold; its unit and grid-bounded caveat
/// match that document's row. The remaining rows are read off
/// [`crate::inertial::score_position`], which is where they are computed.
///
/// Two windows differ and the definitions say which is which: `pos_rms_m`, `pos_p95_m`,
/// `drift_slope_m_per_s`, `fused_outage_rms_m` and `free_outage_rms_m` are all over the
/// GNSS-denied samples only, while `availability` is over the whole run.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "seed",
            unit: "1",
            provenance: Input,
            definition: "master RNG seed; the quantum run uses it directly and the classical \
                         run uses it plus a fixed odd-constant stride, so both are \
                         reproducible and independently drawn",
        },
        FieldUnit {
            path: "threshold_m",
            unit: "m",
            provenance: Input,
            definition: "horizontal-error alert threshold: a sample is in spec when \
                         |error_m| <= threshold_m, which is what sets availability and what \
                         ends a holdover segment",
        },
        FieldUnit {
            path: "quantum.spec.params.accel_bias[]",
            unit: "m/s^2",
            provenance: Input,
            definition: "the quantum-grade IMU's true constant accelerometer turn-on bias, \
                         body axes (x, y, z), echoed from imu_quantum.accel_bias",
        },
        FieldUnit {
            path: "quantum.spec.params.gyro_bias[]",
            unit: "rad/s",
            provenance: Input,
            definition: "the quantum-grade IMU's true constant gyro turn-on bias, body axes \
                         (x, y, z), echoed from imu_quantum.gyro_bias",
        },
        FieldUnit {
            path: "quantum.spec.params.filter_prior.sigma_accel_bias",
            unit: "m/s^2",
            provenance: Input,
            definition: "the filter's 1-sigma prior on this IMU's accelerometer turn-on bias, \
                         echoed from imu_quantum.filter_prior; present only when the scenario \
                         sets one (otherwise the pack default of 0.05 applies)",
        },
        FieldUnit {
            path: "quantum.spec.params.filter_prior.sigma_gyro_bias",
            unit: "rad/s",
            provenance: Input,
            definition: "the filter's 1-sigma prior on this IMU's gyro turn-on bias, echoed \
                         from imu_quantum.filter_prior; present only when the scenario sets one \
                         (otherwise the pack default of 1e-4 applies)",
        },
        FieldUnit {
            path: "quantum.series[].t",
            unit: "s",
            provenance: Computed,
            definition: "epoch of the sample, step index times time.step_s from the run start",
        },
        FieldUnit {
            path: "quantum.series[].error_m",
            unit: "m",
            provenance: Computed,
            definition: "horizontal (north/east) distance between the fused INS/GNSS position \
                         and truth in the tangent plane at that epoch, for the quantum-grade \
                         IMU",
        },
        FieldUnit {
            path: "quantum.fom.pos_rms_m",
            unit: "m",
            provenance: Computed,
            definition: "root-mean-square of series[].error_m over the GNSS-denied (outage) \
                         samples only",
        },
        FieldUnit {
            path: "quantum.fom.pos_p95_m",
            unit: "m",
            provenance: Computed,
            definition: "95th percentile (nearest-rank on the sorted values) of \
                         |series[].error_m| over the GNSS-denied samples only",
        },
        FieldUnit {
            path: "quantum.fom.holdover_s",
            unit: "s",
            provenance: Computed,
            definition: "worst-case (shortest) in-spec coast across the outage segments: per \
                         segment, the time from its start to the first sample breaching \
                         threshold_m, or to its end if none does; grid-bounded, so a lower \
                         bound at the time-step resolution",
        },
        FieldUnit {
            path: "quantum.fom.drift_slope_m_per_s",
            unit: "m/s",
            provenance: Computed,
            definition: "least-squares slope of |series[].error_m| against t over the \
                         GNSS-denied samples: the growth rate of the horizontal error \
                         through the outage",
        },
        FieldUnit {
            path: "quantum.fom.availability",
            unit: "1",
            provenance: Computed,
            definition: "fraction in [0, 1] of the samples of the WHOLE run — not just the \
                         outage — whose |error_m| is within threshold_m",
        },
        FieldUnit {
            path: "quantum.fused_outage_rms_m",
            unit: "m",
            provenance: Computed,
            definition: "time-RMS horizontal error of the fused INS/GNSS solution over the \
                         GNSS-denied samples; the same statistic as fom.pos_rms_m, \
                         accumulated independently as the run proceeds",
        },
        FieldUnit {
            path: "quantum.free_outage_rms_m",
            unit: "m",
            provenance: Computed,
            definition: "time-RMS horizontal error over the same GNSS-denied samples of the \
                         unaided free-running INS, which never receives a fix — the \
                         comparison baseline the fused figure is read against",
        },
        FieldUnit {
            path: "classical.spec.params.accel_bias[]",
            unit: "m/s^2",
            provenance: Input,
            definition: "the classical IMU's true constant accelerometer turn-on bias, body \
                         axes (x, y, z), echoed from imu_classical.accel_bias",
        },
        FieldUnit {
            path: "classical.spec.params.gyro_bias[]",
            unit: "rad/s",
            provenance: Input,
            definition: "the classical IMU's true constant gyro turn-on bias, body axes \
                         (x, y, z), echoed from imu_classical.gyro_bias",
        },
        FieldUnit {
            path: "classical.spec.params.filter_prior.sigma_accel_bias",
            unit: "m/s^2",
            provenance: Input,
            definition: "the filter's 1-sigma prior on this IMU's accelerometer turn-on bias, \
                         echoed from imu_classical.filter_prior; present only when the scenario \
                         sets one (otherwise the pack default of 0.05 applies)",
        },
        FieldUnit {
            path: "classical.spec.params.filter_prior.sigma_gyro_bias",
            unit: "rad/s",
            provenance: Input,
            definition: "the filter's 1-sigma prior on this IMU's gyro turn-on bias, echoed \
                         from imu_classical.filter_prior; present only when the scenario sets one \
                         (otherwise the pack default of 1e-4 applies)",
        },
        FieldUnit {
            path: "classical.series[].t",
            unit: "s",
            provenance: Computed,
            definition: "epoch of the sample, step index times time.step_s from the run start",
        },
        FieldUnit {
            path: "classical.series[].error_m",
            unit: "m",
            provenance: Computed,
            definition: "horizontal (north/east) distance between the fused INS/GNSS position \
                         and truth in the tangent plane at that epoch, for the classical IMU",
        },
        FieldUnit {
            path: "classical.fom.pos_rms_m",
            unit: "m",
            provenance: Computed,
            definition: "root-mean-square of series[].error_m over the GNSS-denied (outage) \
                         samples only",
        },
        FieldUnit {
            path: "classical.fom.pos_p95_m",
            unit: "m",
            provenance: Computed,
            definition: "95th percentile (nearest-rank on the sorted values) of \
                         |series[].error_m| over the GNSS-denied samples only",
        },
        FieldUnit {
            path: "classical.fom.holdover_s",
            unit: "s",
            provenance: Computed,
            definition: "worst-case (shortest) in-spec coast across the outage segments: per \
                         segment, the time from its start to the first sample breaching \
                         threshold_m, or to its end if none does; grid-bounded, so a lower \
                         bound at the time-step resolution",
        },
        FieldUnit {
            path: "classical.fom.drift_slope_m_per_s",
            unit: "m/s",
            provenance: Computed,
            definition: "least-squares slope of |series[].error_m| against t over the \
                         GNSS-denied samples: the growth rate of the horizontal error \
                         through the outage",
        },
        FieldUnit {
            path: "classical.fom.availability",
            unit: "1",
            provenance: Computed,
            definition: "fraction in [0, 1] of the samples of the WHOLE run — not just the \
                         outage — whose |error_m| is within threshold_m",
        },
        FieldUnit {
            path: "classical.fused_outage_rms_m",
            unit: "m",
            provenance: Computed,
            definition: "time-RMS horizontal error of the fused INS/GNSS solution over the \
                         GNSS-denied samples; the same statistic as fom.pos_rms_m, \
                         accumulated independently as the run proceeds",
        },
        FieldUnit {
            path: "classical.free_outage_rms_m",
            unit: "m",
            provenance: Computed,
            definition: "time-RMS horizontal error over the same GNSS-denied samples of the \
                         unaided free-running INS, which never receives a fix — the \
                         comparison baseline the fused figure is read against",
        },
    ]
};

fn default_fix_interval() -> f64 {
    1.0
}
fn default_sigma_pos() -> f64 {
    1.0
}
fn default_sigma_vel() -> f64 {
    0.05
}
fn default_lat() -> f64 {
    45.0
}
fn default_alt() -> f64 {
    50.0
}

/// A loosely-coupled GNSS/INS scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct GnssInsScenario {
    pub seed: u64,
    /// Horizontal-error alert threshold (m) for availability/holdover scoring.
    pub threshold_m: f64,
    pub time: TimeCfg,
    pub gnss: GnssTimeline,
    pub imu_quantum: ImuCfg,
    pub imu_classical: ImuCfg,
    /// GNSS fix cadence during nominal coverage (s).
    #[serde(default = "default_fix_interval")]
    pub fix_interval_s: f64,
    /// GNSS fix noise, 1-sigma: position (m) and velocity (m/s).
    #[serde(default = "default_sigma_pos")]
    pub sigma_pos_m: f64,
    #[serde(default = "default_sigma_vel")]
    pub sigma_vel_mps: f64,
    /// Tangent-plane origin (the trajectory starts here).
    #[serde(default = "default_lat")]
    pub lat_deg: f64,
    #[serde(default)]
    pub lon_deg: f64,
    #[serde(default = "default_alt")]
    pub alt_m: f64,
}

/// One IMU's fused run: spec, fused horizontal-error series, scored FoMs, and the
/// open-loop free-INS RMS over the outage for comparison.
#[derive(Clone, Debug, Serialize)]
pub struct FusedRun {
    pub spec: ModelSpec,
    pub series: Vec<PosSample>,
    pub fom: PositionFoM,
    /// Time-RMS horizontal error of the fused solution over the outage (m).
    pub fused_outage_rms_m: f64,
    /// Time-RMS horizontal error of the unaided free-running INS over the outage (m).
    pub free_outage_rms_m: f64,
}

/// Loosely-coupled GNSS/INS result artifact.
#[derive(Clone, Debug, Serialize)]
pub struct GnssInsResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub threshold_m: f64,
    pub quantum: FusedRun,
    pub classical: FusedRun,
}

/// Flat-Earth tangent-plane projection of `p` relative to `origin` (NED, m).
fn project(origin: Geodetic, p: Geodetic) -> Vec3 {
    let (rn, re) = radii_of_curvature(origin.lat_rad);
    let h = origin.alt_m;
    [
        (p.lat_rad - origin.lat_rad) * (rn + h),
        (p.lon_rad - origin.lon_rad) * (re + h) * origin.lat_rad.cos(),
        -(p.alt_m - origin.alt_m),
    ]
}

/// The driving command at time `t`: a forward specific-force square wave and a yaw
/// square wave on different periods, so the platform both accelerates and turns —
/// the changing heading and specific force are what give a loosely-coupled filter
/// purchase on the inertial errors.
fn drive_cmd(t: f64) -> (f64, f64) {
    let a_fwd = if ((t / 15.0) as i64) % 2 == 0 {
        1.5
    } else {
        -1.5
    };
    let yaw = if ((t / 10.0) as i64) % 2 == 0 {
        0.06
    } else {
        -0.06
    };
    (a_fwd, yaw)
}

/// The *true* IMU output for the driving profile at the current truth state: the
/// gyro that keeps the platform level on the rotating Earth plus the commanded
/// yaw, and the commanded forward specific force plus gravity support.
fn true_imu(truth: &NavState, t: f64) -> (Vec3, Vec3) {
    let ie = truth.omega_ie_n();
    let en = truth.omega_en_n();
    let omega_in = [ie[0] + en[0], ie[1] + en[1], ie[2] + en[2]];
    let omega_in_b = truth.q.conjugate().rotate(omega_in);
    let (a_fwd, yaw) = drive_cmd(t);
    let gyro = [omega_in_b[0], omega_in_b[1], omega_in_b[2] + yaw];
    let g = normal_gravity(truth.p_llh.lat_rad, truth.p_llh.alt_m);
    (gyro, [a_fwd, 0.0, -g])
}

/// A well-aligned loosely-coupled filter: tight (non-zero) attitude prior, modest
/// position/velocity prior, generous bias prior, low process noise. These are
/// filter-tuning constants, not scenario physics.
fn build_ekf(prior: Option<&FilterPriorCfg>) -> GnssInsEkf {
    let (sigma_accel_bias, sigma_gyro_bias) = prior
        .map_or((DEFAULT_SIGMA_ACCEL_BIAS, DEFAULT_SIGMA_GYRO_BIAS), |p| {
            (p.sigma_accel_bias, p.sigma_gyro_bias)
        });
    GnssInsEkf::new(
        5.0,
        0.5,
        1e-3,
        sigma_accel_bias,
        sigma_gyro_bias,
        EkfNoise {
            vrw_psd: 1e-5,
            arw_psd: 1e-10,
            accel_bias_rw_psd: 1e-12,
            gyro_bias_rw_psd: 1e-16,
            accel_bias_tau: f64::INFINITY,
            gyro_bias_tau: f64::INFINITY,
        },
    )
}

fn imu_spec(cfg: &ImuCfg) -> ModelSpec {
    ModelSpec {
        id: cfg.id.clone(),
        kind: "gnss-ins".into(),
        provenance: cfg.provenance.clone(),
        params: {
            let mut p = serde_json::json!({
                "accel_bias": cfg.accel_bias,
                "gyro_bias": cfg.gyro_bias,
            });
            if let Some(fp) = &cfg.filter_prior {
                p["filter_prior"] = serde_json::json!({
                    "sigma_accel_bias": fp.sigma_accel_bias,
                    "sigma_gyro_bias": fp.sigma_gyro_bias,
                });
            }
            p
        },
    }
}

fn hypot_ne(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2)).sqrt()
}

fn run_one(scn: &GnssInsScenario, cfg: &ImuCfg, seed: u64) -> FusedRun {
    let origin = Geodetic {
        lat_rad: scn.lat_deg.to_radians(),
        lon_rad: scn.lon_deg.to_radians(),
        alt_m: scn.alt_m,
    };
    let mut truth = NavState::new(Quaternion::identity(), [0.0; 3], origin);
    let mut free = NavState::new(Quaternion::identity(), [0.0; 3], origin);
    let mut nav = ClosedLoopInsGnss::new(
        NavState::new(Quaternion::identity(), [0.0; 3], origin),
        build_ekf(cfg.filter_prior.as_ref()),
    );

    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    // `Normal::new` (rand_distr 0.4) rejects only a non-finite std_dev; floor the
    // caller-supplied measurement sigmas (which may be `inf`/`nan`) to finite,
    // strictly-positive values before constructing the distributions.
    let finite_sigma = |sigma: f64| {
        if sigma.is_finite() {
            sigma.max(1e-9)
        } else {
            1e-9
        }
    };
    let np = Normal::new(0.0, finite_sigma(scn.sigma_pos_m))
        .expect("finite_sigma returns a finite, strictly-positive std_dev, which Normal::new always accepts");
    let nv = Normal::new(0.0, finite_sigma(scn.sigma_vel_mps))
        .expect("finite_sigma returns a finite, strictly-positive std_dev, which Normal::new always accepts");

    let error_model = cfg.build_error_model();
    let mut series = Vec::with_capacity(n + 1);
    let mut last_fix = f64::NEG_INFINITY;
    let (mut fused_sq, mut free_sq, mut out_n) = (0.0, 0.0, 0.0);

    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            let (gyro, accel_t) = true_imu(&truth, t);
            truth.step(gyro, accel_t, dt);
            // The sensor reports truth corrupted by its deterministic error chain:
            // the constant turn-on bias always, plus the systematic terms (scale,
            // misalignment, g-sensitivity, quantization, rate-ramp) when the
            // scenario's `[imu_*.error_model]` block supplies them.
            let (gyro_m, accel_m) = error_model.distort(gyro, accel_t, t);
            nav.propagate(gyro_m, accel_m, dt);
            free.step(gyro_m, accel_m, dt);
        }
        let gnss = scn.gnss.state_at(t);
        if gnss == GnssState::Nominal && t - last_fix >= scn.fix_interval_s - 0.5 * dt {
            let tp = project(origin, truth.p_llh);
            let gp = [
                tp[0] + np.sample(&mut rng),
                tp[1] + np.sample(&mut rng),
                tp[2] + np.sample(&mut rng),
            ];
            let gv = [
                truth.v_ned[0] + nv.sample(&mut rng),
                truth.v_ned[1] + nv.sample(&mut rng),
                truth.v_ned[2] + nv.sample(&mut rng),
            ];
            nav.fuse(gp, gv, scn.sigma_pos_m, scn.sigma_vel_mps);
            last_fix = t;
        }

        let te = project(origin, truth.p_llh);
        let fe = project(origin, nav.nav.p_llh);
        let xe = project(origin, free.p_llh);
        let fused_err = hypot_ne(fe, te);
        if gnss != GnssState::Nominal {
            fused_sq += fused_err * fused_err;
            free_sq += hypot_ne(xe, te).powi(2);
            out_n += 1.0;
        }
        series.push(PosSample {
            t,
            error_m: fused_err,
            gnss,
        });
    }

    let fom = score_position(&series, scn.threshold_m);
    let rms = |sq: f64| {
        if out_n > 0.0 {
            (sq / out_n).sqrt()
        } else {
            0.0
        }
    };
    FusedRun {
        spec: imu_spec(cfg),
        series,
        fom,
        fused_outage_rms_m: rms(fused_sq),
        free_outage_rms_m: rms(free_sq),
    }
}

impl GnssInsScenario {
    /// Reject a filter prior that cannot seed a covariance.
    pub fn validate(&self) -> Result<(), String> {
        for (slot, imu) in [
            ("imu_quantum", &self.imu_quantum),
            ("imu_classical", &self.imu_classical),
        ] {
            if let Some(p) = &imu.filter_prior {
                p.validate(slot)?;
            }
        }
        Ok(())
    }
}

/// Run the loosely-coupled GNSS/INS scenario for the quantum and classical IMUs.
pub fn run_gnss_ins(scn: &GnssInsScenario) -> GnssInsResult {
    let q_seed = scn.seed;
    let c_seed = scn.seed.wrapping_add(0x9e37_79b9_7f4a_7c15);
    GnssInsResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_gnss_ins(scn),
        seed: scn.seed,
        threshold_m: scn.threshold_m,
        quantum: run_one(scn, &scn.imu_quantum, q_seed),
        classical: run_one(scn, &scn.imu_classical, c_seed),
    }
}

fn hash_gnss_ins(scn: &GnssInsScenario) -> String {
    let c = serde_json::to_string(scn).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Render the fused horizontal-error series (quantum vs classical) as an SVG.
pub fn to_svg(result: &GnssInsResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (80.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let c = &result.classical.series;
    let q = &result.quantum.series;
    let t_max = c.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    let mut y_max = result.threshold_m * 1.3;
    for s in c.iter().chain(q.iter()) {
        y_max = y_max.max(s.error_m.abs());
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |e: f64| mt + ph - (e.min(y_max) / y_max) * ph;
    let points = |series: &[PosSample]| {
        series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.error_m.abs())))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(result.threshold_m);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!("<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Loosely-coupled GNSS/INS horizontal error</text>"));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "horizontal error (m)",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>", ml + pw));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">spec {:.0} m</text>",
        ml + 4.0,
        thr_y - 4.0,
        result.threshold_m
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        points(c)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\" points=\"{}\"/>",
        points(q)
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scenario() -> GnssInsScenario {
        // 100 s aided then a 60 s outage, fixes once a second.
        let gnss = GnssTimeline {
            windows: vec![
                crate::scenario::GnssWindow {
                    t0: 0.0,
                    t1: 100.0,
                    state: GnssState::Nominal,
                },
                crate::scenario::GnssWindow {
                    t0: 100.0,
                    t1: 160.0,
                    state: GnssState::Denied,
                },
            ],
        };
        GnssInsScenario {
            seed: 7,
            threshold_m: 50.0,
            time: TimeCfg {
                step_s: 0.1,
                duration_s: 160.0,
            },
            gnss,
            imu_quantum: ImuCfg {
                id: "quantum-imu".into(),
                provenance: "navigation-grade".into(),
                accel_bias: [0.015, 0.0, 0.0],
                gyro_bias: [0.0, 0.0, 5e-5],
                error_model: None,
                filter_prior: None,
            },
            imu_classical: ImuCfg {
                id: "classical-imu".into(),
                provenance: "tactical-grade".into(),
                accel_bias: [0.03, -0.02, 0.0],
                gyro_bias: [0.0, 0.0, 1e-4],
                error_model: None,
                filter_prior: None,
            },
            fix_interval_s: 1.0,
            sigma_pos_m: 1.0,
            sigma_vel_mps: 0.05,
            lat_deg: 45.0,
            lon_deg: -57.3,
            alt_m: 50.0,
        }
    }

    #[test]
    fn fused_navigator_beats_free_inertial_over_the_outage() {
        let r = run_gnss_ins(&scenario());
        // The free-running INS genuinely diverges across the arc + 60 s outage.
        assert!(
            r.classical.free_outage_rms_m > 100.0,
            "free INS RMS only {} m",
            r.classical.free_outage_rms_m
        );
        // The fused navigator coasts far better than the free INS.
        assert!(
            r.classical.fused_outage_rms_m < r.classical.free_outage_rms_m / 2.0,
            "fused {} m should beat free {} m by >2x",
            r.classical.fused_outage_rms_m,
            r.classical.free_outage_rms_m
        );
    }

    #[test]
    fn lower_bias_sensor_coasts_better_unaided_and_fusion_never_hurts() {
        let r = run_gnss_ins(&scenario());
        // A lower-bias (quantum-grade) sensor dead-reckons better when unaided.
        assert!(
            r.quantum.free_outage_rms_m < r.classical.free_outage_rms_m,
            "quantum free coast {} m should beat classical {} m",
            r.quantum.free_outage_rms_m,
            r.classical.free_outage_rms_m
        );
        // Fusion bounds the error at least as well as free-running for both sensors
        // (the fused outage error is floor-limited by hand-over attitude error, so
        // we do NOT claim it scales with bias — see the module docs).
        assert!(
            r.quantum.fused_outage_rms_m <= r.quantum.free_outage_rms_m,
            "fusion should not hurt the quantum sensor: {} vs {}",
            r.quantum.fused_outage_rms_m,
            r.quantum.free_outage_rms_m
        );
        assert!(
            r.classical.fused_outage_rms_m <= r.classical.free_outage_rms_m,
            "fusion should not hurt the classical sensor: {} vs {}",
            r.classical.fused_outage_rms_m,
            r.classical.free_outage_rms_m
        );
    }

    #[test]
    fn toml_error_model_flows_through_the_pack_and_drives_navigation_error() {
        // A clean baseline: a perfect (bias-free, error-free) classical IMU. With
        // measured == true the free-running INS receives exactly the truth inputs,
        // so it tracks truth and its outage coast error is ~0. (We deliberately do
        // NOT layer the schema on top of an existing bias and assert "worse": the
        // 2-D free-coast RMS is not monotonic in |gyro error| — an added term can
        // partially cancel a bias through the maneuver geometry, exactly the weak
        // separability the module docs warn about. A zero-error baseline makes the
        // effect monotonic and hand-derivable.)
        let mut clean = scenario();
        clean.imu_classical.accel_bias = [0.0; 3];
        clean.imu_classical.gyro_bias = [0.0; 3];
        clean.imu_classical.error_model = None;
        let base = run_gnss_ins(&clean);
        assert!(
            base.classical.free_outage_rms_m < 1e-6,
            "a perfect IMU should track truth exactly: {} m",
            base.classical.free_outage_rms_m
        );

        // Same perfect IMU, but now an east-axis gyro rate-ramp is supplied through
        // the TOML `[imu_classical.error_model]` schema. A growing horizontal gyro
        // error tilts the platform, leaking gravity into the horizontal channel — a
        // textbook INS divergence that must show up as a large free-coast error,
        // proving the schema reaches the three-axis mechanization (not a dead field).
        let mut ramped = clean.clone();
        ramped.imu_classical.error_model = Some(ImuErrorCfg {
            rate_ramp_gyro: [0.0, 1e-5, 0.0],
            ..Default::default()
        });
        let worse = run_gnss_ins(&ramped);
        assert!(
            worse.classical.free_outage_rms_m > 1.0,
            "an east-gyro ramp should drive a large coast error: {} m",
            worse.classical.free_outage_rms_m
        );

        // The quantum IMU was left untouched, so its run is bit-identical between
        // the two — confirming the error model is applied per-sensor, not globally.
        assert_eq!(
            base.quantum.free_outage_rms_m,
            worse.quantum.free_outage_rms_m
        );
    }

    #[test]
    fn absent_error_model_is_identical_to_pure_constant_bias() {
        // The error_model schema is purely additive: with no `[error_model]` block
        // the pack output must be byte-identical to the historical bias-only path.
        let with_none = serde_json::to_string(&run_gnss_ins(&scenario())).unwrap();
        let mut explicit_ideal = scenario();
        explicit_ideal.imu_quantum.error_model = Some(ImuErrorCfg::default());
        explicit_ideal.imu_classical.error_model = Some(ImuErrorCfg::default());
        // An all-zero error model is the transparent pass-through, so the FoMs and
        // error series match the bias-only run exactly (the scenario_hash differs
        // because the serialized scenario carries the explicit block).
        let a = run_gnss_ins(&scenario());
        let b = run_gnss_ins(&explicit_ideal);
        assert_eq!(a.quantum.fused_outage_rms_m, b.quantum.fused_outage_rms_m);
        assert_eq!(a.classical.free_outage_rms_m, b.classical.free_outage_rms_m);
        assert_eq!(a.quantum.fom.pos_rms_m, b.quantum.fom.pos_rms_m);
        // And the no-block run is deterministic across calls.
        let again = serde_json::to_string(&run_gnss_ins(&scenario())).unwrap();
        assert_eq!(with_none, again);
    }

    #[test]
    fn fom_is_scored_and_run_is_reproducible() {
        let r = run_gnss_ins(&scenario());
        // A real FoM comes out: availability is in range, the outage RMS positive,
        // and the platform holds under the 50 m alert limit for a while into the gap.
        assert!(r.quantum.fom.availability > 0.0 && r.quantum.fom.availability <= 1.0);
        assert!(
            r.quantum.fom.pos_rms_m > 0.0,
            "outage RMS should be positive"
        );
        assert!(
            r.quantum.fom.holdover_s > 0.0,
            "should hold under spec for a while"
        );
        // Fully deterministic.
        let a = serde_json::to_string(&run_gnss_ins(&scenario())).unwrap();
        let b = serde_json::to_string(&run_gnss_ins(&scenario())).unwrap();
        assert_eq!(a, b);
    }
}
