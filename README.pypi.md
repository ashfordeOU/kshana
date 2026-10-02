<!-- Surface README for PyPI. Images and links are ABSOLUTE (pinned to /main)
     because PyPI does not rewrite relative paths. The canonical, full README is README.md on
     GitHub. To re-pin images to an immutable release tag at publish time, replace `/main/`
     with `/vX.Y.Z/` across this file (one sed). -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/kshana-logo-dark.svg">
    <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/kshana-logo-light.svg" alt="Kshana: the mark, a compass reticle marking the precise instant, beside the wordmark kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>the precise instant</em></strong><br>
  An open-source simulator for PNT (positioning, navigation and timing) resilience.
</p>

<p align="center">
  <a href="https://github.com/AshfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.29.3-066A86?style=flat-square&labelColor=0A1226" alt="Release v0.29.3"></a>
  <a href="https://github.com/AshfordeOU/kshana/blob/main/docs/VERIFICATION-MATRIX.md"><img src="https://img.shields.io/badge/validated-112%20external%20oracles-377D0C?style=flat-square&labelColor=0A1226" alt="112 of 228 capabilities validated against independent external oracles"></a>
  <a href="https://github.com/AshfordeOU/kshana/blob/main/docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" alt="About 95% line coverage, gated at 85% in continuous integration"></a>
  <a href="https://github.com/AshfordeOU/kshana/blob/main/LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0--only-3F4B67?style=flat-square&labelColor=0A1226" alt="Licence: AGPL-3.0-only, or a commercial licence"></a>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-10.5281%2Fzenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" alt="DOI 10.5281/zenodo.20528627"></a>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/hero-dark.svg">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/hero-light.svg" alt="Rehearse the minute GNSS goes dark: Kshana's mission console, drawn from a real run of the engine, a chained jamming, spoofing, holdover and integrity campaign over the 102 satellites of GPS, Galileo, BeiDou and GLONASS" width="100%">
</picture>

## Rehearse the minute GNSS goes dark

Kshana replays jamming, spoofing and clock holdover when GNSS (Global Navigation Satellite
System) signals fail, and tells you how long a system keeps time and position inside its
budget, and which clock or sensor buys the most margin. This is the Python package: the engine in a notebook or a script. Every run is
reproducible bit for bit from the scenario, the seed and the engine version.

