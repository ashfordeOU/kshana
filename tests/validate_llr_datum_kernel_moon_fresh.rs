// SPDX-License-Identifier: AGPL-3.0-only
//! Fresh-data comparison of the lunar laser ranging (LLR) frame datum on the kernel Moon: the
//! `lunar-llr-datum` scenario with the geocentric Moon centre read from the Jet Propulsion
//! Laboratory (JPL) DE440 kernel, on normal points that no one on this project has seen,
//! against an independent SPICE light-time and NumPy oracle, at the bars of the original
//! comparison.
//!
//! ## Why, and what was decided before this file
//!
//! The diagnostic re-run (`tests/validate_llr_datum_kernel_moon.rs`) showed that the original
//! miss (z-translation sigma 1.025 % against a 1 % bar) is the analytic Moon: with the DE440
//! Moon every quantity held. That re-run used oracle values and 337 normal points already seen,
//! and the fix was chosen after the miss. The project's founder ruled (2026-10-02) that such a
//! re-run may not promote and that fresh normal points are required. This file is that fresh
//! comparison. It is written and published before any normal point of the slice below was
//! fetched, listed or opened.
//!
//! ## Pre-registration
//!
//! * **Slice (fixed now).** The International Laser Ranging Service (ILRS) Consolidated Laser
//!   Ranging Data (CRD) monthly normal-point files of the EUROLAS Data Center (EDC, DGFI-TUM),
//!   `https://edc.dgfi.tum.de/pub/slr/data/npt_crd/<target>/2019/<target>_2019<mm>.npt`, for the
//!   five targets `apollo11`, `apollo14`, `apollo15`, `luna17`, `luna21` and the months `04`,
//!   `05`, `06` (2019 has no leap second), committed verbatim with SHA-256 digests. A file that
//!   does not exist upstream is absent and recorded as such.
//! * **Sufficiency rule (fixed now).** If the engine uses fewer than 100 normal points, or either
//!   side's Helmert rank is below 7, the quarter is declared INSUFFICIENT, nothing is compared,
//!   and the slice moves to 2019-07..2019-09 under the same rules; that move would be recorded
//!   in this header.
//! * **Everything else is the original comparison's (6b27964a), unchanged:** the ITRF2020 station
//!   catalogue (Grasse 7845 and Matera 7941; any other station is skipped and counted, never
//!   given a substituted coordinate), the DE430 Table 7 reflector catalogue, the engine's
//!   selection rules (ground-transmit epochs only, a measured precision required), the weights
//!   `1 / (bin_rms / sqrt(n_raw))^2`, and the relative eigenvalue threshold 1e-9.
//! * **Engine configuration.** `lunar-llr-datum` with `normal_points_dir` set to the fresh slice
//!   and `planetary_kernel_path` set to a cut of NAIF's `de440s.bsp` holding the type-2 records
//!   of segments 3, 301 and 399 that cover 2019-03-31 to 2019-07-02, copied bit for bit and
//!   checked with SPICE to evaluate identically to the full file.
//! * **Oracle (unchanged code).** `tests/fixtures/llr_datum_spice/gen_llr_datum_spice.py`,
//!   unmodified, pointed at the fresh slice by a wrapper that only changes its input and output
//!   directories: NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.2.0 (MIT licence) two-way
//!   light times on DE440, ITRF93 Earth orientation and the DE440 lunar orientation (MOON_ME),
//!   finite-difference partials (100 m), and NumPy 2.3.5 (BSD-3-Clause, LAPACK) for the
//!   information matrix, Helmert design and inverse. Its pre-stated self-check stands: SPICE's
//!   own observed-minus-computed one-way range RMS must be under 100 m, or the oracle is not an
//!   oracle and the comparison is void.
//! * **Quantities and bars (unchanged):** the seven Helmert sigmas and the three
//!   `datum_accuracy` norms within **1 %**; the Helmert condition number within **2 %**; each
//!   observed array's across/along sigma ratio within **2 %**; the bookkeeping (parsed, used,
//!   skipped for an uncatalogued station), both ranks, and each array's observation count
//!   **equal** between engine and oracle; the inter-array coupling **exactly 0** on both sides.
//! * **Outcome rule.** All hold: the row "Lunar frame datum from a REAL observing campaign,
//!   kernel Moon centre" is proposed VALIDATED on this evidence. Any fails: a finding, the
//!   strict test stays ignored with the gap, and a gated test pins it.
//! * **Information only (no bar):** the kernel-path residual RMS, and the same slice on the
//!   analytic Moon.
//! * **Mutation check, planned now:** the kernel Moon read one hour late (a 0.55 degree
//!   line-of-sight error, ten times the analytic series' worst) must turn the strict test red;
//!   the edit is then reverted. If it does not, that is reported.
//!
//! ## Result (run after the pre-registration commit 830d945a was published)
//!
//! The slice exists in full (all 15 monthly files). 458 normal points parsed, 447 used, 11
//! skipped for a station outside the catalogue; Helmert rank 7 on both sides, so the quarter
//! is SUFFICIENT. The oracle's self-check holds: SPICE observed-minus-computed RMS 10.86 m.
//!
//! **Every quantity holds at the unchanged bars.** Worst gaps: sigmas and norms 4.0e-5 (bar
//! 1e-2), condition 1.6e-5 (bar 2e-2), across/along ratios 7.6e-5 (Luna 17, bar 2e-2);
//! bookkeeping, ranks, per-array counts and zero coupling exact. Kernel-path residual RMS
//! 33.7 m (information only).
//!
//! **Mutations.** The planned one (kernel Moon read one hour late) was NOT detected: the test
//! still passed. A one-hour shift moves the whole geometry coherently along the orbit, and the
//! datum covariance depends on the spread of the lines of sight, not on their absolute timing.
//! A structural mutation chosen after that (disclosed as such): dropping the down-leg from the
//! range partial doubles every sigma and fails all ten sigma and norm comparisons; reverted.
//!
//! **Finding on discrimination (information only, not a pre-registered comparison):** on this
//! slice the analytic Moon also passes every bar (worst 3.8e-3, Luna 17 ratio; tz 4.4e-4). The
//! 1 % bar does not separate the two Moon models here. The 2015 miss (1.025 %) was a marginal
//! case of that quarter's geometry, so this pass validates the datum covariance on fresh data,
//! not an improvement attributable to the kernel Moon.

