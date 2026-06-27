#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the scikit-learn operating-point oracle for
``tests/ai_ml_rf_impairment_detection_evaluation_reference.rs`` in
``opssat_opcurve_reference.txt``.

WHAT THIS VALIDATES
-------------------
Beyond the already-pinned ROC AUC (see ``tests/opssat_ad_reference.rs``), this
oracle pins, on the **real ESA OPS-SAT anomaly-detection test split**, the FULL
operating-point characterisation that Kshana's evaluation testbed
(``impairment_eval::{evaluate, confusion_at, threshold_for_pfa}``) produces:

  * the operating **threshold** chosen for a target false-alarm rate,
  * the integer 2x2 **confusion matrix** (TP / FP / TN / FN) at that threshold,
  * the derived rates **Pd / Pfa / Pmd / precision / accuracy / F1**,
  * a **per-channel detection-rate breakdown** (recall over each telemetry
    channel's anomaly-positive segments),
  * the threshold-free **ROC AUC**,

for two fully-specified, deterministic detectors on the held-out test split.

ORACLE INDEPENDENCE (load-bearing)
----------------------------------
This script imports ONLY scikit-learn + numpy. It NEVER imports Kshana. In
particular the operating threshold is computed here from the *documented*
definition of ``threshold_for_pfa`` — "the largest score threshold whose
negative-set false-alarm rate (under the ``score >= threshold`` rule) does not
exceed the target" — using a plain numpy walk over the unique negative scores,
NOT by calling Kshana. The Rust test then asserts that:
  (a) Kshana's ``threshold_for_pfa`` returns the IDENTICAL threshold this script
      derived, and
  (b) Kshana's ``confusion_at`` at that threshold matches scikit-learn's
      ``confusion_matrix`` integer-exact, with the derived rates from
      ``recall_score`` / ``precision_score`` / ``accuracy_score`` / ``f1_score``
      to < 1e-9.
So the oracle truth (threshold + counts + rates) is produced by an independent
authority on real spacecraft data — not by re-running Kshana's own arithmetic.

DETECTORS (identical to tests/opssat_ad_reference.rs, so the two islands agree)
  1. ``n_peaks``  — a transparent single-feature anomaly score (segment peak
     count). Integer-valued, so it deliberately exercises ties / granular Pfa.
  2. ``combined`` — a diagonal-Mahalanobis score over 8 features, fitted (mean,
     std) on the *normal training* segments only, scored on the test split.

DATASET
  OPSSAT-AD (Ruszczak, B. et al., *OPSSAT-AD — anomaly detection dataset for
  satellite telemetry*, Scientific Data 2025, DOI 10.1038/s41597-025-05035-3;
  data DOI 10.5281/zenodo.12588359), CC BY 4.0. Real ESA OPS-SAT housekeeping
  telemetry. Vendored as ``dataset.csv`` (see NOTICE.md). Test split = rows with
  ``train == 0`` (529 segments, 113 anomalies, 9 telemetry channels).

ORACLE TOOLCHAIN
  scikit-learn 1.8.0 (Pedregosa et al., JMLR 2011; BSD-3-Clause), numpy 2.4.1.

REPRODUCE (offline, no Kshana code involved)
    python3 -m venv /tmp/skvenv
    /tmp/skvenv/bin/pip install "scikit-learn==1.8.0" numpy
    /tmp/skvenv/bin/python generate_opssat_opcurve_reference.py \
        > opssat_opcurve_reference.txt

CONVENTIONS matched to ``impairment_eval`` (so counts agree integer-exact)
  * predict positive iff ``score >= threshold``  ==  numpy ``scores >= t``;
  * Pfa = FP/(FP+TN), Pd = recall = TP/(TP+FN), precision = TP/(TP+FP),
    accuracy = (TP+TN)/N, F1 = 2PR/(P+R); zero-division -> 0 (sklearn
    ``zero_division=0``, Kshana ``ratio`` returns 0 on a zero denominator);
  * scores/thresholds emitted via ``repr`` (full f64) so Rust parses the bit-
    identical value and the integer counts cannot drift.
"""
import csv
import math
import os

import numpy as np
from sklearn.metrics import (  # reference implementation (oracle)
    roc_auc_score,
    confusion_matrix,
    precision_score,
    recall_score,
    accuracy_score,
    f1_score,
)

HERE = os.path.dirname(os.path.abspath(__file__))

# Features for the diagonal-Mahalanobis detector — identical to
# tests/opssat_ad_reference.rs (FEATS) and generate_opssat_oracle.py.
FEATS = ["std", "var", "kurtosis", "skew", "n_peaks", "diff_var", "diff2_var", "var_div_len"]

# Target false-alarm rates that set the operating points. Chosen so each detector
# yields >= 4 DISTINCT thresholds: n_peaks is integer-valued so several targets
# collapse onto the same threshold (a deliberate tie / granular-Pfa exercise),
# {0.005,0.01,0.02,0.05,0.10} already gives it 5 distinct thresholds.
TARGET_PFAS = [0.005, 0.01, 0.02, 0.05, 0.10, 0.20]


def fval(row, key):
    try:
        return float(row[key])
    except ValueError:
        return float("nan")


def threshold_for_pfa(neg_scores, target):
    """Independent re-implementation of the DOCUMENTED threshold_for_pfa
    semantics (no Kshana import): the largest score ``v`` such that the negative
    false-alarm rate ``count(neg >= v) / n`` does not exceed ``target``. Returns
    +inf for target<=0 (flag nothing) and -inf for target>=1 (flag everything),
    matching the documented edge behaviour."""
    neg = np.asarray(neg_scores, dtype=float)
    n = neg.size
    if n == 0:
        return math.inf
    target = min(max(target, 0.0), 1.0)
    if target <= 0.0:
        return math.inf
    if target >= 1.0:
        return -math.inf
    uniq = sorted(set(neg.tolist()), reverse=True)  # descending
    thr = math.inf  # nothing flagged => Pfa = 0, if even the top score overshoots
    for v in uniq:
        pfa = float(np.sum(neg >= v)) / n
        if pfa <= target + 1e-12:
            thr = v
        else:
            break
    return thr


def main():
    rows = list(csv.DictReader(open(os.path.join(HERE, "dataset.csv"))))
    train_norm = [r for r in rows if r["train"] == "1" and r["anomaly"] == "0"]
    test = [r for r in rows if r["train"] == "0"]

    labels = np.array([int(r["anomaly"]) for r in test], dtype=int)
    channels = [r["channel"] for r in test]
    n_test = len(test)
    n_anom = int(labels.sum())

    # ---- Detector 1: single-feature n_peaks (integer-valued). ----
    npeaks = np.array([fval(r, "n_peaks") for r in test], dtype=float)

    # ---- Detector 2: diagonal-Mahalanobis fit on normal training segments. ----
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

    comb = np.array([combined(r) for r in test], dtype=float)

    detectors = [("n_peaks", npeaks), ("combined", comb)]
    chan_set = sorted(set(channels))

    print("# OPS-SAT operating-point oracle — scikit-learn 1.8.0 / numpy 2.4.1 on REAL")
    print("# ESA OPS-SAT-AD test split (Ruszczak et al. 2025, Zenodo 10.5281/zenodo.12588359,")
    print("# CC BY 4.0). Consumed by tests/ai_ml_rf_impairment_detection_evaluation_reference.rs.")
    print("# See generate_opssat_opcurve_reference.py for full provenance + independence note.")
    print("# Format:")
    print("#   META n_test n_anom n_channels")
    print("#   CHANNELS <name:n_total:n_anom> ...   (per-channel totals, for the breakdown)")
    print("#   DETECTOR <name>")
    print("#   LABELS  l,l,...        (0/1 per test segment, test-split order)")
    print("#   CHAN    c,c,...        (channel per test segment, same order)")
    print("#   SCORES  s,s,...        (detector score per test segment, f64 repr, same order)")
    print("#   AUC     <roc_auc_score>")
    print("#   OP <target_pfa> <threshold> tp fp tn fn pd pmd pfa precision accuracy f1")
    print("#   PC <target_pfa> <channel> <n_anom_in_channel> <n_detected> <per_channel_pd>")
    print("#   ENDDET")
    print(f"META {n_test} {n_anom} {len(chan_set)}")
    print("CHANNELS " + " ".join(
        f"{c}:{channels.count(c)}:{int(labels[[i for i,ch in enumerate(channels) if ch==c]].sum())}"
        for c in chan_set
    ))

    for name, sc in detectors:
        print(f"DETECTOR {name}")
        print("LABELS " + ",".join(str(int(v)) for v in labels))
        print("CHAN " + ",".join(channels))
        print("SCORES " + ",".join(repr(float(v)) for v in sc))
        print(f"AUC {roc_auc_score(labels, sc)!r}")
        neg = sc[labels == 0]
        for target in TARGET_PFAS:
            t = threshold_for_pfa(neg, target)
            pred = (sc >= t).astype(int)
            tn, fp, fn, tp = confusion_matrix(labels, pred, labels=[0, 1]).ravel()
            pd = recall_score(labels, pred, zero_division=0)
            pmd = 1.0 - pd
            pfa = float(fp / (fp + tn)) if (fp + tn) else 0.0
            prec = precision_score(labels, pred, zero_division=0)
            acc = accuracy_score(labels, pred)
            f1 = f1_score(labels, pred, zero_division=0)
            print(
                f"OP {target!r} {t!r} {int(tp)} {int(fp)} {int(tn)} {int(fn)} "
                f"{pd!r} {pmd!r} {pfa!r} {prec!r} {acc!r} {f1!r}"
            )
            # Per-channel detection-rate breakdown: recall over each channel's
            # anomaly-positive segments at this operating threshold.
            for c in chan_set:
                idx = [i for i, ch in enumerate(channels) if ch == c]
                cl = labels[idx]
                cp = pred[idx]
                npos = int(cl.sum())
                ndet = int(((cl == 1) & (cp == 1)).sum())
                pc = float(ndet / npos) if npos else 0.0
                print(f"PC {target!r} {c} {npos} {ndet} {pc!r}")
        print("ENDDET")


if __name__ == "__main__":
    main()
