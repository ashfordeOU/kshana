#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the MOORA (ratio system) reference scores asserted in
``tests/mcda_moora_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent
third-party Python MCDA library, using its ``MOORA`` method — vector (L2)
normalisation `n = x / √Σx²` followed by the weighted benefit total minus the
weighted cost total, exactly what Kshana's ``mcda::moora`` implements. The matrix,
criterion types (1 = benefit, -1 = cost) and weights are fixed here, so the
reference is reproducible offline. (pymcdm requires ≥1 cost criterion; the fixture
supplies one.)

Run:  python3 generate_moora_reference.py
Pinned: pymcdm 1.4.0 (methods.MOORA), numpy 2.x. The printed scores are the
constants hard-coded (with this provenance) in tests/mcda_moora_reference.rs;
Kshana reproduces them to < 1e-9. (Higher is better; scores are signed.)
"""
import numpy as np
from pymcdm.methods import MOORA

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
    moora = MOORA()
    scores = moora(MATRIX, WEIGHTS, TYPES)
    ranks = moora.rank(scores)  # 1 = best
    print("# pymcdm MOORA ratio system, vector normalization (higher = better)")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(scores):
        print(f"score {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
