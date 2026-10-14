// SPDX-License-Identifier: AGPL-3.0-only
// Headless smoke test for the WebAssembly bindings: load the wasm-pack (--target
// web) module in Node, run a clock scenario, and assert the JSON parses and the
// version is non-empty. Run in CI by the `test-wasm-bindings` job after a build.
import init, { run, run_typed, scenario_kinds, error_kind, list_kinds, chart_svg, version, nmea_training, receiver_trust_replay, assess_vessel_log, interference_map, route_exposure, bench_export, compliance_report, compliance_mapping, list_examples, get_example, export_formats, export_scenario, import_route, animate_scenario, export_sp3, trust_telemetry, osnma_verify, iq_signals, iq_run_short } from "./pkg/kshana.js";
import { readFile } from "node:fs/promises";

const SCENARIO = `
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 600.0
[gnss]
windows = [ {t0=0.0,t1=120.0,state="nominal"}, {t0=120.0,t1=600.0,state="denied"} ]
[clock_quantum]
id = "optical"
provenance = "test"
y0 = 1.0e-13
q_wf = 1.0e-26
q_rw = 1.0e-34
[clock_classical]
id = "csac"
provenance = "test"
y0 = 1.0e-11
q_wf = 1.0e-24
q_rw = 1.0e-32
`;

const wasmBytes = await readFile(new URL("./pkg/kshana_bg.wasm", import.meta.url));
await init({ module_or_path: wasmBytes });

const v = version();
if (!v || v.split(".").length !== 3) {
  console.error(`bad version: ${v}`);
  process.exit(1);
}

const out = run(SCENARIO);
const result = JSON.parse(out);
if (!result.schema_version || !result.quantum || !result.quantum.adev_curve?.length) {
  console.error("wasm run() produced unexpected JSON");
  process.exit(1);
}

const fh = result.quantum.filter_health;
if (!fh || typeof fh.nis_mean !== "number" || typeof fh.consistent !== "boolean") {
  console.error("wasm run() produced no filter_health block");
  process.exit(1);
}

// Orbit pack emits the propagated user ECI track (km) for the 3D viz. Assert the
// field is a non-empty array of [x,y,z] km with a physically sane radius. Two
// oracles, both independent of our own output:
//   - generic LEO/MEO bound: |r| ∈ [6500, 50000] km (LLO ~6700-7200, MEO/GPS ~26560).
//   - GPS oracle: a user configured at the GPS semi-major axis (26,559.7 km,
//     IS-GPS-200 nominal) must read back |r| ≈ 26,560 km ± 2000 km.
const ORBIT_GPS_USER = `
kind = "orbit"
seed = 7
threshold_ns = 10.0
mask_deg = 5.0
[time]
step_s = 120.0
duration_s = 43200.0
[user]
altitude_km = 20188.7   # 26,559.7 km radius above the 6371 km mean Earth radius
inclination_deg = 55.0
u0_deg = 0.0
[constellation]
altitude_km = 20180.0
inclination_deg = 55.0
planes = 3
sats_per_plane = 3
phasing_f = 1.0
[clock_quantum]
id = "optical"
provenance = "test"
y0 = 1.0e-15
q_wf = 1.0e-30
q_rw = 1.0e-40
[clock_classical]
id = "csac"
provenance = "test"
y0 = 1.0e-11
q_wf = 9.0e-20
q_rw = 1.0e-28
`;

const orbit = JSON.parse(run(ORBIT_GPS_USER));
const track = orbit.eci_track;
if (!Array.isArray(track) || track.length === 0) {
  console.error("orbit run() produced no non-empty eci_track");
  process.exit(1);
}
const ok3 = (p) => Array.isArray(p) && p.length === 3 && p.every((n) => typeof n === "number");
if (!track.every(ok3)) {
  console.error("eci_track samples are not all [x,y,z] number triples");
  process.exit(1);
}
const radius = (p) => Math.hypot(p[0], p[1], p[2]);
const r0 = radius(track[0]);
if (r0 < 6500 || r0 > 50000) {
  console.error(`eci_track first radius ${r0.toFixed(1)} km outside generous [6500,50000] km`);
  process.exit(1);
}
// IS-GPS-200 nominal GPS semi-major axis: 26,559.7 km.
if (Math.abs(r0 - 26559.7) > 2000) {
  console.error(`GPS-altitude user radius ${r0.toFixed(1)} km not ≈ 26,560 km (IS-GPS-200)`);
  process.exit(1);
}

