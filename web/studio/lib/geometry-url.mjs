// SPDX-License-Identifier: AGPL-3.0-only
// The Geometry view's state, and its shareable address (design note 2026-10-12, section 3.4). Every setting
// lives in the query string, so a link opens the same sky:
//
//   ?site=59.91,10.75,5&t=3600&sys=G,E,C,L:xona-pulsar&mask=5&uere=1.5&sky=p:fjord&mc=2000&seed=36
//
//   site  latitude, longitude (degrees), height (metres)
//   t     time offset from the constellations' reference epoch, whole seconds
//   sys   G (GPS), E (Galileo), C (BeiDou), L:<LEO preset>; or "tle" when the sender pasted elements
//   mask  scalar elevation mask, degrees          uere  sigma_UERE, metres
//   sky   p:<preset> | t:<base64url, 360 bytes, one per 1-degree bin, elevation in 0.5-degree steps>
//         | c:<street az>,<width m>,<left height m>,<right height m>,<antenna m> (the canyon form)
//   mc    Monte Carlo samples (0 = off)           seed  the Monte Carlo seed
//
// Reading is an allow-list (the same convention as lib/urlstate.mjs parseState / buildSearch): only these
// keys are read, each value must match its exact form and range, and anything else is dropped with a notice,
// never interpreted. Nothing from the address is put into markup. Pasted TLE text is never in the address.
// Tested in geometry-url.test.mjs.
import { decodeTable, encodeTable, BINS } from "./skyline-edit.mjs";

// System codes the address may carry, and the view's names for them.
export const SYSTEM_CODES = Object.freeze({ G: "gps", E: "galileo", C: "beidou" });
// LEO constellation presets of the engine's leo_fusion pack that the address may name (the engine checks again).
// atomic-zero-clock is left out: it is an ephemeris-and-clock model, not a constellation.
export const LEO_PRESETS = Object.freeze(["xona-pulsar", "iridium-stl", "starlink-sop", "centispace", "generic-c-band"]);
export const SKYLINE_PRESETS = Object.freeze(["city-street", "harbour-approach", "fjord", "container-terminal"]);
// The engine's bundled scenarios that run under each preset (0.36), opened in the Studio's scenario picker.
export const SKYLINE_SCENARIOS = Object.freeze({
  "city-street": Object.freeze(["orbit-urban-canyon-skyline.toml", "leo-vertical-autonomous-vehicle-skyline.toml"]),
  "harbour-approach": Object.freeze(["integrity-harbour-approach.toml", "jamming-harbour-approach-skyline.toml"]),
  "fjord": Object.freeze(["leo-pvt-fjord-skyline.toml"]),
  "container-terminal": Object.freeze(["gnss-sim-container-terminal-skyline.toml"]),
});

export const MAX_QUERY = 1024;
export const MAX_T = 7 * 86400;

export const DEFAULTS = Object.freeze({
  lat: 59.91, lon: 10.75, h: 5,
  t: 0,
  sys: Object.freeze(["gps", "galileo", "beidou"]),
  leo: null,          // a LEO preset name when the LEO layer is on
  tle: false,         // the sender used their own elements (not carried)
  mask: 5,
  uere: 1.5,
  sky: Object.freeze({ kind: "none" }),
  mc: 1000,
  seed: 36,
});

const RANGES = {
  lat: { min: -89.9, max: 89.9, dp: 4 },
  lon: { min: -180, max: 180, dp: 4 },
  h: { min: -500, max: 9000, dp: 1 },
  t: { min: 0, max: MAX_T, dp: 0 },
  mask: { min: 0, max: 45, dp: 1 },
  uere: { min: 0.1, max: 50, dp: 2 },
  seed: { min: 0, max: 2147483647, dp: 0 },
  street: { min: 0, max: 359.9, dp: 1 },
  width: { min: 1, max: 200, dp: 1 },
  height: { min: 0, max: 500, dp: 1 },
  antenna: { min: 0, max: 50, dp: 1 },
};
export const MC_CHOICES = Object.freeze([0, 100, 500, 1000, 2000, 5000]);
const KEYS = ["site", "t", "sys", "mask", "uere", "sky", "mc", "seed"];
// Kept as they are (the Studio's theme switch), so a link with ?theme=dark still works.
const EXTRA = ["theme"];

