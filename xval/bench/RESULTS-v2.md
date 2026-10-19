# Results: kshana-bench 2.0.0 baselines

The pre-registration is `PREREGISTRATION-v2.md`, committed alone in e8bb485 before any v2 code or score. This is
the one v2 baseline run (2026-10-18), made after the code of the stratified split (20fda01). Version 1.0.0 was never
released; its pre-registration and results are `PREREGISTRATION.md` and `RESULTS-v1.md`, and the 1.0.0 result files
are in `bench/results-v1/`. v2 exists because the 1.0.0 split of task (a) left the holdout without a jamming epoch
(`RESULTS-v1.md`). All figures are MODELLED. The bars are pinned by `tests/bench_baselines.rs`.

## Bars

| bar | measured | verdict |
|---|---|---|
| V1 every split holds jamming and clean epochs and at least two jamming folders | dev 3 jamming folders, test 2, holdout 2; every split has both classes | MET (`v1_every_split_of_the_stratified_rule_holds_jamming_and_clean_epochs`, data-gated) |
| V2 task (c) and (d) metrics identical to 1.0.0 | 16 result files, all identical to 1e-12 | MET (`v2_task_c_and_d_metrics_are_identical_to_the_1_0_0_results`) |
| A1 pooled AUCs reproduce 0.778, 0.933, 0.678 within 0.0005 | reproduced | MET |
| A2 `agc_k_sigma` AUC >= 0.80 on test | **0.766** | **NOT MET** |
| S1 to S5, C1 to C3, D2 | as in `RESULTS-v1.md` (numbers unchanged) | MET |
| D1 some detector has gap > 0.05 on test at scale 0.5 | largest gap 0.0301 | **NOT MET** (unchanged from 1.0.0, still pinned) |

## Task (a) under the stratified split

| split | folders (jamming / other) | jamming / clean epochs | `cn0_drop_db` AUC | `agc_k_sigma` AUC | `jam_ind_threshold` AUC |
|---|---|---|---|---|---|
| dev | 3 / 3 | 2,943 / 1,988 | 0.952 | 0.981 | 0.909 |
| test | 2 / 2 | 3,679 / 850 | 0.864 | **0.766** | 0.556 |
| holdout | 2 / 2 | 2,938 / 664 | 0.565 | 1.000 (0.9996) | 0.610 |

**A2 is NOT MET and is not loosened.** Under 1.0.0 the single-folder test split gave 0.830; under the stratified
rule the two test jamming folders (a 10 W dynamic event and a low-power jamming plus spoofing event) give 0.766. The
miss is pinned by `a1_a2_receiver_log_baselines_on_jammertest_2024`, which fails if the value ever reaches 0.80.

What the table shows, and what it does not. The statistics rank very differently from split to split: the AGC
statistic separates the holdout almost perfectly (0.9996) and the test split poorly (0.766), and the C/N0 statistic
does the reverse (0.565 against 0.864). With two jamming folders per split, a split's score is the behaviour of a
handful of events, so the spread between splits is the finding, not the ordering of the detectors. The holdout of
task (a) is public: the numbers above are not unseen-data performance. The scheduled-slot truth makes every
detection probability a lower bound. Nothing here says how a detector performs outside this event and this receiver
type (u-blox ZED-F9P).

## Other tasks

Task (b) is carried from `docs/design/DETECTION-ROC.md` (R1 NOT MET, not re-run); tasks (c) and (d) are as in
`RESULTS-v1.md` (the files are re-issued under spec 2.0.0 with identical metrics). No release holdout of task (d) is
sealed (`bench/holdout/COMMITMENTS.json`).
