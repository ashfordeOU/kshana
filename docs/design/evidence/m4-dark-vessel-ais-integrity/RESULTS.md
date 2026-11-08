<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M4: dark vessels and AIS integrity: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings and amendments:
`xval/m4-dark-vessel/README.md`. MODELLED: synthetic scenes only. Every output describes data consistency, never
intent.

| Step | Commit |
|---|---|
| Generator readings 1 to 12 | `a4df821fb` |
| Generator, with B6 tested | `d7aebd559` |
| Decision readings 13 to 19, with the fix-owner amendment | `ed70da1b0` |
| Logic | `f451f9d7f` |
| Amendment of reading 15 after development run 1 (an offset's onset is one jump, not a duplicate) | `e415416ff`, `1fdb1ad24` |
| Amendment of reading 17 after development run 2 (offset detection by a vote over all candidates) | `0b400d1c1`, `930a0c728` |
| `M4Params::v1` from development run 3 (window 60 s, m = 3, c = 5 km) | `c7a5b7276` |
| The scored seeds 1000 to 1009, generated and run once | this commit |

The development outputs are kept (`dev-first`, `dev-second`, `dev-third`). The scored output is `scored.json`. The
bars were not changed.

## Summary (seeds 1000 to 1009, 20 000 vessels)

| Bar | Result |
|---|---|
| B1 false alarms | **MET**: FA 0.0050 (95 % interval 0.0040 to 0.0062), bar ≤ 0.01. |
| B2 dark | **NOT MET**: recall 0.848 (0.828 to 0.866), bar ≥ 0.95. Precision 0.999 meets its part (≥ 0.80). |
| B3 gaps | **MET**: recall 1.000 (600 of 600), bar ≥ 0.85. |
| B4 position offset | **NOT MET**: recall 0.807 at 5 km (bar ≥ 0.85). At 10, 20 and 50 km: 0.846, 0.825 and 0.871 (bar ≥ 0.98 each). At 2 km (no bar): 0.032. |
| B5 identity duplicate | **MET**: recall 1.000 (600 of 600), bar ≥ 0.95. |
| B6 determinism | **MET** on Linux. The generator gives byte-identical files and pinned hashes (`tests/m4_generator.rs`), and seed 1000 gives the same decision twice and its recorded matrix (`tests/m4_verdicts.rs`). The generator test is in the cross-platform reproducibility matrix. |
| B7 additivity | **MET**: M4 adds new modules only. No file under `src/interference_map/` or `src/receiver_trust/` changed between `a4df821fb^` and this commit, and their existing pinned outputs are tested as before. |

**M4 is NOT MET** (B2 and B4). Both misses were visible on the development seeds before the scored run, and they are
recorded in the reading committed with `v1`.

## Confusion matrix (rows true, columns decided)

| true \ decided | NORMAL | DARK | GAP | POSITION-OFFSET | IDENTITY-DUPLICATE |
|---|---|---|---|---|---|
| NORMAL | 15 920 | 0 | 0 | 80 | 0 |
| DARK | 213 | 1 187 | 0 | 0 | 0 |
| GAP | 0 | 0 | 600 | 0 | 0 |
| POSITION-OFFSET | 452 | 1 | 0 | 947 | 0 |
| IDENTITY-DUPLICATE | 0 | 0 | 0 | 0 | 600 |

Redraws: 25 889 vessel draws touched land and were redrawn (reading 5). The Baltic's islands and coasts are dense
on the 0.25° cells.

## What the misses show

- **Dark vessels (B2).** 213 of 1 400 were decided NORMAL.
  - A dark vessel's fixes are flagged dark only when no AIS track is within the gate (radius about 3.7 km). With
    2 000 vessels on about 385 000 km² of sea, a given fix has roughly a one-in-five chance of falling inside some
    other vessel's gate.
  - The majority rule then fails for vessels with few fixes.
  - A method that uses the fix sequence (several fixes along one dark path) rather than single fixes would do
    better. That is a new pre-registration, not a change here.
- **Position offsets (B4).** 452 of 1 400 were decided NORMAL.
  - The rule needs 3 misses that agree on one displacement. The onset is uniform in the first 4 h, so a vessel
    whose offset begins late has too few accesses after onset.
  - Recall barely depends on `d` beyond 5 km (0.81 to 0.87). That is the signature of this count limit, not of fix
    noise.
  - Requiring fewer misses raises false alarms above 5 % on the development seeds.
- **2 km offsets** are 2σ of the fix noise and are not separable from one fix, as the pre-registration said. They
  have no bar.

## What this does not show

- It does not show that real vessels, real RF fixes or real AIS reception behave like the generator.
- It does not show that a flagged vessel did anything wrong. Gaps and offsets have ordinary causes: equipment
  faults, reception loss, GNSS interference, transponders switched off in port.
- It does not validate the logic. Results stay MODELLED.
