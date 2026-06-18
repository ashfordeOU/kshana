<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# FOUNDER ACTION — conference abstracts (ION GNSS+ 2026, IAC 2026)

- **ION GNSS+ 2026:** submit via the Institute of Navigation abstract portal
  (https://www.ion.org/gnss/). Suggested session: "Alternative Sensors for Navigation" /
  "Robust PNT". Hard submission deadline applies — check the call for papers.
- **IAC 2026:** submit via the International Astronautical Federation portal
  (https://www.iafastro.org). Symposium **B2 — Space Communications and Navigation**. IAC
  abstracts often route through a **national delegation / IAF membership** — confirm the
  routing for Estonia/Germany before the deadline (FOUNDER-GATED).
- **Founder-only:** ION/IAF accounts; author/affiliation block; pick the exact session/
  symposium sub-category from the live call.

---

## ION GNSS+ 2026 abstract (~250 words)

**Title:** Kshana: An Open, Reproducible Engine for Quantifying the Quantum-Sensor
Advantage in GNSS-Denied PNT

```
Resilient positioning, navigation and timing (PNT) requires holding position and time when
GNSS is denied. Quantum sensors — optical clocks, cold-atom inertial sensors, and optical
two-way time transfer — promise far slower error growth across outages, yet there is no
open, citable tool to quantify that advantage honestly; primes and agencies rebuild private
one-off analyses whose assumptions are never shared.

We present Kshana, an open-source (AGPL-3.0) Rust engine, also callable from Python and
runnable in the browser via WebAssembly, in which the quantum-versus-classical axis is a
parameter swap rather than a fork: both variants are the same code driven by different
published coefficients. Fourteen scenario kinds span clock holdover, inertial dead-reckoning,
optical/RF time transfer, hybrid and Kalman fusion, coupled GNSS/INS, orbit geometry and
DOP, RAIM/ARAIM integrity, jamming and spoofing.

Validation uses external oracles, never self-comparison: SGP4/SDP4 to 4.12 mm against all
666 AIAA 2006-6753 vectors; Allan deviation against Stable32 NBS14 references to 1e-4;
regular-tetrahedron DOP against the closed form GDOP = sqrt(10)/2; and inertial random-walk
against the NaveGo reference profile to within 5%. Representative results: clock holdover
through zero-satellite gaps, inertial dead-reckoning of ~41 m (cold-atom) versus kilometres
(navigation-grade), optical time transfer of ~0.3 mm versus ~150 mm (RF) equivalent ranging,
and geometry-derived availability.

Kshana offers the community a neutral, reproducible reference — every result fixed by
scenario, seed and engine version — for evaluating PNT-resilience architectures before real
signals exist.
```

---

## IAC 2026 abstract (~250 words) — Symposium B2

**Title:** Open and Reproducible Simulation of Quantum vs Classical PNT Resilience for
Space Systems

```
Spacecraft operating inside and beyond the GNSS shell — and lunar assets entirely outside
it — need PNT that survives weak or absent GNSS. Quantum clocks and cold-atom inertial
sensors promise the autonomy to do so, but the community lacks an open, reproducible way to
quantify what such an architecture actually buys for a space mission.

We present Kshana, an open-source (AGPL-3.0) PNT-resilience simulator (Rust, with Python
and in-browser WebAssembly bindings) in which quantum and classical sensors are the same
code driven by different published coefficients. For space systems it provides geometry-
driven availability and dilution of precision for users inside the GNSS shell; a lunar
ARAIM pack that computes south-pole protection levels against a representative LunaNet relay
set; and CCSDS OMM and IGS SP3 interoperability so constellations exchange with existing
flight-dynamics tooling. SGP4/SDP4 propagation is validated to 4.12 mm against all 666 AIAA
2006-6753 reference vectors, frame reduction matches IAU SOFA/ERFA bit-for-bit, and DOP
matches the regular-tetrahedron closed form GDOP = sqrt(10)/2 — all external oracles, not
self-comparison.

Because the engine compiles to WebAssembly, any reviewer can reproduce a result in a browser
with no install, and every result is fixed by scenario, seed and engine version. Kshana thus
offers space-segment architects a neutral, citable benchmark for cislunar and Earth-orbit
PNT resilience, answering "what resilience does this architecture buy" before signals or
hardware exist. We discuss validation, the cislunar/LunaNet integrity case, and the
open, reproducible workflow.
```
