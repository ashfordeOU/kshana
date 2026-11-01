// SPDX-License-Identifier: AGPL-3.0-only
// The Holdover test view's reader and charts (0.38; engine kind `holdover-test`, docs/TIMING-HIL.md). It reads the engine's result for a
// time-error record the operator supplied, split at the two times the operator states and measured against public ITU-T masks, and draws
// what the result holds: the time error over the three phases with the stated limits, the recovery band and the times the budgets are first
// exceeded, MTIE and TDEV, and the mask checks. Nothing is judged here: a verdict is the engine's word, and every figure is "measured against
// the mask", never a statement that a clock or system meets a Recommendation. The time error itself is the operator's record, which the engine
// writes into the result as `record.series` ({ time_s, time_error_ns }, decimated to a stated number of points). The page draws that and nothing
// else: it has no parser of its own for a record, and a result without `record.series` is shown without a curve, and says so. Pure; tested in
// holdover.test.mjs.

import { t } from "./t.mjs";

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const arr = (x) => (Array.isArray(x) ? x : []);
const str = (x, n = 400) => (typeof x === "string" ? x.slice(0, n) : "");
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
const f1 = (v) => (Math.round(v * 10) / 10).toString();

export const SCENARIOS = Object.freeze([
  { id: "holdover-test-example", get title() { return t("js-hold-title-example", "A time-error record"); }, get blurb() { return t("js-hold-blurb-example", "Samples every 5 s: 600 s locked, GNSS removed at 600 s, holdover, GNSS restored at 2400 s. The record is generated for the example; it is not a measurement."); } },
  { id: "holdover-test-ptp4l", get title() { return t("js-hold-title-ptp4l", "A linuxptp log"); }, get blurb() { return t("js-hold-blurb-ptp4l", "The same four steps read from a ptp4l servo log (the daemon's own offset, in ns). The log is written for the example; no daemon ran."); } },
]);

