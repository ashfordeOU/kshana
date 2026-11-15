// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: explain this number (0.42 U11). Run: node --test apps/desktop/shell/lib/explain.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, readdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { resolvePath, unitEntry, findValuePath, provenanceText, methodPage, resultCaveats, headlineIds, figureInputs, explainFigure, sensitivityPlan, sensitivityOf } from "./explain.mjs";
import { numericFields } from "../../../../web/studio/lib/params.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, "../../../..");

const result = {
  kind: "jamming", seed: 7, label: "MODELLED: link-budget model of the receiver",
  fom: { time_to_loss_s: 42.5, cn0_min_dbhz: 18.2 },
  receiver: { tracking_threshold_dbhz: 28 },
  epochs: [{ t_s: 0, js_db: 10 }, { t_s: 1, js_db: 12.5 }],
  units: {
    "fom.time_to_loss_s": { unit: "s", provenance: "computed", note: "Time from the start until fewer than four satellites track." },
    "receiver.tracking_threshold_dbhz": { unit: "dB-Hz", provenance: "input" },
    "epochs[].js_db": { unit: "dB", provenance: "modelled" },
  },
  figure_tiers: { figures: [{ path: "fom.time_to_loss_s", tier: "MODELLED", note: "no outside reference for this receiver" }] },
  evidence: { tier: "MODELLED", matrix: "docs/VERIFICATION-MATRIX.md", rows: [{ id: "JAM-1", requirement: "J/S from the link equation", status: "modelled" }] },
  assumptions: ["free-space loss between jammer and receiver"],
  limitations: [{ text: "no multipath" }],
};
const toml = 'kind = "jamming"\nseed = 7\n\n[receiver]\ntracking_threshold_dbhz = 28 # tracking threshold of the receiver loop\nnoise_figure_db = 2.5\n\n[[jammers]]\neirp_dbw = 10\nrange_m = 500\n';

test("paths resolve through objects and indexed arrays; units match their generic form", () => {
  assert.equal(resolvePath(result, "fom.time_to_loss_s"), 42.5);
  assert.equal(resolvePath(result, "epochs[1].js_db"), 12.5);
  assert.equal(resolvePath(result, "epochs[5].js_db"), undefined);
  assert.equal(resolvePath(result, "nope.x"), undefined);
  assert.equal(unitEntry(result, "epochs[1].js_db").unit, "dB");
  assert.equal(unitEntry(result, "fom.nothing"), null);
});

test("a number without a path is found by value, and an ambiguous one is not", () => {
  assert.equal(findValuePath(result, 42.5), "fom.time_to_loss_s");
  assert.equal(findValuePath({ a: { x: 1 }, b: { y: 1 } }, 1), null, "two different keys: ambiguous");
  assert.equal(findValuePath({ a: [{ x: 3 }, { x: 3 }] }, 3), "a[0].x", "the same key: the first");
  assert.equal(findValuePath(result, 999), null);
});

test("every provenance class of the units schema has plain words", () => {
  const src = readFileSync(join(root, "src/field_schema.rs"), "utf8");
  const classes = [...src.matchAll(/ProvenanceClass::\w+ => "([a-z-]+)"/g)].map((m) => m[1]);
  assert.ok(classes.length >= 10, "the engine's class names were read");
  for (const c of classes) assert.ok(!/provenance class/.test(provenanceText(c)), `${c} has its own words`);
  assert.match(provenanceText("something-new"), /provenance class something-new/);
  assert.equal(provenanceText(""), "");
});

test("the method pages list is the docs/kinds/by-kind folder", () => {
  const listed = JSON.parse(readFileSync(join(here, "../data/method-pages.json"), "utf8")).kinds;
  const folder = readdirSync(join(root, "docs/kinds/by-kind")).filter((f) => f.endsWith(".md")).map((f) => f.slice(0, -3)).sort();
  assert.deepEqual(listed, folder, "regenerate apps/desktop/shell/data/method-pages.json from docs/kinds/by-kind");
  assert.equal(methodPage("jamming", listed), "docs/kinds/by-kind/jamming.md");
  assert.equal(methodPage("no-such-kind", listed), null);
});

test("caveats are the result's own assumption and limitation lists", () => {
  assert.deepEqual(resultCaveats(result), ["free-space loss between jammer and receiver", "no multipath"]);
  assert.deepEqual(resultCaveats({}), []);
});

