// SPDX-License-Identifier: AGPL-3.0-only
// Maritime trust view: the DOM layer. Everything it knows about the data is in lib/trust.mjs.
// Files are read with File.text() in this page; nothing is sent anywhere.
import {
  sniff, parseLines, parseTruth, parseTrustCsv, parseNmeaFixes, buildRun, reasonsAt, epochsAboveOnset,
  stepIndex, describeEpoch, pkshtFor, bandRuns, makeProjection, niceLength, monitorInfo, MAX_BYTES, MAX_BYTES_TEXT, KNOWN_MONITORS,
} from "../lib/trust.mjs";

import { geometryAt, countGeometry, statusKey, classKey, geometryUnder, CLASS_TEXT, UNKNOWN_TEXT } from "../lib/trust-geometry.mjs";
import { getEngine } from "../lib/engine-page.mjs";
import { parseSvgMarkup, sanitizeSvg } from "../lib/svgsafe.mjs";

const $ = (id) => document.getElementById(id);
const NS = "http://www.w3.org/2000/svg";
const BAND_VAR = { calibrating: "var(--b-cal)", nominal: "var(--b-nom)", degraded: "var(--b-deg)", untrusted: "var(--b-unt)" };
const BAND_W = { calibrating: 2, nominal: 2.6, degraded: 3.2, untrusted: 4 };
// The geometry lane (0.36). Status: green good, amber degraded, grey hatched unknown (never good). Deduction class:
// geometry (the sky) in a neutral blue no band uses, environment (the signal) in violet, inconsistency (attack-like)
// in the band's red; so a masked sky and an attack never share a colour.
const GEO_FILL = { good: "var(--b-nom)", degraded: "var(--b-deg)", unknown: "url(#mt-hatch)" };
const CLASS_FILL = { none: "var(--b-cal)", geometry: "var(--g-sky)", environment: "var(--g-env)", inconsistency: "var(--b-unt)" };

function el(tag, attrs, ...kids) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs || {})) { if (v != null) n.setAttribute(k, v); }
  for (const k of kids.flat()) if (k != null) n.append(k.nodeType ? k : document.createTextNode(String(k)));
  return n;
}
function sv(tag, attrs, ...kids) {
  const n = document.createElementNS(NS, tag);
  for (const [k, v] of Object.entries(attrs || {})) { if (v != null) n.setAttribute(k, v); }
  for (const k of kids.flat()) if (k != null) n.append(k.nodeType ? k : document.createTextNode(String(k)));
  return n;
}
const f1 = (x) => (Math.round(x * 10) / 10).toString();

let run = null, cur = 0, playing = false, raf = 0, lastTs = 0, frac = 0;
let onlyBad = false, showTruth = true, hlMonitor = null, hlSet = new Set();
let X = null; // timeline x mapping
const dyn = {}; // elements updated on cursor moves

// ---------- opening files ----------

function setStatus(msg, err) { const s = $("mt-status"); s.textContent = msg; s.classList.toggle("err", !!err); }
function setNotes(list) { const u = $("mt-notes"); u.replaceChildren(...list.map((t) => el("li", {}, t))); }

async function openTexts(items, label, opts = {}) {
  // items: [{name, text}]. Nothing in here may leave the page at "Reading…": every failure is said, with the file name.
  let current = items.length ? items[0].name : "file";
  try {
    const inputs = { demo: opts.demo === true };
    const got = [];
    for (const it of items) {
      current = it.name;
      if (it.text.length > MAX_BYTES) { setStatus(`${it.name}: larger than ${MAX_BYTES_TEXT}. This page reads files up to that size; open an excerpt.`, true); return; }
      const kind = sniff(it.text);
      if (kind === "result") inputs.result = JSON.parse(it.text);
      else if (kind === "lines") { const p = parseLines(it.text); inputs.lines = p.epochs; if (p.skipped) got.push(`${p.skipped} line(s) of ${it.name} were not epochs and were skipped`); }
      else if (kind === "csv") inputs.csv = parseTrustCsv(it.text);
      else if (kind === "nmea") inputs.nmea = parseNmeaFixes(it.text);
      else if (kind === "truth") inputs.truth = parseTruth(it.text);
      else { setStatus(`${it.name}: not a file this view reads (a result JSON, JSON lines, trust.csv, an NMEA log or a truth file).`, true); return; }
      got.push(`${it.name}: ${{ result: "batch result", lines: "JSON lines", csv: "trust.csv", nmea: "NMEA log", truth: "truth file" }[kind]}`);
    }
    const r = buildRun(inputs);
    if (r.error) { setStatus(r.error, true); setNotes(got); return; }
    openRun(r.run);
    setStatus(label || `Opened ${run.epochs.length} epochs (${run.source === "result" ? "batch result" : run.source === "lines" ? "JSON lines" : "trust.csv"}).`);
    setNotes([...got, ...run.notes]);
  } catch (e) {
    setStatus(`${current}: could not be read or drawn (${e && e.message ? e.message : e}).`, true);
  }
}

async function openFiles(files) {
  if (!files || !files.length) return;
  setStatus("Reading…");
  try {
    const items = [];
    for (const f of files) {
      if (f.size > MAX_BYTES) { setStatus(`${f.name}: larger than ${MAX_BYTES_TEXT}. This page reads files up to that size; open an excerpt.`, true); return; }
      items.push({ name: f.name, text: await f.text() });
    }
    await openTexts(items);
  } catch (e) { setStatus(`${files[0].name}: could not be read (${e && e.message ? e.message : e}).`, true); }
}

