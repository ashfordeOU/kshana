// SPDX-License-Identifier: AGPL-3.0-only
//! The fit: calibration offset, both lock models, bootstrap uncertainty over runs,
//! cross-validated hold-out error, and predictions.
//!
//! 1. **Level calibration.** One offset (dB) added to every stated level, fitted by least
//!    squares of reported C/N0 against modelled C/N0 at every tracked epoch inside an
//!    event. It absorbs what the bench does not state (cable and coupling loss, a
//!    jammer-to-signal ratio quoted at a different reference).
//! 2. **Lock models.** For each model, the four parameters minimising the sum of squared
//!    differences between modelled and observed per-satellite loss and reacquisition
//!    times, over a bounded box: a regular starting grid, then bounded Nelder-Mead
//!    ([`super::optim`]) from the three best grid points. A modelled event with no
//!    observed counterpart (or the reverse) is scored as if the missing one happened at
//!    the end of the run, so the objective sees missed and extra events.
//! 3. **Uncertainty.** A seeded bootstrap over runs: runs are resampled with replacement,
//!    the offset and both models are refitted (Nelder-Mead warm-started at the full fit),
//!    and the spread of each parameter is reported as a standard deviation and a 95 %
//!    percentile interval. Warm starting is a stated simplification: on a multimodal
//!    objective it can understate the spread.
//! 4. **Hold-out error.** Leave-one-run-out (or seeded k-fold) cross-validation with the
//!    full grid-plus-Nelder-Mead refit per fold. Each held-out run is classed as
//!    *interpolation* when its condition lies inside the box spanned by its training
//!    runs' conditions and *extrapolation* otherwise, with the distance stated, and the
//!    two classes' errors are reported separately.
//!
//! Everything here is **MODELLED**: the parameters are the open receiver model fitted to
//! observed behaviour, not a measurement of any receiver's internals, and the hold-out
//! error is the evidence for how far the fitted model can be trusted.

use rand::seq::SliceRandom;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::Serialize;
use sha2::{Digest, Sha256};

use super::model::{lock_params, simulate_sat, ModelKind};
use super::observe::{observe, RunObservation};
use super::optim::{grid_search, nelder_mead_bounded, NmOptions};
use super::schema::{Conditions, LabFitScenario, ScaleCfg};
use crate::receiver_trust::Timeline;

/// One lab run ready to fit: its timeline, provenance and stated conditions.
#[derive(Clone, Debug, PartialEq)]
pub struct LabRun {
    /// Name of the run.
    pub label: String,
    /// SHA-256 of the log bytes (or, for a synthetic run, of its JSON timeline).
    pub sha256: String,
    /// Where the timeline came from (`ubx log`, `rinex log`, `synthetic`).
    pub source: String,
    /// The receiver-trust timeline.
    pub timeline: Timeline,
    /// Stated conditions.
    pub conditions: Conditions,
}

impl LabRun {
    /// A run built from an in-memory timeline (synthetic or already read); the hash is
    /// over the timeline's JSON serialisation.
    pub fn from_timeline(label: &str, timeline: Timeline, conditions: Conditions) -> Self {
        let json = serde_json::to_string(&timeline).unwrap_or_default();
        Self {
            label: label.to_string(),
            sha256: format!("{:x}", Sha256::digest(json.as_bytes())),
            source: "synthetic".into(),
            timeline,
            conditions,
        }
    }
}

/// Summary statistics of a bootstrapped quantity.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct BootStats {
    /// Replicates that produced a value.
    pub n: usize,
    /// Mean over replicates.
    pub mean: f64,
    /// Sample standard deviation over replicates.
    pub sd: f64,
    /// 2.5th percentile.
    pub p025: f64,
    /// 97.5th percentile.
    pub p975: f64,
}

fn percentile(sorted: &[f64], q: f64) -> f64 {
    if sorted.is_empty() {
        return f64::NAN;
    }
    let pos = q * (sorted.len() - 1) as f64;
    let (i, frac) = (pos.floor() as usize, pos - pos.floor());
    if i + 1 >= sorted.len() {
        sorted[sorted.len() - 1]
    } else {
        sorted[i] + frac * (sorted[i + 1] - sorted[i])
    }
}

fn boot_stats(v: &[f64]) -> Option<BootStats> {
    if v.is_empty() {
        return None;
    }
    let n = v.len();
    let mean = v.iter().sum::<f64>() / n as f64;
    let sd = if n > 1 {
        (v.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n - 1) as f64).sqrt()
    } else {
        0.0
    };
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    Some(BootStats {
        n,
        mean,
        sd,
        p025: percentile(&s, 0.025),
        p975: percentile(&s, 0.975),
    })
}

