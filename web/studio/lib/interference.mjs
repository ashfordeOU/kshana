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
    { id: "degraded", label: "Degraded", tone: "bad", text: "A high share of the sampled aircraft reported low navigation accuracy here that day, well above the day's median cell. It does not say why." },
    { id: "not_degraded", label: "Not degraded", tone: "ok", text: "Sampled, and the share of aircraft reporting low accuracy did not stand out. Not proof that nothing happened." },
    { id: "insufficient_sample", label: "Too few aircraft", tone: "none", text: "Published (at least 5 distinct aircraft observed) but fewer than 10 aircraft could be sampled, so no call is made." },
    { id: "withheld_day_confounded", label: "Day confounded", tone: "hold", text: "The whole day's median cell share was high, which points to a wide-area cause. No cell is declared degraded on such a day; this cell would otherwise have stood out." },
    { id: "withheld_no_background", label: "No background estimate", tone: "hold", text: "The day's background (the typical share of aircraft reporting low accuracy) could not be estimated from enough cells, so no cell is compared with it and none is called." },
  ],
  ais: [
    { id: "anomalous", label: "Anomalous", tone: "bad", text: "At least one detector flagged enough distinct vessels here that day (at least 3 vessels and 20% of those observed). Possible causes include interference but also many ordinary ones." },
    { id: "not_anomalous", label: "Not anomalous", tone: "ok", text: "Observed, and no detector qualified. Not proof that nothing happened." },
  ],
});
export const KIND_LABEL = { adsb: "ADS-B", ais: "AIS" };