// ---------- score an NMEA log with the engine (in this browser) ----------
function scoreStatus(msg, err) { const s = $("mt-score-status"); s.textContent = msg; s.classList.toggle("err", !!err); }
async function scoreHere(nmea, nmeaName, truthText, label) {
  try {
    const session = $("mt-session").value;
    if (!session.trim()) { scoreStatus("The session settings are empty. They declare the vessel ([platform] kind = \"vessel\").", true); return; }
    if (nmea.length > 2 * 1024 * 1024) { scoreStatus(`${nmeaName}: larger than 2 MiB. The in-browser scorer takes an excerpt (the kshana receiver-trust command takes a whole log); open an excerpt that holds the five-minute calibration window.`, true); return; }
    scoreStatus("Starting the engine and scoring…");
    const eng = await getEngine();
    if (!eng.available) { scoreStatus(`The engine could not start here (${eng.error}). Opening result files above still works.`, true); return; }
    if (!eng.has("receiver_trust_replay")) { scoreStatus(`This engine build (version ${eng.version}) has no log scorer; it predates this page. The command is kshana receiver-trust.`, true); return; }
    const rep = JSON.parse(await eng.call("receiver_trust_replay", session, nmea));
    if (!rep || !Array.isArray(rep.epochs) || !rep.epochs.length) { scoreStatus(`${nmeaName}: the engine returned no epochs.`, true); return; }
    const items = [{ name: "scored-here.jsonl", text: rep.epochs.map((e) => JSON.stringify(e)).join("\n") }, { name: nmeaName, text: nmea }];
    if (truthText) items.push({ name: "truth.csv", text: truthText });
    await openTexts(items, label || `Scored ${rep.epochs.length.toLocaleString()} epochs of ${nmeaName} with engine ${eng.version}, in this browser.`);
    scoreStatus(`Scored ${rep.epochs.length.toLocaleString()} epochs with engine ${eng.version}: ${Object.entries(rep.summary || {}).filter(([k]) => ["calibrating", "nominal", "degraded", "untrusted"].includes(k)).map(([k, v]) => `${v} ${k}`).join(", ")}. Advisory only.`);
  } catch (e) { scoreStatus(`${nmeaName}: could not be scored (${e && e.message ? e.message : e}).`, true); }
}
async function scoreDemo() {
  scoreStatus("Opening the synthetic demo log…");
  try {
    const [a, b, c] = await Promise.all([fetch("trust/demo/tallinn-helsinki.nmea"), fetch("trust/demo/session.toml"), fetch("trust/demo/tallinn-helsinki.truth.csv")]);
    if (!a.ok || !b.ok || !c.ok) throw new Error("the demo files did not load");
    $("mt-session").value = await b.text();
    await scoreHere(await a.text(), "tallinn-helsinki.nmea", await c.text(), "Synthetic demo log, scored here by the engine. Made-up ferry log and drag-off; text, not a measurement.");
  } catch (e) { scoreStatus(`The demo log could not be opened: ${e.message}.`, true); }
}
async function scoreFile(f) {
  if (!f) return;
  if (f.size > 2 * 1024 * 1024) { scoreStatus(`${f.name}: larger than 2 MiB. The in-browser scorer takes an excerpt that holds the five-minute calibration window.`, true); return; }
  await scoreHere(await f.text(), f.name, null);
}

// ---------- generic receiver-trust run (engine receiver_trust, log inline) ----------
function genStatus(msg, err) { const s = $("mt-gen-status"); s.textContent = msg; s.classList.toggle("err", !!err); }
function saveAs(name, text, mime) {
  const a = el("a", { href: URL.createObjectURL(new Blob([text], { type: mime || "text/plain" })), download: name });
  document.body.append(a); a.click(); a.remove(); setTimeout(() => URL.revokeObjectURL(a.href), 4000);
}
function inlineLog(toml, nmea) {
  if (nmea.includes("'''")) throw new Error("the log contains three single quotes in a row, which cannot be embedded in the settings");
  // the settings name the log by path; the browser has no file system, so the log goes in as text
  if (!/^\s*path\s*=\s*"[^"\n]*"/m.test(toml)) throw new Error("the settings have no [log] path line to replace with the log");
  return toml.replace(/^(\s*)path\s*=\s*"[^"\n]*"/m, (_, sp) => `${sp}text = '''\n${nmea}'''`);
}
async function genRun(nmea, name, label) {
  const out = $("mt-gen-out"); out.replaceChildren();
  try {
    if (nmea.length > 2 * 1024 * 1024) { genStatus(`${name}: larger than 2 MiB. Open an excerpt (the command-line tool takes a whole log).`, true); return; }
    genStatus("Starting the engine and assessing…");
    const eng = await getEngine();
    if (!eng.available) { genStatus(`The engine could not start here (${eng.error}).`, true); return; }
    if (!eng.has("receiver_trust")) { genStatus(`This engine build (version ${eng.version}) has no receiver_trust.`, true); return; }
    const r = JSON.parse(await eng.call("receiver_trust", inlineLog($("mt-gen-toml").value, nmea)));
    const doc = JSON.parse(r.json);
    genStatus(label || `Assessed ${name} with engine ${eng.version}, in this browser.`);
    const st = doc.states || {};
    out.append(el("p", { class: "mt-gate-now" }, r.summary));
    out.append(el("p", { class: "mt-none" }, `Epochs: ${st.nominal_epochs ?? 0} nominal, ${st.degraded_epochs ?? 0} degraded, ${st.untrusted_epochs ?? 0} untrusted after the ${doc.baseline && doc.baseline.calibration_epochs != null ? doc.baseline.calibration_epochs : "?"}-epoch calibration window.`));
    if (Array.isArray(doc.events) && doc.events.length) {
      const t = el("table", { class: "tbl" }, el("thead", {}, el("tr", {}, ["Stated event", "Onset, s", "Outcome", "First alarm, s", "Latency, s"].map((x) => el("th", { scope: "col" }, x)))));
      t.append(el("tbody", {}, doc.events.map((e) => el("tr", {}, el("td", {}, String(e.label ?? "")), el("td", {}, String(e.onset_s ?? "")), el("td", {}, String(e.outcome ?? "")), el("td", {}, e.first_alarm_s == null ? "none" : String(e.first_alarm_s)), el("td", {}, e.latency_s == null ? "none" : String(e.latency_s))))));
      out.append(el("div", { class: "table-scroll" }, t));
    }
    if (typeof r.svg === "string") {
      const root = parseSvgMarkup(r.svg);
      if (root) { sanitizeSvg(root); const box = el("div", { class: "mt-svgbox", role: "img", "aria-label": "The engine's chart of the run: carrier-to-noise density, state and alarms over time" }); box.append(document.importNode(root, true)); out.append(box); }
    }
    const b1 = el("button", { type: "button", class: "mt-chip" }, "Download the result (JSON)"); b1.onclick = () => saveAs("receiver-trust.result.json", r.json, "application/json");
    const b2 = el("button", { type: "button", class: "mt-chip" }, "Download the per-epoch table (CSV)"); b2.onclick = () => saveAs("receiver-trust.csv", r.csv, "text/csv");
    out.append(el("div", { class: "mt-tools" }, b1, b2));
  } catch (e) { genStatus(`${name}: could not be assessed (${e && e.message ? e.message : e}).`, true); }
}
async function genDemo() {
  genStatus("Opening the illustrative example…");
  try {
    const [a, b] = await Promise.all([fetch("trust/generic/session.toml"), fetch("trust/generic/illustrative-jamming.nmea")]);
    if (!a.ok || !b.ok) throw new Error("the example files did not load");
    $("mt-gen-toml").value = await a.text();
    await genRun(await b.text(), "illustrative-jamming.nmea", "Illustrative example: a made-up NMEA log with a made-up jammer from 120 s to 240 s, assessed here by the engine. Text, not a measurement.");
  } catch (e) { genStatus(`The example could not be opened: ${e.message}.`, true); }
}
async function genFile(f) {
  if (!f) return;
  if (f.size > 2 * 1024 * 1024) { genStatus(`${f.name}: larger than 2 MiB. Open an excerpt.`, true); return; }
  if (!$("mt-gen-toml").value.trim()) { try { const r = await fetch("trust/generic/session.toml"); if (r.ok) $("mt-gen-toml").value = await r.text(); } catch (e) { /* stated below */ } }
  await genRun(await f.text(), f.name, null);
}

