// SPDX-License-Identifier: AGPL-3.0-only
//! Sparse-monitor-network detection sizing: **how many surveyed, known-location
//! monitor receivers does it take to catch a wide-area / orbital-scale spoof or jam?**
//!
//! This turns the P1 "Defense Layer-3" assertion — *a handful of fixed, surveyed
//! monitor stations catch an area event* — into a **sized** result: the probability
//! that at least one monitor raises an alert, as a function of the monitor count `N`.
//!
//! # Model
//!
//! Each monitor is a surveyed surface station on an airless spherical body (the Moon,
//! by default [`crate::lunar::R_MOON_M`]). Its **coverage footprint** is the surface
//! disk it has line of sight to, whose great-circle radius is the horizon ground range
//! for its antenna height ([`horizon_ground_range_m`], the exact spherical horizon arc
//! `R·acos(R/(R+h))`). A spoof / jam **event** illuminates a
//! surface disk (the region an orbital or wide-area transmitter can reach). A monitor
//! *participates* in detecting the event when its footprint overlaps the event disk —
//! a plain two-disk great-circle overlap test on the sphere.
//!
//! Every participating monitor runs the **same two-sided energy detector** as the rest
//! of the stack: it forms a `N(·, σ²)` discrepancy statistic and alerts on
//! `(y/σ)² > λ` for a fixed target false-alarm probability `P_fa`. Its per-monitor
//! detection power `P_d` is read straight off the closed form in [`crate::detection`]
//! ([`crate::detection::analytic_pd`] at the boundary
//! [`crate::detection::detection_boundary`]). The **network** raises an alert when *any*
//! participating monitor does, so the miss events multiply and
//!
//! ```text
//!   P_net(N) = 1 − ∏_{i : monitor i covers the event} (1 − P_d,i)
//! ```
//!
//! is exact probability algebra under conditionally-independent per-monitor noise.
//!
//! # Validated vs Modelled
//!
//! * **Validated.** The per-monitor `P_d` is the closed-form analytic detection power
//!   of the two-sided χ²₁ energy detector — asserted equal, to machine precision, to
//!   [`crate::detection::analytic_pd`] for the same `(μ, σ, P_fa)` (which is itself
//!   cross-checked against Monte-Carlo in `detection.rs`). The network combination
//!   `1 − ∏(1 − P_d,i)` is exact probability algebra, asserted against hand-computed
//!   values for small `N`. The coverage radius is the exact spherical horizon arc
//!   `R·acos(R/(R+h))` ([`horizon_ground_range_m`]), asserted against the independent
//!   small-height tangent oracle `√(2Rh)`, and the great-circle geometry is asserted
//!   against closed-form quarter- and half-arc cases.
//! * **Modelled.** The *placement* of the monitors, the event footprint size, and the
//!   assumption that per-monitor detector noise is independent are representative
//!   engineering choices, not measured facts. They fix *which* monitors participate and
//!   *how strong* each one's statistic is; the detection mathematics applied to them is
//!   Validated.
//!
//! Deterministic: no wall-clock, no RNG.

use crate::detection::{analytic_pd, detection_boundary};

/// Great-circle (surface arc) radius, in metres, of the surface disk an object at height
/// `height_m` above a sphere of radius `radius_m` has line of sight to: the exact
/// spherical horizon arc `d = R·acos(R/(R+h))` (the central angle whose cosine is
/// `R/(R+h)`, times `R`). Use this for footprint/coverage areas on the surface.
pub fn horizon_ground_range_m(radius_m: f64, height_m: f64) -> f64 {
    radius_m * (radius_m / (radius_m + height_m)).acos()
}

/// A surveyed, fixed-location monitor station on the surface.
///
/// `lat_rad` / `lon_rad` are selenographic (body-fixed) latitude and longitude in
/// radians. `coverage_radius_m` is the great-circle radius of the surface disk the
/// station can observe (typically its horizon ground range). `mu` and `sigma` are the
/// H1 mean and the 1σ noise of the station's detection statistic — i.e. the strength of
/// the spoof/jam signature it forms and the noise it forms it against; together with
/// `P_fa` they set the station's per-monitor `P_d`.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct SurfaceMonitor {
    /// Selenographic latitude of the station, radians.
    pub lat_rad: f64,
    /// Selenographic longitude of the station, radians.
    pub lon_rad: f64,
    /// Great-circle radius of the station's surface coverage disk, metres.
    pub coverage_radius_m: f64,
    /// Mean of the station's detection statistic under H1 (spoof/jam present).
    pub mu: f64,
    /// 1σ noise of the station's detection statistic.
    pub sigma: f64,
}

