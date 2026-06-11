// SPDX-License-Identifier: Apache-2.0
// Tabbed output model for the result panel. The set of tabs a run earns depends
// on what the result carries: FoM and timeseries always; a stability tab when an
// Allan curve is present; a 3D orbit tab when the engine emitted an `eci_track`;
// a sweep tab only while a parameter sweep is showing. buildFomRows is the
// single-run figure-of-merit table model, reusing the COMPARE_METRICS list shape
// so it stays in step with the A/B and overlay views. Pure data -> arrays; the
// button row + panel show/hide live in app.js (mountTabs).
import { COMPARE_METRICS } from "./compare.mjs";

const hasAdev = (b) => b && Array.isArray(b.adev_curve) && b.adev_curve.length > 0;

/// The ordered list of available tabs `{id, label}` for a `result`. `timeseries`
/// is always present (it holds the scenario chart — e.g. the ground track); `fom`
/// leads it iff the result earns at least one figure-of-merit row (so packs with
/// no clock-style FoM — ephemeris, RAIM, spoof — don't show an empty table); adds
/// `stability` iff either clock has an Allan curve; adds `orbit3d` iff the result
/// carries a non-empty `eci_track`; adds `sweep` only when `opts.sweep` is true.
export function tabModel(result, opts) {
  const tabs = [];
  if (result && buildFomRows(result).length > 0) {
    tabs.push({ id: "fom", label: "Figures of merit" });
  }
  tabs.push({ id: "timeseries", label: "Time series" });
  if (result && (hasAdev(result.quantum) || hasAdev(result.classical))) {
    tabs.push({ id: "stability", label: "Stability" });
  }
  if (result && Array.isArray(result.eci_track) && result.eci_track.length > 0) {
    tabs.push({ id: "orbit3d", label: "3D orbit" });
  }
  if (opts && opts.sweep) {
    tabs.push({ id: "sweep", label: "Sweep" });
  }
  return tabs;
}

/// The single-run FoM table model: one `{clockLabel, metric, label, unit, value}`
/// row per (clock, metric) that is present-and-numeric, in COMPARE_METRICS order.
/// A missing or non-numeric metric is skipped (no half rows). app.js renders these
/// with the same textContent-only `<table>` builder pattern as buildCompareTable.
export function buildFomRows(result) {
  const rows = [];
  for (const clock of ["quantum", "classical"]) {
    const c = result && result[clock];
    const fom = c && c.fom;
    if (!fom) continue;
    const clockLabel = (c.spec && c.spec.id) || clock;
    for (const m of COMPARE_METRICS) {
      const v = fom[m.key];
      if (typeof v !== "number" || !isFinite(v)) continue;
      rows.push({ clock, clockLabel, metric: m.key, label: m.label, unit: m.unit, value: v });
    }
  }
  return rows;
}
