// SPDX-License-Identifier: AGPL-3.0-only
// Plain-meaning templates for the engine kinds that lib/meaning.mjs does not cover itself. One
// template per KIND, so it serves every scenario of that kind. Each reads named fields of the
// result document and returns { big, line } (and cards when the headline strip would not answer
// the question), or null when a field it needs is missing; the caller then states the run's first
// key figure plainly. Every number is a field of the result, or a count or share of fields.
// Pure; tested in meaning.test.mjs against every recorded result.
import * as K from "./kinds.mjs";
import { fmt } from "./views.mjs";

const num = (x) => typeof x === "number" && Number.isFinite(x);
const get = (r, p) => K.resolve(r, p);
const has = (r, ...ps) => ps.every((p) => num(get(r, p)));
const pc = (x) => { const v = 100 * x; return Math.abs(v - Math.round(v)) < 0.05 ? String(Math.round(v)) : v.toFixed(1); };
const words = (s) => String(s).replace(/[_-]+/g, " ").trim();
// A result key as words, without its unit suffix or the path above it: "classical.fom.holdover_s" -> "classical holdover".
const term = (k) => { const parts = String(k).split("."); const last = parts.pop().replace(/_(s|m|km|ns|db|dbhz|dbw|deg|hz|pct|days?|min)$/i, ""); const head = parts.filter((p) => !/^(fom|metrics|stats)$/.test(p)); return words([...head, last].join(" ")); };
const list = (xs) => (xs.length <= 1 ? xs.join("") : `${xs.slice(0, -1).join(", ")} and ${xs[xs.length - 1]}`);
const f = (x, d = 3) => fmt(x, d);
export function dur(s) {
  if (!num(s)) return "—";
  const a = Math.abs(s);
  if (a < 90) return `${fmt(a, 2)} s`;
  if (a < 3600) return `${Math.round(a / 60)} min`;
  if (a < 172800) { const h = Math.floor(a / 3600), m = Math.round((a - h * 3600) / 60); return m === 60 ? `${h + 1} h` : m ? `${h} h ${m} min` : `${h} h`; }
  return `${fmt(a / 86400, 2)} days`;
}
// The pair of cards { min, max } a composed campaign states for one metric, from the strip.
const pairOf = (cards, re) => {
  const lo = cards.find((c) => re.test(c.path || "") && /\.min$/.test(c.path)), hi = cards.find((c) => re.test(c.path || "") && /\.max$/.test(c.path));
  return lo && hi ? { lo, hi } : null;
};

// ---------------------------------------------------------------- campaigns
function campaign(r, toml, cards) {
  const runs = get(r, "reproducibility.runs_total");
  const tl = r.timeline;
  if (tl && Array.isArray(tl.phases) && num(tl.duration_s)) {
    const last = Array.isArray(tl.t_s) ? tl.t_s.length - 1 : -1;
    const alarm = tl.channels && tl.channels.alarm && Array.isArray(tl.channels.alarm.values) ? tl.channels.alarm.values : null;
    const step = num(tl.step_s) ? tl.step_s : null;
    const alarmed = alarm && step ? alarm.filter((v) => v > 0).length * step : null;
    const events = Array.isArray(tl.events) ? tl.events.length : 0;
    const big = alarmed === null ? `A ${tl.phases.length}-phase mission over ${dur(tl.duration_s)}, chained on one clock.` : alarmed > 0 ? `The alarm is raised for ${dur(alarmed)} of the ${dur(tl.duration_s)} mission.` : `No alarm in the whole ${dur(tl.duration_s)} mission.`;
    const ch = Object.entries(tl.channels || {}).find(([k, c]) => k !== "alarm" && !/alert_limit|guard/.test(k) && c && typeof c.label === "string" && c.label.length > 6 && !/_/.test(c.label) && Array.isArray(c.values) && num(c.values[last]));
    const end = ch ? `; at the end, the ${ch[1].label.replace(/:.*$/, "").replace(/^./, (x) => x.toLowerCase())} is ${f(ch[1].values[last])}${ch[1].unit && ch[1].unit !== "1" ? " " + ch[1].unit : ""}` : "";
    return { big, line: `${tl.phases.length} phase${tl.phases.length === 1 ? "" : "s"}${events ? ` and ${events} event${events === 1 ? "" : "s"}` : ""}${num(runs) ? `, from ${runs} engine runs` : ""}${end}.` };
  }
  if (r.monte_carlo && r.monte_carlo.metrics) {
    const [name, m] = Object.entries(r.monte_carlo.metrics).find(([, v]) => v && num(v.mean) && num(v.std)) || [];
    if (!name) return null;
    const card = cards.find((c) => c.path === `monte_carlo.metrics.${name}.mean`);
    const u = card && card.unit ? ` ${card.unit}` : "";
    return { big: `Across ${num(r.monte_carlo.runs) ? r.monte_carlo.runs : runs} seeded runs, the ${words(name)} averages ${f(m.mean)}${u}, with a spread of ${f(m.std)}${u}.`, line: "The spread is one standard deviation over the runs." };
  }
  if (r.compose) {
    const p = cards.map((c) => (c.path || "").match(/^compose\.combined\.([^.]+)\.min$/)).filter(Boolean).map((m) => pairOf(cards, new RegExp(`^compose\\.combined\\.${m[1]}\\.`))).filter(Boolean)[0];
    if (!p) return null;
    const u = p.lo.unit ? ` ${p.lo.unit}` : "";
    const n = Array.isArray(r.compose.members) ? r.compose.members.length : runs;
    const what = p.lo.sub ? p.lo.sub.toLowerCase() : "headline figure";
    return { big: p.lo.v === p.hi.v ? `Across ${n} scenarios under the same conditions, the ${what} is ${f(p.lo.v)}${u} in every one.` : `Across ${n} scenarios under the same conditions, the ${what} ranges from ${f(p.lo.v)} to ${f(p.hi.v)}${u}.`, line: "Each member is an ordinary engine run; the campaign reads their results side by side." };
  }
  if (r.sweep && Array.isArray(r.sweep.nodes) && r.sweep.nodes.length && r.sweep.axes) {
    const [axis] = r.sweep.axis_order || Object.keys(r.sweep.axes);
    const ax = r.sweep.axes[axis];
    const [metric, mm] = Object.entries(r.sweep.metrics || {})[0] || [];
    if (!ax || !metric) return null;
    const vals = r.sweep.nodes.map((n) => n.metrics && n.metrics[metric]).filter(num);
    if (!vals.length) return null;
    const xs = r.sweep.nodes.map((n) => n.coords && n.coords[axis]).filter(num);
    const u = mm && mm.unit && mm.unit !== "1" ? ` ${mm.unit}` : "";
    const range = `Over ${r.sweep.nodes.length} runs of ${term(axis)} from ${f(Math.min(...xs))} to ${f(Math.max(...xs))}${ax.unit ? " " + ax.unit : ""}`;
    if (f(Math.min(...vals)) === f(Math.max(...vals))) return { big: `${range}, the ${term(metric)} stays at ${f(vals[0])}${u}.`, line: "The chart shows every run." };
    return { big: `${range}, the ${term(metric)} goes from ${f(vals[0])} to ${f(vals[vals.length - 1])}${u}.`, line: `The chart shows every run; it ranges from ${f(Math.min(...vals))} to ${f(Math.max(...vals))}${u}.` };
  }
  return null;
}
function sweep(r) {
  if (!Array.isArray(r.points) || !r.points.length || !r.parameter) return null;
  const keys = Object.keys(r.points[0]).filter((k) => k !== "value" && num(r.points[0][k]));
  if (!keys.length) return null;
  const lo = r.points[0], hi = r.points[r.points.length - 1];
  const show = (v) => (/_s$/.test(r.metric || "") ? dur(v) : f(v));
  const parts = keys.map((k) => (show(lo[k]) === show(hi[k]) ? `the ${k} ${term(r.metric || "result")} stays at ${show(lo[k])}` : `the ${k} ${term(r.metric || "result")} goes from ${show(lo[k])} to ${show(hi[k])}`));
  return { big: `Over ${r.points.length} values of ${term(r.parameter)}, ${list(parts)}.`, line: `The ${term(r.parameter)} runs from ${f(lo.value)} to ${f(hi.value)}${r.scale === "log" ? " on a log scale" : ""}.` };
}
function sweepNd(r) {
  if (!Array.isArray(r.points) || !Array.isArray(r.keys) || !Array.isArray(r.metrics)) return null;
  const vals = r.points.map((p) => p.metrics && p.metrics[0]).filter(num);
  if (!vals.length) return null;
  return { big: `Over ${r.points.length} combinations of ${list(r.keys.map(term))}, the ${term(r.metrics[0])} ranges from ${f(Math.min(...vals))} to ${f(Math.max(...vals))}.`, line: `A grid of ${(r.shape || []).join(" by ")} engine runs.` };
}

