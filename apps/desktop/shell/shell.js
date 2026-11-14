// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop: the application window (0.42 workstream U: U1 shell, U2 palette and runs,
// U4 wording, U5 upgrade screen, U14 the look: colour roles, symbols, numbers and density from
// lib/look.mjs, lib/symbols.mjs, lib/format.mjs and lib/marks.mjs, with look.css; U8 runs kept on
// disk in a .kshana project folder (lib/project.mjs); U9 drop anything in, with the native format
// detective (lib/detective.mjs); U10 the code mirror console (lib/mirror.mjs); U12 markers and
// delta markers (lib/markers.mjs); U13 journal figures (lib/chart/journal.mjs, lib/figure.mjs);
// U16 the sky plot (lib/sky.mjs)). It is staged as studio/desktop/ next to the Studio
// (apps/desktop/build-frontend.sh) and reuses the Studio's modules unchanged: the
// catalogue, the engine client and its Desktop bridge (lib/desktop.mjs), the views, key
// figures, meaning and evidence modules. The website and the Studio pages are not touched.
//
// Every scenario- or engine-derived string reaches the page through textContent, or as SVG
// parsed as XML and reduced to drawing (lib/svgsafe.mjs), never as HTML. No request leaves
// the app: the engine, the scenarios and every file are local.
import { t } from "../lib/t.mjs";
import { SCENARIOS, DEFAULT_SCENARIO, entryFor, domainOf, groupedLibrary, searchScenarios, scenarioPath, registerGroup, isGroupDir, groupFileUrl } from "../lib/catalog.mjs";
import { createEngineClient, isCancelled, errorMessage } from "../lib/engine.mjs";
import { desktopEngine, desktopInvoke } from "../lib/desktop.mjs";
import { deviceApi, BAUDS } from "../lib/devices.mjs";
import { attachEngineText } from "../lib/engine-text.mjs";
import { parseSvgMarkup, sanitizeSvg } from "../lib/svgsafe.mjs";
import * as V from "../lib/views.mjs";
import { kpis, honesty } from "../lib/kpi.mjs";
import { plainMeaning } from "../lib/meaning.mjs";
import { badgeModel } from "../lib/evidence.mjs";
import { numericFields, patchField } from "../lib/params.mjs";
import { rankInputs, inputLabel } from "../lib/inputs.mjs";
import { fileMeta, chartFilename, svgBlob, triggerDownload } from "../lib/chartdl.mjs";
import { zip } from "../lib/zip.mjs";
import { paletteRows, moveIndex, highlight, isPaletteKey, actionMatches } from "./lib/palette.mjs";
import { createRunLog, compareRows, reproduceLines, scenarioName, elapsed, packFiles, tabKeyIndex } from "./lib/runs.mjs";
import { createExtensions } from "./lib/ext.mjs";
import { domainColour } from "./lib/look.mjs";
import { symbolNode, isSymbol } from "./lib/symbols.mjs";
import { fmtDuration, fmtUtc, fmtCount } from "./lib/format.mjs";
import { numNode, figureParts, domainMark, density, toggleDensity, restoreDensity } from "./lib/marks.mjs";
import { createRunView } from "./lib/runview.mjs";
import { geojsonOfExport } from "./lib/timemodel.mjs";
import { timelineChart, chartOfRun } from "./lib/chart/shell-view.mjs";
import { createChart } from "./lib/chart/chart2d.mjs";
import { buildRequest, parseGeometry } from "../lib/geometry-adapter.mjs";
import { createMirror, runLines, editLines, exportLines, sessionPython, sessionShell, figureScript, skyRequestLines } from "./lib/mirror.mjs";
import { projectFiles, readProject, runUid, projectFolderName, joinPath, searchRuns, parseTags, replayCheck, sha256Text, removedPaths } from "./lib/project.mjs";
import { detectiveRows, scenarioFor, flattenAnswers, linkOf, familyLabel } from "./lib/detective.mjs";
import { skyEpochs, skyTracks, skySpec, skySite, scenarioMask, SKY_STATES, stateCounts } from "./lib/sky.mjs";
import { figureTools } from "./lib/figure.mjs";
import { chartClock } from "./lib/plot.mjs";

const $ = (id) => document.getElementById(id);
const h = (tag, props = {}, ...kids) => {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (v === undefined || v === null || v === false) continue;
    if (k === "class") n.className = v;
    else if (k === "text") n.textContent = v;
    else if (k === "style") n.style.cssText = v;
    else if (k.startsWith("on")) n.addEventListener(k.slice(2), v);
    else n.setAttribute(k, v === true ? "" : v);
  }
  for (const c of kids.flat()) if (c !== null && c !== undefined && c !== false) n.append(c.nodeType ? c : document.createTextNode(String(c)));
  return n;
};
const SVGNS = "http://www.w3.org/2000/svg";
// Outline icons (24-unit grid), drawn with currentColor.
const ICONS = {
  home: ["M3 12 12 4l9 8", "M5 10v10h14V10"], runs: ["M5 3l14 9-14 9z"], library: ["M4 4h16v16H4z", "M9 9h6v6H9z"],
  devices: ["M12 20v-6M8 20v-3M16 20v-9M4 4h16"], evidence: ["M6 3h9l3 3v15H6z", "M9 12l2 2 4-4"], files: ["M4 6h16M4 12h16M4 18h10"],
  fleet: ["M6 4a2 2 0 1 0 0 4 2 2 0 1 0 0-4", "M18 4a2 2 0 1 0 0 4 2 2 0 1 0 0-4", "M12 16a2 2 0 1 0 0 4 2 2 0 1 0 0-4", "M7.5 7.5 11 16.5M16.5 7.5 13 16.5"],
  forensics: ["M11 5a6 6 0 1 0 0 12 6 6 0 1 0 0-12", "m20 20-4-4"], scorecards: ["M4 20V10M10 20V4M16 20v-7M22 20H2"],
  dossiers: ["M5 4h14v16H5z", "M9 8h6M9 12h6M9 16h4"], timing: ["M12 3a9 9 0 1 0 0 18 9 9 0 1 0 0-18", "M12 7v5l3 2"],
  search: ["M11 4a7 7 0 1 0 0 14 7 7 0 1 0 0-14", "m20 20-3.5-3.5"], play: ["M6 4l14 8-14 8z"], down: ["M12 4v12", "m6 10 6 6 6-6", "M4 20h16"],
  copy: ["M8 8h12v12H8z", "M4 16V4h12"], theme: ["M12 3a9 9 0 1 0 9 9 7 7 0 0 1-9-9z"], close: ["M6 6l12 12M18 6 6 18"], stop: ["M6 6h12v12H6z"],
  mark: ["M12 3a9 9 0 1 0 0 18 9 9 0 1 0 0-18", "M12 3v18M3 12h18M6 6l12 12"], pause: ["M8 5v14M16 5v14"],
};
function ic(name, cls = "i") {
  if (!ICONS[name] && isSymbol(name)) return symbolNode(name, { cls: cls === "i" ? "sym" : `sym ${cls}` });
  const s = document.createElementNS(SVGNS, "svg");
  s.setAttribute("viewBox", "0 0 24 24");
  s.setAttribute("class", cls);
  s.setAttribute("aria-hidden", "true");
  for (const d of ICONS[name] || []) { const p = document.createElementNS(SVGNS, "path"); p.setAttribute("d", d); s.append(p); }
  return s;
}
function svgNode(markup) {
  const root = markup ? parseSvgMarkup(markup) : null;
  if (!root) return h("p", { class: "panel-msg", text: t("js-desk-chart-not-drawn", "This chart could not be drawn.") });
  sanitizeSvg(root);
  return document.importNode(root, true);
}
const isMac = /Mac|iPhone|iPad/.test(navigator.platform || navigator.userAgent || "");
const KEY = isMac ? "⌘K" : "Ctrl+K";
const domColor = (id) => domainColour(id, (domainOf(id) || {}).color || "var(--ink-3)");
const domLabel = (id) => (domainOf(id) || {}).label || t("js-desk-domain-own-file", "Your file");

// ------------------------------------------------------------------ state
const S = {
  engine: null, mode: "loading", version: "", native: false, engineError: "",
  route: "home", tabs: [], active: null, nextTab: 1,
  libQuery: "", compare: null, land: null, files: [],
  devices: { api: null, list: [], status: null, msg: "" },
  // U8: the project the session is kept in; U9: what the last drop held; U8: the runs view's search and the run being edited.
  project: { dir: "", name: "Session", created: new Date().toISOString(), links: [], notes: "", saved: [], status: "", home: "" },
  detective: { answers: [], busy: false, msg: "" },
  runQuery: "", editRun: null,
};
let RUNS = createRunLog(200);
// U10: every action's Python and command line.
const MIRROR = createMirror(2000);
let uidSeq = 0;
// What extensions registered through window.KshanaShell (lib/ext.mjs; README "Extending the
// shell"). Empty unless an extension registers: the shell then draws only its own parts.
const BUILTIN_VIEWS = ["home", "runs", "library", "devices", "evidence", "files", "console", "upgrade"];
const reportExt = (e) => console.error("Kshana Desktop extension:", e);
const EXT = createExtensions({ builtins: BUILTIN_VIEWS, onChange: () => renderSoon(), report: reportExt });
let renderQueued = false;
function renderSoon() {
  if (renderQueued) return;
  renderQueued = true;
  queueMicrotask(() => { renderQueued = false; render(); });
}
const safely = (fn, ...args) => { try { return fn(...args); } catch (e) { reportExt(e); return undefined; } };
/** The runs as an extension reads them: copies, newest first, with whether each is selected for comparison. */
const publicRuns = () => RUNS.list().map((r) => Object.freeze({ ...r, selected: RUNS.isSelected(r.id) }));
const runsKey = () => `${RUNS.list().map((r) => r.id).join(",")}|${RUNS.selected().map((r) => r.id).join(",")}`;
const invoke = desktopInvoke();
if (invoke) S.devices.api = deviceApi(invoke);

// ------------------------------------------------------------------ engine
// As the Studio boots it (web/studio/app.js bootEngine): the WebAssembly engine for the tool
// functions, wrapped so that runs go to the native engine inside the app; without the
// WebAssembly package the native engine alone.
async function bootEngine() {
  try {
    const mod = await import("../pkg/kshana.js");
    const res = await fetch(new URL("../pkg/kshana_bg.wasm", import.meta.url));
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const wasm = (res.headers.get("Content-Type") || "").startsWith("application/wasm") && WebAssembly.compileStreaming ? await WebAssembly.compileStreaming(res) : await WebAssembly.compile(await res.arrayBuffer());
    await mod.default({ module_or_path: wasm });
    S.version = mod.version();
    const local = { run: mod.run, run_all: mod.run_all, summary: mod.summary, chart_svg: mod.chart_svg, table_csv: mod.table_csv, register_catalogue: mod.register_catalogue, run_human: mod.run_human };
    S.engine = createEngineClient({
      spawn: typeof Worker === "function" ? () => new Worker(new URL("../lib/engine-worker.mjs", import.meta.url), { type: "module" }) : null,
      local, defer: (fn) => setTimeout(fn, 20), init: wasm,
    });
  } catch (e) {
    S.engineError = errorMessage(e);
  }
  if (invoke) {
    try {
      S.engine = await desktopEngine(S.engine, invoke);
      S.native = S.engine.native.has("run_all");
      if (S.engine.native.has("version")) S.version = await S.engine.call("version");
    } catch (e) {
      S.engineError = errorMessage(e);
    }
  }
  if (!S.engine) { S.mode = "none"; return; }
  await attachEngineText(S.engine);
  S.mode = "ready";
}

// ------------------------------------------------------------------ scenarios
let bundle = null;
const scenarioBundle = () => (bundle ||= fetch("../scenarios/index.json").then((r) => (r.ok ? r.json() : null)).catch(() => null));
async function scenarioText(file) {
  const b = await scenarioBundle();
  if (b && typeof b[file] === "string") return b[file];
  const p = scenarioPath(file);
  if (!p) return null;
  try { const r = await fetch(`../${p}`); return r.ok ? await r.text() : null; } catch { return null; }
}
async function readGroups() {
  const get = (u) => (u ? fetch(`../${u}`).then((r) => (r.ok ? r.json() : null)).catch(() => null) : Promise.resolve(null));
  for (const dir of ((await get("groups.json")) || {}).groups || []) {
    const g = isGroupDir(dir) ? await get(groupFileUrl(dir, "index.json")) : null;
    if (g) registerGroup({ ...g, dir });
  }
}

// ------------------------------------------------------------------ tabs
const activeTab = () => S.tabs.find((x) => x.id === S.active) || null;
function newTab(fields) {
  const tab = { id: S.nextTab++, view: "chart", ins: "inputs", run: null, running: false, error: "", toml: "", baseToml: "", ...fields };
  S.tabs.push(tab);
  return tab;
}
/** Open a bundled scenario: its own tab when it is open, else the current tab (or a new one), then run it. */
async function openScenario(file, { inNewTab = false } = {}) {
  const entry = entryFor(file);
  if (!entry) return;
  let tab = S.tabs.find((x) => x.file === file && !x.custom);
  if (!tab) {
    const cur = activeTab();
    if (cur && !inNewTab && S.route === "tab") Object.assign(cur, { file, entry, custom: false, title: entry.title, domain: entry.domain, run: null, error: "", view: "chart", toml: "", baseToml: "" });
    tab = cur && !inNewTab && S.route === "tab" ? cur : newTab({ file, entry, custom: false, title: entry.title, domain: entry.domain });
    showTab(tab.id);
    const text = await scenarioText(file);
    if (tab.file !== file) return;
    if (text === null) { tab.error = t("js-desk-load-failed", "Could not load { $file }.", { file }); render(); return; }
    tab.toml = tab.baseToml = text;
    log({ kind: "open", title: t("js-desk-log-open", "Open { $title }", { title: entry.title }), py: [`# open ${scenarioName(file)} from the scenario library`], cli: [`kshana example ${scenarioName(file)} > ${scenarioName(file)}.toml`] });
    render();
    runTab(tab);
    return;
  }
  showTab(tab.id);
}
function openText(name, text, extra = {}) {
  const tab = newTab({ file: name, entry: null, custom: true, title: name.replace(/\.toml$/, ""), domain: null, toml: text, baseToml: text, ...extra });
  log({ kind: "open", title: t("js-desk-log-open", "Open { $title }", { title: tab.title }), py: [`# open the scenario file ${name}`], cli: [`# ${name}`] });
  showTab(tab.id);
  runTab(tab);
}
function showTab(id) { S.active = id; S.route = "tab"; render(); }
function closeTab(id) {
  const i = S.tabs.findIndex((x) => x.id === id);
  if (i < 0) return;
  dropLinked(S.tabs[i]);
  S.tabs.splice(i, 1);
  if (S.active === id) {
    const next = S.tabs[i] || S.tabs[i - 1];
    if (next) S.active = next.id; else { S.active = null; if (S.route === "tab") S.route = "home"; }
  }
  render();
  focusActiveTab();
}
function focusActiveTab() { const b = document.querySelector('.doc-tab [role="tab"][tabindex="0"]'); if (b) b.focus(); }

