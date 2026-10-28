// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Studio (rebuild 2026-10-01: opening screen, capability map, task screens; earlier the
// playground, then the 2026-09-27 redesign): the DOM layer. The engine, share, guided,
// sweep, overlay, report, chart-download, orbit, tour, embed and count logic are the
// live playground's pure modules, reused unchanged from web/ in the kshana repository; the library,
// parameter and view models are new pure modules (lib/catalog.mjs, lib/params.mjs,
// lib/views.mjs), each with a node test. Every scenario-derived string reaches the page
// through textContent, or through an escaping SVG builder whose markup is parsed as XML
// (never assigned as HTML).
import { t, ready, fetchData } from "./lib/t.mjs";
import { encodeFragment, decodeFragment, patchScalar } from "./lib/share.mjs";
import { parseSvgMarkup, sanitizeSvg } from "./lib/svgsafe.mjs";
import { chartFilename, fileMeta, svgSize, svgBlob, triggerDownload, svgToPngBlob } from "./lib/chartdl.mjs";
import { attachChartHover, parsePolylineXs } from "./lib/hover.mjs";
import { renderBadge, withEvidenceCsv } from "./lib/evidence.mjs";
import { knobsForToml, readKnob, patchSectionScalar } from "./lib/guided.mjs";
import { orbit3dSvg } from "./lib/orbit3d.mjs";
import { buildFomRows, figureTier } from "./lib/tabs.mjs";
import { sweepValues, sweepToml, sweepMetrics, MAX_SWEEP } from "./lib/sweep.mjs";
import { overlayRows } from "./lib/overlay.mjs";
import { isEmbed, embedConfig, embedClassList } from "./lib/embed.mjs";
import { buildReportHtml, reportFilename, fomTier, notApplicable } from "./lib/report.mjs";
// The app's name comes from the page <title>, which the site build writes from src/data/brand.json.
const STUDIO_NAME = (document.querySelector("title")?.textContent || "").trim();
import { clampStep, placeTooltip } from "./lib/tour.mjs";
import { matrixCounts } from "./lib/counts.mjs";
import { createEngineClient, isCancelled, busyLabel, errorMessage } from "./lib/engine.mjs";
import { attachEngineText, localiseRun } from "./lib/engine-text.mjs";
import { SCENARIOS, DOMAINS, NOT_IN_BROWSER, RECORDED_NATIVELY, needsNewerEngine, engineCaps, entryFor, domainOf, groupedLibrary, searchScenarios, registerGroup, dirOf, isGroupDir, groupFileUrl, DOMAIN_LINES, scenarioPath } from "./lib/catalog.mjs";
import { numericFields, stepValue, patchField, isLogScale } from "./lib/params.mjs";
import * as V from "./lib/views.mjs";
import * as K from "./lib/kinds.mjs";
import * as G from "./lib/stages.mjs";
import { createPackReader } from "./lib/packs.mjs";
import { kpis as kpiCards, honesty, kpiDelta, kpiKey, plainLabel, figureName } from "./lib/kpi.mjs";
import { fieldIndex, findFields, scenarioCount, filterControls } from "./lib/finder.mjs";
import { plainMeaning, plainDuration, headerParagraphs, taskWords } from "./lib/meaning.mjs";
import { rankInputs, splitInputs, inputLabel, fieldName, VISIBLE_INPUTS } from "./lib/inputs.mjs";
import { parseState, buildSearch, isNewEntry, persistentExtras, tabFromLink, viewUrl, chooseView, VIEW_KEY } from "./lib/urlstate.mjs";
import { kindsOfToml, kindOfToml, rowsForKind, evidenceMix, restoreMatchFields } from "./lib/areas.mjs";
import { spellOut } from "./lib/abbr.mjs";
import { GUIDED_KNOBS } from "./lib/guided.mjs";
await ready(); // the page's first catalogue is loaded before text is built

// Recorded runs and native recordings, from one file per scenario or from packs.
const PACKS = createPackReader();
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
const icon = (id) => {
  const s = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  s.setAttribute("aria-hidden", "true");
  const u = document.createElementNS("http://www.w3.org/2000/svg", "use");
  u.setAttribute("href", `#${id}`);
  s.append(u);
  return s;
};
// Parse chart markup as XML, reduce it to drawing (lib/svgsafe.mjs: no scripts, handlers, outside
// links or declarations) and adopt the element.
function svgNode(markup) {
  const undrawable = () => h("p", { class: "card-note", text: t("js-app-chart-not-drawn", "This chart could not be drawn.") });
  const root = parseSvgMarkup(markup); // refuses any declaration before parsing (lib/svgsafe.mjs)
  if (!root) return undrawable();
  sanitizeSvg(root);
  return document.importNode(root, true);
}
function setSvg(box, markup) { box.replaceChildren(svgNode(markup)); }
const reducedMotion = () => !!(window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches);
const PALETTE = ["var(--s-tim)", "var(--s-nav)", "var(--s-orb)", "var(--s-spf)"];

// ------------------------------------------------------------------ state
const S = {
  mode: "loading", version: "", engine: null, recIndex: null, recCache: new Map(), liveError: "",
  file: null, baseToml: "", shared: false,
  run: null,          // the run on screen: {id, file, title, toml, result, svg, summary, csv, ms, at, mode}
  pins: [], history: [], runCount: 0,
  activeTab: null, tabRequest: null, pview: "guided", exportsCache: new Map(), sweepSvg: null, tsMode: "live",
  embed: false, ho: null, orbitDirty: true, capDirty: true,
  nat: new Map(),     // folder -> index of the native engine's recordings (reports, animations, exports)
  link: {},           // what the page link asked for beyond scenario and tab: play, view, field, frame
  inputBudget: 5, budgetFile: null, visibleIds: null, // settings shown by default (lib/inputs.mjs)
  seen: new Set(),    // abbreviations already spelled out on this screen (lib/abbr.mjs)
  pendingRun: false, groupDirs: null, homeDrawn: false,
};
const tomlEl = $("toml");

// ------------------------------------------------------------------ engine
async function bootEngine() {
  const force = new URLSearchParams(location.search).get("engine");
  if (force !== "recorded") {
    try {
      const mod = await import("./pkg/kshana.js");
      // Download and compile the engine once. The compiled module instantiates here (the
      // main-thread fallback) and is posted to the worker, which would otherwise fetch the
      // same 8 MB file a second time.
      const wasm = await compileEngine(new URL("./pkg/kshana_bg.wasm", import.meta.url));
      await mod.default({ module_or_path: wasm }); // fails here if the host blocks WebAssembly
      S.version = mod.version();
      S.caps = engineCaps(mod);
      const local = { run: mod.run, run_all: mod.run_all, summary: mod.summary, chart_svg: mod.chart_svg, table_csv: mod.table_csv, export_sp3: mod.export_sp3, export_omm: mod.export_omm, export_oem: mod.export_oem, register_catalogue: mod.register_catalogue, run_human: mod.run_human };
      S.engine = createEngineClient({
        spawn: typeof Worker === "function" ? () => new Worker(new URL("./lib/engine-worker.mjs", import.meta.url), { type: "module" }) : null,
        local,
        defer: (fn) => setTimeout(fn, 20),
        init: wasm,
      });
      await attachEngineText(S.engine); // a non-English page: the engine's catalogue for its language is registered before the first run
      S.mode = "live";
      return;
    } catch (e) {
      S.liveError = errorMessage(e);
    }
  }
  S.recIndex = await recordedIndex("");
  if (!S.recIndex) throw new Error(t("js-app-engine-no-recordings", "The engine could not load ({ $reason }) and no recorded runs were found.", { reason: S.liveError || t("js-app-webassembly-unavailable", "WebAssembly unavailable") }));
  S.version = S.recIndex.engine_version;
  S.mode = "recorded";
  S.engine = recordedEngine();
}

// One fetch of the engine file, compiled while it streams in. A host that serves the file
// without the application/wasm type cannot stream, so that case compiles from the bytes.
async function compileEngine(url) {
  const res = await fetch(url);
  if (!res.ok) throw new Error(t("js-app-engine-file-http", "The engine file returned HTTP { $status }.", { status: res.status }));
  const wasmType = (res.headers.get("Content-Type") || "").startsWith("application/wasm");
  if (wasmType && typeof WebAssembly.compileStreaming === "function") return WebAssembly.compileStreaming(res);
  return WebAssembly.compile(await res.arrayBuffer());
}

// A same-folder fetch: the address comes from groupFileUrl (a checked folder and a fixed file name), or there is no request.
const fetchOrNull = (url) => (url ? fetch(url) : Promise.resolve({ ok: false }));
// The index of recorded runs in a folder ("" or an optional group's folder), fetched once.
const recIdx = new Map();
function recordedIndex(dir = "") {
  if (!recIdx.has(dir)) recIdx.set(dir, fetchOrNull(groupFileUrl(dir, "recorded/index.json")).then((r) => (r.ok ? r.json() : null)).catch(() => null));
  return recIdx.get(dir);
}
async function loadRecorded(file) {
  if (S.recCache.has(file)) return S.recCache.get(file);
  const dir = dirOf(file);
  const idx = await recordedIndex(dir);
  const entry = idx && idx.runs[file];
  if (!entry || entry.error) return null;
  // One file per scenario, or a pack of several: the index entry says which (lib/packs.mjs).
  const rec = await PACKS.load(`${dir}recorded/`, entry).catch(() => null);
  if (!rec) return null;
  S.recCache.set(file, rec);
  return rec;
}

// The recorded-run stand-in for the engine client: it answers only for the unedited
// bundled scenario it has a real recording of, and says so otherwise.
function recordedEngine() {
  return {
    mode: "recorded",
    canCancel: false,
    cancel: () => false,
    async call(fn, toml) {
      const rec = S.file ? await loadRecorded(S.file) : null;
      if (!rec) throw new Error(t("js-app-no-recorded-run", "There is no recorded run for this scenario. It needs the live engine."));
      if (toml !== rec.toml) throw new Error("EDITED");
      if (fn === "run_all") return JSON.stringify({ json: rec.json, svg: rec.svg, summary: rec.summary, csv: rec.csv, source: rec.source || "", platform: rec.platform || "", command: rec.command || "" });
      if (fn === "run") return rec.json;
      if (fn === "table_csv") return rec.csv;
      if (fn.startsWith("export_")) {
        const text = rec.exports[fn.slice(7)];
        if (text === null) throw Object.assign(new Error(t("js-app-export-not-recorded", "This export is large, so it was not recorded. It needs the live engine.")), { tooLarge: true });
        if (!text) throw new Error("none");
        return text;
      }
      throw new Error(t("js-app-needs-live-engine", "This needs the live engine."));
    },
  };
}

// ------------------------------------------------------------------ jobs
const BUSY_PAINT_MS = 150, SUPERSEDE_MS = 300;
const job = { gen: 0, active: false, startedAt: 0, verb: "", rerun: false, paintTimer: 0, tickTimer: 0 };
function beginJob(verb) {
  job.gen += 1; job.active = true; job.startedAt = performance.now(); job.verb = verb; job.rerun = false;
  clearTimeout(job.paintTimer); clearInterval(job.tickTimer);
  if (S.engine.canCancel) job.paintTimer = setTimeout(paintBusy, BUSY_PAINT_MS); else paintBusy();
  return job.gen;
}
function paintBusy() {
  $("run").disabled = true;
  $("sweep-run").disabled = true;
  $("progress").hidden = false;
  $("results").setAttribute("aria-busy", "true");
  setStatus(busyLabel(job.verb, 0), "busy");
  $("run-cancel").hidden = !S.engine.canCancel;
  job.tickTimer = setInterval(() => setStatus(busyLabel(job.verb, performance.now() - job.startedAt), "busy"), 250);
  document.body.classList.add("is-busy");
  updateSteps();
}
function endJob(gen) {
  if (gen !== job.gen) return false;
  job.active = false;
  clearTimeout(job.paintTimer); clearInterval(job.tickTimer);
  $("run").disabled = false;
  $("sweep-run").disabled = S.mode !== "live";
  $("progress").hidden = true;
  $("results").removeAttribute("aria-busy");
  $("run-cancel").hidden = true;
  document.body.classList.remove("is-busy");
  updateSteps();
  return true;
}
function cancelJob() {
  if (!job.active) return;
  job.rerun = false;
  S.engine.cancel();
}
function setStatus(text, cls = "") {
  const s = $("status");
  s.textContent = text;
  s.className = "status" + (cls ? " " + cls : "");
}

// ------------------------------------------------------------------ run
async function runScenario() {
  if (!S.engine) return;
  if (NOT_IN_BROWSER[S.file] && !S.shared) { await showNativeRun(); return; }
  if (S.engine.mode !== "recorded" && needsNewerEngine(S.file, S.caps || S.version)) { await showNewerRun(); return; }
  if (job.active) {
    if (S.engine.canCancel && performance.now() - job.startedAt > SUPERSEDE_MS) S.engine.cancel();
    else { job.rerun = true; return; }
  }
  const gen = beginJob(t("js-app-job-running", "Running"));
  clearError();
  const src = tomlEl.value, file = S.file;
  let all;
  try {
    all = JSON.parse(await S.engine.call("run_all", src));
  } catch (e) {
    if (gen !== job.gen) return;
    if (S.file !== file) { endJob(gen); return; }
    const rerun = job.rerun;
    endJob(gen);
    if (isCancelled(e)) setStatus(S.run ? t("js-app-run-cancelled-previous", "Run cancelled. The previous result is still shown.") : t("js-app-run-cancelled", "Run cancelled."));
    else if (e.message === "EDITED") {
      setStatus(t("js-app-edited-needs-live", "Edited scenarios need the live engine."));
      showNotice(recordedEditNotice());
    } else { showError(errorMessage(e)); setStatus(t("js-app-run-failed", "Run failed. See the message in the results.")); }
    if (rerun) runScenario();
    return;
  }
  if (gen !== job.gen) return;
  const ms = performance.now() - job.startedAt;
  const rerun = job.rerun;
  endJob(gen);
  if (S.file !== file) return; // the reader opened another scenario while this one ran
  if (rerun) { runScenario(); return; }
  let result;
  try { result = JSON.parse(all.json); } catch (e) { showError(errorMessage(e)); return; }
  S.runCount += 1;
  const entry = entryFor(S.file);
  const run = {
    id: S.runCount, file: S.file, title: S.shared ? t("js-app-shared-scenario", "Shared scenario") : entry ? entry.title : S.file,
    toml: src, result, svg: all.svg || "", summary: all.summary || "", csv: all.csv || null, ms, at: new Date(),
    mode: all.source === "native" ? "native" : S.mode, platform: all.platform || "", command: all.command || "",
  };
  S.history.unshift(run);
  if (S.history.length > 25) S.history.pop();
  renderRun(run);
  renderHistory();
  localiseEngineText(run); // a non-English page: the summary and the chart text follow in the reader's language
  {
    const time = run.at.toLocaleTimeString(), n = S.runCount, took = (ms / 1000).toFixed(1);
    if (S.mode === "live") setStatus(ms >= 1000 ? t("js-app-ran-locally-took", "Ran locally at { $time }, run { $n }, { $took } s.", { time, n, took }) : t("js-app-ran-locally", "Ran locally at { $time }, run { $n }.", { time, n }), "ran");
    else setStatus(ms >= 1000 ? t("js-app-recorded-shown-took", "Recorded run shown at { $time }, run { $n }, { $took } s.", { time, n, took }) : t("js-app-recorded-shown-run", "Recorded run shown at { $time }, run { $n }.", { time, n }), "ran");
  }
  const sum = $("m-big");
  sum.classList.remove("flash"); void sum.offsetWidth; sum.classList.add("flash");
}

// The engine's text for a live run in the reader's language (lib/engine-text.mjs); the English run is shown first and stays the machine result.
function localiseEngineText(run) {
  localiseRun(S.engine, run).then((changed) => { if (changed && S.run === run) renderRun(run); }).catch(() => { /* English stays */ });
}

// A bundled scenario that needs a newer engine than the one running here: show its recording (made with a new
// enough engine), labelled, and do not run it, since this engine would refuse its fields or ignore them.
async function showNewerRun() {
  clearError();
  const need = needsNewerEngine(S.file, S.caps || S.version);
  const rec = await loadRecorded(S.file).catch(() => null);
  const why = t("js-app-needs-newer-why", "This scenario needs engine { $need } or later; the engine running here is v{ $version }.", { need, version: S.version });
  if (!rec) { showError(`${why} ${t("js-app-no-recording-here", "There is no recording of it here.")}`); setStatus(t("js-app-needs-newer-engine", "Needs a newer engine.")); return; }
  if (tomlEl.value !== rec.toml) { showNotice(`${why} ${t("js-app-only-bundled-recording", "Only the recording of the bundled file can be shown: use Reset to see it, or run an edited copy with engine { $need }.", { need })}`); setStatus(t("js-app-edited-needs-engine", "Edited: needs engine { $need }.", { need })); return; }
  let result;
  try { result = JSON.parse(rec.json); } catch (e) { showError(errorMessage(e)); return; }
  S.runCount += 1;
  const entry = entryFor(S.file);
  const run = { id: S.runCount, file: S.file, title: entry ? entry.title : S.file, toml: rec.toml, result, svg: rec.svg || "", summary: rec.summary || "", csv: rec.csv || null, ms: 0, at: new Date(), mode: rec.source === "native" ? "native" : "recorded", platform: rec.platform || "", command: rec.command || "" };
  S.history.unshift(run);
  if (S.history.length > 25) S.history.pop();
  const stamp = (((await recordedIndex(dirOf(S.file)).catch(() => null)) || {}).runs || {})[S.file.split("/").pop()] || {};
  const notice = /^[0-9a-f]{40}$/.test(stamp.engine_commit || "") ? t("js-app-recorded-with-commit", "What you see is the run recorded with an engine build at commit { $commit }, shown unchanged; it does not re-run here.", { commit: stamp.engine_commit.slice(0, 8) }) : t("js-app-recorded-with-engine", "What you see is the run recorded with engine v{ $version }, shown unchanged; it does not re-run here.", { version: rec.engine_version || result.engine_version || "?" });
  showNotice(`${why} ${notice}`);
  renderRun(run);
  renderHistory();
  setStatus(t("js-app-recorded-shown-needs", "Recorded run shown at { $time } (needs engine { $need }).", { time: run.at.toLocaleTimeString(), need }), "ran");
}

// A scenario the browser build cannot run: show the run the native command-line engine
// recorded for the bundled file, labelled as recorded, or say why there is none.
async function showNativeRun() {
  clearError();
  const rec = RECORDED_NATIVELY.includes(S.file) ? await loadRecorded(S.file) : null;
  if (!rec || rec.source !== "native") {
    showError(NOT_IN_BROWSER[S.file]);
    setStatus(t("js-app-not-in-browser", "This scenario does not run in the browser."));
    return;
  }
  if (tomlEl.value !== rec.toml) {
    showNotice(`${NOT_IN_BROWSER[S.file]} ${t("js-app-native-edited-notice", "The recorded run is of the bundled file, so an edited copy cannot be shown here: run it with the command-line tool, or use Reset to see the recording.")}`);
    setStatus(t("js-app-edited-cli-only", "Edited: this scenario runs only in the command-line engine."));
    return;
  }
  let result;
  try { result = JSON.parse(rec.json); } catch (e) { showError(errorMessage(e)); return; }
  S.runCount += 1;
  const entry = entryFor(S.file);
  const run = { id: S.runCount, file: S.file, title: entry ? entry.title : S.file, toml: rec.toml, result, svg: rec.svg || "", summary: rec.summary || "", csv: rec.csv || null, ms: 0, at: new Date(), mode: "native", platform: rec.platform || "", command: rec.command || "" };
  S.history.unshift(run);
  if (S.history.length > 25) S.history.pop();
  showNotice(nativeNotice(run));
  renderRun(run);
  renderHistory();
  setStatus(t("js-app-recorded-shown-native", "Recorded run shown at { $time } (native engine).", { time: run.at.toLocaleTimeString() }), "ran");
}
function nativeNotice(run) {
  const lead = NOT_IN_BROWSER[run.file] || t("js-app-browser-cannot-run", "The browser build cannot run this scenario.");
  const version = run.result.engine_version || S.version, platform = run.platform, command = run.command;
  let what;
  if (platform && command) what = t("js-app-native-recorded-pc", "What you see is a run recorded with the native command-line engine v{ $version } ({ $platform }) by running { $command }, shown unchanged. It does not re-run when you edit.", { version, platform, command });
  else if (platform) what = t("js-app-native-recorded-p", "What you see is a run recorded with the native command-line engine v{ $version } ({ $platform }), shown unchanged. It does not re-run when you edit.", { version, platform });
  else if (command) what = t("js-app-native-recorded-c", "What you see is a run recorded with the native command-line engine v{ $version } by running { $command }, shown unchanged. It does not re-run when you edit.", { version, command });
  else what = t("js-app-native-recorded", "What you see is a run recorded with the native command-line engine v{ $version }, shown unchanged. It does not re-run when you edit.", { version });
  return `${lead} ${what}`;
}

function showError(msg) {
  const e = $("error");
  e.textContent = msg;
  e.hidden = false;
}
function clearError() { $("error").hidden = true; $("error").textContent = ""; }
function showNotice(msg) { const n = $("notice"); n.textContent = msg; n.hidden = !msg; }
function recordedEditNotice() {
  return t("js-app-recorded-edit-notice", "WebAssembly is blocked on this page, so this page is showing real runs of the bundled scenarios recorded with engine v{ $version }. Edited scenarios, sweeps and new exports need the live engine: open kshana.dev, or serve this folder locally. Reset restores the recorded scenario.", { version: S.version });
}
function recordedIntro() {
  return t("js-app-recorded-intro", "WebAssembly is blocked on this page, so this page shows real runs of the bundled scenarios, recorded with engine v{ $version }. Editing, sweeps and new exports need the live engine at kshana.dev.", { version: S.version });
}

// ------------------------------------------------------------------ render a run
// A run is shown as: the answer (a plain sentence read from the result), the key figures that
// answer the question, the views of the result, then (collapsed) how it was computed and the
// researcher's tools. lib/meaning.mjs writes the sentence and the cards.
function renderRun(run) {
  S.run = run;
  S.exportsCache.delete(run.id);
  S.sweepSvg = null;
  $("sweep-out").hidden = true;
  const r = run.result;
  $("headline").hidden = false;
  $("summary").textContent = run.summary || t("js-app-no-summary", "(this scenario publishes no one-line summary)");
  const b = $("hl-badges");
  b.replaceChildren();
  b.append(h("span", { class: `badge ${run.mode === "live" ? "live" : "recorded"}`, text: runSourceText(run) }));
  const tiers = tierCounts(r);
  if (tiers.validated) b.append(h("span", { class: "badge validated", text: t("js-app-badge-validated", "{ $n } validated", { n: tiers.validated }) }));
  if (tiers.modelled) b.append(h("span", { class: "badge modelled", text: t("js-app-badge-modelled", "{ $n } modelled", { n: tiers.modelled }) }));
  const meta = fileMeta(r, S.version, run.toml);
  const m = $("run-meta");
  m.replaceChildren();
  const add = (k, v) => m.append(h("div", {}, h("dt", { text: k }), h("dd", { text: v })));
  add(t("js-app-meta-engine", "engine"), `v${meta.ver}`);
  if (meta.hash) add(t("js-app-meta-scenario", "scenario"), String(meta.hash).slice(0, 12));
  if (typeof r.seed === "number") add(t("js-app-meta-seed", "seed"), String(r.seed));
  add(t("js-app-meta-file", "file"), run.file || t("js-app-meta-shared-link", "shared link"));
  if (run.mode === "live") add(t("js-app-meta-time", "time"), `${Math.max(1, Math.round(run.ms))} ms`);
  renderAnswer(run);
  renderOverview(r, run.toml);
  buildTabs();
  $("json").replaceChildren(...jsonNodes(r));
  renderHow(run);
  renderResearch(run);
  fitInputBudget(run);
  updateSteps();
}

// "Live result · engine vX.Y.Z", or "Recorded result · vX.Y.Z", said plainly.
function runSourceText(run) {
  const v = (run.result && run.result.engine_version) || S.version;
  if (run.mode === "live") return t("js-app-source-live", "Live result · engine v{ $version }", { version: S.version });
  if (run.mode === "native") return t("js-app-source-native", "Recorded result, native engine · v{ $version }", { version: v });
  return run.preview ? t("js-app-source-recorded-loading", "Recorded result · v{ $version } · engine loading", { version: v }) : t("js-app-source-recorded", "Recorded result · v{ $version }", { version: v });
}

function tierCounts(r) {
  const figs = r && r.figure_tiers && Array.isArray(r.figure_tiers.figures) ? r.figure_tiers.figures : [];
  return { validated: figs.filter((f) => f.tier === "VALIDATED").length, modelled: figs.filter((f) => f.tier === "MODELLED").length };
}

function tierPill(tier) {
  if (!tier) return null;
  const t = tier.toUpperCase() === "VALIDATED" ? "validated" : "modelled";
  return h("span", { class: `tier ${t}`, text: t });
}
// An evidence chip in the house style: "● VALIDATED".
function lvlChip(tier, title = "") {
  const t = String(tier || "").toLowerCase();
  return h("span", { class: `lvl ${t}`, title: title || null }, h("i"), t);
}

// The answer: the chips that say where the result comes from, the plain sentence, the key figures.
function renderAnswer(run) {
  const r = run.result;
  const mean = plainMeaning(r, run.toml) || { big: "", line: "", cards: [] };
  const chips = $("m-chips");
  chips.replaceChildren(h("span", { class: `chip-s2 ${run.mode === "live" ? "live" : "rec"}${run.preview ? " loading" : ""}` }, h("i"), runSourceText(run)));
  const hn = honesty(r);
  if (hn) chips.append(lvlChip(hn.tier, hn.text));
  const eb = renderBadge(document, r); // the ledger rows behind this result (absent in a run recorded by an older engine)
  if (eb) chips.append(eb);
  const seen = new Set(S.seen);
  $("m-big").textContent = spellOut(mean.big, seen);
  $("m-line").textContent = spellOut(mean.line, seen);
  $("meaning").dataset.tier = hn ? hn.tier.toLowerCase() : "";
  const host = $("figs");
  host.replaceChildren();
  for (const c of mean.cards) {
    host.append(h("div", { class: `kf${c.good ? " good" : ""}${c.bad ? " bad" : ""}`, role: "listitem", "data-path": c.path || null },
      h("span", { class: "kf-l", text: c.label }),
      h("span", { class: "kf-v" }, c.value, c.unit ? h("small", { text: c.unit }) : null),
      c.sub ? h("span", { class: "kf-s", text: c.sub }) : null));
  }
  host.dataset.n = String(mean.cards.length);
  $("kpis-wrap").hidden = !mean.cards.length;
}

// A field in "Advanced settings": the scenario's own words for it first, then the field name it
// is written as, e.g. "Horizontal alert limit (APV-I)" over "al_h_m".
function fieldLabelNode(f) {
  const plain = f.comment && plainLabel(f.comment) ? f.comment.charAt(0).toUpperCase() + f.comment.slice(1) : "";
  return plain ? h("label", { title: f.key }, plain, h("small", { class: "fkey", text: f.key })) : h("label", { title: f.key }, fieldName(f), h("small", { class: "fkey", text: f.comment ? `${f.key} · ${f.comment}` : f.key }));
}

