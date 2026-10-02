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

/// The strict comparison against the logged onsets.
#[test]
#[ignore = "pre-registered; not yet run"]
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
