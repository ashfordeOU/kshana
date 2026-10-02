# Fixture: heliocentric B-plane row oracles (assist velocity change, elements, Tisserand)

Used by `tests/bplane_heliocentric_oracle.rs`. Generated 2026-10-02.

| File | Content | SHA-256 |
|---|---|---|
| `helio_states.txt` | 350 Sun-centred mean-ecliptic J2000 Cartesian states (km, km/s) before and after each assist, built by `make_fixture.py` in numpy from the elements of the planetocentric grid in `../bplane_gmat_oracle/states.txt`, with the planet index and its orbit radius `a_P` | 73bd5238a8c4fd3fc6a157c053e5862823dbea8e711cdd5728c905fe5253a70c |
| `helio_grid.script` | the GMAT input script `make_fixture.py` wrote | 227dbbba0615b66bb60a2742cf9852f2003f2b465944a73d515b32d9ad2b7d36 |
| `gmat_planetocentric_report.txt` | GMAT's printed C3Energy (km²/s²) and incoming and outgoing asymptote right ascension and declination (deg, EarthMJ2000Eq) for the 192 planetocentric states, 16 significant digits | e461334b68e7a6c0fbd17fedcddbf7f06418266bcfbf1df549fff2e9f8ab3f6c |
| `gmat_helio_report.txt` | GMAT's printed SMA (km), ECC (origin Sun) and INC (deg, Sun-centred MJ2000Ec axes) for every heliocentric state, 16 significant digits | 35d93e6cac7d17f4890a18d42605bf8ee42feedd1860b4f58abf0d3c9d2bd000 |
| `sbpy_tisserand.txt` | sbpy's Tisserand parameter from GMAT's SMA, ECC and INC with the planet's `a_P` | 8bafd9d029c94215d4d500620dfa0dacb0e7a1eca35ec96412269a3fb9b9bed3 |
| `make_fixture.py` | generator: builds the states, writes and runs the GMAT script, runs sbpy | (this repository) |

Oracles, each run as a separate program; no oracle code or binary is vendored, only printed numbers:
- NASA General Mission Analysis Tool (GMAT) R2026a, console build of 30 March 2026
  (`GmatConsole-R2026a`, SHA-256 f7cf5b3188902353ed4245bb21c22c1afa0451efdd221b7e19f6a74dc7ed1d93),
  Apache License 2.0, https://sourceforge.net/projects/gmat/.
- sbpy 0.6.0 (BSD-3-Clause, https://github.com/NASA-Planetary-Science/sbpy; PyPI sdist
  `sbpy-0.6.0.tar.gz`, `sbpy/data/orbit.py` SHA-256 322e9233d3dbf27765e1c6dfc682a6b54a40ae93a8f590f14a82935b52e086cf),
  `sbpy.data.Orbit.tisserand`, with astropy 8.0.1 and numpy 2.3.5 (BSD-3-Clause).

The published values of part C are cited in the test, not stored here: T. Kasuga and D. Jewitt,
"Asteroid-Meteoroid Complexes", in *Meteoroids: Sources of Meteors on Earth and Beyond*, Cambridge
University Press 2019, arXiv:2010.16079 (PDF retrieved 2026-10-02, SHA-256
9b24c827f7d7d28d29611b6ea08fadc16d26c6920f4379d2b9566ef1aed29a86), Table 8.1 and equation (8.3).

Regenerate (sbpy installed to a scratch directory, for example
`uv pip install --python $ORACLE_PY --target <dir> sbpy==0.6.0 --no-deps`):
`source ~/Code/kshana-oracles/env.sh && PYTHONPATH=<dir> $ORACLE_PY tests/fixtures/bplane_heliocentric_oracle/make_fixture.py`
(deterministic inputs; GMAT's output is reproducible on the same build).
