// SPDX-License-Identifier: AGPL-3.0-only
// Geometry view: the DOM layer (design note 2026-10-12, section 3). The state and its address are
// lib/geometry-url.mjs, skyline drawing is lib/skyline-edit.mjs, the drawing helpers are lib/skyplot.mjs, and
// every number shown comes from the engine through lib/geometry-adapter.mjs. Nothing here fetches anything or
// computes a navigation quantity.
import { parseState, buildSearch, normaliseState, SKYLINE_PRESETS, SKYLINE_SCENARIOS, LEO_PRESETS, MC_CHOICES, MAX_T } from "../lib/geometry-url.mjs";
import { SCENARIOS } from "../lib/catalog.mjs";
import { emptyTable, paint, keyEdit, describe, outlinePoints, isOpen, elAt } from "../lib/skyline-edit.mjs";
import { project, unproject, outlinePath, markerPath, niceExtent, ellipseAttrs, fmtDop, styleFor } from "../lib/skyplot.mjs";
import { createGeometryAdapter, SKYLINE_LABELS, readTleInput } from "../lib/geometry-adapter.mjs";
import { parseSvgMarkup, sanitizeSvg } from "../lib/svgsafe.mjs";
import { getEngine } from "../lib/engine-page.mjs";

const $ = (id) => document.getElementById(id);
const NS = "http://www.w3.org/2000/svg";
const CX = 200, CY = 200, R = 172;
// Places to jump to (a convenience: only the coordinates go into the address).
const PLACES = [
  ["Oslo harbour, Norway", 59.91, 10.75, 5], ["Tallinn harbour, Estonia", 59.444, 24.765, 10], ["Port of Rotterdam, Netherlands", 51.955, 4.05, 5],
  ["Geirangerfjord, Norway", 62.101, 7.206, 5], ["Midtown Manhattan, United States", 40.754, -73.984, 15], ["Singapore Strait", 1.264, 103.84, 5], ["Tromsø, Norway", 69.649, 18.956, 10],
];

function el(tag, attrs, ...kids) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs || {})) if (v != null) n.setAttribute(k, v);
  for (const k of kids.flat()) if (k != null) n.append(k.nodeType ? k : document.createTextNode(String(k)));
  return n;
}
function sv(tag, attrs, ...kids) {
  const n = document.createElementNS(NS, tag);
  for (const [k, v] of Object.entries(attrs || {})) if (v != null) n.setAttribute(k, v);
  for (const k of kids.flat()) if (k != null) n.append(k.nodeType ? k : document.createTextNode(String(k)));
  return n;
}
const f1 = (x) => (Math.round(x * 10) / 10).toString();
const hhmm = (s) => `${Math.floor(s / 3600)} h ${String(Math.floor((s % 3600) / 60)).padStart(2, "0")} min`;
const NEEDS = "needs engine 0.36";

// ---------------------------------------------------------------- state
const first = parseState(location.search);
let state = first.state;
const extra = first.extra;
let table = state.sky.kind === "table" ? state.sky.table : emptyTable(); // what the skyplot draws
let skyProv = "";
let cursor = 0;         // the keyboard cursor's azimuth bin
let tle = null;         // {text, epochUtc}: pasted elements, in this page only (never in the address)
// The representative-sky notice as written in the page, kept as nodes (never re-read as markup).
const REP_NODES = [...$("gm-rep").childNodes].map((n) => n.cloneNode(true));
let adapter = null, features = null;
let result = null, cloud = null, cloudError = "";
let ticket = 0;

function setNotes(list) { $("gm-url-notes").replaceChildren(...list.map((t) => el("li", {}, t))); }
setNotes(first.notes);

function writeAddress() {
  try { history.replaceState(null, "", location.pathname + buildSearch({ ...state, tle: !!tle }, extra)); } catch { /* a sandboxed frame */ }
}

