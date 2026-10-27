// SPDX-License-Identifier: AGPL-3.0-only
// Interference map page: the DOM layer. Everything it knows about the files is in lib/interference.mjs
// and lib/geojson-layer.mjs. Files are read with File.text() in this page; nothing is sent anywhere.
import { withheld, MAX_BYTES, MAX_BYTES_TEXT, MAX_TABLE_ROWS, parseMapFile, parseRouteExposure, groupBySource, stateCounts, stateOf, stateInfo, statusInfo, STATES, KIND_LABEL, KEEP_CAVEATS, safeUrl, pct, cellRows, cellBounds, cellAt, describeMap, cellsForTable, showValue, fmtLat, fmtLon } from "../lib/interference.mjs";
import { makeView, pathOf } from "../lib/geojson-layer.mjs";
import { getEngine } from "../lib/engine-page.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const NS = "http://www.w3.org/2000/svg";
const MAX_MAPS = 12;

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

let maps = []; // parsed map files, each its own layer
let routes = []; // parsed route-exposure reports
const layer = { adsb: { visible: true, uid: null }, ais: { visible: true, uid: null } }; // per source: shown or not, and which day
let uid = 0;
const views = new Map(); // map.name+uid -> card state

function setStatus(msg, err) { const s = $("im-status"); s.textContent = msg; s.classList.toggle("err", !!err); }
function setNotes(list) { $("im-notes").replaceChildren(...list.map((note) => el("li", {}, note))); }

// "Opened N file(s); M map(s) open." has two counts, so each combination is its own message.
function openedSummary(files, mapCount) {
  const f = files > 1, m = mapCount > 1;
  if (f && m) return t("js-interf-opened-files-maps", "Opened { $files } files; { $maps } maps open.", { files, maps: mapCount });
  if (f) return t("js-interf-opened-files-map", "Opened { $files } files; { $maps } map open.", { files, maps: mapCount });
  if (m) return t("js-interf-opened-file-maps", "Opened { $files } file; { $maps } maps open.", { files, maps: mapCount });
  return t("js-interf-opened-file-map", "Opened { $files } file; { $maps } map open.", { files, maps: mapCount });
}

async function openTexts(items, label) {
  // Nothing in here may leave the page at "Reading…": every failure is said, with the file name.
  const notes = [], added = [];
  let current = "file";
  try {
    for (const it of items) {
      current = it.name;
      if (maps.length + added.filter((x) => x.kind).length >= MAX_MAPS) { notes.push(t("js-interf-not-opened-full", "{ $name }: not opened, { $max } maps are already open. Close some first.", { name: it.name, max: MAX_MAPS })); continue; }
      if (it.text.length > MAX_BYTES) { notes.push(t("js-interf-larger-than", "{ $name }: larger than { $limit }; this page reads map files up to that size.", { name: it.name, limit: MAX_BYTES_TEXT })); continue; }
      if (/"kshana_route_exposure"/.test(it.text.slice(0, 400))) {
        const rr = parseRouteExposure(it.text, it.name);
        if (rr.error) notes.push(rr.error); else { rr.report.uid = ++uid; routes.push(rr.report); added.push(rr.report); }
        continue;
      }
      const r = parseMapFile(it.text, it.name);
      if (r.error) { notes.push(r.error); continue; }
      r.map.uid = ++uid;
      r.map.text = it.text; // kept so route exposure can run on the maps that are open
      added.push(r.map);
    }
    maps.push(...added.filter((x) => x.kind));
    for (const m of added) if (m.kind) layer[m.kind].uid = m.uid; // the newest file of a source is the day shown
    render();
    $("im-clear").hidden = maps.length + routes.length === 0;
    if (added.length) setStatus(label || openedSummary(added.length, maps.length));
    else setStatus(notes.length ? t("js-interf-no-file-opened", "No file could be opened.") : t("js-interf-nothing-opened", "Nothing opened."), true);
    setNotes(notes);
  } catch (e) {
    setStatus(t("js-interf-read-draw-failed", "{ $name }: could not be read or drawn ({ $reason }).", { name: current, reason: e && e.message ? e.message : e }), true);
    setNotes(notes);
  }
}
async function openFiles(files) {
  if (!files || !files.length) return;
  setStatus(t("js-interf-reading", "Reading…"));
  try {
    const items = [], notes = [];
    for (const f of files) {
      if (f.size > MAX_BYTES) { notes.push(t("js-interf-larger-than", "{ $name }: larger than { $limit }; this page reads map files up to that size.", { name: f.name, limit: MAX_BYTES_TEXT })); continue; }
      items.push({ name: f.name, text: await f.text() });
    }
    if (!items.length) { setStatus(t("js-interf-no-file-opened", "No file could be opened."), true); setNotes(notes); return; }
    await openTexts(items);
    if (notes.length) setNotes([...notes, ...[...$("im-notes").children].map((li) => li.textContent)]);
  } catch (e) { setStatus(t("js-interf-read-failed", "{ $name }: could not be read ({ $reason }).", { name: files[0].name, reason: e && e.message ? e.message : e }), true); }
}
async function openDemo() {
  setStatus(t("js-interf-opening-demo", "Opening the synthetic demo…"));
  try {
    const names = ["adsb-custom-2026-03-02.geojson", "adsb-custom-2026-03-01.geojson", "ais-custom-2026-03-01.geojson"];
    const items = [];
    for (const n of names) { const r = await fetch("interference/demo/" + n); if (!r.ok) throw new Error(t("js-interf-did-not-load", "{ $url } did not load", { url: n })); items.push({ name: n, text: await r.text() }); }
    await openTexts(items, t("js-interf-demo-opened", "Synthetic demo: three made-up files on a made-up open-ocean region (two ADS-B days, one of them confounded, and one AIS day). No real aircraft, vessel or day is behind them. Use the day picker on the ADS-B layer."));
  } catch (e) { setStatus(t("js-interf-demo-failed", "The demo could not be opened: { $reason }.", { reason: e.message }), true); }
}

