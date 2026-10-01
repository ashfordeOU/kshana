// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered external validation of the "Lunar surface-beacon DOP augmentation" row
//! (`kind = "lunar-beacon"`, module `lunar_beacon`).
//!
//! ## The quantity
//!
//! For a lunar surface user: which satellites clear the elevation mask, which surface
//! beacons clear the airless-Moon horizon, and the dilution of precision (DOP: geometric,
//! position, horizontal, vertical and time — GDOP, PDOP, HDOP, VDOP, TDOP) of the design
//! matrix that stacks the visible satellite rows and the visible beacon rows. Concretely:
//!
//! * the row's own golden geometry, exactly as `kind = "lunar-beacon"` runs it by default:
//!   user at -80 deg latitude, 0 deg longitude, 2 m antenna; beacons at (-80, 0), (-79, 60)
//!   and (-79, -60) deg, each 2000 m above the mean sphere; the illustrative six-satellite
//!   and 24-satellite LCNS-class (Lunar Communications and Navigation Services) element
//!   sets at t = 0; 5 deg mask. Every DOP in all three report rows, the visible satellite
//!   and beacon counts (5 satellites, 1 of 3 beacons), and the two PDOP improvement factors
//!   (2.355 and 4.002);
//! * **near-boundary cases** added so that an exact match discriminates (the golden case
//!   alone does not: its flanking beacons sit 333 km away against an 86 km horizon):
//!   beacons placed at straight-line ranges of the exact two-height horizon sum plus and
//!   minus 10 m, 100 m and 1 km, for user heights 2 m and 50 m and beacon heights 10 m and
//!   2000 m (a horizon formula missing the `h^2` term is 24 m short at 2000 m and fails the
//!   10 m cases); synthetic satellites at 5 deg plus and minus 0.001, 0.01 and 0.1 deg of
//!   elevation at several azimuths; and a three-beacon low-elevation configuration (beacons
//!   60 km out at azimuths 0, 120 and 240 deg, 2000 m high) whose DOP with the six
//!   satellites is compared as well, so a beacon that actually adds horizontal geometry is
//!   inside the comparison.
//!
//! ## The oracle (Library + P2)
//!
//! * **Library — visibility and look angles.** ANISE 0.10.6 (the Rust reimplementation of
//!   the NAIF SPICE toolkit, Python bindings, Mozilla Public Licence 2.0, Nyx Space):
//!   satellite states built from the stated Keplerian elements with ANISE's own
//!   element-to-Cartesian conversion (`Orbit.from_keplerian_mean_anomaly`, Moon GM as
//!   stated by the engine); azimuth and elevation of every satellite and beacon from the
//!   user with `Almanac.azimuth_elevation_range_sez`; beacon line of sight with
//!   `Almanac.line_of_sight_obstructed`, the Moon as the obstructing body (frame
//!   `IAU_MOON`, radius 1737.4 km from NAIF `pck00011.tpc`, the same sphere the engine
//!   uses). Kshana's geometry is therefore checked, not fed to the oracle: the only shared
//!   inputs are the stated elements, sites, heights and mask. At t = 0 the engine's
//!   mean-rotation Moon-fixed frame coincides with its inertial frame (rotation angle zero),
//!   a stated convention of the illustrative constellation.
//! * **P2 — the DOP.** numpy 2.4 (BSD-3-Clause, LAPACK `inv`) on the design matrix whose
//!   rows are `[-e_SEZ, 1]`, with `e_SEZ` the unit line of sight rebuilt from ANISE's
//!   azimuth and elevation in the user's south-east-zenith frame.
//!
//! Generator: `tests/fixtures/lunar_beacon_anise/gen_lunar_beacon_anise.py`; its output is
//! committed so the test needs no Python at run time.
//!
//! ## Tolerances, fixed before the first comparison
//!
//! * Visible satellite sets and visible beacon sets: **exact** in every case.
//! * Every DOP component and both improvement factors: **1e-9 relative**.
//!
//! ## What this does not validate (P2 scoping, stated rather than implied)
//!
//! The metres. The per-beacon user-equivalent ranging error is a root-sum-square of three
//! illustrative magnitudes (1.0, 0.5 and 0.3 m) and `sigma = DOP x sigma_URE` is a scalar
//! multiplication; both are closed forms outside P2 and outside this comparison. The
//! constellation, the beacon placement and the heights are illustrative inputs: per P2 the
//! validated claim is visibility plus DOP on this committed geometry, not the accuracy of a
//! fielded service.

#[allow(dead_code)]
const REFERENCE: &str = "tests/fixtures/lunar_beacon_anise/reference.txt";

/// Relative tolerance on every DOP and improvement factor.
#[allow(dead_code)]
const DOP_REL_TOL: f64 = 1.0e-9;

#[test]
#[ignore = "pre-registered; not yet run"]
fn beacon_visibility_and_augmented_dop_match_anise_and_numpy() {
    unimplemented!("pre-registration: the comparison is written after this commit");
}
