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

test("every phase's budget table carries every row of the engine result, the five lunar phases included", () => {
  const raw = JSON.parse(REC.json);
  assert.equal(M.phases.length, raw.phases.length);
  const lunar = M.phases.filter((p) => p.kind.startsWith("lunar-"));
  assert.deepEqual(lunar.map((p) => p.id), ["lunar-orbit", "descent", "surface", "ascent-lunar", "redock"]);
  raw.phases.forEach((rp, i) => {
    const b = budgetTable(M, i);
    assert.equal(b.rows.length, rp.budget_rows.length, `${rp.id}: every budget row is in the table`);
    assert.deepEqual([...b.rows.map((r) => r.source)].sort(), rp.budget_rows.map((r) => String(r.source)).sort(), `${rp.id}: the same contributions, none added or dropped`);
    assert.deepEqual([...b.rows.map((r) => r.sigma)].sort(), rp.budget_rows.map((r) => r.sigma).sort(), `${rp.id}: the engine's own numbers`);
  });
  assert.deepEqual(lunar.map((p) => budgetTable(M, p.index).rows.length), [8, 7, 2, 3, 4], "rows per lunar phase in the recorded 0.40.0 result");
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
  assert.equal(b.limitingSource, "inertial dead reckoning", "the engine's own name for what limits the phase");
  assert.equal(b.limitingInTable, false, "the engine names a source of the phase, not a row: no row is flagged in its place");
  assert.equal(b.rows.filter((r) => r.limiting).length, 0);
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

// The engine is the authority on what limits a phase: the view flags the row whose source is exactly the engine's `limiting_source`,
// in every phase. Where the engine names a source of the phase that no row carries (the Earth phases), no row is flagged and the view
// states the engine's text; the largest row is never flagged in its place.
test("the limiting row of EVERY phase is the engine's limiting_source, nothing else", () => {
  const engine = JSON.parse(REC.json).phases;
  assert.equal(engine.length, M.phases.length);
  let inTable = 0, named = 0;
  engine.forEach((ep, i) => {
    assert.equal(typeof ep.limiting_source, "string", `phase ${ep.id} has an engine limiting_source`);
    assert.ok(ep.limiting_source.length > 0, ep.id);
    const b = budgetTable(M, i);
    assert.equal(b.phase.id, ep.id);
    assert.equal(b.limitingSource, ep.limiting_source, `${ep.id}: the view states the engine's text`);
    const exact = ep.budget_rows.filter((r) => r.source === ep.limiting_source);
    const flagged = b.rows.filter((r) => r.limiting);
    assert.equal(b.limitingInTable, exact.length > 0, ep.id);
    if (exact.length) {
      inTable++;
      assert.equal(flagged.length, 1, `${ep.id}: exactly one row flagged`);
      assert.equal(flagged[0].source, ep.limiting_source, `${ep.id}: the flagged row is the engine's`);
      assert.equal(flagged[0].sigma, exact[0].sigma, ep.id);
      assert.equal(flagged[0].unit, exact[0].unit, ep.id);
    } else {
      named++;
      assert.equal(flagged.length, 0, `${ep.id}: the engine's source "${ep.limiting_source}" is not a row; none is flagged`);
    }
  });
  assert.equal(inTable + named, engine.length);
  assert.ok(inTable >= 1, "at least the lunar phases carry the engine's source as a row");
});

test("a surface phase is limited by its timing floor (unit s), not by the larger position row", () => {
  const i = M.phases.findIndex((p) => p.kind === "lunar-surface");
  assert.ok(i >= 0);
  const b = budgetTable(M, i);
  const f = b.rows.filter((r) => r.limiting);
  assert.equal(f.length, 1);
  assert.equal(f[0].unit, "s");
  assert.match(f[0].source, /timing floor/);
  assert.ok(b.rows.some((r) => r.unit === "m" && r.limiting === false), "the position row is shown but not flagged");
});
