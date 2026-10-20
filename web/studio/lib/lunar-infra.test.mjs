// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { SCENARIOS, STUDIES, readLi, readBars, barsOf, missesOf, missNote, barsTable, chartsOf, factRows } from "./lunar-infra.mjs";

const here = new URL("../", import.meta.url).pathname;
const load = (id) => JSON.parse(readFileSync(here + `recorded/${id}.json`, "utf8"));
const models = (sc) => sc.files.map((f) => readLi(load(f)).model);
const bars = readBars(JSON.parse(readFileSync(here + "lunar-infra/bars.json", "utf8"))).bars;
const tab = (id) => SCENARIOS.find((s) => s.id === id);

test("every tab opens its recorded results in its study, and the result's own label comes through", () => {
  assert.equal(SCENARIOS.length, 5); assert.deepEqual(SCENARIOS.map((s) => s.study), STUDIES);
  for (const sc of SCENARIOS) for (const f of sc.files) {
    const doc = load(f), raw = JSON.parse(doc.json), { model, error } = readLi(doc);
    assert.equal(error, undefined, f); assert.equal(model.study, sc.study); assert.equal(model.label, raw.label); assert.match(model.label, /^MODELLED/);
  }
  assert.equal(tab("od-consistency").files.length, 2, "the OD tab shows nominal and injected error side by side");
});
test("numbers are the results' own: OD consistency, carrier phase, frame, space tie, geodesy", () => {
  const [nom, inj] = models(tab("od-consistency")), rawN = JSON.parse(load("lunar-infrastructure-od-consistency").json), rawI = JSON.parse(load("lunar-infrastructure-od-consistency-model-error").json);
  assert.equal(nom.gnss.pos, rawN.gnss_estimate.position_sigma_m); assert.equal(nom.cons.meanQ, rawN.consistency.mean_q); assert.equal(inj.cons.modelErr, rawI.consistency.model_error_accel_m_s2); assert.equal(inj.cons.exceeding, rawI.consistency.fraction_exceeding_95);
  const cp = models(tab("carrier-phase"))[0], rawC = JSON.parse(load("lunar-infrastructure-carrier-phase").json);
  assert.equal(cp.arcs.length, rawC.arcs.length); assert.equal(cp.arcs[0].mc, rawC.arcs[0].monte_carlo_success_rate); assert.equal(cp.wavelengthM, rawC.wavelength_m);
  const fr = models(tab("frame-coestimation"))[0], rawF = JSON.parse(load("lunar-infrastructure-frame-coestimation").json);
  assert.equal(fr.lambdaRatio, rawF.lambda_min_ratio); assert.deepEqual(fr.withLinks.eig, rawF.with_orbiter_links.eigenvalues); assert.equal(fr.sets.trace, rawF.random_station_sets.trace_not_larger);
  const st = models(tab("space-tie"))[0], rawS = JSON.parse(load("lunar-infrastructure-space-tie").json);
  assert.equal(st.arcs[0].sweep.length, rawS.arcs[0].sweep.length); assert.equal(st.arcs[0].sweep[0].floor, rawS.arcs[0].sweep[0].floor_translation_sigma_m);
  const ge = models(tab("geodesy-sensitivity"))[0], rawG = JSON.parse(load("lunar-infrastructure-geodesy-sensitivity").json);
  assert.equal(ge.subsets.length, rawG.subsets.length); assert.deepEqual(ge.sigmaNom, rawG.crlb_sigma_over_nominal_h2_k2_l2); assert.equal(ge.adding.trace, rawG.adding_a_family.trace_not_larger);
});
test("no study draws a time series (the results carry none), and each has its charts and its bars table", () => {
  for (const sc of SCENARIOS) {
    const ch = chartsOf(models(sc), bars), ids = ch.map((c) => c.id);
    assert.ok(ids.includes("bars"), sc.id); assert.ok(ch.length >= 3, sc.id);
    for (const c of ch) assert.ok(c.title && (c.svg || c.html), `${sc.id} ${c.id}`);
  }
});
test("the misses are stated in the bars' own words: C3, Q3 (partly), G3, and integer fixing not reached", () => {
  const miss = (st) => missesOf(bars, st).map((b) => `${b.id}:${b.status}`);
  assert.deepEqual(miss("od-consistency"), ["C3:not-met"]); assert.deepEqual(miss("carrier-phase"), ["Q3:mixed"]); assert.deepEqual(miss("geodesy-sensitivity"), ["G3:not-met"]);
  assert.deepEqual(miss("frame-coestimation"), []); assert.deepEqual(miss("space-tie"), []);
  assert.match(missNote(bars, "od-consistency"), /C3 is NOT MET/); assert.match(missNote(bars, "carrier-phase"), /Q3 is PARTLY MET/); assert.match(missNote(bars, "carrier-phase", models(tab("carrier-phase"))), /^Integer ambiguity fixing is NOT achieved/);
  const fix = chartsOf(models(tab("carrier-phase")), bars).find((c) => c.id === "fix").note; assert.match(fix, /Integer fixing is NOT achieved/);
  const od = chartsOf(models(tab("od-consistency")), bars).find((c) => c.id === "q").note; assert.match(od, /detection rate/);
  const t = barsTable(bars, "geodesy-sensitivity"); assert.match(t, /NOT MET/); assert.ok(!/VALIDATED|conformant|certified/i.test(t.replace(/nothing is VALIDATED/i, "")));
  assert.equal(barsOf(bars, "od-consistency").length, 4);
});
test("the injected error shows beside the nominal run, and the OD chart says which is which", () => {
  const q = chartsOf(models(tab("od-consistency")), bars).find((c) => c.id === "q").svg;
  assert.match(q, />nominal</); assert.match(q, /injected error/);
});
test("another kind, another study, a broken file or a foreign bars file is refused with a reason", () => {
  assert.match(readLi({ json: JSON.stringify({ kind: "other" }) }).error, /not a lunar-infrastructure/);
  assert.match(readLi({ json: JSON.stringify({ kind: "lunar-infrastructure", study: "warp" }) }).error, /does not read/);
  assert.match(readLi({ json: "{x" }).error, /not JSON/); assert.match(readBars({}).error, /not the one/);
});
test("fact rows describe the case without inventing anything", () => {
  const rows = Object.fromEntries(factRows(models(tab("od-consistency")))); assert.equal(rows.Study, "od-consistency"); assert.match(rows["Orbit family"], /^[A-Z]+$/);
});
