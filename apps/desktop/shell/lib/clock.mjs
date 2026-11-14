// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the time cursor (0.42 U7). One clock per run that every view showing
// per-epoch data follows: the current instant, a selected range, timed markers, play and
// pause at a speed, stepping by the run's own epochs, and subscribers told of each change.
// Pure, no DOM; the frame driver takes requestAnimationFrame as an argument. Tested in
// ./clock.test.mjs.

/** Playback speeds: run seconds per wall-clock second. */
export const SPEEDS = [0.25, 0.5, 1, 2, 5, 10, 30, 60, 120, 300, 600, 1800, 3600, 7200];

/** The speed a run of `span` seconds starts at: the slowest that plays it in a minute or less. */
export function defaultSpeed(span) {
  const want = Math.max(0, Number(span) || 0) / 60;
  return SPEEDS.find((s) => s >= want) ?? SPEEDS[SPEEDS.length - 1];
}

/**
 * The index of the last time at or before `t` in a sorted list (an Array or a typed array),
 * 0 when `t` is before the first, -1 for an empty list. Binary search.
 */
export function indexAtOrBefore(times, t) {
  const n = times ? times.length : 0;
  if (!n) return -1;
  if (!(t >= times[0])) return 0;
  if (t >= times[n - 1]) return n - 1;
  let lo = 0, hi = n - 1;
  while (hi - lo > 1) {
    const mid = (lo + hi) >> 1;
    if (times[mid] <= t) lo = mid; else hi = mid;
  }
  return lo;
}

/** The index of the time nearest `t` in a sorted list, -1 for an empty list. */
export function nearestIndex(times, t) {
  const i = indexAtOrBefore(times, t);
  if (i < 0 || i === times.length - 1) return i;
  return Math.abs(times[i + 1] - t) < Math.abs(t - times[i]) ? i + 1 : i;
}

/** [first, last] indices of the times inside [a, b] (inclusive), or null when none is. */
export function indexWindow(times, a, b) {
  const n = times ? times.length : 0;
  if (!n || b < times[0] || a > times[n - 1]) return null;
  let i = indexAtOrBefore(times, a);
  if (times[i] < a) i++;
  const j = indexAtOrBefore(times, b);
  return i <= j ? [i, j] : null;
}

const clampTo = (x, lo, hi) => Math.min(hi, Math.max(lo, x));

/**
 * A clock over [start, end] (seconds since the run's start). `times` (sorted) are the run's
 * epochs, which ← and → step through; without them a step is `step` seconds (default a
 * hundredth of the span). Each change calls the subscribers with a snapshot:
 * { t, start, end, playing, dir, speed, range, marks, reason }.
 */
