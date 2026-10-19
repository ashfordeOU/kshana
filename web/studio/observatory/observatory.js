// SPDX-License-Identifier: AGPL-3.0-only
// Interference observatory page: the DOM layer. What is read, checked and drawn is in lib/observatory.mjs. The page makes no request:
// it reads files the person opens, in this browser, and shows what they say.
import { readDay, readIncidents, readManifest, verifyFiles, dayAlt, dayNotes, cellRows, mapSvg, classifyName, safeHttps, cellKey, STATES, STATE_TEXT, STATE_MEANS, NOT_CLEAR, MAX_BYTES } from "../lib/observatory.mjs";

const $ = (id) => document.getElementById(id);
const el = (tag, attrs, ...kids) => { const n = document.createElement(tag); for (const [k, v] of Object.entries(attrs || {})) n.setAttribute(k, v); n.append(...kids.flat().filter((x) => x != null)); return n; };
const days = new Map(); // date -> { day, incidents, manifest, png: {name, url}, files: Map(name -> Uint8Array) }
let cur = null, selected = new Set(), flt = "all", showAll = false;
const ROWS = 40;

const setStatus = (m, err) => { const s = $("ko-status"); s.textContent = m; s.classList.toggle("err", !!err); };
const hex = (buf) => [...new Uint8Array(buf)].map((b) => b.toString(16).padStart(2, "0")).join("");
const digest = async (bytes) => hex(await crypto.subtle.digest("SHA-256", bytes));

async function openFiles(list) {
  if (!list || !list.length) return;
  const notes = [], got = [];
  for (const f of list) {
    try {
      if (f.size > MAX_BYTES) { notes.push(`${f.name}: larger than ${MAX_BYTES / 1048576} MiB; open a smaller file.`); continue; }
      const c = classifyName(f.name);
      const bytes = new Uint8Array(await f.arrayBuffer());
      if (c.kind === "png") { const d = slot(c.date || "unknown"); if (d.png) URL.revokeObjectURL(d.png.url); d.png = { name: f.name, url: URL.createObjectURL(new Blob([bytes], { type: "image/png" })) }; d.files.set(f.name, bytes); got.push(f.name); continue; }
      const text = new TextDecoder().decode(bytes);
      let r;
      if (c.kind === "day") { r = readDay(text, f.name); if (r.error) { notes.push(r.error); continue; } const d = slot(r.day.date); d.day = r.day; d.files.set(f.name, bytes); }
      else if (c.kind === "incidents") { r = readIncidents(text, f.name); if (r.error) { notes.push(r.error); continue; } const d = slot(r.incidents.date || c.date || "unknown"); d.incidents = r.incidents; d.files.set(f.name, bytes); }
      else if (c.kind === "manifest") { r = readManifest(text, f.name); if (r.error) { notes.push(r.error); continue; } const d = slot(r.manifest.date || c.date || "unknown"); d.manifest = r.manifest; d.files.set(f.name, bytes); }
      else { notes.push(`${f.name}: not a file this page reads (.geojson, .incidents.json, .manifest.json or .png).`); continue; }
      got.push(f.name);
    } catch (e) { notes.push(`${f.name}: could not be read (${e && e.message ? e.message : e}).`); }
  }
  for (const [k, d] of days) if (!d.day) { if (d.png) URL.revokeObjectURL(d.png.url); days.delete(k); notes.push(`The files for ${k} have no day file (.geojson), so there is nothing to show for it.`); }
  $("ko-notes").replaceChildren(...notes.map((t) => el("li", {}, t)));
  if (!days.size) { setStatus(got.length ? "Nothing to show yet: open the day's .geojson file too." : "No file could be read.", true); $("ko-body").hidden = true; return; }
  setStatus(`Opened ${days.size} day${days.size > 1 ? "s" : ""} from ${got.length} file${got.length > 1 ? "s" : ""}. Read here; nothing was uploaded.`);
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
  $("ko-day-h").textContent = `Day ${date} (UTC)`;
  $("ko-sum").textContent = dayAlt(day);
  const rel = day.release;
  $("ko-release").textContent = `Released no earlier than ${rel.notBeforeUtc || "the end of the day plus the delay"}: products are published at least ${rel.minDelayHours ?? 24} hours after the day ends, on ${day.cellDeg ?? 0.5}-degree cells. This is not a live view.`;
  $("ko-daynotes").replaceChildren(...dayNotes(day, d.incidents).map((t) => el("li", {}, t)));
  const s = day.summary, w = (x) => (x == null ? "not stated" : String(x));
  $("ko-kv").replaceChildren(...kv([["Cells published", w(s.cells)], ["Degraded", w(s.degraded)], ["Not degraded", w(s.notDegraded)], ["Not observed (published)", w(s.notObserved)], ["Day-wide effect", s.dayWide ? "yes: no cell could be called" : "no"], ["Scope", day.methodScope || "not stated"]]));
  $("ko-leg").replaceChildren(...STATES.map((k) => el("li", {}, swatch(k), el("span", {}, el("b", {}, STATE_TEXT[k]), " ", STATE_MEANS[k]))));
  $("ko-clear").textContent = `${NOT_CLEAR} A cell with no entry was seen by fewer than 5 distinct aircraft and is withheld; it is not drawn. Colour is never the only cue: not observed is hatched, and the table spells every state out.`;
  const png = $("ko-pic"); if (d.png) { $("ko-img").src = d.png.url; $("ko-img").alt = dayAlt(day); png.hidden = false; } else { png.hidden = true; $("ko-img").removeAttribute("src"); }
  drawMap(); drawIncidents(d); drawCells(); drawFiles(d); drawData(day);
  try { const q = new URLSearchParams(location.search); q.set("day", date); history.replaceState(null, "", `${location.pathname}?${q}`); } catch (e) { /* no history API */ }
}
function swatch(k) {
  const NS = "http://www.w3.org/2000/svg", mk = (t, a) => { const n = document.createElementNS(NS, t); for (const [x, v] of Object.entries(a)) n.setAttribute(x, v); return n; };
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
    const say = () => { const c = byKey.get(r.dataset.k); if (c) read.textContent = `${STATE_TEXT[c.state]}: ${cellRows({ cells: [c] })[0].cell}. Sampled ${cellRows({ cells: [c] })[0].sampled}, affected ${cellRows({ cells: [c] })[0].affected}.`; };
    r.addEventListener("mouseenter", say); r.addEventListener("click", say);
  }
}

