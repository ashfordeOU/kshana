# Fixture: common-mode split, numpy least-squares oracle on parity-bearing inputs

Used by `tests/lunar_common_mode_parity_numpy_oracle.rs`. Generated 2026-10-01 by
`make_fixture.py` (run with the oracle Python environment, numpy 2.3.5).

| File | Content | SHA-256 |
|---|---|---|
| `inputs.json` | user and 8 satellite positions (copied from `../common_mode/reference.json`), two geometries (8 satellites; satellites 1 to 6), 1464 measurement-error vectors `δy = E·Δs + w` (17 significant digits) | 6b7877c52205757bdc7ebe0af96d5c699cacd420c44d2adf95a84f1a060c9ef1 |
| `numpy_reference.json` | numpy `linalg.lstsq` (LAPACK `gelsd`) state error, parity residual and norms per case | 31e52e6d2d4b137a85f54030c1cfecd55f10bbdf639a69c38dd8a9a3686e4cbb |

Sources of the inputs:
- `Δs`: the real geocentric Moon differences DE440 − INPOP21a and DE440 − EPM2021, 366 epochs,
  from `../inter_ephemeris/moon_geo.csv` (SHA-256 3eb39e3d1ffdbaaa2fb1b9032a37cb819d65d6dca5eeb5f18dbb7ccdad22afd9;
  provenance and licences in `../inter_ephemeris/NOTICE.md`: JPL, IMCCE, IAA RAS).
- Geometry: the modelled lunar constellation of `../common_mode/reference.json` (SHA-256
  e74c11af9eb2df1a60af06f5a80ab9c3d1cbe3c6a554c089f3c4b376eb228e0b; see `../common_mode/NOTICE.md`).
- `w`: independent per-satellite errors, normal with standard deviation 1 m, drawn once from
  `numpy.random.default_rng(20261001)`. They are a constructed input that gives every case a
  parity part; they are not a claim about any real error source.

Oracle: numpy (BSD-3-Clause) `linalg.lstsq`, a singular-value-decomposition least-squares solve,
run as a separate program; only its printed numbers are committed.
