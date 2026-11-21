// SPDX-License-Identifier: AGPL-3.0-only
//! Task (f) of kshana-bench (spec 2.2.0): anomaly detection on spacecraft housekeeping telemetry,
//! defined on OPS-SAT-AD (Zenodo 10.5281/zenodo.15108715), pre-registered in
//! `xval/bench-f/PREREGISTRATION.md`.
//!
//! The unit is one telemetry segment of the dataset's `dataset.csv`; the splits are the publisher's
//! own (`train = 1` is dev, `train = 0` is test); the truth is the publisher's `anomaly` label. The
//! dataset is fetched by `scripts/fetch_opssat_ad.sh` and never committed. The two baselines are
//! transparent robust z-scores over the dataset's own feature columns. Every score is MODELLED: it
//! describes this dataset and its labels, never a spacecraft or a product.

use std::collections::BTreeMap;

use serde_json::{json, Map, Value};

use super::tasks::{labels_of, scores_of};
use super::{detection_metrics, err, BenchError, Labeled, Split, CASES_SCHEMA, TRUTH_SCHEMA};
use crate::portable_math::PortableFloat;

/// The spec version tasks (f) and (g) are scored under (a minor version: tasks added).
pub const SPEC_VERSION_FG: &str = "kshana-bench/2.2.0";

/// SHA-256 of the `dataset.csv` the task is defined on (fetched 20 November 2026).
// PIN-SCOPE:    the SHA-256 of OPS-SAT-AD dataset.csv (Zenodo 10.5281/zenodo.15108715), the one file task (f) reads.
// PIN-EXCLUDES: segments.csv and every other file of the record, and every score.
pub const F_DATASET_SHA256: &str =
    "b524177da6f516d5c9f63c7acbc385341f0ad42046ef20c1bed2d25e51b98f02";

/// The 18 numeric feature columns of `dataset.csv`, in the file's order.
pub const F_FEATURES: [&str; 18] = [
    "duration",
    "len",
    "mean",
    "var",
    "std",
    "kurtosis",
    "skew",
    "n_peaks",
    "smooth10_n_peaks",
    "smooth20_n_peaks",
    "diff_peaks",
    "diff2_peaks",
    "diff_var",
    "diff2_var",
    "gaps_squared",
    "len_weighted",
    "var_div_duration",
    "var_div_len",
];

/// The task (f) baselines (`PREREGISTRATION.md`).
pub const F_BASELINES: [&str; 2] = ["feature-z-max", "diff2-var-z"];

/// A channel needs this many dev nominal segments to be its own reference set.
const MIN_CHANNEL_REF: usize = 10;

/// One telemetry segment.
#[derive(Clone, Debug, PartialEq)]
pub struct Segment {
    /// Case id, `seg-<segment>`.
    pub id: String,
    /// True when the publisher labelled it anomalous.
    pub anomaly: bool,
    /// The publisher's split: dev (`train = 1`) or test (`train = 0`).
    pub split: Split,
    /// Telemetry channel name.
    pub channel: String,
    /// Sampling period as written in the file.
    pub sampling: String,
    /// The [`F_FEATURES`] values.
    pub features: Vec<f64>,
}

/// Parse `dataset.csv` (comma separated, header row). Columns are found by name.
pub fn f_load(text: &str) -> Result<Vec<Segment>, BenchError> {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let header: Vec<&str> = lines
        .next()
        .ok_or_else(|| BenchError(crate::t!("bench-data-no-header", file = "dataset.csv")))?
        .split(',')
        .map(str::trim)
        .collect();
    let col = |name: &str| {
        header.iter().position(|h| *h == name).ok_or_else(|| {
            BenchError(crate::t!(
                "bench-data-no-column",
                file = "dataset.csv",
                column = name
            ))
        })
    };
    let (i_seg, i_anom, i_train, i_chan, i_samp) = (
        col("segment")?,
        col("anomaly")?,
        col("train")?,
        col("channel")?,
        col("sampling")?,
    );
    let i_feat: Vec<usize> = F_FEATURES
        .iter()
        .map(|f| col(f))
        .collect::<Result<_, _>>()?;
    let mut out = Vec::new();
    for (n, line) in lines.enumerate() {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        let get = |i: usize| f.get(i).copied().unwrap_or("");
        let bad = |c: &str| {
            BenchError(crate::t!(
                "bench-data-bad-value",
                file = "dataset.csv",
                line = n + 2,
                column = c
            ))
        };
        let flag = |i: usize, c: &str| match get(i) {
            "0" => Ok(false),
            "1" => Ok(true),
            _ => Err(bad(c)),
        };
        let features = i_feat
            .iter()
            .zip(F_FEATURES)
            .map(|(i, c)| {
                get(*i)
                    .parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| bad(c))
            })
            .collect::<Result<Vec<f64>, _>>()?;
        out.push(Segment {
            id: format!("seg-{}", get(i_seg)),
            anomaly: flag(i_anom, "anomaly")?,
            split: if flag(i_train, "train")? {
                Split::Dev
            } else {
                Split::Test
            },
            channel: get(i_chan).to_string(),
            sampling: get(i_samp).to_string(),
            features,
        });
    }
    if out.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = "dataset.csv"));
    }
    Ok(out)
}

