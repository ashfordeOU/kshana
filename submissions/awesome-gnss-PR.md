<!-- SPDX-License-Identifier: Apache-2.0 -->
# FOUNDER ACTION — awesome-gnss listing

- **Destination:** https://github.com/barbeau/awesome-gnss (fork → edit `README.md` → open PR)
- **Section:** `Libraries and interfaces`
- **What to do:** add the single bullet below in alphabetical order within that section
  (Kshana sorts after "K"-prefixed entries; place it where the K's go), commit, and open
  the PR with the title and body below.
- **Founder-only:** a GitHub account (you have one); link the JOSS paper here once accepted.

## Exact one-line diff to add under "Libraries and interfaces"

```markdown
- **Kshana** ([Docs](https://github.com/ashfordeOU/kshana), [Playground](https://kshana.dev), [Source code](https://github.com/ashfordeOU/kshana)) - "Open, reproducible PNT-resilience simulator (Rust/WASM/Python) comparing quantum vs classical clocks and inertial sensors; SGP4 validated to 4.12 mm against all 666 AIAA 2006-6753 vectors."
```

## PR title

```
Add Kshana — open PNT-resilience simulator (Rust/WASM/Python)
```

## PR body

```
Kshana is an open-source (Apache-2.0) PNT-resilience simulator that compares quantum and
classical clocks, inertial sensors, and time transfer through GNSS outages, scored against
operational figures of merit. Its SGP4/SDP4 propagator is validated to 4.12 mm against all
666 AIAA 2006-6753 reference vectors, it reads/writes RINEX, SP3, and CCSDS OMM, and it runs
entirely in the browser via WebAssembly with a Python API. It fits the "Libraries and
interfaces" section as an upstream performance-simulation layer that complements real-signal
tools like RTKLIB and gLAB.

A peer-reviewed paper is in submission to the Journal of Open Source Software; I will add the
DOI here once it is accepted.
```
