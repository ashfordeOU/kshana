// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the off-main-thread engine client (engine.mjs), against a fake worker so they
// run under plain node with no WebAssembly build. Run with `node web/engine.test.mjs`.
import { createEngineClient, dispatch, isCancelled, busyLabel, ENGINE_FNS } from "./engine.mjs";
import assert from "node:assert/strict";

const now = () => new Promise((r) => setTimeout(r, 0));

// A Worker stand-in: answers {id, fn, args} through dispatch() on a fake API, after an
// optional ready handshake. `hold` keeps replies back so a call can be cancelled mid-run.
function fakeWorker({ api, ready = true, hold = false, failOnSpawn = false } = {}) {
  const spawned = [];
  const spawn = () => {
    if (failOnSpawn) throw new Error("no module workers");
    const listeners = { message: [], error: [] };
    const w = {
      terminated: false,
      held: [],
      addEventListener(t, f) { listeners[t].push(f); },
      emit(t, ev) { for (const f of listeners[t]) f(ev); },
      postMessage(msg) {
        const reply = dispatch(api, msg);
        if (hold) w.held.push(reply);
        else setTimeout(() => !w.terminated && w.emit("message", { data: reply }), 0);
      },
      terminate() { w.terminated = true; },
    };
    spawned.push(w);
    setTimeout(() => w.emit("message", { data: ready ? { ready: true } : { ready: false, error: "load failed" } }), 0);
    return w;
  };
  return { spawn, spawned };
}

const api = {
  run: (t) => `{"echo":${JSON.stringify(t)}}`,
  run_all: (t) => JSON.stringify({ json: "{}", svg: "<svg/>", summary: t, csv: null }),
  summary: (t) => `summary:${t}`,
  chart_svg: () => "<svg/>",
  table_csv: () => undefined,
  export_sp3: () => { throw "not an orbit scenario"; },
  export_omm: () => "",
  export_oem: () => "",
};

// dispatch refuses anything outside the allowlist, and reports thrown strings.
{
  assert.equal(dispatch(api, { id: 1, fn: "constructor", args: [] }).ok, false, "non-engine name refused");
  assert.match(dispatch(api, { id: 2, fn: "export_sp3", args: ["x"] }).error, /not an orbit/, "string throw surfaces");
  assert.deepEqual(dispatch(api, { id: 3, fn: "summary", args: ["a"] }), { id: 3, ok: true, value: "summary:a" });
  assert.ok(ENGINE_FNS.includes("run_all"), "run_all is callable through the worker");
}

// Worker path: a call round-trips and resolves with the worker's value.
{
  const { spawn } = fakeWorker({ api });
  const c = createEngineClient({ spawn, local: api });
  assert.equal(c.mode, "worker");
  assert.equal(c.canCancel, true);
  assert.equal(await c.call("summary", "x"), "summary:x");
  await assert.rejects(c.call("export_sp3", "x"), /not an orbit/, "engine error rejects");
}

// Cancel: the in-flight call rejects as cancelled, the worker is replaced, and the next
// call goes to the new worker.
{
  const { spawn, spawned } = fakeWorker({ api, hold: true });
  const c = createEngineClient({ spawn, local: api });
  const p = c.call("run", "slow");
  await now();
  assert.equal(c.cancel(), true);
  await assert.rejects(p, (e) => isCancelled(e), "cancelled call rejects with EngineCancelled");
  assert.equal(spawned.length, 2, "a fresh worker is spawned after cancel");
  assert.equal(spawned[0].terminated, true, "the old worker is terminated");
}

// Fallback 1: constructing a worker throws -> main thread, no cancel.
{
  const { spawn } = fakeWorker({ api, failOnSpawn: true });
  const c = createEngineClient({ spawn, local: api });
  assert.equal(await c.call("summary", "y"), "summary:y");
  assert.equal(c.mode, "local");
  assert.equal(c.canCancel, false);
  assert.equal(c.cancel(), false, "cancel is a no-op on the fallback path");
}

// Fallback 2: the worker reports its engine failed to load -> queued calls replay locally.
{
  const { spawn } = fakeWorker({ api, ready: false, hold: true });
  const c = createEngineClient({ spawn, local: api });
  const v = await c.call("summary", "z");
  assert.equal(v, "summary:z", "the queued call is replayed on the main thread");
  assert.equal(c.mode, "local");
}

// Fallback 3: no Worker at all.
{
  const c = createEngineClient({ spawn: null, local: api });
  assert.equal(c.mode, "local");
  assert.equal(await c.call("summary", "w"), "summary:w");
}

// A worker crash after it was ready fails the in-flight call and respawns.
{
  const { spawn, spawned } = fakeWorker({ api, hold: true });
  const c = createEngineClient({ spawn, local: api });
  await now();
  const p = c.call("run", "boom");
  spawned[0].emit("error", { message: "out of memory", preventDefault() {} });
  await assert.rejects(p, /out of memory/);
  assert.equal(spawned.length, 2, "respawned after a crash");
  assert.equal(c.mode, "worker", "a crash after ready does not abandon workers");
}

// busyLabel: whole seconds, only once one has passed.
{
  assert.equal(busyLabel("Running", 400), "Running…");
  assert.equal(busyLabel("Running", 7300), "Running… 7 s");
}

console.log("engine.test.mjs: all assertions passed");
