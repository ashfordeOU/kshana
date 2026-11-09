<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M1: space RF geolocation accuracy: readings and B1 oracle

The pre-registration is `docs/design/evidence/m1-space-rf-geolocation/PREREGISTRATION.md`, signed off on 3 November
2026. The B2 transcription, `reference.csv` in that folder, was committed alone at ea82156b9. This file fixes what the
pre-registration leaves open, **before any engine code for M1**. `oracle.py` is the B1 oracle: numpy only, sharing no
code with the engine. MODELLED throughout.

## Readings

1. **Constants** (the engine's, stated here so the oracle uses the same numbers):
   - `μ = 3.986004418e14 m³/s²`;
   - `R_e = 6 378 137 m` (WGS 84 `a`, also the J2 reference radius);
   - `J2 = 1.08262668e-3`;
   - Earth rotation `ω_E = 7.2921151467e-5 rad/s`;
   - `c = 299 792 458 m/s`;
   - Boltzmann `k = 1.380649e-23 J/K`;
   - WGS 84 flattening `1/298.257223563`.
2. **Orbit.** Circular, `a = R_e + 550 km`, inclination from the first-order J2 sun-synchronous condition
   `cos i = −Ω̇_ss / (1.5 n J2 (R_e/a)²)` with `Ω̇_ss = 2π/(365.2422 × 86 400 s)` and `n = √(μ/a³)`: **97.5930°**, the
   registered 97.59° to its stated digits.
3. **Frame and phase** (not stated by the pre-registration; fixed here).
   - The inertial frame coincides with the Earth-fixed frame at the epoch, 2025-01-01 00:00 UTC (`t = 0`). Earth-fixed
     positions rotate by `ω_E t` about z; no precession, nutation or polar motion.
   - Satellite A has right ascension of the ascending node 0 and argument of latitude 0 at `t = 0`.
   - The registered 24 h window is `0 ≤ t < 86 400 s`.
4. **Propagation.** The engine's secular J2 model: node `Ω(t) = Ω0 + Ω̇ t` with `Ω̇ = −1.5 n J2 (R_e/a)² cos i`; argument
   of latitude `u(t) = u0 + (n + ω̇) t` with `ω̇ = 0.75 n J2 (R_e/a)² (5 cos² i − 1)`; no J2 correction to the mean motion.
   The Earth-fixed position rotates the orbital position by the node angle less `ω_E t`. The Earth-fixed velocity is the
   exact time derivative of that position.
5. **Formations.** F2 is A and B; F3 is A, B and C. B trails A in the same orbit by `Δu = d/a` (d = 50 km), and C trails
   B by the same. S1 uses A alone.
6. **Visibility and the pass.**
   - Elevation is measured at the emitter from the WGS 84 geodetic vertical.
   - Epochs are the grid `t = 0, 10, 20, … s` inside the 24 h window.
   - S1's pass is a maximal run of consecutive grid epochs with A at ≥ 10°.
   - For F2 and F3, an epoch counts only if **every** satellite of the formation is at ≥ 10°, and passes are maximal
     runs of such epochs.
   - One-pass bounds use the pass with the highest maximum elevation of A (the first on a tie). MP uses the passes in
     time order.
7. **Emitter.** A static point on the WGS 84 ellipsoid at height 0, at each P1–P10. The constraint of every bound is
   that ellipsoid: `F = ∇g` with `g(x) = (x² + y²)/a² + z²/b² − 1`.
8. **Measurements and unknowns.**
   - **S1.** At each pass epoch, `f_k = f_0 (1 − Ṙ_k/c)` with `Ṙ_k` the range rate of A relative to the static emitter.
     The unknowns are `(x, y, z, f_0)`, with `f_0` the class carrier. Measurements are independent with σ_f,k.
   - **F2 and F3.** At each epoch, the range differences `R_i − R_A` and range-rate differences `Ṙ_i − Ṙ_A` for
     `i = B` (and `C`), with A as reference. Each difference has the variance of its own pair: `(c σ_τ)²` and
     `(c σ_f / f_0)²`. Differences are independent of one another, so the covariance is diagonal.
   - **Partials.** Jacobians are analytic.
   - **The bound.** Fisher information `J = Hᵀ W H`, constrained CRLB
     `J⁻¹ − J⁻¹ F̃ (F̃ᵀ J⁻¹ F̃)⁻¹ F̃ᵀ J⁻¹`, with `F̃` the constraint gradient padded with zero for `f_0`. Its position
     block, rotated to local east-north-up, gives the 2×2 east-north block `C`.
9. **Noise per measurement** (the pre-registration's relations; the RMS widths fixed here).
   - `σ_τ = 1/(β_rms √(B T γ))` and `σ_f = 1/(τ_rms √(B T γ))`.
   - The RMS widths are those of a flat spectrum over `B` and a uniform window over `T`: `β_rms = 2π B/√12` (rad/s) and
     `τ_rms = 2π T/√12` (s·rad), so `σ_f` is in Hz.
   - The SNR at each epoch is `γ_i = EIRP − FSPL(R_i, f_0) + 0 dBi − 10 log10(k T_sys B)`, in dB, with `T_sys = 500 K`.
   - A pair uses `γ = γ_1 γ_2/(1 + γ_1 + γ_2)` in linear units; S1 uses `γ_A`.
   - B1's classes: **AIS**, 161.975 MHz, 41 dBm, B = 25 kHz, T = 26.7 ms; and the **30 dBm GNSS L1 jammer**,
     1575.42 MHz, 30 dBm, B = 2 MHz, T = 1 s.
10. **Metrics.**
    - `a ≥ b` are the square roots of the eigenvalues of `C`, and `DRMS = √(trace C)`.
    - The orientation is the angle of the major axis from north towards east, in `[0, π)`.
    - The 95 % axes are `2.448 a` and `2.448 b`.
11. **B1.**
    - The engine and `oracle.py` each write `a`, `b`, `DRMS` and orientation for S1, F2 and F3 × P1–P10 × {AIS, 30 dBm
      jammer} (60 cases, one pass each).
    - Bar: `a`, `b` and `DRMS` within 1e-6 relative; orientation within 1e-6 rad where `a/b > 1.01`, compared modulo π.
    - A case with no pass in the window is reported and counts as a match only if both sides report it.
12. **B2, how the published case is read** (Cao et al. 2015, `reference.csv`).
    - **Geometry.** Spherical: satellites at 42 164 km from the centre at the stated longitude and latitude; the target
      at 75.9° W, 45.35° N on the sphere `|u| = R = 6367.287 km`. The stated velocities are geocentric Earth-fixed
      components in km/h, and the target is static.
    - **Measurements and noise.** Eqs. (2)–(5) and (40)–(41). The TDOA block is `(c δ_t)² Q` and the FDOA block is
      `(c δ_f/f)² Q`, with `Q` having 1 on the diagonal and 0.5 off it; `c = 3e8 m/s`, `f = 14 GHz`. The satellite-error
      covariance is `Q_β = diag(δ_s² I_12, δ_ṡ² I_12)`.
    - **The bound.** Eq. (7) with Eqs. (8)–(10). `J = X − Y Z⁻¹ Yᵀ` absorbs the satellite-location error, and the
      constraint is `F = u/|u|`.
    - **The plotted S.** `√(trace CCRLB)` of the 3-D position, in km. The paper does not define S beyond calling it the
      geolocation RMSE; this reading is stated before any run.
    - **Comparison.** The 25 digitised values of Fig. 1(a)–(c); all are plot readings, so the bar is 20 % each.
    - **What the engine must provide.** The same constrained bound with satellite-location errors as nuisance (the
      Schur complement of Eq. 8), as a library function.
13. **B2 oracle, and when it runs.** `oracle.py --b2` computes Eq. (7) for the 25 points from reading 12. It is committed
    now but **not run before the engine's B2 run**. Running it first would score the published case before the engine
    exists. It runs once, after the engine run, as a cross-check (agreement within 1e-6 relative).
14. **B3.**
    - **Noise.** Gaussian at each measurement's σ, from a ChaCha8 stream seeded `4100 + p` for point `Pp`. Draws go in
      measurement order: epochs in time order, then the TDOA differences, then the FDOA differences.
    - **Start.** The truth moved 20 km due north along the ellipsoid.
    - **Solver.** Gauss-Newton on geodetic latitude and longitude at height 0. It has converged when a step moves the
      fix by less than 1 mm, within 50 iterations.
    - **Errors.** The horizontal error is the east-north distance from the truth. The RMS is taken over the converged
      trials.
15. **B4 and B5** as registered. B4 compares the fused Fisher matrix with the sum of the per-pass matrices, element by
    element, relative to the largest element.
