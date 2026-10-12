// SPDX-License-Identifier: AGPL-3.0-only
// The WebAssembly engine for the tools pages (trust, training, interference, tools hub): one shared,
// lazily started engine per page, behind the same worker client the Studio uses (engine.mjs), so a heavy
// call never freezes the page. Nothing leaves the browser: the engine file is fetched from this site
// and every call runs locally.
//
//   const e = await getEngine();           // starts it once; e.available is false when it cannot run
//   if (e.has("bench_export")) await e.call("bench_export", toml, "")
//
// An engine package older than the page (no 0.35 functions) loads fine; e.has() is false for what it lacks
// and a call rejects with a message that says so (engine.mjs dispatch).
import { createEngineClient, errorMessage, ENGINE_FNS, engineHas } from "./engine.mjs";

let booted = null;

async function compileEngine(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`the engine file returned HTTP ${res.status}`);
  const wasmType = (res.headers.get("Content-Type") || "").startsWith("application/wasm");
  if (wasmType && typeof WebAssembly.compileStreaming === "function") return WebAssembly.compileStreaming(res);
  return WebAssembly.compile(await res.arrayBuffer());
}

export function getEngine() {
  if (booted) return booted;
  booted = (async () => {
    try {
      const mod = await import("../pkg/kshana.js");
      const wasm = await compileEngine(new URL("../pkg/kshana_bg.wasm", import.meta.url));
      await mod.default({ module_or_path: wasm }); // fails here if the host blocks WebAssembly
      const local = Object.fromEntries(ENGINE_FNS.filter((n) => typeof mod[n] === "function").map((n) => [n, mod[n]]));
      const client = createEngineClient({
        spawn: typeof Worker === "function" ? () => new Worker(new URL("./engine-worker.mjs", import.meta.url), { type: "module" }) : null,
        local,
        defer: (fn) => setTimeout(fn, 20),
        init: wasm,
      });
      return { available: true, version: mod.version(), has: (fn) => engineHas(local, fn), call: (fn, ...args) => client.call(fn, ...args), client, error: null };
    } catch (e) {
      return { available: false, version: null, has: () => false, call: () => Promise.reject(new Error("the engine is not running here")), client: null, error: errorMessage(e) };
    }
  })();
  return booted;
}

// "0.35.0" -> [0, 35, 0]; used to say plainly when the engine is older than a feature.
export const versionParts = (v) => String(v || "").split(".").map((x) => parseInt(x, 10) || 0);
export const engineAtLeast = (v, major, minor) => { const [a, b] = versionParts(v); return a > major || (a === major && b >= minor); };