// ------------------------------------------------------------------ runs
async function runTab(tab) {
  if (!tab || tab.running || !tab.toml) return;
  if (!S.engine) { tab.error = S.mode === "none" ? engineMissing() : ""; if (S.mode !== "none") { tab.pending = true; } render(); return; }
  tab.running = true; tab.error = "";
  render();
  const t0 = performance.now();
  let all, result;
  try {
    all = JSON.parse(await S.engine.call("run_all", tab.toml));
    result = JSON.parse(all.json);
  } catch (e) {
    tab.running = false;
    tab.error = isCancelled(e) ? t("js-desk-run-cancelled", "Run cancelled.") : errorMessage(e);
    render();
    return;
  }
  tab.running = false;
  const at = new Date();
  const digest = (b) => crypto.subtle.digest("SHA-256", b);
  const [resultSha, scenarioSha] = await Promise.all([sha256Text(all.json, digest), sha256Text(tab.toml, digest)]).catch(() => ["", ""]);
  tab.run = RUNS.add({
    tabId: tab.id, file: tab.file, title: tab.title, domain: tab.domain, custom: !!tab.custom, edited: tab.toml !== tab.baseToml,
    toml: tab.toml, result, json: all.json, svg: all.svg || "", summary: all.summary || "", csv: all.csv || "", ms: performance.now() - t0, at,
    engine: S.native ? "native" : "webassembly", engineVersion: S.version, uid: runUid(at, ++uidSeq), resultSha, scenarioSha, tags: [], pinned: false, note: "",
  });
  const n = MIRROR.nextRun();
  tab.run.console = n;
  log({ kind: "run", title: t("js-desk-log-run", "Run { $n }: { $title }", { n, title: tab.title }), ...runLines({ n, file: tab.file, bundled: !tab.custom, edited: tab.toml !== tab.baseToml, toml: tab.toml, resultSha }) });
  saveSoon();
  render();
}
function cancelRuns() { if (S.engine && S.engine.canCancel) S.engine.cancel(); }
const engineMissing = () => t("js-desk-engine-missing", "The engine could not start: { $reason }", { reason: S.engineError || "?" });

// ------------------------------------------------------------------ the time cursor (U7, U15)
// One set of linked views per tab (lib/runview.mjs): the clock, the timeline strip, the plot,
// the map and the values at the cursor. Made when a run is first shown on the time cursor;
// the scenario's geometry (receivers, stations, jammer areas, satellites) comes from the
// engine's GeoJSON export of the scenario.
const scenes = new WeakMap();
function sceneOf(run) {
  if (!scenes.has(run)) {
    const p = S.engine ? S.engine.call("export_scenario", run.toml, "geojson").then(geojsonOfExport).catch(() => null) : Promise.resolve(null);
    scenes.set(run, p);
  }
  return scenes.get(run);
}
const landFile = (scale) => fetch(`data/land-${scale === "50m" ? "50m" : "110m"}.json`).then((r) => { if (!r.ok) throw new Error(`HTTP ${r.status}`); return r.json(); });
function linkedFor(tab) {
  const run = tab.run;
  if (!run) return null;
  if (tab.lv && tab.lv.run === run) return tab.lv.view;
  const at = tab.lv && tab.lv.view ? tab.lv.view.clock.t : undefined;
  dropLinked(tab);
  let view = null;
  try {
    view = createRunView({ t, icon: ic, run, seriesModel: V.seriesModel(run.result, run.toml), scene: sceneOf(run), at, loadLand: landFile, fmt: (v) => V.fmt(v),
      onMarkers: (m) => {
        tab.markers = m.map((x) => ({ t: x.t, series: x.series }));
        if (tab.restoring) return;
        if (m.length) log({ kind: "marker", title: t("js-desk-log-markers", "Markers on run { $n }", { n: run.console || run.id }), py: [`# markers: ${m.map((x) => `${x.name} at t = ${x.t} s (${x.series} = ${x.v}${x.unit ? ` ${x.unit}` : ""})`).join(", ")}${m.length === 2 ? `; Δt = ${m[1].t - m[0].t} s, Δ = ${m[1].v - m[0].v}${m[0].unit ? ` ${m[0].unit}` : ""}` : ""}`], cli: [] });
        saveSoon();
      } });
  } catch (e) {
    console.error("Kshana Desktop: time cursor", e);
  }
  tab.lv = { run, view };
  if (view) {
    restoreView(tab, view);
    // the scene (map layers, the site of the sky plot) arrives after the run: the tab's views list follows it
    sceneOf(run).then(() => { if (S.route === "tab" && activeTab() === tab) renderSoon(); });
  }
  return view;
}
// A tab reopened from the project gets its clock (cursor, range, timed markers) and its plot's markers back (U8).
function restoreView(tab, view) {
  const c = tab.restoreClock, mk = tab.restoreMarkers;
  tab.restoreClock = tab.restoreMarkers = null;
  if (c) {
    if (Number.isFinite(c.t)) view.clock.seek(c.t, "restore");
    if (Array.isArray(c.range) && c.range.length === 2) view.clock.setRange(c.range[0], c.range[1]);
    for (const m of c.marks || []) view.clock.addMark(m.t, m.label || "");
  }
  if (mk && mk.length) {
    tab.restoring = true;
    try { view.restoreMarkers(mk); } catch (e) { console.error("Kshana Desktop: markers", e); }
    tab.restoring = false;
  }
}
function dropLinked(tab) { if (tab && tab.lv && tab.lv.view) tab.lv.view.destroy(); if (tab) tab.lv = null; }

// The figures a run is summed up by: the plain-language cards (lib/meaning.mjs), else the key figures (lib/kpi.mjs).
function stripCards(run, max = 3) {
  const m = plainMeaning(run.result, run.toml);
  if (m && m.cards && m.cards.length) return m.cards.slice(0, max).map((c) => ({ k: c.label, v: String(c.value), unit: c.unit || "", sub: c.sub || "" }));
  return kpis(run.result, run.toml, max).map((c) => { const p = c.text ? { value: c.text, unit: "" } : figureParts(typeof c.v === "number" ? c.v : String(c.v ?? ""), c.unit || ""); return { k: c.k, v: p.value, unit: p.unit, sub: c.sub || "" }; });
}
function answerOf(run) { const m = plainMeaning(run.result, run.toml); return (m && m.big) || run.summary || ""; }
function tierOf(run) { const b = badgeModel(run.result); if (b) return { tier: b.tier, cls: b.cls, rows: b.count }; const hn = honesty(run.result); return hn ? { tier: hn.tier, cls: hn.tier.toLowerCase(), rows: 0, text: hn.text } : null; }
function agoText(at) {
  const e = elapsed(at);
  if (e.unit === "s") return e.n < 5 ? t("js-desk-ago-now", "just now") : t("js-desk-ago-s", "{ $n } s ago", { n: e.n });
  if (e.unit === "min") return t("js-desk-ago-min", "{ $n } min ago", { n: e.n });
  if (e.unit === "h") return t("js-desk-ago-h", "{ $n } h ago", { n: e.n });
  return t("js-desk-ago-d", "{ $n } d ago", { n: e.n });
}
const tierText = (tier) => ({ VALIDATED: t("js-desk-tier-validated", "VALIDATED"), MODELLED: t("js-desk-tier-modelled", "MODELLED"), PARTNER: t("js-desk-tier-partner", "PARTNER") })[tier] || tier;

// ------------------------------------------------------------------ exports
function save(blob, name) { triggerDownload(blob, name); toast(t("js-desk-saved", "Saved { $name }.", { name })); }
function exportRun(run, what) {
  const meta = fileMeta(run.result, S.version, run.toml);
  const base = scenarioName(run.file);
  if (run.console) log({ kind: "export", title: t("js-desk-log-export", "Export { $what } of run { $n }", { what, n: run.console }), ...exportLines({ n: run.console, what, file: run.file }) });
  if (what === "svg" && run.svg) return save(svgBlob(run.svg), chartFilename(base, meta, "svg"));
  if (what === "json") return save(new Blob([JSON.stringify(run.result, null, 2)], { type: "application/json" }), chartFilename(base, meta, "json"));
  if (what === "toml") return save(new Blob([run.toml], { type: "application/toml" }), `${base}.toml`);
  if (what === "csv" && run.csv) return save(new Blob([run.csv], { type: "text/csv" }), chartFilename(base, meta, "csv"));
}
async function exportPack(run) {
  if (!run) { toast(t("js-desk-pack-no-run", "Run a scenario first: a pack holds one run.")); return; }
  try {
    const readme = t("js-desk-pack-readme", "Kshana run pack (unsigned). It holds the scenario file, the engine's result, its summary, chart and table, and manifest.json with the SHA-256 of every file. Rerun the scenario file with the same engine version to reproduce the result. Signed dossiers come with Kshana Pro.") + "\n";
    const files = await packFiles(run, { version: S.version, digest: (b) => crypto.subtle.digest("SHA-256", b), readme });
    if (run.console) log({ kind: "export", title: t("js-desk-log-pack", "Evidence pack of run { $n }", { n: run.console }), ...exportLines({ n: run.console, what: "pack", file: run.file }) });
    const meta = fileMeta(run.result, S.version, run.toml);
    save(new Blob([zip(files)], { type: "application/zip" }), chartFilename(`${scenarioName(run.file)}-pack`, meta, "zip"));
  } catch (e) {
    toast(t("js-desk-pack-failed", "The pack could not be made: { $reason }", { reason: errorMessage(e) }));
  }
}
async function copyText(text) {
  try { await navigator.clipboard.writeText(text); toast(t("js-desk-copied", "Copied.")); }
  catch { toast(t("js-desk-copy-failed", "Could not copy: select the text and copy it.")); }
}
let toastTimer = 0;
function toast(msg) { const el = $("toast"); el.textContent = msg; el.classList.add("on"); clearTimeout(toastTimer); toastTimer = setTimeout(() => el.classList.remove("on"), 2600); }

// ------------------------------------------------------------------ the code mirror (U10)
/** Write an action's Python and command lines to the console (and keep it with the project). */
function log(entry) { MIRROR.push(entry); if (S.route === "console") renderSoon(); saveSoon(); }
const runRef = (run) => ({ file: run.file, bundled: !run.custom, edited: !!run.edited, toml: run.toml, resultSha: run.resultSha || "", result: run.result });

// ------------------------------------------------------------------ the project on disk (U8)
// The session is kept in a .kshana folder (Documents/Kshana/Session.kshana unless another
// project is opened), written by the app's native side; without it (a page outside the app),
// in this window's storage. A save happens a moment after each change and every few seconds
// while the layout (tabs, clocks, markers, selection) changes.
const DIR_KEY = "kshana-desk-project-dir", LOCAL_KEY = "kshana-desk-project";
function projectState() {
  return {
    name: S.project.name, created: S.project.created, runs: RUNS.list(), route: S.route, active: S.active,
    selected: RUNS.selected().map((r) => r.uid),
    tabs: S.tabs.map((tab) => {
      const lv = tab.lv && tab.lv.view && tab.lv.run === tab.run ? tab.lv.view : null;
      const snap = lv ? lv.clock.snapshot() : null;
      return { key: tab.id, file: tab.file, title: tab.title, custom: !!tab.custom, domain: tab.domain, toml: tab.toml, baseToml: tab.baseToml, view: tab.view, ins: tab.ins,
        runUid: tab.run ? tab.run.uid : null, clock: snap ? { t: snap.t, range: snap.range, marks: snap.marks } : tab.restoreClock || null, markers: tab.markers || tab.restoreMarkers || [] };
    }),
    links: S.project.links, notes: S.project.notes, console: MIRROR.list(), consoleRuns: MIRROR.runs,
  };
}
let saveTimer = 0, saving = false, lastKey = "";
function saveSoon(ms = 900) { clearTimeout(saveTimer); saveTimer = setTimeout(saveProject, ms); }
function layoutKey() {
  const st = projectState();
  return JSON.stringify([st.route, st.active, st.selected, st.tabs.map((x) => [x.key, x.view, x.ins, x.runUid, x.clock, x.markers, x.toml && x.toml.length]), st.runs.map((r) => [r.uid, r.tags, r.pinned, r.note]), st.links.length, st.notes.length, st.console.length]);
}
async function saveProject() {
  if (saving) { saveSoon(500); return; }
  saving = true;
  try {
    lastKey = layoutKey();
    const files = projectFiles(projectState());
    if (invoke && S.project.dir) {
      await invoke("project_save", { dir: S.project.dir, files, remove: removedPaths(S.project.saved, files) });
      S.project.saved = files.map((f) => f.path);
      S.project.status = t("js-desk-proj-saved", "Kept in { $dir }", { dir: S.project.dir });
    } else {
      try { localStorage.setItem(LOCAL_KEY, JSON.stringify(files)); S.project.status = t("js-desk-proj-saved-local", "Kept in this window's storage (the app's native side is not here)."); }
      catch { S.project.status = t("js-desk-proj-not-saved", "This session could not be kept: the window's storage is full or blocked."); }
    }
  } catch (e) {
    S.project.status = t("js-desk-proj-save-failed", "The project could not be written: { $reason }", { reason: errorMessage(e) });
  } finally { saving = false; }
}
setInterval(() => { if (S.project.ready && layoutKey() !== lastKey) saveProject(); }, 4000);
addEventListener("pagehide", () => { if (S.project.ready) saveProject(); });

