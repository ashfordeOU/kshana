# lunar_service_geometry_oracle: provenance

`anise_look_angles_reference.txt` is output of ANISE 0.10.2 (Nyx Space, MPL-2.0, run as a tool in
the workspace-excluded crate `xval/anise-service-geometry`, binary `lunar-look-angles-xval`, which
calls no Kshana code). It is derived output; no kernel and no ANISE code is vendored.

| Input | URL | SHA-256 | Retrieved |
|---|---|---|---|
| `de440s.bsp` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp | c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2 | 2026-09-30 |
| `moon_pa_de440_200625.bpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de440_200625.bpc | 60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f | 2026-09-30 |
| `pck00011.tpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00011.tpc | 3dff7b1dbeceaa01f25467767d3fa25816051c85d162d1edf04acb310ee28bb1 | 2026-09-30 |
| `gm_de440.tpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/gm_de440.tpc | 924ddf4fb9ead9fe8a1aa55780bcabde40b09d00065d58226e24b68d8092f140 | 2026-09-30 |

Licence: NAIF kernels are public NASA/JPL data. Regenerate:
`source ~/Code/kshana-oracles/env.sh; cd xval/anise-service-geometry; cargo run --release --bin lunar-look-angles-xval`.