// ---------- drawing ----------

function render() {
  const box = $("im-maps");
  box.replaceChildren();
  views.clear();
  const groups = groupBySource(maps);
  if (groups.length > 1) box.append(el("p", { class: "im-sep", role: "note" }, t("js-interf-layers-separate", "ADS-B and AIS are separate layers with their own toggles, legends and licence lines. They are never merged into one colour field or one count.")));
  for (const g of groups) {
    const L = layer[g.kind];
    if (!g.maps.some((m) => m.uid === L.uid)) L.uid = g.maps[g.maps.length - 1].uid;
    const cur = g.maps.find((m) => m.uid === L.uid);
    const sec = el("section", { class: "im-group", "aria-labelledby": `im-g-${g.kind}` });
    const show = el("input", { type: "checkbox", id: `im-show-${g.kind}` }); show.checked = L.visible;
    show.onchange = () => { L.visible = show.checked; render(); };
    const head = el("div", { class: "im-ghead" },
      el("h2", { id: `im-g-${g.kind}`, class: "h3 im-gh" }, t("js-interf-layer-heading", "{ $kind } layer", { kind: KIND_LABEL[g.kind] }), el("small", {}, " ", g.kind === "adsb" ? t("js-interf-layer-adsb-sub", "cells where aircraft reported low navigation accuracy") : t("js-interf-layer-ais-sub", "cells where vessels reported implausible positions or motion"))),
      el("label", { class: "im-tog", for: `im-show-${g.kind}` }, show, t("js-interf-show-layer", "Show this layer")));
    if (g.maps.length > 1) {
      const sel = el("select", { id: `im-day-${g.kind}`, "aria-label": t("js-interf-day-aria", "{ $kind } day", { kind: KIND_LABEL[g.kind] }) }, g.maps.map((m) => el("option", { value: String(m.uid) }, m.date || m.name)));
      sel.value = String(L.uid);
      sel.onchange = () => { L.uid = Number(sel.value); render(); };
      head.append(el("label", { class: "im-tog", for: `im-day-${g.kind}` }, t("js-interf-day", "Day"), " ", sel, el("small", {}, " ", t("js-interf-one-day", "one day at a time"))));
    }
    sec.append(head);
    if (L.visible) sec.append(card(cur)); else sec.append(el("p", { class: "im-none" }, t("js-interf-layer-hidden", "The { $kind } layer is hidden.", { kind: KIND_LABEL[g.kind] })));
    box.append(sec);
  }
  if (routes.length) box.append(...routes.map(routeCard));
}

function card(m) {
  const st = { m, sel: -1, hidden: new Set(), svg: null, view: null, w: 0 };
  views.set(m.uid, st);
  const id = `im${m.uid}`;
  const art = el("article", { class: "card im-card", "data-kind": m.kind, "aria-labelledby": `${id}-h` });
  const close = el("button", { type: "button", class: "im-x", "aria-label": t("js-interf-close-file", "Close { $name }", { name: m.name }) }, t("js-interf-close", "Close"));
  close.onclick = () => { maps = maps.filter((x) => x.uid !== m.uid); render(); $("im-clear").hidden = maps.length + routes.length === 0; setStatus(maps.length ? t("js-interf-maps-open", { one: "{ $n } map open.", other: "{ $n } maps open." }, { n: maps.length }) : t("js-interf-nothing-open", "Nothing open yet.")); };
  art.append(el("div", { class: "im-head" },
    el("span", { class: `im-chip k-${m.kind}` }, KIND_LABEL[m.kind]),
    el("h3", { id: `${id}-h` }, m.date || t("js-interf-unknown-date", "unknown date"), el("small", {}, m.licence.name ? ` · ${m.licence.name}` : "")),
    el("span", { class: "im-file-name" }, m.name), close));
  if (m.warnings.length) art.append(el("ul", { class: "im-warn", role: "note" }, m.warnings.map((w) => el("li", {}, w))));
  art.append(licence(m));
  // map + detail
  const mapBox = el("div", { class: "im-mapbox" });
  const svg = sv("svg", { class: "im-svg", tabindex: "0", role: "application", "aria-label": t("js-interf-map-aria", "{ $summary } Arrow keys move between drawn cells.", { summary: describeMap(m) }), "aria-describedby": `${id}-sel` });
  mapBox.append(svg);
  st.svg = svg;
  const side = el("div", { class: "im-side" });
  side.append(legend(m, st, id));
  const sel = el("div", { class: "im-sel", id: `${id}-sel`, "aria-live": "polite" }, el("p", { class: "im-none" }, t("js-interf-click-cell", "Click a cell, or focus the map and use the arrow keys, to see its figures.")));
  st.selBox = sel;
  side.append(sel);
  art.append(el("div", { class: "im-body" }, mapBox, side));
  art.append(el("ul", { class: "im-keep", "aria-label": t("js-interf-read-with-map", "Read this with the map") }, KEEP_CAVEATS.map((c) => el("li", {}, c))));
  art.append(dayFigures(m));
  art.append(method(m));
  art.append(table(m, st));
  // draw once laid out
  requestAnimationFrame(() => draw(st));
  svg.addEventListener("pointerdown", (ev) => pick(st, ev));
  svg.addEventListener("pointermove", (ev) => { if (ev.pointerType === "mouse") hover(st, ev); });
  svg.addEventListener("keydown", (ev) => key(st, ev));
  return art;
}

