// SPDX-License-Identifier: AGPL-3.0-only
// Plain-meaning templates for the engine kinds that lib/meaning.mjs does not cover itself. One
// template per KIND, so it serves every scenario of that kind. Each reads named fields of the
// result document and returns { big, line } (and cards when the headline strip would not answer
// the question), or null when a field it needs is missing; the caller then states the run's first
// key figure plainly. Every number is a field of the result, or a count or share of fields.
// Pure; tested in meaning.test.mjs against every recorded result.
import * as K from "./kinds.mjs";
import { fmt } from "./views.mjs";
import { t } from "./t.mjs";
import { own } from "./own.mjs";

const num = (x) => typeof x === "number" && Number.isFinite(x);
const get = (r, p) => K.resolve(r, p);
const has = (r, ...ps) => ps.every((p) => num(get(r, p)));
const pc = (x) => { const v = 100 * x; return Math.abs(v - Math.round(v)) < 0.05 ? String(Math.round(v)) : v.toFixed(1); };
const words = (s) => String(s).replace(/[_-]+/g, " ").trim();
// A result key as words, without its unit suffix or the path above it: "classical.fom.holdover_s" -> "classical holdover".
const term = (k) => { const parts = String(k).split("."); const last = parts.pop().replace(/_(s|m|km|ns|db|dbhz|dbw|deg|hz|pct|days?|min)$/i, ""); const head = parts.filter((p) => !/^(fom|metrics|stats)$/.test(p)); return words([...head, last].join(" ")); };
// "A, B and C": a list of names or figures read from the result (the join word is the translatable part).
export const list = (xs) => (xs.length <= 1 ? xs.join("") : t("js-meankind-list-and", "{ $head } and { $last }", { head: xs.slice(0, -1).join(", "), last: xs[xs.length - 1] }));
// "3 by 4": the sides of a grid.
const by = (xs) => (xs.length ? xs.map(String).reduce((a, b) => t("js-meankind-by", "{ $a } by { $b }", { a, b })) : "");
// A figure with its unit (the unit is a symbol, left as it is).
const withUnit = (v, unit) => (unit ? `${v} ${unit}` : v);
const f = (x, d = 3) => fmt(x, d);
export function dur(s) {
  if (!num(s)) return "—";
  const a = Math.abs(s);
  if (a < 90) return `${fmt(a, 2)} s`;
  if (a < 3600) return `${Math.round(a / 60)} min`;
  if (a < 172800) { const h = Math.floor(a / 3600), m = Math.round((a - h * 3600) / 60); return m === 60 ? `${h + 1} h` : m ? `${h} h ${m} min` : `${h} h`; }
  return t("js-meankind-duration-days", { one: "{ $days } day", other: "{ $days } days" }, { n: a / 86400, days: fmt(a / 86400, 2) });
}
// The pair of cards { min, max } a composed campaign states for one metric, from the strip.
const pairOf = (cards, re) => {
  const lo = cards.find((c) => re.test(c.path || "") && /\.min$/.test(c.path)), hi = cards.find((c) => re.test(c.path || "") && /\.max$/.test(c.path));
  return lo && hi ? { lo, hi } : null;
};

// ---------------------------------------------------------------- campaigns
function campaign(r, toml, cards) {
  const runs = get(r, "reproducibility.runs_total");
  if (r.optimize && num(r.optimize.best_metric) && num(r.optimize.evals) && typeof r.optimize.objective_name === "string") {
    const o = r.optimize, at = o.best_coords && typeof o.best_coords === "object" ? Object.entries(o.best_coords).filter(([, v]) => num(v)).map(([k, v]) => `${words(k)} ${f(v)}`) : [];
    const ov = { name: words(o.objective_name), value: `${f(o.best_metric)}${o.objective && typeof o.objective.unit === "string" && o.objective.unit !== "1" ? " " + o.objective.unit : ""}`, n: o.evals, kind: typeof o.scenario_kind === "string" ? words(o.scenario_kind) : "" };
    return { big: typeof o.scenario_kind === "string" ? t("js-meankind-campaign-optimize-kind", { one: "The search settles on a { $name } of { $value } after { $n } run of { $kind }.", other: "The search settles on a { $name } of { $value } after { $n } runs of { $kind }." }, ov) : t("js-meankind-campaign-optimize", { one: "The search settles on a { $name } of { $value } after { $n } run.", other: "The search settles on a { $name } of { $value } after { $n } runs." }, ov), line: at.length ? t("js-meankind-campaign-optimize-at", "At { $at }.", { at: list(at) }) : undefined };
  }
  const tl = r.timeline;
  if (tl && Array.isArray(tl.phases) && num(tl.duration_s)) {
    const last = Array.isArray(tl.t_s) ? tl.t_s.length - 1 : -1;
    const alarm = tl.channels && tl.channels.alarm && Array.isArray(tl.channels.alarm.values) ? tl.channels.alarm.values : null;
    const step = num(tl.step_s) ? tl.step_s : null;
    const alarmed = alarm && step ? alarm.filter((v) => v > 0).length * step : null;
    const events = Array.isArray(tl.events) ? tl.events.length : 0;
    const big = alarmed === null ? t("js-meankind-campaign-mission-phases", "A { $phases }-phase mission over { $dur }, chained on one clock.", { phases: tl.phases.length, dur: dur(tl.duration_s) }) : alarmed > 0 ? t("js-meankind-campaign-mission-alarm", "The alarm is raised for { $alarm } of the { $dur } mission.", { alarm: dur(alarmed), dur: dur(tl.duration_s) }) : t("js-meankind-campaign-mission-quiet", "No alarm in the whole { $dur } mission.", { dur: dur(tl.duration_s) });
    const ch = Object.entries(tl.channels || {}).find(([k, c]) => k !== "alarm" && !/alert_limit|guard/.test(k) && c && typeof c.label === "string" && c.label.length > 6 && !/_/.test(c.label) && Array.isArray(c.values) && num(c.values[last]));
    const lv = {
      n: tl.phases.length,
      events: t("js-meankind-event-count", { one: "{ $n } event", other: "{ $n } events" }, { n: events }),
      runs: t("js-meankind-engine-run-count", { one: "{ $n } engine run", other: "{ $n } engine runs" }, { n: runs }),
      label: ch ? ch[1].label.replace(/:.*$/, "").replace(/^./, (x) => x.toLowerCase()) : "",
      value: ch ? `${f(ch[1].values[last])}${ch[1].unit && ch[1].unit !== "1" ? " " + ch[1].unit : ""}` : "",
    };
    const ev = events > 0, rn = num(runs);
    let line;
    if (!ev && !rn && !ch) line = t("js-meankind-campaign-line", { one: "{ $n } phase.", other: "{ $n } phases." }, lv);
    else if (!ev && !rn) line = t("js-meankind-campaign-line-end", { one: "{ $n } phase; at the end, the { $label } is { $value }.", other: "{ $n } phases; at the end, the { $label } is { $value }." }, lv);
    else if (!ev && !ch) line = t("js-meankind-campaign-line-runs", { one: "{ $n } phase, from { $runs }.", other: "{ $n } phases, from { $runs }." }, lv);
    else if (!ev) line = t("js-meankind-campaign-line-runs-end", { one: "{ $n } phase, from { $runs }; at the end, the { $label } is { $value }.", other: "{ $n } phases, from { $runs }; at the end, the { $label } is { $value }." }, lv);
    else if (!rn && !ch) line = t("js-meankind-campaign-line-events", { one: "{ $n } phase and { $events }.", other: "{ $n } phases and { $events }." }, lv);
    else if (!rn) line = t("js-meankind-campaign-line-events-end", { one: "{ $n } phase and { $events }; at the end, the { $label } is { $value }.", other: "{ $n } phases and { $events }; at the end, the { $label } is { $value }." }, lv);
    else if (!ch) line = t("js-meankind-campaign-line-events-runs", { one: "{ $n } phase and { $events }, from { $runs }.", other: "{ $n } phases and { $events }, from { $runs }." }, lv);
    else line = t("js-meankind-campaign-line-all", { one: "{ $n } phase and { $events }, from { $runs }; at the end, the { $label } is { $value }.", other: "{ $n } phases and { $events }, from { $runs }; at the end, the { $label } is { $value }." }, lv);
    return { big, line };
  }
  if (r.monte_carlo && r.monte_carlo.metrics) {
    const [name, m] = Object.entries(r.monte_carlo.metrics).find(([, v]) => v && num(v.mean) && num(v.std)) || [];
    if (!name) return null;
    const card = cards.find((c) => c.path === `monte_carlo.metrics.${name}.mean`);
    const u = card && card.unit ? card.unit : "";
    return { big: t("js-meankind-campaign-montecarlo", { one: "Across { $n } seeded run, the { $name } averages { $mean }, with a spread of { $std }.", other: "Across { $n } seeded runs, the { $name } averages { $mean }, with a spread of { $std }." }, { n: num(r.monte_carlo.runs) ? r.monte_carlo.runs : runs, name: words(name), mean: withUnit(f(m.mean), u), std: withUnit(f(m.std), u) }), line: t("js-meankind-campaign-montecarlo-line", "The spread is one standard deviation over the runs.") };
  }
  if (r.compose) {
    const p = cards.map((c) => (c.path || "").match(/^compose\.combined\.([^.]+)\.min$/)).filter(Boolean).map((m) => pairOf(cards, new RegExp(`^compose\\.combined\\.${m[1]}\\.`))).filter(Boolean)[0];
    if (!p) return null;
    const u = p.lo.unit || "";
    const n = Array.isArray(r.compose.members) ? r.compose.members.length : runs;
    const what = p.lo.sub ? p.lo.sub.toLowerCase() : t("js-meankind-headline-figure", "headline figure");
    return { big: p.lo.v === p.hi.v ? t("js-meankind-campaign-compose-same", { one: "Across { $n } scenario under the same conditions, the { $what } is { $value } in every one.", other: "Across { $n } scenarios under the same conditions, the { $what } is { $value } in every one." }, { n, what, value: withUnit(f(p.lo.v), u) }) : t("js-meankind-campaign-compose-range", { one: "Across { $n } scenario under the same conditions, the { $what } ranges from { $low } to { $high }.", other: "Across { $n } scenarios under the same conditions, the { $what } ranges from { $low } to { $high }." }, { n, what, low: f(p.lo.v), high: withUnit(f(p.hi.v), u) }), line: t("js-meankind-campaign-compose-line", "Each member is an ordinary engine run; the campaign reads their results side by side.") };
  }
  if (r.sweep && Array.isArray(r.sweep.nodes) && r.sweep.nodes.length && r.sweep.axes) {
    const [axis] = r.sweep.axis_order || Object.keys(r.sweep.axes);
    const ax = r.sweep.axes[axis];
    const [metric, mm] = Object.entries(r.sweep.metrics || {})[0] || [];
    if (!ax || !metric) return null;
    const vals = r.sweep.nodes.map((n) => n.metrics && n.metrics[metric]).filter(num);
    if (!vals.length) return null;
    const xs = r.sweep.nodes.map((n) => n.coords && n.coords[axis]).filter(num);
    const u = mm && mm.unit && mm.unit !== "1" ? mm.unit : "";
    const sv = { n: r.sweep.nodes.length, axis: term(axis), from: f(Math.min(...xs)), to: withUnit(f(Math.max(...xs)), ax.unit), metric: term(metric) };
    if (f(Math.min(...vals)) === f(Math.max(...vals))) return { big: t("js-meankind-campaign-sweep-flat", { one: "Over { $n } run of { $axis } from { $from } to { $to }, the { $metric } stays at { $value }.", other: "Over { $n } runs of { $axis } from { $from } to { $to }, the { $metric } stays at { $value }." }, { ...sv, value: withUnit(f(vals[0]), u) }), line: t("js-meankind-campaign-sweep-flat-line", "The chart shows every run.") };
    return { big: t("js-meankind-campaign-sweep-goes", { one: "Over { $n } run of { $axis } from { $from } to { $to }, the { $metric } goes from { $first } to { $last }.", other: "Over { $n } runs of { $axis } from { $from } to { $to }, the { $metric } goes from { $first } to { $last }." }, { ...sv, first: f(vals[0]), last: withUnit(f(vals[vals.length - 1]), u) }), line: t("js-meankind-campaign-sweep-goes-line", "The chart shows every run; it ranges from { $min } to { $max }.", { min: f(Math.min(...vals)), max: withUnit(f(Math.max(...vals)), u) }) };
  }
  return null;
}
function sweep(r) {
  if (!Array.isArray(r.points) || !r.points.length || !r.parameter) return null;
  const keys = Object.keys(r.points[0]).filter((k) => k !== "value" && num(r.points[0][k]));
  if (!keys.length) return null;
  const lo = r.points[0], hi = r.points[r.points.length - 1];
  const show = (v) => (/_s$/.test(r.metric || "") ? dur(v) : f(v));
  const metric = term(r.metric || t("js-meankind-sweep-result-word", "result"));
  const parts = keys.map((k) => (show(lo[k]) === show(hi[k]) ? t("js-meankind-sweep-part-flat", "the { $key } { $metric } stays at { $value }", { key: k, metric, value: show(lo[k]) }) : t("js-meankind-sweep-part-goes", "the { $key } { $metric } goes from { $first } to { $last }", { key: k, metric, first: show(lo[k]), last: show(hi[k]) })));
  const pv = { param: term(r.parameter), from: f(lo.value), to: f(hi.value) };
  return { big: t("js-meankind-sweep-big", { one: "Over { $n } value of { $param }, { $parts }.", other: "Over { $n } values of { $param }, { $parts }." }, { n: r.points.length, param: pv.param, parts: list(parts) }), line: r.scale === "log" ? t("js-meankind-sweep-line-log", "The { $param } runs from { $from } to { $to } on a log scale.", pv) : t("js-meankind-sweep-line", "The { $param } runs from { $from } to { $to }.", pv) };
}
function sweepNd(r) {
  if (!Array.isArray(r.points) || !Array.isArray(r.keys) || !Array.isArray(r.metrics)) return null;
  const vals = r.points.map((p) => p.metrics && p.metrics[0]).filter(num);
  if (!vals.length) return null;
  return { big: t("js-meankind-sweepnd-big", { one: "Over { $n } combination of { $keys }, the { $metric } ranges from { $min } to { $max }.", other: "Over { $n } combinations of { $keys }, the { $metric } ranges from { $min } to { $max }." }, { n: r.points.length, keys: list(r.keys.map(term)), metric: term(r.metrics[0]), min: f(Math.min(...vals)), max: f(Math.max(...vals)) }), line: t("js-meankind-sweepnd-line", "A grid of { $shape } engine runs.", { shape: by(r.shape || []) }) };
}

