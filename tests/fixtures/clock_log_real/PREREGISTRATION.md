<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: clock-log ingest on real public data, through to ADEV, TDEV and MTIE against allantools

Committed alone, before any fixture is cut, any wrapper log is written or any comparison is run. It fixes
the data, what is compared and the bars. A bar may be tightened after the run, never loosened. A miss is
recorded with its numbers, not tuned away. Companion to `tests/fixtures/clock_log/PREREGISTRATION.md`
(159334f2), whose three logs are synthetic; this one is on measured clocks.

## What is under test

`src/clock_log.rs` (`read_input`, `MeasuredPhaseReport`) as shipped at main bc04e98f: the RINEX clock,
TimeLab ASCII (phase and frequency) and TAPR TICC readers, and the Allan-family estimators behind the
clock kind's `measured` block. Nothing in `src/` changes before the first run of this comparison.

## Data (fixed now; sources and hashes)

Four measured series. Each source file is checked by SHA-256 before use.

| id | series | source and licence | SHA-256 of the file as fetched |
|---|---|---|---|
| D1 | Stable32 `PHASE.DAT`, 1001 phase readings in seconds, tau0 = 1 s | allantools commit ddc5bb5a (`tests/phasedat/PHASE.DAT`); distributed with Stable32; no redistribution grant, so fetched (`scripts/fetch_phasedat.sh`), not vendored | `ce9b432432850d9072ae106696528fa3377db7fe3686521171b429b6cb5afbaa` |
| D2 | a 5071A caesium clock against a hydrogen maser through a 53230A counter, February 2014, tau0 = 1 s; the FIRST 65 536 readings of the 556 990 | allantools (`5071A_phase.txt.gz`); LGPL-3.0 software, no data grant, so fetched (`scripts/fetch_cs5071a.sh`), not vendored | gz `aff036af22b8f9bea68bf5a0ad3fb6cd7bef31cbdf32cfbdf171b8b76b66d415`; text `4a6b4e8773ec7588642a3e37dd7eecbc2f4119b8df8a3e52fec858afd17daa33` |
| D3 | the clock of satellite G01, 2880 records at 30 s, 2026-08-02 | IGS final combined clock `IGS0OPSFIN_20262140000_01D_30S_CLK.CLK.gz` (GPS week 2430, BKG mirror), RINEX clock version 3.00 as published; IGS data policy (open, attribution); vendored as a cut with the header verbatim, as `tests/fixtures/sp3_clock_igs_oracle/` is | gz `4bbf2002719d136dfb710f429dee3c050e2c42cdb97370edd32ab7279970b48f`; text `93490a669466efd505218e1d25e8e571633bab99eb49e9e45fc2a381a265b998` |
| D4 | the clock of station ABMF, 288 records at 300 s, same file | as D3. The rule that picked both: the first clock in alphabetical order of its kind (`AS` with a `G` name and 2880 records; `AR` with 288 records) | as D3 |

D2's first 65 536 readings are fixed now (not chosen after seeing results). D3 and D4 are the first by the
rule above, not selected for their stability. No other satellite or station is looked at.

## Logs written from the data (fixed now)

A committed script, `scripts/gen_clock_log_real_ref.py`, written from `docs/CLOCK-LOG-FORMATS.md` and the
TAPR TICC Operation Manual (revision of 15 December 2025), not from the Rust code, writes these from D1
and D2 (phase `x[k]`, seconds, read back by the script as exact decimals):

1. `TL-P`: TimeLab ASCII phase, two columns `time value`, seconds, `%.17g`, with `tau0` and `units = s`
   header comments. From D1 and D2.
2. `TL-F`: TimeLab ASCII fractional frequency, one column `y[k] = (x[k+1] - x[k]) / tau0`, `%.17g`, with
   `data = frequency` and `tau0 = 1`. From D1 and D2 (1000 and 65 535 readings).
3. `TICC-0`: TICC timestamp mode, channel `chA`, lines `<t> chA` with `t[k] = k tau0 + x[k]` printed to 12
   decimal places, preceded by `#` configuration lines and the start-up menu text, plus a channel `chB`
   that must be ignored. From D1 and D2.
