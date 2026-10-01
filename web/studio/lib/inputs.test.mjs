// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the input ranking (inputs.mjs) over every bundled scenario. Run with `node lib/inputs.test.mjs`.
import { readFileSync, readdirSync } from "node:fs";
import assert from "node:assert/strict";
import { rankInputs, splitInputs, isTechnical, fieldName, VISIBLE_INPUTS } from "./inputs.mjs";
import { numericFields } from "./params.mjs";
import { GUIDED_KNOBS, readKnob } from "./guided.mjs";
import * as K from "./kinds.mjs";

const dir = new URL("../scenarios/", import.meta.url);
const curatedFor = (toml) => {
  const kind = (toml.match(/^\s*kind\s*=\s*"([^"]+)"/m) || [])[1];
  if (kind && K.hasCapability(kind)) return K.guidedFor(kind, numericFields(toml)).map((k) => ({ id: k.id, label: k.label, hint: k.hint }));
  return GUIDED_KNOBS.filter((k) => { const raw = readKnob(toml, k); return raw !== null && Number.isFinite(k.parse(raw)); }).map((k) => ({ id: `${k.section || ""}::${k.key}`, label: k.label, hint: k.hint }));
};

assert.ok(isTechnical("seed") && isTechnical("step_s") && !isTechnical("al_h_m"));
assert.equal(fieldName({ key: "al_h_m", comment: "horizontal alert limit (APV-I)" }), "Horizontal alert limit");
assert.equal(fieldName({ key: "mask_deg", comment: "" }), "Mask");

// RAIM: the curated controls lead, the seed and time step go last.
{
  const toml = readFileSync(new URL("integrity-raim.toml", dir), "utf8");
  const ranked = rankInputs(numericFields(toml), curatedFor(toml));
  const ids = ranked.map((x) => x.id);
  assert.equal(ranked[0].tier, 0);
  assert.deepEqual(ids.slice(0, VISIBLE_INPUTS), ["::sigma_uere_m", "::al_h_m", "::al_v_m", "time::duration_s", "::mask_deg"]);
  assert.ok(ids.indexOf("::seed") > ids.indexOf("::al_h_m"), "seed after the alert limit");
  assert.ok(ids.slice(0, VISIBLE_INPUTS).includes("::al_h_m") && ids.slice(0, VISIBLE_INPUTS).includes("::al_v_m"), "both alert limits show by default");
}
// Every scenario: at most 5 visible, nothing lost, nothing twice, technical settings never ahead of others.
for (const f of readdirSync(dir).filter((x) => x.endsWith(".toml"))) {
  const toml = readFileSync(new URL(f, dir), "utf8");
  const fields = numericFields(toml);
  const ranked = rankInputs(fields, curatedFor(toml));
  const { visible, advanced } = splitInputs(ranked);
  assert.ok(visible.length <= VISIBLE_INPUTS, `${f}: ${visible.length} visible`);
  assert.equal(new Set(ranked.map((x) => x.id)).size, ranked.length, `${f}: an input listed twice`);
  for (const fl of fields) assert.ok(ranked.some((x) => x.id === fl.id), `${f}: ${fl.id} lost`);
  assert.equal(visible.length + advanced.length, ranked.length);
  const firstTech = ranked.findIndex((x) => x.tier === 9);
  if (firstTech >= 0) assert.ok(ranked.slice(firstTech).every((x) => x.tier === 9), `${f}: a technical setting ranks ahead of a question setting`);
}
// A smaller budget shows fewer, never more than 5.
assert.equal(splitInputs([1, 2, 3, 4, 5, 6, 7], 3).visible.length, 3);
assert.equal(splitInputs([1, 2, 3, 4, 5, 6, 7], 9).visible.length, 5);
console.log("inputs.test.mjs: ok");
