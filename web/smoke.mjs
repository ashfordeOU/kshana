// SPDX-License-Identifier: Apache-2.0
// Headless smoke test for the WebAssembly bindings: load the wasm-pack (--target
// web) module in Node, run a clock scenario, and assert the JSON parses and the
// version is non-empty. Run in CI by the `test-wasm-bindings` job after a build.
import init, { run, version } from "./pkg/kshana.js";
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

console.log(
  `wasm smoke OK — kshana ${v}, ${result.quantum.adev_curve.length} ADEV points, ` +
    `filter NIS ${fh.nis_mean.toFixed(3)} (consistent=${fh.consistent}), ` +
    `eci_track ${track.length} pts, |r0| ${r0.toFixed(1)} km (GPS ≈ 26,560)`,
);
