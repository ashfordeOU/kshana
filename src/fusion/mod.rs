// SPDX-License-Identifier: AGPL-3.0-only
//! Joint Kalman sensor-fusion estimator.
//!
//! The hybrid pack *composes* independent holdover/dead-reckoning predictors; this
//! pack runs a single recursive estimator that **is** the navigation solution. A
//! joint Kalman filter over the clock state `[phase, frequency]` and the position
//! state `[position, velocity]` is disciplined by GNSS while it is available
//! (learning the clock frequency offset and the platform velocity), then coasts
//! through the outage propagating those estimates; optical time transfer can aid
//! the clock block during the gap. The delivered error is the filter's estimate
//! residual against truth, and the filter's joint covariance gives a joint
//! integrity bound.
//!
//! For a static platform observed by a *separate* position fix and time fix the
//! clock-error and position-error states are dynamically independent and observed
//! independently, so the optimal estimator is block-diagonal — each block is a
//! two-state Kalman filter ([`KalmanClock`] is reused for both, with `q_va` driving
//! velocity in the position block, whose coast variance `q_va*T^3/3` is exactly the
//! Groves velocity-random-walk position variance). The value over open-loop
//! composition is a single consistent estimator with a joint covariance, and a
//! clean substrate for cross-aiding. Estimating constant sensor biases with an
//! augmented state is future work; this demo uses noise-driven sensors so the
//! filter process noise is consistent with truth.
//!
//! When the measurements are **pseudoranges** rather than separate position/time
//! fixes, the position and clock are no longer independently observed and the
//! optimal filter carries non-zero cross-block covariance. That genuinely coupled
//! estimator is [`coupled::CoupledPntFilter`] — a single stacked
//! `[pos, vel, phase, freq]` state whose pseudorange update couples the blocks, so a
//! clock-only fix also sharpens the position (validated in that module).

pub mod closed_loop;
pub mod coupled;
pub mod gnss_ins_ekf;
pub mod hybrid_ukf;
pub mod pack;
pub mod tightly_coupled;
pub mod tightly_coupled17;
pub mod ukf;

use crate::hybrid::{score_hybrid, HybridResult, HybridSample, HybridScenario, SuiteRun};
use crate::inertial::{AccelCfg, AccelModel};
use crate::kalman::KalmanClock;
use crate::models::{ClockModel, ErrorModel};
use crate::run::{PHASE_MEAS_VAR_S2, PROTECTION_K};
use crate::scenario::{ClockCfg, GnssState};
use crate::security::{spoof_detection_score, SPOOF_DETECT_K, SPOOF_MONITOR_S};
use crate::timetransfer::TimeTransferLink;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use sha2::{Digest, Sha256};

/// GNSS position-measurement noise variance (m^2): a ~1 m, 1-sigma fix while
/// nominal, setting the position covariance floor for the filter.
const POS_MEAS_VAR_M2: f64 = 1.0;
/// Initial frequency-offset variance (1/s)^2: the filter starts ignorant of the
/// clock's frequency offset and learns it from GNSS (covers offsets up to ~1e-9).
const INIT_FREQ_VAR: f64 = 1e-18;
/// Initial velocity-error variance (m/s)^2: the filter starts ignorant of the
/// platform velocity error and learns it from GNSS.
const INIT_VEL_VAR: f64 = 1.0;

