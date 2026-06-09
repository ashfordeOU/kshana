---
title: 'Kshana: an open, reproducible PNT-resilience simulator with quantum-sensor performance models'
tags:
  - Rust
  - navigation
  - GNSS
  - PNT
  - quantum sensors
  - timing
  - simulation
  - WebAssembly
authors:
  - name: Chakshu Baweja
    orcid: 0000-0000-0000-0000
    affiliation: 1
affiliations:
  - index: 1
    name: Ashforde OÜ, Estonia
date: 8 June 2026
bibliography: paper.bib
---

<!--
FOUNDER ACTION (before submission to https://joss.theoj.org):
  * Replace the placeholder ORCID 0000-0000-0000-0000 with your real ORCID.
    JOSS validation rejects the all-zero placeholder.
  * Confirm a Kshana release is archived (Zenodo) and that the GitHub repository
    is public, as JOSS requires both at review time.
-->

# Summary

Kshana (क्षण, Sanskrit for *the precise instant*) is a deterministic, dependency-light
Rust engine — also callable from Python via PyO3 and runnable entirely in a web browser
via WebAssembly — that quantifies, in reproducible numbers, what quantum clocks, quantum
inertial sensors, and optical time transfer buy a navigation system over classical
positioning, navigation, and timing (PNT) during GNSS outages. Each sensor is an error
model plugged into a common simulation pipeline; the quantum and classical variants are
the *same code* driven by different published coefficients, so a comparison reflects the
sensors rather than two divergent implementations. Every result is reproducible from a
`scenario + seed + engine version` triple, and every sensor parameter is traceable to a
cited source. Fourteen scenario kinds cover clock holdover, inertial dead-reckoning,
optical/RF time transfer, hybrid and Kalman fusion, coupled GNSS/INS, orbit geometry and
dilution of precision, ARAIM integrity (terrestrial and lunar), measurement-domain GNSS
simulation, jamming and spoofing resilience, and one- and N-dimensional trade-study
sweeps. Outputs are versioned, self-describing JSON plus an SVG chart; the same core
compiles to native, Python, and WebAssembly targets without behavioural divergence.

# Statement of need

Resilient PNT means holding position and time when GNSS is denied or degraded. Quantum
sensors — optical clocks, cold-atom inertial sensors, and optical two-way time transfer —
promise far slower error growth across such gaps, but there is no *open, citable* tool
that quantifies that advantage honestly. Primes and agencies rebuild private, one-off
spreadsheets and notebooks whose assumptions are neither shared nor reproducible, so the
field has no neutral reference for "what resilience does this architecture buy?". Kshana
fills that gap with a single engine in which the quantum-versus-classical axis is a
parameter swap, not a fork, and in which every figure of merit is labelled *validated* or
*not-modeled*.

The intended audience is PNT researchers, GNSS/INS engineers, agency and prime evaluators,
and educators. Kshana complements rather than competes with the established tools. RTKLIB
[@takasu2009], gLAB, and Ginan post-process *real* signals; GMAT [@nasa_gmat] and Orekit
[@orekit] perform mission design and high-fidelity astrodynamics. Kshana is the upstream
performance-simulation layer that answers the resilience question *before* real signals
exist, and it exchanges data with those tools through standard formats — RINEX, IGS SP3,
and the CCSDS Orbit Mean-Elements Message (OMM) — so it slots into existing pipelines
rather than replacing them.

# State of the field

Real-signal processing is well served by RTKLIB [@takasu2009] and gLAB; astrodynamics and
mission design by GMAT [@nasa_gmat] and Orekit [@orekit]; SGP4/SDP4 propagation by mature
libraries including the `sgp4` crate [@sgp4crate]; and inertial-navigation simulation by
NaveGo [@gonzalez2017navego]. Each is strong in its niche, but none combines, in one
open and validated package, (1) a like-for-like quantum-versus-classical sensor comparison,
(2) SGP4/SDP4 propagation validated against the full community reference set, (3) RAIM/ARAIM
integrity for both terrestrial and lunar geometries, and (4) a zero-install in-browser
tier. Kshana occupies that intersection.

# Software design and functionality

Kshana is one engine with scenario-kind dispatch. A scenario is a small TOML document
whose `kind` selects one of fourteen packs: `clock`, `inertial`, `orbit`, `integrity`,
`lunar-integrity`, `timetransfer`, `hybrid`, `fusion`, `gnss-ins`, `gnss-sim`, `jamming`,
`spoof`, `sweep`, and `sweep-nd`. Sensor models — clocks, accelerometers, gyroscopes,
time-transfer links — are independent modules with a published `provenance` string; the
run harness composes them over a common timeline and emits a schema-versioned,
self-describing JSON document together with a standalone SVG chart. The engine has no
heavy runtime dependencies and the same core compiles to native binaries, a PyO3 Python
extension, and a WebAssembly module that powers the in-browser playground. Standard-format
interoperability (RINEX, SP3, CCSDS OMM) lets a Kshana constellation be exported to, or
seeded from, other tools.

# Validation

Kshana is validated against external oracles — published reference values and analytic
closed forms — never against its own output. The headline checks are:

- **SGP4/SDP4.** Worst-case position error 4.12 mm and velocity error 1.85 × 10⁻⁹ km/s
  against all 666 reference states in the AIAA 2006-6753 distribution (the de-facto
  community reference table) [@vallado2006], with an additional head-to-head against the
  independent `sgp4` crate agreeing to sub-micron level [@sgp4crate].
- **Allan deviation.** The engine reproduces the Stable32 [@stable32] reference deviations
  for the canonical NBS14 dataset to within 1 × 10⁻⁴, with the NBS14 values and method
  taken from the NIST handbook [@riley2008nist].
- **Geometry / dilution of precision.** For four lines of sight forming a regular
  tetrahedron the engine returns GDOP = √10 / 2 ≈ 1.5811, PDOP = 1.5, TDOP = 0.5, matching
  the analytic closed form for an isotropic position covariance [@misra2010; @kaplan2017].
- **Inertial error growth.** Accelerometer velocity- and angle-random-walk reproduce the
  NaveGo Microstrain 3DM-GX3-35 reference profile to better than 5 % [@gonzalez2017navego],
  consistent with the standard dead-reckoning error-growth relations [@groves2013].
- **Frame reduction.** Nutation and the CIO-based transformation match IAU SOFA / ERFA
  bit-for-bit — `eraNut00a` gives Δψ = −0.96309 × 10⁻⁵ rad, Δε = +0.40632 × 10⁻⁴ rad at
  JD_TT 2453736.5, reproduced to 1 × 10⁻¹³, and `eraXys06a` / `eraC2tcio` drive the
  celestial-to-terrestrial chain [@iausofa].
- **Two-body propagation.** The numerical propagator agrees with the universal-variable
  Kepler solution to sub-metre over 24 h, conserving energy and angular momentum to
  ~1 × 10⁻⁹ relative.

Across the packs, the same machinery yields the resilience figures that motivate the
tool: inertial dead-reckoning of ~41 m on a cold-atom accelerometer versus kilometre-scale
drift on a navigation-grade unit over the same 350 s outage (\autoref{fig:deadreckoning}),
and optical two-way time transfer of ~0.3 mm equivalent ranging versus ~150 mm for an RF
(TWSTFT) link [@giorgetta2013; @deschenes2016]. Quantum clock and inertial coefficients
trace to the strontium optical-lattice and cold-atom-interferometer literature
[@origlia2015; @templier2022].

![Dead-reckoning position error during a GNSS outage: the cold-atom (quantum)
accelerometer holds near the 100 m spec line while the navigation-grade unit diverges to
tens of kilometres over the same 350 s outage. Generated by Kshana from
`scenarios/imu-deadreckoning.toml`.\label{fig:deadreckoning}](figure-deadreckoning.png)

# AI usage disclosure

No generative-AI-authored content is attributed in this software. The repository enforces
a no-AI-attribution hygiene policy described in `CONTRIBUTING.md` and checked in CI by a
guard script; all sensor parameters trace to cited, published sources consolidated in
`docs/PROVENANCE.md`, and the test suite derives every expected value by hand from the
physics or from an external reference rather than from the engine itself.

# Acknowledgements

We thank the authors of the open reference tools and datasets Kshana validates against —
the AIAA 2006-6753 SGP4 reference distribution, the IAU SOFA / ERFA libraries, NaveGo, and
the NIST and Stable32 frequency-stability references — whose public artifacts make honest,
reproducible validation possible.

# References
