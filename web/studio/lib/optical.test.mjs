// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { SCENARIOS, readOptical, chartsOf, barsSvg, linesSvg, seriesSvg, factRows } from "./optical.mjs";

const here = new URL("../", import.meta.url).pathname;
const load = (id) => JSON.parse(readFileSync(here + `recorded/${id}.json`, "utf8"));

test("both 0.37 optical-atmosphere scenarios open and carry the engine's numbers unchanged", () => {
  assert.equal(SCENARIOS.length, 2);
  for (const sc of SCENARIOS) {
    const doc = load(sc.id), raw = JSON.parse(doc.json), { model, error } = readOptical(doc);
    assert.equal(error, undefined, sc.id);
    assert.equal(model.sites.length, raw.sites.length);
    raw.sites.forEach((s, i) => { assert.equal(model.sites[i].availability, s.availability_pct); assert.equal(model.sites[i].ceiling, s.availability_ceiling_pct); assert.equal(model.sites[i].margins.length, s.margin_for_availability.length); });
    assert.equal(model.link.marginDb, raw.link.margin_no_atmosphere_db);
    assert.match(model.label, /^MODELLED/); assert.match(model.summary, /MODELLED/);
    assert.match(model.sites[0].source, /ILLUSTRATIVE/);
  }
});
test("the network scenario draws diversity, and the techniques scenario draws the techniques", () => {
  const net = chartsOf(readOptical(load("optical-atmosphere-network")).model).map((c) => c.id), tec = chartsOf(readOptical(load("optical-atmosphere-techniques")).model).map((c) => c.id);
  assert.ok(net.includes("diversity") && !net.includes("techniques")); assert.ok(tec.includes("techniques") && !tec.includes("diversity"));
  for (const id of ["series", "avail", "margin", "outage", "timing"]) { assert.ok(net.includes(id) && tec.includes(id), id); }
});
test("charts label every series at the line's end, and only the engine's own time series is drawn against time", () => {
  const charts = chartsOf(readOptical(load("optical-atmosphere-network")).model);
  const outage = charts.find((c) => c.id === "outage").svg;
  for (const n of ["northern", "central", "southern"]) assert.ok(outage.includes(`>${n}</text>`), n);
  assert.deepEqual(charts.filter((c) => /time series|against time/i.test(c.title)).map((c) => c.id), ["series"], "only the engine's seeded series is drawn against time");
  assert.match(outage, /outage duration, h \(log\)/);
});
test("bars are scaled to the stated maximum and carry their value as text", () => {
  const svg = barsSvg([{ label: "a", value: 50, text: "50.0 %" }], { max: 100 });
  const w = Number(svg.match(/class="op-bar[^"]*" x="\d+" y="\d+" width="([\d.]+)"/)[1]), track = Number(svg.match(/class="op-track" x="\d+" y="\d+" width="([\d.]+)"/)[1]);
  assert.ok(Math.abs(w - track / 2) < 0.1); assert.match(svg, />50\.0 %</);
});
test("an empty chart says so, and a result that is not optical is refused", () => {
  assert.match(linesSvg([], {}), /No data in this result/);
  assert.match(readOptical({ json: JSON.stringify({ kind: "other" }) }).error, /not an optical-atmosphere/);
  assert.match(readOptical({ json: "{" }).error, /not JSON/);
  assert.ok(factRows(readOptical(load("optical-atmosphere-network")).model).length === 8);
});

test("a lone card in the last row spans it and is drawn wider; the time-series card always has its own row; with a narrow page nothing spans", () => {
  const net = chartsOf(readOptical(load("optical-atmosphere-network")).model, { wide: true });
  const flow = net.filter((c) => !c.fullRow);
  assert.equal(flow.length % 2, 1); assert.deepEqual(net.filter((c) => c.wide).map((c) => c.id), ["series", "diversity"]);
  assert.match(net[net.length - 1].svg, /viewBox="0 0 1160 /);
  assert.ok(chartsOf(readOptical(load("optical-atmosphere-network")).model).every((c) => !c.wide), "narrow page: no spanning");
  assert.match(flow[0].svg, /viewBox="0 0 560 /);
});

test("the engine's seeded time series is read unchanged and drawn: margin line, zero line, down and cloud stripes, per site", () => {
  for (const sc of SCENARIOS) {
    const doc = load(sc.id), raw = JSON.parse(doc.json), { model } = readOptical(doc);
    model.sites.forEach((s, i) => {
      const t = raw.sites[i].timeseries;
      assert.equal(s.series.steps, t.steps); assert.deepEqual(s.series.margin, t.margin_db); assert.deepEqual(s.series.up, t.up);
      assert.equal(s.series.realised.availability, t.realised.availability_pct); assert.equal(s.series.seed, t.seed);
      assert.ok(t.margin_db.every((m, k) => Math.abs(m - (raw.sites[i].fade_budget_db - t.cloud_db[k] - t.scint_db[k])) < 0.0021), "the margin is the budget minus the two fades");
    });
    const c = chartsOf(model).find((x) => x.id === "series");
    assert.ok(c.fullRow && /one seeded realisation/i.test(c.note) && /not the climate/.test(c.note));
    assert.equal((c.svg.match(/class="op-line op-s\d"/g) || []).length, model.sites.length);
    assert.match(c.svg, /op-down/); assert.match(c.svg, /op-cloudstripe/); assert.match(c.svg, /0 dB/);
    for (const s of model.sites) assert.ok(c.svg.includes(`>${s.name}</text>`) && c.svg.includes("stated"), s.name);
  }
});
test("a 0.37 result without a series draws no series card, and says so if asked to draw one", () => {
  const doc = load("optical-atmosphere-network"), raw = JSON.parse(doc.json);
  for (const s of raw.sites) delete s.timeseries;
  const { model } = readOptical({ ...doc, json: JSON.stringify(raw) });
  assert.ok(!chartsOf(model).some((c) => c.id === "series"));
  assert.match(seriesSvg(model.sites), /No time series in this result/);
});
