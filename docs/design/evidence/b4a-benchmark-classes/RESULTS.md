<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B4a (0.41): multi-class benchmark task (e): results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings 1 to 15 and the independent numpy
scorer were committed in `d87548349`, before any engine code, label or score. The engine code was committed in
`8deced16d`, before the run. B-log was then run once on the three splits, on 8 November 2026. The bars were not
loosened; E6 was tightened before the run (reading 7).

Reproduce:
1. Fetch the archive from Zenodo record 15911589 (SHA-256 `73e78934…065b313`) and extract it outside the repository.
2. Run `kshana bench baseline --task e --split <dev|test|holdout> --data <dir> --out <dir>`.
3. Check with `python3 -I xval/bench-e/oracle.py <truth> <predictions>`.

The run's truth, predictions and result files are in `xval/bench-e/run/`. They hold folder ids, classes and scores;
no dataset content is stored.

## Summary

| Bar | Result |
|---|---|
| E1 scorer exactness | **MET.** On the synthetic files (four classes, then meaconing removed), the confusion counts are equal to the numpy scorer's. Every BA, macro-F1, AUC, recall and precision is within 1e-12 (`tests/bench_e.rs`). On all six real-data results the two scorers also agree, with differences of 0. |
| E2 truth reproducibility | **Not yet MET.** The SHA-256 of each split's truth file is pinned (`xval/bench-e/truth.sha256`). E2 is met when the `Bench task (e) truth` workflow reproduces them on Linux, macOS and Windows. |
| E3 B-log jamming | **NOT MET (not scoreable).** The `test` split holds one jamming folder, below the two-folder minimum, so jamming does not enter (reading 8). Descriptive only: jamming one-vs-rest AUC 0.135, jamming recall 0.395. |
| E4 B-log interference type | **NOT MET.** All 2,222 spoofing epochs of `test` are labelled `jamming`, a share of 1.00 against the bar of ≤ 0.50. Meaconing did not enter; its 1,141 epochs are also all labelled `jamming`. |
| E5 B-iq spoofing | **NOT MET (not scored).** No TEXBAT file was fetched (reading 13). |
| E6 balanced accuracy | **NOT MET.** BA is 0.259 over the two entered classes (`nominal`, `spoofing`), against `max(0.40, 1.6/2)` = 0.80. It would also miss the original 0.40. |

**Whether the task ships (E1 and E2):** E1 is met; E2 waits on CI. **The baseline (E3 to E6):** all four bars are
missed. Section 5 says these misses are published as the baseline's score and do not block the task.

## The data

- **Evaluable folders:** 14 of 24, by the task (a) rule, the same 10 exclusions as `xval/jammertest-trust/RESULTS.md`.
- **Strata:**
  - jamming: 3 folders;
  - spoofing: 7 folders, 4 of them `Spoofing + Jamming`;
  - meaconing: 4 folders.
- **Splits.** As stated in advance (reading 4), each split holds 1 jamming folder, so jamming enters no split.

| Split | Folders (jamming / spoofing / meaconing) | Units | nominal | jamming | spoofing | meaconing | Windows |
|---|---|---|---|---|---|---|---|
| dev | 1 / 3 / 2 | 8,698 | 2,122 | 721 | 4,292 | 1,563 | 8 |
| test | 1 / 2 / 1 | 6,677 | 716 | 2,598 | 2,222 | 1,141 | 4 |
| holdout | 1 / 2 / 1 | 5,855 | 664 | 1,827 | 2,463 | 901 | 5 |

- **Mixed folders.** The 4 `Spoofing + Jamming` folders give 4,414 epochs labelled `spoofing`
  (`mixed_spoofing_jamming`): 1,081 in dev, 2,222 in test and 1,111 in holdout. Every spoofing epoch of `test`
  comes from these mixed folders.
- **Meaconing:** 5 windows in the evaluable folders (7 in the whole dataset), fewer than 20, so it is descriptive
  everywhere.

## B-log on `test` (the bar split)

Confusion matrix (rows are the true class, columns the label; order nominal, jamming, spoofing, meaconing):

