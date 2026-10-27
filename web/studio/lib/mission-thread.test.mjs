import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { readThread, headline, phaseTable, budgetTable, timelineSvg, fmtSigma, fmtElapsed, SCHEMA } from "./mission-thread.mjs";

const REC = JSON.parse(readFileSync(new URL("../recorded/mission-thread-artemis-class.json", import.meta.url), "utf8"));
const { model: M, error } = readThread(REC);

test("the engine's Artemis-class result is read in full", () => {
  assert.equal(error, undefined);
  assert.equal(M.schema, SCHEMA);
  assert.equal(M.phases.length, 11);
  assert.equal(M.tier, "MODELLED");
  assert.ok(M.timeline.length > 1000);
  assert.deepEqual(M.phases.map((p) => p.id).slice(0, 3), ["ascent", "rdv-1", "rdv-2"]);
  assert.equal(M.weakest.phaseId, "descent");
  assert.equal(M.weakest.index, 6);
  assert.ok(Math.abs(M.weakest.margin - 1.2130868548744504) < 1e-12, "the margin is copied, not recomputed");
  for (const p of M.phases) assert.equal(p.tier, "MODELLED", "every phase carries the engine's own label");
});

test("a result of another schema or kind is refused, and a missing field is null, not invented", () => {
  assert.ok(readThread({ schema: "kshana-result/1" }).error);
  assert.ok(readThread(null).error);
  assert.ok(readThread({ json: "{not json" }).error);
  assert.ok(readThread({ schema: SCHEMA, phases: [] }).error, "no phases");
  const { model } = readThread({ schema: SCHEMA, phases: [{ id: "a", kind: "entry" }] });
  assert.equal(model.phases[0].peak.pos, null);
  assert.equal(phaseTable(model)[0].peakPos, "n/a");
  assert.equal(model.weakest, null);
});

test("headline counts: phases, elapsed time, limits met and missed", () => {
  const h = headline(M);
  assert.equal(h.phases, 11);
  assert.equal(h.elapsed, 947790);
  assert.equal(h.requirements, 4);
  assert.equal(h.met, 4);
  assert.equal(h.missed, 0);
});

test("the phase table flags exactly the engine's weakest link", () => {
  const rows = phaseTable(M);
  assert.equal(rows.length, 11);
  assert.deepEqual(rows.filter((r) => r.weakest).map((r) => r.id), ["descent"]);
  const d = rows.find((r) => r.id === "descent");
  assert.match(d.marginText, /1\.21× the limit, met/);
  assert.equal(rows.find((r) => r.id === "rdv-1").marginText, "no limit stated");
});

test("the budget of a phase: every row with its unit and label, the largest position term flagged", () => {
  const b = budgetTable(M, 0);
  assert.equal(b.phase.id, "ascent");
  assert.equal(b.rows.length, 3);
  assert.equal(b.rows[0].sigma, 60.67742578587196, "largest first");
  assert.equal(b.rows[0].limiting, true);
  assert.equal(b.rows.filter((r) => r.limiting).length, 1);
  assert.deepEqual(b.rows.map((r) => r.unit).sort(), ["m", "m", "s"]);
  assert.ok(b.rows.every((r) => r.tier === "MODELLED"));
  assert.equal(b.rows[0].shown, "60.7 m");
  assert.ok(b.events.length >= 4 && b.events[0].what.startsWith("liftoff"));
  assert.equal(budgetTable(M, 99).phase.id, "ascent", "an index out of range falls back to the first phase");
});

test("number and time formatting copies the value with its unit", () => {
  assert.equal(fmtSigma(8.660254037844386, "m"), "8.66 m");
  assert.equal(fmtSigma(1.5e4, "m"), "15 km");
  assert.equal(fmtSigma(1e-7, "s"), "100 ns");
  assert.equal(fmtSigma(0.0589435, "m/s"), "0.059 m/s");
  assert.equal(fmtSigma(null, "m"), "n/a");
  assert.equal(fmtElapsed(540), "9 min");
  assert.equal(fmtElapsed(60), "60 s");
  assert.equal(fmtElapsed(947790), "11 d");
  assert.equal(fmtElapsed(10740), "2.98 h");
});

test("the timeline: one band per phase, a limit line where a limit is stated, the weakest link named", () => {
  for (const layout of ["phases", "time"]) {
    const svg = timelineSvg(M, { metric: "pos", layout });
    assert.equal((svg.match(/class="mtv-band/g) || []).length, 11, layout);
    assert.equal((svg.match(/class="mtv-lim"/g) || []).length, 4, "four phases state a position limit");
    assert.equal((svg.match(/class="mtv-band[^"]*weak"/g) || []).length, 1);
    assert.match(svg, /weakest link/);
    assert.ok((svg.match(/<path class="mtv-line"/g) || []).length >= 10, "a path per phase: a handover is a break");
    assert.doesNotMatch(svg, /NaN|undefined|Infinity/);
  }
  for (const metric of ["vel", "time"]) { const svg = timelineSvg(M, { metric }); assert.doesNotMatch(svg, /NaN|undefined|Infinity/); assert.match(svg, /<svg/); }
  const empty = timelineSvg(readThread({ schema: SCHEMA, phases: [{ id: "a", start: 0, end: 1 }] }).model, { metric: "pos" });
  assert.match(empty, /no samples/);
});

test("text in the SVG is escaped", () => {
  const evil = { schema: SCHEMA, phases: [{ id: "<img src=x onerror=1>", kind: "k", start: 0, end: 10, peak_sigma_pos_m: 5, requirement: { max_pos_m: 9 } }], timeline: [{ phase_index: 0, t_s: 0, sigma_pos_m: 4 }, { phase_index: 0, t_s: 10, sigma_pos_m: 5 }] };
  const svg = timelineSvg(readThread(evil).model, { metric: "pos" });
  assert.doesNotMatch(svg, /<img/);
});
