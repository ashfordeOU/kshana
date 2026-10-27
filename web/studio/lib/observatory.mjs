// SPDX-License-Identifier: AGPL-3.0-only
// Observatory viewer: readers and drawing for the files `kshana interference-map daily` writes (docs/observatory/METHOD.md,
// W57's viewer spec). The page computes nothing: it reads the day's GeoJSON (kshana-observatory-day/1), the incident file
// (kshana-incident-report/1) and the manifest (kshana-observatory-manifest/1) and shows what they say. Three states only
// (degraded, not_degraded, not_observed), no cause, no actor. A count the file withholds (null) is "withheld", never 0.
// Pure; makes no request. The caller passes the files' text or bytes, and a digest function for the manifest check.

import { t } from "./t.mjs";

export const DAY_SCHEMA = "kshana-observatory-day/1";
export const INCIDENT_SCHEMA = "kshana-incident-report/1";
export const MANIFEST_SCHEMA = "kshana-observatory-manifest/1";
export const STATES = Object.freeze(["degraded", "not_degraded", "not_observed"]);
export const STATE_TEXT = Object.freeze({
  get degraded() { return t("js-obs-state-degraded", "Degraded"); },
  get not_degraded() { return t("js-obs-state-not-degraded", "Not degraded"); },
  get not_observed() { return t("js-obs-state-not-observed", "Not observed"); },
});
export const STATE_MEANS = Object.freeze({
  get degraded() { return t("js-obs-means-degraded", "A high share of the aircraft sampled in the cell reported low navigation accuracy that day, clearly above that day's background."); },
  get not_degraded() { return t("js-obs-means-not-degraded", "Enough aircraft were sampled and the share did not meet the rule."); },
  get not_observed() { return t("js-obs-means-not-observed", "The data did not allow a call. This is not \"clear\"."); },
});
// NOT_CLEAR is the English wording kept for callers that read the constant; the page shows notClear(), which follows the language.
export const NOT_CLEAR = "Not observed is not clear.";
// The cause every incident carries is the data value "not attributed" (compared as-is); a person reads causeText(), which follows the language.
export const causeText = () => t("js-replay-obs-not-attributed", "not attributed");
export const notClear = () => t("js-obs-not-clear", "Not observed is not clear.");
export const REASON_TEXT = Object.freeze({
  get insufficient_sample() { return t("js-obs-reason-insufficient", "too few aircraft were sampled to make a call"); },
  get no_day_background() { return t("js-obs-reason-no-background", "there was no background for the day to compare the cell with"); },
  get day_wide_effect() { return t("js-obs-reason-day-wide", "the day's background was itself high, so no cell could be called that day"); },
});
export const MAX_BYTES = 32 * 1024 * 1024;

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const isObj = (x) => x && typeof x === "object" && !Array.isArray(x);
const str = (x, n = 600) => (typeof x === "string" ? x.slice(0, n) : "");
const count = (x) => (isNum(x) && x >= 0 ? Math.round(x) : null);
export const withheld = (x) => (x === null || x === undefined ? t("js-obs-withheld", "withheld") : String(x));
// Only an https address becomes a link; anything else is shown as text.
export const safeHttps = (u) => { try { const p = new URL(String(u)); return p.protocol === "https:" ? p.href : null; } catch { return null; } };

function parse(text, what) {
  if (typeof text !== "string" || text.length > MAX_BYTES) return { error: t("js-obs-err-not-text", "{ $what } is not text or is larger than { $mib } MiB", { what, mib: MAX_BYTES / 1048576 }) };
  try { const j = JSON.parse(text); return isObj(j) ? { j } : { error: t("js-obs-err-not-object", "{ $what } is not a JSON object", { what }) }; } catch (e) { return { error: t("js-obs-err-not-json", "{ $what } is not JSON ({ $reason })", { what, reason: e.message }) }; }
}
const dateOk = (d) => typeof d === "string" && /^\d{4}-\d{2}-\d{2}$/.test(d);

function bounds(ring) {
  const xs = ring.map((p) => p[0]), ys = ring.map((p) => p[1]);
  return { west: Math.min(...xs), east: Math.max(...xs), south: Math.min(...ys), north: Math.max(...ys) };
}
const bbox = (b) => (isObj(b) && ["south", "west", "north", "east"].every((k) => isNum(b[k])) ? { south: b.south, west: b.west, north: b.north, east: b.east } : null);