export function createClock({ start = 0, end = 1, t, times = null, step = 0, speed } = {}) {
  const S = { start: +start, end: Math.max(+start, +end), t: 0, playing: false, dir: 1, speed: 1, range: null, marks: [], times: null, step: 0, nextMark: 1 };
  const subs = new Set();
  const snap = (reason) => Object.freeze({ t: S.t, start: S.start, end: S.end, playing: S.playing, dir: S.dir, speed: S.speed, range: S.range ? S.range.slice() : null, marks: S.marks.map((m) => ({ ...m })), reason });
  const emit = (reason) => { const s = snap(reason); for (const fn of [...subs]) fn(s); return s; };
  const span = () => S.end - S.start;
  const lo = () => (S.range ? S.range[0] : S.start), hi = () => (S.range ? S.range[1] : S.end);
  const api = {
    get t() { return S.t; },
    get start() { return S.start; },
    get end() { return S.end; },
    get playing() { return S.playing; },
    get dir() { return S.dir; },
    get speed() { return S.speed; },
    get range() { return S.range ? S.range.slice() : null; },
    get marks() { return S.marks.map((m) => ({ ...m })); },
    get times() { return S.times; },
    snapshot: () => snap("read"),
    /** Listen to every change; returns the function that stops listening. */
    subscribe(fn) {
      if (typeof fn !== "function") throw new TypeError("subscribe needs a function");
      subs.add(fn);
      return () => subs.delete(fn);
    },
    get listeners() { return subs.size; },
    /** New span (and epochs); the cursor, range and markers are kept where they still fit. */
    setSpan(a, b, ts = S.times) {
      S.start = +a; S.end = Math.max(+a, +b);
      S.times = ts && ts.length ? ts : null;
      S.t = clampTo(S.t, S.start, S.end);
      if (S.range) { const r = [clampTo(S.range[0], S.start, S.end), clampTo(S.range[1], S.start, S.end)]; S.range = r[1] > r[0] ? r : null; }
      S.marks = S.marks.filter((m) => m.t >= S.start && m.t <= S.end);
      return emit("span");
    },
    /** Move the cursor to `t` (clamped to the span). */
    seek(t, reason = "seek") {
      const x = clampTo(Number(t), S.start, S.end);
      if (!Number.isFinite(x)) return snap("none");
      S.t = x;
      return emit(reason);
    },
    /** One epoch (or one step) back (n < 0) or forward (n > 0); pauses playback. */
    step(n = 1) {
      S.playing = false;
      if (S.times) {
        const i = indexAtOrBefore(S.times, S.t);
        const onEpoch = S.times[i] === S.t;
        const j = n > 0 ? (S.t < S.times[0] ? 0 : i + n) : onEpoch ? i + n : i + n + 1;
        return api.seek(S.times[clampTo(j, 0, S.times.length - 1)], "step");
      }
      return api.seek(S.t + n * (S.step || span() / 100 || 1), "step");
    },
    play(dir = S.dir) {
      S.dir = dir < 0 ? -1 : 1;
      if ((S.dir > 0 && S.t >= hi()) || (S.dir < 0 && S.t <= lo())) S.t = S.dir > 0 ? lo() : hi();
      S.playing = true;
      return emit("play");
    },
    pause() { if (!S.playing) return snap("none"); S.playing = false; return emit("pause"); },
    toggle() { return S.playing ? api.pause() : api.play(); },
    setSpeed(x) {
      const v = Number(x);
      if (!(v > 0) || !Number.isFinite(v)) throw new RangeError("speed must be a positive number");
      S.speed = v;
      return emit("speed");
    },
    /**
     * J/K/L as in a video editor: L plays forward, and again doubles the speed (one step up
     * the ladder); J the same backwards; K pauses.
     */
    shuttle(dir) {
      if (dir === 0) return api.pause();
      const d = dir < 0 ? -1 : 1;
      if (S.playing && S.dir === d) {
        const i = SPEEDS.findIndex((s) => s > S.speed);
        S.speed = i < 0 ? S.speed : SPEEDS[i];
        return emit("speed");
      }
      return api.play(d);
    },
    /**
     * Advance a playing clock by `dtMs` of wall time. Playback stays inside the range when
     * one is selected and pauses at its end. Returns true while still playing.
     */
    tick(dtMs) {
      if (!S.playing) return false;
      const x = S.t + (S.dir * S.speed * Math.max(0, dtMs)) / 1000;
      if ((S.dir > 0 && x >= hi()) || (S.dir < 0 && x <= lo())) { S.t = S.dir > 0 ? hi() : lo(); S.playing = false; emit("end"); return false; }
      S.t = x;
      emit("tick");
      return true;
    },
    /** Select [a, b] (ordered and clamped); a range under one epoch across clears it. */
    setRange(a, b) {
      let x = clampTo(Math.min(a, b), S.start, S.end), y = clampTo(Math.max(a, b), S.start, S.end);
      if (!(y > x)) { S.range = null; return emit("range"); }
      S.range = [x, y];
      if (S.t < x || S.t > y) S.t = clampTo(S.t, x, y);
      return emit("range");
    },
    clearRange() { if (!S.range) return snap("none"); S.range = null; return emit("range"); },
    /** `[`: the range starts at the cursor (and runs to the old end, or the span's end). */
    rangeStartHere() { return api.setRange(S.t, S.range && S.range[1] > S.t ? S.range[1] : S.end); },
    /** `]`: the range ends at the cursor (and starts at the old start, or the span's start). */
    rangeEndHere() { return api.setRange(S.range && S.range[0] < S.t ? S.range[0] : S.start, S.t); },
    /** A timed marker at `t` (the cursor by default); one already within `tol` s of it is removed instead. Returns the snapshot. */
    toggleMark(t = S.t, label = "", tol = 0) {
      const x = clampTo(Number(t), S.start, S.end);
      const near = S.marks.findIndex((m) => Math.abs(m.t - x) <= tol);
      if (near >= 0) { S.marks.splice(near, 1); return emit("mark"); }
      S.marks.push({ id: S.nextMark++, t: x, label: String(label || "") });
      S.marks.sort((p, q) => p.t - q.t);
      return emit("mark");
    },
    addMark(t = S.t, label = "") {
      const x = clampTo(Number(t), S.start, S.end);
      S.marks.push({ id: S.nextMark++, t: x, label: String(label || "") });
      S.marks.sort((p, q) => p.t - q.t);
      return emit("mark");
    },
    removeMark(id) { const n = S.marks.length; S.marks = S.marks.filter((m) => m.id !== id); return n === S.marks.length ? snap("none") : emit("mark"); },
    /** Jump to the next (dir > 0) or previous marker; null when there is none that way. */
    jumpMark(dir = 1) {
      const m = dir > 0 ? S.marks.find((x) => x.t > S.t + 1e-9) : [...S.marks].reverse().find((x) => x.t < S.t - 1e-9);
      return m ? api.seek(m.t, "mark-jump") : null;
    },
  };
  S.times = times && times.length ? times : null;
  S.step = step > 0 ? step : 0;
  S.speed = speed > 0 ? speed : defaultSpeed(span());
  S.t = clampTo(t === undefined ? S.start : Number(t), S.start, S.end);
  return api;
}