4. `TICC-3`: as `TICC-0` with 300 000 s added to every time stamp (3.5 days after power-up, inside the
   counter's 4.92 day wrap). From D1 and D2.
5. `TICC-11`: as `TICC-0` from D1, printed to 11 decimal places (the 15 December 2025 manual's default).
6. `RC`: the vendored cuts of D3 (`AS G01`) and D4 (`AR ABMF`), read with `clock = "G01"` and `clock = "ABMF"`.

The TICC logs are measured clock data re-encoded into the counter's text layout by our script: no real
TICC capture was found to use (the manual prints seven lines), and the reports say so.

## Oracle (fixed now)

1. For each log, an independent reader in the same script (exact decimal arithmetic, `fractions.Fraction`,
   for the time stamps) gives the reference phase series, `tau0` and gap counts. It is by the same author:
   it checks the Rust reader against the specification, not against a third party.
2. allantools 2024.6 (`pip install allantools==2024.6`): `oadev`, `tdev` and `mtie` with
   `data_type="phase"`, `rate = 1/tau0`, on the reference phase, at the averaging factors the engine
   reports (octaves of tau0 while the estimator fits); for `TL-F`, `oadev` with `data_type="freq"` on the
   frequency values read back from the file. No allantools code is copied.

## Bars (fixed now)

- B1 (normalised phase): for every log, the engine's `n_used`, `tau0_s`, gap counts and `tau0_source`
  class (`input`, `header` or `median-spacing`) equal the reference's, and every phase sample agrees with
  the reference within 1e-14 s, independent of the offset of the time stamps (this includes `TICC-3` and
  `TICC-11`).
- B2 (estimators): at every averaging factor the engine reports and allantools evaluates, ADEV, TDEV and
  MTIE agree with allantools within a relative 1e-10 for the phase logs and 1e-9 for `TL-F`. Non-vacuity: at
  least 8 averaging factors per case for D1, D2 and D3, at least 5 for D4.
- B3 (malformed input): each case in the table below returns an `Err` (no panic, no empty result) whose
  text contains every listed phrase.
- B4 (versions): a RINEX clock header version is accepted for 2.00 and 3.00 to 3.04 and refused otherwise.
  Version 4.00 is one of the refused: IGS publishes the clock format only up to 3.04, and RINEX 4.00 to
  4.02 define no clock file. The refusal names the version found and the versions read.
- B5 (no change elsewhere): a scenario without `[clock_log]` is byte-identical to before; every existing
  test passes unchanged.

### B3 cases

| id | input | phrases |
|---|---|---|
| E1 | `format = "bogus"` | `bogus`, `rinex-clk`, `timelab`, `ticc` |
| E2 | neither `path` nor `text` | `path`, `text` |
| E3 | a `path` that does not exist | the path |
| E4 | `tau0_s = 0` and `tau0_s = -1` and `tau0_s = nan` | `tau0` |
| E5 | `timelab`, empty text | `no readings` |
| E6 | `timelab`, a body line of words | the line number |
| E7 | `timelab`, `units = "furlong"` | `units`, `furlong` |
| E8 | `timelab`, single column, no `tau0` anywhere | `tau0` |
| E9 | `timelab`, a `nan` reading | `nan` or `finite`, the line number |
| E10 | `timelab`, two columns with a repeated time | `increas` |
| E11 | `timelab`, two columns, `data = frequency` | `frequency`, `single column` |
| E12 | `rinex-clk`, version 4.00 header | `4.00` |
| E13 | `rinex-clk`, version 3.05 header | `3.05` |
| E14 | `rinex-clk`, no `END OF HEADER` | `END OF HEADER` |
| E15 | `rinex-clk`, two clocks, no `clock` | `clock`, both names |
| E16 | `rinex-clk`, `clock = "ZZZZ"` not in the file | `ZZZZ` |
| E17 | `rinex-clk`, a record whose value field is not a number | `clock bias` or `value` |
| E18 | `rinex-clk`, a clock with one record | `at least` |
| E19 | `ticc`, no readings (menu text only) | `no readings` |
| E20 | `ticc`, two channels, no `channel` | `chA`, `chB`, `channel` |
| E21 | `ticc`, `channel = "chZ"` | `chZ` |
| E22 | `ticc`, a channel whose readings decrease (Period mode) | `Period` |
| E23 | `ticc`, interval-mode lines, no `tau0_s` | `tau0_s` |
| E24 | `ticc`, non-UTF-8 bytes (binary timestamp mode) | `binary` or `UTF-8` |

## Expected, stated before the run

- The author expects B1 to FAIL for `TICC-3` (and possibly `TICC-0` on D2) with the shipped reader: it reads
  each time stamp as a 64-bit float, whose spacing at 3.0e5 s is 5.8e-11 s, about the counter's own
  resolution. That miss is recorded with its numbers, the reader is then fixed in a separate commit
  (integer picoseconds, then seconds), and the comparison is re-run unchanged. It is not a reason to
  widen B1.
- The author expects `TICC-11` to be read (the shipped reader does not count decimals) and E22 to E24 to
  need work. Whatever fails is recorded as it fails.

## Verdict rule

The ledger row for the clock-log formats stays **MODELLED** whatever the result: the TICC logs are re-encoded,
the reference reader has the same author as the Rust reader, and allantools checks the estimators, which
are validated elsewhere. All of B1 to B5 met: the comparison is recorded as passing, on this data, and no
VALIDATED row is added. Any bar missed: recorded as a miss with the numbers, the defect fixed in a separate
commit with a re-run, never a widened bar.
