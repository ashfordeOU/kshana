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