// ---------------------------------------------------------------- clocks, time and timing
function spoof(r) {
  const parts = ["quantum", "classical"].map((k) => [k, r[k]]).filter(([, x]) => x && num(x.detect_time_s));
  if (!parts.length) return null;
  const caught = parts.filter(([, x]) => !x.breaches_spec_undetected);
  const name = (x, k) => x.id || k;
  return {
    big: caught.length === parts.length ? `The spoof is caught before it breaks the ${num(r.threshold_ns) ? f(r.threshold_ns) + " ns " : ""}timing spec${parts.length > 1 ? " by both clocks" : ""}.` : `The spoof breaks the timing spec before ${list(parts.filter(([, x]) => x.breaches_spec_undetected).map(([k, x]) => `the ${name(x, k)}`))} catches it.`,
    line: parts.map(([k, x]) => `The ${name(x, k)} detects it after ${dur(x.detect_time_s)}, at an offset of ${f(x.offset_at_detection_ns)} ns.`).join(" "),
    cards: parts.map(([k, x]) => ({ label: `Caught after, ${name(x, k)}`, value: dur(x.detect_time_s), unit: "", sub: `offset ${f(x.offset_at_detection_ns)} ns`, good: !x.breaches_spec_undetected, path: `${k}.detect_time_s` })),
  };
}
function pnt(r) {
  const q = r.quantum, c = r.classical;
  if (!q || !c || !q.fom || !c.fom || !num(q.fom.pnt_holdover_s) || !num(c.fom.pnt_holdover_s)) return null;
  const qn = (q.clock_spec && q.clock_spec.id) || "quantum", cn = (c.clock_spec && c.clock_spec.id) || "classical";
  const spec = [num(r.timing_spec_ns) ? `${f(r.timing_spec_ns)} ns` : "", num(r.position_spec_m) ? `${f(r.position_spec_m)} m` : ""].filter(Boolean).join(" and ");
  return {
    big: `The quantum suite holds position and time for ${dur(q.fom.pnt_holdover_s)}; the classical suite for ${dur(c.fom.pnt_holdover_s)}.`,
    line: `Holdover is how long each suite (clock ${qn}, against clock ${cn}) stays inside ${spec || "its spec"} after satellite navigation is lost.`,
    cards: [
      { label: "Holdover, quantum suite", value: dur(q.fom.pnt_holdover_s), unit: "", sub: spec ? `inside ${spec}` : "", good: q.fom.pnt_holdover_s >= c.fom.pnt_holdover_s, path: "quantum.fom.pnt_holdover_s" },
      { label: "Holdover, classical suite", value: dur(c.fom.pnt_holdover_s), unit: "", sub: spec ? `inside ${spec}` : "", path: "classical.fom.pnt_holdover_s" },
      num(q.fom.timing_p95_ns) ? { label: "Timing error, 95 %, quantum", value: f(q.fom.timing_p95_ns), unit: "ns", sub: "over the whole run", path: "quantum.fom.timing_p95_ns" } : null,
      num(c.fom.timing_p95_ns) ? { label: "Timing error, 95 %, classical", value: f(c.fom.timing_p95_ns), unit: "ns", sub: "over the whole run", path: "classical.fom.timing_p95_ns" } : null,
    ].filter(Boolean),
  };
}
function timetransfer(r) {
  const q = r.quantum && r.quantum.fom, c = r.classical && r.classical.fom;
  if (!q || !c || !num(q.sync_rms_ps) || !num(c.sync_rms_ps)) return null;
  const qn = (r.quantum.spec && r.quantum.spec.id) || "quantum link", cn = (r.classical.spec && r.classical.spec.id) || "classical link";
  return { big: `The ${qn} keeps the two sites within ${f(q.sync_rms_ps)} ps (root mean square); the ${cn} within ${f(c.sync_rms_ps)} ps.`, line: num(q.within_spec_fraction) && num(c.within_spec_fraction) ? `Inside the ${num(r.range_spec_mm) ? f(r.range_spec_mm) + " mm " : ""}ranging spec ${pc(q.within_spec_fraction)} % of the time, against ${pc(c.within_spec_fraction)} %.` : "" };
}
function telecom(r) {
  const masks = Array.isArray(r.masks) ? r.masks : [];
  const checks = masks.flatMap((m) => m.checks || []);
  if (!checks.length) return null;
  const fail = checks.filter((c) => c.verdict === "FAIL").length;
  return { big: fail ? `The clock fails ${fail} of ${checks.length} telecom time-error checks.` : `The clock passes all ${checks.length} telecom time-error checks.`, line: `Checks of MTIE (maximum time interval error), TDEV (time deviation) and the holdover envelope against the ITU-T masks named in each row.${has(r, "holdover_envelope.min_margin_ns") ? ` The smallest margin to the holdover envelope is ${f(get(r, "holdover_envelope.min_margin_ns"))} ns.` : ""}` };
}
function slotTiming(r) {
  if (!has(r, "result.breach_after_sync_s")) return null;
  return { big: `The clock leaves its slot guard ${dur(get(r, "result.breach_after_sync_s"))} after the last satellite fix.`, line: has(r, "result.resync_interval_s", "result.fixes_per_day") ? `So it needs a fix every ${dur(get(r, "result.resync_interval_s"))}, about ${f(get(r, "result.fixes_per_day"))} a day.` : "" };
}
function lunarTimeBudget(r) {
  if (!num(r.crossover_tau_s)) return null;
  return { big: `The ${words(r.clock || "clock")}'s error and the reference frame's error cross at an averaging time of ${dur(r.crossover_tau_s)}.`, line: num(r.crossover_x_s) ? `At that crossover the time error is ${f(r.crossover_x_s)} s.` : "" };
}
function lunarTimeOffset(r) {
  if (!num(r.secular_rate_us_per_day)) return null;
  return { big: `A clock on the Moon runs ${f(r.secular_rate_us_per_day)} µs a day ahead of one on Earth.`, line: num(r.band_low) && num(r.band_high) ? `The published band is ${f(r.band_low)} to ${f(r.band_high)} µs a day.` : "" };
}
function quantumTT(r) {
  if (!num(r.quantum_chain_sigma_s) || !num(r.classical_chain_sigma_s)) return null;
  return { big: `Quantum time transfer holds ${f(r.quantum_chain_sigma_s * 1e12)} ps (1-sigma) against ${f(r.classical_chain_sigma_s * 1e9)} ns for the classical chain.`, line: num(r.security_pd) ? `The security monitor detects ${pc(r.security_pd)} % of attacks${num(r.monitor_pfa) ? ` at a ${f(r.monitor_pfa)} false-alarm rate` : ""}.` : "" };
}