async function openDemo() {
  setStatus("Opening the synthetic demo…");
  try {
    const [a, b] = await Promise.all([fetch("trust/demo/tallinn-helsinki.result.json"), fetch("trust/demo/tallinn-helsinki.truth.csv")]);
    if (!a.ok || !b.ok) throw new Error("the demo files did not load");
    const ra = await a.text(), tb = await b.text();
    await openTexts([{ name: "tallinn-helsinki.result.json", text: ra }, { name: "tallinn-helsinki.truth.csv", text: tb }],
      "Synthetic demo: a made-up ferry log with a made-up position drag-off, scored by Kshana. Recorded from the engine; the log is text, not a measurement.", { demo: true });
  } catch (e) { setStatus(`The demo could not be opened: ${e.message}.`, true); }
}

async function openGeoDemo() {
  setStatus("Opening the masked-sky demo…");
  try {
    const [a, b] = await Promise.all([fetch("trust/demo/masked-sky.result.json"), fetch("trust/demo/tallinn-helsinki.truth.csv")]);
    if (!a.ok || !b.ok) throw new Error("the demo files did not load");
    await openTexts([{ name: "masked-sky.result.json", text: await a.text() }, { name: "tallinn-helsinki.truth.csv", text: await b.text() }],
      "Synthetic masked-sky demo: the ferry log with the western half of the sky blanked from 600 s (natural degradation, put down to geometry) and the same made-up drag-off from 1500 s (attack-like). Recorded from an engine with the 0.36 geometry; text, not a measurement.", { demo: true });
  } catch (e) { setStatus(`The demo could not be opened: ${e.message}.`, true); }
}

// ---------- drawing ----------

function openRun(r) {
  stop();
  run = r; cur = Math.max(0, r.firstUntrusted >= 0 ? 0 : 0); hlMonitor = null; hlSet = new Set();
  $("mt-run").hidden = false;
  const n = run.epochs.length;
  $("mt-slider").max = String(n - 1);
  $("mt-truth-wrap").hidden = !run.hasTruth;
  drawAdvisory();
  layout(); drawTrack(); drawTimeline(); drawStrips(); drawSettings(); drawLegend();
  $("mt-first-ded").disabled = run.firstDeduction < 0;
  $("mt-first-unt").disabled = run.firstUntrusted < 0;
  $("mt-gate-note").textContent = run.gateDerived
    ? "This run has no gate record. The strip shows where a gate would have withheld the fix: epochs in the untrusted band, held until 30 s after they leave it. Derived here, not read from a gate. A gate is opt-in and adds latency."
    : "The gate of each epoch as the live stream reported it: off, passed or withheld (the fix was marked invalid in the forwarded cycle).";
  setCursor(0, true);
  $("mt-run").scrollIntoView?.({ block: "nearest" });
}

function drawTrack() {
  const svg = $("mt-track-svg");
  svg.replaceChildren();
  svg.setAttribute("viewBox", "0 0 600 600");
  const proj = run.hasPosition ? makeProjection(run.epochs.flatMap((e) => [e.pos, e.truth]).filter(Boolean)) : null;
  $("mt-track-note").textContent = run.hasPosition
    ? "North up, one scale on both axes. The line is where the receiver said the vessel was, coloured by the trust band of each epoch."
    : "This file carries no positions. Add the NMEA log the run came from (or a v1.1 stream with a position) to draw the track.";
  if (!proj) {
    svg.append(sv("text", { x: 300, y: 300, "text-anchor": "middle" }, "No positions in the files opened"));
    dyn.proj = null; $("mt-track-desc").textContent = "No track: the files carry no positions."; return;
  }
  const pad = 36, span = Math.max(proj.widthM, proj.heightM, 1);
  const k = (600 - 2 * pad) / span;
  const px = (p) => { const [e, n] = proj.to(p); return [300 + e * k, 300 - n * k]; };
  dyn.px = px; dyn.proj = proj; dyn.k = k;
  // true track under the reported one
  if (run.hasTruth) {
    const d = run.epochs.filter((e) => e.truth).map((e, i) => { const [x, y] = px(e.truth); return `${i ? "L" : "M"}${f1(x)} ${f1(y)}`; }).join("");
    dyn.truthPath = sv("path", { class: "truth-l", d });
    svg.append(dyn.truthPath);
  }
  dyn.runGroup = sv("g");
  svg.append(dyn.runGroup);
  drawRuns();
  // start and end
  const withPos = run.epochs.filter((e) => e.pos);
  const [sx, sy] = px(withPos[0].pos), [ex, ey] = px(withPos[withPos.length - 1].pos);
  svg.append(sv("circle", { cx: sx, cy: sy, r: 5, fill: "var(--ink)" }), sv("text", { x: sx + 8, y: sy + 4 }, "start"),
    sv("rect", { x: ex - 4.5, y: ey - 4.5, width: 9, height: 9, fill: "var(--ink)" }), sv("text", { x: ex + 8, y: ey + 4 }, "end"));
  // scale bar and north
  const len = niceLength(span * 0.3);
  const lenPx = len * k;
  svg.append(sv("path", { d: `M${pad} 580 h${f1(lenPx)} m0 -4 v8 m0 -4 M${pad} 576 v8`, class: "ax", style: "stroke:var(--ink)" }),
    sv("text", { x: pad, y: 570 }, len >= 1000 ? `${len / 1000} km` : `${len} m`),
    sv("path", { d: "M570 44 v-26 m-5 8 l5 -8 l5 8", class: "ax", style: "stroke:var(--ink)" }), sv("text", { x: 563, y: 58 }, "N"));
  dyn.hlG = sv("g"); svg.append(dyn.hlG);
  dyn.cursorG = sv("g");
  dyn.linkL = sv("line", { stroke: "var(--ink)", "stroke-width": 1.2, "stroke-dasharray": "3 2" });
  dyn.repDot = sv("circle", { r: 7, fill: "none", stroke: "var(--tim)", "stroke-width": 2.5 });
  dyn.truDot = sv("circle", { r: 5, fill: "var(--bg)", stroke: "var(--ink)", "stroke-width": 1.8 });
  dyn.cursorG.append(dyn.linkL, dyn.truDot, dyn.repDot);
  svg.append(dyn.cursorG);
  const nOver = run.epochs.filter((e) => e.state === "untrusted").length;
  $("mt-track-desc").textContent = `Track of ${withPos.length} reported positions, north up. ${nOver} epochs are untrusted.${run.hasTruth ? " A thin grey line shows the true track." : ""}`;
  svg.onpointermove = (ev) => { if (ev.buttons || ev.pointerType === "mouse") trackPointer(ev); };
  svg.onpointerdown = (ev) => { svg.setPointerCapture?.(ev.pointerId); trackPointer(ev); };
}

function drawRuns() {
  dyn.runGroup.replaceChildren();
  for (const r of bandRuns(run, false)) {
    const bad = r.band === "degraded" || r.band === "untrusted";
    const d = r.idx.map((i, j) => { const [x, y] = dyn.px(run.epochs[i].pos); return `${j ? "L" : "M"}${f1(x)} ${f1(y)}`; }).join("");
    const p = sv("path", { d, fill: "none", stroke: BAND_VAR[r.band], "stroke-width": BAND_W[r.band], "stroke-linecap": "round", "stroke-linejoin": "round", class: onlyBad && !bad ? "dim" : null });
    dyn.runGroup.append(p);
  }
}

