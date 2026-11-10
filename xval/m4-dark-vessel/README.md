<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M4 dark vessels and AIS integrity: readings of the generator

The pre-registration is `docs/design/evidence/m4-dark-vessel-ais-integrity/PREREGISTRATION.md`, signed off on
3 November 2026. Its process is:
1. the generator, with B6 tested;
2. the decision logic, developed on seeds 0 to 9 with its thresholds committed;
3. one run on seeds 1000 to 1009.

This file fixes the readings of the generator **before any generator code**. The readings of the decision logic
follow in a second section, before any logic code.

The area, its sea points and the RF layer come from M2 (`kshana::tip_and_cue`, f592cc3d4; readings in
`xval/m2-revisit-tip-and-cue/README.md`).

## Readings of the generator

1. **Time.**
   - Every scene runs from `t = 0` to `t = 21 600 s` (6 h) after 2025-01-01T00:00Z, the M2 epoch, on a 10 s grid.
   - Every scene uses the same window, so the satellite geometry is the same across scenes. Only the vessels and
     the noise change with the seed.
2. **Sea and land.**
   - A position belongs to the M2 grid cell whose centre is nearest: cells of 0.25°, from 53.5°N and 9.5°E.
   - The position is at sea when that cell is one of the 996 M2 sea points.
   - Positions outside the M2 box are land.
3. **Start positions.** A sea point is chosen uniformly, then a point uniform within its cell (±0.125° in latitude
   and longitude).
4. **Motion.** Each vessel has a speed uniform in 5 to 22 kn (1 kn = 1852 m/h), held for the whole scene, and a
   start heading uniform in [0°, 360°). It then alternates two phases:
   - **Legs:** a constant-heading leg with a duration uniform in 20 to 90 min.
   - **Turns:** a coordinated turn of an angle uniform in ±10° to 90° (sign equally likely) at a rate uniform in
     1 to 3 °/s.

   Positions advance every 10 s on the sphere (radius 6 378 137 m), by the local flat step
   `Δφ = v·cos h·Δt / R` and `Δλ = v·sin h·Δt / (R·cos φ)`.
5. **Redraws.** A vessel whose position at any step of the 6 h is on land, by reading 2, is redrawn from the next
   random numbers. The number of redraws per scene is reported.
6. **Labels.** Each scene has exactly:
   - 1 600 NORMAL, 140 DARK, 60 GAP, 140 POSITION-OFFSET and 60 IDENTITY-DUPLICATE vessels: the shares times 2 000.
   - Labels are assigned by a seeded shuffle of the vessel indices.
   - The 140 POSITION-OFFSET vessels get the offsets 2, 5, 10, 20 and 50 km, 28 each, in shuffled order.
7. **Identities.** Vessel `i` (0 to 1 999) has identity `200000000 + i`.
8. **AIS.**
   - **When it reports:** every 10 s step, from `t = 0` to the end. Each report is received with probability 0.8,
     independently.
   - **Report position:** the true position plus N(0, 10 m) per axis (east and north).
   - **DARK:** no report at all.
   - **GAP:** no report for `t` in `[g, g + L)`. `L` is uniform in 30 to 120 min, rounded to 10 s, and `g` is
     uniform such that the gap lies inside the scene, with at least 10 min of reporting before and after it.
   - **POSITION-OFFSET:**
     - The onset `t_on` is uniform in the first 4 h, rounded to 10 s.
     - From `t_on` on, every report is the true position plus a constant offset of length `d` in a uniform
       direction. The offset is applied on the local flat plane at each report's position.
     - Offset reports that land on land are still broadcast. AIS can report any position, and no redraw applies.
   - **IDENTITY-DUPLICATE:**
     - A second vessel is drawn by readings 3 to 5, with its start at least 50 km from the original's start.
     - It broadcasts the original's identity with its own true position, under reading 8's reception and noise.
     - It also has RF fixes (reading 9), carrying no identity.
     - It is not a scored vessel. The scored vessel is the original, labelled IDENTITY-DUPLICATE.