/// Refuse the holdout split: task (f) uses the publisher's public split and has none.
pub fn f_split(split: Split) -> Result<Split, BenchError> {
    if split == Split::Holdout {
        return err(crate::t!("bench-task-has-no-holdout", task = "f"));
    }
    Ok(split)
}

fn head(schema: &str, split: Split) -> Map<String, Value> {
    let mut m = Map::new();
    m.insert("schema".into(), json!(schema));
    m.insert("task".into(), json!("f"));
    m.insert("split".into(), json!(split.name()));
    m.insert("spec_version".into(), json!(SPEC_VERSION_FG));
    m.insert("dataset_sha256".into(), json!(F_DATASET_SHA256));
    m
}

/// The cases file (features, no label) and the truth file of one split.
pub fn f_files(segments: &[Segment], split: Split) -> Result<(Value, Value), BenchError> {
    let split = f_split(split)?;
    let mine: Vec<&Segment> = segments.iter().filter(|s| s.split == split).collect();
    let mut cases = head(CASES_SCHEMA, split);
    cases.insert("features".into(), json!(F_FEATURES));
    cases.insert(
        "cases".into(),
        Value::Array(
            mine.iter()
                .map(|s| {
                    json!({"id": s.id, "channel": s.channel, "sampling": s.sampling, "features": s.features})
                })
                .collect(),
        ),
    );
    let mut truth = head(TRUTH_SCHEMA, split);
    truth.insert(
        "labels".into(),
        Value::Array(
            mine.iter()
                .map(|s| json!({"id": s.id, "positive": s.anomaly, "channel": s.channel}))
                .collect(),
        ),
    );
    Ok((Value::Object(cases), Value::Object(truth)))
}

/// Median of a non-empty slice (the mean of the two middle values for an even length).
fn median(v: &[f64]) -> f64 {
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    let n = s.len();
    if n % 2 == 1 {
        s[n / 2]
    } else {
        0.5 * (s[n / 2 - 1] + s[n / 2])
    }
}

/// `(median, 1.4826 * MAD)` of a non-empty slice.
fn robust(v: &[f64]) -> (f64, f64) {
    let m = median(v);
    let dev: Vec<f64> = v.iter().map(|x| (x - m).abs()).collect();
    (m, 1.4826 * median(&dev))
}

fn log_diff2_var(s: &Segment) -> f64 {
    (s.features[13] + 1e-30).plog10()
}

