# lunar_pa_orientation_spice_oracle: provenance

`spice_moon_pa_reference.csv` holds 2 000 MOON_PA_DE440 to J2000 rotation matrices computed by the
NAIF SPICE Toolkit (CSPICE N0067, through spiceypy 8.2.0, MIT) with `pxform`, evaluating the
binary PCK directly. It is derived output; no kernel is vendored.

| Input | URL | SHA-256 | Retrieved |
|---|---|---|---|
| `moon_pa_de440_200625.bpc` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de440_200625.bpc | 60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f | 2026-09-30 |
| `moon_de440_250416.tf` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/fk/satellites/moon_de440_250416.tf | a47c71e9c9f33796bdafb2c9d69a7ee447b6016ecad80f71cd6f3e479f9cf768 | 2026-09-30 |
| `naif0012.tls` | https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls | 678e32bdb5a744117a467cd9601cd6b373f0e9bc9bbde1371d5eee39600a039b | 2026-09-30 |

Licence: NAIF generic kernels are public data of NASA/JPL (US Government work). Regenerate with
`generate_lunar_pa_orientation_spice_oracle.py` (header of that file). Epochs: numpy
`default_rng(20261001)`, uniform in 2024-01-01 to 2025-12-31 TDB.
