// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): chart specs for the plots PNT and timing work keeps
// drawing. Pure, no DOM; tested in chart.test.mjs. Each returns a spec for createChart().
import { stanfordRegion } from "./hit.mjs";

/**
 * Stanford plot: position error (x) against protection level (y), one point per epoch, with
 * the alert limit and the regions (nominal, misleading, hazardously misleading, unavailable).
 * Points are coloured by region; the legend counts them.
 */
export function stanford({ error, pl, t = null, alertLimit, unit = "m", title = "Stanford plot", max = null, region = null }) {
  const n = error.length;
  // The usual frame: up to 2.5 × the alert limit (points beyond it are counted in the legend and shown on zooming out).
  const dataMax = Math.max(0, ...Array.from(pl).filter(Number.isFinite), ...Array.from(error).filter(Number.isFinite));
  const top = max || Math.min(dataMax * 1.05, alertLimit * 2.5) || alertLimit * 2.5;
  const groups = { nominal: [], mi: [], hmi: [], unavailable: [] };
  for (let i = 0; i < n; i++) {
    const r = stanfordRegion(error[i], pl[i], alertLimit);
    (groups[r === "unavailable-mi" ? "unavailable" : r] || groups.nominal).push(i);
  }
  const pick = (idx, a) => (a ? idx.map((i) => a[i]) : null);
  const NAMES = { nominal: "normal operation", mi: "misleading (MI)", hmi: "hazardously misleading (HMI)", unavailable: "unavailable (PL ≥ AL)" };
  const COLOURS = { nominal: "itg", mi: "nav", hmi: "bad", unavailable: "ink3" };
  const AL = alertLimit;
  return {
    type: "xy", title, subtitle: `AL ${AL} ${unit}`, equal: false,
    x: { label: "position error", unit, domain: [0, top] }, y: { label: "protection level", unit, domain: [0, top] },
    series: Object.entries(groups).map(([k, idx]) => ({ id: k, kind: "scatter", label: NAMES[k], legend: `${NAMES[k]} · ${idx.length}`, color: COLOURS[k], x: pick(idx, error), y: pick(idx, pl), t: pick(idx, t), unit, size: 4,
      extra: (i) => [["protection level", `${(+pl[idx[i]]).toPrecision(4)} ${unit}`], ["region", region ? String(region[idx[i]]) : NAMES[k]]] })),
    overlays: [
      { kind: "poly", pts: [[0, 0], [AL, AL], [0, AL]], color: "itg", alpha: 0.07 },
      { kind: "poly", pts: [[0, 0], [AL, 0], [AL, AL]], color: "nav", alpha: 0.08 },
      { kind: "poly", pts: [[AL, 0], [top, 0], [top, AL], [AL, AL]], color: "bad", alpha: 0.1 },
      { kind: "poly", pts: [[0, AL], [top, AL], [top, top], [0, top]], color: "ink3", alpha: 0.06 },
      { kind: "curve", pts: [[0, 0], [top, top]], color: "ink3", dash: [2, 3], width: 1 },
      { kind: "hline", y: AL, label: `AL ${AL} ${unit}`, color: "bad" },
      { kind: "vline", x: AL, color: "bad" },
      { kind: "text", x: AL * 0.06, y: AL * 0.9, text: "normal operation", color: "itg" },
      { kind: "text", x: AL * 0.5, y: AL * 0.12, text: "MI", color: "nav" },
      { kind: "text", x: AL * 1.05, y: AL * 0.12, text: "HMI", color: "bad" },
      { kind: "text", x: AL * 0.06, y: AL + (top - AL) * 0.5, text: "unavailable", color: "ink3" },
    ],
  };
}

/**
 * Log–log stability plot (Allan deviation, MTIE, TDEV) with confidence bands and an optional
 * mask; points above the mask are flagged in the "bad" colour.
 * curves: [{ label, tau, dev, lo?, hi?, color?, mask? }] (mask: false = not checked against the mask); mask: { tau, value, label }.
 */
