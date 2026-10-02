// SPDX-License-Identifier: AGPL-3.0-only
//! M010 round 2 oracle: observable-level spoofing monitors against the LOGGED JammerTest 2024
//! transmission onsets.
//!
//! Pre-registration (written 2026-10-02, committed before the official log was fetched).
//!
//! Why a new comparison: round 1 (`tests/spoof_detection_jammertest_oracle.rs`) scored the
//! monitors against the transmission plan's scheduled slot starts, which have one-minute
//! resolution and are not radio-frequency (RF) onsets; its record found the first observable
//! effect 10.2 s to 39 s after the scheduled start. The organisers publish an official log of
//! the test week ("Logg_Jammertest_2024_v1.xlsx", Jammertest consortium: Norwegian Public Roads
//! Administration, Norwegian Communications Authority and partners, listed on
//! https://www.jammertest.no/previous-jammertests/), which records the actual transmissions,
//! including deviations from the plan. That log is the onset oracle here. Disclosed: the round-1
//! results (latencies and false alarms per onset) were seen before this pre-registration.
//!
//! Quantity: for each spoofing sub-scenario of the round-1 scope (GPS-spoofing sub-scenarios
//! recorded by the stationary u-blox ZED-F9P receiver: 2.1.1, 2.1.2, 2.1.4, 2.3.5, 2.3.10,
//! 2.3.11, 2.3.15, 2.3.12, and 2.6.1 and 2.6.3/2.6.4 if they become evaluable), the latency of
//! the first monitor alarm after the logged onset, and the alarms in the pre-onset window.
//!
//! Inputs: the round-1 real observables (JammerTest 2024 dataset, Sayyaf, Ortiz and Renaudin,
//! Zenodo record 15911589, doi 10.5281/zenodo.15910563, GPL-3.0-or-later) and IGS merged broadcast
//! navigation (BRDC00IGS_R_20242550000_01D_MN), as cut by the round-1 generator (re-cut with the
//! same generator if a logged window falls outside a slice).
//!
//! Reading the log (fixed now): the onset of a sub-scenario is the earliest logged start time of
//! a transmission of that test identifier on the recording's date that falls inside the
//! recording; the slot end is the logged stop time of that transmission. Local times (CEST) are
//! converted to GPS time as local - 2 h + 18 s; times stated in UTC as UTC + 18 s. The pre-onset
//! window starts at cal_start = max(recording start, logged stop of the previous transmission in
//! the log, onset - 240 s) as in round 1. If the log gives the start at a resolution coarser than
//! one second for a sub-scenario, that sub-scenario's onset is rounded to the stated value and the
//! resolution is reported; if the log does not cover a sub-scenario, it keeps the round-1 slot
//! start and is reported as not log-timed. If the log gives no times at all, the row is BLOCKED
//! and nothing is run.
//!
//! Monitors (fixed now; engine commit 67058426): the round-1 RAIM parity test and solve-failure
//! rule unchanged, and the clock-aided monitor replaced by
//! `spoof_monitors::ClockAidedMonitor` (phase, frequency and drift states; non-latching) with
//! noise levels from `spoof_monitors::hadamard_noise_fit` on the 60 s calibration phase record,
//! raised to `ClockClass::Tcxo` (the receiver's oscillator class) by `with_class_floor`, and
//! k = `security::SPOOF_DETECT_K` = 5. An epoch alarmed by RAIM or by a solve failure is not used
//! to update the clock. Pipeline: `tests/jammertest_spoof_oracle_support/mod.rs::run_onset_r2`.
//! The round-1 monitors are also re-scored against the logged onsets and reported, not scored.
//!
//! Tolerance (the round-1 plan's, unchanged): detection within 10 s of every logged onset
//! (onset <= first alarm <= onset + 10 s) and zero alarms in every pre-onset window, at every
//! evaluable onset (evaluable as in round 1: at least 15 s of pre-onset window after the 60 s
//! calibration and at least 10 calibration samples). PROMOTE only if all evaluable onsets agree
//! and at least the eight round-1 onsets are evaluable.

#[path = "jammertest_spoof_oracle_support/mod.rs"]
mod support;

use support::*;

