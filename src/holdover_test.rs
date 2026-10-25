// SPDX-License-Identifier: AGPL-3.0-only
//! The `holdover-test` scenario kind: a scored holdover test of a timing system, from a
//! time-error record the operator supplies.
//!
//! The test has four steps, and Kshana performs none of them:
//!
//! 1. **baseline**: the system under test runs locked to GNSS and the record shows its
//!    time error;
//! 2. **GNSS removed**: the operator removes GNSS (the antenna cable, or the simulator
//!    output; Kshana transmits nothing and drives nothing) and states the time;
//! 3. **holdover**: the system runs on its own oscillator;
//! 4. **recovery**: the operator restores GNSS, again stating the time, and the record
//!    shows the system returning.
//!
//! The record comes from the instrument that measured it: a linuxptp or chrony log, a
//! TICC counter log, a TimeLab file, a RINEX clock file, or `(time_s, time_error_ns)` pairs
//! ([`crate::clock_log`], [`crate::telecom_timing::SeriesInput`]). The kind splits it at
//! the two stated times and reports, for each step:
//!
//! * baseline: the time-error statistics and the ITU-T masks written for a locked clock,
//!   measured against the mask on the baseline part of the record;
//! * holdover: the statistics, a linear fit (the frequency offset the system held), the
//!   ITU-T masks written for holdover or an autonomous clock, the ePRTC-A holdover envelope
//!   from the stated locked duration, and the time to exceed each time-error budget;
//! * recovery: whether and when `|TE|` came back inside a stated band and stayed there, the
//!   peak, and the largest step between consecutive samples.
//!
//! Every limit is the one [`crate::telecom_timing`] already transcribes from a freely
//! downloadable ITU-T Recommendation; this module adds none and invents none. The words
//! are "measured against the mask": nothing here says a clock or a system meets a
//! Recommendation, and the report says so.
//!
//! What is not checked is as much part of the result as what is. The two times are the
//! operator's statement and Kshana cannot verify them; a record that does not run long
//! enough for a mask is reported as incomplete, never extrapolated; and the masks that need
//! a measurement filter the record was not taken through are reported as not evaluated by
//! [`crate::telecom_timing::check_mask`].

use crate::clock_log::{self, ClockLogInput, NormalisedPhase};
use crate::field_schema::{FieldUnit, ProvenanceClass};
#[cfg(not(target_arch = "wasm32"))]
use crate::telecom_timing::parse_csv_pairs;
use crate::telecom_timing::{
    budget_results, check_envelope, check_mask, default_budgets, mask_by_id, mtie_curve_ns,
    record_from_pairs, series_sha256, tdev_curve_ns, Budget, CheckResult, CurvePoint,
    MaskCondition, MaskResult, TeRecord, MASKS,
};
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

/// The label every report carries.
pub const LABEL: &str = "MODELLED — a holdover test scored from a time-error record the \
     operator supplied. Every limit is transcribed from the named public ITU-T \
     Recommendation and the result is measured against the mask; it says nothing about \
     whether any clock or system meets a Recommendation, and nobody has rated or approved \
     it. The times at which GNSS was removed and restored are the operator's statement and \
     are not verified. Advisory software, not type-approved equipment.";

/// The most points of the record `record.series` carries.
pub const SERIES_MAX_POINTS: usize = 3000;

/// How `record.series` is cut down, stated in the report.
pub const SERIES_DECIMATION_RULE: &str = "every stride-th sample from the first, stride = 1 for a \
     record of at most 3000 samples and otherwise ceil((n - 1) / 2998), plus the last sample when \
     the stride does not land on it; no averaging, no interpolation: each point is a sample of \
     the record as it was read";

/// The deterministic decimation of a record: the indices kept and the stride.
pub fn series_indices(n: usize) -> (usize, Vec<usize>) {
    if n == 0 {
        return (1, Vec::new());
    }
    let stride = if n <= SERIES_MAX_POINTS {
        1
    } else {
        (n - 1).div_ceil(SERIES_MAX_POINTS - 2)
    };
    let mut idx: Vec<usize> = (0..n).step_by(stride).collect();
    if idx.last() != Some(&(n - 1)) {
        idx.push(n - 1);
    }
    (stride, idx)
}

/// What the report says is not covered, in every report.
pub const NOT_COVERED: &[&str] = &[
    "whether GNSS was in fact removed and restored at the stated times: they are the operator's statement",
    "any step the operator did not record: a record that ends before a mask's range is INCOMPLETE, never extrapolated",
    "the masks of G.8273.2 and G.8271.1 that are defined through a 0.1 Hz low-pass filter, for a record sampled slower than once a second",
    "a measurement-chain uncertainty: the record is taken as the instrument logged it, with no allowance for the instrument's own error",
    "a test of a clock class that needs a procedure the Recommendation sets beyond a time-error record (temperature profiles, packet-network load)",
];

/// The test steps the operator states.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct TestInput {
    /// Time GNSS was removed (s), on the record's time axis (for a clock log, seconds from
    /// its first sample).
    pub gnss_removed_s: f64,
    /// Time GNSS was restored (s). Absent: not restored within the record, so there is no
    /// recovery step.
    #[serde(default)]
    pub gnss_restored_s: Option<f64>,
    /// How long the system had been locked before GNSS was removed (days), which sets the
    /// ePRTC-A holdover period (ITU-T G.8272.1 Table 3).
    #[serde(default = "d_locked_days")]
    pub locked_duration_days: f64,
    /// `|TE|` at or below this counts as recovered (ns).
    #[serde(default = "d_band")]
    pub recovery_band_ns: f64,
    /// `|TE|` must stay inside the band this long to count as recovered (s).
    #[serde(default = "d_dwell")]
    pub recovery_dwell_s: f64,
}

fn d_locked_days() -> f64 {
    5.0
}
fn d_band() -> f64 {
    100.0
}
fn d_dwell() -> f64 {
    60.0
}
fn d_masks() -> Vec<String> {
    vec!["eprtc-a-holdover".into(), "prtc-a".into()]
}

/// The measured record: one of `samples`, `csv_path` or `clock_log`.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SeriesInput {
    /// `[time_s, time_error_ns]` pairs, uniformly sampled.
    #[serde(default)]
    pub samples: Vec<[f64; 2]>,
    /// A CSV file of `time_s,time_error_ns` rows (native builds only).
    #[serde(default)]
    pub csv_path: Option<String>,
    /// A measured clock log ([`crate::clock_log`]); its phase, in ns, is the time error.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub clock_log: Option<ClockLogInput>,
}