// ---------------------------------------------------------------- navigation without satellites
function mapMatch(r) {
  const free = r.free_inertial_drift_m, matched = [r.combined_m, r.map_matched_error_m, r.matched_error_m].find(num);
  if (!num(free) || !num(matched)) return null;
  return { big: `Map matching holds the position to ${f(matched)} m, against ${f(free)} m of drift on inertial alone.`, line: num(r.measurement_sigma_mgal) ? `The gravimeter measures to ${f(r.measurement_sigma_mgal)} mGal.` : num(r.measurement_sigma_m) ? `The altimeter measures to ${f(r.measurement_sigma_m)} m.` : num(r.gravity_only_m) ? `Gravity alone gives ${f(r.gravity_only_m)} m, magnetic ${f(r.magnetic_only_m)} m, terrain ${f(r.terrain_only_m)} m.` : "" };
}
function terrainSlam(r) {
  if (!num(r.matched_final_m) || !num(r.free_inertial_final_m)) return null;
  return { big: `Terrain matching ends ${f(r.matched_final_m)} m off, against ${f(r.free_inertial_final_m)} m on inertial alone.`, line: num(r.waypoints) ? `Over ${r.waypoints} waypoints, matched to a terrain map with ${f(r.measurement_sigma_m)} m altimeter noise.` : "" };
}
function insTrn(r) {
  const cr = Array.isArray(r.crossings) ? r.crossings.filter((c) => c && c.status === "reached" && num(c.coast_s) && num(c.threshold_m)) : [];
  if (!cr.length) return null;
  return { big: `Coasting on inertial alone, the position error passes ${f(cr[0].threshold_m)} m after ${dur(cr[0].coast_s)}.`, line: cr.length > 1 ? `It passes ${list(cr.slice(1).map((c) => `${f(c.threshold_m)} m after ${dur(c.coast_s)}`))}${cr[0].dominant_contribution ? `; ${words(cr[0].dominant_contribution)} dominates` : ""}.` : (cr[0].dominant_contribution ? `${words(cr[0].dominant_contribution).replace(/^./, (x) => x.toUpperCase())} dominates.` : "") };
}
function hybridUkf(r) {
  const c = r.consistency;
  if (!c || typeof c.consistent !== "boolean" || !num(c.nis_mean)) return null;
  return { big: c.consistent ? "Yes: the filter is self-consistent." : "No: the filter is not self-consistent.", line: `Its normalised innovation squared averages ${f(c.nis_mean)}, ${c.consistent ? "inside" : "outside"} the 95 % band of ${f(c.nis_chi2_lower_95)} to ${f(c.nis_chi2_upper_95)}${num(c.seeds) ? `, over ${c.seeds} seeds` : ""}. This checks consistency, not accuracy.` };
}
function quantumNav(r) {
  if (!num(r.quantum_pos_err_m) || !num(r.classical_pos_err_m)) return null;
  return { big: `After ${num(r.outage_s) ? dur(r.outage_s) + " without satellites" : "the outage"}, the cold-atom navigator is ${f(r.quantum_pos_err_m)} m off; the navigation-grade one ${f(r.classical_pos_err_m)} m.`, line: num(r.quantum_holdover_s) && num(r.classical_holdover_s) ? `Inside ${num(r.threshold_m) ? f(r.threshold_m) + " m" : "the budget"}: ${dur(r.quantum_holdover_s)} against ${dur(r.classical_holdover_s)}.` : "" };
}
function hybridOpticalRf(r) {
  const x = r.cross_modality_raim;
  if (!x || !num(x.hpl_m) || !num(x.vpl_m)) return null;
  return { big: `Combining optical and radio ranging gives protection levels of ${f(x.hpl_m)} m horizontal and ${f(x.vpl_m)} m vertical.`, line: num(x.chi2_statistic) && num(x.chi2_threshold) ? `The consistency test reads ${f(x.chi2_statistic)} against a threshold of ${f(x.chi2_threshold)}: ${x.chi2_statistic <= x.chi2_threshold ? "no fault" : "a fault"} is flagged.` : "" };
}
function conflict(r) {
  const rr = r.resilience_ratio;
  if (!rr || !num(rr.closed_form_independent)) return null;
  return { big: `The layered architecture survives ${f(rr.closed_form_independent)} times better than a single layer.`, line: num(rr.monte_carlo_independent) ? `A Monte Carlo of ${num(r.trials) ? r.trials + " trials" : "the threats"} gives ${f(rr.monte_carlo_independent)} times${has(r, "correlation_sweep.min_ratio_over_grid") ? `; with correlated threats it can fall to ${f(get(r, "correlation_sweep.min_ratio_over_grid"))} times` : ""}.` : "" };
}
function impairment(r) {
  if (!num(r.auc)) return null;
  const d = r.distribution_shift;
  return { big: `The detector separates impaired signals from clean ones with an area under the curve of ${f(r.auc)} (1 is perfect).`, line: d && num(d.auc_out) ? `On cases unlike its training set it scores ${f(d.auc_out)}.` : "" };
}
function quantumAnomaly(r) {
  if (!num(r.quantum_auc) || !num(r.classical_auc)) return null;
  return { big: `The quantum fault monitor scores ${f(r.quantum_auc)} against ${f(r.classical_auc)} for the classical one (area under the curve, 1 is perfect).`, line: num(r.quantum_min_detectable) && num(r.classical_min_detectable) ? `The smallest detectable fault is ${f(r.quantum_min_detectable)} against ${f(r.classical_min_detectable)}.` : "" };
}
function quantumTrade(r) {
  if (!has(r, "trade.inertial_benefit_x", "trade.timing_benefit_x")) return null;
  return { big: `The quantum sensors are ${f(get(r, "trade.timing_benefit_x"))} times better at timing and ${f(get(r, "trade.inertial_benefit_x"))} times better at inertial navigation than the classical baseline.`, line: has(r, "resilience.coast_time_s") ? `Without satellites the quantum suite coasts for ${dur(get(r, "resilience.coast_time_s"))}.` : "" };
}