test("the engine's headline fields come first among the inputs, and an echoed input is marked", () => {
  const fields = numericFields(toml);
  assert.deepEqual(headlineIds({ jamming: { headline: ["jammers[].eirp_dbw", "receiver.noise_figure_db"] } }, "jamming"), ["jammers[0]::eirp_dbw", "receiver::noise_figure_db"]);
  const ins = figureInputs(fields, { importance: { jamming: { headline: ["jammers[].eirp_dbw"] } }, kind: "jamming", path: "receiver.tracking_threshold_dbhz", value: 28 });
  assert.equal(ins[0].id, "jammers[0]::eirp_dbw");
  assert.ok(ins[0].headline);
  assert.ok(ins.find((x) => x.key === "tracking_threshold_dbhz").echo);
  assert.ok(!ins.find((x) => x.key === "noise_figure_db").echo);
});

test("an explanation carries the model, the engine's words, evidence, inputs and hashes, and nothing invented", () => {
  const x = explainFigure({ path: "fom.time_to_loss_s", label: "Time to loss" }, {
    result, toml, fields: numericFields(toml), kind: "jamming", modules: { jamming: ["jamming", "linkbudget"] }, pages: ["jamming"],
    state: { state: "fail", why: "drops under the tracking threshold" }, run: { scenarioSha: "aa", resultSha: "bb", engineVersion: "0.42.0", engine: "native" },
  });
  assert.equal(x.value, 42.5);
  assert.equal(x.unit, "s");
  assert.deepEqual(x.model, { kind: "jamming", modules: ["jamming", "linkbudget"], page: "docs/kinds/by-kind/jamming.md" });
  assert.equal(x.provenance.cls, "computed");
  assert.equal(x.tier, "MODELLED");
  assert.equal(x.tierFrom, "figure");
  assert.deepEqual(x.words.map((w) => w.k), ["definition", "state", "tier", "label"]);
  assert.equal(x.evidence.rows[0].id, "JAM-1");
  assert.equal(x.evidence.rows[0].status, "MODELLED");
  assert.equal(x.hashes.seed, 7);
  assert.equal(x.echo, false);
  assert.equal(x.caveats.length, 2);
  const bare = explainFigure({ value: 3, label: "x" }, { result: { a: 1 } });
  assert.equal(bare.path, "");
  assert.equal(bare.provenance, null);
  assert.deepEqual(bare.words, []);
  assert.equal(bare.tier, "");
  assert.equal(bare.model.page, null);
  const byValue = explainFigure({ value: 12.5, label: "J/S" }, { result });
  assert.equal(byValue.path, "epochs[1].js_db");
  assert.ok(byValue.byValue);
  assert.equal(byValue.unit, "dB");
  const echo = explainFigure({ path: "receiver.tracking_threshold_dbhz" }, { result, toml, fields: numericFields(toml) });
  assert.ok(echo.echo);
});

test("sensitivity: ±10 % runs of the top inputs, and the elasticity by the central difference", () => {
  const fields = numericFields(toml);
  const plan = sensitivityPlan(figureInputs(fields, { path: "fom.time_to_loss_s" }), fields, { n: 3 });
  assert.equal(plan.length, 3);
  const nf = plan.find((p) => p.id === "receiver::noise_figure_db");
  assert.ok(Math.abs(nf.lo - 2.25) < 1e-12 && Math.abs(nf.hi - 2.75) < 1e-12);
  const seed = sensitivityPlan(figureInputs(fields, {}), fields, { n: 1 })[0];
  assert.equal(seed.id, "::seed");
  assert.deepEqual([seed.lo, seed.hi], [6, 8], "an integer moves by at least one");
  // y = x^2 at x = 10: dy/dx = 20, elasticity 2
  const s = sensitivityOf(10, 100, 9, 81, 11, 121);
  assert.equal(s.dydx, 20);
  assert.equal(s.elasticity, 2);
  assert.equal(sensitivityOf(10, 100, 9, null, 11, 121).elasticity, null, "a failed run gives no number");
  assert.equal(sensitivityOf(10, 0, 9, 1, 11, 3).elasticity, null, "no elasticity at y = 0");
});