/// One fitted parameter.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ParamEstimate {
    /// Parameter name.
    pub name: String,
    /// Best-fit value.
    pub value: f64,
    /// Lower bound of the search box.
    pub lower_bound: f64,
    /// Upper bound of the search box.
    pub upper_bound: f64,
    /// True when the value sits on a bound: the data do not pin it inside the box.
    pub at_bound: bool,
    /// Bootstrap spread over runs.
    pub bootstrap: Option<BootStats>,
}

/// The level calibration fit.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OffsetFit {
    /// The offset (dB), as a parameter estimate.
    pub estimate: ParamEstimate,
    /// C/N0 samples it was fitted to.
    pub n_samples: usize,
    /// Root-mean-square reported minus modelled C/N0 at the fit (dB).
    pub rms_db: Option<f64>,
    /// Why the offset was not fitted, if it was not.
    pub note: Option<String>,
}

/// Modelled against observed events of one satellite in one run.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SatResidual {
    /// Run label.
    pub run: String,
    /// SHA-256 of the run's log.
    pub sha256: String,
    /// Satellite.
    pub sat: String,
    /// Nominal C/N0 (dB-Hz).
    pub nominal_cn0_dbhz: f64,
    /// Observed loss (s).
    pub obs_loss_s: Option<f64>,
    /// Modelled loss (s).
    pub pred_loss_s: Option<f64>,
    /// Modelled minus observed loss (s); a missing side is taken at the end of the run.
    pub loss_residual_s: Option<f64>,
    /// Observed reacquisition (s).
    pub obs_reacq_s: Option<f64>,
    /// Modelled reacquisition (s).
    pub pred_reacq_s: Option<f64>,
    /// Modelled minus observed reacquisition (s), as for the loss.
    pub reacq_residual_s: Option<f64>,
}

impl SatResidual {
    fn residuals(&self) -> impl Iterator<Item = f64> {
        self.loss_residual_s
            .into_iter()
            .chain(self.reacq_residual_s)
    }
}

/// One run under one fitted model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RunFit {
    /// Run label.
    pub run: String,
    /// SHA-256 of the run's log.
    pub sha256: String,
    /// Drop threshold the model implies for the run (dB-Hz); `null` when infinite.
    pub drop_cn0_dbhz: Option<f64>,
    /// Re-lock threshold (dB-Hz); `null` when infinite.
    pub relock_cn0_dbhz: Option<f64>,
    /// Compared events.
    pub n_events: usize,
    /// Root-mean-square event-time residual (s).
    pub rms_s: Option<f64>,
}

/// One held-out run in cross-validation.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct HoldoutRun {
    /// Run label.
    pub run: String,
    /// SHA-256 of the run's log.
    pub sha256: String,
    /// Fold the run was held out in.
    pub fold: usize,
    /// Compared events.
    pub n_events: usize,
    /// Root-mean-square event-time residual of the model fitted without this run (s).
    pub rms_s: Option<f64>,
    /// Distance of the run's condition from the box of its training conditions
    /// (scaled units; 0 inside).
    pub extrapolation_distance: f64,
    /// The nearest training run.
    pub nearest_training_run: String,
    /// `interpolation` or `extrapolation`.
    pub class: String,
}

/// Cross-validation of one model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CvReport {
    /// `leave-one-run-out` or `k-fold`.
    pub scheme: String,
    /// Number of folds.
    pub folds: usize,
    /// Per held-out run.
    pub holdout: Vec<HoldoutRun>,
    /// Hold-out RMS over every held-out event (s).
    pub rms_all_s: Option<f64>,
    /// Hold-out RMS over interpolation runs (s).
    pub rms_interpolation_s: Option<f64>,
    /// Hold-out RMS over extrapolation runs (s).
    pub rms_extrapolation_s: Option<f64>,
}

/// One fitted lock model.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ModelFit {
    /// Which model.
    pub model: ModelKind,
    /// Always `MODELLED`.
    pub label: String,
    /// The four fitted parameters.
    pub params: Vec<ParamEstimate>,
    /// Sum of squared event-time residuals (s²).
    pub sse_s2: f64,
    /// Compared events.
    pub n_events: usize,
    /// Root-mean-square event-time residual (s).
    pub rms_s: Option<f64>,
    /// Observed losses the model does not produce.
    pub loss_missed: usize,
    /// Modelled losses not observed.
    pub loss_extra: usize,
    /// Observed reacquisitions the model does not produce.
    pub reacq_missed: usize,
    /// Modelled reacquisitions not observed.
    pub reacq_extra: usize,
    /// Per run.
    pub per_run: Vec<RunFit>,
    /// Per satellite and run.
    pub residuals: Vec<SatResidual>,
    /// Cross-validation, when there are at least two runs.
    pub cv: Option<CvReport>,
}

