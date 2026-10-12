// SPDX-License-Identifier: AGPL-3.0-only
//! Fresh-data comparison of the lunar laser ranging (LLR) frame datum on the ANALYTIC Moon (the
//! `lunar-llr-datum` default): normal points from 2025, a year no test in this repository had
//! used, against the unchanged independent SPICE light-time and NumPy oracle, at the bars of the
//! original comparison.
//!
//! ## Pre-registration
//!
//! `docs/design/evidence/mr06-llr-analytic-fresh/PREREGISTRATION.md`, committed alone (31f5283)
//! before any normal point of the slice was fetched, listed or opened. In short:
//!
//! * **Slice:** the ILRS CRD v2 monthly normal-point files of the EUROLAS Data Center (EDC,
//!   DGFI-TUM), `https://edc.dgfi.tum.de/pub/slr/data/npt_crd_v2/<target>/2025/<target>_2025<mm>.np2`,
//!   five targets, 2025-04..06, committed verbatim and stored as `*.npt` (the only transform; both
//!   readers glob `*.npt`). Years already used: 2015, 2019, 2024.
//! * **Sufficiency:** at least 100 points used and Helmert rank 7 on both sides, or the quarter
//!   moves on.
//! * **Engine:** `lunar-llr-datum` with only `normal_points_dir` set (analytic Moon, IAU 2015
//!   orientation, the committed catalogues, selection rules, weights and 1e-9 threshold).
//! * **Oracle (unchanged code):** `tests/fixtures/llr_datum_spice/gen_llr_datum_spice.py` through
//!   `tests/fixtures/llr_datum_analytic_fresh_2025/run_oracle.py`; self-check SPICE O-C RMS < 100 m.
//! * **Bars (6b27964a, unchanged):** sigmas and norms 1 %, condition 2 %, across/along ratios
//!   2 %, bookkeeping, ranks and per-array counts equal, coupling exactly 0.
//! * **Outcome:** all hold, the analytic-default row is proposed VALIDATED (a Library check of the
//!   covariance computation on measured schedules and weights, not an LLR accuracy and not a
//!   test of the Moon model); any fails, a finding.
//!
//! ## Result (2026-10-12, first run after the pre-registration commit; not tuned)
//!
//! RESULT_PLACEHOLDER

use kshana::api::run_toml;
use serde_json::Value;
use std::collections::HashMap;

const FIX: &str = "tests/fixtures/llr_datum_analytic_fresh_2025";

const SIGMA_REL_TOL: f64 = 1.0e-2;
const CONDITION_REL_TOL: f64 = 2.0e-2;
const RATIO_REL_TOL: f64 = 2.0e-2;
const ORACLE_OC_RMS_MAX_M: f64 = 100.0;
const MIN_USED: usize = 100;

fn report(kernel: bool) -> Value {
    let mut toml =
        format!("kind = \"lunar-llr-datum\"\nnormal_points_dir = \"{FIX}/normal_points\"\n");
    if kernel {
        toml.push_str(&format!(
            "planetary_kernel_path = \"{FIX}/de440s_2025-03-31_2025-07-02.bsp\"\n"
        ));
    }
    let out = run_toml(&toml).expect("the fresh-slice scenario runs");
    serde_json::from_str(&out.json).expect("the report parses")
}