// The engine's scenarios that run under the chosen preset: links into the Studio's scenario picker.
function drawSkyScenarios() {
  const box = $("gm-sky-scen"), files = state.sky.kind === "preset" ? SKYLINE_SCENARIOS[state.sky.name] || [] : [];
  const rows = files.map((f) => SCENARIOS.find((x) => x[0] === f)).filter(Boolean);
  box.hidden = !rows.length;
  box.replaceChildren(...(rows.length ? ["The engine's scenarios under this skyline: ", ...rows.flatMap((r, i) => [i ? "; " : "", el("a", { href: `./?scenario=${encodeURIComponent(r[0].replace(/\.toml$/, ""))}` }, r[2])]), "."] : []));
}

// ---------------------------------------------------------------- controls
function fillOnce() {
  $("gm-place").append(el("option", { value: "" }, "A place…"), ...PLACES.map(([n], i) => el("option", { value: String(i) }, n)));
  $("gm-leo").append(...LEO_PRESETS.map((p) => el("option", { value: p }, p)));
  $("gm-sky").append(el("option", { value: "none" }, "Open horizon"), ...SKYLINE_PRESETS.map((p) => el("option", { value: `p:${p}` }, `Preset: ${SKYLINE_LABELS[p]}`)), el("option", { value: "canyon" }, "Street canyon"), el("option", { value: "table" }, "Drawn on the skyplot"));
  $("gm-mc").append(...MC_CHOICES.map((n) => el("option", { value: String(n) }, n ? String(n) : "Off")));
  const box = $("gm-sys");
  for (const id of ["gps", "galileo", "beidou", "leo"]) {
    const st = styleFor(id);
    const input = el("input", { type: "checkbox", value: id, id: `gm-sys-${id}` });
    const mark = sv("svg", { class: "gm-mk", viewBox: "0 0 16 16", "aria-hidden": "true" }, sv("path", { d: markerPath(st.shape, 8, 8, 5), style: `fill:${st.color}` }));
    box.append(el("label", { class: "gm-sysbox", id: `gm-sysl-${id}` }, input, mark, st.label));
  }
}

function fillControls() {
  $("gm-lat").value = state.lat; $("gm-lon").value = state.lon; $("gm-hgt").value = state.h;
  $("gm-t").max = String(Math.max(86400, state.t)); $("gm-t").value = state.t; $("gm-t-out").textContent = hhmm(state.t);
  // With pasted elements the offset counts from their epoch (the engine adds it), not from the presets' epoch.
  $("gm-t-from").textContent = tle ? `Offset from your elements' epoch (${tle.epochUtc.replace("T", " ").replace("Z", " UTC")})` : "Offset from the constellations' reference epoch";
  for (const id of ["gps", "galileo", "beidou"]) $(`gm-sys-${id}`).checked = state.sys.includes(id);
  $("gm-sys-leo").checked = !!state.leo;
  $("gm-leo").value = state.leo || LEO_PRESETS[0];
  $("gm-mask").value = state.mask; $("gm-mask-out").textContent = `${state.mask}°`;
  $("gm-sky").value = state.sky.kind === "preset" ? `p:${state.sky.name}` : state.sky.kind;
  $("gm-canyon").hidden = state.sky.kind !== "canyon";
  const c = state.sky.kind === "canyon" ? state.sky : { streetAz: 0, widthM: 20, leftM: 30, rightM: 30, antennaM: 1.5 };
  $("gm-c-az").value = c.streetAz; $("gm-c-w").value = c.widthM; $("gm-c-l").value = c.leftM; $("gm-c-r").value = c.rightM; $("gm-c-a").value = c.antennaM;
  $("gm-uere").value = state.uere; $("gm-mc").value = String(state.mc); $("gm-seed").value = state.seed;
  $("gm-sky-prov").textContent = skyProv;
  drawSkyScenarios();
}

function applyFeatures() {
  const f = features;
  const off = [];
  $("gm-sys-leo").disabled = !f.systems.leo; $("gm-leo").disabled = !f.systems.leo;
  $("gm-sysl-leo").classList.toggle("off", !f.systems.leo);
  if (!f.systems.leo) off.push(`LEO: ${NEEDS}.`);
  if (!f.skyline) off.push(`Applying a skyline ${NEEDS}: here it is drawn only.`);
  $("gm-sky").querySelector('option[value="canyon"]').disabled = !f.canyon;
  if (!f.canyon) off.push(`The street-canyon form ${NEEDS}.`);
  $("gm-mc").disabled = !f.monteCarlo; $("gm-seed").disabled = !f.monteCarlo;
  if (!f.monteCarlo) off.push(`The Monte Carlo cloud ${NEEDS}.`);
  $("gm-svg").hidden = !f.svg;
  $("gm-tle-box").hidden = !f.tle;
  $("gm-sys-note").textContent = off.join(" ");
}

