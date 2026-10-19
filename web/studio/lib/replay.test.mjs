// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { makeClock, advance, play, pause, seek, stepBy, stepMark, setSpeed, SPEEDS, stateAt, makeView, vesselPath, ringPx, rayEnd, coastFor, pointInLand, sectorWords, quietSpans, fmtT, fmtDur, marksOf } from "./replay.mjs";
import { loadDemo, DEMO_LIST, DEFAULT_PAIR } from "./replay-demos.mjs";

const here = new URL("../", import.meta.url).pathname;
const io = { json: async (p) => JSON.parse(readFileSync(here + p, "utf8")), text: async (p) => readFileSync(here + p, "utf8") };
const coast = JSON.parse(readFileSync(here + "replay/data/coast.json", "utf8"));
const world = JSON.parse(readFileSync(here + "data/land.json", "utf8"));
const panels = {};
for (const d of DEMO_LIST) panels[d.id] = await loadDemo(d.id, io, coast, world);

test("the clock advances by speed, stops at the end, and restarts from zero", () => {
  let c = play(makeClock(100, 10));
  c = advance(c, 1000); assert.equal(c.t, 10);
  c = advance(c, 100000); assert.equal(c.t, 100); assert.equal(c.playing, false);
  assert.equal(play(c).t, 0);
  assert.equal(advance(pause(c), 5000).t, c.t, "paused: no movement");
  assert.equal(setSpeed(c, 7).speed, c.speed, "an unknown speed is refused");
  assert.ok(SPEEDS.includes(setSpeed(c, 60).speed));
});
test("stepping and seeking stay inside the run and pause", () => {
  const c = play(makeClock(50));
  assert.equal(stepBy(c, -5).t, 0); assert.equal(stepBy(c, 999).t, 50); assert.equal(stepBy(c, 3).playing, false);
  assert.equal(seek(c, NaN).t, 0);
  const marks = [10, 20, 30];
  assert.equal(stepMark(seek(c, 10), 1, marks).t, 20); assert.equal(stepMark(seek(c, 10), -1, marks).t, 0);
  assert.equal(stepMark(seek(c, 30), 1, marks).t, 50);
});
test("fmtT is a clock time and fmtDur a length of time", () => { assert.equal(fmtT(90), "90 s"); assert.equal(fmtT(125), "2:05"); assert.equal(fmtDur(80), "80 s"); assert.equal(fmtDur(760), "12 min 40 s"); assert.equal(fmtDur(600), "10 min"); });

test("every demo loads, with a score where the engine scored it and a sky where the log has GSV", () => {
  assert.equal(DEMO_LIST.length, 7);
  for (const [id, p] of Object.entries(panels)) {
    assert.ok(p.rows.length > 100, id); assert.ok(p.hasScore, `${id} has a score`); assert.ok(p.hasSky, `${id} has a sky`); assert.ok(p.hasTruth, `${id} has a true track`);
    assert.ok(p.verdict.text.endsWith("."), id);
  }
  assert.deepEqual(DEFAULT_PAIR.every((id) => panels[id]), true);
});

test("a training panel's rows are the instructor log's own: error, true heading and reported course match the JSON", () => {
  const log = JSON.parse(readFileSync(here + "training/demo/coastal-drag-off.instructor.json", "utf8"));
  const p = panels["coastal-drag-off"];
  assert.equal(p.rows.length, log.track.length);
  for (let i = 0; i < log.track.length; i += 17) {
    const j = log.track[i], r = p.rows[i];
    assert.equal(r.t, j.t_s); assert.equal(r.errM, j.position_error_m); assert.equal(r.hdg, j.true_heading_deg); assert.equal(r.cog, j.reported_cog_deg);
    assert.deepEqual(r.truth, [j.true_lat_deg, j.true_lon_deg]); assert.deepEqual(r.rep, [j.reported_lat_deg, j.reported_lon_deg]);
  }
});

test("the drag-off is caught: the score leaves nominal after the onset and the verdict says how long after", () => {
  const v = panels["coastal-drag-off"].verdict;
  assert.equal(v.onsetS, 420);
  assert.ok(v.latencyS > 0 && v.latencyS < 120, `latency ${v.latencyS}`);
  assert.ok(v.lowest.score <= 55 && v.untrustedS > 300);
  assert.ok(v.peakErr.m > 1300 && v.peakErr.m < 1500, `peak ${v.peakErr.m}`);
  assert.match(v.text, /10 s after the first event began \(T\+7:00\)/);
});
test("a natural degradation costs points but never reaches untrusted, and the verdict says so", () => {
  const v = panels["fjord-natural-degradation"].verdict;
  assert.equal(v.untrustedS, 0); assert.ok(v.degradedS > 0);
  assert.match(v.text, /80 s degraded, none untrusted/);
});

test("the masked-sky demo shows the half sky blanking at T+600 s, with the same satellites listed", () => {
  const p = panels["masked-sky"];
  const a = stateAt(p, 595).sky, b = stateAt(p, 600).sky;
  assert.equal(a.length, b.length);
  assert.ok(a.every((s) => s[4] != null) && b.filter((s) => s[3] >= 180).every((s) => s[4] == null) && b.filter((s) => s[3] < 180).every((s) => s[4] != null));
  assert.equal(p.verdict.onsetS, 600);
});

