#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the VIKOR reference S/R/Q values asserted in
``tests/mcda_vikor_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent
third-party Python MCDA library, using its ``VIKOR`` method with the conventional
consensus strategy weight ``v = 0.5`` and no pre-normalisation (the method's own
range normalisation of the per-criterion regrets) — exactly what Kshana's
``mcda::vikor`` implements. The matrix, criterion types (1 = benefit, -1 = cost)
and weights are fixed here, so the reference is reproducible offline.

Run:  python3 generate_vikor_reference.py
Pinned: pymcdm (methods.VIKOR), numpy 2.x. The printed Q values are the constants
hard-coded (with this provenance) in tests/mcda_vikor_reference.rs; Kshana
reproduces them to < 1e-9. (pymcdm exposes Q as the aggregate preference; lower is
better.)
"""
import numpy as np
from pymcdm.methods import VIKOR

MATRIX = np.array(
    [
        [250.0, 16.0, 12.0],
        [200.0, 16.0, 8.0],
        [300.0, 32.0, 16.0],
        [275.0, 24.0, 10.0],
    ]
)
TYPES = np.array([-1, 1, 1])              # cost, benefit, benefit
WEIGHTS = np.array([0.40, 0.35, 0.25])    # sum to one


def main():
    vikor = VIKOR(v=0.5)
    q = vikor(MATRIX, WEIGHTS, TYPES)
    ranks = vikor.rank(q)  # 1 = best (lowest Q)
    print("# pymcdm VIKOR v=0.5 (Q aggregate, lower = better)")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(q):
        print(f"Q {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
