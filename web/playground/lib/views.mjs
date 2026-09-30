// SPDX-License-Identifier: AGPL-3.0-only
// Pure result-to-view models and SVG builders for the redesigned playground.
// Every number drawn here is read from an engine result document; nothing is
// synthesised. The SVGs are inline (so they follow the page theme through CSS
// custom properties) and every scenario-derived string is escaped. Tested in
// views.test.mjs.
import { readScalar } from "./share.mjs";
import { readSectionScalar } from "./guided.mjs";

export function esc(s) {
  return String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));
}

// Compact human number: plain in the mid range, exponential at the extremes.
export function fmt(x, digits = 3) {
  if (typeof x !== "number" || !Number.isFinite(x)) return "—";
  if (x !== 0 && (Math.abs(x) >= 1e5 || Math.abs(x) < 1e-3)) return x.toExponential(2);
  return String(Number(x.toPrecision(digits + 1)));
}

// Human duration from seconds.
export function fmtDuration(s) {
  if (typeof s !== "number" || !Number.isFinite(s)) return "—";
  const a = Math.abs(s);
  if (a < 120) return `${fmt(s)} s`;
  if (a < 7200) return `${fmt(s / 60)} min`;
  if (a < 172800) return `${fmt(s / 3600)} h`;
  return `${fmt(s / 86400)} days`;
}

// "Nice" linear ticks covering [lo, hi].
export function niceTicks(lo, hi, n = 5) {
  if (!Number.isFinite(lo) || !Number.isFinite(hi)) return [];
  if (lo === hi) { hi = lo + (lo === 0 ? 1 : Math.abs(lo)); }
  const span = hi - lo;
  const raw = span / Math.max(1, n);
  const mag = 10 ** Math.floor(Math.log10(raw));
  const step = [1, 2, 2.5, 5, 10].map((m) => m * mag).find((s) => s >= raw) || 10 * mag;
  const out = [];
  for (let v = Math.ceil(lo / step) * step; v <= hi + step * 1e-9; v += step) out.push(Number(v.toPrecision(12)));
  return out;
}

const SERIES_COLORS = ["var(--s-tim)", "var(--s-nav)", "var(--s-orb)", "var(--s-spf)"];

// The plotted field of a clock/inertial series sample, with its unit and label.
const SERIES_FIELDS = [
  ["error_ns", "ns", "Timing error"],
  ["error_m", "m", "Position error"],
  ["sync_error_s", "s", "Synchronisation error"],
  ["timing_ns", "ns", "Timing error"],
];

// Time-series model of a result, or null when the result has no series the
// playground knows how to draw (the engine's own chart is shown instead).
// { title, xLabel, yLabel, series:[{label,color,points:[[x,y]]}], threshold, outages:[[t0,t1]] }
export function seriesModel(result, toml = "") {
  if (!result || typeof result !== "object") return null;
  const q = result.quantum, c = result.classical;
  const qs = q && Array.isArray(q.series) ? q.series : null;
  const cs = c && Array.isArray(c.series) ? c.series : null;
  if ((qs && qs.length > 1) || (cs && cs.length > 1)) {
    const sample = (qs && qs[0]) || cs[0];
    const f = SERIES_FIELDS.find(([k]) => k in sample);
    if (!f) return extraSeriesModel(result);
    const [key, unit, label] = f;
    const series = [];
    for (const [s, spec, i] of [[qs, q && q.spec, 0], [cs, c && c.spec, 1]]) {
      if (!s || s.length < 2) continue;
      series.push({
        label: spec && spec.id ? spec.id : i === 0 ? "quantum" : "classical",
        color: SERIES_COLORS[i],
        points: s.filter((p) => typeof p[key] === "number").map((p) => [p.t, p[key]]),
      });
    }
    const thr = typeof result.threshold_ns === "number" && unit === "ns" ? result.threshold_ns
      : typeof result.threshold_m === "number" && unit === "m" ? result.threshold_m : null;
    return {
      title: `${label} over the run`,
      xLabel: "time (s)",
      yLabel: `${label.toLowerCase()} (${unit})`,
      unit,
      series,
      threshold: thr,
      outages: outageWindows(qs || cs),
    };
  }
  if (Array.isArray(result.error_growth) && result.error_growth.length > 1) {
    const guard = result.slot && typeof result.slot.guard_ns === "number" ? result.slot.guard_ns : null;
    return {
      title: "Predicted time error since the last fix",
      xLabel: "time since last fix (s)",
      yLabel: "time error (ns)",
      unit: "ns",
      series: [{ label: (result.oscillator && result.oscillator.source) ? `oscillator (${result.oscillator.source})` : "oscillator", color: SERIES_COLORS[0],
        points: result.error_growth.map((p) => [p.t_s, p.time_error_ns]) }],
      threshold: guard,
      thresholdLabel: "slot guard",
      outages: [],
    };
  }
  const extra = extraSeriesModel(result);
  if (extra) return extra;
  if (Array.isArray(result.epochs) && result.epochs.length > 1 && typeof result.epochs[0].tracking === "number") {
    const tt = (e) => (typeof e.t === "number" ? e.t : e.t_s);
    return {
      title: "Satellites visible and still tracking",
      xLabel: "time (s)",
      yLabel: "satellites",
      unit: "",
      series: [
        { label: "visible", color: "var(--s-orb)", points: result.epochs.map((e) => [tt(e), e.visible]) },
        { label: "tracking", color: "var(--s-int)", points: result.epochs.map((e) => [tt(e), e.tracking]) },
      ],
      threshold: 4,
      thresholdLabel: "4 needed for a fix",
      outages: [],
    };
  }
  return null;
}