function licence(m) {
  const L = m.licence;
  const box = el("section", { class: "im-licence", "aria-label": t("js-interf-licence-aria", "Data licence of { $name }", { name: m.name }) });
  box.append(el("h4", {}, t("js-interf-licence-heading", "Data licence and attribution")));
  const dl = el("dl", {});
  const row = (k, v) => { if (v) dl.append(el("dt", {}, k), el("dd", {}, v)); };
  const lic = el("dd", {}, L.licence || t("js-interf-none-stated-file", "(none stated in this file)"));
  const u = safeUrl(L.licenceUrl);
  if (L.licenceUrl) lic.append(" · ", u ? el("a", { href: u, target: "_blank", rel: "noopener noreferrer" }, L.licenceUrl) : L.licenceUrl);
  dl.append(el("dt", {}, t("js-interf-licence", "Licence")), lic);
  row(t("js-interf-attribution", "Attribution"), L.attribution || t("js-interf-none-stated-file", "(none stated in this file)"));
  row(t("js-interf-dataset", "Dataset"), [L.name, L.dataset && `(${L.dataset})`].filter(Boolean).join(" "));
  box.append(dl);
  if (L.coverage.length) box.append(el("p", { class: "im-sub" }, t("js-interf-coverage-limits", "Coverage limits of this source")), el("ul", {}, L.coverage.map((c) => el("li", {}, c))));
  if (L.notice) box.append(el("p", { class: "im-notice" }, L.notice));
  return box;
}

function legend(m, st, id) {
  const counts = stateCounts(m);
  const ul = el("ul", { class: "im-leg", "aria-label": t("js-interf-legend-aria", "What each cell state means; untick one to fade those cells") });
  for (const s0 of STATES.filter((x) => x.id !== "notobserved")) {
    const info = stateInfo(m.kind, s0.id);
    const cb = el("input", { type: "checkbox", checked: "", id: `${id}-s-${s0.id}` });
    cb.onchange = () => { if (cb.checked) st.hidden.delete(s0.id); else st.hidden.add(s0.id); draw(st); };
    ul.append(el("li", {}, el("label", { for: `${id}-s-${s0.id}`, title: info.text }, cb, swatch(s0.id), el("span", { class: "im-lt" }, el("b", {}, info.label), ` ${counts[s0.id]}`), el("span", { class: "im-ld" }, info.text))));
  }
  const no = stateInfo(m.kind, "notobserved");
  ul.append(el("li", { class: "im-nobs" }, el("label", {}, swatch("notobserved"), el("span", { class: "im-lt" }, el("b", {}, no.label), " ", t("js-interf-no-cell-drawn", "no cell drawn")), el("span", { class: "im-ld" }, no.text))));
  return ul;
}
function swatch(state) { return el("i", { class: `im-sw s-${state}`, "aria-hidden": "true" }); }

function dayFigures(m) {
  const d = m.day, rows = [];
  const lab = (k) => k.replace(/_/g, " ");
  for (const [k, v] of Object.entries(d)) rows.push([lab(k), typeof v === "number" && /share/.test(k) ? `${Math.round(v * 1000) / 10}%` : v === null ? t("js-interf-not-evaluated", "not evaluated") : showValue(v)]);
  const box = el("section", { class: "im-day", "aria-label": t("js-interf-day-figures-aria", "Figures for the day") }, el("h4", {}, t("js-interf-the-day", "The day")));
  if (d.day_confounded === true) box.append(el("p", { class: "im-conf" }, t("js-interf-day-confounded-note", "This day is confounded: no cell was called degraded because of the day’s background. Cells that would otherwise have stood out are shown as unassessed.")));
  if (!rows.length) { box.append(el("p", { class: "im-none" }, t("js-interf-no-day-figures", "This file states no day-level figures."))); return box; }
  box.append(el("dl", { class: "im-kv" }, rows.flatMap(([k, v]) => [el("dt", {}, k), el("dd", {}, v)])));
  return box;
}

