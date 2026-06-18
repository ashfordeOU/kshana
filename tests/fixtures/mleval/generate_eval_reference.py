#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external ML-evaluation metric reference in ``eval_reference.txt``.

The oracle is **scikit-learn** (Pedregosa et al., JMLR 2011) — the canonical,
independent, peer-reviewed implementation of ROC/AUC/confusion-matrix metrics.
Kshana's detector-agnostic evaluation testbed (``impairment_eval``) computes the
same metrics (`auc`, `confusion_at` → P_d/P_md/P_fa/precision/accuracy/F1) and is
checked against scikit-learn's numbers for identical (label, score) data — a
genuine *external* validation of the metric maths, exactly as DOP is validated
against gnss_lib_py and the reference frames against ERFA.

Conventions matched to ``impairment_eval``:
  * AUC = Mann-Whitney U with ties counted ½  ==  sklearn ``roc_auc_score``.
  * Predict positive iff ``score >= threshold``  ==  numpy ``scores >= t``.
  * ratios use zero-division → 0 (sklearn ``zero_division=0``).
Scores/thresholds are emitted with ``repr`` so Rust parses the identical f64,
making the per-threshold integer confusion counts agree exactly.

Reproduce (offline, no Kshana code involved):

    python3.11 -m venv /tmp/dopvenv
    /tmp/dopvenv/bin/pip install scikit-learn numpy
    /tmp/dopvenv/bin/python generate_eval_reference.py > eval_reference.txt

Generated with scikit-learn 1.9.0 + numpy.
"""

import numpy as np
from sklearn.metrics import (
    roc_auc_score,
    confusion_matrix,
    precision_score,
    recall_score,
    accuracy_score,
    f1_score,
)


def dataset(name, y, s):
    return (name, np.asarray(y, int), np.asarray(s, float))


def make_datasets():
    rng = np.random.default_rng(13494)
    sets = []

    # Perfect separation (AUC = 1).
    sets.append(dataset("separable",
                        [0, 0, 0, 0, 1, 1, 1, 1],
                        [0.1, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.9]))

    # Overlapping Gaussian scores, balanced.
    neg = rng.normal(0.0, 1.0, 40)
    pos = rng.normal(1.2, 1.0, 40)
    sets.append(dataset("overlap_balanced",
                        [0] * 40 + [1] * 40,
                        list(neg) + list(pos)))

    # Heavy ties: integer scores force many equal values (exercises ½-credit AUC
    # and the >= boundary in the confusion counts).
    sets.append(dataset("ties",
                        [0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1],
                        [1, 2, 2, 2, 3, 3, 3, 1, 2, 3, 2, 1]))

    # Class imbalance (rare positives).
    neg = rng.normal(0.0, 1.0, 90)
    pos = rng.normal(1.5, 1.0, 10)
    sets.append(dataset("imbalanced",
                        [0] * 90 + [1] * 10,
                        list(neg) + list(pos)))

    # Inverted ranking (AUC < 0.5) — a detector worse than chance.
    sets.append(dataset("inverted",
                        [0, 0, 0, 1, 1, 1],
                        [0.9, 0.8, 0.7, 0.3, 0.2, 0.1]))

    return sets


def thresholds_for(s):
    lo, hi = float(np.min(s)), float(np.max(s))
    mid = float(np.median(s))
    # below all (predict everything), an exact score value, the median, an exact
    # max (boundary), and above all (predict nothing).
    return sorted({lo - 1.0, float(s[0]), mid, hi, hi + 1.0})


def main():
    print("# ML detector-evaluation metric reference — oracle: scikit-learn 1.9.0")
    print("# Consumed by tests/eval_metrics_reference.rs. See NOTICE / generate_eval_reference.py.")
    print("# Per dataset: DATASET / L labels / S scores / AUC / one THR line per threshold:")
    print("#   THR <threshold> tp fp tn fn pd pmd pfa precision accuracy f1")
    for name, y, s in make_datasets():
        auc = roc_auc_score(y, s)
        print(f"DATASET {name}")
        print("L " + ",".join(str(int(v)) for v in y))
        print("S " + ",".join(repr(float(v)) for v in s))
        print(f"AUC {auc!r}")
        for t in thresholds_for(s):
            pred = (s >= t).astype(int)
            tn, fp, fn, tp = confusion_matrix(y, pred, labels=[0, 1]).ravel()
            pd = recall_score(y, pred, zero_division=0)
            pfa = float(fp / (fp + tn)) if (fp + tn) else 0.0
            prec = precision_score(y, pred, zero_division=0)
            acc = accuracy_score(y, pred)
            f1 = f1_score(y, pred, zero_division=0)
            print(f"THR {t!r} {tp} {fp} {tn} {fn} {pd!r} {1.0 - pd!r} {pfa!r} {prec!r} {acc!r} {f1!r}")
        print("END")


if __name__ == "__main__":
    main()
