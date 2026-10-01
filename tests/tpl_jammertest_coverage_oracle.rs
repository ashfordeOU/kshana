// SPDX-License-Identifier: AGPL-3.0-only
//! M011 oracle: the Timing Protection Level against the measured served-time error of a real
//! receiver at the published JammerTest 2024 spoofing onsets.
//!
//! Oracle (Measured): the served-time error of the stationary u-blox ZED-F9P receiver in the
//! JammerTest 2024 dataset (Zenodo record 15911589, doi:10.5281/zenodo.15910563,
//! GPL-3.0-or-later), measured from its real pseudoranges with IGS merged broadcast orbits and
//! clocks, at the spoofing onsets published in the JammerTest 2024 transmission plan. Same slices,
//! onsets, windows and monitors as `tests/spoof_detection_jammertest_oracle.rs` (M010).
//!
//! Tolerance, fixed in the promotion record before the first run: at every detected onset, the
//! measured undetected served-time error (max |clock - pre-onset reference line| over the epochs
//! from the published onset up to, not including, the first alarm) is at or below the nominal
//! `tpl::timing_protection_level_ns` with q_wf, q_rw and r from the 60 s calibration,
//! q_drift = 0, tau = 1 s, one sample, k = 5 and the measured latency from the published onset.
//!
//! Verdict (see the record): DISAGREES. The test pins the measured outcome.

#[path = "jammertest_spoof_oracle_support/mod.rs"]
mod support;

use kshana::security::SPOOF_DETECT_K;
use kshana::tpl::{timing_protection_level_ns, tpl_band, TplInputs};
use support::*;

struct TplRow {
    id: String,
    latency_s: f64,
    undetected_err_ns: f64,
    alarm_epoch_err_ns: Option<f64>,
    tpl_ns: f64,
    band_ns: (f64, f64),
}

fn tpl_rows() -> (Vec<TplRow>, Vec<String>) {
    let mut rows = Vec::new();
    let mut undetected = Vec::new();
    for o in onsets() {
        let r = run_onset(&o);
        let Some((t_d, _)) = r.detection else {
            undetected.push(r.id.clone());
            continue;
        };
        // Reference line through every accepted pre-onset clock sample.
        let pre: Vec<(f64, f64)> = r
            .epochs
            .iter()
            .filter(|e| e.t >= r.cal_start && e.t < r.onset && e.alarm.is_none())
            .filter_map(|e| e.clock_s.map(|c| (e.t, c)))
            .collect();
        let (pts, pys): (Vec<f64>, Vec<f64>) = pre.iter().copied().unzip();
        let err = |t: f64, c: f64| (c - line_predict(&pts, &pys, t)).abs() * 1e9;
        let undetected_err_ns = r
            .epochs
            .iter()
            .filter(|e| e.t >= r.onset && e.t < t_d)
            .filter_map(|e| e.clock_s.map(|c| err(e.t, c)))
            .fold(0.0_f64, f64::max);
        let alarm_epoch_err_ns = r
            .epochs
            .iter()
            .find(|e| e.t == t_d)
            .and_then(|e| e.clock_s.map(|c| err(e.t, c)));
        let inp = TplInputs {
            q_wf: r.q_wf,
            q_rw: r.q_rw,
            q_drift: 0.0,
            r: r.r,
            tau: 1.0,
            samples: 1.0,
            k: SPOOF_DETECT_K,
            detection_latency_s: t_d - r.onset,
        };
        let band = tpl_band(&inp, 1.0);
        rows.push(TplRow {
            id: r.id.clone(),
            latency_s: t_d - r.onset,
            undetected_err_ns,
            alarm_epoch_err_ns,
            tpl_ns: timing_protection_level_ns(&inp),
            band_ns: (band.low_ns, band.high_ns),
        });
    }
    (rows, undetected)
}

/// The comparison, run with the pre-registered definitions. The oracle disagrees: at three of the
/// eight detected onsets (2.1.4, 2.3.5, 2.3.11) the measured undetected served-time error exceeds the
/// nominal TPL (by 5.3x, 1.9x and 2.1x), so the row stays MODELLED. This test reproduces that
/// recorded finding; it does not assert agreement.
#[test]
fn tpl_against_measured_time_error_reproduces_the_recorded_disagreement() {
    let (rows, undetected) = tpl_rows();
    for row in &rows {
        println!(
            "{:<7} latency={:6.1} s undetected_err={:10.1} ns alarm_epoch_err={:?} TPL={:8.1} ns band=[{:.1}, {:.1}] -> {}",
            row.id,
            row.latency_s,
            row.undetected_err_ns,
            row.alarm_epoch_err_ns.map(|x| x.round()),
            row.tpl_ns,
            row.band_ns.0,
            row.band_ns.1,
            if row.undetected_err_ns <= row.tpl_ns { "inside" } else { "OUTSIDE" }
        );
    }
    assert!(
        undetected.is_empty(),
        "every onset has an alarm in the horizon"
    );
    assert_eq!(rows.len(), 8);
    let outside: Vec<&str> = rows
        .iter()
        .filter(|r| r.undetected_err_ns > r.tpl_ns)
        .map(|r| r.id.as_str())
        .collect();
    assert_eq!(
        outside,
        ["2.1.4", "2.3.5", "2.3.11"],
        "the recorded finding"
    );
    // The recorded magnitudes (ns): measured undetected error and nominal TPL.
    for (id, err, tpl) in [
        ("2.1.4", 184.3, 34.6),
        ("2.3.5", 295.7, 159.3),
        ("2.3.11", 143.0, 69.0),
    ] {
        let r = rows.iter().find(|r| r.id == id).unwrap();
        assert!(
            (r.undetected_err_ns - err).abs() < 0.1,
            "{id}: {}",
            r.undetected_err_ns
        );
        assert!((r.tpl_ns - tpl).abs() < 0.1, "{id}: {}", r.tpl_ns);
    }
}