// Ephemeris / ground-track pack: propagate the ISS for one revolution and assert
// the playground surface emits the full state (position AND velocity), the frame
// chain, the WGS-84 ground track and the station Doppler. Oracles are independent
// of our own output — they are textbook facts about the ISS:
//   - a ground track reaches latitude = orbital inclination, here 51.64°, so
//     |lat| must stay within ~52.5° (a broken TEME→ECEF transform breaks this);
//   - the ISS flies at ~400-420 km altitude and ~7.66 km/s.
const ISS_EPHEMERIS = `
kind = "ephemeris"
tle = """
1 25544U 98067A   20045.18587073  .00000950  00000-0  25302-4 0  9990
2 25544  51.6443 242.0161 0004885 264.6060 207.3845 15.49165514212791
"""
step_s = 60.0
duration_s = 5580.0
dut1_s = 0.0
xp_arcsec = 0.0
yp_arcsec = 0.0
[station]
lat_deg = 49.8707
lon_deg = 8.6217
alt_m = 144.0
`;

const eph = JSON.parse(run(ISS_EPHEMERIS));
if (!eph.n_samples || !Array.isArray(eph.samples) || eph.samples.length === 0) {
  console.error("ephemeris run() produced no samples");
  process.exit(1);
}
// Inclination oracle: ISS i = 51.64°, so the ground track must stay within ±52.5°.
if (eph.lat_max_deg > 52.5 || eph.lat_min_deg < -52.5) {
  console.error(
    `ephemeris ground-track latitude [${eph.lat_min_deg.toFixed(2)}, ${eph.lat_max_deg.toFixed(2)}]° ` +
      "exceeds the ISS inclination bound (±52.5°) — TEME→ECEF transform suspect",
  );
  process.exit(1);
}
// Altitude oracle: ISS is a ~400-420 km LEO satellite.
if (eph.alt_min_km < 380 || eph.alt_max_km > 460) {
  console.error(`ephemeris altitude [${eph.alt_min_km.toFixed(1)}, ${eph.alt_max_km.toFixed(1)}] km not ISS-like (~400 km)`);
  process.exit(1);
}
// Speed oracle: ISS inertial speed ≈ 7.66 km/s.
if (eph.speed_max_m_s < 7000 || eph.speed_max_m_s > 8000) {
  console.error(`ephemeris speed ${(eph.speed_max_m_s / 1000).toFixed(3)} km/s not ISS-like (~7.66 km/s)`);
  process.exit(1);
}
// The headline audit fix: velocity is no longer discarded — every sample carries
// the TEME and GCRS state (r AND v), plus the station range-rate / Doppler.
const s0 = eph.samples[0];
const finiteVec = (a) => Array.isArray(a) && a.length === 3 && a.every((n) => typeof n === "number" && isFinite(n));
if (!finiteVec(s0.teme_v_m_s) || !finiteVec(s0.gcrs_v_m_s) || !finiteVec(s0.gcrs_r_m) || !finiteVec(s0.ecef_r_m)) {
  console.error("ephemeris sample missing the exposed TEME/GCRS state (position + velocity) or ECEF position");
  process.exit(1);
}
const vTeme = Math.hypot(...s0.teme_v_m_s);
if (vTeme < 7000 || vTeme > 8000) {
  console.error(`ephemeris exposed |v_TEME| ${(vTeme / 1000).toFixed(3)} km/s not ISS-like`);
  process.exit(1);
}
if (!s0.station_view || typeof s0.station_view.doppler_hz !== "number" || !isFinite(s0.station_view.doppler_hz)) {
  console.error("ephemeris sample carries no station Doppler");
  process.exit(1);
}
// The playground draws the ground track from the scenario's own SVG — assert it
// renders to a non-trivial vector image (not the empty-result placeholder).
const ephSvg = chart_svg(ISS_EPHEMERIS);
if (typeof ephSvg !== "string" || !ephSvg.includes("<svg") || ephSvg.length < 200) {
  console.error("ephemeris chart_svg() produced no ground-track SVG");
  process.exit(1);
}

