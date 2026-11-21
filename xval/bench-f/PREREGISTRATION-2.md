# Pre-registration amendment 2: task (f) operating point frozen on dev (B3403)

Committed alone, before the code below exists in the engine and before any threshold metric of the task (f)
baselines is computed. It adds to `PREREGISTRATION.md` and changes nothing in it: data, unit, splits, truth,
baselines and bars F1 to F3 stay as they are. Bars may be tightened later, never loosened; a miss is recorded as
NOT MET and pinned by a test.

## What was seen before this was written (disclosed)

- Everything in `RESULTS.md` (AUC, average precision and the P_fa <= 0.01 upper bound of both baselines on dev
  and test).
- The test-set table of B. Ruszczak, K. Kotowski, D. Evans, J. Nalepa, "The OPS-SAT benchmark for detecting
  anomalies in satellite telemetry", Scientific Data 12 (2025), doi 10.1038/s41597-025-05035-3 (CC BY 4.0),
  Table 3: AUC-PR, AUC-ROC, accuracy, F1, precision, recall and MCC of 30 models on the same `train = 0` split,
  with the PyOD models run at default parameters and contamination 0.2 "based on the anomaly proportion in the
  training set".
- NOT seen: any score quantile, threshold, precision, recall, F1 or MCC of either Kshana baseline.

## The operating point

The task already scores precision, recall, F1 and the Matthews correlation coefficient (MCC) at a declared
threshold. The baselines now declare one, frozen on `dev` without labels, by the paper's contamination rule:

- `k = floor(0.2 * n_dev)` with `n_dev` the number of `dev` segments (all of them, both labels; the labels are
  not read);
- the threshold is the `k`-th largest `dev` score of that baseline; an alarm is `score >= threshold`;
- the same threshold is declared on the `dev` and the `test` result files.

0.2 is the paper's contamination factor (Ruszczak et al. 2025); it equals the dev anomaly share to two decimals
(321 / 1594 = 0.201), which is how the paper chose it.

## Metrics added to the result files

`declared_threshold`, `precision_at_declared`, `recall_at_declared`, `f1_at_declared`, `mcc_at_declared` (already
defined by the scorer), plus `accuracy_at_declared`, the last of the paper's threshold metrics.

## Bars

- **F4 (scorer):** `xval/bench-f/oracle.py`, extended in the same commit as the engine code, gives the same
  threshold and the same test precision, recall, F1, MCC and accuracy of both baselines to 1e-9.
- **F5:** `feature-z-max` test MCC >= 0.30.
- **F6:** `diff2-var-z` test MCC >= 0.20.

## Context table (carried, not scored)

The paper's Table 3 values are reproduced in `RESULTS.md` next to the Kshana baselines, marked as carried from
the paper. They were obtained by other code under other choices (the supervised models train on `dev` labels);
nothing is re-run and nothing ranks the baselines against them.

## Not claimed

No bar says a baseline is good at finding anomalies on a spacecraft. Every number is MODELLED: it describes this
dataset and its labels, never a product. One run is made and recorded whatever it shows.
