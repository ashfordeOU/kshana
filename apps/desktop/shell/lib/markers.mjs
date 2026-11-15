// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: markers and delta markers (0.42 U12). A plot's markers A and B (placed
// with Alt-click or M on the chart, lib/chart/chart2d.mjs) are read out in the inspector (the
// time and value of each, Δt, Δ value and the slope) and shown on the map at the same instants
// (the run's position at each marker's time). Pure, no DOM; tested in markers.test.mjs.
import { positionAt } from "./timemodel.mjs";
import { indexAtOrBefore, clockText } from "./clock.mjs";

/** The English text with its { $name } arguments filled in (the shell passes its own t()). */
const fill = (id, en, a = {}) => String(en).replace(/\{ \$(\w+) \}/g, (m, k) => (a[k] ?? m));

const fmt = (v, sig = 6) => (Number.isFinite(v) ? String(+v.toPrecision(sig)).replace("-", "−") : "–");
const sp = (u) => (u ? ` ${u}` : "");

/** A chart's marker items ({ x, y, unit, label }) as the markers state: [{ name, t, v, unit, series }]. */
export function markersOf(items) {
  return (items || []).filter((it) => it && Number.isFinite(it.x)).slice(0, 2).map((it, k) => ({ name: k ? "B" : "A", t: it.x, v: Number.isFinite(it.y) ? it.y : NaN, unit: it.unit || "", series: String(it.label || "") }));
}

/** The inspector's readout rows of the markers: [{ k, v }]. epochMs: the UTC of t = 0, when known. */
export function markerRows(marks, { epochMs = NaN, t = fill } = {}) {
  const rows = [];
  const when = (x) => clockText(x, { epochMs: Number.isFinite(epochMs) ? epochMs : null, ms: Math.abs(x % 1) > 1e-9 });
  for (const m of marks) rows.push({ k: m.name, v: `${when(m.t)} · ${fmt(m.v)}${sp(m.unit)}${m.series ? ` · ${m.series}` : ""}` });
  if (marks.length === 2) {
    const [a, b] = marks, dt = b.t - a.t, dv = b.v - a.v;
    rows.push({ k: t("js-desk-mk-dt", "Δt"), v: `${fmt(dt)} s` });
    rows.push({ k: t("js-desk-mk-dv", "Δ value"), v: `${fmt(dv)}${sp(a.unit)}` });
    rows.push({ k: t("js-desk-mk-slope", "slope"), v: dt ? `${fmt(dv / dt, 4)}${a.unit ? ` ${a.unit}/s` : " /s"}` : "–" });
  }
  return rows;
}

/**
 * Where the markers are on the map: [{ name, t, lat, lon }] for the markers whose instant has
 * a position: the run's track, else its single moving object, else its fixed receiver.
 */
export function markerPlaces(model, marks) {
  if (!model) return [];
  const mover = model.track || (model.movers && model.movers.length === 1 ? model.movers[0] : null);
  const fixed = !mover && model.sites ? model.sites.find((s) => s.role === "receiver") : null;
  const out = [];
  for (const m of marks) {
    const p = mover ? positionAt(mover, m.t) : fixed ? { lat: fixed.lat, lon: fixed.lon } : null;
    if (p) out.push({ name: m.name, t: m.t, lat: p.lat, lon: p.lon });
  }
  return out;
}

/**
 * The chart points of saved markers ([{ t, series }]) in a chart spec's series ({ id, label,
 * x }): [{ sid, i }] at the sample at or before each time, for chart.setMarkers().
 */
export function markerRefs(series, saved) {
  const out = [];
  for (const m of saved || []) {
    const s = series.find((r) => r.label === m.series) || series[0];
    if (!s || !s.x || !s.x.length || !Number.isFinite(m.t)) continue;
    const i = Math.max(0, indexAtOrBefore(s.x, m.t));
    out.push({ sid: s.id, i });
  }
  return out.slice(-2);
}