function readControls() {
  const num = (id, fallback) => { const v = $(id).valueAsNumber; return Number.isFinite(v) ? v : fallback; };
  const skyVal = $("gm-sky").value;
  let sky;
  if (skyVal === "none") sky = { kind: "none" };
  else if (skyVal.startsWith("p:")) sky = { kind: "preset", name: skyVal.slice(2) };
  else if (skyVal === "canyon") sky = { kind: "canyon", streetAz: num("gm-c-az", 0), widthM: num("gm-c-w", 20), leftM: num("gm-c-l", 30), rightM: num("gm-c-r", 30), antennaM: num("gm-c-a", 1.5) };
  else sky = { kind: "table", table };
  return {
    ...state,
    lat: num("gm-lat", state.lat), lon: num("gm-lon", state.lon), h: num("gm-hgt", state.h), t: num("gm-t", state.t),
    sys: ["gps", "galileo", "beidou"].filter((id) => $(`gm-sys-${id}`).checked),
    leo: $("gm-sys-leo").checked && !$("gm-sys-leo").disabled ? $("gm-leo").value : null,
    mask: num("gm-mask", state.mask), uere: num("gm-uere", state.uere), mc: Number($("gm-mc").value), seed: num("gm-seed", state.seed), sky,
  };
}

const skyKey = (s) => JSON.stringify({ ...s, table: s.table ? Array.from(s.table).join() : undefined });

async function commit(next) {
  if (!next.sys.length && !next.leo) { setNotes(["Pick at least one constellation."]); fillControls(); return; }
  const prevSky = skyKey(state.sky);
  const { state: n, refused } = normaliseState(next);
  const notes = refused.length ? [`Out of range, so kept at the last good value: ${refused.join(", ")}.`] : [];
  if (next.sky.kind === "canyon" && n.sky.kind !== "canyon") notes.push("The street-canyon values are out of range (azimuth 0 to 359.9°, width 1 to 200 m, heights 0 to 500 m, antenna 0 to 50 m); an open horizon is used.");
  setNotes(notes);
  state = n;
  if (skyKey(state.sky) !== prevSky) await loadSky();
  writeAddress();
  fillControls();
  schedule();
}

// The table the skyplot draws for the chosen skyline: the engine's whenever it can give it.
async function loadSky() {
  const sky = state.sky;
  skyProv = "";
  try {
    if (sky.kind === "none") table = emptyTable();
    else if (sky.kind === "table") table = sky.table;
    else if (sky.kind === "preset") { const p = await adapter.preset(sky.name); table = p.table; skyProv = p.provenance; }
    else if (sky.kind === "canyon") { const t = adapter && (await adapter.profile(sky)); table = t || emptyTable(); skyProv = t ? "The engine's reduction of the canyon to a 360-bin table." : `The street-canyon form ${NEEDS}.`; }
  } catch (e) { table = emptyTable(); skyProv = `The skyline could not be loaded (${e && e.message ? e.message : e}).`; }
}

$("gm-form").addEventListener("change", (ev) => {
  const t = ev.target;
  if (t.id === "gm-place") {
    const p = PLACES[Number(t.value)];
    if (p) { $("gm-lat").value = p[1]; $("gm-lon").value = p[2]; $("gm-hgt").value = p[3]; }
    t.value = "";
  }
  if (["gm-brush", "gm-tle", "gm-tle-epoch"].includes(t.id)) return;
  commit(readControls());
});
$("gm-form").addEventListener("submit", (ev) => ev.preventDefault());
$("gm-mask").addEventListener("input", () => { $("gm-mask-out").textContent = `${$("gm-mask").value}°`; drawPlot(); });
$("gm-t").addEventListener("input", () => { $("gm-t-out").textContent = hhmm(Number($("gm-t").value)); });
for (const b of document.querySelectorAll("[data-step]")) b.addEventListener("click", () => {
  commit({ ...state, t: Math.max(0, Math.min(MAX_T, state.t + Number(b.dataset.step))) });
});
$("gm-sky-clear").addEventListener("click", () => { table = emptyTable(); commit({ ...state, sky: { kind: "none" } }); });

