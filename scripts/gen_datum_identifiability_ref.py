# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the SciPy/NumPy external-oracle cross-check fixture for
`kshana::lunar_identifiability::decompose`.

For each synthetic 7x7 symmetric positive-definite matrix M, with kept pair
K=[0,3] and marginalized M_idx=[1,2,4,5,6], this script computes via NumPy/SciPy:

  S = M[K,K] - M[K,Midx] @ inv(M[Midx,Midx]) @ M[Midx,K]   (2x2 Schur complement)
  degeneracy_metric = lambda_min(S)
  origin_crlb_m    = sqrt(inv(S)[0,0])
  origin_scale_corr = inv(S)[0,1] / sqrt(inv(S)[0,0] * inv(S)[1,1])

These quantities match exactly what `decompose` returns (Schur path).
The Rust test reads this CSV, runs `decompose` on the same matrices, and asserts
agreement to 1e-9 relative tolerance.

Oracle: NumPy (Harris et al. 2020) + SciPy (Virtanen et al. 2020) — independent of
any Rust code.

Reproduce (offline, no Kshana code involved):
    /tmp/kshana-oracles/.venv/bin/python scripts/gen_datum_identifiability_ref.py

Seed: 20260630
"""

import hashlib
import sys
import numpy as np
from scipy.linalg import eigvalsh

# ── Index constants (must match Rust) ────────────────────────────────────────
K = [0, 3]
M_IDX = [1, 2, 4, 5, 6]

OUTPUT = "tests/fixtures/datum_identifiability/scipy_ref.csv"


def schur_metrics(M: np.ndarray) -> tuple[float, float, float]:
    """Compute degeneracy_metric, origin_crlb_m, origin_scale_corr via Schur complement."""
    I_KK = M[np.ix_(K, K)]           # 2x2
    I_KM = M[np.ix_(K, M_IDX)]       # 2x5
    I_MM = M[np.ix_(M_IDX, M_IDX)]   # 5x5

    I_MM_inv = np.linalg.inv(I_MM)   # 5x5 — full-rank by construction

    # Schur complement S = I_KK - I_KM @ I_MM_inv @ I_MK
    S = I_KK - I_KM @ I_MM_inv @ I_KM.T

    # Symmetrize S for numerical safety
    S = (S + S.T) / 2.0

    # degeneracy_metric = lambda_min(S)
    eigs = eigvalsh(S)               # ascending order
    degeneracy_metric = float(eigs[0])

    # 2x2 analytic inverse of S (exactly mirrors Rust)
    det = S[0, 0] * S[1, 1] - S[0, 1] ** 2
    if det > 0.0:
        s_inv_00 = S[1, 1] / det
        s_inv_01 = -S[0, 1] / det
        s_inv_11 = S[0, 0] / det
        origin_crlb_m = float(np.sqrt(max(s_inv_00, 0.0)))
        if s_inv_00 > 0.0 and s_inv_11 > 0.0:
            origin_scale_corr = float(s_inv_01 / np.sqrt(s_inv_00 * s_inv_11))
        else:
            origin_scale_corr = 0.0
    else:
        origin_crlb_m = float("inf")
        origin_scale_corr = 0.0

    return degeneracy_metric, origin_crlb_m, origin_scale_corr


def build_matrices() -> list[np.ndarray]:
    """Build the deterministic set of 16 synthetic 7x7 SPD matrices."""
    rng = np.random.default_rng(20260630)
    matrices = []

    # Regime 1: 10 well-conditioned SPD matrices (A @ A.T + 0.1*I)
    for _ in range(10):
        A = rng.standard_normal((7, 7))
        M = A @ A.T + 0.1 * np.eye(7)
        matrices.append(M)

    # Regime 2: near-degenerate in the {0,3} pair (rho ∈ [0.90, 0.97, 0.99, 0.995])
    # Start from I_7, set M[0,3]=M[3,0]=rho; block M_MM stays I_5 so Schur = I_KK - 0.
    for rho in [0.90, 0.97, 0.99, 0.995]:
        M = np.eye(7)
        M[0, 3] = rho
        M[3, 0] = rho
        # Ensure SPD: min eigenvalue of [[1,rho],[rho,1]] = 1-rho > 0 for rho < 1.
        matrices.append(M)

    # Regime 3: non-zero K↔M coupling (exercises the Schur subtraction term)
    # Two matrices with non-trivial cross-coupling, re-symmetrized and bumped to SPD.
    for (off_vals, bump) in [
        ([(0, 1, 0.4), (3, 4, 0.3), (0, 2, 0.2)], 0.8),
        ([(0, 1, 0.6), (3, 5, 0.5), (0, 4, 0.35), (3, 2, 0.25)], 1.2),
    ]:
        M = np.eye(7)
        M[0, 3] = 0.7   # {t_x, scale} coupling
        M[3, 0] = 0.7
        for (r, c, v) in off_vals:
            M[r, c] = v
            M[c, r] = v
        M = (M + M.T) / 2.0 + bump * np.eye(7)
        matrices.append(M)

    assert len(matrices) == 16, f"expected 16 matrices, got {len(matrices)}"
    return matrices


def float_repr(x: float) -> str:
    """Full-precision f64 repr (%.17g), matching Rust f64 parse."""
    return f"{x:.17g}"


def main() -> None:
    np_ver = np.__version__
    try:
        import scipy
        sp_ver = scipy.__version__
    except Exception:
        sp_ver = "unknown"

    matrices = build_matrices()

    # Column header: 49 matrix entries + 3 expected outputs
    col_names = [f"m{i}{j}" for i in range(7) for j in range(7)]
    col_names += ["degeneracy_metric", "origin_crlb_m", "origin_scale_corr"]
    header = ",".join(col_names)

    rows_out = [header]
    for M in matrices:
        dm, crlb, corr = schur_metrics(M)
        flat = [float_repr(M[i, j]) for i in range(7) for j in range(7)]
        flat += [float_repr(dm), float_repr(crlb), float_repr(corr)]
        rows_out.append(",".join(flat))

    csv_text = "\n".join(rows_out) + "\n"

    with open(OUTPUT, "w") as f:
        f.write(csv_text)

    sha256 = hashlib.sha256(csv_text.encode()).hexdigest()
    print(f"Wrote {OUTPUT}")
    print(f"Matrices: {len(matrices)}")
    print(f"NumPy version: {np_ver}")
    print(f"SciPy version: {sp_ver}")
    print(f"SHA-256: {sha256}")

    # Also return values for NOTICE generation
    return sha256, np_ver, sp_ver, len(matrices)


if __name__ == "__main__":
    result = main()
    if result:
        sha256, np_ver, sp_ver, n = result
        # Emit NOTICE
        notice_path = "tests/fixtures/datum_identifiability/NOTICE.md"
        notice = f"""# Datum Identifiability Fixture — SciPy/NumPy Oracle

