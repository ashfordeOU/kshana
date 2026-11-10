<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M4 v3: manoeuvring dark tracks, global association, collision-tolerant onsets: results

Pre-registration: `PREREGISTRATION-v3.md` (signed off 10 November 2026). Readings: `xval/m4-dark-vessel/README.md`,
readings 25 to 31. MODELLED: synthetic scenes only. Every output describes data consistency, never intent. v1
(`RESULTS.md`) and v2 (`RESULTS-v2.md`) stay published as NOT MET.

| Step | Commit |
|---|---|
| Sign-off | `1c3401d3f` |
| Readings 25 to 31, before any v3 code or seed | `5a05b6807` |
| Logic, development run on seeds 30 to 39 (`dev-v3.json.gz`), `M4Params::v3` with `m` = 3 and new-track cost 9.21 | `9f734e189` |
| The scored seeds 3000 to 3009, generated and run once (`scored-v3.json`) | `05536ad29` |

No reading was changed after the development run. The bars are v1's and were not changed. The scored run used a
release binary built from `9f734e189` (SHA-256 `50535376a7319698cf111e5c487ca92e5e03a01a6d558f506e9046b41e70db01`);
it ran from 23:18:16 to 23:20:11 UTC on 10 November 2026 and exited 0.

## Summary (seeds 3000 to 3009, 20 000 vessels)

| Bar | Result |
|---|---|
| B1 false alarms | **MET**: FA 0.00075 (95 % interval 0.00039 to 0.00131), bar ≤ 0.01. |
| B2 dark | **MET**: recall 0.994 (1 392 of 1 400; 0.989 to 0.998), bar ≥ 0.95. Precision 0.867 (0.849 to 0.883), bar ≥ 0.80. v1: 0.848; v2: 0.877. |
| B3 gaps | **MET**: recall 1.000 (600 of 600). |
| B4 position offset | **NOT MET**: recall 0.489 at 5 km (137 of 280; bar ≥ 0.85); 0.646, 0.675 and 0.661 at 10, 20 and 50 km (bar ≥ 0.98 each); 0.004 at 2 km (no bar). v1: 0.807 at 5 km; v2: 0.396. |
| B5 identity duplicate | **MET**: recall 1.000 (600 of 600). |
| B6 determinism | **MET** on Linux for the decision: seed 3000 decided twice gives the same decision and its recorded confusion matrix (`tests/m4_verdicts.rs`). The generator is v1's and its pinned hashes stand. |
| B7 additivity | **MET**: v3 changes only `src/m4_logic.rs` (and the development example), behind `M4Params::v3`; the v1 and v2 paths give their recorded verdicts unchanged (`tests/m4_verdicts.rs`), and no file under `src/interference_map/` or `src/receiver_trust/` changed. |

**M4 v3 is NOT MET** (B4), as the development run showed before the scored run (README, "The v3 development run").
B2, missed by v1 and v2, is met.

## Confusion matrix (rows true, columns decided)

| true \ decided | NORMAL | DARK | GAP | POSITION-OFFSET | IDENTITY-DUPLICATE |
|---|---|---|---|---|---|
| NORMAL | 15 988 | 8 | 0 | 4 | 0 |
| DARK | 8 | 1 392 | 0 | 0 | 0 |
| GAP | 0 | 0 | 600 | 0 | 0 |
| POSITION-OFFSET | 501 | 206 | 0 | 693 | 0 |
| IDENTITY-DUPLICATE | 0 | 0 | 0 | 0 | 600 |

Redraws: 25 708 vessel draws touched land and were redrawn.

## What the result shows (descriptive, after the run)

- **The turn model and the global assignment fix dark vessels.** Recall rose from 0.877 to 0.994, with 8 of 1 400
  dark vessels missed. False alarms stay low: 8 normal vessels decided DARK and 4 decided POSITION-OFFSET.
- **206 offset vessels are decided DARK** (141 in v2). When an offset is not detected, the vessel's own fixes no
  longer match its AIS track and now chain reliably into dark tracks. That is "no matching AIS" for fixes that
  indeed have none; it is what keeps DARK precision at 0.867.
- **Collision-tolerant onsets help offsets only partly** (0.396 to 0.489 at 5 km). Most missed offsets are decided
  NORMAL (501 of 707 misses): too few agreeing misses after onset reach `m` = 3 in a 6 h scene.
- **What a successor would need** (a new pre-registration, not done here): an offset test that uses the dark track
  formed by the vessel's own displaced fixes, rather than only per-epoch misses.
