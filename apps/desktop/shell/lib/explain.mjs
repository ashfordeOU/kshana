// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: explain this number (0.42 U11). For a figure of a run (a headline card,
// a key figure, a table row, a value at the time cursor) the window says where it comes from,
// using only what the engine and the scenario state:
//
//   the figure       its path in the result, the value and the unit the engine states
//   the model        the scenario kind, the engine modules that compute it (kind_modules), and
//                    the kind's method page (docs/kinds/by-kind/<kind>.md) when there is one
//   the engine's words  the units entry's definition (`note`), its provenance class, the figure's
//                    tier (figure_tiers), the kind's pass or fail reason, the result's own label
//   the inputs       the scenario's numeric settings, the ones the engine ranks first
//                    (field_importance) at the top; an input echoed back is said to be one
//   assumptions      the result's own assumptions and limitations lists
//   evidence         the tier and the verification-ledger rows the result names (the oracle of
//                    each row is in docs/VERIFICATION-MATRIX.md under the row's id)
//   hashes           the SHA-256 of the scenario and of the result, the engine version
//   sensitivity      on request: each top input moved by ±10 % and the run made again; the
//                    change of the figure as an elasticity (computed, never guessed)
//
// Nothing here is invented: a part the result does not state is left out and said to be absent.
// Pure, no DOM; tested in explain.test.mjs. `t` is the shell's message function.

const num = (x) => typeof x === "number" && Number.isFinite(x);
const en = (id, s, vars) => String(typeof s === "object" ? s.other : s).replace(/\{ \$([A-Za-z0-9_-]+) \}/g, (_, k) => (vars && vars[k] !== undefined ? String(vars[k]) : ""));

/** A value at a dotted path with [i] indexes (`quantum.fom.holdover_s`, `epochs[3].t_s`), or undefined. */
export function resolvePath(obj, path) {
  let cur = obj;
  for (const part of String(path).split(".")) {
    if (cur === null || cur === undefined) return undefined;
    const m = /^([^[\]]*)((?:\[\d+\])*)$/.exec(part);
    if (!m) return undefined;
    if (m[1]) cur = cur[m[1]];
    for (const ix of m[2].match(/\d+/g) || []) { if (!Array.isArray(cur)) return undefined; cur = cur[Number(ix)]; }
  }
  return cur;
}

/** The engine's units entry for a path: units[path] or its generic form (indexes as []). */
export function unitEntry(result, path) {
  const u = result && result.units;
  if (!u || typeof u !== "object" || !path) return null;
  const g = String(path).replace(/\[\d+\]/g, "[]");
  return u[path] || u[g] || u[`${g}[]`] || u[g.replace(/\[\]$/, "")] || null;
}

/**
 * Where a number sits in a result when the caller knows only the value: the first path (depth
 * 5, objects before arrays) whose value is exactly `value`; null when none or when it is ambiguous
 * between two different keys.
 */
export function findValuePath(result, value) {
  if (!num(value) || !result || typeof result !== "object") return null;
  const hits = [];
  const walk = (node, path, depth) => {
    if (hits.length > 3 || depth > 5 || !node || typeof node !== "object") return;
    const entries = Array.isArray(node) ? node.slice(0, 50).map((v, i) => [i, v]) : Object.entries(node);
    for (const [k, v] of entries) {
      if (k === "units" || k === "figure_tiers" || k === "evidence") continue;
      const p = Array.isArray(node) ? `${path}[${k}]` : path ? `${path}.${k}` : String(k);
      if (v === value) hits.push(p);
      else if (v && typeof v === "object") walk(v, p, depth + 1);
    }
  };
  walk(result, "", 0);
  if (!hits.length) return null;
  const leaf = (p) => p.split(".").pop().replace(/\[\d+\]/g, "");
  return hits.every((p) => leaf(p) === leaf(hits[0])) ? hits[0] : null;
}

