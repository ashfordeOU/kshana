# Results: kshana-bench task (f), OPS-SAT-AD (first run, 20 November 2026)

Scored once, after `PREREGISTRATION.md` was committed alone (commit "bench: pre-register task (f) ..."), with
`kshana bench baseline --task f --split <dev|test> --data dataset.csv --out <dir>` on the `dataset.csv` of Zenodo record
10.5281/zenodo.15108715 (SHA-256 `b524177d…8f02`, fetched by `scripts/fetch_opssat_ad.sh`). Result files:
`bench/results/f-*.result.json` (citation ids in `bench/GOLDEN.json`). Every number is MODELLED: it describes this
dataset and its labels, never a spacecraft or a product.

| Split | Baseline | Anomalous / nominal | AUC | Average precision | P_d at P_fa <= 0.01 (upper bound) |
|---|---|---|---|---|---|
| dev (in-sample) | feature-z-max | 321 / 1273 | 0.8021 | 0.5959 | 0.2181 |
| dev (in-sample) | diff2-var-z | 321 / 1273 | 0.8032 | 0.6336 | 0.1713 |
| test | feature-z-max | 113 / 416 | 0.8579 | 0.6476 | 0.2124 |
| test | diff2-var-z | 113 / 416 | 0.8517 | 0.7464 | 0.2301 |

## Bars

- **F1 (scorer): MET.** `xval/bench-f/oracle.py` (standard-library Python, written before the run) gives test AUC
  0.8578858917631041 and 0.8517273655547992 and average precision 0.6475702784684245 and 0.7464079637662195, equal to
  the engine's to every printed digit (difference below 1e-15).
- **F2: MET.** `feature-z-max` test AUC 0.8579 >= 0.80.
- **F3: MET.** `diff2-var-z` test AUC 0.8517 >= 0.70.

`tests/bench_governance.rs` pins F2 and F3 on the committed files and, with `KSHANA_OPSSAT_AD=<dataset.csv>`, recomputes
all four files and compares them value for value.

## Disclosed after the run

The repository already held `tests/opssat_ad_reference.rs`, which reports an AUC of about 0.851 for a single-feature
peak-count detector on the test split of the earlier record 10.5281/zenodo.12588359 (vendored as
`tests/fixtures/opssat/dataset.csv`). It was not read before the bars above were written. The two records differ (for
example in `gaps_squared`), so the numbers are not comparable one to one.

## Not claimed

The baselines are transparent reference points, not detectors anyone should fly. The publisher's paper reports
supervised models trained on the same split; nothing here reproduces or ranks against them.
