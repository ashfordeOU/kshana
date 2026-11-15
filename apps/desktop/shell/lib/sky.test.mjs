// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the sky plot (0.42 U16). Run: node --test apps/desktop/shell/lib/sky.test.mjs
// The Studio's request builder and reply reader are used as the shell uses them (the test
// imports them from web/studio/lib; the shell from the staged copy beside it).
import { test } from "node:test";
import assert from "node:assert/strict";
import { buildRequest, parseGeometry } from "../../../../web/studio/lib/geometry-adapter.mjs";
import { skyEpochs, skyTracks, skySpec, skySite, scenarioMask, stateCounts, SKY_STATES } from "./sky.mjs";
import { normalise } from "./chart/data.mjs";
import { skyToXY } from "./chart/hit.mjs";

// A stand-in for the engine's sky_geometry: deterministic positions per satellite and time,
// some above the mask, some under it, some below the horizon (as the engine replies).
const calls = [];
function fakeEngine(name, text) {
  assert.equal(name, "sky_geometry");
  const q = JSON.parse(text);
  calls.push(q);
  const sats = [];
  for (const [system, n] of [["gps-baseline", 4], ["galileo", 2]]) {
    for (let i = 1; i <= n; i++) {
      const az = (37 * i + q.time_s / 120 + (system === "galileo" ? 200 : 0)) % 360 - (i === 2 ? 360 : 0); // one negative azimuth
      const el = 80 - 22 * i + q.time_s / 900 - (system === "galileo" ? 30 : 0);
      sats.push({ id: `${system}-${i}`, system, az_deg: az, el_deg: el, cut_deg: q.mask_deg, visible: el >= q.mask_deg, masked: el >= 0 && el < q.mask_deg });
    }
  }
  return Promise.resolve(JSON.stringify({ satellites: sats, n_visible: sats.filter((s) => s.visible).length, dop: {}, label: "MODELLED", sky_source: "presets", sky_statement: "representative constellation" }));
}

test("epochs, site and mask", () => {
  assert.deepEqual(skyEpochs(0, 100, 5), [0, 25, 50, 75, 100]);
  assert.deepEqual(skyEpochs(5, 5), [5]);
  assert.equal(scenarioMask('a = 1\nmask_deg = 12.5 # elevation\n'), 12.5);
  assert.equal(scenarioMask("elevation_mask_deg = 7"), 7);
  assert.equal(scenarioMask("x = 1"), null);
  assert.deepEqual(skySite({ sites: [{ role: "jammer", id: "j", lat: 1, lon: 2 }, { role: "receiver", id: "rx", lat: 59.4, lon: 24.7 }] }), { lat: 59.4, lon: 24.7, h: 0, name: "rx" });
  assert.equal(skySite({ sites: [] }), null);
});

test("every drawn position is the engine's at its sampled epoch", async () => {
  calls.length = 0;
  const epochs = skyEpochs(0, 3600, 13);
  const sky = await skyTracks({ call: fakeEngine, buildRequest, parseGeometry, site: { lat: 59.4, lon: 24.7, h: 0 }, epochs, mask: 10 });
  assert.equal(calls.length, 13, "one engine call per sampled epoch");
  assert.deepEqual(calls.map((q) => q.time_s), epochs);
  assert.ok(calls.every((q) => q.mask_deg === 10 && q.site.lat_deg === 59.4 && q.systems.includes("gps-baseline") && q.systems.includes("galileo")));
  assert.equal(sky.tracks.length, 6);
  for (const [k, q] of calls.slice().entries()) {
    const doc = JSON.parse(await fakeEngine("sky_geometry", JSON.stringify(q)));
    for (const s of doc.satellites) {
      const tr = sky.tracks.find((x) => x.raw[k] && x.raw[k].az_deg === s.az_deg && x.raw[k].el_deg === s.el_deg);
      assert.ok(tr, `${s.id} at ${q.time_s}`);
      assert.equal(tr.el[k], s.el_deg, "elevation as the engine gave it");
      assert.equal(tr.az[k], ((s.az_deg % 360) + 360) % 360, "azimuth as the engine gave it, on 0–360");
      assert.equal(tr.t[k], q.time_s);
      assert.equal(tr.state[k], s.el_deg < 0 ? "below" : s.visible && !s.masked ? "used" : "masked");
    }
  }
  const c = stateCounts(sky.tracks, 0);
  assert.equal(c.used + c.masked + c.below, 6);
  assert.equal(sky.source, "presets");
});

test("the chart spec places each sample where the engine's az and el put it", async () => {
  const epochs = skyEpochs(0, 600, 3);
  const sky = await skyTracks({ call: fakeEngine, buildRequest, parseGeometry, site: { lat: 0, lon: 0 }, epochs, mask: 5, health: (id, t) => (id === "gps:3" && t > 0 ? "unhealthy" : null) });
  const spec = normalise(skySpec(sky, "Sky"));
  assert.equal(spec.mask, 5);
  for (const tr of spec.tracks) {
    const src = sky.tracks.find((x) => x.id === tr.id);
    for (let i = 0; i < tr.n; i++) {
      if (src.el[i] < 0) { assert.ok(Number.isNaN(tr.px[i]), "below the horizon is not drawn inside the circle"); continue; }
      const [x, y] = skyToXY(src.az[i], src.el[i]);
      assert.equal(tr.px[i], x); assert.equal(tr.py[i], y);
    }
  }
  assert.deepEqual(sky.tracks.find((x) => x.id === "gps:3").state.slice(1), ["unhealthy", "unhealthy"]);
  assert.deepEqual(Object.keys(spec.stateColors), Object.keys(SKY_STATES));
});
