<!-- SPDX-License-Identifier: Apache-2.0 -->
# FOUNDER ACTION — research-software registries (NOT code.nasa.gov)

## Honesty correction: do NOT submit to code.nasa.gov

`code.nasa.gov` and `nasa/Open-Source-Catalog` list **only NASA-developed software approved
by a NASA Field Center Software Release Authority (SRA)** — see the guidance at
https://code.nasa.gov/#/guide. Kshana is not NASA-developed, so a catalog PR would be
closed. Submit instead to the registries below, which **accept third-party software** and
deliver the same goal (discoverability + citations), then list on the GNSS/PNT "awesome"
list (see `awesome-gnss-PR.md`).

---

## (1) ASCL — Astrophysics Source Code Library (highest value: ADS-indexed → real citations)

- **Destination:** https://ascl.net (use "Submit a code"). ASCL accepts any astro-relevant
  code from any author; it assigns an `ascl:YYMM.NNN` ID that NASA ADS indexes, so the
  listing earns citations.
- **Account:** a free ASCL submitter account (FOUNDER-GATED login). Use contact@ashforde.org.
- **Ready-to-paste submission fields:**

```
Title:    Kshana: PNT-resilience simulator with quantum-sensor performance models
Credit:   Baweja, Chakshu
Site:     https://github.com/ashfordeOU/kshana
Download: https://github.com/ashfordeOU/kshana
DOI:      10.5281/zenodo.20528627
License:  Apache-2.0
Language: Rust (with Python and WebAssembly bindings)

Abstract (~60 words):
Kshana is an open, reproducible simulator for positioning, navigation and timing (PNT)
resilience. It compares quantum and classical clocks, inertial sensors and time transfer
through GNSS outages, scoring operational figures of merit. Its SGP4/SDP4 propagator is
validated to 4.12 mm against all 666 AIAA 2006-6753 reference vectors; it reads/writes
RINEX, SP3 and CCSDS OMM and runs in the browser via WebAssembly.
```

---

## (2) Research Software Directory

- **Destination:** https://research-software-directory.org (accepts third-party research
  software; good cross-discipline discoverability).
- **Fields:** name `Kshana`; short description = the ASCL abstract above; repository
  `https://github.com/ashfordeOU/kshana`; DOI `10.5281/zenodo.20528627`; license `Apache-2.0`;
  keywords `PNT, GNSS, navigation, quantum sensors, timing, simulation`.

---

## (3) re3data / NASA TOPS (conditional)

- **re3data** (https://www.re3data.org) indexes research-data/software registries; list
  the Zenodo record there if not already covered by the concept DOI.
- **NASA TOPS / Open-Source Science** ecosystem listings apply **only if a collaboration
  exists**; do not self-list as NASA software. Pursue only through an actual NASA partner.
