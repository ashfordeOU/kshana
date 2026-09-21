#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Numpy oracle for the P4 coupled-gauge Validated anchor.

Reads ``tests/fixtures/coupled_gauge/network.json`` (rows built by
``examples/gen_coupled_gauge_rows.rs`` with real DE440 Moon PA orientation) and
INDEPENDENTLY replicates the full downstream linear-algebra pipeline of
``kshana::lunar_gauge`` using numpy / LAPACK.

Writes ``tests/fixtures/coupled_gauge/reference.json``.

WHAT IS VALIDATED
-----------------
The beacon/orbiter *geometry* is Modelled (documented, deterministic).
The spatial partial-derivative rows carry the REAL DE440 PA orientation (computed by
the Rust generator via ``lunar_datum::orbiter_range_row_datum7``).

The Validated claim is that kshana's coupled-gauge linear algebra --
``assemble_coupled_info``, ``fim::sym_eig`` (Jacobi eigendecomposition),
``classify_null_space``, ``coupled_marginal_eigs`` (Schur complement) -- reproduces
this independent numpy / LAPACK computation to relative error < 1e-3 AND absolute
error < 1e-3 on the real-DE440-derived rows.

BYTE-CONSISTENCY
----------------
Every row float was rounded to 6 dp in the Rust generator BEFORE being written to
``network.json``.  This oracle reads those exact JSON values (same IEEE-754 doubles).
The only Rust-vs-numpy difference is the eigensolver (Jacobi vs LAPACK) and the
pseudo-inverse kernel, both of which agree far inside 1e-3.

Usage::

    .venv/bin/python scripts/gen_coupled_gauge_ref.py
