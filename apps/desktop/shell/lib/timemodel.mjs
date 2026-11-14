// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: what a run shows on the time cursor (0.42 U7, U15). From the engine's
// result, the line-chart model the Studio draws (web/studio/lib/views.mjs seriesModel) and the
// scenario's geometry as the engine exports it (`export_scenario(toml, "geojson")`, the
// `--export geojson` writer), one model: the time span, the series for the plot, the track
// for the map with how far to trust each point, the fixed sites, the jammer areas and the
// moving satellites. Only what the engine returned is drawn; nothing is invented. Pure, no
// DOM; tested in ./clock.test.mjs.
import { indexAtOrBefore } from "./clock.mjs";

const num = (x) => typeof x === "number" && Number.isFinite(x);
const f64 = (a) => Float64Array.from(a);

/** Line-chart series of the Studio model that run over time ({ id, label, unit, color, t, v }). */
function plotSeries(model, result) {
  if (!model || !Array.isArray(model.series)) return [];
  // A sweep (x is a parameter) or map matching (x is an epoch count) has no time axis.
  if (model.logX || Array.isArray(result.points) || (Array.isArray(result.epochs) && result.epochs[0] && "matched_m" in result.epochs[0])) return [];
  const out = [];
  model.series.forEach((s, i) => {
    const pts = (s.points || []).filter((p) => num(p[0]) && num(p[1]));
    if (pts.length < 2) return;
    for (let k = 1; k < pts.length; k++) if (pts[k][0] < pts[k - 1][0]) return; // not a time axis
    out.push({ id: `s${i}`, label: String(s.label || ""), unit: model.unit || "", color: s.color || "", t: f64(pts.map((p) => p[0])), v: f64(pts.map((p) => p[1])) });
  });
  return out;
}

/** The trust band of a receiver-trust score (0-100) as the engine's score model names it. */
const band = (e) => (e.score && typeof e.score.band === "string" ? e.score.band : e.state || "");

/**
 * The moving receiver or vehicle of a result, or null: { t, lat, lon, q, kind, label } with
 * q in [0, 1] per point (NaN when the engine gives none). kind "trust": the receiver-trust
 * score / 100 (1 trusted); "visible": 1 while the station sees the satellite, else 0.
 */
export function trackOf(result) {
  if (!result || typeof result !== "object") return null;
  const ep = Array.isArray(result.epochs) ? result.epochs : null;
  if (ep && ep.length > 1 && ep.some((e) => e && e.marine && Array.isArray(e.marine.position))) {
    const rows = ep.filter((e) => e && num(e.t_s) && e.marine && Array.isArray(e.marine.position) && num(e.marine.position[0]) && num(e.marine.position[1]));
    return {
      kind: "trust", label: "receiver",
      t: f64(rows.map((e) => e.t_s)), lat: f64(rows.map((e) => e.marine.position[0])), lon: f64(rows.map((e) => e.marine.position[1])),
      q: f64(rows.map((e) => (e.score && num(e.score.score) ? e.score.score / 100 : NaN))),
      state: rows.map(band),
    };
  }
  const sm = Array.isArray(result.samples) ? result.samples : null;
  if (sm && sm.length > 1 && num(sm[0].lat_deg) && num(sm[0].lon_deg)) {
    const rows = sm.filter((p) => num(p.t_s) && num(p.lat_deg) && num(p.lon_deg));
    const hasView = rows.some((p) => p.station_view);
    return {
      kind: hasView ? "visible" : "none", label: "satellite",
      t: f64(rows.map((p) => p.t_s)), lat: f64(rows.map((p) => p.lat_deg)), lon: f64(rows.map((p) => p.lon_deg)),
      q: f64(rows.map((p) => (p.station_view ? (p.station_view.visible ? 1 : 0) : NaN))),
      state: null,
    };
  }
  return null;
}

