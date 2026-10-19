// SPDX-License-Identifier: AGPL-3.0-only
//! The four kshana-bench tasks: truth and cases, scoring, and the built-in baselines
//! (`bench/SPEC.md` section 3).

use std::collections::BTreeMap;
use std::path::Path;

use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Map, Value};

use super::{
    assign_splits, detection_metrics, err, holdout_seed, BenchError, Labeled, Split, CASES_SCHEMA,
    OPTIMISM_TOL, PREDICTIONS_SCHEMA, SPEC_VERSION, TRUTH_SCHEMA,
};
use crate::impairment_eval::{
    auc, confusion_at, generate_corpus, threshold_for_pfa, AgcDetector, CaseObservables,
    CorpusConfig, EnergyDetector, FusedDetector, ImpairmentClass, ImpairmentDetector,
    ParityDetector, SqmDetector,
};
use crate::receiver_trust::calibration::{find_scenarios, read_folder, Class, Sample, Stat};

/// A score that ranks below every real value: an undefined statistic (JSON has no infinity).
pub const UNDEFINED_SCORE: f64 = -1.0e300;
/// Target false-alarm probability of the task (d) operating point.
pub const D_TARGET_PFA: f64 = 0.05;
/// Cases per class in a task (d) corpus.
pub const D_N_PER_CLASS: usize = 200;
/// SHA-256 of the 300 s IGS clock fixture task (c) is defined on.
// PIN-SCOPE:    the SHA-256 of the one 300 s IGS clock fixture file that task (c) is defined on.
// PIN-EXCLUDES: any other clock file, and the task's scores.
pub const C_CLOCKS_SHA256: &str =
    "3da6d0a5a7facdc1e564fdeed5f5ada890a2f9cdab6a218fa79a83608a3230a4";
/// The prediction horizons of task (c), seconds.
pub const C_HORIZONS_S: [u32; 4] = [300, 900, 3600, 7200];
/// Training window of task (c): 24 h at 300 s.
pub const C_TRAIN_SAMPLES: usize = 288;
const C_STEP_S: f64 = 300.0;
const C_ORIGIN_STRIDE: usize = 144;

fn head(task: &str, split: Split) -> Map<String, Value> {
    let mut m = Map::new();
    m.insert("task".into(), json!(task));
    m.insert("split".into(), json!(split.name()));
    m.insert("spec_version".into(), json!(SPEC_VERSION));
    m
}

fn truth_doc(task: &str, split: Split) -> Map<String, Value> {
    let mut m = head(task, split);
    m.insert("schema".into(), json!(TRUTH_SCHEMA));
    m
}

/// A predictions document of task a, b or d, ready to serialise.
pub fn scores_doc(task: &str, split: &str, name: &str, scores: &BTreeMap<String, f64>) -> Value {
    json!({
        "schema": PREDICTIONS_SCHEMA,
        "task": task,
        "split": split,
        "system": {"name": name, "version": SPEC_VERSION},
        "scores": scores,
    })
}

fn labels_of(truth: &Value) -> Result<Vec<Labeled>, BenchError> {
    let arr = truth
        .get("labels")
        .and_then(Value::as_array)
        .ok_or_else(|| BenchError("truth has no `labels` array".into()))?;
    arr.iter()
        .map(|l| {
            Ok(Labeled {
                id: l
                    .get("id")
                    .and_then(Value::as_str)
                    .ok_or_else(|| BenchError("a label has no `id`".into()))?
                    .to_string(),
                positive: l
                    .get("positive")
                    .and_then(Value::as_bool)
                    .ok_or_else(|| BenchError("a label has no `positive`".into()))?,
            })
        })
        .collect()
}

fn scores_of(preds: &Value) -> Result<BTreeMap<String, f64>, BenchError> {
    let m = preds
        .get("scores")
        .and_then(Value::as_object)
        .ok_or_else(|| BenchError("predictions have no `scores` object".into()))?;
    m.iter()
        .map(|(k, v)| {
            v.as_f64()
                .map(|x| (k.clone(), x))
                .ok_or_else(|| BenchError(format!("score for `{k}` is not a number")))
        })
        .collect()
}