9. **RF fixes.**
   - **Visibility:** at each 10 s step, the 16 satellites of the M2 primary RF layer are propagated as in M2
     readings 1 and 2. A vessel is visible when any satellite is at ≥ 10° elevation at its true position, on M2's
     sphere (M2 reading 4).
   - **Accesses:** an access is a maximal run of visible steps. Each access gives one candidate fix, at its middle
     step (the earlier of the two middle steps when the run is even).
   - **Detection:** each candidate is detected with probability 0.9.
   - **Fix:** a detected fix is the true position at that step plus N(0, 1 km) per axis.
   - **Fix contents:** a fix carries its time and position only, never an identity.
10. **Random numbers.**
    - One ChaCha8 stream per scene, seeded with the scene seed. Draws follow the order of readings 3 to 9: vessels
      in index order, then the duplicates in the order of their originals.
    - Normals come from Box-Muller on the engine's portable math, so the bytes are the same on every platform.
11. **Files.** A scene is written as three compact JSON documents:
    - the truth: per scored vessel, its identity, label, offset and onset or gap, and the duplicate's index;
    - the AIS stream: reports as `[t, identity, lat, lon]`, sorted by time then identity;
    - the RF stream: fixes as `[t, lat, lon]`, sorted by time then latitude.

    Only the two streams are inputs to the decision logic.
12. **B6.** Generating the same seed twice gives byte-identical files (truth, AIS, RF). `tests/m4_generator.rs`
    checks this for seed 0, and pins the files' SHA-256 for seed 0 on every platform in the reproducibility matrix.

### Amendment to reading 11, before any decision-logic code

- **Fix owners in the truth file.** The truth file also lists, for each RF fix in the RF stream's order, the vessel
  that produced it: `rf_owner` holds a vessel index (0 to 1 999), or `-1 - k` for the `k`-th duplicate.
- **Why.** Scoring needs it: a DARK vessel has no identity in the AIS stream, so its decided class can only come from
  how the logic treats its own fixes (reading 18).
- **What changes.** The AIS and RF files are unchanged. The truth file's SHA-256 is re-pinned for B6.

## Readings of the decision logic (before any logic code)

The pre-registration's intended method is not binding in its details. Where these readings depart from it, they say
so. The logic sees the AIS stream, the RF stream and the public M2 RF layer geometry. It never sees the truth file.

13. **Tracks.** One AIS track per identity: its reports sorted by time. The predicted AIS position of an identity at
    time `t` is the linear interpolation between its reports at or before and at or after `t`. Prediction is allowed
    only when both exist and are at most 60 s apart.
14. **Association of each RF fix.**
    - **Distance:** the squared distance to each predicted AIS position, divided by `σ_fix²` (1 km²), on the local
      flat plane. This is a chi-square with 2 degrees of freedom; AIS noise is negligible.
    - **Gate:** 13.816, the 0.999 point (false-gate probability 0.001), as intended.
    - **Assignment:** a fix inside the gate of one or more tracks is associated with the nearest of them. A fix inside
      no gate is unassociated.
15. **IDENTITY-DUPLICATE.**
    - An identity is a duplicate when any two of its consecutive reports imply a speed above `max_speed_kn` = 70 kn.
    - Its reports are then split into two tracks by nearest continuation (each report goes to the track whose last
      report it reaches at ≤ 70 kn). Both tracks are used for association.
16. **GAP.**
    - An identity is a gap when its reports, outside a duplicate, have an internal silence longer than 10 min (as
      intended).
    - Departure: the "while gated RF fixes continue" condition is dropped. RF fixes come about every 40 min per
      vessel, so a 30 to 120 min gap often has none. With 80% reception, a 10 min silence by chance has probability
      `0.2^60`.
17. **POSITION-OFFSET.**
    - **Expected accesses:** for an identity's track, the logic computes when the M2 primary RF layer sees the
      track's predicted positions, by the generator's rule 9 applied to the AIS positions. Each access's middle step
      is an expected epoch.
    - **Miss with a candidate:** an expected epoch with no associated fix within ±60 s, but with at least one
      unassociated fix within ±60 s and within 60 km of the predicted position. The candidate is the nearest such
      fix, and its displacement is `fix − predicted position`.
    - **Decision:** the identity is a position offset when it has at least `m` misses with a candidate whose
      displacements all lie within `c` km of their mean.
    - **Tuning:** `m` ∈ {1, 2, 3} and `c` ∈ {3, 5} km are chosen on seeds 0 to 9, as the pair that maximises POSITION-OFFSET recall at `d ≥ 5` km subject to `FA ≤ 0.005`.
    - **Departure:** the intended "matches by course and speed" is replaced by this. RF fixes are too sparse to form
      RF tracks with a course.
    - A candidate fix used by an offset identity is marked "explained".