/// The `holdover-test` scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct HoldoverTestScenario {
    /// Scenario kind (`holdover-test`).
    #[serde(default)]
    pub kind: String,
    /// Mask ids from [`crate::telecom_timing::MASKS`]. A mask written for a locked clock is
    /// measured on the baseline step, one written for holdover or an autonomous clock on the
    /// holdover step.
    #[serde(default = "d_masks")]
    pub masks: Vec<String>,
    /// Time-error budgets; the telecom-timing defaults when absent.
    #[serde(default)]
    pub budgets: Option<Vec<Budget>>,
    /// The steps of the test.
    pub test: TestInput,
    /// The measured record.
    pub series: SeriesInput,
}

/// One step of the record.
struct Step {
    name: &'static str,
    rec: TeRecord,
}

/// Statistics of one step's time error (ns).
struct Stats {
    mean: f64,
    rms: f64,
    max_abs: f64,
    first: f64,
    last: f64,
}

fn stats(x: &[f64]) -> Option<Stats> {
    let n = x.len();
    if n == 0 {
        return None;
    }
    let mean = x.iter().sum::<f64>() / n as f64;
    Some(Stats {
        mean,
        rms: (x.iter().map(|v| v * v).sum::<f64>() / n as f64).sqrt(),
        max_abs: x.iter().fold(0.0_f64, |a, &v| a.max(v.abs())),
        first: x[0],
        last: x[n - 1],
    })
}

/// Least-squares line `x = a + b·tau` through `(tau, x)`; `None` below three points.
fn linear_fit(tau: &[f64], x: &[f64]) -> Option<(f64, f64, f64)> {
    let n = x.len();
    if n < 3 {
        return None;
    }
    let (mt, mx) = (
        tau.iter().sum::<f64>() / n as f64,
        x.iter().sum::<f64>() / n as f64,
    );
    let sxx: f64 = tau.iter().map(|t| (t - mt) * (t - mt)).sum();
    if sxx <= 0.0 {
        return None;
    }
    let sxy: f64 = tau.iter().zip(x).map(|(t, v)| (t - mt) * (v - mx)).sum();
    let b = sxy / sxx;
    let a = mx - b * mt;
    let rss: f64 = tau
        .iter()
        .zip(x)
        .map(|(t, v)| {
            let r = v - (a + b * t);
            r * r
        })
        .sum();
    Some((a, b, (rss / n as f64).sqrt()))
}

fn slice(rec: &TeRecord, i0: usize, i1: usize) -> TeRecord {
    TeRecord {
        t0_s: rec.t0_s + i0 as f64 * rec.dt_s,
        dt_s: rec.dt_s,
        te_ns: rec.te_ns[i0..i1].to_vec(),
    }
}

/// The first sample index at or after `t_s`, with a tolerance of a millionth of a sample.
fn index_at(rec: &TeRecord, t_s: f64) -> usize {
    ((t_s - rec.t0_s) / rec.dt_s - 1e-6).ceil().max(0.0) as usize
}

/// Overall verdict of a set of mask results: `FAIL` if any fails, else `INCOMPLETE`, else
/// `PASS`, else `NOT-EVALUATED`.
fn overall(results: &[&MaskResult]) -> &'static str {
    if results.iter().any(|m| m.verdict == "FAIL") {
        "FAIL"
    } else if results.iter().any(|m| m.verdict == "INCOMPLETE") {
        "INCOMPLETE"
    } else if results.iter().any(|m| m.verdict == "PASS") {
        "PASS"
    } else {
        "NOT-EVALUATED"
    }
}

/// The steps' recovery result.
#[derive(Clone, Debug, Serialize)]
pub struct RecoveryResult {
    /// Whether `|TE|` came inside the band and stayed for the dwell time before the record
    /// ended.
    pub recovered: bool,
    /// Time from the restoration to the start of the first such stay (s).
    pub time_to_recover_s: Option<f64>,
    /// The band used (ns).
    pub band_ns: f64,
    /// The dwell used (s).
    pub dwell_s: f64,
    /// Largest `|TE|` after the restoration (ns).
    pub peak_abs_te_ns: f64,
    /// `|TE|` at the last sample (ns).
    pub final_abs_te_ns: f64,
    /// Largest `|TE[k+1] − TE[k]|` from the last holdover sample through the record's end
    /// (ns): the biggest step the system made while recovering.
    pub largest_step_ns: f64,
}

fn recovery(rec: &TeRecord, prev_last: Option<f64>, band: f64, dwell_s: f64) -> RecoveryResult {
    let dwell_n = ((dwell_s / rec.dt_s).ceil() as usize).max(1);
    let x = &rec.te_ns;
    let mut found = None;
    let mut run_start = None;
    for (k, v) in x.iter().enumerate() {
        if v.abs() <= band {
            let s = *run_start.get_or_insert(k);
            if k + 1 - s >= dwell_n {
                found = Some(s);
                break;
            }
        } else {
            run_start = None;
        }
    }
    let mut largest = 0.0_f64;
    let mut last = prev_last;
    for v in x {
        if let Some(l) = last {
            largest = largest.max((v - l).abs());
        }
        last = Some(*v);
    }
    RecoveryResult {
        recovered: found.is_some(),
        time_to_recover_s: found.map(|s| s as f64 * rec.dt_s),
        band_ns: band,
        dwell_s,
        peak_abs_te_ns: x.iter().fold(0.0_f64, |a, &v| a.max(v.abs())),
        final_abs_te_ns: x.last().map(|v| v.abs()).unwrap_or(0.0),
        largest_step_ns: largest,
    }
}