function renderOverview(r, toml = "") {
  const rows = buildFomRows(r);
  const fomT = $("fom-table");
  fomT.replaceChildren();
  if (rows.length) {
    fomT.append(h("thead", {}, h("tr", {}, [t("js-app-th-clock", "Clock"), t("js-app-th-metric", "Metric"), t("js-app-th-value", "Value"), t("js-app-th-tier", "Tier")].map((x) => h("th", { text: x })))));
    const tb = h("tbody");
    for (const x of rows) {
      tb.append(h("tr", {},
        h("td", { text: x.clockLabel }),
        h("td", { text: x.unit ? `${x.label} (${x.unit})` : x.label }),
        h("td", { class: "num", text: x.applicable === false ? notApplicable() : V.fmt(x.value) }),
        h("td", {}, tierPill(x.tier || fomTier(x.metric)))));
    }
    fomT.append(tb);
  }
  $("fom-card").hidden = !rows.length;
  let kf = V.keyFigures(r, 40);
  // A result with no numeric figure block (a sweep, for example): list its top-level fields,
  // with arrays shown as their length, so the overview is never empty.
  if (!kf.length && r && typeof r === "object") {
    const units = r.units || {};
    kf = Object.entries(r).filter(([k, v]) => k !== "units" && (typeof v !== "object" || Array.isArray(v)))
      .map(([k, v]) => ({ path: k, value: Array.isArray(v) ? t("js-app-entries-count", { one: "{ $n } entry", other: "{ $n } entries" }, { n: v.length }) : v, unit: (units[k] && units[k].unit !== "1" && units[k].unit) || "", provenance: (units[k] && units[k].provenance) || "", note: (units[k] && units[k].note) || "" }));
  }
  const k = $("kf-table");
  k.replaceChildren();
  if (kf.length) {
    k.append(h("thead", {}, h("tr", {}, [t("js-app-th-figure", "Figure"), t("js-app-th-value-2", "Value"), t("js-app-th-unit", "Unit"), t("js-app-th-provenance", "Provenance"), t("js-app-th-what-it-is", "What it is")].map((x) => h("th", { text: x })))));
    const tb = h("tbody");
    for (const x of kf) {
      const ft = figureTier(r, x.path);
      tb.append(h("tr", {},
        h("td", { title: x.path }, figureName(x, toml).name, " ", tierPill(ft && ft.tier),
          h("small", { class: "fkey", text: figureName(x, toml).where ? `${figureName(x, toml).where} · ${x.path}` : x.path })),
        h("td", { class: "num", text: typeof x.value === "number" ? V.fmt(x.value) : String(x.value) }),
        h("td", { text: x.unit || "—" }),
        h("td", { text: x.provenance || "—" }),
        h("td", { class: "note", text: x.note || "" })));
    }
    k.append(tb);
  }
  $("kf-card").hidden = !kf.length;
  const hh = $("health");
  hh.replaceChildren();
  let anyH = false;
  for (const key of ["quantum", "classical"]) {
    const c = r[key];
    if (!c || !c.filter_health) continue;
    anyH = true;
    const fh = c.filter_health;
    const f3 = (x) => (typeof x === "number" ? x.toFixed(3) : "—");
    hh.append(h("div", { class: `hcard ${fh.consistent ? "ok" : "warn"}` },
      h("div", { class: "h" }, h("span", { text: c.spec && c.spec.id ? c.spec.id : key }), h("span", { text: fh.consistent ? t("js-app-health-consistent", "consistent") : t("js-app-health-check-tuning", "check tuning") })),
      h("p", { text: t("js-app-health-nis-band", "NIS { $mean } (95% band { $lo }–{ $hi }, target 1.0)", { mean: f3(fh.nis_mean), lo: f3(fh.nis_chi2_lower_95), hi: f3(fh.nis_chi2_upper_95) }) }),
      h("p", { text: t("js-app-health-nees-band", "NEES { $mean } (95% band { $lo }–{ $hi }, target 2.0)", { mean: f3(fh.nees_mean), lo: f3(fh.nees_chi2_lower_95), hi: f3(fh.nees_chi2_upper_95) }) })));
  }
  $("health-card").hidden = !anyH;
  const lab = V.resultLabel(r);
  $("label-card").hidden = !lab;
  if (lab) $("label-text").textContent = lab.text;
}


// ------------------------------------------------------------------ tabs
const TAB_DEFS = [
  { id: "overview", get label() { return t("js-app-tab-overview", "Overview"); }, c: "var(--itg)" },
  // One view per newer kind (spectrum, solar system, coverage, campaign, the LEO kinds): lib/kinds.mjs.
  ...K.capabilityTabs().map((cap) => ({ id: cap.tab, get label() { return cap.label; }, c: cap.c, view: "v-cap" })),
  { id: "timeseries", get label() { return t("js-app-tab-timeseries", "Time series"); }, c: "var(--tim)" },
  { id: "signal", get label() { return t("js-app-tab-signal", "Signal & band"); }, c: "var(--int)" },
  { id: "holdover", get label() { return t("js-app-tab-holdover", "Holdover"); }, c: "var(--tim)" },
  { id: "masks", get label() { return t("js-app-tab-masks", "Timing masks"); }, c: "var(--tim)" },
  { id: "stability", get label() { return t("js-app-tab-stability", "Stability"); }, c: "var(--spf)" },
  { id: "orbit", get label() { return t("js-app-tab-orbit", "3-D orbit"); }, c: "var(--orb)" },
  { id: "ground", get label() { return t("js-app-tab-ground", "Ground track"); }, c: "var(--orb)" },
  { id: "sweep", get label() { return t("js-app-tab-sweep", "Sweep"); }, c: "var(--nav)" },
  { id: "compare", get label() { return t("js-app-tab-compare", "Compare"); }, c: "var(--spf)" },
  { id: "animation", get label() { return t("js-app-tab-animation", "Animation"); }, c: "var(--spf)" },
  { id: "report", get label() { return t("js-app-tab-report", "Engine report"); }, c: "var(--ink-2)" },
  { id: "exports", get label() { return t("js-app-tab-exports", "Exports & report"); }, c: "var(--ink-2)" },
  { id: "json", get label() { return t("js-app-tab-json", "JSON"); }, c: "var(--ink-3)" },
];
const VIEW_ID = Object.fromEntries(TAB_DEFS.map((t) => [t.id, t.view || `v-${t.id}`]));
let available = [];

function availableTabs(run) {
  // The rule lives in lib/kinds.mjs (resultTabs), shared with the deep-link list.
  return K.resultTabs(run.result, run.toml, {
    svg: run.svg,
    // The engine's own animation and report, recorded with the native engine for the bundled files.
    native: nativeEntry(run.file),
    sweep: S.mode === "live" && sweepKnobs(run.toml).length > 0 && sweepMetricList(run.result).length > 0,
    compare: S.pins.length > 0,
  });
}

// The most telling first view for a kind of result (lib/kinds.mjs).
const preferredTab = (run) => K.preferredTab(run.result, run.toml);

function buildTabs() {
  const run = S.run;
  if (!run) return;
  const prevAvail = available;
  available = availableTabs(run);
  const row = $("tabs");
  row.replaceChildren();
  for (const id of available) {
    const d = TAB_DEFS.find((t) => t.id === id);
    const b = h("button", { class: "tab", role: "tab", id: `tab-${id}`, "aria-controls": VIEW_ID[id], "data-tab": id, style: `--c:${d.c}` }, h("i"), d.label);
    if (id === "compare") b.append(h("span", { class: "n", text: String(S.pins.length) }));
    b.addEventListener("click", () => selectTab(id, { scroll: true }));
    row.append(b);
  }
  $("tabs-wrap").hidden = available.length < 2;
  // Keep the reader's view across runs of the same scenario family; otherwise open the
  // most telling view for this kind of result.
  const sameFamily = prevAvail.filter((x) => x !== "compare").join() === available.filter((x) => x !== "compare").join();
  // A view the link asked for opens when the run offers it (it stays pending until then).
  if (S.tabRequest && available.includes(S.tabRequest)) { S.activeTab = S.tabRequest; S.tabRequest = null; }
  // Another scenario opens on its most telling view; the same scenario keeps the reader's view.
  else if ((!sameFamily && S.tabsFile !== run.file) || !S.activeTab || !available.includes(S.activeTab)) S.activeTab = preferredTab(run);
  S.tabsFile = run.file;
  renderTimeseries(); renderSignal(); renderHoldover(); renderMasks(); renderStability(); renderGround(); syncSweepControls(); renderCompare();
  S.orbitDirty = true;
  S.capDirty = true;
  stopPlayers();
  selectTab(S.activeTab, { url: !S.tabRequest });
}

// One view of the result at a time, chosen in the row above it (which wraps, never scrolls
// sideways). The choice is part of the address, so a link opens the same view.
const PHONE_MQ = window.matchMedia ? window.matchMedia("(max-width: 760px)") : { matches: false, addEventListener() {} };
function selectTab(id, { scroll = false, url = true } = {}) {
  if (!available.includes(id)) id = available[0];
  S.activeTab = id;
  const shown = VIEW_ID[id];
  for (const vid of new Set(Object.values(VIEW_ID))) {
    const el = $(vid);
    el.hidden = vid !== shown;
    el.classList.toggle("is-sel", vid === shown);
    el.classList.remove("is-sec");
    el.dataset.w = "12";
  }
  for (const b of $("tabs").children) {
    const sel = b.dataset.tab === id;
    b.setAttribute("aria-selected", sel ? "true" : "false");
    b.tabIndex = sel ? 0 : -1;
  }
  if (shown === "v-orbit" && S.orbitDirty) renderOrbit();
  if (shown === "v-cap" && S.capDirty) renderCapability();
  if (shown !== "v-cap") for (const p of players) p.stop();
  if (id === "animation") renderAnimation();
  if (id === "report") renderEngineReport();
  if (id === "exports") renderExports();
  if (scroll) {
    const el = $("tabs-wrap");
    if (el && el.scrollIntoView) el.scrollIntoView({ block: "start", behavior: reducedMotion() ? "auto" : "smooth" });
  }
  if (url && route && route.screen === "task" && !S.shared && route.tab !== id) { route = { ...route, tab: id }; setAddress(route); }
  updateCrumbs();
  updateSteps();
}

function cycleTab(dir) {
  if (!available.length) return;
  const i = available.indexOf(S.activeTab);
  selectTab(available[(i + dir + available.length) % available.length]);
  const b = $(`tab-${S.activeTab}`);
  if (b) b.focus();
}

// ------------------------------------------------------------------ inline charts
function mountChart(boxId, chart, toolsId, base, title) {
  const box = $(boxId);
  setSvg(box, chart.svg);
  bindHover(box, chart.hover);
  if (toolsId) mountTools(toolsId, () => exportSvg(chart.svg, title), base);
}

function bindHover(box, hover) {
  box._hover = hover;
  let line = box.querySelector(".hover-line"), tip = box.querySelector(".hover-tip");
  if (!line) {
    line = h("div", { class: "hover-line", hidden: true });
    tip = h("div", { class: "hover-tip", hidden: true });
    box.append(line, tip);
  }
  if (box.dataset.hb) return;
  box.dataset.hb = "1";
  const hide = () => { const l = box.querySelector(".hover-line"), t = box.querySelector(".hover-tip"); if (l) l.hidden = true; if (t) t.hidden = true; };
  box.addEventListener("pointermove", (e) => {
    const hv = box._hover;
    const svg = box.querySelector("svg.chart");
    const l = box.querySelector(".hover-line"), t = box.querySelector(".hover-tip");
    if (!hv || !svg || !l) return hide();
    const rect = svg.getBoundingClientRect(), br = box.getBoundingClientRect();
    const scale = rect.width / hv.W;
    const x = (e.clientX - rect.left) / scale;
    if (x < hv.ml - 10 || x > hv.W - hv.mr + 10) return hide();
    let lo = 0, hi = hv.samples.length - 1;
    while (hi - lo > 1) { const mid = (lo + hi) >> 1; if (hv.samples[mid] < x) lo = mid; else hi = mid; }
    const i = Math.abs(hv.samples[lo] - x) <= Math.abs(hv.samples[hi] - x) ? lo : hi;
    const px = rect.left - br.left + box.scrollLeft + hv.samples[i] * scale;
    l.style.left = `${px}px`; l.style.top = `${rect.top - br.top}px`; l.style.height = `${rect.height}px`;
    l.hidden = false;
    t.textContent = hv.label(i);
    t.hidden = false;
    const flip = px + 14 + t.offsetWidth > br.width + box.scrollLeft;
    t.style.left = `${flip ? px - t.offsetWidth - 12 : px + 12}px`;
    t.style.top = `${Math.max(6, Math.min(e.clientY - br.top + 12, rect.height - t.offsetHeight - 6))}px`;
  });
  box.addEventListener("pointerleave", hide);
}

// A downloadable, self-contained copy of an inline chart: theme colours resolved,
// styles embedded, a title band and the provenance line added.
const CHART_CSS = `svg{font-family:ui-monospace,Menlo,monospace;font-size:10.5px}.c-bg{fill:var(--space)}.c-grid{stroke:rgba(255,255,255,.08)}.c-eq{stroke:rgba(255,255,255,.18);stroke-dasharray:4 4}.c-tick{fill:var(--space-ink-3)}.c-axis{fill:var(--space-ink-2);font-size:11px}.c-note{fill:var(--space-ink-3);font-size:10px}.c-outage{fill:rgba(255,91,84,.08)}.c-line{fill:none;stroke-width:1.8}.c-legend text{fill:var(--space-ink-2);font-size:11px}.c-thr{stroke:var(--s-int);stroke-dasharray:6 4}.c-thr-bg{fill:var(--space);fill-opacity:.88}.c-thr-t{fill:var(--s-int);paint-order:stroke;stroke:var(--space);stroke-width:3.5px;stroke-linejoin:round}.c-mark{fill:none;stroke-width:1.6}.c-mark-t{fill:var(--space-ink-2);font-size:10px}.c-lost{stroke:rgba(0,0,0,.55);stroke-dasharray:2 2}.c-land{fill:rgba(106,152,255,.10);stroke:rgba(167,180,210,.72);stroke-width:.7}.c-track{fill:none;stroke:var(--s-orb);stroke-width:1.6}.c-track-vis{fill:none;stroke:var(--s-nav);stroke-width:3}.c-band{fill:rgba(255,255,255,.035)}.c-band.alt{fill:rgba(255,255,255,0)}.c-vline{stroke:var(--space-ink-2);stroke-dasharray:3 3}.c-vline.alarm{stroke:var(--s-int)}.c-tickm{stroke:var(--space-ink-3)}.wf-band{fill:var(--space-ink-2)}.wf-curtain,.wf-cursor,.play-cursor{display:none}.or-track{fill:none;stroke-width:1.1;opacity:.7}.or-ring{stroke-dasharray:2 4}.or-link{stroke:var(--s-nav);stroke-dasharray:4 3}.or-centre{fill:var(--s-nav)}.or-name{fill:var(--space-ink);font-size:11px}.cov-trail{fill:none;stroke-width:1;opacity:.6}.cov-sat{stroke:var(--space);stroke-width:.6}.h-bar{fill:var(--s-tim)}.gj-line{fill:none;stroke-width:1.4}.gj-pt{fill:var(--s-nav)}`;
function tokenValue(name) { return getComputedStyle(document.documentElement).getPropertyValue(name).trim(); }
function exportSvg(svg, title) {
  const vb = (svg.match(/viewBox="0 0 ([\d.]+) ([\d.]+)"/) || []).slice(1).map(Number);
  const [W, H] = vb.length === 2 ? vb : [760, 340];
  const meta = S.run ? fileMeta(S.run.result, S.version, S.run.toml) : { ver: S.version, hash: "" };
  const prov = `Kshana v${meta.ver}${meta.hash ? " · " + t("js-app-chart-scenario-hash", "scenario { $hash }", { hash: String(meta.hash).slice(0, 12) }) : ""} · doi:10.5281/zenodo.20528627 · kshana.dev`;
  const inner = svg.replace(/^<svg[^>]*>/, `<svg x="0" y="34" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}">`);
  const out = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H + 58}" viewBox="0 0 ${W} ${H + 58}"><style>${CHART_CSS}</style><rect width="${W}" height="${H + 58}" fill="var(--space)"/><text x="16" y="22" font-size="14" font-weight="700" fill="var(--space-ink)" font-family="system-ui,sans-serif">${V.esc(title || t("js-app-chart-default-title", "Kshana chart"))}</text>${inner}<text x="${W - 12}" y="${H + 50}" text-anchor="end" font-size="10" fill="var(--space-ink-3)">${V.esc(prov)}</text></svg>`;
  return V.resolveVars(out, tokenValue);
}

function mountTools(toolsId, getSvg, base) {
  const host = typeof toolsId === "string" ? $(toolsId) : toolsId;
  if (!host) return;
  host.replaceChildren(h("span", { class: "lbl", text: t("js-app-download-label", "Download") }));
  const meta = () => (S.run ? fileMeta(S.run.result, S.version, S.run.toml) : null);
  host.append(h("button", { type: "button", title: t("js-app-svg-button-title", "Vector chart with title and provenance"), onclick: () => triggerDownload(svgBlob(getSvg()), chartFilename(base, meta(), "svg")), text: "SVG" }));
  const png = h("button", { type: "button", title: t("js-app-png-button-title", "High-resolution bitmap for slides and documents"), text: "PNG" });
  png.addEventListener("click", async () => {
    png.disabled = true;
    try { const s = getSvg(); const { w, h: hh } = svgSize(s); triggerDownload(await svgToPngBlob(s, w, hh, 2), chartFilename(base, meta(), "png")); }
    catch (e) { toast(t("js-app-png-export-failed", "PNG export failed: { $reason }", { reason: errorMessage(e) })); }
    finally { png.disabled = false; }
  });
  host.append(png);
}

// ------------------------------------------------------------------ views
let engineImgUrl = null;
function renderTimeseries() {
  const run = S.run, r = run.result;
  const sm = V.seriesModel(r, run.toml);
  const hasEngine = !!(run.svg && run.svg.length > 200);
  $("ts-title").textContent = sm ? sm.title : t("js-app-engine-chart", "Engine chart");
  $("ts-live-btn").parentElement.hidden = !(sm && hasEngine);
  if (sm) mountChart("ts-live", V.lineChartSvg(sm), null);
  // Engine chart: the engine's own self-describing SVG, shown through an <img> so it
  // cannot run script.
  if (hasEngine) {
    if (engineImgUrl) URL.revokeObjectURL(engineImgUrl);
    engineImgUrl = URL.createObjectURL(svgBlob(run.svg));
    const box = $("ts-engine");
    box.replaceChildren(h("img", { alt: t("js-app-engine-chart-alt", "Engine chart for this run"), src: engineImgUrl }));
    attachChartHover("ts-engine", engineHoverModel(run.svg, r));
  }
  setTsMode(sm ? S.tsMode : "engine");
}
function setTsMode(mode) {
  const run = S.run;
  const sm = V.seriesModel(run.result, run.toml);
  const hasEngine = !!(run.svg && run.svg.length > 200);
  if (mode === "live" && !sm) mode = "engine";
  if (mode === "engine" && !hasEngine) mode = "live";
  $("ts-live").hidden = mode !== "live";
  $("ts-engine").hidden = mode !== "engine";
  for (const b of document.querySelectorAll("[data-ts]")) b.setAttribute("aria-selected", b.dataset.ts === mode ? "true" : "false");
  if (mode === "live") mountTools("ts-tools", () => exportSvg(V.lineChartSvg(sm).svg, sm.title), "timeseries");
  else mountTools("ts-tools", () => S.run.svg, "engine-chart");
}
function engineHoverModel(svgText, result) {
  const q = result && result.quantum && result.quantum.series;
  const c = result && result.classical && result.classical.series;
  if (!Array.isArray(q) || !Array.isArray(c) || q.length < 2) return null;
  const xs = parsePolylineXs(svgText);
  if (xs.length < 2) return null;
  const w = parseFloat((svgText.match(/width="(\d+(?:\.\d+)?)"/) || [])[1]) || 820;
  const n = Math.min(xs.length, q.length, c.length);
  const val = (s) => {
    if (!s) return null;
    if ("error_ns" in s) return `${V.fmt(s.error_ns)} ns`;
    if ("error_m" in s) return `${V.fmt(s.error_m)} m`;
    if ("sync_error_s" in s) return `${V.fmt(s.sync_error_s * 1e12)} ps`;
    if ("timing_ns" in s && "position_m" in s) return `${V.fmt(s.timing_ns)} ns / ${V.fmt(s.position_m)} m`;
    return null;
  };
  if (!val(q[0]) && !val(c[0])) return null;
  const ql = result.quantum.spec ? result.quantum.spec.id : t("js-app-hover-quantum", "quantum"), cl = result.classical.spec ? result.classical.spec.id : t("js-app-hover-classical", "classical");
  return { wIntrinsic: w, xs: xs.slice(0, n), label: (i) => `t=${Math.round((c[i] && c[i].t) ?? (q[i] && q[i].t) ?? 0)} s · ${ql} ${val(q[i]) ?? "—"} · ${cl} ${val(c[i]) ?? "—"}` };
}

function renderSignal() {
  const run = S.run;
  const sig = V.signalModel(run.result, run.toml);
  if (!sig) return;
  // With the jammer (effective C/N0) or without it (nominal), when the run publishes both.
  const fieldBox = $("sig-field");
  fieldBox.hidden = !sig.hasNominal;
  if (!sig.hasNominal) S.sigField = "cn0_effective_dbhz";
  for (const b of fieldBox.querySelectorAll("button")) b.setAttribute("aria-pressed", b.dataset.field === (S.sigField || "cn0_effective_dbhz") ? "true" : "false");
  const svg = V.signalHeatmapSvg(sig, { field: S.sigField || "cn0_effective_dbhz" });
  setSvg($("sig-heat"), svg);
  mountTools("sig-tools", () => exportSvg(svg, t("js-app-chart-cn0-by-satellite", "Effective C/N0 by satellite")), "signal");
  $("heat-legend").replaceChildren(h("span", { text: `${V.fmt(sig.cn0Range[0])}` }), h("i", { style: `background:linear-gradient(90deg,${[0, .25, .5, .75, 1].map(V.heat).join(",")})` }), h("span", { text: `${V.fmt(sig.cn0Range[1])} dB-Hz` }));
  const kv = $("band-kv");
  kv.replaceChildren();
  const row = (k, v) => kv.append(h("dt", { text: k }), h("dd", { text: v }));
  const b = sig.band;
  row(t("js-app-band-carrier", "Carrier"), b.carrier_hz ? `${V.fmt(b.carrier_hz / 1e6)} MHz` : t("js-app-band-carrier-unset", "not set in this scenario"));
  if (b.chip_rate_hz) row(t("js-app-band-chip-rate", "Chip rate"), `${V.fmt(b.chip_rate_hz / 1e6)} Mchip/s`);
  if (b.jammer_type) row(t("js-app-band-jammer-type", "Jammer type"), b.jammer_type);
  if (b.jammer_bandwidth_mhz) row(t("js-app-band-jammer-bandwidth", "Jammer bandwidth"), `${V.fmt(b.jammer_bandwidth_mhz)} MHz`);
  if (b.jammer_power_dbw !== null && b.jammer_power_dbw !== undefined) row(t("js-app-band-jammer-power", "Jammer power"), `${V.fmt(b.jammer_power_dbw)} dBW`);
  if (Number.isFinite(sig.threshold)) row(t("js-app-band-tracking-threshold", "Tracking threshold"), `${V.fmt(sig.threshold)} dB-Hz`);
  row(t("js-app-band-satellites", "Satellites"), String(sig.prns.length));
  // Band strip: only when the scenario states the carrier, so nothing is assumed.
  const strip = $("band-strip");
  strip.replaceChildren();
  if (b.carrier_hz && (b.chip_rate_hz || b.jammer_bandwidth_mhz)) setSvg(strip, bandStripSvg(b));
  else if (!b.carrier_hz) strip.append(h("p", { class: "card-note", text: t("js-app-band-no-carrier-note", "The engine computes the jammer-to-signal ratio from the link budget. This scenario does not name a carrier frequency, so no spectrum is drawn.") }));
  const sk = $("sig-kv");
  sk.replaceChildren();
  const units = run.result.units || {};
  for (const [k, v] of Object.entries(sig.fom || {})) {
    if (typeof v !== "number") continue;
    const u = units[`fom.${k}`] || {};
    sk.append(h("dt", { text: V.humanKey(k), title: u.note || "" }), h("dd", { text: `${V.fmt(v)}${u.unit && u.unit !== "1" ? " " + u.unit : ""}` }));
  }
  if (sig.jsRange) sk.append(h("dt", { text: t("js-app-js-range-label", "J/S range") }), h("dd", { text: t("js-app-js-range-value", "{ $lo } to { $hi } dB", { lo: V.fmt(sig.jsRange[0]), hi: V.fmt(sig.jsRange[1]) }) }));
  $("sig-fom-card").hidden = !sk.children.length;
}

// Signal main lobe (null to null, two chip rates wide) and the jammer band, to scale,
// around the scenario's own carrier. Schematic in shape, exact in width.
function bandStripSvg(b) {
  const W = 360, H = 120, c = 180;
  const lobe = b.chip_rate_hz ? b.chip_rate_hz / 1e6 : 0;
  const jam = b.jammer_bandwidth_mhz || 0;
  const span = Math.max(lobe * 2.6, jam * 1.3, 2);
  const px = (mhz) => c + (mhz / span) * W;
  let s = `<svg xmlns="http://www.w3.org/2000/svg" class="band-svg" viewBox="0 0 ${W} ${H}" role="img" aria-label="${V.esc(t("js-app-band-svg-label", "Signal and jammer bands around the carrier"))}">`;
  s += `<line x1="0" y1="${H - 24}" x2="${W}" y2="${H - 24}" style="stroke:var(--line-2)"/>`;
  if (jam) s += `<rect x="${px(-jam / 2)}" y="30" width="${px(jam / 2) - px(-jam / 2)}" height="${H - 54}" style="fill:color-mix(in srgb,var(--int) 22%,transparent);stroke:var(--int);stroke-dasharray:3 3"/><text x="${px(jam / 2) - 4}" y="44" text-anchor="end" style="fill:var(--int)">${V.esc(t("js-app-band-jammer-mhz", "jammer { $mhz } MHz", { mhz: V.fmt(jam) }))}</text>`;
  if (lobe) {
    let d = `M ${px(-lobe)} ${H - 24}`;
    for (let i = -40; i <= 40; i++) { const f = (i / 40) * lobe; const x = Math.PI * f / lobe; const v = i === 0 ? 1 : (Math.sin(x) / x) ** 2; d += ` L ${px(f).toFixed(1)} ${(H - 24 - v * (H - 64)).toFixed(1)}`; }
    s += `<path d="${d}" style="fill:color-mix(in srgb,var(--tim) 30%,transparent);stroke:var(--tim)"/><text x="${px(lobe) + 4}" y="${H - 30}">${V.esc(t("js-app-band-main-lobe", "signal main lobe"))}</text>`;
  }
  s += `<line x1="${c}" y1="16" x2="${c}" y2="${H - 20}" style="stroke:var(--ink-3);stroke-dasharray:2 3"/><text x="${c}" y="12" text-anchor="middle">${V.esc(V.fmt(b.carrier_hz / 1e6))} MHz</text>`;
  s += `<text x="2" y="${H - 8}">−${V.esc(V.fmt(span / 2))} MHz</text><text x="${W - 2}" y="${H - 8}" text-anchor="end">+${V.esc(V.fmt(span / 2))} MHz</text></svg>`;
  return s;
}

function renderHoldover() {
  const hm = V.holdoverModel(S.run.result);
  S.ho = hm;
  if (!hm) return;
  const after = hm.series.flatMap((s) => s.points.filter((p) => p[0] >= hm.loss).map((p) => Math.abs(p[1])));
  const maxE = Math.max(...after, hm.threshold || 0) || 1;
  const sl = $("ho-thr");
  sl.min = "0"; sl.max = String(maxE); sl.step = String(maxE / 400);
  sl.value = String(Number.isFinite(hm.threshold) ? hm.threshold : maxE / 2);
  $("ho-sub").textContent = hm.loss > 0 ? t("js-app-ho-error-after-loss", "error after GNSS was lost at t = { $t } s", { t: V.fmt(hm.loss) }) : t("js-app-ho-error-since-fix", "error since the last fix");
  $("ho-thr-reset").hidden = !Number.isFinite(hm.threshold);
  drawHoldover();
}
function drawHoldover() {
  const hm = S.ho;
  if (!hm) return;
  const sl = $("ho-thr");
  const thr = parseFloat(sl.value);
  sl.style.setProperty("--p", `${(thr / parseFloat(sl.max)) * 100}%`);
  $("ho-thr-out").textContent = `${V.fmt(thr)} ${hm.unit}`;
  const marks = [];
  const cards = $("ho-cards");
  cards.replaceChildren();
  hm.series.forEach((s) => {
    const tt = V.timeToThreshold(s.points, thr, hm.loss);
    if (tt && tt.crossed) {
      const p = V.nearestByX(s.points, hm.loss + tt.t);
      marks.push({ x: p[0], y: Math.abs(p[1]), color: s.color, label: V.fmtDuration(tt.t) });
    }
    const eng = hm.engineFigure.find((e) => e.label === s.label) || (hm.engineFigure.length === 1 ? hm.engineFigure[0] : null);
    cards.append(h("div", { class: "ho-card", style: `--c:${s.color}` },
      h("div", { class: "k" }, h("i"), s.label),
      h("div", { class: "v", text: tt ? (tt.crossed ? V.fmtDuration(tt.t) : `> ${V.fmtDuration(tt.t)}`) : "—" }),
      h("div", { class: "e", text: tt && !tt.crossed ? t("js-app-ho-stays-inside", "stays inside this budget for the whole record") : t("js-app-ho-until-breached", "until the budget is breached") }),
      eng ? h("div", { class: "e", text: Number.isFinite(hm.threshold) ? t("js-app-ho-engine-budget", "Engine holdover at the scenario budget ({ $budget } { $unit }): { $duration }", { budget: V.fmt(hm.threshold), unit: hm.unit, duration: V.fmtDuration(eng.holdover_s) }) : t("js-app-ho-engine-budget-bare", "Engine holdover at the scenario budget: { $duration }", { duration: V.fmtDuration(eng.holdover_s) }) }) : null));
  });
  const model = { ...hm, threshold: thr, thresholdLabel: t("js-app-ho-budget", "budget"), series: hm.series.map((s) => ({ ...s, points: s.points.map((p) => [p[0], Math.abs(p[1])]) })), yLabel: `|${hm.yLabel}|` };
  mountChart("ho-chart", V.lineChartSvg(model, { marks }), "ho-tools", "holdover", t("js-app-chart-holdover-title", "Holdover against a timing budget"));
}

