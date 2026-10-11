// SPDX-License-Identifier: AGPL-3.0-only
// The tools hub: the DOM layer. Pure parts are in lib/tools35.mjs and lib/tools35-data.mjs; the engine runs through
// lib/engine-page.mjs (the Studio's WebAssembly engine in a worker). Files are read with File.arrayBuffer() in this
// page and nothing is sent anywhere.
import { getEngine } from "../lib/engine-page.mjs";
import { PAGES, FEATURES, CLI_CARDS, AI_QUESTIONS, docsHref } from "../lib/tools35-data.mjs";
import { zip } from "../lib/zip.mjs";
import { packFilesJson, packProblems, parsePublicKey, verdictView, checkEpoch, benchEntries, scenarioKind, BENCH_KINDS, complianceRuns, MAX_COMPLIANCE_RUNS, toBase64, complianceView, statusInfo, osnmaView, OSNMA_STATUS, gstText, ubxLines } from "../lib/tools35.mjs";

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
  if (!engine) { status.textContent = "Starting the engine in this browser…"; engine = await getEngine(); }
  if (!engine.available) { status.textContent = `The engine could not start here (${engine.error}). Opening files works; running the tools needs WebAssembly.`; status.classList.add("err"); throw new Error("engine unavailable"); }
  status.textContent = `The engine (version ${engine.version}) is running in this browser. Nothing is uploaded.`;
  if (need && !engine.has(need)) {
    status.textContent = `This engine build (version ${engine.version}) has no ${need}: it predates the version this tool needs. The command-line equivalent is in the Command line tab.`;
    status.classList.add("err");
    throw new Error(`This engine build (version ${engine.version}) has no ${need}, so it cannot run this here yet. The recorded results and the command line still work.`);
  }
  return engine;
}
const fail = (box, e) => box.replaceChildren(el("p", { class: "tl-verdict bad" }, el("b", {}, "That did not work"), el("p", {}, String(e && e.message ? e.message : e))));
async function readFiles(list) {
  const out = [];
  for (const f of list) {
    if (f.size > MAX_FILE) throw new Error(`${f.name} is larger than 64 MiB`);
    out.push({ name: f.name, path: f.webkitRelativePath || f.name, bytes: new Uint8Array(await f.arrayBuffer()) });
  }
  return out;
}
const asText = (f) => new TextDecoder().decode(f.bytes);

// ---------- tabs ----------
const TABS = [["evidence", "Evidence packs"], ["bench", "Test bench"], ["compliance", "Compliance"], ["osnma", "OSNMA"], ["cli", "Command line"], ["ai", "AI assistant"]];
function tabs() {
  const bar = $("tl-tabs");
  for (const [id, label] of TABS) {
    const b = el("button", { type: "button", role: "tab", class: "tl-tab", id: `t-${id}`, "aria-controls": id, "aria-selected": "false", tabindex: "-1" }, label);
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
      : el("span", { class: "tl-no" }, "Not in a browser. ", el("a", { href: "tools/#" + (f.card === "marine" || f.card === "telemetry" || f.card === "iq" ? "cli" : "cli") }, "How to run it"), `. ${f.why}`);
    body.append(el("tr", {}, el("td", {}, f.name), el("td", {}, studio), el("td", {}, el("code", {}, f.cli))));
  }
}

// ---------- command-line cards ----------
function cliCards() {
  const box = $("cli-cards");
  for (const c of CLI_CARDS) {
    const card = el("article", { class: "card tl-cli", id: `cli-${c.id}` }, el("h3", {}, c.title), el("p", {}, c.what), el("p", { class: "tl-why" }, el("b", {}, "Why not in a browser: "), c.why));
    for (const cmd of c.commands) {
      const row = el("div", { class: "tl-cmd-row" }, el("pre", { class: "tl-cmd" }, cmd));
      const copy = el("button", { type: "button", class: "tl-copy", "aria-label": `Copy: ${cmd}` }, "Copy");
      copy.onclick = async () => { try { await navigator.clipboard.writeText(cmd); copy.textContent = "Copied"; setTimeout(() => (copy.textContent = "Copy"), 1500); } catch { copy.textContent = "Select and copy"; } };
      row.append(copy); card.append(row);
    }
    for (const [label, file] of c.samples) {
      const d = el("details", { class: "tl-sample" }, el("summary", {}, `Sample output: ${label}`));
      const pre = el("pre", { class: "tl-pre" }, "Loading…");
      d.append(el("p", { class: "tl-why" }, "A real output of the command, recorded from the engine on the synthetic demo run. Not a measurement of anything."), pre);
      d.addEventListener("toggle", async () => { if (d.open && pre.dataset.done !== "1") { try { const r = await fetch("tools/samples/" + file); if (!r.ok) throw new Error(`HTTP ${r.status}`); pre.textContent = await r.text(); pre.dataset.done = "1"; } catch (e) { pre.textContent = `The sample did not load (${e.message}).`; } } });
      card.append(d);
    }
    card.append(el("p", {}, el("a", { href: docsHref(c.docs) }, "Read the documentation")));
    box.append(card);
  }
}

