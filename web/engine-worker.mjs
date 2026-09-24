// SPDX-License-Identifier: AGPL-3.0-only
// Module Web Worker that hosts the WebAssembly engine off the page's main thread.
// The page (via engine.mjs) posts {id, fn, args}; this replies {id, ok, value | error}.
// It posts {ready: true} once the engine has loaded, or {ready: false, error} if it
// could not, so the page can fall back to running on the main thread.
import init, { run, run_all, summary, chart_svg, table_csv, export_sp3, export_omm, export_oem } from "./pkg/kshana.js";
import { dispatch, errorMessage } from "./engine.mjs";

const api = { run, run_all, summary, chart_svg, table_csv, export_sp3, export_omm, export_oem };

const ready = init().then(
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
  try {
    await ready;
  } catch (e) {
    self.postMessage({ id: msg.id, ok: false, error: "engine failed to load: " + errorMessage(e) });
    return;
  }
  self.postMessage(dispatch(api, msg));
});
