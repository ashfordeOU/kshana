# gps-sdr-sim cross-generator fixture

- `harness.c` (MIT, to match the program it links): a separate oracle program that calls
  gps-sdr-sim's own `codegen`, `readRinexNavAll`, `eph2sbf` and `generateNavMsg` and prints
  their output as JSON. It is never compiled into Kshana.
- `generate.sh`: clones gps-sdr-sim at the pinned commit, builds the harness, runs it on the
  bundled `brdc0010.22n`, and writes `gpssdrsim_output.json`.
- Oracle: gps-sdr-sim, Takuji Ebinuma, MIT licence,
  <https://github.com/osqzss/gps-sdr-sim>, commit 28ca29a6719475195e3aabd5930c4ed02d67190f
  (2025-01-07).
- Input: `brdc0010.22n`, the GPS broadcast ephemeris file for 1 January 2022 that gps-sdr-sim
  ships in its repository (an IGS/NASA CDDIS daily broadcast file, public).
- Generated 2026-10-02 with `generate.sh` (gcc 13, Ubuntu 24.04).
  SHA-256 `brdc0010.22n`: 7db04513dd2d0e13c0ee20cb4eaa8f71e5a28ab58b65c9b5b789f86eeab436cd.
  SHA-256 `gpssdrsim_output.json`: dddb496747d000cadbdc581181701efd8f1e3f5ec39645205c5dcd721b0402aa.
