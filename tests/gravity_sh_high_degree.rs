// SPDX-License-Identifier: AGPL-3.0-only
//! High-degree spherical-harmonic gravity (`SphericalHarmonicField::acceleration_hf`,
//! `potential_hf`, `from_gfc_file`) against two third-party evaluators of the same EGM2008
//! coefficients: **Orekit 12.2** `HolmesFeatherstoneAttractionModel` (Apache-2.0) and
//! **pyshtools 4.14.1** `gravmag.MakeGravGridPoint` (SHTOOLS, BSD-3-Clause).
//!
//! The bars are fixed in `xval/high-degree-gravity/PREREGISTRATION.md` (committed before the
//! first comparison); the numbers are in `xval/high-degree-gravity/RESULTS.md`. All three
//! sides evaluate the non-central field (degrees 2..N, `C̄00 = 0`) in the Earth-fixed frame
//! at ten points: LEO, GEO, the reference sphere, near the poles, exactly on the polar axis,
//! and in the latitude band where the plain recursion's sectoral term underflows at N = 2190.
//!
//! * N = 70 runs always, on the committed `tools/egm2008_to70.gfc` (the generator asserts it
//!   equals the full model's degree-70 truncation).
//! * N = 200, 360, 2190 need the full EGM2008 model (252 MB, never committed). Fetch it with
//!   `scripts/fetch_egm2008.sh` and point `KSHANA_EGM2008_GFC` at it. Without it those tests
//!   print a skip notice and pass; with `KSHANA_REQUIRE_REALDATA=1` the skip is a failure.
//! * Exactly on the polar axis (P3, P4) Orekit returns NaN and pyshtools is not evaluated
//!   (pre-registered exclusion); the pole is covered by the MODELLED continuity and
//!   finite-difference tests in `src/gravity_sh.rs`.
//!
//! PIN-SCOPE: the committed Orekit / pyshtools acceleration and potential tables in
//! tests/fixtures/high_degree_gravity/ (non-central EGM2008 field at ten points, N = 70, 200,
//! 360, 2190), compared with the pre-registered bars; and a coarse timing budget.
//! PIN-EXCLUDES: the historical `acceleration` / `potential` (unchanged, pinned elsewhere);
//! the central term; frames, time and tides (none applied: one body-fixed field).

use kshana::gravity_sh::SphericalHarmonicField;
use std::collections::HashMap;
use std::path::PathBuf;
use std::time::Instant;

const POINTS: &str = include_str!("fixtures/high_degree_gravity/points.txt");
const OREKIT: &str = include_str!("fixtures/high_degree_gravity/orekit_egm2008.txt");
const PYSH: &str = include_str!("fixtures/high_degree_gravity/pyshtools_egm2008.txt");

type Vec3 = [f64; 3];

fn rows(text: &str) -> impl Iterator<Item = Vec<&str>> {
    text.lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .map(|l| l.split_whitespace().collect())
}

fn points() -> Vec<(String, Vec3)> {
    rows(POINTS)
        .map(|c| {
            let p = |i: usize| c[i].parse::<f64>().unwrap();
            (c[0].to_string(), [p(4), p(5), p(6)])
        })
        .collect()
}

/// `(N, id) -> (a, U)`; `U` is NaN where the table has none.
fn oracle(text: &str) -> HashMap<(usize, String), (Vec3, f64)> {
    rows(text)
        .map(|c| {
            let p = |i: usize| c.get(i).map_or(f64::NAN, |v| v.parse::<f64>().unwrap());
            (
                (c[0].parse().unwrap(), c[1].to_string()),
                ([p(2), p(3), p(4)], p(5)),
            )
        })
        .collect()
}

fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// The pre-registered bars: (absolute acceleration bar, relative bar, potential bar).
fn bars(n: usize) -> (f64, f64, f64) {
    if n <= 360 {
        (1e-12, 1e-10, 1e-8)
    } else {
        (1e-10, f64::INFINITY, 1e-7)
    }
}

/// The two near-pole points (89.999°, −89.9999°) where pyshtools misses the bar; see the
/// FINDING on [`pyshtools_at_every_point_disagrees_near_the_poles`].
const PYSHTOOLS_NEAR_POLE: [&str; 2] = ["P2", "P9"];

