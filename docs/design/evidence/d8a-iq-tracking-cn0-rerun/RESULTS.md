<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a results: IQ tracking and C/N0 re-runs

Each row reports on its own, against the pre-registration in this directory (signed off on 3 November 2026). Rows are
added as they are scored.

## Row 4. `VM-bdfec2e4`: the capped FLL pull-in, with the forced hand-over seeded by a smoothed frequency

- **Readings:** `xval/d8a-fll-handover-seed/README.md`, committed at 2552a8738 before the engine change. Its reading 7
  development runs (seeds k = 1001 to 1010) were made and recorded before the scored run (4933232c9); no reading was
  changed after them.
- **The change (one, to the hand-over logic):** `[design.carrier] fll_handover_mean_s` (`LoopConfig::
  fll_handover_mean_s`). At a hand-over forced by `fll_pull_in_max_s`, the carrier filter's frequency is set to the mean
  NCO Doppler over the pull-in's last `fll_handover_mean_s` seconds. Opt-in; out of the design hash when unset. Scored
  design "seeded": cap 1.0 s, mean over 0.5 s.
- **Run:** once, 2026-11-08, in release (`tests/iq_fll_handover_seed.rs`, 180 runs, 271 s). Per-run statistics:
  `tests/fixtures/fll_handover_seed/results.csv`.

| bar | seen (k = 1 to 10) | fresh (k = 100 001 to 100 010) | verdict |
|---|---|---|---|
| Control (registered survey, no seeding) | reproduces `fll_handover_floor/results.csv` exactly | | reproduces |
| D0 (the limit is there) | default FLL still on at the end in 9 of 10 | 10 of 10 | MET |
| D1 (additivity) | default hash unchanged; the key in the canonical form only when set; invalid uses refused | | MET |
| D2 at 33 dB-Hz (all 20 hand over and hold) | **20 of 20** | **20 of 20** | MET |
| D2 at 31 dB-Hz | 15 of 20 | 6 of 20 | **NOT MET** |
| D3 at 33 dB-Hz (σ within 25 % of the PLL alone) | 6.073° / 6.056° (ratio 1.003) | 6.078° / 6.043° (1.006) | MET |
| D3 at 31 dB-Hz | 15.281° / 8.420° (1.815) | 23.939° / 8.505° (2.815) | **NOT MET** |
| D4 (100 Hz-off pull-in at 45 dB-Hz) | LOCKED, no false lock or timeout, within 5 Hz | | MET |
| 29 dB-Hz (reported, not graded) | 0 of 20 hold | 0 of 20 hold | |

**Verdict: NOT MET** (D2 and D3 at 31 dB-Hz). At 33 dB-Hz the change takes the capped design from 16 of 20 runs holding
(0.40) to 20 of 20 on the seen and the fresh seeds, with phase jitter within 1 % of the PLL alone, so that half of D2 and
D3 is met on re-run.

What the result says about F3 (the 0.40 hypothesis): at 33 dB-Hz a smoothed frequency at the hand-over is enough, which
supports it there. At 31 dB-Hz it is not: the failing runs return to the FLL for one to three 1 s spells, as in 0.40,
and the seen and fresh seeds differ widely (15 and 6 of 20). A 0.5 s mean of the FLL's frequency is still too noisy at
31 dB-Hz, or the PLL's PLI does not reach `fll_off_pli` within the return dwell for another reason; this run does not
separate the two. Development runs (14 of 20 at 31 dB-Hz) pointed the same way; nothing was tuned on them.

Pins: `tests/iq_fll_handover_seed.rs` (`the_committed_scored_run_gives_the_recorded_verdict` grades the committed
per-run results; the strict survey is ignored with these numbers).

## Row 5. `VM-35b27a4f`: BOC(1,1) DLL with the exact inverse of the discriminators

- **Readings:** `xval/d8a-boc-exact-inverse/README.md`, committed at 0ac3ebd36 before the engine change. Reading 2
  records how "replaces the linear scaling" is read: BOC tracking is itself opt-in, the exact inverse is an option of it
  used by the scored configuration, and the linear scaling stays the default (every existing output unchanged).
- **The change:** `BocTracking::exact_inverse` and `boc11_dll_inverse`, the closed-form inverse of each discriminator's
  response on the ideal `1 − 3|τ|` peak, inside and outside `|ε| = d/2`, clamped to the main peak (5dd16894d).
- **Run:** once, 2026-11-08, in release (`tests/iq_boc_exact_inverse.rs`), with the control
  (`tests/iq_boc_bump_jump.rs` and the `boc.rs` unit tests, unchanged and passing).