// Pasted elements (offered only when the engine takes them: features.tle). They stay in this page.
function setRep() {
  if (!tle) { $("gm-rep").replaceChildren(...REP_NODES.map((n) => n.cloneNode(true))); return; }
  // The engine's own sentence about the sky it drew, once it has answered; until then the page's.
  const said = result && result.backend === "geometry" && result.skyStatement;
  $("gm-rep").replaceChildren(el("b", {}, `Your own elements at ${tle.epochUtc.replace("T", " ").replace("Z", " UTC")}.`), " ", said || "A dated sky only as good as the elements and their age; the presets are left out.");
}
$("gm-tle-use").addEventListener("click", () => {
  const r = readTleInput($("gm-tle").value, $("gm-tle-epoch").value);
  if (r.error) { setNotes([r.error]); return; }
  tle = r.tle;
  setNotes(["Using your own elements. A link carries only that you used them, not the elements themselves."]);
  setRep(); writeAddress(); fillControls(); schedule();
});
$("gm-tle-clear").addEventListener("click", () => { tle = null; $("gm-tle").value = ""; setNotes([]); setRep(); writeAddress(); fillControls(); schedule(); });

$("gm-copy").addEventListener("click", async () => {
  const url = location.origin + location.pathname + buildSearch({ ...state, tle: !!tle }, extra);
  try { await navigator.clipboard.writeText(url); $("gm-copy-out").textContent = tle ? "Link copied (without your pasted elements: a link opens the presets)." : "Link copied."; }
  catch { $("gm-copy-out").textContent = `Copy this link: ${url}`; }
});

// The engine's SVG skyplot, only ever adopted through svgsafe (design note section 3.5).
$("gm-svg").addEventListener("click", async () => {
  try {
    const root = parseSvgMarkup(await adapter.svg(state, tle));
    if (!root) throw new Error("the engine's SVG was refused");
    sanitizeSvg(root);
    const blob = new Blob([new XMLSerializer().serializeToString(root)], { type: "image/svg+xml" });
    const a = el("a", { href: URL.createObjectURL(blob), download: "kshana-skyplot.svg" });
    document.body.append(a); a.click(); a.remove();
    setTimeout(() => URL.revokeObjectURL(a.href), 5000);
    $("gm-copy-out").textContent = "Skyplot downloaded.";
  } catch (e) { $("gm-copy-out").textContent = `The skyplot could not be exported (${e && e.message ? e.message : e}).`; }
});

$("btn-theme").addEventListener("click", () => {
  const root = document.documentElement;
  const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
  root.dataset.theme = dark ? "light" : "dark";
  try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch { /* storage blocked */ }
});
// "What this shows" is on this page; with <base href="../"> a bare #about would leave it.
for (const a of document.querySelectorAll('a[href="geometry/#about"]')) a.addEventListener("click", (ev) => { ev.preventDefault(); $("about").scrollIntoView({ behavior: "smooth" }); $("gm-about-h").setAttribute("tabindex", "-1"); $("gm-about-h").focus({ preventScroll: true }); });

// ---------------------------------------------------------------- the skyplot
const plot = $("gm-plot");
let showCursor = false;
function svgPoint(ev) {
  const m = plot.getScreenCTM();
  if (!m) return null;
  const p = new DOMPoint(ev.clientX, ev.clientY).matrixTransform(m.inverse());
  return { x: p.x, y: p.y };
}