18. **Classes and scoring.**
    - **Precedence per identity:** DUPLICATE, then GAP, then POSITION-OFFSET, else NORMAL.
    - **DARK, by fix:** an unassociated fix not marked "explained" is a dark fix.
    - **Decided class of each scored vessel, from the truth's identities and fix owners:**
      - For a vessel with AIS reports: its identity's class. If that class is NORMAL and more than half of its own
        detected fixes are dark fixes, the decided class is DARK. That is the false-dark case that counts in DARK's
        precision.
      - For a DARK vessel: DARK if more than half of its detected fixes are dark fixes, else NORMAL. A DARK vessel
        with no detected fix is NORMAL, a miss, and is counted in the report.
19. **Development and the scored run.**
    - Seeds 0 to 9 are used to choose `m` and `c`, and to fix any implementation fault.
    - The chosen pair, and every number above, is committed in `M4Params::v1` before seeds 1000 to 1009 are
      generated.
    - The scored seeds are then run once.

### Amendment to reading 15 after the first development run (seeds 0 to 9), before any scored seed

- **What was wrong.** The first development run classed all 1 400 POSITION-OFFSET vessels as IDENTITY-DUPLICATE.
  The onset of an offset is one jump of 2 to 50 km between two reports 10 s apart, so it breaks the 70 kn rule
  once. A duplicate identity interleaves reports from two places, so it breaks the rule at every switch.
- **The correction.** An identity is a duplicate when **at least two** pairs of consecutive reports imply more than
  70 kn.
- **What was seen first.** That run's full output is kept in `dev-first.json.gz`. The tuning of `m` and `c` uses
  the second run only.

### Amendment to reading 17 after the second development run, before any scored seed