// The day's GeoJSON -> { day } or { error }. A state the file names that is not one of the three is refused, not shown.
export function readDay(text, name = t("js-obs-the-day-file", "the day file")) {
  const { j, error } = parse(text, name);
  if (error) return { error };
  const k = j.kshana_observatory;
  if (j.type !== "FeatureCollection" || !isObj(k) || k.schema !== DAY_SCHEMA) return { error: t("js-obs-err-not-day", "{ $name } is not a { $schema } file", { name, schema: DAY_SCHEMA }) };
  if (!dateOk(k.date)) return { error: t("js-obs-err-no-date", "{ $name } states no date", { name }) };
  if (!Array.isArray(j.features)) return { error: t("js-obs-err-no-features", "{ $name } has no features", { name }) };
  if (Array.isArray(k.states) && (k.states.length !== 3 || !k.states.every((s) => STATES.includes(s)))) return { error: t("js-obs-err-states", "{ $name } names states other than the three this page shows", { name }) };
  const cells = [];
  for (const [i, f] of j.features.entries()) {
    const p = isObj(f) && isObj(f.properties) ? f.properties : null;
    if (!p || !STATES.includes(p.state)) return { error: t("js-obs-err-feature-state", "{ $name }: feature { $n } has the state \"{ $state }\", which is not one of { $states }", { name, n: i + 1, state: str(p && p.state, 40), states: STATES.join(", ") }) };
    const ring = f.geometry && f.geometry.type === "Polygon" && Array.isArray(f.geometry.coordinates) && Array.isArray(f.geometry.coordinates[0]) ? f.geometry.coordinates[0] : null;
    if (!ring || ring.length < 4 || !ring.every((q) => Array.isArray(q) && isNum(q[0]) && isNum(q[1]))) return { error: t("js-obs-err-feature-polygon", "{ $name }: feature { $n } is not a cell polygon", { name, n: i + 1 }) };
    cells.push({ i: p.cell_i, j: p.cell_j, state: p.state, reason: p.state === "not_observed" ? str(p.reason, 60) || null : null, observed: count(p.aircraft_observed), sampled: count(p.aircraft_sampled), affected: count(p.aircraft_affected), share: isNum(p.affected_share) ? p.affected_share : null, ...bounds(ring) });
  }
  const s = isObj(k.summary) ? k.summary : {};
  const sum = { cells: count(s.cells_published), degraded: count(s.degraded), notDegraded: count(s.not_degraded), notObserved: count(s.not_observed_published), dayWide: s.day_wide_effect === true };
  const from = { degraded: 0, not_degraded: 0, not_observed: 0 };
  for (const c of cells) from[c.state]++;
  const consistent = sum.degraded === from.degraded && sum.notDegraded === from.not_degraded && sum.notObserved === from.not_observed;
  const d = isObj(k.data) ? k.data : {};
  const rel = isObj(k.release) ? k.release : {};
  const m = isObj(k.method) ? k.method : {};
  return {
    day: {
      date: k.date, cells, summary: sum, summaryMatchesCells: consistent, cellDeg: isNum(k.grid && k.grid.cell_deg) ? k.grid.cell_deg : null, region: bbox(k.region),
      release: { minDelayHours: isNum(rel.min_delay_hours) ? rel.min_delay_hours : null, notBeforeUtc: str(rel.not_before_utc, 40) || null },
      dataset: { name: str(d.name, 200), licence: str(d.licence, 80), licenceUrl: str(d.licence_url, 300), attribution: str(d.attribution, 400), coverage: str(d.coverage_notes, 800) },
      notice: str(k.notice, 800), product: str(k.product, 80), kshanaVersion: str(k.kshana_version, 30), methodScope: str(m.scope, 300), sourceKind: str(k.source_kind, 60),
    },
  };
}

// The incident file -> { incidents } or { error }. `cause` must be exactly "not attributed", or the file is refused: this page names no cause.
export function readIncidents(text, name = t("js-obs-the-incident-file", "the incident file")) {
  const { j, error } = parse(text, name);
  if (error) return { error };
  if (j.schema !== INCIDENT_SCHEMA) return { error: t("js-obs-err-not-incident", "{ $name } is not a { $schema } file", { name, schema: INCIDENT_SCHEMA }) };
  if (j.cause !== "not attributed") return { error: t("js-obs-err-cause", "{ $name } states a cause other than \"not attributed\"; this page shows none", { name }) };
  if (!Array.isArray(j.incidents)) return { error: t("js-obs-err-no-incidents", "{ $name } has no incident list", { name }) };
  const list = [];
  for (const [i, x] of j.incidents.entries()) {
    if (!isObj(x)) return { error: t("js-obs-err-incident-object", "{ $name }: incident { $n } is not an object", { name, n: i + 1 }) };
    list.push({ id: str(x.id, 60), cellCount: count(x.cell_count), bbox: bbox(x.bbox), cells: (Array.isArray(x.cells) ? x.cells : []).filter(isObj).map((c) => ({ i: c.cell_i, j: c.cell_j, sampled: count(c.aircraft_sampled), affected: count(c.aircraft_affected), share: isNum(c.affected_share) ? c.affected_share : null })) });
  }
  return { incidents: { date: dateOk(j.date) ? j.date : null, list, dayWide: j.day_wide_effect === true, cause: "not attributed", reportingCycle: str(j.reporting_cycle, 500) } };
}

