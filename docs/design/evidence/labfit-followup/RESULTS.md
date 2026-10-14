# Lab fit from IQ campaigns, follow-up: results (synthetic, 2026-10-14)

The bars are those of [`PREREGISTRATION.md`](PREREGISTRATION.md), committed alone in 1e532f84
before any code or run. The code (`tests/iq_labfit_followup.rs`) was committed and pushed in
0042c5c9 before the run. No bar, seed, recipe, estimator or fit setting changed after a result was
seen. Nothing in `docs/design/LABFIT-FROM-IQ.md` §13 changes: its bars and verdicts stand.

## Verdicts

| bar | hypothesis | measured | verdict |
|---|---|---|---|
| S1 | HA | `δ̂_eff` −2.0941 dB (95 % interval −2.271 to −1.882) against the truth −2.2790 dB: error **+0.185 dB**, uncensored span 34.0 dB (bar 0.5 dB, span at least 12 dB) | **MET** |
| S2, tracking-loop | HD | closed form 33.817 dB against the direct median 34.265 dB over 18 losses: 0.45 dB (bar 1 dB) | met |
| S2, empirical | HD | closed form 27.848 dB against 34.265 dB over 18 losses: 6.42 dB (bar 1 dB) | not met |
| **S2** (each lock model) | HD | the empirical model misses | **NOT MET** |
| R1, tracking-loop | HD | dwell-corrected closed form 35.565 dB (uncorrected 33.797, drop dwell 0.553 s) against the direct median 36.112 dB over 18 losses: 0.55 dB (bar 1 dB) | met |
| R1, empirical | HD | dwell-corrected closed form 35.363 dB (uncorrected 26.638, drop dwell 2.727 s) against 36.112 dB over 18 losses: 0.75 dB (bar 1 dB) | met |
| **R1** (each lock model) | HD | both within 1 dB | **MET** |

Each bar is pinned by a test that asserts the recorded verdict and values (within 0.05 dB):
`s1_delta_eff_on_the_stepped_campaign`, `s2_d_as_written_on_the_stepped_campaign` (it asserts the
miss) and `r1_dwell_corrected_d_on_the_fresh_ramp_campaign`. They run in release in the CI job
`labfit-iq-followup`. A second run of them in release, after the record was written and on the same
campaign folders, printed the same result lines character for character: the fits reproduce.

## Replications on campaign R (not bars)

| item | measured | §13.6 prediction |
|---|---|---|
| (a′) | `δ̂_eff` −3.3816 dB (95 % interval −3.613 to −3.174) against −2.1345 dB: error **−1.247 dB**, span 36.0 dB | about −1.1 dB |
| (d), tracking-loop | closed form 33.797 dB against the direct 36.112 dB: **2.32 dB** low | about 2.2 dB |
| (d), empirical | closed form 26.638 dB against 36.112 dB: **9.47 dB** low | about 2.2 dB |

Both replicate the §13.6 misses on a fresh draw. The empirical model's (d) miss on R is much
larger than on the bar-(a′) campaign, where both models gave the same 35.514 dB.

## Settled bias of the measured C/N0 on campaign S (reported, not a bar)

The median of measured (M2M4) minus imposed C/N0 over locked epochs at least 1.5 s after the start
of their step, by 3 dB-Hz band of the imposed C/N0:

| imposed C/N0 (dB-Hz) | epochs | median bias (dB) |
|---|---|---|
| 27 to 30 | 14 064 | −0.324 |
| 30 to 33 | 39 623 | −0.331 |
| 33 to 36 | 50 000 | −0.138 |
| 36 to 39 | 62 500 | −0.108 |
| 39 to 42 | 72 500 | −0.100 |
| 42 to 45 | 152 500 | −0.223 |
| 45 to 48 | 105 000 | −0.194 |

Once settled, the estimator reads 0.1 to 0.33 dB low at every level. Nothing like the 1 dB lag
error of the ramps shows up.

## What the outcomes mean (as registered)

- **S1 is met: HA is supported.** With each J/S level held, `δ_eff` is recovered within 0.19 dB.
  On the ramps the error is −1.10 dB (campaign A, §13.6) and −1.25 dB (campaign R). The ramp
  campaigns' `δ_eff` error is a test-design artefact, and a lab campaign should hold each J/S
  level.
- **S2 is not met, R1 is met: HD is not supported as registered.** The registration reads HD as
  supported only if both are met. For the tracking-loop model, both halves hold: (d) as written
  passes on the stepped campaign (0.45 dB), and on a ramp the dwell correction closes the gap from
  2.32 to 0.55 dB. The empirical model fails (d) as written even with the J/S held across the
  dwell (6.42 dB). A correction scaled by its 2.727 s fitted dwell brings its ramp figure within
  the bar. So the empirical model's gap is not only the dwell timing. Separating its drop threshold
  from its dwell is a candidate cause, but it is not tested here.

None of these changes a verdict of §13.

## Campaigns as run

- **S**, seed 2026_1014: `recipe(2026_1014, 6)` with the registered staircase. As stated in the
  test file's header before the run: levels `js0 + 3k` while below 45 dB, then 45 dB, each held
  4 s, then 45 dB for 1 s more, and 6 s after. The campaign keeps its per-update records (an output
  only). DIGEST `a9f0fa9222d77ee32b6ceab1779416da26a352415faeb9b70045b8836fe9e19c`. Built and
  tracked in 481 s; fitted (1000 replicates, both lock models, hold-outs) in 1134 s.
- **R**, seed 2026_1015: exactly `recipe(2026_1015, 6)`. DIGEST
  `984c910a2667e84ecf8f90922fa02fda1508f92c8bcaf7c2378c360d43b6be00`. Built and tracked in
  136 s; fitted in 1539 s.

Both ran in release on 4 cores, sharing them with other builds. Truth: S `δ` 0.7313 dB, R `δ`
0.8758 dB, `Q` = 2 (the true `δ_eff` is `δ` − 3.0103 dB).

**One fix after the run, to a report, not a bar.** In the first run, the settled-bias report could
not find the epoch files: the campaign names them by cell key, not by recording. The lookup now
goes through each cell's record, which names its recording, its epoch file and its satellites in
channel order. A check asserts that each channel's pre-onset C/N0 reads its own satellite's
baseline. The report was then run on the same campaign folder. The bars' code is unchanged.

## Reproduce

```
cargo test --release --test iq_labfit_followup -- --test-threads 1 --nocapture
```

`KSHANA_LABFIT_IQ_CAMPAIGN_S` and `KSHANA_LABFIT_IQ_CAMPAIGN_R` may name campaign folders already
built, to skip the tracking. `KSHANA_LABFIT_IQ_RESULTS` collects the result lines.
