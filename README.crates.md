<!-- Surface README for crates.io. Images/links are ABSOLUTE (pinned to /main) because
     crates.io does not rewrite relative paths and does not render Mermaid. The canonical,
     full README lives at README.md on GitHub. To re-pin images to an immutable release tag
     at publish time, replace `/main/` with `/vX.Y.Z/` across this file (one sed). -->

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/kshana-wordmark.png" alt="Kshana" width="300">
</p>

<p align="center">
  <strong>क्षण</strong> — Sanskrit for <em>the precise instant</em>, the smallest measure of time.<br>
  Open, reproducible PNT-resilience simulation with published quantum-sensor performance models.
</p>

<p align="center">
  <a href="https://github.com/AshfordeOU/kshana/blob/main/tests/sgp4_verification.rs"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%204.12mm-3fb950" alt="SGP4 validated against all 666 AIAA 2006-6753 vectors, worst 4.12 mm"></a>
  <a href="https://github.com/AshfordeOU/kshana#validation-at-a-glance"><img src="https://img.shields.io/badge/validated-39%20external%20oracles-3fb950" alt="39 of 89 capabilities validated against independent external oracles"></a>
  <a href="https://github.com/AshfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/badge/coverage-~96%25%20line-3fb950" alt="~96% line coverage, gated at 85% in CI"></a>
  <a href="https://github.com/AshfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.22.0-c79e63" alt="Release v0.22.0"></a>
  <a href="https://ashforde.org"><img src="https://img.shields.io/badge/playground-try%20in%20browser-c79e63" alt="Live playground — run in your browser, no install"></a>
  <a href="https://github.com/AshfordeOU/kshana/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-AGPL_v3-blue.svg" alt="License: AGPL-3.0-only"></a>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-10.5281%2Fzenodo.20528627-blue.svg" alt="DOI 10.5281/zenodo.20528627"></a>
</p>

**Kshana** is an open, reproducible **PNT-resilience simulator with quantum-sensor
performance models** — positioning, navigation, and timing. It quantifies, in hard
and reproducible numbers, what quantum clocks, quantum inertial sensors, and optical
time-transfer buy a navigation system over classical PNT — scored against the
operational figures of merit that matter for resilient navigation. Every result is
reproducible from `scenario + seed + engine version`, and every sensor parameter is
traceable to a published source.

> ***Validated, not asserted.*** 666/666 AIAA SGP4 vectors to **4.12 mm** · Cowell
> force model **0.08 m** vs Orekit 12.2 · Galileo **0.61 m** / Swarm-A **0.10 m** vs
> real ESA precise ephemerides · GCRS→ITRS bit-for-bit vs SOFA/ERFA · ML metrics exact
> vs scikit-learn · **39 of 89** capabilities validated against independent external
> oracles; 46 honestly labelled Modelled, 4 partner-owned.

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/diagrams/system-overview.png" alt="Kshana system overview: five front doors (CLI, Python wheel, WebAssembly playground, MCP server, JetBrains plugin) converge on a single api::run_toml dispatch, through the engine, to a reproducible result.json + chart.svg" width="840">
</p>

### Validated against external oracles — every row CI-gated

Each row is checked against an **independent external oracle** (real dataset,
independent reference implementation, or published reference vectors) and re-checked in CI.

| | Capability | Result | External oracle |
|---|---|---|---|
| ✅ | SGP4/SDP4 propagation | 666/666 vectors, worst **4.12 mm** | AIAA 2006-6753 (Vallado) + independent `sgp4` crate |
| ✅ | Numerical Cowell force model | **0.08 m** / 24 h, 275 epochs | Orekit 12.2 `DormandPrince853` (CS GROUP) |
| ✅ | Orbit fit vs precise ephemeris | Galileo **0.61 m** · Swarm-A **0.10 m** | ESA/ESOC SP3 precise orbits |
| ✅ | GCRS→ITRS frame chain | bit-for-bit vs SOFA; ≤ 0.86 m vs SPICE | ERFA/SOFA + ANISE (pure-Rust SPICE) |
| ✅ | Allan deviations | reproduce reference deviations | NIST SP 1065 + Stable32 on a real Cs clock |
| ✅ | GNSS DOP · ML detector metrics | to **1e-6** · to **1e-9** | gnss_lib_py · scikit-learn |

<p align="center">
  <img src="https://raw.githubusercontent.com/AshfordeOU/kshana/main/docs/assets/figures/validation-breakdown.png" alt="Verification status across all 89 capabilities: 39 Validated, 46 Modelled, 4 Partner-owned" width="780">
</p>

## Install

```bash
cargo add kshana            # use the engine as a library
cargo install kshana        # or install the CLI
```

## Usage — library

```rust
use kshana::api;

// Run any scenario TOML through the engine; get a reproducible result back.
let toml = std::fs::read_to_string("scenarios/clock-holdover.toml")?;
let result_json = api::run_toml(&toml)?;
println!("{result_json}");
# Ok::<(), Box<dyn std::error::Error>>(())
```

## Usage — CLI

```bash
# Dispatches on the scenario's `kind`; writes <scenario>.result.json + .chart.svg
kshana scenarios/clock-holdover.toml
kshana scenarios/orbit-gnss-challenged.toml
kshana --validate scenarios/integrity-raim.toml     # lint without running
kshana --study scenarios/quantum-pnt-demonstrator.suite.toml --study-name "PNT demo"
```

Every figure of merit is labelled **validated** or **modelled**; optical-clock figures
are space goals on ground hardware (no strontium optical clock has flown). Maturity is
*not* uniform across domains — Earth PNT is real-data validated; deep-space / Mars
navigation is simulation-validated; real-mission deep-space OD is on the roadmap.

## Learn more

- **Full README & validation matrix** → <https://github.com/AshfordeOU/kshana>
- **Live playground** (runs in your browser as WebAssembly) → <https://ashforde.org>
- **Capabilities** → [docs/CAPABILITY.md](https://github.com/AshfordeOU/kshana/blob/main/docs/CAPABILITY.md)
- **Validation & provenance** → [docs/VALIDATION.md](https://github.com/AshfordeOU/kshana/blob/main/docs/VALIDATION.md) · [docs/PROVENANCE.md](https://github.com/AshfordeOU/kshana/blob/main/docs/PROVENANCE.md)
- **Claims vs reality ledger** → [docs/CLAIMS-VS-REALITY.md](https://github.com/AshfordeOU/kshana/blob/main/docs/CLAIMS-VS-REALITY.md)

## Licence

Free and open source under the **GNU AGPL-3.0-only**. A **commercial licence** is
available from [Ashforde OÜ](https://ashforde.org) for proprietary/closed integration
— see [LICENSING.md](https://github.com/AshfordeOU/kshana/blob/main/LICENSING.md).
Professionally developed and maintained by Ashforde OÜ; commercial support, integration,
and proprietary extensions available.
