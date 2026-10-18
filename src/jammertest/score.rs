// SPDX-License-Identifier: AGPL-3.0-only
//! Scoring a receiver log against a Jammertest schedule: per test, how long the monitors
//! took to alarm, whether they missed it, how long they took to settle afterwards, and how
//! often they alarmed outside every scheduled test.
//!
//! Everything here is computed from a finished `receiver-trust` run and the scheduled events;
//! the definitions are fixed in `xval/jammertest-score/PREREGISTRATION.md` before the first
//! scored run. The schedule is "scheduled truth": a slot is when a test was planned, not when
//! a transmitter was on, so a latency is measured from the planned start and is an upper bound
//! on the true detection delay where the transmitter began late, and a missed alarm may be a
//! test that never ran. The result is MODELLED: no external oracle states the true on-air
//! times.

use super::plan::ImportedEvent;
use crate::receiver_trust::monitors::{Monitor, TrustState};
use crate::receiver_trust::scenario::{EventKind, EventScore, ReceiverTrustResult};
use serde::Serialize;

/// The label every scorecard carries.
pub const SCORE_LABEL: &str = "MODELLED: scored against the scheduled slots of the published \
test plan, not against recorded on-air times; no external oracle states when a transmitter was on";

/// Rules fixed before the run.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ScoreOptions {
    /// A test counts as recovered at the first epoch after its slot ends from which no monitor
    /// alarms for this long, s. Default 10 s.
    pub recover_hold_s: f64,
    /// An alarm run that starts within this long before a slot, or ends within this long after
    /// the recovery of one, belongs to that slot, not to the false alarms, s. Default 60 s,
    /// the guard of the JammerTest 2024 calibration.
    pub guard_s: f64,
}

impl Default for ScoreOptions {
    fn default() -> Self {
        Self {
            recover_hold_s: 10.0,
            guard_s: 60.0,
        }
    }
}

/// The score of one scheduled test.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TestScore {
    /// Catalogue id (`type.group.test`), as the plan writes it.
    pub test_id: String,
    /// The catalogue's name for the test.
    pub test_name: String,
    /// Edition year of the plan.
    pub year: u32,
    /// Test area.
    pub location_id: u32,
    /// The plan's `status` field, as written (mostly empty).
    pub plan_status: String,
    /// Kind of interference the catalogue gives the test.
    pub kind: EventKind,
    /// Planned start, s since the first epoch of the log.
    pub onset_s: f64,
    /// Planned end, s.
    pub end_s: f64,
    /// Whether the test can be scored: inside the log and starting at least `guard_s` after calibration.
    pub evaluable: bool,
    /// `detected`, `late`, `missed` or `not-evaluable`, by the receiver-trust rule
    /// (`compare.detect_tol_s`).
    pub outcome: String,
    /// First alarm minus planned start, s.
    pub latency_s: Option<f64>,
    /// The monitors that raised the first alarm.
    pub first_monitors: Vec<Monitor>,
    /// Whether the monitors settled after the slot: no alarm for `recover_hold_s` before the next
    /// test or the end of the log. `None` when the test was not evaluable or never alarmed.
    pub recovered: Option<bool>,
    /// Slot end to the start of the first alarm-free stretch, s.
    pub time_to_recover_s: Option<f64>,
}

/// Totals over the tests.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ScoreSummary {
    /// Tests scheduled in the log.
    pub tests: usize,
    /// Tests that could be scored.
    pub evaluable: usize,
    /// Detected within the tolerance.
    pub detected: usize,
    /// Alarmed, but later than the tolerance.
    pub late: usize,
    /// Never alarmed inside the slot.
    pub missed: usize,
    /// (detected + late) / evaluable, where there are evaluable tests.
    pub detection_rate: Option<f64>,
    /// Detected / evaluable.
    pub detected_in_tolerance_rate: Option<f64>,
    /// Median first-alarm latency over the tests that alarmed, s.
    pub median_latency_s: Option<f64>,
    /// Median time to recover over the tests that recovered, s.
    pub median_time_to_recover_s: Option<f64>,
    /// Alarm runs that lie outside every slot and its guard, after calibration.
    pub false_alarm_runs: usize,
    /// Alarmed epochs in those runs.
    pub false_alarm_epochs: usize,
    /// Post-calibration epochs outside every slot and its guard.
    pub clean_epochs: usize,
    /// Clean time, hours, from the median epoch spacing.
    pub clean_hours: Option<f64>,
    /// `false_alarm_epochs` / `clean_epochs`.
    pub false_alarm_epoch_rate: Option<f64>,
    /// False-alarm runs per hour of clean time, from the epoch spacing of the log.
    pub false_alarm_runs_per_hour: Option<f64>,
}

