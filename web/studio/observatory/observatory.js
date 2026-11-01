// SPDX-License-Identifier: AGPL-3.0-only
// Interference observatory page: the DOM layer. What is read, checked and drawn is in lib/observatory.mjs. The page makes no request:
// it reads files the person opens, in this browser, and shows what they say.
import { readDay, readIncidents, readManifest, verifyFiles, dayAlt, dayNotes, cellRows, mapSvg, classifyName, safeHttps, cellKey, STATES, STATE_TEXT, STATE_MEANS, notClear, causeText, MAX_BYTES } from "../lib/observatory.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const el = (tag, attrs, ...kids) => { const n = document.createElement(tag); for (const [k, v] of Object.entries(attrs || {})) n.setAttribute(k, v); n.append(...kids.flat().filter((x) => x != null)); return n; };
const days = new Map(); // date -> { day, incidents, manifest, png: {name, url}, files: Map(name -> Uint8Array) }
let cur = null, selected = new Set(), flt = "all", showAll = false;
const ROWS = 40;

const setStatus = (m, err) => { const s = $("ko-status"); s.textContent = m; s.classList.toggle("err", !!err); };
const hex = (buf) => [...new Uint8Array(buf)].map((b) => b.toString(16).padStart(2, "0")).join("");
const digest = async (bytes) => hex(await crypto.subtle.digest("SHA-256", bytes));

// Two counts in one sentence, so each combination of singular and plural is its own message.
function openedSummary(dayCount, fileCount) {
  const d = dayCount > 1, f = fileCount > 1, v = { days: dayCount, files: fileCount };
  if (d && f) return t("js-obs-opened-days-files", "Opened { $days } days from { $files } files. Read here; nothing was uploaded.", v);
  if (d) return t("js-obs-opened-days-file", "Opened { $days } days from { $files } file. Read here; nothing was uploaded.", v);
  if (f) return t("js-obs-opened-day-files", "Opened { $days } day from { $files } files. Read here; nothing was uploaded.", v);
  return t("js-obs-opened-day-file", "Opened { $days } day from { $files } file. Read here; nothing was uploaded.", v);
}

async function openFiles(list) {
  if (!list || !list.length) return;
  const notes = [], got = [];
  for (const f of list) {
    try {
      if (f.size > MAX_BYTES) { notes.push(t("js-obs-too-large", "{ $name }: larger than { $mib } MiB; open a smaller file.", { name: f.name, mib: MAX_BYTES / 1048576 })); continue; }
      const c = classifyName(f.name);
      const bytes = new Uint8Array(await f.arrayBuffer());
      if (c.kind === "png") { const d = slot(c.date || "unknown"); if (d.png) URL.revokeObjectURL(d.png.url); d.png = { name: f.name, url: URL.createObjectURL(new Blob([bytes], { type: "image/png" })) }; d.files.set(f.name, bytes); got.push(f.name); continue; }
      const text = new TextDecoder().decode(bytes);
      let r;
      if (c.kind === "day") { r = readDay(text, f.name); if (r.error) { notes.push(r.error); continue; } const d = slot(r.day.date); d.day = r.day; d.files.set(f.name, bytes); }
      else if (c.kind === "incidents") { r = readIncidents(text, f.name); if (r.error) { notes.push(r.error); continue; } const d = slot(r.incidents.date || c.date || "unknown"); d.incidents = r.incidents; d.files.set(f.name, bytes); }
      else if (c.kind === "manifest") { r = readManifest(text, f.name); if (r.error) { notes.push(r.error); continue; } const d = slot(r.manifest.date || c.date || "unknown"); d.manifest = r.manifest; d.files.set(f.name, bytes); }
      else { notes.push(t("js-obs-not-readable", "{ $name }: not a file this page reads (.geojson, .incidents.json, .manifest.json or .png).", { name: f.name })); continue; }
      got.push(f.name);
    } catch (e) { notes.push(t("js-obs-read-failed", "{ $name }: could not be read ({ $reason }).", { name: f.name, reason: e && e.message ? e.message : e })); }
  }
  for (const [k, d] of days) if (!d.day) { if (d.png) URL.revokeObjectURL(d.png.url); days.delete(k); notes.push(t("js-obs-no-day-file", "The files for { $date } have no day file (.geojson), so there is nothing to show for it.", { date: k })); }
  $("ko-notes").replaceChildren(...notes.map((note) => el("li", {}, note)));
  if (!days.size) { setStatus(got.length ? t("js-obs-nothing-yet", "Nothing to show yet: open the day's .geojson file too.") : t("js-obs-no-file-read", "No file could be read."), true); $("ko-body").hidden = true; return; }
  setStatus(openedSummary(days.size, got.length));
  const keys = [...days.keys()].sort();
  $("ko-pick").replaceChildren(...keys.map((k) => el("option", { value: k }, k)));
  show(cur && days.has(cur) ? cur : keys[keys.length - 1]);
}
const slot = (date) => { if (!days.has(date)) days.set(date, { day: null, incidents: null, manifest: null, png: null, files: new Map() }); return days.get(date); };