/// Score task (a) or (b): returns `(metrics, label)`.
pub fn score_detection_task(
    truth: &Value,
    preds: &Value,
    declared_threshold: Option<f64>,
) -> Result<(Value, String), BenchError> {
    let task = truth.get("task").and_then(Value::as_str).unwrap_or("a");
    let threshold = declared_threshold.or_else(|| preds.get("threshold").and_then(Value::as_f64));
    let m = detection_metrics(&labels_of(truth)?, &scores_of(preds)?, threshold)?;
    let label = if task == "a" {
        "MODELLED: truth is the scheduled attack slots of the JammerTest 2024 event logs, at one-minute resolution, so a detection probability is a lower bound; a clean epoch means outside the logged windows"
    } else {
        "MODELLED: truth is the stated events of the scene recipe; no interference waveform is involved"
    };
    Ok((m, label.to_string()))
}

// ---------------------------------------------------------------- task (a)

/// The labelled epochs of the JammerTest 2024 folders in a split, with their statistics.
pub struct ATruth {
    /// Scored epochs (clean and jamming; spoofing and meaconing epochs are not scored).
    pub labels: Vec<Labeled>,
    /// The three statistics of every scored epoch, by id.
    pub samples: BTreeMap<String, Sample>,
    /// One entry per evaluable folder in the split: path, clean and jamming epoch counts.
    pub folders: Vec<(String, usize, usize)>,
    /// The 2.0.0 split of each folder in `folders`.
    pub split_of: BTreeMap<String, Split>,
}

/// Read the extracted dataset at `root` and keep the evaluable folders of `split` (`None` keeps
/// all of them, the pooled set of the recorded calibration).
pub fn a_load(root: &Path, split: Option<Split>) -> Result<ATruth, BenchError> {
    let mut dirs = Vec::new();
    find_scenarios(root, &mut dirs);
    if dirs.is_empty() {
        return err(format!("no scenario.json under {}", root.display()));
    }
    let mut t = ATruth {
        labels: Vec::new(),
        samples: BTreeMap::new(),
        folders: Vec::new(),
        split_of: BTreeMap::new(),
    };
    let evaluable: Vec<_> = dirs
        .iter()
        .map(|d| read_folder(root, d))
        .filter(|f| f.excluded.is_none())
        .collect();
    let assignment = assign_splits(
        &evaluable
            .iter()
            .map(|f| (f.path.clone(), f.jamming && f.epochs.jamming > 0))
            .collect::<Vec<_>>(),
    );
    for f in &evaluable {
        if split.is_some_and(|s| assignment[&f.path] != s) {
            continue;
        }
        let (mut nc, mut nj) = (0, 0);
        for (n, s) in f.samples.iter().enumerate() {
            let positive = match s.class {
                Class::Clean => {
                    nc += 1;
                    false
                }
                Class::Jamming => {
                    nj += 1;
                    true
                }
                Class::OtherAttack => continue,
            };
            let id = format!("{}#{n}", f.path);
            t.labels.push(Labeled {
                id: id.clone(),
                positive,
            });
            t.samples.insert(id, *s);
        }
        t.folders.push((f.path.clone(), nc, nj));
        t.split_of.insert(f.path.clone(), assignment[&f.path]);
    }
    Ok(t)
}

/// The truth file of task (a) for `split`.
pub fn a_truth_json(t: &ATruth, split: Split) -> Value {
    let mut m = truth_doc("a", split);
    m.insert(
        "labels".into(),
        Value::Array(
            t.labels
                .iter()
                .map(|l| json!({"id": l.id, "positive": l.positive}))
                .collect(),
        ),
    );
    m.insert(
        "folders".into(),
        Value::Array(
            t.folders
                .iter()
                .map(|(p, c, j)| {
                    json!({"path": p, "split": t.split_of[p].name(), "clean_epochs": c, "jamming_epochs": j})
                })
                .collect(),
        ),
    );
    Value::Object(m)
}

/// The built-in baseline predictions of task (a): one per receiver-trust statistic.
pub fn a_baselines(t: &ATruth, split: &str) -> Vec<(Stat, Value)> {
    Stat::ALL
        .into_iter()
        .map(|s| {
            let scores: BTreeMap<String, f64> = t
                .samples
                .iter()
                .map(|(id, x)| (id.clone(), x.get(s).unwrap_or(UNDEFINED_SCORE)))
                .collect();
            let name = format!(
                "kshana receiver-trust {} (0.35 default monitor statistic)",
                s.config_field()
            );
            (s, scores_doc("a", split, &name, &scores))
        })
        .collect()
}

// ---------------------------------------------------------------- task (d)

