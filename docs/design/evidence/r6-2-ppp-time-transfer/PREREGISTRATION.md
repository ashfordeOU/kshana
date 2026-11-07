<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R6.2: PPP time transfer between time laboratories

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

Kshana's time-transfer rows are budgets and modelled links. R6.2 runs Kshana's precise point
positioning (PPP) on the observations of IGS stations at time laboratories and compares the station
clock differences it estimates with the receiver clocks of the IGS final clock product.

## Truth and licences (checked before this pre-registration)

- **IGS final clock product** (30 s, receiver and satellite clocks) and the IGS RINEX observation files
  of the stations below, from an IGS data centre without a login. IGS terms of use (2020): open use
  with citation and attribution. Assessable.
- **Not assessable:** the BIPM's link data and the laboratories' CGGTTS files (the BIPM states that the
  data remain the laboratories' property and need their permission for other use); *Circular T* values
  as an oracle for this item, until the BIPM confirms their terms. R6.1 is a separate item.

## Design (fixed now)

- **Stations:** PTBB, BRUX, OPMT, WAB2 and USN7, each where the IGS final clock product carries its
  receiver clock. A station absent from the product or the observation files is listed as not scored.
- **Pairs:** PTBB with each other station.
- **Period:** 1–14 June 2025, one 24 h batch per day.
- **Kshana:** ionosphere-free PPP with IGS final orbits and clocks, float ambiguities, the station
  coordinates estimated per day; the receiver clock per epoch. No IGS receiver clock enters the
  solution.
- **Comparison:** per pair and day, Kshana's clock difference minus the IGS one, at 300 s epochs, with
  one constant removed per pair-day (the daily datum).

## Bars (proposed)

- **B1** RMS of the comparison ≤ 0.30 ns on at least 90 % of pair-days.
- **B2** RMS ≤ 1.0 ns on every pair-day.
- **B3** No pair-day is dropped after its data is read; one that cannot be computed is listed with the
  reason.

VALIDATED only if B1 to B3 are met. Otherwise MODELLED, and the miss is published. The IGS receiver
clocks are themselves PPP-type estimates; agreement shows consistency with the IGS solution, not with
UTC(k). The Type A uncertainty of PPP links in *Circular T* is about 0.3 ns, which sets the scale of B1.
