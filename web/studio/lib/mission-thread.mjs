// SPDX-License-Identifier: AGPL-3.0-only
// The mission thread view's reader and charts. It reads the engine's result of a `mission-thread` scenario (schema
// kshana-mission-thread/1: phases[] with entry, peak and exit sigmas, budget_rows[], events[], margin and requirement; timeline[]; the
// weakest_link; the thread label) and draws it as SVG markup and table rows. Every number is copied from the result; the page only
// scales it: nothing is added, averaged or invented, and a field the result lacks is shown as "n/a", never guessed. Pure; tested in
// mission-thread.test.mjs against the engine's own Artemis-class example (recorded/mission-thread-artemis-class.json).

import { t } from "./t.mjs";

export const SCHEMA = "kshana-mission-thread/1";
export const METRICS = Object.freeze(["pos", "vel", "time"]);
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const arr = (x) => (Array.isArray(x) ? x : []);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
export const TIERS = Object.freeze(["VALIDATED", "MODELLED", "PARTNER"]);
const tierOf = (l) => { const x = String((l && l.tier) || "").toUpperCase(); return TIERS.includes(x) ? x : null; };

/** The engine's own number, written compactly with its unit ("17.3 m", "1.2 km", "100 ns"). Lengths pass to km from 10 000 m; times to ns, us, ms. */
export function fmtSigma(v, unit) {
  if (!isNum(v)) return t("js-mthread-na", "n/a");
  const sig = (x) => { const a = Math.abs(x); const d = a >= 100 ? 0 : a >= 10 ? 1 : a >= 1 ? 2 : 3; return String(Number(x.toFixed(d))); };
  if (unit === "m") return v >= 1e4 ? `${sig(v / 1e3)} km` : `${sig(v)} m`;
  if (unit === "s") { const a = Math.abs(v); if (a === 0) return "0 s"; if (a < 1e-6) return `${sig(v * 1e9)} ns`; if (a < 1e-3) return `${sig(v * 1e6)} µs`; if (a < 1) return `${sig(v * 1e3)} ms`; return `${sig(v)} s`; }
  if (unit === "m/s") return a2(v) + " m/s";
  if (unit === "deg") return `${sig(v)}°`;
  return `${sig(v)}${unit ? " " + unit : ""}`;
}
const a2 = (v) => { const a = Math.abs(v); return String(Number(v.toFixed(a >= 100 ? 0 : a >= 10 ? 1 : a >= 1 ? 2 : a >= 0.01 ? 3 : 4))); };

/** Mission elapsed time: "540 s", "9 min", "2.5 h", "11 d". */
export function fmtElapsed(s) {
  if (!isNum(s)) return t("js-mthread-na", "n/a");
  const r = (x) => String(Number(x.toFixed(x >= 100 ? 0 : x >= 10 ? 1 : 2)));
  if (s < 120) return `${r(s)} s`;
  if (s < 7200) return `${r(s / 60)} min`;
  if (s < 172800) return `${r(s / 3600)} h`;
  return `${r(s / 86400)} d`;
}

const phaseRows = (p) => arr(p.budget_rows).map((r) => ({ source: String(r.source || ""), sigma: num(r.sigma), unit: String(r.unit || ""), tier: tierOf(r.label), rowId: (r.label && r.label.row_id) || null }));

