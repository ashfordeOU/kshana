// SPDX-License-Identifier: AGPL-3.0-only
//! **Layer-2 cross-sensor integrity sizing: minimum detectable spoof walk.**
//!
//! A GNSS-referenced navigator whose signals-in-space have been captured can be
//! walked off truth slowly enough that no self-consistency flag on the GNSS
//! solution ever trips — the spoofer pulls position (or clock) at a chosen
//! walk-rate and the receiver reports green. The residual defence is a
//! *cross-sensor* check against a second, physically independent navigation
//! source that the spoofer cannot touch: a free-inertial IMU coast and an
//! absolute terrain-relative-navigation (TRN) fix. This module turns that
//! "an IMU + TRN cross-check catches the residual capture" assertion into a
//! **sized bound**: the minimum spoof-induced walk-RATE (m/s of position drift,
//! or s/s of clock drift) that the cross-check can detect at a stated
//! false-alarm / detection-power operating point. It is the lunar, position-domain
//! instance of the timing-domain cross-check already sized by [`crate::tpl`].
//!
//! **How it is built.** Over a comparison window of length `T`, a spoof walking
//! the GNSS solution at rate `v` separates it from the independent IMU+TRN
//! cross-check by a mean residual `mu = v*T`, while the cross-check's own noise is
//! fixed. Detection is the two-sided energy test of [`crate::detection`]. The
//! minimum detectable mean residual for a target `(P_fa, P_d)` is the closed form
//! `mu_min = sigma*(Phi^-1(1 - P_fa/2) + Phi^-1(P_d))`
//! ([`crate::detection::detection_boundary`] plus the power margin), so the
//! minimum detectable walk-rate is `v_min = mu_min / T`. The cross-check noise
//! `sigma` is the RSS of the IMU free-inertial coast 1-sigma over `T`
//! (accel bias-instability and velocity-random-walk terms, Groves 2013 §5.7 /
//! IEEE Std 952-1997) and the TRN horizontal fix 1-sigma
//! ([`crate::altpnt::terrain`] supplies the fix noise a real DEM match produces).
//! The clock-walk instance composes the identical machinery already validated in
//! [`crate::tpl`] / [`crate::security::min_detectable_offset_ns`].
//!
//! **Validated vs Modelled.** *Validated:* the bound relationship. `v_min`
//! computed here reproduces the [`crate::detection`] closed form exactly — at
//! `v_min` over `T` the analytic detection power equals the requested `P_d` — and
//! it scales monotonically the right way (a noisier IMU/TRN pair raises the
//! minimum detectable walk, i.e. degrades protection). The IMU noise oracle is
//! published datasheet-class specs (a navigation-grade Honeywell HG9900:
//! accelerometer bias-instability ~25 µg = 2.45e-4 m/s^2, velocity random walk
//! ~8e-5 m/s/sqrt(s); versus a tactical-grade MEMS class ~1 mg accel bias,
//! ~1.7e-3 m/s/sqrt(s) VRW). The clock instance reproduces
//! [`crate::security::min_detectable_offset_ns`] exactly. *Modelled:* the specific
//! lunar-scenario numbers (coast window, TRN fix noise, chosen operating point)
//! are engineering assumptions, not a validated end-to-end field result; the
//! short-term coast model keeps only the two dominant error terms and omits
//! gravity-model and initial-tilt coupling. Deterministic: closed forms only, no
//! wall-clock, no RNG.

use crate::detection::{detection_boundary, normal_inv_cdf};
use crate::tpl::TplInputs;
use serde::Serialize;

/// Standard gravity (m/s^2), used only to convert datasheet µg / mg specs into SI.
const G0: f64 = 9.806_65;

/// The independent cross-sensor noise budget: the IMU free-inertial coast error
/// growth (accel bias-instability and velocity random walk) plus the TRN
/// absolute-fix noise. All fields are SI 1-sigma quantities.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct CrossSensorNoise {
    /// Accelerometer bias instability, 1-sigma (m/s^2).
    pub accel_bias: f64,
    /// Velocity random walk (m/s per sqrt(s)); i.e. accelerometer white-noise
    /// density integrated once to velocity.
    pub vrw: f64,
    /// TRN horizontal position-fix 1-sigma (m) — the residual of a DEM match.
    pub trn_fix_sigma: f64,
}

