// SPDX-License-Identifier: AGPL-3.0-only
// The tools hub: the DOM layer. Pure parts are in lib/tools35.mjs and lib/tools35-data.mjs; the engine runs through
// lib/engine-page.mjs (the Studio's WebAssembly engine in a worker). Files are read with File.arrayBuffer() in this
// page and nothing is sent anywhere.
import { t, ready, fetchData } from "../lib/t.mjs";
import { getEngine } from "../lib/engine-page.mjs";
import { imuRows } from "../lib/imufit-card.mjs";
import { readScorecard, summaryRows as jtRows, assessability } from "../lib/jammertest-card.mjs";
import { PAGES, FEATURES, CLI_CARDS, AI_QUESTIONS, docsHref } from "../lib/tools35-data.mjs";
import { zip } from "../lib/zip.mjs";
import { exampleFileUrl, packFilesJson, packProblems, parsePublicKey, verdictView, checkEpoch, benchEntries, scenarioKind, BENCH_KINDS, complianceRuns, MAX_COMPLIANCE_RUNS, toBase64, complianceView, statusInfo, osnmaView, OSNMA_STATUS, gstText, ubxLines } from "../lib/tools35.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
function el(tag, attrs, ...kids) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs || {})) if (v != null) n.setAttribute(k, v);
  for (const k of kids.flat()) if (k != null) n.append(k.nodeType ? k : document.createTextNode(String(k)));
  return n;
}
const kb = (n) => (n < 1024 ? `${n} B` : n < 1048576 ? `${(n / 1024).toFixed(1)} kB` : `${(n / 1048576).toFixed(1)} MB`);
const enc = new TextEncoder();
const MAX_FILE = 64 * 1024 * 1024; // the engine's own text limit

// ---------- download ----------
function download(name, data, mime) {
  const blob = new Blob([data], { type: mime || "application/octet-stream" });
  const a = el("a", { href: URL.createObjectURL(blob), download: name });
  document.body.append(a); a.click(); a.remove();
  setTimeout(() => URL.revokeObjectURL(a.href), 4000);
}
const mimeOf = (n) => (/\.json$/.test(n) ? "application/json" : /\.csv$/.test(n) ? "text/csv" : /\.md$/.test(n) ? "text/markdown" : "text/plain");

// ---------- engine ----------
let engine = null;
async function useEngine(need) {
  const status = $("tl-engine");
  status.classList.remove("err");
  if (!engine) { status.textContent = t("js-tools-engine-starting", "Starting the engine in this browser…"); engine = await getEngine(); }
  if (!engine.available) { status.textContent = t("js-tools-engine-unavailable", "The engine could not start here ({ $reason }). Opening files works; running the tools needs WebAssembly.", { reason: engine.error }); status.classList.add("err"); throw new Error("engine unavailable"); }
  status.textContent = t("js-tools-engine-running", "The engine (version { $version }) is running in this browser. Nothing is uploaded.", { version: engine.version });
  if (need && !engine.has(need)) {
    status.textContent = t("js-tools-engine-lacks-status", "This engine build (version { $version }) has no { $need }: it predates the version this tool needs. The command-line equivalent is in the Command line tab.", { version: engine.version, need });
    status.classList.add("err");
    throw new Error(t("js-tools-engine-lacks-error", "This engine build (version { $version }) has no { $need }, so it cannot run this here yet. The recorded results and the command line still work.", { version: engine.version, need }));
  }
  return engine;
}
const fail = (box, e) => box.replaceChildren(el("p", { class: "tl-verdict bad" }, el("b", {}, t("js-tools-did-not-work", "That did not work")), el("p", {}, String(e && e.message ? e.message : e))));
async function readFiles(list) {
  const out = [];
  for (const f of list) {
    if (f.size > MAX_FILE) throw new Error(t("js-tools-file-too-large", "{ $name } is larger than 64 MiB", { name: f.name }));
    out.push({ name: f.name, path: f.webkitRelativePath || f.name, bytes: new Uint8Array(await f.arrayBuffer()) });
  }
  return out;
}
const asText = (f) => new TextDecoder().decode(f.bytes);

// ---------- tabs ----------
// Each tab is [id, a function giving its label], so the label is looked up when the tabs are drawn.
const TABS = [["evidence", () => t("js-tools-tab-evidence", "Evidence packs")], ["bench", () => t("js-tools-tab-bench", "Test bench")], ["compliance", () => t("js-tools-tab-compliance", "Compliance")], ["osnma", () => t("js-tools-tab-osnma", "OSNMA")], ["jammertest", () => t("js-tools-tab-jammertest", "Jammertest")], ["imufit", () => t("js-tools-tab-imufit", "IMU fit")], ["cli", () => t("js-tools-tab-cli", "Command line")], ["ai", () => t("js-tools-tab-ai", "AI assistant")]];
function tabs() {
  const bar = $("tl-tabs");
  for (const [id, label] of TABS) {
    const b = el("button", { type: "button", role: "tab", class: "tl-tab", id: `t-${id}`, "aria-controls": id, "aria-selected": "false", tabindex: "-1" }, label());
    b.onclick = () => select(id, true);
    bar.append(b);
  }
  bar.addEventListener("keydown", (e) => {
    const ids = TABS.map((t) => t[0]), cur = ids.indexOf(location.hash.slice(1)) < 0 ? 0 : ids.indexOf(location.hash.slice(1));
    const next = e.key === "ArrowRight" ? (cur + 1) % ids.length : e.key === "ArrowLeft" ? (cur + ids.length - 1) % ids.length : e.key === "Home" ? 0 : e.key === "End" ? ids.length - 1 : -1;
    if (next >= 0) { e.preventDefault(); select(ids[next], true); $(`t-${ids[next]}`).focus(); }
  });
  addEventListener("hashchange", () => select(location.hash.slice(1) || "evidence", false));
  select(TABS.some((t) => t[0] === location.hash.slice(1)) ? location.hash.slice(1) : "evidence", false);
}
function select(id, push) {
  if (!TABS.some((t) => t[0] === id)) id = "evidence";
  for (const [t] of TABS) { const on = t === id; $(`t-${t}`).setAttribute("aria-selected", String(on)); $(`t-${t}`).tabIndex = on ? 0 : -1; $(t).hidden = !on; }
  if (push && location.hash.slice(1) !== id) history.replaceState(null, "", `#${id}`);
}

// ---------- coverage table ----------
function coverage() {
  const body = $("tl-cov-body");
  for (const f of FEATURES) {
    const studio = f.studio.length
      ? el("ul", { class: "tl-list" }, f.studio.map(([pid, what]) => el("li", {}, el("a", { href: PAGES[pid].href }, PAGES[pid].label), `: ${what}.`)))
      : el("span", { class: "tl-no" }, t("js-tools-not-in-browser", "Not in a browser."), " ", el("a", { href: "tools/#" + (f.card === "marine" || f.card === "telemetry" || f.card === "iq" ? "cli" : "cli") }, t("js-tools-how-to-run", "How to run it")), `. ${f.why}`);
    body.append(el("tr", {}, el("td", {}, f.name), el("td", {}, studio), el("td", {}, el("code", {}, f.cli))));
  }
}