// ---------- evidence packs ----------
let pack = null; // { files: [{name, path, bytes}], label }
function setPack(files, label) {
  pack = { files, label };
  $("ev-sel").textContent = `${label}: ${files.map((f) => f.path.split("/").slice(-1)[0]).join(", ")} (${kb(files.reduce((n, f) => n + f.bytes.length, 0))})`;
  $("ev-out").replaceChildren();
}
async function fetchBytes(url) { const r = await fetch(url); if (!r.ok) throw new Error(`${url}: HTTP ${r.status}`); return new Uint8Array(await r.arrayBuffer()); }
async function openExamplePack(bad) {
  try {
    const idx = await (await fetch("tools/examples/evidence/index.json")).json();
    const files = [];
    for (const n of idx.files) files.push({ name: n, path: n, bytes: await fetchBytes("tools/examples/evidence/" + n) });
    if (bad) { const f = files.find((x) => x.name === idx.tamper); const b = f.bytes.slice(); b[Math.floor(b.length / 2)] ^= 1; f.bytes = b; }
    setPack(files, bad ? "Example pack with one byte of epochs.json changed" : "Synthetic example pack");
    $("ev-key").value = idx.public_key;
    $("ev-out").replaceChildren(el("p", { class: "tl-notice" }, bad ? "One byte of a file in the pack has been changed after signing. Verify it: the check names the file." : "A synthetic pack made by the engine's command line from the demo ferry log with a demonstration key. The key is filled in below; a real signer's key comes from the signer by another route."));
  } catch (e) { fail($("ev-out"), e); }
}
async function verifyPack() {
  const out = $("ev-out");
  try {
    if (!pack) throw new Error("Choose the pack's files first.");
    const k = parsePublicKey($("ev-key").value);
    if (k.error) throw new Error(k.error);
    const json = packFilesJson(pack.files);
    const probs = packProblems(json);
    if (probs.length) throw new Error(probs.join("; ") + ".");
    const logFile = $("ev-log").files[0];
    const log = logFile ? new TextDecoder().decode(new Uint8Array(await logFile.arrayBuffer())) : "";
    const e = await useEngine("evidence_verify");
    out.replaceChildren(el("p", { class: "tl-notice" }, "Verifying…"));
    const report = JSON.parse(await e.call("evidence_verify", JSON.stringify(json), k.key, log, $("ev-ts").checked));
    out.replaceChildren(...renderVerify(report, !!k.key));
  } catch (e) { fail(out, e); }
}
function renderVerify(r, pinned) {
  const v = verdictView(r);
  const nodes = [el("div", { class: `tl-verdict ${v.tone}`, role: "status" }, el("b", {}, v.title), el("p", {}, v.text))];
  if (r.signer_fingerprint) nodes.push(el("p", { class: "tl-sel" }, `Signer fingerprint: ${r.signer_fingerprint}${r.signer_pinned ? " (pinned)" : " (not pinned: the key the pack names itself)"}`));
  if (Array.isArray(r.failures) && r.failures.length) nodes.push(el("h4", {}, "What failed"), el("ul", { class: "tl-list" }, r.failures.map((f) => el("li", {}, typeof f === "string" ? f : JSON.stringify(f)))));
  if (Array.isArray(r.checks) && r.checks.length) {
    const t = el("table", { class: "tl-checks" }, el("thead", {}, el("tr", {}, ["Check", "Result", "Detail"].map((h) => el("th", { scope: "col" }, h)))));
    const tb = el("tbody", {});
    for (const c of r.checks) {
      const name = c.name || c.check || c.id || "", st = String(c.status || c.result || (c.ok === true ? "pass" : c.ok === false ? "fail" : "")), det = c.detail || c.message || c.note || "";
      tb.append(el("tr", {}, el("td", {}, name), el("td", {}, el("span", { class: `tl-st ${/pass/i.test(st) ? "pass" : /fail/i.test(st) ? "fail" : "skipped"}` }, st)), el("td", {}, det)));
    }
    t.append(tb); nodes.push(el("h4", {}, "Every check"), t);
  }
  if (Array.isArray(r.notes) && r.notes.length) nodes.push(el("h4", {}, "Notes"), el("ul", { class: "tl-list" }, r.notes.map((n) => el("li", {}, String(n)))));
  nodes.push(el("p", { class: "tl-notice" }, "An evidence pack is a technical record of what the engine computed from a stated log under stated settings. It is not a legal opinion, a finding of fact about any event or a certification. A pass says the record is unchanged."));
  return nodes;
}
async function attachTimestamp() {
  const out = $("ts-out");
  try {
    if (!pack) throw new Error("Choose the pack's files first (above).");
    const f = $("ts-file").files[0];
    if (!f) throw new Error("Choose the timestamp response (.tsr) first.");
    const e = await useEngine("evidence_attach_timestamp");
    const token = toBase64(new Uint8Array(await f.arrayBuffer()));
    const res = JSON.parse(await e.call("evidence_attach_timestamp", JSON.stringify(packFilesJson(pack.files)), token, $("ts-replace").checked));
    const entries = Object.entries(res.files).map(([name, v]) => ({ name, data: typeof v === "string" ? v : atob(v.base64) }));
    out.replaceChildren(el("div", { class: "tl-verdict ok" }, el("b", {}, "Token attached"), el("p", {}, "The updated pack is below. The timestamp authority's signature was NOT checked here: run openssl ts -verify.")), el("ul", { class: "tl-list" }, (res.notes || []).map((n) => el("li", {}, String(n)))));
    const z = el("button", { type: "button", class: "tl-btn" }, "Download the updated pack (zip)");
    z.onclick = () => download("evidence-pack-with-timestamp.zip", zip(Object.entries(res.files).map(([name, v]) => ({ name, data: typeof v === "string" ? v : Uint8Array.from(atob(v.base64), (c) => c.charCodeAt(0)) }))), "application/zip");
    out.append(z);
  } catch (e) { fail(out, e); }
}

