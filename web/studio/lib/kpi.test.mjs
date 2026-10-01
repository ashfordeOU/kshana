// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the key-figure strip (kpi.mjs) on recorded runs of four kinds.
// Run with `node lib/kpi.test.mjs`.
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { kpis, honesty, kpiDelta, headline, plainLabel, fieldTerm, isInputEcho } from "./kpi.mjs";
import * as K from "./kinds.mjs";

const rec = (name) => { const d = JSON.parse(readFileSync(new URL(`../recorded/${name}.json`, import.meta.url), "utf8")); return { r: JSON.parse(d.json), toml: d.toml }; };

// Constellation: availability passes at 100 %, PDOP against the scenario's own threshold.
{
  const { r, toml } = rec("constellation-multi-gnss-coverage");
  const k = kpis(r, toml, 6);
  assert.ok(k.length >= 4 && k.length <= 6, `${k.length} readouts`);
  for (const c of k) if (c.path) assert.equal(K.resolve(r, c.path), c.v, `${c.path} is read from the result`);
  const av = k.find((c) => c.path === "global.availability_pct");
  assert.equal(av.state, "pass");
  const p95 = k.find((c) => c.path === "global.pdop.p95");
  assert.equal(p95.state, r.global.pdop.p95 <= r.inputs.pdop_threshold ? "pass" : "fail");
  assert.equal(honesty(r).tier, "MODELLED");
}
// Spectrum: lowest C/N0 per band against the tracking threshold.
{
  const { r, toml } = rec("l-band-waterfall-jamming");
  const k = kpis(r, toml, 6);
  const bands = k.filter((c) => /min_cn0_dbhz$/.test(c.path));
  assert.ok(bands.length >= 3);
  for (const c of bands) assert.equal(c.state, c.v >= r.receiver.tracking_threshold_dbhz ? "pass" : "fail");
  assert.ok(bands.some((c) => c.state === "fail") && bands.some((c) => c.state === "pass"), "the jammed bands fail, the clean ones pass");
}
// A clock run: figures of merit, tiers from figure_tiers.
{
  const { r, toml } = rec("clock-holdover");
  const k = kpis(r, toml, 6);
  assert.ok(k.length >= 4);
  assert.ok(["MODELLED", "VALIDATED"].includes(honesty(r).tier));
}
// The chain: no invented pass or fail.
{
  const { r, toml } = rec("leo-pnt-end-to-end");
  const k = kpis(r, toml, 6);
  assert.ok(k.length >= 4 && k.every((c) => c.state === ""));
}
// Deltas.
const a = [{ path: "x", v: 10, unit: "m" }], b = { path: "x", v: 12, unit: "m" };
assert.equal(kpiDelta(b, a).dir, "up");
assert.match(kpiDelta(b, a).text, /^\+2 m/);
assert.equal(kpiDelta({ path: "x", v: 10 }, a).dir, "flat");
assert.equal(kpiDelta({ path: "y", v: 1 }, a), null);
assert.equal(kpiDelta(b, null), null);
assert.equal(honesty({ label: "PARTNER: data owned by a partner" }).tier, "PARTNER");
assert.equal(honesty({}), null);
assert.deepEqual(headline(null), []);
// RAIM: the outputs come first; the alert limits it echoes are marked as settings, labelled
// in the scenario's own words plus the term, never with the raw field name.
{
  const { r, toml } = rec("integrity-raim");
  const k = kpis(r, toml, 6);
  const firstInput = k.findIndex((c) => c.input);
  assert.ok(firstInput > 0, "an output is the first card");
  assert.ok(k.slice(firstInput).every((c) => c.input), "no output ranks below an input echo");
  for (const c of k) if (c.input) assert.equal(K.unitOf(r, c.path).provenance, "input", `${c.path} is an input by the engine's own units block`);
  const alh = k.find((c) => c.path === "al_h_m");
  assert.equal(`${alh.k} (${alh.term})`, "Horizontal alert limit (AL_H)");
  assert.equal(alh.sub, "your setting");
}
// Spectrum: with enough outputs, the echoed tracking threshold leaves the strip.
{
  const { r, toml } = rec("l-band-waterfall-jamming");
  assert.ok(kpis(r, toml, 6).every((c) => c.input !== true), "no input echo when outputs fill the strip");
}
// Without provenance, an equal scenario field marks an echo; nothing marks an unrelated figure.
assert.equal(isInputEcho({}, "x_m = 4.0  # a test length", { path: "x_m", v: 4 }), true);
assert.equal(isInputEcho({}, "x_m = 4.0", { path: "y_m", v: 4 }), null);
assert.equal(plainLabel("horizontal alert limit (APV-I)"), "Horizontal alert limit");
assert.equal(plainLabel("12 h"), null, "a value note is not a label");
assert.equal(fieldTerm("al_h_m"), "AL_H");
console.log("kpi: ok");