// The recorded result document ({ json, summary, engine_version, ... }) -> { model } or { error }.
export function readHoldover(doc) {
  let j;
  try { j = typeof doc.json === "string" ? JSON.parse(doc.json) : doc.json; } catch (e) { return { error: t("js-hold-result-not-json", "the result is not JSON ({ $reason })", { reason: e.message }) }; }
  if (!j || j.kind !== "holdover-test" || !Array.isArray(j.steps) || !j.steps.length || !j.test || !j.record) return { error: t("js-hold-not-result", "this is not a holdover-test result") };
  const rec = j.record, tst = j.test;
  return {
    model: {
      evidence: j.evidence || undefined,
      label: str(j.label, 800), summary: str(doc.summary, 600), engine: str(doc.engine_version, 20), file: str(doc.file, 80),
      test: { removedS: num(tst.gnss_removed_s), restoredS: num(tst.gnss_restored_s), lockedDays: num(tst.locked_duration_days), bandNs: num(tst.recovery_band_ns), dwellS: num(tst.recovery_dwell_s), statedBy: str(tst.stated_by, 120) },
      record: { n: num(rec.n_samples), lengthS: num(rec.record_length_s), intervalS: num(rec.sample_interval_s), startS: num(rec.start_s), sha: str(rec.series_sha256, 80), series: readInlineSeries(rec.series) },
      steps: j.steps.map((s) => ({ name: str(s.name, 30), startS: num(s.start_s), endS: num(s.end_s), n: num(s.n_samples), meanNs: num(s.mean_te_ns), rmsNs: num(s.rms_te_ns), maxAbsNs: num(s.max_abs_te_ns), firstNs: num(s.first_te_ns), lastNs: num(s.last_te_ns) })),
      masks: arr(j.masks).map((m) => ({ id: str(m.id, 40), title: str(m.title, 200), condition: str(m.condition, 40), step: str(m.step, 30), verdict: str(m.verdict, 30), recommendation: str(m.recommendation, 200), notSpecified: str(m.not_specified, 400), filter: str(m.measurement_filter, 60),
        checks: arr(m.checks).map((c) => ({ metric: str(c.metric, 40), limitNs: num(c.limit_ns), valueNs: num(c.value_ns), marginNs: num(c.margin_ns), verdict: str(c.verdict, 30), source: str(c.source, 200), worstTauS: num(c.worst_tau_s), points: num(c.points_evaluated), note: str(c.note, 400) })) })),
      holdover: j.holdover ? { durationS: num(j.holdover.duration_s), ppb: num(j.holdover.frequency_offset_ppb), residualNs: num(j.holdover.fit_residual_rms_ns), maxAtS: num(j.holdover.time_of_max_abs_te_s), maxNs: num(j.holdover.te_at_max_abs_ns), stepNs: num(j.holdover.step_at_removal_ns) } : null,
      envelope: j.holdover_envelope ? { verdict: str(j.holdover_envelope.verdict, 30), tExceedS: num(j.holdover_envelope.time_to_exceed_s), minMarginNs: num(j.holdover_envelope.min_margin_ns), periodS: num(j.holdover_envelope.holdover_period_s), covers: j.holdover_envelope.covers_holdover_period === true, source: str(j.holdover_envelope.source, 200), lockedDays: num(j.holdover_envelope.locked_duration_days) } : null,
      budgets: arr(j.budgets).map((b) => ({ name: str(b.name, 120), maxNs: num(b.max_abs_te_ns), tExceedS: num(b.time_to_exceed_s), exceeded: b.exceeded === true, source: str(b.source, 240) })),
      recovery: j.recovery ? { recovered: j.recovery.recovered === true, afterS: num(j.recovery.time_to_recover_s), peakNs: num(j.recovery.peak_abs_te_ns), finalNs: num(j.recovery.final_abs_te_ns), stepNs: num(j.recovery.largest_step_ns), bandNs: num(j.recovery.band_ns), dwellS: num(j.recovery.dwell_s) } : null,
      curves: arr(j.curves).map((c) => ({ step: str(c.step, 30), tauS: num(c.tau_s), mtieNs: num(c.mtie_ns), tdevNs: num(c.tdev_ns) })).filter((c) => c.tauS != null),
      verdicts: j.verdicts && typeof j.verdicts === "object" ? Object.fromEntries(Object.entries(j.verdicts).map(([k, v]) => [str(k, 40), str(v, 40)])) : {},
      notCovered: arr(j.not_covered).map((x) => str(x, 500)),
    },
  };
}

// A series the engine may carry in the result itself (record.series): { time_s: [], time_error_ns: [] } or [[t, ns], ...]. null when absent.
function readInlineSeries(s) {
  if (!s) return null;
  if (Array.isArray(s) && s.every((p) => Array.isArray(p) && isNum(p[0]) && isNum(p[1]))) return { t: s.map((p) => p[0]), te: s.map((p) => p[1]) };
  if (Array.isArray(s.time_s) && Array.isArray(s.time_error_ns) && s.time_s.length === s.time_error_ns.length && s.time_s.every(isNum) && s.time_error_ns.every(isNum)) return { t: s.time_s.slice(), te: s.time_error_ns.slice() };
  return null;
}

// The series to draw: the one the result carries in `record.series`, and only if it is a series of a plausible record (at least two samples,
// time increasing, and, when the engine did not decimate it, the sample count its `record` block states). Returns { series, from } or
// { series: null, why }.
export function seriesFor(model) {
  const rec = model.record, s = rec.series;
  if (!s) return { series: null, why: t("js-hold-why-no-samples", "the result carries no time-error samples (record.series), so no curve is drawn") };
  if (s.t.length < 2 || s.t.some((t, k) => k && !(t > s.t[k - 1]))) return { series: null, why: t("js-hold-why-not-series", "the series in the result is not a time series (fewer than two samples, or time not increasing), so no curve is drawn") };
  if (rec.n != null && s.t.length > rec.n) return { series: null, why: t("js-hold-why-too-many", "the series in the result has { $have } samples where the engine scored { $scored }, so no curve is drawn", { have: s.t.length, scored: rec.n }) };
  return { series: s, from: s.t.length === rec.n ? t("js-hold-from-record", "the result's record") : t("js-hold-from-record-decimated", "the result's record, decimated to { $have } of { $total } samples", { have: s.t.length, total: rec.n }) };
}

