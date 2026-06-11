// SPDX-License-Identifier: Apache-2.0
// Playground parameter sweep, driven purely in JS by calling the wasm run()
// repeatedly. No new Rust is needed for this path — the engine already has a
// `sweep` kind, but the playground sweep is simpler: patch one TOML scalar across
// an inclusive range, run, and pull one figure-of-merit per step. Pure logic
// (linspace, patch, FoM extraction, chart geometry) is unit-tested in
// sweep.test.mjs; the run() loop and the chart/hover DOM live in app.js.
import { readScalar, patchScalar } from "./share.mjs";
import { patchSectionScalar } from "./guided.mjs";

/// Cap on sweep length: run() is synchronous and sub-frame, but a 1000-point
/// sweep would jank the main thread (no workers in the zero-dep design). Sixty
/// steps keep the whole sweep instant.
export const MAX_SWEEP = 60;

// Geometry shared with the chart and the hover model, so hover.mjs's
// cursorToPlotFraction maps a cursor to the right sample. Mirrors adevSvg.
export const SWEEP_GEOM = { wIntrinsic: 760, ml: 66, mr: 18 };

/// Inclusive linear-spaced values v_i = min + (max-min)·i/(steps-1), i=0..steps-1.
/// `steps` is clamped to ≥2 and ≤ MAX_SWEEP. The endpoints are exact (first===min,
/// last===max) so an integer range like sweepValues(0,10,11) is [0,1,…,10].
export function sweepValues(min, max, steps) {
  const n = Math.max(2, Math.min(MAX_SWEEP, Math.round(steps)));
  const out = [];
  for (let i = 0; i < n; i++) {
    out.push(i === n - 1 ? max : min + ((max - min) * i) / (n - 1));
  }
  return out;
}

/// Patch a single TOML scalar for one sweep step. `knob` = {key, section}; a
/// top-level key ("" section) uses share.mjs's patchScalar, a sectioned key uses
/// guided.mjs's patchSectionScalar. Absent keys leave the TOML unchanged.
export function sweepToml(baseToml, knob, value) {
  return knob.section
    ? patchSectionScalar(baseToml, knob.section, knob.key, value)
    : patchScalar(baseToml, knob.key, value);
}

/// Pull one figure-of-merit scalar out of a run result, e.g.
/// extractFom(result, "quantum", "holdover_s"). Returns the number, or null when
/// the clock branch, the `fom` block, or the metric is missing/non-numeric.
export function extractFom(result, clock, metricKey) {
  const c = result && result[clock];
  const fom = c && c.fom;
  const v = fom && fom[metricKey];
  return typeof v === "number" && isFinite(v) ? v : null;
}

const isNum = (v) => typeof v === "number" && isFinite(v);

// The per-clock figures of merit a sweep can plot.
const CLOCK_SWEEP_METRICS = [
  ["holdover_s", "holdover (s)"],
  ["timing_rms_ns", "timing RMS (ns)"],
  ["timing_p95_ns", "timing p95 (ns)"],
  ["availability", "availability"],
];

// The ephemeris / ground-track extrema a sweep can plot. `max_elevation_deg` and
// `peak_doppler_hz` exist only when the scenario has a ground station.
const EPHEM_SWEEP_METRICS = [
  ["max_elevation_deg", "max elevation (°)"],
  ["peak_doppler_hz", "peak Doppler (Hz)"],
  ["alt_max_km", "max altitude (km)"],
  ["alt_min_km", "min altitude (km)"],
  ["speed_max_m_s", "max speed (m/s)"],
];

/// The figures of merit that can be plotted against a swept knob for a given run
/// `result`, each `{ id, label, get(result) -> number|null }`. The list adapts to
/// the result shape — clock FoMs for a clock scenario, ground-track extrema for the
/// ephemeris pack — and is empty when nothing is sweepable, so the caller can hide
/// the Sweep tab instead of offering a control that plots nothing.
export function sweepMetrics(result) {
  if (!result || typeof result !== "object") return [];
  const out = [];
  for (const clock of ["quantum", "classical"]) {
    const fom = result[clock] && result[clock].fom;
    if (!fom) continue;
    const who = (result[clock].spec && result[clock].spec.id) || clock;
    for (const [key, label] of CLOCK_SWEEP_METRICS) {
      if (isNum(fom[key])) {
        out.push({ id: `${clock}::${key}`, label: `${who} ${label}`, get: (r) => extractFom(r, clock, key) });
      }
    }
  }
  // The ephemeris pack carries flat top-level extrema (no quantum/classical block).
  if (isNum(result.n_samples) && Array.isArray(result.samples)) {
    for (const [key, label] of EPHEM_SWEEP_METRICS) {
      if (isNum(result[key])) {
        out.push({ id: `ephem::${key}`, label, get: (r) => (isNum(r && r[key]) ? r[key] : null) });
      }
    }
  }
  return out;
}

