// SPDX-License-Identifier: AGPL-3.0-only
// Bridge replay page: the DOM layer. What it decides is in lib/replay.mjs, what it draws is in lib/replay-draw.mjs
// and lib/skydraw.mjs. It fetches only this folder's own bundled files (the demo logs, their scores and sky, the
// coastline); a file the person opens is read here with File.text() and goes nowhere.
import { bandLabel, SPEEDS, DEFAULT_SPEED, makeClock, advance, play, pause, seek, setSpeed, stepBy, stepMark, stateAt, makeView, panelFromTraining, panelFromTrust, coastFor, fmtT } from "../lib/replay.mjs";
import { loadDemo, DEMO_LIST, DEFAULT_PAIR } from "../lib/replay-demos.mjs";
import { SVG_CSS, trackStatic, trackDynamic, stripStatic, stripDynamic, readoutOf, TRACK, STRIP_H } from "../lib/replay-draw.mjs";
import { animatedSvg, framesZip } from "../lib/replay-export.mjs";
import { skyMarkup } from "../lib/skydraw.mjs";
import { parseInstructorLog, MAX_BYTES as TRAIN_MAX } from "../lib/training.mjs";
import { buildRun, MAX_BYTES as TRUST_MAX } from "../lib/trust.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
const NS = "http://www.w3.org/2000/svg";

const S = { clock: makeClock(1), panels: [null, null], views: [null, null], truth: true, coast: true, wide: true, early: false, tMax: 1, last: 0, raf: 0, coastDoc: null, world: [], lastMark: -1 };
const io = { json: async (p) => { const r = await fetch(p); if (!r.ok) throw new Error(`${p} did not load`); return r.json(); }, text: async (p) => { const r = await fetch(p); if (!r.ok) throw new Error(`${p} did not load`); return r.text(); } };

// The titles of the open runs as one phrase: "A and B" (a lone title stands alone).
function titlesOf() { const ts = S.panels.filter(Boolean).map((p) => p.title); return ts.length > 1 ? t("js-replay-titles-and", "{ $a } and { $b }", { a: ts.slice(0, -1).join(", "), b: ts[ts.length - 1] }) : ts[0] || ""; }

function setStatus(msg, err) { const s = $("rpl-status"); s.textContent = msg; s.classList.toggle("err", !!err); }

// The drawing's colours: the Studio's tokens, mapped once (an exported file carries its own).
function injectCss() {
  const st = document.createElement("style");
  st.textContent = `:root{--rp-bg:var(--surface);--rp-ink:var(--ink);--rp-ink2:var(--ink-2);--rp-ink3:var(--ink-3);--rp-line:var(--line);--rp-line2:var(--line-2);--rp-mono:var(--f-mono);--rp-sea:var(--surface-2);--rp-sky:var(--surface-2);
--rp-land:color-mix(in srgb,var(--ink) 11%,var(--surface-2));--rp-landline:color-mix(in srgb,var(--ink) 30%,var(--surface-2));--rp-truth:var(--ink-3);--rp-lost:var(--spf);--rp-ringfill:color-mix(in srgb,var(--tim) 9%,transparent);
--rp-cal:#8A93A8;--rp-nom:var(--itg-card);--rp-deg:var(--nav-card);--rp-unt:var(--int-card);--rp-un:var(--int);--rp-tim:var(--tim);--rp-nav:var(--nav);--rp-spf:var(--spf);--rp-orb:var(--orb)}
@media (prefers-color-scheme:dark){:root:not([data-theme="light"]){--rp-nom:var(--itg);--rp-deg:var(--nav);--rp-unt:var(--int)}}
:root[data-theme="dark"]{--rp-nom:var(--itg);--rp-deg:var(--nav);--rp-unt:var(--int)}
${SVG_CSS}`;
  document.head.append(st);
}

// ---------- the panels' markup ----------

