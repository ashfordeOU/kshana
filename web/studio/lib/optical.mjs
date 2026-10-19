// SPDX-License-Identifier: AGPL-3.0-only
// The Optical PNT page's reader and charts. It reads the engine's recorded result of an `optical-atmosphere`
// scenario (the `json` field of recorded/<name>.json) and draws what it holds, as SVG markup: the link budget, the
// availability of each site against its ceiling, the margin each availability target needs, the outage durations,
// the timing a clock keeps through an outage, site diversity and the enhancement techniques. The result is
// statistical: it has no time series of cloud or fade, so none is drawn and none is made up; the "against time"
// the plan imagines would need the engine to write one. Every number is copied from the result; the page only
// scales it. Pure; tested in optical.test.mjs.

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const arr = (x) => (Array.isArray(x) ? x : []);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
const f1 = (v) => (Math.round(v * 10) / 10).toString();

export const SCENARIOS = Object.freeze([
  { id: "optical-atmosphere-network", title: "Three ground sites, site diversity", blurb: "A cloudier northern, a middling central and a clearer southern site view a LEO optical terminal at 30 degrees: how often is the link up, and what do extra sites buy?" },
  { id: "optical-atmosphere-techniques", title: "One uplink, enhancement techniques", blurb: "One uplink at 25 degrees in cloud and turbulence: what do another wavelength, a larger aperture, adaptive optics or more margin buy?" },
]);

// A site's seeded realisation (the engine's `timeseries`), or null when the run has none (a 0.37 result, or no [timeseries] table).
function readSeries(t) {
  if (!t || !Array.isArray(t.margin_db) || !t.margin_db.length) return null;
  const col = (k) => arr(t[k]).map((v) => (isNum(v) ? v : 0));
  const margin = col("margin_db"), n = margin.length, cloud = col("cloud_db"), up = col("up");
  if (cloud.length !== n || up.length !== n) return null;
  return { seed: num(t.seed), stepS: num(t.step_s), durationH: num(t.duration_h), steps: n, margin, cloud, scint: col("scint_db"), up,
    realised: { availability: num(t.realised && t.realised.availability_pct), cloud: num(t.realised && t.realised.cloud_fraction_pct), outages: num(t.realised && t.realised.outages), longestH: num(t.realised && t.realised.longest_outage_h) } };
}

// The result document -> the view model, or { error }.
export function readOptical(doc) {
  let j;
  try { j = typeof doc.json === "string" ? JSON.parse(doc.json) : doc.json; } catch (e) { return { error: `the result is not JSON (${e.message})` }; }
  if (!j || j.kind !== "optical-atmosphere" || !Array.isArray(j.sites) || !j.sites.length) return { error: "this is not an optical-atmosphere result with sites" };
  const sites = j.sites.map((s) => ({
    name: String(s.name), lat: num(s.lat_deg), lon: num(s.lon_deg), altitudeM: num(s.altitude_m), pCloud: num(s.p_cloud),
    availability: num(s.availability_pct), ceiling: num(s.availability_ceiling_pct), clearSky: num(s.clear_sky_availability_pct),
    clearAirLossDb: num(s.clear_air_loss_db), fadeBudgetDb: num(s.fade_budget_db), source: String(s.data_source || ""),
    margins: arr(s.margin_for_availability).map((m) => ({ target: num(m.target_pct), extraDb: num(m.extra_margin_db), requiredDb: num(m.required_margin_no_atmosphere_db) })),
    exceed: arr(s.outages && s.outages.exceedance).map((e) => ({ h: num(e.duration_h), p: num(e.probability), tf: num(e.time_fraction) })),
    quantiles: arr(s.outages && s.outages.quantiles).map((q) => ({ h: num(q.duration_h), p: num(q.probability) })),
    meanOutageH: num(s.outages && s.outages.mean_h), perYear: num(s.outages && s.outages.per_year),
    holdover: arr(s.holdover).map((h) => ({ clock: String(h.clock), holdoverS: num(h.holdover_s), timingAvail: num(h.timing_availability_pct), thresholdNs: num(h.threshold_ns), errors: arr(h.errors).map((e) => ({ label: String(e.label), h: num(e.duration_h), sigmaNs: num(e.timing_sigma_ns), rangeM: num(e.range_sigma_m) })) })),
    techniques: arr(s.techniques).map((t) => ({ name: String(t.name), baseline: num(t.baseline_pct), withTech: num(t.with_technique_pct), gain: num(t.gain_pct_points), marginDeltaDb: num(t.margin_delta_db), extraMarginDb: num(t.extra_margin_db) })),
    series: readSeries(s.timeseries),
    turbulence: s.turbulence ? { rytov: num(s.turbulence.rytov_variance), scint: num(s.turbulence.scintillation_index), apertureAvg: num(s.turbulence.aperture_averaging_factor), fadeMarginDb: num(s.turbulence.fade_margin_db_at_1e-3) } : null,
  }));
  return {
    model: {
      label: String(j.label || ""), advisory: String(j.advisory || ""), summary: String(doc.summary || ""), engine: String(doc.engine_version || ""), file: String(doc.file || ""),
      inputs: { wavelengthNm: num(j.inputs && j.inputs.wavelength_nm), elevationDeg: num(j.inputs && j.inputs.elevation_deg), direction: String((j.inputs && j.inputs.direction) || ""), wave: String((j.inputs && j.inputs.wave) || ""), correlationKm: num(j.inputs && j.inputs.correlation_length_km) },
      link: { geometricLossDb: num(j.link && j.link.geometric_loss_db), marginDb: num(j.link && j.link.margin_no_atmosphere_db), receivedDbm: num(j.link && j.link.received_power_no_atmosphere_dbm), sensitivityDbm: num(j.link && j.link.receiver_sensitivity_dbm), footprintM: num(j.link && j.link.footprint_m) },
      sites,
      network: arr(j.network && j.network.rows).map((r) => ({ n: num(r.n), independent: num(r.independent_pct), correlated: num(r.correlated_pct), sites: arr(r.sites).map(String) })),
      pairs: arr(j.network && j.network.pair_correlation).map((p) => ({ a: String(p.a), b: String(p.b), km: num(p.distance_km), rho: num(p.rho) })),
    },
  };
}

