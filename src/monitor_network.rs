// SPDX-License-Identifier: AGPL-3.0-only
//! Sparse-monitor-network detection sizing: **how many surveyed, known-location
//! monitor receivers does it take to catch a wide-area / orbital-scale spoof or jam?**
//!
//! This turns the P1 "Defense Layer-3" assertion — *a handful of fixed, surveyed
//! monitor stations catch an area event* — into a **sized** result: the probability
//! that at least one monitor raises an alert, as a function of the monitor count `N`.
//!
//! # Model — a genuine composition, not free parameters
//!
//! The analysis composes three already-built pieces and reimplements none of their math:
//!
//! * **(a) The physical spoof monitors of [`crate::spoof_monitors`].** Each ground
//!   station's *decision statistic* — the `N(μ, σ²)` variable it thresholds — is derived
//!   from a physical monitor, not hand-set. The default station runs the **AGC
//!   received-power monitor** ([`crate::spoof_monitors::AgcMonitor`]): its statistic is
//!   the power excess (dB) over the nominal floor, so under a spoof its mean is
//!   `AgcMonitor::excess_db(combine_power_dbm([floor, spoof_rx]))` — the incoherent power
//!   sum of the legitimate floor and the spoof power **as it arrives at that station** —
//!   computed with [`crate::spoof_monitors::combine_power_dbm`] and
//!   [`crate::spoof_monitors::AgcMonitor::excess_db`]. The spoof power arriving at a
//!   station is the emitter EIRP less the free-space path loss over the real slant range
//!   to it (airless Moon: no refraction, no absorption). So a distant station sees a
//!   weaker spoof, a smaller `μ`, and a lower `P_d` — the geometry drives the statistic.
//! * **(b) The selenographic coverage/visibility geometry of [`crate::lunar_service`].**
//!   Whether a station *observes* the event is the real visibility test
//!   [`crate::lunar_service::visible_sat_positions`]: the emitter is placed at its
//!   selenographic location/altitude in MCMF ([`crate::lunar::selenographic_to_mcmf`]) and
//!   a station sees it iff it clears the station's local horizon (elevation ≥ mask) — the
//!   same surface-user visibility gate the lunar service volume uses for satellites, not
//!   an ad-hoc two-disk overlap. A station over the horizon from the emitter contributes
//!   nothing.
//! * **(c) The closed-form detection oracle of [`crate::detection`].** Each observing
//!   station's per-monitor `P_d` at a fixed `P_fa` is read straight off
//!   [`crate::detection::analytic_pd`] at the boundary
//!   [`crate::detection::detection_boundary`] for its derived `(μ, σ)`.
//!
//! The **network** raises an alert when *any* observing station does, so the miss events
//! multiply and
//!
//! ```text
//!   P_net(N) = 1 − ∏_{i : station i sees the event} (1 − P_d,i)
//! ```
//!
//! is exact probability algebra under conditionally-independent per-station noise.
//!
//! # Validated vs Modelled
//!
//! * **Validated.** The per-monitor `P_d` is the closed-form analytic detection power of
//!   the two-sided χ²₁ energy detector — asserted equal, to machine precision, to
//!   [`crate::detection::analytic_pd`] for the same `(μ, σ, P_fa)` (itself cross-checked
//!   against Monte-Carlo in `detection.rs`). The per-station `μ` is the AGC power-excess
//!   statistic of [`crate::spoof_monitors`], asserted equal to a direct
//!   `AgcMonitor::excess_db(combine_power_dbm(..))` call. The visibility gate is the exact
//!   [`crate::lunar_service::visible_sat_positions`] output, asserted equal to a direct
//!   call and cross-checked against the closed-form local-horizon elevation identity. The
//!   network combination `1 − ∏(1 − P_d,i)` is exact probability algebra, asserted against
//!   hand-computed values for small `N`.
//! * **Modelled.** The emitter EIRP and the AGC power-estimate σ, the free-space
//!   path-loss link budget, the *placement* of the stations, and the assumption that
//!   per-station detector noise is independent are representative engineering choices,
//!   not measured facts. They fix *which* stations observe the event and *how strong*
//!   each one's statistic is; the detection mathematics applied to them is Validated.
//!
//! Deterministic: no wall-clock, no RNG.

