// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: runs kept on disk and project folders (0.42 U8). A project is a folder
// whose name ends in .kshana, of plain text files a person can read, diff and keep under
// version control:
//
//   project.json                 format, name, when it was made
//   scenarios/<name>.toml        the scenarios of the open tabs (as edited)
//   runs/<uid>/run.json          what the run was: title, scenario file, engine and version,
//                                the SHA-256 of the scenario and of the result, seed, time,
//                                tags, pin and note
//   runs/<uid>/scenario.toml     the scenario text the run was made from (its recipe)
//   runs/<uid>/result.json       the engine's result, byte for byte as the engine wrote it
//   runs/<uid>/summary.txt, chart.svg, table.csv   when the engine made them
//   data/links.json              data files the project uses, by path, with size and format
//   notebooks/notes.md           the project's notes
//   notebooks/console.json       the code mirror's entries (lib/mirror.mjs)
//   layouts/session.json         the open tabs, their views, the clock and markers of each,
//                                the selected runs and the page shown
//
// Replay: running a run's scenario.toml again with the same engine version must give the
// same result bytes; replayCheck() compares the SHA-256 of the two. Pure, no DOM; tested in
// project.test.mjs. The files are written by the app's native side (project_save) into the
// folder and nowhere else.

export const PROJECT_FORMAT = "kshana-project/1";
export const RUN_FORMAT = "kshana-run/1";
export const LAYOUT_FORMAT = "kshana-layout/1";

const hex = (buf) => Array.from(new Uint8Array(buf), (b) => b.toString(16).padStart(2, "0")).join("");
/** SHA-256 of a text as hex; `digest` is crypto.subtle.digest-like (bytes in, ArrayBuffer out). */
export async function sha256Text(text, digest) {
  return hex(await digest(new TextEncoder().encode(String(text))));
}

/** A run's id on disk: its time (UTC, to the millisecond) and a counter, safe as a folder name. */
export function runUid(at, seq) {
  const d = new Date(+at);
  const p = (n, w = 2) => String(n).padStart(w, "0");
  const stamp = Number.isNaN(+d) ? "00000000T000000000" : `${d.getUTCFullYear()}${p(d.getUTCMonth() + 1)}${p(d.getUTCDate())}T${p(d.getUTCHours())}${p(d.getUTCMinutes())}${p(d.getUTCSeconds())}${p(d.getUTCMilliseconds(), 3)}`;
  return `${stamp}-${p(seq, 3)}`;
}
const UID = /^\d{8}T\d{9}-\d{3,}$/;
export const isRunUid = (s) => typeof s === "string" && UID.test(s);

/** A project folder name for a title: letters, digits, spaces, - and _, then .kshana. */
export function projectFolderName(title) {
  const base = String(title || "").normalize("NFKC").replace(/[^\p{L}\p{N} _-]+/gu, " ").replace(/\s+/g, " ").trim().slice(0, 80) || "Untitled";
  return `${base}.kshana`;
}
/** Join a folder and a name with the folder's own separator. */
export function joinPath(dir, name) {
  const sep = String(dir).includes("\\") && !String(dir).includes("/") ? "\\" : "/";
  return `${String(dir).replace(/[\\/]+$/, "")}${sep}${name}`;
}

const scenarioFile = (name) => `scenarios/${String(name || "scenario").replace(/\.toml$/, "").replace(/[^A-Za-z0-9._-]+/g, "-").replace(/^[.-]+/, "").slice(0, 100) || "scenario"}.toml`;
const clean = (s, max = 4000) => String(s ?? "").slice(0, max);
const cleanTags = (tags) => [...new Set((Array.isArray(tags) ? tags : []).map((x) => String(x).trim().toLowerCase().replace(/\s+/g, "-")).filter((x) => /^[\p{L}\p{N}._-]{1,40}$/u.test(x)))].slice(0, 20);

/** The meta of a run as run.json holds it. */
export function runMeta(run) {
  return {
    format: RUN_FORMAT, uid: run.uid, title: clean(run.title, 200), file: clean(run.file, 200), domain: run.domain || null,
    custom: !!run.custom, edited: !!run.edited, at: new Date(+run.at).toISOString(), ms: Number.isFinite(run.ms) ? Math.round(run.ms) : null,
    engine: run.engine || "", engine_version: run.engineVersion || "", seed: Number.isFinite(run.result && run.result.seed) ? run.result.seed : null,
    scenario_sha256: run.scenarioSha || "", result_sha256: run.resultSha || "",
    tags: cleanTags(run.tags), pinned: !!run.pinned, note: clean(run.note), console_run: Number.isFinite(run.console) ? run.console : null,
  };
}

