// SPDX-License-Identifier: AGPL-3.0-only
// Runs against the real engine output in recorded/ (and the optional group when present).
import assert from "node:assert/strict";
import { readFileSync, readdirSync, existsSync } from "node:fs";
import { resolve, genericPath, unitOf, quantity, leafText, keyLabel, capabilityView, capabilityTabs, capabilityFigures, guidedFor, kindOfRun, hasCapability, CAPABILITIES } from "./kinds.mjs";
import { numericFields } from "./params.mjs";

// Paths.
assert.equal(resolve({ a: { b: [{ c: 5 }, { c: 7 }] } }, "a.b[1].c"), 7);
assert.equal(resolve({ a: { b: [{ c: 5 }, { c: 7 }] } }, "a.b[-1].c"), 7);
assert.equal(resolve({ a: 1 }, "a.b.c"), undefined);
assert.equal(genericPath("bands[3].centre_hz"), "bands[].centre_hz");
// Quantities: the scaling is for display only and keeps the value.
assert.deepEqual(quantity(1575420000, "Hz"), { text: "1.57542", unit: "GHz" });
assert.deepEqual(quantity(465e6, "Hz"), { text: "465", unit: "MHz" });
assert.deepEqual(quantity(2.5e9, "Hz"), { text: "2.5", unit: "GHz" });
assert.deepEqual(quantity(5e-9, "s"), { text: "5", unit: "ns" });
assert.deepEqual(quantity(12000, "m"), { text: "12", unit: "km" });
assert.deepEqual(quantity(0, "m"), { text: "0", unit: "m" });
assert.deepEqual(quantity(NaN, "m"), { text: "—", unit: "" });
assert.equal(quantity(7, "count").unit, "");
assert.equal(keyLabel("timeline.bands[0].min_cn0_dbhz"), "Min C/N0");
assert.equal(keyLabel("availability_pct"), "Availability");

const load = (dir, f) => { const rec = JSON.parse(readFileSync(new URL(`../${dir}recorded/${f}`, import.meta.url), "utf8")); return { r: JSON.parse(rec.json), toml: rec.toml, file: rec.file }; };
const all = [];
for (const dir of ["", "celeste/"]) {
  if (!existsSync(new URL(`../${dir}recorded/`, import.meta.url))) continue;
  for (const f of readdirSync(new URL(`../${dir}recorded/`, import.meta.url))) if (f.endsWith(".json") && f !== "index.json") all.push(load(dir, f));
}
assert.ok(all.length > 130, `recorded runs found: ${all.length}`);

// Every newer kind in the recordings has a view; every panel names paths that exist in the
// result, so nothing on a panel can be a number of the page's own.
const seenKinds = new Set(), seenTabs = new Set();
let panels = 0, values = 0;
const mustExist = (r, path, where) => { values++; assert.notEqual(resolve(r, path), undefined, `${where}: ${path} is not in the result`); };
for (const { r, toml, file } of all) {
  const kind = kindOfRun(r, toml);
  const view = capabilityView(r, toml);
  if (!CAPABILITIES[kind]) { assert.equal(view, null, `${file}: an older kind has no capability view`); continue; }
  seenKinds.add(kind);
  assert.ok(view && view.panels.length >= 2, `${file}: has panels`);
  seenTabs.add(view.tab);
  for (const p of view.panels) {
    panels++;
    assert.ok(p.title && p.type, `${file}: a panel has a title and a type`);
    if (p.type === "table") {
      assert.ok(p.rows.length && p.cols.length, `${file}: ${p.title} has rows and columns`);
      // A column may be empty in some rows, never in all of a table's rows and columns at once.
      let any = 0;
      p.rows.forEach((row, i) => p.cols.forEach((c) => { const path = c.path ? c.path(row, i) : `${row.path}.${c.key}`; if (resolve(r, path) !== undefined && resolve(r, path) !== null) any++; }));
      assert.ok(any > 0, `${file}: ${p.title} shows at least one value`);
      values += any;
      for (const row of p.rows) assert.notEqual(resolve(r, row.path), undefined, `${file}: ${p.title}: row ${row.path}`);
    } else if (p.type === "kv" || p.type === "list" || p.type === "chips") for (const it of p.items) mustExist(r, it.path, `${file}: ${p.title}`);
    else if (p.type === "note" || p.type === "mono") mustExist(r, p.path, `${file}: ${p.title}`);
    else if (p.type === "hist") { assert.ok(Array.isArray(resolve(r, p.path)), `${file}: ${p.title}: samples`); for (const m of p.marks) mustExist(r, m.path, `${file}: ${p.title}`); }
    else if (p.type === "line") {
      assert.ok(p.model.series.length && p.src.length, `${file}: ${p.title} has series and names their source`);
      // Every plotted y is a value of the result: look each one up in the arrays the panel names.
      for (const ser of p.model.series) assert.ok(ser.points.filter((q) => Number.isFinite(q[0]) && Number.isFinite(q[1])).length > 1, `${file}: ${p.title}: ${ser.label} has points`);
      const flat = JSON.stringify(r);
      for (const ser of p.model.series.slice(0, 2)) for (const q of ser.points.filter((x) => Number.isFinite(x[1])).slice(0, 3)) assert.ok(flat.includes(JSON.stringify(q[1])), `${file}: ${p.title}: plotted value ${q[1]} is in the result`);
    } else assert.fail(`${file}: unknown panel type ${p.type}`);
  }
  // Headline figures are read from the result too.
  const figs = capabilityFigures(r, toml, 8);
  assert.ok(figs.length >= 1, `${file}: has a headline figure`);
  for (const f of figs) assert.equal(resolve(r, f.path), f.value, `${file}: figure ${f.path}`);
  // Guided sliders address real fields of the scenario.
  const fields = numericFields(toml);
  for (const k of guidedFor(kind, fields)) { assert.ok(fields.some((f) => f.id === k.id), `${file}: slider ${k.id}`); assert.ok(k.min <= k.field.value && k.field.value <= k.max, `${file}: slider ${k.id} holds the scenario's value`); }
}
for (const kind of Object.keys(CAPABILITIES)) assert.ok(seenKinds.has(kind), `a recorded run exercises kind ${kind}`);
assert.deepEqual([...seenTabs].sort(), capabilityTabs().map((t) => t.tab).sort(), "every capability tab is reached by a recorded run");

