# Results: joint map estimation (terrain SLAM, RBPF) (WP-10, RM-18)

Run once against `PREREGISTRATION.md` (committed alone in c3168ae3, before the filter was
written). The design constants, seeds and bars are exactly the pre-registered ones.
Command: `cargo test --test terrain_slam_rbpf -- --nocapture`.

Before the run, the refactor of the sequential filter onto a shared core was checked: the
pre-refactor binary (4235687e) and this tree give byte-identical `result.json` and
`chart.svg` for `scenarios/terrain-slam.toml`.

## Per seed, erroneous map (15 m, L = 0.03 deg), matched RMS over 60 waypoints

| seed | baseline (known-map SITAN) | SLAM | SLAM better |
|---|---|---|---|
| 1 | 592.7 | 557.2 | yes |
| 2 | 1362.1 | 1367.9 | no |
| 3 | 1742.2 | 1651.2 | yes |
| 4 | 1739.9 | 1645.8 | yes |
| 5 | 844.9 | 859.6 | no |
| 6 | 1657.3 | 1517.6 | yes |
| 7 | 1601.4 | 1475.8 | yes |
| 8 | 1052.6 | 1133.3 | no |
| 9 | 873.5 | 853.5 | yes |
| 10 | 826.3 | 846.0 | no |
| 11 | 1851.6 | 1786.0 | yes |
| 12 | 1144.1 | 1278.4 | no |
| 13 | 1494.0 | 1427.6 | yes |
| 14 | 1145.3 | 1147.3 | no |
| 15 | 1154.8 | 1178.3 | no |
| 16 | 940.8 | 1053.3 | no |
| 17 | 1035.9 | 1041.4 | no |
| 18 | 1639.8 | 1627.4 | yes |
| 19 | 1399.8 | 1435.0 | no |
| 20 | 1008.5 | 849.9 | yes |

(metres)

## Bars

| bar | threshold | value | outcome |
|---|---|---|---|
| S1 mean SLAM <= 0.9 x mean baseline | 1129.8 m | 1236.6 m (ratio 0.985) | NOT MET |
| S2 SLAM better in >= 12 of 20 | 12 | 10 | NOT MET |
| S3 perfect map: mean SLAM <= 1.1 x mean baseline | 1265.4 m | 1151.9 m against 1150.4 m (ratio 1.001) | MET |

## Reading

On a single pass with no revisits, the FastSLAM-style map correction buys about 1.5 % on
the mean. That is no better than a coin flip per seed, well short of the 10 % pre-registered.
The prediction expected a small gain and put S1 as uncertain, but it called S2 likely, and S2
missed. The joint estimator does no harm on a perfect map (S3).

What limits it, as stated before the run: a cell sees only a handful of measurements, and a
locally constant map bias is partly interchangeable with a position offset. A track that
revisits terrain (loop closure) is the regime where joint map estimation should pay. That
would be a new pre-registration, not a re-run of this one.

All three outcomes are pinned in `tests/terrain_slam_rbpf.rs`. The two misses are asserted
as misses. Ledger status: Modelled.
