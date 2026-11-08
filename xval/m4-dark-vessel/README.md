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