// ---------- command-line cards ----------
function cliCards() {
  const box = $("cli-cards");
  for (const c of CLI_CARDS) {
    const card = el("article", { class: "card tl-cli", id: `cli-${c.id}` }, el("h3", {}, c.title), el("p", {}, c.what), el("p", { class: "tl-why" }, el("b", {}, t("js-tools-why-not-browser", "Why not in a browser:"), " "), c.why));
    for (const cmd of c.commands) {
      const row = el("div", { class: "tl-cmd-row" }, el("pre", { class: "tl-cmd" }, cmd));
      const copy = el("button", { type: "button", class: "tl-copy", "aria-label": t("js-tools-copy-command-aria", "Copy: { $cmd }", { cmd }) }, t("js-tools-copy", "Copy"));
      copy.onclick = async () => { try { await navigator.clipboard.writeText(cmd); copy.textContent = t("js-tools-copied", "Copied"); setTimeout(() => (copy.textContent = t("js-tools-copy", "Copy")), 1500); } catch { copy.textContent = t("js-tools-select-and-copy", "Select and copy"); } };
      row.append(copy); card.append(row);
    }
    for (const [label, file] of c.samples) {
      const d = el("details", { class: "tl-sample" }, el("summary", {}, t("js-tools-sample-output", "Sample output: { $label }", { label })));
      const pre = el("pre", { class: "tl-pre" }, t("js-tools-loading", "Loading…"));
      d.append(el("p", { class: "tl-why" }, t("js-tools-sample-note", "A real output of the command, recorded from the engine on the synthetic demo run. Not a measurement of anything.")), pre);
      d.addEventListener("toggle", async () => { if (d.open && pre.dataset.done !== "1") { try { const r = await fetch("tools/samples/" + file); if (!r.ok) throw new Error(`HTTP ${r.status}`); pre.textContent = await r.text(); pre.dataset.done = "1"; } catch (e) { pre.textContent = t("js-tools-sample-load-failed", "The sample did not load ({ $reason }).", { reason: e.message }); } } });
      card.append(d);
    }
    card.append(el("p", {}, el("a", { href: docsHref(c.docs) }, t("js-tools-read-documentation", "Read the documentation"))));
    box.append(card);
  }
}

// ---------- evidence packs ----------
let pack = null; // { files: [{name, path, bytes}], label }
function setPack(files, label) {
  pack = { files, label };
  $("ev-sel").textContent = t("js-tools-pack-selected", "{ $label }: { $files } ({ $size })", { label, files: files.map((f) => f.path.split("/").slice(-1)[0]).join(", "), size: kb(files.reduce((n, f) => n + f.bytes.length, 0)) });
  $("ev-out").replaceChildren();
}
async function fetchBytes(url) { const r = await fetch(url); if (!r.ok) throw new Error(`${url}: HTTP ${r.status}`); return new Uint8Array(await r.arrayBuffer()); }
async function openExamplePack(bad) {
  try {
    const idx = await (await fetch("tools/examples/evidence/index.json")).json();
    const files = [];
    for (const n of idx.files) files.push({ name: n, path: n, bytes: await fetchBytes(exampleFileUrl("evidence", n)) });
    if (bad) { const f = files.find((x) => x.name === idx.tamper); const b = f.bytes.slice(); b[Math.floor(b.length / 2)] ^= 1; f.bytes = b; }
    setPack(files, bad ? t("js-tools-example-pack-tampered", "Example pack with one byte of epochs.json changed") : t("js-tools-example-pack", "Synthetic example pack"));
    $("ev-key").value = idx.public_key;
    $("ev-out").replaceChildren(el("p", { class: "tl-notice" }, bad ? t("js-tools-example-tampered-note", "One byte of a file in the pack has been changed after signing. Verify it: the check names the file.") : t("js-tools-example-pack-note", "A synthetic pack made by the engine's command line from the demo ferry log with a demonstration key. The key is filled in below; a real signer's key comes from the signer by another route.")));
  } catch (e) { fail($("ev-out"), e); }
}
async function verifyPack() {
  const out = $("ev-out");
  try {
    if (!pack) throw new Error(t("js-tools-choose-pack-first", "Choose the pack's files first."));
    const k = parsePublicKey($("ev-key").value);
    if (k.error) throw new Error(k.error);
    const json = packFilesJson(pack.files);
    const probs = packProblems(json);
    if (probs.length) throw new Error(probs.join("; ") + ".");
    const logFile = $("ev-log").files[0];
    const log = logFile ? new TextDecoder().decode(new Uint8Array(await logFile.arrayBuffer())) : "";
    const e = await useEngine("evidence_verify");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-verifying", "Verifying…")));
    const report = JSON.parse(await e.call("evidence_verify", JSON.stringify(json), k.key, log, $("ev-ts").checked));
    out.replaceChildren(...renderVerify(report, !!k.key));
  } catch (e) { fail(out, e); }
}
function renderVerify(r, pinned) {
  const v = verdictView(r);
  const nodes = [el("div", { class: `tl-verdict ${v.tone}`, role: "status" }, el("b", {}, v.title), el("p", {}, v.text))];
  if (r.signer_fingerprint) nodes.push(el("p", { class: "tl-sel" }, r.signer_pinned ? t("js-tools-fingerprint-pinned", "Signer fingerprint: { $fingerprint } (pinned)", { fingerprint: r.signer_fingerprint }) : t("js-tools-fingerprint-not-pinned", "Signer fingerprint: { $fingerprint } (not pinned: the key the pack names itself)", { fingerprint: r.signer_fingerprint })));
  if (Array.isArray(r.failures) && r.failures.length) nodes.push(el("h4", {}, t("js-tools-what-failed", "What failed")), el("ul", { class: "tl-list" }, r.failures.map((f) => el("li", {}, typeof f === "string" ? f : JSON.stringify(f)))));
  if (Array.isArray(r.checks) && r.checks.length) {
    const tbl = el("table", { class: "tl-checks" }, el("thead", {}, el("tr", {}, [t("js-tools-col-check", "Check"), t("js-tools-col-result", "Result"), t("js-tools-col-detail", "Detail")].map((h) => el("th", { scope: "col" }, h)))));
    const tb = el("tbody", {});
    for (const c of r.checks) {
      const name = c.name || c.check || c.id || "", st = String(c.status || c.result || (c.ok === true ? "pass" : c.ok === false ? "fail" : "")), det = c.detail || c.message || c.note || "";
      tb.append(el("tr", {}, el("td", {}, name), el("td", {}, el("span", { class: `tl-st ${/pass/i.test(st) ? "pass" : /fail/i.test(st) ? "fail" : "skipped"}` }, st)), el("td", {}, det)));
    }
    tbl.append(tb); nodes.push(el("h4", {}, t("js-tools-every-check", "Every check")), tbl);
  }
  if (Array.isArray(r.notes) && r.notes.length) nodes.push(el("h4", {}, t("js-tools-notes", "Notes")), el("ul", { class: "tl-list" }, r.notes.map((n) => el("li", {}, String(n)))));
  nodes.push(el("p", { class: "tl-notice" }, t("js-tools-evidence-disclaimer", "An evidence pack is a technical record of what the engine computed from a stated log under stated settings. It is not a legal opinion, a finding of fact about any event or a certification. A pass says the record is unchanged.")));
  return nodes;
}
async function attachTimestamp() {
  const out = $("ts-out");
  try {
    if (!pack) throw new Error(t("js-tools-choose-pack-first-above", "Choose the pack's files first (above)."));
    const f = $("ts-file").files[0];
    if (!f) throw new Error(t("js-tools-choose-tsr-first", "Choose the timestamp response (.tsr) first."));
    const e = await useEngine("evidence_attach_timestamp");
    const token = toBase64(new Uint8Array(await f.arrayBuffer()));
    const res = JSON.parse(await e.call("evidence_attach_timestamp", JSON.stringify(packFilesJson(pack.files)), token, $("ts-replace").checked));
    const entries = Object.entries(res.files).map(([name, v]) => ({ name, data: typeof v === "string" ? v : atob(v.base64) }));
    out.replaceChildren(el("div", { class: "tl-verdict ok" }, el("b", {}, t("js-tools-token-attached", "Token attached")), el("p", {}, t("js-tools-token-attached-note", "The updated pack is below. The timestamp authority's signature was NOT checked here: run openssl ts -verify."))), el("ul", { class: "tl-list" }, (res.notes || []).map((n) => el("li", {}, String(n)))));
    const z = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-updated-pack", "Download the updated pack (zip)"));
    z.onclick = () => download("evidence-pack-with-timestamp.zip", zip(Object.entries(res.files).map(([name, v]) => ({ name, data: typeof v === "string" ? v : Uint8Array.from(atob(v.base64), (c) => c.charCodeAt(0)) }))), "application/zip");
    out.append(z);
  } catch (e) { fail(out, e); }
}

