<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C3: the CAPSTONE NRHO with a corrected force model: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings and record:
`xval/c3-capstone-nrho/README.md`. MODELLED. The JPL Horizons reconstruction is the reference, not truth. Advisory
software, not certified navigation equipment.

| Step | Commit |
|---|---|
| 2. M1 and M2 on synthetic data (kernel off = A2 bit for bit; radiation term against its closed form) | `50040cbca` |
| 3. Control: A2 on W0 gives 136 822.881 m and 28 371.817 m, its recorded numbers | `f3058bee7` |
| 4. F fetched (2 137 states, complete); manoeuvre test with M1: 11 manoeuvre hours; windows E, H1, H2 | `f3058bee7`, `cb7e1ad07` |
| 5. `k` on E: 0.027937 m²/kg | `8df9d67fa` |
| 6. The scored runs, once | `result.json` (this commit) |

The bars were not changed.

## Summary (bars: end position ≤ 25 km and periapsis radius ≤ 10 km at +156 h)

| Bar | Window | End position | Periapsis radius | Result |
|---|---|---|---|---|
| C3-R (M1) | W0 | 21.66 km | 4.24 km | **MET** |
| C3-H (M1) | E | 37.25 km | 2.33 km | NOT MET (end position) |
| C3-H (M1) | H1 | 36.23 km | 7.32 km | NOT MET (end position) |
| C3-H (M1) | H2 | 49.65 km | 4.25 km | NOT MET (end position) |
| C3-S (M2, `k` from E) | H1 | 12.92 km | 2.59 km | met |
| C3-S (M2, `k` from E) | H2 | 57.13 km | 0.35 km | NOT MET (end position) |

- **C3-R is MET; C3-H is NOT MET on all three windows.** By the sign-off, A2 counts as met on re-run only if both
  hold, so **A2 is not recorded as met on re-run**. A2 stays NOT MET in its own file.
- **C3-S is NOT MET**: met on H1, missed on H2.

## Reported with no bar

| Run | Window | End position | Periapsis radius | Max 3-D difference |
|---|---|---|---|---|
| A2 model | E | 121.55 km | 24.85 km | 233.7 km |
| A2 model | H1 | 171.66 km | 30.96 km | 205.7 km |
| A2 model | H2 | 208.42 km | 41.63 km | 311.6 km |
| M1 | W0, E, H1, H2 | | | 40.1, 52.5, 36.2, 49.6 km |
| M2 | H1, H2 | | | 19.7, 57.1 km |

- The analytic-orientation runs differ from the DE440-orientation A2 runs by under 1 m at +156 h on every window
  (`result.json`).
- The estimated `k` is 0.027937 m²/kg. The RMS 3-D residual over E is 31.3 m with it and 11.4 km without it (M1).
- The largest one-hour miss of M1 outside the 11 manoeuvre hours is 89.3 m, close to the 100 m threshold.

## What the run shows

- **The DE440 third bodies were a large part of the A2 miss.** On every window the M1 end-position difference is
  between 3.3 and 4.7 times smaller than the A2 model's, and the periapsis bar is met everywhere. The analytic series
  were the main single cause the pre-registration could test. This suggests it; it does not prove it.
