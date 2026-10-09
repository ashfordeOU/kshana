// SPDX-License-Identifier: AGPL-3.0-only
// Runs against the real engine output in recorded/ and native/.
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { gunzipSync } from "node:zlib";
import * as G from "./stages.mjs";

const load = (f) => JSON.parse(JSON.parse(readFileSync(new URL(`../recorded/${f}.json`, import.meta.url), "utf8")).json);
const count = (s, re) => (s.match(re) || []).length;

// ---- waterfall
const sp = load("l-band-waterfall-jamming");
const frames = G.waterfallFrames(sp);
assert.equal(frames.length, 1);
const f = frames[0];
assert.equal(f.psd.length, sp.waterfall.n_time);
assert.equal(f.freq.length, sp.waterfall.n_freq);
assert.equal(f.floor, sp.waterfall.noise_floor_dbw_per_hz);
assert.equal(f.peak, sp.waterfall.peak_dbw_per_hz);
const wf = G.waterfallSvg(f, { bands: sp.bands });
assert.ok(wf.svg.startsWith("<svg") && wf.svg.endsWith("</svg>"));
// Every row is covered edge to edge: the rectangles of a row add up to the plot width.
const rects = [...wf.svg.matchAll(/<rect x="([\d.]+)" y="([\d.]+)" width="([\d.]+)" height="[\d.]+" fill="(rgb\([\d,]+\))"\/>/g)].map((m) => ({ x: +m[1], y: +m[2], w: +m[3], fill: m[4] }));
const rows = new Map();
for (const r of rects) rows.set(r.y, (rows.get(r.y) || 0) + r.w - 0.3);
assert.equal(rows.size, f.psd.length, "one drawn row per time step");
for (const [, w] of rows) assert.ok(Math.abs(w - wf.geo.pw) < 1.5, `row width ${w} against ${wf.geo.pw}`);
// The colour of a drawn cell is the ramp at that cell's power: the peak cell is the top of the ramp.
let pk = { v: -Infinity };
f.psd.forEach((row, r) => row.forEach((v, c) => { if (v > pk.v) pk = { v, r, c }; }));
assert.ok(pk.v <= f.peak && pk.v > f.peak - 3, "the largest drawn cell is just under the engine's peak (the engine takes its peak on the finer source grid)");
const px = wf.geo.ml + pk.c * wf.geo.cw, py = wf.geo.mt + pk.r * wf.geo.rh;
const hit = rects.find((r) => Math.abs(r.y - py) < 0.01 && r.x <= px + 0.01 && r.x + r.w >= px + wf.geo.cw - 0.4);
assert.ok(hit, "the peak cell is drawn");
assert.equal(hit.fill, G.wfColor(Math.round(Math.pow((pk.v - f.floor) / (f.peak - f.floor), G.WF_GAMMA) * 63) / 63));
assert.equal(G.wfColor(1), "rgb(253,231,37)");
assert.equal(G.wfColor(0), "rgb(21,28,72)");
// A cell at the floor is the bottom of the ramp.
assert.ok(rects.some((r) => r.fill === G.wfColor(0)));
assert.equal(count(wf.svg, /class="wf-band"/g), sp.bands.filter((b) => b.centre_hz >= f.fMin && b.centre_hz <= f.fMax).length, "one carrier tick per band in the frame");
const slice = G.spectrumSlice(f, 31);
assert.deepEqual(slice.series[0].points[5], [f.freq[5] / 1e6, f.psd[31][5]]);
assert.equal(slice.threshold, f.floor);
assert.equal(G.nearestIndex([0, 2, 4, 6], 3.2), 2);
// The multi-band run has one frame per extra panel.
const mb = load("multi-band-jamming-waterfall");
assert.deepEqual(G.waterfallFrames(mb).map((x) => x.id), ["band", ...mb.panels.map((_, i) => `panel-${i}`)]);
assert.deepEqual(G.waterfallFrames(mb).slice(1).map((x) => x.name), mb.panels.map((p) => p.name));

// ---- solar system
const so = load("solar-system-tour");
const views = G.orreryViews(so);
assert.deepEqual(views.slice(0, 2).map((v) => v.id), ["planets", "inner"]);
const parents = [...new Set(so.bodies.filter((b) => b.parent && b.parent !== "Sun").map((b) => b.parent))];
assert.deepEqual(views.slice(2).map((v) => v.id), parents.map((p) => `moons:${p}`));
const pl = G.orrerySvg(so, { view: "planets" });
const planets = so.bodies.filter((b) => b.parent === "Sun");
assert.equal(count(pl.svg, /class="or-body"/g), planets.length, "one dot per body about the Sun");
assert.equal(count(pl.svg, /class="or-track"/g), planets.filter((b) => b.track_m.length > 1).length, "one track per body");
assert.deepEqual(pl.shown.filter((x) => x.path.startsWith("bodies")).map((x) => x.name), planets.map((b) => b.name));
for (const b of planets) assert.ok(pl.svg.includes(`<title>${b.name}: `), `${b.name} is drawn`);
// Links whose two ends are on the drawing are drawn with the engine's light time.
const onPlan = so.links.filter((l) => [l.from, l.to].every((n) => n === "Sun" || planets.some((b) => b.name === n)));
assert.equal(count(pl.svg, /class="or-link"/g), onPlan.length);
const jm = G.orrerySvg(so, { view: "moons:Jupiter" });
assert.equal(count(jm.svg, /class="or-body"/g), so.bodies.filter((b) => b.parent === "Jupiter").length);
assert.ok(jm.svg.includes("linear scale"));
// No name sits on another name: label boxes do not intersect.
for (const v of views) {
  const svg = G.orrerySvg(so, { view: v.id }).svg;
  const names = [...svg.matchAll(/<text class="or-name" x="([-\d.]+)" y="([-\d.]+)" text-anchor="(\w+)">([^<]+)</g)].map((m) => { const w = m[4].length * 6.6; const x = +m[1]; const x0 = m[3] === "start" ? x : m[3] === "end" ? x - w : x - w / 2; return [x0, +m[2] - 10, x0 + w, +m[2] + 2]; });
  for (let i = 0; i < names.length; i++) for (let j = i + 1; j < names.length; j++) assert.ok(!(names[i][0] < names[j][2] && names[i][2] > names[j][0] && names[i][1] < names[j][3] && names[i][3] > names[j][1]), `${v.id}: two names overlap`);
}