// A plain decimal with at most `dp` decimals: no exponent, hex, spaces, "Infinity" or a leading "+".
export function readNum(raw, { min, max, dp }) {
  if (typeof raw !== "string" || raw.length > 16) return null;
  const re = dp > 0 ? new RegExp(`^-?\\d{1,10}(\\.\\d{1,${dp}})?$`) : /^\d{1,10}$/;
  if (!re.test(raw)) return null;
  const v = Number(raw);
  return Number.isFinite(v) && v >= min && v <= max ? (Object.is(v, -0) ? 0 : v) : null;
}
const fmt = (v, dp) => String(Number(v.toFixed(dp)));

function readSky(v) {
  if (v === "none") return { kind: "none" };
  const m = /^([ptc]):(.*)$/.exec(v);
  if (!m) return null;
  if (m[1] === "p") return SKYLINE_PRESETS.includes(m[2]) ? { kind: "preset", name: m[2] } : null;
  if (m[1] === "t") { const table = decodeTable(m[2]); return table ? { kind: "table", table } : null; }
  const parts = m[2].split(",");
  if (parts.length !== 5) return null;
  const [streetAz, widthM, leftM, rightM, antennaM] = [readNum(parts[0], RANGES.street), readNum(parts[1], RANGES.width), readNum(parts[2], RANGES.height), readNum(parts[3], RANGES.height), readNum(parts[4], RANGES.antenna)];
  if ([streetAz, widthM, leftM, rightM, antennaM].some((x) => x === null)) return null;
  return { kind: "canyon", streetAz, widthM, leftM, rightM, antennaM };
}

function readSys(v) {
  if (v === "tle") return { sys: [...DEFAULTS.sys], leo: null, tle: true };
  if (v === "") return null; // an empty list is not a sky: the defaults, with a notice
  const parts = v.split(",");
  if (parts.length > 4) return null;
  const sys = [], seen = new Set();
  let leo = null;
  for (const p of parts) {
    if (seen.has(p)) return null;
    seen.add(p);
    if (Object.hasOwn(SYSTEM_CODES, p)) { sys.push(SYSTEM_CODES[p]); continue; }
    const m = /^L:([a-z0-9-]{1,32})$/.exec(p);
    if (m && LEO_PRESETS.includes(m[1]) && leo === null) { leo = m[1]; continue; }
    return null;
  }
  return { sys: ["gps", "galileo", "beidou"].filter((s) => sys.includes(s)), leo, tle: false };
}

// Read the view's state from a query string. Returns { state, notes, extra }: notes say, in plain words,
// what was refused and that the default stands instead.
export function parseState(search) {
  const notes = [];
  const state = { ...DEFAULTS, sys: [...DEFAULTS.sys], sky: { ...DEFAULTS.sky } };
  const extra = {};
  let text = typeof search === "string" ? search : "";
  if (text.startsWith("?")) text = text.slice(1);
  if (text.length > MAX_QUERY) return { state, notes: [`The address is longer than ${MAX_QUERY} characters, so none of its settings were read.`], extra };
  let params;
  try { params = new URLSearchParams(text); } catch { return { state, notes: ["The address could not be read."], extra }; }
  const seen = new Set();
  for (const [k, v] of params) {
    if (EXTRA.includes(k)) { if (!Object.hasOwn(extra, k) && /^(dark|light)$/.test(v)) extra[k] = v; continue; }
    if (!KEYS.includes(k)) continue;
    if (seen.has(k)) { notes.push(`"${k}" appears more than once; the first value is used.`); continue; }
    seen.add(k);
    if (k === "site") {
      const p = v.split(",");
      const [lat, lon, h] = [readNum(p[0], RANGES.lat), readNum(p[1], RANGES.lon), p.length === 3 ? readNum(p[2], RANGES.h) : 0];
      if (p.length < 2 || p.length > 3 || lat === null || lon === null || h === null) notes.push("The site is not latitude,longitude[,height] in range; the default site is used.");
      else Object.assign(state, { lat, lon, h });
    } else if (k === "sys") {
      const r = readSys(v);
      if (!r) notes.push("The constellation list is not G, E, C and at most one L:<LEO preset> this view knows; the default mix is used.");
      else {
        Object.assign(state, r);
        if (r.tle) notes.push("The sender used their own orbital elements (TLE), which a link does not carry; the presets are shown instead.");
      }
    } else if (k === "sky") {
      const s = readSky(v);
      if (!s) notes.push("The skyline is not a preset, a 360-bin table or a canyon in range; an open horizon is used.");
      else state.sky = s;
    } else if (k === "mc") {
      const n = readNum(v, { min: 0, max: 5000, dp: 0 });
      if (n === null || !MC_CHOICES.includes(n)) notes.push(`The Monte Carlo sample count is not one of ${MC_CHOICES.join(", ")}; ${DEFAULTS.mc} is used.`);
      else state.mc = n;
    } else {
      const x = readNum(v, RANGES[k]);
      if (x === null) notes.push(`"${k}" is not a number from ${RANGES[k].min} to ${RANGES[k].max}; the default is used.`);
      else state[k] = x;
    }
  }
  return { state, notes, extra };
}