- **Radiation pressure is the next largest term.** One `k` fitted on E brings E's residual from 11.4 km to 31 m and
  carries over to H1 (12.9 km) but not to H2 (57.1 km, worse than M1's 49.6 km).
  - A single cannonball term does not hold over the 89 days. Attitude changes, a varying effective area, or small
    manoeuvres below the 100 m test would all do this. The run cannot tell them apart.
- **Remaining candidates**, named in the pre-registration and untested here: sensitivity to the initial state, small
  manoeuvres below the test, and the reconstruction itself.

## What this does not show

- It does not identify CAPSTONE's real area-to-mass ratio.
- It says nothing about orbit determination, navigation filters or station keeping.
- Results stay MODELLED.

## v2: C3-S on a fresh span with `k` estimated per window (9 November 2026)

Pre-registration: `PREREGISTRATION-v2.md` (signed off 9 November 2026). Readings and record:
`xval/c3-capstone-nrho-v2/README.md`, committed before span G was fetched (`c803bcc5b`). The v1 results above stand
unchanged. The bars were not changed.

| Step | Commit |
|---|---|
| G fetched (Horizons −1176, 2023-07-01 to 2023-09-28, 2 137 states, complete); runner | runner and fetch record committed before any propagation of G |
| Manoeuvre test with M1 on G: 8 manoeuvre hours; windows G1, G2, G3 at samples 0, 292, 756 | `windows_g.json` |
| `k` per window from its first 78 samples, committed before any +156 h propagation under M3 | `k_v2.json` |
| The scored runs, once | `score_v2.json` |
| Sensitivity analysis (±10 m, ±1 cm/s on each start component) | `sensitivity_v2.json` (this commit) |

### Scored (bars: end position ≤ 25 km and periapsis radius ≤ 10 km at +156 h)

| Bar | Window | `k` (m²/kg) | End position | Periapsis radius | Sensitivity (M3) | Result |
|---|---|---|---|---|---|---|
| C3-S v2 (M3) | G1 | 0.02728 | 0.21 km | 11 m | 18.10 km (low-information) | met |
| C3-S v2 (M3) | G2 | 0.02667 | 0.60 km | 4 m | 7.28 km | met |
| C3-S v2 (M3) | G3 | 0.02777 | 0.73 km | 87 m | 7.10 km | met |

**C3-S v2 is MET**: both bars hold on all three G windows. G1 is marked low-information by reading 6 (a 10 m or
1 cm/s change in its start state moves the end position by up to 18.1 km, above 12.5 km); its verdict still counts, as
registered. v1's C3-S NOT MET, C3-H NOT MET and A2's record are not changed by this result.

### Reported with no bar

| Model | Window | End position | Periapsis radius | Max 3-D difference | Sensitivity |
|---|---|---|---|---|---|
| M1 | G1 | 13.63 km | 4.68 km | 13.63 km | 18.10 km |
| M1 | G2 | 7.20 km | 2.07 km | 7.20 km | 7.28 km |
| M1 | G3 | 5.07 km | 2.79 km | 5.07 km | 7.10 km |
| M1 | E | 37.25 km | 2.33 km | 52.50 km | 49.73 km |
| M1 | H1 | 36.23 km | 7.32 km | 36.23 km | 17.65 km |
| M1 | H2 | 49.65 km | 4.25 km | 49.65 km | 10.51 km |
| M1 | W0 | 21.66 km | 4.24 km | 40.07 km | 6.66 km |
| M3 (`k` 0.02795) | E | 0.03 km | 0.01 km | 0.05 km | 49.83 km |
| M3 (`k` 0.02677) | H1 | 13.63 km | 2.78 km | 18.15 km | 17.66 km |
| M3 (`k` 0.02936) | H2 | 57.82 km | 0.58 km | 57.82 km | 10.52 km |
| M3 (`k` 0.02694) | W0 | 0.05 km | 0.01 km | 0.16 km | 6.67 km |

- The M1 numbers on E, H1, H2 and W0 reproduce v1's (`result.json`) to the printed digits.
- On G the largest one-hour miss of M1 outside the 8 manoeuvre hours is 7.9 m (89.3 m on F).
- The seven per-window `k` lie between 0.0267 and 0.0294 m²/kg; v1's single `k` from E was 0.027937.

### What the run shows, and what it does not

- **M3 fits the three fresh windows to under 1 km**, 30 to 120 times inside the end-position bar. The cannonball term
  with a `k` from each window's first half carries to +156 h on G, E and W0.
- **G is a span on which M1 alone also meets both bars** (5.1 to 13.6 km, periapsis 2.1 to 4.7 km). G is therefore a
  less demanding test than F's windows were. The MET says M3 holds on a fresh span; it does not say M3 would hold where
  M1 fails by a wide margin.
- **H2 is still missed with its own `k`** (57.8 km, worse than M1's 49.6 km), and H1 improves only to 13.6 km. So v1's
  H2 miss was not caused by carrying E's `k` across 34 days. Something in H2 that a constant cannonball term does not
  model (attitude, a small manoeuvre below the 100 m test, or the reconstruction) remains the candidate; this run cannot
  tell which.
- The sensitivity numbers (6.7 to 49.8 km) are of the same order as several no-bar misses, so start-state error at the
  10 m and 1 cm/s level could explain part of a window's difference on its own; it does not explain H2's 57.8 km.
- Results stay MODELLED. Nothing here identifies CAPSTONE's real area-to-mass ratio or says anything about orbit
  determination.

Pins: `tests/c3_verdicts_v2.rs` (the committed record).
