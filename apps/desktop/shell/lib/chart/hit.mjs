// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): hit-testing. Pure, no DOM; tested in chart.test.mjs.
// Everything here works in screen pixels handed in by the chart, so it is the same maths for
// linear, log and polar views.
import { lowerBound } from "./decimate.mjs";

/** Index of the point nearest to x in a sorted xs (ties go to the earlier point); -1 when empty. */
export function nearestX(xs, x) {
  const n = xs.length;
  if (!n) return -1;
  const i = lowerBound(xs, x);
  if (i <= 0) return 0;
  if (i >= n) return n - 1;
  return x - xs[i - 1] <= xs[i] - x ? i - 1 : i;
}

/** Of a sorted series, the nearest point to x whose y is a number (looks outward from nearestX). */
export function nearestValid(xs, ys, x) {
  const n = xs.length;
  let i = nearestX(xs, x);
  if (i < 0 || ys[i] === ys[i]) return i;
  for (let k = 1; k < n; k++) {
    const a = i - k, b = i + k;
    const da = a >= 0 && ys[a] === ys[a] ? x - xs[a] : Infinity;
    const db = b < n && ys[b] === ys[b] ? xs[b] - x : Infinity;
    if (da !== Infinity || db !== Infinity) return da <= db ? a : b;
  }
  return -1;
}

/**
 * The point nearest to the pixel (px, py) by screen distance, among indices i0..i1-1, within
 * maxDist pixels. mapX/mapY give screen positions. Returns { i, d } or null.
 */
export function nearestPoint(xs, ys, mapX, mapY, px, py, maxDist = Infinity, i0 = 0, i1 = xs.length) {
  let best = -1, bd = maxDist * maxDist;
  for (let i = i0; i < i1; i++) {
    const y = ys[i];
    if (y !== y) continue;
    const dx = mapX(xs[i]) - px, dy = mapY(y) - py;
    const d = dx * dx + dy * dy;
    if (d < bd || (d === bd && best < 0)) { bd = d; best = i; }
  }
  return best < 0 ? null : { i: best, d: Math.sqrt(bd) };
}

/** The cell of a grid with edges xe (length nx+1) and ye (ny+1) holding (x, y); null outside. */
export function gridCell(xe, ye, x, y) {
  const inside = (e, v) => (e[0] <= e[e.length - 1] ? v >= e[0] && v <= e[e.length - 1] : v <= e[0] && v >= e[e.length - 1]);
  if (!inside(xe, x) || !inside(ye, y)) return null;
  const find = (e, v) => {
    const asc = e[0] <= e[e.length - 1];
    let lo = 0, hi = e.length - 1;
    while (hi - lo > 1) { const m = (lo + hi) >> 1; if (asc ? e[m] <= v : e[m] >= v) lo = m; else hi = m; }
    return lo;
  };
  return { ix: find(xe, x), iy: find(ye, y) };
}

/** Cell edges from cell centres (half-way between centres, extrapolated at the ends). */
export function edgesOf(centres) {
  const n = centres.length;
  if (n === 1) return [centres[0] - 0.5, centres[0] + 0.5];
  const e = new Array(n + 1);
  for (let i = 1; i < n; i++) e[i] = (centres[i - 1] + centres[i]) / 2;
  e[0] = centres[0] - (e[1] - centres[0]);
  e[n] = centres[n - 1] + (centres[n - 1] - e[n - 1]);
  return e;
}

/** A sky position (azimuth from north, clockwise; elevation above the horizon, degrees) on the unit disk: zenith at the centre, horizon at radius 1, north up. */
export function skyToXY(azDeg, elDeg) {
  const r = (90 - elDeg) / 90, a = (azDeg * Math.PI) / 180;
  return [r * Math.sin(a), r * Math.cos(a)];
}
/** The inverse of skyToXY: { az, el } in degrees, azimuth in [0, 360). */
export function xyToSky(x, y) {
  const r = Math.hypot(x, y);
  let az = (Math.atan2(x, y) * 180) / Math.PI;
  if (az < 0) az += 360;
  return { az, el: 90 - r * 90 };
}

/** Even-odd point-in-polygon test; poly is [[x, y], ...]. */
export function inPolygon(poly, x, y) {
  let inside = false;
  for (let i = 0, j = poly.length - 1; i < poly.length; j = i++) {
    const [xi, yi] = poly[i], [xj, yj] = poly[j];
    if ((yi > y) !== (yj > y) && x < ((xj - xi) * (y - yi)) / (yj - yi) + xi) inside = !inside;
  }
  return inside;
}

/**
 * Stanford-plot region of an epoch (position error e, protection level pl, alert limit al):
 * "nominal" (e < pl < al), "unavailable" (pl >= al, e < pl), "mi" (misleading information:
 * e >= pl, pl < al and e < al), "hmi" (hazardously misleading: e >= pl, e >= al, pl < al),
 * "unavailable-mi" (pl >= al and e >= pl).
 */
export function stanfordRegion(e, pl, al) {
  if (pl >= al) return e >= pl ? "unavailable-mi" : "unavailable";
  if (e < pl) return "nominal";
  return e >= al ? "hmi" : "mi";
}

/** Indices of points whose epoch is inside the range [t0, t1] (inclusive). */
export function inRange(ts, t0, t1) {
  const out = [];
  if (!ts) return out;
  for (let i = 0; i < ts.length; i++) if (ts[i] >= t0 && ts[i] <= t1) out.push(i);
  return out;
}
