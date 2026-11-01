// SPDX-License-Identifier: AGPL-3.0-only
// The plain meaning of a run, in one sentence, plus the key figures that answer the scenario's
// question. Every number here is read from the result document (or counted from it, such as
// "344 of 361 checks"); none is typed. A kind without a template gets its first headline figure
// stated plainly. Pure; tested in meaning.test.mjs.
import * as K from "./kinds.mjs";
import { fmt } from "./views.mjs";
import { kpis } from "./kpi.mjs";
import { KIND_TEMPLATES, list } from "./meaning-kinds.mjs";
import { spellOut } from "./abbr.mjs";
import { own } from "./own.mjs";
import { t } from "./t.mjs";

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
  return t("js-meaning-duration-days", { one: "{ $days } day", other: "{ $days } days" }, { n: a / 86400, days: fmt(a / 86400, 2) });
}

// A signal name in plain capitals: "gps-l1ca" -> "GPS L1CA", "galileo-e1" -> "Galileo E1".
const SYS = { gps: "GPS", galileo: "Galileo", beidou: "BeiDou", glonass: "GLONASS", qzss: "QZSS", navic: "NavIC" };
export function signalName(id) {
  return String(id).split(/[-_]/).map((w, i) => (i === 0 && SYS[w.toLowerCase()]) || w.toUpperCase()).join(" ");
}

// ---------------------------------------------------------------- templates per kind
// Each returns { big, line, cards } or null when the result lacks what it needs.
// cards: [{ label, value, unit, sub, good, path }], value already formatted.

