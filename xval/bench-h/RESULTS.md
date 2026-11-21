# Results: kshana-bench task (h), UrbanNav Hong Kong (first run, 21 November 2026)

Scored once, after `PREREGISTRATION.md` was written, with
`kshana bench baseline --task h --split <test|dev> --data <dir> --out <dir>` on the files `scripts/fetch_urbannav.sh`
fetched and checked. The pre-registration and these results are in the same commit; the pre-registration was written
before the first score was computed, and nothing in it was changed afterwards. The result files are committed as
`bench/results/h-*.result.json` (citation ids in `bench/GOLDEN.json`); they hold the scores per trace and the SHA-256
of the truth and predictions files, and no position. The truth and predictions files themselves hold UrbanNav
positions and are not committed. `tests/bench_urban.rs` checks the committed files and, when `KSHANA_URBANNAV=<dir>`
is set, recomputes them and compares them metric for metric. Every number is MODELLED: it
describes these sequences against the publisher's reference trajectory, never a receiver or a product.

Splits (SHA-256 order of the sequence names): test = `deep-urban-1`, `medium-urban-1`; dev = `harsh-urban-1`,
`tunnel-1`.

| Split | Baseline | Epochs | `gsdc_score_m` | Pooled P50 (m) | Pooled P95 (m) |
|---|---|---|---|---|---|
| test | provided-nmea | 4652 | 31.9825 | 4.42 | 18.37 |
| test | kshana-spp | 4652 | 59.1150 | 16.70 | 80.03 |
| dev | provided-nmea | 5426 | 209.2892 | 6.95 | 125.00 |
| dev | kshana-spp | 5426 | 264.8843 | 27.94 | 319.93 |

Per trace (P50, P95 and their mean, m):

| Split | Baseline | Trace | Epochs | P50 | P95 | Score |
|---|---|---|---|---|---|---|
| test | provided-nmea | deep-urban-1/ublox-f9p | 1539 | 2.36 | 7.49 | 4.93 |
| test | provided-nmea | deep-urban-1/xiaomi-mi8 | 1539 | 9.05 | 19.98 | 14.52 |
| test | provided-nmea | medium-urban-1/ublox-f9p | 787 | 2.62 | 193.40 | 98.01 |
| test | provided-nmea | medium-urban-1/xiaomi-mi8 | 787 | 6.95 | 14.01 | 10.48 |
| test | kshana-spp | deep-urban-1/ublox-f9p | 1539 | 11.82 | 39.24 | 25.53 |
| test | kshana-spp | deep-urban-1/xiaomi-mi8 | 1539 | 25.27 | 93.26 | 59.27 |
| test | kshana-spp | medium-urban-1/ublox-f9p | 787 | 11.69 | 197.63 | 104.66 |
| test | kshana-spp | medium-urban-1/xiaomi-mi8 | 787 | 18.79 | 75.21 | 47.00 |
| dev | provided-nmea | harsh-urban-1/ublox-f9p | 2312 | 4.05 | 10.83 | 7.44 |
| dev | provided-nmea | harsh-urban-1/xiaomi-mi8 | 2312 | 10.19 | 36.74 | 23.47 |
| dev | provided-nmea | tunnel-1/ublox-f9p | 401 | 4.52 | 791.59 | 398.05 |
| dev | provided-nmea | tunnel-1/xiaomi-mi8 | 401 | 7.22 | 809.17 | 408.19 |
| dev | kshana-spp | harsh-urban-1/ublox-f9p | 2312 | 23.32 | 96.12 | 59.72 |
| dev | kshana-spp | harsh-urban-1/xiaomi-mi8 | 2312 | 32.34 | 155.58 | 93.96 |
| dev | kshana-spp | tunnel-1/ublox-f9p | 401 | 19.09 | 812.38 | 415.74 |
| dev | kshana-spp | tunnel-1/xiaomi-mi8 | 401 | 77.90 | 902.35 | 490.12 |

Solver coverage of `kshana-spp` (second pass, epochs solved of the receiver's epochs): deep-urban-1 F9P 1533 of 1534,
Mi 8 1320 of 1535; medium-urban-1 F9P 657 of 657, Mi 8 636 of 787; harsh-urban-1 F9P 3258 of 3348, Mi 8 2620 of 3350;
tunnel-1 F9P 237 of 245, Mi 8 192 of 230.

## Bars

- **H1: NOT MET.** `provided-nmea` on `medium-urban-1/ublox-f9p` scores 98.01 m against the bar of 50 m. The
  alignment the bar was meant to test is right (P50 2.62 m, and 4.93 m on `deep-urban-1/ublox-f9p`); the P95 of
  193 m comes from the F9P's own record, which covers 657 of the 787 truth epochs: the baselines take the nearest
  fix, so across the gap a stale fix is scored. This is the F9P malfunction the publisher's README notes (issue 11),
  which was known when the bar was set and should have been allowed for. The bar stays as written.

## Read with care

- The baselines fill a truth epoch with no fix of their own by the nearest fix in time. In `tunnel-1` that is a fix
  from outside the tunnel, which is why its P95 is about 800 m for both baselines; the score measures coverage as
  well as accuracy.
- `kshana-spp` is single-frequency code positioning with broadcast orbits and the Klobuchar model, epoch by epoch,
  with no outlier rejection, smoothing or NLOS handling, so in an urban canyon it is expected to be worse than the
  receivers' own filtered fixes. It is a floor for methods built on the RINEX, not a measure of the engine against
  a receiver.
- The truth is the publisher's SPAN-CPT reference (stated RMSE 5 cm in the README) and its own error is not removed;
  for `harsh-urban-1` the publisher's ground-truth file is the verified part only.