- **What was wrong.** POSITION-OFFSET recall was 2 % to 11 % at every offset (`dev-second.json.gz`), against 100 %
  for GAP and IDENTITY-DUPLICATE. A look at seed 0 showed why.
  - The offset vessels do have 4 to 6 fixes after onset.
  - The rule took the **nearest** unassociated fix as the candidate. At 10 to 50 km, another vessel's unassociated
    fix is usually nearer than the vessel's own.
  - A single stray candidate (a pre-onset miss when the vessel's own fix was not detected) broke the "all within
    `c`" test.
- **The correction (a vote).**
  - Every miss keeps **all** its candidates: the unassociated fixes within the time window and 60 km.
  - For each candidate displacement `D`, count the misses that have some candidate within `c` of `D`.
  - The identity is a position offset when the best count is at least `m`. Only the candidates of the counted
    misses are marked "explained".
- **Tuning on seeds 0 to 9.** The time window is now chosen too, from {60, 180} s. The tuning rule is unchanged:
  the triple (`m`, `c`, window) that maximises recall at `d ≥ 5` km subject to `FA ≤ 0.005`.

### The tuned parameters (third development run, `dev-third.json.gz`), committed before any scored seed

| Window | m | c | FA | Recall at d ≥ 5 km | Eligible (FA ≤ 0.005) |
|---|---|---|---|---|---|
| 60 s | 3 | 3 km | 0.00075 | 864 / 1 120 | yes |
| **60 s** | **3** | **5 km** | **0.00469** | **938 / 1 120** | **yes: chosen** |
| 180 s | 3 | 3 km | 0.00087 | 874 / 1 120 | yes |
| 180 s | 3 | 5 km | 0.00506 | 950 / 1 120 | no (FA above 0.005) |

With `m` = 1 or 2, FA is 5 % or more. `M4Params::v1` uses window 60 s, `m` = 3, `c` = 5 km.

**What the development run already shows, before the scored run.** At the chosen triple on seeds 0 to 9:
- DARK recall is 0.845, against the B2 bar of ≥ 0.95.
- POSITION-OFFSET recall is 0.81 at 5 km (bar ≥ 0.85) and 0.85 at 10 km (bar ≥ 0.98).

So B2 and B4 are expected to miss. The bars are not changed, and the scored seeds are run once as they stand.

## Readings of v2 (before any v2 code)

These read `docs/design/evidence/m4-dark-vessel-ais-integrity/PREREGISTRATION-v2.md`, signed off on 9 November 2026.
They are committed before any v2 code and before any v2 seed is generated. Readings 13 to 19 stand unless changed
here. The generator, metrics and bars are v1's. `M4Params::v1` and the v1 results are unchanged.

20. **Order of the v2 decision.**
    1. AIS tracks, IDENTITY-DUPLICATE and GAP: readings 13, 15 (as amended) and 16.
    2. Association of each fix to AIS: reading 14. This gives each fix its AIS residual `d²_ais` (the chi-square of
       reading 14) when it is inside a gate.
    3. POSITION-OFFSET: reading 21, on the association of step 2.
    4. Dark tracks: reading 22, over the fixes not marked "explained" in step 3.
21. **Offsets by time-consistent misses.**
    - **Kept from v1:** expected epochs, misses with candidates, the vote over candidate displacements with radius
      `c`, the time window, and the "explained" marking. `c` = 5 km and the window = 60 s, v1's tuned values; v2 tunes
      only `m`.
    - **Added: the step test.** Let `D` be the displacement with the best vote, and `t₀` the earliest expected epoch
      whose miss has a candidate within `c` of `D`. The identity is a position offset when:
      - at least `m` misses agree with `D`; and
      - no expected epoch at or after `t₀` has a fix associated with the identity's track.
    - **What may come between the agreeing misses.** Expected epochs with no fix at all (nothing detected) are
      allowed. An expected epoch at or after `t₀` with an associated fix ends the test, because the AIS position
      then agrees with an RF fix again.
    - **Votes are counted only from `t₀` on.** Before the step test, the vote is taken over the misses at or after
      each candidate's own epoch, so an agreeing set is always a run from some epoch onward. The best `D` maximises
      that count; ties go to the earliest `t₀`, then to stream order.
    - **`m` ∈ {2, 3}.** It is chosen on seeds 20 to 29 by v1's rule: the `m` with the highest POSITION-OFFSET recall
      at `d ≥ 5` km, subject to `FA ≤ 0.005`. If neither `m` is eligible, `m` = 3.
22. **Dark tracks from fix sequences.** The fixes of step 4 are processed in stream order (time, then latitude,
    then the generator's order, as `Scene::rf` is sorted). Each dark track is a list of fixes.
    - **Feasibility.** Let `f` be the track's last fix and `Δt` the time from it, in seconds. A fix `x` is feasible
      for the track when `|x − f| ≤ v_max·Δt + 3·√2·σ_fix`, with `v_max` = 30 kn and `σ_fix` = 1 km per axis. The
      term `√2·σ_fix` is the per-axis noise of the difference of two fixes, read as a radius.
    - **Constant-velocity prediction (tracks of 2 or more fixes).** From the last two fixes `f₁` (time `t₁`) and
      `f₂` (time `t₂`), the prediction at time `t` is `f₂ + (f₂ − f₁)·τ`, with `τ = (t − t₂)/(t₂ − t₁)`.
      - Its normalised residual is `d²_dark = |x − pred|² / (σ_fix²·(1 + (1 + τ)² + τ²))`. The denominator is the
        variance of `x − pred` per axis when each fix has independent noise `σ_fix`, with no free parameter.
      - A track whose last two fixes share a time has no prediction.
    - **An unassociated fix** (no AIS gate) joins a track:
      1. among the feasible tracks with a prediction, the one with the smallest `d²_dark`;
      2. otherwise, the feasible single-fix track whose fix is nearest;
      3. otherwise, it starts a new track.
    - **A fix inside an AIS gate** joins a dark track only if a feasible track with a prediction has
      `d²_dark < d²_ais`. Both are chi-squares with 2 degrees of freedom, so they compare directly. The smallest
      `d²_dark` wins, and the fix then counts as unassociated. Otherwise it stays associated, and no new track is
      started from it.
    - **A dark fix** is a fix in a dark track of at least 2 fixes. A single-fix track's fix is not a dark fix.
23. **Classes and scoring.** Reading 18, with two changes:
    - "dark fix" is read 22's;
    - an associated fix taken by a dark track (reading 22) is not counted for its AIS identity.

    The majority rule per vessel and the precedence are unchanged. So a DARK decision always rests on a dark track
    of at least 2 fixes, as the pre-registration requires.
24. **Development and the scored run.**
    - Seeds 20 to 29 choose `m` and fix any implementation fault. Any reading changed after a development run is
      amended here, with what was seen first, before seed 2000 is generated.
    - `M4Params::v2` is committed with the chosen `m` before the scored seeds.
    - Seeds 2000 to 2009 are then generated and run once. `RESULTS-v2.md` records MET or NOT MET for B1 to B7, and
      `tests/m4_verdicts.rs` pins the v2 verdicts beside v1's.

### The v2 development run (seeds 20 to 29, `dev-v2.json.gz`), committed before any scored seed

| m | FA | DARK recall | DARK precision | Offset recall at 5 / 10 / 20 / 50 km | Eligible (FA ≤ 0.005) |
|---|---|---|---|---|---|
| 2 | 0.00513 | 0.870 | 0.898 | 0.486 / 0.675 / 0.689 / 0.771 | no |
| **3** | **0.00006** | **0.883** | **0.896** | **0.436 / 0.600 / 0.611 / 0.686** | **yes: chosen** |

`M4Params::v2` uses `m` = 3. No reading was changed after this run.

**What the development run already shows, before the scored run (diagnosed on seeds 20 to 29 only).**
- **DARK.** Recall is 0.883 against the B2 bar of 0.95. Every missed dark vessel had at least 5 detected fixes.
  Their 1,474 fixes split into 614 dark fixes and 860 others: fixes kept by an AIS gate, or fixes left in a
  single-fix track. Over the roughly 40 min between fixes, vessels turn (reading 4's legs). The constant-velocity
  residual therefore rarely beats a nearby AIS gate's chi-square.
- **POSITION-OFFSET.** Recall falls below v1's. The step test fails whenever any fix lands in the identity's gate
  after onset. The fix can be another vessel's: v1 noted that a fix has about a one-in-five chance of falling inside
  some other vessel's gate.
- **Expected outcome.** B2 and B4 are expected to miss again, with B4 worse than in v1. The bars are not changed,
  the readings are not changed to chase them, and the scored seeds are run once as they stand.

## Readings of v3 (before any v3 code)

These read `docs/design/evidence/m4-dark-vessel-ais-integrity/PREREGISTRATION-v3.md`, signed off on 10 November
2026. They are committed before any v3 code and before any v3 seed is generated. The generator, metrics and bars
are v1's. `M4Params::v1`, `M4Params::v2` and their recorded results are unchanged, and the v1 and v2 paths must give
byte-identical outputs after the change.

25. **What stands from v1 and v2.**
    - Readings 13 (AIS tracks and interpolation), 14 (the association of each fix to its nearest gated AIS track,
      gate 13.816), 15 as amended (duplicates), 16 (gaps), 17 as amended and 21 (expected epochs, misses with
      candidates, the vote with `c` = 5 km and the 60 s window, `t₀`, the "explained" marking), except the step test,
      which reading 27 replaces.
    - Reading 22's feasibility rule (30 kn plus `3·√2·σ_fix`), its constant-velocity prediction and normalised
      residual `d²_cv`, its single-fix rule, and its "dark fix" (a fix in a dark track of at least 2 fixes).
    - Readings 18 and 23 (classes, precedence, the majority rule per vessel and scoring).
    - **Replaced:** reading 22's per-fix choice between AIS and dark tracks (by reading 29) and reading 21's step test
      (by reading 27). **Added:** the bounded-turn prediction (reading 28).
26. **Order of the v3 decision.**
    1. AIS tracks, IDENTITY-DUPLICATE and GAP: readings 13, 15 and 16.
    2. Association of each fix to AIS by reading 14 (nearest gated track). This association defines the hits and
       misses of the offset test only.
    3. POSITION-OFFSET: reading 21 with the collision-tolerant step test of reading 27.
    4. Dark tracks: the global association of reading 29, window by window, over the fixes not marked "explained" in
       step 3.
27. **Collision-tolerant step test.** Let `D`, `t₀` and the agreeing count be as in reading 21 (the vote is
    unchanged), and `pred(te)` the identity's track prediction (reading 13) at an expected epoch `te`.
    - A **hit** is, as in v2, an expected epoch with at least one fix associated with the track (step 2) within
      ±60 s. Its AIS residual is `h = min |x − pred(te)|² / σ_fix²` over those associated fixes.
    - The **offset candidates of the same epoch** are the unassociated fixes within ±60 s and within 60 km of
      `pred(te)` (reading 17's candidates, chosen as in v2) whose displacement `x − pred(te)` lies within `c` of `D`.
      Their offset residual is `g = min |(x − pred(te)) − D|² / σ_fix²` over them; `g = ∞` when there is none.
    - A hit at `te ≥ t₀` **ends the step test only if `h < g`**: the AIS track explains its associated fix better than
      the offset hypothesis `pred + D` explains its best candidate. Both are squared distances in units of
      `σ_fix²`, with no free parameter. A hit with no agreeing candidate (`g = ∞`) ends the test, as in v2.
    - The identity is a position offset when at least `m` misses agree with `D` and no hit at or after `t₀` ends the
      test. A hit that does not end the test is not counted as a miss, and its candidates are not marked
      "explained" (only the counted misses' candidates are, as in v2).
28. **Bounded-turn prediction and the dark residual.** For a dark track with at least 2 fixes whose last two fixes
    `f₁` (time `t₁`) and `f₂` (time `t₂ > t₁`) differ in time, and a fix `x` at time `t`:
    - `T = t₂ − t₁`, `Δ = t − t₂`, `τ = Δ/T`, `v = en(f₁, f₂)` (the local east-north metres of `f₂` from `f₁`, as in
      v2), and the residual is computed on the local plane at `f₂` as in v2 (`en(f₂, x)`).
    - **Constant-turn prediction at rate `ω`** (rad/s): the vessel keeps the speed `|v|/T` and turns at the constant
      rate `ω` from `t₂`. Its displacement from `f₂` is `κ·Rot(φ)·v`, with `φ = ωΔ/2`,
      `κ = τ·sin φ / φ` (`κ = τ` at `ω = 0`), and `Rot(φ)` the rotation by `φ` in the east-north plane.
    - **Normalised residual at rate `ω`:**
      `d²(ω) = |en(f₂, x) − κ·Rot(φ)·v|² / (σ_fix²·(2 + 2κ·cos φ + 2κ²))`. The denominator is the exact per-axis
      variance of `x − pred` when each of `f₁`, `f₂` and `x` has independent noise `σ_fix` per axis
      (`x − pred = x − f₂ − κ·Rot(φ)·(f₂ − f₁)`, and `Rot(φ) + Rot(φ)ᵀ = 2 cos φ·I`). At `ω = 0` it is v2's
      `1 + (1 + τ)² + τ²`, so `d²(0) = d²_cv`.
    - **The bound:** `|ω| ≤ ω_max` = 3° per minute (0.05°/s), the plan's only parameter. The turn residual is
      `d²_turn = min d²(ω)` over the 121 rates `ω_j = j·ω_max/60`, `j = −60 … 60` (steps of 0.05° per minute). The
      grid is the numerical evaluation of the bounded minimum, fixed now; it contains `ω = 0`.
    - **The dark residual** is `d²_dark = min(d²_cv, d²_turn)`, the smaller of the two models' residuals, as the
      plan says (equal to `d²_turn` since the grid contains 0; both are computed and the minimum taken).
    - A track whose last two fixes share a time has no prediction, as in v2.
29. **Global association per 60 s window.** Windows are `[60k, 60k + 60)` s, `k = 0 … 359`, processed in time order.
    The rows of window `k` are its fixes not marked "explained", in stream order. The dark tracks are those built
    in the earlier windows (none at the start).
    - **Columns and costs** (all costs in units of `σ_fix²`, chi-square with 2 degrees of freedom):
      - **AIS:** every AIS track (reading 13, with reading 15's split tracks) with a prediction at the fix's time and
        `d²_ais = |x − pred|²/σ_fix² ≤ 13.816` (reading 14's gate). Cost `d²_ais`. Every gated track is a column,
        not only the nearest.
      - **Dark (predicted):** every dark track with a prediction (reading 28) for which the fix is feasible (reading
        22's rule from the track's last fix). Cost `d²_dark`.
      - **New dark track:** one private column per fix, cost `C_new` ∈ {9.21, 13.82} (reading 31).
      - Every other pair is not allowed (infinite cost).
    - **The assignment:** each fix gets exactly one column; each AIS track and each dark track gets at most one fix
      per window; the total cost is minimised (Hungarian algorithm). Because every fix has its private
      new-track column, an assignment always exists.
    - **Computation and ties.** The window's problem splits into the connected components of its allowed
      fix-to-track pairs (private columns join no component); each component is solved on its own, which gives the
      same minimum total. Each component is solved by the shortest-augmenting-path Hungarian algorithm with
      potentials, rows added in stream order and columns ordered AIS tracks (track order of reading 13), then dark
      tracks (creation order), then new-track columns (row order); a strictly smaller reduced cost is needed to
      change the chosen column, so among assignments of equal total the first in that order is kept.
      This is the tie rule.
    - **After the assignment**, in stream order within the window:
      - a fix assigned to an AIS track is associated with it and is not a dark-track fix;
      - a fix assigned to a predicted dark track joins it;
      - a fix assigned "new" counts as unassociated: it joins the feasible single-fix dark track whose fix is
        nearest, among single-fix tracks whose fix lies in an earlier window (reading 22's rule 2, with one fix per
        track per window); otherwise it starts a new single-fix track.
    - **Interaction of AIS-gated and dark choices.** This replaces v2's per-fix rule. A gated fix may now be given
      to a dark track or to "new": when a cheaper total results, including when another fix in the same window takes
      its AIS track. With `C_new` = 13.82 a gated fix never prefers "new" to a free gated track on its own cost
      (13.816 < 13.82); with `C_new` = 9.21 it does when `d²_ais > 9.21`. A fix that was associated by step 2 and is
      not given to an AIS track by the assignment is marked "taken".
30. **Dark fixes, classes and scoring.** A dark fix is a fix in a dark track of at least 2 fixes (reading 22).
    Readings 18 and 23 apply unchanged: the precedence per identity, the majority rule per vessel, a DARK vessel
    with no detected fix is NORMAL.
31. **Tuning, development and the scored run.**
    - **Grid:** `m` ∈ {2, 3} × `C_new` ∈ {9.21, 13.82}, on seeds 30 to 39, every other number fixed above.
      Eligible: `FA ≤ 0.005`.
    - **`C_new`** is the plan's rule: the `C_new` of the eligible pair with the highest DARK recall; on a tie in
      DARK recall, the larger `C_new`.
    - **`m`** is v1's rule at that `C_new`: among the eligible pairs with the chosen `C_new`, the `m` with the
      highest POSITION-OFFSET recall at `d ≥ 5` km; on a tie, `m` = 3.
    - **Fallback, if no pair is eligible:** `m` = 3 and `C_new` = 13.82 (the larger of each, the pair expected to
      give the fewest false alarms; v2's fallback was `m` = 3).
    - Seeds 30 to 39 also fix any implementation fault. Any reading changed after a development run is amended here,
      dated, with what was seen first, before seed 3000 is generated.
    - `M4Params::v3` is committed with the chosen pair, with the development output (`dev-v3.json.gz`) and its
      table, before the scored seeds.
    - Seeds 3000 to 3009 are then generated and run once. `RESULTS-v3.md` records MET or NOT MET for B1 to B7, and
      `tests/m4_verdicts.rs` pins the v3 verdicts beside v1's and v2's.
