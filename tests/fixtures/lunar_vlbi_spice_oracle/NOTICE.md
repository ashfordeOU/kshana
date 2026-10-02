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
