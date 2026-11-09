<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M1: space RF geolocation accuracy: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings: `xval/m1-geolocation/README.md`.
MODELLED: the bounds hold under the stated link budget and noise model; no flown system is checked. Advisory software,
not navigation equipment.

| Step | Commit |
|---|---|
| B2 transcription (`reference.csv`, Cao et al. 2015, the case the owner named on 9 November 2026), alone | `ea82156b9` |
| Readings and the B1 oracle (numpy) with its output | `d3bc1bc52` |
| Engine (`src/space_geoloc.rs`) and the tests, before the run | `780e6d64d` |
| The scored run, once, in release; the B2 oracle cross-check after it | this commit |

The bars were not changed.

## Summary

| Bar | Result |
|---|---|
| B1, independent recomputation (60 cases: S1, F2, F3 × P1-P10 × AIS, 30 dBm jammer), 1e-6 relative and 1e-6 rad | **MET**: worst relative difference 3.0e-10, worst orientation 3.0e-11 rad; every pass identical |
| B2, published case (Cao et al. 2015, Fig. 1, 25 plot readings), 20 % | **MET**: worst +5.5 % (δs = 0.75 km); 22 of 25 within 1 % |
| B3, estimator against the bound (F3, AIS, P1-P10, 1000 trials), RMS 0.9 to 1.25 × DRMS, 99 % converged | **MET**: ratios 0.979 to 1.019; 1000 of 1000 converged at every point |
| B4, multi-pass fusion | **MET**: fused information equals the sum of the per-pass information to 6.7e-16 relative; DRMS never rises with another pass (5 or 6 passes per point) |
| B5, additivity | **MET**: a new module and its line in `src/lib.rs`; no existing function or output changes |

**M1 is MET.**

## B2 in detail

The engine computes Cao et al.'s Eq. (7), with the satellite-location errors folded into the Fisher matrix (Eq. 8), on
the paper's geometry as the readings fix it. Its 25 values against the digitised curve, in km:

| Panel | x | reference | engine | difference |
|---|---|---|---|---|
| (a) δt (µs), δf 20 Hz, δs 1 km | 0.1 to 1.0 | 28.06 to 28.51 | 28.078 to 28.443 | −0.2 % to +0.3 % |
| (b) δf (Hz), δt 0.1 µs, δs 1 km | 10, 15, 20, 25, 30, 35, 40 | 20.74, 24.74, 28.00, 30.40, 32.01, 33.33, 34.15 | 20.797, 24.866, 28.078, 30.445, 32.160, 33.409, 34.331 | +0.1 % to +0.5 % |
| (c) δs (km), δt 0.1 µs, δf 20 Hz | 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0 | 9.29, 16.97, 22.14, 28.18, 31.85, 35.09, 37.45, 40.92 | 9.309, 17.207, 23.355, 28.078, 31.869, 35.114, 38.061, 40.860 | −0.4 % to +5.5 % |

- **Oracle cross-check.** The numpy oracle (`oracle_b2.json`, run after the engine as reading 13 requires) agrees with
  the engine to its printed precision, 0.0005 km.
- **The largest differences.** They are at δs = 0.75 and 1.75 km (+5.5 %, +1.6 %). The digitisation step there is
  0.35 km per pixel. At 0.75 km the plotted simulation marker sits 1.0 km above the line reading, so part of that
  difference is likely the reading itself. This is not tested further.
- **What the plotted S is taken to be.** The readings take it as `√trace` of the 3-D CCRLB. The agreement supports that
  reading; the paper does not define S further.

## What this does and does not show

- It shows the bound machinery is arithmetically right for satellites on orbits (B1), reproduces a published
  satellite-geolocation bound with receiver-location errors (B2), and is attained by the shipped solver for the
  three-satellite formation (B3).
- **How optimistic the numbers are.** The one-pass bounds are metres to hundreds of metres; with all passes of a day,
  about 2 m for S1 and 20 to 25 m for F2 with AIS. They are optimistic, for three reasons:
  - clock and orbit-knowledge errors are absent (row M6), and B2 shows how much receiver-location error adds;
  - the link budgets are representative, not measured;
  - the radar classes are an isotropic upper bound.
- No real RF data, no multipath, no AIS slot collisions seen from orbit, no ionosphere at VHF, no emitter motion.
- Results stay MODELLED.
