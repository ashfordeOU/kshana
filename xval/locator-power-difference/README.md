<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3a power-difference locator: readings and the synthetic gate

The pre-registration is `docs/design/evidence/b3a-power-difference-locator/PREREGISTRATION.md`, signed off on
3 November 2026. This file fixes the readings of its sections 1 and 2 **before any locator code**. The scored real run
(section 3) waits for Jammertest 2027. Until then the row is MODELLED, and only the synthetic gate (S1 to S4) is run.

Nothing was looked at before these readings except the pre-registration itself, the existing code it cites
(`src/jamming.rs`, `src/interference_map/emitter.rs`) and the B2 referee definitions. No Jammertest 2026 file was
opened.

## Readings of section 1 (the method)

1. **Signal constants.**
   - `S` = −158.5 dBW (`jamming::DEFAULT_SIGNAL_POWER_DBW`);
   - `R_c` = 1.023 MHz (GPS L1 C/A);
   - `Q` = `Q_BROADBAND` (2.0) unless a waveform is stated.
2. **C/N0 estimate.** `J/S = Q·R_c·(1/c_eff − 1/c_nom)`, with linear C/N0 values, `c_nom = 10^(C_nom/10)` from the
   station's baseline median and `c_eff = 10^((C_nom − D)/10)`, where `D` is the median C/N0 drop (dB) over satellites
   above 15°. Then `J_C = S + 10·log10(J/S)`.
3. **The gate, and "reports interference".**
   - A station reports interference at an epoch when `D ≥ 3 dB`. Only then does it give a C/N0 estimate and, if it
     states `κ`, an AGC estimate.
   - Otherwise it gives the censored term `P(J_i < J_min,i)`. `J_min,i` is the `J` of reading 2 with `D = 3 dB` and the
     station's own `C_nom`.
   - One gate on one observable keeps `J_min` defined the way section 1 defines it.
4. **AGC estimate.** `J_A = N + 10·log10(10^(ΔAGC·κ/10) − 1)`, used only when `ΔAGC·κ > 0`. The combination is
   inverse-variance with σ = 2 dB for C/N0 and 3 dB for AGC, so `J = (J_C/4 + J_A/9)/(1/4 + 1/9)`.
   - The variance of the combined estimate is not used in the likelihood; σ_sh (6 dB) dominates. Section 1 fixes only
     the combination.
5. **Likelihood of one epoch at grid point `x` and exponent `n`.**
   - **Reporting stations:** `r_i = J_i + 10·n·log10(d_i/1 m) − G_i − L_i(x)`, where `L_i` = 20 dB without line of
     sight and 0 otherwise.
   - **Profiling `P_0`.** It is profiled in closed form over the reporting stations: `P̂_0 = mean(r_i)`. With fewer
     than 1 reporting station there is no `P̂_0`, and the epoch is skipped.
   - **Log-likelihood:** `Σ log φ((r_i − P̂_0)/σ_sh)`, plus, for each censored station,
     `log Φ((J_min,i − (P̂_0 − 10·n·log10 d_i + G_i − L_i))/σ_sh)`.
   - **Exponent `n`.** It is marginalised over {2.0, 2.5, 3.0} with equal prior **over the session, not per epoch**
     (see the correction under reading 8).
   - **Distances.** `d_i` is the slant distance with the source at height `h` and the station at its stated antenna
     height, floored at 1 m.
6. **Heights and line of sight.**
   - The source height set is {2 m, 30 m}, marginalised with equal prior like `n`.
   - Line of sight uses the emitter-region horizon rule (`los_reach_km`) and, where a DEM is given, `jamming_terrain`.
   - **In the synthetic gate:** no DEM is given, so only the horizon rule acts. The generator applies the same world
     rule (20 dB more loss beyond the radio horizon `los_reach_km(h_station, h_source)`), so the locator's
     line-of-sight term meets a world that has a horizon.
   - **Correction, made before any code.** The first version of this reading said the gate domain stays within line
     of sight. It does not: with 10 m stations and a 2 m source the horizon is about 19 km, while links in the domain
     reach about 80 km. The generator's other differences from the locator (reading 12) are unchanged.
7. **Domain and grid.**
   - **Projection:** local tangent plane at the stations' mean position (`emitter::Proj`).
   - **Domain:** points within 20 km of the stations' convex hull.
   - **Grid:** square cells of 0.25 km, raised by factors of 2 until there are at most 40 000 cells.
   - **Prior:** flat over domain cells; cells outside the domain have zero mass.