Try it first with nothing to install: [Kshana Studio](https://kshana.dev) runs the whole
engine in your browser, compiled to WebAssembly, and uploads nothing.

## Evidence

**112 of 228** capabilities validated against independent external oracles; 112 honestly labelled Modelled, 4 partner-owned.
Each capability carries one label in a machine-checked ledger: VALIDATED (an independent
external oracle agrees: real data, an independent implementation or published reference
vectors), MODELLED (internally consistent, and said out loud) or PARTNER (a hardware partner
owns it). Among the checks: all 666 SGP4 (Simplified General Perturbations 4) vectors of
AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 to 4.12 mm, and the
Cowell force model to 0.08 m against Orekit 12.2.

<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/flow-verification-dark.svg">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/flow-verification-light.svg" alt="How a capability earns its label: capability, oracle, test, ledger label. The verification status across all 228 capabilities: 112 Validated, 112 Modelled, 4 Partner-owned" width="100%">
</picture>
</p>

## Install

```bash
pip install kshana
```

Wheels are built on each release tag for Linux, macOS and Windows, each for x86-64 and
64-bit ARM, and one abi3 wheel per platform covers CPython 3.9 and newer. To build from
source instead, use [maturin](https://www.maturin.rs/): `pip install maturin && maturin develop --features python`.

## Usage

The example is complete: it carries its own scenario, so it runs as written with nothing
else on disk.

```python
import json, kshana

# A complete scenario, not a sketch: scenarios/clock-holdover.toml without its comment
# lines. It runs 2 h, 10 min of GNSS then about 1.8 h with GNSS denied, and asks how long
# a strontium optical clock and a chip-scale atomic clock (CSAC) each hold time to within
# 20 ns. sigma_y(1s) is a clock's Allan deviation at an averaging time of one second;
# q_wf, the white-frequency-noise intensity, is its square.
toml = """
seed = 42
threshold_ns = 20.0

[time]
step_s = 10.0
duration_s = 7200.0

[gnss]
windows = [
  { t0 = 0.0,    t1 = 600.0,  state = "nominal" },
  { t0 = 600.0,  t1 = 7200.0, state = "denied" },
]

[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (Origlia/Schiller/Bongs et al., arXiv:1503.08457); q_wf=sigma_y(1s)^2; ground-demonstrator maturity, not flown; flicker/aging not modeled"
y0   = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0

[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10; q_wf=sigma_y(1s)^2; flicker/aging not modeled"
y0   = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
"""

result = json.loads(kshana.run(toml))       # the full result document
print(result["quantum"]["fom"]["integrity"])

# The JSON result, the chart as SVG (Scalable Vector Graphics) and a one-line summary,
# all from one engine run:
result_json, chart_svg, summary = kshana.run_full(toml)
print(kshana.version(), summary)
```

Every other reference scenario is a file under
[`scenarios/`](https://github.com/AshfordeOU/kshana/tree/main/scenarios) in the repository;
pass its text to `kshana.run` the same way. With the Rust command-line interface (CLI)
installed, `kshana example <name>` prints each scenario bundled in the binary, and
`kshana example` lists them.

Beyond `run` / `run_full` / `version`, the module exposes `run_typed` (a structured
result object), `validate_toml` (lint → list of error strings), `scenario_kinds` (the
dispatchable kinds as a Python list of dictionaries), `list_kinds` (the same metadata as
one JSON string — kept as a string so existing callers do not break; call
`json.loads(kshana.list_kinds())`, or use `scenario_kinds()` for the parsed list), and
`error_kind` (the `KshanaError` tag for a rejected scenario) — see
[docs/PYTHON_API.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PYTHON_API.md).

Every capability in the verification matrix is labelled **validated** (checked against
an independent external oracle), **modelled** or **partner-owned**; optical-clock figures
are space goals on ground hardware (no strontium optical clock has flown). Maturity is
*not* uniform across domains — Earth PNT is validated against real data; deep-space and
Mars navigation is modelled, with only its building blocks (light time, planet positions)
validated against external oracles; real-mission deep-space OD (orbit determination) is
on the roadmap.

## Capabilities

The engine has 75 scenario kinds; `kshana kinds` lists them with their fields.

- **Spectrum**: how a jammer takes the GNSS L band, band by band.
- **Clocks and timing**: holdover against a threshold, time transfer, and telecom holdover
  against the masks of the International Telecommunication Union's standardization sector
  (ITU-T).
- **Constellations around any body**: coverage, dilution of precision and availability
  around the Earth, the Moon or Mars, and the solar system at one epoch.
- **Low-Earth-orbit navigation**: signal, pass and link, navigation message, and a fused fix,
  stage by stage.
- **Campaigns**: a chained mission, a sweep or a Monte Carlo ensemble in one scenario.
- **Reports, animation and exports**: every figure with its unit and label; an animated
  drawing of a run; SP3 (Standard Product 3), CCSDS (Consultative Committee for Space Data
  Systems) orbit messages, CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON,
  STK (Systems Tool Kit) and SigMF (Signal Metadata Format) files.

## Architecture

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/architecture-dark.svg">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/readme/architecture-light.svg" alt="One open engine at the centre, kshana 0.29.3, with a typed dispatch over 75 kinds; around it the command line, the Rust library, Python, WebAssembly and Kshana Studio, the MCP server, the Docker image and the JetBrains plugin; below it Kshana Pro, a proprietary overlay that depends on the open engine and never forks it" width="100%">
</picture>

The same scenario file gives the same bytes on every surface. MCP is the Model Context
Protocol: [`kshana-mcp`](https://github.com/AshfordeOU/kshana/blob/main/mcp/kshana-mcp/README.md) lets an AI (artificial
intelligence) assistant run the engine.

## Research

Five papers on arXiv are built on the open engine, each with the command behind it:
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054) (the optimism gap of interference
detectors), [arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (a conditional timing
protection level), [arXiv:2607.05415](https://arxiv.org/abs/2607.05415) (how stable a PNT
resilience score is), [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) (lunar surface
station observability with very-long-baseline interferometry) and
[arXiv:2607.06212](https://arxiv.org/abs/2607.06212) (lunar south-polar geometry and surface
beacons). See [Research](https://github.com/AshfordeOU/kshana#research).

## Editions

The whole engine is free under the AGPL-3.0. Kshana Pro, a proprietary overlay that depends
on the open engine and never forks it, and custom studies are available under contract from
Ashforde OÜ: [contact@ashforde.org](mailto:contact@ashforde.org). There are no prices; see
[docs/PRO.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PRO.md).

## Learn more

- **The full README** → <https://github.com/AshfordeOU/kshana>
- **Kshana Studio** (the engine in your browser, as WebAssembly) → <https://kshana.dev>
- **Capabilities** → [docs/CAPABILITY.md](https://github.com/AshfordeOU/kshana/blob/main/docs/CAPABILITY.md)
- **Validation and provenance** → [docs/VALIDATION.md](https://github.com/AshfordeOU/kshana/blob/main/docs/VALIDATION.md) · [docs/PROVENANCE.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PROVENANCE.md)
- **Verification matrix** → [docs/VERIFICATION-MATRIX.md](https://github.com/AshfordeOU/kshana/blob/main/docs/VERIFICATION-MATRIX.md)
- **Cite** → [CITATION.cff](https://github.com/AshfordeOU/kshana/blob/main/CITATION.cff) · DOI [10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627)

## Licence

Free and open source under the **GNU AGPL-3.0-only** (the GNU Affero General Public
License, version 3 only). A **commercial licence** is available from
[Ashforde OÜ](https://ashforde.org) (an Estonian private limited company; OÜ = osaühing) for
closed integration; see [LICENSING.md](https://github.com/AshfordeOU/kshana/blob/main/LICENSING.md). Professionally developed
and maintained by Ashforde OÜ.
