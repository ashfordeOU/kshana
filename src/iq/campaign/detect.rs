// SPDX-License-Identifier: AGPL-3.0-only
//! **Monitors in the campaign** (`docs/design/MONITORS-IN-CAMPAIGN.md`): the `[monitors]`
//! table of a campaign file, each cell's `monitors` block, and the scoring of the monitors'
//! alarms against the stated events.
//!
//! The runner feeds the pre-correlation monitors ([`crate::iq::monitor::power`],
//! [`crate::iq::monitor::spectral`]) the samples after each front-end chain, once per
//! (recording, chain), and each tracked channel's loop updates to that channel's
//! [`crate::iq::monitor::EpochMonitors`]. Each alarm (a monitor event's `t_alarm_s`) is then:
//!
//! * a **detection** of a stated event when it falls in `[onset, offset + detect_grace_s]`.
//!   For a post-correlation alarm the satellite must also be among those the event affects.
//!   The first such alarm per (event, alarm kind, channel) gives the time to detect,
//!   `t_alarm − onset`. A (event, kind, channel) with no alarm is a **miss**.
//! * a **false alarm** when it falls outside every stated event's window, after the monitor's
//!   baseline, counted over that exposure time.
//!
//! Each monitor test's closed-form false-alarm probability at its threshold is stated beside
//! the counts. These are single-test probabilities for white Gaussian noise: power per block
//! (exact), spectral excess per block (an approximation), kurtosis per block (one-sided
//! Gaussian), pulses per block (the configured binomial ceiling), SQM per averaged update
//! (two-sided Gaussian), and C/N0 as the CUSUM's mean run to a false alarm (Siegmund). An
//! alarm needs its confirmation rule too, so the alarm rate is lower than the single-test
//! probability.

use serde::{Deserialize, Serialize};

use super::conditions::TestConditions;
use crate::iq::monitor::power::PowerSettings;
use crate::iq::monitor::spectral::SpectralSettings;
use crate::iq::monitor::{stats, EpochMonitorSettings, MonitorEvent};

fn d_grace() -> f64 {
    1.0
}

fn d_roc_window() -> f64 {
    5.0
}

/// The `[monitors]` table of a campaign file.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct MonitorsSpec {
    /// The total-power monitor; absent = off.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub power: Option<PowerSettings>,
    /// The spectral, kurtosis and pulse monitor; absent = off.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub spectral: Option<SpectralSettings>,
    /// The per-channel C/N0, SQM and lock monitors (always on when the table is present).
    #[serde(default)]
    pub epoch: EpochMonitorSettings,
    /// Time after an event's end in which an alarm still counts as its detection (s).
    #[serde(default = "d_grace")]
    pub detect_grace_s: f64,
    /// Length of the negative windows of the detection ROC (s,
    /// `docs/design/DETECTION-ROC.md`).
    #[serde(default = "d_roc_window")]
    pub roc_window_s: f64,
}

impl MonitorsSpec {
    /// Check the settings.
    pub fn validate(&self) -> Result<(), String> {
        if !(self.detect_grace_s.is_finite() && self.detect_grace_s >= 0.0) {
            return Err("monitors.detect_grace_s must be >= 0".into());
        }
        if !(self.roc_window_s.is_finite() && self.roc_window_s > 0.0) {
            return Err("monitors.roc_window_s must be positive".into());
        }
        Ok(())
    }
}

/// One monitor test's closed-form false-alarm figure at its threshold.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct MonitorTest {
    /// The alarm kind the test raises (`power_rise`, `spectral_excess`, `sqm_ratio`, ...).
    pub kind: String,
    /// The channel of a per-channel test.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// The threshold, in the test statistic's own unit.
    pub threshold: f64,
    /// What one test is (`block`, `averaged update`, `detector sample`).
    pub per: String,
    /// Closed-form false-alarm probability of one test, white Gaussian noise.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub pfa: Option<f64>,
    /// For a CUSUM: the mean number of detector samples to a false alarm (Siegmund).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub arl0_samples: Option<f64>,
    /// For the C/N0 CUSUM: the learned baseline `[μ0, σ0]` (dB-Hz, dB).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub baseline: Option<[f64; 2]>,
    /// How the figure is obtained.
    pub basis: String,
}

