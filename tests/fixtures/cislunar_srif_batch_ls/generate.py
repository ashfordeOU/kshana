#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for tests/cislunar_srif_batch_ls_reference.rs (paper P6, L32).

WHAT IS ORACLED (independent, authoritative, BSD-licensed):
  A NumPy/SciPy **batch weighted least-squares** on the IDENTICAL stacked measurement system
  O = stack_k[ H_k . Phi_k ] that kshana::cislunar_srif folds through its Square-Root
  Information Filter (Householder triangularization). This closes the independence gap the SRIF
  cross-check leaves open: the SRIF (Householder QR) and the eigen-Gramian both reduce to O^T O,
  so their agreement is a different-ALGORITHM consistency check on the SAME crate; this generator
  computes the batch-LS posterior on a genuinely DIFFERENT codebase (LAPACK, via NumPy/SciPy):

    posterior information  N = O^T W O          (W = diag(dt_k), unit-noise weighting)
    posterior covariance   P_ls = N^{-1}        (numpy.linalg.inv / scipy.linalg.inv)
    condition number       cond(N) = cond(P_ls) (numpy.linalg.cond, 2-norm)

  At the rank-4 (full-observability) arc, kshana's SRIF posterior covariance P = R^{-1}R^{-T}
  must equal this P_ls and share its condition number to numerical precision -- an EXTERNAL
  oracle, not a re-run of kshana.

  A scipy.linalg.lstsq solve on the same stacked system is emitted too (its returned rank must be
  the full four-state, and its solution recovers a known injected initial-state offset), so the
  batch estimator's rank read is pinned to SciPy's SVD-based lstsq as well.

GEOMETRY (identical to tests/fixtures/observability_gramian/): a single range-only link
  (chief <-> reference) over a fixed 4-epoch arc, each epoch carrying the analytic range Jacobian
  H_k and a fixed state-transition matrix Phi_k (identity at t=0, then explicit near-identity
  couplings that grow the arc from rank-1 to the full four-state), weighted by dt_k. The Rust test
  rebuilds the identical O with kshana's own range_row + these Phi_k, folds it into the SRIF, and
  compares its P and condition against P_ls / cond(N) here.

