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

console.log(`wasm smoke OK — kshana ${v}, ${result.quantum.adev_curve.length} ADEV points`);
