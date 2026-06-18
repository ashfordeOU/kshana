// SPDX-License-Identifier: AGPL-3.0-only
// Headless smoke test for the WebAssembly bindings: load the wasm-pack (--target
// web) module in Node, run a clock scenario, and assert the JSON parses and the
// version is non-empty. Run in CI by the `test-wasm-bindings` job after a build.
import init, { run, chart_svg, version } from "./pkg/kshana.js";
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

console.log(
  `wasm smoke OK — kshana ${v}, ${result.quantum.adev_curve.length} ADEV points, ` +
    `filter NIS ${fh.nis_mean.toFixed(3)} (consistent=${fh.consistent}), ` +
    `eci_track ${track.length} pts, |r0| ${r0.toFixed(1)} km (GPS ≈ 26,560), ` +
    `ephemeris ${eph.n_samples} samples, lat ±${Math.max(Math.abs(eph.lat_min_deg), eph.lat_max_deg).toFixed(1)}°, ` +
    `|v| ${(vTeme / 1000).toFixed(2)} km/s, ground-track SVG ${ephSvg.length} B`,
);
