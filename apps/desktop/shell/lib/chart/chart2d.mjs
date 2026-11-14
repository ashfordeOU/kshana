// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): the interactive 2D chart (Canvas 2D, high-DPI aware).
// createChart(host, spec) draws an "xy" chart (lines, bands, steps, scatter, bars, on linear or
// log axes, with a second y axis), a "heatmap" (cells with a colour scale), a "waterfall" (an
// image buffer) or a "polar" sky plot, and gives every one of them the same interaction:
//
//   hover            crosshair and exact values (nearest point per series, with units)
//   click            pin the readout at that point (click the pin again to remove it)
//   Alt-click, M     place marker A, then B: Δx, Δy and slope between them
//   wheel            zoom about the cursor (over an axis: that axis only)
//   drag             pan;  Shift-drag: box zoom;  drag an axis: zoom that axis only
//   Ctrl/⌘-drag      brush: select epochs, highlighted in every chart of the link group
//   double-click, 0  back to the full view;  + − and arrow keys zoom and pan
//   , and .          step the keyboard cursor through the points;  Enter pins;  Esc clears
//   legend           toggles a series (Shift-click shows only that one)
//   CSV, SVG, PNG    the visible data, the chart as vectors, the chart as an image
//
// With a clock ({ now, range, subscribe(fn), set(t), setRange(a, b) }, the time cursor of the
// window, injected by the caller), a time axis shows the cursor at clock.now, dragging the
// cursor line or along the time axis sets it, and a brush on the time axis sets clock.setRange.
// Every text reaches the page through textContent. Animated view changes are skipped when the
// system asks for reduced motion.
import { scale, zoomDomain, panDomain, boxDomain, niceTicks, logTicks, timeTicks, fmtTick, fmtValue, fmtClock, sane } from "./scale.mjs";
import { m4, visibleRange, dedupePoints } from "./decimate.mjs";
import { nearestValid, nearestPoint, gridCell, inPolygon } from "./hit.mjs";
import { normalise, homeView, visibleRows, epochAxis, equalAspect, barSpacing } from "./data.mjs";
import { toCSV, svgOf } from "./export.mjs";
import { paint } from "./paint.mjs";
import { themeOf, resolveColour, rampRGB, rgbCss, norm, inkOn, withAlpha } from "./colour.mjs";
import { brushHas } from "./link.mjs";

const h = (tag, props = {}, ...kids) => {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (v === undefined || v === null || v === false) continue;
    if (k === "class") n.className = v;
    else if (k === "text") n.textContent = v;
    else if (k.startsWith("on")) n.addEventListener(k.slice(2), v);
    else n.setAttribute(k, v === true ? "" : v);
  }
  for (const c of kids.flat()) if (c !== null && c !== undefined && c !== false) n.append(c.nodeType ? c : document.createTextNode(String(c)));
  return n;
};
const reducedMotion = () => typeof matchMedia === "function" && matchMedia("(prefers-reduced-motion: reduce)").matches;
const raf = typeof requestAnimationFrame === "function" ? requestAnimationFrame : (f) => setTimeout(() => f(Date.now()), 16);
const TYPE_NAME = { xy: "Chart", heatmap: "Heatmap", waterfall: "Waterfall", polar: "Sky plot" };
const slug = (s) => String(s || "chart").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 60) || "chart";
const unitSp = (u) => (u ? ` ${u}` : "");

/** Save a blob under a file name (a download of a local object URL; nothing leaves the machine). */
export function saveBlob(blob, name) {
  const url = URL.createObjectURL(blob);
  const a = h("a", { href: url, download: name });
  document.body.append(a); a.click(); a.remove();
  setTimeout(() => URL.revokeObjectURL(url), 4000);
}