// ---------- charts (SVG markup; classes are styled in optical/optical.css) ----------

const W = 560;
let CUR_W = W; // the width charts are drawn at: the chart that spans the whole row is drawn wider
// Horizontal bars: rows of { label, value, text, cls } on a 0..max scale; the value is also written as text.
export function barsSvg(rows, { max = 100, label = "bars", w = CUR_W } = {}) {
  const L = 150, R = w - 70, rh = 26, h = rows.length * rh + 10;
  const out = [`<svg class="op-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(label)}">`];
  rows.forEach((r, i) => {
    const y = 6 + i * rh, bw = isNum(r.value) ? Math.max(0, Math.min(1, r.value / max)) * (R - L) : 0;
    out.push(`<text class="op-t" x="${L - 8}" y="${y + 15}" text-anchor="end">${esc(r.label)}</text><rect class="op-track" x="${L}" y="${y + 3}" width="${R - L}" height="14" rx="3"/><rect class="op-bar ${r.cls || ""}" x="${L}" y="${y + 3}" width="${f1(bw)}" height="14" rx="3"><title>${esc(r.label)}: ${esc(r.text)}</title></rect><text class="op-v" x="${R + 8}" y="${y + 15}">${esc(r.text)}</text>`);
  });
  return out.join("") + "</svg>";
}

