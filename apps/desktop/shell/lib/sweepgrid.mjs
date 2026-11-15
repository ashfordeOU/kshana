// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the sweep studio (0.42 U21). A scenario is run across a grid of one or
// two of its numeric settings; the figure chosen is read from every run's result and shown as a
// curve (one axis) or a heat map (two axes); a run that fails is kept as a failure on the map;
// any cell opens as an ordinary run. The window drives the runs itself (several at once on the
// native engine, so every core works), so it can show progress and stop between runs.
//
// The same grid is what the engine's own `sweep-nd` kind computes (src/sweep.rs
// run_generic_sweep: dotted TOML keys, dotted JSON metric paths, row-major, last axis fastest),
// and the code console writes it that way, so the sweep reproduces in Python or on the command
// line in one engine call. Pure, no DOM; tested in sweepgrid.test.mjs.
import { resolvePath } from "./explain.mjs";

export const MAX_STEPS = 41;
export const MAX_CELLS = 900;
const num = (x) => typeof x === "number" && Number.isFinite(x);

/**
 * The values along an axis: { from, to, steps, scale ("lin" | "log"), integer }. Endpoints are
 * exact; a log axis needs both ends positive (else it is spaced linearly); an integer axis is
 * rounded and loses repeats. Steps are kept between 2 and MAX_STEPS.
 */
export function axisValues({ from, to, steps = 5, scale = "lin", integer = false }) {
  if (!num(from) || !num(to)) return [];
  const n = Math.max(2, Math.min(MAX_STEPS, Math.round(steps) || 2));
  const log = scale === "log" && from > 0 && to > 0;
  const out = [];
  for (let i = 0; i < n; i++) {
    const f = i / (n - 1);
    out.push(i === 0 ? from : i === n - 1 ? to : log ? Math.exp(Math.log(from) + (Math.log(to) - Math.log(from)) * f) : from + (to - from) * f);
  }
  if (!integer) return out;
  const seen = new Set();
  return out.map(Math.round).filter((v) => (seen.has(v) ? false : (seen.add(v), true)));
}

/** A default range for a setting: from half to twice its value (or −1 to 1 around zero). */
export function defaultRange(f) {
  const v = f.value;
  if (!num(v) || v === 0) return { from: f.integer ? 0 : -1, to: f.integer ? 10 : 1 };
  const a = v / 2, b = v * 2;
  return f.integer ? { from: Math.round(Math.min(a, b)), to: Math.round(Math.max(a, b)) } : { from: Math.min(a, b), to: Math.max(a, b) };
}

/**
 * The cells of a grid of one or two axes ([{ field, values }]): [{ k, i, j, coords }] in the
 * engine's order (row-major, the last axis fastest). Null when the grid has more than MAX_CELLS.
 */
export function gridCells(axes) {
  const a = axes[0], b = axes[1] || null;
  if (!a || !a.values.length) return [];
  const nb = b ? b.values.length : 1;
  if (a.values.length * nb > MAX_CELLS) return null;
  const out = [];
  for (let i = 0; i < a.values.length; i++) for (let j = 0; j < nb; j++) out.push({ k: out.length, i, j, coords: b ? [a.values[i], b.values[j]] : [a.values[i]] });
  return out;
}

/**
 * The scenario text of a cell: each axis's field set to the cell's value with `patch` (params.mjs
 * patchField). A field written as a whole number takes fractions unless the axis says `integer`
 * (a seed or a count must stay whole; a power written "10" need not).
 */
export function cellToml(toml, axes, coords, patch) {
  let text = toml;
  axes.forEach((ax, n) => { text = patch(text, { ...ax.field, integer: ax.integer === undefined ? !!ax.field.integer : !!ax.integer }, coords[n]); });
  return text;
}

/** The figure a cell's result gives at `path` (a number), or null. */
export function metricOf(result, path) {
  const v = resolvePath(result, path);
  return num(v) ? v : null;
}

/**
 * Run `tasks` (an array) with at most `concurrency` at once: `run(task)` returns a promise;
 * `onDone(task, value, error)` is called as each one ends; `stopped()` is asked before each
 * start, so a cancel lets the runs in flight finish and starts no more. Resolves with
 * { done, failed, stopped }.
 */
export async function runPool(tasks, { concurrency = 1, run, onDone = () => {}, stopped = () => false }) {
  let next = 0, done = 0, failed = 0;
  const worker = async () => {
    while (next < tasks.length && !stopped()) {
      const task = tasks[next++];
      try { onDone(task, await run(task), null); }
      catch (e) { failed++; onDone(task, null, e); }
      done++;
    }
  };
  await Promise.all(Array.from({ length: Math.max(1, Math.min(concurrency, tasks.length)) }, worker));
  return { done, failed, stopped: next < tasks.length };
}

/**
 * The grid's figures for drawing: { x, y (null for one axis), z (rows over y, columns over x;
 * NaN where a run gave no number), state (rows of "ok" | "failed" | "missing" | "pending"),
 * min, max, ok, failed }.
 */
