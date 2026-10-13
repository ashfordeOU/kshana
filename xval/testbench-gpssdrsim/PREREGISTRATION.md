# Pre-registration: the test-bench export read by gps-sdr-sim's motion parsers (CAP-16)

Committed on its own on 2026-10-13, before any export has been passed to the oracle. The bars
are not loosened after a run; a miss is recorded with its numbers as a FINDING.

## Question

`docs/TEST-BENCH.md` says a laboratory simulator can replay `kshana bench-export`'s motion files.
The existing external checks (`tests/testbench_reference.rs`: PROJ, geographiclib, pynmea2,
scipy) check the conversions and encodings. They do not check that any simulator's own
motion-file reader turns the files back into the trajectory that was written. This registration
checks that with one open-source simulator's readers.

## Oracle

gps-sdr-sim (https://github.com/osqzss/gps-sdr-sim, commit
28ca29a6719475195e3aabd5930c4ed02d67190f, 2025-01-07, MIT licence), used as a separate tool.
`fetch.sh` clones it at that commit outside the repository; nothing from it is vendored. A small
C driver (`driver.c`) compiles `gpssim.c` with its `main` renamed and calls only three of its
file readers and its own WGS 84 conversion:

- `readNmeaGGA` (the `-g` option: NMEA GGA, latitude, longitude, altitude + geoid height,
  converted to Earth-fixed by its `llh2xyz`);
- `readUserMotion` (the `-u` option: `time,x,y,z` Earth-fixed CSV rows);
- `readUserMotionLLH` (the `-x` option: `time,lat_deg,lon_deg,height_m` CSV rows).

The driver writes the Earth-fixed positions each reader returns. No signal-generation function
is called and no sample, I/Q or RF quantity is produced.

## Inputs

`kshana bench-export` at the default epoch, on the bundled scenarios `automotive-urban-canyon`,
`gnss-ins`, `small-uas-jammed-nav`, `gnss-ins-maritime`, `gnss-ins-rail`, `gnss-ins-aviation`
(`gnss-ins` kind, 0.1 s step), `jamming-demo` and `gnss-sim-raim` (stationary). The SHA-256 of
each exported `.motion.csv` and `.nmea` is recorded with the result, so the result applies to
those bytes.

The ECEF reader is given the motion CSV with its header line removed (`tail -n +2`); its first
four columns are already `time_s,x_m,y_m,z_m`. The LLH reader is given
`tail -n +2 | cut -d, -f1,8,9,10` (`time_s,lat_deg,lon_deg,h_m`). These two recipes are what
`docs/TEST-BENCH.md` will state if the bars hold.

gps-sdr-sim holds at most `USER_MOTION_SIZE` = 3000 samples (300 s at its fixed 10 Hz). N below
is therefore min(number of samples in the export, 3000). That limit is the simulator's, and the
documentation will state it whatever the result.

## Bars (per scenario; reference = the motion CSV's own `x_m,y_m,z_m` row by row)

| Id | Quantity | Bar | Basis |
|---|---|---|---|
| B1 | samples read by `readNmeaGGA` | exactly N | one GGA sentence per sample |
| B2 | max 3-D difference, NMEA read vs CSV Earth-fixed | ≤ 1.0 cm | NMEA writer rounding (5 mm horizontal + 1 mm height, the export's stated tolerance) + CSV rounding (0.1 mm), rounded up |
| B3 | samples read by `readUserMotion` (header removed) | exactly N | one row per sample |
| B4 | max 3-D difference, `readUserMotion` vs CSV | ≤ 1 µm | the same decimal text parsed twice |
| B5 | samples read by `readUserMotionLLH` (recipe above) | exactly N | one row per sample |
| B6 | max 3-D difference, `readUserMotionLLH` vs CSV | ≤ 1.0 mm | latitude/longitude rounding 5e-10 deg (0.06 mm each) + height 5e-5 m + CSV Earth-fixed rounding 5e-5 m per axis; gps-sdr-sim's ellipsoid constants are WGS 84 |
| B7 | time column of `gnss-ins` exports (gps-sdr-sim ignores it and assumes 10 Hz row order) | `time_s` of row i equals 0.1·i within 1e-9 s | the kind's 0.1 s step |

B7 applies to the `gnss-ins` scenarios only. The stationary scenarios step at 30 s and 60 s as
bundled. `docs/TEST-BENCH.md` already tells the user to set `[time] step_s` to the simulator's
rate. Their row spacing is recorded, not barred. Because every one of their samples is the same
position, B1 to B6 still apply to them.

Recorded without a bar: what `readUserMotion` does with the CSV as written, header line
included.

## Outcome rule

All bars held on every scenario: the new ledger row "test-bench export read by a simulator's
motion parsers" is VALIDATED (OracleBasis Library, gps-sdr-sim). Any miss: a FINDING with its
numbers, pinned by the test, and the row stays MODELLED for the affected reader.

## What this does not check

The physics of the scenario's truth trajectory (the driving profile and its integration); signal
generation, or whether gps-sdr-sim's output is correct; any other simulator's reader; any
receiver's performance.