// Lines of (x, y) per series on linear or log x, with the series name written at the line's end (no colour-only key).
export function linesSvg(series, { xLabel, yLabel, xLog = false, yMax = null, yMin = 0, w = CUR_W, h = 230, label = "chart" } = {}) {
  const L = 52, R = w - 96, T = 26, B = h - 38;
  const xs = series.flatMap((s) => s.points.map((p) => p[0])).filter((v) => isNum(v) && (!xLog || v > 0)), ys = series.flatMap((s) => s.points.map((p) => p[1])).filter(isNum);
  if (!xs.length) return `<svg class="op-chart" viewBox="0 0 ${w} 40" role="img" aria-label="${esc(label)}"><text class="op-t" x="8" y="24">No data in this result.</text></svg>`;
  const tx = (v) => (xLog ? Math.log10(v) : v), x0 = Math.min(...xs.map(tx)), x1 = Math.max(...xs.map(tx)), y1 = yMax ?? Math.max(...ys), y0 = yMin;
  const X = (v) => L + ((tx(v) - x0) / Math.max(1e-12, x1 - x0)) * (R - L), Y = (v) => B - ((v - y0) / Math.max(1e-12, y1 - y0)) * (B - T);
  const out = [`<svg class="op-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(label)}">`, `<path class="op-ax" d="M${L} ${T}V${B}H${R}"/>`];
  for (let i = 0; i <= 4; i++) { const v = y0 + ((y1 - y0) * i) / 4; out.push(`<line class="op-grid" x1="${L}" x2="${R}" y1="${f1(Y(v))}" y2="${f1(Y(v))}"/><text class="op-t" x="${L - 6}" y="${f1(Y(v) + 4)}" text-anchor="end">${esc(f1(v))}</text>`); }
  const xt = [...new Set(xs)].sort((a, b) => a - b);
  for (const v of xt.length > 7 ? xt.filter((_, i) => i % Math.ceil(xt.length / 6) === 0) : xt) out.push(`<text class="op-t" x="${f1(X(v))}" y="${B + 15}" text-anchor="middle">${esc(f1(v))}</text>`);
  out.push(`<text class="op-t" x="${(L + R) / 2}" y="${h - 6}" text-anchor="middle">${esc(xLabel || "")}</text><text class="op-t" x="8" y="12">${esc(yLabel || "")}</text>`);
  const ends = [];
  series.forEach((s, i) => {
    const pts = s.points.filter((p) => isNum(p[0]) && isNum(p[1]) && (!xLog || p[0] > 0));
    if (!pts.length) return;
    out.push(`<path class="op-line op-s${i % 4}" d="${pts.map((p, j) => `${j ? "L" : "M"}${f1(X(p[0]))} ${f1(Y(p[1]))}`).join("")}"><title>${esc(s.name)}</title></path>`);
    for (const p of pts) out.push(`<circle class="op-pt op-s${i % 4}" cx="${f1(X(p[0]))}" cy="${f1(Y(p[1]))}" r="3.2"><title>${esc(`${s.name}: ${xLabel || "x"} ${f1(p[0])}, ${yLabel || "y"} ${f1(p[1])}`)}</title></circle>`);
    const last = pts[pts.length - 1];
    ends.push({ i, name: s.name, x: X(last[0]) + 7, y: Y(last[1]) + 4 });
  });
  // the names at the ends of the lines, pushed apart so none covers another
  ends.sort((a, b) => a.y - b.y);
  for (let k = 1; k < ends.length; k++) if (ends[k].y - ends[k - 1].y < 12) ends[k].y = ends[k - 1].y + 12;
  for (const e of ends) out.push(`<text class="op-t op-end op-s${e.i % 4}" x="${f1(e.x)}" y="${f1(e.y)}">${esc(e.name)}</text>`);
  return out.join("") + "</svg>";
}

