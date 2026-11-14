// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the code mirror (0.42 U10). Every action in the window writes the
// Python line (the `kshana` package) and the command line that do the same, so the session
// can be pasted into Python and run again; and every figure can give the script that makes
// it. Pure, no DOM; tested in mirror.test.mjs.
//
// A run is written so that it reproduces: an unedited bundled scenario as
// kshana.get_example(name), anything else as the scenario's whole text; then kshana.run(),
// and a line that prints whether the result's SHA-256 is the one this window got. A text is
// written as a JSON string literal, which Python reads as the same string.
import { scenarioName } from "./runs.mjs";

/** A Python string literal for any text (a JSON string is one). */
export const pyStr = (s) => JSON.stringify(String(s));
/** A shell word, quoted when it needs to be. */
export const shWord = (s) => (/^[A-Za-z0-9_./:=@+-]+$/.test(String(s)) ? String(s) : `'${String(s).replace(/'/g, "'\\''")}'`);

export const PY_HEADER = ["import hashlib, json", "import kshana"];

/**
 * The lines of a run: { py, cli, vars } where vars names the Python variables it sets.
 * run: { n (the run's number in the console), file, bundled, edited, toml, resultSha }.
 */
export function runLines({ n, file, bundled = true, edited = false, toml = "", resultSha = "" }) {
  const name = scenarioName(file);
  const v = `toml_${n}`, o = `out_${n}`, r = `result_${n}`;
  const py = [];
  if (bundled && !edited) py.push(`${v} = kshana.get_example(${pyStr(name)})`);
  else py.push(`${v} = ${pyStr(toml)}`);
  py.push(`${o} = kshana.run(${v})`, `${r} = json.loads(${o})`);
  if (resultSha) py.push(`print("run ${n} reproduced:", hashlib.sha256(${o}.encode()).hexdigest() == ${pyStr(resultSha)})`);
  const cli = [];
  if (bundled && !edited) cli.push(`kshana example ${name} > ${name}.toml`);
  else cli.push(`cat > ${name}.toml <<'KSHANA_EOF'`, ...String(toml).replace(/\n$/, "").split("\n"), "KSHANA_EOF");
  cli.push(`kshana ${name}.toml`);
  return { py, cli, vars: { toml: v, out: o, result: r } };
}

/** The lines of a setting changed in the inputs: a comment (the run that follows carries the whole text). */
export function editLines({ section = "", key, raw, value, file }) {
  const where = section ? `[${section}] ${key}` : key;
  return { py: [`# ${scenarioName(file)}.toml: ${where} = ${value} (was ${raw}); the next run carries the whole edited text`], cli: [`# ${scenarioName(file)}.toml: set ${where} = ${value}`] };
}

/** The lines of an export of run `n`. */
export function exportLines({ n, what, file }) {
  const name = scenarioName(file);
  const r = `result_${n}`, v = `toml_${n}`, o = `out_${n}`;
  const py = {
    json: [`with open(${pyStr(`${name}.result.json`)}, "w") as f: f.write(${o})`],
    svg: [`with open(${pyStr(`${name}.chart.svg`)}, "w") as f: f.write(kshana.run_full(${v})[1])`],
    csv: [`kshana.run_typed(${v}).write_csv(${pyStr(`${name}.table.csv`)})`],
    toml: [`with open(${pyStr(`${name}.toml`)}, "w") as f: f.write(${v})`],
    pack: [`# the evidence pack: the scenario, ${r} and a SHA-256 manifest (the window writes the zip)`],
  }[what] || [`# export ${what}`];
  const cli = {
    json: [`# kshana ${name}.toml writes ${name}.result.json beside the scenario`],
    svg: [`# kshana ${name}.toml writes ${name}.chart.svg beside the scenario`],
    csv: [`# kshana ${name}.toml writes ${name}.table.csv beside the scenario`],
    toml: [`# ${name}.toml is the scenario file`],
    pack: [`# evidence pack of run ${n}: written by the window`],
  }[what] || [`# export ${what}`];
  return { py, cli };
}

