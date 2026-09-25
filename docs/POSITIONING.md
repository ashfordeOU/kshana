<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Where Kshana sits

Kshana is an open, reproducible **PNT (positioning, navigation and timing) resilience
evidence engine**. You describe a scenario — the sensors or clocks, a GNSS (global
navigation satellite system) outage, a jamming or spoofing attack, a budget — and it
tells you how well time and position hold up, scored against operational figures of
merit (FoMs). Each capability behind those figures is labelled in a machine-checked
matrix as **VALIDATED** (checked against an independent external oracle), **MODELLED**
(internally consistent, not externally checked) or **PARTNER** (owned by a hardware
partner). This page says where it leads, what it is for, and what it is not.

## Where it leads: timing and holdover for critical infrastructure

The best-validated part of the engine is timing. Telecom networks, power grids and
financial venues take their time from GNSS, and each has to size **holdover**: how long a
local clock can free-run through a GNSS loss before its time error breaks the budget.

- **What is VALIDATED.** The frequency-stability estimators a holdover answer is built
  from — Allan deviation (ADEV), modified Allan deviation (MDEV), time deviation (TDEV),
  maximum time interval error (MTIE) and the extended-range Theo1 estimator — are checked
  against Stable32 reference deviations, the independent `allantools` library and a real
  measured caesium clock. The holdover coast-variance calculation and its inversion to a
  holdover time are checked against SciPy. See
  [`VERIFICATION-MATRIX.md`](VERIFICATION-MATRIX.md) for each row, its test and its oracle.
- **What stays MODELLED.** The per-clock-class noise floors (for example the long-term
  floor of a given oscillator class) set the answer for a stable clock, and they are
  representative figures, not measurements of your device. Supply measured floors for a
  number you intend to defend.
- **Telecom units.** The `telecom-timing` scenario kind reports MTIE and TDEV, checks
  them against the masks of the International Telecommunication Union Telecommunication
  Standardization Sector (ITU-T) — G.8272 for a primary reference time clock (PRTC),
  G.8272.1 for an enhanced PRTC (ePRTC) and G.8273.2 for a telecom boundary clock
  (T-BC) — and sizes holdover. See [`TELECOM-TIMING.md`](TELECOM-TIMING.md).

## What makes it different

The physics and the standards are not the difference: Simplified General Perturbations 4
(SGP4) propagation, Allan deviation, reference frames and dilution of precision are
available, free and correct, in other libraries, and Kshana checks itself against several
of them. The difference is the evidence discipline:

- **Open.** The engine is under the GNU Affero General Public License (AGPL), so anyone
  can read and rerun it. A commercial licence exists for closed integration.
- **Reproducible.** A result is determined by `scenario + seed + engine version`, bit for
  bit, and a run can be shared as a link to the browser playground.
- **Provenance-labelled.** Every sensor parameter is traced to a published source
  ([`PROVENANCE.md`](PROVENANCE.md)), and every capability carries its
  VALIDATED / MODELLED / PARTNER tier. A continuous-integration (CI) guard refuses a
  VALIDATED row with no independent external oracle, so an internal self-check cannot be
  presented as a validation.

We have not found another open tool that combines these across holdover, integrity,
inertial coasting and quantum sensors, but a search that finds nothing is not proof that
nothing exists; we do not claim to be the only one.

## Quantum: a neutral trade method, results labelled MODELLED

Kshana compares quantum and classical clocks and inertial sensors on the same scenario
with the same code: each device is an error model, and the engine does not know which
one is "quantum". Treat it as **a neutral quantum-vs-classical trade method whose results
are labelled MODELLED**. Most inputs are published Allan/noise-budget coefficients; the
cold-atom-interferometer accelerometer has a first-principles layer that derives its noise
coefficient. A partner's measured Allan-deviation data can be fed in through the
`quantum-trade` kind, which is the route for promoting a specific device's figures. See
[`QUANTUM.md`](QUANTUM.md) and [`QUANTUM-MODELS.md`](QUANTUM-MODELS.md).

## Lunar, cislunar and deep space: maintained, not the headline

The lunar / cislunar suite (lunar integrity monitoring, the Earth–Moon three-body core,
lunar time scales, service-volume analysis) and the deep-space radiometric-navigation
engine are maintained capabilities. Most of their rows are MODELLED, and dedicated tools
already serve lunar navigation, so they are offered as capabilities of the same engine,
each with its own tier, rather than as the lead.

## What Kshana is not

- **Not a radio-frequency (RF) signal simulator or hardware-in-the-loop (HIL) rig.**
  Generating real signals and testing receivers is the job of RF simulators; Kshana works
  at the level of error models and link budgets, before hardware or lab time is bought.
- **Not a replacement for MATLAB/Simulink, STK (Systems Tool Kit) or Orekit.** It sits
  next to them. It reads and writes the exchange formats they use — CCSDS (Consultative
  Committee for Space Data Systems) Orbit Ephemeris Messages, SP3 (Standard Product 3)
  precise orbits, RINEX (Receiver Independent Exchange Format) — and its numerical force
  model is cross-checked against Orekit rather than offered in its place.
