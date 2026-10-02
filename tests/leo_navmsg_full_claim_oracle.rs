// SPDX-License-Identifier: AGPL-3.0-only
//! M120 round 2: the parts of the LEO broadcast-ephemeris fitter row that round 1 left outside
//! its narrowed claim (the along/cross/radial correction polynomials of `kepler-rac`, the clock
//! fit net of the user's relativistic term, the update-period trade, and Kshana's integrated
//! truth orbit), each against an independent oracle on real data or an independent library.
//!
//! Pre-registration (written 2026-10-02, committed before the GRACE-FO clock data was fetched,
//! before the Orekit driver was written and before any comparison was run). The round-1 part
//! (the 16-parameter fit against Liu et al. 2025 on four real orbits) is unchanged and stays in
//! `tests/leo_navmsg_fit_real_orbit_oracle.rs`.
//!
//! ## Part A: correction polynomials, clock fit and update-period trade on a real satellite
//!
//! Real truth: GRACE-FO 1 (GRACE-C) on 2024-01-01, its TU Graz ITSG reduced-dynamic orbit (the
//! round-1 fixture `leo_navmsg_fit_real_orbit_oracle/grace_c_2024-01-01.csv`) and its measured
//! onboard clock from the GRACE-FO Level-1B product CLK1B (JPL release 04, file
//! `gracefo_1B_2024-01-01_RL04.ascii.noLRI.tgz` from the GFZ Information System and Data Center,
//! https://isdc-data.gfz.de/grace-fo/Level-1B/JPL/INSTRUMENT/RL04/2024/), satellite C, the
//! ultra-stable oscillator's offset `eps_time`. The apparent clock offset a navigation message
//! would carry is taken as receiver time minus GPS time; the generator puts it on the orbit's
//! 10 s grid by linear interpolation (numpy) if CLK1B is not already on it, and the same grid
//! values feed both Kshana (through a measured-clock variant of `leo_navmsg::truth::TruthClock`
//! that interpolates the samples linearly and adds nothing) and the oracle. If CLK1B for that
//! day cannot be obtained without an account, Part A runs without the clock and the clock part is
//! reported BLOCKED.
//!
//! Kshana: `leo_navmsg::sequence_stats` with models `kepler16` and `kepler-rac` with degrees
//! [7, 5, 6] (the degrees the module documents as the ones that remove the residual), with the
//! measured clock, for (fit interval, update period) = (1200, 600), (1200, 1200), (1800, 900)
//! and (1800, 1800) s, usage periods from 00:15 GPS time over 84 600 s, 10 s fit samples and
//! 10 s evaluation step, SISRE weights `sisre_weights(mean radius, 0)`.
//!
//! Oracle: an independent Python implementation (numpy, BSD-3-Clause) written from the
//! Galileo OS SIS ICD user algorithm and the module's documented model, reading only the
//! message parameters Kshana produced (exported to the fixture) and the truth files:
//! (1) the Keplerian position, the along/cross/radial frame and the relativistic term
//! `F e sqrt(A) sin E`; (2) the correction polynomials refitted by `numpy.linalg.lstsq` to the
//! truth minus the Keplerian position at the fit samples, in `tau = tk / tau_s`; (3) the clock
//! polynomial refitted by `numpy.linalg.lstsq` to the apparent clock minus the relativistic term
//! at the fit samples, in `t - toc`; (4) the error statistics over every usage period (RMS
//! along, cross, radial, clock times c, orbit-only SISRE and SISRE with clock).
//!
//! Tolerances (fixed now): (2) every refitted correction value at every fit sample within
//! 1e-4 m of Kshana's; (3) every refitted clock value at every fit sample within 1e-12 s of
//! Kshana's; (4) every statistic of every (model, interval, period) within 1e-4 m (clock RMS and
//! SISRE with clock included). Kshana's messages must reproduce the exported ones bit for bit.
//!
//! ## Part B: the integrated truth orbit against Orekit
//!
//! Oracle: Orekit 12.2 (CS GROUP, Apache-2.0) `NumericalPropagator` with a DormandPrince853
//! integrator (absolute position tolerance 1e-6 m), from Kshana's own node-0 state, in a frame
//! that is Kshana's pseudo-inertial frame, with a body frame turned about z by
//! `theta0 + OMEGA_E t`: two-body (`MU` 3.986004418e14); zonal J2 to J6 as Kshana's constants
//! through `HolmesFeatherstoneAttractionModel`; EGM2008 read by Orekit's own ICGEM reader from
//! `tools/egm2008_to70.gfc` truncated at the case's degree and order, with Orekit's
//! `NewtonianAttraction` at the file's GM; drag through `DragForce` and `IsotropicDrag`
//! (area = `cd_area_over_mass`, drag coefficient 1, mass 1 kg) in an atmosphere co-rotating with
//! the body frame whose density is Kshana's 28-band piecewise-exponential table at spherical
//! altitude `|r| - 6378137 m` (the same density input; the oracle checks the dynamics and the
//! integration, not the density model).
//! Cases: altitude 550 km, inclination 53 deg, eccentricity 0.001, node 30 deg, perigee 40 deg,
//! mean anomaly 50 deg, theta0 1.0 rad, step 5 s, 6 h, with gravity degree 0, 6, 20 and 70; and
//! altitude 400 km, degree 20 with drag (`cd_area_over_mass` 0.01 m^2/kg).
//! Quantity: Earth-fixed position (`TruthOrbit::state_ecef` at the nodes) every 60 s.
//! Tolerance (fixed now): the largest three-dimensional difference over the 6 h of each case is
//! at most 0.02 m (the truth must reproduce its dynamics well below the centimetre-to-decimetre
//! fit residuals it is used to measure: Liu et al. 2025's 16-parameter RMS components run from
//! 0.89 to 97 cm).
//!
//! PROMOTE the full row only if Parts A and B both agree; otherwise each part's outcome is
//! reported and the strict test of a disagreeing part stays ignored with the measured gap.

#[test]
#[ignore = "pre-registered; not yet run"]
fn corrections_clock_fit_and_update_period_trade_match_an_independent_implementation_on_grace_fo() {
    todo!("implemented after the fixture is fetched")
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h() {
    todo!("implemented after the Orekit driver is written")
}