function wireEvidence() {
  $("ev-files").addEventListener("change", async (e) => { try { setPack(await readFiles([...e.target.files]), "Chosen"); } catch (x) { fail($("ev-out"), x); } });
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
  } catch (e) { sel.append(el("option", { value: "" }, "The scenario list did not load")); }
  const run = async (toml, stem) => {
    const out = $("bn-out");
    try {
      const ep = checkEpoch($("bn-epoch").value);
      if (ep.error) throw new Error(ep.error);
      const e = await useEngine("bench_export");
      out.replaceChildren(el("p", { class: "tl-notice" }, "Exporting…"));
      const r = JSON.parse(await e.call("bench_export", toml, ep.epoch));
      const entries = benchEntries(r, stem);
      const nodes = [el("div", { class: "tl-verdict ok", role: "status" }, el("b", {}, `${entries.length} files written to your browser's memory`), el("p", {}, "Motion and labelled event intervals only. Download them to load into a laboratory simulator."))];
      const ul = el("ul", { class: "tl-files" });
      for (const f of entries) {
        const li = el("li", {}, el("code", {}, f.name), el("span", { class: "sz" }, kb(enc.encode(f.data).length)));
        const b = el("button", { type: "button", class: "tl-btn" }, "Download"); b.onclick = () => download(f.name, f.data, mimeOf(f.name));
        const d = el("details", { class: "tl-sample" }, el("summary", {}, "Preview"), el("pre", { class: "tl-pre" }, f.data.split("\n").slice(0, 14).join("\n") + (f.data.split("\n").length > 14 ? "\n…" : "")));
        li.append(b, d); ul.append(li);
      }
      nodes.push(ul);
      const all = el("button", { type: "button", class: "tl-btn" }, "Download all (zip)"); all.onclick = () => download(`${stem}-bench.zip`, zip(entries.map((f) => ({ name: f.name, data: f.data }))), "application/zip");
      nodes.push(el("div", { class: "tl-row" }, all));
      if (Array.isArray(r.notes) && r.notes.length) nodes.push(el("h4", {}, "Notes"), el("ul", { class: "tl-list" }, r.notes.map((n) => el("li", {}, String(n)))));
      if (r.notice) nodes.push(el("p", { class: "tl-notice" }, r.notice));
      out.replaceChildren(...nodes);
    } catch (e) { fail(out, e); }
  };
  $("bn-run").onclick = () => { const n = sel.value; if (!n || !sel._text) return fail($("bn-out"), "Choose a scenario first."); run(sel._text(n), n.replace(/\.toml$/, "")); };
  $("bn-file").addEventListener("change", async (e) => { const f = e.target.files[0]; if (!f) return; const t = await f.text(); const k = scenarioKind(t); if (!BENCH_KINDS.includes(k)) return fail($("bn-out"), `${f.name} is a ${k || "unknown"} scenario. A vehicle trajectory exists for the ${BENCH_KINDS.join(", ")} kinds; other kinds say why they have none.`); run(t, f.name.replace(/\.toml$/i, "")); e.target.value = ""; });
}

