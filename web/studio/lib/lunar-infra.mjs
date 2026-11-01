// SPDX-License-Identifier: AGPL-3.0-only
// The "Lunar infrastructure" page's reader and charts. It reads the engine's recorded results of the `lunar-infrastructure` kind (the `json`
// field of recorded/<name>.json; one study per result, selected by `study`) and draws what they hold as SVG markup, with the charts of
// lib/ssv.mjs. The results carry scalars, small tables and matrices and NO time series, so none is drawn. The bars the studies were
// pre-registered against, and their verdicts (misses included), are read from lunar-infra/bars.json (tools_lunar_bars.mjs, copied from the
// engine's xval/lunar-infra/RESULTS.md) and shown beside each study. Every number is copied from the result; the page only scales it.
// Pure; tested in lunar-infra.test.mjs.
import { groupedBarsSvg, linesSvg, fmt, esc } from "./ssv.mjs";
import { t } from "./t.mjs";

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const arr = (x) => (Array.isArray(x) ? x : []);
const nums = (x) => arr(x).map(num);

export const KIND = "lunar-infrastructure";
export const STUDIES = Object.freeze(["od-consistency", "carrier-phase", "frame-coestimation", "space-tie", "geodesy-sensitivity"]);
export const SCENARIOS = Object.freeze([
  { id: "od-consistency", study: "od-consistency", get title() { return t("js-lunarinfra-title-od-consistency", "Orbit determination consistency"); }, files: ["lunar-infrastructure-od-consistency", "lunar-infrastructure-od-consistency-model-error"], get blurb() { return t("js-lunarinfra-blurb-od-consistency", "Onboard Earth-GNSS orbit determination in a near-rectilinear halo orbit, against an independent ground radiometric solution of the same arc: do the two agree to within their stated uncertainties, and does the consistency check notice a modelling error when one is injected? Shown side by side."); } },
  { id: "carrier-phase", study: "carrier-phase", get title() { return t("js-lunarinfra-title-carrier-phase", "Carrier phase, surface and orbiter"); }, files: ["lunar-infrastructure-carrier-phase"], get blurb() { return t("js-lunarinfra-blurb-carrier-phase", "A surface station and an orbiter using double-differenced carrier phase of Earth-GNSS signals: can the integer ambiguities be fixed, and what does that do to the position bound? The quick example run."); } },
  { id: "frame-coestimation", study: "frame-coestimation", get title() { return t("js-lunarinfra-title-frame-coestimation", "Frame co-estimation"); }, files: ["lunar-infrastructure-frame-coestimation"], get blurb() { return t("js-lunarinfra-blurb-frame-coestimation", "The seven parameters of the lunar datum from Earth-station laser ranging, with and without orbiter-to-surface-station ranges: how much does the information improve?"); } },
  { id: "space-tie", study: "space-tie", get title() { return t("js-lunarinfra-title-space-tie", "Space tie"); }, files: ["lunar-infrastructure-space-tie"], get blurb() { return t("js-lunarinfra-blurb-space-tie", "GNSS, VLBI and laser ranging on one spacecraft: how precisely can the offsets between the three techniques be tied, against the error of the local tie on the spacecraft?"); } },
  { id: "geodesy-sensitivity", study: "geodesy-sensitivity", get title() { return t("js-lunarinfra-title-geodesy-sensitivity", "Love numbers and libration"); }, files: ["lunar-infrastructure-geodesy-sensitivity"], get blurb() { return t("js-lunarinfra-blurb-geodesy-sensitivity", "How sensitive are laser ranging, orbiter tracking, a gravimeter and a surface clock to the Moon's tidal Love numbers h2, k2 and l2 and its physical libration?"); } },
]);