function panelShell(k) {
  const box = $(`rpl-p${k}`);
  box.innerHTML = `
    <div class="card-head"><h2 id="rpl-t${k}" class="h3"></h2><p class="card-note" id="rpl-d${k}"></p></div>
    <div class="rpl-pick">
      <label>${esc(t("js-replay-run", "Run"))} <select class="rpl-sel" id="rpl-s${k}" aria-label="${esc(t("js-replay-run-shown", "Run shown in panel { $n }", { n: k + 1 }))}"></select></label>
      <label class="rpl-open rpl-chip">${esc(t("js-replay-open-file", "Open a file…"))}<input type="file" id="rpl-f${k}" accept=".json,application/json"></label>
    </div>
    <div class="rpl-fig"><svg class="rpl-track" id="rpl-tr${k}" viewBox="0 0 ${TRACK} ${TRACK}" role="img" aria-labelledby="rpl-t${k} rpl-trd${k}"><g class="st"></g><g class="dy"></g></svg></div>
    <p class="sr" id="rpl-trd${k}"></p>
    <svg class="rpl-strip" id="rpl-st${k}" viewBox="0 0 ${TRACK} ${STRIP_H}" role="img" aria-label="${esc(t("js-replay-strip-label", "Trust score over the run"))}"><g class="st"></g><g class="dy"></g></svg>
    <ul class="rpl-legend" aria-label="${esc(t("js-replay-legend", "Legend"))}">
      <li style="--c:var(--rp-nom)"><i></i>${esc(bandLabel("nominal"))}</li><li style="--c:var(--rp-deg)"><i class="w"></i>${esc(bandLabel("degraded"))}</li><li style="--c:var(--rp-unt)"><i class="ww"></i>${esc(bandLabel("untrusted"))}</li><li style="--c:var(--rp-cal)"><i></i>${esc(bandLabel("calibrating"))}</li>
      <li style="--c:var(--rp-truth)"><i class="thin"></i>${esc(t("js-replay-legend-true-track", "true track"))}</li><li style="--c:var(--rp-lost)"><i class="dots"></i>${esc(t("js-replay-legend-no-fix", "no fix"))}</li>
    </ul>
    <div class="rpl-read">
      <div class="rpl-score"><b class="rpl-num" id="rpl-n${k}">–</b><span class="rpl-band" id="rpl-b${k}">–</span></div>
      <dl class="rpl-kv" id="rpl-kv${k}"></dl>
      <figure class="rpl-sky"><svg id="rpl-sk${k}" viewBox="0 0 240 240" role="img" aria-labelledby="rpl-skc${k}"></svg><figcaption id="rpl-skc${k}"></figcaption></figure>
    </div>
    <div class="rpl-verdict" id="rpl-v${k}" aria-live="polite"></div>`;
  const sel = $(`rpl-s${k}`);
  sel.replaceChildren(...DEMO_LIST.map((d) => { const o = document.createElement("option"); o.value = d.id; o.textContent = d.kind === "trust" ? t("js-replay-demo-trust-log", "{ $title } (trust log)", { title: d.title }) : d.title; return o; }));
  sel.addEventListener("change", () => openDemoIn(k, sel.value));
  $(`rpl-f${k}`).addEventListener("change", (e) => { openFileIn(k, e.target.files[0]); e.target.value = ""; });
}

function drawStatic(k) {
  const p = S.panels[k]; if (!p) return;
  const v = (S.views[k] = makeView(p, { rings: S.coast && S.wide && p.region ? p.region.rings : null }));
  $(`rpl-tr${k}`).querySelector(".st").innerHTML = trackStatic(p, v, { uid: String(k), showTruth: S.truth, showCoast: S.coast });
  $(`rpl-st${k}`).querySelector(".st").innerHTML = stripStatic(p, TRACK, S.tMax);
  $(`rpl-t${k}`).textContent = p.title;
  $(`rpl-d${k}`).textContent = `${p.description || ""} ${p.source || ""}`.trim();
  $(`rpl-trd${k}`).textContent = [v.widened ? t("js-replay-track-widened", "Track of { $n } log rows, north up, widened to show the nearest coast.", { n: p.rows.length }) : t("js-replay-track", "Track of { $n } log rows, north up.", { n: p.rows.length }),
    p.region && p.region.hidden ? t("js-replay-coast-note-hidden", "{ $reason }.", { reason: p.region.hidden }) : p.region ? t("js-replay-coast-note", "Coast: { $source }, illustration only.", { source: p.region.source }) : t("js-replay-no-coast", "No coast is drawn: none is bundled for this window."),
    p.verdict.text].join(" ");
  $(`rpl-s${k}`).value = DEMO_LIST.some((d) => d.id === p.id) ? p.id : $(`rpl-s${k}`).value;
}

