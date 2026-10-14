# Terrain shadowing of the jammer in the jamming kind: results

Item CAP-06 (b), run 2026-10-14 against the bars of [`PREREGISTRATION.md`](PREREGISTRATION.md)
(committed at 92cd2bfd, before the code). No bar was changed.

| bar | verdict | numbers |
|---|---|---|
| B1 additivity | **MET** | see below |
| B2 independent recomputation | **MET** | all 10 placements: equal profile points and obstacle index; worst `ν` difference 1.6e-10, worst loss difference 1.4e-10 dB (bars 1e-9) |
| B3 monotone in jammer height | **MET** | 50 heights per placement (2 to 4902 m): the loss never rose |
| B4 the loss reaches J/S and nothing else | **MET** | every link's `js_db` lower by exactly the loss (1e-12 dB), and `cn0_nominal_dbhz` equal, at all 10 placements |
| B5 the reference function | **MET** | `J(ν)` at the six registered `ν` within 1e-12 dB of the oracle's evaluation |

## The placements

The receiver is at Badwater Basin (36.250°N 116.825°W), 2 m above the DEM; each jammer is also
2 m above it. `N = −31 m`, `k = 4/3`, profile step 30 m, at the GPS L1 carrier. The oracle is
`xval/jamming-terrain/oracle.py` (numpy 2.5.3) and its output is
`xval/jamming-terrain/expected.json`.

| # | jammer | path (m) | profile points | dominant obstacle (m from jammer, terrain m) | `ν` | loss (dB) |
|---|---|---|---|---|---|---|
| 1 | 36.450°N 116.870°W | 22 601 | 753 | 9 600, −42.0 | 1.175 | 15.00 |
| 2 | 36.220°N 116.727°W | 9 401 | 313 | 9 390, −78.3 | −4.197 | 0 |
| 3 | 36.170°N 116.990°W | 17 271 | 575 | 360, 1 171.3 | 14.752 | 36.25 |
| 4 | 36.100°N 116.800°W | 16 830 | 560 | 3 360, −76.1 | 0.260 | 8.28 |
| 5 | 36.300°N 116.900°W | 8 724 | 290 | 7 740, −81.0 | −0.982 | 0 |
| 6 | 36.200°N 116.550°W | 25 287 | 842 | 15 780, 1 656.5 | 55.097 | 47.73 |
| 7 | 36.400°N 116.400°W | 41 567 | 1 385 | 31 770, 1 615.2 | 57.537 | 48.11 |
| 8 | 36.050°N 116.500°W | 36 689 | 1 222 | 18 990, 1 786.6 | 47.534 | 46.44 |
| 9 | 36.600°N 116.600°W | 43 816 | 1 460 | 9 810, 1 612.4 | 40.017 | 44.95 |
| 10 | 36.300°N 116.300°W | 47 390 | 1 579 | 37 920, 1 539.2 | 54.673 | 47.66 |

What the placements show (findings, not bars):
- **F1.** The five placements across the Black Mountains or the Funeral Mountains (6 to 10) are
  shadowed by 44 to 48 dB. At 4902 m above the DEM, two of them (7 and 10) still lose 36 and
  38 dB, and the other three are clear.
- **F2.** Placement 3, in the Panamint Range west of the valley, is shadowed by its own
  foreground: the dominant obstacle is terrain 360 m from the jammer.
- **F3.** Two valley-floor placements (1 and 4) lose 15 and 8 dB with no hill between them. Over
  17 to 23 km of near-flat floor, at 2 m antenna heights, the Earth bulge (4 to 7.5 m at
  mid-path for `k = 4/3`) puts the ray at or below the ground. This is the single knife-edge
  model's grazing case: a flat-earth or two-ray model would give a different number, and none
  is checked here.
- **F4.** Placements 2 (Dante's View, above the receiver) and 5 have a clear path (`ν` < −0.78).

## B1

Every one of the 150 scenarios under `scenarios/` was run with the release binary of this change
and compared byte for byte with the runs recorded for CAP-06a. Those were the release binaries
of 08d83b4d (before the CRPA section) and 8ed3ec8e (with it), which agree byte for byte with
each other. The one commit in between, 48a75761, only turns an invalid `[crpa]` section into an
error. **All 150 results were byte-identical** to both. (`quantum-pnt-demonstrator.suite` is a
study suite, not a scenario, and fails under every binary.)

- The `jammer_terrain` units appear only with the section (`b1_terrain_units_only_with_the_section`).
- The jamming tests, `registry_golden` and `cross_platform_golden` pass unchanged.

## Deviation from the registered design (no bar affected)

The registration says `dem_hgt` is a path relative to the scenario file. `api::run_toml` takes
the scenario text with no file path, so the engine resolves `dem_hgt` against the working
directory instead. That is the convention of every other data path in a scenario (for example
the lunar `[terrain]` section's `dem_path`). The tests run from the package root.

## How to reproduce

```
python3 -I xval/jamming-terrain/oracle.py tests/fixtures/terrain/N36W117_sub6.hgt \
    scenarios/jamming-demo.toml xval/jamming-terrain/expected.json
cargo test --test jamming_terrain -- --nocapture
```
