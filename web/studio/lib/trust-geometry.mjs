// SPDX-License-Identifier: AGPL-3.0-only
// The geometry lane of the Maritime trust view (0.36; docs/MARITIME-TRUST.md "Studio view specification",
// item 6, engine feat/geometry-trust-0.36 debc5f33). Reads what the engine writes beside the score:
//   per epoch `geometry` (status, label, reasons, source, n_used, in_view, the DOPs, open_fraction, the largest
//   azimuth gap, the age of the sky, the reported HDOP, reported_derived_mismatch, signal_loss and the engine's
//   note), and on every deduction a `class` (geometry, environment or inconsistency);
//   at the top of a batch result `geometry_model` (the [geometry] thresholds, hold, the cap and floor in force,
//   provenance and the class rules) and `geometry_summary` (status, label and class counts).
// Live JSON lines carry the per-epoch fields from schema 1.3. Every field is checked; a run from an engine older
// than 0.36 has none, and the view says so rather than drawing a good sky. The label is always shown; the
// geometry monitor deducts only when the label is poor, and the view shows that deduction only when it is
// non-zero. Nothing here computes a navigation figure. Pure; tested in trust-geometry.test.mjs.

export const GEO_STATUSES = Object.freeze(["good", "degraded", "unknown"]);
export const GEO_LABELS = Object.freeze(["good", "fair", "poor", "unknown"]);
export const CLASSES = Object.freeze(["geometry", "environment", "inconsistency"]);
// Plain words for the reasons the engine gives (src/receiver_trust/geometry.rs).
export const GEO_REASONS = Object.freeze({
  "few-satellites": "fewer satellites than the minimum",
  "high-pdop": "PDOP above its threshold",
  "high-hdop": "HDOP above its threshold",
  "sky-blocked": "the tracked satellites leave a wide gap in azimuth (one side of the sky blocked)",
});
export const UNKNOWN_TEXT = "geometry unknown: no GSV or GSA in the log";
export const CLASS_TEXT = Object.freeze({
  geometry: "geometry: the sky, not the signal",
  environment: "environment: the signal (power, jamming, satellites lost while the sky is open)",
  inconsistency: "inconsistency: attack-like, not explained by the sky or the signal",
});
const SOURCE_TEXT = Object.freeze({ derived: "derived from the satellites the log reports (GSV)", reported: "the receiver's stated DOP (GSA)", none: "nothing" });
// The [geometry] fields of geometry_model, in the order shown, with their meaning.
export const THRESHOLDS = Object.freeze([
  ["hdop_max", "HDOP above which the geometry is poor"],
  ["pdop_max", "PDOP above which the geometry is poor"],
  ["min_used", "fewest satellites used before the geometry is poor"],
  ["hdop_good", "HDOP at or below which the geometry is good"],
  ["pdop_good", "PDOP at or below which the geometry is good"],
  ["used_good", "satellites used at or above which the geometry is good"],
  ["azimuth_gap_deg", "azimuth gap, degrees, at or above which the sky is partly blocked"],
  ["low_elev_deg", "elevation, degrees, below which a lost satellite is put down to the sky"],
  ["reported_vs_derived_tol", "stated-versus-derived HDOP difference before the two disagree"],
  ["reported_vs_derived_rel", "the same, as a share of the derived HDOP"],
  ["sigma_uere_m", "user-equivalent range error the thresholds assume, metres"],
  ["cap_points", "most points the geometry deduction may take"],
  ["full_ratio", "ratio at which the geometry deduction reaches its cap"],
  ["floor", "lowest score the geometry alone may leave (empty: the degraded band's edge)"],
  ["cap_in_force", "most points the geometry deduction takes in this run"],
  ["floor_in_force", "lowest score the geometry alone can leave in this run"],
  ["hold_s", "how long sky positions and GSA count after they arrive, s"],
]);

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const numOrNull = (x) => (isNum(x) ? x : null);
const count = (x) => (isNum(x) && x >= 0 ? Math.round(x) : null);
const str = (x, max = 2000) => (typeof x === "string" ? x.slice(0, max) : "");