// ---- coverage
for (const name of ["constellation-multi-gnss-coverage", "lunar-relay-constellation", "leo-pnt-mega-shell"]) {
  const cv = load(name);
  const fields = G.coverageFields(cv);
  assert.ok(fields.length >= 5 && fields[0].key === "mean_pdop" && fields[0].lowerBetter, `${name}: fields`);
  for (const fd of fields) {
    const m = G.coverageSvg(cv, { field: fd.key, k: 0 });
    const vals = cv.grid[fd.key].flat().filter(Number.isFinite);
    assert.deepEqual(m.range, [Math.min(...vals), Math.max(...vals)], `${name}: ${fd.key} range`);
    assert.equal(count(m.svg, /<rect x=/g), vals.length, `${name}: ${fd.key}: one cell per grid point with a value`);
    assert.equal(m.shownSats, cv.tracks.satellites.length);
    assert.equal(count(m.svg, /class="cov-sat"/g), cv.tracks.shown, `${name}: the satellites the engine lists are drawn`);
  }
  // A cell's title states its own value.
  const m = G.coverageSvg(cv, { field: "mean_pdop" });
  assert.ok(m.svg.includes(`lat ${String(Number(cv.grid.lat_deg[0].toPrecision(4)))}°`));
  assert.deepEqual(G.coverageLegend(cv).map((x) => x.name), [...new Set(cv.tracks.satellites.map((s) => s.constellation))]);
}

// ---- campaign timeline
const ca = load("campaign-jam-spoof-holdover-integrity");
const charts = G.timelineCharts(ca);
const keys = charts.flatMap((c) => c.keys).sort();
assert.deepEqual(keys, Object.keys(ca.timeline.channels).filter((k) => ca.timeline.channels[k].values.some(Number.isFinite)).sort(), "every channel with a value is on a chart");
for (const c of charts) {
  for (const s of c.model.series) {
    assert.equal(ca.timeline.channels[s.key].unit, c.unit, "a chart holds one unit");
    assert.deepEqual(s.points.map((p) => p[1]), ca.timeline.channels[s.key].values, `${s.key} is plotted as recorded`);
    assert.deepEqual(s.points.map((p) => p[0]), ca.timeline.t_s);
  }
  assert.deepEqual(c.opts.bands.map((b) => [b.label, b.x0, b.x1]), ca.timeline.phases.map((p) => [p.name, p.t0_s, p.t1_s]));
  assert.deepEqual(c.opts.vlines.map((v) => v.x), ca.timeline.events.map((e) => e.t_s));
}
assert.equal(G.phaseAt(ca, ca.timeline.phases[2].t0_s + 1), 2);
assert.equal(G.phaseAt(ca, 0), 0);
assert.deepEqual(G.timelineCharts(load("campaign-sweep-jammer-power")), [], "a sweep campaign has no timeline");

// ---- chain
const ch = load("leo-pnt-end-to-end");
const chain = G.chainModel(ch);
assert.deepEqual(chain.map((s) => s.kind), ["leo-signal", "leo-pass", "leo-navmsg", "leo-pvt", "leo-ppp"]);
assert.equal(chain.reduce((n, s) => n + s.out, 0), ch.handoffs.length, "every hand-off is counted once");
const get = (o, p) => p.match(/[^.[\]]+/g).reduce((v, k) => v[k], o);
for (const st of chain) for (const p of st.items) assert.notEqual(get(ch, p), undefined, `${p} is in the result`);

// ---- histogram
const mc = load("campaign-monte-carlo-clock-holdover");
const [mname, metric] = Object.entries(mc.monte_carlo.metrics)[0];
const hs = G.histogramSvg(metric.samples, { marks: [{ label: "p50", value: metric.p50 }] });
assert.equal(hs.bins.reduce((n, b) => n + b.count, 0), metric.samples.length, `${mname}: every sample falls in a bin`);
assert.equal(count(hs.svg, /class="h-bar"/g), hs.bins.length);
assert.equal(G.histogramSvg([1]).svg, "");

// ---- GeoJSON export (a file the native engine wrote)
const pack = JSON.parse(gunzipSync(readFileSync(new URL("../native/araim-gps-galileo.json.gz", import.meta.url))).toString("utf8"));
const gj = pack.exports.files.find((x) => x.format === "geojson");
const map = G.geojsonSvg(gj.text);
const feats = JSON.parse(gj.text).features;
assert.equal(map.total, feats.length);
assert.equal(map.features, feats.filter((x) => ["LineString", "MultiLineString", "Point"].includes(x.geometry.type)).length);
assert.equal(G.geojsonSvg("not json"), null);
assert.equal(G.geojsonSvg('{"type":"FeatureCollection","features":[]}'), null);
// A stage named like something a plain object inherits is shown by its own text, with no items.
{
  const m = G.chainModel({ handoffs: [{ from: "constructor", to: "toString" }] });
  assert.deepEqual(m.map((s) => [s.kind, s.name, s.items.length]), [["constructor", "constructor", 0], ["toString", "toString", 0]]);
}
console.log("stages.test.mjs: all assertions passed");