// ---------------------------------------------------------------- integrity, spoofing, signals
function araimRef(r) {
  if (typeof r.acceptance_met !== "boolean" || !num(r.worst_acceptance_error_m)) return null;
  return { big: r.acceptance_met ? "Yes: the engine's protection levels match the published reference." : "No: the engine's protection levels miss the published reference.", line: `The worst difference is ${f(r.worst_acceptance_error_m)} m against the reference's own tolerance of ${f(r.acceptance_tolerance_m)} m${num(r.vectors_checked) ? `, over ${r.vectors_checked} reference vectors` : ""}.` };
}
function gnssSim(r) {
  if (!has(r, "fom.raim_availability")) return null;
  return { big: `Integrity monitoring protects the fix ${pc(get(r, "fom.raim_availability"))} % of the time.`, line: has(r, "fom.mean_iono_m", "fom.mean_tropo_m") ? `The ionosphere adds ${f(get(r, "fom.mean_iono_m"))} m and the troposphere ${f(get(r, "fom.mean_tropo_m"))} m to each range on average.` : "" };
}
function pvt(r) {
  if (!has(r, "fom.epochs_solved", "fom.epochs_total", "fom.rms_3d_m")) return null;
  return { big: `A position is solved at ${get(r, "fom.epochs_solved")} of ${get(r, "fom.epochs_total")} epochs, to ${f(get(r, "fom.rms_3d_m"))} m (3-D root mean square).`, line: has(r, "fom.mean_n_used") ? `From ${f(get(r, "fom.mean_n_used"))} satellites on average, read from real receiver measurements.` : "" };
}
const LAYER = { raim: "RAIM (receiver autonomous integrity monitoring)", agc: "AGC (automatic gain control)", sqm: "SQM (signal-quality monitoring)" };
function spoofDetect(r) {
  const fu = r.decision && r.decision.fused;
  if (!fu || !fu.layers || typeof fu.alert !== "boolean") return null;
  const flags = Object.entries(fu.layers).filter(([, v]) => typeof v === "boolean");
  const on = flags.filter(([, v]) => v).map(([k]) => LAYER[k] || words(k));
  return { big: fu.alert ? `Yes: the spoof is caught${on.length ? `, by ${list(on)}` : ""}.` : "No: the fused monitor does not catch the spoof.", line: `${on.length} of ${flags.length} detection layers alarm${num(fu.score) ? `; the fused score is ${f(fu.score)}` : ""}.` };
}
function trackingLoop(r) {
  const d = r.denial;
  if (!d || !num(d.capture_radius_threshold_km)) return null;
  return { big: `A spoofer can capture the receiver from up to ${f(d.capture_radius_threshold_km)} km away.`, line: num(d.denial_js_loop_db) ? `Under the receiver's own loop dynamics, lock is lost at ${f(d.denial_js_loop_db)} dB of jammer above the signal.` : "" };
}
function leoSignal(r) {
  const s = Array.isArray(r.signals) ? r.signals.filter((x) => x && x.jammer_tolerance && num(x.jammer_tolerance.wideband_js_max_db)) : [];
  if (!s.length) return null;
  const best = s.reduce((a, b) => (b.jammer_tolerance.wideband_js_max_db > a.jammer_tolerance.wideband_js_max_db ? b : a));
  return { big: `Of ${s.length} signal designs, ${best.name || best.id || "the best"} tolerates the most jamming: ${f(best.jammer_tolerance.wideband_js_max_db)} dB above the signal.`, line: typeof r.shape_checks_pass === "boolean" ? `Spectrum shape checks ${r.shape_checks_pass ? "pass" : "fail"}.` : "" };
}