// 0.35 surfaces: the training-NMEA generator and the interference map run in the browser
// build on the repository's synthetic inputs, and say what they are.
const rootDir = new URL("../", import.meta.url);
const training = await readFile(new URL("scenarios/training/open-sea-jamming.toml", rootDir), "utf8");
const nm = JSON.parse(nmea_training(training, NaN));
if (!nm.nmea.includes("\r\n") || JSON.parse(nm.log_json).schema !== "kshana-nmea-training/1") {
  console.error("wasm nmea_training() produced no NMEA or no instructor log");
  process.exit(1);
}
const sessionToml = (await readFile(new URL("examples/maritime-trust/session.toml", rootDir), "utf8"))
  .replace('path = "tallinn-helsinki.nmea"', "").replace("calibration_s = 300.0", "calibration_s = 60.0");
const nmeaLines = (await readFile(new URL("examples/maritime-trust/tallinn-helsinki.nmea", rootDir), "utf8")).split(/(?<=\n)/);
const excerpt = nmeaLines
  .slice(Math.floor((nmeaLines.length * 1400) / 3000), Math.floor((nmeaLines.length * 1800) / 3000))
  .join("");
const replay = JSON.parse(receiver_trust_replay(sessionToml, excerpt));
if (replay.summary.epochs < 300 || replay.summary.untrusted < 1 || replay.summary.lowest_score >= 55) {
  console.error("wasm receiver_trust_replay() did not flag the synthetic drag-off");
  process.exit(1);
}
if (JSON.parse(assess_vessel_log(sessionToml, excerpt)).epochs.length < 300) {
  console.error("wasm assess_vessel_log() returned no epochs");
  process.exit(1);
}
const adsbCsv = await readFile(new URL("examples/interference-map/input/adsb.csv", rootDir), "utf8");
const days = JSON.parse(
  interference_map("adsb", adsbCsv, "custom", NaN, "CC0-1.0",
    "https://creativecommons.org/publicdomain/zero/1.0/", "Synthetic data for Kshana tests", ""),
);
const doc = JSON.parse(days[0].geojson);
if (days.length !== 1 || doc.kshana_interference_map.schema !== "kshana-interference-map/v1") {
  console.error("wasm interference_map() produced no kshana-interference-map/v1 document");
  process.exit(1);
}
const exposure = JSON.parse(
  route_exposure('{"type":"LineString","coordinates":[[-50,30.2],[-47,30.2]]}', JSON.stringify([days[0].geojson]), "", ""),
);
if (typeof exposure !== "object") {
  console.error("wasm route_exposure() produced no report");
  process.exit(1);
}