| true \ label | nominal | jamming | spoofing | meaconing |
|---|---|---|---|---|
| nominal | 371 | 26 | 319 | 0 |
| jamming | 1,573 | 1,025 | 0 | 0 |
| spoofing | 0 | 2,222 | 0 | 0 |
| meaconing | 0 | 1,141 | 0 | 0 |

**Recall:**
- nominal 0.518;
- jamming 0.395;
- spoofing 0.000;
- meaconing 0.000.

**One-vs-rest AUC:**
- nominal 0.516;
- jamming 0.135;
- spoofing 0.926;
- meaconing 0.500 (undefined score throughout).

**Event level (4 windows):**
- the jamming window's majority label is `nominal`;
- both spoofing windows' majority label is `jamming`;
- the meaconing window's majority label is `jamming`.

## What the numbers say

- **Why everything becomes jamming.** In `test` and `dev`, every spoofing and meaconing epoch has a
  measurement-domain statistic above its threshold (in `test`, 2,222 of 2,222 and 1,141 of 1,141). In `holdout`, all
  meaconing epochs do, and 2,354 of the 2,463 spoofing epochs. The mapping sends any fix-domain
  alarm that comes with an AGC alarm to `jamming`. These transmissions were received at high power, so the AGC
  alarmed on them as it does on jamming. The pre-registration expected a power-based baseline to confuse them; E4
  measures how much: completely.
- **Spoofing AUC 0.926.** The position-offset statistic does rank spoofing epochs above the rest on `test`. A
  different mapping could use that; this one, fixed in advance, does not. That is a lead for a better method. It
  is not a result of this baseline, and no mapping was tried after the run.
- **Jamming AUC 0.135.** This is below 0.5 because spoofing and meaconing are negatives of the jamming one-vs-rest
  test, and they drive the power statistics harder than the one dynamic jamming folder of `test` does.
- **No meaconing label.** B-log never predicts `meaconing`. The clock monitor cannot run without a navigation
  message, as stated in advance (reading 9).
- **Nominal epochs labelled spoofing.** On `test`, 319 nominal epochs are labelled `spoofing`. They come from
  PositionJump in one stationary mixed folder, whose reported fix was more than 50 m from the calibration mean outside
  the scheduled windows. Whether that is a spoofer running outside its logged slot or the receiver holding a forced
  position afterwards was not examined.

## Other splits and the variant (descriptive, no bar)

| Run | Entered | BA (entered) | BA (all present) | macro-F1 (entered) | spoofing + meaconing labelled jamming |
|---|---|---|---|---|---|
| B-log, dev | nominal, spoofing | 0.479 | 0.435 | 0.472 | 1.000 |
| B-log, holdout | nominal, spoofing | 0.500 | 0.478 | 0.416 | 0.968 |
| B-log with PositionJump everywhere, test | nominal, spoofing | 0.132 | 0.164 | 0.209 | 1.000 |
| B-log with PositionJump everywhere, dev | nominal, spoofing | 0.166 | 0.279 | 0.236 | 1.000 |
| B-log with PositionJump everywhere, holdout | nominal, spoofing | 0.383 | 0.419 | 0.456 | 0.966 |

Running PositionJump on moving folders turns nominal epochs into `spoofing` labels. It lowers BA in every split,
which is why the primary run keeps it to stationary folders (reading 9).

## Found and fixed after the run (no score changed)

- **The `spec_version` field.** The first result files carried 2.0.0, the version of tasks a to d. Task (e) is 2.1.0.
  - The result writer now uses 2.1.0 for task (e), and `validate` now accepts task `e`.
  - The six result files were re-scored from the same predictions; their metrics are byte-identical.
- **The leaderboard page** (`bench/site`) still renders tasks a to d only. Task (e) results stay in
  `xval/bench-e/run/` until the page has a task (e) table.

## What this does not show

- It does not show anything about a low-power spoofer, a meaconer of another kind, another receiver or another
  site.
- Sample sizes are small: one to three folders per class per split. A score here is the behaviour of a few events.
- Truth is scheduled one-minute slots, so labels near a slot edge may be wrong.
- B-log is a mapping of monitors that were built to say whether something is wrong, not which kind of interference
  it is. These numbers set the bar a classifier has to beat; they are not a rating of the monitors.