use crate::detection::{analytic_pd, detection_boundary};
use crate::lunar::{selenographic_to_mcmf, Selenographic};
use crate::lunar_service::visible_sat_positions;
use crate::spoof_monitors::{combine_power_dbm, AgcMonitor};

/// Great-circle (surface arc) radius, in metres, of the surface disk an object at height
/// `height_m` above a sphere of radius `radius_m` has line of sight to: the exact
/// spherical horizon arc `d = R·acos(R/(R+h))` (the central angle whose cosine is
/// `R/(R+h)`, times `R`). Retained as a footprint/coverage-area helper; the *observation*
/// gate now uses the real [`crate::lunar_service::visible_sat_positions`] visibility test.
pub fn horizon_ground_range_m(radius_m: f64, height_m: f64) -> f64 {
    radius_m * (radius_m / (radius_m + height_m)).acos()
}

/// A surveyed, fixed-location monitor station on the surface, whose detection statistic is
/// derived from a physical [`crate::spoof_monitors`] monitor — not hand-set.
///
/// `lat_rad` / `lon_rad` are selenographic (body-fixed) latitude and longitude in radians
/// and `alt_m` the height above the mean sphere (its antenna phase centre). `floor_dbm` is
/// the nominal received-power floor the station's AGC monitor
/// ([`crate::spoof_monitors::AgcMonitor`]) expects — the H0 mean of the station's
/// power-excess statistic; the station builds its `AgcMonitor` from it via
/// [`SurfaceMonitor::agc`]. `power_sigma_db` is the 1σ noise of that AGC power estimate
/// (dB), the σ of the decision variable. Together with a spoof event's received power and
/// the target `P_fa` these set the station's per-monitor `P_d` — see
/// [`SurfaceMonitor::detection_statistic`].
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct SurfaceMonitor {
    /// Selenographic latitude of the station, radians.
    pub lat_rad: f64,
    /// Selenographic longitude of the station, radians.
    pub lon_rad: f64,
    /// Height of the station's antenna above the mean sphere, metres.
    pub alt_m: f64,
    /// Nominal received-power floor (dBm) the station's AGC monitor expects — the H0 mean
    /// of the power-excess statistic.
    pub floor_dbm: f64,
    /// 1σ noise of the AGC power-excess statistic, dB — the σ of the decision variable.
    pub power_sigma_db: f64,
}

impl SurfaceMonitor {
    /// Construct a station at a selenographic location whose AGC monitor sees a nominal
    /// received-power floor `floor_dbm` with a 1σ power-estimate noise `power_sigma_db`.
    pub fn new(
        lat_rad: f64,
        lon_rad: f64,
        alt_m: f64,
        floor_dbm: f64,
        power_sigma_db: f64,
    ) -> Self {
        SurfaceMonitor {
            lat_rad,
            lon_rad,
            alt_m,
            floor_dbm,
            power_sigma_db,
        }
    }

    /// The station's AGC received-power monitor
    /// ([`crate::spoof_monitors::AgcMonitor::new`], with the conventional 3 dB alert
    /// margin over the station's nominal floor). The *statistical* `P_d` uses the
    /// `detection.rs` boundary at the target `P_fa` rather than that fixed margin, but the
    /// power-excess statistic itself is the AGC monitor's.
    pub fn agc(&self) -> AgcMonitor {
        AgcMonitor::new(self.floor_dbm)
    }

    /// The station's selenographic position (its antenna phase centre).
    pub fn selenographic(&self) -> Selenographic {
        Selenographic {
            lat_rad: self.lat_rad,
            lon_rad: self.lon_rad,
            alt_m: self.alt_m,
        }
    }

    /// MCMF (Moon-fixed Cartesian) position of the station.
    pub fn position_mcmf(&self) -> [f64; 3] {
        selenographic_to_mcmf(self.selenographic())
    }

