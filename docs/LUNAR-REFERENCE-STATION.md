# Lunar reference station

> **MODELLED.** Under the stated assumptions (the constellation, its signal-in-space error, the
> station's survey accuracy, the correction latency and the link quantization, each an input
> labelled with its public source or as ILLUSTRATIVE), the model gives the figures below. They are
> **not** a statement about the performance of any real system. Kshana is **not** affiliated with
> or endorsed by any agency, and makes no TRL or heritage claim. Advisory only.

## Purpose

Public material describes a lunar south-pole reference station that monitors a lunar navigation
service, computes local differential corrections, keeps a lunar time reference on an atomic
clock, and carries a laser retroreflector and a VLBI transmitter for the lunar reference frame
(the class publicly described for ESA's NovaMoon concept; sources below). Kshana already models
each piece separately. This study composes them into one reproducible, open analysis of what
such a station could do under public assumptions, and pre-registers it so it can be scored
against published results and, eventually, flight results.

## Run it

```sh
kshana scenarios/lunar-station-coverage.toml     # about 6 s in a release build
```

or `run_toml` from Python, WebAssembly or the MCP server's `run_scenario` with
`kind = "lunar-station-coverage"`.

## Coverage and accuracy map (`lunar-station-coverage`)

For a differential reference station at a known south-polar site: at each user point on a ring grid
from 80° S to the pole and over the region, across a day of epochs and Monte Carlo trials, the
percentile corrected and uncorrected position error (3-D, horizontal, vertical), availability
with a reason for every unavailable epoch, coverage against a threshold stated before the run,
DO-229E protection levels, the coverage radius per azimuth sector, and the correction-link budget
at the station and at the worst point. No new physics: it sweeps the tested functions of
`lunar-differential-pnt` and reduces to that kind exactly at one point, one epoch and one trial.

### Inputs

| Input | Default | Source |
|---|---|---|
| Constellation (`n_sats`, `sma_km`, `eccentricity`, `inc_deg`, `argp_deg`) or `ephemeris_path` | the in-tree LCNS-class set | ILLUSTRATIVE in the bundled default; the public-sources example sets four satellites and the 24 h period from S2 and S4, the element set staying ILLUSTRATIVE (no source states it) |
| `mask_deg` | 5° | ILLUSTRATIVE |
| Station (`station_lat_deg`, `station_lon_deg`, `station_height_m`) | 89° S, 0°, 0 m | ILLUSTRATIVE |
| `survey_sigma_m` | 0.30 m | ILLUSTRATIVE (the in-tree frame-realisation allocation, itself MODELLED) |
| `orbit_err_m`, `clock_err_m`, or `sise_sigma_m` with `sise_orbit_variance_fraction` | 100 m, 30 m (line-of-sight SISE 65 m) | ILLUSTRATIVE in the bundled default; the public-sources example sets `sise_sigma_m` = 10 / 1.96 m from S4 p8 |
| `noise_m`, `latency_s`, `quantization_bits` | 0 m, 10 s, 8 bits | ILLUSTRATIVE |
| Grid (`grid_lat_max_deg`, `grid_lat_step_deg`) or `points` | 80° S, 1° (346 points) | the study region |
| Time (`t_start_s`, `t_span_s`, `t_step_s`), `n_trials` | 0 s, one day, 600 s, 200 | |
| `accuracy_threshold_m`, `percentile` | 20 m at p95 in the bundled default (1 m in the public-sources example) | stated before the run; 20 m is ILLUSTRATIVE, sized to the default's illustrative errors |
| `alert_limit_m` | 10 m | ILLUSTRATIVE: no public value exists |
| `residual_sigma_m`, `p_hmi`, `seed` | 5 m, 1e-4, 42 | |

### Outputs

Every numeric field carries a unit and a provenance class in the result's `units` block (checked
by `tests/field_units_global.rs`). The region block: `availability`, `coverage_fraction`,
`corrected_p_3d_m`, `corrected_p_h_m`, `corrected_p_v_m`, `uncorrected_p_3d_m`,
`improvement_factor`, `hpl_max_m`, `vpl_max_m`, `hpl_below_alert_fraction`, `worst_point`;
`coverage_radius_km` per 30° azimuth sector; `points[]` per point; and
`budget_at_station_and_at_edge`.

### What the checks can and cannot tell

* `tests/lunar_station_coverage_reference.rs`: the reduction to `lunar-differential-pnt`, the
  zero-baseline and survey floors, monotonicity, unavailable reasons, determinism, the work guard.
  These show the sweep is the model it claims to sweep.
* `tests/lunar_station_numpy_oracle.rs`: an independent numpy re-computation of the arithmetic on
  exported cases, pre-registered before it ran. Positions and percentiles met their bars; the
  station corrections missed theirs by double-precision rounding (recorded, with its numbers, in
  `tests/fixtures/lunar_station/PREREGISTRATION.md`).
* Neither checks the model. The error model, the first-order decorrelation, the survey, ageing and
  quantization models and every threshold are this project's own or ILLUSTRATIVE.

