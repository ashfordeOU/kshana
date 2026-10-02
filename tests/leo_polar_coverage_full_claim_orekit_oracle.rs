// SPDX-License-Identifier: AGPL-3.0-only
//! LEO (low Earth orbit) coverage and dilution of precision (DOP) for polar and Arctic users
//! against MEO (medium Earth orbit) GNSS (global navigation satellite systems), FULL CLAIM:
//! the `leo-pvt` polar sweep from the scenario's element sets to the reported figures, with the
//! orbits propagated by SGP4/SDP4 (Simplified General Perturbations 4 / Simplified Deep-space
//! Perturbations 4) and carried to the Earth-fixed frame by the IAU (International
//! Astronomical Union) 2006/2000A chain. Verification-matrix row M131 (row 218). Package D8.
//!
//! This replaces nothing: the round-2 comparison on tabulated states
//! (`tests/leo_polar_coverage_orekit_oracle.rs`) stays as the geometry-only check. This file
//! is a fresh comparison whose oracle also propagates the orbits.
//!
//! QUANTITY: for every latitude of the sweep and each of the three groups (MEO GNSS systems
//! alone, LEO systems alone, every system), the mean number of satellites in view, the median
//! position, horizontal and vertical DOP (PDOP, HDOP, VDOP) over the samples with a fix, and
//! the availability (fraction of samples with a fix and PDOP at or below the threshold), as
//! `leo_fusion::polar::latitude_sweep_at` reports them; per sample (latitude, longitude,
//! epoch) the number of satellites of each system above that system's own elevation mask;
//! and the Earth-fixed position of every satellite at every epoch.
//!
//! ENGINE PATH UNDER TEST: each system's element sets (the constellation-design convention:
//! semi-major axis, eccentricity, inclination, Earth-fixed longitude of the ascending node at
//! the epoch, argument of perigee, mean anomaly) become SGP4 mean element sets at the sweep
//! epoch: Kozai mean motion `sqrt(mu / a^3)` with the WGS-72 (World Geodetic System 1972)
//! constants SGP4 is defined with, B* drag term zero, and the node's right ascension in TEME
//! (true equator, mean equinox) equal to the Earth-fixed node longitude plus the Greenwich
//! mean sidereal time of the epoch (the TEME-to-pseudo-Earth-fixed angle). `kshana::sgp4`
//! propagates them; `nutation::teme_to_gcrs` and `cio::gcrs_to_itrs` (IAU 2006/2000A, with
//! no Earth orientation parameters: UT1 = UTC and zero polar motion) give ITRS (International
//! Terrestrial Reference System) positions. The element sets the engine builds are exported to
//! the fixture and the test asserts the engine builds exactly those (bit for bit) from the
//! scenario, so the oracle receives the same element sets the polar mode runs.
//!
//! INPUTS: two configurations. A is the bundled scenario `scenarios/polar-arctic-leo-coverage.toml`
//! unchanged (GPS, Galileo and Iridium, every mask 10 deg, every clock estimated; latitudes
//! 0 to 80 deg by 10 and 89.9 deg, 8 longitudes, 13 epochs over two hours, PDOP threshold 6) at
//! the polar mode's reference epoch 2026-01-01T00:00:00 UTC. B is the round-2 variant
//! `tests/fixtures/leo_polar_coverage_orekit_oracle/variant_masks_clocks.toml` (masks 5, 15 and
//! 8 deg, Galileo on a known clock offset, 12 longitudes, 25 epochs) at the epoch
//! 2024-03-20T12:00:00 UTC.
//!
//! ORACLE (Library, with P2 for the multi-clock groups): Orekit 13.1.8 with Hipparchus 4.0.3
//! (Apache-2.0), run as a separate program. Each satellite an Orekit `TLE` built from the
//! committed element set in double precision (B* and the mean-motion derivatives zero),
//! propagated by `TLEPropagator.selectExtrapolator` (Orekit's own SGP4/SDP4 choice and WGS-72
//! constants); states transformed from TEME to `FramesFactory.getITRF(IERSConventions.IERS_2010,
//! true)` with no Earth orientation parameter files loaded (UT1 = UTC, zero pole offsets: the
//! engine's stated assumption). Sites on a WGS-84 `OneAxisEllipsoid`; visibility from
//! `TopocentricFrame.getElevation` against each system's mask; line-of-sight unit vectors in
//! the site's east-north-zenith frame. A group with one clock unknown: Orekit
//! `org.orekit.gnss.DOPComputer`. A group with several clock unknowns: NumPy 2.4.6
//! (BSD-3-Clause) `numpy.linalg.inv` of the normal matrix of the geometry matrix stacked from
//! Orekit's line-of-sight vectors with one clock column per clock unknown, a fix existing when
//! `numpy.linalg.matrix_rank` is full (P2 in docs/VALIDATION.md). The mean, median and
//! availability aggregation in the oracle script is plain counting and sorting.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-02):
//! * T1, propagation and frame: every satellite at every epoch within 2 m of Orekit's ITRF
//!   position. Derivation: SGP4 implementation floor (Kshana 4.12 mm worst on the 666 AIAA
//!   (American Institute of Aeronautics and Astronautics) vectors; Orekit is checked against
//!   the same vectors) of order 1 cm between two implementations, plus the TEME-to-ITRF
//!   convention difference between the engine (IAU 2000B nutation in the equation of the
//!   equinoxes with the two 1994 complementary terms, IAU 2006/2000A CIO (Celestial
//!   Intermediate Origin) chain) and Orekit (IERS 2010 conventions, equation of the equinoxes
//!   without those terms) bounded by 10 milliarcseconds, which is 1.5 m at the Galileo radius
//!   of 29 600 km; 2 m is the rounded sum.
//! * T2, in view: per-sample in-view counts per system identical on at least 99.5 % of the
//!   samples of each configuration, and every differing sample an elevation-boundary tie: some
//!   satellite within 1e-5 rad of its system's mask in Orekit's elevation (2 m seen from any
//!   slant range of 200 km or more).
//! * T3, the reported figures: per latitude and group, mean in view within 0.01; median PDOP,
//!   HDOP and VDOP within 1e-3 relative (and present on both sides or on neither);
//!   availability within 0.005 (the round-2 route's bars, unchanged).
//!
//! VERDICT: not yet run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn the_polar_sweep_from_element_sets_agrees_with_orekit_propagation_and_dop() {
    panic!("pre-registered; the comparison is written after the pre-registration commit");
}
