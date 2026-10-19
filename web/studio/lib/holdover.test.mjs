// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { SCENARIOS, readHoldover, seriesFor, teSvg, curvesSvg, stepRows, holdoverRows } from "./holdover.mjs";

const here = new URL("../", import.meta.url).pathname;
const load = (id) => JSON.parse(readFileSync(here + `recorded/${id}.json`, "utf8"));
const models = Object.fromEntries(SCENARIOS.map((s) => [s.id, readHoldover(load(s.id)).model]));

test("both holdover-test recordings open and carry the engine's numbers unchanged", () => {
  assert.equal(SCENARIOS.length, 2);
  for (const sc of SCENARIOS) {
    const doc = load(sc.id), raw = JSON.parse(doc.json), { model, error } = readHoldover(doc);
    assert.equal(error, undefined, sc.id);
    assert.equal(model.steps.length, 3); assert.deepEqual(model.steps.map((s) => s.name), ["baseline", "holdover", "recovery"]);
    assert.equal(model.holdover.maxNs, raw.holdover.te_at_max_abs_ns); assert.equal(model.test.removedS, raw.test.gnss_removed_s); assert.equal(model.envelope.tExceedS, raw.holdover_envelope.time_to_exceed_s);
    assert.equal(model.masks[0].checks[0].limitNs, raw.masks[0].checks[0].limit_ns); assert.equal(model.verdicts.holdover_masks, raw.verdicts.holdover_masks);
    assert.match(model.label, /^MODELLED/); assert.match(model.label, /measured against the mask/); assert.ok(model.notCovered.length >= 4);
    assert.match(model.test.statedBy, /not verified by Kshana/);
  }
});

// A SHAPE FIXTURE, not engine output: the record the example scenario states, written into record.series the way the engine is asked to
// (time_s, time_error_ns), so the drawing can be tested before the engine writes one. The helper reads the scenario text only here, in the test.
function withSeries(id, decimate = 1) {
  const doc = load(id), raw = JSON.parse(doc.json), toml = readFileSync(here + `scenarios/${id}.toml`, "utf8");
  let t, te;
  const log = [...toml.matchAll(/ptp4l\[(\d+(?:\.\d+)?)\]:\s+master offset\s+(-?\d+)/g)];
  if (log.length) { t = log.map((m) => Number(m[1]) - Number(log[0][1])); te = log.map((m) => Number(m[2])); }
  else { const pairs = [...toml.slice(toml.indexOf("samples")).matchAll(/\[\s*(-?[\d.]+)\s*,\s*(-?[\d.]+)\s*\]/g)]; t = pairs.map((m) => Number(m[1])); te = pairs.map((m) => Number(m[2])); }
  raw.record.series = { time_s: t.filter((_, k) => k % decimate === 0), time_error_ns: te.filter((_, k) => k % decimate === 0) };
  return { raw, doc: { ...doc, json: JSON.stringify(raw) } };
}