- **Not a carrier-phase GNSS processing engine** (see below).
- **Not a certification authority.** A VALIDATED label means a capability matches an
  external oracle; it is not a certification of any product or operator.

## What Kshana is, and is not, next to a GNSS processing engine

Kshana is **not** a carrier-phase GNSS *processing* engine — there is no ambiguity
resolution, no carrier smoothing and no inter-epoch filter, so precise point positioning
(PPP) and real-time kinematic (RTK) positioning are out of scope. It does have one foot in
the measurement domain: the `pvt` kind (position, velocity and time) solves a receiver
position from real RINEX code pseudoranges plus broadcast ephemeris, validated against a
surveyed coordinate of the International GNSS Service (IGS) (station ABMF, 2018-05-13) to
**5.7 m 3-D RMS (root mean square) / 1.1 m horizontal**. But the product is the performance
study, not the positioning service, and the framing below is meant to save a prospective
user the wrong-tool disappointment.

| | Kshana | A GNSS processing engine (RTKLIB, gLAB) |
|---|---|---|
| Input | a scenario: sensor error models, outage windows, geometry — or, for `pvt`, a real RINEX observation file plus broadcast navigation | real GNSS observations (RINEX), ephemerides, corrections |
| Output | performance FoMs: holdover, timing/position error, availability, integrity/security bounds — plus a code single-point-positioning (SPP) position from the `pvt` kind | a position/velocity/time **solution** (SPP, PPP, RTK) |
| Question it answers | "how good *would* this architecture be, and where does it break?" | "given these measurements, where am I *now*?" |
| Quantum / optical sensors | modelled as error models (optical clocks, cold-atom inertial measurement unit (IMU), optical time transfer), results labelled MODELLED | not modelled |
| Real-observation processing | code SPP from real RINEX observations (`pvt`, metre-level), plus geometry / dilution of precision (DOP) / availability — no carrier phase | the core competency, through to carrier-phase PPP/RTK |
| Install | zero — runs in a browser tab (WebAssembly) | native build / toolchain |

## Complementary, not competing — RTKLIB and gLAB

[RTKLIB](https://www.rtklib.com/) and [gLAB](https://gage.upc.edu/en/learning-materials/software-tools/glab-tool-suite)
are mature, widely used GNSS processing suites. They take real measurements and
produce a positioning solution (SPP/PPP/RTK; gLAB is also a superb teaching
tool with strong heritage at the European Space Agency (ESA) and the European
Geostationary Navigation Overlay Service (EGNOS)). Kshana does **not** replace them and does
not try to. Its observation path stops at code single-point positioning: no ambiguity
resolution, no carrier smoothing, no inter-epoch filter, and no troposphere/ionosphere
*estimation* — `pvt` applies the Saastamoinen/Niell troposphere models and the L1/L2
ionosphere-free combination, it does not solve for them as states.

The pipeline is complementary:

- **RTKLIB / gLAB** answer *"where am I, from these signals?"*
- **Kshana** answers *"how long do I keep a good answer when those signals stop —
  and how much does a better clock or inertial sensor, classical or quantum, buy me?"*

A natural workflow uses a processing engine for the GNSS-available segment and
Kshana to study the **holdover** behaviour and the sensor trade space around it.
If you need carrier-phase positioning — PPP, RTK, ambiguity resolution — use RTKLIB
or gLAB; if you need reproducible, labelled evidence about resilience and holdover,
that is the job Kshana is built for.

## A zero-install browser tier

Most simulation tools in this space (RTKLIB, gLAB, the General Mission Analysis Tool
(GMAT), Orekit, STK) require a native install or a licence, and a learning curve before
the first result. Kshana compiles to WebAssembly and runs **entirely in the browser** —
the [playground](../web/README.md) loads a worked scenario, runs the real engine
client-side (nothing is uploaded), and shows the result in seconds. Guided
sliders and one-click scenarios mean the first useful result needs no TOML (Tom's
Obvious Minimal Language, the scenario file format) and no toolchain.

That zero-install tier is a deliberate position:

- **Reach** — a reviewer, student, or procurement officer can try the actual
  engine from a link, on any device, with no setup.
- **Reproducibility** — the same engine that ships in the browser is the library that
  ships on crates.io, the Python Package Index (PyPI) and npm; a result is reproducible
  from `scenario + seed + engine version`, and a run is shareable as a URL.
- **Honesty** — running the engine yourself, in the open, is the strongest
  counter to "trust the numbers": the browser tier *is* the audit surface.

The browser tier does not make Kshana a replacement for a desktop processing
suite — it makes the performance-trade-study question approachable to people who
would never install one.

## See also

- [`CAPABILITY.md`](CAPABILITY.md) — the row-by-row scope map (the `pvt`
  solver's full scope and residuals are in the **GNSS / PNT processing** row).
- [`VALIDATION.md`](VALIDATION.md) — what is validated, with evidence.
- [`TELECOM-TIMING.md`](TELECOM-TIMING.md) — the telecom timing kind and its masks.
- [`GLOSSARY.md`](GLOSSARY.md) — plain-language definitions of the terms used here.
- [`web/README.md`](../web/README.md) — the browser playground.
