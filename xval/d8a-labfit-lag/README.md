<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a row 6 (`VM-c9318c63`): the lab fit with the C/N0 estimator lag corrected: readings and batch plan

The pre-registration is `docs/design/evidence/d8a-iq-tracking-cn0-rerun/PREREGISTRATION.md` (row 6), signed off on
3 November 2026, under the bars of `docs/design/LABFIT-FROM-IQ.md` §13.3 and §13.4 ((a′), (b′), (c), (d)). Everything
here is committed **before any engine code** for the change and before any run.

## Readings

1. **The change (one, in the fit, not in the scorer).** A new `[campaign_fit] cn0_lag_s` (s; default 0, which is the
   fit as it is). With `cn0_lag_s = L > 0`, every C/N0 bin that enters the fit or is compared with the model (the fit
   itself, its bootstrap, the hold-outs of (c) and the report's residuals) is modelled at the stated J/S the profile had
   `L` seconds **before** the bin's time, instead of at the bin's own stated J/S. The bin's time is the first time in
   the event, from its onset, at which the stated profile reaches the bin's J/S (piecewise-linear profiles are inverted
   segment by segment; a bin the profile does not reach in the event, or a step profile, is left unshifted). The
   shifted J/S is clamped at the profile's value at onset. Scoring, censoring, the bins' stated J/S in the report, the
   lock models' conditions and the §3.2 closed form are not changed.
   Why: §13.6 found `δ_eff` about 1.1 to 1.2 dB low on 3 dB/s ramps, with the leading hypothesis that the C/N0
   estimator's averaging lags the stated-J/S bins; the follow-up's S1 confirmed it (held levels recover `δ_eff` within
   0.19 dB). The campaigns' M2M4 estimate averages the last 50 windows of 20 ms, 1 s, so its centre lags by 0.5 s.
2. **The scored setting.** `cn0_lag_s = 0.5` (half the 1 s M2M4 averaging span of the campaigns' loop design). Fixed
   here.
3. **Control.** With `cn0_lag_s = 0` the bar-(a′) campaign (seed 2026 1012) must reproduce the recorded `δ̂_eff`
   −3.935 dB (interval −4.055 to −3.796) and (d) 35.514 dB against 37.714 dB; the (b′) campaigns 0 and 1 their recorded
   −3.415 and −3.056 dB.
4. **Inputs.** The registered bar-(a′) campaign (`A_SEED` 2026 1012, 6 recordings) and its fresh copy (seed
   2026 1012 + 100 000); the 50 registered (b′) campaigns (seeds 7000 to 7049, 5 recordings each) and 50 fresh ones
   (seeds 107 000 to 107 049). The recipe, truth draw, scene, tracking, scoring, bootstrap (1000 replicates, seed 7) and
   `[validation]` table are those of `tests/iq_labfit_campaign.rs`, unchanged.
5. **Bars, as registered.** (a′): `|δ̂_eff − δ_eff| ≤ 0.5 dB` on the bar-(a′) campaign. (b′): the 95 % interval covers
   the true `δ_eff` in at least 45 of 50 campaigns. (c): hold-out PI90 coverage in [0.80, 0.98] for the C/N0 bins and
   the time-to-loss events under each lock model. (d): for each lock model, the median closed form at the lost events'
   baselines within 1 dB of the median scored `js_at_loss_db`. The `Q` clauses are not re-run (not identifiable,
   §13.1); they stay NOT MET.
6. **Verdict.** Met on re-run only if (a′), (b′), (c) and (d) hold on the registered **and** the fresh inputs.
7. **Not re-run.** The follow-up's S2 (on its stepped campaign S) is listed as missed in the row, but campaign S is not
   among the row's inputs; it is not re-run here and stays as recorded.

## Batch plan (fixed before batch 1)

The runs take about 6 hours on this container's 4 cores, so they run in batches. Each batch runs the release test
`d8a_row6_batch` in `tests/iq_labfit_campaign.rs` (`KSHANA_D8A_ROW6_BATCH=NN`; amended from a separate test file
before batch 1, to reuse that file's campaign builders), writes **raw output only** (one JSON line per fit: the campaign seed, `cn0_lag_s`, `δ̂_eff`
and its interval, and for the bar-(a′) campaigns the (c) coverages and the (d) medians) to `raw/batch-NN.jsonl`, and
prints only the batch's line count and SHA-256. The truths are written by the same test to `raw/truth-NN.jsonl`. No
verdict is computed and no line is read before every batch is in. The scoring rule is `score.py`, committed with this
file, and is not changed after batch 1 starts.

| batch | runs | fits |
|---|---|---|
| 01 | bar-(a′) campaign, seed 2026 1012 (seen) | `cn0_lag_s` 0 (control) and 0.5 |
| 02 | bar-(a′) campaign, seed 2026 1012 + 100 000 (fresh) | 0.5 |
| 03 to 07 | (b′) seeds 7000 to 7049 (seen), 10 campaigns per batch, in order | 0 (control for 7000 and 7001 only) and 0.5 |
| 08 to 12 | (b′) seeds 107 000 to 107 049 (fresh), 10 per batch, in order | 0.5 |

**A lost batch** (the container reclaimed, a crash) is re-run whole from its seeds, which fixes every campaign and fit
(the scenes, tracking and bootstrap are seeded and deterministic). If any of its lines had been committed before the
loss, the re-run's lines must be identical to them; a difference stops the row and is reported. Batches are committed
as they land and never edited.

**Scoring, once, after batch 12:** `python3 -I score.py raw` applies reading 5 to the raw files and prints the
verdicts. Its output is the result.
