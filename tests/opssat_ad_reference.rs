// SPDX-License-Identifier: AGPL-3.0-only
//! Anomaly-detection ROC AUC validated on **real ESA OPS-SAT telemetry**.
//!
//! This is a *reproduces-labels* island. It pins Kshana's Mann–Whitney ROC AUC
//! (`impairment_eval::auc`) against **scikit-learn's `roc_auc_score`** (the reference
//! implementation / oracle) **on real ESA spacecraft telemetry** — the OPSSAT-AD
//! dataset (Ruszczak et al. 2025, Zenodo 10.5281/zenodo.12588359, CC BY 4.0; real
//! OPS-SAT housekeeping segments with ground-truth anomaly labels) — for two
//! fully-specified, deterministic anomaly scores on the held-out test split:
//!
//!  1. **peak count** (`n_peaks`) — a transparent single-feature detector;
//!  2. a **diagonal-Mahalanobis** score over 8 features, fitted on the normal
//!     training segments.
//!
//! For both, Kshana's AUC reproduces scikit-learn to < 1e-9, and the peak-count
//! detector separates the real labelled anomalies at AUC ≈ 0.85.
//!
//! What this does NOT claim: it does not reproduce the OPSSAT-AD paper's best
//! published metric (a supervised FCNN at F1 ≈ 0.95) — that needs their trained
//! model. We validate the **AUC computation on real ESA data** and a transparent
//! detector's **labelled separation**, not a published score. The CC-BY data is
//! vendored (`tests/fixtures/opssat/`, see `NOTICE.md`), so the island is hermetic.

use kshana::impairment_eval::auc;

const DATASET: &str = include_str!("fixtures/opssat/dataset.csv");

// scikit-learn 1.8.0 `roc_auc_score` on the OPSSAT-AD test split (train==0).
// Regenerate with tests/fixtures/opssat/generate_opssat_oracle.py.
const N_PEAKS_AUC_ORACLE: f64 = 0.851_110_449_285_228;
const COMBINED_AUC_ORACLE: f64 = 0.556_288_291_354_663_1;
const ORACLE_TOL: f64 = 1e-9;

/// Features used by the diagonal-Mahalanobis score (must match the oracle script).
const FEATS: [&str; 8] = [
    "std",
    "var",
    "kurtosis",
    "skew",
    "n_peaks",
    "diff_var",
    "diff2_var",
    "var_div_len",
];

struct Table {
    header: Vec<String>,
    rows: Vec<Vec<String>>,
}

impl Table {
    fn col(&self, name: &str) -> usize {
        self.header
            .iter()
            .position(|h| h == name)
            .unwrap_or_else(|| panic!("no column {name}"))
    }
}

fn parse_csv(text: &str) -> Table {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let header: Vec<String> = lines
        .next()
        .expect("header")
        .split(',')
        .map(|s| s.to_string())
        .collect();
    let rows: Vec<Vec<String>> = lines
        .map(|l| l.split(',').map(|s| s.to_string()).collect())
        .collect();
    Table { header, rows }
}

/// Parse a cell as f64; non-finite / unparseable (e.g. NaN kurtosis) → `NaN`.
fn cell_f64(row: &[String], idx: usize) -> f64 {
    row.get(idx)
        .and_then(|s| s.trim().parse::<f64>().ok())
        .unwrap_or(f64::NAN)
}

/// Split a score vector into positive (label==1) / negative (label==0) groups.
fn split(scores: &[f64], labels: &[i32]) -> (Vec<f64>, Vec<f64>) {
    let pos = scores
        .iter()
        .zip(labels)
        .filter(|(_, &l)| l == 1)
        .map(|(&s, _)| s)
        .collect();
    let neg = scores
        .iter()
        .zip(labels)
        .filter(|(_, &l)| l == 0)
        .map(|(&s, _)| s)
        .collect();
    (pos, neg)
}

fn rel_err(got: f64, want: f64) -> f64 {
    ((got - want) / want).abs()
}