function trackPointer(ev) {
  if (!dyn.px) return;
  const svg = $("mt-track-svg"), r = svg.getBoundingClientRect();
  const x = ((ev.clientX - r.left) / r.width) * 600, y = ((ev.clientY - r.top) / r.height) * 600;
  let best = -1, bd = Infinity;
  run.epochs.forEach((e, i) => {
    if (!e.pos) return;
    if (onlyBad && e.state !== "degraded" && e.state !== "untrusted") return;
    const [px, py] = dyn.px(e.pos), d = (px - x) ** 2 + (py - y) ** 2;
    if (d < bd) { bd = d; best = i; }
  });
  if (best >= 0) setCursor(best);
}

const TL = { L: 120, R: 890, W: 900, scoreTop: 10, scoreBot: 150 };
// The charts are drawn 1:1 in pixels at the width of their box, so their text stays readable on a phone.
function layout() {
  const w = Math.round($("mt-time-svg").parentElement.clientWidth) || 900;
  TL.W = Math.max(300, w); TL.L = TL.W < 640 ? 92 : 120; TL.R = TL.W - 10;
}
function xOf(t) { return TL.L + ((t - run.t0) / Math.max(1e-9, run.t1 - run.t0)) * (TL.R - TL.L); }
function yOfScore(s) { return TL.scoreBot - (s / 100) * (TL.scoreBot - TL.scoreTop); }

function runsOf(key) {
  // Runs of equal value of key(epoch), as [startIndex, endIndex].
  const out = [];
  let s = 0;
  for (let i = 1; i <= run.epochs.length; i++) {
    if (i === run.epochs.length || key(run.epochs[i]) !== key(run.epochs[s])) { out.push([s, i - 1, key(run.epochs[s])]); s = i; }
  }
  return out;
}
function xEnd(i) { return i + 1 < run.epochs.length ? xOf(run.epochs[i + 1].t_s) : xOf(run.epochs[i].t_s); }

function timeTicks() {
  const span = run.t1 - run.t0;
  const step = [10, 30, 60, 120, 300, 600, 1800, 3600].find((s) => span / s <= 10) || 3600;
  const ticks = [];
  for (let t = Math.ceil(run.t0 / step) * step; t <= run.t1; t += step) ticks.push(t);
  return ticks;
}
const fmtT = (t) => (t >= 120 ? `${Math.round(t / 60)} min` : `${Math.round(t)} s`);

function drawTimeline() {
  const svg = $("mt-time-svg");
  svg.replaceChildren();
  const geo = run.hasGeometry;
  // Spec item 6: the geometry under the band strip, then the cause, then the gate and the marks.
  const stripY = geo ? { band: 160, geo: 178, cause: 196, gate: 214, hl: 232 } : { band: 160, gate: 178, hl: 196 };
  const axisY = stripY.hl + 16;
  const H = axisY + 20;
  svg.setAttribute("viewBox", `0 0 ${TL.W} ${H}`);
  const m = run.model;
  // grid and edges
  for (const v of [0, 100]) svg.append(sv("line", { x1: TL.L, x2: TL.R, y1: yOfScore(v), y2: yOfScore(v), class: "ax" }), sv("text", { x: TL.L - 8, y: yOfScore(v) + 4, "text-anchor": "end" }, String(v)));
  for (const [v, lbl] of [[m.nominal_min, "nominal"], [m.degraded_min, "degraded"]]) {
    svg.append(sv("line", { x1: TL.L, x2: TL.R, y1: yOfScore(v), y2: yOfScore(v), class: "edge" }), sv("text", { x: TL.L - 8, y: yOfScore(v) + 4, "text-anchor": "end" }, `${f1(v)} ${lbl}`));
  }
  svg.querySelectorAll("text").forEach((t) => t.setAttribute("style", "font-size:10px"));
  // events
  for (const ev of run.events) {
    svg.append(sv("line", { x1: xOf(ev.onset_s), x2: xOf(ev.onset_s), y1: TL.scoreTop, y2: axisY - 7, class: "evt" }), sv("text", { x: xOf(ev.onset_s) + 4, y: TL.scoreTop + 10 }, `event: ${ev.label || "onset"}`));
  }
  // score line, broken where there is no score
  let d = "", pen = false;
  run.epochs.forEach((e) => {
    if (e.score == null) { pen = false; return; }
    d += `${pen ? "L" : "M"}${f1(xOf(e.t_s))} ${f1(yOfScore(e.score))}`; pen = true;
  });
  svg.append(sv("path", { class: "score", d }));
  // strips: band, gate, (geometry, cause), highlighted epochs
  svg.append(sv("text", { x: TL.L - 8, y: stripY.band + 9, "text-anchor": "end" }, "band"), sv("text", { x: TL.L - 8, y: stripY.gate + 9, "text-anchor": "end" }, "gate"), sv("text", { x: TL.L - 8, y: stripY.hl + 7, "text-anchor": "end" }, "marked"));
  dyn.bandRects = [];
  for (const [a, b, band] of runsOf((e) => e.state)) {
    const bad = band === "degraded" || band === "untrusted";
    const rc = sv("rect", { x: xOf(run.epochs[a].t_s), y: stripY.band, width: Math.max(1, xEnd(b) - xOf(run.epochs[a].t_s)), height: 12, fill: BAND_VAR[band], class: onlyBad && !bad ? "dim" : null });
    rc.append(sv("title", {}, `${band}, ${fmtT(run.epochs[a].t_s)} to ${fmtT(run.epochs[b].t_s)}`));
    svg.append(rc); dyn.bandRects.push([rc, bad]);
  }
  const GATE = { off: "var(--b-cal)", passed: "var(--b-nom)", withheld: "var(--b-unt)" };
  for (const [a, b, g] of runsOf((e) => e.gate)) {
    const rc = sv("rect", { x: xOf(run.epochs[a].t_s), y: stripY.gate, width: Math.max(1, xEnd(b) - xOf(run.epochs[a].t_s)), height: 12, fill: GATE[g] || GATE.off, opacity: g === "off" ? 0.4 : 1 });
    rc.append(sv("title", {}, `gate ${g}${run.gateDerived ? " (derived)" : ""}, ${fmtT(run.epochs[a].t_s)} to ${fmtT(run.epochs[b].t_s)}`));
    svg.append(rc);
  }
  if (geo) {
    svg.append(sv("text", { x: TL.L - 8, y: stripY.geo + 9, "text-anchor": "end" }, "sky"), sv("text", { x: TL.L - 8, y: stripY.cause + 9, "text-anchor": "end" }, "class"));
    for (const [a, b, k] of runsOf(statusKey)) {
      if (k === "missing") continue;
      const rc = sv("rect", { x: xOf(run.epochs[a].t_s), y: stripY.geo, width: Math.max(1, xEnd(b) - xOf(run.epochs[a].t_s)), height: 12, fill: GEO_FILL[k], class: k === "unknown" ? "mt-unknown" : null });
      rc.append(sv("title", {}, `${k === "unknown" ? UNKNOWN_TEXT : `geometry ${k}`}, ${fmtT(run.epochs[a].t_s)} to ${fmtT(run.epochs[b].t_s)}`));
      svg.append(rc);
    }
    // The most serious class costing points at each epoch: inconsistency, then environment, then geometry.
    for (const [a, b, k] of runsOf(classKey)) {
      if (k === "missing") continue;
      const rc = sv("rect", { x: xOf(run.epochs[a].t_s), y: stripY.cause, width: Math.max(1, xEnd(b) - xOf(run.epochs[a].t_s)), height: 12, fill: CLASS_FILL[k], opacity: k === "none" ? 0.3 : 1 });
      rc.append(sv("title", {}, `${k === "none" ? "no deduction" : CLASS_TEXT[k]}, ${fmtT(run.epochs[a].t_s)} to ${fmtT(run.epochs[b].t_s)}`));
      svg.append(rc);
    }
    // A geometry-class deduction under a more serious class: a thin underline in the geometry colour.
    for (const [a, b, k] of runsOf(geometryUnder)) {
      if (!k) continue;
      const rc = sv("rect", { x: xOf(run.epochs[a].t_s), y: stripY.cause + 9, width: Math.max(1, xEnd(b) - xOf(run.epochs[a].t_s)), height: 3, fill: CLASS_FILL.geometry, class: "mt-geo-under" });
      rc.append(sv("title", {}, `${CLASS_TEXT.geometry} (also costing points), ${fmtT(run.epochs[a].t_s)} to ${fmtT(run.epochs[b].t_s)}`));
      svg.append(rc);
    }
  }
  dyn.hlY = stripY.hl;
  dyn.hlRects = sv("g"); svg.append(dyn.hlRects);
  // time axis
  for (const t of timeTicks()) svg.append(sv("line", { x1: xOf(t), x2: xOf(t), y1: axisY, y2: axisY + 5, class: "ax" }), sv("text", { x: xOf(t), y: axisY + 17, "text-anchor": "middle" }, fmtT(t)));
  dyn.curLine = sv("line", { class: "cur", y1: TL.scoreTop - 4, y2: axisY - 2 });
  svg.append(dyn.curLine);
  svg.onpointerdown = (ev) => { svg.setPointerCapture?.(ev.pointerId); timePointer(ev); };
  svg.onpointermove = (ev) => { if (ev.buttons || ev.pointerType === "mouse") timePointer(ev); };
  svg.onkeydown = (ev) => keyStep(ev);
  svg.setAttribute("aria-valuemax", String(run.epochs.length - 1));
}