impl SurfaceMonitor {
    /// Construct a monitor whose coverage radius is the horizon ground range of an
    /// antenna at height `antenna_height_m` above a sphere of radius `body_radius_m`,
    /// via [`horizon_ground_range_m`]. `mu` / `sigma` describe the station's detection
    /// statistic (see [`SurfaceMonitor`]).
    pub fn from_horizon(
        lat_rad: f64,
        lon_rad: f64,
        antenna_height_m: f64,
        body_radius_m: f64,
        mu: f64,
        sigma: f64,
    ) -> Self {
        SurfaceMonitor {
            lat_rad,
            lon_rad,
            coverage_radius_m: horizon_ground_range_m(body_radius_m, antenna_height_m),
            mu,
            sigma,
        }
    }

    /// Per-monitor detection power `P_d` for this station at target false-alarm
    /// probability `p_fa`, using the two-sided energy detector: the boundary is
    /// [`crate::detection::detection_boundary`] and the power is
    /// [`crate::detection::analytic_pd`]. This is the **Validated** per-monitor value.
    pub fn detection_power(&self, p_fa: f64) -> f64 {
        let gamma = detection_boundary(self.sigma, p_fa);
        analytic_pd(self.mu, self.sigma, gamma)
    }
}

/// A wide-area / orbital-scale spoof or jam event illuminating a surface disk.
///
/// `lat_rad` / `lon_rad` are the selenographic centre of the illuminated region;
/// `radius_m` is its great-circle radius on the surface.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct SpoofEvent {
    /// Selenographic latitude of the illuminated-region centre, radians.
    pub lat_rad: f64,
    /// Selenographic longitude of the illuminated-region centre, radians.
    pub lon_rad: f64,
    /// Great-circle radius of the illuminated region, metres.
    pub radius_m: f64,
}

/// Great-circle (surface arc) distance in metres between two selenographic points on a
/// sphere of radius `body_radius_m`, via the numerically-stable haversine form
/// `d = R · 2·atan2(√a, √(1−a))`, `a = sin²(Δφ/2) + cosφ₁·cosφ₂·sin²(Δλ/2)`.
pub fn great_circle_distance_m(
    lat1_rad: f64,
    lon1_rad: f64,
    lat2_rad: f64,
    lon2_rad: f64,
    body_radius_m: f64,
) -> f64 {
    let dlat = lat2_rad - lat1_rad;
    let dlon = lon2_rad - lon1_rad;
    let a = (dlat * 0.5).sin().powi(2)
        + lat1_rad.cos() * lat2_rad.cos() * (dlon * 0.5).sin().powi(2);
    let a = a.clamp(0.0, 1.0);
    let c = 2.0 * a.sqrt().atan2((1.0 - a).sqrt());
    body_radius_m * c
}

/// Whether a monitor participates in detecting an event: its coverage disk overlaps the
/// event's illuminated disk on the surface, i.e. the great-circle distance between their
/// centres is no greater than the sum of the two radii.
pub fn monitor_covers_event(
    monitor: &SurfaceMonitor,
    event: &SpoofEvent,
    body_radius_m: f64,
) -> bool {
    let d = great_circle_distance_m(
        monitor.lat_rad,
        monitor.lon_rad,
        event.lat_rad,
        event.lon_rad,
        body_radius_m,
    );
    d <= monitor.coverage_radius_m + event.radius_m
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
    /// How many of those deployed monitors actually cover the event footprint.
    pub n_covering: usize,
    /// Network detection probability `1 − ∏(1 − P_d,i)` over the covering monitors.
    pub network_pd: f64,
}

