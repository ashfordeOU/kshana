#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the Weighted-Product-Model reference scores asserted in
``tests/mcda_wpm_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent
third-party Python MCDA library, using its ``WPM`` method with its default
``sum_normalization`` — exactly the reciprocal-for-cost sum normalisation and
weighted-product aggregation Kshana's ``mcda::wpm`` implements. The matrix,
criterion types (1 = benefit, -1 = cost) and weights are fixed here, so the
reference is reproducible offline.

Run:  python3 generate_wpm_reference.py
Pinned: pymcdm (methods.WPM + normalizations.sum_normalization), numpy 2.x. The
printed scores are the constants hard-coded (with this provenance) in
tests/mcda_wpm_reference.rs; Kshana reproduces them to < 1e-9. (Higher is better.)
"""
import numpy as np
from pymcdm.methods import WPM
from pymcdm import normalizations as norm

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
    wpm = WPM(normalization_function=norm.sum_normalization)
    scores = wpm(MATRIX, WEIGHTS, TYPES)
    ranks = wpm.rank(scores)  # 1 = best
    print("# pymcdm WPM + sum_normalization (higher = better)")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(scores):
        print(f"score {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
