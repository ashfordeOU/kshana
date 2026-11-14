// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): tests of the pure parts of the chart library: decimation,
// zoom and pan maths, hit-testing, CSV and SVG export, the chart model, linking, the 3D maths
// and the presets. Run: node apps/desktop/shell/lib/chart/chart.test.mjs
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { scale, zoomDomain, panDomain, boxDomain, sane, extent, niceTicks, logTicks, timeTicks, fmtTick, fmtValue, fmtClock } from "./scale.mjs";
import { lowerBound, visibleRange, isSorted, m4, dedupePoints } from "./decimate.mjs";
import { nearestX, nearestValid, nearestPoint, gridCell, edgesOf, skyToXY, xyToSky, inPolygon, stanfordRegion, inRange } from "./hit.mjs";
import { csvField, toCSV, colName, svgOf } from "./export.mjs";
import { normalise, homeView, visibleRows, epochAxis, equalAspect, barSpacing } from "./data.mjs";
import { createLinkGroup, brushOf, brushHas } from "./link.mjs";
import * as M from "./mat3d.mjs";
import { stanford, loglog, interp, heatmap, waterfall, sky } from "./presets.mjs";
import { rampRGB, norm, parseColour, withAlpha, themeOf, resolveColour, inkOn } from "./colour.mjs";
import { seriesSpec } from "./shell-view.mjs";

let n = 0;
const test = (name, fn) => { try { fn(); n++; } catch (e) { console.error(`FAIL ${name}`); throw e; } };
const close = (a, b, tol = 1e-9, msg = "") => assert.ok(Math.abs(a - b) <= tol * Math.max(1, Math.abs(a), Math.abs(b)), `${msg} ${a} vs ${b}`);
// a seeded generator, so a failure repeats
let seed = 12345;
const rnd = () => ((seed = (seed * 1103515245 + 12345) & 0x7fffffff) / 0x7fffffff);

// ---------------------------------------------------------------- scales, zoom, pan
test("linear and log scales map and invert", () => {
  const s = scale("linear", 10, 20, 100, 300);
  close(s.map(15), 200); close(s.inv(250), 17.5);
  const l = scale("log", 1, 1000, 0, 300);
  close(l.map(10), 100); close(l.map(100), 200); close(l.inv(150), 10 ** 1.5);
  const flip = scale("linear", 0, 10, 200, 0); // y axes run upward
  close(flip.map(10), 0); close(flip.inv(50), 7.5);
});
test("zoom about a point keeps that point fixed (linear and log)", () => {
  for (const [kind, d, at] of [["linear", [0, 100], 30], ["log", [1, 1e6], 1000]]) {
    const before = scale(kind, d[0], d[1], 0, 500);
    const px = before.map(at);
    for (const f of [0.5, 0.8, 1.25, 3]) {
      const z = zoomDomain(d, at, f, kind);
      const after = scale(kind, z[0], z[1], 0, 500);
      close(after.map(at), px, 1e-9, `${kind} f=${f}`);
      const span = kind === "log" ? Math.log10(z[1] / z[0]) / Math.log10(d[1] / d[0]) : (z[1] - z[0]) / (d[1] - d[0]);
      close(span, f, 1e-9, "span scales by the factor");
    }
  }
});
test("pan moves the data with the pointer by exactly the dragged pixels", () => {
  const d = [0, 100], s = scale("linear", 0, 100, 0, 400);
  const p = panDomain(d, 40, 400);
  const s2 = scale("linear", p[0], p[1], 0, 400);
  close(s2.map(50), s.map(50) + 40);
  const lg = panDomain([1, 1000], -100, 300, "log");
  close(Math.log10(lg[1] / lg[0]), 3, 1e-12, "a log pan keeps the decades");
  close(lg[0], 10);
});
test("box zoom orders the domain; sane() fixes flat and invalid domains", () => {
  const s = scale("linear", 0, 10, 300, 0);
  assert.deepEqual(boxDomain(s, 270, 30).map((v) => +v.toFixed(9)), [1, 9]);
  assert.deepEqual(sane([5, 5]), [4.75, 5.25]);
  assert.deepEqual(sane([NaN, 1]), [0, 1]);
  assert.deepEqual(sane([3, 1]), [1, 3]);
  const lg = sane([-1, 100], "log"); assert.ok(lg[0] > 0 && lg[1] === 100);
  assert.deepEqual(extent([[3, NaN, -2], [7]], 0), [-2, 7]);
  assert.deepEqual(extent([[0, 10, 100]], 0, "log"), [10, 100], "log extent ignores non-positive values");
});
test("ticks: nice steps, decades, clock steps", () => {
  const t = niceTicks(0, 97, 5);
  assert.equal(t.step, 20); assert.deepEqual(t.ticks, [0, 20, 40, 60, 80]);
  assert.deepEqual(niceTicks(-0.3, 0.3, 6).ticks.map((v) => +v.toFixed(3)), [-0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3]);
  assert.deepEqual(logTicks(1, 1e4).ticks, [1, 10, 100, 1000, 10000]);
  assert.ok(logTicks(1, 50).ticks.includes(2) && logTicks(1, 50).ticks.includes(5), "few decades get 2 and 5");
  const tt = timeTicks(0, 7200, 6); assert.equal(tt.step, 1800); assert.deepEqual(tt.ticks, [0, 1800, 3600, 5400, 7200]);
  assert.equal(fmtClock(3725), "1:02:05"); assert.equal(fmtClock(65), "1:05"); assert.equal(fmtClock(-30), "−0:30");
  assert.equal(fmtTick(1e-6, 0, "log"), "10⁻⁶"); assert.equal(fmtTick(100, 0, "log"), "100"); assert.equal(fmtTick(0.25, 0.05), "0.25");
  assert.equal(fmtValue(1234.5678), "1234.6"); assert.equal(fmtValue(3.1e-16), "3.1e−16"); assert.equal(fmtValue(-2.5), "−2.5"); assert.equal(fmtValue(NaN), "–");
});

