#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""D8a row 6 scoring rule (README reading 5), run once after every batch is in.

    python3 -I score.py raw

Reads raw/batch-*.jsonl (fits) and raw/truth-*.jsonl (truths) and prints the verdicts. Standard
library only. Fit lines: {"kind": "a"|"b", "set": "seen"|"fresh", "seed", "lag_s", "delta_eff",
"ci95": [lo, hi], and for kind "a": "c": {"bins", "tracking_loop", "empirical"} coverages,
"d": {"tracking_loop": [closed, direct], "empirical": [closed, direct]}}. Truth lines: {"seed",
"delta_eff"}.
"""
import glob
import json
import os
import sys

LAG = 0.5


def load(pattern):
    out = []
    for p in sorted(glob.glob(pattern)):
        out += [json.loads(l) for l in open(p) if l.strip()]
    return out


def main(d):
    fits = load(os.path.join(d, "batch-*.jsonl"))
    truth = {t["seed"]: t["delta_eff"] for t in load(os.path.join(d, "truth-*.jsonl"))}
    res = {}
    for s in ("seen", "fresh"):
        a = [f for f in fits if f["kind"] == "a" and f["set"] == s and f["lag_s"] == LAG]
        b = [f for f in fits if f["kind"] == "b" and f["set"] == s and f["lag_s"] == LAG]
        assert len(a) == 1 and len(b) == 50, (s, len(a), len(b))
        a = a[0]
        err = a["delta_eff"] - truth[a["seed"]]
        cov = sum(1 for f in b if f["ci95"][0] <= truth[f["seed"]] <= f["ci95"][1])
        c_ok = all(0.80 <= a["c"][k] <= 0.98 for k in ("bins", "tracking_loop", "empirical"))
        d_gap = {k: abs(v[0] - v[1]) for k, v in a["d"].items()}
        res[s] = {"a_prime_error_db": err, "a_prime": abs(err) <= 0.5,
                  "b_prime_covered": cov, "b_prime": cov >= 45,
                  "c": a["c"], "c_ok": c_ok, "d_gap_db": d_gap, "d": all(g <= 1.0 for g in d_gap.values())}
    res["met_on_re_run"] = all(res[s][k] for s in ("seen", "fresh") for k in ("a_prime", "b_prime", "c_ok", "d"))
    print(json.dumps(res, indent=1))


if __name__ == "__main__":
    main(sys.argv[1])
