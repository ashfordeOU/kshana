// SPDX-License-Identifier: AGPL-3.0-only
//! **The timing protection level for a receiver in orbit.**
//!
//! [`crate::tpl`] bounds the undetected time error of a *terrestrial* timing receiver
//! under spoofing: the clock-aided monitor's detectability floor plus the oscillator's
//! coast over the detection latency. A satellite that routes or tasks by time has the
//! same threat and a different situation, and this module parameterises the bound for
//! it:
//!
//! * **Geometry.** A terrestrial spoofer can only reach a low-Earth-orbit satellite while
//!   the satellite is above the spoofer's horizon. At 550 km that is at most about twelve
//!   minutes per pass ([`visibility_half_angle_rad`], [`max_pass_s`]), after which the
//!   satellite has flown out of reach. A spoofer's pull is therefore capped by its ramp
//!   rate times that window, whatever the monitor does ([`OrbitalTimingReport::ramp_limited_pull_ns`]).
//! * **Dynamics.** A common-mode time pull shifts every pseudorange equally and is
//!   absorbed into the receiver's clock bias, not its position. An orbit-propagator
//!   cross-check therefore catches a *position* spoof but not a pure *time* pull; this
//!   module does not count it as a timing cross-check.
//! * **Cross-checks a satellite actually has** ([`CrossCheck`]). There is rarely a
//!   second independent timing receiver. What there is: the onboard clock's own coast
//!   (always; the monitor of [`crate::tpl`]); a two-way time transfer with a ground
//!   station during a contact (only during contacts, so its revisit sets the exposure);
//!   and a time comparison over an inter-satellite link, which is independent of a
//!   ground spoofer only if the neighbour is outside the spoofer's footprint at the same
//!   moment ([`crosslink_neighbour_is_outside_footprint`]). The arrival direction of the
//!   signals (a zenith-pointing antenna sees a ground emitter in its back lobe) is a real
//!   cross-check that needs an antenna pattern and is not modelled.
//!
//! The clock enters as a [`ClockNoise`]: a datasheet, a measured record or a class
//! default, with the flicker and white-phase terms the three-state model cannot carry.
//! The composition reduces exactly to [`crate::tpl::timing_protection_level_ns`] when
//! those extra terms are zero, which a test checks.
//!
//! Scope (honest): MODELLED. The conditional bound holds only given detection, exactly
//! as in [`crate::tpl`]; the ramp-limited cap assumes a single terrestrial spoofer with a
//! stated maximum ramp rate and an overhead pass with Earth rotation neglected; the
//! geometry is a spherical Earth. Nothing here has been validated on a spoofed receiver
//! in orbit.

use serde::{Deserialize, Serialize};

use crate::slot_timing::ClockNoise;
use crate::tpl::cusum_latency_s;

/// Mean Earth radius (m), spherical model.
pub const EARTH_RADIUS_M: f64 = 6_371_000.0;
/// Earth gravitational parameter (m³/s²), IERS Conventions 2010.
pub const GM_EARTH: f64 = 3.986_004_418e14;

/// Circular orbital speed (m/s) at altitude `h_m`.
pub fn orbital_speed_m_s(h_m: f64) -> f64 {
    (GM_EARTH / (EARTH_RADIUS_M + h_m)).sqrt()
}

/// Circular orbital period (s) at altitude `h_m`.
pub fn orbital_period_s(h_m: f64) -> f64 {
    2.0 * std::f64::consts::PI * ((EARTH_RADIUS_M + h_m).powi(3) / GM_EARTH).sqrt()
}

/// Earth central half-angle (rad) of the region from which the satellite is above
/// `min_elevation_rad`: `λ = acos(R·cos ε / (R + h)) − ε` (spherical Earth).
pub fn visibility_half_angle_rad(h_m: f64, min_elevation_rad: f64) -> f64 {
    let r = EARTH_RADIUS_M;
    (r * min_elevation_rad.cos() / (r + h_m)).acos() - min_elevation_rad
}

/// Longest time (s) one ground point sees the satellite in a pass: an overhead pass,
/// `2λ / n` with `n` the orbital angular rate, Earth rotation neglected.
pub fn max_pass_s(h_m: f64, min_elevation_rad: f64) -> f64 {
    let n = 2.0 * std::f64::consts::PI / orbital_period_s(h_m);
    2.0 * visibility_half_angle_rad(h_m, min_elevation_rad) / n
}