| bar | measured | verdict |
|---|---|---|
| Control (linear scaling) | B1 to B5 as recorded; the 11 recorded B4 unit-grid misses | reproduces |
| **B4**, unit test, registered grid unchanged | all 27 discriminator-grid points within 10 % of `ε`; worst relative error 4.6e-15 | **MET** |
| **B4**, sampled noise-free signal | slope 1.0055, 1.0106, 0.9947, 0.9998 at ε = −0.06, −0.03, +0.03, +0.06 (BPSK-scaled 3.62 to 3.83) | **MET** |
| B1 (option off), registered / fresh | mean late error ±0.548 / ±0.549 chip, no jumps | holds |
| B2 (exact inverse on), registered / fresh | one jump at 0.080 s towards the main peak in every run; RMS ≤ 0.0049 / 0.0024 chip | holds |
| B3, registered / fresh | no jumps; RMS ≤ 0.0038 / 0.0033 chip | holds |
| B5, registered / fresh | 0 false jumps at every C/N0; detection 1000/1000 towards the main peak | holds |

**Verdict: MET on re-run.** As reading 6 stated in advance, the unit-grid part is met by construction (the inverse of
the ideal response read on the ideal peak); it checks the algebra and the branch choice. The informative part is the
sampled signal, where the linear scaling's slopes were 0.938 to 0.994 and the inverse's are within 1.1 % of one, and
the loop regressions, which hold with the inverse in the DLL. MODELLED internal consistency; no external receiver is
compared.

Pins: `tests/iq_boc_exact_inverse.rs`.

## Row 6. `VM-c9318c63`: the lab fit with the C/N0 estimator lag corrected

- **Readings, batch plan and scoring rule:** `xval/d8a-labfit-lag/` (README, `score.py`), committed at ffbe3746c before
  any engine code. The change: `[campaign_fit] cn0_lag_s` (c69ea528f), each C/N0 bin modelled at the stated J/S 0.5 s
  earlier along the profile (half the 1 s M2M4 span). Scorer, censoring and closed form unchanged.
- **Runs:** 12 batches on 2026-11-08 (about 6.5 h on 4 cores), raw output committed as each landed, unread. Scored once
  with `score.py` after batch 12 (`score_output.json`).
- **Controls (disclosed):** before scoring, a script compared only the lag-0 lines with the recorded 0.40 values
  (reading 3) and printed match or mismatch: the bar-(a′) campaign (−3.935 dB, (d) 35.514 against 37.714 dB) and the
  (b′) campaigns 7000 and 7001 (−3.415 and −3.056 dB) all matched. No scored line was read before the scoring.

| bar | seen (A seed 2026 1012; b′ seeds 7000 to 7049) | fresh (+100 000) | verdict |
|---|---|---|---|
| (a′) `|δ̂_eff − δ_eff| ≤ 0.5 dB` | +0.5015 dB | +0.3986 dB | **NOT MET** (seen) |
| (b′) coverage in at least 45 of 50 | 0 of 50 | 0 of 50 | **NOT MET** |
| (c) PI90 coverage in [0.80, 0.98] | bins 0.886, time to loss 0.900 under each model | bins 0.893, time to loss **1.000** under each model | **NOT MET** (fresh) |
| (d) closed form within 1 dB of the direct median | 35.521 against 37.714 dB: 2.193 dB | 37.315 against 37.639 dB: 0.324 dB | **NOT MET** (seen) |

**Verdict: NOT MET on re-run.** The `Q` clauses stay NOT MET (not identifiable) and S2 was not re-run (reading 7).

What the numbers say, described after the scoring (not graded):

- The correction **overshoots**. On the (b′) campaigns the `δ_eff` error goes from about −1.19 dB (0.40) to
  **+0.451 ± 0.076 dB** (seen) and **+0.465 ± 0.102 dB** (fresh), and every one of the 100 intervals (median width
  0.29 dB) lies above its truth. On the bar-(a′) campaign it goes from −1.097 to +0.502 dB. A 0.5 s shift at about
  3.2 dB/s moves each bin by about 1.6 dB of J/S; the 0.40 bias corresponds to about 1.1 dB. So the hypothesis that the
  estimator lag drives the ramp bias is supported in sign and size, but the effective lag is shorter than the window's
  centre (about 0.35 s by this crude scaling), which a lag in the C/N0 domain (dB, not J/S, and with the M2M4 moments
  averaged before the logarithm) would explain. Choosing the lag from these results would be a new pre-registration;
  nothing was tuned.
- (c) on the fresh campaign: the time-to-loss intervals cover all 10 interpolation events (bar at most 0.98); with 10
  events the bar's upper edge is crossed by a single event.
- (d) is unchanged on the seen campaign (2.19 dB, the drop dwell under a ramp, as diagnosed in 0.40) and met on the
  fresh one (0.32 dB); the lag correction does not touch the closed form, so this split is a property of the campaigns.

