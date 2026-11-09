<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M5 interference sources from orbit, and a space + ground hybrid: readings

The pre-registration is `docs/design/evidence/m5-jammers-from-orbit-hybrid/PREREGISTRATION.md`, signed off on 3 November
2026. This file fixes its readings **before the B4 oracle and before any engine code**.

The area and the RF layer come from M2 (`kshana::tip_and_cue`). The ground locator is B3a's
(`kshana::locate_pd`), used as shipped except where reading 6 says otherwise.

M1's engine code does not exist yet (its published case is pending). The measurement-noise relations below are taken
from M1's pre-registration text. M1's readings must use the same definitions, or say where they differ.

## A note before any code

At 30 dBm, from about 600 km, the per-receiver SNR in 2 MHz is about −13 dB. After 1 s (`B·T` = 2·10⁶) the
time-difference noise is a few metres in range. So whenever the formation sees and detects a source, the space layer
alone should locate it to well under the 5 km success radius. That makes bar B1 (the hybrid wins on success by
+0.05) hard to meet.

This is stated now, from the link budget alone, before any run.

## Readings

1. **Space geometry.**
   - **Orbit:** plane 1 of the M2 primary RF layer (`plane_elements(&primary_rf_layer(), 0)`), with the M2 epoch
     and M2 propagation (sphere of radius 6 378 137 m, secular J2).
   - **The three receivers:** the plane's first satellite (`j = 0`) and two receivers behind it at 50 km and 100 km
     in-track. Their arguments of latitude at the epoch are reduced by `d / a` (a = 6 928 137 m).
   - **Elevations:** these are elevations at the placement, as in M2 reading 4. For a source at height `h`, the
     point is at radius `R + h`, and the elevation is taken from its local vertical.
   - **The pass:** the first maximal run of 10 s steps in `[0, 86 400]` s in which the middle receiver is at
     ≥ 10° elevation and whose highest elevation is ≥ 20°.
   - **Epochs:** the steps of that pass at which all three receivers are at ≥ 10°.
2. **Link budget per receiver and epoch.**
   - `P_r = EIRP − FSPL(range, 1575.42 MHz) + 0 dBi`, where `FSPL = 20·log10(4π·range·f / c)`.
   - Noise: `N = k·T_sys·B`, with `k = 1.380649e-23 J/K`, `T_sys = 500 K` and `B = 2 MHz`.
   - SNR: `γ = P_r / N` (linear).
3. **Energy detector.**
   - **The statistic:** the sum of `|x|²` over `M = B·T = 2·10⁶` complex samples in `T = 1 s`, normalised by the
     noise power, has `χ²` with `2M` degrees of freedom divided by 2 under noise only. With a noise-like source it
     is `(1 + γ)` times that.
   - **The threshold** is set for false-alarm probability 1e-6.
   - **Wilson–Hilferty, stated as the closed form both the engine and the oracle compute.** For `χ²_k`, `k = 2M`,
     `P(χ²_k > x) ≈ Q(((x/k)^{1/3} − (1 − 2/(9k))) / sqrt(2/(9k)))`.
     - The threshold `x_0` solves this for 1e-6.
     - Then `P_d = Q(((x_0/((1+γ)k))^{1/3} − (1 − 2/(9k))) / sqrt(2/(9k)))`.
   - **Detection:** an epoch yields measurements only if a uniform draw is below `P_d` at all three receivers,
     independently, from the draw stream.
4. **Time- and frequency-difference noise** (M1's relations, as written in M1's pre-registration).
   - `σ_τ = 1 / (β_rms·sqrt(B·T·γ_e))` and `σ_f = 1 / (τ_rms·sqrt(B·T·γ_e))`, with
     `γ_e = γ_i·γ_j / (1 + γ_i + γ_j)` for the pair `(i, j)`.
   - For a flat 2 MHz band, `β_rms = 2π·B/√12` (rad/s). For a 1 s collection, `τ_rms = T/√12` (s).
   - **Pairs:** (lead, 50 km) and (lead, 100 km), with independent noise. The correlation through the shared lead
     receiver is ignored, as M1 states it.
   - **Measurements:** time difference `(|x − s_j| − |x − s_i|)/c` and frequency difference
     `−(f/c)·(ṙ_j − ṙ_i)`, with Earth-fixed satellite velocities from the same propagation.
5. **Space estimator.**
   - **Method:** Gauss–Newton over the source's latitude and longitude, at the known height (10 m or 3 000 m) on the
     sphere, from the area centroid.
   - **The area centroid:** the mean of M2's 996 sea points, (lat, lon) averaged.
   - **Stopping:** at most 50 iterations. It converges when a step moves the position by less than 1 m.
   - **Declining:** it declines with fewer than 2 measurement epochs (fewer than 4 measurements, against 2 unknowns
     with margin), when it does not converge, or when the final point is outside the M2 box.
