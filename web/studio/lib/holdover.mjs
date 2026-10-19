// SPDX-License-Identifier: AGPL-3.0-only
// The Holdover test view's reader and charts (0.38; engine kind `holdover-test`, docs/TIMING-HIL.md). It reads the engine's result for a
// time-error record the operator supplied, split at the two times the operator states and measured against public ITU-T masks, and draws
// what the result holds: the time error over the three phases with the stated limits, the recovery band and the times the budgets are first
// exceeded, MTIE and TDEV, and the mask checks. Nothing is judged here: a verdict is the engine's word, and every figure is "measured against
// the mask", never a statement that a clock or system meets a Recommendation. The time error itself is the operator's record, which the engine
// writes into the result as `record.series` ({ time_s, time_error_ns }, decimated to a stated number of points). The page draws that and nothing
// else: it has no parser of its own for a record, and a result without `record.series` is shown without a curve, and says so. Pure; tested in
// holdover.test.mjs.

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const arr = (x) => (Array.isArray(x) ? x : []);
const str = (x, n = 400) => (typeof x === "string" ? x.slice(0, n) : "");
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
const f1 = (v) => (Math.round(v * 10) / 10).toString();

export const SCENARIOS = Object.freeze([
  { id: "holdover-test-example", title: "A time-error record", blurb: "Samples every 5 s: 600 s locked, GNSS removed at 600 s, holdover, GNSS restored at 2400 s. The record is generated for the example; it is not a measurement." },
  { id: "holdover-test-ptp4l", title: "A linuxptp log", blurb: "The same four steps read from a ptp4l servo log (the daemon's own offset, in ns). The log is written for the example; no daemon ran." },
]);

