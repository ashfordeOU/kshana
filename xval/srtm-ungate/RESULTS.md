# Results: un-gating the real-SRTM tests (WP-10, CAP-27d)

Run once against the bars in `PREREGISTRATION.md` (committed alone in 4235687e, before this
run). Nothing in the pre-registration, the points, the bands or the crops was changed after
the run. Crop sha256 values verified equal to the pre-registered ones before running.

Command: `cargo test --test terrain_nav_validation` (8 passed, 1 ignored: the live GDAL
re-run on full tiles).

## O1. Published survey heights (bilinear)

| point | Kshana | band | survey | outcome |
|---|---|---|---|---|
| Mount Whitney 36.5786 N, -118.2920 E | 4412.136 m | [4380, 4430] m | 4421 m | MET |
| Badwater Basin 36.250 N, -116.825 E | -78.000 m | [-95, -70] m | -86 m | MET |

## O2. GDAL 3.8.4 nearest node (zero tolerance)

| tile | lon | lat | GDAL | Kshana | outcome |
|---|---|---|---|---|---|
| N36W119 | -118.2923 | 36.5785 | 4414 | 4414 | MET |
| N36W119 | -118.2920 | 36.5786 | 4412 | 4412 | MET |
| N36W119 | -118.3137 | 36.5512 | 3752 | 3752 | MET |
| N36W119 | -118.2581 | 36.6043 | 3385 | 3385 | MET |
| N36W117 | -116.825 | 36.250 | -78 | -78 | MET |
| N36W117 | -116.8043 | 36.2317 | -85 | -85 | MET |
| N36W117 | -116.8461 | 36.2733 | -84 | -84 | MET |
| N36W117 | -116.7862 | 36.2871 | 102 | 102 | MET |

## Decision

All eight O2 equalities and both O1 bands hold. Per the decision rule, the un-gated tests
stay in CI and the ledger row 'SRTM digital-elevation reader on real terrain' cites them.
O3 (live GDAL on full tiles) was not run here: it stays `#[ignore]`.
