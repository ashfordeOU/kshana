// SPDX-License-Identifier: AGPL-3.0-only
// SDK conformance for the JavaScript/WebAssembly package (roadmap 0.42 I9): the three conformance
// scenarios and the mapping case of capi/kshana-capi/sdk/conformance/cases.txt, run through the npm
// package's own `run` and `connect_map`, must give exactly the bytes whose SHA-256 the C interface pins
// in expected.sha256 (the engine's transcendentals go through its portable maths library, so the
// WebAssembly build and the native build give the same bits). Needs web/pkg (wasm-pack build).
import { readFile } from "node:fs/promises";
import { createHash } from "node:crypto";
import init, { run, connect_map } from "./pkg/kshana.js";

const root = new URL("../", import.meta.url);
const conf = new URL("capi/kshana-capi/sdk/conformance/", root);
await init({ module_or_path: await readFile(new URL("./pkg/kshana_bg.wasm", import.meta.url)) });

const text = async (p) => readFile(new URL(p, root), "utf8");
const pins = new Map(
  (await readFile(new URL("expected.sha256", conf), "utf8"))
    .split("\n").filter(Boolean).map((l) => { const [h, f] = l.split("  "); return [f.trim(), h]; }),
);
const cases = (await readFile(new URL("cases.txt", conf), "utf8"))
  .split("\n").filter((l) => l.trim() && !l.startsWith("#")).map((l) => l.trim().split(/\s+/));

let failed = 0;
for (const [out, entry, ...inputs] of cases) {
  const ins = await Promise.all(inputs.map(text));
  const produced = entry === "run" ? run(ins[0]) : entry === "map" ? connect_map(ins[0], ins[1], ins[2]) : null;
  if (produced === null) throw new Error(`cases.txt: unknown entry ${entry}`);
  const got = createHash("sha256").update(produced, "utf8").digest("hex");
  if (got !== pins.get(out)) {
    console.error(`sdk conformance: ${out} differs from the C interface's bytes (${got})`);
    failed++;
  }
}
if (cases.length !== 4 || pins.size !== 4) {
  console.error(`sdk conformance: expected 4 cases and 4 digests, found ${cases.length} and ${pins.size}`);
  failed++;
}
if (failed) process.exit(1);
console.log("sdk conformance: the WebAssembly package gives the C interface's bytes for all 4 cases");
