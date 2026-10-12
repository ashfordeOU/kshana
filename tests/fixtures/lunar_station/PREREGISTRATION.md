# Lunar reference-station coverage: pre-registration of the numpy re-computation

Written and committed in its own commit BEFORE the first run of
`scripts/gen_lunar_station_ref.py`. These tolerances are not changed after the results are seen;
a disagreement is reported with its numbers, not tuned away. The commit that adds this file is
recorded in the ledger row "Lunar reference-station coverage and accuracy map".

## What is compared, against what

The inputs are the run's own draws, exported by `examples/gen_lunar_station_ref_inputs.rs` from
`tests/fixtures/lunar_station/oracle.toml` (five listed points from 84 deg S to the pole, 6 epochs,
8 trials, every error term on: survey 0.30 m, receiver noise 0.30 m, latency 10 s, 8-bit
quantization; seed 2026) into `tests/fixtures/lunar_station/cases.json`: 20 fixed cases (points
0 to 4, epochs 0 and 3, trials 0 and 5) and every point's corrected 3-D samples. The oracle is
`numpy` (2.x, `linalg.solve`, `percentile`), driven by `scripts/gen_lunar_station_ref.py`, which
uses no Kshana code and recomputes from the draws alone.

| # | Quantity (ours, `src/lunar_station.rs` over `src/lunar_dpnt.rs`) | numpy re-computation | Pre-registered tolerance |
|---|---|---|---|
| N1 | The satellites above the mask at the user, and the case status (`available`, `user_lt4`, `station_missing_sat`) | `unit(sat - observer) . unit(observer) >= sin(mask)` at the user and at the station | identical sets and status |
| N2 | The station's corrections for the satellites used (survey-biased) | `-orbit . unit(sat - station) + clock + (|sat - station| - |sat - believed station|)` | 1e-9 m per satellite |
| N3 | The user's raw and corrected range errors (noise and link error applied) | `-orbit . unit(sat - user) + clock`; `raw - correction`, `(+ a) - b`, `- link` | 1e-9 m per satellite |
| N4 | The corrected and uncorrected position-error vectors | least squares on rows `[-unit(sat - user), 1]`, `numpy.linalg.solve` on the normal equations, the clock discarded | 1e-6 m per component |
| N5 | Their 3-D, horizontal and vertical magnitudes | `norm`; vertical along `unit(user)`; horizontal `sqrt(e^2 - v^2)` | 1e-6 m |
| N6 | Each point's percentile (p95) of its corrected 3-D samples, as the run reported it | `numpy.percentile(samples, 95, method="linear")` on the exported samples | exactly equal (identical samples, identical interpolation) |

Ranges are compared at 1e-9 m and positions at 1e-6 m because the two solves differ (Gauss-Jordan
in Rust, LAPACK in numpy); with a few-metre to kilometre signal and a condition number in the
thousands, the position difference should sit near 1e-9 m, so 1e-6 m leaves margin without
hiding a wrong formula, which would show at the metre level.

## What this comparison does NOT establish

* It checks the arithmetic, not the model. The common-mode error model, the first-order
  decorrelation, the survey, ageing and quantization models and every threshold are this
  project's own or ILLUSTRATIVE. The row stays MODELLED.
* The draws are the run's own; numpy does not re-draw them (it cannot reproduce ChaCha8 without
  re-implementing it). That the draws have the stated distributions is checked by the survey
  floor test (`survey_floor_matches_the_survey_transfer_prediction`), not here.
* Nothing here is a statement about the performance of any real system.

## Oracle provenance

numpy from PyPI, version recorded by the script in `reference.json`; run in a fresh virtual
environment with nothing else installed.

## First comparison run

(To be filled after the first run, with the numbers, whatever they are.)
