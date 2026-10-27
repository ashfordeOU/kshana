// SPDX-License-Identifier: AGPL-3.0-only
// Mission thread: the DOM layer. What is read and drawn is in lib/mission-thread.mjs. The page fetches only the Studio's own recorded
// result (recorded/mission-thread-artemis-class.json) or reads a result file the person opens with File.text(); nothing leaves the page.
import { readThread, headline, phaseTable, budgetTable, timelineSvg, metricTitle, fmtElapsed, fmtSigma, METRICS } from "../lib/mission-thread.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
const EXAMPLE = "mission-thread-artemis-class";
const MAX_BYTES = 40e6;
const S = { model: null, metric: "pos", layout: "phases", phase: 0, source: "" };
const setStatus = (msg, err) => { const s = $("mtv-status"); s.textContent = msg; s.classList.toggle("err", !!err); };
const tierWord = (tier) => { const l = globalThis.kshanaL10n; return (l && l.term && l.term("tier-" + String(tier).toLowerCase(), tier)) || tier; };
const chip = (tier) => (tier ? `<span class="evb evb-${tier.toLowerCase()}"><span class="evb-chip"><i></i>${esc(tierWord(tier))}</span></span>` : "");

function drawHead(m) {
  const h = headline(m);
  $("mtv-evb").innerHTML = chip(m.tier);
  const w = m.weakest;
  $("mtv-weakline").innerHTML = w
    ? t("js-mthread-weak-line", "The weakest link is the phase <b>{ $phase }</b>: { $margin }× its stated limit, set by { $source }. The margin is the smallest ratio of a stated limit to the phase's peak; above 1 meets the requirement.", { phase: esc(w.phaseId), margin: w.margin === null ? "n/a" : String(Number(w.margin.toFixed(2))), source: esc(w.source) })
    : esc(t("js-mthread-no-weak", "The result names no weakest link."));
  const rows = [
    [t("js-mthread-kv-title", "Thread"), m.title || "—"],
    [t("js-mthread-kv-phases", "Phases"), String(h.phases)],
    [t("js-mthread-kv-elapsed", "Mission elapsed time"), fmtElapsed(h.elapsed)],
    [t("js-mthread-kv-limits", "Phases with a stated limit"), t("js-mthread-kv-limits-value", "{ $n } ({ $met } met, { $missed } not met)", { n: h.requirements, met: h.met, missed: h.missed })],
    [t("js-mthread-kv-epoch", "Epoch (UTC)"), m.epoch || "—"],
    [t("js-mthread-kv-seed", "Seed"), m.seed === null ? "—" : String(m.seed)],
    [t("js-mthread-kv-engine", "Engine"), m.engine ? `v${m.engine}` : "—"],
  ];
  $("mtv-kv").innerHTML = rows.map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
}

function drawTabs() {
  $("mtv-metric").replaceChildren(...METRICS.map((k) => { const b = document.createElement("button"); b.type = "button"; b.setAttribute("role", "tab"); b.className = "mtv-tab"; b.dataset.k = k; b.setAttribute("aria-selected", String(k === S.metric)); b.textContent = metricTitle(k); b.addEventListener("click", () => { S.metric = k; drawChart(); drawTabs(); }); return b; }));
  const mk = (id, label) => { const b = document.createElement("button"); b.type = "button"; b.className = "mtv-tab"; b.setAttribute("aria-pressed", String(S.layout === id)); b.textContent = label; b.addEventListener("click", () => { S.layout = id; drawChart(); drawTabs(); }); return b; };
  $("mtv-layout").replaceChildren(mk("phases", t("js-mthread-layout-phases", "Equal width per phase")), mk("time", t("js-mthread-layout-time", "True mission time")));
}

function drawChart() {
  const m = S.model;
  $("mtv-chart").innerHTML = timelineSvg(m, { metric: S.metric, layout: S.layout, width: Math.max(760, Math.min(1180, ($("mtv-chart").clientWidth || 960))) });
  $("mtv-chart-note").textContent = S.layout === "phases"
    ? t("js-mthread-note-phases", "Each phase is drawn with the same width so a short phase is as visible as a long one; the time at which each begins is under the band. Switch to true mission time to see the real proportions. Dashed lines are the limits the document states; a break in the line is a handover.")
    : t("js-mthread-note-time", "True mission time: a phase of a few minutes can be too narrow to see. Switch to equal widths to read it. Dashed lines are the limits the document states; a break in the line is a handover.");
}

function drawPhases() {
  const m = S.model, rows = phaseTable(m);
  const head = [t("js-mthread-col-phase", "Phase"), t("js-mthread-col-kind", "Kind"), t("js-mthread-col-window", "Mission time"), t("js-mthread-col-peak-pos", "Peak position"), t("js-mthread-col-peak-vel", "Peak velocity"), t("js-mthread-col-peak-time", "Peak clock bias"), t("js-mthread-col-margin", "Against the limit"), t("js-mthread-col-limit", "Largest contribution"), t("js-mthread-col-label", "Label")];
  $("mtv-phases").innerHTML = `<thead><tr>${head.map((x) => `<th scope="col">${esc(x)}</th>`).join("")}</tr></thead><tbody>${rows.map((r) => `<tr class="${r.weakest ? "weak" : ""}${r.index === S.phase ? " sel" : ""}" data-i="${r.index}"><th scope="row"><button type="button" class="mtv-rowbtn" data-i="${r.index}">${esc(r.id)}</button>${r.weakest ? `<span class="mtv-flag">${esc(t("js-mthread-weakest-flag", "weakest link"))}</span>` : ""}</th><td>${esc(r.kind)}</td><td class="num">${esc(r.window)}</td><td class="num">${esc(r.peakPos)}</td><td class="num">${esc(r.peakVel)}</td><td class="num">${esc(r.peakTime)}</td><td>${esc(r.marginText)}</td><td>${esc(r.limiting)}</td><td>${chip(r.tier)}</td></tr>`).join("")}</tbody>`;
  for (const b of $("mtv-phases").querySelectorAll(".mtv-rowbtn")) b.addEventListener("click", () => { S.phase = Number(b.dataset.i); $("mtv-phase-sel").value = String(S.phase); drawPhases(); drawBudget(); $("mtv-budget-h").scrollIntoView({ block: "nearest" }); });
}

