// SPDX-License-Identifier: AGPL-3.0-only
// Tests of lib/globe.mjs and lib/globeview.mjs globeScene (0.42 U24): WGS-84 positions, coastline
// segments, coverage circles, the follow camera, region packs and the imagery sources' terms.
// Run: node --test apps/desktop/shell/lib/globe.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { ecefKm, landRings, segmentsOf, graticuleLines, coverageAngleDeg, circleLonLat, followCamera, subPoint, checkPack, packCovers, IMAGERY_SOURCES, tilesOf, tileKey, WGS84_A_KM, R_MEAN_KM } from "./globe.mjs";
import { globeScene } from "./globeview.mjs";
import { globeMesh, eyeOf } from "./chart/mat3d.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const near = (a, b, tol, msg) => assert.ok(Math.abs(a - b) <= tol, `${msg || ""} ${a} vs ${b}`);

test("WGS-84 Earth-fixed positions", () => {
  const [x, y, z] = ecefKm(0, 0, 0);
  assert.deepEqual([x, y, z], [WGS84_A_KM, 0, 0]);
  near(ecefKm(90, 0, 0)[2], 6356.752314, 1e-6, "polar radius");
  // the engine's own geodetic-to-ECEF: scenarios/jamming-demo.toml puts its jammer 1 km along x
  // from the receiver at 52.0 N, 4.0 E, 0 m ("position_ecef_m = [3926375.101, 274488.966, 5002803.345]")
  const toml = readFileSync(join(here, "../../../../scenarios/jamming-demo.toml"), "utf8");
  const jam = JSON.parse(/position_ecef_m = (\[[^\]]+\])/.exec(toml)[1]).map((v) => v / 1000);
  const p = ecefKm(52, 4, 0);
  near(p[0] + 1, jam[0], 1e-6, "x"); near(p[1], jam[1], 1e-6, "y"); near(p[2], jam[2], 1e-6, "z");
  const s = subPoint(ecefKm(10, -20, 0));
  near(s.lon, -20, 1e-9);
});

test("the bundled coastlines become segments on the globe, with no line along the antimeridian cut", () => {
  const land = JSON.parse(readFileSync(join(here, "../data/land-110m.json"), "utf8"));
  const rings = landRings(land);
  assert.equal(rings.length, land.rings.length);
  const seg = segmentsOf(rings, { hM: 8000, maxDeg: 3 });
  assert.equal(seg.length % 6, 0);
  let maxR = 0, minR = Infinity;
  for (let i = 0; i < seg.length; i += 3) { const r = Math.hypot(seg[i], seg[i + 1], seg[i + 2]); maxR = Math.max(maxR, r); minR = Math.min(minR, r); }
  assert.ok(maxR <= WGS84_A_KM + 8.01 && minR >= 6356.75 + 7.99, `${minR} ${maxR}`);
  // the split keeps every piece short (≤ 3° of arc ≈ 334 km)
  for (let i = 0; i < seg.length; i += 6) assert.ok(Math.hypot(seg[i] - seg[i + 3], seg[i + 1] - seg[i + 4], seg[i + 2] - seg[i + 5]) < 340);
  assert.equal(segmentsOf([[179, 0, -179, 0]], { closed: false }).length, 0, "an edge across ±180 is a cut");
  assert.equal(segmentsOf([[0, 0, 10, 0]], { closed: false, box: [0, -5, 10, 0] }).length, 0, "an edge along a pack's box is a cut");
  assert.ok(graticuleLines(30).length === 5 + 12);
});

test("coverage circles: a GPS satellite seen above 5° covers about 71° of arc; a station's circle is closed", () => {
  near(coverageAngleDeg(20200, 0), 76.1, 0.1, "GPS horizon");
  near(coverageAngleDeg(20200, 5), 71.2, 0.1, "GPS 5°");
  near(coverageAngleDeg(550, 10), 14.97, 0.01, "LEO at 550 km, 10°");
  assert.equal(coverageAngleDeg(0, 0), 0);
  const ring = circleLonLat(52, 4, 10, 36);
  assert.equal(ring.length, 72);
  // every point is 10° of arc from the centre
  const toV = (lat, lon) => { const a = (lat * Math.PI) / 180, b = (lon * Math.PI) / 180; return [Math.cos(a) * Math.cos(b), Math.cos(a) * Math.sin(b), Math.sin(a)]; };
  const c = toV(52, 4);
  for (let i = 0; i < ring.length; i += 2) { const v = toV(ring[i + 1], ring[i]); near((Math.acos(c[0] * v[0] + c[1] * v[1] + c[2] * v[2]) * 180) / Math.PI, 10, 1e-9); }
  assert.ok(R_MEAN_KM > 6371 && R_MEAN_KM < 6372);
});

