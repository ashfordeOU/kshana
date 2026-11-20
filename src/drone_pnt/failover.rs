// SPDX-License-Identifier: AGPL-3.0-only
//! Cascade failover harness over position sources (a MOSA-style priority cascade). MODELLED.
//!
//! Each source has a priority (0 first), a kind and a detection latency:
//!
//! * `absolute` (GNSS, a beacon fix): error `sigma_m` while healthy; while it has failed but the
//!   failure is not yet detected and it is still the active source, the error is the fault's
//!   `bias_m` (the solution follows the fault);
//! * `relative` (visual-inertial odometry, flow): the error at handover plus `growth` times the
//!   distance travelled since it became active;
//! * `inertial`: the error at handover plus the free-inertial coast of [`crate::inertial::coast`]
//!   for `imu_grade` since it became active.
//!
//! A failure is acted on `detect_latency_s` after it happens, and a recovery after the same
//! latency (re-validation). At every step the active source is the highest-priority one believed
//! healthy; a switch back to an absolute source resets the error to its `sigma_m`. The harness
//! reports the source segments, the failovers, the largest error and the time spent above the
//! alert limit.

use serde::{Deserialize, Serialize};

use crate::inertial::coast::{CoastModel, Combination, ImuGrade};
use crate::quantum_trade::PositionDrift;

/// One position source.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Source {
    /// Name.
    pub name: String,
    /// `absolute`, `relative` or `inertial`.
    pub kind: String,
    /// Priority, 0 first.
    pub priority: u32,
    /// Healthy error, metres (absolute sources).
    #[serde(default)]
    pub sigma_m: f64,
    /// Error growth per metre travelled (relative sources).
    #[serde(default)]
    pub growth: f64,
    /// IMU grade (inertial sources).
    #[serde(default)]
    pub imu_grade: Option<String>,
    /// Seconds from a failure or recovery to the harness acting on it.
    #[serde(default)]
    pub detect_latency_s: f64,
}

/// A failure or recovery of a source.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Event {
    /// Time, s.
    pub t_s: f64,
    /// Source name.
    pub source: String,
    /// `fail` or `recover`.
    pub state: String,
    /// Error of the failed source while it is still used, metres.
    #[serde(default)]
    pub bias_m: f64,
}

/// A harness run.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct FailoverSpec {
    /// The sources.
    pub sources: Vec<Source>,
    /// The events.
    pub events: Vec<Event>,
    /// Run length, s.
    pub duration_s: f64,
    /// Step, s.
    #[serde(default = "default_dt")]
    pub dt_s: f64,
    /// Ground speed, m/s.
    pub speed_m_s: f64,
    /// Alert limit, metres.
    pub alert_limit_m: f64,
}

fn default_dt() -> f64 {
    0.1
}

impl FailoverSpec {
    /// The three-source example: GNSS fails with a 30 m fault at 60 s, VIO loses features at
    /// 120 s, GNSS recovers at 150 s.
    pub fn three_source_example() -> Self {
        let src = |name: &str,
                   kind: &str,
                   p: u32,
                   sigma: f64,
                   growth: f64,
                   imu: Option<&str>,
                   lat: f64| Source {
            name: name.into(),
            kind: kind.into(),
            priority: p,
            sigma_m: sigma,
            growth,
            imu_grade: imu.map(str::to_string),
            detect_latency_s: lat,
        };
        let ev = |t: f64, s: &str, st: &str, b: f64| Event {
            t_s: t,
            source: s.into(),
            state: st.into(),
            bias_m: b,
        };
        FailoverSpec {
            sources: vec![
                src("gnss", "absolute", 0, 2.0, 0.0, None, 2.0),
                src("vio", "relative", 1, 0.0, 0.01, None, 0.5),
                src("ins", "inertial", 2, 0.0, 0.0, Some("industrial"), 0.0),
            ],
            events: vec![
                ev(60.0, "gnss", "fail", 30.0),
                ev(120.0, "vio", "fail", 0.0),
                ev(150.0, "gnss", "recover", 0.0),
            ],
            duration_s: 200.0,
            dt_s: 0.1,
            speed_m_s: 10.0,
            alert_limit_m: 40.0,
        }
    }
}

/// A span of time on one source.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Segment {
    /// Active source.
    pub source: String,
    /// Start, s.
    pub from_s: f64,
    /// End, s.
    pub to_s: f64,
    /// Largest error in the span, metres.
    pub max_error_m: f64,
}

/// The harness result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FailoverReport {
    /// Report format tag.
    pub format: &'static str,
    /// Evidence label.
    pub evidence: &'static str,
    /// Source segments in order.
    pub segments: Vec<Segment>,
    /// Number of source changes.
    pub failovers: usize,
    /// Largest error, metres.
    pub max_error_m: f64,
    /// Seconds above the alert limit.
    pub time_over_alert_limit_s: f64,
    /// Whether the error stayed within the alert limit.
    pub within_alert_limit: bool,
    /// Seconds with no source believed healthy.
    pub time_without_source_s: f64,
}