// ---------------------------------------------------------------- low Earth orbit
function leoPass(r) {
  const sats = Array.isArray(r.satellites) ? r.satellites.filter((s) => s && s.pass && num(s.pass.max_elevation_deg) && num(s.pass.duration_above_mask_s)) : [];
  if (!sats.length) return null;
  const s = sats[0];
  const cmp = r.comparison || {};
  return { big: `The satellite${sats.length > 1 ? "s pass" : " passes"} ${f(s.pass.max_elevation_deg)}° high and stay${sats.length > 1 ? "" : "s"} above the mask for ${dur(s.pass.duration_above_mask_s)}${sats.length > 1 ? ` (the first of ${sats.length})` : ""}.`, line: num(cmp.leo_peak_above_gnss_median_db) ? `At its peak the low-orbit signal arrives ${f(cmp.leo_peak_above_gnss_median_db)} dB stronger than a typical satellite navigation signal.` : "" };
}
function leoPvt(r) {
  if (r.doppler && num(r.doppler.horizontal_error_m)) return { big: `Doppler positioning from low-orbit satellites lands ${f(r.doppler.horizontal_error_m)} m from the truth (horizontal).`, line: num(r.doppler.n_sats) ? `${r.doppler.n_sats} satellites used.` : "" };
  if (r.joint && r.joint.gnss && r.joint.fused && num(r.joint.gnss.rms_error_3d_m) && num(r.joint.fused.rms_error_3d_m)) return { big: `Adding the low-orbit layer brings the error from ${f(r.joint.gnss.rms_error_3d_m)} m to ${f(r.joint.fused.rms_error_3d_m)} m (3-D root mean square).`, line: num(r.joint.gnss.median_pdop) && num(r.joint.fused.median_pdop) ? `Geometry quality (PDOP) goes from ${f(r.joint.gnss.median_pdop)} to ${f(r.joint.fused.median_pdop)}.` : "" };
  const rows = r.timing && Array.isArray(r.timing.rows) ? r.timing.rows.filter((x) => x && x.stats && num(x.stats.rms_s)) : [];
  if (rows.length) { const b = rows.reduce((a, c) => (c.stats.rms_s < a.stats.rms_s ? c : a)); return { big: `Low-orbit time transfer keeps the best clock within ${f(b.stats.rms_s * 1e9)} ns of UTC (root mean square).`, line: `${rows.length} clock and signal cases compared.` }; }
  const pr = r.polar && Array.isArray(r.polar.rows) ? r.polar.rows.filter((x) => x && x.gnss && x.fused && num(x.gnss.median_pdop) && num(x.fused.median_pdop)) : [];
  if (pr.length) { const p = pr[pr.length - 1]; return { big: `Near the pole, the low-orbit layer improves the geometry quality (PDOP) from ${f(p.gnss.median_pdop)} to ${f(p.fused.median_pdop)}.`, line: `Across ${pr.length} latitudes.` }; }
  return null;
}
function leoPpp(r) {
  const cs = Array.isArray(r.cases) ? r.cases.filter((c) => c && num(c.median_convergence_min)) : [];
  if (cs.length < 2) return null;
  return { big: `Precise positioning converges in ${f(cs[cs.length - 1].median_convergence_min)} min with the largest low-orbit layer, against ${f(cs[0].median_convergence_min)} min with satellite navigation only.`, line: `Median of ${num(r.runs_per_case) ? r.runs_per_case + " runs" : "the runs"} per case, to ${f(r.criterion_horizontal_m)} m.` };
}
function leoNavmsg(r) {
  if (r.encode_decode && num(r.encode_decode.frame_bytes)) return { big: `One navigation message fits in ${r.encode_decode.frame_bytes} bytes.`, line: num(r.encode_decode.sisre_quantised_rms_m) ? `Rounding to the message format costs ${f(r.encode_decode.sisre_quantised_rms_m * 1000)} mm of range error.` : "" };
  const rows = (r.fit_interval_trade && r.fit_interval_trade.rows) || (r.model_comparison && r.model_comparison.rows) || [];
  const v = rows.map((x) => (x && x.sisre_rms_m) ?? (x && x.stats && x.stats.sisre_rms_m)).filter(num);
  if (v.length) return { big: `Across ${v.length} cases, the range error from the broadcast orbit is ${f(Math.min(...v) * 1000)} to ${f(Math.max(...v) * 1000)} mm.`, line: "Signal-in-space range error, root mean square." };
  if (r.midpass_update && num(r.midpass_update.max_range_jump_m)) return { big: `Updating the message mid-pass makes the range jump by at most ${f(r.midpass_update.max_range_jump_m * 1000)} mm.`, line: num(r.midpass_update.threshold_m) ? `The limit is ${f(r.midpass_update.threshold_m * 1000)} mm.` : "" };
  return null;
}
function leoChain(r) {
  const g = get(r, "fusion.gnss.rms_error_3d_m"), fu = get(r, "fusion.fused.rms_error_3d_m");
  if (!num(g) || !num(fu)) return null;
  return { big: `End to end, the low-orbit system brings the position error from ${f(g)} m to ${f(fu)} m.`, line: has(r, "pass.peak_tracked_cn0_dbhz") ? `Its signal is tracked at up to ${f(get(r, "pass.peak_tracked_cn0_dbhz"))} dB-Hz.` : "" };
}
function ntn(r) {
  const s = Array.isArray(r.signals) ? r.signals.filter((x) => x && num(x.toa_rms_error_3d_m)) : [];
  if (!s.length) return null;
  const b = s.reduce((a, c) => (c.toa_rms_error_3d_m < a.toa_rms_error_3d_m ? c : a));
  return { big: `5G positioning from orbit reaches ${f(b.toa_rms_error_3d_m)} m with ${b.name || "the widest signal"}.`, line: has(r, "doppler_pass.horizontal_error_m") ? `Doppler over one pass gives ${f(get(r, "doppler_pass.horizontal_error_m"))} m.` : "" };
}

