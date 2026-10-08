// SPDX-License-Identifier: AGPL-3.0-only
//! D11: the clock-ensemble 3-sigma bound covers the flicker floor, and the filter-health
//! check sees the flicker truth.
//!
//! Pre-registered bars (written before the first run of the implementation):
//!
//! * **B1 coverage.** `integrity.mean >= 0.99` for BOTH clocks on the shipped
//!   `scenarios/clock-ensemble.toml` (seed 42, 200 runs, step 10 s, 2 h, GNSS denied from
//!   600 s), and `integrity.p05 >= 0.9`. Before the fix: 0.40866 / 0.33026 and p05 0.017 / 0.027.
//! * **B2 no change at floor 0.** The same scenario with both flicker floors set to 0 (the
//!   control: scenario before commit 67fed19e added the floor) reproduces the pre-fix figures
//!   exactly: integrity 0.99759 / 0.99869, NIS / NEES 1.0217 / 1.9722 (classical) and
//!   0.9812 / 2.2078 (quantum), holdover 4050.5 s / 6600 s. The code path without a flicker
//!   floor is untouched; this pins its figures.
//! * **B3 health sees the truth.** With the shipped floors the pooled NIS and NEES of the
//!   matched extended filter fall inside their chi-square bands (`filter_health::tests`), and
//!   the two-state filter against the classical flicker truth reports `consistent = false`.
//!   (The quantum floor, 1e-16, is far below the 0.1 ns phase measurement noise during sync,
//!   so the two-state filter is not distinguishable from the matched one there; only the
//!   matched case is asserted for it.)
//! * **B4 not trivially inflated.** Proposed replacement, pending sign-off:
//!   `RMS(error / 1-sigma bound)` over all outage samples and runs lies in `[0.7, 1.3]` for
//!   both clocks (1.0 for a matched bound). The original "coverage <= 0.9995" cannot be
//!   asserted: within a run the flicker error is nearly a constant random frequency, so the
//!   200-run mean of the coverage has a sampling standard deviation of about 0.004 even for a
//!   perfectly matched bound (expected 0.9973).
//! * **B5 truth untouched.** `timing_p95_ns.mean` and `holdover_s.mean` of the shipped
//!   scenario equal the pre-fix values: 167.03 / 8.78e-4 ns and 844.1 / 6600 s.
//! * **B6 report-only.** Any golden or matrix value that moves is reported, not re-pinned.

use kshana::api::run_toml;

const SHIPPED: &str = include_str!("../scenarios/clock-ensemble.toml");

fn figures(src: &str) -> serde_json::Value {
    serde_json::from_str(&run_toml(src).expect("scenario runs").json).expect("json")
}

fn stat(v: &serde_json::Value, clock: &str, path: &[&str]) -> f64 {
    let mut x = &v[clock];
    for p in path {
        x = &x[*p];
    }
    x.as_f64()
        .unwrap_or_else(|| panic!("{clock} {path:?} missing"))
}

#[test]
fn the_shipped_floors_keep_the_three_sigma_bound_covering() {
    let v = figures(SHIPPED);
    for clock in ["quantum", "classical"] {
        let mean = stat(&v, clock, &["integrity", "mean"]);
        let p05 = stat(&v, clock, &["integrity", "p05"]);
        assert!(
            mean >= 0.99,
            "{clock}: integrity.mean {mean} < 0.99 (was 0.41 / 0.33)"
        );
        assert!(p05 >= 0.9, "{clock}: integrity.p05 {p05} < 0.9");
    }
}

#[test]
fn the_truth_and_holdover_are_untouched_by_the_bound() {
    let v = figures(SHIPPED);
    let near = |a: f64, b: f64| (a - b).abs() <= 0.005 * b.abs();
    assert!(near(
        stat(&v, "classical", &["timing_p95_ns", "mean"]),
        167.03
    ));
    assert!(near(
        stat(&v, "quantum", &["timing_p95_ns", "mean"]),
        8.78e-4
    ));
    assert!(near(stat(&v, "classical", &["holdover_s", "mean"]), 844.1));
    assert!(near(stat(&v, "quantum", &["holdover_s", "mean"]), 6600.0));
}

#[test]
fn a_zero_floor_reproduces_the_pre_fix_figures() {
    // The control: the shipped scenario without its flicker floors.
    let control = SHIPPED
        .replace("flicker_floor = 1.0e-16", "flicker_floor = 0.0")
        .replace("flicker_floor = 2.0e-11", "flicker_floor = 0.0");
    assert_ne!(control, SHIPPED);
    let v = figures(&control);
    let close = |a: f64, b: f64| (a - b).abs() <= 6e-5 * b.abs().max(1.0);
    assert!(close(
        stat(&v, "classical", &["integrity", "mean"]),
        0.99759
    ));
    assert!(close(stat(&v, "quantum", &["integrity", "mean"]), 0.99869));
    assert!(close(
        stat(&v, "classical", &["filter_health", "nis_mean"]),
        1.0217
    ));
    assert!(close(
        stat(&v, "classical", &["filter_health", "nees_mean"]),
        1.9722
    ));
    assert!(close(
        stat(&v, "quantum", &["filter_health", "nis_mean"]),
        0.9812
    ));
    assert!(close(
        stat(&v, "quantum", &["filter_health", "nees_mean"]),
        2.2078
    ));
    assert!(close(
        stat(&v, "classical", &["holdover_s", "mean"]),
        4050.5
    ));
    assert!(close(stat(&v, "quantum", &["holdover_s", "mean"]), 6600.0));
}
