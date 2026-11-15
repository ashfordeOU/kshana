// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the stability, integrity and spectrum plots of a run (0.42 U25). The
// engine writes Allan deviation, MTIE and TDEV curves, Stanford points and spectra into the
// results of the scenarios that compute them; this module finds them in any result by their
// shape (the field names the engine writes, at any depth) and turns each into the spec of an
// interactive chart (lib/chart/presets.mjs): log–log stability plots with their confidence band,
// the Stanford plot with its alert limit and regions, the waterfall and the Welch spectrum.
//
// What is drawn is what the result holds: no curve is fitted, smoothed or computed here. Pure,
// no DOM; tested in plots.test.mjs.

const num = (x) => typeof x === "number" && Number.isFinite(x);
const isObj = (x) => x && typeof x === "object" && !Array.isArray(x);
const MAX_DEPTH = 6;

/** The deviation fields of a τ curve, as the engine names them: [field, kind, unit, scale to the plotted unit]. */
const CURVE_FIELDS = [
  ["adev", "adev", "", 1], ["oadev", "adev", "", 1], ["mdev", "mdev", "", 1], ["hdev", "hdev", "", 1],
  ["mtie_ns", "mtie", "ns", 1], ["mtie_s", "mtie", "ns", 1e9], ["tdev_ns", "tdev", "ns", 1], ["tdev_s", "tdev", "ns", 1e9],
];

/** A readable name of a path (`quantum.adev_curve` → `quantum`, `measured.mtie` → `measured`). */
export function labelOf(path, fallback) {
  const parts = String(path).split(".").filter((p) => p && !/^\d+$/.test(p) && !/^(adev_curve|adev|mtie|tdev|curve|stability|points|series)$/.test(p));
  return parts.length ? parts.join(" · ") : fallback;
}

/** A τ curve at `arr` (an array of objects with `tau_s` and one deviation field), or null. */
export function curveOf(arr, path) {
  if (!Array.isArray(arr) || arr.length < 2 || !isObj(arr[0]) || !num(arr[0].tau_s)) return null;
  const f = CURVE_FIELDS.find(([k]) => num(arr[0][k]));
  if (!f) return null;
  const [field, kind, unit, k] = f;
  const rows = arr.filter((p) => isObj(p) && num(p.tau_s) && p.tau_s > 0 && num(p[field]) && p[field] > 0);
  if (rows.length < 2) return null;
  const band = rows.every((p) => num(p.ci_lo) && num(p.ci_hi) && p.ci_hi >= p.ci_lo && p.ci_lo > 0);
  return {
    kind, path, field, unit, label: labelOf(path, kind.toUpperCase()),
    tau: rows.map((p) => p.tau_s), dev: rows.map((p) => p[field] * k),
    lo: band ? rows.map((p) => p.ci_lo * k) : null, hi: band ? rows.map((p) => p.ci_hi * k) : null,
    noise: rows.map((p) => (typeof p.noise === "string" ? p.noise : null)),
  };
}

/** The Stanford points at `o` ({ alert_limit_m, points: [{ error_m, pl_m, region }] }), or null. */
export function stanfordOf(o, path) {
  if (!isObj(o) || !Array.isArray(o.points) || o.points.length < 2) return null;
  const p0 = o.points[0];
  if (!isObj(p0) || !num(p0.error_m) || !num(p0.pl_m)) return null;
  const pts = o.points.filter((p) => isObj(p) && num(p.error_m) && num(p.pl_m));
  return { kind: "stanford", path, alertLimit: num(o.alert_limit_m) ? o.alert_limit_m : null, error: pts.map((p) => p.error_m), pl: pts.map((p) => p.pl_m), region: pts.map((p) => (typeof p.region === "string" ? p.region : null)), t: pts.every((p) => num(p.t_s)) ? pts.map((p) => p.t_s) : null, label: labelOf(path, "Stanford") };
}