// ---------------------------------------------------------------- clocks, time and timing
function spoof(r) {
  const parts = ["quantum", "classical"].map((k) => [k, r[k]]).filter(([, x]) => x && num(x.detect_time_s));
  if (!parts.length) return null;
  const caught = parts.filter(([, x]) => !x.breaches_spec_undetected);
  const name = (x, k) => x.id || k;
  const missed = parts.filter(([, x]) => x.breaches_spec_undetected);
  const caughtBig = () => {
    const both = parts.length > 1, tv = { thr: f(r.threshold_ns) };
    if (num(r.threshold_ns)) return both ? t("js-meankind-spoof-caught-thr-both", "The spoof is caught before it breaks the { $thr } ns timing spec by both clocks.", tv) : t("js-meankind-spoof-caught-thr", "The spoof is caught before it breaks the { $thr } ns timing spec.", tv);
    return both ? t("js-meankind-spoof-caught-both", "The spoof is caught before it breaks the timing spec by both clocks.") : t("js-meankind-spoof-caught", "The spoof is caught before it breaks the timing spec.");
  };
  return {
    big: caught.length === parts.length ? caughtBig() : t("js-meankind-spoof-missed", { one: "The spoof breaks the timing spec before { $names } catches it.", other: "The spoof breaks the timing spec before { $names } catches it." }, { n: missed.length, names: list(missed.map(([k, x]) => t("js-meankind-the-name", "the { $name }", { name: name(x, k) }))) }),
    line: parts.map(([k, x]) => t("js-meankind-spoof-detects", "The { $name } detects it after { $dur }, at an offset of { $offset } ns.", { name: name(x, k), dur: dur(x.detect_time_s), offset: f(x.offset_at_detection_ns) })).join(" "),
    cards: parts.map(([k, x]) => ({ label: t("js-meankind-spoof-caught-label", "Caught after, { $name }", { name: name(x, k) }), value: dur(x.detect_time_s), unit: "", sub: t("js-meankind-spoof-offset", "offset { $offset } ns", { offset: f(x.offset_at_detection_ns) }), good: !x.breaches_spec_undetected, path: `${k}.detect_time_s` })),
  };
}
function pnt(r) {
  const q = r.quantum, c = r.classical;
  if (!q || !c || !q.fom || !c.fom || !num(q.fom.pnt_holdover_s) || !num(c.fom.pnt_holdover_s)) return null;
  const qn = (q.clock_spec && q.clock_spec.id) || "quantum", cn = (c.clock_spec && c.clock_spec.id) || "classical";
  const spec = list([num(r.timing_spec_ns) ? `${f(r.timing_spec_ns)} ns` : "", num(r.position_spec_m) ? `${f(r.position_spec_m)} m` : ""].filter(Boolean));
  const inside = () => (spec ? t("js-meankind-inside-spec", "inside { $spec }", { spec }) : "");
  return {
    big: t("js-meankind-pnt-big", "The quantum suite holds position and time for { $q }; the classical suite for { $c }.", { q: dur(q.fom.pnt_holdover_s), c: dur(c.fom.pnt_holdover_s) }),
    line: t("js-meankind-pnt-line", "Holdover is how long each suite (clock { $q }, against clock { $c }) stays inside { $spec } after satellite navigation is lost.", { q: qn, c: cn, spec: spec || t("js-meankind-its-spec", "its spec") }),
    cards: [
      { label: t("js-meankind-pnt-quantum-label", "Holdover, quantum suite"), value: dur(q.fom.pnt_holdover_s), unit: "", sub: inside(), good: q.fom.pnt_holdover_s >= c.fom.pnt_holdover_s, path: "quantum.fom.pnt_holdover_s" },
      { label: t("js-meankind-pnt-classical-label", "Holdover, classical suite"), value: dur(c.fom.pnt_holdover_s), unit: "", sub: inside(), path: "classical.fom.pnt_holdover_s" },
      num(q.fom.timing_p95_ns) ? { label: t("js-meankind-pnt-timing-quantum-label", "Timing error, 95 %, quantum"), value: f(q.fom.timing_p95_ns), unit: "ns", sub: t("js-meankind-whole-run", "over the whole run"), path: "quantum.fom.timing_p95_ns" } : null,
      num(c.fom.timing_p95_ns) ? { label: t("js-meankind-pnt-timing-classical-label", "Timing error, 95 %, classical"), value: f(c.fom.timing_p95_ns), unit: "ns", sub: t("js-meankind-whole-run", "over the whole run"), path: "classical.fom.timing_p95_ns" } : null,
    ].filter(Boolean),
  };
}
function timetransfer(r) {
  const q = r.quantum && r.quantum.fom, c = r.classical && r.classical.fom;
  if (!q || !c || !num(q.sync_rms_ps) || !num(c.sync_rms_ps)) return null;
  const qn = (r.quantum.spec && r.quantum.spec.id) || t("js-meankind-quantum-link", "quantum link"), cn = (r.classical.spec && r.classical.spec.id) || t("js-meankind-classical-link", "classical link");
  const tv = { mm: f(r.range_spec_mm), q: pc(q.within_spec_fraction), c: pc(c.within_spec_fraction) };
  return { big: t("js-meankind-timetransfer-big", "The { $q } keeps the two sites within { $qps } ps (root mean square); the { $c } within { $cps } ps.", { q: qn, qps: f(q.sync_rms_ps), c: cn, cps: f(c.sync_rms_ps) }), line: num(q.within_spec_fraction) && num(c.within_spec_fraction) ? (num(r.range_spec_mm) ? t("js-meankind-timetransfer-line-mm", "Inside the { $mm } mm ranging spec { $q } % of the time, against { $c } %.", tv) : t("js-meankind-timetransfer-line", "Inside the ranging spec { $q } % of the time, against { $c } %.", tv)) : "" };
}
function telecom(r) {
  const masks = Array.isArray(r.masks) ? r.masks : [];
  const checks = masks.flatMap((m) => m.checks || []);
  if (!checks.length) return null;
  const fail = checks.filter((c) => c.verdict === "FAIL").length;
  return { big: fail ? t("js-meankind-telecom-fail", { one: "The clock fails { $fail } of { $n } telecom time-error check.", other: "The clock fails { $fail } of { $n } telecom time-error checks." }, { fail, n: checks.length }) : t("js-meankind-telecom-pass", { one: "The clock passes all { $n } telecom time-error check.", other: "The clock passes all { $n } telecom time-error checks." }, { n: checks.length }), line: has(r, "holdover_envelope.min_margin_ns") ? t("js-meankind-telecom-line-margin", "Checks of MTIE (maximum time interval error), TDEV (time deviation) and the holdover envelope against the ITU-T masks named in each row. The smallest margin to the holdover envelope is { $margin } ns.", { margin: f(get(r, "holdover_envelope.min_margin_ns")) }) : t("js-meankind-telecom-line", "Checks of MTIE (maximum time interval error), TDEV (time deviation) and the holdover envelope against the ITU-T masks named in each row.") };
}
function slotTiming(r) {
  if (!has(r, "result.breach_after_sync_s")) return null;
  return { big: t("js-meankind-slot-big", "The clock leaves its slot guard { $dur } after the last satellite fix.", { dur: dur(get(r, "result.breach_after_sync_s")) }), line: has(r, "result.resync_interval_s", "result.fixes_per_day") ? t("js-meankind-slot-line", "So it needs a fix every { $interval }, about { $perDay } a day.", { interval: dur(get(r, "result.resync_interval_s")), perDay: f(get(r, "result.fixes_per_day")) }) : "" };
}
function lunarTimeBudget(r) {
  if (!num(r.crossover_tau_s)) return null;
  return { big: t("js-meankind-timebudget-big", "The { $clock }'s error and the reference frame's error cross at an averaging time of { $tau }.", { clock: words(r.clock || t("js-meankind-clock-word", "clock")), tau: dur(r.crossover_tau_s) }), line: num(r.crossover_x_s) ? t("js-meankind-timebudget-line", "At that crossover the time error is { $x } s.", { x: f(r.crossover_x_s) }) : "" };
}
function lunarTimeOffset(r) {
  if (!num(r.secular_rate_us_per_day)) return null;
  return { big: t("js-meankind-timeoffset-big", "A clock on the Moon runs { $rate } µs a day ahead of one on Earth.", { rate: f(r.secular_rate_us_per_day) }), line: num(r.band_low) && num(r.band_high) ? t("js-meankind-timeoffset-line", "The published band is { $low } to { $high } µs a day.", { low: f(r.band_low), high: f(r.band_high) }) : "" };
}
function quantumTT(r) {
  if (!num(r.quantum_chain_sigma_s) || !num(r.classical_chain_sigma_s)) return null;
  return { big: t("js-meankind-qtt-big", "Quantum time transfer holds { $q } ps (1-sigma) against { $c } ns for the classical chain.", { q: f(r.quantum_chain_sigma_s * 1e12), c: f(r.classical_chain_sigma_s * 1e9) }), line: num(r.security_pd) ? (num(r.monitor_pfa) ? t("js-meankind-qtt-line-pfa", "The security monitor detects { $pd } % of attacks at a { $pfa } false-alarm rate.", { pd: pc(r.security_pd), pfa: f(r.monitor_pfa) }) : t("js-meankind-qtt-line", "The security monitor detects { $pd } % of attacks.", { pd: pc(r.security_pd) })) : "" };
}

