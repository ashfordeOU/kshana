# Provenance: KernelEphemeris against Skyfield at UTC epochs

Fixture of `tests/kernel_ephemeris_skyfield_oracle.rs`, generated 2026-10-02 by
`make_fixture.py --seed-commit 0bfafe6dfc72fd15eb5c98d7582efba924c9b335` after that
pre-registration commit was pushed.

- **Oracle:** Skyfield 1.54 (`https://github.com/skyfielders/python-skyfield`, MIT licence),
  with its built-in leap-second table and its own TDB − TT, reading NAIF's `de440s.bsp` through
  jplephem. Run as a separate program; no Skyfield code is in Kshana.
- **Kernel:** `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp`,
  retrieved 2026-10-02, SHA-256
  `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2` (United States government
  work). `grid_de440s.bsp` holds the 923 type-2 records the grid needs, copied bit for bit into
  single-record segments with the reader row's writer; SPICE (CSPICE N0067, spiceypy 8.2.0)
  checked that it evaluates bit for bit like the full file at every comparison epoch.
- **Files:** `positions.csv` (600 rows: UTC day start as a Julian date, seconds of day, target,
  center, the bar scales R and relative speed, Skyfield's position in metres),
  `grid_de440s.bsp`, `SHA256SUMS`, `make_fixture.py`.
- **Reproduce:** with the NAIF files in `$KSHANA_NAIF_DIR` and Python with skyfield 1.54 and
  spiceypy 8.2.0, rerun the command above; the output is deterministic.