/** The result (or a recorded run wrapping it as `json`) -> { model } or { error }. A result of another schema is refused. */
export function readThread(doc) {
  let j = doc;
  try { if (doc && typeof doc.json === "string") j = JSON.parse(doc.json); else if (doc && doc.json && typeof doc.json === "object") j = doc.json; } catch (e) { return { error: t("js-mthread-not-json", "the result is not JSON ({ $reason })", { reason: e.message }) }; }
  if (!j || typeof j !== "object" || j.schema !== SCHEMA) return { error: t("js-mthread-not-thread", "this is not a mission-thread result (schema { $schema } expected)", { schema: SCHEMA }) };
  const phases = arr(j.phases).map((p, i) => ({
    index: isNum(p.index) ? p.index : i, id: String(p.id || `phase-${i + 1}`), kind: String(p.kind || ""),
    start: num(p.start_s), end: num(p.end_s), duration: num(p.duration_s),
    entry: { pos: num(p.entry_sigma_pos_m), vel: num(p.entry_sigma_vel_mps), time: num(p.entry_sigma_time_s) },
    peak: { pos: num(p.peak_sigma_pos_m), vel: num(p.peak_sigma_vel_mps), time: num(p.peak_sigma_time_s) },
    exit: { pos: num(p.exit_sigma_pos_m), vel: num(p.exit_sigma_vel_mps), time: num(p.exit_sigma_time_s) },
    margin: num(p.margin), requirement: { pos: num(p.requirement && p.requirement.max_pos_m), vel: num(p.requirement && p.requirement.max_vel_mps), time: num(p.requirement && p.requirement.max_time_s) },
    limiting: String(p.limiting_source || ""), nav: arr(p.nav_sources).map(String), timeSource: String(p.time_source || ""), tier: tierOf(p.label),
    rows: phaseRows(p), events: arr(p.events).map((e) => ({ t: num(e.t_s), what: String(e.what || "") })),
  }));
  const w = j.weakest_link && typeof j.weakest_link === "object" ? j.weakest_link : null;
  const model = {
    title: String(j.title || ""), epoch: String(j.epoch_utc || ""), seed: num(j.seed), notice: String(j.notice || ""), tier: tierOf(j.label), schema: SCHEMA,
    engine: String(doc.engine_version || ""), file: String(doc.file || ""), summary: String(doc.summary || ""),
    phases,
    weakest: w ? { phaseId: String(w.phase_id || ""), margin: num(w.margin), source: String(w.limiting_source || ""), basis: String(w.basis || ""), index: phases.findIndex((p) => p.id === w.phase_id) } : null,
    timeline: arr(j.timeline).map((s) => ({ phase: isNum(s.phase_index) ? s.phase_index : 0, t: num(s.t_s), pos: num(s.sigma_pos_m), vel: num(s.sigma_vel_mps), time: num(s.sigma_time_s) })).filter((s) => s.t !== null),
    units: j.units && typeof j.units === "object" ? Object.keys(j.units).length : 0,
  };
  if (!phases.length) return { error: t("js-mthread-no-phases", "the result holds no phases") };
  return { model };
}

/** Headline figures of the thread: counts and the total mission time. */
export function headline(m) {
  const end = m.phases.reduce((a, p) => (isNum(p.end) && p.end > a ? p.end : a), 0);
  const withReq = m.phases.filter((p) => p.margin !== null);
  const met = withReq.filter((p) => p.margin >= 1).length;
  return { phases: m.phases.length, elapsed: end, requirements: withReq.length, met, missed: withReq.length - met };
}

/** The phase table: one row per phase; `weakest` marks the row of the weakest link (the engine names it; the page does not recompute it). */
export function phaseTable(m) {
  return m.phases.map((p) => ({
    index: p.index, id: p.id, kind: p.kind, window: `${fmtElapsed(p.start)} → ${fmtElapsed(p.end)}`, duration: fmtElapsed(p.duration),
    peakPos: fmtSigma(p.peak.pos, "m"), peakVel: fmtSigma(p.peak.vel, "m/s"), peakTime: fmtSigma(p.peak.time, "s"),
    margin: p.margin, marginText: p.margin === null ? t("js-mthread-no-requirement", "no limit stated") : p.margin >= 1 ? t("js-mthread-margin-met", "{ $m }× the limit, met", { m: a2(p.margin) }) : t("js-mthread-margin-missed", "{ $m }× the limit, not met", { m: a2(p.margin) }),
    limiting: p.limiting, tier: p.tier, weakest: !!m.weakest && m.weakest.phaseId === p.id,
  }));
}

/** The budget of one phase: every contribution with its unit and label, the largest first. The engine names the phase's limiting source
 *  (`limiting_source`); the row whose source is exactly that name is flagged `limiting`, whatever its unit (a timing floor limits a surface
 *  phase although its row is in seconds). When the engine's name is a source of the phase rather than one row of the table (the Earth
 *  phases name "inertial dead reckoning", "relative sensing", "ground tracking" ...), no row is flagged: the page does not pick the
 *  largest row in its place. `limitingSource` is the engine's text either way; `limitingInTable` says whether a row carries it. */