/// Compare one degree against one oracle table, skipping the points in `skip`; returns the
/// report lines, the number of comparisons and the bar misses.
fn compare(
    field: &SphericalHarmonicField,
    n: usize,
    name: &str,
    table: &str,
    skip: &[&str],
) -> (Vec<String>, usize, Vec<String>) {
    let (abar, rbar, ubar) = bars(n);
    let tab = oracle(table);
    let (mut report, mut count, mut misses) = (Vec::new(), 0, Vec::new());
    for (id, r) in points() {
        let a = field.acceleration_hf(r);
        let u = field.potential_hf(r);
        assert!(a.iter().all(|x| x.is_finite()) && u.is_finite(), "{id}");
        if skip.contains(&id.as_str()) {
            continue;
        }
        let Some(&(ao, uo)) = tab.get(&(n, id.clone())) else {
            report.push(format!("N={n} {id} {name}: not evaluated"));
            continue;
        };
        if !ao.iter().all(|x| x.is_finite()) {
            report.push(format!("N={n} {id} {name}: no oracle value (non-finite)"));
            continue;
        }
        count += 1;
        let da = norm(sub(a, ao));
        let rel = da / norm(ao);
        let du = (u - uo).abs();
        let line = format!(
            "N={n} {id} {name}: |da| {da:.3e} m/s^2 (rel {rel:.3e}, |a_nc| {:.3e}){}",
            norm(ao),
            if uo.is_finite() {
                format!(" |dU| {du:.3e} m^2/s^2")
            } else {
                String::new()
            }
        );
        if da > abar || rel > rbar || (uo.is_finite() && du > ubar) {
            misses.push(line.clone());
        }
        report.push(line);
    }
    for l in &report {
        println!("{l}");
    }
    (report, count, misses)
}

fn non_central(mut f: SphericalHarmonicField) -> SphericalHarmonicField {
    f.set(0, 0, 0.0, 0.0);
    f
}

fn bundled_70() -> SphericalHarmonicField {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tools/egm2008_to70.gfc");
    let field = non_central(SphericalHarmonicField::from_gfc_file(path, 70).expect("load"));
    assert_eq!(field.nmax, 70);
    field
}

#[test]
fn degree_70_matches_orekit() {
    // All eight off-axis points; Orekit returns NaN exactly on the axis (P3, P4).
    let (_, count, misses) = compare(&bundled_70(), 70, "orekit", OREKIT, &[]);
    assert_eq!(count, 8, "comparisons");
    assert!(misses.is_empty(), "pre-registered bar missed: {misses:#?}");
}

#[test]
fn degree_70_matches_pyshtools_away_from_the_poles() {
    let (_, count, misses) = compare(&bundled_70(), 70, "pyshtools", PYSH, &PYSHTOOLS_NEAR_POLE);
    assert_eq!(count, 6, "comparisons");
    assert!(misses.is_empty(), "pre-registered bar missed: {misses:#?}");
}

/// FINDING (run 2026-10-12, recorded in xval/high-degree-gravity/RESULTS.md): against the
/// pre-registered 1e-12 m/s² bar, pyshtools 4.14.1 `MakeGravGridPoint` differs from Kshana by
/// 3.8e-12 m/s² at 89.999° (P2) and 4.1e-10 to 7.3e-10 m/s² at −89.9999° (P9), at every
/// degree. A 50-digit mpmath evaluation (xval/high-degree-gravity/mpmath_near_pole_diagnostic.py)
/// puts Orekit within 1.2e-17 m/s² of the truth at both points and pyshtools 3.8e-12 and
/// 4.1e-10 m/s² away at N = 70: the difference is pyshtools' near-pole error, but the
/// pre-registered rule makes it a miss and it is not tuned away.
#[test]
#[ignore = "DISAGREES with the pre-registered 1e-12 m/s^2 bar at the near-pole points P2 (3.8e-12) and P9 (4.1e-10 to 7.3e-10); 50-digit mpmath attributes it to pyshtools; finding recorded"]
fn pyshtools_at_every_point_disagrees_near_the_poles() {
    let (_, _, mut misses) = compare(&bundled_70(), 70, "pyshtools", PYSH, &[]);
    if let Some(path) = full_model() {
        let full = non_central(SphericalHarmonicField::from_gfc_file(path, 2190).unwrap());
        for n in [200, 360, 2190] {
            misses.extend(compare(&truncate(&full, n), n, "pyshtools", PYSH, &[]).2);
        }
    }
    assert!(misses.is_empty(), "pre-registered bar missed: {misses:#?}");
}

fn full_model() -> Option<PathBuf> {
    match std::env::var("KSHANA_EGM2008_GFC") {
        Ok(p) if std::path::Path::new(&p).is_file() => Some(PathBuf::from(p)),
        _ => {
            assert!(
                std::env::var("KSHANA_REQUIRE_REALDATA").as_deref() != Ok("1"),
                "KSHANA_REQUIRE_REALDATA=1 but KSHANA_EGM2008_GFC does not name a file"
            );
            println!(
                "SKIP: set KSHANA_EGM2008_GFC=/path/to/EGM2008.gfc (scripts/fetch_egm2008.sh) \
                 to compare degrees 200, 360 and 2190 with Orekit and pyshtools"
            );
            None
        }
    }
}

