// SPDX-License-Identifier: AGPL-3.0-only
// The plain meaning of a run, in one sentence, plus the key figures that answer the scenario's
// question. Every number here is read from the result document (or counted from it, such as
// "344 of 361 checks"); none is typed. A kind without a template gets its first headline figure
// stated plainly. Pure; tested in meaning.test.mjs.
import * as K from "./kinds.mjs";
import { fmt } from "./views.mjs";
import { kpis } from "./kpi.mjs";
import { KIND_TEMPLATES } from "./meaning-kinds.mjs";
import { spellOut } from "./abbr.mjs";

const num = (x) => typeof x === "number" && Number.isFinite(x);
const pct = (a, b) => (b > 0 ? (100 * a) / b : NaN);
// "95.3" for 95.29, "100" for 100: one decimal unless whole.
const p1 = (x) => (Math.abs(x - Math.round(x)) < 0.05 ? String(Math.round(x)) : x.toFixed(1));

// A duration in words: "45 s", "12 min", "1 h 50 min", "2.5 days".
export function plainDuration(s) {
  if (!num(s)) return "—";
  const a = Math.abs(s);
  if (a < 90) return `${fmt(a, 2)} s`;
  if (a < 3600) return `${Math.round(a / 60)} min`;
  if (a < 172800) {
    const h = Math.floor(a / 3600), m = Math.round((a - h * 3600) / 60);
    return m === 60 ? `${h + 1} h` : m ? `${h} h ${m} min` : `${h} h`;
  }
  return `${fmt(a / 86400, 2)} days`;
}

// A signal name in plain capitals: "gps-l1ca" -> "GPS L1CA", "galileo-e1" -> "Galileo E1".
const SYS = { gps: "GPS", galileo: "Galileo", beidou: "BeiDou", glonass: "GLONASS", qzss: "QZSS", navic: "NavIC" };
export function signalName(id) {
  return String(id).split(/[-_]/).map((w, i) => (i === 0 && SYS[w.toLowerCase()]) || w.toUpperCase()).join(" ");
}
const list = (xs) => (xs.length <= 1 ? xs.join("") : `${xs.slice(0, -1).join(", ")} and ${xs[xs.length - 1]}`);

// ---------------------------------------------------------------- templates per kind
// Each returns { big, line, cards } or null when the result lacks what it needs.
// cards: [{ label, value, unit, sub, good, path }], value already formatted.

function integrity(r) {
  const tot = r.samples_total, av = r.samples_available, ep = Array.isArray(r.epochs) ? r.epochs : [];
  if (!num(tot) || !num(av) || !tot) return null;
  const share = pct(av, tot);
  const span = ep.length > 1 ? ep[ep.length - 1].t_s - ep[0].t_s : NaN;
  const step = ep.length > 1 ? ep[1].t_s - ep[0].t_s : NaN;
  const yes = share >= 99.95 ? "Yes" : share >= 90 ? "Yes, mostly" : share >= 50 ? "Only partly" : "No";
  const big = num(span) ? `${yes}: for ${p1(share)} % of the ${plainDuration(span)}.` : `${yes}: at ${p1(share)} % of the checks.`;
  // Longest run of unavailable checks.
  let run = 0, best = 0, bestStart = null, start = null;
  ep.forEach((e) => { if (!e.available) { if (!run) start = e.t_s; run++; if (run > best) { best = run; bestStart = start; } } else run = 0; });
  const med = (k) => { const v = ep.map((e) => e[k]).filter(num).sort((a, b) => a - b); return v.length ? v[Math.floor(v.length / 2)] : NaN; };
  const pts = r.stanford && Array.isArray(r.stanford.points) ? r.stanford.points : null;
  const misleading = pts ? pts.filter((p) => /misleading/i.test(p.region || "")).length : null;
  const lim = [num(r.al_h_m) ? `${fmt(r.al_h_m)} m horizontal` : "", num(r.al_v_m) ? `${fmt(r.al_v_m)} m vertical` : ""].filter(Boolean);
  const line = `The receiver's error bound (its protection level) stayed under ${lim.length ? `the alert limits (${list(lim)})` : "the alert limit"} at ${av} of ${tot} checks${misleading === 0 ? ", and no fix was misleading" : misleading ? `; ${misleading} fixes were misleading` : ""}.`;
  const cards = [
    { label: "Time the fix can be trusted", value: p1(share), unit: "%", sub: `${av} of ${tot} checks`, good: share >= 99.95, path: "samples_available" },
  ];
  if (num(step) && ep.length) cards.push({ label: "Longest gap", value: best ? plainDuration(best * step) : "none", unit: "", sub: best ? `${best} checks in a row, from ${plainDuration(bestStart - ep[0].t_s)}` : "every check passed", path: "epochs" });
  const mh = med("hpl_m"), mv = med("vpl_m");
  if (num(mh) && num(mv)) cards.push({ label: "Typical error bound", value: `${fmt(mh, 1)} / ${fmt(mv, 1)}`, unit: "m", sub: "horizontal / vertical, median", path: "epochs" });
  if (misleading !== null) cards.push({ label: "Misleading fixes", value: String(misleading), unit: "", sub: "real error above the bound", good: misleading === 0, path: "stanford.points" });
  return { big, line, cards };
}

