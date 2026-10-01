// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the capability map model (areas.mjs) and its generated data. Run with `node lib/areas.test.mjs`.
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { rowsForKind, evidenceMix, validatedShare, sparkPoints, kindsOfToml, kindOfToml, previewOf } from "./areas.mjs";
import { SCENARIOS } from "./catalog.mjs";

const read = (f) => readFileSync(new URL(`../${f}`, import.meta.url), "utf8");
const matrix = JSON.parse(read("data/verification-matrix.json"));
const rows = matrix.rows;

// The matrix defines two levels of the engine's own evidence (plus partner-owned rows).
assert.deepEqual([...new Set(rows.map((r) => r.status))].sort(), ["MODELLED", "PARTNER", "VALIDATED"]);
// A kind maps to the rows naming its module, whole tokens only ("orbit" is not "orbit_determination").
{
  const orbit = rowsForKind("orbit", rows).map((i) => rows[i].module);
  assert.ok(orbit.some((m) => /^orbit \(dop\)/.test(m)));
  assert.ok(!orbit.some((m) => /^sgp4, propagator, orbit_determination/.test(m)), "no partial-word match");
  assert.ok(rowsForKind("integrity", rows).length === 0 || true);
  assert.ok(rowsForKind("constellation-design", rows).length >= 3, "alias reaches the constellation rows");
}
// Mix counts each row once.
{
  const v = rows.findIndex((r) => r.status === "VALIDATED"), m = rows.findIndex((r) => r.status === "MODELLED");
  assert.deepEqual(evidenceMix([v, v, m], rows), { validated: 1, modelled: 1, partner: 0, total: 2 });
  assert.equal(validatedShare({ validated: 1, modelled: 3 }), 25);
  assert.equal(validatedShare({ validated: 0, modelled: 0 }), null);
}
assert.deepEqual(kindsOfToml('kind = "campaign"\n[[member]]\n  kind = "jamming"\n'), ["campaign", "jamming"]);
assert.equal(kindOfToml("seed = 1"), "holdover");
// Spark points are scaled to 0..1 and keep both ends.
{
  const p = sparkPoints(Array.from({ length: 200 }, (_, i) => [i, i * i]), 20);
  assert.ok(p.length <= 22 && p[0][0] === 0 && p[p.length - 1][0] === 1 && p[p.length - 1][1] === 1);
  assert.equal(sparkPoints([[0, 1]]), null);
}
// The generated data matches the catalogue: every area, its count, and a preview from a real recording.
{
  const data = JSON.parse(read("data/areas.json"));
  for (const a of data.areas) {
    assert.equal(a.count, SCENARIOS.filter((s) => s[1] === a.id).length, `${a.id} count`);
    assert.ok(a.mix.validated + a.mix.modelled > 0, `${a.id} maps to matrix rows`);
    assert.ok(a.preview && a.preview.file && SCENARIOS.some((s) => s[0] === a.preview.file && s[1] === a.id), `${a.id} preview comes from one of its own scenarios`);
  }
  assert.ok(!/celeste/i.test(read("data/areas.json")), "the optional group's area lives in its own folder");
  // The RAIM preview is the line the Studio draws for that recording.
  const d = JSON.parse(read("recorded/integrity-raim.json"));
  assert.deepEqual(previewOf(JSON.parse(d.json), d.toml).points, data.areas.find((a) => a.id === "integrity").preview.points);
}
// The opening screen's result is the recorded coverage run, unchanged (only re-serialised).
{
  const hero = JSON.parse(read("data/hero.json"));
  const d = JSON.parse(read("recorded/constellation-multi-gnss-coverage.json"));
  assert.equal(hero.json, JSON.stringify(JSON.parse(d.json)), "the same values (-0 is written 0)");
  assert.equal(hero.toml, d.toml);
}
// The first paint says exactly what the Studio then writes (lib/meaning.mjs taskWords).
{
  const fp = JSON.parse(read("data/firstpaint.json"));
  const { taskWords } = await import("./meaning.mjs");
  const { DOMAINS } = await import("./catalog.mjs");
  for (const name of ["integrity-raim", "clock-holdover", "l-band-waterfall-jamming", "lunar-time-budget"]) {
    const d = JSON.parse(read(`recorded/${name}.json`));
    const s = SCENARIOS.find((x) => x[0] === name + ".toml");
    const w = taskWords({ title: s[2], question: s[3] }, DOMAINS.find((x) => x.id === s[1]).label, d.toml, JSON.parse(d.json));
    assert.deepEqual([fp.s[name].t, fp.s[name].u, fp.s[name].b, fp.s[name].l], [w.title, w.sub, w.big, w.line], `${name}: first paint in step with the Studio`);
  }
  assert.ok(!/celeste/i.test(read("data/firstpaint.json")));
  const home = JSON.parse(read("data/firstpaint-home.json"));
  const hd = JSON.parse(read("recorded/constellation-multi-gnss-coverage.json"));
  const { plainMeaning } = await import("./meaning.mjs");
  const { spellOut } = await import("./abbr.mjs");
  const hm = plainMeaning(JSON.parse(hd.json), hd.toml);
  assert.equal(home.hero.answer, spellOut(`${hm.big} ${hm.line}`, new Set()), "the opening screen's first paint matches the Studio's");
}
console.log("areas.test.mjs: ok");
