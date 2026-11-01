// SPDX-License-Identifier: AGPL-3.0-only
// What the Studio offers for each Kshana 0.35 feature, in one place: where a feature runs in the browser
// (a page and what it does there), or the plain reason it cannot and the command that does it. The tools hub
// draws its coverage table and its "command line" cards from this; tools35-data.test.mjs checks that every
// feature either has a page or says why not, and that every page and command named exists.
//
// The reasons follow docs/SURFACES.md ("Why the N/A cells are N/A"). Pure data, except that the text a person reads is
// lazy (getters, and pairs whose text element is a getter) so it is looked up when drawn, in the current language.
import { t } from "./t.mjs";

const lazyBoth = (f0, f1) => { const a = [null, null]; Object.defineProperty(a, 0, { get: f0, enumerable: true }); Object.defineProperty(a, 1, { get: f1, enumerable: true }); return Object.freeze(a); };
// [a, b] with element `i` computed on every read (JSON.stringify, destructuring and indexing all see the text).
const lazyPair = (i, fn, other) => { const a = [other, other]; Object.defineProperty(a, i, { get: fn, enumerable: true }); return Object.freeze(a); };

// Pages of the Studio, relative to the Studio's folder. Tool tabs are #fragments of tools/.
export const PAGES = Object.freeze({
  geometry: { href: "geometry/", get label() { return t("js-t35data-page-geometry", "Geometry: skyplot, skyline and DOP"); } },
  trust: { href: "trust/", get label() { return t("js-t35data-page-trust", "Maritime trust"); } },
  training: { href: "training/", get label() { return t("js-t35data-page-training", "Training debrief"); } },
  interference: { href: "interference/", get label() { return t("js-t35data-page-interference", "Interference map"); } },
  evidence: { href: "tools/#evidence", get label() { return t("js-t35data-page-evidence", "Evidence packs"); } },
  bench: { href: "tools/#bench", get label() { return t("js-t35data-page-bench", "Test-bench export"); } },
  compliance: { href: "tools/#compliance", get label() { return t("js-t35data-page-compliance", "Compliance mapping"); } },
  osnma: { href: "tools/#osnma", get label() { return t("js-t35data-page-osnma", "OSNMA verification"); } },
  jammertest: { href: "tools/#jammertest", get label() { return t("js-t35data-page-jammertest", "Jammertest scoring"); } },
  imufit: { href: "tools/#imufit", get label() { return t("js-t35data-page-imufit", "IMU fit"); } },
  cli: { href: "tools/#cli", get label() { return t("js-t35data-page-cli", "Command-line features"); } },
  ai: { href: "tools/#ai", get label() { return t("js-t35data-page-ai", "Use from your AI assistant"); } },
});