/**
 * The files of a project: [{ path, text }]. state: { name, created, runs (each with uid,
 * toml, json (the engine's result text), summary, svg, csv and the meta fields), tabs (each
 * { key, file, title, custom, domain, toml, baseToml, view, ins, runUid, clock: { t, range,
 * marks } }), active (a tab key), route, selected (run uids), links, notes, console }.
 */
export function projectFiles(state) {
  const files = [];
  const add = (path, text) => files.push({ path, text: String(text) });
  add("project.json", JSON.stringify({ format: PROJECT_FORMAT, name: clean(state.name, 200), created: state.created || new Date(0).toISOString() }, null, 2) + "\n");
  for (const r of state.runs || []) {
    if (!isRunUid(r.uid)) continue;
    const d = `runs/${r.uid}`;
    add(`${d}/run.json`, JSON.stringify(runMeta(r), null, 2) + "\n");
    add(`${d}/scenario.toml`, r.toml || "");
    add(`${d}/result.json`, typeof r.json === "string" ? r.json : JSON.stringify(r.result ?? null));
    if (r.summary) add(`${d}/summary.txt`, r.summary);
    if (r.svg) add(`${d}/chart.svg`, r.svg);
    if (r.csv) add(`${d}/table.csv`, r.csv);
  }
  const tabs = [];
  const used = new Map();
  for (const t of state.tabs || []) {
    let path = null;
    if (t.toml && (t.custom || t.toml !== t.baseToml)) {
      path = scenarioFile(t.custom ? t.file : `${String(t.file || "").replace(/\.toml$/, "")}-edited`);
      // two tabs of the same name: the second gets a number
      const k = used.get(path) || 0;
      used.set(path, k + 1);
      if (k) path = path.replace(/\.toml$/, `-${k + 1}.toml`);
      add(path, t.toml);
    }
    tabs.push({
      key: String(t.key), file: clean(t.file, 200), title: clean(t.title, 200), custom: !!t.custom, domain: t.domain || null,
      scenario: path, view: t.view || "chart", ins: t.ins || "inputs", run: isRunUid(t.runUid) ? t.runUid : null,
      clock: t.clock ? { t: Number.isFinite(t.clock.t) ? t.clock.t : null, range: Array.isArray(t.clock.range) ? t.clock.range.slice(0, 2) : null, marks: (t.clock.marks || []).filter((m) => Number.isFinite(m.t)).map((m) => ({ t: m.t, label: clean(m.label, 80) })) } : null,
      markers: Array.isArray(t.markers) ? t.markers.filter((m) => Number.isFinite(m.t)).slice(0, 2).map((m) => ({ t: m.t, series: clean(m.series, 80) })) : [],
    });
  }
  add("layouts/session.json", JSON.stringify({ format: LAYOUT_FORMAT, route: state.route || "home", active: state.active === null || state.active === undefined ? null : String(state.active), tabs, selected: (state.selected || []).filter(isRunUid) }, null, 2) + "\n");
  add("data/links.json", JSON.stringify((state.links || []).map((l) => ({ path: clean(l.path, 1000), name: clean(l.name, 200), format: l.format || null, family: l.family || null, bytes: Number.isFinite(l.bytes) ? l.bytes : null, added: l.added || null })), null, 2) + "\n");
  add("notebooks/notes.md", state.notes || "");
  add("notebooks/console.json", JSON.stringify({ runs: state.consoleRuns || 0, entries: state.console || [] }) + "\n");
  return files;
}

const parseJSON = (text, fallback) => { try { return JSON.parse(text); } catch { return fallback; } };

/**
 * A project read back from its files ([{ path, text }]): { name, created, runs (oldest first,
 * each with the meta, toml, json, result (parsed), summary, svg, csv), tabs (with toml from
 * scenarios/ or the run), active, route, selected, links, notes, console, problems }.
 */