/// What was read from one run, and how it was used.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RunSummary {
    /// Run label.
    pub label: String,
    /// SHA-256 of the log bytes (synthetic: of the JSON timeline).
    pub sha256: String,
    /// Where the timeline came from.
    pub source: String,
    /// Whether the lock fit used the run.
    pub used_in_fit: bool,
    /// Why not, if not.
    pub note: Option<String>,
    /// The observations.
    pub observation: RunObservation,
    /// Condition coordinates: peak stated level (dB), Doppler rate (Hz/s), code slew
    /// (chips/s); `null` without a stated level.
    pub condition: Option<[f64; 3]>,
    /// Root-mean-square reported minus modelled C/N0 inside the event at the fitted
    /// offset (dB).
    pub cn0_residual_rms_db: Option<f64>,
    /// Median of the last reported C/N0 before each loss (dB-Hz): a model-free reading
    /// of where this receiver drops lock.
    pub median_cn0_at_loss_dbhz: Option<f64>,
    /// Median of the first reported C/N0 after each reacquisition (dB-Hz).
    pub median_cn0_at_reacq_dbhz: Option<f64>,
}

/// A prediction for a condition: always labelled `PREDICTION`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Prediction {
    /// Always `PREDICTION`.
    pub label: String,
    /// The query's name.
    pub query: String,
    /// The model it comes from.
    pub model: ModelKind,
    /// Nominal C/N0 assumed (dB-Hz).
    pub nominal_cn0_dbhz: f64,
    /// Drop threshold under the query's dynamics (dB-Hz); `null` when infinite.
    pub drop_cn0_dbhz: Option<f64>,
    /// Re-lock threshold (dB-Hz); `null` when infinite.
    pub relock_cn0_dbhz: Option<f64>,
    /// Predicted loss time (s), if lock is lost within the run.
    pub loss_s: Option<f64>,
    /// Predicted time from onset to loss of lock (s).
    pub time_to_lose_lock_s: Option<f64>,
    /// Predicted reacquisition time (s).
    pub reacq_s: Option<f64>,
    /// Fraction of bootstrap replicates that predict a loss.
    pub boot_loss_fraction: Option<f64>,
    /// Bootstrap spread of the time to lose lock (over replicates that predict one).
    pub boot_time_to_lose_lock: Option<BootStats>,
    /// Condition coordinates of the query.
    pub condition: Option<[f64; 3]>,
    /// The nearest tested run.
    pub nearest_tested_run: Option<String>,
    /// Scaled distance to that run's condition.
    pub nearest_tested_distance: Option<f64>,
    /// Scaled distance outside the box of tested conditions (0 between them).
    pub extrapolation_distance: Option<f64>,
    /// Whether the query lies between tested conditions.
    pub within_tested_range: bool,
}

/// The lab-fit report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LabFitReport {
    /// Always `MODELLED`.
    pub label: String,
    /// The scenario kind, `iq-labfit`.
    pub kind: String,
    /// Scenario name.
    pub name: Option<String>,
    /// SHA-256 of the fit settings (everything but the runs, whose own hashes follow).
    pub settings_sha256: String,
    /// Per run.
    pub runs: Vec<RunSummary>,
    /// The level calibration.
    pub level_offset: OffsetFit,
    /// The fitted models.
    pub models: Vec<ModelFit>,
    /// Predictions.
    pub predictions: Vec<Prediction>,
    /// Stated limitations.
    pub notes: Vec<String>,
}

// --- internals ---------------------------------------------------------------------------

struct Prepared<'a> {
    run: &'a LabRun,
    obs: RunObservation,
}

fn condition_of(c: &Conditions) -> Option<[f64; 3]> {
    c.peak_level_db()
        .map(|l| [l, c.doppler_rate_hz_per_s, c.code_slew_chips_per_s])
}

fn scaled(c: [f64; 3], s: &ScaleCfg) -> [f64; 3] {
    let d = |x: f64, k: f64| if k > 0.0 { x / k } else { x };
    [
        d(c[0], s.level_db),
        d(c[1], s.doppler_rate_hz_per_s),
        d(c[2], s.code_slew_chips_per_s),
    ]
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    a.iter()
        .zip(&b)
        .map(|(x, y)| (x - y).powi(2))
        .sum::<f64>()
        .sqrt()
}

