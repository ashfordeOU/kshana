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
