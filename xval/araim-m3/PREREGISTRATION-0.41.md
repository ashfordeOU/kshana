<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D15 (0.41): ARAIM Milestone 3 reproduction, reference reconciliation

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** The 12 claims and their bars are those of [`PREREGISTRATION.md`](PREREGISTRATION.md) in
this directory and are not changed. Numbers marked *proposed* are new.

## Why this row

The reproduction of the EU-US WG-C ARAIM Milestone 3 Report's maximum-URA tables (Tables 5, 6, 7) met **8 of 12**
entries and missed **4**, pinned (`docs/INTEGRITY.md`): the dual-constellation Depleted RNP 0.1 entry (coverage 0.847 at
9 m, needs 0.90) and three GPS-only entries (0.70 at 4 m, 0.58 at 6 m, 0.65 at 10 m against printed 4 m, 6 m and
">10 m"). The registration listed deviations from the report's setup that could not be removed then (D1 almanacs, D2
depleted slot, D3 sampling, D4 algorithm details, D6 vertical budgets). The leading hypothesis for the GPS-only misses,
not a finding, is D1: a uniform Walker shell standing in for the real GPS slots.

Roadmap item D15 is a reference reconciliation: remove the deviations that public sources now allow, then re-run all
12 claims under the original bars.

## What changes (each fixed now)

| Deviation | Change | Source (public) |
|---|---|---|
| D1, GPS almanac | the uniform Walker 24/6/1 shell is replaced by the **baseline 24-slot GPS constellation** of the GPS Standard Positioning Service Performance Standard (slot assignments at its defined epoch, the table of baseline slots) | GPS SPS Performance Standard, 5th edition (April 2020), <https://www.gps.gov/technical/ps/2020-SPS-performance-standard.pdf>; SHA-256 pinned at sign-off |
| D1, Galileo | **unchanged**: the Galileo nominal constellation is a Walker 24/3/1 at 56 degrees, as used; its Galileo-only entries all matched | — |
| D2, depleted slot | the removed GPS satellite is the first slot of the first plane of the SPS table (slot A1); for Galileo, unchanged. All 24 single-slot removals are also run for the GPS and dual Depleted rows and **reported without a bar** | the same table |
| D3, sampling | the report's grid and step: **5 by 5 degrees** and **600 s** | the report, Annex A |
| D4, D5, D6 | unchanged, still stated as deviations | — |

The report's own almanac files ("RD-61") remain unobtained, so the Optimistic rows stay not attempted.

## Procedure

1. Sign-off and commit of this file.
2. **Control:** the 0.40 configuration on the 0.41 code reproduces `results.json` (every coverage to 1e-12). A
   mismatch stops the campaign.
3. One ablation at a time, each reported, none deciding a verdict: (a) D3 only; (b) D1 only; (c) D1 and D2 together.
4. **The scored run:** all changes together, all 12 claims, the coverages written to `results-0.41.json`. Run once.
   (Cost estimate: about four times the 0.40 study per configuration for the finer grid and step; the slot sweep is
   reported, not scored, and may run after the verdict.)

## Bars

The 12 claims as registered, exactly (for example T7-B-01: coverage at least 0.90 at 6 m and below 0.90 at 7 m). Each
claim is scored on its own.

## Verdicts

- Each of the 12 claims is recorded as reproduced or not on the reconciled setup. A claim that matched in 0.40 and
  misses now is a miss and is published as such.
- The 0.40 record (8 of 12) stays beside it, with its deviations.
- **Proposed rule for the summary line:** "n of 12 reproduced after reconciliation (D1 GPS slots, D2, D3 removed); D4 to
  D6 remain". Everything stays **MODELLED**: D4 (the engine's ADD v4.2 path in place of the report's text) still keeps
  this from being the report's own experiment.

## What a result would and would not mean

If the GPS-only entries are reproduced after D1 is removed, the Walker-shell hypothesis becomes a finding for these
entries; it would not show that every remaining difference is gone. If they still miss, D1 is ruled out as the sole
cause and the result says what is left (D4, the unknown depleted slot, the report's unpublished almanac). Nothing here
bears on certification or approval of any ARAIM service.

## Owner decisions at sign-off

1. The GPS SPS Performance Standard's 24-slot table as the D1 replacement.
2. Slot A1 as the depleted GPS satellite, with the 24-slot sweep reported only.
3. Accept the compute cost of the report's 5 by 5 degree grid and 600 s step.

## Sign-off (3 November 2026)

Signed as proposed (the 24-slot GPS baseline, depleted slot A1, 5° grid, 600 s step). The GPS Performance Standard link is verified and recorded before the run.
