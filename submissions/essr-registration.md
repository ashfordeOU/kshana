<!-- SPDX-License-Identifier: Apache-2.0 -->
# FOUNDER ACTION — ESA ESSR registration

- **Destination:** https://essr.esa.int (ESA Software Selection / Source-code Registry).
- **Account:** ESSR requires an **ESA-STAR / ESSR account** (FOUNDER-GATED login). The
  entity is already ESA-STAR-registered: **entity id 83208**, SSO **contact@ashforde.org**,
  nationality **DE (Germany)** — select this org when prompted so the registration attaches
  to the right entity.
- **Pre-checks before submitting:** confirm the GitHub repo is public, the Zenodo DOI
  resolves, and (if claiming the playground) https://kshana.dev is live.

## Metadata fieldset to fill

| Field | Value |
|-------|-------|
| Software name | Kshana |
| Short description | Open, reproducible PNT-resilience simulator comparing quantum vs classical clocks, inertial sensors and time transfer through GNSS outages. |
| Long description | Kshana quantifies, in reproducible numbers, what quantum clocks, quantum inertial sensors and optical time transfer buy a navigation system over classical PNT during GNSS outages. Fourteen scenario kinds span clocks, inertial, time transfer, fusion, GNSS/INS, orbit geometry/DOP, terrestrial and lunar ARAIM integrity, GNSS measurement simulation, jamming and spoofing. SGP4/SDP4 is validated to 4.12 mm against all 666 AIAA 2006-6753 vectors; frame reduction matches IAU SOFA/ERFA. Reads/writes RINEX, SP3 and CCSDS OMM. Runs native, in Python, and in the browser via WebAssembly. |
| Owner / organisation | Ashforde OÜ (ESA-STAR entity id 83208) |
| Contact | contact@ashforde.org |
| Nationality | DE (Germany) |
| License | Apache-2.0 (OSI-approved, permissive) |
| Source repository | https://github.com/ashfordeOU/kshana |
| Homepage / playground | https://kshana.dev |
| DOI | 10.5281/zenodo.20528627 (concept DOI) |
| Programming languages | Rust; Python (PyO3); WebAssembly |
| Category / domain | Navigation / PNT; GNSS; simulation; quantum sensing |
| Keywords | PNT, GNSS, navigation, quantum sensors, timing, integrity, ARAIM, simulation |
| Maturity / TRL | Pre-1.0 validated simulation substrate; validated against external references (see docs/VALIDATION.md). |
| Standards interoperability | RINEX, IGS SP3, CCSDS OMM (502.0-B-2) |
| Export-control note | Public repository limited to generic, published models and methods (see CONTRIBUTING.md export-control section). |

## Submission text (paste into the free-text/abstract field)

```
Kshana is an open-source (Apache-2.0) PNT-resilience simulator developed by Ashforde OÜ. It
compares quantum and classical clocks, inertial sensors and time transfer through GNSS
outages, scoring operational figures of merit, with every sensor parameter traceable to a
published source and every result reproducible from scenario, seed and engine version. The
SGP4/SDP4 propagator is validated to 4.12 mm against all 666 AIAA 2006-6753 reference
vectors; frame reduction matches IAU SOFA/ERFA bit-for-bit; DOP matches the regular-
tetrahedron closed form. It reads/writes RINEX, SP3 and CCSDS OMM, runs in the browser via
WebAssembly, and exposes a Python API. The engine is the upstream performance-simulation
layer of a PNT toolchain, complementing real-signal processors and mission-design tools.
```
