#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the TOPSIS reference closeness coefficients asserted in
``tests/mcda_topsis_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent,
widely-used third-party Python MCDA library, using its ``TOPSIS`` method with its
default ``minmax_normalization`` — exactly the normalisation + ideal-solution
aggregation Kshana's ``mcda::topsis`` implements. The decision matrix, criterion
types (1 = benefit, -1 = cost) and weights below are fixed here, so the whole
reference is reproducible offline with no Kshana code in the loop.

Run:  python3 generate_topsis_reference.py
Pinned: pymcdm (methods.TOPSIS + normalizations.minmax_normalization), numpy 2.x.
The printed coefficients are the constants hard-coded (with this provenance) in
tests/mcda_topsis_reference.rs; Kshana reproduces them to < 1e-9.
"""
import numpy as np
from pymcdm.methods import TOPSIS
from pymcdm import normalizations as norm

# alternatives (rows) x criteria (cols): (price[cost], performance, range)
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
    topsis = TOPSIS(normalization_function=norm.minmax_normalization)
    pref = topsis(MATRIX, WEIGHTS, TYPES)
    ranks = topsis.rank(pref)  # 1 = best
    print("# pymcdm TOPSIS + minmax_normalization")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(pref):
        print(f"closeness {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