/// Unit and provenance class for every numeric field the `fusion` report emits.
///
/// The pack reuses [`HybridResult`] as its document type, so the paths and units are
/// those of [`crate::hybrid::UNITS`]; the definitions are not. Here the reported
/// error is the *joint filter's estimate residual* against truth rather than an
/// open-loop predictor's residual, and `integrity` is the containment of the joint
/// (timing **and** position) bound rather than the timing channel alone. The table is
/// therefore stated separately rather than re-exported.
///
/// `quantum` and `classical` are the same [`SuiteRun`] shape, so every column is
/// stated once and carried under both roots. The `clock_spec.params` rows follow
/// [`crate::models::ClockModel`] (`q_wf` in `s^2/s`, `q_rw` in `1/s`) and the
/// `accel_spec.params` rows [`crate::inertial::AccelModel`] (`q_va` in
/// `(m/s^2)^2/Hz`, `q_aa` in `(m/s^2)^2/s`, `q_arw` in `(rad/s)^2/Hz`); in both cases
/// the intensity is the variance the driven state gains per second of propagation.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    macro_rules! fusion_units {
        ($($s:literal),+ $(,)?) => {
            &[
                FieldUnit {
                    path: "seed",
                    unit: "1",
                    provenance: Input,
                    definition: "RNG seed of the quantum suite; the classical suite runs at \
                                 seed + 0x9e3779b97f4a7c15",
                },
                FieldUnit {
                    path: "timing_spec_ns",
                    unit: "ns",
                    provenance: Input,
                    definition: "timing spec: a sample whose absolute timing error is at or \
                                 below this is in spec",
                },
                FieldUnit {
                    path: "position_spec_m",
                    unit: "m",
                    provenance: Input,
                    definition: "position spec: a sample whose absolute position error is \
                                 at or below this is in spec",
                },
                $(
                FieldUnit {
                    path: concat!($s, ".clock_spec.params.y0"),
                    unit: "1",
                    provenance: Input,
                    definition: "deterministic fractional-frequency offset of the truth \
                                 clock model (dimensionless df/f)",
                },
                FieldUnit {
                    path: concat!($s, ".clock_spec.params.q_wf"),
                    unit: "s^2/s",
                    provenance: Input,
                    definition: "white-FM process-noise intensity of the truth clock, and \
                                 of the filter's clock block: the phase gains variance \
                                 q_wf*dt over a step dt, so q_wf is numerically \
                                 sigma_y(1 s)^2",
                },
                FieldUnit {
                    path: concat!($s, ".clock_spec.params.q_rw"),
                    unit: "1/s",
                    provenance: Input,
                    definition: "random-walk-FM process-noise intensity of the truth clock, \
                                 and of the filter's clock block: the fractional frequency \
                                 gains variance q_rw*dt over a step dt",
                },
                FieldUnit {
                    path: concat!($s, ".clock_spec.params.drift"),
                    unit: "1/s",
                    provenance: Input,
                    definition: "linear fractional-frequency aging rate: the deterministic \
                                 frequency is y0 + drift*t",
                },
                FieldUnit {
                    path: concat!($s, ".clock_spec.params.flicker_floor"),
                    unit: "1",
                    provenance: Input,
                    definition: "flat flicker-FM Allan-deviation floor sigma_y of the truth \
                                 clock model; null when no flicker component is configured",
                },
                FieldUnit {
                    path: concat!($s, ".accel_spec.params.bias"),
                    unit: "m/s^2",
                    provenance: Input,
                    definition: "residual (post-GNSS-calibration) accelerometer bias of the \
                                 truth sensor; this pack's filter does not estimate a \
                                 constant bias state, so the demo scenario drives the \
                                 sensor with noise rather than a bias",
                },
                FieldUnit {
                    path: concat!($s, ".accel_spec.params.q_va"),
                    unit: "(m/s^2)^2/Hz",
                    provenance: Input,
                    definition: "white acceleration noise PSD driving velocity random walk \
                                 (velocity gains variance q_va*dt per step); it also drives \
                                 the velocity state of the filter's position block, whose \
                                 coast variance is q_va*T^3/3",
                },
                FieldUnit {
                    path: concat!($s, ".accel_spec.params.q_aa"),
                    unit: "(m/s^2)^2/s",
                    provenance: Input,
                    definition: "acceleration-random-walk (rate-random-walk) PSD of the \
                                 truth sensor: its bias gains variance q_aa*dt per step",
                },
                FieldUnit {
                    path: concat!($s, ".accel_spec.params.gyro_bias"),
                    unit: "rad/s",
                    provenance: Input,
                    definition: "residual gyro bias of the truth sensor; the tilt error it \
                                 accumulates couples gravity into a g*theta specific-force \
                                 error",
                },
                FieldUnit {
                    path: concat!($s, ".accel_spec.params.q_arw"),
                    unit: "(rad/s)^2/Hz",
                    provenance: Input,
                    definition: "angular-random-walk PSD of the truth sensor: the attitude \
                                 (tilt) error gains variance q_arw*dt per step",
                },
                FieldUnit {
                    path: concat!($s, ".series[].t"),
                    unit: "s",
                    provenance: Computed,
                    definition: "sample time on the uniform run grid, i*time.step_s",
                },
                FieldUnit {
                    path: concat!($s, ".series[].timing_ns"),
                    unit: "ns",
                    provenance: Computed,
                    definition: "timing error at t: the truth clock phase minus the joint \
                                 filter's phase estimate — the delivered solution is the \
                                 filter's, so this residual is reported at every sample, \
                                 including while GNSS disciplines the filter",
                },
                FieldUnit {
                    path: concat!($s, ".series[].position_m"),
                    unit: "m",
                    provenance: Computed,
                    definition: "single-axis (1-DOF) position error at t: the dead-reckoned \
                                 truth position minus the joint filter's position estimate, \
                                 reported at every sample",
                },
                FieldUnit {
                    path: concat!($s, ".fom.timing_holdover_s"),
                    unit: "s",
                    provenance: Computed,
                    definition: "worst-case (shortest) coast before the timing error leaves \
                                 timing_spec_ns, across the outage segments; grid-bounded \
                                 at time.step_s",
                },
                FieldUnit {
                    path: concat!($s, ".fom.position_holdover_s"),
                    unit: "s",
                    provenance: Computed,
                    definition: "worst-case (shortest) coast before the position error \
                                 leaves position_spec_m, across the outage segments; \
                                 grid-bounded at time.step_s",
                },
                FieldUnit {
                    path: concat!($s, ".fom.pnt_holdover_s"),
                    unit: "s",
                    provenance: Computed,
                    definition: "worst-case (shortest) coast before either channel leaves \
                                 its spec, across the outage segments; grid-bounded at \
                                 time.step_s",
                },
                FieldUnit {
                    path: concat!($s, ".fom.timing_p95_ns"),
                    unit: "ns",
                    provenance: Computed,
                    definition: "95th percentile (nearest-rank) of the absolute timing \
                                 error over the outage samples",
                },
                FieldUnit {
                    path: concat!($s, ".fom.position_p95_m"),
                    unit: "m",
                    provenance: Computed,
                    definition: "95th percentile (nearest-rank) of the absolute position \
                                 error over the outage samples",
                },
                FieldUnit {
                    path: concat!($s, ".fom.pnt_availability"),
                    unit: "1",
                    provenance: Computed,
                    definition: "fraction of all samples in the run with both the timing \
                                 and the position error inside their specs",
                },
                FieldUnit {
                    path: concat!($s, ".fom.integrity"),
                    unit: "1",
                    provenance: Computed,
                    definition: "joint-filter self-consistency: the fraction of outage \
                                 samples where the timing error stays inside the 3-sigma \
                                 phase bound (widened by the re-sync link variance when \
                                 re-sync is enabled) and the position error inside the \
                                 3-sigma position bound; not an aviation HPL/VPL/RAIM \
                                 integrity figure",
                },
                FieldUnit {
                    path: concat!($s, ".fom.security"),
                    unit: "1",
                    provenance: Computed,
                    definition: "analytic spoof-detectability bound from clock stability, \
                                 clamp(1 - smallest detectable offset / timing_spec_ns, 0, \
                                 1); meaningful only against a configured attack, and not \
                                 a multi-satellite RAIM detector",
                },
                )+
            ]
        };
    }
    fusion_units!("quantum", "classical")
};