// The recorded document -> { model } or { error }. A result of another kind or study is refused.
export function readLi(doc) {
  let j;
  try { j = typeof doc.json === "string" ? JSON.parse(doc.json) : doc.json; } catch (e) { return { error: t("js-lunarinfra-result-not-json", "the result is not JSON ({ $reason })", { reason: e.message }) }; }
  if (!j || j.kind !== KIND) return { error: t("js-lunarinfra-not-result", "this is not a lunar-infrastructure result") };
  if (!STUDIES.includes(j.study)) return { error: t("js-lunarinfra-unknown-study", "this lunar-infrastructure result is the study \"{ $study }\", which this page does not read", { study: esc(String(j.study).slice(0, 30)) }) };
  const m = { study: j.study, label: String(j.label || ""), hash: String(j.scenario_hash || "").slice(0, 12), summary: String(doc.summary || ""), engine: String(doc.engine_version || ""), file: String(doc.file || "") };
  const est = (e) => (e ? { pos: num(e.position_sigma_m), posEnd: num(e.position_sigma_arc_end_m), radial: num(e.radial_sigma_m), transverse: num(e.transverse_sigma_m), normal: num(e.normal_sigma_m), vel: num(e.velocity_sigma_m_s) } : null);
  if (j.study === "od-consistency") {
    const c = j.consistency || {}, g = j.geometry || {}, o = j.orbit || {};
    Object.assign(m, { orbit: { family: String(o.family || ""), arcDays: num(o.arc_days), periodDays: num(o.period_days), sampleS: num(o.sample_s), samples: num(o.samples) }, gnss: est(j.gnss_estimate), ground: est(j.ground_estimate),
      geometry: { gnssMeas: num(g.gnss_measurements), gnssSats: num(g.gnss_mean_satellites_tracked), gnss1: num(g.gnss_epochs_with_one_or_more_satellites), gnss4: num(g.gnss_epochs_with_four_or_more_satellites), groundMeas: num(g.ground_measurements), groundStation: num(g.ground_epochs_with_a_station) },
      cons: { trials: num(c.trials), meanQ: num(c.mean_q), expectedQ: num(c.expected_mean_q), chi2: num(c.chi2_95_point), within: num(c.fraction_within_95), exceeding: num(c.fraction_exceeding_95), ratioGnss: num(c.sample_over_formal_trace_gnss), ratioGround: num(c.sample_over_formal_trace_ground), meanDiff: num(c.mean_difference_position_m), formalDiff: num(c.formal_difference_position_sigma_m), modelErr: num(c.model_error_accel_m_s2) } });
  } else if (j.study === "carrier-phase") {
    m.wavelengthM = num(j.wavelength_m);
    m.arcs = arr(j.arcs).map((a) => ({ days: num(a.arc_days), epochs: num(a.epochs), passes: num(a.passes), ambiguities: num(a.double_difference_ambiguities), boot: num(a.bootstrapped_success_rate), bootDec: num(a.bootstrapped_success_rate_decorrelated), mc: num(a.monte_carlo_success_rate), mcSe: num(a.monte_carlo_standard_error), exhausted: num(a.search_budget_exhausted_trials),
      stationFloat: num(a.station_position_sigma_float_m), stationFixed: num(a.station_position_sigma_fixed_m), orbiterFloat: num(a.orbiter_position_sigma_float_m), orbiterFixed: num(a.orbiter_position_sigma_fixed_m), medSigma: num(a.median_ambiguity_sigma_cycles), maxSigma: num(a.max_ambiguity_sigma_cycles), common1: num(a.epochs_with_a_common_satellite), common2: num(a.epochs_with_two_or_more_common_satellites) }));
  } else if (j.study === "frame-coestimation") {
    const side = (x) => (x ? { obs: num(x.observations), eig: nums(x.eigenvalues), lambdaMin: num(x.lambda_min), crlbTrace: num(x.crlb_trace), sigma: nums(x.crlb_sigma), rank: num(x.rank), defect: num(x.defect), degeneracy: num(x.degeneracy_metric), originCrlb: num(x.origin_crlb_m), originScale: num(x.origin_scale_correlation) } : null);
    Object.assign(m, { without: side(j.without_orbiter_links), withLinks: side(j.with_orbiter_links), lambdaRatio: num(j.lambda_min_ratio), traceRatio: num(j.crlb_trace_ratio), params: arr(j.parameters).map(String), stations: arr(j.stations).length, llrRows: num(j.llr_rows), orbiterRows: num(j.orbiter_rows), orbiterArcDays: num(j.orbiter_arc_days),
      sets: j.random_station_sets ? { sets: num(j.random_station_sets.sets), trace: num(j.random_station_sets.trace_not_larger), lambda: num(j.random_station_sets.lambda_min_not_smaller), median: num(j.random_station_sets.median_lambda_min_ratio) } : null });
  } else if (j.study === "space-tie") {
    m.tech = { gnss: num(j.technique_sigma_m && j.technique_sigma_m.gnss), vlbi: num(j.technique_sigma_m && j.technique_sigma_m.vlbi), slr: num(j.technique_sigma_m && j.technique_sigma_m.slr) }; m.localTie = num(j.local_tie_sigma_m);
    m.arcs = arr(j.arcs).map((a) => ({ days: num(a.arc_days), epochs: num(a.epochs), sweep: arr(a.sweep).map((s) => ({ local: num(s.local_tie_sigma_m), floor: num(s.floor_translation_sigma_m), offsets: Object.fromEntries(Object.entries(s.offsets || {}).map(([k, o]) => [k, { trans: nums(o.translation_sigma_m), scale: num(o.scale_sigma_m_at_surface), rot: nums(o.rotation_sigma_m_at_surface) }])) })) }));
  } else if (j.study === "geodesy-sensitivity") {
    Object.assign(m, { params: arr(j.parameters).map(String), nominal: j.nominal ? { h2: num(j.nominal.h2), k2: num(j.nominal.k2), l2: num(j.nominal.l2) } : null, sigma: nums(j.crlb_sigma), sigmaNom: nums(j.crlb_sigma_over_nominal_h2_k2_l2), lambdaMin: num(j.lambda_min), rank: num(j.rank), crlbTrace: num(j.crlb_trace), clockTide: num(j.clock_tidal_amplitude), g: num(j.surface_gravity_m_s2),
      families: Object.entries(j.families || {}).map(([k, f]) => ({ name: k, rows: num(f.rows), rms: nums(f.rms_partial) })),
      subsets: arr(j.subsets).map((s) => ({ families: arr(s.families).map(String), rank: num(s.rank), lambdaMin: num(s.lambda_min), trace: num(s.crlb_trace), sigma: nums(s.crlb_sigma) })),
      adding: j.adding_a_family ? { pairs: num(j.adding_a_family.pairs_checked), lambda: num(j.adding_a_family.lambda_min_not_smaller), trace: num(j.adding_a_family.trace_not_larger) } : null });
  }
  if (j.evidence) m.evidence = j.evidence;
  return { model: m };
}

