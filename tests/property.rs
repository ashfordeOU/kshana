// SPDX-License-Identifier: AGPL-3.0-only
//! Property-based and fuzz tests for the parsers and core numerics.
//!
//! Rather than pull in a property-testing framework (the project keeps its
//! dependency surface deliberately small), these are hand-rolled randomized
//! tests: a deterministic `ChaCha8Rng` drives thousands of inputs per case, and
//! each test asserts an *invariant* that must hold for every input — never a
//! panic, a preserved norm, an exact round-trip, a non-negative statistic. A
//! failure prints the seed-derived input so it can be reproduced.

use kshana::api::run_toml;
use kshana::frames::{ecef_to_geodetic, geodetic_to_ecef, teme_to_ecef, Geodetic};
use kshana::kalman::KalmanClock;
use kshana::scenario::TimeCfg;
use kshana::tle::{
    parse_propagators, parse_propagators_opts, tle_checksum, verify_checksum, ParseOpts,
};
use rand::{Rng, RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;

/// A couple of real TLEs to seed the parser mutation fuzzer.
const SEED_TLES: &str = "\
1 25544U 98067A   24001.50000000  .00016717  00000-0  10270-3 0  9000
2 25544  51.6400 208.9163 0006317  69.9862 290.1962 15.49401763000000
1 00005U 58002B   24001.00000000  .00000023  00000-0  28098-4 0  9000
2 00005  34.2682 348.7242 1859667 331.7664  19.3264 10.84948299000000";

fn random_ascii(rng: &mut impl RngCore, max_len: usize) -> String {
    let len = (rng.next_u32() as usize) % max_len;
    (0..len)
        .map(|_| {
            // Printable ASCII plus the occasional space/newline.
            let b = 32 + (rng.next_u32() % 95) as u8;
            b as char
        })
        .collect()
}

#[test]
fn tle_parser_never_panics_on_garbage() {
    // The TLE parser slices fixed columns; it must reject malformed input with an
    // error, never panic (it previously could panic on multi-byte / short lines).
    let mut rng = ChaCha8Rng::seed_from_u64(11);
    for _ in 0..20_000 {
        let s = random_ascii(&mut rng, 200);
        // Both option paths, and with a leading "1 "/"2 " sometimes to hit the
        // column-parsing branch.
        let _ = parse_propagators(&s);
        let _ = parse_propagators_opts(
            &s,
            ParseOpts {
                strict_checksum: true,
                ..Default::default()
            },
        );
        let prefixed = format!("{} {}", if rng.gen::<bool>() { "1" } else { "2" }, s);
        let _ = parse_propagators(&prefixed);
    }
}

#[test]
fn tle_parser_never_panics_on_non_ascii() {
    // Multi-byte UTF-8 must not cause a byte-index slice panic.
    let mut rng = ChaCha8Rng::seed_from_u64(7);
    let glyphs = ['é', 'क', 'σ', '🛰', 'Ω', '中'];
    for _ in 0..5_000 {
        let len = (rng.next_u32() as usize) % 120;
        let s: String = (0..len)
            .map(|_| {
                if rng.gen::<f64>() < 0.3 {
                    glyphs[(rng.next_u32() as usize) % glyphs.len()]
                } else {
                    (32 + (rng.next_u32() % 95) as u8) as char
                }
            })
            .collect();
        let with_prefix = format!("2 {s}");
        let _ = parse_propagators(&with_prefix);
        let _ = parse_propagators_opts(
            &with_prefix,
            ParseOpts {
                strict_checksum: true,
                ..Default::default()
            },
        );
    }
}

#[test]
fn tle_parser_never_panics_on_mutated_valid_tles() {
    // Take real TLEs and mutate bytes / truncate; the parser must stay graceful.
    let mut rng = ChaCha8Rng::seed_from_u64(99);
    let bytes: Vec<u8> = SEED_TLES.bytes().collect();
    for _ in 0..20_000 {
        let mut m = bytes.clone();
        let nmut = 1 + (rng.next_u32() as usize) % 6;
        for _ in 0..nmut {
            let i = (rng.next_u32() as usize) % m.len();
            m[i] = 32 + (rng.next_u32() % 95) as u8;
        }
        // Sometimes truncate to a random length.
        if rng.gen::<bool>() {
            let cut = (rng.next_u32() as usize) % m.len();
            m.truncate(cut);
        }
        if let Ok(s) = String::from_utf8(m) {
            let _ = parse_propagators(&s);
        }
    }
}

#[test]
fn tle_checksum_is_consistent_and_position_69_only() {
    // For any line >= 69 chars, setting column 69 to the computed checksum makes
    // verify_checksum pass; and the checksum depends only on columns 1..68.
    let mut rng = ChaCha8Rng::seed_from_u64(123);
    for _ in 0..5_000 {
        // Build a 68-char body of digits/spaces/signs (the TLE alphabet), then a
        // checksum digit at column 69.
        let body: String = (0..68)
            .map(|_| {
                let r = rng.next_u32() % 12;
                match r {
                    0..=9 => (b'0' + r as u8) as char,
                    10 => ' ',
                    _ => '-',
                }
            })
            .collect();
        let cs = tle_checksum(&body); // checksum over the body
        let line = format!("{body}{cs}");
        assert!(
            verify_checksum(&line, "t").is_ok(),
            "valid checksum must verify: {line}"
        );
        // Changing the checksum digit to a different value must fail.
        let wrong = (cs + 1) % 10;
        let bad = format!("{body}{wrong}");
        assert!(
            verify_checksum(&bad, "t").is_err(),
            "wrong checksum must fail: {bad}"
        );
    }
}

#[test]
fn run_toml_never_panics_on_mutated_scenarios() {
    // The scenario parser/dispatcher must reject malformed scenarios with an error,
    // never panic. Seed from the bundled scenarios, mutate bytes / truncate, and
    // also throw pure-random text at it.
    //
    // Operational bounds, learned the hard way (this one test cap-killed six CI job
    // runs across three commits before the mechanism was understood):
    //
    // 1. The corpus is read in SORTED path order. `read_dir` order is
    //    filesystem-dependent (ext4 effectively randomises it per checkout), so with
    //    `seeds[rng % len]` the sequence of drawn base scenarios — and therefore the
    //    runtime — differed per machine even though the RNG itself is seeded.
    //    `run_toml` EXECUTES a mutation that stays valid, and a byte flip in a cost
    //    knob (a grid resolution, a time span) can make a mutant far more expensive
    //    than any bundled scenario — the time-grid guard does not bound every cost
    //    dimension. An unlucky draw order ran for hours on CI where a lucky one
    //    finished in minutes. Sorting makes the workload a pure function of
    //    (corpus contents, seed): identical on every machine, measurable locally.
    // 2. A wall-clock budget backstops the loop anyway: adding a scenario file
    //    re-rolls the whole draw sequence, and no future corpus may quietly turn
    //    this gate into a multi-hour CI job again. The full 3000-iteration sequence
    //    measures ~300 s in a local debug build; CI runners are a few times slower,
    //    so the 1800 s budget lets a healthy run finish whole while clamping any
    //    re-rolled monster at 30 min instead of hours. If the budget does trim the
    //    tail, that is a bounded, VISIBLE depth reduction (the eprintln) and never
    //    a red build; the floor below asserts real progress was made.
    // 3. Under cargo-tarpaulin (`cfg(tarpaulin)`, set only during a tarpaulin
    //    build) the sample is a 300-iteration prefix of the same sequence: LLVM
    //    instrumentation multiplies the cost ~20-30x, and the smaller sample is
    //    coverage-neutral because determinism.rs already executes every bundled
    //    scenario, so this loop's unique lines (parser error paths) are hit in the
    //    first iterations.
    let mut rng = ChaCha8Rng::seed_from_u64(808);
    let mut paths: Vec<std::path::PathBuf> = Vec::new();
    if let Ok(dir) = std::fs::read_dir("scenarios") {
        for e in dir.flatten() {
            let p = e.path();
            if p.extension().and_then(|s| s.to_str()) == Some("toml") {
                paths.push(p);
            }
        }
    }
    paths.sort();
    let mut seeds: Vec<String> = Vec::new();
    for p in &paths {
        if let Ok(s) = std::fs::read_to_string(p) {
            seeds.push(s);
        }
    }
    assert!(!seeds.is_empty(), "expected bundled scenarios to fuzz");
    let iters = if cfg!(tarpaulin) { 300 } else { 3_000 };
    let budget = std::time::Duration::from_secs(1_800);
    let start = std::time::Instant::now();
    let mut done = 0usize;
    for _ in 0..iters {
        if start.elapsed() > budget {
            eprintln!("run_toml fuzz: wall-clock budget reached after {done}/{iters} iterations");
            break;
        }
        // Half mutated-real, half pure-random.
        let input = if rng.gen::<bool>() {
            let base = &seeds[(rng.next_u32() as usize) % seeds.len()];
            let mut m: Vec<u8> = base.bytes().collect();
            let nmut = 1 + (rng.next_u32() as usize) % 8;
            for _ in 0..nmut {
                let i = (rng.next_u32() as usize) % m.len();
                m[i] = 32 + (rng.next_u32() % 95) as u8;
            }
            if rng.gen::<bool>() {
                m.truncate((rng.next_u32() as usize) % m.len());
            }
            String::from_utf8_lossy(&m).into_owned()
        } else {
            random_ascii(&mut rng, 400)
        };
        let _ = run_toml(&input); // Ok or Err, never a panic.
        done += 1;
    }
    // If the budget clips the run this far down, the gate has eroded — fail loudly
    // so the corpus/seed cost is re-examined instead of silently fuzzing less.
    assert!(
        done >= 100,
        "run_toml fuzz: only {done} iterations completed inside the {budget:?} budget"
    );
}

#[test]
fn time_cfg_validate_never_panics() {
    // validate() must return Result for any pair of floats, including NaN/inf/neg,
    // never panic (it guards an allocation downstream).
    let mut rng = ChaCha8Rng::seed_from_u64(2024);
    let weird = [f64::NAN, f64::INFINITY, f64::NEG_INFINITY, 0.0, -1.0, 1e300];
    for _ in 0..50_000 {
        let pick = |rng: &mut ChaCha8Rng| {
            if rng.gen::<f64>() < 0.2 {
                weird[(rng.next_u32() as usize) % weird.len()]
            } else {
                (rng.gen::<f64>() - 0.5) * 2e7
            }
        };
        let cfg = TimeCfg {
            step_s: pick(&mut rng),
            duration_s: pick(&mut rng),
        };
        let _ = cfg.validate(); // Ok or Err, but must not panic.
    }
}

#[test]
fn geodetic_round_trip_holds_everywhere() {
    // geodetic -> ECEF -> geodetic must recover the input to tight tolerance over
    // the whole globe and a wide altitude band.
    let mut rng = ChaCha8Rng::seed_from_u64(555);
    for _ in 0..50_000 {
        let lat = (rng.gen::<f64>() - 0.5) * std::f64::consts::PI * 0.999; // avoid exact poles
        let lon = (rng.gen::<f64>() - 0.5) * std::f64::consts::TAU;
        let alt = (rng.gen::<f64>() - 0.2) * 3e7; // -6000 km .. +24000 km
        let g = Geodetic {
            lat_rad: lat,
            lon_rad: lon,
            alt_m: alt,
        };
        let back = ecef_to_geodetic(geodetic_to_ecef(g));
        assert!((back.lat_rad - lat).abs() < 1e-9, "lat {lat}");
        // Longitude wraps; compare on the circle.
        let dlon = (back.lon_rad - lon).rem_euclid(std::f64::consts::TAU);
        let dlon = dlon.min(std::f64::consts::TAU - dlon);
        assert!(dlon < 1e-9, "lon {lon}");
        assert!(
            (back.alt_m - alt).abs() < 1e-3,
            "alt {alt}: {} vs {alt}",
            back.alt_m
        );
    }
}

#[test]
fn teme_to_ecef_preserves_norm() {
    // The TEME->ECEF rotation is orthogonal: it must preserve vector magnitude for
    // any position and any epoch.
    let mut rng = ChaCha8Rng::seed_from_u64(31415);
    for _ in 0..50_000 {
        let r = [
            (rng.gen::<f64>() - 0.5) * 8e7,
            (rng.gen::<f64>() - 0.5) * 8e7,
            (rng.gen::<f64>() - 0.5) * 8e7,
        ];
        let jd = 2_440_000.0 + rng.gen::<f64>() * 30_000.0;
        let e = teme_to_ecef(r, jd);
        let n0 = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
        let n1 = (e[0] * e[0] + e[1] * e[1] + e[2] * e[2]).sqrt();
        assert!(
            (n1 - n0).abs() <= 1e-6 * n0.max(1.0),
            "norm changed: {n0} -> {n1}"
        );
    }
}

/// The clock Kalman filter uses the Joseph-stabilised covariance update so the 2x2 state
/// covariance stays symmetric and positive-semidefinite under any predict/update sequence
/// — a naive (I-KH)P update loses both at extreme Q/R ratios. This drives thousands of
/// random filters (wide log-spread process noise, wide stable measurement noise, random
/// step sizes and measurements, random initial covariance) and asserts, after every step,
/// that the covariance is finite, symmetric, and PSD to a small relative tolerance.
///
/// Result (2026-06-28): under realistic operation — strictly-positive process noise and a
/// measurement noise that is stable per filter — the worst relative Cholesky pivot over the
/// whole random domain is about -1.2e-9, i.e. PSD holds to roundoff. (That is a hair past
/// the strict `is_psd()` 1e-9 pivot tolerance, so `is_psd()` can occasionally return false
/// by a part in 1e9 at the floating-point floor; the magnitude is numerically negligible.)
/// The covariance form only loses PSD *materially* under out-of-contract input — e.g.
/// swinging the per-update measurement variance by many orders of magnitude between
/// consecutive samples, which no real sensor does — so that regime is out of scope here.
#[test]
fn kalman_clock_covariance_stays_psd_and_symmetric() {
    // PSD to within 1e-6 relative; observed worst over this domain is ~1.2e-9 (roundoff).
    const PSD_TOL: f64 = 1e-6;
    let mut rng = ChaCha8Rng::seed_from_u64(20_260_628);
    // log-uniform draw over [10^lo, 10^hi]
    fn logu(rng: &mut ChaCha8Rng, lo: f64, hi: f64) -> f64 {
        10f64.powf(lo + (hi - lo) * rng.gen::<f64>())
    }

    let mut worst_slack = f64::INFINITY; // most-negative relative Cholesky pivot seen
    for _ in 0..1500 {
        // Supported operating domain: strictly-positive process noise (a literal
        // zero-process-noise clock is unphysical — it collapses the covariance toward a
        // singular matrix where any covariance-form filter loses relative PSD, ~1e-2 here)
        // and a positive measurement variance.
        let q_wf = logu(&mut rng, -26.0, -4.0);
        let q_rw = logu(&mut rng, -28.0, -6.0);
        let r0 = logu(&mut rng, -18.0, 2.0);
        let mut kf = KalmanClock::new(q_wf, q_rw, r0);
        if rng.gen::<bool>() {
            kf = kf.with_initial_cov(logu(&mut rng, -18.0, 4.0), logu(&mut rng, -24.0, 0.0));
        }

        let steps = 1 + (rng.next_u32() as usize) % 25;
        for step in 0..steps {
            if rng.gen::<bool>() {
                kf.predict(logu(&mut rng, -3.0, 5.0));
            } else {
                // Stable per-filter measurement noise: real sensors do not swing r by many
                // orders of magnitude between consecutive samples (an out-of-contract input
                // sequence the Joseph form is not expected to keep PSD under). z spans a
                // wide range.
                let z = (rng.gen::<f64>() - 0.5) * 2.0 * logu(&mut rng, -6.0, 6.0);
                kf.update(z);
            }

            let c = kf.covariance();
            assert!(
                c.iter().flatten().all(|x| x.is_finite()),
                "covariance went non-finite after step {step} (q_wf={q_wf:e} q_rw={q_rw:e} r0={r0:e}): {c:?}"
            );
            // Symmetry must hold to roundoff.
            assert!(
                (c[0][1] - c[1][0]).abs() <= 1e-9 * (1.0 + c[0][1].abs().max(c[1][0].abs())),
                "covariance lost symmetry after step {step}: {} vs {} (q_wf={q_wf:e} q_rw={q_rw:e} r0={r0:e})",
                c[0][1],
                c[1][0]
            );
            // PSD via Cholesky pivots, each taken relative to the matrix scale.
            let scale = c[0][0].abs().max(c[1][1].abs()).max(1e-300);
            let piv0 = c[0][0] / scale;
            let schur = if c[0][0] > 0.0 {
                let l10 = c[1][0] / c[0][0].sqrt();
                (c[1][1] - l10 * l10) / scale
            } else {
                c[1][1] / scale
            };
            let slack = piv0.min(schur);
            worst_slack = worst_slack.min(slack);
            assert!(
                slack >= -PSD_TOL,
                "covariance non-PSD beyond tolerance after step {step}: relative pivot {slack:e} < -{PSD_TOL:e} (q_wf={q_wf:e} q_rw={q_rw:e} r0={r0:e}): {c:?}"
            );
        }
    }
    // Surfaces the achievable bound under `cargo test -- --nocapture`.
    eprintln!("kalman PSD invariant: worst relative Cholesky pivot over the random domain = {worst_slack:e}");
}
