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

This page is a skeleton in 0.36 development; sections marked *pending* are filled by the
workstreams named.

## Run it

```sh
kshana scenarios/lunar-station-coverage.toml     # about 6 s in a release build
```

or `run_toml` from Python, WebAssembly or the MCP server's `run_scenario` with
`kind = "lunar-station-coverage"`.

## Coverage and accuracy map (`lunar-station-coverage`)

For a differential reference station at a known south-polar site: per user point on a ring grid
from 80° S to the pole and over the region, across a day of epochs and Monte Carlo trials, the
percentile corrected and uncorrected position error (3-D, horizontal, vertical), availability
with a reason for every unavailable epoch, coverage against a threshold stated before the run,
DO-229E protection levels, the coverage radius per azimuth sector, and the correction-link budget
at the station and at the worst point. No new physics: it sweeps the tested functions of
`lunar-differential-pnt` and reduces to that kind exactly at one point, one epoch and one trial.

### Inputs

| Input | Default | Source |
|---|---|---|
| Constellation (`n_sats`, `sma_km`, `eccentricity`, `inc_deg`, `argp_deg`) or `ephemeris_path` | the in-tree LCNS-class set | ILLUSTRATIVE (sourced values: *pending B*) |
| `mask_deg` | 5° | ILLUSTRATIVE |
| Station (`station_lat_deg`, `station_lon_deg`, `station_height_m`) | 89° S, 0°, 0 m | ILLUSTRATIVE |
| `survey_sigma_m` | 0.30 m | ILLUSTRATIVE (the in-tree frame-realisation allocation, itself MODELLED) |
| `orbit_err_m`, `clock_err_m`, or `sise_sigma_m` with `sise_orbit_variance_fraction` | 100 m, 30 m (line-of-sight SISE 65 m) | ILLUSTRATIVE (sourced values: *pending B*) |
| `noise_m`, `latency_s`, `quantization_bits` | 0 m, 10 s, 8 bits | ILLUSTRATIVE |
| Grid (`grid_lat_max_deg`, `grid_lat_step_deg`) or `points` | 80° S, 1° (346 points) | the study region |
| Time (`t_start_s`, `t_span_s`, `t_step_s`), `n_trials` | 0 s, one day, 600 s, 200 | |
| `accuracy_threshold_m`, `percentile` | 1 m at p95 | stated before the run |
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

### Limitations

1. **Terrain and horizon masking at the pole are not modelled** (a flat elevation mask is used).
   This is the first limitation and a 0.37 candidate.
2. Multipath and receiver hardware are not modelled.
3. The growth of the ephemeris error over the correction latency is modelled only as the
   line-of-sight re-projection of a frozen error.

## Comparison against published claims

*Pending B: the claims table, the pre-registration and the finding.*

## Pre-registered prediction

*Pending C: the frozen prediction and its scoring protocol (`docs/predictions/`).*

## Station time laboratory

*Pending D.*

## Station geodesy

*Pending E.*

## Sources

*Pending B: S1 to S6 by title, identifier and publisher, with the dates retrieved and licences.*
