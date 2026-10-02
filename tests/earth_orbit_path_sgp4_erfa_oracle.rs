// SPDX-License-Identifier: AGPL-3.0-only
//! The one Earth-orbit path of package D8, legs 1 and 2 of the three-leg oracle: SGP4 element
//! sets propagated to TEME (true equator, mean equinox) against the reference SGP4, and the
//! TEME -> ITRS (International Terrestrial Reference System) and GCRS -> ITRS rotations of the
//! IAU (International Astronomical Union) 2006/2000A chain, with Earth orientation parameters,
//! against SOFA (Standards of Fundamental Astronomy) run as ERFA. New row, package D8.
//!
//! Why three legs: the round-1 full-claim comparisons (`leo_polar_coverage_full_claim_orekit_oracle.rs`,
//! `pass_predictor_apparent_orekit_oracle.rs`) compared the whole chain end to end against
//! Orekit and failed on two oracle-side causes, Orekit's SDP4 at e = 0 and Orekit's TEME
//! convention. This re-design, made after those results and disclosed as such, checks each leg
//! against the tool that defines its quantity; the geometry leg is
//! `leo_polar_coverage_on_path_orekit_oracle.rs` and `pass_predictor_on_path_orekit_oracle.rs`.
//! No bar below is derived from the measured 72 milliarcseconds.
//!
//! LEG 1, QUANTITY: the TEME position (m) of `sgp4::SgpOrbit::teme_state` for every committed
//! element set at every committed instant.
//! LEG 1, ORACLE (Reference): python-sgp4 2.24 (MIT licence; D. Vallado's reference C++ SGP4,
//! the code that produced the AIAA 2006-6753 verification vectors), `Satrec.sgp4init` with
//! WGS-72 and the improved mode 'i', `Satrec.sgp4` at the same instants.
//! LEG 1, TOLERANCE: 1 cm per position. Source: the engine reproduces the 666 AIAA vectors,
//! which python-sgp4 generates, to 4.12 mm worst; two implementations each within that floor of
//! the vectors differ by at most about 1 cm.
//!
//! LEG 2, QUANTITY: the rotation matrices `sgp4::teme_to_itrs_matrix_eop(utc, eop)` and
//! `sgp4::gcrs_to_itrs_matrix_eop(utc, eop)` (with `teme_to_itrs_matrix` and
//! `gcrs_to_itrs_matrix` the zero-parameter case), compared as the rotation angle of
//! `R_kshana * R_oracle^T` (arcseconds).
//! LEG 2, ORACLE (Reference): pyerfa 2.0.1.5 (liberfa 2.0.1, BSD-3-Clause; the SOFA routines as
//! released by the ERFA project). GCRS -> ITRS is `erfa.c2t06a(tt1, tt2, ut11, ut12, xp, yp)`
//! with TT from `erfa.utctai`/`erfa.taitt` and UT1 from `erfa.utcut1`. TEME -> ITRS composes
//! the SOFA quantities with the definition the engine states for TEME (the true equator of
//! date with the mean equinox, Vallado et al. 2006): `c2t06a · pnm06a^T · rz(-ee06a)`, where
//! `rz` is `erfa.rz`; every matrix and angle in that product is computed by ERFA.
//! LEG 2, TOLERANCE: GCRS -> ITRS within 0.1 milliarcsecond (the engine implements the same
//! IAU 2006/2000A CIO-based (Celestial Intermediate Origin) algorithms, checked bit-level against
//! SOFA vectors; 0.1 mas covers the TIO locator and series-evaluation order). TEME -> ITRS
//! within 2 milliarcseconds: the engine's TEME -> GCRS uses the IAU 2000B nutation (published
//! to agree with 2000A within 1 mas over 1995 to 2050, McCarthy and Luzum 2003) and two of the
//! complementary terms of the equation of the equinoxes (the rest are below 10 microarcseconds);
//! 2 mas doubles that budget.
//!
//! INPUTS (committed by the fixture writer before the oracle runs): leg 1, the 228 element sets
//! of `tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/elements_{A,B}.csv` at their
//! sweep epochs (13 and 25), and the four element sets of
//! `tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.csv` every hour over their 24-hour
//! windows; leg 2, every distinct instant of leg 1 with zero Earth orientation parameters, plus
//! 24 instants from 2016 to 2026 (two per year at 03:17:42.5 on 2 February and 5 August, and
//! 2016-12-31T23:59:59.5) with UT1 - UTC, x_p and y_p from the fixed list
//! (-0.62, 0.35, 0.05) s and (0.21, -0.07, 0.38) and (0.45, 0.29, -0.12) arcsec, cycled.
//!
//! VERDICT: not yet run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn the_earth_orbit_path_agrees_with_the_reference_sgp4_and_sofa() {
    panic!("pre-registered; the comparison is written after the pre-registration commit");
}