// One epoch's `geometry` object, normalised; null when the epoch has none (an engine before 0.36).
// A status or label this page does not know is read as unknown, never as good, and flagged so the page can count it.
export function readEpochGeometry(g) {
  if (!g || typeof g !== "object" || Array.isArray(g)) return null;
  const knownStatus = GEO_STATUSES.includes(g.status), knownLabel = GEO_LABELS.includes(g.label);
  return {
    status: knownStatus ? g.status : "unknown",
    label: knownLabel ? g.label : "unknown",
    odd: knownStatus && (knownLabel || g.label === undefined) ? null : str(String(knownStatus ? g.label : g.status), 40),
    reasons: (Array.isArray(g.reasons) ? g.reasons : []).filter((r) => typeof r === "string").slice(0, 10).map((r) => r.slice(0, 40)),
    source: Object.hasOwn(SOURCE_TEXT, g.source) ? g.source : null,
    nUsed: count(g.n_used), inView: count(g.in_view),
    pdop: numOrNull(g.pdop), hdop: numOrNull(g.hdop), vdop: numOrNull(g.vdop),
    openFraction: isNum(g.open_fraction) && g.open_fraction >= 0 && g.open_fraction <= 1 ? g.open_fraction : null,
    gapDeg: numOrNull(g.max_azimuth_gap_deg),
    ageS: numOrNull(g.age_s),
    reportedHdop: numOrNull(g.reported_hdop),
    mismatch: g.reported_derived_mismatch === true,
    signalLoss: g.signal_loss === true,
    note: str(g.note, 400),
  };
}

// A deduction's `class`: one of CLASSES, else null (an engine before 0.36, or a name this page does not know).
export const readClass = (c) => (CLASSES.includes(c) ? c : null);

// A batch result's `geometry_model`: thresholds in force with their provenance, and the class rules in words.
export function readGeometryModel(m) {
  if (!m || typeof m !== "object" || Array.isArray(m)) return null;
  const thresholds = THRESHOLDS.filter(([k]) => isNum(m[k]) || (k === "floor" && m[k] === null)).map(([k, what]) => ({ key: k, value: isNum(m[k]) ? m[k] : null, what }));
  const prov = m.provenance && typeof m.provenance === "object" && !Array.isArray(m.provenance) ? m.provenance : {};
  const provenance = Object.keys(prov).filter((k) => typeof prov[k] === "string").sort().slice(0, 30).map((k) => ({ key: k.slice(0, 40), text: str(prov[k]) }));
  return { thresholds, provenance, classes: str(m.classes), capInForce: numOrNull(m.cap_in_force), floorInForce: numOrNull(m.floor_in_force) };
}

// A batch result's `geometry_summary`: epoch counts by status, label and class.
export function readGeometrySummary(s) {
  if (!s || typeof s !== "object" || Array.isArray(s)) return null;
  return {
    good: count(s.good), degraded: count(s.degraded), unknown: count(s.unknown),
    labelGood: count(s.label_good), labelFair: count(s.label_fair), labelPoor: count(s.label_poor),
    classGeometry: count(s.class_geometry), classEnvironment: count(s.class_environment), classInconsistency: count(s.class_inconsistency),
    firstDegradedS: numOrNull(s.first_degraded_t_s),
  };
}

// The classes among an epoch's deductions that cost points.
export const classesAt = (e) => new Set((e.deductions || []).filter((d) => d.points > 0 && d.class).map((d) => d.class));
// The geometry monitor's deduction at an epoch: points > 0 only when the label is poor; else null.
export function geometryDeduction(e) {
  const d = (e.deductions || []).find((x) => x.monitor === "geometry" && x.points > 0);
  return d ? { points: d.points, class: d.class, ratio: d.ratio } : null;
}

// Counts over the epochs the view holds (a stream has no summary of its own): status, label, and epochs with a
// deduction of each class.
export function countGeometry(epochs) {
  const c = { good: 0, degraded: 0, unknown: 0, missing: 0, label: { good: 0, fair: 0, poor: 0, unknown: 0 }, cls: { geometry: 0, environment: 0, inconsistency: 0 }, odd: 0 };
  for (const e of epochs) {
    if (!e.geometry) { c.missing++; continue; }
    c[e.geometry.status]++;
    c.label[e.geometry.label]++;
    if (e.geometry.odd) c.odd++;
    for (const k of classesAt(e)) c.cls[k]++;
  }
  return c;
}

