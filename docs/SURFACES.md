# Where each capability is reachable

Every capability is available on the surfaces where it makes sense; where one cannot carry a
capability, the cell says **N/A** and why. The same engine runs behind every surface: the
Python, WebAssembly and MCP entry points for the 0.35 capabilities are thin wrappers over
`kshana::surface`, which calls the code the command line runs.

Surfaces: **CLI** (`kshana`), **Rust** (the `kshana` crate), **Python** (`pip install kshana`),
**WASM** (`npm install kshana`, the browser), **MCP** (`kshana-mcp`, for AI agents), **Plugin**
(the Claude Code plugin: slash commands and skills over the MCP server), **JetBrains** (IDE
actions that run the CLI), **Notebook** (`notebooks/`), **Studio** (the Kshana Studio web app: its Tools cards, Maritime trust page, Interference map page and Training view; see below).

| Capability | CLI | Rust | Python | WASM | MCP | Plugin | JetBrains | Notebook | Studio |
|---|---|---|---|---|---|---|---|---|---|
| Vessel receiver-trust, batch log (0-100 score, reasons) | `receiver-trust` | `receiver_trust::assess::assess_vessel_log` | `receiver_trust`, `assess_vessel_log` | `receiver_trust`, `assess_vessel_log` | `assess_receiver_log`, `assess_vessel_log` | `/kshana-assess-receiver`, skill `vessel-receiver-trust` | Assess Receiver Trust | `vessel-trust-and-training` | Maritime trust page |
| Receiver-trust on a bounded stream excerpt (scores, states, reasons; no gate) | `receiver-trust live` | `receiver_trust::assess::assess_stream_excerpt` | `receiver_trust_replay` | `receiver_trust_replay` | `assess_vessel_stream` | same | Assess Receiver Stream (a stored log) | `vessel-trust-and-training` | Maritime trust page |
| Satellite geometry and deduction classes (0.36: `geometry` good/degraded/unknown with reasons and DOP, a `label` good/fair/poor always reported, the `geometry` monitor (nothing unless the geometry is poor, then up to 15 points; listed last in `monitors_run` when it decided, so the verdict's monitor count includes geometry), a `class` on every deduction, `geometry_model`, `geometry_summary`) | `receiver-trust`, `receiver-trust live` (in the result JSON and every JSON line; the CSV, SVG, one-line verdict and `$PKSHT` carry a geometry deduction like any other and are otherwise unchanged) | `receiver_trust::geometry`, on `EpochTrust`, `Deduction` and `EpochReport` | `receiver_trust`, `assess_vessel_log`, `receiver_trust_replay` (in the returned dicts) | the same three (in the returned JSON) | `assess_receiver_log`, `assess_vessel_log`, `assess_vessel_stream` (in the reply; a vessel log's reply keeps `geometry_model` and `geometry_summary`); `trust_telemetry` renders it | same, skills `vessel-receiver-trust`, `trust-telemetry` | the actions above print the CLI output, which carries it | `vessel-trust-and-training` (in the result it loads) | **pending**: the Maritime trust page does not show it yet (fields listed in `docs/MARITIME-TRUST.md`, Studio view item 6) |
| `receiver-trust live` as a running process (stdin, followed file, TCP, UDP, `--gate`, `--listen`) | `receiver-trust live` | `receiver_trust::live::LiveEngine` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | Tools: Command line card (the command to run; a browser is not a process in the data path) |
| Evidence pack: create (signed, window of a log; 0.38: an optional `lab-attestation`, the operator's statement of a lab setup, recorded in the signed manifest, never verified) | `receiver-trust evidence` (`--lab-attestation <file.toml>`) | `evidence::create_bundle`, `evidence::create_bundle_attested`, `surface::evidence_create`, `surface::evidence_create_attested` | `evidence_create` (`lab_attestation`) | **N/A** (signing key) | `create_evidence_pack` (`lab_attestation_toml`) | `/kshana-evidence-pack`, skill `evidence-pack` | Create Evidence Pack (no attestation field in the dialog in 0.38: **pending**; the command line takes it) | `vessel-trust-and-training` | **N/A** (a signing key does not belong in a page); Tools: Command line card |
| Jammertest as a referee (0.38): the published NPRA catalogue and transmission plan read as scheduled truth (`import`), a receiver log scored against it per test (`score`: detection latency, missed, false alarms, time to recover; MODELLED) | `jammertest import`, `jammertest score` | `jammertest::plan`, `jammertest::score`, `surface::jammertest_import_json`, `surface::jammertest_score_json` | `jammertest_import`, `jammertest_score` | `jammertest_import`, `jammertest_score` | `jammertest_import`, `jammertest_score` | `/kshana-jammertest`, skill `jammertest` | **N/A** (needs the plan files and a log on disk; run it from a terminal) | **N/A** (no notebook yet) | **pending**: a Tools card for the command line (the Studio strip and views are WS-A's) |
| Signed Jammertest score pack (`jammertest score --key`: the receiver-trust evidence pack with the scorecard and the schedule inside `config.json`) | `jammertest score --key <keyfile> --out <dir>` | `jammertest::score_pack` | **N/A** (signing key) | **N/A** (signing key) | **N/A** (signing key: use `create_evidence_pack` on a window, or the command line) | **N/A** | **N/A** | **N/A** | **N/A** (a signing key does not belong in a page); Tools: Command line card |
| Receiver self-report (0.38): UBX-NAV-STATUS `spoofDetState` and UBX-SEC-SIG read into `self_report` on each epoch, and the `receiver_self_report` comparison (both / receiver-only / Kshana-only / neither) in the result; raises no alarm and changes no score | `receiver-trust` (in the result JSON; `jammertest score`) | `receiver_trust::ReceiverSelfReport`, `monitors::SelfReportEpoch`, `monitors::SelfReportSummary` | `receiver_trust`, `assess_receiver_log` (in the returned dicts) | `receiver_trust` (in the returned JSON) | `assess_receiver_log` (in the reply) | `/kshana-assess-receiver` | the actions above print the CLI output, which carries it | **N/A** | **pending**: the Trust page strip (WS-A; the field is `epochs[].self_report`) |
| Septentrio SBF log format (0.38, read only: PVTGeodetic, MeasEpoch, RFStatus) | `receiver-trust` with `[log] format = "sbf"` | `receiver_trust::ingest::read_sbf`, `LogFormat::Sbf` | `receiver_trust`, `assess_receiver_log` (`format = "sbf"`, log as `base64`) | the same | `assess_receiver_log` (`base64`) | `/kshana-assess-receiver` | the actions above | **N/A** | **N/A** (binary log upload not offered on the Trust page in 0.38) |
| `receiver-trust live --serial <device> [--baud n]`: a serial or USB NMEA feed, read only (opens the device for reading, never writes to the receiver; `--configure` is refused) | `receiver-trust live --serial` | **N/A** (a device and a process) | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | Tools: Command line card (the command to run; a browser is not a process in the data path) |
| Evidence pack: create (signed, window of a log) | `receiver-trust evidence` | `evidence::create_bundle`, `surface::evidence_create` | `evidence_create` | **N/A** (signing key) | `create_evidence_pack` | `/kshana-evidence-pack`, skill `evidence-pack` | Create Evidence Pack | `vessel-trust-and-training` | **N/A** (a signing key does not belong in a page); Tools: Command line card |
| Laboratory round-trip pack (scenario, test conditions, receiver log and score linked by hash) | `evidence round-trip` | `evidence::build_round_trip_pack`, `surface::evidence_round_trip` | `evidence_round_trip` | **N/A** (signing key) | `create_round_trip_pack` | `/kshana-evidence-pack` | **N/A** (JetBrains actions are bound to one selected file; the pack needs a scenario, conditions, a log and a key: run it from the IDE terminal) | | **N/A** (a signing key does not belong in a page); Tools: Command line card |
| Evidence pack: verify | `evidence verify` | `evidence::verify_bundle` | `evidence_verify` | `evidence_verify` | `verify_evidence_pack` | same | Verify Evidence Pack (pinned key only) | `vessel-trust-and-training` | Tools: Evidence packs (verify, attach timestamp) |
| Trust telemetry (Prometheus, syslog CEF/LEEF, OTLP; 0.38: `format = "mqtt"`, Home Assistant discovery and state lines; `--mqtt-tcp` publishes from the CLI) | `trust-telemetry` | `telemetry` | `trust_telemetry` | `trust_telemetry` (text out; no socket) | `trust_telemetry` | `/kshana-trust-telemetry`, skill `trust-telemetry` | Render Trust Telemetry (a stored result) | `vessel-trust-and-training` | Tools: Telemetry card (Command line tab; formats only, no sockets) |
| Machine and sensor inputs (0.38): `receiver-trust` formats `rtklib-pos`, `novatel`, `gnss-sdr`, and `[log.imu]` (`csv`, `euroc`) | `receiver-trust` (scenario `[log] format`) | `receiver_trust::machines` | `receiver_trust`, `assess_receiver_log` (inline) | `receiver_trust` (inline) | `assess_receiver_log` (inline text/base64; a `path` is refused) | `/kshana-assess-receiver` | Assess Receiver Trust | `vessel-trust-and-training` | **N/A** (Studio's Trust page reads the formats it lists; new formats follow with its next port) |
| IMU log to hybrid/fusion sensor parameters (`[accel_classical]` table from a stationary log, Allan fit) | `imu-fit` | `surface::imu_fit`, `receiver_trust::machines::imu_fit` | `imu_fit` | `imu_fit` | `fit_imu_log` | `/kshana-fit-imu` | **N/A** (no IDE action yet) | **N/A** | **N/A** (Studio's scenario editor takes the pasted table) |
| ROS 2 node, GNSS-SDR UDP relay, `trust-telemetry --mqtt-tcp` (`integrations/ros2`, `integrations/gnss-sdr`) | processes | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** (long-running processes and sockets; text forms: `trust_telemetry` with `mqtt`) |
| Galileo OSNMA verification of I/NAV pages or a UBX stream (`docs/OSNMA.md`) | `osnma verify` | `osnma::cli::verify_report`, `surface::osnma_verify` | `osnma_verify` | `osnma_verify` | **N/A** (a long raw receiver stream suits the CLI and Python; an agent tool would add a large-input surface for no benefit) | **N/A** (plugin commands run over the MCP server, which has no OSNMA tool for the reason in the MCP cell; run `kshana osnma verify`) | **N/A** (the result means nothing without a trusted Merkle root or public key obtained from the ICD by another route and, for freshness, an independent reference time; a right-click action has nowhere to take them, and an unpinned default would read as verification; run `kshana osnma verify`) | **N/A** (a stream in, a JSON report out; no notebook) | Tools: OSNMA |
| Training NMEA with an instructor log | `nmea-scenario` | `nmea_synth::generate_from_toml` | `nmea_training` | `nmea_training` | `generate_training_nmea` | `/kshana-training-scenario`, skill `training-nmea-scenario` | Generate Training NMEA | `vessel-trust-and-training` | Training debrief page |
| Training NMEA streamed to a TCP or UDP address | `nmea-scenario --tcp/--udp` | `nmea_synth::stream` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | Tools: Command line card (streams to an address) |
| Interference map (ADS-B, AIS) | `interference-map adsb\|ais` | `interference_map::api` | `interference_map` | `interference_map` | `build_interference_map` | `/kshana-interference-map`, skill `interference-map-route-exposure` | Build Interference Map | `interference-map-route-exposure` | Interference map page |
| Route exposure | `route-exposure` | `interference_map::api::route_exposure` | `route_exposure` | `route_exposure` | `route_exposure` | same | Route Exposure | `interference-map-route-exposure` | Interference map page |
| Signal K plugin and OpenCPN gate feed (`docs/MARINE-INTEGRATIONS.md`) | `integrations/`, `receiver-trust live --gate --listen` | **N/A** (processes) | **N/A** | **N/A** | **N/A** | how-to only: `/kshana-marine-integrations`, skill `marine-integrations` | **N/A** | **N/A** | Tools: Command line card (how-to; a deployment) |
| Test-bench export (motion CSV, NMEA, waypoints, events for a laboratory simulator) | `bench-export` | `interop::testbench::export_with_notes`, `surface::bench_export` | `bench_export` | `bench_export` | `export_test_bench` | `/kshana-bench-export`, skill `test-bench-export` | Export Test-Bench Files | `compliance-and-test-bench` | Tools: Test-bench export |
| Compliance mapping from runs (which public-framework rows the runs support evidence for) | `compliance-report` | `compliance::assess_texts`, `surface::compliance_report` | `compliance_report` | `compliance_report` | `compliance_report` | `/kshana-compliance-report`, skill `compliance-mapping` | Build Compliance Report | `compliance-and-test-bench` | Tools: Compliance mapping |
| Compliance mapping tables and sources | `compliance-report --mapping`, `--sources` | `compliance::mapping`, `surface::compliance_mapping` | `compliance_mapping` | `compliance_mapping` | `compliance_mapping` | same | Show Compliance Mapping | **N/A** | Tools: Compliance mapping |
| Standards packs (scored scenario sets with bars stated before the run: DHS RPCF test profiles, IMO MSC.1/Circ.1575, ICAO Doc 9849 Appendix F) | `standards-pack` | `standards_pack`, `surface::standards_pack_list`, `surface::standards_pack_run` | `standards_pack_list`, `standards_pack_run` | `standards_pack_list`, `standards_pack_run` | `list_standards_packs`, `run_standards_pack` | `/kshana-standards-pack` | **N/A** (JetBrains actions are bound to a selected file; packs are embedded and need none: run `kshana standards-pack` from the IDE terminal) | | **N/A** (Studio Tools cards for packs belong to the Studio workstream; the CLI or any surface output feeds the Compliance mapping card) |
| Data-partner submission check (format and metadata of a measured-data submission, `kshana.partner-submission/1`; scores nothing) | `partner check` | `partner::check_file`, `partner::check` | **N/A** (the check reads local files and their SHA-256; the Rust API is the library surface and the CLI is the tool) | **N/A** (no file system in the browser build) | **N/A** (MCP refuses file sources by design (inline text only)) | **N/A** (slash commands call MCP tools, and this check needs files on disk) | **N/A** (JetBrains actions are bound to one selected file; a submission is a folder) | **N/A** (no notebook yet) | **N/A** (Studio has no file-system access; run the command) |
| LunaNet Augmented Forward Signal: codes, SB1/CRC/interleaver, and a check against LSIS-AFS V1.0 (`docs/LUNANET-AFS.md`) | `lunanet-afs-check`; signals `lunanet-afs-i`, `lunanet-afs-q` in `iq scene/acquire/track/sweep` | `iq::signals::lunanet`, `iq::lunanet_afs`, `surface::lunanet_afs_check_spec`, `lunanet_afs_check_symbols`, `lunanet_afs_generate` | `lunanet_afs_check_spec`, `lunanet_afs_check_symbols`, `lunanet_afs_generate`; `iq_scene` etc. with the two signal names | `lunanet_afs_check_spec`, `lunanet_afs_check_symbols`, `lunanet_afs_generate`; `iq_scene` etc. through the short in-memory runs | `lunanet_afs_check` | `/kshana-lunanet-afs-check` | **N/A** (JetBrains actions are bound to a selected file; run `kshana lunanet-afs-check` from the IDE terminal) | | **N/A** (a Studio card is a Studio-workstream item; the CLI and every other surface carry it) |
| Sky geometry under a skyline: visible and masked satellites, DOP, ENU covariance, error ellipse (`docs/SKYLINE.md`) | `sky` | `geometry::sky_geometry`, `surface::sky_geometry` | `sky_geometry` | `sky_geometry` | `sky_geometry` | `/kshana-run` (points to the tool) | **N/A** (an interactive skyplot is a browser view; `kshana sky` covers the numbers) | `notebooks/geometry.ipynb` | — (the Studio Geometry view is added separately in 0.36) |
| Sky Monte Carlo cloud (seeded least-squares errors, RMS, 95 % containment) | `sky --monte-carlo <n> --seed <s>` | `geometry::sky_monte_carlo` | `sky_monte_carlo` | `sky_monte_carlo` | **N/A** (bulk samples an agent should summarise, not carry) | **N/A** (no MCP tool) | **N/A** (as above) | **N/A** | — (as above) |
| Skyline presets and profiles (`docs/SKYLINE.md`) | `skyline --preset <name>`, `--presets`, `--profile <file>` | `geometry::skyline_presets`, `geometry::skyline_profile` | `skyline_presets`, `skyline_profile` | `skyline_presets`, `skyline_profile` | `sky_geometry` (`skyline_preset`) | same | **N/A** (as above) | **N/A** | — (as above) |
| Skyplot as SVG | `sky --svg` | `geometry::skyplot_svg` | `skyplot_svg` | `skyplot_svg` | **N/A** (an agent reads the numbers from `sky_geometry`) | **N/A** | **N/A** (as above) | **N/A** | — (as above) |
| Skyline section in a scenario (`[skyline]`: orbit and integrity with `user_site`, gnss-sim, jamming, leo-pvt, leo-pass, nmea-scenario) | the scenario file | `skyline::SkylineCfg` | `run`, `nmea_training` | `run`, `nmea_training` | `run_scenario`, `generate_training_nmea` | `/kshana-run` | Run Kshana Scenario | **N/A** | — |
| Optical timing link through the atmosphere: per-site availability, site diversity, enhancement techniques, outage-to-holdover coupling (scenario kind `optical-atmosphere`; `docs/OPTICAL-ATMOSPHERE.md`; MODELLED, ILLUSTRATIVE sites, advisory) | `kshana scenarios/optical-atmosphere-network.toml`, `scenarios/optical-atmosphere-techniques.toml` | `optical_atmosphere`, `optical_weather`, `optical_sitediv`, `optical_techniques`, `optical_outage_holdover` | `run`, `run_typed` | `run` | `run_scenario` | `/kshana-run` | Run Kshana Scenario | `optical-atmosphere` | **pending**: no Studio view yet; the scenario runs in the Studio scenario runner and the Tools Command line card |
| Holdover test scored from an operator-supplied time-error record: baseline, GNSS removed by the operator, holdover, recovery, measured against ITU-T masks (scenario kind `holdover-test`; `docs/TIMING-HIL.md`; MODELLED, advisory; Kshana transmits and drives nothing) | `kshana scenarios/holdover-test-example.toml`, `scenarios/holdover-test-ptp4l.toml` | `holdover_test`, `telecom_timing` | `run`, `run_typed` | `run` (inline `samples` or `clock_log.text`; the file keys are refused) | `run_scenario` (inline only) | `/kshana-run` | Run Kshana Scenario | **N/A** (no notebook in 0.38; the example scenarios run in any notebook through `run`) | **pending**: no Studio view yet; the scenario runs in the Studio scenario runner and the Tools Command line card |
| Navigation and timing error budget of a chain of mission phases from launch to entry: eight phase kinds, handover rules, frame and timescale conversions, a ground-network overlay, margin against stated requirements and the weakest link (scenario kind `mission-thread`; `docs/MISSION-THREAD.md`; MODELLED, ILLUSTRATIVE inputs, advisory; public sources only, no endorsement) | `kshana scenarios/mission-thread-artemis-class.toml` (from a checkout: it reads a committed Moon kernel cut) | `mission_thread` | `run`, `run_typed` | `run` (`moon_kernel_path` is a file key and is refused; without a kernel the Moon is the analytic series and the conversion row says so) | `run_scenario` (inline only; the kernel key is refused) | `/kshana-run` | Run Kshana Scenario | **N/A** (no notebook; the example runs in any notebook through `run` from a checkout) | **pending**: no Studio view yet; the scenario runs in the Studio scenario runner and the Tools Command line card |
| GNSS beyond the constellation: availability of GPS, GLONASS, Galileo, BDS, QZSS and NavIC signals for a user on a shell or on a LEO to lunar-transfer trajectory (booklet, parametric or measured transmit pattern, limb-ray medium, weak-signal receiver design), an onboard GNSS EKF for high-orbit and lunar-transfer craft, and formation relative navigation (scenario kind `gnss-ssv`; `docs/SSV.md`; MODELLED, advisory; compared with the ICG SSV booklet under a pre-registration, `xval/gnss-ssv/RESULTS.md`) | `kshana scenarios/gnss-ssv-shell.toml`, `gnss-ssv-heo.toml`, `gnss-ssv-lunar-weak.toml`, `gnss-ssv-nav-lunar.toml`, `gnss-ssv-formation-heo.toml` | `ssv` | `run`, `run_typed` | `run` (inline; `transmit.pattern_text` carries a measured pattern inline) | `run_scenario` (inline only; `transmit.pattern_csv` is refused) | `/kshana-run` | Run Kshana Scenario | **N/A** (no notebook in 0.38; the scenarios run in any notebook through `run`) | **pending**: no Studio view yet; the scenario runs in the Studio scenario runner and the Tools Command line card |
| Lunar orbit and surface as navigation and geodetic infrastructure: orbit-determination consistency, carrier-phase ambiguity resolution, frame co-estimation, space-tie and Love-number sensitivity (scenario kind `lunar-infrastructure`, `study = ...`; `docs/LUNAR-INFRASTRUCTURE.md`; MODELLED, ILLUSTRATIVE inputs, advisory) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` (and the five sibling examples) | `lunar_infra` | `run`, `run_typed` | `run` | `run_scenario` | `/kshana-run` | Run Kshana Scenario | **N/A** (no notebook; the examples run in any notebook through `run`) | **pending**: no Studio view yet; the scenarios run in the Studio scenario runner and the Tools Command line card |
| Measured clock logs read to a phase series: linuxptp `ptp4l`, `phc2sys`, `ts2phc`, chrony `tracking` and `statistics`, beside RINEX clock, TimeLab and TICC (`[clock_log]` / `[series.clock_log]`; `docs/CLOCK-LOG-FORMATS.md`; MODELLED, no oracle compares a parse with another reader) | a scenario with `[clock_log]` | `clock_log::read_input` | `run` | `run` (`text` inline only; no file reads in a browser) | `run_scenario` (`text` inline only; `path` is refused) | `/kshana-run` | Run Kshana Scenario | **N/A** (no notebook; a log is a file the user supplies) | **pending**: no Studio view; the Studio scenario runner takes the scenario text |
| Optical timing link through the atmosphere: per-site availability, site diversity, enhancement techniques, outage-to-holdover coupling (scenario kind `optical-atmosphere`; `docs/OPTICAL-ATMOSPHERE.md`; MODELLED, ILLUSTRATIVE sites, advisory) | `kshana scenarios/optical-atmosphere-network.toml`, `scenarios/optical-atmosphere-techniques.toml` | `optical_atmosphere`, `optical_weather`, `optical_sitediv`, `optical_techniques`, `optical_outage_holdover` | `run`, `run_typed` | `run` | `run_scenario` | `/kshana-run` | Run Kshana Scenario | `optical-atmosphere` | the Studio's Optical PNT view (`/studio/optical/`, 0.38) draws the two bundled scenarios' recorded results, including the seeded time series; the scenario also runs in the Studio scenario runner and the Tools Command line card |
| Land-polygon download (`interference-map fetch-land`) | `--allow-network` | CLI code | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | Tools: Command line card (needs `--allow-network`) |
| Benchmark (kshana-bench v1: score a submission against a truth file, leaderboard page; `docs/BENCH.md`, MODELLED, advisory) | `bench score`, `bench leaderboard` | `bench::score`, `bench::site::leaderboard_html`, `surface::bench_score`, `surface::bench_leaderboard` | `bench_score`, `bench_leaderboard` | `bench_score`, `bench_leaderboard` | `score_benchmark`, `render_leaderboard` | **N/A** (the two MCP tools carry it; a slash command over two JSON files adds nothing) | **N/A** (not an IDE action) | **N/A** (education notebooks are a separate workstream) | **N/A** (the leaderboard is the static page `bench/site/`, ported to the site as it is; Studio computes nothing) |
| Benchmark data and holdout tools (`bench truth\|cases\|baseline\|seal\|reveal-check\|manifest\|verify-manifest\|validate`) | the same | `bench::tasks`, `bench::seal` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** (the CLI reads dataset directories and clock files and, for `seal`, a secret seed file; a seed must not pass through an agent or a page) |
| Observatory daily product and sensitivity study (`interference-map daily\|sensitivity`; `docs/observatory/METHOD.md`) | `interference-map daily`, `interference-map sensitivity` | `interference_map::observatory` | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** | **N/A** (the commands read an archive directory of hundreds of thousands of files, write four files including a PNG, and enforce the 24 h release delay against the clock of the machine that publishes; the CSV map is on every surface in the row above) |

## Studio

Kshana Studio is the web app built on the WebAssembly build, so a Studio view exists where the
WASM column has an entry point, and where it does not the cell points to a **Command line card** (the
command to run, with its arguments), never to a result Studio computed. Pages (kshana.dev/studio/, client-side): **Maritime trust**
(`trust/`), **Training debrief** (`training/`), **Interference map** (`interference/`), **Geometry** (`geometry/`: a representative skyplot, skyline, DOP, error ellipse and Monte Carlo cloud from the engine; 0.36), **Lunar station** (`lunar/`: the modelled coverage of a lunar reference station from the `lunar-station-coverage` kind; 0.36) and the
**Tools** page, whose sections are OSNMA (`#osnma`), Evidence packs (`#evidence`), Test-bench
export (`#bench`), Compliance mapping (`#compliance`), the Command line tab (telemetry card, IQ,
marine integrations: commands to run) and Use from your AI assistant (`#ai`). A **—** in the Studio column of the subcommand
table is a command that is not one of the 0.35 capabilities Studio presents.

## Why the N/A cells are N/A

- **Signal K and OpenCPN.** They are consumers of the running live process and of its TCP gate, so
  they are command-line deployments; the plugin carries a how-to command and a skill that point to
  `docs/MARINE-INTEGRATIONS.md` and call no tool.

- **A running process.** `receiver-trust live` holds a stream open, can serve the gated stream
  to any number of TCP clients and runs until it is stopped. A Python call, a browser call, an
  MCP tool call and an IDE action each return when they finish and do not hold a socket open
  for others. Python, WASM and MCP carry the bounded form instead: an excerpt scored by the
  same engine, in the live schema (JSON lines 1.3: `position`, an `advisory` statement and the satellite
  `geometry` on every epoch, a `class` on every deduction), with no socket and no gate (the gate marks a fix invalid on a live stream, which only a
  process in the data path can do). Two behaviours belong to the process and are not in the
  excerpt tools: a stream replayed faster than real time through `receiver-trust live` without
  `--replay` is scored untrusted (its time disagrees with the host clock; an excerpt is read
  without a host clock), and `--udp <port>` and `--listen tcp:<port>` bind the loopback address
  unless an address is given.
- **Trust telemetry.** WASM carries `trust_telemetry(input, format, host, input_kind, options_json)`: the same encoders, returning Prometheus text, CEF or LEEF syslog lines, or the OTLP JSON payload for a stream or a batch result, with no clock (syslog lines carry the RFC 5424 nil timestamp) and nothing sent. Python (`trust_telemetry`) and MCP (`trust_telemetry`, with the plugin command `/kshana-trust-telemetry`) carry it too. The rest of `trust-telemetry` serves Prometheus metrics, sends syslog and exports
  OpenTelemetry from a running stream, so it is a process by nature. How-to: pipe the live
  command into it, or replay a result file (`kshana trust-telemetry --result session.result.json
  --print-metrics`); see [`TRUST-TELEMETRY.md`](TRUST-TELEMETRY.md). An agent or a notebook that
  wants the per-epoch scores calls the batch or excerpt functions instead.
- **Creating a pack in the browser.** Signing needs a private key, which should not pass
  through a web page; the browser build verifies packs (`evidence_verify`) and the other
  surfaces create them. The MCP tool never returns or logs the signing seed, and without one it
  signs with a one-time key (integrity, not identity); for a key that matters, use the CLI.
  The same holds for streaming training NMEA to an address: Python, WASM and MCP return the
  generated text, and the CLI sends it.
- **Study suites.** `--study <suite.toml>` runs a manifest that names sibling scenario files on
  disk. The in-memory surfaces take scenario text, not a folder of files, so they run each member
  as a scenario instead (`run`, `run_scenario`, `run_all`).
- **GNSS IQ in the browser, and recordings that are rewritten.** A recording is gigabytes of
  samples, which a page cannot hold and the MCP protocol must not carry, so WASM has no IQ
  functions and the MCP tools read and write one work directory only (`KSHANA_MCP_IQ_DIR`, with a
  per-call sample budget). `iq extract`, `convert` and `decimate` exist to rewrite recordings on
  disk and stay command-line only. `iq labfit` and `iq conditions` carry text, so MCP takes them
  inline (a log that names a file is refused).
- **The land download.** It is the only command that opens a network connection, it needs the
  system `curl` and an explicit `--allow-network`, and it checks a pinned SHA-256. The browser
  has no `curl`, and an AI agent should not fetch data on a user's behalf; the other surfaces
  take the land file as text instead (`land_geojson`).
- **Trace archives and directories.** `interference-map adsb` on a readsb trace directory reads
  files from disk and is command-line only; the in-memory surfaces take CSV text.

## Every command-line subcommand, and who covers it

One row per subcommand or mode of `kshana --help`. **yes** names the entry point; **no** is a gap
with its reason; **N/A** is a surface that cannot carry it for the reason given above or in the
last column. JetBrains actions run the command line, so an **N/A** there states why no IDE action exists.

| Subcommand | Python | WASM | MCP | Plugin | JetBrains | Notebook | Studio | Note |
|---|---|---|---|---|---|---|---|---|
| `kshana <scenario.toml>` (run, chart, table) | `run`, `run_full`, `run_typed` | `run`, `chart_svg`, `summary`, `table_csv`, `run_all` | `run_scenario`, `report_scenario`, `export_table_csv` | `/kshana-run` | Run Kshana Scenario | `quantum-vs-classical-gdop` | — | |
| `--validate <scenario.toml>` | `validate_toml` | `error_kind` (a run throws on an invalid scenario) | `validate_scenario` | `/kshana-run` | Validate Scenario | | — | |
| `--study <suite.toml>` | N/A | N/A | N/A | N/A | **N/A** (names sibling files on disk) | | — | A suite names sibling scenario files on disk (N/A above); run each member as a scenario |
| `--export-sp3/-omm/-oem` | `export_sp3`, `export_omm`, `export_oem` | `export_sp3`, `export_omm`, `export_oem` | `export_sp3`, `export_omm`, `export_oem` | `/kshana-run` | Export Scenario | | — | |
| `--export <czml,kml,geojson,stk,sigmf>` | `export_scenario`, `export_formats` | `export_scenario`, `export_formats` | `export_interop`, `list_export_formats` | `/kshana-run` | Export Scenario | | — | Files come back as text (`utf-8`) or base64 (the SigMF samples) |
| `--import-route` | `import_route` | `import_route` | `import_route` | `/kshana-import-route` | Import Route | | — | |
| `--animate <svg,html,frames>` | `animate_scenario` | `animate_scenario` | `animate_scenario` | `/kshana-run` | Animate Scenario | | — | At most 120 frames per call; longer sequences use the CLI |
| `sky <request>` (or flags), `--monte-carlo`, `--svg` | `sky_geometry`, `sky_monte_carlo`, `skyplot_svg` | `sky_geometry`, `sky_monte_carlo`, `skyplot_svg` | `sky_geometry` (no Monte Carlo, no SVG) | `/kshana-run` | **N/A** (see the capability row) | | — | MODELLED geometry; JSON or SVG out |
| `skyline --preset`, `--presets`, `--profile` | `skyline_presets`, `skyline_profile` | `skyline_presets`, `skyline_profile` | `sky_geometry` (`skyline_preset`) | `/kshana-run` | **N/A** (see the capability row) | | — | REPRESENTATIVE presets with provenance |
| `kinds [--json]` | `scenario_kinds`, `list_kinds` | `list_kinds` | `list_scenario_kinds` | `/kshana-run` | List Scenario Kinds | | — | |
| `example [<name>]` | `list_examples`, `get_example` | `list_examples`, `get_example` | `list_example_scenarios`, `get_example_scenario` | `/kshana-run` | Insert Example Scenario | | — | The `python` and `wasm` features compile the example text in (about 0.7 MB) |
| `receiver-trust <scenario.toml>` (batch) | `receiver_trust`, `assess_vessel_log` | `receiver_trust`, `assess_vessel_log` | `assess_receiver_log`, `assess_vessel_log` | `/kshana-assess-receiver` | Assess Receiver Trust | `vessel-trust-and-training` | Maritime trust page | |
| `receiver-trust live` | excerpt: `receiver_trust_replay` | excerpt: `receiver_trust_replay` | excerpt: `assess_vessel_stream` | excerpt | Assess Receiver Stream (a stored log, `--file`) | | Maritime trust page (excerpt); Command line card for the process | A running process; the excerpt has no socket and no gate (N/A above) |
| `trust-telemetry` | `trust_telemetry` | `trust_telemetry` | `trust_telemetry` | `/kshana-trust-telemetry` | Render Trust Telemetry (a stored result) | `vessel-trust-and-training` | Tools: Telemetry card (Command line tab; formats only, no sockets) | Text only on every surface, no socket; the running exporters are a process (see above) |
| `imu-fit <imu.csv>` | `imu_fit` | `imu_fit` | `fit_imu_log` | `/kshana-fit-imu` | N/A | | — | Text in, JSON out; MODELLED |
| `osnma verify <pages\|vectors.csv\|stream.ubx>` | `osnma_verify` | `osnma_verify` | N/A (see above) | N/A (see above) | N/A (see above) | | Tools: OSNMA | Same JSON as `--json`, with the advisory in its `advisory` field; the file read becomes bytes in memory. Authentication status only: not a navigation integrity service, and no anti-spoofing performance claim |
| `receiver-trust evidence` (create a pack) | `evidence_create` | N/A | `create_evidence_pack` | `/kshana-evidence-pack` | Create Evidence Pack | `vessel-trust-and-training` | Tools: Command line card (no signing key in a page) | No signing key in a browser |
| `jammertest import`, `jammertest score` | `jammertest_import`, `jammertest_score` | `jammertest_import`, `jammertest_score` | `jammertest_import`, `jammertest_score` | `/kshana-jammertest` | **N/A** (terminal; needs files) | | **pending**: Tools: Command line card | Plan and catalogue are given as text; the signed pack (`--key`) is command line only (signing key) |
| `evidence round-trip` | `evidence_round_trip` | N/A | `create_round_trip_pack` | `/kshana-evidence-pack` | **N/A** (as above) | | Tools: Command line card (no signing key in a page) | No signing key in a browser; no signal is written or replayed |
| `evidence verify` | `evidence_verify` | `evidence_verify` | `verify_evidence_pack` | `/kshana-evidence-pack` | Verify Evidence Pack (pinned key only) | `vessel-trust-and-training` | Tools: Evidence packs (verify, attach timestamp) | |
| `evidence keygen` | `evidence_keygen` | N/A | N/A | N/A | **N/A** (a private key is never made or read by the plugin) | | Tools: Command line card | Python returns the key in memory with a warning; a private key should not pass through a conversation or a page |
| `evidence attach-timestamp` | `evidence_attach_timestamp` | `evidence_attach_timestamp` | `attach_evidence_timestamp` | `/kshana-evidence-pack` | Attach Timestamp | | Tools: Evidence packs (verify, attach timestamp) | Token as bytes or base64, updated pack returned in memory; the authority's signature is not checked (`openssl ts -verify`) |
| `nmea-scenario <scenario.toml>` | `nmea_training` | `nmea_training` | `generate_training_nmea` | `/kshana-training-scenario` | Generate Training NMEA | `vessel-trust-and-training` | Training debrief page | |
| `nmea-scenario --tcp/--udp` | N/A | N/A | N/A | N/A | **N/A** (see Note) | | Tools: Command line card | Sends to an address (N/A above) |
| `interference-map adsb\|ais` (CSV) | `interference_map` | `interference_map` | `build_interference_map` | `/kshana-interference-map` | Build Interference Map | `interference-map-route-exposure` | Interference map page | |
| `interference-map adsb` (trace directory) | N/A | N/A | N/A | N/A | **N/A** (see Note) | | Tools: Command line card | Reads a directory (N/A above) |
| `interference-map fetch-land` | N/A | N/A | N/A | N/A | **N/A** (see Note) | | Tools: Command line card | Network access (N/A above) |
| `interference-map daily`, `sensitivity` | N/A | N/A | N/A | N/A | **N/A** (see Note) | | — | Reads an archive directory and writes files; the release delay is enforced on the publishing machine (N/A above) |
| `bench score` | `bench_score` | `bench_score` | `score_benchmark` | N/A (the MCP tool carries it) | **N/A** | | — | Text in, text out; nothing read or written |
| `bench leaderboard` | `bench_leaderboard` | `bench_leaderboard` | `render_leaderboard` | N/A (the MCP tool carries it) | **N/A** | | the static page `bench/site/` | HTML text |
| `bench truth\|cases\|baseline\|seal\|reveal-check\|manifest\|verify-manifest\|validate` | N/A | N/A | N/A | N/A | **N/A** | | — | Dataset files and a secret seed (N/A above) |
| `route-exposure` | `route_exposure` | `route_exposure` | `route_exposure` | `/kshana-interference-map` | Route Exposure | `interference-map-route-exposure` | Interference map page | |
| `bench-export` | `bench_export` | `bench_export` | `export_test_bench` | `/kshana-bench-export` | Export Test-Bench Files | | Tools: Test-bench export | Returns text, writes nothing; no signal |
| `compliance-report` | `compliance_report` | `compliance_report` | `compliance_report` | `/kshana-compliance-report` | Build Compliance Report | | Tools: Compliance mapping | |
| `compliance-report --mapping`, `--sources` | `compliance_mapping` | `compliance_mapping` | `compliance_mapping` | `/kshana-compliance-report` | Show Compliance Mapping | | — | |
| `iq scene` | `iq_scene`, `iq_scene_broadcast` | N/A | `iq_scene` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | Samples are files. `--format sdrx[:ci16_le]` (or an out path ending `.sdrx`) writes ION GNSS SDR metadata beside the samples: the CLI and MCP (`format: "sdrx"`) write it; Python returns the samples in memory and writes no file, so the metadata has no Python form (**N/A**) |
| `standards-pack list`, `run`, `rows`, `tests` | `standards_pack_list`, `standards_pack_run` | `standards_pack_list`, `standards_pack_run` | `list_standards_packs`, `run_standards_pack` | `/kshana-standards-pack` | **N/A** (as above) | | Tools: Command line card | Scenarios are embedded; no file system; `rows` and `tests` print the committed doc tables and are CLI-only |
| `partner check <submission.toml>` | N/A | N/A | N/A | N/A | N/A | | — | Reads a submission file and its data file on disk and verifies the SHA-256; none of those surfaces has the folder. Format and metadata only, nothing scored; see `docs/PARTNER-DATA.md` |
| `lunanet-afs-check spec`, `symbols`, `generate` | `lunanet_afs_check_spec`, `lunanet_afs_check_symbols`, `lunanet_afs_generate` | `lunanet_afs_check_spec`, `lunanet_afs_check_symbols`, `lunanet_afs_generate` | `lunanet_afs_check` | `/kshana-lunanet-afs-check` | **N/A** (as above) | | — | Symbol streams are text of 0 and 1, at most 4 MiB (MCP) or 100 frames generated per call; LDPC and CRC-24Q of subframes 2 to 4 are not verified; no signal is written |
| `iq scene` | `iq_scene`, `iq_scene_broadcast` | N/A | `iq_scene` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | Samples are files |
| `iq acquire` | `iq_acquire`, `iq_acq_surface` | N/A | `iq_acquire` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq track` | `iq_track`, `iq_loop_designs` | N/A | `iq_track` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq sweep` | `iq_sweep` | N/A | `iq_sweep` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq labfit` | `iq_labfit` | N/A | `iq_labfit` (logs inline, no files) | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq frontend` | `iq_frontend` | N/A | `iq_frontend` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq monitor` | `iq_monitor` | N/A | `iq_monitor` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | `--follow [--idle-timeout <s>]` reads a SigMF recording that is still being written, receive only (`iq::io::follow::open_sigmf_follow` in Rust): **N/A** for Python and MCP, because a call that waits for a file to grow does not return when the work is done, the reason `receiver-trust live` is also command-line only; the recording at its current length runs through `iq_monitor` |
| `iq campaign`, `iq campaign report` | `iq_campaign`, `iq_campaign_report` | N/A | `iq_campaign`, `iq_campaign_status` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq conditions` | `iq_test_conditions` | N/A | `iq_test_conditions` (text, inline) | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | |
| `iq inventory`, `info` | `iq_inventory`, `iq_info` | N/A | `iq_info` | `/kshana-iq` | **N/A** (recordings are gigabytes of files; see Note) | | — | Inventory of a folder is Python and CLI; the MCP server reads one work directory |
| `iq extract`, `convert`, `decimate` | N/A | N/A | N/A | N/A | **N/A** (see Note) | | — | They rewrite recordings on disk (N/A above) |
| the signal list (`iq --help`) | `iq_signals` | N/A | `iq_signals` | `/kshana-iq` | **N/A** (a list; run `kshana iq --help`) | | — | |

## Utility functions

Small entry points that are not a capability row, and where each lives:

| Function | Surface | What it is |
|---|---|---|
| `version` | Python (`kshana.version()`, `kshana.__version__`), WASM (`version`), CLI (`--version`), MCP (the server info) | The engine version |
| `iq_read_epochs` | Python | Reads a `kshana.track-epoch/1` binary file that `kshana iq track --epochs` wrote. **N/A** elsewhere: it reads a file from disk (WASM has no file system, MCP reads one work directory only through the `iq_*` tools) |
| `encode_permalink`, `decode_permalink` | WASM | The `?s=` share-link codec of the browser playground (scenario TOML to a URL-safe token and back). **N/A** elsewhere: a link to a web page has no meaning for a command line, a Python call or an agent |

## Limits that differ by surface

| Surface | Input limit | Files |
|---|---|---|
| MCP | 4 MiB per text input (2 MiB and 20,000 epochs for a stream excerpt); replies carry at most 2000 NMEA lines, 200 non-nominal epoch lines and 4 MiB of GeoJSON or pack files | inline content only: a scenario field that names a file is refused; the `iq_*` tools use one opt-in work directory, with every path confined to it |
| MCP over HTTP (`--http`, self-hosted) | as MCP, with a 5 MiB request body, 120 s per request and 8 requests at once by default | none: the `iq_*` file tools are off; every other tool takes inline content |
| Python, Rust | 64 MiB per text input | `receiver_trust` may name a `path` the process can read |
| WASM | 64 MiB per text input, inside the browser's own memory | none: the browser has no file system, nothing is uploaded |

## Evidence tiers and caveats on every surface

- An evidence pack is a **technical record** of what the engine computed from a log under stated
  settings, with every hash and a signature over them. It is not a legal opinion, a finding of
  fact about any event or an approval. A pass of verify says the record is unchanged; with no
  trusted public key it proves only integrity against the key the pack names itself.
- The receiver-trust monitors and the trust score are **MODELLED**: thresholds are stated
  inputs and nothing asserts how they perform against real interference. The output is
  **advisory**; Kshana is not type-approved navigation equipment (IEC 61108, IEC 61162) and
  the operator remains responsible. A high score is not proof of a genuine fix.
- The interference map is **MODELLED** (pre-registered thresholds, not validated against a
  ground-truth measurement). A degraded cell does not identify interference as the cause; a
  cell not observed is not evidence of a clear route; it describes past reports and is not a
  forecast. It is aggregate only: no identifier is returned.
- Training NMEA is **text only**: no RF, IQ or waveform is synthesised, nothing is transmitted,
  and it is never for a vessel's live navigation systems.

## The evidence label, and the outputs that carry none

Every figure and table a run writes carries its evidence tier (`VALIDATED`, `MODELLED` or `PARTNER`, the weakest of the
ledger rows behind it) and the ids of those rows, on every surface that runs a scenario: the result JSON (`evidence`
key), the chart SVG (metadata element and a line under the plot) and the CSV table (`# evidence:` comment lines). The
same label is on the receiver-trust outputs (CLI, MCP, Python), `jammertest score --json`, `iq acquire`, `iq sweep`,
`iq track --summary`, `iq monitor --json`, the interference-map route report, and inside the `config.json` of every
evidence pack (signed; `kshana evidence verify` reports it). Row ids are stable (`VM-` and eight hex digits, the `ID`
column of `docs/VERIFICATION-MATRIX.md`).

These outputs carry no label, each for a stated reason (the list is `UNLABELLED_WRITERS` in
`tests/evidence_labels_doc_sync.rs`, which fails on a writer that is neither labelled nor listed):

| Output | Why it carries no label |
|---|---|
| kshana-bench result files | a fixed schema pinned by the holdout commitments; each carries its own `label` (MODELLED or measured) |
| interference observatory daily products (GeoJSON, PNG, incident JSON) | a frozen, published schema; the method note's caveats travel with them |
| IQ campaign cell, scorecard and report files | digest-pinned; each states the campaign scorecard it restates |
| IQ samples, SigMF and SDR metadata, scene truth, track epoch and event streams, live session logs | format-bound files and record streams read by other tools |
| SP3, OMM, OEM, CZML, KML, GeoJSON, STK, test-bench motion and NMEA exports; the NMEA training stream | format-bound files read by third-party tools |
| telemetry wire formats (Prometheus, OTLP, CEF, LEEF) | defined by their wire formats |
| generated documents (the ledger itself, the committed study and data tables) | not the output of a run |