// ---------------------------------------------------------------- decimation
test("binary searches and the visible range", () => {
  const xs = Float64Array.from({ length: 100 }, (_, i) => i * 2);
  assert.equal(lowerBound(xs, 51), 26); assert.equal(lowerBound(xs, -5), 0); assert.equal(lowerBound(xs, 1e9), 100);
  const [i0, i1] = visibleRange(xs, 10, 20);
  assert.equal(xs[i0], 8, "one point before the window"); assert.equal(xs[i1 - 1], 22, "one point after the window");
  assert.deepEqual(visibleRange(new Float64Array(0), 0, 1), [0, 0]);
  assert.ok(isSorted(xs)); assert.ok(!isSorted(Float64Array.from([1, 3, 2])));
});
test("M4 keeps each pixel column's first, min, max and last point (1,000,000 points)", () => {
  const N = 1_000_000, xs = new Float64Array(N), ys = new Float64Array(N);
  for (let i = 0; i < N; i++) { xs[i] = i * 0.001; ys[i] = Math.sin(i / 5000) * 10 + (rnd() - 0.5) * 3 + (i % 99991 === 0 ? 40 : 0); }
  const W = 800, s = scale("linear", 0, xs[N - 1], 0, W);
  const t0 = performance.now();
  const idx = m4(xs, ys, 0, N, (v) => s.map(v));
  const ms = performance.now() - t0;
  assert.ok(idx.length <= 4 * (W + 1), `at most 4 points per column (${idx.length})`);
  for (let k = 1; k < idx.length; k++) assert.ok(idx[k] > idx[k - 1], "indices in drawing order");
  // the true per-column extremes
  const lo = new Float64Array(W + 1).fill(Infinity), hi = new Float64Array(W + 1).fill(-Infinity), first = new Int32Array(W + 1).fill(-1), last = new Int32Array(W + 1).fill(-1);
  for (let i = 0; i < N; i++) { const c = Math.floor(s.map(xs[i])); lo[c] = Math.min(lo[c], ys[i]); hi[c] = Math.max(hi[c], ys[i]); if (first[c] < 0) first[c] = i; last[c] = i; }
  const dlo = new Float64Array(W + 1).fill(Infinity), dhi = new Float64Array(W + 1).fill(-Infinity), kept = new Set(idx);
  for (const i of idx) { const c = Math.floor(s.map(xs[i])); dlo[c] = Math.min(dlo[c], ys[i]); dhi[c] = Math.max(dhi[c], ys[i]); }
  for (let c = 0; c <= W; c++) {
    if (first[c] < 0) continue;
    assert.equal(dlo[c], lo[c], `column ${c} min`); assert.equal(dhi[c], hi[c], `column ${c} max`);
    assert.ok(kept.has(first[c]) && kept.has(last[c]), `column ${c} keeps its first and last point`);
  }
  assert.ok(ms < 400, `decimating a million points takes ${ms.toFixed(0)} ms`);
});
test("M4 breaks the line at NaN and handles a part of the series", () => {
  const xs = Float64Array.from({ length: 20 }, (_, i) => i), ys = Float64Array.from({ length: 20 }, (_, i) => (i === 10 ? NaN : i));
  const idx = Array.from(m4(xs, ys, 0, 20, (v) => v));
  assert.ok(idx.includes(-1), "a gap marker"); assert.ok(!idx.includes(10));
  assert.deepEqual(idx.filter((i) => i >= 0), [...Array(20).keys()].filter((i) => i !== 10), "one point per column at one pixel per point");
  assert.deepEqual(Array.from(m4(xs, ys, 3, 6, (v) => v * 0.1)), [3, 5], "a rising run in one column keeps its ends (they are its min and max)");
});
test("scatter dedupe keeps one point per pixel cell inside the frame", () => {
  const N = 100000, xs = new Float64Array(N), ys = new Float64Array(N);
  for (let i = 0; i < N; i++) { xs[i] = rnd() * 120 - 10; ys[i] = rnd() * 100; }
  const keep = dedupePoints(xs, ys, 0, N, (v) => v, (v) => v, 100, 50, 1);
  assert.ok(keep.length <= 100 * 50);
  const cells = new Set(keep.map((i) => `${Math.floor(xs[i])},${Math.floor(ys[i])}`));
  assert.equal(cells.size, keep.length, "no two kept points share a cell");
  assert.ok(keep.every((i) => xs[i] >= 0 && xs[i] < 100 && ys[i] < 50));
});

