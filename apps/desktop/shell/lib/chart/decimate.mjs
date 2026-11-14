// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): min/max decimation per pixel column and the searches behind it.
// Pure, no DOM; tested in chart.test.mjs. For a series sorted by x, each pixel column keeps its
// first, lowest, highest and last point (in index order), so the drawn polyline covers exactly
// the vertical extent of the raw data in that column and joins its neighbours where the raw
// line does: a million points draw as a few thousand vertices with no visible difference.
// A NaN y breaks the line (a gap); the gap is kept as the index -1.

/** First index i in [lo, hi) with xs[i] >= v (xs sorted ascending). */
export function lowerBound(xs, v, lo = 0, hi = xs.length) {
  while (lo < hi) { const m = (lo + hi) >>> 1; if (xs[m] < v) lo = m + 1; else hi = m; }
  return lo;
}

/** The index range [i0, i1) to draw for the x window [x0, x1], with one point beyond each edge so lines reach the frame. */
export function visibleRange(xs, x0, x1) {
  const n = xs.length;
  if (!n) return [0, 0];
  const i0 = Math.max(0, lowerBound(xs, x0) - 1);
  let j = lowerBound(xs, x1, i0);
  while (j < n && xs[j] <= x1) j++; // past points equal to x1
  const i1 = Math.min(n, j + 1);
  return [i0, i1];
}

/** True when xs is sorted ascending (ignoring nothing: a NaN x makes it unsorted). */
export function isSorted(xs) {
  for (let i = 1; i < xs.length; i++) if (!(xs[i] >= xs[i - 1])) return false;
  return true;
}

/**
 * M4 decimation of points i0..i1-1. `col(x)` gives a point's pixel column (a number; it is
 * floored). Returns an Int32Array of point indices in drawing order (-1 marks a gap), with at
 * most four indices per column: first, min, max, last.
 */
export function m4(xs, ys, i0, i1, col) {
  let buf = new Int32Array(Math.min(Math.max(16, i1 - i0 + 4), 4 * 8192)), n = 0;
  const push = (i) => {
    if (n >= buf.length) { const b = new Int32Array(buf.length * 2); b.set(buf); buf = b; }
    buf[n++] = i;
  };
  let c = NaN, first = -1, lo = -1, hi = -1, last = -1, gap = false;
  const flush = () => {
    if (first < 0) return;
    const four = [first, lo, hi, last].sort((a, b) => a - b);
    let prev = -2;
    for (const i of four) if (i !== prev) { push(i); prev = i; }
  };
  for (let i = i0; i < i1; i++) {
    const y = ys[i];
    if (y !== y) { // NaN: a gap
      flush(); first = -1; c = NaN;
      if (!gap && n) { push(-1); gap = true; }
      continue;
    }
    gap = false;
    const ci = Math.floor(col(xs[i]));
    if (ci !== c) {
      flush();
      c = ci; first = lo = hi = last = i;
      continue;
    }
    if (y < ys[lo]) lo = i;
    if (y > ys[hi]) hi = i;
    last = i;
  }
  flush();
  return buf.subarray(0, n);
}

/**
 * Pixel-deduplicated scatter: of the points i0..i1-1 that land inside a w×h raster, keep the
 * first per pixel cell of `cell` px. Returns point indices. 100k points become at most w·h/cell².
 */
export function dedupePoints(xs, ys, i0, i1, mapX, mapY, w, h, cell = 1) {
  const cw = Math.ceil(w / cell), ch = Math.ceil(h / cell);
  const seen = new Uint8Array(cw * ch);
  const out = [];
  for (let i = i0; i < i1; i++) {
    const px = mapX(xs[i]), py = mapY(ys[i]);
    if (!(px >= 0 && px < w && py >= 0 && py < h)) continue;
    const k = ((py / cell) | 0) * cw + ((px / cell) | 0);
    if (seen[k]) continue;
    seen[k] = 1;
    out.push(i);
  }
  return out;
}
