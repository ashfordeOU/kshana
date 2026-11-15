// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: ships and aircraft on the map (0.42 U17). A track file (AIS NMEA,
// Mode S / ADS-B as AVR or Beast, OpenSky state vectors, ASTERIX, canboat, MAVLink, ULog) is
// decoded by the engine's own connectors (src/interconnect, through the app's native
// `decode_tracks`), and this module turns the decode (the `kshana.tracks/1` document: fixes with
// their trust attributes and the quality class each reader draws from them by its stated rule)
// into what the time cursor and the map draw: one track per vessel, aircraft or vehicle, with a
// name where the file gives one, and the quality class of every reported point.
//
// The tracks are *reported* positions, as broadcast; the colour is the reader's quality class
// (good, intermediate, degraded, unknown), not a verdict on whether a position is true. A file
// with no calendar times is drawn in message order, and says so. Pure, no DOM; tested in
// traffic.test.mjs.

const num = (x) => typeof x === "number" && Number.isFinite(x);
const f64 = (a) => Float64Array.from(a);

/** What a track source is: vessel (AIS, NMEA 2000), aircraft (Mode S, ADS-B, OpenSky, ASTERIX) or vehicle (MAVLink, ULog). */
export function objectKind(source) {
  const s = String(source || "").toLowerCase();
  if (/^(ais|canboat|n2k|nmea)/.test(s)) return "vessel";
  if (/^(adsb|ads-b|modes|mode-s|avr|beast|opensky|asterix)/.test(s)) return "aircraft";
  if (/^(mavlink|ulog|px4)/.test(s)) return "vehicle";
  return "object";
}
/** The quality classes, as the readers write them, best first; any other value is "unknown". */
export const QUALITY = ["good", "intermediate", "degraded", "unknown"];
const qIndex = (q) => { const i = QUALITY.indexOf(String(q || "")); return i < 0 ? 3 : i; };

/** The decode answer of `decode_tracks` (its JSON text or the object), checked: the object or null. */
export function parseDecode(answer) {
  let d = answer;
  if (typeof d === "string") { try { d = JSON.parse(d); } catch { return null; } }
  if (!d || typeof d !== "object" || !Array.isArray(d.fixes)) return null;
  return d;
}

/**
 * The tracks of a decode: { objects, epochMs, timed, format, counts, note }. objects: [{ id, kind,
 * source, name, t (s after the first fix, or the message index when the file has no times), lat,
 * lon, alt (m, NaN where absent), q (quality index 0..3 per point), quality (counts by class),
 * sog (kn, NaN where absent), extra }], sorted by id. At most `maxObjects` objects and
 * `maxPoints` points each are kept (the first ones in time); `dropped` says how many were left out.
 */
export function trafficOf(decode, { maxObjects = 500, maxPoints = 20000 } = {}) {
  const d = parseDecode(decode);
  if (!d) return null;
  const names = new Map();
  for (const r of Array.isArray(d.records) ? d.records : []) {
    if (!r || typeof r !== "object" || r.id === undefined) continue;
    const id = String(r.id);
    const nm = [r.name, r.callsign].map((x) => (typeof x === "string" ? x.replace(/@+$/g, "").trim() : "")).find(Boolean);
    if (nm && !names.has(id)) names.set(id, nm);
  }
  const fixes = d.fixes.filter((f) => f && num(f.lat_deg) && num(f.lon_deg) && Math.abs(f.lat_deg) <= 90 && Math.abs(f.lon_deg) <= 180 && f.id !== undefined);
  const timed = fixes.length > 0 && fixes.every((f) => num(f.t_unix_s));
  const t0 = timed ? Math.min(...fixes.map((f) => f.t_unix_s)) : 0;
  const by = new Map();
  fixes.forEach((f, i) => {
    const id = String(f.id);
    let o = by.get(id);
    if (!o) { o = { id, source: String(f.source || d.source_format || ""), pts: [] }; by.set(id, o); }
    const cs = f.extra && typeof f.extra.callsign === "string" ? f.extra.callsign.trim() : "";
    if (cs && !names.has(id)) names.set(id, cs);
    o.pts.push({ t: timed ? f.t_unix_s - t0 : i, lat: f.lat_deg, lon: f.lon_deg, alt: num(f.alt_m) ? f.alt_m : f.extra && num(f.extra.alt_baro_ft) ? f.extra.alt_baro_ft * 0.3048 : NaN, q: qIndex(f.reported_quality), sog: f.extra && num(f.extra.sog_kn) ? f.extra.sog_kn : NaN, extra: f.extra || {} });
  });
  const all = [...by.values()].sort((a, b) => (a.id < b.id ? -1 : a.id > b.id ? 1 : 0));
  let droppedPoints = 0;
  const objects = all.slice(0, maxObjects).map((o) => {
    const pts = o.pts.sort((a, b) => a.t - b.t);
    if (pts.length > maxPoints) droppedPoints += pts.length - maxPoints;
    const p = pts.slice(0, maxPoints);
    const quality = { good: 0, intermediate: 0, degraded: 0, unknown: 0 };
    for (const x of p) quality[QUALITY[x.q]]++;
    return { id: o.id, kind: objectKind(o.source), source: o.source, name: names.get(o.id) || "", t: f64(p.map((x) => x.t)), lat: f64(p.map((x) => x.lat)), lon: f64(p.map((x) => x.lon)), alt: f64(p.map((x) => x.alt)), q: Uint8Array.from(p.map((x) => x.q)), sog: f64(p.map((x) => x.sog)), quality, last: p[p.length - 1].extra };
  });
  return {
    objects, timed, epochMs: timed ? t0 * 1000 : NaN, format: String(d.source_format || ""),
    counts: { read: d.read || 0, fixes: fixes.length, badChecksum: d.bad_checksum || 0, malformed: d.malformed || 0, other: d.other || 0, records: Array.isArray(d.records) ? d.records.length : 0 },
    dropped: { objects: Math.max(0, all.length - maxObjects), points: droppedPoints },
  };
}

