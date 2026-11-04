<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R6.1: common-view time transfer from CGGTTS files

**Status: proposed, committed before any comparison is run.** The bars below are proposed. They become
binding when the owner signs them, and the comparison runs only after that. They may be tightened after a
run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified timing equipment.

## Why this row

Time laboratories compare their clocks through GNSS common view. Each laboratory publishes CGGTTS files
(BIPM, CGGTTS version 2E), and the BIPM publishes the official differences in *Circular T*. Kshana
reads many clock logs but not CGGTTS, and its time-transfer rows are modelled, not validated. R6.1 adds
the reader and a common-view estimate, and scores that estimate against Circular T.

## What is fixed now

### 1. Reader checks (no external data needed)
- **P1.** A data line is accepted only if its `CK` field equals the sum, modulo 256, of the byte values
  of every character before `CK`, including the separating space. This rule was checked on all
  25 388 data lines of one public file before this pre-registration. Lines that fail are counted and
  reported, never dropped silently.
- **P2.** Time of a track: `MJD` plus `STTIME` (UTC) plus half of `TRKL`. Values are in units of 0.1 ns.
  A field of all 9s is a missing value.

### 2. The comparison
- **Data.** BIPM `corrected_gps_data` files for January 2025 (`*2501.*`), as published on the BIPM
  server. The file list and SHA-256 hashes are recorded in `RESULTS.md` at download time. The files are
  fetched by script and not vendored.
- **Truth.** *Circular T* for January 2025, Section 1: `UTC − UTC(k)` at each standard date (0 h UTC),
  with its stated uncertainty `u(k)`.
- **Pairs.** PTB with every other laboratory that has a corrected GPS file for the month and appears in
  that issue of Circular T. Chosen by this rule before any data is read; no pair is dropped afterwards.
- **Estimate.** Per common track (same satellite, MJD and STTIME in both files), `REFSV(PTB) − REFSV(k)`.
  Per epoch, the median over common satellites. At each standard date, linear interpolation between the
  nearest epochs before and after, each within 1 h. With no such epoch the date is "not scored".
- **Truth difference.** `UTC(PTB) − UTC(k) = [UTC − UTC(k)] − [UTC − UTC(PTB)]`, with
  `u = sqrt(u(k)² + u(PTB)²)`.

### 3. Bars (proposed)
- **B1.** For a pair at a date: `|estimate − truth difference| ≤ 2u`.
- **B2.** At least 90 % of pairs meet B1 at every scored date.
- **B3.** P1 holds on every file: each line is accepted or reported, and the report matches an
  independent re-count by the oracle script.

The row becomes VALIDATED only if B1, B2 and B3 are all met. Otherwise it stays MODELLED, and the miss
is published.
