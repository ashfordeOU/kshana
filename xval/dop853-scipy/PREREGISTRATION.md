# Pre-registration: the DOP853 integrator against SciPy's `solve_ivp(method="DOP853")`

Committed alone, before kshana's DOP853 (`src/integrator.rs`: `dop853_step`,
`dop853_initial_step`, `integrate_dop853_checked`, `integrate_dop853_dense`) is compared with the
oracle output. The bars below are not loosened after the comparison; a miss is recorded with its
numbers in `RESULTS.md` beside this file.

## What is compared

- **Oracle (Library).** SciPy 1.18.1 (BSD-3-Clause) `scipy.integrate.solve_ivp(method="DOP853")`,
  its `rk_step` / `DOP853._estimate_error_norm` / `DOP853._dense_output_impl` for single steps,
  and `scipy.integrate._ivp.common.select_initial_step` for the automatic first step. The exact
  two-body solution comes from mpmath 1.3.0 (40 digits, f-and-g functions in the eccentric-anomaly
  change). Generator: `tests/fixtures/dop853_scipy_oracle/gen_reference.py`, output
  `reference.json`, run with numpy 2.3.5.
- **Problems.** (a) `leo`: two-body, SI, μ = 3.986004418e14, circular 7000 km orbit inclined 45°,
  0 → 58000 s (~9.9 periods). (b) `ecc07`: planar two-body, μ = 1, a = 1, e = 0.7 from perigee,
  0 → 10π (5 periods). (c) `arenstorf`: the Arenstorf restricted three-body orbit (Hairer,
  Nørsett and Wanner, *Solving ODEs I*, §II.0), μ = 0.012277471, y0 = (0.994, 0, 0,
  −2.00158510637908252240537862224), one period T = 17.0652165601579625588917206249. The
  right-hand sides are written with the same operation order in the generator and the test.
- **Full runs** at rtol = atol = 1e-12. SciPy's step selection differs from Hairer's Fortran
  only in its initial-step routine; to compare step sequences both runs are given SciPy's own
  automatic first step `h0` (recorded in the fixture).
- **Single steps.** Eight records (2 leo, 3 ecc07, 3 arenstorf) from identical `(t, y, h)` and
  tolerances (1e-12 … 1e-7), with step sizes chosen to give error norms from ~1e-6 to ~1e9
  (accepted and rejected attempts alike), and the step's dense output at θ = 0.1, 0.25, 0.5,
  0.75, 0.9 (evaluated whether or not the controller would accept the step).

## Bars (each must hold for every record)

Single step (`dop853_step` against SciPy's `rk_step` with the same `f(t, y)`):

- **S1** state: `‖y_new − y_new,SciPy‖∞ ≤ 1e-14·‖y_new,SciPy‖∞`.
- **S2** FSAL derivative: `‖f_new − f_new,SciPy‖∞ ≤ 1e-13·‖f_new,SciPy‖∞` (one more RHS
  evaluation on a state that already differs at S1's level; the RHS may amplify it).
- **S3** error norm: `|err − err_SciPy| ≤ 1e-8·err_SciPy + 64ε·D`, with
  `D = |h|·17.4·maxᵢ(maxⱼ|kⱼᵢ| / sᵢ)` the rounding scale of the estimate (17.4 > Σ|E5| + Σ|E3|,
  `sᵢ` the error scale). The error estimate is a near-cancelling stage combination; when the
  local error is near rounding level (tight tolerance, small step) its relative value is
  dominated by summation order, which is not a tableau property. And the accept/reject decision
  (`err < 1`) must agree wherever `|err_SciPy − 1| > 1e-6`.
- **S4** dense output: `‖y(θ) − y_SciPy(θ)‖∞ ≤ 1e-13·‖y_SciPy(θ)‖∞` at all five θ (the
  dense-output coefficients reach |d| ≈ 528 and amplify stage rounding by up to ~10×).

Full runs (SciPy's `h0` given to both):

- **R0** initial step: `|h0_kshana − h0_SciPy| ≤ 1e-12·h0_SciPy` (`dop853_initial_step` vs
  `select_initial_step`, error-estimator order 7).
- **R1** counts: accepted steps within `max(2, 1 %)` of SciPy's; `nfev` (without and with dense
  output) within `max(24, 1 %)` of SciPy's. (The controllers are meant to be identical, so the
  expected difference is zero; the band allows for an accept/reject flip of an attempt whose
  error norm lies within rounding of 1.) The dense run's final state must equal the plain run's
  bit for bit.
- **R2** end state vs SciPy: two-body, per block (position, velocity)
  `‖Δ‖₂ / ‖·_SciPy‖₂ ≤ 1e-9`; Arenstorf `‖Δ‖∞ ≤ 1e-7` (canonical units; the orbit passes close
  to the Moon twice per period and amplifies any step-sequence difference).
- **R3** accuracy: two-body, per block, kshana's distance to the exact (mpmath) end state
  `≤ 2·(SciPy's distance) + 1e-12·‖exact block‖₂`; Arenstorf periodicity
  `‖y(T) − y0‖∞ ≤ 2·(SciPy's) + 1e-10`.
- **R4** dense output at the 40 times `t_end·(k + ½)/40`: the R2 bars against SciPy's dense
  output; for two-body, the R3 rule applied to the maximum distance over the 40 times from the
  exact solution.

## What a pass and a miss mean

A pass on S1–S4 validates the transcribed tableau, error estimator and dense-output
coefficients against an independent implementation (VALIDATED, Library oracle). A pass on R0–R4
validates the step controller and driver behaviour and the end-to-end accuracy on the three
problems. A miss is reported in `RESULTS.md` with its numbers; it is not tuned away and the
corresponding claim stays MODELLED.
