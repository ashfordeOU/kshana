#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the Weighted-Sum-Model reference scores asserted in
``tests/mcda_wsm_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent,
widely-used third-party Python MCDA library, with its ``WSM`` method composed with
its ``minmax_normalization`` — exactly the normalisation + aggregation Kshana's
``mcda::wsm`` implements. The decision matrix, criterion types (1 = benefit,
-1 = cost) and weights below are fixed in this script, so the whole reference is
reproducible offline.

Run:  python3 generate_wsm_reference.py
Pinned: pymcdm 1.x, numpy 2.x, Python 3.x. The printed numbers are the constants
hard-coded (with this provenance) in tests/mcda_wsm_reference.rs; Kshana reproduces
them to < 1e-9 with no third-party code.
"""
import numpy as np
from pymcdm.methods import WSM
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
    wsm = WSM(normalization_function=norm.minmax_normalization)
    scores = wsm(MATRIX, WEIGHTS, TYPES)
    ranks = wsm.rank(scores)  # 1 = best
    print("# pymcdm WSM + minmax_normalization")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(scores):
        print(f"score {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