Pins: `xval/d8a-labfit-lag/raw/` (committed batches), `score_output.json`, and
`tests/iq_labfit_campaign.rs::d8a_row6_scoring_of_the_committed_batches_is_the_recorded_one`.

## Row 6 v2. The lab fit with the C/N0 estimator's own response

- **Pre-registration:** `PREREGISTRATION-v2.md`, signed 9 November 2026. **Readings, batch plan, oracle and scoring
  rule:** `xval/d8a-labfit-response/` (README readings 1 to 7, `oracle.py`, `score.py`), committed before any engine
  code. The change: `[campaign_fit] cn0_model = "estimator-response"`. Each bin's modelled C/N0 is the M2M4 transform of
  the expected moments averaged over the estimator's 50 windows of 20 ms along the stated profile, applied wherever v1's
  lag applied. Scorer, censoring, lock models and the closed form are unchanged.
- **Checks before scoring (both passed, no scored line read):**
  - Control (reading 4), compared by script on the `cn0_model`-unset line of batch 01 alone: −3.935 dB and (d) 35.514
    against 37.714 dB, both lock models, as recorded.
  - Oracle (reading 6): 647 bins of the bar-(a′) campaign, worst difference 3.0e-13 dB (bar 1e-6 dB).
- **Runs:** 18 batches, raw output committed unread as each landed. Scored once with `score.py` after all 18
  (`score_v2.json`, 2026-11-11).

| bar | v1-registered (A 2026 1012; b′ 7000-7049) | v1-fresh (+100 000) | v2-fresh (+200 000) | verdict |
|---|---|---|---|---|
| (a′) `|δ̂_eff − δ_eff| ≤ 0.5 dB` | +0.165 dB | +0.098 dB | +0.099 dB | met on all three |
| (b′) coverage in at least 45 of 50 | 36 of 50 | 32 of 50 | 27 of 50 | **NOT MET** |
| (c) PI90 coverage in [0.80, 0.98] | bins 0.898, time to loss 0.900 | bins 0.901, time to loss **1.000** | bins 0.885, time to loss 0.889 | **NOT MET** (v1-fresh) |
| (d) closed form within 1 dB of the direct median | 35.519 against 37.714 dB: **2.195 dB** | 37.315 against 37.639 dB: 0.324 dB | 36.918 against 37.111 dB: 0.193 dB | **NOT MET** (v1-registered) |

**Verdict: NOT MET on v2.** A MET needed all four bars on all three sets. v1's NOT MET and the 0.40 record stand.

Execution amendments, all made before scoring and none touching a fit, seed, recipe, bar or the scorer:

- **Parallel and restarted runs.** Batch 01 ran alone (2.6 h). From batch 02 the batches ran 4 at a time on this
  container. The container restarted three times (about 20:43Z, 00:47Z and 02:15Z, 9-10 November); each time the
  batches in flight had written nothing and were rerun whole from their seeds, as the batch plan provides.
- **Per-seed checkpoints** (`bd0845acd`). A (b′) seed takes about 1.6 h under the estimator-response fit, against about
  2 min in v1, and the restarts came about as often as whole batches would have needed. From 10 November each (b′)
  seed's two lines were kept once its fit was done, and the batch file was assembled in seed order.
- **Helper sessions.** Batches 08-18 ran in three other cloud sessions at `bd0845acd`. Each pushed only its batch's
  two files, unread, and they were merged after a check of file list, identity and SHA-256. Batches 01-07 ran on
  this container.
- **Determinism check** (`4a9668c93`, `KSHANA_D8A_ROW6_V2_SEEDS`). Batch 17, first produced in a helper session, was
  rerun on this container as four seed-subset processes into one checkpoint folder and assembled. A whole-batch single
  process would have taken about 16 h against about 5 h. `batch-17.jsonl` and `truth-17.jsonl` came out
  byte-identical to the helper's (SHA-256 `046b7a14…` and `080529c7…`). That covers the cross-machine,
  parallel, checkpointed and cross-process paths at once. A test pins that the runner is unchanged with the variables
  unset.

What the numbers say, described after the scoring (not graded):

- **The estimator-response model removes most of the ramp bias.** On the (b′) campaigns the `δ_eff` error is
  +0.083 ± 0.067 dB (v1-registered), +0.087 ± 0.076 dB (v1-fresh) and +0.099 ± 0.077 dB (v2-fresh). v1's lag gave
  about +0.45 dB and the 0.40 fit about −1.19 dB. (a′) is met on all three sets.
- **(b′) is missed on interval width against that residual.** The intervals have a median width of 0.22 to 0.24 dB.
  Of the misses, 14, 17 and 22 lie wholly above the truth and 0, 1 and 1 below. A residual bias of about +0.09 dB, plus a
  campaign-to-campaign spread comparable to the interval's half-width, is enough to keep coverage near 30 of 50. The
  data do not say whether the remaining bias belongs to the model or the intervals are too narrow; both would show this.