/// Whether an in-plane neighbour, `2π / sats_per_plane` ahead, is outside the footprint
/// of a ground spoofer that can see this satellite: a single ground point sees both
/// only if their central-angle separation is below `2λ`.
pub fn crosslink_neighbour_is_outside_footprint(
    h_m: f64,
    min_elevation_rad: f64,
    sats_per_plane: u32,
) -> bool {
    if sats_per_plane == 0 {
        return false;
    }
    let sep = 2.0 * std::f64::consts::PI / sats_per_plane as f64;
    sep >= 2.0 * visibility_half_angle_rad(h_m, min_elevation_rad)
}

/// The kind of an independent timing cross-check.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum CrossCheckKind {
    /// Two-way time transfer with a ground station during a contact.
    GroundContact,
    /// Time comparison with an in-plane neighbour over an inter-satellite link.
    Crosslink,
}

/// One independent timing cross-check the satellite has.
#[derive(Clone, Copy, Debug, PartialEq, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct CrossCheck {
    /// What it is.
    pub kind: CrossCheckKind,
    /// Longest gap between two uses of it (s).
    pub revisit_s: f64,
    /// One-sigma time error of the comparison (ns).
    pub sigma_ns: f64,
    /// Satellites per orbital plane, for a crosslink check (its independence depends on
    /// the neighbour's separation).
    #[serde(default)]
    pub sats_per_plane: Option<u32>,
}

/// The receiver, its monitor and the threat assumptions.
#[derive(Clone, Debug, PartialEq)]
pub struct OrbitalTimingInputs {
    /// The onboard oscillator.
    pub clock: ClockNoise,
    /// Orbital altitude (m).
    pub altitude_m: f64,
    /// Lowest elevation at which a ground spoofer's signal can reach the satellite (rad).
    pub spoofer_min_elevation_rad: f64,
    /// One-sigma time error of the receiver's GNSS time solution per epoch (s).
    pub receiver_time_sigma_s: f64,
    /// Monitor epoch (s).
    pub epoch_s: f64,
    /// Monitor window over which the clock's coast is compared with GNSS time (s).
    pub monitor_window_s: f64,
    /// Alarm multiplier (sigmas).
    pub k: f64,
    /// CUSUM reference value (sigmas).
    pub cusum_kref: f64,
    /// CUSUM decision interval (sigmas).
    pub cusum_h: f64,
    /// Standardised attack severity the detection latency is evaluated at (sigmas per
    /// epoch).
    pub attack_severity_z: f64,
    /// Largest ramp rate assumed for the spoofer (s/s).
    pub max_ramp_rate: f64,
    /// Independent cross-checks available.
    pub checks: Vec<CrossCheck>,
}

/// Assessment of one cross-check.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CheckAssessment {
    /// What it is.
    pub kind: CrossCheckKind,
    /// Whether it is independent of a single ground spoofer.
    pub independent: bool,
    /// Why, in one sentence.
    pub reason: String,
    /// Longest gap between uses (s).
    pub revisit_s: f64,
    /// Undetected error the check itself allows at the moment it is used: `k·σ` (ns).
    pub at_check_ns: f64,
}

/// The answer.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OrbitalTimingReport {
    /// Circular orbital speed (m/s).
    pub orbital_speed_m_s: f64,
    /// Orbital period (s).
    pub orbital_period_s: f64,
    /// Radius on the ground of the region a spoofer must be in to reach the satellite
    /// (km, along the surface).
    pub spoofer_footprint_radius_km: f64,
    /// Longest time a single ground spoofer can reach the satellite in one pass (s).
    pub max_spoofer_exposure_s: f64,
    /// Monitor detectability floor: `k` times the monitor's one sigma (ns).
    pub monitor_floor_ns: f64,
    /// CUSUM detection latency at the stated severity (s); infinite below the
    /// reference value.
    pub detection_latency_s: f64,
    /// Clock coast one sigma over the detection latency (ns).
    pub coast_over_latency_ns: f64,
    /// Conditional timing protection level: floor plus coast (ns). Holds only given
    /// detection.
    pub conditional_tpl_ns: f64,
    /// The pull a spoofer ramping at the assumed maximum rate accumulates before either
    /// the satellite leaves its footprint or an independent check catches it (ns).
    pub ramp_limited_pull_ns: f64,
    /// Each cross-check.
    pub checks: Vec<CheckAssessment>,
}