/**
 * What a key press does to the clock, or null for any other key. Keys typed into a field,
 * keys with Ctrl, Cmd or Alt, and the arrow keys inside a tab list are left alone; Space is
 * left to a focused button or link.
 * space play/pause · J back · K pause · L forward · ←/→ step (Shift: ten) · M marker ·
 * [ range start · ] range end · Escape clear the range · , and . previous and next marker.
 */
export function clockKey(e, { inField = false, onButton = false, inTabList = false } = {}) {
  if (!e || e.ctrlKey || e.metaKey || e.altKey || inField || e.isComposing) return null;
  const k = e.key;
  if (k === " " || k === "Spacebar") return onButton ? null : { action: "toggle" };
  if (k === "ArrowLeft" || k === "ArrowRight") return inTabList ? null : { action: "step", n: (k === "ArrowLeft" ? -1 : 1) * (e.shiftKey ? 10 : 1) };
  const l = k.length === 1 ? k.toLowerCase() : k;
  if (l === "j") return { action: "shuttle", dir: -1 };
  if (l === "k") return { action: "shuttle", dir: 0 };
  if (l === "l") return { action: "shuttle", dir: 1 };
  if (l === "m") return { action: "mark" };
  if (k === "[") return { action: "range-start" };
  if (k === "]") return { action: "range-end" };
  if (k === ",") return { action: "mark-jump", dir: -1 };
  if (k === ".") return { action: "mark-jump", dir: 1 };
  if (k === "Escape") return { action: "clear-range" };
  return null;
}

/** Apply a clockKey() action to a clock. Returns true when it did something. */
export function applyKey(clock, act) {
  if (!act) return false;
  switch (act.action) {
    case "toggle": clock.toggle(); return true;
    case "shuttle": clock.shuttle(act.dir); return true;
    case "step": clock.step(act.n); return true;
    case "mark": clock.toggleMark(clock.t); return true;
    case "range-start": clock.rangeStartHere(); return true;
    case "range-end": clock.rangeEndHere(); return true;
    case "clear-range": if (!clock.range) return false; clock.clearRange(); return true;
    case "mark-jump": return clock.jumpMark(act.dir) !== null;
    default: return false;
  }
}

/**
 * Drive a clock from animation frames while it plays: `raf`/`caf` are
 * requestAnimationFrame/cancelAnimationFrame (or stand-ins in a test). Returns stop().
 */
export function attachTicker(clock, raf, caf) {
  let id = 0, last = 0, inFrame = false;
  const frame = (now) => {
    id = 0;
    const dt = last ? Math.min(250, now - last) : 0;
    last = now;
    inFrame = true;
    const more = clock.tick(dt);
    inFrame = false;
    if (more && clock.playing) id = raf(frame);
    else last = 0;
  };
  const off = clock.subscribe((s) => {
    if (inFrame) return;
    if (s.playing && !id) { last = 0; id = raf(frame); }
    if (!s.playing && id) { caf(id); id = 0; last = 0; }
  });
  return () => { off(); if (id) caf(id); id = 0; };
}

const pad = (n, w = 2) => String(Math.floor(n)).padStart(w, "0");
/**
 * A clock reading: "14:21:07 UTC" (with `.250` when `ms`) when the run's t = 0 is a known
 * UTC instant (`epochMs`), else the time since the start, "T+0:12:34" (or "T+2 d 03:00:00").
 */
export function clockText(t, { epochMs = null, ms = false } = {}) {
  if (!Number.isFinite(t)) return "–";
  if (Number.isFinite(epochMs)) {
    const d = new Date(epochMs + t * 1000);
    if (Number.isNaN(+d)) return "–";
    return `${pad(d.getUTCHours())}:${pad(d.getUTCMinutes())}:${pad(d.getUTCSeconds())}${ms ? `.${pad(d.getUTCMilliseconds(), 3)}` : ""} UTC`;
  }
  const neg = t < 0;
  let s = Math.abs(t);
  const days = Math.floor(s / 86400);
  s -= days * 86400;
  const frac = ms ? `.${pad(Math.round((s % 1) * 1000) % 1000, 3)}` : "";
  const hms = `${Math.floor(s / 3600)}:${pad((s % 3600) / 60)}:${pad(s % 60)}${frac}`;
  return `T${neg ? "−" : "+"}${days ? `${days} d ${hms.padStart(8, "0")}` : hms}`;
}

/** A playback speed as text: "×60", "×0.5". */
export const speedText = (x) => `×${x >= 1 ? Math.round(x) : x}`;