/// One generated case of task (d).
pub struct DCase {
    /// Id `<split>/<in|out>/<n>`.
    pub id: String,
    /// The class label, for the truth file.
    pub class: ImpairmentClass,
    /// The observables a detector sees.
    pub obs: CaseObservables,
}

/// The numeric seed of a task (d) split. The holdout needs the secret behind its commitment.
pub fn d_seed(split: Split, secret: Option<&[u8]>) -> Result<u64, BenchError> {
    match split {
        Split::Dev => Ok(1000),
        Split::Test => Ok(2000),
        Split::Holdout => secret.map(|s| holdout_seed("d", s)).ok_or_else(|| {
            BenchError("the holdout is sealed: pass the secret with --seed-file".into())
        }),
    }
}

/// Fisher-Yates with the ChaCha8 stream, so the case order carries no class information and the
/// permutation does not depend on a library's shuffle algorithm.
fn permute<T>(v: &mut [T], rng: &mut ChaCha8Rng) {
    for i in (1..v.len()).rev() {
        let j = (rng.next_u64() % (i as u64 + 1)) as usize;
        v.swap(i, j);
    }
}

/// The in-distribution and out-of-distribution corpora of a task (d) split. Same seed and cases
/// per class in both; the out corpus scales every impairment severity by `scale`.
pub fn d_corpora(seed: u64, scale: f64, split: Split) -> (Vec<DCase>, Vec<DCase>) {
    let make = |sev: f64, tag: &str, salt: u64| -> Vec<DCase> {
        let cfg = CorpusConfig {
            n_per_class: D_N_PER_CLASS,
            severity_scale: sev,
            ..CorpusConfig::default()
        };
        let mut cases: Vec<_> = generate_corpus(&cfg, seed).into_iter().collect();
        let mut rng = ChaCha8Rng::seed_from_u64(seed ^ salt);
        permute(&mut cases, &mut rng);
        cases
            .into_iter()
            .enumerate()
            .map(|(n, c)| DCase {
                id: format!("{}/{tag}/{n}", split.name()),
                class: c.class,
                obs: c.obs,
            })
            .collect()
    };
    // PIN-SCOPE:    not a pin: two fixed RNG seeds that make the in-distribution and shifted task (d)
    //               corpora reproducible.
    // PIN-EXCLUDES: n/a (nothing is compared against these values).
    (
        make(1.0, "in", 0x1111_1111_1111_1111),
        make(scale, "out", 0x2222_2222_2222_2222),
    )
}

/// The cases file and the truth file of a task (d) split.
pub fn d_files(
    split: Split,
    scale: f64,
    secret: Option<&[u8]>,
) -> Result<(Value, Value), BenchError> {
    if !(scale > 0.0 && scale <= 1.0) {
        return err("--scale must be in (0, 1]");
    }
    let seed = d_seed(split, secret)?;
    let (cin, cout) = d_corpora(seed, scale, split);
    let all: Vec<&DCase> = cin.iter().chain(cout.iter()).collect();
    let cases: Vec<Value> = all
        .iter()
        .map(|c| {
            json!({"id": c.id, "observables": {
                "js_db": c.obs.js_db,
                "cn0_drop_db": c.obs.cn0_drop_db,
                "agc_excess_db": c.obs.agc_excess_db,
                "sqm_el_metric": c.obs.sqm_el_metric,
                "parity_stat": c.obs.parity_stat,
            }})
        })
        .collect();
    let labels: Vec<Value> = all
        .iter()
        .map(|c| json!({"id": c.id, "positive": c.class.is_impaired(), "class": c.class.label()}))
        .collect();
    let mut cm = head("d", split);
    cm.insert("schema".into(), json!(CASES_SCHEMA));
    cm.insert("ood_severity_scale".into(), json!(scale));
    cm.insert("cases".into(), Value::Array(cases));
    let mut tm = truth_doc("d", split);
    tm.insert("ood_severity_scale".into(), json!(scale));
    tm.insert("labels".into(), Value::Array(labels));
    if let (Split::Holdout, Some(s)) = (split, secret) {
        tm.insert("holdout_commitment".into(), json!(super::seal("d", s)));
    }
    Ok((Value::Object(cm), Value::Object(tm)))
}

