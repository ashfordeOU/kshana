// SPDX-License-Identifier: AGPL-3.0-only
// Find anything: which bundled scenarios have a field a reader names in plain words
// ("elevation mask", "PDOP", "jammer power", "noise figure"), and what each field is called.
// Pure: it reads scenario text only (the same TOML the Studio loads), no DOM.
import { numericFields } from "./params.mjs";
import { knobsForToml } from "./guided.mjs";
import * as K from "./kinds.mjs";

// Plain-word names for common key fragments, so a reader's words find the engine's keys.
const SYNONYMS = [
  [/(^|_)(elev_)?mask(_deg)?$|elevation_mask|elev_mask/, "elevation mask"],
  [/pdop/, "PDOP position dilution of precision"],
  [/gdop/, "GDOP geometric dilution of precision"],
  [/hdop/, "HDOP horizontal dilution of precision"],
  [/cn0/, "C/N0 carrier-to-noise density signal level"],
  [/eirp/, "EIRP transmit power jammer power"],
  [/jammer|jam_/, "jammer interference"],
  [/power_dbw|power_dbm|power_db\b/, "power"],
  [/noise_figure/, "noise figure receiver noise"],
  [/altitude/, "altitude height orbit"],
  [/inclination/, "inclination tilt orbit plane"],
  [/tec/, "ionosphere electron content"],
  [/sigma|std/, "error standard deviation noise"],
  [/threshold/, "threshold limit"],
  [/bandwidth/, "bandwidth"],
  [/duration|_s$/, "time"],
  [/seed/, "random seed"],
  [/range_m|range_km/, "range distance"],
  [/lat_/, "latitude"],
  [/lon_/, "longitude"],
];

const kindOf = (toml) => ((String(toml).match(/^\s*kind\s*=\s*"([^"]+)"/m) || [])[1]) || "";

// A readable name for a field key: "mask_deg" -> "Mask (°)", "jammer_power_dbw" -> "Jammer power (dBW)".
const UNIT = { deg: "°", dbw: "dBW", dbm: "dBm", db: "dB", dbhz: "dB-Hz", hz: "Hz", mhz: "MHz", khz: "kHz", s: "s", m: "m", km: "km", ns: "ns", ps: "ps", pct: "%", k: "K", w: "W", tecu: "TECU", min: "min", h: "h", d: "d", au: "AU" };
export function fieldName(key) {
  const parts = String(key).split("_");
  let unit = "";
  if (parts.length > 1 && UNIT[parts[parts.length - 1].toLowerCase()]) unit = UNIT[parts.pop().toLowerCase()];
  const words = parts.join(" ").replace(/\bcn0\b/i, "C/N0").replace(/\b(pdop|gdop|hdop|vdop|eirp|tec|iq|utc|gnss|leo|imu)\b/gi, (m) => m.toUpperCase());
  const name = words.charAt(0).toUpperCase() + words.slice(1);
  return unit ? `${name} (${unit})` : name;
}

// One row per numeric field of every scenario: { file, id, section, key, label, guided, words }.
// `bundle` maps a scenario file name to its TOML text (scenarios/index.json).
export function fieldIndex(bundle) {
  const out = [];
  for (const [file, toml] of Object.entries(bundle || {})) {
    if (typeof toml !== "string") continue;
    const fields = numericFields(toml);
    const kind = kindOf(toml);
    const labels = new Map();
    for (const g of K.hasCapability(kind) ? K.guidedFor(kind, fields) : []) labels.set(g.id, g.label);
    if (!K.hasCapability(kind)) for (const k of knobsForToml(toml)) labels.set(`${k.section || ""}::${k.key}`, k.label);
    for (const f of fields) {
      const syn = SYNONYMS.filter(([re]) => re.test(f.key)).map(([, w]) => w).join(" ");
      const label = labels.get(f.id) || fieldName(f.key);
      out.push({ file, id: f.id, section: f.section, key: f.key, label, guided: labels.has(f.id), words: `${label} ${f.key} ${f.key.replace(/_/g, " ")} ${f.section.replace(/[._[\]]+/g, " ")} ${f.comment || ""} ${syn}`.toLowerCase() });
    }
  }
  return out;
}

// Fields matching every word of `query`, best first (a guided control, then a match in the
// label), one row per scenario and field. [] for a query under two characters.
export function findFields(index, query, max = 40) {
  const words = String(query || "").toLowerCase().split(/\s+/).filter(Boolean);
  if (!words.length || words.join("").length < 2) return [];
  const hits = [];
  for (const row of index) {
    if (!words.every((w) => row.words.includes(w))) continue;
    const inLabel = words.every((w) => row.label.toLowerCase().includes(w));
    hits.push({ row, score: (row.guided ? 2 : 0) + (inLabel ? 3 : 0) + (words.some((w) => row.key.includes(w)) ? 1 : 0) });
  }
  hits.sort((a, b) => b.score - a.score || a.row.file.localeCompare(b.row.file) || a.row.id.localeCompare(b.row.id));
  return hits.slice(0, max).map((x) => x.row);
}

// How many distinct scenarios the hits cover.
export const scenarioCount = (hits) => new Set(hits.map((h) => h.file)).size;

// Filter a list of controls by a query over their label and key: the ids that match.
export function filterControls(controls, query) {
  const words = String(query || "").toLowerCase().split(/\s+/).filter(Boolean);
  if (!words.length) return controls.map((c) => c.id);
  return controls.filter((c) => { const s = `${c.label} ${c.key || ""} ${String(c.key || "").replace(/_/g, " ")} ${SYNONYMS.filter(([re]) => re.test(c.key || "")).map(([, w]) => w).join(" ")}`.toLowerCase(); return words.every((w) => s.includes(w)); }).map((c) => c.id);
}