/// One stated event against one alarm kind (and channel).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Detection {
    /// The stated event.
    pub event_id: String,
    /// The alarm kind.
    pub kind: String,
    /// The channel of a per-channel alarm kind.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// Whether an alarm fell in the event's window.
    pub detected: bool,
    /// The first such alarm minus the onset (s).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub time_to_detect_s: Option<f64>,
}

/// False alarms of one alarm kind (and channel).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct FalseAlarms {
    /// The alarm kind.
    pub kind: String,
    /// The channel of a per-channel alarm kind.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// Alarms outside every stated event's window, after the baseline.
    pub count: u32,
    /// Time outside the windows and after the baseline (s).
    pub exposure_s: f64,
    /// `count` per hour of exposure.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub per_hour: Option<f64>,
}

/// A cell's `monitors` block.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct CellMonitors {
    /// Every alarm, in time order.
    pub alarms: Vec<MonitorEvent>,
    /// The closed-form false-alarm figure of each test.
    pub tests: Vec<MonitorTest>,
    /// Per stated event, alarm kind and channel.
    pub detections: Vec<Detection>,
    /// Per alarm kind and channel.
    pub false_alarms: Vec<FalseAlarms>,
    /// The maximum of each test statistic over the positive (stated event) and negative
    /// (tiled, outside the events) windows of the detection ROC.
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub windows: Vec<WindowStat>,
}

/// The maximum of one test statistic over one ROC window.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct WindowStat {
    /// The alarm kind whose statistic this is.
    pub kind: String,
    /// The channel of a per-channel kind.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// The stated event of a positive window; `None` for a negative one.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub event_id: Option<String>,
    /// Window start (s).
    pub t0_s: f64,
    /// Window end (s).
    pub t1_s: f64,
    /// The largest statistic in the window.
    pub max: f64,
}

/// The windows of one kind's statistic `series` (`(t_s, value)` in time order): one per
/// stated event that can affect it, and consecutive `window_s` windows over the rest of
/// `[k.from_s, k.to_s]` (a trailing piece shorter than half a window is dropped). A window
/// with no value is left out.
pub fn windows(
    k: &KindSpan,
    series: &[(f64, f64)],
    tc: &TestConditions,
    grace_s: f64,
    window_s: f64,
) -> Vec<WindowStat> {
    let max_in = |a: f64, b: f64| {
        series
            .iter()
            .filter(|(t, v)| *t >= a && *t <= b && v.is_finite())
            .map(|(_, v)| *v)
            .fold(None, |m: Option<f64>, v| Some(m.map_or(v, |m| m.max(v))))
    };
    let mut out = Vec::new();
    let mut ev_windows = Vec::new();
    for e in &tc.events {
        if k.sat.is_some_and(|s| !e.affects.includes(s)) {
            continue;
        }
        let (a, b) = (e.onset_s, e.offset_s + grace_s);
        ev_windows.push((a, b));
        if let Some(m) = max_in(a, b) {
            out.push(WindowStat {
                kind: k.kind.clone(),
                channel: k.channel.clone(),
                event_id: Some(e.id.clone()),
                t0_s: a,
                t1_s: b,
                max: m,
            });
        }
    }
    // The free gaps of [from, to] outside the event windows, tiled.
    ev_windows.sort_by(|p, q| p.0.total_cmp(&q.0));
    let mut gaps = Vec::new();
    let mut cur = k.from_s;
    for (a, b) in ev_windows {
        if a > cur {
            gaps.push((cur, a.min(k.to_s)));
        }
        cur = cur.max(b);
    }
    if cur < k.to_s {
        gaps.push((cur, k.to_s));
    }
    for (a, b) in gaps {
        let mut t = a;
        while b - t >= 0.5 * window_s {
            let e = (t + window_s).min(b);
            if let Some(m) = max_in(t, e) {
                out.push(WindowStat {
                    kind: k.kind.clone(),
                    channel: k.channel.clone(),
                    event_id: None,
                    t0_s: t,
                    t1_s: e,
                    max: m,
                });
            }
            t += window_s;
        }
    }
    out
}

/// An empirical ROC of one alarm kind.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Roc {
    /// The alarm kind.
    pub kind: String,
    /// Positive windows.
    pub positives: usize,
    /// Negative windows.
    pub negatives: usize,
    /// `[P_fa, P_d]` points from `[0, 0]` to `[1, 1]`, one per distinct statistic value.
    pub points: Vec<[f64; 2]>,
    /// Area under the curve (trapezoidal; ties count half).
    pub auc: Option<f64>,
    /// The configured threshold, when the cells state one.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub threshold: Option<f64>,
    /// `[P_fa, P_d]` at the configured threshold.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub at_threshold: Option<[f64; 2]>,
}