function drawPlot() {
  const kids = [];
  const mask = Number($("gm-mask").value);
  kids.push(sv("circle", { cx: CX, cy: CY, r: R, class: "g-sky" }));
  if (!isOpen(table)) kids.push(sv("path", { d: outlinePath(outlinePoints(table), CX, CY, R), class: "g-skyline", "fill-rule": "evenodd" }));
  if (mask > 0) kids.push(sv("circle", { cx: CX, cy: CY, r: ((90 - mask) / 90) * R, class: "g-mask" }));
  for (const e of [30, 60]) kids.push(sv("circle", { cx: CX, cy: CY, r: ((90 - e) / 90) * R, class: "g-ring" }));
  for (let a = 0; a < 360; a += 30) { const p = project(a, 0, CX, CY, R); kids.push(sv("line", { x1: CX, y1: CY, x2: p.x, y2: p.y, class: "g-ring" })); }
  for (const [a, t] of [[0, "N"], [90, "E"], [180, "S"], [270, "W"]]) { const p = project(a, 0, CX, CY, R + 14); kids.push(sv("text", { x: p.x, y: p.y + 4, class: "g-card", "text-anchor": "middle", "aria-hidden": "true" }, t)); }
  for (const e of [30, 60]) { const p = project(0, e, CX, CY, R); kids.push(sv("text", { x: p.x + 3, y: p.y - 2, class: "g-tick", "aria-hidden": "true" }, `${e}°`)); }
  const sats = result ? result.sats : [];
  const g = sv("g", { class: "g-sats" });
  for (const s of sats) {
    const st = styleFor(s.sys);
    const p = project(s.az, s.el, CX, CY, R);
    const what = s.masked ? "hidden by the skyline" : s.used ? "in the solution" : "not used";
    g.append(sv("path", { d: markerPath(st.shape, p.x, p.y, 6.5), class: `g-sat ${s.masked ? "masked" : s.used ? "used" : "unused"}`, style: `--c:${st.color}` }, sv("title", {}, `${st.label} ${s.id}: azimuth ${s.az}°, elevation ${s.el}°, ${what}`)),
      sv("text", { x: p.x + 8.5, y: p.y + 3.5, class: "g-id", "aria-hidden": "true" }, s.id));
  }
  kids.push(g);
  if (showCursor) {
    const a = project(cursor, 0, CX, CY, R), b = project(cursor, elAt(table, cursor), CX, CY, R);
    kids.push(sv("line", { x1: CX, y1: CY, x2: a.x, y2: a.y, class: "g-cursor" }), sv("circle", { cx: b.x, cy: b.y, r: 6, class: "g-cursor-dot" }));
  }
  plot.replaceChildren(...kids);
  $("gm-plot-desc").textContent = `${describe(table)} ${sats.length} satellites in the plot, ${sats.filter((s) => s.used).length} in the solution.`;
}

// Pointer drawing: a stroke paints every bin it crosses.
let stroke = null;
plot.addEventListener("pointerdown", (ev) => {
  const p = svgPoint(ev);
  if (!p || Math.hypot(p.x - CX, p.y - CY) > R + 4) return;
  const q = unproject(p.x, p.y, CX, CY, R);
  table = paint(table, q.az, q.el, q.az, q.el); // drawing over a preset or canyon starts from its outline
  stroke = { id: ev.pointerId, az: q.az, el: q.el };
  plot.setPointerCapture(ev.pointerId);
  ev.preventDefault();
  drawPlot();
});
plot.addEventListener("pointermove", (ev) => {
  if (!stroke || ev.pointerId !== stroke.id) return;
  const p = svgPoint(ev);
  if (!p) return;
  const q = unproject(p.x, p.y, CX, CY, R);
  table = paint(table, stroke.az, stroke.el, q.az, q.el);
  stroke.az = q.az; stroke.el = q.el;
  drawPlot();
});
const endStroke = (ev) => {
  if (!stroke || ev.pointerId !== stroke.id) return;
  stroke = null;
  commit({ ...state, sky: { kind: "table", table } });
};
plot.addEventListener("pointerup", endStroke);
plot.addEventListener("pointercancel", endStroke);
// Keyboard drawing round the horizon.
plot.addEventListener("focus", () => { showCursor = true; drawPlot(); });
plot.addEventListener("blur", () => { showCursor = false; drawPlot(); });
plot.addEventListener("keydown", (ev) => {
  const r = keyEdit(table, cursor, ev.key, ev.shiftKey, Number($("gm-brush").value));
  if (!r) return;
  ev.preventDefault();
  const changed = r.table !== table;
  cursor = r.cursor;
  $("gm-cursor-live").textContent = `Azimuth ${cursor}°, skyline ${elAt(r.table, cursor)}°.`;
  if (changed) { table = r.table; commit({ ...state, sky: { kind: "table", table } }); }
  else drawPlot();
});