// ---------- charts ----------

const PHASE = { get baseline() { return t("js-hold-phase-baseline", "Baseline: locked"); }, get holdover() { return t("js-hold-phase-holdover", "Holdover: GNSS removed"); }, get recovery() { return t("js-hold-phase-recovery", "Recovery: GNSS restored"); } };
const W = 880;

// Time error over the record, the three phases shaded, the operator's two times marked, the mask limits as ±lines, the recovery band and the times a
// budget or the ePRTC-A envelope is first exceeded. `series` is { t, te } or null (then only the frame and the markers are drawn).
export function teSvg(m, series, { w = W, h = 340 } = {}) {
  const L = 62, R = w - 16, T = 30, B = h - 44;
  const xs = series ? series.t : m.steps.flatMap((s) => [s.startS, s.endS]).filter(isNum);
  const t0 = Math.min(...xs), t1 = Math.max(...xs);
  const limits = m.masks.flatMap((k) => k.checks.filter((c) => c.metric === "max_abs_te" && c.limitNs != null).map((c) => { const st = m.steps.find((x) => x.name === k.step); return { id: k.id, ns: c.limitNs, verdict: c.verdict, step: k.step, from: st && st.startS != null ? st.startS : t0, to: st && st.endS != null ? st.endS : t1 }; }));
  const band = m.test.bandNs;
  const stepMax = Math.max(0, ...m.steps.map((s) => s.maxAbsNs || 0)), serMax = series ? Math.max(...series.te.map(Math.abs)) : 0;
  const ext = Math.max(10, serMax, stepMax, ...limits.map((l) => l.ns), band || 0) * 1.12;
  const X = (t) => L + ((t - t0) / Math.max(1e-9, t1 - t0)) * (R - L), Y = (v) => (T + B) / 2 - (v / ext) * ((B - T) / 2);
  const o = [`<svg class="ho-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(t("js-hold-te-aria", "Time error over the record, with the phases and the mask limits"))}">`];
  for (const s of m.steps) if (s.startS != null && s.endS != null) o.push(`<rect class="ho-ph ho-${esc(s.name)}" x="${f1(X(s.startS))}" y="${T}" width="${f1(Math.max(1, X(s.endS) - X(s.startS)))}" height="${B - T}"><title>${esc(t("js-hold-phase-title", "{ $phase }, T+{ $from } s to { $to } s", { phase: PHASE[s.name] || s.name, from: f1(s.startS), to: f1(s.endS) }))}</title></rect><text class="ho-t ho-phl" x="${f1(X(s.startS) + 6)}" y="${T + 13}">${esc(PHASE[s.name] || s.name)}</text>`);
  for (let i = -2; i <= 2; i++) { const v = (ext / 2.24) * i; o.push(`<line class="ho-grid" x1="${L}" x2="${R}" y1="${f1(Y(v))}" y2="${f1(Y(v))}"/><text class="ho-t" x="${L - 6}" y="${f1(Y(v) + 4)}" text-anchor="end">${esc(f1(v))}</text>`); }
  if (band != null) for (const sg of [1, -1]) o.push(`<line class="ho-band" x1="${L}" x2="${R}" y1="${f1(Y(sg * band))}" y2="${f1(Y(sg * band))}"><title>${esc(t("js-hold-band-title", "Recovery band ±{ $band } ns", { band: f1(band) }))}</title></line>`);
  // A limit is drawn over the step its mask names (the locked baseline for PRTC-A), not across the whole record.
  limits.forEach((l, i) => { for (const sg of [1, -1]) o.push(`<line class="ho-lim ho-v-${esc(l.verdict.toLowerCase())}" x1="${f1(X(l.from))}" x2="${f1(X(l.to))}" y1="${f1(Y(sg * l.ns))}" y2="${f1(Y(sg * l.ns))}"><title>${esc(t("js-hold-limit-title", "{ $id }: ±{ $ns } ns, the maximum absolute time error on the { $step } step", { id: l.id, ns: f1(l.ns), step: l.step }))}</title></line>`); o.push(`<text class="ho-t ho-limt" x="${f1(X(l.from) + 6)}" y="${f1(Y(l.ns) + 14 + i * 12)}" text-anchor="start">${esc(t("js-hold-limit-label", "±{ $ns } ns { $step } mask", { ns: f1(l.ns), step: l.step }))}<title>${esc(l.id)}</title></text>`); });
  for (const [tm, cls, name, short] of [[m.test.removedS, "ho-rm", t("js-hold-gnss-removed-stated", "GNSS removed (stated by the operator)"), t("js-hold-gnss-removed", "GNSS removed")], [m.test.restoredS, "ho-rs", t("js-hold-gnss-restored-stated", "GNSS restored (stated by the operator)"), t("js-hold-gnss-restored", "GNSS restored")]]) if (tm != null && tm >= t0 && tm <= t1) o.push(`<line class="${cls}" x1="${f1(X(tm))}" x2="${f1(X(tm))}" y1="${T - 4}" y2="${B + 4}"><title>${esc(t("js-hold-marker-time", "{ $name }, T+{ $time } s", { name, time: f1(tm) }))}</title></line><text class="ho-t" x="${f1(X(tm) + 5)}" y="${T + 28}" text-anchor="start">${esc(short)}</text>`);
  const marks = [];
  if (m.envelope && m.envelope.tExceedS != null && m.test.removedS != null) marks.push([m.test.removedS + m.envelope.tExceedS, t("js-hold-envelope-exceeded", "ePRTC-A holdover envelope first exceeded { $s } s after removal", { s: f1(m.envelope.tExceedS) })]);
  for (const b of m.budgets) if (b.exceeded && b.tExceedS != null && m.test.removedS != null) marks.push([m.test.removedS + b.tExceedS, t("js-hold-budget-exceeded", "{ $name } first exceeded { $s } s after removal", { name: b.name, s: f1(b.tExceedS) })]);
  marks.forEach(([tm, name]) => { if (tm >= t0 && tm <= t1) o.push(`<path class="ho-x" d="M${f1(X(tm))} ${B - 2}l-5 8h10z"><title>${esc(t("js-hold-marker-time", "{ $name }, T+{ $time } s", { name, time: f1(tm) }))}</title></path>`); });
  if (series) {
    const step = Math.max(1, Math.floor(series.t.length / 1500));
    let d = "";
    for (let k = 0; k < series.t.length; k += step) d += `${k ? "L" : "M"}${f1(X(series.t[k]))} ${f1(Y(series.te[k]))}`;
    o.push(`<path class="ho-line" d="${d}"><title>${esc(t("js-hold-te-line-title", "Time error, ns"))}</title></path>`);
  } else o.push(`<text class="ho-t" x="${(L + R) / 2}" y="${(T + B) / 2}" text-anchor="middle">${esc(t("js-hold-no-curve", "No time-error curve: the record could not be reproduced for drawing."))}</text>`);
  o.push(`<path class="ho-ax" d="M${L} ${T}V${B}H${R}"/><text class="ho-t" x="8" y="${T + 4}">${esc(t("js-hold-axis-te", "time error, ns"))}</text>`);
  for (let i = 0; i <= 6; i++) { const tk = t0 + ((t1 - t0) * i) / 6; o.push(`<text class="ho-t" x="${f1(X(tk))}" y="${h - 6}" text-anchor="middle">${esc(f1(tk))}</text>`); }
  o.push(`<text class="ho-t" x="${R}" y="${h - 22}" text-anchor="end">${esc(t("js-hold-axis-seconds", "seconds from the first sample"))}</text>`);
  return o.join("") + "</svg>";
}

