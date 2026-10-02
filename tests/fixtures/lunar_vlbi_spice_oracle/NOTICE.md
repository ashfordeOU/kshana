# lunar_vlbi_spice_oracle fixture

`spice_light_times.csv` (SHA-256 `62b3bfae6155cdabe6636627e3471b71c27a77c43219e2b2e1171f6042af54d0`)
is written by `generate_lunar_vlbi_spice_oracle.py` (this directory), which calls no Kshana
code. It holds converged Newtonian light times from a beacon fixed at (1737.4, 0, 0) km in the
DE440 lunar principal-axis frame to the Deep Space Network stations DSS-14, DSS-43 and DSS-63,
and five-point central-difference partials of those light times, as the NAIF SPICE Toolkit
solves them (`spkcpt` and `spkcpo`, aberration correction `CN`). Re-running the script
reproduces the file byte for byte.

- Tool: NAIF SPICE Toolkit CSPICE N0067 (NASA Navigation and Ancillary Information Facility,
  freely distributed) through spiceypy 8.2.0 (MIT licence), run as a separate program.
- Kernels (NAIF generic kernels, United States Government work, retrieved from
  https://naif.jpl.nasa.gov/pub/naif/generic_kernels/; SHA-256 in the CSV header; not
  committed here, read from `$KSHANA_ORACLES/data/naif/`):
  - `naif0012.tls` (lsk/), retrieved 2026-09-30
  - `de440s.bsp` (spk/planets/), retrieved 2026-09-30
  - `moon_pa_de440_200625.bpc` (pck/), retrieved 2026-09-30
  - `moon_de440_250416.tf` (fk/satellites/), retrieved 2026-09-30
  - `earth_latest_high_prec.bpc` (pck/), the copy retrieved 2026-09-30 (the same file the cut
    kernels in `../lunar_vlbi_anise_oracle/kernels/` were taken from)
  - `earthstns_itrf93_260814.bsp` (spk/stations/), retrieved 2026-10-02, SHA-256
    `007eb0aad5dd022c6d61bdbfb2395680bd1eb31c49a8637d0b0a1cfbea737c6b`
- Epochs: `utc2et` of 2024-01-01T00:00 to 2024-01-02T00:00 UTC, hourly (25).
- Columns: see the generator's docstring. The station positions are SPICE's ITRF93 positions
  at each epoch (`spkpos`, no correction), the inputs Kshana is given.
- The beacon SPK type 8 file used for the station partials is written to a temporary
  directory and deleted; the script checks that `spkcpo` through it reproduces `spkcpt` at
  zero offset (worst 4.8e-14 s on this run).

Regenerate:

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/lunar_vlbi_spice_oracle/generate_lunar_vlbi_spice_oracle.py

## Amendment 3: epochs near J2000

`spice_light_times_j2000.csv` (SHA-256
`131564e6c1e935a675e976d4f923e679be81d02756578d0c56b08227f47dba55`) is the same generator run
with `--epochs j2000`: 25 hourly epochs from 2000-01-01T06:00 to 2000-01-02T06:00 UTC, where
SPICE's double-precision ephemeris time resolves the emission epoch (at 2024 epochs it rounds
it by up to 6e-8 s, about 6e-12 s of light time; see the test header). Same kernels and hashes.

`kernels/` holds the engine's inputs for those epochs, cut by `kernels/make_kernel_subsets_2000.py`
from the full files above (records bit for bit; SPICE reproduces every state and rotation of the
full kernels at 68 epochs exactly). The cutter reuses the DAF writer of
`../lunar_vlbi_anise_oracle/kernels/make_kernel_subsets.py`, whose internal file name field
reads "M038 2024-01-01 subset" in these files too.

- `de440s_2000-01-01.bsp` SHA-256 `7db308802fdc8af1407cd8d5bea55620924badbc4e1d0744f2a31db9df782826`
- `earth_itrf93_2000-01-01.bpc` SHA-256 `ce205cb5559c80e10b8af0ba691371ed0a1692fbd5f74acbb7aff951c515a2f8`
- `moon_pa_de440_2000-01-01.bpc` SHA-256 `af4bfee7922636c1873866769efeebbdf91b92b9a82676c12caedb0cb52f8b2b`
