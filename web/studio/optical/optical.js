// SPDX-License-Identifier: AGPL-3.0-only
// Optical PNT page: the DOM layer. What it reads and draws is in lib/optical.mjs. It fetches only this folder's own
// recorded results (recorded/<scenario>.json); nothing leaves the page.
import { SCENARIOS, readOptical, chartsOf, factRows, fmtPct } from "../lib/optical.mjs";
import { mountBadge } from "../lib/evidence.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
let current = null;

function setStatus(msg, err) { const s = $("op-status"); s.textContent = msg; s.classList.toggle("err", !!err); }

async function open(id) {
  const sc = SCENARIOS.find((s) => s.id === id) || SCENARIOS[0];
  current = sc.id;
  for (const b of $("op-tabs").children) b.setAttribute("aria-selected", String(b.dataset.id === sc.id)), (b.tabIndex = b.dataset.id === sc.id ? 0 : -1);
  $("op-blurb").textContent = sc.blurb;
  setStatus(t("js-opt-opening", "Opening { $title }…", { title: sc.title }));
  try {
    const r = await fetch(`recorded/${sc.id}.json`);
    if (!r.ok) throw new Error(t("js-opt-result-not-loaded", "the recorded result did not load"));
    const { model: m, error } = readOptical(await r.json());
    if (error) throw new Error(error);
    if (current !== sc.id) return;
    draw(m, sc);
    setStatus(t("js-opt-recorded", "{ $title }: the engine's recorded result (version { $version }). Model output, not a measurement.", { title: sc.title, version: m.engine }));
    try { const q = new URLSearchParams(location.search); q.set("scenario", sc.id); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
  } catch (e) { setStatus(t("js-opt-open-failed", "{ $title } could not be opened: { $reason }.", { title: sc.title, reason: e && e.message ? e.message : e }), true); }
}

function draw(m, sc) {
  lastModel = m;
  mountBadge($("op-evb"), m);
  $("op-body").hidden = false;
  $("op-summary").textContent = m.summary;
  $("op-kv").innerHTML = factRows(m).map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
  $("op-charts").innerHTML = chartsOf(m, { wide: matchMedia("(min-width: 901px)").matches }).map((c) => `<section class="card op-card${c.wide ? " op-wide" : ""}" aria-labelledby="op-c-${c.id}"><div class="card-head"><h3 id="op-c-${c.id}">${esc(c.title)}</h3><p class="card-note">${esc(c.note)}</p></div>${c.svg}<p class="op-tag">${esc(t("js-opt-model-output", "Model output"))}</p></section>`).join("");
  const rows = m.sites, na = t("js-opt-na", "n/a");
  $("op-table").innerHTML = `<thead><tr>${[t("js-opt-th-site", "Site"), t("js-opt-th-latlon", "Latitude, longitude"), t("js-opt-th-cloud-prob", "Cloud probability (input)"), t("js-opt-th-clear-air", "Clear-air loss"), t("js-opt-th-fade-budget", "Fade budget"), t("js-opt-th-availability", "Availability"), t("js-opt-th-ceiling", "Ceiling"), t("js-opt-th-mean-outage", "Mean outage"), t("js-opt-th-outages-year", "Outages per year"), t("js-opt-th-scint", "Scintillation index")].map((h) => `<th scope="col">${esc(h)}</th>`).join("")}</tr></thead><tbody>${rows.map((s) => `<tr><th scope="row">${esc(s.name)}</th><td>${s.lat ?? na}, ${s.lon ?? na}</td><td>${s.pCloud == null ? na : `${Math.round(s.pCloud * 100)} %`}</td><td>${s.clearAirLossDb == null ? na : `${s.clearAirLossDb.toFixed(2)} dB`}</td><td>${s.fadeBudgetDb == null ? na : `${s.fadeBudgetDb.toFixed(1)} dB`}</td><td>${fmtPct(s.availability)}</td><td>${fmtPct(s.ceiling)}</td><td>${s.meanOutageH == null ? na : `${s.meanOutageH} h`}</td><td>${s.perYear == null ? na : Math.round(s.perYear)}</td><td>${s.turbulence && s.turbulence.scint != null ? s.turbulence.scint.toPrecision(3) : na}</td></tr>`).join("")}</tbody>`;
  $("op-prov").textContent = t("js-opt-prov", "{ $label } Sites: { $sites }.", { label: m.label, sites: rows.map((s) => `${s.name} (${s.source || t("js-opt-no-source", "no source stated")})`).join("; ") });
}

let lastModel = null;
function wire() {
  try { matchMedia("(min-width: 901px)").addEventListener("change", () => { if (lastModel) draw(lastModel, null); }); } catch (e) { /* no matchMedia */ }
  $("op-tabs").replaceChildren(...SCENARIOS.map((s) => { const b = document.createElement("button"); b.type = "button"; b.setAttribute("role", "tab"); b.className = "op-tab"; b.dataset.id = s.id; b.textContent = s.title; b.addEventListener("click", () => open(s.id)); return b; }));
  $("op-tabs").addEventListener("keydown", (ev) => {
    const i = SCENARIOS.findIndex((s) => s.id === current), d = ev.key === "ArrowRight" ? 1 : ev.key === "ArrowLeft" ? -1 : 0;
    if (!d) return; ev.preventDefault();
    const n = SCENARIOS[(i + d + SCENARIOS.length) % SCENARIOS.length]; open(n.id); $("op-tabs").querySelector(`[data-id="${n.id}"]`).focus();
  });
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
}
wire();
open(new URLSearchParams(location.search).get("scenario") || SCENARIOS[0].id);
