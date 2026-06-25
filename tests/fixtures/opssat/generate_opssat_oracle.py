#!/usr/bin/env python3
"""Regenerate the scikit-learn AUC oracle for tests/opssat_ad_reference.rs.

Computes ROC AUC with scikit-learn's roc_auc_score on the OPSSAT-AD test split
for two fully-specified, deterministic anomaly scores, so the Rust island can
assert its own AUC reproduces an independent reference implementation on real
ESA OPS-SAT telemetry. Print the values into the inline constants of the test.

Dataset: OPSSAT-AD (Ruszczak et al. 2025), Zenodo 10.5281/zenodo.12588359,
CC BY 4.0. Reference impl: scikit-learn 1.8.0 (numpy 2.4.1).

Usage: python3 tests/fixtures/opssat/generate_opssat_oracle.py
"""
import csv
import math
import os

from sklearn.metrics import roc_auc_score  # reference implementation (oracle)

HERE = os.path.dirname(__file__)
FEATS = ["std", "var", "kurtosis", "skew", "n_peaks", "diff_var", "diff2_var", "var_div_len"]


def fval(row, key):
    try:
        return float(row[key])
    except ValueError:
        return float("nan")


def main():
    rows = list(csv.DictReader(open(os.path.join(HERE, "dataset.csv"))))
    train_norm = [r for r in rows if r["train"] == "1" and r["anomaly"] == "0"]
    test = [r for r in rows if r["train"] == "0"]

    # Diagonal-Mahalanobis fit on the normal training segments.
    stats = {}
    for k in FEATS:
        vals = [fval(r, k) for r in train_norm if not math.isnan(fval(r, k))]
        m = sum(vals) / len(vals)
        sd = (sum((v - m) ** 2 for v in vals) / len(vals)) ** 0.5
        stats[k] = (m, sd if sd > 0 else 1.0)

    def combined(r):
        s = 0.0
        for k in FEATS:
            x = fval(r, k)
            if math.isnan(x):
                continue
            m, sd = stats[k]
            z = (x - m) / sd
            s += z * z
        return s

    labels = [int(r["anomaly"]) for r in test]
    n_peaks = [fval(r, "n_peaks") for r in test]
    comb = [combined(r) for r in test]

    print(f"n_test = {len(test)}, n_anomaly = {sum(labels)}")
    print(f"N_PEAKS_AUC  = {roc_auc_score(labels, n_peaks):.16e}")
    print(f"COMBINED_AUC = {roc_auc_score(labels, comb):.16e}")


if __name__ == "__main__":
    main()