function kv(rows) { return rows.map(([k, v]) => el("div", {}, el("dt", {}, k), el("dd", {}, v))); }

function show(date) {
  cur = date; selected = new Set(); showAll = false;
  const d = days.get(date), day = d.day;
  $("ko-body").hidden = false; $("ko-pick").value = date;
  const keys = [...days.keys()].sort(), i = keys.indexOf(date);
  $("ko-prev").disabled = i <= 0; $("ko-next").disabled = i >= keys.length - 1;
  $("ko-day-h").textContent = t("js-obs-day-heading", "Day { $date } (UTC)", { date });
  $("ko-sum").textContent = dayAlt(day);
  const rel = day.release;
  $("ko-release").textContent = t("js-obs-release", "Released no earlier than { $when }: products are published at least { $hours } hours after the day ends, on { $deg }-degree cells. This is not a live view.", { when: rel.notBeforeUtc || t("js-obs-release-default", "the end of the day plus the delay"), hours: rel.minDelayHours ?? 24, deg: day.cellDeg ?? 0.5 });
  $("ko-daynotes").replaceChildren(...dayNotes(day, d.incidents).map((note) => el("li", {}, note)));
  const s = day.summary, w = (x) => (x == null ? t("js-obs-not-stated", "not stated") : String(x));
  $("ko-kv").replaceChildren(...kv([[t("js-obs-kv-cells", "Cells published"), w(s.cells)], [t("js-obs-kv-degraded", "Degraded"), w(s.degraded)], [t("js-obs-kv-not-degraded", "Not degraded"), w(s.notDegraded)], [t("js-obs-kv-not-observed", "Not observed (published)"), w(s.notObserved)], [t("js-obs-kv-day-wide", "Day-wide effect"), s.dayWide ? t("js-obs-yes-no-call", "yes: no cell could be called") : t("js-obs-no", "no")], [t("js-obs-kv-scope", "Scope"), day.methodScope || t("js-obs-not-stated", "not stated")]]));
  $("ko-leg").replaceChildren(...STATES.map((k) => el("li", {}, swatch(k), el("span", {}, el("b", {}, STATE_TEXT[k]), " ", STATE_MEANS[k]))));
  $("ko-clear").textContent = t("js-obs-clear-note", "{ $notClear } A cell with no entry was seen by fewer than 5 distinct aircraft and is withheld; it is not drawn. Colour is never the only cue: not observed is hatched, and the table spells every state out.", { notClear: notClear() });
  const png = $("ko-pic"); if (d.png) { $("ko-img").src = d.png.url; $("ko-img").alt = dayAlt(day); png.hidden = false; } else { png.hidden = true; $("ko-img").removeAttribute("src"); }
  drawMap(); drawIncidents(d); drawCells(); drawFiles(d); drawData(day);
  try { const q = new URLSearchParams(location.search); q.set("day", date); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
}
function swatch(k) {
  const NS = "http://www.w3.org/2000/svg", mk = (tag, a) => { const n = document.createElementNS(NS, tag); for (const [x, v] of Object.entries(a)) n.setAttribute(x, v); return n; };
  const svg = mk("svg", { class: "ko-sw", viewBox: "0 0 22 22", "aria-hidden": "true" });
  svg.append(mk("rect", { width: "22", height: "22", rx: "3", class: `ko-sw-${k}` }));
  if (k === "not_observed") for (const x of [-6, 0, 6, 12, 18]) svg.append(mk("line", { x1: x, y1: "22", x2: x + 22, y2: "0", class: "ko-hln" }));
  return svg;
}

function drawMap(focus) {
  const day = days.get(cur).day, box = $("ko-map");
  box.innerHTML = mapSvg(day, { selected, focus });
  const read = $("ko-read"), byKey = new Map(day.cells.map((c) => [cellKey(c), c]));
  for (const r of box.querySelectorAll(".ko-c")) {
    const say = () => { const c = byKey.get(r.dataset.k); if (c) { const row = cellRows({ cells: [c] })[0]; read.textContent = t("js-obs-cell-read", "{ $state }: { $cell }. Sampled { $sampled }, affected { $affected }.", { state: STATE_TEXT[c.state], cell: row.cell, sampled: row.sampled, affected: row.affected }); } };
    r.addEventListener("mouseenter", say); r.addEventListener("click", say);
  }
}

function drawIncidents(d) {
  const tbl = $("ko-inc"), inc = d.incidents;
  if (!inc) { $("ko-inc-note").textContent = t("js-obs-no-incident-file", "No incident file was opened for this day."); tbl.replaceChildren(); return; }
  $("ko-inc-note").textContent = inc.list.length ? t("js-obs-incident-note", "Touching degraded cells (diagonals included) form one incident. The cause of every incident is: not attributed. This is not a confirmation and not a NOTAM.") : t("js-obs-no-degraded", "No degraded cells this day.");
  if (!inc.list.length) { tbl.replaceChildren(); return; }
  const head = el("thead", {}, el("tr", {}, [t("js-obs-col-incident", "Incident"), t("js-obs-col-bbox", "Bounding box (S, W, N, E)"), t("js-obs-col-cells", "Cells"), t("js-obs-col-cause", "Cause")].map((h) => el("th", { scope: "col" }, h))));
  const body = el("tbody", {}, ...inc.list.map((x) => {
    const b = x.bbox ? `${x.bbox.south}, ${x.bbox.west}, ${x.bbox.north}, ${x.bbox.east}` : t("js-obs-not-stated", "not stated");
    const btn = el("button", { type: "button", class: "ko-btn ko-rowbtn", "aria-pressed": "false" }, x.id || t("js-obs-incident", "incident"));
    btn.addEventListener("click", () => { const keys = x.cells.map((c) => `${c.i}:${c.j}`), on = keys.every((k) => selected.has(k)); selected = new Set(on ? [] : keys); for (const o of body.querySelectorAll(".ko-rowbtn")) o.setAttribute("aria-pressed", "false"); if (!on) btn.setAttribute("aria-pressed", "true"); drawMap(); });
    return el("tr", {}, el("th", { scope: "row" }, btn), el("td", {}, b), el("td", {}, String(x.cellCount ?? x.cells.length)), el("td", {}, causeText(inc.cause)));
  }));
  tbl.replaceChildren(head, body);
}

function drawCells() {
  const day = days.get(cur).day, rows = cellRows(day, flt), shown = showAll ? rows : rows.slice(0, ROWS);
  const head = el("thead", {}, el("tr", {}, [t("js-obs-col-cell", "Cell (latitude, longitude)"), t("js-obs-col-state", "State"), t("js-obs-col-why", "Why not observed"), t("js-obs-col-sampled", "Aircraft sampled"), t("js-obs-col-affected", "Aircraft affected"), t("js-obs-col-share", "Affected share")].map((h) => el("th", { scope: "col" }, h))));
  $("ko-cells").replaceChildren(head, el("tbody", {}, ...shown.map((r) => el("tr", {}, el("th", { scope: "row" }, r.cell), el("td", {}, r.state), el("td", {}, r.why), el("td", {}, r.sampled), el("td", {}, r.affected), el("td", {}, r.share)))));
  const more = $("ko-more"); more.hidden = rows.length <= ROWS || showAll; more.textContent = t("js-obs-show-all", "Show all { $n } cells", { n: rows.length });
}

async function drawFiles(d) {
  const tbl = $("ko-files-t"), m = d.manifest;
  if (!m) { $("ko-files-note").textContent = t("js-obs-no-manifest", "No manifest was opened for this day, so the files cannot be checked against their hashes."); tbl.replaceChildren(); $("ko-stats").replaceChildren(); return; }
  $("ko-files-note").textContent = t("js-obs-files-note", "Method { $method }. Each file's SHA-256 is computed here from the file you opened and compared with the manifest; a file you did not open is not checked.", { method: m.methodId || t("js-obs-not-stated", "not stated") });
  const res = await verifyFiles(m, d.files, digest);
  if (days.get(cur) !== d) return;
  tbl.replaceChildren(el("thead", {}, el("tr", {}, [t("js-obs-col-file", "File"), t("js-obs-col-bytes", "Bytes"), t("js-obs-col-sha", "SHA-256 (manifest)"), t("js-obs-col-check", "Check")].map((h) => el("th", { scope: "col" }, h)))), el("tbody", {}, ...res.map((f) => el("tr", {}, el("th", { scope: "row" }, f.name), el("td", {}, f.bytes == null ? t("js-obs-na", "n/a") : String(f.bytes)), el("td", { class: "ko-hash" }, f.sha256 || t("js-obs-not-stated", "not stated")), el("td", {}, f.status)))));
  $("ko-stats").replaceChildren(...kv(m.stats.map(([k, v]) => [k, v.toLocaleString("en")])));
}

function drawData(day) {
  const ds = day.dataset, link = safeHttps(ds.licenceUrl), NS = t("js-obs-not-stated", "not stated");
  $("ko-data").replaceChildren(...kv([[t("js-obs-ds-dataset", "Dataset"), ds.name || NS], [t("js-obs-ds-licence", "Licence"), ds.licence || NS]]), el("div", {}, el("dt", {}, t("js-obs-ds-licence-address", "Licence address")), el("dd", {}, link ? el("a", { href: link, rel: "noopener" }, link) : (ds.licenceUrl || NS))), ...kv([[t("js-obs-ds-attribution", "Attribution"), ds.attribution || NS], [t("js-obs-ds-coverage", "Coverage"), ds.coverage || NS], [t("js-obs-ds-product", "Product"), day.product || NS], [t("js-obs-ds-written-by", "Written by Kshana"), day.kshanaVersion || NS]]));
  $("ko-notice").textContent = day.notice ? t("js-obs-notice", "Notice carried by the file: { $notice }", { notice: day.notice }) : t("js-obs-no-notice", "This file carries no notice. The advisory statement at the top of this page applies all the same.");
}

function wire() {
  $("ko-files").addEventListener("change", (e) => { openFiles([...e.target.files]); e.target.value = ""; });
  const drop = $("ko-drop");
  for (const ev of ["dragenter", "dragover"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.add("over"); });
  for (const ev of ["dragleave", "drop"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.remove("over"); });
  drop.addEventListener("drop", (e) => openFiles([...(e.dataTransfer?.files || [])]));
  $("ko-pick").addEventListener("change", (e) => show(e.target.value));
  const step = (d) => { const k = [...days.keys()].sort(), i = k.indexOf(cur) + d; if (k[i]) show(k[i]); };
  $("ko-prev").addEventListener("click", () => step(-1)); $("ko-next").addEventListener("click", () => step(1));
  $("ko-flt").addEventListener("change", (e) => { flt = e.target.value; showAll = false; drawCells(); });
  $("ko-more").addEventListener("click", () => { showAll = true; drawCells(); });
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
}
wire();