function timeToIndex(t) {
  let lo = 0, hi = run.epochs.length - 1;
  while (lo < hi) { const mid = (lo + hi) >> 1; if (run.epochs[mid].t_s < t) lo = mid + 1; else hi = mid; }
  if (lo > 0 && Math.abs(run.epochs[lo - 1].t_s - t) <= Math.abs(run.epochs[lo].t_s - t)) lo--;
  return lo;
}
function timePointer(ev) {
  const svg = ev.currentTarget, r = svg.getBoundingClientRect();
  const x = ((ev.clientX - r.left) / r.width) * TL.W;
  const t = run.t0 + ((x - TL.L) / (TL.R - TL.L)) * (run.t1 - run.t0);
  let i = timeToIndex(Math.min(run.t1, Math.max(run.t0, t)));
  if (onlyBad && run.epochs[i].state !== "degraded" && run.epochs[i].state !== "untrusted") {
    const a = stepIndex(run, i, -1, true), b = stepIndex(run, i, 1, true);
    i = Math.abs(run.epochs[a].t_s - t) <= Math.abs(run.epochs[b].t_s - t) ? a : b;
  }
  setCursor(i);
}
function keyStep(ev) {
  const big = ev.shiftKey ? 10 : 1;
  let i = cur;
  if (ev.key === "ArrowRight" || ev.key === "ArrowUp") for (let k = 0; k < big; k++) i = stepIndex(run, i, 1, onlyBad);
  else if (ev.key === "ArrowLeft" || ev.key === "ArrowDown") for (let k = 0; k < big; k++) i = stepIndex(run, i, -1, onlyBad);
  else if (ev.key === "Home") i = stepIndex(run, -1, 1, onlyBad);
  else if (ev.key === "End") i = stepIndex(run, run.epochs.length, -1, onlyBad);
  else return;
  ev.preventDefault();
  if (i < 0 || i >= run.epochs.length) i = cur;
  setCursor(i);
}

function monitorClass(name) {
  const n = { geometry: 0, environment: 0, inconsistency: 0 };
  for (const e of run.epochs) for (const d of e.deductions) if (d.monitor === name && d.class && d.points > 0) n[d.class]++;
  const best = Object.entries(n).sort((a, b) => b[1] - a[1])[0];
  return best[1] > 0 ? best[0] : null;
}

function drawStrips() {
  const svg = $("mt-strips-svg");
  svg.replaceChildren();
  const rows = run.strips, rowH = 26, H = rows.length * rowH + 22;
  $("mt-strips-note").textContent = run.monitorsRun ? "ratio of statistic to threshold; dashed line is the alarm at 1" : "only monitors seen costing points; ratio over threshold";
  if (!rows.length) { svg.setAttribute("viewBox", "0 0 900 24"); svg.append(sv("text", { x: TL.L, y: 16 }, "No monitor ratios in this file.")); return; }
  svg.setAttribute("viewBox", `0 0 ${TL.W} ${H}`);
  rows.forEach((name, r) => {
    const y0 = r * rowH + 2, top = y0 + 2, bot = y0 + rowH - 6;
    const cap = 3;
    const yv = (v) => bot - (Math.min(cap, Math.max(0, v)) / cap) * (bot - top);
    const lbl = sv("text", { x: TL.L - 14, y: y0 + 15, "text-anchor": "end", class: "rowlbl" }, name);
    lbl.append(sv("title", {}, `${name}: ${monitorInfo(name)}`));
    // The class this monitor's deductions carried most often (0.36), as a small square by its name.
    const cls = monitorClass(name);
    if (cls) svg.append(sv("rect", { x: TL.L - 10, y: y0 + 7, width: 7, height: 7, rx: 1.5, fill: CLASS_FILL[cls], class: "mt-clsdot" }, sv("title", {}, `${name}: ${CLASS_TEXT[cls]}`)));
    svg.append(lbl, sv("line", { x1: TL.L, x2: TL.R, y1: bot, y2: bot, class: "ax" }), sv("line", { x1: TL.L, x2: TL.R, y1: yv(1), y2: yv(1), class: "alarm1" }));
    let d = "", dOver = "", pen = false, penO = false;
    for (const e of run.epochs) {
      const v = e.ratios[name];
      if (typeof v !== "number") { pen = false; penO = false; continue; }
      const x = f1(xOf(e.t_s)), y = f1(yv(v));
      d += `${pen ? "L" : "M"}${x} ${y}`; pen = true;
      if (v >= 1) { dOver += `${penO ? "L" : "M"}${x} ${y}`; penO = true; } else penO = false;
    }
    svg.append(sv("path", { class: "ratio", d }));
    if (dOver) svg.append(sv("path", { class: "ratio over", d: dOver, style: "stroke-width:2" }));
  });
  dyn.stripCur = sv("line", { class: "cur", y1: 0, y2: H - 20 });
  for (const t of timeTicks()) svg.append(sv("text", { x: xOf(t), y: H - 6, "text-anchor": "middle" }, fmtT(t)));
  svg.append(dyn.stripCur);
  svg.onpointerdown = (ev) => { svg.setPointerCapture?.(ev.pointerId); timePointer(ev); };
  svg.onpointermove = (ev) => { if (ev.buttons || ev.pointerType === "mouse") timePointer(ev); };
}

