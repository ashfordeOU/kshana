// SPDX-License-Identifier: AGPL-3.0-only
//! External-oracle validation of the equivalent-degrees-of-freedom (EDF)
//! computation in `kshana::assurance::uncertainty::edf` for the **modified
//! Allan (MVAR)**, **overlapping Hadamard (HVAR)** and **total (TOTVAR)**
//! variance estimators — not just the overlapping Allan variance (AVAR), which
//! was already covered.
//!
//! # Independent oracle
//!
//! The reference values in `tests/fixtures/edf/edf_reference.json` are produced
//! by **allantools** (a widely used, independently developed open-source
//! frequency-stability library), via
//!
//!   * `allantools.ci.edf_greenhall(alpha, d, m, N, overlapping, modified)` —
//!     the Greenhall & Riley (2003 PTTI / 2004 UFFC) *combined-EDF*
//!     basis-function algorithm (weight kernels `sw/sx/sz`, Eqns 7-9, and
//!     `BasicSum`, Eqn 10). Used for MVAR (`d = 2`, modified filter) and the
//!     overlapping HVAR (`d = 3`, unmodified filter).
//!   * `allantools.ci.edf_totdev(N, m, alpha)` — TOTVAR EDF from NIST SP 1065
//!     Table 7 (`b·(N/m) − c`).
//!
//! allantools is itself validated against **Stable32**, the commercial
//! reference implementation, so agreement here is a genuine cross-codebase
//! check. kshana carries its **own** Rust port of the Greenhall algorithm and
//! the Table-7 form (see `src/assurance/uncertainty.rs`); it does not call
//! allantools. The fixture is regenerable offline with
//! `tests/fixtures/edf/generate_s1_edf_reference.py`.
//!
//! # Honest scope
//!
//! This validates the uniquely-defined EDF **kernel** for all four variance
//! types (AVAR/MVAR/HVAR/TOTVAR). Completing the MVAR/HVAR/TOTVAR EDF means the
//! chi-square `confidence_interval()` built on `edf()` is now correct for those
//! estimators too, not only for AVAR. The choice of estimator, averaging-factor
//! ladder, noise-type identification and any downstream device/scenario
//! composition remain Modelled and are out of scope for this test.

use std::path::Path;

use kshana::assurance::uncertainty::{edf, NoiseType, VarType};

/// One reference case parsed from the committed JSON fixture.
struct Case {
    var: VarType,
    noise: NoiseType,
    n: usize,
    m: usize,
    edf: f64,
}

fn noise_from_str(s: &str) -> NoiseType {
    match s {
        "WhitePM" => NoiseType::WhitePM,
        "FlickerPM" => NoiseType::FlickerPM,
        "WhiteFM" => NoiseType::WhiteFM,
        "FlickerFM" => NoiseType::FlickerFM,
        "RandomWalkFM" => NoiseType::RandomWalkFM,
        other => panic!("unknown noise type in fixture: {other}"),
    }
}

fn var_from_str(s: &str) -> VarType {
    match s {
        "Allan" => VarType::Allan,
        "Modified" => VarType::Modified,
        "Hadamard" => VarType::Hadamard,
        "Total" => VarType::Total,
        other => panic!("unknown var type in fixture: {other}"),
    }
}

/// Minimal hand-rolled extraction of the fixture's `cases` array. The fixture
/// is emitted by our generator with a stable, flat shape, so a tiny scanner
/// avoids pulling in a JSON dependency for a test.
fn load_cases() -> Vec<Case> {
    let path = Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests")
        .join("fixtures")
        .join("edf")
        .join("edf_reference.json");
    let text = std::fs::read_to_string(&path)
        .unwrap_or_else(|e| panic!("cannot read fixture {}: {e}", path.display()));

    // Isolate the "cases": [ ... ] array and split on object boundaries.
    let start = text.find("\"cases\"").expect("fixture missing \"cases\"");
    let arr_start = text[start..].find('[').expect("cases not an array") + start;
    let arr_end = text[arr_start..].find(']').expect("cases array unclosed") + arr_start;
    let body = &text[arr_start + 1..arr_end];

    let mut cases = Vec::new();
    for chunk in body.split('}') {
        if !chunk.contains('{') {
            continue;
        }
        let obj = &chunk[chunk.find('{').unwrap() + 1..];
        let get_str = |key: &str| -> String {
            let k = format!("\"{key}\"");
            let ki = obj
                .find(&k)
                .unwrap_or_else(|| panic!("case missing {key}: {obj}"));
            let after = &obj[ki + k.len()..];
            let colon = after.find(':').unwrap();
            let rest = after[colon + 1..].trim_start();
            let q1 = rest.find('"').unwrap();
            let q2 = rest[q1 + 1..].find('"').unwrap() + q1 + 1;
            rest[q1 + 1..q2].to_string()
        };
        let get_num = |key: &str| -> f64 {
            let k = format!("\"{key}\"");
            let ki = obj
                .find(&k)
                .unwrap_or_else(|| panic!("case missing {key}: {obj}"));
            let after = &obj[ki + k.len()..];
            let colon = after.find(':').unwrap();
            let rest = after[colon + 1..].trim_start();
            let end = rest.find([',', '\n', '}']).unwrap_or(rest.len());
            rest[..end].trim().parse::<f64>().unwrap()
        };

        cases.push(Case {
            var: var_from_str(&get_str("var")),
            noise: noise_from_str(&get_str("noise")),
            n: get_num("n") as usize,
            m: get_num("m") as usize,
            edf: get_num("edf"),
        });
    }
    assert!(
        cases.len() >= 40,
        "expected a well-populated EDF grid, got {} cases",
        cases.len()
    );
    cases
}