## Purpose

`scipy_ref.csv` is an **independent-library oracle** for the decomposition linear
algebra in `kshana::lunar_identifiability::decompose`. It is consumed by the Rust
test `decompose_matches_scipy_reference` in
`tests/lunar_datum_identifiability_reference.rs`.

The oracle verifies that Rust reproduces — to 1e-9 relative tolerance — the
Schur-complement degeneracy metric, origin CRLB, and origin↔scale correlation
computed by NumPy/SciPy on the same 7×7 symmetric positive-definite matrices.
This is the ExternalDataset validation of the decomposition linear algebra.

## Oracle

- **NumPy** {np_ver} (Harris et al. 2020, Nature 585, 357–362; BSD-3-Clause)
- **SciPy** {sp_ver} (Virtanen et al. 2020, Nature Methods 17, 261–272; BSD-3-Clause)
- Generator: `scripts/gen_datum_identifiability_ref.py`
- Seed: 20260630 (`numpy.random.default_rng(20260630)`)

## Matrices ({n} total)

| Regime | Count | Description |
|--------|-------|-------------|
| Well-conditioned SPD | 10 | `A @ A.T + 0.1*I`, `A` ~ N(0,1) |
| Near-degenerate {{0,3}} pair | 4 | `I_7` with `M[0,3]=M[3,0]=ρ`, ρ ∈ {{0.90, 0.97, 0.99, 0.995}} |
| Non-zero K↔M coupling | 2 | Mixed off-diagonal, re-symmetrized + bump |
| **Total** | **{n}** | |

## Column layout

Columns 0–48: flattened 7×7 matrix entries `m00,m01,…,m66` (row-major).
Column 49: `degeneracy_metric` = λ_min(S), where S is the 2×2 Schur complement
  of the {{origin-X, scale}} = {{0,3}} block in the 7×7 matrix.
Column 50: `origin_crlb_m` = sqrt(S⁻¹[0,0]).
Column 51: `origin_scale_corr` = S⁻¹[0,1] / sqrt(S⁻¹[0,0] · S⁻¹[1,1]).

Kept pair K = [0, 3]; marginalized M_idx = [1, 2, 4, 5, 6].
All values at full f64 precision (%.17g).

## SHA-256

`{sha256}`

## Scope (honest)

This oracle validates the **linear algebra** of `decompose` (Schur complement
computation, eigenvalue, 2×2 analytic inverse). The lunar-geometry magnitudes
(correlation, CRLB under real LLR schedules) remain **Modelled** — see
`src/lunar_identifiability.rs` module doc and `src/verification.rs`.
"""
        with open(notice_path, "w") as f:
            f.write(notice)
        print(f"Wrote {notice_path}")
