#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for tests/cislunar_gdop_singular_reference.rs (paper P6, L33).

WHAT IS ORACLED (independent, authoritative, BSD-licensed):
  numpy.linalg.matrix_rank  -- numerical rank of the range-only single-epoch information matrix.
  numpy.linalg.cond         -- 2-norm condition number (must be +inf / non-finite for a singular
                               position-only geometry).

THE PAPER CLAIM (P6, L33): a POSITION-ONLY (range-only) instantaneous snapshot of the four-state
  [x, y, vx, vy] cannot observe velocity -- every range Jacobian row has ZERO velocity columns --
  so the single-epoch information matrix M = sum_i h_i^T h_i is rank-deficient (rank <= 2 for a
  planar geometry, datum defect >= 2), the geometric dilution of precision is UNDEFINED, and
  kshana::observability_gramian::cislunar_gdop must return CislunarGdop::Undefined (never a bogus
  finite GDOP) with rank/defect matching numpy and condition = inf matching numpy.linalg.cond.

GEOMETRY: the ACTUAL default DRO constellation snapshot used by the paper's
  cislunar_observability scenario -- a chief and three reference beacons that are
  differential-corrected planar distant-retrograde orbits (kshana::dro), evaluated at t=0. The
  four planar states below are those seed states (provenance committed here); numpy rebuilds the
  range Jacobian rows and the information matrix INDEPENDENTLY (its own arithmetic, matching
  kshana::intersat_range) and reads off the rank/condition. kshana is never consulted for the
  rank -- only for the (Modelled) constellation design, which is the scenario input.

  A range+range-rate snapshot to the same three references IS full rank (velocity becomes
  observable via Doppler), so its GDOP is finite -- emitted too as the contrast case.

Run:  python3 generate.py > cislunar_gdop_singular_reference.txt   (numpy; no network)
Generated with: numpy (LAPACK).
"""

import sys

import numpy as np

REL_TOL = 1e-6

# ACTUAL default DRO constellation seed states [x, y, vx, vy] (chief index 0, references 1..3),
# from kshana::cislunar_observability::CislunarObservabilityScenario::default().seed_states().
STATES = [
    [1.057849414390376e0, 0.0, 0.0, -4.934793313745175e-1],
    [1.002806662971755e0, -4.613178402572390e-2, -5.164321218995598e-1, -1.707243230335170e-1],
    [9.016186475175380e-1, -3.818654210489848e-2, -1.635231586664178e-1, 4.359462406783736e-1],
    [9.281702422481304e-1, 1.119394203595249e-1, 3.364622709493892e-1, 2.327995591972251e-1],
]


def range_row(a, b):
    """Planar RANGE Jacobian row d(rho)/d[x,y,vx,vy]: LOS unit in position cols, zeros in velocity."""
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    rho = np.hypot(dx, dy)
    return np.array([dx / rho, dy / rho, 0.0, 0.0])


def range_rate_row(a, b):
    """Planar RANGE-RATE Jacobian row: transverse rel-velocity in position cols, LOS in velocity."""
    dx = a[0] - b[0]
    dy = a[1] - b[1]
    rho = np.hypot(dx, dy)
    ux, uy = dx / rho, dy / rho
    dvx, dvy = a[2] - b[2], a[3] - b[3]
    rd = ux * dvx + uy * dvy
    return np.array([(dvx - rd * ux) / rho, (dvy - rd * uy) / rho, ux, uy])


def info_rank_cond(rows):
    """Information matrix M = R^T R for stacked rows R, with numpy rank/cond."""
    R = np.array(rows)
    M = R.T @ R
    # Numerical rank of M via eigenvalues (M is 4x4 SPD-or-singular). Use the SAME sigma-threshold
    # kshana uses on the design matrix: rank = count of singular values of R above rel_tol*sigma_max.
    sv = np.linalg.svd(R, compute_uv=False)
    smax = sv[0] if sv.size else 0.0
    rank = int(np.sum(sv > REL_TOL * smax)) if smax > 0 else 0
    cond = float(np.linalg.cond(M))  # +inf (non-finite) when M is singular
    return M, rank, cond


def emit_matrix(name, m):
    m = np.asarray(m, float)
    print(f"# MATRIX {name} shape={m.shape[0]}x{m.shape[1]}")
    for r in m:
        print("ROW " + " ".join(f"{x:.15e}" for x in r))


def main():
    chief = STATES[0]
    refs = STATES[1:]
    n_state = 4

    print("# EXTERNAL ORACLE for kshana::observability_gramian::cislunar_gdop (paper P6, L33).")
    print("# numpy.linalg.matrix_rank / cond on the range-only single-epoch information matrix of")
    print("#   the ACTUAL default DRO constellation snapshot: position-only -> rank-deficient ->")
    print("#   GDOP UNDEFINED (condition = inf).")
    print(f"# numpy {np.__version__}")
    print(f"# rel_tol {REL_TOL:.3e}")
    print("# Consumed by tests/cislunar_gdop_singular_reference.rs.")
    print()
    for i, s in enumerate(STATES):
        role = "chief" if i == 0 else f"reference{i - 1}"
        print(f"# STATE {i} {role} " + " ".join(f"{v:.15e}" for v in s))
    print()

    # ---- range-only snapshot: rank-deficient, GDOP undefined ----
    ro_rows = [range_row(chief, r) for r in refs]
    M_ro, rank_ro, cond_ro = info_rank_cond(ro_rows)
    defect_ro = n_state - rank_ro
    emit_matrix("INFO_RANGE_ONLY", M_ro)
    print(f"# RANGE_ONLY_RANK {rank_ro}")
    print(f"# RANGE_ONLY_DEFECT {defect_ro}")
    print(f"# RANGE_ONLY_COND_FINITE {'true' if np.isfinite(cond_ro) else 'false'}")
    print(f"# RANGE_ONLY_COND {cond_ro:.15e}")
    print()

    # ---- range + range-rate snapshot: full rank, GDOP finite (contrast) ----
    rr_rows = []
    for r in refs:
        rr_rows.append(range_row(chief, r))
        rr_rows.append(range_rate_row(chief, r))
    M_rr, rank_rr, cond_rr = info_rank_cond(rr_rows)
    defect_rr = n_state - rank_rr
    emit_matrix("INFO_RANGE_RATE", M_rr)
    print(f"# RANGE_RATE_RANK {rank_rr}")
    print(f"# RANGE_RATE_DEFECT {defect_rr}")
    print(f"# RANGE_RATE_COND_FINITE {'true' if np.isfinite(cond_rr) else 'false'}")
    print(f"# RANGE_RATE_COND {cond_rr:.15e}")

    print(f"# range-only rank {rank_ro} (defect {defect_ro}, cond finite="
          f"{np.isfinite(cond_ro)}); range+rate rank {rank_rr}.", file=sys.stderr)


if __name__ == "__main__":
    main()
