<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration M4 v2 (0.41.x): dark vessels by fix sequence, offsets by time-consistent misses

**Status: PROPOSED, 8 November 2026. Waiting for the owner's sign-off. No code or data for v2 before it.**

## Why a v2

M4 v1 is NOT MET on B2 and B4 (`RESULTS.md`, `ea8557adb`). Both misses come from deciding on single fixes.
- **B2, dark vessels:** recall 0.848 against ≥ 0.95. A dark vessel's fix often falls inside another vessel's gate,
  and the majority rule then fails for vessels with few fixes.
- **B4, position offsets:** recall 0.81 to 0.87 at 5 to 50 km, against 0.85 and 0.98. Three agreeing misses are
  needed, so late onsets go undetected.

v1 stands as recorded, and its bars are not loosened. v2 changes the logic and is scored on new seeds.

## What changes (generator, metrics and bars unchanged from v1)

1. **Dark tracks from fix sequences.**
   - Unassociated fixes are chained into dark tracks. A fix joins a track when the implied speed from the track's
     last fix is at most 30 kn plus 3σ of the position noise over the interval.
   - A fix that falls inside an AIS gate counts as a dark fix too, when it continues a dark track better than it
     fits the AIS track. "Better" means a smaller normalised residual against the track's constant-velocity
     prediction.
   - A DARK decision needs a dark track of at least 2 fixes.
2. **Offsets by time-consistent misses.**
   - The candidate displacement must agree across misses, as in v1, **and** the misses must be consecutive expected
     epochs from some time onward. A step change is the signature of an onset.
   - `m` is tuned on development seeds within {2, 3}, under the same rule as v1: the highest recall at d ≥ 5 km with
     FA ≤ 0.005.
3. **Seeds.** Development: 20 to 29. Scored: 2000 to 2009, unused by anyone so far.

## Bars

v1's B1 to B7, unchanged.

## Process

1. Sign-off.
2. Readings, then the logic, developed on seeds 20 to 29, with its parameters committed.
3. One run on seeds 2000 to 2009, recorded in `RESULTS-v2.md`.
