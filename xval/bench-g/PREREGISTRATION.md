# Pre-registration: kshana-bench task (g), smartphone positioning accuracy (GSDC 2023)

Written on 22 November 2026, after the task (g) code was merged (spec 2.2.0) and before any task (g) score was
computed on real data. Bars may be tightened later, never loosened; a miss is recorded as NOT MET.

## Data

Google Smartphone Decimeter Challenge 2023 (GSDC 2023), the competition's `train` folder, downloaded from Kaggle by
the maintainer under the competition's rules to a local disk. Nothing of it is redistributed or committed: no GSDC
row, position or truth file enters this repository. The rules state non-commercial use (CC BY-NC-SA 3.0 IGO);
result files (`kshana-bench-result/1`: metrics and the SHA-256 of the truth and predictions, no positions) are
published here only if the maintainer confirms the licence allows it, otherwise they stay private. Scored on the
maintainer's own machine with `scripts/score_gsdc_local.sh`, never in a hosted environment.

## What was seen before this was written (disclosed)

- The competition's public description of the layout (`train/<drive>/<phone>/ground_truth.csv`,
  `device_gnss.csv`) and the file count and total size of the local download (904 files, about 15 GB).
- NOT seen: any file's contents, any position error, any score.

## Task

As spec section 3, task (g): unit one epoch of one trace `<drive>/<phone>`; truth the trace's reference latitude and
longitude (its own error not removed); metric per trace the mean of the 50th and 95th percentile horizontal errors
(haversine, 6,371,000 m sphere), primary `gsdc_score_m` the mean over traces; splits by the section 4 rule over
traces, one stratum (`dev`, `test`).

## Baseline (fixed)

`provided-wls`: the weighted-least-squares fix each trace's `device_gnss.csv` already carries, at the nearest epoch.

## Bars

- **G1 (reader and alignment sanity):** both splits score every trace that has a `ground_truth.csv` and a
  `device_gnss.csv`, with no refusal, and `provided-wls` scores under 50 m on each split. A miss means a column,
  time or coordinate alignment fault in the reader, not that the phones are poor.
- **G2 (files):** every result file passes `kshana bench validate`, and `kshana bench cite` prints one citation id
  per result file.
- No accuracy bar is set: the first run is descriptive. Results (if published) go to `xval/bench-g/RESULTS.md`,
  labelled MODELLED, with the per-split scores as they come out.
