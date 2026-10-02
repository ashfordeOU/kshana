// SPDX-License-Identifier: AGPL-3.0-only
//! Ground-station pass prediction on the validated propagation and frame path, with
//! tropospheric refraction (ITU-R P.834-9, International Telecommunication Union
//! Radiocommunication Sector Recommendation P.834) and light time. New row, package D8.
//!
//! The existing VALIDATED row "Ground-station pass prediction (ground segment)" covers the
//! geometric rise/set scheduler `passes::predict_passes` on a Keplerian ephemeris and is not
//! changed. This file pre-registers a new comparison for a new method,
//! `passes::predict_passes_apparent`.
//!
//! ENGINE PATH UNDER TEST: a satellite given as SGP4 (Simplified General Perturbations 4) mean
//! elements with a two-part Julian date epoch (`sgp4::SgpOrbit`), propagated by `kshana::sgp4`
//! and carried TEME -> GCRS -> ITRS by `nutation::teme_to_gcrs` and `cio::gcrs_to_itrs`
//! (IAU 2006/2000A; no Earth orientation parameters: UT1 = UTC, zero polar motion). A station
//! on the WGS-84 ellipsoid. Options: refraction (the apparent elevation is the free-space
//! elevation plus the ITU-R P.834-9 equation (14) correction for the station height) and
//! light time (the station receives at `t` the signal the satellite emitted at `t - tau`,
//! `tau` solved by fixed-point iteration on the geocentric celestial positions; no aberration).
//! Rise and set (AOS, acquisition of signal; LOS, loss of signal) are solved by bracketing on a
//! sampling grid and refining the apparent elevation's crossing of the mask; the maximum
//! elevation and its time (TCA) by a bounded one-dimensional maximisation.
//!
//! QUANTITY: per pass, AOS, LOS (reception times, s from the window start), TCA and maximum
//! apparent elevation (deg), and the number of passes; at sample instants inside passes, the
//! apparent azimuth and elevation (deg).
//!
//! INPUTS (committed as `tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.json`,
//! written by the generator from these fixed rules before the oracle is run): four element
//! sets, each circular or near-circular SGP4 mean elements with B* zero: (1) the bundled
//! `scenarios/passes.toml` orbit, 550 km, 97.6 deg; (2) 420 km, 51.6 deg, e = 0.0005;
//! (3) 780 km, 86.4 deg; (4) 1200 km, 87.9 deg, e = 0.001; each with a node and initial mean
//! anomaly from a fixed list. Five sea-level stations (height 0 m, where the ITU-R P.834 height
//! terms vanish): 52.2 N 0 E; 0 N 30 E; 78.2 N 15.4 E; 33.9 S 18.5 E; 64.8 N 147.5 W. Masks 0, 5
//! and 10 deg. A 24-hour window from 2026-01-01T00:00:00 UTC for element sets 1 and 3 and from
//! 2024-06-21T06:00:00 UTC for 2 and 4, each element set's epoch at its window start. Sample
//! instants for Q4: every 30 s inside every Q1 pass, from AOS rounded up.
//!
//! ORACLE (Library): Orekit 13.1.8 with Hipparchus 4.0.3 (Apache-2.0), run as a separate
//! program. The satellite an Orekit `TLE` from the same element set in double precision,
//! `TLEPropagator.selectExtrapolator`; the station a `TopocentricFrame` (for the detectors) and
//! a `GroundStation` (for the measurement model) on a WGS-84 `OneAxisEllipsoid` in
//! `FramesFactory.getITRF(IERSConventions.IERS_2010, true)` with no Earth orientation parameter
//! files loaded. Refraction: `ITURP834AtmosphericRefraction(0.0)`.
//! * Q1 (refraction and light time on, the `passes` scenario default): Orekit `AngularAzEl`
//!   theoretical evaluation (`estimateWithoutDerivatives`, which solves the downlink light
//!   time) with `AngularRadioRefractionModifier`; AOS and LOS are the roots of its apparent
//!   elevation minus the mask, solved by Hipparchus `BracketingNthOrderBrentSolver` on brackets
//!   of +/- 2 s around the Q2 events; the maximum by Hipparchus `BrentOptimizer` on +/- 30 s
//!   around Orekit's `ElevationExtremumDetector` event.
//! * Q2 (refraction on, light time off): `ElevationDetector.withConstantElevation(mask)
//!   .withRefraction(...)` with `EventsLogger`, max check 10 s, threshold 1e-6 s; maximum
//!   elevation from `ElevationExtremumDetector` with the refraction model applied to it.
//! * Q3 (both off): the same detectors without refraction.
//! * Q4 (both on): the apparent azimuth and elevation of the Q1 model at the sample instants.
//!
//! The P.834 coefficient of `h * theta0^2` in equation (14) reads 0.01380 in the
//! Recommendation and 0.011380 in Orekit 13.1.8's `ITURP834AtmosphericRefraction` (read in
//! Orekit's source before this pre-registration, when choosing the oracle calls). The term
//! vanishes at height 0, which is why every station of the strict comparison is at sea level;
//! the engine implements the Recommendation's printed value. A separate gated test will pin
//! the size of that difference for heights of 0.5 to 3 km as a disclosed oracle finding.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-02). Derivation: the engine's and
//! Orekit's Earth-fixed positions differ by the SGP4 floor (order 1 cm) plus the TEME-to-ITRF
//! convention difference (at most 10 milliarcseconds: 0.4 m at a LEO radius of 7 600 km),
//! which seen from the shortest slant range of these cases (about 400 km) is at most 1e-6 rad
//! (5.7e-5 deg) of direction; the elevation rate at a mask crossing of a non-grazing pass is
//! above 0.01 deg/s.
//! * Pass count identical, except that a pass whose maximum apparent elevation is within
//!   1e-3 deg of the mask (on either side's figure) may appear on one side only (a tie).
//! * Matched passes: AOS and LOS within 5 ms when the maximum elevation exceeds the mask by
//!   0.5 deg or more, within 0.5 s otherwise (grazing passes, where the crossing is flat);
//!   a crossing clamped to the window edge compares the clamped value; maximum elevation
//!   within 1e-3 deg; TCA within 0.5 s (the maximum is flat in time).
//! * Q4: apparent elevation within 1e-4 deg and the angle between the two apparent directions
//!   within 1e-4 deg at every sample instant.
//!
//! VERDICT: not yet run.

#[test]
#[ignore = "pre-registered; not yet run"]
fn apparent_passes_with_refraction_and_light_time_agree_with_orekit() {
    panic!("pre-registered; the comparison is written after the pre-registration commit");
}