// The manifest -> { manifest } or { error }.
export function readManifest(text, name = t("js-obs-the-manifest", "the manifest")) {
  const { j, error } = parse(text, name);
  if (error) return { error };
  if (j.schema !== MANIFEST_SCHEMA) return { error: t("js-obs-err-not-manifest", "{ $name } is not a { $schema } file", { name, schema: MANIFEST_SCHEMA }) };
  const files = (Array.isArray(j.files) ? j.files : []).filter(isObj).map((f) => ({ name: str(f.name, 200), bytes: count(f.bytes), sha256: /^[0-9a-f]{64}$/.test(f.sha256) ? f.sha256 : "" }));
  const st = isObj(j.input_stats) ? j.input_stats : {};
  const stats = Object.entries(st).filter(([, v]) => isNum(v)).map(([k, v]) => [k.replace(/_/g, " "), v]);
  return { manifest: { date: dateOk(j.date) ? j.date : null, methodId: str(j.method_id, 100), files, stats, kshanaVersion: str(j.kshana_version, 30) } };
}

// Which of the manifest's files are loaded, and does each one's SHA-256 match? loaded: Map(name -> Uint8Array). digest: (bytes) -> hex string (async ok).
export async function verifyFiles(manifest, loaded, digest) {
  const out = [];
  for (const f of manifest.files) {
    const b = loaded.get(f.name);
    if (!b) { out.push({ ...f, status: t("js-obs-file-not-opened", "not opened") }); continue; }
    const h = await digest(b);
    out.push({ ...f, status: !f.sha256 ? t("js-obs-file-no-hash", "no hash stated") : h === f.sha256 && (f.bytes == null || f.bytes === b.length) ? t("js-obs-file-matches", "matches") : t("js-obs-file-mismatch", "does not match") });
  }
  return out;
}

export const dayAlt = (day) => {
  const s = day.summary;
  const n = (x) => (x === null || x === undefined ? t("js-obs-unstated-number", "an unstated number of") : String(x));
  return t("js-obs-day-alt", "{ $degraded } cells degraded, { $notDegraded } not degraded, { $notObserved } not observed, on { $date }.", { degraded: n(s.degraded), notDegraded: n(s.notDegraded), notObserved: n(s.notObserved), date: day.date });
};

// Words about the day that the files themselves license, and nothing more.
export function dayNotes(day, inc) {
  const n = [];
  if (day.summary.dayWide) n.push(t("js-obs-note-day-wide", "This was a day-wide-effect day: the day's background was itself high, so no cell could be called that day. That is not a statement that the sky was clean."));
  if (inc && !inc.list.length) n.push(t("js-obs-no-degraded", "No degraded cells this day."));
  else if (!inc && day.summary.degraded === 0 && !day.summary.dayWide) n.push(t("js-obs-no-degraded", "No degraded cells this day."));
  if (!day.summaryMatchesCells) n.push(t("js-obs-note-summary-mismatch", "The summary the file states does not match the cells it lists; the numbers are shown as written."));
  return n;
}

export function cellRows(day, filter = "all") {
  return day.cells.filter((c) => filter === "all" || c.state === filter).map((c) => ({
    cell: t("js-obs-cell-extent", "{ $south }° to { $north }° N, { $west }° to { $east }° E", { south: c.south, north: c.north, west: c.west, east: c.east }), state: STATE_TEXT[c.state],
    why: c.state === "not_observed" ? (REASON_TEXT[c.reason] || c.reason || t("js-obs-no-reason", "no reason stated")) : "",
    sampled: withheld(c.sampled), affected: withheld(c.affected), share: c.share == null ? t("js-obs-withheld", "withheld") : `${(c.share * 100).toFixed(1)} %`,
  }));
}

