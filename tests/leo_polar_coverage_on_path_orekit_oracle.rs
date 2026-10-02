// SPDX-License-Identifier: AGPL-3.0-only
//! M131 (row 218), LEO (low Earth orbit) coverage and dilution of precision (DOP) for polar and
//! Arctic users against MEO (medium Earth orbit) GNSS: leg 3 of the three-leg oracle, the
//! geometry on the validated path. Package D8.
//!
//! Re-design disclosed: made after the round-1 full-claim comparison
//! (`leo_polar_coverage_full_claim_orekit_oracle.rs`) failed its position bar on Orekit's SDP4
//! at e = 0 and Orekit's TEME convention. Legs 1 and 2 (`earth_orbit_path_sgp4_erfa_oracle.rs`)
//! check propagation and frames against the reference SGP4 and SOFA; this leg hands Orekit the
//! engine's GCRS (Geocentric Celestial Reference System) positions, which carry no TEME
//! convention, and lets Orekit do the Earth-fixed rotation, visibility and DOP.
//!
//! QUANTITY: as in the round-1 file: per sample the in-view count per system; per latitude and
//! group the mean in view, median PDOP, HDOP and VDOP, availability; and the Earth-fixed
//! position of every satellite at every epoch.
//!
//! INPUTS: configurations A and B and their element sets exactly as committed for round 1
//! (`tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/`), and the engine's GCRS
//! position of every satellite at every epoch (`sgp4::SgpOrbit::gcrs_state`), exported by the
//! fixture writer before the oracle runs; the test asserts they are the engine's own.
//!
//! ORACLE (Library, with P2 for multi-clock groups): Orekit 13.1.8 with Hipparchus 4.0.3
//! (Apache-2.0): each GCRS position transformed to `FramesFactory.getITRF(IERSConventions.IERS_2010,
//! true)` by Orekit's GCRF -> ITRF transform (no Earth orientation parameters loaded); WGS 84
//! `TopocentricFrame` visibility against each system's mask; `DOPComputer` for one clock
//! unknown; NumPy 2.4.6 `linalg.inv`/`matrix_rank` for several (the round-1 driver and script,
//! with the propagation step replaced by the transform).
//!
//! TOLERANCE (fixed before this comparison, 2026-10-02):
//! * T1: Orekit's ITRF position within 0.2 m of the engine's ITRS position, every satellite and
//!   epoch. Source: both sides implement the IAU 2006/2000A CIO-based GCRS -> ITRS; 1 mas of
//!   implementation difference is 0.15 m at the Galileo radius of 29 600 km.
//! * T2 and T3: the round-1 bars, unchanged (in view identical on at least 99.5 % of samples,
//!   every difference a tie within 1e-5 rad of a mask; mean in view within 0.01, median DOP
//!   within 1e-3 relative, availability within 0.005).
//!
//! VERDICT: not yet run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn the_polar_sweep_on_the_validated_path_agrees_with_orekit_geometry_and_dop() {
    panic!("pre-registered; the comparison is written after the pre-registration commit");
}