function renderMasks() {
  const mm = V.masksModel(S.run.result);
  if (!mm) return;
  const vs = $("mask-verdicts");
  vs.replaceChildren();
  for (const m of mm.masks) vs.append(h("div", { class: `verdict ${m.verdict === "PASS" ? "pass" : "fail"}` }, h("b", { text: m.verdict }), h("span", { text: m.title || m.id })));
  if (mm.envelope && mm.envelope.verdict) vs.append(h("div", { class: `verdict ${mm.envelope.verdict === "PASS" ? "pass" : "fail"}` }, h("b", { text: mm.envelope.verdict }), h("span", { text: t("js-app-mask-envelope", "Holdover time-error envelope ({ $source })", { source: mm.envelope.source || "" }) })));
  const marksFor = (metric) => mm.masks.flatMap((m) => m.checks.filter((c) => c.metric === metric && Number.isFinite(c.limit_ns) && Number.isFinite(c.worst_tau_s)).map((c) => ({ x: c.worst_tau_s, y: c.limit_ns, color: c.verdict === "PASS" ? "var(--s-itg)" : "var(--s-int)", label: t("js-app-mask-limit", "limit { $value } ns", { value: V.fmt(c.limit_ns) }) })));
  const mt = V.lineChartSvg({ title: "MTIE", series: [{ label: "MTIE (ns)", color: "var(--s-tim)", points: mm.mtie }], xLabel: t("js-app-axis-observation-interval", "observation interval τ (s)"), yLabel: "MTIE (ns)", unit: "ns" }, { logX: true, logY: true, marks: marksFor("mtie"), h: 300 });
  mountChart("mtie-chart", mt, "mtie-tools", "mtie", t("js-app-chart-mtie-title", "MTIE (maximum time interval error)"));
  if (mm.tdev.length) {
    const td = V.lineChartSvg({ title: "TDEV", series: [{ label: "TDEV (ns)", color: "var(--s-spf)", points: mm.tdev }], xLabel: t("js-app-axis-observation-interval", "observation interval τ (s)"), yLabel: "TDEV (ns)", unit: "ns" }, { logX: true, logY: true, marks: marksFor("tdev"), h: 300 });
    mountChart("tdev-chart", td, "tdev-tools", "tdev", t("js-app-chart-tdev-title", "TDEV (time deviation)"));
  }
  const maskT = $("mask-table");
  maskT.replaceChildren(h("thead", {}, h("tr", {}, [t("js-app-th-mask-or-budget", "Mask or budget"), t("js-app-th-metric-2", "Metric"), t("js-app-th-value-3", "Value"), t("js-app-th-limit", "Limit"), t("js-app-th-margin", "Margin"), t("js-app-th-at-tau", "At τ or time"), t("js-app-th-verdict", "Verdict"), t("js-app-th-source", "Source")].map((x) => h("th", { text: x })))));
  const tb = h("tbody");
  for (const m of mm.masks) for (const c of m.checks) {
    tb.append(h("tr", {}, h("td", { text: m.title || m.id }), h("td", { text: c.metric }), h("td", { class: "num", text: V.fmt(c.value_ns) }), h("td", { class: "num", text: V.fmt(c.limit_ns) }), h("td", { class: "num", text: V.fmt(c.margin_ns) }), h("td", { class: "num", text: Number.isFinite(c.worst_tau_s) ? `${V.fmt(c.worst_tau_s)} s` : "—" }), h("td", {}, h("b", { class: c.verdict === "PASS" ? "better" : "", text: c.verdict })), h("td", { class: "note", text: c.source || m.recommendation || "" })));
  }
  for (const b of mm.budgets) {
    tb.append(h("tr", {}, h("td", { text: b.name }), h("td", { text: "max |TE|" }), h("td", { class: "num", text: "—" }), h("td", { class: "num", text: V.fmt(b.max_abs_te_ns) }), h("td", { class: "num", text: "—" }), h("td", { class: "num", text: Number.isFinite(b.time_to_exceed_s) ? t("js-app-mask-exceeded-after", "exceeded after { $duration }", { duration: V.fmtDuration(b.time_to_exceed_s) }) : t("js-app-mask-not-exceeded", "not exceeded") }), h("td", {}, h("b", { text: b.exceeded ? "EXCEEDED" : "HELD" })), h("td", { class: "note", text: b.source || "" })));
  }
  maskT.append(tb);
}

function renderStability() {
  const curves = V.adevCurves(S.run.result);
  if (!curves.length) return;
  const chart = V.lineChartSvg({ title: t("js-app-chart-allan-deviation", "Allan deviation"), series: curves, xLabel: t("js-app-axis-averaging-time", "averaging time τ (s)"), yLabel: "σy(τ)", unit: "" }, { logX: true, logY: true });
  mountChart("adev-chart", chart, "adev-tools", "allan", t("js-app-chart-stability-title", "Clock stability (overlapping Allan deviation)"));
}

function renderGround() {
  const gt = V.groundTrack(S.run.result);
  if (!gt) return;
  const svg = V.groundTrackSvg(gt, { land: S.land || [] });
  setSvg($("gt-chart"), svg);
  $("gt-note").textContent = [t("js-app-gt-highlighted", "Highlighted: satellite visible from the station."), Number.isFinite(gt.maxElevation) ? t("js-app-gt-peak-elevation", "Peak elevation { $value }°.", { value: V.fmt(gt.maxElevation) }) : "", Number.isFinite(gt.peakDoppler) ? t("js-app-gt-peak-doppler", "Peak Doppler { $value } Hz.", { value: V.fmt(gt.peakDoppler) }) : ""].filter(Boolean).join(" ");
  mountTools("gt-tools", () => exportSvg(svg, t("js-app-chart-ground-track", "Ground track")), "ground-track");
}

// 3-D orbit: Three.js when it loads (drag to rotate), else the dependency-free SVG view.
let three = null;
// Greenwich mean sidereal time (IAU 1982 expression), radians.
function gmstRad(jd) {
  const T = (jd - 2451545.0) / 36525;
  const g = 280.46061837 + 360.98564736629 * (jd - 2451545.0) + 0.000387933 * T * T - (T * T * T) / 38710000;
  return ((((g % 360) + 360) % 360) * Math.PI) / 180;
}
async function renderOrbit() {
  S.orbitDirty = false;
  const track = V.orbitTrackKm(S.run.result);
  if (!track) return;
  const meta = fileMeta(S.run.result, S.version, S.run.toml);
  const svgFallback = () => orbit3dSvg({ trackKm: track, satsKm: [], view: { az_deg: 35, el_deg: 22 } }, meta);
  mountTools("orbit-tools", svgFallback, "orbit3d");
  const box = $("orbit-box");
  try {
    if (!three) {
      const T = await import("three");
      const { OrbitControls } = await import("three/addons/controls/OrbitControls.js");
      three = { T, OrbitControls };
    }
    drawThree(box, track);
    $("orbit-note").textContent = [t("js-app-orbit-note", "Drag to rotate, scroll or pinch to zoom. Earth to scale, NASA Blue Marble imagery."), box.dataset.epoch === "set" ? t("js-app-orbit-epoch-set", "Turned to the run's epoch.") : t("js-app-orbit-epoch-unset", "This run does not state an epoch, so Earth's rotation angle is not meaningful here.")].join(" ");
  } catch (e) {
    const url = URL.createObjectURL(svgBlob(svgFallback()));
    box.replaceChildren(h("img", { alt: t("js-app-orbit-img-alt", "Orthographic view of the propagated track"), src: url }));
    $("orbit-note").textContent = t("js-app-orbit-static", "Static view (the 3-D library could not load here).");
  }
}
function drawThree(box, track) {
  const { T, OrbitControls } = three;
  if (box._stop) box._stop();
  let canvas = box.querySelector("canvas");
  if (!canvas) { canvas = h("canvas", { "aria-label": t("js-app-orbit-canvas-label", "Interactive 3-D view of the propagated track") }); box.replaceChildren(canvas); }
  const renderer = new T.WebGLRenderer({ canvas, antialias: true, alpha: true });
  renderer.setPixelRatio(Math.min(2, window.devicePixelRatio || 1));
  const scene = new T.Scene();
  const k = 1 / 1000; // 1 unit = 1000 km
  const R = 6378.137 * k;
  const maxR = Math.max(...track.map((p) => Math.hypot(p[0], p[1], p[2]))) * k;
  const camera = new T.PerspectiveCamera(40, 1, 0.01, 50000);
  camera.position.set(maxR * 2.2, maxR * 1.2, maxR * 2.2);
  const controls = new OrbitControls(camera, canvas);
  controls.enableDamping = true;
  controls.autoRotate = !reducedMotion();
  controls.autoRotateSpeed = 0.6;
  scene.add(new T.AmbientLight(0xffffff, 0.55));
  const sun = new T.DirectionalLight(0xffffff, 1.1); sun.position.set(5, 3, 4); scene.add(sun);
  // Earth: NASA Blue Marble imagery on a sphere of the WGS-84 equatorial radius. When the run
  // states its epoch (jd_utc0), the globe is turned to that moment's Greenwich sidereal time;
  // otherwise its orientation is not set by the run and the note says so.
  const earthMat = new T.MeshStandardMaterial({ roughness: 0.9, metalness: 0 });
  const earth = new T.Mesh(new T.SphereGeometry(R, 96, 64), earthMat);
  const loader = new T.TextureLoader();
  const lo = loader.load("assets/planets/earth-day-256.jpg", () => {
    loader.load("assets/planets/earth-day-2048.jpg", (hi) => { hi.colorSpace = T.SRGBColorSpace; earthMat.map = hi; earthMat.needsUpdate = true; lo.dispose(); });
  });
  lo.colorSpace = T.SRGBColorSpace;
  earthMat.map = lo;
  const jd0 = S.run.result && typeof S.run.result.jd_utc0 === "number" ? S.run.result.jd_utc0 : null;
  if (jd0 !== null) earth.rotation.y = gmstRad(jd0);
  scene.add(earth);
  box.dataset.epoch = jd0 !== null ? "set" : "unset";
  // ECI z is the rotation axis; three's y is up.
  const pts = track.map((p) => new T.Vector3(p[0] * k, p[2] * k, -p[1] * k));
  scene.add(new T.Line(new T.BufferGeometry().setFromPoints(pts), new T.LineBasicMaterial({ color: 0x2cd0de })));
  const sat = new T.Mesh(new T.SphereGeometry(Math.max(0.12, maxR * 0.018), 16, 12), new T.MeshBasicMaterial({ color: 0xffb224 }));
  scene.add(sat);
  scene.add(new T.Line(new T.BufferGeometry().setFromPoints([new T.Vector3(0, -R * 1.4, 0), new T.Vector3(0, R * 1.4, 0)]), new T.LineBasicMaterial({ color: 0xa3aac2, transparent: true, opacity: 0.4 })));
  let raf = 0, i = 0, alive = true;
  // Sized from the box, or from the canvas itself while it is the full-screen element.
  const size = () => { const el = document.fullscreenElement === canvas ? canvas : box; const w = el.clientWidth, hh = el.clientHeight; renderer.setSize(w, hh, false); camera.aspect = w / Math.max(1, hh); camera.updateProjectionMatrix(); };
  const ro = new ResizeObserver(size); ro.observe(box); ro.observe(canvas); size();
  document.addEventListener("fullscreenchange", size);
  const tick = () => {
    if (!alive) return;
    if (!reducedMotion()) i = (i + 0.35) % pts.length;
    sat.position.copy(pts[Math.floor(i)]);
    controls.update();
    renderer.render(scene, camera);
    raf = requestAnimationFrame(tick);
  };
  tick();
  box._stop = () => { alive = false; cancelAnimationFrame(raf); ro.disconnect(); document.removeEventListener("fullscreenchange", size); controls.dispose(); renderer.dispose(); };
}

// ------------------------------------------------------------------ sweep
function sweepKnobs(toml) {
  const fields = numericFields(toml);
  const guided = knobsForToml(toml);
  const out = [];
  for (const k of guided) {
    const f = fields.find((x) => x.section === (k.section || "") && x.key === k.key);
    out.push({ id: `${k.section || ""}::${k.key}`, label: k.label, knob: k, field: f || null, integer: !!k.integer || !!(f && f.integer) });
  }
  for (const f of fields) if (!out.some((o) => o.id === f.id)) out.push({ id: f.id, label: `${f.section ? f.section + "." : ""}${f.key}`, knob: null, field: f, integer: f.integer });
  return out;
}
function sweepMetricList(result) {
  const out = sweepMetrics(result).map((m) => ({ id: m.id, label: m.label, get: m.get }));
  if (!out.length) {
    for (const kf of V.keyFigures(result, 20)) {
      const path = kf.path.split(".");
      out.push({ id: `path::${kf.path}`, label: `${kf.label}${kf.unit ? ` (${kf.unit})` : ""}`, get: (r) => { let v = r; for (const p of path) v = v && v[p]; return typeof v === "number" && Number.isFinite(v) ? v : null; } });
    }
  }
  return out;
}
function syncSweepControls() {
  const run = S.run;
  const knobs = sweepKnobs(run.toml);
  const fill = (sel, items, blankLabel) => {
    const prev = sel.value;
    sel.replaceChildren(...(blankLabel ? [h("option", { value: "", text: blankLabel })] : []), ...items.map((k) => h("option", { value: k.id, text: k.label })));
    if ([...sel.options].some((o) => o.value === prev)) sel.value = prev;
  };
  fill($("sweep-knob"), knobs);
  fill($("sweep-knob2"), knobs, t("js-app-sweep-none-line", "None (line chart)"));
  fill($("sweep-metric"), sweepMetricList(run.result));
  seedSweepRange(false);
  $("sweep-run").disabled = S.mode !== "live";
  if (S.mode !== "live") $("sweep-status").textContent = t("js-app-sweep-needs-live", "A sweep runs the engine many times, so it needs the live engine.");
}
function seedSweepRange(force) {
  const knobs = sweepKnobs(tomlEl.value);
  for (const [sel, a, b] of [["sweep-knob", "sweep-min", "sweep-max"], ["sweep-knob2", "sweep-min2", "sweep-max2"]]) {
    const k = knobs.find((x) => x.id === $(sel).value);
    if (!k) continue;
    if (!force && $(a).dataset.for === k.id) continue;
    $(a).dataset.for = k.id;
    const v = k.field ? k.field.value : parseFloat(readKnob(tomlEl.value, k.knob));
    if (k.knob) { $(a).value = String(k.knob.min); $(b).value = String(Number.isFinite(v) ? Math.max(v, k.knob.max) : k.knob.max); }
    else if (k.field && isLogScale(k.field)) { $(a).value = String(v / 10); $(b).value = String(v * 10); }
    else if (k.integer) { $(a).value = String(Math.max(0, Math.round(v / 2))); $(b).value = String(Math.round(v * 2) || 10); }
    else { $(a).value = String(v === 0 ? 0 : v / 2); $(b).value = String(v === 0 ? 1 : v * 2); }
  }
  const two = !!$("sweep-knob2").value;
  for (const el of document.querySelectorAll(".sweep-2d-range")) el.hidden = !two;
}
function valuesFor(k, min, max, steps) {
  if (k.field && isLogScale(k.field) && min > 0 && max > 0) {
    const n = Math.max(2, Math.min(MAX_SWEEP, Math.round(steps)));
    return Array.from({ length: n }, (_, i) => min * (max / min) ** (i / (n - 1)));
  }
  return sweepValues(min, max, steps, !!k.integer);
}
function patchKnob(toml, k, v) {
  if (k.field) {
    const f = numericFields(toml).find((x) => x.id === k.field.id);
    if (f) return patchField(toml, f, v);
  }
  return sweepToml(toml, { key: k.knob.key, section: k.knob.section || "" }, v);
}
async function runSweep() {
  const status = $("sweep-status");
  if (S.mode !== "live") return;
  if (job.active) { status.textContent = t("js-app-sweep-wait", "Wait for the current run to finish, then sweep."); return; }
  const knobs = sweepKnobs(tomlEl.value);
  const k1 = knobs.find((x) => x.id === $("sweep-knob").value);
  const k2 = knobs.find((x) => x.id === $("sweep-knob2").value) || null;
  const metric = sweepMetricList(S.run.result).find((m) => m.id === $("sweep-metric").value);
  if (!k1 || !metric) { status.textContent = t("js-app-sweep-nothing", "Nothing to sweep for this scenario."); return; }
  const min = parseFloat($("sweep-min").value), max = parseFloat($("sweep-max").value);
  let steps = parseInt($("sweep-steps").value, 10) || 8;
  if (!Number.isFinite(min) || !Number.isFinite(max)) { status.textContent = t("js-app-sweep-enter-range", "Enter a numeric range."); return; }
  let v2 = [null];
  if (k2 && k2.id !== k1.id) {
    const a = parseFloat($("sweep-min2").value), b = parseFloat($("sweep-max2").value);
    if (!Number.isFinite(a) || !Number.isFinite(b)) { status.textContent = t("js-app-sweep-enter-range-2", "Enter a numeric range for the second parameter."); return; }
    steps = Math.min(steps, Math.floor(Math.sqrt(MAX_SWEEP)));
    v2 = valuesFor(k2, a, b, steps);
  }
  const v1 = valuesFor(k1, min, max, steps);
  const total = v1.length * v2.length;
  const base = tomlEl.value;
  const gen = beginJob(t("js-app-job-sweeping", "Sweeping"));
  const grid = [];
  try {
    let n = 0;
    for (const b of v2) {
      const rowVals = [];
      for (const a of v1) {
        n += 1;
        status.textContent = t("js-app-sweep-progress", "Sweeping run { $n } of { $total }…", { n, total });
        let src = patchKnob(base, k1, a);
        if (b !== null) src = patchKnob(src, k2, b);
        const res = JSON.parse(await S.engine.call("run", src));
        rowVals.push(metric.get(res));
      }
      grid.push(rowVals);
    }
  } catch (e) {
    if (gen !== job.gen) { status.textContent = t("js-app-sweep-interrupted", "Sweep interrupted by a new run."); return; }
    endJob(gen);
    status.textContent = isCancelled(e) ? t("js-app-sweep-cancelled", "Sweep cancelled.") : t("js-app-sweep-failed", "Sweep failed: { $reason }", { reason: errorMessage(e) });
    return;
  }
  if (gen !== job.gen) return;
  const ms = performance.now() - job.startedAt;
  endJob(gen);
  $("sweep-out").hidden = false;
  let svg, title;
  if (v2[0] === null) {
    const pts = v1.map((x, i) => [x, grid[0][i]]).filter((p) => p[1] !== null);
    title = t("js-app-sweep-title-1d", "{ $metric } against { $knob }", { metric: metric.label, knob: k1.label });
    const chart = V.lineChartSvg({ title, series: [{ label: metric.label, color: "var(--s-nav)", points: pts }], xLabel: k1.label, yLabel: metric.label, unit: "" }, { logX: !!(k1.field && isLogScale(k1.field)), marks: pts.map((p) => ({ x: p[0], y: p[1], color: "var(--s-nav)" })) });
    mountChart("sweep-chart", chart, null);
    svg = chart.svg;
    status.textContent = t("js-app-sweep-done-1d", "Swept { $done } of { $total } runs locally in { $duration }.", { done: pts.length, total, duration: ms >= 1000 ? `${(ms / 1000).toFixed(1)} s` : `${Math.max(1, Math.round(ms))} ms` });
  } else {
    title = t("js-app-sweep-title-2d", "{ $metric } over { $knob1 } and { $knob2 }", { metric: metric.label, knob1: k1.label, knob2: k2.label });
    svg = heatGridSvg(v1, v2, grid, k1.label, k2.label, metric.label);
    setSvg($("sweep-chart"), svg);
    status.textContent = t("js-app-sweep-done-2d", "Swept { $total } runs ({ $a } × { $b }) locally in { $duration }.", { total, a: v1.length, b: v2.length, duration: ms >= 1000 ? `${(ms / 1000).toFixed(1)} s` : `${Math.max(1, Math.round(ms))} ms` });
  }
  S.sweepSvg = { svg, title };
  mountTools("sweep-tools", () => exportSvg(svg, title), "sweep");
  setStatus(t("js-app-sweep-status-done", "Swept { $total } runs at { $time }.", { total, time: new Date().toLocaleTimeString() }), "ran");
}
function heatGridSvg(xs, ys, grid, xl, yl, ml) {
  const W = 760, H = 380, L = 92, Rm = 20, T = 20, B = 52;
  const vals = grid.flat().filter((v) => v !== null && Number.isFinite(v));
  const lo = Math.min(...vals), hi = Math.max(...vals);
  const cw = (W - L - Rm) / xs.length, ch = (H - T - B) / ys.length;
  let s = `<svg xmlns="http://www.w3.org/2000/svg" class="chart" viewBox="0 0 ${W} ${H}" width="${W}" height="${H}" role="img" aria-label="${V.esc(t("js-app-heat-map-label", "{ $metric } heat map", { metric: ml }))}"><rect class="c-bg" width="${W}" height="${H}"/>`;
  ys.forEach((y, j) => xs.forEach((x, i) => {
    const v = grid[j][i];
    const t = v === null ? 0 : hi > lo ? (v - lo) / (hi - lo) : 1;
    const X = L + i * cw, Y = T + (ys.length - 1 - j) * ch;
    s += `<rect x="${X.toFixed(1)}" y="${Y.toFixed(1)}" width="${(cw - 2).toFixed(1)}" height="${(ch - 2).toFixed(1)}" rx="4" style="fill:${v === null ? "#222" : V.heat(t)}"><title>${V.esc(xl)} ${V.esc(V.fmt(x))} · ${V.esc(yl)} ${V.esc(V.fmt(y))} · ${V.esc(ml)} ${V.esc(V.fmt(v))}</title></rect>`;
    if (cw > 58) s += `<text x="${(X + cw / 2 - 1).toFixed(1)}" y="${(Y + ch / 2 + 4).toFixed(1)}" text-anchor="middle" style="fill:#060A14;font-size:10px">${V.esc(V.fmt(v))}</text>`;
  }));
  xs.forEach((x, i) => { s += `<text class="c-tick" x="${(L + i * cw + cw / 2).toFixed(1)}" y="${H - B + 16}" text-anchor="middle">${V.esc(V.fmt(x))}</text>`; });
  ys.forEach((y, j) => { s += `<text class="c-tick" x="${L - 8}" y="${(T + (ys.length - 1 - j) * ch + ch / 2 + 4).toFixed(1)}" text-anchor="end">${V.esc(V.fmt(y))}</text>`; });
  s += `<text class="c-axis" x="${L + (W - L - Rm) / 2}" y="${H - 10}" text-anchor="middle">${V.esc(xl)}</text><text class="c-axis" x="14" y="${T + (H - T - B) / 2}" text-anchor="middle" transform="rotate(-90 14 ${T + (H - T - B) / 2})">${V.esc(yl)}</text></svg>`;
  return s;
}

// ------------------------------------------------------------------ compare
const MAX_PINS = 4;
function pinRun(run = S.run) {
  if (!run) return;
  if (S.pins.some((p) => p.id === run.id)) { toast(t("js-app-pin-already", "That run is already pinned.")); return; }
  if (S.pins.length >= MAX_PINS) S.pins.shift();
  S.pins.push(run);
  toast(S.pins.length < 2 ? t("js-app-pin-first", "Run { $id } pinned. Change a parameter, run again, then pin that run too.", { id: run.id }) : t("js-app-pin-compare", "{ $n } runs pinned. Opening Compare.", { n: S.pins.length }));
  buildTabs();
  if (S.pins.length >= 2) selectTab("compare", { scroll: true });
}
function renderCompare() { renderCompareBase(); renderCompareExtras(); }
function renderCompareBase() {
  const host = $("pins");
  host.replaceChildren();
  S.pins.forEach((p, i) => host.append(h("span", { class: "pin" }, h("i", { style: `background:${PALETTE[i]}` }), t("js-app-pin-label", "{ $letter } · { $title } · run { $id }", { letter: String.fromCharCode(65 + i), title: p.title, id: p.id }),
    h("button", { type: "button", "aria-label": t("js-app-unpin-run", "Unpin run { $id }", { id: p.id }), onclick: () => { S.pins.splice(i, 1); buildTabs(); } }, icon("i-x")))));
  const cmpT = $("compare-table");
  cmpT.replaceChildren();
  const note = $("compare-note");
  $("compare-chart-card").hidden = true;
  if (S.pins.length < 2) { note.textContent = t("js-app-compare-pin-two", "Pin at least two runs to compare them side by side. Pin a run, change a parameter or pick another scenario of the same family, run it, and pin again."); return; }
  const runs = S.pins.map((p, i) => ({ label: String.fromCharCode(65 + i), result: p.result }));
  const rows = overlayRows(runs);
  if (!rows.length) { note.textContent = t("js-app-compare-none", "These runs share no comparable figures of merit. Pin runs of the same scenario family to see numbers and deltas."); return; }
  note.textContent = t("js-app-compare-deltas", "Deltas are against run A. Green marks the better value for each figure.");
  const hasClock = rows.some((r) => r.clockLabel);
  const heads = [...(hasClock ? [t("js-app-th-clock", "Clock")] : []), t("js-app-th-figure", "Figure")].map((x) => h("th", { text: x }));
  runs.forEach((r, i) => heads.push(h("th", {}, h("span", { class: "sw", style: `background:${PALETTE[i]}` }), r.label)));
  cmpT.append(h("thead", {}, h("tr", {}, heads)));
  const tb = h("tbody");
  for (const r of rows) {
    const tr = h("tr", {}, ...(hasClock ? [h("td", { text: r.clockLabel })] : []), h("td", { text: r.unit ? `${r.label} (${r.unit})` : r.label }));
    r.values.forEach((v, i) => {
      const td = h("td", { class: "num" + (i === r.best ? " better" : ""), text: V.fmt(v) });
      if (i > 0 && typeof v === "number" && typeof r.values[0] === "number") {
        const d = v - r.values[0];
        const pct = r.values[0] !== 0 ? ` (${d >= 0 ? "+" : "−"}${Math.abs((d / Math.abs(r.values[0])) * 100).toFixed(1)}%)` : "";
        const good = r.lowerBetter ? d < 0 : d > 0;
        td.append(h("span", { class: `delta ${d === 0 ? "" : good ? "up" : "down"}`, text: `${d > 0 ? "+" : d < 0 ? "−" : "±"}${V.fmt(Math.abs(d))}${pct}` }));
      }
      tr.append(td);
    });
    tb.append(tr);
  }
  cmpT.append(tb);
  // Overlay chart: each run's last series on shared axes, plus B − A when there are two.
  const models = S.pins.map((p) => V.seriesModel(p.result, p.toml));
  if (models.every((m) => m && m.unit === models[0].unit)) {
    const series = models.map((m, i) => ({ label: `${String.fromCharCode(65 + i)} · ${m.series[m.series.length - 1].label}`, color: PALETTE[i], points: m.series[m.series.length - 1].points }));
    if (series.length === 2) {
      const [a, b] = series;
      series.push({ label: "B − A", color: "var(--s-int)", points: b.points.map((p) => { const q = V.nearestByX(a.points, p[0]); return [p[0], p[1] - q[1]]; }) });
    }
    const title = series.length === 3 ? t("js-app-overlay-with-diff", "Overlay with the difference B − A") : t("js-app-overlay-pinned", "Overlay of pinned runs");
    $("compare-chart-title").textContent = title;
    mountChart("compare-chart", V.lineChartSvg({ title, series, xLabel: models[0].xLabel, yLabel: models[0].yLabel, unit: models[0].unit, outages: models[0].outages }), "compare-tools", "compare", title);
    $("compare-chart-card").hidden = false;
  }
}