/// Score task (d): AUC on the in-distribution and the out-of-distribution cases and their gap.
pub fn score_d(truth: &Value, preds: &Value) -> Result<(Value, String), BenchError> {
    let labels = labels_of(truth)?;
    let scores = scores_of(preds)?;
    let (lin, lout): (Vec<Labeled>, Vec<Labeled>) =
        labels.into_iter().partition(|l| l.id.contains("/in/"));
    if lin.is_empty() || lout.is_empty() {
        return err("task (d) truth needs both `/in/` and `/out/` cases");
    }
    let (sin, sout): (BTreeMap<_, _>, BTreeMap<_, _>) =
        scores.into_iter().partition(|(k, _)| k.contains("/in/"));
    let eval = |l: &[Labeled], s: &BTreeMap<String, f64>| -> Result<(f64, Value), BenchError> {
        let lab = super::pair(l, s)?;
        let pos: Vec<f64> = lab.iter().filter(|x| x.0).map(|x| x.1).collect();
        let neg: Vec<f64> = lab.iter().filter(|x| !x.0).map(|x| x.1).collect();
        if pos.is_empty() || neg.is_empty() {
            return err("each corpus needs positive and negative cases");
        }
        let thr = threshold_for_pfa(&neg, D_TARGET_PFA);
        let c = confusion_at(&lab, thr);
        Ok((
            auc(&pos, &neg),
            json!({"target_pfa": D_TARGET_PFA, "pfa": c.pfa(), "pd": c.pd(), "n": lab.len()}),
        ))
    };
    let (a_in, op_in) = eval(&lin, &sin)?;
    let (a_out, op_out) = eval(&lout, &sout)?;
    let gap = a_in - a_out;
    let metrics = json!({
        "auc_in": a_in,
        "auc_out": a_out,
        "optimism_gap": gap,
        "optimism_tol": OPTIMISM_TOL,
        "optimistic": gap > OPTIMISM_TOL,
        "ood_severity_scale": truth.get("ood_severity_scale").cloned().unwrap_or(Value::Null),
        "operating_in": op_in,
        "operating_out": op_out,
    });
    Ok((
        metrics,
        "MODELLED: labels are generative-model labels of a synthetic parameter-grounded corpus (never field or IQ data); an AUC here is an AUC over model-derived labels".into(),
    ))
}

/// The five built-in detectors of task (d), `impairment_eval`'s transparent baselines.
pub fn d_detectors() -> Vec<Box<dyn ImpairmentDetector>> {
    vec![
        Box::new(EnergyDetector),
        Box::new(AgcDetector),
        Box::new(SqmDetector),
        Box::new(ParityDetector),
        Box::new(FusedDetector),
    ]
}

/// The baseline predictions of task (d) for one detector over both corpora.
pub fn d_baseline_scores(
    det: &dyn ImpairmentDetector,
    cin: &[DCase],
    cout: &[DCase],
) -> BTreeMap<String, f64> {
    cin.iter()
        .chain(cout.iter())
        .map(|c| (c.id.clone(), det.score(&c.obs)))
        .collect()
}

// ---------------------------------------------------------------- task (c)

/// The satellites of a task (c) split.
pub fn c_sats(split: Split) -> &'static [&'static str] {
    match split {
        Split::Dev => &["G03", "G06", "G08", "G09"],
        Split::Test => &["G10", "G24", "G25", "G26"],
        Split::Holdout => &["G27", "G30", "G32"],
    }
}

/// One (satellite, origin) case of task (c).
pub struct CCase {
    /// Id `<sat>@<origin seconds>`.
    pub id: String,
    /// The origin time, seconds since the first record.
    pub origin_s: f64,
    /// The 288 phase samples up to and including the origin, ns.
    pub train_ns: Vec<f64>,
    /// The measured phase change since the origin at each horizon, ns.
    pub truth_ns: Vec<f64>,
}

/// Parse the 300 s clock fixture (`@<PRN> ...` header lines, then `k increment` lines in units of
/// 1e-13 s) into per-satellite maps from epoch index to phase in tenths of a picosecond.
fn parse_clocks(text: &str) -> Result<BTreeMap<String, BTreeMap<i64, i64>>, BenchError> {
    let mut out: BTreeMap<String, BTreeMap<i64, i64>> = BTreeMap::new();
    let mut cur: Option<String> = None;
    let mut acc = 0i64;
    for line in text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
    {
        if let Some(h) = line.strip_prefix('@') {
            let prn = h.split_whitespace().next().unwrap_or("").to_string();
            out.entry(prn.clone()).or_default();
            cur = Some(prn);
            acc = 0;
            continue;
        }
        let mut f = line.split_whitespace();
        let (Some(k), Some(d)) = (f.next(), f.next()) else {
            return err(format!("malformed clock line `{line}`"));
        };
        let (k, d): (i64, i64) = match (k.parse(), d.parse()) {
            (Ok(k), Ok(d)) => (k, d),
            _ => return err(format!("malformed clock line `{line}`")),
        };
        acc += d;
        match &cur {
            Some(p) => {
                out.get_mut(p).map(|m| m.insert(k, acc));
            }
            None => return err("a clock line comes before any `@<PRN>` header"),
        }
    }
    Ok(out)
}

