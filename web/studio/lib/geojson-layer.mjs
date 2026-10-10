// SPDX-License-Identifier: AGPL-3.0-only
// Generic GeoJSON layer loading for the Studio's map pages (the interference map, first). Pure and
// synchronous; the page draws. It knows nothing about any one producer's fields: it checks the file is
// GeoJSON, keeps the collection's own members and every feature's properties as they are, finds the
// attribution and licence text the file carries (shown verbatim, never reworded) and projects geometry
// to a plane for drawing. Each file is its own layer and layers are never merged: two files may carry
// different licences (for example ADS-B-derived files are ODbL and AIS-derived files are public domain
// or NLOD), so one layer's data and notice never mix with another's. Tested in geojson-layer.test.mjs.

const GEOMS = new Set(["Point", "MultiPoint", "LineString", "MultiLineString", "Polygon", "MultiPolygon", "GeometryCollection"]);
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const isPos = (p) => Array.isArray(p) && p.length >= 2 && isNum(p[0]) && isNum(p[1]) && Math.abs(p[0]) <= 180 && Math.abs(p[1]) <= 90;

// Members a FeatureCollection defines itself; everything else is the producer's own.
const STANDARD = new Set(["type", "features", "bbox", "crs"]);
// Top-level (and `properties`/`metadata`) keys that carry a notice, found by name only.
const NOTICE_KEY = /attribution|licen[cs]e|copyright|credit|terms|source|provenance/i;

export function parseGeoJson(text, name = "file") {
  let o;
  try { o = JSON.parse(String(text).replace(/^﻿/, "")); } catch (e) { return { error: `${name}: not JSON (${e.message}).` }; }
  if (!o || typeof o !== "object") return { error: `${name}: not a GeoJSON object.` };
  let features;
  if (o.type === "FeatureCollection" && Array.isArray(o.features)) features = o.features;
  else if (o.type === "Feature") features = [o];
  else if (GEOMS.has(o.type)) features = [{ type: "Feature", properties: {}, geometry: o }];
  else return { error: `${name}: not GeoJSON (a FeatureCollection, Feature or geometry was expected).` };
  const meta = {};
  if (o.type === "FeatureCollection") for (const [k, v] of Object.entries(o)) if (!STANDARD.has(k)) meta[k] = v;
  if (features.length > MAX_FEATURES) return { error: `${name}: ${features.length} features; this page draws at most ${MAX_FEATURES}.` };
  const out = [];
  let skipped = 0;
  for (const f of features) {
    const g = f && f.geometry;
    if (!f || f.type !== "Feature" || !g || !GEOMS.has(g.type) || !validGeometry(g)) { skipped++; continue; }
    out.push({ properties: f.properties && typeof f.properties === "object" ? f.properties : {}, geometry: g, id: f.id ?? null });
  }
  return { layer: { name, meta, features: out, skipped, notices: findNotices(meta, out), bbox: bboxOf(out) } };
}

// A GeometryCollection may nest; nesting deeper than this is refused (it would only come from a hostile or broken
// file), so every later walk of a geometry is bounded. The check itself uses an explicit stack, not recursion.
export const MAX_GEOMETRY_DEPTH = 4;
export const MAX_FEATURES = 20000;
function validGeometry(root) {
  const stack = [[root, 0]];
  while (stack.length) {
    const [g, depth] = stack.pop();
    if (!g || typeof g !== "object" || !GEOMS.has(g.type) || depth > MAX_GEOMETRY_DEPTH) return false;
    switch (g.type) {
      case "Point": if (!isPos(g.coordinates)) return false; break;
      case "MultiPoint": case "LineString": if (!(Array.isArray(g.coordinates) && g.coordinates.length > 0 && g.coordinates.every(isPos))) return false; break;
      case "MultiLineString": case "Polygon": if (!(Array.isArray(g.coordinates) && g.coordinates.length > 0 && g.coordinates.every((r) => Array.isArray(r) && r.length > 0 && r.every(isPos)))) return false; break;
      case "MultiPolygon": if (!(Array.isArray(g.coordinates) && g.coordinates.length > 0 && g.coordinates.every((p) => Array.isArray(p) && p.every((r) => Array.isArray(r) && r.every(isPos))))) return false; break;
      case "GeometryCollection": if (!Array.isArray(g.geometries)) return false; for (const x of g.geometries) stack.push([x, depth + 1]); break;
    }
  }
  return true;
}

// Every [lon, lat] of a geometry.
export function* positions(root) {
  const stack = [root];
  while (stack.length) {
    const g = stack.pop();
    switch (g.type) {
      case "Point": yield g.coordinates; break;
      case "MultiPoint": case "LineString": yield* g.coordinates; break;
      case "MultiLineString": case "Polygon": for (const r of g.coordinates) yield* r; break;
      case "MultiPolygon": for (const p of g.coordinates) for (const r of p) yield* r; break;
      case "GeometryCollection": for (const x of g.geometries) stack.push(x); break;
    }
  }
}