fn run_fused_suite(
    scn: &HybridScenario,
    clock_cfg: &ClockCfg,
    accel_cfg: &AccelCfg,
    seed: u64,
) -> SuiteRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    // Truth sensors (their accumulated error is what the filter estimates).
    let mut clock = ClockModel::new(
        &clock_cfg.id,
        &clock_cfg.provenance,
        clock_cfg.y0,
        clock_cfg.q_wf,
        clock_cfg.q_rw,
    )
    .with_drift(clock_cfg.drift)
    .with_flicker(clock_cfg.flicker_floor);
    let mut accel = AccelModel::new(
        &accel_cfg.id,
        &accel_cfg.provenance,
        accel_cfg.bias,
        accel_cfg.q_va,
    )
    .with_gyro(accel_cfg.gyro_bias, accel_cfg.q_arw)
    .with_accel_random_walk(accel_cfg.q_aa)
    .with_bias_instability(accel_cfg.bias_instability);

    // Joint filter: clock block [phase, freq] and position block [pos, vel].
    let mut clock_kf = KalmanClock::new(clock_cfg.q_wf, clock_cfg.q_rw, PHASE_MEAS_VAR_S2)
        .with_initial_cov(PHASE_MEAS_VAR_S2, INIT_FREQ_VAR);
    let mut pos_kf = KalmanClock::new(0.0, accel_cfg.q_va.max(1e-30), POS_MEAS_VAR_M2)
        .with_initial_cov(POS_MEAS_VAR_M2, INIT_VEL_VAR);
    let link = if scn.resync.enabled {
        Some(TimeTransferLink::new(
            "optical-isl",
            "time-transfer clock-aiding",
            scn.resync.sigma_j_s,
        ))
    } else {
        None
    };
    let resync_var = scn.resync.sigma_j_s * scn.resync.sigma_j_s;

    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    let mut last_resync = 0.0;
    let (mut outage, mut contained) = (0u64, 0u64);

    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            clock.step(dt, &mut rng);
            accel.step(dt, &mut rng);
            clock_kf.predict(dt);
            pos_kf.predict(dt);
        }
        let gnss = scn.gnss.state_at(t);
        // Open-loop truth errors: the clock's accumulated phase and the
        // dead-reckoned position. The filter, not a re-sync, does the correcting.
        let truth_phase = clock.phase();
        let truth_pos = accel.pos();

        match gnss {
            GnssState::Nominal => {
                // GNSS observes the truth time and position directly.
                clock_kf.update(truth_phase);
                pos_kf.update(truth_pos);
                last_resync = t;
            }
            _ => {
                if let Some(link) = &link {
                    if t - last_resync >= scn.resync.interval_s {
                        // Optical ISL: a noisy measurement of the truth time.
                        clock_kf.update_with_r(truth_phase + link.sample(&mut rng), resync_var);
                        last_resync = t;
                    }
                }
                let timing_s = truth_phase - clock_kf.phase_est();
                let position_m = truth_pos - pos_kf.phase_est();
                outage += 1;
                let phase_bound = PROTECTION_K
                    * (clock_kf.phase_var() + if link.is_some() { resync_var } else { 0.0 }).sqrt();
                let pos_bound = PROTECTION_K * pos_kf.phase_sigma();
                if timing_s.abs() <= phase_bound && position_m.abs() <= pos_bound {
                    contained += 1;
                }
            }
        }
        // Delivered solution = filter estimate; reported error = estimate residual.
        let timing_ns = (truth_phase - clock_kf.phase_est()) * 1e9;
        let position_m = truth_pos - pos_kf.phase_est();
        series.push(HybridSample {
            t,
            timing_ns,
            position_m,
            gnss,
        });
    }

    let mut fom = score_hybrid(&series, scn.timing_spec_ns, scn.position_spec_m);
    if outage > 0 {
        fom.integrity = Some(contained as f64 / outage as f64);
    }
    fom.security = Some(spoof_detection_score(
        clock_cfg.q_wf,
        clock_cfg.q_rw,
        PHASE_MEAS_VAR_S2,
        scn.timing_spec_ns,
        SPOOF_MONITOR_S,
        dt,
        SPOOF_DETECT_K,
    ));
    SuiteRun {
        clock_spec: clock.spec(),
        accel_spec: accel.spec(),
        series,
        fom,
    }
}