fn check_inputs(i: &OrbitalTimingInputs) -> Result<(), String> {
    let pos = |name: &str, v: f64| {
        if v.is_finite() && v > 0.0 {
            Ok(())
        } else {
            Err(format!("{name} must be positive; got {v}"))
        }
    };
    pos("altitude_m", i.altitude_m)?;
    pos("epoch_s", i.epoch_s)?;
    pos("monitor_window_s", i.monitor_window_s)?;
    pos("k", i.k)?;
    pos("cusum_h", i.cusum_h)?;
    if !(i.receiver_time_sigma_s.is_finite() && i.receiver_time_sigma_s >= 0.0) {
        return Err("receiver_time_sigma_s must be finite and non-negative".into());
    }
    if !(i.max_ramp_rate.is_finite() && i.max_ramp_rate >= 0.0) {
        return Err("max_ramp_rate must be finite and non-negative".into());
    }
    if !(i.spoofer_min_elevation_rad.is_finite()
        && (0.0..std::f64::consts::FRAC_PI_2).contains(&i.spoofer_min_elevation_rad))
    {
        return Err("spoofer minimum elevation must be in [0, 90) degrees".into());
    }
    for c in &i.checks {
        pos("cross-check revisit_s", c.revisit_s)?;
        if !(c.sigma_ns.is_finite() && c.sigma_ns >= 0.0) {
            return Err("cross-check sigma_ns must be finite and non-negative".into());
        }
    }
    Ok(())
}