// id, feature, studio (page ids with what each does), cli (the command), why (when something cannot run in a browser)
export const FEATURES = Object.freeze([
  { id: "maritime-trust", get name() { return t("js-t35data-feat-maritime-trust-name", "Maritime trust score for a moving vessel (0 to 100, with reasons)"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-maritime-trust-trust", "Open a result or a live JSON-lines run and see the track, score, reasons and gate; score an NMEA log here"), "trust")],
    cli: "kshana receiver-trust session.toml" },
  { id: "live-gate", get name() { return t("js-t35data-feat-live-gate-name", "Live trust stream, gate and listener (stdin, file, TCP, UDP, --gate, --listen)"); },
    studio: [], cli: "kshana receiver-trust live session.toml --gate --listen tcp:10110", card: "marine",
    get why() { return t("js-t35data-feat-live-gate-why", "It is a running process in the data path. A page returns when it finishes and cannot hold a socket open for a chart plotter, nor mark a fix invalid in a live stream. The Studio scores a bounded excerpt instead, in the same live format, with no gate."); } },
  { id: "nmea-training", get name() { return t("js-t35data-feat-nmea-training-name", "NMEA training streams with an instructor log"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-nmea-training-training", "Generate a stream and its instructor log here, download them, and run the trainer debrief"), "training")],
    cli: "kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea" },
  { id: "training-stream", get name() { return t("js-t35data-feat-training-stream-name", "Streaming a training stream to a TCP or UDP address"); },
    studio: [], cli: "kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.50:10110 --speed 10", card: "training-stream",
    get why() { return t("js-t35data-feat-training-stream-why", "It sends to a network address, which a web page does not do. The Studio generates the text and you download it."); } },
  { id: "interference-map", get name() { return t("js-t35data-feat-interference-map-name", "Interference map (ADS-B and AIS) and route exposure"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-interference-map-interference", "Open map files, or build a map from CSV here, and check a route against it"), "interference")],
    cli: "kshana interference-map adsb day.csv --dataset custom --out maps/" },
  { id: "telemetry", get name() { return t("js-t35data-feat-telemetry-name", "Telemetry export: Prometheus metrics, syslog CEF and LEEF, OpenTelemetry"); },
    studio: [], cli: "kshana trust-telemetry --result session.result.json --print-metrics", card: "telemetry",
    get why() { return t("js-t35data-feat-telemetry-why", "It serves metrics, sends syslog and exports OpenTelemetry from a running stream: a process that talks to your monitoring systems, which a page cannot be."); } },
  { id: "evidence", get name() { return t("js-t35data-feat-evidence-name", "Signed evidence packs"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-evidence-evidence", "Verify a pack and attach a timestamp token, here"), "evidence")],
    cli: "kshana evidence verify pack/ --pubkey signer.key.pub",
    get why() { return t("js-t35data-feat-evidence-why", "Creating a pack needs a private signing key, which should not pass through a web page. Packs are made with the command line, Python or the AI assistant tools."); }, card: "evidence-create" },
  { id: "bench", get name() { return t("js-t35data-feat-bench-name", "Test-bench export for a laboratory simulator"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-bench-bench", "Export the motion, NMEA, waypoints and events of a scenario, here"), "bench")],
    cli: "kshana bench-export scenarios/gnss-ins.toml --out run1 --epoch 2025-03-01T10:00:00Z" },
  { id: "compliance", get name() { return t("js-t35data-feat-compliance-name", "Compliance mapping to public resilience frameworks"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-compliance-compliance", "See which framework rows your runs support evidence for, and the mapping tables, here"), "compliance")],
    cli: "kshana compliance-report run.result.json" },
  { id: "iq", get name() { return t("js-t35data-feat-iq-name", "GNSS IQ monitors and tools (scene, acquire, track, sweep, front end, monitor, campaigns)"); },
    studio: [], cli: "kshana iq monitor --help", card: "iq",
    get why() { return t("js-t35data-feat-iq-why", "A recording is gigabytes of samples, which a page cannot hold, and some commands rewrite recordings on disk. The browser build has no IQ functions."); } },
  { id: "marine", get name() { return t("js-t35data-feat-marine-name", "Marine integrations: Signal K plugin and OpenCPN"); },
    studio: [], cli: "kshana receiver-trust live session.toml --gate --listen tcp:10110", card: "marine",
    get why() { return t("js-t35data-feat-marine-why", "They consume the running live process and its TCP gate, so they are deployments on a boat computer, not something a page can run."); } },
  { id: "osnma", get name() { return t("js-t35data-feat-osnma-name", "Galileo OSNMA verification (UBX SFRBX input)"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-osnma-osnma", "Load a recorded file and see the per-satellite, per-tag authentication status"), "osnma")],
    cli: "kshana osnma verify capture.ubx --json" },
  { id: "jammertest", get name() { return t("js-t35data-feat-jammertest-name", "Jammertest as a referee: the published test plan as scheduled truth, a receiver log scored against it (0.38)"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-jammertest-jammertest", "Import the plan for a log's time span, or score a receiver log (UBX, RINEX, Android, NMEA or Septentrio SBF) per test: detection latency, missed, false alarms, time to recover; MODELLED"), "jammertest")],
    cli: "kshana jammertest score session.toml --catalog catalogue.json --plan plan.json --out scorecard" },
  { id: "machines", get name() { return t("js-t35data-feat-machines-name", "Receiver and sensor inputs: RTKLIB .pos, NovAtel OEM7, RTCM 3 MSM, GNSS-SDR, an IMU for the heading, and an IMU fit for the hybrid and fusion scenarios (0.38)"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-machines-trust", "Open a log in any of these formats (and an optional IMU file) in the generic receiver-trust run; NovAtel's own jammer flag is compared with Kshana's alarms"), "trust"), lazyPair(1, () => t("js-t35data-feat-machines-imufit", "Fit the accelerometer and gyro parameters of the hybrid and fusion scenarios from a stationary IMU log; MODELLED"), "imufit")],
    cli: "kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu" },
  { id: "ai", get name() { return t("js-t35data-feat-ai-name", "Use from an AI assistant (MCP server)"); },
    studio: [lazyPair(1, () => t("js-t35data-feat-ai-ai", "Install options for the MCP server, with the questions each tool answers"), "ai")],
    cli: "cargo install kshana-mcp" },
]);

// Cards for the "Command line" tab: what, why not in a browser, exact commands (from the documentation), and a
// recorded sample of real output when one has been made (tools/samples/<file>, written by tools_cli_samples.mjs).
export const CLI_CARDS = Object.freeze([
  { id: "telemetry", get title() { return t("js-t35data-card-telemetry-title", "Trust as security telemetry"); },
    get what() { return t("js-t35data-card-telemetry-what", "Turns the trust stream (score, band, reasons) into Prometheus metrics, syslog events in CEF or LEEF for a SIEM, and OpenTelemetry. It reads the stream and never changes the assessment."); },
    get why() { return t("js-t35data-card-telemetry-why", "It is a process that serves metrics and sends to your monitoring systems, so it runs next to the receiver, not in a page."); },
    commands: ["kshana receiver-trust live session.toml | kshana trust-telemetry", "kshana trust-telemetry --result session.result.json --print-metrics", "kshana trust-telemetry --result session.result.json --print-syslog --format leef", "kshana trust-telemetry --input stream.jsonl --syslog-udp siem.example:514 --format cef --host ops-gw1"],
    docs: "trust-telemetry", samples: [lazyPair(0, () => t("js-t35data-sample-telemetry-metrics", "Prometheus metrics for the demo run"), "telemetry-metrics.txt"), lazyPair(0, () => t("js-t35data-sample-telemetry-cef", "Syslog in CEF for the demo run"), "telemetry-cef.txt"), lazyPair(0, () => t("js-t35data-sample-telemetry-leef", "Syslog in LEEF for the demo run"), "telemetry-leef.txt")] },
  { id: "iq", get title() { return t("js-t35data-card-iq-title", "GNSS IQ monitors and tools"); },
    get what() { return t("js-t35data-card-iq-what", "Build a scene, acquire and track signals, sweep parameters, model a front end, run IQ monitors and campaigns, fit a laboratory log. Also available from Python and, inside one work folder, from the AI assistant tools."); },
    get why() { return t("js-t35data-card-iq-why", "A recording is gigabytes of samples. A page cannot hold it, and the commands that convert, extract and decimate rewrite recordings on disk."); },
    commands: ["kshana iq --help", "kshana iq monitor --help", "kshana iq scene --help"],
    docs: "capability-reference", samples: [lazyPair(0, () => t("js-t35data-sample-iq-help", "The IQ command list"), "iq-help.txt")] },
  { id: "marine", get title() { return t("js-t35data-card-marine-title", "Marine integrations"); },
    get what() { return t("js-t35data-card-marine-what", "A Signal K server plugin and OpenCPN through gate-mode NMEA over TCP put the trust score on software boaters already run; a reference build puts it on a small computer next to the receiver."); },
    get why() { return t("js-t35data-card-marine-why", "They are consumers of the running live process and of its TCP gate: deployments on the boat's computer."); },
    commands: ["kshana receiver-trust live session.toml --gate --listen tcp:10110", "# Signal K: copy integrations/signalk/ into the server's node_modules, restart, enable \"Kshana GNSS trust\""],
    docs: "marine-integrations", samples: [] },
  { id: "training-stream", get title() { return t("js-t35data-card-training-stream-title", "Training streams to a TCP or UDP address"); },
    get what() { return t("js-t35data-card-training-stream-what", "Sends a generated training stream to a bridge simulator or a chart plotter in real time or faster. The Studio's training page generates the same text and lets you download it."); },
    get why() { return t("js-t35data-card-training-stream-why", "Sending to a network address is something a browser page does not do. The stream is text only and never for a vessel's live navigation systems."); },
    commands: ["kshana nmea-scenario scenarios/training/open-sea-jamming.toml --tcp 0.0.0.0:10110", "kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.50:10110 --speed 10", "kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.255:10110 --broadcast"],
    docs: "nmea-training", samples: [] },
  { id: "evidence-create", get title() { return t("js-t35data-card-evidence-create-title", "Create an evidence pack"); },
    get what() { return t("js-t35data-card-evidence-create-what", "Signs a window of a receiver log and what the engine computed from it, so anyone can check that nothing was changed afterwards. The Studio verifies packs."); },
    get why() { return t("js-t35data-card-evidence-create-why", "Signing needs a private key, which should not pass through a web page."); },
    commands: ["kshana evidence keygen --out signer.key", "kshana receiver-trust evidence session.toml --from 100 --to 260 --key signer.key --out pack/ --title \"Berth 4, 14 June\"", "kshana evidence verify pack/ --pubkey signer.key.pub"],
    docs: "evidence-packs", samples: [] },
  { id: "land", get title() { return t("js-t35data-card-land-title", "Land-polygon download for the on-land AIS detector"); },
    get what() { return t("js-t35data-card-land-what", "Fetches one pinned land file (Natural Earth, public domain) and checks its SHA-256. The map builder takes the land file as text instead."); },
    get why() { return t("js-t35data-card-land-why", "It is the only command that opens a network connection, and it needs the system curl and an explicit flag."); },
    commands: ["kshana interference-map fetch-land --out ne_10m_land.geojson --allow-network"],
    docs: "interference-map", samples: [] },
]);

// The docs page of a card, as the site's docs slug.
export const docsHref = (slug) => `../docs/${slug}.html`;

// Which tool answers which question, from docs/AGENTS.md ("Which tool for which question"). Names are the MCP tools.
export const AI_QUESTIONS = Object.freeze([
  lazyPair(0, () => t("js-t35data-ai-q-run-scenario", "Run or explain a PNT scenario (orbits, GNSS, timing, fusion, lunar)"), "run_scenario, report_scenario, validate_scenario, list_example_scenarios"),
  lazyPair(0, () => t("js-t35data-ai-q-trustworthy-log", "Was this receiver log, or this vessel's NMEA, trustworthy, and when did it stop being?"), "assess_receiver_log, assess_vessel_stream"),
  lazyPair(0, () => t("js-t35data-ai-q-training-nmea", "I need synthetic NMEA with a jamming, drag-off, time-spoof or replay event for training"), "generate_training_nmea"),
  lazyPair(0, () => t("js-t35data-ai-q-interference-route", "Where has GNSS looked degraded, and how much of this route is in it?"), "build_interference_map, route_exposure"),
  lazyPair(0, () => t("js-t35data-ai-q-evidence-pack", "Check or make an evidence pack of a trust event"), "verify_evidence_pack, create_evidence_pack"),
  lazyBoth(() => t("js-t35data-ai-q-osnma-satellites", "Which Galileo satellites' navigation data does this receiver stream authenticate (OSNMA)?"), () => t("js-t35data-ai-tool-osnma-satellites", "none on MCP: use osnma_verify (the OSNMA card here, WebAssembly), kshana osnma verify (CLI) or kshana.osnma_verify (Python)")),
  lazyPair(0, () => t("js-t35data-ai-q-bench-export", "Export a scenario's motion and events for a laboratory simulator"), "export_test_bench"),
  lazyPair(0, () => t("js-t35data-ai-q-compliance-rows", "Which public-framework rows do these runs support evidence for?"), "compliance_report, compliance_mapping"),
  lazyPair(0, () => t("js-t35data-ai-q-iq-recordings", "GNSS IQ recordings (scene, acquire, track, front end, campaigns)"), "iq_signals first, then the iq_* tools"),
]);