/// The score of one baseline for every segment of `split`, from reference sets drawn from the dev
/// nominal segments (`PREREGISTRATION.md`).
pub fn f_baseline_scores(
    baseline: &str,
    segments: &[Segment],
    split: Split,
) -> Result<BTreeMap<String, f64>, BenchError> {
    let split = f_split(split)?;
    if !F_BASELINES.contains(&baseline) {
        return err(crate::t!("bench-unknown-baseline", name = baseline));
    }
    let dev_nom: Vec<&Segment> = segments
        .iter()
        .filter(|s| s.split == Split::Dev && !s.anomaly)
        .collect();
    if dev_nom.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = "dataset.csv"));
    }
    // One set of (median, scale) per channel, computed once.
    let mut refs: BTreeMap<&str, Vec<(f64, f64)>> = BTreeMap::new();
    let mut out = BTreeMap::new();
    for s in segments.iter().filter(|s| s.split == split) {
        let r = refs.entry(s.channel.as_str()).or_insert_with(|| {
            let own: Vec<&Segment> = dev_nom
                .iter()
                .copied()
                .filter(|x| x.channel == s.channel)
                .collect();
            let set = if own.len() < MIN_CHANNEL_REF {
                dev_nom.clone()
            } else {
                own
            };
            let mut cols: Vec<(f64, f64)> = (0..F_FEATURES.len())
                .map(|k| robust(&set.iter().map(|x| x.features[k]).collect::<Vec<_>>()))
                .collect();
            cols.push(robust(
                &set.iter().map(|x| log_diff2_var(x)).collect::<Vec<_>>(),
            ));
            cols
        });
        let z = |x: f64, (m, sc): (f64, f64)| {
            if sc > 0.0 {
                Some(((x - m) / sc).abs())
            } else {
                None
            }
        };
        let score = if baseline == "feature-z-max" {
            s.features
                .iter()
                .zip(r.iter())
                .filter_map(|(x, ms)| z(*x, *ms))
                .fold(0.0, f64::max)
        } else {
            z(log_diff2_var(s), r[F_FEATURES.len()]).unwrap_or(0.0)
        };
        out.insert(s.id.clone(), score);
    }
    Ok(out)
}

/// Average precision: the mean, over the positives, of the precision at each positive's score,
/// with tied scores taken as one step (alarm when `score >= threshold`).
pub fn average_precision(labeled: &[(bool, f64)]) -> f64 {
    let mut s: Vec<(bool, f64)> = labeled.to_vec();
    s.sort_by(|a, b| b.1.total_cmp(&a.1));
    let npos = s.iter().filter(|x| x.0).count();
    if npos == 0 {
        return f64::NAN;
    }
    let (mut tp, mut fp, mut ap) = (0usize, 0usize, 0.0f64);
    let mut i = 0;
    while i < s.len() {
        let mut j = i;
        while j < s.len() && s[j].1 == s[i].1 {
            j += 1;
        }
        let dtp = s[i..j].iter().filter(|x| x.0).count();
        tp += dtp;
        fp += (j - i) - dtp;
        if dtp > 0 {
            ap += dtp as f64 * tp as f64 / (tp + fp) as f64;
        }
        i = j;
    }
    ap / npos as f64
}

fn finite(v: f64) -> Value {
    if v.is_finite() {
        json!(v)
    } else {
        Value::Null
    }
}