function render() {
  const tm = S.clock.t;
  S.panels.forEach((p, k) => {
    if (!p || !S.views[k]) return;
    const st = stateAt(p, tm), ro = readoutOf(p, st), v = S.views[k];
    $(`rpl-tr${k}`).querySelector(".dy").innerHTML = trackDynamic(p, v, st, { showTruth: S.truth });
    $(`rpl-st${k}`).querySelector(".dy").innerHTML = stripDynamic(p, TRACK, S.tMax, st);
    $(`rpl-n${k}`).textContent = ro.score == null ? "–" : String(ro.score);
    const b = $(`rpl-b${k}`); b.textContent = ro.ended ? t("js-replay-band-run-ended", "{ $band } · run ended", { band: ro.band || t("js-replay-not-scored", "not scored") }) : ro.band || t("js-replay-not-scored", "not scored"); b.dataset.band = st.row.band || "none";
    const r = st.row;
    $(`rpl-kv${k}`).innerHTML = `<div><dt>${esc(t("js-replay-kv-run-time", "Run time"))}</dt><dd>T+${esc(ro.t)}</dd></div><div><dt>${esc(t("js-replay-kv-receiver", "Receiver"))}</dt><dd>${esc(ro.fix)}</dd></div><div><dt>${esc(t("js-replay-kv-position-error", "Position error"))}</dt><dd>${esc(ro.err)}</dd></div><div><dt>${esc(t("js-replay-kv-heading", "Heading (gyro)"))}</dt><dd>${esc(ro.hdg)}</dd></div><div><dt>${esc(t("js-replay-kv-course", "Reported course"))}</dt><dd>${esc(ro.cog)}</dd></div><div><dt>${esc(t("js-replay-kv-sky", "Sky"))}</dt><dd>${esc(ro.sky)}</dd></div>${r.nUsed != null ? `<div><dt>${esc(t("js-replay-kv-satellites", "Satellites used / in view"))}</dt><dd>${r.nUsed} / ${r.nTracked ?? "?"}</dd></div>` : ""}`;
    $(`rpl-sk${k}`).innerHTML = st.sky ? skyMarkup(st.sky, { size: 240, labels: true }) : `<text x="120" y="124" text-anchor="middle" class="sk-lbl">${esc(t("js-replay-no-gsv", "no GSV in this log"))}</text>`;
    $(`rpl-skc${k}`).textContent = ro.skyText;
    const ended = tm >= p.t1 - 1e-6;
    const vb = $(`rpl-v${k}`), show = ended || S.early, tag = show ? "1" : "0";
    if (vb.dataset.shown !== tag) {
      vb.dataset.shown = tag;
      vb.innerHTML = show ? `<h3>${esc(ended ? t("js-replay-verdict", "Verdict") : t("js-replay-verdict-early", "Verdict (early)"))}</h3><p>${esc(p.verdict.text)}</p><p class="rpl-fine2">${esc(t("js-replay-verdict-fine", "From the log and the engine's score only; synthetic, advisory, not a detection-performance figure."))}</p>` : `<h3>${esc(t("js-replay-verdict", "Verdict"))}</h3><p class="rpl-wait">${esc(t("js-replay-verdict-wait", "Shown when this run ends, at T+{ $t }.", { t: fmtT(p.t1) }))}</p>`;
    }
  });
  $("rpl-clock").textContent = t("js-replay-clock", "T+{ $t } of { $max }", { t: fmtT(tm), max: fmtT(S.tMax) });
  $("rpl-slider").value = String(Math.round(tm));
  const play_ = $("rpl-play"), want = S.clock.playing ? "#i-pause" : "#i-play";
  if (play_.firstElementChild.firstElementChild.getAttribute("href") !== want) { play_.firstElementChild.firstElementChild.setAttribute("href", want); play_.setAttribute("aria-label", S.clock.playing ? t("js-replay-pause", "Pause") : t("js-replay-play", "Play")); }
  // The live region speaks at a moment (an event or a band change), or when the clock is moved by hand: never every tick.
  if (!S.clock.playing) $("rpl-live").textContent = S.panels.map((p, k) => p ? `${p.title}: ${readoutOf(p, stateAt(p, tm)).line}` : "").filter(Boolean).join(". ");
  else { const crossed = S.panels.flatMap((p) => (p ? p.marks : [])).filter((m) => m > S.lastMark && m <= tm); if (crossed.length) $("rpl-live").textContent = t("js-replay-moment", "Moment at T+{ $t }:", { t: fmtT(Math.max(...crossed)) }) + " " + S.panels.map((p) => p ? `${p.title}: ${readoutOf(p, stateAt(p, tm)).line}` : "").join(". "); }
  S.lastMark = tm;
}

