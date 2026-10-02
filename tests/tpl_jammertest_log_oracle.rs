// SPDX-License-Identifier: AGPL-3.0-only
//! M011 round 2 oracle: the Timing Protection Level of the three-state clock-aided monitor
//! against the measured served-time error of a real receiver at the LOGGED JammerTest 2024
//! spoofing onsets.
//!
//! Pre-registration (written 2026-10-02, committed before the official log was fetched).
//!
//! Why a new comparison: round 1 (`tests/tpl_jammertest_coverage_oracle.rs`) measured latencies
//! from the transmission plan's scheduled slot starts (not RF onsets) and evaluated the TPL with
//! q_drift = 0 and a monitor whose false alarms latched. Here the onsets come from the official
//! log of the test week ("Logg_Jammertest_2024_v1.xlsx", read exactly as pre-registered in
//! `tests/spoof_detection_jammertest_log_oracle.rs`), the monitor is the engine's three-state
//! non-latching `spoof_monitors::ClockAidedMonitor`, and the TPL is
//! `tpl::timing_protection_level_drift_ns`. Disclosed: the round-1 results were seen before this
//! pre-registration.
//!
//! Inputs: as M010 round 2 (same slices, logged onsets, windows, scope and monitors).
//!
//! Definitions (fixed now, the round-1 definitions with the M010 round-2 monitor):
//! - detection epoch t_d: the first alarm of the round-2 monitors in
//!   [onset, min(logged stop, onset + 300 s)]; onsets with no alarm are reported, not scored;
//! - reference clock: least-squares line (bias and drift) through all pre-onset clock samples from
//!   cal_start that the round-2 monitors did not alarm, extrapolated forward (unchanged);
//! - measured undetected served-time error: max |clock - reference| over epochs with
//!   onset <= t < t_d (zero if the first epoch at or after the onset alarms);
//! - TPL: `timing_protection_level_drift_ns(noise, 1 s, k = 5, latency = t_d - onset)` with the
//!   monitor's noise levels (Hadamard fit of the 60 s calibration raised to the TCXO class floor).
//!
//! Tolerance (the round-1 plan's, unchanged): at every detected onset the measured undetected
//! served-time error is at or below the TPL; PROMOTE only if at least one onset is detected and
//! every detected onset is inside.

#[path = "jammertest_spoof_oracle_support/mod.rs"]
mod support;

use kshana::security::SPOOF_DETECT_K;
use kshana::tpl::timing_protection_level_drift_ns;
use support::*;

pub struct TplRow {
    pub id: String,
    pub latency_s: f64,
    pub undetected_err_ns: f64,
    pub tpl_ns: f64,
}

fn tpl_rows() -> (Vec<TplRow>, Vec<String>) {
    let mut rows = Vec::new();
    let mut undetected = Vec::new();
    for o in onsets_from("onsets_log.tsv") {
        let (r, n) = run_onset_r2(&o);
        let (Some((t_d, _)), Some(noise)) = (r.detection, n.noise) else {
            undetected.push(r.id.clone());
            continue;
        };
        let pre: Vec<(f64, f64)> = r
            .epochs
            .iter()
            .filter(|e| e.t >= r.cal_start && e.t < r.onset && e.alarm.is_none())
            .filter_map(|e| e.clock_s.map(|c| (e.t, c)))
            .collect();
        let (pts, pys): (Vec<f64>, Vec<f64>) = pre.iter().copied().unzip();
        let undetected_err_ns = r
            .epochs
            .iter()
            .filter(|e| e.t >= r.onset && e.t < t_d)
            .filter_map(|e| {
                e.clock_s
                    .map(|c| (c - line_predict(&pts, &pys, e.t)).abs() * 1e9)
            })
            .fold(0.0_f64, f64::max);
        let latency_s = t_d - r.onset;
        rows.push(TplRow {
            id: r.id.clone(),
            latency_s,
            undetected_err_ns,
            tpl_ns: timing_protection_level_drift_ns(&noise, 1.0, SPOOF_DETECT_K, latency_s),
        });
    }
    (rows, undetected)
}

/// The strict comparison against the logged onsets. Run 2026-10-02: DISAGREES (see the pinned
/// test below).
#[test]
#[ignore = "pre-registered; run 2026-10-02: DISAGREES, measured undetected error above the TPL at 4 of 10 detected onsets (2.1.1 634.7 vs 458.5 ns, 2.3.5 232.6 vs 16.2 ns, 2.3.10 41.3 vs 6.0 ns, 2.6.3 218.6 vs 47.4 ns)"]
fn measured_time_error_is_inside_the_drift_state_tpl_at_every_logged_detection() {
    let (rows, undetected) = tpl_rows();
    for row in &rows {
        println!(
            "{:<7} latency={:6.1} s undetected_err={:10.1} ns TPL={:8.1} ns -> {}",
            row.id,
            row.latency_s,
            row.undetected_err_ns,
            row.tpl_ns,
            if row.undetected_err_ns <= row.tpl_ns {
                "inside"
            } else {
                "OUTSIDE"
            }
        );
    }
    println!("undetected: {undetected:?}");
    assert!(!rows.is_empty());
    let outside: Vec<&str> = rows
        .iter()
        .filter(|r| r.undetected_err_ns > r.tpl_ns)
        .map(|r| r.id.as_str())
        .collect();
    assert!(outside.is_empty(), "outside the TPL: {outside:?}");
}

/// The round-2 outcome (2026-10-02), pinned: measured undetected error and TPL (ns, 0.1 ns).
#[test]
fn drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement() {
    let (rows, undetected) = tpl_rows();
    assert!(undetected.is_empty());
    let want = [
        ("2.1.1", 634.7, 458.5),
        ("2.1.2", 0.0, 12.2),
        ("2.1.4", 0.0, 4.1),
        ("2.3.5", 232.6, 16.2),
        ("2.3.10", 41.3, 6.0),
        ("2.3.11", 0.0, 15.6),
        ("2.3.15", 0.0, 2.6),
        ("2.3.12", 0.0, 4.0),
        ("2.6.1", 179.9, 295.3),
        ("2.6.3", 218.6, 47.4),
    ];
    assert_eq!(rows.len(), want.len());
    for (r, (id, err, tpl)) in rows.iter().zip(want) {
        assert_eq!(r.id, id);
        assert!(
            (r.undetected_err_ns - err).abs() < 0.1,
            "{id}: {}",
            r.undetected_err_ns
        );
        assert!((r.tpl_ns - tpl).abs() < 0.1, "{id}: {}", r.tpl_ns);
    }
}