function integrity(r) {
  const tot = r.samples_total, av = r.samples_available, ep = Array.isArray(r.epochs) ? r.epochs : [];
  if (!num(tot) || !num(av) || !tot) return null;
  const share = pct(av, tot);
  const span = ep.length > 1 ? ep[ep.length - 1].t_s - ep[0].t_s : NaN;
  const step = ep.length > 1 ? ep[1].t_s - ep[0].t_s : NaN;
  const lvl = share >= 99.95 ? 0 : share >= 90 ? 1 : share >= 50 ? 2 : 3;
  const sh = p1(share);
  const big = num(span)
    ? [
        () => t("js-meaning-integrity-big-span-yes", "Yes: for { $share } % of the { $span }.", { share: sh, span: plainDuration(span) }),
        () => t("js-meaning-integrity-big-span-mostly", "Yes, mostly: for { $share } % of the { $span }.", { share: sh, span: plainDuration(span) }),
        () => t("js-meaning-integrity-big-span-partly", "Only partly: for { $share } % of the { $span }.", { share: sh, span: plainDuration(span) }),
        () => t("js-meaning-integrity-big-span-no", "No: for { $share } % of the { $span }.", { share: sh, span: plainDuration(span) }),
      ][lvl]()
    : [
        () => t("js-meaning-integrity-big-checks-yes", "Yes: at { $share } % of the checks.", { share: sh }),
        () => t("js-meaning-integrity-big-checks-mostly", "Yes, mostly: at { $share } % of the checks.", { share: sh }),
        () => t("js-meaning-integrity-big-checks-partly", "Only partly: at { $share } % of the checks.", { share: sh }),
        () => t("js-meaning-integrity-big-checks-no", "No: at { $share } % of the checks.", { share: sh }),
      ][lvl]();
  // Longest run of unavailable checks.
  let run = 0, best = 0, bestStart = null, start = null;
  ep.forEach((e) => { if (!e.available) { if (!run) start = e.t_s; run++; if (run > best) { best = run; bestStart = start; } } else run = 0; });
  const med = (k) => { const v = ep.map((e) => e[k]).filter(num).sort((a, b) => a - b); return v.length ? v[Math.floor(v.length / 2)] : NaN; };
  const pts = r.stanford && Array.isArray(r.stanford.points) ? r.stanford.points : null;
  const misleading = pts ? pts.filter((p) => /misleading/i.test(p.region || "")).length : null;
  const hasH = num(r.al_h_m), hasV = num(r.al_v_m);
  const lv = { h: fmt(r.al_h_m), v: fmt(r.al_v_m), av, tot, n: tot };
  const lm = { ...lv, n: misleading };
  let line;
  if (!hasH && !hasV) {
    line = misleading === 0 ? t("js-meaning-integrity-line-none-clean", { one: "The receiver's error bound (its protection level) stayed under the alert limit at { $av } of { $tot } check, and no fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limit at { $av } of { $tot } checks, and no fix was misleading." }, lv)
      : misleading ? t("js-meaning-integrity-line-none-some", { one: "The receiver's error bound (its protection level) stayed under the alert limit at { $av } of { $tot } checks; { $n } fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limit at { $av } of { $tot } checks; { $n } fixes were misleading." }, lm)
      : t("js-meaning-integrity-line-none", { one: "The receiver's error bound (its protection level) stayed under the alert limit at { $av } of { $tot } check.", other: "The receiver's error bound (its protection level) stayed under the alert limit at { $av } of { $tot } checks." }, lv);
  } else if (hasH && hasV) {
    line = misleading === 0 ? t("js-meaning-integrity-line-hv-clean", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal and { $v } m vertical) at { $av } of { $tot } check, and no fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal and { $v } m vertical) at { $av } of { $tot } checks, and no fix was misleading." }, lv)
      : misleading ? t("js-meaning-integrity-line-hv-some", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal and { $v } m vertical) at { $av } of { $tot } checks; { $n } fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal and { $v } m vertical) at { $av } of { $tot } checks; { $n } fixes were misleading." }, lm)
      : t("js-meaning-integrity-line-hv", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal and { $v } m vertical) at { $av } of { $tot } check.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal and { $v } m vertical) at { $av } of { $tot } checks." }, lv);
  } else if (hasH) {
    line = misleading === 0 ? t("js-meaning-integrity-line-h-clean", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal) at { $av } of { $tot } check, and no fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal) at { $av } of { $tot } checks, and no fix was misleading." }, lv)
      : misleading ? t("js-meaning-integrity-line-h-some", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal) at { $av } of { $tot } checks; { $n } fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal) at { $av } of { $tot } checks; { $n } fixes were misleading." }, lm)
      : t("js-meaning-integrity-line-h", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal) at { $av } of { $tot } check.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $h } m horizontal) at { $av } of { $tot } checks." }, lv);
  } else {
    line = misleading === 0 ? t("js-meaning-integrity-line-v-clean", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $v } m vertical) at { $av } of { $tot } check, and no fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $v } m vertical) at { $av } of { $tot } checks, and no fix was misleading." }, lv)
      : misleading ? t("js-meaning-integrity-line-v-some", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $v } m vertical) at { $av } of { $tot } checks; { $n } fix was misleading.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $v } m vertical) at { $av } of { $tot } checks; { $n } fixes were misleading." }, lm)
      : t("js-meaning-integrity-line-v", { one: "The receiver's error bound (its protection level) stayed under the alert limits ({ $v } m vertical) at { $av } of { $tot } check.", other: "The receiver's error bound (its protection level) stayed under the alert limits ({ $v } m vertical) at { $av } of { $tot } checks." }, lv);
  }
  const cards = [
    { label: t("js-meaning-integrity-trusted-label", "Time the fix can be trusted"), value: p1(share), unit: "%", sub: t("js-meaning-checks-of", { one: "{ $av } of { $n } check", other: "{ $av } of { $n } checks" }, { av, n: tot }), good: share >= 99.95, path: "samples_available" },
  ];
  if (num(step) && ep.length) cards.push({ label: t("js-meaning-integrity-gap-label", "Longest gap"), value: best ? plainDuration(best * step) : t("js-meaning-integrity-gap-none", "none"), unit: "", sub: best ? t("js-meaning-integrity-gap-sub", { one: "{ $n } check in a row, from { $from }", other: "{ $n } checks in a row, from { $from }" }, { n: best, from: plainDuration(bestStart - ep[0].t_s) }) : t("js-meaning-integrity-gap-all-passed", "every check passed"), path: "epochs" });
  const mh = med("hpl_m"), mv = med("vpl_m");
  if (num(mh) && num(mv)) cards.push({ label: t("js-meaning-integrity-bound-label", "Typical error bound"), value: `${fmt(mh, 1)} / ${fmt(mv, 1)}`, unit: "m", sub: t("js-meaning-integrity-bound-sub", "horizontal / vertical, median"), path: "epochs" });
  if (misleading !== null) cards.push({ label: t("js-meaning-integrity-misleading-label", "Misleading fixes"), value: String(misleading), unit: "", sub: t("js-meaning-integrity-misleading-sub", "real error above the bound"), good: misleading === 0, path: "stanford.points" });
  return { big, line, cards };
}

