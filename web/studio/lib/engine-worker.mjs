// SPDX-License-Identifier: AGPL-3.0-only
// Module Web Worker that hosts the WebAssembly engine off the page's main thread.
// The page (via engine.mjs) posts {id, fn, args}; this replies {id, ok, value | error}.
// It posts {ready: true} once the engine has loaded, or {ready: false, error} if it
// could not, so the page can fall back to running on the main thread.
//
// The page compiles the engine once and posts the compiled WebAssembly.Module as the
// worker's first message, {init: module}. The worker instantiates that module, so the
// 8 MB engine file is downloaded once per visit, not once by the page and again here.
// If the first message carries no module (an older page), the worker fetches the
// engine itself, as before.
import init, { run, run_all, summary, chart_svg, table_csv, export_sp3, export_omm, export_oem } from "../pkg/kshana.js";
import { dispatch, errorMessage } from "./engine.mjs";

const api = { run, run_all, summary, chart_svg, table_csv, export_sp3, export_omm, export_oem };

let gotModule;
const moduleArrived = new Promise((resolve) => { gotModule = resolve; });
const isModule = (m) => typeof WebAssembly === "object" && m instanceof WebAssembly.Module;

const ready = moduleArrived.then((m) => (isModule(m) ? init({ module_or_path: m }) : init())).then(
  () => { self.postMessage({ ready: true }); },
  (e) => {
    self.postMessage({ ready: false, error: errorMessage(e) });
    throw e;
  },
);
// Observed by every request below; this only keeps a failed load from also being
// reported as an unhandled rejection.
ready.catch(() => {});

// Requests are handled one at a time in arrival order; a call that arrives while the
// engine is still loading waits for it.
self.addEventListener("message", async (ev) => {
  const msg = ev.data || {};
  if ("init" in msg) { gotModule(msg.init); return; }
  gotModule(undefined); // the first message was a call: no module is coming, so load the engine here
  try {
    await ready;
  } catch (e) {
    self.postMessage({ id: msg.id, ok: false, error: "engine failed to load: " + errorMessage(e) });
    return;
  }
  self.postMessage(dispatch(api, msg));
});