/// The ROC of positives `pos` against negatives `neg`, with the operating point at `thr`.
pub fn roc(kind: &str, pos: &[f64], neg: &[f64], thr: Option<f64>) -> Roc {
    let (np, nn) = (pos.len(), neg.len());
    let mut levels: Vec<f64> = pos.iter().chain(neg).copied().collect();
    levels.sort_by(|a, b| b.total_cmp(a));
    levels.dedup();
    let at = |t: f64| {
        [
            neg.iter().filter(|v| **v >= t).count() as f64 / nn.max(1) as f64,
            pos.iter().filter(|v| **v >= t).count() as f64 / np.max(1) as f64,
        ]
    };
    let mut points = vec![[0.0, 0.0]];
    points.extend(levels.iter().map(|&t| at(t)));
    if points.last() != Some(&[1.0, 1.0]) {
        points.push([1.0, 1.0]);
    }
    let auc = (np > 0 && nn > 0).then(|| {
        points
            .windows(2)
            .map(|w| (w[1][0] - w[0][0]) * 0.5 * (w[1][1] + w[0][1]))
            .sum()
    });
    Roc {
        kind: kind.into(),
        positives: np,
        negatives: nn,
        points,
        auc,
        threshold: thr,
        at_threshold: thr.filter(|_| np > 0 && nn > 0).map(at),
    }
}

/// An alarm kind a cell can raise, with the span of time over which its false alarms count.
#[derive(Clone, Debug, PartialEq)]
pub struct KindSpan {
    /// The alarm kind.
    pub kind: String,
    /// The channel label of a per-channel kind.
    pub channel: Option<String>,
    /// The satellite id of a per-channel kind (for the events' `affects`).
    pub sat: Option<i64>,
    /// Start of the exposure (s): the end of the monitor's baseline.
    pub from_s: f64,
    /// End of the exposure (s).
    pub to_s: f64,
}

/// The closed-form figures of the pre-correlation tests.
pub fn pre_correlation_tests(
    power: Option<(&PowerSettings, usize)>,
    spectral: Option<(&SpectralSettings, f64, f64)>,
) -> Vec<MonitorTest> {
    let mut v = Vec::new();
    if let Some((p, n)) = power {
        let pfa = stats::power_block_pfa(n, p.threshold_db);
        for kind in ["power_rise", "power_drop"] {
            v.push(MonitorTest {
                kind: kind.into(),
                channel: None,
                threshold: p.threshold_db,
                per: "block".into(),
                pfa: Some(pfa),
                arl0_samples: None,
                baseline: None,
                basis: "block-power test, both sides together: Q(N, N 10^(t/10)) + P(N, N \
                        10^(-t/10)), exact for circular Gaussian noise"
                    .into(),
            });
        }
    }
    if let Some((s, excess_db, excess_pfa)) = spectral {
        v.push(MonitorTest {
            kind: "spectral_excess".into(),
            channel: None,
            threshold: excess_db,
            per: "block".into(),
            pfa: Some(excess_pfa),
            arl0_samples: None,
            baseline: None,
            basis: "Welch max-excess: 1 - (1 - Q(K_eff, K_eff 10^(t/10)))^B, an approximation \
                    (measured at 1.3 times the formula)"
                .into(),
        });
        v.push(MonitorTest {
            kind: "kurtosis".into(),
            channel: None,
            threshold: s.kurtosis_sigma,
            per: "block".into(),
            pfa: Some(0.5 * stats::gaussian_two_sided_pfa(s.kurtosis_sigma)),
            arl0_samples: None,
            baseline: None,
            basis: "kurtosis z-score above k: one-sided Gaussian Q(k)".into(),
        });
        v.push(MonitorTest {
            kind: "pulses".into(),
            channel: None,
            threshold: -s.pulse_pfa.ln(),
            per: "block".into(),
            pfa: Some(s.pulse_pfa),
            arl0_samples: None,
            baseline: None,
            basis: "pulse count, exact binomial upper tail: the configured ceiling".into(),
        });
    }
    v
}

