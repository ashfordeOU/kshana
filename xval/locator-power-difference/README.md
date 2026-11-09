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

## v2 readings (9 November 2026)

The v2 pre-registration is `docs/design/evidence/b3a-power-difference-locator/PREREGISTRATION-v2.md`, signed off on
9 November 2026. These readings fix what it leaves open. They are written **before any v2 code and before any v2
development data**. The v1 readings above (R1 to R15) and the v1 results stay as they are. A v1 reading not changed
below still holds for v2. The coordinator answered two questions before these readings were written (V9, V12).

V1. **Parameters and identity.**
    - `PowerDifferenceParams::preregistered_v2`, method id `kshana-locate/power-difference/v2`.
    - It is v1's parameter set with three changes:
      - the domain buffer is 10 km;
      - the tempering exponent is τ = 1;
      - new fields `sigma_meas_db` = 2 dB, `session_shadowing` = true and `report_share` = 0.5 (V3).
    - Every parameter is written into every output, as in v1.
    - `preregistered_v1`, `TEMPER_V1`, the v1 test, `gate.json.gz` and M5's use of the v1 parameters are not changed.
V2. **Per-station session estimate.**
    - For each epoch of a session, the per-epoch estimate `J_i,e` is v1's, from R2 to R4. That includes the R3 gate
      and the R4 combination of C/N0 and AGC.
    - Let `R_i` be the session's epochs in which station `i` reports. `J̄_i` is the mean of `J_i,e` over `R_i`, in dB,
      and `n_i = |R_i|`.
V3. **Reporting and censored stations.**
    - Let `E` be the number of epochs in the session.
    - Station `i` counts as **reporting in the session** when `n_i > report_share · E` (more than half the epochs).
    - Otherwise it is **censored**, and contributes one term `P(J_i < J_min,i)`, with `J_min,i` as in R3.
    - Why not count any station that reports once? Averaging only the epochs above the gate would bias a station that
      flickers across it upward.
V4. **Session shadowing.**
    - One shadowing term per station: `σ_tot,i² = σ_sh² + σ_meas²/n_i`, with σ_sh = 6 dB and σ_meas = 2 dB.
    - σ_meas is the 2 dB per epoch the pre-registration states, used as written. It is not R4's combined C/N0 and AGC
      variance.
    - A censored station uses `n_i = E`.
V5. **The session log-likelihood, at cell `x`, height `h` and exponent `n`.**
    - **Reporting stations:** `r_i = J̄_i + 10·n·log10(d_i/1 m) − G_i + L_i(x)`, with `d_i` and `L_i` as in R5 and R6.
    - **P̂_0** is the maximum-likelihood estimate under unequal `σ_tot,i`: `P̂_0 = Σ w_i·r_i / Σ w_i` over reporting
      stations, with `w_i = 1/σ_tot,i²`. (v1's plain mean was the same estimate only because v1's σ was equal at every
      station.)
    - **Log-likelihood:** `Σ_reporting log φ((r_i − P̂_0)/σ_tot,i) + Σ_censored log Φ((J_min,i − pred_i)/σ_tot,i)`,
      with `pred_i = P̂_0 − 10·n·log10 d_i + G_i − L_i`.
      - The `−log σ_tot,i` terms are the same at every cell and hypothesis, so they cancel in the posterior.
V6. **Posterior.**
    - `n` ∈ {2.0, 2.5, 3.0} and `h` ∈ {2 m, 30 m} are marginalised once per session with equal prior, as in v1's
      corrected R8.
    - The posterior of a cell is the mean over the six hypotheses of `exp(ll(x, h, n))`, with τ = 1 (no tempering),
      normalised over the domain cells.
V7. **Too few reporting stations.**
    - The session is not located when fewer than 3 stations are reporting in it (V3), although at least 3 report at
      every one of its epochs. The output states "not located: fewer than 3 stations report in more than half the
      session".
    - **In the gate, such a session counts against the method:**
      - not covered for S1;
      - an area share of 1 for S2;
      - for S3, a centroid error equal to the distance from the truth to the domain's area centroid (the mean of the
        domain cell centres).
    - The number of such sessions is reported.
V8. **Domain and grid.** R7, with a 10 km buffer: the points within 10 km of the stations' convex hull, on the same grid
    rule.
V9. **Outside the network (coordinator's answer, 9 November).**
    - This is a scope statement only.
    - Every output states its domain (the hull buffered by 10 km), and says that a source beyond it is outside the
      network and not located.
    - There is no detection test and no flag computed from the data.
    - The gate draws every source inside the domain, so this changes no gate number.
V10. **Outputs and timeline.**
    - The outputs are R10's, with the v2 method id and the domain statement of V9.
    - The 60 s timeline applies V2 to V7 to the epochs from the session start to the end of each minute: `E`, `n_i`,
      the more-than-half rule and `σ_tot,i` are all computed over that window.

## v2 readings of the synthetic gate

V11. **Generator.**
     - v1's generator (R11 and R12) is unchanged.
     - The source is drawn uniformly in the v2 domain. The generator reads the buffer from the parameters, so this
       follows from V1.
     - Redraws (a draw without 3 reporting stations at any epoch) are as in v1, and their count is reported.
     - As in v1, the gate scores each seed's first session.
V12. **Metrics (coordinator's answer to S4, 9 November).**
     - S1 to S3 are as in R13, with V7 for sessions that are not located.
     - **S4 is read for platforms only.** A v2 test re-runs fixed gate seeds and requires the recorded rows bit for
       bit, in its own `ci.yml` job on Linux, macOS and Windows, and also debug against release.
     - The locator has no CLI, Python or WebAssembly surface in 0.41, so the surface half of S4 is **not assessable**.
       It is recorded as such and is not a pass.
V13. **Development seeds 3001 to 3200: implementation checks only.**
     - With τ fixed at 1 and no other free choice, nothing is selected on them.
     - Any change to a reading or to the code after a development run is disclosed with its timing, as v1 did.
V14. **The gate.** The gate is run once, on seeds 4001 to 5000, after the code is committed. Its numbers go into
     `RESULTS-v2.md` as MET or NOT MET, against the same bars:
     - S1 ≥ 0.90;
     - S2 ≤ 25%;
     - S3 ≤ 0.5×;
     - S4 as V12.

     A miss is pinned by a test. v1 stays published.
V15. **Independent check.**
     - `oracle.py` gains a v2 mode. It recomputes V2 to V6 for 20 sessions of the gate input (seeds 4001 to 4020),
       with numpy and no code shared with the engine.
     - Agreement as in R15: region membership equal, and centroid within 1 m.
     - This checks the implementation, not the method.