// The query string for a state: only what differs from the defaults, in a fixed key order.
export function buildSearch(state, extra = {}) {
  const s = { ...DEFAULTS, ...state };
  const q = [];
  if (s.lat !== DEFAULTS.lat || s.lon !== DEFAULTS.lon || s.h !== DEFAULTS.h) q.push(`site=${fmt(s.lat, 4)},${fmt(s.lon, 4)},${fmt(s.h, 1)}`);
  if (s.t !== DEFAULTS.t) q.push(`t=${fmt(s.t, 0)}`);
  const codes = s.tle ? ["tle"] : [...Object.entries(SYSTEM_CODES).filter(([, n]) => s.sys.includes(n)).map(([c]) => c), ...(s.leo && LEO_PRESETS.includes(s.leo) ? [`L:${s.leo}`] : [])];
  if (codes.length && codes.join(",") !== "G,E,C") q.push(`sys=${codes.join(",")}`); // never an empty sys=
  if (s.mask !== DEFAULTS.mask) q.push(`mask=${fmt(s.mask, 1)}`);
  if (s.uere !== DEFAULTS.uere) q.push(`uere=${fmt(s.uere, 2)}`);
  const sky = s.sky || DEFAULTS.sky;
  if (sky.kind === "preset" && SKYLINE_PRESETS.includes(sky.name)) q.push(`sky=p:${sky.name}`);
  else if (sky.kind === "table" && sky.table && sky.table.length === BINS) q.push(`sky=t:${encodeTable(sky.table)}`);
  else if (sky.kind === "canyon") q.push(`sky=c:${[sky.streetAz, sky.widthM, sky.leftM, sky.rightM, sky.antennaM].map((x) => fmt(x, 1)).join(",")}`);
  if (s.mc !== DEFAULTS.mc) q.push(`mc=${fmt(s.mc, 0)}`);
  if (s.seed !== DEFAULTS.seed) q.push(`seed=${fmt(s.seed, 0)}`);
  for (const k of EXTRA) if (extra[k] && /^(dark|light)$/.test(extra[k])) q.push(`${k}=${extra[k]}`);
  return q.length ? "?" + q.join("&") : "";
}

// A state built in the page (from form controls) checked by the same rules as the address: written out and
// read back. Returns { state, refused }, `refused` naming the settings that did not survive.
export function normaliseState(state) {
  const { state: back } = parseState(buildSearch(state));
  const dp = { lat: 4, lon: 4, h: 1, t: 0, mask: 1, uere: 2, seed: 0, mc: 0 };
  const refused = Object.keys(dp).filter((k) => Number.isFinite(state[k]) && Number(fmt(state[k], dp[k])) !== back[k]);
  return { state: { ...back, tle: !!state.tle }, refused };
}
