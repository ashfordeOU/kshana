// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): the chart model. Pure, no DOM; tested in chart.test.mjs.
// normalise() turns a chart spec into typed arrays and defaults; homeView() is the full view a
// double-click returns to; visibleRows() is the visible data, as the CSV export and the
// accessible data table give it.
import { extent, sane } from "./scale.mjs";
import { isSorted } from "./decimate.mjs";
import { edgesOf, skyToXY } from "./hit.mjs";
import { colName } from "./export.mjs";
import { SERIES } from "./colour.mjs";

export const TYPES = ["xy", "heatmap", "waterfall", "polar"];
const f64 = (a) => (a instanceof Float64Array ? a : a ? Float64Array.from(a, (v) => (v === null || v === undefined ? NaN : +v)) : null);
const axisOf = (a = {}) => ({ label: a.label || "", unit: a.unit || "", kind: a.kind === "log" ? "log" : "linear", time: !!a.time, domain: a.domain || null, categories: a.categories || null, flip: !!a.flip, format: typeof a.format === "function" ? a.format : null });

/** The spec with typed arrays, ids, colours and axes filled in. */
export function normalise(spec = {}) {
  const type = TYPES.includes(spec.type) ? spec.type : "xy";
  const s = { ...spec, type, title: spec.title || "", x: axisOf(spec.x), y: axisOf(spec.y), y2: spec.y2 ? axisOf(spec.y2) : null, overlays: spec.overlays || [] };
  if (type === "polar") { s.x = { ...axisOf(), label: "east", kind: "linear" }; s.y = { ...axisOf(), label: "north", kind: "linear" }; s.equal = true; }
  s.series = (spec.series || []).map((r, i) => {
    const x = f64(r.x), y = f64(r.y);
    const ax = r.axis === "y2" && s.y2 ? s.y2 : s.y;
    if (ax.kind === "log" && y) for (let k = 0; k < y.length; k++) if (!(y[k] > 0)) y[k] = NaN;
    const kind = ["line", "scatter", "bar", "step", "band", "area"].includes(r.kind) ? r.kind : "line";
    return {
      ...r, id: r.id || `s${i}`, label: r.label || r.id || `series ${i + 1}`, kind, unit: r.unit ?? ax.unit, axis: r.axis === "y2" && s.y2 ? "y2" : "y",
      color: r.color || SERIES[i % SERIES.length], x, y, lo: f64(r.lo), hi: f64(r.hi), t: f64(r.t) || (s.x.time ? x : null),
      sorted: x ? isSorted(x) : true, n: x ? x.length : 0,
    };
  });
  if (type === "heatmap" || type === "waterfall") {
    const g = spec.grid || {};
    const nx = g.x.length, ny = g.y.length;
    const z = new Float64Array(nx * ny);
    if (Array.isArray(g.z) && Array.isArray(g.z[0])) { for (let j = 0; j < ny; j++) for (let i = 0; i < nx; i++) z[j * nx + i] = g.z[j][i] ?? NaN; }
    else z.set(f64(g.z));
    const xe = g.xEdges || edgesOf(Array.from(g.x, Number)), ye = g.yEdges || edgesOf(Array.from(g.y, Number));
    const zd = g.zDomain || extent([z], 0, g.log ? "log" : "linear");
    s.grid = { ...g, nx, ny, z, xs: f64(g.x), ys: f64(g.y), xe, ye, zDomain: zd, map: g.map || (type === "waterfall" ? "night" : "viridis"), unit: g.unit || "", label: g.label || "value" };
    if (s.y.time && !s.grid.t) s.grid.t = s.grid.ys;
  }
  if (type === "polar") {
    s.tracks = (spec.tracks || []).map((tr, i) => {
      const az = f64(tr.az), el = f64(tr.el), n = az.length;
      const px = new Float64Array(n), py = new Float64Array(n);
      for (let k = 0; k < n; k++) { const [a, b] = skyToXY(az[k], el[k]); px[k] = el[k] < 0 ? NaN : a; py[k] = el[k] < 0 ? NaN : b; }
      return { ...tr, id: tr.id || `t${i}`, label: tr.label || tr.id || `track ${i + 1}`, color: tr.color || SERIES[i % SERIES.length], az, el, t: f64(tr.t) || new Float64Array(n).map((_, k) => k), px, py, n };
    });
    s.rings = spec.rings || [0, 30, 60];
    s.mask = spec.mask ?? null;
  }
  return s;
}

/** The full view of a normalised spec: { x, y, y2 } domains. */
export function homeView(s, hidden = new Set()) {
  if (s.type === "polar") return { x: [-1.2, 1.2], y: [-1.2, 1.2], y2: null };
  if (s.type === "heatmap" || s.type === "waterfall") {
    const g = s.grid;
    const xd = sane([Math.min(g.xe[0], g.xe[g.nx]), Math.max(g.xe[0], g.xe[g.nx])]);
    const yd = sane([Math.min(g.ye[0], g.ye[g.ny]), Math.max(g.ye[0], g.ye[g.ny])]);
    return { x: s.x.domain || xd, y: s.y.domain || yd, y2: null };
  }
  const vis = s.series.filter((r) => !hidden.has(r.id));
  const use = vis.length ? vis : s.series;
  const xs = use.map((r) => r.x);
  let x;
  if (s.x.domain) x = s.x.domain;
  else if (use.some((r) => r.kind === "bar")) { const e = extent(xs, 0, s.x.kind); const pad = barSpacing(use) * 0.6; x = [e[0] - pad, e[1] + pad]; }
  else x = extent(xs, use.some((r) => r.kind === "scatter") ? 0.04 : 0, s.x.kind);
  const yOf = (axis, ax) => {
    const rs = use.filter((r) => r.axis === axis);
    if (!rs.length) return null;
    if (ax.domain) return ax.domain;
    const arrays = rs.flatMap((r) => [r.y, r.lo, r.hi]);
    for (const o of s.overlays) if ((o.axis || "y") === axis && o.kind === "hline" && o.fit !== false) arrays.push([o.y]);
    const d = extent(arrays, 0.06, ax.kind);
    if (rs.some((r) => r.kind === "bar") && ax.kind !== "log") { d[0] = Math.min(0, d[0]); d[1] = Math.max(0, d[1]); }
    return d;
  };
  return { x, y: yOf("y", s.y) || [0, 1], y2: s.y2 ? yOf("y2", s.y2) : null };
}