// ---------------------------------------------------------------- hit-testing
test("nearest point by x, skipping gaps", () => {
  const xs = Float64Array.from([0, 1, 2, 3, 4]), ys = Float64Array.from([5, NaN, NaN, 8, 9]);
  assert.equal(nearestX(xs, 2.4), 2); assert.equal(nearestX(xs, 2.5), 2, "ties go to the earlier point"); assert.equal(nearestX(xs, 9), 4); assert.equal(nearestX(xs, -1), 0);
  assert.equal(nearestValid(xs, ys, 1.4), 0); assert.equal(nearestValid(xs, ys, 2.1), 3);
  assert.equal(nearestX(new Float64Array(0), 1), -1);
});
test("nearest point on screen within a radius", () => {
  const xs = Float64Array.from([0, 10, 20]), ys = Float64Array.from([0, 10, 0]);
  const id = (v) => v * 10;
  assert.deepEqual(nearestPoint(xs, ys, id, id, 98, 104, 20), { i: 1, d: Math.hypot(2, 4) });
  assert.equal(nearestPoint(xs, ys, id, id, 50, 50, 10), null, "nothing within 10 px");
  assert.equal(nearestPoint(xs, ys, id, id, 190, 0, Infinity, 0, 2).i, 1, "only within the index range");
});
test("grid cells, edges, sky coordinates, polygons, Stanford regions", () => {
  assert.deepEqual(edgesOf([0, 1, 2]), [-0.5, 0.5, 1.5, 2.5]);
  assert.deepEqual(edgesOf([10, 20, 40]), [5, 15, 30, 50]);
  const xe = [0, 1, 2, 3], ye = [10, 20, 30];
  assert.deepEqual(gridCell(xe, ye, 2.5, 11), { ix: 2, iy: 0 });
  assert.deepEqual(gridCell(xe, ye, 0, 30), { ix: 0, iy: 1 });
  assert.equal(gridCell(xe, ye, 3.1, 15), null);
  assert.deepEqual(gridCell([3, 2, 1, 0], ye, 2.5, 25), { ix: 0, iy: 1 }, "descending edges");
  const [x, y] = skyToXY(90, 0); close(x, 1); close(y, 0, 1e-12);
  assert.deepEqual(skyToXY(0, 90).map((v) => Math.abs(+v.toFixed(12))), [0, 0], "zenith at the centre");
  for (const [az, el] of [[0, 45], [123.4, 12], [271, 80]]) { const r = xyToSky(...skyToXY(az, el)); close(r.az, az, 1e-9); close(r.el, el, 1e-9); }
  const sq = [[0, 0], [2, 0], [2, 2], [0, 2]];
  assert.ok(inPolygon(sq, 1, 1)); assert.ok(!inPolygon(sq, 3, 1));
  assert.equal(stanfordRegion(5, 20, 40), "nominal"); assert.equal(stanfordRegion(25, 20, 40), "mi"); assert.equal(stanfordRegion(45, 20, 40), "hmi");
  assert.equal(stanfordRegion(5, 45, 40), "unavailable"); assert.equal(stanfordRegion(50, 45, 40), "unavailable-mi");
  assert.deepEqual(inRange([1, 5, 9, 12], 4, 10), [1, 2]);
});

