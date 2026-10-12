# Addendum to the published-claims comparison: K5 with ephemeris-error growth (LRS-03)

Committed alone, before any addendum run. The recorded comparison (`PREREGISTRATION.md`, revision 2,
05bf9a19, and its recorded run) is not edited: this is a new, dated run beside it.

## Why

Claim C13 (K5) is "sub-metre maintained with 600 s correction latency". The recorded K5 run used
the frozen-error ageing model only (line-of-sight re-projection of an orbit error that does not grow).
0.36 adds an opt-in growth of the broadcast orbit error with age, `orbit_err_growth_m_per_s`
(LRS-03). No source states a lunar growth rate, so the addendum is a sensitivity run at
ILLUSTRATIVE rates, not a re-scoring under a sourced input.

## Cases (fixed now)

The registered LAT600 case (base inputs of `PREREGISTRATION.md` with `latency_s = 600.0`), unchanged,
plus `orbit_err_growth_m_per_s` set to each of:

| case | `orbit_err_growth_m_per_s` | label |
|---|---|---|
| LAT600-g0001 | 0.001 | ILLUSTRATIVE (0.6 m of growth over 600 s, 3-D RMS) |
| LAT600-g001 | 0.01 | ILLUSTRATIVE (6 m) |
| LAT600-g01 | 0.1 | ILLUSTRATIVE (60 m) |

## Bar (fixed now)

K5 unchanged: region corrected p95 3-D error at most 1.5 m, per case. Also reported, not scored:
the change from the recorded LAT600 figure (292.96 m).

## Expectation stated before the run

The recorded LAT600 figure is dominated by the four-satellite geometry, so growth at these rates is
expected to raise it, and K5 is expected to fail in every case. A pass would be reported as
prominently as a failure.