/// Evaluate the protection level and the orbital cross-checks.
pub fn orbital_timing(i: &OrbitalTimingInputs) -> Result<OrbitalTimingReport, String> {
    check_inputs(i)?;
    let h = i.altitude_m;
    let el = i.spoofer_min_elevation_rad;
    let lambda = visibility_half_angle_rad(h, el);
    let exposure = max_pass_s(h, el);

    // Monitor floor: the per-sample variance is the receiver's time noise plus the
    // clock's white phase noise, averaged over the window's epochs; the clock term is
    // its coast over the window without the white-phase floor already counted.
    let samples = (i.monitor_window_s / i.epoch_s).max(1.0);
    let r = i.receiver_time_sigma_s.powi(2) + i.clock.white_pm_var;
    let coast_window = i.clock.coast_variance(i.monitor_window_s) - i.clock.white_pm_var;
    let monitor_floor_ns = i.k * (r / samples + coast_window).max(0.0).sqrt() * 1e9;

    let latency = cusum_latency_s(i.cusum_kref, i.cusum_h, i.attack_severity_z, i.epoch_s);
    let coast_ns = if latency.is_finite() {
        (i.clock.coast_variance(latency) - i.clock.white_pm_var)
            .max(0.0)
            .sqrt()
            * 1e9
    } else {
        f64::INFINITY
    };

    let checks: Vec<CheckAssessment> = i
        .checks
        .iter()
        .map(|c| {
            let (independent, reason) = match c.kind {
                CrossCheckKind::GroundContact => (
                    true,
                    "a two-way exchange with a ground station measures the clock against \
                     the station's time and cannot be moved by a GNSS spoofer"
                        .to_string(),
                ),
                CrossCheckKind::Crosslink => match c.sats_per_plane {
                    Some(n) if crosslink_neighbour_is_outside_footprint(h, el, n) => (
                        true,
                        format!(
                            "the in-plane neighbour, {:.1} degrees ahead, is outside a \
                             single spoofer's footprint ({:.1} degrees across)",
                            360.0 / n as f64,
                            2.0 * lambda.to_degrees()
                        ),
                    ),
                    Some(n) => (
                        false,
                        format!(
                            "the in-plane neighbour, {:.1} degrees ahead, can be inside the \
                             same spoofer's footprint ({:.1} degrees across), so both clocks \
                             can be pulled together",
                            360.0 / n as f64,
                            2.0 * lambda.to_degrees()
                        ),
                    ),
                    None => (
                        false,
                        "sats_per_plane not given, so independence cannot be shown".to_string(),
                    ),
                },
            };
            CheckAssessment {
                kind: c.kind,
                independent,
                reason,
                revisit_s: c.revisit_s,
                at_check_ns: i.k * c.sigma_ns,
            }
        })
        .collect();

    // A single ground spoofer can pull only while it sees the satellite, and only until
    // the next independent check.
    let first_check = checks
        .iter()
        .filter(|c| c.independent)
        .map(|c| c.revisit_s)
        .fold(f64::INFINITY, f64::min);
    let window = exposure.min(first_check);
    let ramp_limited_pull_ns = i.max_ramp_rate * window * 1e9;

    Ok(OrbitalTimingReport {
        orbital_speed_m_s: orbital_speed_m_s(h),
        orbital_period_s: orbital_period_s(h),
        spoofer_footprint_radius_km: lambda * EARTH_RADIUS_M / 1000.0,
        max_spoofer_exposure_s: exposure,
        monitor_floor_ns,
        detection_latency_s: latency,
        coast_over_latency_ns: coast_ns,
        conditional_tpl_ns: monitor_floor_ns + coast_ns,
        ramp_limited_pull_ns,
        checks,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_state::ClockClass;
    use crate::slot_timing::NoiseSource;
    use crate::tpl::{timing_protection_level_ns, TplInputs};

    fn inputs(clock: ClockNoise) -> OrbitalTimingInputs {
        OrbitalTimingInputs {
            clock,
            altitude_m: 550_000.0,
            spoofer_min_elevation_rad: 0.0,
            receiver_time_sigma_s: 10e-9,
            epoch_s: 1.0,
            monitor_window_s: 600.0,
            k: 5.0,
            cusum_kref: 0.5,
            cusum_h: 5.0,
            attack_severity_z: 1.5,
            max_ramp_rate: 1e-8,
            checks: vec![],
        }
    }

    fn fm_only(q_wf: f64, q_rw: f64) -> ClockNoise {
        ClockNoise {
            white_pm_var: 0.0,
            q_wf,
            flicker: 0.0,
            q_rw,
            q_rr: 0.0,
            aging_per_day: 0.0,
            tempco_per_k: 0.0,
            support_tau_s: f64::INFINITY,
            source: NoiseSource::Explicit,
        }
    }

    fn rel(a: f64, b: f64) -> f64 {
        (a - b).abs() / b.abs().max(1e-300)
    }

    // With no flicker, white-phase or random-run term the composition is exactly the
    // terrestrial TPL of crate::tpl.
    #[test]
    fn reduces_to_the_terrestrial_tpl() {
        let i = inputs(fm_only(1e-22, 1e-30));
        let r = orbital_timing(&i).unwrap();
        let latency = cusum_latency_s(0.5, 5.0, 1.5, 1.0);
        let theirs = timing_protection_level_ns(&TplInputs {
            q_wf: 1e-22,
            q_rw: 1e-30,
            q_drift: 0.0,
            r: (10e-9f64).powi(2),
            tau: 600.0,
            samples: 600.0,
            k: 5.0,
            detection_latency_s: latency,
        });
        assert!(
            rel(r.conditional_tpl_ns, theirs) < 1e-12,
            "{} vs {theirs}",
            r.conditional_tpl_ns
        );
        assert_eq!(r.detection_latency_s, latency);
    }

    // Orbital speed and period at 550 km against the circular-orbit closed forms.
    #[test]
    fn leo_geometry_matches_its_closed_forms() {
        let h = 550_000.0;
        let v = orbital_speed_m_s(h);
        assert!((v - 7589.0).abs() < 1.0, "speed {v}");
        let p = orbital_period_s(h);
        assert!((p - 5730.1).abs() < 0.5, "period {p}");
        // Horizon half-angle: acos(R/(R+h)).
        let lam = visibility_half_angle_rad(h, 0.0);
        assert!(rel(lam, (EARTH_RADIUS_M / (EARTH_RADIUS_M + h)).acos()) < 1e-15);
        // Overhead pass at 0 deg: 2λ/n, about 12.2 minutes at 550 km.
        let pass = max_pass_s(h, 0.0);
        assert!((pass - 2.0 * lam * p / (2.0 * std::f64::consts::PI)).abs() < 1e-9);
        assert!(pass > 700.0 && pass < 800.0, "pass {pass}");
        // A higher minimum elevation shortens the exposure.
        assert!(max_pass_s(h, 10f64.to_radians()) < pass);
    }

    #[test]
    fn crosslink_independence_follows_the_footprint() {
        let h = 550_000.0;
        // 2λ at 550 km and 0 deg is about 45.9 deg: 7 per plane (51.4 deg) is outside,
        // 22 per plane (16.4 deg) is inside.
        assert!(crosslink_neighbour_is_outside_footprint(h, 0.0, 7));
        assert!(!crosslink_neighbour_is_outside_footprint(h, 0.0, 22));
        assert!(!crosslink_neighbour_is_outside_footprint(h, 0.0, 0));
    }

    #[test]
    fn an_independent_check_caps_the_ramp_before_the_pass_ends() {
        let mut i = inputs(ClockNoise::from_class(ClockClass::Ocxo));
        let open = orbital_timing(&i).unwrap();
        // No check: the cap is the spoofer's visibility window.
        assert!(
            rel(
                open.ramp_limited_pull_ns,
                1e-8 * open.max_spoofer_exposure_s * 1e9
            ) < 1e-12
        );
        i.checks = vec![CrossCheck {
            kind: CrossCheckKind::GroundContact,
            revisit_s: 300.0,
            sigma_ns: 2.0,
            sats_per_plane: None,
        }];
        let checked = orbital_timing(&i).unwrap();
        assert!(rel(checked.ramp_limited_pull_ns, 1e-8 * 300.0 * 1e9) < 1e-12);
        assert!(checked.checks[0].independent);
        assert_eq!(checked.checks[0].at_check_ns, 10.0);
    }

    #[test]
    fn a_crosslink_inside_the_footprint_does_not_count() {
        let mut i = inputs(ClockNoise::from_class(ClockClass::Ocxo));
        i.checks = vec![CrossCheck {
            kind: CrossCheckKind::Crosslink,
            revisit_s: 10.0,
            sigma_ns: 1.0,
            sats_per_plane: Some(22),
        }];
        let r = orbital_timing(&i).unwrap();
        assert!(!r.checks[0].independent);
        // It does not shorten the exposure.
        assert!(
            rel(
                r.ramp_limited_pull_ns,
                1e-8 * r.max_spoofer_exposure_s * 1e9
            ) < 1e-12
        );
        i.checks[0].sats_per_plane = Some(7);
        let r = orbital_timing(&i).unwrap();
        assert!(r.checks[0].independent);
        assert!(rel(r.ramp_limited_pull_ns, 1e-8 * 10.0 * 1e9) < 1e-12);
    }

    #[test]
    fn a_ramp_below_the_reference_is_never_detected() {
        let mut i = inputs(fm_only(1e-22, 0.0));
        i.attack_severity_z = 0.4;
        let r = orbital_timing(&i).unwrap();
        assert!(r.detection_latency_s.is_infinite());
        assert!(r.conditional_tpl_ns.is_infinite());
    }

    #[test]
    fn the_white_phase_floor_raises_the_monitor_floor() {
        let base = orbital_timing(&inputs(fm_only(1e-22, 0.0))).unwrap();
        let mut c = fm_only(1e-22, 0.0);
        c.white_pm_var = (50e-9f64).powi(2);
        let noisy = orbital_timing(&inputs(c)).unwrap();
        assert!(noisy.monitor_floor_ns > base.monitor_floor_ns);
    }

    #[test]
    fn bad_inputs_are_refused() {
        let mut i = inputs(fm_only(1e-22, 0.0));
        i.altitude_m = -1.0;
        assert!(orbital_timing(&i).is_err());
        let mut i = inputs(fm_only(1e-22, 0.0));
        i.spoofer_min_elevation_rad = 2.0;
        assert!(orbital_timing(&i).is_err());
        let mut i = inputs(fm_only(1e-22, 0.0));
        i.checks = vec![CrossCheck {
            kind: CrossCheckKind::GroundContact,
            revisit_s: 0.0,
            sigma_ns: 1.0,
            sats_per_plane: None,
        }];
        assert!(orbital_timing(&i).is_err());
    }
}