/// Run the harness.
pub fn simulate(spec: &FailoverSpec) -> Result<FailoverReport, String> {
    let positive = spec.dt_s > 0.0 && spec.duration_s >= 0.0;
    if spec.sources.is_empty() || !positive {
        return Err(crate::terr!("e-drone-failover-bad-spec"));
    }
    if spec.duration_s / spec.dt_s > 1.0e7 {
        return Err(crate::terr!("e-drone-failover-bad-spec"));
    }
    let mut srcs: Vec<&Source> = spec.sources.iter().collect();
    srcs.sort_by_key(|s| s.priority);
    let mut coast: Vec<Option<CoastModel>> = Vec::new();
    for s in &srcs {
        if !matches!(s.kind.as_str(), "absolute" | "relative" | "inertial") {
            return Err(crate::terr!(
                "e-drone-failover-bad-kind",
                kind = s.kind.as_str()
            ));
        }
        coast.push(if s.kind == "inertial" {
            let g = ImuGrade::parse(s.imu_grade.as_deref().unwrap_or("industrial"))?;
            Some(CoastModel::new(
                g.params().si(),
                spec.speed_m_s,
                0.0,
                Combination::Rss,
                0.0,
            ))
        } else {
            None
        });
    }
    for e in &spec.events {
        if !srcs.iter().any(|s| s.name == e.source)
            || !matches!(e.state.as_str(), "fail" | "recover")
        {
            return Err(crate::terr!(
                "e-drone-failover-bad-event",
                source = e.source.as_str()
            ));
        }
    }
    // Truth and belief per source: (truly healthy, bias, time of last change).
    let truth = |i: usize, t: f64| -> (bool, f64, f64) {
        let mut st = (true, 0.0, f64::NEG_INFINITY);
        for e in spec
            .events
            .iter()
            .filter(|e| e.source == srcs[i].name && e.t_s <= t)
        {
            st = (e.state == "recover", e.bias_m, e.t_s);
        }
        st
    };
    let believed = |i: usize, t: f64| -> bool {
        let (ok, _, since) = truth(i, t);
        if t - since >= srcs[i].detect_latency_s {
            ok
        } else {
            // Not yet acted on: the previous state still holds.
            !ok
        }
    };
    let n = (spec.duration_s / spec.dt_s).round() as usize;
    let mut segments: Vec<Segment> = Vec::new();
    let (mut err, mut max_err, mut over, mut none) = (0.0f64, 0.0f64, 0.0, 0.0);
    let mut active: Option<usize> = None;
    let (mut since_t, mut err0) = (0.0, 0.0);
    for k in 0..=n {
        let t = k as f64 * spec.dt_s;
        let now = (0..srcs.len()).find(|&i| believed(i, t));
        if now != active {
            since_t = t;
            err0 = err;
            if let Some(i) = now {
                segments.push(Segment {
                    source: srcs[i].name.clone(),
                    from_s: t,
                    to_s: t,
                    max_error_m: 0.0,
                });
            }
            active = now;
        }
        let dt_active = t - since_t;
        err = match active {
            None => {
                none += spec.dt_s;
                err + spec.speed_m_s * spec.dt_s
            }
            Some(i) => {
                let (ok, bias, _) = truth(i, t);
                match srcs[i].kind.as_str() {
                    "absolute" => {
                        if ok {
                            srcs[i].sigma_m
                        } else {
                            bias.abs().max(srcs[i].sigma_m)
                        }
                    }
                    "relative" => err0 + srcs[i].growth * spec.speed_m_s * dt_active,
                    _ => {
                        let c = coast[i].as_ref().map_or(0.0, |m| m.drift_m(dt_active));
                        err0 + c
                    }
                }
            }
        };
        max_err = max_err.max(err);
        if err > spec.alert_limit_m {
            over += spec.dt_s;
        }
        if let Some(s) = segments.last_mut() {
            if active.is_some() {
                s.to_s = t;
                s.max_error_m = s.max_error_m.max(err);
            }
        }
    }
    Ok(FailoverReport {
        format: "kshana.drone-failover/1",
        evidence: super::EVIDENCE,
        failovers: segments.len().saturating_sub(1),
        segments,
        max_error_m: max_err,
        time_over_alert_limit_s: over,
        within_alert_limit: over == 0.0,
        time_without_source_s: none,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn three_source_cascade_runs_in_order() {
        let r = simulate(&FailoverSpec::three_source_example()).unwrap();
        let names: Vec<&str> = r.segments.iter().map(|s| s.source.as_str()).collect();
        assert_eq!(names, ["gnss", "vio", "ins", "gnss"]);
        assert_eq!(r.failovers, 3);
        // GNSS fault of 30 m is used for 2 s before detection.
        assert!((r.segments[0].max_error_m - 30.0).abs() < 1e-9);
        assert!((r.segments[1].from_s - 62.0).abs() < 1e-6);
        assert!((r.segments[3].from_s - 152.0).abs() < 1e-6);
        assert!(r.max_error_m >= 30.0);
        assert_eq!(r.time_without_source_s, 0.0);
    }
}