let uid = 0;
export function createChart(host, spec0 = {}) {
  let S = normalise(spec0);
  const id = `kc${++uid}`;
  const hidden = new Set(S.series.filter((r) => r.hidden).map((r) => r.id));
  let view = homeView(S, hidden), home = view;
  let T = null, W = 0, H = 0, P = { l: 50, t: 10, r: 100, b: 100 };
  let sx = null, sy = null, sy2 = null;
  let hover = null, kb = -1, drag = null, brush = null, markMode = false;
  const pins = [], markers = [];
  let needBase = true, needOver = true, queued = false;
  const stats = { baseMs: 0, frames: 0 };
  const listeners = {};
  const emit = (ev, d) => (listeners[ev] || []).forEach((f) => { try { f(d); } catch (e) { console.error(e); } });

  // ---------------------------------------------------------------- DOM
  const titleId = `${id}-t`;
  const btn = (label, title, onclick, extra = {}) => h("button", { type: "button", class: "kc-btn", title, "aria-label": title, onclick, ...extra }, label);
  const markBtn = btn("A/B", "Markers: click to place A, then B", () => { markMode = !markMode; markBtn.setAttribute("aria-pressed", String(markMode)); });
  markBtn.setAttribute("aria-pressed", "false");
  const tools = h("div", { class: "kc-tools", role: "toolbar", "aria-label": "Chart tools" },
    btn("⟲", "Full view (double-click, 0)", () => reset(true)), markBtn,
    btn("CSV", "Save the visible data as CSV", () => saveBlob(new Blob([api.toCSV()], { type: "text/csv" }), `${slug(S.title)}.csv`)),
    btn("SVG", "Save the chart as SVG (vectors)", () => saveBlob(new Blob([api.toSVG()], { type: "image/svg+xml" }), `${slug(S.title)}.svg`)),
    btn("PNG", "Save the chart as PNG", () => api.toPNG().then((b) => b && saveBlob(b, `${slug(S.title)}.png`))));
  const titleEl = h("span", { class: "kc-title", id: titleId, text: S.title });
  const subEl = h("span", { class: "kc-sub", text: S.subtitle || "" });
  const legend = h("div", { class: "kc-legend", role: "group", "aria-label": "Series" });
  const base = h("canvas", { class: "kc-base", "aria-hidden": "true" });
  const over = h("canvas", { class: "kc-over", tabindex: "0", role: "img" });
  const tip = h("div", { class: "kc-tip", "aria-hidden": "true", hidden: true });
  const live = h("p", { class: "kc-vh", "aria-live": "polite" });
  const stage = h("div", { class: "kc-stage" }, base, over, tip);
  const tableBox = h("div", { class: "kc-tablebox" });
  const details = h("details", { class: "kc-table" }, h("summary", { text: "Data table" }), tableBox);
  const fig = h("figure", { class: `kc kc-${S.type}`, role: "group", "aria-labelledby": titleId },
    h("header", { class: "kc-head" }, titleEl, subEl, tools), legend, stage, details, live);
  if (S.height) stage.style.height = `${S.height}px`;
  host.append(fig);
  const ctxB = base.getContext("2d"), ctxO = over.getContext("2d");
  // clear the whole backing store in device pixels, whatever the context's transform
  // (resetting the width: clearRect was seen to leave the box-zoom rectangle behind in Chromium
  // after a drag, with nothing clipping it; a reset always empties the canvas)
  const wipe = (c) => { const t = c.getTransform(); c.canvas.width = c.canvas.width; c.setTransform(t); };

  // ---------------------------------------------------------------- geometry
  function layout() {
    const r = stage.getBoundingClientRect();
    W = Math.max(120, Math.round(r.width)); H = Math.max(100, Math.round(r.height));
    const dpr = Math.min(3, (typeof devicePixelRatio === "number" && devicePixelRatio) || 1);
    for (const c of [base, over]) {
      if (c.width !== Math.round(W * dpr) || c.height !== Math.round(H * dpr)) { c.width = Math.round(W * dpr); c.height = Math.round(H * dpr); }
      c.style.width = `${W}px`; c.style.height = `${H}px`;
    }
    ctxB.setTransform(dpr, 0, 0, dpr, 0, 0); ctxO.setTransform(dpr, 0, 0, dpr, 0, 0);
    if (S.type === "polar") { P = { l: 22, t: 22, r: W - 22, b: H - 22 }; }
    else {
      const yLabW = labelWidth(S.y, view.y, S.type === "heatmap" ? S.grid.yLabels : null);
      const right = S.y2 ? labelWidth(S.y2, view.y2) + 30 : S.grid ? 70 : 14;
      P = { l: Math.min(W * 0.4, yLabW + 30), t: 12, r: W - right, b: H - 38 };
    }
    if (S.equal) view = equalAspect(view, P.r - P.l, P.b - P.t);
    scales();
  }
  function labelWidth(ax, d, cats) {
    if (cats) return Math.max(...cats.map((c) => String(c).length)) * 6.6 + 6;
    const t = ticksOf(ax, d || [0, 1], 5);
    return Math.max(24, ...t.map((v) => tickText(ax, v.v, v.step).length * 6.4)) + 4;
  }
  function scales() {
    sx = scale(S.x.kind, view.x[0], view.x[1], P.l, P.r);
    sy = S.y.flip ? scale(S.y.kind, view.y[0], view.y[1], P.t, P.b) : scale(S.y.kind, view.y[0], view.y[1], P.b, P.t);
    sy2 = S.y2 && view.y2 ? scale(S.y2.kind, view.y2[0], view.y2[1], P.b, P.t) : null;
  }
  const yScale = (r) => (r && r.axis === "y2" && sy2 ? sy2 : sy);
  function ticksOf(ax, d, n) {
    const [a, b] = [Math.min(d[0], d[1]), Math.max(d[0], d[1])];
    if (ax.categories) { const out = []; for (let i = Math.ceil(a); i <= b; i++) if (i >= 0 && i < ax.categories.length) out.push({ v: i, step: 1 }); return out; }
    if (ax.kind === "log") return logTicks(a, b).ticks.map((v) => ({ v, step: 0 }));
    const t = ax.time ? timeTicks(a, b, n) : niceTicks(a, b, n);
    return t.ticks.map((v) => ({ v, step: t.step }));
  }
  function tickText(ax, v, step) {
    if (ax.format) return ax.format(v);
    if (ax.categories) return String(ax.categories[v] ?? "");
    if (ax.time) return fmtClock(v);
    return fmtTick(v, step, ax.kind);
  }
  const fmtAxis = (ax, v) => (ax.format ? ax.format(v) : ax.categories ? String(ax.categories[Math.round(v)] ?? fmtValue(v)) : ax.time ? `${fmtClock(v)} (${fmtValue(v, 7)} s)` : `${fmtValue(v)}${unitSp(ax.unit)}`);
  const inPlot = (px, py) => px >= P.l && px <= P.r && py >= P.t && py <= P.b;
  function zone(px, py) {
    if (inPlot(px, py)) return "plot";
    if (S.type === "polar") return "none";
    if (px >= P.l && px <= P.r && py > P.b && py <= H) return "x";
    if (py >= P.t && py <= P.b && px < P.l) return "y";
    if (py >= P.t && py <= P.b && px > P.r && S.y2) return "y2";
    return "none";
  }
  const isHidden = (r) => hidden.has(r.id) || (r.group && hidden.has(r.group));
  const clock = () => S.clock || null;
  const now = () => { const c = clock(); return c && Number.isFinite(c.now) ? c.now : null; };
  const EA = () => epochAxis(S);

  // ---------------------------------------------------------------- drawing
  function col(c) { return resolveColour(c, T, fig); }
  function axesList(L, exporting) {
    const g = T.grid, ink3 = T.ink3, font = T.mono;
    if (S.type === "polar") return;
    for (const { v, step } of ticksOf(S.x, view.x, Math.max(2, Math.round((P.r - P.l) / 90)))) {
      const x = sx.map(v);
      if (x < P.l - 0.5 || x > P.r + 0.5) continue;
      if (S.type === "xy") L.push({ k: "path", pts: [x, P.t, x, P.b], stroke: g, width: 1 });
      L.push({ k: "text", x, y: P.b + 6, text: tickText(S.x, v, step), color: ink3, size: 10.5, align: "center", base: "top", font });
    }
    const yAx = (ax, s, d, side) => {
      if (S.type === "heatmap" && S.grid.yLabels && side === "l") {
        S.grid.ys.forEach((yv, j) => { const y = s.map(yv); if (y >= P.t && y <= P.b) L.push({ k: "text", x: P.l - 8, y, text: String(S.grid.yLabels[j]), color: T.ink2, size: 11, align: "right", base: "middle", font }); });
        return;
      }
      for (const { v, step } of ticksOf(ax, d, Math.max(2, Math.round((P.b - P.t) / 50)))) {
        const y = s.map(v);
        if (y < P.t - 0.5 || y > P.b + 0.5) continue;
        if (S.type === "xy" && side === "l") L.push({ k: "path", pts: [P.l, y, P.r, y], stroke: g, width: 1 });
        L.push({ k: "text", x: side === "l" ? P.l - 6 : P.r + 6, y, text: tickText(ax, v, step), color: ink3, size: 10.5, align: side === "l" ? "right" : "left", base: "middle", font });
      }
    };
    yAx(S.y, sy, view.y, "l");
    if (sy2) yAx(S.y2, sy2, view.y2, "r");
    if (S.type === "xy" && S.x.kind === "log") for (const v of logTicks(Math.min(...view.x), Math.max(...view.x)).minor) { const x = sx.map(v); if (x > P.l && x < P.r) L.push({ k: "path", pts: [x, P.t, x, P.b], stroke: g, width: 0.5, alpha: 0.6 }); }
    if (S.type === "xy" && S.y.kind === "log") for (const v of logTicks(Math.min(...view.y), Math.max(...view.y)).minor) { const y = sy.map(v); if (y > P.t && y < P.b) L.push({ k: "path", pts: [P.l, y, P.r, y], stroke: g, width: 0.5, alpha: 0.6 }); }
    const xt = [S.x.label, S.x.unit && !S.x.time ? `(${S.x.unit})` : S.x.time ? "(h:mm:ss)" : ""].filter(Boolean).join(" ");
    if (xt) L.push({ k: "text", x: P.r, y: H - 4, text: xt, color: T.ink2, size: 10.5, align: "right", base: "bottom", font });
    const yt = [S.y.label, S.y.unit ? `(${S.y.unit})` : ""].filter(Boolean).join(" ");
    if (yt && !(S.type === "heatmap" && S.grid.yLabels)) L.push({ k: "text", x: 11, y: P.t + (P.b - P.t) / 2, text: yt, color: T.ink2, size: 10.5, align: "center", base: "middle", rotate: -Math.PI / 2, font });
    if (S.y2) { const t2 = [S.y2.label, S.y2.unit ? `(${S.y2.unit})` : ""].filter(Boolean).join(" "); L.push({ k: "text", x: W - 8, y: P.t + (P.b - P.t) / 2, text: t2, color: T.ink2, size: 10.5, align: "center", base: "middle", rotate: Math.PI / 2, font }); }
    L.push({ k: "rect", x: P.l, y: P.t, w: P.r - P.l, h: P.b - P.t, stroke: T.grid, width: 1 });
    if (exporting && S.title) L.unshift({ k: "text", x: P.l, y: 2, text: S.title, color: T.ink, size: 11, base: "top", font, weight: 500 });
  }

  function seriesList(L) {
    const pw = P.r - P.l;
    const ea = EA();
    const bandOn = brush && ea === "x";
    const bars = S.series.filter((r) => r.kind === "bar" && !isHidden(r));
    const bw = bars.length ? Math.max(2, Math.min(60, Math.abs(sx.map(barSpacing(bars)) - sx.map(0)) * 0.78 / bars.length)) : 0;
    if (bandOn) { const x0 = Math.max(P.l, sx.map(brush.range[0])), x1 = Math.min(P.r, sx.map(brush.range[1])); if (x1 > x0) L.push({ k: "rect", x: x0, y: P.t, w: Math.max(1, x1 - x0), h: P.b - P.t, fill: withAlpha(col("tim"), 0.12) }); }
    S.series.forEach((r) => {
      if (isHidden(r) || !r.x || !r.y) return;
      const c = col(r.color), ys = yScale(r);
      const mx = (v) => sx.map(v), my = (v) => ys.map(v);
      const [i0, i1] = r.sorted ? visibleRange(r.x, Math.min(...view.x), Math.max(...view.x)) : [0, r.n];
      if (r.lo && r.hi) {
        const idx = r.sorted && i1 - i0 > pw * 4 ? m4(r.x, r.hi, i0, i1, (v) => mx(v)) : null;
        const pts = [];
        const list = idx ? Array.from(idx).filter((i) => i >= 0) : Array.from({ length: i1 - i0 }, (_, k) => i0 + k);
        for (const i of list) if (r.hi[i] === r.hi[i]) pts.push(mx(r.x[i]), my(r.hi[i]));
        for (let k = list.length - 1; k >= 0; k--) { const i = list[k]; if (r.lo[i] === r.lo[i]) pts.push(mx(r.x[i]), my(r.lo[i])); }
        L.push({ k: "path", pts, fill: withAlpha(c, r.bandAlpha ?? 0.2), close: true });
        if (r.kind === "band") return;
      }
      if (r.kind === "line" || r.kind === "step" || r.kind === "area" || r.kind === "band") {
        let pts;
        if (r.sorted && i1 - i0 > pw * 2) {
          const idx = m4(r.x, r.y, i0, i1, (v) => mx(v));
          pts = new Float32Array(idx.length * 2);
          for (let k = 0; k < idx.length; k++) { const i = idx[k]; pts[2 * k] = i < 0 ? NaN : mx(r.x[i]); pts[2 * k + 1] = i < 0 ? NaN : my(r.y[i]); }
        } else {
          const n = i1 - i0, step = r.kind === "step";
          pts = new Float32Array((step ? 2 * n : n) * 2);
          let k = 0;
          for (let i = i0; i < i1; i++) {
            const X = mx(r.x[i]), Y = r.y[i] === r.y[i] ? my(r.y[i]) : NaN;
            if (step && i > i0) { pts[k++] = X; pts[k++] = pts[k - 3] !== pts[k - 3] ? NaN : pts[k - 3]; }
            pts[k++] = X; pts[k++] = Y;
          }
          pts = pts.subarray(0, k);
        }
        if (r.kind === "area") { const yb = my(Math.max(ys.d[0], Math.min(0, ys.d[1]))); const fp = Array.from(pts); fp.push(pts[pts.length - 2], yb, pts[0], yb); L.push({ k: "path", pts: fp, fill: withAlpha(c, 0.18), close: true }); }
        L.push({ k: "path", pts, stroke: c, width: r.width ?? 1.6, dash: r.dash, alpha: bandOn ? 0.55 : 1 });
        if (bandOn) {
          const [b0, b1] = visibleRange(r.x, brush.range[0], brush.range[1]);
          const seg = [];
          for (let i = b0; i < b1; i++) if (r.x[i] >= brush.range[0] && r.x[i] <= brush.range[1]) seg.push(mx(r.x[i]), r.y[i] === r.y[i] ? my(r.y[i]) : NaN);
          if (seg.length > 2 && seg.length < 40000) L.push({ k: "path", pts: seg, stroke: c, width: (r.width ?? 1.6) + 1.4 });
        }
        if (r.points) { const pp = []; for (let i = i0; i < i1; i++) if (r.y[i] === r.y[i]) pp.push(mx(r.x[i]), my(r.y[i])); L.push({ k: "points", pts: pp, color: c, size: r.points === true ? 4 : r.points }); }
        if (r.flag) { // points over a limit, drawn in the "bad" colour (a mask violation)
          const pp = []; for (let i = i0; i < i1; i++) if (r.flag[i]) pp.push(mx(r.x[i]), my(r.y[i]));
          if (pp.length) L.push({ k: "points", pts: pp, color: col("bad"), size: 6 });
        }
        if (brush && ea === "points" && r.t) {
          const pp = []; for (let i = i0; i < i1; i++) if (brushHas(brush, r.t[i]) && r.y[i] === r.y[i]) pp.push(mx(r.x[i]), my(r.y[i]));
          if (pp.length) L.push({ k: "points", pts: pp, color: c, size: 6 });
        }
        return;
      }
      if (r.kind === "scatter") {
        const size = r.size ?? 4;
        const idx = i1 - i0 > 20000 ? dedupePoints(r.x, r.y, i0, i1, (v) => mx(v) - P.l, (v) => my(v) - P.t, pw, P.b - P.t, Math.max(1, size / 2)) : null;
        const pts = [], dim = [], hot = [];
        const each = (i) => {
          const X = mx(r.x[i]), Y = my(r.y[i]);
          if (!(Y === Y) || X < P.l - size || X > P.r + size) return;
          if (brush && r.t) (brushHas(brush, r.t[i]) ? hot : dim).push(X, Y); else pts.push(X, Y);
        };
        if (idx) for (const i of idx) each(i); else for (let i = i0; i < i1; i++) each(i);
        if (dim.length) L.push({ k: "points", pts: dim, color: withAlpha(c, 0.14), size, shape: r.shape });
        if (pts.length) L.push({ k: "points", pts, color: withAlpha(c, r.alpha ?? 0.85), size, shape: r.shape });
        if (hot.length) L.push({ k: "points", pts: hot, color: c, size: size + 2, shape: r.shape }, { k: "points", pts: hot, color: col("ink"), size: size + 5, stroke: true });
        return;
      }
      if (r.kind === "bar") {
        const k = bars.indexOf(r), y0 = my(ys.kind === "log" ? ys.d[0] : Math.max(Math.min(0, ys.d[1]), ys.d[0]));
        for (let i = i0; i < i1; i++) {
          const X = mx(r.x[i]) - (bars.length * bw) / 2 + k * bw, Y = my(r.y[i]);
          if (!(Y === Y)) continue;
          const hot = brush && r.t && brushHas(brush, r.t[i]);
          L.push({ k: "rect", x: X + 1, y: Math.min(Y, y0), w: bw - 2, h: Math.abs(y0 - Y), fill: r.colors ? col(r.colors[i]) : c, alpha: brush && r.t && !hot ? 0.35 : 1 });
          if (r.labels !== false && bw > 26) L.push({ k: "text", x: X + bw / 2, y: Math.min(Y, y0) - 3, text: fmtValue(r.y[i], 3), color: T.ink2, size: 10, align: "center", base: "bottom", font: T.mono });
        }
      }
    });
  }

  function overlaysList(L, which = null) {
    for (const o of S.overlays) {
      if (which && !which(o)) continue;
      const ys = o.axis === "y2" && sy2 ? sy2 : sy;
      const c = col(o.color || "ink3");
      if (o.kind === "hline") {
        const y = ys.map(o.y); if (!(y >= P.t && y <= P.b)) continue;
        L.push({ k: "path", pts: [P.l, y, P.r, y], stroke: c, width: o.width ?? 1.2, dash: o.dash ?? [5, 4] });
        if (o.label) L.push({ k: "text", x: P.r - 4, y: y - 4, text: o.label, color: c, size: 10.5, align: "right", base: "bottom", font: T.mono });
      } else if (o.kind === "vline") {
        const x = sx.map(o.x); if (!(x >= P.l && x <= P.r)) continue;
        L.push({ k: "path", pts: [x, P.t, x, P.b], stroke: c, width: o.width ?? 1.2, dash: o.dash ?? [5, 4] });
        if (o.label) L.push({ k: "text", x: x + 4, y: P.t + 4, text: o.label, color: c, size: 10.5, base: "top", font: T.mono });
      } else if (o.kind === "curve" || o.kind === "poly") {
        const pts = o.pts.flatMap(([x, y]) => [sx.map(x), ys.map(y)]);
        if (o.kind === "poly") L.push({ k: "path", pts, fill: withAlpha(c, o.alpha ?? 0.1), close: true });
        else L.push({ k: "path", pts, stroke: c, width: o.width ?? 1.4, dash: o.dash ?? [6, 4] });
        if (o.label) { const at = o.labelAt || o.pts[Math.floor(o.pts.length / 2)]; L.push({ k: "text", x: sx.map(at[0]) + 4, y: ys.map(at[1]) - 4, text: o.label, color: c, size: 10.5, base: "bottom", font: T.mono, align: o.align || "left" }); }
      } else if (o.kind === "span") {
        const x0 = Math.max(P.l, sx.map(o.x0)), x1 = Math.min(P.r, sx.map(o.x1));
        if (x1 > x0) L.push({ k: "rect", x: x0, y: P.t, w: x1 - x0, h: P.b - P.t, fill: withAlpha(c, o.alpha ?? 0.1) });
        if (o.label && x1 > x0) L.push({ k: "text", x: x0 + 4, y: P.b - 4, text: o.label, color: c, size: 10, base: "bottom", font: T.mono });
      } else if (o.kind === "text") {
        L.push({ k: "text", x: sx.map(o.x), y: ys.map(o.y), text: o.text, color: c, size: o.size ?? 10.5, align: o.align || "left", base: "middle", font: T.mono });
      }
    }
  }

  // Grid charts: the waterfall's image buffer is made once per data and colour map.
  let img = null, imgKey = "";
  function gridImage() {
    const g = S.grid, key = `${g.nx}x${g.ny}|${g.map}|${g.zDomain}|${g.log}`;
    if (img && imgKey === key && img.g === g) return img.c;
    const c = document.createElement("canvas"); c.width = g.nx; c.height = g.ny;
    const cx = c.getContext("2d"), id = cx.createImageData(g.nx, g.ny);
    for (let j = 0; j < g.ny; j++) for (let i = 0; i < g.nx; i++) {
      const rgb = rampRGB(g.map, norm(g.z[j * g.nx + i], g.zDomain[0], g.zDomain[1], g.log)), o = (j * g.nx + i) * 4;
      if (rgb) { id.data[o] = rgb[0]; id.data[o + 1] = rgb[1]; id.data[o + 2] = rgb[2]; id.data[o + 3] = 255; }
    }
    cx.putImageData(id, 0, 0);
    img = { c, g }; imgKey = key;
    return c;
  }
  function gridList(L, exporting) {
    const g = S.grid;
    if (S.type === "waterfall") {
      const c = gridImage();
      const x0 = sx.map(g.xe[0]), x1 = sx.map(g.xe[g.nx]), y0 = sy.map(g.ye[0]), y1 = sy.map(g.ye[g.ny]);
      // Row j of the image is the j-th y value; drawn from the screen position of ye[0] to ye[ny].
      L.push({ k: "image", src: c, x: Math.min(x0, x1), y: Math.min(y0, y1), w: Math.abs(x1 - x0), h: Math.abs(y1 - y0), flipX: x1 < x0, flipY: y1 < y0, png: exporting ? c.toDataURL("image/png") : null });
    } else {
      for (let j = 0; j < g.ny; j++) for (let i = 0; i < g.nx; i++) {
        const v = g.z[j * g.nx + i];
        const xa = sx.map(g.xe[i]), xb = sx.map(g.xe[i + 1]), ya = sy.map(g.ye[j]), yb = sy.map(g.ye[j + 1]);
        const x = Math.min(xa, xb), y = Math.min(ya, yb), w = Math.abs(xb - xa), hh = Math.abs(yb - ya);
        if (x > P.r || x + w < P.l || y > P.b || y + hh < P.t) continue;
        const rgb = rampRGB(g.map, norm(v, g.zDomain[0], g.zDomain[1], g.log));
        const gap = w > 8 && hh > 8 ? 1.5 : 0;
        const dimmed = brush && g.t && EA() === "y" && !brushHas(brush, g.ys[j]);
        L.push({ k: "rect", x: x + gap, y: y + gap, w: w - 2 * gap, h: hh - 2 * gap, fill: rgb ? rgbCss(rgb) : T.panel, alpha: dimmed ? 0.35 : 1 });
        if (g.cellText !== false && w > 30 && hh > 15 && v === v) L.push({ k: "text", x: x + w / 2, y: y + hh / 2, text: g.format ? g.format(v) : fmtValue(v, 3), color: inkOn(rgb), size: Math.min(12, hh * 0.45), align: "center", base: "middle", font: T.mono });
      }
    }
    if (brush && EA() === "y" && S.type === "waterfall") {
      const a = sy.map(brush.range[0]), b = sy.map(brush.range[1]);
      L.push({ k: "rect", x: P.l, y: Math.min(a, b), w: P.r - P.l, h: Math.max(1, Math.abs(b - a)), stroke: col("ink"), width: 1.2 });
    }
    // colour bar in the right margin
    const bx = P.r + 14, bw = 10, steps = 48;
    for (let k = 0; k < steps; k++) {
      const t0 = k / steps, y = P.b - (k + 1) * ((P.b - P.t) / steps);
      L.push({ k: "rect", x: bx, y, w: bw, h: (P.b - P.t) / steps + 0.5, fill: rgbCss(rampRGB(g.map, t0 + 0.5 / steps)) });
    }
    const [z0, z1] = g.zDomain;
    const zn = g.log ? null : niceTicks(z0, z1, 4), zt = g.log ? logTicks(z0, z1).ticks : zn.ticks;
    const zs = scale(g.log ? "log" : "linear", z0, z1, P.b, P.t);
    for (const v of zt) { const y = zs.map(v); if (y >= P.t - 1 && y <= P.b + 1) L.push({ k: "text", x: bx + bw + 4, y, text: fmtTick(v, zn ? zn.step : 0, g.log ? "log" : "linear"), color: T.ink3, size: 10, base: "middle", font: T.mono }); }
    if (g.unit) L.push({ k: "text", x: bx, y: P.t - 2, text: g.unit, color: T.ink3, size: 10, base: "bottom", font: T.mono });
  }

  function polarList(L) {
    const cx = sx.map(0), cy = sy.map(0), R = Math.abs(sx.map(1) - cx);
    const ring = (r) => { const pts = []; for (let k = 0; k <= 96; k++) { const a = (k / 96) * Math.PI * 2; pts.push(cx + r * Math.sin(a), cy - r * Math.cos(a)); } return pts; };
    for (const el of S.rings) {
      const r = ((90 - el) / 90) * R;
      L.push({ k: "path", pts: ring(r), stroke: el === 0 ? T.ink3 : T.grid, width: el === 0 ? 1.2 : 1 });
      if (el > 0) L.push({ k: "text", x: cx + 3, y: cy - r - 2, text: `${el}°`, color: T.ink3, size: 10, base: "bottom", font: T.mono });
    }
    L.push({ k: "path", pts: [cx - R, cy, cx + R, cy], stroke: T.grid, width: 1 });
    L.push({ k: "path", pts: [cx, cy - R, cx, cy + R], stroke: T.grid, width: 1 });
    if (S.mask) L.push({ k: "path", pts: ring(((90 - S.mask) / 90) * R), stroke: col("nav"), width: 1, dash: [4, 4] });
    [["N", 0, -1], ["E", 1, 0], ["S", 0, 1], ["W", -1, 0]].forEach(([t, dx, dy]) => L.push({ k: "text", x: cx + dx * (R + 11), y: cy + dy * (R + 11), text: t, color: T.ink2, size: 11, align: "center", base: "middle", font: T.mono }));
    const tn = now();
    const taken = []; // satellite labels that would overlap one already placed are left out (hover still names them)
    const free = (x, y, w) => { const r = [x, y - 11, x + w, y]; if (taken.some((q) => r[0] < q[2] && r[2] > q[0] && r[1] < q[3] && r[3] > q[1])) return false; taken.push(r); return true; };
    for (const tr of S.tracks) {
      if (isHidden(tr)) continue;
      const c = col(tr.color);
      let last = -1;
      const pts = [], hot = [];
      for (let i = 0; i < tr.n; i++) {
        if (tn !== null && tr.t[i] > tn) break;
        pts.push(sx.map(tr.px[i]), sy.map(tr.py[i]));
        if (brush && brushHas(brush, tr.t[i]) && tr.px[i] === tr.px[i]) hot.push(sx.map(tr.px[i]), sy.map(tr.py[i]));
        last = i;
      }
      L.push({ k: "path", pts, stroke: c, width: 1.4, alpha: 0.55 });
      if (hot.length) L.push({ k: "points", pts: hot, color: c, size: 5 });
      if (last >= 0 && tr.px[last] === tr.px[last]) {
        const X = sx.map(tr.px[last]), Y = sy.map(tr.py[last]);
        const off = tr.visible && tr.visible[last] === 0;
        L.push({ k: "points", pts: [X, Y], color: c, size: 9, stroke: off });
        const lab = tr.short || tr.label;
        if (free(X + 7, Y - 6, lab.length * 6)) L.push({ k: "text", x: X + 7, y: Y - 6, text: lab, color: T.ink2, size: 9.5, base: "bottom", font: T.mono });
      }
    }
  }

  function annotations(L, exporting) {
    const tn = now();
    if (exporting && tn !== null && S.type !== "polar") {
      if (EA() === "x" || S.x.time) { const x = sx.map(tn); if (x >= P.l && x <= P.r) L.push({ k: "path", pts: [x, P.t, x, P.b], stroke: col("ink"), width: 1.4 }); }
      else if (EA() === "y" || S.y.time) { const y = sy.map(tn); if (y >= P.t && y <= P.b) L.push({ k: "path", pts: [P.l, y, P.r, y], stroke: col("ink"), width: 1.4 }); }
    }
    for (const p of pins) {
      const it = itemAt(p);
      if (!it || !inPlot(it.px, it.py)) continue;
      const text = it.short;
      const w = text.length * 6.3 + 10, bx = it.px + 8 + w > P.r ? it.px - 8 - w : it.px + 8, by = Math.max(P.t, it.py - 22);
      L.push({ k: "points", pts: [it.px, it.py], color: it.color, size: 8 });
      L.push({ k: "rect", x: bx, y: by, w, h: 18, fill: withAlpha(T.panel, 0.92), stroke: it.color, width: 1 });
      L.push({ k: "text", x: bx + 5, y: by + 9, text, color: T.ink, size: 10.5, base: "middle", font: T.mono });
    }
    markers.forEach((m, k) => {
      const it = itemAt(m);
      if (!it) return;
      const c = col(k ? "pro" : "nav");
      if (it.px >= P.l && it.px <= P.r) L.push({ k: "path", pts: [it.px, P.t, it.px, P.b], stroke: c, width: 1.2, dash: [3, 3] });
      L.push({ k: "points", pts: [it.px, it.py], color: c, size: 9, shape: "diamond" });
      L.push({ k: "text", x: it.px + 5, y: P.t + 3, text: k ? "B" : "A", color: c, size: 11, base: "top", font: T.mono, weight: 600 });
    });
    const d = deltaText();
    if (d) {
      const lines = d.split("\n"), w = Math.max(...lines.map((l) => l.length)) * 6.3 + 14;
      L.push({ k: "rect", x: P.r - w - 6, y: P.t + 6, w, h: lines.length * 15 + 8, fill: withAlpha(T.panel, 0.94), stroke: T.grid, width: 1 });
      lines.forEach((l, i) => L.push({ k: "text", x: P.r - w + 1, y: P.t + 18 + i * 15, text: l, color: i ? T.ink : T.ink2, size: 10.5, font: T.mono }));
    }
  }

  function buildList(exporting = false) {
    T = themeOf(fig);
    const L = [];
    if (S.type === "xy") axesList(L, exporting);
    L.push({ k: "clip", x: P.l, y: P.t, w: P.r - P.l, h: P.b - P.t });
    const under = (o) => o.kind === "poly" || o.kind === "span";
    if (S.type === "xy") { overlaysList(L, under); seriesList(L); overlaysList(L, (o) => !under(o)); }
    else if (S.type === "polar") polarList(L);
    L.push({ k: "unclip" });
    if (S.type === "heatmap" || S.type === "waterfall") {
      L.push({ k: "clip", x: P.l, y: P.t, w: P.r - P.l, h: P.b - P.t });
      const tmp = []; gridList(tmp, exporting);
      // cells and the image inside the clip, the colour bar outside it
      const bar = tmp.filter((p) => p.k === "text" ? p.x > P.r : p.k === "rect" && p.x >= P.r + 10);
      L.push(...tmp.filter((p) => !bar.includes(p)), { k: "unclip" }, ...bar);
      overlaysList(L);
      axesList(L, exporting);
    }
    L.push({ k: "clip", x: P.l - 2, y: P.t - 2, w: P.r - P.l + 4, h: P.b - P.t + 4 });
    annotations(L, exporting);
    L.push({ k: "unclip" });
    if (exporting && S.type !== "xy" && S.title) L.unshift({ k: "text", x: P.l, y: 2, text: S.title, color: T.ink, size: 11, base: "top", font: T.mono, weight: 500 });
    return L;
  }

  function drawBase() {
    const t0 = performance.now();
    layout();
    wipe(ctxB);
    if (!legendLive && fig.isConnected) { legendLive = true; drawLegend(); } // colours from CSS variables resolve once the chart is in the page
    const list = buildList(false); // the time cursor is drawn on the top layer (drawOver)
    // waterfall images draw with their own flips
    for (const p of list) if (p.k === "image" && (p.flipX || p.flipY)) {
      const src = p.src; p.src = flipCanvas(src, p.flipX, p.flipY);
    }
    paint(ctxB, list, { font: T.mono });
    stats.baseMs = performance.now() - t0;
    over.setAttribute("aria-label", ariaText());
    if (details.open) fillTable();
  }
  let legendLive = false;
  const flips = new WeakMap();
  function flipCanvas(src, fx, fy) {
    const key = `${fx}${fy}`, m = flips.get(src) || {};
    if (m[key]) return m[key];
    const c = document.createElement("canvas"); c.width = src.width; c.height = src.height;
    const x = c.getContext("2d"); x.translate(fx ? c.width : 0, fy ? c.height : 0); x.scale(fx ? -1 : 1, fy ? -1 : 1); x.drawImage(src, 0, 0);
    m[key] = c; flips.set(src, m); return c;
  }

  function drawOver() {
    wipe(ctxO);
    const L = [];
    const tn = now();
    if (tn !== null && S.type !== "polar") {
      const ink = col("ink");
      if (EA() === "x" || S.x.time) {
        const x = sx.map(tn);
        if (x >= P.l && x <= P.r) {
          L.push({ k: "path", pts: [x, P.t, x, P.b], stroke: ink, width: 1.4 });
          const tx = fmtClock(tn), w = tx.length * 6.4 + 10;
          L.push({ k: "rect", x: x - w / 2, y: P.t, w, h: 16, fill: ink }, { k: "text", x, y: P.t + 8, text: tx, color: T.bg, size: 10, align: "center", base: "middle", font: T.mono });
        }
      } else if (EA() === "y" || S.y.time) {
        const y = sy.map(tn);
        if (y >= P.t && y <= P.b) L.push({ k: "path", pts: [P.l, y, P.r, y], stroke: ink, width: 1.4 });
      }
    }
    if (hover && !drag) {
      const c = T.ink3;
      if (S.type !== "polar") {
        L.push({ k: "path", pts: [hover.cx, P.t, hover.cx, P.b], stroke: c, width: 1, dash: [2, 3] });
        if (S.type !== "xy" || hover.items.some((i) => i.kind === "scatter")) L.push({ k: "path", pts: [P.l, hover.py, P.r, hover.py], stroke: c, width: 1, dash: [2, 3] });
      }
      for (const it of hover.items) if (inPlot(it.px, it.py)) L.push({ k: "points", pts: [it.px, it.py], color: it.color, size: 8 }, { k: "points", pts: [it.px, it.py], color: T.bg, size: 3 });
      if (hover.cell) L.push({ k: "rect", ...hover.cell, stroke: col("ink"), width: 1.5 });
    }
    if (drag && (drag.mode === "box" || drag.mode === "brush")) {
      const x0 = Math.min(drag.x0, drag.x), y0 = Math.min(drag.y0, drag.y);
      const timeBrush = drag.mode === "brush" && (EA() === "x" || EA() === "y");
      const r = timeBrush && EA() === "x" ? { x: x0, y: P.t, w: Math.abs(drag.x - drag.x0), h: P.b - P.t }
        : timeBrush ? { x: P.l, y: y0, w: P.r - P.l, h: Math.abs(drag.y - drag.y0) } : { x: x0, y: y0, w: Math.abs(drag.x - drag.x0), h: Math.abs(drag.y - drag.y0) };
      const c = col(drag.mode === "box" ? "ink2" : "tim");
      L.push({ k: "rect", ...r, fill: withAlpha(c, 0.12), stroke: c, width: 1 });
    }
    paint(ctxO, L, { font: T.mono });
  }

  function schedule(baseToo = false) {
    if (baseToo) needBase = true;
    needOver = true;
    if (queued) return;
    queued = true;
    raf(() => {
      queued = false;
      if (!fig.isConnected) return;
      if (needBase) { needBase = false; drawBase(); }
      if (needOver) { needOver = false; drawOver(); }
      stats.frames++;
    });
  }

  // ---------------------------------------------------------------- readouts
  /** The readout item of a series point { sid, i } (or a grid cell { cell: [ix, iy] }). */
  function itemAt(ref) {
    if (ref.cell) {
      const g = S.grid, [ix, iy] = ref.cell, v = g.z[iy * g.nx + ix];
      const xa = sx.map(g.xe[ix]), xb = sx.map(g.xe[ix + 1]), ya = sy.map(g.ye[iy]), yb = sy.map(g.ye[iy + 1]);
      const xt = g.xLabels ? g.xLabels[ix] : fmtAxis(S.x, g.xs[ix]), yt = g.yLabels ? g.yLabels[iy] : fmtAxis(S.y, g.ys[iy]);
      return { kind: "cell", px: (xa + xb) / 2, py: (ya + yb) / 2, x: g.xs[ix], y: g.ys[iy], v, unit: g.unit, color: col("ink"), label: g.label,
        rect: { x: Math.min(xa, xb), y: Math.min(ya, yb), w: Math.abs(xb - xa), h: Math.abs(yb - ya) },
        rows: [[`${S.x.label || "x"}`, String(xt)], [`${S.y.label || "y"}`, String(yt)], [g.label, g.format ? g.format(v) : `${fmtValue(v)}${unitSp(g.unit)}`]],
        short: g.format ? g.format(v) : `${fmtValue(v, 4)}${unitSp(g.unit)}` };
    }
    if (S.type === "polar") {
      const tr = S.tracks.find((t) => t.id === ref.sid);
      if (!tr) return null;
      const i = ref.i;
      return { kind: "track", sid: tr.id, i, px: sx.map(tr.px[i]), py: sy.map(tr.py[i]), x: tr.t[i], y: tr.el[i], color: col(tr.color), label: tr.label,
        rows: [[tr.label, ""], ["azimuth", `${fmtValue(tr.az[i], 4)}°`], ["elevation", `${fmtValue(tr.el[i], 4)}°`], ["epoch", fmtClock(tr.t[i])], ...(tr.extra ? tr.extra(i) : [])],
        short: `${tr.short || tr.label} az ${fmtValue(tr.az[i], 3)}° el ${fmtValue(tr.el[i], 3)}°` };
    }
    const r = S.series.find((s) => s.id === ref.sid);
    if (!r || !(ref.i >= 0 && ref.i < r.n)) return null;
    const i = ref.i, ys = yScale(r);
    const yv = r.y[i];
    const rows = [[r.label, `${fmtValue(yv)}${unitSp(r.unit)}`]];
    if (r.lo && r.hi) rows.push([r.bandLabel || "band", `${fmtValue(r.lo[i])} – ${fmtValue(r.hi[i])}${unitSp(r.unit)}`]);
    if (r.t && r.t !== r.x) rows.push(["epoch", fmtClock(r.t[i])]);
    if (r.extra) rows.push(...r.extra(i));
    return { kind: r.kind, sid: r.id, i, px: sx.map(r.x[i]), py: ys.map(yv === yv ? yv : r.hi ? r.hi[i] : NaN), x: r.x[i], y: yv, unit: r.unit, color: col(r.color), label: r.label, rows,
      short: `${S.x.categories ? S.x.categories[Math.round(r.x[i])] : S.x.time ? fmtClock(r.x[i]) : fmtValue(r.x[i], 4)}, ${fmtValue(yv, 4)}${unitSp(r.unit)}` };
  }

  /** Readout items at a pixel: the nearest point of each line series at the cursor's x; the nearest scatter point; the bar or cell under the cursor. */
  function pick(px, py) {
    if (S.type === "heatmap" || S.type === "waterfall") {
      const c = gridCell(S.grid.xe, S.grid.ye, sx.inv(px), sy.inv(py));
      return c ? [itemAt({ cell: [c.ix, c.iy] })] : [];
    }
    if (S.type === "polar") {
      let best = null; const tn = now();
      for (const tr of S.tracks) {
        if (isHidden(tr)) continue;
        let i1 = tr.n; if (tn !== null) { i1 = 0; while (i1 < tr.n && tr.t[i1] <= tn) i1++; }
        const r = nearestPoint(tr.px, tr.py, (v) => sx.map(v), (v) => sy.map(v), px, py, 18, 0, i1);
        if (r && (!best || r.d < best.d)) best = { ...r, sid: tr.id };
      }
      return best ? [itemAt({ sid: best.sid, i: best.i })] : [];
    }
    const out = [];
    const xv = sx.inv(px);
    let sc = null;
    const bars = S.series.filter((r) => r.kind === "bar" && !isHidden(r));
    for (const r of S.series) {
      if (isHidden(r) || !r.x) continue;
      if (r.kind === "scatter") {
        const [i0, i1] = r.sorted ? visibleRange(r.x, Math.min(...view.x), Math.max(...view.x)) : [0, r.n];
        const ys = yScale(r);
        const hit = nearestPoint(r.x, r.y, (v) => sx.map(v), (v) => ys.map(v), px, py, 24, i0, i1);
        if (hit && (!sc || hit.d < sc.d)) sc = { ...hit, sid: r.id };
      } else if (r.kind === "bar") {
        const i = nearestValid(r.x, r.y, xv);
        if (i < 0) continue;
        const bw = Math.abs(sx.map(barSpacing(bars)) - sx.map(0)) * 0.5;
        if (Math.abs(sx.map(r.x[i]) - px) <= bw) out.push(itemAt({ sid: r.id, i }));
      } else {
        const i = r.sorted ? nearestValid(r.x, r.y, xv) : (nearestPoint(r.x, r.y, (v) => sx.map(v), (v) => yScale(r).map(v), px, py) || { i: -1 }).i;
        if (i >= 0 && r.x[i] >= Math.min(...view.x) && r.x[i] <= Math.max(...view.x)) out.push(itemAt({ sid: r.id, i }));
      }
    }
    // the series nearest the pointer first (it is the one a click pins or marks)
    const list = out.filter(Boolean).sort((a, b) => Math.abs(a.py - py) - Math.abs(b.py - py));
    if (sc) list.unshift(itemAt({ sid: sc.sid, i: sc.i }));
    return list.filter(Boolean);
  }

  function setHover(px, py, items) {
    if (!items.length) { hover = null; tip.hidden = true; schedule(); return; }
    const lead = items[0];
    const cx = items.some((i) => i.kind === "line" || i.kind === "step" || i.kind === "band" || i.kind === "area") ? lead.px : px;
    hover = { px, py, cx, items, cell: lead.rect || null };
    // tooltip
    tip.replaceChildren();
    if (S.type === "xy") tip.append(h("div", { class: "kc-tip-h", text: fmtAxis(S.x, lead.x) }));
    for (const it of items.slice(0, 8)) {
      it.rows.forEach(([k, v], r) => tip.append(h("div", { class: "kc-tip-r" }, h("i", { style: r ? "background:none" : `background:${it.color}` }), h("span", { text: k }), h("b", { text: v }))));
    }
    tip.hidden = false;
    const tw = tip.offsetWidth || 160, th = tip.offsetHeight || 60;
    let tx = px + 14, ty = py + 14;
    if (tx + tw > W - 4) tx = px - tw - 14;
    if (ty + th > H - 4) ty = py - th - 14;
    tip.style.transform = `translate(${Math.max(2, tx)}px,${Math.max(2, ty)}px)`;
    schedule();
  }
  function deltaText() {
    if (markers.length < 2) return markers.length === 1 ? (() => { const a = itemAt(markers[0]); return a ? `A  ${a.short}` : ""; })() : "";
    const a = itemAt(markers[0]), b = itemAt(markers[1]);
    if (!a || !b) return "";
    const dx = b.x - a.x, dy = b.y - a.y;
    const xu = S.x.time ? "s" : S.type === "polar" ? "s" : S.x.unit, yu = (S.type === "polar" ? "°" : a.unit) || "";
    const slope = dx ? dy / dx : NaN;
    const su = yu || xu ? `${yu || "1"}/${xu || "1"}` : "";
    return [`A ${a.short}`, `B ${b.short}`, `Δx ${S.x.time ? `${fmtClock(dx)} (${fmtValue(dx)} s)` : `${fmtValue(dx)}${unitSp(xu)}`}`, `Δy ${fmtValue(dy)}${unitSp(yu)}`, `slope ${fmtValue(slope, 4)}${unitSp(su)}`].join("\n");
  }
  function refOf(it) { return it.kind === "cell" ? { cell: [S.grid.xs.indexOf(it.x), S.grid.ys.indexOf(it.y)] } : { sid: it.sid, i: it.i }; }
  const sameRef = (a, b) => (a.cell ? b.cell && a.cell[0] === b.cell[0] && a.cell[1] === b.cell[1] : a.sid === b.sid && a.i === b.i);
  function togglePin(it) {
    const ref = refOf(it), k = pins.findIndex((p) => sameRef(p, ref));
    if (k >= 0) pins.splice(k, 1); else pins.push(ref);
    live.textContent = k >= 0 ? "Pin removed" : `Pinned ${it.label}: ${it.short}`;
    emit("pin", { pins: pins.slice() });
    schedule(true);
  }
  function addMarker(it) {
    if (markers.length >= 2) markers.shift();
    markers.push(refOf(it));
    const d = deltaText();
    live.textContent = d.replace(/\n/g, "; ");
    emit("markers", { markers: markers.map(itemAt), text: d });
    schedule(true);
  }

  // ---------------------------------------------------------------- view changes
  let group = null, leave = null, anim = 0;
  function setView(v, { animate = false, from = null } = {}) {
    let next = { x: sane(v.x, S.x.kind), y: sane(v.y, S.y.kind), y2: v.y2 && S.y2 ? sane(v.y2, S.y2.kind) : view.y2 };
    if (S.equal && P.r > P.l) next = equalAspect(next, P.r - P.l, P.b - P.t);
    const done = () => { if (S.linkX && group && from !== group) group.setX(view.x, member); emit("view", { view }); };
    if (animate && !reducedMotion()) {
      const a = view, t0 = performance.now(), my = ++anim, D = 160;
      const lerp = (p, q, f) => (p && q ? [p[0] + (q[0] - p[0]) * f, p[1] + (q[1] - p[1]) * f] : q);
      const step = () => {
        if (my !== anim) return;
        const f = Math.min(1, (performance.now() - t0) / D), e = 1 - (1 - f) ** 3;
        view = { x: lerp(a.x, next.x, e), y: lerp(a.y, next.y, e), y2: lerp(a.y2, next.y2, e) };
        scales(); drawBase(); drawOver();
        if (f < 1) raf(step); else { view = next; done(); schedule(true); }
      };
      raf(step);
      return;
    }
    view = next;
    scales();
    done();
    schedule(true);
  }
  function reset(animate = false) { home = homeView(S, hidden); setView(home, { animate }); }
  function zoomAt(px, py, f, axes = "xy") {
    const v = { ...view };
    if (axes.includes("x")) v.x = zoomDomain(view.x, sx.inv(px), f, S.x.kind);
    if (axes.includes("y")) { v.y = zoomDomain(view.y, sy.inv(py), f, S.y.kind); if (sy2) v.y2 = zoomDomain(view.y2, sy2.inv(py), f, S.y2.kind); }
    if (axes === "y2") v.y2 = zoomDomain(view.y2, sy2.inv(py), f, S.y2.kind);
    setView(v);
  }
  function panBy(dx, dy, axes = "xy") {
    const v = { ...view };
    if (axes.includes("x")) v.x = panDomain(view.x, dx, P.r - P.l, S.x.kind);
    const dir = S.y.flip ? 1 : -1;
    if (axes.includes("y")) { v.y = panDomain(view.y, dir * dy, P.b - P.t, S.y.kind); if (sy2) v.y2 = panDomain(view.y2, -dy, P.b - P.t, S.y2.kind); }
    setView(v);
  }
  const member = {
    onX(d) { if (!S.linkX) return; if (!d) { view = { ...view, x: homeView(S, hidden).x }; } else view = { ...view, x: [d[0], d[1]] }; scales(); schedule(true); emit("view", { view }); },
    onBrush(b) { brush = b; schedule(true); emit("brush", { brush }); },
  };
  function joinGroup(g) {
    if (leave) leave();
    group = g || null;
    leave = group ? group.join(member) : null;
    if (group && group.brush) brush = group.brush;
  }
  function publishBrush(b) {
    brush = b;
    if (group) group.setBrush(b ? (b.epochs ? { epochs: [...b.epochs] } : b.range) : null, member);
    else if (b) brush = b.epochs ? { range: b.range, epochs: b.epochs } : b;
    const c = clock();
    if (c && b && (EA() === "x" || EA() === "y") && typeof c.setRange === "function") c.setRange(b.range[0], b.range[1]);
    if (b) live.textContent = b.epochs ? `Selected ${b.epochs.size} epochs` : `Selected ${fmtClock(b.range[0])} to ${fmtClock(b.range[1])}`;
    emit("brush", { brush });
    schedule(true);
  }

  // ---------------------------------------------------------------- pointer, wheel, keys
  const local = (e) => { const r = over.getBoundingClientRect(); return [e.clientX - r.left, e.clientY - r.top]; };
  const nearCursor = (px, py) => {
    const tn = now();
    if (tn === null) return false;
    if (S.x.time) return Math.abs(sx.map(tn) - px) < 6;
    if (S.y.time) return Math.abs(sy.map(tn) - py) < 6;
    return false;
  };
  function scrubTo(px, py) {
    const c = clock(); if (!c || typeof c.set !== "function") return;
    const v = S.x.time ? sx.inv(px) : sy.inv(py);
    c.set(v);
  }
  over.addEventListener("pointerdown", (e) => {
    if (e.button !== 0) return;
    const [px, py] = local(e), z = zone(px, py);
    if (z === "none") return;
    over.setPointerCapture(e.pointerId);
    over.focus({ preventScroll: true });
    let mode = "pan";
    if (z === "x") mode = clock() && S.x.time && !e.altKey ? "scrub" : "axisX";
    else if (z === "y") mode = "axisY";
    else if (z === "y2") mode = "axisY2";
    else if (clock() && nearCursor(px, py)) mode = "scrub";
    else if (e.shiftKey) mode = "box";
    else if (e.ctrlKey || e.metaKey) mode = EA() ? "brush" : "box";
    else if (e.altKey || markMode) mode = "mark";
    drag = { mode, x0: px, y0: py, x: px, y: py, view, moved: false };
    if (mode === "scrub") scrubTo(px, py);
    hover = null; tip.hidden = true;
    schedule();
  });
  over.addEventListener("pointermove", (e) => {
    const [px, py] = local(e);
    if (!drag) {
      if (zone(px, py) === "plot") setHover(px, py, pick(px, py)); else if (hover) setHover(px, py, []);
      over.style.cursor = zone(px, py) === "x" ? (clock() && S.x.time ? "col-resize" : "ew-resize") : zone(px, py).startsWith("y") ? "ns-resize" : nearCursor(px, py) ? "col-resize" : "crosshair";
      return;
    }
    const dx = px - drag.x, dy = py - drag.y;
    if (Math.abs(px - drag.x0) + Math.abs(py - drag.y0) > 3) drag.moved = true;
    drag.x = px; drag.y = py;
    if (drag.mode === "pan" && drag.moved) panBy(dx, dy);
    else if (drag.mode === "axisX") zoomAt(drag.x0, drag.y0, Math.exp(-dx / 120), "x");
    else if (drag.mode === "axisY") zoomAt(drag.x0, drag.y0, Math.exp(dy / 120), "y");
    else if (drag.mode === "axisY2") zoomAt(drag.x0, drag.y0, Math.exp(dy / 120), "y2");
    else if (drag.mode === "scrub") scrubTo(px, py);
    else schedule();
  });
  const finish = (e) => {
    if (!drag) return;
    const d = drag; drag = null;
    const [px, py] = local(e);
    if (d.mode === "box" && Math.abs(px - d.x0) > 4 && Math.abs(py - d.y0) > 4) {
      const xs = boxDomain(sx, d.x0, px), ys = boxDomain(sy, d.y0, py);
      setView({ x: xs, y: ys, y2: sy2 ? boxDomain(sy2, d.y0, py) : null }, { animate: true });
    } else if (d.mode === "brush") {
      if (Math.abs(px - d.x0) < 3 && Math.abs(py - d.y0) < 3) publishBrush(null);
      else if (EA() === "x") publishBrush({ range: boxDomain(sx, d.x0, px), epochs: null });
      else if (EA() === "y") publishBrush({ range: boxDomain(sy, d.y0, py), epochs: null });
      else publishBrush(epochsInBox(d.x0, d.y0, px, py));
    } else if ((d.mode === "pan" || d.mode === "mark") && !d.moved) {
      const items = pick(px, py);
      if (items.length) { if (d.mode === "mark") addMarker(items[0]); else togglePin(items[0]); }
    }
    if (zone(px, py) === "plot") setHover(px, py, pick(px, py));
    schedule(true);
  };
  over.addEventListener("pointerup", finish);
  over.addEventListener("lostpointercapture", (e) => { if (drag) finish(e); });
  over.addEventListener("pointercancel", () => { drag = null; schedule(); });
  over.addEventListener("pointerleave", () => { if (!drag) { hover = null; tip.hidden = true; schedule(); } });
  over.addEventListener("dblclick", () => reset(true));
  over.addEventListener("wheel", (e) => {
    const [px, py] = local(e), z = zone(px, py);
    if (z === "none") return;
    e.preventDefault();
    const dy = e.deltaMode === 1 ? e.deltaY * 16 : e.deltaY;
    const f = Math.exp(Math.max(-0.5, Math.min(0.5, dy * 0.0015)));
    zoomAt(px, py, f, z === "plot" ? "xy" : z === "x" ? "x" : z === "y" ? "y" : "y2");
    if (z === "plot") setHover(px, py, pick(px, py));
  }, { passive: false });

  function epochsInBox(x0, y0, x1, y1) {
    const a = Math.min(x0, x1), b = Math.max(x0, x1), c = Math.min(y0, y1), d = Math.max(y0, y1);
    const ep = [];
    if (S.type === "polar") {
      for (const tr of S.tracks) if (!isHidden(tr)) for (let i = 0; i < tr.n; i++) { const X = sx.map(tr.px[i]), Y = sy.map(tr.py[i]); if (X >= a && X <= b && Y >= c && Y <= d) ep.push(tr.t[i]); }
    } else {
      for (const r of S.series) {
        if (isHidden(r) || !r.t) continue;
        const ys = yScale(r);
        for (let i = 0; i < r.n; i++) { const X = sx.map(r.x[i]), Y = ys.map(r.y[i]); if (X >= a && X <= b && Y >= c && Y <= d) ep.push(r.t[i]); }
      }
    }
    if (!ep.length) return null;
    return { range: [Math.min(...ep), Math.max(...ep)], epochs: new Set(ep) };
  }

  // keyboard cursor through the points of the first visible series (or the cells, or a track)
  function kbStep(d) {
    let items = null;
    if (S.type === "heatmap" || S.type === "waterfall") {
      const g = S.grid, n = g.nx * g.ny;
      kb = kb < 0 ? 0 : Math.max(0, Math.min(n - 1, kb + d));
      items = [itemAt({ cell: [kb % g.nx, Math.floor(kb / g.nx)] })];
    } else if (S.type === "polar") {
      const tr = S.tracks.find((t) => !isHidden(t));
      if (!tr) return;
      kb = kb < 0 ? 0 : Math.max(0, Math.min(tr.n - 1, kb + d));
      items = [itemAt({ sid: tr.id, i: kb })];
    } else {
      const r = S.series.find((s) => !isHidden(s) && s.n);
      if (!r) return;
      if (kb < 0) { const [i0] = r.sorted ? visibleRange(r.x, Math.min(...view.x), Math.max(...view.x)) : [0]; kb = Math.min(r.n - 1, i0 + 1); }
      else kb = Math.max(0, Math.min(r.n - 1, kb + d));
      items = r.kind === "scatter" ? [itemAt({ sid: r.id, i: kb })] : pick(sx.map(r.x[kb]), yScale(r).map(r.y[kb]));
      if (!items.length) items = [itemAt({ sid: r.id, i: kb })];
      const x = r.x[kb];
      if (x < Math.min(...view.x) || x > Math.max(...view.x)) { const w = view.x[1] - view.x[0]; setView({ ...view, x: [x - w / 2, x + w / 2] }); }
    }
    const it = items[0];
    if (!it) return;
    setHover(it.px, it.py, items);
    live.textContent = items.map((i) => i.rows.map((r) => r.join(" ")).join(", ")).join("; ");
  }
  over.addEventListener("keydown", (e) => {
    const cx = (P.l + P.r) / 2, cy = (P.t + P.b) / 2;
    const k = e.key;
    let used = true;
    if (k === "+" || k === "=") zoomAt(hover ? hover.px : cx, hover ? hover.py : cy, 0.8);
    else if (k === "-" || k === "_") zoomAt(hover ? hover.px : cx, hover ? hover.py : cy, 1.25);
    else if (k === "0" || k === "Home") reset(true);
    else if (k === "ArrowLeft") panBy(e.shiftKey ? 0 : (P.r - P.l) * 0.1, 0, "x");
    else if (k === "ArrowRight") panBy(-(P.r - P.l) * 0.1, 0, "x");
    else if (k === "ArrowUp") panBy(0, (P.b - P.t) * 0.1, "y");
    else if (k === "ArrowDown") panBy(0, -(P.b - P.t) * 0.1, "y");
    else if (k === "," || k === "<") kbStep(e.shiftKey ? -10 : -1);
    else if (k === "." || k === ">") kbStep(e.shiftKey ? 10 : 1);
    else if (k === "Enter" && hover && hover.items[0]) togglePin(hover.items[0]);
    else if ((k === "m" || k === "M") && hover && hover.items[0]) addMarker(hover.items[0]);
    else if (k === "t" || k === "T") { details.open = !details.open; if (details.open) details.querySelector("summary").focus(); }
    else if (k === "Escape") { pins.length = 0; markers.length = 0; if (brush) publishBrush(null); live.textContent = "Pins, markers and selection cleared"; schedule(true); }
    else used = false;
    if (used) e.preventDefault();
  });
  over.addEventListener("focus", () => { if (!hover) live.textContent = ariaText(); });

  // ---------------------------------------------------------------- legend, table, text
  function legendKeys() {
    if (S.type === "polar") {
      const seen = new Map();
      for (const tr of S.tracks) { const k = tr.group || tr.id; if (!seen.has(k)) seen.set(k, { id: k, label: tr.groupLabel || tr.group || tr.label, color: tr.color }); }
      return [...seen.values()];
    }
    if (S.type !== "xy") return [];
    return S.series.filter((r) => r.legend !== false).map((r) => ({ id: r.id, label: r.legend || r.label, color: r.color }));
  }
  function drawLegend() {
    T = T || themeOf(fig);
    const keys = legendKeys();
    legend.hidden = keys.length < 1 || S.legend === false;
    legend.replaceChildren(...keys.map((k) => h("button", { type: "button", class: "kc-key", "aria-pressed": String(!hidden.has(k.id)), title: "Show or hide (Shift: only this one)",
      onclick: (e) => {
        if (e.shiftKey) { const solo = keys.every((o) => o.id === k.id || hidden.has(o.id)) && !hidden.has(k.id); hidden.clear(); if (!solo) keys.forEach((o) => o.id !== k.id && hidden.add(o.id)); }
        else if (hidden.has(k.id)) hidden.delete(k.id); else hidden.add(k.id);
        drawLegend(); emit("legend", { hidden: [...hidden] }); schedule(true);
      } }, h("i", { style: `background:${resolveColour(k.color, T, fig)}` }), h("span", { text: k.label }))));
  }
  function fillTable() {
    const LIMIT = 500;
    const { header, rows } = visibleRows(S, view, hidden, LIMIT + 1);
    const fmt = (v) => (typeof v === "number" ? fmtValue(v, 7) : String(v ?? ""));
    tableBox.replaceChildren(
      h("p", { class: "kc-note", text: rows.length > LIMIT ? `The first ${LIMIT} rows of the visible data; CSV saves them all.` : `${rows.length} rows of visible data.` }),
      h("table", {}, h("thead", {}, h("tr", {}, ...header.map((c) => h("th", { scope: "col", text: c })))),
        h("tbody", {}, ...rows.slice(0, LIMIT).map((r) => h("tr", {}, ...r.map((v) => h("td", { text: fmt(v) })))))));
  }
  details.addEventListener("toggle", () => { if (details.open) fillTable(); });
  function ariaText() {
    const n = S.type === "polar" ? S.tracks.length : S.type === "xy" ? S.series.length : S.grid.nx * S.grid.ny;
    const what = S.type === "polar" ? `${n} tracks` : S.type === "xy" ? `${n} series` : `${S.grid.nx} by ${S.grid.ny} cells`;
    const xr = S.type === "polar" ? "" : ` ${S.x.label || "x"} from ${fmtAxis(S.x, view.x[0])} to ${fmtAxis(S.x, view.x[1])}.`;
    return `${S.ariaLabel || S.title}. ${TYPE_NAME[S.type]}, ${what}.${xr} Keys: arrows pan, plus and minus zoom, 0 full view, comma and full stop step through points, Enter pins, M places a marker, T opens the data table, Escape clears.`;
  }

  // ---------------------------------------------------------------- clock
  let unsub = null;
  function attachClock(c) {
    if (unsub) { try { unsub(); } catch { /* the clock's own */ } unsub = null; }
    if (!c || typeof c.subscribe !== "function") return;
    const r = c.subscribe(() => schedule(S.type === "polar"));
    unsub = typeof r === "function" ? r : r && typeof r.unsubscribe === "function" ? () => r.unsubscribe() : null;
  }

  // ---------------------------------------------------------------- public API
  const ro = typeof ResizeObserver === "function" ? new ResizeObserver(() => schedule(true)) : null;
  if (ro) ro.observe(stage);
  joinGroup(S.link);
  attachClock(S.clock);
  drawLegend();
  schedule(true);

  const api = {
    el: fig, canvas: over, stats,
    get spec() { return S; },
    get view() { return { x: [...view.x], y: [...view.y], y2: view.y2 ? [...view.y2] : null }; },
    get plot() { return { ...P }; },
    get brush() { return brush; },
    get pins() { return pins.map(itemAt).filter(Boolean); },
    get markers() { return markers.map(itemAt).filter(Boolean); },
    get delta() { return deltaText(); },
    /** The pointer gesture in progress ("pan", "box", "brush", …) or null. */
    get dragging() { return drag ? drag.mode : null; },
    get hidden() { return [...hidden]; },
    /** Replace the data and options (keeps the view unless keepView is false; then fits). */
    update(next, { keepView = true } = {}) {
      const linkWas = S.link, clockWas = S.clock;
      S = normalise({ ...spec0, ...next });
      spec0 = { ...spec0, ...next };
      img = null;
      titleEl.textContent = S.title; subEl.textContent = S.subtitle || "";
      if (S.link !== linkWas) joinGroup(S.link);
      if (S.clock !== clockWas) attachClock(S.clock);
      home = homeView(S, hidden);
      if (!keepView) view = home;
      drawLegend(); schedule(true);
    },
    setView: (v, o) => setView({ ...view, ...v }, o || {}),
    reset: () => reset(false),
    zoomAt, panBy,
    /** Readout items at a pixel (as hover shows them). */
    pick: (px, py) => { layout(); return pick(px, py); },
    hoverAt(px, py) { layout(); setHover(px, py, pick(px, py)); },
    pinAt(px, py) { layout(); const it = pick(px, py)[0]; if (it) togglePin(it); return it || null; },
    markAt(px, py) { layout(); const it = pick(px, py)[0]; if (it) addMarker(it); return it || null; },
    brushRange(a, b) { publishBrush(a === null ? null : { range: [Math.min(a, b), Math.max(a, b)], epochs: null }); },
    brushBox(x0, y0, x1, y1) { layout(); publishBrush(epochsInBox(x0, y0, x1, y1)); },
    clear() { pins.length = 0; markers.length = 0; brush = null; schedule(true); },
    toggle(id, on) { if (on === undefined ? !hidden.has(id) : !on) hidden.add(id); else hidden.delete(id); drawLegend(); schedule(true); },
    link: (g) => joinGroup(g),
    setClock(c) { S.clock = c; spec0 = { ...spec0, clock: c }; attachClock(c); schedule(true); },
    on(ev, fn) { (listeners[ev] ||= []).push(fn); return () => { listeners[ev] = listeners[ev].filter((f) => f !== fn); }; },
    /** The visible data as CSV (units in the header). */
    toCSV() { const { header, rows } = visibleRows(S, view, hidden); return toCSV(header, rows); },
    /** The chart as a standalone SVG document (vectors; the waterfall as an embedded image). */
    toSVG() {
      layout();
      const list = buildList(true);
      return svgOf(list, W, H, { bg: T.bg, title: S.title, font: T.mono });
    },
    /** The chart as a PNG (twice the CSS size), with its title. */
    toPNG() {
      layout();
      const k = 2, c = document.createElement("canvas"); c.width = W * k; c.height = H * k;
      const x = c.getContext("2d"); x.scale(k, k); x.fillStyle = T.bg; x.fillRect(0, 0, W, H);
      const list = buildList(true);
      for (const p of list) if (p.k === "image" && (p.flipX || p.flipY)) p.src = flipCanvas(p.src, p.flipX, p.flipY);
      paint(x, list, { font: T.mono });
      return new Promise((res) => (c.toBlob ? c.toBlob(res, "image/png") : res(null)));
    },
    /** Draw now (for frame-timing measurements). */
    drawNow() { drawBase(); drawOver(); stats.frames++; },
    destroy() { if (ro) ro.disconnect(); if (leave) leave(); attachClock(null); fig.remove(); },
  };
  return api;
}
