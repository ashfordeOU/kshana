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