Run:  python3 generate.py > cislunar_srif_batch_ls_reference.txt   (numpy + scipy; no network)
Generated with: numpy + scipy (LAPACK).
"""

import sys

import numpy as np
from scipy import linalg as sla


def range_row(a, b):
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    rho = np.hypot(dx, dy)
    if rho <= 0.0:
        return np.zeros(4)
    return np.array([dx / rho, dy / rho, 0.0, 0.0])


# Same fixed geometry as the observability_gramian fixture.
CHIEF = np.array([1.10, 0.02, 0.05, -0.50])
REF = np.array([1.02, -0.03, -0.06, -0.55])
PHIS = [
    np.eye(4),
    np.array([
        [1.00, 0.02, 0.15, 0.01],
        [-0.01, 1.00, 0.00, 0.15],
        [0.05, 0.01, 1.00, 0.02],
        [0.00, 0.05, -0.01, 1.00],
    ]),
    np.array([
        [1.00, 0.05, 0.32, 0.04],
        [-0.03, 1.00, 0.02, 0.31],
        [0.11, 0.02, 1.00, 0.05],
        [0.01, 0.10, -0.02, 1.00],
    ]),
    np.array([
        [1.00, 0.09, 0.55, 0.09],
        [-0.06, 1.00, 0.05, 0.52],
        [0.19, 0.04, 1.00, 0.10],
        [0.03, 0.17, -0.05, 1.00],
    ]),
]
DTS = [0.010, 0.012, 0.015, 0.018]
REL_TOL = 1e-6


def emit_matrix(name, m):
    m = np.asarray(m, float)
    print(f"# MATRIX {name} shape={m.shape[0]}x{m.shape[1]}")
    for r in m:
        print("ROW " + " ".join(f"{x:.15e}" for x in r))


def build_O():
    """Assemble the full-arc stacked observability matrix O and the per-row weights (dt_k)."""
    rows = []
    weights = []
    for phi, dt in zip(PHIS, DTS):
        h = range_row(CHIEF, REF).reshape(1, 4)
        o_k = h @ phi
        for r in o_k:
            rows.append(r)
            weights.append(dt)
    return np.array(rows), np.array(weights)


def main():
    O, w = build_O()
    W = np.diag(w)

    print("# EXTERNAL ORACLE for kshana::cislunar_srif (paper P6, L32).")
    print("# NumPy/SciPy BATCH weighted least-squares on the IDENTICAL stacked system O that the")
    print("#   SRIF folds; compares posterior covariance (O^T W O)^-1 and its condition number.")
    print(f"# numpy {np.__version__}  scipy {__import__('scipy').__version__}")
    print(f"# rel_tol {REL_TOL:.3e}")
    print("# Consumed by tests/cislunar_srif_batch_ls_reference.rs.")
    print()
    print(f"# CHIEF {' '.join(f'{x:.15e}' for x in CHIEF)}")
    print(f"# REF {' '.join(f'{x:.15e}' for x in REF)}")
    print(f"# DTS {' '.join(f'{x:.15e}' for x in DTS)}")
    for k, phi in enumerate(PHIS):
        emit_matrix(f"PHI{k}", phi)
    print()

    # ---- Batch weighted-LS posterior information + covariance (LAPACK) ----
    N = O.T @ W @ O                     # posterior information (weighted normal matrix)
    P_ls = np.linalg.inv(N)            # posterior covariance (numpy LU inverse)
    P_ls_scipy = sla.inv(N)           # cross-check with scipy (independent LAPACK call)
    assert np.allclose(P_ls, P_ls_scipy, rtol=1e-10, atol=1e-14)

    # SRIF uses UNIT weight per row (sigma=1), forming R^T R = O^T O (unweighted). Emit BOTH so the
    # Rust test can pick the one matching how it folds rows. The default SRIF fold is unit-weight.
    N_unit = O.T @ O
    P_unit = np.linalg.inv(N_unit)

    cond_N = float(np.linalg.cond(N))
    cond_N_unit = float(np.linalg.cond(N_unit))

    print("# POSTERIOR_INFORMATION_UNIT N = O^T O (4x4)")
    emit_matrix("N_UNIT", N_unit)
    print("# POSTERIOR_COVARIANCE_UNIT P = (O^T O)^-1 (4x4)")
    emit_matrix("P_UNIT", P_unit)
    print(f"# COND_N_UNIT {cond_N_unit:.15e}")
    print()
    print("# POSTERIOR_INFORMATION_WEIGHTED N = O^T W O (4x4)")
    emit_matrix("N_WEIGHTED", N)
    print("# POSTERIOR_COVARIANCE_WEIGHTED P = (O^T W O)^-1 (4x4)")
    emit_matrix("P_WEIGHTED", P_ls)
    print(f"# COND_N_WEIGHTED {cond_N:.15e}")
    print()

    # ---- scipy.linalg.lstsq rank + recovery of an injected initial-state offset ----
    # Inject a known offset ds0; synthesize noiseless measurements z = O @ ds0; solve.
    ds0 = np.array([3.0e-3, -2.0e-3, 1.0e-3, -1.5e-3])
    z = O @ ds0
    sol, resid, rank_ls, sv = sla.lstsq(O, z)
    print("# LSTSQ (scipy.linalg.lstsq on O @ ds0 = z, ds0 a known injected offset)")
    print(f"# LSTSQ_RANK {rank_ls}")
    print("# LSTSQ_INJECTED_DS0 " + " ".join(f"{x:.15e}" for x in ds0))
    print("# LSTSQ_RECOVERED_DS0 " + " ".join(f"{x:.15e}" for x in sol))
    print("# LSTSQ_SINGULAR_VALUES " + " ".join(f"{x:.15e}" for x in sv))

    print(f"# batch-LS oracle: cond(O^T O)={cond_N_unit:.3e}, lstsq rank={rank_ls}.",
          file=sys.stderr)


if __name__ == "__main__":
    main()