/// The strict comparison against the logged onsets. Run 2026-10-02: DISAGREES at 6 of 10
/// evaluable onsets (see the pinned test below).
#[test]
#[ignore = "pre-registered; run 2026-10-02: DISAGREES at 6 of 10 logged onsets (2.1.1 first alarm +211 s, 2.3.5 +23 s, 2.3.10 +18 s, 2.6.1 +51 s; pre-onset clock false alarms at 2.1.4 (1) and 2.3.15 (85))"]
fn engine_monitors_detect_the_logged_onsets_within_10_s_without_false_alarms() {
    let os = onsets_from("onsets_log.tsv");
    let mut evaluated = 0;
    let mut failures = Vec::new();
    for o in &os {
        let (r, _) = run_onset_r2(o);
        let lat = r.detection.map(|(t, _)| t - r.onset);
        println!(
            "{:<7} evaluable={} cal_n={} bound={:.1} ns pre_epochs={} pre_alarms={} first_pre={:?} detection={:?} latency={:?}",
            r.id,
            r.evaluable,
            r.cal_samples,
            r.bound_ns,
            r.pre_onset_epochs,
            r.pre_onset_alarms.len(),
            r.pre_onset_alarms.first().map(|(t, k)| (t - r.onset, *k)),
            r.detection.map(|(_, k)| k),
            lat
        );
        if !r.evaluable {
            continue;
        }
        evaluated += 1;
        let ok =
            r.pre_onset_alarms.is_empty() && lat.is_some_and(|l| (0.0..=DETECT_TOL_S).contains(&l));
        if !ok {
            failures.push(r.id.clone());
        }
    }
    assert!(evaluated >= 8, "only {evaluated} evaluable onsets");
    assert!(
        failures.is_empty(),
        "onsets outside the tolerance: {failures:?}"
    );
}

/// Reported, not scored (pre-registered): the round-1 monitors (fixed line-prediction clock
/// bound, latching) re-scored against the logged onsets.
#[test]
fn round_1_monitors_rescored_against_the_logged_onsets() {
    for o in onsets_from("onsets_log.tsv") {
        let r = run_onset(&o);
        println!(
            "R1 {:<7} evaluable={} bound={:.1} ns pre_alarms={} first_pre={:?} detection={:?} latency={:?}",
            r.id,
            r.evaluable,
            r.bound_ns,
            r.pre_onset_alarms.len(),
            r.pre_onset_alarms.first().map(|(t, k)| (t - r.onset, *k)),
            r.detection.map(|(_, k)| k),
            r.detection.map(|(t, _)| t - r.onset)
        );
    }
}

/// The round-2 outcome (2026-10-02), pinned: per logged onset, the pre-onset alarm count and the
/// first alarm's latency (s, 0.01 s) of the engine monitors. Four onsets agree (2.1.2, 2.3.11,
/// 2.3.12, 2.6.3); the row stays MODELLED.
const RECORDED_R2: [(&str, usize, f64); 10] = [
    ("2.1.1", 0, 211.20),
    ("2.1.2", 0, 0.20),
    ("2.1.4", 1, 0.20),
    ("2.3.5", 0, 23.00),
    ("2.3.10", 0, 18.00),
    ("2.3.11", 0, 0.19),
    ("2.3.15", 85, 0.19),
    ("2.3.12", 0, 0.20),
    ("2.6.1", 0, 51.00),
    ("2.6.3", 0, 1.19),
];

#[test]
fn engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement() {
    let os = onsets_from("onsets_log.tsv");
    assert_eq!(os.len(), RECORDED_R2.len());
    let mut agreeing = Vec::new();
    for (o, (id, pre, lat)) in os.iter().zip(RECORDED_R2) {
        let (r, _) = run_onset_r2(o);
        assert_eq!(r.id, id);
        assert!(r.evaluable, "{id}");
        assert_eq!(r.pre_onset_alarms.len(), pre, "{id}: pre-onset alarms");
        let l = r.detection.map(|(t, _)| t - r.onset).expect("detected");
        assert!((l - lat).abs() < 0.01, "{id}: latency {l}");
        if pre == 0 && (0.0..=DETECT_TOL_S).contains(&l) {
            agreeing.push(id);
        }
    }
    assert_eq!(agreeing, ["2.1.2", "2.3.11", "2.3.12", "2.6.3"]);
}
