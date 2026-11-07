// SPDX-License-Identifier: AGPL-3.0-only
// Live devices in Kshana Desktop (apps/desktop, L2b): the trust page's client for the app's
// device commands and the loop that re-scores a receiver's latest sentences. The app reads
// the receiver (a serial port, a TCP stream or a growing file) read only; this module only
// asks it for the excerpt and hands it to the native scorer. Outside the Desktop there is
// no invoke function and the panel is not shown.

/** The app's device commands, over the Desktop's invoke function. */
export function deviceApi(invoke) {
  return {
    list: () => invoke("devices_list"),
    start: (source, baud) => invoke("device_start", { source, baud: baud ? Number(baud) : null }),
    status: () => invoke("device_status"),
    excerpt: () => invoke("device_excerpt"),
    stop: () => invoke("device_stop"),
  };
}

/** The native engine as a trust page uses one (`available`, `version`, `has`, `call`). */
export async function nativeEngine(invoke) {
  const fns = new Set(await invoke("engine_native_fns"));
  const version = fns.has("version") ? await invoke("engine_call", { name: "version", args: [] }) : null;
  return {
    available: true,
    version,
    has: (fn) => fns.has(fn),
    call: (fn, ...args) => invoke("engine_call", { name: fn, args }),
    error: null,
  };
}

/** The serial speeds the app sets (devices.rs BAUDS); "" leaves the port's speed as it is. */
export const BAUDS = ["", "4800", "9600", "19200", "38400", "57600", "115200", "230400", "460800"];

/**
 * Score the excerpt every `everyMs` while it grows. `score(text, ex)` is awaited; a tick
 * never overlaps the one before, and an excerpt already scored (same `seq`) is skipped.
 * `onStatus(status)` gets the capture state each tick. Returns `{ stop, tick }`.
 */
export function liveLoop({ api, score, onStatus = () => {}, everyMs = 5000, setTimer = setTimeout, clearTimer = clearTimeout }) {
  let last = -1;
  let timer = null;
  let stopped = false;
  let busy = null;
  const tick = async () => {
    if (busy) return busy;
    busy = (async () => {
      const ex = await api.excerpt();
      const st = await api.status();
      onStatus(st);
      if (ex && ex.seq !== last && ex.sentences > 0) {
        last = ex.seq;
        await score(ex.text, ex);
      }
      return st;
    })();
    try { return await busy; } finally { busy = null; }
  };
  const loop = async () => {
    if (stopped) return;
    try { await tick(); } catch (e) { onStatus({ running: false, error: String(e && e.message ? e.message : e) }); }
    if (!stopped) timer = setTimer(loop, everyMs);
  };
  timer = setTimer(loop, 0);
  return {
    tick,
    stop() { stopped = true; if (timer != null) clearTimer(timer); timer = null; },
  };
}

/** A one-line, unlocalised summary of a capture state's counters, for the status line's variables. */
export function counters(st) {
  return {
    sentences: Number(st && st.sentences) || 0,
    kept: Number(st && st.excerpt_sentences) || 0,
    other: Number(st && st.other_lines) || 0,
    ageS: st && st.last_unix_ms ? Math.max(0, Math.round((Date.now() - st.last_unix_ms) / 1000)) : null,
  };
}
