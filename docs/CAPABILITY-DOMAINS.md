<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Capability domains

Every capability of the public map, by domain, with its ledger label. The table is written by
[`tools/gen_readme_blocks.py`](../tools/gen_readme_blocks.py) from `web/capabilities.json`, the file the Studio's map of
everything reads; a capability is VALIDATED only with an independent external oracle ([how a label is
earned](../README.md#evidence)). Advisory: analysis output from a research and engineering tool, not type-approved
navigation equipment.

<!-- generated:domains -->
| Domain | Capabilities | Labels |
|---|---|---|
| **AI/ML evaluation & trade** | RF-impairment detection eval & PNT trade; Quantum-vs-classical resilience crossover map | 1 modelled, 1 validated |
| **Alt-PNT (GPS-denied)** | Gravity, terrain & magnetic map-matching | 1 modelled |
| **Artifact interchange** | Kshana Interchange Format (KIF) | 1 modelled |
| **Augmentation (SBAS)** | SBAS / WAAS protection levels & dual-frequency | 1 validated |
| **Clock & timing** | Holdover, stability & time-and-frequency transfer | 1 validated |
| **Decision support** | Cost-per-coverage ROI | 1 modelled |
| **Deep-space & Mars PNT** | Radiometric navigation & relay-PNT | 1 modelled |
| **Fusion** | GNSS / INS sensor fusion | 1 modelled |
| **GNSS authentication** | Galileo OSNMA verification | 1 validated |
| **GNSS measurement domain** | Pseudorange, ionosphere & troposphere | 1 validated |
| **GNSS positioning** | Single-point positioning (PVT) | 1 validated |
| **Inertial** | Strapdown INS & map-aided navigation; Inertial and terrain-relative coasting through an outage | 2 modelled |
| **Integrity** | Receiver autonomous integrity (ARAIM); ARAIM against published reference vectors | 2 validated |
| **Integrity impact** | Detection-miss → integrity regions | 1 modelled |
| **Interoperability** | RINEX, SP3 & CCSDS formats; Test-bench export | 1 modelled, 1 validated |
| **Lunar** | Lunar reference-station study | 1 modelled |
| **Lunar & cislunar** | CR3BP propagation & LunaNet integrity; Lunar reference-frame realisation; Lunar navigation service volume & ARAIM; Cross-provider lunar interoperability budget; Autonomous free-network fault observability; Lunar frame datum from real laser ranging; Lunar differential PNT; Lunar time scales & geodetic VLBI; Real, retrieved lunar constellation geometry; Lunar denial contour from a measured C/N₀ spread; VLBI schedule to station-coordinate covariance; Lunar orbit and surface as navigation and geodetic infrastructure | 7 modelled, 5 validated |
| **Maneuvers & trajectory design** | Burns, Lambert & porkchop | 1 modelled |
| **Maritime trust** | Receiver-trust score for a vessel; Crew-training NMEA streams; Interference map and route exposure; Trust telemetry for security operations; Signed evidence packs; Compliance mapping to public frameworks; Geometry-aware trust classification | 3 modelled, 4 validated |
| **Mission analysis** | Launch, re-entry, coverage & pointing budgets; Navigation-versus-communications aperture sharing | 2 modelled |
| **Nav-signal performance** | Modulation, anti-jam & code tracking; GNSS beyond the constellation: the Space Service Volume and past it | 2 modelled |
| **Numerical propagator** | Cowell propagator & six-perturbation force model | 1 modelled |
| **Observability & estimation theory** | Fisher information & observability | 1 validated |
| **Optical / RF PNT** | Optical and RF handover with cross-modality integrity; Optical timing links through clouds and turbulence | 2 modelled |
| **Orbit & geometry** | Orbit propagation & constellation design | 1 validated |
| **Orbit determination** | Batch & sequential OD | 1 validated |
| **Passive RF geolocation** | Passive RF geolocation (TDOA/FDOA) | 1 modelled |
| **Resilience** | Jamming & multi-layer spoof detection | 1 modelled |
| **Resilience assessment** | PNT-resilience scoring & decision-instability | 1 modelled |
| **Sky geometry** | Skyline-masked visibility, DOP and error ellipse; Skyline presets and the sky-geometry functions | 1 modelled, 1 validated |
| **Space environment** | Space-weather & thermospheric density | 1 validated |
| **Time systems** | Time scales & Earth-orientation frames; Real-time Earth-orientation prediction | 1 modelled, 1 validated |
| **Timing integrity** | Conditional Timing Protection Level | 1 modelled |
| **Verification & assurance** | Machine-checked verification matrix; Unit and provenance on every reported quantity | 2 modelled |
<!-- /generated:domains -->