/** Extra series a result carries for the plot when the Studio model has none. */
function ownSeries(result, track) {
  const out = [];
  if (track && track.kind === "trust") {
    const ok = Array.from(track.q, (q) => !Number.isNaN(q));
    const t = track.t.filter((_, i) => ok[i]), v = track.q.filter((_, i) => ok[i]).map((q) => q * 100);
    if (t.length > 1) out.push({ id: "trust", label: "trust score", unit: "", color: "var(--s-itg)", t, v });
  }
  const sm = Array.isArray(result.samples) ? result.samples : null;
  if (sm && sm.length > 1 && sm[0].station_view && num(sm[0].station_view.el_deg)) {
    const rows = sm.filter((p) => num(p.t_s) && p.station_view && num(p.station_view.el_deg));
    out.push({ id: "el", label: "elevation at the station", unit: "deg", color: "var(--s-nav)", t: f64(rows.map((p) => p.t_s)), v: f64(rows.map((p) => p.station_view.el_deg)) });
  }
  return out;
}

/** UTC ms of an ISO 8601 text, or NaN. */
const isoMs = (s) => (typeof s === "string" ? Date.parse(s) : NaN);

/**
 * The geometry of an engine GeoJSON export (`export_scenario(toml, "geojson")`, parsed files[0]
 * content): { sites, areas, movers, routes, epochMs }. Sites: receivers, stations, jammers and
 * frame origins. Areas: jammer footprints grouped by centre, `inner` (every satellite lost) and
 * `outer` (tracking starts to fail) radii in metres, with their rings; evidence "modelled"
 * (computed from the scenario's jammer by the engine's link equations) unless a feature says
 * "estimated". Movers: satellites and moving users with times (s after the scene's first time).
 */
export function sceneLayers(fc) {
  const out = { sites: [], areas: [], movers: [], routes: [], epochMs: NaN, note: "" };
  if (!fc || !Array.isArray(fc.features)) return out;
  out.note = typeof fc.description === "string" ? fc.description : "";
  const byCentre = new Map();
  let t0 = NaN;
  for (const f of fc.features) {
    const p = (f && f.properties) || {}, g = f && f.geometry;
    if (!g) continue;
    if (Array.isArray(p.times_utc) && p.times_utc.length) { const ms = isoMs(p.times_utc[0]); if (num(ms) && !(ms >= t0)) t0 = ms; }
  }
  out.epochMs = t0;
  for (const f of fc.features) {
    const p = (f && f.properties) || {}, g = f && f.geometry;
    if (!g) continue;
    const role = String(p.role || "");
    if (g.type === "Point" && Array.isArray(g.coordinates) && num(g.coordinates[0]) && num(g.coordinates[1])) {
      out.sites.push({ id: String(p.name || role || "site"), role, lon: g.coordinates[0], lat: g.coordinates[1], label: String(p.description || p.name || role) });
    } else if (g.type === "Polygon" && role === "jammer-footprint") {
      const c = Array.isArray(p.centre) ? p.centre : null;
      const ring = Array.isArray(g.coordinates) && Array.isArray(g.coordinates[0]) ? g.coordinates[0].filter((q) => num(q[0]) && num(q[1])) : [];
      if (!c || !num(p.radius_m) || ring.length < 3) continue;
      const key = `${c[0]},${c[1]}`;
      const a = byCentre.get(key) || { id: `area-${byCentre.size + 1}`, lon: c[0], lat: c[1], inner: null, outer: null, innerRing: null, outerRing: null, evidence: "modelled", label: "" };
      const which = /denial/.test(String(p.name)) ? "inner" : "outer";
      a[which] = p.radius_m;
      a[`${which}Ring`] = ring;
      if (p.evidence === "estimated" || p.estimated === true) a.evidence = "estimated";
      if (which === "inner" || !a.label) a.label = String(p.description || "");
      byCentre.set(key, a);
    } else if ((g.type === "LineString" || g.type === "MultiLineString") && Array.isArray(p.times_utc)) {
      const parts = g.type === "LineString" ? [g.coordinates] : g.coordinates;
      let pts = parts.flat().filter((q) => Array.isArray(q) && num(q[0]) && num(q[1]));
      const times = p.times_utc.map(isoMs);
      // A track cut at the antimeridian gains points at ±180 that have no time of their own.
      if (pts.length > times.length) {
        const cut = new Set();
        let at = 0;
        for (const part of parts) { if (at > 0) { cut.add(at - 1); cut.add(at); } at += part.length; }
        pts = pts.filter((q, i) => !(cut.has(i) && Math.abs(q[0]) === 180));
      }
      if (pts.length !== times.length || !times.every(num) || !num(t0)) continue;
      out.movers.push({ id: String(p.name || role), role, label: String(p.description || ""),
        t: f64(times.map((ms) => (ms - t0) / 1000)), lon: f64(pts.map((q) => q[0])), lat: f64(pts.map((q) => q[1])) });
    } else if (g.type === "LineString" && Array.isArray(g.coordinates)) {
      const pts = g.coordinates.filter((q) => num(q[0]) && num(q[1]));
      if (pts.length > 1) out.routes.push({ id: String(p.name || "route"), label: String(p.description || ""), lon: f64(pts.map((q) => q[0])), lat: f64(pts.map((q) => q[1])) });
    }
  }
  out.areas = [...byCentre.values()];
  return out;
}

