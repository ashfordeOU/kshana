<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B1a planner, part 1: readings and oracle

The pre-registration is `docs/design/evidence/b1a-planner/PREREGISTRATION.md`, signed off on 3 November 2026.
This directory fixes the readings of its part 1 (bars P1 to P6, no external data) before any planner code.
`oracle.py` is the independent recomputation for P1 and the exhaustive placement optimum for P4. It uses
numpy and the Python standard library only, and shares no code with the engine. The expected outputs it
wrote are committed with it, in `tests/fixtures/planner/`.

## Readings fixed before the planner code (7 November 2026)

1. **Grid.** `n_lat × n_lon` cells, with
   `lat_j = lat_min + j·(lat_max − lat_min)/(n_lat − 1)` and the same for longitude, end points included.
   Cells are in row-major order, latitude first. The source is at `height_m` above the WGS 84 ellipsoid;
   stations are at their own heights. Positions are WGS 84 ECEF; distances are straight lines between them.
2. **Received power.** `P_i = EIRP − 20·log10(4π·d_i/λ) + G_i` (dBW), with `λ = c/f` and
   `c = 299 792 458 m/s`. Free space only in part 1; the terrain term is zero.
3. **The station statistic.** The pre-registration names `analytic_pd(μ_i, σ_i, γ)` but does not fix the
   statistic, so the statistic is read as a normalised energy detector over bandwidth `B` and integration time
   `T`:
   - `μ_i = INR_i = P_i (W) / (k·T0·F·B)`, with `k = 1.380649e-23 J/K`, `T0 = 290 K` and `F` the noise
     figure as a linear factor;
   - `σ = 1/√(B·T)`;
   - `γ = σ·Φ⁻¹(1 − P_fa/2)`;
   - `P_d,i = 1 − [Φ((γ − μ)/σ) − Φ((−γ − μ)/σ)]`. This is `analytic_pd`'s formula, the engine's
     two-sided detector.
4. **Precision of Φ and Φ⁻¹.** The engine's `detection::normal_cdf` uses Abramowitz and Stegun 7.1.26
   (absolute error 1.5e-7), and `normal_inv_cdf` uses Acklam's approximation (relative error 1.2e-9). P1's
   1e-12 on `P_d` cannot be met with them. Replacing them in place would change existing outputs, against P6.
   So the planner evaluates the same formula with full-precision functions: Φ from `libm::erfc`, and Φ⁻¹ from
   a method different from the oracle's, accurate to the last few bits. The oracle uses `math.erfc` and
   `statistics.NormalDist.inv_cdf`.
5. **Detection counts.** `P_D = 1 − Π(1 − P_d,i)`. `P_k` is the probability that at least `k` stations detect,
   from the exact Poisson-binomial recursion. In `surface` mode (the planner's default, for a source on the
   ground) `k = 3`; in `3d` mode `k = 4`.
6. **Accuracy.**
   - **Stations used:** those with `P_d,i ≥ 0.5`, in input order. The first of them is the reference. With
     fewer than `k`, the cell is "not locatable".
   - **Range differences** `R_i − R_0` are independent, each with standard deviation `c·σ_τ`, so the
     covariance is `q_rd = (c·σ_τ)²·I` (the same weighting as `geolocation::solve_tdoa`).
   - **Covariance in `surface` mode:** the bound constrained to the geocentric sphere through the source,
     `U (UᵀJU)⁻¹ Uᵀ` (`geolocation::tdoa_crlb_on_sphere`).
   - **Covariance in `3d` mode:** `J⁻¹` (`geolocation::tdoa_crlb_cov`).
   - **Horizontal block:** `C_h = Eᵀ C E`, with `E` the local east and north unit vectors at the cell's
     geodetic latitude and longitude.
   - **Reported figures:** `DRMS = √trace C_h`. The 95 % ellipse semi-axes are `√(χ²₂(0.95)·λ)`, with
     `χ²₂(0.95) = −2·ln 0.05` exactly, the larger first.
7. **P1 scope.** P1 is scored in `surface` mode, the mode for a source on the ground. In `3d` mode, with
   stations and source nearly coplanar, the information matrix is close to singular. Its figures then reflect
   rounding more than geometry, so `3d` mode is checked for determinism (P5) only.
8. **Layouts.** The P1 layouts are `layout_square.json`, `layout_line.json` and `layout_circle.json`, centred
   on 45° N, 10° E:
   - square: 4 stations about 5 km apart;
   - line: 5 stations 2 km apart, east–west;
   - circle: 6 stations on a circle of radius about 10 km.

   All use a 41 × 41 grid over about 40 km × 40 km, and the same source and receiver:
   - source: EIRP −30 dBW at 2 m;
   - frequency: L1;
   - receiver: noise figure 3 dB, `B` = 2 MHz, `T` = 1 ms, `P_fa` = 1e-3;
   - `σ_τ` = 10 ns.

   The source power is chosen so that each map holds detected, undetected and transition cells. The oracle
   output shows 483, 619 and 515 locatable cells.
9. **Placement (P4).**
   - **Objective:** `F(S)` is the share of grid cells with `P_k ≥ 0.9` and `DRMS ≤ d_req` (`d_req` = 20 m).
   - **Tie-break:** first the lower median `DRMS` over all cells, with "not locatable" counted as +∞ (an
     infinite median is reported as null); then the lexicographically smaller subset of candidate indices.
   - **Exhaustive search** when `C(N_c, m) ≤ 10 000`. Otherwise greedy: the subset grows one candidate at a
     time, each step taking the candidate that is best under the same order.
   - **Instances:** `place_12.json` (12 candidates, `m` = 4, 495 subsets; the oracle's optimum is committed)
     and `place_30.json` (30 candidates, `m` = 6, greedy). Both use candidates on a fixed pattern.
10. **P2 solver.** P2 names `solve_tdoa`, the 3-D solver, but the map it checks is the `surface` bound. It is
    therefore read with the matching estimator: Gauss–Newton on the same geocentric sphere, two tangent-plane
    parameters, the same independent weights, started at the true position. The noise is independent normal on
    each range difference at `c·σ_τ`.
    - Cells: the 20 cells per layout are drawn with seed `0xB1A2` from the locatable cells.
    - Error: the empirical horizontal RMS, over 10 000 trials, of the east and north error.
11. **P3.** At the same cells, each of 100 000 draws takes one statistic per station, `y_i ~ N(μ_i, σ)`, and
    counts a detection when `|y_i| > γ`. Seed `0xB1A3`.