/// The whole score.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Scorecard {
    /// [`SCORE_LABEL`].
    pub label: &'static str,
    /// The advisory statement.
    pub advisory: &'static str,
    /// SHA-256 over the scenario and log bytes the run used.
    pub scenario_hash: String,
    /// The rules used.
    pub options: ScoreOptions,
    /// A scheduled test starts less than `guard_s` after calibration ended, so the baseline may
    /// have been formed under interference. A harness that pools logs drops such a log.
    pub baseline_contaminated: bool,
    /// One score per scheduled test, by planned start.
    pub tests: Vec<TestScore>,
    /// Totals.
    pub summary: ScoreSummary,
}

pub(crate) fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        (v[n / 2 - 1] + v[n / 2]) / 2.0
    })
}

/// Score a finished run against the scheduled events it was run with. `events` must be the
/// events of the scenario the run used, in the same order, one metadata entry each.
pub fn score_run(
    result: &ReceiverTrustResult,
    events: &[ImportedEvent],
    opt: &ScoreOptions,
) -> Result<Scorecard, String> {
    if events.len() != result.events.len() {
        return Err(format!(
            "{} scheduled events but the run scored {}: pass the run's own events",
            events.len(),
            result.events.len()
        ));
    }
    let rules_ok = opt.recover_hold_s.is_finite()
        && opt.recover_hold_s > 0.0
        && opt.guard_s.is_finite()
        && opt.guard_s >= 0.0;
    if !rules_ok {
        return Err("recover_hold_s must be positive and guard_s not negative".into());
    }
    let epochs = &result.epochs;
    // A test is scored only if its baseline was formed in the clear: its slot starts at least
    // `guard_s` after the end of calibration (the rule of the 2024 calibration pre-registration).
    let first_scorable_s = result.monitor_config.calibration_s + opt.guard_s;
    let baseline_contaminated = result.events.iter().any(|e| e.onset_s < first_scorable_s);
    let alarmed = |i: usize| !epochs[i].alarms.is_empty();
    // Slots in time order, so "the next test" is well defined for the recovery search.
    let mut order: Vec<usize> = (0..events.len()).collect();
    order.sort_by(|&a, &b| {
        result.events[a]
            .onset_s
            .total_cmp(&result.events[b].onset_s)
    });
    let mut recover_end = vec![f64::NAN; events.len()];

    let mut tests: Vec<Option<TestScore>> = vec![None; events.len()];
    for (rank, &i) in order.iter().enumerate() {
        let sc: &EventScore = &result.events[i];
        let scorable = sc.evaluable && sc.onset_s >= first_scorable_s;
        let end_s = events[i].event.end_s.unwrap_or(sc.window_end_s);
        let next_onset = order
            .get(rank + 1)
            .map(|&j| result.events[j].onset_s)
            .unwrap_or(f64::INFINITY);
        let (mut recovered, mut ttr) = (None, None);
        if scorable && sc.first_alarm_s.is_some() {
            // First epoch at or after the slot end that starts an alarm-free stretch of at
            // least `recover_hold_s`, ending before the next test begins.
            let mut found = false;
            let mut k = epochs.partition_point(|e| e.t_s < end_s);
            while k < epochs.len() && epochs[k].t_s < next_onset {
                if !alarmed(k) {
                    let t0 = epochs[k].t_s;
                    let mut j = k;
                    while j < epochs.len() && epochs[j].t_s < next_onset && !alarmed(j) {
                        j += 1;
                    }
                    // The stretch [t0, last alarm-free epoch]; it holds if it spans the hold
                    // time, or runs to the end of the log or the next test having started it.
                    let last_t = epochs[j - 1].t_s;
                    if last_t - t0 >= opt.recover_hold_s {
                        recovered = Some(true);
                        ttr = Some(t0 - end_s);
                        recover_end[i] = t0;
                        found = true;
                        break;
                    }
                    k = j;
                } else {
                    k += 1;
                }
            }
            if !found {
                recovered = Some(false);
            }
        }
        tests[i] = Some(TestScore {
            test_id: events[i].test_id.clone(),
            test_name: events[i].test_name.clone(),
            year: events[i].year,
            location_id: events[i].location_id,
            plan_status: events[i].status.clone(),
            kind: sc.kind,
            onset_s: sc.onset_s,
            end_s,
            evaluable: scorable,
            outcome: if scorable {
                sc.outcome.clone()
            } else {
                "not-evaluable".into()
            },
            latency_s: sc.latency_s.filter(|_| scorable),
            first_monitors: if scorable {
                sc.first_monitors.clone()
            } else {
                Vec::new()
            },
            recovered,
            time_to_recover_s: ttr,
        });
    }
    let tests: Vec<TestScore> = order.iter().filter_map(|&i| tests[i].take()).collect();

    // Clean time: post-calibration epochs not within guard_s before a slot or after its end
    // (extended to the recovery point where the monitors were still settling).
    let mut spans: Vec<(f64, f64)> = Vec::new();
    for (t, &i) in tests.iter().zip(&order) {
        let end = if recover_end[i].is_finite() {
            recover_end[i].max(t.end_s)
        } else {
            t.end_s
        };
        spans.push((t.onset_s - opt.guard_s, end + opt.guard_s));
    }
    let inside = |t: f64| spans.iter().any(|&(a, b)| t >= a && t <= b);
    let calibrated: Vec<usize> = (0..epochs.len())
        .filter(|&k| epochs[k].state != TrustState::Calibrating)
        .collect();
    let clean: Vec<usize> = calibrated
        .iter()
        .copied()
        .filter(|&k| !inside(epochs[k].t_s))
        .collect();
    let false_epochs = clean.iter().filter(|&&k| alarmed(k)).count();
    // A run of consecutive alarmed clean epochs, one epoch step apart in the log's order.
    let mut false_runs = 0usize;
    let mut last_alarmed: Option<usize> = None;
    for &k in &clean {
        if alarmed(k) {
            if last_alarmed.is_none_or(|p| p + 1 != k) {
                false_runs += 1;
            }
            last_alarmed = Some(k);
        }
    }
    let dt = if epochs.len() >= 2 {
        median(epochs.windows(2).map(|w| w[1].t_s - w[0].t_s).collect())
    } else {
        None
    };
    let clean_hours = dt.map(|d| clean.len() as f64 * d / 3600.0);

    let evaluable = tests.iter().filter(|t| t.evaluable).count();
    let count = |o: &str| tests.iter().filter(|t| t.outcome == o).count();
    let (detected, late, missed) = (count("detected"), count("late"), count("missed"));
    let ratio = |n: usize, d: usize| (d > 0).then(|| n as f64 / d as f64);
    let summary = ScoreSummary {
        tests: tests.len(),
        evaluable,
        detected,
        late,
        missed,
        detection_rate: ratio(detected + late, evaluable),
        detected_in_tolerance_rate: ratio(detected, evaluable),
        median_latency_s: median(tests.iter().filter_map(|t| t.latency_s).collect()),
        median_time_to_recover_s: median(
            tests.iter().filter_map(|t| t.time_to_recover_s).collect(),
        ),
        false_alarm_runs: false_runs,
        false_alarm_epochs: false_epochs,
        clean_epochs: clean.len(),
        clean_hours,
        false_alarm_epoch_rate: ratio(false_epochs, clean.len()),
        false_alarm_runs_per_hour: clean_hours
            .filter(|h| *h > 0.0)
            .map(|h| false_runs as f64 / h),
    };
    Ok(Scorecard {
        label: SCORE_LABEL,
        advisory: crate::receiver_trust::ADVISORY,
        scenario_hash: result.scenario_hash.clone(),
        options: *opt,
        baseline_contaminated,
        tests,
        summary,
    })
}