test("the recorded results carry the engine's own series, and it is the record the scenario holds", () => {
  for (const sc of SCENARIOS) {
    const { series, from } = seriesFor(models[sc.id]);
    assert.ok(series, sc.id); assert.equal(from, "the result's record", "601 of 601 samples: not decimated");
    const mine = withSeries(sc.id).raw.record.series; // read from the scenario text, in the test only
    assert.deepEqual(series.t, mine.time_s, "the engine's time axis is the scenario's"); assert.equal(series.te.length, mine.time_error_ns.length); assert.ok(series.te.every((v, k) => Math.abs(v - mine.time_error_ns[k]) < 1e-6), "the engine's samples are the scenario's (to rounding in the unit conversion)");
    assert.doesNotMatch(teSvg(models[sc.id], series), /No time-error curve/);
  }
});
test("a result without record.series is drawn without a curve and says so", () => {
  const { raw } = withSeries("holdover-test-example"); delete raw.record.series;
  const m = readHoldover({ ...load("holdover-test-example"), json: JSON.stringify(raw) }).model, { series, why } = seriesFor(m);
  assert.equal(series, null); assert.match(why, /carries no time-error samples \(record\.series\)/);
  assert.match(teSvg(m, series), /No time-error curve/);
});
test("a result's record.series is drawn, in either shape, whole or decimated, and nothing else is", () => {
  for (const sc of SCENARIOS) {
    const { raw, doc } = withSeries(sc.id), { model } = readHoldover(doc), { series, from } = seriesFor(model);
    assert.ok(series); assert.equal(from, "the result's record"); assert.equal(series.t.length, raw.record.n_samples);
    assert.equal(Math.max(...series.te.map(Math.abs)), Math.max(raw.steps[0].max_abs_te_ns, raw.steps[1].max_abs_te_ns, raw.recovery.peak_abs_te_ns), "the largest sample drawn is the largest the engine scored");
    const dec = seriesFor(readHoldover(withSeries(sc.id, 3).doc).model);
    assert.match(dec.from, /decimated to \d+ of \d+ samples/);
  }
  const { raw } = withSeries("holdover-test-example"); raw.record.series = raw.record.series.time_s.map((t, k) => [t, raw.record.series.time_error_ns[k]]);
  assert.ok(seriesFor(readHoldover({ ...load("holdover-test-example"), json: JSON.stringify(raw) }).model).series, "pairs are read too");
});
test("a series that is not a plausible record is refused with a reason", () => {
  const { raw } = withSeries("holdover-test-example");
  const bad = (s) => { const r = structuredClone(raw); r.record.series = s; return seriesFor(readHoldover({ ...load("holdover-test-example"), json: JSON.stringify(r) }).model); };
  assert.match(bad({ time_s: [0], time_error_ns: [1] }).why, /not a time series/);
  assert.match(bad({ time_s: [0, 5, 5], time_error_ns: [1, 2, 3] }).why, /not a time series/);
  assert.match(bad({ time_s: Array.from({ length: 700 }, (_, k) => k), time_error_ns: new Array(700).fill(0) }).why, /700 samples where the engine scored 601/);
  assert.equal(bad({ time_s: [0, 1], time_error_ns: [1] }).series, null, "mismatched arrays are not a series");
});
test("the time-error chart marks the phases, the operator's two times, the mask limits and the exceedances, from the result", () => {
  for (const sc of SCENARIOS) {
    const m = readHoldover(withSeries(sc.id).doc).model, svg = teSvg(m, seriesFor(m).series);
    for (const p of ["Baseline: locked", "Holdover: GNSS removed", "Recovery: GNSS restored"]) assert.ok(svg.includes(p), p);
    assert.match(svg, /GNSS removed \(stated by the operator\)/); assert.match(svg, /GNSS restored \(stated by the operator\)/);
    assert.match(svg, /±100 ns baseline mask/); assert.match(svg, /class="ho-line"/); assert.match(svg, /Recovery band ±100 ns/);
    assert.match(svg, /ePRTC-A holdover envelope first exceeded/);
  }
  });
test("MTIE and TDEV are drawn from the engine's curves with the mask limits as markers", () => {
  const m = models["holdover-test-example"];
  for (const w of ["mtie", "tdev"]) { const svg = curvesSvg(m, w); assert.match(svg, /ho-cv/); assert.match(svg, /ho-mk/); assert.ok(svg.includes("baseline") && svg.includes("holdover")); }
  assert.match(curvesSvg({ curves: [], masks: [] }, "mtie"), /No MTIE curve/);
});
test("the tables say what the result says, with units and without a verdict of the page's own", () => {
  const m = models["holdover-test-ptp4l"];
  assert.equal(stepRows(m).length, 3); assert.ok(holdoverRows(m).some(([k, v]) => /Recovery/.test(k) && /inside ±100 ns/.test(v)));
  assert.ok(holdoverRows(m).some(([k, v]) => /envelope/.test(k) && /FAIL/.test(v)));
  assert.match(readHoldover({ json: "{}" }).error, /not a holdover-test result/); assert.match(readHoldover({ json: "{" }).error, /not JSON/);
});
