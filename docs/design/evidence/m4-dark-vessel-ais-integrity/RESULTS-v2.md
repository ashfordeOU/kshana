<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M4 v2: dark vessels by fix sequence, offsets by time-consistent misses: results

Pre-registration: `PREREGISTRATION-v2.md` (signed off 9 November 2026). Readings: `xval/m4-dark-vessel/README.md`,
readings 20 to 24. MODELLED: synthetic scenes only. Every output describes data consistency, never intent. v1
(`RESULTS.md`) stays published as NOT MET.

| Step | Commit |
|---|---|
| Sign-off | `4a4a853c5` |
| Readings 20 to 24, before any v2 code or seed | `5da802f2f` |
| Logic, development run on seeds 20 to 29 (`dev-v2.json.gz`), `M4Params::v2` with `m` = 3 | `21b1d3cd9` |
| The scored seeds 2000 to 2009, generated and run once (`scored-v2.json`) | this commit |

No reading was changed after the development run. The bars are v1's and were not changed.

## Summary (seeds 2000 to 2009, 20 000 vessels)

| Bar | Result |
|---|---|
| B1 false alarms | **MET**: FA 0.00006 (95 % interval 0.000002 to 0.00035), bar ≤ 0.01. |
| B2 dark | **NOT MET**: recall 0.877 (0.859 to 0.894), bar ≥ 0.95. Precision 0.897 meets its part (≥ 0.80). v1: 0.848. |
| B3 gaps | **MET**: recall 1.000 (600 of 600). |
| B4 position offset | **NOT MET**: recall 0.396 at 5 km (bar ≥ 0.85); 0.689, 0.650 and 0.646 at 10, 20 and 50 km (bar ≥ 0.98 each); 0.000 at 2 km (no bar). Lower than v1 (0.807 at 5 km). |
| B5 identity duplicate | **MET**: recall 1.000 (600 of 600). |
| B6 determinism | **MET** on Linux for the decision: seed 2000 decided twice gives the same decision and its recorded confusion matrix (`tests/m4_verdicts.rs`). The generator is v1's and its pinned hashes stand. |
| B7 additivity | **MET**: v2 changes only `src/m4_logic.rs`, behind `M4Params::v2`; the v1 path gives v1's recorded verdicts unchanged (`tests/m4_verdicts.rs`), and no file under `src/interference_map/` or `src/receiver_trust/` changed. |

**M4 v2 is NOT MET** (B2 and B4), as the development run showed before the scored run (README, "The v2 development
run").

## Confusion matrix (rows true, columns decided)

| true \ decided | NORMAL | DARK | GAP | POSITION-OFFSET | IDENTITY-DUPLICATE |
|---|---|---|---|---|---|
| NORMAL | 15 999 | 0 | 0 | 1 | 0 |
| DARK | 172 | 1 228 | 0 | 0 | 0 |
| GAP | 0 | 0 | 600 | 0 | 0 |
| POSITION-OFFSET | 592 | 141 | 0 | 667 | 0 |
| IDENTITY-DUPLICATE | 0 | 0 | 0 | 0 | 600 |

Redraws: 25 748 vessel draws touched land and were redrawn.

## What the result shows (descriptive, after the run)

- **The step test removes false alarms but costs recall.** FA fell from 0.0050 to 0.00006. Offset recall fell, because
  a fix from another vessel inside the identity's gate after onset ends the test. With about 2 000 vessels in the
  area, that happens often over a 6 h scene.
- **141 offset vessels are now decided DARK.** After onset, their own fixes no longer match their AIS track and,
  when the offset is not detected, chain into dark tracks. That is the logic reporting "no matching AIS" for fixes
  that indeed have none; it lowers DARK precision to 0.897.
- **Fix sequences help DARK only a little** (0.848 to 0.877). Vessels turn between fixes about 40 min apart, so a
  constant-velocity residual rarely beats a nearby AIS gate.
- **What a successor would need** (a new pre-registration, not done here): a manoeuvring-target model or
  multi-hypothesis association for dark tracks, and an onset test that tolerates gate collisions from other vessels.
