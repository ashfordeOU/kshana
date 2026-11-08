# SPDX-License-Identifier: AGPL-3.0-only
"""Independent scorer of kshana-bench task (e) (bar E1 of B4a).

numpy only; shares no code with the engine. Reads a truth file and a predictions file and prints the
metrics of section 3 of the pre-registration, as read in README.md (readings 6, 7, 12):

    python3 -I oracle.py TRUTH.json PREDICTIONS.json [--min-folders 2 --min-units 300]

The minimum-data rule needs folders; a unit id is `<folder>#<n>`, so the folder is the text before the
last `#`. Meaconing needs 20 events as well; the truth file states the event count per class.
"""
import json
import sys

import numpy as np

CLASSES = ["nominal", "jamming", "spoofing", "meaconing"]
UNDEF = -1.0e300


def auc(pos, neg):
    """Mann-Whitney AUC, ties counted half; None when a side is empty."""
    pos = np.asarray(pos, dtype=np.float64)
    neg = np.asarray(neg, dtype=np.float64)
    if pos.size == 0 or neg.size == 0:
        return None
    # Pairwise definition, exact for the sizes used here: +1 pos > neg, +0.5 tie.
    gt = (pos[:, None] > neg[None, :]).sum(dtype=np.int64)
    eq = (pos[:, None] == neg[None, :]).sum(dtype=np.int64)
    return float((gt + 0.5 * eq) / (pos.size * neg.size))


def score(truth, preds, min_folders=2, min_units=300):
    labels = {l["id"]: l["class"] for l in truth["labels"]}
    events = truth.get("events_per_class", {})
    ids = sorted(labels)
    k = len(CLASSES)
    idx = {c: i for i, c in enumerate(CLASSES)}
    true_i = np.array([idx[labels[i]] for i in ids], dtype=np.int64)
    pred_i = np.array([idx[preds["labels"][i]] for i in ids], dtype=np.int64)
    m = np.zeros((k, k), dtype=np.int64)
    np.add.at(m, (true_i, pred_i), 1)
    present = [c for c in CLASSES if m[idx[c]].sum() > 0]
    folders = np.array([i.rsplit("#", 1)[0] for i in ids])
    entered = []
    for c in present:
        sel = true_i == idx[c]
        n_f = len(set(folders[sel].tolist()))
        ok = n_f >= min_folders and sel.sum() >= min_units
        if c == "meaconing":
            ok = ok and events.get("meaconing", 0) >= 20
        if ok:
            entered.append(c)
    row = m.sum(axis=1)
    col = m.sum(axis=0)
    recall = {c: (m[idx[c], idx[c]] / row[idx[c]] if row[idx[c]] > 0 else None) for c in CLASSES}
    precision = {c: (m[idx[c], idx[c]] / col[idx[c]] if col[idx[c]] > 0 else None) for c in CLASSES}

    def f1(c):
        p, r = precision[c], recall[c]
        if p is None or r is None or p + r == 0:
            return 0.0
        return float(2 * p * r / (p + r))

    def mean_over(cs, fn):
        return float(np.mean([fn(c) for c in cs])) if len(cs) >= 2 else None

    scores = np.array([[preds["class_scores"][i][c] for c in CLASSES] for i in ids], dtype=np.float64)
    aucs = {}
    for c in CLASSES:
        s = scores[:, idx[c]]
        pos = true_i == idx[c]
        aucs[c] = auc(s[pos], s[~pos])
    jam = row[idx["jamming"]]
    sm = row[idx["spoofing"]] + row[idx["meaconing"]]
    jam_as_sm = m[idx["jamming"], idx["spoofing"]] + m[idx["jamming"], idx["meaconing"]]
    sm_as_jam = m[idx["spoofing"], idx["jamming"]] + m[idx["meaconing"], idx["jamming"]]
    return {
        "classes": CLASSES,
        "confusion": m.tolist(),
        "present": present,
        "entered": entered,
        "recall": {c: (None if v is None else float(v)) for c, v in recall.items()},
        "precision": {c: (None if v is None else float(v)) for c, v in precision.items()},
        "balanced_accuracy": mean_over(entered, lambda c: recall[c]),
        "macro_f1": mean_over(entered, f1),
        "balanced_accuracy_descriptive": mean_over(present, lambda c: recall[c]),
        "macro_f1_descriptive": mean_over(present, f1),
        "auc": aucs,
        "jamming_labelled_spoofing_or_meaconing": (float(jam_as_sm / jam) if jam > 0 else None),
        "spoofing_meaconing_labelled_jamming": (float(sm_as_jam / sm) if sm > 0 else None),
    }


def main(argv):
    a, opts, i = [], {}, 0
    while i < len(argv):
        if argv[i].startswith("--"):
            opts[argv[i]] = argv[i + 1]
            i += 2
        else:
            a.append(argv[i])
            i += 1
    truth = json.load(open(a[0], encoding="utf-8"))
    preds = json.load(open(a[1], encoding="utf-8"))
    out = score(truth, preds, int(opts.get("--min-folders", 2)), int(opts.get("--min-units", 300)))
    print(json.dumps(out, indent=1, sort_keys=True))


if __name__ == "__main__":
    main(sys.argv[1:])