// Further result shapes the playground draws as a line chart (each is a real engine field):
// integrity protection levels, spoofing offset against its bound, sweep points, Monte Carlo
// percentile bands, relay-navigation estimation error, and map-matched coasting.
function extraSeriesModel(result) {
  if (!result || typeof result !== "object") return null;
  const tOf = (e) => (typeof e.t_s === "number" ? e.t_s : e.t);
  const pl = Array.isArray(result.epochs) && result.epochs.length > 1 && typeof result.epochs[0].hpl_m === "number" ? result.epochs
    : Array.isArray(result.pass) && result.pass.length > 1 && typeof result.pass[0].hpl_m === "number" ? result.pass : null;
  if (pl) {
    const al = typeof result.al_h_m === "number" ? result.al_h_m : typeof result.alert_limit_m === "number" ? result.alert_limit_m : null;
    return {
      title: "Protection levels against the alert limit",
      xLabel: "time (s)", yLabel: "protection level (m)", unit: "m",
      series: [
        { label: "horizontal (HPL)", color: SERIES_COLORS[0], points: pl.filter((e) => Number.isFinite(e.hpl_m)).map((e) => [tOf(e), e.hpl_m]) },
        { label: "vertical (VPL)", color: SERIES_COLORS[1], points: pl.filter((e) => Number.isFinite(e.vpl_m)).map((e) => [tOf(e), e.vpl_m]) },
      ].filter((s) => s.points.length > 1),
      threshold: al, thresholdLabel: "horizontal alert limit", outages: [],
    };
  }
  const q = result.quantum, c = result.classical;
  const qs = q && Array.isArray(q.series) ? q.series : null, cs = c && Array.isArray(c.series) ? c.series : null;
  const any = (qs && qs[0]) || (cs && cs[0]);
  if (any && "offset_ns" in any && "bound_ns" in any) {
    const series = [];
    for (const [s, blk, i] of [[cs, c, 0], [qs, q, 1]]) {
      if (!s || s.length < 2) continue;
      const id = blk && blk.spec && blk.spec.id ? blk.spec.id : i === 0 ? "classical" : "quantum";
      series.push({ label: `${id} offset`, color: SERIES_COLORS[i * 2], points: s.map((p) => [p.t, Math.abs(p.offset_ns)]) });
      series.push({ label: `${id} bound`, color: SERIES_COLORS[i * 2 + 1], points: s.map((p) => [p.t, p.bound_ns]) });
    }
    return { title: "Spoofed time offset against the detection bound", xLabel: "time (s)", yLabel: "time (ns)", unit: "ns", series, threshold: typeof result.threshold_ns === "number" ? result.threshold_ns : null, outages: [] };
  }
  if (Array.isArray(result.points) && result.points.length > 1 && typeof result.points[0].value === "number") {
    const keys = Object.keys(result.points[0]).filter((k) => k !== "value" && typeof result.points[0][k] === "number");
    return {
      title: `Sweep of ${result.parameter || "a parameter"}: ${result.metric || "metric"}`,
      xLabel: result.parameter || "value", yLabel: result.metric || "metric", unit: "",
      series: keys.map((k, i) => ({ label: k, color: SERIES_COLORS[i % SERIES_COLORS.length], points: result.points.map((p) => [p.value, p[k]]) })),
      threshold: null, outages: [], logX: result.scale === "log", logY: result.scale === "log",
    };
  }
  const qb = q && Array.isArray(q.band) ? q.band : null, cb = c && Array.isArray(c.band) ? c.band : null;
  if ((qb && qb.length > 1) || (cb && cb.length > 1)) {
    const series = [];
    for (const [b, blk, i] of [[cb, c, 0], [qb, q, 1]]) {
      if (!b || b.length < 2) continue;
      const id = blk && blk.spec && blk.spec.id ? blk.spec.id : i === 0 ? "classical" : "quantum";
      series.push({ label: `${id} p95`, color: SERIES_COLORS[i * 2], points: b.map((p) => [p.t, p.p95_ns]) });
      series.push({ label: `${id} median`, color: SERIES_COLORS[i * 2 + 1], points: b.map((p) => [p.t, p.p50_ns]) });
    }
    return { title: `Time-error band across ${result.runs || "the"} Monte Carlo runs`, xLabel: "time (s)", yLabel: "time error (ns)", unit: "ns", series, threshold: typeof result.threshold_ns === "number" ? result.threshold_ns : null, outages: [] };
  }
  if (Array.isArray(result.estimation) && result.estimation.length > 1 && typeof result.estimation[0].pos_error_3d_m === "number") {
    return {
      title: "Relay-navigation position error and its 3-sigma bound",
      xLabel: "time (s)", yLabel: "position (m)", unit: "m",
      series: [
        { label: "3-D position error", color: SERIES_COLORS[0], points: result.estimation.map((e) => [e.t, e.pos_error_3d_m]) },
        { label: "3-sigma bound", color: SERIES_COLORS[1], points: result.estimation.filter((e) => Number.isFinite(e.pos_3sigma_m)).map((e) => [e.t, e.pos_3sigma_m]) },
      ].filter((s) => s.points.length > 1),
      threshold: null, outages: [],
    };
  }
  if (Array.isArray(result.epochs) && result.epochs.length > 1 && typeof result.epochs[0].matched_m === "number") {
    return {
      title: "Map-matched against free-inertial position error",
      xLabel: "epoch", yLabel: "position error (m)", unit: "m",
      series: [
        { label: "free inertial", color: SERIES_COLORS[1], points: result.epochs.map((e) => [e.k, e.free_inertial_m]) },
        { label: "map matched", color: SERIES_COLORS[0], points: result.epochs.map((e) => [e.k, e.matched_m]) },
      ],
      threshold: null, outages: [],
    };
  }
  return null;
}