/// The closed-form figures of one channel's tests. `cn0_ref` is the C/N0 monitor's learned
/// baseline `(μ0, σ0)`, when reached.
pub fn channel_tests(
    channel: &str,
    epoch: &EpochMonitorSettings,
    cn0_ref: Option<(f64, f64)>,
) -> Vec<MonitorTest> {
    let mut v = Vec::new();
    let sqm_pfa = stats::gaussian_two_sided_pfa(epoch.sqm.k_sigma);
    for kind in ["sqm_delta", "sqm_ratio"] {
        v.push(MonitorTest {
            kind: kind.into(),
            channel: Some(channel.into()),
            threshold: epoch.sqm.k_sigma,
            per: "averaged update".into(),
            pfa: Some(sqm_pfa),
            arl0_samples: None,
            baseline: None,
            basis: "two-sided Gaussian 2Q(k) = Q(1/2, k^2/2) on the averaged metric".into(),
        });
    }
    let arl0 = cn0_ref.map(|(_, sd)| {
        let k = epoch.cn0.shift_db / (2.0 * sd.max(epoch.cn0.sigma_floor_db));
        stats::cusum_arl0(k, epoch.cn0.h)
    });
    for kind in ["cn0_drop", "cn0_rise"] {
        v.push(MonitorTest {
            kind: kind.into(),
            channel: Some(channel.into()),
            threshold: epoch.cn0.h,
            per: "detector sample".into(),
            pfa: None,
            arl0_samples: arl0,
            baseline: cn0_ref.map(|(m, sd)| [m, sd]),
            basis: "one-sided CUSUM, Siegmund's ARL0(k, h) with k = shift/(2 sigma0)".into(),
        });
    }
    v
}

/// The union length of `windows` clipped to `[a, b]`.
fn covered(windows: &[(f64, f64)], a: f64, b: f64) -> f64 {
    let mut w: Vec<(f64, f64)> = windows
        .iter()
        .map(|&(x, y)| (x.max(a), y.min(b)))
        .filter(|(x, y)| y > x)
        .collect();
    w.sort_by(|p, q| p.0.total_cmp(&q.0));
    let (mut total, mut cur) = (0.0, f64::NEG_INFINITY);
    for (x, y) in w {
        let x = x.max(cur);
        if y > x {
            total += y - x;
            cur = y;
        }
    }
    total
}