function method(m) {
  const M = m.method, box = el("details", { class: "im-method", open: "" }, el("summary", {}, t("js-interf-method-summary", "Method and caveats")));
  if (M.id) box.append(el("p", { class: "im-mid" }, el("code", {}, M.id), m.version ? [" · ", t("js-interf-written-by", "written by Kshana { $version }", { version: m.version })] : ""));
  if (M.summary) box.append(el("p", {}, M.summary));
  if (Array.isArray(M.caveats) && M.caveats.length) box.append(el("h4", {}, t("js-interf-caveats", "Caveats")), el("ul", { class: "im-cav" }, M.caveats.map((c) => el("li", {}, c))));
  if (Array.isArray(M.guards) && M.guards.length) box.append(el("h4", {}, t("js-interf-guards", "Guards against other causes")), el("ul", {}, M.guards.map((c) => el("li", {}, c))));
  if (M.parameters && typeof M.parameters === "object") box.append(el("h4", {}, t("js-interf-parameters", "Parameters, fixed before any data was read")), el("dl", { class: "im-kv" }, Object.entries(M.parameters).flatMap(([k, v]) => [el("dt", {}, k.replace(/_/g, " ")), el("dd", {}, showValue(v))])));
  if (M.input_stats && typeof M.input_stats === "object") box.append(el("h4", {}, t("js-interf-input", "Input")), el("dl", { class: "im-kv" }, Object.entries(M.input_stats).flatMap(([k, v]) => [el("dt", {}, k.replace(/_/g, " ")), el("dd", {}, showValue(v))])));
  const g = m.grid;
  if (g && g.cell_deg) box.append(el("p", { class: "im-sub" }, t("js-interf-grid", "Grid: square cells of { $size }° in latitude and longitude ({ $type }). East-west width shrinks with latitude.", { size: g.cell_deg, type: g.type || "fixed" })));
  return box;
}

function table(m, st) {
  const box = el("details", { class: "im-tabled" }, el("summary", {}, t("js-interf-table-summary", "Every drawn cell as a table ({ $n })", { n: m.cells.length })));
  const all = cellsForTable(m), rows = all.slice(0, MAX_TABLE_ROWS);
  if (all.length > rows.length) box.append(el("p", { class: "im-none" }, t("js-interf-table-first", "First { $shown } of { $total } cells shown, calls that matter first.", { shown: rows.length, total: all.length })));
  const head = m.kind === "adsb"
    ? [t("js-interf-col-cell-area", "Cell area"), t("js-interf-col-status", "Status"), t("js-interf-col-observed", "Observed"), t("js-interf-col-sampled", "Sampled"), t("js-interf-col-affected", "Affected"), t("js-interf-col-share", "Share")]
    : [t("js-interf-col-cell-area", "Cell area"), t("js-interf-col-status", "Status"), t("js-interf-col-observed", "Observed"), t("js-interf-col-detectors", "Detectors")];
  const tbl = el("table", { class: "tbl" }, el("thead", {}, el("tr", {}, head.map((h) => el("th", { scope: "col" }, h)))));
  const tb = el("tbody", {});
  for (const { c, idx } of rows) {
    const b = cellBounds(c), p = c.props;
    const area = el("button", { type: "button", class: "im-rowbtn" }, `${fmtLat(b.south)}–${fmtLat(b.north)}, ${fmtLon(b.west)}–${fmtLon(b.east)}`);
    area.onclick = () => { select(st, idx); st.svg.scrollIntoView?.({ block: "nearest" }); };
    const cells = m.kind === "adsb"
      ? [p.aircraft_observed, p.aircraft_sampled, p.aircraft_affected, typeof p.affected_share === "number" ? `${Math.round(p.affected_share * 1000) / 10}%` : p.affected_share === null ? withheld() : ""].map((v) => (v === null ? withheld() : v))
      : [p.vessels_observed, Array.isArray(p.detectors) && p.detectors.length ? p.detectors.join(", ").replace(/_/g, " ") : t("js-interf-none", "none")];
    tb.append(el("tr", {}, el("td", {}, area), el("td", {}, statusInfo(m.kind, c.status).label), cells.map((v) => el("td", {}, v == null ? "" : String(v)))));
  }
  tbl.append(tb);
  box.append(el("div", { class: "table-scroll" }, tbl));
  return box;
}

// ---------- the map ----------

// Greedy word wrap to at most `n` characters a line (a word longer than a line is cut).
function wrap(text, n) {
  const out = [];
  let line = "";
  for (let word of String(text).split(/\s+/).filter(Boolean)) {
    while (word.length > n) { if (line) { out.push(line); line = ""; } out.push(word.slice(0, n)); word = word.slice(n); }
    if (line && line.length + 1 + word.length > n) { out.push(line); line = word; } else line = line ? `${line} ${word}` : word;
  }
  if (line) out.push(line);
  return out;
}

