// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered external validation of the "Lunar frame datum from a REAL observing
//! campaign" row (`kind = "lunar-llr-datum"`, module `lunar_llr`).
//!
//! ## The quantity
//!
//! The seven-parameter Helmert datum covariance that the measured lunar laser ranging
//! (LLR) schedule and the measured per-point weights buy, for the stated reduced parameter
//! set (the 15 body-fixed retroreflector coordinates, mapped to three translations, three
//! small rotations and one scale). Concretely, each of these, as the engine emits them:
//!
//! * the seven Helmert standard deviations (`helmert.parameters[k].sigma`, metres,
//!   microradians, parts per million) and the three norms in `datum_accuracy`
//!   (translation sigma norm, rotation sigma norm, scale sigma in parts per billion);
//! * the rank of the 15 x 15 reflector information matrix and of the 7 x 7 Helmert
//!   information matrix, and the inter-array coupling of the former;
//! * the Helmert condition number (largest over smallest observable eigenvalue);
//! * per array, the ratio of the formal sigma across the mean line of sight to the sigma
//!   along it (`reflectors[i].ratio_across_over_along`, the row's 50.7x to 71.7x);
//! * the bookkeeping: 349 normal points parsed, 337 used, 12 skipped because their station
//!   has no ITRF2020 position;
//! * the observed-minus-computed one-way residual RMS (the row's 156,494 m), read as what
//!   the row says it is: the size of the gap between the engine's modelled light time and a
//!   full-fidelity one.
//!
//! ## The inputs (all already committed, none produced by the engine)
//!
//! The fifteen ILRS (International Laser Ranging Service) CRD (Consolidated Laser Ranging
//! Data format) normal-point files under `tests/fixtures/lunar_llr/normal_points/` (their
//! SHA-256 digests are pinned in `SHA256SUMS`), the IERS (International Earth Rotation and
//! Reference Systems Service) ITRF2020 (International Terrestrial Reference Frame 2020)
//! station catalogue and the JPL (Jet Propulsion Laboratory) DE430 Table 7 mean-Earth
//! retroreflector catalogue in the same directory. The oracle reads the CRD files ITSELF:
//! epochs, station and target identifiers, two-way times of flight, bin RMS (root mean
//! square) and raw-range counts, and forms each weight as `1 / (bin_rms / sqrt(n_raw))^2`.
//!
//! ## The oracle (Library + P2)
//!
//! * **Library — the two-way light time.** NAIF (Navigation and Ancillary Information
//!   Facility) SPICE toolkit N0067 through `spiceypy` 8.2.0 (MIT licence; the CSPICE
//!   toolkit and the kernels are US Government work distributed free by NAIF), with the
//!   kernels `de440.bsp` (planetary and lunar ephemeris), `earth_latest_high_prec.bpc`
//!   (ITRF93 Earth orientation, with polar motion and UT1), `moon_pa_de440_200625.bpc` plus
//!   `moon_de440_250416.tf` (the DE440 lunar principal-axis orientation and the mean-Earth
//!   frame `MOON_ME` that the DE430 Table 7 coordinates are stated in) and `naif0012.tls`
//!   (leap seconds). Each station is made an ephemeris object (a type-13 SPK segment
//!   sampled from its ITRF2020 position and velocity rotated by the ITRF93 kernel), and
//!   SPICE's own converged light-time solvers give the up-leg (`spkcpt`, reflector as a
//!   constant `MOON_ME` point, transmission correction `XCN`) and the down-leg (`spkcpo`,
//!   reflector as a constant observer, `XCN`). The partial of the two-way time of flight
//!   with respect to each reflector coordinate is a central finite difference (step 100 m)
//!   of those SPICE light times, so it shares no expression with the engine's analytic
//!   `(u_up + u_down) / c` partial. Every link the engine models only approximately — the
//!   analytic Moon series, the IAU (International Astronomical Union) 2015 rotation model,
//!   no polar motion, UT1 - UTC = 0 — is replaced by its JPL or IERS kernel.
//! * **P2 — the linear algebra.** numpy 2.3.5 (BSD-3-Clause, calling LAPACK, the Linear
//!   Algebra PACKage) forms `M = J^T W J`, the Helmert design `A = [I | [p]x | p]` in the
//!   engine's stated units (metres, microradians, parts per million — the parameterisation
//!   is the row's definition, an input), `H = A^T M A`, and inverts it with
//!   `numpy.linalg.inv`; ranks and the condition number come from `numpy.linalg.eigvalsh`
//!   with the same relative eigenvalue threshold (1e-9) the engine states.
//!
//! The generator is `tests/fixtures/llr_datum_spice/gen_llr_datum_spice.py`; its output is
//! committed so the test needs no Python at run time.
//!
//! ## Tolerances, fixed before the first comparison
//!
//! * **Seven Helmert sigmas and the three norms: 1 % relative.** Source: the row's own
//!   measured geometry sensitivity. The engine's analytic Moon is off by at most 0.054 deg
//!   in line-of-sight direction over this span (measured against JPL Horizons in
//!   `tests/lunar_llr_real_data.rs`), and re-solving the datum with every partial tilted
//!   by 0.1 deg (sign alternating) moves it by 0.288 %. The IAU 2015 versus DE440
//!   orientation difference is about 5e-4 rad at most, smaller again. So 1 % covers the
//!   known model gap with margin, while a factor-two partial, a wrong weight
//!   (`bin_rms` without `/sqrt(n)`), a dropped leg or wrong libration handling moves the
//!   answer by tens of per cent and fails.
//! * **Ranks: exact** (15 of 15 reflector, 7 of 7 Helmert). **Inter-array coupling:
//!   exactly 0** on both sides.
//! * **Helmert condition number: 2 % relative** (a ratio of two eigenvalues, each inside
//!   the 1 % budget above).
//! * **Per-array across/along ratio: 2 % relative.** The along-sight sigma is the tightest
//!   number in the block, so a direction error delta adds about `(delta * ratio)^2` to its
//!   variance: for delta = 0.054 deg and ratio 72 that is 0.5 % in variance, 0.25 % in
//!   sigma; the across sigma moves with the datum budget (1 %). 2 % covers both.
//! * **Bookkeeping: exact** (349 parsed, 337 used, 12 skipped for an uncatalogued station).
//! * **Residual RMS: 1e-3 relative** between the engine's reported residual RMS and the RMS
//!   over the same points of `c/2 * (tau_SPICE - tau_engine)`, where `tau_engine` is the
//!   engine's own `llr_geometry` light time. The two differ only by the SPICE model's own
//!   observed-minus-computed, which the oracle must hold under **100 m RMS** (a pre-stated
//!   self-check on the oracle: troposphere, tides, station eccentricity and relativistic
//!   delay are a few metres at most); 100 m over 156 km is 6.4e-4, inside 1e-3.
//!
//! ## What this does not validate
//!
//! The figures are a Cramér-Rao bound for the stated reduced parameter set on a measured
//! schedule, not an LLR accuracy; a real LLR solution co-estimates the orbit, librations,
//! Earth orientation, station coordinates and more. The simulated-campaign comparison the
//! report prints (345x, 36x, 24x) divides by the simulated campaign's figures, which belong
//! to the separate "Lunar frame datum from an observing campaign" row; this test validates
//! only the measured side of those ratios.