function lunarIntegrity(r) {
  const tot = r.samples_total, av = r.samples_available;
  if (!num(tot) || !num(av) || !tot) return null;
  const share = pct(av, tot);
  return {
    big: share >= 99.95 ? `Yes: at every one of ${tot} checks.` : av === 0 ? `No: at none of the ${tot} checks.` : `At ${av} of ${tot} checks (${p1(share)} %).`,
    line: `The protection level ranged from ${fmt(r.min_hpl_m)} to ${fmt(r.max_hpl_m)} m against an alert limit of ${fmt(r.alert_limit_m)} m.`,
    cards: [
      { label: "Checks that meet the limit", value: `${av} of ${tot}`, unit: "", sub: `${p1(share)} %`, good: share >= 99.95, path: "samples_available" },
      { label: "Smallest error bound", value: fmt(r.min_hpl_m), unit: "m", sub: "horizontal protection level", path: "min_hpl_m" },
      { label: "Largest error bound", value: fmt(r.max_hpl_m), unit: "m", sub: "horizontal protection level", path: "max_hpl_m" },
    ],
  };
}

function coverage(r) {
  const g = r.global;
  if (!g || !num(g.min_visible) || !num(g.mean_visible)) return null;
  const names = (r.constellations || []).map((c) => c.name).filter(Boolean);
  const bn = (r.body && r.body.name) || "";
  const body = !bn ? "the body" : /^(moon|sun)$/i.test(bn) ? `the ${bn}` : bn;
  const thr = r.inputs && r.inputs.pdop_threshold;
  return {
    big: g.min_visible > 0 ? `At least ${g.min_visible} satellites in view at every place, ${fmt(g.mean_visible, 2)} on average.` : `Some places see no satellite at times; ${fmt(g.mean_visible, 2)} are in view on average.`,
    line: `${names.length ? `With ${list(names)}${names.length > 1 ? " together" : ""}, a` : "A"} position fix is possible at ${p1(g.availability_pct)} % of places and times around ${body}${num(thr) ? ` (geometry quality, PDOP, under ${fmt(thr)})` : ""}.`,
    cards: [
      { label: "Fewest in view, anywhere", value: String(g.min_visible), unit: "", sub: "satellites", path: "global.min_visible" },
      { label: "Average in view", value: fmt(g.mean_visible, 2), unit: "", sub: "satellites", path: "global.mean_visible" },
      { label: "Places that get a fix", value: p1(g.availability_pct), unit: "%", sub: "of places and times", good: g.availability_pct >= 99.95, path: "global.availability_pct" },
      g.pdop && num(g.pdop.median) ? { label: "Geometry quality (PDOP)", value: fmt(g.pdop.median), unit: "", sub: "median, lower is better", path: "global.pdop.median" } : null,
    ].filter(Boolean),
  };
}

