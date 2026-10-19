// SPDX-License-Identifier: AGPL-3.0-only
// Optical PNT page: the DOM layer. What it reads and draws is in lib/optical.mjs. It fetches only this folder's own
// recorded results (recorded/<scenario>.json); nothing leaves the page.
import { SCENARIOS, readOptical, chartsOf, factRows, fmtPct } from "../lib/optical.mjs";

const $ = (id) => document.getElementById(id);
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
let current = null;

function setStatus(msg, err) { const s = $("op-status"); s.textContent = msg; s.classList.toggle("err", !!err); }

async function open(id) {
  const sc = SCENARIOS.find((s) => s.id === id) || SCENARIOS[0];
  current = sc.id;
  for (const b of $("op-tabs").children) b.setAttribute("aria-selected", String(b.dataset.id === sc.id)), (b.tabIndex = b.dataset.id === sc.id ? 0 : -1);
  $("op-blurb").textContent = sc.blurb;
  setStatus(`Opening ${sc.title}…`);
  try {
    const r = await fetch(`recorded/${sc.id}.json`);
    if (!r.ok) throw new Error("the recorded result did not load");
    const { model: m, error } = readOptical(await r.json());
    if (error) throw new Error(error);
    if (current !== sc.id) return;
    draw(m, sc);
    setStatus(`${sc.title}: the engine's recorded result (version ${m.engine}). Model output, not a measurement.`);
    try { const q = new URLSearchParams(location.search); q.set("scenario", sc.id); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
  } catch (e) { setStatus(`${sc.title} could not be opened: ${e && e.message ? e.message : e}.`, true); }
}

function draw(m, sc) {
  lastModel = m;
  $("op-body").hidden = false;
  $("op-summary").textContent = m.summary;
  $("op-kv").innerHTML = factRows(m).map(([k, v]) => `<div><dt>${esc(k)}</dt><dd>${esc(v)}</dd></div>`).join("");
  $("op-charts").innerHTML = chartsOf(m, { wide: matchMedia("(min-width: 901px)").matches }).map((c) => `<section class="card op-card${c.wide ? " op-wide" : ""}" aria-labelledby="op-c-${c.id}"><div class="card-head"><h3 id="op-c-${c.id}">${esc(c.title)}</h3><p class="card-note">${esc(c.note)}</p></div>${c.svg}<p class="op-tag">Model output</p></section>`).join("");
  const rows = m.sites;
  $("op-table").innerHTML = `<thead><tr><th scope="col">Site</th><th scope="col">Latitude, longitude</th><th scope="col">Cloud probability (input)</th><th scope="col">Clear-air loss</th><th scope="col">Fade budget</th><th scope="col">Availability</th><th scope="col">Ceiling</th><th scope="col">Mean outage</th><th scope="col">Outages per year</th><th scope="col">Scintillation index</th></tr></thead><tbody>${rows.map((s) => `<tr><th scope="row">${esc(s.name)}</th><td>${s.lat ?? "n/a"}, ${s.lon ?? "n/a"}</td><td>${s.pCloud == null ? "n/a" : `${Math.round(s.pCloud * 100)} %`}</td><td>${s.clearAirLossDb == null ? "n/a" : `${s.clearAirLossDb.toFixed(2)} dB`}</td><td>${s.fadeBudgetDb == null ? "n/a" : `${s.fadeBudgetDb.toFixed(1)} dB`}</td><td>${fmtPct(s.availability)}</td><td>${fmtPct(s.ceiling)}</td><td>${s.meanOutageH == null ? "n/a" : `${s.meanOutageH} h`}</td><td>${s.perYear == null ? "n/a" : Math.round(s.perYear)}</td><td>${s.turbulence && s.turbulence.scint != null ? s.turbulence.scint.toPrecision(3) : "n/a"}</td></tr>`).join("")}</tbody>`;
  $("op-prov").textContent = `${m.label} Sites: ${rows.map((s) => `${s.name} (${s.source || "no source stated"})`).join("; ")}.`;
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
