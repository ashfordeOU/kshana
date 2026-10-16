# Provenance: DE421 ME->PA offset, SPICE

`spice_me_to_pa.csv`: `pxform('MOON_ME', 'MOON_PA', et)` at three TDB epochs (2000-01-01,
2022-01-01, 2030-01-01), computed on 2026-10-13 by the NAIF SPICE Toolkit (CSPICE N0067 through
spiceypy 8.3.0, MIT) with `generate.py`, which calls no Kshana code, after the pre-registration
`docs/design/evidence/fut05b-me-pa-offset-sign/PREREGISTRATION.md` (e1ead19b), from:

| Kernel | URL | SHA-256 | Retrieved |
|---|---|---|---|
| `moon_080317.tf` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/fk/satellites/moon_080317.tf | 78732477b96f9863e7b0d65bcee3c22b8707ca5ed0db56d1173319cb2e8c7993 | 2026-10-13 |
| `moon_pa_de421_1900-2050.bpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de421_1900-2050.bpc | 656f90616403d75a75f0cd6c8830fc5b44f8cb4facb5ccb8915e752b397520cf | 2026-10-13 |

Public NASA/JPL data; the kernels are not redistributed. Regenerate with:

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/lunar_me_pa_offset_spice/generate.py