// ---------------------------------------------------------------- export
test("CSV: quoting, empty values, units in the header, formula guard", () => {
  assert.equal(csvField('a "b", c'), '"a ""b"", c"'); assert.equal(csvField(NaN), ""); assert.equal(csvField(1e-16), "1e-16");
  assert.equal(colName("time", "s"), "time [s]"); assert.equal(colName("n", ""), "n");
  const csv = toCSV(["series", "t [s]", "v"], [["=cmd()", 1, -2.5], ["a\nb", 2, null]]);
  assert.equal(csv, `series,t [s],v\n'=cmd(),1,-2.5\n"a\nb",2,\n`);
});
test("SVG export is a vector document of the display list", () => {
  const list = [
    { k: "rect", x: 0, y: 0, w: 10, h: 5, fill: "#123456" },
    { k: "clip", x: 1, y: 1, w: 8, h: 8 },
    { k: "path", pts: [0, 0, 5, 5, NaN, NaN, 6, 6, 7, 8], stroke: "red", width: 1.5, dash: [3, 2] },
    { k: "points", pts: [1, 2, 3, 4], color: "blue", size: 4 },
    { k: "points", pts: [1, 2], color: "green", size: 4, shape: "diamond" },
    { k: "unclip" },
    { k: "text", x: 3, y: 4, text: "a < b & \"c\"", color: "#fff", align: "right", base: "middle", rotate: -Math.PI / 2 },
    { k: "image", x: 0, y: 0, w: 4, h: 4, png: "data:image/png;base64,AAAA" },
  ];
  const svg = svgOf(list, 120.5, 80, { bg: "#000", title: "My <chart>" });
  assert.match(svg, /^<svg xmlns="http:\/\/www\.w3\.org\/2000\/svg" width="120\.5" height="80"/);
  assert.match(svg, /<title>My &lt;chart&gt;<\/title>/);
  assert.match(svg, /<path d="M0 0L5 5M6 6L7 8" fill="none" stroke="red" stroke-width="1.5" stroke-dasharray="3 2"/, "a NaN starts a new subpath");
  assert.equal((svg.match(/<circle /g) || []).length, 2);
  assert.match(svg, /<path d="M1 -?[\d.]+L[\d.]+ 2L1 [\d.]+L-?[\d.]+ 2Z" fill="green"/, "a diamond");
  assert.match(svg, /<clipPath id="c1">.*<g clip-path="url\(#c1\)">/s);
  assert.equal((svg.match(/<g /g) || []).length, (svg.match(/<\/g>/g) || []).length, "groups closed");
  assert.match(svg, />a &lt; b &amp; &quot;c&quot;<\/text>/);
  assert.match(svg, /text-anchor="end" dominant-baseline="central"/);
  assert.match(svg, /transform="rotate\(-90 3 4\)"/);
  assert.match(svg, /<image [^>]*href="data:image\/png;base64,AAAA"/);
  assert.ok(!/NaN/.test(svg), "no NaN in the output");
});

