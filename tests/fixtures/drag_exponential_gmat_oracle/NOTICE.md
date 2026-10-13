# drag_exponential_gmat_oracle fixture

Used only by `tests/drag_exponential_gmat_oracle.rs`; not shipped in any published package.

- `drag_exponential_gmat_oracle.txt` (SHA-256 d7a85bfa0bc2198eef2c3e54409da6c70ac446e6d17bb73c4a91cc57d36ed887):
  GMAT reference states (4 cases × 2 runs, drag and no drag, × 25 hourly states). Generator
  `generate_drag_exponential_gmat_oracle.py`, which writes the GMAT script and runs `GmatConsole`;
  reproduce commands are in its docstring. This is tool output on synthetic initial states; no
  part of GMAT is included.

| Oracle | Version | Licence | Source |
|---|---|---|---|
| GMAT `GmatConsole`, ForceModel with `Drag.AtmosphereModel = Exponential`, PrinceDormand78 | R2022a (`gmat-ubuntu-x64-R2022a.tar.gz`, 390 518 023 bytes, build date 2023-01-10) | Apache-2.0 (`License.txt`, SourceForge repository tag GMAT-R2022a) | https://sourceforge.net/projects/gmat/ |

Generated 2026-10-13. Tolerances: `xval/drag-exponential-gmat/PREREGISTRATION.md`.