function lunarIntegrity(r) {
  const tot = r.samples_total, av = r.samples_available;
  if (!num(tot) || !num(av) || !tot) return null;
  const share = pct(av, tot);
  return {
    big: share >= 99.95 ? t("js-meaning-lunar-big-all", { one: "Yes: at every one of { $n } check.", other: "Yes: at every one of { $n } checks." }, { n: tot }) : av === 0 ? t("js-meaning-lunar-big-none", { one: "No: at none of the { $n } check.", other: "No: at none of the { $n } checks." }, { n: tot }) : t("js-meaning-lunar-big-some", { one: "At { $av } of { $n } check ({ $share } %).", other: "At { $av } of { $n } checks ({ $share } %)." }, { av, n: tot, share: p1(share) }),
    line: t("js-meaning-lunar-line", "The protection level ranged from { $min } to { $max } m against an alert limit of { $limit } m.", { min: fmt(r.min_hpl_m), max: fmt(r.max_hpl_m), limit: fmt(r.alert_limit_m) }),
    cards: [
      { label: t("js-meaning-lunar-meet-label", "Checks that meet the limit"), value: t("js-meaning-lunar-meet-value", "{ $av } of { $tot }", { av, tot }), unit: "", sub: `${p1(share)} %`, good: share >= 99.95, path: "samples_available" },
      { label: t("js-meaning-lunar-smallest-label", "Smallest error bound"), value: fmt(r.min_hpl_m), unit: "m", sub: t("js-meaning-hpl-sub", "horizontal protection level"), path: "min_hpl_m" },
      { label: t("js-meaning-lunar-largest-label", "Largest error bound"), value: fmt(r.max_hpl_m), unit: "m", sub: t("js-meaning-hpl-sub", "horizontal protection level"), path: "max_hpl_m" },
    ],
  };
}

