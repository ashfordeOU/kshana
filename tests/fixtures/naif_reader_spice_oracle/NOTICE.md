# Provenance: NAIF kernel reader oracle

Fixture of `tests/naif_reader_spice_oracle.rs`, the comparison for the NAIF (Navigation and
Ancillary Information Facility) kernel reader row. Generated once on 2026-10-02 by
`make_fixture.py --seed-commit abcd913310d988c4ccb0babae9144ea53af2b1a5`, after that
pre-registration commit was pushed; the random grid is seeded from that commit's hash.

- **Oracle 1:** NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.2.0
  (`https://github.com/AndrewAnnex/SpiceyPy`, MIT licence; the toolkit itself is NAIF's,
  freely distributed). `spkezr` and `pxform`, run as a separate program; no SPICE code is in
  Kshana.
- **Oracle 2:** ANISE 0.10.6, the Python distribution of `https://github.com/nyx-space/anise`
  (Nyx Space, Mozilla Public License 2.0). `Almanac.translate` and `Almanac.rotate`, run as a
  separate program; nothing from it is linked into or copied into Kshana.
- **Kernels read by both oracles** (United States government work, public; retrieved
  2026-10-02 from `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/`, not redistributed):
  - `spk/planets/de440s.bsp`, SHA-256
    `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`
  - `pck/moon_pa_de440_200625.bpc`, SHA-256
    `60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f`
  - `fk/satellites/moon_de440_250416.tf` (names the MOON_PA_DE440 frame for `pxform`), SHA-256
    `a47c71e9c9f33796bdafb2c9d69a7ee447b6016ecad80f71cd6f3e479f9cf768`
  - `lsk/naif0012.tls`, SHA-256
    `678e32bdb5a744117a467cd9601cd6b373f0e9bc9bbde1371d5eee39600a039b`
- **Files here:**
  - `states.csv`: 600 rows (200 epochs; one drawn body pair plus Moon/Earth and Sun/Earth per
    epoch): epoch, target, observer, the bar scales R, V and the relative speed, then the SPICE
    and the ANISE state (km, km/s).
  - `rotations.csv`: 200 rows: epoch, the bar scale W, then the SPICE and the ANISE
    J2000-to-MOON_PA_DE440 matrices.
  - `grid_de440s.bsp`, `grid_moon_pa_de440.bpc`: the 1051 SPK and 199 PCK type-2 records the
    engine needs, copied bit for bit from the full files into one single-record segment each
    (United States government data, as above). SPICE was checked to reproduce every comparison
    value bit for bit from these files alone before they were written.
  - `SHA256SUMS`: digests of the four files above.
- **Reproduce:** with the four NAIF files in `$KSHANA_NAIF_DIR` (or
  `$KSHANA_ORACLES/data/naif`) and a Python with spiceypy 8.2.0 and anise 0.10.6:
  `python tests/fixtures/naif_reader_spice_oracle/make_fixture.py --seed-commit abcd913310d988c4ccb0babae9144ea53af2b1a5`.
  The output is deterministic.