function setClock(c) { S.clock = c; render(); syncUrl(); }
function frame(ts) {
  if (!S.clock.playing) { S.raf = 0; return; }
  const dt = ts - S.last; S.last = ts;
  S.clock = advance(S.clock, Math.min(dt, 250));
  render();
  if (S.clock.playing) S.raf = requestAnimationFrame(frame); else { S.raf = 0; syncUrl(); }
}
function startPlay() { S.clock = play(S.clock); S.last = performance.now(); S.lastMark = S.clock.t; if (!S.raf) S.raf = requestAnimationFrame(frame); render(); }
function stopPlay() { S.clock = pause(S.clock); render(); syncUrl(); }

// ---------- opening runs ----------

function refit() {
  const ps = S.panels.filter(Boolean);
  S.tMax = Math.max(1, ...ps.map((p) => p.t1));
  S.clock = { ...S.clock, t1: S.tMax, t: Math.min(S.clock.t, S.tMax) };
  const sl = $("rpl-slider"); sl.max = String(Math.ceil(S.tMax));
  S.panels.forEach((_, k) => drawStatic(k));
  render();
}
async function openDemoIn(k, id) {
  setStatus(t("js-replay-opening", "Opening { $id }…", { id }));
  try { S.panels[k] = await loadDemo(id, io, S.coastDoc, S.world); refit(); setStatus(S.coastDoc ? t("js-replay-status-synthetic", "{ $titles }: synthetic runs, scored by the engine.", { titles: titlesOf() }) : t("js-replay-status-synthetic-no-coast", "{ $titles }: synthetic runs, scored by the engine. Coastline unavailable.", { titles: titlesOf() })); syncUrl(); }
  catch (e) { setStatus(t("js-replay-open-failed", "{ $id } could not be opened: { $reason }.", { id, reason: e && e.message ? e.message : e }), true); }
}
async function openFileIn(k, file) {
  if (!file) return;
  setStatus(t("js-replay-reading", "Reading { $name }…", { name: file.name }));
  try {
    if (file.size > Math.max(TRAIN_MAX, TRUST_MAX)) { setStatus(t("js-replay-too-large", "{ $name } is larger than this page reads.", { name: file.name }), true); return; }
    const text = await file.text();
    let o; try { o = JSON.parse(text.replace(/^﻿/, "")); } catch (e) { setStatus(t("js-replay-not-json", "{ $name }: not JSON.", { name: file.name }), true); return; }
    let panel;
    if (o && typeof o.schema === "string") {
      const r = parseInstructorLog(text, file.name); if (r.error) { setStatus(r.error, true); return; }
      panel = panelFromTraining({ id: `file-${k}`, title: r.log.scenario || file.name, log: r.log, source: t("js-replay-src-instructor", "Your file { $name }: no engine score or sky comes with an instructor log alone.", { name: file.name }) });
    } else {
      const b = buildRun({ result: o }); if (b.error) { setStatus(t("js-replay-file-error", "{ $name }: { $error }", { name: file.name, error: b.error }), true); return; }
      panel = panelFromTrust({ id: `file-${k}`, title: file.name, run: b.run, source: t("js-replay-src-trust", "Your file { $name }: a trust result carries no sky or heading, so those are not drawn.", { name: file.name }) });
    }
    panel.region = coastFor(panel, S.coastDoc, S.world);
    S.panels[k] = panel; refit(); setStatus(t("js-replay-opened", "Opened { $name } in panel { $n }. Read here; nothing was uploaded.", { name: file.name, n: k + 1 }));
  } catch (e) { setStatus(t("js-replay-read-failed", "{ $name }: could not be read or drawn ({ $reason }).", { name: file.name, reason: e && e.message ? e.message : e }), true); }
}

