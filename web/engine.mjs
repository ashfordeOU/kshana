// SPDX-License-Identifier: AGPL-3.0-only
// Off-main-thread engine client for the playground.
//
// Every scenario run used to execute on the page's main thread, so a heavy kind froze
// the whole page until it returned. The page now talks to the WebAssembly engine
// through this client, which forwards each call to a module Web Worker
// (engine-worker.mjs) as {id, fn, args} and settles a Promise from its
// {id, ok, value | error} reply. The page stays responsive while the engine works,
// and a run can be cancelled by terminating the worker (a fresh one is spawned for
// the next call).
//
// If a worker cannot be constructed, or fails before its engine is ready (an old
// browser without module workers, a file:// origin), the client falls back to
// calling the same functions on the main thread — the behaviour the page had before
// — so nothing regresses; only cancellation is unavailable there.

// The engine functions a caller may request. Anything else is refused, so a message
// can never name an arbitrary property of the wasm module.
export const ENGINE_FNS = Object.freeze([
  "run",
  "run_all",
  "summary",
  "chart_svg",
  "table_csv",
  "export_sp3",
  "export_omm",
  "export_oem",
]);

// Normalise a thrown value to a message. wasm-bindgen throws the engine's error as a
// plain string; JS failures throw Error objects.
export function errorMessage(e) {
  if (e && typeof e === "object" && "message" in e) return String(e.message);
  return String(e);
}

// Execute one request against an engine API object (the wasm module's exports) and
// build the reply. Pure and synchronous: the worker and the main-thread fallback both
// use it, so the two paths cannot disagree about semantics.
export function dispatch(api, msg) {
  const id = msg && msg.id;
  const fn = msg && msg.fn;
  if (!ENGINE_FNS.includes(fn) || typeof api[fn] !== "function") {
    return { id, ok: false, error: `unknown engine function: ${String(fn)}` };
  }
  try {
    const args = Array.isArray(msg.args) ? msg.args : [];
    return { id, ok: true, value: api[fn](...args) };
  } catch (e) {
    return { id, ok: false, error: errorMessage(e) };
  }
}

// The rejection a cancelled call settles with; test for it with isCancelled().
export class EngineCancelled extends Error {
  constructor() {
    super("cancelled");
    this.name = "EngineCancelled";
    this.cancelled = true;
  }
}

export function isCancelled(e) {
  return !!(e && e.cancelled === true);
}

// "Running…" / "Running… 7 s": whole seconds, shown once a second has passed.
export function busyLabel(verb, elapsedMs) {
  const s = Math.floor(Math.max(0, elapsedMs) / 1000);
  return s >= 1 ? `${verb}… ${s} s` : `${verb}…`;
}

// createEngineClient({ spawn, local, defer })
//   spawn() -> a Worker-like object (postMessage, terminate, addEventListener) or throws.
//   local   -> the engine API object used for the main-thread fallback.
//   defer   -> schedules a main-thread fallback call; defaults to setTimeout(fn, 0) so
//              the caller's busy state can paint before the engine blocks the thread.
export function createEngineClient({ spawn, local, defer } = {}) {
  const later = defer || ((fn) => setTimeout(fn, 0));
  const pending = new Map(); // id -> { resolve, reject, msg }
  let nextId = 1;
  let worker = null;
  let ready = false;
  let mode = spawn ? "worker" : "local";

  function settle(reply) {
    const p = pending.get(reply.id);
    if (!p) return; // a reply for a call that was cancelled
    pending.delete(reply.id);
    if (reply.ok) p.resolve(reply.value);
    else p.reject(new Error(reply.error));
  }

  function runLocal(msg) {
    later(() => settle(dispatch(local, msg)));
  }

  // Give up on workers for this page: replay whatever was queued on the main thread.
  function fallBack() {
    if (worker) {
      try { worker.terminate(); } catch { /* already gone */ }
    }
    worker = null;
    ready = false;
    mode = "local";
    for (const p of pending.values()) runLocal(p.msg);
  }

  function start() {
    let w;
    try {
      w = spawn();
    } catch {
      fallBack();
      return;
    }
    worker = w;
    ready = false;
    w.addEventListener("message", (ev) => {
      if (w !== worker) return; // a terminated worker's late message
      const data = ev.data || {};
      if ("ready" in data) {
        if (data.ready) ready = true;
        else fallBack();
        return;
      }
      settle(data);
    });
    w.addEventListener("error", (ev) => {
      if (w !== worker) return;
      if (ev && typeof ev.preventDefault === "function") ev.preventDefault();
      if (!ready) {
        // The module never loaded (no module-worker support, blocked, missing file).
        fallBack();
        return;
      }
      // The engine died mid-call (e.g. out of memory): fail what was in flight and
      // start a fresh worker for the next call.
      const msg = errorMessage(ev && (ev.error || ev.message) ? (ev.error || ev.message) : "engine worker crashed");
      for (const [id, p] of pending) {
        pending.delete(id);
        p.reject(new Error(msg));
      }
      try { w.terminate(); } catch { /* already gone */ }
      start();
    });
  }

  if (mode === "worker") start();

  return {
    get mode() { return mode; },
    // Cancellation needs a worker to terminate; the main-thread fallback cannot
    // interrupt a synchronous call.
    get canCancel() { return mode === "worker"; },
    call(fn, ...args) {
      const msg = { id: nextId++, fn, args };
      return new Promise((resolve, reject) => {
        pending.set(msg.id, { resolve, reject, msg });
        if (mode === "worker") worker.postMessage(msg);
        else runLocal(msg);
      });
    },
    // Terminate the worker, reject every in-flight call with EngineCancelled, and
    // spawn a fresh worker. Returns false (and does nothing) on the fallback path.
    cancel() {
      if (mode !== "worker") return false;
      const w = worker;
      worker = null;
      try { if (w) w.terminate(); } catch { /* already gone */ }
      for (const [id, p] of pending) {
        pending.delete(id);
        p.reject(new EngineCancelled());
      }
      start();
      return true;
    },
  };
}