/** Show a project read from its files (lib/project.mjs readProject): its runs, tabs, selection and console. */
function applyProject(p, dir) {
  for (const tab of S.tabs) dropLinked(tab);
  RUNS = createRunLog(200);
  const byUid = new Map();
  for (const r of p.runs) {
    const run = RUNS.add({ ...r, tabId: null });
    byUid.set(r.uid, run);
  }
  uidSeq = p.runs.length;
  S.tabs = []; S.active = null; S.compare = null;
  const keyToId = new Map();
  for (const x of p.tabs) {
    if (x.toml === null || x.toml === undefined) continue;
    const run = x.runUid ? byUid.get(x.runUid) || null : null;
    const tab = newTab({ file: x.file, entry: x.custom ? null : entryFor(x.file), custom: x.custom, title: x.title || x.file, domain: x.domain, toml: x.toml, baseToml: x.edited ? "" : x.toml,
      view: x.view, ins: x.ins, run, restoreClock: x.clock, restoreMarkers: x.markers });
    if (run) run.tabId = tab.id;
    keyToId.set(x.key, tab.id);
    // an edited bundled scenario: its bundled text, for Reset and "edited"
    if (x.edited && !x.custom) scenarioText(x.file).then((text) => { if (text !== null) { tab.baseToml = text; render(); } });
  }
  for (const u of p.selected) { const r = byUid.get(u); if (r) RUNS.toggle(r.id, true); }
  S.active = keyToId.get(p.active) ?? (S.tabs[0] ? S.tabs[0].id : null);
  S.route = p.route === "tab" ? (S.active !== null ? "tab" : "home") : BUILTIN_VIEWS.includes(p.route) ? p.route : "home";
  MIRROR.load(p.console, p.consoleRuns);
  S.project.name = p.name || S.project.name;
  S.project.created = p.created || S.project.created;
  S.project.links = Array.isArray(p.links) ? p.links : [];
  S.project.notes = p.notes || "";
  if (dir !== undefined) S.project.dir = dir;
  S.project.ready = true;
  lastKey = layoutKey();
  render();
}
async function loadProject(dir) {
  if (invoke) {
    const r = await invoke("project_load", { dir });
    S.project.saved = (r.files || []).map((f) => f.path);
    return r.exists ? readProject(r.files) : null;
  }
  try { const files = JSON.parse(localStorage.getItem(LOCAL_KEY) || "null"); return files ? readProject(files) : null; } catch { return null; }
}
async function openProject(dir) {
  try {
    await saveProject();
    const p = await loadProject(dir);
    if (!p) { S.project = { ...S.project, dir, name: dir.split(/[\\/]/).pop().replace(/\.kshana$/, ""), links: [], notes: "", saved: [], created: new Date().toISOString() }; await saveProject(); }
    else applyProject(p, dir);
    try { localStorage.setItem(DIR_KEY, dir); } catch { /* not remembered */ }
    log({ kind: "project", title: t("js-desk-log-project", "Open project { $dir }", { dir }), py: [`# project folder: ${dir}`], cli: [`cd ${JSON.stringify(dir)}`] });
    toast(t("js-desk-proj-opened", "Project { $name } open.", { name: S.project.name }));
    render();
  } catch (e) { toast(t("js-desk-proj-open-failed", "The project could not be opened: { $reason }", { reason: errorMessage(e) })); }
}
async function restoreSession() {
  try {
    let dir = "";
    if (invoke) {
      const home = await invoke("project_home");
      S.project.home = home && home.dir ? home.dir : "";
      try { dir = localStorage.getItem(DIR_KEY) || ""; } catch { dir = ""; }
      if (!dir && S.project.home) dir = joinPath(S.project.home, "Session.kshana");
      S.project.dir = dir;
    }
    const p = dir || !invoke ? await loadProject(dir) : null;
    if (p) applyProject(p, dir || undefined);
  } catch (e) {
    S.project.status = t("js-desk-proj-restore-failed", "The last session could not be read back: { $reason }", { reason: errorMessage(e) });
  }
  S.project.ready = true;
}

// ------------------------------------------------------------------ drop anything in (U9)
const tauriListen = (event, fn) => {
  const i = globalThis.__TAURI_INTERNALS__;
  if (!i || typeof i.transformCallback !== "function") return false;
  Promise.resolve(i.invoke("plugin:event|listen", { event, target: { kind: "Any" }, handler: i.transformCallback(fn) })).catch(() => {});
  return true;
};
function showDrop(on) { const el = $("drop-layer"); if (el) el.hidden = !on; }
async function inspectPaths(paths) {
  if (!invoke) { S.detective.msg = t("js-desk-det-no-native", "The format detective runs in the app's native side, which this window does not have."); go("files"); return; }
  S.detective.busy = true; S.detective.msg = ""; go("files");
  const out = [];
  for (const path of paths) {
    try { out.push(await invoke("inspect_path", { path })); }
    catch (e) { out.push({ ok: false, name: String(path).split(/[\\/]/).pop(), path, reason: errorMessage(e) }); }
  }
  finishInspect(out);
}
const toBase64 = (bytes) => { let s = ""; for (let i = 0; i < bytes.length; i += 0x8000) s += String.fromCharCode.apply(null, bytes.subarray(i, i + 0x8000)); return btoa(s); };
async function inspectFiles(list) {
  if (!invoke) { S.detective.msg = t("js-desk-det-no-native", "The format detective runs in the app's native side, which this window does not have."); go("files"); return; }
  S.detective.busy = true; S.detective.msg = ""; go("files");
  const out = [];
  for (const f of list) {
    try {
      const head = new Uint8Array(await f.slice(0, 4 * 1024 * 1024).arrayBuffer());
      out.push(await invoke("inspect_bytes", { name: f.name, base64: toBase64(head), size: f.size }));
    } catch (e) { out.push({ ok: false, name: f.name, reason: errorMessage(e) }); }
  }
  finishInspect(out);
}
function finishInspect(answers) {
  S.detective.busy = false;
  S.detective.answers = flattenAnswers(answers);
  for (const a of S.detective.answers) log({ kind: "inspect", title: t("js-desk-log-inspect", "Inspect { $name }", { name: a.name || "?" }), py: [`# ${a.path || a.name}: ${a.ok ? `${a.label || a.format}${a.epochs ? `, ${a.epochs} epochs` : ""}${a.constellations && a.constellations.length ? `, ${a.constellations.join("/")}` : ""}` : `not read (${a.reason || ""})`}`], cli: [] });
  render();
}
let clockTemplate = null;
async function openDropped(a) {
  if (clockTemplate === null) clockTemplate = (await scenarioText("clock-measured-log.toml")) || "";
  const sc = scenarioFor(a, { clockTemplate });
  if (!sc) { toast(t("js-desk-det-no-scenario", "This file is kept as a data link; no scenario opens it on its own.")); return; }
  addLink(a, false);
  openText(sc.file, sc.toml, { title: sc.title });
}
function addLink(a, say = true) {
  if (!S.project.links.some((l) => l.path === (a.path || a.name))) S.project.links.push(linkOf(a));
  saveSoon();
  if (say) { toast(t("js-desk-det-linked", "{ $name } is now a data link of the project.", { name: a.name })); render(); }
}
if (!tauriListen("tauri://drag-drop", (ev) => { showDrop(false); const paths = ev && ev.payload && ev.payload.paths; if (paths && paths.length) inspectPaths(paths); })) {
  // a page outside the app: the files themselves (no paths)
  addEventListener("drop", (e) => { if (!e.dataTransfer || !e.dataTransfer.files.length) return; e.preventDefault(); showDrop(false); inspectFiles([...e.dataTransfer.files]); });
}
tauriListen("tauri://drag-enter", () => showDrop(true));
tauriListen("tauri://drag-leave", () => showDrop(false));
addEventListener("dragover", (e) => { if (e.dataTransfer && [...(e.dataTransfer.types || [])].includes("Files")) { e.preventDefault(); showDrop(true); } });
addEventListener("dragleave", (e) => { if (!e.relatedTarget) showDrop(false); });

// ------------------------------------------------------------------ navigation
const NAV = () => [
  { id: "home", icon: "home", label: t("js-desk-nav-home", "Home") },
  { id: "runs", icon: "runs", label: t("js-desk-nav-runs", "Runs"), count: () => RUNS.size },
  { id: "library", icon: "library", label: t("js-desk-nav-library", "Scenario library"), count: () => SCENARIOS.length },
  { id: "devices", icon: "receiver", label: t("js-desk-nav-devices", "Devices"), live: () => !!(S.devices.status && S.devices.status.running) },
  { id: "evidence", icon: "evidence", label: t("js-desk-nav-evidence", "Evidence packs") },
  { id: "files", icon: "files", label: t("js-desk-nav-files", "Files and project") },
  { id: "console", icon: "copy", label: t("js-desk-nav-console", "Console"), count: () => MIRROR.size },
];
// What Pro adds (U5). Each opens the upgrade screen; the free edition carries none of them.
const PRO = () => [
  { id: "fleet", icon: "station", label: t("js-desk-pro-fleet", "Station fleet"), text: t("js-desk-pro-fleet-text", "Watch many receivers and timing stations at once, with their trust scores and alarms side by side.") },
  { id: "forensics", icon: "forensics", label: t("js-desk-pro-forensics", "Incident forensics"), text: t("js-desk-pro-forensics-text", "Replay an interference or spoofing incident from recorded logs and pin down when, where and what changed.") },
  { id: "scorecards", icon: "scorecards", label: t("js-desk-pro-scorecards", "Scorecards"), text: t("js-desk-pro-scorecards-text", "Score receivers and sites against the same scenarios over time, and track how each one holds up.") },
  { id: "dossiers", icon: "dossiers", label: t("js-desk-pro-dossiers", "Studies and signed dossiers"), text: t("js-desk-pro-dossiers-text", "Run studies across many scenarios and hand over signed dossiers that a reviewer can check byte for byte.") },
  { id: "timing", icon: "clock", label: t("js-desk-pro-timing", "Timing fleet assurance"), text: t("js-desk-pro-timing-text", "Follow holdover and time error across a fleet of clocks and grandmasters, with evidence for each.") },
];
function go(route) {
  S.route = route;
  render();
  $("view").focus({ preventScroll: true });
}

// ------------------------------------------------------------------ render
function render() {
  const keep = document.activeElement && document.activeElement.id;
  renderTabs();
  renderSidebar();
  renderView();
  renderInspector();
  renderStatus();
  if (keep && keep !== "view") { const el = $(keep); if (el && el !== document.activeElement) el.focus({ preventScroll: true }); }
  const ed = EXT.shell.edition();
  const app = (ed && ed.appName) || "Kshana Desktop";
  const extTitle = S.route === "tab" ? "" : EXT.shell.titleOf(S.route);
  document.title = S.route === "tab" && activeTab() ? `${activeTab().title} · ${app}` : extTitle ? `${extTitle} · ${app}` : app;
  // The extension events: the view or the runs changed, and every render.
  const vk = S.route === "tab" ? `tab:${S.active}` : S.route;
  if (vk !== seen.view) { seen.view = vk; EXT.shell.emit("view-changed", { view: S.route, tab: S.route === "tab" ? S.active : null }); }
  const rk = runsKey();
  if (rk !== seen.runs) { seen.runs = rk; EXT.shell.emit("runs-changed", { runs: publicRuns() }); }
  EXT.shell.emit("render", { view: S.route });
}
const seen = { view: null, runs: runsKey() };

function renderTabs() {
  const list = $("doc-tabs");
  list.setAttribute("aria-label", t("js-desk-open-scenarios", "Open scenarios"));
  const focusable = S.route === "tab" && activeTab() ? S.active : S.tabs[0] && S.tabs[0].id;
  list.replaceChildren(...S.tabs.map((tab) => {
    const sel = S.route === "tab" && tab.id === S.active;
    return h("div", { class: "doc-tab", "aria-selected": sel ? "true" : "false", role: "presentation" },
      h("button", { class: "tab-main", type: "button", role: "tab", id: `tab-${tab.id}`, "aria-selected": sel ? "true" : "false", "aria-controls": "view", tabindex: tab.id === focusable ? "0" : "-1", "data-tab": String(tab.id), onclick: () => showTab(tab.id) },
        h("span", { class: "dot", style: `--c:${domColor(tab.domain)}` }), h("span", { text: tab.title })),
      h("button", { class: "tab-close", type: "button", tabindex: "-1", "aria-label": t("js-desk-close-tab", "Close { $title }", { title: tab.title }), title: t("js-desk-close-tab", "Close { $title }", { title: tab.title }), onclick: () => closeTab(tab.id) }, ic("close")));
  }));
  const plus = $("tab-new");
  plus.textContent = "+";
  plus.setAttribute("aria-label", t("js-desk-new-tab", "Open a scenario in a new tab"));
  plus.title = plus.getAttribute("aria-label");
  const pb = $("palette-btn");
  pb.replaceChildren(ic("search"), h("span", { text: t("js-desk-palette-button", "Run a scenario, open a file…") }), h("kbd", { text: KEY }));
  pb.setAttribute("aria-label", t("js-desk-palette-open", "Command palette ({ $key })", { key: KEY }));
  $("skip").textContent = t("js-desk-skip", "Skip to the content");
  const dc = $("drop-card");
  if (dc) dc.textContent = t("js-desk-drop-here", "Drop files or a folder: the engine's readers say what each one is before anything is loaded.");
}

function renderSidebar() {
  const nav = $("sidebar");
  nav.setAttribute("aria-label", t("js-desk-nav-main", "Main"));
  const ed = EXT.shell.edition();
  const item = (n, onclick, extra) => h("button", { class: "nav-item", type: "button", "aria-current": S.route === n.id ? "page" : null, onclick }, ic(n.icon), h("span", { text: n.label }), extra);
  nav.replaceChildren(
    h("div", { class: "brand" }, ic("mark", "i"), h("b", { text: "Kshana" }), ed && ed.tag ? h("span", { class: "ext-tag", text: ed.tag }) : null, h("span", { class: "chip", text: S.version || "…" })),
    ...NAV().map((n) => item(n, () => go(n.id), n.count ? h("span", { class: "count", text: String(n.count()) }) : n.live && n.live() ? h("span", { class: "live", title: t("js-desk-device-reading", "A receiver is being read") }) : null)),
    ...EXT.shell.navSections().flatMap((sec) => [
      sec.heading ? h("div", { class: "nav-head", "data-ext": sec.id }, h("span", { text: sec.heading })) : null,
      ...sec.items.map((it) => h("button", { class: "nav-item", type: "button", "data-ext": it.id, "aria-current": it.view && S.route === it.view ? "page" : null,
        onclick: () => { if (it.view) go(it.view); if (it.onSelect) safely(it.onSelect); } }, extIcon(it.icon), h("span", { text: it.label }), extBadge(it.badge)))]).filter(Boolean), // a section without a heading adds no node
    ...(ed ? [h("div", { class: "edition ext-edition", "data-ext": "edition" },
      ed.title ? h("b", { text: ed.title }) : null,
      ed.text ? h("p", { text: ed.text }) : null,
      ed.action ? h("button", { class: "linkish", type: "button", onclick: () => safely(ed.action.onSelect) }, ed.action.label) : null)] : [
      h("div", { class: "nav-head", id: "pro-head" }, h("span", { text: t("js-desk-nav-pro", "PRO") })),
      ...PRO().map((p) => item({ id: `pro-${p.id}`, icon: p.icon, label: p.label }, () => go("upgrade"), h("span", { class: "pro-tag", "aria-label": t("js-desk-pro-only", "Pro only"), text: "PRO" }))),
      h("div", { class: "edition" },
        h("b", { text: t("js-desk-free-edition", "Free edition") }),
        h("p", { text: t("js-desk-free-line", "Fleet, forensics and signed dossiers come with Pro.") }),
        h("button", { class: "linkish", type: "button", onclick: () => go("upgrade") }, t("js-desk-see-pro", "See what Pro adds →")))]),
  );
}
// An extension's icon (one of the shell's by name, or a node its function returns) and badge.
function extIcon(icon) {
  if (typeof icon === "string") return ic(icon);
  if (typeof icon === "function") { const n = safely(icon); return n && n.nodeType ? n : null; }
  return null;
}
const extBadge = (b) => (b ? h("span", { class: "nav-badge", title: b.title || null }, b.dot ? h("span", { class: "nav-dot", style: `--c:${b.dot.replace(/[;{}]/g, "")}` }) : null, b.text || null) : null);