/// Distance from `q` to the box spanned by `pts` (0 inside), and the nearest point.
fn place(q: [f64; 3], pts: &[([f64; 3], String)]) -> Option<(f64, String, f64)> {
    let first = pts.first()?;
    let mut lo = first.0;
    let mut hi = first.0;
    for (p, _) in pts {
        for i in 0..3 {
            lo[i] = lo[i].min(p[i]);
            hi[i] = hi[i].max(p[i]);
        }
    }
    let ext = (0..3)
        .map(|i| (lo[i] - q[i]).max(q[i] - hi[i]).max(0.0).powi(2))
        .sum::<f64>()
        .sqrt();
    let (mut best, mut bd) = (first.1.clone(), f64::INFINITY);
    for (p, l) in pts {
        let d = dist(q, *p);
        if d < bd {
            bd = d;
            best = l.clone();
        }
    }
    Some((ext, best, bd))
}

fn cn0_residuals(p: &Prepared, offset: f64) -> Vec<f64> {
    let c = &p.run.conditions;
    p.obs
        .sats
        .iter()
        .flat_map(|s| {
            s.event_cn0.iter().filter_map(move |&(t, y)| {
                c.level_at(t)
                    .map(|l| y - c.cn0_at_level(s.nominal_cn0_dbhz, l, offset))
            })
        })
        .collect()
}

fn fit_offset(ps: &[&Prepared], sc: &LabFitScenario) -> Option<f64> {
    let n: usize = ps.iter().map(|p| cn0_residuals(p, 0.0).len()).sum();
    if n == 0 {
        return None;
    }
    let [lo, hi] = sc.bounds.level_offset_db;
    let f = |x: &[f64]| {
        ps.iter()
            .flat_map(|p| cn0_residuals(p, x[0]))
            .map(|r| r * r)
            .sum::<f64>()
    };
    let opts = NmOptions {
        ftol: 1e-13,
        xtol: 1e-12,
        ..NmOptions::default()
    };
    let x0 = 0.0f64.clamp(lo, hi);
    Some(nelder_mead_bounded(f, &[x0], &[lo], &[hi], &opts).x[0])
}

fn sat_residuals(
    kind: ModelKind,
    theta: &[f64; 4],
    p: &Prepared,
    sc: &LabFitScenario,
    offset: f64,
) -> (Vec<SatResidual>, f64, f64) {
    let c = &p.run.conditions;
    let lp = lock_params(kind, theta, &sc.loop_fixed, c);
    let end = p.obs.run_end_s;
    let resid = |o: Option<f64>, m: Option<f64>| match (o, m) {
        (Some(o), Some(m)) => Some(m - o),
        (Some(o), None) => Some(end - o),
        (None, Some(m)) => Some(m - end),
        (None, None) => None,
    };
    let rows = p
        .obs
        .sats
        .iter()
        .map(|s| {
            let ev = simulate_sat(c, s.nominal_cn0_dbhz, offset, &lp, end);
            SatResidual {
                run: p.run.label.clone(),
                sha256: p.run.sha256.clone(),
                sat: s.sat.clone(),
                nominal_cn0_dbhz: s.nominal_cn0_dbhz,
                obs_loss_s: s.loss_s,
                pred_loss_s: ev.loss_s,
                loss_residual_s: resid(s.loss_s, ev.loss_s),
                obs_reacq_s: s.reacq_s,
                pred_reacq_s: ev.reacq_s,
                reacq_residual_s: resid(s.reacq_s, ev.reacq_s),
            }
        })
        .collect();
    (rows, lp.drop_cn0_dbhz, lp.relock_cn0_dbhz)
}

/// Sums of squared loss-time and reacquisition-time residuals. Loss times depend only on
/// parameters 0 and 2 (the drop threshold and its dwell); reacquisition times on all four.
fn sse_parts(
    kind: ModelKind,
    theta: &[f64; 4],
    ps: &[&Prepared],
    sc: &LabFitScenario,
    off: f64,
) -> (f64, f64) {
    let (mut l, mut r) = (0.0, 0.0);
    for p in ps {
        let c = &p.run.conditions;
        let lp = lock_params(kind, theta, &sc.loop_fixed, c);
        let end = p.obs.run_end_s;
        let sq = |o: Option<f64>, m: Option<f64>| match (o, m) {
            (Some(o), Some(m)) => (m - o).powi(2),
            (Some(o), None) => (end - o).powi(2),
            (None, Some(m)) => (m - end).powi(2),
            (None, None) => 0.0,
        };
        for s in &p.obs.sats {
            let ev = simulate_sat(c, s.nominal_cn0_dbhz, off, &lp, end);
            l += sq(s.loss_s, ev.loss_s);
            r += sq(s.reacq_s, ev.reacq_s);
        }
    }
    (l, r)
}

