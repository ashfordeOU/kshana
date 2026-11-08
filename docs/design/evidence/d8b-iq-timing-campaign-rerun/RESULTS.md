<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8b results: IQ-layer timing and campaign re-runs

Each row reports on its own, against the pre-registration in this directory (signed off on 3 November 2026). Rows are
added as they are scored.

## Row 7. `VM-e6a6348d`: acquisition hysteresis in the jamming kind, on a fresh power ladder

- **Readings and run set:** `xval/d8b-jamming-ladder/` (README readings 1 to 6, `ladder.py`, `ladder.json`), committed at
  115d99926 before any engine run. No engine change.
- **The ladder:** `jamming-demo` at −34, −33, −32, −31, −29, −28, −27, −26, −24, −23, −22 and −21 dBW (12 runs), every
  integer power whose median-link effective C/N0 (closed form, a 45° link; reading 2) lies in [22, 35] dB-Hz, less
  supplement 1's −30 and −25 dBW.
- **Run:** once, 2026-11-08 (`tests/jamming_acq_ladder.rs`, under a second). No bar, ladder or setting was changed
  after a result was seen.

| check | measured | verdict |
|---|---|---|
| Informativeness (≥ 10 % of link-epochs with effective C/N0 in [25, 32) dB-Hz, at 32 dB-Hz / 60 s) | 2614 of 5472 = 47.8 % | holds |
| H2 (acquisition = tracking threshold, delay 0) | `acquired` = "not lost" on all 5472 links | MET |
| H3 (32 dB-Hz, 60 s; `xval/jamming-acq-agc/hysteresis.py`) | all 5472 flags agree; 2626 links have `acquired` ≠ "not lost" | MET (informative) |
| H4 (25, 28, 32, 36, 40 dB-Hz) | no epoch's acquired count rises with the threshold (totals below) | MET |
| H1/G1, G2, G3 (regressions, `tests/jamming_acq_agc.rs`) | all pass; G2 worst difference 0.0007 dB | hold |

Acquired link-epochs by acquisition threshold (25 / 28 / 32 / 36 / 40 dB-Hz): −34 dBW 440/440/440/59/0; −33 440/440/440/0/0;
−32 440/440/295/0/0; −31 440/440/142/0/0; −29 440/440/0/0/0; −28 440/359/0/0/0; −27 440/162/0/0/0; −26 440/118/0/0/0;
−24 169/0/0/0/0; −23 118/0/0/0/0; −22 and −21 0 at every threshold.

**Verdict: MET on re-run** (the precondition holds and H2 to H4 hold on the ladder; the regressions pass).

Disclosures: the ladder follows the pre-registration's rule, but the rule was written after the 0.40 runs (supplement 1)
had shown where the thresholds lie, so the ladder's region was not unknown; what the rule fixes is that the powers come
from the scenario file alone and repeat none of supplement 1's. The "median link" is a 45° link because satellite
elevations are not known without an engine run (reading 2). This is MODELLED internal consistency of a link-budget
model against an independent recomputation of its state machine; no receiver's acquisition is checked.

Pins: `tests/jamming_acq_ladder.rs` (counts and H4 totals).

## Row 9. `VM-6254a75d`: detection ROC from a scored campaign, R1, with the window restart

- **Readings and oracle:** `xval/d8b-roc-restart/` (README readings 1 to 6, `oracle.py`), committed at bc56e785e before
  the engine change. Reading 5a, an amendment written before any run, is disclosed there: campaign cells keep each
  window's maximum but not the CUSUM series, so the restart is checked on seeded synthetic series and the AUC from the
  cells' window maxima.
- **The change:** the window scorer computes each scored `cn0_drop` and `cn0_rise` window's statistic as if the CUSUM
  had been at zero at the window's start, exactly from the stored series (`detect::windows`, `[monitors] roc_restart`,
  default on). The other kinds' statistics are not changed. The ROC tests keep the 1 s C/N0 cadence they were scored at
  (`xval/d8b-cn0-stride/` reading 8).
- **Run:** once, 2026-11-08, in release (`tests/iq_campaign_roc_restart.rs`, about 9 minutes for the six campaigns).
  No bar, recipe or setting was changed after a result was seen.

| check | measured | verdict |
|---|---|---|
| Control (`roc_restart = false`), R1 seeds 300 to 305 | AUC 0.7855 over 18 positive and 36 negative windows; `P_d` 1.0, `P_fa` 0.5 at `h = 5` | reproduces the 0.40 record |
| Control, R2 seeds 400 to 405 | AUC `cn0_drop` 0.5000, `sqm_delta` 0.5664, `power_drop` 0.6389 | reproduces the 0.40 record |
| Oracle, the restart (synthetic, 144 windows over 8 × 3 seeded series) | worst difference 0, AUC difference 0 | agrees (bar 1e-9) |
| Oracle, the AUC of each scored run from the cells' window maxima | difference at most 1e-9 on all four runs | agrees |
| **R1**, seen seeds 300 to 305 | `cn0_drop` AUC **1.0000** over 18 positive and 36 negative windows; `P_d` 1.0, `P_fa` 0.0 at `h = 5` | ≥ 0.95 |
| **R1**, fresh seeds 100 300 to 100 305 | `cn0_drop` AUC **1.0000** over 18 positive and 36 negative windows; `P_d` 1.0, `P_fa` 0.0 at `h = 5` | ≥ 0.95 |
| R2 (regression), seen seeds 400 to 405 | AUC `cn0_drop` 0.5000, `sqm_delta` 0.5664, `power_drop` 0.6389 | within 0.5 ± 0.2 |
| R2 (regression), fresh seeds 100 400 to 100 405 | AUC `cn0_drop` 0.5000, `sqm_delta` 0.6080, `power_drop` 0.5000 | within 0.5 ± 0.2 |

**Verdict: R1 MET on re-run** (AUC ≥ 0.95 on the seen and the fresh seeds); R2 holds on both.

Disclosures:

- As the pre-registration states, the pre-event-only AUC was known to be 1.0, so the outcome on seeds 300 to 305 was
  largely known in advance; the fresh seeds, run by no one before, meet the bar too.
- The restart changes what a negative window measures: the evidence a window holds on its own, not the detector's
  running state. The alarm scoring (PRO-31, M4) does not use window maxima and is not changed.
- R2's `cn0_drop` AUC is exactly 0.5000 with and without the restart, as all-tied window maxima would give (ties count
  half; with no event the CUSUM need never leave zero). The windows were not inspected one by one. R2 holds as
  registered; it says little about `cn0_drop` beyond that.
- This is MODELLED internal consistency on Kshana's own GPS L1 C/A scenes with attenuations of the satellites' own
  signals. No real receiver or recorded interference is checked.

Pins: `tests/iq_campaign_roc_restart.rs` (AUCs to 5e-5, window counts). The 0.40 test
`r1_the_cn0_drop_roc_separates_6_db_attenuations` now states `roc_restart = false` and stays ignored with the 0.40
finding. The bench's task (b) result carries these numbers (`xval/bench/PREREGISTRATION-0.41.md` §4).