6. **Ground layer.**
   - **Sites:** the 14 sites of section 2, antennas 30 m above the sea surface. A site receives the source only
     inside `los_reach_km(30, h)`.
   - **Reported power:** `P_r = EIRP − FSPL + X`, with `X ~ N(0, 6 dB)` per site and draw. A site reports only if
     `P_r ≥ −110 dBm`. One report per site per draw.
   - **The locator: B3a as shipped, with three stated substitutions.**
     1. A site reports power directly, so its `J_i` is `P_r` (B3a's C/N0 and AGC estimation step is not used). The
        censored term uses `J_min = −110 dBm`.
     2. The height set is the known height only (`[10]` or `[3000]` m), so both layers get the same height
        information.
     3. The grid is B3a's rule over the 14 sites: hull + 20 km, at most 40 000 cells, cells doubled from 0.25 km.
   - **Unchanged:** σ_sh = 6 dB, `n` ∈ {2, 2.5, 3}, line-of-sight loss, and τ = 1/60.
   - **One epoch per draw.** The tempering exponent was set for 30-epoch sessions, so the ground posterior is wide.
     That is the shipped locator, stated, not tuned.
   - **Output:** the estimate is the posterior centroid. The layer declines with fewer than 3 reporting sites
     (B3a's session rule).
7. **Hybrid.**
   - **Method:** one Gauss–Newton over (latitude, longitude, EIRP), from the area centroid. The EIRP starts at the
     mean of `P_r + FSPL` over the reporting sites, or at 30 dBm with none.
   - **Residuals:**
     - the space measurements of reading 4, each with its σ;
     - each reporting site's `P_r − (EIRP − FSPL(d_i))`, with σ = 6 dB and free space (`n = 2`, the scenario's
       ground model).
   - **Censored sites** add no residual. Departure: a censored likelihood term is not part of a least-squares step.
   - **Declining:** under reading 5's conditions, applied to the union. It needs at least 3 residuals beyond the 3
     unknowns.
8. **Bounds (B5).**
   - **Fisher information** in (east, north, EIRP) at the truth:
     - space: from reading 4's measurements, with no information on EIRP;
     - ground: from the reporting sites of the truth, with free-space loss and σ 6 dB;
     - hybrid: their sum.
   - **Comparison:** the horizontal 2×2 bound of each layer is the Schur complement after the EIRP block, inverted.
     A layer with a singular horizontal block has an infinite bound.
   - **The test:** "the hybrid bound is no larger than either layer's" holds when `C_layer − C_hybrid` has no
     eigenvalue below −1e-9 of its largest eigenvalue, for every layer with a finite bound.
9. **Placements and draws.**
   - **Placements:** 200 sea points drawn uniformly from M2's 996 with seed 4500, using one ChaCha8 stream: sample
     an index, then a uniform point within its 0.25° cell. The first 100 are at 10 m and the next 100 at 3 000 m.
   - **Draws:** each placement and EIRP class gets 20 draws from one ChaCha8 stream seeded 4501, in the order
     placement, then class (E10, E30, E40), then draw. Within a draw, the detection uniforms, the space noise and
     then the ground shadowing are drawn in that order.
10. **Metrics.**
    - **Error:** horizontal error is great-circle distance on the sphere.
    - **Success:** a layer succeeds on a draw if it gives an estimate within 5 km.
    - **Common set:** the draws in which both space and ground give an estimate.
    - **Detectability per class and height:**
      - the share of placements with at least 6 detected epochs on their pass, counted on draw 0;
      - the lowest EIRP, on a 1 dB grid from −10 to 60 dBm, at which `P_d` at the pass peak reaches 0.9.
11. **B4 oracle.** `oracle.py` (numpy only, no engine code) computes `P_r`, `γ` and `P_d` per receiver at the pass
    peak of each M1 point P1–P10 for each class. It also checks its own geometry: it propagates plane 1 with
    reading 1's rule, independently of the engine. The engine must agree within 1e-9 dB and 1e-6 in probability.
    The oracle and its output are committed before any engine code.
12. **B6.** The same seeds give byte-identical results on every platform in the reproducibility matrix.
    `PortableFloat` is used for all trigonometry, logarithms and powers.

### Amendment to reading 7, after a timing trial and before the full run (disclosed)

- **The trial.** To time the run, the scenario was run on the **first 4 of the 200 placements** (seeds 4500 and 4501
  as stated), at engine commit `eb6468999`.
- **What it showed.** The hybrid declined every draw: 0 estimates, against 80 from the space layer. With no
  reporting ground site, the EIRP unknown has no information, so the Gauss–Newton normal matrix is singular. This
  is an implementation fault in a degenerate case the reading did not name.
- **The correction.** The hybrid solves EIRP only when at least one ground site reports. With none, it solves
  latitude and longitude from the space measurements alone, exactly as the space layer does.
- **Also visible in the trial, as expected and not changed:** the ground layer gave no estimate for these surface
  sources. A 10 m source is within the radio horizon (about 36 km) of fewer than 3 coastal sites.
- **The full run** of all 200 placements is made once after this correction. The trial's 4 placements are part of
  it, and the trial output is kept (`trial-4.json`).

### Amendment to reading 8, after the full run (disclosed)

- **The omission.** The run (`result.json`) did not compute the B5 bounds: the engine code had left them out.
- **Why adding them now changes nothing.** The bounds are computed afterwards from geometry alone, so no draw, and
  no outcome of the run, enters them. They cannot be tuned to the run.
- **The definition, at the truth of each placement and class:**
  - the space epochs are the pass epochs at which every receiver's `P_d ≥ 0.5`;
  - the ground sites are those within the radio horizon whose noise-free `P_r ≥ −110 dBm`;
  - otherwise reading 8 applies as written.

## Readings of v2 (before any v2 code)

These read `docs/design/evidence/m5-jammers-from-orbit-hybrid/PREREGISTRATION-v2.md`, signed off on 9 November 2026.
They are committed before any v2 code and before any v2 seed is drawn. Readings 1 to 12, with their two
amendments, stand unless changed here. v1's code path, `result.json` and the v1 verdicts are unchanged.

13. **The started Gauss–Newton (space and hybrid).**
    - **The coarse search.** Each of M2's 996 sea points (the cell centres, at the source's known height) is scored
      by the weighted sum of squared time-difference residuals of reading 4: the time differences alone, with
      their σ.
    - **The refinement.** The 3 lowest-scoring points, ties broken by M2's point order, each start reading 5's
      Gauss–Newton (for the hybrid, reading 7's, with its EIRP start).
    - **The pick.** Of the refinements that converge and end inside the M2 box, the one with the lowest weighted sum
      of squared residuals over all the estimator's measurements is kept. The layer declines when none qualifies,
      or under reading 5's other conditions.
    - **Without time differences.** If a draw has fewer than 2 measurement epochs, the space layer declines as in
      v1. The hybrid starts from the area centroid as in v1, with ground residuals only.
    - **No truth is used** at any step.
14. **The ground layer, with 30 reports per site per draw.**
    - **The reports.** Per site and draw, the shadowing `X ~ N(0, 6 dB)` is drawn once. Each of 30 reports, one per
      second, is `P_r = EIRP − FSPL + X + e_k`, with `e_k ~ N(0, 1 dB)` independent.
    - **Censoring.** A report is made only when that value is at least −110 dBm and the site is within
      `los_reach_km`. A site's censored reports are censored terms (`J_min` = −110 dBm), as in reading 6.
    - **The locator.** B3a v1 as shipped (`PowerDifferenceParams::preregistered_v1`, τ = 1/60), with reading 6's
      three substitutions. The 30 reports form one 30-epoch session: one epoch per second, passed in time order.
      This is the session length its τ was chosen for. B3a v2, which is being run separately, is not used here.
    - **Declining.** The layer declines when no epoch has at least 3 reporting sites (B3a's session rule).
      Otherwise the estimate is the posterior centroid.
15. **The hybrid's ground residuals.**
    - Each site with at least one report adds one residual: the mean of its reported `P_r` minus
      `EIRP − FSPL(d_i)`. Its σ is `√(6² + 1²/n_i)`, where `n_i` is its number of reports. This is the same
      shadowing-once model as reading 14.
    - Censored reports add no residual, as reading 7 states.
    - **B5 bounds.** The ground Fisher information uses the same per-site σ, with `n_i` = 30 at the noise-free
      truth.
16. **Random numbers.**
    - **Placements:** reading 9's procedure with seed 4600.
    - **Draws:** one ChaCha8 stream seeded 4601, in reading 9's order (placement, class, draw). Within a draw:
      detection uniforms, space noise, the 14 shadowing values in site order, then the 30 × 14 report noises (epoch
      major, site minor).
17. **Implementation checks and the run.**
    - **Checks** use placements and draws from seed 4699 only. They are not scored, any output is kept, and they
      are disclosed in `RESULTS-v2.md`. Seeds 4600 and 4601 are drawn once, for the scored run.
    - **Records.** `RESULTS-v2.md` records B1 to B6. Reading 8's bounds (as amended) are computed at the v2
      placements. `tests/m5_*` pins the v2 verdicts beside v1's.
