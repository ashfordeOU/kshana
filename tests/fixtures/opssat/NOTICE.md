# OPSSAT-AD anomaly-detection dataset — provenance

`dataset.csv` and the AUC oracle used by `tests/opssat_ad_reference.rs` to validate
Kshana's ROC-AUC computation on **real ESA spacecraft telemetry**.

## Dataset
- **OPSSAT-AD** — anomaly-detection dataset built from real **ESA OPS-SAT** mission
  housekeeping telemetry. 2123 segments, 23 engineered features (mean/var/std,
  kurtosis, skew, peak counts, difference variances, …), a binary `anomaly`
  ground-truth label (434 anomalies / 1689 normal) and a `train`/test split flag.
- **Source:** Ruszczak, B. et al., *OPSSAT-AD — anomaly detection dataset for
  satellite telemetry*, **Scientific Data** (2025), DOI 10.1038/s41597-025-05035-3;
  data DOI **10.5281/zenodo.12588359** (`dataset.csv`). Companion code:
  https://github.com/kplabs-pl/OPS-SAT-AD.
- **Licence:** **CC BY 4.0** — redistributable with attribution, so `dataset.csv`
  is vendored here (small, 0.5 MB) and the island runs hermetically in CI.

## What is validated (and what is NOT)
This is a **"reproduces-labels"** island. It validates that Kshana's Mann–Whitney
**ROC AUC** (`impairment_eval::auc`) reproduces **scikit-learn's `roc_auc_score`**
(reference implementation, the oracle) **bit-for-bit on real ESA telemetry**, for two
fully-specified deterministic anomaly scores, and that a transparent single-feature
detector (segment **peak count**) separates the real labelled anomalies at AUC ≈ 0.85
on the held-out test split.

It does **NOT** claim to reproduce the OPSSAT-AD paper's best published metric
(a supervised FCNN at F1 ≈ 0.95) — that needs their trained model. We reproduce the
**labelled separation with our own transparent detector**, not a published score.

## Oracle
The AUC oracle values are produced by `generate_opssat_oracle.py` (scikit-learn
1.8.0, numpy 2.4.1) and embedded as inline constants in the test. Re-run that script
to regenerate them.

## Attribution
OPSSAT-AD © its authors (Ruszczak et al., KP Labs / ESA), CC BY 4.0.
Cited, not endorsed. Kshana is not affiliated with ESA, KP Labs, or the authors.
