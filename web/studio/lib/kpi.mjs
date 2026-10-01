// SPDX-License-Identifier: AGPL-3.0-only
// The dashboard's key-figure strip: 4 to 6 headline readouts of a run, each read from the
// result at a named path, with a state where the kind defines pass or fail against a
// threshold the result itself states, and a delta against an earlier run. Pure, no DOM.
import * as K from "./kinds.mjs";
import * as V from "./views.mjs";
import { buildFomRows, figureTier } from "./tabs.mjs";
import { fomTier } from "./report.mjs";
import { numericFields } from "./params.mjs";

// The run's honesty label: VALIDATED, MODELLED or PARTNER, from the result's own label or
// its per-figure tiers. { tier, text } or null when the result states neither.
export function honesty(result) {
  if (!result || typeof result !== "object") return null;
  const t = typeof result.label === "string" ? result.label : typeof result.note === "string" ? result.note : "";
  const m = t.match(/^(VALIDATED|MODELLED|PARTNER)/);
  const figs = result.figure_tiers && Array.isArray(result.figure_tiers.figures) ? result.figure_tiers.figures : [];
  const v = figs.filter((f) => f.tier === "VALIDATED").length, mo = figs.filter((f) => f.tier === "MODELLED").length, p = figs.filter((f) => f.tier === "PARTNER").length;
  if (m) return { tier: m[1], text: t };
  if (figs.length) {
    const tier = p && !v && !mo ? "PARTNER" : v && !mo && !p ? "VALIDATED" : "MODELLED";
    const parts = [v ? `${v} validated` : "", mo ? `${mo} modelled` : "", p ? `${p} partner-owned` : ""].filter(Boolean).join(", ");
    return { tier, text: `Figure tiers: ${parts}.` };
  }
  return null;
}

const num = (x) => typeof x === "number" && Number.isFinite(x);

// The scenario field a result path echoes, when the path names one exactly: `al_h_m` is the
// top-level field al_h_m, `receiver.tracking_threshold_dbhz` the field in [receiver].
function fieldFor(toml, path) {
  if (!path || !toml || /\[/.test(path)) return null;
  const i = path.lastIndexOf(".");
  const id = `${i < 0 ? "" : path.slice(0, i)}::${path.slice(i + 1)}`;
  return numericFields(toml).find((f) => f.id === id) || null;
}

// The term for a field name: the key without its unit suffix, in capitals (al_h_m -> AL_H).
export function fieldTerm(key) {
  return String(key).replace(/_(m|s|km|deg|rad|hz|khz|mhz|db|dbw|dbm|dbhz|dbi|ns|us|ms|pct|ppm|ppb|mps|m_s)$/i, "").toUpperCase();
}

// A plain label for a field, from the scenario's own inline comment (never invented):
// "horizontal alert limit (APV-I)" -> "Horizontal alert limit". Null when there is none.
export function plainLabel(comment) {
  const t = String(comment || "").replace(/\s*\([^)]*\)\s*$/, "").trim();
  // A label names something: at least two words of three letters or more ("12 h" is a value note).
  if (!t || t.length > 60 || (t.match(/[a-z]{3,}/gi) || []).length < 2) return null;
  return t.charAt(0).toUpperCase() + t.slice(1);
}

// Does a card only echo a value the reader set? The engine's units block says so
// (provenance "input"); without it, a figure equal to the scenario field it is named after is
// an echo. Returns true, false, or null when nothing says either way.
export function isInputEcho(result, toml, card) {
  if (!card || !card.path) return null;
  const u = K.unitOf(result, card.path);
  if (u && typeof u.provenance === "string") return u.provenance === "input";
  const f = fieldFor(toml, card.path);
  return f && num(card.v) && f.value === card.v ? true : null;
}

// Rank the cards so outputs, which answer the scenario's question, come before inputs echoed
// back. A stable sort: within each group the order is the one the kind chose.
function rankCards(result, toml, cards) {
  const rank = (c) => (c.input ? 2 : c.input === false ? 0 : 1);
  return cards
    .map((c, n) => ({ c, n }))
    .sort((a, b) => rank(a.c) - rank(b.c) || a.n - b.n)
    .map((x) => x.c);
}

// Mark input echoes, and give a raw field name the scenario's own words for it.
function annotate(result, toml, c) {
  const input = isInputEcho(result, toml, c);
  const out = { ...c, input };
  const f = fieldFor(toml, c.path);
  const plain = f && plainLabel(f.comment);
  if (plain && c.generic) { out.k = plain; out.term = fieldTerm(f.key); }
  if (input && !out.sub) out.sub = "your setting";
  delete out.generic;
  return out;
}

// The headline cards: kinds.mjs FIGURES for the newer kinds, the figures of merit for clocks,
// else the documented numeric figures. Outputs come first, input echoes after (see rankCards).
export function headline(result, toml = "", max = 6) {
  const pool = rawHeadline(result, toml, Math.max(max * 4, 24)).map((c) => annotate(result, toml, c));
  return rankCards(result, toml, pool).slice(0, max);
}