// ------------------------------------------------------------------ exports + report
const EXPORTERS = () => [
  ["SP3", "export_sp3", "sp3", t("js-app-export-sp3-desc", "SP3-c precise ephemeris of this constellation"), "text/plain", "var(--orb)"],
  ["OMM", "export_omm", "omm", t("js-app-export-omm-desc", "CCSDS OMM (Orbit Mean-elements Message) catalogue"), "text/plain", "var(--orb)"],
  ["OEM", "export_oem", "oem", t("js-app-export-oem-desc", "CCSDS OEM 2.0 (Orbit Ephemeris Message) for GMAT, Orekit or STK"), "text/plain", "var(--orb)"],
];
async function renderExports() {
  const run = S.run;
  const grid = $("export-grid");
  const meta = fileMeta(run.result, S.version, run.toml);
  const card = (fmtLabel, title, desc, c, onClick, disabled) => h("button", { class: "exp", type: "button", style: `--c:${c}`, disabled: disabled || null, onclick: onClick }, h("span", { class: "f", text: fmtLabel }), h("b", { text: title }), h("span", { text: desc }));
  const items = [
    card("HTML", t("js-app-export-report-title", "Reproducible report"), t("js-app-export-report-desc", "One offline file: summary, figures with their tiers, every chart and the exact scenario text, stamped with engine version and scenario hash."), "var(--ink)", downloadReport),
    card("JSON", t("js-app-export-json-title", "Full result document"), t("js-app-export-json-desc", "The engine's complete output for this run, units and provenance included."), "var(--spf)", () => triggerDownload(new Blob([JSON.stringify(run.result, null, 2)], { type: "application/json" }), chartFilename("result", meta, "json"))),
    card("TOML", t("js-app-export-toml-title", "Scenario file"), t("js-app-export-toml-desc", "The exact input of this run. Run it again anywhere with the command-line tool or the Python and npm packages."), "var(--tim)", () => triggerDownload(new Blob([run.toml], { type: "text/plain" }), chartFilename("scenario", meta, "toml"))),
  ];
  if (run.csv) items.push(card("CSV", t("js-app-export-csv-title", "Reproducibility table"), t("js-app-export-csv-desc", "The same bytes the command-line tool writes as { $file }.", { file: "<scenario>.table.csv" }), "var(--itg)", () => triggerDownload(new Blob([withEvidenceCsv(run.csv, run.result)], { type: "text/csv" }), chartFilename("table", meta, "csv"))));
  grid.replaceChildren(...items);
  renderInterop(run);
  // Standards-track ephemeris exports: asked of the engine once per run, when this tab opens.
  if (!(run.result && Array.isArray(run.result.eci_track))) return;
  if (!S.engine) { grid.append(h("p", { class: "card-note", text: t("js-app-export-engine-loading", "The ephemeris exports appear here when the engine has loaded.") })); return; }
  let ex = S.exportsCache.get(run.id);
  if (!ex) {
    const pending = h("p", { class: "card-note", text: t("js-app-export-checking", "Checking which ephemeris formats this run can export…") });
    grid.append(pending);
    ex = [];
    for (const [label, fn, ext, desc, mime, c] of EXPORTERS()) {
      try { const text = await S.engine.call(fn, run.toml); if (text && text.trim()) ex.push({ label, ext, desc, mime, c, text }); }
      catch (e) { if (e.tooLarge || /large/.test(errorMessage(e))) ex.push({ label, ext, desc: t("js-app-export-too-large", "{ $desc }. Too large to record: needs the live engine.", { desc }), mime, c, text: null }); }
    }
    S.exportsCache.set(run.id, ex);
    pending.remove();
    if (S.run !== run || S.activeTab !== "exports") return;
  }
  for (const x of ex) grid.append(card(x.label, t("js-app-export-card-title", "{ $format } export", { format: x.label }), x.desc, x.c, () => triggerDownload(new Blob([x.text], { type: x.mime }), chartFilename(x.ext, meta, x.ext)), !x.text));
}
function downloadReport() {
  const run = S.run;
  if (!run) return;
  const r = run.result;
  const svgs = [];
  if (run.svg) svgs.push({ title: t("js-app-engine-chart", "Engine chart"), svg: run.svg });
  const sm = V.seriesModel(r, run.toml);
  if (sm) svgs.push({ title: sm.title, svg: exportSvg(V.lineChartSvg(sm).svg, sm.title) });
  const curves = V.adevCurves(r);
  if (curves.length) svgs.push({ title: t("js-app-report-stability-title", "Clock stability (Allan deviation)"), svg: exportSvg(V.lineChartSvg({ series: curves, xLabel: "τ (s)", yLabel: "σy(τ)" }, { logX: true, logY: true }).svg, t("js-app-report-stability-short", "Clock stability")) });
  const sig = V.signalModel(r, run.toml);
  if (sig) svgs.push({ title: t("js-app-chart-cn0-by-satellite", "Effective C/N0 by satellite"), svg: exportSvg(V.signalHeatmapSvg(sig), t("js-app-chart-cn0-by-satellite", "Effective C/N0 by satellite")) });
  const track = V.orbitTrackKm(r);
  if (track) svgs.push({ title: t("js-app-report-orbit-title", "Orbit (Earth-centred inertial, orthographic)"), svg: orbit3dSvg({ trackKm: track, satsKm: [], view: { az_deg: 35, el_deg: 22 } }, fileMeta(r, S.version, run.toml)) });
  const mm = V.masksModel(r);
  if (mm) {
    svgs.push({ title: t("js-app-chart-mtie-title", "MTIE (maximum time interval error)"), svg: exportSvg(V.lineChartSvg({ series: [{ label: "MTIE (ns)", color: "var(--s-tim)", points: mm.mtie }], xLabel: "τ (s)", yLabel: "MTIE (ns)" }, { logX: true, logY: true }).svg, "MTIE") });
    if (mm.tdev.length) svgs.push({ title: t("js-app-chart-tdev-title", "TDEV (time deviation)"), svg: exportSvg(V.lineChartSvg({ series: [{ label: "TDEV (ns)", color: "var(--s-spf)", points: mm.tdev }], xLabel: "τ (s)", yLabel: "TDEV (ns)" }, { logX: true, logY: true }).svg, "TDEV") });
  }
  const gt = V.groundTrack(r);
  if (gt) svgs.push({ title: t("js-app-chart-ground-track", "Ground track"), svg: exportSvg(V.groundTrackSvg(gt), t("js-app-chart-ground-track", "Ground track")) });
  if (S.sweepSvg) svgs.push({ title: S.sweepSvg.title, svg: exportSvg(S.sweepSvg.svg, S.sweepSvg.title) });
  for (const c of capabilityCharts(run)) svgs.push({ title: c.title, svg: exportSvg(c.svg, c.title) });
  let fomRows = buildFomRows(r);
  if (!fomRows.length) fomRows = V.keyFigures(r, 24).map((k) => { const ft = figureTier(r, k.path); return { clockLabel: "", label: k.label, unit: k.unit, value: k.value, tier: ft ? ft.tier : "", metric: k.path }; });
  const meta = fileMeta(r, S.version, run.toml);
  const html = buildReportHtml({ engineVersion: meta.ver, scenarioHash: meta.hash, toml: run.toml, summaryText: run.summary, fomRows, svgs, generatedIso: new Date().toISOString() });
  triggerDownload(new Blob([html], { type: "text/html" }), reportFilename(meta));
  toast(t("js-app-report-downloaded", "Report downloaded."));
}

// ------------------------------------------------------------------ capability views (the newer kinds)
// lib/kinds.mjs turns a result into panels that name the PATH of every value they show;
// lib/stages.mjs draws the interactive stage above them. Each value element records its path
// (data-path) and the value as the engine wrote it (data-raw), so what is on screen can be
// checked against the result document.
const players = [];
function stopPlayers() { for (const p of players.splice(0)) p.stop(); }

// The spoken names of a player's controls, by kind of replay.
function playerWords(name) {
  if (name === "waterfall replay") return { play: t("js-app-player-play-waterfall", "Play the waterfall replay"), pause: t("js-app-player-pause-waterfall", "Pause the waterfall replay"), position: t("js-app-player-position-waterfall", "Position in the waterfall replay") };
  if (name === "orbit replay") return { play: t("js-app-player-play-orbit", "Play the orbit replay"), pause: t("js-app-player-pause-orbit", "Pause the orbit replay"), position: t("js-app-player-position-orbit", "Position in the orbit replay") };
  if (name === "mission replay") return { play: t("js-app-player-play-mission", "Play the mission replay"), pause: t("js-app-player-pause-mission", "Pause the mission replay"), position: t("js-app-player-position-mission", "Position in the mission replay") };
  return { play: t("js-app-player-play", "Play the replay"), pause: t("js-app-player-pause", "Pause the replay"), position: t("js-app-player-position", "Position in the replay") };
}
// Play / scrub control over n frames. onFrame(k) draws frame k; label(k) names it.
function makePlayer({ n, label, onFrame, rate = 6, name = "replay" }) {
  let k = n - 1, timer = 0;
  const words = playerWords(name);
  const btn = h("button", { class: "play-btn", type: "button", "aria-label": words.play, "aria-pressed": "false" }, icon("i-play"));
  const range = h("input", { type: "range", min: "0", max: String(Math.max(0, n - 1)), step: "1", "aria-label": words.position });
  const out = h("output", { class: "play-out" });
  const paint = () => { range.value = String(k); range.style.setProperty("--p", `${n > 1 ? (k / (n - 1)) * 100 : 100}%`); out.textContent = label(k); onFrame(k); };
  const stop = () => { if (!timer) return; clearInterval(timer); timer = 0; btn.replaceChildren(icon("i-play")); btn.setAttribute("aria-pressed", "false"); btn.setAttribute("aria-label", words.play); };
  const play = () => {
    if (timer || n < 2) return;
    if (k >= n - 1) k = 0;
    btn.replaceChildren(icon("i-pause")); btn.setAttribute("aria-pressed", "true"); btn.setAttribute("aria-label", words.pause);
    paint();
    timer = setInterval(() => { if (k >= n - 1) { stop(); return; } k += 1; paint(); }, 1000 / rate);
  };
  btn.addEventListener("click", () => (timer ? stop() : play()));
  range.addEventListener("input", () => { stop(); k = parseInt(range.value, 10) || 0; paint(); });
  const api = { el: h("div", { class: "player" }, btn, range, out), stop, play, set: (i) => { k = Math.max(0, Math.min(n - 1, i)); paint(); }, get k() { return k; } };
  players.push(api);
  return api;
}
// A link with play=1 starts the first replay once (never under reduced motion).
function autoPlay(player) {
  if (!S.link.play || reducedMotion()) return;
  S.link.play = false;
  player.play();
}

// A value read from the result at `path`, written with its unit.
function bound(tag, r, path, opts = {}) {
  const v = K.resolve(r, path);
  const n = h(tag, { class: opts.class || null, "data-path": path, "data-raw": v === undefined ? "" : JSON.stringify(v) });
  let text = K.leafText(r, path, v, opts.unit);
  if (opts.hash && typeof v === "string" && v.length > 16) { text = `${v.slice(0, 12)}…`; n.title = v; }
  n.textContent = text;
  const u = K.unitOf(r, path);
  if (u && u.note && !n.title) n.title = u.note;
  return n;
}
const slug = (t) => String(t).toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 40) || "chart";
const svgEl = (tag, attrs) => { const n = document.createElementNS("http://www.w3.org/2000/svg", tag); for (const [k, v] of Object.entries(attrs)) n.setAttribute(k, v); return n; };

function panelNode(p, r) {
  if (p.type === "line") {
    const chart = V.lineChartSvg(p.model, p.opts || {});
    if (!chart.svg) return null;
    const box = h("div", { class: "chart-box" }), tools = h("div", { class: "chart-tools" });
    setSvg(box, chart.svg);
    bindHover(box, chart.hover);
    mountTools(tools, () => exportSvg(chart.svg, p.title), slug(p.title));
    return h("div", { class: "card scope span-2", "data-w": "6", "data-panel": "line", "data-src": (p.src || []).map((x) => x.path).join(" ") }, h("div", { class: "card-head" }, h("h3", { text: p.title })), box, p.note ? h("p", { class: "card-note on-space", text: p.note }) : null, tools);
  }
  if (p.type === "hist") {
    const hs = G.histogramSvg(K.resolve(r, p.path), { unit: p.unit, title: p.title, xLabel: p.unit && p.unit !== "1" ? p.unit : t("js-app-axis-value", "value"), marks: (p.marks || []).map((m) => ({ label: m.label, value: K.resolve(r, m.path) })) });
    if (!hs.svg) return null;
    const box = h("div", { class: "chart-box" }), tools = h("div", { class: "chart-tools" });
    setSvg(box, hs.svg);
    mountTools(tools, () => exportSvg(hs.svg, p.title), slug(p.title));
    const marks = h("p", { class: "card-note on-space" }, t("js-app-hist-runs", "{ $n } runs.", { n: (K.resolve(r, p.path) || []).length }) + " ", ...(p.marks || []).flatMap((m) => [`${m.label} `, bound("b", r, m.path, { unit: p.unit }), "  "]));
    return h("div", { class: "card scope span-2", "data-w": "6", "data-panel": "hist", "data-src": p.path }, h("div", { class: "card-head" }, h("h3", { text: p.title })), box, marks, tools);
  }
  const tw = p.type === "table" ? (p.wide || (p.cols || []).length > 4 ? 12 : 6) : p.type === "kv" || p.type === "list" ? (p.wide ? 8 : 4) : p.type === "chips" ? 6 : 12;
  const card = h("div", { class: `card${p.wide ? " span-2" : ""}`, "data-w": String(tw), "data-panel": p.type }, h("div", { class: "card-head" }, h("h3", { text: p.title }), p.note ? h("p", { class: "card-note", text: p.note }) : null));
  if (p.type === "table") {
    const pathOf = (c, row, i) => (c.path ? c.path(row, i) : `${row.path}.${c.key}`);
    // A column with no value in any row is left out.
    const cols = p.cols.filter((c) => p.rows.some((row, i) => { const v = K.resolve(r, pathOf(c, row, i)); return v !== undefined && v !== null; }));
    if (!cols.length) return null;
    const t = h("table", { class: "tbl" }, h("thead", {}, h("tr", {}, p.rowHead ? h("th", { text: p.rowHead }) : null, cols.map((c) => h("th", { text: c.label })))));
    const tb = h("tbody");
    p.rows.forEach((row, i) => {
      const tr = h("tr", {}, p.rowHead ? h("td", { text: row.label }) : null);
      for (const c of cols) {
        const path = pathOf(c, row, i), v = K.resolve(r, path);
        const unit = c.unit !== undefined ? c.unit : c.unitFrom ? K.resolve(r, `${row.path}.${c.unitFrom}`) : undefined;
        const td = bound("td", r, path, { unit, hash: c.hash, class: typeof v === "number" ? "num" : c.note ? "note" : c.hash ? "mono" : null });
        if (c.link && typeof v === "string" && /^https?:\/\//.test(v)) td.replaceChildren(h("a", { href: v, target: "_blank", rel: "noopener", class: "ext", text: v.replace(/^https?:\/\/(www\.)?/, "") }));
        tr.append(td);
      }
      tb.append(tr);
    });
    t.append(tb);
    card.append(h("div", { class: "table-scroll" }, t));
  } else if (p.type === "kv") {
    const dl = h("dl", { class: "kv" });
    for (const it of p.items) { const u = K.unitOf(r, it.path); dl.append(h("dt", { text: it.label, title: (u && u.note) || null }), bound("dd", r, it.path, { hash: p.hash })); }
    card.append(dl);
    // A long text value needs a wider tile.
    if ([...dl.querySelectorAll("dd")].some((d) => d.textContent.length > 60)) card.dataset.w = "12";
  } else if (p.type === "list") {
    card.append(h("ul", { class: "plain" }, p.items.map((it) => bound("li", r, it.path))));
  } else if (p.type === "note") {
    card.append(bound("p", r, p.path, { class: "label-text" }));
  } else if (p.type === "mono") {
    card.append(bound("pre", r, p.path, { class: `mono${p.wrap ? " wrap" : ""}` }));
  } else if (p.type === "chips") {
    card.append(h("div", { class: "mask-verdicts" }, p.items.map((it) => h("div", { class: `verdict ${it.pass ? "pass" : "fail"}`, "data-path": it.path, "data-raw": JSON.stringify(K.resolve(r, it.path)) }, h("b", { text: it.pass ? "PASS" : "FAIL" }), h("span", { text: it.label })))));
  } else return null;
  return card;
}

function renderCapability() {
  S.capDirty = false;
  stopPlayers();
  const run = S.run, stage = $("cap-stage"), grid = $("cap-panels");
  stage.replaceChildren(); grid.replaceChildren();
  const cap = run ? K.capabilityView(run.result, run.toml) : null;
  if (!cap) return;
  $("v-cap").setAttribute("aria-label", cap.label);
  const r = run.result;
  // The stage's cards sit in one wrapper that names the stage; the wrapper and both hosts are
  // display: contents, so every card is a tile of the dashboard grid.
  const wrap = cap.stage ? h("div", { class: "stage", "data-stage": cap.stage }) : null;
  if (cap.stage === "spectrum") stageSpectrum(wrap, r);
  else if (cap.stage === "solar") stageSolar(wrap, r);
  else if (cap.stage === "coverage") stageCoverage(wrap, r);
  else if (cap.stage === "timeline") stageTimeline(wrap, r);
  else if (cap.stage === "chain") stageChain(wrap, r);
  if (wrap && wrap.children.length) stage.append(wrap);
  stage.hidden = !stage.children.length;
  for (const p of cap.panels) { const n = panelNode(p, r); if (n) grid.append(n); }
  paintPhoneSubtabs();
}

// The replay control that drives every panel of a stage: one scrubber, on its own tile.
function transportCard(playerHost, extra = []) {
  return h("div", { class: "card scope transport", "data-w": "12", "aria-label": t("js-app-transport-label", "Replay: one scrubber drives every panel of this run") },
    h("div", { class: "card-head row" }, h("h3", {}, t("js-app-replay", "Replay"), " ", h("small", { text: t("js-app-transport-hint", "one scrubber drives every panel of this run") }))),
    h("div", { class: "tp-row" }, h("span", { class: "tp-lbl", text: t("js-app-replay", "Replay") }), playerHost), ...extra);
}

// On a phone the capability view shows one of its tiles at a time, picked here.
function paintPhoneSubtabs() {
  const host = $("v-cap");
  let bar = host.querySelector(":scope > .subtabs");
  if (bar) bar.remove();
  const tiles = [...host.querySelectorAll(".card")].filter((c) => !c.classList.contains("transport") && c.querySelector("h3"));
  if (tiles.length < 2) { for (const t of tiles) t.classList.add("is-sub"); return; }
  bar = h("div", { class: "subtabs", role: "group", "aria-label": t("js-app-subtabs-label", "Tiles of this view (phone)") });
  const pick = (i) => { tiles.forEach((t, j) => t.classList.toggle("is-sub", j === i)); for (const [j, b] of [...bar.children].entries()) b.setAttribute("aria-pressed", j === i ? "true" : "false"); };
  tiles.forEach((t, i) => { const title = (t.querySelector("h3").firstChild || {}).textContent || t.querySelector("h3").textContent; bar.append(h("button", { type: "button", text: String(title).trim().slice(0, 34), onclick: () => pick(i) })); });
  host.prepend(bar);
  pick(0);
}

// Spectrum: the waterfall with a replay, the receiver's bands at the replay time, and the
// spectrum along the row on show.
function stageSpectrum(host, r) {
  const frames = G.waterfallFrames(r);
  if (!frames.length) return;
  let fi = Math.max(0, frames.findIndex((f) => f.id === S.link.frame));
  const box = h("div", { class: "chart-box wf-box" }), side = h("div", { class: "wf-side", "aria-live": "off" });
  const tip = h("div", { class: "hover-tip", hidden: true });
  const tools = h("div", { class: "chart-tools" }), legend = h("div", { class: "legend-heat" }), playerHost = h("div");
  const seg = frames.length > 1 ? h("div", { class: "seg dark wrap", role: "group", "aria-label": t("js-app-spectrum-which-part", "Which part of the spectrum") }, frames.map((f, i) => h("button", { type: "button", "data-frame": f.id, text: f.name, onclick: () => { fi = i; draw(); } }))) : null;
  const sliceBox = h("div", { class: "chart-box" }), sliceTools = h("div", { class: "chart-tools" }), sliceTitle = h("h3", { text: t("js-app-spectrum-row-title", "Spectrum along the row on show") });
  host.append(
    transportCard(playerHost),
    h("div", { class: "card scope", "data-w": "8", "data-stage": "spectrum" },
      h("div", { class: "card-head row" }, h("h3", {}, t("js-app-waterfall", "Waterfall"), " ", h("small", { text: t("js-app-waterfall-hint", "power spectral density: frequency across, time down") })), seg, legend),
      h("div", { class: "wf-grid" }, box, side),
      h("p", { class: "card-note on-space", text: t("js-app-waterfall-note", "Colour is power above the receiver's noise floor. The navigation signals sit under that floor, so what lights up is the jammers. Play the replay or drag it, and the bands on the right show what the receiver still tracks at that moment.") }),
      tools),
    h("div", { class: "card scope", "data-w": "4" }, h("div", { class: "card-head" }, sliceTitle), sliceBox, h("p", { class: "card-note on-space", text: t("js-app-spectrum-row-note", "The spectrum along the waterfall row the replay is on.") }), sliceTools));
  const tl = r.timeline, thr = K.resolve(r, "receiver.tracking_threshold_dbhz");
  const top = Math.max(...(r.bands || []).map((b) => b.nominal_cn0_dbhz).filter(Number.isFinite), Number.isFinite(thr) ? thr : 0, 1);
  let frame, geo, player;
  const paint = (k) => {
    const svg = box.querySelector("svg.chart");
    if (svg && geo) {
      const cur = svg.querySelector(".wf-curtain"), line = svg.querySelector(".wf-cursor");
      const y = geo.mt + (k + 1) * geo.rh;
      cur.setAttribute("y", y.toFixed(2)); cur.setAttribute("height", Math.max(0, geo.mt + geo.ph - y).toFixed(2));
      line.setAttribute("y1", y.toFixed(2)); line.setAttribute("y2", y.toFixed(2));
      line.setAttribute("visibility", k < geo.nT - 1 ? "visible" : "hidden");
    }
    side.replaceChildren();
    if (tl && Array.isArray(tl.t_s) && Array.isArray(tl.bands)) {
      const kt = G.nearestIndex(tl.t_s, frame.t[k]);
      side.append(h("p", { class: "wf-k" }, t("js-app-receiver-at", "Receiver at t ="), " ", bound("b", r, `timeline.t_s[${kt}]`, { unit: "s" })));
      const list = h("ul", { class: "wf-bands" });
      tl.bands.forEach((b, i) => {
        const cn0 = b.cn0_effective_dbhz[kt], lost = Number.isFinite(thr) && Number.isFinite(cn0) ? cn0 < thr : b.status[kt] !== "LOCKED";
        list.append(h("li", { class: lost ? "lost" : "" },
          bound("span", r, `timeline.bands[${i}].name`, { class: "nm" }),
          h("span", { class: "cbar", style: `--w:${Math.max(0, Math.min(100, (cn0 / top) * 100)).toFixed(1)}%;--f:${Number.isFinite(thr) ? ((thr / top) * 100).toFixed(1) : 0}%` }, h("i"), Number.isFinite(thr) ? h("u") : null),
          bound("span", r, `timeline.bands[${i}].cn0_effective_dbhz[${kt}]`, { class: "v", unit: "dB-Hz" }),
          bound("span", r, `timeline.bands[${i}].status[${kt}]`, { class: "st" })));
      });
      side.append(list);
      if (Number.isFinite(thr)) side.append(h("p", { class: "wf-k" }, t("js-app-tracking-threshold", "Tracking threshold"), " ", bound("b", r, "receiver.tracking_threshold_dbhz")));
    }
    const sm = G.spectrumSlice(frame, k);
    const chart = V.lineChartSvg(sm, { h: 300, w: 470 });
    sliceTitle.textContent = sm.title;
    sliceBox.dataset.src = `${frame.path}.psd_dbw_per_hz[${k}]`;
    setSvg(sliceBox, chart.svg);
    bindHover(sliceBox, chart.hover);
    mountTools(sliceTools, () => exportSvg(chart.svg, sm.title), "spectrum-row");
  };
  const draw = () => {
    frame = frames[fi];
    if (seg) for (const b of seg.children) b.setAttribute("aria-pressed", b.dataset.frame === frame.id ? "true" : "false");
    const wf = G.waterfallSvg(frame, { bands: r.bands || [] });
    geo = wf.geo;
    setSvg(box, wf.svg);
    box.append(tip);
    box.dataset.src = `${frame.path}.psd_dbw_per_hz`;
    legend.replaceChildren(h("span", { text: t("js-app-noise-floor", "noise floor { $value }", { value: V.fmt(frame.floor, 4) }) }), h("i", { style: `background:linear-gradient(90deg,${Array.from({ length: 9 }, (_, i) => G.wfColor(Math.pow(i / 8, G.WF_GAMMA))).join(",")})` }), h("span", { text: `${V.fmt(frame.peak, 4)} dBW/Hz` }));
    mountTools(tools, () => exportSvg(wf.svg, t("js-app-waterfall-title", "Waterfall, { $name }", { name: frame.name })), "waterfall");
    if (player) { player.stop(); players.splice(players.indexOf(player), 1); }
    player = makePlayer({ n: frame.t.length, name: "waterfall replay", label: (k) => `t = ${V.fmt(frame.t[k])} s`, onFrame: paint });
    playerHost.replaceChildren(player.el);
    player.set(frame.t.length - 1);
    autoPlay(player);
  };
  // The cell under the pointer: its frequency, time and power, read from the result.
  box.addEventListener("pointermove", (e) => {
    const svg = box.querySelector("svg.chart");
    if (!svg || !geo) return;
    const rect = svg.getBoundingClientRect(), br = box.getBoundingClientRect(), sc = rect.width / geo.W;
    const c = Math.floor(((e.clientX - rect.left) / sc - geo.ml) / geo.cw), row = Math.floor(((e.clientY - rect.top) / sc - geo.mt) / geo.rh);
    if (c < 0 || c >= geo.nF || row < 0 || row >= geo.nT) { tip.hidden = true; return; }
    tip.textContent = `f = ${V.fmt(frame.freq[c] / 1e6, 6)} MHz · t = ${V.fmt(frame.t[row])} s · ${V.fmt(frame.psd[row][c], 4)} dBW/Hz`;
    tip.hidden = false;
    const x = e.clientX - br.left + box.scrollLeft;
    tip.style.left = `${x + 14 + tip.offsetWidth > br.width + box.scrollLeft ? x - tip.offsetWidth - 12 : x + 12}px`;
    tip.style.top = `${Math.max(6, e.clientY - br.top + 12)}px`;
  });
  box.addEventListener("pointerleave", () => { tip.hidden = true; });
  draw();
}

// Solar system: a plan view of the bodies and their orbit tracks, as the engine placed them.
function stageSolar(host, r) {
  const views = G.orreryViews(r);
  if (!(r.bodies || []).length) return;
  let view = views.some((v) => v.id === S.link.view) ? S.link.view : views[0].id;
  const box = h("div", { class: "chart-box" }), tools = h("div", { class: "chart-tools" }), table = h("table", { class: "tbl on-space" });
  const seg = h("div", { class: "seg dark wrap", role: "group", "aria-label": t("js-app-solar-which-bodies", "Which bodies to draw") }, views.map((v) => h("button", { type: "button", "data-view": v.id, title: v.label, text: v.id.startsWith("moons:") ? v.id.slice(6) : v.label, onclick: () => { view = v.id; draw(); } })));
  host.append(h("div", { class: "card scope", "data-w": "8", "data-stage": "solar" },
    h("div", { class: "card-head row" }, h("h3", {}, t("js-app-plan-view", "Plan view"), " ", h("small", {}, t("js-app-plan-view-at", "at"), " ", bound("span", r, "epoch.input"))), seg),
    box, h("div", { class: "table-scroll" }, table),
    h("p", { class: "card-note on-space", text: t("js-app-solar-note", "Each dot is a body at the run's epoch and each curve is the orbit track the engine computed for it. A dashed line is a link the scenario asks for. Pick a planet to see its moons about it.") }),
    tools));
  const draw = () => {
    for (const b of seg.children) b.setAttribute("aria-pressed", b.dataset.view === view ? "true" : "false");
    const o = G.orrerySvg(r, { view });
    setSvg(box, o.svg);
    box.dataset.view = view;
    mountTools(tools, () => exportSvg(o.svg, views.find((v) => v.id === view).label), "solar-system");
    const bodies = o.shown.filter((x) => x.path.startsWith("bodies"));
    table.replaceChildren(h("thead", {}, h("tr", {}, [t("js-app-th-body", "Body"), t("js-app-th-sun-distance", "Distance from the Sun"), t("js-app-th-orbital-period", "Orbital period"), t("js-app-th-light-time", "One-way light time from { $observer }", { observer: r.observer || t("js-app-the-observer", "the observer") })].map((t) => h("th", { text: t })))),
      h("tbody", {}, bodies.map((x) => h("tr", {}, bound("td", r, `${x.path}.name`), bound("td", r, `${x.path}.heliocentric_distance_au`, { class: "num" }), bound("td", r, `${x.path}.orbital_period_d`, { class: "num" }), bound("td", r, `${x.path}.observer_link.one_way_light_time_s`, { class: "num" })))));
  };
  draw();
}

// Constellation design: one gridded field as a map, with the satellites flown over it.
function stageCoverage(host, r) {
  const fields = G.coverageFields(r);
  if (!fields.length) return;
  let field = fields.some((f) => f.key === S.link.field) ? S.link.field : fields[0].key;
  const box = h("div", { class: "chart-box" }), tools = h("div", { class: "chart-tools" }), legend = h("div", { class: "legend-heat" }), playerHost = h("div");
  const sel = h("select", { class: "sel dark", "aria-label": t("js-app-coverage-field-label", "Field to map"), onchange: () => { field = sel.value; draw(player ? player.k : 0); } }, fields.map((f) => h("option", { value: f.key, text: f.label })));
  sel.value = field;
  const body = (r.body && r.body.name) || t("js-app-the-body", "the body");
  const tr = r.tracks && Array.isArray(r.tracks.times_s) && r.tracks.times_s.length ? r.tracks : null;
  const names = G.coverageLegend(r);
  if (tr) host.append(transportCard(playerHost));
  host.append(h("div", { class: "card scope", "data-w": "8", "data-stage": "coverage" },
    h("div", { class: "card-head row" }, h("h3", {}, t("js-app-coverage-map", "Coverage map"), " ", h("small", {}, t("js-app-coverage-over", "over"), " ", bound("span", r, "body.name"))), h("label", { class: "sel-lbl" }, t("js-app-coverage-map-select", "Map"), " ", sel), legend),
    box,
    names.length ? h("div", { class: "cov-legend" }, names.map((n) => h("span", { style: `--c:${n.color}` }, h("i"), n.name))) : null,
    h("p", { class: "card-note on-space" }, t("js-app-coverage-cell-note", "Each cell is one grid point on { $body }, scored over every epoch of the run.", { body }) + " ", tr ? h("span", {}, t("js-app-coverage-dots-pre", "The dots are"), " ", bound("b", r, "tracks.shown"), " ", t("js-app-coverage-dots-of", "of"), " ", bound("b", r, "tracks.total"), " ", t("js-app-coverage-dots-post", "satellites, flown along their ground tracks; play the replay to move them.")) : null),
    tools));
  let player = null;
  const draw = (k) => {
    const c = G.coverageSvg(r, { field, k, land: /^earth$/i.test(body) ? S.land || [] : [] });
    setSvg(box, c.svg);
    box.dataset.src = `grid.${c.field.key}`;
    const ends = c.field.lowerBetter ? [1, .75, .5, .25, 0] : [0, .25, .5, .75, 1];
    legend.replaceChildren(h("span", { text: V.fmt(c.range[0], 4) }), h("i", { style: `background:linear-gradient(90deg,${ends.map(V.heat).join(",")})` }), h("span", { text: `${V.fmt(c.range[1], 4)}${c.field.unit}` }));
    mountTools(tools, () => exportSvg(c.svg, t("js-app-coverage-title", "{ $field } over { $body }", { field: c.field.label, body })), "coverage");
  };
  if (tr) {
    player = makePlayer({ n: tr.times_s.length, name: "orbit replay", rate: 4, label: (k) => `t = ${V.fmtDuration(tr.times_s[k])}`, onFrame: draw });
    playerHost.append(player.el);
    player.set(0);
    autoPlay(player);
  } else draw(0);
}

// Campaign: every channel on the mission time axis, scrubbed by one replay control.
function stageTimeline(host, r) {
  const charts = G.timelineCharts(r), tl = r.timeline;
  if (!charts.length) return;
  const phase = h("span", { class: "tl-phase" }), readout = h("dl", { class: "kv on-space tl-read" }), playerHost = h("div"), eventLine = h("p", { class: "card-note on-space tl-event" });
  const boxes = charts.map((c) => {
    const box = h("div", { class: "chart-box", "data-unit": c.unit, "data-src": c.keys.map((k) => `timeline.channels.${k}.values`).join(" ") });
    const chart = V.lineChartSvg(c.model, c.opts);
    setSvg(box, chart.svg);
    bindHover(box, chart.hover);
    const svg = box.querySelector("svg.chart");
    const cur = svg ? svg.appendChild(svgEl("line", { class: "play-cursor", y1: chart.hover.mt, y2: chart.hover.H - chart.hover.mb, x1: 0, x2: 0 })) : null;
    return { c, box, chart, cur };
  });
  host.append(h("div", { class: "card scope transport", "data-w": "12", "data-stage": "timeline" },
    h("div", { class: "card-head row" }, h("h3", {}, t("js-app-mission-timeline", "Mission timeline"), " ", h("small", {}, bound("span", r, "timeline.duration_s"), " ", t("js-app-on-one-clock", "on one clock"))), h("p", { class: "tl-now" }, t("js-app-phase", "Phase:"), " ", phase)),
    playerHost, readout, eventLine,
    h("p", { class: "card-note on-space", text: t("js-app-timeline-note", "One scrubber drives every chart below. Every phase runs ordinary scenarios; the campaign reads their outputs onto one time grid. Shaded bands are the phases, vertical rules the events. The values above are the campaign's channels at the replay time.") })),
    ...boxes.map((b) => h("div", { class: "card scope", "data-w": boxes.length > 1 ? "6" : "12" }, h("div", { class: "card-head" }, h("h3", { text: b.c.title })), b.box)));
  const paint = (k) => {
    const tt = tl.t_s[k];
    for (const b of boxes) if (b.cur) { const x = b.chart.hover.xOf(tt).toFixed(1); b.cur.setAttribute("x1", x); b.cur.setAttribute("x2", x); }
    const pi = G.phaseAt(r, tt);
    phase.replaceChildren(pi >= 0 ? bound("b", r, `timeline.phases[${pi}].name`) : "—");
    readout.replaceChildren();
    for (const c of charts) for (const key of c.keys) {
      readout.append(h("div", {}, h("dt", { title: tl.channels[key].label, text: V.humanKey(key).replace(/\s*\([^)]*\)$/, "") }), bound("dd", r, `timeline.channels.${key}.values[${k}]`, { unit: tl.channels[key].unit })));
    }
    const past = (tl.events || []).map((e, i) => ({ e, i })).filter((o) => o.e.t_s <= tt).pop();
    eventLine.replaceChildren(...(past ? [t("js-app-latest-event-at", "Latest event, at"), " ", bound("b", r, `timeline.events[${past.i}].t_s`), ": ", bound("span", r, `timeline.events[${past.i}].label`)] : [t("js-app-no-event-yet", "No event yet at this time.")]));
  };
  const player = makePlayer({ n: tl.t_s.length, name: "mission replay", rate: 24, label: (k) => `T+${V.fmtDuration(tl.t_s[k])}`, onFrame: paint });
  playerHost.append(player.el);
  player.set(tl.t_s.length - 1);
  autoPlay(player);
}