// [t0, t1] windows where a series sample is flagged as not nominal GNSS.
export function outageWindows(series) {
  if (!Array.isArray(series)) return [];
  const out = [];
  let start = null;
  for (const p of series) {
    const denied = p && typeof p.gnss === "string" && p.gnss !== "nominal";
    if (denied && start === null) start = p.t;
    if (!denied && start !== null) { out.push([start, p.t]); start = null; }
  }
  if (start !== null && series.length) out.push([start, series[series.length - 1].t]);
  return out;
}

// First time after `tStart` at which |y| exceeds `thr`, measured from `tStart`.
// Returns { t, crossed } where crossed=false means it stayed inside for the whole record
// (t is then the record length after tStart, a lower bound).
export function timeToThreshold(points, thr, tStart = null) {
  if (!Array.isArray(points) || !points.length || !Number.isFinite(thr)) return null;
  const t0 = tStart === null ? points[0][0] : tStart;
  for (const [t, y] of points) {
    if (t < t0) continue;
    if (Math.abs(y) > thr) return { t: t - t0, crossed: true };
  }
  return { t: points[points.length - 1][0] - t0, crossed: false };
}

// Holdover model for clock-style and slot-timing results: per clock, the error
// record since GNSS was lost plus the engine's own holdover figure.
export function holdoverModel(result) {
  const sm = seriesModel(result);
  if (!sm || !sm.series.length || !(sm.unit === "ns" || sm.unit === "m")) return null;
  if (result.epochs) return null; // tracking counts are not a holdover record
  const loss = sm.outages.length ? sm.outages[0][0] : (result.error_growth ? 0 : null);
  if (loss === null) return null;
  const engineFigure = [];
  for (const k of ["quantum", "classical"]) {
    const c = result[k];
    if (c && c.fom && typeof c.fom.holdover_s === "number") engineFigure.push({ label: c.spec && c.spec.id ? c.spec.id : k, holdover_s: c.fom.holdover_s });
  }
  if (result.result && typeof result.result.breach_after_sync_s === "number") {
    engineFigure.push({ label: "oscillator", holdover_s: result.result.breach_after_sync_s });
  }
  return { ...sm, loss, engineFigure, defaultThreshold: sm.threshold };
}

