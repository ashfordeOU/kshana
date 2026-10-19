// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { loadDemo } from "./replay-demos.mjs";
import { makeView, stateAt, vesselPath } from "./replay.mjs";
import { trackStatic, trackDynamic, stripStatic, stripDynamic, readoutOf, frameSvg, bandRuns, niceLen, TRACK, SVG_CSS } from "./replay-draw.mjs";
import { skyMarkup, skyDescribe } from "./skydraw.mjs";
import { frameTimes, animatedSvg, framesZip, frameRecord, MAX_FRAMES } from "./replay-export.mjs";

const here = new URL("../", import.meta.url).pathname;
const io = { json: async (p) => JSON.parse(readFileSync(here + p, "utf8")), text: async (p) => readFileSync(here + p, "utf8") };
const coast = JSON.parse(readFileSync(here + "replay/data/coast.json", "utf8"));
const world = JSON.parse(readFileSync(here + "data/land.json", "utf8"));
const fjord = await loadDemo("fjord-natural-degradation", io, coast, world), drag = await loadDemo("coastal-drag-off", io, coast, world), masked = await loadDemo("masked-sky", io, coast, world);
const viewOf = (p) => makeView(p, { rings: p.region && p.region.rings });
const tMax = Math.max(fjord.t1, drag.t1);