const NUM = (n) => (Math.round(n * 1000) / 1000).toString();

// Compact axis tick text: plain mid-range, exponential at the extremes.
function tick(x) {
  if (x === 0) return "0";
  return Math.abs(x) >= 1e4 || Math.abs(x) < 1e-2 ? x.toExponential(1) : NUM(x);
}

/// Build a linear-linear line+dot chart (SVG string) for sweep points
/// `[{x, y}]`. `axis` = {xLabel, yLabel, title}; `meta` = {ver, hash} for the
/// provenance footer. Geometry mirrors adevSvg's margins so the hover model
/// (SWEEP_GEOM) lines up. Pure: returns markup only.
export function sweepCurveSvg(points, axis, meta) {
  const { wIntrinsic: W, ml, mr } = SWEEP_GEOM;
  const H = 360, mt = 50, mb = 60;
  const xs = points.map((p) => p.x);
  const ys = points.map((p) => p.y);
  let xMin = Math.min(...xs), xMax = Math.max(...xs);
  let yMin = Math.min(...ys), yMax = Math.max(...ys);
  if (!isFinite(xMin) || !isFinite(xMax)) { xMin = 0; xMax = 1; }
  if (!isFinite(yMin) || !isFinite(yMax)) { yMin = 0; yMax = 1; }
  if (xMax === xMin) { xMax = xMin + 1; }
  // Pad the y-range a little and never collapse to zero height.
  if (yMax === yMin) { yMax = yMin + (yMin === 0 ? 1 : Math.abs(yMin) * 0.1); }
  const px = (x) => ml + ((x - xMin) / (xMax - xMin)) * (W - ml - mr);
  const py = (y) => mt + (1 - (y - yMin) / (yMax - yMin)) * (H - mt - mb);
  const C = "#e0bd84";

  let s = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" font-family="system-ui,sans-serif" font-size="11">`;
  s += `<rect width="${W}" height="${H}" fill="#0c0b08"/>`;
  s += `<text x="${ml}" y="22" font-size="15" font-weight="bold" fill="#bcb3a3">${axis.title}</text>`;
  s += `<text x="${ml}" y="40" fill="#8c8273">${axis.yLabel} vs ${axis.xLabel}</text>`;

  // Axes.
  const axisY = H - mb;
  s += `<line x1="${ml}" y1="${mt}" x2="${ml}" y2="${axisY}" stroke="#342c21"/>`;
  s += `<line x1="${ml}" y1="${axisY}" x2="${W - mr}" y2="${axisY}" stroke="#342c21"/>`;

  // A few x and y gridlines + labels (5 each).
  for (let i = 0; i <= 4; i++) {
    const xv = xMin + ((xMax - xMin) * i) / 4;
    const x = px(xv);
    s += `<line x1="${x}" y1="${mt}" x2="${x}" y2="${axisY}" stroke="#1c1812"/>`;
    s += `<text x="${x}" y="${axisY + 16}" text-anchor="middle" fill="#8c8273">${tick(xv)}</text>`;
    const yv = yMin + ((yMax - yMin) * i) / 4;
    const y = py(yv);
    s += `<line x1="${ml}" y1="${y}" x2="${W - mr}" y2="${y}" stroke="#1c1812"/>`;
    s += `<text x="${ml - 8}" y="${y + 4}" text-anchor="end" fill="#8c8273">${tick(yv)}</text>`;
  }

  // Axis titles.
  s += `<text x="${ml + (W - ml - mr) / 2}" y="${H - 26}" text-anchor="middle" fill="#8c8273">${axis.xLabel}</text>`;
  s += `<text x="16" y="${mt + (H - mt - mb) / 2}" text-anchor="middle" fill="#8c8273" transform="rotate(-90 16 ${mt + (H - mt - mb) / 2})">${axis.yLabel}</text>`;

  // Data polyline + dots.
  if (points.length) {
    const poly = points.map((p) => `${NUM(px(p.x))},${NUM(py(p.y))}`).join(" ");
    s += `<polyline points="${poly}" fill="none" stroke="${C}" stroke-width="2"/>`;
    for (const p of points) s += `<circle cx="${NUM(px(p.x))}" cy="${NUM(py(p.y))}" r="2.5" fill="${C}"/>`;
  }

  const prov = `Kshana${meta && meta.ver ? " v" + meta.ver : ""}${meta && meta.hash ? " · scenario " + String(meta.hash).slice(0, 12) : ""} · kshana.dev`;
  s += `<text x="${W - mr}" y="${H - 8}" text-anchor="end" fill="#62594b" font-size="10">${prov}</text>`;
  s += `</svg>`;
  return s;
}