// The committed bars (lunar-infra/bars.json) -> { bars } or { error }.
const PREFIX = { "od-consistency": ["O", "C"], "carrier-phase": ["Q"], "frame-coestimation": ["F"], "space-tie": ["T"], "geodesy-sensitivity": ["G"] };
export function readBars(j) {
  if (!j || typeof j !== "object" || !Array.isArray(j.bars) || !j.bars.length) return { error: t("js-lunarinfra-bars-wrong-file", "the bars file is not the one this page reads") };
  const strs = (x) => arr(x).map((s) => String(s).slice(0, 700));
  return { bars: { note: String(j.note || ""), commit: String(j.engine_commit || "").slice(0, 8), bars: j.bars.map((b) => ({ id: String(b.id), bar: String(b.bar), verdict: String(b.verdict), status: ["met", "not-met", "mixed"].includes(b.status) ? b.status : "unknown", value: String(b.value) })), findings: strs(j.findings), disclosures: strs(j.disclosures), notVerified: String(j.not_verified || "").slice(0, 700) } };
}
export const barsOf = (bars, study) => bars.bars.filter((b) => (PREFIX[study] || []).includes(b.id[0]));
export const missesOf = (bars, study) => barsOf(bars, study).filter((b) => b.status !== "met");
const CHIP = { met: "MET", "not-met": "NOT MET", mixed: "PARTLY MET", get unknown() { return t("js-lunarinfra-chip-na", "n/a"); } };

const table = (head, rows) => `<div class="ssk-tablewrap"><table class="tbl"><thead><tr>${head.map((h) => `<th scope="col">${esc(h)}</th>`).join("")}</tr></thead><tbody>${rows.map((r) => `<tr><th scope="row">${esc(r[0])}</th>${r.slice(1).map((c) => `<td>${esc(c)}</td>`).join("")}</tr>`).join("")}</tbody></table></div>`;
const pct = (v) => (isNum(v) ? `${fmt(v * 100, 1)} %` : t("js-lunarinfra-na", "n/a"));

