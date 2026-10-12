# Pre-registration: the robust Kepler solver against mpmath roots

Committed alone, before `kshana::kepler::solve_kepler_markley` (and its wrapper
`propagator::solve_kepler_robust`) is compared with the oracle roots. The bars are not loosened
after the comparison; a miss is recorded with its numbers in `RESULTS.md` beside this file.

## What is compared

- **Oracle (Library).** mpmath 1.3.0 at 50 significant digits:
  `tests/fixtures/kepler_mpmath_oracle/gen_reference.py` → `reference.json`. For each float64
  pair `(e, M)` the root of `E − e·sin E = M` is computed from the exact binary values of `e`
  and `M` (bisection on `[M − e, M + e]`, where the function is strictly increasing, then two
  Newton steps; the generator asserts `|f(E)| < 1e-45·max(1, |M|)`), and stored as a
  double-double `E_mp ≈ hi + lo`, with the condition factor `1 − e·cos E`.
- **Grid (405 points).** `e ∈ {0, 1e-6, 0.1, 0.5, 0.9, 0.99, 0.999, 0.9999, 0.999999}` ×
  `M ∈ {1e-12, 1e-9, 1e-6, 1e-3, 1e-2, 0.1, kπ/32 (k = 1…31), π − 1e-3, π − 1e-6, π − 1e-9,
  fl(π), −1e-12, −1e-6, −1, −3}`.
- **Winding (9 points).** `M ∈ {7, −50, 1000}` × `e ∈ {0.1, 0.5, 0.9}`; `E` carries the same
  `2π` winding as `M`.

## Conditioning, stated honestly

`dE/dM = 1/(1 − e·cos E)`, which reaches `1/(1 − e) = 1e6` at `e = 0.999999` near perigee. An
error `δ` in the computed residual becomes an error `δ/(1 − e·cos E)` in `E`. With the naive
residual `E − e·sin E − M`, `δ ~ ε·|E|` (cancellation of the two large terms), so the attainable
relative accuracy of `E` degrades like `ε/(1 − e·cos E)`: up to ~1e6 ulps for `e → 1`, `M → 0`.
The solver evaluates the residual as `(1 − e)·E + e·(E − sin E) − M` (`1 − e` exact for
`e ≥ 0.5`, `E − sin E` by series for `|E| < 0.75`), whose rounding error is `~ε·|M|`; and on
`[0, π]`, `M ≤ E·(1 − e·cos E)` (because `sin E ≥ E·cos E`), so the error in `E` is
`≲ ε·|M|/(1 − e·cos E) ≤ ε·|E|`. The bar is therefore stated **relative to |E|**, uniformly over
the grid. Separately, `M` itself is taken as exact (the float64 input); the error of reducing a
wound `M` into `[−π, π]` (`M − k·fl(2π)`, `fl(2π)` off by 2.4e-16) is input error amplified by
`1/(1 − e·cos E)` and gets its own term in the winding bar.

## Bars (each must hold for every point)

- **K1 (grid).** `solve_kepler_markley` returns `Ok`, and
  `|E − E_mp| ≤ 8ε·|E_mp|` (ε = 2.22e-16; computed as `|(E − hi) − lo|`). For `e = 0` it returns
  `E = M` exactly.
- **K2 (winding).** `|E − E_mp| ≤ 8ε·|E_mp| + 4ε·|M|/(1 − e)`.
- **K3 (iterations).** At most **2** Newton polishing steps after Markley's starter and his
  fifth-order correction, at every grid and winding point.
- **K4 (wrapper).** `propagator::solve_kepler_robust` returns the same `E` bit for bit as
  `solve_kepler_markley` at every point.
- **K5 (Kepler residual, derived).** The true residual `|E − e·sin E − M| = |E − E_mp|·(1 − e·cos E)`
  to first order; it is reported (max over the grid, in units of `ε·|M|`) but the bar is K1.

**Not a bar (reported only).** The errors of the public legacy solvers on the same grid
(`propagator::solve_kepler_checked` with 30 iterations, and `ephem::solve_kepler`; the third,
`orbit::solve_kepler`, is crate-private and not reachable from an integration test) are listed
in `RESULTS.md` for context; they keep their numerical outputs because committed goldens
depend on them.

## What a pass and a miss mean

A pass on K1–K4 validates the shared solver (VALIDATED, Library oracle: mpmath) over
`0 ≤ e ≤ 0.999999` and all `M`. A miss is reported in `RESULTS.md` with its numbers, not tuned
away, and the claim stays MODELLED for the affected region.