impl CrossSensorNoise {
    /// Navigation-grade IMU oracle class (Honeywell HG9900 datasheet class):
    /// accelerometer bias instability ~25 µg, velocity random walk ~8e-5
    /// m/s/sqrt(s). Paired here with a caller-supplied TRN fix (e.g. a
    /// moderate-relief lunar DEM match; Modelled). Use this as the "good sensors"
    /// reference.
    pub fn honeywell_hg9900(trn_fix_sigma: f64) -> Self {
        Self {
            accel_bias: 25e-6 * G0, // 25 µg -> 2.45e-4 m/s^2
            vrw: 8e-5,              // ~8 µg/sqrt(Hz) accel noise density
            trn_fix_sigma,
        }
    }

    /// Tactical-grade MEMS IMU oracle class (e.g. an ADIS16490 / HG4930 class):
    /// accelerometer bias instability ~1 mg, velocity random walk ~1.7e-3
    /// m/s/sqrt(s). Strictly noisier than [`Self::honeywell_hg9900`] on both
    /// inertial terms, so it must yield a strictly larger minimum detectable walk.
    pub fn tactical_mems(trn_fix_sigma: f64) -> Self {
        Self {
            accel_bias: 1e-3 * G0, // 1 mg -> 9.8e-3 m/s^2
            vrw: 1.7e-3,
            trn_fix_sigma,
        }
    }

    /// IMU free-inertial horizontal-position 1-sigma (m) after a coast of
    /// `coast_s` seconds, keeping the two dominant short-term terms
    /// (Groves 2013 §5.7; IEEE Std 952-1997): a bias-instability contribution
    /// `0.5*b_a*T^2` (double-integrated constant accel bias) RSS'd with a
    /// velocity-random-walk contribution `vrw*sqrt(T^3/3)` (integrated white
    /// acceleration noise). Monotone increasing in `coast_s` and in either spec.
    pub fn imu_coast_sigma_m(&self, coast_s: f64) -> f64 {
        let t = coast_s.max(0.0);
        let bias_term = 0.5 * self.accel_bias * t * t;
        let vrw_var = self.vrw * self.vrw * t.powi(3) / 3.0;
        (bias_term * bias_term + vrw_var).sqrt()
    }

    /// Total cross-sensor residual 1-sigma (m): the RSS of the IMU coast noise
    /// over `coast_s` and the (coast-independent) TRN fix noise. This is the
    /// `sigma` the detector operates against.
    pub fn cross_sensor_sigma_m(&self, coast_s: f64) -> f64 {
        let imu = self.imu_coast_sigma_m(coast_s);
        (imu * imu + self.trn_fix_sigma * self.trn_fix_sigma).sqrt()
    }
}

/// Detector operating point: target false-alarm probability `p_fa` (two-sided)
/// and target detection power `p_d`, both in `(0, 1)`.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct DetectorCfg {
    pub p_fa: f64,
    pub p_d: f64,
}

impl DetectorCfg {
    /// A conventional integrity operating point: `P_fa = 1e-3`, `P_d = 0.999`.
    pub fn nominal() -> Self {
        Self {
            p_fa: 1e-3,
            p_d: 0.999,
        }
    }
}

/// Minimum detectable mean cross-sensor residual (same units as `sigma`) for a
/// noise 1-sigma `sigma` at the operating point `cfg`: the two-sided detection
/// boundary `gamma = sigma*Phi^-1(1 - P_fa/2)` plus the power margin
/// `sigma*Phi^-1(P_d)` needed to reach `P_d`. By construction the two-sided
/// [`crate::detection::analytic_pd`] evaluated at this residual returns `P_d` (to
/// the far-tail approximation), which is the Validated oracle.
pub fn min_detectable_residual(sigma: f64, cfg: &DetectorCfg) -> f64 {
    let gamma = detection_boundary(sigma, cfg.p_fa);
    gamma + sigma * normal_inv_cdf(cfg.p_d)
}

/// The sized cross-sensor bound for a position-domain spoof walk.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct PositionWalkBound {
    /// Comparison window over which the walk accumulates against the cross-check (s).
    pub coast_s: f64,
    /// Cross-sensor residual noise 1-sigma at that window (m).
    pub cross_sensor_sigma_m: f64,
    /// Minimum detectable accumulated residual (m) at the operating point.
    pub min_detectable_residual_m: f64,
    /// Minimum detectable spoof position walk-RATE (m/s).
    pub min_detectable_walk_rate_mps: f64,
}

