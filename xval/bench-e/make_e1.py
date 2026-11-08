# SPDX-License-Identifier: AGPL-3.0-only
"""Deterministic synthetic truth and predictions for bar E1 of B4a (README reading 15).

    python3 -I make_e1.py OUT_DIR

Writes e1_truth.json / e1_predictions.json (four classes) and e1b_truth.json / e1b_predictions.json
(meaconing removed). Standard library only; a fixed linear congruential generator, so the files are
the same bytes everywhere.
"""
import json
import os
import sys

CLASSES = ["nominal", "jamming", "spoofing", "meaconing"]
UNDEF = -1.0e300


class Lcg:
    def __init__(self, seed):
        self.x = seed

    def next(self):
        self.x = (6364136223846793005 * self.x + 1442695040888963407) % (1 << 64)
        return self.x >> 11

    def unit(self):
        return self.next() / float(1 << 53)


def build(with_meaconing):
    g = Lcg(20261108)
    labels, plabels, scores = [], {}, {}
    # (class, folders, units per folder): nominal and spoofing enter; jamming has one folder only
    # (below the folder minimum); meaconing has two folders of 160 (enough units, its entry then
    # rests on the event count stated in the truth file).
    plan = [("nominal", 4, 150), ("jamming", 1, 400), ("spoofing", 3, 120), ("meaconing", 2, 160)]
    for cls, n_f, n_u in plan:
        if cls == "meaconing" and not with_meaconing:
            continue
        for f in range(n_f):
            for n in range(n_u):
                uid = "%s/f%d#%d" % (cls, f, n)
                labels.append({"id": uid, "class": cls})
                r = g.unit()
                # Labels: mostly right, with confusions in every direction; meaconing is never
                # predicted (a class whose recall, precision and F1 are 0).
                if cls == "meaconing":
                    p = "spoofing" if r < 0.6 else "jamming"
                elif r < 0.7:
                    p = cls
                elif r < 0.8:
                    p = "nominal"
                elif r < 0.9:
                    p = "jamming"
                else:
                    p = "spoofing"
                plabels[uid] = p
                s = {}
                for c in CLASSES:
                    v = g.unit() + (0.5 if c == cls else 0.0)
                    q = g.unit()
                    if q < 0.05:
                        v = UNDEF  # undefined score, ties with the other undefined ones
                    elif q < 0.5:
                        v = round(v, 1)  # coarse values: many ties within and across classes
                    s[c] = v
                scores[uid] = s
    truth = {
        "schema": "kshana-bench-truth/1",
        "task": "e",
        "split": "test",
        "spec_version": "kshana-bench/2.1.0",
        "labels": labels,
        "events_per_class": {"jamming": 3, "spoofing": 6, "meaconing": 25 if with_meaconing else 0},
    }
    preds = {
        "schema": "kshana-bench-predictions/1",
        "task": "e",
        "split": "test",
        "system": {"name": "e1-synthetic", "version": "1"},
        "labels": plabels,
        "class_scores": scores,
    }
    return truth, preds


def main(out):
    os.makedirs(out, exist_ok=True)
    for tag, wm in (("e1", True), ("e1b", False)):
        t, p = build(wm)
        for name, doc in (("truth", t), ("predictions", p)):
            with open(os.path.join(out, "%s_%s.json" % (tag, name)), "w", encoding="utf-8", newline="\n") as fh:
                json.dump(doc, fh, sort_keys=True, separators=(",", ":"))
                fh.write("\n")


if __name__ == "__main__":
    main(sys.argv[1])
