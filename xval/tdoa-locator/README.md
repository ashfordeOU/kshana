<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3b: fixed-station jammer locator by time difference of arrival: readings

Pre-registration: `docs/design/evidence/b3b-tdoa-locator/PREREGISTRATION.md` (signed off 10 November 2026). These
readings fix every choice the pre-registration leaves open. They were written on 12 November 2026, before the oracle
(`oracle.py`), before any B3b engine code and before any session was drawn. A reading may later be added to record
what happened; none of these is changed after the development run.

## The synthetic world

T1. **Constants.** `c` = 299 792 458 m/s; sample rate `f_s` = 4 × 10⁶ Hz; snapshot `N` = 40 000 complex samples
    (`T` = 10 ms); carrier 1 575.42 MHz (wavelength `λ = c / f_c`); station clock bias 1σ `σ_c` = 20 ns; shadowing 1σ
    6 dB; a spherical Earth of radius `R` = 6 371 000 m; station antennas 10 m and jammer 2 m above it.
T2. **Local frame and the sphere.** A point is given by local east and north `(e, n)` in metres about the centre
    59.0° N, 11.0° E and a height `h`. On the sphere it is `lat = lat₀ + n/R`, `lon = lon₀ + e/(R cos lat₀)`, and its
    position is `(R + h)(cos lat cos lon, cos lat sin lon, sin lat)`. Every distance is the straight line between two
    such positions. Errors, areas and spacings are measured in `(e, n)`.
T3. **Network (one session).** From the session's seed (ChaCha20):
    - the number of stations `N_s`, uniform on 6 to 12; the layout size `L`, uniform on 5 to 30 km;
    - each station uniform in the square `[−L/2, L/2]²`, redrawn while it lies closer than `0.25 L / √N_s` to an
      earlier one.
T4. **Domain.** The points within 10 km of the stations' convex hull (inside the hull counts as 0 km). Its area is
    `A_hull + P_hull · r + π r²` (r = 10 km), exact. The **grid** is every point `(e_min + 250 i, n_min + 250 j)`,
    `i, j ≥ 0`, up to `e_max, n_max`, where the bounds are the hull's box widened by 10 km, kept when in the domain.
    The domain's area centroid (for T3 of an unlocated session) is the mean of the grid points.
T5. **Jammer.** Uniform in the domain (uniform in the box, redrawn until in the domain). EIRP uniform on −10 to
    +10 dBW. The waveform is fixed by the seed: `(seed − first seed) mod 3` = 0 CW, 1 chirp, 2 noise, so the shares
    are equal to within one session.
T6. **Waveforms** (complex baseband, unit power):
    - **CW:** `exp(j(2π f₀ t + φ))`, `f₀` uniform on ±1.5 MHz, `φ` uniform.
    - **Chirp:** a sawtooth linear sweep from −1.8 MHz to +1.8 MHz over a period `P` uniform on 8 to 30 µs, with a
      random start offset; phase `2π(−f_d u + f_d u²/P)` with `u = (t + t_off) mod P`, `f_d` = 1.8 MHz.
    - **Noise:** complex white Gaussian samples at `f_s` on 65 536 points; a station's delayed copy is the inverse FFT
      of the spectrum times the delay's phase ramp; its samples 12 768 to 12 768 + N − 1 are the snapshot (the margin
      covers every delay in the domain).
    CW and chirp are evaluated at the delayed time directly.
T7. **Channel.** Each station receives the jammer delayed by `τ_i = d_i / c + b_i`, where `d_i` is the
    jammer-to-station distance (T2) and `b_i ~ N(0, σ_c)` the station's clock bias, with the complex gain
    `g_i = √EIRP · (λ / 4π) · (e^{−jk d₁}/d₁ − e^{−jk d₂}/d₂) · 10^{s_i/20} / √(k_B T₀ f_s)`: the two-ray ground
    reflection (coefficient −1) with `d₁ = √(ρ² + (h_S − h_J)²)`, `d₂ = √(ρ² + (h_S + h_J)²)`, `ρ` the great-circle
    distance, `s_i ~ N(0, 6 dB)`, `T₀` = 290 K, `k_B` = 1.380 649 × 10⁻²³ J/K. The reflected ray's extra delay
    (`2 h_S h_J / ρ`, under 1 ps beyond 100 m) is folded into the gain. Each station adds unit-variance complex white
    noise. So `|g_i|²` is the station's jammer-to-noise ratio per sample.