function wireEvidence() {
  $("ev-files").addEventListener("change", async (e) => { try { setPack(await readFiles([...e.target.files]), t("js-tools-chosen", "Chosen")); } catch (x) { fail($("ev-out"), x); } });
  $("ev-demo").onclick = () => openExamplePack(false);
  $("ev-demo-bad").onclick = () => openExamplePack(true);
  $("ev-run").onclick = verifyPack;
  $("ts-run").onclick = attachTimestamp;
}

// ---------- test bench ----------
async function wireBench() {
  const sel = $("bn-scn");
  try {
    const idx = await (await fetch("scenarios/index.json")).json();
    const names = Object.keys(idx).filter((n) => BENCH_KINDS.includes(scenarioKind(idx[n]))).sort();
    for (const n of names) sel.append(el("option", { value: n }, `${n.replace(/\.toml$/, "")} (${scenarioKind(idx[n])})`));
    sel.dataset.ready = "1";
    sel._text = (n) => idx[n];
  } catch (e) { sel.append(el("option", { value: "" }, t("js-tools-scenario-list-failed", "The scenario list did not load"))); }
  const run = async (toml, stem) => {
    const out = $("bn-out");
    try {
      const ep = checkEpoch($("bn-epoch").value);
      if (ep.error) throw new Error(ep.error);
      const e = await useEngine("bench_export");
      out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-exporting", "Exporting…")));
      const r = JSON.parse(await e.call("bench_export", toml, ep.epoch));
      const entries = benchEntries(r, stem);
      const nodes = [el("div", { class: "tl-verdict ok", role: "status" }, el("b", {}, t("js-tools-bench-files-written", { one: "{ $n } file written to your browser's memory", other: "{ $n } files written to your browser's memory" }, { n: entries.length })), el("p", {}, t("js-tools-bench-note", "Motion and labelled event intervals only. Download them to load into a laboratory simulator.")))];
      const ul = el("ul", { class: "tl-files" });
      for (const f of entries) {
        const li = el("li", {}, el("code", {}, f.name), el("span", { class: "sz" }, kb(enc.encode(f.data).length)));
        const b = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download", "Download")); b.onclick = () => download(f.name, f.data, mimeOf(f.name));
        const d = el("details", { class: "tl-sample" }, el("summary", {}, t("js-tools-preview", "Preview")), el("pre", { class: "tl-pre" }, f.data.split("\n").slice(0, 14).join("\n") + (f.data.split("\n").length > 14 ? "\n…" : "")));
        li.append(b, d); ul.append(li);
      }
      nodes.push(ul);
      const all = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-all-zip", "Download all (zip)")); all.onclick = () => download(`${stem}-bench.zip`, zip(entries.map((f) => ({ name: f.name, data: f.data }))), "application/zip");
      nodes.push(el("div", { class: "tl-row" }, all));
      if (Array.isArray(r.notes) && r.notes.length) nodes.push(el("h4", {}, t("js-tools-notes", "Notes")), el("ul", { class: "tl-list" }, r.notes.map((n) => el("li", {}, String(n)))));
      if (r.notice) nodes.push(el("p", { class: "tl-notice" }, r.notice));
      out.replaceChildren(...nodes);
    } catch (e) { fail(out, e); }
  };
  $("bn-run").onclick = () => { const n = sel.value; if (!n || !sel._text) return fail($("bn-out"), t("js-tools-choose-scenario-first", "Choose a scenario first.")); run(sel._text(n), n.replace(/\.toml$/, "")); };
  $("bn-file").addEventListener("change", async (e) => { const f = e.target.files[0]; if (!f) return; const txt = await f.text(); const k = scenarioKind(txt); if (!BENCH_KINDS.includes(k)) return fail($("bn-out"), t("js-tools-bench-wrong-kind", "{ $name } is a { $kind } scenario. A vehicle trajectory exists for the { $kinds } kinds; other kinds say why they have none.", { name: f.name, kind: k || t("js-tools-unknown", "unknown"), kinds: BENCH_KINDS.join(", ") })); run(txt, f.name.replace(/\.toml$/i, "")); e.target.value = ""; });
}