// ---------------------------------------------------------------- navigation without satellites
function mapMatch(r) {
  const free = r.free_inertial_drift_m, matched = [r.combined_m, r.map_matched_error_m, r.matched_error_m].find(num);
  if (!num(free) || !num(matched)) return null;
  return { big: t("js-meankind-mapmatch-big", "Map matching holds the position to { $matched } m, against { $free } m of drift on inertial alone.", { matched: f(matched), free: f(free) }), line: num(r.measurement_sigma_mgal) ? t("js-meankind-mapmatch-gravimeter", "The gravimeter measures to { $sigma } mGal.", { sigma: f(r.measurement_sigma_mgal) }) : num(r.measurement_sigma_m) ? t("js-meankind-mapmatch-altimeter", "The altimeter measures to { $sigma } m.", { sigma: f(r.measurement_sigma_m) }) : num(r.gravity_only_m) ? t("js-meankind-mapmatch-sources", "Gravity alone gives { $gravity } m, magnetic { $magnetic } m, terrain { $terrain } m.", { gravity: f(r.gravity_only_m), magnetic: f(r.magnetic_only_m), terrain: f(r.terrain_only_m) }) : "" };
}
function terrainSlam(r) {
  if (!num(r.matched_final_m) || !num(r.free_inertial_final_m)) return null;
  return { big: t("js-meankind-slam-big", "Terrain matching ends { $matched } m off, against { $free } m on inertial alone.", { matched: f(r.matched_final_m), free: f(r.free_inertial_final_m) }), line: num(r.waypoints) ? t("js-meankind-slam-line", { one: "Over { $n } waypoint, matched to a terrain map with { $sigma } m altimeter noise.", other: "Over { $n } waypoints, matched to a terrain map with { $sigma } m altimeter noise." }, { n: r.waypoints, sigma: f(r.measurement_sigma_m) }) : "" };
}
function insTrn(r) {
  const cr = Array.isArray(r.crossings) ? r.crossings.filter((c) => c && c.status === "reached" && num(c.coast_s) && num(c.threshold_m)) : [];
  if (!cr.length) return null;
  const dom = cr[0].dominant_contribution ? words(cr[0].dominant_contribution) : "";
  const passes = list(cr.slice(1).map((c) => t("js-meankind-instrn-pass", "{ $threshold } m after { $dur }", { threshold: f(c.threshold_m), dur: dur(c.coast_s) })));
  return { big: t("js-meankind-instrn-big", "Coasting on inertial alone, the position error passes { $threshold } m after { $dur }.", { threshold: f(cr[0].threshold_m), dur: dur(cr[0].coast_s) }), line: cr.length > 1 ? (dom ? t("js-meankind-instrn-line-dom", "It passes { $passes }; { $dominant } dominates.", { passes, dominant: dom }) : t("js-meankind-instrn-line", "It passes { $passes }.", { passes })) : (dom ? t("js-meankind-instrn-dom", "{ $dominant } dominates.", { dominant: dom.replace(/^./, (x) => x.toUpperCase()) }) : "") };
}
function hybridUkf(r) {
  const c = r.consistency;
  if (!c || typeof c.consistent !== "boolean" || !num(c.nis_mean)) return null;
  const uv = { mean: f(c.nis_mean), low: f(c.nis_chi2_lower_95), high: f(c.nis_chi2_upper_95), n: c.seeds };
  const uline = c.consistent
    ? (num(c.seeds) ? t("js-meankind-ukf-line-in-seeds", { one: "Its normalised innovation squared averages { $mean }, inside the 95 % band of { $low } to { $high }, over { $n } seed. This checks consistency, not accuracy.", other: "Its normalised innovation squared averages { $mean }, inside the 95 % band of { $low } to { $high }, over { $n } seeds. This checks consistency, not accuracy." }, uv) : t("js-meankind-ukf-line-in", "Its normalised innovation squared averages { $mean }, inside the 95 % band of { $low } to { $high }. This checks consistency, not accuracy.", uv))
    : (num(c.seeds) ? t("js-meankind-ukf-line-out-seeds", { one: "Its normalised innovation squared averages { $mean }, outside the 95 % band of { $low } to { $high }, over { $n } seed. This checks consistency, not accuracy.", other: "Its normalised innovation squared averages { $mean }, outside the 95 % band of { $low } to { $high }, over { $n } seeds. This checks consistency, not accuracy." }, uv) : t("js-meankind-ukf-line-out", "Its normalised innovation squared averages { $mean }, outside the 95 % band of { $low } to { $high }. This checks consistency, not accuracy.", uv));
  return { big: c.consistent ? t("js-meankind-ukf-big-yes", "Yes: the filter is self-consistent.") : t("js-meankind-ukf-big-no", "No: the filter is not self-consistent."), line: uline };
}
function quantumNav(r) {
  if (!num(r.quantum_pos_err_m) || !num(r.classical_pos_err_m)) return null;
  const nv = { q: f(r.quantum_pos_err_m), c: f(r.classical_pos_err_m), dur: num(r.outage_s) ? dur(r.outage_s) : "" };
  const hv = { threshold: f(r.threshold_m), q: dur(r.quantum_holdover_s), c: dur(r.classical_holdover_s) };
  return { big: num(r.outage_s) ? t("js-meankind-qnav-big-outage", "After { $dur } without satellites, the cold-atom navigator is { $q } m off; the navigation-grade one { $c } m.", nv) : t("js-meankind-qnav-big", "After the outage, the cold-atom navigator is { $q } m off; the navigation-grade one { $c } m.", nv), line: num(r.quantum_holdover_s) && num(r.classical_holdover_s) ? (num(r.threshold_m) ? t("js-meankind-qnav-line-threshold", "Inside { $threshold } m: { $q } against { $c }.", hv) : t("js-meankind-qnav-line", "Inside the budget: { $q } against { $c }.", hv)) : "" };
}
function hybridOpticalRf(r) {
  const x = r.cross_modality_raim;
  if (!x || !num(x.hpl_m) || !num(x.vpl_m)) return null;
  const cv = { stat: f(x.chi2_statistic), threshold: f(x.chi2_threshold) };
  return { big: t("js-meankind-opticalrf-big", "Combining optical and radio ranging gives protection levels of { $h } m horizontal and { $v } m vertical.", { h: f(x.hpl_m), v: f(x.vpl_m) }), line: num(x.chi2_statistic) && num(x.chi2_threshold) ? (x.chi2_statistic <= x.chi2_threshold ? t("js-meankind-opticalrf-line-ok", "The consistency test reads { $stat } against a threshold of { $threshold }: no fault is flagged.", cv) : t("js-meankind-opticalrf-line-fault", "The consistency test reads { $stat } against a threshold of { $threshold }: a fault is flagged.", cv)) : "" };
}
function conflict(r) {
  const rr = r.resilience_ratio;
  if (!rr || !num(rr.closed_form_independent)) return null;
  const mc = { ratio: f(rr.monte_carlo_independent), n: r.trials, low: f(get(r, "correlation_sweep.min_ratio_over_grid")) };
  const corr = has(r, "correlation_sweep.min_ratio_over_grid");
  const cline = !num(rr.monte_carlo_independent) ? "" : num(r.trials)
    ? (corr ? t("js-meankind-conflict-line-trials-corr", { one: "A Monte Carlo of { $n } trial gives { $ratio } times; with correlated threats it can fall to { $low } times.", other: "A Monte Carlo of { $n } trials gives { $ratio } times; with correlated threats it can fall to { $low } times." }, mc) : t("js-meankind-conflict-line-trials", { one: "A Monte Carlo of { $n } trial gives { $ratio } times.", other: "A Monte Carlo of { $n } trials gives { $ratio } times." }, mc))
    : (corr ? t("js-meankind-conflict-line-threats-corr", "A Monte Carlo of the threats gives { $ratio } times; with correlated threats it can fall to { $low } times.", mc) : t("js-meankind-conflict-line-threats", "A Monte Carlo of the threats gives { $ratio } times.", mc));
  return { big: t("js-meankind-conflict-big", "The layered architecture survives { $ratio } times better than a single layer.", { ratio: f(rr.closed_form_independent) }), line: cline };
}
function impairment(r) {
  if (!num(r.auc)) return null;
  const d = r.distribution_shift;
  return { big: t("js-meankind-impairment-big", "The detector separates impaired signals from clean ones with an area under the curve of { $auc } (1 is perfect).", { auc: f(r.auc) }), line: d && num(d.auc_out) ? t("js-meankind-impairment-line", "On cases unlike its training set it scores { $auc }.", { auc: f(d.auc_out) }) : "" };
}
function quantumAnomaly(r) {
  if (!num(r.quantum_auc) || !num(r.classical_auc)) return null;
  return { big: t("js-meankind-anomaly-big", "The quantum fault monitor scores { $q } against { $c } for the classical one (area under the curve, 1 is perfect).", { q: f(r.quantum_auc), c: f(r.classical_auc) }), line: num(r.quantum_min_detectable) && num(r.classical_min_detectable) ? t("js-meankind-anomaly-line", "The smallest detectable fault is { $q } against { $c }.", { q: f(r.quantum_min_detectable), c: f(r.classical_min_detectable) }) : "" };
}
function quantumTrade(r) {
  if (!has(r, "trade.inertial_benefit_x", "trade.timing_benefit_x")) return null;
  return { big: t("js-meankind-trade-big", "The quantum sensors are { $timing } times better at timing and { $inertial } times better at inertial navigation than the classical baseline.", { timing: f(get(r, "trade.timing_benefit_x")), inertial: f(get(r, "trade.inertial_benefit_x")) }), line: has(r, "resilience.coast_time_s") ? t("js-meankind-trade-line", "Without satellites the quantum suite coasts for { $dur }.", { dur: dur(get(r, "resilience.coast_time_s")) }) : "" };
}