### Terrain horizon masks

MODELLED. An optional `[terrain]` section (`src/lunar_terrain.rs`) gives the station and every user
point its own azimuth-dependent horizon, in the 0.36 skyline table format (rows `[azimuth_deg,
elevation_deg]`, linear in azimuth with wrap at 360°). A satellite counts at a site when it clears
both `mask_deg` and the horizon at its azimuth; an epoch the horizon leaves with fewer than four
satellites at a point, where the flat mask gives four, is reported as `unavailable.terrain_masked`
(`user_lt4` keeps its flat meaning). Two sources, combined as their pointwise maximum when both are
given:

* a stated profile, `station_horizon` or `user_horizon` (applied at every user point), each with a
  required `source` label;
* a horizon ray-marched over a polar DEM (`dem_path`): great circles of the lunar sphere with exact
  curvature, from a stated mast height (default 2 m), every `azimuth_step_deg` (default 1°), out to
  `max_range_km` (default 150 km) or the grid edge. The repository vendors a crop of the
  public-domain LRO LOLA polar product `LDEM_75S_240M`, 5 × 5 block-mean resampled to 1200 m and
  about ±420 km from the pole (`data/lunar-dem/NOTICE.md`: source URL, SHA-256, licence, crop and
  resample steps).

The same masks apply to the `moonlight-service-volume` grid (`terrain`, `user_horizon` and
`dem_path`; a grid point outside the DEM keeps the flat mask and is counted). Without the section
every document is byte-identical to a run without it.

Checks: the ray march reproduces closed-form horizons (the bare-sphere dip, a crater in a plateau
from its centre and off it, a rasterised cone against the analytic cone); the vendored crop is
oriented as the source (Shackleton and Haworth floors low, the Malapert massif high). No published
polar horizon or illumination figure has been reproduced, so the row stays MODELLED (ledger row
"Lunar terrain horizon masks from a stated profile or a polar DEM").

`scenarios/lunar-station-coverage-terrain.toml` runs the bundled inputs on a 2° grid with 100 trials
and the DEM horizon at every site. The station site (89° S, 0° E) has a highest horizon of about
4.0°, below the 5° mask, so at the station the terrain does not bind; at the user points the
area-weighted mean of each point's highest horizon is 9.7° and the largest 26.3°. Against the same
inputs with the flat mask, the region's corrected p95 3-D error rises from 16.3 m to 18.6 m and the
largest HPL from 480 m to 62 km. Region availability rises from 91.9 % to 93.0 %: an epoch is
unavailable when a point uses a satellite the station does not see, and a horizon that hides that
satellite from the point can make the epoch available.

### Limitations

1. **Terrain and horizon masking: addressed in 0.36, with limits.** Per-site horizon masks from a
   stated profile or the vendored LOLA DEM crop are modelled (above). What remains: the vendored
   crop is 1200 m per pixel, so relief below about a kilometre is smoothed away and block means
   lower sharp peaks; a ray that leaves the crop (about 420 km from the pole) ends there; there is
   no diffraction, terrain multipath or partial obstruction; site positions for ranging stay on the
   mean sphere at the stated heights (the DEM sets the horizon only); the per-satellite export site
   of `moonlight-service-volume` is not masked; the horizon is not validated against an external
   figure.
2. Multipath and receiver hardware are not modelled.
3. The growth of the ephemeris error over the correction latency is modelled only as the
   line-of-sight re-projection of a frozen error.

## Comparison against published claims

MODELLED. A comparison of this model, run under the public assumptions, with the claims the sources
make. It is not a statement about the performance of any real system.

- Sources S1 to S5 (title, URL, retrieval date, SHA-256, licence): `tests/fixtures/lunar_station/SOURCES.md`.
- Every numeric claim, quoted with its page and stated assumptions and classified as comparable, partly
  comparable or not comparable: `tests/fixtures/lunar_station_published/CLAIMS.md`. No claim is fully
  comparable, because no source states a percentile or the satellites' orbit elements.
- Bars, cases and inputs, committed alone before the run (revision 2, 05bf9a19), and the recorded run:
  `tests/fixtures/lunar_station_published/PREREGISTRATION.md`. The finding is pinned in
  `tests/lunar_station_published_oracle.rs`.