// Signal view for GNSS interference results: per-epoch, per-satellite effective
// carrier-to-noise density, jammer-to-signal ratio and the tracking threshold.
export function signalModel(result, toml = "") {
  let ep = result && Array.isArray(result.epochs) ? result.epochs : null;
  // Lunar jamming publishes a flat per-link list instead of per-epoch satellites.
  if (result && Array.isArray(result.links) && result.links.length && "cn0_effective_dbhz" in result.links[0]) {
    const byT = new Map();
    for (const l of result.links) {
      if (!byT.has(l.t_s)) byT.set(l.t_s, []);
      byT.get(l.t_s).push({ ...l, prn: l.sat });
    }
    ep = [...byT.entries()].sort((a, b) => a[0] - b[0]).map(([t, sats]) => ({ t, sats }));
  }
  if (!ep || !ep.length || !Array.isArray(ep[0].sats)) return null;
  const any = ep.find((e) => e.sats && e.sats.length);
  if (!any || !("cn0_effective_dbhz" in any.sats[0])) return null;
  const prns = [...new Set(ep.flatMap((e) => e.sats.map((s) => s.prn)))].sort((a, b) => a - b);
  const times = ep.map((e) => (typeof e.t === "number" ? e.t : typeof e.t_s === "number" ? e.t_s : null));
  const cells = ep.map((e) => {
    const row = {};
    for (const s of e.sats) row[s.prn] = s;
    return row;
  });
  const thrRaw = typeof result.tracking_threshold_dbhz === "number" ? result.tracking_threshold_dbhz : parseFloat(readScalar(toml, "tracking_threshold_dbhz"));
  const band = {
    carrier_hz: typeof result.carrier_hz === "number" ? result.carrier_hz : num(readSectionScalar(toml, "signal", "freq_hz") ?? readScalar(toml, "freq_hz")),
    chip_rate_hz: typeof result.chip_rate_hz === "number" ? result.chip_rate_hz : null,
    jammer_type: strip(readSectionScalar(toml, "jammer", "jammer_type")),
    jammer_bandwidth_mhz: num(readSectionScalar(toml, "jammer", "bandwidth_mhz")),
    jammer_power_dbw: num(readSectionScalar(toml, "jammer", "power_dbw")),
  };
  // Colour range spans both the nominal and the jammed C/N0, so the two views compare directly.
  const all = cells.flatMap((r) => Object.values(r).flatMap((s) => [s.cn0_effective_dbhz, s.cn0_nominal_dbhz])).filter(Number.isFinite);
  const hasNominal = cells.some((r) => Object.values(r).some((s) => Number.isFinite(s.cn0_nominal_dbhz)));
  const js = cells.flatMap((r) => Object.values(r).map((s) => s.js_db)).filter(Number.isFinite);
  return {
    prns, times, cells,
    threshold: Number.isFinite(thrRaw) ? thrRaw : null,
    cn0Range: all.length ? [Math.min(...all), Math.max(...all)] : [0, 1],
    jsRange: js.length ? [Math.min(...js), Math.max(...js)] : null,
    band,
    hasNominal,
    fom: result.fom || null,
  };
}
const num = (v) => { const x = parseFloat(v); return Number.isFinite(x) ? x : null; };
const strip = (v) => (v === null || v === undefined ? null : String(v).replace(/^"|"$/g, ""));

// Telecom timing masks: MTIE/TDEV curves plus each mask check's limit at its worst point.
export function masksModel(result) {
  if (!result || !Array.isArray(result.mtie) || !result.mtie.length) return null;
  return {
    mtie: result.mtie.map((p) => [p.tau_s, p.mtie_ns]),
    tdev: Array.isArray(result.tdev) ? result.tdev.map((p) => [p.tau_s, p.tdev_ns]) : [],
    masks: (result.masks || []).map((m) => ({
      id: m.id, title: m.title, recommendation: m.recommendation, condition: m.condition, verdict: m.verdict,
      checks: (m.checks || []).map((c) => ({ metric: c.metric, limit_ns: c.limit_ns, value_ns: c.value_ns, margin_ns: c.margin_ns, worst_tau_s: c.worst_tau_s, verdict: c.verdict, source: c.source })),
    })),
    budgets: (result.budgets || []).map((b) => ({ name: b.name, max_abs_te_ns: b.max_abs_te_ns, exceeded: b.exceeded, time_to_exceed_s: b.time_to_exceed_s, source: b.source })),
    envelope: result.holdover_envelope || null,
  };
}

// Allan-deviation curves from the clock blocks, or [] when there are none.
export function adevCurves(result) {
  const out = [];
  for (const [k, i] of [["quantum", 0], ["classical", 1]]) {
    const c = result && result[k];
    if (c && Array.isArray(c.adev_curve) && c.adev_curve.length) {
      out.push({ label: c.spec && c.spec.id ? c.spec.id : k, color: SERIES_COLORS[i], points: c.adev_curve.filter((p) => p.tau_s > 0 && p.adev > 0).map((p) => [p.tau_s, p.adev]) });
    }
  }
  return out;
}

// Ground track from an ephemeris result's samples.
export function groundTrack(result) {
  const s = result && Array.isArray(result.samples) ? result.samples : null;
  if (!s || !s.length || typeof s[0].lat_deg !== "number") return null;
  return {
    points: s.map((p) => ({ t: p.t_s, lat: p.lat_deg, lon: p.lon_deg, visible: !!(p.station_view && p.station_view.visible) })),
    maxElevation: result.max_elevation_deg, peakDoppler: result.peak_doppler_hz,
  };
}

// 3-D track in km for the orbit view: eci_track ([x,y,z] km) or ephemeris gcrs_r_m.
export function orbitTrackKm(result) {
  if (result && Array.isArray(result.eci_track) && result.eci_track.length > 1) return result.eci_track;
  const g = groundTrack(result);
  if (g && result.samples[0].gcrs_r_m) return result.samples.map((p) => p.gcrs_r_m.map((v) => v / 1000));
  return null;
}

