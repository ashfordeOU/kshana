// SPDX-License-Identifier: AGPL-3.0-only
// What an NMEA log says about the sky and the vessel's own sensors, second by second: the satellites in its GSV
// sentences (constellation, PRN, elevation, azimuth, signal strength), the gyro heading (HDT), and the course
// and speed over ground (RMC). Nothing is computed: every value is a field of a sentence of the log, in the
// log's own units, and an epoch starts at each GGA (the stream the engine writes puts a second's GGA first).
// A satellite the receiver lists without a signal strength is kept with snr null: listed, not heard.
// Pure; tested in gsv.test.mjs.

const TALKER = Object.freeze({ GP: "gps", GL: "glonass", GA: "galileo", GB: "beidou", BD: "beidou", GQ: "qzss", GI: "navic", GN: "gnss" });
export const SYS_LABEL = Object.freeze({ gps: "GPS", glonass: "GLONASS", galileo: "Galileo", beidou: "BeiDou", qzss: "QZSS", navic: "NavIC", gnss: "GNSS" });

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const numOrNull = (s) => { if (s === "" || s == null) return null; const v = Number(s); return Number.isFinite(v) ? v : null; };

function checksumOk(line) {
  const i = line.indexOf("*");
  if (i < 0) return true;
  let c = 0;
  for (let k = 1; k < i; k++) c ^= line.charCodeAt(k);
  return c === parseInt(line.slice(i + 1, i + 3), 16);
}

// Time of day, seconds, from "hhmmss.ss"; null when it is not one.
function tod(s) {
  if (typeof s !== "string" || s.length < 6) return null;
  const h = Number(s.slice(0, 2)), m = Number(s.slice(2, 4)), x = Number(s.slice(4));
  return [h, m, x].every(isNum) ? h * 3600 + m * 60 + x : null;
}

// One log -> { n, t[], hdt[], cog[], sog[], sky[], skipped }: per GGA epoch, t seconds after the first GGA (day
// rollover handled), the HDT heading (deg, true), the RMC course and speed (deg, kn), and the satellites
// [[sys, prn, el, az, snr|null], ...] of that second's GSV. `stepS` keeps one epoch in every stepS seconds
// (the first, then each epoch whose t is a multiple of it) to keep the file small; 0 or 1 keeps all.
export function parseAux(text, { stepS = 1 } = {}) {
  const out = { t: [], hdt: [], cog: [], sog: [], sky: [], skipped: 0 };
  let t0 = null, prev = null, wrap = 0, cur = null;
  const flush = () => {
    if (!cur) return;
    const keep = !out.t.length || stepS <= 1 || Math.round(cur.t) % stepS === 0;
    if (keep) { out.t.push(cur.t); out.hdt.push(cur.hdt); out.cog.push(cur.cog); out.sog.push(cur.sog); out.sky.push([...cur.sats.values()]); }
    cur = null;
  };
  for (const raw of String(text).split("\n")) {
    const line = raw.trim();
    if (line.length < 8 || line[0] !== "$") continue;
    const type = line.slice(3, 6);
    if (type !== "GGA" && type !== "RMC" && type !== "HDT" && type !== "GSV") continue;
    if (!checksumOk(line)) { out.skipped++; continue; }
    const f = line.split("*")[0].split(",");
    if (type === "GGA") {
      flush();
      const s = tod(f[1]);
      if (s == null) { out.skipped++; continue; }
      let v = s + wrap;
      if (prev != null && v < prev - 43200) { wrap += 86400; v += 86400; }
      prev = v;
      if (t0 == null) t0 = v;
      cur = { t: v - t0, hdt: null, cog: null, sog: null, sats: new Map() };
    } else if (!cur) continue;
    else if (type === "HDT") cur.hdt = numOrNull(f[1]);
    else if (type === "RMC") { cur.sog = numOrNull(f[7]); cur.cog = numOrNull(f[8]); }
    else if (type === "GSV") {
      const sys = Object.hasOwn(TALKER, line.slice(1, 3)) ? TALKER[line.slice(1, 3)] : "gnss";
      for (let i = 4; i + 2 < f.length; i += 4) {
        const prn = numOrNull(f[i]), el = numOrNull(f[i + 1]), az = numOrNull(f[i + 2]), snr = numOrNull(f[i + 3]);
        if (prn == null || el == null || az == null) continue;
        const key = `${sys}${prn}`, was = cur.sats.get(key);
        if (!was || (snr != null && (was[4] == null || snr > was[4]))) cur.sats.set(key, [sys, prn, el, az, snr]);
      }
    }
  }
  flush();
  out.n = out.t.length;
  return out;
}

// The index of the last epoch at or before t (the first if t is earlier); -1 when there are none. The sky is
// held between epochs, never interpolated.
export function epochAt(t, time) {
  if (!time.length) return -1;
  let lo = 0, hi = time.length - 1;
  while (lo < hi) { const mid = (lo + hi + 1) >> 1; if (time[mid] <= t) lo = mid; else hi = mid - 1; }
  return lo;
}

// Azimuth sectors the receiver lists satellites in but hears none of: [{from, to}] in degrees (to > from, north
// = 0, clockwise), for the bins of `binDeg` (default 30) that hold at least one listed satellite and no signal.
// This is what the log says about the sky, not a skyline: a blocked sky and a jammed signal look the same here.
export function unheardSectors(sats, binDeg = 30) {
  const n = Math.round(360 / binDeg), listed = new Array(n).fill(0), heard = new Array(n).fill(0);
  for (const s of sats) {
    const b = Math.min(n - 1, Math.floor((((s[3] % 360) + 360) % 360) / binDeg));
    listed[b]++;
    if (s[4] != null) heard[b]++;
  }
  const out = [];
  for (let b = 0; b < n; b++) if (listed[b] && !heard[b]) out.push({ from: b * binDeg, to: (b + 1) * binDeg });
  // join neighbours
  const merged = [];
  for (const s of out) { const last = merged[merged.length - 1]; if (last && last.to === s.from) last.to = s.to; else merged.push({ ...s }); }
  return merged;
}

// Counts for the readout: listed, heard (with a signal strength), and the mean strength of those heard.
export function skyCounts(sats) {
  const heard = sats.filter((s) => s[4] != null);
  return { listed: sats.length, heard: heard.length, meanSnr: heard.length ? heard.reduce((a, s) => a + s[4], 0) / heard.length : null };
}