/// Phase in ns from the accumulated increments (units of 1e-13 s).
fn ns(v: i64) -> f64 {
    v as f64 / 10_000.0
}

/// The cases of task (c) for `split` from the clock fixture text, checked against its pinned hash.
pub fn c_load(clocks_text: &str, split: Split) -> Result<Vec<CCase>, BenchError> {
    let got = super::sha256_hex(clocks_text.as_bytes());
    if got != C_CLOCKS_SHA256 {
        return err(format!(
            "the clock file does not match the pinned SHA-256 (got {got}, want {C_CLOCKS_SHA256})"
        ));
    }
    let sats = parse_clocks(clocks_text)?;
    let max_h = (*C_HORIZONS_S.last().unwrap_or(&0) as f64 / C_STEP_S) as i64;
    let mut cases = Vec::new();
    for prn in c_sats(split) {
        let Some(ph) = sats.get(*prn) else {
            return err(format!("satellite {prn} is not in the clock file"));
        };
        let last = ph.keys().next_back().copied().unwrap_or(-1);
        let mut o = C_TRAIN_SAMPLES as i64;
        while o + max_h <= last {
            let train: Option<Vec<f64>> = (o - C_TRAIN_SAMPLES as i64 + 1..=o)
                .map(|k| ph.get(&k).map(|v| ns(*v)))
                .collect();
            let truth: Option<Vec<f64>> = C_HORIZONS_S
                .iter()
                .map(|h| {
                    let k = o + (*h as f64 / C_STEP_S) as i64;
                    Some(ns(*ph.get(&k)?) - ns(*ph.get(&o)?))
                })
                .collect();
            if let (Some(train_ns), Some(truth_ns)) = (train, truth) {
                cases.push(CCase {
                    id: format!("{prn}@{}", o as f64 * C_STEP_S),
                    origin_s: o as f64 * C_STEP_S,
                    train_ns,
                    truth_ns,
                });
            }
            o += C_ORIGIN_STRIDE as i64;
        }
    }
    Ok(cases)
}

/// The cases file and truth file of task (c).
pub fn c_files(cases: &[CCase], split: Split) -> (Value, Value) {
    let mut cm = head("c", split);
    cm.insert("schema".into(), json!(CASES_SCHEMA));
    cm.insert("horizons_s".into(), json!(C_HORIZONS_S));
    cm.insert("step_s".into(), json!(C_STEP_S));
    cm.insert("clocks_sha256".into(), json!(C_CLOCKS_SHA256));
    cm.insert(
        "cases".into(),
        Value::Array(
            cases
                .iter()
                .map(|c| json!({"id": c.id, "origin_s": c.origin_s, "train_phase_ns": c.train_ns}))
                .collect(),
        ),
    );
    let mut tm = truth_doc("c", split);
    tm.insert("horizons_s".into(), json!(C_HORIZONS_S));
    tm.insert(
        "truth".into(),
        Value::Array(
            cases
                .iter()
                .map(|c| json!({"id": c.id, "truth_ns": c.truth_ns}))
                .collect(),
        ),
    );
    (Value::Object(cm), Value::Object(tm))
}

