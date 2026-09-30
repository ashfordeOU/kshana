// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the key-figure strip (kpi.mjs) on recorded runs of four kinds.
// Run with `node lib/kpi.test.mjs`.
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { kpis, honesty, kpiDelta, headline } from "./kpi.mjs";
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
console.log("kpi: ok");