// ---------------------------------------------------------------- readouts
function drawLegend() {
  const sats = result ? result.sats : [];
  const shown = [...new Set(sats.map((s) => s.sys))];
  $("gm-legend").replaceChildren(...shown.map((s) => {
    const st = styleFor(s);
    const n = sats.filter((x) => x.sys === s);
    return el("li", {}, sv("svg", { class: "gm-mk", viewBox: "0 0 16 16", "aria-hidden": "true" }, sv("path", { d: markerPath(st.shape, 8, 8, 5), style: `fill:${st.color}` })), `${st.label}: ${n.filter((x) => x.used).length} in the solution of ${n.length}`);
  }));
}

function drawDops() {
  const d = result ? result.dop : {};
  const digits = result ? result.dopDigits : 2;
  const rows = [["GDOP", "gdop", "geometric"], ["PDOP", "pdop", "position, 3-D"], ["HDOP", "hdop", "horizontal"], ["VDOP", "vdop", "vertical"], ["TDOP", "tdop", "time"]];
  const na = result && result.backend === "interim" ? NEEDS : "not given";
  $("gm-dops").replaceChildren(...rows.flatMap(([abbr, k, what]) => {
    const v = d && Number.isFinite(d[k]) ? d[k] : null;
    return [el("dt", {}, el("abbr", { title: `${what} dilution of precision` }, abbr), el("small", {}, what)), el("dd", { class: v === null ? "na" : "" }, v === null ? na : fmtDop(v, digits))];
  }));
  const geo = result && result.backend === "geometry";
  const counts = result ? [
    ["In view", String(result.nVisible)],
    ["Hidden by the skyline", geo ? String(result.nMasked) : NEEDS],
    ["In the solution", String(result.nUsed)],
    ...(Number.isFinite(result.nBelow) ? [["Below the horizon", String(result.nBelow)]] : []),
    ["Open sky", Number.isFinite(result.openFraction) ? `${Math.round(result.openFraction * 100)} % of the upper hemisphere` : geo ? "not given" : NEEDS],
  ] : [];
  $("gm-counts").replaceChildren(...counts.flatMap(([k, v]) => [el("dt", {}, k), el("dd", { class: /needs|not given/.test(v) ? "na" : /^\d+$/.test(v) ? "" : "txt" }, v)]));
  // Only the engine's numbers: no multiplication here (the 0.35 GSA DOPs are rounded, and no figure is made in the page).
  $("gm-used").textContent = errorLine();
  drawModel();
}

// Position error ≈ σ_UERE × DOP, in the engine's figures: the 1-sigma east and north errors of its ellipse, and the
// cloud's predicted RMS. With the 0.35 engine the relation is stated without a figure.
function errorLine() {
  if (!result) return "";
  if (result.backend !== "geometry") return `Position error ≈ σ_UERE × HDOP horizontally and σ_UERE × VDOP vertically; the figure ${NEEDS}.`;
  const e = result.ellipse, bits = [];
  if (e && Number.isFinite(e.sigmaEastM) && Number.isFinite(e.sigmaNorthM)) bits.push(`1-sigma error east ${f1(e.sigmaEastM)} m, north ${f1(e.sigmaNorthM)} m`);
  if (cloud && Number.isFinite(cloud.predictedHorizontalM)) bits.push(`horizontal RMS σ_UERE × HDOP = ${f1(cloud.predictedHorizontalM)} m`);
  if (cloud && Number.isFinite(cloud.predicted3dM)) bits.push(`3-D RMS σ_UERE × PDOP = ${f1(cloud.predicted3dM)} m`);
  return bits.length ? `With σ_UERE = ${state.uere} m, under the stated error model (engine figures): ${bits.join("; ")}.` : "";
}