/// Least-squares polynomial of `degree` (1 or 2) through `y` at `x`, by the normal equations with
/// partial pivoting; returns the coefficients, lowest order first.
#[allow(clippy::needless_range_loop)]
fn polyfit(x: &[f64], y: &[f64], degree: usize) -> Option<Vec<f64>> {
    let n = degree + 1;
    let mut a = vec![vec![0.0f64; n + 1]; n];
    for (xi, yi) in x.iter().zip(y) {
        let pw: Vec<f64> = (0..2 * n - 1)
            .scan(1.0, |p, _| {
                let v = *p;
                *p *= xi;
                Some(v)
            })
            .collect();
        for r in 0..n {
            for c in 0..n {
                a[r][c] += pw[r + c];
            }
            a[r][n] += pw[r] * yi;
        }
    }
    for col in 0..n {
        let piv = (col..n).max_by(|&i, &j| a[i][col].abs().total_cmp(&a[j][col].abs()))?;
        if a[piv][col].abs() < 1e-12 {
            return None;
        }
        a.swap(col, piv);
        for r in col + 1..n {
            let f = a[r][col] / a[col][col];
            for c in col..=n {
                a[r][c] -= f * a[col][c];
            }
        }
    }
    let mut coef = vec![0.0; n];
    for r in (0..n).rev() {
        let mut s = a[r][n];
        for c in r + 1..n {
            s -= a[r][c] * coef[c];
        }
        coef[r] = s / a[r][r];
    }
    Some(coef)
}

/// The three built-in baselines of task (c): `hold`, `linear`, `quadratic`.
pub const C_BASELINES: [&str; 3] = ["hold", "linear", "quadratic"];

/// One baseline's predicted phase change since the origin at each horizon, ns.
pub fn c_predict(baseline: &str, train_ns: &[f64]) -> Vec<f64> {
    let zero = vec![0.0; C_HORIZONS_S.len()];
    let degree = match baseline {
        "linear" => 1,
        "quadratic" => 2,
        _ => return zero,
    };
    let n = train_ns.len();
    // Time in hours relative to the origin, so the normal equations stay well conditioned.
    let x: Vec<f64> = (0..n)
        .map(|i| (i as f64 - (n as f64 - 1.0)) * C_STEP_S / 3600.0)
        .collect();
    let Some(c) = polyfit(&x, train_ns, degree) else {
        return zero;
    };
    let p = |t: f64| c.iter().rev().fold(0.0, |acc, k| acc * t + k);
    let p0 = p(0.0);
    C_HORIZONS_S
        .iter()
        .map(|h| p(*h as f64 / 3600.0) - p0)
        .collect()
}

/// The predictions document of a task (c) baseline.
pub fn c_baseline_doc(baseline: &str, cases: &[CCase], split: &str) -> Value {
    let preds: BTreeMap<String, Vec<f64>> = cases
        .iter()
        .map(|c| (c.id.clone(), c_predict(baseline, &c.train_ns)))
        .collect();
    json!({
        "schema": PREDICTIONS_SCHEMA,
        "task": "c",
        "split": split,
        "system": {"name": format!("kshana-bench baseline: {baseline}"), "version": SPEC_VERSION},
        "predictions": preds,
    })
}

/// Score task (c): RMSE, mean absolute error and bias per horizon, in ns.
pub fn score_c(truth: &Value, preds: &Value) -> Result<(Value, String), BenchError> {
    let horizons: Vec<u32> = truth
        .get("horizons_s")
        .and_then(Value::as_array)
        .map(|a| {
            a.iter()
                .filter_map(|v| v.as_u64().map(|x| x as u32))
                .collect()
        })
        .unwrap_or_default();
    if horizons.is_empty() {
        return err("task (c) truth has no `horizons_s`");
    }
    let tarr = truth
        .get("truth")
        .and_then(Value::as_array)
        .ok_or_else(|| BenchError("task (c) truth has no `truth` array".into()))?;
    let pmap = preds
        .get("predictions")
        .and_then(Value::as_object)
        .ok_or_else(|| BenchError("task (c) predictions have no `predictions` object".into()))?;
    if pmap.len() != tarr.len() {
        return err(format!(
            "predictions cover {} cases, the truth has {}",
            pmap.len(),
            tarr.len()
        ));
    }
    let mut sq = vec![0.0f64; horizons.len()];
    let mut ab = vec![0.0f64; horizons.len()];
    let mut bias = vec![0.0f64; horizons.len()];
    for t in tarr {
        let id = t
            .get("id")
            .and_then(Value::as_str)
            .ok_or_else(|| BenchError("a truth entry has no `id`".into()))?;
        let tv = nums(t.get("truth_ns"), horizons.len(), id)?;
        let pv = nums(pmap.get(id), horizons.len(), id)?;
        for h in 0..horizons.len() {
            let e = pv[h] - tv[h];
            sq[h] += e * e;
            ab[h] += e.abs();
            bias[h] += e;
        }
    }
    let n = tarr.len() as f64;
    if tarr.is_empty() {
        return err("task (c) truth has no cases");
    }
    let per: Vec<Value> = horizons
        .iter()
        .enumerate()
        .map(|(i, h)| {
            json!({"horizon_s": h, "rmse_ns": (sq[i] / n).sqrt(), "mae_ns": ab[i] / n, "bias_ns": bias[i] / n})
        })
        .collect();
    let primary = horizons
        .iter()
        .position(|h| *h == 3600)
        .map(|i| (sq[i] / n).sqrt());
    Ok((
        json!({"n_cases": tarr.len(), "per_horizon": per, "primary_rmse_3600_ns": primary}),
        "MODELLED: truth is the measured IGS final 30 s clock (decimated to 300 s) of the satellites in the split; the IGS files do not state the clock type".into(),
    ))
}

