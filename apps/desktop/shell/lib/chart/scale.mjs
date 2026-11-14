// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): scales, ticks, zoom and pan maths. Pure, no DOM; tested in
// chart.test.mjs. A scale maps a data domain [d0, d1] onto a pixel range [r0, r1]; "log" scales
// map log10 of the value. Zoom and pan work in the scale's own space (log space for log axes),
// so zooming a log axis about the cursor keeps the decade under the cursor where it is.

const LOG = Math.log10;
const fwd = (kind, v) => (kind === "log" ? LOG(v) : v);
const back = (kind, u) => (kind === "log" ? 10 ** u : u);

/** A scale: { kind, d, r, map(v), inv(px) }. */
export function scale(kind, d0, d1, r0, r1) {
  const u0 = fwd(kind, d0), u1 = fwd(kind, d1);
  const k = (r1 - r0) / (u1 - u0 || 1);
  return {
    kind, d: [d0, d1], r: [r0, r1],
    map: kind === "log" ? (v) => r0 + (LOG(v) - u0) * k : (v) => r0 + (v - u0) * k,
    inv: (px) => back(kind, u0 + (px - r0) / k),
  };
}

/** Zoom a domain by `factor` (< 1 zooms in) about the data value `at`; the value under the cursor stays put. */
export function zoomDomain([d0, d1], at, factor, kind = "linear") {
  const a = fwd(kind, at), u0 = fwd(kind, d0), u1 = fwd(kind, d1);
  return [back(kind, a + (u0 - a) * factor), back(kind, a + (u1 - a) * factor)];
}

/** Pan a domain by `dpx` pixels on an axis `rangePx` pixels long (positive dpx moves the data with the pointer). */
export function panDomain([d0, d1], dpx, rangePx, kind = "linear") {
  const u0 = fwd(kind, d0), u1 = fwd(kind, d1);
  const du = -(dpx / (rangePx || 1)) * (u1 - u0);
  return [back(kind, u0 + du), back(kind, u1 + du)];
}

/** The domain between two pixel positions (a box zoom), ordered low to high in data terms. */
export function boxDomain(s, p0, p1) {
  const a = s.inv(p0), b = s.inv(p1);
  return a <= b ? [a, b] : [b, a];
}

/** A finite, non-degenerate domain: pads a flat range, keeps log domains positive. */
export function sane([a, b], kind = "linear") {
  if (!Number.isFinite(a) || !Number.isFinite(b)) return kind === "log" ? [1, 10] : [0, 1];
  if (kind === "log") { a = a > 0 ? a : Math.min(b, 1) * 1e-3; b = b > a ? b : a * 10; }
  if (a === b) { const p = Math.abs(a) * 0.05 || 1; return [a - p, b + p]; }
  return a < b ? [a, b] : [b, a];
}

/** Extent of values (ignoring NaN), optionally padded by a fraction of the span (log: of the decades). */
export function extent(arrays, pad = 0, kind = "linear") {
  let lo = Infinity, hi = -Infinity;
  for (const arr of arrays) {
    if (!arr) continue;
    for (let i = 0; i < arr.length; i++) {
      const v = arr[i];
      if (v === null || Number.isNaN(v) || (kind === "log" && !(v > 0))) continue;
      if (v < lo) lo = v;
      if (v > hi) hi = v;
    }
  }
  let d = sane([lo, hi], kind);
  if (pad) {
    const u0 = fwd(kind, d[0]), u1 = fwd(kind, d[1]), p = (u1 - u0) * pad;
    d = [back(kind, u0 - p), back(kind, u1 + p)];
  }
  return d;
}

/** "Nice" linear ticks: about n ticks on 1, 2, 5 × 10^k steps. Returns { ticks, step }. */
export function niceTicks(a, b, n = 6) {
  if (!(b > a)) return { ticks: [a], step: 1 };
  const raw = (b - a) / Math.max(1, n);
  const p = 10 ** Math.floor(LOG(raw));
  const f = raw / p;
  const step = (f < 1.5 ? 1 : f < 3 ? 2 : f < 7 ? 5 : 10) * p;
  const ticks = [];
  for (let v = Math.ceil(a / step - 1e-9) * step; v <= b + step * 1e-9; v += step) ticks.push(Math.abs(v) < step * 1e-9 ? 0 : v);
  return { ticks, step };
}