// ---------- compliance ----------
let cmpFiles = [];
function cmpText(files) { return files.map((f) => ({ name: f.name, text: asText(f) })); }
async function buildCompliance() {
  const out = $("cp-out");
  try {
    const { runs, unusedScenarios } = complianceRuns(cmpText(cmpFiles));
    if (!runs.length) throw new Error("Choose at least one result file (*.result.json) first.");
    if (runs.length > MAX_COMPLIANCE_RUNS) throw new Error(`At most ${MAX_COMPLIANCE_RUNS} runs.`);
    const e = await useEngine("compliance_report");
    out.replaceChildren(el("p", { class: "tl-notice" }, "Building the report…"));
    const res = JSON.parse(await e.call("compliance_report", JSON.stringify(runs)));
    const v = complianceView(res.report);
    const nodes = [];
    if (v.statement) nodes.push(el("p", { class: "tl-warn", role: "note" }, v.statement));
    nodes.push(el("p", { class: "tl-sel" }, `${runs.length} run${runs.length > 1 ? "s" : ""} read${v.engineVersion ? `, by engine ${v.engineVersion}` : ""}: ${v.runs.map((r) => `${r.label} (${r.kind})`).join(", ")}`));
    if (unusedScenarios.length) nodes.push(el("p", { class: "tl-notice" }, `Scenario files with no matching result were not used: ${unusedScenarios.join(", ")}.`));
    for (const u of v.unrecognised) nodes.push(el("p", { class: "tl-notice" }, `Not used: ${typeof u === "string" ? u : JSON.stringify(u)}`));
    for (const f of v.frameworks) {
      const c = f.counts, d = el("details", { class: "tl-sample", open: "" }, el("summary", {}, `${f.name}: ${c.evidenced} evidenced, ${c["partly-evidenced"]} partly, ${c["not-evidenced"]} not evidenced, ${c["out-of-scope"]} out of scope`));
      const t = el("table", { class: "tl-checks" }, el("thead", {}, el("tr", {}, ["Row", "Reference", "What it asks", "These runs", "What is missing", "Gap that stays"].map((h) => el("th", { scope: "col" }, h)))));
      const tb = el("tbody", {});
      for (const r of f.rows) { const st = statusInfo(r.status); tb.append(el("tr", {}, el("td", {}, String(r.id ?? "")), el("td", {}, String(r.reference ?? "")), el("td", {}, String(r.asks ?? "")), el("td", {}, el("b", {}, st.short), el("br", {}), Array.isArray(r.evidenced_capabilities) ? r.evidenced_capabilities.join(", ") : ""), el("td", {}, Array.isArray(r.missing_capabilities) ? r.missing_capabilities.join(", ") : ""), el("td", {}, String(r.gap ?? "")))); }
      t.append(tb); d.append(el("div", { class: "table-scroll" }, t)); nodes.push(d);
    }
    const dm = el("button", { type: "button", class: "tl-btn" }, "Download the report (Markdown)"); dm.onclick = () => download("compliance-report.compliance.md", res.markdown, "text/markdown");
    const dj = el("button", { type: "button", class: "tl-btn" }, "Download the report (JSON)"); dj.onclick = () => download("compliance-report.compliance.json", JSON.stringify(res.report, null, 2), "application/json");
    nodes.push(el("div", { class: "tl-row" }, dm, dj));
    out.replaceChildren(...nodes);
  } catch (e) { fail(out, e); }
}
async function showMapping(sources) {
  const out = $("cp-out");
  try {
    const e = await useEngine("compliance_mapping");
    const md = await e.call("compliance_mapping", sources);
    const d = el("button", { type: "button", class: "tl-btn" }, "Download (Markdown)"); d.onclick = () => download(sources ? "compliance-sources.md" : "compliance-mapping.md", md, "text/markdown");
    out.replaceChildren(el("div", { class: "tl-row" }, d), el("pre", { class: "tl-pre", style: "max-height:520px;white-space:pre-wrap" }, md));
  } catch (e) { fail(out, e); }
}
function wireCompliance() {
  const set = (files, label) => { cmpFiles = files; $("cp-sel").textContent = `${label}: ${files.map((f) => f.name).join(", ")}`; $("cp-out").replaceChildren(); };
  $("cp-files").addEventListener("change", async (e) => { try { set(await readFiles([...e.target.files]), "Chosen"); } catch (x) { fail($("cp-out"), x); } });
  $("cp-demo").onclick = async () => { try { const idx = await (await fetch("tools/examples/compliance/index.json")).json(); const files = []; for (const n of idx.files) files.push({ name: n, path: n, bytes: await fetchBytes("tools/examples/compliance/" + n) }); set(files, "Synthetic example runs"); $("cp-out").replaceChildren(el("p", { class: "tl-notice" }, idx.note)); } catch (x) { fail($("cp-out"), x); } };
  $("cp-run").onclick = buildCompliance;
  $("cp-map").onclick = () => showMapping(false);
  $("cp-src").onclick = () => showMapping(true);
}