    /// The station's `N(μ, σ²)` detection statistic against a spoof event, derived from
    /// its AGC power monitor: `μ` is the AGC power *excess* (dB) the event induces —
    /// `AgcMonitor::excess_db` of the incoherent sum ([`crate::spoof_monitors::combine_power_dbm`])
    /// of the nominal floor and the spoof power `spoof_rx_dbm` arriving at this station —
    /// and `σ` is the AGC power-estimate 1σ. This is the physical bridge into
    /// [`crate::detection`]: `μ` comes from `spoof_monitors`, not a free parameter.
    pub fn detection_statistic(&self, spoof_rx_dbm: f64) -> (f64, f64) {
        let agc = self.agc();
        let measured_dbm = combine_power_dbm(&[self.floor_dbm, spoof_rx_dbm]);
        (agc.excess_db(measured_dbm), self.power_sigma_db)
    }

    /// Per-monitor detection power `P_d` for this station against a spoof event that
    /// arrives at received power `spoof_rx_dbm`, at target false-alarm probability `p_fa`.
    /// The `(μ, σ)` come from [`SurfaceMonitor::detection_statistic`] (the AGC monitor);
    /// the boundary is [`crate::detection::detection_boundary`] and the power is
    /// [`crate::detection::analytic_pd`]. This is the **Validated** per-monitor value.
    pub fn detection_power(&self, spoof_rx_dbm: f64, p_fa: f64) -> f64 {
        let (mu, sigma) = self.detection_statistic(spoof_rx_dbm);
        let gamma = detection_boundary(sigma, p_fa);
        analytic_pd(mu, sigma, gamma)
    }
}

/// A wide-area / orbital-scale spoof or jam **emitter**: a transmitter at a selenographic
/// location and altitude radiating a known effective isotropic radiated power (EIRP).
///
/// `lat_rad` / `lon_rad` / `alt_m` are the emitter's selenographic position — an orbital
/// emitter sits at a large `alt_m`, a wide-area surface emitter near the surface.
/// `eirp_dbm` is its EIRP (dBm). The power a ground station actually sees is the EIRP less
/// the free-space path loss over the real slant range to it, so the emitter's geometry —
/// not a per-station knob — sets how strong each station's statistic is.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct SpoofEvent {
    /// Selenographic latitude of the emitter, radians.
    pub lat_rad: f64,
    /// Selenographic longitude of the emitter, radians.
    pub lon_rad: f64,
    /// Height of the emitter above the mean sphere, metres.
    pub alt_m: f64,
    /// Emitter effective isotropic radiated power, dBm.
    pub eirp_dbm: f64,
}

impl SpoofEvent {
    /// The emitter's selenographic position.
    pub fn selenographic(&self) -> Selenographic {
        Selenographic {
            lat_rad: self.lat_rad,
            lon_rad: self.lon_rad,
            alt_m: self.alt_m,
        }
    }

    /// MCMF (Moon-fixed Cartesian) position of the emitter.
    pub fn position_mcmf(&self) -> [f64; 3] {
        selenographic_to_mcmf(self.selenographic())
    }
}

/// Free-space path loss (dB) over a slant range of `range_m`, referenced to a 1 m range:
/// `20·log10(range_m)`. On the airless Moon there is no refractive bending, atmospheric
/// absorption or skywave path, so the received-power falloff of a spoof emitter is the
/// bare inverse-square free-space term — the geometric core that makes a distant station's
/// AGC statistic weaker. Range below 1 m is clamped to 0 dB (no gain).
pub fn free_space_path_loss_db(range_m: f64) -> f64 {
    if range_m <= 1.0 {
        0.0
    } else {
        20.0 * range_m.log10()
    }
}

