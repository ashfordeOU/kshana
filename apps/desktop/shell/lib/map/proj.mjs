// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop map (0.42 U15): Web Mercator (spherical, EPSG:3857) projection, the view
// (centre and zoom), pan and zoom about a point, fitting a box, ground distances, the scale
// bar, the graticule step and the packed Natural Earth land rings. Pure, no DOM; tested in
// ../clock.test.mjs.

/** WGS 84 equatorial radius (m), the sphere Web Mercator projects. */
export const R_EARTH = 6378137;
/** Web Mercator stops at this latitude (the square world). */
export const MAX_LAT = 85.0511287798066;
/** World units span one tile of this many pixels at zoom 0. */
export const TILE = 256;
export const MIN_ZOOM = 0;
export const MAX_ZOOM = 18;
export const PROJECTION_NAME = "Web Mercator";

const rad = Math.PI / 180;
const clamp = (x, a, b) => Math.min(b, Math.max(a, x));

/** Longitude, latitude (deg) to world units: x and y in [0, 1], y down (north at 0). */
export function toWorld(lon, lat) {
  const s = Math.sin(clamp(lat, -MAX_LAT, MAX_LAT) * rad);
  return [lon / 360 + 0.5, clamp(0.5 - Math.log((1 + s) / (1 - s)) / (4 * Math.PI), 0, 1)];
}
/** World units to longitude, latitude (deg); x outside [0, 1] gives longitudes past ±180, wrapped. */
export function fromWorld(x, y) {
  let lon = (x - 0.5) * 360;
  lon = ((((lon + 180) % 360) + 360) % 360) - 180;
  const lat = (2 * Math.atan(Math.exp((0.5 - y) * 2 * Math.PI)) - Math.PI / 2) / rad;
  return [lon, lat];
}

/** Pixels per world unit at `zoom`. */
export const scaleOf = (zoom) => TILE * 2 ** zoom;

/** A view { cx, cy (world units of the centre), zoom } kept inside the world. */
export function makeView(cx, cy, zoom) {
  const z = clamp(zoom, MIN_ZOOM, MAX_ZOOM);
  return { cx: ((cx % 1) + 1) % 1, cy: clamp(cy, 0, 1), zoom: z };
}

/** Screen pixel of a world point in a view of w × h pixels. */
export function worldToScreen(v, w, h, x, y) {
  const k = scaleOf(v.zoom);
  return [(x - v.cx) * k + w / 2, (y - v.cy) * k + h / 2];
}
/** World point under a screen pixel. */
export function screenToWorld(v, w, h, px, py) {
  const k = scaleOf(v.zoom);
  return [v.cx + (px - w / 2) / k, v.cy + (py - h / 2) / k];
}
/** Screen pixel of a longitude, latitude, on the copy of the world nearest the view's centre. */
export function project(v, w, h, lon, lat) {
  let [x, y] = toWorld(lon, lat);
  x += Math.round(v.cx - x);
  return worldToScreen(v, w, h, x, y);
}
/** Longitude, latitude under a screen pixel. */
export function unproject(v, w, h, px, py) {
  const [x, y] = screenToWorld(v, w, h, px, py);
  return fromWorld(x, clamp(y, 0, 1));
}

/** The view after zooming by `factor` keeping the point under pixel (px, py) still. */
export function zoomAbout(v, w, h, factor, px, py) {
  const z = clamp(v.zoom + Math.log2(factor), MIN_ZOOM, MAX_ZOOM);
  const [wx, wy] = screenToWorld(v, w, h, px, py);
  const k = scaleOf(z);
  return makeView(wx - (px - w / 2) / k, wy - (py - h / 2) / k, z);
}
/** The view after dragging the map by (dx, dy) pixels. */
export function panBy(v, dx, dy) {
  const k = scaleOf(v.zoom);
  return makeView(v.cx - dx / k, v.cy - dy / k, v.zoom);
}

/**
 * The view that shows a box of longitudes and latitudes ({ west, south, east, north }, west
 * may exceed east across the antimeridian) in w × h pixels with `pad` pixels to spare, no
 * closer than `maxZoom`.
 */
export function fitBounds(b, w, h, { pad = 24, maxZoom = 12, minSpanM = 2000 } = {}) {
  let [x0, y1] = toWorld(b.west, b.south);
  let [x1, y0] = toWorld(b.east, b.north);
  if (x1 < x0) x1 += 1;
  // A single point (or a tiny box) is shown at least minSpanM across.
  const minSpan = minSpanM / (2 * Math.PI * R_EARTH * Math.cos(clamp((b.south + b.north) / 2, -MAX_LAT, MAX_LAT) * rad));
  const dx = Math.max(x1 - x0, minSpan), dy = Math.max(y1 - y0, minSpan);
  const k = Math.min((w - 2 * pad) / dx, (h - 2 * pad) / dy);
  const zoom = clamp(Math.log2(Math.max(k, 1e-9) / TILE), MIN_ZOOM, maxZoom);
  return makeView((x0 + x1) / 2, (y0 + y1) / 2, zoom);
}

/**
 * The box around a list of longitudes and latitudes ({ west, south, east, north }), taking
 * the shorter way around the antimeridian; null for none.
 */
export function boundsOf(lons, lats) {
  const n = lons.length;
  if (!n) return null;
  let s = Infinity, nn = -Infinity;
  for (let i = 0; i < n; i++) { s = Math.min(s, lats[i]); nn = Math.max(nn, lats[i]); }
  const sorted = Float64Array.from(lons).sort();
  // The widest gap between sorted longitudes (wrapping) is left out of the box.
  let gap = sorted[0] + 360 - sorted[n - 1], at = 0;
  for (let i = 1; i < n; i++) if (sorted[i] - sorted[i - 1] > gap) { gap = sorted[i] - sorted[i - 1]; at = i; }
  const west = sorted[at], east = sorted[(at - 1 + n) % n];
  return { west, south: s, east, north: nn };
}

