# Fixture: LEO polar coverage sweep against Orekit 12.2 and NumPy (row M131)

Used by `tests/leo_polar_coverage_orekit_oracle.rs`. Generated 2026-10-02 by `generate.sh`
(run from the repository root after `source ~/Code/kshana-oracles/env.sh`).

| File | Source | Licence |
|---|---|---|
| `variant_masks_clocks.toml` | Configuration B, written for this comparison | AGPL-3.0-only (this project) |
| `inputs_A.json`, `inputs_B.json` | Sweep grid and each system's role, mask and clock model, written by `examples/gen_leo_polar_coverage_oracle_inputs.rs` | AGPL-3.0-only (this project) |
| `states_A.csv`, `states_B.csv` | The engine's Earth-fixed satellite states at every epoch (the input both sides share; propagation is out of scope of the comparison) | AGPL-3.0-only (this project) |
| `LeoPolarOrekitDriver.java` | Driver run as a separate program against Orekit 12.2 (Apache-2.0, `orekit-12.2.jar`, Hipparchus 3.1, orekit-data-main) | AGPL-3.0-only (driver); Orekit is not vendored |
| `oracle_numpy.py` | Aggregation and the NumPy 2.3.5 (BSD-3-Clause; LAPACK from OpenBLAS 0.3.30) inverse for multi-clock groups | AGPL-3.0-only (script) |
| `oracle_A.json`, `oracle_B.json` | Oracle output: per-sample in-view counts per system with the nearest mask margin, and per-latitude, per-group mean in view, median PDOP/HDOP/VDOP and availability | numbers computed by Orekit and NumPy |

The raw per-sample Orekit text output (`orekit_<c>.txt`, about 6 MB with every line-of-sight
vector) is removed by `generate.sh` after aggregation and is not committed.

SHA-256:

```
a5d95588d7f4210b30b70c64805540ac70cc91c582399dd6b6ca1c9dc8267589  inputs_A.json
29e6ce51e0cb52054c35b5f260415f4cd779980dd8723bf8fe929b0c6e428cc6  inputs_B.json
66e173d20a667a7fc9552718d96d39fa482df9d10f25e4a49e0a99180356d7dd  states_A.csv
d252e755504fe513358989a97f868331e32fe3ef5739700f241c542b0e801dd4  states_B.csv
5f0eb4bcc21b84a9ef762b60ed77bd767c788dd6c9b2c9961a51ee3500ba7696  oracle_A.json
b79822a02d0629322138817c455abe7e792fad1692ecdbc782b2163424f2a0db  oracle_B.json
7b7a72aa2b7a70bbe266480b7d5b55dc2f3426cd7af9151bcbd7597619683b4d  variant_masks_clocks.toml
```

Oracle self-checks at generation: Orekit's `Ephemeris` (states carried to GCRF by Orekit's
frame transform for interpolation) reproduces the tabulated ITRF positions to 7.0e-8 m;
Orekit `DOPComputer` and the NumPy inverse agree to 1.9e-10 relative where one clock unknown
applies.
