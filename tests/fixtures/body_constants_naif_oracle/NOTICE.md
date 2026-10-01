# body_constants_naif_oracle: provenance

`naif_body_constants.txt` holds constants read with the NAIF SPICE Toolkit (CSPICE N0067, through
spiceypy 8.2.0) `bodvcd` from:

| Input | URL | SHA-256 | Retrieved |
|---|---|---|---|
| `pck00011.tpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00011.tpc | 3dff7b1dbeceaa01f25467767d3fa25816051c85d162d1edf04acb310ee28bb1 | 2026-09-30 |
| `gm_de440.tpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/gm_de440.tpc | 924ddf4fb9ead9fe8a1aa55780bcabde40b09d00065d58226e24b68d8092f140 | 2026-09-30 |

Licence: NAIF generic kernels are public NASA/JPL data. Regenerate with
`generate_body_constants_naif_oracle.py`.
