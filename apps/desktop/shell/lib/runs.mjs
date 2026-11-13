// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the runs of this session, their comparison, the command line that
// reproduces a run and the files of a run's evidence pack. Pure, no DOM; tested in
// ../shell.test.mjs.

/** The runs of this session, newest first, at most `max`. */
export function createRunLog(max = 200) {
  const runs = [];
  const selected = new Set();
  let next = 1;
  return {
    add(run) {
      const r = { ...run, id: next++ };
      runs.unshift(r);
      while (runs.length > max) selected.delete(runs.pop().id);
      return r;
    },
    list: () => runs.slice(),
    get: (id) => runs.find((r) => r.id === id) || null,
    get size() { return runs.length; },
    toggle(id, on) {
      if (!runs.some((r) => r.id === id)) return false;
      if (on === undefined ? !selected.has(id) : on) selected.add(id); else selected.delete(id);
      return selected.has(id);
    },
    isSelected: (id) => selected.has(id),
    /** The selected runs, oldest first (A then B). */
    selected: () => runs.filter((r) => selected.has(r.id)).reverse(),
    clearSelection: () => selected.clear(),
  };
}

const num = (x) => typeof x === "number" && Number.isFinite(x);
const cardKey = (c) => c.path || `${c.k}|${c.sub || ""}`;

/**
 * Rows comparing two runs' key-figure cards (web/studio/lib/kpi.mjs kpis()): one row per
 * figure either run has, A's order first. { key, label, sub, unit, a, b, delta, pct }
 * where a or b is null when that run lacks the figure, and delta/pct are null unless
 * both are numbers.
 */
export function compareRows(cardsA = [], cardsB = []) {
  const rows = [];
  const seen = new Set();
  const byB = new Map(cardsB.map((c) => [cardKey(c), c]));
  const push = (a, b) => {
    const c = a || b;
    const key = cardKey(c);
    if (seen.has(key)) return;
    seen.add(key);
    const av = a && num(a.v) ? a.v : null, bv = b && num(b.v) ? b.v : null;
    const delta = av !== null && bv !== null ? bv - av : null;
    const pct = delta !== null && av !== 0 ? (delta / Math.abs(av)) * 100 : null;
    rows.push({ key, label: c.k, sub: c.sub || "", unit: c.unit || "", a: a ? (num(a.v) ? a.v : a.text ?? null) : null, b: b ? (num(b.v) ? b.v : b.text ?? null) : null, delta, pct });
  };
  for (const a of cardsA) push(a, byB.get(cardKey(a)) || null);
  for (const b of cardsB) push(null, b);
  return rows;
}

/** A scenario file's name without .toml, safe for a shell line (anything else becomes "scenario"). */
export function scenarioName(file) {
  const n = String(file || "").replace(/\.toml$/, "");
  return /^[a-z0-9][a-z0-9._-]{0,100}$/.test(n) ? n : "scenario";
}

/**
 * The command line that reproduces a run with the command-line engine: the bundled example
 * when the run is of an unedited bundled scenario, else the saved file. Lines, no prose.
 */
export function reproduceLines({ file, bundled = true, edited = false } = {}) {
  const name = scenarioName(file);
  if (file && bundled && !edited) return [`kshana example ${name} > ${name}.toml`, `kshana ${name}.toml`];
  return [`kshana ${name}.toml`];
}

/** Whole time units since `at` (a Date or ms) at `now`: { n, unit } with unit s, min, h or d. */
export function elapsed(at, now = Date.now()) {
  const s = Math.max(0, Math.floor((now - +at) / 1000));
  if (s < 60) return { n: s, unit: "s" };
  if (s < 3600) return { n: Math.floor(s / 60), unit: "min" };
  if (s < 86400) return { n: Math.floor(s / 3600), unit: "h" };
  return { n: Math.floor(s / 86400), unit: "d" };
}

const hex = (buf) => Array.from(new Uint8Array(buf), (b) => b.toString(16).padStart(2, "0")).join("");

/**
 * The files of a run's evidence pack (unsigned): the scenario, the result, the engine's
 * summary, chart and table when it made them, and manifest.json with each file's SHA-256
 * and size. `digest(bytes)` returns the SHA-256 as an ArrayBuffer (crypto.subtle.digest
 * in the app). Returns [{ name, data }] for web/studio/lib/zip.mjs zip().
 */
export async function packFiles(run, { version = "", digest, readme = "" } = {}) {
  if (typeof digest !== "function") throw new Error("packFiles needs a digest function");
  const enc = new TextEncoder();
  const name = scenarioName(run.file);
  const files = [{ name: `${name}.toml`, data: String(run.toml || "") }, { name: `${name}.result.json`, data: JSON.stringify(run.result ?? null, null, 2) + "\n" }];
  if (run.summary) files.push({ name: "summary.txt", data: String(run.summary) + "\n" });
  if (run.svg) files.push({ name: `${name}.chart.svg`, data: String(run.svg) });
  if (run.csv) files.push({ name: `${name}.table.csv`, data: String(run.csv) });
  if (readme) files.push({ name: "README.txt", data: readme });
  const listed = [];
  for (const f of files) {
    const bytes = enc.encode(f.data);
    listed.push({ name: f.name, bytes: bytes.length, sha256: hex(await digest(bytes)) });
  }
  const r = run.result && typeof run.result === "object" ? run.result : {};
  const manifest = {
    format: "kshana-run-pack/1",
    signed: false,
    engine_version: r.engine_version || version || "",
    scenario: run.file || null,
    scenario_hash: r.scenario_hash || null,
    seed: num(r.seed) ? r.seed : null,
    files: listed,
  };
  return [...files, { name: "manifest.json", data: JSON.stringify(manifest, null, 2) + "\n" }];
}

/** The index a roving tab list moves to on a key: ArrowLeft/Right (wrapping), Home, End; null for any other key. */
export function tabKeyIndex(key, i, n) {
  if (!n) return null;
  if (key === "ArrowRight") return (i + 1) % n;
  if (key === "ArrowLeft") return (i - 1 + n) % n;
  if (key === "Home") return 0;
  if (key === "End") return n - 1;
  return null;
}