function coverage(r) {
  const g = r.global;
  if (!g || !num(g.min_visible) || !num(g.mean_visible)) return null;
  const names = (r.constellations || []).map((c) => c.name).filter(Boolean);
  const bn = (r.body && r.body.name) || "";
  const body = !bn ? t("js-meaning-body-generic", "the body") : /^(moon|sun)$/i.test(bn) ? t("js-meaning-body-the", "the { $name }", { name: bn }) : bn;
  const thr = r.inputs && r.inputs.pdop_threshold;
  const cv = { names: list(names), share: p1(g.availability_pct), body, thr: fmt(thr) };
  const cline = names.length > 1
    ? (num(thr) ? t("js-meaning-coverage-line-many-pdop", "With { $names } together, a position fix is possible at { $share } % of places and times around { $body } (geometry quality, PDOP, under { $thr }).", cv) : t("js-meaning-coverage-line-many", "With { $names } together, a position fix is possible at { $share } % of places and times around { $body }.", cv))
    : names.length
      ? (num(thr) ? t("js-meaning-coverage-line-one-pdop", "With { $names }, a position fix is possible at { $share } % of places and times around { $body } (geometry quality, PDOP, under { $thr }).", cv) : t("js-meaning-coverage-line-one", "With { $names }, a position fix is possible at { $share } % of places and times around { $body }.", cv))
      : (num(thr) ? t("js-meaning-coverage-line-none-pdop", "A position fix is possible at { $share } % of places and times around { $body } (geometry quality, PDOP, under { $thr }).", cv) : t("js-meaning-coverage-line-none", "A position fix is possible at { $share } % of places and times around { $body }.", cv));
  return {
    big: g.min_visible > 0 ? t("js-meaning-coverage-big-min", { one: "At least { $n } satellite in view at every place, { $mean } on average.", other: "At least { $n } satellites in view at every place, { $mean } on average." }, { n: g.min_visible, mean: fmt(g.mean_visible, 2) }) : t("js-meaning-coverage-big-none", "Some places see no satellite at times; { $mean } are in view on average.", { mean: fmt(g.mean_visible, 2) }),
    line: cline,
    cards: [
      { label: t("js-meaning-coverage-fewest-label", "Fewest in view, anywhere"), value: String(g.min_visible), unit: "", sub: t("js-meaning-satellites", { one: "satellite", other: "satellites" }, { n: g.min_visible }), path: "global.min_visible" },
      { label: t("js-meaning-coverage-average-label", "Average in view"), value: fmt(g.mean_visible, 2), unit: "", sub: t("js-meaning-satellites", { one: "satellite", other: "satellites" }, { n: g.mean_visible }), path: "global.mean_visible" },
      { label: t("js-meaning-coverage-places-label", "Places that get a fix"), value: p1(g.availability_pct), unit: "%", sub: t("js-meaning-places-times", "of places and times"), good: g.availability_pct >= 99.95, path: "global.availability_pct" },
      g.pdop && num(g.pdop.median) ? { label: t("js-meaning-pdop-label", "Geometry quality (PDOP)"), value: fmt(g.pdop.median), unit: "", sub: t("js-meaning-median-lower-better", "median, lower is better"), path: "global.pdop.median" } : null,
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
  const qn = name(q, "quantum"), cn = name(c, "classical");
  const better = q.fom.holdover_s >= c.fom.holdover_s ? [qn, q, cn, c] : [cn, c, qn, q];
  const cards = [
    { label: t("js-meaning-holdover-label", "Holdover, { $name }", { name: better[0] }), value: plainDuration(better[1].fom.holdover_s), unit: "", sub: t("js-meaning-inside-budget", "inside { $budget }", { budget }), good: true, path: `${better[1] === q ? "quantum" : "classical"}.fom.holdover_s` },
    { label: t("js-meaning-holdover-label", "Holdover, { $name }", { name: better[2] }), value: plainDuration(better[3].fom.holdover_s), unit: "", sub: t("js-meaning-inside-budget", "inside { $budget }", { budget }), path: `${better[3] === q ? "quantum" : "classical"}.fom.holdover_s` },
  ];
  const err = time ? "timing_p95_ns" : "pos_p95_m", u = time ? "ns" : "m";
  for (const [n, x, k] of [[qn, q, "quantum"], [cn, c, "classical"]]) if (num(x.fom[err])) cards.push({ label: t("js-meaning-error-p95-label", "Error, 95 % of the time, { $name }", { name: n }), value: fmt(x.fom[err]), unit: u, sub: t("js-meaning-whole-run", "over the whole run"), path: `${k}.fom.${err}` });
  const same = q.fom.holdover_s === c.fom.holdover_s;
  return {
    big: same
      ? (time ? t("js-meaning-pair-big-same-time", "Both the { $q } and the { $c } keep time within { $budget } for { $dur }.", { q: qn, c: cn, budget, dur: plainDuration(q.fom.holdover_s) }) : t("js-meaning-pair-big-same-pos", "Both the { $q } and the { $c } stay within { $budget } for { $dur }.", { q: qn, c: cn, budget, dur: plainDuration(q.fom.holdover_s) }))
      : (time ? t("js-meaning-pair-big-diff-time", "The { $best } keeps time within { $budget } for { $bestDur }; the { $other } for { $otherDur }.", { best: better[0], budget, bestDur: plainDuration(better[1].fom.holdover_s), other: better[2], otherDur: plainDuration(better[3].fom.holdover_s) }) : t("js-meaning-pair-big-diff-pos", "The { $best } stays within { $budget } for { $bestDur }; the { $other } for { $otherDur }.", { best: better[0], budget, bestDur: plainDuration(better[1].fom.holdover_s), other: better[2], otherDur: plainDuration(better[3].fom.holdover_s) })),
    line: time ? t("js-meaning-pair-line-clock", "Holdover is how long each clock stays inside the { $budget } budget after satellite navigation is lost.", { budget }) : t("js-meaning-pair-line-navigator", "Holdover is how long each navigator stays inside the { $budget } budget after satellite navigation is lost.", { budget }),
    cards: cards.slice(0, 4),
  };
}

function jamming(r) {
  const f = r.fom;
  if (!f || !num(f.availability_under_jamming) || !num(f.availability_nominal)) return null;
  const j = 100 * f.availability_under_jamming, n = 100 * f.availability_nominal;
  return {
    big: j <= 0.05 ? t("js-meaning-jamming-big-gone", "The jammer takes the position fix away completely.") : t("js-meaning-jamming-big-share", "With the jammer, a fix is available { $share } % of the time.", { share: p1(j) }),
    line: num(f.mean_js_db) ? t("js-meaning-jamming-line-js", "Without the jammer the fix is available { $share } % of the time; the jammer arrives { $db } dB above the signal on average.", { share: p1(n), db: fmt(f.mean_js_db) }) : t("js-meaning-jamming-line", "Without the jammer the fix is available { $share } % of the time.", { share: p1(n) }),
    cards: [
      { label: t("js-meaning-jamming-jammed-label", "Fix available, jammed"), value: p1(j), unit: "%", sub: t("js-meaning-of-the-time", "of the time"), good: j >= 99.95, path: "fom.availability_under_jamming" },
      { label: t("js-meaning-jamming-clear-label", "Fix available, no jammer"), value: p1(n), unit: "%", sub: t("js-meaning-of-the-time", "of the time"), path: "fom.availability_nominal" },
      num(f.mean_js_db) ? { label: t("js-meaning-jamming-above-label", "Jammer above the signal"), value: fmt(f.mean_js_db), unit: "dB", sub: t("js-meaning-jamming-above-sub", "mean jammer-to-signal ratio"), path: "fom.mean_js_db" } : null,
      num(f.min_tracking) ? { label: t("js-meaning-jamming-fewest-label", "Fewest satellites tracked"), value: String(f.min_tracking), unit: "", sub: t("js-meaning-jamming-fewest-sub", "at the worst moment"), path: "fom.min_tracking" } : null,
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
  const sv = { names: list(kept), thr: fmt(thr) };
  return {
    big: lost.length ? t("js-meaning-spectrum-big-lost", { one: "The jammers take away { $lost } of { $n } signal: { $names }.", other: "The jammers take away { $lost } of { $n } signals: { $names }." }, { lost: lost.length, n: bands.length, names: list(lost) }) : t("js-meaning-spectrum-big-kept", { one: "Every one of the { $n } signal keeps tracking.", other: "Every one of the { $n } signals keeps tracking." }, { n: bands.length }),
    line: kept.length
      ? (num(thr) ? t("js-meaning-spectrum-line-kept-thr", { one: "{ $names } stays above the receiver's { $thr } dB-Hz tracking threshold for the whole run.", other: "{ $names } stay above the receiver's { $thr } dB-Hz tracking threshold for the whole run." }, { ...sv, n: kept.length }) : t("js-meaning-spectrum-line-kept", { one: "{ $names } stays above the receiver's tracking threshold for the whole run.", other: "{ $names } stay above the receiver's tracking threshold for the whole run." }, { ...sv, n: kept.length }))
      : (num(thr) ? t("js-meaning-spectrum-line-none-thr", "No signal stays above the receiver's { $thr } dB-Hz tracking threshold for the whole run.", sv) : t("js-meaning-spectrum-line-none", "No signal stays above the receiver's tracking threshold for the whole run.")),
    cards: bands.slice(0, 4).map((c) => ({ label: t("js-meaning-spectrum-weakest-label", "Weakest signal, { $name }", { name: signalName(c.sub) }), value: fmt(c.v), unit: c.unit, sub: c.state === "fail" ? t("js-meaning-spectrum-below", "below the threshold: lost") : t("js-meaning-spectrum-above", "above the threshold"), good: c.state === "pass", bad: c.state === "fail", path: c.path })),
  };
}

// Orbit geometry: how often the satellites in view allow a fix, and how good the geometry is.
function orbit(r) {
  const g = r.geometry;
  if (!g || !num(g.samples_total) || !num(g.samples_with_fix) || !g.samples_total) return null;
  const share = pct(g.samples_with_fix, g.samples_total);
  return {
    big: share >= 99.95 ? t("js-meaning-orbit-big-always", "A fix is possible the whole time.") : t("js-meaning-orbit-big-share", "A fix is possible { $share } % of the time.", { share: p1(share) }),
    line: num(g.median_pdop) ? t("js-meaning-orbit-line-pdop", { one: "Enough satellites were in view at { $fix } of { $n } moment; the typical geometry quality (PDOP, position dilution of precision) is { $pdop }, lower is better.", other: "Enough satellites were in view at { $fix } of { $n } moments; the typical geometry quality (PDOP, position dilution of precision) is { $pdop }, lower is better." }, { fix: g.samples_with_fix, n: g.samples_total, pdop: fmt(g.median_pdop) }) : t("js-meaning-orbit-line", { one: "Enough satellites were in view at { $fix } of { $n } moment.", other: "Enough satellites were in view at { $fix } of { $n } moments." }, { fix: g.samples_with_fix, n: g.samples_total }),
    cards: [
      { label: t("js-meaning-orbit-time-label", "Time a fix is possible"), value: p1(share), unit: "%", sub: t("js-meaning-orbit-moments", { one: "{ $fix } of { $n } moment", other: "{ $fix } of { $n } moments" }, { fix: g.samples_with_fix, n: g.samples_total }), good: share >= 99.95, path: "geometry.samples_with_fix" },
      num(g.median_pdop) ? { label: t("js-meaning-pdop-label", "Geometry quality (PDOP)"), value: fmt(g.median_pdop), unit: "", sub: t("js-meaning-median-lower-better", "median, lower is better"), path: "geometry.median_pdop" } : null,
      num(g.best_pdop) ? { label: t("js-meaning-orbit-best-label", "Best geometry (PDOP)"), value: fmt(g.best_pdop), unit: "", sub: t("js-meaning-orbit-best-sub", "lowest over the run"), path: "geometry.best_pdop" } : null,
      num(g.median_position_sigma_m) ? { label: t("js-meaning-orbit-error-label", "Typical position error"), value: fmt(g.median_position_sigma_m), unit: "m", sub: t("js-meaning-orbit-error-sub", "1-sigma, median"), path: "geometry.median_position_sigma_m" } : null,
    ].filter(Boolean),
  };
}

// A clock ensemble: holdover across many noise draws, as a mean and a 5 to 95 % band.
function ensemble(r) {
  const q = r.quantum, c = r.classical;
  const hq = q && q.holdover_s, hc = c && c.holdover_s;
  if (!hq || !hc || !num(hq.mean) || !num(hc.mean) || !num(r.threshold_ns)) return null;
  const qn = (q.spec && q.spec.id) || "quantum", cn = (c.spec && c.spec.id) || "classical";
  const band = (h) => (num(h.p05) && num(h.p95) ? t("js-meaning-range-to", "{ $from } to { $to }", { from: plainDuration(h.p05), to: plainDuration(h.p95) }) : "");
  const ev = { q: qn, c: cn, thr: fmt(r.threshold_ns), qd: plainDuration(hq.mean), cd: plainDuration(hc.mean) };
  const meanSub = (h) => (band(h) ? t("js-meaning-ensemble-mean-band", "mean; 90 % band { $band }", { band: band(h) }) : t("js-meaning-ensemble-mean", "mean"));
  return {
    big: num(r.runs) ? t("js-meaning-ensemble-big-runs", { one: "Across { $n } noise draw, the { $q } holds { $thr } ns for { $qd } on average; the { $c } for { $cd }.", other: "Across { $n } noise draws, the { $q } holds { $thr } ns for { $qd } on average; the { $c } for { $cd }." }, { ...ev, n: r.runs }) : t("js-meaning-ensemble-big-many", "Across many noise draws, the { $q } holds { $thr } ns for { $qd } on average; the { $c } for { $cd }.", ev),
    line: band(hc) ? t("js-meaning-ensemble-line", "Nine draws in ten of the { $name } hold from { $band }.", { name: cn, band: band(hc) }) : "",
    cards: [
      { label: t("js-meaning-holdover-label", "Holdover, { $name }", { name: qn }), value: plainDuration(hq.mean), unit: "", sub: meanSub(hq), path: "quantum.holdover_s.mean" },
      { label: t("js-meaning-holdover-label", "Holdover, { $name }", { name: cn }), value: plainDuration(hc.mean), unit: "", sub: meanSub(hc), path: "classical.holdover_s.mean" },
    ],
  };
}

// Kinds whose result is two clocks or navigators side by side ("" is the default clock kind).
const PAIR_KINDS = ["", "gnss-ins", "inertial"];
const pairOrEnsemble = (r, toml, c) => pair(r, toml, c) || ensemble(r, toml, c);
const TEMPLATES = { integrity, "lunar-integrity": lunarIntegrity, "constellation-design": coverage, jamming, "lunar-jamming": jamming, spectrum, orbit };

// ---------------------------------------------------------------- generic
// A headline card as a figure: "1.5 h" for a long duration, else the number and its unit.
export function cardValue(c) {
  if (c.unit === "s" && num(c.v) && Math.abs(c.v) >= 120) return { value: plainDuration(c.v), unit: "" };
  // The kind's own text is already scaled to its unit (10 MHz for 1e7 Hz): use it as written.
  if (c.text !== undefined && c.text !== "") return { value: String(c.text), unit: c.unit && c.unit !== "1" && c.unit !== "count" ? c.unit : "" };
  return { value: num(c.v) ? fmt(c.v) : String(c.v), unit: c.unit && c.unit !== "1" && c.unit !== "count" ? c.unit : "" };
}
const yourSetting = () => t("js-meaning-your-setting", "your setting");
// kpi.mjs marks an input echo with its "your setting" text; that mark is not part of a label.
const isYours = (sub) => sub === "your setting" || sub === yourSetting();
const cardLabel = (c) => (c.sub && !isYours(c.sub) ? t("js-meaning-card-label-sub", "{ $k }, { $sub }", { k: c.k, sub: c.sub }) : String(c.k)).replace(/\s*\([^)]*\)$/, "");

// Answer cards from the headline strip: outputs first; an input echo only when there is
// nothing else to show, marked "your setting".
export function genericCards(cards, max = 4) {
  const outs = cards.filter((c) => !c.input);
  const pool = outs.length >= 2 ? outs : [...outs, ...cards.filter((c) => c.input)];
  return pool.slice(0, max).map((c) => {
    const v = cardValue(c);
    return { label: cardLabel(c), value: v.value, unit: v.unit, sub: c.input ? yourSetting() : c.why || "", good: c.state === "pass", bad: c.state === "fail", path: c.path || "" };
  });
}

// Bookkeeping figures (how many runs or samples were made) describe the run, not the answer.
const META = /(runs_total|sweep\.runs|^samples$|n_cases|roc_points|state_dim|n_axes|\.n$)/i;
function generic(cards) {
  const outs = cards.filter((c) => !c.input);
  if (!outs.length && !cards.length) return { big: t("js-meaning-generic-none", "This run has no single headline figure; the chart below shows its result."), line: "", cards: [], generic: true };
  const first = outs.find((c) => !META.test(c.path || "")) || outs[0] || cards[0];
  const v = cardValue(first);
  const rest = outs.filter((c) => c !== first && !META.test(c.path || "")).slice(0, 2).map((c) => { const x = cardValue(c); return `${cardLabel(c).toLowerCase()} ${x.value}${x.unit ? " " + x.unit : ""}`; });
  return {
    big: t("js-meaning-generic-big", "{ $label }: { $value }.", { label: cardLabel(first), value: `${v.value}${v.unit ? " " + v.unit : ""}` }),
    line: rest.length > 1 ? t("js-meaning-generic-line-two", "Also from this run: { $a } and { $b }.", { a: rest[0], b: rest[1] }) : rest.length ? t("js-meaning-generic-line-one", "Also from this run: { $a }.", { a: rest[0] }) : "",
    cards: genericCards(cards),
    generic: true,
  };
}

// The meaning of a run: { big, line, cards, kind, generic }.
export function plainMeaning(result, toml = "") {
  if (!result || typeof result !== "object") return null;
  const kind = K.kindOfRun(result, toml) || "";
  const cards = kpis(result, toml, 6);
  const template = own(TEMPLATES, kind) || own(KIND_TEMPLATES, kind) || (PAIR_KINDS.includes(kind) ? pairOrEnsemble : () => null);
  let out = null;
  try { out = template(result, toml, cards); } catch { out = null; }
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
  const out = { kicker: t("js-meaning-kicker", "{ $domain } · { $title }", { domain: domainLabel, title: entry.title }), title, sub, seen: [...seen] };
  if (result) {
    const m = plainMeaning(result, toml);
    const s2 = new Set(seen);
    if (m) Object.assign(out, { big: spellOut(m.big, s2), line: spellOut(m.line, s2), cards: m.cards });
  }
  return out;
}