// Test-bench export and the compliance mapping: in memory, with their notices.
const canyon = await readFile(new URL("scenarios/automotive-urban-canyon.toml", rootDir), "utf8");
const bench = JSON.parse(bench_export(canyon, "2025-03-01T10:00:00Z"));
if (!bench.files[".motion.csv"]?.includes("2025-03-01") || !bench.notice.includes("radio-frequency or baseband signal")) {
  console.error("wasm bench_export() produced no motion file or no notice");
  process.exit(1);
}
const comp = JSON.parse(
  compliance_report(JSON.stringify([
    { label: "trust.result.json", result: JSON.stringify({ scenario_hash: "0123456789abcdef0123", log: { format: "nmea", epochs: 10 }, monitors_run: ["cn0"], events_evaluable: 2, events_detected: 2, predictions_evaluable: 1, predictions_agreeing: 1 }) },
    { label: "bad.json", result: "not json" },
  ])),
);
if (!comp.report.statement.includes("is not a finding that a framework is met") || comp.report.runs.length !== 1 ||
    comp.report.unrecognised.length !== 1 || !comp.markdown.includes(comp.report.statement) ||
    !compliance_mapping(false).startsWith("> " + comp.report.statement)) {
  console.error("wasm compliance_report() or compliance_mapping() lost the statement or the run accounting");
  process.exit(1);
}

// Examples, interoperability exports, route import and animation, in memory.
const examples = JSON.parse(list_examples(""));
const orbitToml = get_example("orbit-multignss");
const clockToml = get_example("clock-holdover");
const czml = JSON.parse(export_scenario(orbitToml, "czml"));
const anim = JSON.parse(animate_scenario(clockToml, "svg", 0, NaN, 0));
const moved = import_route(
  get_example("terrain-nav"),
  '{"type":"LineString","coordinates":[[10.0,50.0],[10.5,50.0]]}',
);
if (examples.count < 50 || JSON.parse(export_formats(clockToml)).length !== 5 ||
    czml.format !== "czml" || czml.files[0].encoding !== "utf-8" || !export_sp3(orbitToml).startsWith("#") ||
    !anim.files["animation.svg"].includes("<svg") || !moved.includes("start_lat_deg = 50")) {
  console.error("wasm examples, exports, route import or animation produced unexpected output");
  process.exit(1);
}
let refused = false;
try { export_scenario(clockToml, "czml"); } catch (_) { refused = true; }
if (!refused) {
  console.error("wasm export_scenario() accepted a format that does not apply");
  process.exit(1);
}

// Trust telemetry in each export format, from the live stream text: no process, socket or clock.
const trustStream =
  '{"t_s":0.0,"state":"calibrating","score":null,"deductions":[],"alarms":[],"gate":"off"}\n' +
  '{"t_s":1.0,"state":"nominal","score":97.5,"deductions":[],"alarms":[],"gate":"off"}\n' +
  '{"t_s":2.0,"state":"degraded","score":41.0,"deductions":[{"monitor":"cn0-drop","ratio":1.5,"points":30.0}],"alarms":["cn0-drop"],"gate":"off"}\n';
const tCef = trust_telemetry(trustStream, "cef", "ops-gw1", "jsonl", "");
const tAll = trust_telemetry(trustStream, "leef", "ops-gw1", "jsonl", '{"syslog_all":true}');
const tProm = trust_telemetry(trustStream, "prometheus", "", "jsonl", "");
const tOtlp = JSON.parse(trust_telemetry(trustStream, "otlp", "", "jsonl", '{"unix_nano":1700000000000000000}'));
let tBad = false;
try { trust_telemetry("", "cef", "", "jsonl", ""); } catch (_) { tBad = true; }
if (tCef.trim().split("\n").length !== 3 || !tCef.includes("CEF:0|Ashforde OU|Kshana|") ||
    !tAll.includes("LEEF:2.0|") || !tProm.includes("kshana_trust_score 41") ||
    !Array.isArray(tOtlp.resourceMetrics) || !tBad) {
  console.error("wasm trust_telemetry() produced unexpected output");
  process.exit(1);
}

// OSNMA verification in memory: the same JSON as `kshana osnma verify --json`, advisory included.
const osnmaPage = "00".repeat(30);
const osnmaCsv = `SVID,NumNavBits,NavBitsHEX\n02,480,${osnmaPage}${osnmaPage}\n03,240,${osnmaPage}\n`;
const osnma = JSON.parse(osnma_verify(btoa(osnmaCsv), "vector-csv", 1000, "", [], undefined, undefined));
let osnmaBad = false;
try { osnma_verify(btoa(osnmaCsv), "", 1000, "", [], undefined, 10); } catch (_) { osnmaBad = true; }
if (osnma.input.pages !== 3 || osnma.freshness_enforced !== false ||
    !osnma.advisory.includes("not type-approved navigation equipment") || !osnmaBad) {
  console.error("wasm osnma_verify() produced unexpected output");
  process.exit(1);
}

