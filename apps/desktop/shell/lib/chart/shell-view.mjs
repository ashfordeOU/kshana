// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): the scenario tab's Timeline view drawn with the interactive
// chart. It takes the Studio's series model (web/studio/lib/views.mjs seriesModel: title, axis
// labels, unit, series of [t, value] points, threshold, GNSS outage windows) and keeps one
// chart per run, so the shell's re-renders keep the zoom, pins and markers of the run shown.
import { createChart } from "./chart2d.mjs";

const charts = new WeakMap();

/** The series model as a chart spec. */
export function seriesSpec(sm) {
  const timeAxis = /\(s\)\s*$/.test(sm.xLabel || "");
  return {
    type: "xy", title: sm.title || "", subtitle: sm.unit ? `unit ${sm.unit}` : "",
    x: { label: String(sm.xLabel || "x").replace(/\s*\(s\)\s*$/, ""), unit: timeAxis ? "s" : "", time: timeAxis },
    y: { label: String(sm.yLabel || "").replace(/\s*\([^)]*\)\s*$/, ""), unit: sm.unit || "" },
    series: (sm.series || []).map((s, i) => ({ id: `s${i}`, label: s.label, color: s.color, unit: sm.unit || "", x: s.points.map((p) => p[0]), y: s.points.map((p) => p[1]) })),
    overlays: [
      ...(sm.outages || []).map(([a, b]) => ({ kind: "span", x0: a, x1: b, color: "int", alpha: 0.1, label: "GNSS denied" })),
      ...(typeof sm.threshold === "number" ? [{ kind: "hline", y: sm.threshold, label: sm.thresholdLabel || `threshold ${sm.threshold}${sm.unit ? ` ${sm.unit}` : ""}`, color: "bad" }] : []),
    ],
  };
}

/** The chart element for a run's series model (made once per run, then reused); null without a DOM. */
export function timelineChart(run, sm, { clock = null } = {}) {
  if (typeof document === "undefined" || !sm || !run) return null;
  const had = charts.get(run);
  if (had) return had.chart.el;
  const chart = createChart(document.createDocumentFragment(), { ...seriesSpec(sm), clock });
  charts.set(run, { chart });
  return chart.el;
}