function draw(st) {
  const { m, svg } = st;
  const w = Math.max(280, Math.round(svg.parentElement.clientWidth) || 640), h = Math.round(w * (w < 520 ? 0.95 : 0.72));
  st.w = w;
  // The licence, attribution and coverage notes are drawn on the map itself, so a screenshot carries them.
  const L = m.licence, per = Math.max(24, Math.floor((w - 24) / 6.2));
  const licText = L.licence || t("js-interf-none-stated-file", "(none stated in this file)");
  const foot = [...wrap(t("js-interf-foot-attribution", "Attribution: { $text }", { text: L.attribution || t("js-interf-none-stated-file", "(none stated in this file)") }), per), ...wrap(L.licenceUrl ? t("js-interf-foot-licence-url", "Licence: { $licence } ({ $url })", { licence: licText, url: L.licenceUrl }) : t("js-interf-foot-licence", "Licence: { $licence }", { licence: licText }), per), ...(L.coverage.length ? wrap(t("js-interf-foot-coverage", "Coverage: { $notes }", { notes: L.coverage.join(" ") }), per) : []), ...wrap(t("js-interf-foot-layer", "{ $kind } layer, { $date }. Cells not drawn were not observed.", { kind: KIND_LABEL[m.kind], date: m.date }), per)];
  const footH = foot.length * 13 + 14, H = h + footH;
  svg.setAttribute("viewBox", `0 0 ${w} ${H}`);
  svg.replaceChildren();
  if (!m.bbox) { svg.append(sv("text", { x: 20, y: 30 }, t("js-interf-no-cells-draw", "This file has no cells to draw."))); return; }
  // pad the box a little so edge cells are not on the frame
  const cd = Number(m.grid.cell_deg) || 0.5;
  const bb = { west: m.bbox.west - cd * 0.25, east: m.bbox.east + cd * 0.25, south: m.bbox.south - cd * 0.25, north: m.bbox.north + cd * 0.25 };
  const view = makeView(bb, w, h, 28);
  st.view = view;
  const defs = sv("defs", {},
    sv("pattern", { id: `h-none-${m.uid}`, width: 6, height: 6, patternUnits: "userSpaceOnUse", patternTransform: "rotate(45)" }, sv("rect", { width: 6, height: 6, fill: "var(--im-none-bg)" }), sv("line", { x1: 0, y1: 0, x2: 0, y2: 6, stroke: "var(--im-none)", "stroke-width": 2 })),
    sv("pattern", { id: `h-hold-${m.uid}`, width: 6, height: 6, patternUnits: "userSpaceOnUse", patternTransform: "rotate(-45)" }, sv("rect", { width: 6, height: 6, fill: "var(--im-hold-bg)" }), sv("line", { x1: 0, y1: 0, x2: 0, y2: 6, stroke: "var(--im-hold)", "stroke-width": 2 })));
  svg.append(defs);
  // graticule
  const step = [0.5, 1, 2, 5, 10].find((s) => (bb.north - bb.south) / s <= 8) || 10;
  for (let lat = Math.ceil(bb.south / step) * step; lat <= bb.north; lat += step) { const y = view.project([bb.west, lat])[1]; svg.append(sv("line", { x1: 0, x2: w, y1: y, y2: y, class: "grat" }), sv("text", { x: 3, y: y - 3 }, fmtLat(lat))); }
  for (let lon = Math.ceil(bb.west / step) * step; lon <= bb.east; lon += step) { const x = view.project([lon, bb.north])[0]; svg.append(sv("line", { x1: x, x2: x, y1: 0, y2: h, class: "grat" }), sv("text", { x: x + 3, y: h - 4 }, fmtLon(lon))); }
  // cells, one path per state so drawing stays cheap
  for (const sid of ["unassessed", "clear", "degraded"]) {
    const cells = m.cells.filter((c) => stateOf(c.status) === sid);
    if (!cells.length) continue;
    const d = cells.map((c) => pathOf(c.geometry, view.project)).join("");
    svg.append(sv("path", { d, class: `cell s-${sid}`, fill: sid === "unassessed" ? `url(#h-none-${m.uid})` : null, opacity: st.hidden.has(sid) ? 0.1 : 1 }));
  }
  // scale bar: 100 km at the map's mid latitude, or the nearest nice length
  const pxPerKm = view.k / 111.32; // equal scale on both axes: view.k is pixels per degree of latitude
  const km = [10, 20, 50, 100, 200, 500, 1000].filter((k) => k * pxPerKm < w * 0.35).pop() || 10;
  const px = km * pxPerKm;
  svg.append(sv("path", { d: `M16 ${h - 22} h${px.toFixed(1)} m0 -4 v8 m0 -4 M16 ${h - 26} v8`, class: "bar" }), sv("text", { x: 16, y: h - 30, class: "barlbl" }, `${km} km`),
    sv("path", { d: `M${w - 22} 56 v-30 m-5 9 l5 -9 l5 9`, class: "bar" }), sv("text", { x: w - 28, y: 70, class: "barlbl" }, t("js-interf-north-abbr", "N")));
  svg.append(sv("rect", { x: 0, y: h, width: w, height: footH, class: "footbg" }), ...foot.map((line, i) => sv("text", { x: 12, y: h + 16 + i * 13, class: "foot" }, line)));
  st.selG = sv("g"); svg.append(st.selG);
  st.mapH = h;
  if (st.sel >= 0) markSel(st);
}

