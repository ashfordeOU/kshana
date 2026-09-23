<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Where Kshana sits

Kshana is a **PNT performance simulator**: you describe a scenario (sensors,
a GNSS outage, an attack) and it tells you how well timing and position hold up,
scored against operational figures of merit. It is **not** a carrier-phase GNSS
*processing* engine — there is no ambiguity resolution, no carrier smoothing and no
inter-epoch filter, so PPP and RTK are out of scope. It does have one foot in the
measurement domain: the `pvt` kind solves a receiver position from real RINEX code
pseudoranges plus broadcast ephemeris, validated against a surveyed IGS coordinate
(station ABMF, 2018-05-13) to **5.7 m 3-D RMS / 1.1 m horizontal**. But the product
is the performance study, not the positioning service, and the honest framing below
is meant to save a prospective user the wrong-tool disappointment.

## What Kshana is, and is not

| | Kshana | A GNSS processing engine (RTKLIB, gLAB) |
|---|---|---|
| Input | a scenario: sensor error models, outage windows, geometry — or, for `pvt`, a real RINEX observation file plus broadcast navigation | real GNSS observations (RINEX), ephemerides, corrections |
| Output | performance FoMs: holdover, timing/position error, availability, integrity/security bounds — plus a code-SPP position from the `pvt` kind | a position/velocity/time **solution** (SPP, PPP, RTK) |
| Question it answers | "how good *would* this architecture be, and where does it break?" | "given these measurements, where am I *now*?" |
| Quantum / optical sensors | first-class (optical clocks, cold-atom IMU, optical time transfer) | not modelled |
| Real-observation processing | code SPP from real RINEX observations (`pvt`, metre-level), plus geometry/DOP/availability — no carrier phase | the core competency, through to carrier-phase PPP/RTK |
| Install | zero — runs in a browser tab (WebAssembly) | native build / toolchain |

## Complementary, not competing — RTKLIB and gLAB

[RTKLIB](https://www.rtklib.com/) and [gLAB](https://gage.upc.edu/en/learning-materials/software-tools/glab-tool-suite)
are mature, widely used GNSS processing suites. They take real measurements and
produce a positioning solution (SPP/PPP/RTK; gLAB is also a superb teaching
tool with strong ESA/EGNOS heritage). Kshana does **not** replace them and does
not try to. Its observation path stops at code single-point positioning: no ambiguity
resolution, no carrier smoothing, no inter-epoch filter, and no troposphere/ionosphere
*estimation* — `pvt` applies Saastamoinen/Niell and the L1/L2 ionosphere-free
combination, it does not solve for them as states.

The pipeline is complementary:

- **RTKLIB / gLAB** answer *"where am I, from these signals?"*
- **Kshana** answers *"how long do I keep a good answer when those signals stop —
  and how much does a quantum clock or cold-atom IMU buy me?"*

A natural workflow uses a processing engine for the GNSS-available segment and
Kshana to study the **holdover** behaviour and the sensor trade space around it.
If you need carrier-phase positioning — PPP, RTK, ambiguity resolution — use RTKLIB
or gLAB; if you need to reason about resilience, autonomy, and quantum-sensor
advantage, that is the gap Kshana fills.

## The distinctive wedge: a zero-install browser tier

Most simulation tools in this space (RTKLIB, gLAB, GMAT, Orekit, STK) require a
native install or a licence, and a non-trivial learning curve before the first
result. Kshana compiles to WebAssembly and runs **entirely in the browser** —
the [playground](../web/README.md) loads a worked scenario, runs the real engine
client-side (nothing is uploaded), and shows the result in seconds. Guided
sliders and one-click scenarios mean the first useful result needs no TOML and no
toolchain.

That zero-install tier is a deliberate position, not an accident:

- **Reach** — a reviewer, student, or procurement officer can try the actual
  engine from a link, on any device, with no setup. Adoption friction for a
  first look drops to a single click.
- **Reproducibility** — the same WebAssembly build that ships in the browser is
  the library that ships on crates.io/PyPI/npm; a result is reproducible from
  `scenario + seed + engine version`, and a run is shareable as a URL.
- **Honesty** — running the engine yourself, in the open, is the strongest
  counter to "trust the numbers": the browser tier *is* the audit surface.

The browser tier does not make Kshana a replacement for a desktop processing
suite — it makes the performance-trade-study question approachable to people who
would never install one. That is where Kshana intends to own the space.

## See also

- [`CAPABILITY.md`](CAPABILITY.md) — the honest, row-by-row scope map (the `pvt`
  solver's full scope and residuals are in the **GNSS / PNT processing** row).
- [`VALIDATION.md`](VALIDATION.md) — what is validated, with evidence.
- [`web/README.md`](../web/README.md) — the browser playground.
