// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the time-series plot on the time cursor (0.42 U7). Two canvases: the
// series, axes and threshold are drawn when the data, the size, the style or the range
// change; the cursor line, the values at the cursor and the markers on every clock change,
// so scrubbing redraws only the thin top layer. A long series is cut to one minimum and one
// maximum per pixel column. Click moves the cursor, drag selects a range, double-click clears
// it. The pure parts (ticks, decimation) are exported and tested in ./clock.test.mjs.
import { indexAtOrBefore, indexWindow, clockText } from "./clock.mjs";

/** About `n` round tick values covering [lo, hi]. */
export function ticks(lo, hi, n = 5) {
  if (!(hi > lo)) return [lo];
  const raw = (hi - lo) / Math.max(1, n);
  const p = 10 ** Math.floor(Math.log10(raw));
  const m = raw / p;
  const step = (m <= 1 ? 1 : m <= 2 ? 2 : m <= 5 ? 5 : 10) * p;
  const out = [];
  for (let v = Math.ceil(lo / step) * step; v <= hi + step * 1e-9; v += step) out.push(Math.abs(v) < step * 1e-9 ? 0 : v);
  return out;
}

/**
 * Time ticks (s) for [lo, hi]: a step of 1-2-5 s, minutes or hours, about `n` of them, placed
 * where t + `offset` is a whole number of steps (offset: the UTC seconds of t = 0, so the
 * ticks fall on round clock times).
 */
export function timeTicks(lo, hi, n = 6, offset = 0) {
  const span = hi - lo;
  if (!(span > 0)) return [lo];
  const steps = [0.1, 0.2, 0.5, 1, 2, 5, 10, 15, 30, 60, 120, 300, 600, 900, 1800, 3600, 7200, 10800, 21600, 43200, 86400, 172800, 604800];
  const step = steps.find((s) => span / s <= n) ?? span / n;
  const out = [];
  const off = ((offset % step) + step) % step;
  for (let v = Math.ceil((lo + off) / step - 1e-9) * step - off; v <= hi + step * 1e-9; v += step) out.push(v + 0);
  return out;
}

/**
 * One [min, max] per pixel column of the samples of (t, v) inside [x0, x1] drawn `px` wide:
 * { cols: Float64Array of min, max pairs (NaN for an empty column), first, last } where first
 * and last are the sample indices just outside the window (to draw the line to the edge).
 */
export function decimate(t, v, x0, x1, px) {
  const n = Math.max(1, Math.floor(px));
  const cols = new Float64Array(n * 2).fill(NaN);
  const w = indexWindow(t, x0, x1);
  const first = Math.max(0, indexAtOrBefore(t, x0)), last = w ? Math.min(t.length - 1, w[1] + 1) : first;
  if (!w || !(x1 > x0)) return { cols, first, last };
  const k = n / (x1 - x0);
  for (let i = w[0]; i <= w[1]; i++) {
    const y = v[i];
    if (!Number.isFinite(y)) continue;
    const c = Math.min(n - 1, Math.floor((t[i] - x0) * k));
    const a = cols[2 * c], b = cols[2 * c + 1];
    if (!(y >= a)) cols[2 * c] = y;
    if (!(y <= b)) cols[2 * c + 1] = y;
  }
  return { cols, first, last };
}

/** The y extent of the series inside [x0, x1] (and a threshold), padded; [0, 1] when empty. */
export function yExtent(series, x0, x1, threshold = null) {
  let lo = Infinity, hi = -Infinity;
  for (const s of series) {
    const w = indexWindow(s.t, x0, x1);
    if (!w) continue;
    for (let i = w[0]; i <= w[1]; i++) { const y = s.v[i]; if (y < lo) lo = y; if (y > hi) hi = y; }
  }
  if (Number.isFinite(threshold)) { lo = Math.min(lo, threshold); hi = Math.max(hi, threshold); }
  if (!(hi >= lo)) return [0, 1];
  if (hi === lo) { const d = Math.abs(hi) * 0.1 || 1; return [lo - d, hi + d]; }
  const pad = (hi - lo) * 0.06;
  return [lo - pad, hi + pad];
}