/// Everything a run computes, before it is rendered.
pub struct HoldoverTestRun {
    /// The whole record.
    pub record: TeRecord,
    /// How a clock-log series was read.
    pub clock_log: Option<NormalisedPhase>,
    steps: Vec<Step>,
    masks: Vec<(&'static str, MaskResult)>,
    envelope: Option<crate::telecom_timing::EnvelopeResult>,
    budgets: Vec<crate::telecom_timing::BudgetResult>,
    holdover_fit: Option<(f64, f64, f64)>,
    holdover_extremum: Option<(f64, f64)>,
    step_at_removal: Option<f64>,
    recovery: Option<RecoveryResult>,
    curves: Vec<(&'static str, Vec<CurvePoint>, Vec<CurvePoint>)>,
}

fn check_nan(rec: &TeRecord) -> Result<(), String> {
    if rec.te_ns.iter().any(|v| !v.is_finite()) {
        return Err(crate::terr!("e-holdover-test-the-record-holds-non-finite"));
    }
    Ok(())
}

impl HoldoverTestScenario {
    /// The canonical scenario hash: SHA-256 of the scenario as parsed, defaults filled.
    pub fn scenario_hash(&self) -> String {
        let c = serde_json::to_string(self).unwrap_or_default();
        let mut h = Sha256::new();
        h.update(c.as_bytes());
        hex::encode(h.finalize())
    }

    fn load(&self) -> Result<(TeRecord, Option<NormalisedPhase>), String> {
        let s = &self.series;
        let mut clock = None;
        let given = usize::from(!s.samples.is_empty())
            + usize::from(s.csv_path.is_some())
            + usize::from(s.clock_log.is_some());
        if given != 1 {
            return Err(if given == 0 {
                "give one of series.samples, series.csv_path or series.clock_log".into()
            } else {
                "give one of series.samples, series.csv_path or series.clock_log, not more than one"
                    .into()
            });
        }
        let pairs: Vec<[f64; 2]> = if let Some(c) = &s.clock_log {
            let log = clock_log::read_input(c)?;
            let pairs = log
                .time_s
                .iter()
                .zip(&log.phase_s)
                .map(|(&t, &x)| [t, x * 1e9])
                .collect();
            clock = Some(log);
            pairs
        } else if let Some(p) = &s.csv_path {
            read_csv(p)?
        } else {
            s.samples.clone()
        };
        Ok((record_from_pairs(&pairs)?, clock))
    }

    /// Compute the run.
    pub fn run(&self) -> Result<HoldoverTestRun, String> {
        let t = &self.test;
        if !(t.gnss_removed_s.is_finite()
            && t.locked_duration_days.is_finite()
            && t.locked_duration_days >= 0.0
            && t.recovery_band_ns.is_finite()
            && t.recovery_band_ns > 0.0
            && t.recovery_dwell_s.is_finite()
            && t.recovery_dwell_s >= 0.0)
        {
            return Err(
                "gnss_removed_s must be finite, locked_duration_days >= 0, recovery_band_ns > 0 \
                 and recovery_dwell_s >= 0"
                    .into(),
            );
        }
        let mut masks = Vec::new();
        for id in &self.masks {
            masks.push(mask_by_id(id).ok_or_else(|| {
                crate::terr!(
                    "e-holdover-test-unknown-mask-expected-one-of",
                    id = format!("{:?}", id),
                    masks = MASKS.iter().map(|m| m.id).collect::<Vec<_>>().join(", ")
                )
            })?);
        }
        let budgets = self.budgets.clone().unwrap_or_else(default_budgets);
        if budgets
            .iter()
            .any(|b| !(b.max_abs_te_ns.is_finite() && b.max_abs_te_ns > 0.0))
        {
            return Err(crate::terr!("e-holdover-test-every-budget-max-abs-te"));
        }
        let (record, clock_log) = self.load()?;
        check_nan(&record)?;
        let n = record.te_ns.len();
        let t_end = record.t0_s + (n - 1) as f64 * record.dt_s;
        if !(t.gnss_removed_s >= record.t0_s && t.gnss_removed_s <= t_end) {
            return Err(crate::terr!(
                "e-holdover-test-gnss-removed-lies-outside-the",
                gnss_removed_s = t.gnss_removed_s,
                t0_s = record.t0_s,
                t_end = t_end
            ));
        }
        let i_rm = index_at(&record, t.gnss_removed_s).min(n);
        let i_rs = match t.gnss_restored_s {
            None => n,
            Some(r) => {
                if !(r.is_finite() && r > t.gnss_removed_s && r <= t_end + record.dt_s) {
                    return Err(crate::terr!(
                        "e-holdover-test-gnss-restored-must-be-later",
                        r = r,
                        gnss_removed_s = t.gnss_removed_s,
                        t_end = t_end
                    ));
                }
                index_at(&record, r).min(n)
            }
        };
        if i_rm >= i_rs {
            return Err(crate::terr!("e-holdover-test-the-holdover-step-holds-no"));
        }
        let mut steps = Vec::new();
        if i_rm > 0 {
            steps.push(Step {
                name: "baseline",
                rec: slice(&record, 0, i_rm),
            });
        }
        steps.push(Step {
            name: "holdover",
            rec: slice(&record, i_rm, i_rs),
        });
        if i_rs < n {
            steps.push(Step {
                name: "recovery",
                rec: slice(&record, i_rs, n),
            });
        }
        let find = |name: &str| steps.iter().find(|s| s.name == name);

        // Curves and masks, each on the step its condition names.
        let mut curves = Vec::new();
        let mut results = Vec::new();
        let hold_start = record.t0_s + i_rm as f64 * record.dt_s;
        let envelope =
            find("holdover").map(|h| check_envelope(&h.rec, hold_start, t.locked_duration_days));
        for name in ["baseline", "holdover"] {
            if let Some(s) = find(name) {
                // The estimators need a few samples; a step too short for a curve has none.
                let (m, d) = if s.rec.te_ns.len() >= 13 {
                    (
                        mtie_curve_ns(&s.rec.te_ns, s.rec.dt_s),
                        tdev_curve_ns(&s.rec.te_ns, s.rec.dt_s),
                    )
                } else {
                    (Vec::new(), Vec::new())
                };
                curves.push((name, m, d));
            }
        }
        for mask in &masks {
            let step = match mask.condition {
                MaskCondition::Locked => "baseline",
                MaskCondition::Holdover | MaskCondition::Autonomous => "holdover",
            };
            let Some(s) = find(step) else {
                results.push((
                    step,
                    MaskResult {
                        id: mask.id,
                        title: mask.title,
                        recommendation: mask.recommendation,
                        condition: mask.condition.as_str(),
                        measurement_filter: mask.filter.as_str(),
                        verdict: "NOT-EVALUATED",
                        checks: vec![CheckResult {
                            metric: "step",
                            source: "",
                            verdict: "NOT-EVALUATED",
                            limit_ns: None,
                            value_ns: None,
                            margin_ns: None,
                            worst_tau_s: None,
                            points_evaluated: 0,
                            note: crate::t!("holdover-test-the-record-has-no-step", step = step),
                        }],
                        not_specified: mask.not_specified,
                    },
                ));
                continue;
            };
            if s.rec.te_ns.len() < 13 {
                results.push((
                    step,
                    MaskResult {
                        id: mask.id,
                        title: mask.title,
                        recommendation: mask.recommendation,
                        condition: mask.condition.as_str(),
                        measurement_filter: mask.filter.as_str(),
                        verdict: "NOT-EVALUATED",
                        checks: vec![CheckResult {
                            metric: "step",
                            source: "",
                            verdict: "NOT-EVALUATED",
                            limit_ns: None,
                            value_ns: None,
                            margin_ns: None,
                            worst_tau_s: None,
                            points_evaluated: 0,
                            note: crate::t!(
                                "holdover-test-the-step-has-samples-the",
                                step = step,
                                te_ns = s.rec.te_ns.len()
                            ),
                        }],
                        not_specified: mask.not_specified,
                    },
                ));
                continue;
            }
            let (_, m, d) = curves
                .iter()
                .find(|(nm, _, _)| *nm == step)
                .ok_or_else(|| crate::terr!("e-holdover-test-step-with-mask-has-no"))?;
            let env = if step == "holdover" {
                envelope.as_ref()
            } else {
                None
            };
            results.push((step, check_mask(mask, &s.rec, m, d, env)));
        }

        // Holdover figures.
        let hold = find("holdover");
        let fit = hold.and_then(|h| {
            let tau: Vec<f64> = (0..h.rec.te_ns.len())
                .map(|k| k as f64 * h.rec.dt_s)
                .collect();
            linear_fit(&tau, &h.rec.te_ns)
        });
        let extremum = hold.and_then(|h| {
            h.rec
                .te_ns
                .iter()
                .enumerate()
                .max_by(|a, b| a.1.abs().total_cmp(&b.1.abs()))
                .map(|(k, v)| (k as f64 * h.rec.dt_s, *v))
        });
        let step_at_removal =
            (i_rm > 0).then(|| (record.te_ns[i_rm] - record.te_ns[i_rm - 1]).abs());
        let budgets = hold
            .map(|h| budget_results(&h.rec, hold_start, &budgets))
            .unwrap_or_default();
        let rec_result = find("recovery").map(|r| {
            let prev = (i_rs > 0).then(|| record.te_ns[i_rs - 1]);
            recovery(&r.rec, prev, t.recovery_band_ns, t.recovery_dwell_s)
        });
        Ok(HoldoverTestRun {
            record,
            clock_log,
            steps,
            masks: results,
            envelope,
            budgets,
            holdover_fit: fit,
            holdover_extremum: extremum,
            step_at_removal,
            recovery: rec_result,
            curves,
        })
    }

    /// Run and render `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.run()?;
        Ok((self.to_json(&r)?, summary_line(&r), to_svg(self, &r)))
    }

    fn to_json(&self, r: &HoldoverTestRun) -> Result<String, String> {
        let rec = &r.record;
        let n = rec.te_ns.len();
        let steps: Vec<Value> = r
            .steps
            .iter()
            .map(|s| {
                let st = stats(&s.rec.te_ns);
                json!({
                    "name": s.name,
                    "start_s": s.rec.t0_s,
                    "end_s": s.rec.t0_s + (s.rec.te_ns.len() - 1) as f64 * s.rec.dt_s,
                    "n_samples": s.rec.te_ns.len(),
                    "mean_te_ns": st.as_ref().map(|v| v.mean),
                    "rms_te_ns": st.as_ref().map(|v| v.rms),
                    "max_abs_te_ns": st.as_ref().map(|v| v.max_abs),
                    "first_te_ns": st.as_ref().map(|v| v.first),
                    "last_te_ns": st.as_ref().map(|v| v.last),
                })
            })
            .collect();
        let (series_stride, series_idx) = series_indices(n);
        let hold = r.steps.iter().find(|s| s.name == "holdover");
        let holdover = hold.map(|h| {
            json!({
                "duration_s": (h.rec.te_ns.len() - 1) as f64 * h.rec.dt_s,
                "frequency_offset_ppb": r.holdover_fit.map(|f| f.1),
                "fit_intercept_ns": r.holdover_fit.map(|f| f.0),
                "fit_residual_rms_ns": r.holdover_fit.map(|f| f.2),
                "time_of_max_abs_te_s": r.holdover_extremum.map(|e| e.0),
                "te_at_max_abs_ns": r.holdover_extremum.map(|e| e.1),
                "step_at_removal_ns": r.step_at_removal,
            })
        });
        let masks: Vec<Value> = r
            .masks
            .iter()
            .map(|(step, m)| {
                let mut v = serde_json::to_value(m).unwrap_or(Value::Null);
                v["step"] = Value::from(*step);
                v
            })
            .collect();
        let verdict_for = |step: &str| {
            let sel: Vec<&MaskResult> = r
                .masks
                .iter()
                .filter(|(s, _)| *s == step)
                .map(|(_, m)| m)
                .collect();
            overall(&sel)
        };
        let recovery_verdict = match &r.recovery {
            Some(x) if x.recovered => "RECOVERED",
            Some(_) => "NOT-RECOVERED",
            None => "NOT-EVALUATED",
        };
        let curves: Vec<Value> = r
            .curves
            .iter()
            .flat_map(|(step, m, d)| {
                m.iter().map(move |p| {
                    json!({
                        "step": step,
                        "tau_s": p.tau_s,
                        "mtie_ns": p.value_ns,
                        "tdev_ns": d.iter().find(|q| q.tau_s == p.tau_s).map(|q| q.value_ns),
                    })
                })
            })
            .collect();
        let mut doc = json!({
            "kind": "holdover-test",
            "label": LABEL,
            "engine_version": env!("CARGO_PKG_VERSION"),
            "scenario_hash": self.scenario_hash(),
            "test": {
                "gnss_removed_s": self.test.gnss_removed_s,
                "gnss_restored_s": self.test.gnss_restored_s,
                "locked_duration_days": self.test.locked_duration_days,
                "recovery_band_ns": self.test.recovery_band_ns,
                "recovery_dwell_s": self.test.recovery_dwell_s,
                "stated_by": "the operator; not verified by Kshana",
            },
            "record": {
                "sample_interval_s": rec.dt_s,
                "n_samples": n,
                "record_length_s": (n - 1) as f64 * rec.dt_s,
                "start_s": rec.t0_s,
                "series_sha256": series_sha256(&rec.te_ns),
                "series": {
                    "time_s": series_idx.iter().map(|&k| rec.t0_s + k as f64 * rec.dt_s).collect::<Vec<f64>>(),
                    "time_error_ns": series_idx.iter().map(|&k| rec.te_ns[k]).collect::<Vec<f64>>(),
                },
                "series_decimation": {
                    "stride": series_stride,
                    "n_source": n,
                    "n_points": series_idx.len(),
                    "rule": SERIES_DECIMATION_RULE,
                },
            },
            "steps": steps,
            "holdover": holdover,
            "recovery": r.recovery,
            "curves": curves,
            "masks": masks,
            "holdover_envelope": r.envelope,
            "budgets": r.budgets,
            "verdicts": {
                "baseline_masks": verdict_for("baseline"),
                "holdover_masks": verdict_for("holdover"),
                "holdover_envelope": r.envelope.as_ref().map(|e| e.verdict).unwrap_or("NOT-EVALUATED"),
                "recovery": recovery_verdict,
            },
            "not_covered": NOT_COVERED,
            "units": crate::field_schema::units_block(&units()),
        });
        if let Some(log) = &r.clock_log {
            let mut u = units();
            u.extend_from_slice(clock_log::TELECOM_LOG_UNITS);
            doc["clock_log"] = serde_json::to_value(log).map_err(|e| e.to_string())?;
            doc["units"] = crate::field_schema::units_block(&u);
        }
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }
}

#[cfg(not(target_arch = "wasm32"))]
fn read_csv(path: &str) -> Result<Vec<[f64; 2]>, String> {
    let text = std::fs::read_to_string(path).map_err(|e| {
        crate::terr!(
            "e-holdover-test-cannot-read-csv-path",
            path = format!("{:?}", path),
            e = e
        )
    })?;
    parse_csv_pairs(&text)
}

#[cfg(target_arch = "wasm32")]
fn read_csv(_path: &str) -> Result<Vec<[f64; 2]>, String> {
    Err(
        "csv_path is not available in the WebAssembly build; give the series inline as \
         `samples` or `clock_log.text`"
            .into(),
    )
}

fn summary_line(r: &HoldoverTestRun) -> String {
    let hold = r.steps.iter().find(|s| s.name == "holdover");
    let max_abs = hold
        .and_then(|h| stats(&h.rec.te_ns))
        .map(|s| s.max_abs)
        .unwrap_or(0.0);
    let masks: Vec<String> = r
        .masks
        .iter()
        .map(|(_, m)| format!("{} {}", m.id, m.verdict))
        .collect();
    let hold_s = crate::i18n::localise_decimal(format!(
        "{:.0}",
        hold.map(|h| (h.rec.te_ns.len() - 1) as f64 * h.rec.dt_s)
            .unwrap_or(0.0)
    ));
    let max_abs = crate::i18n::localise_decimal(format!("{:.1}", max_abs));
    let masks = masks.join(", ");
    match r.recovery.as_ref().map(|x| x.time_to_recover_s) {
        Some(Some(t)) => crate::t!(
            "holdover-test-holdover-recovered-after-gnss-returned",
            hold = hold_s,
            max_abs = max_abs,
            masks = masks,
            t = crate::i18n::localise_decimal(format!("{:.0}", t))
        ),
        Some(None) => crate::t!(
            "holdover-test-holdover-not-recovered-within-record",
            hold = hold_s,
            max_abs = max_abs,
            masks = masks
        ),
        None => crate::t!(
            "holdover-test-holdover-test-holdover-max-te",
            hold = hold_s,
            max_abs = max_abs,
            masks = masks
        ),
    }
}

/// |TE| against time with the three steps shaded and the budgets drawn.
fn to_svg(sc: &HoldoverTestScenario, r: &HoldoverTestRun) -> String {
    use crate::palette::chart::{AMBER, BLUE, INK_3, MUTED};
    let (w, h) = (900.0, 460.0);
    let mut s = crate::chart::frame_open(
        w,
        h,
        &crate::t!("holdover-test-chart-title"),
        &summary_line(r),
    );
    let (lx, top, pw, ph) = (80.0, 80.0, 760.0, 320.0);
    let rec = &r.record;
    let n = rec.te_ns.len();
    let mut y_max = rec.te_ns.iter().fold(0.0_f64, |a, &x| a.max(x.abs()));
    for b in &r.budgets {
        if b.max_abs_te_ns < 4.0 * y_max.max(1e-9) {
            y_max = y_max.max(b.max_abs_te_ns);
        }
    }
    let y_max = if y_max > 0.0 { y_max * 1.05 } else { 1.0 };
    s.push_str(&crate::chart::y_axis(
        lx,
        top,
        pw,
        ph,
        y_max,
        &crate::t!("holdover-test-chart-y-title"),
    ));
    s.push_str(&crate::chart::panel_axes(
        lx,
        top,
        pw,
        top + ph,
        &crate::t!("holdover-test-chart-panel-caption"),
    ));
    let t_span = ((n - 1) as f64 * rec.dt_s).max(1e-9);
    let x_of = |t: f64| lx + pw * (t - rec.t0_s) / t_span;
    let hold_end = sc.test.gnss_restored_s.unwrap_or(rec.t0_s + t_span);
    s.push_str(&format!(
        "<rect x=\"{:.1}\" y=\"{top:.0}\" width=\"{:.1}\" height=\"{ph:.0}\" fill=\"{BLUE}\" opacity=\"0.08\"/>",
        x_of(sc.test.gnss_removed_s),
        (x_of(hold_end) - x_of(sc.test.gnss_removed_s)).max(0.0)
    ));
    let stride = (n / 700).max(1);
    let pts: Vec<String> = (0..n)
        .step_by(stride)
        .map(|k| {
            let x = x_of(rec.t0_s + k as f64 * rec.dt_s);
            let y = top + ph - ph * (rec.te_ns[k].abs() / y_max).min(1.0);
            format!("{x:.1},{y:.1}")
        })
        .collect();
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"{AMBER}\" stroke-width=\"1.2\" points=\"{}\"/>",
        pts.join(" ")
    ));
    for b in &r.budgets {
        if b.max_abs_te_ns <= y_max {
            let y = top + ph - ph * b.max_abs_te_ns / y_max;
            s.push_str(&format!(
                "<line x1=\"{lx:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"{INK_3}\" stroke-dasharray=\"4 3\"/>\
                 <text x=\"{:.0}\" y=\"{:.1}\" font-size=\"10\" fill=\"{MUTED}\" text-anchor=\"end\">{} ns</text>",
                lx + pw,
                lx + pw - 4.0,
                y - 3.0,
                crate::i18n::num(b.max_abs_te_ns, 0)
            ));
        }
    }
    for (t, label) in [
        (
            Some(sc.test.gnss_removed_s),
            crate::t!("holdover-test-chart-gnss-removed"),
        ),
        (
            sc.test.gnss_restored_s,
            crate::t!("holdover-test-chart-gnss-restored"),
        ),
    ] {
        if let Some(t) = t {
            let x = x_of(t);
            s.push_str(&format!(
                "<line x1=\"{x:.1}\" y1=\"{top:.0}\" x2=\"{x:.1}\" y2=\"{:.0}\" stroke=\"{BLUE}\" stroke-dasharray=\"2 3\"/>\
                 <text x=\"{:.1}\" y=\"{:.0}\" font-size=\"10\" fill=\"{BLUE}\">{label}</text>",
                top + ph,
                x + 3.0,
                top + 12.0
            ));
        }
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"{MUTED}\">{}</text>",
        lx + pw / 2.0,
        top + ph + 28.0,
        crate::t!(
            "holdover-test-chart-time-axis",
            min = crate::i18n::num(t_span / 60.0, 1)
        )
    ));
    s.push_str("</svg>");
    s
}

