// SPDX-License-Identifier: AGPL-3.0-only
// Holdover test page: the DOM layer. What it reads and draws is in lib/holdover.mjs. It fetches only this folder's own recorded results
// (recorded/<scenario>.json); a file the person opens is read here with File.text() and goes nowhere.
import { SCENARIOS, readHoldover, seriesFor, teSvg, curvesSvg, stepRows, holdoverRows } from "../lib/holdover.mjs";
import { mountBadge } from "../lib/evidence.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
let current = null;
const MAX = 12 * 1024 * 1024;

function setStatus(msg, err) { const s = $("ho-status"); s.textContent = msg; s.classList.toggle("err", !!err); }
const cell = (v) => (v == null || v === "" ? t("js-hold-na", "n/a") : String(v));
const num = (v, d = 2) => (v == null ? t("js-hold-na", "n/a") : v.toFixed(d));

async function open(id) {
  const sc = SCENARIOS.find((s) => s.id === id) || SCENARIOS[0];
  current = sc.id;
  for (const b of $("ho-tabs").children) { b.setAttribute("aria-selected", String(b.dataset.id === sc.id)); b.tabIndex = b.dataset.id === sc.id ? 0 : -1; }
  $("ho-blurb").textContent = sc.blurb;
  setStatus(t("js-hold-opening", "Opening { $title }…", { title: sc.title }));
  try {
    const r = await fetch(`recorded/${sc.id}.json`);
    if (!r.ok) throw new Error(t("js-hold-result-not-loaded", "the recorded result did not load"));
    const { model, error } = readHoldover(await r.json());
    if (error) throw new Error(error);
    if (current !== sc.id) return;
    draw(model, t("js-hold-recorded", "{ $title }: the engine's recorded result (version { $version }).", { title: sc.title, version: model.engine }));
    try { const q = new URLSearchParams(location.search); q.set("scenario", sc.id); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
  } catch (e) { setStatus(t("js-hold-open-failed", "{ $title } could not be opened: { $reason }.", { title: sc.title, reason: e && e.message ? e.message : e }), true); }
}

async function openFiles(files) {
  try {
    const f = files[0];
    if (f.size > MAX) { setStatus(t("js-hold-file-too-large", "{ $name } is larger than this page reads.", { name: f.name }), true); return; }
    let result;
    try { result = JSON.parse((await f.text()).replace(/^\uFEFF/, "")); } catch (e) { setStatus(t("js-hold-file-not-json", "{ $name }: not JSON.", { name: f.name }), true); return; }
    const doc = typeof result.json === "string" ? result : { json: result, toml: "", summary: "", engine_version: result.engine_version, file: "" };
    const { model, error } = readHoldover(doc);
    if (error) { setStatus(t("js-hold-file-error", "{ $name }: { $error }.", { name: f.name, error }), true); return; }
    for (const b of $("ho-tabs").children) b.setAttribute("aria-selected", "false");
    current = null;
    draw(model, t("js-hold-file-read-here", "{ $name }, read here; nothing was uploaded.", { name: f.name }));
  } catch (e) { setStatus(t("js-hold-read-failed", "Could not be read or drawn ({ $reason }).", { reason: e && e.message ? e.message : e }), true); }
}

function draw(m, status) {
  $("ho-body").hidden = false;
  mountBadge($("ho-evb"), m);
  $("ho-summary").textContent = m.summary || m.label;
  const chips = [[t("js-hold-chip-baseline", "Baseline against its masks"), m.verdicts.baseline_masks], [t("js-hold-chip-holdover", "Holdover against its masks"), m.verdicts.holdover_masks], [t("js-hold-chip-envelope", "ePRTC-A holdover envelope"), m.verdicts.holdover_envelope], [t("js-hold-chip-recovery", "Recovery"), m.verdicts.recovery]].filter(([, v]) => v);
  $("ho-chips").innerHTML = chips.map(([k, v]) => `<li class="ho-chipv ho-v-${esc(v.toLowerCase())}"><span>${esc(k)}</span><b>${esc(v)}</b></li>`).join("") + `<li class="ho-chipv ho-v-note"><span>${esc(t("js-hold-chip-words", "Words"))}</span><b>${esc(t("js-hold-chip-measured", "measured against the mask"))}</b></li>`;
  const { series, from, why } = seriesFor(m);
  $("ho-te").innerHTML = teSvg(m, series);
  $("ho-te-note").textContent = series ? t("js-hold-te-note", "Time error from { $from }. The two times were stated by { $by }.", { from, by: m.test.statedBy }) : t("js-hold-why-sentence", "{ $why }.", { why });
  $("ho-mtie").innerHTML = curvesSvg(m, "mtie");
  $("ho-tdev").innerHTML = curvesSvg(m, "tdev");
  $("ho-steps").innerHTML = `<thead><tr>${[t("js-hold-th-step", "Step"), t("js-hold-th-span", "Span"), t("js-hold-th-samples", "Samples"), t("js-hold-th-mean", "Mean, ns"), t("js-hold-th-rms", "RMS, ns"), t("js-hold-th-largest", "Largest |TE|, ns")].map((h) => `<th scope="col">${esc(h)}</th>`).join("")}</tr></thead><tbody>${stepRows(m).map((r) => `<tr><th scope="row">${esc(r[0])}</th>${r.slice(1).map((c) => `<td>${esc(c)}</td>`).join("")}</tr>`).join("")}</tbody>`;
  $("ho-kv").innerHTML = holdoverRows(m).map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
  const rows = m.masks.flatMap((k) => k.checks.map((c) => `<tr><th scope="row">${esc(k.id)}</th><td>${esc(k.condition)} (${esc(k.step)})</td><td>${esc(c.metric)}</td><td>${esc(num(c.limitNs, 3))}</td><td>${esc(num(c.valueNs, 3))}</td><td>${esc(num(c.marginNs, 3))}</td><td><b class="ho-vtxt ho-v-${esc(c.verdict.toLowerCase())}">${esc(c.verdict)}</b></td><td>${esc(c.worstTauS == null ? t("js-hold-na", "n/a") : num(c.worstTauS, 0))}</td><td>${esc(c.source)}${c.note ? `<br><small>${esc(c.note)}</small>` : ""}</td></tr>`));
  $("ho-masks").innerHTML = `<thead><tr>${[t("js-hold-th-mask", "Mask"), t("js-hold-th-measured-on", "Measured on"), t("js-hold-th-metric", "Metric"), t("js-hold-th-limit", "Limit, ns"), t("js-hold-th-value", "Value, ns"), t("js-hold-th-margin", "Margin, ns"), t("js-hold-th-verdict", "Verdict"), t("js-hold-th-worst-at", "Worst at τ or T+, s"), t("js-hold-th-source", "Source")].map((h) => `<th scope="col">${esc(h)}</th>`).join("")}</tr></thead><tbody>${rows.join("")}</tbody>`;
  const notes = m.masks.filter((k) => k.notSpecified).map((k) => `${k.id}: ${k.notSpecified}`);
  $("ho-budgets").innerHTML = `<thead><tr>${[t("js-hold-th-budget", "Budget"), t("js-hold-th-budget-limit", "Limit |TE|, ns"), t("js-hold-th-first-exceeded", "First exceeded after removal, s"), t("js-hold-th-source", "Source")].map((h) => `<th scope="col">${esc(h)}</th>`).join("")}</tr></thead><tbody>${m.budgets.map((b) => `<tr><th scope="row">${esc(b.name)}</th><td>${esc(num(b.maxNs, 0))}</td><td>${esc(b.exceeded ? num(b.tExceedS, 0) : t("js-hold-not-exceeded", "not exceeded"))}</td><td>${esc(b.source)}</td></tr>`).join("")}</tbody>`;
  $("ho-nc").innerHTML = [...m.notCovered, ...notes].map((x) => `<li>${esc(x)}</li>`).join("");
  setStatus(t("js-hold-status-final", "{ $status } { $label }; measured against the mask.", { status, label: m.label.split(" — ")[0] }));
}

function wire() {
  $("ho-tabs").replaceChildren(...SCENARIOS.map((s) => { const b = document.createElement("button"); b.type = "button"; b.setAttribute("role", "tab"); b.className = "ho-tab"; b.dataset.id = s.id; b.textContent = s.title; b.addEventListener("click", () => open(s.id)); return b; }));
  $("ho-tabs").addEventListener("keydown", (ev) => {
    const i = SCENARIOS.findIndex((s) => s.id === current), d = ev.key === "ArrowRight" ? 1 : ev.key === "ArrowLeft" ? -1 : 0;
    if (!d) return; ev.preventDefault();
    const n = SCENARIOS[(i + d + SCENARIOS.length) % SCENARIOS.length]; open(n.id); $("ho-tabs").querySelector(`[data-id="${n.id}"]`).focus();
  });
  $("ho-files").addEventListener("change", (e) => { if (e.target.files.length) openFiles([...e.target.files]); e.target.value = ""; });
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
}
wire();
open(new URLSearchParams(location.search).get("scenario") || SCENARIOS[0].id);