function lonLat(st, ev) {
  const r = st.svg.getBoundingClientRect();
  return st.view.invert([((ev.clientX - r.left) / r.width) * st.w, ((ev.clientY - r.top) / r.height) * st.svg.viewBox.baseVal.height]);
}
function pick(st, ev) {
  if (!st.view) return;
  const [lon, lat] = lonLat(st, ev);
  const i = cellAt(st.m, lon, lat);
  if (i >= 0) select(st, i);
  else { st.sel = -1; markSel(st); st.selBox.replaceChildren(el("p", { class: "im-none" }, t("js-interf-no-cell-at", "No cell at { $lat }, { $lon }: not observed. That is not evidence that the area was clear.", { lat: fmtLat(lat), lon: fmtLon(lon) }))); }
}
function hover(st, ev) {
  if (!st.view) return;
  const [lon, lat] = lonLat(st, ev);
  const i = cellAt(st.m, lon, lat);
  st.svg.style.cursor = i >= 0 ? "pointer" : "crosshair";
}
function select(st, i) {
  st.sel = i;
  markSel(st);
  const c = st.m.cells[i], info = stateInfo(st.m.kind, stateOf(c.status)), exact = statusInfo(st.m.kind, c.status);
  st.selBox.replaceChildren(el("h4", {}, info.label, exact.label !== info.label ? ` · ${exact.label}` : ""), el("p", { class: "im-stext" }, exact.text || info.text),
    el("dl", { class: "im-kv" }, cellRows(st.m, c).flatMap(([k, v]) => [el("dt", {}, k), el("dd", {}, v == null ? "" : String(v))])));
}
function markSel(st) {
  if (!st.selG) return;
  st.selG.replaceChildren();
  if (st.sel < 0) return;
  st.selG.append(sv("path", { d: pathOf(st.m.cells[st.sel].geometry, st.view.project), class: "selcell" }));
}
// Arrow keys: the nearest drawn cell in that direction.
function key(st, ev) {
  const dirs = { ArrowLeft: [-1, 0], ArrowRight: [1, 0], ArrowUp: [0, 1], ArrowDown: [0, -1] };
  const d = dirs[ev.key];
  if (!d) return;
  ev.preventDefault();
  const cells = st.m.cells;
  if (st.sel < 0) { select(st, cellsForTable(st.m)[0].idx); return; }
  const ctr = (c) => { const b = cellBounds(c); return [(b.west + b.east) / 2, (b.south + b.north) / 2]; };
  const [x0, y0] = ctr(cells[st.sel]);
  let best = -1, bs = Infinity;
  cells.forEach((c, i) => {
    if (i === st.sel) return;
    const [x, y] = ctr(c), dx = x - x0, dy = y - y0, along = dx * d[0] + dy * d[1], across = Math.abs(dx * d[1] + dy * d[0]);
    if (along <= 1e-9 || across > along * 1.0 + 1e-9) return;
    const score = along + across * 2;
    if (score < bs) { bs = score; best = i; }
  });
  if (best >= 0) select(st, best);
}

function routeCard(r) {
  const art = el("article", { class: "card im-card im-route", "aria-label": t("js-interf-route-aria", "Route exposure { $name }", { name: r.name }) });
  art.append(el("div", { class: "im-head" }, el("span", { class: "im-chip" }, t("js-interf-route-chip", "Route")), el("h3", {}, t("js-interf-route-exposure", "Route exposure"), el("small", {}, r.from || r.to ? [" · ", t("js-interf-route-range", "{ $from } to { $to }", { from: r.from || "…", to: r.to || "…" })] : "")), el("span", { class: "im-file-name" }, r.name)));
  art.append(el("p", { class: "im-none" }, t("js-interf-route-explain", "Share of the route's length in each state, per day and source. The four shares sum to 1 and are read together: a low degraded share with a high not-observed share has not been shown to be clear. ADS-B and AIS rows are never combined.")));
  const tbl = el("table", { class: "tbl im-rt" }, el("thead", {}, el("tr", {}, [t("js-interf-rt-day", "Day"), t("js-interf-rt-source", "Source"), t("js-interf-rt-km", "Route km"), t("js-interf-rt-shares", "Shares of the route"), t("js-interf-rt-licence", "Licence and attribution of the map")].map((h) => el("th", { scope: "col" }, h)))));
  const tb = el("tbody", {});
  for (const x of r.rows) {
    const bar = el("div", { class: "im-bar", role: "img", "aria-label": STATES.map((s0) => `${stateInfo(x.kind, s0.id).label} ${pct(x.shares[s0.id])}`).join(", ") }, STATES.map((s0) => el("i", { class: `s-${s0.id}`, style: `flex:${Math.max(0, x.shares[s0.id])}` })));
    const nums = el("ul", { class: "im-shares" }, STATES.map((s0) => el("li", {}, swatch(s0.id), `${stateInfo(x.kind, s0.id).label} ${pct(x.shares[s0.id])}`)));
    tb.append(el("tr", {}, el("td", {}, x.date), el("td", {}, KIND_LABEL[x.kind]), el("td", {}, String(x.km)), el("td", {}, bar, nums), el("td", {}, el("b", {}, x.licence || t("js-interf-none-stated", "(none stated)")), el("br", {}), x.attribution || t("js-interf-none-stated", "(none stated)"))));
  }
  tbl.append(tb);
  art.append(el("div", { class: "table-scroll" }, tbl));
  if (r.skipped) art.append(el("p", { class: "im-none" }, t("js-interf-rows-skipped", "{ $count } row(s) were not valid and were skipped.", { count: r.skipped })));
  if (r.caveats.length) art.append(el("h4", {}, t("js-interf-caveats", "Caveats")), el("ul", { class: "im-cav" }, r.caveats.map((c) => el("li", {}, c))));
  return art;
}