function renderView() {
  const v = $("view");
  v.removeAttribute("role"); v.removeAttribute("aria-labelledby");
  const tab = activeTab();
  if (S.route === "tab" && tab) { drawn = null; v.setAttribute("role", "tabpanel"); v.setAttribute("aria-labelledby", `tab-${tab.id}`); v.replaceChildren(...tabView(tab)); return; }
  const ext = EXT.shell.viewFor(S.route);
  if (ext && extView(v, ext)) return;
  drawn = null;
  const pages = { home: homeView, runs: runsView, library: libraryView, devices: devicesView, evidence: evidenceView, files: filesView, console: consoleView, upgrade: upgradeView };
  v.replaceChildren((pages[S.route] || homeView)());
}
// A registered view. On the render that opens it, `el` is empty and ctx.fresh is true; on the
// renders that follow, `el` holds what the view drew last, which it may keep or redraw. A view
// that throws gives the place back to the shell's own view.
let drawn = null;
function extView(v, ext) {
  const key = `${S.route}>${ext.id}`;
  const fresh = drawn !== key;
  if (fresh) v.replaceChildren();
  const ctx = Object.freeze({ view: ext.id, route: S.route, replaces: ext.replaces, fresh, runs: publicRuns(), show: (id) => KshanaShell.show(id), parts: homeParts });
  try {
    const out = ext.render(v, ctx);
    if (out && out.nodeType) v.replaceChildren(out);
  } catch (e) {
    reportExt(e);
    drawn = null;
    return false;
  }
  drawn = key;
  return true;
}

// ---------- home
const FEATURED = ["clock-holdover.toml", "jamming-demo.toml", "maritime-spoof-position-push.toml", "araim-gps-galileo.toml", "maritime-port-approach-coast.toml"];
function homeView() {
  const recent = recentRuns();
  return h("section", { class: "page", "aria-labelledby": "home-h" },
    h("p", { class: "kicker", text: t("js-desk-home-kicker", "Kshana Desktop · free edition") }),
    h("h1", { id: "home-h", text: t("js-desk-home-title", "What would you like to find out?") }),
    h("p", { class: "lede", text: t("js-desk-home-lede", "Every run uses the engine on this machine, natively, and works offline. Pick a question, open the scenario library, or press { $key } to search.", { key: KEY }) }),
    recent ? [h("h2", { text: t("js-desk-home-recent", "Recent runs") }), recent] : null,
    h("h2", { text: t("js-desk-home-areas", "Start with a question") }),
    scenarioGrid(),
  );
}
// The home's parts, which a view that replaces the home can place in its own page (ctx.parts).
const recentRuns = () => (RUNS.size ? runsTable(RUNS.list().slice(0, 3), { select: false }) : null);
function scenarioGrid() {
  return h("div", { class: "grid" }, ...groupedLibrary("").map((g) => h("div", { class: "card" },
    h("h3", {}, domainMark(g.domain.id, domColor(g.domain.id)), g.domain.label),
    ...g.items.slice(0, 2).map((e) => h("button", { class: "q-btn", type: "button", onclick: () => openScenario(e.file, { inNewTab: true }) }, e.title, h("small", { text: e.question }))),
    h("button", { class: "linkish", type: "button", onclick: () => { S.libQuery = g.domain.label; go("library"); } }, t("js-desk-home-all-in", "All { $n } in this area →", { n: g.items.length })))));
}
const homeParts = Object.freeze({ recentRuns, scenarioGrid });

// ---------- a scenario tab
function tabView(tab) {
  const run = tab.run;
  const r = run && run.result;
  const views = [["chart", t("js-desk-view-chart", "Chart")]];
  const lv = linkedFor(tab);
  if (r && (V.groundTrack(r) || (lv && lv.hasMap))) views.push(["map", t("js-desk-view-map", "Map")]);
  views.push(["timeline", t("js-desk-view-timeline", "Timeline")]);
  if (lv && skySite(lv.model)) views.push(["sky", t("js-desk-view-sky", "Sky")]);
  views.push(["table", t("js-desk-view-table", "Table")], ["json", t("js-desk-view-json", "JSON")]);
  if (!views.some((x) => x[0] === tab.view)) tab.view = "chart";
  const meta = [tab.custom ? tab.file : scenarioName(tab.file)];
  if (r && typeof r.seed === "number") meta.push(t("js-desk-meta-seed", "seed { $seed }", { seed: r.seed }));
  if (run) meta.push(t("js-desk-meta-ran", "ran { $ago } in { $s } s", { ago: agoText(run.at), s: (run.ms / 1000).toFixed(1) }));
  if (tab.toml !== tab.baseToml) meta.push(t("js-desk-meta-edited", "edited"));
  const head = h("div", { class: "doc-head" },
    h("span", { class: "dom-chip", style: `--c:${domColor(tab.domain)};display:inline-flex;align-items:center;gap:6px` }, domainMark(tab.domain, domColor(tab.domain)), domLabel(tab.domain)),
    h("h1", { text: tab.title }),
    h("span", { class: "doc-meta", text: meta.join(" · ") }),
    h("div", { class: "seg", role: "group", "aria-label": t("js-desk-view-group", "View") }, ...views.map(([id, label]) => h("button", { type: "button", "aria-pressed": tab.view === id ? "true" : "false", onclick: () => { tab.view = id; render(); } }, label))),
    tab.running
      ? h("button", { class: "btn", type: "button", id: "btn-cancel", onclick: cancelRuns }, ic("stop"), t("js-desk-cancel", "Cancel"))
      : h("button", { class: "btn primary", type: "button", id: "btn-run", disabled: !tab.toml || S.mode === "none" ? true : null, onclick: () => runTab(tab) }, ic("play"), run ? t("js-desk-run-again", "Run again") : t("js-desk-run", "Run")));
  const body = h("div", { class: "doc-body" });
  if (tab.error) body.append(h("p", { class: "notice error", role: "alert", text: tab.error }));
  if (tab.running) body.append(h("p", { class: "busy", role: "status" }, h("span", { class: "spin", "aria-hidden": "true" }), S.native ? t("js-desk-running-native", "Running on this machine's native engine…") : t("js-desk-running", "Running…")));
  else if (run) body.append(h("p", { class: "answer", text: answerOf(run) }));
  body.append(panel(tab));
  const tools = run ? figureFor(tab) : null;
  if (tools) body.append(tools);
  if (run) {
    const cards = stripCards(run, 3);
    const tier = tierOf(run);
    body.append(h("div", { class: "strip", role: "group", "aria-label": t("js-desk-result-strip", "Result") },
      ...cards.map((c) => h("div", { class: "fig" }, h("span", { class: "k", text: c.k, title: c.k }), h("span", { class: "v" }, c.v, c.unit ? h("small", { text: c.unit }) : null), c.sub ? h("span", { class: "s", text: c.sub, title: c.sub }) : null)),
      h("div", { class: "fig" }, h("span", { class: "k", text: t("js-desk-evidence", "Evidence") }),
        tier ? h("span", { class: `tier ${tier.cls}`, text: tierText(tier.tier) }) : h("span", { class: "s", text: t("js-desk-evidence-none", "The result states no tier.") }),
        h("button", { class: "linkish", type: "button", style: "margin-top:4px;font-weight:400;color:var(--ink-2)", onclick: () => { tab.ins = "result"; render(); } }, t("js-desk-evidence-why", "Why")))));
  }
  return [head, body];
}
// The tools under every figure (U10, U13): the script that makes it and, for an interactive chart, the journal export.
function figureFor(tab) {
  const run = tab.run;
  const lv = tab.lv && tab.lv.run === run ? tab.lv.view : null;
  const common = { t, save, copy: copyText, log };
  if (tab.view === "chart" && run.svg) return figureTools({ ...common, title: `${tab.title} · chart`, script: () => figureScript(runRef(run), { kind: "chart", title: tab.title }) });
  if (tab.view === "timeline" && lv && lv.chart) {
    const m = lv.model;
    return figureTools({ ...common, chart: lv.chart, title: m.title || tab.title, script: () => figureScript(runRef(run), { kind: "series", title: m.title || tab.title, xLabel: "time (s)", yLabel: m.yLabel, series: m.series.map((x) => ({ label: x.label, points: Array.from(x.t, (tt, i) => [tt, x.v[i]]) })) }) });
  }
  if (tab.view === "timeline" && !lv) {
    const sm = V.seriesModel(run.result, run.toml);
    if (sm) return figureTools({ ...common, title: sm.title || tab.title, script: () => figureScript(runRef(run), { kind: "series", title: sm.title, xLabel: sm.xLabel, yLabel: sm.yLabel, series: sm.series.map((x) => ({ label: x.label, points: x.points })) }), chart: chartOfRun(run) });
  }
  if (tab.view === "map" && lv && lv.model.track) {
    const tr = lv.model.track;
    return figureTools({ ...common, title: `${tab.title} · map`, script: () => figureScript(runRef(run), { kind: "map", title: `${tab.title} · track`, series: [], track: { t: Array.from(tr.t), lat: Array.from(tr.lat), lon: Array.from(tr.lon) } }) });
  }
  if (tab.view === "sky" && tab.sky && tab.sky.run === run && tab.sky.data) {
    return figureTools({ ...common, chart: tab.sky.chart, title: `${tab.title} · sky`, script: () => figureScript(runRef(run), { kind: "sky", title: `${tab.title} · sky`, sky: { requests: tab.sky.data.requests } }) });
  }
  return null;
}
// The sky plot of a run (U16): the engine's sky geometry at sampled epochs of the run, on the run's clock.
function skyPane(tab, lv) {
  const run = tab.run;
  if (tab.sky && tab.sky.run === run && tab.sky.el) return tab.sky.el;
  const site = skySite(lv.model);
  const el = h("div", { class: "sky-pane" }, h("p", { class: "panel-msg", text: t("js-desk-sky-working", "Asking the engine for the sky at the run's epochs…") }));
  const sky = { run, el, data: null, chart: null };
  tab.sky = sky;
  if (!S.engine) { el.replaceChildren(h("p", { class: "panel-msg", text: engineMissing() })); return el; }
  const mask = scenarioMask(run.toml) ?? 5;
  const epochs = skyEpochs(lv.model.span[0], lv.model.span[1], 61);
  skyTracks({ call: (fn, text) => S.engine.call(fn, text), buildRequest, parseGeometry, site, epochs, mask }).then((data) => {
    sky.data = data;
    const title = t("js-desk-sky-title", "Sky at { $site }", { site: site.name || `${site.lat.toFixed(3)}, ${site.lon.toFixed(3)}` });
    el.replaceChildren();
    sky.chart = createChart(el, { ...skySpec(data, title), clock: chartClock(lv.clock), height: 440 });
    const k = Math.max(0, epochs.findIndex((x) => x >= lv.clock.t));
    const counts = stateCounts(data.tracks, k);
    el.append(h("div", { class: "sky-states", role: "list", "aria-label": t("js-desk-sky-states", "Satellite states") },
      ...Object.entries(SKY_STATES).filter(([id]) => id !== "unhealthy").map(([id, st]) => h("span", { role: "listitem" }, h("i", { style: `background:var(${id === "used" ? "--k-trust-good" : id === "masked" ? "--k-trust-mid" : "--ink-3"})` }), `${t(`js-desk-sky-${id}`, st.en)} · ${counts[id]}`))),
      h("p", { class: "sky-note", text: t("js-desk-sky-note", "{ $n } epochs sampled over the run; trails join the engine's positions at those epochs. Mask { $mask }°{ $own }. Constellations: the engine's GPS and Galileo presets, propagated to the run's seconds; the engine labels them representative, not the broadcast constellation of a date.", { n: epochs.length, mask, own: scenarioMask(run.toml) === null ? t("js-desk-sky-mask-default", " (the scenario states none)") : "" }) }));
    log({ kind: "sky", title: t("js-desk-log-sky", "Sky plot of { $title }", { title: tab.title }), py: [...skyRequestLines(data.requests, "sky_requests"), "skies = [kshana.sky_geometry(q) for q in sky_requests]"], cli: [] });
    if (S.route === "tab" && activeTab() === tab) render();
  }).catch((e) => { el.replaceChildren(h("p", { class: "panel-msg", text: t("js-desk-sky-failed", "The engine gave no sky for this run: { $reason }", { reason: errorMessage(e) }) })); });
  return el;
}
function panel(tab) {
  const run = tab.run, r = run && run.result;
  const box = h("div", { class: "panel", role: "region", "aria-label": t("js-desk-panel", "Result view") });
  const msg = (text) => { box.append(h("p", { class: "panel-msg", text })); return box; };
  if (!run) return msg(tab.running || !tab.toml ? t("js-desk-panel-wait", "The result appears here when the run finishes.") : t("js-desk-panel-none", "No run yet."));
  if (tab.view === "chart") { if (run.svg) box.append(svgNode(run.svg)); else msg(t("js-desk-no-chart", "The engine drew no chart for this scenario. See Table or JSON.")); return box; }
  const lv = linkedFor(tab);
  if (tab.view === "sky" && lv) { box.classList.add("scroll"); box.append(skyPane(tab, lv)); return box; }
  if (lv && (tab.view === "timeline" || (tab.view === "map" && lv.hasMap))) {
    box.classList.add("linked");
    box.append(lv.node(tab.view));
    return box;
  }
  if (tab.view === "map") {
    const gt = V.groundTrack(r);
    if (!S.land) { S.land = []; fetch("../data/land.json").then((x) => (x.ok ? x.json() : [])).then((l) => { S.land = l; render(); }).catch(() => {}); }
    box.append(svgNode(V.groundTrackSvg(gt, { land: S.land })));
    return box;
  }
  if (tab.view === "timeline") {
    const sm = V.seriesModel(r, run.toml);
    if (sm) box.append(timelineChart(run, sm) || svgNode(V.lineChartSvg(sm).svg)); else msg(t("js-desk-no-series", "This result has no time series to draw. The chart view shows the engine's own chart."));
    return box;
  }
  box.classList.add("scroll");
  if (tab.view === "table") {
    const figs = V.keyFigures(r, 80);
    if (!figs.length) return msg(t("js-desk-no-figures", "This result has no key figures to tabulate. See JSON."));
    box.append(h("table", { class: "tbl" },
      h("thead", {}, h("tr", {}, h("th", { scope: "col", text: t("js-desk-col-figure", "Figure") }), h("th", { scope: "col", class: "num", text: t("js-desk-col-value", "Value") }), h("th", { scope: "col", text: t("js-desk-col-unit", "Unit") }), h("th", { scope: "col", text: t("js-desk-col-path", "Path") }))),
      h("tbody", {}, ...figs.map((f) => { const p = figureParts(f.value, f.unit || ""); return h("tr", {}, h("td", { text: f.label, title: f.note || null }), h("td", { class: "num", text: p.value }), h("td", { class: "n-u", text: p.unit }), h("td", { class: "mono", text: f.path || "" })); }))));
    return box;
  }
  const text = JSON.stringify(r, null, 2);
  const cap = 400000;
  box.append(h("pre", { text: text.length > cap ? `${text.slice(0, cap)}\n…` : text }));
  if (text.length > cap) box.append(h("p", { class: "panel-msg", text: t("js-desk-json-cut", "The result is long: the whole document is in Export, Result JSON.") }));
  return box;
}