// The link margin of every site through time, as small multiples on one hour axis: the margin line against the line where the
// link closes (0 dB), a stripe of the steps the link was down and a stripe of the steps inside a cloud episode. Drawn from the
// engine's seeded realisation; the margin is clipped at `floorDb` for drawing only (a thick cloud is far below any scale).
export function seriesSvg(sites, { w = CUR_W, floorDb = -40, label = "Link margin against time" } = {}) {
  const withS = sites.filter((s) => s.series);
  if (!withS.length) return `<svg class="op-chart" viewBox="0 0 ${w} 40" role="img" aria-label="${esc(label)}"><text class="op-t" x="8" y="24">No time series in this result.</text></svg>`;
  const L = 112, R = w - 16, rowH = 132, top0 = 8;
  const out = [`<svg class="op-chart" viewBox="0 0 ${w} ${top0 + withS.length * rowH + 22}" role="img" aria-label="${esc(label)}">`];
  const hours = Math.max(...withS.map((s) => s.series.steps * (s.series.stepS || 0) / 3600));
  withS.forEach((s, i) => {
    const ts = s.series, y0 = top0 + i * rowH, T = y0 + 6, B = y0 + 78, X = (h) => L + (h / hours) * (R - L);
    const hi = Math.max(1, ...ts.margin) + 1, Y = (v) => B - ((Math.min(hi, Math.max(floorDb, v)) - floorDb) / (hi - floorDb)) * (B - T);
    out.push(`<text class="op-t op-end" x="8" y="${T + 12}">${esc(s.name)}</text><text class="op-t" x="8" y="${T + 26}">${esc(pct(ts.realised.availability))} up</text><text class="op-t" x="8" y="${T + 40}">stated ${esc(pct(s.availability))}</text>`);
    out.push(`<line class="op-grid" x1="${L}" x2="${R}" y1="${f1(Y(0))}" y2="${f1(Y(0))}"/><text class="op-t" x="${L - 6}" y="${f1(Y(0) + 4)}" text-anchor="end">0 dB</text>`);
    out.push(`<path class="op-ax" d="M${L} ${T}V${B}H${R}"/><text class="op-t" x="${L - 6}" y="${T + 8}" text-anchor="end">${f1(hi)}</text><text class="op-t" x="${L - 6}" y="${B}" text-anchor="end">${floorDb}</text>`);
    const step = Math.max(1, Math.floor(ts.steps / 1400));
    let d = "";
    for (let k = 0; k < ts.steps; k += step) d += `${k ? "L" : "M"}${f1(X((k * ts.stepS) / 3600))} ${f1(Y(ts.margin[k]))}`;
    out.push(`<path class="op-line op-s${i % 4}" d="${d}"><title>${esc(s.name)}: link margin, dB</title></path>`);
    const stripe = (flag, yy, cls, what) => { let a = null; for (let k = 0; k <= ts.steps; k++) { const on = k < ts.steps && flag(k); if (on && a == null) a = k; if (!on && a != null) { out.push(`<rect class="${cls}" x="${f1(X((a * ts.stepS) / 3600))}" y="${yy}" width="${f1(Math.max(1, X((k * ts.stepS) / 3600) - X((a * ts.stepS) / 3600)))}" height="10"><title>${esc(what)}, hour ${f1((a * ts.stepS) / 3600)} to ${f1((k * ts.stepS) / 3600)}</title></rect>`); a = null; } } };
    stripe((k) => ts.up[k] === 0, B + 6, "op-down", "link down");
    stripe((k) => ts.cloud[k] > 0, B + 20, "op-cloudstripe", "cloud episode");
    out.push(`<text class="op-t" x="${L - 6}" y="${B + 15}" text-anchor="end">down</text><text class="op-t" x="${L - 6}" y="${B + 29}" text-anchor="end">cloud</text>`);
  });
  const yb = top0 + withS.length * rowH + 14;
  for (let h = 0; h <= hours; h += hours > 200 ? 48 : 24) out.push(`<text class="op-t" x="${f1(L + (h / hours) * (R - L))}" y="${yb}" text-anchor="middle">${h}</text>`);
  out.push(`<text class="op-t" x="${L - 6}" y="${yb}" text-anchor="end">hours</text>`);
  return out.join("") + "</svg>";
}