// ---------------------------------------------------------------- space operations
function attitude(r) {
  if (!num(r.total_pointing_error_arcsec)) return null;
  return { big: `The pointing error totals ${f(r.total_pointing_error_arcsec)} arcseconds${r.dominant_contributor ? `, mostly from ${words(r.dominant_contributor)}` : ""}.`, line: num(r.gravity_gradient_torque_max_nm) ? `The largest gravity-gradient torque is ${f(r.gravity_gradient_torque_max_nm)} N·m.` : "" };
}
function aperture(r) {
  if (!num(r.navigation_duty) || !num(r.communications_duty)) return null;
  return { big: `Navigation uses ${pc(r.navigation_duty)} % of the antenna time and communications ${pc(r.communications_duty)} %${num(r.idle_duty) ? `; ${pc(r.idle_duty)} % is idle` : ""}.`, line: `${num(r.apertures) ? r.apertures + " apertures" : "The apertures"}${r.arbitration_policy ? ` under the ${words(r.arbitration_policy)} rule` : ""}${num(r.contention_s) ? `, with ${dur(r.contention_s)} of contention` : ""}.` };
}
function eo(r) {
  if (!num(r.swath_width_km) || !num(r.nadir_gsd_m)) return null;
  return { big: `The camera sees a ${f(r.swath_width_km)} km swath at ${f(r.nadir_gsd_m)} m resolution.`, line: typeof r.contiguous_equatorial_coverage === "boolean" ? `Ground tracks are ${f(r.equatorial_ground_track_spacing_km)} km apart at the equator, so coverage is ${r.contiguous_equatorial_coverage ? "contiguous" : "gapped"}.` : "" };
}
function launch(r) {
  if (!num(r.daily_opportunities)) return null;
  return { big: `${r.daily_opportunities} launch opportunit${r.daily_opportunities === 1 ? "y" : "ies"} a day reach a ${f(r.target_inclination_deg)}° orbit from latitude ${f(r.site_lat_deg)}°.`, line: num(r.site_rotation_speed_m_s) ? `The Earth's rotation gives ${f(r.site_rotation_speed_m_s)} m/s for free.` : "" };
}
function linkBudget(r) {
  if (typeof r.closes !== "boolean" || !num(r.margin_db)) return null;
  return { big: r.closes ? `The link closes with ${f(r.margin_db)} dB to spare.` : `The link does not close: ${f(r.margin_db)} dB of margin.`, line: num(r.range_km) ? `${words(r.band || "")}-band over ${f(r.range_km)} km${num(r.data_rate_bps) ? ` at ${f(r.data_rate_bps)} bit/s` : ""}.`.replace(/^-band/, "Over") : "" };
}
function passes(r) {
  if (!num(r.pass_count) || !num(r.total_access_s)) return null;
  return { big: `${r.pass_count} passes a${num(r.duration_hours) && r.duration_hours !== 24 ? `n ${f(r.duration_hours)}-hour window` : " day"}, ${dur(r.total_access_s)} of contact in all.`, line: num(r.best_max_elevation_deg) ? `The best pass rises to ${f(r.best_max_elevation_deg)}°.` : "" };
}
function reentry(r) {
  if (!num(r.peak_deceleration_g)) return null;
  return { big: `Peak deceleration is ${f(r.peak_deceleration_g)} g, at ${f(r.altitude_at_peak_g_m / 1000)} km.`, line: num(r.velocity_at_peak_g_m_s) ? `The vehicle is then at ${f(r.velocity_at_peak_g_m_s)} m/s.` : "" };
}
function ephemeris(r) {
  if (!num(r.alt_min_km) || !num(r.alt_max_km)) return null;
  return { big: `The satellite flies between ${f(r.alt_min_km)} and ${f(r.alt_max_km)} km, up to ${f(Math.max(Math.abs(r.lat_min_deg), Math.abs(r.lat_max_deg)))}° of latitude.`, line: num(r.max_elevation_deg) ? `Seen from the station it rises to ${f(r.max_elevation_deg)}°${num(r.peak_doppler_hz) ? `, with up to ${f(r.peak_doppler_hz / 1000)} kHz of Doppler` : ""}.` : "" };
}
function spaceWeather(r) {
  if (!num(r.exospheric_temperature_k)) return null;
  return { big: `The upper atmosphere heats to ${f(r.exospheric_temperature_k)} K${num(r.reference_exospheric_temperature_k) ? `, against ${f(r.reference_exospheric_temperature_k)} K for the reference` : ""}.`, line: num(r.ap) ? `Geomagnetic activity index ap is ${f(r.ap)}.` : "" };
}
function spacePacket(r) {
  if (typeof r.round_trip_exact !== "boolean") return null;
  return { big: r.round_trip_exact ? "Yes: the packet stream decodes back bit for bit." : "No: the decoded stream differs from what was sent.", line: num(r.packet_count) ? `${r.packet_count} packets, ${f(r.total_stream_octets)} octets in all.` : "" };
}
function oem(r) {
  if (!num(r.round_trip_max_pos_error_km)) return null;
  return { big: `The ephemeris file round-trips with at most ${f(r.round_trip_max_pos_error_km * 1e6)} mm of position error.`, line: num(r.n_states_total) ? `${r.n_states_total} states in ${r.n_segments} segments.` : "" };
}
function solar(r) {
  const links = Array.isArray(r.links) ? r.links.filter((l) => l && num(l.one_way_light_time_s)) : [];
  if (!num(r.n_bodies)) return null;
  return { big: `${r.n_bodies} bodies placed at one epoch${links.length ? `; light takes ${dur(links[0].one_way_light_time_s)} from ${links[0].from || "the first"} to ${links[0].to || "the second"}` : ""}.`, line: links.length > 1 ? `${links.length} links are timed in all.` : "" };
}
function realtimeEop(r) {
  if (!num(r.lever_arm_m_per_s) || !num(r.latency_s)) return null;
  return { big: `At the Moon's distance the Earth's rotation sweeps ${f(r.lever_arm_m_per_s)} m every second, so the age of Earth-orientation data (${dur(r.latency_s)} here) matters.`, line: r.eop_source ? `Input: ${r.eop_source}.` : "" };
}

