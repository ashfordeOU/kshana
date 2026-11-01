// SPDX-License-Identifier: AGPL-3.0-only
// The interference map page's data model: reads the per-day GeoJSON that `kshana interference-map`
// writes (schema "kshana-interference-map/v1") and prepares what the page shows. Built on the generic
// layer loader (geojson-layer.mjs). Pure; tested in interference.test.mjs.
//
// What the files are: a description of what published position reports looked like on a past day.
// Not a measurement of any receiver, not a forecast, not proof of interference. A cell that is not
// drawn was not observed; that is not evidence of a clear cell.
// Each file is its own layer. ADS-B and AIS files are never merged: their licences differ (an ADS-B
// file made from the ADS-B source's data carries that source's licence, ODbL 1.0; AIS files are public domain or NLOD 2.0), and so does
// what a cell means.
import { parseGeoJson } from "./geojson-layer.mjs";
import { t } from "./t.mjs";

// Text in the tables below is read through getters, so it follows the language at render time and not at import.
const lazyList = (fns) => { const a = []; fns.forEach((f, i) => Object.defineProperty(a, i, { get: f, enumerable: true })); return Object.freeze(a); };

// Limits a file is read within.
export const MAX_BYTES = 16 * 1024 * 1024;
export const MAX_BYTES_TEXT = "16 MiB";
export const MAX_TABLE_ROWS = 500;

export const SCHEMA = "kshana-interference-map/v1";
// format_version values this page supports (a change that removes or renames a field raises it; adding a
// field does not, and a reader ignores fields it does not know).
export const SUPPORTED_FORMATS = [1];

// What a cell's status means, per source. `tone` picks the colour: bad, ok, none (no call), hold.
export const STATUSES = Object.freeze({
  adsb: [
    { id: "degraded", get label() { return t("js-interf-st-degraded-label", "Degraded"); }, tone: "bad", get text() { return t("js-interf-st-degraded-text", "A high share of the sampled aircraft reported low navigation accuracy here that day, well above the day's median cell. It does not say why."); } },
    { id: "not_degraded", get label() { return t("js-interf-st-not-degraded-label", "Not degraded"); }, tone: "ok", get text() { return t("js-interf-st-not-degraded-text", "Sampled, and the share of aircraft reporting low accuracy did not stand out. Not proof that nothing happened."); } },
    { id: "insufficient_sample", get label() { return t("js-interf-st-too-few-label", "Too few aircraft"); }, tone: "none", get text() { return t("js-interf-st-too-few-text", "Published (at least 5 distinct aircraft observed) but fewer than 10 aircraft could be sampled, so no call is made."); } },
    { id: "withheld_day_confounded", get label() { return t("js-interf-st-confounded-label", "Day confounded"); }, tone: "hold", get text() { return t("js-interf-st-confounded-text", "The whole day's median cell share was high, which points to a wide-area cause. No cell is declared degraded on such a day; this cell would otherwise have stood out."); } },
    { id: "withheld_no_background", get label() { return t("js-interf-st-no-background-label", "No background estimate"); }, tone: "hold", get text() { return t("js-interf-st-no-background-text", "The day's background (the typical share of aircraft reporting low accuracy) could not be estimated from enough cells, so no cell is compared with it and none is called."); } },
  ],
  ais: [
    { id: "anomalous", get label() { return t("js-interf-st-anomalous-label", "Anomalous"); }, tone: "bad", get text() { return t("js-interf-st-anomalous-text", "At least one detector flagged enough distinct vessels here that day (at least 3 vessels and 20% of those observed). Possible causes include interference but also many ordinary ones."); } },
    { id: "not_anomalous", get label() { return t("js-interf-st-not-anomalous-label", "Not anomalous"); }, tone: "ok", get text() { return t("js-interf-st-not-anomalous-text", "Observed, and no detector qualified. Not proof that nothing happened."); } },
  ],
});
export const KIND_LABEL = { adsb: "ADS-B", ais: "AIS" };