test("stateAt holds the last row at or before t and reports the end", () => {
  const p = panels["tallinn-helsinki"];
  const s = stateAt(p, 1234.6); assert.equal(s.row.t, 1234); assert.equal(s.ended, false);
  assert.equal(stateAt(p, p.t1 + 5).ended, true);
  assert.equal(stateAt(p, -4).i, 0);
  assert.equal(stateAt(panels["coastal-drag-off"], 425).row.t, 420);
});

test("the coastline is bundled for every demo's window; windows with no land say so", () => {
  const dover = coastFor(panels["coastal-drag-off"], coast, world);
  assert.ok(dover.rings.length >= 1 && dover.scale === "1:10m");
  for (const id of ["tallinn-helsinki", "masked-sky", "fjord-natural-degradation"]) {
    const c = coastFor(panels[id], coast, world);
    assert.equal(c.rings.length, 0, `${id}: a true track that runs over land at 1:10m gets no coast`); assert.match(c.hidden, /^coast hidden: this log's invented positions fall on land$/);
  }
  assert.ok(coastFor(panels["coastal-drag-off"], coast, world).rings.length >= 1 && !coastFor(panels["coastal-drag-off"], coast, world).hidden, "the drag-off stays at sea, so its coast is drawn");
  assert.equal(pointInLand([[[0, 0], [10, 0], [10, 10], [0, 10]]], 5, 5), true); assert.equal(pointInLand([[[0, 0], [10, 0], [10, 10], [0, 10]]], 15, 5), false);
  assert.equal(coastFor(panels["open-sea-jamming"], coast, world).rings.length, 0);
  assert.equal(coastFor({ id: "elsewhere", rows: [{ truth: [-20, 60], rep: null }] }, coast, world), null, "no land near a track in the South Pacific");
});
test("the view fits the track, widens to a near coast but never beyond six times the track", () => {
  const p = panels["coastal-drag-off"], r = coastFor(p, coast, world);
  const plain = makeView(p), wide = makeView(p, { rings: r.rings });
  assert.equal(plain.widened, false); assert.ok(wide.spanM >= plain.spanM && wide.spanM <= plain.trackM * 6 + 1);
  const [x, y] = plain.px(p.rows[0].truth); assert.ok(x > 0 && x < 600 && y > 0 && y < 600);
  const d = coastFor(panels["coastal-drag-off"], coast, world), dv = makeView(panels["coastal-drag-off"], { rings: d.rings });
  assert.ok(dv.nearestM > 0, "the nearest land is measured");
  assert.ok(dv.spanM <= dv.trackM * 6 + 1);
});
test("north is up and east is right in the view", () => {
  const v = makeView(panels["tallinn-helsinki"]);
  const [x0, y0] = v.px([59.5, 24.8]), [x1, y1] = v.px([59.6, 24.9]);
  assert.ok(x1 > x0 && y1 < y0);
});
test("the vessel glyph points along its heading, and the error ring is to scale", () => {
  const up = vesselPath(100, 100, 0), east = vesselPath(100, 100, 90);
  assert.match(up, /^M100\.00 ([\d.]+)L/); assert.ok(Number(up.match(/^M100\.00 ([\d.]+)/)[1]) < 100, "bow is above the centre when heading north");
  assert.ok(Number(east.match(/^M([\d.]+) 100\.00/)[1]) > 100, "bow is right of the centre when heading east");
  const [x, y] = rayEnd(0, 0, 90, 10); assert.ok(Math.abs(x - 10) < 1e-9 && Math.abs(y) < 1e-9);
  assert.equal(ringPx(100, { k: 0.5 }).r, 50); assert.equal(ringPx(1, { k: 0.5 }).tiny, true);
});
test("marksOf lists event times and band changes after calibration, once each", () => {
  const rows = [{ t: 0, band: "calibrating" }, { t: 1, band: "nominal" }, { t: 2, band: "nominal" }, { t: 3, band: "degraded" }, { t: 4, band: "nominal" }];
  assert.deepEqual(marksOf([{ onset: 3, end: 9 }], rows), [3, 4, 9]);
});

test("sectorWords names the quarters of the horizon a sector covers, and every direction when all four", () => {
  assert.equal(sectorWords([{ from: 240, to: 270 }]), "west");
  assert.equal(sectorWords([{ from: 60, to: 120 }, { from: 240, to: 300 }]), "east and west");
  assert.equal(sectorWords([{ from: 150, to: 360 }]), "north, south and west");
  assert.equal(sectorWords([{ from: 0, to: 360 }]), "every direction");
  assert.equal(sectorWords([]), "");
});
test("quiet spans come from the log's GSV: the fjord log hears nothing from the west for a stretch, a clean run has none, and a one-satellite dropout is not drawn", () => {
  const f = quietSpans(panels["fjord-natural-degradation"]);
  assert.ok(f.length >= 1 && f[0].words.includes("west") && f[0].t0 >= 300 && f[0].t1 - f[0].t0 >= 30, JSON.stringify(f));
  assert.deepEqual(quietSpans(panels["coastal-drag-off"]), []);
  assert.equal(quietSpans(panels["masked-sky"])[0].t0, 600, "the masked sky goes quiet at T+600 s");
  assert.deepEqual(quietSpans({ hasSky: false, rows: [] }), []);
});
