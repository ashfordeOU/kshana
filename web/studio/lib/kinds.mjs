// SPDX-License-Identifier: AGPL-3.0-only
// View models for the engine's newer scenario kinds: spectrum, solar-system, body-pnt,
// constellation-design, campaign, and the low Earth orbit (LEO) navigation kinds (leo-signal,
// leo-pass, leo-navmsg, leo-pvt, leo-ppp, ntn-positioning, leo-pnt-chain), plus lunar-llr-datum.
//
// A view is a list of PANELS. A panel never holds a number of its own: a table cell, a key/value
// row, a list item and a text block each name the PATH in the result document they show, and the
// page reads the value from the result through `resolve`. A line chart holds the points it
// plots and names the arrays they were read from (`src`). Units and the hover notes come from
// the result's own `units` block. Pure; tested in kinds.test.mjs against real engine output.
import { fmt, humanKey, SERIES_COLORS, seriesModel, signalModel, holdoverModel, masksModel, adevCurves, orbitTrackKm, groundTrack } from "./views.mjs";
import { readScalar } from "./share.mjs";

// ---------------------------------------------------------------- paths, units, quantities

// Read `a.b[2].c` from an object; undefined when any step is missing.
export function resolve(obj, path) {
  let v = obj;
  for (const m of String(path).matchAll(/[^.[\]]+|\[(-?\d+)\]/g)) {
    if (v === null || v === undefined) return undefined;
    v = m[1] !== undefined ? v[Number(m[1]) < 0 ? v.length + Number(m[1]) : Number(m[1])] : v[m[0]];
  }
  return v;
}

// `bands[3].centre_hz` -> `bands[].centre_hz`, the form the engine's `units` block is keyed by.
export const genericPath = (path) => String(path).replace(/\[-?\d+\]/g, "[]");

// The engine's own unit record for a path: { unit, note, provenance } or null.
export function unitOf(result, path) {
  const u = result && result.units;
  if (!u) return null;
  const g = genericPath(path);
  return u[g] || u[g + "[]"] || u[g.replace(/\[\]$/, "")] || u[path] || null;
}

// A number with its unit, scaled to a readable multiple. The scaling is display only:
// { text, unit } where text is the scaled number. Hz -> kHz/MHz/GHz; m -> km, mm or µm;
// s -> ms, µs or ns; "1" and "count" carry no unit.
export function quantity(v, unit = "") {
  if (typeof v !== "number" || !Number.isFinite(v)) return { text: "—", unit: "" };
  const a = Math.abs(v);
  const out = (x, u, digits = 3) => ({ text: fmt(x, digits), unit: u });
  switch (unit) {
    case "Hz":
      if (a >= 1e9) return out(v / 1e9, "GHz", 6);
      if (a >= 1e6) return out(v / 1e6, "MHz", 6);
      if (a >= 1e3) return out(v / 1e3, "kHz", 5);
      return out(v, "Hz");
    case "m":
      if (a >= 1e4) return out(v / 1e3, "km", 5);
      if (a !== 0 && a < 1e-4) return out(v * 1e6, "µm");
      if (a !== 0 && a < 0.1) return out(v * 1e3, "mm");
      return out(v, "m");
    case "s":
      if (a !== 0 && a < 1e-6) return out(v * 1e9, "ns");
      if (a !== 0 && a < 1e-3) return out(v * 1e6, "µs");
      if (a !== 0 && a < 1) return out(v * 1e3, "ms");
      return out(v, "s", 5);
    case "1": case "count": case "-": case "": case undefined: case null:
      return out(v, "", Number.isInteger(v) ? 9 : 3);
    case "deg": return out(v, "°", 4);
    case "percent": case "pct": return out(v, "%", 4);
    default: return out(v, unit, 4);
  }
}

// Text of any leaf for a cell: a number with its unit, a boolean as yes/no, a string as is.
// `unit` overrides the engine's unit record for the path (a table column that names its unit).
export function leafText(result, path, value, unit) {
  if (value === null || value === undefined) return "—";
  if (typeof value === "number") { const u = unitOf(result, path); const q = quantity(value, unit !== undefined && unit !== null ? unit : u ? u.unit : ""); return q.unit ? `${q.text}${q.unit === "°" || q.unit === "%" ? "" : " "}${q.unit}` : q.text; }
  if (typeof value === "boolean") return value ? "yes" : "no";
  if (Array.isArray(value)) return value.every((x) => typeof x === "number") ? value.map((x) => fmt(x)).join(", ") : value.join(", ");
  if (typeof value === "object") return JSON.stringify(value);
  return String(value);
}

// Column or row label from a key: the unit suffix is dropped (each cell carries its unit).
export const keyLabel = (key) => humanKey(String(key).split(".").pop()).replace(/\s*\([^)]*\)$/, "").replace(/\s+pct$/i, "");
// The same label inside a sentence or on an axis: lower case, except that an acronym keeps its capitals
// ("LEO SISRE", never "leo sisre").
export const axisLabel = (key) => { const l = keyLabel(key); return /^[A-Z][a-z]/.test(l) ? l.charAt(0).toLowerCase() + l.slice(1) : l; };

// ---------------------------------------------------------------- panel builders

const color = (i) => SERIES_COLORS[i % SERIES_COLORS.length];
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const rowsOf = (result, base) => (Array.isArray(resolve(result, base)) ? resolve(result, base).map((_, i) => ({ path: `${base}[${i}]` })) : []);
const col = (key, extra = {}) => ({ key, label: keyLabel(key), ...extra });
const cols = (...keys) => keys.map((k) => (typeof k === "string" ? col(k) : k));

function table(result, title, base, columns, extra = {}) {
  const rows = extra.rows || rowsOf(result, base);
  if (!rows.length) return null;
  return { type: "table", title, rows, cols: columns, ...extra };
}
function kv(result, title, base, keys, extra = {}) {
  const obj = base ? resolve(result, base) : result;
  if (!obj || typeof obj !== "object") return null;
  const ks = keys || Object.keys(obj).filter((k) => obj[k] === null || typeof obj[k] !== "object" || (Array.isArray(obj[k]) && obj[k].length <= 4 && obj[k].every((x) => typeof x !== "object")));
  const items = ks.filter((k) => obj[k] !== undefined).map((k) => ({ path: base ? `${base}.${k}` : k, label: keyLabel(k) }));
  return items.length ? { type: "kv", title, items, ...extra } : null;
}
function list(result, title, path, extra = {}) {
  const a = resolve(result, path);
  if (!Array.isArray(a) || !a.length) return null;
  return { type: "list", title, items: a.map((_, i) => ({ path: `${path}[${i}]` })), ...extra };
}
// Line chart over an array of records: x = record[xKey], one series per y key.
function lineOf(result, title, base, xKey, ys, extra = {}) {
  const arr = resolve(result, base);
  if (!Array.isArray(arr) || arr.length < 2) return null;
  const series = ys.map((y, i) => ({ label: y.label || keyLabel(y.key), color: y.color || color(i), points: arr.map((r) => [resolve(r, xKey), resolve(r, y.key)]), dash: y.dash }))
    .filter((s) => s.points.filter((p) => isNum(p[0]) && isNum(p[1])).length > 1);
  if (!series.length) return null;
  const u = unitOf(result, `${base}[0].${ys[0].key}`);
  const ux = unitOf(result, `${base}[0].${xKey}`);
  const unit = u && u.unit !== "1" ? u.unit : "";
  return {
    type: "line", title, wide: true,
    model: { title, series, xLabel: extra.xLabel || `${axisLabel(xKey)}${ux && ux.unit !== "1" ? ` (${ux.unit})` : ""}`, yLabel: extra.yLabel || (unit ? `${axisLabel(ys[0].key)} (${unit})` : axisLabel(ys[0].key)), unit, threshold: extra.threshold ?? null, thresholdLabel: extra.thresholdLabel, xName: extra.xName, xUnit: extra.xUnit, outages: [] },
    opts: extra.opts || {},
    src: ys.map((y) => ({ path: `${base}[].${y.key}`, n: arr.length })),
    note: extra.note,
  };
}
// Line chart over parallel arrays: x = result[xPath], one series per y path.
function lineCols(result, title, xPath, ys, extra = {}) {
  const xs = resolve(result, xPath);
  if (!Array.isArray(xs) || xs.length < 2) return null;
  const series = ys.map((y, i) => {
    const v = resolve(result, y.path);
    return Array.isArray(v) ? { label: y.label, color: y.color || color(i), points: xs.map((x, k) => [isNum(x) ? x * (extra.xScale || 1) : x, v[k]]), dash: y.dash, path: y.path } : null;
  }).filter((s) => s && s.points.filter((p) => isNum(p[0]) && isNum(p[1])).length > 1);
  if (!series.length) return null;
  const u = unitOf(result, series[0].path);
  const ux = unitOf(result, xPath);
  const unit = extra.unit ?? (u && u.unit !== "1" ? u.unit : "");
  return {
    type: "line", title, wide: true,
    model: { title, series, xLabel: extra.xLabel || `${axisLabel(xPath.replace(/\[\]$/, ""))}${ux && ux.unit !== "1" ? ` (${ux.unit})` : ""}`, yLabel: extra.yLabel || unit, unit, threshold: extra.threshold ?? null, thresholdLabel: extra.thresholdLabel, xName: extra.xName, xUnit: extra.xUnit, outages: [] },
    opts: extra.opts || {},
    src: series.map((s) => ({ path: s.path, n: xs.length })),
    note: extra.note,
  };
}
const labelPanel = (result) => (typeof result.label === "string" ? { type: "note", title: "What this run is, and is not", path: "label", wide: true } : null);
const clean = (panels) => panels.filter(Boolean);

// ---------------------------------------------------------------- spectrum

