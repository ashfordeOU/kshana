<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D12 (0.41), part 1: the transfer optimiser's reference B2, re-run plan

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Numbers marked *proposed* are new; every other number is a bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory and is not changed.

## Why this row

The impulsive transfer optimiser on DE440 (ledger row `VM-c80a768c`) is **VALIDATED** on its independent library oracle
(SPICE, pykep, SciPy). Its secondary published reference B, the 2026 Earth-to-Mars energy minima of the Mars mission
design handbook cited in `PREREGISTRATION.md`, has one miss ([`RESULTS.md`](RESULTS.md)): **B2**, Type I minimum C3,
10.5349 against 11.11 km^2/s^2 (-5.18 %, bar 2 %). The library oracle finds the same 10.535 at the same dates, so the gap
is to the published value. A coarser search cannot explain it, because a 2-day grid can only overestimate a minimum
found by a continuous search, and Kshana's value is lower. Reference B never set the row's status.

The transfer optimiser belongs to a maintained family (Mars and solar system, roadmap section 1c). Roadmap item D12
therefore allows one re-run or parking.

## What stays

B1 to B4 and their 2 % and 4-day bars. B2 stays NOT MET and pinned. The row stays VALIDATED on oracle A.

## Re-run (regression): B2 on the 0.41 code

The registered comparison is re-run unchanged on the 0.41 code. It is deterministic; the expected result is the
recorded 10.5349 (to 1e-7 relative). It guards against a change in the optimiser, not against the published value.

## One new question (EXPLORATORY, *proposed*): is the gap a search-region definition?

The handbook's Type I values come from a search over its own departure and arrival date ranges, with its own Type I /
Type II split. If the continuous optimum lies outside the handbook's date ranges, or on the other side of its type
boundary, the two numbers answer different questions.

- **Procedure:** restrict the search to the handbook's tabulated 2026 departure and arrival date ranges (read from its
  porkchop axes and written into the result before the run), with transfer angle strictly below 180 degrees for Type I,
  on a 2-day grid, and report the grid minimum.
- **Bar B2g (*proposed*):** the grid minimum is within **2 %** of 11.11 km^2/s^2.
- **Label: EXPLORATORY**, because it is framed after the B2 miss. B2g met would say the published number is consistent
  with a coarser, date-limited search; it would not turn B2 met, and it would not say which definition is right.

## Owner decisions at sign-off

1. Run B2g, or park the row (proposed: run it, as it costs one script).

## Sign-off (3 November 2026)

B2 is re-run as a regression. The exploratory B2g is parked and not run in 0.41.
