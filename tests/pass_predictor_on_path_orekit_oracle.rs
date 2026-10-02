// SPDX-License-Identifier: AGPL-3.0-only
//! Apparent ground-station pass prediction with ITU-R P.834-9 refraction and light time: leg 3
//! of the three-leg oracle, the geometry on the validated path. Package D8.
//!
//! Re-design disclosed: made after the round-1 comparison
//! (`pass_predictor_apparent_orekit_oracle.rs`) held every pass bar but missed the sampled
//! direction bar through Orekit's TEME convention. Legs 1 and 2
//! (`earth_orbit_path_sgp4_erfa_oracle.rs`) check propagation and frames against the reference
//! SGP4 and SOFA. In this leg Orekit propagates the same element sets with `TLEPropagator`
//! (all four orbits are near-Earth SGP4, where Orekit and the reference agree) but in a TEME
//! frame Orekit builds itself to the definition the engine states: a child of Orekit's
//! `FramesFactory.getTOD(IERSConventions.IERS_2010, true)` rotated by Orekit's IERS 2010
//! equation of the equinoxes (`IERSConventions.IERS_2010.getEquationOfEquinoxesFunction`), so
//! the convention is fixed and every rotation is Orekit's.
//!
//! QUANTITY, INPUTS, CASES: exactly those of the round-1 file (60 cases: four element sets, five
//! sea-level stations, masks 0, 5 and 10 deg, 24 hours; Q1 refraction and light time, Q2
//! refraction, Q3 neither, Q4 apparent azimuth and elevation every 30 s inside the Q1 passes),
//! read from `tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.csv`.
//!
//! ORACLE (Library): Orekit 13.1.8 with Hipparchus 4.0.3 (Apache-2.0); the round-1 driver with
//! the TEME frame replaced as above; no Earth orientation parameters loaded.
//!
//! TOLERANCE (the round-1 bars, unchanged, fixed 2026-10-02 in e947e69d): pass counts identical
//! except ties within 1e-3 deg of the mask; AOS and LOS within 5 ms (0.5 s for grazing passes
//! whose maximum is under 0.5 deg above the mask); maximum elevation within 1e-3 deg; TCA
//! within 0.5 s; Q4 apparent elevation and direction within 1e-4 deg. Their derivation now
//! holds: the frames differ by the IAU 2000B/2000A nutation difference (under 1 mas, 0.04 m
//! at LEO radius, 1e-7 rad from 400 km).
//!
//! VERDICT: not yet run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn apparent_passes_on_the_validated_path_agree_with_orekit() {
    panic!("pre-registered; the comparison is written after the pre-registration commit");
}