8. **Session and accumulation.**
   - A session is a maximal run of epochs in which at least 3 stations report interference, split at a gap over 120 s.
   - **Session posterior.** For each hypothesis `(n, h)`, the epoch log-likelihoods are summed over the session and
     multiplied by τ, the tempering exponent (reading 9). The posterior of a cell is the mean over the six
     hypotheses of `exp(τ·Σ_e ll_e(x, n, h))`, normalised over the grid.
   - **Correction, 8 November 2026, after the development run (seeds 1 to 200) and before any gate seed was drawn.**
     - **The first version** marginalised `n` and `h` per epoch. A noiseless check, with data drawn from the
       locator's own model, put the posterior mode 5 km from a source outside the network.
     - **Why.** A per-epoch mixture rewards cells where several hypotheses fit equally well. There, every station is
       beyond the horizon for both heights, so the mixture gains `log 2` per epoch, about 21 nats over 30 epochs.
     - **The fix.** `n` and `h` belong to a static source and its surroundings, so they are constant over a session
       and are marginalised once, over the session.
     - **Data looked at.** The development run's summary (coverage, area and centroid ratio per τ) was seen before
       this change and is kept in `dev-first.json.gz`. τ is chosen again on the same development seeds, and the gate
       seeds are still unused.
9. **The tempering exponent τ** (section 1 says it is fixed on synthetic data before the scored run).
   - **Candidates:** τ is the largest value in {1, 1/2, 1/3, 1/5, 1/10, 1/20, 1/30, 1/60} whose 95% region contains
     the truth in at least 0.95 of a **development** set: 200 synthetic sessions, seeds 1 to 200, generated as in
     reading 10.
   - **Fallback:** if no value reaches 0.95, the one with the highest coverage is used, and that is reported.
   - **Order:** τ is chosen once and committed. Only then is the gate run, on seeds 1001 to 2000.
10. **Outputs.**
    - The highest-posterior regions at 50%, 90% and 95%: the smallest set of cells, taken by decreasing mass, whose
      mass reaches the level. A cell is counted with its whole area.
    - The posterior mean (centroid).
    - The 2×2 covariance and its 95% ellipse: semi-axes `sqrt(5.991·λ)`.
    - A timeline of these per 60 s: the posterior accumulated from the session start to the end of each minute.
    - Method id `kshana-locate/power-difference/v1`. Every parameter is in `PowerDifferenceParams::preregistered_v1`
      and in each output.

## Readings of section 2 (the synthetic gate)

11. **Network.**
    - Per session, the number of stations is uniform on {6, …, 12}.
    - The layout scale `L` is uniform on [5, 30] km. Station positions are uniform in an `L × L` square, redrawn until
      no two stations are closer than `L/10`.
    - Antenna height is 10 m at every station.
    - The source is uniform in the domain (reading 7), at a height of 2 m or 30 m with equal probability. The horizon
      is about 19 km for a 2 m source and about 36 km for a 30 m source.
12. **Generating model.** It deliberately differs from the locator's model.
    - Path loss: `J_i = P_0 − 10·n·log10(d_i) + s_i − L_i`, with `L_i` = 20 dB beyond the radio horizon (reading 6).
      - `n` is uniform on [1.8, 3.5] per session.
      - `P_0` is uniform on [−40, −10] dBW at 1 m.
      - `s_i` is Gaussian with σ 6 dB, correlated between stations as `exp(−d_ij / 1 km)` (Cholesky), drawn once per
        session (the source is fixed).
    - Each epoch adds independent noise:
      - C/N0: the true drop for that `J`, plus N(0, 0.5 dB) baseline scatter, rounded to 1 dB;
      - AGC: the true rise `10·log10(1 + J/N)`, plus N(0, 0.5 dB), divided by the station's true `κ`.
    - The stated `κ` differs from the true one by a fixed per-station error uniform on ±1 dB in the rise.
    - `C_nom` = 45 dB-Hz at every station; `N` = −130 dBW (a front-end noise power over a 2 MHz band); 30 epochs at
      1 s per session.
    - A session whose epochs never have 3 reporting stations is redrawn, and the redraw count is reported.
13. **Metrics of the gate.**
    - **S1:** the share of sessions whose 95% region contains the cell of the truth.
    - **S2:** the median over sessions of (95% region area / domain area).
    - **S3:** the median centroid error divided by the median, over sessions, of each session's median
      nearest-neighbour station spacing.
    - **S4:** a fixed 5-session input gives the same output bytes on the CLI, Python and WebAssembly paths, and on
      Linux, macOS and Windows (CI).
14. **Run once.** τ is chosen on the dev seeds (commit). Then the gate is run once on seeds 1001 to 2000, and its
    numbers are recorded in the row's `RESULTS.md`. A gate miss stops the row (section 2).
15. **Independent check.** `oracle.py` (numpy) recomputes, for 20 sessions of the gate input, the posterior on the same
    grid from the same epochs. It shares no code with the engine. Agreement is required: region membership equal, and
    centroid within 1 m. This checks the implementation, not the method.
