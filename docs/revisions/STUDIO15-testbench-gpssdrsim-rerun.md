<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# STUDIO-15 — gps-sdr-sim test-bench oracle re-run on the 0.36 portable exports (2026-10-15)

Part of [`STUDIO15-portable-math-rebaseline.md`](STUDIO15-portable-math-rebaseline.md). Concerns the
VALIDATED ledger row "Test-bench export read by a simulator's motion-file readers (gps-sdr-sim)" and
[`xval/testbench-gpssdrsim/PREREGISTRATION.md`](../../xval/testbench-gpssdrsim/PREREGISTRATION.md).
Approved by the owner on 2026-10-15 ("re-run against the moved NMEA export, bar unchanged").

## Why

With the batch 2-3 code on portable maths, the NMEA 0183 text that `kshana bench-export` writes for
three of the eight registered scenarios changed (the motion CSVs did not). The committed summary
`tests/fixtures/testbench/gpssdrsim.json` pins the SHA-256 of the bytes gps-sdr-sim read, so its numbers
applied to the old bytes only. The oracle was re-run on the new bytes; nothing else was changed.

## How

`xval/testbench-gpssdrsim/fetch.sh` (gps-sdr-sim at the registered commit
`28ca29a6719475195e3aabd5930c4ed02d67190f`), then `xval/testbench-gpssdrsim/run.sh <checkout>` with the
release `kshana` binary of this branch. Driver, recipes, scenarios and bars are unchanged.

## Old -> new

| scenario | `nmea_sha256` old | new |
|---|---|---|
| `gnss-ins-maritime` | `eb2a52fe7ecebcd47cc816429d865e1a0f0a8842a2f8b27e91d836498870cc81` | `e00b6d32a61f09ce40e734fe4d620dd0b18e842b1cba53741b130a8940c2e60e` |
| `gnss-ins-rail` | `42d9b4d3829ddee40c9ba50cb373dc78e18c2e7787cf33117bb54515c98be61a` | `dadc607c0d3b11c8a8434a6ed591d18672545a08c3472a60621fd29bd751f420` |
| `gnss-ins-aviation` | `e10c2efb76cadc950132b5f191fa7c82459621ed1f8fd41474bc917ba3694f59` | `e0f94b573c79ed314cbe2e8630733318f566f2e7bc892b39ca524d81aef54545` |

Every other field of the summary, on all eight scenarios, is identical to the previous run, including
every count and every maximum difference (B1 to B7 and amendment 1): NMEA worst 1.21 mm (bar 1 cm), LLH
worst 0.145 mm (bar 1 mm), four-column ECEF cut exact (bar 1 um), the run-1 B3/B4 FINDING unchanged. The
six tests of `tests/testbench_gpssdrsim_oracle.rs` pass, including `todays_export_is_the_bytes_the_oracle_read`.
The VALIDATED verdict and the ledger text are unchanged.
