#!/usr/bin/env python3
"""Real onboard-clock data for the clock-state filter consistency oracle.

Input: `gps_iif_clocks.txt`, the extract `scripts/fetch_igs_clocks.sh` makes from 14 days
of IGS final 30 s combined clocks (IGS0OPSFIN_2025229..242, 2025-08-17 to 2025-08-30, each
file SHA-256 checked by that script). One line per record: PRN, seconds since
2025-08-17T00:00:00Z, clock bias (s). GPS Block IIF satellites G03 G06 G08 G09 G10 G24
G25 G26 G27 G30 G32; the active frequency standard is not given by the IGS files.

Per satellite this script:
  1. keeps the epochs at whole multiples of 300 s;
  2. on the FIRST HALF only (t < 7 days): fills missing epochs by linear interpolation (for
     the ADEV estimate only), removes a least-squares quadratic, computes the overlapping
     Allan deviation with allantools 2024.6 at tau = 300 * 2^k s up to 38 400 s, and fits
     sigma_y^2(tau) = 3 R / tau^2 + q_wf / tau + q_rw tau / 3 by non-negative least squares
     (scipy 1.18.1 `optimize.nnls`) on relative residuals;
  3. writes the decimated phase (all 14 days, gaps left as gaps) and the fitted R, q_wf,
     q_rw.

Output `clocks.txt`:
    @<prn> R=<s^2> q_wf=<s^2/s> q_rw=<1/s> first_bias_s=<s>
    <t / 300 s> <increment of (bias - first_bias) since the previous listed epoch, in
                 integer units of 1e-13 s>
The ADEV table used for each fit is written to `adev_first_half.csv`.

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/clock_state_igs_holdout_oracle/generate.py
"""

import hashlib
import os

import allantools
import numpy as np
import scipy
from scipy.optimize import nnls

HERE = os.path.dirname(os.path.abspath(__file__))
ORACLES = os.environ.get("KSHANA_ORACLES", os.path.expanduser("~/Code/kshana-oracles"))
SRC = os.path.join(ORACLES, "data", "realdata", "igs", "gps_iif_clocks.txt")
PRNS = "G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32".split()
STEP = 300
HALF = 7 * 86400
TAUS = [STEP * 2**k for k in range(0, 8)]  # 300 .. 38 400 s
UNIT = 1e-13


def main():
    raw = open(SRC, "rb").read()
    series = {p: {} for p in PRNS}
    for ln in raw.decode().splitlines():
        prn, t, b = ln.split()
        t = int(t)
        if prn in series and t % STEP == 0:
            series[prn][t] = float(b)

    out = [
        f"# IGS final clocks, GPS IIF, decimated to {STEP} s; source extract sha256 "
        f"{hashlib.sha256(raw).hexdigest()}; allantools {allantools.__version__}, scipy {scipy.__version__}\n"
    ]
    adev_rows = ["prn,tau_s,oadev"]
    for prn in PRNS:
        s = series[prn]
        ts = sorted(s)
        b0 = s[ts[0]]
        # First half, for the noise fit only.
        grid = np.arange(0, HALF, STEP)
        have = np.array([t for t in ts if t < HALF], dtype=float)
        vals = np.array([s[int(t)] for t in have])
        x = np.interp(grid, have, vals)
        tt = grid.astype(float)
        x = x - np.polyval(np.polyfit(tt, x, 2), tt)
        taus_out, adev, _, _ = allantools.oadev(x, rate=1.0 / STEP, data_type="phase", taus=np.array(TAUS, float))
        a = np.column_stack([3.0 / taus_out**2, 1.0 / taus_out, taus_out / 3.0])
        y = adev**2
        coef, _ = nnls(a / y[:, None], np.ones_like(y))
        r, q_wf, q_rw = coef
        for tau, d in zip(taus_out, adev):
            adev_rows.append(f"{prn},{tau:.0f},{d:.6e}")
        out.append(f"@{prn} R={r:.6e} q_wf={q_wf:.6e} q_rw={q_rw:.6e} first_bias_s={b0!r}\n")
        prev = 0
        for t in ts:
            v = round((s[t] - b0) / UNIT)
            out.append(f"{t // STEP} {v - prev}\n")
            prev = v
        print(f"{prn}: n={len(ts)} R={r:.3e} q_wf={q_wf:.3e} q_rw={q_rw:.3e}")
    open(os.path.join(HERE, "clocks.txt"), "w").write("".join(out))
    open(os.path.join(HERE, "adev_first_half.csv"), "w").write("\n".join(adev_rows) + "\n")


if __name__ == "__main__":
    main()