fn nums(v: Option<&Value>, n: usize, id: &str) -> Result<Vec<f64>, BenchError> {
    let a = v
        .and_then(Value::as_array)
        .ok_or_else(|| BenchError(format!("case `{id}` has no number array")))?;
    if a.len() != n {
        return err(format!("case `{id}` needs {n} values, has {}", a.len()));
    }
    a.iter()
        .map(|x| {
            x.as_f64()
                .filter(|f| f.is_finite())
                .ok_or_else(|| BenchError(format!("case `{id}` has a non-finite value")))
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn labels_doc(l: &[(&str, bool)]) -> Value {
        json!({"labels": l.iter().map(|(i, p)| json!({"id": i, "positive": p})).collect::<Vec<_>>()})
    }

    #[test]
    fn chance_scores_sit_near_one_half_and_a_perfect_scorer_gives_one() {
        let mut rng = ChaCha8Rng::seed_from_u64(7);
        let mut truth = Vec::new();
        let mut chance = BTreeMap::new();
        let mut perfect = BTreeMap::new();
        for i in 0..4000 {
            let pos = i < 2000;
            let id = format!("c{i}");
            truth.push(Labeled {
                id: id.clone(),
                positive: pos,
            });
            chance.insert(
                id.clone(),
                (rng.next_u64() >> 11) as f64 / (1u64 << 53) as f64,
            );
            perfect.insert(id, if pos { 1.0 } else { 0.0 });
        }
        let a = detection_metrics(&truth, &chance, None).unwrap()["auc"]
            .as_f64()
            .unwrap();
        assert!((0.45..=0.55).contains(&a), "chance AUC {a}");
        let p = detection_metrics(&truth, &perfect, Some(0.5)).unwrap();
        assert_eq!(p["auc"].as_f64().unwrap(), 1.0);
        assert_eq!(p["pd_at_declared"].as_f64().unwrap(), 1.0);
        assert_eq!(p["pfa_at_declared"].as_f64().unwrap(), 0.0);
    }

    #[test]
    fn detection_task_reads_files_and_rejects_a_missing_case() {
        let truth = labels_doc(&[("a", true), ("b", false), ("c", true), ("d", false)]);
        let p = scores_doc(
            "a",
            "dev",
            "x",
            &[("a", 0.9), ("b", 0.1), ("c", 0.8)]
                .iter()
                .map(|(k, v)| (k.to_string(), *v))
                .collect(),
        );
        assert!(score_detection_task(&truth, &p, None)
            .unwrap_err()
            .0
            .contains("no score"));
    }

    #[test]
    fn d_corpora_are_deterministic_permuted_and_match_impairment_eval() {
        let (a_in, a_out) = d_corpora(2000, 0.5, Split::Test);
        let (b_in, _) = d_corpora(2000, 0.5, Split::Test);
        assert_eq!(a_in.len(), 5 * D_N_PER_CLASS);
        assert!(a_in
            .iter()
            .zip(&b_in)
            .all(|(x, y)| x.id == y.id && x.obs.js_db == y.obs.js_db));
        // The order carries no class block structure: the first 200 are not all one class.
        let first: std::collections::BTreeSet<_> = a_in[..D_N_PER_CLASS]
            .iter()
            .map(|c| c.class.label())
            .collect();
        assert!(first.len() > 1);
        // S5: bench AUC equals impairment_eval::evaluate for the same corpus.
        let (_, truth) = d_files(Split::Test, 0.5, None).unwrap();
        let _ = a_out;
        let (cin, cout) = d_corpora(2000, 0.5, Split::Test);
        for det in d_detectors() {
            let scores = d_baseline_scores(det.as_ref(), &cin, &cout);
            let preds = json!({"scores": scores});
            let (m, _) = score_d(&truth, &preds).unwrap();
            let cfg = CorpusConfig {
                n_per_class: D_N_PER_CLASS,
                ..CorpusConfig::default()
            };
            let labeled = generate_corpus(&cfg, 2000);
            let rep = crate::impairment_eval::evaluate(det.as_ref(), &labeled, D_TARGET_PFA);
            let got = m["auc_in"].as_f64().unwrap();
            assert!(
                (got - rep.auc).abs() < 1e-12,
                "{}: {got} vs {}",
                det.name(),
                rep.auc
            );
        }
    }

    #[test]
    fn d_perfect_scores_have_zero_gap_and_the_holdout_needs_its_secret() {
        let (_, truth) = d_files(Split::Dev, 0.5, None).unwrap();
        let scores: BTreeMap<String, f64> = truth["labels"]
            .as_array()
            .unwrap()
            .iter()
            .map(|l| {
                (
                    l["id"].as_str().unwrap().to_string(),
                    if l["positive"].as_bool().unwrap() {
                        1.0
                    } else {
                        0.0
                    },
                )
            })
            .collect();
        let (m, _) = score_d(&truth, &json!({"scores": scores})).unwrap();
        assert_eq!(m["optimism_gap"].as_f64().unwrap(), 0.0);
        assert_eq!(m["optimistic"], false);
        assert!(d_files(Split::Holdout, 0.5, None).is_err());
        let a = d_files(Split::Holdout, 0.5, Some(b"s")).unwrap().1;
        let b = d_files(Split::Holdout, 0.5, Some(b"t")).unwrap().1;
        assert_ne!(a, b);
    }

    #[test]
    fn polyfit_recovers_a_quadratic_and_baselines_extrapolate_it() {
        let x: Vec<f64> = (0..50).map(|i| f64::from(i) * 0.1).collect();
        let y: Vec<f64> = x.iter().map(|t| 2.0 + 3.0 * t + 0.5 * t * t).collect();
        let c = polyfit(&x, &y, 2).unwrap();
        assert!(
            (c[0] - 2.0).abs() < 1e-8 && (c[1] - 3.0).abs() < 1e-8 && (c[2] - 0.5).abs() < 1e-8
        );
        // A pure line of slope 1 ns per hour: linear predicts +1 ns at 3600 s.
        let n = C_TRAIN_SAMPLES;
        let line: Vec<f64> = (0..n)
            .map(|i| (i as f64 - (n as f64 - 1.0)) * C_STEP_S / 3600.0)
            .collect();
        let p = c_predict("linear", &line);
        assert!((p[2] - 1.0).abs() < 1e-6 && (p[3] - 2.0).abs() < 1e-6);
        assert!(c_predict("hold", &line).iter().all(|v| *v == 0.0));
    }

    #[test]
    fn c_scoring_is_exact_on_a_hand_checked_case() {
        let truth = json!({"horizons_s": [300, 3600], "truth": [{"id": "x", "truth_ns": [1.0, 2.0]}, {"id": "y", "truth_ns": [0.0, 0.0]}]});
        let preds = json!({"predictions": {"x": [2.0, 2.0], "y": [0.0, 2.0]}});
        let (m, _) = score_c(&truth, &preds).unwrap();
        let h = &m["per_horizon"];
        assert!((h[0]["rmse_ns"].as_f64().unwrap() - (0.5f64).sqrt()).abs() < 1e-12);
        assert!((h[1]["rmse_ns"].as_f64().unwrap() - (2.0f64).sqrt()).abs() < 1e-12);
        assert!((m["primary_rmse_3600_ns"].as_f64().unwrap() - (2.0f64).sqrt()).abs() < 1e-12);
        assert!((h[1]["bias_ns"].as_f64().unwrap() - 1.0).abs() < 1e-12);
    }

    #[test]
    fn the_clock_fixture_gives_26_origins_per_complete_satellite() {
        let text = include_str!("../../tests/fixtures/clock_state_igs_holdout_oracle/clocks.txt");
        let cases = c_load(text, Split::Test).unwrap();
        assert_eq!(cases.len(), 4 * 26);
        assert!(cases
            .iter()
            .all(|c| c.train_ns.len() == C_TRAIN_SAMPLES && c.truth_ns.len() == 4));
        assert!(c_load("x", Split::Test).is_err());
    }
}
