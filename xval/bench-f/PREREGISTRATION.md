# Pre-registration: kshana-bench task (f), spacecraft telemetry anomaly detection (OPS-SAT-AD)

Committed alone, before the task (f) scorer and baselines exist in the engine and before any task (f) score is
computed. Bars may be tightened later, never loosened; a miss is recorded as NOT MET and pinned by a test.

## Data

OPS-SAT-AD, Zenodo record 10.5281/zenodo.15108715 (KP Labs and ESA, from the OPS-SAT CubeSat housekeeping
telemetry). Record metadata licence: CC-BY-4.0; the `LICENSE` file in the record is the MIT licence. Only
`dataset.csv` is used (507,550 bytes, MD5 `5246fdc5e4630a4cecbf7fb6bc8b795e` as stated by Zenodo, SHA-256
`b524177da6f516d5c9f63c7acbc385341f0ad42046ef20c1bed2d25e51b98f02` as fetched on 20 November 2026). It is
fetched by `scripts/fetch_opssat_ad.sh` and never committed.

## What was seen before this was written (disclosed)

- The column names of `dataset.csv` and its first two rows.
- The counts of (train flag, anomaly label): train 1273 nominal and 321 anomalous; test 416 nominal and 113
  anomalous (2,123 segments). The segment counts per channel (nine channels, CADC0872 to CADC0894) and per
  sampling rate (1330 at 5, 793 at 1).
- NOT seen: any feature distribution, any score, any AUC.

## Task

- **Unit:** one telemetry segment, id `seg-<segment>`.
- **Splits:** the publisher's own split: `dev` = rows with `train = 1`, `test` = rows with `train = 0`. There is
  no holdout: the data are public, and `kshana bench` refuses `--split holdout` for task (f).
- **Truth:** the publisher's `anomaly` label (1 anomalous, 0 nominal). The labels were assigned by the dataset's
  authors; they are not re-derived here.
- **Submission:** `kshana-bench-predictions/1` with one `score` per segment (higher = more likely anomalous).
- **Metrics:** AUC (Mann-Whitney, ties half), average precision, the detection probability at the empirical
  threshold that keeps the false-alarm probability within 0.01 (an upper bound), and, when the submission
  declares a threshold, precision, recall, F1 and the Matthews correlation coefficient at it.

## Baselines (fixed)

The 18 numeric feature columns of `dataset.csv` (`duration` to `var_div_len`). Reference set: the `dev` segments
with `anomaly = 0` of the same channel (all `dev` nominal segments when the channel has fewer than 10).

1. `feature-z-max`: per feature, the robust z-score `(x - median) / (1.4826 * MAD)` over the reference set; a
   feature whose MAD is 0 is skipped; the score is the largest absolute z-score.
2. `diff2-var-z`: the absolute robust z-score of `log10(diff2_var + 1e-30)` over the reference set.

The dev-split results are in-sample (the reference set is part of dev) and are labelled so.

## Bars

- **F1 (scorer):** the engine's test-split AUC and average precision of both baselines equal those of
  `xval/bench-f/oracle.py` (an independent Python implementation of the baselines and the metrics) to 1e-9.
- **F2:** `feature-z-max` AUC >= 0.80 on `test`.
- **F3:** `diff2-var-z` AUC >= 0.70 on `test`.

## Not claimed

No bar says a baseline is good at finding anomalies on a spacecraft. The scores are MODELLED: they describe this
dataset and its labels, never a product. One run is made and recorded whatever it shows.