// The advisory statement the file itself carries (every vessel output does, from schema 1.2), verbatim.
function drawAdvisory() {
  const box = $("mt-adv");
  box.replaceChildren();
  if (run.advisory) box.append(el("b", {}, "Advisory statement carried by this file: "), run.advisory);
  else box.append(el("b", {}, "This file carries no advisory statement "), "(older outputs do not). The advisory at the top of this page applies to it all the same.");
}

function drawLegend() {
  const items = [["calibrating", "Calibrating (never scored)"], ["nominal", "Nominal"], ["degraded", "Degraded"], ["untrusted", "Untrusted"]];
  const li = items.map(([b, t]) => el("li", { style: `--c:${BAND_VAR[b]}` }, el("i", {}), t));
  if (run.hasTruth) li.push(el("li", { style: "--c:var(--truth)" }, el("i", { class: "thin" }), "True track (synthetic data only)"));
  if (run.hasGeometry) {
    li.push(el("li", { class: "mt-lg-head" }, "Sky:"), el("li", { style: `--c:${GEO_FILL.good}` }, el("i", {}), "geometry good"), el("li", { style: `--c:${GEO_FILL.degraded}` }, el("i", {}), "geometry degraded"), el("li", {}, el("i", { class: "hatch" }), "geometry unknown (no GSV or GSA; not good)"));
    li.push(el("li", { class: "mt-lg-head" }, "Deduction class:"), el("li", { style: `--c:${CLASS_FILL.geometry}` }, el("i", {}), "geometry: the sky, not the signal"), el("li", { style: `--c:${CLASS_FILL.environment}` }, el("i", {}), "environment: the signal"), el("li", { style: `--c:${CLASS_FILL.inconsistency}` }, el("i", {}), "inconsistency (attack-like)"), el("li", { style: `--c:${CLASS_FILL.geometry}` }, el("i", { class: "thin" }), "underline: geometry also costing points"));
  }
  if (run.demo) li.push(el("li", {}, "In this demo the receiver reports a valid fix throughout (GGA quality 1, RMC status A). The score is what falls."));
  $("mt-legend").replaceChildren(...li);
}

function drawSettings() {
  const m = run.model, box = $("mt-set");
  box.replaceChildren();
  if (m.assumed) box.append(el("p", { class: "mt-none" }, "This stream does not state its score model. The band edges shown are the documented defaults, assumed."));
  const g = el("dl", { class: "mt-setgrid" });
  const add = (k, v) => g.append(el("div", {}, el("dt", {}, k), el("dd", {}, v)));
  add("nominal at or above", f1(m.nominal_min)); add("degraded at or above", f1(m.degraded_min));
  if (typeof m.onset_ratio === "number") add("costs points from ratio", f1(m.onset_ratio));
  if (typeof m.full_ratio === "number") add("full weight at ratio", f1(m.full_ratio));
  if (typeof m.evidence_hold_s === "number") add("evidence hold, s", f1(m.evidence_hold_s));
  box.append(g);
  const c = { nominal: 0, degraded: 0, untrusted: 0, calibrating: 0 };
  for (const e of run.epochs) c[e.state]++;
  const gs = run.geometrySummary;
  const byClass = gs && gs.classGeometry != null ? ` By deduction class: geometry ${gs.classGeometry}, environment ${gs.classEnvironment}, inconsistency ${gs.classInconsistency}.` : "";
  box.append(el("h4", {}, "Epochs"), el("p", { class: "mt-none" }, `${run.epochs.length} in all: ${c.calibrating} calibrating, ${c.nominal} nominal, ${c.degraded} degraded, ${c.untrusted} untrusted.${byClass}`));
  if (m.weights && Object.keys(m.weights).length) {
    const w = el("dl", { class: "mt-setgrid" });
    for (const [k, v] of Object.entries(m.weights).sort((a, b) => b[1] - a[1])) {
      const dt = el("dt", { title: monitorInfo(k) }, k);
      w.append(el("div", {}, dt, el("dd", {}, f1(v))));
    }
    box.append(el("h4", {}, "Weight of each check, points"), w);
  }
  box.append(el("details", { class: "mt-gloss" }, el("summary", {}, "What each check looks at"),
    el("dl", {}, KNOWN_MONITORS.map((m) => [el("dt", {}, m), el("dd", {}, monitorInfo(m))]).flat())));
  if (run.monitorsRun) box.append(el("h4", {}, "Checks that ran"), el("p", { class: "mt-none" }, run.monitorsRun.join(", ")));
  drawGeometrySettings(box);
}

// The geometry thresholds and their provenance, beside the score settings (0.36). The geometry monitor deducts
// only when the label is poor, capped, and never below the floor in force.
function drawGeometrySettings(box) {
  box.append(el("h4", {}, "Geometry ([geometry] settings)"));
  if (!run.hasGeometry) { box.append(el("p", { class: "mt-none" }, "This run carries no geometry: it comes from an engine before 0.36, or from trust.csv. Nothing about the sky is shown, and nothing is shown as good.")); return; }
  const gm = run.geometryModel;
  if (gm && gm.thresholds.length) {
    const g = el("dl", { class: "mt-setgrid" });
    for (const t of gm.thresholds) g.append(el("div", {}, el("dt", { title: t.what }, t.key.split("_").flatMap((w, i) => (i ? [document.createElement("wbr"), "_" + w] : [w]))), el("dd", {}, t.value == null ? "the degraded edge" : String(Number(t.value.toFixed(3))))));
    box.append(g);
  } else box.append(el("p", { class: "mt-none" }, "A live stream does not state the geometry thresholds; the documented defaults apply (poor above HDOP 4 or PDOP 6, or below 5 satellites; at most 15 points, never below the degraded band)."));
  const c = countGeometry(run.epochs);
  box.append(el("p", { class: "mt-none" }, `Sky: ${c.good} good, ${c.degraded} degraded, ${c.unknown} unknown${c.odd ? ` (${c.odd} with a value this page does not know, read as unknown)` : ""}. Label: ${c.label.good} good, ${c.label.fair} fair, ${c.label.poor} poor (only poor costs points). Epochs with a deduction of class geometry ${c.cls.geometry}, environment ${c.cls.environment}, inconsistency ${c.cls.inconsistency}.`));
  if (gm && (gm.provenance.length || gm.classes)) {
    const d = el("details", { class: "mt-gloss" }, el("summary", {}, "Where the thresholds come from, and how deductions are classed"));
    if (gm.provenance.length) d.append(el("dl", {}, gm.provenance.map((p) => [el("dt", {}, p.key), el("dd", {}, p.text)]).flat()));
    if (gm.classes) d.append(el("p", { class: "mt-none" }, gm.classes));
    box.append(d);
  }
}

