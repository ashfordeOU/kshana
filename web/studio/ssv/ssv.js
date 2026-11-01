// SPDX-License-Identifier: AGPL-3.0-only
// Space-user GNSS: the DOM layer. What is read and drawn is in lib/ssv.mjs. The page fetches only this folder's own recorded results
// (recorded/<scenario>.json); nothing leaves the page.
import { SCENARIOS, readSsv, chartsOf, factRows, readIcg, icgTable } from "../lib/ssv.mjs";
import { mountBadge } from "../lib/evidence.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
let current = null, lastModel = null;
const setStatus = (msg, err) => { const s = $("ssk-status"); s.textContent = msg; s.classList.toggle("err", !!err); };

async function open(id) {
  const sc = SCENARIOS.find((s) => s.id === id) || SCENARIOS[0];
  current = sc.id;
  for (const b of $("ssk-tabs").children) { b.setAttribute("aria-selected", String(b.dataset.id === sc.id)); b.tabIndex = b.dataset.id === sc.id ? 0 : -1; }
  $("ssk-blurb").textContent = sc.blurb;
  setStatus(t("js-ssv-opening", "Opening { $title }…", { title: sc.title }));
  try {
    const r = await fetch(`recorded/${sc.id}.json`);
    if (!r.ok) throw new Error(t("js-ssv-result-not-loaded", "the recorded result did not load"));
    const { model: m, error } = readSsv(await r.json());
    if (error) throw new Error(error);
    if (current !== sc.id) return;
    draw(m);
    setStatus(t("js-ssv-recorded", "{ $title }: the engine's recorded result (version { $version }).", { title: sc.title, version: m.engine }));
    try { const q = new URLSearchParams(location.search); q.set("scenario", sc.id); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
  } catch (e) { setStatus(t("js-ssv-open-failed", "{ $title } could not be opened: { $reason }.", { title: sc.title, reason: e && e.message ? e.message : e }), true); }
}
function draw(m) {
  lastModel = m;
  mountBadge($("ssk-evb"), m);
  $("ssk-body").hidden = false;
  $("ssk-summary").textContent = m.summary;
  $("ssk-kv").innerHTML = factRows(m).map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
  $("ssk-pattern").textContent = m.pattern ? t("js-ssv-transmit-pattern", "Transmit pattern: { $pattern }", { pattern: m.pattern }) : "";
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
    const r = await fetch("ssv/icg-comparison.json"); if (!r.ok) throw new Error(t("js-ssv-comparison-not-loaded", "the comparison file did not load"));
    const { icg: g, error } = readIcg(await r.json()); if (error) throw new Error(error);
    $("ssk-icg").innerHTML = icgTable(g);
    $("ssk-icg-note").textContent = t("js-ssv-icg-note", "{ $label }; the bar-level verdicts of the engine's committed result files (engine commit { $commit }). The booklet's tables are public; nothing here is VALIDATED.", { label: g.run1.label, commit: g.commit });
  } catch (e) { $("ssk-icg").textContent = t("js-ssv-comparison-failed", "The comparison could not be shown ({ $reason }).", { reason: e && e.message ? e.message : e }); }
}
wire();
icg();
open(new URLSearchParams(location.search).get("scenario") || SCENARIOS[0].id);
