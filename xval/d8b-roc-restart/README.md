<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8b row 9 (`VM-6254a75d`): detection ROC with the window restart: readings and oracle

The pre-registration is `docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION.md` (row 9), signed off on
3 November 2026, under the bars of `docs/design/DETECTION-ROC.md` §2 (R1 unchanged; R2 re-run as a regression). This
directory holds the readings fixed here **before any engine change**, and an independent oracle (`oracle.py`, Python
standard library only, sharing no code with the engine).

## Readings fixed before the engine change

1. **The change.** For the two C/N0 kinds, `cn0_drop` and `cn0_rise`, whose statistic is a CUSUM with memory, the
   window scorer computes each scored window's statistic as if the CUSUM had been at zero (its value with no change
   before it) at the window's start. From the stored series `g_1, g_2, …` alone this is exact: inside the window,
   `g'_t = max(0, g'_{t−1} + g_t − g_{t−1})` when `g_t > 0` and `g'_t = 0` when `g_t = 0`, with `g'` equal to zero before
   the window's first sample and `g_{t−1}` the series value just before it (zero if there is none). The window's
   statistic is the largest `g'_t` in it. It applies to every scored window of those kinds, positive and negative. The
   other kinds' statistics (block power, spectral excess, kurtosis, the moving-average SQM `|z|`) are left as they are.
2. **A switch.** `[monitors] roc_restart` (default `true`, so the change applies to every campaign, as the sign-off
   accepts). The control runs with `roc_restart = false` and must reproduce the recorded R1 (AUC 0.7855 over 18
   positive and 36 negative windows) and R2 (AUC `cn0_drop` 0.5000, `sqm_delta` 0.5664, `power_drop` 0.6389).
3. **Inputs.** R1: the registered recipe, seeds 300 to 305 (seen) and 100 300 to 100 305 (fresh). R2 (regression): the
   registered recipe, seeds 400 to 405 (seen) and 100 400 to 100 405 (fresh). Fresh seeds have not been run by anyone.
4. **Verdict.** R1 is met on re-run only if AUC ≥ 0.95 on the seen **and** the fresh seeds; R2 must hold on both. A miss
   is recorded with its numbers and pinned.
5. **Oracle check.** For every cell of each run, the test writes the `cn0_cusum_drop` series of each channel and the
   engine's `cn0_drop` windows to a JSON file; `oracle.py` recomputes each window's restarted statistic from the series
   and the window bounds, and the AUC from the positive and negative maxima (trapezoidal, ties count half), and must
   agree with the engine within 1e-9.
5a. **Amendment to reading 5, before any run** (no campaign had been run): campaign cells keep each window's
    maximum but not the CUSUM series, so the oracle checks the restart and the AUC separately. (i) The restart: a test
    builds CUSUM-shaped series (random walks clamped at zero, seeded), scores them through the engine's
    `detect::windows` with the restart on, and `oracle.py` recomputes every window from the series; agreement within
    1e-9. (ii) The AUC: for each run, `oracle.py` recomputes the `cn0_drop` AUC from the cells' window maxima and must
    agree with the engine's within 1e-9.
6. **The bench.** The bench's task (b) result file carries these numbers and the verdict
   (`xval/bench/PREREGISTRATION-0.41.md` §4); it does not score R1 again.