// ---------- OSNMA ----------
let osFile = null; // { name, bytes }
function setOs(name, bytes) { osFile = { name, bytes }; $("os-out").replaceChildren(); $("os-sel").textContent = `${name} (${kb(bytes.length)})`; }
function renderOsnma(v) {
  if (v.error) return [el("div", { class: "tl-verdict bad" }, el("b", {}, "Not an OSNMA result"), el("p", {}, v.error))];
  const tone = v.overall === "authenticated" ? "ok" : v.overall === "failed" ? "bad" : "warn";
  const word = { authenticated: "At least one satellite is authenticated and none failed", failed: "A check on some satellite's data failed", unavailable: "No satellite is authenticated" }[v.overall] || v.overall;
  const nodes = [];
  nodes.push(el("p", { class: "tl-warn", role: "note" }, v.advisory || "Advisory: this is analysis and monitoring output and not type-approved navigation equipment. The authentication status reported here is not a navigation integrity service and must not be the sole basis for any navigation or safety decision."));
  nodes.push(el("div", { class: `tl-verdict ${tone}`, role: "status" }, el("b", {}, `Overall: ${(OSNMA_STATUS[v.overall] || { label: v.overall }).label}`), el("p", {}, `${word}. ${v.pages != null ? v.pages + " pages read. " : ""}NMA status ${v.nmaStatus}${v.alert ? "; the system raised an alert message" : ""}. ${v.tagCount} tags: ${v.totals.authenticated} authenticated, ${v.totals.failed} failed, ${v.totals.pending} pending, ${v.totals.discarded} discarded.`)));
  const t = el("table", { class: "tl-checks" }, el("caption", { class: "sr" }, "Authentication status per satellite"), el("thead", {}, el("tr", {}, ["Satellite", "Status", "Tags", "Last authenticated tag (Galileo System Time)", "Why not authenticated"].map((h) => el("th", { scope: "col" }, h)))));
  const tb = el("tbody", {});
  for (const s of v.sats) { const st = OSNMA_STATUS[s.status] || { label: s.status, tone: "none" }; const c = s.tags; tb.append(el("tr", {}, el("td", {}, s.sat), el("td", {}, el("span", { class: `tl-st ${st.tone === "ok" ? "pass" : st.tone === "bad" ? "fail" : "skipped"}` }, st.label)), el("td", {}, c ? `${c.authenticated} auth, ${c.failed} failed, ${c.pending} pending, ${c.discarded} discarded` : ""), el("td", {}, gstText(s.lastAuthGst)), el("td", {}, s.reasons.join("; ")))); }
  t.append(tb); nodes.push(el("div", { class: "table-scroll" }, t));
  if (v.events.length) nodes.push(el("h4", {}, "What the verifier saw"), el("ul", { class: "tl-list" }, v.events.map((e) => el("li", {}, `${e.kind.replace(/_/g, " ")}${e.count > 1 ? ` (${e.count})` : ""}${e.detail ? `: ${e.detail}` : ""}`))));
  const ul = ubxLines(v.ubx); if (ul.length) nodes.push(el("h4", {}, "The UBX file"), el("ul", { class: "tl-list" }, ul.map((x) => el("li", {}, x))));
  if (v.pksos) nodes.push(el("p", { class: "tl-sel" }, `Trust-monitor sentence: ${v.pksos}`));
  nodes.push(el("p", { class: "tl-notice" }, "Time: every check is relative to the time stamps of the pages given to the verifier, which here come from the data itself and give no protection against replayed old data. Authentication says the data came from the system; it says nothing about the signal it arrived on or the quality of the fix."));
  return nodes;
}
async function runOsnma() {
  const out = $("os-out");
  try {
    if (!osFile) throw new Error("Choose a file first.");
    const head = new TextDecoder().decode(osFile.bytes.slice(0, 1)).trim();
    if (head === "{") { out.replaceChildren(...renderOsnma(osnmaView(JSON.parse(new TextDecoder().decode(osFile.bytes))))); return; }
    const num = (id) => { const t = $(id).value.trim(); if (!t) return NaN; if (!/^\d+$/.test(t)) throw new Error(`${id.replace("os-", "")} must be a whole number`); return Number(t); };
    const root = $("os-root").value.trim().toLowerCase();
    if (root && !/^[0-9a-f]{64}$/.test(root)) throw new Error("The Merkle root is 64 hex digits.");
    const e = await useEngine("osnma_verify");
    out.replaceChildren(el("p", { class: "tl-notice" }, "Verifying…"));
    const nn = (id) => { const v = num(id); return Number.isNaN(v) ? null : v; };
    const keys = $("os-keys").value.split("\n").map((l) => l.trim()).filter(Boolean);
    const json = await e.call("osnma_verify", toBase64(osFile.bytes), $("os-format").value, nn("os-start"), root, keys, nn("os-ref"), nn("os-maxerr"));
    out.replaceChildren(...renderOsnma(osnmaView(JSON.parse(json))));
  } catch (e) { fail(out, e); }
}
function wireOsnma() {
  $("os-file").addEventListener("change", async (e) => { const f = e.target.files[0]; if (f) { if (f.size > MAX_FILE) return fail($("os-out"), "That file is larger than 64 MiB."); setOs(f.name, new Uint8Array(await f.arrayBuffer())); } });
  let idx = null;
  const index = async () => { if (!idx) { const r = await fetch("tools/examples/osnma/index.json"); if (!r.ok) throw new Error("the synthetic examples are not in this build yet"); idx = await r.json(); } return idx; };
  const pick = async () => { const d = await index(); return d.examples[Number($("os-ex").value)] || d.examples[0]; };
  index().then((d) => $("os-ex").replaceChildren(...d.examples.map((x, n) => el("option", { value: String(n) }, x.file)))).catch(() => { $("os-ex").replaceChildren(el("option", {}, "none in this build")); });
  $("os-demo").onclick = async () => {
    try { const d = await index(), x = await pick(); setOs(x.file, await fetchBytes("tools/examples/osnma/" + x.file)); $("os-keys").value = `${d.public_key}`; $("os-format").value = ""; $("os-out").replaceChildren(el("p", { class: "tl-notice" }, x.note + " The throwaway public key is filled in; press Verify to run the verifier here, or show the recorded result.")); }
    catch (x) { fail($("os-out"), x); }
  };
  $("os-rec").onclick = async () => {
    try { const x = await pick(); const r = await fetch("tools/examples/osnma/" + x.expected); if (!r.ok) throw new Error("the recorded result did not load"); $("os-out").replaceChildren(el("p", { class: "tl-notice" }, `Recorded result of kshana osnma verify --json for ${x.file}. ${x.note}`), ...renderOsnma(osnmaView(JSON.parse(await r.text())))); }
    catch (x) { fail($("os-out"), x); }
  };
  $("os-run").onclick = runOsnma;
}