- **(c) and (d) repeat v1's split.** The v1-fresh time-to-loss intervals cover all 10 interpolation events, as in v1.
  (d) is 2.19 dB on the v1-registered campaign, the drop dwell under a ramp diagnosed in 0.40, which the C/N0 model does
  not touch. It is met on both fresh campaigns.

Pins: `xval/d8a-labfit-response/raw/` (the committed batches), `score_v2.json`, and
`tests/iq_labfit_campaign.rs::d8a_row6_v2_scoring_of_the_committed_batches_is_the_recorded_one`.

## Row 3. `VM-f5e2ce4e`: cell-averaging CFAR in IQ acquisition, with the reference set over the whole row

- **Readings, study and oracle:** `xval/d8a-cfar-reference/` (README readings 1 to 7, `dev_study.py` and its output,
  `oracle.py`), committed at 40046ebbb before the engine change. The development study is disclosed there: one candidate
  was tried, on PRNs 2 to 6 only; the registered PRN 1 was run under the registered detector only, to check the model
  (it reproduced the recorded 32 of 2495).
- **The change (one, to the reference-cell set):** `CfarReference::Row`, the reference cells every stride-th lag round
  the whole Doppler row outside the guard (`N` = 622 at 2.5 MS/s, guard 2, stride 4), `α` from the registered closed
  form at that `N`. Opt-in through `CfarConfig::with_reference`; the registered window stays the default.
- **Run:** once, 2026-11-08, in release (`tests/iq_acq_cfar_row.rs`). No bar, input or setting was changed after a
  result was seen.

| check | measured | verdict |
|---|---|---|
| Control (registered window) | C2 2052 and 2034, C3 2112 and 2097 of 210 000; C4 32 of 2495; C5 0 | reproduces the record |
| C1 (regression, closed form unchanged) | 18 of 18 cases within 3σ (`tests/iq_acq_cfar.rs`) | MET |
| C2, Gaussian noise, seen seeds 0 to 3 | M = 1: 1.010 %; M = 4: 0.969 % | MET (± 20 % of 1 %) |
| C2, fresh seeds 100 000 to 100 003 | M = 1: 0.980 %; M = 4: 1.033 % | MET |
| C3, 2-bit noise, seen seeds 100 to 103 | M = 1: 0.996 %; M = 4: 1.010 % | MET |
| C3, fresh seeds 100 100 to 100 103 | M = 1: 0.988 %; M = 4: 1.019 % | MET |
| C4, PRN 1, +1250 Hz, 300.25 chips (registered) | detected; peak +1000 Hz; 0.103 chip; **0 of 2495** off-peak above | MET |
| C4, PRN 7, −2500 Hz, 17.5 chips (fresh) | detected; −2500 Hz; 0.096 chip; **3 of 2495** (0.12 %) | MET |
| C4, PRN 13, −750 Hz, 511.0 chips (fresh) | detected; −500 Hz (half-way case); 0.091 chip; **4 of 2495** (0.16 %) | MET |
| C4, PRN 22, +500 Hz, 800.75 chips (fresh) | detected; +500 Hz; 0.054 chip; **0 of 2495** | MET |
| C4, PRN 31, +3000 Hz, 1000.25 chips (fresh) | detected; +3000 Hz; 0.165 chip; **0 of 2495** | MET |
| C5 | 0 decisions change with the input × 7 | MET |
| Oracle (`oracle.py`, run after the scored run) | the same counts (0, 3, 4, 0, 0), detections and peak bins on all five signals | agrees |

**Verdict: MET on re-run**, on the registered and the fresh inputs.

Disclosures:

- The development study chose the change on PRNs 2 to 6 before the run; the reading records that only one candidate was
  tried. The fresh signals and the registered signal were never run under the candidate before the scored run.
- For context, from the oracle after the run: under the registered window the four fresh signals have 62, 28, 43 and 59
  off-peak cells of 2495 above the threshold, all above 1 %. The 0.40 finding was not peculiar to PRN 1.
- The oracle's code-phase field uses a different lag sign convention from the engine's and is not comparable; it was not
  used. Its usage line was corrected after the run (it imports `dev_study.py`, so it cannot run under `python3 -I`).
- With the row set, a cell is compared with the whole row's floor, which in a real search includes any signal's peak
  (1/622 of its weight per reference cell). Detection on these signals is unaffected (every peak detected); weak-signal
  detection loss against the window set was not measured here.
- MODELLED internal consistency against the detector's own closed form and an independent numpy model; no receiver's
  acquisition is checked.

Pins: `tests/iq_acq_cfar_row.rs` (C2/C3 counts, C4 exceedance counts).