"""
import json
import os

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, "..")
FIXTURE_DIR = os.path.join(ROOT, "tests", "fixtures", "coupled_gauge")
NETWORK_JSON = os.path.join(FIXTURE_DIR, "network.json")
REF_JSON = os.path.join(FIXTURE_DIR, "reference.json")

# Must match kshana::lunar_time::RE_MOON_M
R_MOON = 1_737_400.0
# Relative tolerance: mirrors fim::crlb default
REL_TOL = 1e-9
# Gram-rank threshold: mirrors classify_from_null_space
GRAM_TOL = 1e-9


# ---------------------------------------------------------------------------
# Replicate assemble_coupled_info
# ---------------------------------------------------------------------------
def assemble_fisher(rows, sigma: float) -> np.ndarray:
    """
    Mirror ``kshana::lunar_gauge::assemble_coupled_info``.

    Precondition columns 3..7 (indices 3, 4, 5, 6) by R_MOON, weight 1/sigma^2,
    accumulate sum_i (1/sigma^2) * row_i @ row_i.T  ->  9x9 Fisher.
    """
    A = np.array(rows, dtype=np.float64)       # n x 9
    A = A.copy()                                # avoid mutating the caller's array
    A[:, 3:7] /= R_MOON                        # precondition cols 3,4,5,6
    w = 1.0 / (sigma ** 2)
    return w * (A.T @ A)                        # 9x9


# ---------------------------------------------------------------------------
# Subspace rank (Gram matrix)
# ---------------------------------------------------------------------------
def gram_rank(U_sub: np.ndarray) -> int:
    """
    Rank of U_sub (p x d) via # eigenvalues of Gram = U_sub @ U_sub.T exceeding GRAM_TOL.

    Mirrors the Rust ``subspace_rank`` closure in ``classify_from_null_space``.
    """
    if U_sub.shape[1] == 0:
        return 0
    gram = U_sub @ U_sub.T
    evals = np.linalg.eigvalsh(gram)
    return int(np.sum(evals > GRAM_TOL))


# ---------------------------------------------------------------------------
# Null-space classification
# ---------------------------------------------------------------------------
def classify(F: np.ndarray, rel_tol: float = REL_TOL) -> dict:
    """
    Mirror ``classify_null_space`` (calls ``fim::crlb`` -> ``classify_from_null_space``).

    1. Eigdecompose F (ascending).
    2. defect = # eigenvalues <= rel_tol * lambda_max.
    3. U = null eigenvectors (9 x d).
    4. U_S = rows 0..7 (spatial);  U_T = rows 7..9 (temporal).
    5. rs = gram_rank(U_S),  rt = gram_rank(U_T).
    6. dim_spatial = d - rt,  dim_temporal = d - rs,  coupled_dim = rs + rt - d (>=0).
    7. p_st_norm = Frobenius of P[0:7][7:9]  where  P = U @ U.T.
    """
    evals, evecs = np.linalg.eigh(F)          # ascending order
    lmax = float(evals[-1]) if evals.size else 0.0
    null_mask = evals <= rel_tol * lmax
    d = int(np.sum(null_mask))

    if d == 0:
        return {
            "defect": 0,
            "dim_spatial": 0,
            "dim_temporal": 0,
            "coupled_dim": 0,
            "p_st_norm": 0.0,
        }

    U = evecs[:, null_mask]                    # 9 x d  (null eigenvectors as columns)

    U_S = U[0:7, :]                            # 7 x d  (spatial rows)
    U_T = U[7:9, :]                            # 2 x d  (temporal rows)

    rs = gram_rank(U_S)                        # rank of spatial projection
    rt = gram_rank(U_T)                        # rank of temporal projection

    dim_spatial = d - rt
    dim_temporal = d - rs
    coupled_dim = max(0, rs + rt - d)

    # p_st_norm = ||P[0:7][7:9]||_F  where P = U @ U.T
    P = U @ U.T                                # 9 x 9
    p_st = P[0:7, 7:9]                        # 7 x 2 off-diagonal block
    p_st_norm = float(np.linalg.norm(p_st, "fro"))

    return {
        "defect": d,
        "dim_spatial": dim_spatial,
        "dim_temporal": dim_temporal,
        "coupled_dim": coupled_dim,
        "p_st_norm": p_st_norm,
    }


# ---------------------------------------------------------------------------
# Schur-complement marginal eigenvalues
# ---------------------------------------------------------------------------
def marginal_eigs(F: np.ndarray) -> list:
    """
    Mirror ``kshana::lunar_gauge::coupled_marginal_eigs``.

    Schur complement of K = {IDX_SCALE=3, IDX_OFFSET=7} in the 9x9 F,
    eliminating M = {0,1,2,4,5,6,8} via Moore-Penrose pseudo-inverse.

        S = I_KK - I_KM @ pinv(I_MM) @ I_KM.T

    Returns the two ascending eigenvalues of the 2x2 Schur complement.
    """
    K = [3, 7]
    M = [0, 1, 2, 4, 5, 6, 8]

    I_KK = F[np.ix_(K, K)]                    # 2 x 2
    I_KM = F[np.ix_(K, M)]                    # 2 x 7
    I_MM = F[np.ix_(M, M)]                    # 7 x 7

    D_inv = np.linalg.pinv(I_MM)              # 7 x 7  Moore-Penrose pseudo-inverse
    S = I_KK - I_KM @ D_inv @ I_KM.T         # 2 x 2

    evals = np.linalg.eigvalsh(S)             # ascending
    return [float(x) for x in evals]


# ---------------------------------------------------------------------------
# Process one network
# ---------------------------------------------------------------------------
def process_network(rows: list, sigma: float) -> dict:
    """Assemble Fisher and compute all reference quantities for one network."""
    F = assemble_fisher(rows, sigma)

    # All 9 eigenvalues (ascending)
    evals_all = np.linalg.eigvalsh(F)
    lmax = float(evals_all[-1])

    cls = classify(F)
    m_eigs = marginal_eigs(F)

    return {
        "eigenvalues": [float(x) for x in evals_all],
        "lambda_max": lmax,
        "defect": cls["defect"],
        "dim_spatial": cls["dim_spatial"],
        "dim_temporal": cls["dim_temporal"],
        "coupled_dim": cls["coupled_dim"],
        "p_st_norm": cls["p_st_norm"],
        "marginal_eigs": m_eigs,
    }


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
with open(NETWORK_JSON) as fh:
    net = json.load(fh)

sigma = float(net["sigma"])

results = {}
for name, nw in net["networks"].items():
    rows = nw["rows"]
    r = process_network(rows, sigma)
    results[name] = r

    print(f"\n{name} ({nw['n_rows']} rows):")
    print(f"  eigenvalues (9): {[f'{x:.4e}' for x in r['eigenvalues']]}")
    print(f"  defect={r['defect']}, dim_spatial={r['dim_spatial']}, "
          f"dim_temporal={r['dim_temporal']}, coupled_dim={r['coupled_dim']}")
    print(f"  p_st_norm = {r['p_st_norm']:.6e}")
    print(f"  marginal_eigs (scale, offset): {[f'{x:.4e}' for x in r['marginal_eigs']]}")

reference = {
    "description": (
        "Validated anchor reference for `tests/lunar_coupled_gauge_reference.rs`. "
        "Computed independently by numpy/LAPACK from the rows in "
        "`network.json` (built by `examples/gen_coupled_gauge_rows.rs` with real "
        "DE440 Moon PA orientation). "
        "Validated claim: kshana's coupled-gauge linear algebra reproduces these "
        "values to rel<1e-3 AND abs<1e-3 on real-DE440-derived rows."
    ),
    "oracle": "numpy/LAPACK (np.linalg.eigvalsh, np.linalg.eigh, np.linalg.pinv)",
    "R_MOON_M": R_MOON,
    "rel_tol": REL_TOL,
    "gram_tol": GRAM_TOL,
    "networks": results,
}

os.makedirs(FIXTURE_DIR, exist_ok=True)
with open(REF_JSON, "w") as fh:
    json.dump(reference, fh, indent=1)
print(f"\nwrote {REF_JSON}")
