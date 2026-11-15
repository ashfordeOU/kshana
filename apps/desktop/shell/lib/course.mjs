// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: course mode (0.42 U29). Guided lessons over the bundled scenarios
// (data/course/lessons.json): each step has its text, an optional "try changing" hint and a
// checkpoint the window checks against the lesson's tab (a run, the view shown, a setting the run
// used, a figure of the result, or a figure that rose or fell from the lesson's first run). The
// numbers are always the person's own runs; the lessons say what to look at, not what to find.
// Pure, no DOM; tested in course.test.mjs.

const num = (x) => typeof x === "number" && Number.isFinite(x);
const OPS = ["<", "<=", ">", ">=", "==", "!=", "increased", "decreased", "changed", "present"];

/** A value at a dotted path of a result (`budgets.0.time_to_exceed_s`), or undefined. */
export function valueAt(obj, path) {
  let v = obj;
  for (const p of String(path || "").split(".").filter(Boolean)) {
    if (v === null || typeof v !== "object") return undefined;
    v = v[/^\d+$/.test(p) && Array.isArray(v) ? Number(p) : p];
  }
  return v;
}

/** Compare `v` with `want` by `op` (`base` is the value at the lesson's first run, for increased and decreased). */
export function compare(v, op, want, base) {
  if (op === "present") return v !== undefined && v !== null;
  if (op === "changed") return v !== undefined && v !== base;
  if (op === "increased") return num(v) && num(base) && v > base;
  if (op === "decreased") return num(v) && num(base) && v < base;
  if (op === "==") return v === want || (num(v) && num(want) && Math.abs(v - want) <= 1e-12 * Math.max(1, Math.abs(want)));
  if (op === "!=") return v !== want;
  if (!num(v) || !num(want)) return false;
  return op === "<" ? v < want : op === "<=" ? v <= want : op === ">" ? v > want : op === ">=" ? v >= want : false;
}

/**
 * Check a lessons file: { ok, errors, lessons }. Every lesson needs an id, a title, a bundled
 * scenario, and steps with text; every checkpoint a known kind and operator.
 */
export function checkLessons(doc, { scenarios = null } = {}) {
  const errors = [];
  const lessons = Array.isArray(doc && doc.lessons) ? doc.lessons : [];
  if (!lessons.length) errors.push("no lessons");
  const ids = new Set();
  for (const l of lessons) {
    const at = `lesson ${l && l.id}`;
    if (!l || !/^[a-z0-9-]+$/.test(l.id || "")) { errors.push(`${at}: id`); continue; }
    if (ids.has(l.id)) errors.push(`${at}: the id is used twice`);
    ids.add(l.id);
    if (!l.title || !l.summary) errors.push(`${at}: title and summary`);
    if (!/\.toml$/.test(l.scenario || "")) errors.push(`${at}: scenario`);
    else if (scenarios && !scenarios.includes(l.scenario)) errors.push(`${at}: ${l.scenario} is not a bundled scenario`);
    if (!Array.isArray(l.steps) || !l.steps.length) { errors.push(`${at}: steps`); continue; }
    l.steps.forEach((s, i) => {
      if (!s || !s.text) errors.push(`${at} step ${i + 1}: text`);
      const c = s && s.check;
      if (!c) return;
      if (!["ran", "view", "setting", "result"].includes(c.kind)) errors.push(`${at} step ${i + 1}: check kind ${c.kind}`);
      if ((c.kind === "setting" || c.kind === "result") && !OPS.includes(c.op)) errors.push(`${at} step ${i + 1}: operator ${c.op}`);
      if (c.kind === "setting" && !/^[\w.[\]-]*::[\w-]+$/.test(c.key || "")) errors.push(`${at} step ${i + 1}: setting key ${c.key}`);
      if (c.kind === "result" && !c.path) errors.push(`${at} step ${i + 1}: result path`);
      if (c.kind === "view" && !c.view) errors.push(`${at} step ${i + 1}: view`);
      if (s.try && !/^[\w.[\]-]*::[\w-]+$/.test(s.try.key || "")) errors.push(`${at} step ${i + 1}: try key`);
    });
  }
  return { ok: !errors.length, errors, lessons };
}

/**
 * Whether a step's checkpoint is met by the lesson tab's state: { run: { result, toml } | null,
 * view, base: { result, toml } (the lesson's first run, or null), field(toml, key) → number }.
 * A step without a checkpoint is met. Returns { met, value, base }.
 */
export function checkStep(step, st) {
  const c = step && step.check;
  if (!c) return { met: true };
  const run = st.run;
  if (c.kind === "ran") return { met: !!run };
  if (c.kind === "view") return { met: st.view === c.view };
  if (!run) return { met: false };
  if (c.kind === "setting") {
    const v = st.field(run.toml, c.key);
    const base = st.base ? st.field(st.base.toml, c.key) : undefined;
    return { met: compare(v, c.op, c.value, base), value: v, base };
  }
  const v = valueAt(run.result, c.path);
  const base = st.base ? valueAt(st.base.result, c.path) : undefined;
  // a figure that should change needs a run other than the first
  if ((c.op === "increased" || c.op === "decreased" || c.op === "changed") && st.base && run === st.base) return { met: false, value: v, base };
  return { met: compare(v, c.op, c.value, base), value: v, base };
}

/** Progress kept per lesson: { [id]: { step, done } }, read back with bad entries dropped. */
export function readProgress(text) {
  let d;
  try { d = JSON.parse(text || "{}"); } catch { return {}; }
  const out = {};
  if (!d || typeof d !== "object") return out;
  for (const [k, v] of Object.entries(d)) if (/^[a-z0-9-]+$/.test(k) && v && Number.isInteger(v.step) && v.step >= 0) out[k] = { step: v.step, done: !!v.done };
  return out;
}

/** The value a setting has in a scenario's text, by `section::key` (lib/params.mjs ids), or undefined. */
export function fieldOf(fields, key) {
  const f = fields.find((x) => x.id === key);
  return f ? f.value : undefined;
}
