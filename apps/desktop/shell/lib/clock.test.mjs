// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: tests of the time cursor (clock.mjs), the run's model on it
// (timemodel.mjs), the plot's pure parts (plot.mjs) and the map's projection, geometry and
// styles (map/proj.mjs, map/style.mjs), plus a scrub benchmark of the pure per-frame work on
// 24 h of 1 Hz data. Run: node apps/desktop/shell/lib/clock.test.mjs
import assert from "node:assert/strict";
import { readFileSync, statSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { performance } from "node:perf_hooks";
import { createClock, clockKey, applyKey, attachTicker, indexAtOrBefore, nearestIndex, indexWindow, clockText, defaultSpeed, SPEEDS, speedText } from "./clock.mjs";
import { timeModel, trackOf, sceneLayers, geojsonOfExport, positionAt, readoutAt, hasGeo } from "./timemodel.mjs";
import { ticks, timeTicks, decimate, yExtent } from "./plot.mjs";
import * as P from "./map/proj.mjs";
import { mapStyle, parseColor, mix, alpha, styleForTheme, trackColor, STYLE_VARS } from "./map/style.mjs";

const here = dirname(fileURLToPath(import.meta.url));
let n = 0;
const test = async (name, fn) => { try { await fn(); } catch (e) { console.error(`FAIL: ${name}`); throw e; } n++; };
const near = (a, b, tol, msg) => assert.ok(Math.abs(a - b) <= tol, `${msg || ""} ${a} vs ${b} (±${tol})`);

// ---------------------------------------------------------------- clock
await test("search helpers find epochs", () => {
  const T = Float64Array.from([0, 1, 2, 5, 10]);
  assert.equal(indexAtOrBefore(T, -1), 0);
  assert.equal(indexAtOrBefore(T, 0), 0);
  assert.equal(indexAtOrBefore(T, 4.9), 2);
  assert.equal(indexAtOrBefore(T, 5), 3);
  assert.equal(indexAtOrBefore(T, 99), 4);
  assert.equal(indexAtOrBefore([], 1), -1);
  assert.equal(nearestIndex(T, 4), 3);
  assert.equal(nearestIndex(T, 3), 2);
  assert.deepEqual(indexWindow(T, 1, 5), [1, 3]);
  assert.deepEqual(indexWindow(T, 1.5, 4), [2, 2]);
  assert.equal(indexWindow(T, 6, 9), null);
  assert.equal(indexWindow(T, 11, 12), null);
});
await test("clock: seek clamps, subscribers hear every change and can stop", () => {
  const c = createClock({ start: 0, end: 100 });
  const got = [];
  const off = c.subscribe((s) => got.push([s.reason, s.t]));
  c.seek(50); c.seek(-5); c.seek(500);
  assert.deepEqual(got, [["seek", 50], ["seek", 0], ["seek", 100]]);
  off();
  c.seek(10);
  assert.equal(got.length, 3);
  assert.equal(c.listeners, 0);
  assert.throws(() => c.subscribe(null), TypeError);
  assert.equal(c.seek(NaN).reason, "none");
});
await test("clock: steps through the run's own epochs", () => {
  const c = createClock({ start: 0, end: 10, times: [0, 1, 2, 5, 10] });
  c.step(1); assert.equal(c.t, 1);
  c.step(1); c.step(1); assert.equal(c.t, 5);
  c.step(10); assert.equal(c.t, 10, "clamped to the last epoch");
  c.seek(3); c.step(-1); assert.equal(c.t, 2, "between epochs, back goes to the one before");
  c.seek(3); c.step(1); assert.equal(c.t, 5);
  c.step(-1); assert.equal(c.t, 2);
  const d = createClock({ start: 0, end: 200 });
  d.step(1); assert.equal(d.t, 2, "without epochs a step is a hundredth of the span");
  const e = createClock({ start: 0, end: 200, step: 5 });
  e.step(3); assert.equal(e.t, 15);
});
await test("clock: play, J/K/L shuttle, tick and the end of the run", () => {
  const c = createClock({ start: 0, end: 60, speed: 1 });
  assert.equal(c.speed, 1);
  c.play();
  assert.ok(c.tick(1000)); assert.equal(c.t, 1);
  c.shuttle(1); assert.equal(c.speed, 2, "L again doubles");
  c.tick(500); assert.equal(c.t, 2);
  c.shuttle(-1); assert.equal(c.dir, -1); assert.equal(c.speed, 2, "J reverses at the same speed");
  c.tick(500); assert.equal(c.t, 1);
  c.shuttle(0); assert.equal(c.playing, false, "K pauses");
  assert.equal(c.tick(1000), false);
  c.seek(59); c.play(1);
  assert.equal(c.tick(5000), false, "stops at the end");
  assert.equal(c.t, 60); assert.equal(c.playing, false);
  c.play(1); assert.equal(c.t, 0, "play at the end starts again from the start");
  c.toggle(); assert.equal(c.playing, false);
  assert.throws(() => c.setSpeed(0), RangeError);
  for (let i = 0; i < 30; i++) c.shuttle(1);
  assert.equal(c.speed, SPEEDS[SPEEDS.length - 1], "the ladder stops at its top");
});
await test("clock: a range narrows playback; [ and ] set it from the cursor", () => {
  const c = createClock({ start: 0, end: 100, speed: 10 });
  c.seek(20); c.rangeStartHere();
  assert.deepEqual(c.range, [20, 100]);
  c.seek(40); c.rangeEndHere();
  assert.deepEqual(c.range, [20, 40]);
  c.seek(30); c.rangeStartHere();
  assert.deepEqual(c.range, [30, 40], "[ keeps the old end when it is after the cursor");
  c.seek(35); c.play();
  c.tick(1000);
  assert.equal(c.t, 40); assert.equal(c.playing, false, "playback stops at the range's end");
  c.setRange(80, 60);
  assert.deepEqual(c.range, [60, 80], "ordered");
  assert.equal(c.t, 60, "the cursor moves into the range");
  c.setRange(5, 5);
  assert.equal(c.range, null, "an empty range clears");
  c.setRange(-10, 300);
  assert.deepEqual(c.range, [0, 100], "clamped to the span");
  c.clearRange();
  assert.equal(c.range, null);
});
await test("clock: markers toggle, sort and jump; a new span keeps what still fits", () => {
  const c = createClock({ start: 0, end: 100 });
  c.addMark(70, "b"); c.addMark(30, "a");
  assert.deepEqual(c.marks.map((m) => m.t), [30, 70]);
  c.seek(0);
  c.jumpMark(1); assert.equal(c.t, 30);
  c.jumpMark(1); assert.equal(c.t, 70);
  assert.equal(c.jumpMark(1), null);
  c.jumpMark(-1); assert.equal(c.t, 30);
  c.toggleMark(30.5, "", 1);
  assert.deepEqual(c.marks.map((m) => m.t), [70], "M on a marker removes it");
  c.toggleMark(50);
  assert.equal(c.marks.length, 2);
  c.removeMark(c.marks[0].id);
  assert.equal(c.marks.length, 1);
  c.setRange(40, 90);
  c.setSpan(0, 60);
  assert.deepEqual(c.range, [40, 60]);
  assert.deepEqual(c.marks.map((m) => m.t), [], "a marker past the new end is dropped");
  c.setSpan(0, 30);
  assert.equal(c.range, null, "a range outside the new span clears");
  assert.ok(c.t <= 30);
});
await test("clock keys: space, J/K/L, arrows, M, [ ], Escape; fields and buttons keep theirs", () => {
  assert.deepEqual(clockKey({ key: " " }), { action: "toggle" });
  assert.equal(clockKey({ key: " " }, { onButton: true }), null);
  assert.deepEqual(clockKey({ key: "J" }), { action: "shuttle", dir: -1 });
  assert.deepEqual(clockKey({ key: "k" }), { action: "shuttle", dir: 0 });
  assert.deepEqual(clockKey({ key: "l" }), { action: "shuttle", dir: 1 });
  assert.deepEqual(clockKey({ key: "ArrowLeft" }), { action: "step", n: -1 });
  assert.deepEqual(clockKey({ key: "ArrowRight", shiftKey: true }), { action: "step", n: 10 });
  assert.equal(clockKey({ key: "ArrowRight" }, { inTabList: true }), null);
  assert.deepEqual(clockKey({ key: "m" }), { action: "mark" });
  assert.deepEqual(clockKey({ key: "[" }), { action: "range-start" });
  assert.deepEqual(clockKey({ key: "]" }), { action: "range-end" });
  assert.deepEqual(clockKey({ key: "Escape" }), { action: "clear-range" });
  assert.equal(clockKey({ key: "l" }, { inField: true }), null);
  assert.equal(clockKey({ key: "k", metaKey: true }), null, "Cmd+K stays the palette");
  assert.equal(clockKey({ key: "x" }), null);
  const c = createClock({ start: 0, end: 10, times: [0, 1, 2, 3] });
  assert.ok(applyKey(c, clockKey({ key: "ArrowRight" })));
  assert.equal(c.t, 1);
  assert.ok(applyKey(c, clockKey({ key: "m" })));
  assert.equal(c.marks.length, 1);
  assert.equal(applyKey(c, clockKey({ key: "Escape" })), false, "Escape without a range is left to others");
  assert.equal(applyKey(c, null), false);
});
await test("ticker: frames advance a playing clock and stop with it", () => {
  const c = createClock({ start: 0, end: 10, speed: 1 });
  const q = new Map();
  let id = 0;
  const raf = (fn) => { q.set(++id, fn); return id; };
  const caf = (i) => q.delete(i);
  const run = (now) => { const fns = [...q.values()]; q.clear(); for (const f of fns) f(now); };
  const stop = attachTicker(c, raf, caf);
  c.play();
  assert.equal(q.size, 1);
  run(1000); run(1100); run(1300);
  near(c.t, 0.3, 1e-9);
  run(9000);
  near(c.t, 0.55, 1e-9, "a long gap (a hidden window) advances at most a quarter second");
  c.pause();
  assert.equal(q.size, 0, "a pause cancels the frame");
  c.play(); run(5000); run(5100);
  near(c.t, 0.65, 1e-9);
  stop();
  assert.equal(q.size, 0);
  assert.equal(c.listeners, 0);
});
await test("clock text and speeds", () => {
  assert.equal(clockText(0), "T+0:00:00");
  assert.equal(clockText(3725), "T+1:02:05");
  assert.equal(clockText(90061), "T+1 d 01:01:01");
  assert.equal(clockText(1.25, { ms: true }), "T+0:00:01.250");
  assert.equal(clockText(-5), "T−0:00:05");
  assert.equal(clockText(30, { epochMs: Date.UTC(2020, 1, 14, 4, 27, 39, 231) }), "04:28:09 UTC");
  assert.equal(clockText(NaN), "–");
  assert.equal(defaultSpeed(86400), 1800, "24 h plays in under a minute");
  assert.equal(defaultSpeed(60), 1);
  assert.equal(defaultSpeed(0), 0.25);
  assert.equal(speedText(60), "×60");
  assert.equal(speedText(0.5), "×0.5");
});

// ---------------------------------------------------------------- the run's model
const geo = {
  type: "FeatureCollection", description: "Kshana export",
  features: [
    { type: "Feature", geometry: { type: "Point", coordinates: [24.9, 59.8, 0] }, properties: { name: "receiver", role: "receiver", description: "GNSS receiver" } },
    { type: "Feature", geometry: { type: "Point", coordinates: [25.43, 59.8, 0] }, properties: { name: "jammer", role: "jammer" } },
    { type: "Feature", geometry: { type: "Polygon", coordinates: [[[25.5, 59.8], [25.43, 59.85], [25.36, 59.8], [25.5, 59.8]]] }, properties: { name: "footprint/denial", role: "jammer-footprint", centre: [25.43, 59.8], radius_m: 5000, description: "every satellite is lost" } },
    { type: "Feature", geometry: { type: "Polygon", coordinates: [[[25.6, 59.8], [25.43, 59.9], [25.26, 59.8], [25.6, 59.8]]] }, properties: { name: "footprint/onset", role: "jammer-footprint", centre: [25.43, 59.8], radius_m: 11000 } },
    { type: "Feature", geometry: { type: "MultiLineString", coordinates: [[[170, 10, 1], [180, 11, 1]], [[-180, 11, 1], [-170, 12, 1]]] }, properties: { name: "G01", role: "satellite", times_utc: ["2020-01-01T00:00:00Z", "2020-01-01T00:01:00Z"] } },
  ],
};
await test("scene layers: sites, jammer areas with their evidence, satellites cut at the antimeridian", () => {
  const L = sceneLayers(geo);
  assert.deepEqual(L.sites.map((s) => s.role), ["receiver", "jammer"]);
  assert.equal(L.areas.length, 1, "the two footprints of one jammer are one area");
  assert.equal(L.areas[0].inner, 5000); assert.equal(L.areas[0].outer, 11000);
  assert.equal(L.areas[0].evidence, "modelled");
  assert.equal(L.movers.length, 1);
  assert.deepEqual(Array.from(L.movers[0].t), [0, 60]);
  assert.deepEqual(Array.from(L.movers[0].lon), [170, -170], "the points added at ±180 are left out");
  assert.equal(L.epochMs, Date.UTC(2020, 0, 1));
  const est = JSON.parse(JSON.stringify(geo));
  est.features[2].properties.evidence = "estimated";
  assert.equal(sceneLayers(est).areas[0].evidence, "estimated");
  assert.deepEqual(sceneLayers(null).sites, []);
  const exp = JSON.stringify({ format: "geojson", files: [{ suffix: ".geojson", encoding: "utf-8", content: JSON.stringify(geo) }] });
  assert.equal(geojsonOfExport(exp).features.length, 5);
  assert.equal(geojsonOfExport("not json"), null);
});
await test("track of a receiver-trust result: position and trust per epoch", () => {
  const r = { epochs: [
    { t_s: 0, state: "calibrating", marine: { position: [59.45, 24.77] } },
    { t_s: 1, state: "nominal", marine: { position: [59.46, 24.78] }, score: { score: 100, band: "nominal" } },
    { t_s: 2, state: "untrusted", marine: { position: [59.47, 24.79] }, score: { score: 10, band: "untrusted" } }] };
  const tr = trackOf(r);
  assert.equal(tr.kind, "trust");
  assert.deepEqual(Array.from(tr.t), [0, 1, 2]);
  assert.ok(Number.isNaN(tr.q[0]));
  assert.equal(tr.q[2], 0.1);
  const m = timeModel(r, null, null);
  assert.deepEqual(m.span, [0, 2]);
  assert.equal(m.series[0].id, "trust", "the trust score is plotted when the Studio has no chart");
  assert.ok(hasGeo(m));
  const ro = readoutAt(m, 2);
  assert.equal(ro[0].k, "position");
  assert.equal(ro[1].state, "fail");
});
await test("track of an ephemeris result: ground track and station visibility", () => {
  const r = { samples: [0, 30, 60].map((t, i) => ({ t_s: t, lat_deg: i, lon_deg: 179 + i, station_view: { visible: i === 1, el_deg: i * 5 - 2 } })) };
  const tr = trackOf(r);
  assert.equal(tr.kind, "visible");
  assert.deepEqual(Array.from(tr.q), [0, 1, 0]);
  const m = timeModel(r, null, null);
  assert.equal(m.series[0].id, "el");
  assert.equal(m.step, 30);
  const p = positionAt(tr, 45);
  near(p.lat, 1.5, 1e-9);
  near(p.lon, -179.5, 1e-9, "interpolates across the antimeridian");
  assert.equal(positionAt(tr, 61), null);
});
await test("time model of a jamming run: the Studio's series, the receiver and the fix at the cursor", () => {
  const r = { epochs: [{ t: 0, visible: 8, tracking: 6, sats: [{ js_db: 30 }, { js_db: 40 }] }, { t: 30, visible: 8, tracking: 2, sats: [{ js_db: 50 }] }] };
  const model = { title: "Satellites", unit: "", threshold: 4, thresholdLabel: "4 needed", yLabel: "satellites", series: [{ label: "visible", color: "var(--s-orb)", points: [[0, 8], [30, 8]] }, { label: "tracking", color: "var(--s-int)", points: [[0, 6], [30, 2]] }] };
  const m = timeModel(r, model, geo);
  assert.equal(m.series.length, 2);
  assert.equal(m.threshold, 4);
  assert.equal(m.track, null);
  assert.equal(m.sites.length, 2);
  assert.ok(m.span[1] >= 60, "the satellites' times widen the span");
  const at0 = readoutAt(m, 10), at1 = readoutAt(m, 30);
  assert.deepEqual(at0.find((x) => x.k === "fix"), { k: "fix", v: "held", unit: "", state: "pass" });
  assert.equal(at0.find((x) => x.k === "J/S (mean)").v, 35);
  assert.equal(at1.find((x) => x.k === "fix").v, "lost");
  const sweep = timeModel({ points: [{ value: 1, a: 2 }, { value: 2, a: 3 }] }, { logX: false, series: [{ label: "a", points: [[1, 2], [2, 3]] }] });
  assert.equal(sweep, null, "a sweep has no time axis");
  assert.equal(timeModel({ fom: { x: 1 } }), null);
});

// ---------------------------------------------------------------- plot
await test("plot ticks and decimation", () => {
  assert.deepEqual(ticks(0, 10, 5), [0, 2, 4, 6, 8, 10]);
  assert.deepEqual(ticks(-1, 1, 4), [-1, -0.5, 0, 0.5, 1]);
  assert.deepEqual(timeTicks(0, 3600, 6), [0, 600, 1200, 1800, 2400, 3000, 3600]);
  assert.equal(timeTicks(0, 86400, 6).length, 5);
  assert.deepEqual(timeTicks(0, 3600, 6, 16059), [141, 741, 1341, 1941, 2541, 3141], "ticks on round clock times after an epoch of 04:27:39");
  const t = Float64Array.from({ length: 1000 }, (_, i) => i), v = Float64Array.from(t, (x) => Math.sin(x / 50));
  const d = decimate(t, v, 100, 900, 80);
  assert.equal(d.cols.length, 160);
  for (let c = 0; c < 80; c++) assert.ok(d.cols[2 * c] <= d.cols[2 * c + 1]);
  assert.equal(d.first, 100); assert.equal(d.last, 901);
  near(Math.min(...d.cols.filter((_, i) => i % 2 === 0)), -1, 1e-3);
  assert.deepEqual(yExtent([{ t, v }], 0, 999, 3).map((x) => +x.toFixed(2)), [-1.24, 3.24]);
  assert.deepEqual(yExtent([], 0, 1), [0, 1]);
});

// ---------------------------------------------------------------- map projection and geometry
await test("Web Mercator: known points and the round trip", () => {
  assert.deepEqual(P.toWorld(0, 0), [0.5, 0.5]);
  near(P.toWorld(180, 0)[0], 1, 1e-12);
  near(P.toWorld(0, P.MAX_LAT)[1], 0, 1e-9, "the square world's top edge");
  near(P.toWorld(0, 89.9)[1], 0, 1e-9, "latitudes past the edge are held at it");
  for (const [lon, lat] of [[24.75, 59.44], [-122.4, 37.8], [151.2, -33.9], [-179.9, 0.1]]) {
    const [x, y] = P.toWorld(lon, lat);
    const [lo, la] = P.fromWorld(x, y);
    near(lo, lon, 1e-9); near(la, lat, 1e-9);
  }
  // EPSG:3857 metres: y = R ln tan(pi/4 + lat/2); Tallinn (59.44 N) is at 8 276 101.7 m.
  const yM = (0.5 - P.toWorld(24.75, 59.44)[1]) * 2 * Math.PI * P.R_EARTH;
  near(yM, 8276101.68, 0.01);
  assert.equal(P.fromWorld(1.25, 0.5)[0], -90, "x past the world wraps");
});
await test("view: project and unproject, zoom about a point, pan, fit", () => {
  const v = P.makeView(0.5, 0.5, 2);
  const [x, y] = P.project(v, 800, 600, 0, 0);
  assert.deepEqual([x, y], [400, 300]);
  const [lon, lat] = P.unproject(v, 800, 600, 600, 200);
  const [x2, y2] = P.project(v, 800, 600, lon, lat);
  near(x2, 600, 1e-6); near(y2, 200, 1e-6);
  const z = P.zoomAbout(v, 800, 600, 2, 600, 200);
  assert.equal(z.zoom, 3);
  const [x3, y3] = P.project(z, 800, 600, lon, lat);
  near(x3, 600, 1e-6, "the point under the pointer stays"); near(y3, 200, 1e-6);
  const p = P.panBy(v, 100, 0);
  near(P.project(p, 800, 600, 0, 0)[0], 500, 1e-9);
  assert.equal(P.zoomAbout(v, 800, 600, 1e9, 0, 0).zoom, P.MAX_ZOOM);
  const f = P.fitBounds({ west: 24, south: 59, east: 26, north: 60 }, 800, 600, { pad: 20 });
  for (const [lo2, la2] of [[24, 59], [26, 60]]) {
    const [sx, sy] = P.project(f, 800, 600, lo2, la2);
    assert.ok(sx >= 19.9 && sx <= 780.1 && sy >= 19.9 && sy <= 580.1, `${sx},${sy}`);
  }
  const pt = P.fitBounds({ west: 24, south: 59, east: 24, north: 59 }, 800, 600);
  assert.ok(pt.zoom <= 12, "a single point is not zoomed past the cap");
  const across = P.boundsOf([170, 175, -175], [0, 1, 2]);
  assert.deepEqual([across.west, across.east], [170, -175], "the shorter way round the antimeridian");
  const wide = P.fitBounds(across, 800, 600);
  assert.ok(wide.zoom > 3, "fits the short box, not the whole world");
  assert.equal(P.boundsOf([], []), null);
});
await test("distances, scale bar, graticule step, copies of the world", () => {
  near(P.haversine(0, 0, 0, 1), 111319.49, 0.01, "one degree on the equator");
  near(P.haversine(59.44, 24.75, 60.17, 24.94) / 1000, 81.5, 0.5, "Tallinn to Helsinki");
  near(P.metresPerPixel(0, 0), 156543.03, 0.01, "the Web Mercator zoom 0 resolution");
  near(P.metresPerPixel(60, 1), 156543.03 / 4, 0.01);
  const sb = P.scaleBar(P.metresPerPixel(59.5, 8), 120);
  assert.equal(sb.text, "20 km", "310 m a pixel: 120 px is 37 km, the bar shows 20 km");
  assert.ok(sb.px > 0 && sb.px <= 120);
  assert.equal(P.scaleBar(3, 120).text, "200 m");
  assert.equal(P.niceBelow(730), 500);
  assert.equal(P.niceBelow(0), 0);
  assert.equal(P.graticuleStep(360), 30);
  assert.equal(P.graticuleStep(4), 0.5);
  assert.deepEqual(P.worldCopies(P.makeView(0.5, 0.5, 0), 256), [0]);
  assert.deepEqual(P.worldCopies(P.makeView(0.99, 0.5, 2), 800), [0, 1]);
  const ring = P.circleRing(59.8, 25.43, 10000, 36);
  assert.equal(ring.length, 37);
  for (const [lo, la] of ring) near(P.haversine(59.8, 25.43, la, lo), 10000, 0.5);
  assert.equal(P.nearestPoint(Float32Array.from([0, 10, 20]), Float32Array.from([0, 0, 0]), 11, 1, 5), 1);
  assert.equal(P.nearestPoint(Float32Array.from([0]), Float32Array.from([0]), 50, 50, 5), -1);
  assert.equal(P.latLonText(59.4433, -24.75), "59.4433° N · 24.7500° W");
});
await test("Natural Earth layers: bundled, packed, decoded and attributed", () => {
  const data = join(here, "..", "data");
  let total = 0;
  for (const s of ["110m", "50m"]) {
    const f = join(data, `land-${s}.json`);
    total += statSync(f).size;
    const packed = JSON.parse(readFileSync(f, "utf8"));
    assert.equal(packed.format, "kshana-land/1");
    assert.match(packed.source, /Natural Earth/);
    const rings = P.decodeLand(packed);
    assert.ok(rings.length > (s === "110m" ? 100 : 1000), `${s}: ${rings.length} rings`);
    for (const r of rings) assert.ok(r.bbox[0] >= -1e-9 && r.bbox[2] <= 1 + 1e-9 && r.bbox[1] >= 0 && r.bbox[3] <= 1);
    // Estonia's north coast at Tallinn (24.75 E, 59.44 N) is inside the land of the 50m layer's view box.
    if (s === "50m") {
      const [x, y] = P.toWorld(24.75, 59.4);
      assert.ok(rings.some((r) => x >= r.bbox[0] && x <= r.bbox[2] && y >= r.bbox[1] && y <= r.bbox[3]));
    }
  }
  assert.ok(total < 600 * 1024, `the bundled land layers stay small: ${total} bytes`);
  const note = readFileSync(join(data, "NATURAL-EARTH.md"), "utf8");
  assert.match(note, /public domain/i);
  assert.throws(() => P.decodeLand({ format: "x" }));
});
await test("map styles follow the theme and keep colour for meaning", () => {
  const vars = { "--space-2": "#0C0E18", "--bg": "#E8ECF3", "--surface": "#F5F7FB", "--s-itg": "#3DDC84", "--s-int": "#FF5B54", "--s-nav": "#FFB224", "--itg": "#0A6F38", "--int": "#B8262B", "--nav": "#7C4800", "--tim": "#1C4FE0" };
  const v = (k) => vars[k] || "";
  assert.equal(styleForTheme("dark"), "night");
  assert.equal(styleForTheme("light"), "chart");
  const night = mapStyle("night", v), chart = mapStyle("chart", v);
  assert.equal(night.sea, "#0C0E18");
  assert.notEqual(chart.sea, night.sea);
  assert.equal(night.trusted, "#3DDC84"); assert.equal(chart.trusted, "#0A6F38", "the light style uses the darker text colours");
  assert.equal(trackColor(night, "trust", 0.95), night.trusted);
  assert.equal(trackColor(night, "trust", 0.6), night.degraded);
  assert.equal(trackColor(night, "trust", 0.1), night.untrusted);
  assert.equal(trackColor(night, "trust", NaN), night.track);
  assert.equal(trackColor(night, "visible", 1), night.visible);
  assert.deepEqual(parseColor("#fff"), [255, 255, 255, 1]);
  assert.deepEqual(parseColor("rgba(28,44,84,.12)"), [28, 44, 84, 0.12]);
  assert.equal(parseColor("color-mix(in srgb, red, blue)"), null);
  assert.equal(mix("#000000", "#ffffff", 0.5), "rgb(128,128,128)");
  assert.equal(alpha("#ff0000", 0.5), "rgba(255,0,0,0.5)");
  assert.ok(STYLE_VARS.includes("--space-2"));
});

// ---------------------------------------------------------------- scrubbing 24 h of 1 Hz data
await test("benchmark: the per-frame work of a scrub over 24 h of 1 Hz data fits a 60 fps frame", () => {
  const N = 86400;
  const r = { samples: Array.from({ length: N }, (_, i) => ({ t_s: i, lat_deg: 51.6 * Math.sin(i / 900), lon_deg: ((i / 15) % 360) - 180, station_view: { visible: i % 5400 < 600, el_deg: (i % 5400) / 60 - 20 } })) };
  const t0 = performance.now();
  const m = timeModel(r, null, null);
  const build = performance.now() - t0;
  const c = createClock({ start: m.span[0], end: m.span[1], times: m.times });
  let sink = 0;
  c.subscribe((s) => { for (const x of readoutAt(m, s.t)) sink += typeof x.v === "number" ? x.v : 1; const p = positionAt(m.track, s.t); if (p) sink += p.lat; });
  const frames = 600;
  const t1 = performance.now();
  for (let f = 0; f < frames; f++) {
    c.seek((f / frames) * N);
    // The plot's top layer reads one value per series; its base layer is redrawn on a range change only.
    if (f % 60 === 0) { const d = decimate(m.series[0].t, m.series[0].v, 0, N, 1200); sink += d.cols[0] || 0; }
  }
  const per = (performance.now() - t1) / frames;
  assert.ok(Number.isFinite(sink));
  console.log(`  model of 86 400 epochs built in ${build.toFixed(0)} ms; per scrub frame ${per.toFixed(3)} ms of model work`);
  assert.ok(per < 4, `per frame ${per} ms (budget 16.7 ms, the rest is drawing)`);
});

console.log(`OK: ${n} time cursor and map tests`);