export function budgetTable(m, phaseIndex) {
  const p = m.phases[phaseIndex] || m.phases[0];
  const rows = p.rows.map((r, i) => ({ ...r, order: i, shown: fmtSigma(r.sigma, r.unit) }));
  const posRows = rows.filter((r) => r.unit === "m" && r.sigma !== null);
  const max = posRows.reduce((a, r) => (r.sigma > a ? r.sigma : a), -Infinity);
  const flagged = p.limiting ? rows.findIndex((r) => r.source === p.limiting) : -1;
  const sorted = [...rows].sort((a, b) => (b.sigma ?? -1) - (a.sigma ?? -1));
  return {
    phase: p, limitingSource: p.limiting, limitingInTable: flagged >= 0,
    rows: sorted.map((r) => ({ ...r, limiting: r.order === flagged, bar: r.unit === "m" && isFinite(max) && max > 0 && r.sigma !== null ? Math.max(0, Math.min(1, r.sigma / max)) : null })),
    peak: { pos: fmtSigma(p.peak.pos, "m"), vel: fmtSigma(p.peak.vel, "m/s"), time: fmtSigma(p.peak.time, "s") },
    entry: { pos: fmtSigma(p.entry.pos, "m"), vel: fmtSigma(p.entry.vel, "m/s"), time: fmtSigma(p.entry.time, "s") },
    exit: { pos: fmtSigma(p.exit.pos, "m"), vel: fmtSigma(p.exit.vel, "m/s"), time: fmtSigma(p.exit.time, "s") },
    events: p.events.map((e) => ({ at: fmtElapsed(e.t), what: e.what })),
  };
}

const KEY = { pos: "pos", vel: "vel", time: "time" };
const UNIT = { pos: "m", vel: "m/s", time: "s" };
export const metricTitle = (k) => (k === "vel" ? t("js-mthread-metric-vel", "Velocity, 1-sigma") : k === "time" ? t("js-mthread-metric-time", "Clock bias, 1-sigma") : t("js-mthread-metric-pos", "Position, 1-sigma"));

/** The timeline: 1-sigma against mission elapsed time, one band per phase, on a log scale. `layout` is "phases" (equal width per phase, so a
 *  600 s descent is as visible as a 6-day surface stay) or "time" (true mission time). A phase's stated limit is drawn as a dashed line
 *  across its band; the weakest link's band is outlined and named. Returns SVG markup. */