export function readProject(files) {
  const byPath = new Map((files || []).map((f) => [f.path, f.text]));
  const problems = [];
  const head = parseJSON(byPath.get("project.json") || "", null);
  if (!head || head.format !== PROJECT_FORMAT) problems.push("project.json is missing or not a Kshana project");
  const runs = [];
  for (const [path, text] of byPath) {
    const m = /^runs\/([^/]+)\/run\.json$/.exec(path);
    if (!m || !isRunUid(m[1])) continue;
    const meta = parseJSON(text, null);
    if (!meta || meta.format !== RUN_FORMAT) { problems.push(`${path} is not a run`); continue; }
    const d = `runs/${m[1]}`;
    const json = byPath.get(`${d}/result.json`);
    const result = json === undefined ? null : parseJSON(json, null);
    if (result === null) { problems.push(`${d}/result.json is missing or not JSON`); continue; }
    runs.push({
      uid: m[1], title: String(meta.title || ""), file: String(meta.file || ""), domain: meta.domain || null, custom: !!meta.custom, edited: !!meta.edited,
      at: new Date(meta.at), ms: Number(meta.ms) || 0, engine: String(meta.engine || ""), engineVersion: String(meta.engine_version || ""),
      scenarioSha: String(meta.scenario_sha256 || ""), resultSha: String(meta.result_sha256 || ""),
      tags: cleanTags(meta.tags), pinned: !!meta.pinned, note: String(meta.note || ""), console: Number.isFinite(meta.console_run) ? meta.console_run : null,
      toml: byPath.get(`${d}/scenario.toml`) || "", json, result,
      summary: byPath.get(`${d}/summary.txt`) || "", svg: byPath.get(`${d}/chart.svg`) || "", csv: byPath.get(`${d}/table.csv`) || "",
    });
  }
  runs.sort((a, b) => (a.uid < b.uid ? -1 : a.uid > b.uid ? 1 : 0));
  const lay = parseJSON(byPath.get("layouts/session.json") || "", null) || {};
  const runByUid = new Map(runs.map((r) => [r.uid, r]));
  const tabs = (Array.isArray(lay.tabs) ? lay.tabs : []).map((t) => {
    const run = t.run ? runByUid.get(t.run) || null : null;
    const own = t.scenario ? byPath.get(t.scenario) : undefined;
    return { key: String(t.key), file: String(t.file || ""), title: String(t.title || ""), custom: !!t.custom, domain: t.domain || null, view: t.view || "chart", ins: t.ins || "inputs",
      runUid: run ? run.uid : null, toml: own !== undefined ? own : run ? run.toml : null, edited: own !== undefined && !t.custom, clock: t.clock || null, markers: Array.isArray(t.markers) ? t.markers : [] };
  });
  const con = parseJSON(byPath.get("notebooks/console.json") || "", null) || {};
  return {
    name: head ? String(head.name || "") : "", created: head ? head.created : null, runs, tabs,
    active: lay.active === undefined ? null : lay.active, route: typeof lay.route === "string" ? lay.route : "home",
    selected: (Array.isArray(lay.selected) ? lay.selected : []).filter((u) => runByUid.has(u)),
    links: parseJSON(byPath.get("data/links.json") || "[]", []), notes: byPath.get("notebooks/notes.md") || "",
    console: Array.isArray(con.entries) ? con.entries : [], consoleRuns: Number(con.runs) || 0, problems,
  };
}

/** The paths of `before` that `after` no longer has (runs removed), for project_save's remove list. */
export function removedPaths(before, after) {
  const keep = new Set(after.map((f) => f.path));
  return [...new Set(before)].filter((p) => !keep.has(p) && /^runs\//.test(p));
}

/**
 * Runs matching a search: words match the title, scenario file, tags and note (all words must
 * match); `tag:x` needs the tag, `is:pinned` a pin, `is:edited` an edited scenario. Pinned runs
 * first, then newest first.
 */
export function searchRuns(runs, query = "") {
  const words = String(query).toLowerCase().split(/\s+/).filter(Boolean);
  const out = runs.filter((r) => words.every((w) => {
    if (w.startsWith("tag:")) return (r.tags || []).includes(w.slice(4));
    if (w === "is:pinned") return !!r.pinned;
    if (w === "is:edited") return !!r.edited;
    const hay = `${r.title || ""} ${r.file || ""} ${(r.tags || []).join(" ")} ${r.note || ""} #${r.id ?? ""}`.toLowerCase();
    return hay.includes(w);
  }));
  return out.sort((a, b) => (!!b.pinned - !!a.pinned) || (+b.at - +a.at));
}

/** Tags from what a person typed ("jamming, baltic  test"). */
export const parseTags = (text) => cleanTags(String(text || "").split(/[,\s]+/));

/** Whether a replay gave the same result bytes: { identical, before, after }. */
export async function replayCheck(beforeText, afterText, digest) {
  const [before, after] = await Promise.all([sha256Text(beforeText, digest), sha256Text(afterText, digest)]);
  return { identical: before === after, before, after };
}