use kshana::api::run_toml;
use serde_json::Value;

#[allow(dead_code)]
const REFERENCE: &str = "tests/fixtures/llr_datum_spice/reference.txt";
#[allow(dead_code)]
const POINTS: &str = "tests/fixtures/llr_datum_spice/points.csv";

/// Relative tolerance on the seven Helmert sigmas and the three norms.
#[allow(dead_code)]
const SIGMA_REL_TOL: f64 = 1.0e-2;
/// Relative tolerance on the Helmert condition number.
#[allow(dead_code)]
const CONDITION_REL_TOL: f64 = 2.0e-2;
/// Relative tolerance on each array's across/along sigma ratio.
#[allow(dead_code)]
const RATIO_REL_TOL: f64 = 2.0e-2;
/// Relative tolerance between the reported residual RMS and the engine-versus-SPICE gap.
#[allow(dead_code)]
const RESIDUAL_REL_TOL: f64 = 1.0e-3;
/// Pre-stated bound on the oracle's own observed-minus-computed RMS (m).
#[allow(dead_code)]
const ORACLE_OC_RMS_MAX_M: f64 = 100.0;

#[allow(dead_code)]
fn report() -> Value {
    let out = run_toml("kind = \"lunar-llr-datum\"\n").expect("the real-data scenario runs");
    serde_json::from_str(&out.json).expect("the report parses")
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn llr_datum_covariance_matches_spice_light_time_and_numpy_inverse() {
    unimplemented!("pre-registration: the comparison is written after this commit");
}