/// Unit and provenance class for every numeric field the report emits. The rows for the mask,
/// envelope and budget blocks are the ones `telecom-timing` publishes for the same blocks.
pub fn units() -> Vec<FieldUnit> {
    use ProvenanceClass::*;
    let mut v: Vec<FieldUnit> = crate::telecom_timing::UNITS
        .iter()
        .filter(|u| {
            u.path.starts_with("masks[]")
                || u.path.starts_with("holdover_envelope.")
                || u.path.starts_with("budgets[]")
        })
        .copied()
        .collect();
    let row = |path, unit, provenance, definition| FieldUnit {
        path,
        unit,
        provenance,
        definition,
    };
    v.extend([
        row("test.gnss_removed_s", "s", Input, "time the operator states GNSS was removed, on the record's time axis"),
        row("test.gnss_restored_s", "s", Input, "time the operator states GNSS was restored, on the record's time axis"),
        row("test.locked_duration_days", "d", Input, "how long the system had been locked before GNSS was removed, which sets the ePRTC-A holdover period"),
        row("test.recovery_band_ns", "ns", Input, "|TE| at or below this counts as recovered"),
        row("test.recovery_dwell_s", "s", Input, "|TE| must stay inside the recovery band this long to count as recovered"),
        row("record.sample_interval_s", "s", Input, "interval between consecutive time-error samples"),
        row("record.n_samples", "count", Computed, "number of time-error samples in the record"),
        row("record.record_length_s", "s", Computed, "time from the first to the last sample"),
        row("record.start_s", "s", Input, "time stamp of the first sample"),
        row("record.series.time_s[]", "s", Computed, "time of a kept sample on the record's own time axis, the first sample, every stride-th sample and the last (the rule is in record.series_decimation.rule)"),
        row("record.series.time_error_ns[]", "ns", Input, "the time error of that sample, exactly as the record gave it"),
        row("record.series_decimation.stride", "count", Computed, "samples between kept points; 1 when the record has at most 3000 samples"),
        row("record.series_decimation.n_source", "count", Computed, "samples in the whole record"),
        row("record.series_decimation.n_points", "count", Computed, "points in record.series, at most 3000"),
        row("steps[].start_s", "s", Computed, "time of the first sample of the step"),
        row("steps[].end_s", "s", Computed, "time of the last sample of the step"),
        row("steps[].n_samples", "count", Computed, "samples in the step"),
        row("steps[].mean_te_ns", "ns", Computed, "mean time error over the step"),
        row("steps[].rms_te_ns", "ns", Computed, "root-mean-square time error over the step"),
        row("steps[].max_abs_te_ns", "ns", Computed, "largest absolute time error over the step"),
        row("steps[].first_te_ns", "ns", Computed, "time error at the first sample of the step"),
        row("steps[].last_te_ns", "ns", Computed, "time error at the last sample of the step"),
        row("holdover.duration_s", "s", Computed, "time from the first to the last sample of the holdover step"),
        row("holdover.frequency_offset_ppb", "1e-9", Computed, "slope of the least-squares line through the holdover time error: the fractional frequency offset the system held, in parts per billion (1 ns/s)"),
        row("holdover.fit_intercept_ns", "ns", Computed, "the least-squares line's value at the start of the holdover step"),
        row("holdover.fit_residual_rms_ns", "ns", Computed, "root-mean-square distance of the holdover time error from the least-squares line"),
        row("holdover.time_of_max_abs_te_s", "s", Computed, "time after GNSS removal of the largest absolute time error"),
        row("holdover.te_at_max_abs_ns", "ns", Computed, "the signed time error at that sample"),
        row("holdover.step_at_removal_ns", "ns", Computed, "absolute change of the time error between the last baseline sample and the first holdover sample"),
        row("recovery.time_to_recover_s", "s", Computed, "time from GNSS restoration to the start of the first stay inside the recovery band that lasts the dwell time"),
        row("recovery.band_ns", "ns", Input, "the recovery band used"),
        row("recovery.dwell_s", "s", Input, "the recovery dwell used"),
        row("recovery.peak_abs_te_ns", "ns", Computed, "largest absolute time error after GNSS restoration"),
        row("recovery.final_abs_te_ns", "ns", Computed, "absolute time error at the last sample"),
        row("recovery.largest_step_ns", "ns", Computed, "largest change between consecutive samples from the last holdover sample to the end of the record"),
        row("curves[].tau_s", "s", Computed, "observation interval of an MTIE and TDEV point"),
        row("curves[].mtie_ns", "ns", Computed, "maximum time interval error of the step at that observation interval"),
        row("curves[].tdev_ns", "ns", Computed, "time deviation of the step at that observation interval"),
    ]);
    v
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A record built from a formula, with every answer known by hand: a baseline of ±2 ns
    /// alternating, a holdover that drifts 0.5 ns/s, and a recovery that steps back to
    /// zero and settles.
    fn formula_series() -> Vec<[f64; 2]> {
        let mut v = Vec::new();
        for k in 0..600 {
            v.push([k as f64, if k % 2 == 0 { 2.0 } else { -2.0 }]);
        }
        for k in 600..2400 {
            let tau = (k - 600) as f64;
            v.push([k as f64, 0.5 * tau + if k % 2 == 0 { 1.0 } else { -1.0 }]);
        }
        for k in 2400..3000 {
            let tau = (k - 2400) as f64;
            v.push([
                k as f64,
                400.0 * (-tau / 20.0).exp() + if k % 2 == 0 { 1.0 } else { -1.0 },
            ]);
        }
        v
    }

    fn scenario(masks: &[&str], restored: Option<f64>) -> HoldoverTestScenario {
        HoldoverTestScenario {
            kind: "holdover-test".into(),
            masks: masks.iter().map(|s| s.to_string()).collect(),
            budgets: None,
            test: TestInput {
                gnss_removed_s: 600.0,
                gnss_restored_s: restored,
                locked_duration_days: 5.0,
                recovery_band_ns: 100.0,
                recovery_dwell_s: 60.0,
            },
            series: SeriesInput {
                samples: formula_series(),
                csv_path: None,
                clock_log: None,
            },
        }
    }

    #[test]
    fn the_record_series_is_decimated_deterministically_and_keeps_the_ends() {
        // At most 3000 samples: every sample, stride 1.
        let (stride, idx) = series_indices(3000);
        assert_eq!((stride, idx.len()), (1, 3000));
        // Over: ceil((n - 1) / 2998); the last sample is always kept; never more than 3000 points.
        for n in [3001usize, 4500, 9001, 100_000, 5_000_000] {
            let (stride, idx) = series_indices(n);
            assert_eq!(stride, (n - 1).div_ceil(2998), "{n}");
            assert!(idx.len() <= SERIES_MAX_POINTS, "{n}: {}", idx.len());
            assert_eq!((idx[0], *idx.last().unwrap()), (0, n - 1), "{n}");
            assert!(idx.windows(2).all(|w| w[1] > w[0]), "{n}");
        }
        // In the report: the points are samples of the record, with the rule stated.
        let mut sc = scenario(&["prtc-a"], Some(2400.0));
        let long: Vec<[f64; 2]> = (0..9001).map(|k| [k as f64, (k % 7) as f64]).collect();
        sc.series.samples = long;
        sc.test.gnss_removed_s = 3000.0;
        sc.test.gnss_restored_s = Some(6000.0);
        let (json, _, _) = sc.run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let t = v["record"]["series"]["time_s"].as_array().unwrap();
        let x = v["record"]["series"]["time_error_ns"].as_array().unwrap();
        assert_eq!(
            (t.len(), x.len()),
            (
                v["record"]["series_decimation"]["n_points"]
                    .as_u64()
                    .unwrap() as usize,
                t.len()
            )
        );
        assert!(t.len() <= 3000);
        assert_eq!(v["record"]["series_decimation"]["stride"], 4);
        assert_eq!(t[1].as_f64().unwrap(), 4.0);
        assert_eq!(t.last().unwrap().as_f64().unwrap(), 9000.0);
        assert_eq!(x[1].as_f64().unwrap(), 4.0);
        assert!(v["record"]["series_decimation"]["rule"]
            .as_str()
            .unwrap()
            .contains("no averaging"));
        assert!(v["units"]["record.series.time_s[]"].is_object());
    }

    #[test]
    fn the_record_is_split_at_the_stated_times() {
        let r = scenario(&["prtc-a"], Some(2400.0)).run().unwrap();
        let names: Vec<_> = r
            .steps
            .iter()
            .map(|s| (s.name, s.rec.te_ns.len()))
            .collect();
        assert_eq!(
            names,
            [("baseline", 600), ("holdover", 1800), ("recovery", 600)]
        );
        assert_eq!(r.steps[1].rec.t0_s, 600.0);
        // No restoration: no recovery step, and the holdover runs to the end.
        let r = scenario(&["prtc-a"], None).run().unwrap();
        let names: Vec<_> = r
            .steps
            .iter()
            .map(|s| (s.name, s.rec.te_ns.len()))
            .collect();
        assert_eq!(names, [("baseline", 600), ("holdover", 2400)]);
        assert!(r.recovery.is_none());
    }

    #[test]
    fn holdover_figures_match_a_hand_computation() {
        let r = scenario(&["prtc-a"], Some(2400.0)).run().unwrap();
        let (a, b, _) = r.holdover_fit.unwrap();
        // The drift is 0.5 ns/s with an alternating ±1 ns that a line through a long record
        // hardly feels.
        assert!((b - 0.5).abs() < 1e-4, "slope {b}");
        assert!(a.abs() < 0.5, "intercept {a}");
        // The largest |TE| is at tau = 1798 (even k, so +1): 0.5·1798 + 1 = 900; the last
        // sample, tau = 1799, is 0.5·1799 − 1 = 898.5.
        let (tau, x) = r.holdover_extremum.unwrap();
        assert_eq!(tau, 1798.0);
        assert!((x - 900.0).abs() < 1e-9, "{x}");
        // The step at removal: -2 (k = 599, odd) to +1 (k = 600, even, tau = 0).
        assert_eq!(r.step_at_removal, Some(3.0));
        // The 100 ns budget (the first default) is first exceeded when 0.5·tau ± 1 > 100:
        // tau = 200 gives 101 (even k) and tau = 199 gives 98.5 - 1 = 98.5 (odd k).
        let b100 = &r.budgets[0];
        assert_eq!(b100.max_abs_te_ns, 100.0);
        assert_eq!(b100.time_to_exceed_s, Some(200.0));
        assert!(
            !r.budgets.last().unwrap().exceeded,
            "1500 ns is never reached by 900 ns"
        );
    }

    #[test]
    fn recovery_is_timed_from_the_restoration() {
        let r = scenario(&["prtc-a"], Some(2400.0)).run().unwrap();
        let rec = r.recovery.unwrap();
        // 400·exp(-tau/20) + (±1) is inside 100 ns once exp(-tau/20) < ~0.2475: tau > 28.0.
        // Find the first tau from which every sample stays inside, and hold the report to it.
        let x: Vec<f64> = formula_series()[2400..].iter().map(|p| p[1]).collect();
        let first_in = (0..x.len())
            .find(|&k| x[k..].iter().take(60).all(|v| v.abs() <= 100.0) && x[k..].len() >= 60)
            .unwrap();
        assert!(rec.recovered);
        assert_eq!(rec.time_to_recover_s, Some(first_in as f64));
        assert!((28..=32).contains(&first_in), "{first_in}");
        assert!((rec.peak_abs_te_ns - 401.0).abs() < 1e-9);
        // The step at restoration: from the last holdover sample (0.5·1799 - 1 = 898.5) to
        // 400 + 1 = 401.
        assert!(
            (rec.largest_step_ns - (898.5 - 401.0)).abs() < 1e-9,
            "{}",
            rec.largest_step_ns
        );
        // A band the record never settles inside is not recovered.
        let mut sc = scenario(&["prtc-a"], Some(2400.0));
        sc.test.recovery_band_ns = 0.1;
        assert!(!sc.run().unwrap().recovery.unwrap().recovered);
    }

    #[test]
    fn masks_are_measured_on_the_step_their_condition_names() {
        let r = scenario(&["prtc-a", "eprtc-a-holdover"], Some(2400.0))
            .run()
            .unwrap();
        let by = |id: &str| r.masks.iter().find(|(_, m)| m.id == id).unwrap();
        assert_eq!(by("prtc-a").0, "baseline");
        assert_eq!(by("eprtc-a-holdover").0, "holdover");
        // ±2 ns for 600 s is far inside the PRTC-A 100 ns maximum, and the cte check passes.
        let prtc = &by("prtc-a").1;
        let max_te = prtc
            .checks
            .iter()
            .find(|c| c.metric == "max_abs_te")
            .unwrap();
        assert_eq!(max_te.verdict, "PASS");
        assert_eq!(max_te.value_ns, Some(2.0));
        // The holdover drifts to 900 ns in 1800 s: the ePRTC-A holdover envelope fails, and the
        // time to exceed it is reported.
        let env = r.envelope.as_ref().unwrap();
        assert_eq!(env.verdict, "FAIL");
        assert!(env.time_to_exceed_s.is_some());
    }

    #[test]
    fn a_record_with_no_baseline_says_so() {
        let mut sc = scenario(&["prtc-a", "eprtc-a-holdover"], None);
        sc.test.gnss_removed_s = 0.0;
        let r = sc.run().unwrap();
        assert!(r.steps.iter().all(|s| s.name != "baseline"));
        let (step, m) = r.masks.iter().find(|(_, m)| m.id == "prtc-a").unwrap();
        assert_eq!(*step, "baseline");
        assert_eq!(m.verdict, "NOT-EVALUATED");
        assert!(
            m.checks[0].note.contains("no baseline step"),
            "{}",
            m.checks[0].note
        );
    }

    #[test]
    fn bad_inputs_are_refused_with_the_reason() {
        let mut sc = scenario(&["prtc-a"], Some(2400.0));
        sc.test.gnss_removed_s = 5000.0;
        assert!(sc.run().err().unwrap().contains("outside the record"));
        let sc = scenario(&["prtc-a"], Some(500.0));
        assert!(sc
            .run()
            .err()
            .unwrap()
            .contains("later than gnss_removed_s"));
        assert!(scenario(&["nope"], None)
            .run()
            .err()
            .unwrap()
            .contains("unknown mask"));
        let mut sc = scenario(&["prtc-a"], None);
        sc.series.samples.clear();
        assert!(sc.run().err().unwrap().contains("give one of"));
        let mut sc = scenario(&["prtc-a"], None);
        sc.series.csv_path = Some("x.csv".into());
        assert!(sc.run().err().unwrap().contains("not more than one"));
    }

    #[test]
    fn the_report_carries_the_label_the_units_and_no_conformance_word() {
        let sc = scenario(&["prtc-a", "eprtc-a-holdover"], Some(2400.0));
        let (json, summary, svg) = sc.run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "holdover-test");
        assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
        assert_eq!(v["verdicts"]["recovery"], "RECOVERED");
        assert!(v["units"]["recovery.time_to_recover_s"].is_object());
        assert!(summary.contains("measured against the mask"), "{summary}");
        assert!(svg.starts_with("<svg") && svg.contains("GNSS removed"));
        for text in [json.as_str(), summary.as_str(), svg.as_str()] {
            let lower = text.to_lowercase();
            for stem in ["certif", "complies", "compliant", "conform"] {
                assert!(
                    !lower.contains(stem),
                    "forbidden stem {stem:?} in the report"
                );
            }
        }
        // The same scenario hashes the same.
        assert_eq!(
            sc.scenario_hash(),
            scenario(&["prtc-a", "eprtc-a-holdover"], Some(2400.0)).scenario_hash()
        );
    }

    #[test]
    fn a_ptp4l_log_is_scored_end_to_end() {
        // A ptp4l servo log at 1 s: locked for 300 s, 600 s drifting 2 ns per second, then
        // pulled back. Built here, parsed by the clock-log reader, split at the stated times.
        let mut text = String::new();
        for k in 0..1500 {
            let off = if k < 300 {
                (k % 3) as f64 - 1.0
            } else if k < 900 {
                2.0 * (k - 300) as f64
            } else {
                1200.0 * (-((k - 900) as f64) / 30.0).exp()
            };
            text.push_str(&format!(
                "ptp4l[{}.000]: master offset {:>12} s2 freq +1000 path delay 500\n",
                1000 + k,
                off.round() as i64
            ));
        }
        let sc = HoldoverTestScenario {
            kind: "holdover-test".into(),
            masks: vec!["prtc-a".into()],
            budgets: None,
            test: TestInput {
                gnss_removed_s: 300.0,
                gnss_restored_s: Some(900.0),
                locked_duration_days: 5.0,
                recovery_band_ns: 100.0,
                recovery_dwell_s: 30.0,
            },
            series: SeriesInput {
                samples: Vec::new(),
                csv_path: None,
                clock_log: Some(ClockLogInput {
                    format: "ptp4l".into(),
                    text: Some(text),
                    ..Default::default()
                }),
            },
        };
        let r = sc.run().unwrap();
        assert_eq!(r.clock_log.as_ref().unwrap().format.name(), "ptp4l");
        let (_, b, _) = r.holdover_fit.unwrap();
        assert!((b - 2.0).abs() < 1e-3, "slope {b} ppb");
        let rec = r.recovery.unwrap();
        assert!(rec.recovered);
        let t = rec.time_to_recover_s.unwrap();
        // 1200·exp(-tau/30) <= 100 at tau = 30·ln 12 = 74.5.
        assert!((70.0..=80.0).contains(&t), "{t}");
        let (json, _, _) = sc.run_output().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["clock_log"]["format"], "ptp4l");
    }
}
