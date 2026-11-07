// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the live device client (devices.mjs) against a fake Desktop invoke.
// Run with `node web/studio/lib/devices.test.mjs`.
import assert from "node:assert/strict";
import { deviceApi, nativeEngine, liveLoop, counters, BAUDS } from "./devices.mjs";

const calls = [];
let seq = 0;
let text = "";
const invoke = async (cmd, args) => {
  calls.push([cmd, args]);
  switch (cmd) {
    case "devices_list": return [{ path: "/dev/ttyACM0", label: "ttyACM0" }];
    case "device_start": return { running: true, source: args.source };
    case "device_status": return { running: true, sentences: seq, excerpt_sentences: seq, other_lines: 1, last_unix_ms: Date.now() };
    case "device_excerpt": return { seq, text, sentences: seq };
    case "device_stop": return { stopped: "x" };
    case "engine_native_fns": return ["version", "receiver_trust_replay"];
    case "engine_call": return args.name === "version" ? "0.41.0" : `scored:${args.args[1]}`;
    default: throw new Error(`unknown command ${cmd}`);
  }
};

// The commands and their arguments.
const api = deviceApi(invoke);
assert.deepEqual(await api.list(), [{ path: "/dev/ttyACM0", label: "ttyACM0" }]);
await api.start("tcp:127.0.0.1:10110", "");
assert.deepEqual(calls.at(-1), ["device_start", { source: "tcp:127.0.0.1:10110", baud: null }]);
await api.start("/dev/ttyUSB0", "4800");
assert.deepEqual(calls.at(-1), ["device_start", { source: "/dev/ttyUSB0", baud: 4800 }]);
assert.equal(BAUDS[0], "");
assert.ok(BAUDS.includes("4800") && BAUDS.includes("115200"));

// The native engine as the trust page uses it.
const eng = await nativeEngine(invoke);
assert.equal(eng.available, true);
assert.equal(eng.version, "0.41.0");
assert.equal(eng.has("receiver_trust_replay"), true);
assert.equal(eng.has("receiver_trust"), false);
assert.equal(await eng.call("receiver_trust_replay", "[platform]", "$GPGGA"), "scored:$GPGGA");

// The loop: scores a grown excerpt once, skips an unchanged one, never overlaps, stops.
const timers = [];
const setTimer = (fn) => { timers.push(fn); return timers.length; };
const cleared = [];
const scored = [];
const statuses = [];
let gate = null;
const loop = liveLoop({
  api, everyMs: 5000, setTimer, clearTimer: (id) => cleared.push(id),
  onStatus: (s) => statuses.push(s),
  score: async (t) => { scored.push(t); if (gate) await gate; },
});
// Nothing captured yet: no score.
await timers.shift()();
assert.deepEqual(scored, []);
seq = 2; text = "$A\n$B\n";
await timers.shift()();
assert.deepEqual(scored, ["$A\n$B\n"]);
// Unchanged: skipped.
await timers.shift()();
assert.equal(scored.length, 1);
// A slow score: a second tick while it runs joins it instead of scoring again.
seq = 3; text = "$A\n$B\n$C\n";
let open;
gate = new Promise((r) => { open = r; });
const a = loop.tick();
const b = loop.tick();
open();
await Promise.all([a, b]);
assert.equal(scored.length, 2);
assert.ok(statuses.length >= 4);
loop.stop();
assert.equal(cleared.length, 1);
// A tick that fails reports a stopped state instead of throwing, and the loop goes on.
timers.length = 0;
const bad = liveLoop({ api: { status: async () => { throw new Error("gone"); }, excerpt: async () => ({}) }, score: async () => {}, setTimer, clearTimer: () => {}, onStatus: (s) => statuses.push(s) });
await timers.shift()();
assert.deepEqual(statuses.at(-1), { running: false, error: "gone" });
assert.equal(timers.length, 1);
bad.stop();

assert.deepEqual(counters({ sentences: 10, excerpt_sentences: 8, other_lines: 2, last_unix_ms: null }), { sentences: 10, kept: 8, other: 2, ageS: null });
assert.deepEqual(counters(null), { sentences: 0, kept: 0, other: 0, ageS: null });
console.log("devices.mjs: OK");
