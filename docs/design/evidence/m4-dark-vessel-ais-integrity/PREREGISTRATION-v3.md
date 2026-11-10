<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration M4 v3 (0.41): manoeuvring dark tracks, global association, collision-tolerant onsets

**Status: SIGNED. Proposed 9 November 2026; signed off by the owner on 10 November 2026, as drafted. The v1 and v2 results stay published as NOT MET; no bar is loosened.**

## Why a v3

M4 v2 (`RESULTS-v2.md`, `165db008b`) met B1, B3, B5, B6 and B7, and missed two bars:
- **B2:** DARK recall 0.877, against ≥ 0.95. Vessels turn between fixes about 40 min apart, so a
  constant-velocity residual rarely beats a nearby AIS gate.
- **B4:** offset recall 0.396 at 5 km, against ≥ 0.85. Its step test failed whenever any fix landed in the
  identity's gate after onset, including another vessel's fix.

v1 and v2 stay published.

## What changes (generator, metrics and bars unchanged)

1. **Manoeuvring dark tracks.**
   - Each dark track is predicted by two models: constant velocity, and a turn bounded by the generator-independent
     limit of 3° per minute (*proposed*).
   - A fix's dark residual is the smaller of the two models' normalised residuals.
2. **Global association.**
   - In each 60 s window, fixes are assigned to AIS tracks and dark tracks together. The assignment minimises the
     total normalised residual (Hungarian algorithm), with a fixed cost for "new dark track".
   - This replaces v2's greedy per-fix choice.
3. **Collision-tolerant onsets.** A hit after `t₀` ends the step test only if it is closer to the AIS prediction
   than the offset candidates of the same epoch. A fix from another vessel that happens to fall in the gate no
   longer ends it.
4. **Tuning:**
   - `m` ∈ {2, 3} by v1's rule;
   - the "new dark track" cost ∈ {9.21, 13.82} (the χ²₂ 0.99 and 0.999 points), chosen on the development seeds by
     the highest DARK recall subject to FA ≤ 0.005.
5. **Seeds:** development 30 to 39; scored 3000 to 3009, unused by anyone.

## Bars

v1's B1 to B7, unchanged.

## Process

1. Sign-off.
2. Readings, then the logic, developed on seeds 30 to 39, with its parameters committed.
3. One run on seeds 3000 to 3009, recorded in `RESULTS-v3.md`.
