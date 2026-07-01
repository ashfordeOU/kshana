#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the PROMETHEE II reference net-flow values asserted in
``tests/mcda_promethee_reference.rs``.

The oracle is **pymcdm** (https://pypi.org/project/pymcdm/), an independent
third-party Python MCDA library, using its ``PROMETHEE_II`` method with the
**usual** (Type I) preference function on every criterion — exactly the outranking
net-flow computation Kshana's ``mcda::promethee`` implements for
``PreferenceFunction::Usual``. The matrix, criterion types (1 = benefit, -1 = cost)
and weights are fixed here, so the reference is reproducible offline.

Run:  python3 generate_promethee_reference.py
Pinned: pymcdm (methods.PROMETHEE_II), numpy 2.x. The printed net flows are the
constants hard-coded (with this provenance) in tests/mcda_promethee_reference.rs;
Kshana reproduces them to < 1e-9. (Higher net flow is better.)
"""
import numpy as np
from pymcdm.methods import PROMETHEE_II

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
    promethee = PROMETHEE_II("usual")
    flow = promethee(MATRIX, WEIGHTS, TYPES)
    ranks = promethee.rank(flow)  # 1 = best (highest net flow)
    print("# pymcdm PROMETHEE_II('usual') net outranking flow (higher = better)")
    print("# matrix rows = alternatives, cols = (price[cost], perf, range)")
    print("# weights = [0.40, 0.35, 0.25]; types = [cost, benefit, benefit]")
    for i, s in enumerate(flow):
        print(f"netflow {i} {s:.15e}")
    print("# rank position (1 = best):")
    for i, r in enumerate(ranks):
        print(f"rank {i} {int(round(r))}")


if __name__ == "__main__":
    main()