export function barsTable(bars, study) {
  return table([t("js-lunarinfra-th-bar", "Bar"), t("js-lunarinfra-th-verdict", "Verdict"), t("js-lunarinfra-th-value", "Value")], barsOf(bars, study).map((b) => [b.bar, /^(NOT MET|MET)/.test(b.verdict) ? b.verdict : t("js-lunarinfra-status-verdict", "{ $status }: { $verdict }", { status: CHIP[b.status], verdict: b.verdict }), b.value]));
}
// What each study missed, in the bars' own words, for the callout above its charts.
export function missNote(bars, study, models = []) {
  const miss = missesOf(bars, study).map((b) => t("js-lunarinfra-miss-line", "{ $id } is { $status }: { $value }", { id: b.id, status: CHIP[b.status], value: b.value }));
  const m = models[0];
  if (m && m.study === "carrier-phase") { const best = Math.max(0, ...m.arcs.map((a) => a.mc || 0)); if (best < 0.5) miss.unshift(t("js-lunarinfra-miss-no-fix", "Integer ambiguity fixing is NOT achieved at this input: the best arc fixes { $share } of the Monte Carlo trials.", { share: pct(best) })); }
  return miss.join(" ");
}

// The page's sections for one tab: models in the order of the tab's files. [{ id, title, note, svg | html, wide }].
export function chartsOf(models, bars, { wide = false } = {}) {
  const m = models[0], w = wide ? 1100 : 560, out = [];
  if (m.study === "od-consistency") {
    const [nom, inj] = models, name = (x) => (isNum(x.cons.modelErr) && x.cons.modelErr > 0 ? t("js-lunarinfra-injected-error", "injected error { $value } m/s²", { value: fmt(x.cons.modelErr, 2) }) : t("js-lunarinfra-nominal", "nominal"));
    const side = (f) => [name(nom), name(inj)].map((n, i) => ({ name: n, value: f(models[i]) }));
    out.push({ id: "q", title: t("js-lunarinfra-q-title", "The consistency check, nominal against injected error"), note: t("js-lunarinfra-q-note", "Mean of the consistency statistic q over { $trials } trials; { $expected } is what a consistent pair of solutions gives. The fraction of trials above the 95 % point is the check's detection rate.", { trials: fmt(nom.cons.trials, 0), expected: fmt(nom.cons.expectedQ, 0) }), wide,
      svg: groupedBarsSvg([{ label: t("js-lunarinfra-mean-q", "mean q"), values: side((x) => x.cons.meanQ) }], { max: Math.max(12, ...models.map((x) => x.cons.meanQ || 0)) * 1.1, unit: "", dec: 2, label: t("js-lunarinfra-mean-consistency", "Mean consistency statistic"), w }) + groupedBarsSvg([{ label: t("js-lunarinfra-above-95-point", "above 95 % point"), values: side((x) => (isNum(x.cons.exceeding) ? x.cons.exceeding * 100 : null)) }], { max: 100, unit: " %", dec: 2, label: t("js-lunarinfra-fraction-above-95", "Fraction of trials above the 95 % point"), w }) });
    out.push({ id: "sigma", title: t("js-lunarinfra-sigma-title", "How well each side knows the orbit"), note: t("js-lunarinfra-sigma-note", "One-sigma position uncertainty by component, in metres, from the two estimates of the same arc."), wide,
      svg: groupedBarsSvg([["radial", t("js-lunarinfra-comp-radial", "radial")], ["transverse", t("js-lunarinfra-comp-transverse", "transverse")], ["normal", t("js-lunarinfra-comp-normal", "normal")], ["pos", t("js-lunarinfra-comp-position", "position (3-D)")]].map(([k, l]) => ({ label: l, values: [{ name: t("js-lunarinfra-onboard-gnss", "onboard Earth-GNSS"), value: nom.gnss[k] }, { name: t("js-lunarinfra-ground-radiometric", "independent ground radiometric"), value: nom.ground[k] }] })), { log: true, unit: " m", label: t("js-lunarinfra-orbit-uncertainty-log", "Orbit uncertainty by component, log scale"), w }) });
    out.push({ id: "table", title: t("js-lunarinfra-side-title", "Side by side"), note: t("js-lunarinfra-side-note", "The orbit: { $family }, a { $arc }-day arc of a { $period }-day orbit, sampled every { $sample } s.", { family: esc(nom.orbit.family.toUpperCase()), arc: fmt(nom.orbit.arcDays, 1), period: fmt(nom.orbit.periodDays, 2), sample: fmt(nom.orbit.sampleS, 0) }), wide: true,
      html: table([t("js-lunarinfra-th-quantity", "Quantity"), name(nom), name(inj)], [[t("js-lunarinfra-row-mean-q", "Mean q (6 expected)"), ...models.map((x) => fmt(x.cons.meanQ, 2))], [t("js-lunarinfra-row-above-95", "Trials above the 95 % point (chi-square 95 % = { $chi })", { chi: fmt(nom.cons.chi2, 2) }), ...models.map((x) => pct(x.cons.exceeding))], [t("js-lunarinfra-row-within-95", "Trials within the 95 % point"), ...models.map((x) => pct(x.cons.within))],
        [t("js-lunarinfra-row-trace-onboard", "Sample over formal trace, onboard"), ...models.map((x) => fmt(x.cons.ratioGnss, 3))], [t("js-lunarinfra-row-trace-ground", "Sample over formal trace, ground"), ...models.map((x) => fmt(x.cons.ratioGround, 3))], [t("js-lunarinfra-row-mean-diff", "Mean difference of the two orbits"), ...models.map((x) => `${fmt(x.cons.meanDiff, 1)} m`)], [t("js-lunarinfra-row-formal-diff", "Formal sigma of that difference"), ...models.map((x) => `${fmt(x.cons.formalDiff, 1)} m`)],
        [t("js-lunarinfra-row-onboard-meas", "Onboard: measurements, mean satellites tracked"), ...models.map((x) => `${fmt(x.geometry.gnssMeas, 0)}, ${fmt(x.geometry.gnssSats, 2)}`)], [t("js-lunarinfra-row-onboard-epochs", "Onboard: epochs with one or more / four or more satellites"), ...models.map((x) => `${pct(x.geometry.gnss1)} / ${pct(x.geometry.gnss4)}`)], [t("js-lunarinfra-row-ground-meas", "Ground: measurements, epochs with a station"), ...models.map((x) => `${fmt(x.geometry.groundMeas, 0)}, ${pct(x.geometry.groundStation)}`)]]) });
  }
  if (m.study === "carrier-phase") {
    const best = Math.max(0, ...m.arcs.map((a) => a.mc || 0));
    out.push({ id: "fix", title: t("js-lunarinfra-fix-title", "Fix rate against arc length"), note: `${t("js-lunarinfra-fix-note-a", "The share of Monte Carlo trials that fixed every integer ambiguity correctly (with its standard error), and the rate the bootstrapped estimate predicts.")} ${best < 0.5 ? t("js-lunarinfra-fix-note-b", "Integer fixing is NOT achieved at this input: the best arc fixes { $share } of the trials.", { share: pct(best) }) : ""} ${t("js-lunarinfra-fix-note-c", "There is no time to fix to show, because fixing is not reached.")}`, wide,
      svg: linesSvg([{ name: t("js-lunarinfra-series-monte-carlo", "Monte Carlo"), points: m.arcs.map((a) => [a.days, (a.mc || 0) * 100]) }, { name: t("js-lunarinfra-series-bootstrapped", "bootstrapped"), points: m.arcs.map((a) => [a.days, (a.boot || 0) * 100]), dash: true }], { xLabel: t("js-lunarinfra-x-arc-length", "arc length, days"), yLabel: t("js-lunarinfra-y-fixed-correctly", "fixed correctly, %"), yMin: 0, yMax: 100, label: t("js-lunarinfra-fix-rate-label", "Integer fix rate against arc length"), w }) });
    out.push({ id: "sigma", title: t("js-lunarinfra-bound-title", "Position bound, float and fixed"), note: t("js-lunarinfra-bound-note", "One-sigma position uncertainty of the station and the orbiter with the ambiguities left float and with them fixed (what fixing would give if it were reached)."), wide,
      svg: groupedBarsSvg(m.arcs.flatMap((a) => [{ label: t("js-lunarinfra-orbiter-days", "orbiter, { $days } d", { days: fmt(a.days, 2) }), values: [{ name: t("js-lunarinfra-float", "float"), value: a.orbiterFloat }, { name: t("js-lunarinfra-fixed", "fixed"), value: a.orbiterFixed }] }, { label: t("js-lunarinfra-station-days", "station, { $days } d", { days: fmt(a.days, 2) }), values: [{ name: t("js-lunarinfra-float", "float"), value: a.stationFloat }, { name: t("js-lunarinfra-fixed", "fixed"), value: a.stationFixed }] }]), { log: true, unit: " m", label: t("js-lunarinfra-bound-label", "Position uncertainty, float and fixed, log scale"), w }) });
    out.push({ id: "table", title: t("js-lunarinfra-arc-title", "Each arc"), note: t("js-lunarinfra-arc-note", "Carrier wavelength { $value } m.", { value: fmt(m.wavelengthM, 3) }), wide: true,
      html: table([t("js-lunarinfra-th-arc-days", "Arc, days"), t("js-lunarinfra-th-epochs", "Epochs"), t("js-lunarinfra-th-dd-ambiguities", "Double-difference ambiguities"), t("js-lunarinfra-th-common-sats", "Epochs with 2 or more common satellites"), t("js-lunarinfra-th-mc-fix-rate", "Monte Carlo fix rate"), t("js-lunarinfra-th-bootstrapped", "Bootstrapped rate"), t("js-lunarinfra-th-budget-exhausted", "Search budget exhausted (trials)"), t("js-lunarinfra-th-median-ambiguity", "Median ambiguity sigma, cycles")], m.arcs.map((a) => [fmt(a.days, 2), fmt(a.epochs, 0), fmt(a.ambiguities, 0), pct(a.common2), `${pct(a.mc)} ± ${pct(a.mcSe)}`, pct(a.boot), fmt(a.exhausted, 0), fmt(a.medSigma, 2)])) });
  }
  if (m.study === "frame-coestimation") {
    const names = m.params.length === 7 ? m.params : ["t_x", "t_y", "t_z", "scale", "r_x", "r_y", "r_z"].slice(0, m.without.eig.length);
    out.push({ id: "eig", title: t("js-lunarinfra-eig-title", "Information in each direction of the datum"), note: t("js-lunarinfra-eig-note", "The seven eigenvalues of the information matrix, smallest first, without and with the orbiter-to-station links. The smallest rises { $times } times, and the Cramér-Rao trace falls to { $share } of its value. This assumes the orbit is known in the lunar axes (its error is carried by the orbiter range sigma).", { times: fmt(m.lambdaRatio, 1), share: pct(m.traceRatio) }), wide,
      svg: groupedBarsSvg(m.without.eig.map((e, i) => ({ label: t("js-lunarinfra-direction", "direction { $n }", { n: i + 1 }), values: [{ name: t("js-lunarinfra-without-links", "without orbiter links"), value: e }, { name: t("js-lunarinfra-with-links", "with orbiter links"), value: m.withLinks.eig[i] }] })), { log: true, unit: "", label: t("js-lunarinfra-eig-label", "Information eigenvalues, log scale"), w }) });
    out.push({ id: "sigma", title: t("js-lunarinfra-crsigma-title", "Cramér-Rao sigma per parameter"), note: t("js-lunarinfra-crsigma-note", "In metres at the surface."), wide,
      svg: groupedBarsSvg(m.without.sigma.map((s, i) => ({ label: names[i] || `p${i + 1}`, values: [{ name: t("js-lunarinfra-without-links", "without orbiter links"), value: s }, { name: t("js-lunarinfra-with-links", "with orbiter links"), value: m.withLinks.sigma[i] }] })), { log: true, unit: " m", label: t("js-lunarinfra-crsigma-label", "Cramér-Rao sigma, log scale"), w }) });
    out.push({ id: "table", title: t("js-lunarinfra-compare-title", "The comparison in numbers"), note: m.sets ? t("js-lunarinfra-compare-note", "Over { $sets } random station sets the smallest eigenvalue was not smaller with the orbiter links in { $lambda } and the trace not larger in { $trace }; the median rise of the smallest eigenvalue was { $median } times.", { sets: fmt(m.sets.sets, 0), lambda: fmt(m.sets.lambda, 0), trace: fmt(m.sets.trace, 0), median: fmt(m.sets.median, 1) }) : "", wide: true,
      html: table([t("js-lunarinfra-th-quantity", "Quantity"), t("js-lunarinfra-th-without-links", "Without orbiter links"), t("js-lunarinfra-th-with-links", "With orbiter links")], [[t("js-lunarinfra-row-observations", "Observations"), fmt(m.without.obs, 0), fmt(m.withLinks.obs, 0)], [t("js-lunarinfra-row-rank-defect", "Rank (defect)"), `${fmt(m.without.rank, 0)} (${fmt(m.without.defect, 0)})`, `${fmt(m.withLinks.rank, 0)} (${fmt(m.withLinks.defect, 0)})`], [t("js-lunarinfra-row-smallest-eig", "Smallest eigenvalue"), fmt(m.without.lambdaMin, 3), fmt(m.withLinks.lambdaMin, 3)], [t("js-lunarinfra-row-crtrace", "Cramér-Rao trace"), fmt(m.without.crlbTrace, 3), fmt(m.withLinks.crlbTrace, 3)], [t("js-lunarinfra-row-degeneracy", "Degeneracy metric"), fmt(m.without.degeneracy, 1), fmt(m.withLinks.degeneracy, 1)], [t("js-lunarinfra-row-origin-sigma", "Origin sigma, m"), fmt(m.without.originCrlb, 3), fmt(m.withLinks.originCrlb, 3)], [t("js-lunarinfra-row-origin-scale", "Origin-scale correlation"), fmt(m.without.originScale, 3), fmt(m.withLinks.originScale, 3)]]) });
  }
  if (m.study === "space-tie") {
    for (const a of m.arcs) {
      const series = [{ name: t("js-lunarinfra-series-floor", "floor"), points: a.sweep.map((s) => [s.local, s.floor]), dash: true }, ...["vlbi_minus_gnss", "slr_minus_gnss", "slr_minus_vlbi"].map((k) => ({ name: k.replace(/_minus_/, " − ").toUpperCase(), points: a.sweep.map((s) => [s.local, Math.max(...arr(s.offsets[k] && s.offsets[k].trans).filter(isNum))]) }))];
      out.push({ id: `sweep-${a.days}`, title: t("js-lunarinfra-sweep-title", "Precision of the technique offsets against the local tie ({ $days }-day arc)", { days: fmt(a.days, 2) }), note: t("js-lunarinfra-sweep-note", "The worst translation component of each offset, in metres, as the error of the tie between the three techniques on the spacecraft is swept. With the registered technique sigmas (GNSS { $gnss } m, VLBI { $vlbi } m, laser { $slr } m) the offsets are limited by measurement noise, not by the tie; the tie sets the floor only for near-perfect techniques.", { gnss: fmt(m.tech.gnss, 1), vlbi: fmt(m.tech.vlbi, 1), slr: fmt(m.tech.slr, 2) }), wide: true,
        svg: linesSvg(series, { xLabel: t("js-lunarinfra-x-local-tie", "local tie sigma, m (log)"), yLabel: t("js-lunarinfra-y-offset-sigma", "offset sigma, m (log); the dashed floor is the tie alone, sqrt(2) × the tie error"), logX: true, logY: true, label: t("js-lunarinfra-offset-precision-label", "Offset precision against local tie, log-log"), w: 760, h: 280 }) });
      out.push({ id: `offsets-${a.days}`, title: t("js-lunarinfra-offsets-title", "The offsets at each tie error ({ $days }-day arc, { $epochs } epochs)", { days: fmt(a.days, 2), epochs: fmt(a.epochs, 0) }), note: t("js-lunarinfra-offsets-note", "Translation sigma per axis, scale and rotation sigma at the surface, in metres."), wide: true,
        html: table([t("js-lunarinfra-th-local-tie", "Local tie sigma, m"), t("js-lunarinfra-th-offset", "Offset"), t("js-lunarinfra-th-translation", "Translation x, y, z, m"), t("js-lunarinfra-th-scale", "Scale at surface, m"), t("js-lunarinfra-th-rotation", "Rotation at surface, m")], a.sweep.flatMap((s) => Object.entries(s.offsets).map(([k, o]) => [fmt(s.local, 4), k.replace(/_minus_/, " − "), o.trans.map((v) => fmt(v, 3)).join(", "), fmt(o.scale, 3), o.rot.map((v) => fmt(v, 3)).join(", ")]))) });
    }
  }
  if (m.study === "geodesy-sensitivity") {
    const names = ["h2", "k2", "l2"];
    out.push({ id: "rel", title: t("js-lunarinfra-rel-title", "How well each parameter can be pinned, against its nominal value"), note: t("js-lunarinfra-rel-note", "Cramér-Rao sigma as a percentage of the nominal value, with all four families together. h2 and l2 are linearisation points, not verified values; k2 is from a published fit."), wide,
      svg: groupedBarsSvg(names.map((n, i) => ({ label: n, values: [{ name: t("js-lunarinfra-sigma-over-nominal", "sigma / nominal"), value: isNum(m.sigmaNom[i]) ? m.sigmaNom[i] * 100 : null }] })), { log: true, unit: " %", label: t("js-lunarinfra-rel-label", "Sigma over nominal, log scale"), w }) });
    out.push({ id: "families", title: t("js-lunarinfra-families-title", "What each family sees"), note: t("js-lunarinfra-families-note", "The RMS of each parameter's partial derivative over the family's rows, and the number of rows. A zero is a parameter that family is blind to. The orbiter family's k2 sensitivity is an upper-end figure."), wide: true,
      html: table([t("js-lunarinfra-th-family", "Family"), t("js-lunarinfra-th-rows", "Rows"), ...m.params.map((p) => `${p.replace(/_/g, " ")}`)], m.families.map((f) => [f.name, fmt(f.rows, 0), ...m.params.map((_, i) => fmt(f.rms[i], 3))])) });
    out.push({ id: "subsets", title: t("js-lunarinfra-subsets-title", "Every combination of families"), note: m.adding ? t("js-lunarinfra-subsets-note", "Adding a family never lowered the smallest eigenvalue ({ $lambda } of { $pairs } additions), but the trace of the pseudo-inverse was no larger in only { $trace } of { $pairs }, because an added family can raise the rank.", { lambda: fmt(m.adding.lambda, 0), pairs: fmt(m.adding.pairs, 0), trace: fmt(m.adding.trace, 0) }) : "", wide: true,
      html: table([t("js-lunarinfra-th-families", "Families"), t("js-lunarinfra-th-rank", "Rank"), t("js-lunarinfra-th-smallest-eig", "Smallest eigenvalue"), t("js-lunarinfra-th-crtrace", "Cramér-Rao trace")], m.subsets.map((s) => [s.families.join(" + "), fmt(s.rank, 0), fmt(s.lambdaMin, 3), fmt(s.trace, 3)])) });
  }
  if (bars) out.push({ id: "bars", title: t("js-lunarinfra-bars-title", "Against the pre-registered bars"), note: t("js-lunarinfra-bars-note", "Fixed before any study was scored, with the verdicts of record (engine commit { $commit }). Nothing is VALIDATED; a bar marked NOT MET is pinned by a test that asserts the miss, and none was loosened.", { commit: bars.commit }), html: barsTable(bars, m.study), wide: true });
  return out;
}

export function factRows(models) {
  const m = models[0], rows = [[t("js-lunarinfra-fact-study", "Study"), m.study]];
  if (m.hash) rows.push([t("js-lunarinfra-fact-hash", "Scenario hash"), m.hash]);
  if (m.orbit) rows.push([t("js-lunarinfra-fact-orbit-family", "Orbit family"), m.orbit.family.toUpperCase()], [t("js-lunarinfra-fact-arc", "Arc"), t("js-lunarinfra-days", "{ $n } days", { n: fmt(m.orbit.arcDays, 1) })]);
  if (m.wavelengthM != null) rows.push([t("js-lunarinfra-fact-wavelength", "Carrier wavelength"), `${fmt(m.wavelengthM, 3)} m`]);
  if (m.llrRows != null) rows.push([t("js-lunarinfra-fact-llr-rows", "Laser-ranging rows"), fmt(m.llrRows, 0)], [t("js-lunarinfra-fact-orbiter-rows", "Orbiter rows"), fmt(m.orbiterRows, 0)], [t("js-lunarinfra-fact-orbiter-arc", "Orbiter arc"), t("js-lunarinfra-days", "{ $n } days", { n: fmt(m.orbiterArcDays, 2) })]);
  return rows;
}
export { esc };