/// Score task (f): the detection metrics of tasks (a) and (b), average precision, and precision,
/// recall, F1 and the Matthews correlation coefficient at a declared threshold.
pub fn score_f(
    truth: &Value,
    preds: &Value,
    declared_threshold: Option<f64>,
) -> Result<(Value, String), BenchError> {
    let labels: Vec<Labeled> = labels_of(truth)?;
    let scores = scores_of(preds)?;
    let threshold = declared_threshold.or_else(|| preds.get("threshold").and_then(Value::as_f64));
    let mut m = detection_metrics(&labels, &scores, None)?;
    let labeled = super::pair(&labels, &scores)?;
    m["average_precision"] = finite(average_precision(&labeled));
    if let Some(t) = threshold {
        let c = crate::impairment_eval::confusion_at(&labeled, t);
        let (tp, fp, tn, fn_) = (c.tp as f64, c.fp as f64, c.tn as f64, c.fn_ as f64);
        let precision = tp / (tp + fp);
        let recall = tp / (tp + fn_);
        let f1 = 2.0 * tp / (2.0 * tp + fp + fn_);
        let mcc = (tp * tn - fp * fn_) / ((tp + fp) * (tp + fn_) * (tn + fp) * (tn + fn_)).sqrt();
        m["declared_threshold"] = json!(t);
        m["precision_at_declared"] = finite(precision);
        m["recall_at_declared"] = finite(recall);
        m["f1_at_declared"] = finite(f1);
        m["mcc_at_declared"] = finite(mcc);
    }
    Ok((
        m,
        "MODELLED: truth is the anomaly label assigned by the OPS-SAT-AD authors to each housekeeping telemetry segment; a score describes this dataset, never a spacecraft or a product".to_string(),
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn csv() -> String {
        let mut s = String::from("segment,anomaly,train,channel,sampling");
        for f in F_FEATURES {
            s.push(',');
            s.push_str(f);
        }
        s.push('\n');
        // 12 dev nominal segments on channel A, 2 dev anomalies, 3 test segments.
        for i in 0..12 {
            let v = 1.0 + 0.01 * i as f64;
            s.push_str(&format!("{i},0,1,A,5"));
            for _ in F_FEATURES {
                s.push_str(&format!(",{v}"));
            }
            s.push('\n');
        }
        for (i, (a, t, v)) in [
            (1, 1, 9.0),
            (1, 1, 7.0),
            (0, 0, 1.05),
            (1, 0, 5.0),
            (0, 0, 1.2),
        ]
        .iter()
        .enumerate()
        {
            s.push_str(&format!("{},{a},{t},A,5", 100 + i));
            for _ in F_FEATURES {
                s.push_str(&format!(",{v}"));
            }
            s.push('\n');
        }
        s
    }

    #[test]
    fn the_publishers_split_and_labels_are_kept_and_holdout_is_refused() {
        let segs = f_load(&csv()).unwrap();
        assert_eq!(segs.len(), 17);
        assert_eq!(segs.iter().filter(|s| s.split == Split::Test).count(), 3);
        let (cases, truth) = f_files(&segs, Split::Test).unwrap();
        assert_eq!(cases["cases"].as_array().unwrap().len(), 3);
        assert!(cases["cases"][0].get("positive").is_none());
        assert_eq!(truth["labels"][1]["positive"], json!(true));
        assert!(f_files(&segs, Split::Holdout).is_err());
    }

    #[test]
    fn a_missing_column_or_a_bad_value_names_the_column() {
        let e = f_load("segment,anomaly\n1,0\n").unwrap_err().to_string();
        assert!(e.contains("train"), "{e}");
        let bad = csv().replacen("100,1,1,A,5,9", "100,1,1,A,5,x", 1);
        let e = f_load(&bad).unwrap_err().to_string();
        assert!(e.contains("duration"), "{e}");
    }

    #[test]
    fn the_baselines_rank_the_far_segment_first_and_score_like_the_oracle() {
        let segs = f_load(&csv()).unwrap();
        for b in F_BASELINES {
            let sc = f_baseline_scores(b, &segs, Split::Test).unwrap();
            assert!(sc["seg-103"] > sc["seg-102"] && sc["seg-103"] > sc["seg-104"]);
        }
        let sc = f_baseline_scores("feature-z-max", &segs, Split::Test).unwrap();
        // Reference: 1.00 .. 1.11, median 1.055, MAD 0.03 -> scale 0.044478.
        let want = (5.0 - 1.055) / (1.4826 * 0.03);
        assert!((sc["seg-103"] - want).abs() < 1e-9, "{}", sc["seg-103"]);
        assert!(f_baseline_scores("nope", &segs, Split::Test).is_err());
    }

    #[test]
    fn average_precision_is_the_mean_precision_at_each_positive() {
        let l = [(true, 0.9), (false, 0.8), (true, 0.7), (false, 0.1)];
        assert!((average_precision(&l) - (1.0 + 2.0 / 3.0) / 2.0).abs() < 1e-12);
        // A tie of one positive and one negative at the top is one step of precision 1/2.
        let t = [(true, 1.0), (false, 1.0)];
        assert!((average_precision(&t) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn scoring_reports_ap_and_the_declared_operating_point() {
        let segs = f_load(&csv()).unwrap();
        let (_, truth) = f_files(&segs, Split::Test).unwrap();
        let sc = f_baseline_scores("feature-z-max", &segs, Split::Test).unwrap();
        let preds = json!({"scores": sc});
        let (m, label) = score_f(&truth, &preds, Some(10.0)).unwrap();
        assert_eq!(m["auc"], json!(1.0));
        assert_eq!(m["average_precision"], json!(1.0));
        assert_eq!(m["f1_at_declared"], json!(1.0));
        assert_eq!(m["mcc_at_declared"], json!(1.0));
        assert!(label.starts_with("MODELLED"));
    }
}