/** Great-circle distance (m) on the Web Mercator sphere. */
export function haversine(lat1, lon1, lat2, lon2) {
  const a = Math.sin(((lat2 - lat1) * rad) / 2) ** 2 + Math.cos(lat1 * rad) * Math.cos(lat2 * rad) * Math.sin(((lon2 - lon1) * rad) / 2) ** 2;
  return 2 * R_EARTH * Math.asin(Math.min(1, Math.sqrt(a)));
}

/** Ground metres per screen pixel at latitude `lat` in a view at `zoom`. */
export const metresPerPixel = (lat, zoom) => (2 * Math.PI * R_EARTH * Math.cos(clamp(lat, -MAX_LAT, MAX_LAT) * rad)) / scaleOf(zoom);

/** A 1-2-5 number at or below x. */
export function niceBelow(x) {
  if (!(x > 0)) return 0;
  const p = 10 ** Math.floor(Math.log10(x));
  const m = x / p;
  return (m >= 5 ? 5 : m >= 2 ? 2 : 1) * p;
}

/** The scale bar for at most `maxPx` pixels: { metres, px, text } ("100 km", "500 m"). */
export function scaleBar(mpp, maxPx = 120) {
  const metres = niceBelow(mpp * maxPx);
  const text = metres >= 1000 ? `${metres / 1000} km` : `${metres} m`;
  return { metres, px: metres / mpp, text };
}

/** The graticule step (deg) for a view whose width spans `degWide` degrees of longitude. */
export function graticuleStep(degWide) {
  const steps = [30, 20, 10, 5, 2, 1, 0.5, 0.2, 0.1, 0.05, 0.02, 0.01];
  const want = degWide / 6;
  return steps.find((s) => s <= want) ?? 0.01;
}

/**
 * The rings of a packed Natural Earth layer ("kshana-land/1", written by
 * apps/desktop/tools/pack_natural_earth.py): [{ xy: Float64Array of world x, y pairs, bbox:
 * [minX, minY, maxX, maxY] }]. Vertices past ±85.05° latitude are held at the edge.
 */
export function decodeLand(packed) {
  if (!packed || packed.format !== "kshana-land/1" || !Array.isArray(packed.rings)) throw new Error("not a kshana-land/1 layer");
  const q = Number(packed.quantum);
  return packed.rings.map((r) => {
    const n = r.length >> 1;
    const xy = new Float64Array(n * 2);
    let x = 0, y = 0, minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
    for (let i = 0; i < n; i++) {
      x += r[2 * i]; y += r[2 * i + 1];
      const [wx, wy] = toWorld(x * q, y * q);
      xy[2 * i] = wx; xy[2 * i + 1] = wy;
      if (wx < minX) minX = wx; if (wx > maxX) maxX = wx; if (wy < minY) minY = wy; if (wy > maxY) maxY = wy;
    }
    return { xy, bbox: [minX, minY, maxX, maxY] };
  });
}

/** Whether a world box meets the view (on world copy `k`, an x offset in world units). */
export function boxInView(v, w, h, bbox, k = 0) {
  const s = scaleOf(v.zoom);
  const hw = w / 2 / s, hh = h / 2 / s;
  return bbox[2] + k >= v.cx - hw && bbox[0] + k <= v.cx + hw && bbox[3] >= v.cy - hh && bbox[1] <= v.cy + hh;
}

/** The world copies (x offsets) a view of w pixels shows: [-1, 0, 1] at most. */
export function worldCopies(v, w) {
  const hw = w / 2 / scaleOf(v.zoom);
  const out = [];
  for (const k of [-1, 0, 1]) if (v.cx + hw > k && v.cx - hw < k + 1) out.push(k);
  return out;
}

/** A ring of `n` points (lon, lat) at `radius` metres around a centre, for an area the engine gives as a radius only. */
export function circleRing(lat, lon, radius, n = 72) {
  const d = radius / R_EARTH, la = lat * rad, lo = lon * rad;
  const out = [];
  for (let i = 0; i <= n; i++) {
    const b = (2 * Math.PI * i) / n;
    const la2 = Math.asin(Math.sin(la) * Math.cos(d) + Math.cos(la) * Math.sin(d) * Math.cos(b));
    const lo2 = lo + Math.atan2(Math.sin(b) * Math.sin(d) * Math.cos(la), Math.cos(d) - Math.sin(la) * Math.sin(la2));
    out.push([(((lo2 / rad + 540) % 360) - 180), la2 / rad]);
  }
  return out;
}

/**
 * The index of the screen point nearest (px, py) within `maxPx`, or -1. `xs`, `ys` are screen
 * coordinates (NaN for a point not drawn).
 */
export function nearestPoint(xs, ys, px, py, maxPx = 8) {
  let best = -1, bd = maxPx * maxPx;
  for (let i = 0; i < xs.length; i++) {
    const dx = xs[i] - px, dy = ys[i] - py, d = dx * dx + dy * dy;
    if (d <= bd) { bd = d; best = i; }
  }
  return best;
}

/** A latitude and longitude as text: "59.4433° N · 24.7512° E". */
export function latLonText(lat, lon, digits = 4) {
  return `${Math.abs(lat).toFixed(digits)}° ${lat >= 0 ? "N" : "S"} · ${Math.abs(lon).toFixed(digits)}° ${lon >= 0 ? "E" : "W"}`;
}