use kshana::api::run_toml;
use serde_json::Value;
use std::collections::HashMap;

const FIX: &str = "tests/fixtures/llr_datum_kernel_moon_fresh";

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
            "planetary_kernel_path = \"{FIX}/de440s_2019-03-31_2019-07-02.bsp\"\n"
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
fn comparisons(v: &Value) -> Vec<(String, f64, f64, f64, f64)> {
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
    if std::env::var_os("KSHANA_INFO_ANALYTIC").is_none() {
        assert_eq!(
            v.pointer("/moon_ephemeris/source").and_then(Value::as_str),
            Some("kernel")
        );
    }
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
        "information only: {used} points used; kernel-path residual RMS {:.3} m; SPICE O-C {oc:.3} m",
        num(v, "/residuals/rms_m")
    );
    rows
}

/// The strict, pre-registered fresh-data comparison.
#[test]
fn llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points() {
    let v = report(true);
    let bad: Vec<_> = comparisons(&v)
        .into_iter()
        .filter(|(_, _, _, r, bar)| r > bar)
        .collect();
    assert!(bad.is_empty(), "outside the bar: {bad:?}");
}

/// Information only, no bar: the same comparison printed for the analytic Moon on this slice.
/// Run with `KSHANA_INFO_ANALYTIC=1 cargo test --test validate_llr_datum_kernel_moon_fresh
/// analytic_moon_on_the_fresh_slice -- --ignored --nocapture`.
#[test]
#[ignore = "information only: prints the analytic-Moon gaps on the fresh slice"]
fn analytic_moon_on_the_fresh_slice() {
    let _ = comparisons(&report(false));
}