fn hash_fusion(scn: &HybridScenario) -> String {
    let c = serde_json::to_string(scn).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Run the joint-fusion PNT scenario for the all-quantum and all-classical suites.
pub fn run_fusion(scn: &HybridScenario) -> HybridResult {
    HybridResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_fusion(scn),
        seed: scn.seed,
        timing_spec_ns: scn.timing_spec_ns,
        position_spec_m: scn.position_spec_m,
        quantum: run_fused_suite(scn, &scn.clock_quantum, &scn.accel_quantum, scn.seed),
        classical: run_fused_suite(
            scn,
            &scn.clock_classical,
            &scn.accel_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scenario() -> HybridScenario {
        toml::from_str(include_str!("../../scenarios/fusion-pnt.toml"))
            .expect("fusion scenario parses")
    }

    #[test]
    fn quantum_suite_holds_pnt_longer() {
        let r = run_fusion(&scenario());
        assert!(r.quantum.fom.pnt_holdover_s >= r.classical.fom.pnt_holdover_s);
        assert!(r.quantum.fom.timing_p95_ns <= r.classical.fom.timing_p95_ns);
    }

    #[test]
    fn joint_integrity_is_populated_and_reliable() {
        // With noise-consistent sensors the joint covariance should contain the
        // actual joint error on the large majority of outage samples.
        let r = run_fusion(&scenario());
        for suite in [&r.quantum, &r.classical] {
            let integ = suite.fom.integrity.expect("joint integrity populated");
            assert!((0.9..=1.0).contains(&integ), "integrity {integ}");
            assert!(suite.fom.security.is_some());
        }
    }

    #[test]
    fn filter_tracks_truth_while_nominal() {
        // During the GNSS-nominal lead-in the filter is disciplined to truth, so
        // the delivered error is essentially zero.
        let r = run_fusion(&scenario());
        let early = &r.quantum.series[1];
        assert!(early.gnss == GnssState::Nominal);
        assert!(early.timing_ns.abs() < 1e-3, "timing {}", early.timing_ns);
        // Position is only resolved to the GNSS noise (~1 m), well inside the spec.
        assert!(
            early.position_m.abs() < 1.0,
            "position {}",
            early.position_m
        );
    }

    #[test]
    fn fusion_is_reproducible() {
        let a = run_fusion(&scenario());
        let b = run_fusion(&scenario());
        assert_eq!(a.quantum.fom.pnt_holdover_s, b.quantum.fom.pnt_holdover_s);
        assert_eq!(a.classical.fom.timing_p95_ns, b.classical.fom.timing_p95_ns);
    }
}
