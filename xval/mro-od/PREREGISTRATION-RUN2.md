# Pre-registration: CAP-30 run 2, Mars short-arc orbit determination with a damped estimator

Committed on its own on 2026-10-14, before any fit or prediction with the run-2 estimator on the
scored passes S1 and S2. It extends `xval/mro-od/PREREGISTRATION.md` (stage 2, amendments A1 and
A2), whose data, measurement model, dynamics, editing rule, scored arc and bars all stay in force
unchanged. Only the estimator's numerical method changes. The bars are not loosened after a run.

## Run 1 stays recorded

Run 1, the registered Gauss-Newton fit, stopped on the scored arc with "normal matrix is not
positive definite" and produced no orbit. B1 was MET at 0.01253 Hz, and B2-B5 were NOT MET. That
verdict and its pin in `tests/mro_odf_short_arc_od_oracle.rs` stay as they are: they are not
removed, rewritten or superseded. Run 2 is reported next to run 1.

## Diagnosis (development pass D, DSS 43, only)

Nothing below was computed on S1 or S2.

- The normal matrix of the 8 parameters has a raw diagonal spanning about eight orders of
  magnitude: about 6 to 1.2e2 for position (Hz²/m²) and 2.7e7 to 1.2e8 for velocity
  (Hz²/(m/s)²). Scaled by its diagonal, the smallest eigenvalue is about 9e-10 and the largest
  about 7.7. The near-singular direction lies in the 6 state parameters themselves (scaled state
  block: smallest eigenvalue 1.0e-9). Leaving out SRP or drag does not change it (state+SRP
  1.0e-9, state+drag 8.7e-10). The unscaled Cholesky factorisation therefore works at a
  condition number near 1e17, the limit of double precision.
- The undamped first step from the registered guess (+1 km, +1 m/s per axis) moves the position
  to 17-24 km from `mro_psp5` and the SRP coefficient to −0.19 m²/kg, and the fit then recovers.
  On pass D, the registered fit converged in 8 iterations: 20.2 mHz post-fit, 218 m RMS and
  315 m maximum against `mro_psp5`.
- The MAD mask did not collapse: it kept 168-175 of 178 points on every iteration.
- With the initial offset tripled (+3 km, +3 m/s per axis), the registered fit fails on pass D
  with the same error as run 1 ("normal matrix is not positive definite"). This reproduces the
  run-1 failure on the development pass.

## The run-2 estimator (fixed here)

`mars_od::fit_damped`, as committed in cf83e08e. The parameters, initial guess, finite-difference
partials, elevation cut and outlier rule are those of the registered `fit`. Only two things are
added:

1. **Diagonal scaling.** The normal matrix and right-hand side are divided by
   `sqrt(N_pp·N_qq)` and `sqrt(N_pp)` before the solve, and the step is unscaled afterwards.
2. **Levenberg-Marquardt damping.** `λ` is added to the diagonal of the scaled matrix, starting
   at 1e-3. A trial step is accepted only when it lowers the sum of squared residuals over the
   points the outlier rule kept at the start of that iteration. On acceptance `λ` is divided by
   10 (floor 1e-12); otherwise it is multiplied by 10 and the step retried, at most 10 times.

The fit stops when an accepted position update is below 1 m, when no trial step lowers the cost,
or after 15 Jacobian evaluations (the A1 limit). `fit` itself is not changed.

Pass D, not scored:

| Initial offset | Registered `fit` | `fit_damped` |
|---|---|---|
| +1 km, +1 m/s | 20.2 mHz, 218 m RMS, 315 m max, 8 iterations | 22.2 mHz, 162 m RMS, 235 m max, 9 iterations, no rejected step |
| +3 km, +3 m/s | fails: normal matrix not positive definite | 22.2 mHz, 171 m RMS, 248 m max, 10 iterations, no rejected step |

## What stays as registered

- Data and SHA-256 pins: `PREREGISTRATION.md`. GMM-3 comes from the complete
  `gmm3_120_sha.tab` (degree and order 120, pinned), truncated to degree and order 80.
- Measurement model and amendments A1 and A2: the observable, the 1.5 m radial antenna offset,
  station time, ramp coverage.
- Dynamics, the 8 estimated parameters, and the initial guess: the `mro_psp5` state at
  2007-304T23:00:00 UTC plus (+1 km, +1 km, +1 km) and (+1 m/s, +1 m/s, +1 m/s), with SRP
  coefficient 0.043 m²/kg and drag scale 1.
- The scored arc: passes S1 and S2, every 2-way point received from 2007-304T23:00:00 to
  2007-305T12:45:00 UTC.
- Editing: 15° receive elevation, then the 5 × 1.4826 × MAD rule iterated to a fixed point.
- The bars B1-B5, unchanged:

| Id | Quantity, on the scored arc | Bar |
|---|---|---|
| B1 | RMS of observed minus predicted 2-way Doppler from `mro_psp5`, after editing (estimator-independent; re-reported) | ≤ 0.030 Hz |
| B2 | post-fit RMS of the 2-way Doppler residuals | ≤ 0.030 Hz |
| B3 | RMS of the 3-D position difference, estimate minus `mro_psp5`, every 60 s over the scored arc | ≤ 1.0 km |
| B4 | maximum of that 3-D difference | ≤ 2.5 km |
| B5 | fraction of the scored 60-s points removed by the outlier rule (after the elevation cut) | ≤ 5 % |

## Run and outcome rule

The scored arc is fitted once with `fit_damped`. No setting above is changed after that run.

- If B1-B5 all hold, the TRK-2-18 row is extended with the run-2 result. It may become VALIDATED
  only under the data-gated rule: the inputs are fetched at test time with pinned SHA-256s (the
  test fails on a mismatch), the monthly CI job runs the test with `KSHANA_REQUIRE_REALDATA=1`,
  and the row states the gating.
- If any bar misses, the miss is recorded below with its numbers as a FINDING, pinned by a test
  asserting the recorded values, and the row stays MODELLED.
- Either way, run 1's NOT MET verdict and its pin stay.
