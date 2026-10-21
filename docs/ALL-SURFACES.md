<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Every surface

One engine, the same results everywhere. [`docs/SURFACES.md`](SURFACES.md) lists, for every command
and kind, which surface carries it and which do not (with the reason).

| Surface | What it is | Get it | Docs |
|---|---|---|---|
| Command line | the `kshana` binary above | `cargo install kshana` | [Install](../README.md#install) |
| Rust library | `kshana::api::run_toml` and the typed modules | `cargo add kshana` | [docs.rs](https://docs.rs/kshana), [README.crates.md](../README.crates.md) |
| Python | `kshana.run` and `run_full`, with type stubs | `pip install kshana` | [Python API](PYTHON_API.md), [README.pypi.md](../README.pypi.md) |
| JavaScript and WebAssembly | the engine in the browser or Node | `npm install kshana` | [README.npm.md](../README.npm.md) |
| MCP server | tools for AI assistants | `cargo install kshana-mcp` | [AI assistant](../README.md#ai-assistant), [MCP install](MCP-INSTALL.md) |
| Plugin slash commands | `/kshana-run`, `/kshana-assess-receiver`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-evidence-pack`, `/kshana-fit-imu`, `/kshana-import-route`, `/kshana-interference-map`, `/kshana-iq`, `/kshana-jammertest`, `/kshana-lunanet-afs-check`, `/kshana-marine-integrations`, `/kshana-standards-pack`, `/kshana-training-scenario`, `/kshana-trust-telemetry` | [`commands/`](../commands/) | [AI assistant](../README.md#ai-assistant) |
| Plugin skills | `compliance-mapping`, `evidence-pack`, `gnss-iq`, `interference-map-route-exposure`, `jammertest`, `marine-integrations`, `test-bench-export`, `training-nmea-scenario`, `trust-telemetry`, `vessel-receiver-trust` | [`skills/`](../skills/) | [AI assistant](../README.md#ai-assistant) |
| Kshana Studio | the engine in the browser, no install, nothing uploaded: the [Simple and Advanced views](https://kshana.dev/studio/), plus `/studio/advanced/`, `/studio/geometry/`, `/studio/trust/`, `/studio/training/`, `/studio/replay/`, `/studio/holdover/`, `/studio/optical/`, `/studio/interference/`, `/studio/observatory/`, `/studio/lunar/`, `/studio/lunar-infra/`, `/studio/ssv/` and `/studio/tools/` | [kshana.dev/studio](https://kshana.dev/studio/) | [Kshana Studio](../README.md#kshana-studio) |
| ROS 2 | a package that scores a receiver's topics | [`integrations/ros2/`](../integrations/ros2/README.md) | [Machine inputs](MACHINE-INPUTS.md) |
| Signal K and OpenCPN | the trust score on a boat's server and in the chart plotter | [`integrations/signalk/`](../integrations/signalk/README.md), [`integrations/opencpn/`](../integrations/opencpn/) | [Marine integrations](MARINE-INTEGRATIONS.md) |
| GNSS-SDR and `gnss_lib_py` | adapters that feed their output to receiver trust | [`integrations/gnss-sdr/`](../integrations/gnss-sdr/README.md), [`integrations/gnss_lib_py/`](../integrations/gnss_lib_py/README.md) | [Machine inputs](MACHINE-INPUTS.md) |
| systemd, Docker and Grafana | a reference build with two systemd units and a container option, and a Grafana dashboard | [`deploy/reference-build/`](../deploy/reference-build/README.md), [`deploy/grafana/`](../deploy/grafana/) | [Marine integrations](MARINE-INTEGRATIONS.md), [Trust telemetry](TRUST-TELEMETRY.md) |
| JetBrains plugin | run a scenario from the IDE | [`ide/jetbrains/`](../ide/jetbrains/) | [Surfaces](SURFACES.md) |