// End-to-end chain: the stages in hand-off order with each one's headline figures.
function stageChain(host, r) {
  const m = G.chainModel(r);
  if (!m.length) return;
  const row = h("div", { class: "chain" });
  m.forEach((st, i) => {
    const dl = h("dl", { class: "kv" });
    for (const path of st.items) dl.append(h("dt", { text: K.keyLabel(path) }), bound("dd", r, path));
    row.append(h("div", { class: "chain-stage", "data-kind": st.kind }, h("p", { class: "chain-n", text: t("js-app-chain-stage", "Stage { $n }", { n: i + 1 }) }), h("h4", { text: st.name }), h("code", { text: st.kind }), dl));
    if (i < m.length - 1) row.append(h("div", { class: "chain-arrow", "aria-hidden": "true" }, icon("i-arrow"), h("span", { text: t("js-app-chain-values-handed", { one: "{ $n } value handed on", other: "{ $n } values handed on" }, { n: st.out }) })));
  });
  host.append(h("div", { class: "card", "data-w": "12", "data-stage": "chain" }, h("div", { class: "card-head" }, h("h3", {}, t("js-app-the-chain", "The chain"), " ", h("small", { text: t("js-app-chain-hint", "each stage's output feeds the next") })), h("p", { class: "card-note", text: t("js-app-chain-note", "One system followed through every stage of the engine. The table below lists each number a stage computed and the next stage used.") })), row));
}

// Every chart of the capability view as SVG, for the downloadable report.
function capabilityCharts(run) {
  const r = run.result, cap = K.capabilityView(r, run.toml), out = [];
  if (!cap) return out;
  if (cap.stage === "spectrum") for (const f of G.waterfallFrames(r)) out.push({ title: t("js-app-waterfall-title", "Waterfall, { $name }", { name: f.name }), svg: G.waterfallSvg(f, { bands: r.bands || [] }).svg });
  if (cap.stage === "solar") for (const v of G.orreryViews(r).slice(0, 2)) out.push({ title: v.label, svg: G.orrerySvg(r, { view: v.id }).svg });
  if (cap.stage === "coverage") { const c = G.coverageSvg(r, { land: /^earth$/i.test((r.body && r.body.name) || "") ? S.land || [] : [] }); out.push({ title: t("js-app-coverage-title", "{ $field } over { $body }", { field: c.field.label, body: (r.body && r.body.name) || t("js-app-the-body", "the body") }), svg: c.svg }); }
  if (cap.stage === "timeline") for (const c of G.timelineCharts(r)) out.push({ title: t("js-app-timeline-chart-title", "Mission timeline: { $title }", { title: c.title }), svg: V.lineChartSvg(c.model, c.opts).svg });
  for (const p of cap.panels) {
    if (p.type === "line") { const c = V.lineChartSvg(p.model, p.opts || {}); if (c.svg) out.push({ title: p.title, svg: c.svg }); }
    if (p.type === "hist") { const c = G.histogramSvg(K.resolve(r, p.path), { unit: p.unit, title: p.title, marks: (p.marks || []).map((m) => ({ label: m.label, value: K.resolve(r, m.path) })) }); if (c.svg) out.push({ title: p.title, svg: c.svg }); }
  }
  return out;
}

// ------------------------------------------------------------------ the native engine's recordings
// The browser build has no writer for the engine's run report, its animation or its
// interoperability exports, so for each bundled scenario the Studio carries the files the
// native command-line engine wrote (tools_native.mjs), and labels them as recorded.
function nativeEntry(file) {
  if (!file) return null;
  const idx = S.nat.get(dirOf(file));
  const e = idx && idx.runs[file];
  return e && !e.error ? e : null;
}
const natCache = new Map();
async function loadNative(file) {
  if (natCache.has(file)) return natCache.get(file);
  const e = nativeEntry(file);
  if (!e) return null;
  const pack = await PACKS.load(`${dirOf(file)}native/`, e);
  if (!pack) return null;
  natCache.set(file, pack);
  return pack;
}
// "Recorded with the native engine … by running <command>", plus a warning when the text was edited.
function recordedLine(el, pack, command, run) {
  el.hidden = false;
  el.replaceChildren(h("span", { class: "badge recorded", text: t("js-app-badge-recorded", "Recorded") }), " ",
    t("js-app-written-by-native", "Written by the native command-line engine v{ $version } ({ $platform }) with", { version: pack.engine_version, platform: pack.platform }), " ", h("code", { text: command }), ". ", t("js-app-shown-unchanged", "Shown unchanged."),
    ...(run.toml !== pack.toml ? [h("b", { class: "rec-warn", text: " " + t("js-app-recording-edited-warning", "You have edited the scenario: this recording is of the bundled file, not of your edit. Run the command on your own file to get yours.") })] : []));
}
const textBlob = (text, type) => new Blob([text], { type });
const prettyBytes = (n) => (n >= 1e6 ? `${(n / 1e6).toFixed(1)} MB` : n >= 1e3 ? `${(n / 1e3).toFixed(1)} kB` : t("js-app-bytes", { one: "{ $n } bytes", other: "{ $n } bytes" }, { n }));
const toolButton = (text, title, onclick) => h("button", { type: "button", title, onclick, text });

async function renderAnimation() {
  const run = S.run, box = $("anim-box"), tools = $("anim-tools"), prov = $("anim-prov");
  $("anim-note").textContent = t("js-app-anim-note", "The engine writes an animation of any run that has a time axis: a self-playing SVG and a single-file HTML player with its own play and scrub controls. The browser build does not carry that writer, so this is the file the native command-line engine wrote for the bundled scenario.");
  if (box.dataset.for === String(run.id)) return;
  box.dataset.for = String(run.id);
  box.replaceChildren(h("p", { class: "card-note", text: t("js-app-anim-loading", "Loading the recorded animation…") }));
  tools.replaceChildren(); prov.hidden = true;
  let pack = null, err = "";
  try { pack = await loadNative(run.file); } catch (e) { err = errorMessage(e); }
  if (S.run !== run) return;
  const a = pack && pack.animation;
  if (!a || !(a.html || a.svg)) { box.replaceChildren(h("p", { class: "card-note", text: err ? t("js-app-anim-load-failed", "The recorded animation could not be loaded ({ $reason }).", { reason: err }) : t("js-app-anim-none", "There is no recorded animation for this scenario.") })); return; }
  recordedLine(prov, pack, a.command, run);
  const name = run.file.replace(/\.toml$/, "");
  if (a.html) box.replaceChildren(h("iframe", { class: "frame", sandbox: "allow-scripts", title: t("js-app-anim-frame-title", "Animation of this run, written by the engine"), srcdoc: a.html }));
  else box.replaceChildren(h("img", { alt: t("js-app-anim-frame-title", "Animation of this run, written by the engine"), src: URL.createObjectURL(svgBlob(a.svg)) }));
  tools.replaceChildren(h("span", { class: "lbl", text: t("js-app-download-label", "Download") }));
  if (a.html) tools.append(toolButton(t("js-app-anim-html-player", "HTML player"), t("js-app-anim-html-player-title", "The single-file player, as the engine wrote it"), () => triggerDownload(textBlob(a.html, "text/html"), `${name}.animation.html`)));
  if (a.svg) tools.append(toolButton(t("js-app-anim-svg", "Animated SVG"), t("js-app-anim-svg-title", "The self-playing SVG, as the engine wrote it"), () => triggerDownload(svgBlob(a.svg), `${name}.animation.svg`)));
}

async function renderEngineReport() {
  const run = S.run, box = $("report-box"), tools = $("report-tools"), prov = $("report-prov");
  $("report-note").textContent = t("js-app-report-note", "Every command-line run writes a report: summary, inputs, results, the chart, what is validated and what is modelled, and a reproducibility record. The browser build does not carry that writer, so this is the report the native command-line engine wrote for the bundled scenario. The Studio's own report of the run on screen is under Exports.");
  if (box.dataset.for === String(run.id)) return;
  box.dataset.for = String(run.id);
  box.replaceChildren(h("p", { class: "card-note", text: t("js-app-report-loading", "Loading the recorded report…") }));
  tools.replaceChildren(); prov.hidden = true;
  let pack = null, err = "";
  try { pack = await loadNative(run.file); } catch (e) { err = errorMessage(e); }
  if (S.run !== run) return;
  if (!pack || !pack.report_html) { box.replaceChildren(h("p", { class: "card-note", text: err ? t("js-app-report-load-failed", "The recorded report could not be loaded ({ $reason }).", { reason: err }) : t("js-app-report-none", "There is no recorded report for this scenario.") })); return; }
  recordedLine(prov, pack, pack.command, run);
  const name = run.file.replace(/\.toml$/, "");
  box.replaceChildren(h("iframe", { class: "frame", sandbox: "", title: t("js-app-report-frame-title", "Run report written by the engine"), srcdoc: withoutScripts(pack.report_html) }));
  tools.replaceChildren(h("span", { class: "lbl", text: t("js-app-download-label", "Download") }),
    toolButton(t("js-app-report-html", "Report (HTML)"), t("js-app-report-html-title", "The report file, as the engine wrote it"), () => triggerDownload(textBlob(pack.report_html, "text/html"), `${name}.report.html`)),
    toolButton(t("js-app-report-open-tab", "Open in a new tab"), t("js-app-report-open-tab-title", "Open the report on its own"), () => window.open(URL.createObjectURL(textBlob(pack.report_html, "text/html")), "_blank", "noopener")));
}

// The report shows in a frame that may not run scripts. Its scripts are taken out first, so
// the browser does not log a blocked script for each one; the page looks the same, because
// they could never run there. The download keeps the file exactly as the engine wrote it.
function withoutScripts(html) {
  const doc = new DOMParser().parseFromString(html, "text/html"); // parsing runs no script
  for (const el of doc.querySelectorAll("script")) el.remove();
  // Inline handlers (onclick=…) are scripts too: a sandboxed frame would log each as blocked.
  for (const el of doc.querySelectorAll("*")) for (const a of [...el.attributes]) if (/^on/i.test(a.name) || /^\s*javascript:/i.test(a.value)) el.removeAttribute(a.name);
  return "<!doctype html>\n" + doc.documentElement.outerHTML;
}

const FORMAT_NAME = { czml: "CZML", kml: "KML", geojson: "GeoJSON", stk: "STK ephemeris", sigmf: "SigMF" };
async function renderInterop(run) {
  const card = $("interop-card"), geo = $("geo-card"), prov = $("interop-prov"), tbl = $("interop-table");
  card.hidden = true; geo.hidden = true;
  let pack = null;
  try { pack = await loadNative(run.file); } catch { /* no recording: the card stays hidden */ }
  if (S.run !== run || !pack || !Array.isArray(pack.export_plan)) return;
  card.hidden = false;
  $("interop-note").textContent = t("js-app-interop-note", "The engine writes a run's geometry and signal samples in formats other tools open: CZML for Cesium, KML (Keyhole Markup Language) for Google Earth, GeoJSON for maps, STK ephemeris (.e) files, and SigMF (Signal Metadata Format) recordings. The browser build does not carry these writers, so the files below are the ones the native command-line engine wrote for the bundled scenario.");
  recordedLine(prov, pack, pack.exports.command, run);
  tbl.replaceChildren(h("thead", {}, h("tr", {}, [t("js-app-th-format", "Format"), t("js-app-th-file", "File"), t("js-app-th-size", "Size"), ""].map((x) => h("th", { text: x })))));
  const tb = h("tbody");
  for (const p of pack.export_plan) {
    const files = pack.exports.files.filter((f) => f.format === p.format);
    const label = FORMAT_NAME[p.format] || p.format;
    if (!p.applies || !files.length) { tb.append(h("tr", { "data-format": p.format }, h("td", { text: label }), h("td", { class: "note", colspan: "3", text: p.applies ? t("js-app-interop-no-file", "The engine wrote no file of this format for this run.") : t("js-app-interop-not-apply", "Does not apply to this scenario: { $reason }.", { reason: p.reason }) }))); continue; }
    for (const f of files) {
      const stored = "text" in f || "base64" in f;
      const dl = () => triggerDownload("text" in f ? textBlob(f.text, "text/plain") : new Blob([Uint8Array.from(atob(f.base64), (c) => c.charCodeAt(0))], { type: "application/octet-stream" }), f.name);
      tb.append(h("tr", { "data-format": p.format }, h("td", { text: label }), h("td", {}, h("code", { text: f.name })), h("td", { class: "num", "data-bytes": String(f.bytes), text: prettyBytes(f.bytes) }),
        h("td", {}, stored ? h("button", { class: "btn-mini", type: "button", onclick: dl }, icon("i-down"), t("js-app-download-label", "Download")) : h("span", { class: "note", text: t("js-app-interop-not-bundled", "Not bundled here (size): the command above writes it.") }))));
    }
  }
  tbl.append(tb);
  const gj = pack.exports.files.find((f) => f.format === "geojson" && f.text);
  const map = gj ? G.geojsonSvg(gj.text, { land: S.land || [] }) : null;
  if (map) {
    geo.hidden = false;
    $("geo-sub").textContent = t("js-app-geo-sub", "{ $name } · { $features } of { $total } features drawn · recorded with the native engine", { name: gj.name, features: map.features, total: map.total });
    setSvg($("geo-chart"), map.svg);
    mountTools("geo-tools", () => exportSvg(map.svg, t("js-app-geojson-title", "GeoJSON export: { $name }", { name: gj.name })), "geojson");
  }
}

// ------------------------------------------------------------------ JSON view
const JSON_TOKEN = /("(?:\\.|[^"\\])*")(\s*:)?|\b(true|false|null)\b|(-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/g;
function jsonNodes(obj) {
  const text = JSON.stringify(obj, null, 2);
  if (text.length > 400000) return [document.createTextNode(text)];
  const out = [];
  let last = 0;
  for (const m of text.matchAll(JSON_TOKEN)) {
    if (m.index > last) out.push(document.createTextNode(text.slice(last, m.index)));
    if (m[1]) { out.push(h("span", { class: m[2] ? "j-k" : "j-s", text: m[1] })); if (m[2]) out.push(document.createTextNode(m[2])); }
    else if (m[3]) out.push(h("span", { class: "j-b", text: m[3] }));
    else out.push(h("span", { class: "j-n", text: m[4] }));
    last = m.index + m[0].length;
  }
  out.push(document.createTextNode(text.slice(last)));
  return out;
}

// ------------------------------------------------------------------ editor
const TOML_TOKEN = /(#.*$)|("(?:\\.|[^"\\])*")|\b(true|false)\b|(-?\d[\d_]*(?:\.\d+)?(?:[eE][+-]?\d+)?)/g;
function highlightToml(text) {
  const frag = document.createDocumentFragment();
  for (const line of text.split("\n")) {
    const m = line.match(/^(\s*)(\[\[?[^\]]*\]\]?)(.*)$/);
    if (m) { frag.append(m[1], h("span", { class: "hl-h", text: m[2] })); pushRest(frag, m[3]); }
    else {
      const kv = line.match(/^(\s*)([A-Za-z0-9_-]+)(\s*=)(.*)$/);
      if (kv) { frag.append(kv[1], h("span", { class: "hl-k", text: kv[2] }), kv[3]); pushRest(frag, kv[4]); }
      else pushRest(frag, line);
    }
    frag.append("\n");
  }
  return frag;
}
function pushRest(frag, s) {
  let last = 0;
  for (const m of s.matchAll(TOML_TOKEN)) {
    if (m.index > last) frag.append(s.slice(last, m.index));
    frag.append(h("span", { class: m[1] ? "hl-c" : m[2] ? "hl-s" : m[3] ? "hl-b" : "hl-n", text: m[0] }));
    last = m.index + m[0].length;
    if (m[1]) break;
  }
  if (last < s.length) frag.append(s.slice(last));
}
function refreshEditor() {
  $("code-hl").replaceChildren(highlightToml(tomlEl.value));
  syncScroll();
  const edited = tomlEl.value !== S.baseToml;
  $("src-reset").disabled = !edited;
  updateSteps();
  if (S.mode === "recorded") showNotice(edited ? recordedEditNotice() : recordedIntro());
}
function syncScroll() { const hl = $("code-hl"); hl.scrollTop = tomlEl.scrollTop; hl.scrollLeft = tomlEl.scrollLeft; }
// ------------------------------------------------------------------ settings
// At most five inputs show by default, ranked by lib/inputs.mjs; the rest wait under Advanced
// settings. A change is written into the scenario text at once and runs when the reader presses
// Run again (one primary action), so a change and its effect are never confused.
const kindOf = (toml) => (String(toml).match(/^\s*kind\s*=\s*"([^"]+)"/m) || [])[1];
function curatedInputs(toml) {
  const kind = kindOf(toml);
  if (kind && K.hasCapability(kind)) return K.guidedFor(kind, numericFields(toml)).map((k) => ({ id: k.id, label: k.label, hint: k.hint, cap: k }));
  const out = [];
  for (const k of GUIDED_KNOBS) {
    const raw = readKnob(toml, k);
    const id = `${k.section || ""}::${k.key}`;
    if (raw !== null && Number.isFinite(k.parse(raw)) && !out.some((x) => x.id === id)) out.push({ id, label: k.label, hint: k.hint, knob: k });
  }
  return out;
}
// The budget of visible settings: five, less any input the default view of the result already
// shows (a replay scrubber, a budget slider), so the screen never shows more than five inputs.
function fitInputBudget(run) {
  if (S.budgetFile === run.file) return;
  S.budgetFile = run.file;
  const inView = [...$("views").querySelectorAll("input:not([type=search]),select,textarea")].filter((el) => el.getClientRects().length && !el.closest("[hidden]")).length;
  const budget = Math.max(0, VISIBLE_INPUTS - inView);
  if (budget !== S.inputBudget) { S.inputBudget = budget; buildParams(); }
}
function sliderNode(id, label, term, hint, min, max, step, value, raw, onInput) {
  const input = h("input", { type: "range", id, min: String(min), max: String(max), step: String(step) });
  input.value = String(Math.min(max, Math.max(min, value)));
  const out = h("output", { for: id, id: `${id}-out`, text: raw });
  const paint = () => input.style.setProperty("--p", `${((parseFloat(input.value) - min) / (max - min || 1)) * 100}%`);
  paint();
  input.addEventListener("input", () => { out.textContent = onInput(input.value); paint(); });
  return h("div", { class: "knob fld" }, h("label", { for: id }, h("span", { class: "fl-t" }, label, term ? h("span", { class: "term", text: ` (${term})` }) : null), out), input, hint ? h("p", { class: "knob-hint fl-help", text: hint }) : null);
}
function inputNode(item) {
  const { text, term } = inputLabel(item);
  const c = item.curated;
  let node;
  if (c && c.knob) {
    const k = c.knob, raw = readKnob(tomlEl.value, k);
    node = sliderNode(`k-${k.section || "top"}-${k.key}`, text, term, c.hint || item.hint, k.min, k.max, k.step, k.parse(raw), raw, (v) => {
      const val = k.parse(v);
      tomlEl.value = k.section ? patchSectionScalar(tomlEl.value, k.section, k.key, val) : patchScalar(tomlEl.value, k.key, val);
      changed();
      return String(val);
    });
  } else if (c && c.cap) {
    const k = c.cap;
    node = sliderNode(`k-${k.id.replace(/[^a-z0-9]+/gi, "-")}`, text, term, c.hint || item.hint, k.min, k.max, k.step, k.field.value, k.field.raw, (v) => {
      const cur = numericFields(tomlEl.value).find((x) => x.id === k.id);
      if (!cur) return v;
      tomlEl.value = patchField(tomlEl.value, cur, Number(parseFloat(v).toPrecision(12)));
      changed();
      const now = numericFields(tomlEl.value).find((x) => x.id === k.id);
      return now ? now.raw : v;
    });
  } else if (item.field) {
    node = h("div", { class: "knob fld fld-step" }, h("label", {}, h("span", { class: "fl-t" }, text, term ? h("span", { class: "term", text: ` (${term})` }) : null), stepperNode(item.field)), item.hint ? h("p", { class: "knob-hint fl-help", text: item.hint }) : null);
  } else return null;
  node.dataset.fieldId = item.id;
  node.dataset.key = item.term || "";
  node.dataset.label = `${text} ${item.term || ""}`;
  return node;
}
// A number with − and + steps (× and ÷ on a log scale), written straight into the scenario.
function stepperNode(f) {
  const input = h("input", { type: "text", inputmode: "decimal", value: f.raw, "aria-label": `${fieldName(f)} (${f.section ? f.section + "." : ""}${f.key})` });
  const current = () => numericFields(tomlEl.value).find((x) => x.id === f.id);
  const commit = (v) => {
    const cur = current();
    if (!Number.isFinite(v) || !cur) { input.value = cur ? cur.raw : f.raw; return; }
    tomlEl.value = patchField(tomlEl.value, cur, v);
    const now = current();
    input.value = now ? now.raw : String(v);
    changed();
  };
  const step = (dir) => { const cur = current() || f; commit(stepValue(cur, dir)); };
  input.addEventListener("change", () => commit(parseFloat(input.value)));
  input.addEventListener("keydown", (e) => { if (e.key === "ArrowUp" || e.key === "ArrowDown") { e.preventDefault(); step(e.key === "ArrowUp" ? 1 : -1); } });
  return h("span", { class: "stepper" },
    h("button", { type: "button", "aria-label": t("js-app-stepper-decrease", "Decrease { $key }", { key: f.key }), text: isLogScale(f) ? "÷" : "−", onclick: () => step(-1) }),
    input,
    h("button", { type: "button", "aria-label": t("js-app-stepper-increase", "Increase { $key }", { key: f.key }), text: isLogScale(f) ? "×" : "+", onclick: () => step(1) }));
}
// After any change of the scenario text: the editor, and the Run button says it is not run yet.
function changed() { refreshEditor(); updateSteps(); }