// The recorded result document ({ json, summary, engine_version, ... }) -> { model } or { error }.
export function readHoldover(doc) {
  let j;
  try { j = typeof doc.json === "string" ? JSON.parse(doc.json) : doc.json; } catch (e) { return { error: `the result is not JSON (${e.message})` }; }
  if (!j || j.kind !== "holdover-test" || !Array.isArray(j.steps) || !j.steps.length || !j.test || !j.record) return { error: "this is not a holdover-test result" };
  const rec = j.record, t = j.test;
  return {
    model: {
      label: str(j.label, 800), summary: str(doc.summary, 600), engine: str(doc.engine_version, 20), file: str(doc.file, 80),
      test: { removedS: num(t.gnss_removed_s), restoredS: num(t.gnss_restored_s), lockedDays: num(t.locked_duration_days), bandNs: num(t.recovery_band_ns), dwellS: num(t.recovery_dwell_s), statedBy: str(t.stated_by, 120) },
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
  if (!s) return { series: null, why: "the result carries no time-error samples (record.series), so no curve is drawn" };
  if (s.t.length < 2 || s.t.some((t, k) => k && !(t > s.t[k - 1]))) return { series: null, why: "the series in the result is not a time series (fewer than two samples, or time not increasing), so no curve is drawn" };
  if (rec.n != null && s.t.length > rec.n) return { series: null, why: `the series in the result has ${s.t.length} samples where the engine scored ${rec.n}, so no curve is drawn` };
  return { series: s, from: s.t.length === rec.n ? "the result's record" : `the result's record, decimated to ${s.t.length} of ${rec.n} samples` };
}

// ---------- charts ----------

const PHASE = { baseline: "Baseline: locked", holdover: "Holdover: GNSS removed", recovery: "Recovery: GNSS restored" };
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
  const o = [`<svg class="ho-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="Time error over the record, with the phases and the mask limits">`];
  for (const s of m.steps) if (s.startS != null && s.endS != null) o.push(`<rect class="ho-ph ho-${esc(s.name)}" x="${f1(X(s.startS))}" y="${T}" width="${f1(Math.max(1, X(s.endS) - X(s.startS)))}" height="${B - T}"><title>${esc(PHASE[s.name] || s.name)}, T+${f1(s.startS)} s to ${f1(s.endS)} s</title></rect><text class="ho-t ho-phl" x="${f1(X(s.startS) + 6)}" y="${T + 13}">${esc(PHASE[s.name] || s.name)}</text>`);
  for (let i = -2; i <= 2; i++) { const v = (ext / 2.24) * i; o.push(`<line class="ho-grid" x1="${L}" x2="${R}" y1="${f1(Y(v))}" y2="${f1(Y(v))}"/><text class="ho-t" x="${L - 6}" y="${f1(Y(v) + 4)}" text-anchor="end">${esc(f1(v))}</text>`); }
  if (band != null) for (const sg of [1, -1]) o.push(`<line class="ho-band" x1="${L}" x2="${R}" y1="${f1(Y(sg * band))}" y2="${f1(Y(sg * band))}"><title>Recovery band ±${f1(band)} ns</title></line>`);
  // A limit is drawn over the step its mask names (the locked baseline for PRTC-A), not across the whole record.
  limits.forEach((l, i) => { for (const sg of [1, -1]) o.push(`<line class="ho-lim ho-v-${esc(l.verdict.toLowerCase())}" x1="${f1(X(l.from))}" x2="${f1(X(l.to))}" y1="${f1(Y(sg * l.ns))}" y2="${f1(Y(sg * l.ns))}"><title>${esc(l.id)}: ±${f1(l.ns)} ns, the maximum absolute time error on the ${esc(l.step)} step</title></line>`); o.push(`<text class="ho-t ho-limt" x="${f1(X(l.from) + 6)}" y="${f1(Y(l.ns) + 14 + i * 12)}" text-anchor="start">±${esc(f1(l.ns))} ns ${esc(l.step)} mask<title>${esc(l.id)}</title></text>`); });
  for (const [t, cls, name] of [[m.test.removedS, "ho-rm", "GNSS removed (stated by the operator)"], [m.test.restoredS, "ho-rs", "GNSS restored (stated by the operator)"]]) if (t != null && t >= t0 && t <= t1) o.push(`<line class="${cls}" x1="${f1(X(t))}" x2="${f1(X(t))}" y1="${T - 4}" y2="${B + 4}"><title>${esc(name)}, T+${f1(t)} s</title></line><text class="ho-t" x="${f1(X(t) + 5)}" y="${T + 28}" text-anchor="start">${esc(name.split(" (")[0])}</text>`);
  const marks = [];
  if (m.envelope && m.envelope.tExceedS != null && m.test.removedS != null) marks.push([m.test.removedS + m.envelope.tExceedS, `ePRTC-A holdover envelope first exceeded ${f1(m.envelope.tExceedS)} s after removal`]);
  for (const b of m.budgets) if (b.exceeded && b.tExceedS != null && m.test.removedS != null) marks.push([m.test.removedS + b.tExceedS, `${b.name} first exceeded ${f1(b.tExceedS)} s after removal`]);
  marks.forEach(([t, name], i) => { if (t >= t0 && t <= t1) o.push(`<path class="ho-x" d="M${f1(X(t))} ${B - 2}l-5 8h10z"><title>${esc(name)}, T+${f1(t)} s</title></path>`); });
  if (series) {
    const step = Math.max(1, Math.floor(series.t.length / 1500));
    let d = "";
    for (let k = 0; k < series.t.length; k += step) d += `${k ? "L" : "M"}${f1(X(series.t[k]))} ${f1(Y(series.te[k]))}`;
    o.push(`<path class="ho-line" d="${d}"><title>Time error, ns</title></path>`);
  } else o.push(`<text class="ho-t" x="${(L + R) / 2}" y="${(T + B) / 2}" text-anchor="middle">No time-error curve: the record could not be reproduced for drawing.</text>`);
  o.push(`<path class="ho-ax" d="M${L} ${T}V${B}H${R}"/><text class="ho-t" x="8" y="${T + 4}">time error, ns</text>`);
  for (let i = 0; i <= 6; i++) { const t = t0 + ((t1 - t0) * i) / 6; o.push(`<text class="ho-t" x="${f1(X(t))}" y="${h - 6}" text-anchor="middle">${esc(f1(t))}</text>`); }
  o.push(`<text class="ho-t" x="${R}" y="${h - 22}" text-anchor="end">seconds from the first sample</text>`);
  return o.join("") + "</svg>";
}

// MTIE and TDEV against the observation time (log-log) for the steps the engine measured, with the mask limits as markers at the time the
// check was worst. `which` is "mtie" or "tdev".
export function curvesSvg(m, which, { w = 430, h = 300 } = {}) {
  const L = 54, R = w - 14, T = 18, B = h - 38;
  const pts = m.curves.filter((c) => (which === "mtie" ? c.mtieNs : c.tdevNs) > 0), key = (c) => (which === "mtie" ? c.mtieNs : c.tdevNs);
  const checks = m.masks.flatMap((k) => k.checks.filter((c) => c.metric === which && c.limitNs > 0 && c.worstTauS > 0).map((c) => ({ ...c, id: k.id })));
  if (!pts.length) return `<svg class="ho-chart" viewBox="0 0 ${w} 40" role="img" aria-label="${esc(which)}"><text class="ho-t" x="8" y="24">No ${esc(which.toUpperCase())} curve in this result.</text></svg>`;
  const lx = (v) => Math.log10(v), taus = [...pts.map((c) => c.tauS), ...checks.map((c) => c.worstTauS)], vals = [...pts.map(key), ...checks.map((c) => c.limitNs)];
  const x0 = lx(Math.min(...taus)), x1 = lx(Math.max(...taus)), y0 = lx(Math.min(...vals)) - 0.15, y1 = lx(Math.max(...vals)) + 0.15;
  const X = (v) => L + ((lx(v) - x0) / Math.max(1e-9, x1 - x0)) * (R - L), Y = (v) => B - ((lx(v) - y0) / Math.max(1e-9, y1 - y0)) * (B - T);
  const o = [`<svg class="ho-chart" viewBox="0 0 ${w} ${h}" role="img" aria-label="${esc(which.toUpperCase())} against observation time, with the mask limits">`, `<path class="ho-ax" d="M${L} ${T}V${B}H${R}"/>`];
  for (let e = Math.ceil(y0); e <= Math.floor(y1); e++) o.push(`<line class="ho-grid" x1="${L}" x2="${R}" y1="${f1(Y(10 ** e))}" y2="${f1(Y(10 ** e))}"/><text class="ho-t" x="${L - 6}" y="${f1(Y(10 ** e) + 4)}" text-anchor="end">${esc(String(10 ** e))}</text>`);
  for (let e = Math.ceil(x0); e <= Math.floor(x1); e++) o.push(`<text class="ho-t" x="${f1(X(10 ** e))}" y="${B + 15}" text-anchor="middle">${esc(String(10 ** e))}</text>`);
  [...new Set(pts.map((c) => c.step))].forEach((step, i) => {
    const s = pts.filter((c) => c.step === step).sort((a, b) => a.tauS - b.tauS);
    o.push(`<path class="ho-cv ho-c${i % 2}" d="${s.map((c, k) => `${k ? "L" : "M"}${f1(X(c.tauS))} ${f1(Y(key(c)))}`).join("")}"><title>${esc(step)}: ${esc(which.toUpperCase())}, ns</title></path>`);
    const last = s[s.length - 1];
    o.push(`<text class="ho-t ho-end ho-c${i % 2}" x="${f1(X(last.tauS) - 4)}" y="${f1(Y(key(last)) - 6)}" text-anchor="end">${esc(step)}</text>`);
  });
  checks.forEach((c) => o.push(`<path class="ho-mk ho-v-${esc(c.verdict.toLowerCase())}" d="M${f1(X(c.worstTauS) - 5)} ${f1(Y(c.limitNs))}h10M${f1(X(c.worstTauS))} ${f1(Y(c.limitNs) - 5)}v10"><title>${esc(c.id)} limit ${f1(c.limitNs)} ns at τ ${f1(c.worstTauS)} s (${esc(c.verdict)}; ${esc(c.source)})</title></path>`));
  o.push(`<text class="ho-t" x="8" y="${T + 2}">${esc(which.toUpperCase())}, ns</text><text class="ho-t" x="${R}" y="${h - 6}" text-anchor="end">observation time τ, s (log)</text>`);
  return o.join("") + "</svg>";
}

// Rows for the numbers under the charts, as [label, value].
export function stepRows(m) {
  const v = (x, d = 2) => (x == null ? "n/a" : x.toFixed(d));
  return m.steps.map((s) => [PHASE[s.name] || s.name, `T+${v(s.startS, 0)} to ${v(s.endS, 0)} s`, s.n == null ? "n/a" : String(s.n), v(s.meanNs), v(s.rmsNs), v(s.maxAbsNs)]);
}
export function holdoverRows(m) {
  const h = m.holdover, r = m.recovery, e = m.envelope, v = (x, d = 2, u = "") => (x == null ? "n/a" : `${x.toFixed(d)}${u}`);
  const rows = [];
  if (h) rows.push(["Holdover length", v(h.durationS, 0, " s")], ["Frequency offset held (fitted slope)", v(h.ppb, 3, " ppb")], ["Residual about that line (rms)", v(h.residualNs, 2, " ns")], ["Largest absolute time error", `${v(h.maxNs, 1, " ns")} at T+${v(h.maxAtS, 0)} s`], ["Step at the moment of removal", v(h.stepNs, 2, " ns")]);
  if (e) rows.push(["ePRTC-A holdover envelope", `${e.verdict}${e.tExceedS != null ? `, first exceeded ${v(e.tExceedS, 0)} s after removal` : ""}${e.covers ? "" : " (the record is shorter than the envelope's period)"}`], ["Smallest margin inside the envelope", v(e.minMarginNs, 2, " ns")]);
  if (r) rows.push(["Recovery", r.recovered ? `inside ±${v(r.bandNs, 0)} ns for ${v(r.dwellS, 0)} s, ${v(r.afterS, 0)} s after GNSS returned` : "did not stay inside the band"], ["Peak after restoration", v(r.peakNs, 1, " ns")], ["Largest step while recovering", v(r.stepNs, 2, " ns")]);
  return rows;
}
