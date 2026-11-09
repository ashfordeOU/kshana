<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B1a v3 (0.41): planner placement search, wider neighbourhood

**Status: PROPOSED, 9 November 2026. Waiting for the owner's sign-off. No v3 code or run before it.**

## Why a v3

B1a v2 (`RESULTS-v2.md`, `98ff742b4`) met P1, P2, P3 and P6, and P5 on Linux. P4 was NOT MET: greedy plus single
exchange reached 0.350982 on 40 candidates (`m` = 7), against 0.353361 for the best of 1 000 random subsets. The
search stops at a local optimum. v1 and v2 stay published.

## What changes (P4 only; P1–P3, P5 and P6 are re-run unchanged)

1. **Search beyond the exhaustive limit:** greedy, then single exchange (v2), then **double exchange**:
   - try every pair of chosen stations swapped for every pair of unchosen ones;
   - accept the best strictly improving move under reading 9's order;
   - repeat single and double exchange until neither improves.
2. **Restarts:** the search above runs from 8 starts (*proposed*): the greedy subset, and 7 subsets drawn with
   ChaCha20 seed `0xB1B1`. The best final subset under reading 9's order is kept. The output names the method
   `greedy+exchange2+restarts`.
3. **A new instance**, so v3 is not scored on v2's:
   - 48 candidates, `m` = 8, on a fixed pattern of 6 rows × 8 columns (rows 6.4 km apart, columns 32/7 km apart,
     alternate rows shifted by half a column), centred on 45° N, 10° E;
   - v1's source, receiver and grid;
   - committed before any v3 code.
4. **Random comparison:** 1 000 random `m`-subsets with ChaCha20 seed `0xB1B2`, under the engine's objective.

## Bar (unchanged)

P4: the planner's objective ≥ the best of 1 000 random subsets. The other bars are unchanged.

## Process

1. Sign-off.
2. Readings, then the instance, then the code.
3. One run. `RESULTS-v3.md` records it; a miss is pinned.