// ---------- build maps and route exposure with the engine (in this browser) ----------
const MAX_CSV = 24 * 1024 * 1024;
function say(id, msg, err) { const s = $(id); s.textContent = msg; s.classList.toggle("err", !!err); }
function saveText(name, text) {
  const a = el("a", { href: URL.createObjectURL(new Blob([text], { type: "application/json" })), download: name });
  document.body.append(a); a.click(); a.remove(); setTimeout(() => URL.revokeObjectURL(a.href), 4000);
}
async function engineFor(statusId, fn) {
  const eng = await getEngine();
  if (!eng.available) { say(statusId, t("js-interf-engine-start-failed", "The engine could not start here ({ $reason }). Opening map files above still works.", { reason: eng.error }), true); return null; }
  if (!eng.has(fn)) { say(statusId, t("js-interf-engine-no-fn", "This engine build (version { $version }) has no { $fn }; it predates this page. The command-line equivalent is in the Tools page.", { version: eng.version, fn }), true); return null; }
  return eng;
}
function syncDataset() {
  const src = $("im-b-src").value, ds = $("im-b-ds");
  for (const o of ds.options) { if (o.value === "custom") continue; o.hidden = o.disabled = !((src === "adsb" && o.value === "adsb-lol") || (src === "ais" && o.value !== "adsb-lol")); }
  if (ds.selectedOptions[0].disabled) ds.value = "custom";
  $("im-b-lic").hidden = ds.value !== "custom";
}
async function buildMaps(csv, csvName, land, label) {
  const st = "im-b-status";
  try {
    if (csv.length > MAX_CSV) { say(st, t("js-interf-csv-too-big", "{ $name }: larger than 24 MiB; build from an excerpt (the command-line tool takes a whole file).", { name: csvName }), true); return; }
    const src = $("im-b-src").value, ds = $("im-b-ds").value, cellText = $("im-b-cell").value.trim();
    const cell = cellText === "" ? NaN : Number(cellText);
    if (cellText !== "" && !(cell > 0 && cell <= 10)) { say(st, t("js-interf-cell-size-rule", "The cell size must be a number of degrees above 0 and at most 10, or empty for 0.5."), true); return; }
    const custom = ds === "custom";
    const lic = custom ? [$("im-b-licence").value.trim(), $("im-b-url").value.trim(), $("im-b-attr").value.trim()] : ["", "", ""];
    if (custom && lic.some((x) => !x)) { say(st, t("js-interf-custom-needs-licence", "A custom dataset needs the licence, its URL and the attribution text: they are written into the map file."), true); return; }
    say(st, t("js-interf-starting-build", "Starting the engine and building…"));
    const eng = await engineFor(st, "interference_map"); if (!eng) return;
    const res = JSON.parse(await eng.call("interference_map", src, csv, ds, cell, lic[0], lic[1], lic[2], src === "ais" ? land || "" : ""));
    if (!Array.isArray(res) || !res.length) { say(st, t("js-interf-built-none", "{ $name }: the engine built no map.", { name: csvName }), true); return; }
    const items = res.map((d) => ({ name: d.file_name, text: typeof d.geojson === "string" ? d.geojson : JSON.stringify(d.geojson) }));
    await openTexts(items, label || t("js-interf-built-day-maps", { one: "Built { $n } day map from { $name } with engine { $version }, in this browser.", other: "Built { $n } day maps from { $name } with engine { $version }, in this browser." }, { n: res.length, name: csvName, version: eng.version }));
    const out = el("span", {}, " ", t("js-interf-save", "Save:"), " ", ...items.map((it) => { const b = el("button", { type: "button", class: "im-demo" }, it.name); b.onclick = () => saveText(it.name, it.text); return b; }));
    say(st, t("js-interf-built-maps", { one: "Built { $n } map ({ $detail }). Aggregate only: a flagged cell does not name interference as the cause.", other: "Built { $n } maps ({ $detail }). Aggregate only: a flagged cell does not name interference as the cause." }, { n: res.length, detail: res.map((d) => t("js-interf-built-detail", "{ $date }: { $published } cells published, { $flagged } flagged", { date: d.date, published: d.cells_published, flagged: d.cells_flagged })).join("; ") }));
    $(st).append(out);
  } catch (e) { say(st, t("js-interf-build-failed", "{ $name }: could not be built ({ $reason }).", { name: csvName, reason: e && e.message ? e.message : e }), true); }
}
async function routeHere(route, name) {
  const st = "im-r-status";
  try {
    if (!maps.length) { say(st, t("js-interf-route-needs-map", "Open or build at least one map first: the route is checked against the maps on this page."), true); return; }
    if (route.length > MAX_CSV) { say(st, t("js-interf-route-too-big", "{ $name }: larger than 24 MiB.", { name }), true); return; }
    const from = $("im-r-from").value.trim(), to = $("im-r-to").value.trim();
    for (const d of [from, to]) if (d && !/^\d{4}-\d{2}-\d{2}$/.test(d)) { say(st, t("js-interf-dates-rule", "Dates are YYYY-MM-DD, or empty for no limit."), true); return; }
    const texts = maps.map((m) => m.text).filter((x) => typeof x === "string");
    if (!texts.length) { say(st, t("js-interf-no-file-text", "The open maps carry no file text to check (they were not opened as files)."), true); return; }
    say(st, t("js-interf-starting-route", "Starting the engine and checking the route…"));
    const eng = await engineFor(st, "route_exposure"); if (!eng) return;
    const report = await eng.call("route_exposure", route, JSON.stringify(texts), from, to);
    await openTexts([{ name: "route-exposure.json", text: report }], null);
    say(st, t("js-interf-route-done", { one: "Route exposure computed from { $n } map with engine { $version }; the report is shown below.", other: "Route exposure computed from { $n } maps with engine { $version }; the report is shown below." }, { n: texts.length, version: eng.version }));
    const b = el("button", { type: "button", class: "im-demo" }, t("js-interf-save-report", "Save the report (JSON)")); b.onclick = () => saveText("route-exposure.json", report);
    $(st).append(" ", b);
  } catch (e) { say(st, t("js-interf-check-failed", "{ $name }: could not be checked ({ $reason }).", { name, reason: e && e.message ? e.message : e }), true); }
}
async function fetchText(url) { const r = await fetch(url); if (!r.ok) throw new Error(t("js-interf-did-not-load", "{ $url } did not load", { url })); return r.text(); }
function wireBuild() {
  $("im-b-src").addEventListener("change", syncDataset); $("im-b-ds").addEventListener("change", syncDataset); syncDataset();
  let land = "";
  $("im-b-land").addEventListener("change", async (e) => { const f = e.target.files[0]; if (!f) return; if (f.size > MAX_CSV) { say("im-b-status", t("js-interf-land-too-big", "That land file is larger than 24 MiB."), true); return; } land = await f.text(); say("im-b-status", t("js-interf-land-set", "Land polygons: { $name }.", { name: f.name })); });
  $("im-b-csv").addEventListener("change", async (e) => { const f = e.target.files[0]; e.target.value = ""; if (f) { if (f.size > MAX_CSV) { say("im-b-status", t("js-interf-csv-too-big-short", "{ $name }: larger than 24 MiB; build from an excerpt.", { name: f.name }), true); return; } buildMaps(await f.text(), f.name, land); } });
  $("im-b-demo").addEventListener("click", async () => {
    try {
      const src = $("im-b-src").value;
      $("im-b-ds").value = "custom"; syncDataset();
      $("im-b-licence").value = "CC0-1.0"; $("im-b-url").value = "https://creativecommons.org/publicdomain/zero/1.0/"; $("im-b-attr").value = "Synthetic data generated for Kshana documentation. Not real observations.";
      const csv = await fetchText(`interference/demo/input/${src}.csv`);
      const l = src === "ais" ? await fetchText("interference/demo/input/land.geojson") : "";
      await buildMaps(csv, t("js-interf-demo-csv-name", "{ $file } (synthetic sample)", { file: `${src}.csv` }), l, t("js-interf-built-from-sample", "Built from the synthetic { $kind } sample with the engine, in this browser. Made-up reports; no real aircraft, vessel or day.", { kind: src === "ais" ? "AIS" : "ADS-B" }));
    } catch (x) { say("im-b-status", t("js-interf-sample-failed", "The sample could not be opened: { $reason }.", { reason: x.message }), true); }
  });
  $("im-r-file").addEventListener("change", async (e) => { const f = e.target.files[0]; e.target.value = ""; if (f) routeHere(await f.text(), f.name); });
  $("im-r-demo").addEventListener("click", async () => { try { await routeHere(await fetchText("interference/demo/input/route.csv"), t("js-interf-demo-route-name", "route.csv (synthetic)")); } catch (x) { say("im-r-status", t("js-interf-route-open-failed", "The route could not be opened: { $reason }.", { reason: x.message }), true); } });
}

function wire() {
  wireBuild();
  $("im-files").addEventListener("change", (e) => { openFiles([...e.target.files]); e.target.value = ""; });
  $("im-demo").addEventListener("click", openDemo);
  $("im-clear").addEventListener("click", () => { maps = []; routes = []; render(); $("im-clear").hidden = true; setStatus(t("js-interf-nothing-open", "Nothing open yet.")); setNotes([]); });
  const drop = $("im-drop");
  for (const ev of ["dragenter", "dragover"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.add("over"); });
  for (const ev of ["dragleave", "drop"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.remove("over"); });
  drop.addEventListener("drop", (e) => openFiles([...(e.dataTransfer?.files || [])]));
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
  let rt = 0;
  addEventListener("resize", () => { clearTimeout(rt); rt = setTimeout(() => { for (const st of views.values()) { const w = Math.round(st.svg.parentElement.clientWidth); if (w !== st.w) draw(st); } }, 120); });
  if (new URLSearchParams(location.search).get("demo") === "1") openDemo();
}
wire();