export const cellKey = (c) => `${c.i}:${c.j}`;

const esc = (x) => String(x).replace(/[&<>"]/g, (m) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" })[m]);
const f1 = (x) => (Math.round(x * 100) / 100).toString();
// The cells as an SVG string: plate carree, x scaled by cos(mid-latitude). Degraded: solid red; not degraded: solid blue; not observed: grey diagonal hatch.
// `selected` is a Set of cellKey(); `focus` one key. Every cell has a <title> with its state and published counts.
export function mapSvg(day, { selected = new Set(), focus = null, w = 760 } = {}) {
  const cs = day.cells;
  if (!cs.length) { const none = esc(t("js-obs-no-cells", "No cells in this file")); return `<svg class="ko-map" viewBox="0 0 ${w} 120" role="img" aria-label="${none}"><text x="${w / 2}" y="60" text-anchor="middle" class="ko-t">${none}</text></svg>`; }
  const r = day.region || { south: Math.min(...cs.map((c) => c.south)), north: Math.max(...cs.map((c) => c.north)), west: Math.min(...cs.map((c) => c.west)), east: Math.max(...cs.map((c) => c.east)) };
  const kx = Math.max(0.2, Math.cos(((r.south + r.north) / 2) * Math.PI / 180));
  const L = 38, T = 8, B = 22, spanX = Math.max(1e-6, (r.east - r.west) * kx), sc = (w - L - 24) / spanX;
  const h = Math.round((r.north - r.south) * sc + T + B);
  const X = (lon) => L + (lon - r.west) * kx * sc, Y = (lat) => T + (r.north - lat) * sc;
  let g = "";
  for (let lat = Math.ceil(r.south); lat <= r.north; lat += 2) g += `<line class="ko-gl" x1="${L}" x2="${f1(X(r.east))}" y1="${f1(Y(lat))}" y2="${f1(Y(lat))}"/><text class="ko-t" x="${L - 4}" y="${f1(Y(lat) + 3)}" text-anchor="end">${lat}°N</text>`;
  for (let lon = Math.ceil(r.west); lon <= r.east; lon += 4) g += `<line class="ko-gl" y1="${T}" y2="${f1(Y(r.south))}" x1="${f1(X(lon))}" x2="${f1(X(lon))}"/><text class="ko-t" x="${f1(X(lon))}" y="${h - 6}" text-anchor="middle">${lon}°E</text>`;
  let rects = "";
  for (const c of cs) {
    const k = cellKey(c), cv = { state: STATE_TEXT[c.state], sampled: withheld(c.sampled), affected: withheld(c.affected) };
    const tip = c.state === "not_observed"
      ? t("js-obs-cell-title-reason", "{ $state } ({ $reason }); sampled { $sampled }, affected { $affected }", { ...cv, reason: REASON_TEXT[c.reason] || c.reason || t("js-obs-no-reason", "no reason stated") })
      : t("js-obs-cell-title", "{ $state }; sampled { $sampled }, affected { $affected }", cv);
    rects += `<rect class="ko-c ko-${c.state}${selected.has(k) ? " ko-sel" : ""}${focus === k ? " ko-foc" : ""}" data-k="${k}" x="${f1(X(c.west))}" y="${f1(Y(c.north))}" width="${f1((c.east - c.west) * kx * sc)}" height="${f1((c.north - c.south) * sc)}"${c.state === "not_observed" ? ' fill="url(#ko-hatch)"' : ""}><title>${esc(tip)}</title></rect>`;
  }
  return `<svg class="ko-map" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(t("js-obs-map-aria", "{ $summary } The table below lists every cell.", { summary: dayAlt(day) }))}"><defs><pattern id="ko-hatch" width="6" height="6" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><rect width="6" height="6" class="ko-hbg"/><line x1="0" y1="0" x2="0" y2="6" class="ko-hln"/></pattern></defs>${g}${rects}</svg>`;
}

// "observatory-adsb-adsb-lol-2026-09-15.incidents.json" -> { kind, date }.
export function classifyName(name) {
  const n = String(name || "").toLowerCase();
  const date = (n.match(/(\d{4}-\d{2}-\d{2})/) || [])[1] || null;
  if (n.endsWith(".incidents.json")) return { kind: "incidents", date };
  if (n.endsWith(".manifest.json")) return { kind: "manifest", date };
  if (n.endsWith(".geojson")) return { kind: "day", date };
  if (n.endsWith(".png")) return { kind: "png", date };
  return { kind: null, date };
}