// ---------- saving ----------

function save(name, data, type) {
  const a = document.createElement("a");
  a.href = URL.createObjectURL(new Blob([data], { type })); a.download = name;
  document.body.append(a); a.click(); a.remove(); setTimeout(() => URL.revokeObjectURL(a.href), 4000);
}
function exportReady() { return S.panels.every(Boolean) && S.views.every(Boolean); }
function stem() { return `bridge-replay-${S.panels.map((p) => p.id).join("-vs-")}`; }
function saveSvg() {
  if (!exportReady()) return;
  setStatus(t("js-replay-drawing-animation", "Drawing the animation…"));
  setTimeout(() => { // let the status paint first
    const svg = animatedSvg(S.panels, S.views, S.tMax, { speed: S.clock.speed * 3, showTruth: S.truth, showCoast: S.coast });
    save(`${stem()}.svg`, svg, "image/svg+xml");
    setStatus(t("js-replay-saved-svg", "Saved { $name } ({ $size } kB): every frame in one file, drawn from the same rows as this page.", { name: `${stem()}.svg`, size: Math.round(svg.length / 1024).toLocaleString() }));
  }, 30);
}
function saveZip() {
  if (!exportReady()) return;
  setStatus(t("js-replay-drawing-frames", "Drawing the frames…"));
  setTimeout(() => {
    const zip = framesZip(S.panels, S.views, S.tMax, { showTruth: S.truth, showCoast: S.coast });
    save(`${stem()}-frames.zip`, zip, "application/zip");
    setStatus(t("js-replay-saved-zip", "Saved { $name } ({ $size } MB): one SVG per frame, a manifest of the rows behind each, and a README.", { name: `${stem()}-frames.zip`, size: (zip.length / 1048576).toFixed(1) }));
  }, 30);
}

// ---------- the address (a per-viewer convenience: which runs, where the clock is) ----------

function syncUrl() {
  try {
    const q = new URLSearchParams(location.search);
    for (const k of [0, 1]) { const p = S.panels[k]; if (p && DEMO_LIST.some((d) => d.id === p.id)) q.set(k ? "b" : "a", p.id); }
    q.set("t", String(Math.round(S.clock.t))); q.set("speed", String(S.clock.speed));
    history.replaceState(null, "", `${location.pathname}?${q}`);
  } catch (e) { /* no history API */ }
}

// ---------- wiring ----------

function keys(ev) {
  const tag = ev.target && ev.target.tagName;
  if (ev.altKey || ev.ctrlKey || ev.metaKey || tag === "INPUT" || tag === "SELECT" || tag === "TEXTAREA" || (tag === "BUTTON" && (ev.key === " " || ev.key === "Enter"))) return;
  const big = ev.shiftKey ? 10 : 1;
  if (ev.key === " ") { ev.preventDefault(); S.clock.playing ? stopPlay() : startPlay(); }
  else if (ev.key === "ArrowRight") { ev.preventDefault(); setClock(stepBy(S.clock, big * stepSize())); }
  else if (ev.key === "ArrowLeft") { ev.preventDefault(); setClock(stepBy(S.clock, -big * stepSize())); }
  else if (ev.key === "PageDown") { ev.preventDefault(); setClock(stepMark(S.clock, 1, marks())); }
  else if (ev.key === "PageUp") { ev.preventDefault(); setClock(stepMark(S.clock, -1, marks())); }
  else if (ev.key === "Home") { ev.preventDefault(); setClock(seek(pause(S.clock), 0)); }
  else if (ev.key === "End") { ev.preventDefault(); setClock(seek(pause(S.clock), S.tMax)); }
}
const stepSize = () => Math.min(...S.panels.filter(Boolean).map((p) => p.sampleS), 10);
const marks = () => [...new Set(S.panels.filter(Boolean).flatMap((p) => p.marks))].sort((a, b) => a - b);