// The four states a reader sees, none hidden or merged with another. "Not observed" has no feature.
export const STATES = Object.freeze([
  { id: "degraded", label: { adsb: "Degraded", ais: "Anomalous" }, text: { adsb: "A high share of the sampled aircraft reported low navigation accuracy here that day, well above the day's median cell.", ais: "At least one detector flagged enough distinct vessels here that day (at least 3 vessels and 20% of those observed)." } },
  { id: "clear", label: { adsb: "Clear", ais: "Clear" }, text: { adsb: "Observed with enough aircraft and not flagged. Not proof that nothing happened.", ais: "Observed with enough vessels and not flagged. Not proof that nothing happened." } },
  { id: "unassessed", label: { adsb: "Unassessed", ais: "Unassessed" }, text: { adsb: "Observed, but too few aircraft could be sampled, the day was confounded, or the day's background could not be estimated, so no call is made.", ais: "Observed, but no call is made." } },
  { id: "notobserved", label: { adsb: "Not observed", ais: "Not observed" }, text: { adsb: "No cell drawn: too few aircraft were observed to publish it. This is not evidence that the area was clear.", ais: "No cell drawn: too few vessels were observed to publish it. This is not evidence that the area was clear." } },
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
export const KEEP_CAVEATS = Object.freeze([
  "A degraded or anomalous cell is not a finding of interference. Other causes exist.",
  "A cell with no colour was not observed. It is not evidence that the area was clear.",
  "This is a description of past position reports, not a forecast and not a measurement of any receiver.",
  "Coverage follows the data source; read the coverage notes.",
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
  if (!isObj(m)) return { error: `${name}: this is GeoJSON but not a Kshana interference map (no kshana_interference_map member).` };
  if (typeof m.schema !== "string" || !m.schema.startsWith("kshana-interference-map/")) return { error: `${name}: unknown schema ${JSON.stringify(m.schema)}; this page reads ${SCHEMA}.` };
  if (m.source_kind !== "adsb" && m.source_kind !== "ais") return { error: `${name}: source_kind ${JSON.stringify(m.source_kind)} is neither adsb nor ais.` };
  if (typeof m.format_version !== "number" || !SUPPORTED_FORMATS.includes(m.format_version)) return { error: `${name}: not a supported Kshana interference map (format_version ${JSON.stringify(m.format_version)}; this page supports ${SUPPORTED_FORMATS.join(", ")}).` };
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
  if (g.layer.skipped) warnings.push(`${g.layer.skipped} feature(s) were not valid GeoJSON and were skipped.`);
  const disagree = cells.filter((c) => known.has(c.status) && c.degraded !== (c.status === "degraded" || c.status === "anomalous")).length;
  if (disagree) warnings.push(`${disagree} cell(s) have a "degraded" flag that disagrees with their status. The status is what is drawn.`);
  if (unknownStatus.size) warnings.push(`Status value(s) this page does not know: ${[...unknownStatus].join(", ")}. They are drawn as "no call".`);
  const missing = [];
  for (const k of ["licence", "attribution"]) if (!str(data[k]).trim()) missing.push(k);
  if (missing.length) warnings.push(`This file carries no ${missing.join(" or ")} text. It is shown, but a map without its licence and attribution should not be republished.`);
  const grid = isObj(m.grid) ? m.grid : {};
  if (grid.is_preregistered === false) warnings.push(`This file uses a cell size of ${grid.cell_deg}° that is not the pre-registered one${typeof grid.preregistered_cell_deg === "number" ? ` (${grid.preregistered_cell_deg}°)` : ""}: it is not the pre-registered method, so its calls are not comparable with files that use it.`);
  const day = isObj(m.day) ? m.day : {};
  if (kind === "adsb" && day.day_confounded === true) warnings.push("This day is confounded: no cell was called degraded because of the day\u2019s background (the median cell share was itself high).");
  if (kind === "ais" && typeof day.on_land_detector === "string" && day.on_land_detector.startsWith("disabled")) warnings.push("The on-land detector was off for this file (no land polygons were supplied).");
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

export const statusInfo = (kind, id) => STATUSES[kind].find((s) => s.id === id) || { id, label: id, tone: "none", text: "A status this page does not describe." };

export function statusCounts(map) {
  const c = {};
  for (const s of STATUSES[map.kind]) c[s.id] = 0;
  for (const cell of map.cells) c[cell.status] = (c[cell.status] || 0) + 1;
  return c;
}

// A count the file gives as null is withheld (fewer than the publication minimum of 5), never zero.
export const WITHHELD = "withheld (fewer than 5)";
const ratio = (x) => (typeof x === "number" ? `${Math.round(x * 1000) / 10}%` : WITHHELD);
const count = (x) => (typeof x === "number" ? x : x === null ? WITHHELD : "");

// Rows [label, value] describing one cell, with what each number means. A null AIS count is a count of
// one or two, withheld so it cannot single out a vessel.
export function cellRows(map, cell) {
  const p = cell.props, rows = [];
  rows.push(["Status", statusInfo(map.kind, cell.status).label]);
  if (map.kind === "adsb") {
    rows.push(["Aircraft observed", count(p.aircraft_observed)], ["Aircraft sampled", count(p.aircraft_sampled)], ["Aircraft affected", count(p.aircraft_affected)], ["Affected share", ratio(p.affected_share)]);
  } else {
    rows.push(["Vessels observed", count(p.vessels_observed)]);
    const f = isObj(p.vessels_flagged) ? p.vessels_flagged : {};
    for (const [d, n] of Object.entries(f)) rows.push([`Flagged: ${d.replace(/_/g, " ")}`, n === null ? WITHHELD : n]);
    rows.push(["Detectors that qualified", Array.isArray(p.detectors) && p.detectors.length ? p.detectors.join(", ").replace(/_/g, " ") : "none"]);
  }
  const b = cellBounds(cell);
  rows.push(["Cell", `i ${p.cell_i}, j ${p.cell_j}`], ["Area", `${fmtLat(b.south)} to ${fmtLat(b.north)}, ${fmtLon(b.west)} to ${fmtLon(b.east)}`]);
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
  if (v === null) return "none";
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
  return `${KIND_LABEL[map.kind]} map for ${map.date}: ${map.cells.length} cells drawn, ${parts.join(", ")}. Cells not drawn were not observed.`;
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
  try { o = JSON.parse(String(text).replace(/^\uFEFF/, "")); } catch (e) { return { error: `${name}: not JSON (${e.message}).` }; }
  const r = isObj(o) && isObj(o.kshana_route_exposure) ? o.kshana_route_exposure : null;
  if (!r) return { error: `${name}: not a Kshana route-exposure report (no kshana_route_exposure member).` };
  if (r.schema !== ROUTE_SCHEMA) return { error: `${name}: schema ${JSON.stringify(r.schema)} is not ${ROUTE_SCHEMA}, which this page reads.` };
  if (!Array.isArray(r.rows)) return { error: `${name}: no rows[] in this report.` };
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
