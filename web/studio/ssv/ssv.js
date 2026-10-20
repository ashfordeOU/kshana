// SPDX-License-Identifier: AGPL-3.0-only
// Space-user GNSS: the DOM layer. What is read and drawn is in lib/ssv.mjs. The page fetches only this folder's own recorded results
// (recorded/<scenario>.json); nothing leaves the page.
import { SCENARIOS, readSsv, chartsOf, factRows, readIcg, icgTable } from "../lib/ssv.mjs";

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
let current = null, lastModel = null;
const setStatus = (msg, err) => { const s = $("ssk-status"); s.textContent = msg; s.classList.toggle("err", !!err); };

async function open(id) {
  const sc = SCENARIOS.find((s) => s.id === id) || SCENARIOS[0];
  current = sc.id;
  for (const b of $("ssk-tabs").children) { b.setAttribute("aria-selected", String(b.dataset.id === sc.id)); b.tabIndex = b.dataset.id === sc.id ? 0 : -1; }
  $("ssk-blurb").textContent = sc.blurb;
  setStatus(`Opening ${sc.title}…`);
  try {
    const r = await fetch(`recorded/${sc.id}.json`);
    if (!r.ok) throw new Error("the recorded result did not load");
    const { model: m, error } = readSsv(await r.json());
    if (error) throw new Error(error);
    if (current !== sc.id) return;
    draw(m);
    setStatus(`${sc.title}: the engine's recorded result (version ${m.engine}).`);
    try { const q = new URLSearchParams(location.search); q.set("scenario", sc.id); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
  } catch (e) { setStatus(`${sc.title} could not be opened: ${e && e.message ? e.message : e}.`, true); }
}
function draw(m) {
  lastModel = m;
  $("ssk-body").hidden = false;
  $("ssk-summary").textContent = m.summary;
  $("ssk-kv").innerHTML = factRows(m).map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
  $("ssk-pattern").textContent = m.pattern ? `Transmit pattern: ${m.pattern}` : "";
  $("ssk-charts").innerHTML = chartsOf(m, { wide: matchMedia("(min-width: 901px)").matches }).map((c) => `<section class="card ssk-card${c.wide ? " ssk-wide" : ""}" aria-labelledby="ssk-c-${c.id}"><h3 id="ssk-c-${c.id}">${esc(c.title)}</h3><p class="card-note">${esc(c.note || "")}</p><div class="ssk-scroll">${c.svg || c.html || ""}</div></section>`).join("");
  $("ssk-prov").textContent = `${m.label} ${m.advisory}`.trim();
}
function wire() {
  try { matchMedia("(min-width: 901px)").addEventListener("change", () => { if (lastModel) draw(lastModel); }); } catch (e) { /* no matchMedia */ }
  $("ssk-tabs").replaceChildren(...SCENARIOS.map((s) => { const b = document.createElement("button"); b.type = "button"; b.setAttribute("role", "tab"); b.className = "ssk-tab"; b.dataset.id = s.id; b.textContent = s.title; b.addEventListener("click", () => open(s.id)); return b; }));
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
}
async function icg() {
  try {
    const r = await fetch("ssv/icg-comparison.json"); if (!r.ok) throw new Error("the comparison file did not load");
    const { icg: g, error } = readIcg(await r.json()); if (error) throw new Error(error);
    $("ssk-icg").innerHTML = icgTable(g);
    $("ssk-icg-note").textContent = `${g.run1.label}; the bar-level verdicts of the engine's committed result files (engine commit ${g.commit}). The booklet's tables are public; nothing here is VALIDATED.`;
  } catch (e) { $("ssk-icg").textContent = `The comparison could not be shown (${e && e.message ? e.message : e}).`; }
}
wire();
icg();
open(new URLSearchParams(location.search).get("scenario") || SCENARIOS[0].id);
