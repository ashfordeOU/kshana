# Datum Identifiability Fixture — SciPy/NumPy Oracle

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

- **NumPy** 2.4.6 (Harris et al. 2020, Nature 585, 357–362; BSD-3-Clause)
- **SciPy** 1.18.0 (Virtanen et al. 2020, Nature Methods 17, 261–272; BSD-3-Clause)
- Generator: `scripts/gen_datum_identifiability_ref.py`
- Seed: 20260630 (`numpy.random.default_rng(20260630)`)

## Matrices (16 total)

| Regime | Count | Description |
|--------|-------|-------------|
| Well-conditioned SPD | 10 | `A @ A.T + 0.1*I`, `A` ~ N(0,1) |
| Near-degenerate {0,3} pair | 4 | `I_7` with `M[0,3]=M[3,0]=ρ`, ρ ∈ {0.90, 0.97, 0.99, 0.995} |
| Non-zero K↔M coupling | 2 | Mixed off-diagonal, re-symmetrized + bump |
| **Total** | **16** | |

## Column layout

Columns 0–48: flattened 7×7 matrix entries `m00,m01,…,m66` (row-major).
Column 49: `degeneracy_metric` = λ_min(S), where S is the 2×2 Schur complement
  of the {origin-X, scale} = {0,3} block in the 7×7 matrix.
Column 50: `origin_crlb_m` = sqrt(S⁻¹[0,0]).
Column 51: `origin_scale_corr` = S⁻¹[0,1] / sqrt(S⁻¹[0,0] · S⁻¹[1,1]).

Kept pair K = [0, 3]; marginalized M_idx = [1, 2, 4, 5, 6].
All values at full f64 precision (%.17g).

## SHA-256

`95ce84fb1218c8ac5c322c71a02eb7e6d52e333208f84b714c7fec305362850a`

## Scope (honest)

This oracle validates the **linear algebra** of `decompose` (Schur complement
computation, eigenvalue, 2×2 analytic inverse). The lunar-geometry magnitudes
(correlation, CRLB under real LLR schedules) remain **Modelled** — see
`src/lunar_identifiability.rs` module doc and `src/verification.rs`.
