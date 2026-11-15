// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: markers and delta markers (0.42 U12). Run: node --test apps/desktop/shell/lib/markers.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { markersOf, markerRows, markerPlaces, markerRefs } from "./markers.mjs";

const items = [{ x: 60, y: 2.5, unit: "ns", label: "quantum" }, { x: 180, y: 8.5, unit: "ns", label: "quantum" }];

test("two markers read out their values, Δt, Δ value and the slope", () => {
  const m = markersOf(items);
  assert.deepEqual(m.map((x) => x.name), ["A", "B"]);
  const rows = markerRows(m);
  assert.deepEqual(rows.map((r) => r.k), ["A", "B", "Δt", "Δ value", "slope"]);
  assert.equal(rows[0].v, "T+0:01:00 · 2.5 ns · quantum");
  assert.equal(rows[2].v, "120 s");
  assert.equal(rows[3].v, "6 ns");
  assert.equal(rows[4].v, "0.05 ns/s");
  const utc = markerRows(m, { epochMs: Date.UTC(2026, 0, 1, 12, 0, 0) });
  assert.equal(utc[1].v.slice(0, 12), "12:03:00 UTC");
  assert.equal(markerRows(markersOf([items[0]])).length, 1, "one marker: its readout only");
  assert.deepEqual(markersOf([]), []);
});

test("markers sit on the map at the run's position at the same instant", () => {
  const track = { t: Float64Array.from([0, 100, 200]), lat: Float64Array.from([59, 59.1, 59.2]), lon: Float64Array.from([24, 24.2, 24.4]) };
  const places = markerPlaces({ track, movers: [], sites: [] }, markersOf(items));
  assert.equal(places.length, 2);
  assert.ok(Math.abs(places[0].lat - 59.06) < 1e-12 && Math.abs(places[0].lon - 24.12) < 1e-12);
  assert.ok(Math.abs(places[1].lat - 59.18) < 1e-12);
  assert.deepEqual(markerPlaces({ track, movers: [], sites: [] }, markersOf([{ x: 500, y: 1 }])), [], "outside the track: not placed");
  const fixed = markerPlaces({ track: null, movers: [], sites: [{ role: "receiver", lat: 1, lon: 2 }] }, markersOf(items));
  assert.deepEqual(fixed.map((p) => [p.lat, p.lon]), [[1, 2], [1, 2]]);
});

test("saved markers find their samples again", () => {
  const series = [{ id: "s0", label: "classical", x: Float64Array.from([0, 30, 60, 90]) }, { id: "s1", label: "quantum", x: Float64Array.from([0, 30, 60, 90]) }];
  assert.deepEqual(markerRefs(series, [{ t: 60, series: "quantum" }, { t: 75, series: "quantum" }, { t: 90, series: "nope" }]), [{ sid: "s1", i: 2 }, { sid: "s0", i: 3 }]);
});
