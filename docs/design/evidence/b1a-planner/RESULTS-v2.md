<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B1a v2: the monitoring-network planner, revised internal bars: results

Pre-registration: `PREREGISTRATION-v2.md` (signed off 9 November 2026). Readings: `xval/planner/README.md`, readings
13 to 19 and their amendment. v1 (`RESULTS.md`) stays published as NOT MET.

| Step | Commit |
|---|---|
| Sign-off | `dcfa1fb89` |
| Readings 13 to 19, the three v2 layouts, the 40-candidate instance and the oracle's `map2` outputs, before any v2 code | `422865fe6` |
| Amendment to readings 13 and 15, before any v2 code | `4036140fe` |
| Code and the v2 test (`ws/b1a-v2`) | `1c0f8a4b1` |
| The run, once (`xval/planner/run-v2.txt`), and this record | this commit |

The bars were not changed. v1's planner tests pass unchanged, with v1's greedy method selected by name for its P4
case. v1's pinned engine bytes for the circle map are unchanged.

## Summary

| Bar | Result |
|---|---|
| P1 independent recomputation | **MET**. On the pentagon, mixed and arc layouts, detection agrees within 1e-12 and the locatable cells are identical. DRMS agrees within 1e-9 relative on all 1 662 locatable cells, all of which are in scope (no cell has a condition number above 1e8). |
| P2 the bound is attained | **MET**. 46 of the 60 drawn cells are in the regime (DRMS < 0.05 × mean distance, at least 4 stations), and all 46 have a Monte Carlo RMS within ±5 % of the DRMS. The other 14 are reported. |
| P3 detection by simulation | **MET**. At the 60 drawn cells, the empirical `P_D` and `P_k` from 100 000 draws are inside the 99.9 % binomial interval. |
| P4 placement | **NOT MET**. On 40 candidates with `m` = 7, greedy+exchange chooses [0, 2, 9, 11, 12, 14, 21] with objective 0.350982. The best of 1 000 random subsets (ChaCha20 seed `0xB1A7`) scores 0.353361. Greedy alone, a diagnostic run after the scored run with no bar: 0.324212. |
| P5 determinism | **MET on Linux**: the same bytes from every entry and on repeat, with the pentagon map's SHA-256 pinned (`tests/planner_v2.rs`). The cross-platform half is met when the reproducibility matrix runs this test green on macOS and Windows. |
| P6 additivity | **MET**. The v2 flag is written only on ill-conditioned cells, and v1's greedy is kept by name. v1's outputs and tests are unchanged. |

**B1a v2 part 1 is NOT MET (P4).** By the pre-registration, B1b stays blocked.

## What the result shows (descriptive, after the run)

- The scoping rules of v2 (P1's condition number and P2's four-station regime) leave every v2 cell meeting P1, and
  every in-regime cell meeting P2. These are new layouts, not v1's.
- The exchange step improves on greedy alone (0.324 to 0.351) but stops at a local optimum below the best random
  subset. A wider neighbourhood (two-for-two exchanges), several restarts, or simulated annealing would be the next
  step. That needs a new pre-registration and is not tried here.
