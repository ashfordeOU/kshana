#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the AHP priority-vector / Consistency-Ratio reference values asserted
in ``tests/mcda_ahp_reference.rs``.

Two independent external anchors:

  * **Saaty's canonical Random Index table** (T. L. Saaty, *The Analytic Hierarchy
    Process*, McGraw-Hill, 1980): RI(n) for n = 1..10 = 0, 0, 0.58, 0.90, 1.12,
    1.24, 1.32, 1.41, 1.45, 1.49. These are the published constants Kshana hard-codes
    in ``mcda::ahp::saaty_random_index`` and this script reproduces verbatim.

  * **SciPy / LAPACK** (``scipy.linalg.eig``) as an independent eigensolver: the AHP
    priority vector is the normalised principal (Perron) eigenvector of the reciprocal
    pairwise matrix, and λ_max its principal eigenvalue. Kshana derives the same by
    power iteration; this script derives it by the dense QR algorithm in LAPACK — a
    fully independent implementation — so agreement to < 1e-9 cross-validates the
    Kshana solver. The Consistency Index CI = (λ_max − n)/(n − 1) and Consistency
    Ratio CR = CI / RI(n) follow.

The worked matrices: a perfectly consistent geometric 3×3 (λ_max = n exactly,
CR = 0 — Saaty's consistency theorem), an inconsistent 3×3, and an inconsistent 4×4.

Run:  python3 generate_ahp_reference.py
Pinned: scipy 1.x, numpy 2.x, Python 3.x. The printed numbers are the constants
hard-coded (with this provenance) in tests/mcda_ahp_reference.rs.
"""
import numpy as np
from scipy.linalg import eig

# Saaty 1980 canonical Random Index, n = 1..10.
RI = {1: 0.0, 2: 0.0, 3: 0.58, 4: 0.90, 5: 1.12,
      6: 1.24, 7: 1.32, 8: 1.41, 9: 1.45, 10: 1.49}

MATRICES = {
    "consistent_3x3": [[1, 2, 4], [1 / 2, 1, 2], [1 / 4, 1 / 2, 1]],
    "inconsistent_3x3": [[1, 2, 5], [1 / 2, 1, 3], [1 / 5, 1 / 3, 1]],
    "inconsistent_4x4": [[1, 3, 7, 9], [1 / 3, 1, 5, 7],
                         [1 / 7, 1 / 5, 1, 3], [1 / 9, 1 / 7, 1 / 3, 1]],
    "reject_3x3": [[1, 9, 5], [1 / 9, 1, 3], [1 / 5, 1 / 3, 1]],
}


def ahp(M):
    M = np.array(M, dtype=float)
    n = M.shape[0]
    w, v = eig(M)
    k = int(np.argmax(w.real))
    lam = w[k].real
    pv = np.abs(v[:, k].real)
    pv = pv / pv.sum()
    ci = (lam - n) / (n - 1) if n > 1 else 0.0
    cr = ci / RI[n] if RI[n] > 0 else 0.0
    return lam, pv, ci, cr


def main():
    print("# Saaty 1980 Random Index, n=1..10:")
    print("RI " + " ".join(f"{RI[i]:.2f}" for i in range(1, 11)))
    for name, M in MATRICES.items():
        lam, pv, ci, cr = ahp(M)
        print(f"# {name} (SciPy/LAPACK principal eigenvector)")
        print(f"{name} lambda_max {lam:.15e}")
        print(f"{name} priority " + " ".join(f"{x:.15e}" for x in pv))
        print(f"{name} CI {ci:.15e}")
        print(f"{name} CR {cr:.15e}")


if __name__ == "__main__":
    main()