// ---------------------------------------------------------------- the model
const xySpec = () => normalise({ type: "xy", x: { label: "time", unit: "s", time: true }, y: { label: "error", unit: "ns" },
  series: [{ id: "a", label: "A", x: [0, 10, 20, 30], y: [1, 2, 3, 4], unit: "ns" }, { id: "b", kind: "scatter", label: "B", x: [5, 15, 25], y: [10, -10, 0], lo: [9, -11, -1], hi: [11, -9, 1] }] });
test("normalise: typed arrays, defaults, time epochs, log axes drop non-positive values", () => {
  const s = xySpec();
  assert.ok(s.series[0].x instanceof Float64Array); assert.equal(s.series[0].kind, "line"); assert.equal(s.series[1].kind, "scatter");
  assert.equal(s.series[0].t, s.series[0].x, "a time axis carries the epochs"); assert.equal(epochAxis(s), "x");
  const lg = normalise({ y: { kind: "log" }, series: [{ x: [1, 2, 3], y: [1, 0, -5] }] });
  assert.ok(Number.isNaN(lg.series[0].y[1]) && Number.isNaN(lg.series[0].y[2]));
  assert.equal(normalise({ type: "nope" }).type, "xy");
});
test("home view covers the data, bands and thresholds; hidden series drop out", () => {
  const s = xySpec();
  const v = homeView(s);
  assert.deepEqual(v.x.map((x) => +x.toFixed(9)), [-1.2, 31.2], "a chart with a scatter pads x by 4 %");
  assert.ok(v.y[0] < -11 && v.y[1] > 11, "the band is inside");
  const only = homeView(s, new Set(["b"]));
  assert.ok(only.y[0] > 0.5 && only.y[1] < 4.5);
  const withLine = normalise({ series: [{ x: [0, 1], y: [0, 1] }], overlays: [{ kind: "hline", y: 5 }] });
  assert.ok(homeView(withLine).y[1] > 5);
  const bars = normalise({ series: [{ kind: "bar", x: [0, 1, 2], y: [3, 5, 4] }] });
  assert.equal(barSpacing(bars.series), 1); const hb = homeView(bars); assert.ok(hb.x[0] < 0 && hb.x[1] > 2 && hb.y[0] === 0);
});
test("visible rows: the window, scatter in y too, units, limit", () => {
  const s = xySpec();
  const { header, rows } = visibleRows(s, { x: [5, 20], y: [-5, 20] });
  assert.deepEqual(header, ["series", "time [s]", "error", "unit", "low", "high"]);
  assert.deepEqual(rows.map((r) => r.slice(0, 3)), [["A", 10, 2], ["A", 20, 3], ["B", 5, 10]], "A's points in the window, B's inside x and y");
  assert.equal(rows.find((r) => r[0] === "B" && r[1] === 15), undefined, "B at y = −10 is below the window");
  assert.equal(visibleRows(s, { x: [0, 30], y: [-20, 20] }, new Set(["a"])).rows.length, 3);
  assert.equal(visibleRows(s, { x: [0, 30], y: [-20, 20] }, new Set(), 2).rows.length, 2);
  const csv = toCSV(header, rows);
  assert.ok(csv.startsWith("series,time [s],error,unit,low,high\nA,10,2,ns,,\n"));
});
test("grid and polar models", () => {
  const hm = normalise(heatmap({ title: "h", xLabels: ["a", "b", "c"], yLabels: ["r1", "r2"], z: [[1, 2, 3], [4, 5, NaN]], unit: "s" }));
  assert.equal(hm.grid.nx, 3); assert.equal(hm.grid.ny, 2); assert.equal(hm.grid.z[4], 5);
  assert.deepEqual(hm.grid.zDomain, [1, 5]);
  assert.deepEqual(homeView(hm).x, [-0.5, 2.5]);
  const vr = visibleRows(hm, { x: [0.6, 2.5], y: [-0.5, 1.5] });
  assert.deepEqual(vr.rows, [["b", "r1", 2], ["c", "r1", 3], ["b", "r2", 5], ["c", "r2", NaN]]);
  const wf = normalise(waterfall({ title: "w", f: [1, 2], t: [0, 1, 2], z: [[1, 2], [3, 4], [5, 6]] }));
  assert.equal(epochAxis(wf), "y"); assert.ok(wf.y.flip);
  const sk = normalise(sky({ title: "s", tracks: [{ id: "G01", az: [0, 90], el: [90, -5], t: [0, 60] }] }));
  assert.ok(sk.equal); close(sk.tracks[0].px[0], 0, 1e-12); assert.ok(Number.isNaN(sk.tracks[0].px[1]), "below the horizon is not drawn");
  assert.deepEqual(visibleRows(sk, homeView(sk)).rows, [["G01", 0, 0, 90]]);
  const eq = equalAspect({ x: [-1, 1], y: [-1, 1] }, 400, 200);
  close((eq.x[1] - eq.x[0]) / 400, (eq.y[1] - eq.y[0]) / 200); close(eq.y[1] - eq.y[0], 2);
});