// Two clocks or two navigators run side by side (quantum and classical), each with a holdover.
function pair(r) {
  const q = r.quantum, c = r.classical;
  if (!q || !c || !q.fom || !c.fom || !num(q.fom.holdover_s) || !num(c.fom.holdover_s)) return null;
  const name = (x, fb) => (x.spec && x.spec.id ? x.spec.id : fb);
  const time = num(r.threshold_ns), pos = num(r.threshold_m);
  if (!time && !pos) return null;
  const budget = time ? `${fmt(r.threshold_ns)} ns` : `${fmt(r.threshold_m)} m`;
  const what = time ? "keeps time within" : "stays within";
  const qn = name(q, "quantum"), cn = name(c, "classical");
  const better = q.fom.holdover_s >= c.fom.holdover_s ? [qn, q, cn, c] : [cn, c, qn, q];
  const cards = [
    { label: `Holdover, ${better[0]}`, value: plainDuration(better[1].fom.holdover_s), unit: "", sub: `inside ${budget}`, good: true, path: `${better[1] === q ? "quantum" : "classical"}.fom.holdover_s` },
    { label: `Holdover, ${better[2]}`, value: plainDuration(better[3].fom.holdover_s), unit: "", sub: `inside ${budget}`, path: `${better[3] === q ? "quantum" : "classical"}.fom.holdover_s` },
  ];
  const err = time ? "timing_p95_ns" : "pos_p95_m", u = time ? "ns" : "m";
  for (const [n, x, k] of [[qn, q, "quantum"], [cn, c, "classical"]]) if (num(x.fom[err])) cards.push({ label: `Error, 95 % of the time, ${n}`, value: fmt(x.fom[err]), unit: u, sub: "over the whole run", path: `${k}.fom.${err}` });
  const same = q.fom.holdover_s === c.fom.holdover_s;
  return {
    big: same ? `Both the ${qn} and the ${cn} ${time ? "keep time" : "stay"} within ${budget} for ${plainDuration(q.fom.holdover_s)}.` : `The ${better[0]} ${what} ${budget} for ${plainDuration(better[1].fom.holdover_s)}; the ${better[2]} for ${plainDuration(better[3].fom.holdover_s)}.`,
    line: `Holdover is how long each ${time ? "clock" : "navigator"} stays inside the ${budget} budget after satellite navigation is lost.`,
    cards: cards.slice(0, 4),
  };
}

function jamming(r) {
  const f = r.fom;
  if (!f || !num(f.availability_under_jamming) || !num(f.availability_nominal)) return null;
  const j = 100 * f.availability_under_jamming, n = 100 * f.availability_nominal;
  return {
    big: j <= 0.05 ? "The jammer takes the position fix away completely." : `With the jammer, a fix is available ${p1(j)} % of the time.`,
    line: `Without the jammer the fix is available ${p1(n)} % of the time${num(f.mean_js_db) ? `; the jammer arrives ${fmt(f.mean_js_db)} dB above the signal on average` : ""}.`,
    cards: [
      { label: "Fix available, jammed", value: p1(j), unit: "%", sub: "of the time", good: j >= 99.95, path: "fom.availability_under_jamming" },
      { label: "Fix available, no jammer", value: p1(n), unit: "%", sub: "of the time", path: "fom.availability_nominal" },
      num(f.mean_js_db) ? { label: "Jammer above the signal", value: fmt(f.mean_js_db), unit: "dB", sub: "mean jammer-to-signal ratio", path: "fom.mean_js_db" } : null,
      num(f.min_tracking) ? { label: "Fewest satellites tracked", value: String(f.min_tracking), unit: "", sub: "at the worst moment", path: "fom.min_tracking" } : null,
    ].filter(Boolean),
  };
}

// Spectrum: which signals the jammers take away, from each band's lowest C/N0 against the
// receiver's tracking threshold (the pass or fail lib/kpi.mjs already states).
function spectrum(r, toml, cards) {
  const bands = cards.filter((c) => /min_cn0_dbhz$/.test(c.path || "") && c.state);
  if (!bands.length) return null;
  const lost = bands.filter((c) => c.state === "fail").map((c) => signalName(c.sub));
  const kept = bands.filter((c) => c.state === "pass").map((c) => signalName(c.sub));
  const thr = K.resolve(r, "receiver.tracking_threshold_dbhz");
  return {
    big: lost.length ? `The jammers take away ${lost.length} of ${bands.length} signals: ${list(lost)}.` : `Every one of the ${bands.length} signals keeps tracking.`,
    line: `${kept.length ? `${list(kept)} stay${kept.length === 1 ? "s" : ""} above` : "No signal stays above"} the receiver's ${num(thr) ? `${fmt(thr)} dB-Hz ` : ""}tracking threshold for the whole run.`,
    cards: bands.slice(0, 4).map((c) => ({ label: `Weakest signal, ${signalName(c.sub)}`, value: fmt(c.v), unit: c.unit, sub: c.state === "fail" ? "below the threshold: lost" : "above the threshold", good: c.state === "pass", bad: c.state === "fail", path: c.path })),
  };
}

