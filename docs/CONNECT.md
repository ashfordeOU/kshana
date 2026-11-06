# Kshana Connect: mapping files

A mapping file (`kshana.connect/1`, TOML) tells Kshana how to read an export it has no reader
for, and turns it into a [`kshana.obs/1`](OBS-SCHEMA.md) observation file. No code is written:
the file names the columns, their units and the time format.

```sh
kshana connect map export.csv --mapping export.connect.toml --station station.toml --out site.obs.jsonl
kshana obs check site.obs.jsonl
```

Three worked examples are in [`examples/connect/`](../examples/connect/): an Android raw
measurement CSV (one row per satellite, satellites from a constellation code and a number), a
timing receiver's semicolon-separated monitoring export (one column per satellite, GPS week and
time of week, height in feet) and a monitoring service's nested JSON (position in radians).
`tests/connect_examples.rs` maps all three.

## The file

```toml
schema = "kshana.connect/1"

[source]
format = "csv"          # csv, tsv, json or jsonl
delimiter = ";"         # csv only; one character, default ","
skip_lines = 0          # lines before the header (csv, tsv)
comment = "#"           # lines starting with this are ignored (csv, tsv)
records = "/data/epochs" # json only: JSON pointer to the array of records
filter = { column = "type", equals = ["Raw"] }  # keep only these rows

[time]
column = "tow"
format = "gps-week-tow" # rfc3339, unix-s, unix-ms, gps-s, gps-week-tow or pattern
week_column = "week"    # gps-week-tow: the full GPS week
pattern = "%d/%m/%Y %H:%M:%S"  # pattern: %Y %m %d %H %M %S (seconds may have a fraction)
scale = "utc"           # rfc3339, unix-* and pattern: utc (default), gps or tai
group_tolerance_s = 0.0005  # rows this close in time are one epoch

[fix]
lat = { column = "lat", unit = "deg" }   # deg or rad
lon = { column = "lon", unit = "deg" }
height = { column = "alt", unit = "ft" } # m, ft or km
n_used = { column = "nsat" }

[signals]
# One row per satellite ...
sat = { column = "prn" }  # G05, G5 or "G 5"; or number_column with system / system_column + system_map
cn0 = { column = "cn0", unit = "dB-Hz" }
band_column = "signal"    # or band = "L1" (the default)
# ... or one column per satellite:
wide = { G05 = "cn0_g05", E11 = "cn0_e11" }

[receiver]
agc = { column = "agc" }          # native units
jam_ind = { column = "jamming_indicator" }
spoofing = { column = "spoof" }   # receiver's own flag: 0 unknown, 1 none, 2 indicated, 3 affirmed
jamming = { column = "jam" }
pdop = { column = "pdop" }
hdop = { column = "hdop" }
vdop = { column = "vdop" }
```

Every field takes `scale` and `offset` (applied after the unit: `value × scale + offset`), and
in JSON a `column` starting with `/` is a JSON pointer into nested objects.

## Rules

- Rows with the same time (within `group_tolerance_s`) are one epoch, so long and wide exports
  both work, and position rows interleaved with satellite rows join their epoch.
- An empty cell (or a JSON `null`) is a missing value; anything else that is not a number is an
  error naming the line and the column. Nothing is guessed.
- Times must not go backwards; a row that does is an error naming it, never a silent reorder.
- GPS and TAI times are converted to UTC with the leap-second table; the observation file's
  `time_label` is UTC.
- A CSV header without a column the mapping names is a mapping error.
- The output header's `source_format` is `connect:<format>`.

## Conformance vectors

`conformance/connect/` holds one folder per adapter with a `vector.toml` (input, mapping file or
built-in reader, station, expected output). `kshana connect check conformance/connect` runs them
all and exits 1 on any byte difference, naming the first differing line; `--bless` records the
expected outputs after a reviewed change. CI runs the folder (`tests/connect_conformance.rs`).
Every new adapter comes with its vector.

Not in this version: Parquet and HDF5 inputs (they need large dependencies; a conversion to CSV
or JSON Lines is the route for now) and live inputs (A3a).

## Live: watching a directory (library)

`kshana::connect_watch::step` follows the files a logger writes or rotates into a directory and returns
the `kshana.obs/1` records that became complete since the last step, through the same mapping file.
- The files whose names end with the chosen suffix are read in name order, as one continuous log: a
  later file's comment lines and header row are dropped. So an epoch whose rows a rotation split is
  still one epoch, and every `t_s` counts from the directory's first epoch.
- Only complete lines are read; a line still being written waits for the next step.
- The last epoch is held back until rows after it arrive, because more rows of it may still be written.
  `flush` releases it at the end of a run.
- Files must be in time order by name. A single JSON document is refused (use `jsonl`).
- It polls, with no operating-system file events, so it behaves the same on every platform and on
  network file systems. The directory is re-read on each step, so move processed files away from time
  to time.
- Checked by replaying a log written in pieces and rotated part-way through an epoch: the result is the
  same as `kshana connect map` on the whole log (`tests/connect_watch.rs`).
- From the command line: `kshana connect watch <dir> --mapping <connect.toml> --station <station.toml>`
  prints new records as JSON lines every `--interval` seconds (default 2). `--suffix` picks the files
  (default: the mapping's format, for example `.csv`). `--once` reads what is there, releases the last
  epoch and exits.

## Grid timing: IEEE C37.118.2 PMU streams (library, MODELLED)

`kshana::c37118` reads a capture of synchrophasor frames (a TCP stream or a dump of UDP payloads) and
reports each PMU's time health: the sync-error bit, the time-quality and unlocked-time classes in the
`STAT` word, and the message time quality and leap-second flags in `FRACSEC`. `sync_losses` groups
consecutive sync-error reports into intervals. Every frame's CRC is checked. A data frame is read only
after a configuration frame (CFG-2) has given each PMU's channel layout. Phasor values are stepped over,
not decoded.

It is not yet a `kshana obs convert` reader, because the `kshana.obs/1` schema has no field for time
quality. That needs a schema minor version. It is checked against a stream from an independent encoder
(`tests/c37118.rs`); no public PMU capture has been checked yet.