// The strip keys for an epoch. Status: as the engine says, or "missing" (an older engine). Class: the most serious
// class costing points at the epoch, inconsistency before environment before geometry ("none" when nothing does);
// so an attack-like deduction is never hidden behind a sky one.
export const statusKey = (e) => (e.geometry ? e.geometry.status : "missing");
export function classKey(e) {
  if (!e.geometry) return "missing";
  const s = classesAt(e);
  return s.has("inconsistency") ? "inconsistency" : s.has("environment") ? "environment" : s.has("geometry") ? "geometry" : "none";
}

// Whether a geometry-class deduction costs points at the epoch under a more serious class (the strip's colour), so
// the view can underline it rather than hide the sky's share.
export const geometryUnder = (e) => !!e.geometry && classKey(e) !== "geometry" && classesAt(e).has("geometry");

const fmt = (x, d) => (x == null ? "not stated" : x.toFixed(d));

// What the panel shows for the epoch under the cursor: the engine's note as the heading (it opens with the label
// and the metrics), then rows; the flags when set; the geometry deduction only when it is non-zero.
export function geometryAt(e) {
  const g = e.geometry;
  if (!g) return { heading: "No geometry in this run (an engine before 0.36 writes none).", tone: "missing", rows: [], flags: [] };
  const unknown = g.status === "unknown" || g.label === "unknown";
  const heading = unknown
    ? (g.odd ? `Geometry unknown (the file says "${g.odd}", which this page does not know).` : `${UNKNOWN_TEXT[0].toUpperCase()}${UNKNOWN_TEXT.slice(1)}.`)
    : (g.note || `geometry ${g.label}`);
  const rows = [
    ["Label", g.label + (g.label === "fair" ? " (not scored)" : g.label === "poor" ? " (the only label the score deducts for)" : "")],
    ["Status", g.status + (g.reasons.length ? `: ${g.reasons.map((r) => (Object.hasOwn(GEO_REASONS, r) ? GEO_REASONS[r] : r)).join("; ")}` : "")],
    ["Satellites used", g.nUsed == null ? "not stated" : String(g.nUsed) + (g.inView != null ? ` of ${g.inView} in view` : "")],
    ["HDOP", fmt(g.hdop, 2)], ["PDOP", fmt(g.pdop, 2)], ["VDOP", fmt(g.vdop, 2)],
    ["Largest azimuth gap", g.gapDeg == null ? "not stated" : `${Math.round(g.gapDeg)}°`],
    ["Open sky", g.openFraction == null ? "not stated" : `${Math.round(g.openFraction * 100)} %`],
    ["Age of the sky", g.ageS == null ? "not stated" : `${g.ageS.toFixed(1)} s`],
    ["From", g.source ? SOURCE_TEXT[g.source] : "not stated"],
  ];
  if (g.reportedHdop != null) rows.push(["HDOP the receiver states", g.reportedHdop.toFixed(1)]);
  const flags = [];
  if (g.mismatch) flags.push({ kind: "mismatch", text: "The HDOP the receiver states disagrees with the one derived from the sky it reports: a geometry deduction counts as inconsistency." });
  if (g.signalLoss) flags.push({ kind: "signal-loss", text: "Signal loss: satellites in view are not tracked although their geometry is good, so a geometry deduction counts as environment." });
  const ded = geometryDeduction(e);
  if (ded) rows.push(["Geometry deduction", `${ded.points.toFixed(1)} points${ded.class ? ` (${ded.class})` : ""}`]);
  return { heading, tone: unknown ? "unknown" : g.label, rows, flags };
}

// A short phrase for the epoch's spoken description.
export function describeGeometry(e) {
  const g = e.geometry;
  if (!g) return "";
  if (g.status === "unknown" || g.label === "unknown") return UNKNOWN_TEXT;
  const ded = geometryDeduction(e);
  return `geometry ${g.label}${g.hdop != null ? ` (HDOP ${g.hdop.toFixed(1)})` : ""}${g.mismatch ? ", stated HDOP disagrees" : ""}${ded ? `, geometry deduction ${ded.points.toFixed(1)} points` : ""}`;
}