// Key figures of any result: numeric leaves of its figure-of-merit style blocks,
// labelled with the unit, note and provenance the engine documents in `units`.
const SKIP_TOP = /^(seed|schema_version|n_epochs|n_samples|jd_utc0)$/;
const SKIP_BLOCK = /^(units|figure_tiers|spec|quantum|classical|slot|oscillator|jammer|receiver|config|inputs?)$/;
export function keyFigures(result, max = 12) {
  if (!result || typeof result !== "object") return [];
  const units = result.units || {};
  const out = [];
  const push = (path, v) => {
    if (typeof v !== "number" || !Number.isFinite(v) || out.length >= max) return;
    const u = units[path] || {};
    out.push({ path, label: humanKey(path.split(".").pop()), value: v, unit: u.unit && u.unit !== "1" ? u.unit : "", note: u.note || "", provenance: u.provenance || "" });
  };
  const blocks = ["fom", "result", "decision", "fix", "verdict", "geometry", "summary", "holdover"];
  for (const b of blocks) {
    const o = result[b];
    if (o && typeof o === "object" && !Array.isArray(o)) for (const [k, v] of Object.entries(o)) push(`${b}.${k}`, v);
  }
  for (const k of ["quantum", "classical"]) {
    const c = result[k];
    if (c && c.fom) for (const [m, v] of Object.entries(c.fom)) push(`${k}.fom.${m}`, v);
  }
  // Then top-level scalars, then numeric leaves one level into any other object block.
  for (const [k, v] of Object.entries(result)) if (!SKIP_TOP.test(k)) push(k, v);
  for (const [b, o] of Object.entries(result)) {
    if (blocks.includes(b) || SKIP_BLOCK.test(b) || !o || typeof o !== "object" || Array.isArray(o)) continue;
    for (const [k, v] of Object.entries(o)) push(`${b}.${k}`, v);
  }
  return out;
}

const ACRONYMS = { js: "J/S", te: "TE", cn0: "C/N0", pdop: "PDOP", hdop: "HDOP", vdop: "VDOP", gdop: "GDOP", dop: "DOP", rms: "RMS", hpl: "HPL", vpl: "VPL", mtie: "MTIE", tdev: "TDEV", auc: "AUC", roc: "ROC", nis: "NIS", nees: "NEES", gnss: "GNSS", ins: "INS", ltc: "LTC", tcl: "TCL", eop: "EOP", od: "OD", vlbi: "VLBI", fom: "FoM", eirp: "EIRP", snr: "SNR", tpl: "TPL", p95: "p95", db: "(dB)", dbm: "(dBm)", dbhz: "(dB-Hz)", dbw: "(dBW)", dbi: "(dBi)" };
export function humanKey(k) {
  const words = String(k).split("_").map((w) => ACRONYMS[w.toLowerCase()] || w).join(" ")
    .replace(/\b(dbhz)\b/gi, "dB-Hz").replace(/\b(db)\b/gi, "dB").replace(/\bns\b/g, "(ns)").replace(/\bm s\b/g, "(m/s)")
    .replace(/\b(s)$/, "(s)").replace(/\b(m)$/, "(m)").replace(/\b(km)$/, "(km)").replace(/\b(deg)$/, "(°)").replace(/\b(hz)$/i, "(Hz)");
  return words.charAt(0).toUpperCase() + words.slice(1);
}

// The honesty label a result carries about itself: VALIDATED / MODELLED text in its
// `label` or `note`, or null.
export function resultLabel(result) {
  const t = result && (result.label || result.note);
  if (typeof t !== "string") return null;
  const m = t.match(/^(VALIDATED|MODELLED)/);
  return m ? { tier: m[1], text: t } : null;
}

// ---------------------------------------------------------------- SVG builders

