#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""M002 round 3: tune the extended filter on the first half of the CONDITIONED records.

Reads conditioned.txt (written by the Rust pipeline step
tests/clock_state_ext_igs_conditioned_oracle.rs::write_conditioned_300s), tunes theta =
log10(R, q_wf, h_-1, q_rw, q_h) per satellite with the ROUND-2 likelihood, start point and
Nelder-Mead options imported unchanged from
tests/fixtures/clock_state_ext_igs_fresh_oracle/generate.py, and writes clocks.txt in the
round-2 format. Committed with the pre-registration, before it was first run.
"""
import os
import sys

import numpy as np
import scipy
from scipy.optimize import minimize

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "clock_state_ext_igs_fresh_oracle"))
import generate as r2  # noqa: E402  (round-2 model and likelihood)

UNIT = 1e-13


def read(path):
    sats, cur = [], None
    for ln in open(path):
        if ln.startswith("#"):
            continue
        if ln.startswith("@"):
            f = ln[1:].split()
            cur = {"prn": f[0], "base": float(f[1].split("=")[1]), "k": [], "d": []}
            sats.append(cur)
            continue
        k, d = ln.split()
        cur["k"].append(int(k))
        cur["d"].append(int(d))
    return sats


def main():
    out = [f"# IGS final clocks 2026-04-01..14, GPS IIF, 300 s, conditioned; scipy {scipy.__version__}, numpy {np.__version__}\n"]
    rows = ["prn,n_first_half,n_second_half,log10_R,log10_q_wf,log10_h_m1,log10_q_rw,log10_q_h,nll,nfev"]
    for s in read(os.path.join(HERE, "conditioned.txt")):
        ts = np.array(s["k"], float) * r2.STEP
        z = np.cumsum(np.array(s["d"], float)) * UNIT
        n1 = int((ts < r2.HALF).sum())
        res = minimize(r2.nll, r2.THETA0, args=(ts, z), method="Nelder-Mead",
                       options=dict(xatol=0.02, fatol=0.05, maxfev=1500))
        th = 10.0 ** res.x
        out.append(f"@{s['prn']} R={th[0]:.6e} q_wf={th[1]:.6e} h_m1={th[2]:.6e} q_rw={th[3]:.6e} "
                   f"q_h={th[4]:.6e} first_bias_s={s['base']!r} nll={res.fun:.4f}\n")
        out.extend(f"{k} {d}\n" for k, d in zip(s["k"], s["d"]))
        rows.append(f"{s['prn']},{n1},{len(ts) - n1}," + ",".join(f"{v:.4f}" for v in res.x)
                    + f",{res.fun:.4f},{res.nfev}")
        print(s["prn"], np.round(res.x, 3), res.nfev, flush=True)
    open(os.path.join(HERE, "clocks.txt"), "w").write("".join(out))
    open(os.path.join(HERE, "ml_fit.csv"), "w").write("\n".join(rows) + "\n")


if __name__ == "__main__":
    main()
