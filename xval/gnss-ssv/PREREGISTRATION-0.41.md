<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D5 (0.41): the space service volume rows S1 to S5 and S7, re-run plan

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are new; every other number is an existing bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md) or [`PREREGISTRATION-v2.md`](PREREGISTRATION-v2.md) and is not changed.

## Why this row

Run 1 against the ICG Space Service Volume booklet (UN OOSA ST/SPACE/75, first edition, 2018) is the run of record:
S0 and S6 MET; **S1, S2, S3, S4, S5 and S7 NOT MET** ([`RESULTS.md`](RESULTS.md)). The v2 campaigns
([`RESULTS-v2.md`](RESULTS-v2.md)) did not explain the misses: the only reading that moved S1 to S4 materially was
GLONASS's reference off-boresight angle, which the first edition prints two ways (tables B2/B6: 20 and 28 degrees;
table 4.2: 26 and 34 degrees), and the independent source used in v2 supported the angles run 1 used. Campaign D (a
held-out published reception campaign) did not run because no source was pinned.

Roadmap item D5 names two paths: the GLONASS reference angles, and a held-out reception campaign.

## What stays

- Run 1's verdicts against the first edition, and every v2 verdict. Nothing here re-scores them.
- The method, the ten interpretation choices and the tolerances: 2.0 percentage points for S1 to S3 (MOD within
  max(10 min, 25 %) where given), 3.0 for S4, 5.0 for S5, 3 dB RMS for S7.
- The verdict rule of v2: no row becomes VALIDATED from agreement with the booklet, which is itself a simulation.

## R1: S1 to S5 against a later edition of the booklet (original tolerances)

- **What changes:** the oracle edition. If UN OOSA has published a later edition of the booklet (checked on
  <https://www.unoosa.org> at sign-off: document number, URL and date), it is fetched by `fetch.sh` with its SHA-256
  pinned at sign-off.
- **Configuration:** the later edition's own annexes (constellation elements, reference angles, minimum powers, grid
  and epoch definitions) replace the first edition's wherever they differ; the ten interpretation choices are kept where
  the later edition is silent. The differences are listed in a table committed **before** the first run, and GLONASS's
  angles are taken from the one value the later edition prints. If it again prints two values, R1 runs both, reports both,
  and is MET only if both meet the bars (*proposed*: no choice between them after the run).
- **Bars:** S1 to S5 over the later edition's corresponding tables, with the original tolerances.
- **If** no later edition can be pinned at sign-off, or it does not republish the corresponding tables, R1 is "not run".
- **Disclosure:** the first-edition table 4.2 variant has already been run (it brought S1, S2 and S4 within tolerance in
  every cell). If the later edition's angles equal 26 and 34 degrees, the S1, S2 and S4 outcome against the first edition
  is known in advance; against the later edition's own tables it is not, which is why R1 compares with those tables.

## R2: held-out published reception cells (new question)

- **What it asks:** whether the simulation agrees with **measured** GNSS reception above the constellation, the only kind
  of comparison that could support a sub-claim of VALIDATED.
- **Source:** a public report of measured high-altitude GNSS reception (a flown mission's published tracking statistics
  above the GNSS shell, with its antenna pattern or gain and its acquisition threshold stated). It is pinned by URL and
  SHA-256 **at sign-off**; the cells to be compared (for example: share of time with at least one and at least four
  signals tracked, or mean number tracked) are listed in this file's sign-off commit before any simulation of that
  mission is run.
- **Configuration:** the mission's published orbit (or its public ephemeris), antenna and threshold, and the
  constellations in orbit at the time; no parameter is tuned.
- **Bar (*proposed*):** every listed availability cell within **10 percentage points**, and every listed mean-count cell
  within **25 %**. Basis: the loosest original tolerance (S6), because a flown receiver's tracking loop, antenna mounting
  and constellation state add errors the booklet's method does not have.
- **If** no source is pinned at sign-off, R2 is "not run" again.

## S7: no re-run

S7 (the parametric transmit pattern against measured GPS L1 panel patterns) and S7b stay NOT MET. A re-run would need a
different pattern model; driving the model from the measured patterns themselves would make S7 true by construction and
test nothing. No S7 re-run is registered in 0.41.

## What a result would and would not mean

- R1 MET: the implementation reproduces the later edition's published simulation under its own stated method. It would
  suggest the first-edition misses came from that edition's inconsistencies. It would not validate GNSS signals in space.
- R2 MET: the model agrees with one flown mission's measured reception within the stated tolerance, for the cells
  compared. Whether that supports VALIDATED for a sub-claim is the owner's decision, recorded in the commit that changes
  any ledger row.
- Any miss is published with its cells and pinned.

## Owner decisions at sign-off

1. Pin the later edition (or accept R1 "not run").
2. Pin the R2 source and list its cells (or accept R2 "not run"); confirm the R2 tolerances.
3. Confirm that S7 is not re-run.