function drawGeometryNow() {
  const box = $("mt-geo-now"), rows = $("mt-geo-rows"), flags = $("mt-geo-flags");
  const a = geometryAt(run.epochs[cur]);
  box.textContent = a.heading;
  box.className = `mt-geo-now ${a.tone}`;
  rows.replaceChildren(...a.rows.map(([k, v]) => el("div", { class: v.length > 16 ? "wide" : null }, el("dt", {}, k), el("dd", {}, v))));
  flags.replaceChildren(...a.flags.map((f) => el("li", { class: f.kind }, f.text)));
}

// ---------- the cursor ----------

function setCursor(i, quiet) {
  if (!run) return;
  cur = Math.max(0, Math.min(run.epochs.length - 1, i));
  const e = run.epochs[cur];
  const x = xOf(e.t_s);
  dyn.curLine?.setAttribute("x1", x); dyn.curLine?.setAttribute("x2", x);
  dyn.stripCur?.setAttribute("x1", x); dyn.stripCur?.setAttribute("x2", x);
  $("mt-slider").value = String(cur);
  const svg = $("mt-time-svg");
  svg.setAttribute("aria-valuenow", String(cur));
  svg.setAttribute("aria-valuetext", describeEpoch(run, cur));
  $("mt-readout").textContent = `${fmtT(e.t_s)} · ${e.state}${e.score != null ? ` · ${e.score.toFixed(1)}` : ""}`;
  if (!playing) $("mt-live").textContent = describeEpoch(run, cur);
  // track
  if (dyn.px && dyn.repDot) {
    if (e.pos) {
      const [rx, ry] = dyn.px(e.pos);
      dyn.repDot.setAttribute("cx", rx); dyn.repDot.setAttribute("cy", ry); dyn.repDot.style.display = "";
      dyn.repDot.setAttribute("stroke", BAND_VAR[e.state]);
      if (e.truth && showTruth) {
        const [tx, ty] = dyn.px(e.truth);
        dyn.truDot.setAttribute("cx", tx); dyn.truDot.setAttribute("cy", ty); dyn.truDot.style.display = "";
        dyn.linkL.setAttribute("x1", rx); dyn.linkL.setAttribute("y1", ry); dyn.linkL.setAttribute("x2", tx); dyn.linkL.setAttribute("y2", ty); dyn.linkL.style.display = "";
      } else { dyn.truDot.style.display = "none"; dyn.linkL.style.display = "none"; }
    } else { dyn.repDot.style.display = "none"; dyn.truDot.style.display = "none"; dyn.linkL.style.display = "none"; }
  }
  const off = $("mt-offset");
  if (e.offsetM != null && showTruth) off.textContent = `At ${fmtT(e.t_s)} the receiver-reported position is ${e.offsetM < 10 ? e.offsetM.toFixed(1) : Math.round(e.offsetM)} m from where the vessel really was (synthetic truth).`;
  else off.textContent = run.hasTruth && showTruth ? "No true position at this time." : "";
  drawReasons();
  drawGeometryNow();
  const gt = { off: "Off (calibrating)", passed: "Passed: the fix is forwarded unchanged", withheld: "Withheld: the fix would be marked invalid downstream" }[e.gate] || "Off";
  $("mt-gate-now").textContent = `${gt}${run.gateDerived ? " · derived" : ""}`;
  $("mt-pksht").textContent = pkshtFor(e, run);
}

function drawReasons() {
  const e = run.epochs[cur], r = reasonsAt(run, cur), box = $("mt-reasons");
  box.replaceChildren();
  if (r.calibrating) box.append(el("p", { class: "mt-none" }, "Calibrating: the first seconds form the baseline and are never scored."));
  else if (e.score == null) box.append(el("p", { class: "mt-none" }, r.note ? `No score at this epoch: ${r.note}.` : "No score at this epoch."));
  else if (!r.ded.length) box.append(el("p", { class: "mt-none" }, "Nothing was deducted at this epoch. That is not evidence the fix is good: see what the checks cannot see, below."));
  let maxW = 1;
  for (const d of r.ded) maxW = Math.max(maxW, d.weight || d.points);
  for (const d of r.ded) {
    const pct = Math.min(100, (d.points / maxW) * 100);
    const row = el("button", { type: "button", class: "mt-rrow", "aria-pressed": hlMonitor === d.monitor ? "true" : "false", title: `${d.monitor}: ${monitorInfo(d.monitor)} Click to mark where it was above its onset.` },
      el("span", { class: "mt-rname" }, d.monitor, d.class ? el("small", { class: `mt-class ${d.class}`, title: CLASS_TEXT[d.class] }, d.class) : null),
      el("span", { class: "mt-rtrack" }, el("i", { style: `width:${pct}%` }), d.weight ? el("b", { style: `left:${Math.min(100, (d.weight / maxW) * 100)}%` }) : null),
      el("span", { class: "mt-rnum" }, `${d.points.toFixed(1)} pts${d.ratio != null ? ` · ratio ${d.ratio.toFixed(2)}` : ""}${d.weight ? ` · weight ${f1(d.weight)}` : ""}`));
    row.onclick = () => toggleHighlight(d.monitor);
    box.append(row);
  }
  if (r.ded.some((d) => d.class)) box.append(el("p", { class: "mt-rsub" }, "Each deduction carries the engine's class: geometry (the sky), environment (the signal) or inconsistency (attack-like)"));
  if (hlMonitor && !r.ded.some((d) => d.monitor === hlMonitor)) {
    const row = el("button", { type: "button", class: "mt-rrow faint", "aria-pressed": "true" }, el("span", { class: "mt-rname" }, hlMonitor), el("span", {}), el("span", { class: "mt-rnum" }, "marked; no deduction here"));
    row.onclick = () => toggleHighlight(hlMonitor); box.append(row);
  }
  if (r.faint.length) box.append(el("p", { class: "mt-rsub" }, "Ran, cost nothing"), el("ul", { class: "mt-rlist" }, r.faint.map((m) => el("li", { title: monitorInfo(m) }, m))));
  if (r.notRun.length) box.append(el("p", { class: "mt-rsub" }, "Not run (not a pass)"), el("ul", { class: "mt-rlist" }, r.notRun.map((m) => el("li", { title: monitorInfo(m) }, m))));
  else if (!run.monitorsRun) box.append(el("p", { class: "mt-rsub" }, "Which monitors ran is not stated in a live stream; a check absent here may not have run."));
}

