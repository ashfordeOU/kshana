// SPDX-License-Identifier: AGPL-3.0-only
//! Diagnostic re-run of the "Lunar frame datum from a REAL observing campaign" comparison
//! (`kind = "lunar-llr-datum"`, module `lunar_llr`) with the engine's Moon centre read from the
//! JPL DE440 kernel instead of the analytic series, at the UNCHANGED pre-registered bars.
//!
//! ## Why this exists, and what was already seen (disclosure)
//!
//! `tests/validate_llr_datum_spice_oracle.rs` (pre-registered in 6b27964a) compared the
//! engine's measured-schedule Helmert datum covariance with SPICE light times and a numpy
//! inverse. Every quantity held except one: the z-translation sigma was 1.025 % high against a
//! 1 % bar (engine 1.282270e-2 m, oracle 1.269258e-2 m). That record ruled out the lunar
//! orientation model (an oracle run with the IAU 2015 orientation moved the oracle's z sigma by
//! 0.05 %) and named the analytic Moon-centre series as the most likely cause. The finding is
//! pinned by `llr_datum_finding_tz_sigma_one_percent_gap` and stays pinned.
//!
//! This file was written after that miss was seen, and the change it tests (the Moon centre
//! from a kernel) was chosen because of it. The oracle values it compares against are the same
//! committed `tests/fixtures/llr_datum_spice/reference.txt`, already seen, and the 337 normal
//! points are the same, already seen. It is therefore a DIAGNOSTIC: it can show whether the
//! named cause accounts for the gap; it cannot by itself promote the row. Whether a diagnostic
//! re-run on seen data may promote, or fresh normal points are required, is a decision for the
//! project's founder and is not taken here.
//!
//! ## Pre-registration (written and published before the kernel fixture was cut or the engine's
//! kernel path for this scenario was run)
//!
//! * **Quantity:** exactly the quantities of the original comparison, as the engine emits them:
//!   the seven Helmert standard deviations, the three `datum_accuracy` norms, the Helmert
//!   condition number, the five per-array across/along sigma ratios, the bookkeeping (349
//!   parsed, 337 used, 12 skipped), both ranks (15 and 7) and the zero inter-array coupling.
//! * **Engine configuration:** the `lunar-llr-datum` scenario at its defaults plus one key,
//!   `planetary_kernel_path`, naming a cut of NAIF's `de440s.bsp` holding the type-2 records of
//!   segments 3 (Earth-Moon barycentre wrt the solar-system barycentre), 301 (Moon wrt 3) and
//!   399 (Earth wrt 3) that cover 2015-04-06 to 2015-06-30, copied bit for bit and checked with
//!   SPICE to evaluate identically to the full file. With the key set, the ONLY change in the
//!   engine is the geocentric Moon centre: `KernelEphemeris::moon_geocentric_tt` (DE440 Moon
//!   relative to the Earth, J2000, at the epoch's TT carried to TDB) replaces
//!   `ephem::moon_position`. The IAU 2015 lunar orientation, the absent polar motion, UT1 - UTC
//!   = 0, the station and reflector catalogues, the weights and the linear algebra are
//!   unchanged. The report records the kernel's SHA-256.
//! * **Oracle (unchanged, already seen):** the SPICE (CSPICE N0067 through spiceypy 8.2.0, MIT
//!   licence) two-way light times with finite-difference partials on DE440, ITRF93 Earth
//!   orientation and the DE440 lunar orientation, and the numpy 2.3.5 (BSD-3-Clause, LAPACK)
//!   information matrix and inverse, as committed in `reference.txt` by 6b27964a. The oracle
//!   read `de440.bsp`; the engine reads records of `de440s.bsp`. Both are the DE440 integration;
//!   the generator checks with SPICE that the two files give identical Moon-relative-to-Earth
//!   states over the window and records the largest difference.
//! * **Tolerances (unchanged, not loosened):** 1 % relative on the seven sigmas and the three
//!   norms; 2 % on the condition number; 2 % on each across/along ratio; exact bookkeeping,
//!   ranks and zero coupling. These are the constants of the original test, repeated here.
//! * **Outcome rule:** if every quantity holds, the record says the named cause accounts for
//!   the gap and the row stays MODELLED pending the founder's promotion rule. If any quantity
//!   fails, it is published as a finding and the strict test stays ignored with the gap.
//! * **Information only (no bar):** the engine-to-SPICE light-time gap (one-way RMS over the
//!   337 points) on the kernel path, printed beside the analytic path's 156,494 m.
//! * **Mutation check, planned now:** after the run, the kernel branch is made to return the
//!   analytic Moon instead; the strict test must then fail (it must reproduce the original
//!   1.025 % miss), and the edit is reverted.
//!
//! ## Result (run after the pre-registration commit c51f8b2 was published)
//!
//! Every quantity holds at the unchanged bars. The z-translation sigma, the one quantity the
//! analytic run missed, moves from 1.025 % to 0.049 % (engine 1.268640e-2 m, oracle
//! 1.269258e-2 m). The largest relative gap is now 1.1e-3 (the Luna 17 across/along ratio,
//! bar 2e-2); every sigma and norm is within 4.9e-4 (bar 1e-2); the condition number within
//! 9.6e-4 (bar 2e-2); bookkeeping, ranks and zero coupling exact. Information only: the
//! kernel-path observed-minus-computed one-way residual RMS is 95.1 m, against 156,494 m on the
//! analytic path; what remains is the IAU 2015 orientation, the absent polar motion and UT1,
//! troposphere, tides and relativistic delay. The cut kernel (SHA-256 bf1efa31...) reproduces
//! `de440s.bsp` bit for bit, and `de440s.bsp` and the oracle's `de440.bsp` give identical Moon
//! states over the window. Mutation: making the kernel branch return the analytic Moon
//! reproduced the original miss exactly (tz rel 1.025e-2, OUTSIDE) and the test failed;
//! reverted.
//!
//! Outcome: DIAGNOSTIC PASS. The named cause accounts for the gap. The row stays MODELLED; its
//! promotion on this seen-data re-run, or on fresh normal points, is the founder's decision.

