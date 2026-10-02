#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Inputs and oracle values for tests/clock_library_lag1_noise_id_allantools.rs.

Generates ten Kasdin power-law phase records with allantools (b = 0, -1, -2, -3, -4; numpy
seeds 1 and 2; 2048 samples; qd = 1e-20) into records.txt, then runs allantools
autocorr_noise_id (dmin=0, dmax=2) on every record as phase data and on its first difference
as frequency data at af = 1, 2, 4, 8, 16, 32, 64, writing oracle.txt. allantools is run as a
separate program (LGPL-3.0-or-later); no allantools code is copied into the repository.

Usage (oracle virtual environment): python3 generate.py
"""
from pathlib import Path

import numpy as np
import allantools
from allantools import noise_kasdin

HERE = Path(__file__).resolve().parent
N = 2048
BS = [0, -1, -2, -3, -4]
SEEDS = [1, 2]
AFS = [1, 2, 4, 8, 16, 32, 64]


def main():
    recs = []
    for b in BS:
        for seed in SEEDS:
            np.random.seed(seed)
            g = noise_kasdin.Noise(N, 1e-20, b)
            g.generateNoise()
            x = np.asarray(g.time_series[:N], dtype=float)
            recs.append((f"b{b}_s{seed}", x))
    with open(HERE / "records.txt", "w") as f:
        f.write(f"# allantools {allantools.__version__} noise_kasdin, numpy {np.__version__}\n")
        for name, x in recs:
            f.write(f"@{name}\n")
            for v in x:
                f.write(f"{v!r}\n")
    with open(HERE / "oracle.txt", "w") as f:
        f.write(f"# allantools {allantools.__version__} autocorr_noise_id(x, af, type, dmin=0, dmax=2)\n")
        f.write("# record type af alpha_int alpha d rho\n")
        for name, x in recs:
            for dtype, data in (("phase", x), ("freq", np.diff(x))):
                for af in AFS:
                    ai, a, d, rho = allantools.autocorr_noise_id(data, af, data_type=dtype, dmin=0, dmax=2)
                    f.write(f"{name} {dtype} {af} {int(ai)} {float(a)!r} {int(d)} {float(rho)!r}\n")


if __name__ == "__main__":
    main()