fn arr4(x: &[f64]) -> [f64; 4] {
    [x[0], x[1], x[2], x[3]]
}

fn nm_opts(sc: &LabFitScenario) -> NmOptions {
    NmOptions {
        max_evals: sc.fit.max_evals.max(50),
        ftol: 1e-10,
        xtol: 1e-8,
        initial_step: 0.1,
        max_restarts: 3,
    }
}

/// Minimise `f` over the two coordinates `dims` of `base` (others held): from the grid,
/// or from `base` itself when `warm`.
fn fit_pair<F: Fn(&[f64; 4]) -> f64>(
    f: F,
    base: [f64; 4],
    dims: [usize; 2],
    lo: &[f64; 4],
    hi: &[f64; 4],
    sc: &LabFitScenario,
    warm: bool,
) -> [f64; 4] {
    let put = |x: &[f64]| {
        let mut t = base;
        t[dims[0]] = x[0];
        t[dims[1]] = x[1];
        t
    };
    let g = |x: &[f64]| f(&put(x));
    let lo2 = [lo[dims[0]], lo[dims[1]]];
    let hi2 = [hi[dims[0]], hi[dims[1]]];
    let starts: Vec<Vec<f64>> = if warm {
        vec![vec![base[dims[0]], base[dims[1]]]]
    } else {
        let pts = sc.fit.grid_points.max(2) * 2 + 1;
        grid_search(g, &lo2, &hi2, pts)
            .into_iter()
            .take(3)
            .map(|(x, _)| x)
            .collect()
    };
    let opts = nm_opts(sc);
    let mut best: Option<(Vec<f64>, f64)> = None;
    for s in starts {
        let r = nelder_mead_bounded(g, &s, &lo2, &hi2, &opts);
        if best.as_ref().is_none_or(|b| r.f < b.1) {
            best = Some((r.x, r.f));
        }
    }
    best.map_or(base, |b| put(&b.0))
}

/// Fit one lock model to `ps`, from the grid or warm-started at `start`. Staged: the
/// drop pair (parameters 0 and 2) on loss times alone, then the re-lock pair (1 and 3)
/// on everything with the drop pair held, then all four jointly from there. Each stage
/// is a two-parameter problem, which a bounded Nelder-Mead solves reliably where a
/// four-parameter start can stall in the threshold-dwell valley against a bound.
fn fit_lock(
    kind: ModelKind,
    ps: &[&Prepared],
    sc: &LabFitScenario,
    off: f64,
    start: Option<[f64; 4]>,
) -> ([f64; 4], f64) {
    let (lo, hi) = kind.bounds(&sc.bounds);
    let mid = [
        0.5 * (lo[0] + hi[0]),
        0.5 * (lo[1] + hi[1]),
        0.5 * (lo[2] + hi[2]),
        0.5 * (lo[3] + hi[3]),
    ];
    let warm = start.is_some();
    let base = start.unwrap_or(mid);
    let loss_only = |t: &[f64; 4]| sse_parts(kind, t, ps, sc, off).0;
    let total = |t: &[f64; 4]| {
        let (l, r) = sse_parts(kind, t, ps, sc, off);
        l + r
    };
    let a = fit_pair(loss_only, base, [0, 2], &lo, &hi, sc, warm);
    let b = fit_pair(total, a, [1, 3], &lo, &hi, sc, warm);
    let joint = nelder_mead_bounded(|x: &[f64]| total(&arr4(x)), &b, &lo, &hi, &nm_opts(sc));
    let fb = total(&b);
    if joint.f < fb {
        (arr4(&joint.x), joint.f)
    } else {
        (b, fb)
    }
}