/// Score `alarms` against the stated events of `tc`.
pub fn score(
    alarms: &[MonitorEvent],
    kinds: &[KindSpan],
    tc: &TestConditions,
    grace_s: f64,
) -> (Vec<Detection>, Vec<FalseAlarms>) {
    let windows: Vec<(String, f64, f64, &super::conditions::Event)> = tc
        .events
        .iter()
        .map(|e| (e.id.clone(), e.onset_s, e.offset_s + grace_s, e))
        .collect();
    let mut detections = Vec::new();
    let mut false_alarms = Vec::new();
    for k in kinds {
        let mine: Vec<&MonitorEvent> = alarms
            .iter()
            .filter(|a| a.kind == k.kind && a.channel == k.channel)
            .collect();
        for (id, on, end, ev) in &windows {
            if let Some(sat) = k.sat {
                if !ev.affects.includes(sat) {
                    continue;
                }
            }
            let first = mine
                .iter()
                .map(|a| a.t_alarm_s)
                .filter(|t| *t >= *on && *t <= *end)
                .fold(None, |m: Option<f64>, t| Some(m.map_or(t, |m| m.min(t))));
            detections.push(Detection {
                event_id: id.clone(),
                kind: k.kind.clone(),
                channel: k.channel.clone(),
                detected: first.is_some(),
                time_to_detect_s: first.map(|t| t - on),
            });
        }
        let relevant: Vec<(f64, f64)> = windows
            .iter()
            .filter(|(_, _, _, ev)| k.sat.is_none_or(|s| ev.affects.includes(s)))
            .map(|(_, a, b, _)| (*a, *b))
            .collect();
        let count = mine
            .iter()
            .filter(|a| a.t_alarm_s >= k.from_s && a.t_alarm_s <= k.to_s)
            .filter(|a| {
                !relevant
                    .iter()
                    .any(|(x, y)| a.t_alarm_s >= *x && a.t_alarm_s <= *y)
            })
            .count() as u32;
        let span = (k.to_s - k.from_s).max(0.0);
        let exposure_s = (span - covered(&relevant, k.from_s, k.to_s)).max(0.0);
        false_alarms.push(FalseAlarms {
            kind: k.kind.clone(),
            channel: k.channel.clone(),
            count,
            exposure_s,
            per_hour: (exposure_s > 0.0).then(|| f64::from(count) * 3600.0 / exposure_s),
        });
    }
    (detections, false_alarms)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tc() -> TestConditions {
        TestConditions::parse(
            r#"schema = "kshana.test-conditions/1"
[recording]
id = "r"
path = "r.cf32"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [3, 5]
[[event]]
id = "e1"
kind = "other"
type = "unknown"
onset_s = 10.0
offset_s = 16.0
affects = [3]
"#,
        )
        .unwrap()
    }

    fn alarm(kind: &str, ch: Option<&str>, t: f64) -> MonitorEvent {
        MonitorEvent {
            kind: kind.into(),
            channel: ch.map(str::to_string),
            t_start_s: t - 0.1,
            t_alarm_s: t,
            t_end_s: Some(t + 1.0),
            peak: 9.0,
            threshold: 5.0,
        }
    }

    #[test]
    fn alarms_score_as_detections_or_false_alarms() {
        let kinds = vec![
            KindSpan {
                kind: "cn0_drop".into(),
                channel: Some("gps-l1ca:3".into()),
                sat: Some(3),
                from_s: 3.0,
                to_s: 30.0,
            },
            KindSpan {
                kind: "cn0_drop".into(),
                channel: Some("gps-l1ca:5".into()),
                sat: Some(5),
                from_s: 3.0,
                to_s: 30.0,
            },
            KindSpan {
                kind: "power_rise".into(),
                channel: None,
                sat: None,
                from_s: 1.0,
                to_s: 30.0,
            },
        ];
        let alarms = vec![
            alarm("cn0_drop", Some("gps-l1ca:3"), 12.5),
            alarm("cn0_drop", Some("gps-l1ca:3"), 16.8), // inside the grace: same event
            alarm("cn0_drop", Some("gps-l1ca:3"), 25.0), // false
            alarm("cn0_drop", Some("gps-l1ca:5"), 12.0), // e1 does not affect 5: false
            alarm("power_rise", None, 2.0),              // false
        ];
        let (d, f) = score(&alarms, &kinds, &tc(), 1.0);
        // Satellite 5 is not affected, so it has no detection row.
        assert_eq!(d.len(), 2);
        assert!(d[0].detected && (d[0].time_to_detect_s.unwrap() - 2.5).abs() < 1e-12);
        assert!(!d[1].detected, "power_rise missed e1");
        assert_eq!((f[0].count, f[1].count, f[2].count), (1, 1, 1));
        // Exposure: 27 s minus the window [10, 17] where the satellite is affected.
        assert!((f[0].exposure_s - 20.0).abs() < 1e-12);
        assert!((f[1].exposure_s - 27.0).abs() < 1e-12);
        assert!((f[2].exposure_s - 22.0).abs() < 1e-12);
    }

    #[test]
    fn the_roc_of_separated_and_of_identical_samples() {
        let r = roc("k", &[5.0, 6.0, 7.0], &[1.0, 2.0, 3.0], Some(4.0));
        assert_eq!(r.auc, Some(1.0));
        assert_eq!(r.at_threshold, Some([0.0, 1.0]));
        let r = roc("k", &[1.0, 2.0], &[1.0, 2.0], None);
        assert!((r.auc.unwrap() - 0.5).abs() < 1e-12);
    }

    #[test]
    fn windows_tile_the_time_outside_the_events() {
        let k = KindSpan {
            kind: "cn0_drop".into(),
            channel: Some("gps-l1ca:3".into()),
            sat: Some(3),
            from_s: 3.0,
            to_s: 30.0,
        };
        let series: Vec<(f64, f64)> = (0..300).map(|i| (i as f64 * 0.1, i as f64)).collect();
        let w = windows(&k, &series, &tc(), 1.0, 5.0);
        let pos: Vec<&WindowStat> = w.iter().filter(|x| x.event_id.is_some()).collect();
        assert_eq!(pos.len(), 1);
        assert_eq!((pos[0].t0_s, pos[0].t1_s), (10.0, 17.0));
        // [3, 10): one 5 s window and a 2 s remainder (dropped, under half a window);
        // [17, 30): 5 + 5 + 3 s windows (the last kept, over half a window).
        let neg: Vec<(f64, f64)> = w
            .iter()
            .filter(|x| x.event_id.is_none())
            .map(|x| (x.t0_s, x.t1_s))
            .collect();
        assert_eq!(
            neg,
            vec![(3.0, 8.0), (17.0, 22.0), (22.0, 27.0), (27.0, 30.0)]
        );
    }
}