// Line chart. model = { series:[{label,color,points}], threshold?, thresholdLabel?, outages?,
// xLabel, yLabel }. opts = { w, h, logX, logY, marks:[{x,y,label,color}] }.
// Returns { svg, hover } where hover = { W, ml, mr, samples:[x...], label(i) }.
export function lineChartSvg(model, opts = {}) {
  const W = opts.w || 760, H = opts.h || 340, ml = 64, mr = 20, mb = 46;
  opts = { ...opts, logX: opts.logX ?? model.logX, logY: opts.logY ?? model.logY };
  // Legend rows sit above the plot area, packed to the chart width, so a legend never covers
  // a line, a threshold label or an outage label.
  const legendRows = [[]];
  let rowW = 0;
  for (const ser of model.series) {
    const w = 28 + String(ser.label).length * 6.6;
    if (rowW + w > W - ml - mr && legendRows[legendRows.length - 1].length) { legendRows.push([]); rowW = 0; }
    legendRows[legendRows.length - 1].push({ ser, x: ml + rowW });
    rowW += w + 12;
  }
  const mt = 14 + legendRows.length * 16;
  const pts = model.series.flatMap((s) => s.points);
  const fx = opts.logX ? (v) => Math.log10(v) : (v) => v;
  const fy = opts.logY ? (v) => Math.log10(Math.abs(v)) : (v) => v;
  const ok = (p) => Number.isFinite(fx(p[0])) && Number.isFinite(fy(p[1]));
  const good = pts.filter(ok);
  if (good.length < 2) return { svg: "", hover: null };
  let x0 = Math.min(...good.map((p) => fx(p[0]))), x1 = Math.max(...good.map((p) => fx(p[0])));
  const ys = good.map((p) => fy(p[1]));
  if (Number.isFinite(model.threshold) && !opts.logY) ys.push(model.threshold);
  for (const m of opts.marks || []) if (Number.isFinite(m.y)) ys.push(fy(m.y));
  let y0 = Math.min(...ys), y1 = Math.max(...ys);
  if (!opts.logY) { y0 = Math.min(0, y0); const pad = (y1 - y0) * 0.08 || 1; y1 += pad; }
  if (x1 === x0) x1 = x0 + 1;
  if (y1 === y0) y1 = y0 + 1;
  const px = (v) => ml + ((fx(v) - x0) / (x1 - x0)) * (W - ml - mr);
  const py = (v) => mt + (1 - (fy(v) - y0) / (y1 - y0)) * (H - mt - mb);
  let s = `<svg class="chart" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${esc(model.title || "chart")}" xmlns="http://www.w3.org/2000/svg">`;
  s += `<rect class="c-bg" width="${W}" height="${H}" rx="0"/>`;
  let noted = false;
  for (const [a, b] of model.outages || []) {
    const xa = px(a), xb = px(b);
    s += `<rect class="c-outage" x="${xa.toFixed(1)}" y="${mt}" width="${Math.max(0, xb - xa).toFixed(1)}" height="${H - mt - mb}"/>`;
    // Label one outage only, and only where the band is wide enough to hold the words.
    if (!noted && xb - xa >= 84) { s += `<text class="c-note" x="${(xa + 6).toFixed(1)}" y="${mt + 14}">GNSS denied</text>`; noted = true; }
  }
  if (!noted && (model.outages || []).length) s += `<text class="c-note" x="${W - mr - 4}" y="${mt + 14}" text-anchor="end">shaded: GNSS denied</text>`;
  const xt = opts.logX ? decades(x0, x1) : niceTicks(x0, x1, 6);
  for (const v of xt) {
    const x = opts.logX ? ml + ((v - x0) / (x1 - x0)) * (W - ml - mr) : px(v);
    s += `<line class="c-grid" x1="${x.toFixed(1)}" y1="${mt}" x2="${x.toFixed(1)}" y2="${H - mb}"/>`;
    s += `<text class="c-tick" x="${x.toFixed(1)}" y="${H - mb + 16}" text-anchor="middle">${opts.logX ? `10<tspan dy="-5" font-size="8">${v}</tspan>` : esc(fmt(v))}</text>`;
  }
  const yt = opts.logY ? decades(y0, y1) : niceTicks(y0, y1, 5);
  for (const v of yt) {
    const y = opts.logY ? mt + (1 - (v - y0) / (y1 - y0)) * (H - mt - mb) : py(v);
    s += `<line class="c-grid" x1="${ml}" y1="${y.toFixed(1)}" x2="${W - mr}" y2="${y.toFixed(1)}"/>`;
    s += `<text class="c-tick" x="${ml - 8}" y="${(y + 4).toFixed(1)}" text-anchor="end">${opts.logY ? `10<tspan dy="-5" font-size="8">${v}</tspan>` : esc(fmt(v))}</text>`;
  }
  s += `<text class="c-axis" x="${ml + (W - ml - mr) / 2}" y="${H - 8}" text-anchor="middle">${esc(model.xLabel || "")}</text>`;
  s += `<text class="c-axis" x="14" y="${mt + (H - mt - mb) / 2}" text-anchor="middle" transform="rotate(-90 14 ${mt + (H - mt - mb) / 2})">${esc(model.yLabel || "")}</text>`;
  const thrY = Number.isFinite(model.threshold) && !opts.logY ? py(model.threshold) : null;
  if (thrY != null) s += `<line class="c-thr" x1="${ml}" y1="${thrY.toFixed(1)}" x2="${W - mr}" y2="${thrY.toFixed(1)}"/>`;
  // The spoofing and timing series colours fall together under protanopia and deuteranopia
  // (ΔE2000 1.2): when both are on one chart the spoofing one is dashed, line and legend alike.
  const hasTim = model.series.some((x) => /--s-tim\b/.test(String(x.color)));
  const dashed = (ser) => !!ser.dash || (hasTim && /--s-spf\b/.test(String(ser.color)));
  model.series.forEach((ser, i) => {
    const p = ser.points.filter(ok);
    if (p.length < 2) return;
    const step = Math.max(1, Math.floor(p.length / 1400));
    const poly = p.filter((_, j) => j % step === 0 || j === p.length - 1).map((q) => `${px(q[0]).toFixed(1)},${py(q[1]).toFixed(1)}`).join(" ");
    s += dashed(ser) ? `<polyline class="c-line c-line-d" stroke-dasharray="6 4" style="stroke:${ser.color}" points="${poly}"/>` : `<polyline class="c-line" style="stroke:${ser.color}" points="${poly}"/>`;
  });
  // The threshold label is drawn over the series, so its halo keeps it readable where a line crosses.
  // A knock-out box behind it too: a series running along the threshold would otherwise show
  // through the letters (a halo only covers the glyph edges).
  if (thrY != null) {
    const lbl = `${model.thresholdLabel || "threshold"} ${fmt(model.threshold)}${model.unit ? " " + model.unit : ""}`;
    const tw = lbl.length * 6.5 + 8;
    s += `<rect class="c-thr-bg" x="${(W - mr - tw).toFixed(1)}" y="${(thrY - 17).toFixed(1)}" width="${tw.toFixed(1)}" height="15" rx="3"/>`;
    s += `<text class="c-thr-t" x="${W - mr - 4}" y="${(thrY - 6).toFixed(1)}" text-anchor="end">${esc(lbl)}</text>`;
  }
  legendRows.forEach((row, r) => {
    for (const { ser, x } of row) s += `<g class="c-legend" transform="translate(${x.toFixed(1)},${14 + r * 16})">${dashed(ser) ? `<path d="M0 -2.5h5M8 -2.5h6" style="stroke:${ser.color}" stroke-width="3" fill="none"/>` : `<rect width="14" height="3" y="-4" style="fill:${ser.color}"/>`}<text x="20" y="0">${esc(ser.label)}</text></g>`;
  });
  for (const m of opts.marks || []) {
    if (!Number.isFinite(m.x) || !Number.isFinite(m.y)) continue;
    s += `<circle class="c-mark" cx="${px(m.x).toFixed(1)}" cy="${py(m.y).toFixed(1)}" r="5" style="stroke:${m.color || "var(--s-int)"}"/>`;
    if (m.label) s += `<text class="c-mark-t" x="${(px(m.x) + 8).toFixed(1)}" y="${(py(m.y) - 8).toFixed(1)}">${esc(m.label)}</text>`;
  }
  s += `</svg>`;
  const base = model.series.find((x) => x.points.filter(ok).length > 1).points.filter(ok);
  const samples = base.map((p) => px(p[0]));
  const hover = {
    W, ml, mr, samples,
    label: (i) => {
      const t = base[i][0];
      const parts = model.series.map((ser) => {
        const q = nearestByX(ser.points, t);
        return q ? `${ser.label} ${fmt(q[1])}${model.unit ? " " + model.unit : ""}` : null;
      }).filter(Boolean);
      return `${opts.logX ? "τ" : "t"} = ${fmt(t)}${opts.logX ? " s" : " s"} · ${parts.join(" · ")}`;
    },
  };
  return { svg: s, hover };
}