/** A waterfall at `o` ({ freq_hz, t_s, psd_dbw_per_hz: rows over t_s }), or null. */
export function waterfallOf(o, path) {
  if (!isObj(o) || !Array.isArray(o.freq_hz) || !Array.isArray(o.t_s) || !Array.isArray(o.psd_dbw_per_hz)) return null;
  const z = o.psd_dbw_per_hz;
  if (z.length !== o.t_s.length || !z.length || !Array.isArray(z[0]) || z[0].length !== o.freq_hz.length) return null;
  return { kind: "waterfall", path, f: o.freq_hz.map((f) => f / 1e6), t: o.t_s.slice(), z, noise: num(o.noise_floor_dbw_per_hz) ? o.noise_floor_dbw_per_hz : null, label: labelOf(path, "waterfall") };
}

/** A spectrum at `o` ({ freq_offset_hz, welch_dbw_per_hz, model_dbw_per_hz? , centre_hz? }), or null. */
export function spectrumOf(o, path) {
  if (!isObj(o) || !Array.isArray(o.freq_offset_hz) || o.freq_offset_hz.length < 4) return null;
  const n = o.freq_offset_hz.length;
  const lines = [["welch_dbw_per_hz", "Welch estimate"], ["model_dbw_per_hz", "model"], ["psd_dbw_per_hz", "PSD"]].filter(([k]) => Array.isArray(o[k]) && o[k].length === n);
  if (!lines.length) return null;
  const c = num(o.centre_hz) ? o.centre_hz : 0;
  return { kind: "spectrum", path, f: o.freq_offset_hz.map((x) => (c + x) / 1e6), lines: lines.map(([k, label]) => ({ key: k, label, y: o[k] })), centre: c, label: labelOf(path, "spectrum"), note: typeof o.label === "string" ? o.label : "" };
}

/**
 * Every plottable output of a result, in the order found: [{ kind: adev | mdev | hdev | mtie | tdev |
 * stanford | waterfall | spectrum, path, … }]. Arrays of rows are looked into once (their first row).
 */
export function findPlots(result) {
  const out = [];
  const seen = new Set();
  const walk = (v, path, depth) => {
    if (depth > MAX_DEPTH || v === null || typeof v !== "object" || seen.has(v)) return;
    seen.add(v);
    if (Array.isArray(v)) {
      const c = curveOf(v, path);
      if (c) { out.push(c); return; }
      if (v.length && isObj(v[0]) && v.length <= 64) v.forEach((x, i) => walk(x, `${path}.${i}`, depth + 1));
      return;
    }
    const st = stanfordOf(v, path), wf = waterfallOf(v, path), sp = spectrumOf(v, path);
    for (const x of [st, wf, sp]) if (x) out.push(x);
    if (st || wf) return;
    for (const [k, x] of Object.entries(v)) if (x && typeof x === "object") walk(x, path ? `${path}.${k}` : k, depth + 1);
  };
  walk(result, "", 0);
  return out;
}

const TITLES = { adev: "Allan deviation", mdev: "Modified Allan deviation", hdev: "Hadamard deviation", mtie: "MTIE", tdev: "TDEV" };
const YLABEL = { adev: "σy(τ)", mdev: "mod σy(τ)", hdev: "Hσy(τ)", mtie: "MTIE", tdev: "TDEV" };
const COLOURS = ["tim", "nav", "itg", "pro", "int", "ink3"];

/**
 * The charts of the plots found (findPlots), grouped: one log–log chart per curve kind (every
 * curve of that kind on it, MTIE and TDEV together), one Stanford plot each, a waterfall and a
 * spectrum each. Returns [{ id, title, kind, spec, paths }]; `P` is lib/chart/presets.mjs.
 */