// ---------------------------------------------------------------- integrity, spoofing, signals
function araimRef(r) {
  if (typeof r.acceptance_met !== "boolean" || !num(r.worst_acceptance_error_m)) return null;
  const av = { worst: f(r.worst_acceptance_error_m), tol: f(r.acceptance_tolerance_m), n: r.vectors_checked };
  return { big: r.acceptance_met ? t("js-meankind-araim-big-yes", "Yes: the engine's protection levels match the published reference.") : t("js-meankind-araim-big-no", "No: the engine's protection levels miss the published reference."), line: num(r.vectors_checked) ? t("js-meankind-araim-line-vectors", { one: "The worst difference is { $worst } m against the reference's own tolerance of { $tol } m, over { $n } reference vector.", other: "The worst difference is { $worst } m against the reference's own tolerance of { $tol } m, over { $n } reference vectors." }, av) : t("js-meankind-araim-line", "The worst difference is { $worst } m against the reference's own tolerance of { $tol } m.", av) };
}
function gnssSim(r) {
  if (!has(r, "fom.raim_availability")) return null;
  return { big: t("js-meankind-gnsssim-big", "Integrity monitoring protects the fix { $share } % of the time.", { share: pc(get(r, "fom.raim_availability")) }), line: has(r, "fom.mean_iono_m", "fom.mean_tropo_m") ? t("js-meankind-gnsssim-line", "The ionosphere adds { $iono } m and the troposphere { $tropo } m to each range on average.", { iono: f(get(r, "fom.mean_iono_m")), tropo: f(get(r, "fom.mean_tropo_m")) }) : "" };
}
function pvt(r) {
  if (!has(r, "fom.epochs_solved", "fom.epochs_total", "fom.rms_3d_m")) return null;
  return { big: t("js-meankind-pvt-big", { one: "A position is solved at { $solved } of { $n } epoch, to { $rms } m (3-D root mean square).", other: "A position is solved at { $solved } of { $n } epochs, to { $rms } m (3-D root mean square)." }, { solved: get(r, "fom.epochs_solved"), n: get(r, "fom.epochs_total"), rms: f(get(r, "fom.rms_3d_m")) }), line: has(r, "fom.mean_n_used") ? t("js-meankind-pvt-line", "From { $mean } satellites on average, read from real receiver measurements.", { mean: f(get(r, "fom.mean_n_used")) }) : "" };
}
const LAYER = {
  get raim() { return t("js-meankind-layer-raim", "RAIM (receiver autonomous integrity monitoring)"); },
  get agc() { return t("js-meankind-layer-agc", "AGC (automatic gain control)"); },
  get sqm() { return t("js-meankind-layer-sqm", "SQM (signal-quality monitoring)"); },
};
function spoofDetect(r) {
  const fu = r.decision && r.decision.fused;
  if (!fu || !fu.layers || typeof fu.alert !== "boolean") return null;
  const flags = Object.entries(fu.layers).filter(([, v]) => typeof v === "boolean");
  const on = flags.filter(([, v]) => v).map(([k]) => own(LAYER, k) || words(k));
  const sv = { on: on.length, n: flags.length, by: list(on), score: f(fu.score) };
  return { big: fu.alert ? (on.length ? t("js-meankind-spoofdetect-big-by", "Yes: the spoof is caught, by { $by }.", sv) : t("js-meankind-spoofdetect-big-yes", "Yes: the spoof is caught.")) : t("js-meankind-spoofdetect-big-no", "No: the fused monitor does not catch the spoof."), line: num(fu.score) ? t("js-meankind-spoofdetect-line-score", { one: "{ $on } of { $n } detection layer alarms; the fused score is { $score }.", other: "{ $on } of { $n } detection layers alarm; the fused score is { $score }." }, sv) : t("js-meankind-spoofdetect-line", { one: "{ $on } of { $n } detection layer alarms.", other: "{ $on } of { $n } detection layers alarm." }, sv) };
}
function trackingLoop(r) {
  const d = r.denial;
  if (!d || !num(d.capture_radius_threshold_km)) return null;
  return { big: t("js-meankind-tracking-big", "A spoofer can capture the receiver from up to { $km } km away.", { km: f(d.capture_radius_threshold_km) }), line: num(d.denial_js_loop_db) ? t("js-meankind-tracking-line", "Under the receiver's own loop dynamics, lock is lost at { $db } dB of jammer above the signal.", { db: f(d.denial_js_loop_db) }) : "" };
}
function leoSignal(r) {
  const s = Array.isArray(r.signals) ? r.signals.filter((x) => x && x.jammer_tolerance && num(x.jammer_tolerance.wideband_js_max_db)) : [];
  if (!s.length) return null;
  const best = s.reduce((a, b) => (b.jammer_tolerance.wideband_js_max_db > a.jammer_tolerance.wideband_js_max_db ? b : a));
  const sv = { n: s.length, best: best.name || best.id || t("js-meankind-the-best", "the best"), db: f(best.jammer_tolerance.wideband_js_max_db) };
  return { big: t("js-meankind-leosignal-big", { one: "Of { $n } signal design, { $best } tolerates the most jamming: { $db } dB above the signal.", other: "Of { $n } signal designs, { $best } tolerates the most jamming: { $db } dB above the signal." }, sv), line: typeof r.shape_checks_pass === "boolean" ? (r.shape_checks_pass ? t("js-meankind-leosignal-line-pass", "Spectrum shape checks pass.") : t("js-meankind-leosignal-line-fail", "Spectrum shape checks fail.")) : "" };
}

