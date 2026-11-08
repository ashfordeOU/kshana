# SPDX-License-Identifier: AGPL-3.0-only
"""D8b row 9 oracle: restarted CUSUM window maxima and the window-level AUC, from the engine's dump.

    python3 -I oracle.py dump.json        (prints {"windows_checked", "worst_abs_diff", "auc"})
    python3 -I oracle.py --self-test

The dump: {"cells": [{"series" (optional; without it the window maxima are taken as given and only
the AUC is checked): {channel: [[t, g], ...]}, "windows": [{"channel", "t0_s", "t1_s",
"event_id" (null for a negative), "max"}]}], "auc": engine AUC}. Standard library only; no engine code.
"""
import json
import sys


def restarted_max(series, t0, t1):
    """Largest g' over [t0, t1], restarting from zero at t0 (README reading 1)."""
    prev_g, g_r, best = 0.0, 0.0, None
    for t, g in series:
        if t < t0:
            prev_g = g
            continue
        if t > t1:
            break
        g_r = max(0.0, g_r + g - prev_g) if g > 0.0 else 0.0
        prev_g = g
        best = g_r if best is None else max(best, g_r)
    return best


def auc(pos, neg):
    """Trapezoidal area under the empirical ROC = P(pos > neg) + 0.5 P(pos == neg)."""
    if not pos or not neg:
        return None
    s = 0.0
    for p in pos:
        for n in neg:
            s += 1.0 if p > n else 0.5 if p == n else 0.0
    return s / (len(pos) * len(neg))


def check(dump):
    worst, n, pos, neg = 0.0, 0, [], []
    for cell in dump["cells"]:
        for w in cell["windows"]:
            series = cell.get("series", {}).get(w["channel"])
            m = w["max"] if series is None else restarted_max(series, w["t0_s"], w["t1_s"])
            worst = max(worst, abs(m - w["max"]))
            n += 1
            (pos if w["event_id"] is not None else neg).append(m)
    a = auc(pos, neg)
    return {"windows_checked": n, "worst_abs_diff": worst, "auc": a,
            "auc_diff": None if a is None else abs(a - dump["auc"])}


def self_test():
    s = [[0, 0.0], [1, 2.0], [2, 5.0], [3, 4.0], [4, 0.0], [5, 1.0], [6, 3.0]]
    # Restart at t=3: g'_3 = max(0, 0 + 4 - 5) = 0, g'_4 = 0, g'_5 = 1, g'_6 = 3.
    assert restarted_max(s, 3, 6) == 3.0
    # Restart at t=2: g'_2 = 5 - 2 = 3, g'_3 = 2, then 0, 1, 3.
    assert restarted_max(s, 2, 3) == 3.0
    # From the start, the series itself.
    assert restarted_max(s, 0, 6) == 5.0
    assert auc([3, 2], [1, 2]) == 0.875
    print("self-test ok")


if __name__ == "__main__":
    if sys.argv[1:] == ["--self-test"]:
        self_test()
    else:
        print(json.dumps(check(json.load(open(sys.argv[1])))))
