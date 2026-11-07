// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the Desktop engine client (desktop.mjs) against a fake invoke and a fake
// WebAssembly client. Run with `node web/studio/lib/desktop.test.mjs`.
import assert from "node:assert/strict";
import { desktopEngine, desktopInvoke } from "./desktop.mjs";
import { isCancelled } from "./engine.mjs";

const calls = [];
let release = null;
const invoke = async (cmd, args) => {
  calls.push([cmd, args]);
  if (cmd === "engine_native_fns") return ["run", "run_all", "register_catalogue"];
  if (cmd === "engine_call" && args.name === "run" && args.args[0] === "slow") {
    await new Promise((r) => { release = r; });
    return "late";
  }
  if (cmd === "engine_call" && args.name === "run" && args.args[0] === "bad") throw "invalid scenario";
  if (cmd === "engine_call") return `native:${args.name}`;
  throw new Error("unknown command");
};
const baseCalls = [];
const base = {
  canCancel: true,
  cancelled: 0,
  call: (fn, ...args) => { baseCalls.push(fn); return Promise.resolve(`wasm:${fn}`); },
  register: (tag) => { baseCalls.push(`register:${tag}`); return Promise.resolve(); },
  cancel() { this.cancelled++; return true; },
};

assert.equal(desktopInvoke({}), null);
assert.equal(typeof desktopInvoke({ __TAURI_INTERNALS__: { invoke: () => 1 } }), "function");

const e = await desktopEngine(base, invoke);
assert.equal(e.mode, "native");
assert.equal(e.canCancel, true);
// Native functions go to the app; the rest to the WebAssembly client.
assert.equal(await e.call("run", "x"), "native:run");
assert.equal(await e.call("receiver_trust", "y"), "wasm:receiver_trust");
assert.deepEqual(baseCalls, ["receiver_trust"]);
// An engine error reaches the page as an Error with the engine's message.
await assert.rejects(e.call("run", "bad"), /invalid scenario/);
// A catalogue is registered with both engines.
await e.register("de", "x = y");
assert.ok(calls.some(([c, a]) => c === "engine_call" && a.name === "register_catalogue"));
assert.ok(baseCalls.includes("register:de"));
// Cancel rejects a waiting native call at once, and its late answer is dropped.
const p = e.call("run", "slow");
await new Promise((r) => setTimeout(r, 0));
e.cancel();
await assert.rejects(p, (err) => isCancelled(err));
release();
assert.equal(base.cancelled, 1);
// Without a WebAssembly client, a function the native engine lacks is refused clearly.
const lone = await desktopEngine(null, invoke);
await assert.rejects(lone.call("receiver_trust"), /no receiver_trust/);
console.log("desktop.test.mjs: ok");
