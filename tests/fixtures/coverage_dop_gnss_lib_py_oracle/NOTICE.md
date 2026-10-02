# Fixture: coverage and DOP maps against gnss_lib_py

Used by `tests/coverage_dop_gnss_lib_py_oracle.rs`. Generated 2026-10-01.

| File | Content | SHA-256 |
|---|---|---|
| `positions_galileo.txt` | body-fixed satellite positions (m) of the `galileo` preset, 288 epochs at 300 s, exported by the engine (`constellation::satellite_positions_fixed`, no J2), 17 significant digits | 3d14a797e3d60a5d811934e3cac5d83a6b63b54769ef6052cda559f2550324ca |
| `positions_gps-baseline.txt` | the same for the `gps-baseline` preset | 5032fc6071dbc26c3008d79ba49aa419405092c5ff1c3762576091eabb8a8e8b |
| `gnss_lib_py_galileo.txt` | per-cell fix share, PDOP availability, mean visible count, mean and largest PDOP, and the global and worst-cell availability, computed by the oracle from `positions_galileo.txt` | f074266f330edd717eb242ae9fa25e029a651ce9f50e1698f645cec753341e90 |
| `gnss_lib_py_gps-baseline.txt` | the same for `gps-baseline` | 946ebea59f0a2726e935c795b99d0713f9af46b7de41cbbdfa283b9abd3afb2f |
| `make_fixture.py` | the oracle side (grid, elevation and azimuth in numpy, PDOP from gnss_lib_py) | (this repository) |

Oracle: gnss_lib_py 1.0.4 (Stanford Navigation and Autonomous Vehicles Laboratory, MIT licence,
https://github.com/Stanford-NavLab/gnss_lib_py), `gnss_lib_py.utils.dop.get_dop`, with numpy 2.3.5
(BSD-3-Clause), run as a separate Python process. No oracle code is vendored; only its printed
numbers are committed.

Regenerate:
1. `KSHANA_WRITE_COVERAGE_FIXTURE=1 cargo test --test coverage_dop_gnss_lib_py_oracle write_position`
2. `source ~/Code/kshana-oracles/env.sh && $ORACLE_PY tests/fixtures/coverage_dop_gnss_lib_py_oracle/make_fixture.py`