// MTIE and TDEV against the observation time (log-log) for the steps the engine measured, with the mask limits as markers at the time the
// check was worst. `which` is "mtie" or "tdev".
export function curvesSvg(m, which, { w = 430, h = 300 } = {}) {
  const L = 54, R = w - 14, T = 18, B = h - 38;
  const pts = m.curves.filter((c) => (which === "mtie" ? c.mtieNs : c.tdevNs) > 0), key = (c) => (which === "mtie" ? c.mtieNs : c.tdevNs);
  const checks = m.masks.flatMap((k) => k.checks.filter((c) => c.metric === which && c.limitNs > 0 && c.worstTauS > 0).map((c) => ({ ...c, id: k.id })));
  if (!pts.length) return `<svg class="ho-chart" viewBox="0 0 ${w} 40" role="img" aria-label="${esc(which)}"><text class="ho-t" x="8" y="24">${esc(t("js-hold-no-which-curve", "No { $which } curve in this result.", { which: which.toUpperCase() }))}</text></svg>`;
  const lx = (v) => Math.log10(v), taus = [...pts.map((c) => c.tauS), ...checks.map((c) => c.worstTauS)], vals = [...pts.map(key), ...checks.map((c) => c.limitNs)];
  const x0 = lx(Math.min(...taus)), x1 = lx(Math.max(...taus)), y0 = lx(Math.min(...vals)) - 0.15, y1 = lx(Math.max(...vals)) + 0.15;
  const X = (v) => L + ((lx(v) - x0) / Math.max(1e-9, x1 - x0)) * (R - L), Y = (v) => B - ((lx(v) - y0) / Math.max(1e-9, y1 - y0)) * (B - T);
  const o = [`<svg class="ho-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(t("js-hold-curves-aria", "{ $which } against observation time, with the mask limits", { which: which.toUpperCase() }))}">`, `<path class="ho-ax" d="M${L} ${T}V${B}H${R}"/>`];
  for (let e = Math.ceil(y0); e <= Math.floor(y1); e++) o.push(`<line class="ho-grid" x1="${L}" x2="${R}" y1="${f1(Y(10 ** e))}" y2="${f1(Y(10 ** e))}"/><text class="ho-t" x="${L - 6}" y="${f1(Y(10 ** e) + 4)}" text-anchor="end">${esc(String(10 ** e))}</text>`);
  for (let e = Math.ceil(x0); e <= Math.floor(x1); e++) o.push(`<text class="ho-t" x="${f1(X(10 ** e))}" y="${B + 15}" text-anchor="middle">${esc(String(10 ** e))}</text>`);
  [...new Set(pts.map((c) => c.step))].forEach((step, i) => {
    const s = pts.filter((c) => c.step === step).sort((a, b) => a.tauS - b.tauS);
    o.push(`<path class="ho-cv ho-c${i % 2}" d="${s.map((c, k) => `${k ? "L" : "M"}${f1(X(c.tauS))} ${f1(Y(key(c)))}`).join("")}"><title>${esc(t("js-hold-curve-title", "{ $step }: { $which }, ns", { step, which: which.toUpperCase() }))}</title></path>`);
    const last = s[s.length - 1];
    o.push(`<text class="ho-t ho-end ho-c${i % 2}" x="${f1(X(last.tauS) - 4)}" y="${f1(Y(key(last)) - 6)}" text-anchor="end">${esc(step)}</text>`);
  });
  checks.forEach((c) => o.push(`<path class="ho-mk ho-v-${esc(c.verdict.toLowerCase())}" d="M${f1(X(c.worstTauS) - 5)} ${f1(Y(c.limitNs))}h10M${f1(X(c.worstTauS))} ${f1(Y(c.limitNs) - 5)}v10"><title>${esc(t("js-hold-mark-title", "{ $id } limit { $limit } ns at τ { $tau } s ({ $verdict }; { $source })", { id: c.id, limit: f1(c.limitNs), tau: f1(c.worstTauS), verdict: c.verdict, source: c.source }))}</title></path>`));
  o.push(`<text class="ho-t" x="8" y="${T + 2}">${esc(which.toUpperCase())}, ns</text><text class="ho-t" x="${R}" y="${h - 6}" text-anchor="end">${esc(t("js-hold-axis-tau", "observation time τ, s (log)"))}</text>`);
  return o.join("") + "</svg>";
}