// ---------------------------------------------------------------- Moon, Mars and deep space
function bodyPnt(r) {
  const fo = r.fom;
  if (!fo || !num(fo.availability_relays)) return null;
  const body = (r.body && (r.body.name || r.body)) || "the body";
  return { big: `Relays alone give a fix ${pc(fo.availability_relays)} % of the time around ${body}${num(fo.availability_with_earth) ? `; ${pc(fo.availability_with_earth)} % with links to Earth` : ""}.`, line: num(fo.mean_relays_visible) ? `${f(fo.mean_relays_visible)} relays are in view on average.` : "" };
}
function marsPnt(r) {
  const fo = r.fom;
  if (!fo || !num(fo.converged_pos_rms_m)) return null;
  return { big: `The ${words(r.user || "user")} navigator settles to ${f(fo.converged_pos_rms_m)} m (root mean square).`, line: num(fo.mean_relays_in_view) ? `${f(fo.mean_relays_in_view)} relays in view on average, over ${fo.epochs} epochs.` : "" };
}
function moonlight(r) {
  if (!num(r.coverage_pct)) return null;
  return { big: `The service covers ${p1(r.coverage_pct)} % of the places and times checked.`, line: num(r.min_sats) ? `Between ${r.min_sats} and ${r.max_sats} satellites are in view; geometry quality (PDOP) ranges from ${f(r.pdop_min)} to ${f(r.pdop_max)}.` : "" };
}
const p1 = (x) => (Math.abs(x - Math.round(x)) < 0.05 ? String(Math.round(x)) : x.toFixed(1));
function earthGnssLunar(r) {
  if (!num(r.n_geometrically_visible) || !num(r.n_trackable)) return null;
  return { big: `At the Moon's distance, ${r.n_geometrically_visible} of ${r.n_satellites} satellites are in view but ${r.n_trackable} can be tracked.`, line: has(r, "sweep.best_cn0_dbhz") ? `The best signal is ${f(get(r, "sweep.best_cn0_dbhz"))} dB-Hz against a tracking threshold of ${f(r.tracking_threshold_dbhz)} dB-Hz.` : "" };
}
function lunarBeacon(r) {
  if (!num(r.beacon_pdop_improvement)) return null;
  return { big: `Surface beacons improve the geometry quality (PDOP) ${f(r.beacon_pdop_improvement)} times.`, line: num(r.constellation_pdop_improvement) ? `Adding satellites instead improves it ${f(r.constellation_pdop_improvement)} times.` : "" };
}
function lunarDpnt(r) {
  if (!num(r.user_error_uncorrected_m) || !num(r.user_error_corrected_m)) return null;
  return { big: `Differential corrections bring the error from ${f(r.user_error_uncorrected_m)} m to ${f(r.user_error_corrected_m)} m.`, line: num(r.baseline_km) ? `With a reference station ${f(r.baseline_km)} km away.` : "" };
}
function lunarAttack(r) {
  if (typeof r.spoof_captured !== "boolean") return null;
  return { big: r.spoof_captured ? "A spoofer on the surface can capture a lunar receiver." : "A spoofer on the surface cannot capture a lunar receiver.", line: num(r.surface_transmitter_reach_m) ? `A surface transmitter reaches ${f(r.surface_transmitter_reach_m / 1000)} km before the horizon blocks it.` : "" };
}
function lunarJointOd(r) {
  if (!num(r.station_observability_improvement_factor)) return null;
  return { big: `Adding an Earth-based interferometry delay sharpens the station position ${f(r.station_observability_improvement_factor)} times.`, line: has(r, "with_vlbi.station_pos_err_m") ? `The station is then known to ${f(get(r, "with_vlbi.station_pos_err_m"))} m.` : "" };
}
function lunarFrameReal(r) {
  if (!num(r.rms_residual_m)) return null;
  return { big: `The lunar frame is realised with ${f(r.rms_residual_m)} m of residual error${typeof r.converged === "boolean" ? (r.converged ? "" : ", though the fit did not converge") : ""}.`, line: num(r.trans_err_norm_m) ? `Translation error ${f(r.trans_err_norm_m)} m, scale error ${f(r.scale_err_ppb)} parts per billion.` : "" };
}
function lunarInterop(r) {
  if (typeof r.oem_roundtrip_ok !== "boolean") return null;
  return { big: r.oem_roundtrip_ok ? "Yes: the lunar ephemeris file round-trips intact." : "No: the lunar ephemeris file does not round-trip.", line: `${r.n_states} states in the ${r.frame || ""} frame, ${r.time_system || ""} time.`.replace(/ {2,}/g, " ") };
}
function lunarVlbi(r) {
  if (!num(r.baseline_km) || !num(r.delay_s)) return null;
  return { big: `Over a ${f(r.baseline_km)} km baseline, the beacon's signal arrives ${f(Math.abs(r.delay_s) * 1000)} ms apart at the two stations.`, line: num(r.near_field_correction_us) ? `The near-field correction is ${f(r.near_field_correction_us)} µs.` : "" };
}
function lunarVlbiFim(r) {
  const s = get(r, "headline.computed_per_coordinate_sigma_m");
  if (!num(s)) return null;
  return { big: `Each station coordinate is known to ${f(s)} m from this observing schedule.`, line: has(r, "headline.equipartition_per_coordinate_sigma_m") ? `The simple equal-share estimate would claim ${f(get(r, "headline.equipartition_per_coordinate_sigma_m"))} m.` : "" };
}
function lunarFrameCampaign(r) {
  const h = r.helmert;
  if (!h || !num(h.defect)) return null;
  return { big: h.defect === 0 ? "Yes: the campaign fixes the lunar frame datum fully." : `The campaign leaves ${h.defect} datum direction${h.defect === 1 ? "" : "s"} undetermined.`, line: num(h.condition_number) ? `Condition number ${f(h.condition_number)}.` : "" };
}
function lunarLlr(r) {
  const s = get(r, "datum_accuracy.translation_sigma_norm_m");
  if (!num(s)) return null;
  return { big: `Real laser ranging pins the lunar frame to ${f(s * 1000)} mm.`, line: has(r, "datum_accuracy.scale_sigma_ppb") ? `Scale to ${f(get(r, "datum_accuracy.scale_sigma_ppb"))} parts per billion.` : "" };
}
function cislunarObs(r) {
  const rows = Array.isArray(r.rank_vs_arc) ? r.rank_vs_arc.filter((x) => x && num(x.rank) && num(x.arc_hours)) : [];
  if (!rows.length || !num(r.state_dim)) return null;
  const full = rows.find((x) => x.rank >= r.state_dim);
  return { big: full ? `The orbit becomes fully observable after ${dur(full.arc_hours * 3600)} of tracking.` : `The orbit stays partly observable over the ${f(r.arc_hours)} h arc.`, line: `Rank ${rows[rows.length - 1].rank} of ${r.state_dim} at the end of the arc.` };
}
function cislunarArc(r) {
  const h = get(r, "claim_under_test.estimator_estimability_boundary_hours");
  if (!num(h) || !num(r.arc_hours)) return null;
  return { big: `The estimator recovers the orbit once it has ${dur(h * 3600)} of the ${f(r.arc_hours)} h arc.`, line: num(r.n_spacecraft) ? `${r.n_spacecraft} spacecraft, ${words(r.observable || "")} measurements.` : "" };
}

