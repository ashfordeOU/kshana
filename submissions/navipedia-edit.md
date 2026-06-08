<!-- SPDX-License-Identifier: Apache-2.0 -->
# FOUNDER ACTION — ESA Navipedia listing

- **Destination:** https://gssc.esa.int/navipedia/ (MediaWiki)
- **Account:** Navipedia requires a **registered editor account** — request/sign-in is
  FOUNDER-GATED. Use contact@ashforde.org. Account requests go through the Navipedia
  "Request an account" / contact link; editing is disabled until approved.
- **What to do:**
  1. Create a new page titled **Kshana** with the article wikitext below.
  2. Add the table row below to the relevant tools/simulation listing page
     (category "GNSS Simulation Tools").
- **Founder-only:** the Navipedia login; confirm the category name matches the live wiki
  (it may be `Category:GNSS Simulation Tools` or a parent `Category:Tools`).

## New page wikitext — [[Kshana]]

```wikitext
'''Kshana''' is an open-source ([https://www.apache.org/licenses/LICENSE-2.0 Apache-2.0]) PNT-resilience simulator developed by Ashforde OÜ. It compares quantum and classical clocks, inertial sensors and time-transfer through GNSS outages, scoring operational figures of merit. Its SGP4/SDP4 propagator is validated to 4.12 mm against all 666 [http://celestrak.org AIAA 2006-6753] reference vectors. It reads/writes RINEX, SP3 and CCSDS OMM, runs in the browser via WebAssembly, and exposes a Python API. [https://github.com/ashfordeOU/kshana Source] · [https://kshana.dev Playground].

Kshana is the upstream performance-simulation layer of a PNT toolchain: it answers "what resilience does an architecture buy" before real signals exist, complementing real-signal processors (RTKLIB, gLAB) and mission-design tools (GMAT, Orekit). Every result is reproducible from a scenario, seed and engine version, and every sensor parameter is traceable to a published source.

[[Category:GNSS Simulation Tools]]
[[Category:Tools]]
```

## Table row to add on the simulation-tools listing page

```wikitext
| [[Kshana]] || Ashforde OÜ || Apache-2.0 || Rust / WASM / Python || PNT-resilience simulation; quantum vs classical clocks, inertial, time transfer; SGP4 validated to 4.12 mm; RINEX/SP3/CCSDS OMM I/O || [https://kshana.dev kshana.dev]
```
