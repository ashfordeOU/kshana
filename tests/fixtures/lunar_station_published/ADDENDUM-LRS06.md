# Addendum to the published-claims comparison: the sources' solution style (LRS-06)

Committed alone, before any addendum run. The recorded comparison (`PREREGISTRATION.md`, revision 2,
05bf9a19, and its recorded run, 1 of 6 bars passing) is not edited: this is a new, dated run beside it.

## Why

The recorded run used the kind's snapshot solve: four satellites in common view, one epoch. The
sources' own simulations used a filter, a height constraint and "at least 3 satellites in common view"
(S2 p14). 0.36 adds those three as an opt-in `[solution]` mode (LRS-06). This addendum re-runs the
registered cases with them. No source states the filter's settings or the height accuracy, so those
values are ILLUSTRATIVE.

## Cases (fixed now)

The registered cases R300, R600 and LAT600, with their registered inputs unchanged, plus:

```toml
[solution]
height_aided = true        # S2 p14 (a height constraint); its accuracy below is ILLUSTRATIVE
height_sigma_m = 1.0       # ILLUSTRATIVE
min_satellites = 3         # S2 p14 ("at least 3 satellites in common view")
window_epochs = 6          # ILLUSTRATIVE (one hour at the registered 600 s step), standing in for the filter
```

Range rows are weighted with the kind's `residual_sigma_m` (default 5 m), unchanged.

## Bars (fixed now)

K1 to K6 exactly as registered in `PREREGISTRATION.md` (K1 and K3 to K4 on R300-sol, K2 and K6 on
R600-sol, K5 on LAT600-sol), with the same point-selection and not-evaluable rules.

## Expectation stated before the run

The recorded failures are dominated by the four-satellite geometry. A three-satellite minimum should
raise availability and coverage, and the window should lower the errors, but the expectation is that
K1 to K5 still fail (the corrected p95 sits hundreds of metres above the 1.5 m bar) and K6 is
uncertain. A pass is reported as prominently as a failure. The ledger status follows the original
rule: VALIDATED only if all six pass.

## Recorded run (2026-10-12)

Run by `tests/lunar_station_published_oracle.rs::solution_style_addendum_run` (ignored; release build,
about 250 s), after the commit above.

| case | availability | coverage fraction | corrected p95 3-D | corrected p95 horizontal |
|---|---|---|---|---|
| R300-sol | 0.958690 | 0.000000 | 2.1103 m | 0.8985 m |
| R600-sol | 0.892749 | 0.000000 | 2.1753 m | 1.0667 m |
| LAT600-sol | 0.958690 | 0.000000 | 2.1124 m | 0.9101 m |

K6 points (R600-sol): nearest 10 km is (-90.0, 0.0) at 15.87 km, p95 2.0776 m; nearest 500 km is
(-73.0, 209.14) at 500.02 km, p95 2.1564 m; ratio 1.038.

| bar | quantity | value | bar | verdict |
|---|---|---|---|---|
| K1 | R300-sol coverage | 0.00 | >= 0.95 | fail |
| K2 | R600-sol coverage | 0.00 | >= 0.95 | fail |
| K3 | R300-sol corrected p95 3-D | 2.11 m | <= 1.5 m | fail |
| K4 | the same | 2.11 m | <= 0.15 m | fail |
| K5 | LAT600-sol corrected p95 3-D | 2.11 m | <= 1.5 m | fail |
| K6 | ratio 500 km / 10 km | 1.04 | <= 1.5 | pass |

1 of 6 bars passes, as in the recorded run, and as expected before this run for K1 to K5. The solution
style changes the picture sharply, though: the region corrected p95 3-D error falls from 280.6 m
(recorded R300) to 2.11 m, and the horizontal p95 is 0.90 m, under the sources' "sub-metre" (horizontal
is not scored: the registered rule scores 3-D). Coverage stays 0 because no epoch's per-epoch p95 over
the trials reaches 1 m. Two cautions: the window treats the epochs' errors as independent, which
favours it; and the height accuracy (1 m) and window (6 epochs) are ILLUSTRATIVE. The ledger status
stays MODELLED (not all six pass).
