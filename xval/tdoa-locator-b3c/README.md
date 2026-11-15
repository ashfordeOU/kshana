<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3c: the TDOA locator's successor: readings

Pre-registration: `docs/design/evidence/b3c-tdoa-locator-successor/PREREGISTRATION.md` (15 November 2026). These
readings fix every choice it leaves open. They were written on 15 November 2026, with the pre-registration, before the
oracle, before any B3c engine code and before any B3c session was drawn. A reading may later be added to record what
happened; none of these is changed after the development run.

Notation as in B3b's readings (`xval/tdoa-locator/README.md`): `f_s` = 4 × 10⁶ Hz, `N` = 40 000, `M` = 80 000 (the
zero-padded correlation length), `σ_c` = 20 ns, `x_i` station `i`'s snapshot.

## The world

U1. **Sessions.** Drawn by `locate_tdoa::session(seed, first_seed)`, B3b's generator, unchanged (B3b readings T1 to
    T7, T14's waveform rule with `first_seed` the first seed of the set). B3c reads only the stations, the snapshots
    and, for scoring, the truth.
U2. **Seeds.** Development 8001 to 8200 (`first_seed` 8001); gate 9001 to 10000 (`first_seed` 9001). Neither range
    has been drawn by B3a, B3b or any other run of this generator.

## The locator

U3. **Measured SNR and reference.** B3b's T8 and T9, unchanged.
U4. **Bandwidth and period screen.** `A(k) = |Σ_n x_ref[n] conj(x_ref[n − k])|`, computed as the inverse FFT of
    `|X_ref|²` on `M` points (zero padding). `ρ(k) = A(k) / (N ŝ_ref)` for `k ≥ 1`.
    - `k₀` is the smallest `k` in 1 to 16 with `ρ(k) < 0.5`. If there is none, the session is **narrowband**: "not
      located: no usable bandwidth" (no delay is estimated).
    - Otherwise the **period** `P_int` is the smallest `k` in `k₀ + 1` to 200 with `ρ(k) ≥ 0.5`, `ρ(k) ≥ ρ(k − 1)` and
      `ρ(k) ≥ ρ(k + 1)`. Without one the waveform is **aperiodic**. With one, `P̂` (samples) is `P_int` refined by U5's
      golden-section search on the interpolant of U5 with `G = |X_ref|²`.
U5. **Delay and its refinement.** For each other station `i`: `G = X_i · conj(X_ref)` (both zero-padded to `M`), the
    lag window `K_i` and the largest-sample lag `k*` exactly as B3b's T10 (ties: the smallest `k`). If `k*` is strictly
    inside the window, `k*` is refined on the band-limited interpolant
    `f(t) = |Σ_q G_q exp(j 2π q' t / M)|²`, `q'` the signed index (`q` if `q ≤ M/2`, else `q − M`), by golden-section
    search: `[a, b] = [k* − 1, k* + 1]`, `φ = (√5 − 1)/2`, `c = b − φ(b − a)`, `d = a + φ(b − a)`; while `b − a > 10⁻⁴`:
    if `f(c) > f(d)` then `b = d, d = c, c = b − φ(b − a)`, else `a = c, c = d, d = a + φ(b − a)` (each new point
    evaluated once); the result is `(a + b)/2`. At the window's edge `k*` is used as it is. `τ̂_i` = the result / `f_s`.
U6. **σ per pair.** `σ_i² = CRB_i + 2 σ_c² + σ_r²`, `σ_r` = 2.5 ns, with `CRB_i` and `β²` as B3b's T11. The covariance
    has `σ_i²` on the diagonal and `σ_c²` off it, as T11.
U7. **Periodic residuals.** With a period, the residual of pair `i` at `p` is `w(τ̂_i − τ_i(p))`, with
    `w(x) = x − P · floor(x / P + 0.5)` and `P = P̂ / f_s`; aperiodic, `w(x) = x`. The model `τ_i(p)` is T12's.
U8. **Solver.** Cost `r^T C⁻¹ r` with U7's residuals. Start: T12's grid point of least cost (ties: the first in grid
    order). Gauss–Newton with T12's Jacobian (central differences of 0.5 m on the model): the step `s = (J^T C⁻¹ J)⁻¹
    J^T C⁻¹ r`; if `|s| > 1 000 m` it is scaled to 1 000 m; if the cost at `p + s` is not lower than at `p`, `s` is
    halved, at most 10 times; if no halving lowers it, the solver stops at `p`. An accepted step shorter than 1 mm
    stops it; at most 50 steps.
U9. **Region and consistency.** T13's ellipse and area at the solution. The session is **located** when it is not
    narrowband, the solution is within 10 km of the stations' hull, and the final cost is at most the χ² quantile at
    0.999 with `N_s − 3` degrees of freedom.

## The gate

U10. **Metrics.** B3b's T15, unchanged, on two populations: **G-all** (every gate session) and **G-wb** (the gate
     sessions whose drawn waveform is chirp or noise). Each is also reported per waveform, without a bar. A narrowband
     or otherwise unlocated session counts as not covered, area share 1, and the error to the domain's centroid. G-all's
     T1 is expected below 0.90 by construction (U4 makes CW sessions narrowband).
U11. **T4 determinism.** The gate's result file has the same bytes from a Linux debug and release build, and the
     whole recorded gate is reproduced on Linux, macOS and Windows by a CI job.
U12. **Independent check.** `oracle.py` (numpy and the standard library only, no engine code) reads one session's
     input as the engine writes it (B3b's `oracle_input`) and recomputes U3 to U9. On gate seeds 9001 to 9020: the
     reference, the narrowband and periodic classes, every `k*`, the located and covered flags must be equal; `P̂` within
     10⁻³ sample; every `τ̂` within 10⁻¹⁰ s (the golden-section tolerance is 25 ps); every `σ_i` within 10⁻⁹ relative;
     the solution within 5 cm; the region area within 10⁻⁴ relative. Disagreement is a fault to find, not a result.
U13. **Runs.** Development once (seeds 8001 to 8200), to find faults, not to tune; then the gate once (9001 to
     10000). No number above is changed after the development run.