function bboxOf(features) {
  let w = Infinity, s = Infinity, e = -Infinity, n = -Infinity;
  for (const f of features) for (const p of positions(f.geometry)) { w = Math.min(w, p[0]); e = Math.max(e, p[0]); s = Math.min(s, p[1]); n = Math.max(n, p[1]); }
  return isFinite(w) ? { west: w, south: s, east: e, north: n } : null;
}

// Text the file carries about where its data came from and on what terms, verbatim and labelled with
// the key it was found under. Looks at the collection's own members and one level into `properties` or
// `metadata` objects of the collection; strings only (or arrays of strings joined with a newline).
export function findNotices(meta) {
  const found = [];
  const take = (path, v) => {
    if (typeof v === "string" && v.trim()) found.push({ key: path, text: v });
    else if (Array.isArray(v) && v.length && v.every((x) => typeof x === "string")) found.push({ key: path, text: v.join("\n") });
  };
  for (const [k, v] of Object.entries(meta)) {
    if (NOTICE_KEY.test(k)) take(k, v);
    else if (v && typeof v === "object" && !Array.isArray(v)) for (const [k2, v2] of Object.entries(v)) if (NOTICE_KEY.test(k2)) take(`${k}.${k2}`, v2);
  }
  return found;
}

// Layers are separate by construction. This is the only place the page may combine them, and it refuses
// to merge geometry or notices: it returns the layers side by side, each with its own notice.
export function stackLayers(layers) {
  return layers.map((l, i) => ({ index: i, name: l.name, layer: l, noticeMissing: l.notices.length === 0 }));
}

// Equirectangular projection to a plane for drawing: x east, y north (up), one scale on both axes.
// Fine for the regional extents these maps show; not for a world map or an antimeridian crossing.
export function makeView(bbox, width, height, pad = 12) {
  if (!bbox) return null;
  const lat0 = (bbox.north + bbox.south) / 2, c = Math.cos(lat0 * Math.PI / 180);
  const wDeg = Math.max(1e-9, (bbox.east - bbox.west) * c), hDeg = Math.max(1e-9, bbox.north - bbox.south);
  const k = Math.min((width - 2 * pad) / wDeg, (height - 2 * pad) / hDeg);
  const x0 = (width - wDeg * k) / 2, y0 = (height - hDeg * k) / 2;
  return {
    k,
    project: ([lon, lat]) => [x0 + (lon - bbox.west) * c * k, y0 + (bbox.north - lat) * k],
    invert: ([x, y]) => [bbox.west + (x - x0) / (c * k), bbox.north - (y - y0) / k],
  };
}

// SVG path data of a geometry through a projection. Rings close with Z; points are not paths (see pointsOf).
export function pathOf(g, project) {
  const ring = (r) => r.map((p, i) => { const [x, y] = project(p); return `${i ? "L" : "M"}${x.toFixed(1)} ${y.toFixed(1)}`; }).join("");
  switch (g.type) {
    case "LineString": return ring(g.coordinates);
    case "MultiLineString": return g.coordinates.map(ring).join("");
    case "Polygon": return g.coordinates.map((r) => ring(r) + "Z").join("");
    case "MultiPolygon": return g.coordinates.map((p) => p.map((r) => ring(r) + "Z").join("")).join("");
    case "GeometryCollection": return g.geometries.map((x) => pathOf(x, project)).join("");
    default: return "";
  }
}
export function pointsOf(g) {
  if (g.type === "Point") return [g.coordinates];
  if (g.type === "MultiPoint") return g.coordinates;
  if (g.type === "GeometryCollection") return g.geometries.flatMap(pointsOf);
  return [];
}

// Is a [lon, lat] inside a geometry's polygons? (even-odd, holes respected), for hover and click.
export function containsPoint(g, p) {
  const inRing = (r) => { let c = false; for (let i = 0, j = r.length - 1; i < r.length; j = i++) { const a = r[i], b = r[j]; if ((a[1] > p[1]) !== (b[1] > p[1]) && p[0] < ((b[0] - a[0]) * (p[1] - a[1])) / (b[1] - a[1]) + a[0]) c = !c; } return c; };
  const poly = (rings) => rings.reduce((n, r) => n + (inRing(r) ? 1 : 0), 0) % 2 === 1;
  if (g.type === "Polygon") return poly(g.coordinates);
  if (g.type === "MultiPolygon") return g.coordinates.some(poly);
  if (g.type === "GeometryCollection") return g.geometries.some((x) => containsPoint(x, p));
  return false;
}
