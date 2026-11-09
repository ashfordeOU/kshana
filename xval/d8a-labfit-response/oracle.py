#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""D8a row 6 v2 oracle (standard library only; no engine code): the M2M4 estimator's modelled reading of a C/N0 bin
(README reading 1), and the check of the engine's values.

    python3 -I oracle.py --check raw/oracle-dump-01.json    prints only the bin count and the worst |difference| (dB)
    python3 -I oracle.py --self-test

Dump: {"windows", "window_s", "coherent_s", "chip_rate_hz", "bins": [{"profile": {"interp", "points": [[t, js_db]]},
"onset_s", "offset_s", "js_db", "c0_dbhz", "q", "delta_db", "engine_dbhz"}]}.
"""
import json
import math
import sys


def js_at(prof, t):
    pts = prof["points"]
    if t <= pts[0][0]:
        return pts[0][1]
    for (t0, v0), (t1, v1) in zip(pts, pts[1:]):
        if t < t1:
            if prof["interp"] == "step":
                return v0
            return v0 + (v1 - v0) * (t - t0) / (t1 - t0) if t1 > t0 else v1
    return pts[-1][1]


def bin_time(prof, onset, offset, js):
    if prof["interp"] == "step":
        return None
    knots = [onset] + [p[0] for p in prof["points"] if onset < p[0] < offset] + [offset]
    for t0, t1 in zip(knots, knots[1:]):
        j0, j1 = js_at(prof, t0), js_at(prof, t1)
        if min(j0, j1) <= js <= max(j0, j1):
            # A level reached on a held (flat) segment is read as settled: no lag.
            return None if j1 == j0 else t0 + (t1 - t0) * (js - j0) / (j1 - j0)
    return None


def model_cn0(c0, js, q, delta, rc):
    lin = lambda x: 10.0 ** (x / 10.0)
    return -10.0 * math.log10(1.0 / lin(c0) + lin(js + delta) / (q * rc))


def reading(b, d):
    tb = bin_time(b["profile"], b["onset_s"], b["offset_s"], b["js_db"])
    m2 = m4 = 0.0
    for k in range(d["windows"]):
        if tb is None:
            c = model_cn0(b["c0_dbhz"], b["js_db"], b["q"], b["delta_db"], d["chip_rate_hz"])
        else:
            t = tb - (k + 0.5) * d["window_s"]
            c = b["c0_dbhz"] if t < b["onset_s"] else model_cn0(
                b["c0_dbhz"], js_at(b["profile"], t), b["q"], b["delta_db"], d["chip_rate_hz"])
        a2 = 10.0 ** (c / 10.0) * d["coherent_s"]
        m2 += a2 + 1.0
        m4 += a2 * a2 + 4.0 * a2 + 2.0
    m2 /= d["windows"]
    m4 /= d["windows"]
    ps = math.sqrt(2.0 * m2 * m2 - m4)
    return 10.0 * math.log10(ps / ((m2 - ps) * d["coherent_s"]))


def self_test():
    d = {"windows": 50, "window_s": 0.02, "coherent_s": 0.001, "chip_rate_hz": 1.023e6}
    held = {"profile": {"interp": "linear", "points": [[0.0, 20.0], [100.0, 20.0]]}, "onset_s": 0.0,
            "offset_s": 100.0, "js_db": 20.0, "c0_dbhz": 45.0, "q": 2.0, "delta_db": 0.0}
    # Held J/S: the reading is the model itself (the moments are exact).
    assert abs(reading(held, d) - model_cn0(45.0, 20.0, 2.0, 0.0, 1.023e6)) < 1e-9
    ramp = dict(held, profile={"interp": "linear", "points": [[3.0, 0.0], [15.0, 45.0]]}, onset_s=3.0,
                offset_s=16.0, js_db=30.0)
    # On a rising ramp the reading lies above the model at the bin's J/S (it lags).
    assert reading(ramp, d) > model_cn0(45.0, 30.0, 2.0, 0.0, 1.023e6)
    print("self-test ok")


if __name__ == "__main__":
    if sys.argv[1:] == ["--self-test"]:
        self_test()
    else:
        d = json.load(open(sys.argv[2]))
        worst = max(abs(reading(b, d) - b["engine_dbhz"]) for b in d["bins"])
        print(json.dumps({"bins": len(d["bins"]), "worst_abs_diff_db": worst}))