// The charts for a model: [{ id, title, note, svg }] in the order shown.
export function chartsOf(m, { wide = false } = {}) {
  const out = [];
  const s0 = m.sites;
  if (s0.some((s) => s.series)) {
    const t = s0.find((s) => s.series).series;
    out.push({ id: "series", fullRow: true, title: "Link margin against time", note: `One seeded realisation of the stated site model (seed ${t.seed}, ${t.durationH} h at ${t.stepS} s steps): cloud episodes, a liquid-water column for each, one scintillation sample per step. The margin is the fade budget minus the cloud and scintillation fades; the link is down below 0 dB. It is one draw, not the climate: its availability differs from the stated one by the draw's sampling error. Margin is clipped at −40 dB for drawing.`, make: () => seriesSvg(s0) });
  }
  out.push({ id: "avail", title: "Availability against the ceiling", note: "Per site: the link's availability against cloud and turbulence fades, the ceiling no extra margin can lift (cloud and pointing), and the availability with no cloud at all.",
    make: () => barsSvg(s0.flatMap((s) => [{ label: `${s.name}: available`, value: s.availability, text: pct(s.availability), cls: "a" }, { label: `${s.name}: ceiling`, value: s.ceiling, text: pct(s.ceiling), cls: "c" }, { label: `${s.name}: clear sky`, value: s.clearSky, text: pct(s.clearSky), cls: "k" }]), { label: "Availability, ceiling and clear-sky availability per site" }) });
  out.push({ id: "margin", title: "Margin each availability target needs", note: "Extra link margin, in dB on top of the present link, for each availability target; negative means the link already has more than it needs. A target above a site's ceiling has no margin that reaches it (the engine leaves it out).",
    make: () => linesSvg(s0.map((s) => ({ name: s.name, points: s.margins.map((q) => [q.target, q.extraDb]) })).filter((s) => s.points.length), { xLabel: "availability target, %", yLabel: "extra margin, dB", yMin: Math.min(0, ...s0.flatMap((s) => s.margins.map((q) => q.extraDb)).filter(isNum)), yMax: Math.max(1, ...s0.flatMap((s) => s.margins.map((q) => q.extraDb)).filter(isNum)), label: "Extra margin needed for each availability target" }) });
  out.push({ id: "outage", title: "How long outages last", note: "Probability that an outage lasts longer than a duration, per site (log time axis).",
    make: () => linesSvg(s0.map((s) => ({ name: s.name, points: s.exceed.map((e) => [e.h, e.p]) })), { xLog: true, xLabel: "outage duration, h (log)", yLabel: "P(longer)", yMax: 1, label: "Probability an outage lasts longer than a duration" }) });
  const hold = s0.flatMap((s) => s.holdover.map((h) => ({ label: `${s.name}: ${h.clock}`, value: h.timingAvail, text: pct(h.timingAvail), cls: "a" })));
  if (hold.length) out.push({ id: "timing", title: "Timing kept through the outages", note: "Fraction of all time the timing error stays within the threshold, per site and clock class: the clock's holdover against the outage durations.", make: () => barsSvg(hold, { label: "Timing availability per site and clock" }) });
  if (m.network.length > 1) out.push({ id: "diversity", title: "Site diversity", note: `Availability of the best 1, 2 and 3 sites, with independent weather and with weather correlated over ${m.inputs.correlationKm ?? "?"} km.`,
    make: () => linesSvg([{ name: "independent", points: m.network.map((r) => [r.n, r.independent]) }, { name: "correlated", points: m.network.map((r) => [r.n, r.correlated]) }], { xLabel: "best n sites", yLabel: "availability, %", yMin: Math.min(...m.network.map((r) => Math.min(r.independent, r.correlated)).filter(isNum)) - 5, yMax: 100, label: "Network availability against the number of sites" }) });
  const tech = s0.flatMap((s) => s.techniques.map((t) => ({ label: t.name, value: t.gain, text: `+${f1(t.gain ?? 0)} points`, cls: "a" })));
  if (tech.length) out.push({ id: "techniques", title: "What each technique buys", note: "Availability gain in percentage points over the baseline, for one site.", make: () => barsSvg(tech, { max: Math.max(1, ...tech.map((t) => t.value || 0)), label: "Availability gain per technique" }) });
  // A card left alone in the last row spans it (when the page has two columns) and is drawn at twice the width.
  const flow = out.filter((c) => !c.fullRow), last = flow[flow.length - 1];
  for (const c of out) {
    const span = wide && (c.fullRow || (flow.length % 2 === 1 && c === last));
    CUR_W = span ? W * 2 + 40 : W;
    c.wide = span; c.svg = c.make();
  }
  CUR_W = W;
  return out;
}
const pct = (v) => (isNum(v) ? `${v.toFixed(1)} %` : "n/a");

// Rows for the tables under the charts: [label, value] pairs from the model, units in the label.
export function factRows(m) {
  const l = m.link, i = m.inputs;
  return [
    ["Wavelength", i.wavelengthNm == null ? "n/a" : `${i.wavelengthNm} nm`], ["Elevation", i.elevationDeg == null ? "n/a" : `${i.elevationDeg}°`], ["Direction", `${i.direction}, ${i.wave} wave`],
    ["Geometric capture loss", dB(l.geometricLossDb)], ["Margin with no atmosphere", dB(l.marginDb)], ["Received power, no atmosphere", l.receivedDbm == null ? "n/a" : `${l.receivedDbm.toFixed(1)} dBm`],
    ["Receiver sensitivity", l.sensitivityDbm == null ? "n/a" : `${l.sensitivityDbm} dBm`], ["Beam footprint", l.footprintM == null ? "n/a" : `${l.footprintM.toFixed(1)} m`],
  ];
}
const dB = (v) => (isNum(v) ? `${v.toFixed(1)} dB` : "n/a");
export { pct as fmtPct, dB as fmtDb };
