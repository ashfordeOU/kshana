#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the WASPAS reference preferences asserted in
``tests/mcda_waspas_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent
third-party Python MCDA library, using its ``WASPAS`` method with its default
``linear_normalization`` and blend ``l = 0.5`` — exactly the
`P = 0.5·Σ(n·w) + 0.5·Π(n^w)` over max-normalised values that Kshana's
``mcda::waspas`` implements. The matrix, criterion types (1 = benefit, -1 = cost)
and weights are fixed here, so the reference is reproducible offline.

Run:  python3 generate_waspas_reference.py
Pinned: pymcdm 1.4.0 (methods.WASPAS + normalizations.linear_normalization,
l=0.5), numpy 2.x. The printed scores are the constants hard-coded (with this
provenance) in tests/mcda_waspas_reference.rs; Kshana reproduces them to < 1e-9.
(Higher is better.)
"""
import numpy as np
from pymcdm.methods import WASPAS

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
    waspas = WASPAS()  # default: linear_normalization, l = 0.5
    scores = waspas(MATRIX, WEIGHTS, TYPES)
    ranks = waspas.rank(scores)  # 1 = best
    print("# pymcdm WASPAS + linear_normalization, l=0.5 (higher = better)")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(scores):
        print(f"score {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
