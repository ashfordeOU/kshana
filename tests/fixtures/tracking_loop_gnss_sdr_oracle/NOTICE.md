# Fixture: tracking loops against GNSS-SDR on independently generated IF

Used by `tests/tracking_loop_gnss_sdr_oracle.rs`. Generated 2026-10-02.

| File | Content | SHA-256 |
|---|---|---|
| `gnss_sdr_results.csv` | the measured quantities the test grades (jitter, thresholds, binding loop, dynamic stress, ramp lag, slip times) | 4c73291c24fd23d82eafb97bb45ca5d41dc7682d0e647ee05879289f7a3a9310 |
| `gnss_sdr_runs.csv` | per-recording statistics of every GNSS-SDR run (calibration, jitter, sweep at 10 and 20 Hz, ramp, slew) | 392866f7aeb5bf83d47f644ede5659e46c3caedad08d21d40ce6a24d5fd57881 |
| `gnss_sdr_template.conf` | the GNSS-SDR configuration (bandwidths filled in per run) | 8d86d0180f0e60c5837d95a1c36de1f3c276f2363b0743c5e5a19b191f1bbb0e |
| `ifgen.py` | the numpy IF generator (GPS L1 C/A PRN 1, IS-GPS-200 generators; no engine code) | (this repository) |
| `make_fixture.py` | the driver: generate, run GNSS-SDR, compare the tracking dump with the analytic truth | (this repository) |

The recordings themselves (4 Msample/s, signed 8-bit I/Q, up to 1 GB each) are not committed;
`ifgen.py` regenerates them bit for bit from the seeds in `make_fixture.py` (101 onwards, in
run order). Everything in them is synthetic; there is no third-party data.

Oracle: GNSS-SDR 0.0.19 (https://gnss-sdr.org, Centre Tecnològic de Telecomunicacions de
Catalunya, GPL-3.0-or-later), the Debian/Ubuntu package `gnss-sdr` 0.0.19, run as a separate
program. Only numbers derived from its tracking dumps are committed; none of its code is in the
crate. Its source file `dll_pll_veml_tracking.cc` (tag v0.0.19) was read to establish what the
dump fields mean (the accumulated carrier phase is written as a 32-bit float).

Regenerate (oracle toolchain: `source ~/Code/kshana-oracles/env.sh`; about 40 minutes and
1 GB of free disk):
`$ORACLE_PY tests/fixtures/tracking_loop_gnss_sdr_oracle/make_fixture.py <work dir>`
