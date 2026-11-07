// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop: the Studio's engine client when the page runs inside the Desktop app
// (apps/desktop). The heavy functions (runs, charts, tables, the localised text) go to
// the native engine through the app's `engine_call` command; every other function keeps
// using the WebAssembly client `base`, so each tool page works as it does on the web.
// A cancel rejects the waiting native calls at once; the native run itself finishes in
// the background and its answer is dropped.
import { EngineCancelled } from "./engine.mjs";

/** The Desktop's invoke function, or null outside the Desktop. */
export function desktopInvoke(g = globalThis) {
  const i = g && g.__TAURI_INTERNALS__;
  return i && typeof i.invoke === "function" ? (cmd, args) => i.invoke(cmd, args) : null;
}

/** The engine client for the Desktop: `base` (the WebAssembly client, or null) wrapped. */
export async function desktopEngine(base, invoke) {
  const native = new Set(await invoke("engine_native_fns"));
  const pending = new Map();
  let nextId = 1;
  const callNative = (fn, args) => {
    const id = nextId++;
    return new Promise((resolve, reject) => {
      pending.set(id, reject);
      invoke("engine_call", { name: fn, args }).then(
        (v) => { if (pending.delete(id)) resolve(v); },
        (e) => { if (pending.delete(id)) reject(new Error(String(e && e.message ? e.message : e))); },
      );
    });
  };
  return {
    get mode() { return "native"; },
    get canCancel() { return true; },
    native,
    call(fn, ...args) {
      if (native.has(fn)) return callNative(fn, args);
      if (base) return base.call(fn, ...args);
      return Promise.reject(new Error(`this engine build has no ${String(fn)}`));
    },
    // Both engines learn the catalogue: the native one localises runs, the WebAssembly one the tool pages.
    register(tag, ftl) {
      const n = callNative("register_catalogue", [tag, ftl]);
      const w = base && typeof base.register === "function" ? base.register(tag, ftl).catch(() => null) : Promise.resolve(null);
      return Promise.all([n, w]).then(() => undefined);
    },
    cancel() {
      for (const [id, reject] of pending) {
        pending.delete(id);
        reject(new EngineCancelled());
      }
      if (base && base.canCancel) base.cancel();
      return true;
    },
  };
}
