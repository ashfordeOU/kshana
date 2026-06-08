// SPDX-License-Identifier: Apache-2.0
// Multi-run comparison overlay — the N-way generalisation of the proven 2-way
// A/B compare (compare.mjs). Given up to a handful of pinned runs, produce a
// long-form table model (one row per shared clock+metric, with the per-run values
// and the best run) and a multi-color overlaid timeseries SVG. Pure data -> rows
// / markup; the table and the chart DOM live in app.js and insert every value via
// textContent. Reuses COMPARE_METRICS so the figures of merit and their
// directions stay in lock-step with the A/B view.
import { COMPARE_METRICS } from "./compare.mjs";

// The overlay palette: distinct, legible colours for up to four runs, drawn from
// the existing chart palette so the overlay matches the instrument aesthetic.
export const OVERLAY_COLORS = ["#e0bd84", "#d2925e", "#7fb3c8", "#b08fd0"];

/// Build the long-form overlay table model. `runs` = [{label, result}]. Returns
/// one row per (clock, metric) that is present-and-numeric on EVERY run:
///   { clock, clockLabel, metric, label, unit, lowerBetter, values:[per-run], best }
/// `best` is the index of the winning run by the metric's direction (lowerBetter).
/// A clock or metric missing on any run is skipped, so the table never shows a
/// half comparison (the compare.mjs invariant, generalised to N).
export function overlayRows(runs) {
  const rows = [];
  if (!runs || !runs.length) return rows;
  for (const clock of ["quantum", "classical"]) {
    // The clock must be present (with a fom) on every run.
    const branches = runs.map((r) => r.result && r.result[clock]);
    if (branches.some((b) => !b || !b.fom)) continue;
    const clockLabel = (branches[0].spec && branches[0].spec.id) || clock;
    for (const m of COMPARE_METRICS) {
      const values = branches.map((b) => b.fom[m.key]);
      if (values.some((v) => typeof v !== "number" || !isFinite(v))) continue;
      // Best run by direction. Ties resolve to the first index.
      let best = 0;
      for (let i = 1; i < values.length; i++) {
        const wins = m.lowerBetter ? values[i] < values[best] : values[i] > values[best];
        if (wins) best = i;
      }
      rows.push({
        clock,
        clockLabel,
        metric: m.key,
        label: m.label,
        unit: m.unit,
        lowerBetter: m.lowerBetter,
        values,
        best,
      });
    }
  }
  return rows;
}

const NUM = (n) => (Math.round(n * 1000) / 1000).toString();

/// Build a multi-color overlaid timeseries SVG for the clock-error case: each
/// run's quantum series is drawn as a polyline of `field` (e.g. "error_ns") in a
/// distinct palette colour, with a baked legend. `meta` = {ver, hash} drives the
/// provenance footer. Pure: returns markup only. Returns a valid (empty-plot) SVG
/// when no run carries a usable series.
export function overlaySeriesSvg(runs, field, meta) {
  const W = 760, H = 360, ml = 66, mr = 18, mt = 50, mb = 60;
  // Collect each run's (t, value) series from its quantum branch.
  const seriesList = (runs || []).map((r) => {
    const s = r.result && r.result.quantum && r.result.quantum.series;
    if (!Array.isArray(s)) return { label: r.label, pts: [] };
    const pts = s
      .map((row) => ({ t: row.t, y: row[field] }))
      .filter((p) => typeof p.t === "number" && typeof p.y === "number" && isFinite(p.y));
    return { label: r.label, pts };
  });
  const all = seriesList.flatMap((s) => s.pts);
  let tMax = Math.max(1, ...all.map((p) => p.t));
  let yMax = Math.max(0, ...all.map((p) => Math.abs(p.y)));
  if (!isFinite(tMax) || tMax <= 0) tMax = 1;
  if (!isFinite(yMax) || yMax <= 0) yMax = 1;
  const px = (t) => ml + (t / tMax) * (W - ml - mr);
  const py = (y) => mt + (1 - Math.min(Math.abs(y), yMax) / yMax) * (H - mt - mb);

  let s = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" font-family="system-ui,sans-serif" font-size="11">`;
  s += `<rect width="${W}" height="${H}" fill="#0c0b08"/>`;
  s += `<text x="${ml}" y="22" font-size="15" font-weight="bold" fill="#bcb3a3">Overlay: timing error during outage</text>`;
  s += `<text x="${ml}" y="40" fill="#8c8273">|error| (ns) vs time — ${seriesList.length} runs</text>`;
  const axisY = H - mb;
  s += `<line x1="${ml}" y1="${mt}" x2="${ml}" y2="${axisY}" stroke="#342c21"/>`;
  s += `<line x1="${ml}" y1="${axisY}" x2="${W - mr}" y2="${axisY}" stroke="#342c21"/>`;
  s += `<text x="${ml + (W - ml - mr) / 2}" y="${H - 26}" text-anchor="middle" fill="#8c8273">time (s)</text>`;

  seriesList.forEach((ser, i) => {
    const col = OVERLAY_COLORS[i % OVERLAY_COLORS.length];
    if (ser.pts.length) {
      const poly = ser.pts.map((p) => `${NUM(px(p.t))},${NUM(py(p.y))}`).join(" ");
      s += `<polyline points="${poly}" fill="none" stroke="${col}" stroke-width="2"/>`;
    }
    // Legend row (always present, so the run is identifiable even with no series).
    s += `<text x="${W - mr - 4}" y="${mt + 14 + i * 16}" text-anchor="end" fill="${col}" font-weight="600">${ser.label}</text>`;
  });

  const prov = `Kshana${meta && meta.ver ? " v" + meta.ver : ""}${meta && meta.hash ? " · scenario " + String(meta.hash).slice(0, 12) : ""} · kshana.dev`;
  s += `<text x="${W - mr}" y="${H - 8}" text-anchor="end" fill="#62594b" font-size="10">${prov}</text>`;
  s += `</svg>`;
  return s;
}