export function plotCharts(found, P, { title = "" } = {}) {
  const charts = [];
  const curves = found.filter((x) => TITLES[x.kind]);
  const groups = new Map();
  for (const c of curves) {
    const g = c.kind === "mtie" || c.kind === "tdev" ? "time" : c.kind;
    if (!groups.has(g)) groups.set(g, []);
    groups.get(g).push(c);
  }
  for (const [g, list] of groups) {
    const kinds = [...new Set(list.map((c) => c.kind))];
    const name = g === "time" ? kinds.map((k) => TITLES[k]).join(" · ") : TITLES[g];
    const unit = list[0].unit;
    const many = list.length > 1;
    charts.push({
      id: `loglog-${g}`, kind: g, paths: list.map((c) => c.path), title: name,
      spec: P.loglog({
        title: title ? `${name} · ${title}` : name, yLabel: g === "time" ? kinds.map((k) => YLABEL[k]).join(", ") : YLABEL[g], yUnit: unit,
        curves: list.map((c, i) => ({ id: `${c.kind}-${i}`, label: many || g === "time" ? `${g === "time" ? `${TITLES[c.kind]} ` : ""}${c.label}`.trim() : c.label, tau: c.tau, dev: c.dev, lo: c.lo || undefined, hi: c.hi || undefined, color: COLOURS[i % COLOURS.length], bandLabel: c.lo ? "95 % confidence interval" : undefined })),
      }),
    });
  }
  found.filter((x) => x.kind === "stanford").forEach((s, i) => {
    charts.push({ id: `stanford-${i}`, kind: "stanford", paths: [s.path], title: "Stanford plot", spec: P.stanford({ error: s.error, pl: s.pl, t: s.t, alertLimit: s.alertLimit ?? Math.max(...s.pl), unit: "m", title: title ? `Stanford plot · ${title}` : "Stanford plot", region: s.region.every(Boolean) ? s.region : null }) });
  });
  found.filter((x) => x.kind === "spectrum").forEach((s, i) => {
    charts.push({
      id: `spectrum-${i}`, kind: "spectrum", paths: [s.path], title: "Spectrum", note: s.note,
      spec: { type: "xy", title: title ? `Spectrum · ${title}` : "Spectrum", subtitle: s.label, x: { label: "frequency", unit: "MHz" }, y: { label: "PSD", unit: "dBW/Hz" }, series: s.lines.map((l, k) => ({ id: l.key, label: l.label, color: k ? "ink3" : "int", dash: k ? [4, 3] : undefined, x: s.f, y: l.y, unit: "dBW/Hz" })) },
    });
  });
  found.filter((x) => x.kind === "waterfall").forEach((w, i) => {
    charts.push({ id: `waterfall-${i}`, kind: "waterfall", paths: [w.path], title: "Waterfall", spec: { ...P.waterfall({ title: title ? `Waterfall · ${title}` : "Waterfall", f: w.f, t: w.t, z: w.z, unit: "dBW/Hz" }), subtitle: w.noise !== null ? `noise floor ${w.noise.toFixed(1)} dBW/Hz` : "" }, grid: w });
  });
  return charts;
}

/** The Python lines that read the plotted data from a result (for the console and "copy the script"). */
export function plotLines(found, varName = "result") {
  const acc = (path) => path.split(".").filter(Boolean).map((p) => (/^\d+$/.test(p) ? `[${p}]` : `[${JSON.stringify(p)}]`)).join("");
  return found.map((x) => {
    if (TITLES[x.kind]) return `${x.kind}_${x.label.replace(/[^A-Za-z0-9]+/g, "_").toLowerCase()} = [(p["tau_s"], p["${x.field}"]) for p in ${varName}${acc(x.path)}]`;
    if (x.kind === "stanford") return `stanford = [(p["error_m"], p["pl_m"]) for p in ${varName}${acc(x.path)}["points"]]`;
    if (x.kind === "waterfall") return `waterfall = ${varName}${acc(x.path)}  # freq_hz, t_s, psd_dbw_per_hz`;
    return `spectrum = ${varName}${acc(x.path)}  # freq_offset_hz, ${x.lines.map((l) => l.key).join(", ")}`;
  });
}