// Rows for the numbers under the charts, as [label, value].
export function stepRows(m) {
  const v = (x, d = 2) => (x == null ? t("js-hold-na", "n/a") : x.toFixed(d));
  return m.steps.map((s) => [PHASE[s.name] || s.name, t("js-hold-step-span", "T+{ $from } to { $to } s", { from: v(s.startS, 0), to: v(s.endS, 0) }), s.n == null ? t("js-hold-na", "n/a") : String(s.n), v(s.meanNs), v(s.rmsNs), v(s.maxAbsNs)]);
}
// The envelope's value text: the engine's verdict word, then what the record says about it (one message per combination).
function envelopeText(e, v) {
  const exceeded = e.tExceedS != null, shorter = !e.covers;
  if (exceeded && shorter) return t("js-hold-envelope-exceeded-short", "{ $verdict }, first exceeded { $s } s after removal (the record is shorter than the envelope's period)", { verdict: e.verdict, s: v(e.tExceedS, 0) });
  if (exceeded) return t("js-hold-envelope-exceeded-value", "{ $verdict }, first exceeded { $s } s after removal", { verdict: e.verdict, s: v(e.tExceedS, 0) });
  if (shorter) return t("js-hold-envelope-short", "{ $verdict } (the record is shorter than the envelope's period)", { verdict: e.verdict });
  return e.verdict;
}
export function holdoverRows(m) {
  const h = m.holdover, r = m.recovery, e = m.envelope, v = (x, d = 2, u = "") => (x == null ? t("js-hold-na", "n/a") : `${x.toFixed(d)}${u}`);
  const rows = [];
  if (h) rows.push([t("js-hold-row-length", "Holdover length"), v(h.durationS, 0, " s")], [t("js-hold-row-frequency", "Frequency offset held (fitted slope)"), v(h.ppb, 3, " ppb")], [t("js-hold-row-residual", "Residual about that line (rms)"), v(h.residualNs, 2, " ns")], [t("js-hold-row-largest", "Largest absolute time error"), t("js-hold-largest-at", "{ $value } at T+{ $time } s", { value: v(h.maxNs, 1, " ns"), time: v(h.maxAtS, 0) })], [t("js-hold-row-step", "Step at the moment of removal"), v(h.stepNs, 2, " ns")]);
  if (e) rows.push([t("js-hold-row-envelope", "ePRTC-A holdover envelope"), envelopeText(e, v)], [t("js-hold-row-margin", "Smallest margin inside the envelope"), v(e.minMarginNs, 2, " ns")]);
  if (r) rows.push([t("js-hold-row-recovery", "Recovery"), r.recovered ? t("js-hold-recovered", "inside ±{ $band } ns for { $dwell } s, { $after } s after GNSS returned", { band: v(r.bandNs, 0), dwell: v(r.dwellS, 0), after: v(r.afterS, 0) }) : t("js-hold-not-recovered", "did not stay inside the band")], [t("js-hold-row-peak", "Peak after restoration"), v(r.peakNs, 1, " ns")], [t("js-hold-row-recovery-step", "Largest step while recovering"), v(r.stepNs, 2, " ns")]);
  return rows;
}