function rawHeadline(result, toml = "", max = 6) {
  const r = result;
  if (!r || typeof r !== "object") return [];
  const capFigs = K.capabilityFigures(r, toml, max);
  // A chained campaign names few headline figures: add each channel's value at the end of the
  // mission, read from the timeline, until the strip has four.
  if (capFigs.length && capFigs.length < 4 && r.timeline && r.timeline.channels && Array.isArray(r.timeline.t_s)) {
    const last = r.timeline.t_s.length - 1;
    for (const [key, ch] of Object.entries(r.timeline.channels)) {
      if (capFigs.length >= Math.min(4, max)) break;
      const path = `timeline.channels.${key}.values[${last}]`, v = K.resolve(r, path);
      if (!num(v)) continue;
      const q = K.quantity(v, ch.unit || "");
      capFigs.push({ path, label: (K.keyLabel(key).charAt(0).toUpperCase() + K.keyLabel(key).slice(1)), note: ch.label || "", sub: "at the end of the mission", value: v, text: q.text, unit: q.unit });
    }
  }
  if (capFigs.length) return capFigs.map((x) => { const ft = figureTier(r, x.path); return { k: x.label, sub: x.sub, text: x.text, v: x.value, unit: x.unit, tier: ft ? ft.tier : "", title: x.note, path: x.path }; });
  const rows = buildFomRows(r);
  if (rows.length) return rows.filter((x) => x.applicable !== false).slice(0, max).map((x) => ({ k: x.label, sub: x.clockLabel, v: x.value, unit: x.unit, tier: x.tier || fomTier(x.metric), title: "" }));
  return V.keyFigures(r, max).map((x) => { const ft = figureTier(r, x.path); return { k: x.label, v: x.value, unit: x.unit, tier: ft ? ft.tier : "", title: x.note, path: x.path, generic: true }; });
}

// Pass or fail where the kind defines it, against a threshold the result states.
// Returns { state: "pass"|"fail"|"warn", why } or null.
export function stateOf(result, toml, card) {
  const kind = K.kindOfRun(result, toml);
  const p = card.path || "";
  if (kind === "constellation-design") {
    const thr = K.resolve(result, "inputs.pdop_threshold");
    if (/availability_pct$/.test(p) && num(card.v)) return card.v >= 100 ? { state: "pass", why: `available everywhere, every epoch${num(thr) ? ` (PDOP, position dilution of precision, under ${V.fmt(thr)})` : ""}` } : { state: "warn", why: `${V.fmt(100 - card.v)} % of the time or places without a fix${num(thr) ? ` at PDOP under ${V.fmt(thr)}` : ""}` };
    if (/pdop\.(p95|median|max)$/.test(p) && num(thr) && num(card.v)) return card.v <= thr ? { state: "pass", why: `under the PDOP threshold ${V.fmt(thr)}` } : { state: "fail", why: `over the PDOP threshold ${V.fmt(thr)}` };
  }
  if (kind === "spectrum") {
    const thr = K.resolve(result, "receiver.tracking_threshold_dbhz");
    if (/min_cn0_dbhz$/.test(p) && num(thr) && num(card.v)) return card.v >= thr ? { state: "pass", why: `stays above the ${V.fmt(thr)} dB-Hz tracking threshold` } : { state: "fail", why: `drops under the ${V.fmt(thr)} dB-Hz tracking threshold: lock lost` };
  }
  if (kind === "leo-navmsg" && p === "midpass_update.max_range_jump_m") {
    const thr = K.resolve(result, "midpass_update.threshold_m");
    if (num(thr) && num(card.v)) return card.v <= thr ? { state: "pass", why: `under the ${V.fmt(thr)} m jump threshold` } : { state: "fail", why: `over the ${V.fmt(thr)} m jump threshold` };
  }
  return null;
}

// The strip: headline cards with state. At most `max`.
export function kpis(result, toml = "", max = 6) {
  return headline(result, toml, max).map((c) => ({ ...c, ...(stateOf(result, toml, c) || { state: "", why: "" }) }));
}

// Identity of a card across runs.
export const kpiKey = (c) => c.path || `${c.k}|${c.sub || ""}`;

// The change of each card against an earlier run's strip: { d, text, dir } or null.
export function kpiDelta(card, prevCards) {
  if (!prevCards || !num(card.v)) return null;
  const p = prevCards.find((x) => kpiKey(x) === kpiKey(card));
  if (!p || !num(p.v)) return null;
  const d = card.v - p.v;
  if (d === 0) return { d: 0, text: "no change", dir: "flat" };
  const rel = p.v !== 0 ? ` (${d > 0 ? "+" : "−"}${Math.abs((d / Math.abs(p.v)) * 100).toFixed(Math.abs(d / p.v) < 0.1 ? 1 : 0)} %)` : "";
  return { d, text: `${d > 0 ? "+" : "−"}${V.fmt(Math.abs(d))}${card.unit ? ` ${card.unit}` : ""}${rel}`, dir: d > 0 ? "up" : "down" };
}