// ---------------------------------------------------------------- linking
test("link group: x windows and brushes reach the others, not the sender", () => {
  const g = createLinkGroup("t");
  const got = { a: [], b: [] };
  const a = { onX: (d) => got.a.push(["x", d]), onBrush: (b) => got.a.push(["b", b]) };
  const b = { onX: (d) => { got.b.push(["x", d]); g.setX([0, 0], b); }, onBrush: (x) => got.b.push(["b", x]) };
  g.join(a); const leave = g.join(b);
  g.setX([1, 2], a);
  assert.deepEqual(got.a, [], "the sender is not called back"); assert.deepEqual(got.b, [["x", [1, 2]]], "and a member answering does not loop");
  g.setBrush([5, 3], b);
  assert.deepEqual(got.a[0][1].range, [3, 5]);
  leave(); g.setX(null, a); assert.equal(got.b.length, 1);
  assert.equal(g.size, 1);
  const set = brushOf({ epochs: [30, 10, 20] });
  assert.deepEqual(set.range, [10, 30]); assert.ok(brushHas(set, 20) && !brushHas(set, 15));
  assert.ok(brushHas(brushOf([0, 10]), 10)); assert.equal(brushOf({ epochs: [] }), null); assert.equal(brushOf(null), null);
});

// ---------------------------------------------------------------- 3D maths
test("3D projection: the target is at the centre; picking finds the drawn point", () => {
  const cam = M.camera({ target: [1, 2, 3], dist: 5 });
  const vp = M.viewProj(cam, 2);
  const c = M.project(vp, [1, 2, 3], 400, 200);
  close(c[0], 200, 1e-9); close(c[1], 100, 1e-9);
  assert.equal(M.project(vp, M.eyeOf({ ...cam, dist: 10 }), 400, 200), null, "behind the camera");
  const pts = [1, 2, 3, 1.5, 2, 3, 1, 2.5, 3.5];
  const p1 = M.project(vp, [1.5, 2, 3], 400, 200);
  assert.deepEqual(M.pickNearest(vp, pts, 400, 200, p1[0] + 2, p1[1] - 1, 12).i, 1);
  assert.equal(M.pickNearest(vp, pts, 400, 200, 5, 5, 12), null);
});
test("orbit camera: rotate, pan, zoom, fit", () => {
  const c = M.camera({ dist: 4 });
  const r = M.rotate(c, 100, 1e6); assert.equal(r.pitch, 1.5, "pitch stops short of the pole"); close(r.yaw, c.yaw - 0.8);
  const z = M.zoom(c, 0.5); assert.equal(z.dist, 2);
  const p = M.pan(c, 50, 0, 200); const e0 = M.eyeOf(c), e1 = M.eyeOf(p);
  close(Math.hypot(e1[0] - p.target[0], e1[1] - p.target[1], e1[2] - p.target[2]), 4, 1e-9, "panning keeps the distance");
  assert.ok(Math.hypot(e1[0] - e0[0], e1[1] - e0[1], e1[2] - e0[2]) > 0);
  const f = M.fit(c, [[-1, -1, -1], [1, 1, 1]]);
  assert.deepEqual(f.target, [0, 0, 0]); close(f.dist, (Math.sqrt(3) / Math.sin(c.fov / 2)) * 1.05);
  const bm = M.boxMap([[0, 0, 0], [10, 20, 40]], "cube"); assert.deepEqual(bm.to([10, 20, 40]), [1, 1, 1]); assert.deepEqual(bm.from([0, 0, 0]), [5, 10, 20]);
  const be = M.boxMap([[0, 0, 0], [10, 20, 40]], "equal"); assert.deepEqual(be.to([10, 20, 40]), [0.25, 0.5, 1]);
});
test("symmetric eigen-decomposition and covariance ellipsoids", () => {
  const C = [[4, 1, 0.5], [1, 3, 0.2], [0.5, 0.2, 1]];
  const { values, vectors } = M.eigenSym3(C);
  assert.ok(values[0] >= values[1] && values[1] >= values[2]);
  for (let k = 0; k < 3; k++) {
    const v = vectors[k], Av = C.map((row) => row[0] * v[0] + row[1] * v[1] + row[2] * v[2]);
    for (let i = 0; i < 3; i++) close(Av[i], values[k] * v[i], 1e-10, "A v = λ v");
    close(Math.hypot(...v), 1, 1e-12);
  }
  close(values.reduce((a, b) => a + b), 8, 1e-10, "trace");
  // every vertex of a k-sigma ellipsoid satisfies (x − c)ᵀ C⁻¹ (x − c) = k²
  const inv = invert3(C), c = [1, -2, 3], k = 2;
  const m = M.ellipsoidMesh(c, C, k, 12, 8);
  for (let i = 0; i < m.positions.length; i += 3) {
    const d = [m.positions[i] - c[0], m.positions[i + 1] - c[1], m.positions[i + 2] - c[2]];
    const q = d.reduce((s, di, a) => s + di * (inv[a][0] * d[0] + inv[a][1] * d[1] + inv[a][2] * d[2]), 0);
    close(q, k * k, 1e-8);
  }
  assert.equal(m.indices.length, 12 * 8 * 6);
  const { mean, cov } = M.covariance([1, 0, 0, -1, 0, 0, 0, 2, 0, 0, -2, 0]);
  assert.deepEqual(mean, [0, 0, 0]); close(cov[0][0], 2 / 3); close(cov[1][1], 8 / 3); close(cov[2][2], 0);
});
test("surface and sphere meshes", () => {
  const s = M.surfaceMesh([0, 1, 2], [0, 10], [[0, 1, 2], [3, 4, NaN]]);
  assert.equal(s.positions.length, 18); assert.equal(s.positions[3 * 4 + 2], 4);
  assert.deepEqual(s.indices, [0, 1, 4, 0, 4, 3], "the cell with a NaN corner is left out");
  const w = M.sphereWire(2, [0, 0, 0], 4, 4, 8);
  for (let i = 0; i < w.length; i += 3) close(Math.hypot(w[i], w[i + 1], w[i + 2]), 2, 1e-12);
  assert.deepEqual(M.bounds([0, 0, 0, 1, 2, 3], [NaN, -1, 5]), [[0, -1, 0], [1, 2, 5]]);
});