// ---------- inspector
function renderInspector() {
  const el = $("inspector");
  const tab = S.route === "tab" ? activeTab() : null;
  el.hidden = !tab;
  if (!tab) { el.replaceChildren(); return; }
  el.setAttribute("aria-label", t("js-desk-inspector", "Inspector"));
  const tabs = [["inputs", t("js-desk-ins-inputs", "Inputs")], ["result", t("js-desk-ins-result", "Result")], ["export", t("js-desk-ins-export", "Export")]];
  const list = h("div", { class: "ins-tabs", role: "tablist", "aria-label": t("js-desk-inspector", "Inspector"), onkeydown: (e) => {
    const i = tabs.findIndex((x) => x[0] === tab.ins), j = tabKeyIndex(e.key, i, tabs.length);
    if (j === null) return;
    e.preventDefault(); tab.ins = tabs[j][0]; render(); $(`ins-${tab.ins}`).focus();
  } }, ...tabs.map(([id, label]) => h("button", { type: "button", role: "tab", id: `ins-${id}`, "aria-selected": tab.ins === id ? "true" : "false", "aria-controls": "ins-body", tabindex: tab.ins === id ? "0" : "-1", onclick: () => { tab.ins = id; render(); } }, label)));
  const body = h("div", { class: "ins-body", id: "ins-body", role: "tabpanel", "aria-labelledby": `ins-${tab.ins}` }, ...({ inputs: inputsPane, result: resultPane, export: exportPane }[tab.ins])(tab));
  const lines = reproduceLines({ file: tab.file, bundled: !tab.custom, edited: tab.toml !== tab.baseToml }).join("\n");
  const repro = h("div", { class: "repro" },
    h("div", { class: "row" }, h("span", { class: "lab", style: "color:var(--ink-2);font-size:12px", id: "repro-h", text: t("js-desk-reproduce", "Reproduce") }), h("div", { class: "grow" }),
      h("button", { class: "btn", type: "button", style: "height:24px;padding:0 8px", "aria-label": t("js-desk-copy-command", "Copy the command"), onclick: () => copyText(lines) }, ic("copy"))),
    h("code", { "aria-labelledby": "repro-h", text: lines }),
    h("span", { class: "hint", style: "color:var(--ink-3);font-size:11.5px", text: tab.toml !== tab.baseToml || tab.custom ? t("js-desk-reproduce-edited", "Save the scenario (Export) under this name first. The same file and engine version give the same result.") : t("js-desk-reproduce-note", "The same file and engine version give the same result.") }));
  const lv = tab.run ? linkedFor(tab) : null;
  el.replaceChildren(...(lv ? [lv.readout()] : []), list, body, repro);
}
function inputsPane(tab) {
  if (!tab.toml) return [h("p", { class: "hint", text: t("js-desk-loading", "Loading…") })];
  const ranked = rankInputs(numericFields(tab.toml), [], []).filter((x) => x.field).slice(0, 8);
  const out = [];
  if (!ranked.length) out.push(h("p", { class: "hint", text: t("js-desk-no-inputs", "This scenario has no single-number settings to change here.") }));
  const seen = new Map();
  for (const item of ranked) seen.set(inputLabel(item).text, (seen.get(inputLabel(item).text) || 0) + 1);
  ranked.forEach((item, n) => {
    const id = `in-${tab.id}-${n}`;
    const lab = inputLabel(item);
    // Two settings of the same name (one per clock, per jammer) say which section each is in.
    if (seen.get(lab.text) > 1 && item.field.section) lab.term = `[${item.field.section}]${lab.term ? ` ${lab.term}` : ""}`;
    const input = h("input", { class: "input mono", id, type: "text", inputmode: "decimal", spellcheck: "false", value: item.field.raw, "aria-describedby": item.hint ? `${id}-h` : null });
    input.addEventListener("change", () => {
      const v = Number(input.value.trim());
      if (!input.value.trim() || !Number.isFinite(v)) { input.value = item.field.raw; toast(t("js-desk-not-number", "Write a number.")); return; }
      tab.toml = patchField(tab.toml, item.field, v);
      log({ kind: "edit", title: t("js-desk-log-edit", "Change { $key }", { key: item.field.key || lab.text }), ...editLines({ section: item.field.section || "", key: item.field.key || lab.text, raw: item.field.raw, value: v, file: tab.file }) });
      runTab(tab);
    });
    out.push(h("div", { class: "field" }, h("label", { for: id }, lab.text, lab.term ? h("span", { class: "muted mono", style: "margin-left:6px;font-size:11px", text: lab.term }) : null), input, item.hint ? h("span", { class: "hint", id: `${id}-h`, text: item.hint }) : null));
  });
  if (tab.toml !== tab.baseToml) out.push(h("div", { class: "row" }, h("span", { class: "hint", text: t("js-desk-edited-note", "Changed from the bundled file.") }), h("button", { class: "btn", type: "button", onclick: () => { tab.toml = tab.baseToml; log({ kind: "edit", title: t("js-desk-log-reset", "Reset { $title }", { title: tab.title }), py: [`# ${scenarioName(tab.file)}.toml back to the bundled text`], cli: [] }); runTab(tab); render(); } }, t("js-desk-reset", "Reset"))));
  out.push(h("p", { class: "hint", text: t("js-desk-inputs-note", "A change runs the scenario again. The whole file is under Export.") }));
  return out;
}
function resultPane(tab) {
  const run = tab.run;
  if (!run) return [h("p", { class: "hint", text: t("js-desk-panel-none", "No run yet.") })];
  const out = [h("p", { style: "margin:0", text: answerOf(run) })];
  const cards = kpis(run.result, run.toml, 8);
  if (cards.length) out.push(h("ul", { class: "figlist", "aria-label": t("js-desk-key-figures", "Key figures") }, ...cards.map((c) => h("li", { class: c.state ? `state-${c.state}` : null, title: c.why || null }, h("span", { text: c.sub ? `${c.k} · ${c.sub}` : c.k }), c.text ? h("span", { text: c.text }) : numNode(typeof c.v === "number" ? c.v : String(c.v ?? ""), c.unit || "")))));
  out.push(h("div", { class: "ins-sep" }));
  const tier = tierOf(run);
  out.push(h("div", { class: "field" }, h("span", { class: "lab", text: t("js-desk-evidence", "Evidence") }),
    tier ? h("span", { class: `tier ${tier.cls}`, text: tierText(tier.tier) }) : null,
    h("span", { class: "hint", text: tier ? (tier.rows ? t("js-desk-evidence-rows", "The engine names { $n } rows of the verification ledger behind this result; MODELLED means the model is not yet checked against an outside reference here.", { n: tier.rows }) : tier.text || "") : t("js-desk-evidence-none", "The result states no tier.") })));
  const meta = fileMeta(run.result, S.version, run.toml);
  const dl = h("dl", { class: "kv" });
  const add = (k, v) => dl.append(h("dt", { text: k }), h("dd", { text: v }));
  add(t("js-desk-meta-engine", "engine"), `${meta.ver} (${run.engine === "native" ? t("js-desk-native", "native") : t("js-desk-webassembly", "WebAssembly")})`);
  if (meta.hash) add(t("js-desk-meta-scenario", "scenario"), String(meta.hash).slice(0, 12));
  if (typeof run.result.seed === "number") add(t("js-desk-meta-seed-k", "seed"), String(run.result.seed));
  add(t("js-desk-meta-time", "time"), fmtDuration(Math.max(1, Math.round(run.ms)) / 1000));
  add(t("js-desk-meta-at", "ran at"), fmtUtc(run.at));
  if (run.summary) add(t("js-desk-meta-summary", "summary"), run.summary);
  out.push(dl);
  return out;
}
function exportPane(tab) {
  const run = tab.run;
  const b = (label, onclick, disabled, icon = "down") => h("button", { class: "btn", type: "button", disabled: disabled ? true : null, onclick }, ic(icon), label);
  return [h("div", { class: "ex-list" },
    b(t("js-desk-export-pack", "Evidence pack (.zip)"), () => exportPack(run), !run),
    b(t("js-desk-export-chart", "Chart (.svg)"), () => exportRun(run, "svg"), !run || !run.svg),
    b(t("js-desk-export-result", "Result (.json)"), () => exportRun(run, "json"), !run),
    run && run.csv ? b(t("js-desk-export-table", "Table (.csv)"), () => exportRun(run, "csv"), false) : null,
    b(t("js-desk-export-scenario", "Scenario file (.toml)"), () => exportRun(run || { file: tab.file, toml: tab.toml, result: {} }, "toml"), !tab.toml),
    h("button", { class: "btn pro", type: "button", onclick: () => go("upgrade") }, ic("dossiers"), t("js-desk-export-dossier", "Signed dossier"), h("span", { class: "pro-tag", style: "margin-left:auto", text: "PRO" }))),
  h("p", { class: "hint", text: t("js-desk-export-note", "The evidence pack is unsigned: the scenario, the result, the chart and a SHA-256 manifest of each file.") })];
}