use kshana::api::run_toml;
use serde_json::Value;
use std::collections::HashMap;

const REFERENCE: &str = "tests/fixtures/llr_datum_spice/reference.txt";
/// The cut DE440 kernel the engine reads (records bit-identical to NAIF's `de440s.bsp`).
const KERNEL: &str = "tests/fixtures/llr_datum_kernel_moon/de440s_2015-04-06_2015-06-30.bsp";

/// Relative tolerance on the seven Helmert sigmas and the three norms (unchanged).
const SIGMA_REL_TOL: f64 = 1.0e-2;
/// Relative tolerance on the Helmert condition number (unchanged).
const CONDITION_REL_TOL: f64 = 2.0e-2;
/// Relative tolerance on each array's across/along sigma ratio (unchanged).
const RATIO_REL_TOL: f64 = 2.0e-2;

fn report() -> Value {
    let toml = format!("kind = \"lunar-llr-datum\"\nplanetary_kernel_path = \"{KERNEL}\"\n");
    let out = run_toml(&toml).expect("the kernel-path scenario runs");
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
    let text = std::fs::read_to_string(REFERENCE).expect("the oracle output is committed");
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

struct Row {
    name: String,
    got: f64,
    want: f64,
    rel: f64,
    bar: f64,
}

/// Every pre-registered comparison on the kernel path; the exact checks are asserted here.
fn comparisons(v: &Value) -> Vec<Row> {
    let r = reference();
    let s = |k: &str| {
        *r.scalars
            .get(k)
            .unwrap_or_else(|| panic!("oracle has no {k}"))
    };
    assert_eq!(
        v.pointer("/moon_ephemeris/source").and_then(Value::as_str),
        Some("kernel"),
        "the run must be on the kernel path"
    );
    assert_eq!(
        (
            num(v, "/data/normal_points_parsed") as usize,
            num(v, "/data/normal_points_used") as usize,
            num(v, "/data/skipped_station_not_in_catalogue") as usize,
        ),
        (
            s("parsed") as usize,
            s("used") as usize,
            s("skipped_station") as usize
        )
    );
    assert_eq!(num(v, "/reflector_information/rank") as usize, 15);
    assert_eq!(s("reflector_rank") as usize, 15);
    assert_eq!(num(v, "/helmert/rank") as usize, 7);
    assert_eq!(s("helmert_rank") as usize, 7);
    assert_eq!(num(v, "/reflector_information/offblock_fraction"), 0.0);
    assert_eq!(s("reflector_offblock_max"), 0.0);

    let mut rows = Vec::new();
    let mut push = |name: String, got: f64, want: f64, bar: f64| {
        rows.push(Row {
            name,
            got,
            want,
            rel: rel(got, want),
            bar,
        })
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
        let (n_obs, want) = r.arrays[t];
        assert_eq!(
            a["observations"].as_u64().unwrap() as usize,
            n_obs,
            "{t} observations"
        );
        push(
            format!("{t} across/along"),
            a["ratio_across_over_along"].as_f64().unwrap(),
            want,
            RATIO_REL_TOL,
        );
    }
    for x in &rows {
        println!(
            "{:<28} engine {:.6e}  SPICE+numpy {:.6e}  rel {:.3e}  bar {:.0e}{}",
            x.name,
            x.got,
            x.want,
            x.rel,
            x.bar,
            if x.rel <= x.bar { "" } else { "  OUTSIDE" }
        );
    }
    println!(
        "information only: kernel-path residual RMS {:.3} m (analytic path 156,494 m); kernel \
         SHA-256 {}",
        num(v, "/residuals/rms_m"),
        v.pointer("/moon_ephemeris/kernel_sha256")
            .and_then(Value::as_str)
            .unwrap_or("?")
    );
    rows
}

/// The strict diagnostic comparison at the unchanged bars.
#[test]
fn llr_datum_with_kernel_moon_matches_spice_and_numpy_at_the_unchanged_bars() {
    let v = report();
    for x in comparisons(&v) {
        assert!(
            x.rel <= x.bar,
            "{}: engine {:.6e}, oracle {:.6e}, rel {:.3e} > bar {}",
            x.name,
            x.got,
            x.want,
            x.rel,
            x.bar
        );
    }
}

/// The kernel run's own pins, kept apart from the analytic path's: the report must name the
/// kernel it read, by its SHA-256, and its headline figures are pinned to the values this run
/// recorded, to the printed precision (1e-5 relative; a regression guard, not evidence).
#[test]
fn kernel_run_records_its_kernel_and_pins_its_headline() {
    let v = report();
    // PIN-SCOPE:    the Moon kernel SHA-256 the scenario reports, which must be the published DE440 file.
    // PIN-EXCLUDES: the datum and its sigmas, compared with their oracle elsewhere.
    assert_eq!(
        v.pointer("/moon_ephemeris/kernel_sha256")
            .and_then(Value::as_str),
        Some("bf1efa316511b944e33d0be609c8cda43a8dbafa45496c31ad2727cebb6bf4b8")
    );
    for (path, want) in [
        ("/datum_accuracy/translation_sigma_norm_m", 1.834311e-2),
        ("/residuals/rms_m", 95.128),
    ] {
        let got = num(&v, path);
        assert!(rel(got, want) < 1e-5, "{path}: {got} vs pinned {want}");
    }
}
