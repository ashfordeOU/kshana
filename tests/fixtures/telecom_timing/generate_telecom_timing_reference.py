#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate ``allantools_reference.json`` for ``tests/telecom_timing_reference.rs``.

The oracle is **allantools** (https://pypi.org/project/AllanTools/), an independent
third-party frequency-stability library. It computes the maximum time interval error
(MTIE) and the time deviation (TDEV) of ``holdover_te_series.csv`` — a 2 048-sample,
one-second, chip-scale-atomic-clock holdover series written once by the engine — at the
averaging factors the ``telecom-timing`` kind reports on (1, 2, 3, 5, 7 per decade, plus
the whole record for MTIE; TDEV only where the record is at least twelve times tau long).

MTIE(m) is the largest peak-to-peak value in any window of m + 1 samples; TDEV is
tau/sqrt(3) times the modified Allan deviation. Both are uniquely defined estimators,
so a correct implementation must agree with allantools to floating-point rounding.

Run from this directory:  python3 generate_telecom_timing_reference.py
Pinned: allantools 2024.06, numpy 2.x. The series is parsed as written (17 significant
figures), so both sides start from identical doubles.
"""
import hashlib
import json
import struct

import allantools as at
import numpy as np


def grid(max_m):
    out, decade = [], 1
    while True:
        for k in (1, 2, 3, 5, 7):
            m = k * decade
            if m > max_m:
                if not out or out[-1] != max_m:
                    out.append(max_m)
                return out
            out.append(m)
        decade *= 10


def main():
    rows = [
        line.split(",")
        for line in open("holdover_te_series.csv")
        if line.strip() and not line.startswith("#") and not line.startswith("time_s")
    ]
    x = np.array([float(r[1]) for r in rows])
    n = len(x)
    sha = hashlib.sha256(b"".join(struct.pack("<d", v) for v in x)).hexdigest()

    mtie_m = grid(n - 1)
    t_used, mtie, _e, _n = at.mtie(x, rate=1.0, data_type="phase", taus=np.array(mtie_m, float))
    tdev_m = [m for m in grid((n - 1) // 12) if n > 3 * m]
    t_used2, tdev, _e2, _n2 = at.tdev(x, rate=1.0, data_type="phase", taus=np.array(tdev_m, float))

    doc = {
        "oracle": f"allantools {at.__version__}, numpy {np.__version__}",
        "series": "holdover_te_series.csv",
        "n_samples": n,
        "series_sha256": sha,
        "tau0_s": 1.0,
        "mtie": [{"m": int(round(t)), "value_ns": float(v)} for t, v in zip(t_used, mtie)],
        "tdev": [{"m": int(round(t)), "value_ns": float(v)} for t, v in zip(t_used2, tdev)],
    }
    with open("allantools_reference.json", "w") as f:
        json.dump(doc, f, indent=1)
        f.write("\n")
    print(f"wrote {len(doc['mtie'])} MTIE and {len(doc['tdev'])} TDEV points")


if __name__ == "__main__":
    main()
