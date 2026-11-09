#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""D8b row 8 v2 oracle (standard library only; no engine code): D_est and the M3 v2 bound per event (README readings
1 to 3), and the check of the engine's values.

    python3 -I oracle.py --check dump.json     prints the event count and the worst |difference| (s)
    python3 -I oracle.py --self-test

Dump: {"events": [{"mu0_dbhz", "sigma0_db", "h", "shift_db", "att_db", "stride_s", "windows", "window_s",
"coherent_s", "engine_d_est_s", "engine_bound_s"}]}.
"""
import json
import math
import sys


def m2m4(m2, m4, t):
    d = 2.0 * m2 * m2 - m4
    ps = math.sqrt(d)
    return 10.0 * math.log10(ps / ((m2 - ps) * t))


def reading(mu0, att, frac_windows, windows, t):
    """The noise-free estimate with `frac_windows` of `windows` attenuated by `att` dB."""
    a0 = 10.0 ** (mu0 / 10.0) * t
    a1 = a0 * 10.0 ** (-att / 10.0)
    k = frac_windows
    m2 = ((windows - k) * (a0 + 1.0) + k * (a1 + 1.0)) / windows
    m4 = ((windows - k) * (a0 * a0 + 4 * a0 + 2) + k * (a1 * a1 + 4 * a1 + 2)) / windows
    return m2m4(m2, m4, t)


def arl(k, h, mu):
    b = h + 1.166
    d = mu - k
    if abs(d) < 1e-12:
        return b * b
    return (math.exp(-2.0 * d * b) + 2.0 * d * b - 1.0) / (2.0 * d * d)


def d_est(e):
    """First stride sample after the onset at which the noise-free drop CUSUM exceeds h."""
    s = max(e["sigma0_db"], 0.1)
    k = e["shift_db"] / (2.0 * s)
    per = int(round(e["stride_s"] / e["window_s"]))  # windows entering per stride sample
    g, j = 0.0, 0
    while True:
        j += 1
        n_att = min(j * per, e["windows"])
        c = reading(e["mu0_dbhz"], e["att_db"], n_att, e["windows"], e["coherent_s"])
        z = (c - e["mu0_dbhz"]) / s
        g = max(0.0, g - z - k)
        if g > e["h"]:
            return j * e["stride_s"]
        if n_att == e["windows"] and j * per > 10 * e["windows"]:
            return float("inf")


def bound(e):
    s = max(e["sigma0_db"], 0.1)
    k = e["shift_db"] / (2.0 * s)
    return d_est(e) + 2.0 * arl(k, e["h"], e["att_db"] / s) * e["stride_s"]


def self_test():
    e = {"mu0_dbhz": 45.0, "sigma0_db": 0.3, "h": 5.0, "shift_db": 3.0, "att_db": 6.0, "stride_s": 0.02,
         "windows": 50, "window_s": 0.02, "coherent_s": 0.001}
    # All windows attenuated: the reading is 6 dB down exactly.
    assert abs(reading(45.0, 6.0, 50, 50, 0.001) - 39.0) < 1e-9
    assert abs(reading(45.0, 6.0, 0, 50, 0.001) - 45.0) < 1e-9
    de = d_est(e)
    assert 0.0 < de < 1.0, de
    print("self-test ok; D_est at mu0 45, sigma0 0.3:", de)


if __name__ == "__main__":
    if sys.argv[1:] == ["--self-test"]:
        self_test()
    else:
        d = json.load(open(sys.argv[2]))
        worst = 0.0
        for e in d["events"]:
            worst = max(worst, abs(d_est(e) - e["engine_d_est_s"]), abs(bound(e) - e["engine_bound_s"]))
        print(json.dumps({"events": len(d["events"]), "worst_abs_diff_s": worst}))