// ---------- runs
function runsTable(list, { select = true } = {}) {
  return h("table", { class: "tbl runs" },
    h("caption", { class: "vh", text: t("js-desk-runs-caption", "Runs this session") }),
    h("thead", {}, h("tr", {}, select ? h("th", { scope: "col" }, h("span", { class: "vh", text: t("js-desk-col-select", "Select") })) : null,
      ...[t("js-desk-col-scenario", "Scenario"), t("js-desk-col-domain", "Area"), t("js-desk-col-result", "Result"), t("js-desk-col-evidence", "Evidence"), t("js-desk-col-when", "When")].map((x) => h("th", { scope: "col", text: x })),
      select ? h("th", { scope: "col", text: t("js-desk-col-keep", "Pin, tags, note") }) : null)),
    h("tbody", {}, ...list.map((run) => {
      const c = stripCards(run, 1)[0];
      const tier = tierOf(run);
      const cb = h("input", { type: "checkbox", id: `sel-${run.id}`, "aria-label": t("js-desk-select-run", "Select run { $n }, { $title }, for comparison", { n: run.id, title: run.title }) });
      cb.checked = RUNS.isSelected(run.id);
      cb.addEventListener("change", () => { RUNS.toggle(run.id, cb.checked); S.compare = null; render(); });
      return h("tr", { class: RUNS.isSelected(run.id) ? "sel" : null },
        select ? h("td", {}, cb) : null,
        h("td", {}, h("button", { class: "q-btn", type: "button", style: "margin:0;padding:2px 6px", onclick: () => reopenRun(run) }, `${run.title}${run.edited ? ` · ${t("js-desk-meta-edited", "edited")}` : ""}`), h("span", { class: "muted mono", style: "font-size:11px;margin-left:6px", text: `#${run.id}` })),
        h("td", { style: `color:${domColor(run.domain)}` }, h("span", { style: "display:inline-flex;align-items:center;gap:6px" }, domainMark(run.domain, domColor(run.domain)), domLabel(run.domain))),
        h("td", {}, c ? [numNode(c.v, c.unit), c.k ? h("span", { class: "muted", text: ` · ${c.k}` }) : null] : ""),
        h("td", {}, tier ? h("span", { class: `tier ${tier.cls}`, style: "margin:0", text: tierText(tier.tier) }) : "–"),
        h("td", { class: "muted", text: agoText(run.at) }),
        select ? h("td", {}, h("div", { class: "run-tools" },
          h("button", { class: `btn fig-btn${run.pinned ? " pin-on" : ""}`, type: "button", "aria-pressed": run.pinned ? "true" : "false", "aria-label": t("js-desk-pin-run", "Pin run { $n }", { n: run.id }), title: t("js-desk-pin", "Pin"), onclick: () => { run.pinned = !run.pinned; saveSoon(); render(); } }, run.pinned ? "★" : "☆"),
          ...(run.tags || []).map((g) => h("span", { class: "run-tag", text: g })),
          run.note ? h("span", { class: "muted", title: run.note, text: run.note.length > 28 ? `${run.note.slice(0, 27)}…` : run.note }) : null,
          h("button", { class: "btn fig-btn", type: "button", "aria-expanded": S.editRun === run.id ? "true" : "false", onclick: () => { S.editRun = S.editRun === run.id ? null : run.id; render(); } }, t("js-desk-run-edit", "Edit")),
          h("button", { class: "btn fig-btn", type: "button", title: t("js-desk-replay-title", "Run the recipe again and compare the result bytes"), onclick: () => replayRun(run) }, run.replay ? (run.replay.identical ? t("js-desk-replay-same", "Replayed: identical") : t("js-desk-replay-diff", "Replayed: differs")) : t("js-desk-replay", "Replay")))) : null);
    })));
}
// Run a run's recipe (its scenario text) again and say whether the result bytes are the same (U8).
async function replayRun(run) {
  if (!S.engine) { toast(engineMissing()); return; }
  try {
    const all = JSON.parse(await S.engine.call("run_all", run.toml));
    const r = await replayCheck(run.json || JSON.stringify(run.result), all.json, (b) => crypto.subtle.digest("SHA-256", b));
    run.replay = { identical: r.identical, at: new Date().toISOString(), sha: r.after };
    if (run.console) log({ kind: "replay", title: t("js-desk-log-replay", "Replay run { $n }", { n: run.console }), py: [`print("replay of run ${run.console} identical:", hashlib.sha256(kshana.run(toml_${run.console}).encode()).hexdigest() == ${JSON.stringify(run.resultSha || r.before)})`], cli: [] });
    toast(r.identical ? t("js-desk-replay-ok", "Run #{ $n } replayed: the result is byte for byte the same (SHA-256 { $sha }).", { n: run.id, sha: r.after.slice(0, 12) }) : t("js-desk-replay-bad", "Run #{ $n } replayed: the result differs (engine { $then } then, { $now } now).", { n: run.id, then: run.engineVersion || "?", now: S.version }));
    render();
  } catch (e) { toast(t("js-desk-replay-failed", "The replay failed: { $reason }", { reason: errorMessage(e) })); }
}
function runEditor(run) {
  const tags = h("input", { class: "input mono", id: "run-tags", type: "text", value: (run.tags || []).join(", "), spellcheck: "false" });
  const note = h("textarea", { class: "input notes", id: "run-note", rows: "3" });
  note.value = run.note || "";
  return h("section", { class: "card", style: "margin-top:12px;max-width:640px", "aria-label": t("js-desk-run-edit-title", "Run #{ $n }", { n: run.id }) },
    h("h3", { text: t("js-desk-run-edit-title", "Run #{ $n }", { n: run.id }) + ` · ${run.title}` }),
    h("div", { class: "field" }, h("label", { for: "run-tags", text: t("js-desk-run-tags", "Tags (separated by commas or spaces)") }), tags),
    h("div", { class: "field" }, h("label", { for: "run-note", text: t("js-desk-run-note", "Note") }), note),
    h("div", { class: "row" },
      h("button", { class: "btn primary", type: "button", onclick: () => { run.tags = parseTags(tags.value); run.note = note.value.slice(0, 4000); S.editRun = null; saveSoon(); render(); } }, t("js-desk-run-save", "Keep")),
      h("button", { class: "btn", type: "button", onclick: () => { S.editRun = null; render(); } }, t("js-desk-cancel", "Cancel"))),
    h("p", { class: "hint", text: t("js-desk-run-uid", "Kept on disk as runs/{ $uid } of the project: the scenario, the engine's result as written, and their SHA-256.", { uid: run.uid || "?" }) }));
}
function reopenRun(run) {
  let tab = S.tabs.find((x) => x.id === run.tabId) || S.tabs.find((x) => x.file === run.file && x.custom === run.custom);
  if (!tab) tab = newTab({ file: run.file, entry: entryFor(run.file), custom: run.custom, title: run.title, domain: run.domain, toml: run.toml, baseToml: run.custom ? run.toml : run.toml });
  tab.run = run; tab.toml = run.toml;
  showTab(tab.id);
}
function runsView() {
  const sel = RUNS.selected();
  const page = h("section", { class: "page", "aria-labelledby": "runs-h" },
    h("h1", { id: "runs-h", text: t("js-desk-runs-title", "Runs") }),
    h("p", { class: "lede", text: t("js-desk-runs-lede-kept", "Every run of the project, pinned first, then newest. Runs are kept on disk with the project and come back when the app opens again. Select two to compare them figure by figure.") }));
  if (!RUNS.size) { page.append(h("p", { class: "empty", text: t("js-desk-runs-empty", "No runs yet this session. Open a scenario from the library or press { $key }.", { key: KEY }) })); return page; }
  const q = h("input", { class: "input", id: "runs-q", type: "search", value: S.runQuery, autocomplete: "off", placeholder: t("js-desk-runs-ph", "Search: words, tag:name, is:pinned, is:edited") });
  q.addEventListener("change", () => { S.runQuery = q.value; render(); $("runs-q")?.focus(); });
  page.append(h("div", { class: "field", style: "max-width:420px;margin-bottom:8px" }, h("label", { for: "runs-q", text: t("js-desk-runs-search", "Search the runs") }), q));
  page.append(h("div", { class: "row", style: "margin-bottom:12px" },
    h("button", { class: "btn primary", type: "button", id: "btn-compare", disabled: sel.length !== 2 ? true : null, onclick: () => { S.compare = sel.map((r) => r.id); log({ kind: "compare", title: t("js-desk-log-compare", "Compare runs #{ $a } and #{ $b }", { a: sel[0].id, b: sel[1].id }), py: sel.every((r) => r.console) ? [`# compare result_${sel[0].console} and result_${sel[1].console} figure by figure`] : [], cli: [] }); render(); $("cmp-h")?.focus(); } }, t("js-desk-compare", "Compare the 2 selected runs")),
    h("span", { class: "muted", role: "status", text: t("js-desk-selected", { one: "{ $n } run selected", other: "{ $n } runs selected" }, { n: sel.length }) }),
    sel.length ? h("button", { class: "btn", type: "button", onclick: () => { RUNS.clearSelection(); S.compare = null; render(); } }, t("js-desk-clear", "Clear the selection")) : null));
  const shown = searchRuns(RUNS.list(), S.runQuery);
  page.append(shown.length ? runsTable(shown) : h("p", { class: "empty", text: t("js-desk-runs-none-match", "No run matches.") }));
  const er = S.editRun !== null ? RUNS.get(S.editRun) : null;
  if (er) page.append(runEditor(er));
  const pair = S.compare && S.compare.map((id) => RUNS.get(id));
  if (pair && pair.every(Boolean)) page.append(compareView(pair[0], pair[1]));
  return page;
}
function compareView(a, b) {
  const rows = compareRows(kpis(a.result, a.toml, 8), kpis(b.result, b.toml, 8));
  const val = (x, unit) => (x === null ? "–" : typeof x === "number" ? figureParts(x, unit).text : String(x));
  return h("section", { class: "cmp", "aria-labelledby": "cmp-h" },
    h("h2", { id: "cmp-h", tabindex: "-1", text: t("js-desk-compare-title", "Run #{ $a } against run #{ $b }", { a: a.id, b: b.id }) }),
    h("p", { class: "muted", style: "margin:0 0 10px", text: `A: ${a.title} · B: ${b.title}` }),
    rows.length ? h("table", { class: "tbl" },
      h("thead", {}, h("tr", {}, h("th", { scope: "col", text: t("js-desk-col-figure", "Figure") }), h("th", { scope: "col", class: "num", text: "A" }), h("th", { scope: "col", class: "num", text: "B" }), h("th", { scope: "col", class: "num", text: t("js-desk-col-change", "B − A") }))),
      h("tbody", {}, ...rows.map((r) => h("tr", {}, h("td", { text: r.sub ? `${r.label} · ${r.sub}` : r.label }), h("td", { class: "num", text: val(r.a, r.unit) }), h("td", { class: "num", text: val(r.b, r.unit) }),
        h("td", { class: `num ${r.delta > 0 ? "up" : r.delta < 0 ? "down" : ""}`, text: r.delta === null ? "–" : `${r.delta > 0 ? "+" : r.delta < 0 ? "−" : ""}${V.fmt(Math.abs(r.delta))}${r.pct !== null && r.delta ? ` (${r.pct > 0 ? "+" : "−"}${Math.abs(r.pct).toFixed(1)} %)` : ""}` }))))) : h("p", { class: "empty", text: t("js-desk-compare-none", "These two runs share no key figures.") }),
    h("div", { class: "cmp-charts" }, ...[a, b].map((r, i) => h("figure", { style: "margin:0" }, h("figcaption", { class: "muted", style: "margin-bottom:6px", text: `${i ? "B" : "A"} · ${r.title}` }), h("div", { class: "panel" }, r.svg ? svgNode(r.svg) : h("p", { class: "panel-msg", text: t("js-desk-no-chart-short", "No chart.") }))))));
}

// ---------- library
function libraryView() {
  const id = "lib-q";
  const input = h("input", { class: "input", id, type: "search", value: S.libQuery, autocomplete: "off", placeholder: t("js-desk-lib-placeholder", "Jamming, holdover, ARAIM, lunar…") });
  const results = h("div", { id: "lib-results" });
  const fill = () => {
    const groups = groupedLibrary(S.libQuery);
    const n = groups.reduce((m, g) => m + g.items.length, 0);
    results.replaceChildren(h("p", { class: "muted", role: "status", text: t("js-desk-lib-count", { one: "{ $n } scenario", other: "{ $n } scenarios" }, { n }) }),
      ...groups.map((g) => h("section", { "aria-label": g.domain.label },
        h("h2", { class: "lib-h", style: "display:flex;align-items:center;gap:8px" }, domainMark(g.domain.id, domColor(g.domain.id)), g.domain.label),
        h("div", { class: "grid" }, ...g.items.map((e) => h("button", { class: "card q-btn", type: "button", style: "margin:0", onclick: () => openScenario(e.file, { inNewTab: true }) }, h("b", { text: e.title }), h("small", { text: e.question })))))));
  };
  input.addEventListener("input", () => { S.libQuery = input.value; fill(); });
  fill();
  return h("section", { class: "page", "aria-labelledby": "lib-h" },
    h("h1", { id: "lib-h", text: t("js-desk-lib-title", "Scenario library") }),
    h("p", { class: "lede", text: t("js-desk-lib-lede", "The bundled scenarios, by area. Each opens in its own tab and runs at once.") }),
    h("div", { class: "field", style: "max-width:420px;margin-bottom:8px" }, h("label", { for: id, text: t("js-desk-lib-search", "Search scenarios") }), input),
    results);
}

// ---------- devices
function devicesView() {
  const D = S.devices;
  const page = h("section", { class: "page", "aria-labelledby": "dev-h" },
    h("h1", { id: "dev-h", text: t("js-desk-dev-title", "Devices") }),
    h("p", { class: "lede", text: t("js-desk-dev-lede", "Read a receiver's NMEA 0183 output from a serial or USB port, a TCP stream or a file that is still being written. The app only reads: nothing is written to the device.") }));
  if (!D.api) { page.append(h("p", { class: "notice", text: t("js-desk-dev-no-native", "Live devices are read by the app's native side, which this window does not have.") })); return page; }
  const st = D.status || {};
  const portSel = h("select", { class: "input", id: "dev-port" }, h("option", { value: "", text: D.list.length ? t("js-desk-dev-pick", "Choose a port…") : t("js-desk-dev-no-ports", "No serial ports found") }), ...D.list.map((p) => h("option", { value: p.path, text: p.label && p.label !== p.path ? `${p.label} (${p.path})` : p.path })));
  const src = h("input", { class: "input mono", id: "dev-src", type: "text", placeholder: "tcp:192.168.1.20:10110", spellcheck: "false" });
  const baud = h("select", { class: "input", id: "dev-baud" }, ...BAUDS.map((b) => h("option", { value: b, text: b || t("js-desk-dev-baud-keep", "as the port is set") })));
  page.append(h("div", { class: "card", style: "max-width:640px" },
    h("div", { class: "field" }, h("label", { for: "dev-port", text: t("js-desk-dev-port", "Serial or USB port") }), portSel),
    h("div", { class: "field" }, h("label", { for: "dev-src", text: t("js-desk-dev-source", "Or a source: tcp:<host>:<port> or file:<path>") }), src),
    h("div", { class: "field" }, h("label", { for: "dev-baud", text: t("js-desk-dev-baud", "Speed (baud)") }), baud),
    h("div", { class: "row" },
      h("button", { class: "btn primary", type: "button", disabled: st.running ? true : null, onclick: async () => {
        const source = src.value.trim() || portSel.value;
        if (!source) { toast(t("js-desk-dev-need-source", "Choose a port or write a source.")); return; }
        try { await D.api.start(source, baud.value); D.msg = ""; } catch (e) { D.msg = errorMessage(e); }
        await pollDevices(); render();
      } }, t("js-desk-dev-start", "Start reading")),
      h("button", { class: "btn", type: "button", disabled: st.running ? null : true, onclick: async () => { await D.api.stop(); await pollDevices(); render(); } }, t("js-desk-dev-stop", "Stop")),
      h("button", { class: "btn", type: "button", onclick: async () => { D.list = await D.api.list().catch(() => []); render(); } }, t("js-desk-dev-refresh", "Refresh the ports")))));
  if (D.msg) page.append(h("p", { class: "notice error", role: "alert", text: D.msg }));
  const dl = h("dl", { class: "kv", style: "margin-top:16px;max-width:640px" });
  const add = (k, v) => dl.append(h("dt", { text: k }), h("dd", { text: v }));
  add(t("js-desk-dev-state", "state"), st.running ? t("js-desk-dev-reading", "reading") : t("js-desk-dev-idle", "not reading"));
  if (st.source) add(t("js-desk-dev-src-k", "source"), String(st.source));
  if (typeof st.sentences === "number") add(t("js-desk-dev-sentences", "sentences"), fmtCount(st.sentences));
  if (st.error) add(t("js-desk-dev-error", "error"), String(st.error));
  page.append(h("h2", { text: t("js-desk-dev-status", "Status") }), dl,
    h("p", { class: "muted", style: "margin-top:16px", text: t("js-desk-dev-score", "The Studio's receiver-trust page scores the latest sentences every five seconds:") }),
    h("a", { href: "../trust/index.html", text: t("js-desk-dev-trust-link", "Open the receiver-trust page (leaves this window's tabs)") }));
  return page;
}
async function pollDevices() {
  const D = S.devices;
  if (!D.api) return;
  try { D.status = await D.api.status(); } catch { D.status = null; }
}

