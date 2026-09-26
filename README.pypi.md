<!-- Surface README for PyPI. Images/links are ABSOLUTE (pinned to /main) because PyPI
     does not rewrite relative paths and does not render Mermaid. The canonical, full
     README lives at README.md on GitHub. To re-pin images to an immutable release tag
     at publish time, replace `/main/` with `/vX.Y.Z/` across this file (one sed). -->

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/kshana-wordmark.png" alt="Kshana" width="300">
</p>

<p align="center">
  <strong>क्षण</strong> — Sanskrit for <em>the precise instant</em>, the smallest measure of time.<br>
  Open, reproducible PNT (positioning, navigation and timing) resilience simulation with published quantum-sensor performance models.
</p>

<p align="center">
  <a href="https://github.com/AshfordeOU/kshana/blob/main/tests/sgp4_verification.rs"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%204.12mm-3fb950" alt="SGP4 validated against all 666 AIAA 2006-6753 vectors, worst 4.12 mm"></a>
  <a href="https://github.com/AshfordeOU/kshana#validation-at-a-glance"><img src="https://img.shields.io/badge/validated-65%20external%20oracles-3fb950" alt="65 of 171 capabilities validated against independent external oracles"></a>
  <a href="https://github.com/AshfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/badge/coverage-~96%25%20line-3fb950" alt="~96% line coverage, gated at 85% in CI"></a>
  <a href="https://github.com/AshfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.27.4-c79e63" alt="Release v0.27.4"></a>
  <a href="https://kshana.dev"><img src="https://img.shields.io/badge/playground-try%20in%20browser-c79e63" alt="Live playground — run in your browser, no install"></a>
  <a href="https://github.com/AshfordeOU/kshana/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-AGPL_v3-blue.svg" alt="License: AGPL-3.0-only"></a>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-10.5281%2Fzenodo.20528627-blue.svg" alt="DOI 10.5281/zenodo.20528627"></a>
</p>

**Kshana** is an open, reproducible **PNT-resilience simulator with quantum-sensor
performance models** — PNT being positioning, navigation, and timing. This package is a thin
[PyO3](https://pyo3.rs) (abi3, the stable Python binary interface) wrapper over the
same Rust engine: you pass a scenario TOML (Tom's Obvious, Minimal Language) string in and get a reproducible JSON (JavaScript Object Notation) result back. It quantifies, in hard numbers,
what quantum clocks, quantum inertial sensors, and optical time-transfer buy a
navigation system over classical PNT. Every result is reproducible from
`scenario + seed + engine version`, and every sensor parameter is traceable to a
published source.

> ***Validated, not asserted.*** 666/666 AIAA (American Institute of Aeronautics and
> Astronautics) SGP4 (Simplified General Perturbations 4, the standard satellite-orbit
> propagator) vectors to **4.12 mm** · Cowell force model **0.08 m** vs Orekit 12.2 ·
> Galileo **0.61 m** / Swarm-A **0.10 m** vs real ESA (European Space Agency) precise
> ephemerides · GCRS→ITRS (Geocentric Celestial Reference System to International
> Terrestrial Reference System) bit-for-bit vs SOFA/ERFA (the International Astronomical
> Union's Standards of Fundamental Astronomy library and its open port, Essential Routines
> for Fundamental Astronomy) · ML (machine-learning) metrics exact
> vs scikit-learn · **65 of 171** capabilities validated against independent external
> oracles; 102 honestly labelled Modelled, 4 partner-owned.

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/diagrams/system-overview.png" alt="Kshana system overview: five front doors (command-line interface, Python wheel, WebAssembly playground, Model Context Protocol server, JetBrains plugin) converge on a single api::run_toml dispatch, through the engine, to a reproducible result.json + chart.svg" width="840">
</p>

### Validated against external oracles — every row gated in continuous integration

Each row is checked against an **independent external oracle** (real dataset,
independent reference implementation, or published reference vectors) and re-checked in CI (continuous integration).

| | Capability | Result | External oracle |
|---|---|---|---|
| ✅ | SGP4/SDP4 (Simplified Deep-space Perturbations 4) propagation | 666/666 vectors, worst **4.12 mm** | AIAA 2006-6753 (Vallado) + independent `sgp4` crate |
| ✅ | Numerical Cowell force model | **0.08 m** / 24 h, 275 epochs | Orekit 12.2 `DormandPrince853` (CS GROUP) |
| ✅ | Orbit fit vs precise ephemeris | Galileo **0.61 m** · Swarm-A **0.10 m** | ESA/ESOC (European Space Operations Centre) SP3 (the Standard Product 3 precise-orbit format of the International GNSS Service, GNSS being Global Navigation Satellite System) precise orbits |
| ✅ | GCRS→ITRS frame chain | bit-for-bit vs SOFA; ≤ 0.86 m vs SPICE (Spacecraft, Planet, Instrument, C-matrix, Events — the planetary-geometry toolkit) | ERFA/SOFA + ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — a pure-Rust SPICE) |
| ✅ | Allan deviations | reproduce reference deviations | NIST SP 1065 (National Institute of Standards and Technology Special Publication 1065) + Stable32 on a real Cs (caesium) clock |
| ✅ | GNSS DOP (dilution of precision) · ML detector metrics | to **1e-6** · to **1e-9** | gnss_lib_py · scikit-learn |

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/figures/validation-breakdown.png" alt="Verification status across all 171 capabilities: 65 Validated, 102 Modelled, 4 Partner-owned" width="780">
</p>

## Install

```bash
pip install kshana
```

Wheels are built for Linux, macOS, and Windows on each release tag. To build from
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
installed, `kshana example <name>` prints any of them.

Beyond `run` / `run_full` / `version`, the module exposes `run_typed` (a structured
result object), `validate_toml` (lint → list of error strings), `scenario_kinds` (the
dispatchable kinds as a Python list of dictionaries), `list_kinds` (the same metadata as
one JSON string — kept as a string so existing callers do not break; call
`json.loads(kshana.list_kinds())`, or use `scenario_kinds()` for the parsed list), and
`error_kind` (the `KshanaError` tag for a rejected scenario) — see
[docs/PYTHON_API.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PYTHON_API.md).

Every figure of merit is labelled **validated** or **modelled**; optical-clock figures
are space goals on ground hardware (no strontium optical clock has flown). Maturity is
*not* uniform across domains — Earth PNT is real-data validated; deep-space / Mars
navigation is simulation-validated; real-mission deep-space OD (orbit determination) is on the roadmap.

## Learn more

- **Full README & validation matrix** → <https://github.com/AshfordeOU/kshana>
- **Live playground** (runs in your browser as WebAssembly) → <https://kshana.dev>
- **Python application programming interface (API)** → [docs/PYTHON_API.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PYTHON_API.md)
- **Capabilities** → [docs/CAPABILITY.md](https://github.com/AshfordeOU/kshana/blob/main/docs/CAPABILITY.md)
- **Validation & provenance** → [docs/VALIDATION.md](https://github.com/AshfordeOU/kshana/blob/main/docs/VALIDATION.md) · [docs/PROVENANCE.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PROVENANCE.md)

## Licence

Free and open source under the **GNU AGPL-3.0-only** (the GNU Affero General Public License, version 3 only). A **commercial licence** is
available from [Ashforde OÜ](https://ashforde.org) (an Estonian private limited company;
OÜ = osaühing) for proprietary/closed integration
— see [LICENSING.md](https://github.com/AshfordeOU/kshana/blob/main/LICENSING.md).
Professionally developed and maintained by Ashforde OÜ; commercial support, integration,
and proprietary extensions available.