// ---------------------------------------------------------------- low Earth orbit
function leoPass(r) {
  const sats = Array.isArray(r.satellites) ? r.satellites.filter((s) => s && s.pass && num(s.pass.max_elevation_deg) && num(s.pass.duration_above_mask_s)) : [];
  if (!sats.length) return null;
  const s = sats[0];
  const cmp = r.comparison || {};
  const pv = { elev: f(s.pass.max_elevation_deg), dur: dur(s.pass.duration_above_mask_s), n: sats.length };
  return { big: sats.length > 1 ? t("js-meankind-leopass-big-many", "The satellites pass { $elev }° high and stay above the mask for { $dur } (the first of { $n }).", pv) : t("js-meankind-leopass-big-one", "The satellite passes { $elev }° high and stays above the mask for { $dur }.", pv), line: num(cmp.leo_peak_above_gnss_median_db) ? t("js-meankind-leopass-line", "At its peak the low-orbit signal arrives { $db } dB stronger than a typical satellite navigation signal.", { db: f(cmp.leo_peak_above_gnss_median_db) }) : "" };
}
function leoPvt(r) {
  if (r.doppler && num(r.doppler.horizontal_error_m)) return { big: t("js-meankind-leopvt-doppler-big", "Doppler positioning from low-orbit satellites lands { $m } m from the truth (horizontal).", { m: f(r.doppler.horizontal_error_m) }), line: num(r.doppler.n_sats) ? t("js-meankind-leopvt-doppler-line", { one: "{ $n } satellite used.", other: "{ $n } satellites used." }, { n: r.doppler.n_sats }) : "" };
  if (r.joint && r.joint.gnss && r.joint.fused && num(r.joint.gnss.rms_error_3d_m) && num(r.joint.fused.rms_error_3d_m)) return { big: t("js-meankind-leopvt-joint-big", "Adding the low-orbit layer brings the error from { $from } m to { $to } m (3-D root mean square).", { from: f(r.joint.gnss.rms_error_3d_m), to: f(r.joint.fused.rms_error_3d_m) }), line: num(r.joint.gnss.median_pdop) && num(r.joint.fused.median_pdop) ? t("js-meankind-leopvt-joint-line", "Geometry quality (PDOP) goes from { $from } to { $to }.", { from: f(r.joint.gnss.median_pdop), to: f(r.joint.fused.median_pdop) }) : "" };
  const rows = r.timing && Array.isArray(r.timing.rows) ? r.timing.rows.filter((x) => x && x.stats && num(x.stats.rms_s)) : [];
  if (rows.length) { const b = rows.reduce((a, c) => (c.stats.rms_s < a.stats.rms_s ? c : a)); return { big: t("js-meankind-leopvt-timing-big", "Low-orbit time transfer keeps the best clock within { $ns } ns of UTC (root mean square).", { ns: f(b.stats.rms_s * 1e9) }), line: t("js-meankind-leopvt-timing-line", { one: "{ $n } clock and signal case compared.", other: "{ $n } clock and signal cases compared." }, { n: rows.length }) }; }
  const pr = r.polar && Array.isArray(r.polar.rows) ? r.polar.rows.filter((x) => x && x.gnss && x.fused && num(x.gnss.median_pdop) && num(x.fused.median_pdop)) : [];
  if (pr.length) { const p = pr[pr.length - 1]; return { big: t("js-meankind-leopvt-polar-big", "Near the pole, the low-orbit layer improves the geometry quality (PDOP) from { $from } to { $to }.", { from: f(p.gnss.median_pdop), to: f(p.fused.median_pdop) }), line: t("js-meankind-leopvt-polar-line", { one: "Across { $n } latitude.", other: "Across { $n } latitudes." }, { n: pr.length }) }; }
  return null;
}
function leoPpp(r) {
  const cs = Array.isArray(r.cases) ? r.cases.filter((c) => c && num(c.median_convergence_min)) : [];
  if (cs.length < 2) return null;
  const pv = { n: r.runs_per_case, m: f(r.criterion_horizontal_m) };
  return { big: t("js-meankind-leoppp-big", "Precise positioning converges in { $best } min with the largest low-orbit layer, against { $base } min with satellite navigation only.", { best: f(cs[cs.length - 1].median_convergence_min), base: f(cs[0].median_convergence_min) }), line: num(r.runs_per_case) ? t("js-meankind-leoppp-line-runs", { one: "Median of { $n } run per case, to { $m } m.", other: "Median of { $n } runs per case, to { $m } m." }, pv) : t("js-meankind-leoppp-line", "Median of the runs per case, to { $m } m.", pv) };
}
function leoNavmsg(r) {
  if (r.encode_decode && num(r.encode_decode.frame_bytes)) return { big: t("js-meankind-navmsg-big", { one: "One navigation message fits in { $n } byte.", other: "One navigation message fits in { $n } bytes." }, { n: r.encode_decode.frame_bytes }), line: num(r.encode_decode.sisre_quantised_rms_m) ? t("js-meankind-navmsg-line", "Rounding to the message format costs { $mm } mm of range error.", { mm: f(r.encode_decode.sisre_quantised_rms_m * 1000) }) : "" };
  const rows = (r.fit_interval_trade && r.fit_interval_trade.rows) || (r.model_comparison && r.model_comparison.rows) || [];
  const v = rows.map((x) => (x && x.sisre_rms_m) ?? (x && x.stats && x.stats.sisre_rms_m)).filter(num);
  if (v.length) return { big: t("js-meankind-navmsg-cases-big", { one: "Across { $n } case, the range error from the broadcast orbit is { $min } to { $max } mm.", other: "Across { $n } cases, the range error from the broadcast orbit is { $min } to { $max } mm." }, { n: v.length, min: f(Math.min(...v) * 1000), max: f(Math.max(...v) * 1000) }), line: t("js-meankind-navmsg-cases-line", "Signal-in-space range error, root mean square.") };
  if (r.midpass_update && num(r.midpass_update.max_range_jump_m)) return { big: t("js-meankind-navmsg-midpass-big", "Updating the message mid-pass makes the range jump by at most { $mm } mm.", { mm: f(r.midpass_update.max_range_jump_m * 1000) }), line: num(r.midpass_update.threshold_m) ? t("js-meankind-navmsg-midpass-line", "The limit is { $mm } mm.", { mm: f(r.midpass_update.threshold_m * 1000) }) : "" };
  return null;
}
function leoChain(r) {
  const g = get(r, "fusion.gnss.rms_error_3d_m"), fu = get(r, "fusion.fused.rms_error_3d_m");
  if (!num(g) || !num(fu)) return null;
  return { big: t("js-meankind-leochain-big", "End to end, the low-orbit system brings the position error from { $from } m to { $to } m.", { from: f(g), to: f(fu) }), line: has(r, "pass.peak_tracked_cn0_dbhz") ? t("js-meankind-leochain-line", "Its signal is tracked at up to { $cn0 } dB-Hz.", { cn0: f(get(r, "pass.peak_tracked_cn0_dbhz")) }) : "" };
}
function ntn(r) {
  const s = Array.isArray(r.signals) ? r.signals.filter((x) => x && num(x.toa_rms_error_3d_m)) : [];
  if (!s.length) return null;
  const b = s.reduce((a, c) => (c.toa_rms_error_3d_m < a.toa_rms_error_3d_m ? c : a));
  return { big: t("js-meankind-ntn-big", "5G positioning from orbit reaches { $m } m with { $signal }.", { m: f(b.toa_rms_error_3d_m), signal: b.name || t("js-meankind-the-widest-signal", "the widest signal") }), line: has(r, "doppler_pass.horizontal_error_m") ? t("js-meankind-ntn-line", "Doppler over one pass gives { $m } m.", { m: f(get(r, "doppler_pass.horizontal_error_m")) }) : "" };
}

// ---------------------------------------------------------------- space operations
function attitude(r) {
  if (!num(r.total_pointing_error_arcsec)) return null;
  const av = { total: f(r.total_pointing_error_arcsec), from: r.dominant_contributor ? words(r.dominant_contributor) : "" };
  return { big: r.dominant_contributor ? t("js-meankind-attitude-big-from", "The pointing error totals { $total } arcseconds, mostly from { $from }.", av) : t("js-meankind-attitude-big", "The pointing error totals { $total } arcseconds.", av), line: num(r.gravity_gradient_torque_max_nm) ? t("js-meankind-attitude-line", "The largest gravity-gradient torque is { $torque } N·m.", { torque: f(r.gravity_gradient_torque_max_nm) }) : "" };
}
function aperture(r) {
  if (!num(r.navigation_duty) || !num(r.communications_duty)) return null;
  const av = { nav: pc(r.navigation_duty), comms: pc(r.communications_duty), idle: pc(r.idle_duty) };
  const lv = { n: r.apertures, policy: r.arbitration_policy ? words(r.arbitration_policy) : "", dur: dur(r.contention_s) };
  const ap = num(r.apertures), po = !!r.arbitration_policy, ct = num(r.contention_s);
  let line;
  if (ap) {
    line = po && ct ? t("js-meankind-aperture-line-all", { one: "{ $n } aperture under the { $policy } rule, with { $dur } of contention.", other: "{ $n } apertures under the { $policy } rule, with { $dur } of contention." }, lv)
      : po ? t("js-meankind-aperture-line-policy", { one: "{ $n } aperture under the { $policy } rule.", other: "{ $n } apertures under the { $policy } rule." }, lv)
      : ct ? t("js-meankind-aperture-line-contention", { one: "{ $n } aperture, with { $dur } of contention.", other: "{ $n } apertures, with { $dur } of contention." }, lv)
      : t("js-meankind-aperture-line-count", { one: "{ $n } aperture.", other: "{ $n } apertures." }, lv);
  } else {
    line = po && ct ? t("js-meankind-aperture-line-nocount-all", "The apertures under the { $policy } rule, with { $dur } of contention.", lv)
      : po ? t("js-meankind-aperture-line-nocount-policy", "The apertures under the { $policy } rule.", lv)
      : ct ? t("js-meankind-aperture-line-nocount-contention", "The apertures, with { $dur } of contention.", lv)
      : t("js-meankind-aperture-line-nocount", "The apertures.");
  }
  return { big: num(r.idle_duty) ? t("js-meankind-aperture-big-idle", "Navigation uses { $nav } % of the antenna time and communications { $comms } %; { $idle } % is idle.", av) : t("js-meankind-aperture-big", "Navigation uses { $nav } % of the antenna time and communications { $comms } %.", av), line };
}
function eo(r) {
  if (!num(r.swath_width_km) || !num(r.nadir_gsd_m)) return null;
  const gv = { km: f(r.equatorial_ground_track_spacing_km) };
  return { big: t("js-meankind-eo-big", "The camera sees a { $swath } km swath at { $gsd } m resolution.", { swath: f(r.swath_width_km), gsd: f(r.nadir_gsd_m) }), line: typeof r.contiguous_equatorial_coverage === "boolean" ? (r.contiguous_equatorial_coverage ? t("js-meankind-eo-line-contiguous", "Ground tracks are { $km } km apart at the equator, so coverage is contiguous.", gv) : t("js-meankind-eo-line-gapped", "Ground tracks are { $km } km apart at the equator, so coverage is gapped.", gv)) : "" };
}
function launch(r) {
  if (!num(r.daily_opportunities)) return null;
  return { big: t("js-meankind-launch-big", { one: "{ $n } launch opportunity a day reaches a { $incl }° orbit from latitude { $lat }°.", other: "{ $n } launch opportunities a day reach a { $incl }° orbit from latitude { $lat }°." }, { n: r.daily_opportunities, incl: f(r.target_inclination_deg), lat: f(r.site_lat_deg) }), line: num(r.site_rotation_speed_m_s) ? t("js-meankind-launch-line", "The Earth's rotation gives { $speed } m/s for free.", { speed: f(r.site_rotation_speed_m_s) }) : "" };
}
function linkBudget(r) {
  if (typeof r.closes !== "boolean" || !num(r.margin_db)) return null;
  const lv = { band: words(r.band || ""), km: f(r.range_km), rate: f(r.data_rate_bps) };
  const rate = num(r.data_rate_bps);
  const line = !num(r.range_km) ? "" : words(r.band || "")
    ? (rate ? t("js-meankind-link-line-band-rate", "{ $band }-band over { $km } km at { $rate } bit/s.", lv) : t("js-meankind-link-line-band", "{ $band }-band over { $km } km.", lv))
    : (rate ? t("js-meankind-link-line-rate", "Over { $km } km at { $rate } bit/s.", lv) : t("js-meankind-link-line", "Over { $km } km.", lv));
  return { big: r.closes ? t("js-meankind-link-big-closes", "The link closes with { $margin } dB to spare.", { margin: f(r.margin_db) }) : t("js-meankind-link-big-open", "The link does not close: { $margin } dB of margin.", { margin: f(r.margin_db) }), line };
}
function passes(r) {
  if (!num(r.pass_count) || !num(r.total_access_s)) return null;
  const pv = { n: r.pass_count, hours: f(r.duration_hours), dur: dur(r.total_access_s) };
  return { big: num(r.duration_hours) && r.duration_hours !== 24 ? t("js-meankind-passes-big-window", { one: "{ $n } pass an { $hours }-hour window, { $dur } of contact in all.", other: "{ $n } passes an { $hours }-hour window, { $dur } of contact in all." }, pv) : t("js-meankind-passes-big-day", { one: "{ $n } pass a day, { $dur } of contact in all.", other: "{ $n } passes a day, { $dur } of contact in all." }, pv), line: num(r.best_max_elevation_deg) ? t("js-meankind-passes-line", "The best pass rises to { $deg }°.", { deg: f(r.best_max_elevation_deg) }) : "" };
}
function reentry(r) {
  if (!num(r.peak_deceleration_g)) return null;
  return { big: t("js-meankind-reentry-big", "Peak deceleration is { $g } g, at { $km } km.", { g: f(r.peak_deceleration_g), km: f(r.altitude_at_peak_g_m / 1000) }), line: num(r.velocity_at_peak_g_m_s) ? t("js-meankind-reentry-line", "The vehicle is then at { $speed } m/s.", { speed: f(r.velocity_at_peak_g_m_s) }) : "" };
}
function ephemeris(r) {
  if (!num(r.alt_min_km) || !num(r.alt_max_km)) return null;
  const ev = { deg: f(r.max_elevation_deg), khz: f(r.peak_doppler_hz / 1000) };
  return { big: t("js-meankind-ephemeris-big", "The satellite flies between { $min } and { $max } km, up to { $lat }° of latitude.", { min: f(r.alt_min_km), max: f(r.alt_max_km), lat: f(Math.max(Math.abs(r.lat_min_deg), Math.abs(r.lat_max_deg))) }), line: num(r.max_elevation_deg) ? (num(r.peak_doppler_hz) ? t("js-meankind-ephemeris-line-doppler", "Seen from the station it rises to { $deg }°, with up to { $khz } kHz of Doppler.", ev) : t("js-meankind-ephemeris-line", "Seen from the station it rises to { $deg }°.", ev)) : "" };
}
function spaceWeather(r) {
  if (!num(r.exospheric_temperature_k)) return null;
  const tv = { k: f(r.exospheric_temperature_k), ref: f(r.reference_exospheric_temperature_k) };
  return { big: num(r.reference_exospheric_temperature_k) ? t("js-meankind-weather-big-ref", "The upper atmosphere heats to { $k } K, against { $ref } K for the reference.", tv) : t("js-meankind-weather-big", "The upper atmosphere heats to { $k } K.", tv), line: num(r.ap) ? t("js-meankind-weather-line", "Geomagnetic activity index ap is { $ap }.", { ap: f(r.ap) }) : "" };
}
function spacePacket(r) {
  if (typeof r.round_trip_exact !== "boolean") return null;
  return { big: r.round_trip_exact ? t("js-meankind-packet-big-yes", "Yes: the packet stream decodes back bit for bit.") : t("js-meankind-packet-big-no", "No: the decoded stream differs from what was sent."), line: num(r.packet_count) ? t("js-meankind-packet-line", { one: "{ $n } packet, { $octets } octets in all.", other: "{ $n } packets, { $octets } octets in all." }, { n: r.packet_count, octets: f(r.total_stream_octets) }) : "" };
}
function oem(r) {
  if (!num(r.round_trip_max_pos_error_km)) return null;
  return { big: t("js-meankind-oem-big", "The ephemeris file round-trips with at most { $mm } mm of position error.", { mm: f(r.round_trip_max_pos_error_km * 1e6) }), line: num(r.n_states_total) ? t("js-meankind-oem-line", { one: "{ $states } states in { $n } segment.", other: "{ $states } states in { $n } segments." }, { states: r.n_states_total, n: r.n_segments }) : "" };
}
function solar(r) {
  const links = Array.isArray(r.links) ? r.links.filter((l) => l && num(l.one_way_light_time_s)) : [];
  if (!num(r.n_bodies)) return null;
  const sv = { n: r.n_bodies, dur: links.length ? dur(links[0].one_way_light_time_s) : "", from: links.length ? links[0].from || t("js-meankind-the-first", "the first") : "", to: links.length ? links[0].to || t("js-meankind-the-second", "the second") : "" };
  return { big: links.length ? t("js-meankind-solar-big-link", { one: "{ $n } body placed at one epoch; light takes { $dur } from { $from } to { $to }.", other: "{ $n } bodies placed at one epoch; light takes { $dur } from { $from } to { $to }." }, sv) : t("js-meankind-solar-big", { one: "{ $n } body placed at one epoch.", other: "{ $n } bodies placed at one epoch." }, sv), line: links.length > 1 ? t("js-meankind-solar-line", "{ $n } links are timed in all.", { n: links.length }) : "" };
}
function realtimeEop(r) {
  if (!num(r.lever_arm_m_per_s) || !num(r.latency_s)) return null;
  return { big: t("js-meankind-eop-big", "At the Moon's distance the Earth's rotation sweeps { $m } m every second, so the age of Earth-orientation data ({ $dur } here) matters.", { m: f(r.lever_arm_m_per_s), dur: dur(r.latency_s) }), line: r.eop_source ? t("js-meankind-eop-line", "Input: { $source }.", { source: r.eop_source }) : "" };
}

