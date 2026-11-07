# SPDX-License-Identifier: AGPL-3.0-only
"""B5 T3: pool the per-run files written by `tests/area_trust_igs.rs` (t3_end_to_end_latency_run) and score
them against the bar (reading 17): on each path, the 95th percentile of the event latencies <= 5 s and the
maximum <= 10 s, over at least 200 events; an event without its alert on a path is a miss (infinite).

    python3 -I xval/area-trust/t3_pool.py <dir> [runs...] > t3_result.json
"""
import json
import math
import os
import sys


def p95(v):
    # Linear interpolation between order statistics, as `area_trust::h_s` reads a percentile.
    s = sorted(v)
    pos = (len(s) - 1) * 0.95
    lo = math.floor(pos)
    hi = min(lo + 1, len(s) - 1)
    if math.isinf(s[hi]) or math.isinf(s[lo]):
        return math.inf if pos > lo or math.isinf(s[lo]) else s[lo]
    return s[lo] + (s[hi] - s[lo]) * (pos - lo)


def main():
    d = sys.argv[1]
    runs = sys.argv[2:] or ["0", "1", "2", "3"]
    events, meta = [], []
    for r in runs:
        with open(os.path.join(d, f"t3_run_{r}.json")) as f:
            j = json.load(f)
        meta.append({k: v for k, v in j.items() if k != "events"})
        events += [dict(e, run=int(r)) for e in j["events"]]
    out = {"runs": meta, "events": len(events)}
    met = len(events) >= 200
    for path in ("webhook", "mqtt"):
        lat = [e[f"latency_{path}_s"] if e[f"latency_{path}_s"] is not None else math.inf for e in events]
        missed = sum(1 for x in lat if math.isinf(x))
        finite = sorted(x for x in lat if not math.isinf(x))
        q = p95(lat)
        mx = max(lat)
        ok = q <= 5.0 and mx <= 10.0
        met = met and ok
        out[path] = {
            "missed": missed,
            "median_s": finite[len(finite) // 2] if finite else None,
            "p95_s": None if math.isinf(q) else q,
            "max_s": None if math.isinf(mx) else mx,
            "pass": ok,
        }
    out["verdict"] = "MET" if met else "NOT MET"
    json.dump(out, sys.stdout, indent=1)
    sys.stdout.write("\n")


if __name__ == "__main__":
    main()