// The short IQ run: the wasm build must give exactly the JSON the native test pins in the
// same golden (tests/iq_short.rs, matches_the_golden_the_wasm_smoke_test_also_checks).
if (!JSON.parse(iq_signals()).includes("gps-l1ca")) {
  console.error("wasm iq_signals() does not list gps-l1ca");
  process.exit(1);
}
const iqGolden = (await readFile(new URL("tests/fixtures/iq_short_golden.json", rootDir), "utf8")).trimEnd();
const iqWasm = iq_run_short(2.046e6, 0.1, "gps-l1ca", new Float64Array([3, 11]), new Float64Array([1200, -800]), 45, 7);
// Exact for every integer, string and flag; numbers within 1e-9 relative, because the wasm and
// native math libraries differ in the last digit or two of a float (the first run showed it:
// a statistic of 228.05711797612463 against 228.0571179761247).
const iqSame = (a, b) =>
  typeof a === "number" && typeof b === "number"
    ? Math.abs(a - b) <= 1e-9 * Math.max(1, Math.abs(a), Math.abs(b))
    : a && b && typeof a === "object" && typeof b === "object"
      ? Object.keys(a).length === Object.keys(b).length && Object.keys(a).every((k) => iqSame(a[k], b[k]))
      : a === b;
if (!iqSame(JSON.parse(iqWasm), JSON.parse(iqGolden))) {
  console.error("wasm iq_run_short() differs from the native golden beyond rounding");
  process.exit(1);
}
let iqTooBig = false;
try { iq_run_short(2.046e6, 5, "gps-l1ca", new Float64Array([3]), new Float64Array([0]), NaN, 1); } catch (_) { iqTooBig = true; }
if (!iqTooBig) {
  console.error("wasm iq_run_short() accepted a scene over the size cap");
  process.exit(1);
}

// Typed API (CAP-34): run_typed gives the same bytes as run, data is the parsed
// document, scenario_kinds() is list_kinds() already parsed, error_kind() a tag.
const typed = run_typed(SCENARIO);
const typedData = typed.data;
if (typed.json !== out || typed.csv !== null || JSON.stringify(typedData) !== JSON.stringify(result) || !typed.svg.includes("<svg") ||
    !typed.summary || typedData.schema_version !== result.schema_version ||
    typedData.quantum.adev_curve.length !== result.quantum.adev_curve.length) {
  console.error("wasm run_typed() disagrees with run()");
  process.exit(1);
}
const kinds = scenario_kinds();
if (JSON.stringify(kinds) !== JSON.stringify(JSON.parse(list_kinds())) ||
    !kinds.some((k) => k.name === "sweep-nd") || error_kind(SCENARIO) !== "" ||
    error_kind('kind = "no-such-kind"') !== "invalid_input") {
  console.error("wasm scenario_kinds()/error_kind() produced unexpected output");
  process.exit(1);
}

console.log(
  `wasm smoke OK — kshana ${v}, ${result.quantum.adev_curve.length} ADEV points, ` +
    `filter NIS ${fh.nis_mean.toFixed(3)} (consistent=${fh.consistent}), ` +
    `eci_track ${track.length} pts, |r0| ${r0.toFixed(1)} km (GPS ≈ 26,560), ` +
    `ephemeris ${eph.n_samples} samples, lat ±${Math.max(Math.abs(eph.lat_min_deg), eph.lat_max_deg).toFixed(1)}°, ` +
    `|v| ${(vTeme / 1000).toFixed(2)} km/s, ground-track SVG ${ephSvg.length} B`,
);