/** The label of an object on the map: its name or callsign, else its id (MMSI, ICAO address). */
export const objectLabel = (o) => (o.name ? `${o.name}` : o.id);

/** The index of the last point of an object at or before t (-1 before its first). */
export function pointAt(o, t) {
  const T = o.t;
  if (!T.length || t < T[0]) return -1;
  let lo = 0, hi = T.length - 1;
  while (lo < hi) { const m = (lo + hi + 1) >> 1; if (T[m] <= t) lo = m; else hi = m - 1; }
  return lo;
}

/**
 * Where each object is at the cursor: [{ o, i, lat, lon, q, stale }] for the objects that have
 * reported by t. `stale` is true when the last report is older than `staleS` seconds (the object
 * is drawn faded: it may have moved since).
 */
export function trafficAt(traffic, t, { staleS = 600 } = {}) {
  if (!traffic) return [];
  const out = [];
  for (const o of traffic.objects) {
    const i = pointAt(o, t);
    if (i < 0) continue;
    out.push({ o, i, lat: o.lat[i], lon: o.lon[i], q: o.q[i], stale: traffic.timed ? t - o.t[i] > staleS : false });
  }
  return out;
}

/** A course in degrees from two points (for the heading of a symbol), or NaN when they coincide. */
export function courseDeg(lat1, lon1, lat2, lon2) {
  const r = Math.PI / 180;
  const y = Math.sin((lon2 - lon1) * r) * Math.cos(lat2 * r);
  const x = Math.cos(lat1 * r) * Math.sin(lat2 * r) - Math.sin(lat1 * r) * Math.cos(lat2 * r) * Math.cos((lon2 - lon1) * r);
  if (Math.abs(x) < 1e-15 && Math.abs(y) < 1e-15) return NaN;
  return ((Math.atan2(y, x) / r) + 360) % 360;
}

/** The heading to draw an object with at point i: the reported course over ground, else the course to its next or from its previous point. */
export function headingAt(o, i) {
  const cog = o.last && i === o.t.length - 1 && num(o.last.cog_deg) ? o.last.cog_deg : NaN;
  if (num(cog)) return cog;
  if (i + 1 < o.t.length) { const c = courseDeg(o.lat[i], o.lon[i], o.lat[i + 1], o.lon[i + 1]); if (num(c)) return c; }
  if (i > 0) return courseDeg(o.lat[i - 1], o.lon[i - 1], o.lat[i], o.lon[i]);
  return NaN;
}

/**
 * A result the time cursor can show for a decode: { kind: "traffic", traffic, label, source }.
 * The shell keeps it as the run of a traffic tab; timemodel.mjs reads `traffic` from it.
 */
export function trafficResult(traffic, { name = "", format = "" } = {}) {
  return { kind: "traffic", traffic, label: "", source: { file: name, format: format || traffic.format } };
}

/** Plot series of a traffic model: altitude of each aircraft (m), speed over ground of each vessel (kn); at most `max` series. */
export function trafficSeries(traffic, max = 12) {
  const out = [];
  if (!traffic) return out;
  for (const o of traffic.objects) {
    if (out.length >= max) break;
    const key = o.kind === "aircraft" ? "alt" : o.kind === "vessel" ? "sog" : "";
    if (!key) continue;
    const ok = Array.from(o[key], (v) => num(v));
    const t = o.t.filter((_, i) => ok[i]), v = o[key].filter((_, i) => ok[i]);
    if (t.length < 2) continue;
    out.push({ id: `traffic-${o.id}`, label: `${objectLabel(o)} ${key === "alt" ? "altitude" : "speed"}`, unit: key === "alt" ? "m" : "kn", color: "", t, v });
  }
  return out;
}

/** The decode's Python and command lines for the code mirror. */
export function decodeLines({ name, format }) {
  const f = String(format || "ais");
  const q = (s) => (/^[A-Za-z0-9_./:=@+-]+$/.test(String(s)) ? String(s) : `'${String(s).replace(/'/g, "'\\''")}'`);
  return {
    py: [`# ${name}: the track readers have no Python binding yet; the command line decodes the file`, `import subprocess`, `tracks = [json.loads(l) for l in subprocess.run(["kshana", "connect", "decode", ${JSON.stringify(String(name))}, "--format", ${JSON.stringify(f)}], capture_output=True, text=True, check=True).stdout.splitlines()]`],
    cli: [`kshana connect decode ${q(name)} --format ${q(f)} --to geojson --out ${q(String(name).replace(/\.[^./]+$/, ""))}.geojson`],
  };
}