// The four states a reader sees, none hidden or merged with another. "Not observed" has no feature.
export const STATES = Object.freeze([
  { id: "degraded",
    label: { get adsb() { return t("js-interf-state-degraded-adsb", "Degraded"); }, get ais() { return t("js-interf-state-degraded-ais", "Anomalous"); } },
    text: { get adsb() { return t("js-interf-state-degraded-adsb-text", "A high share of the sampled aircraft reported low navigation accuracy here that day, well above the day's median cell."); }, get ais() { return t("js-interf-state-degraded-ais-text", "At least one detector flagged enough distinct vessels here that day (at least 3 vessels and 20% of those observed)."); } } },
  { id: "clear",
    label: { get adsb() { return t("js-interf-state-clear-adsb", "Clear"); }, get ais() { return t("js-interf-state-clear-ais", "Clear"); } },
    text: { get adsb() { return t("js-interf-state-clear-adsb-text", "Observed with enough aircraft and not flagged. Not proof that nothing happened."); }, get ais() { return t("js-interf-state-clear-ais-text", "Observed with enough vessels and not flagged. Not proof that nothing happened."); } } },
  { id: "unassessed",
    label: { get adsb() { return t("js-interf-state-unassessed-adsb", "Unassessed"); }, get ais() { return t("js-interf-state-unassessed-ais", "Unassessed"); } },
    text: { get adsb() { return t("js-interf-state-unassessed-adsb-text", "Observed, but too few aircraft could be sampled, the day was confounded, or the day's background could not be estimated, so no call is made."); }, get ais() { return t("js-interf-state-unassessed-ais-text", "Observed, but no call is made."); } } },
  { id: "notobserved",
    label: { get adsb() { return t("js-interf-state-notobs-adsb", "Not observed"); }, get ais() { return t("js-interf-state-notobs-ais", "Not observed"); } },
    text: { get adsb() { return t("js-interf-state-notobs-adsb-text", "No cell drawn: too few aircraft were observed to publish it. This is not evidence that the area was clear."); }, get ais() { return t("js-interf-state-notobs-ais-text", "No cell drawn: too few vessels were observed to publish it. This is not evidence that the area was clear."); } } },
]);
const STATE_OF = Object.assign(Object.create(null), { degraded: "degraded", anomalous: "degraded", not_degraded: "clear", not_anomalous: "clear", insufficient_sample: "unassessed", withheld_day_confounded: "unassessed", withheld_no_background: "unassessed" });
export const stateOf = (status) => (typeof status === "string" && STATE_OF[status]) || "unassessed";
export const stateInfo = (kind, id) => { const s = STATES.find((x) => x.id === id); return { id, label: s.label[kind], text: s.text[kind] }; };
export function stateCounts(map) {
  const c = { degraded: 0, clear: 0, unassessed: 0 };
  for (const cell of map.cells) c[stateOf(cell.status)]++;
  return c;
}

// The caveats that stay visible with every map (docs/INTERFERENCE-MAP.md, Studio map page specification).
export const KEEP_CAVEATS = lazyList([
  () => t("js-interf-caveat-not-finding", "A degraded or anomalous cell is not a finding of interference. Other causes exist."),
  () => t("js-interf-caveat-no-colour", "A cell with no colour was not observed. It is not evidence that the area was clear."),
  () => t("js-interf-caveat-past-reports", "This is a description of past position reports, not a forecast and not a measurement of any receiver."),
  () => t("js-interf-caveat-coverage", "Coverage follows the data source; read the coverage notes."),
]);

