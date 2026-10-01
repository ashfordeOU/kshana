// SPDX-License-Identifier: AGPL-3.0-only
//! M010 oracle: observable-level spoofing monitors against the published JammerTest 2024 onsets.
//!
//! Oracle (Measured): the spoofing onset times published in the JammerTest 2024 transmission plan
//! (Jammertest Consortium, 2024-09-13), applied to the real pseudoranges of the stationary u-blox
//! ZED-F9P receiver in the JammerTest 2024 dataset (Zenodo record 15911589,
//! doi:10.5281/zenodo.15910563, GPL-3.0-or-later), with IGS merged broadcast orbits and clocks
//! (BRDC00IGS_R_20242550000_01D_MN).
//!
//! Tolerance, fixed in the promotion record before the first run: the first alarm of the
//! monitors falls within 10 s after every published onset (onset <= t <= onset + 10 s), and no
//! alarm is raised in any pre-onset window. Scope fixed at the same time: the RAIM parity test and
//! the clock-aided monitor (`security::min_detectable_offset_ns`, k = 5) on GPS L1 C/A + L2C,
//! stationary receiver, sub-scenarios that spoof GPS. The fused figure of merit, AGC and SQM need
//! IF data and are outside the claim.
//!
//! Verdict (see the record): DISAGREES. The test pins the measured outcome.

#[path = "jammertest_spoof_oracle_support/mod.rs"]
mod support;

use support::*;

/// The outcome recorded in the promotion record (M010, run 2026-10-01): per onset, the number of
/// pre-onset alarms and the first alarm's latency after the published onset (s, 0.01 s).
const RECORDED: [(&str, usize, f64); 8] = [
    ("2.1.1", 81, 0.20),
    ("2.1.2", 0, 10.20),
    ("2.1.4", 0, 17.20),
    ("2.3.5", 0, 39.00),
    ("2.3.10", 0, 39.00),
    ("2.3.11", 0, 15.19),
    ("2.3.15", 64, 0.19),
    ("2.3.12", 173, 0.20),
];

/// The comparison against the published onsets, run with the pre-registered monitors and
/// tolerance. The oracle disagrees: no onset meets the tolerance (four are first seen 10.2 s to
/// 39 s after the published slot start, and three pre-onset windows carry alarms), so the row stays
/// MODELLED. This test reproduces that recorded finding exactly; it does not assert agreement.
#[test]
fn monitors_against_the_published_onsets_reproduce_the_recorded_disagreement() {
    let mut agreeing = 0;
    let mut evaluated = 0;
    for (o, (id, pre_alarms, latency)) in onsets().iter().zip(RECORDED) {
        let r = run_onset(o);
        assert_eq!(r.id, id);
        let lat = r.detection.map(|(t, _)| t - r.onset);
        let ok = r.evaluable
            && r.pre_onset_alarms.is_empty()
            && lat.is_some_and(|l| (0.0..=DETECT_TOL_S).contains(&l));
        if r.evaluable {
            evaluated += 1;
        }
        if ok {
            agreeing += 1;
        }
        println!(
            "{:<7} evaluable={} cal_n={} bound={:.1} ns pre_epochs={} pre_alarms={} first_pre={:?} detection={:?} latency={:?} -> {}",
            r.id,
            r.evaluable,
            r.cal_samples,
            r.bound_ns,
            r.pre_onset_epochs,
            r.pre_onset_alarms.len(),
            r.pre_onset_alarms.first().map(|(t, k)| (t - r.onset, *k)),
            r.detection.map(|(_, k)| k),
            lat,
            if ok { "AGREES" } else { "DISAGREES" }
        );
        assert_eq!(
            r.pre_onset_alarms.len(),
            pre_alarms,
            "{id}: pre-onset alarms"
        );
        let lat = lat.expect("every onset has a first alarm inside the horizon");
        assert!((lat - latency).abs() < 0.01, "{id}: latency {lat}");
    }
    assert_eq!(
        evaluated, 8,
        "all eight pre-registered onsets are evaluable"
    );
    assert_eq!(
        agreeing, 0,
        "the recorded finding: no onset meets the tolerance"
    );
}