/** The parsed GeoJSON of an `export_scenario` answer (its JSON text), or null. */
export function geojsonOfExport(text) {
  try {
    const e = typeof text === "string" ? JSON.parse(text) : text;
    const f = e && Array.isArray(e.files) ? e.files.find((x) => x && x.encoding !== "base64" && typeof x.content === "string") : null;
    return f ? JSON.parse(f.content) : null;
  } catch {
    return null;
  }
}

/**
 * The run's model on the time cursor, or null when nothing in it runs over time.
 * { span: [t0, t1], times, step, series, threshold, thresholdLabel, title, yLabel, track, sites,
 *   areas, movers, routes, epochMs, epochs, epochTimes }
 * `model` is the Studio's line-chart model of the result (or null), `fc` the scene's GeoJSON.
 */
export function timeModel(result, model = null, fc = null) {
  if (!result || typeof result !== "object") return null;
  const track = trackOf(result);
  let series = plotSeries(model, result);
  if (!series.length) series = ownSeries(result, track);
  const geo = sceneLayers(fc);
  const ep = Array.isArray(result.epochs) && result.epochs.length > 1 && result.epochs.every((e) => e && num(e.t ?? e.t_s)) ? result.epochs : null;
  const all = [track && track.t, ...series.map((s) => s.t), ...geo.movers.map((m) => m.t)].filter((a) => a && a.length);
  if (!all.length && !(ep && ep.length)) return null;
  let t0 = Infinity, t1 = -Infinity;
  for (const a of all) { t0 = Math.min(t0, a[0]); t1 = Math.max(t1, a[a.length - 1]); }
  if (ep) { t0 = Math.min(t0, ep[0].t ?? ep[0].t_s); t1 = Math.max(t1, ep[ep.length - 1].t ?? ep[ep.length - 1].t_s); }
  if (!(t1 > t0)) return null;
  // The epochs the cursor steps through: the track's, else the densest series'.
  const epochTimes = ep ? f64(ep.map((e) => e.t ?? e.t_s)) : null;
  const times = track ? track.t : epochTimes || all.reduce((a, b) => (b.length > a.length ? b : a));
  const step = times.length > 1 ? (times[times.length - 1] - times[0]) / (times.length - 1) : 0;
  // The scene's clock: the receiver-trust and ephemeris results start at the scene's t = 0.
  const epochMs = num(geo.epochMs) ? geo.epochMs : NaN;
  return {
    span: [t0, t1], times, step, series,
    threshold: model && num(model.threshold) && series.length && plotSeries(model, result).length ? model.threshold : null,
    thresholdLabel: (model && model.thresholdLabel) || "",
    title: (model && plotSeries(model, result).length && model.title) || (series[0] ? series[0].label : ""),
    yLabel: (model && plotSeries(model, result).length && model.yLabel) || (series[0] ? `${series[0].label}${series[0].unit ? ` (${series[0].unit})` : ""}` : ""),
    track, sites: geo.sites, areas: geo.areas, movers: geo.movers, routes: geo.routes, epochMs, epochs: ep, epochTimes,
  };
}

