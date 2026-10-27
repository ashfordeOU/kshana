// SPDX-License-Identifier: AGPL-3.0-only
// Lunar infrastructure: the DOM layer. What is read and drawn is in lib/lunar-infra.mjs. The page fetches only this folder's own recorded results
// (recorded/<scenario>.json) and lunar-infra/bars.json; nothing leaves the page.
import { SCENARIOS, readLi, readBars, chartsOf, factRows, missNote } from "../lib/lunar-infra.mjs";
import { mountBadge } from "../lib/evidence.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
let current = null, last = null, bars = null;
const setStatus = (msg, err) => { const s = $("luk-status"); s.textContent = msg; s.classList.toggle("err", !!err); };

async function loadBars() {
  try {
    const r = await fetch("lunar-infra/bars.json"); if (!r.ok) throw new Error(t("js-lunarinfra-bars-not-loaded", "the bars file did not load"));
    const { bars: b, error } = readBars(await r.json()); if (error) throw new Error(error);
    bars = b;
  } catch (e) { bars = null; setStatus(t("js-lunarinfra-bars-not-shown", "The pre-registered bars could not be shown ({ $reason }).", { reason: e && e.message ? e.message : e }), true); }
}

async function open(id) {
  const sc = SCENARIOS.find((s) => s.id === id) || SCENARIOS[0];
  current = sc.id;
  for (const b of $("luk-tabs").children) { b.setAttribute("aria-selected", String(b.dataset.id === sc.id)); b.tabIndex = b.dataset.id === sc.id ? 0 : -1; }
  $("luk-blurb").textContent = sc.blurb;
  setStatus(t("js-lunarinfra-opening", "Opening { $title }…", { title: sc.title }));
  try {
    const models = [];
    for (const f of sc.files) {
      const r = await fetch(`recorded/${f}.json`); if (!r.ok) throw new Error(t("js-lunarinfra-result-not-loaded", "the recorded result { $file } did not load", { file: f }));
      const { model, error } = readLi(await r.json()); if (error) throw new Error(error);
      models.push(model);
    }
    if (current !== sc.id) return;
    draw(sc, models);
    setStatus(t("js-lunarinfra-recorded", { one: "{ $title }: the engine's recorded result (version { $version }).", other: "{ $title }: the engine's recorded results (version { $version })." }, { n: models.length > 1 ? 2 : 1, title: sc.title, version: models[0].engine }));
    try { const q = new URLSearchParams(location.search); q.set("study", sc.id); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
  } catch (e) { setStatus(t("js-lunarinfra-open-failed", "{ $title } could not be opened: { $reason }.", { title: sc.title, reason: e && e.message ? e.message : e }), true); }
}

function draw(sc, models) {
  last = [sc, models];
  const m = models[0];
  mountBadge($("luk-evb"), m);
  $("luk-body").hidden = false;
  $("luk-summary").textContent = models.map((x) => x.summary).join(" | ");
  $("luk-kv").innerHTML = factRows(models).map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
  const miss = bars ? missNote(bars, sc.study, models) : "";
  $("luk-miss").hidden = !miss; $("luk-miss").innerHTML = miss ? `<b>${esc(t("js-lunarinfra-where-missed", "Where this study missed."))}</b> ${esc(miss)}` : "";
  $("luk-charts").innerHTML = chartsOf(models, bars, { wide: matchMedia("(min-width: 901px)").matches }).map((c) => `<section class="card luk-card${c.wide ? " luk-wide" : ""}" aria-labelledby="luk-c-${c.id}"><h3 id="luk-c-${c.id}">${esc(c.title)}</h3><p class="card-note">${esc(c.note || "")}</p><div class="ssk-scroll">${c.svg || c.html || ""}</div></section>`).join("");
  if (bars) {
    const li = (a) => a.map((s) => `<li>${esc(s)}</li>`).join("");
    $("luk-notes-body").innerHTML = `<h3>${esc(t("js-lunarinfra-findings", "Findings"))}</h3><ul class="luk-list">${li(bars.findings)}</ul><h3>${esc(t("js-lunarinfra-disclosures", "Disclosures"))}</h3><ul class="luk-list">${li(bars.disclosures)}</ul><h3>${esc(t("js-lunarinfra-not-verified", "Not verified"))}</h3><p class="luk-prov">${esc(bars.notVerified)}</p>`;
    $("luk-notes").hidden = false;
  }
  $("luk-prov").textContent = [m.label, t("js-lunarinfra-advisory", "Advisory software, not type-approved equipment; no transmit path of any kind.")].join(" ").trim();
}

function wire() {
  try { matchMedia("(min-width: 901px)").addEventListener("change", () => { if (last) draw(last[0], last[1]); }); } catch (e) { /* no matchMedia */ }
  $("luk-tabs").replaceChildren(...SCENARIOS.map((s) => { const b = document.createElement("button"); b.type = "button"; b.setAttribute("role", "tab"); b.className = "luk-tab"; b.dataset.id = s.id; b.textContent = s.title; b.addEventListener("click", () => open(s.id)); return b; }));
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
}
wire();
loadBars().then(() => open(new URLSearchParams(location.search).get("study") || SCENARIOS[0].id));