function buildParams() {
  const toml = tomlEl.value;
  const headline = ((S.fieldImportance || {})[kindOfToml(toml)] || {}).headline || [];
  const ranked = rankInputs(numericFields(toml), curatedInputs(toml), headline);
  const { visible, advanced } = splitInputs(ranked, S.inputBudget);
  S.visibleIds = new Set(visible.map((x) => x.id));
  const kh = $("knobs");
  kh.replaceChildren(...visible.map(inputNode).filter(Boolean));
  if (!visible.length) kh.append(h("p", { class: "hint", text: ranked.length ? "The view above already has its controls; every setting of the scenario is under Advanced settings." : "This scenario has no single number to change. The whole file is under “For researchers”." }));
  $("field-count").textContent = advanced.length ? t("js-app-fields-more", "{ $n } more", { n: advanced.length }) : t("js-app-fields-none", "none");
  $("params-hint").textContent = visible.length ? t("js-app-params-hint", "Change a value, then run again. The answer and the chart update in place.") : "";
  buildFields();
}
function buildFields() {
  const fields = numericFields(tomlEl.value).filter((f) => !(S.visibleIds && S.visibleIds.has(f.id)));
  const host = $("fields");
  host.replaceChildren();
  let sec = null;
  for (const f of fields) {
    if (f.section !== sec) { sec = f.section; host.append(h("p", { class: "fsec", text: sec ? `[${sec}]` : t("js-app-fields-top-of-file", "top of the file") })); }
    host.append(h("div", { class: "field", "data-field-id": f.id, "data-key": f.key, "data-label": `${f.section ? f.section + "." : ""}${f.key} ${f.comment || ""}` }, fieldLabelNode(f), stepperNode(f)));
  }
  if (!fields.length) host.append(h("p", { class: "hint", text: t("js-app-fields-none-hint", "No other single numbers to change here. Edit the file under “For researchers”.") }));
  applyFieldFind();
}
let paramsTimer = 0;
function buildParamsSoon() { clearTimeout(paramsTimer); paramsTimer = setTimeout(buildParams, 250); }

// ------------------------------------------------------------------ scenario loading
// All bundled scenario files in one JSON (scenarios/index.json), so a host serves one file
// instead of one per scenario; the individual .toml files stay the fallback.
let bundlePromise = null;
function scenarioBundle() {
  if (!bundlePromise) bundlePromise = fetch("scenarios/index.json").then((r) => (r.ok ? r.json() : null)).catch(() => null);
  return bundlePromise;
}
async function loadScenario(file, { run = true } = {}) {
  const entry = entryFor(file);
  if (!entry) return;
  if (S.file !== file) { S.inputBudget = VISIBLE_INPUTS; S.budgetFile = null; }
  S.file = file;
  S.shared = false;
  let text = null;
  // The recorded run carries the scenario text it was run from (selfcheck.mjs proves it equal to
  // the bundled file), so a task screen opens without waiting for the whole scenario bundle.
  const recFirst = S.recCache.get(file) || (S.preferRecorded ? await loadRecorded(file).catch(() => null) : null);
  if (recFirst && typeof recFirst.toml === "string") text = recFirst.toml;
  const bundle = text === null ? await scenarioBundle() : null;
  if (bundle && typeof bundle[file] === "string") text = bundle[file];
  if (text === null) try { const res = await fetch(scenarioPath(file), { cache: "no-store" }); if (res.ok) text = await res.text(); } catch { /* offline host */ }
  if (text === null) { const rec = await loadRecorded(file); if (rec) text = rec.toml; }
  if (S.file !== file) return; // the reader moved on while this loaded
  if (text === null) { showError(t("js-app-load-failed", "Could not load { $file }.", { file })); return; }
  S.baseToml = text;
  tomlEl.value = text;
  paintScenarioHeader(entry);
  refreshEditor();
  buildParams();
  seedSweepRange(true);
  clearError();
  if (NOT_IN_BROWSER[file] && !RECORDED_NATIVELY.includes(file)) showNotice(NOT_IN_BROWSER[file]);
  else if (S.mode !== "recorded") showNotice("");
  if (run) runScenario();
}
// The task screen's heading: area, the question, one line on what is simulated.
function paintScenarioHeader(entry) {
  const dom = entry ? domainOf(entry.domain) : null;
  const eb = $("sc-domain");
  eb.style.setProperty("--c", dom ? dom.color : "var(--ink-3)");
  eb.querySelector("span").textContent = dom ? `${dom.label} · ${entry.title}` : t("js-app-shared-scenario", "Shared scenario");
  // The same words the first paint used (lib/meaning.mjs taskWords).
  const w = entry ? taskWords(entry, dom ? dom.label : "", tomlEl.value) : null;
  S.seen = new Set(w ? w.seen : []);
  $("sc-title").textContent = w ? w.title : t("js-app-share-link-title", "A scenario opened from a share link");
  $("sc-question").textContent = w ? w.sub : t("js-app-share-link-sub", "It runs exactly as it was shared.");
  const back = $("task-back");
  back.href = dom ? `?domain=${encodeURIComponent(dom.id)}` : "./";
  back.querySelector("span").textContent = dom ? dom.label : t("js-app-all-questions", "All questions");
  updateCrumbs();
  document.title = [entry ? entry.title : t("js-app-shared-scenario", "Shared scenario"), STUDIO_NAME].join(" · ");
}