/** A console of the session: entries in order, each { at, kind, title, py, cli }. */
export function createMirror(max = 2000) {
  const entries = [];
  let runs = 0;
  const subs = new Set();
  const push = (e) => {
    entries.push({ at: e.at || new Date().toISOString(), kind: e.kind || "action", title: String(e.title || ""), py: e.py || [], cli: e.cli || [] });
    while (entries.length > max) entries.shift();
    for (const f of subs) f(entries);
    return entries[entries.length - 1];
  };
  return {
    push,
    /** The next run number (the Python variables of a run are suffixed with it). */
    nextRun: () => ++runs,
    get runs() { return runs; },
    list: () => entries.slice(),
    get size() { return entries.length; },
    clear() { entries.length = 0; runs = 0; for (const f of subs) f(entries); },
    subscribe(f) { subs.add(f); return () => subs.delete(f); },
    /** Restore entries saved with a project. */
    load(list, runCount = 0) { entries.length = 0; for (const e of list || []) if (e && Array.isArray(e.py)) entries.push({ at: String(e.at || ""), kind: String(e.kind || "action"), title: String(e.title || ""), py: e.py.map(String), cli: (e.cli || []).map(String) }); runs = Math.max(runCount, 0); },
  };
}

/** The whole session as one Python script. */
export function sessionPython(entries) {
  const out = [...PY_HEADER, ""];
  for (const e of entries) {
    if (!e.py.length) continue;
    out.push(`# ${e.title || e.kind}`, ...e.py, "");
  }
  return out.join("\n");
}
/** The whole session as a shell script. */
export function sessionShell(entries) {
  const out = ["#!/bin/sh", "set -e", ""];
  for (const e of entries) {
    if (!e.cli.length) continue;
    out.push(`# ${e.title || e.kind}`, ...e.cli, "");
  }
  return out.join("\n");
}

// ---------------------------------------------------------------- figures
/**
 * Python lines that set `name` to the sky requests: one base request and the epochs when the
 * requests differ only in time_s (as the sky plot's do), else the list itself.
 */
export function skyRequestLines(reqs, name = "requests") {
  const strip = (q) => { const { time_s: _t, ...rest } = q; return JSON.stringify(rest); };
  if (reqs.length > 1 && reqs.every((q) => strip(q) === strip(reqs[0]))) {
    return [`${name}_base = json.loads(${pyStr(strip(reqs[0]))})`, `${name}_times = ${JSON.stringify(reqs.map((q) => q.time_s))}`, `${name} = [dict(${name}_base, time_s=t) for t in ${name}_times]`];
  }
  return [`${name} = json.loads(${pyStr(JSON.stringify(reqs))})`];
}
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const pyKey = (k) => (typeof k === "number" ? `[${k}]` : `[${pyStr(k)}]`);

/**
 * Where in an engine result a plotted series comes from: the path of an array of records and
 * the keys of x and y, such that taking [r[x], r[y]] of every record whose r[y] is a number
 * gives exactly `points`. { path: [...keys], x, y } or null. Searched to depth 4.
 */
export function findSeriesPath(result, points) {
  if (!result || !Array.isArray(points) || points.length < 2) return null;
  const want = points;
  const match = (arr, kx, ky) => {
    let j = 0;
    for (const r of arr) {
      if (!r || typeof r !== "object" || !isNum(r[ky])) continue;
      if (j >= want.length || r[kx] !== want[j][0] || r[ky] !== want[j][1]) return false;
      j++;
    }
    return j === want.length;
  };
  const seen = new Set();
  const walk = (node, path, depth) => {
    if (!node || typeof node !== "object" || depth > 4 || seen.has(node)) return null;
    seen.add(node);
    if (Array.isArray(node)) {
      const first = node.find((r) => r && typeof r === "object" && !Array.isArray(r));
      if (first && node.length >= want.length) {
        const keys = Object.keys(first).filter((k) => isNum(first[k]));
        for (const kx of keys) for (const ky of keys) if (kx !== ky && match(node, kx, ky)) return { path, x: kx, y: ky };
      }
      return null;
    }
    for (const [k, v] of Object.entries(node)) {
      const hit = walk(v, [...path, k], depth + 1);
      if (hit) return hit;
    }
    return null;
  };
  return walk(result, [], 0);
}

