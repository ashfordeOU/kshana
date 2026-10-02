# body_orientation_spice_oracle: provenance

`spice_orientation.csv` (rotation matrices J2000 -> IAU_<BODY>, `pxform`) and `spice_constants.csv`
(GM and RADII[0], `bodvcd`) were computed on 2026-10-02 by the NAIF SPICE Toolkit (CSPICE N0067,
through spiceypy 8.2.0, MIT licence) with `generate_body_orientation_spice_oracle.py`, which calls
no Kshana code, from:

| Input | URL | SHA-256 | Retrieved |
|---|---|---|---|
| `pck00011.tpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00011.tpc | 3dff7b1dbeceaa01f25467767d3fa25816051c85d162d1edf04acb310ee28bb1 | 2026-09-30 |
| `gm_de440.tpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/gm_de440.tpc | 924ddf4fb9ead9fe8a1aa55780bcabde40b09d00065d58226e24b68d8092f140 | 2026-09-30 |

Licence: NAIF generic kernels and SPICE outputs are public NASA/JPL data. Regenerate with:

    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/body_orientation_spice_oracle/generate_body_orientation_spice_oracle.py
