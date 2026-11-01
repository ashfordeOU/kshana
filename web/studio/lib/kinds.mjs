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
import { own } from "./own.mjs";
import { t } from "./t.mjs";

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
  if (typeof value === "boolean") return value ? t("js-kind-yes", "yes") : t("js-kind-no", "no");
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

// "label (unit)" for an axis: the label and the unit are separate; the pattern is one message.
const withUnit = (label, unit) => (unit ? t("js-kind-label-with-unit", "{ $label } ({ $unit })", { label, unit }) : label);
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
    model: { title, series, xLabel: extra.xLabel || withUnit(axisLabel(xKey), ux && ux.unit !== "1" ? ux.unit : ""), yLabel: extra.yLabel || withUnit(axisLabel(ys[0].key), unit), unit, threshold: extra.threshold ?? null, thresholdLabel: extra.thresholdLabel, xName: extra.xName, xUnit: extra.xUnit, outages: [] },
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
    model: { title, series, xLabel: extra.xLabel || withUnit(axisLabel(xPath.replace(/\[\]$/, "")), ux && ux.unit !== "1" ? ux.unit : ""), yLabel: extra.yLabel || unit, unit, threshold: extra.threshold ?? null, thresholdLabel: extra.thresholdLabel, xName: extra.xName, xUnit: extra.xUnit, outages: [] },
    opts: extra.opts || {},
    src: series.map((s) => ({ path: s.path, n: xs.length })),
    note: extra.note,
  };
}
const labelPanel = (result) => (typeof result.label === "string" ? { type: "note", title: t("js-kind-title-what-this-run-is-and", "What this run is, and is not"), path: "label", wide: true } : null);
const clean = (panels) => panels.filter(Boolean);

// ---------------------------------------------------------------- spectrum

