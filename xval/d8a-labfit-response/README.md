<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a row 6 v2: the lab fit with the C/N0 estimator's own response: readings, batch plan and oracle

The pre-registration is `docs/design/evidence/d8a-iq-tracking-cn0-rerun/PREREGISTRATION-v2.md`, signed off on 9 November
2026. Everything here is committed **before any engine code for v2** and before any v2 run. The v1 material is in
`xval/d8a-labfit-lag/`.

## Readings

1. **The modelled reading of a bin** (`[campaign_fit] cn0_model = "estimator-response"`).
   - **The bin's time.** As v1: the first time from the event's onset at which the stated profile reaches the bin's J/S
     on a rising or falling segment.
   - **Held levels.** A J/S reached only on a held (flat) segment, a step profile, or a level the profile does not reach
     in the event, is read as **settled**: every window at the bin's J/S, so the reading is the §3.1 model itself.
     (Found by the oracle's self-test before any engine code: without it, a held level's windows would all fall before
     the hold.)
   - **The windows.** The estimator's `M` windows of length `W_w` end at the bin's time. Window `k` is centred at
     `t_b − (k + ½) W_w`, for `k = 0 … M − 1`. A window centred before the onset has the baseline C/N0; otherwise its
     C/N0 is the §3.1 model at the profile's J/S there.
   - **The moments.** Each window's expected per-prompt moments, with unit noise power: `A² = 10^(C/10) · T`,
     `m2 = A² + 1`, `m4 = A⁴ + 4A² + 2`. They are averaged over the windows. The reading is the estimator's transform
     `m2m4_cn0_from_moments(m2, m4, T)`. For a held level it returns the level exactly.
2. **The estimator settings** are given in `[campaign_fit]`, not fitted: `cn0_windows = 50`, `cn0_window_s = 0.02`,
   `coherent_s = 0.001`. These are the campaigns' design (the default loop design, GPS L1 C/A with 20 ms bit windows).
   The batch test checks them against the campaign's loop design.
3. **Where it applies.** Wherever v1's lag applied: the fit, its bootstrap, the hold-outs of (c), and the report's bin
   residuals. Scoring, censoring, the lock models and the §3.2 closed form are not changed.
4. **Control.** With `cn0_model` unset, the bar-(a′) campaign (seed 2026 1012) must reproduce the recorded −3.935 dB and
   (d) 35.514 against 37.714 dB.
5. **Inputs.**
   - v1's inputs, now seen: the bar-(a′) campaigns with seeds 2026 1012 and 2026 1012 + 100 000, and the (b′) campaigns
     with seeds 7000 to 7049 and 107 000 to 107 049.
   - v2's fresh inputs: the bar-(a′) campaign with seed 2026 1012 + 200 000, and the (b′) campaigns with seeds 207 000
     to 207 049.
   - Recipe, truth draw, tracking, scoring and bootstrap (1000 replicates, seed 7) are as v1.
6. **Oracle check.** `oracle.py` recomputes the modelled reading from the stated profile alone.
   - Batch 01 dumps, for every bin of the bar-(a′) campaign, the profile, bin, baseline, the fitted `q` and `δ`, and the
     engine's modelled reading.
   - `oracle.py --check` prints only the bin count and the worst difference, so no fitted value is read.
   - The bar is 1e-6 dB. It is run when batch 01 lands; a failure stops the row.
7. **Verdict.** Bars (a′), (b′), (c) and (d) as registered, applied to each of three input sets: v1-registered,
   v1-fresh and v2-fresh. Met on v2 only if all four hold on all three sets (`score.py`).

## Batch plan (fixed before batch 1)

| batch | runs | fits |
|---|---|---|
| 01 | bar-(a′), seed 2026 1012 | unset (control) and estimator-response; the oracle dump |
| 02 | bar-(a′), seed 2026 1012 + 100 000 | estimator-response |
| 03 | bar-(a′), seed 2026 1012 + 200 000 | estimator-response |
| 04 to 08 | (b′) seeds 7000 to 7049, 10 per batch, in order | estimator-response |
| 09 to 13 | (b′) seeds 107 000 to 107 049 | estimator-response |
| 14 to 18 | (b′) seeds 207 000 to 207 049 | estimator-response |

As v1:
- raw lines and truths go to `raw/`;
- the run prints only line counts and SHA-256;
- batches are committed as they land, unread, and never edited;
- a lost batch is re-run whole from its seeds and must reproduce any committed lines;
- the control line alone is compared by script before scoring;
- `score.py` runs once, after batch 18.