function toggleHighlightRedraw() { if (hlMonitor) { const m = hlMonitor; hlMonitor = null; toggleHighlight(m); } }
function toggleHighlight(monitor) {
  hlMonitor = hlMonitor === monitor ? null : monitor;
  hlSet = hlMonitor ? new Set(epochsAboveOnset(run, hlMonitor)) : new Set();
  // strip of marked epochs
  dyn.hlRects.replaceChildren();
  if (hlMonitor) {
    const idx = [...hlSet].sort((a, b) => a - b);
    let s = null, p = null;
    const flush = () => { if (s != null) dyn.hlRects.append(sv("rect", { class: "hl-bar", x: xOf(run.epochs[s].t_s), y: dyn.hlY, width: Math.max(1.5, xEnd(p) - xOf(run.epochs[s].t_s)), height: 8 })); };
    for (const i of idx) { if (s != null && i === p + 1) p = i; else { flush(); s = p = i; } }
    flush();
  }
  // dots on the track
  if (dyn.hlG) {
    dyn.hlG.replaceChildren();
    const idx = [...hlSet].filter((i) => run.epochs[i].pos), stride = Math.max(1, Math.ceil(idx.length / 300));
    idx.forEach((i, j) => { if (j % stride === 0) { const [x, y] = dyn.px(run.epochs[i].pos); dyn.hlG.append(sv("circle", { class: "hl-dot", cx: x, cy: y, r: 3.2 })); } });
  }
  $("mt-live").textContent = hlMonitor ? `${hlMonitor} was above its onset in ${hlSet.size} epochs; they are marked on the timeline and the track.` : "Marks cleared.";
  drawReasons();
}

// ---------- playing ----------

function medianDt() {
  const n = run.epochs.length, d = [];
  for (let i = 1; i < Math.min(n, 200); i++) d.push(run.epochs[i].t_s - run.epochs[i - 1].t_s);
  d.sort((a, b) => a - b);
  return d.length ? d[d.length >> 1] || 1 : 1;
}
function tick(ts) {
  if (!playing) return;
  const dt = (ts - lastTs) / 1000; lastTs = ts;
  const speed = Number($("mt-speed").value) || 1;
  frac += (dt * speed) / medianDt();
  let steps = Math.floor(frac); frac -= steps;
  let i = cur;
  while (steps-- > 0) { const n = stepIndex(run, i, 1, onlyBad); if (n === i) { stop(); break; } i = n; }
  if (i !== cur) setCursor(i);
  if (i >= run.epochs.length - 1) stop();
  else if (playing) raf = requestAnimationFrame(tick);
}
function play() {
  if (!run) return;
  if (cur >= run.epochs.length - 1) setCursor(0);
  playing = true; lastTs = performance.now(); frac = 0;
  $("mt-play").setAttribute("aria-label", "Pause"); $("mt-play").firstElementChild.firstElementChild.setAttribute("href", "#i-pause");
  raf = requestAnimationFrame(tick);
}
function stop() {
  playing = false; cancelAnimationFrame(raf);
  const b = $("mt-play"); b.setAttribute("aria-label", "Play"); b.firstElementChild.firstElementChild.setAttribute("href", "#i-play");
  if (run) $("mt-live").textContent = describeEpoch(run, cur);
}

// ---------- wiring ----------

function applyFilterVisual() {
  if (!run) return;
  drawRuns();
  for (const [rc, bad] of dyn.bandRects || []) rc.classList.toggle("dim", onlyBad && !bad);
  if (onlyBad && run.epochs[cur].state !== "degraded" && run.epochs[cur].state !== "untrusted") {
    const n = stepIndex(run, cur, 1, true);
    setCursor(n !== cur ? n : stepIndex(run, cur, -1, true));
  }
}

function wire() {
  fetch("trust/demo/session.toml").then((r) => (r.ok ? r.text() : "")).then((t) => { if (!$("mt-session").value) $("mt-session").value = t; }).catch(() => {});
  $("mt-score-demo").addEventListener("click", scoreDemo);
  $("mt-gen-demo").addEventListener("click", genDemo);
  $("mt-gen-file").addEventListener("change", (e) => { genFile(e.target.files[0]); e.target.value = ""; });
  fetch("trust/generic/session.toml").then((r) => (r.ok ? r.text() : "")).then((t) => { if (!$("mt-gen-toml").value) $("mt-gen-toml").value = t; }).catch(() => {});
  $("mt-nmea").addEventListener("change", (e) => { scoreFile(e.target.files[0]); e.target.value = ""; });
  $("mt-files").addEventListener("change", (e) => { openFiles([...e.target.files]); e.target.value = ""; });
  $("mt-demo").addEventListener("click", openDemo);
  $("mt-geo-demo").addEventListener("click", openGeoDemo);
  const drop = $("mt-drop");
  for (const ev of ["dragenter", "dragover"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.add("over"); });
  for (const ev of ["dragleave", "drop"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.remove("over"); });
  drop.addEventListener("drop", (e) => openFiles([...(e.dataTransfer?.files || [])]));
  // Replay is motion: with a reduced-motion preference it starts at 1x and says so.
  try { if (matchMedia("(prefers-reduced-motion: reduce)").matches) { $("mt-speed").value = "1"; $("mt-live").textContent = "Reduced motion is preferred, so replay starts at 1x. Use the slider or the arrow keys to move without animation."; } } catch (e) { /* no matchMedia */ }
  $("mt-play").addEventListener("click", () => (playing ? stop() : play()));
  $("mt-slider").addEventListener("input", (e) => { if (playing) stop(); setCursor(Number(e.target.value)); });
  $("mt-first-ded").addEventListener("click", () => { if (run && run.firstDeduction >= 0) { stop(); setCursor(run.firstDeduction); } });
  $("mt-first-unt").addEventListener("click", () => { if (run && run.firstUntrusted >= 0) { stop(); setCursor(run.firstUntrusted); } });
  $("mt-filter").addEventListener("change", (e) => { onlyBad = e.target.checked; applyFilterVisual(); });
  $("mt-truth").addEventListener("change", (e) => {
    showTruth = e.target.checked;
    if (dyn.truthPath) dyn.truthPath.style.display = showTruth ? "" : "none";
    if (run) setCursor(cur);
  });
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
  let rt = 0, lastW = 0;
  addEventListener("resize", () => { clearTimeout(rt); rt = setTimeout(() => {
    if (!run) return;
    const w = Math.round($("mt-time-svg").parentElement.clientWidth);
    if (w === lastW) return; lastW = w;
    layout(); drawTimeline(); drawStrips(); toggleHighlightRedraw(); setCursor(cur);
  }, 120); });
  const demoQ = new URLSearchParams(location.search).get("demo");
  if (demoQ === "1") openDemo(); else if (demoQ === "geometry") openGeoDemo();
}
wire();