fn num(v: &Value, p: &str) -> f64 {
    v.pointer(p)
        .and_then(Value::as_f64)
        .unwrap_or_else(|| panic!("no number at {p}"))
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

struct Reference {
    scalars: HashMap<String, f64>,
    sigmas: HashMap<String, f64>,
    arrays: HashMap<String, (usize, f64)>,
}

fn reference() -> Reference {
    let text = std::fs::read_to_string(format!("{FIX}/reference.txt"))
        .expect("the oracle output is committed");
    let mut r = Reference {
        scalars: HashMap::new(),
        sigmas: HashMap::new(),
        arrays: HashMap::new(),
    };
    for line in text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
    {
        let f: Vec<&str> = line.split_whitespace().collect();
        match f[0] {
            "sigma" => {
                r.sigmas.insert(f[1].to_string(), f[2].parse().unwrap());
            }
            "array" => {
                r.arrays.insert(
                    f[1].to_string(),
                    (f[2].parse().unwrap(), f[5].parse().unwrap()),
                );
            }
            k => {
                r.scalars.insert(k.to_string(), f[1].parse().unwrap());
            }
        }
    }
    r
}

/// (name, engine, oracle, relative gap, bar) for every banded quantity; the exact checks are
/// asserted inside.
fn comparisons(v: &Value, kernel: bool) -> Vec<(String, f64, f64, f64, f64)> {
    let r = reference();
    let s = |k: &str| {
        *r.scalars
            .get(k)
            .unwrap_or_else(|| panic!("oracle has no {k}"))
    };
    let oc = s("oracle_oc_rms_m");
    assert!(
        oc < ORACLE_OC_RMS_MAX_M,
        "SPICE's own O-C RMS {oc} m breaks the pre-stated {ORACLE_OC_RMS_MAX_M} m: oracle void"
    );
    let used = num(v, "/data/normal_points_used") as usize;
    assert!(used >= MIN_USED, "INSUFFICIENT: {used} points used");
    assert_eq!(
        num(v, "/helmert/rank") as usize,
        7,
        "INSUFFICIENT: engine Helmert rank"
    );
    assert_eq!(
        s("helmert_rank") as usize,
        7,
        "INSUFFICIENT: oracle Helmert rank"
    );
    // The analytic default carries no moon_ephemeris block; the kernel path names its kernel.
    assert_eq!(
        v.pointer("/moon_ephemeris/source").and_then(Value::as_str),
        kernel.then_some("kernel")
    );
    assert_eq!(
        num(v, "/data/normal_points_parsed") as usize,
        s("parsed") as usize
    );
    assert_eq!(used, s("used") as usize);
    assert_eq!(
        num(v, "/data/skipped_station_not_in_catalogue") as usize,
        s("skipped_station") as usize
    );
    assert_eq!(
        num(v, "/reflector_information/rank") as usize,
        s("reflector_rank") as usize
    );
    assert_eq!(num(v, "/reflector_information/offblock_fraction"), 0.0);
    assert_eq!(s("reflector_offblock_max"), 0.0);

    let mut rows = Vec::new();
    let mut push = |name: String, got: f64, want: f64, bar: f64| {
        rows.push((name, got, want, rel(got, want), bar));
    };
    for p in v
        .pointer("/helmert/parameters")
        .and_then(Value::as_array)
        .unwrap()
    {
        let name = p["name"].as_str().unwrap();
        push(
            format!("sigma {name}"),
            p["sigma"].as_f64().unwrap(),
            r.sigmas[name],
            SIGMA_REL_TOL,
        );
    }
    for (path, key) in [
        (
            "/datum_accuracy/translation_sigma_norm_m",
            "translation_sigma_norm_m",
        ),
        (
            "/datum_accuracy/rotation_sigma_norm_rad",
            "rotation_sigma_norm_rad",
        ),
        ("/datum_accuracy/scale_sigma_ppb", "scale_sigma_ppb"),
    ] {
        push(key.to_string(), num(v, path), s(key), SIGMA_REL_TOL);
    }
    push(
        "helmert condition".to_string(),
        num(v, "/helmert/condition_number"),
        s("helmert_condition"),
        CONDITION_REL_TOL,
    );
    for a in v.pointer("/reflectors").and_then(Value::as_array).unwrap() {
        let t = a["ilrs_target"].as_str().unwrap();
        let n = a["observations"].as_u64().unwrap() as usize;
        let (n_obs, want) = r.arrays.get(t).copied().unwrap_or((0, f64::NAN));
        assert_eq!(n, n_obs, "{t} observations");
        if n > 0 {
            push(
                format!("{t} across/along"),
                a["ratio_across_over_along"].as_f64().unwrap(),
                want,
                RATIO_REL_TOL,
            );
        }
    }
    for (name, got, want, r, bar) in &rows {
        println!(
            "{name:<28} engine {got:.6e}  SPICE+numpy {want:.6e}  rel {r:.3e}  bar {bar:.0e}{}",
            if r <= bar { "" } else { "  OUTSIDE" }
        );
    }
    println!(
        "information only: {used} points used; residual RMS {:.3} m; SPICE O-C {oc:.3} m",
        num(v, "/residuals/rms_m")
    );
    rows
}

/// The strict, pre-registered fresh-data comparison of the analytic (default) path.
#[test]
fn llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points() {
    let v = report(false);
    let bad: Vec<_> = comparisons(&v, false)
        .into_iter()
        .filter(|(_, _, _, r, bar)| r > bar)
        .collect();
    assert!(bad.is_empty(), "outside the bar: {bad:?}");
}

/// Information only, no bar: the same comparison printed for the kernel Moon on this slice.
/// Run with `cargo test --test validate_llr_datum_analytic_fresh_2025 kernel_moon_on_the_fresh_slice
/// -- --ignored --nocapture`.
#[test]
#[ignore = "information only: prints the kernel-Moon gaps on the fresh 2025 slice"]
fn kernel_moon_on_the_fresh_slice() {
    let _ = comparisons(&report(true), true);
}

/// The committed normal points are the fetched bytes: every file's SHA-256 is the one recorded
/// in `normal_points/SHA256SUMS` (written at retrieval, upstream names in the NOTICE).
#[test]
fn fresh_normal_points_match_their_recorded_digests() {
    use sha2::{Digest, Sha256};
    let sums = std::fs::read_to_string(format!("{FIX}/normal_points/SHA256SUMS")).unwrap();
    let mut n = 0;
    for line in sums.lines().filter(|l| !l.trim().is_empty()) {
        let (want, name) = line.split_once("  ").expect("sha256sum format");
        let bytes = std::fs::read(format!("{FIX}/normal_points/{name}")).unwrap();
        let got: String = Sha256::digest(&bytes)
            .iter()
            .map(|b| format!("{b:02x}"))
            .collect();
        assert_eq!(got, want, "{name}");
        n += 1;
    }
    assert_eq!(n, 15, "five targets x three months");
}
