// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: how numbers are written (0.42 U14; the design brief, "Type"). A value
// with its unit and, when known, its uncertainty next to it (14.2 ± 0.4 m), an SI prefix
// where the unit takes one, times as 14:21:07.250 UTC and durations as 3 h 12 m. The shell
// sets them in Geist Mono with tabular digits (look.css .n); this module only writes the
// text, as parts so the unit and the uncertainty can be quieter. Pure; tested in
// ../look.test.mjs.

const MINUS = "−";
const isNum = (x) => typeof x === "number" && Number.isFinite(x);

/** A number with `sig` significant digits (no trailing zeros), a true minus sign and, from 10 000 up, thousands groups. */
export function fmtNumber(x, { sig = 4, group = true } = {}) {
  if (!isNum(x)) return "–";
  if (x === 0) return "0";
  const a = Math.abs(x);
  let s;
  if (a >= 1e12 || a < 1e-6) s = a.toExponential(Math.max(0, sig - 1)).replace(/\.?0+e/, "e").replace("e+", "e");
  else if (a >= 10 ** sig) s = String(Math.round(a));
  else s = String(Number(a.toPrecision(sig)));
  if (group && !s.includes("e") && a >= 1e4) { const [i, f] = s.split("."); s = i.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (f ? `.${f}` : ""); }
  return (x < 0 ? MINUS : "") + s;
}

/** A number written to `dp` decimal places (dp ≤ 0 rounds to tens, hundreds, …), with a true minus sign. */
function fixed(x, dp) {
  if (dp > 0) { const s = Math.abs(x).toFixed(dp); return (x < 0 && Number(s) !== 0 ? MINUS : "") + s; }
  const q = 10 ** -dp;
  const v = Math.round(x / q) * q;
  return (v < 0 ? MINUS : "") + String(Math.abs(v));
}

/**
 * An uncertainty rounded the usual way (two significant digits when its first digit is 1 or 2,
 * else one) and the decimal place the value is then written to: { u, dp }.
 */
export function roundUncertainty(u) {
  if (!isNum(u) || u <= 0) return null;
  const e = Math.floor(Math.log10(u));
  const lead = Math.floor(u / 10 ** e);
  const digits = lead <= 2 ? 2 : 1;
  let dp = -(e - digits + 1);
  let r = Math.round(u * 10 ** dp) / 10 ** dp;
  if (r >= 10 ** (e + 1) && digits === 1) { dp -= 1; r = Math.round(u * 10 ** dp) / 10 ** dp; }
  return { u: r, dp };
}

// SI prefixes, and the units that take them here (with the range each is written in).
const PREFIX = [[1e9, "G"], [1e6, "M"], [1e3, "k"], [1, ""], [1e-3, "m"], [1e-6, "µ"], [1e-9, "n"], [1e-12, "p"]];
const SI = {
  Hz: [1e-3, 1e9], W: [1e-12, 1e9], V: [1e-9, 1e6], A: [1e-9, 1e3], J: [1e-9, 1e9], B: [1, 1e9], "B/s": [1, 1e9], "bit/s": [1, 1e9], "b/s": [1, 1e9],
  // seconds: only below one (ms, µs, ns); a long time is a duration. Metres: mm to km.
  s: [1e-12, 1], m: [1e-3, 1e3],
};
/** The SI prefix for a value of `unit`: { factor, unit } (factor 1 and the unit unchanged when the unit takes none here). */
export function siScale(x, unit) {
  const range = SI[unit];
  if (!range || !isNum(x) || x === 0) return { factor: 1, unit };
  const a = Math.abs(x);
  for (const [f, p] of PREFIX) {
    if (f < range[0] || f > range[1]) continue;
    if (a >= f * 0.9995) return { factor: f, unit: `${p}${unit}` };
  }
  const last = PREFIX.filter(([f]) => f >= range[0] && f <= range[1]).pop();
  return { factor: last[0], unit: `${last[1]}${unit}` };
}