// ---------------------------------------------------------------- Moon, Mars and deep space
function bodyPnt(r) {
  const fo = r.fom;
  if (!fo || !num(fo.availability_relays)) return null;
  const body = (r.body && (r.body.name || r.body)) || t("js-meankind-the-body", "the body");
  const bv = { share: pc(fo.availability_relays), body, earth: pc(fo.availability_with_earth) };
  return { big: num(fo.availability_with_earth) ? t("js-meankind-bodypnt-big-earth", "Relays alone give a fix { $share } % of the time around { $body }; { $earth } % with links to Earth.", bv) : t("js-meankind-bodypnt-big", "Relays alone give a fix { $share } % of the time around { $body }.", bv), line: num(fo.mean_relays_visible) ? t("js-meankind-bodypnt-line", "{ $mean } relays are in view on average.", { mean: f(fo.mean_relays_visible) }) : "" };
}
function marsPnt(r) {
  const fo = r.fom;
  if (!fo || !num(fo.converged_pos_rms_m)) return null;
  return { big: t("js-meankind-marspnt-big", "The { $user } navigator settles to { $m } m (root mean square).", { user: words(r.user || t("js-meankind-user-word", "user")), m: f(fo.converged_pos_rms_m) }), line: num(fo.mean_relays_in_view) ? t("js-meankind-marspnt-line", { one: "{ $mean } relays in view on average, over { $n } epoch.", other: "{ $mean } relays in view on average, over { $n } epochs." }, { mean: f(fo.mean_relays_in_view), n: fo.epochs }) : "" };
}
function moonlight(r) {
  if (!num(r.coverage_pct)) return null;
  return { big: t("js-meankind-moonlight-big", "The service covers { $share } % of the places and times checked.", { share: p1(r.coverage_pct) }), line: num(r.min_sats) ? t("js-meankind-moonlight-line", { one: "Between { $min } and { $n } satellite are in view; geometry quality (PDOP) ranges from { $pmin } to { $pmax }.", other: "Between { $min } and { $n } satellites are in view; geometry quality (PDOP) ranges from { $pmin } to { $pmax }." }, { min: r.min_sats, n: r.max_sats, pmin: f(r.pdop_min), pmax: f(r.pdop_max) }) : "" };
}
const p1 = (x) => (Math.abs(x - Math.round(x)) < 0.05 ? String(Math.round(x)) : x.toFixed(1));
function earthGnssLunar(r) {
  if (!num(r.n_geometrically_visible) || !num(r.n_trackable)) return null;
  return { big: t("js-meankind-earthgnss-big", { one: "At the Moon's distance, { $visible } of { $n } satellite are in view but { $trackable } can be tracked.", other: "At the Moon's distance, { $visible } of { $n } satellites are in view but { $trackable } can be tracked." }, { visible: r.n_geometrically_visible, n: r.n_satellites, trackable: r.n_trackable }), line: has(r, "sweep.best_cn0_dbhz") ? t("js-meankind-earthgnss-line", "The best signal is { $best } dB-Hz against a tracking threshold of { $threshold } dB-Hz.", { best: f(get(r, "sweep.best_cn0_dbhz")), threshold: f(r.tracking_threshold_dbhz) }) : "" };
}
function lunarBeacon(r) {
  if (!num(r.beacon_pdop_improvement)) return null;
  return { big: t("js-meankind-beacon-big", "Surface beacons improve the geometry quality (PDOP) { $x } times.", { x: f(r.beacon_pdop_improvement) }), line: num(r.constellation_pdop_improvement) ? t("js-meankind-beacon-line", "Adding satellites instead improves it { $x } times.", { x: f(r.constellation_pdop_improvement) }) : "" };
}
function lunarDpnt(r) {
  if (!num(r.user_error_uncorrected_m) || !num(r.user_error_corrected_m)) return null;
  return { big: t("js-meankind-dpnt-big", "Differential corrections bring the error from { $from } m to { $to } m.", { from: f(r.user_error_uncorrected_m), to: f(r.user_error_corrected_m) }), line: num(r.baseline_km) ? t("js-meankind-dpnt-line", "With a reference station { $km } km away.", { km: f(r.baseline_km) }) : "" };
}
function lunarStation(r) {
  const g = r.region;
  if (!g || !num(g.corrected_p_3d_m) || !num(g.uncorrected_p_3d_m)) return null;
  const n = num(r.percentile) ? `${f(r.percentile)} %` : t("js-meankind-percentile-word", "percentile");
  return { big: t("js-meankind-station-big", "Over the south-polar region, a lunar reference station's corrections bring the { $percentile } error from { $from } m to { $to } m (modelled).", { percentile: n, from: f(g.uncorrected_p_3d_m), to: f(g.corrected_p_3d_m) }), line: num(g.coverage_fraction) ? t("js-meankind-station-line", "Within the accuracy threshold for { $share } % of the epochs; not a statement about any real system.", { share: f(g.coverage_fraction * 100) }) : "" };
}
function lunarAttack(r) {
  if (typeof r.spoof_captured !== "boolean") return null;
  return { big: r.spoof_captured ? t("js-meankind-attack-big-yes", "A spoofer on the surface can capture a lunar receiver.") : t("js-meankind-attack-big-no", "A spoofer on the surface cannot capture a lunar receiver."), line: num(r.surface_transmitter_reach_m) ? t("js-meankind-attack-line", "A surface transmitter reaches { $km } km before the horizon blocks it.", { km: f(r.surface_transmitter_reach_m / 1000) }) : "" };
}
function lunarJointOd(r) {
  if (!num(r.station_observability_improvement_factor)) return null;
  return { big: t("js-meankind-jointod-big", "Adding an Earth-based interferometry delay sharpens the station position { $x } times.", { x: f(r.station_observability_improvement_factor) }), line: has(r, "with_vlbi.station_pos_err_m") ? t("js-meankind-jointod-line", "The station is then known to { $m } m.", { m: f(get(r, "with_vlbi.station_pos_err_m")) }) : "" };
}
function lunarFrameReal(r) {
  if (!num(r.rms_residual_m)) return null;
  const fv = { m: f(r.rms_residual_m) };
  return { big: typeof r.converged === "boolean" && !r.converged ? t("js-meankind-framereal-big-open", "The lunar frame is realised with { $m } m of residual error, though the fit did not converge.", fv) : t("js-meankind-framereal-big", "The lunar frame is realised with { $m } m of residual error.", fv), line: num(r.trans_err_norm_m) ? t("js-meankind-framereal-line", "Translation error { $trans } m, scale error { $scale } parts per billion.", { trans: f(r.trans_err_norm_m), scale: f(r.scale_err_ppb) }) : "" };
}
function lunarInterop(r) {
  if (typeof r.oem_roundtrip_ok !== "boolean") return null;
  return { big: r.oem_roundtrip_ok ? t("js-meankind-interop-big-yes", "Yes: the lunar ephemeris file round-trips intact.") : t("js-meankind-interop-big-no", "No: the lunar ephemeris file does not round-trip."), line: t("js-meankind-interop-line", "{ $n } states in the { $frame } frame, { $time } time.", { n: r.n_states, frame: r.frame || "", time: r.time_system || "" }).replace(/ {2,}/g, " ") };
}
function lunarVlbi(r) {
  if (!num(r.baseline_km) || !num(r.delay_s)) return null;
  return { big: t("js-meankind-vlbi-big", "Over a { $km } km baseline, the beacon's signal arrives { $ms } ms apart at the two stations.", { km: f(r.baseline_km), ms: f(Math.abs(r.delay_s) * 1000) }), line: num(r.near_field_correction_us) ? t("js-meankind-vlbi-line", "The near-field correction is { $us } µs.", { us: f(r.near_field_correction_us) }) : "" };
}
function lunarVlbiFim(r) {
  const s = get(r, "headline.computed_per_coordinate_sigma_m");
  if (!num(s)) return null;
  return { big: t("js-meankind-vlbifim-big", "Each station coordinate is known to { $m } m from this observing schedule.", { m: f(s) }), line: has(r, "headline.equipartition_per_coordinate_sigma_m") ? t("js-meankind-vlbifim-line", "The simple equal-share estimate would claim { $m } m.", { m: f(get(r, "headline.equipartition_per_coordinate_sigma_m")) }) : "" };
}
function lunarFrameCampaign(r) {
  const h = r.helmert;
  if (!h || !num(h.defect)) return null;
  return { big: h.defect === 0 ? t("js-meankind-framecampaign-big-yes", "Yes: the campaign fixes the lunar frame datum fully.") : t("js-meankind-framecampaign-big-open", { one: "The campaign leaves { $n } datum direction undetermined.", other: "The campaign leaves { $n } datum directions undetermined." }, { n: h.defect }), line: num(h.condition_number) ? t("js-meankind-framecampaign-line", "Condition number { $n }.", { n: f(h.condition_number) }) : "" };
}
function lunarLlr(r) {
  const s = get(r, "datum_accuracy.translation_sigma_norm_m");
  if (!num(s)) return null;
  return { big: t("js-meankind-llr-big", "Real laser ranging pins the lunar frame to { $mm } mm.", { mm: f(s * 1000) }), line: has(r, "datum_accuracy.scale_sigma_ppb") ? t("js-meankind-llr-line", "Scale to { $ppb } parts per billion.", { ppb: f(get(r, "datum_accuracy.scale_sigma_ppb")) }) : "" };
}
function cislunarObs(r) {
  const rows = Array.isArray(r.rank_vs_arc) ? r.rank_vs_arc.filter((x) => x && num(x.rank) && num(x.arc_hours)) : [];
  if (!rows.length || !num(r.state_dim)) return null;
  const full = rows.find((x) => x.rank >= r.state_dim);
  return { big: full ? t("js-meankind-obs-big-full", "The orbit becomes fully observable after { $dur } of tracking.", { dur: dur(full.arc_hours * 3600) }) : t("js-meankind-obs-big-partly", "The orbit stays partly observable over the { $h } h arc.", { h: f(r.arc_hours) }), line: t("js-meankind-obs-line", "Rank { $rank } of { $dim } at the end of the arc.", { rank: rows[rows.length - 1].rank, dim: r.state_dim }) };
}
function cislunarArc(r) {
  const h = get(r, "claim_under_test.estimator_estimability_boundary_hours");
  if (!num(h) || !num(r.arc_hours)) return null;
  return { big: t("js-meankind-arc-big", "The estimator recovers the orbit once it has { $dur } of the { $h } h arc.", { dur: dur(h * 3600), h: f(r.arc_hours) }), line: num(r.n_spacecraft) ? t("js-meankind-arc-line", "{ $n } spacecraft, { $observable } measurements.", { n: r.n_spacecraft, observable: words(r.observable || "") }) : "" };
}