// The engine's own label, statement and advisory, shown with its numbers (every 0.36 result carries them).
function drawModel() {
  const p = result && result.provenance;
  const box = $("gm-model");
  if (!p || !(p.label || p.statement || p.advisory)) { box.hidden = true; box.replaceChildren(); return; }
  box.hidden = false;
  box.replaceChildren(...[p.label && el("b", {}, p.label), p.statement && el("span", {}, ` ${p.statement}`), p.advisory && el("span", { class: "gm-model-adv" }, ` ${p.advisory}`)].filter(Boolean));
}

function drawError() {
  const svg = $("gm-errplot");
  const e = result && result.ellipse;
  const c = cloud && cloud.points.length ? cloud : null;
  if (!e && !c) {
    const interim = result && result.backend === "interim";
    const why = !result ? "Waiting for the engine." : interim ? `The error ellipse and the Monte Carlo cloud ${NEEDS} (its sky_geometry and sky_monte_carlo functions); the engine in this page is older.` : `The engine gave no ellipse for this geometry (too few satellites for a fix, or a singular geometry)${cloudError ? `: ${cloudError}` : ""}.`;
    svg.replaceChildren(sv("rect", { x: 0, y: 0, width: 400, height: 400, class: "g-errbg" }), sv("text", { x: 200, y: 200, class: "g-empty", "text-anchor": "middle" }, interim ? "Needs engine 0.36" : "No ellipse"));
    $("gm-err-desc").textContent = why;
    $("gm-errfacts").replaceChildren(el("dt", {}, "Why"), el("dd", { class: "na wide" }, why));
    return;
  }
  const vals = [];
  const e95 = result && result.ellipse95;
  if (e) vals.push(e.semiMajorM * 1.1);
  if (e95) vals.push(e95.semiMajorM * 1.1);
  if (c) for (const p of c.points) vals.push(p[0], p[1]);
  const ext = niceExtent(vals, 1);
  const PX = 180, scale = PX / ext, cx = 200, cy = 200;
  const kids = [sv("rect", { x: 0, y: 0, width: 400, height: 400, class: "g-errbg" })];
  for (const k of [-1, -0.5, 0.5, 1]) kids.push(sv("line", { x1: cx + k * PX, y1: cy - PX, x2: cx + k * PX, y2: cy + PX, class: "g-ring" }), sv("line", { x1: cx - PX, y1: cy + k * PX, x2: cx + PX, y2: cy + k * PX, class: "g-ring" }));
  kids.push(sv("line", { x1: cx - PX, y1: cy, x2: cx + PX, y2: cy, class: "g-axis" }), sv("line", { x1: cx, y1: cy - PX, x2: cx, y2: cy + PX, class: "g-axis" }));
  kids.push(sv("text", { x: cx + PX, y: cy - 6, class: "g-tick", "text-anchor": "end" }, `E +${ext} m`), sv("text", { x: cx + 6, y: cy - PX + 10, class: "g-tick" }, `N +${ext} m`));
  if (c) { const g = sv("g", { class: "g-cloud", "aria-hidden": "true" }); for (const p of c.points) g.append(sv("circle", { cx: (cx + p[0] * scale).toFixed(1), cy: (cy - p[1] * scale).toFixed(1), r: 1.6 })); kids.push(g); }
  if (e) {
    if (e95) kids.push(sv("ellipse", { ...ellipseAttrs(e95, cx, cy, scale), class: "g-ell95" }));
    kids.push(sv("ellipse", { ...ellipseAttrs(e, cx, cy, scale), class: "g-ell" }));
  }
  svg.replaceChildren(...kids);
  const facts = [];
  if (e) {
    facts.push(["Ellipse, 1-sigma", `${f1(e.semiMajorM)} m × ${f1(e.semiMinorM)} m, long axis ${Math.round(((e.orientationDeg % 180) + 180) % 180)}° from north`]);
    if (e95) facts.push([`Ellipse, ${Math.round((e95.confidence ?? 0.95) * 100)} %`, `${f1(e95.semiMajorM)} m × ${f1(e95.semiMinorM)} m${Number.isFinite(e95.scaleK) ? ` (1-sigma × ${e95.scaleK.toFixed(3)})` : ""}`]);
  }
  if (c) {
    facts.push(["Monte Carlo", `${c.samples} least-squares solutions, seed ${c.seed ?? state.seed}`]);
    if (Number.isFinite(c.rmsHorizontalM)) facts.push(["Cloud RMS, horizontal", `${f1(c.rmsHorizontalM)} m${Number.isFinite(c.predictedHorizontalM) ? `, beside σ_UERE × HDOP = ${f1(c.predictedHorizontalM)} m` : ""}`]);
    if (Number.isFinite(c.rms3dM)) facts.push(["Cloud RMS, 3-D", `${f1(c.rms3dM)} m${Number.isFinite(c.predicted3dM) ? `, beside σ_UERE × PDOP = ${f1(c.predicted3dM)} m` : ""}`]);
    if (Number.isFinite(c.inside95)) facts.push(["Inside the 95 % ellipse", `${(c.inside95 * 100).toFixed(1)} % of the points`]);
  }
  $("gm-errfacts").replaceChildren(...facts.flatMap(([k, v]) => [el("dt", {}, k), el("dd", {}, v)]));
  $("gm-err-desc").textContent = facts.map(([k, v]) => `${k}: ${v}.`).join(" ");
}

