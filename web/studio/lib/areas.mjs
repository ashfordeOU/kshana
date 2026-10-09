// SPDX-License-Identifier: AGPL-3.0-only
// The capability map: one tile per area (domain) with its scenario count, a small real preview
// from a recorded run, and the mix of evidence behind it.
//
// Evidence comes from the engine's verification matrix (data/verification-matrix.json), which
// gives every capability one status: VALIDATED (matches an independent external reference) or
// MODELLED (follows the stated physics and passes internal checks), plus a few rows owned by
// partners. The matrix defines no third level, so the tile shows two parts.
//
// An area's mix counts the matrix rows for the engine modules its scenarios run. A scenario runs
// every kind named in its file (`kind = "..."` lines: a campaign names its members' kinds too),
// or the clock kind when none is named. A row belongs
// to a kind when the row's `module` (or `tests`) field names the kind's module: the kind with
// hyphens as underscores, or as written. Kinds whose module has another name are listed in
// KIND_MODULES below; that table is the only hand-written part. Pure; tested in areas.test.mjs.
import * as V from "./views.mjs";
import * as K from "./kinds.mjs";
import * as G from "./stages.mjs";
import { own } from "./own.mjs";

export const DEFAULT_KIND = "holdover";

// Kind -> the module names its rows use, where they differ from the kind's own name.
export const KIND_MODULES = {
  "gnss-ins": ["fusion"],
  "hybrid-ukf": ["fusion"],
  hybrid: ["fusion", "holdover"],
  "conflict-resilience": ["resilience"],
  "terrain-nav": ["altpnt"],
  "terrain-slam": ["altpnt"],
  "gravity-map": ["gravity_sh", "altpnt"],
  "combined-altpnt": ["altpnt"],
  "quantum-gnss-free-nav": ["quantum_nav_od"],
  "quantum-time-transfer": ["timetransfer_chain"],
  "moonlight-service-volume": ["lunar_service"],
  "lunar-integrity": ["lunar_service"],
  "lunar-attack-surface": ["lunar_service", "antenna"],
  "lunar-time-offset": ["lunar_time"],
  "lunar-differential-pnt": ["lunar_dpnt"],
  "lunar-joint-od-clock": ["lunar_combination"],
  "lunar-interop-export": ["lunar_interop"],
  "quantum-anomaly-detect": ["quantum_faults"],
  pvt: ["rinex"],
  ephemeris: ["sgp4"],
  inertial: ["inertial"],
  "constellation-design": ["constellation"],
  integrity: ["raim", "sbas"],
  "araim-reference-check": ["araim_reference"],
  "launch-window": ["launch"],
  "eo-coverage": ["eo_payload"],
  "link-budget": ["linkbudget"],
  "aperture-duty-cycle": ["aperture_duty"],
  "oem-interop": ["oem"],
  "telecom-timing": ["telecom_timing"],
  "slot-timing": ["slot_timing"],
  "solar-system": ["solar_system", "ephem"],
  "body-pnt": ["body_pnt"],
  "mars-pnt": ["mars_pnt", "body_pnt"],
};