// ---------- AI assistant ----------
const AI_IDS = /mcp|docker|cursor|vscode|npx|uvx|brew|scoop|winget|binar|ai/i;
async function wireAi() {
  const card = $("ai-card");
  card.append(el("div", { class: "card-head" }, el("h2", { class: "h3" }, "Use Kshana from your AI assistant"), el("p", { class: "card-note" }, "The Kshana MCP server lets an AI assistant run the engine instead of guessing numbers. It runs on your computer; nothing is sent to Kshana. Pick the way that suits your tool.")));
  try {
    const d = await (await fetch("channels.json")).json();
    const all = (d.channels || []).filter((c) => c && typeof c.id === "string" && c.id !== "browser");
    const grouped = all.some((c) => c.group);
    const GROUPS = [["mcp", "Install the MCP server for your assistant"], ["integrations", "Marine, plugin and dashboard integrations"], ["engine", "Install the engine and its libraries"]];
    const lists = grouped
      ? [...GROUPS.map(([g, t]) => [t, all.filter((c) => c.group === g)]), ["More ways to install", all.filter((c) => c.group && !GROUPS.some(([g]) => g === c.group))]]
      : [["Install the MCP server", all.filter((c) => AI_IDS.test(c.id))], ["Other ways to install Kshana", all.filter((c) => !AI_IDS.test(c.id))]];
    const safe = (u) => { try { const x = new URL(u, document.baseURI); return x.protocol === "https:" || x.protocol === "http:" || x.protocol === location.protocol ? x.href : null; } catch { return null; } };
    const copyRow = (label, text) => {
      const row = el("div", { class: "tl-cmd-row" }, el("pre", { class: "tl-cmd", "aria-label": label }, text));
      const copy = el("button", { type: "button", class: "tl-copy", "aria-label": `Copy ${label}: ${text}` }, "Copy");
      copy.onclick = async () => { try { await navigator.clipboard.writeText(text); copy.textContent = "Copied"; setTimeout(() => (copy.textContent = "Copy"), 1500); } catch { copy.textContent = "Select and copy"; } };
      row.append(copy); return row;
    };
    const draw = (list, title) => {
      if (!list.length) return;
      card.append(el("h4", {}, title));
      const box = el("div", { class: "tl-cards" });
      for (const c of list) {
        const a = el("article", { class: "card tl-cli" }, el("h3", {}, String(c.name || c.id)), el("p", {}, c.audience || ""));
        if (c.requires) a.append(el("p", { class: "tl-why" }, "Needs: " + c.requires));
        if (c.command) a.append(copyRow("command", c.command));
        if (c.pinned) a.append(el("p", { class: "tl-why" }, "Pinned to this release:"), copyRow("pinned command", c.pinned));
        if (c.note) a.append(el("p", { class: "tl-why" }, c.note));
        const links = [];
        for (const l of Array.isArray(c.links) ? c.links : []) { const h = l && safe(l.url); if (h) links.push(el("a", { class: "tl-linkbtn", href: h, rel: "noopener noreferrer" }, String(l.label || "Open"))); }
        const reg = c.registry && safe(c.registry); if (reg) links.push(el("a", { href: reg, rel: "noopener noreferrer" }, c.registry_label || "Open"));
        const doc = c.docs && (/^https?:/i.test(c.docs) ? safe(c.docs) : c.docs); if (doc) links.push(el("a", { href: doc, rel: "noopener noreferrer" }, c.docs_label || "Documentation"));
        if (links.length) a.append(el("p", { class: "tl-links" }, links));
        box.append(a);
      }
      card.append(box);
    };
    for (const [title, list] of lists) draw(list, title);
    if (!all.length) card.append(el("p", { class: "tl-no" }, "No install options are listed in this build."));
  } catch (e) { card.append(el("p", { class: "tl-no" }, `The install options did not load (${e.message}). See the documentation for the MCP server.`)); }
  card.append(el("h4", {}, "What to ask, and which tool answers"), el("div", { class: "table-scroll" }, (() => {
    const t = el("table", { class: "tbl" }, el("thead", {}, el("tr", {}, ["Question", "Tool"].map((h) => el("th", { scope: "col" }, h)))));
    t.append(el("tbody", {}, AI_QUESTIONS.map(([q, tool]) => el("tr", {}, el("td", {}, q), el("td", {}, el("code", {}, tool))))));
    return t;
  })()), el("p", { class: "tl-notice" }, "The rule for every answer: the assistant runs the engine, and reports what a tool returned with its unit and its evidence tier (validated against an external oracle, or modelled), the scenario, the seed and the engine version, so the run can be repeated. A result's own caveats stay with it. The MCP server reads and writes no files outside one opt-in folder."), el("p", {}, el("a", { href: docsHref("agents") }, "Read the agent guide"), " · ", el("a", { href: docsHref("mcp") }, "MCP server documentation"), " · ", el("a", { href: docsHref("surfaces") }, "Where each capability is reachable")));
}