/** Whether the model has anything to place on the map. */
export const hasGeo = (m) => !!(m && (m.track || m.sites.length || m.areas.length || m.movers.length || m.routes.length));

/** Linear interpolation of a mover or track at `t` (null outside its times): { lat, lon, i }. */
export function positionAt(obj, t) {
  const T = obj && obj.t;
  if (!T || !T.length || t < T[0] || t > T[T.length - 1]) return null;
  const i = indexAtOrBefore(T, t);
  if (i >= T.length - 1 || T[i + 1] === T[i]) return { lat: obj.lat[i], lon: obj.lon[i], i };
  const f = (t - T[i]) / (T[i + 1] - T[i]);
  let dl = obj.lon[i + 1] - obj.lon[i];
  if (dl > 180) dl -= 360; else if (dl < -180) dl += 360;
  let lon = obj.lon[i] + f * dl;
  if (lon > 180) lon -= 360; else if (lon < -180) lon += 360;
  return { lat: obj.lat[i] + f * (obj.lat[i + 1] - obj.lat[i]), lon, i };
}

/**
 * The values at the cursor: [{ k, v, unit, state }] for the inspector. A series gives its
 * value at the last epoch at or before `t`; the track its position and trust; a jamming run
 * whether a fix (four or more satellites tracking) is held.
 */
export function readoutAt(m, t) {
  if (!m) return [];
  const out = [];
  if (m.track) {
    const i = indexAtOrBefore(m.track.t, t);
    if (i >= 0) {
      out.push({ k: "position", v: `${Math.abs(m.track.lat[i]).toFixed(4)}° ${m.track.lat[i] >= 0 ? "N" : "S"} · ${Math.abs(m.track.lon[i]).toFixed(4)}° ${m.track.lon[i] >= 0 ? "E" : "W"}`, unit: "" });
      const q = m.track.q[i];
      if (m.track.kind === "trust") out.push({ k: "trust", v: Number.isNaN(q) ? (m.track.state && m.track.state[i]) || "–" : `${(q * 100).toFixed(1)} · ${m.track.state[i] || ""}`, unit: "", state: Number.isNaN(q) ? "" : q >= 0.9 ? "pass" : q >= 0.55 ? "warn" : "fail" });
      if (m.track.kind === "visible") out.push({ k: "station", v: q === 1 ? "in view" : "not in view", unit: "", state: q === 1 ? "pass" : "" });
    }
  }
  for (const s of m.series) {
    const i = indexAtOrBefore(s.t, t);
    if (i >= 0 && t >= s.t[0] - 1e-9) out.push({ k: s.label, v: s.v[i], unit: s.unit });
  }
  if (m.epochs && typeof m.epochs[0].tracking === "number") {
    const e = m.epochs[indexAtOrBefore(m.epochTimes, t)];
    if (e) {
      const js = Array.isArray(e.sats) ? e.sats.map((s) => s.js_db).filter(num) : [];
      if (js.length) out.push({ k: "J/S (mean)", v: js.reduce((a, b) => a + b, 0) / js.length, unit: "dB" });
      out.push({ k: "fix", v: e.tracking >= 4 ? "held" : "lost", unit: "", state: e.tracking >= 4 ? "pass" : "fail" });
    }
  }
  return out;
}