function drawIncidents(d) {
  const t = $("ko-inc"), inc = d.incidents;
  if (!inc) { $("ko-inc-note").textContent = "No incident file was opened for this day."; t.replaceChildren(); return; }
  $("ko-inc-note").textContent = inc.list.length ? "Touching degraded cells (diagonals included) form one incident. The cause of every incident is: not attributed. This is not a confirmation and not a NOTAM." : "No degraded cells this day.";
  if (!inc.list.length) { t.replaceChildren(); return; }
  const head = el("thead", {}, el("tr", {}, ["Incident", "Bounding box (S, W, N, E)", "Cells", "Cause"].map((h) => el("th", { scope: "col" }, h))));
  const body = el("tbody", {}, ...inc.list.map((x) => {
    const b = x.bbox ? `${x.bbox.south}, ${x.bbox.west}, ${x.bbox.north}, ${x.bbox.east}` : "not stated";
    const btn = el("button", { type: "button", class: "ko-btn ko-rowbtn", "aria-pressed": "false" }, x.id || "incident");
    btn.addEventListener("click", () => { const keys = x.cells.map((c) => `${c.i}:${c.j}`), on = keys.every((k) => selected.has(k)); selected = new Set(on ? [] : keys); for (const o of body.querySelectorAll(".ko-rowbtn")) o.setAttribute("aria-pressed", "false"); if (!on) btn.setAttribute("aria-pressed", "true"); drawMap(); });
    return el("tr", {}, el("th", { scope: "row" }, btn), el("td", {}, b), el("td", {}, String(x.cellCount ?? x.cells.length)), el("td", {}, inc.cause));
  }));
  t.replaceChildren(head, body);
}

function drawCells() {
  const day = days.get(cur).day, rows = cellRows(day, flt), shown = showAll ? rows : rows.slice(0, ROWS);
  const head = el("thead", {}, el("tr", {}, ["Cell (latitude, longitude)", "State", "Why not observed", "Aircraft sampled", "Aircraft affected", "Affected share"].map((h) => el("th", { scope: "col" }, h))));
  $("ko-cells").replaceChildren(head, el("tbody", {}, ...shown.map((r) => el("tr", {}, el("th", { scope: "row" }, r.cell), el("td", {}, r.state), el("td", {}, r.why), el("td", {}, r.sampled), el("td", {}, r.affected), el("td", {}, r.share)))));
  const more = $("ko-more"); more.hidden = rows.length <= ROWS || showAll; more.textContent = `Show all ${rows.length} cells`;
}

async function drawFiles(d) {
  const t = $("ko-files-t"), m = d.manifest;
  if (!m) { $("ko-files-note").textContent = "No manifest was opened for this day, so the files cannot be checked against their hashes."; t.replaceChildren(); $("ko-stats").replaceChildren(); return; }
  $("ko-files-note").textContent = `Method ${m.methodId || "not stated"}. Each file's SHA-256 is computed here from the file you opened and compared with the manifest; a file you did not open is not checked.`;
  const res = await verifyFiles(m, d.files, digest);
  if (days.get(cur) !== d) return;
  t.replaceChildren(el("thead", {}, el("tr", {}, ["File", "Bytes", "SHA-256 (manifest)", "Check"].map((h) => el("th", { scope: "col" }, h)))), el("tbody", {}, ...res.map((f) => el("tr", {}, el("th", { scope: "row" }, f.name), el("td", {}, f.bytes == null ? "n/a" : String(f.bytes)), el("td", { class: "ko-hash" }, f.sha256 || "not stated"), el("td", {}, f.status)))));
  $("ko-stats").replaceChildren(...kv(m.stats.map(([k, v]) => [k, v.toLocaleString("en")])));
}

function drawData(day) {
  const ds = day.dataset, link = safeHttps(ds.licenceUrl);
  $("ko-data").replaceChildren(...kv([["Dataset", ds.name || "not stated"], ["Licence", ds.licence || "not stated"]]), el("div", {}, el("dt", {}, "Licence address"), el("dd", {}, link ? el("a", { href: link, rel: "noopener" }, link) : (ds.licenceUrl || "not stated"))), ...kv([["Attribution", ds.attribution || "not stated"], ["Coverage", ds.coverage || "not stated"], ["Product", day.product || "not stated"], ["Written by Kshana", day.kshanaVersion || "not stated"]]));
  $("ko-notice").textContent = day.notice ? `Notice carried by the file: ${day.notice}` : "This file carries no notice. The advisory statement at the top of this page applies all the same.";
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
