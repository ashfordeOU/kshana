// SPDX-License-Identifier: AGPL-3.0-only
//! EO (Earth observation) payload footprint and coverage geometry, the full row, against
//! Orekit 12.2 and GeographicLib.
//!
//! PRE-REGISTRATION (written 2026-10-01, round 2, before the engine change, before the fixture
//! exists and before either oracle is run).
//!
//! QUANTITIES: every number the row claims (module `eo_payload`): Earth angular radius
//! `earth_angular_radius(h)`, swath width `swath_width(half_fov, h)`, nadir ground sample distance
//! `nadir_gsd(h, ifov)`, maximum off-nadir access ground range (`ground_range(min(slew, rho), h)`),
//! circular period `circular_period(h)`, the J2 nodal period and the equatorial ground-track
//! (ascending-node) spacing `ground_track_spacing_equator_j2(h, i)` = R_e (omega_E - dOmega/dt)
//! T_nodal (to be added to the engine; the current R_e omega_E T omits the nodal regression), and
//! the contiguous-coverage flag `swath >= spacing`.
//!
//! ENGINE CONVENTION, fixed now: the altitude h defines the mean semi-major axis a = R_e + h in the
//! first-order Brouwer sense; dOmega/dt, domega/dt and dM/dt are the first-order J2 secular rates
//! of `forces::j2_secular_rates` (e = 0); T_nodal = 2 pi / (n + dM/dt + domega/dt). Constants are
//! Kshana's: mu = 3.986004418e14 m^3/s^2, R_e = 6 378 137 m, J2 = 1.08262668e-3, omega_E =
//! 7.2921151467e-5 rad/s.
//!
//! GRID: altitude h in {400, 550, 700, 850, 1000, 1200, 1500} km; inclination i in {1, 30, 51.6,
//! 70, 90, 98} deg (i = 0 is excluded: an equatorial orbit has no ascending node, so the node
//! spacing is undefined; the critical inclination 63.4 deg is not on the grid); half field of view
//! {7.5, 25, 40, 50} deg (all below the smallest Earth angular radius on the grid, 54.06 deg at
//! 1500 km); instantaneous field of view (IFOV) {10, 14, 50} microradians; slew limit {30, 89} deg
//! (89 deg is clamped to the Earth angular radius, the horizon).
//!
//! ORACLE 1 (Library): Orekit 12.2 (Apache-2.0), run as a separate program
//! (`tests/fixtures/eo_payload_coverage_orekit_oracle/EoCoverageOrekitDriver.java`).
//!  - Sphere geometry: `OneAxisEllipsoid(R_e, f = 0)`. Satellite at (R_e + h, 0, 0) in the body
//!    frame. Angular radius: the angle at the satellite between the body centre and
//!    `Ellipsoid.pointOnLimb`. Swath: twice R_e times the central angle between the sub-satellite
//!    point and `getIntersectionPoint` of the ray at the half field of view from nadir; second
//!    swath oracle from `CircularFieldOfView.getFootprint` (nadir-pointing, the same half
//!    aperture): twice R_e times the mean central angle of the footprint points. Nadir GSD: R_e
//!    times the central angle between the intersections of the rays at +IFOV/2 and -IFOV/2.
//!    Maximum access: R_e times the central angle to `getIntersectionPoint` of the ray at the slew
//!    angle when it is below the angular radius, otherwise to `pointOnLimb` (a tangent ray's
//!    intersection is ill-conditioned). Circular period: `KeplerianOrbit.getKeplerianPeriod()`.
//!  - J2 dynamics: `NumericalPropagator` (DormandPrince853, position tolerance 1e-6 m) with
//!    `NewtonianAttraction(mu)` and `J2OnlyPerturbation(mu, R_e, J2, EME2000)` only. Initial state:
//!    Orekit's `BrouwerLyddanePropagator` (J2 = Kshana's, J3 = J4 = J5 = 0, `PropagationType.MEAN`)
//!    converts the mean elements a = R_e + h, e = 1e-3, i, RAAN 0, argument of perigee 0, mean
//!    anomaly -30 deg into the osculating state at the epoch. A `NodeDetector` (EME2000) records
//!    at least 15 ascending nodes (>= 14 revolutions). T_nodal = least-squares slope of node time
//!    against node index; node spacing = R_e times |least-squares slope of the node longitude in
//!    a frame turning at omega_E (right ascension of the node minus omega_E t, unwrapped)|.
//!  - Contiguous flag (oracle): Orekit swath >= Orekit node spacing.
//! ORACLE 2 (Library): Orekit 12.2 `OneAxisEllipsoid` WGS-84 (a = 6 378 137 m, f =
//!    1/298.257223563) `pointOnLimb` for a satellite at geodetic altitude h over geodetic latitude
//!    0 (limb to the north and to the east), 45 (limb to the north and to the south) and 90 deg
//!    (limb toward longitude 0); limb angle measured from the geocentric nadir. GeographicLib 2.x
//!    (Karney, MIT licence, Python) `Geodesic.WGS84.Inverse` gives the geodesic distance from the
//!    geocentric sub-satellite point (the ellipsoid point on the line to the centre) to the limb
//!    point.
//!
//! TOLERANCES (fixed now; sources: the round 2 plan for the sphere, period, node and flag bars;
//! the existing test's 0.3 deg and 0.5 % bars for the WGS-84 comparison):
//!  - angular radius, swath (both swath oracles), maximum access: relative 1e-9;
//!  - nadir GSD: relative 1e-7. Deviation from the plan's 1e-9, justified before running: h IFOV
//!    is a small-angle form whose exact-arc difference is k (k + 1) IFOV^2 / 24 (k = (R_e + h) /
//!    R_e), at most 2.6e-10 on the grid, but the oracle's arc is a difference of two ground points
//!    6.4e6 m from the centre spanning 4 to 75 m, so a few units in the last place of the
//!    coordinates (about 1e-9 m each) are already 1e-9 of the arc;
//!  - circular period: relative 1e-12;
//!  - J2 nodal period and node spacing: relative 1e-3 (0.1 %) at every grid point;
//!  - contiguous flag: equal at every (h, i, half field of view) point, except points where
//!    Kshana's swath / spacing ratio is within +-0.1 % of 1. That exempt list is computed from the
//!    engine alone and committed in `exempt_flag_points.txt` before the oracle is run;
//!  - WGS-84: sphere angular radius within 0.3 deg of the Orekit WGS-84 limb angle; sphere maximum
//!    ground range R_e (pi/2 - rho) within 0.5 % of the GeographicLib geodesic distance.
//!
//! Any failure leaves the row MODELLED with the gap recorded; no bar changes after the run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn eo_coverage_matches_orekit_and_geographiclib() {
    unimplemented!("pre-registered: fixture and engine function not yet present");
}