// ---------- evidence packs
function evidenceView() {
  const page = h("section", { class: "page", "aria-labelledby": "ev-h" },
    h("h1", { id: "ev-h", text: t("js-desk-ev-title", "Evidence packs") }),
    h("p", { class: "lede", text: t("js-desk-ev-lede", "A run's evidence pack is one zip file: the scenario, the engine's result, its chart and table, and a manifest with the SHA-256 of every file. Anyone with the same engine version can rerun the scenario and compare.") }));
  const list = RUNS.list();
  if (!list.length) page.append(h("p", { class: "empty", text: t("js-desk-ev-empty", "Run a scenario first: each run of this session can be exported here.") }));
  else page.append(h("table", { class: "tbl" },
    h("thead", {}, h("tr", {}, ...[t("js-desk-col-scenario", "Scenario"), t("js-desk-col-evidence", "Evidence"), t("js-desk-col-when", "When"), t("js-desk-col-pack", "Pack")].map((x) => h("th", { scope: "col", text: x })))),
    h("tbody", {}, ...list.map((run) => { const tier = tierOf(run); return h("tr", {}, h("td", { text: `${run.title} #${run.id}` }), h("td", {}, tier ? h("span", { class: `tier ${tier.cls}`, style: "margin:0", text: tierText(tier.tier) }) : "–"), h("td", { class: "muted", text: agoText(run.at) }),
      h("td", {}, h("button", { class: "btn", type: "button", "aria-label": t("js-desk-ev-export-run", "Export the evidence pack of run { $n }", { n: run.id }), onclick: () => exportPack(run) }, ic("down"), t("js-desk-ev-export", "Export"))));
    }))));
  page.append(h("div", { class: "card pro-card", style: "margin-top:20px;max-width:640px" },
    h("h3", {}, ic("dossiers"), t("js-desk-pro-dossiers", "Studies and signed dossiers"), h("span", { class: "pro-tag", text: "PRO" })),
    h("p", { text: t("js-desk-ev-pro", "Signing a pack, so a reviewer can check who made it and that no byte changed, comes with Pro.") }),
    h("button", { class: "linkish", type: "button", onclick: () => go("upgrade") }, t("js-desk-see-pro", "See what Pro adds →"))));
  return page;
}

// ---------- files
function filesView() {
  const input = h("input", { type: "file", id: "file-in", accept: ".toml,text/plain", class: "vh" });
  input.addEventListener("change", async () => {
    const f = input.files && input.files[0];
    if (!f) return;
    if (f.size > 4 * 1024 * 1024) { toast(t("js-desk-file-too-big", "A scenario file is a few kilobytes; this one is too large.")); return; }
    const text = await f.text();
    S.files.unshift({ name: f.name, size: f.size, text });
    openText(f.name, text);
  });
  const any = h("input", { type: "file", id: "data-in", multiple: true, class: "vh" });
  any.addEventListener("change", () => { if (any.files && any.files.length) inspectFiles([...any.files]); });
  const D = S.detective;
  return h("section", { class: "page", "aria-labelledby": "files-h" },
    h("h1", { id: "files-h", text: t("js-desk-files-title-project", "Files and project") }),
    h("h2", { text: t("js-desk-drop-title", "Drop anything in") }),
    h("p", { class: "lede", text: t("js-desk-drop-lede", "Drop receiver logs (RINEX, UBX, NMEA, SBF, NovAtel, RTCM 3 and the other formats the engine reads), SP3 and navigation files, clock logs, IQ recordings, track files or a whole folder on this window. The engine's own readers say what each one is, its span, constellations and gaps, before anything is loaded.") }),
    h("div", { class: "row" }, any, h("label", { for: "data-in", class: "btn", tabindex: "0", role: "button", onkeydown: (e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); any.click(); } } }, t("js-desk-drop-choose", "Choose files to inspect…"))),
    D.msg ? h("p", { class: "notice", role: "status", text: D.msg }) : null,
    D.busy ? h("p", { class: "busy", role: "status" }, h("span", { class: "spin", "aria-hidden": "true" }), t("js-desk-drop-busy", "Reading…")) : null,
    D.answers.length ? h("div", { class: "det-list" }, ...D.answers.map(detItem)) : null,
    S.project.links.length ? [h("h2", { text: t("js-desk-links-title", "Data links of the project") }), h("ul", {}, ...S.project.links.map((l, i) => h("li", {}, h("span", { class: "mono", text: l.path }), h("span", { class: "muted", text: ` · ${familyLabel(l.family) || l.format || ""}` }), " ",
      h("button", { class: "linkish", type: "button", onclick: () => { S.project.links.splice(i, 1); saveSoon(); render(); } }, t("js-desk-links-remove", "remove")))))] : null,
    projectBox(),
    h("h2", { text: t("js-desk-files-scenario", "Scenario files") }),
    h("p", { class: "lede", text: t("js-desk-files-lede", "Open a scenario file from this machine. It opens in its own tab and runs with the engine here; the file is read, never changed.") }),
    h("div", { class: "row" }, input, h("label", { for: "file-in", class: "btn primary", tabindex: "0", role: "button", onkeydown: (e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); input.click(); } } }, t("js-desk-files-open", "Open a scenario file (.toml)…"))),
    S.files.length ? [h("h2", { text: t("js-desk-files-recent", "Opened this session") }), h("ul", {}, ...S.files.map((f) => h("li", {}, h("button", { class: "linkish", type: "button", onclick: () => openText(f.name, f.text) }, f.name), h("span", { class: "muted", text: ` · ${Math.ceil(f.size / 1024)} KB` }))))] : null,
    h("h2", { text: t("js-desk-files-studio", "The Studio's tool pages") }),
    h("p", { class: "muted", style: "margin:0 0 8px", text: t("js-desk-files-studio-note", "These pages open in this window, in place of the tabs here.") }),
    h("ul", {}, ...[["../tools/index.html", t("js-desk-files-tools", "Tools: evidence packs, telemetry, receiver checks")], ["../geometry/index.html", t("js-desk-files-geometry", "Sky geometry: skyplot, skyline and DOP")], ["../iq/index.html", t("js-desk-files-iq", "IQ recordings")], ["../index.html", t("js-desk-files-classic", "The Studio's question view")]].map(([href, label]) => h("li", {}, h("a", { href, text: label })))),
  );
}

// One answer of the format detective (U9).
function detItem(a) {
  const rows = detectiveRows(a, t);
  const sc = a.ok && a.opens_as && a.path;
  return h("article", { class: `det-item${a.ok ? "" : " bad"}` },
    h("h3", {}, h("span", { text: a.name || "?" }), a.folder ? h("small", { text: a.folder }) : null, a.ok ? h("small", { text: familyLabel(a.family) }) : null),
    h("dl", { class: "kv" }, ...rows.flatMap((r) => [h("dt", { text: r.k }), h("dd", { class: r.warn ? "warn" : null, text: r.v })])),
    a.ok ? h("div", { class: "row", style: "margin-top:8px" },
      sc ? h("button", { class: "btn primary", type: "button", onclick: () => openDropped(a) }, a.opens_as.kind === "clock-log" ? t("js-desk-det-open-clock", "Open beside the clock simulation") : t("js-desk-det-open-trust", "Open as a receiver-trust run")) : null,
      h("button", { class: "btn", type: "button", onclick: () => addLink(a) }, t("js-desk-det-link", "Keep as a data link")),
      !a.path ? h("span", { class: "hint", text: t("js-desk-det-no-path", "Dropped without its path: drop it on the app's window to open it as a run.") }) : null) : null);
}
// The project box (U8): which folder the session is kept in; open or start another.
function projectBox() {
  const P = S.project;
  const nameIn = h("input", { class: "input", id: "proj-name", type: "text", placeholder: t("js-desk-proj-name-ph", "Baltic approach study") });
  const pathIn = h("input", { class: "input mono", id: "proj-path", type: "text", spellcheck: "false", placeholder: P.home ? joinPath(P.home, "Study.kshana") : "/home/me/Kshana/Study.kshana" });
  const notes = h("textarea", { class: "input notes", id: "proj-notes", rows: "5" });
  notes.value = P.notes;
  notes.addEventListener("change", () => { P.notes = notes.value; saveSoon(); });
  return h("section", { class: "card", "aria-labelledby": "proj-h", style: "max-width:800px;margin-bottom:18px" },
    h("h2", { id: "proj-h", style: "margin-top:0", text: t("js-desk-proj-title", "Project: { $name }", { name: P.name }) }),
    h("p", { class: "muted", style: "margin:0 0 10px", text: P.dir ? t("js-desk-proj-where", "Folder { $dir }. Runs, open tabs, the clock and markers of each, notes, data links and the console are kept there as plain files and come back when the app opens again.", { dir: P.dir }) : t("js-desk-proj-where-local", "This window keeps the session in its own storage.") }),
    P.status && !(P.dir && P.status.endsWith(P.dir)) ? h("p", { class: "hint", role: "status", text: P.status }) : null,
    invoke ? h("div", { class: "project-box" },
      h("div", { class: "field", style: "margin:0" }, h("label", { for: "proj-name", text: t("js-desk-proj-new", "Keep this session as a new project named") }), nameIn),
      h("button", { class: "btn", type: "button", onclick: () => { const n = nameIn.value.trim(); if (!n || !P.home) { toast(t("js-desk-proj-need-name", "Write a name first.")); return; } P.name = n; P.created = new Date().toISOString(); P.dir = joinPath(P.home, projectFolderName(n)); P.saved = []; try { localStorage.setItem(DIR_KEY, P.dir); } catch { /* not remembered */ } saveProject().then(render); log({ kind: "project", title: t("js-desk-log-project-new", "New project { $name }", { name: n }), py: [`# project folder: ${P.dir}`], cli: [] }); } }, t("js-desk-proj-save-as", "Keep as project")),
      h("div", { class: "field", style: "margin:0" }, h("label", { for: "proj-path", text: t("js-desk-proj-open-label", "Open the project folder (a folder ending in .kshana)") }), pathIn),
      h("button", { class: "btn", type: "button", onclick: () => { const d = pathIn.value.trim(); if (!/\.kshana[\\/]?$/.test(d)) { toast(t("js-desk-proj-need-kshana", "A project folder's name ends in .kshana.")); return; } openProject(d.replace(/[\\/]+$/, "")); } }, t("js-desk-proj-open", "Open"))) : null,
    h("div", { class: "field", style: "margin-top:12px" }, h("label", { for: "proj-notes", text: t("js-desk-proj-notes", "Notes (kept as notebooks/notes.md)") }), notes));
}

// ---------- the console (U10): every action's Python and command line
let consoleLang = "py";
function consoleView() {
  const list = MIRROR.list();
  const page = h("section", { class: "page", "aria-labelledby": "con-h" },
    h("h1", { id: "con-h", text: t("js-desk-con-title", "Console") }),
    h("p", { class: "lede", text: t("js-desk-con-lede", "What each action in this window does, as Python (the kshana package) and as the command line. Pasted into Python, the session's script runs every scenario again and prints whether each result has the same SHA-256 as here.") }),
    h("div", { class: "row", style: "margin-bottom:12px" },
      h("div", { class: "seg", role: "group", "aria-label": t("js-desk-con-lang", "Language") },
        h("button", { type: "button", "aria-pressed": consoleLang === "py" ? "true" : "false", onclick: () => { consoleLang = "py"; render(); } }, "Python"),
        h("button", { type: "button", "aria-pressed": consoleLang === "cli" ? "true" : "false", onclick: () => { consoleLang = "cli"; render(); } }, t("js-desk-con-cli", "Command line"))),
      h("button", { class: "btn primary", type: "button", disabled: list.length ? null : true, onclick: () => copyText(consoleLang === "py" ? sessionPython(list) : sessionShell(list)) }, ic("copy"), consoleLang === "py" ? t("js-desk-con-copy-py", "Copy the session as Python") : t("js-desk-con-copy-sh", "Copy the session as a shell script")),
      h("button", { class: "btn", type: "button", disabled: list.length ? null : true, onclick: () => save(new Blob([consoleLang === "py" ? sessionPython(list) : sessionShell(list)], { type: "text/plain" }), consoleLang === "py" ? "kshana-session.py" : "kshana-session.sh") }, ic("down"), t("js-desk-con-save", "Save as a file")),
      h("button", { class: "btn", type: "button", disabled: list.length ? null : true, onclick: () => { MIRROR.clear(); saveSoon(); render(); } }, t("js-desk-con-clear", "Clear"))));
  if (!list.length) { page.append(h("p", { class: "empty", text: t("js-desk-con-empty", "Nothing yet: open a scenario, change a setting, run, export or drop a file in.") })); return page; }
  page.append(h("div", { class: "console-list" }, ...list.slice().reverse().slice(0, 300).map((e) => {
    const lines = consoleLang === "py" ? e.py : e.cli;
    return h("article", { class: "console-entry" }, h("header", {}, h("span", { text: e.title || e.kind }), h("span", { class: "mono", text: String(e.at).slice(11, 19) })),
      lines.length ? h("pre", { text: lines.join("\n") }) : h("pre", { class: "muted", text: consoleLang === "py" ? "# (no Python line)" : "# (no command line)" }));
  })));
  return page;
}

// ---------- upgrade (U5): what Pro adds; no prices, no checkout, no request
const EDITIONS_URL = "https://kshana.dev/editions.html";
function upgradeView() {
  return h("section", { class: "page", "aria-labelledby": "up-h" },
    h("div", { class: "pro-hero" },
      h("p", { class: "kicker", text: t("js-desk-up-kicker", "Kshana Pro") }),
      h("h1", { id: "up-h", text: t("js-desk-up-title", "What Pro adds") }),
      h("p", { class: "lede", style: "margin:0", text: t("js-desk-up-lede", "This free edition keeps everything it has: every scenario, the native engine, the runs, the comparisons and the unsigned evidence packs, open source under AGPL-3.0-only. Pro is a separate build for teams that run fleets and hand evidence to others.") })),
    h("div", { class: "grid" }, ...PRO().map((p) => h("div", { class: "card pro-card" }, h("h3", {}, ic(p.icon), p.label), h("p", { text: p.text })))),
    h("h2", { text: t("js-desk-up-editions", "Compare the editions") }),
    h("p", { class: "muted", style: "margin:0 0 8px", text: t("js-desk-up-editions-note", "The editions page on kshana.dev lists what each edition holds. This app has no checkout and sends no request for it.") }),
    h("div", { class: "copyline" }, h("code", { text: EDITIONS_URL }), h("a", { class: "btn", href: EDITIONS_URL, target: "_blank", rel: "noopener noreferrer" }, t("js-desk-up-open", "Open the editions page")), h("button", { class: "btn", type: "button", onclick: () => copyText(EDITIONS_URL) }, ic("copy"), t("js-desk-up-copy", "Copy the link"))));
}