// ---------------------------------------------------------------- presets, colours, the shell adapter
test("Stanford preset: regions, counts, epochs", () => {
  const s = stanford({ error: [1, 30, 45, 5], pl: [20, 20, 20, 50], t: [0, 1, 2, 3], alertLimit: 40 });
  const by = Object.fromEntries(s.series.map((r) => [r.id, Array.from(r.x)]));
  assert.deepEqual(by, { nominal: [1], mi: [30], hmi: [45], unavailable: [5] });
  assert.deepEqual(Array.from(s.series.find((r) => r.id === "hmi").t), [2]);
  assert.match(s.series[0].legend, /· 1$/);
  assert.ok(s.overlays.some((o) => o.kind === "hline" && o.y === 40));
});
test("log–log preset flags points above the mask; interpolation", () => {
  close(interp([1, 100], [1, 100], 10), 10, 1e-12); close(interp([1, 100], [10, 1000], 10, "linear"), 100); assert.ok(Number.isNaN(interp([1, 2], [1, 2], 3)));
  const s = loglog({ title: "m", curves: [{ label: "a", tau: [1, 10, 100], dev: [5, 50, 20] }, { label: "b", tau: [1], dev: [99], mask: false }], mask: { tau: [1, 100], value: [10, 30], label: "mask" } });
  assert.deepEqual(s.series[0].flag, [false, true, false]); assert.equal(s.series[1].flag, null);
  assert.equal(s.x.kind, "log"); assert.equal(s.y.kind, "log");
});
test("colour ramps and parsing", () => {
  assert.deepEqual(rampRGB("viridis", 0), [0x44, 0x01, 0x54]); assert.deepEqual(rampRGB("viridis", 1), [0xfd, 0xe7, 0x25]); assert.equal(rampRGB("viridis", NaN), null);
  close(norm(5, 0, 10), 0.5); close(norm(100, 1, 1e4, true), 0.5);
  assert.deepEqual(parseColour("#abc"), [170, 187, 204, 1]); assert.deepEqual(parseColour("rgba(1, 2, 3, .5)"), [1, 2, 3, 0.5]);
  assert.equal(withAlpha("#ff0000", 0.2), "rgba(255,0,0,0.2)");
  const th = themeOf(null); assert.equal(th.tim, "#5A8CFF"); assert.equal(resolveColour("tim", th), "#5A8CFF"); assert.equal(resolveColour("var(--nope, #123)", th), "#123");
  assert.equal(inkOn([255, 255, 255]), "#0b0d17");
});
test("the Timeline adapter turns a series model into a time chart", () => {
  const s = seriesSpec({ title: "T", xLabel: "time (s)", yLabel: "time error (ns)", unit: "ns", series: [{ label: "q", color: "var(--s-orb)", points: [[0, 1], [10, 2]] }], threshold: 100, outages: [[2, 5]] });
  assert.equal(s.x.time, true); assert.equal(s.x.label, "time"); assert.equal(s.y.label, "time error"); assert.equal(s.y.unit, "ns");
  assert.deepEqual(s.series[0].x, [0, 10]); assert.equal(s.overlays.length, 2);
});
test("the library has no outside address and no claim words", () => {
  const dir = new URL(".", import.meta.url);
  for (const f of ["chart2d.mjs", "chart3d.mjs", "dual.mjs", "demo.mjs", "presets.mjs", "export.mjs", "chart.css", "index.mjs"]) {
    const text = readFileSync(new URL(f, dir), "utf8");
    const urls = [...text.matchAll(/https?:\/\/[^\s"'`)]+/g)].map((m) => m[0]).filter((u) => u !== "http://www.w3.org/2000/svg");
    assert.deepEqual(urls, [], `${f}: outside addresses`);
    assert.ok(!/\b(compliant|conform|certified)\b/i.test(text), `${f}: claim words`);
    assert.ok(!/runs in your browser/i.test(text), f);
  }
  const demo = JSON.parse(readFileSync(new URL("demo-data.json", dir), "utf8"));
  assert.match(demo.engine, /^kshana \d+\.\d+\.\d+/, "the demo data name the engine that made them");
  for (const k of ["ensemble", "holdover", "adev", "mtie", "integrity", "waterfall", "sweep", "orbit", "sky", "mc"]) assert.ok(demo[k], k);
});

function invert3(m) {
  const [[a, b, c], [d, e, f], [g, h, i]] = m;
  const A = e * i - f * h, B = -(d * i - f * g), C = d * h - e * g, det = a * A + b * B + c * C;
  return [[A / det, -(b * i - c * h) / det, (b * f - c * e) / det], [B / det, (a * i - c * g) / det, -(a * f - c * d) / det], [C / det, -(a * h - b * g) / det, (a * e - b * d) / det]];
}
console.log(`OK: ${n} chart library tests`);
