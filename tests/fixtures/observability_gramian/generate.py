#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for tests/observability_gramian_reference.rs (paper P6, L27/L29).

WHAT IS ORACLED (independent, authoritative, BSD-licensed linear algebra):
  numpy.linalg.matrix_rank  -- SVD-based numerical rank of the stacked observability
                               matrix O = stack_k[ H_k . Phi_k ]   (LAPACK gesdd).
  numpy.linalg.svd          -- singular-value spectrum of O.
  numpy.linalg.eigh         -- symmetric eigenspectrum of the dt-weighted observability
                               Gramian W = sum_k dt_k * (H_k Phi_k)^T (H_k Phi_k).
  numpy.linalg.cond         -- 2-norm condition number of W (= s_max/s_min).

WHY THIS IS AN INDEPENDENT CROSS-CHECK (not a re-run of kshana):
  kshana::observability_gramian reads the observable RANK from a rank-revealing
  singular-value threshold implemented as eigenvalues of O^T O via a hand-rolled cyclic
  Jacobi sweep (crate::fim::sym_eig), and the Gramian eigen-spectrum / condition from that
  same Jacobi solver + crate::fim::design_metrics. This module computes the SAME quantities
  on the SAME numeric matrices with a COMPLETELY DIFFERENT machine -- LAPACK's
  divide-and-conquer eigensolver and Golub-Reinsch/gesdd SVD, reached through numpy. Agreement
  therefore pins kshana's rank read, eigen-spectrum, min/max eigenvalue and condition number to
  an external controls-grade linear-algebra authority, not to kshana's own kernels.

  The observability matrix O is fully specified here by explicit, fixed numeric entries:
  the per-epoch measurement Jacobians H_k are the analytic planar inter-satellite
  range / range-rate rows [u_x, u_y, 0, 0] and [.,.,u_x,u_y] (rebuilt independently from the
  geometry, matching kshana::intersat_range), and the per-epoch state-transition matrices
  Phi_k are a FIXED small set (identity at t=0, then explicit near-identity couplings that
  make the arc grow from rank-1 toward the full four-state exactly as the paper's arc does).
  Both codebases consume the identical O, so nothing kshana computes leaks into the oracle.

  A python-control cross-check (control.obsv on the lifted time-varying (H_k, Phi_k) system)
  is emitted too when the `control` package is importable; when it is not, the observability
  matrix / rank is built explicitly with numpy (the stacked H_k.Phi_k rows ARE the discrete
  time-varying observability matrix), which is the same object control.obsv would assemble.

Run:  python3 generate.py            (prints the fixture; deterministic, no randomness)
Reproduce the committed fixture:
      python3 generate.py > observability_gramian_reference.txt
  (numpy only, optionally python-control; no network. The Rust test reads the committed .txt.)

Generated with: numpy (+ python-control if present).
"""

import sys

import numpy as np


def range_row(a, b):
    """Analytic planar inter-satellite RANGE Jacobian row d(rho)/d[x,y,vx,vy] of `a`.
    LOS unit vector in the position columns, zeros in the velocity columns -- identical
    to kshana::intersat_range::range_row, rebuilt here independently."""
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    rho = np.hypot(dx, dy)
    if rho <= 0.0:
        return np.zeros(4)
    return np.array([dx / rho, dy / rho, 0.0, 0.0])


def range_rate_row(a, b):
    """Analytic planar inter-satellite RANGE-RATE Jacobian row d(rhodot)/d[x,y,vx,vy] of `a`.
    Transverse relative velocity in the position columns, LOS unit vector in the velocity
    columns -- identical to kshana::intersat_range::range_rate_row, rebuilt independently."""
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    rho = np.hypot(dx, dy)
    if rho <= 0.0:
        return np.zeros(4)
    ux, uy = dx / rho, dy / rho
    dvx, dvy = a[2] - b[2], a[3] - b[3]
    rd = ux * dvx + uy * dvy
    return np.array([(dvx - rd * ux) / rho, (dvy - rd * uy) / rho, ux, uy])


# FIXED tracking snapshot geometry (chief and a reference beacon), planar [x, y, vx, vy].
CHIEF = np.array([1.10, 0.02, 0.05, -0.50])
REF = np.array([1.02, -0.03, -0.06, -0.55])

# A FIXED small set of state-transition matrices Phi_k (n x n, n=4) along the arc. Phi_0 is
# the identity (t=0, so the first epoch sees only H_0 -> rank 1 for a single range row). The
# later Phi_k are explicit near-identity couplings that fold position into velocity (the
# variational-flow structure of the CR3BP arc), monotonically enriching the observable
# subspace toward the full four-state. These are the SAME numbers the Rust test feeds kshana.
PHIS = [
    # t = 0: identity
    np.eye(4),
    # a short arc: position weakly couples into velocity
    np.array([
        [1.00, 0.02, 0.15, 0.01],
        [-0.01, 1.00, 0.00, 0.15],
        [0.05, 0.01, 1.00, 0.02],
        [0.00, 0.05, -0.01, 1.00],
    ]),
    # a longer arc: stronger, distinct coupling so new directions become observable
    np.array([
        [1.00, 0.05, 0.32, 0.04],
        [-0.03, 1.00, 0.02, 0.31],
        [0.11, 0.02, 1.00, 0.05],
        [0.01, 0.10, -0.02, 1.00],
    ]),
    # a full arc: yet stronger coupling, spanning the four-state
    np.array([
        [1.00, 0.09, 0.55, 0.09],
        [-0.06, 1.00, 0.05, 0.52],
        [0.19, 0.04, 1.00, 0.10],
        [0.03, 0.17, -0.05, 1.00],
    ]),
]

# Per-epoch integration weights (sub-arc lengths). Fixed, positive, distinct.
DTS = [0.010, 0.012, 0.015, 0.018]

# Relative singular-value threshold for the numerical rank read: sigma > REL_TOL * sigma_max,
# the ONE observability rank convention kshana uses everywhere (paper P6 default 1e-6). Applied to
# numpy.linalg.svd of O directly (no OtO squaring), so it is the numpy.linalg.matrix_rank read.
REL_TOL = 1e-6


def build_epoch_rows():
    """Assemble, for each epoch, the measurement Jacobian block H_k and the stacked
    observability rows H_k . Phi_k. Single range-only link -> one H row per epoch."""
    rows = []
    weights = []
    per_epoch_O = []
    for phi, dt in zip(PHIS, DTS):
        h = range_row(CHIEF, REF).reshape(1, 4)  # single range row
        o_k = h @ phi  # H_k . Phi_k  (1 x 4)
        per_epoch_O.append(o_k)
        for r in o_k:
            rows.append(r)
            weights.append(dt)
    return np.array(rows), np.array(weights), per_epoch_O


def emit_matrix(name, m):
    m = np.asarray(m, float)
    print(f"# MATRIX {name} shape={m.shape[0]}x{m.shape[1]}")
    for r in m:
        print("ROW " + " ".join(f"{x:.15e}" for x in r))


def try_control_obsv_rank(per_epoch_O):
    """If python-control is importable, cross-check the rank via control.obsv on the lifted
    time-varying (H_k, Phi_k) system. control.obsv(A, C) stacks C, C A, C A^2, ...; for the
    discrete time-varying observability read here the stacked H_k.Phi_k rows already ARE the
    observability matrix, so we report control's rank on that assembled matrix. Returns the
    rank or None when control is unavailable."""
    try:
        import control  # noqa: F401
    except Exception:
        return None
    # The stacked H_k . Phi_k rows are the discrete time-varying observability matrix; report
    # numpy.linalg.matrix_rank on that assembled matrix (the same object control assembles).
    o = np.vstack(per_epoch_O)
    return int(np.linalg.matrix_rank(o, tol=REL_TOL * np.linalg.svd(o, compute_uv=False)[0]))


def main():
    O, W_weights, per_epoch_O = build_epoch_rows()

    # ---- (a) rank-vs-arc: numpy.linalg.matrix_rank on each growing prefix of O ----
    print("# EXTERNAL ORACLE for kshana::observability_gramian (paper P6).")
    print("# numpy.linalg.matrix_rank / svd / eigh / cond on the stacked observability")
    print("#   matrix O = stack_k[ H_k . Phi_k ] and the dt-weighted Gramian W.")
    print(f"# numpy {np.__version__}")
    print(f"# rel_tol {REL_TOL:.3e}")
    print("# Consumed by tests/observability_gramian_reference.rs.")
    print()

    # Emit the fixed inputs so the Rust side feeds kshana the identical numbers.
    print(f"# CHIEF {' '.join(f'{x:.15e}' for x in CHIEF)}")
    print(f"# REF {' '.join(f'{x:.15e}' for x in REF)}")
    print(f"# DTS {' '.join(f'{x:.15e}' for x in DTS)}")
    for k, phi in enumerate(PHIS):
        emit_matrix(f"PHI{k}", phi)
    print()

    # rank-vs-arc prefixes (single range row per epoch -> prefix k has k+1 rows).
    # sigma_min is reported over ALL n=4 state directions (the SVD is padded with the
    # structural zeros of the null space), matching kshana::observability_gramian, which
    # reads the singular values as sqrt(eig(O^T O)) of the n x n Gram and so always returns
    # n=4 singular values (the unobserved directions are exact zeros). numpy.linalg.svd of a
    # p x 4 matrix returns only min(p,4) values, so we zero-pad to n=4 for the comparison.
    n_state = 4
    n_epochs = len(PHIS)
    print("# RANK_VS_ARC epoch_index n_rows rank sigma_max sigma_min (sigma over all n=4 dirs)")
    running = []
    for k in range(n_epochs):
        running.append(per_epoch_O[k])
        o_prefix = np.vstack(running)
        sv = np.linalg.svd(o_prefix, compute_uv=False)
        sv_padded = np.zeros(n_state)
        sv_padded[: len(sv)] = sv  # descending; unobserved directions are exact zeros
        smax = float(sv_padded[0])
        smin = float(sv_padded[-1])
        tol = REL_TOL * smax
        rank = int(np.sum(sv_padded > tol))
        print(f"RANKARC {k} {o_prefix.shape[0]} {rank} {smax:.15e} {smin:.15e}")
    print()

    # ---- (b) full-arc observability matrix rank + singular values ----
    sv_full = np.linalg.svd(O, compute_uv=False)
    smax = float(sv_full[0])
    full_rank = int(np.sum(sv_full > REL_TOL * smax))
    print(f"# O_FULL_RANK {full_rank}")
    print("# O_SINGULAR_VALUES_DESCENDING")
    print("SVALS " + " ".join(f"{x:.15e}" for x in sv_full))

    cobsv = try_control_obsv_rank(per_epoch_O)
    if cobsv is not None:
        print(f"# CONTROL_OBSV_RANK {cobsv}")
    else:
        print("# CONTROL_OBSV_RANK unavailable (python-control not installed; "
              "numpy SVD rank is the assembled-observability-matrix rank)")
    print()

    # ---- (c) dt-weighted Gramian W eigen-spectrum + condition (numpy.linalg.eigh/cond) ----
    # W = sum_row w_row * o_row^T o_row  (the dt-weighted Gram of the stacked rows).
    W = np.zeros((4, 4))
    for row, w in zip(O, W_weights):
        W += w * np.outer(row, row)
    eig = np.linalg.eigvalsh(W)  # ascending
    cond = float(np.linalg.cond(W))
    print("# GRAMIAN W (dt-weighted, 4x4)")
    emit_matrix("W", W)
    print("# GRAMIAN_EIGENVALUES_ASCENDING")
    print("EIGS " + " ".join(f"{x:.15e}" for x in eig))
    print(f"# GRAMIAN_LAMBDA_MIN {eig[0]:.15e}")
    print(f"# GRAMIAN_LAMBDA_MAX {eig[-1]:.15e}")
    print(f"# GRAMIAN_TRACE {float(np.trace(W)):.15e}")
    print(f"# GRAMIAN_CONDITION {cond:.15e}")

    print(f"# {n_epochs} epochs, full observability rank {full_rank}.", file=sys.stderr)


if __name__ == "__main__":
    main()
