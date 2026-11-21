# Results 2: task (f) operating point frozen on dev (21 November 2026)

Scored once, after `PREREGISTRATION-2.md` was committed and pushed alone (commit `74239296`), with
`kshana bench baseline --task f --split <dev|test> --data dataset.csv --out <dir>` on the same `dataset.csv`
(Zenodo 10.5281/zenodo.15108715, SHA-256 `b524177d…8f02`). The four frozen files of `RESULTS.md` came out
byte-identical; the operating point adds four new files, `bench/results/f-<split>-<baseline>-dev-op.result.json`
(citation ids in `bench/GOLDEN.json`). Every number is MODELLED: it describes this dataset and its labels, never a
spacecraft or a product.

Threshold: the `k`-th largest `dev` score, `k = floor(0.2 * 1594) = 318`, no labels read; alarm when `score >=
threshold`. The `dev` rows are in-sample (the reference sets and the threshold both come from `dev`).

| Split | Baseline | Threshold | Precision | Recall | F1 | MCC | Accuracy |
|---|---|---|---|---|---|---|---|
| dev (in-sample) | feature-z-max | 11.8296 | 0.5786 | 0.5732 | 0.5759 | 0.4696 | 0.8300 |
| dev (in-sample) | diff2-var-z | 1.7770 | 0.5849 | 0.5794 | 0.5822 | 0.4774 | 0.8325 |
| test | feature-z-max | 11.8296 | 0.6250 | 0.6637 | 0.6438 | 0.5437 | 0.8431 |
| test | diff2-var-z | 1.7770 | 0.6212 | 0.7257 | 0.6694 | 0.5735 | 0.8469 |

## Bars

- **F4 (scorer): MET.** `xval/bench-f/oracle.py` gives thresholds 11.8295952018715 and 1.776968716146357 and test
  MCC 0.5436906521383005 and 0.5734523123222962, F1 0.6437768240343348 and 0.6693877551020408, precision, recall
  and accuracy all equal to the engine's to every printed digit.
- **F5: MET.** `feature-z-max` test MCC 0.5437 >= 0.30.
- **F6: MET.** `diff2-var-z` test MCC 0.5735 >= 0.20.

`tests/bench_governance.rs` pins F5 and F6 on the committed files and, with `KSHANA_OPSSAT_AD=<dataset.csv>`,
recomputes all eight task (f) files and compares them value for value.

## Context: the publisher's baselines (carried from the paper, not re-run)

B. Ruszczak, K. Kotowski, D. Evans, J. Nalepa, "The OPS-SAT benchmark for detecting anomalies in satellite
telemetry", Scientific Data 12 (2025), doi 10.1038/s41597-025-05035-3, CC BY 4.0, Table 3 (test set, universal
detector), selected rows: the best three, the best and the worst unsupervised model, and the row nearest each Kshana
baseline in MCC (ALAD for `diff2-var-z`, INNE for `feature-z-max`).

| Model (paper) | Training | AUC-PR | AUC-ROC | F1 | MCC | Accuracy |
|---|---|---|---|---|---|---|
| FCNN | supervised | 0.979 | 0.989 | 0.946 | 0.932 | 0.977 |
| XGBOD | supervised | 0.975 | 0.992 | 0.918 | 0.897 | 0.966 |
| RF+ICCS | supervised | 0.963 | 0.985 | 0.883 | 0.862 | 0.955 |
| MO-GAAL | unsupervised | 0.779 | 0.865 | 0.726 | 0.710 | 0.907 |
| ALAD | unsupervised | 0.629 | 0.744 | 0.596 | 0.570 | 0.870 |
| INNE | unsupervised | 0.643 | 0.806 | 0.646 | 0.549 | 0.847 |
| SOS | unsupervised | 0.308 | 0.524 | 0.264 | 0.081 | 0.705 |

The Kshana rows are scored by Kshana's code on the committed files; the paper's rows are other code under other
choices (the supervised models train on the `dev` labels, the paper's AUC-PR may be computed differently from the
step-wise average precision used here). The table places the transparent baselines among published numbers; it is
not a ranking and claims nothing about either.