| bar | claim (sources) | this model | bar | verdict |
|---|---|---|---|---|
| K1 | one station gives sub-metre accuracy over the whole south pole, 300 km circle (S1, S2, S3) | coverage 0.00 | >= 0.95 | fail |
| K2 | the same, 600 km circle (S2 p10, S3 p23) | coverage 0.00 | >= 0.95 | fail |
| K3 | sub-metre with code corrections (S1, S2) | corrected p95 3-D 280.6 m | <= 1.5 m | fail |
| K4 | "decimeter level" from pseudorange corrections (S3 p22, S5 p5) | 280.6 m | <= 0.15 m | fail (could not pass at the sources' 0.30 m code noise) |
| K5 | sub-metre kept at 600 s latency (S2 p16) | 293.0 m | <= 1.5 m | fail |
| K6 | the same accuracy from 10 km to 500 km baseline (S2 p17) | ratio 1.39 | <= 1.5 | pass |

1 of 6 bars passes. The cause is geometry. No source publishes the constellation's orbit elements. On
the ILLUSTRATIVE in-tree elements, a user and the station share four satellites above 5 deg in only 8 %
(300 km) and 6 % (600 km) of epochs, at near-singular geometry: the uncorrected p95 is 3.8 km, where
the sources quote < 10 m. The sources' own simulations used a filter, a height constraint and three
satellites in common view, which this snapshot model does not have. The run therefore does not
reproduce the claims on those elements, and it is not evidence that the claims are wrong. The K6 pass is
a ratio of two geometry-dominated figures and says nothing about decorrelation. A published set of the
constellation's elements would be scored under the same bars as a second, dated run.

## Pre-registered prediction

A pre-registered prediction, frozen at commit `c05dac1d` on the public-sources inputs, with its
scoring protocol: [`docs/predictions/lunar-reference-station.md`](predictions/lunar-reference-station.md).
It is a prediction, not a validation, and every figure in it is dominated by the unpublished
element set of the four-satellite constellation (the elements used are ILLUSTRATIVE): over the
80 deg S region, availability 8.2 %, corrected p95 3-D 280 m, uncorrected 3.8 km. MODELLED;
`tests/prediction_frozen.rs` fails if any frozen byte moves.

## Station time laboratory

Whether the station's miniRAFS, steered to LTC and then free-running or re-steered, stays within
1, 10 and 100 ns: the optional `[time_lab]` block of `lunar-time-budget`
(`scenarios/lunar-station-time-lab.toml`). The miniRAFS reaches 1 ns after 2.8 s, 10 ns after
377 s and 100 ns after 10.5 h; the source's nanosecond-level target is quoted, not adopted.
MODELLED. Model, outputs, the time-to-threshold table for four clock classes and the comparison
with the sources: [`docs/lunar-station/time-lab.md`](lunar-station/time-lab.md).

## Station geodesy

How much one retroreflector and one VLBI beacon at the station site tighten the lunar frame
datum beyond the five archived retroreflector arrays: the optional `extra_reflectors` and
`extra_beacons` inputs of `lunar-llr-datum` (`scenarios/lunar-station-geodesy-baseline.toml`
and `-with-station.toml`). Cramer-Rao bounds for a reduced parameter set on an ILLUSTRATIVE
schedule and site: the translation norm 1-sigma falls from 0.0185 m to 0.0102 m (ratio 0.551),
the scale from 0.00178 to 0.00063 ppm. MODELLED. Method, caveats (a south-polar site sees the
Earth low or not at all) and the full Helmert table:
[`docs/lunar-station/geodesy.md`](lunar-station/geodesy.md).

## Sources

Each source by title, identifier and publisher, with its retrieval date and licence. URLs,
SHA-256 hashes and notes on where the sources disagree are in the register,
[`tests/fixtures/lunar_station/SOURCES.md`](../tests/fixtures/lunar_station/SOURCES.md). No source
file is redistributed. Personal names are left out on purpose.

| id | title | identifier | publisher | retrieved | licence |
|---|---|---|---|---|---|
| S1 | white paper on a lunar reference station for positioning, timing and science, version 3 | arXiv:2602.08432v3 | arXiv (authors' white paper) | 2026-10-12 | arXiv non-exclusive licence to distribute 1.0 (grants arXiv only) |
| S2 | "Lunar local Differential PNT and Selenodetic Reference Station" (27 slides) | ioag.org/meetings/cislunar, section 6, item 07 | ICG-IOAG Workshop on Cislunar PNT, February 2025; slides by the European Space Agency | 2026-10-12 | none stated; marked releasable to the public from slide 3 |
| S3 | "Moonlight: LCNS, and Lunar Pathfinder" (28 slides) | unoosa.org, `LunarPNT_Jun24_01_04.pdf` | UNOOSA, ICG Joint Working Group Session on Lunar PNT, June 2024; slides by the European Space Agency | 2026-10-12 | none stated; marked releasable to the public |
| S4 | "Moonlight Programme Development Status" (16 slides) | ioag.org/meetings/cislunar2026 | 2nd ICG-IOAG Cislunar PNT Workshop, February 2026; slides by the European Space Agency and Telespazio | 2026-10-12 | none stated; marked releasable to the public |
| S5 | "Lunar Reference Time: ESA's Views" (9 slides) | ioag.org/meetings/cislunar2026 | Workshop on Cislunar PNT, February 2026; slides by the European Space Agency | 2026-10-12 | none stated; marked releasable to the public |
| S6 | LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0, and the in-tree `LUNAR_SIGMA_URE_M` | `tests/fixtures/lunar_afs_*`; `src/lunar.rs` | as recorded with `lunar_afs` | already in the tree | as recorded there |