// A link only for http(s) addresses; anything else is shown as text.
export const safeUrl = (u) => (/^https?:\/\/[^\s<>"']+$/i.test(String(u || "")) ? u : null);

const isObj = (x) => x && typeof x === "object" && !Array.isArray(x);
const str = (x) => (typeof x === "string" ? x : "");

// Read one map file. Returns { map } or { error }.
export function parseMapFile(text, name = "file") {
  const g = parseGeoJson(text, name);
  if (g.error) return { error: g.error };
  const m = g.layer.meta.kshana_interference_map;
  if (!isObj(m)) return { error: t("js-interf-err-not-map", "{ $name }: this is GeoJSON but not a Kshana interference map (no kshana_interference_map member).", { name }) };
  if (typeof m.schema !== "string" || !m.schema.startsWith("kshana-interference-map/")) return { error: t("js-interf-err-unknown-schema", "{ $name }: unknown schema { $schema }; this page reads { $supported }.", { name, schema: JSON.stringify(m.schema), supported: SCHEMA }) };
  if (m.source_kind !== "adsb" && m.source_kind !== "ais") return { error: t("js-interf-err-source-kind", "{ $name }: source_kind { $kind } is neither adsb nor ais.", { name, kind: JSON.stringify(m.source_kind) }) };
  if (typeof m.format_version !== "number" || !SUPPORTED_FORMATS.includes(m.format_version)) return { error: t("js-interf-err-format-version", "{ $name }: not a supported Kshana interference map (format_version { $version }; this page supports { $supported }).", { name, version: JSON.stringify(m.format_version), supported: SUPPORTED_FORMATS.join(", ") }) };
  const kind = m.source_kind;
  const known = new Set(STATUSES[kind].map((s) => s.id));
  const cells = [];
  const unknownStatus = new Set();
  for (const f of g.layer.features) {
    const p = f.properties;
    if (f.geometry.type !== "Polygon" || typeof p.status !== "string") continue;
    if (!known.has(p.status)) unknownStatus.add(p.status);
    cells.push({ i: p.cell_i, j: p.cell_j, status: p.status, degraded: p.degraded === true, props: p, geometry: f.geometry });
  }
  const data = isObj(m.data) ? m.data : {};
  const warnings = [];
  if (g.layer.skipped) warnings.push(t("js-interf-warn-skipped", "{ $count } feature(s) were not valid GeoJSON and were skipped.", { count: g.layer.skipped }));
  const disagree = cells.filter((c) => known.has(c.status) && c.degraded !== (c.status === "degraded" || c.status === "anomalous")).length;
  if (disagree) warnings.push(t("js-interf-warn-flag-disagrees", "{ $count } cell(s) have a \"degraded\" flag that disagrees with their status. The status is what is drawn.", { count: disagree }));
  if (unknownStatus.size) warnings.push(t("js-interf-warn-unknown-status", "Status value(s) this page does not know: { $values }. They are drawn as \"no call\".", { values: [...unknownStatus].join(", ") }));
  const missing = [];
  for (const k of ["licence", "attribution"]) if (!str(data[k]).trim()) missing.push(k);
  if (missing.length) warnings.push(t("js-interf-warn-no-licence", "This file carries no { $fields } text. It is shown, but a map without its licence and attribution should not be republished.", { fields: missing.join(" or ") }));
  const grid = isObj(m.grid) ? m.grid : {};
  if (grid.is_preregistered === false) warnings.push(typeof grid.preregistered_cell_deg === "number"
    ? t("js-interf-warn-cell-size-known", "This file uses a cell size of { $size }° that is not the pre-registered one ({ $registered }°): it is not the pre-registered method, so its calls are not comparable with files that use it.", { size: grid.cell_deg, registered: grid.preregistered_cell_deg })
    : t("js-interf-warn-cell-size", "This file uses a cell size of { $size }° that is not the pre-registered one: it is not the pre-registered method, so its calls are not comparable with files that use it.", { size: grid.cell_deg }));
  const day = isObj(m.day) ? m.day : {};
  if (kind === "adsb" && day.day_confounded === true) warnings.push(t("js-interf-warn-day-confounded", "This day is confounded: no cell was called degraded because of the day’s background (the median cell share was itself high)."));
  if (kind === "ais" && typeof day.on_land_detector === "string" && day.on_land_detector.startsWith("disabled")) warnings.push(t("js-interf-warn-on-land-off", "The on-land detector was off for this file (no land polygons were supplied)."));
  return {
    map: {
      name, kind, date: str(m.date), schema: m.schema, version: str(m.kshana_version), grid: isObj(m.grid) ? m.grid : {},
      method: isObj(m.method) ? m.method : {}, day, data, notice: str(m.notice), cells, bbox: g.layer.bbox, warnings,
      licence: licenceBlock(data, m.notice),
    },
  };
}

// The licence and attribution text exactly as the file states it, never reworded.
export function licenceBlock(data, notice) {
  return {
    dataset: str(data.dataset), name: str(data.name), licence: str(data.licence), licenceUrl: str(data.licence_url),
    attribution: str(data.attribution), coverage: Array.isArray(data.coverage_notes) ? data.coverage_notes.filter((x) => typeof x === "string") : [],
    notice: str(notice),
  };
}

export const statusInfo = (kind, id) => STATUSES[kind].find((s) => s.id === id) || { id, label: id, tone: "none", get text() { return t("js-interf-status-unknown", "A status this page does not describe."); } };

export function statusCounts(map) {
  const c = {};
  for (const s of STATUSES[map.kind]) c[s.id] = 0;
  for (const cell of map.cells) c[cell.status] = (c[cell.status] || 0) + 1;
  return c;
}

// A count the file gives as null is withheld (fewer than the publication minimum of 5), never zero.
export const withheld = () => t("js-interf-withheld", "withheld (fewer than 5)");
const ratio = (x) => (typeof x === "number" ? `${Math.round(x * 1000) / 10}%` : withheld());
const count = (x) => (typeof x === "number" ? x : x === null ? withheld() : "");

// Rows [label, value] describing one cell, with what each number means. A null AIS count is a count of
// one or two, withheld so it cannot single out a vessel.
export function cellRows(map, cell) {
  const p = cell.props, rows = [];
  rows.push([t("js-interf-row-status", "Status"), statusInfo(map.kind, cell.status).label]);
  if (map.kind === "adsb") {
    rows.push([t("js-interf-row-aircraft-observed", "Aircraft observed"), count(p.aircraft_observed)], [t("js-interf-row-aircraft-sampled", "Aircraft sampled"), count(p.aircraft_sampled)], [t("js-interf-row-aircraft-affected", "Aircraft affected"), count(p.aircraft_affected)], [t("js-interf-row-affected-share", "Affected share"), ratio(p.affected_share)]);
  } else {
    rows.push([t("js-interf-row-vessels-observed", "Vessels observed"), count(p.vessels_observed)]);
    const f = isObj(p.vessels_flagged) ? p.vessels_flagged : {};
    for (const [d, n] of Object.entries(f)) rows.push([t("js-interf-row-flagged", "Flagged: { $detector }", { detector: d.replace(/_/g, " ") }), n === null ? withheld() : n]);
    rows.push([t("js-interf-row-detectors", "Detectors that qualified"), Array.isArray(p.detectors) && p.detectors.length ? p.detectors.join(", ").replace(/_/g, " ") : t("js-interf-none", "none")]);
  }
  const b = cellBounds(cell);
  rows.push([t("js-interf-row-cell", "Cell"), `i ${p.cell_i}, j ${p.cell_j}`], [t("js-interf-row-area", "Area"), `${fmtLat(b.south)} to ${fmtLat(b.north)}, ${fmtLon(b.west)} to ${fmtLon(b.east)}`]);
  return rows;
}

export function cellBounds(cell) {
  const r = cell.geometry.coordinates[0];
  let west = Infinity, east = -Infinity, south = Infinity, north = -Infinity;
  for (const p of r) { if (p[0] < west) west = p[0]; if (p[0] > east) east = p[0]; if (p[1] < south) south = p[1]; if (p[1] > north) north = p[1]; }
  return { west, east, south, north };
}
export const fmtLat = (d) => `${Math.abs(d).toFixed(2)}°${d < 0 ? "S" : "N"}`;
export const fmtLon = (d) => `${Math.abs(d).toFixed(2)}°${d < 0 ? "W" : "E"}`;

// A flat description of a parameter value for the method table.
export function showValue(v) {
  if (v === null) return t("js-interf-none", "none");
  if (typeof v === "object") return JSON.stringify(v);
  return String(v);
}

// Files grouped by source and sorted by date: a list of groups, never one merged layer.
export function groupBySource(maps) {
  const out = [];
  for (const kind of ["adsb", "ais"]) {
    const ms = maps.filter((m) => m.kind === kind).sort((a, b) => a.date.localeCompare(b.date) || a.name.localeCompare(b.name));
    if (ms.length) out.push({ kind, maps: ms });
  }
  return out;
}

// The one-line description a screen reader hears for a map.
export function describeMap(map) {
  const c = statusCounts(map);
  const parts = STATUSES[map.kind].map((s) => `${c[s.id]} ${s.label.toLowerCase()}`);
  return t("js-interf-describe-map", "{ $kind } map for { $date }: { $cells } cells drawn, { $parts }. Cells not drawn were not observed.", { kind: KIND_LABEL[map.kind], date: map.date, cells: map.cells.length, parts: parts.join(", ") });
}

// Index of the cell containing a [lon, lat], or -1.
export function cellAt(map, lon, lat) {
  const cd = Number(map.grid.cell_deg);
  if (!(cd > 0)) return map.cells.findIndex((c) => { const b = cellBounds(c); return lon >= b.west && lon < b.east && lat >= b.south && lat < b.north; });
  const i = Math.floor((lat + 90) / cd), j = Math.floor((lon + 180) / cd);
  return map.cells.findIndex((c) => c.i === i && c.j === j);
}

// Cells ordered for a table: calls that matter first, then by share, then position.
export function cellsForTable(map) {
  const rank = Object.fromEntries(STATUSES[map.kind].map((s, k) => [s.id, k]));
  const share = (c) => (typeof c.props.affected_share === "number" ? c.props.affected_share : Array.isArray(c.props.detectors) ? c.props.detectors.length : 0); // a withheld (null) share sorts last
  return map.cells.map((c, idx) => ({ c, idx })).sort((a, b) => (rank[a.c.status] ?? 9) - (rank[b.c.status] ?? 9) || share(b.c) - share(a.c) || a.c.i - b.c.i || a.c.j - b.c.j);
}

// ---------- route exposure (kshana-route-exposure/v1) ----------

export const ROUTE_SCHEMA = "kshana-route-exposure/v1";
export function parseRouteExposure(text, name = "file") {
  let o;
  try { o = JSON.parse(String(text).replace(/^\uFEFF/, "")); } catch (e) { return { error: t("js-interf-err-not-json", "{ $name }: not JSON ({ $reason }).", { name, reason: e.message }) }; }
  const r = isObj(o) && isObj(o.kshana_route_exposure) ? o.kshana_route_exposure : null;
  if (!r) return { error: t("js-interf-err-not-route", "{ $name }: not a Kshana route-exposure report (no kshana_route_exposure member).", { name }) };
  if (r.schema !== ROUTE_SCHEMA) return { error: t("js-interf-err-route-schema", "{ $name }: schema { $schema } is not { $expected }, which this page reads.", { name, schema: JSON.stringify(r.schema), expected: ROUTE_SCHEMA }) };
  if (!Array.isArray(r.rows)) return { error: t("js-interf-err-no-rows", "{ $name }: no rows[] in this report.", { name }) };
  const num = (x) => typeof x === "number" && Number.isFinite(x);
  const rows = [];
  let bad = 0;
  for (const x of r.rows) {
    if (!isObj(x) || (x.source_kind !== "adsb" && x.source_kind !== "ais") || !["share_degraded", "share_not_degraded", "share_unassessed", "share_not_observed", "route_km"].every((k) => num(x[k]))) { bad++; continue; }
    rows.push({ date: str(x.date), kind: x.source_kind, km: x.route_km, shares: { degraded: x.share_degraded, clear: x.share_not_degraded, unassessed: x.share_unassessed, notobserved: x.share_not_observed }, licence: str(x.map_licence), attribution: str(x.map_attribution) });
  }
  rows.sort((a, b) => a.date.localeCompare(b.date) || a.kind.localeCompare(b.kind));
  return { report: { name, from: isObj(r.date_range) ? r.date_range.from : null, to: isObj(r.date_range) ? r.date_range.to : null, version: str(r.kshana_version), caveats: Array.isArray(r.caveats) ? r.caveats.filter((c) => typeof c === "string") : [], rows, skipped: bad } };
}
export const pct = (x) => `${Math.round(x * 1000) / 10}%`;