function drawTable() {
  const rows = (result ? result.sats : []).map((s) => el("tr", {}, el("td", {}, styleFor(s.sys).label), el("td", {}, s.id), el("td", { class: "num" }, String(s.az)), el("td", { class: "num" }, String(s.el)), el("td", {}, s.masked ? "No: hidden by the skyline" : s.used ? "Yes" : "No")));
  $("gm-tab-n").textContent = `${rows.length} satellites, the same as the skyplot.`;
  $("gm-sats").tBodies[0].replaceChildren(...(rows.length ? rows : [el("tr", {}, el("td", { colspan: "5" }, "No satellites to show."))]));
}

function drawAll() { drawPlot(); drawLegend(); drawDops(); drawError(); drawTable(); }

// ---------------------------------------------------------------- compute
let timer = 0;
function schedule() { clearTimeout(timer); drawPlot(); timer = setTimeout(compute, 180); }
async function compute() {
  if (!adapter) return;
  const mine = ++ticket;
  $("gm-engine").textContent = "Computing…";
  try {
    const r = await adapter.compute(state, tle);
    if (mine !== ticket) return;
    result = r;
    cloud = null; cloudError = "";
    $("gm-source").textContent = [r.source ? `${r.source}.` : "", r.skySource ? `Sky: ${r.skySource}.` : "", ...r.notes].filter(Boolean).join(" ");
    setRep();
    $("gm-engine").textContent = r.backend === "none" ? r.notes[0] : r.missing.length ? `Ready. Needs engine 0.36: ${r.missing.join(", ")}.` : "Ready.";
    drawAll();
    if (features.monteCarlo && state.mc) {
      // A cloud the engine cannot draw (too few satellites for a fix) leaves the sky and the DOPs standing.
      let c = null;
      try { c = await adapter.monteCarlo(state, tle); }
      catch (e) { if (mine === ticket) cloudError = e && e.message ? e.message : String(e); }
      if (mine !== ticket) return;
      cloud = c;
      drawError();
      $("gm-used").textContent = errorLine();
    }
  } catch (e) {
    if (mine !== ticket) return;
    result = null; cloud = null;
    $("gm-engine").textContent = `The engine could not compute this sky: ${e && e.message ? e.message : e}`;
    drawAll();
  }
}

async function start() {
  fillOnce();
  fillControls();
  drawAll();
  const engine = await getEngine();
  adapter = createGeometryAdapter(engine);
  features = adapter.features;
  if (!engine.available) $("gm-engine").textContent = `The engine is not running in this browser (${engine.error || "WebAssembly is blocked"}).`;
  applyFeatures();
  await loadSky();
  fillControls();
  await compute();
}
start();