// ---------------------------------------------------------------- 0.36 kinds
function acmLink(r) {
  if (!has(r, "acm_gain", "acm_volume_mbit", "ccm_volume_mbit", "pass_count")) return null;
  const n = r.pass_count;
  return { big: t("js-meankind-acm-big", { one: "Adaptive coding moves { $gain } times the data of the best fixed mode: { $acm } Gbit against { $ccm } Gbit over { $n } pass.", other: "Adaptive coding moves { $gain } times the data of the best fixed mode: { $acm } Gbit against { $ccm } Gbit over { $n } passes." }, { gain: f(r.acm_gain, 2), acm: f(r.acm_volume_mbit / 1000), ccm: f(r.ccm_volume_mbit / 1000), n }), line: t("js-meankind-acm-line", "Fixed mode { $mode }; { $dur } of outage.", { mode: r.ccm_modcod || "—", dur: dur(num(r.outage_s) ? r.outage_s : 0) }) };
}
function aocs(r) {
  if (!has(r, "max_pointing_error_deg", "pointing_threshold_deg", "final_pointing_error_deg")) return null;
  const av = { slew: f(r.max_pointing_error_deg), threshold: f(r.pointing_threshold_deg), dur: dur(r.settle_time_s) };
  const big = num(r.settle_time_s) ? t("js-meankind-aocs-big-settles", "The { $slew } degree slew settles below { $threshold } degrees after { $dur }.", av) : t("js-meankind-aocs-big-open", "The { $slew } degree slew does not settle below { $threshold } degrees.", av);
  const wheel = Array.isArray(r.wheels) && r.wheels[0] && num(r.wheels[0].peak_torque_nm), est = r.estimator && num(r.estimator.rms_attitude_error_arcsec);
  const lv = { final: f(r.final_pointing_error_deg), torque: wheel ? f(r.wheels[0].peak_torque_nm) : "", arcsec: est ? f(r.estimator.rms_attitude_error_arcsec) : "" };
  const line = wheel && est ? t("js-meankind-aocs-line-wheel-filter", "Final pointing error { $final } degrees. Peak wheel torque { $torque } N m. An attitude filter in the loop is off by { $arcsec } arcsec RMS.", lv)
    : wheel ? t("js-meankind-aocs-line-wheel", "Final pointing error { $final } degrees. Peak wheel torque { $torque } N m.", lv)
    : est ? t("js-meankind-aocs-line-filter", "Final pointing error { $final } degrees. An attitude filter in the loop is off by { $arcsec } arcsec RMS.", lv)
    : t("js-meankind-aocs-line", "Final pointing error { $final } degrees.", lv);
  return { big, line };
}
function ascentLosses(r) {
  if (!has(r, "ideal_dv_m_s", "losses_m_s.total", "end.altitude_m", "end.speed_m_s", "max_q_pa")) return null;
  return { big: t("js-meankind-ascent-big", "Gravity, drag, steering and back-pressure take { $loss } m/s of the { $ideal } m/s ideal speed gain.", { loss: f(r.losses_m_s.total, 4), ideal: f(r.ideal_dv_m_s, 4) }), line: t("js-meankind-ascent-line", "Burnout at { $km } km and { $speed } m/s; peak dynamic pressure { $kpa } kPa.", { km: f(r.end.altitude_m / 1000), speed: f(r.end.speed_m_s, 4), kpa: f(r.max_q_pa / 1000) }) };
}
function contactSchedule(r) {
  const g = r.plans && r.plans.greedy;
  if (!g || !num(g.delivered_mbit) || !num(g.contacts) || !num(r.candidate_contacts) || !Array.isArray(r.satellites) || !Array.isArray(r.stations)) return null;
  const backlog = r.satellites.reduce((a, x) => a + (num(x.backlog_mbit) ? x.backlog_mbit : 0), 0);
  const cv = { kept: g.contacts, n: r.candidate_contacts, gbit: f(g.delivered_mbit / 1000), waiting: f(backlog / 1000) };
  return { big: backlog > 0 ? t("js-meankind-contacts-big-waiting", { one: "The plan keeps { $kept } of { $n } candidate contact and delivers { $gbit } Gbit of the { $waiting } Gbit waiting.", other: "The plan keeps { $kept } of { $n } candidate contacts and delivers { $gbit } Gbit of the { $waiting } Gbit waiting." }, cv) : t("js-meankind-contacts-big", { one: "The plan keeps { $kept } of { $n } candidate contact and delivers { $gbit } Gbit.", other: "The plan keeps { $kept } of { $n } candidate contacts and delivers { $gbit } Gbit." }, cv), line: t("js-meankind-contacts-line", "{ $sats } satellites and { $stations } stations over { $hours } h.", { sats: r.satellites.length, stations: r.stations.length, hours: f(r.duration_hours) }) };
}
function entryHeating(r) {
  if (!has(r, "peak_deceleration.g", "peak_deceleration.altitude_m", "peak_heat_flux.w_cm2", "relative_entry.speed_m_s", "relative_entry.flight_path_angle_deg")) return null;
  return { big: t("js-meankind-entry-big", "Peak deceleration is { $g } g at { $km } km, with a peak heat flux of { $flux } W/cm².", { g: f(r.peak_deceleration.g), km: f(r.peak_deceleration.altitude_m / 1000), flux: f(r.peak_heat_flux.w_cm2) }), line: t("js-meankind-entry-line", "Entering at { $speed } m/s, { $angle } degrees below the horizon.", { speed: f(r.relative_entry.speed_m_s, 4), angle: f(r.relative_entry.flight_path_angle_deg) }) };
}
function eoRadiometry(r) {
  if (!has(r, "niirs_giqe4", "gsd_m", "snr", "mtf_nyquist.system")) return null;
  return { big: t("js-meankind-radiometry-big", "The camera reaches NIIRS { $niirs } at { $gsd } m ground sample distance, with a signal-to-noise ratio of { $snr }.", { niirs: f(r.niirs_giqe4), gsd: f(r.gsd_m), snr: f(r.snr) }), line: t("js-meankind-radiometry-line", "System MTF at Nyquist { $mtf }.", { mtf: f(r.mtf_nyquist.system) }) };
}
function timeTransferBudget(r) {
  if (!has(r, "terms_ns.offset", "combined_uncertainty_ns")) return null;
  return { big: t("js-meankind-ttbudget-big", "The two-way offset is { $offset } ns, with a combined uncertainty of { $uncertainty } ns.", { offset: f(r.terms_ns.offset), uncertainty: f(r.combined_uncertainty_ns) }), line: has(r, "terms_ns.sagnac", "terms_ns.ionosphere") ? t("js-meankind-ttbudget-line", "Sagnac { $sagnac } ns; ionosphere { $iono } ns.", { sagnac: f(r.terms_ns.sagnac), iono: f(r.terms_ns.ionosphere) }) : undefined };
}

