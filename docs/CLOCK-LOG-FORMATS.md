# Clock-log formats

`src/clock_log.rs` reads a measured clock log into one normalised phase series: a uniform
grid of `(time_s, phase_s)` samples, with the sample interval `tau0` stated or found, every
gap counted and the log's units named. Three formats are read, each a documented subset.
Anything outside the subset is refused with an error that names what was found, rather
than read approximately.

**Abbreviations.** RINEX is the Receiver Independent Exchange Format. TICC is the TAPR
(Tucson Amateur Packet Radio) time-interval counter. ADEV is the overlapping Allan
deviation, TDEV the time deviation and MTIE the maximum time interval error. `tau0` is the
sample interval in seconds.

## Where a log can be used

- **`telecom-timing`**: `[series.clock_log]` in place of `series.samples` or
  `series.csv_path`. The log's phase, in ns, is the time-error series checked against the
  masks, and the report gains a `clock_log` block saying how it was read.
- **The clock kind**: a `[clock_log]` table adds a `measured` block to the run: how the log
  was read, the SHA-256 of the table (`input_sha256`; the run's `scenario_hash` does not
  cover the table) and of the phase samples, and the overlapping ADEV, TDEV and MTIE at
  octave averaging factors. It needs `runs = 1`. The simulated holdover is unchanged.

Without the table, both kinds parse, hash and report exactly as before.

```toml
[clock_log]                 # or [series.clock_log] in a telecom-timing scenario
format = "ticc"             # "rinex-clk", "timelab" or "ticc"
path = "logs/ticc.txt"      # or text = "..." inline (the only choice in WebAssembly)
channel = "chA"             # TICC: needed when the log holds more than one channel
gaps = "linear"             # "refuse" (default), "longest" or "linear"
# clock = "G08"             # RINEX: needed when the file holds more than one clock
# tau0_s = 1.0              # overrides a header and the detected spacing
# units = "ns"              # TimeLab phase units: s (default), ms, us, ns, ps
# data = "phase"            # TimeLab: phase (default) or frequency
```

## The formats

**`rinex-clk`**: RINEX clock files, versions 2 and 3.00 to 3.04 (including the 3.04
nine-character name field). The header is read only for its `TIME SYSTEM ID` and is skipped
up to `END OF HEADER`. Of the data records, only the `AS` (satellite) and `AR` (receiver or
station) records of one clock, selected by name, are kept. Their first value field, the
clock bias in seconds, is the phase. Continuation lines and the `CR`, `DR` and `MS` records
are skipped. Epochs are the record's calendar fields, as seconds from 1980-01-06 00:00:00 in
the file's own time system, with no conversion.

**`timelab`**: TimeLab-style ASCII phase or frequency logs, the plain-text form that
TimeLab exports and its ASCII import and Stable32 read. There is one reading per line:
either a single column at a uniform `tau0`, or two columns `time value`. Columns may be
separated by white space, commas or semicolons.

- Lines starting with `#`, `;` or `%` are comments. A comment of the form `key = value` (or
  `key: value`) sets `tau0` (s), `units` (`s`, `ms`, `us`, `ns` or `ps`, for phase), `data`
  (`phase` or `frequency`) or `time_units` (`s` or `mjd`, for the first of two columns).
- One leading non-numeric line is taken as a column header.
- Frequency data (fractional frequency) is accepted as a single column only. It is
  integrated to phase as `x[i+1] = x[i] + y[i]·tau0` (NIST SP 1065, 2008, §4.1).
- TimeLab's binary and `.tim` project files are not read.

**`ticc`**: logs of the TAPR TICC counter (TICC Operation Manual, revision of 23 November
2016, "measurement modes"). Every data field is seconds with 12 decimal places.

- Timestamp-mode lines (`<seconds> chA`, `<seconds> chB`) and the TimeLab mode's
  pseudo-timestamp channel (`chC`) are event time stamps. The phase of the selected channel
  is its time stamp minus the nominal tick: `x[k] = t[k] − t[0] − n[k]·tau0`, where `n[k]`
  is the whole number of `tau0` since the first event. A missed event is a gap.
- Interval-mode lines (`<seconds> TI(A->B)`, or any label starting `TI`) are read directly
  as phase, one reading per `tau0`. The scenario must state `tau0_s`, because the line
  carries no time.
- Period-mode and Debug-mode output is refused. A channel whose readings do not increase is
  reported as Period mode.
- Lines starting with `#`, and lines that are not `<number> <label>` (such as the start-up
  menu), are skipped and counted.

## `tau0` and gaps

When the log carries time stamps and no `tau0` is given, `tau0` is the median spacing of
consecutive time stamps, rounded to four significant figures, and the source is reported as
`median-spacing`. A counter's spacing differs from nominal by the reference's frequency
offset, parts in 10^6 or less. A `tau0_s` in the scenario always wins (source `input`), then
a `tau0` header comment (source `header`).

Samples are placed on the grid `t0 + i·tau0`, and a missing epoch is a gap. Readings more
than 1 % of `tau0` off the grid are dropped and counted, as are duplicates (the first is
kept). The gap policy is one of:

- `refuse` (the default): any gap is an error that counts the gaps;
- `longest`: keep the longest gap-free run;
- `linear`: fill interior gaps by linear interpolation, and report the number filled.

The estimators need a gap-free record, which is why gaps are resolved here.

## Evidence

MODELLED. This is a parser, and its output feeds estimators that are validated elsewhere
against allantools. The unit tests in `src/clock_log.rs` use small hand-written logs.
`tests/clock_log_allantools.rs` runs the comparison pre-registered in
`tests/fixtures/clock_log/PREREGISTRATION.md`: three seeded synthetic logs, one per format,
read back by an independent reader written from this page by the same author, with the
ADEV, TDEV and MTIE checked against allantools 2024.6. The logs are synthetic, so nothing
here describes a real clock or counter.
