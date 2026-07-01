#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the COPRAS reference utility degrees asserted in
``tests/mcda_copras_reference.rs``.

The oracle is **pyDecision** (https://pypi.org/project/pyDecision/), an independent
third-party Python MCDA library, using its ``copras_method``. pyDecision — not
pymcdm — is used deliberately: pymcdm 1.4.0's ``COPRAS`` collapses algebraically to
the trivial ``Q = S⁺ + S⁻`` and is not a faithful COPRAS reference, whereas
pyDecision implements the canonical relative-significance formula
``Q = S⁺ + (min(S⁻)·ΣS⁻) / (S⁻·Σ(min(S⁻)/S⁻))`` and utility ``U = Q / max(Q)`` —
exactly what Kshana's ``mcda::copras`` implements. Column-sum normalisation,
criterion types ('max'/'min') and weights are fixed here, so the reference is
reproducible offline.

Run:  python3 generate_copras_reference.py
Pinned: pyDecision 5.x (algorithm.copras_method), numpy 2.x. The printed utility
values are the constants hard-coded (with this provenance) in
tests/mcda_copras_reference.rs; Kshana reproduces them to < 1e-9. (Higher is
better; the best alternative has utility exactly 1.)
"""
import numpy as np
from pyDecision.algorithm import copras_method

MATRIX = np.array(
    [
        [250.0, 16.0, 12.0],
        [200.0, 16.0, 8.0],
        [300.0, 32.0, 16.0],
        [275.0, 24.0, 10.0],
    ]
)
CRITERION_TYPE = ["min", "max", "max"]     # price[cost], perf, range
WEIGHTS = np.array([0.40, 0.35, 0.25])     # sum to one


def main():
    # graph=False/verbose=False → no plotting/printing side effects; returns
    # [[alt_index(1-based), utility], ...] in original alternative order.
    flow = copras_method(
        MATRIX, WEIGHTS, CRITERION_TYPE, graph=False, verbose=False
    )
    print("# pyDecision copras_method (higher = better; best = 1.0)")
    print("# matrix rows = alternatives, cols = (price[min], perf[max], range[max])")
    print("# weights = [0.40, 0.35, 0.25]")
    for row in flow:
        i = int(row[0]) - 1
        print(f"utility {i} {row[1]:.15e}")


if __name__ == "__main__":
    main()