function decades(a, b) {
  const out = [];
  for (let e = Math.ceil(a); e <= Math.floor(b); e++) out.push(e);
  return out;
}

export function nearestByX(points, x) {
  if (!points || !points.length) return null;
  let lo = 0, hi = points.length - 1;
  while (hi - lo > 1) { const mid = (lo + hi) >> 1; if (points[mid][0] < x) lo = mid; else hi = mid; }
  return Math.abs(points[lo][0] - x) <= Math.abs(points[hi][0] - x) ? points[lo] : points[hi];
}

// Waterfall of effective C/N0: one row per satellite, one column per epoch.
// opts.field: "cn0_effective_dbhz" (with the jammer, default) or "cn0_nominal_dbhz" (without it).
// opts.upTo: draw only the first N epochs (a replay), leaving the rest as empty track.
export function signalHeatmapSvg(sig, opts = {}) {
  const field = opts.field || "cn0_effective_dbhz";
  const upTo = Number.isFinite(opts.upTo) ? opts.upTo : Infinity;
  const W = opts.w || 760, rowH = Math.max(10, Math.min(22, 300 / Math.max(1, sig.prns.length)));
  const ml = 56, mr = 16, mt = 16, mb = 40;
  const H = mt + mb + rowH * sig.prns.length;
  const n = sig.times.length;
  const cw = (W - ml - mr) / n;
  const [lo, hi] = sig.cn0Range;
  let s = `<svg class="chart" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${field === "cn0_nominal_dbhz" ? "Nominal (no jammer)" : "Effective"} carrier-to-noise density by satellite and time" xmlns="http://www.w3.org/2000/svg">`;
  s += `<rect class="c-bg" width="${W}" height="${H}"/>`;
  sig.prns.forEach((prn, r) => {
    const y = mt + r * rowH;
    s += `<text class="c-tick" x="${ml - 8}" y="${(y + rowH * 0.7).toFixed(1)}" text-anchor="end">PRN ${esc(prn)}</text>`;
    sig.cells.forEach((row, c) => {
      const sat = row[prn];
      if (!sat || c >= upTo) return;
      const v = sat[field];
      if (!Number.isFinite(v)) return;
      const lost = Number.isFinite(sig.threshold) ? v < sig.threshold : sat.status === "LOST";
      const t = hi > lo ? (v - lo) / (hi - lo) : 1;
      const tip = opts.titles === false ? "" : `<title>t ${esc(fmt(sig.times[c]))} s · PRN ${esc(prn)} · C/N0 ${esc(fmt(v))} dB-Hz${Number.isFinite(sat.js_db) ? ` · J/S ${esc(fmt(sat.js_db))} dB` : ""}${lost ? " · below tracking threshold" : ""}</title>`;
      s += `<rect x="${(ml + c * cw).toFixed(2)}" y="${y.toFixed(1)}" width="${(cw + 0.4).toFixed(2)}" height="${(rowH - 1.5).toFixed(1)}" style="fill:${heat(t)}"${lost ? ' class="c-lost"' : ""}>${tip}</rect>`;
    });
  });
  const ticks = niceTicks(sig.times[0], sig.times[n - 1], 6);
  const span = sig.times[n - 1] - sig.times[0] || 1;
  for (const v of ticks) {
    const x = ml + ((v - sig.times[0]) / span) * (W - ml - mr);
    s += `<text class="c-tick" x="${x.toFixed(1)}" y="${H - mb + 16}" text-anchor="middle">${esc(fmt(v))}</text>`;
  }
  s += `<text class="c-axis" x="${ml + (W - ml - mr) / 2}" y="${H - 6}" text-anchor="middle">time (s)</text>`;
  s += `</svg>`;
  return s;
}

