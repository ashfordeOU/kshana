<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B1a v2 (0.41.x): planner part 1, revised internal bars

**Status: PROPOSED, 8 November 2026. Waiting for the owner's sign-off. No code or run for v2 before it.**

## Why a v2

B1a part 1 (`PREREGISTRATION.md`, signed 3 November 2026) is NOT MET (`RESULTS.md`) on three counts:
- P1: 4 cells collinear with every station agree with the oracle to 2.6e-9, not 1e-9;
- P2: 2 edge cells located by 3 stations are outside the ±5 % Monte Carlo band;
- P4: greedy placement scores below the best of 1 000 random subsets.

v1 stands as recorded; its bars are not loosened. v2 changes what the bars apply to, adds a better search, and
runs once on new layouts.

## What changes

1. **P1 scope.** The agreement bars apply to cells whose horizontal information matrix (the 2 × 2 matrix whose
   inverse is `C_h`) has a condition number of at most 1e8. Cells above it are reported with their count and
   their relative difference, but not barred. The planner's output marks them `"ill_conditioned": true`, so a
   user sees that the figure there is not meaningful beyond the rounding of the inversion.
2. **P2 regime.** The ±5 % bar applies at drawn cells that satisfy both conditions below. Other cells are
   reported, not barred.
   - `DRMS < 0.05 ×` the mean distance to the stations used (v1 reading 12);
   - at least 4 stations used.
3. **P4 search.** Beyond the exhaustive limit, the search is greedy followed by single-exchange local search.
   Swap one chosen station for one unchosen, accept the best improving swap under the same objective and
   tie-break, and repeat until none improves. Bar unchanged: the result ≥ the best of 1 000 seeded random subsets.
4. **New layouts and instances**, so v2 is not scored on the cases v1 was tuned against:
   - a 5-station irregular pentagon at 7 km;
   - an 8-station mixed layout (an inner square at 3 km inside an outer square at 12 km);
   - 4 stations on an arc of 90° at 8 km (a near-degenerate case);
   - a 40-candidate, `m` = 7 placement instance.

   They are written into the v2 readings with the same source and receiver as v1. The independent oracle
   gives their expected outputs, committed before the v2 planner code.

## Bars

P1 to P6 as in v1, with the scopes above. Part 2 (the published campaign) is unchanged and still waits for the
owner to name the publication.
