// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the generic GeoJSON layer loader. Run with `node lib/geojson-layer.test.mjs`.
import assert from "node:assert/strict";
import { MAX_GEOMETRY_DEPTH, MAX_FEATURES, parseGeoJson, findNotices, stackLayers, makeView, pathOf, pointsOf, containsPoint, positions } from "./geojson-layer.mjs";

const sq = (w, s, e, n) => [[[w, s], [e, s], [e, n], [w, n], [w, s]]];
const fc = (extra, feats) => JSON.stringify({ type: "FeatureCollection", ...extra, features: feats });
const cell = (id, c) => ({ type: "Feature", id, properties: { n: id }, geometry: { type: "Polygon", coordinates: sq(...c) } });

// A collection: producer members kept as they are; notices found by name and quoted verbatim.
{
  const text = fc({ attribution: "Contains data (c) the ones named here.", license: "Open Database License 1.0", method: { window_s: 3600, threshold: 0.2 }, notes: "free text" },
    [cell("a", [24, 59, 24.1, 59.1]), cell("b", [24.1, 59, 24.2, 59.1])]);
  const { layer, error } = parseGeoJson(text, "day.geojson");
  assert.equal(error, undefined);
  assert.equal(layer.features.length, 2);
  assert.deepEqual(layer.meta.method, { window_s: 3600, threshold: 0.2 });
  assert.deepEqual(layer.notices.map((n) => n.key).sort(), ["attribution", "license"]);
  assert.equal(layer.notices.find((n) => n.key === "license").text, "Open Database License 1.0", "verbatim");
  assert.deepEqual(layer.bbox, { west: 24, south: 59, east: 24.2, north: 59.1 });
}
// Notices one level down, and arrays of lines.
assert.deepEqual(findNotices({ metadata: { licence: "NLOD 2.0", method: "m" }, credits: ["a", "b"] }).map((n) => [n.key, n.text]), [["metadata.licence", "NLOD 2.0"], ["credits", "a\nb"]]);
assert.deepEqual(findNotices({ method: { x: 1 } }), []);
// No notice found is reported, not invented.
{
  const { layer } = parseGeoJson(fc({}, [cell("a", [0, 0, 1, 1])]), "bare");
  assert.deepEqual(layer.notices, []);
  assert.equal(stackLayers([layer])[0].noticeMissing, true);
}
// Layers stay separate: two licences never mix.
{
  const a = parseGeoJson(fc({ license: "ODbL 1.0" }, [cell("a", [0, 0, 1, 1])]), "adsb.geojson").layer;
  const b = parseGeoJson(fc({ license: "NLOD" }, [cell("b", [2, 2, 3, 3])]), "ais.geojson").layer;
  const s = stackLayers([a, b]);
  assert.equal(s.length, 2);
  assert.deepEqual(s.map((x) => x.layer.notices[0].text), ["ODbL 1.0", "NLOD"]);
  assert.equal(s[0].layer.features.length, 1); assert.equal(s[1].layer.features.length, 1);
}
// Refusals say why; bad features are skipped and counted.
assert.match(parseGeoJson("nope", "x").error, /not JSON/);
assert.match(parseGeoJson("{}", "x").error, /not GeoJSON/);
assert.match(parseGeoJson("3", "x").error, /not a GeoJSON object/);
{
  const text = fc({}, [cell("ok", [0, 0, 1, 1]), { type: "Feature", properties: {}, geometry: null }, { type: "Feature", properties: {}, geometry: { type: "Point", coordinates: [200, 0] } }, { type: "Feature", properties: {}, geometry: { type: "Polygon", coordinates: [] } }]);
  const { layer } = parseGeoJson(text, "x");
  assert.equal(layer.features.length, 1); assert.equal(layer.skipped, 3);
}
// A bare geometry or Feature loads too.
assert.equal(parseGeoJson(JSON.stringify({ type: "Point", coordinates: [24, 59] }), "p").layer.features.length, 1);
assert.equal(parseGeoJson(JSON.stringify(cell("a", [0, 0, 1, 1])), "f").layer.features.length, 1);
// Geometry helpers.
{
  const g = { type: "Polygon", coordinates: [...sq(0, 0, 10, 10), [[4, 4], [6, 4], [6, 6], [4, 6], [4, 4]]] };
  assert.equal(containsPoint(g, [1, 1]), true);
  assert.equal(containsPoint(g, [5, 5]), false, "inside the hole");
  assert.equal(containsPoint(g, [11, 5]), false);
  assert.equal(containsPoint({ type: "MultiPolygon", coordinates: [sq(0, 0, 1, 1), sq(5, 5, 6, 6)] }, [5.5, 5.5]), true);
  assert.equal([...positions({ type: "MultiPolygon", coordinates: [sq(0, 0, 1, 1)] })].length, 5);
  const v = makeView({ west: 24, south: 59, east: 25, north: 60 }, 400, 400, 0);
  const [x, y] = v.project([24, 60]);
  assert.ok(Math.abs(x - (400 - 400 * Math.cos(59.5 * Math.PI / 180)) / 2) < 0.01 && Math.abs(y) < 0.01, "north-west corner, equal scale on both axes");
  const back = v.invert(v.project([24.3, 59.2]));
  assert.ok(Math.abs(back[0] - 24.3) < 1e-9 && Math.abs(back[1] - 59.2) < 1e-9, "invert undoes project");
  assert.match(pathOf(g, v.project), /^M[-\d. ]+L.*Z/);
  assert.deepEqual(pointsOf({ type: "GeometryCollection", geometries: [{ type: "Point", coordinates: [1, 2] }, { type: "MultiPoint", coordinates: [[3, 4], [5, 6]] }] }), [[1, 2], [3, 4], [5, 6]]);
  assert.equal(makeView(null, 10, 10), null);
}
// Hostile or broken geometry: deep nesting is refused without recursion, a huge ring needs no spread, a collection of
// features past the cap is refused with a reason.
{
  const r = parseGeoJson(JSON.stringify({ type: "FeatureCollection", features: [{ type: "Feature", properties: {}, geometry: { type: "GeometryCollection", geometries: [{ type: "GeometryCollection", geometries: [{ type: "Point", coordinates: [1, 2] }] }] } }] }), "ok");
  assert.equal(r.layer.features.length, 1, "shallow nesting is fine");
  // build a deep one without JSON.stringify recursion limits: nest to MAX+1 by hand
  let deep = { type: "Point", coordinates: [1, 2] };
  for (let i = 0; i < MAX_GEOMETRY_DEPTH + 1; i++) deep = { type: "GeometryCollection", geometries: [deep] };
  const d = parseGeoJson(JSON.stringify({ type: "FeatureCollection", features: [{ type: "Feature", properties: {}, geometry: deep }] }), "deep");
  assert.equal(d.layer.features.length, 0); assert.equal(d.layer.skipped, 1);
  const ring = Array.from({ length: 300000 }, (_, i) => [24 + (i % 100) * 1e-4, 59 + (i % 7) * 1e-4]); ring.push(ring[0]);
  const big = parseGeoJson(JSON.stringify({ type: "Polygon", coordinates: [ring] }), "big");
  assert.deepEqual(Object.keys(big.layer.bbox), ["west", "south", "east", "north"]);
  const many = { type: "FeatureCollection", features: Array.from({ length: MAX_FEATURES + 1 }, () => ({ type: "Feature", properties: {}, geometry: { type: "Point", coordinates: [1, 1] } })) };
  assert.match(parseGeoJson(JSON.stringify(many), "many").error, /at most 20000/);
}
console.log("geojson-layer.test.mjs: ok");