// ------------------------------------------------------------------ how this is computed
// The method is the scenario file's own header; the level of evidence is the run's own label,
// its per-figure tiers (figure_tiers) and the verification-matrix rows for the engine kinds the
// scenario runs (lib/areas.mjs); the references are the oracles of those rows plus the sources
// the header cites.
let matrixPromise = null;
// The engine's kind -> module names table (kind_modules(), 0.36). Read once; an engine without it gives {}
// and a kind then matches the matrix rows by its own name only.
// The engine's headline fields per kind (field_importance(), 0.36), read once when the engine is ready; the
// inputs are ranked again when it arrives. An engine without it gives {} and the Studio ranks by itself.
function loadFieldImportance() {
  return (S.engineReady || Promise.resolve()).then(async () => {
    try { const t = JSON.parse(await S.engine.call("field_importance")); return t && typeof t === "object" ? t : {}; } catch { return {}; }
  });
}
let kindModulesP = null;
function loadKindModules() {
  return (kindModulesP ||= (S.engineReady || Promise.resolve()).then(async () => {
    try { const t = JSON.parse(await S.engine.call("kind_modules")); return t && typeof t === "object" ? t : {}; } catch { return {}; }
  }));
}
// The shared ledger at the site root, so a translated page gets /<lang>/data/verification-matrix.json (the build keeps that copy); a Studio
// served on its own, without the site root, falls back to its own data/ copy (byte-identical, English).
async function fetchMatrix() {
  try { const r = await fetchData("/data/verification-matrix.json"); if (r.ok) return r; } catch { /* no site root */ }
  return fetch("data/verification-matrix.json");
}
function loadMatrix() {
  if (!matrixPromise) matrixPromise = fetchMatrix().then(async (x) => {
    if (!x.ok) return null;
    const ledger = await x.json();
    // a language copy: which rows belong to a kind is decided on the English module and test names (the translated prose is for reading)
    if (/^\/[a-z]{2,3}(-[A-Za-z0-9]+)?\/data\//.test(new URL(x.url).pathname)) { try { restoreMatchFields(ledger, await (await fetch("/data/verification-matrix.json")).json()); } catch { /* the translated rows as they are */ } }
    return ledger;
  }).catch(() => null);
  return matrixPromise;
}
// The scenario's header comment, as paragraphs.
// Sources a header cites: bracketed author-year notes, arXiv numbers and named standards.
function headerCitations(paras) {
  const out = new Set();
  const text = paras.join(" ");
  for (const m of text.matchAll(/\(([^()]*?\b(?:19|20)\d\d[a-z]?[^()]*?)\)/g)) if (/[A-Z][a-z]+/.test(m[1]) && m[1].length < 160) out.add(m[1].trim());
  for (const m of text.matchAll(/\barXiv:\s?\d{4}\.\d{4,5}\b/g)) out.add(m[0]);
  return [...out].slice(0, 6);
}
async function renderHow(run) {
  const base = S.baseToml || run.toml;
  const paras = headerParagraphs(base);
  const seen = new Set(S.seen);
  const method = $("how-method");
  method.replaceChildren(...(paras.length ? paras.slice(0, 3).map((p) => h("p", { text: spellOut(p, seen) })) : [h("p", { text: t("js-app-how-no-header", "This scenario file has no header note. The engine summary below says what was run.") })]));
  if (paras.length > 3) method.append(h("details", { class: "more-notes" }, h("summary", { text: t("js-app-how-more-notes", { one: "{ $n } more note from the scenario file", other: "{ $n } more notes from the scenario file" }, { n: paras.length - 3 }) }), ...paras.slice(3).map((p) => h("p", { text: p }))));
  const lvl = $("how-level"), refs = $("how-refs"), chip = $("how-lvl");
  const r = run.result;
  const hn = honesty(r);
  lvl.replaceChildren();
  if (hn) lvl.append(h("p", {}, lvlChip(hn.tier), " ", h("span", { text: t("js-app-how-own-label", "This run's own label: { $label }", { label: hn.text.replace(/^(VALIDATED|MODELLED|PARTNER)\s*[-:–]?\s*/, "") }) })));
  const tiers = tierCounts(r);
  if (tiers.validated || tiers.modelled) lvl.append(h("p", { text: t("js-app-how-per-figure", "Per figure, from the engine's figure_tiers block: { $validated } validated, { $modelled } modelled. The tier of each figure is in the Overview view.", { validated: tiers.validated, modelled: tiers.modelled }) }));
  chip.replaceChildren(hn ? lvlChip(hn.tier) : "");
  refs.replaceChildren(...headerCitations(paras).map((c) => h("li", { text: c })));
  const matrix = await loadMatrix();
  if (S.run !== run || !matrix) return;
  const rows = matrix.rows;
  const kindModules = await loadKindModules();
  if (S.run !== run) return;
  const idx = [...new Set(kindsOfToml(base).flatMap((k) => rowsForKind(k, rows, kindModules)))];
  if (idx.length) {
    const mix = evidenceMix(idx, rows);
    const ordered = idx.sort((a, b) => (rows[a].status === "VALIDATED" ? 0 : 1) - (rows[b].status === "VALIDATED" ? 0 : 1));
    lvl.append(h("p", { text: mix.partner ? t("js-app-how-matrix-partner", "The engine methods this scenario runs have { $validated } validated and { $modelled } modelled rows in the verification matrix, and { $partner } owned by partners:", { validated: mix.validated, modelled: mix.modelled, partner: mix.partner }) : t("js-app-how-matrix", "The engine methods this scenario runs have { $validated } validated and { $modelled } modelled rows in the verification matrix:", { validated: mix.validated, modelled: mix.modelled }) }),
      h("ul", { class: "mx" }, ordered.slice(0, 6).map((i) => h("li", {}, lvlChip(rows[i].status), " ", h("span", { text: rows[i].requirement })))));
    if (ordered.length > 6) lvl.append(h("p", { class: "fine", text: t("js-app-how-more-rows", { one: "{ $n } more row in the verification matrix (Evidence page of the site).", other: "{ $n } more rows in the verification matrix (Evidence page of the site)." }, { n: ordered.length - 6 }) }));
    if (!hn) chip.replaceChildren(h("span", { class: "sm-n", text: t("js-app-how-mix-chip", "{ $validated } validated · { $modelled } modelled", { validated: mix.validated, modelled: mix.modelled }) }));
    for (const i of ordered.filter((i) => rows[i].status === "VALIDATED").slice(0, 4)) refs.append(h("li", {}, h("span", { text: rows[i].oracle }), h("span", { class: "fine", text: " " + t("js-app-how-checks", "(checks: { $requirement })", { requirement: rows[i].requirement }) })));
  } else lvl.append(h("p", { class: "fine", text: t("js-app-how-no-matrix-row", "No verification-matrix row names this scenario's engine kind yet.") }));
  if (!refs.children.length) refs.append(h("li", { text: t("js-app-how-no-sources", "The scenario file cites no source, and no validated matrix row covers its kind.") }));
}

// ------------------------------------------------------------------ for researchers
const DOI = "10.5281/zenodo.20528627";
function pyPath(path) {
  if (!path || /\[|\s/.test(path)) return null;
  return path.split(".").map((k) => `["${k}"]`).join("");
}
function renderResearch(run) {
  const name = (run.file || "shared").replace(/\.toml$/, "");
  const edited = run.file && run.toml !== S.baseToml;
  const v = S.version || (run.result && run.result.engine_version) || "";
  $("cli").textContent = run.file && !edited && !dirOf(run.file)
    ? `kshana example ${name} > ${name}.toml\nkshana ${name}.toml`
    : `${t("js-app-cli-save-comment", "# save the scenario file below as { $file }, then", { file: `${name}.toml` })}\nkshana ${name}.toml`;
  $("cli-note").textContent = t("js-app-cli-note", "Install with { $command }. The run writes { $file }, a chart, and a report.", { command: `cargo install kshana --version ${v}`, file: `${name}.result.json` });
  const mean = plainMeaning(run.result, run.toml);
  const p = mean && mean.cards.map((c) => pyPath(c.path)).find(Boolean);
  $("py").textContent = `import json, kshana\n\ntoml = open("${name}.toml").read()\nresult = json.loads(kshana.run(toml))\n${p ? `print(result${p})` : "print(sorted(result))"}`;
  $("py-note").textContent = t("js-app-py-note", "Install with { $command }.", { command: `pip install kshana==${v}` });
  const meta = fileMeta(run.result, S.version, run.toml);
  const btn = (label, title, onclick) => h("button", { type: "button", title, onclick }, icon("i-down"), label);
  const row = $("exp-row");
  row.replaceChildren(...[
    btn(t("js-app-btn-result-json", "Result data (JSON)"), t("js-app-btn-result-json-title", "The engine's complete output for this run"), () => triggerDownload(new Blob([JSON.stringify(run.result, null, 2)], { type: "application/json" }), chartFilename("result", meta, "json"))),
    run.csv ? btn(t("js-app-btn-table-csv", "Table (CSV)"), t("js-app-btn-table-csv-title", "The same bytes the command-line tool writes as { $file }", { file: "<scenario>.table.csv" }), () => triggerDownload(new Blob([withEvidenceCsv(run.csv, run.result)], { type: "text/csv" }), chartFilename("table", meta, "csv"))) : null,
    btn(t("js-app-btn-scenario-toml", "Scenario file (TOML)"), t("js-app-btn-scenario-toml-title", "The exact input of this run"), () => triggerDownload(new Blob([run.toml], { type: "text/plain" }), chartFilename("scenario", meta, "toml"))),
    btn(t("js-app-btn-figure-svg", "Figure (SVG)"), t("js-app-btn-figure-svg-title", "The chart on screen, with its title, engine version and DOI"), () => { const f = currentFigure(); if (f) triggerDownload(svgBlob(f.svg), chartFilename(f.base, meta, "svg")); else toast(t("js-app-no-chart-export", "This view has no chart to export.")); }),
    btn(t("js-app-btn-figure-png", "Figure (PNG)"), t("js-app-btn-figure-png-title", "The chart on screen as a high-resolution bitmap"), async () => { const f = currentFigure(); if (!f) { toast(t("js-app-no-chart-export", "This view has no chart to export.")); return; } try { const { w, h: hh } = svgSize(f.svg); triggerDownload(await svgToPngBlob(f.svg, w, hh, 2), chartFilename(f.base, meta, "png")); } catch (e) { toast(t("js-app-png-export-failed", "PNG export failed: { $reason }", { reason: errorMessage(e) })); } }),
    btn(t("js-app-btn-report-html", "Reproducible report (HTML)"), t("js-app-btn-report-html-title", "One offline file: summary, figures with tiers, charts and the exact scenario"), downloadReport),
    h("button", { type: "button", title: t("js-app-btn-all-exports-title", "Every export of this run, including the engine's own formats"), onclick: () => { selectTab("exports", { scroll: true }); } }, icon("i-open"), t("js-app-btn-all-exports", "All exports"))].filter(Boolean));
  const share = $("share-row");
  share.replaceChildren(...[
    h("button", { type: "button", onclick: copyShareLink }, icon("i-share"), t("js-app-btn-copy-link", "Copy a link to this exact scenario")),
    h("button", { type: "button", onclick: copyEmbedCode }, icon("i-copy"), t("js-app-btn-copy-embed", "Copy embed code")),
    h("button", { type: "button", onclick: () => pinRun() }, icon("i-pin"), S.pins.length ? t("js-app-btn-pin-count", "Pin this run ({ $n } pinned)", { n: S.pins.length }) : t("js-app-btn-pin-compare", "Pin this run to compare")),
    S.pins.length ? h("button", { type: "button", onclick: openCompare }, icon("i-compare"), t("js-app-btn-compare-pinned", "Compare pinned runs")) : null,
    h("button", { type: "button", onclick: openHistory }, icon("i-history"), t("js-app-btn-run-history", "Run history"))].filter(Boolean));
  $("cite").textContent = `Baweja, C. Kshana: a PNT-resilience simulator with quantum-sensor performance models, version ${v}. Ashforde OÜ. doi:${DOI}`;
}
// The chart of the view on screen, ready to download: title band, provenance and DOI.
function currentFigure() {
  const view = $(VIEW_ID[S.activeTab]);
  const svg = view && view.querySelector(".chart-box svg");
  if (!svg) return null;
  const card = svg.closest(".card");
  const title = (card && card.querySelector("h3") ? card.querySelector("h3").textContent : (TAB_DEFS.find((t) => t.id === S.activeTab) || {}).label || t("js-app-chart-default-title", "Kshana chart")).trim();
  return { svg: exportSvg(new XMLSerializer().serializeToString(svg), title), base: slug(title) };
}

// ------------------------------------------------------------------ history
function renderHistory() {
  const list = $("hist-list");
  list.replaceChildren();
  for (const run of S.history) {
    list.append(h("li", { class: S.run && S.run.id === run.id ? "cur" : "" },
      h("div", { class: "h1" }, h("b", { text: run.title }), h("span", { text: t("js-app-history-run", "run { $id } · { $time }", { id: run.id, time: run.at.toLocaleTimeString() }) })),
      h("p", { text: run.summary }),
      h("div", { class: "acts" },
        h("button", { class: "btn-mini", type: "button", text: t("js-app-history-restore", "Restore"), onclick: () => restoreRun(run) }),
        h("button", { class: "btn-mini", type: "button", onclick: () => pinRun(run) }, icon("i-pin"), t("js-app-history-pin", "Pin")))));
  }
  $("hist-empty").hidden = S.history.length > 0;
}
async function restoreRun(run) {
  S.file = run.file;
  S.shared = !run.file;
  tomlEl.value = run.toml;
  if (run.file) {
    const bundle = await scenarioBundle();
    if (bundle && typeof bundle[run.file] === "string") S.baseToml = bundle[run.file];
    else if (scenarioPath(run.file)) try { const res = await fetch(scenarioPath(run.file)); if (res.ok) S.baseToml = await res.text(); } catch { /* keep */ }
    const rec = S.recCache.get(run.file);
    if (rec) S.baseToml = rec.toml;
  }
  paintScenarioHeader(entryFor(run.file));
  refreshEditor();
  buildParams();
  if (run.mode === "native") showNotice(nativeNotice(run));
  renderRun(run);
  renderHistory();
  setStatus(t("js-app-history-restored", "Restored run { $id }.", { id: run.id }), "ran");
}

// ------------------------------------------------------------------ share / embed
async function copyShareLink() {
  const url = location.origin + location.pathname + encodeFragment(tomlEl.value);
  history.replaceState(null, "", url);
  try { await navigator.clipboard.writeText(url); toast(t("js-app-share-copied", "Share link copied. It carries the exact scenario.")); }
  catch { toast(t("js-app-share-in-address-bar", "Link placed in the address bar.")); }
}
function embedUrl() {
  const u = new URL(location.origin + location.pathname);
  u.searchParams.set("embed", "1");
  if (S.file) u.searchParams.set("scenario", S.file);
  if (S.activeTab) u.searchParams.set("tab", S.activeTab);
  return u.toString();
}
async function copyEmbedCode() {
  const code = `<iframe src="${embedUrl()}" width="100%" height="720" style="border:0;border-radius:16px" title="Kshana scenario" loading="lazy"></iframe>`;
  try { await navigator.clipboard.writeText(code); toast(t("js-app-embed-copied", "Embed code copied.")); } catch { toast(code); }
}

// ------------------------------------------------------------------ palette
const COMMANDS = [
  { get t() { return t("js-app-cmd-run", "Run the scenario"); }, k: "⌘↵", run: () => runScenario() },
  { get t() { return t("js-app-cmd-pin", "Pin this run to compare"); }, run: () => pinRun() },
  { get t() { return t("js-app-cmd-share", "Copy share link"); }, run: () => copyShareLink() },
  { get t() { return t("js-app-cmd-embed", "Copy embed code"); }, run: () => copyEmbedCode() },
  { get t() { return t("js-app-cmd-report", "Download the report"); }, run: () => downloadReport() },
  { get t() { return t("js-app-cmd-history", "Open run history"); }, run: () => openHistory() },
  { get t() { return t("js-app-cmd-tour", "Start the guided tour"); }, run: () => startTour() },
  { get t() { return t("js-app-cmd-theme", "Toggle light or dark theme"); }, run: () => toggleTheme() },
  { get t() { return t("js-app-cmd-reset", "Reset the scenario text"); }, run: () => resetSource() },
  { get t() { return t("js-app-cmd-advanced", "Show every setting (advanced settings)"); }, run: () => openDetails("adv") },
  { get t() { return t("js-app-cmd-how", "How this is computed"); }, run: () => openDetails("how") },
  { get t() { return t("js-app-cmd-research", "Code, data and citation (for researchers)"); }, run: () => openDetails("research") },
  { get t() { return t("js-app-cmd-exports", "Download the results (exports)"); }, run: () => selectTab("exports", { scroll: true }) },
  { get t() { return t("js-app-cmd-compare", "Compare the pinned runs"); }, run: () => openCompare() },
  { get t() { return t("js-app-cmd-browse", "Browse all scenarios"); }, run: () => navigate({ screen: "browse", q: "" }) },
  { get t() { return t("js-app-cmd-home", "Go to the opening screen"); }, run: () => navigate({ screen: "home" }) },
];
let palItems = [], palSel = 0;
function openPalette() {
  ensureFieldIndex().then(() => { if (!$("palette").hidden) renderPalette(); });
  $("palette").hidden = false;
  const inp = $("pal-input");
  inp.value = "";
  renderPalette();
  inp.focus();
}
function closePalette() { $("palette").hidden = true; }
function renderPalette() {
  const q = $("pal-input").value.trim().toLowerCase();
  const match = (s) => !q || q.split(/\s+/).every((w) => s.toLowerCase().includes(w));
  const list = $("pal-list");
  list.replaceChildren();
  palItems = [];
  const section = (title, items) => {
    if (!items.length) return;
    list.append(h("p", { class: "pal-sec", text: title }));
    for (const it of items) {
      const idx = palItems.length;
      palItems.push(it);
      list.append(h("button", { class: "pal-item", type: "button", role: "option", id: `pal-${idx}`, style: it.c ? `--c:${it.c}` : "", onclick: () => { closePalette(); it.run(); }, onmousemove: () => selPal(idx) }, h("i"), h("b", { text: it.t }), it.k ? h("span", { text: it.k }) : null));
    }
  };
  // Every word must match somewhere; a word in the title counts most, then the file name.
  const words = q ? q.split(/\s+/) : [];
  const score = (s) => words.reduce((n, w) => n + (s[2].toLowerCase().includes(w) ? 4 : s[0].includes(w) ? 2 : 1), 0);
  // The catalogue's ranking (domain and title before description) when the words appear as a
  // phrase; otherwise every word must match somewhere, title first.
  const phrase = q ? searchScenarios(q).map((e) => [e.file, e.domain, e.title, e.question]) : [];
  const scen = (phrase.length ? phrase : SCENARIOS.filter((s) => match(`${s[2]} ${s[3]} ${s[0]} ${domainOf(s[1]).label}`))
    .map((s, i) => ({ s, i, sc: score(s) })).sort((a, b) => b.sc - a.sc || a.i - b.i).map((x) => x.s)).slice(0, q ? 12 : 6)
    .map((s) => ({ t: s[2], k: domainOf(s[1]).label, c: domainOf(s[1]).color, run: () => openScenario(s[0]) }));
  const doms = q ? DOMAINS.filter((d) => match(`${d.label} domain`) && SCENARIOS.some((s) => s[1] === d.id)).slice(0, 5).map((d) => ({ t: t("js-app-pal-area", "Area: { $label }", { label: d.label }), k: t("js-app-pal-scenario-count", { one: "{ $n } scenario", other: "{ $n } scenarios" }, { n: SCENARIOS.filter((s) => s[1] === d.id).length }), c: d.color, run: () => navigate({ screen: "domain", domain: d.id }) })) : [];
  const fields = q.length >= 3 && S.fieldIdx ? findFields(S.fieldIdx, q, 8).map((f) => ({ t: t("js-app-pal-setting", "Setting: { $label }", { label: f.label }), k: (entryFor(f.file) || { title: f.file }).title, c: "var(--ink-2)", run: () => jumpToField(f.file, f.id) })) : [];
  const views = available.filter((id) => match(TAB_DEFS.find((d) => d.id === id).label + " view tab panel")).map((id) => { const d = TAB_DEFS.find((x) => x.id === id); return { t: t("js-app-pal-view", "View: { $label }", { label: d.label }), c: d.c, run: () => selectTab(id, { scroll: true }) }; });
  const cmds = COMMANDS.filter((c) => match(c.t)).map((c) => ({ ...c, c: "var(--ink-3)" }));
  section(t("js-app-pal-sec-scenarios", "Scenarios"), scen);
  section(t("js-app-pal-sec-areas", "Areas"), doms);
  section(t("js-app-pal-sec-settings", "Settings"), fields);
  section(t("js-app-pal-sec-views", "Views"), views);
  section(t("js-app-pal-sec-commands", "Commands"), cmds);
  if (!palItems.length) list.append(h("p", { class: "pal-sec", text: t("js-app-pal-nothing", "Nothing matches") }));
  selPal(0);
}
function selPal(i) {
  palSel = Math.max(0, Math.min(palItems.length - 1, i));
  for (const b of $("pal-list").querySelectorAll(".pal-item")) b.setAttribute("aria-selected", b.id === `pal-${palSel}` ? "true" : "false");
  const cur = $(`pal-${palSel}`);
  if (cur) { cur.scrollIntoView({ block: "nearest" }); $("pal-input").setAttribute("aria-activedescendant", cur.id); }
}


const tour = { on: false, i: 0, steps: [], el: null, opener: null, refs: null };
function startTour() {
  if (tour.on) return;
  tour.steps = TOUR.filter((s) => { const t = document.querySelector(s.target); return t && t.getClientRects().length; });
  if (!tour.steps.length) return;
  tour.opener = document.activeElement;
  if (!tour.el) {
    const spot = h("div", { class: "tour-spot" });
    const title = h("h3", { id: "tour-title" }), body = h("p"), prog = h("span");
    const back = h("button", { type: "button", text: t("js-app-tour-back", "Back"), onclick: () => tourGo(tour.i - 1) });
    const next = h("button", { type: "button", class: "primary", text: t("js-app-tour-next", "Next"), onclick: () => (tour.i >= tour.steps.length - 1 ? endTour() : tourGo(tour.i + 1)) });
    const skip = h("button", { type: "button", text: t("js-app-tour-skip", "Skip"), onclick: endTour });
    const tip = h("div", { class: "tour-tip" }, h("p", { class: "eyebrow", text: t("js-app-tour-eyebrow", "Guided tour") }), title, body, h("div", { class: "tour-foot" }, prog, h("div", {}, skip, back, next)));
    tour.el = h("div", { class: "tour", role: "dialog", "aria-modal": "true", "aria-labelledby": "tour-title", tabindex: "-1" }, spot, tip);
    tour.refs = { spot, tip, title, body, prog, back, next };
    document.body.append(tour.el);
  }
  tour.el.hidden = false;
  tour.on = true;
  window.addEventListener("resize", tourPlace);
  tourGo(0);
  tour.refs.next.focus();
}
function tourGo(n) {
  tour.i = clampStep(n, tour.steps.length);
  const t = document.querySelector(tour.steps[tour.i].target);
  if (t) t.scrollIntoView({ behavior: reducedMotion() ? "auto" : "smooth", block: "nearest" });
  setTimeout(tourPlace, reducedMotion() ? 0 : 300);
}
function tourPlace() {
  if (!tour.on) return;
  const st = tour.steps[tour.i];
  const tgt = document.querySelector(st.target);
  if (!tgt) return;
  const r = tgt.getBoundingClientRect();
  const { spot, tip, title, body, prog, back, next } = tour.refs;
  const hgt = Math.min(r.height, innerHeight - Math.max(0, r.top));
  Object.assign(spot.style, { top: `${r.top - 6}px`, left: `${r.left - 6}px`, width: `${r.width + 12}px`, height: `${hgt + 12}px` });
  title.textContent = st.title; body.textContent = st.body;
  prog.textContent = `${tour.i + 1} / ${tour.steps.length}`;
  back.disabled = tour.i === 0;
  next.textContent = tour.i >= tour.steps.length - 1 ? t("js-app-tour-done", "Done") : t("js-app-tour-next", "Next");
  const ts = tip.getBoundingClientRect();
  const pos = placeTooltip({ top: r.top, left: r.left, width: r.width, height: hgt }, { width: ts.width, height: ts.height }, { width: innerWidth, height: innerHeight }, st.side);
  tip.style.top = `${pos.top}px`; tip.style.left = `${pos.left}px`;
}
function endTour() {
  tour.on = false;
  if (tour.el) tour.el.hidden = true;
  window.removeEventListener("resize", tourPlace);
  if (tour.opener && tour.opener.focus) tour.opener.focus();
}


// ------------------------------------------------------------------ tour
const TOUR = [
  { target: "#meaning", get title() { return t("js-app-tour-answer-title", "The answer first"); }, get body() { return t("js-app-tour-answer-body", "A plain sentence read from the result, and where the result comes from: a live run in your browser, or a run recorded with the same engine."); }, side: "bottom" },
  { target: "#figs", get title() { return t("js-app-tour-figures-title", "The figures that answer it"); }, get body() { return t("js-app-tour-figures-body", "Each card is read from the engine's result document."); }, side: "bottom" },
  { target: "#tabs", get title() { return t("js-app-tour-views-title", "Every view of the run"); }, get body() { return t("js-app-tour-views-body", "Charts, maps, replays, the engine's own report and exports. [ and ] move between views."); }, side: "bottom" },
  { target: "#params", get title() { return t("js-app-tour-settings-title", "Try other settings"); }, get body() { return t("js-app-tour-settings-body", "The five settings that matter most for this question. Change one, then run again. The engine runs in your browser; nothing is uploaded."); }, side: "left" },
  { target: "#how", get title() { return t("js-app-tour-how-title", "How this is computed"); }, get body() { return t("js-app-tour-how-body", "The method, the level of evidence and the references."); }, side: "left" },
  { target: "#research", get title() { return t("js-app-tour-research-title", "For researchers"); }, get body() { return t("js-app-tour-research-body", "The command line and Python to run it yourself, the data and figures, and how to cite it."); }, side: "left" },
  { target: "#cmdk-btn", get title() { return t("js-app-tour-search-title", "Search"); }, get body() { return t("js-app-tour-search-body", "⌘K finds any scenario, area, setting, view or command."); }, side: "bottom" },
];

// ------------------------------------------------------------------ chrome
function toggleTheme() {
  const root = document.documentElement;
  const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
  root.dataset.theme = dark ? "light" : "dark";
  try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch { /* storage blocked */ }
}
let toastTimer = 0;
function toast(msg) { const t = $("toast"); t.textContent = msg; t.hidden = false; clearTimeout(toastTimer); toastTimer = setTimeout(() => (t.hidden = true), 2600); }
function openHistory() { $("history").hidden = false; $("history-close").focus(); }
function closeHistory() { $("history").hidden = true; }
function openDetails(id) { const d = $(id); if (!d) return; d.open = true; d.scrollIntoView({ block: "start", behavior: reducedMotion() ? "auto" : "smooth" }); }
function resetSource() {
  tomlEl.value = S.baseToml;
  refreshEditor();
  buildParams();
  updateSteps();
}
function engineChip() {
  const chip = $("engine-chip");
  chip.dataset.mode = S.mode;
  $("engine-label").textContent = S.mode === "live" ? t("js-app-chip-live", "Live engine · v{ $version }", { version: S.version }) : S.mode === "recorded" ? t("js-app-chip-recorded", "Recorded runs · v{ $version }", { version: S.version }) : S.mode === "loading" ? t("js-app-chip-loading", "Engine loading") : t("js-app-chip-unavailable", "Engine unavailable");
  chip.title = S.mode === "live" ? t("js-app-chip-live-title", "The Kshana engine is running in this browser as WebAssembly") : S.mode === "loading" ? t("js-app-chip-loading-title", "The engine is downloading. Recorded results show meanwhile.") : S.liveError ? t("js-app-chip-failed-title-reason", "WebAssembly could not start here ({ $reason }). Showing real recorded runs of the bundled scenarios.", { reason: S.liveError }) : t("js-app-chip-failed-title", "WebAssembly could not start here. Showing real recorded runs of the bundled scenarios.");
  $("hero-load").hidden = S.mode !== "loading";
}
function insertSpaces() {
  const s = tomlEl.selectionStart, e = tomlEl.selectionEnd;
  tomlEl.setRangeText("  ", s, e, "end");
  refreshEditor();
  buildParamsSoon();
}

// The one primary action, Run again, says what it will do.
function updateSteps() {
  const run = $("run");
  if (!run) return;
  const stale = !!S.run && (S.run.file !== S.file || S.run.toml !== tomlEl.value);
  const label = $("run-label");
  if (!S.engine && S.mode === "loading") {
    label.textContent = S.pendingRun ? t("js-app-run-will-run", "Will run when the engine is ready") : t("js-app-run-when-ready", "Run when the engine is ready");
    run.disabled = false;
    if (!job.active) setStatus(stale || S.pendingRun ? t("js-app-status-loading-kept", "The engine is still loading. Your changes are kept and run as soon as it is ready.") : t("js-app-status-loading-recorded", "The engine is still loading. The result above is a recorded run."), "busy");
  } else if (S.mode === "none") {
    label.textContent = t("js-app-run-again", "Run again"); run.disabled = true;
  } else {
    label.textContent = stale ? t("js-app-run-with-settings", "Run with these settings") : t("js-app-run-again", "Run again");
    run.disabled = job.active;
    if (!job.active) {
      if (stale) setStatus(t("js-app-status-not-run-yet", "Your changes are not run yet."), "");
      else if (S.run && S.run.mode === "live") setStatus(t("js-app-status-last-run-took", "The last run took { $ms } ms in your browser. Nothing is uploaded.", { ms: Math.max(1, Math.round(S.run.ms)) }), "ran");
      else if (S.mode === "recorded") setStatus(t("js-app-status-wasm-blocked", "WebAssembly is blocked here, so this shows recorded runs of the bundled scenarios."), "");
      else setStatus(t("js-app-status-runs-in-browser", "Runs in your browser. Nothing is uploaded."), "");
    }
  }
  run.classList.toggle("is-next", stale);
}
function pressRun() {
  if (!S.engine) { S.pendingRun = true; updateSteps(); toast(t("js-app-toast-loading-run", "The engine is still loading. Your run starts as soon as it is ready.")); return; }
  runScenario();
}

// Breadcrumbs: Studio › Area › Scenario. Each part but the last is a link back.
function updateCrumbs() {
  const host = $("crumbs");
  if (!host || !route) return;
  const parts = [];
  const sep = () => h("span", { class: "sep", "aria-hidden": "true", text: "›" });
  const link = (text, href, extra = {}) => h("a", { class: "cr", href, ...extra }, text);
  const here = (text) => h("span", { class: "cr", "aria-current": "page", text });
  if (route.screen === "home") parts.push(here(t("js-app-crumb-studio", "Studio")));
  else parts.push(link(t("js-app-crumb-studio", "Studio"), "./"));
  if (route.screen === "domain") { const d = domainOf(route.domain); parts.push(sep(), here(d ? d.label : t("js-app-crumb-area", "Area"))); }
  if (route.screen === "browse") parts.push(sep(), here(route.q ? t("js-app-crumb-search", "Search: { $query }", { query: route.q }) : t("js-app-crumb-all-scenarios", "All scenarios")));
  if (route.screen === "task") {
    const entry = S.shared ? null : entryFor(route.scenario);
    const d = entry ? domainOf(entry.domain) : null;
    if (d) parts.push(sep(), link(d.label, `?domain=${encodeURIComponent(d.id)}`));
    parts.push(sep(), here(entry ? entry.title : t("js-app-shared-scenario", "Shared scenario")));
  }
  host.replaceChildren(...parts);
}

// The field index over every bundled scenario (lib/finder.mjs), built once.
let fieldIdxPromise = null;
function ensureFieldIndex() {
  if (!fieldIdxPromise) fieldIdxPromise = scenarioBundle().then((b) => { S.fieldIdx = fieldIndex(b || {}); return S.fieldIdx; });
  return fieldIdxPromise;
}
// Open a scenario at one of its settings: highlighted and focused, under Advanced if need be.
async function jumpToField(file, id) {
  if (S.file !== file || S.shared || !route || route.screen !== "task") await openScenario(file);
  const esc = (x) => (window.CSS && CSS.escape ? CSS.escape(x) : x.replace(/["\\]/g, "\\$&"));
  $("field-find").value = "";
  applyFieldFind();
  let el = $("knobs").querySelector(`[data-field-id="${esc(id)}"]`);
  if (!el) { $("adv").open = true; el = $("fields").querySelector(`.field[data-field-id="${esc(id)}"]`); }
  for (const x of document.querySelectorAll(".knob.hit, .field.hit")) x.classList.remove("hit");
  if (!el) { toast(t("js-app-toast-not-single-number", "That setting is not a single number in this scenario: edit it in the scenario file.")); return; }
  el.classList.add("hit");
  el.scrollIntoView({ block: "center", behavior: reducedMotion() ? "auto" : "smooth" });
  const inp = el.querySelector("input");
  if (inp) inp.focus({ preventScroll: true });
  toast(t("js-app-toast-opened-at", "Opened at { $label }. Change it, then run again.", { label: el.dataset.label || id }));
}

// ------------------------------------------------------------------ the opening screen
// One line per area: lib/catalog.mjs DOMAIN_LINES (search reads it too).
const DOMAIN_LINE = DOMAIN_LINES;
const DOM_ICONS = ["interference", "spectrum", "spoofing", "timing", "navigation", "integrity", "orbits", "constellations", "leo", "leo-missions", "campaigns", "spaceops", "deepspace", "solar", "studies"];
const domIcon = (id) => icon(`d-${DOM_ICONS.includes(id) ? id : "optional"}`);
const HERO_FILE = "constellation-multi-gnss-coverage.toml";
const scenarioHref = (file, tab) => `?scenario=${encodeURIComponent(file.replace(/\.toml$/, ""))}${tab ? `&tab=${encodeURIComponent(tab)}` : ""}`;

let areasPromise = null;
function loadAreas(dirs) {
  if (!areasPromise) areasPromise = Promise.all(dirs.map((d) => fetchOrNull(groupFileUrl(d, "areas.json")).then((x) => (x.ok ? x.json() : null)).catch(() => null)))
    .then((all) => { const base = all[0] || { areas: [], levels: {} }; return { ...base, areas: all.flatMap((a) => (a ? a.areas : [])) }; });
  return areasPromise;
}
// A tile's preview, drawn from the recorded points in data/areas.json.
function previewSvg(p) {
  const W = 120, H = 26;
  if (!p) return null;
  if (p.type === "line") {
    const d = p.points.map((q, i) => `${i ? "L" : "M"}${(q[0] * W).toFixed(1)} ${(H - 2 - q[1] * (H - 4)).toFixed(1)}`).join(" ");
    return svgNode(`<svg xmlns="http://www.w3.org/2000/svg" class="spark" viewBox="0 0 ${W} ${H}" preserveAspectRatio="none" aria-hidden="true"><path class="ln" d="${d}"/></svg>`);
  }
  if (p.type === "heat") {
    const rows = p.cells.length, cols = p.cells[0].length, cw = W / cols, ch = H / rows;
    let s = `<svg xmlns="http://www.w3.org/2000/svg" class="spark" viewBox="0 0 ${W} ${H}" preserveAspectRatio="none" aria-hidden="true"><g class="hm">`;
    p.cells.forEach((row, i) => row.forEach((v, j) => { s += `<rect x="${(j * cw).toFixed(2)}" y="${(i * ch).toFixed(2)}" width="${(cw + 0.3).toFixed(2)}" height="${(ch + 0.3).toFixed(2)}" opacity="${(0.15 + 0.85 * v).toFixed(2)}"/>`; }));
    return svgNode(s + "</g></svg>");
  }
  if (p.type === "figure") return h("span", { class: "spark-fig", "aria-hidden": "true" }, h("b", { text: p.value }), p.unit ? h("small", { text: ` ${p.unit}` }) : null);
  return null;
}
// The honest mix: two parts, validated and modelled, as counted in the verification matrix.
function evidenceBar(mix) {
  const n = mix.validated + mix.modelled;
  const v = n ? Math.round((100 * mix.validated) / n) : 0;
  return h("span", { class: "ev", role: "img", "aria-label": t("js-app-ev-aria", "{ $validated } validated and { $modelled } modelled verification-matrix rows", { validated: mix.validated, modelled: mix.modelled }), title: t("js-app-ev-title", "{ $validated } validated · { $modelled } modelled rows in the verification matrix", { validated: mix.validated, modelled: mix.modelled }) },
    h("span", { class: "ev-bar" }, h("i", { class: "v", style: `width:${v}%` }), h("i", { class: "m", style: `width:${100 - v}%` })),
    h("span", { class: "ev-t" }, h("b", { text: `${v}%` }), " " + t("js-app-ev-validated", "validated")));
}

let heroTimer = 0;
async function renderHome() {
  const dirs = S.groupDirs || [""];
  // The hero is the recorded coverage run (data/hero.json: the same result, without the engine's chart).
  const heroRec = fetch("data/hero.json").then((x) => (x.ok ? x.json() : null)).catch(() => null).then((x) => x || loadRecorded(HERO_FILE).catch(() => null));
  const [data, rec] = await Promise.all([loadAreas(dirs), heroRec]);
  // Legend: the two levels, each with its one-line meaning.
  if (data && data.levels) $("legend").replaceChildren(...["validated", "modelled"].map((k) => h("li", {}, lvlChip(k), h("span", { text: data.levels[k] }))));
  // The whole engine at a glance, from the generated ledger (lib/counts.mjs refuses a summary that disagrees with its rows).
  (S.engineReady || Promise.resolve()).then(loadMatrix).then((ledger) => { if (!ledger) return; try { const m = matrixCounts(ledger); $("legend").append(h("li", { class: "lg-all" }, h("b", { text: t("js-app-legend-count", "{ $validated } of { $total }", { validated: m.validated, total: m.total }) }), h("span", { text: t("js-app-legend-all", "engine capabilities are validated across the whole verification matrix; { $modelled } are modelled and { $partner } are owned by partners.", { modelled: m.modelled, partner: m.partner }) }))); } catch { /* a ledger that disagrees with itself is not shown */ } });
  const total = SCENARIOS.length;
  $("cap-sub").textContent = t("js-app-cap-sub", "{ $areas } areas, { $total } ready-to-run scenarios. Each area shows a real recorded result and the mix of evidence behind it: the share of its engine methods validated against an outside reference.", { areas: data.areas.length, total });
  const tiles = $("tiles");
  tiles.replaceChildren(...data.areas.filter((a) => entryFor(a.first)).map((a) => {
    const p = a.preview;
    const pv = previewSvg(p);
    const e = p && entryFor(p.file);
    return h("a", { class: "tile", href: `?domain=${encodeURIComponent(a.id)}`, "data-domain": a.id, style: `--c:${a.color}`, title: DOMAIN_LINE[a.id] || a.label },
      h("span", { class: "t-head" }, domIcon(a.id), h("b", { text: a.label })),
      pv ? h("span", { class: "t-pv", role: "img", "aria-label": t("js-app-tile-preview-label", "Recorded preview from { $source }: { $title }", { source: e ? e.title : p.file, title: p.title }) }, pv) : null,
      h("span", { class: "t-foot" }, h("span", { class: "n", text: t("js-app-tile-scenario-count", { one: "{ $n } scenario", other: "{ $n } scenarios" }, { n: a.count }) }), evidenceBar(a.mix)));
  }), h("a", { class: "tile all", href: "?browse=1" }, h("span", { class: "t-head" }, icon("i-list"), h("b", { text: t("js-app-tile-browse-all", "Browse all { $n } scenarios", { n: total }) })), h("span", { class: "all-sub", text: t("js-app-tile-browse-sub", "Search by name, question or setting") }), h("svg", { class: "go" })));
  tiles.lastChild.lastChild.replaceWith(icon("i-arrow"));
  tiles.lastChild.lastChild.classList.add("go");
  if (rec) paintHero(rec);
}
function paintHero(rec) {
  let r;
  try { r = JSON.parse(rec.json); } catch { return; }
  const mean = plainMeaning(r, rec.toml);
  const seen = new Set();
  $("hero-answer").textContent = mean ? spellOut(`${mean.big} ${mean.line}`, seen) : "";
  { const hv = r.engine_version || rec.engine_version || S.version || ""; $("hero-rec").textContent = hv ? t("js-app-source-recorded", "Recorded result · v{ $version }", { version: hv }) : t("js-app-hero-recorded-bare", "Recorded result"); }
  const figs = $("hero-figs");
  figs.replaceChildren(...(mean ? mean.cards : []).map((c) => h("div", { "data-path": c.path || null }, h("dt", { text: c.label }), h("dd", {}, c.value, c.unit ? h("small", { text: c.unit }) : null))));
  const hn = honesty(r);
  const inp = r.inputs || {};
  const places = r.grid && Array.isArray(r.grid.lat_deg) && Array.isArray(r.grid.lon_deg) ? r.grid.lat_deg.length * r.grid.lon_deg.length : null;
  $("hero-meta").replaceChildren(hn ? lvlChip(hn.tier, hn.text) : "", " ", [Number.isFinite(r.total_satellites) ? t("js-app-hero-satellites", { one: "{ $n } satellites", other: "{ $n } satellites" }, { n: r.total_satellites }) : "", Number.isFinite(inp.mask_deg) ? t("js-app-hero-mask", "{ $deg }° elevation mask", { deg: inp.mask_deg }) : "", places ? t("js-app-hero-places", { one: "{ $n } places", other: "{ $n } places" }, { n: places }) : "", Number.isFinite(inp.epochs) ? t("js-app-hero-steps", { one: "{ $n } time steps", other: "{ $n } time steps" }, { n: inp.epochs }) : ""].filter(Boolean).join(", ") + ". " + t("js-app-hero-positions-only", "Satellite positions only: no signal power, satellite health or terrain."));
  const fields = G.coverageFields(r);
  const field = (fields.find((f) => /visible/.test(f.key)) || fields[0] || {}).key;
  const tr = r.tracks && Array.isArray(r.tracks.times_s) ? r.tracks : null;
  const names = G.coverageLegend(r);
  const box = $("hero-map");
  const span = tr ? tr.times_s[tr.times_s.length - 1] - tr.times_s[0] : 0;
  let k = 0, c = null;
  const draw = () => {
    c = G.coverageSvg(r, { field, k, land: S.land || [] });
    setSvg(box, c.svg);
    if (tr) $("hero-clock").textContent = t("js-app-hero-clock", "{ $elapsed } of { $total }", { elapsed: plainDuration(tr.times_s[k] - tr.times_s[0]), total: plainDuration(span) });
  };
  draw();
  if (c) $("hero-cap").replaceChildren(h("span", { class: "ramp-l" }, h("i", { class: "ramp", style: `background:linear-gradient(90deg,${(c.field.lowerBetter ? [1, .75, .5, .25, 0] : [0, .25, .5, .75, 1]).map(V.heat).join(",")})` }), span ? t("js-app-hero-ramp-over", "{ $lo } to { $hi } { $field }, over { $duration }", { lo: V.fmt(c.range[0], 3), hi: V.fmt(c.range[1], 3), field: c.field.label.toLowerCase(), duration: plainDuration(span) }) : t("js-app-hero-ramp", "{ $lo } to { $hi } { $field }", { lo: V.fmt(c.range[0], 3), hi: V.fmt(c.range[1], 3), field: c.field.label.toLowerCase() })),
    h("ul", { class: "cons" }, names.map((n) => h("li", {}, h("i", { class: "sw", style: `background:${n.color}` }), n.name))));
  clearInterval(heroTimer);
  if (tr && !reducedMotion()) heroTimer = setInterval(() => { if ($("home").hidden || document.hidden) return; k = (k + 1) % tr.times_s.length; draw(); }, 420);
  S.heroRedraw = draw;
}

// ------------------------------------------------------------------ an area, or every scenario
function hitLink(e, extra = null) {
  const d = domainOf(e.domain);
  return h("a", { class: "start-hit", href: scenarioHref(e.file), "data-file": e.file, style: `--c:${d ? d.color : "var(--ink-3)"}` },
    h("b", { text: e.title }), h("span", { text: e.question }), h("span", { class: "meta" }, d ? d.label : "", NOT_IN_BROWSER[e.file] ? " · " + t("js-app-hit-native-note", "recorded run, native engine") : ""), extra);
}
async function renderBrowse(st) {
  const host = $("start-results"), ev = $("browse-evidence");
  ev.hidden = true;
  $("browse").dataset.mode = st.screen;
  if (st.screen === "domain") {
    const d = domainOf(st.domain);
    if (!d) { navigate({ screen: "browse", q: "" }, { replace: true }); return; }
    const items = SCENARIOS.filter((s) => s[1] === d.id).map((s) => entryFor(s[0])).filter(Boolean);
    const kick = $("browse-kicker");
    kick.style.setProperty("--c", d.color);
    kick.querySelector("i").style.background = d.color;
    kick.querySelector("span").textContent = t("js-app-browse-area-kicker", { one: "Area · { $n } scenario", other: "Area · { $n } scenarios" }, { n: items.length });
    $("browse-h").textContent = d.label;
    $("browse-lede").textContent = `${DOMAIN_LINE[d.id] || ""} ${t("js-app-browse-area-lede", "Pick one: it opens on its result straight away.")}`.trim();
    $("start-search").value = "";
    $("start-search").closest(".search").hidden = true;
    host.replaceChildren(h("div", { class: "start-hits" }, items.map((e) => hitLink(e))));
    const data = await loadAreas(S.groupDirs || [""]);
    const a = data.areas.find((x) => x.id === d.id);
    if (a && route && route.domain === d.id) {
      ev.hidden = false;
      ev.replaceChildren(h("p", {}, h("b", { text: t("js-app-browse-evidence-title", "Evidence behind this area.") + " " }), t("js-app-browse-evidence", "The engine methods its scenarios run have { $validated } validated and { $modelled } modelled rows in the verification matrix.", { validated: a.mix.validated, modelled: a.mix.modelled })), evidenceBar(a.mix),
        a.examples && a.examples.validated.length ? h("p", { class: "fine", text: t("js-app-browse-validated-examples", "Validated, for example: { $examples }.", { examples: a.examples.validated.join("; ") }) }) : "");
    }
    return;
  }
  const kick = $("browse-kicker");
  kick.querySelector("i").style.background = "var(--ink-3)";
  kick.querySelector("span").textContent = t("js-app-browse-kicker", "Browse");
  $("browse-h").textContent = t("js-app-browse-all-title", "All { $n } scenarios", { n: SCENARIOS.length });
  $("browse-lede").textContent = t("js-app-browse-lede", "Search, or pick an area. Every scenario opens on its result straight away.");
  $("start-search").closest(".search").hidden = false;
  if ($("start-search").value !== st.q) $("start-search").value = st.q || "";
  if (st.q) { await startSearch(); return; }
  host.replaceChildren(...groupedLibrary("").flatMap((g) => [h("h3", {}, h("a", { href: `?domain=${encodeURIComponent(g.domain.id)}`, class: "grp", style: `--c:${g.domain.color}` }, h("i", { class: "dot" }), `${g.domain.label} · ${g.items.length}`)), h("div", { class: "start-hits" }, g.items.map((e) => hitLink(e)))]));
}
async function startSearch() {
  const q = $("start-search").value.trim();
  const host = $("start-results");
  if (!q) { renderBrowse({ screen: "browse", q: "" }); return; }
  await ensureFieldIndex();
  if ($("start-search").value.trim() !== q) return;
  const words = q.toLowerCase().split(/\s+/);
  const doms = DOMAINS.filter((d) => SCENARIOS.some((s) => s[1] === d.id) && words.every((w) => `${d.label} ${DOMAIN_LINE[d.id] || ""}`.toLowerCase().includes(w)));
  const scen = searchScenarios(q); // title and domain matches first
  const fields = findFields(S.fieldIdx, q, 400);
  const out = [];
  if (doms.length) out.push(h("h3", { text: t("js-app-pal-sec-areas", "Areas") }), h("div", { class: "start-doms" }, doms.map((d) => h("a", { class: "start-dom", href: `?domain=${encodeURIComponent(d.id)}`, style: `--c:${d.color}` }, h("span", { class: "ic" }, domIcon(d.id)), d.label))));
  if (scen.length) out.push(h("h3", { text: t("js-app-search-scenarios", "Scenarios ({ $n })", { n: scen.length }) }), h("div", { class: "start-hits" }, scen.slice(0, 24).map((e) => hitLink(e))));
  if (fields.length) {
    out.push(h("h3", { text: t("js-app-search-settings", { one: "Settings named like “{ $query }”: in { $n } scenario", other: "Settings named like “{ $query }”: in { $n } scenarios" }, { query: q, n: scenarioCount(fields) }) }), h("p", { class: "hint", text: t("js-app-search-settings-hint", "Each opens the scenario with that setting highlighted, ready to change.") }));
    out.push(h("div", { class: "start-hits" }, fields.slice(0, 24).map((x) => { const e = entryFor(x.file); const d = e ? domainOf(e.domain) : null; return h("button", { class: "start-hit field", type: "button", "data-file": x.file, "data-field": x.id, style: `--c:${d ? d.color : "var(--ink-3)"}`, onclick: () => jumpToField(x.file, x.id) }, h("b", { text: x.label }), h("span", { text: t("js-app-hit-in-scenario", "in { $title }", { title: e ? e.title : x.file }) }), h("span", { class: "meta", text: t("js-app-hit-setting-meta", "{ $area } · setting { $name }", { area: d ? d.label : "", name: `${x.section ? x.section + "." : ""}${x.key}` }) })); })));
    if (fields.length > 24) out.push(h("p", { class: "hint", text: t("js-app-search-more-matches", { one: "{ $n } more matches: add a word to narrow them.", other: "{ $n } more matches: add a word to narrow them." }, { n: fields.length - 24 }) }));
  }
  if (!out.length) out.push(h("p", { class: "hint", text: t("js-app-search-nothing", "Nothing matches “{ $query }”. Try a word like jamming, clock, lunar, orbit, mask or PDOP.", { query: q }) }));
  host.replaceChildren(...out);
}

// ------------------------------------------------------------------ compare
function openCompare() {
  if (!S.pins.length) { pinRun(); return; }
  if (S.pins.length === 1 && !S.pins.includes(S.run)) { pinRun(); return; }
  if (!available.includes("compare")) buildTabs();
  selectTab("compare", { scroll: true });
  if (S.pins.length < 2) toast(t("js-app-toast-one-pinned", "One run is pinned. Change a setting, run again, and pin that run to compare the two."));
}

// Find a field of this scenario: filter the controls, guided and all.
function applyFieldFind() {
  const inp = $("field-find");
  if (!inp) return;
  const q = inp.value.trim();
  const note = $("field-find-note");
  const knobs = [...$("knobs").querySelectorAll(".knob")], fields = [...$("fields").querySelectorAll(".field")];
  const ctl = (el) => ({ id: el.dataset.fieldId, label: el.dataset.label || "", key: el.dataset.key || "" });
  const okK = new Set(filterControls(knobs.map(ctl), q)), okF = new Set(filterControls(fields.map(ctl), q));
  for (const el of knobs) el.hidden = !!q && !okK.has(el.dataset.fieldId);
  for (const el of fields) el.hidden = !!q && !okF.has(el.dataset.fieldId);
  for (const sec of $("fields").querySelectorAll(".fsec")) { let n = sec.nextElementSibling, any = false; while (n && !n.classList.contains("fsec")) { if (n.classList.contains("field") && !n.hidden) any = true; n = n.nextElementSibling; } sec.hidden = !!q && !any; }
  if (!q) { note.hidden = true; return; }
  if (okF.size && !okK.size) $("adv").open = true;
  note.hidden = false;
  note.textContent = okK.size + okF.size ? t("js-app-find-matches", { one: "{ $n } guided control and { $m } of { $total } fields match “{ $query }”.", other: "{ $n } guided controls and { $m } of { $total } fields match “{ $query }”." }, { n: okK.size, m: okF.size, total: fields.length, query: q }) : t("js-app-find-none", "No field of this scenario matches “{ $query }”. Search every scenario with the library search.", { query: q });
}



// Install commands, from the site's channels.json (generated from the repository at build time).
async function paintChannels() {
  const box = $("install-line");
  if (!box) return;
  try {
    const d = await (await fetchData("channels.json")).json();
    const pick = ["cli", "python", "npm", "mcp"].map((id) => d.channels.find((c) => c.id === id)).filter(Boolean);
    box.replaceChildren(h("span", { class: "lbl", text: t("js-app-install-label", "Install v{ $version }", { version: d.version }) }), ...pick.map((c) => h("button", { class: "cmd-chip", type: "button", title: t("js-app-install-copy", "Copy: { $command }", { command: c.command }), "data-cmd": c.command, text: c.command })));
    for (const b of box.querySelectorAll("button")) b.addEventListener("click", () => { navigator.clipboard && navigator.clipboard.writeText(b.dataset.cmd); b.classList.add("copied"); setTimeout(() => b.classList.remove("copied"), 1200); });
  } catch { box.hidden = true; }
}


function renderCompareExtras() {
  const card = $("compare-kpi-card"), kpiT = $("compare-kpi"), ov = $("compare-overlays");
  card.hidden = true; kpiT.replaceChildren(); ov.replaceChildren();
  if (S.pins.length < 2) return;
  const sets = S.pins.map((p) => kpiCards(p.result, p.toml, 6));
  const keys = [];
  for (const cs of sets) for (const c of cs) if (!keys.some((k) => kpiKey(k) === kpiKey(c))) keys.push(c);
  if (keys.length) {
    kpiT.append(h("thead", {}, h("tr", {}, h("th", { text: t("js-app-th-key-figure", "Key figure") }), ...S.pins.map((p, i) => h("th", {}, h("span", { class: "sw", style: `background:${PALETTE[i]}` }), t("js-app-compare-run-head", "{ $letter } · run { $id }", { letter: String.fromCharCode(65 + i), id: p.id }))))));
    const tb = h("tbody");
    for (const k of keys) {
      const tr = h("tr", {}, h("td", { text: `${k.term ? `${k.k} (${k.term})` : k.k}${k.sub ? `, ${k.sub}` : ""}${k.unit ? ` (${k.unit})` : ""}` }));
      sets.forEach((cs, i) => {
        const c = cs.find((x) => kpiKey(x) === kpiKey(k));
        const td = h("td", { class: "num", text: c ? (c.text !== undefined ? c.text : V.fmt(c.v)) : "—" });
        if (i > 0 && c) { const d = kpiDelta(c, sets[0]); if (d && d.dir !== "flat") td.append(h("span", { class: `delta ${d.dir === "up" ? "up" : "down"} neutral`, text: d.text })); }
        tr.append(td);
      });
      tb.append(tr);
    }
    kpiT.append(tb);
    card.hidden = false;
  }
  // Overlaid charts: the same line panel of runs A and B on one pair of axes (B dashed).
  const [a, b] = S.pins;
  const ca = K.capabilityView(a.result, a.toml), cb = K.capabilityView(b.result, b.toml);
  if (!ca || !cb || ca.kind !== cb.kind) return;
  const lb = cb.panels.filter((p) => p.type === "line");
  let n = 0;
  for (const pa of ca.panels.filter((p) => p.type === "line")) {
    const pb = lb.find((x) => x.title === pa.title);
    if (!pb || n >= 3) continue;
    const series = [...pa.model.series.map((x) => ({ ...x, label: `A · ${x.label}` })), ...pb.model.series.map((x) => ({ ...x, label: `B · ${x.label}`, dash: true }))];
    const title = t("js-app-overlay-title", "{ $title }: run { $a } (A) against run { $b } (B)", { title: pa.title, a: a.id, b: b.id });
    const chart = V.lineChartSvg({ ...pa.model, series }, pa.opts || {});
    if (!chart.svg) continue;
    const box = h("div", { class: "chart-box" }), tools = h("div", { class: "chart-tools" });
    setSvg(box, chart.svg); bindHover(box, chart.hover); mountTools(tools, () => exportSvg(chart.svg, title), "compare-overlay");
    ov.append(h("div", { class: "card scope" }, h("div", { class: "card-head" }, h("h3", { text: title }), h("p", { class: "card-note on-space", text: t("js-app-overlay-note", "Solid lines are run A, dashed lines run B, on the same axes.") })), box, tools));
    n++;
  }
}

// ------------------------------------------------------------------ panels: full screen
function toggleMax(card, btn = card.querySelector(".pan-max")) {
  const on = !card.classList.contains("is-max");
  for (const c of document.querySelectorAll(".is-max")) if (c !== card) toggleMax(c);
  card.classList.toggle("is-max", on);
  document.body.classList.toggle("has-max", on);
  if (btn) { btn.replaceChildren(icon(on ? "i-min" : "i-max"), h("span", { class: "lbl", text: on ? t("js-app-panel-close", "Close") : t("js-app-panel-expand", "Expand") })); btn.setAttribute("aria-label", on ? t("js-app-panel-close-full", "Close full screen") : t("js-app-panel-expand-full", "Expand this panel to full screen")); btn.setAttribute("aria-expanded", on ? "true" : "false"); btn.focus(); }
  window.dispatchEvent(new Event("resize"));
}
let decoTimer = 0;
function decoratePanels() {
  decoTimer = 0;
  for (const card of $("views").querySelectorAll(".card")) {
    const head = card.querySelector(":scope > .card-head");
    if (!head || card.querySelector(":scope > .pan-max")) continue;
    const b = h("button", { type: "button", class: "pan-max", "aria-label": t("js-app-panel-expand-full", "Expand this panel to full screen"), "aria-expanded": "false", title: t("js-app-panel-expand-title", "Show this panel full screen (Escape closes it)") }, icon("i-max"), h("span", { class: "lbl", text: t("js-app-panel-expand", "Expand") }));
    b.addEventListener("click", () => toggleMax(card, b));
    card.classList.add("has-max-btn");
    card.append(b);
  }
}


// ------------------------------------------------------------------ screens and the address
// The address is the state (lib/urlstate.mjs): every screen has its own link, and Back and
// Forward move between screens. Views of one scenario replace the entry instead of adding one.
let route = null;
function setAddress(state, { push = false } = {}) {
  const url = location.pathname + buildSearch(state, persistentExtras(state.extra || {})) ;
  if (push) history.pushState(null, "", url); else history.replaceState(null, "", url);
}
function navigate(state, { replace = false } = {}) {
  const next = { screen: "home", scenario: null, tab: null, domain: null, q: "", ...state, extra: persistentExtras((route && route.extra) || {}) };
  setAddress(next, { push: !replace && isNewEntry(route, next) });
  applyRoute(next);
}
function openScenario(file, tab = null) { return navigate({ screen: "task", scenario: file, tab }); }
function showScreen(id) {
  for (const s of ["home", "browse", "task"]) $(s).hidden = s !== id;
  document.body.dataset.screen = id;
}
async function applyRoute(st) {
  const prev = route;
  route = st;
  S.link = { play: st.extra && st.extra.play === "1", view: st.extra && st.extra.view, field: st.extra && st.extra.field, frame: st.extra && st.extra.frame };
  if (st.screen === "task" && entryFor(st.scenario)) {
    const same = prev && prev.screen === "task" && prev.scenario === st.scenario && S.file === st.scenario && !S.shared;
    showScreen("task");
    if (!same) { window.scrollTo(0, 0); await openTask(st.scenario, st.tab); }
    else if (st.tab && st.tab !== S.activeTab && available.includes(st.tab)) selectTab(st.tab, { url: false });
  } else if (st.screen === "domain" || st.screen === "browse") {
    showScreen("browse");
    if (!prev || prev.screen !== st.screen || prev.domain !== st.domain) window.scrollTo(0, 0);
    document.title = `${st.screen === "domain" && domainOf(st.domain) ? domainOf(st.domain).label : t("js-app-crumb-all-scenarios", "All scenarios")} · ${STUDIO_NAME}`;
    await renderBrowse(st);
  } else {
    route = { ...st, screen: "home" };
    showScreen("home");
    window.scrollTo(0, 0);
    document.title = STUDIO_NAME;
    if (!S.homeDrawn) { S.homeDrawn = true; await renderHome(); }
  }
  updateCrumbs();
}
// A task screen: the recorded result of the bundled file at once (labelled), then the live run.
async function openTask(file, tab) {
  S.tabRequest = tab || null;
  S.preferRecorded = true;
  stopPlayers();
  paintScenarioHeader(entryFor(file));
  // The first paint (index.html, data/firstpaint.json) may already show this run's recorded answer.
  if (document.body.dataset.fp !== file.replace(/\.toml$/, "")) { $("m-big").textContent = t("js-app-opening-result", "Opening the result…"); $("m-line").textContent = ""; }
  delete document.body.dataset.fp;
  await loadScenario(file, { run: false });
  if (S.file !== file) return;
  if (NOT_IN_BROWSER[file] && !RECORDED_NATIVELY.includes(file)) {
    // Nothing to show in a browser: say so plainly, and how to run it.
    $("m-chips").replaceChildren();
    $("m-big").textContent = t("js-app-cli-only-title", "This one runs on the command line, not in the browser.");
    $("m-line").textContent = NOT_IN_BROWSER[file];
    $("kpis-wrap").hidden = true; $("tabs-wrap").hidden = true;
    for (const v of $("views").querySelectorAll(".view")) v.hidden = true;
    showNotice("");
    return;
  }
  if (NOT_IN_BROWSER[file]) { if (S.engine) await runScenario(); return; }
  const rec = await loadRecorded(file).catch(() => null);
  if (S.file === file && rec && rec.toml === tomlEl.value) {
    let result = null;
    try { result = JSON.parse(rec.json); } catch { /* shown by the live run instead */ }
    if (result) {
      if (!S.version) S.version = ((await recordedIndex(dirOf(file))) || {}).engine_version || "";
      const entry = entryFor(file), want = S.tabRequest;
      renderRun({ id: 0, file, title: entry ? entry.title : file, toml: rec.toml, result, svg: rec.svg || "", summary: rec.summary || "", csv: rec.csv || null, ms: 0, at: new Date(), mode: rec.source === "native" ? "native" : "recorded", platform: rec.platform || "", command: rec.command || "", preview: !S.engine });
      if (want && S.activeTab !== want) S.tabRequest = want; // a view only the live run offers opens then
    }
  }
  if (S.engine && S.mode === "live" && S.file === file) await runScenario();
}

// The switch to the Advanced view (the full dashboard): the same scenario, the same view of the
// result, and the reader's changed settings, carried in the link (lib/urlstate.mjs viewUrl).
function advancedHref() {
  const onTask = route && route.screen === "task" && !S.shared;
  const edited = onTask && S.file && tomlEl.value && tomlEl.value !== S.baseToml;
  return viewUrl("advanced", { scenario: onTask ? S.file : null, tab: onTask ? S.activeTab : null, fragment: edited || S.shared ? encodeFragment(tomlEl.value) : "", extra: (route && route.extra) || {} });
}
function switchToAdvanced(e) {
  if (e && (e.metaKey || e.ctrlKey || e.shiftKey || e.button)) return;
  if (e) e.preventDefault();
  try { localStorage.setItem(VIEW_KEY, "advanced"); } catch { /* storage blocked: the switch still works */ }
  location.assign(advancedHref());
}
function bindUi() {
  for (const id of ["view-switch", "open-advanced"]) { const a = $(id); a.addEventListener("click", switchToAdvanced); a.addEventListener("focus", () => { a.href = advancedHref(); }); a.addEventListener("mouseenter", () => { a.href = advancedHref(); }); }
  const sf = $("sig-field");
  if (sf) sf.addEventListener("click", (e) => { const b = e.target.closest("button[data-field]"); if (!b) return; S.sigField = b.dataset.field; renderSignal(); });
  $("run").addEventListener("click", pressRun);
  $("run-cancel").addEventListener("click", cancelJob);
  tomlEl.addEventListener("input", () => { refreshEditor(); buildParamsSoon(); updateSteps(); });
  tomlEl.addEventListener("scroll", syncScroll);
  tomlEl.addEventListener("keydown", (e) => {
    // Tab inserts two spaces, like the scenario files; Escape then Tab moves focus on.
    if (e.key === "Tab" && !e.shiftKey && !e.metaKey && !e.ctrlKey && !e.altKey) {
      if (tomlEl.dataset.esc === "1") { tomlEl.dataset.esc = ""; return; }
      e.preventDefault();
      insertSpaces();
    } else if (e.key === "Escape") tomlEl.dataset.esc = "1";
    else tomlEl.dataset.esc = "";
  });
  $("src-reset").addEventListener("click", (e) => { e.preventDefault(); resetSource(); });
  $("src-copy").addEventListener("click", async (e) => { e.preventDefault(); try { await navigator.clipboard.writeText(tomlEl.value); toast(t("js-app-toast-scenario-copied", "Scenario copied.")); } catch { toast(t("js-app-toast-copy-blocked", "Copy is blocked here.")); } });
  for (const b of document.querySelectorAll("[data-ts]")) b.addEventListener("click", () => { S.tsMode = b.dataset.ts; setTsMode(b.dataset.ts); });
  $("ho-thr").addEventListener("input", drawHoldover);
  $("ho-thr-reset").addEventListener("click", () => { if (S.ho && Number.isFinite(S.ho.threshold)) { $("ho-thr").value = String(S.ho.threshold); drawHoldover(); } });
  $("sweep-run").addEventListener("click", runSweep);
  $("sweep-knob").addEventListener("change", () => seedSweepRange(true));
  $("sweep-knob2").addEventListener("change", () => seedSweepRange(true));
  $("compare-clear").addEventListener("click", () => { S.pins = []; buildTabs(); selectTab(preferredTab(S.run)); renderResearch(S.run); });
  $("json-copy").addEventListener("click", async () => { try { await navigator.clipboard.writeText(JSON.stringify(S.run.result, null, 2)); toast(t("js-app-toast-json-copied", "JSON copied.")); } catch { toast(t("js-app-toast-copy-blocked", "Copy is blocked here.")); } });
  $("json-download").addEventListener("click", () => { const meta = fileMeta(S.run.result, S.version, S.run.toml); triggerDownload(new Blob([JSON.stringify(S.run.result, null, 2)], { type: "application/json" }), chartFilename("result", meta, "json")); });
  for (const b of document.querySelectorAll("button.copy[data-copy]")) b.addEventListener("click", async () => { try { await navigator.clipboard.writeText($(b.dataset.copy).textContent); toast(t("js-app-toast-copied", "Copied.")); } catch { toast(t("js-app-toast-copy-blocked-select", "Copy is blocked here: select the text instead.")); } });
  $("cmdk-btn").addEventListener("click", openPalette);
  $("pal-input").addEventListener("input", renderPalette);
  $("pal-input").addEventListener("keydown", (e) => {
    if (e.key === "ArrowDown") { e.preventDefault(); selPal(palSel + 1); }
    else if (e.key === "ArrowUp") { e.preventDefault(); selPal(palSel - 1); }
    else if (e.key === "Enter" && !(e.metaKey || e.ctrlKey)) { e.preventDefault(); const it = palItems[palSel]; if (it) { closePalette(); it.run(); } }
  });
  $("palette").addEventListener("mousedown", (e) => { if (e.target.id === "palette") closePalette(); });
  $("history-close").addEventListener("click", closeHistory);
  $("btn-theme").addEventListener("click", toggleTheme);
  $("field-find").addEventListener("input", applyFieldFind);
  $("kf-find").addEventListener("input", () => { const q = $("kf-find").value.trim().toLowerCase(); for (const tr of $("kf-table").querySelectorAll("tbody tr")) tr.hidden = !!q && !q.split(/\s+/).every((w) => tr.textContent.toLowerCase().includes(w)); });
  let st = 0;
  $("start-search").addEventListener("input", () => { clearTimeout(st); st = setTimeout(() => { const q = $("start-search").value.trim(); route = { ...route, screen: "browse", q }; setAddress(route); updateCrumbs(); startSearch(); }, 140); });
  $("start-search").addEventListener("keydown", (e) => { if (e.key === "Enter") { e.preventDefault(); const f = $("start-results").querySelector(".start-hit, .start-dom"); if (f) f.click(); } });
  $("tabs").addEventListener("keydown", (e) => {
    if (e.key === "ArrowRight") { e.preventDefault(); cycleTab(1); }
    else if (e.key === "ArrowLeft") { e.preventDefault(); cycleTab(-1); }
  });
  // In-page links (questions, tiles, results, crumbs) move between screens without a reload.
  document.addEventListener("click", (e) => {
    const a = e.target.closest("a[href]");
    if (a && (a.id === "view-switch" || a.id === "open-advanced")) return;
    if (!a || e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey || a.target) return;
    const u = new URL(a.href, location.href);
    if (u.origin !== location.origin || u.pathname !== location.pathname) return;
    e.preventDefault();
    const st2 = parseState(u.search);
    navigate(st2);
    if (st2.extra.play === "1") S.link.play = true;
  });
  window.addEventListener("popstate", () => { const st2 = parseState(location.search); applyRoute(st2); });
  document.addEventListener("keydown", (e) => {
    const mod = e.metaKey || e.ctrlKey;
    const typing = /^(INPUT|TEXTAREA|SELECT)$/.test((e.target && e.target.tagName) || "");
    if (tour.on) {
      if (e.key === "Escape") endTour();
      else if (e.key === "ArrowRight") tour.refs.next.click();
      else if (e.key === "ArrowLeft" && tour.i > 0) tour.refs.back.click();
      else if (e.key === "Tab") { const f = [...tour.el.querySelectorAll("button:not(:disabled)")]; const i = f.indexOf(document.activeElement); e.preventDefault(); f[(i + (e.shiftKey ? -1 : 1) + f.length) % f.length].focus(); }
      return;
    }
    if (mod && e.key.toLowerCase() === "k") { e.preventDefault(); if ($("palette").hidden) openPalette(); else closePalette(); return; }
    if (mod && e.key === "Enter") { e.preventDefault(); closePalette(); if (route && route.screen === "task") pressRun(); return; }
    if (e.key === "Escape") { const mx = document.querySelector(".is-max"); if (!$("palette").hidden) closePalette(); else if (mx) toggleMax(mx); else if (!$("history").hidden) closeHistory(); return; }
    if (typing) return;
    if (e.key === "/") { e.preventDefault(); openPalette(); }
    else if (e.key === "]" && route && route.screen === "task") cycleTab(1);
    else if (e.key === "[" && route && route.screen === "task") cycleTab(-1);
  });
  new MutationObserver(() => { if (!decoTimer) decoTimer = requestAnimationFrame(decoratePanels); }).observe($("views"), { childList: true, subtree: true });
  decoratePanels();
  PHONE_MQ.addEventListener("change", () => { if (S.run) selectTab(S.activeTab, { url: false }); });
}

// A language change: rebuild the text the script wrote (the static text follows data-l10n); the run and its result stay as they are.
function relocalise() {
  try {
    S.homeDrawn = false;
    if (route && route.screen === "task") {
      const e = entryFor(route.scenario);
      if (e) paintScenarioHeader(e);
      if (S.run) { renderRun(S.run); localiseEngineText(S.run); }
    } else if (route) applyRoute(route);
  } catch (e) { console.warn("language change:", e); }
}

async function main() {
  if (window.kshanaL10n && window.kshanaL10n.setRerender) window.kshanaL10n.setRerender(relocalise);
  // Which view opens (lib/urlstate.mjs chooseView): view=advanced in the link, or, on the bare
  // address, the view this browser chose last. Site deep links open this Simple view.
  let stored = null;
  try { stored = localStorage.getItem(VIEW_KEY); } catch { /* storage blocked: Simple */ }
  if (chooseView(location.search, stored) === "advanced" && !isEmbed(location.search)) {
    const p0 = parseState(location.search);
    location.replace(viewUrl("advanced", { scenario: p0.scenario, tab: p0.tab, fragment: location.hash, extra: p0.extra }));
    return;
  }
  bindUi();
  engineChip();
  S.embed = isEmbed(location.search);
  const cfg = S.embed ? embedConfig(location.search) : null;
  if (S.embed) for (const c of embedClassList(cfg)) document.body.classList.add(c);
  let shared = decodeFragment(location.hash);
  let st = parseState(location.search);
  // A switch from the Advanced view carries the scenario AND the reader's edit in the fragment.
  const carried = shared && st.screen === "task" && entryFor(st.scenario) ? shared : null;
  if (carried) shared = null;
  if (cfg && cfg.scenario) st = { ...st, screen: "task", scenario: /\.toml$/.test(cfg.scenario) ? cfg.scenario : `${cfg.scenario}.toml`, tab: tabFromLink(cfg.tab) || st.tab };
  // A scenario this build does not have opens the list of all scenarios, saying so.
  const deferred = st.screen === "task" && !entryFor(st.scenario) && !shared; // maybe in an optional group
  // The first screen paints from the catalogue and the recorded result before anything else is
  // fetched (on a slow link every other download would delay it); the engine download follows.
  // Optional groups of scenarios live in their own folders (groups.json). The opening screen and
  // the lists count them, so they are read first there; a task link does not wait for them.
  const getJson = (url) => fetch(url).then((r) => (r.ok ? r.json() : null)).catch(() => null);
  const dirs = [""];
  const readGroups = async () => {
    for (const dir of ((await getJson("groups.json")) || {}).groups || []) {
      const group = isGroupDir(dir) ? await getJson(groupFileUrl(dir, "index.json")) : null;
      if (group && registerGroup({ ...group, dir })) dirs.push(dir);
    }
    S.groupDirs = dirs;
  };
  const groupsRead = st.screen === "task" && !deferred ? readGroups() : null;
  if (!groupsRead) await readGroups();
  if (!shared && !deferred) await applyRoute(st);
  if (carried && S.file === st.scenario) {
    tomlEl.value = carried;
    refreshEditor(); buildParams(); updateSteps();
    S.pendingRun = true;
    toast(t("js-app-toast-opened-advanced", "Opened with the settings you changed in the Advanced view."));
  }
  let booting = bootEngine();
  S.engineReady = booting.catch(() => {});
  loadFieldImportance().then((t) => { S.fieldImportance = t; try { if (Object.keys(t).length && tomlEl && tomlEl.value) buildParams(); } catch { /* no scenario loaded yet */ } });
  booting.catch(() => { /* reported below */ });
  // Real coastlines for the maps (Natural Earth 1:110m land, public domain).
  fetch("data/land.json").then((r) => (r.ok ? r.json() : [])).then((l) => { S.land = l; if (S.heroRedraw) S.heroRedraw(); if (S.run && V.groundTrack(S.run.result)) renderGround(); if (S.run && S.activeTab && VIEW_ID[S.activeTab] === "v-cap") { S.capDirty = true; selectTab(S.activeTab, { url: false }); } }).catch(() => { S.land = []; });
  paintChannels();
  // The native engine's recordings (the engine's own animation, report and exports).
  if (groupsRead) await groupsRead;
  if (deferred) {
    if (entryFor(st.scenario)) await applyRoute(st);
    else { navigate({ screen: "browse", q: st.scenario.replace(/\.toml$/, "").replace(/-/g, " ") }, { replace: true }); toast(t("js-app-toast-no-scenario", "There is no scenario called { $name } here. These are the closest matches.", { name: st.scenario.replace(/\.toml$/, "") })); }
  }
  for (const dir of dirs) {
    const idx = await getJson(`${dir}native/index.json`);
    if (idx) S.nat.set(dir, idx);
  }
  if (S.run) buildTabs(); // the engine's recorded animation and report views, now that their index is in
  try {
    await booting;
  } catch (e) {
    S.mode = "none";
    engineChip();
    updateSteps();
    showError(t("js-app-engine-could-not-start", "The engine could not start: { $reason }. Serve this folder over HTTP (for example { $command }) rather than opening the file directly.", { reason: errorMessage(e), command: "python3 -m http.server" }));
    return;
  }
  engineChip();
  if (shared && !S.embed) {
    route = { screen: "task", scenario: null, tab: null, domain: null, q: "", extra: {} };
    showScreen("task");
    S.file = null; S.shared = true; S.baseToml = shared;
    tomlEl.value = shared;
    paintScenarioHeader(null);
    refreshEditor(); buildParams();
    $("research").open = true; $("source").open = true;
    updateCrumbs();
    if (S.mode === "live") await runScenario();
    else showNotice(t("js-app-notice-shared-needs-live", "This link carries its own scenario, which needs the live engine. Open it on kshana.dev."));
    return;
  }
  if (cfg) for (const [key, val] of Object.entries(cfg.knobs || {})) tomlEl.value = patchScalar(tomlEl.value, key, val);
  if (cfg && Object.keys(cfg.knobs || {}).length) { refreshEditor(); buildParams(); }
  updateSteps();
  // On a task screen the live run now replaces the recorded result, with any change made meanwhile.
  if (route && route.screen === "task" && S.file && (S.mode === "live" || S.pendingRun)) { S.pendingRun = false; await runScenario(); }
}

main();