## The locator (what the engine and the oracle both implement)

T8. **Measured SNR.** `ŝ_i = max(10⁻⁶, mean |x_i|² − 1)` (the noise floor of 1 is known to the station).
T9. **Reference.** The station with the largest `ŝ_i` (ties: the lowest index).
T10. **TDOA.** For each other station `i`, `R(k) = Σ_n x_i[n] conj(x_ref[n − k])` by FFT on 80 000 points (zero
     padding). The lag window is `|k| ≤ K_i = ⌈(D_i / c + 6 √2 σ_c) f_s⌉ + 2`, `D_i` the baseline length. `k*` is the
     lag of the largest `|R|` in the window (ties: the smallest `k`). Unless `k*` is at the window's edge, a parabola
     through `|R|` at `k* − 1, k*, k* + 1` refines it: `δ = ½ (a − c) / (a − 2b + c)`. `τ̂_i = (k* + δ) / f_s`, the
     delay of station `i` after the reference.
T11. **σ per pair.** `σ_i² = CRB_i + 2 σ_c²`, with the Knapp–Carter bound
     `CRB_i = 1 / (8 π² β² N · SNR_eff)`, `SNR_eff = ŝ_i ŝ_ref / (1 + ŝ_i + ŝ_ref)`, and `β²` the reference's
     mean-square bandwidth about its spectral centroid: `P_k = max(0, |X_ref[k]|² / N − 1)` over the 40 000-point FFT
     of the reference snapshot, frequencies `f_k` in (−f_s/2, f_s/2], `β² = Σ P_k (f_k − f̄)² / Σ P_k`, floored at
     (1 kHz)² (and that floor when `Σ P_k` = 0). The pairs share the reference's clock: the covariance `C` has
     `σ_i²` on its diagonal and `σ_c²` off it.
T12. **Solver.** Unknown: the jammer's `(e, n)`, at the known height 2 m. Model `τ_i(p) = (d_i(p) − d_ref(p)) / c`.
     Cost `r^T C⁻¹ r`, `r = τ̂ − τ(p)`. Start: the grid point (T4) of least cost (ties: the first in grid order, `j`
     then `i`). Then Gauss–Newton, the Jacobian by central differences of 0.5 m, at most 20 steps, stopping when a step
     is under 1 mm.
T13. **Region and consistency.** `P = (J^T C⁻¹ J)⁻¹` at the solution. The 95 % region is the ellipse
     `(p − p̂)^T P⁻¹ (p − p̂) ≤ 5.991 464 547` (χ²₂ at 0.95), of area `π · 5.991 464 547 · √det P`. The session is
     **not located** when the final cost exceeds the χ² quantile at 0.999 with `N_s − 3` degrees of freedom.

## The gate

T14. **Sessions.** Development: seeds 5001 to 5200, run once to find faults, not to tune (no number above is changed
     after it). Gate: seeds 6001 to 7000, run once.
T15. **Metrics** (as B3a, readings 13 and V7):
     - **T1 coverage:** the share of sessions located with the truth inside the 95 % region. Bar ≥ 0.90.
     - **T2 non-vacuity:** the median over sessions of min(1, region area / domain area). Bar ≤ 0.25.
     - **T3 centroid:** the median centroid error divided by the median, over sessions, of each session's median
       nearest-neighbour station spacing. Bar ≤ 0.5.
     - An unlocated session counts as not covered (T1), an area share of 1 (T2), and an error equal to the distance
       from the truth to the domain's area centroid (T3).
     - Each metric is also reported per waveform, without a bar.
     - **T4 determinism:** the gate's result file has the same bytes in a Linux debug and release build, and on
       Linux, macOS and Windows (a CI job). The locator has no command line, Python or WebAssembly surface.
T16. **Independent check.** `oracle.py` (numpy and the standard library only, no engine code) reads one session's
     input as the engine writes it (the stations, the truth, the domain and the snapshots) and recomputes T8 to T13.
     On gate seeds 6001 to 6020: the reference, every `k*`, the located flag and the coverage must be equal; every
     `τ̂` within 10⁻¹² s; every `σ_i` within 10⁻⁹ relative; the solution within 1 mm; the region area within 10⁻⁶
     relative. Disagreement is a fault to find, not a result.