// ---------- compliance ----------
let cmpFiles = [];
function cmpText(files) { return files.map((f) => ({ name: f.name, text: asText(f) })); }
async function buildCompliance() {
  const out = $("cp-out");
  try {
    const { runs, unusedScenarios } = complianceRuns(cmpText(cmpFiles));
    if (!runs.length) throw new Error(t("js-tools-choose-result-first", "Choose at least one result file (*.result.json) first."));
    if (runs.length > MAX_COMPLIANCE_RUNS) throw new Error(t("js-tools-max-runs", "At most { $max } runs.", { max: MAX_COMPLIANCE_RUNS }));
    const e = await useEngine("compliance_report");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-building-report", "Building the report…")));
    const res = JSON.parse(await e.call("compliance_report", JSON.stringify(runs)));
    const v = complianceView(res.report);
    const nodes = [];
    if (v.statement) nodes.push(el("p", { class: "tl-warn", role: "note" }, v.statement));
    {
      const list = v.runs.map((r) => `${r.label} (${r.kind})`).join(", ");
      nodes.push(el("p", { class: "tl-sel" }, v.engineVersion
        ? t("js-tools-runs-read-engine", { one: "{ $n } run read, by engine { $engine }: { $runs }", other: "{ $n } runs read, by engine { $engine }: { $runs }" }, { n: runs.length, engine: v.engineVersion, runs: list })
        : t("js-tools-runs-read", { one: "{ $n } run read: { $runs }", other: "{ $n } runs read: { $runs }" }, { n: runs.length, runs: list })));
    }
    if (unusedScenarios.length) nodes.push(el("p", { class: "tl-notice" }, t("js-tools-unused-scenarios", "Scenario files with no matching result were not used: { $files }.", { files: unusedScenarios.join(", ") })));
    for (const u of v.unrecognised) nodes.push(el("p", { class: "tl-notice" }, t("js-tools-not-used", "Not used: { $item }", { item: typeof u === "string" ? u : JSON.stringify(u) })));
    for (const f of v.frameworks) {
      const c = f.counts, d = el("details", { class: "tl-sample", open: "" }, el("summary", {}, t("js-tools-framework-summary", "{ $name }: { $evidenced } evidenced, { $partly } partly, { $notEvidenced } not evidenced, { $outOfScope } out of scope", { name: f.name, evidenced: c.evidenced, partly: c["partly-evidenced"], notEvidenced: c["not-evidenced"], outOfScope: c["out-of-scope"] })));
      const tbl = el("table", { class: "tl-checks" }, el("thead", {}, el("tr", {}, [t("js-tools-col-row", "Row"), t("js-tools-col-reference", "Reference"), t("js-tools-col-what-it-asks", "What it asks"), t("js-tools-col-these-runs", "These runs"), t("js-tools-col-what-is-missing", "What is missing"), t("js-tools-col-gap-that-stays", "Gap that stays")].map((h) => el("th", { scope: "col" }, h)))));
      const tb = el("tbody", {});
      for (const r of f.rows) { const st = statusInfo(r.status); tb.append(el("tr", {}, el("td", {}, String(r.id ?? "")), el("td", {}, String(r.reference ?? "")), el("td", {}, String(r.asks ?? "")), el("td", {}, el("b", {}, st.short), el("br", {}), Array.isArray(r.evidenced_capabilities) ? r.evidenced_capabilities.join(", ") : ""), el("td", {}, Array.isArray(r.missing_capabilities) ? r.missing_capabilities.join(", ") : ""), el("td", {}, String(r.gap ?? "")))); }
      tbl.append(tb); d.append(el("div", { class: "table-scroll" }, tbl)); nodes.push(d);
    }
    const dm = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-report-md", "Download the report (Markdown)")); dm.onclick = () => download("compliance-report.compliance.md", res.markdown, "text/markdown");
    const dj = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-report-json", "Download the report (JSON)")); dj.onclick = () => download("compliance-report.compliance.json", JSON.stringify(res.report, null, 2), "application/json");
    nodes.push(el("div", { class: "tl-row" }, dm, dj));
    out.replaceChildren(...nodes);
  } catch (e) { fail(out, e); }
}
async function showMapping(sources) {
  const out = $("cp-out");
  try {
    const e = await useEngine("compliance_mapping");
    const md = await e.call("compliance_mapping", sources);
    const d = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-md", "Download (Markdown)")); d.onclick = () => download(sources ? "compliance-sources.md" : "compliance-mapping.md", md, "text/markdown");
    out.replaceChildren(el("div", { class: "tl-row" }, d), el("pre", { class: "tl-pre", style: "max-height:520px;white-space:pre-wrap" }, md));
  } catch (e) { fail(out, e); }
}
function wireCompliance() {
  const set = (files, label) => { cmpFiles = files; $("cp-sel").textContent = t("js-tools-files-selected", "{ $label }: { $files }", { label, files: files.map((f) => f.name).join(", ") }); $("cp-out").replaceChildren(); };
  $("cp-files").addEventListener("change", async (e) => { try { set(await readFiles([...e.target.files]), t("js-tools-chosen", "Chosen")); } catch (x) { fail($("cp-out"), x); } });
  $("cp-demo").onclick = async () => { try { const idx = await (await fetch("tools/examples/compliance/index.json")).json(); const files = []; for (const n of idx.files) files.push({ name: n, path: n, bytes: await fetchBytes(exampleFileUrl("compliance", n)) }); set(files, t("js-tools-example-runs", "Synthetic example runs")); $("cp-out").replaceChildren(el("p", { class: "tl-notice" }, idx.note)); } catch (x) { fail($("cp-out"), x); } };
  $("cp-run").onclick = buildCompliance;
  $("cp-map").onclick = () => showMapping(false);
  $("cp-src").onclick = () => showMapping(true);
}

