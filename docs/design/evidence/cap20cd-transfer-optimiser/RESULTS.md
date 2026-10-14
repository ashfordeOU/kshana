# Results: the impulsive transfer optimiser on DE440 (CAP-20c) and the Earth-Mars C3 cross-check (CAP-20d)

Run once on 2026-10-14 against `PREREGISTRATION.md` (bf0439e8, committed alone before the
optimiser existed). Nothing in the pre-registration was changed after the run. Test:
`tests/transfer_optimiser_oracle.rs`.

## Oracle A (SPICE + pykep 3.0.1 + SciPy 1.18.1): MET on all four

| case | C3 (km²/s²) | arrival V∞ (km/s) | objective rel. diff | other rel. diff | date diffs (d) | NM iterations |
|---|---|---|---|---|---|---|
| Type I, min C3 | 10.534932 | 2.911224 | 8.7e-13 | 2.1e-7 | 2.0e-6 / 4.0e-6 | 112 |
| Type I, min V∞ | 11.294395 | 2.845150 | 1.5e-13 | 2.5e-7 | 8.0e-7 / 1.6e-6 | 118 |
| Type II, min C3 | 9.182140 | 2.716871 | 4.3e-15 | 5.5e-8 | 1.0e-6 / 9.5e-6 | 49 |
| Type II, min V∞ | 9.656931 | 2.563930 | 3.5e-16 | 1.9e-10 | 1.4e-8 / 7.9e-8 | 48 |

The bars were 1e-7 relative (objective), 0.01 day (dates) and 1e-4 relative (other quantity).
Per the decision rule, the row "Impulsive transfer optimiser on the DE440 ephemeris" is
VALIDATED.

## Reference B (NASA/TM-2010-216764 Table 2, 2026 opportunity; published, secondary)

| case | Kshana | published | difference | bar | dates (d) | outcome |
|---|---|---|---|---|---|---|
| B1 Type II min C3 | 9.1821 | 9.144 | +0.42 % | 2 % | +0.43 / +0.72 | MET |
| B2 Type I min C3 | 10.5349 | 11.11 | -5.18 % | 2 % | -1.38 / +2.54 | NOT MET |
| B3 Type II min V∞ | 2.5639 | 2.565 | -0.04 % | 2 % | +0.58 / +0.30 | MET |
| B4 dates | all within 2.6 d | | | 4 d | | MET |

B2 misses. The independent library oracle finds the same 10.535 km²/s² at the same dates, so
the gap is to the published MIDAS value, not between implementations. Kshana's Type I minimum is
lower than the handbook's, which a coarser search would not explain, since a 2-day grid can only
overestimate a minimum. Possible causes, not tested: MIDAS's Type I region or optimiser settings,
or its ephemeris (not stated). The miss is recorded and asserted in the test. Reference B does
not change the status.
