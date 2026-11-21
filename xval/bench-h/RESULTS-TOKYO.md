# Results: kshana-bench task (h), Tokyo edition (first run, 21 November 2026)

Scored after `PREREGISTRATION-TOKYO.md` was written (same commit; nothing in it was changed afterwards), with
`kshana bench baseline --task h --split <test|dev> --data <dir> --out <dir>` on the files
`scripts/fetch_urbannav_tokyo.sh` fetched and checked. `provided-nmea` was skipped (the publisher provides no receiver
NMEA for Tokyo). Result files: `bench/results/h-tokyo-{test,dev}-kshana-spp.result.json` (system name
`kshana-spp/tokyo`; citation ids in `bench/GOLDEN.json`), scores per trace and file hashes only, no position. Every
number is MODELLED: it describes these runs against the publisher's reference trajectory, never a receiver or a
product. Never pool these with the Hong Kong edition.

Splits (SHA-256 order of the sequence names): test = `tokyo-shinjuku`, dev = `tokyo-odaiba`.

| Split | Baseline | Epochs | `gsdc_score_m` | Pooled P50 (m) | Pooled P95 (m) |
|---|---|---|---|---|---|
| test | kshana-spp | 4190 | 26.5997 | 6.24 | 45.68 |
| dev | kshana-spp | 2482 | 11.7161 | 2.05 | 21.29 |

| Split | Trace | Epochs | P50 | P95 | Score |
|---|---|---|---|---|---|
| test | tokyo-shinjuku/trimble-netr9 | 2095 | 2.70 | 43.53 | 23.12 |
| test | tokyo-shinjuku/ublox-f9p | 2095 | 11.76 | 48.40 | 30.08 |
| dev | tokyo-odaiba/trimble-netr9 | 1241 | 1.31 | 14.95 | 8.13 |
| dev | tokyo-odaiba/ublox-f9p | 1241 | 4.60 | 26.00 | 15.30 |

Solver coverage (second pass, epochs solved of the receiver's epochs): Shinjuku NetR9 20227 of 20791, F9P 10476 of
10476; Odaiba NetR9 12257 of 12399, F9P 6206 of 6206.

## Bars

- **T1: MET.** Pooled P50 6.24 m (test) and 2.05 m (dev), both under 50 m.

## Read with care

- The same limits as the Hong Kong edition apply (`RESULTS.md`): nearest-fix filling, single-frequency code
  positioning with no outlier or NLOS handling, the reference's own error not removed.
- The Tokyo runs are not the Hong Kong sequences: different receivers, year, constellation state and streets. A
  lower number here says nothing about one city being easier in general.