fn rms(v: &[f64]) -> Option<f64> {
    (!v.is_empty()).then(|| (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt())
}

fn finite(v: f64) -> Option<f64> {
    v.is_finite().then_some(v)
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

fn estimate(name: &str, value: f64, lo: f64, hi: f64, boot: &[f64]) -> ParamEstimate {
    let tol = 1e-6 * (hi - lo).abs().max(1e-12);
    ParamEstimate {
        name: name.to_string(),
        value,
        lower_bound: lo,
        upper_bound: hi,
        at_bound: (value - lo).abs() <= tol || (hi - value).abs() <= tol,
        bootstrap: boot_stats(boot),
    }
}

/// Settings hash: the scenario without its runs.
fn settings_sha256(sc: &LabFitScenario) -> String {
    let mut s = sc.clone();
    s.runs.clear();
    let json = serde_json::to_string(&s).unwrap_or_default();
    format!("{:x}", Sha256::digest(json.as_bytes()))
}

/// Fit both models to `runs` under the settings of `sc` (its own `runs` list is not
/// read) and predict for `sc.predict`. Errors when no run is usable for the lock fit,
/// naming each run's reason.
pub fn analyse(runs: &[LabRun], sc: &LabFitScenario) -> Result<LabFitReport, String> {
    let prepared: Vec<Prepared> = runs
        .iter()
        .map(|r| Prepared {
            run: r,
            obs: observe(&r.timeline, &r.conditions, &sc.observe),
        })
        .collect();
    let note_of = |p: &Prepared| -> Option<String> {
        if let Some(u) = &p.obs.unusable {
            Some(u.clone())
        } else if p.run.conditions.levels.is_empty() {
            Some("no stated power level: observations only, not used in the lock fit".into())
        } else {
            None
        }
    };
    let elig: Vec<&Prepared> = prepared.iter().filter(|p| note_of(p).is_none()).collect();
    if elig.is_empty() {
        let why: Vec<String> = prepared
            .iter()
            .map(|p| {
                format!(
                    "{} (sha256 {}): {}",
                    p.run.label,
                    p.run.sha256,
                    note_of(p).unwrap_or_default()
                )
            })
            .collect();
        return Err(format!(
            "no run is usable for the lock fit: {}",
            if why.is_empty() {
                "no runs given".to_string()
            } else {
                why.join("; ")
            }
        ));
    }
    let mut notes = vec![
        "MODELLED: fitted parameters describe the open receiver model fitted to observed \
         behaviour, not a commercial receiver's internals."
            .to_string(),
        "Observed event times are epoch midpoints; each carries up to half an epoch \
         interval of quantisation."
            .to_string(),
        "Only the first loss after onset and the first reacquisition after it are \
         modelled per satellite; nominal C/N0 is the pre-onset median, held constant."
            .to_string(),
        "Bootstrap refits are warm-started at the full fit and can understate the spread \
         on a multimodal objective."
            .to_string(),
    ];
    // 1. Offset.
    let [olo, ohi] = sc.bounds.level_offset_db;
    let off_full = fit_offset(&elig, sc);
    let off = off_full.unwrap_or(0.0f64.clamp(olo, ohi));
    // 2. Models.
    let mut full: Vec<(ModelKind, [f64; 4], f64)> = Vec::new();
    for kind in ModelKind::ALL {
        let (th, f) = fit_lock(kind, &elig, sc, off, None);
        full.push((kind, th, f));
    }
    // 3. Bootstrap.
    let m = elig.len();
    let mut boot_off = Vec::new();
    let mut boot_theta: Vec<Vec<(f64, [f64; 4])>> = vec![Vec::new(); full.len()];
    if sc.fit.bootstrap > 0 && m >= 2 {
        let mut rng = ChaCha8Rng::seed_from_u64(sc.fit.seed);
        for _ in 0..sc.fit.bootstrap {
            let idx: Vec<usize> = (0..m).map(|_| rng.gen_range(0..m)).collect();
            let sub: Vec<&Prepared> = idx.iter().map(|&i| elig[i]).collect();
            let o = fit_offset(&sub, sc).unwrap_or(off);
            if off_full.is_some() {
                boot_off.push(o);
            }
            for (k, (kind, th, _)) in full.iter().enumerate() {
                let (bt, _) = fit_lock(*kind, &sub, sc, o, Some(*th));
                boot_theta[k].push((o, bt));
            }
        }
    } else if sc.fit.bootstrap > 0 {
        notes.push("Bootstrap skipped: it needs at least two usable runs.".into());
    }
    // Offset report.
    let all_res: Vec<f64> = elig.iter().flat_map(|p| cn0_residuals(p, off)).collect();
    let level_offset = OffsetFit {
        estimate: estimate("level_offset_db", off, olo, ohi, &boot_off),
        n_samples: all_res.len(),
        rms_db: rms(&all_res),
        note: off_full.is_none().then(|| {
            "no tracked C/N0 inside any event: offset held at 0 dB (not fitted)".to_string()
        }),
    };
    // Condition coordinates of the tested runs.
    let tested: Vec<([f64; 3], String)> = elig
        .iter()
        .filter_map(|p| {
            condition_of(&p.run.conditions).map(|c| (scaled(c, &sc.scales), p.run.label.clone()))
        })
        .collect();
    // 4. Cross-validation folds.
    let folds: Vec<Vec<usize>> = if m < 2 {
        Vec::new()
    } else if sc.fit.folds == 0 || sc.fit.folds >= m {
        (0..m).map(|i| vec![i]).collect()
    } else {
        let mut perm: Vec<usize> = (0..m).collect();
        let mut rng = ChaCha8Rng::seed_from_u64(sc.fit.seed ^ 0x006b_666f_6c64); // "kfold"
        perm.shuffle(&mut rng);
        let k = sc.fit.folds.max(2);
        let mut f = vec![Vec::new(); k];
        for (pos, &i) in perm.iter().enumerate() {
            f[pos % k].push(i);
        }
        for v in &mut f {
            v.sort_unstable();
        }
        f
    };
    if m < 2 {
        notes.push("Cross-validation skipped: it needs at least two usable runs.".into());
    }
    let scheme = if sc.fit.folds == 0 || sc.fit.folds >= m {
        "leave-one-run-out"
    } else {
        "k-fold"
    };
    // Per-fold fits (offset + both models), shared by both model reports.
    struct FoldFit {
        held: Vec<usize>,
        train: Vec<usize>,
        off: f64,
        thetas: Vec<[f64; 4]>,
    }
    let fold_fits: Vec<FoldFit> = folds
        .iter()
        .map(|held| {
            let train: Vec<usize> = (0..m).filter(|i| !held.contains(i)).collect();
            let sub: Vec<&Prepared> = train.iter().map(|&i| elig[i]).collect();
            let o = fit_offset(&sub, sc).unwrap_or(off);
            let thetas = ModelKind::ALL
                .iter()
                .map(|&k| fit_lock(k, &sub, sc, o, None).0)
                .collect();
            FoldFit {
                held: held.clone(),
                train,
                off: o,
                thetas,
            }
        })
        .collect();
    // Assemble model reports.
    let mut models = Vec::new();
    for (k, (kind, th, f)) in full.iter().enumerate() {
        let (lo, hi) = kind.bounds(&sc.bounds);
        let names = kind.param_names();
        let params = (0..4)
            .map(|i| {
                let b: Vec<f64> = boot_theta[k].iter().map(|(_, t)| t[i]).collect();
                estimate(names[i], th[i], lo[i], hi[i], &b)
            })
            .collect();
        let mut residuals = Vec::new();
        let mut per_run = Vec::new();
        for p in &elig {
            let (rows, d, r) = sat_residuals(*kind, th, p, sc, off);
            let rs: Vec<f64> = rows.iter().flat_map(|r| r.residuals()).collect();
            per_run.push(RunFit {
                run: p.run.label.clone(),
                sha256: p.run.sha256.clone(),
                drop_cn0_dbhz: finite(d),
                relock_cn0_dbhz: finite(r),
                n_events: rs.len(),
                rms_s: rms(&rs),
            });
            residuals.extend(rows);
        }
        let all: Vec<f64> = residuals.iter().flat_map(|r| r.residuals()).collect();
        let count = |a: fn(&SatResidual) -> bool| residuals.iter().filter(|r| a(r)).count();
        let cv = (!fold_fits.is_empty()).then(|| {
            let mut holdout = Vec::new();
            let (mut a, mut ip, mut ex) = (Vec::new(), Vec::new(), Vec::new());
            for (fi, ff) in fold_fits.iter().enumerate() {
                let train_pts: Vec<([f64; 3], String)> = ff
                    .train
                    .iter()
                    .filter_map(|&i| {
                        condition_of(&elig[i].run.conditions)
                            .map(|c| (scaled(c, &sc.scales), elig[i].run.label.clone()))
                    })
                    .collect();
                for &h in &ff.held {
                    let p = elig[h];
                    let (rows, _, _) = sat_residuals(*kind, &ff.thetas[k], p, sc, ff.off);
                    let rs: Vec<f64> = rows.iter().flat_map(|r| r.residuals()).collect();
                    let q = condition_of(&p.run.conditions).map(|c| scaled(c, &sc.scales));
                    let (ext, near) = match q.and_then(|q| place(q, &train_pts)) {
                        Some((e, n, _)) => (e, n),
                        None => (f64::INFINITY, String::new()),
                    };
                    let class = if ext <= 1e-9 {
                        ip.extend(&rs);
                        "interpolation"
                    } else {
                        ex.extend(&rs);
                        "extrapolation"
                    };
                    a.extend(&rs);
                    holdout.push(HoldoutRun {
                        run: p.run.label.clone(),
                        sha256: p.run.sha256.clone(),
                        fold: fi,
                        n_events: rs.len(),
                        rms_s: rms(&rs),
                        extrapolation_distance: ext,
                        nearest_training_run: near,
                        class: class.into(),
                    });
                }
            }
            CvReport {
                scheme: scheme.into(),
                folds: fold_fits.len(),
                holdout,
                rms_all_s: rms(&a),
                rms_interpolation_s: rms(&ip),
                rms_extrapolation_s: rms(&ex),
            }
        });
        models.push(ModelFit {
            model: *kind,
            label: "MODELLED".into(),
            params,
            sse_s2: *f,
            n_events: all.len(),
            rms_s: rms(&all),
            loss_missed: count(|r| r.obs_loss_s.is_some() && r.pred_loss_s.is_none()),
            loss_extra: count(|r| r.obs_loss_s.is_none() && r.pred_loss_s.is_some()),
            reacq_missed: count(|r| r.obs_reacq_s.is_some() && r.pred_reacq_s.is_none()),
            reacq_extra: count(|r| r.obs_reacq_s.is_none() && r.pred_reacq_s.is_some()),
            per_run,
            residuals,
            cv,
        });
    }
    // Run summaries.
    let runs_out = prepared
        .iter()
        .map(|p| {
            let used = note_of(p).is_none();
            let losses: Vec<f64> = p
                .obs
                .sats
                .iter()
                .filter_map(|s| s.last_cn0_before_loss_dbhz)
                .collect();
            let reacqs: Vec<f64> = p
                .obs
                .sats
                .iter()
                .filter_map(|s| s.first_cn0_after_reacq_dbhz)
                .collect();
            RunSummary {
                label: p.run.label.clone(),
                sha256: p.run.sha256.clone(),
                source: p.run.source.clone(),
                used_in_fit: used,
                note: note_of(p),
                observation: p.obs.clone(),
                condition: condition_of(&p.run.conditions),
                cn0_residual_rms_db: if used {
                    rms(&cn0_residuals(p, off))
                } else {
                    None
                },
                median_cn0_at_loss_dbhz: median(losses),
                median_cn0_at_reacq_dbhz: median(reacqs),
            }
        })
        .collect();
    // Predictions.
    let nominal_default = median(
        elig.iter()
            .flat_map(|p| p.obs.sats.iter().map(|s| s.nominal_cn0_dbhz))
            .collect(),
    )
    .unwrap_or(45.0);
    let mut predictions = Vec::new();
    for q in &sc.predict {
        let nominal = q.nominal_cn0_dbhz.unwrap_or(nominal_default);
        let cond = condition_of(&q.conditions);
        let placed = cond.and_then(|c| place(scaled(c, &sc.scales), &tested));
        for (k, (kind, th, _)) in full.iter().enumerate() {
            let lp = lock_params(*kind, th, &sc.loop_fixed, &q.conditions);
            let ev = simulate_sat(&q.conditions, nominal, off, &lp, q.run_end_s);
            let boots: Vec<Option<f64>> = boot_theta[k]
                .iter()
                .map(|(o, t)| {
                    let lp = lock_params(*kind, t, &sc.loop_fixed, &q.conditions);
                    simulate_sat(&q.conditions, nominal, *o, &lp, q.run_end_s)
                        .loss_s
                        .map(|l| l - q.conditions.onset_s)
                })
                .collect();
            let hit: Vec<f64> = boots.iter().flatten().copied().collect();
            predictions.push(Prediction {
                label: "PREDICTION".into(),
                query: q.label.clone(),
                model: *kind,
                nominal_cn0_dbhz: nominal,
                drop_cn0_dbhz: finite(lp.drop_cn0_dbhz),
                relock_cn0_dbhz: finite(lp.relock_cn0_dbhz),
                loss_s: ev.loss_s,
                time_to_lose_lock_s: ev.loss_s.map(|l| l - q.conditions.onset_s),
                reacq_s: ev.reacq_s,
                boot_loss_fraction: (!boots.is_empty())
                    .then(|| hit.len() as f64 / boots.len() as f64),
                boot_time_to_lose_lock: boot_stats(&hit),
                condition: cond,
                nearest_tested_run: placed.as_ref().map(|p| p.1.clone()),
                nearest_tested_distance: placed.as_ref().map(|p| p.2),
                extrapolation_distance: placed.as_ref().map(|p| p.0),
                within_tested_range: placed.as_ref().is_some_and(|p| p.0 <= 1e-9),
            });
        }
    }
    Ok(LabFitReport {
        label: "MODELLED".into(),
        kind: "iq-labfit".into(),
        name: sc.name.clone(),
        settings_sha256: settings_sha256(sc),
        runs: runs_out,
        level_offset,
        models,
        predictions,
        notes,
    })
}