/** The provenance classes of the engine's units schema (src/field_schema.rs ProvenanceClass), in plain words. */
export function provenanceText(cls, t = en) {
  switch (cls) {
    case "input": return t("js-desk-x-prov-input", "your setting, echoed back from the scenario (or its documented default)");
    case "modelled-input": return t("js-desk-x-prov-modelled-input", "a scenario default that is a modelled allocation, not a measurement");
    case "computed":
    case "derived": return t("js-desk-x-prov-computed", "computed by the engine from other fields of the same run");
    case "closed-form": return t("js-desk-x-prov-closed-form", "evaluated from a closed-form expression that can be checked by hand");
    case "spec": return t("js-desk-x-prov-spec", "a published device or system specification, reproduced");
    case "published": return t("js-desk-x-prov-published", "a figure quoted from a published reference, kept for comparison");
    case "constant": return t("js-desk-x-prov-constant", "a defined physical or mathematical constant");
    case "modelled": return t("js-desk-x-prov-modelled", "the output of a model whose magnitude is an assumption, not a measurement");
    case "internal-consistency": return t("js-desk-x-prov-internal", "a check of the run against itself, with an expected value known before the run");
    case "measured": return t("js-desk-x-prov-measured", "read from, or a statistic over, an observed series given as input");
    case "measured-or-input": return t("js-desk-x-prov-measured-or-input", "a measured floor unless the scenario overrides it, then that setting");
    default: return cls ? t("js-desk-x-prov-other", "provenance class { $cls }", { cls }) : "";
  }
}

/** The kinds with a method page under docs/kinds/by-kind/ (kept in step with the folder by explain.test.mjs). */
export function methodPage(kind, pages) {
  return kind && Array.isArray(pages) && pages.includes(kind) ? `docs/kinds/by-kind/${kind}.md` : null;
}

/** Text lists a result states about itself: assumptions, limitations, caveats, what it does not model. */
export function resultCaveats(result, max = 8) {
  const out = [];
  if (!result || typeof result !== "object") return out;
  const take = (v) => {
    if (typeof v === "string" && v.trim()) out.push(v.trim());
    else if (v && typeof v === "object" && !Array.isArray(v)) { const s = v.text || v.note || v.statement || v.limitation || v.assumption; if (typeof s === "string" && s.trim()) out.push(s.trim()); }
  };
  for (const [k, v] of Object.entries(result)) {
    if (!/assumption|limitation|caveat|not_modelled|not_validated/i.test(k)) continue;
    if (Array.isArray(v)) v.forEach(take); else take(v);
  }
  return [...new Set(out)].slice(0, max);
}

/** The engine's ranked headline fields of a kind (field_importance JSON parsed), as numericFields ids. */
export function headlineIds(importance, kind) {
  const e = importance && kind ? importance[kind] : null;
  const paths = e && Array.isArray(e.headline) ? e.headline : [];
  // "jammers[].eirp_dbw" -> section "jammers[0]" (the first element), key "eirp_dbw"
  return paths.map((p) => {
    const s = String(p).replace(/\[\]/g, "[0]");
    const i = s.lastIndexOf(".");
    return `${i < 0 ? "" : s.slice(0, i)}::${s.slice(i + 1)}`;
  });
}

/**
 * The inputs a figure depends on, as far as the scenario and the engine say: the engine's headline
 * fields first, then the other numeric settings in file order (at most `max`). Each { id, section,
 * key, value, raw, comment, headline, echo } where echo marks the field the figure echoes.
 */
export function figureInputs(fields, { importance = null, kind = "", path = "", value = NaN, max = 12 } = {}) {
  const ids = headlineIds(importance, kind);
  const rank = (f) => { const i = ids.indexOf(f.id); return i < 0 ? ids.length + 1 : i; };
  const leaf = String(path).split(".").pop();
  const blocks = String(path).split(".").slice(0, -1).join(".");
  return (fields || [])
    .map((f, n) => ({ f, n }))
    .sort((a, b) => rank(a.f) - rank(b.f) || a.n - b.n)
    .slice(0, max)
    .map(({ f }) => ({ id: f.id, section: f.section, key: f.key, value: f.value, raw: f.raw, comment: f.comment || "", headline: ids.includes(f.id),
      echo: f.key === leaf && (f.section === blocks || (!f.section && !blocks)) && (!num(value) || f.value === value) }));
}

/**
 * The explanation of one figure. fig: { path, value, unit, label, text } (path may be empty: then
 * it is looked for by value). ctx: { result, toml, fields (params.mjs numericFields of the toml),
 * kind, modules (kind_modules parsed), importance (field_importance parsed), pages (kinds with a
 * method page), state ({ state, why } from the key figures), tier ({ tier } from figure_tiers),
 * run: { scenarioSha, resultSha, engineVersion, engine, seed } }.
 */
