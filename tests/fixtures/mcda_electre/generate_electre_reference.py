#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the ELECTRE I reference matrices asserted in
``tests/mcda_electre_reference.rs``.

The oracle is **pyDecision** (https://pypi.org/project/pyDecision/), an independent
third-party Python multi-criteria decision library (Valdecy Pereira), using its
``electre_i`` — exactly the all-benefit, sum-normalised-weight concordance /
discordance / dominance / kernel convention Kshana's ``mcda::electre`` implements
(single global discordance scale Δ = maxₖ(maxᵢ xᵢₖ − minᵢ xᵢₖ)). The dataset,
weights and thresholds are fixed here, so the reference is reproducible offline.

Run:  python3 generate_electre_reference.py
Pinned: pyDecision (algorithm.electre_i), numpy 2.x. The printed matrices are the
constants hard-coded (with this provenance) in tests/mcda_electre_reference.rs;
Kshana reproduces them element-for-element to < 1e-9.
"""
import numpy as np
from pyDecision.algorithm import electre_i

# All-benefit, commensurate-scale dataset (rows = alternatives, cols = criteria).
DATASET = np.array(
    [
        [0.80, 0.60, 0.90],
        [0.70, 0.90, 0.50],
        [0.50, 0.80, 0.70],
        [0.90, 0.40, 0.60],
    ]
)
WEIGHTS = np.array([0.40, 0.35, 0.25])  # sum to one
C_HAT = 0.65
D_HAT = 0.40


def main():
    C, D, DOM, kernel, dominated = electre_i(
        DATASET, WEIGHTS, c_hat=C_HAT, d_hat=D_HAT, graph=False
    )
    print(f"# pyDecision electre_i (c_hat={C_HAT}, d_hat={D_HAT}); all-benefit dataset")
    print("# concordance (row a, col b):")
    for i, row in enumerate(C):
        print("C " + str(i) + " " + " ".join(f"{x:.15e}" for x in row))
    print("# discordance (row a, col b):")
    for i, row in enumerate(D):
        print("D " + str(i) + " " + " ".join(f"{x:.15e}" for x in row))
    print("# dominance (1 = a outranks b):")
    for i, row in enumerate(DOM):
        print("DOM " + str(i) + " " + " ".join(str(int(x)) for x in row))
    print("kernel", kernel)
    print("dominated", dominated)


if __name__ == "__main__":
    main()
