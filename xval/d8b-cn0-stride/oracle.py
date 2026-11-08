# SPDX-License-Identifier: AGPL-3.0-only
"""D8b row 8 oracle: the M3 timing clause from the engine's dump of detected C/N0 drops.

    python3 -I oracle.py dump.json        (prints {"events", "median_ttd_s", "median_bound_s", "diffs"})
    python3 -I oracle.py --self-test

The dump: {"events": [{"ttd_s", "sigma0_db", "h", "dt_s"}], "median_ttd_s", "median_bound_s"} (engine values).
Standard library only; no engine code. Siegmund's approximation as in README reading 6.
"""
import json
import math
import sys

ATT_DB, SHIFT_DB = 6.0, 3.0


def arl(k, h, mu):
    b = h + 1.166
    d = mu - k
    if abs(d) < 1e-12:
        return b * b
    return (math.exp(-2.0 * d * b) + 2.0 * d * b - 1.0) / (2.0 * d * d)


def bound(sigma0, h, dt):
    s = max(sigma0, 0.1)
    return 2.0 * arl(SHIFT_DB / (2.0 * s), h, ATT_DB / s) * dt


def upper_median(v):
    v = sorted(v)
    return v[len(v) // 2] if v else float("nan")


def check(dump):
    ev = dump["events"]
    mt = upper_median([e["ttd_s"] for e in ev])
    mb = upper_median([bound(e["sigma0_db"], e["h"], e["dt_s"]) for e in ev])
    return {"events": len(ev), "median_ttd_s": mt, "median_bound_s": mb,
            "diffs": [abs(mt - dump["median_ttd_s"]), abs(mb - dump["median_bound_s"])]}


def self_test():
    # Delta = 0: b^2.
    assert abs(arl(1.0, 5.0, 1.0) - 6.166 ** 2) < 1e-12
    # In control (mu = 0), k = 0.5, h = 5: (e^{2kb} - 2kb - 1)/(2k^2).
    b = 6.166
    assert abs(arl(0.5, 5.0, 0.0) - (math.exp(b) - b - 1.0) / 0.5) < 1e-9
    assert upper_median([3, 1, 2, 4]) == 3
    print("self-test ok")


if __name__ == "__main__":
    if sys.argv[1:] == ["--self-test"]:
        self_test()
    else:
        print(json.dumps(check(json.load(open(sys.argv[1])))))