/**
 * The Python script that makes a figure of a run. fig: { kind: "chart" | "series" | "sky" |
 * "map", title, series: [{ label, points: [[x, y], ...] }], xLabel, yLabel, sky: { requests },
 * track: { lat, lon } }. The run is written as runLines writes it (variables suffixed 1).
 */
export function figureScript(run, fig) {
  const r = runLines({ ...run, n: 1 });
  const out = [`# ${fig.title || "figure"}: the script that makes it`, ...PY_HEADER, "", ...r.py, ""];
  const res = r.vars.result;
  if (fig.kind === "chart") {
    out.push("# the engine's own chart", `svg = kshana.run_full(${r.vars.toml})[1]`, `with open(${pyStr(`${scenarioName(run.file)}.chart.svg`)}, "w") as f: f.write(svg)`);
    return out.join("\n") + "\n";
  }
  if (fig.kind === "sky") {
    const reqs = (fig.sky && fig.sky.requests) || [];
    out.push("# the sky at each sampled epoch, from the engine (kshana.sky_geometry)", ...skyRequestLines(reqs, "requests"), "skies = [kshana.sky_geometry(q) for q in requests]",
      "for q, s in zip(requests, skies):", "    for sat in s[\"satellites\"]:", "        print(q[\"time_s\"], sat[\"id\"], sat[\"az_deg\"], sat[\"el_deg\"], sat[\"visible\"], sat[\"masked\"])");
    return out.join("\n") + "\n";
  }
  out.push("# the figure's data, taken from the result");
  const names = [];
  (fig.series || []).forEach((s, i) => {
    const hit = findSeriesPath(run.result, s.points);
    const nm = `s${i}`;
    names.push([nm, s.label]);
    if (hit) {
      const p = `${res}${hit.path.map(pyKey).join("")}`;
      out.push(`${nm} = [(r[${pyStr(hit.x)}], r[${pyStr(hit.y)}]) for r in ${p} if isinstance(r.get(${pyStr(hit.y)}), (int, float))]  # ${s.label}`);
    } else {
      out.push(`# ${s.label}: derived by the window from the result; its values as drawn`, `${nm} = json.loads(${pyStr(JSON.stringify(s.points))})`);
    }
  });
  if (fig.kind === "map" && fig.track) out.push(`track = json.loads(${pyStr(JSON.stringify(fig.track))})  # latitude and longitude as drawn`);
  out.push("", "import matplotlib.pyplot as plt", "fig, ax = plt.subplots()");
  if (fig.kind === "map" && fig.track) out.push('ax.plot(track["lon"], track["lat"], label="track")', 'ax.set_xlabel("longitude (deg)")', 'ax.set_ylabel("latitude (deg)")', 'ax.set_aspect("equal")');
  for (const [nm, label] of names) out.push(`ax.plot([p[0] for p in ${nm}], [p[1] for p in ${nm}], label=${pyStr(label)})`);
  if (fig.xLabel) out.push(`ax.set_xlabel(${pyStr(fig.xLabel)})`);
  if (fig.yLabel) out.push(`ax.set_ylabel(${pyStr(fig.yLabel)})`);
  if (fig.title) out.push(`ax.set_title(${pyStr(fig.title)})`);
  if (names.length > 1) out.push("ax.legend()");
  out.push("plt.show()");
  return out.join("\n") + "\n";
}