// ---------- telemetry: run it here ----------
function wireTelemetry() {
  const card = $("cli-telemetry");
  if (!card) return;
  const panel = el("div", { class: "tl-tele" }, el("h4", {}, "Run it here"),
    el("p", { class: "tl-why" }, "Turn a result file (session.result.json) or the live JSON lines into one of the formats, in this browser. Needs an engine build that has the telemetry export (0.35 and later with the export); the commands above work everywhere."));
  const file = el("input", { type: "file", id: "te-file", "aria-label": "Result or JSON-lines file" });
  const fmt = el("select", { id: "te-fmt", "aria-label": "Format" }, [["prometheus", "Prometheus metrics"], ["cef", "Syslog, CEF"], ["leef", "Syslog, LEEF"], ["otlp", "OpenTelemetry (OTLP JSON)"]].map(([v, l]) => el("option", { value: v }, l)));
  const host = el("input", { type: "text", id: "te-host", value: "ops-gw1", maxlength: "255", spellcheck: "false", "aria-label": "Host name written into syslog events" });
  const all = el("input", { type: "checkbox", id: "te-all" }), pos = el("input", { type: "checkbox", id: "te-pos" });
  const go = el("button", { type: "button", class: "tl-btn" }, "Run");
  const out = el("div", { class: "tl-out", "aria-live": "polite" });
  go.onclick = async () => {
    try {
      const f = file.files[0]; if (!f) throw new Error("Choose a file first.");
      const text = new TextDecoder().decode(new Uint8Array(await f.arrayBuffer()));
      const e = await useEngine("trust_telemetry");
      const kind = text.trimStart().startsWith("{") && /"epochs"\s*:/.test(text.slice(0, 200000)) ? "result" : "jsonl";
      const res = await e.call("trust_telemetry", text, fmt.value, host.value.trim(), kind, JSON.stringify({ expose_position: pos.checked, syslog_all: all.checked }));
      const name = `trust-telemetry.${fmt.value === "prometheus" ? "prom" : fmt.value === "otlp" ? "json" : "log"}`;
      const d = el("button", { type: "button", class: "tl-btn" }, "Download"); d.onclick = () => download(name, res, "text/plain");
      out.replaceChildren(el("div", { class: "tl-row" }, d), el("pre", { class: "tl-pre" }, res.split("\n").slice(0, 60).join("\n") + (res.split("\n").length > 60 ? "\n…" : "")));
    } catch (x) { fail(out, x); }
  };
  panel.append(el("div", { class: "tl-row" }, file, fmt, el("label", { class: "tl-file2" }, "Host", host), go),
    el("div", { class: "tl-row" }, el("label", { class: "tl-chk" }, all, " One syslog event per epoch (default: one per band change)"), el("label", { class: "tl-chk" }, pos, " Include the reported position (off by default)")),
    el("p", { class: "tl-why" }, "Syslog lines carry no time stamp here (the page reads no clock); the command-line tool stamps them. Prometheus gives the final state. The text is the same the command prints."), out);
  card.insertBefore(panel, card.querySelector("p:last-child"));
}

function init() {
  tabs(); coverage(); cliCards(); wireEvidence(); wireBench(); wireCompliance(); wireOsnma(); wireAi(); wireTelemetry();
}
init();