/** Log ticks: every decade (and 2, 5 within decades when there are few decades). Returns { ticks, minor }. */
export function logTicks(a, b) {
  const lo = Math.floor(LOG(a)), hi = Math.ceil(LOG(b));
  const ticks = [], minor = [];
  const span = hi - lo;
  const every = Math.max(1, Math.ceil(span / 8));
  for (let e = lo; e <= hi; e++) {
    const dec = 10 ** e;
    if (dec >= a * (1 - 1e-9) && dec <= b * (1 + 1e-9) && (e - lo) % every === 0) ticks.push(dec);
    for (let m = 2; m < 10; m++) {
      const v = m * dec;
      if (v < a || v > b) continue;
      if (span <= 2 && (m === 2 || m === 5)) ticks.push(v); else minor.push(v);
    }
  }
  ticks.sort((x, y) => x - y);
  return { ticks, minor };
}

const SUP = { "-": "⁻", 0: "⁰", 1: "¹", 2: "²", 3: "³", 4: "⁴", 5: "⁵", 6: "⁶", 7: "⁷", 8: "⁸", 9: "⁹" };
/** A tick label: plain for moderate values, 10ⁿ for exact decades on log axes, engineering otherwise. */
export function fmtTick(v, step = 0, kind = "linear") {
  if (v === 0) return "0";
  if (kind === "log") {
    const e = Math.round(LOG(v));
    if (Math.abs(v - 10 ** e) < 10 ** e * 1e-9) return e >= -2 && e <= 3 ? String(10 ** e >= 1 ? 10 ** e : +(10 ** e).toFixed(-e)) : `10${String(e).split("").map((c) => SUP[c]).join("")}`;
    return fmtValue(v, 2);
  }
  const av = Math.abs(v);
  if (av >= 1e6 || av < 1e-3) return fmtValue(v, 3);
  const dec = step > 0 ? Math.max(0, -Math.floor(LOG(step) + 1e-9)) : 3;
  return v.toFixed(Math.min(dec, 6));
}

/** A value for a readout: about `sig` significant digits, exponent form for very large or small values. */
export function fmtValue(v, sig = 5) {
  if (v === null || v === undefined || Number.isNaN(v)) return "–";
  if (!Number.isFinite(v)) return v > 0 ? "∞" : "−∞";
  if (v === 0) return "0";
  const av = Math.abs(v);
  if (av >= 1e6 || av < 1e-3) {
    const [m, e] = v.toExponential(Math.max(0, sig - 1)).split("e");
    return `${+m}e${+e}`.replace("-", "−");
  }
  return String(+v.toPrecision(sig)).replace("-", "−");
}

/** Seconds as h:mm:ss (or m:ss), for time axes that count seconds of a run. */
export function fmtClock(s) {
  if (!Number.isFinite(s)) return "–";
  const neg = s < 0; s = Math.abs(s);
  const h = Math.floor(s / 3600), m = Math.floor((s % 3600) / 60), sec = s % 60;
  const ss = (sec < 10 ? "0" : "") + (Number.isInteger(sec) ? sec : sec.toFixed(1));
  return `${neg ? "−" : ""}${h ? `${h}:${String(m).padStart(2, "0")}` : m}:${ss}`;
}

/** Time ticks for seconds-of-run axes: steps of 1, 2, 5, 10, 15, 30 s, 1, 2, 5, 10, 15, 30 min, 1, 2, 3, 6, 12, 24 h. */
export function timeTicks(a, b, n = 6) {
  const steps = [1, 2, 5, 10, 15, 30, 60, 120, 300, 600, 900, 1800, 3600, 7200, 10800, 21600, 43200, 86400];
  const raw = (b - a) / Math.max(1, n);
  const step = steps.find((s) => s >= raw) || Math.ceil(raw / 86400) * 86400;
  if (raw < 1) return niceTicks(a, b, n);
  const ticks = [];
  for (let v = Math.ceil(a / step) * step; v <= b; v += step) ticks.push(v);
  return { ticks, step };
}