// Orbit geometry: how often the satellites in view allow a fix, and how good the geometry is.
function orbit(r) {
  const g = r.geometry;
  if (!g || !num(g.samples_total) || !num(g.samples_with_fix) || !g.samples_total) return null;
  const share = pct(g.samples_with_fix, g.samples_total);
  return {
    big: share >= 99.95 ? "A fix is possible the whole time." : `A fix is possible ${p1(share)} % of the time.`,
    line: `Enough satellites were in view at ${g.samples_with_fix} of ${g.samples_total} moments${num(g.median_pdop) ? `; the typical geometry quality (PDOP, position dilution of precision) is ${fmt(g.median_pdop)}, lower is better` : ""}.`,
    cards: [
      { label: "Time a fix is possible", value: p1(share), unit: "%", sub: `${g.samples_with_fix} of ${g.samples_total} moments`, good: share >= 99.95, path: "geometry.samples_with_fix" },
      num(g.median_pdop) ? { label: "Geometry quality (PDOP)", value: fmt(g.median_pdop), unit: "", sub: "median, lower is better", path: "geometry.median_pdop" } : null,
      num(g.best_pdop) ? { label: "Best geometry (PDOP)", value: fmt(g.best_pdop), unit: "", sub: "lowest over the run", path: "geometry.best_pdop" } : null,
      num(g.median_position_sigma_m) ? { label: "Typical position error", value: fmt(g.median_position_sigma_m), unit: "m", sub: "1-sigma, median", path: "geometry.median_position_sigma_m" } : null,
    ].filter(Boolean),
  };
}

// A clock ensemble: holdover across many noise draws, as a mean and a 5 to 95 % band.
function ensemble(r) {
  const q = r.quantum, c = r.classical;
  const hq = q && q.holdover_s, hc = c && c.holdover_s;
  if (!hq || !hc || !num(hq.mean) || !num(hc.mean) || !num(r.threshold_ns)) return null;
  const qn = (q.spec && q.spec.id) || "quantum", cn = (c.spec && c.spec.id) || "classical";
  const band = (h) => (num(h.p05) && num(h.p95) ? `${plainDuration(h.p05)} to ${plainDuration(h.p95)}` : "");
  return {
    big: `Across ${num(r.runs) ? r.runs : "many"} noise draws, the ${qn} holds ${fmt(r.threshold_ns)} ns for ${plainDuration(hq.mean)} on average; the ${cn} for ${plainDuration(hc.mean)}.`,
    line: band(hc) ? `Nine draws in ten of the ${cn} hold from ${band(hc)}.` : "",
    cards: [
      { label: `Holdover, ${qn}`, value: plainDuration(hq.mean), unit: "", sub: band(hq) ? `mean; 90 % band ${band(hq)}` : "mean", path: "quantum.holdover_s.mean" },
      { label: `Holdover, ${cn}`, value: plainDuration(hc.mean), unit: "", sub: band(hc) ? `mean; 90 % band ${band(hc)}` : "mean", path: "classical.holdover_s.mean" },
    ],
  };
}

// Kinds whose result is two clocks or navigators side by side ("" is the default clock kind).
const PAIR_KINDS = ["", "gnss-ins", "inertial"];
const pairOrEnsemble = (r, t, c) => pair(r, t, c) || ensemble(r, t, c);
const TEMPLATES = { integrity, "lunar-integrity": lunarIntegrity, "constellation-design": coverage, jamming, "lunar-jamming": jamming, spectrum, orbit };

// ---------------------------------------------------------------- generic
// A headline card as a figure: "1.5 h" for a long duration, else the number and its unit.
export function cardValue(c) {
  if (c.unit === "s" && num(c.v) && Math.abs(c.v) >= 120) return { value: plainDuration(c.v), unit: "" };
  // The kind's own text is already scaled to its unit (10 MHz for 1e7 Hz): use it as written.
  if (c.text !== undefined && c.text !== "") return { value: String(c.text), unit: c.unit && c.unit !== "1" && c.unit !== "count" ? c.unit : "" };
  return { value: num(c.v) ? fmt(c.v) : String(c.v), unit: c.unit && c.unit !== "1" && c.unit !== "count" ? c.unit : "" };
}
const cardLabel = (c) => `${c.k}${c.sub && c.sub !== "your setting" ? `, ${c.sub}` : ""}`.replace(/\s*\([^)]*\)$/, "");