// Sequential colour for 0..1 (low C/N0 = deep red, high = cyan), readable on the space ground.
export function heat(t) {
  const x = Math.max(0, Math.min(1, t));
  const stops = [[0, [110, 18, 36]], [0.35, [255, 91, 84]], [0.6, [255, 178, 36]], [0.8, [61, 220, 132]], [1, [44, 208, 222]]];
  let i = 0;
  while (i < stops.length - 2 && x > stops[i + 1][0]) i++;
  const [a, ca] = stops[i], [b, cb] = stops[i + 1];
  const f = (x - a) / (b - a || 1);
  const c = ca.map((v, k) => Math.round(v + (cb[k] - v) * f));
  return `rgb(${c[0]},${c[1]},${c[2]})`;
}

// Equirectangular ground track with a graticule; visible-pass samples highlighted.
export function groundTrackSvg(gt, opts = {}) {
  const W = opts.w || 760, H = W / 2;
  const px = (lon) => ((lon + 180) / 360) * W;
  const py = (lat) => ((90 - lat) / 180) * H;
  let s = `<svg class="chart" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="Ground track" xmlns="http://www.w3.org/2000/svg"><rect class="c-bg" width="${W}" height="${H}"/>`;
  for (let lon = -180; lon <= 180; lon += 30) s += `<line class="c-grid" x1="${px(lon)}" y1="0" x2="${px(lon)}" y2="${H}"/>`;
  for (let lat = -90; lat <= 90; lat += 30) s += `<line class="c-grid" x1="0" y1="${py(lat)}" x2="${W}" y2="${py(lat)}"/>`;
  // Real coastlines when a land outline is supplied (Natural Earth, public domain).
  for (const ring of opts.land || []) {
    s += `<polyline class="c-land" points="${ring.map(([lon, lat]) => `${px(lon).toFixed(1)},${py(lat).toFixed(1)}`).join(" ")}"/>`;
  }
  s += `<line class="c-eq" x1="0" y1="${py(0)}" x2="${W}" y2="${py(0)}"/>`;
  let seg = [];
  const flush = (vis) => {
    if (seg.length > 1) s += `<polyline class="${vis ? "c-track-vis" : "c-track"}" points="${seg.map((p) => `${px(p.lon).toFixed(1)},${py(p.lat).toFixed(1)}`).join(" ")}"/>`;
    seg = [];
  };
  let prev = null;
  for (const p of gt.points) {
    if (prev && (Math.abs(p.lon - prev.lon) > 180 || p.visible !== prev.visible)) { const vis = prev.visible; if (Math.abs(p.lon - prev.lon) <= 180) seg.push(p); flush(vis); }
    seg.push(p);
    prev = p;
  }
  if (prev) flush(prev.visible);
  s += `</svg>`;
  return s;
}

// Resolve CSS custom properties in an inline SVG so a downloaded copy keeps its colours.
export function resolveVars(svg, lookup) {
  return svg.replace(/var\((--[\w-]+)\)/g, (m, name) => lookup(name) || m);
}
