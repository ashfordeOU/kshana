#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent oracle for kshana-bench task (f) (PREREGISTRATION.md, bar F1).

Reads OPS-SAT-AD dataset.csv, computes the two baselines and the test-split AUC and average precision with
the standard library only, and prints them as JSON. Usage: python3 oracle.py <dataset.csv>
"""
import csv
import json
import math
import sys

FEATURES = ["duration", "len", "mean", "var", "std", "kurtosis", "skew", "n_peaks", "smooth10_n_peaks",
            "smooth20_n_peaks", "diff_peaks", "diff2_peaks", "diff_var", "diff2_var", "gaps_squared",
            "len_weighted", "var_div_duration", "var_div_len"]


def median(v):
    s = sorted(v)
    n = len(s)
    return s[n // 2] if n % 2 else 0.5 * (s[n // 2 - 1] + s[n // 2])


def robust(ref):
    m = median(ref)
    return m, 1.4826 * median([abs(x - m) for x in ref])


def auc(pos, neg):
    allv = sorted([(s, 1) for s in pos] + [(s, 0) for s in neg])
    ranks, i = {}, 0
    rsum = 0.0
    while i < len(allv):
        j = i
        while j < len(allv) and allv[j][0] == allv[i][0]:
            j += 1
        r = (i + 1 + j) / 2.0
        rsum += r * sum(1 for k in range(i, j) if allv[k][1] == 1)
        i = j
    return (rsum - len(pos) * (len(pos) + 1) / 2.0) / (len(pos) * len(neg))


def average_precision(labeled):
    # Step-wise: mean over positives of the precision at that positive's score, ties grouped.
    s = sorted(labeled, key=lambda x: -x[1])
    npos = sum(1 for p, _ in s if p)
    tp = fp = 0
    ap = 0.0
    i = 0
    while i < len(s):
        j = i
        while j < len(s) and s[j][1] == s[i][1]:
            j += 1
        dtp = sum(1 for k in range(i, j) if s[k][0])
        tp += dtp
        fp += (j - i) - dtp
        if dtp:
            ap += dtp * tp / (tp + fp)
        i = j
    return ap / npos


def main(path):
    rows = list(csv.DictReader(open(path, newline="")))
    dev_nom = [r for r in rows if r["train"] == "1" and r["anomaly"] == "0"]
    out = {}
    for name in ["feature-z-max", "diff2-var-z"]:
        labeled = []
        for r in rows:
            if r["train"] != "0":
                continue
            ref = [x for x in dev_nom if x["channel"] == r["channel"]]
            if len(ref) < 10:
                ref = dev_nom
            if name == "feature-z-max":
                best = 0.0
                for f in FEATURES:
                    m, s = robust([float(x[f]) for x in ref])
                    if s > 0:
                        best = max(best, abs((float(r[f]) - m) / s))
                score = best
            else:
                g = lambda x: math.log10(float(x["diff2_var"]) + 1e-30)
                m, s = robust([g(x) for x in ref])
                score = abs((g(r) - m) / s) if s > 0 else 0.0
            labeled.append((r["anomaly"] == "1", score))
        pos = [s for p, s in labeled if p]
        neg = [s for p, s in labeled if not p]
        out[name] = {"auc": auc(pos, neg), "average_precision": average_precision(labeled)}
    print(json.dumps(out, indent=2))


if __name__ == "__main__":
    main(sys.argv[1])
