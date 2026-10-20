// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { SCENARIOS, MODES, readSsv, chartsOf, factRows, groupedBarsSvg, linesSvg, rangesSvg, readIcg, icgTable, fmt } from "./ssv.mjs";

const here = new URL("../", import.meta.url).pathname;
const load = (id) => JSON.parse(readFileSync(here + `recorded/${id}.json`, "utf8"));
const read = (id) => readSsv(load(id)).model;
const modeOf = { "gnss-ssv-shell": "shell", "gnss-ssv-heo": "trajectory", "gnss-ssv-lunar-weak": "trajectory", "gnss-ssv-nav-lunar": "navigation", "gnss-ssv-formation-heo": "formation" };

test("every scenario opens in its mode and the result's own label and pattern text come through", () => {
  assert.equal(SCENARIOS.length, 5);
  for (const sc of SCENARIOS) {
    const doc = load(sc.id), raw = JSON.parse(doc.json), { model, error } = readSsv(doc);
    assert.equal(error, undefined, sc.id); assert.equal(model.mode, modeOf[sc.id]); assert.ok(MODES.includes(model.mode));
    assert.match(model.label, /^MODELLED/); assert.equal(model.label, raw.label); assert.match(model.pattern, /REPRESENTATIVE|booklet/);
    assert.ok(chartsOf(model).length >= 2, sc.id);
  }
});
test("availability, outages and counts are the result's numbers, unchanged", () => {
  const sh = read("gnss-ssv-shell"), rawSh = JSON.parse(load("gnss-ssv-shell").json);
  rawSh.bands.forEach((b, i) => b.groups.forEach((g, k) => { const m = sh.bands[i].groups[k]; assert.equal(m.at1, g.at_least_1_pct); assert.equal(m.at4, g.at_least_4_pct); assert.equal(m.out4, g.max_outage_4_min); assert.equal(m.never4, g.never_available_4); }));
  const heo = read("gnss-ssv-heo"), rawH = JSON.parse(load("gnss-ssv-heo").json);
  rawH.result.bands.forEach((b, i) => { assert.equal(heo.bands[i].pdop.median, b.pdop_median); assert.equal(heo.bands[i].series.length, b.series.length); b.groups.forEach((g, k) => { assert.equal(heo.bands[i].groups[k].mainLobe, g.main_lobe_links); assert.equal(heo.bands[i].groups[k].inView.max, g.signals_in_view.max); }); });
  const nav = read("gnss-ssv-nav-lunar"), rawN = JSON.parse(load("gnss-ssv-nav-lunar").json);
  assert.equal(nav.phases.length, 3); assert.equal(nav.phases[1].posRms, rawN.result.phases[1].pos_rms_m); assert.equal(nav.series.length, rawN.result.series.length); assert.equal(nav.nav.srpTruth, rawN.result.srp_truth_ms2);
});
test("a trajectory draws only the combined series and says there is no per-constellation one; the limb appears only where the result has it", () => {
  const heo = chartsOf(read("gnss-ssv-heo"), {}), t = heo.find((c) => c.id.startsWith("series-"));
  assert.match(t.note, /no per-constellation series/); assert.equal((t.svg.match(/<path class="ssk-line/g) || []).length, 3, "one signal-count line, the C/N0 line and the altitude line");
  const hasLimb = (id) => read(id).bands.some((b) => b.limb);
  assert.equal(hasLimb("gnss-ssv-heo") || hasLimb("gnss-ssv-lunar-weak"), true);
  assert.ok(chartsOf(read("gnss-ssv-lunar-weak")).some((c) => c.id === "weak") && !chartsOf(read("gnss-ssv-heo")).some((c) => c.id === "weak") === !read("gnss-ssv-heo").weak);
});
test("navigation draws error against the stated bound; the formation shows the filter against differencing the absolute fixes", () => {
  const nav = chartsOf(read("gnss-ssv-nav-lunar")), e = nav.find((c) => c.id === "err");
  assert.match(e.svg, />stated bound</); assert.match(e.svg, /ssk-dash/);
  const f = chartsOf(read("gnss-ssv-formation-heo")), d = f.find((c) => c.id === "formation");
  assert.match(d.svg, /from two absolute fixes/); assert.match(d.svg, /filter/);
  assert.ok(f.some((c) => c.id === "deputies") && f.some((c) => c.id === "phases"));
});
test("charts are labelled, never colour alone, and make no request", () => {
  const svg = groupedBarsSvg([{ label: "GPS", values: [{ name: "a", value: 50 }, { name: "b", value: 10 }] }], { label: "x" });
  assert.match(svg, /ssk-p0/); assert.match(svg, /ssk-p1/); assert.match(svg, /role="img"/); assert.ok(!/https?:|href=/.test(svg));
  assert.match(linesSvg([{ name: "a", points: [[0, 1], [1, 2]] }, { name: "b", points: [[0, 2], [1, 1]], dash: true }], { label: "l" }), />b<\/text>/);
  assert.match(linesSvg([{ name: "a", points: [] }]), /carries no series/); assert.match(rangesSvg([]), /No range/);
  assert.equal(fmt(null), "n/a"); assert.equal(fmt(12345678), "1.23e+7");
});
test("another kind, another mode or a broken file is refused with a reason", () => {
  assert.match(readSsv({ json: JSON.stringify({ kind: "other" }) }).error, /not a gnss-ssv/);
  assert.match(readSsv({ json: JSON.stringify({ kind: "gnss-ssv", mode: "warp" }) }).error, /does not read/);
  assert.match(readSsv({ json: "{x" }).error, /not JSON/);
});
test("the ICG comparison shows run 1's verdicts of record, misses included, and the variant beside them as a diagnostic", () => {
  const { icg, error } = readIcg(JSON.parse(readFileSync(here + "ssv/icg-comparison.json", "utf8")));
  assert.equal(error, undefined); assert.equal(icg.run1.bars.filter((b) => b.met).length, 2); assert.equal(icg.run1.bars.length, 7); assert.equal(icg.s7.met, false);
  const t = icgTable(icg);
  assert.match(t, /NOT MET/); assert.match(t, /S7/); assert.match(t, /diagnostic/i); assert.ok(!/VALIDATED|conformant|certified/i.test(t));
  assert.match(readIcg({}).error, /not the one/);
});
test("the fact rows describe the case without inventing anything", () => {
  const rows = Object.fromEntries(factRows(read("gnss-ssv-heo")));
  assert.equal(rows.Mode, "trajectory"); assert.match(rows["Apogee altitude"], /km$/);
});