function opticalAtmosphere(r) {
  const sites = Array.isArray(r.sites) ? r.sites.filter((x) => has(x, "availability_pct", "availability_ceiling_pct")) : [];
  if (!sites.length) return null;
  const best = sites.reduce((a, b) => (b.availability_pct > a.availability_pct ? b : a));
  const rows = Array.isArray(get(r, "network.rows")) ? r.network.rows.filter((x) => has(x, "independent_pct", "correlated_pct")) : [];
  const last = rows[rows.length - 1];
  const tech = Array.isArray(best.techniques) ? best.techniques.find((x) => has(x, "baseline_pct", "with_technique_pct")) : null;
  const bv = { best: f(best.availability_pct, 1), ceiling: f(best.availability_ceiling_pct, 1), n: rows.length, independent: last ? f(last.independent_pct, 1) : "", correlated: last ? f(last.correlated_pct, 1) : "" };
  return { big: rows.length > 1 && last ? t("js-meankind-optical-big-team", "The best single site keeps the optical link up { $best } % of the time (cloud-free ceiling { $ceiling } %); { $n } sites together reach { $independent } % if their weather is independent, { $correlated } % with the stated correlation.", bv) : t("js-meankind-optical-big-alone", "The best single site keeps the optical link up { $best } % of the time (cloud-free ceiling { $ceiling } %); no cloud-free margin lifts it above { $ceiling } %.", bv), line: tech ? t("js-meankind-optical-line-tech", "{ $name }: { $base } % becomes { $with } %.", { name: words(tech.name), base: f(tech.baseline_pct, 1), with: f(tech.with_technique_pct, 1) }) : t("js-meankind-optical-line-sites", { one: "{ $n } site modelled; the cloud climates are illustrative.", other: "{ $n } sites modelled; the cloud climates are illustrative." }, { n: sites.length }) };
}

// holdover-test (0.38): the operator's time-error record split at the two times stated, measured against ITU-T masks.
function holdoverTest(r) {
  if (!has(r, "holdover.duration_s", "holdover.te_at_max_abs_ns") || typeof get(r, "verdicts.holdover_masks") !== "string") return null;
  const recovered = get(r, "recovery.recovered");
  const masks = Array.isArray(r.masks) ? r.masks.filter((x) => typeof x.id === "string" && typeof x.verdict === "string").map((x) => `${x.id} ${x.verdict}`).join(", ") : "";
  const hv = { dur: f(r.holdover.duration_s, 0), te: f(Math.abs(r.holdover.te_at_max_abs_ns), 1), recover: f(get(r, "recovery.time_to_recover_s"), 0), masks };
  return { big: recovered === true ? t("js-meankind-holdovertest-big-recovered", "Measured against the masks, the record's holdover of { $dur } s reaches { $te } ns of time error, and recovered { $recover } s after GNSS returned.", hv) : recovered === false ? t("js-meankind-holdovertest-big-open", "Measured against the masks, the record's holdover of { $dur } s reaches { $te } ns of time error, and did not recover inside the band.", hv) : t("js-meankind-holdovertest-big", "Measured against the masks, the record's holdover of { $dur } s reaches { $te } ns of time error.", hv), line: masks ? t("js-meankind-holdovertest-line-masks", "{ $masks }. Measured against the mask, never a statement that a system conforms; the two times are the operator's statement.", hv) : t("js-meankind-holdovertest-line", "Measured against the mask, never a statement that a system conforms; the two times are the operator's statement.") };
}

// gnss-ssv (0.38): navigation signals far above the GNSS satellites. One sentence per mode, from the result's own numbers.
function gnssSsv(r) {
  const mode = r.mode, groups = (bands) => (Array.isArray(bands) ? bands : []).flatMap((b) => (Array.isArray(b.groups) ? b.groups : []).map((g) => ({ band: b.band, g })));
  const comb = (bands, pick) => { const x = groups(bands).find((e) => e.g.name === "combined" && e.band === "l1") || groups(bands).find((e) => e.g.name === "combined"); return x ? pick(x.g) : null; };
  const tail = t("js-meankind-ssv-tail", "MODELLED: a geometric and link-budget sweep, not a measurement of any signal in space.");
  if (mode === "shell" && Array.isArray(r.bands)) {
    const c = comb(r.bands, (g) => g);
    if (!c || !has(c, "at_least_1_pct", "at_least_4_pct")) return null;
    return { big: t("js-meankind-ssv-shell", "On the shell, all constellations together give at least one signal { $one } % of the time and at least four { $four } % (L1).", { one: f(c.at_least_1_pct, 1), four: f(c.at_least_4_pct, 1) }), line: tail };
  }
  if (mode === "trajectory" && has(r, "result.perigee_alt_km", "result.apogee_alt_km")) {
    const c = comb(get(r, "result.bands"), (g) => g.availability);
    if (!c || !has(c, "at_least_1_pct", "at_least_4_pct")) return null;
    return { big: t("js-meankind-ssv-trajectory", "From { $from } to { $to } km altitude, at least one signal is in view { $one } % of the epochs and at least four { $four } % (L1, all constellations).", { from: f(r.result.perigee_alt_km, 0), to: f(r.result.apogee_alt_km, 0), one: f(c.at_least_1_pct, 1), four: f(c.at_least_4_pct, 1) }), line: tail };
  }
  if (mode === "navigation" && Array.isArray(get(r, "result.phases"))) {
    const above = r.result.phases.find((p) => /above/i.test(String(p.phase))), inside = r.result.phases.find((p) => /inside/i.test(String(p.phase)));
    if (!above || !inside || !has(above, "pos_rms_m") || !has(inside, "pos_rms_m")) return null;
    return { big: t("js-meankind-ssv-navigation", "The onboard filter holds position to { $inside } m RMS inside the GNSS orbits and { $above } m above them.", { inside: f(inside.pos_rms_m, 1), above: f(above.pos_rms_m, 1) }), line: tail };
  }
  if (mode === "formation" && Array.isArray(get(r, "formation.deputies")) && r.formation.deputies.length) {
    const d = r.formation.deputies[0];
    if (!has(d, "baseline_km", "rel_rms_filter_m", "rel_rms_from_absolute_m")) return null;
    return { big: t("js-meankind-ssv-formation", "At { $km } km apart, the filter knows the relative position to { $filter } m RMS, against { $absolute } m from differencing the two absolute fixes.", { km: f(d.baseline_km, 2), filter: f(d.rel_rms_filter_m, 1), absolute: f(d.rel_rms_from_absolute_m, 1) }), line: tail };
  }
  return null;
}

// lunar-infrastructure (0.38): five studies selected by `study`. One sentence each, from the result's own numbers; the misses are stated.
function lunarInfrastructure(r) {
  const tail = t("js-meankind-infra-tail", "MODELLED: a restricted model with illustrative inputs, not a statement about any mission.");
  switch (r.study) {
    case "od-consistency":
      if (!has(r, "gnss_estimate.position_sigma_m", "ground_estimate.position_sigma_m", "consistency.mean_q")) return null;
      return { big: t("js-meankind-infra-od", "Onboard Earth-GNSS orbit determination in lunar orbit is good to { $gnss } m, independent ground tracking to { $ground } m; the consistency statistic averages { $mean } ({ $expected } expected).", { gnss: f(r.gnss_estimate.position_sigma_m, 0), ground: f(r.ground_estimate.position_sigma_m, 0), mean: f(r.consistency.mean_q, 2), expected: f(r.consistency.expected_mean_q, 0) }), line: tail };
    case "carrier-phase": {
      const a = Array.isArray(r.arcs) && r.arcs.length ? r.arcs[r.arcs.length - 1] : null;
      if (!a || !has(a, "monte_carlo_success_rate", "arc_days")) return null;
      return { big: t("js-meankind-infra-carrier", "Integer carrier-phase fixing between a surface station and an orbiter fixed { $share } % of the trials on the longest arc ({ $days } days).", { share: f(100 * a.monte_carlo_success_rate, 1), days: f(a.arc_days, 2) }), line: tail };
    }
    case "frame-coestimation":
      if (!has(r, "lambda_min_ratio", "crlb_trace_ratio")) return null;
      return { big: t("js-meankind-infra-frame", "Orbiter-to-station links raise the smallest information eigenvalue of the lunar datum { $x } times and cut the Cramér-Rao trace to { $share } %, if the orbit is known in the lunar axes.", { x: f(r.lambda_min_ratio, 1), share: f(100 * r.crlb_trace_ratio, 1) }), line: tail };
    case "space-tie":
      if (!has(r, "local_tie_sigma_m") || !Array.isArray(r.arcs) || !r.arcs.length || !Array.isArray(r.arcs[0].sweep)) return null;
      return { big: t("js-meankind-infra-tie", { one: "A { $mm } mm local tie on one spacecraft ties the GNSS, VLBI and laser-ranging frames over { $n } tie error swept.", other: "A { $mm } mm local tie on one spacecraft ties the GNSS, VLBI and laser-ranging frames over { $n } tie errors swept." }, { mm: f(r.local_tie_sigma_m * 1000, 1), n: r.arcs[0].sweep.length }), line: tail };
    case "geodesy-sensitivity":
      if (!Array.isArray(r.crlb_sigma_over_nominal_h2_k2_l2) || r.crlb_sigma_over_nominal_h2_k2_l2.length < 3) return null;
      return { big: t("js-meankind-infra-geodesy", "With all four families together, h2, k2 and l2 are pinned to { $h2 } %, { $k2 } % and { $l2 } % of their nominal values.", { h2: f(100 * r.crlb_sigma_over_nominal_h2_k2_l2[0], 2), k2: f(100 * r.crlb_sigma_over_nominal_h2_k2_l2[1], 2), l2: f(100 * r.crlb_sigma_over_nominal_h2_k2_l2[2], 2) }), line: tail };
    default: return null;
  }
}

export const KIND_TEMPLATES = {
  "holdover-test": holdoverTest, "gnss-ssv": gnssSsv, "lunar-infrastructure": lunarInfrastructure,
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
  "lunar-differential-pnt": lunarDpnt, "lunar-station-coverage": lunarStation, "lunar-attack-surface": lunarAttack, "lunar-joint-od-clock": lunarJointOd, "lunar-frame-realisation": lunarFrameReal,
  "lunar-interop-export": lunarInterop, "lunar-vlbi": lunarVlbi, "lunar-vlbi-fim": lunarVlbiFim, "lunar-frame-campaign": lunarFrameCampaign,
  "lunar-llr-datum": lunarLlr, "cislunar-observability": cislunarObs, "cislunar-arc-recovery": cislunarArc,
  "acm-link": acmLink, aocs, "ascent-losses": ascentLosses, "contact-schedule": contactSchedule, "entry-heating": entryHeating,
  "eo-radiometry": eoRadiometry, "time-transfer-budget": timeTransferBudget, "optical-atmosphere": opticalAtmosphere,
};