/// Sized detection result for a sparse monitor network against one event.
#[derive(Debug, Clone, PartialEq)]
pub struct NetworkDetectionResult {
    /// Target per-monitor false-alarm probability used for every station.
    pub p_fa: f64,
    /// Body radius used for the surface geometry, metres.
    pub body_radius_m: f64,
    /// The event analysed.
    pub event: SpoofEvent,
    /// Detection-probability-versus-`N` curve, `n_monitors = 1..=monitors.len()`.
    pub curve: Vec<NetworkDetectionPoint>,
    /// Per-monitor detection power of every monitor that covers the event (in monitor
    /// order) — the coverage geometry that drives the curve.
    pub covering_pd: Vec<f64>,
    /// Great-circle distance (m) from each monitor to the event centre (in monitor
    /// order), whether or not it covers the event.
    pub distances_m: Vec<f64>,
}

/// Compute detection probability versus monitor count `N` for a sparse network against
/// a single event: for each prefix `monitors[..N]`, take the per-monitor `P_d` of the
/// monitors whose footprint overlaps the event and combine them with
/// [`network_detection_probability`]. Returns the full curve plus the coverage geometry.
///
/// The curve is non-decreasing in `N` (adding a monitor can only add a non-negative
/// detection term to the product), so it directly answers "how many monitors to reach a
/// target network `P_d`".
pub fn detection_probability_vs_n(
    monitors: &[SurfaceMonitor],
    event: &SpoofEvent,
    p_fa: f64,
    body_radius_m: f64,
) -> NetworkDetectionResult {
    let mut distances_m = Vec::with_capacity(monitors.len());
    let mut covering_pd = Vec::new();
    let mut curve = Vec::with_capacity(monitors.len());

    for (i, m) in monitors.iter().enumerate() {
        distances_m.push(great_circle_distance_m(
            m.lat_rad,
            m.lon_rad,
            event.lat_rad,
            event.lon_rad,
            body_radius_m,
        ));
        if monitor_covers_event(m, event, body_radius_m) {
            covering_pd.push(m.detection_power(p_fa));
        }
        // Network Pd over every covering monitor among the first (i+1) deployed.
        let network_pd = network_detection_probability(&covering_pd);
        curve.push(NetworkDetectionPoint {
            n_monitors: i + 1,
            n_covering: covering_pd.len(),
            network_pd,
        });
    }

    NetworkDetectionResult {
        p_fa,
        body_radius_m,
        event: *event,
        curve,
        covering_pd,
        distances_m,
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
    use crate::lunar::R_MOON_M;

    // ORACLE: crate::detection analytic two-sided energy detector. The per-monitor Pd
    // must equal detection::analytic_pd at the detection_boundary for the same (mu,
    // sigma, p_fa) — the Validated per-monitor value.
    #[test]
    fn per_monitor_pd_matches_detection_oracle() {
        let mu = 4.0;
        let sigma = 1.0;
        let p_fa = 1e-3;
        let m = SurfaceMonitor {
            lat_rad: 0.0,
            lon_rad: 0.0,
            coverage_radius_m: 1.0e5,
            mu,
            sigma,
        };
        let gamma = detection_boundary(sigma, p_fa);
        let oracle = analytic_pd(mu, sigma, gamma);
        assert!((m.detection_power(p_fa) - oracle).abs() < 1e-15);
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

    // ORACLE: closed-form great-circle arcs on a sphere of radius R.
    #[test]
    fn great_circle_closed_form_arcs() {
        let r = R_MOON_M;
        let pi = std::f64::consts::PI;
        // Same point -> 0.
        assert!(great_circle_distance_m(0.3, 0.7, 0.3, 0.7, r).abs() < 1e-6);
        // Equator quarter turn (lon 0 -> pi/2) -> R * pi/2.
        let quarter = great_circle_distance_m(0.0, 0.0, 0.0, pi / 2.0, r);
        assert!((quarter - r * pi / 2.0).abs() < 1e-3);
        // Antipodal along the equator (lon 0 -> pi) -> R * pi.
        let half = great_circle_distance_m(0.0, 0.0, 0.0, pi, r);
        assert!((half - r * pi).abs() < 1e-3);
        // Pole to equator -> R * pi/2.
        let pole = great_circle_distance_m(pi / 2.0, 0.0, 0.0, 0.0, r);
        assert!((pole - r * pi / 2.0).abs() < 1e-3);
    }

    // ORACLE: independent small-height tangent length sqrt(2*R*h). For h << R the
    // spherical horizon arc R*acos(R/(R+h)) reduces to sqrt(2*R*h) (central angle
    // theta ~ sqrt(2h/R), arc = R*theta). The from_horizon coverage radius must equal
    // the horizon_ground_range_m closed form and agree with the tangent oracle.
    #[test]
    fn coverage_radius_matches_horizon_and_tangent_oracle() {
        let h = 10.0;
        let m = SurfaceMonitor::from_horizon(0.0, 0.0, h, R_MOON_M, 4.0, 1.0);
        assert_eq!(m.coverage_radius_m, horizon_ground_range_m(R_MOON_M, h));
        assert!(m.coverage_radius_m > 0.0);
        let tangent = (2.0 * R_MOON_M * h).sqrt();
        // h/R ~ 6e-6, so the arc and the tangent oracle agree to a few parts in 1e5.
        assert!((m.coverage_radius_m - tangent).abs() / tangent < 1e-4);
    }

    #[test]
    fn coverage_overlap_test() {
        // A monitor with a 100 km footprint at the origin.
        let m = SurfaceMonitor {
            lat_rad: 0.0,
            lon_rad: 0.0,
            coverage_radius_m: 1.0e5,
            mu: 4.0,
            sigma: 1.0,
        };
        // Event centred 50 km away (small angle) with a 10 km radius overlaps.
        let near_lon = 5.0e4 / R_MOON_M; // arc 50 km at the equator
        let near = SpoofEvent {
            lat_rad: 0.0,
            lon_rad: near_lon,
            radius_m: 1.0e4,
        };
        assert!(monitor_covers_event(&m, &near, R_MOON_M));
        // Event far away (arc ~ 500 km) with a 10 km radius does not overlap.
        let far_lon = 5.0e5 / R_MOON_M;
        let far = SpoofEvent {
            lat_rad: 0.0,
            lon_rad: far_lon,
            radius_m: 1.0e4,
        };
        assert!(!monitor_covers_event(&m, &far, R_MOON_M));
    }

    // ORACLE: combination of the detection oracle and exact algebra on an explicit
    // 3-monitor layout; also checks the curve is non-decreasing and the geometry.
    #[test]
    fn vs_n_curve_is_sized_and_monotone() {
        let p_fa = 1e-3;
        let sigma = 1.0;
        let gamma = detection_boundary(sigma, p_fa);
        // Three identical monitors all sitting on the event, plus one far away that
        // does not cover it.
        let big = 5.0e5;
        let on_event = |lon: f64, mu: f64| SurfaceMonitor {
            lat_rad: 0.0,
            lon_rad: lon,
            coverage_radius_m: big,
            mu,
            sigma,
        };
        let mu = 3.5;
        let monitors = vec![
            on_event(0.0, mu),
            on_event(1.0e4 / R_MOON_M, mu),
            on_event(2.0e4 / R_MOON_M, mu),
            SurfaceMonitor {
                lat_rad: 0.0,
                lon_rad: std::f64::consts::PI, // antipode, cannot cover
                coverage_radius_m: 1.0e3,
                mu,
                sigma,
            },
        ];
        let event = SpoofEvent {
            lat_rad: 0.0,
            lon_rad: 0.0,
            radius_m: 5.0e4,
        };
        let res = detection_probability_vs_n(&monitors, &event, p_fa, R_MOON_M);

        let pd1 = analytic_pd(mu, sigma, gamma);
        // N=1: single covering monitor.
        assert_eq!(res.curve[0].n_covering, 1);
        assert!((res.curve[0].network_pd - pd1).abs() < 1e-12);
        // N=3: three covering -> 1 - (1-pd1)^3.
        let expect3 = 1.0 - (1.0 - pd1).powi(3);
        assert_eq!(res.curve[2].n_covering, 3);
        assert!((res.curve[2].network_pd - expect3).abs() < 1e-12);
        // N=4: the antipodal monitor adds nothing.
        assert_eq!(res.curve[3].n_covering, 3);
        assert!((res.curve[3].network_pd - expect3).abs() < 1e-12);

        // Curve is non-decreasing in N.
        for w in res.curve.windows(2) {
            assert!(w[1].network_pd >= w[0].network_pd - 1e-15);
        }
        // monitors_to_reach: with pd1 high, one monitor already exceeds a modest bar.
        assert_eq!(monitors_to_reach(&res, pd1 - 1e-9), Some(1));
        assert_eq!(monitors_to_reach(&res, 1.0 + 1e-6), None);
    }
}