export function explainFigure(fig, ctx = {}, t = en) {
  const r = ctx.result || {};
  let path = fig.path || "";
  let byValue = false;
  if (!path && num(fig.value)) { path = findValuePath(r, fig.value) || ""; byValue = !!path; }
  const value = path ? resolvePath(r, path) : fig.value;
  const u = path ? unitEntry(r, path) : null;
  const kind = ctx.kind || (typeof r.kind === "string" ? r.kind : "");
  const modules = kind && ctx.modules && Array.isArray(ctx.modules[kind]) ? ctx.modules[kind].map(String) : [];
  const ft = path && r.figure_tiers && Array.isArray(r.figure_tiers.figures) ? r.figure_tiers.figures.find((x) => x && x.path === path) : null;
  const ev = r.evidence && typeof r.evidence === "object" ? r.evidence : null;
  const rows = ev && Array.isArray(ev.rows) ? ev.rows.filter((x) => x && typeof x === "object").map((x) => ({ id: String(x.id || ""), requirement: String(x.requirement || ""), status: String(x.status || "").toUpperCase() })) : [];
  const words = [];
  if (u && typeof u.note === "string" && u.note) words.push({ k: "definition", text: u.note });
  if (ctx.state && ctx.state.why) words.push({ k: "state", text: ctx.state.why, state: ctx.state.state || "" });
  if (ft && typeof ft.note === "string" && ft.note) words.push({ k: "tier", text: ft.note });
  if (typeof r.label === "string" && r.label) words.push({ k: "label", text: r.label });
  else if (typeof r.note === "string" && r.note) words.push({ k: "label", text: r.note });
  const inputs = figureInputs(ctx.fields || [], { importance: ctx.importance, kind, path, value: num(value) ? value : NaN });
  const echo = (u && u.provenance === "input") || inputs.some((x) => x.echo);
  const run = ctx.run || {};
  return {
    label: fig.label || (path ? path.split(".").pop() : t("js-desk-x-figure", "figure")),
    path, byValue, value: num(value) ? value : fig.value, text: fig.text || "", unit: (u ? (u.unit && u.unit !== "1" ? u.unit : "") : fig.unit) || "",
    shown: fig.text !== undefined && fig.text !== "" ? `${fig.text}${fig.unit ? ` ${fig.unit}` : ""}` : "",
    provenance: u && u.provenance ? { cls: String(u.provenance), text: provenanceText(String(u.provenance), t) } : null,
    echo,
    model: { kind, modules, page: methodPage(kind, ctx.pages) },
    words,
    tier: ft && ft.tier ? String(ft.tier) : ev && ev.tier ? String(ev.tier).toUpperCase() : (ctx.tier && ctx.tier.tier) || "",
    tierFrom: ft && ft.tier ? "figure" : ev && ev.tier ? "result" : ctx.tier && ctx.tier.tier ? "label" : "",
    applicable: ft ? ft.applicable !== false : true,
    evidence: { rows, matrix: ev ? String(ev.matrix || "") : "" },
    inputs,
    caveats: resultCaveats(r),
    hashes: { scenario: run.scenarioSha || "", result: run.resultSha || "", engine: run.engineVersion || "", where: run.engine || "", seed: num(r.seed) ? r.seed : null },
  };
}

// ---------------------------------------------------------------- sensitivity
/**
 * The runs a one-at-a-time sensitivity needs: for each of the first `n` inputs that is not zero,
 * the value moved down and up by `frac` (integers rounded and kept distinct). [{ id, field, lo, hi }].
 */
export function sensitivityPlan(inputs, fields, { n = 4, frac = 0.1 } = {}) {
  const byId = new Map((fields || []).map((f) => [f.id, f]));
  const out = [];
  for (const x of inputs || []) {
    if (out.length >= n) break;
    const f = byId.get(x.id);
    if (!f || !num(f.value) || f.value === 0 || x.echo) continue;
    let lo = f.value * (1 - frac), hi = f.value * (1 + frac);
    if (f.integer) { lo = Math.round(lo); hi = Math.round(hi); if (lo === f.value) lo -= 1; if (hi === f.value) hi += 1; }
    out.push({ id: f.id, field: f, lo, hi });
  }
  return out;
}

/**
 * The sensitivity of a figure to one input from the two runs: { dydx, elasticity, lo, hi } where
 * elasticity = (Δy / y) / (Δx / x) by the central difference; null parts when a run gave no number.
 */
export function sensitivityOf(x0, y0, lo, ylo, hi, yhi) {
  if (![x0, y0, lo, hi].every(num) || !num(ylo) || !num(yhi) || hi === lo) return { dydx: null, elasticity: null, ylo: num(ylo) ? ylo : null, yhi: num(yhi) ? yhi : null };
  const dydx = (yhi - ylo) / (hi - lo);
  const elasticity = y0 !== 0 && x0 !== 0 ? dydx * (x0 / y0) : null;
  return { dydx, elasticity, ylo, yhi };
}
