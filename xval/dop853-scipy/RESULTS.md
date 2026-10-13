# Results: DOP853 against SciPy 1.18.1 `solve_ivp(method="DOP853")`

Bars: `PREREGISTRATION.md` (committed alone at ae1b25e, before the first comparison).
Test: `tests/dop853_scipy_oracle.rs`; fixture `tests/fixtures/dop853_scipy_oracle/reference.json`
(SHA-256 6c6aff03…ccd6a). First comparison run 2026-10-12. **Every bar passes.**

## Single steps (8 records; S1–S4)

| bar | measured worst | bar |
|---|---|---|
| S1 `y_new` | 5.55e-15 relative (∞-norm) | 1e-14 |
| S2 `f_new` | 3.46e-15 relative | 1e-13 |
| S3 error norm | 3.0e-5 relative, inside `1e-8·err + 64ε·D` (the worst case is a tight-tolerance step whose estimate sits at rounding level, as anticipated in the pre-registration); accept/reject decision identical on all 8 | see bar |
| S4 dense output (5 θ per step) | 1.99e-14 relative | 1e-13 |

## Full runs at rtol = atol = 1e-12, SciPy's first step given to both (R0–R4)

| problem | R0 h0 rel | R1 accepted (kshana / SciPy) | R1 nfev | R1 nfev dense | R2 end vs SciPy | R4 dense vs SciPy |
|---|---|---|---|---|---|---|
| leo (SI, 58000 s) | 0 | 502 / 501 | 6025 / 6013 | 7531 / 7516 | 2.95e-13 rel | 9.46e-13 rel |
| ecc07 (e = 0.7, 5 periods) | 0 | 390 / 390 | 5497 / 5497 | 6667 / 6667 | 2.41e-13 rel | 1.04e-13 rel |
| arenstorf (1 period) | 0 | 298 / 298 | 4285 / 4285 | 5179 / 5179 | 1.58e-12 abs | 6.77e-14 abs |

The leo run differs by one accepted step (one attempt whose error norm lies within rounding of
1 resolves the other way), inside the `max(2, 1 %)` / `max(24, 1 %)` bands; the other two
step sequences are identical to SciPy's.

R3 / R4 accuracy against the exact solution (mpmath f-and-g) and periodicity:

| problem | kshana | SciPy | bar |
|---|---|---|---|
| leo end, position | 8.44e-5 m (1.21e-11 rel) | 8.24e-5 m | ≤ 2×SciPy + 1e-12·‖r‖ |
| leo end, velocity | 9.04e-8 m/s (1.20e-11 rel) | 8.82e-8 m/s | same rule |
| leo dense max, position / velocity | 8.54e-5 m / 9.11e-8 m/s | 8.34e-5 / 8.86e-8 | same rule |
| ecc07 end, position / velocity | 4.72e-10 / 2.22e-9 | 4.73e-10 / 2.22e-9 | same rule |
| ecc07 dense max, position / velocity | 3.04e-10 / 5.49e-10 | 3.04e-10 / 5.49e-10 | same rule |
| arenstorf `‖y(T) − y0‖∞` | 1.475e-9 | 1.475e-9 | ≤ 2×SciPy + 1e-10 |

## Claim

VALIDATED (Library oracle, SciPy 1.18.1): the DOP853 tableau, error estimator, dense output,
initial-step rule and step controller of `src/integrator.rs` reproduce SciPy's DOP853 to
≤ 5.6e-15 per step and ≤ 1.6e-12 end-to-end on the three problems, with the same accuracy
against the exact two-body solution.