function spectrumPanels(r) {
  const thr = resolve(r, "receiver.tracking_threshold_dbhz");
  const bandNames = (r.bands || []).map((b) => b.name);
  const sameOrder = (r.timeline && r.timeline.bands || []).every((b, i) => b.name === bandNames[i]);
  const tl = (key) => (sameOrder ? { key, label: keyLabel(key), path: (_, i) => `timeline.bands[${i}].${key}` } : null);
  return clean([
    lineCols(r, t("js-kind-title-c-n0-by-band-over", "C/N0 by band over the run"), "timeline.t_s", (r.timeline && r.timeline.bands || []).map((b, i) => ({ label: b.name, path: `timeline.bands[${i}].cn0_effective_dbhz` })),
      { threshold: isNum(thr) ? thr : null, thresholdLabel: t("js-kind-threshold-tracking-threshold", "tracking threshold"), xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-effective-c-n0-db-hz", "effective C/N0 (dB-Hz)"), unit: "dB-Hz",
        note: t("js-kind-note-c-n0-is-the-carrier", "C/N0 is the carrier-to-noise density ratio. A band under the receiver's tracking threshold has lost lock.") }),
    table(r, t("js-kind-title-bands", "Bands"), "bands", clean([col("name", { label: t("js-kind-label-band", "Band") }), col("modulation"), col("centre_hz"), col("chip_rate_hz"), col("nominal_cn0_dbhz"), tl("min_cn0_dbhz"), tl("min_cn0_t_s"), tl("first_loss_t_s"), tl("tracking_fraction"), tl("worst_js_db")]), { wide: true,
      note: t("js-kind-note-j-s-is-the-jammer", "J/S is the jammer-to-signal power ratio. Tracking fraction is the share of the run the band stays above the threshold.") }),
    table(r, t("js-kind-title-jammers", "Jammers"), "jammers", cols(col("name", { label: t("js-kind-label-jammer", "Jammer") }), "waveform", "centre_hz", "bandwidth_hz", "eirp_dbw", "range_m", "received_power_dbw", "on_s", "off_s"), { wide: true, note: t("js-kind-note-eirp-is-the-equivalent-isotropically", "EIRP is the equivalent isotropically radiated power.") }),
    r.iq ? lineCols(r, t("js-kind-title-snapshot-spectrum-welch-estimate-against", "Snapshot spectrum: Welch estimate against the model"), "iq.freq_offset_hz", [{ label: t("js-kind-label-welch-estimate-of-the-synthesised", "Welch estimate of the synthesised samples"), path: "iq.welch_dbw_per_hz" }, { label: t("js-kind-label-model", "model"), path: "iq.model_dbw_per_hz" }],
      { xLabel: t("js-kind-axis-offset-from-the-snapshot-centre", "offset from the snapshot centre (MHz)"), yLabel: t("js-kind-axis-power-spectral-density-dbw-hz", "power spectral density (dBW/Hz)"), unit: "dBW/Hz", xName: "offset", xUnit: "MHz", xScale: 1e-6,
        note: t("js-kind-note-the-engine-draws-its-spectrum", "The engine draws its spectrum model as in-phase and quadrature (IQ) samples at one instant and estimates the spectrum back from them. The same samples are the SigMF (Signal Metadata Format) export.") }) : null,
    r.iq ? kv(r, t("js-kind-title-snapshot", "Snapshot"), "iq", ["t_s", "centre_hz", "sample_rate_hz", "n_samples", "nfft", "segments", "enbw_hz", "label"]) : null,
    r.iq ? kv(r, t("js-kind-title-snapshot-against-the-model", "Snapshot against the model"), "iq.comparison") : null,
    kv(r, t("js-kind-title-receiver", "Receiver"), "receiver"),
    table(r, t("js-kind-title-cross-check-against-the-jamming", "Cross-check against the jamming kind"), "jamming_kind_cross_check", cols(col("band"), col("jammer"), "js_spectrum_db", "js_jamming_kind_db", "cn0_spectrum_dbhz", "cn0_jamming_kind_q_from_ssc_dbhz", "abs_difference_db"), { wide: true,
      note: t("js-kind-note-the-spectrum-kind-and-the", "The spectrum kind and the jamming kind compute the same link two ways; the last column is their difference.") }),
    list(r, t("js-kind-title-not-modelled", "Not modelled"), "not_modelled", { wide: true }),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- solar system and body-pnt

function solarPanels(r) {
  return clean([
    table(r, t("js-kind-title-bodies", "Bodies"), "bodies", cols(col("name", { label: t("js-kind-label-body", "Body") }), col("class"), col("parent"), "heliocentric_distance_au", col("observer_link.one_way_light_time_s", { label: r.observer ? t("js-kind-label-light-time-from-observer", "Light time from { $observer }", { observer: r.observer }) : t("js-kind-label-light-time-from-the-observer", "Light time from the observer") }), col("observer_link.sun_separation_deg", { label: t("js-kind-label-sun-separation", "Sun separation") }), "orbital_period_d", "radius_mean_m", col("label", { label: t("js-kind-label-evidence", "Evidence") }), col("method", { note: true })), { wide: true,
      note: t("js-kind-note-each-body-carries-its-own", "Each body carries its own evidence label. Light time is one way, from the observer named in the scenario.") }),
    table(r, t("js-kind-title-links", "Links"), "links", cols(col("from"), col("to"), "geometric_distance_m", "one_way_light_time_s", "two_way_light_time_s", "shapiro_delay_s", "sun_separation_deg"), { wide: true,
      note: t("js-kind-note-the-shapiro-delay-is-the", "The Shapiro delay is the extra light time from the Sun's gravity along the path.") }),
    kv(r, t("js-kind-title-epoch-and-frame", "Epoch and frame"), "", ["observer", "n_bodies", "frame", "standish_table"].filter((k) => r[k] !== undefined).concat([]), { wide: false }),
    kv(r, t("js-kind-title-epoch", "Epoch"), "epoch"),
    labelPanel(r),
  ]);
}

function bodyPntPanels(r) {
  return clean([
    lineOf(r, t("js-kind-title-position-uncertainty-relays-alone-and", "Position uncertainty: relays alone, and with the Earth link"), "epochs", "t_s", [{ key: "formal_sigma_relays_m", label: t("js-kind-label-relays-only", "relays only") }, { key: "formal_sigma_with_earth_m", label: t("js-kind-label-relays-and-earth-link", "relays and Earth link") }],
      { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-formal-position-sigma-m", "formal position sigma (m)"), note: t("js-kind-note-a-gap-is-an-epoch", "A gap is an epoch with too few relays in view for a fix.") }),
    lineOf(r, t("js-kind-title-realised-position-error", "Realised position error"), "epochs", "t_s", [{ key: "error_relays_m", label: t("js-kind-label-relays-only", "relays only") }, { key: "error_with_earth_m", label: t("js-kind-label-relays-and-earth-link", "relays and Earth link") }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-position-error-m", "position error (m)") }),
    lineOf(r, t("js-kind-title-relays-in-view", "Relays in view"), "epochs", "t_s", [{ key: "n_relays_visible", label: t("js-kind-label-relays-above-the-mask", "relays above the mask"), color: "var(--s-orb)" }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-relays", "relays"), threshold: 4, thresholdLabel: t("js-kind-threshold-4-needed-for-a-fix", "4 needed for a fix") }),
    kv(r, t("js-kind-title-figures-of-merit", "Figures of merit"), "fom"),
    kv(r, t("js-kind-title-body", "Body"), "body"),
    kv(r, t("js-kind-title-earth-link", "Earth link"), "earth_to_body"),
    kv(r, t("js-kind-title-relay-constellation", "Relay constellation"), "", ["n_relays", "relay_altitude_m", "relay_period_s", "sigma_relay_range_m", "sigma_earth_range_m", "user_kind", "earth_link_used"]),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- constellation design

function coveragePanels(r) {
  const dop = ["gdop", "pdop", "hdop", "vdop"].filter((k) => resolve(r, `global.${k}`));
  return clean([
    dop.length ? { type: "table", title: t("js-kind-title-dilution-of-precision-over-the", "Dilution of precision over the whole grid"), rows: dop.map((k) => ({ path: `global.${k}`, label: k.toUpperCase() })), cols: cols("median", "mean", "p90", "p95", "p99", "max"), rowHead: t("js-kind-rowhead-figure", "Figure"),
      note: t("js-kind-note-dilution-of-precision-dop-scales", "Dilution of precision (DOP) scales a range error into a position error: G is geometric, P position, H horizontal, V vertical. Percentiles are over every grid point and epoch.") } : null,
    kv(r, t("js-kind-title-global-coverage", "Global coverage"), "global", ["availability_pct", "fix_pct", "mean_visible", "min_visible", "worst_site_availability_pct"]),
    table(r, t("js-kind-title-constellations", "Constellations"), "constellations", cols(col("name", { label: t("js-kind-label-constellation", "Constellation") }), "satellites", "mean_visible", col("source", { note: true })), { wide: true }),
    kv(r, t("js-kind-title-inputs", "Inputs"), "inputs"),
    kv(r, t("js-kind-title-central-body", "Central body"), "body"),
    kv(r, t("js-kind-title-work-done", "Work done"), "work"),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- campaign

function campaignPanels(r) {
  const out = [];
  if (r.timeline) {
    out.push(table(r, t("js-kind-title-phases", "Phases"), "timeline.phases", cols(col("name", { label: t("js-kind-label-phase", "Phase") }), "t0_s", "t1_s", col("ended_by")), { wide: false }));
    out.push(table(r, t("js-kind-title-events", "Events"), "timeline.events", cols("t_s", col("phase"), col("label", { label: t("js-kind-label-event", "Event") }), col("alarm")), { wide: false }));
    const runs = [];
    (r.timeline.phases || []).forEach((p, i) => (p.runs || []).forEach((_, j) => runs.push({ path: `timeline.phases[${i}].runs[${j}]`, label: p.name })));
    if (runs.length) out.push({ type: "table", title: t("js-kind-title-member-runs", "Member runs"), rows: runs, rowHead: t("js-kind-rowhead-phase", "Phase"), cols: cols(col("kind"), col("scenario_hash", { hash: true }), col("result_sha256", { hash: true }), "skip_s", col("channels")), wide: true,
      note: t("js-kind-note-every-phase-is-an-ordinary", "Every phase is an ordinary scenario run. The hashes identify each member's input and its result document.") });
    out.push(table(r, t("js-kind-title-hand-offs-between-phases", "Hand-offs between phases"), "timeline.handoffs", cols(col("from"), col("to"), col("quantity"), "value", col("unit")), { wide: true }));
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
        out.push({ type: "line", title: t("js-kind-title-metric-against-axis", "{ $metric } against { $axis }", { metric: keyLabel(name), axis: axisLabel(ax) }),
          model: { title: t("js-kind-title-metric-against-axis", "{ $metric } against { $axis }", { metric: keyLabel(name), axis: axisLabel(ax) }), series: [{ label: keyLabel(name), color: color(out.length), points: pts }], xLabel: withUnit(axisLabel(ax), axUnit && axUnit !== "1" ? axUnit : ""), yLabel: withUnit(axisLabel(name), m.unit && m.unit !== "1" && m.unit !== "count" ? m.unit : ""), unit: m.unit && m.unit !== "1" && m.unit !== "count" ? m.unit : "", xName: axisLabel(ax), xUnit: axUnit && axUnit !== "1" ? axUnit : "", outages: [], logX: resolve(r, `sweep.axes.${ax}.scale`) === "log" },
          opts: { marks: pts.filter((p) => isNum(p[0]) && isNum(p[1])).map((p) => ({ x: p[0], y: p[1], color: color(out.length) })) },
          src: [{ path: `sweep.nodes[].metrics.${name}`, n: (r.sweep.nodes || []).length }] });
      }
    }
    const metricCols = Object.keys(r.sweep.metrics || {}).map((k) => col(`metrics.${k}`, { label: keyLabel(k), unit: r.sweep.metrics[k].unit }));
    const axisCols = axes.map((a) => col(`coords.${a}`, { label: keyLabel(a), unit: resolve(r, `sweep.axes.${a}.unit`) }));
    out.push(table(r, t("js-kind-title-every-node-of-the-sweep", "Every node of the sweep"), "sweep.nodes", [...axisCols, ...metricCols], { wide: true, note: t("js-kind-note-each-row-is-one-full", "Each row is one full engine run of the swept scenario.") }));
    out.push(kv(r, t("js-kind-title-sweep", "Sweep"), "sweep", ["scenario_kind", "runs", "shape"]));
  }
  if (r.monte_carlo) {
    const names = Object.keys(r.monte_carlo.metrics || {});
    for (const n of names) out.push({ type: "hist", title: t("js-kind-title-metric-distribution-over-runs", "{ $metric }: distribution over the runs", { metric: keyLabel(n) }), path: `monte_carlo.metrics.${n}.samples`, unit: r.monte_carlo.metrics[n].unit, marks: ["p05", "p50", "p95"].map((k) => ({ label: k, path: `monte_carlo.metrics.${n}.${k}` })) });
    out.push({ type: "table", title: t("js-kind-title-statistics-over-the-runs", "Statistics over the runs"), rows: names.map((n) => ({ path: `monte_carlo.metrics.${n}`, label: keyLabel(n) })), rowHead: t("js-kind-rowhead-metric", "Metric"), wide: true,
      cols: cols("n", "mean", "std", "p05", "p50", "p95", "ci95_low", "ci95_high").map((c) => ({ ...c, unitFrom: "unit" })),
      note: t("js-kind-note-p05-p50-and-p95-are", "p05, p50 and p95 are the 5th, 50th and 95th percentiles. ci95 is the 95% confidence interval on the mean.") });
    out.push(kv(r, t("js-kind-title-monte-carlo", "Monte Carlo"), "monte_carlo", ["scenario_kind", "runs", "seed_key", "base_seed"]));
  }
  if (r.compose) {
    const members = Object.keys(r.compose.members || {});
    const metrics = Object.keys(r.compose.metric_units || {});
    if (members.length) out.push({ type: "table", title: t("js-kind-title-members-under-the-shared-conditions", "Members under the shared conditions"), rows: members.map((m) => ({ path: `compose.members.${m}`, label: m })), rowHead: t("js-kind-rowhead-member", "Member"), wide: true,
      cols: [col("kind"), ...metrics.map((k) => col(`metrics.${k}`, { label: keyLabel(k), unit: r.compose.metric_units[k] })), col("scenario_hash", { hash: true }), col("result_sha256", { hash: true })] });
    if (metrics.some((k) => resolve(r, `compose.combined.${k}`))) out.push({ type: "table", title: t("js-kind-title-combined-over-the-members", "Combined over the members"), rows: metrics.filter((k) => resolve(r, `compose.combined.${k}`)).map((k) => ({ path: `compose.combined.${k}`, label: keyLabel(k) })), rowHead: t("js-kind-rowhead-metric", "Metric"), wide: true,
      cols: cols("min", col("min_member"), "max", col("max_member"), "mean").map((c) => ({ ...c, unitFrom: "unit" })) });
    const shared = Object.keys(r.compose.shared || {});
    if (shared.length) out.push({ type: "table", title: t("js-kind-title-shared-conditions", "Shared conditions"), rows: shared.map((k) => ({ path: `compose.shared.${k}`, label: keyLabel(k) })), rowHead: t("js-kind-rowhead-condition", "Condition"), cols: [col("value", { unitFrom: "unit" })] });
  }
  out.push(kv(r, t("js-kind-title-reproducibility", "Reproducibility"), "reproducibility", null, { hash: true }));
  out.push(labelPanel(r));
  return clean(out);
}

// ---------------------------------------------------------------- LEO signal design

function leoSignalPanels(r) {
  const sigs = r.signals || [];
  const psd = sigs.map((s, i) => (s.psd && Array.isArray(s.psd.offset_hz) ? { label: s.name, color: color(i), points: s.psd.offset_hz.map((f, k) => [f / 1e6, s.psd.db_per_hz[k]]), path: `signals[${i}].psd.db_per_hz`, n: s.psd.offset_hz.length } : null)).filter(Boolean);
  const jit = sigs.map((s, i) => {
    const trk = s.tracking;
    if (!trk || !Array.isArray(trk.cn0_dbhz) || !Array.isArray(trk.jitter_m)) return null;
    const k = Math.max(0, (trk.spacings_chips || []).indexOf(trk.reference_spacing_chips));
    return Array.isArray(trk.jitter_m[k]) ? { label: t("js-kind-label-signal-chip-spacing", "{ $name } ({ $spacing } chip spacing)", { name: s.name, spacing: fmt(trk.spacings_chips[k]) }), color: color(i), points: trk.cn0_dbhz.map((c, j) => [c, trk.jitter_m[k][j]]), path: `signals[${i}].tracking.jitter_m[${k}]`, n: trk.cn0_dbhz.length } : null;
  }).filter(Boolean);
  const comp = [];
  sigs.forEach((s, i) => (s.components || []).forEach((_, j) => comp.push({ path: `signals[${i}].components[${j}]`, label: s.name })));
  const compat = [];
  sigs.forEach((s, i) => (s.compatibility || []).forEach((_, j) => compat.push({ path: `signals[${i}].compatibility[${j}]`, label: s.name })));
  return clean([
    psd.length ? { type: "line", title: t("js-kind-title-power-spectral-density-of-each", "Power spectral density of each signal"), wide: true, model: { title: t("js-kind-title-power-spectral-density", "Power spectral density"), series: psd, xLabel: t("js-kind-axis-offset-from-the-signal-s", "offset from the signal's centre (MHz)"), yLabel: t("js-kind-axis-power-spectral-density-db-hz", "power spectral density (dB/Hz, unit power)"), unit: "dB/Hz", xName: "offset", xUnit: "MHz", outages: [] }, opts: {}, src: psd.map((p) => ({ path: p.path, n: p.n })),
      note: t("js-kind-note-each-signal-is-drawn-about", "Each signal is drawn about its own centre frequency. A gap is a spectral null.") } : null,
    table(r, t("js-kind-title-signals", "Signals"), "signals", cols(col("name", { label: t("js-kind-label-signal", "Signal") }), col("system"), "centre_hz", "tx_bandwidth_hz", "received_power_dbw", "reference_cn0_dbhz", "in_band_power_fraction", col("allocation"), col("source", { label: t("js-kind-label-parameters", "Parameters") }), col("ranging")), { wide: true,
      note: t("js-kind-note-parameters-are-public-with-a", "Parameters are PUBLIC (with a source), REPRESENTATIVE or WORKSHOP, as each preset states.") }),
    comp.length ? { type: "table", title: t("js-kind-title-signal-components", "Signal components"), rows: comp, rowHead: t("js-kind-rowhead-signal", "Signal"), wide: true, cols: cols(col("role"), col("modulation"), "chip_rate_hz", "code_length_chips", "power_fraction", "gabor_bandwidth_hz", "in_band_power_fraction"),
      note: t("js-kind-note-the-gabor-root-mean-square", "The Gabor (root-mean-square) bandwidth sets how sharply a signal can be ranged on.") } : null,
    jit.length ? { type: "line", title: t("js-kind-title-code-tracking-jitter-against-c", "Code-tracking jitter against C/N0"), wide: true, model: { title: t("js-kind-title-code-tracking-jitter", "Code-tracking jitter"), series: jit, xLabel: t("js-kind-axis-c-n0-db-hz", "C/N0 (dB-Hz)"), yLabel: t("js-kind-axis-code-tracking-jitter-m", "code-tracking jitter (m)"), unit: "m", xName: "C/N0", xUnit: "dB-Hz", outages: [] }, opts: { marks: jit.flatMap((s) => s.points.filter((p) => isNum(p[1])).map((p) => ({ x: p[0], y: p[1], color: s.color }))) }, src: jit.map((p) => ({ path: p.path, n: p.n })) } : null,
    table(r, t("js-kind-title-acquisition", "Acquisition"), "signals", [col("name", { label: t("js-kind-label-signal", "Signal") }), ...cols("acquisition.acquisition_cn0_dbhz", "acquisition.cells", "acquisition.doppler_bins", "acquisition.max_doppler_satellite_hz", "acquisition.mean_time_serial_s", "acquisition.mean_time_code_parallel_s")], { wide: true,
      note: t("js-kind-note-cells-are-the-code-and", "Cells are the code and Doppler bins a cold search must test.") }),
    table(r, t("js-kind-title-jammer-tolerance", "Jammer tolerance"), "signals", [col("name", { label: t("js-kind-label-signal", "Signal") }), ...cols("jammer_tolerance.cw_js_max_db", "jammer_tolerance.matched_js_max_db", "jammer_tolerance.wideband_js_max_db", "jammer_tolerance.tracking_threshold_dbhz")], { wide: true,
      note: t("js-kind-note-the-largest-jammer-to-signal", "The largest jammer-to-signal ratio (J/S) each signal tracks through, for a continuous-wave (CW), a matched-spectrum and a wideband jammer.") }),
    table(r, t("js-kind-title-band-trade-at-equal-transmit", "Band trade at equal transmit power"), "trade.rows", cols(col("signal"), "centre_hz", "free_space_loss_db", "cn0_equal_eirp_dbhz", "jitter_equal_eirp_m", "jitter_equal_cn0_m", "iono_delay_m", "wideband_js_max_equal_eirp_db"), { wide: true }),
    kv(r, t("js-kind-title-trade-conditions", "Trade conditions"), "trade", ["reference_signal", "slant_range_km", "slant_tec_tecu"]),
    compat.length ? { type: "table", title: t("js-kind-title-compatibility-with-gnss-signals", "Compatibility with GNSS signals"), rows: compat, rowHead: t("js-kind-rowhead-signal", "Signal"), wide: true, cols: cols(col("gnss", { label: t("js-kind-label-gnss-signal", "GNSS signal") }), "gnss_centre_hz", "ssc_gnss_into_leo_db_per_hz", "leo_cn0_degradation_db", "ssc_leo_into_gnss_db_per_hz", "gnss_cn0_degradation_db"),
      note: t("js-kind-note-ssc-is-the-spectral-separation", "SSC is the spectral separation coefficient: how much of one signal's power falls inside the other's receiver. A dash means the two do not overlap.") } : null,
    kv(r, t("js-kind-title-receiver", "Receiver"), "receiver"),
    table(r, t("js-kind-title-sources", "Sources"), "sources", cols(col("preset"), col("source", { label: t("js-kind-label-class", "Class") }), col("title"), col("url", { link: true })), { wide: true }),
    list(r, t("js-kind-title-not-modelled", "Not modelled"), "not_modelled", { wide: true }),
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
    cn0.push({ label: t("js-kind-label-gnss-highest-in-sky", "GNSS { $id } (highest in the sky)", { id: g[best].id }), color: "var(--space-ink-2)", dash: true, points: g[best].series.map((p) => [p.t_s, p.cn0_dbhz]), path: `gnss.satellites[${best}].series[].cn0_dbhz`, n: g[best].series.length });
  }
  const keep = (list) => list.slice(0, 8);
  const gm = resolve(r, "gnss.median_cn0_dbhz");
  if (cn0.length) out.push({ type: "line", title: t("js-kind-title-c-n0-over-the-pass", "C/N0 over the pass"), wide: true, model: { title: t("js-kind-title-c-n0-over-the-pass", "C/N0 over the pass"), series: keep(cn0), xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-c-n0-db-hz", "C/N0 (dB-Hz)"), unit: "dB-Hz", threshold: isNum(gm) ? gm : null, thresholdLabel: t("js-kind-threshold-gnss-median", "GNSS median"), outages: [] }, opts: {}, src: keep(cn0).map((p) => ({ path: p.path, n: p.n })),
    note: t("js-kind-note-a-low-earth-orbit-leo", "A low Earth orbit (LEO) satellite crosses the sky in minutes, so its C/N0 (carrier-to-noise density ratio) rises and falls in a bell; a GNSS satellite barely moves in the same time.") });
  if (dop.length) out.push({ type: "line", title: t("js-kind-title-doppler-over-the-pass", "Doppler over the pass"), wide: true, model: { title: t("js-kind-title-doppler", "Doppler"), series: keep(dop), xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-doppler-shift-hz", "Doppler shift (Hz)"), unit: "Hz", outages: [] }, opts: {}, src: keep(dop).map((p) => ({ path: p.path, n: p.n })) });
  if (el.length) out.push({ type: "line", title: t("js-kind-title-elevation", "Elevation"), wide: true, model: { title: t("js-kind-title-elevation", "Elevation"), series: keep(el), xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-elevation", "elevation (°)"), unit: "°", threshold: resolve(r, "user.mask_deg") ?? null, thresholdLabel: t("js-kind-threshold-elevation-mask", "elevation mask"), outages: [] }, opts: { h: 260 }, src: keep(el).map((p) => ({ path: p.path, n: p.n })) });
  const bandRows = [];
  sats.forEach((s, i) => (s.bands || []).forEach((_, j) => bandRows.push({ path: `satellites[${i}].bands[${j}]`, label: s.id })));
  if (bandRows.length) out.push({ type: "table", title: t("js-kind-title-bands", "Bands"), rows: bandRows.slice(0, 40), rowHead: t("js-kind-rowhead-satellite", "Satellite"), wide: true, cols: cols(col("name", { label: t("js-kind-label-band", "Band") }), "frequency_hz", "eirp_dbw", "peak_cn0_dbhz", "median_cn0_dbhz", "min_cn0_dbhz", "max_abs_doppler_hz", "max_abs_doppler_rate_hz_s", "iono_delay_at_peak_m", col("source", { note: true })) });
  out.push(table(r, t("js-kind-title-passes", "Passes"), "satellites", cols(col("id", { label: t("js-kind-label-satellite", "Satellite") }), col("system"), "altitude_m", "inclination_deg", "pass.aos_s", "pass.tca_s", "pass.los_s", "pass.max_elevation_deg", "pass.duration_above_mask_s", col("orbit_source")), { wide: true, rows: rowsOf(r, "satellites").slice(0, 40),
    note: t("js-kind-note-aos-is-acquisition-of-signal", "AOS is acquisition of signal, TCA the time of closest approach and LOS loss of signal.") }));
  out.push(kv(r, t("js-kind-title-leo-against-gnss", "LEO against GNSS"), "comparison"));
  out.push(kv(r, t("js-kind-title-gnss-reference", "GNSS reference"), "gnss", ["constellation", "band", "frequency_hz", "satellites_in_view", "median_cn0_dbhz", "max_cn0_dbhz", "min_cn0_dbhz", "max_abs_doppler_hz", "source"]));
  out.push(table(r, t("js-kind-title-ionosphere-free-band-pairs", "Ionosphere-free band pairs"), "iono_free", Object.keys((r.iono_free && r.iono_free[0]) || {}).filter((k) => typeof r.iono_free[0][k] !== "object").map((k) => col(k)), { wide: true }));
  if (r.iot) {
    const rows = (r.iot.rows || []).map((_, i) => ({ path: `iot.rows[${i}]` }));
    if (rows.length) out.push({ type: "table", title: t("js-kind-title-time-to-first-fix-and", "Time to first fix and energy per fix"), rows, wide: true, cols: cols(col("signal"), "cn0_dbhz", "cold.ttff_s", "cold.energy_per_fix_mj", "hot.ttff_s", "hot.energy_per_fix_mj", "doppler_uncertainty_cold_hz"),
      note: t("js-kind-note-cold-is-a-first-fix", "Cold is a first fix with no prior knowledge; hot is a fix soon after the last one.") });
    out.push(kv(r, t("js-kind-title-receiver-power-budget", "Receiver power budget"), "iot", ["active_power_mw", "sleep_power_uw", "battery_mwh", "label"]));
    out.push(list(r, t("js-kind-title-assumptions", "Assumptions"), "iot.assumptions", { wide: true }));
  }
  if (r.spoof) {
    const pd = ["fused", "leo", "gnss"].map((k, i) => ({ key: `${k}.p_detect`, label: k === "gnss" ? t("js-kind-label-gnss-channels", "GNSS channels") : k === "leo" ? t("js-kind-label-leo-channels", "LEO channels") : t("js-kind-label-all-channels", "all channels") , color: color(i) }));
    out.push(lineOf(r, t("js-kind-title-spoofing-monitor-probability-of-detection", "Spoofing monitor: probability of detection"), "spoof.series", "t_s", pd, { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-probability-of-detection", "probability of detection"), opts: { vlines: isNum(r.spoof.onset_s) ? [{ x: r.spoof.onset_s, label: t("js-kind-label-spoofing-starts", "spoofing starts"), alarm: true }] : [] },
      note: t("js-kind-note-the-doppler-and-pass-geometry", "The Doppler and pass-geometry monitor compares measured range rates with those predicted from the orbits. The rule marks the spoofer's onset.") }));
    out.push({ type: "table", title: t("js-kind-title-when-each-monitor-detects", "When each monitor detects"), rows: ["first", "fused", "leo", "gnss", "cross_band"].filter((k) => r.spoof[k]).map((k) => ({ path: `spoof.${k}`, label: keyLabel(k) })), rowHead: t("js-kind-rowhead-monitor", "Monitor"), cols: cols("detect_time_s", "delay_s", "offset_at_detection_m") });
    out.push(kv(r, t("js-kind-title-spoofer-and-monitor-settings", "Spoofer and monitor settings"), "spoof", ["onset_s", "offset_m", "push_rate_m_s", "push_azimuth_deg", "p_fa", "p_md", "window_s", "spoofs_gnss", "spoofed_bands", "label"]));
    out.push(list(r, t("js-kind-title-notes-on-the-spoofing-model", "Notes on the spoofing model"), "spoof.notes", { wide: true }));
  }
  out.push(kv(r, t("js-kind-title-user", "User"), "user"));
  out.push(table(r, t("js-kind-title-closed-form-doppler-against-finite", "Closed-form Doppler against finite differences"), "satellites", [col("id", { label: t("js-kind-label-satellite", "Satellite") }), ...cols("doppler_check.max_doppler_diff_hz", "doppler_check.max_doppler_rate_diff_hz_s", "doppler_check.max_range_rate_diff_m_s")], { wide: true, rows: rowsOf(r, "satellites").slice(0, 12) }));
  out.push(list(r, t("js-kind-title-notes", "Notes"), "notes", { wide: true }));
  out.push(labelPanel(r));
  return clean(out);
}

// ---------------------------------------------------------------- LEO navigation message

function leoNavmsgPanels(r) {
  const out = [];
  const sisreCols = cols(col("model"), "fit_interval_s", "update_period_s", "n_messages", "sisre_rms_m", "sisre_orb_rms_m", "sisre_max_m", "radial_rms_m", "along_rms_m", "cross_rms_m", "clock_rms_m");
  const sisreNote = t("js-kind-note-sisre-defined", "SISRE is the signal-in-space range error: what the broadcast message adds to a user's range. Here it is the message's representation error against the engine's own truth orbit.");
  const byModel = (base, xKey, yKey) => {
    const rows = resolve(r, base) || [];
    const models = [...new Set(rows.map((x) => x.model))];
    return models.map((m, i) => ({ label: m, color: color(i), points: rows.filter((x) => x.model === m).map((x) => [x[xKey], x[yKey]]) })).filter((s) => s.points.length > 1);
  };
  if (r.fit_interval_trade) {
    const s1 = byModel("fit_interval_trade.rows", "fit_interval_s", "sisre_rms_m");
    if (s1.length) out.push({ type: "line", title: t("js-kind-title-sisre-against-fit-interval", "SISRE against fit interval"), wide: true, model: { title: t("js-kind-title-sisre-against-fit-interval", "SISRE against fit interval"), series: s1, xLabel: t("js-kind-axis-fit-interval-s", "fit interval (s)"), yLabel: t("js-kind-axis-sisre-root-mean-square-m", "SISRE, root mean square (m)"), unit: "m", xName: "fit interval", outages: [] }, opts: { logY: true, marks: s1.flatMap((s) => s.points.map((p) => ({ x: p[0], y: p[1], color: s.color }))) }, src: [{ path: "fit_interval_trade.rows[].sisre_rms_m", n: r.fit_interval_trade.rows.length }], note: sisreNote });
    const s2 = byModel("fit_interval_trade.update_period_rows", "update_period_s", "sisre_rms_m");
    if (s2.length) out.push({ type: "line", title: t("js-kind-title-sisre-against-update-period", "SISRE against update period"), wide: true, model: { title: t("js-kind-title-sisre-against-update-period", "SISRE against update period"), series: s2, xLabel: t("js-kind-axis-update-period-s", "update period (s)"), yLabel: t("js-kind-axis-sisre-root-mean-square-m", "SISRE, root mean square (m)"), unit: "m", xName: "update period", outages: [] }, opts: { logY: true, marks: s2.flatMap((s) => s.points.map((p) => ({ x: p[0], y: p[1], color: s.color }))) }, src: [{ path: "fit_interval_trade.update_period_rows[].sisre_rms_m", n: r.fit_interval_trade.update_period_rows.length }] });
    out.push(table(r, t("js-kind-title-fit-interval-trade", "Fit-interval trade"), "fit_interval_trade.rows", sisreCols, { wide: true }));
    out.push(table(r, t("js-kind-title-update-period-trade", "Update-period trade"), "fit_interval_trade.update_period_rows", sisreCols, { wide: true }));
    out.push({ type: "note", title: t("js-kind-title-reading-the-trade", "Reading the trade"), path: "fit_interval_trade.explanation", wide: true });
  }
  if (r.model_comparison) {
    out.push(table(r, t("js-kind-title-message-models-compared", "Message models compared"), "model_comparison.rows", cols(col("model"), "n_parameters", "ephemeris_clock_bits", "fit_interval_s", "n_messages", "stats.sisre_rms_m", "stats.sisre_orb_rms_m", "stats.sisre_max_m", col("zero_clock"), col("fits_kshana_encoding")), { wide: true, note: sisreNote }));
    out.push(table(r, t("js-kind-title-beside-the-published-figures", "Beside the published figures"), "model_comparison.liu2025_altitude_table.rows", cols(col("satellite"), "altitude_km", "inclination_deg", "kshana_sisre_orb_rms_m", "published_sisre_m", "ratio"), { wide: true }));
    out.push(kv(r, t("js-kind-title-published-comparison", "Published comparison"), "model_comparison.liu2025_altitude_table", ["source", "label", "arc_s", "arcs_per_altitude", "why_not_validated"], { wide: true }));
  }
  if (r.midpass_update) {
    const m = r.midpass_update;
    out.push({ type: "chips", title: t("js-kind-title-continuity-across-message-switches", "Continuity across message switches"), items: [{ path: "midpass_update.continuity_pass", pass: m.continuity_pass === true, label: t("js-kind-label-largest-range-jump-against-the", "largest range jump against the threshold") }] });
    out.push(lineOf(r, t("js-kind-title-user-range-error-through-the", "User range error through the pass"), "midpass_update.range_error_series", "t_s", [{ key: "range_error_m", label: t("js-kind-label-range-error", "range error") }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-range-error-m", "range error (m)"), opts: { vlines: (m.switches || []).map((s) => ({ x: s.t_s, label: t("js-kind-label-message-switch-iod", "message switch, issue of data { $old } to { $new }", { old: s.iod_old, new: s.iod_new }) })) },
      note: t("js-kind-note-each-rule-is-a-switch", "Each rule is a switch to a newer message in the middle of the pass.") }));
    out.push(table(r, t("js-kind-title-message-switches", "Message switches"), "midpass_update.switches", cols("t_s", "iod_old", "iod_new", "elevation_deg", "range_jump_m", "worst_case_range_jump_m", "pos_jump_m", "clock_jump_m"), { wide: true, note: t("js-kind-note-iod-is-the-issue-of", "IOD is the issue of data: the message's serial number.") }));
    out.push(kv(r, t("js-kind-title-mid-pass-update", "Mid-pass update"), "midpass_update", ["threshold_m", "max_range_jump_m", "max_worst_case_range_jump_m", "fit_interval_s", "update_period_s"]));
    out.push(kv(r, t("js-kind-title-pass", "Pass"), "midpass_update.pass"));
  }
  if (r.encode_decode) {
    const e = r.encode_decode;
    out.push({ type: "chips", title: t("js-kind-title-frame-checks", "Frame checks"), items: [{ path: "encode_decode.corrupted_frame_rejected", pass: e.corrupted_frame_rejected === true, label: t("js-kind-label-a-corrupted-frame-is-rejected", "a corrupted frame is rejected") }] });
    out.push(kv(r, t("js-kind-title-encoded-frame", "Encoded frame"), "encode_decode", ["model", "frame_bytes", "payload_bits", "ephemeris_clock_bits", "crc24q", "crc24q_check_value_123456789", "csv_schema"]));
    out.push(kv(r, t("js-kind-title-round-trips", "Round trips"), "encode_decode", ["round_trip_max_pos_m", "quantised_max_pos_m", "quantised_max_clock_m", "rinex_round_trip_max_pos_m", "rinex_round_trip_max_clock_m", "csv_round_trip_max_pos_m", "sisre_exact_rms_m", "sisre_quantised_rms_m"]));
    out.push({ type: "mono", title: t("js-kind-title-frame-hexadecimal", "Frame, hexadecimal"), path: "encode_decode.frame_hex", wrap: true, wide: true, note: t("js-kind-note-the-engine-s-own-documented", "The engine's own documented binary frame, closed by a 24-bit cyclic redundancy check (CRC-24Q).") });
    const fields = [];
    (e.field_table || []).forEach((b, i) => (b.fields || []).forEach((_, j) => fields.push({ path: `encode_decode.field_table[${i}].fields[${j}]`, label: b.block })));
    if (fields.length) out.push({ type: "table", title: t("js-kind-title-field-table", "Field table"), rows: fields, rowHead: t("js-kind-rowhead-block", "Block"), wide: true, cols: cols(col("name", { label: t("js-kind-label-field", "Field") }), "bits", "lsb", col("unit"), col("signed")) });
    out.push(table(r, t("js-kind-title-quantisation-budget", "Quantisation budget"), "encode_decode.quantisation_budget", cols(col("field"), "bits", "lsb", col("unit"), "half_lsb_pos_m", "half_lsb_clock_m"), { wide: true, note: t("js-kind-note-what-half-a-least-significant", "What half a least-significant bit (LSB) of each field costs in position and in clock, as range.") }));
    out.push({ type: "mono", title: t("js-kind-title-rinex-style-record", "RINEX-style record"), path: "encode_decode.rinex_text", wide: true, note: t("js-kind-note-a-receiver-independent-exchange-format", "A Receiver Independent Exchange Format (RINEX) 4 style record. The LEO record types are a Kshana extension, as the header says.") });
    out.push(kv(r, t("js-kind-title-over-the-message-sequence", "Over the message sequence"), "encode_decode.sequence_stats"));
  }
  out.push(kv(r, t("js-kind-title-orbit", "Orbit"), "orbit"));
  out.push(kv(r, t("js-kind-title-message", "Message"), "message_config"));
  out.push(kv(r, t("js-kind-title-sisre-weights", "SISRE weights"), "sisre_weights"));
  out.push(list(r, t("js-kind-title-validated", "Validated"), "verification.validated", { wide: true }));
  out.push(list(r, t("js-kind-title-modelled", "Modelled"), "verification.modelled", { wide: true }));
  out.push(list(r, t("js-kind-title-limitations", "Limitations"), "limitations", { wide: true }));
  out.push(labelPanel(r));
  return clean(out);
}

// ---------------------------------------------------------------- LEO positioning (leo-pvt, leo-ppp, ntn-positioning)

function leoPvtPanels(r) {
  const out = [];
  if (r.joint) {
    out.push(lineOf(r, t("js-kind-title-position-error-gnss-leo-and", "Position error: GNSS, LEO and the fused fix"), "joint.epochs", "t_s", [{ key: "error_gnss_m", label: t("js-kind-label-gnss-only", "GNSS only") }, { key: "error_leo_m", label: t("js-kind-label-leo-only", "LEO only") }, { key: "error_fused_m", label: t("js-kind-label-fused", "fused") }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-3-d-position-error-m", "3-D position error (m)") }));
    out.push(lineOf(r, t("js-kind-title-geometry-position-dilution-of-precision", "Geometry: position dilution of precision"), "joint.epochs", "t_s", [{ key: "pdop_gnss", label: t("js-kind-label-gnss-only", "GNSS only") }, { key: "pdop_fused", label: t("js-kind-label-fused", "fused") }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-pdop", "PDOP"), opts: { h: 280 } }));
    out.push({ type: "table", title: t("js-kind-title-gnss-leo-and-fused", "GNSS, LEO and fused"), rows: ["gnss", "leo", "fused"].filter((k) => r.joint[k]).map((k) => ({ path: `joint.${k}`, label: k === "gnss" ? t("js-kind-label-gnss-only-cap", "GNSS only") : k === "leo" ? t("js-kind-label-leo-only", "LEO only") : t("js-kind-label-fused-cap", "Fused") })), rowHead: t("js-kind-rowhead-solution", "Solution"), cols: cols("availability", "median_pdop", "median_sigma_3d_m", "rms_error_3d_m"), wide: true });
    out.push(lineOf(r, t("js-kind-title-geometry-as-leo-satellites-are", "Geometry as LEO satellites are added"), "joint.dop_sweep", "n_leo", [{ key: "median_pdop", label: t("js-kind-label-pdop", "PDOP") }, { key: "median_hdop", label: t("js-kind-label-hdop", "HDOP") }, { key: "median_vdop", label: t("js-kind-label-vdop", "VDOP") }], { xLabel: t("js-kind-axis-leo-satellites-added-to-the", "LEO satellites added to the fix"), yLabel: t("js-kind-axis-median-dilution-of-precision", "median dilution of precision"), xName: "LEO satellites", xUnit: "", opts: { h: 280 } }));
    out.push(kv(r, t("js-kind-title-joint-fix", "Joint fix"), "joint", ["fraction_epochs_with_leo"]));
  }
  if (r.doppler) {
    out.push(kv(r, t("js-kind-title-doppler-only-fix", "Doppler-only fix"), "doppler", ["horizontal_error_m", "error_3d_m", "sigma_enu_m", "height_sigma_m", "n_obs", "n_sats", "weighted_rms", "drift_error_mps", "estimated_velocity"]));
    out.push(lineOf(r, t("js-kind-title-fix-quality-against-observation-window", "Fix quality against observation window"), "doppler.windows", "window_s", [{ key: "horizontal_error_m", label: t("js-kind-label-horizontal-error", "horizontal error") }, { key: "sigma_horizontal_m", label: t("js-kind-label-predicted-horizontal-sigma", "predicted horizontal sigma") }], { xLabel: t("js-kind-axis-observation-window-s", "observation window (s)"), yLabel: t("js-kind-axis-metres", "metres"), xName: "window", opts: { logY: true } }));
    out.push(table(r, t("js-kind-title-observation-windows", "Observation windows"), "doppler.windows", cols("window_s", "n_obs", "n_sats", "horizontal_error_m", "sigma_horizontal_m", "error_3d_m"), { wide: true }));
    out.push(table(r, t("js-kind-title-one-pass-alone", "One pass alone"), "doppler.single_pass", cols("cross_track_offset_km", "max_elevation_deg", "pass_duration_s", "n_obs", "sigma_along_m", "sigma_cross_m", "sigma_up_m"), { wide: true, note: t("js-kind-note-a-single-pass-fixes-the", "A single pass fixes the along-track direction far better than the cross-track one.") }));
    out.push(table(r, t("js-kind-title-doppler-envelopes", "Doppler envelopes"), "doppler.envelopes", cols(col("system"), "in_run.max_doppler_hz", "in_run.max_doppler_rate_hz_s", "overhead_pass.max_doppler_hz", "overhead_pass.max_doppler_rate_hz_s"), { wide: true }));
  }
  if (r.timing) {
    const rows = r.timing.rows || [];
    const at0 = rows.map((x, i) => ({ x, i })).filter((o) => o.x.cn0_offset_db === Math.max(...rows.map((y) => y.cn0_offset_db)));
    const series = at0.map((o, k) => ({ label: o.x.clock, color: color(k), points: o.x.series.map((p) => [p.t_s, p.in_view ? p.error_ns : null]), path: `timing.rows[${o.i}].series[].error_ns`, n: o.x.series.length }));
    if (series.length) out.push({ type: "line", title: t("js-kind-title-time-error-by-receiver-clock", "Time error by receiver clock"), wide: true, model: { title: t("js-kind-title-time-error", "Time error"), series, xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-time-error-ns", "time error (ns)"), unit: "ns", outages: [] }, opts: {}, src: series.map((s) => ({ path: s.path, n: s.n })),
      note: t("js-kind-note-drawn-at-the-strongest-signal", "Drawn at the strongest signal level of the run. A gap is a stretch with no satellite in view.") });
    out.push(table(r, t("js-kind-title-time-transfer-by-clock-and", "Time transfer by clock and signal level"), "timing.rows", cols(col("clock"), "cn0_offset_db", "stats.rms_s", "stats.p95_s", "stats.max_abs_s", "stats.fraction_in_view", "stats.longest_gap_s", "stats.rms_normalised"), { wide: true }));
    out.push(kv(r, t("js-kind-title-time-scale", "Time scale"), "timing", ["utc_offset_s", "utc_sigma_s", "utc_time_of_day_s", "median_measurement_sigma_s"]));
  }
  if (r.polar) {
    out.push(lineOf(r, t("js-kind-title-geometry-against-latitude", "Geometry against latitude"), "polar.rows", "lat_deg", [{ key: "gnss.median_pdop", label: t("js-kind-label-gnss-only", "GNSS only") }, { key: "fused.median_pdop", label: t("js-kind-label-gnss-and-leo", "GNSS and LEO") }, { key: "leo.median_pdop", label: t("js-kind-label-leo-only", "LEO only") }], { xLabel: t("js-kind-axis-latitude", "latitude (°)"), yLabel: t("js-kind-axis-median-pdop", "median PDOP"), xName: "latitude", xUnit: "°" }));
    out.push(lineOf(r, t("js-kind-title-satellites-in-view-against-latitude", "Satellites in view against latitude"), "polar.rows", "lat_deg", [{ key: "gnss.mean_in_view", label: t("js-kind-label-gnss", "GNSS") }, { key: "leo.mean_in_view", label: t("js-kind-label-leo", "LEO") }, { key: "fused.mean_in_view", label: t("js-kind-label-both", "both") }], { xLabel: t("js-kind-axis-latitude", "latitude (°)"), yLabel: t("js-kind-axis-mean-satellites-in-view", "mean satellites in view"), xName: "latitude", xUnit: "°", opts: { h: 280 } }));
    out.push(table(r, t("js-kind-title-by-latitude", "By latitude"), "polar.rows", cols("lat_deg", "gnss.availability", "gnss.median_pdop", "leo.availability", "leo.mean_in_view", "fused.availability", "fused.median_pdop", "fused.median_vdop"), { wide: true }));
  }
  out.push(table(r, t("js-kind-title-systems", "Systems"), "systems", cols(col("name", { label: t("js-kind-label-system", "System") }), col("role"), "n_satellites", "mean_altitude_km", "carrier_hz", "sisre_m", "sigma_pr_30deg_m", "sigma_range_rate_mps", col("clock"), col("presets")), { wide: true,
    note: t("js-kind-note-sisre-is-the-signal-in", "SISRE is the signal-in-space range error assumed for each system's broadcast orbit and clock.") }));
  out.push(kv(r, t("js-kind-title-run", "Run"), "", ["mode", "duration_s", "step_s", "user_lat_deg", "user_lon_deg"]));
  out.push(labelPanel(r));
  return clean(out);
}

function leoPppPanels(r) {
  const cases = r.cases || [];
  const mk = (key, title, thr) => {
    const series = cases.map((c, i) => (Array.isArray(c.t_min) && Array.isArray(c[key]) ? { label: c.name, color: color(i), points: c.t_min.map((tm, k) => [tm, c[key][k]]), path: `cases[${i}].${key}`, n: c.t_min.length } : null)).filter(Boolean);
    return series.length ? { type: "line", title, wide: true, model: { title, series, xLabel: t("js-kind-axis-time-since-the-start-min", "time since the start (min)"), yLabel: t("js-kind-axis-median-error-m", "median error (m)"), unit: "m", threshold: isNum(thr) ? thr : null, thresholdLabel: t("js-kind-threshold-convergence-criterion", "convergence criterion"), xName: "t", xUnit: "min", outages: [] }, opts: { logY: false }, src: series.map((s) => ({ path: s.path, n: s.n })) } : null;
  };
  return clean([
    mk("median_horizontal_error_m", t("js-replay-kinds-convergence-horizontal", "Convergence: median horizontal error"), r.criterion_horizontal_m),
    mk("median_vertical_error_m", t("js-replay-kinds-convergence-vertical", "Convergence: median vertical error"), r.criterion_vertical_m),
    table(r, t("js-kind-title-cases", "Cases"), "cases", cols(col("name", { label: t("js-kind-label-case", "Case") }), "n_leo", "mean_sats", "median_convergence_min", "fraction_converged", "nees_mean", "nees_fraction_in_band"), { wide: true,
      note: t("js-kind-note-precise-point-positioning-ppp-converges", "Precise point positioning (PPP) converges when the error stays under the criterion. NEES is the normalised estimation error squared, a filter-consistency check.") }),
    table(r, t("js-kind-title-beside-the-published-speed-up", "Beside the published speed-up"), "li_2019", cols("n_leo", "modelled_min", "published_min", "modelled_ratio", "published_ratio"), { wide: true }),
    kv(r, t("js-kind-title-run", "Run"), "", ["n_gnss", "runs_per_case", "duration_s", "step_s", "criterion_horizontal_m", "criterion_vertical_m", "nees_band"]),
    kv(r, t("js-kind-title-filter-noise", "Filter noise"), "noise"),
    labelPanel(r),
  ]);
}

function ntnPanels(r) {
  return clean([
    table(r, t("js-kind-title-positioning-by-signal-bandwidth", "Positioning by signal bandwidth"), "signals", cols(col("name", { label: t("js-kind-label-signal", "Signal") }), "bandwidth_hz", "rms_bandwidth_hz", "range_sigma_zenith_m", "range_sigma_mask_m", "median_pdop", "toa_availability", "toa_median_sigma_3d_m", "toa_rms_error_3d_m"), { wide: true,
      note: t("js-kind-note-time-of-arrival-toa-ranging", "Time-of-arrival (TOA) ranging on a non-terrestrial network (NTN) downlink: a wider signal ranges more sharply.") }),
    kv(r, t("js-kind-title-doppler-positioning-from-one-pass", "Doppler positioning from one pass"), "doppler_pass"),
    kv(r, t("js-kind-title-run", "Run"), "", ["carrier_hz", "n_satellites", "mean_in_view", "cn0_dbhz", "integration_s", "doppler_integration_s", "doppler_sigma_zenith_hz", "sync_error_m"]),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- LEO end-to-end chain

function leoChainPanels(r) {
  return clean([
    table(r, t("js-kind-title-what-each-stage-hands-to", "What each stage hands to the next"), "handoffs", cols(col("from"), col("to"), col("quantity"), "value", col("unit"), col("target")), { wide: true,
      note: t("js-kind-note-the-chain-runs-the-signal", "The chain runs the signal, pass, navigation-message, positioning and precise-positioning stages in order. Each row is a number one stage computed and the next one used.") }),
    lineCols(r, t("js-kind-title-pass-c-n0-of-the", "Pass: C/N0 of the whole signal and of the tracked component"), "series.t_s", [{ label: t("js-kind-label-whole-signal", "whole signal"), path: "series.cn0_dbhz" }, { label: t("js-kind-label-tracked-component", "tracked component"), path: "series.tracked_cn0_dbhz" }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-c-n0-db-hz", "C/N0 (dB-Hz)"), unit: "dB-Hz" }),
    lineCols(r, t("js-kind-title-pass-code-tracking-jitter", "Pass: code-tracking jitter"), "series.t_s", [{ label: t("js-kind-label-code-jitter", "code jitter"), path: "series.code_jitter_m" }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-code-jitter-m", "code jitter (m)"), unit: "m", opts: { h: 260 } }),
    lineCols(r, t("js-kind-title-pass-doppler", "Pass: Doppler"), "series.t_s", [{ label: t("js-kind-label-doppler", "Doppler"), path: "series.doppler_hz", color: "var(--s-orb)" }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-doppler-shift-hz", "Doppler shift (Hz)"), unit: "Hz", opts: { h: 260 } }),
    lineCols(r, t("js-kind-title-positioning-gnss-alone-against-the", "Positioning: GNSS alone against the fused fix"), "fusion.epochs.t_s", [{ label: t("js-kind-label-gnss-only", "GNSS only"), path: "fusion.epochs.error_gnss_m" }, { label: t("js-kind-label-fused", "fused"), path: "fusion.epochs.error_fused_m" }], { xLabel: t("js-kind-axis-time-s", "time (s)"), yLabel: t("js-kind-axis-3-d-position-error-m", "3-D position error (m)"), unit: "m" }),
    { type: "table", title: t("js-kind-title-gnss-leo-and-fused", "GNSS, LEO and fused"), rows: ["gnss", "leo", "fused"].filter((k) => resolve(r, `fusion.${k}`)).map((k) => ({ path: `fusion.${k}`, label: k === "gnss" ? t("js-kind-label-gnss-only-cap", "GNSS only") : k === "leo" ? t("js-kind-label-leo-only", "LEO only") : t("js-kind-label-fused-cap", "Fused") })), rowHead: t("js-kind-rowhead-solution", "Solution"), cols: cols("availability", "median_pdop", "median_sigma_3d_m", "rms_error_3d_m"), wide: true },
    table(r, t("js-kind-title-precise-point-positioning", "Precise point positioning"), "ppp.cases", cols(col("name", { label: t("js-kind-label-case", "Case") }), "n_leo", "median_convergence_min", "fraction_converged", "nees_mean"), { wide: true }),
    kv(r, t("js-kind-title-signal-stage", "Signal stage"), "signal"),
    kv(r, t("js-kind-title-pass-stage", "Pass stage"), "pass"),
    kv(r, t("js-kind-title-navigation-message-stage", "Navigation-message stage"), "navmsg"),
    table(r, t("js-kind-title-systems-in-the-fix", "Systems in the fix"), "fusion.systems", cols(col("name", { label: t("js-kind-label-system", "System") }), col("role"), "n_satellites", "sisre_m", "sigma_pr_30deg_m", "cn0_dbhz"), { wide: true }),
    list(r, t("js-kind-title-limitations", "Limitations"), "limitations", { wide: true }),
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
    kv(r, t("js-kind-title-datum-accuracy", "Datum accuracy"), "datum_accuracy"),
    kv(r, t("js-kind-title-range-residuals", "Range residuals"), "residuals"),
    params.length ? { type: "table", title: t("js-kind-title-helmert-transform-parameters", "Helmert transform parameters"), rows: params, cols: pk.map((k) => col(k)), wide: true, note: t("js-kind-note-a-helmert-transform-is-the", "A Helmert transform is the seven-parameter shift, rotation and scale between two reference frames.") } : null,
    kv(r, t("js-kind-title-helmert-fit", "Helmert fit"), "helmert", ["rank", "defect", "condition_number", "rel_tol", "parameter_order"]),
    table(r, t("js-kind-title-retroreflectors", "Retroreflectors"), "reflectors", rk.slice(0, 9).map((k) => col(k)), { wide: true }),
    table(r, t("js-kind-title-ranging-stations", "Ranging stations"), "data.stations", sk.slice(0, 8).map((k) => col(k)), { wide: true }),
    kv(r, t("js-kind-title-the-archived-campaign", "The archived campaign"), "data", ["normal_points_parsed", "normal_points_used", "span_days", "median_sigma_range_mm", "median_bin_rms_ps", "median_raw_ranges_per_point", "skipped_station_not_in_catalogue", "normal_point_source", "station_source", "reflector_source"], { wide: true }),
    kv(r, t("js-kind-title-against-a-simulated-campaign", "Against a simulated campaign"), "comparison"),
    kv(r, t("js-kind-title-sensitivity-to-a-line-of", "Sensitivity to a line-of-sight tilt"), "sensitivity"),
    kv(r, t("js-kind-title-reflector-information", "Reflector information"), "reflector_information"),
    labelPanel(r),
  ]);
}

// ---------------------------------------------------------------- the catalogue of capability views

// tab: the id used in ?tab=; stage: the interactive drawing above the panels (stages.mjs).
export const CAPABILITIES = {
  "spectrum": { tab: "spectrum", get label() { return t("js-kind-cap-spectrum-label", "Spectrum"); }, c: "var(--int)", stage: "spectrum", panels: spectrumPanels },
  "solar-system": { tab: "solar", get label() { return t("js-kind-cap-solar-system-label", "Solar system"); }, c: "var(--orb)", stage: "solar", panels: solarPanels },
  "body-pnt": { tab: "body-pnt", get label() { return t("js-kind-cap-body-pnt-label", "Relay positioning"); }, c: "var(--orb)", stage: null, panels: bodyPntPanels },
  "constellation-design": { tab: "coverage", get label() { return t("js-kind-cap-constellation-design-label", "Coverage"); }, c: "var(--orb)", stage: "coverage", panels: coveragePanels },
  "campaign": { tab: "campaign", get label() { return t("js-kind-cap-campaign-label", "Campaign"); }, c: "var(--itg)", stage: "timeline", panels: campaignPanels },
  "leo-signal": { tab: "leo-signal", get label() { return t("js-kind-cap-leo-signal-label", "Signal design"); }, c: "var(--spf)", stage: null, panels: leoSignalPanels },
  "leo-pass": { tab: "leo-pass", get label() { return t("js-kind-cap-leo-pass-label", "Pass & link"); }, c: "var(--tim)", stage: null, panels: leoPassPanels },
  "leo-navmsg": { tab: "leo-navmsg", get label() { return t("js-kind-cap-leo-navmsg-label", "Navigation message"); }, c: "var(--nav)", stage: null, panels: leoNavmsgPanels },
  "leo-pvt": { tab: "leo-positioning", get label() { return t("js-kind-cap-leo-pvt-label", "Positioning"); }, c: "var(--itg)", stage: null, panels: leoPvtPanels },
  "leo-ppp": { tab: "leo-positioning", get label() { return t("js-kind-cap-leo-ppp-label", "Positioning"); }, c: "var(--itg)", stage: null, panels: leoPppPanels },
  "ntn-positioning": { tab: "leo-positioning", get label() { return t("js-kind-cap-ntn-positioning-label", "Positioning"); }, c: "var(--itg)", stage: null, panels: ntnPanels },
  "leo-pnt-chain": { tab: "leo-chain", get label() { return t("js-kind-cap-leo-pnt-chain-label", "End-to-end chain"); }, c: "var(--tim)", stage: "chain", panels: leoChainPanels },
  "lunar-llr-datum": { tab: "llr-datum", get label() { return t("js-kind-cap-lunar-llr-datum-label", "Laser-ranging datum"); }, c: "var(--ink-2)", stage: null, panels: llrPanels },
};

// The kind a run was made with: the result's own `kind` when it states one, else the scenario's.
export function kindOfRun(result, toml = "") {
  if (result && typeof result.kind === "string" && own(CAPABILITIES, result.kind)) return result.kind;
  const k = readScalar(toml, "kind");
  return k ? k.replace(/^"|"$/g, "") : (result && typeof result.kind === "string" ? result.kind : null);
}

// The capability view of a run, or null when its kind has none (the older kinds use the
// views in views.mjs). { kind, tab, label, c, stage, panels }.
export function capabilityView(result, toml = "") {
  if (!result || typeof result !== "object") return null;
  const kind = kindOfRun(result, toml);
  const cap = kind && own(CAPABILITIES, kind);
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
  "spectrum": (r) => [{ path: "receiver.tracking_threshold_dbhz", label: t("js-kind-label-tracking-threshold", "Tracking threshold") }, { path: "receiver.noise_density_dbw_per_hz", label: t("js-kind-label-noise-floor", "Noise floor") },
    ...each(r, "timeline.bands", 6, (b, i) => ({ path: `timeline.bands[${i}].min_cn0_dbhz`, label: t("js-kind-label-lowest-c-n0", "Lowest C/N0"), sub: b.name }))],
  "solar-system": (r) => [{ path: "n_bodies", label: t("js-kind-label-bodies", "Bodies") }, ...each(r, "links", 4, (l, i) => ({ path: `links[${i}].one_way_light_time_s`, label: t("js-kind-label-light-time-one-way", "Light time, one way"), sub: t("js-kind-sub-from-to", "{ $from } to { $to }", { from: l.from, to: l.to }) }))],
  "body-pnt": (r) => numKeys(r, "fom"),
  "constellation-design": () => [{ path: "total_satellites", label: t("js-kind-label-satellites", "Satellites") }, { path: "global.availability_pct", label: t("js-kind-label-availability", "Availability"), unit: "%" }, { path: "global.pdop.median", label: t("js-kind-label-median-pdop", "Median PDOP") }, { path: "global.pdop.p95", label: t("js-kind-label-pdop-95th-percentile", "PDOP, 95th percentile") }, { path: "global.mean_visible", label: t("js-kind-label-mean-in-view", "Mean in view") }, { path: "global.min_visible", label: t("js-kind-label-fewest-in-view", "Fewest in view") }, { path: "global.worst_site_availability_pct", label: t("js-kind-label-worst-site-availability", "Worst site availability"), unit: "%" }],
  "campaign": (r) => [{ path: "reproducibility.runs_total", label: t("js-kind-label-member-runs", "Member runs") }, { path: "timeline.duration_s", label: t("js-kind-label-mission-length", "Mission length") }, { path: "monte_carlo.runs", label: t("js-kind-label-monte-carlo-runs", "Monte Carlo runs") }, { path: "sweep.runs", label: t("js-kind-label-sweep-runs", "Sweep runs") },
    ...Object.keys((r.monte_carlo && r.monte_carlo.metrics) || {}).slice(0, 3).flatMap((k) => [{ path: `monte_carlo.metrics.${k}.mean`, label: t("js-kind-label-mean", "Mean"), sub: keyLabel(k), unit: r.monte_carlo.metrics[k].unit }, { path: `monte_carlo.metrics.${k}.std`, label: t("js-kind-label-standard-deviation", "Standard deviation"), sub: keyLabel(k), unit: r.monte_carlo.metrics[k].unit }]),
    ...Object.keys((r.compose && r.compose.combined) || {}).slice(0, 3).flatMap((k) => [{ path: `compose.combined.${k}.min`, label: t("js-kind-label-lowest", "Lowest"), sub: keyLabel(k), unit: r.compose.combined[k].unit }, { path: `compose.combined.${k}.max`, label: t("js-kind-label-highest", "Highest"), sub: keyLabel(k), unit: r.compose.combined[k].unit }])],
  "leo-signal": (r) => each(r, "signals", 4, (s, i) => [{ path: `signals[${i}].tx_bandwidth_hz`, label: t("js-kind-label-transmit-bandwidth", "Transmit bandwidth"), sub: s.name }, { path: `signals[${i}].jammer_tolerance.wideband_js_max_db`, label: t("js-kind-label-wideband-j-s-tolerated", "Wideband J/S tolerated"), sub: s.name }]).flat(),
  "leo-pass": (r) => [...each(r, "satellites", 2, (s, i) => [{ path: `satellites[${i}].pass.max_elevation_deg`, label: t("js-kind-label-peak-elevation", "Peak elevation"), sub: s.id }, { path: `satellites[${i}].pass.duration_above_mask_s`, label: t("js-kind-label-time-above-the-mask", "Time above the mask"), sub: s.id }]).flat(), ...numKeys(r, "comparison", 4), { path: "spoof.first.delay_s", label: t("js-kind-label-first-detection-after-onset", "First detection after onset") }],
  "leo-navmsg": (r) => [...each(r, "model_comparison.rows", 4, (x, i) => ({ path: `model_comparison.rows[${i}].stats.sisre_rms_m`, label: t("js-kind-label-sisre-root-mean-square", "SISRE, root mean square"), sub: x.model })),
    ...each(r, "fit_interval_trade.rows", 4, (x, i) => ({ path: `fit_interval_trade.rows[${i}].sisre_rms_m`, label: t("js-kind-label-sisre-root-mean-square", "SISRE, root mean square"), sub: t("js-kind-sub-model-fit-seconds", "{ $model }, { $fit } s fit", { model: x.model, fit: fmt(x.fit_interval_s) }) })),
    { path: "midpass_update.max_range_jump_m", label: t("js-kind-label-largest-range-jump", "Largest range jump") }, { path: "midpass_update.threshold_m", label: t("js-kind-label-jump-threshold", "Jump threshold") },
    { path: "encode_decode.frame_bytes", label: t("js-kind-label-frame-length", "Frame length"), unit: "bytes" }, { path: "encode_decode.payload_bits", label: t("js-kind-label-payload", "Payload"), unit: "bits" }, { path: "encode_decode.quantised_max_pos_m", label: t("js-kind-label-quantisation-position", "Quantisation, position") }, { path: "encode_decode.sisre_quantised_rms_m", label: t("js-kind-label-sisre-after-quantisation", "SISRE after quantisation") }],
  "leo-pvt": (r) => [{ path: "joint.gnss.rms_error_3d_m", label: t("js-kind-label-3-d-error", "3-D error"), sub: t("js-kind-sub-gnss-only", "GNSS only") }, { path: "joint.fused.rms_error_3d_m", label: t("js-kind-label-3-d-error", "3-D error"), sub: t("js-kind-sub-fused", "fused") }, { path: "joint.gnss.median_pdop", label: t("js-kind-label-median-pdop", "Median PDOP"), sub: t("js-kind-sub-gnss-only", "GNSS only") }, { path: "joint.fused.median_pdop", label: t("js-kind-label-median-pdop", "Median PDOP"), sub: t("js-kind-sub-fused", "fused") },
    { path: "doppler.horizontal_error_m", label: t("js-kind-label-horizontal-error-2", "Horizontal error"), sub: t("js-kind-sub-doppler-only", "Doppler only") }, { path: "doppler.error_3d_m", label: t("js-kind-label-3-d-error", "3-D error"), sub: t("js-kind-sub-doppler-only", "Doppler only") }, { path: "doppler.n_sats", label: t("js-kind-label-satellites-used", "Satellites used") },
    ...each(r, "timing.rows", 4, (x, i) => ({ path: `timing.rows[${i}].stats.rms_s`, label: t("js-kind-label-time-error-root-mean-square", "Time error, root mean square"), sub: t("js-kind-sub-clock-offset-db", "{ $clock }, { $offset } dB", { clock: x.clock, offset: fmt(x.cn0_offset_db) }) })),
    ...(Array.isArray(resolve(r, "polar.rows")) && r.polar.rows.length ? [{ path: `polar.rows[${r.polar.rows.length - 1}].gnss.median_pdop`, label: t("js-kind-label-median-pdop", "Median PDOP"), sub: t("js-kind-sub-gnss-only-latitude", "GNSS only, latitude { $lat }°", { lat: fmt(r.polar.rows[r.polar.rows.length - 1].lat_deg) }) }, { path: `polar.rows[${r.polar.rows.length - 1}].fused.median_pdop`, label: t("js-kind-label-median-pdop", "Median PDOP"), sub: t("js-kind-sub-gnss-and-leo-latitude", "GNSS and LEO, latitude { $lat }°", { lat: fmt(r.polar.rows[r.polar.rows.length - 1].lat_deg) }) }] : [])],
  "leo-ppp": (r) => each(r, "cases", 6, (c, i) => ({ path: `cases[${i}].median_convergence_min`, label: t("js-kind-label-median-convergence", "Median convergence"), sub: c.name, unit: "min" })),
  "ntn-positioning": (r) => [...each(r, "signals", 4, (s, i) => ({ path: `signals[${i}].toa_rms_error_3d_m`, label: t("js-kind-label-3-d-error-time-of", "3-D error, time of arrival"), sub: s.name })), ...numKeys(r, "doppler_pass", 2)],
  "leo-pnt-chain": (r) => [{ path: "pass.peak_tracked_cn0_dbhz", label: t("js-kind-label-peak-tracked-c-n0", "Peak tracked C/N0") }, { path: "navmsg.sisre_rms_m", label: t("js-kind-label-sisre-root-mean-square", "SISRE, root mean square") }, { path: "fusion.gnss.rms_error_3d_m", label: t("js-kind-label-3-d-error", "3-D error"), sub: t("js-kind-sub-gnss-only", "GNSS only") }, { path: "fusion.fused.rms_error_3d_m", label: t("js-kind-label-3-d-error", "3-D error"), sub: t("js-kind-sub-fused", "fused") },
    ...each(r, "ppp.cases", 3, (c, i) => ({ path: `ppp.cases[${i}].median_convergence_min`, label: t("js-kind-label-median-convergence", "Median convergence"), sub: c.name, unit: "min" }))],
  "lunar-llr-datum": (r) => [...numKeys(r, "datum_accuracy", 4), ...numKeys(r, "residuals", 4)],
};

// Headline figures of a capability run: [{ path, label, sub, value, text, unit, note }], at most
// `max`, each read from the result at `path`. [] when the kind has no capability view.
export function capabilityFigures(result, toml = "", max = 8) {
  const kind = kindOfRun(result, toml);
  const make = kind && own(FIGURES, kind);
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
const GUIDED = () => ({
  "spectrum": [
    ["receiver::tracking_threshold_dbhz", t("js-kind-guided-tracking-threshold-db-hz", "Tracking threshold (dB-Hz)"), t("js-kind-hint-a-band-under-this-carrier", "a band under this carrier-to-noise density has lost lock"), 15, 40, 1],
    ["receiver::noise_figure_db", t("js-kind-guided-receiver-noise-figure-db", "Receiver noise figure (dB)"), t("js-kind-hint-raises-the-noise-floor-under", "raises the noise floor under every band"), 0, 8, 0.5],
    ["jammers[0]::eirp_dbw", t("js-kind-guided-first-jammer-power-dbw", "First jammer power (dBW)"), t("js-kind-hint-equivalent-isotropically-radiated-power-of", "equivalent isotropically radiated power of the first jammer"), -40, 20, 1],
    ["jammers[0]::received_power_dbw", t("js-kind-guided-first-jammer-received-power-dbw", "First jammer received power (dBW)"), t("js-kind-hint-power-of-the-first-jammer", "power of the first jammer at the receiver"), -150, -80, 1],
    ["jammers[0]::range_m", t("js-kind-guided-first-jammer-range-m", "First jammer range (m)"), t("js-kind-hint-distance-from-the-first-jammer", "distance from the first jammer to the receiver"), 10, 5000, 10],
    ["jammers[0]::bandwidth_mhz", t("js-kind-guided-first-jammer-bandwidth-mhz", "First jammer bandwidth (MHz)"), t("js-kind-hint-how-wide-the-first-jammer", "how wide the first jammer spreads its power"), 1, 60, 1],
    ["::duration_s", t("js-kind-guided-duration-s", "Duration (s)"), t("js-kind-hint-length-of-the-timeline", "length of the timeline"), 20, 300, 10],
  ],
  "solar-system": [["::track_points", t("js-kind-guided-points-per-orbit-track", "Points per orbit track"), t("js-kind-hint-how-finely-each-orbit-is", "how finely each orbit is sampled for the drawing"), 30, 360, 10]],
  "body-pnt": [
    ["constellation::planes", t("js-kind-guided-relay-planes", "Relay planes"), t("js-kind-hint-orbital-planes-of-the-navigation", "orbital planes of the navigation relays"), 1, 8, 1],
    ["constellation::sats_per_plane", t("js-kind-guided-relays-per-plane", "Relays per plane"), t("js-kind-hint-satellites-in-each-plane", "satellites in each plane"), 1, 12, 1],
    ["constellation::altitude_km", t("js-kind-guided-relay-altitude-km", "Relay altitude (km)"), t("js-kind-hint-height-of-the-relay-orbits", "height of the relay orbits above the body"), 500, 30000, 100],
    ["constellation::inclination_deg", t("js-kind-guided-relay-inclination", "Relay inclination (°)"), t("js-kind-hint-tilt-of-the-relay-planes", "tilt of the relay planes"), 0, 90, 1],
    ["constellation::sigma_range_m", t("js-kind-guided-relay-range-error-m", "Relay range error (m)"), t("js-kind-hint-one-sigma-error-of-a", "one-sigma error of a range to a relay"), 0.1, 10, 0.1],
    ["earth_link::sigma_range_m", t("js-kind-guided-earth-range-error-m", "Earth range error (m)"), t("js-kind-hint-one-sigma-error-of-the", "one-sigma error of the two-way range from Earth"), 0.1, 10, 0.1],
  ],
  "constellation-design": [
    ["::mask_deg", t("js-kind-guided-elevation-mask", "Elevation mask (°)"), t("js-kind-hint-a-satellite-must-be-this", "a satellite must be this high to count as in view"), 0, 40, 1],
    ["::pdop_threshold", t("js-kind-guided-pdop-threshold", "PDOP threshold"), t("js-kind-hint-a-grid-point-is-available", "a grid point is available while its position dilution of precision is under this"), 1, 10, 0.5],
    ["::grid_step_deg", t("js-kind-guided-grid-step", "Grid step (°)"), t("js-kind-hint-spacing-of-the-latitude-and", "spacing of the latitude and longitude grid"), 5, 30, 5],
    ["constellation.shell[0]::altitude_km", t("js-kind-guided-first-shell-altitude-km", "First shell altitude (km)"), t("js-kind-hint-height-of-the-first-shell", "height of the first shell's orbits"), 300, 30000, 50],
    ["constellation.shell[0]::inclination_deg", t("js-kind-guided-first-shell-inclination", "First shell inclination (°)"), t("js-kind-hint-tilt-of-the-first-shell", "tilt of the first shell's planes"), 0, 100, 1],
  ],
  "campaign": [
    ["monte_carlo::runs", t("js-kind-guided-monte-carlo-runs", "Monte Carlo runs"), t("js-kind-hint-how-many-seeded-runs-make", "how many seeded runs make the ensemble"), 20, 400, 20],
    ["sweep.axes[0]::start", t("js-kind-guided-sweep-from", "Sweep from"), t("js-kind-hint-first-value-of-the-swept", "first value of the swept parameter"), -100, 100, 1],
    ["sweep.axes[0]::stop", t("js-kind-guided-sweep-to", "Sweep to"), t("js-kind-hint-last-value-of-the-swept", "last value of the swept parameter"), -100, 100, 1],
    ["sweep.axes[0]::steps", t("js-kind-guided-sweep-steps", "Sweep steps"), t("js-kind-hint-how-many-values-are-run", "how many values are run"), 2, 30, 1],
    ["compose.shared[0]::value", t("js-kind-guided-shared-condition", "Shared condition"), t("js-kind-hint-the-value-every-member-runs", "the value every member runs under"), -40, 40, 1],
    ["timeline::step_s", t("js-kind-guided-timeline-step-s", "Timeline step (s)"), t("js-kind-hint-spacing-of-the-shared-mission", "spacing of the shared mission time grid"), 5, 60, 5],
    ["phases[0]::duration_s", t("js-kind-guided-first-phase-length-s", "First phase length (s)"), t("js-kind-hint-how-long-the-first-phase", "how long the first phase lasts"), 60, 3600, 60],
  ],
  "leo-signal": [
    ["receiver::reference_cn0_dbhz", t("js-kind-guided-reference-c-n0-db-hz", "Reference C/N0 (dB-Hz)"), t("js-kind-hint-signal-level-the-tracking-figures", "signal level the tracking figures are quoted at"), 30, 60, 1],
    ["receiver::loop_bandwidth_hz", t("js-kind-guided-loop-bandwidth-hz", "Loop bandwidth (Hz)"), t("js-kind-hint-code-tracking-loop-noise-bandwidth", "code tracking loop noise bandwidth"), 0.1, 10, 0.1],
    ["trade::slant_tec_tecu", t("js-kind-guided-slant-electron-content-tecu", "Slant electron content (TECU)"), t("js-kind-hint-ionosphere-along-the-path-in", "ionosphere along the path, in total electron content units"), 5, 150, 5],
    ["trade::slant_range_km", t("js-kind-guided-slant-range-km", "Slant range (km)"), t("js-kind-hint-distance-to-the-satellite-in", "distance to the satellite in the band trade"), 500, 3000, 50],
    ["acquisition::altitude_km", t("js-kind-guided-orbit-altitude-km", "Orbit altitude (km)"), t("js-kind-hint-sets-the-doppler-range-a", "sets the Doppler range a cold search must cover"), 300, 1500, 10],
  ],
  "leo-pass": [
    ["user::mask_deg", t("js-kind-guided-elevation-mask", "Elevation mask (°)"), t("js-kind-hint-a-satellite-must-be-this-2", "a satellite must be this high to be used"), 0, 30, 1],
    ["satellite[0]::max_elevation_deg", t("js-kind-guided-peak-elevation-of-the-pass", "Peak elevation of the pass (°)"), t("js-kind-hint-how-high-the-satellite-climbs", "how high the satellite climbs"), 10, 90, 1],
    ["user::lat_deg", t("js-kind-guided-user-latitude", "User latitude (°)"), t("js-kind-hint-where-the-user-stands", "where the user stands"), -80, 80, 1],
    ["spoofer::offset_m", t("js-kind-guided-spoofed-offset-m", "Spoofed offset (m)"), t("js-kind-hint-how-far-the-spoofer-moves", "how far the spoofer moves the computed position"), 5, 200, 5],
    ["spoofer::onset_s", t("js-kind-guided-spoofing-starts-s", "Spoofing starts (s)"), t("js-kind-hint-when-the-spoofer-captures-the", "when the spoofer captures the receiver"), 60, 1500, 30],
    ["iot::active_power_mw", t("js-kind-guided-receiver-power-when-awake-mw", "Receiver power when awake (mW)"), t("js-kind-hint-drawn-while-acquiring-and-tracking", "drawn while acquiring and tracking"), 5, 100, 1],
  ],
  "leo-navmsg": [
    ["orbit::altitude_km", t("js-kind-guided-orbit-altitude-km", "Orbit altitude (km)"), t("js-kind-hint-height-of-the-satellite-whose", "height of the satellite whose message is fitted"), 400, 1500, 10],
    ["orbit::inclination_deg", t("js-kind-guided-orbit-inclination", "Orbit inclination (°)"), t("js-kind-hint-tilt-of-that-orbit", "tilt of that orbit"), 0, 100, 0.1],
    ["message::fit_interval_s", t("js-kind-guided-fit-interval-s", "Fit interval (s)"), t("js-kind-hint-arc-one-message-is-fitted", "arc one message is fitted over"), 60, 1200, 30],
    ["message::update_period_s", t("js-kind-guided-update-period-s", "Update period (s)"), t("js-kind-hint-how-often-a-new-message", "how often a new message is issued"), 60, 1200, 30],
    ["orbit::gravity_degree", t("js-kind-guided-gravity-field-degree", "Gravity field degree"), t("js-kind-hint-detail-of-the-truth-orbit", "detail of the truth orbit's gravity model"), 2, 40, 1],
  ],
  "leo-pvt": [
    ["user::lat_deg", t("js-kind-guided-user-latitude", "User latitude (°)"), t("js-kind-hint-where-the-receiver-stands", "where the receiver stands"), -80, 80, 1],
    ["system[0]::sisre_m", t("js-kind-guided-first-system-range-error-m", "First system range error (m)"), t("js-kind-hint-signal-in-space-range-error", "signal-in-space range error of the first system"), 0.05, 5, 0.05],
    ["system[1]::sisre_m", t("js-kind-guided-second-system-range-error-m", "Second system range error (m)"), t("js-kind-hint-signal-in-space-range-error-2", "signal-in-space range error of the second system"), 0.05, 5, 0.05],
    ["system[0]::mask_deg", t("js-kind-guided-elevation-mask", "Elevation mask (°)"), t("js-kind-hint-a-satellite-of-the-first", "a satellite of the first system must be this high"), 0, 30, 1],
    ["system[0]::sigma_doppler_hz", t("js-kind-guided-doppler-error-hz", "Doppler error (Hz)"), t("js-kind-hint-one-sigma-doppler-measurement-error", "one-sigma Doppler measurement error"), 0.1, 50, 0.1],
    ["joint::max_leo_sweep", t("js-kind-guided-leo-satellites-in-the-sweep", "LEO satellites in the sweep"), t("js-kind-hint-how-many-low-orbit-satellites", "how many low-orbit satellites the geometry sweep adds"), 2, 20, 1],
    ["::duration_s", t("js-kind-guided-duration-s", "Duration (s)"), t("js-kind-hint-length-of-the-run", "length of the run"), 300, 7200, 300],
  ],
  "leo-ppp": [
    ["::duration_s", t("js-kind-guided-duration-s", "Duration (s)"), t("js-kind-hint-length-of-each-filter-run", "length of each filter run"), 600, 3600, 300],
    ["::runs", t("js-kind-guided-runs-per-case", "Runs per case"), t("js-kind-hint-filter-runs-averaged-for-each", "filter runs averaged for each case (more is slower)"), 1, 8, 1],
    ["gnss[0]::mask_deg", t("js-kind-guided-elevation-mask", "Elevation mask (°)"), t("js-kind-hint-a-satellite-of-the-first", "a satellite of the first system must be this high"), 0, 20, 1],
  ],
  "ntn-positioning": [
    ["signal[0]::bandwidth_hz", t("js-kind-guided-first-signal-bandwidth-hz", "First signal bandwidth (Hz)"), t("js-kind-hint-occupied-bandwidth-of-the-first", "occupied bandwidth of the first reference signal"), 180e3, 20e6, 180e3],
    ["::integration_s", t("js-kind-guided-integration-time-s", "Integration time (s)"), t("js-kind-hint-how-long-the-receiver-integrates", "how long the receiver integrates for one range"), 0.01, 1, 0.01],
    ["::sync_error_m", t("js-kind-guided-network-synchronisation-error-m", "Network synchronisation error (m)"), t("js-kind-hint-timing-error-between-satellites-as", "timing error between satellites, as range"), 0, 10, 0.5],
    ["system[0]::mask_deg", t("js-kind-guided-elevation-mask", "Elevation mask (°)"), t("js-kind-hint-a-satellite-must-be-this-2", "a satellite must be this high to be used"), 0, 30, 1],
  ],
  "leo-pnt-chain": [
    ["::od_sisre_m", t("js-kind-guided-orbit-determination-error-m", "Orbit determination error (m)"), t("js-kind-hint-the-part-of-the-range", "the part of the range error the message cannot remove"), 0.05, 2, 0.05],
    ["pass.satellite[0]::altitude_km", t("js-kind-guided-satellite-altitude-km", "Satellite altitude (km)"), t("js-kind-hint-height-of-the-chain-s", "height of the chain's satellite"), 400, 1500, 10],
    ["pass.satellite[0]::max_elevation_deg", t("js-kind-guided-peak-elevation-of-the-pass", "Peak elevation of the pass (°)"), t("js-kind-hint-how-high-the-satellite-climbs", "how high the satellite climbs"), 10, 90, 1],
    ["pass.satellite.band[0]::eirp_dbw", t("js-kind-guided-transmit-power-dbw", "Transmit power (dBW)"), t("js-kind-hint-equivalent-isotropically-radiated-power-of-2", "equivalent isotropically radiated power of the band"), -10, 30, 1],
    ["navmsg.message::fit_interval_s", t("js-kind-guided-fit-interval-s", "Fit interval (s)"), t("js-kind-hint-arc-one-message-is-fitted", "arc one message is fitted over"), 60, 1200, 30],
  ],
});

// Guided sliders for a capability kind: [{ id, label, hint, min, max, step, field }] for the
// entries whose field the scenario has (fields = params.mjs numericFields(toml)), at most six.
export function guidedFor(kind, fields) {
  const out = [];
  for (const [id, label, hint, min, max, step] of own(GUIDED(), kind) || []) {
    const field = fields.find((f) => f.id === id);
    if (!field) continue;
    out.push({ id, label, hint, step, field, min: Math.min(min, field.value), max: Math.max(max, field.value) });
    if (out.length === 6) break;
  }
  return out;
}
export const hasCapability = (kind) => !!own(CAPABILITIES, kind);