/** The smallest spacing between bar positions (1 when there is one bar). */
export function barSpacing(series) {
  let best = Infinity;
  for (const r of series) {
    if (r.kind !== "bar" || !r.x) continue;
    for (let i = 1; i < r.n; i++) { const d = Math.abs(r.x[i] - r.x[i - 1]); if (d > 0 && d < best) best = d; }
  }
  return Number.isFinite(best) ? best : 1;
}

const inside = (v, [a, b]) => v >= Math.min(a, b) && v <= Math.max(a, b);

/**
 * The visible data as rows for the CSV export and the data table: { header, rows }.
 * xy: one row per visible point (series, x, y, band low/high, epoch); scatter points must
 * also be inside the y window. heatmap/waterfall: one row per visible cell. polar: one row
 * per track point. `limit` caps the rows (the table shows a part; the CSV takes them all).
 */
export function visibleRows(s, view, hidden = new Set(), limit = Infinity) {
  const rows = [];
  const fmtX = s.x.categories ? (v) => s.x.categories[Math.round(v)] ?? v : (v) => v;
  if (s.type === "xy") {
    const anyBand = s.series.some((r) => r.lo || r.hi), anyT = s.series.some((r) => r.t && r.t !== r.x);
    const header = ["series", colName(s.x.label || "x", s.x.unit), s.y.label || "y", "unit"];
    if (anyBand) header.push("low", "high");
    if (anyT) header.push("epoch");
    for (const r of s.series) {
      if (hidden.has(r.id)) continue;
      const yv = r.axis === "y2" ? view.y2 : view.y;
      for (let i = 0; i < r.n && rows.length < limit; i++) {
        const x = r.x[i], y = r.y[i];
        if (!inside(x, view.x)) continue;
        if (r.kind === "scatter" && !inside(y, yv)) continue;
        const row = [r.label, fmtX(x), y, r.unit || ""];
        if (anyBand) row.push(r.lo ? r.lo[i] : "", r.hi ? r.hi[i] : "");
        if (anyT) row.push(r.t && r.t !== r.x ? r.t[i] : "");
        rows.push(row);
      }
    }
    return { header, rows };
  }
  if (s.type === "heatmap" || s.type === "waterfall") {
    const g = s.grid;
    const header = [colName(s.x.label || "x", s.x.unit), colName(s.y.label || "y", s.y.unit), colName(g.label, g.unit)];
    for (let j = 0; j < g.ny && rows.length < limit; j++) {
      const y = g.ys[j];
      if (!(inside(y, view.y) || inside(g.ye[j], view.y) || inside(g.ye[j + 1], view.y))) continue;
      for (let i = 0; i < g.nx && rows.length < limit; i++) {
        const x = g.xs[i];
        if (!(inside(x, view.x) || inside(g.xe[i], view.x) || inside(g.xe[i + 1], view.x))) continue;
        rows.push([g.xLabels ? g.xLabels[i] : x, g.yLabels ? g.yLabels[j] : y, g.z[j * g.nx + i]]);
      }
    }
    return { header, rows };
  }
  const header = ["track", "epoch", "azimuth [deg]", "elevation [deg]"];
  for (const tr of s.tracks) {
    if (hidden.has(tr.id)) continue;
    for (let i = 0; i < tr.n && rows.length < limit; i++) {
      if (!(inside(tr.px[i], view.x) && inside(tr.py[i], view.y))) continue;
      rows.push([tr.label, tr.t[i], tr.az[i], tr.el[i]]);
    }
  }
  return { header, rows };
}

/** The epochs carried by a normalised spec, for brushing: "x" (time series), "y" (waterfall rows), "points" (series or tracks with epochs) or null. */
export function epochAxis(s) {
  if (s.type === "xy") return s.x.time ? "x" : s.series.some((r) => r.t) ? "points" : null;
  if (s.type === "heatmap" || s.type === "waterfall") return s.y.time ? "y" : s.x.time ? "x" : null;
  if (s.type === "polar") return "points";
  return null;
}

/** Keep a view's x and y spans in the plot's aspect (for equal-axis charts: sky plots). */
export function equalAspect(view, pw, ph) {
  const cx = (view.x[0] + view.x[1]) / 2, cy = (view.y[0] + view.y[1]) / 2;
  const sx = (view.x[1] - view.x[0]) / pw, sy = (view.y[1] - view.y[0]) / ph;
  const k = Math.max(sx, sy);
  return { ...view, x: [cx - (k * pw) / 2, cx + (k * pw) / 2], y: [cy - (k * ph) / 2, cy + (k * ph) / 2] };
}
