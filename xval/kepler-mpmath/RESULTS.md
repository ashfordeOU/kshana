# Results: the robust Kepler solver against mpmath 1.3.0 roots

Bars: `PREREGISTRATION.md` (committed alone at df22174, before the first comparison).
Test: `tests/kepler_mpmath_oracle.rs`; fixture `tests/fixtures/kepler_mpmath_oracle/reference.json`
(SHA-256 ef78cab6…44e51). First comparison run 2026-10-12. **Every bar passes.**

| bar | measured | bar |
|---|---|---|
| K1 grid (405 points, e up to 0.999999, M from 1e-12 to fl(π)) | worst `|E − E_mp|` = 0.898 ε·|E| (at e = 0.9999, M = π/32); `E = M` exactly at e = 0 | 8 ε·|E| |
| K2 wound M (9 points) | worst error / bar = 0.013 | `8ε·|E| + 4ε·|M|/(1 − e)` |
| K3 Newton polishing steps | 0 at all 414 points (Markley's starter + fifth-order correction already within `4ε·|E|`) | ≤ 2 |
| K4 `propagator::solve_kepler_robust` | bit-identical at all 414 points | bit-identical |
| K5 derived Kepler residual (reported) | worst 2.63 ε·|M| | (no bar) |

Context, not a bar (legacy solvers on the same grid, unchanged because goldens depend on them):
`propagator::solve_kepler_checked(M, e, 30)` returns `Err` at 3 of 405 points and, where it
returns `Ok`, its worst relative error in `E` is 1.0 (its stopping test is an absolute residual
of 1e-12, meaningless for `M` near 1e-12); `ephem::solve_kepler` reaches a relative error of
1.4e12 at the near-parabolic small-`M` corner (it does not converge there). `orbit::solve_kepler`
is crate-private and was not run.

## Claim

VALIDATED (Library oracle, mpmath 50 digits): `kepler::solve_kepler_markley` returns `E` within
one ulp-scale `ε·|E|` of the true root over `0 ≤ e ≤ 0.999999` and all `M`, including the
ill-conditioned near-parabolic, near-perigee corner, with no polishing iteration needed on the grid.