export function timelineSvg(m, { metric = "pos", layout = "phases", width = 960, height = 360 } = {}) {
  const k = KEY[metric] || "pos", unit = UNIT[k];
  const L = 62, R = 16, T = 46, B = 46, W = width, H = height, iw = W - L - R, ih = H - T - B;
  const ps = m.phases;
  const t0 = ps[0].start ?? 0, t1 = Math.max(...ps.map((p) => p.end ?? 0), t0 + 1);
  const bandX = ps.map((p, i) => (layout === "time" ? [L + ((p.start - t0) / (t1 - t0)) * iw, L + ((p.end - t0) / (t1 - t0)) * iw] : [L + (i / ps.length) * iw, L + ((i + 1) / ps.length) * iw]));
  const xOf = (s) => {
    const sm = s.t;
    const i = Math.max(0, Math.min(ps.length - 1, ps.findIndex((p, j) => sm >= p.start && (sm < p.end || j === ps.length - 1))));
    const p = ps[i], f = p.end > p.start ? (sm - p.start) / (p.end - p.start) : 0;
    return bandX[i][0] + Math.max(0, Math.min(1, f)) * (bandX[i][1] - bandX[i][0]);
  };
  const vals = m.timeline.map((s) => s[k]).filter((v) => isNum(v) && v > 0);
  const lims = ps.map((p) => p.requirement[k]).filter((v) => isNum(v) && v > 0);
  const all = [...vals, ...lims];
  if (!all.length) return `<svg class="mtv-chart" viewBox="0 0 ${W} 60" role="img" aria-label="${esc(metricTitle(metric))}"><text class="mtv-t" x="${L}" y="30">${esc(t("js-mthread-no-series", "The result holds no samples of this quantity."))}</text></svg>`;
  const lo = Math.floor(Math.log10(Math.min(...all)) - 0.05), hi = Math.ceil(Math.log10(Math.max(...all)) + 0.05);
  const yOf = (v) => T + (1 - (Math.log10(v) - lo) / Math.max(1e-9, hi - lo)) * ih;
  const out = [`<svg class="mtv-chart" viewBox="0 0 ${W} ${H}" role="img" aria-labelledby="mtv-title-${k}">`];
  out.push(`<title id="mtv-title-${k}">${esc(t("js-mthread-chart-title", "{ $metric } against mission elapsed time, one band per phase", { metric: metricTitle(metric) }))}</title>`);
  // phase bands
  ps.forEach((p, i) => {
    const [x0, x1] = bandX[i];
    const weak = m.weakest && m.weakest.phaseId === p.id;
    out.push(`<g><rect class="mtv-band${i % 2 ? " alt" : ""}${weak ? " weak" : ""}" x="${x0.toFixed(1)}" y="${T}" width="${Math.max(0.5, x1 - x0).toFixed(1)}" height="${ih}"><title>${esc(`${p.id} · ${p.kind} · ${fmtElapsed(p.start)} → ${fmtElapsed(p.end)}`)}</title></rect>`);
    if (x1 - x0 > 26) out.push(`<text class="mtv-pl${weak ? " weak" : ""}" x="${((x0 + x1) / 2).toFixed(1)}" y="${T - 10}" text-anchor="middle">${esc(x1 - x0 > 70 ? p.id : String(i + 1))}</text>`);
    out.push("</g>");
  });
  // y grid and labels (decades)
  for (let e = lo; e <= hi; e++) {
    const y = yOf(10 ** e);
    out.push(`<line class="mtv-gl" x1="${L}" x2="${W - R}" y1="${y.toFixed(1)}" y2="${y.toFixed(1)}"/>`);
    out.push(`<text class="mtv-t" x="${L - 6}" y="${(y + 3.5).toFixed(1)}" text-anchor="end">${esc(fmtSigma(10 ** e, unit))}</text>`);
  }
  out.push(`<line class="mtv-ax" x1="${L}" x2="${L}" y1="${T}" y2="${T + ih}"/><line class="mtv-ax" x1="${L}" x2="${W - R}" y1="${T + ih}" y2="${T + ih}"/>`);
  // stated limits across their bands
  ps.forEach((p, i) => { const v = p.requirement[k]; if (isNum(v) && v > 0) { const y = yOf(v); out.push(`<line class="mtv-lim" x1="${bandX[i][0].toFixed(1)}" x2="${bandX[i][1].toFixed(1)}" y1="${y.toFixed(1)}" y2="${y.toFixed(1)}"><title>${esc(t("js-mthread-limit-title", "{ $phase }: the stated limit, { $limit }", { phase: p.id, limit: fmtSigma(v, unit) }))}</title></line>`); } });
  // the series, one path per phase so a handover shows as a break
  ps.forEach((p, i) => {
    const pts = m.timeline.filter((s) => s.phase === p.index && isNum(s[k]) && s[k] > 0);
    if (!pts.length) return;
    const step = Math.max(1, Math.floor(pts.length / 400));
    const d = pts.filter((_, n) => n % step === 0 || n === pts.length - 1).map((s, n) => `${n ? "L" : "M"}${xOf(s).toFixed(1)},${yOf(s[k]).toFixed(1)}`).join("");
    out.push(`<path class="mtv-line" d="${d}"/>`);
  });
  // weakest link marker
  if (m.weakest && m.weakest.index >= 0) { const [x0, x1] = bandX[m.weakest.index]; out.push(`<text class="mtv-weak" x="${((x0 + x1) / 2).toFixed(1)}" y="${T + ih + 16}" text-anchor="middle">${esc(t("js-mthread-weakest-mark", "weakest link"))}</text>`); }
  // x axis: mission time
  const ticks = layout === "time" ? 6 : 0;
  if (layout === "time") for (let i = 0; i <= ticks; i++) { const s = t0 + ((t1 - t0) * i) / ticks, x = L + (i / ticks) * iw; out.push(`<line class="mtv-gl" x1="${x.toFixed(1)}" x2="${x.toFixed(1)}" y1="${T + ih}" y2="${T + ih + 4}"/><text class="mtv-t" x="${x.toFixed(1)}" y="${T + ih + 30}" text-anchor="middle">${esc(fmtElapsed(s - t0))}</text>`); }
  else ps.forEach((p, i) => { if (bandX[i][1] - bandX[i][0] > 44) out.push(`<text class="mtv-t" x="${((bandX[i][0] + bandX[i][1]) / 2).toFixed(1)}" y="${T + ih + 30}" text-anchor="middle">${esc(fmtElapsed(p.start - t0))}</text>`); });
  out.push(`<text class="mtv-t" x="${L}" y="14">${esc(`${metricTitle(metric)} (${unit}), ${t("js-mthread-log-scale", "logarithmic scale")}`)}</text>`);
  out.push("</svg>");
  return out.join("");
}
