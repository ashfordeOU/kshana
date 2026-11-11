#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent recomputation of B4a E5 v2 and E5-PD from the ten committed score files.

Standard library only; shares no code with the engine. Rules from PREREGISTRATION-E5-v2.md and
PREREGISTRATION-E5-PD.md: counted windows only; JSON null is +inf; one-vs-rest AUC of `spoofing` by pairwise
comparison (1 for higher, 1/2 for a tie); recording-level AUC from each recording's median; per spoofing
recording against the two clean ones. Prints the result as JSON (the same keys as E5-SCORE.json).
"""
import json, math, os, sys
from fractions import Fraction

NAMES = ["cleanStatic", "cleanDynamic"] + ["ds%d" % i for i in range(1, 9)]

def score(w):
    return math.inf if w["score"] is None else float(w["score"])

def auc(pos, neg):
    if not pos or not neg:
        return None
    s = Fraction(0)
    for p in pos:  # exact, pair by pair
        for n in neg:
            s += 1 if p > n else (Fraction(1, 2) if p == n else 0)
    return float(s / (len(pos) * len(neg)))

def median(v):
    v = sorted(v); n = len(v)
    return v[n // 2] if n % 2 else 0.5 * (v[n // 2 - 1] + v[n // 2])

def e5(docs, bar):
    pos, neg, rp, rn, per = [], [], [], [], {}
    for d in docs:
        s = [score(w) for w in d["windows"] if w["counted"] is True]
        if not s:
            continue
        if d["class"] == "spoofing":
            pos += s; rp.append(median(s)); per[d["file"]] = s
        else:
            neg += s; rn.append(median(s))
    enough = len(rp) >= 2 and len(rn) >= 2 and len(pos) >= 300 and len(neg) >= 300
    a = auc(pos, neg)
    return {"auc": a, "bar": bar,
            "verdict": "NOT ASSESSABLE" if not enough else ("MET" if a >= bar else "NOT MET"),
            "units": {"spoofing": len(pos), "nominal": len(neg)},
            "recordings": {"spoofing": len(rp), "nominal": len(rn)},
            "recording_level_auc": auc(rp, rn),
            "per_recording_auc": {f: auc(s, neg) for f, s in per.items()}}

d = sys.argv[1]
load = lambda n, e: json.load(open(os.path.join(d, "%s.bin.%s.json" % (n, e))))
v2 = [load(n, "scores") for n in NAMES]
pd = [load(n, "pd") for n in NAMES]
print(json.dumps({"e5_v2": e5(v2, 0.70), "e5_pd": e5(pd, 0.70)}, indent=1, sort_keys=True))