/// Slant range (m) between two MCMF points — the straight-line distance the spoof signal
/// travels from the emitter to a station.
fn slant_range_m(a: [f64; 3], b: [f64; 3]) -> f64 {
    let d = [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
    (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
}

/// The spoof power (dBm) arriving at a station: the emitter EIRP less the free-space path
/// loss over the real MCMF slant range from the emitter to the station. This is what feeds
/// the station's AGC power-excess statistic ([`SurfaceMonitor::detection_statistic`]).
pub fn spoof_power_at_monitor(event: &SpoofEvent, monitor: &SurfaceMonitor) -> f64 {
    let range_m = slant_range_m(event.position_mcmf(), monitor.position_mcmf());
    event.eirp_dbm - free_space_path_loss_db(range_m)
}

/// Whether a station **observes** an event: the emitter, placed in MCMF, clears the
/// station's local horizon at elevation `≥ elev_mask_rad`. This is the real selenographic
/// visibility test of [`crate::lunar_service::visible_sat_positions`] applied with the
/// station as the surface user and the single emitter as the "satellite" — the same gate
/// the lunar service volume uses to decide which satellites a surface user sees, not an
/// ad-hoc two-disk overlap. A station over the horizon from the emitter observes nothing.
pub fn monitor_observes_event(
    monitor: &SurfaceMonitor,
    event: &SpoofEvent,
    elev_mask_rad: f64,
) -> bool {
    let user = monitor.position_mcmf();
    let emitter = [event.position_mcmf()];
    !visible_sat_positions(user, &emitter, elev_mask_rad).is_empty()
}

/// Network detection probability from a set of per-monitor detection powers under
/// conditionally-independent noise: `P_net = 1 − ∏(1 − P_d,i)`. Exact probability
/// algebra. An empty slice yields `0.0` (no monitor can detect).
pub fn network_detection_probability(per_monitor_pd: &[f64]) -> f64 {
    let miss: f64 = per_monitor_pd
        .iter()
        .map(|&p| 1.0 - p.clamp(0.0, 1.0))
        .product();
    (1.0 - miss).clamp(0.0, 1.0)
}

/// One point on the detection-probability-versus-`N` curve.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct NetworkDetectionPoint {
    /// Number of monitors deployed (prefix length of the monitor list).
    pub n_monitors: usize,
    /// How many of those deployed monitors actually observe the event.
    pub n_observing: usize,
    /// Network detection probability `1 − ∏(1 − P_d,i)` over the observing monitors.
    pub network_pd: f64,
}

/// Sized detection result for a sparse monitor network against one event.
#[derive(Debug, Clone, PartialEq)]
pub struct NetworkDetectionResult {
    /// Target per-monitor false-alarm probability used for every station.
    pub p_fa: f64,
    /// Elevation mask (rad) the visibility gate uses.
    pub elev_mask_rad: f64,
    /// The event analysed.
    pub event: SpoofEvent,
    /// Detection-probability-versus-`N` curve, `n_monitors = 1..=monitors.len()`.
    pub curve: Vec<NetworkDetectionPoint>,
    /// Per-monitor detection power of every station that observes the event (in monitor
    /// order) — the visibility geometry that drives the curve.
    pub observing_pd: Vec<f64>,
    /// Spoof power (dBm) arriving at each monitor (in monitor order), whether or not it
    /// observes the event — the link budget that drives each station's statistic.
    pub spoof_rx_dbm: Vec<f64>,
}

/// Compute detection probability versus monitor count `N` for a sparse network against a
/// single event: for each prefix `monitors[..N]`, take the per-monitor `P_d` of the
/// stations that observe the emitter (visibility via
/// [`crate::lunar_service::visible_sat_positions`], statistic strength via the AGC power
/// received over the real slant range) and combine them with
/// [`network_detection_probability`]. Returns the full curve plus the link/visibility
/// geometry.
///
/// The curve is non-decreasing in `N` (adding a station can only add a non-negative
/// detection term to the product), so it directly answers "how many stations to reach a
/// target network `P_d`".
pub fn detection_probability_vs_n(
    monitors: &[SurfaceMonitor],
    event: &SpoofEvent,
    p_fa: f64,
    elev_mask_rad: f64,
) -> NetworkDetectionResult {
    let mut spoof_rx_dbm = Vec::with_capacity(monitors.len());
    let mut observing_pd = Vec::new();
    let mut curve = Vec::with_capacity(monitors.len());

    for (i, m) in monitors.iter().enumerate() {
        let rx_dbm = spoof_power_at_monitor(event, m);
        spoof_rx_dbm.push(rx_dbm);
        if monitor_observes_event(m, event, elev_mask_rad) {
            observing_pd.push(m.detection_power(rx_dbm, p_fa));
        }
        // Network Pd over every observing station among the first (i+1) deployed.
        let network_pd = network_detection_probability(&observing_pd);
        curve.push(NetworkDetectionPoint {
            n_monitors: i + 1,
            n_observing: observing_pd.len(),
            network_pd,
        });
    }

    NetworkDetectionResult {
        p_fa,
        elev_mask_rad,
        event: *event,
        curve,
        observing_pd,
        spoof_rx_dbm,
    }
}

/// Smallest monitor count `N` at which the network detection probability first reaches
/// `target_pd`, from a computed result; `None` if the full network never reaches it.
pub fn monitors_to_reach(result: &NetworkDetectionResult, target_pd: f64) -> Option<usize> {
    result
        .curve
        .iter()
        .find(|p| p.network_pd >= target_pd)
        .map(|p| p.n_monitors)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::detection::{analytic_pd, detection_boundary};
    use crate::lunar::{selenographic_to_mcmf, R_MOON_M};
    use crate::lunar_service::visible_sat_positions;
    use crate::spoof_monitors::{combine_power_dbm, AgcMonitor};

    // A nominal received-power floor (dBm): eight legitimate satellites at −130 dBm each,
    // combined incoherently — the same figure spoof_monitors::agc uses.
    fn nominal_floor_dbm() -> f64 {
        combine_power_dbm(&[-130.0; 8])
    }

    // ORACLE: crate::spoof_monitors AGC power-excess statistic. The station's derived mu
    // must equal a direct AgcMonitor::excess_db(combine_power_dbm([floor, spoof_rx])) —
    // this is the composition of (a), asserted against spoof_monitors directly, not a
    // free parameter.
    #[test]
    fn per_monitor_mu_is_the_agc_power_excess_statistic() {
        let floor = nominal_floor_dbm();
        let m = SurfaceMonitor::new(0.0, 0.0, 0.0, floor, 1.5);
        let spoof_rx_dbm = -118.0;
        let (mu, sigma) = m.detection_statistic(spoof_rx_dbm);

        // Independent reconstruction straight from spoof_monitors.
        let agc = AgcMonitor::new(floor);
        let measured = combine_power_dbm(&[floor, spoof_rx_dbm]);
        let mu_oracle = agc.excess_db(measured);
        assert!(
            (mu - mu_oracle).abs() < 1e-15,
            "mu {mu} vs oracle {mu_oracle}"
        );
        assert_eq!(sigma, 1.5);
        // A real spoofer above the floor produces a positive power excess.
        assert!(mu > 0.0, "spoof above floor must raise power: mu = {mu}");
        // A spoofer far below the floor barely moves the incoherent sum ⇒ ~0 excess.
        let (mu_weak, _) = m.detection_statistic(floor - 40.0);
        assert!(mu_weak.abs() < 0.1, "weak spoof mu = {mu_weak}");
    }

    // ORACLE: crate::detection analytic two-sided energy detector. The per-monitor Pd must
    // equal detection::analytic_pd at the detection_boundary for the (mu, sigma) the AGC
    // statistic derives — a forward/inverse cross-check through (a) into (c), not
    // self-consistency.
    #[test]
    fn per_monitor_pd_matches_detection_oracle() {
        let floor = nominal_floor_dbm();
        let sigma = 1.0;
        let p_fa = 1e-3;
        let m = SurfaceMonitor::new(0.0, 0.0, 0.0, floor, sigma);
        let spoof_rx_dbm = -119.0;

        // Derived (mu, sigma) from the AGC statistic, then the detection.rs oracle.
        let (mu, s) = m.detection_statistic(spoof_rx_dbm);
        let gamma = detection_boundary(s, p_fa);
        let oracle = analytic_pd(mu, s, gamma);
        assert!((m.detection_power(spoof_rx_dbm, p_fa) - oracle).abs() < 1e-15);
        // A stronger spoof (higher mu) can only raise Pd — forward monotonicity into (c).
        let stronger = m.detection_power(spoof_rx_dbm + 6.0, p_fa);
        assert!(stronger >= m.detection_power(spoof_rx_dbm, p_fa) - 1e-15);
    }

    // ORACLE: exact probability algebra by hand. 1 - prod(1 - Pd_i).
    #[test]
    fn network_combination_hand_values() {
        // Two 0.5 monitors: 1 - 0.5*0.5 = 0.75.
        assert!((network_detection_probability(&[0.5, 0.5]) - 0.75).abs() < 1e-15);
        // 0.9 and 0.8: 1 - 0.1*0.2 = 0.98.
        assert!((network_detection_probability(&[0.9, 0.8]) - 0.98).abs() < 1e-15);
        // Three 0.5 monitors: 1 - 0.5^3 = 0.875.
        assert!((network_detection_probability(&[0.5, 0.5, 0.5]) - 0.875).abs() < 1e-15);
        // Empty network never detects.
        assert_eq!(network_detection_probability(&[]), 0.0);
        // A single certain monitor gives certainty.
        assert!((network_detection_probability(&[1.0]) - 1.0).abs() < 1e-15);
    }

    // ORACLE: free-space inverse-square law. Path loss over range 1 m is 0 dB; doubling
    // the range adds 20*log10(2) ≈ 6.0206 dB; a 10x range adds exactly 20 dB.
    #[test]
    fn free_space_path_loss_is_inverse_square() {
        assert_eq!(free_space_path_loss_db(1.0), 0.0);
        assert_eq!(free_space_path_loss_db(0.5), 0.0); // clamped below 1 m
        assert!((free_space_path_loss_db(10.0) - 20.0).abs() < 1e-12);
        assert!((free_space_path_loss_db(100.0) - 40.0).abs() < 1e-12);
        // Doubling range: +6.0206 dB.
        let d1 = free_space_path_loss_db(1000.0);
        let d2 = free_space_path_loss_db(2000.0);
        assert!((d2 - d1 - 20.0 * 2.0_f64.log10()).abs() < 1e-12);
    }

    // ORACLE: crate::lunar_service::visible_sat_positions (the real selenographic
    // visibility gate) AND the closed-form local-horizon elevation identity. A station
    // that has the emitter below its horizon must NOT observe the event and must NOT
    // contribute to the network Pd — the composition with (b) is real.
    #[test]
    fn visibility_gate_is_the_lunar_service_geometry() {
        // Emitter high over the near-side equatorial prime meridian.
        let event = SpoofEvent {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 2.0e6, // orbital-scale altitude
            eirp_dbm: 30.0,
        };
        let mask = 5.0_f64.to_radians();

        // A station right under the emitter sees it high overhead.
        let near = SurfaceMonitor::new(0.0, 0.0, 0.0, nominal_floor_dbm(), 1.0);
        assert!(monitor_observes_event(&near, &event, mask));

        // A station on the far side (antipode) has the emitter below its local horizon.
        let far = SurfaceMonitor::new(0.0, std::f64::consts::PI, 0.0, nominal_floor_dbm(), 1.0);
        assert!(!monitor_observes_event(&far, &event, mask));

        // Cross-check against the lunar_service visibility function directly: the same
        // decision must fall out of visible_sat_positions on the same MCMF geometry.
        let emitter = [selenographic_to_mcmf(event.selenographic())];
        assert!(!visible_sat_positions(near.position_mcmf(), &emitter, mask).is_empty());
        assert!(visible_sat_positions(far.position_mcmf(), &emitter, mask).is_empty());

        // Closed-form elevation identity for the near station: emitter is straight up
        // (same lat/lon, higher altitude), so its elevation is +90° ≥ mask ⇒ visible.
        let up = {
            let u = near.position_mcmf();
            let n = (u[0] * u[0] + u[1] * u[1] + u[2] * u[2]).sqrt();
            [u[0] / n, u[1] / n, u[2] / n]
        };
        let d = {
            let e = emitter[0];
            let u = near.position_mcmf();
            let dv = [e[0] - u[0], e[1] - u[1], e[2] - u[2]];
            let n = (dv[0] * dv[0] + dv[1] * dv[1] + dv[2] * dv[2]).sqrt();
            [dv[0] / n, dv[1] / n, dv[2] / n]
        };
        let sin_el = d[0] * up[0] + d[1] * up[1] + d[2] * up[2];
        assert!(
            (sin_el - 1.0).abs() < 1e-9,
            "emitter straight up ⇒ el = 90°"
        );
    }

    // ORACLE: combination of the detection oracle, the AGC statistic, exact algebra, and
    // the lunar_service visibility gate on an explicit layout; also checks monotonicity
    // and that a station that cannot observe the event contributes nothing.
    #[test]
    fn vs_n_curve_is_sized_and_monotone() {
        let p_fa = 1e-3;
        let mask = 5.0_f64.to_radians();
        let floor = nominal_floor_dbm();
        // Emitter high over the prime meridian equator.
        let event = SpoofEvent {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 2.0e6,
            eirp_dbm: 60.0,
        };
        // Three stations clustered under the emitter (all observe it), plus one at the
        // antipode that cannot see it over the horizon.
        let small = 1.0e4 / R_MOON_M; // ~10 km arc east
        let on_event = |k: usize| SurfaceMonitor::new(0.0, k as f64 * small, 0.0, floor, 1.0);
        let monitors = vec![
            on_event(0),
            on_event(1),
            on_event(2),
            SurfaceMonitor::new(0.0, std::f64::consts::PI, 0.0, floor, 1.0),
        ];
        let res = detection_probability_vs_n(&monitors, &event, p_fa, mask);

        // Reconstruct the per-station Pd of the three observing stations from the oracles.
        let pds: Vec<f64> = monitors[..3]
            .iter()
            .map(|m| {
                let rx = spoof_power_at_monitor(&event, m);
                let (mu, sigma) = m.detection_statistic(rx);
                let gamma = detection_boundary(sigma, p_fa);
                analytic_pd(mu, sigma, gamma)
            })
            .collect();

        // N=1: single observing station equals its own analytic Pd.
        assert_eq!(res.curve[0].n_observing, 1);
        assert!((res.curve[0].network_pd - pds[0]).abs() < 1e-12);
        // N=3: three observing -> 1 - prod(1 - pd_i).
        let expect3 = 1.0 - pds.iter().map(|p| 1.0 - p).product::<f64>();
        assert_eq!(res.curve[2].n_observing, 3);
        assert!((res.curve[2].network_pd - expect3).abs() < 1e-12);
        // N=4: the antipodal station is over the horizon ⇒ observes nothing ⇒ adds nothing.
        assert_eq!(res.curve[3].n_observing, 3);
        assert!((res.curve[3].network_pd - expect3).abs() < 1e-12);

        // Curve is non-decreasing in N.
        for w in res.curve.windows(2) {
            assert!(w[1].network_pd >= w[0].network_pd - 1e-15);
        }
        // monitors_to_reach: one observing station already exceeds a bar just below pd0.
        assert_eq!(monitors_to_reach(&res, pds[0] - 1e-9), Some(1));
        assert_eq!(monitors_to_reach(&res, 1.0 + 1e-6), None);
    }

    // ORACLE: the geometric link budget. A station farther from the emitter sees more
    // free-space path loss ⇒ weaker spoof power ⇒ a smaller AGC mu ⇒ a lower (or equal)
    // per-monitor Pd. The geometry drives the statistic, not a per-station knob.
    #[test]
    fn farther_station_sees_weaker_spoof_and_lower_pd() {
        let floor = nominal_floor_dbm();
        let p_fa = 1e-3;
        let event = SpoofEvent {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 1.0e5,
            eirp_dbm: 90.0,
        };
        // Two identical stations: one under the emitter, one ~200 km east.
        let near = SurfaceMonitor::new(0.0, 0.0, 0.0, floor, 1.0);
        let far = SurfaceMonitor::new(0.0, 2.0e5 / R_MOON_M, 0.0, floor, 1.0);

        let rx_near = spoof_power_at_monitor(&event, &near);
        let rx_far = spoof_power_at_monitor(&event, &far);
        assert!(rx_far < rx_near, "farther station must see weaker spoof");

        let (mu_near, _) = near.detection_statistic(rx_near);
        let (mu_far, _) = far.detection_statistic(rx_far);
        assert!(mu_far < mu_near, "weaker spoof ⇒ smaller AGC excess");

        let pd_near = near.detection_power(rx_near, p_fa);
        let pd_far = far.detection_power(rx_far, p_fa);
        assert!(
            pd_far <= pd_near + 1e-15,
            "weaker spoof ⇒ lower Pd: near {pd_near} far {pd_far}"
        );
    }
}