fn truncate(f: &SphericalHarmonicField, n: usize) -> SphericalHarmonicField {
    let mut t = SphericalHarmonicField::zeros(f.gm, f.re, n);
    for d in 0..=n.min(f.nmax) {
        for m in 0..=d {
            t.set(d, m, f.cbar(d, m).unwrap(), f.sbar(d, m).unwrap());
        }
    }
    t
}

#[test]
fn degrees_200_360_2190_match_orekit_and_pyshtools_away_from_the_poles() {
    let Some(path) = full_model() else { return };
    let t0 = Instant::now();
    let full = SphericalHarmonicField::from_gfc_file(&path, 2190).expect("load EGM2008");
    println!("load to 2190: {:.2} s", t0.elapsed().as_secs_f64());
    assert_eq!(full.nmax, 2190);
    assert_eq!(full.tide_system(), Some("tide_free"));
    let full = non_central(full);
    let mut misses = Vec::new();
    for n in [200, 360, 2190] {
        let f = truncate(&full, n);
        let (_, c1, m1) = compare(&f, n, "orekit", OREKIT, &[]);
        let (_, c2, m2) = compare(&f, n, "pyshtools", PYSH, &PYSHTOOLS_NEAR_POLE);
        assert_eq!((c1, c2), (8, 6), "comparisons at N={n}");
        misses.extend(m1);
        misses.extend(m2);
    }
    // Diagnostic (no bar): the historical evaluator at N = 2190 where the plain recursion's
    // sectoral term underflows (P10) and at high latitude (P8).
    let ore = oracle(OREKIT);
    for (id, r) in points() {
        if id == "P8" || id == "P10" {
            let ao = ore[&(2190, id.clone())].0;
            let d_old = norm(sub(full.acceleration(r), ao));
            let d_new = norm(sub(full.acceleration_hf(r), ao));
            println!("diagnostic N=2190 {id}: historical |da| {d_old:.3e}, hf |da| {d_new:.3e}");
        }
    }
    assert!(misses.is_empty(), "pre-registered bar missed: {misses:#?}");
}

/// A deterministic synthetic d/o-`n` field (Kaula-rule magnitudes): timing needs no data.
fn synthetic(n: usize) -> SphericalHarmonicField {
    let mut f = SphericalHarmonicField::zeros(3.986_004_415e14, 6_378_136.3, n);
    f.set(0, 0, 1.0, 0.0);
    for d in 2..=n {
        for m in 0..=d {
            let k = 1e-5 / (d * d) as f64;
            let ph = (d * 7 + m * 13) as f64;
            f.set(d, m, k * ph.sin(), if m == 0 { 0.0 } else { k * ph.cos() });
        }
    }
    f
}

/// Mean seconds per `acceleration_hf` call over `reps` calls (table prepared beforehand).
fn time_per_call(f: &SphericalHarmonicField, reps: usize) -> f64 {
    f.prepare_high_degree();
    let r = [4.1e6, 2.2e6, 4.9e6];
    let mut acc = 0.0;
    let t0 = Instant::now();
    for i in 0..reps {
        let a = f.acceleration_hf([r[0] + i as f64, r[1], r[2]]);
        acc += a[0];
    }
    assert!(acc.is_finite());
    t0.elapsed().as_secs_f64() / reps as f64
}

#[test]
fn evaluation_cost_is_within_budget() {
    // The budget (optimised build, opt-level 2): <= 50 µs at N = 70, <= 0.5 ms at N = 200,
    // <= 150 ms at N = 2190 per call (measured 15 µs, 0.13 ms and 65 ms on a shared 4-core
    // machine under load; RESULTS.md). The ceilings asserted here are 100x those, wide enough
    // for an unoptimised build and a loaded runner, so they catch a change of the algorithm's
    // order without flaking. KSHANA_TIMING_STRICT=1 asserts the
    // budget itself (for an optimised build on a quiet machine).
    let strict = std::env::var("KSHANA_TIMING_STRICT").as_deref() == Ok("1");
    for (n, budget) in [(70, 50e-6), (200, 0.5e-3), (2190, 0.15)] {
        let f = synthetic(n);
        let reps = if n > 1000 { 3 } else { 50 };
        let s = time_per_call(&f, reps);
        println!("acceleration_hf N={n}: {:.1} µs/call", s * 1e6);
        let ceil = if strict { budget } else { 100.0 * budget };
        assert!(s < ceil, "N={n}: {s:e} s/call over the {ceil:e} s ceiling");
    }
}