// ---------- OSNMA ----------
let osFile = null; // { name, bytes }
function setOs(name, bytes) { osFile = { name, bytes }; $("os-out").replaceChildren(); $("os-sel").textContent = `${name} (${kb(bytes.length)})`; }
function renderOsnma(v) {
  if (v.error) return [el("div", { class: "tl-verdict bad" }, el("b", {}, t("js-tools-not-osnma", "Not an OSNMA result")), el("p", {}, v.error))];
  const tone = v.overall === "authenticated" ? "ok" : v.overall === "failed" ? "bad" : "warn";
  const words = { authenticated: () => t("js-tools-osnma-word-authenticated", "At least one satellite is authenticated and none failed"), failed: () => t("js-tools-osnma-word-failed", "A check on some satellite's data failed"), unavailable: () => t("js-tools-osnma-word-unavailable", "No satellite is authenticated") };
  const word = Object.hasOwn(words, v.overall) ? words[v.overall]() : v.overall;
  const nodes = [];
  nodes.push(el("p", { class: "tl-warn", role: "note" }, v.advisory || t("js-tools-osnma-advisory", "Advisory: this is analysis and monitoring output and not type-approved navigation equipment. The authentication status reported here is not a navigation integrity service and must not be the sole basis for any navigation or safety decision.")));
  nodes.push(el("div", { class: `tl-verdict ${tone}`, role: "status" }, el("b", {}, t("js-tools-osnma-overall", "Overall: { $status }", { status: (OSNMA_STATUS[v.overall] || { label: v.overall }).label })), el("p", {}, [
      `${word}.`,
      v.pages != null ? t("js-tools-osnma-pages-read", { one: "{ $n } page read.", other: "{ $n } pages read." }, { n: v.pages }) : null,
      v.alert ? t("js-tools-osnma-nma-alert", "NMA status { $status }; the system raised an alert message.", { status: v.nmaStatus }) : t("js-tools-osnma-nma-status", "NMA status { $status }.", { status: v.nmaStatus }),
      t("js-tools-osnma-tag-totals", { one: "{ $n } tag: { $authenticated } authenticated, { $failed } failed, { $pending } pending, { $discarded } discarded.", other: "{ $n } tags: { $authenticated } authenticated, { $failed } failed, { $pending } pending, { $discarded } discarded." }, { n: v.tagCount, authenticated: v.totals.authenticated, failed: v.totals.failed, pending: v.totals.pending, discarded: v.totals.discarded }),
    ].filter((x) => x !== null).join(" "))));
  const tbl = el("table", { class: "tl-checks" }, el("caption", { class: "sr" }, t("js-tools-osnma-caption", "Authentication status per satellite")), el("thead", {}, el("tr", {}, [t("js-tools-col-satellite", "Satellite"), t("js-tools-col-status", "Status"), t("js-tools-col-tags", "Tags"), t("js-tools-col-last-auth-tag", "Last authenticated tag (Galileo System Time)"), t("js-tools-col-why-not-auth", "Why not authenticated")].map((h) => el("th", { scope: "col" }, h)))));
  const tb = el("tbody", {});
  for (const s of v.sats) { const st = OSNMA_STATUS[s.status] || { label: s.status, tone: "none" }; const c = s.tags; tb.append(el("tr", {}, el("td", {}, s.sat), el("td", {}, el("span", { class: `tl-st ${st.tone === "ok" ? "pass" : st.tone === "bad" ? "fail" : "skipped"}` }, st.label)), el("td", {}, c ? t("js-tools-osnma-tag-counts", "{ $authenticated } auth, { $failed } failed, { $pending } pending, { $discarded } discarded", { authenticated: c.authenticated, failed: c.failed, pending: c.pending, discarded: c.discarded }) : ""), el("td", {}, gstText(s.lastAuthGst)), el("td", {}, s.reasons.join("; ")))); }
  tbl.append(tb); nodes.push(el("div", { class: "table-scroll" }, tbl));
  if (v.events.length) nodes.push(el("h4", {}, t("js-tools-osnma-events", "What the verifier saw")), el("ul", { class: "tl-list" }, v.events.map((e) => el("li", {}, `${e.kind.replace(/_/g, " ")}${e.count > 1 ? ` (${e.count})` : ""}${e.detail ? `: ${e.detail}` : ""}`))));
  const ul = ubxLines(v.ubx); if (ul.length) nodes.push(el("h4", {}, t("js-tools-ubx-file", "The UBX file")), el("ul", { class: "tl-list" }, ul.map((x) => el("li", {}, x))));
  if (v.pksos) nodes.push(el("p", { class: "tl-sel" }, t("js-tools-trust-monitor-sentence", "Trust-monitor sentence: { $sentence }", { sentence: v.pksos })));
  nodes.push(el("p", { class: "tl-notice" }, t("js-tools-osnma-time-caveat", "Time: every check is relative to the time stamps of the pages given to the verifier, which here come from the data itself and give no protection against replayed old data. Authentication says the data came from the system; it says nothing about the signal it arrived on or the quality of the fix.")));
  return nodes;
}
async function runOsnma() {
  const out = $("os-out");
  try {
    if (!osFile) throw new Error(t("js-tools-choose-file-first", "Choose a file first."));
    const head = new TextDecoder().decode(osFile.bytes.slice(0, 1)).trim();
    if (head === "{") { out.replaceChildren(...renderOsnma(osnmaView(JSON.parse(new TextDecoder().decode(osFile.bytes))))); return; }
    const num = (id) => { const raw = $(id).value.trim(); if (!raw) return NaN; if (!/^\d+$/.test(raw)) throw new Error(t("js-tools-field-whole-number", "{ $field } must be a whole number", { field: id.replace("os-", "") })); return Number(raw); };
    const root = $("os-root").value.trim().toLowerCase();
    if (root && !/^[0-9a-f]{64}$/.test(root)) throw new Error(t("js-tools-merkle-root-format", "The Merkle root is 64 hex digits."));
    const e = await useEngine("osnma_verify");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-verifying", "Verifying…")));
    const nn = (id) => { const v = num(id); return Number.isNaN(v) ? null : v; };
    const keys = $("os-keys").value.split("\n").map((l) => l.trim()).filter(Boolean);
    const json = await e.call("osnma_verify", toBase64(osFile.bytes), $("os-format").value, nn("os-start"), root, keys, nn("os-ref"), nn("os-maxerr"));
    out.replaceChildren(...renderOsnma(osnmaView(JSON.parse(json))));
  } catch (e) { fail(out, e); }
}
function wireOsnma() {
  $("os-file").addEventListener("change", async (e) => { const f = e.target.files[0]; if (f) { if (f.size > MAX_FILE) return fail($("os-out"), t("js-tools-that-file-too-large", "That file is larger than 64 MiB.")); setOs(f.name, new Uint8Array(await f.arrayBuffer())); } });
  let idx = null;
  const index = async () => { if (!idx) { const r = await fetch("tools/examples/osnma/index.json"); if (!r.ok) throw new Error(t("js-tools-osnma-examples-missing", "the synthetic examples are not in this build yet")); idx = await r.json(); } return idx; };
  const pick = async () => { const d = await index(); return d.examples[Number($("os-ex").value)] || d.examples[0]; };
  index().then((d) => $("os-ex").replaceChildren(...d.examples.map((x, n) => el("option", { value: String(n) }, x.file)))).catch(() => { $("os-ex").replaceChildren(el("option", {}, t("js-tools-none-in-build", "none in this build"))); });
  $("os-demo").onclick = async () => {
    try { const d = await index(), x = await pick(); setOs(x.file, await fetchBytes(exampleFileUrl("osnma", x.file))); $("os-keys").value = `${d.public_key}`; $("os-format").value = ""; $("os-out").replaceChildren(el("p", { class: "tl-notice" }, x.note + " " + t("js-tools-osnma-demo-note", "The throwaway public key is filled in; press Verify to run the verifier here, or show the recorded result."))); }
    catch (x) { fail($("os-out"), x); }
  };
  $("os-rec").onclick = async () => {
    try { const x = await pick(); const r = await fetch(exampleFileUrl("osnma", x.expected)); if (!r.ok) throw new Error(t("js-tools-osnma-recorded-failed", "the recorded result did not load")); $("os-out").replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-osnma-recorded-result", "Recorded result of kshana osnma verify --json for { $file }.", { file: x.file }) + " " + x.note), ...renderOsnma(osnmaView(JSON.parse(await r.text())))); }
    catch (x) { fail($("os-out"), x); }
  };
  $("os-run").onclick = runOsnma;
}

// ---------- AI assistant ----------
const AI_IDS = /mcp|docker|cursor|vscode|npx|uvx|brew|scoop|winget|binar|ai/i;
async function wireAi() {
  const card = $("ai-card");
  card.append(el("div", { class: "card-head" }, el("h2", { class: "h3" }, t("js-tools-ai-heading", "Use Kshana from your AI assistant")), el("p", { class: "card-note" }, t("js-tools-ai-intro", "The Kshana MCP server lets an AI assistant run the engine instead of guessing numbers. It runs on your computer; nothing is sent to Kshana. Pick the way that suits your tool."))));
  try {
    const d = await (await fetchData("channels.json")).json();
    const all = (d.channels || []).filter((c) => c && typeof c.id === "string" && c.id !== "browser");
    const grouped = all.some((c) => c.group);
    const GROUPS = [["mcp", t("js-tools-ai-group-mcp", "Install the MCP server for your assistant")], ["integrations", t("js-tools-ai-group-integrations", "Marine, plugin and dashboard integrations")], ["engine", t("js-tools-ai-group-engine", "Install the engine and its libraries")]];
    const lists = grouped
      ? [...GROUPS.map(([g, t]) => [t, all.filter((c) => c.group === g)]), [t("js-tools-ai-more-ways", "More ways to install"), all.filter((c) => c.group && !GROUPS.some(([g]) => g === c.group))]]
      : [[t("js-tools-ai-install-mcp", "Install the MCP server"), all.filter((c) => AI_IDS.test(c.id))], [t("js-tools-ai-other-ways", "Other ways to install Kshana"), all.filter((c) => !AI_IDS.test(c.id))]];
    const safe = (u) => { try { const x = new URL(u, document.baseURI); return x.protocol === "https:" || x.protocol === "http:" || x.protocol === location.protocol ? x.href : null; } catch { return null; } };
    const copyRow = (label, text) => {
      const row = el("div", { class: "tl-cmd-row" }, el("pre", { class: "tl-cmd", "aria-label": label }, text));
      const copy = el("button", { type: "button", class: "tl-copy", "aria-label": t("js-tools-copy-labelled-aria", "Copy { $label }: { $text }", { label, text }) }, t("js-tools-copy", "Copy"));
      copy.onclick = async () => { try { await navigator.clipboard.writeText(text); copy.textContent = t("js-tools-copied", "Copied"); setTimeout(() => (copy.textContent = t("js-tools-copy", "Copy")), 1500); } catch { copy.textContent = t("js-tools-select-and-copy", "Select and copy"); } };
      row.append(copy); return row;
    };
    const draw = (list, title) => {
      if (!list.length) return;
      card.append(el("h4", {}, title));
      const box = el("div", { class: "tl-cards" });
      for (const c of list) {
        const a = el("article", { class: "card tl-cli" }, el("h3", {}, String(c.name || c.id)), el("p", {}, c.audience || ""));
        if (c.requires) a.append(el("p", { class: "tl-why" }, t("js-tools-needs", "Needs: { $requires }", { requires: c.requires })));
        if (c.command) a.append(copyRow(t("js-tools-label-command", "command"), c.command));
        if (c.pinned) a.append(el("p", { class: "tl-why" }, t("js-tools-pinned-to-release", "Pinned to this release:")), copyRow(t("js-tools-label-pinned-command", "pinned command"), c.pinned));
        if (c.note) a.append(el("p", { class: "tl-why" }, c.note));
        if (Array.isArray(c.configs)) c.configs.filter((v) => typeof v === "string").forEach((v, n) => a.append(el("p", { class: "tl-why" }, t("js-tools-settings-example", "Settings example { $n }:", { n: n + 1 })), copyRow(t("js-tools-label-settings-example", "settings example { $n }", { n: n + 1 }), v)));
        const links = [];
        for (const l of Array.isArray(c.links) ? c.links : []) { const h = l && safe(l.url); if (h) links.push(el("a", { class: "tl-linkbtn", href: h, rel: "noopener noreferrer" }, String(l.label || t("js-tools-open", "Open")))); }
        const reg = c.registry && safe(c.registry); if (reg) links.push(el("a", { href: reg, rel: "noopener noreferrer" }, c.registry_label || t("js-tools-open", "Open")));
        const doc = c.docs && (/^https?:/i.test(c.docs) ? safe(c.docs) : c.docs); if (doc) links.push(el("a", { href: doc, rel: "noopener noreferrer" }, c.docs_label || t("js-tools-documentation", "Documentation")));
        if (links.length) a.append(el("p", { class: "tl-links" }, links));
        box.append(a);
      }
      card.append(box);
    };
    for (const [title, list] of lists) draw(list, title);
    if (!all.length) card.append(el("p", { class: "tl-no" }, t("js-tools-ai-none-listed", "No install options are listed in this build.")));
  } catch (e) { card.append(el("p", { class: "tl-no" }, t("js-tools-ai-load-failed", "The install options did not load ({ $reason }). See the documentation for the MCP server.", { reason: e.message }))); }
  card.append(el("h4", {}, t("js-tools-ai-what-to-ask", "What to ask, and which tool answers")), el("div", { class: "table-scroll" }, (() => {
    const tbl = el("table", { class: "tbl" }, el("thead", {}, el("tr", {}, [t("js-tools-col-question", "Question"), t("js-tools-col-tool", "Tool")].map((h) => el("th", { scope: "col" }, h)))));
    tbl.append(el("tbody", {}, AI_QUESTIONS.map(([q, tool]) => el("tr", {}, el("td", {}, q), el("td", {}, el("code", {}, tool))))));
    return tbl;
  })()), el("p", { class: "tl-notice" }, t("js-tools-ai-rule", "The rule for every answer: the assistant runs the engine, and reports what a tool returned with its unit and its evidence tier (validated against an external oracle, or modelled), the scenario, the seed and the engine version, so the run can be repeated. A result's own caveats stay with it. The MCP server reads and writes no files outside one opt-in folder.")), el("p", {}, el("a", { href: docsHref("agents") }, t("js-tools-ai-read-agent-guide", "Read the agent guide")), " · ", el("a", { href: docsHref("mcp") }, t("js-tools-ai-mcp-docs", "MCP server documentation")), " · ", el("a", { href: docsHref("surfaces") }, t("js-tools-ai-where-reachable", "Where each capability is reachable"))));
}

// ---------- telemetry: run it here ----------
function wireTelemetry() {
  const card = $("cli-telemetry");
  if (!card) return;
  const panel = el("div", { class: "tl-tele" }, el("h4", {}, t("js-tools-tele-run-here", "Run it here")),
    el("p", { class: "tl-why" }, t("js-tools-tele-intro", "Turn a result file (session.result.json) or the live JSON lines into one of the formats, in this browser. Needs an engine build that has the telemetry export (0.35 and later with the export); the commands above work everywhere.")));
  const file = el("input", { type: "file", id: "te-file", "aria-label": t("js-tools-tele-file-aria", "Result or JSON-lines file") });
  const fmt = el("select", { id: "te-fmt", "aria-label": t("js-tools-tele-format-aria", "Format") }, [["prometheus", t("js-tools-tele-fmt-prometheus", "Prometheus metrics")], ["cef", t("js-tools-tele-fmt-cef", "Syslog, CEF")], ["leef", t("js-tools-tele-fmt-leef", "Syslog, LEEF")], ["otlp", t("js-tools-tele-fmt-otlp", "OpenTelemetry (OTLP JSON)")], ["mqtt", t("js-tools-tele-fmt-mqtt", "MQTT, Home Assistant discovery (topic, tab, payload)")]].map(([v, l]) => el("option", { value: v }, l)));
  const host = el("input", { type: "text", id: "te-host", value: "ops-gw1", maxlength: "255", spellcheck: "false", "aria-label": t("js-tools-tele-host-aria", "Host name written into syslog events") });
  const all = el("input", { type: "checkbox", id: "te-all" }), pos = el("input", { type: "checkbox", id: "te-pos" });
  const go = el("button", { type: "button", class: "tl-btn" }, t("js-tools-run", "Run"));
  const out = el("div", { class: "tl-out", "aria-live": "polite" });
  go.onclick = async () => {
    try {
      const f = file.files[0]; if (!f) throw new Error(t("js-tools-choose-file-first", "Choose a file first."));
      const text = new TextDecoder().decode(new Uint8Array(await f.arrayBuffer()));
      const e = await useEngine("trust_telemetry");
      const kind = text.trimStart().startsWith("{") && /"epochs"\s*:/.test(text.slice(0, 200000)) ? "result" : "jsonl";
      const res = await e.call("trust_telemetry", text, fmt.value, host.value.trim(), kind, JSON.stringify({ expose_position: pos.checked, syslog_all: all.checked }));
      const name = `trust-telemetry.${fmt.value === "prometheus" ? "prom" : fmt.value === "otlp" ? "json" : fmt.value === "mqtt" ? "mqtt.txt" : "log"}`;
      const d = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download", "Download")); d.onclick = () => download(name, res, "text/plain");
      out.replaceChildren(el("div", { class: "tl-row" }, d), el("pre", { class: "tl-pre" }, res.split("\n").slice(0, 60).join("\n") + (res.split("\n").length > 60 ? "\n…" : "")));
    } catch (x) { fail(out, x); }
  };
  panel.append(el("div", { class: "tl-row" }, file, fmt, el("label", { class: "tl-file2" }, t("js-tools-tele-host", "Host"), host), go),
    el("div", { class: "tl-row" }, el("label", { class: "tl-chk" }, all, " ", t("js-tools-tele-all-events", "One syslog event per epoch (default: one per band change)")), el("label", { class: "tl-chk" }, pos, " ", t("js-tools-tele-include-position", "Include the reported position (off by default)"))),
    el("p", { class: "tl-why" }, t("js-tools-tele-note", "Syslog lines carry no time stamp here (the page reads no clock); the command-line tool stamps them. Prometheus gives the final state. MQTT gives one line per message, the topic then a tab then the payload; nothing is published from here. The text is the same the command prints.")), out);
  card.insertBefore(panel, card.querySelector("p:last-child"));
}

// ---------- Jammertest: the published plan as scheduled truth, a log scored against it ----------
const jt = { cat: null, plans: [], log: null };
function jtSelText() {
  const bits = [jt.cat ? t("js-tools-jt-sel-catalogue", "catalogue { $name }", { name: jt.cat.name }) : t("js-tools-jt-sel-no-catalogue", "no catalogue"), jt.plans.length ? t("js-tools-jt-sel-plans", "{ $n } plan file(s)", { n: jt.plans.length }) : t("js-tools-jt-sel-no-plan", "no plan"), jt.log ? t("js-tools-jt-sel-log", "log { $name } ({ $size })", { name: jt.log.name, size: kb(jt.log.bytes.length) }) : t("js-tools-jt-sel-no-log", "no log")];
  $("jt-sel").textContent = bits.join("; ") + ".";
}
async function jtRead(file) { if (file.size > MAX_FILE) throw new Error(t("js-tools-file-too-large", "{ $name } is larger than 64 MiB", { name: file.name })); return new Uint8Array(await file.arrayBuffer()); }
function jtArgs() {
  const num = (id, what) => { const raw = $(id).value.trim(); const v = Number(raw); if (raw === "" || !Number.isFinite(v)) throw new Error(t("js-tools-must-be-number", "{ $what } must be a number", { what })); return v; };
  const whole = (id, what) => { const v = num(id, what); if (!Number.isInteger(v) || v < 0) throw new Error(t("js-tools-must-be-whole-zero", "{ $what } must be a whole number, 0 for \"not given\"", { what })); return v; };
  if (!jt.cat) throw new Error(t("js-tools-choose-catalogue-first", "Choose the catalogue JSON first."));
  if (!jt.plans.length) throw new Error(t("js-tools-choose-plan-file", "Choose at least one plan file."));
  const dec = new TextDecoder();
  return { catalog: dec.decode(jt.cat.bytes), plans: JSON.stringify(jt.plans.map((p) => dec.decode(p.bytes))), loc: whole("jt-loc", t("js-tools-jt-what-area", "The test area")), year: whole("jt-year", t("js-tools-jt-what-year", "The plan year")), off: num("jt-off", t("js-tools-jt-what-offset", "The offset from UTC")), start: $("jt-start").value.trim(), hold: num("jt-hold", t("js-tools-jt-what-hold", "The recovery hold")), guard: num("jt-guard", t("js-tools-jt-what-guard", "The guard")) };
}
function jtCard(c) {
  const a = assessability(c);
  const tbl = el("table", { class: "tbl" }, el("thead", {}, el("tr", {}, [t("js-tools-col-test", "Test"), t("js-tools-col-name", "Name"), t("js-tools-col-slot", "Slot, s"), t("js-tools-col-outcome", "Outcome"), t("js-tools-col-latency", "Latency, s"), t("js-tools-col-first-monitors", "First monitors"), t("js-tools-col-recovered", "Recovered")].map((h) => el("th", { scope: "col" }, h)))),
    el("tbody", {}, c.tests.map((x) => el("tr", {}, el("th", { scope: "row" }, x.id), el("td", {}, x.name), el("td", {}, t("js-tools-jt-slot-range", "{ $from } to { $to }", { from: x.onsetS ?? "?", to: x.endS ?? "?" })), el("td", {}, x.outcome || t("js-tools-na", "n/a")), el("td", {}, x.latencyS == null ? t("js-tools-na", "n/a") : x.latencyS.toFixed(1)), el("td", {}, x.firstMonitors.join(", ") || t("js-tools-none", "none")), el("td", {}, x.recovered == null ? t("js-tools-na", "n/a") : x.recovered ? t("js-tools-yes", "yes") : t("js-tools-no", "no"))))));
  return [el("p", { class: "tl-notice" }, `${c.label} ${c.baselineContaminated ? t("js-tools-jt-guard-hold-overlap", "Guard { $guard } s, recovery hold { $hold } s. The calibration baseline overlapped a scheduled slot.", { guard: c.options.guardS ?? "?", hold: c.options.recoverHoldS ?? "?" }) : t("js-tools-jt-guard-hold", "Guard { $guard } s, recovery hold { $hold } s.", { guard: c.options.guardS ?? "?", hold: c.options.recoverHoldS ?? "?" })}`), a ? el("p", { class: "tl-warn" }, a) : null,
    el("dl", { class: "tl-kv" }, jtRows(c).map(([k, v]) => el("div", {}, el("dt", {}, k), el("dd", {}, v)))), el("div", { class: "table-scroll" }, tbl)].filter(Boolean);
}
async function jtImport() {
  const out = $("jt-out");
  try {
    const a = jtArgs();
    if (!a.start) throw new Error(t("js-tools-jt-import-needs-start", "Import needs the log's first epoch in UTC (ISO 8601), because the plan is in local time."));
    const e = await useEngine("jammertest_import");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-reading-plan", "Reading the plan…")));
    const r = JSON.parse(await e.call("jammertest_import", a.catalog, a.plans, a.start, a.loc, a.off, a.year));
    const b = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-events-toml", "Download the events (TOML)")); b.onclick = () => download("jammertest-events.toml", r.events_toml, "text/plain");
    out.replaceChildren(el("p", { class: "tl-verdict ok" }, el("b", {}, t("js-tools-jt-events-count", "{ $n } scheduled event(s)", { n: Array.isArray(r.events) ? r.events.length : "?" })), " " + t("js-tools-jt-events-note", "as scheduled truth: planned slots, not recorded on-air times. Not RF: { $nonRf }; outside the log: { $outside }; unknown ids: { $unknown }.", { nonRf: r.skipped_non_rf ?? "?", outside: r.outside_log ?? "?", unknown: Array.isArray(r.unknown_ids) ? r.unknown_ids.length : "?" })), el("div", { class: "tl-row" }, b), el("pre", { class: "tl-pre" }, String(r.events_toml).split("\n").slice(0, 40).join("\n")));
  } catch (x) { fail(out, x); }
}
async function jtScore() {
  const out = $("jt-out");
  try {
    const a = jtArgs();
    if (!jt.log) throw new Error(t("js-tools-choose-receiver-log", "Choose the receiver log first."));
    const e = await useEngine("jammertest_score");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-scoring", "Scoring…")));
    const json = await e.call("jammertest_score", `[log]\nformat = "${$("jt-format").value}"\n`, toBase64(jt.log.bytes), a.catalog, a.plans, a.loc, a.off, a.start, a.year, a.hold, a.guard);
    const r = readScorecard(json, "the scorecard");
    if (r.error) throw new Error(r.error);
    const b = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-scorecard-json", "Download the scorecard (JSON)")); b.onclick = () => download("jammertest-scorecard.json", json, "application/json");
    out.replaceChildren(el("div", { class: "tl-row" }, b), ...jtCard(r.card));
  } catch (x) { fail(out, x); }
}
// ---------- IMU fit: sensor parameters for the hybrid and fusion scenarios, read off a stationary log ----------
const imuState = { file: null };
const IF_ROW = (r) => el("div", {}, el("dt", {}, r[0]), el("dd", {}, r[1]));
async function imuFit() {
  const out = $("if-out");
  try {
    if (!imuState.file) throw new Error(t("js-tools-choose-imu-log", "Choose a stationary IMU log first."));
    const mean = Number($("if-mean").value);
    if (!Number.isFinite(mean)) throw new Error(t("js-tools-imu-mean-not-number", "The specific force at rest is not a number (0 for a horizontal axis, about 9.80665 for the vertical one)."));
    const e = await useEngine("imu_fit");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-fitting", "Fitting…")));
    const r = JSON.parse(await e.call("imu_fit", new TextDecoder().decode(imuState.file.bytes), $("if-format").value, $("if-axis").value, mean, $("if-id").value.trim()));
    const fit = r.fit && typeof r.fit === "object" ? r.fit : {};
    const rows = imuRows(fit);
    const d = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-table-toml", "Download the table (TOML)")); d.onclick = () => download(`${$("if-id").value.trim() || "imu"}.accel-classical.toml`, r.toml, "text/plain");
    const dj = el("button", { type: "button", class: "tl-btn" }, t("js-tools-download-whole-report-json", "Download the whole report (JSON)")); dj.onclick = () => download("imu-fit.json", JSON.stringify(r, null, 2), "application/json");
    out.replaceChildren(el("p", { class: "tl-notice" }, t("js-tools-imu-notice", "{ $evidence }: the estimator is checked on synthetic white-noise logs with known coefficients, not against an external oracle. The table names the log's SHA-256 ({ $sha }…).", { evidence: r.evidence || "MODELLED", sha: String(r.sha256).slice(0, 12) })),
      rows.length ? el("dl", { class: "tl-kv" }, rows.map(IF_ROW)) : null, el("div", { class: "tl-row" }, d, dj), el("pre", { class: "tl-pre" }, String(r.toml)));
  } catch (x) { fail(out, x); }
}
function wireImuFit() {
  $("if-file").addEventListener("change", async (ev) => {
    const f = ev.target.files[0]; ev.target.value = ""; if (!f) return;
    try {
      if (f.size > 32 * 1024 * 1024) throw new Error(t("js-tools-imu-file-too-large", "{ $name } is larger than 32 MiB; open an excerpt.", { name: f.name }));
      imuState.file = { name: f.name, bytes: new Uint8Array(await f.arrayBuffer()) };
      if (/imu0|euroc|data\.csv/i.test(f.name)) $("if-format").value = "euroc";
      $("if-sel").textContent = t("js-tools-imu-selected", "{ $name } ({ $size }), read here, never uploaded.", { name: f.name, size: `${(f.size / 1024).toFixed(1)} kB` });
    } catch (x) { fail($("if-out"), x); }
  });
  $("if-axis").addEventListener("change", () => { $("if-mean").value = $("if-axis").value === "z" ? "9.80665" : "0"; });
  $("if-run").onclick = imuFit;
}
function wireJammertest() {
  const set = async (id, fn) => $(id).addEventListener("change", async (ev) => { try { await fn([...ev.target.files]); jtSelText(); } catch (x) { fail($("jt-out"), x); } ev.target.value = ""; });
  set("jt-cat", async (fs) => { if (fs[0]) jt.cat = { name: fs[0].name, bytes: await jtRead(fs[0]) }; });
  set("jt-plans", async (fs) => { jt.plans = []; for (const f of fs) jt.plans.push({ name: f.name, bytes: await jtRead(f) }); });
  set("jt-log", async (fs) => { if (fs[0]) { jt.log = { name: fs[0].name, bytes: await jtRead(fs[0]) }; const n = fs[0].name.toLowerCase(); if (/\.ubx$/.test(n)) $("jt-format").value = "ubx"; else if (/\.sbf$/.test(n)) $("jt-format").value = "sbf"; else if (/\.(rnx|obs|\d\d o)$/.test(n.replace(/\s/g, ""))) $("jt-format").value = "rinex"; } });
  $("jt-import").onclick = jtImport; $("jt-score").onclick = jtScore;
}

function init() {
  tabs(); coverage(); cliCards(); wireEvidence(); wireBench(); wireCompliance(); wireOsnma(); wireJammertest(); wireImuFit(); wireAi(); wireTelemetry();
}
init();