test("the static track layer carries the coast, both tracks, the scale and the illustration label", () => {
  const s = trackStatic(drag, viewOf(drag), { uid: "a" });
  assert.match(s, /class="rp-land"/); assert.match(s, /class="rp-truth"/); assert.match(s, /rp-rep rp-fade rp-b-untrusted/);
  assert.match(s, /illustration only/); assert.match(s, /clip-path="url\(#rp-clip-a\)"/);
  assert.doesNotMatch(trackStatic(drag, viewOf(drag), { showCoast: false }), /rp-land/);
});
test("the dynamic layer draws the true vessel along its heading, the error ring to scale and the reported vessel along its course", () => {
  const v = viewOf(drag), st = stateAt(drag, 800), r = st.row, d = trackDynamic(drag, v, st);
  const [tx, ty] = v.px(r.truth);
  assert.ok(d.includes(`d="${vesselPath(tx, ty, r.hdg, 22)}"`), "true glyph at the true position, along the gyro heading");
  const ring = d.match(/<circle class="rp-ring" cx="([\d.]+)" cy="([\d.]+)" r="([\d.]+)"/);
  assert.ok(ring, "an error ring"); assert.ok(Math.abs(Number(ring[3]) - r.errM * v.k) < 0.06, "radius = error in metres at the view's scale");
  assert.match(d, /rp-gr rp-b-untrusted/); assert.match(d, /rp-cog/);
  assert.ok(r.errM > 300, `the drag-off error at T+800 s is large (${r.errM} m)`);
});
test("no ring and no reported vessel where the log has no fix", () => {
  const p = drag, i = p.rows.findIndex((r) => !r.fixValid);
  if (i < 0) return;
  const d = trackDynamic(p, viewOf(p), stateAt(p, p.rows[i].t));
  assert.doesNotMatch(d, /rp-gr|rp-ring/);
});
test("the score strip draws the engine's score, its events and the cursor at the state's time", () => {
  const s = stripStatic(drag, TRACK, tMax), c = stripDynamic(drag, TRACK, tMax, stateAt(drag, 600));
  assert.match(s, /rp-line/); assert.match(s, /rp-ev/); assert.match(s, /rp-f-untrusted/);
  const x = Number(c.match(/x1="([\d.]+)"/)[1]); assert.ok(Math.abs(x - (8 + (600 / tMax) * (TRACK - 16))) < 0.06);
});
test("the readout says what the row says", () => {
  const ro = readoutOf(drag, stateAt(drag, 800));
  assert.equal(ro.band, "untrusted"); assert.equal(ro.fix, "fix reported"); assert.match(ro.err, /m$/); assert.match(ro.sky, /satellites heard/);
});
test("the skyplot marks listed-but-silent satellites hollow and shades the unheard sector", () => {
  const before = stateAt(masked, 595).sky, after = stateAt(masked, 600).sky;
  const a = skyMarkup(before), b = skyMarkup(after);
  assert.doesNotMatch(a, /sk-quiet|sk-un/);
  assert.match(b, /sk-un/); assert.ok((b.match(/sk-quiet/g) || []).length >= 3 && (b.match(/sk-heard/g) || []).length >= 3);
  assert.match(skyDescribe(after), /no signal from azimuth 1[5-8]0 to /);
  assert.equal(skyDescribe(null), "No satellites listed in the log at this time.");
});
test("band runs are broken where there is no fix and never cross a band change", () => {
  for (const r of bandRuns(drag)) { const bands = new Set(r.idx.map((i) => drag.rows[i].band)); assert.ok(bands.size <= 2 && bands.has(r.band)); }
  assert.equal(niceLen(2500), 2000); assert.equal(niceLen(7000), 5000); assert.ok(niceLen(7) > 0);
});
test("frame times: at least the finest sample interval, at most MAX_FRAMES, ending at the end", () => {
  const { step, times } = frameTimes([masked, drag], masked.t1);
  assert.ok(step >= 1 && times.length <= MAX_FRAMES + 1); assert.equal(times[times.length - 1], masked.t1); assert.equal(times[0], 0);
});
test("a frame is a standalone, themed SVG with the advisory line and no scripts", () => {
  const svg = frameSvg([fjord, drag], [viewOf(fjord), viewOf(drag)], tMax, 800);
  assert.match(svg, /^<svg xmlns="http:\/\/www\.w3\.org\/2000\/svg" viewBox="0 0 1224 /); assert.match(svg, /prefers-color-scheme:dark/);
  assert.match(svg, /not type-approved navigation equipment/); assert.doesNotMatch(svg, /<script|onload|href=/i);
  assert.ok(svg.includes(SVG_CSS.split("\n")[1]));
});
test("the frames match the rows: every manifest record equals the panel's row at that time", async () => {
  const panels = [fjord, drag], views = panels.map(viewOf);
  const bytes = framesZip(panels, views, tMax, { stepS: 100 });
  const text = Buffer.from(bytes).toString("latin1");
  assert.ok(text.includes("frame-0000.svg") && text.includes("manifest.json") && text.includes("README.txt"));
  const rec = frameRecord(panels, 800, 8), r = drag.rows.find((x) => x.t === 800);
  assert.equal(rec.panels[1].error_m, r.errM); assert.equal(rec.panels[1].score, r.score); assert.equal(rec.panels[1].heading_deg, r.hdg);
  const log = JSON.parse(readFileSync(here + "training/demo/coastal-drag-off.instructor.json", "utf8")).track.find((x) => x.t_s === 800);
  assert.equal(rec.panels[1].error_m, log.position_error_m, "the frame's error is the instructor log's own");
  assert.equal(rec.panels[1].course_deg, log.reported_cog_deg);
});
test("the animated SVG shows each frame once per loop and stays a sane size", () => {
  const panels = [fjord, drag], views = panels.map(viewOf);
  const svg = animatedSvg(panels, views, tMax, { speed: 60, stepS: 30 });
  const n = (svg.match(/class="rp-frame"/g) || []).length, an = (svg.match(/<animate /g) || []).length;
  assert.equal(n, an); assert.ok(n >= 40 && n <= MAX_FRAMES + 1);
  assert.match(svg, /calcMode="discrete"/); assert.ok(svg.length < 3_000_000, String(svg.length));
});

test("the fjord track carries a halo and a words label from the log where it hears no signal, and the coast note says why it is hidden", () => {
  const fj = trackStatic(fjord, viewOf(fjord));
  assert.match(fj, /class="rp-quiet"/); assert.match(fj, />no signal from the west</); assert.match(fj, />T\+\d+:\d\d to \d+:\d\d \(from the log\)</); assert.match(fj, /\(from the log\)/);
  assert.match(fj, /coast hidden: this log&#39;s invented positions fall on land/);
  assert.doesNotMatch(trackStatic(drag, viewOf(drag)), /rp-quiet"/);
});