#[test]
fn opssat_ad_auc_reproduces_sklearn_on_real_esa_telemetry() {
    let t = parse_csv(DATASET);
    let (c_train, c_anom) = (t.col("train"), t.col("anomaly"));
    let c_npeaks = t.col("n_peaks");

    // Held-out test split and the normal training segments (for the fit).
    let test: Vec<&Vec<String>> = t.rows.iter().filter(|r| r[c_train].trim() == "0").collect();
    let train_norm: Vec<&Vec<String>> = t
        .rows
        .iter()
        .filter(|r| r[c_train].trim() == "1" && r[c_anom].trim() == "0")
        .collect();
    assert_eq!(test.len(), 529, "OPSSAT-AD test split changed");
    let labels: Vec<i32> = test
        .iter()
        .map(|r| r[c_anom].trim().parse().expect("label"))
        .collect();
    let n_anom = labels.iter().filter(|&&l| l == 1).count();
    assert_eq!(n_anom, 113, "OPSSAT-AD test anomaly count changed");

    // (1) Transparent single-feature detector: segment peak count.
    let npeaks: Vec<f64> = test.iter().map(|r| cell_f64(r, c_npeaks)).collect();
    let (pos, neg) = split(&npeaks, &labels);
    let auc_npeaks = auc(&pos, &neg);
    assert!(
        rel_err(auc_npeaks, N_PEAKS_AUC_ORACLE) < ORACLE_TOL,
        "n_peaks AUC {auc_npeaks:.12} vs scikit-learn {N_PEAKS_AUC_ORACLE:.12}"
    );
    // Real detection sanity: the peak-count detector genuinely separates real anomalies.
    assert!(
        auc_npeaks > 0.80,
        "n_peaks detector AUC collapsed to {auc_npeaks:.3}"
    );

    // (2) Diagonal-Mahalanobis score fitted on the normal training segments.
    let cols: Vec<usize> = FEATS.iter().map(|f| t.col(f)).collect();
    let mut mean = vec![0.0; FEATS.len()];
    let mut std = vec![1.0; FEATS.len()];
    for (j, &cj) in cols.iter().enumerate() {
        let vals: Vec<f64> = train_norm
            .iter()
            .map(|r| cell_f64(r, cj))
            .filter(|v| v.is_finite())
            .collect();
        let m = vals.iter().sum::<f64>() / vals.len() as f64;
        let var = vals.iter().map(|v| (v - m) * (v - m)).sum::<f64>() / vals.len() as f64;
        mean[j] = m;
        std[j] = if var > 0.0 { var.sqrt() } else { 1.0 };
    }
    let combined: Vec<f64> = test
        .iter()
        .map(|r| {
            let mut s = 0.0;
            for (j, &cj) in cols.iter().enumerate() {
                let x = cell_f64(r, cj);
                if x.is_finite() {
                    let z = (x - mean[j]) / std[j];
                    s += z * z;
                }
            }
            s
        })
        .collect();
    let (pos, neg) = split(&combined, &labels);
    let auc_combined = auc(&pos, &neg);
    assert!(
        rel_err(auc_combined, COMBINED_AUC_ORACLE) < ORACLE_TOL,
        "combined AUC {auc_combined:.12} vs scikit-learn {COMBINED_AUC_ORACLE:.12}"
    );

    eprintln!(
        "[opssat-ad] real ESA OPS-SAT test split (n={}, anomalies={}): \
         n_peaks AUC={auc_npeaks:.6} (sklearn {N_PEAKS_AUC_ORACLE:.6}); \
         diag-Mahalanobis AUC={auc_combined:.6} (sklearn {COMBINED_AUC_ORACLE:.6})",
        test.len(),
        n_anom
    );
}

#[test]
fn opssat_ad_bootstrap_ci_brackets_the_point_auc() {
    use kshana::eval_stats::bootstrap_auc_ci;
    let t = parse_csv(DATASET);
    let (c_train, c_anom, c_npeaks) = (t.col("train"), t.col("anomaly"), t.col("n_peaks"));
    let test: Vec<&Vec<String>> = t.rows.iter().filter(|r| r[c_train].trim() == "0").collect();
    let labels: Vec<i32> = test
        .iter()
        .map(|r| r[c_anom].trim().parse().expect("label"))
        .collect();
    let npeaks: Vec<f64> = test.iter().map(|r| cell_f64(r, c_npeaks)).collect();
    let (pos, neg) = split(&npeaks, &labels);
    let point = auc(&pos, &neg);
    let (lo, hi) = bootstrap_auc_ci(&pos, &neg, 2000, 12345, 0.05);
    assert!(
        lo.is_finite() && hi.is_finite() && lo < hi,
        "degenerate CI ({lo}, {hi})"
    );
    assert!(
        lo <= point && point <= hi,
        "point AUC {point:.4} outside 95% CI [{lo:.4}, {hi:.4}]"
    );
    assert!(
        lo > 0.5,
        "lower CI {lo:.4} should clear chance for a real-detection result"
    );
}