fn rel_err(got: f64, want: f64) -> f64 {
    ((got - want) / want).abs()
}

/// Relative tolerance. kshana's MVAR/HVAR port reproduces allantools'
/// Greenhall algorithm essentially bit-for-bit (same finite-difference kernel
/// evaluated in `f64`); TOTVAR is an identical closed form. 1e-6 leaves only
/// floating-point summation-order slack while still being far tighter than the
/// ~1% agreement that would pass a mere "same ballpark" check.
const TOL: f64 = 1e-6;

#[test]
fn edf_matches_allantools_over_full_grid() {
    let cases = load_cases();
    let mut checked = 0usize;
    for c in &cases {
        let got = edf(c.noise, c.n, c.m, c.var);
        assert!(
            got.is_finite() && got > 0.0,
            "kshana edf({:?}, N={}, m={}, {:?}) = {got}, expected finite positive",
            c.noise,
            c.n,
            c.m,
            c.var
        );
        let err = rel_err(got, c.edf);
        assert!(
            err < TOL,
            "EDF mismatch for {:?}/{:?} N={} m={}: kshana={got}, allantools={} (rel err {err:.3e} >= {TOL:.0e})",
            c.var,
            c.noise,
            c.n,
            c.m,
            c.edf
        );
        checked += 1;
    }
    assert!(
        checked >= 40,
        "too few EDF cases actually checked: {checked}"
    );
}

/// Per-VarType known-answer anchors, so a regression is legible even if the
/// fixture is regenerated. Values are the allantools oracle outputs for
/// N=1000, m=10 (see the fixture / generator).
#[test]
fn edf_mvar_kat() {
    // MVAR White FM: allantools edf_greenhall(0, 2, 10, 1000, ov=True, mod=True).
    assert!(
        rel_err(
            edf(NoiseType::WhiteFM, 1000, 10, VarType::Modified),
            94.537_488_6
        ) < 1e-5
    );
}

#[test]
fn edf_hvar_kat() {
    // HVAR White FM: allantools edf_greenhall(0, 3, 10, 1000, ov=True, mod=False).
    assert!(
        rel_err(
            edf(NoiseType::WhiteFM, 1000, 10, VarType::Hadamard),
            113.582_592_6
        ) < 1e-5
    );
}

#[test]
fn edf_hvar_white_pm_case4_kat() {
    // HVAR White PM exercises the alpha=2 closed-form (case 4) branch:
    // allantools edf_greenhall(2, 3, 10, 1000, ov=True, mod=False) = 422.743407.
    assert!(
        rel_err(
            edf(NoiseType::WhitePM, 1000, 10, VarType::Hadamard),
            422.743_406_6
        ) < 1e-5
    );
}

#[test]
fn edf_totvar_kat() {
    // TOTVAR White FM: allantools edf_totdev(1000, 10, 0) = 1.50*(N/m) = 150.
    assert!(rel_err(edf(NoiseType::WhiteFM, 1000, 10, VarType::Total), 150.0) < 1e-9);
    // TOTVAR Random-Walk FM: 0.93*(1000/10) - 0.36 = 92.64.
    assert!(
        rel_err(
            edf(NoiseType::RandomWalkFM, 1000, 10, VarType::Total),
            92.64
        ) < 1e-9
    );
}

/// Sanity that the three completed variance types genuinely differ from the
/// Allan EDF at the same inputs (i.e. the `var` argument is now load-bearing,
/// not the old `let _ = var;` no-op that returned the Allan EDF regardless).
#[test]
fn edf_var_argument_is_load_bearing() {
    let n = 1000;
    let m = 10;
    let noise = NoiseType::WhiteFM;
    let allan = edf(noise, n, m, VarType::Allan);
    let mvar = edf(noise, n, m, VarType::Modified);
    let hvar = edf(noise, n, m, VarType::Hadamard);
    let totvar = edf(noise, n, m, VarType::Total);
    // Each differs from the Allan EDF by more than rounding.
    assert!(
        (mvar - allan).abs() / allan > 1e-3,
        "MVAR must differ from AVAR"
    );
    assert!(
        (hvar - allan).abs() / allan > 1e-3,
        "HVAR must differ from AVAR"
    );
    assert!(
        (totvar - allan).abs() / allan > 1e-3,
        "TOTVAR must differ from AVAR"
    );
}