// Answer cards from the headline strip: outputs first; an input echo only when there is
// nothing else to show, marked "your setting".
export function genericCards(cards, max = 4) {
  const outs = cards.filter((c) => !c.input);
  const pool = outs.length >= 2 ? outs : [...outs, ...cards.filter((c) => c.input)];
  return pool.slice(0, max).map((c) => {
    const v = cardValue(c);
    return { label: cardLabel(c), value: v.value, unit: v.unit, sub: c.input ? "your setting" : c.why || "", good: c.state === "pass", bad: c.state === "fail", path: c.path || "" };
  });
}

// Bookkeeping figures (how many runs or samples were made) describe the run, not the answer.
const META = /(runs_total|sweep\.runs|^samples$|n_cases|roc_points|state_dim|n_axes|\.n$)/i;
function generic(cards) {
  const outs = cards.filter((c) => !c.input);
  if (!outs.length && !cards.length) return { big: "This run has no single headline figure; the chart below shows its result.", line: "", cards: [], generic: true };
  const first = outs.find((c) => !META.test(c.path || "")) || outs[0] || cards[0];
  const v = cardValue(first);
  const rest = outs.filter((c) => c !== first && !META.test(c.path || "")).slice(0, 2).map((c) => { const x = cardValue(c); return `${cardLabel(c).toLowerCase()} ${x.value}${x.unit ? " " + x.unit : ""}`; });
  return {
    big: `${cardLabel(first)}: ${v.value}${v.unit ? " " + v.unit : ""}.`,
    line: rest.length ? `Also from this run: ${list(rest)}.` : "",
    cards: genericCards(cards),
    generic: true,
  };
}

// The meaning of a run: { big, line, cards, kind, generic }.
export function plainMeaning(result, toml = "") {
  if (!result || typeof result !== "object") return null;
  const kind = K.kindOfRun(result, toml) || "";
  const cards = kpis(result, toml, 6);
  const t = TEMPLATES[kind] || KIND_TEMPLATES[kind] || (PAIR_KINDS.includes(kind) ? pairOrEnsemble : () => null);
  let out = null;
  try { out = t(result, toml, cards); } catch { out = null; }
  // A kind template states the meaning; the cards stay the run's own headline strip unless it gives its own.
  if (out && !out.cards) out = { ...out, cards: genericCards(cards) };
  if (!out) out = generic(cards);
  if (!out) return null;
  return { ...out, kind, generic: !!out.generic };
}

export const TEMPLATE_KINDS = [...Object.keys(TEMPLATES), ...Object.keys(KIND_TEMPLATES), "(quantum and classical pair)"];

// ---------------------------------------------------------------- the task screen's words
// The scenario file's header comment, as paragraphs (the method note).
export function headerParagraphs(toml) {
  const lines = [];
  for (const line of String(toml).split("\n")) { if (/^\s*#/.test(line)) lines.push(line.replace(/^\s*#\s?/, "")); else if (line.trim() === "" && !lines.length) continue; else break; }
  const paras = [];
  let cur = [];
  for (const l of lines) { if (!l.trim()) { if (cur.length) paras.push(cur.join(" ")); cur = []; } else cur.push(l.trim()); }
  if (cur.length) paras.push(cur.join(" "));
  return paras;
}
// The heading of a task screen and the answer under it, with each abbreviation spelled out at its
// first use on the screen. Used by the Studio and by tools_areas.mjs for the first paint, so both
// write the same words. entry: { title, question }, domainLabel: string.
export function taskWords(entry, domainLabel, toml, result) {
  const seen = new Set();
  const title = spellOut(entry.question.replace(/\s*\((modelled[^)]*)\)\s*$/i, ""), seen);
  const first = headerParagraphs(toml)[0] || "";
  const sub = spellOut((first.match(/^.*?[.!?](\s|$)/) || [first])[0].trim(), seen);
  const out = { kicker: `${domainLabel} · ${entry.title}`, title, sub, seen: [...seen] };
  if (result) {
    const m = plainMeaning(result, toml);
    const s2 = new Set(seen);
    if (m) Object.assign(out, { big: spellOut(m.big, s2), line: spellOut(m.line, s2), cards: m.cards });
  }
  return out;
}