const fmtNum = (x) => {
  const a = Math.abs(x);
  if (a === 0) return "0";
  if (a >= 1e5 || a < 1e-3) return x.toExponential(1);
  return String(+x.toPrecision(4));
};

/**
 * A plot. `colors(name)` resolves a series colour (a CSS variable) to a colour the canvas
 * takes; `style()` gives the map style's colours (lib/map/style.mjs) so plot and map match.
 * Returns { el, setModel(model), setClock(snapshot), restyle(), destroy(), onSeek, onRange,
 * onHoverTime }.
 */
export function createPlot({ t = (id, en) => en, colors = (c) => c, style }) {
  const el = document.createElement("div");
  el.className = "lv-plot-body";
  const base = document.createElement("canvas"), over = document.createElement("canvas");
  base.className = "lv-base"; over.className = "lv-over";
  over.tabIndex = -1;
  const legend = document.createElement("div");
  legend.className = "lv-legend";
  el.append(base, over, legend);
  el.setAttribute("role", "img");
  const ctl = { el, onSeek: null, onRange: null };
  let M = null, C = null, W = 0, H = 0, dpr = 1, st = style();
  const pad = { l: 56, r: 14, t: 14, b: 26 };
  let x0 = 0, x1 = 1, y0 = 0, y1 = 1;
  const X = (x) => pad.l + ((x - x0) / (x1 - x0 || 1)) * (W - pad.l - pad.r);
  const Y = (y) => pad.t + (1 - (y - y0) / (y1 - y0 || 1)) * (H - pad.t - pad.b);
  const Tx = (px) => x0 + ((px - pad.l) / (W - pad.l - pad.r || 1)) * (x1 - x0);

  function size() {
    const r = el.getBoundingClientRect();
    dpr = globalThis.devicePixelRatio || 1;
    W = Math.max(10, Math.round(r.width)); H = Math.max(10, Math.round(r.height));
    for (const c of [base, over]) if (c.width !== W * dpr || c.height !== H * dpr) { c.width = W * dpr; c.height = H * dpr; c.style.width = `${W}px`; c.style.height = `${H}px`; }
  }
  function drawBase() {
    const g = base.getContext("2d");
    g.setTransform(dpr, 0, 0, dpr, 0, 0);
    g.fillStyle = st.paper || st.sea; g.fillRect(0, 0, W, H);
    if (!M || !M.series.length) { g.fillStyle = st.text2; g.font = `12px ${st.font}`; g.fillText(t("js-desk-plot-none", "No series over time in this result."), 16, 24); return; }
    const r = C && C.range;
    [x0, x1] = r ? r : M.span;
    [y0, y1] = yExtent(M.series, x0, x1, M.threshold);
    g.font = `10.5px ${st.mono}`;
    g.lineWidth = 1;
    // grid and axes
    g.strokeStyle = st.grid; g.fillStyle = st.gridText;
    g.textAlign = "right"; g.textBaseline = "middle";
    for (const v of ticks(y0, y1, Math.max(2, Math.floor((H - pad.t - pad.b) / 40)))) {
      const y = Math.round(Y(v)) + 0.5;
      g.beginPath(); g.moveTo(pad.l, y); g.lineTo(W - pad.r, y); g.stroke();
      g.fillText(fmtNum(v), pad.l - 6, y);
    }
    g.textAlign = "center"; g.textBaseline = "top";
    for (const v of timeTicks(x0, x1, Math.max(2, Math.floor((W - pad.l - pad.r) / 110)), Number.isFinite(M.epochMs) ? M.epochMs / 1000 : 0)) {
      const x = Math.round(X(v)) + 0.5;
      g.beginPath(); g.moveTo(x, pad.t); g.lineTo(x, H - pad.b); g.stroke();
      g.fillText(clockText(v, { epochMs: M.epochMs }), x, H - pad.b + 6);
    }
    // threshold
    if (Number.isFinite(M.threshold) && M.threshold >= y0 && M.threshold <= y1) {
      const y = Y(M.threshold);
      g.save(); g.setLineDash([5, 4]); g.strokeStyle = st.untrusted; g.globalAlpha = 0.8;
      g.beginPath(); g.moveTo(pad.l, y); g.lineTo(W - pad.r, y); g.stroke(); g.restore();
      if (M.thresholdLabel) { g.fillStyle = st.untrusted; g.textAlign = "right"; g.textBaseline = "bottom"; g.fillText(M.thresholdLabel, W - pad.r - 4, y - 3); }
    }
    // series: min/max per column
    g.save();
    g.beginPath(); g.rect(pad.l, pad.t, W - pad.l - pad.r, H - pad.t - pad.b); g.clip();
    const cw = W - pad.l - pad.r;
    for (const s of M.series) {
      g.strokeStyle = colors(s.color) || st.track; g.lineWidth = 1.5; g.lineJoin = "round";
      const { cols, first, last } = decimate(s.t, s.v, x0, x1, cw);
      g.beginPath();
      let on = false;
      if (s.t[first] < x0 && Number.isFinite(s.v[first])) { g.moveTo(X(s.t[first]), Y(s.v[first])); on = true; }
      for (let c = 0; c < cols.length / 2; c++) {
        const a = cols[2 * c], b = cols[2 * c + 1];
        if (Number.isNaN(a)) continue;
        const x = pad.l + c + 0.5;
        if (!on) { g.moveTo(x, Y(a)); on = true; } else g.lineTo(x, Y(a));
        if (b !== a) g.lineTo(x, Y(b));
      }
      if (on && s.t[last] > x1 && Number.isFinite(s.v[last])) g.lineTo(X(s.t[last]), Y(s.v[last]));
      g.stroke();
    }
    g.restore();
    g.fillStyle = st.gridText; g.textAlign = "left"; g.textBaseline = "top"; g.font = `11px ${st.font}`;
    if (M.yLabel) g.fillText(M.yLabel, pad.l + 6, pad.t + 2);
    el.setAttribute("aria-label", `${M.title || M.yLabel || ""}`);
  }
  let drag = null;
  function drawOver() {
    const g = over.getContext("2d");
    g.setTransform(dpr, 0, 0, dpr, 0, 0);
    g.clearRect(0, 0, W, H);
    if (!M || !M.series.length || !C) return;
    for (const m of C.marks) {
      if (m.t < x0 || m.t > x1) continue;
      const x = Math.round(X(m.t)) + 0.5;
      g.strokeStyle = st.mark; g.lineWidth = 1; g.setLineDash([3, 3]);
      g.beginPath(); g.moveTo(x, pad.t); g.lineTo(x, H - pad.b); g.stroke(); g.setLineDash([]);
      g.fillStyle = st.mark; g.beginPath(); g.moveTo(x - 4, pad.t); g.lineTo(x + 4, pad.t); g.lineTo(x, pad.t + 6); g.fill();
    }
    if (drag && drag.moved) {
      const a = Math.min(drag.x0, drag.x), b = Math.max(drag.x0, drag.x);
      g.fillStyle = st.range; g.fillRect(a, pad.t, b - a, H - pad.t - pad.b);
    }
    if (C.t < x0 || C.t > x1) return;
    const x = Math.round(X(C.t)) + 0.5;
    g.strokeStyle = st.cursor; g.lineWidth = 1;
    g.beginPath(); g.moveTo(x, pad.t - 4); g.lineTo(x, H - pad.b); g.stroke();
    for (const s of M.series) {
      const i = indexAtOrBefore(s.t, C.t);
      if (i < 0 || C.t < s.t[0] || !Number.isFinite(s.v[i])) continue;
      const y = Y(s.v[i]);
      if (y < pad.t || y > H - pad.b) continue;
      g.fillStyle = colors(s.color) || st.track; g.strokeStyle = st.paper || st.sea; g.lineWidth = 2;
      g.beginPath(); g.arc(X(s.t[i]), y, 3.5, 0, Math.PI * 2); g.fill(); g.stroke();
    }
  }
  function drawLegend() {
    legend.replaceChildren(...(M ? M.series : []).map((s) => {
      const i = document.createElement("span");
      const sw = document.createElement("i");
      sw.style.background = colors(s.color) || st.track;
      i.append(sw, document.createTextNode(s.label));
      return i;
    }));
  }
  const ro = typeof ResizeObserver === "function" ? new ResizeObserver(() => { size(); drawBase(); drawOver(); }) : null;
  if (ro) ro.observe(el);
  const px = (e) => e.clientX - over.getBoundingClientRect().left;
  over.addEventListener("pointerdown", (e) => {
    if (!M || !M.series.length || e.button !== 0) return;
    try { over.setPointerCapture(e.pointerId); } catch { /* a synthetic pointer */ }
    drag = { x0: px(e), x: px(e), moved: false };
  });
  over.addEventListener("pointermove", (e) => {
    if (!drag) return;
    drag.x = px(e);
    if (Math.abs(drag.x - drag.x0) > 4) drag.moved = true;
    if (drag.moved) drawOver(); else if (ctl.onSeek) ctl.onSeek(Tx(drag.x));
  });
  over.addEventListener("pointerup", (e) => {
    if (!drag) return;
    const d = drag; drag = null;
    if (d.moved) { if (ctl.onRange) ctl.onRange(Tx(Math.min(d.x0, d.x)), Tx(Math.max(d.x0, d.x))); }
    else if (ctl.onSeek) ctl.onSeek(Tx(px(e)));
    drawOver();
  });
  over.addEventListener("pointercancel", () => { drag = null; drawOver(); });
  over.addEventListener("dblclick", () => { if (ctl.onRange) ctl.onRange(null, null); });

  let rangeKey = "";
  ctl.setModel = (m) => { M = m; size(); drawBase(); drawLegend(); drawOver(); };
  ctl.setClock = (snap) => {
    C = snap;
    const k = snap.range ? `${snap.range[0]},${snap.range[1]}` : "";
    if (k !== rangeKey) { rangeKey = k; drawBase(); }
    drawOver();
  };
  ctl.restyle = () => { st = style(); drawBase(); drawLegend(); drawOver(); };
  ctl.resize = () => { size(); drawBase(); drawOver(); };
  ctl.destroy = () => { if (ro) ro.disconnect(); };
  return ctl;
}

/**
 * The plot's one entry point for the run view: mount a time-series plot of `model` (the run's
 * time model: series, span, threshold, epochMs) into `el`, following `clock` (click seeks,
 * drag selects a range, double-click clears it). Kept this thin so the plot can be swapped
 * for another chart module without touching the run view. Returns { setModel, restyle,
 * resize, destroy }.
 */
export function mountPlot(el, model, clock, opts = {}) {
  const p = createPlot(opts);
  el.append(p.el);
  p.onSeek = (x) => { clock.pause(); clock.seek(x, "scrub"); };
  p.onRange = (a, b) => { if (a === null) clock.clearRange(); else clock.setRange(a, b); };
  const off = clock.subscribe((s) => p.setClock(s));
  p.setModel(model);
  p.setClock(clock.snapshot());
  return {
    setModel(m) { p.setModel(m); p.setClock(clock.snapshot()); },
    restyle: () => p.restyle(),
    resize: () => p.resize(),
    destroy() { off(); p.destroy(); p.el.remove(); },
  };
}