function wire() {
  $("rpl-speed").replaceChildren(...SPEEDS.map((s) => { const o = document.createElement("option"); o.value = String(s); o.textContent = String(s); return o; }));
  $("rpl-speed").value = String(DEFAULT_SPEED);
  const q = new URLSearchParams(location.search);
  try { if (matchMedia("(prefers-reduced-motion: reduce)").matches && !q.get("speed")) { $("rpl-speed").value = "1"; $("rpl-live").textContent = t("js-replay-reduced-motion", "Reduced motion is preferred, so the replay starts at 1x and does not play by itself."); } } catch (e) { /* no matchMedia */ }
  S.clock = setSpeed(S.clock, Number($("rpl-speed").value));
  $("rpl-speed").addEventListener("change", (e) => { S.clock = setSpeed(S.clock, Number(e.target.value)); syncUrl(); });
  $("rpl-play").addEventListener("click", () => (S.clock.playing ? stopPlay() : startPlay()));
  $("rpl-back").addEventListener("click", () => setClock(stepBy(S.clock, -stepSize())));
  $("rpl-fwd").addEventListener("click", () => setClock(stepBy(S.clock, stepSize())));
  $("rpl-prevmark").addEventListener("click", () => setClock(stepMark(S.clock, -1, marks())));
  $("rpl-nextmark").addEventListener("click", () => setClock(stepMark(S.clock, 1, marks())));
  $("rpl-slider").addEventListener("input", (e) => setClock(seek(pause(S.clock), Number(e.target.value))));
  $("rpl-truth").addEventListener("change", (e) => { S.truth = e.target.checked; S.panels.forEach((_, k) => drawStatic(k)); render(); });
  $("rpl-coast").addEventListener("change", (e) => { S.coast = e.target.checked; $("rpl-wide").disabled = !S.coast; S.panels.forEach((_, k) => drawStatic(k)); render(); });
  $("rpl-wide").addEventListener("change", (e) => { S.wide = e.target.checked; S.panels.forEach((_, k) => drawStatic(k)); render(); });
  $("rpl-early").addEventListener("change", (e) => { S.early = e.target.checked; for (const k of [0, 1]) { const v = $(`rpl-v${k}`); v.dataset.shown = ""; } render(); });
  $("rpl-svg").addEventListener("click", saveSvg);
  $("rpl-zip").addEventListener("click", saveZip);
  document.addEventListener("keydown", keys);
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
}

async function main() {
  injectCss(); panelShell(0); panelShell(1); wire();
  const q = new URLSearchParams(location.search), valid = (id) => DEMO_LIST.some((d) => d.id === id);
  const ids = [valid(q.get("a")) ? q.get("a") : DEFAULT_PAIR[0], valid(q.get("b")) ? q.get("b") : DEFAULT_PAIR[1]];
  // Bundled, same-origin files only: the coastline windows and the Studio's own world outline.
  try { S.coastDoc = await io.json("replay/data/coast.json"); } catch (e) { S.coastDoc = null; }
  try { S.world = await io.json("data/land.json"); } catch (e) { S.world = []; }
  await Promise.all(ids.map(async (id, k) => { try { S.panels[k] = await loadDemo(id, io, S.coastDoc, S.world); } catch (e) { setStatus(t("js-replay-open-failed", "{ $id } could not be opened: { $reason }.", { id, reason: e.message }), true); } }));
  if (S.panels.some(Boolean)) {
    refit();
    const t0 = Number(q.get("t")); if (Number.isFinite(t0) && t0 > 0) S.clock = seek(S.clock, t0);
    const sp = Number(q.get("speed")); if (SPEEDS.includes(sp)) { S.clock = setSpeed(S.clock, sp); $("rpl-speed").value = String(sp); }
    render();
    if (S.panels.every(Boolean)) setStatus(t("js-replay-status-ready", "{ $a } and { $b }: synthetic runs, scored by the engine. Press Play, or move the clock.", { a: S.panels[0].title, b: S.panels[1].title }));
  }
}
main();