/**
 * A value with its unit and uncertainty, as parts and as one text:
 *   fmtValue(14.21, "m", { u: 0.43 })  → { value: "14.2", pm: "± 0.4", unit: "m", text: "14.2 ± 0.4 m" }
 *   fmtValue(1575.42e6, "Hz")          → { value: "1.575", unit: "GHz", text: "1.575 GHz" }
 * Options: u (the uncertainty, same unit), sig (significant digits without u), si (false keeps the unit).
 */
export function fmtValue(x, unit = "", { u, sig = 4, si = true } = {}) {
  if (!isNum(x)) return { value: "–", pm: "", unit: "", text: "–" };
  const sc = si ? siScale(Math.max(Math.abs(x), isNum(u) ? Math.abs(u) : 0) * Math.sign(x || 1), unit) : { factor: 1, unit };
  const v = x / sc.factor;
  let value, pm = "";
  const ru = isNum(u) && u > 0 ? roundUncertainty(u / sc.factor) : null;
  if (ru) { value = fixed(v, ru.dp); pm = `± ${fixed(ru.u, ru.dp)}`; }
  else value = fmtNumber(v, { sig });
  const text = [value, pm, sc.unit].filter(Boolean).join(" ");
  return { value, pm, unit: sc.unit || "", text };
}

const pad = (n, w = 2) => String(n).padStart(w, "0");
/** A time of day in UTC: "14:21:07.250 UTC" (ms: false gives "14:21:07 UTC"). Accepts a Date, ms since the epoch or an ISO text. */
export function fmtUtc(t, { ms = true, date = false } = {}) {
  const d = t instanceof Date ? t : new Date(t);
  if (Number.isNaN(+d)) return "–";
  const day = date ? `${d.getUTCFullYear()}-${pad(d.getUTCMonth() + 1)}-${pad(d.getUTCDate())} ` : "";
  return `${day}${pad(d.getUTCHours())}:${pad(d.getUTCMinutes())}:${pad(d.getUTCSeconds())}${ms ? `.${pad(d.getUTCMilliseconds(), 3)}` : ""} UTC`;
}

/**
 * A duration in seconds, in the two largest units: "3 h 12 m", "2 d 4 h", "4 m 07 s", "42.1 s",
 * "250 ms", "12 µs". Negative durations take a minus sign.
 */
export function fmtDuration(sec) {
  if (!isNum(sec)) return "–";
  const sign = sec < 0 ? MINUS : "";
  const a = Math.abs(sec);
  if (a < 60) {
    if (a === 0) return "0 s";
    if (a < 1) { const v = fmtValue(a, "s", { sig: 3 }); return `${sign}${v.value} ${v.unit}`; }
    return `${sign}${fmtNumber(a, { sig: 3 })} s`;
  }
  const s = Math.round(a);
  const d = Math.floor(s / 86400), h = Math.floor((s % 86400) / 3600), m = Math.floor((s % 3600) / 60), r = s % 60;
  if (d) return `${sign}${d} d${h ? ` ${h} h` : ""}`;
  if (h) return `${sign}${h} h${m ? ` ${pad(m)} m` : ""}`;
  return `${sign}${m} m${r ? ` ${pad(r)} s` : ""}`;
}

/** A whole count, grouped in thousands from 1 000 up (the brief writes "1,248 ships shown"). */
export function fmtCount(n) {
  if (!isNum(n)) return "–";
  const s = String(Math.round(Math.abs(n))).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  return (n < 0 ? MINUS : "") + s;
}

/**
 * Split a figure the engine or the Studio already wrote as text ("2610 s", "99.8 %",
 * "12.4 / 18.0 m") into { value, unit } when it starts with a number, so the shell can set the
 * number in mono and the unit quieter; anything else is { value: text, unit: "" }.
 */
export function splitFigure(text, unit = "") {
  const s = String(text ?? "").trim();
  const m = s.match(/^([−+-]?[\d.,]+(?:e[−+-]?\d+)?(?:\s*[/×x]\s*[−+-]?[\d.,]+)*)\s*(.*)$/i);
  if (!m) return { value: s, unit: unit || "", numeric: false };
  const rest = m[2].trim();
  return { value: m[1].replace(/^-/, MINUS), unit: [rest, unit].filter(Boolean).join(" "), numeric: true };
}