export const kindOfToml = (toml) => (String(toml).match(/^\s*kind\s*=\s*"([^"]+)"/m) || [])[1] || DEFAULT_KIND;
// Every kind a scenario file names (its own and, for a campaign, its members').
export const kindsOfToml = (toml) => { const ks = [...String(toml).matchAll(/^\s*kind\s*=\s*"([^"]+)"/gm)].map((m) => m[1]); return ks.length ? [...new Set(ks)] : [DEFAULT_KIND]; };

// A whole module name: not part of a longer name, and not a folder in a file path (src/integrity/...).
const tokenRe = (t) => new RegExp(`(^|[^A-Za-z0-9_/.-])${t.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")}([^A-Za-z0-9_/-]|$)`);
const moduleMatch = (row, t) => tokenRe(t).test(row.module || "") || tokenRe(t).test(row.tests || "");

// Indices of the matrix rows that belong to a kind.
export function rowsForKind(kind, rows) {
  const names = [kind, kind.replace(/-/g, "_"), ...(own(KIND_MODULES, kind) || [])];
  const out = [];
  rows.forEach((r, i) => { if (names.some((n) => moduleMatch(r, n))) out.push(i); });
  return out;
}

// Counts of a set of rows by status.
export function evidenceMix(indices, rows) {
  const m = { validated: 0, modelled: 0, partner: 0, total: 0 };
  for (const i of new Set(indices)) {
    const s = String(rows[i].status || "").toUpperCase();
    if (s === "VALIDATED") m.validated++;
    else if (s === "MODELLED") m.modelled++;
    else m.partner++;
    m.total++;
  }
  return m;
}

// Share of validated rows, 0..100, among validated and modelled (partner rows are not the
// engine's own evidence). Null when the area maps to no row.
export function validatedShare(mix) {
  const n = mix.validated + mix.modelled;
  return n ? (100 * mix.validated) / n : null;
}

// Down-sample a series of [x, y] to at most n points, scaled to 0..1 on both axes.
export function sparkPoints(points, n = 40) {
  const pts = (points || []).filter((p) => Array.isArray(p) && Number.isFinite(p[0]) && Number.isFinite(p[1]));
  if (pts.length < 2) return null;
  const step = Math.max(1, Math.floor(pts.length / n));
  const s = pts.filter((_, i) => i % step === 0);
  if (s[s.length - 1] !== pts[pts.length - 1]) s.push(pts[pts.length - 1]);
  const xs = s.map((p) => p[0]), ys = s.map((p) => p[1]);
  const x0 = Math.min(...xs), x1 = Math.max(...xs), y0 = Math.min(...ys), y1 = Math.max(...ys);
  if (x1 === x0) return null;
  return s.map((p) => [+((p[0] - x0) / (x1 - x0)).toFixed(4), +(y1 === y0 ? 0.5 : (p[1] - y0) / (y1 - y0)).toFixed(4)]);
}

// A small real preview of a recorded run: the first line series the Studio would draw for it.
// { type: "line", title, points } or null.
export function previewOf(result, toml) {
  const tryLine = (model, title) => {
    const s = model && Array.isArray(model.series) ? model.series.find((x) => (x.points || []).length > 3) : null;
    const pts = s ? sparkPoints(s.points) : null;
    return pts ? { type: "line", title: title || (s && s.label) || "", points: pts } : null;
  };
  try {
    const cap = K.capabilityView(result, toml);
    if (cap) {
      if (cap.stage === "timeline") { const c = G.timelineCharts(result)[0]; const p = c && tryLine(c.model, c.title); if (p) return p; }
      for (const panel of cap.panels || []) if (panel.type === "line") { const p = tryLine(panel.model, panel.title); if (p) return p; }
    }
    const sm = V.seriesModel(result, toml);
    const p = sm && tryLine(sm, sm.title);
    if (p) return p;
    const hm = V.holdoverModel(result);
    if (hm) { const q = tryLine(hm, "Holdover"); if (q) return q; }
    // A coverage map: a coarse heat grid of its first field.
    const cf = G.coverageFields(result);
    if (cf.length && result.grid && Array.isArray(result.grid[cf[0].key])) {
      const g = result.grid[cf[0].key], rowsN = g.length, colsN = (g[0] || []).length;
      const flat = g.flat().filter(Number.isFinite), lo = Math.min(...flat), hi = Math.max(...flat);
      if (rowsN && colsN && hi > lo) {
        const ry = Math.max(1, Math.round(rowsN / 6)), rx = Math.max(1, Math.round(colsN / 18));
        const cells = [];
        for (let i = 0; i < rowsN; i += ry) { const row = []; for (let j = 0; j < colsN; j += rx) row.push(+((g[i][j] - lo) / (hi - lo)).toFixed(3)); cells.push(row); }
        return { type: "heat", title: cf[0].label, cells, lowerBetter: !!cf[0].lowerBetter };
      }
    }
    const gt = V.groundTrack(result);
    if (gt && Array.isArray(gt.points)) { const q = sparkPoints(gt.points.map((x, i) => [i, x[0] ?? x.lat])); if (q) return { type: "line", title: "Ground track", points: q }; }
  } catch { /* a result shape this preview does not know: no preview */ }
  return null;
}