// ---------- status bar
function renderStatus() {
  const bar = $("statusbar");
  bar.setAttribute("aria-label", t("js-desk-status", "Status"));
  const eng = S.mode === "loading" ? { c: "var(--nav)", text: t("js-desk-engine-starting", "Engine starting…") }
    : S.mode === "none" ? { c: "var(--int)", text: t("js-desk-engine-none", "Engine unavailable") }
    : S.native ? { c: "var(--itg)", text: t("js-desk-engine-native", "Native engine { $version }", { version: S.version }) }
    : { c: "var(--tim)", text: t("js-desk-engine-wasm", "WebAssembly engine { $version }", { version: S.version }) };
  const st = S.devices.status;
  const dev = !S.devices.api ? t("js-desk-dev-none-native", "No device access") : st && st.running ? t("js-desk-dev-one", "1 device · { $source }", { source: String(st.source || "") }) : t("js-desk-dev-zero", "No device connected");
  const cores = navigator.hardwareConcurrency || 0;
  const extSt = (it) => h("span", { class: "st", "data-ext": "1", title: it.title || null }, it.dot ? h("span", { class: "dot", style: `--c:${it.dot.replace(/[;{}]/g, "")}` }) : null, it.text);
  const left = EXT.shell.statusItems("left"), right = EXT.shell.statusItems("right");
  bar.replaceChildren(
    h("span", { class: "st", title: S.engineError && S.mode === "none" ? S.engineError : null }, h("span", { class: "dot", style: `--c:${eng.c}` }), eng.text),
    h("span", { class: "st" }, ic("receiver"), dev),
    cores ? h("span", { class: "st", text: t("js-desk-cores", { one: "{ $n } core", other: "{ $n } cores" }, { n: fmtCount(cores) }) }) : null,
    ...(left || []).map(extSt),
    h("div", { class: "grow" }),
    ...(right ? right.map(extSt) : [
      h("span", { class: "st", text: t("js-desk-free-edition", "Free edition") }),
      h("span", { class: "st", text: t("js-desk-offline", "Works offline") })]),
    h("button", { type: "button", id: "btn-density", "aria-label": t("js-desk-density", "Switch between comfortable and compact"), title: t("js-desk-density", "Switch between comfortable and compact"), onclick: switchDensity }, density() === "compact" ? t("js-desk-density-compact", "Compact") : t("js-desk-density-comfortable", "Comfortable")),
    h("button", { type: "button", id: "btn-theme", "aria-label": t("js-desk-theme", "Switch between light and dark"), title: t("js-desk-theme", "Switch between light and dark"), onclick: toggleTheme }, ic("theme")));
}
function switchDensity() { const d = toggleDensity(); renderStatus(); toast(d === "compact" ? t("js-desk-density-now-compact", "Compact: smaller text, 24 px rows.") : t("js-desk-density-now-comfortable", "Comfortable: 13 px text, 32 px rows.")); }
function toggleTheme() {
  const root = document.documentElement;
  const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
  root.dataset.theme = dark ? "light" : "dark";
  try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch { /* not remembered */ }
}

// ------------------------------------------------------------------ command palette (U2)
const P = { open: false, q: "", i: 0, rows: null, inNewTab: false, back: null };
function paletteActions() {
  const tab = S.route === "tab" ? activeTab() : null;
  const sel = RUNS.selected();
  const A = [
    { id: "run", label: t("js-desk-act-run", "Run this scenario again"), keywords: "run rerun again", disabled: !tab || !tab.toml, go: () => runTab(tab) },
    { id: "compare", label: t("js-desk-act-compare", "Compare the 2 selected runs"), keywords: "compare diff runs", hint: sel.length === 2 ? "" : t("js-desk-act-compare-hint", "select two in Runs"), go: () => { if (sel.length === 2) S.compare = sel.map((r) => r.id); go("runs"); } },
    { id: "export", label: t("js-desk-act-export", "Export an evidence pack of this run"), keywords: "export evidence pack zip", disabled: !(tab && tab.run), go: () => exportPack(tab && tab.run) },
    { id: "connect", icon: "receiver", label: t("js-desk-act-connect", "Connect a receiver (serial, TCP, file)"), keywords: "device receiver nmea serial connect", go: async () => { if (S.devices.api) S.devices.list = await S.devices.api.list().catch(() => []); go("devices"); } },
    { id: "file", label: t("js-desk-act-file", "Open a scenario file…"), keywords: "open file toml", go: () => { go("files"); $("file-in")?.click(); } },
    { id: "library", label: t("js-desk-act-library", "Browse the scenario library"), keywords: "library scenarios browse", go: () => go("library") },
    { id: "runs", label: t("js-desk-act-runs", "Show the runs of this session"), keywords: "runs history search tags pins", go: () => go("runs") },
    { id: "console", label: t("js-desk-act-console", "Show the console (Python and command lines)"), keywords: "console python script code mirror cli", go: () => go("console") },
    { id: "copy-py", label: t("js-desk-act-copy-py", "Copy the session as Python"), keywords: "python script copy session reproduce", disabled: !MIRROR.size, go: () => copyText(sessionPython(MIRROR.list())) },
    { id: "project", label: t("js-desk-act-project", "Project, data links and dropped files"), keywords: "project folder kshana save open drop inspect detective files", go: () => go("files") },
    { id: "save", label: t("js-desk-act-save", "Keep the project now"), keywords: "save keep project disk", go: () => saveProject().then(() => toast(S.project.status)) },
    { id: "theme", label: t("js-desk-act-theme", "Switch between light and dark"), keywords: "theme dark light", go: toggleTheme },
    { id: "density", label: density() === "compact" ? t("js-desk-act-density-comfortable", "View: comfortable density") : t("js-desk-act-density-compact", "View: compact density"), keywords: "view density compact comfortable rows", go: switchDensity },
    ...PRO().map((p) => ({ id: `pro-${p.id}`, label: p.label, keywords: "pro", pro: true, go: () => go("upgrade") })),
  ];
  return A;
}
function featured() { return FEATURED.map(entryFor).filter(Boolean); }
function openPalette({ inNewTab = false } = {}) {
  if (P.open) return;
  P.open = true; P.q = ""; P.i = 0; P.inNewTab = inNewTab; P.back = document.activeElement;
  const layer = $("palette-layer");
  const input = h("input", { id: "pal-q", type: "text", autocomplete: "off", spellcheck: "false", role: "combobox", "aria-expanded": "true", "aria-controls": "pal-list", "aria-autocomplete": "list", "aria-label": t("js-desk-pal-label", "Search scenarios and actions"), placeholder: inNewTab ? t("js-desk-pal-ph-tab", "Open a scenario in a new tab…") : t("js-desk-pal-ph", "Search scenarios and actions…") });
  const list = h("ul", { class: "pal-list", id: "pal-list", role: "listbox", "aria-label": t("js-desk-pal-results", "Results") });
  const dialog = h("div", { class: "palette", role: "dialog", "aria-modal": "true", "aria-label": t("js-desk-pal-title", "Command palette") },
    h("div", { class: "pal-in" }, ic("search"), input, h("span", { class: "kbd", text: "esc" })),
    list,
    h("div", { class: "pal-foot", "aria-hidden": "true" }, h("span", { text: t("js-desk-pal-move", "↑↓ move") }), h("span", { text: t("js-desk-pal-enter", "↵ run") }), h("span", { text: t("js-desk-pal-newtab", "{ $mod }↵ open in new tab", { mod: isMac ? "⌘" : "Ctrl+" }) })));
  layer.replaceChildren(dialog);
  layer.hidden = false;
  layer.onmousedown = (e) => { if (e.target === layer) closePalette(); };
  input.addEventListener("input", () => { P.q = input.value; P.i = 0; fillPalette(); });
  input.addEventListener("keydown", (e) => {
    const n = P.rows ? P.rows.items.length : 0;
    if (e.key === "ArrowDown" || e.key === "ArrowUp") { e.preventDefault(); P.i = moveIndex(P.i, e.key === "ArrowDown" ? 1 : -1, n); fillPalette(); }
    else if (e.key === "Enter") { e.preventDefault(); const row = P.rows && P.rows.items[P.i]; if (row) execRow(row, e.metaKey || e.ctrlKey); }
    else if (e.key === "Escape") { e.preventDefault(); closePalette(); }
    else if (e.key === "Tab") e.preventDefault(); // the dialog holds one control
  });
  fillPalette();
  input.focus();
}
function fillPalette() {
  P.rows = paletteRows(P.q, { search: searchScenarios, featured: featured(), actions: P.inNewTab ? [] : paletteActions(), more: P.inNewTab ? [] : EXT.shell.paletteGroups(P.q, actionMatches), maxScenarios: P.inNewTab ? 10 : 6 });
  const list = $("pal-list");
  if (!list) return;
  const n = P.rows.items.length;
  if (P.i >= n) P.i = n ? n - 1 : 0;
  const names = { scenarios: t("js-desk-pal-scenarios", "Scenarios"), actions: t("js-desk-pal-actions", "Actions") };
  const kids = [];
  for (const g of P.rows.groups) {
    kids.push(h("li", { class: "pal-group", role: "presentation", "data-ext": g.heading !== undefined ? g.id : null, text: names[g.id] || g.heading || "" }));
    for (const row of g.items) {
      const sel = row.index === P.i;
      const lbl = h("span", { class: "lbl" }, ...highlight(row.label, P.q).map((s) => (s.hit ? h("b", { text: s.text }) : s.text)));
      if (row.kind === "scenario") lbl.append(h("span", { class: "sub", text: domLabel(row.entry.domain) }));
      kids.push(h("li", { class: "pal-opt", role: "option", id: `pal-opt-${row.index}`, "aria-selected": sel ? "true" : "false", "aria-disabled": row.disabled ? "true" : null,
        onmousemove: () => { if (P.i !== row.index) { P.i = row.index; fillPalette(); } }, onclick: (e) => execRow(row, e.metaKey || e.ctrlKey) },
        row.kind === "scenario" ? domainMark(row.entry.domain, domColor(row.entry.domain)) : row.ext ? extIcon(row.action.icon) : row.action.icon ? ic(row.action.icon) : null,
        lbl,
        row.pro ? h("span", { class: "pro-tag", text: "PRO" }) : row.tag ? h("span", { class: "ext-tag", text: row.tag }) : row.action && row.action.hint ? h("span", { class: "hint", text: row.action.hint }) : sel ? h("span", { class: "hint", text: row.kind === "scenario" ? (P.inNewTab ? t("js-desk-pal-hint-open", "↵ open") : t("js-desk-pal-hint-run", "↵ run")) : "↵" }) : null));
    }
  }
  if (!n) kids.push(h("li", { class: "pal-empty", role: "presentation", text: t("js-desk-pal-none", "Nothing matches. Try another word.") }));
  list.replaceChildren(...kids);
  const input = $("pal-q");
  if (n) { input.setAttribute("aria-activedescendant", `pal-opt-${P.i}`); $(`pal-opt-${P.i}`).scrollIntoView({ block: "nearest" }); } else input.removeAttribute("aria-activedescendant");
}
function execRow(row, newTabMod) {
  if (row.disabled) { toast(t("js-desk-pal-disabled", "Open a scenario first.")); return; }
  const inNewTab = P.inNewTab || newTabMod;
  closePalette({ restore: false });
  if (row.kind === "scenario") openScenario(row.entry.file, { inNewTab: inNewTab || S.route !== "tab" });
  else if (row.ext) safely(row.action.go);
  else row.action.go();
}
function closePalette({ restore = true } = {}) {
  if (!P.open) return;
  P.open = false;
  const layer = $("palette-layer");
  layer.hidden = true;
  layer.replaceChildren();
  if (restore && P.back && document.contains(P.back)) P.back.focus();
  else if (!restore) $("view").focus({ preventScroll: true });
}

// ------------------------------------------------------------------ keys and start
document.addEventListener("keydown", (e) => {
  if (isPaletteKey(e)) { e.preventDefault(); if (P.open) closePalette(); else openPalette(); return; }
  if (e.key === "Escape" && P.open) { e.preventDefault(); closePalette(); return; }
  // The time cursor's keys (lib/clock.mjs clockKey): Space, J/K/L, ←/→, M, [ and ].
  const tab = !P.open && S.route === "tab" ? activeTab() : null;
  const lv = tab && tab.lv && tab.lv.run === tab.run ? tab.lv.view : null;
  if (lv && !e.defaultPrevented && lv.key(e)) e.preventDefault();
});
$("doc-tabs").addEventListener("keydown", (e) => {
  const btn = e.target.closest && e.target.closest('[role="tab"]');
  if (!btn) return;
  const ids = S.tabs.map((x) => x.id);
  const i = ids.indexOf(Number(btn.dataset.tab));
  if (e.key === "Delete" || (e.key === "Backspace" && (e.metaKey || e.ctrlKey))) { e.preventDefault(); closeTab(ids[i]); return; }
  const j = tabKeyIndex(e.key, i, ids.length);
  if (j === null) return;
  e.preventDefault();
  showTab(ids[j]);
  focusActiveTab();
});
$("tab-new").addEventListener("click", () => openPalette({ inNewTab: true }));
$("palette-btn").addEventListener("click", () => openPalette());

// ------------------------------------------------------------------ extensions
// window.KshanaShell: the documented way for a module loaded into this page to add to the
// shell (apps/desktop/README.md, "Extending the shell"). It is announced with the
// "kshana-shell-ready" event, so a module that loads before the shell can wait for it.
const KshanaShell = Object.freeze({
  version: 1,
  ...EXT.api,
  /** Open a view: one of the shell's (home, runs, library, devices, evidence, files, upgrade) or a registered one. */
  show(id) {
    if (!BUILTIN_VIEWS.includes(id) && !EXT.shell.hasView(id)) throw new Error(`show: no view "${id}"`);
    go(id);
  },
  /** Draw the shell again (after something an extension shows has changed). */
  refresh: () => renderSoon(),
  /** The view shown: a view id, or "tab" for an open scenario. */
  get view() { return S.route; },
  /** The runs of this session, newest first (copies). */
  runs: () => publicRuns(),
  run: (id) => publicRuns().find((r) => r.id === id) || null,
  /** One of the shell's icons as an SVG node. */
  icon: (name) => ic(String(name)),
  /** A short message in the shell's toast. */
  toast: (msg) => toast(String(msg)),
});
window.KshanaShell = KshanaShell;
window.dispatchEvent(new CustomEvent("kshana-shell-ready", { detail: KshanaShell }));

async function main() {
  restoreDensity();
  render();
  await readGroups();
  await restoreSession();
  render();
  if (S.devices.api) {
    S.devices.list = await S.devices.api.list().catch(() => []);
    await pollDevices();
    setInterval(() => { pollDevices().then(renderStatus); }, 5000);
  }
  await bootEngine();
  render();
  for (const tab of S.tabs) if (tab.pending && !tab.run) { tab.pending = false; runTab(tab); }
  // a tab restored without a run (its run was not kept) runs again
  for (const tab of S.tabs) if (!tab.run && !tab.running && tab.toml && !tab.pending) runTab(tab);
  // A link may name a scenario to open (?scenario=<file>), the way the Studio's links do.
  const want = new URLSearchParams(location.search).get("scenario");
  const file = want ? (/\.toml$/.test(want) ? want : `${want}.toml`) : null;
  if (file && entryFor(file)) openScenario(file);
  else if (want === "default") openScenario(DEFAULT_SCENARIO);
}
main();
