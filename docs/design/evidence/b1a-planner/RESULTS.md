<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B1a (0.41): the monitoring-network planner, results of part 1

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). The readings of part 1, the three layouts,
the two placement instances and the independent oracle (`xval/planner/oracle.py`, numpy and the standard
library only) were committed in `a723f0d31` before any planner code, together with the oracle's expected
outputs. Reading 12, on P2's regime, was committed in `c2f947b33` after the P1 comparison and before any P2 run.
The bars were not changed.

Reproduce with `cargo test --release --test planner -- --nocapture`.

## Summary

| Bar | Result |
|---|---|
| P1 independent recomputation | **NOT MET**. Detection agrees: `P_d`, `P_D` and `P_k` are within 1.9e-13 on every cell (bar 1e-12), and the "not locatable" cells are identical. DRMS meets 1e-9 relative on all 483 locatable cells of the square and all 515 of the circle, but 4 of the line's 619 miss, by 1.3e-9 to 2.6e-9. Those 4 lie on the line's own axis, the degenerate case, where the source is collinear with every station. Three have DRMS of 6e7 to 7e7 m, and one 1.2e4 m. |
| P2 the bound is attained | **NOT MET**. 52 of the 54 barred cells (near-linear regime) are within ±5 %: their Monte Carlo RMS is 0.98 to 1.02 times the DRMS. Two are not. The square's cell 1293 has a ratio of 1.097, with 196 of 10 000 trials not converged. The circle's cell 1293 has 0.717, with 1 972 not converged, and leaving those out biases its RMS low. |
| P3 detection by simulation | **MET**. At 60 cells, the empirical `P_D` and `P_k` from 100 000 draws lie inside the 99.9 % binomial interval. |
| P4 placement | **Exhaustive part MET; greedy part NOT MET**. For 12 candidates and `m` = 4, the planner's subset is the oracle's exhaustive optimum, [5, 8, 9, 10], objective 0.1689. For 30 candidates and `m` = 6, the greedy subset scores 0.2754, below the best of 1 000 seeded random subsets, 0.2790. |
| P5 determinism | **MET on Linux; the other platforms' CI runs are still to come**. The command line, the text surface (`run_json`) and a second run give the same bytes, and the circle map equals the committed engine output (`tests/fixtures/planner/engine_circle.json.gz`). Python (`tests/python/test_bindings.py`) and WebAssembly (`web/smoke.mjs`) compare with the same file in CI; neither has run yet. The macOS and Windows CI legs will show the same bytes, or not, on their first run. `3d` mode is checked for determinism only (reading 7). |
| P6 additivity | **MET**. The planner is a new module and changes no existing function. |

Part 1 is **NOT MET** (P1, P2 and the greedy part of P4). By the pre-registration this blocks B1b. Part 2,
reproducing a published campaign, is not started; the publication is still to be named at sign-off.

## What the misses mean

- **P1.** Where the source is collinear with every station, the information matrix is close to singular. Two
  independent double-precision computations then agree only to the matrix's condition number times the
  rounding unit, which is above 1e-9 at these cells. Which of the two is closer to the exact value is not established here.
  Neither is meaningful beyond about 1e-9, and both say the cell is all but unlocatable (DRMS of
  tens of thousands of kilometres). The bar does not exempt degenerate cells, so the miss stands.
- **P2.** The 0.05 × mean-distance rule did not keep these two cells in the linear regime. Each is near
  the edge of its layout's coverage, with three stations used: two TDOAs for two unknowns. With that much
  noise, the hyperbolae often have no intersection near the truth, so the estimator fails or departs from
  the bound. The planner's DRMS is a lower bound; in that geometry it is optimistic.
- **P4 greedy.** One-at-a-time greedy growth is not a good search for this objective, which rewards coverage
  by combinations of stations. A better search (an exchange step after the greedy, or a larger exhaustive
  limit) would need a new pre-registration of P4's greedy part.

## Scope

The maps are MODELLED, with free space only. This says nothing about any real site's performance.
