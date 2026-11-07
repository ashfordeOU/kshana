# SPDX-License-Identifier: AGPL-3.0-only
"""B8: the measured disturbance label, independent of the engine (pre-registration section 3). numpy and the
Python standard library only; shares no code with Kshana.

Per satellite, slant TEC from the geometry-free carrier-phase combination; ROT = its 30 s difference in
TECU/min; a jump over 1 TECU in 30 s (a cycle slip) or a data gap resets the arc; ROTI = the standard deviation
of ROT over each 5-minute window of the hour. The station-hour value ROTI_h is the 90th percentile over
satellites and windows, and the label y = 1 when ROTI_h >= 0.5 TECU/min.

This file holds the computation on TEC series; the RINEX reading and the elevation mask are added in the step
that fetches the observation files (section 5), before any label is computed.

    python3 -I xval/env-baseline/roti.py --self-test
"""
import math
import sys

import numpy as np

F1, F2 = 1575.42e6, 1227.60e6
C = 299792458.0
K = 40.3082
SLIP_TECU = 1.0
STEP_S = 30.0
WINDOW_S = 300.0
MIN_ROT_PER_WINDOW = 5
LABEL_THRESHOLD = 0.5


def tec_from_phase(l1_cycles, l2_cycles):
    """Relative slant TEC (TECU) from L1 and L2 carrier phase in cycles (geometry-free combination)."""
    l1m = np.asarray(l1_cycles) * (C / F1)
    l2m = np.asarray(l2_cycles) * (C / F2)
    return (l1m - l2m) * (F1**2 * F2**2) / (K * (F1**2 - F2**2)) / 1e16


def rot_series(t_s, tec):
    """ROT (TECU/min) between consecutive 30 s epochs of one arc; a gap or a slip ends the arc. Returns
    (t_mid_s, rot) for the differences kept."""
    t = np.asarray(t_s, dtype=float)
    v = np.asarray(tec, dtype=float)
    out_t, out_r = [], []
    for i in range(1, len(t)):
        dt = t[i] - t[i - 1]
        dv = v[i] - v[i - 1]
        if abs(dt - STEP_S) > 1e-6 or abs(dv) > SLIP_TECU or not math.isfinite(dv):
            continue
        out_t.append(t[i])
        out_r.append(dv / (dt / 60.0))
    return np.array(out_t), np.array(out_r)


def roti_windows(t_rot, rot, hour_start_s):
    """ROTI (TECU/min) per 5-minute window of the hour starting at hour_start_s; windows with fewer than
    MIN_ROT_PER_WINDOW ROT values are left out."""
    out = []
    for w in range(int(3600 / WINDOW_S)):
        a = hour_start_s + w * WINDOW_S
        m = (t_rot > a) & (t_rot <= a + WINDOW_S)
        if m.sum() >= MIN_ROT_PER_WINDOW:
            out.append(float(np.std(rot[m])))
    return out


def roti_hour(per_sat_windows):
    """ROTI_h: the 90th percentile (linear interpolation) over all satellites' windows."""
    vals = [x for ws in per_sat_windows for x in ws]
    if not vals:
        return None
    return float(np.percentile(vals, 90))


def label(roti_h):
    return None if roti_h is None else int(roti_h >= LABEL_THRESHOLD)


def self_test():
    rng = np.random.default_rng(0xB8)
    t = np.arange(0, 3600 + 1, STEP_S)
    # 1. A smooth TEC (a slow trend) has ROTI near zero: label 0.
    smooth = 20.0 + 0.002 * t
    tr, r = rot_series(t, smooth)
    w = roti_windows(tr, r, 0.0)
    assert len(w) == 12 and max(w) < 1e-9, w
    # 2. White ROT of known standard deviation: ROTI recovers it.
    sigma = 0.8
    rot_true = rng.normal(0.0, sigma, len(t) - 1)
    tec = np.concatenate([[30.0], 30.0 + np.cumsum(rot_true * (STEP_S / 60.0))])
    tr, r = rot_series(t, tec)
    kept = rot_true[np.abs(rot_true * (STEP_S / 60.0)) <= SLIP_TECU]
    assert np.allclose(r, kept), "ROT recovers the injected values (steps over 1 TECU are slips)"
    w = roti_windows(tr, r, 0.0)
    assert abs(np.mean(w) - sigma) < 0.12, np.mean(w)
    assert label(roti_hour([w])) == 1
    # 3. A slip (a jump of 5 TECU) is not counted as ROT.
    jumped = smooth.copy()
    jumped[60:] += 5.0
    tr, r = rot_series(t, jumped)
    assert len(r) == len(t) - 2 and np.max(np.abs(r - 0.12)) < 1e-9, "the slip is dropped; the trend (0.12 TECU/min) stays"
    # 4. Geometry-free TEC: phases built from a known TEC give it back.
    tec_true = 25.0
    i1 = K * tec_true * 1e16 / F1**2
    i2 = K * tec_true * 1e16 / F2**2
    rho = 2.2e7
    l1 = (rho - i1) / (C / F1)
    l2 = (rho - i2) / (C / F2)
    assert abs(float(tec_from_phase(l1, l2)) - tec_true) < 1e-6
    # 5. The station-hour is the 90th percentile.
    assert abs(roti_hour([[0.1, 0.2], [0.3, 1.0]]) - float(np.percentile([0.1, 0.2, 0.3, 1.0], 90))) < 1e-15
    print("roti.py self-test: ok")


if __name__ == "__main__":
    if sys.argv[1:] == ["--self-test"]:
        self_test()
    else:
        sys.exit(__doc__)