function drawBudget() {
  const m = S.model;
  const sel = $("mtv-phase-sel");
  if (sel.options.length !== m.phases.length) sel.replaceChildren(...m.phases.map((p, i) => { const o = document.createElement("option"); o.value = String(i); o.textContent = `${i + 1}. ${p.id} (${p.kind})`; return o; }));
  sel.value = String(S.phase);
  const b = budgetTable(m, S.phase);
  $("mtv-budget-evb").innerHTML = chip(b.phase.tier);
  const head = [t("js-mthread-bcol-source", "Contribution"), t("js-mthread-bcol-sigma", "1-sigma"), t("js-mthread-bcol-share", "Size against the largest position term"), t("js-mthread-bcol-label", "Label")];
  const summary = `<caption>${esc(t("js-mthread-budget-caption", "{ $phase }: 1-sigma at entry { $entry }, at the peak { $peak }, at exit { $exit } (position); each contribution below, largest first.", { phase: b.phase.id, entry: b.entry.pos, peak: b.peak.pos, exit: b.exit.pos }))}</caption>`;
  $("mtv-budget").innerHTML = `${summary}<thead><tr>${head.map((x) => `<th scope="col">${esc(x)}</th>`).join("")}</tr></thead><tbody>${b.rows.map((r) => `<tr class="${r.limiting ? "weak" : ""}"><th scope="row">${esc(r.source)}${r.limiting ? `<span class="mtv-flag">${esc(t("js-mthread-sets-peak", "sets the peak"))}</span>` : ""}</th><td class="num">${esc(r.shown)}</td><td>${r.bar === null ? "" : `<span class="mtv-bar" style="--w:${(r.bar * 100).toFixed(1)}%" aria-hidden="true"></span>`}</td><td>${chip(r.tier)}</td></tr>`).join("")}</tbody>`;
  $("mtv-events").innerHTML = b.events.length ? b.events.map((e) => `<li><span class="mtv-at">${esc(e.at)}</span> ${esc(e.what)}</li>`).join("") : `<li>${esc(t("js-mthread-no-events", "This phase records no events."))}</li>`;
}

function draw(m) {
  S.model = m; S.phase = m.weakest && m.weakest.index >= 0 ? m.weakest.index : 0;
  $("mtv-body").hidden = false;
  drawHead(m); drawTabs(); drawChart(); drawPhases(); drawBudget();
  $("mtv-prov").textContent = `${m.notice} ${t("js-mthread-prov", "Every label on this page is the engine's own; the page copies each number from the result and only scales it.")}`.trim();
}

async function openExample() {
  setStatus(t("js-mthread-opening", "Opening the Artemis-class example…"));
  try {
    const r = await fetch(`recorded/${EXAMPLE}.json`);
    if (!r.ok) throw new Error(t("js-mthread-example-not-loaded", "the recorded result did not load"));
    const { model, error } = readThread(await r.json());
    if (error) throw new Error(error);
    draw(model);
    setStatus(t("js-mthread-recorded", "The engine's recorded result (version { $version }): an illustrative chain built from public mission descriptions; the numbers are modelled and stand for nothing real.", { version: model.engine }));
  } catch (e) { setStatus(t("js-mthread-open-failed", "The example could not be opened: { $reason }.", { reason: e && e.message ? e.message : e }), true); }
}

async function openFile(file) {
  if (!file) return;
  if (file.size > MAX_BYTES) { setStatus(t("js-mthread-too-large", "That file is larger than { $mb } MB; it is not read.", { mb: String(MAX_BYTES / 1e6) }), true); return; }
  try {
    const { model, error } = readThread(JSON.parse(await file.text()));
    if (error) throw new Error(error);
    draw(model);
    setStatus(t("js-mthread-opened", "{ $name } read in this page; nothing was sent anywhere.", { name: file.name }));
  } catch (e) { setStatus(t("js-mthread-file-failed", "{ $name } could not be read: { $reason }.", { name: file.name, reason: e && e.message ? e.message : e }), true); }
}

function wire() {
  $("mtv-example").addEventListener("click", openExample);
  $("mtv-file").addEventListener("change", (e) => openFile(e.target.files && e.target.files[0]));
  $("mtv-phase-sel").addEventListener("change", (e) => { S.phase = Number(e.target.value); drawPhases(); drawBudget(); });
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
  try { matchMedia("(min-width: 901px)").addEventListener("change", () => { if (S.model) drawChart(); }); } catch (e) { /* no matchMedia */ }
  window.kshanaL10n && window.kshanaL10n.setRerender && window.kshanaL10n.setRerender(() => { if (S.model) draw(S.model); });
}
wire();
openExample();
