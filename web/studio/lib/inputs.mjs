// SPDX-License-Identifier: AGPL-3.0-only
// Which inputs a task screen shows by default, and which wait under "Advanced settings".
// The engine publishes no importance metadata for scenario fields (research/STUDIO-UX-BASELINE.md
// section 7), so the order is derived, generically, from what exists:
//
//   tier 0  the scenario's headline settings: top-level fields (above any [section]) whose inline
//           comment gives them a plain name and whose key carries a physical unit (_m, _s, _db,
//           _deg, ...). Scenario authors put the question's own settings there. File order.
//   tier 1  the curated guided controls for the scenario: lib/kinds.mjs guidedFor() for a kind
//           that has its own list, else every lib/guided.mjs GUIDED_KNOBS entry the file has;
//           in their curated order.
//   tier 2  any other numeric field with a plain name and a physical unit, in file order.
//   tier 3  any other numeric field with a plain name from its comment, in file order.
//   tier 4  every remaining numeric field, in file order.
//   last    noise-draw and numerical-resolution settings (seed, time step, tolerances,
//           iteration caps): they change how a run is computed, not what is asked.
//
// At most VISIBLE_INPUTS show by default; the rest are listed, in the same order, under
// Advanced settings. Pure; tested in inputs.test.mjs.
import { plainLabel, fieldTerm } from "./kpi.mjs";

export const VISIBLE_INPUTS = 5;

// Settings that change how a run is computed rather than what it asks.
const TECHNICAL = /^(seed|step_s|dt_s|time_step_s|sample_step_s|schema_version|max_iter\w*|\w*_tol\w*|tol|rel_tol|abs_tol|stride|n_threads)$/i;
const UNIT_SUFFIX = /_(m|s|km|deg|rad|hz|khz|mhz|ghz|db|dbw|dbm|dbhz|dbi|ns|us|ms|pct|ppm|ppb|mps|m_s|kg|w|k|h|min|days?|au)$/i;

export const isTechnical = (key) => TECHNICAL.test(String(key));

// A readable name for a field: the scenario's own words, else the key made readable.
export function fieldName(f) {
  const plain = plainLabel(f.comment);
  if (plain) return plain;
  const k = String(f.key).replace(UNIT_SUFFIX, "").replace(/_/g, " ").trim();
  return k.charAt(0).toUpperCase() + k.slice(1);
}

// Rank every input of a scenario. `fields` is params.mjs numericFields(toml); `curated` is the
// list of guided controls, each { id: "section::key", label, hint, ... }. Returns
// [{ id, tier, curated, field, label, term, hint }] best first, one entry per field id
// (a curated control whose field is not a single number is kept, with field null).
export function rankInputs(fields, curated = []) {
  const out = [];
  const seen = new Set();
  const keyOf = (id) => String(id).split("::").pop();
  const plainUnit = (f) => !!plainLabel(f.comment) && UNIT_SUFFIX.test(f.key);
  const curatedIds = new Set(curated.map((c) => c.id));
  // Tier 0: the headline settings at the top of the file.
  fields.forEach((f, n) => {
    if (f.section || isTechnical(f.key) || !plainUnit(f) || seen.has(f.id)) return;
    seen.add(f.id);
    const c = curatedIds.has(f.id) ? curated.find((x) => x.id === f.id) : null;
    out.push({ id: f.id, tier: 0, order: n, curated: c, field: f, label: fieldName(f), term: f.key, hint: c && c.hint ? c.hint : "" });
  });
  curated.forEach((c, n) => {
    if (seen.has(c.id)) return;
    seen.add(c.id);
    const field = fields.find((f) => f.id === c.id) || null;
    out.push({ id: c.id, tier: isTechnical(keyOf(c.id)) ? 9 : 1, order: n, curated: c, field, label: c.label, term: field ? field.key : keyOf(c.id), hint: c.hint || (field ? field.comment : "") });
  });
  fields.forEach((f, n) => {
    if (seen.has(f.id)) return;
    seen.add(f.id);
    const plain = !!plainLabel(f.comment);
    const tier = isTechnical(f.key) ? 9 : plainUnit(f) ? 2 : plain ? 3 : 4;
    out.push({ id: f.id, tier, order: n, curated: null, field: f, label: fieldName(f), term: f.key, hint: f.comment && !plain ? f.comment : "" });
  });
  return out.sort((a, b) => a.tier - b.tier || a.order - b.order);
}

// Split a ranking into what shows by default and what waits under Advanced settings.
export function splitInputs(ranked, budget = VISIBLE_INPUTS) {
  const n = Math.max(0, Math.min(VISIBLE_INPUTS, budget));
  return { visible: ranked.slice(0, n), advanced: ranked.slice(n) };
}

// The label shown with an input: "Horizontal alert limit (AL_H)", the plain words first.
export function inputLabel(item) {
  const term = item.field ? fieldTerm(item.field.key) : "";
  // No term when the label already says it in words ("Tracking threshold" for TRACKING_THRESHOLD).
  const words = term.toLowerCase().replace(/_/g, " ");
  return { text: item.label, term: term && !item.label.toUpperCase().includes(term) && !item.label.toLowerCase().includes(words) ? term : "" };
}