function spectrumPanels(r) {
  const thr = resolve(r, "receiver.tracking_threshold_dbhz");
  const bandNames = (r.bands || []).map((b) => b.name);
  const sameOrder = (r.timeline && r.timeline.bands || []).every((b, i) => b.name === bandNames[i]);
  const tl = (key) => (sameOrder ? { key, label: keyLabel(key), path: (_, i) => `timeline.bands[${i}].${key}` } : null);
  return clean([
    lineCols(r, "C/N0 by band over the run", "timeline.t_s", (r.timeline && r.timeline.bands || []).map((b, i) => ({ label: b.name, path: `timeline.bands[${i}].cn0_effective_dbhz` })),
      { threshold: isNum(thr) ? thr : null, thresholdLabel: "tracking threshold", xLabel: "time (s)", yLabel: "effective C/N0 (dB-Hz)", unit: "dB-Hz",
        note: "C/N0 is the carrier-to-noise density ratio. A band under the receiver's tracking threshold has lost lock." }),
    table(r, "Bands", "bands", clean([col("name", { label: "Band" }), col("modulation"), col("centre_hz"), col("chip_rate_hz"), col("nominal_cn0_dbhz"), tl("min_cn0_dbhz"), tl("min_cn0_t_s"), tl("first_loss_t_s"), tl("tracking_fraction"), tl("worst_js_db")]), { wide: true,
      note: "J/S is the jammer-to-signal power ratio. Tracking fraction is the share of the run the band stays above the threshold." }),
    table(r, "Jammers", "jammers", cols(col("name", { label: "Jammer" }), "waveform", "centre_hz", "bandwidth_hz", "eirp_dbw", "range_m", "received_power_dbw", "on_s", "off_s"), { wide: true, note: "EIRP is the equivalent isotropically radiated power." }),
    r.iq ? lineCols(r, "Snapshot spectrum: Welch estimate against the model", "iq.freq_offset_hz", [{ label: "Welch estimate of the synthesised samples", path: "iq.welch_dbw_per_hz" }, { label: "model", path: "iq.model_dbw_per_hz" }],
      { xLabel: "offset from the snapshot centre (MHz)", yLabel: "power spectral density (dBW/Hz)", unit: "dBW/Hz", xName: "offset", xUnit: "MHz", xScale: 1e-6,
        note: "The engine draws its spectrum model as in-phase and quadrature (IQ) samples at one instant and estimates the spectrum back from them. The same samples are the SigMF (Signal Metadata Format) export." }) : null,
    r.iq ? kv(r, "Snapshot", "iq", ["t_s", "centre_hz", "sample_rate_hz", "n_samples", "nfft", "segments", "enbw_hz", "label"]) : null,
    r.iq ? kv(r, "Snapshot against the model", "iq.comparison") : null,
    kv(r, "Receiver", "receiver"),
    table(r, "Cross-check against the jamming kind", "jamming_kind_cross_check", cols(col("band"), col("jammer"), "js_spectrum_db", "js_jamming_kind_db", "cn0_spectrum_dbhz", "cn0_jamming_kind_q_from_ssc_dbhz", "abs_difference_db"), { wide: true,
      note: "The spectrum kind and the jamming kind compute the same link two ways; the last column is their difference." }),
    list(r, "Not modelled", "not_modelled", { wide: true }),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- solar system and body-pnt

function solarPanels(r) {
  return clean([
    table(r, "Bodies", "bodies", cols(col("name", { label: "Body" }), col("class"), col("parent"), "heliocentric_distance_au", col("observer_link.one_way_light_time_s", { label: `Light time from ${r.observer || "the observer"}` }), col("observer_link.sun_separation_deg", { label: "Sun separation" }), "orbital_period_d", "radius_mean_m", col("label", { label: "Evidence" }), col("method", { note: true })), { wide: true,
      note: "Each body carries its own evidence label. Light time is one way, from the observer named in the scenario." }),
    table(r, "Links", "links", cols(col("from"), col("to"), "geometric_distance_m", "one_way_light_time_s", "two_way_light_time_s", "shapiro_delay_s", "sun_separation_deg"), { wide: true,
      note: "The Shapiro delay is the extra light time from the Sun's gravity along the path." }),
    kv(r, "Epoch and frame", "", ["observer", "n_bodies", "frame", "standish_table"].filter((k) => r[k] !== undefined).concat([]), { wide: false }),
    kv(r, "Epoch", "epoch"),
    labelPanel(r),
  ]);
}

function bodyPntPanels(r) {
  return clean([
    lineOf(r, "Position uncertainty: relays alone, and with the Earth link", "epochs", "t_s", [{ key: "formal_sigma_relays_m", label: "relays only" }, { key: "formal_sigma_with_earth_m", label: "relays and Earth link" }],
      { xLabel: "time (s)", yLabel: "formal position sigma (m)", note: "A gap is an epoch with too few relays in view for a fix." }),
    lineOf(r, "Realised position error", "epochs", "t_s", [{ key: "error_relays_m", label: "relays only" }, { key: "error_with_earth_m", label: "relays and Earth link" }], { xLabel: "time (s)", yLabel: "position error (m)" }),
    lineOf(r, "Relays in view", "epochs", "t_s", [{ key: "n_relays_visible", label: "relays above the mask", color: "var(--s-orb)" }], { xLabel: "time (s)", yLabel: "relays", threshold: 4, thresholdLabel: "4 needed for a fix" }),
    kv(r, "Figures of merit", "fom"),
    kv(r, "Body", "body"),
    kv(r, "Earth link", "earth_to_body"),
    kv(r, "Relay constellation", "", ["n_relays", "relay_altitude_m", "relay_period_s", "sigma_relay_range_m", "sigma_earth_range_m", "user_kind", "earth_link_used"]),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- constellation design

function coveragePanels(r) {
  const dop = ["gdop", "pdop", "hdop", "vdop"].filter((k) => resolve(r, `global.${k}`));
  return clean([
    dop.length ? { type: "table", title: "Dilution of precision over the whole grid", rows: dop.map((k) => ({ path: `global.${k}`, label: k.toUpperCase() })), cols: cols("median", "mean", "p90", "p95", "p99", "max"), rowHead: "Figure",
      note: "Dilution of precision (DOP) scales a range error into a position error: G is geometric, P position, H horizontal, V vertical. Percentiles are over every grid point and epoch." } : null,
    kv(r, "Global coverage", "global", ["availability_pct", "fix_pct", "mean_visible", "min_visible", "worst_site_availability_pct"]),
    table(r, "Constellations", "constellations", cols(col("name", { label: "Constellation" }), "satellites", "mean_visible", col("source", { note: true })), { wide: true }),
    kv(r, "Inputs", "inputs"),
    kv(r, "Central body", "body"),
    kv(r, "Work done", "work"),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- campaign

function campaignPanels(r) {
  const out = [];
  if (r.timeline) {
    out.push(table(r, "Phases", "timeline.phases", cols(col("name", { label: "Phase" }), "t0_s", "t1_s", col("ended_by")), { wide: false }));
    out.push(table(r, "Events", "timeline.events", cols("t_s", col("phase"), col("label", { label: "Event" }), col("alarm")), { wide: false }));
    const runs = [];
    (r.timeline.phases || []).forEach((p, i) => (p.runs || []).forEach((_, j) => runs.push({ path: `timeline.phases[${i}].runs[${j}]`, label: p.name })));
    if (runs.length) out.push({ type: "table", title: "Member runs", rows: runs, rowHead: "Phase", cols: cols(col("kind"), col("scenario_hash", { hash: true }), col("result_sha256", { hash: true }), "skip_s", col("channels")), wide: true,
      note: "Every phase is an ordinary scenario run. The hashes identify each member's input and its result document." });
    out.push(table(r, "Hand-offs between phases", "timeline.handoffs", cols(col("from"), col("to"), col("quantity"), "value", col("unit")), { wide: true }));
  }
  if (r.sweep) {
    const axes = r.sweep.axis_order || [];
    const ax = axes[0];
    const vals = resolve(r, `sweep.axes.${ax}.values`);
    if (ax && Array.isArray(vals) && axes.length === 1) {
      for (const [name, m] of Object.entries(r.sweep.metrics || {})) {
        const pts = (r.sweep.nodes || []).map((n) => [n.coords[ax], n.metrics[name]]);
        if (pts.filter((p) => isNum(p[0]) && isNum(p[1])).length < 2) continue;
        const axUnit = resolve(r, `sweep.axes.${ax}.unit`);
        out.push({ type: "line", title: `${keyLabel(name)} against ${axisLabel(ax)}`,
          model: { title: `${keyLabel(name)} against ${axisLabel(ax)}`, series: [{ label: keyLabel(name), color: color(out.length), points: pts }], xLabel: `${axisLabel(ax)}${axUnit && axUnit !== "1" ? ` (${axUnit})` : ""}`, yLabel: `${axisLabel(name)}${m.unit && m.unit !== "1" && m.unit !== "count" ? ` (${m.unit})` : ""}`, unit: m.unit && m.unit !== "1" && m.unit !== "count" ? m.unit : "", xName: axisLabel(ax), xUnit: axUnit && axUnit !== "1" ? axUnit : "", outages: [], logX: resolve(r, `sweep.axes.${ax}.scale`) === "log" },
          opts: { marks: pts.filter((p) => isNum(p[0]) && isNum(p[1])).map((p) => ({ x: p[0], y: p[1], color: color(out.length) })) },
          src: [{ path: `sweep.nodes[].metrics.${name}`, n: (r.sweep.nodes || []).length }] });
      }
    }
    const metricCols = Object.keys(r.sweep.metrics || {}).map((k) => col(`metrics.${k}`, { label: keyLabel(k), unit: r.sweep.metrics[k].unit }));
    const axisCols = axes.map((a) => col(`coords.${a}`, { label: keyLabel(a), unit: resolve(r, `sweep.axes.${a}.unit`) }));
    out.push(table(r, "Every node of the sweep", "sweep.nodes", [...axisCols, ...metricCols], { wide: true, note: "Each row is one full engine run of the swept scenario." }));
    out.push(kv(r, "Sweep", "sweep", ["scenario_kind", "runs", "shape"]));
  }
  if (r.monte_carlo) {
    const names = Object.keys(r.monte_carlo.metrics || {});
    for (const n of names) out.push({ type: "hist", title: `${keyLabel(n)}: distribution over the runs`, path: `monte_carlo.metrics.${n}.samples`, unit: r.monte_carlo.metrics[n].unit, marks: ["p05", "p50", "p95"].map((k) => ({ label: k, path: `monte_carlo.metrics.${n}.${k}` })) });
    out.push({ type: "table", title: "Statistics over the runs", rows: names.map((n) => ({ path: `monte_carlo.metrics.${n}`, label: keyLabel(n) })), rowHead: "Metric", wide: true,
      cols: cols("n", "mean", "std", "p05", "p50", "p95", "ci95_low", "ci95_high").map((c) => ({ ...c, unitFrom: "unit" })),
      note: "p05, p50 and p95 are the 5th, 50th and 95th percentiles. ci95 is the 95% confidence interval on the mean." });
    out.push(kv(r, "Monte Carlo", "monte_carlo", ["scenario_kind", "runs", "seed_key", "base_seed"]));
  }
  if (r.compose) {
    const members = Object.keys(r.compose.members || {});
    const metrics = Object.keys(r.compose.metric_units || {});
    if (members.length) out.push({ type: "table", title: "Members under the shared conditions", rows: members.map((m) => ({ path: `compose.members.${m}`, label: m })), rowHead: "Member", wide: true,
      cols: [col("kind"), ...metrics.map((k) => col(`metrics.${k}`, { label: keyLabel(k), unit: r.compose.metric_units[k] })), col("scenario_hash", { hash: true }), col("result_sha256", { hash: true })] });
    if (metrics.some((k) => resolve(r, `compose.combined.${k}`))) out.push({ type: "table", title: "Combined over the members", rows: metrics.filter((k) => resolve(r, `compose.combined.${k}`)).map((k) => ({ path: `compose.combined.${k}`, label: keyLabel(k) })), rowHead: "Metric", wide: true,
      cols: cols("min", col("min_member"), "max", col("max_member"), "mean").map((c) => ({ ...c, unitFrom: "unit" })) });
    const shared = Object.keys(r.compose.shared || {});
    if (shared.length) out.push({ type: "table", title: "Shared conditions", rows: shared.map((k) => ({ path: `compose.shared.${k}`, label: keyLabel(k) })), rowHead: "Condition", cols: [col("value", { unitFrom: "unit" })] });
  }
  out.push(kv(r, "Reproducibility", "reproducibility", null, { hash: true }));
  out.push(labelPanel(r));
  return clean(out);
}

// ---------------------------------------------------------------- LEO signal design

function leoSignalPanels(r) {
  const sigs = r.signals || [];
  const psd = sigs.map((s, i) => (s.psd && Array.isArray(s.psd.offset_hz) ? { label: s.name, color: color(i), points: s.psd.offset_hz.map((f, k) => [f / 1e6, s.psd.db_per_hz[k]]), path: `signals[${i}].psd.db_per_hz`, n: s.psd.offset_hz.length } : null)).filter(Boolean);
  const jit = sigs.map((s, i) => {
    const t = s.tracking;
    if (!t || !Array.isArray(t.cn0_dbhz) || !Array.isArray(t.jitter_m)) return null;
    const k = Math.max(0, (t.spacings_chips || []).indexOf(t.reference_spacing_chips));
    return Array.isArray(t.jitter_m[k]) ? { label: `${s.name} (${fmt(t.spacings_chips[k])} chip spacing)`, color: color(i), points: t.cn0_dbhz.map((c, j) => [c, t.jitter_m[k][j]]), path: `signals[${i}].tracking.jitter_m[${k}]`, n: t.cn0_dbhz.length } : null;
  }).filter(Boolean);
  const comp = [];
  sigs.forEach((s, i) => (s.components || []).forEach((_, j) => comp.push({ path: `signals[${i}].components[${j}]`, label: s.name })));
  const compat = [];
  sigs.forEach((s, i) => (s.compatibility || []).forEach((_, j) => compat.push({ path: `signals[${i}].compatibility[${j}]`, label: s.name })));
  return clean([
    psd.length ? { type: "line", title: "Power spectral density of each signal", wide: true, model: { title: "Power spectral density", series: psd, xLabel: "offset from the signal's centre (MHz)", yLabel: "power spectral density (dB/Hz, unit power)", unit: "dB/Hz", xName: "offset", xUnit: "MHz", outages: [] }, opts: {}, src: psd.map((p) => ({ path: p.path, n: p.n })),
      note: "Each signal is drawn about its own centre frequency. A gap is a spectral null." } : null,
    table(r, "Signals", "signals", cols(col("name", { label: "Signal" }), col("system"), "centre_hz", "tx_bandwidth_hz", "received_power_dbw", "reference_cn0_dbhz", "in_band_power_fraction", col("allocation"), col("source", { label: "Parameters" }), col("ranging")), { wide: true,
      note: "Parameters are PUBLIC (with a source), REPRESENTATIVE or WORKSHOP, as each preset states." }),
    comp.length ? { type: "table", title: "Signal components", rows: comp, rowHead: "Signal", wide: true, cols: cols(col("role"), col("modulation"), "chip_rate_hz", "code_length_chips", "power_fraction", "gabor_bandwidth_hz", "in_band_power_fraction"),
      note: "The Gabor (root-mean-square) bandwidth sets how sharply a signal can be ranged on." } : null,
    jit.length ? { type: "line", title: "Code-tracking jitter against C/N0", wide: true, model: { title: "Code-tracking jitter", series: jit, xLabel: "C/N0 (dB-Hz)", yLabel: "code-tracking jitter (m)", unit: "m", xName: "C/N0", xUnit: "dB-Hz", outages: [] }, opts: { marks: jit.flatMap((s) => s.points.filter((p) => isNum(p[1])).map((p) => ({ x: p[0], y: p[1], color: s.color }))) }, src: jit.map((p) => ({ path: p.path, n: p.n })) } : null,
    table(r, "Acquisition", "signals", [col("name", { label: "Signal" }), ...cols("acquisition.acquisition_cn0_dbhz", "acquisition.cells", "acquisition.doppler_bins", "acquisition.max_doppler_satellite_hz", "acquisition.mean_time_serial_s", "acquisition.mean_time_code_parallel_s")], { wide: true,
      note: "Cells are the code and Doppler bins a cold search must test." }),
    table(r, "Jammer tolerance", "signals", [col("name", { label: "Signal" }), ...cols("jammer_tolerance.cw_js_max_db", "jammer_tolerance.matched_js_max_db", "jammer_tolerance.wideband_js_max_db", "jammer_tolerance.tracking_threshold_dbhz")], { wide: true,
      note: "The largest jammer-to-signal ratio (J/S) each signal tracks through, for a continuous-wave (CW), a matched-spectrum and a wideband jammer." }),
    table(r, "Band trade at equal transmit power", "trade.rows", cols(col("signal"), "centre_hz", "free_space_loss_db", "cn0_equal_eirp_dbhz", "jitter_equal_eirp_m", "jitter_equal_cn0_m", "iono_delay_m", "wideband_js_max_equal_eirp_db"), { wide: true }),
    kv(r, "Trade conditions", "trade", ["reference_signal", "slant_range_km", "slant_tec_tecu"]),
    compat.length ? { type: "table", title: "Compatibility with GNSS signals", rows: compat, rowHead: "Signal", wide: true, cols: cols(col("gnss", { label: "GNSS signal" }), "gnss_centre_hz", "ssc_gnss_into_leo_db_per_hz", "leo_cn0_degradation_db", "ssc_leo_into_gnss_db_per_hz", "gnss_cn0_degradation_db"),
      note: "SSC is the spectral separation coefficient: how much of one signal's power falls inside the other's receiver. A dash means the two do not overlap." } : null,
    kv(r, "Receiver", "receiver"),
    table(r, "Sources", "sources", cols(col("preset"), col("source", { label: "Class" }), col("title"), col("url", { link: true })), { wide: true }),
    list(r, "Not modelled", "not_modelled", { wide: true }),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- LEO pass and link

function leoPassPanels(r) {
  const out = [];
  const sats = r.satellites || [];
  const cn0 = [], dop = [], el = [];
  sats.forEach((s, i) => {
    const ser = s.series || [];
    (s.bands || []).forEach((b, j) => {
      const at = (key) => ser.map((p) => [p.t_s, p.visible && p.bands && p.bands[j] ? p.bands[j][key] : null]);
      cn0.push({ label: `${s.id} ${b.name}`, color: color(cn0.length), points: at("cn0_dbhz"), path: `satellites[${i}].series[].bands[${j}].cn0_dbhz`, n: ser.length });
      dop.push({ label: `${s.id} ${b.name}`, color: color(dop.length), points: at("doppler_hz"), path: `satellites[${i}].series[].bands[${j}].doppler_hz`, n: ser.length });
    });
    el.push({ label: s.id, color: color(el.length), points: ser.map((p) => [p.t_s, p.elevation_deg]), path: `satellites[${i}].series[].elevation_deg`, n: ser.length });
  });
  // One GNSS satellite for scale: the one that climbs highest in the run (the engine's own figure).
  const g = r.gnss && Array.isArray(r.gnss.satellites) ? r.gnss.satellites : [];
  if (g.length) {
    let best = 0;
    g.forEach((x, i) => { if (x.max_elevation_deg > g[best].max_elevation_deg) best = i; });
    cn0.push({ label: `GNSS ${g[best].id} (highest in the sky)`, color: "var(--space-ink-2)", dash: true, points: g[best].series.map((p) => [p.t_s, p.cn0_dbhz]), path: `gnss.satellites[${best}].series[].cn0_dbhz`, n: g[best].series.length });
  }
  const keep = (list) => list.slice(0, 8);
  const gm = resolve(r, "gnss.median_cn0_dbhz");
  if (cn0.length) out.push({ type: "line", title: "C/N0 over the pass", wide: true, model: { title: "C/N0 over the pass", series: keep(cn0), xLabel: "time (s)", yLabel: "C/N0 (dB-Hz)", unit: "dB-Hz", threshold: isNum(gm) ? gm : null, thresholdLabel: "GNSS median", outages: [] }, opts: {}, src: keep(cn0).map((p) => ({ path: p.path, n: p.n })),
    note: "A low Earth orbit (LEO) satellite crosses the sky in minutes, so its C/N0 (carrier-to-noise density ratio) rises and falls in a bell; a GNSS satellite barely moves in the same time." });
  if (dop.length) out.push({ type: "line", title: "Doppler over the pass", wide: true, model: { title: "Doppler", series: keep(dop), xLabel: "time (s)", yLabel: "Doppler shift (Hz)", unit: "Hz", outages: [] }, opts: {}, src: keep(dop).map((p) => ({ path: p.path, n: p.n })) });
  if (el.length) out.push({ type: "line", title: "Elevation", wide: true, model: { title: "Elevation", series: keep(el), xLabel: "time (s)", yLabel: "elevation (°)", unit: "°", threshold: resolve(r, "user.mask_deg") ?? null, thresholdLabel: "elevation mask", outages: [] }, opts: { h: 260 }, src: keep(el).map((p) => ({ path: p.path, n: p.n })) });
  const bandRows = [];
  sats.forEach((s, i) => (s.bands || []).forEach((_, j) => bandRows.push({ path: `satellites[${i}].bands[${j}]`, label: s.id })));
  if (bandRows.length) out.push({ type: "table", title: "Bands", rows: bandRows.slice(0, 40), rowHead: "Satellite", wide: true, cols: cols(col("name", { label: "Band" }), "frequency_hz", "eirp_dbw", "peak_cn0_dbhz", "median_cn0_dbhz", "min_cn0_dbhz", "max_abs_doppler_hz", "max_abs_doppler_rate_hz_s", "iono_delay_at_peak_m", col("source", { note: true })) });
  out.push(table(r, "Passes", "satellites", cols(col("id", { label: "Satellite" }), col("system"), "altitude_m", "inclination_deg", "pass.aos_s", "pass.tca_s", "pass.los_s", "pass.max_elevation_deg", "pass.duration_above_mask_s", col("orbit_source")), { wide: true, rows: rowsOf(r, "satellites").slice(0, 40),
    note: "AOS is acquisition of signal, TCA the time of closest approach and LOS loss of signal." }));
  out.push(kv(r, "LEO against GNSS", "comparison"));
  out.push(kv(r, "GNSS reference", "gnss", ["constellation", "band", "frequency_hz", "satellites_in_view", "median_cn0_dbhz", "max_cn0_dbhz", "min_cn0_dbhz", "max_abs_doppler_hz", "source"]));
  out.push(table(r, "Ionosphere-free band pairs", "iono_free", Object.keys((r.iono_free && r.iono_free[0]) || {}).filter((k) => typeof r.iono_free[0][k] !== "object").map((k) => col(k)), { wide: true }));
  if (r.iot) {
    const rows = (r.iot.rows || []).map((_, i) => ({ path: `iot.rows[${i}]` }));
    if (rows.length) out.push({ type: "table", title: "Time to first fix and energy per fix", rows, wide: true, cols: cols(col("signal"), "cn0_dbhz", "cold.ttff_s", "cold.energy_per_fix_mj", "hot.ttff_s", "hot.energy_per_fix_mj", "doppler_uncertainty_cold_hz"),
      note: "Cold is a first fix with no prior knowledge; hot is a fix soon after the last one." });
    out.push(kv(r, "Receiver power budget", "iot", ["active_power_mw", "sleep_power_uw", "battery_mwh", "label"]));
    out.push(list(r, "Assumptions", "iot.assumptions", { wide: true }));
  }
  if (r.spoof) {
    const pd = ["fused", "leo", "gnss"].map((k, i) => ({ key: `${k}.p_detect`, label: `${k === "gnss" ? "GNSS" : k === "leo" ? "LEO" : "all"} channels` , color: color(i) }));
    out.push(lineOf(r, "Spoofing monitor: probability of detection", "spoof.series", "t_s", pd, { xLabel: "time (s)", yLabel: "probability of detection", opts: { vlines: isNum(r.spoof.onset_s) ? [{ x: r.spoof.onset_s, label: "spoofing starts", alarm: true }] : [] },
      note: "The Doppler and pass-geometry monitor compares measured range rates with those predicted from the orbits. The rule marks the spoofer's onset." }));
    out.push({ type: "table", title: "When each monitor detects", rows: ["first", "fused", "leo", "gnss", "cross_band"].filter((k) => r.spoof[k]).map((k) => ({ path: `spoof.${k}`, label: keyLabel(k) })), rowHead: "Monitor", cols: cols("detect_time_s", "delay_s", "offset_at_detection_m") });
    out.push(kv(r, "Spoofer and monitor settings", "spoof", ["onset_s", "offset_m", "push_rate_m_s", "push_azimuth_deg", "p_fa", "p_md", "window_s", "spoofs_gnss", "spoofed_bands", "label"]));
    out.push(list(r, "Notes on the spoofing model", "spoof.notes", { wide: true }));
  }
  out.push(kv(r, "User", "user"));
  out.push(table(r, "Closed-form Doppler against finite differences", "satellites", [col("id", { label: "Satellite" }), ...cols("doppler_check.max_doppler_diff_hz", "doppler_check.max_doppler_rate_diff_hz_s", "doppler_check.max_range_rate_diff_m_s")], { wide: true, rows: rowsOf(r, "satellites").slice(0, 12) }));
  out.push(list(r, "Notes", "notes", { wide: true }));
  out.push(labelPanel(r));
  return clean(out);
}

// ---------------------------------------------------------------- LEO navigation message

function leoNavmsgPanels(r) {
  const out = [];
  const sisreCols = cols(col("model"), "fit_interval_s", "update_period_s", "n_messages", "sisre_rms_m", "sisre_orb_rms_m", "sisre_max_m", "radial_rms_m", "along_rms_m", "cross_rms_m", "clock_rms_m");
  const sisreNote = "SISRE is the signal-in-space range error: what the broadcast message adds to a user's range. Here it is the message's representation error against the engine's own truth orbit.";
  const byModel = (base, xKey, yKey) => {
    const rows = resolve(r, base) || [];
    const models = [...new Set(rows.map((x) => x.model))];
    return models.map((m, i) => ({ label: m, color: color(i), points: rows.filter((x) => x.model === m).map((x) => [x[xKey], x[yKey]]) })).filter((s) => s.points.length > 1);
  };
  if (r.fit_interval_trade) {
    const s1 = byModel("fit_interval_trade.rows", "fit_interval_s", "sisre_rms_m");
    if (s1.length) out.push({ type: "line", title: "SISRE against fit interval", wide: true, model: { title: "SISRE against fit interval", series: s1, xLabel: "fit interval (s)", yLabel: "SISRE, root mean square (m)", unit: "m", xName: "fit interval", outages: [] }, opts: { logY: true, marks: s1.flatMap((s) => s.points.map((p) => ({ x: p[0], y: p[1], color: s.color }))) }, src: [{ path: "fit_interval_trade.rows[].sisre_rms_m", n: r.fit_interval_trade.rows.length }], note: sisreNote });
    const s2 = byModel("fit_interval_trade.update_period_rows", "update_period_s", "sisre_rms_m");
    if (s2.length) out.push({ type: "line", title: "SISRE against update period", wide: true, model: { title: "SISRE against update period", series: s2, xLabel: "update period (s)", yLabel: "SISRE, root mean square (m)", unit: "m", xName: "update period", outages: [] }, opts: { logY: true, marks: s2.flatMap((s) => s.points.map((p) => ({ x: p[0], y: p[1], color: s.color }))) }, src: [{ path: "fit_interval_trade.update_period_rows[].sisre_rms_m", n: r.fit_interval_trade.update_period_rows.length }] });
    out.push(table(r, "Fit-interval trade", "fit_interval_trade.rows", sisreCols, { wide: true }));
    out.push(table(r, "Update-period trade", "fit_interval_trade.update_period_rows", sisreCols, { wide: true }));
    out.push({ type: "note", title: "Reading the trade", path: "fit_interval_trade.explanation", wide: true });
  }
  if (r.model_comparison) {
    out.push(table(r, "Message models compared", "model_comparison.rows", cols(col("model"), "n_parameters", "ephemeris_clock_bits", "fit_interval_s", "n_messages", "stats.sisre_rms_m", "stats.sisre_orb_rms_m", "stats.sisre_max_m", col("zero_clock"), col("fits_kshana_encoding")), { wide: true, note: sisreNote }));
    out.push(table(r, "Beside the published figures", "model_comparison.liu2025_altitude_table.rows", cols(col("satellite"), "altitude_km", "inclination_deg", "kshana_sisre_orb_rms_m", "published_sisre_m", "ratio"), { wide: true }));
    out.push(kv(r, "Published comparison", "model_comparison.liu2025_altitude_table", ["source", "label", "arc_s", "arcs_per_altitude", "why_not_validated"], { wide: true }));
  }
  if (r.midpass_update) {
    const m = r.midpass_update;
    out.push({ type: "chips", title: "Continuity across message switches", items: [{ path: "midpass_update.continuity_pass", pass: m.continuity_pass === true, label: "largest range jump against the threshold" }] });
    out.push(lineOf(r, "User range error through the pass", "midpass_update.range_error_series", "t_s", [{ key: "range_error_m", label: "range error" }], { xLabel: "time (s)", yLabel: "range error (m)", opts: { vlines: (m.switches || []).map((s) => ({ x: s.t_s, label: `message switch, issue of data ${s.iod_old} to ${s.iod_new}` })) },
      note: "Each rule is a switch to a newer message in the middle of the pass." }));
    out.push(table(r, "Message switches", "midpass_update.switches", cols("t_s", "iod_old", "iod_new", "elevation_deg", "range_jump_m", "worst_case_range_jump_m", "pos_jump_m", "clock_jump_m"), { wide: true, note: "IOD is the issue of data: the message's serial number." }));
    out.push(kv(r, "Mid-pass update", "midpass_update", ["threshold_m", "max_range_jump_m", "max_worst_case_range_jump_m", "fit_interval_s", "update_period_s"]));
    out.push(kv(r, "Pass", "midpass_update.pass"));
  }
  if (r.encode_decode) {
    const e = r.encode_decode;
    out.push({ type: "chips", title: "Frame checks", items: [{ path: "encode_decode.corrupted_frame_rejected", pass: e.corrupted_frame_rejected === true, label: "a corrupted frame is rejected" }] });
    out.push(kv(r, "Encoded frame", "encode_decode", ["model", "frame_bytes", "payload_bits", "ephemeris_clock_bits", "crc24q", "crc24q_check_value_123456789", "csv_schema"]));
    out.push(kv(r, "Round trips", "encode_decode", ["round_trip_max_pos_m", "quantised_max_pos_m", "quantised_max_clock_m", "rinex_round_trip_max_pos_m", "rinex_round_trip_max_clock_m", "csv_round_trip_max_pos_m", "sisre_exact_rms_m", "sisre_quantised_rms_m"]));
    out.push({ type: "mono", title: "Frame, hexadecimal", path: "encode_decode.frame_hex", wrap: true, wide: true, note: "The engine's own documented binary frame, closed by a 24-bit cyclic redundancy check (CRC-24Q)." });
    const fields = [];
    (e.field_table || []).forEach((b, i) => (b.fields || []).forEach((_, j) => fields.push({ path: `encode_decode.field_table[${i}].fields[${j}]`, label: b.block })));
    if (fields.length) out.push({ type: "table", title: "Field table", rows: fields, rowHead: "Block", wide: true, cols: cols(col("name", { label: "Field" }), "bits", "lsb", col("unit"), col("signed")) });
    out.push(table(r, "Quantisation budget", "encode_decode.quantisation_budget", cols(col("field"), "bits", "lsb", col("unit"), "half_lsb_pos_m", "half_lsb_clock_m"), { wide: true, note: "What half a least-significant bit (LSB) of each field costs in position and in clock, as range." }));
    out.push({ type: "mono", title: "RINEX-style record", path: "encode_decode.rinex_text", wide: true, note: "A Receiver Independent Exchange Format (RINEX) 4 style record. The LEO record types are a Kshana extension, as the header says." });
    out.push(kv(r, "Over the message sequence", "encode_decode.sequence_stats"));
  }
  out.push(kv(r, "Orbit", "orbit"));
  out.push(kv(r, "Message", "message_config"));
  out.push(kv(r, "SISRE weights", "sisre_weights"));
  out.push(list(r, "Validated", "verification.validated", { wide: true }));
  out.push(list(r, "Modelled", "verification.modelled", { wide: true }));
  out.push(list(r, "Limitations", "limitations", { wide: true }));
  out.push(labelPanel(r));
  return clean(out);
}

// ---------------------------------------------------------------- LEO positioning (leo-pvt, leo-ppp, ntn-positioning)

function leoPvtPanels(r) {
  const out = [];
  if (r.joint) {
    out.push(lineOf(r, "Position error: GNSS, LEO and the fused fix", "joint.epochs", "t_s", [{ key: "error_gnss_m", label: "GNSS only" }, { key: "error_leo_m", label: "LEO only" }, { key: "error_fused_m", label: "fused" }], { xLabel: "time (s)", yLabel: "3-D position error (m)" }));
    out.push(lineOf(r, "Geometry: position dilution of precision", "joint.epochs", "t_s", [{ key: "pdop_gnss", label: "GNSS only" }, { key: "pdop_fused", label: "fused" }], { xLabel: "time (s)", yLabel: "PDOP", opts: { h: 280 } }));
    out.push({ type: "table", title: "GNSS, LEO and fused", rows: ["gnss", "leo", "fused"].filter((k) => r.joint[k]).map((k) => ({ path: `joint.${k}`, label: k === "gnss" ? "GNSS only" : k === "leo" ? "LEO only" : "Fused" })), rowHead: "Solution", cols: cols("availability", "median_pdop", "median_sigma_3d_m", "rms_error_3d_m"), wide: true });
    out.push(lineOf(r, "Geometry as LEO satellites are added", "joint.dop_sweep", "n_leo", [{ key: "median_pdop", label: "PDOP" }, { key: "median_hdop", label: "HDOP" }, { key: "median_vdop", label: "VDOP" }], { xLabel: "LEO satellites added to the fix", yLabel: "median dilution of precision", xName: "LEO satellites", xUnit: "", opts: { h: 280 } }));
    out.push(kv(r, "Joint fix", "joint", ["fraction_epochs_with_leo"]));
  }
  if (r.doppler) {
    out.push(kv(r, "Doppler-only fix", "doppler", ["horizontal_error_m", "error_3d_m", "sigma_enu_m", "height_sigma_m", "n_obs", "n_sats", "weighted_rms", "drift_error_mps", "estimated_velocity"]));
    out.push(lineOf(r, "Fix quality against observation window", "doppler.windows", "window_s", [{ key: "horizontal_error_m", label: "horizontal error" }, { key: "sigma_horizontal_m", label: "predicted horizontal sigma" }], { xLabel: "observation window (s)", yLabel: "metres", xName: "window", opts: { logY: true } }));
    out.push(table(r, "Observation windows", "doppler.windows", cols("window_s", "n_obs", "n_sats", "horizontal_error_m", "sigma_horizontal_m", "error_3d_m"), { wide: true }));
    out.push(table(r, "One pass alone", "doppler.single_pass", cols("cross_track_offset_km", "max_elevation_deg", "pass_duration_s", "n_obs", "sigma_along_m", "sigma_cross_m", "sigma_up_m"), { wide: true, note: "A single pass fixes the along-track direction far better than the cross-track one." }));
    out.push(table(r, "Doppler envelopes", "doppler.envelopes", cols(col("system"), "in_run.max_doppler_hz", "in_run.max_doppler_rate_hz_s", "overhead_pass.max_doppler_hz", "overhead_pass.max_doppler_rate_hz_s"), { wide: true }));
  }
  if (r.timing) {
    const rows = r.timing.rows || [];
    const at0 = rows.map((x, i) => ({ x, i })).filter((o) => o.x.cn0_offset_db === Math.max(...rows.map((y) => y.cn0_offset_db)));
    const series = at0.map((o, k) => ({ label: o.x.clock, color: color(k), points: o.x.series.map((p) => [p.t_s, p.in_view ? p.error_ns : null]), path: `timing.rows[${o.i}].series[].error_ns`, n: o.x.series.length }));
    if (series.length) out.push({ type: "line", title: "Time error by receiver clock", wide: true, model: { title: "Time error", series, xLabel: "time (s)", yLabel: "time error (ns)", unit: "ns", outages: [] }, opts: {}, src: series.map((s) => ({ path: s.path, n: s.n })),
      note: "Drawn at the strongest signal level of the run. A gap is a stretch with no satellite in view." });
    out.push(table(r, "Time transfer by clock and signal level", "timing.rows", cols(col("clock"), "cn0_offset_db", "stats.rms_s", "stats.p95_s", "stats.max_abs_s", "stats.fraction_in_view", "stats.longest_gap_s", "stats.rms_normalised"), { wide: true }));
    out.push(kv(r, "Time scale", "timing", ["utc_offset_s", "utc_sigma_s", "utc_time_of_day_s", "median_measurement_sigma_s"]));
  }
  if (r.polar) {
    out.push(lineOf(r, "Geometry against latitude", "polar.rows", "lat_deg", [{ key: "gnss.median_pdop", label: "GNSS only" }, { key: "fused.median_pdop", label: "GNSS and LEO" }, { key: "leo.median_pdop", label: "LEO only" }], { xLabel: "latitude (°)", yLabel: "median PDOP", xName: "latitude", xUnit: "°" }));
    out.push(lineOf(r, "Satellites in view against latitude", "polar.rows", "lat_deg", [{ key: "gnss.mean_in_view", label: "GNSS" }, { key: "leo.mean_in_view", label: "LEO" }, { key: "fused.mean_in_view", label: "both" }], { xLabel: "latitude (°)", yLabel: "mean satellites in view", xName: "latitude", xUnit: "°", opts: { h: 280 } }));
    out.push(table(r, "By latitude", "polar.rows", cols("lat_deg", "gnss.availability", "gnss.median_pdop", "leo.availability", "leo.mean_in_view", "fused.availability", "fused.median_pdop", "fused.median_vdop"), { wide: true }));
  }
  out.push(table(r, "Systems", "systems", cols(col("name", { label: "System" }), col("role"), "n_satellites", "mean_altitude_km", "carrier_hz", "sisre_m", "sigma_pr_30deg_m", "sigma_range_rate_mps", col("clock"), col("presets")), { wide: true,
    note: "SISRE is the signal-in-space range error assumed for each system's broadcast orbit and clock." }));
  out.push(kv(r, "Run", "", ["mode", "duration_s", "step_s", "user_lat_deg", "user_lon_deg"]));
  out.push(labelPanel(r));
  return clean(out);
}

function leoPppPanels(r) {
  const cases = r.cases || [];
  const mk = (key, title, thr) => {
    const series = cases.map((c, i) => (Array.isArray(c.t_min) && Array.isArray(c[key]) ? { label: c.name, color: color(i), points: c.t_min.map((t, k) => [t, c[key][k]]), path: `cases[${i}].${key}`, n: c.t_min.length } : null)).filter(Boolean);
    return series.length ? { type: "line", title, wide: true, model: { title, series, xLabel: "time since the start (min)", yLabel: "median error (m)", unit: "m", threshold: isNum(thr) ? thr : null, thresholdLabel: "convergence criterion", xName: "t", xUnit: "min", outages: [] }, opts: { logY: false }, src: series.map((s) => ({ path: s.path, n: s.n })) } : null;
  };
  return clean([
    mk("median_horizontal_error_m", "Convergence: median horizontal error", r.criterion_horizontal_m),
    mk("median_vertical_error_m", "Convergence: median vertical error", r.criterion_vertical_m),
    table(r, "Cases", "cases", cols(col("name", { label: "Case" }), "n_leo", "mean_sats", "median_convergence_min", "fraction_converged", "nees_mean", "nees_fraction_in_band"), { wide: true,
      note: "Precise point positioning (PPP) converges when the error stays under the criterion. NEES is the normalised estimation error squared, a filter-consistency check." }),
    table(r, "Beside the published speed-up", "li_2019", cols("n_leo", "modelled_min", "published_min", "modelled_ratio", "published_ratio"), { wide: true }),
    kv(r, "Run", "", ["n_gnss", "runs_per_case", "duration_s", "step_s", "criterion_horizontal_m", "criterion_vertical_m", "nees_band"]),
    kv(r, "Filter noise", "noise"),
    labelPanel(r),
  ]);
}

function ntnPanels(r) {
  return clean([
    table(r, "Positioning by signal bandwidth", "signals", cols(col("name", { label: "Signal" }), "bandwidth_hz", "rms_bandwidth_hz", "range_sigma_zenith_m", "range_sigma_mask_m", "median_pdop", "toa_availability", "toa_median_sigma_3d_m", "toa_rms_error_3d_m"), { wide: true,
      note: "Time-of-arrival (TOA) ranging on a non-terrestrial network (NTN) downlink: a wider signal ranges more sharply." }),
    kv(r, "Doppler positioning from one pass", "doppler_pass"),
    kv(r, "Run", "", ["carrier_hz", "n_satellites", "mean_in_view", "cn0_dbhz", "integration_s", "doppler_integration_s", "doppler_sigma_zenith_hz", "sync_error_m"]),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- LEO end-to-end chain

function leoChainPanels(r) {
  return clean([
    table(r, "What each stage hands to the next", "handoffs", cols(col("from"), col("to"), col("quantity"), "value", col("unit"), col("target")), { wide: true,
      note: "The chain runs the signal, pass, navigation-message, positioning and precise-positioning stages in order. Each row is a number one stage computed and the next one used." }),
    lineCols(r, "Pass: C/N0 of the whole signal and of the tracked component", "series.t_s", [{ label: "whole signal", path: "series.cn0_dbhz" }, { label: "tracked component", path: "series.tracked_cn0_dbhz" }], { xLabel: "time (s)", yLabel: "C/N0 (dB-Hz)", unit: "dB-Hz" }),
    lineCols(r, "Pass: code-tracking jitter", "series.t_s", [{ label: "code jitter", path: "series.code_jitter_m" }], { xLabel: "time (s)", yLabel: "code jitter (m)", unit: "m", opts: { h: 260 } }),
    lineCols(r, "Pass: Doppler", "series.t_s", [{ label: "Doppler", path: "series.doppler_hz", color: "var(--s-orb)" }], { xLabel: "time (s)", yLabel: "Doppler shift (Hz)", unit: "Hz", opts: { h: 260 } }),
    lineCols(r, "Positioning: GNSS alone against the fused fix", "fusion.epochs.t_s", [{ label: "GNSS only", path: "fusion.epochs.error_gnss_m" }, { label: "fused", path: "fusion.epochs.error_fused_m" }], { xLabel: "time (s)", yLabel: "3-D position error (m)", unit: "m" }),
    { type: "table", title: "GNSS, LEO and fused", rows: ["gnss", "leo", "fused"].filter((k) => resolve(r, `fusion.${k}`)).map((k) => ({ path: `fusion.${k}`, label: k === "gnss" ? "GNSS only" : k === "leo" ? "LEO only" : "Fused" })), rowHead: "Solution", cols: cols("availability", "median_pdop", "median_sigma_3d_m", "rms_error_3d_m"), wide: true },
    table(r, "Precise point positioning", "ppp.cases", cols(col("name", { label: "Case" }), "n_leo", "median_convergence_min", "fraction_converged", "nees_mean"), { wide: true }),
    kv(r, "Signal stage", "signal"),
    kv(r, "Pass stage", "pass"),
    kv(r, "Navigation-message stage", "navmsg"),
    table(r, "Systems in the fix", "fusion.systems", cols(col("name", { label: "System" }), col("role"), "n_satellites", "sisre_m", "sigma_pr_30deg_m", "cn0_dbhz"), { wide: true }),
    list(r, "Limitations", "limitations", { wide: true }),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- lunar laser ranging datum (recorded natively)

function llrPanels(r) {
  const params = rowsOf(r, "helmert.parameters");
  const pk = params.length ? Object.keys(resolve(r, "helmert.parameters[0]")) : [];
  const rk = (resolve(r, "reflectors[0]") && Object.keys(resolve(r, "reflectors[0]")).filter((k) => typeof r.reflectors[0][k] !== "object")) || [];
  const sk = (resolve(r, "data.stations[0]") && Object.keys(resolve(r, "data.stations[0]")).filter((k) => typeof r.data.stations[0][k] !== "object")) || [];
  return clean([
    kv(r, "Datum accuracy", "datum_accuracy"),
    kv(r, "Range residuals", "residuals"),
    params.length ? { type: "table", title: "Helmert transform parameters", rows: params, cols: pk.map((k) => col(k)), wide: true, note: "A Helmert transform is the seven-parameter shift, rotation and scale between two reference frames." } : null,
    kv(r, "Helmert fit", "helmert", ["rank", "defect", "condition_number", "rel_tol", "parameter_order"]),
    table(r, "Retroreflectors", "reflectors", rk.slice(0, 9).map((k) => col(k)), { wide: true }),
    table(r, "Ranging stations", "data.stations", sk.slice(0, 8).map((k) => col(k)), { wide: true }),
    kv(r, "The archived campaign", "data", ["normal_points_parsed", "normal_points_used", "span_days", "median_sigma_range_mm", "median_bin_rms_ps", "median_raw_ranges_per_point", "skipped_station_not_in_catalogue", "normal_point_source", "station_source", "reflector_source"], { wide: true }),
    kv(r, "Against a simulated campaign", "comparison"),
    kv(r, "Sensitivity to a line-of-sight tilt", "sensitivity"),
    kv(r, "Reflector information", "reflector_information"),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- the catalogue of capability views

// tab: the id used in ?tab=; stage: the interactive drawing above the panels (stages.mjs).
export const CAPABILITIES = {
  "spectrum": { tab: "spectrum", label: "Spectrum", c: "var(--int)", stage: "spectrum", panels: spectrumPanels },
  "solar-system": { tab: "solar", label: "Solar system", c: "var(--orb)", stage: "solar", panels: solarPanels },
  "body-pnt": { tab: "body-pnt", label: "Relay positioning", c: "var(--orb)", stage: null, panels: bodyPntPanels },
  "constellation-design": { tab: "coverage", label: "Coverage", c: "var(--orb)", stage: "coverage", panels: coveragePanels },
  "campaign": { tab: "campaign", label: "Campaign", c: "var(--itg)", stage: "timeline", panels: campaignPanels },
  "leo-signal": { tab: "leo-signal", label: "Signal design", c: "var(--spf)", stage: null, panels: leoSignalPanels },
  "leo-pass": { tab: "leo-pass", label: "Pass & link", c: "var(--tim)", stage: null, panels: leoPassPanels },
  "leo-navmsg": { tab: "leo-navmsg", label: "Navigation message", c: "var(--nav)", stage: null, panels: leoNavmsgPanels },
  "leo-pvt": { tab: "leo-positioning", label: "Positioning", c: "var(--itg)", stage: null, panels: leoPvtPanels },
  "leo-ppp": { tab: "leo-positioning", label: "Positioning", c: "var(--itg)", stage: null, panels: leoPppPanels },
  "ntn-positioning": { tab: "leo-positioning", label: "Positioning", c: "var(--itg)", stage: null, panels: ntnPanels },
  "leo-pnt-chain": { tab: "leo-chain", label: "End-to-end chain", c: "var(--tim)", stage: "chain", panels: leoChainPanels },
  "lunar-llr-datum": { tab: "llr-datum", label: "Laser-ranging datum", c: "var(--ink-2)", stage: null, panels: llrPanels },
};

// The kind a run was made with: the result's own `kind` when it states one, else the scenario's.
export function kindOfRun(result, toml = "") {
  if (result && typeof result.kind === "string" && CAPABILITIES[result.kind]) return result.kind;
  const k = readScalar(toml, "kind");
  return k ? k.replace(/^"|"$/g, "") : (result && typeof result.kind === "string" ? result.kind : null);
}

// The capability view of a run, or null when its kind has none (the older kinds use the
// views in views.mjs). { kind, tab, label, c, stage, panels }.
export function capabilityView(result, toml = "") {
  if (!result || typeof result !== "object") return null;
  const kind = kindOfRun(result, toml);
  const cap = kind && CAPABILITIES[kind];
  if (!cap) return null;
  let stage = cap.stage;
  if (kind === "campaign" && !result.timeline) stage = null;
  return { kind, tab: cap.tab, label: cap.label, c: cap.c, stage, panels: cap.panels(result) };
}

// Every distinct capability tab: [{ tab, label, c }].
/// The views (tab ids) a run has, in tab order. `svg` is the engine's own chart, `native` the
/// native engine's index entry for the file ({ animation, report }) or null; `sweep` and
/// `compare` are the two views that depend on the session (a live engine that can sweep the
/// scenario; a pinned run). This is the one rule: the Studio builds its tab row from it and
/// tools_links.mjs lists the deep links a site may use from it.
export function resultTabs(result, toml = "", { svg = "", native = null, sweep = false, compare = false } = {}) {
  const out = ["overview"];
  const cap = capabilityView(result, toml);
  if (cap && cap.panels.length) out.push(cap.tab);
  if (seriesModel(result, toml) || (svg && svg.length > 200)) out.push("timeseries");
  if (signalModel(result, toml)) out.push("signal");
  if (holdoverModel(result)) out.push("holdover");
  if (masksModel(result)) out.push("masks");
  if (adevCurves(result).length) out.push("stability");
  if (orbitTrackKm(result)) out.push("orbit");
  if (groundTrack(result)) out.push("ground");
  if (sweep) out.push("sweep");
  if (compare) out.push("compare");
  if (native && native.animation) out.push("animation");
  if (native && native.report) out.push("report");
  out.push("exports", "json");
  return out;
}

/// The most telling first view for a kind of result (the tab a run opens on when the link names none).
export function preferredTab(result, toml = "") {
  const cap = capabilityView(result, toml);
  if (cap && cap.panels.length) return cap.tab;
  if (signalModel(result, toml)) return "signal";
  if (masksModel(result)) return "masks";
  if (holdoverModel(result)) return "holdover";
  if (seriesModel(result, toml)) return "timeseries";
  if (groundTrack(result)) return "ground";
  return "overview";
}

export function capabilityTabs() {
  const seen = new Map();
  for (const c of Object.values(CAPABILITIES)) if (!seen.has(c.tab)) seen.set(c.tab, { tab: c.tab, label: c.label, c: c.c });
  return [...seen.values()];
}

// ---------------------------------------------------------------- headline figures

const numKeys = (r, base, max = 8) => { const o = resolve(r, base); return o && typeof o === "object" ? Object.keys(o).filter((k) => isNum(o[k])).slice(0, max).map((k) => ({ path: `${base}.${k}` })) : []; };
const each = (r, base, max, fn) => (Array.isArray(resolve(r, base)) ? resolve(r, base).slice(0, max).map((x, i) => fn(x, i)).filter(Boolean) : []);
const FIGURES = {
  "spectrum": (r) => [{ path: "receiver.tracking_threshold_dbhz", label: "Tracking threshold" }, { path: "receiver.noise_density_dbw_per_hz", label: "Noise floor" },
    ...each(r, "timeline.bands", 6, (b, i) => ({ path: `timeline.bands[${i}].min_cn0_dbhz`, label: "Lowest C/N0", sub: b.name }))],
  "solar-system": (r) => [{ path: "n_bodies", label: "Bodies" }, ...each(r, "links", 4, (l, i) => ({ path: `links[${i}].one_way_light_time_s`, label: "Light time, one way", sub: `${l.from} to ${l.to}` }))],
  "body-pnt": (r) => numKeys(r, "fom"),
  "constellation-design": () => [{ path: "total_satellites", label: "Satellites" }, { path: "global.availability_pct", label: "Availability", unit: "%" }, { path: "global.pdop.median", label: "Median PDOP" }, { path: "global.pdop.p95", label: "PDOP, 95th percentile" }, { path: "global.mean_visible", label: "Mean in view" }, { path: "global.min_visible", label: "Fewest in view" }, { path: "global.worst_site_availability_pct", label: "Worst site availability", unit: "%" }],
  "campaign": (r) => [{ path: "reproducibility.runs_total", label: "Member runs" }, { path: "timeline.duration_s", label: "Mission length" }, { path: "monte_carlo.runs", label: "Monte Carlo runs" }, { path: "sweep.runs", label: "Sweep runs" },
    ...Object.keys((r.monte_carlo && r.monte_carlo.metrics) || {}).slice(0, 3).flatMap((k) => [{ path: `monte_carlo.metrics.${k}.mean`, label: "Mean", sub: keyLabel(k), unit: r.monte_carlo.metrics[k].unit }, { path: `monte_carlo.metrics.${k}.std`, label: "Standard deviation", sub: keyLabel(k), unit: r.monte_carlo.metrics[k].unit }]),
    ...Object.keys((r.compose && r.compose.combined) || {}).slice(0, 3).flatMap((k) => [{ path: `compose.combined.${k}.min`, label: "Lowest", sub: keyLabel(k), unit: r.compose.combined[k].unit }, { path: `compose.combined.${k}.max`, label: "Highest", sub: keyLabel(k), unit: r.compose.combined[k].unit }])],
  "leo-signal": (r) => each(r, "signals", 4, (s, i) => [{ path: `signals[${i}].tx_bandwidth_hz`, label: "Transmit bandwidth", sub: s.name }, { path: `signals[${i}].jammer_tolerance.wideband_js_max_db`, label: "Wideband J/S tolerated", sub: s.name }]).flat(),
  "leo-pass": (r) => [...each(r, "satellites", 2, (s, i) => [{ path: `satellites[${i}].pass.max_elevation_deg`, label: "Peak elevation", sub: s.id }, { path: `satellites[${i}].pass.duration_above_mask_s`, label: "Time above the mask", sub: s.id }]).flat(), ...numKeys(r, "comparison", 4), { path: "spoof.first.delay_s", label: "First detection after onset" }],
  "leo-navmsg": (r) => [...each(r, "model_comparison.rows", 4, (x, i) => ({ path: `model_comparison.rows[${i}].stats.sisre_rms_m`, label: "SISRE, root mean square", sub: x.model })),
    ...each(r, "fit_interval_trade.rows", 4, (x, i) => ({ path: `fit_interval_trade.rows[${i}].sisre_rms_m`, label: "SISRE, root mean square", sub: `${x.model}, ${fmt(x.fit_interval_s)} s fit` })),
    { path: "midpass_update.max_range_jump_m", label: "Largest range jump" }, { path: "midpass_update.threshold_m", label: "Jump threshold" },
    { path: "encode_decode.frame_bytes", label: "Frame length", unit: "bytes" }, { path: "encode_decode.payload_bits", label: "Payload", unit: "bits" }, { path: "encode_decode.quantised_max_pos_m", label: "Quantisation, position" }, { path: "encode_decode.sisre_quantised_rms_m", label: "SISRE after quantisation" }],
  "leo-pvt": (r) => [{ path: "joint.gnss.rms_error_3d_m", label: "3-D error", sub: "GNSS only" }, { path: "joint.fused.rms_error_3d_m", label: "3-D error", sub: "fused" }, { path: "joint.gnss.median_pdop", label: "Median PDOP", sub: "GNSS only" }, { path: "joint.fused.median_pdop", label: "Median PDOP", sub: "fused" },
    { path: "doppler.horizontal_error_m", label: "Horizontal error", sub: "Doppler only" }, { path: "doppler.error_3d_m", label: "3-D error", sub: "Doppler only" }, { path: "doppler.n_sats", label: "Satellites used" },
    ...each(r, "timing.rows", 4, (x, i) => ({ path: `timing.rows[${i}].stats.rms_s`, label: "Time error, root mean square", sub: `${x.clock}, ${fmt(x.cn0_offset_db)} dB` })),
    ...(Array.isArray(resolve(r, "polar.rows")) && r.polar.rows.length ? [{ path: `polar.rows[${r.polar.rows.length - 1}].gnss.median_pdop`, label: "Median PDOP", sub: `GNSS only, latitude ${fmt(r.polar.rows[r.polar.rows.length - 1].lat_deg)}°` }, { path: `polar.rows[${r.polar.rows.length - 1}].fused.median_pdop`, label: "Median PDOP", sub: `GNSS and LEO, latitude ${fmt(r.polar.rows[r.polar.rows.length - 1].lat_deg)}°` }] : [])],
  "leo-ppp": (r) => each(r, "cases", 6, (c, i) => ({ path: `cases[${i}].median_convergence_min`, label: "Median convergence", sub: c.name, unit: "min" })),
  "ntn-positioning": (r) => [...each(r, "signals", 4, (s, i) => ({ path: `signals[${i}].toa_rms_error_3d_m`, label: "3-D error, time of arrival", sub: s.name })), ...numKeys(r, "doppler_pass", 2)],
  "leo-pnt-chain": (r) => [{ path: "pass.peak_tracked_cn0_dbhz", label: "Peak tracked C/N0" }, { path: "navmsg.sisre_rms_m", label: "SISRE, root mean square" }, { path: "fusion.gnss.rms_error_3d_m", label: "3-D error", sub: "GNSS only" }, { path: "fusion.fused.rms_error_3d_m", label: "3-D error", sub: "fused" },
    ...each(r, "ppp.cases", 3, (c, i) => ({ path: `ppp.cases[${i}].median_convergence_min`, label: "Median convergence", sub: c.name, unit: "min" }))],
  "lunar-llr-datum": (r) => [...numKeys(r, "datum_accuracy", 4), ...numKeys(r, "residuals", 4)],
};

// Headline figures of a capability run: [{ path, label, sub, value, text, unit, note }], at most
// `max`, each read from the result at `path`. [] when the kind has no capability view.
export function capabilityFigures(result, toml = "", max = 8) {
  const kind = kindOfRun(result, toml);
  const make = kind && FIGURES[kind];
  if (!make || !result) return [];
  const out = [];
  for (const f of make(result)) {
    const v = resolve(result, f.path);
    if (!isNum(v)) continue;
    const u = unitOf(result, f.path);
    const q = quantity(v, f.unit !== undefined ? f.unit : u ? u.unit : "");
    out.push({ path: f.path, label: f.label || keyLabel(f.path), sub: f.sub || "", value: v, text: q.text, unit: q.unit, note: (u && u.note) || "" });
    if (out.length >= max) break;
  }
  return out;
}

// ---------------------------------------------------------------- guided sliders

// [field id (params.mjs numericFields), label, hint, min, max, step]. A slider is offered only
// when the scenario has that field; its range widens to hold the scenario's own value.
const GUIDED = {
  "spectrum": [
    ["receiver::tracking_threshold_dbhz", "Tracking threshold (dB-Hz)", "a band under this carrier-to-noise density has lost lock", 15, 40, 1],
    ["receiver::noise_figure_db", "Receiver noise figure (dB)", "raises the noise floor under every band", 0, 8, 0.5],
    ["jammers[0]::eirp_dbw", "First jammer power (dBW)", "equivalent isotropically radiated power of the first jammer", -40, 20, 1],
    ["jammers[0]::received_power_dbw", "First jammer received power (dBW)", "power of the first jammer at the receiver", -150, -80, 1],
    ["jammers[0]::range_m", "First jammer range (m)", "distance from the first jammer to the receiver", 10, 5000, 10],
    ["jammers[0]::bandwidth_mhz", "First jammer bandwidth (MHz)", "how wide the first jammer spreads its power", 1, 60, 1],
    ["::duration_s", "Duration (s)", "length of the timeline", 20, 300, 10],
  ],
  "solar-system": [["::track_points", "Points per orbit track", "how finely each orbit is sampled for the drawing", 30, 360, 10]],
  "body-pnt": [
    ["constellation::planes", "Relay planes", "orbital planes of the navigation relays", 1, 8, 1],
    ["constellation::sats_per_plane", "Relays per plane", "satellites in each plane", 1, 12, 1],
    ["constellation::altitude_km", "Relay altitude (km)", "height of the relay orbits above the body", 500, 30000, 100],
    ["constellation::inclination_deg", "Relay inclination (°)", "tilt of the relay planes", 0, 90, 1],
    ["constellation::sigma_range_m", "Relay range error (m)", "one-sigma error of a range to a relay", 0.1, 10, 0.1],
    ["earth_link::sigma_range_m", "Earth range error (m)", "one-sigma error of the two-way range from Earth", 0.1, 10, 0.1],
  ],
  "constellation-design": [
    ["::mask_deg", "Elevation mask (°)", "a satellite must be this high to count as in view", 0, 40, 1],
    ["::pdop_threshold", "PDOP threshold", "a grid point is available while its position dilution of precision is under this", 1, 10, 0.5],
    ["::grid_step_deg", "Grid step (°)", "spacing of the latitude and longitude grid", 5, 30, 5],
    ["constellation.shell[0]::altitude_km", "First shell altitude (km)", "height of the first shell's orbits", 300, 30000, 50],
    ["constellation.shell[0]::inclination_deg", "First shell inclination (°)", "tilt of the first shell's planes", 0, 100, 1],
  ],
  "campaign": [
    ["monte_carlo::runs", "Monte Carlo runs", "how many seeded runs make the ensemble", 20, 400, 20],
    ["sweep.axes[0]::start", "Sweep from", "first value of the swept parameter", -100, 100, 1],
    ["sweep.axes[0]::stop", "Sweep to", "last value of the swept parameter", -100, 100, 1],
    ["sweep.axes[0]::steps", "Sweep steps", "how many values are run", 2, 30, 1],
    ["compose.shared[0]::value", "Shared condition", "the value every member runs under", -40, 40, 1],
    ["timeline::step_s", "Timeline step (s)", "spacing of the shared mission time grid", 5, 60, 5],
    ["phases[0]::duration_s", "First phase length (s)", "how long the first phase lasts", 60, 3600, 60],
  ],
  "leo-signal": [
    ["receiver::reference_cn0_dbhz", "Reference C/N0 (dB-Hz)", "signal level the tracking figures are quoted at", 30, 60, 1],
    ["receiver::loop_bandwidth_hz", "Loop bandwidth (Hz)", "code tracking loop noise bandwidth", 0.1, 10, 0.1],
    ["trade::slant_tec_tecu", "Slant electron content (TECU)", "ionosphere along the path, in total electron content units", 5, 150, 5],
    ["trade::slant_range_km", "Slant range (km)", "distance to the satellite in the band trade", 500, 3000, 50],
    ["acquisition::altitude_km", "Orbit altitude (km)", "sets the Doppler range a cold search must cover", 300, 1500, 10],
  ],
  "leo-pass": [
    ["user::mask_deg", "Elevation mask (°)", "a satellite must be this high to be used", 0, 30, 1],
    ["satellite[0]::max_elevation_deg", "Peak elevation of the pass (°)", "how high the satellite climbs", 10, 90, 1],
    ["user::lat_deg", "User latitude (°)", "where the user stands", -80, 80, 1],
    ["spoofer::offset_m", "Spoofed offset (m)", "how far the spoofer moves the computed position", 5, 200, 5],
    ["spoofer::onset_s", "Spoofing starts (s)", "when the spoofer captures the receiver", 60, 1500, 30],
    ["iot::active_power_mw", "Receiver power when awake (mW)", "drawn while acquiring and tracking", 5, 100, 1],
  ],
  "leo-navmsg": [
    ["orbit::altitude_km", "Orbit altitude (km)", "height of the satellite whose message is fitted", 400, 1500, 10],
    ["orbit::inclination_deg", "Orbit inclination (°)", "tilt of that orbit", 0, 100, 0.1],
    ["message::fit_interval_s", "Fit interval (s)", "arc one message is fitted over", 60, 1200, 30],
    ["message::update_period_s", "Update period (s)", "how often a new message is issued", 60, 1200, 30],
    ["orbit::gravity_degree", "Gravity field degree", "detail of the truth orbit's gravity model", 2, 40, 1],
  ],
  "leo-pvt": [
    ["user::lat_deg", "User latitude (°)", "where the receiver stands", -80, 80, 1],
    ["system[0]::sisre_m", "First system range error (m)", "signal-in-space range error of the first system", 0.05, 5, 0.05],
    ["system[1]::sisre_m", "Second system range error (m)", "signal-in-space range error of the second system", 0.05, 5, 0.05],
    ["system[0]::mask_deg", "Elevation mask (°)", "a satellite of the first system must be this high", 0, 30, 1],
    ["system[0]::sigma_doppler_hz", "Doppler error (Hz)", "one-sigma Doppler measurement error", 0.1, 50, 0.1],
    ["joint::max_leo_sweep", "LEO satellites in the sweep", "how many low-orbit satellites the geometry sweep adds", 2, 20, 1],
    ["::duration_s", "Duration (s)", "length of the run", 300, 7200, 300],
  ],
  "leo-ppp": [
    ["::duration_s", "Duration (s)", "length of each filter run", 600, 3600, 300],
    ["::runs", "Runs per case", "filter runs averaged for each case (more is slower)", 1, 8, 1],
    ["gnss[0]::mask_deg", "Elevation mask (°)", "a satellite of the first system must be this high", 0, 20, 1],
  ],
  "ntn-positioning": [
    ["signal[0]::bandwidth_hz", "First signal bandwidth (Hz)", "occupied bandwidth of the first reference signal", 180e3, 20e6, 180e3],
    ["::integration_s", "Integration time (s)", "how long the receiver integrates for one range", 0.01, 1, 0.01],
    ["::sync_error_m", "Network synchronisation error (m)", "timing error between satellites, as range", 0, 10, 0.5],
    ["system[0]::mask_deg", "Elevation mask (°)", "a satellite must be this high to be used", 0, 30, 1],
  ],
  "leo-pnt-chain": [
    ["::od_sisre_m", "Orbit determination error (m)", "the part of the range error the message cannot remove", 0.05, 2, 0.05],
    ["pass.satellite[0]::altitude_km", "Satellite altitude (km)", "height of the chain's satellite", 400, 1500, 10],
    ["pass.satellite[0]::max_elevation_deg", "Peak elevation of the pass (°)", "how high the satellite climbs", 10, 90, 1],
    ["pass.satellite.band[0]::eirp_dbw", "Transmit power (dBW)", "equivalent isotropically radiated power of the band", -10, 30, 1],
    ["navmsg.message::fit_interval_s", "Fit interval (s)", "arc one message is fitted over", 60, 1200, 30],
  ],
};

// Guided sliders for a capability kind: [{ id, label, hint, min, max, step, field }] for the
// entries whose field the scenario has (fields = params.mjs numericFields(toml)), at most six.
export function guidedFor(kind, fields) {
  const out = [];
  for (const [id, label, hint, min, max, step] of GUIDED[kind] || []) {
    const field = fields.find((f) => f.id === id);
    if (!field) continue;
    out.push({ id, label, hint, step, field, min: Math.min(min, field.value), max: Math.max(max, field.value) });
    if (out.length === 6) break;
  }
  return out;
}
export const hasCapability = (kind) => !!CAPABILITIES[kind];