test("follow mode puts the followed point under the camera", () => {
  const cam = { target: [0, 0, 0], dist: 4, fov: 0.7, ...followCamera(35, -120) };
  const e = eyeOf(cam);
  const p = ecefKm(35, -120, 0);
  const cosang = (e[0] * p[0] + e[1] * p[1] + e[2] * p[2]) / (Math.hypot(...e) * Math.hypot(...p));
  near(cosang, 1, 2e-5);
  assert.equal(followCamera(89, 0).pitch, 1.45, "short of the pole");
  const m = globeMesh(1, 0, 8, 4);
  assert.equal(m.positions.length / 3, 9 * 5);
  assert.equal(m.uvs.length / 2, 9 * 5);
  assert.equal(m.indices.length, 8 * 4 * 6);
});

test("region packs: the sample pack is a checked Natural Earth pack; bad packs are refused", () => {
  const pack = JSON.parse(readFileSync(join(here, "../data/packs/baltic-10m.mappack.json"), "utf8"));
  const c = checkPack(pack);
  assert.equal(c.ok, true, c.reason);
  assert.match(pack.licence, /public domain/);
  assert.equal(pack.land.scale, "10m");
  for (const r of landRings(pack.land)) for (let i = 0; i < r.length; i += 2) {
    assert.ok(r[i] >= 9 - 1e-9 && r[i] <= 31 + 1e-9 && r[i + 1] >= 53 - 1e-9 && r[i + 1] <= 66 + 1e-9, "clipped to its box");
  }
  assert.equal(packCovers(pack, [20, 57, 25, 60]), true);
  assert.equal(packCovers(pack, [5, 57, 25, 60]), false);
  assert.equal(checkPack({ ...pack, bbox: [10, 0, 5, 1] }).reason, "bbox");
  assert.equal(checkPack({ ...pack, licence: "" }).reason, "licence");
  assert.equal(checkPack({ ...pack, format: "x" }).reason, "format");
  assert.equal(checkPack(null).ok, false);
});

test("imagery: only sources whose terms allow offline keeping, credited; the tile grid is GIBS's EPSG:4326 matrix", () => {
  assert.ok(IMAGERY_SOURCES.length >= 1);
  for (const s of IMAGERY_SOURCES) {
    assert.match(s.template, /^https:\/\//);
    assert.ok(s.licence.length > 40 && /offline/.test(s.licence), "the terms say offline keeping is allowed");
    assert.ok(s.credit && s.terms);
  }
  const s = IMAGERY_SOURCES[0];
  assert.deepEqual([0, 1, 2, 3].map((l) => tilesOf(s, l).length), [2 * 1, 3 * 2, 5 * 3, 10 * 5]);
  const t2 = tilesOf(s, 2);
  assert.equal(t2[0].deg, 72);
  assert.equal(t2[6].url, s.template.replace("{level}", "2").replace("{row}", "1").replace("{col}", "1"));
  assert.equal(tileKey(s, t2[6]), `${s.id}/2/1/1.jpeg`);
});

test("the globe reads heights from the scenario's GeoJSON export", () => {
  const fc = { type: "FeatureCollection", features: [
    { type: "Feature", geometry: { type: "Point", coordinates: [4, 52, 10] }, properties: { name: "rx", role: "receiver" } },
    // the writer cuts a track at the antimeridian and adds a point at ±180 on each side, with no time of its own
    { type: "Feature", geometry: { type: "MultiLineString", coordinates: [[[170, 0, 2e7], [180, 1, 2e7]], [[-180, 1, 2e7], [-170, 2, 2e7], [-160, 3, 2e7]]] }, properties: { name: "G01", role: "satellite", times_utc: ["2026-01-01T00:00:00Z", "2026-01-01T00:01:00Z", "2026-01-01T00:02:00Z"] } },
  ] };
  const g = globeScene(fc);
  assert.deepEqual(g.sites, [{ id: "rx", role: "receiver", lon: 4, lat: 52, h: 10 }]);
  assert.equal(g.movers.length, 1);
  assert.deepEqual(g.movers[0].t, [0, 60, 120]);
  assert.deepEqual(g.movers[0].lon, [170, -170, -160]);
  assert.deepEqual(g.movers[0].h, [2e7, 2e7, 2e7]);
  assert.deepEqual(globeScene(null), { sites: [], movers: [] });
});
