// SPDX-License-Identifier: AGPL-3.0-only
// Skyline drawing for the Geometry view (design note 2026-10-12, sections 3.1 and 3.4). A drawn skyline is
// the same thing the engine uses: a table of 360 one-degree azimuth bins (bin k covers azimuth k), each the
// minimum elevation a satellite must clear, snapped to 0.5 degree and below 90 degrees. Here it is a
// Uint8Array of half-degrees (0..179). The person paints it on the skyplot with the pointer, or moves a
// cursor round the horizon with the keyboard. Which satellites it hides, and what that does to the geometry,
// is the engine's answer (lib/geometry-adapter.mjs). Pure; tested in skyline-edit.test.mjs.

export const BINS = 360;
export const MAX_HALF = 179;            // 89.5 degrees: elevations are in [0, 90)
export const ENCODED_LENGTH = 480;      // 360 bytes in base64url, no padding

export const emptyTable = () => new Uint8Array(BINS);
export const binOf = (az) => ((Math.round(az) % BINS) + BINS) % BINS;
export const snapHalf = (el) => Math.max(0, Math.min(MAX_HALF, Math.round(el * 2)));
export const elAt = (table, az) => table[binOf(az)] / 2;
export const isOpen = (table) => !table || table.every((v) => v === 0);

const B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";

// 360 bytes to 480 base64url characters (360 is a multiple of 3, so there is never padding).
export function encodeTable(table) {
  let out = "";
  for (let i = 0; i < BINS; i += 3) {
    const n = (table[i] << 16) | (table[i + 1] << 8) | table[i + 2];
    out += B64[(n >> 18) & 63] + B64[(n >> 12) & 63] + B64[(n >> 6) & 63] + B64[n & 63];
  }
  return out;
}

// The inverse, strict: exactly 480 base64url characters whose bytes are all valid half-degrees; else null.
export function decodeTable(text) {
  if (typeof text !== "string" || text.length !== ENCODED_LENGTH || !/^[A-Za-z0-9_-]+$/.test(text)) return null;
  const t = new Uint8Array(BINS);
  for (let i = 0, j = 0; i < ENCODED_LENGTH; i += 4, j += 3) {
    const n = (B64.indexOf(text[i]) << 18) | (B64.indexOf(text[i + 1]) << 12) | (B64.indexOf(text[i + 2]) << 6) | B64.indexOf(text[i + 3]);
    t[j] = (n >> 16) & 255; t[j + 1] = (n >> 8) & 255; t[j + 2] = n & 255;
  }
  return t.every((v) => v <= MAX_HALF) ? t : null;
}

// A table from vertices ({az, el}, degrees), linear in azimuth between them with wrap through north. Used for
// the illustrative presets and for tests; the engine's skyline_profile is the source when it is available.
export function tableFromVertices(points) {
  const p = (points || []).filter((q) => Number.isFinite(q.az) && Number.isFinite(q.el)).map((q) => ({ az: ((q.az % 360) + 360) % 360, el: q.el })).sort((a, b) => a.az - b.az);
  const t = emptyTable();
  if (!p.length) return t;
  for (let k = 0; k < BINS; k++) {
    if (p.length === 1) { t[k] = snapHalf(p[0].el); continue; }
    let i = p.findIndex((q) => q.az > k);
    const hi = i === -1 ? p[0] : p[i];
    const lo = i <= 0 ? p[p.length - 1] : p[i - 1];
    const span = (((hi.az - lo.az) % 360) + 360) % 360 || 360;
    const off = (((k - lo.az) % 360) + 360) % 360;
    t[k] = snapHalf(lo.el + (hi.el - lo.el) * (off / span));
  }
  return t;
}

// Paint a stroke from (az0, el0) to (az1, el1) the short way round: every bin it crosses takes the stroke's
// elevation there (linear along the stroke), snapped to 0.5 degree. Returns a new table.
export function paint(table, az0, el0, az1, el1) {
  const t = new Uint8Array(table);
  const a0 = binOf(az0), a1 = binOf(az1);
  let d = (((a1 - a0) % 360) + 360) % 360;
  if (d > 180) d -= 360;
  const n = Math.abs(d);
  for (let s = 0; s <= n; s++) {
    const f = n === 0 ? 1 : s / n;
    t[binOf(a0 + Math.sign(d) * s)] = snapHalf(el0 + (el1 - el0) * f);
  }
  return t;
}

// Set the bins within `half` degrees of azimuth `az` to elevation `el` (the keyboard brush).
export function brush(table, az, el, half = 0) {
  const t = new Uint8Array(table);
  for (let d = -half; d <= half; d++) t[binOf(az + d)] = snapHalf(el);
  return t;
}

// Keyboard editing at a cursor azimuth. Left/Right move the cursor 1 degree (Shift: 10); Up/Down raise or
// lower the cursor's bins by 0.5 degree (Shift: 5); Delete/Backspace clears them; Home/End go to north/the
// last bin. `half` is the brush half-width in bins. Returns { table, cursor } or null for a key it ignores.
export function keyEdit(table, cursor, key, shift = false, half = 0) {
  const c = binOf(cursor);
  const el = table[c] / 2;
  switch (key) {
    case "ArrowRight": return { table, cursor: binOf(c + (shift ? 10 : 1)) };
    case "ArrowLeft": return { table, cursor: binOf(c - (shift ? 10 : 1)) };
    case "ArrowUp": return { table: brush(table, c, el + (shift ? 5 : 0.5), half), cursor: c };
    case "ArrowDown": return { table: brush(table, c, el - (shift ? 5 : 0.5), half), cursor: c };
    case "Delete": case "Backspace": return { table: brush(table, c, 0, half), cursor: c };
    case "Home": return { table, cursor: 0 };
    case "End": return { table, cursor: BINS - 1 };
    default: return null;
  }
}

// A short description of the table, for the skyplot's text alternative.
export function describe(table) {
  if (isOpen(table)) return "Open horizon: no skyline.";
  let top = 0;
  for (let k = 1; k < BINS; k++) if (table[k] > table[top]) top = k;
  const blocked = table.filter((v) => v > 0).length;
  return `Skyline over ${blocked} of 360 degrees of azimuth; highest ${table[top] / 2}° at azimuth ${top}°.`;
}

// The outline as {az, el} points, one per bin, for drawing.
export const outlinePoints = (table) => Array.from(table, (v, k) => ({ az: k, el: v / 2 }));