export function loglog({ curves, mask = null, title, xLabel = "τ", xUnit = "s", yLabel = "deviation", yUnit = "", maskInterp = "loglog" }) {
  const maskAt = mask ? (tau) => interp(mask.tau, mask.value, tau, maskInterp) : null;
  return {
    type: "xy", title, subtitle: mask ? mask.label : "",
    x: { label: xLabel, unit: xUnit, kind: "log" }, y: { label: yLabel, unit: yUnit, kind: "log" },
    series: curves.map((c, i) => ({
      id: c.id || `c${i}`, label: c.label, kind: "line", color: c.color, x: c.tau, y: c.dev, lo: c.lo || null, hi: c.hi || null, bandLabel: c.bandLabel || "confidence", points: true, unit: yUnit,
      flag: maskAt && c.mask !== false ? Array.from(c.tau, (tau, k) => c.dev[k] > maskAt(tau)) : null,
      extra: maskAt && c.mask !== false ? (k) => { const m = maskAt(c.tau[k]); return Number.isFinite(m) ? [["mask", `${+m.toPrecision(4)} ${yUnit}`], ["margin", `${+(m - c.dev[k]).toPrecision(4)} ${yUnit}`]] : []; } : null,
    })),
    overlays: mask ? [{ kind: "curve", pts: mask.tau.map((t, k) => [t, mask.value[k]]), label: mask.label, color: "bad", dash: [6, 4], labelAt: [mask.tau[Math.floor(mask.tau.length * 0.6)], mask.value[Math.floor(mask.tau.length * 0.6)]] }] : [],
  };
}

/** Linear interpolation of ys over xs at x (in log–log space by default); NaN outside. */
export function interp(xs, ys, x, mode = "loglog") {
  for (let i = 0; i + 1 < xs.length; i++) {
    if (x >= xs[i] && x <= xs[i + 1]) {
      if (mode === "loglog" && xs[i] > 0 && ys[i] > 0 && ys[i + 1] > 0) {
        const f = (Math.log(x) - Math.log(xs[i])) / (Math.log(xs[i + 1]) - Math.log(xs[i]) || 1);
        return Math.exp(Math.log(ys[i]) + f * (Math.log(ys[i + 1]) - Math.log(ys[i])));
      }
      const f = (x - xs[i]) / (xs[i + 1] - xs[i] || 1);
      return ys[i] + f * (ys[i + 1] - ys[i]);
    }
  }
  return NaN;
}

/** Heatmap of a sweep: rows over yLabels, columns over xLabels, values z[row][col]. */
export function heatmap({ title, xLabels, yLabels, z, unit = "", label = "value", xTitle = "", yTitle = "", map = "viridis", log = false, format = null, zDomain = null }) {
  return {
    type: "heatmap", title,
    x: { label: xTitle, categories: xLabels.map(String) }, y: { label: yTitle, flip: true },
    grid: { x: xLabels.map((_, i) => i), y: yLabels.map((_, j) => j), z, xLabels: xLabels.map(String), yLabels: yLabels.map(String), unit, label, map, log, format, zDomain },
  };
}

/** Waterfall: power over frequency (x) and time (y, top to bottom), drawn as an image buffer. */
export function waterfall({ title, f, t, z, fLabel = "frequency", fUnit = "MHz", unit = "dBW/Hz", zDomain = null, map = "night", format = null }) {
  return {
    type: "waterfall", title, x: { label: fLabel, unit: fUnit }, y: { label: "time", unit: "s", time: true, flip: true },
    grid: { x: f, y: t, z, unit, label: "power", map, zDomain, format },
  };
}

/** Sky plot: satellites as tracks of azimuth and elevation over time, trails up to the clock's time. */
export function sky({ title, tracks, mask = null }) {
  return { type: "polar", title, subtitle: mask !== null ? `mask ${mask}°` : "", tracks, mask };
}