export const KIND_TEMPLATES = {
  campaign, sweep, "sweep-nd": sweepNd, spoof, fusion: pnt, hybrid: pnt, timetransfer, "telecom-timing": telecom, "slot-timing": slotTiming,
  "lunar-time-budget": lunarTimeBudget, "lunar-time-offset": lunarTimeOffset, "quantum-time-transfer": quantumTT,
  "gravity-map": mapMatch, "terrain-nav": mapMatch, "combined-altpnt": mapMatch, "terrain-slam": terrainSlam, "ins-trn-coast": insTrn,
  "hybrid-ukf": hybridUkf, "quantum-gnss-free-nav": quantumNav, "hybrid-optical-rf": hybridOpticalRf, "conflict-resilience": conflict,
  "impairment-eval": impairment, "quantum-anomaly-detect": quantumAnomaly, "quantum-trade": quantumTrade,
  "araim-reference-check": araimRef, "gnss-sim": gnssSim, pvt, "spoof-detect": spoofDetect, "tracking-loop": trackingLoop, "leo-signal": leoSignal,
  "leo-pass": leoPass, "leo-pvt": leoPvt, "leo-ppp": leoPpp, "leo-navmsg": leoNavmsg, "leo-pnt-chain": leoChain, "ntn-positioning": ntn,
  "attitude-budget": attitude, "aperture-duty-cycle": aperture, "eo-coverage": eo, "launch-window": launch, "link-budget": linkBudget, passes, reentry,
  ephemeris, "space-weather": spaceWeather, "space-packet": spacePacket, "oem-interop": oem, "solar-system": solar, "realtime-frame-eop": realtimeEop,
  "body-pnt": bodyPnt, "mars-pnt": marsPnt, "moonlight-service-volume": moonlight, "earth-gnss-lunar": earthGnssLunar, "lunar-beacon": lunarBeacon,
  "lunar-differential-pnt": lunarDpnt, "lunar-attack-surface": lunarAttack, "lunar-joint-od-clock": lunarJointOd, "lunar-frame-realisation": lunarFrameReal,
  "lunar-interop-export": lunarInterop, "lunar-vlbi": lunarVlbi, "lunar-vlbi-fim": lunarVlbiFim, "lunar-frame-campaign": lunarFrameCampaign,
  "lunar-llr-datum": lunarLlr, "cislunar-observability": cislunarObs, "cislunar-arc-recovery": cislunarArc,
};