export function gridModel(axes, cells) {
  const a = axes[0], b = axes[1] || null;
  const nx = a.values.length, ny = b ? b.values.length : 1;
  const z = Array.from({ length: ny }, () => new Array(nx).fill(NaN));
  const state = Array.from({ length: ny }, () => new Array(nx).fill("pending"));
  let min = Infinity, max = -Infinity, ok = 0, failed = 0;
  for (const c of cells) {
    const row = c.j, col = c.i;
    if (c.error) { state[row][col] = "failed"; failed++; continue; }
    if (c.value === undefined) continue;
    if (num(c.value)) { z[row][col] = c.value; state[row][col] = "ok"; ok++; min = Math.min(min, c.value); max = Math.max(max, c.value); }
    else state[row][col] = "missing";
  }
  return { x: a.values, y: b ? b.values : null, z, state, min: ok ? min : NaN, max: ok ? max : NaN, ok, failed };
}

/** Where a value sits between min and max, in [0, 1] (0.5 when they are equal). */
export const shade = (v, min, max) => (!num(v) ? NaN : max > min ? Math.max(0, Math.min(1, (v - min) / (max - min))) : 0.5);

/** The dotted TOML key of a params.mjs field for the engine's sweep (`jammers[0]` → `jammers.0`). */
export function dottedKey(field) {
  const sec = String(field.section || "").replace(/\[(\d+)\]/g, (_, d) => `.${d}`);
  return sec ? `${sec}.${field.key}` : field.key;
}

/**
 * The scenario put under `[base]` for the engine's sweep-nd kind: every table header gains the
 * `base.` prefix and the top-level keys go under `[base]`. Multi-line strings are kept as they are.
 */
export function nestUnderBase(toml) {
  const out = ["[base]"];
  let inStr = false;
  for (const line of String(toml).replace(/\r\n/g, "\n").split("\n")) {
    const q = (line.match(/"""|'''/g) || []).length;
    if (!inStr) {
      const aot = /^(\s*)\[\[\s*([^\]]+?)\s*\]\](.*)$/.exec(line);
      const tbl = !aot && /^(\s*)\[\s*([^\]]+?)\s*\](.*)$/.exec(line);
      if (aot) { out.push(`${aot[1]}[[base.${aot[2]}]]${aot[3]}`); if (q % 2) inStr = !inStr; continue; }
      if (tbl) { out.push(`${tbl[1]}[base.${tbl[2]}]${tbl[3]}`); if (q % 2) inStr = !inStr; continue; }
    }
    out.push(line);
    if (q % 2) inStr = !inStr;
  }
  return out.join("\n");
}

/** The engine's sweep-nd scenario of a grid (axes with field, from, to, steps, scale) and a metric path. */
export function sweepNdToml(toml, axes, metricPath) {
  const lines = [
    "# The window's sweep as the engine's own sweep-nd scenario (src/sweep.rs): the same grid, run in one call.",
    'kind = "sweep-nd"',
    `metrics = [${JSON.stringify(metricPath)}]`,
    "",
  ];
  for (const ax of axes) {
    lines.push("[[axes]]", `key = ${JSON.stringify(dottedKey(ax.field))}`, `start = ${fmtToml(ax.from)}`, `stop = ${fmtToml(ax.to)}`, `steps = ${ax.values.length}`);
    if (ax.scale === "log" && ax.from > 0 && ax.to > 0) lines.push('scale = "log"');
    lines.push("");
  }
  return `${lines.join("\n")}${nestUnderBase(toml).replace(/\n*$/, "\n")}`;
}
const fmtToml = (v) => (Number.isInteger(v) ? `${v}.0` : String(v));

/** The sweep's Python and command lines for the code console. */
export function sweepLines({ n, toml, axes, metricPath, name }) {
  const text = sweepNdToml(toml, axes, metricPath);
  const v = `sweep_${n}`;
  const file = `${String(name || "scenario").replace(/\.toml$/, "")}-sweep.toml`;
  return {
    py: [`${v}_toml = ${JSON.stringify(text)}`, `${v} = json.loads(kshana.run(${v}_toml))`, `for p in ${v}["points"]:`, `    print(p["coords"], p["metrics"])`],
    cli: [`cat > ${file} <<'KSHANA_EOF'`, ...text.replace(/\n$/, "").split("\n"), "KSHANA_EOF", `kshana ${file}`],
    text,
  };
}

/** The grid as CSV: one row per cell, the axes' values, the figure and the state. */
export function gridCsv(axes, cells, metricLabel) {
  const head = [...axes.map((a) => dottedKey(a.field)), metricLabel || "value", "state"];
  const rows = cells.map((c) => [...c.coords.map(String), num(c.value) ? String(c.value) : "", c.error ? "failed" : c.value === undefined ? "pending" : num(c.value) ? "ok" : "missing"]);
  return [head, ...rows].map((r) => r.map((x) => (/[",\n]/.test(x) ? `"${x.replace(/"/g, '""')}"` : x)).join(",")).join("\n") + "\n";
}