/// Size the Layer-2 cross-check against a **position** spoof walk: given the
/// independent IMU+TRN noise, the comparison window `coast_s`, and the detector
/// operating point, return the minimum spoof position walk-rate (m/s) whose
/// accumulated residual `v*coast_s` is detectable at `(P_fa, P_d)`.
pub fn min_detectable_position_walk(
    noise: &CrossSensorNoise,
    coast_s: f64,
    cfg: &DetectorCfg,
) -> PositionWalkBound {
    let t = coast_s.max(f64::MIN_POSITIVE);
    let sigma = noise.cross_sensor_sigma_m(coast_s);
    let mu_min = min_detectable_residual(sigma, cfg);
    PositionWalkBound {
        coast_s,
        cross_sensor_sigma_m: sigma,
        min_detectable_residual_m: mu_min,
        min_detectable_walk_rate_mps: mu_min / t,
    }
}

/// The accumulated cross-sensor residual (m) a position spoof of walk-rate
/// `walk_rate_mps` produces over the window `coast_s` — the mean shift the
/// detector sees. Trivially linear (`residual = v*T`); exposed so callers can
/// plot the residual-vs-walk relationship the bound inverts.
pub fn residual_for_walk(walk_rate_mps: f64, coast_s: f64) -> f64 {
    walk_rate_mps * coast_s
}

/// Whether a position spoof at `walk_rate_mps` is detectable by the sized
/// Layer-2 cross-check at `(P_fa, P_d)`: true iff the walk-rate meets or exceeds
/// the minimum detectable walk.
pub fn walk_is_detectable(
    noise: &CrossSensorNoise,
    coast_s: f64,
    cfg: &DetectorCfg,
    walk_rate_mps: f64,
) -> bool {
    walk_rate_mps >= min_detectable_position_walk(noise, coast_s, cfg).min_detectable_walk_rate_mps
}