// Units come from the result's own units block.
const sp = all.find((x) => x.file === "l-band-waterfall-jamming.toml").r;
assert.equal(unitOf(sp, "bands[2].centre_hz").unit, "Hz");
assert.equal(leafText(sp, "bands[0].centre_hz", sp.bands[0].centre_hz), "1.57542 GHz");
assert.equal(leafText(sp, "x", true), "yes");
assert.equal(leafText(sp, "x", null), "—");
assert.equal(leafText(sp, "x", 12.5, "dB-Hz"), "12.5 dB-Hz");
// An axis label or a chart title made from a result key is lower case, but an acronym keeps its capitals
// ("fused median PDOP against LEO SISRE", never "fused median pdop against leo sisre").
{
  const { axisLabel } = await import("./kinds.mjs");
  assert.equal(axisLabel("fused_median_pdop"), "fused median PDOP");
  assert.equal(axisLabel("leo_sisre_m"), "LEO SISRE");
  assert.equal(axisLabel("uhf_eirp_dbw"), "UHF EIRP");
  assert.equal(axisLabel("jammer_power_dbw"), "jammer power");
  const lowered = /\b(leo|uhf|sisre|pdop|gnss|eirp|rms|c\/n0|j\/s)\b/;
  let charts = 0;
  for (const { file, r, toml } of all) {
    const view = capabilityView(r, toml);
    for (const p of (view && view.panels) || []) if (p.type === "line") {
      charts++;
      for (const s of [p.title, p.model.xLabel, p.model.yLabel]) assert.ok(!lowered.test(String(s || "").replace(/\([^)]*\)/g, "")), `${file}: "${s}" shows a lower-case acronym`);
    }
  }
  assert.ok(charts > 50, `line charts checked: ${charts}`);
}
// The tab list of a run: always Overview first and Exports, JSON last; the capability view when
// the kind has one; the native engine's animation and report only when its index says so; the
// two session views only when asked for.
{
  const { resultTabs } = await import("./kinds.mjs");
  for (const { file, r, toml } of all) {
    const bare = resultTabs(r, toml);
    assert.equal(bare[0], "overview", file);
    assert.deepEqual(bare.slice(-2), ["exports", "json"], file);
    assert.equal(new Set(bare).size, bare.length, `${file}: a tab is listed twice`);
    const view = capabilityView(r, toml);
    assert.equal(bare.includes(view && view.panels.length ? view.tab : "\u0000"), !!(view && view.panels.length), file);
    for (const t of ["animation", "report", "sweep", "compare"]) assert.ok(!bare.includes(t), `${file}: ${t} without its condition`);
    const full = resultTabs(r, toml, { native: { animation: true, report: true }, sweep: true, compare: true });
    assert.deepEqual(full.filter((t) => !bare.includes(t)), ["sweep", "compare", "animation", "report"], file);
    assert.deepEqual(resultTabs(r, toml, { native: { animation: false, report: true } }).filter((t) => !bare.includes(t)), ["report"], file);
  }
  const wf = all.find((x) => x.file === "l-band-waterfall-jamming.toml");
  assert.ok(resultTabs(wf.r, wf.toml).includes("spectrum"));
  assert.ok(!resultTabs(wf.r, wf.toml).includes("holdover"), "a spectrum run has no holdover view");
}
// A scenario's kind is the reader's text. Names a plain object inherits are not kinds: they get no
// capability view, no figures, no guided knobs, and nothing throws.
{
  for (const k of ["constructor", "__proto__", "toString", "hasOwnProperty", "valueOf"]) {
    const toml = `kind = "${k}"\n`;
    assert.equal(hasCapability(k), false, k);
    assert.equal(capabilityView({ kind: k }, toml), null, k);
    assert.deepEqual(capabilityFigures({ kind: k, a: 1 }, toml), [], k);
    assert.deepEqual(guidedFor(k, []), [], k);
    assert.equal(kindOfRun({ kind: k }, ""), k, "the text is still reported as written");
  }
}
console.log(`kinds.test.mjs: ${seenKinds.size} kinds, ${panels} panels, ${values} values traced to the result; all assertions passed`);
