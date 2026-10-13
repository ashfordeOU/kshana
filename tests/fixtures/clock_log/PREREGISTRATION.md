<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: clock-log formats through to ADEV, TDEV and MTIE against allantools

Committed alone, before the fixture or any oracle number exists. It fixes the logs, what is
compared and the bars. The bars may be tightened after the run, never loosened. A miss is
recorded with its numbers, not tuned away.

## The change

`src/clock_log.rs` reads RINEX clock (`AS`/`AR` records of one clock), TimeLab-style ASCII
phase or frequency logs, and TAPR TICC counter logs into one normalised phase series, with
`tau0` stated or found and gaps counted. A `telecom-timing` series may name a log
(`[series.clock_log]`) and a clock scenario may carry a `[clock_log]` table, which adds a
`measured` block (overlapping ADEV, TDEV and MTIE at octave averaging factors).

## Logs (fixed now)

A committed generator, `scripts/gen_clock_log_ref.py`, writes three logs from one seeded
phase record (numpy `default_rng(20261013)`; white phase noise of 1 ns plus a random walk of
frequency with 1e-11 per root second at a 1 s step, 4 097 samples):

1. `timelab_phase_ns.txt`: TimeLab ASCII, two columns `time value`, phase in ns, a
   `# units = ns` header comment, 4 097 readings, no gap;
2. `ticc_timestamp.txt`: a TICC timestamp-mode log of channel `chA` at a nominal 1 s tick,
   readings `t0 + k + x[k]` printed with 12 decimals, with the readings for k = 1 000 to
   1 002 removed (one gap of 3 epochs), read with `gaps = "linear"`, plus the counter's
   start-up text and a `chB` channel that must be ignored;
3. `rinex_clk_304.clk`: a RINEX 3.04 clock file with one `AS` clock, `G08`, at 30 s spacing,
   the same 4 097 phase values in seconds printed `%19.12E`, and a second clock `G11` that
   must be ignored when `clock = "G08"` is given.

## Oracle

1. An independent reader in the same generator script, written from the format description
   in `src/clock_log.rs` and `docs/CLOCK-LOG-FORMATS.md` (not from the Rust code): it parses
   each log back to a phase series (the TICC gap filled by linear interpolation).
   It is by the same author, so it checks the reader against the specification, not
   against a third party.
2. allantools 2024.6 (`pip install allantools==2024.6`), run on the phase series the Python
   reader produced: `oadev`, `tdev` and `mtie` with `data_type="phase"`, `rate = 1/tau0`,
   at the averaging factors the engine reports (octaves of `tau0` while the estimator
   fits). No allantools code is copied.

## Bars (fixed now)

- B1 (normalised phase): for each log the engine's `n_used`, `tau0_s` and gap counts equal
  the reader's, and every phase sample agrees within 1e-13 s (TICC time stamps of about
  4 000 s carry about 5e-13 s of f64 spacing; the other formats are expected to agree
  exactly, and the result records the largest difference).
- B2 (estimators): at every averaging factor the engine reports, ADEV, TDEV and MTIE agree
  with allantools within a relative 1e-10.
- B3 (wiring): a `telecom-timing` run whose series is the TimeLab log through
  `[series.clock_log]` gives the same MTIE and TDEV curves, bit for bit, as the same values
  given as `series.samples`; a scenario without the table is byte-identical to before
  (the goldens and `tests/prediction_frozen.rs` unchanged).

## Verdict rule

The row stays MODELLED whatever the result: the logs are synthetic, the reader oracle has the
same author, and allantools checks the estimators, which are validated elsewhere. All three
bars met: the comparison is recorded as passing. Any bar missed: recorded as a miss with the
numbers, and the defect is fixed in a separate commit with a re-run, never a widened bar.