/// Size the Layer-2 cross-check against a **clock** spoof walk, composing the
/// already-validated timing bound: the minimum detectable clock offset is the
/// static monitor floor [`crate::security::min_detectable_offset_ns`] (the largest
/// offset a spoof holds below the `k`-sigma alarm), so the minimum detectable
/// clock walk-RATE (s/s, dimensionless frequency error) is that floor spread over
/// the detection latency `detection_latency_s`. This reuses the identical closed
/// form validated in [`crate::tpl`]; it is the timing sibling of
/// [`min_detectable_position_walk`].
pub fn min_detectable_clock_walk_rate_ss(inp: &TplInputs) -> f64 {
    let floor_s = crate::security::min_detectable_offset_ns(
        inp.q_wf,
        inp.q_rw,
        inp.r,
        inp.tau,
        inp.samples,
        inp.k,
    ) * 1e-9;
    floor_s / inp.detection_latency_s.max(f64::MIN_POSITIVE)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::detection::{analytic_pd, detection_boundary};
    use crate::security::min_detectable_offset_ns;

    fn nav_grade() -> CrossSensorNoise {
        // Honeywell HG9900 class + 30 m lunar-DEM TRN fix (fix value Modelled).
        CrossSensorNoise::honeywell_hg9900(30.0)
    }

    #[test]
    fn min_detectable_walk_reproduces_the_detection_closed_form() {
        // ORACLE (Validated): at exactly the minimum detectable walk-rate, the
        // accumulated residual v_min*T fed to the independent, published two-sided
        // detector (crate::detection) must yield detection power == the requested
        // P_d, with the boundary set by the requested P_fa. This ties v_min to the
        // detection.rs closed form, not to this module's own arithmetic.
        let cfg = DetectorCfg::nominal();
        let coast = 120.0;
        let noise = nav_grade();
        let bound = min_detectable_position_walk(&noise, coast, &cfg);

        let sigma = bound.cross_sensor_sigma_m;
        let mu = bound.min_detectable_walk_rate_mps * coast; // reconstruct residual
        let gamma = detection_boundary(sigma, cfg.p_fa);
        let pd = analytic_pd(mu, sigma, gamma);
        // Far-tail approximation ties Phi^-1(P_d) margin to the two-sided power.
        assert!(
            (pd - cfg.p_d).abs() < 1e-3,
            "detection power at v_min = {pd}, expected P_d = {}",
            cfg.p_d
        );
        // And the reconstructed residual equals the reported min detectable residual.
        assert!((mu - bound.min_detectable_residual_m).abs() < 1e-9 * mu.abs().max(1.0));
    }

    #[test]
    fn min_detectable_residual_matches_boundary_plus_power_margin() {
        // ORACLE: min detectable residual == gamma + sigma*Phi^-1(P_d) exactly,
        // gamma being crate::detection::detection_boundary.
        let cfg = DetectorCfg::nominal();
        let sigma = 42.0;
        let expected = detection_boundary(sigma, cfg.p_fa) + sigma * normal_inv_cdf(cfg.p_d);
        assert!((min_detectable_residual(sigma, &cfg) - expected).abs() < 1e-12);
    }

    #[test]
    fn noisier_imu_raises_the_minimum_detectable_walk() {
        // ORACLE (Validated scaling): a tactical MEMS IMU is strictly noisier than
        // the nav-grade HG9900 on both inertial terms, so its minimum detectable
        // walk-rate must be strictly larger (protection is worse). Same TRN fix and
        // operating point isolate the IMU effect.
        let cfg = DetectorCfg::nominal();
        let coast = 120.0;
        let good = CrossSensorNoise::honeywell_hg9900(30.0);
        let bad = CrossSensorNoise::tactical_mems(30.0);
        let vg = min_detectable_position_walk(&good, coast, &cfg).min_detectable_walk_rate_mps;
        let vb = min_detectable_position_walk(&bad, coast, &cfg).min_detectable_walk_rate_mps;
        assert!(
            vb > vg,
            "noisier IMU should raise min detectable walk: good={vg} bad={vb}"
        );
    }

    #[test]
    fn noisier_trn_raises_the_minimum_detectable_walk() {
        // Same scaling on the TRN leg: a worse absolute fix raises v_min.
        let cfg = DetectorCfg::nominal();
        let coast = 120.0;
        let sharp = CrossSensorNoise::honeywell_hg9900(10.0);
        let blurry = CrossSensorNoise::honeywell_hg9900(80.0);
        let vs = min_detectable_position_walk(&sharp, coast, &cfg).min_detectable_walk_rate_mps;
        let vbl = min_detectable_position_walk(&blurry, coast, &cfg).min_detectable_walk_rate_mps;
        assert!(vbl > vs, "worse TRN fix should raise min detectable walk");
    }

    #[test]
    fn tighter_operating_point_raises_the_minimum_detectable_walk() {
        // Demanding a lower P_fa and/or higher P_d must raise the residual (and
        // hence walk) required to alarm — a monotone property of the closed form.
        let coast = 120.0;
        let noise = nav_grade();
        let loose = DetectorCfg {
            p_fa: 1e-2,
            p_d: 0.9,
        };
        let strict = DetectorCfg {
            p_fa: 1e-6,
            p_d: 0.9999,
        };
        let vl = min_detectable_position_walk(&noise, coast, &loose).min_detectable_walk_rate_mps;
        let vst = min_detectable_position_walk(&noise, coast, &strict).min_detectable_walk_rate_mps;
        assert!(vst > vl);
    }

    #[test]
    fn cross_sensor_sigma_is_the_rss_of_imu_and_trn() {
        // ORACLE: sigma^2 == imu_coast^2 + trn^2 exactly (independent sources).
        let noise = nav_grade();
        let coast = 90.0;
        let imu = noise.imu_coast_sigma_m(coast);
        let total = noise.cross_sensor_sigma_m(coast);
        let expected = (imu * imu + noise.trn_fix_sigma * noise.trn_fix_sigma).sqrt();
        assert!((total - expected).abs() < 1e-12);
        // The RSS is at least each component.
        assert!(total >= imu && total >= noise.trn_fix_sigma);
    }

    #[test]
    fn imu_coast_sigma_grows_with_time_and_with_bias() {
        let base = nav_grade();
        assert!(base.imu_coast_sigma_m(200.0) > base.imu_coast_sigma_m(50.0));
        let noisier = CrossSensorNoise {
            accel_bias: base.accel_bias * 4.0,
            ..base
        };
        assert!(noisier.imu_coast_sigma_m(200.0) > base.imu_coast_sigma_m(200.0));
        // A zero-length coast leaves only the (independent) TRN fix.
        assert!(base.imu_coast_sigma_m(0.0).abs() < 1e-15);
    }

    #[test]
    fn residual_is_linear_and_inverts_the_bound() {
        // residual(v, T) = v*T, and at v_min the residual equals the reported
        // minimum detectable residual (the bound inverts the linear relationship).
        let cfg = DetectorCfg::nominal();
        let coast = 120.0;
        let noise = nav_grade();
        let bound = min_detectable_position_walk(&noise, coast, &cfg);
        let r = residual_for_walk(bound.min_detectable_walk_rate_mps, coast);
        assert!((r - bound.min_detectable_residual_m).abs() < 1e-9 * r.max(1.0));
        // Linear: doubling the walk doubles the residual.
        assert!((residual_for_walk(2.0, 10.0) - 2.0 * residual_for_walk(1.0, 10.0)).abs() < 1e-12);
    }

    #[test]
    fn detectability_predicate_brackets_the_bound() {
        let cfg = DetectorCfg::nominal();
        let coast = 120.0;
        let noise = nav_grade();
        let v_min = min_detectable_position_walk(&noise, coast, &cfg).min_detectable_walk_rate_mps;
        // Just above the bound -> detectable; just below -> not.
        assert!(walk_is_detectable(&noise, coast, &cfg, v_min * 1.001));
        assert!(!walk_is_detectable(&noise, coast, &cfg, v_min * 0.999));
    }

    #[test]
    fn clock_walk_rate_reproduces_the_tpl_static_floor() {
        // ORACLE (Validated): the clock instance composes the identical closed form
        // validated in tpl.rs — min detectable clock walk-rate == static monitor
        // floor / detection latency, with the floor being exactly
        // crate::security::min_detectable_offset_ns.
        use crate::clock_state::q_from_allan;
        let (q_wf, q_rw, q_drift) = q_from_allan(1e-12, 1e-14, 1e-16);
        let inp = TplInputs {
            q_wf,
            q_rw,
            q_drift,
            r: 1e-20,
            tau: 600.0,
            samples: 600.0,
            k: 5.0,
            detection_latency_s: 60.0,
        };
        let floor_s =
            min_detectable_offset_ns(inp.q_wf, inp.q_rw, inp.r, inp.tau, inp.samples, inp.k) * 1e-9;
        let expected = floor_s / inp.detection_latency_s;
        assert!((min_detectable_clock_walk_rate_ss(&inp) - expected).abs() < 1e-30);
        // Positive and finite for a real monitor.
        assert!(min_detectable_clock_walk_rate_ss(&inp) > 0.0);
    }

    #[test]
    fn clock_walk_rate_grows_with_monitor_noise() {
        // ORACLE (Validated scaling): a noisier monitor (larger white-FM PSD)
        // raises the static floor and hence the minimum detectable clock walk-rate.
        use crate::clock_state::q_from_allan;
        let (q_wf, q_rw, q_drift) = q_from_allan(1e-12, 1e-14, 1e-16);
        let base = TplInputs {
            q_wf,
            q_rw,
            q_drift,
            r: 1e-20,
            tau: 600.0,
            samples: 600.0,
            k: 5.0,
            detection_latency_s: 60.0,
        };
        let noisier = TplInputs {
            q_wf: base.q_wf * 100.0,
            ..base
        };
        assert!(
            min_detectable_clock_walk_rate_ss(&noisier) > min_detectable_clock_walk_rate_ss(&base)
        );
        // Longer latency spreads the same floor over more time -> smaller rate.
        let slower = TplInputs {
            detection_latency_s: 600.0,
            ..base
        };
        assert!(
            min_detectable_clock_walk_rate_ss(&slower) < min_detectable_clock_walk_rate_ss(&base)
        );
    }

    #[test]
    fn deterministic_repeatable() {
        let cfg = DetectorCfg::nominal();
        let noise = nav_grade();
        let a = min_detectable_position_walk(&noise, 100.0, &cfg);
        let b = min_detectable_position_walk(&noise, 100.0, &cfg);
        assert_eq!(a, b);
    }
}
