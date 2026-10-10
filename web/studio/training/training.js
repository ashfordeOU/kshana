// SPDX-License-Identifier: AGPL-3.0-only
// Training debrief page: the DOM layer. Everything it knows about the log is in lib/training.mjs.
// The file is read with File.text() in this page; nothing is sent anywhere.
import { parseInstructorLog, errorBand, ERROR_BANDS, kindLabel, whatLabel, MAX_BYTES, MAX_BYTES_TEXT, MAX_MOMENTS_SHOWN, eventShape, nearestRow, stepTimeline, sensorCue, describeRow, paramRows, eventExtraRows, peakFacts } from "../lib/training.mjs";
import { makeProjection, niceLength } from "../lib/trust.mjs";

const $ = (id) => document.getElementById(id);
const NS = "http://www.w3.org/2000/svg";
const DEMOS = [["open-sea-jamming", "Open-sea jamming"], ["coastal-drag-off", "Coastal drag-off"], ["port-approach-time-spoof", "Port-approach time spoof"], ["combined-event", "Combined event"]];
const BAND_VAR = { small: "var(--t-small)", medium: "var(--t-medium)", large: "var(--t-large)" };
const BAND_W = { small: 2.4, medium: 3.2, large: 4 };

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
const fmtT = (t) => (t >= 120 ? `${Math.floor(t / 60)}:${String(Math.round(t % 60)).padStart(2, "0")}` : `${Math.round(t)} s`);
const num = (x, d = 1) => (x == null ? "none" : Number(x).toFixed(d));

let log = null, cur = 0, playing = false, raf = 0, lastTs = 0, frac = 0, showTruth = true;
const dyn = {};
const TL = { L: 118, R: 890, W: 900 };

function setStatus(msg, err) { const s = $("tr-status"); s.textContent = msg; s.classList.toggle("err", !!err); }
function setNotes(list) { $("tr-notes").replaceChildren(...list.map((t) => el("li", {}, t))); }

async function openText(name, text, label) {
  // Nothing in here may leave the page at "Reading…": every failure is said, with the file name.
  try {
    if (text.length > MAX_BYTES) { setStatus(`${name}: larger than ${MAX_BYTES_TEXT}. This page reads logs up to that size.`, true); setNotes([]); return; }
    const r = parseInstructorLog(text, name);
    if (r.error) { setStatus(r.error, true); setNotes([]); return; }
    openLog(r.log);
    setStatus(label || `Opened ${name}: ${log.track.length} log rows over ${Math.round(log.durationS)} s.`);
    setNotes(log.warnings);
  } catch (e) { setStatus(`${name}: could not be read or drawn (${e && e.message ? e.message : e}).`, true); }
}
async function openFile(file) {
  if (!file) return;
  setStatus("Reading…");
  try {
    if (file.size > MAX_BYTES) { setStatus(`${file.name}: larger than ${MAX_BYTES_TEXT}. This page reads logs up to that size.`, true); return; }
    await openText(file.name, await file.text());
  } catch (e) { setStatus(`${file.name}: could not be read (${e && e.message ? e.message : e}).`, true); }
}
async function openDemo(name, title) {
  setStatus(`Opening ${title}…`);
  try {
    const r = await fetch(`training/demo/${name}.instructor.json`);
    if (!r.ok) throw new Error("the file did not load");
    await openText(`${name}.instructor.json`, await r.text(), `Synthetic library scenario "${title}", written by kshana nmea-scenario. Invented positions and dates; no real vessel or recording.`);
  } catch (e) { setStatus(`${title} could not be opened: ${e.message}.`, true); }
}

// ---------- drawing ----------

function layout() {
  const w = Math.round($("tr-time-svg").parentElement.clientWidth) || 900;
  TL.W = Math.max(300, w); TL.L = TL.W < 640 ? 84 : 118; TL.R = TL.W - 10;
}
const xOf = (t) => TL.L + ((t - log.t0) / Math.max(1e-9, log.t1 - log.t0)) * (TL.R - TL.L);

function openLog(l) {
  stop();
  log = l; cur = 0;
  $("tr-run").hidden = false;
  $("tr-warning").textContent = log.warning || "Synthetic training data. For training and testing only: never feed this stream to a vessel's live navigation systems.";
  $("tr-name").textContent = log.scenario || log.name;
  $("tr-desc").textContent = log.description;
  const note = $("tr-note"); note.replaceChildren();
  if (log.trainerNote) note.append(el("h4", {}, "Trainer note"), el("p", {}, log.trainerNote));
  const facts = [["Start (UTC)", log.startUtc], ["Duration", `${Math.round(log.durationS)} s`], ["Seed", log.seed], ["Events injected", String(log.events.length)],
    ["Largest position error", log.stats.maxErrM == null ? "none reported" : `${Math.round(log.stats.maxErrM)} m at T+${Math.round(log.stats.maxErrAtS)} s`],
    ["Largest time offset", Math.abs(log.stats.maxTimeOffS) < 0.05 ? "none" : `${log.stats.maxTimeOffS > 0 ? "+" : ""}${log.stats.maxTimeOffS.toFixed(1)} s`],
    ...peakFacts(log),
    ["Time with no fix", log.stats.spans.length ? log.stats.spans.map((s) => `T+${Math.round(s.from)} to ${Math.round(s.to)} s`).join(", ") : "none"]];
  $("tr-facts").replaceChildren(...facts.map(([k, v]) => el("div", {}, el("dt", {}, k), el("dd", {}, v))));
  $("tr-slider").max = String(log.track.length - 1);
  layout(); drawTrack(); drawTimeline(); drawEvents(); drawTimelineList(); drawLegend();
  setCursor(0);
}

function drawTrack() {
  const svg = $("tr-track-svg");
  svg.replaceChildren();
  svg.setAttribute("viewBox", "0 0 600 600");
  const pts = log.track.flatMap((r) => [r.truth, r.rep]).filter(Boolean);
  const proj = makeProjection(pts);
  const pad = 36, span = Math.max(proj.widthM, proj.heightM, 1), k = (600 - 2 * pad) / span;
  const px = (p) => { const [e, n] = proj.to(p); return [300 + e * k, 300 - n * k]; };
  dyn.px = px;
  const path = (idx, get) => idx.map((i, j) => { const [x, y] = px(get(log.track[i])); return `${j ? "L" : "M"}${f1(x)} ${f1(y)}`; }).join("");
  dyn.truthPath = sv("path", { d: path(log.track.map((_, i) => i), (r) => r.truth), fill: "none", stroke: "var(--ink-3)", "stroke-width": 1.4 });
  svg.append(dyn.truthPath);
  // no-fix spans on the true track
  for (const s of log.stats.spans) {
    const idx = log.track.map((r, i) => (r.t_s >= s.from && r.t_s <= s.to ? i : -1)).filter((i) => i >= 0);
    if (idx.length > 1) svg.append(sv("path", { d: path(idx, (r) => r.truth), fill: "none", stroke: "var(--t-lost)", "stroke-width": 5, "stroke-dasharray": "2 5", "stroke-linecap": "round", opacity: 0.9 }));
  }
  // reported track in runs of one error band, broken where there is no fix
  let run = null;
  const runs = [];
  log.track.forEach((r, i) => {
    if (!r.rep) { run = null; return; }
    const b = errorBand(r.errM) || "small";
    if (run && run.band === b) run.idx.push(i); else { run = { band: b, idx: run ? [run.idx[run.idx.length - 1], i] : [i] }; runs.push(run); }
  });
  for (const r of runs) svg.append(sv("path", { d: path(r.idx, (x) => x.rep), fill: "none", stroke: BAND_VAR[r.band], "stroke-width": BAND_W[r.band], "stroke-linecap": "round", "stroke-linejoin": "round" }));
  const [sx, sy] = px(log.track[0].truth), last = log.track[log.track.length - 1], [ex, ey] = px(last.truth);
  svg.append(sv("circle", { cx: sx, cy: sy, r: 5, fill: "var(--ink)" }), sv("text", { x: sx + 8, y: sy + 4 }, "start"), sv("rect", { x: ex - 4.5, y: ey - 4.5, width: 9, height: 9, fill: "var(--ink)" }), sv("text", { x: ex + 8, y: ey + 4 }, "end"));
  const len = niceLength(span * 0.3), lenPx = len * k;
  svg.append(sv("path", { d: `M${pad} 580 h${f1(lenPx)} m0 -4 v8 m0 -4 M${pad} 576 v8`, class: "ax", style: "stroke:var(--ink)" }), sv("text", { x: pad, y: 570 }, len >= 1000 ? `${len / 1000} km` : `${len} m`),
    sv("path", { d: "M570 44 v-26 m-5 8 l5 -8 l5 8", class: "ax", style: "stroke:var(--ink)" }), sv("text", { x: 563, y: 58 }, "N"));
  dyn.link = sv("line", { stroke: "var(--ink)", "stroke-width": 1.2, "stroke-dasharray": "3 2" });
  dyn.truDot = sv("circle", { r: 5, fill: "var(--bg)", stroke: "var(--ink)", "stroke-width": 1.8 });
  dyn.repDot = sv("circle", { r: 7, fill: "none", stroke: "var(--tim)", "stroke-width": 2.5 });
  svg.append(dyn.link, dyn.truDot, dyn.repDot);
  $("tr-track-desc").textContent = `True track and reported track, north up. Largest position error ${log.stats.maxErrM == null ? "none" : Math.round(log.stats.maxErrM) + " m"}. ${log.stats.spans.length} period(s) with no fix.`;
  svg.onpointerdown = (ev) => { svg.setPointerCapture?.(ev.pointerId); trackPointer(ev); };
  svg.onpointermove = (ev) => { if (ev.buttons) trackPointer(ev); };
}
function trackPointer(ev) {
  const svg = $("tr-track-svg"), r = svg.getBoundingClientRect();
  const x = ((ev.clientX - r.left) / r.width) * 600, y = ((ev.clientY - r.top) / r.height) * 600;
  let best = 0, bd = Infinity;
  log.track.forEach((row, i) => { const [px, py] = dyn.px(row.truth); const d = (px - x) ** 2 + (py - y) ** 2; if (d < bd) { bd = d; best = i; } });
  setCursor(best);
}

function drawLegend() {
  const li = ERROR_BANDS.map((b) => el("li", { style: `--c:${BAND_VAR[b.id]}` }, el("i", {}), `Reported, ${b.label} from true`));
  li.push(el("li", { style: "--c:var(--ink-3)" }, el("i", { class: "thin" }), "True track"), el("li", { style: "--c:var(--t-lost)" }, el("i", { class: "dots" }), "No fix: the receiver reported nothing"));
  $("tr-legend").replaceChildren(...li);
}

// Rows of the strip chart: events, moments, fix, then line charts.
function drawTimeline() {
  const svg = $("tr-time-svg");
  svg.replaceChildren();
  const rows = [];
  let y = 6;
  const L = TL.L, R = TL.R;
  const label = (txt, yy, tip) => { const t = sv("text", { x: L - 8, y: yy, "text-anchor": "end", class: "rowlbl" }, txt); if (tip) t.append(sv("title", {}, tip)); svg.append(t); };
  // events
  log.events.forEach((e) => {
    const h = 18, base = y + h;
    const shape = eventShape(e.p);
    if (shape.length) svg.append(sv("polygon", { points: shape.map(([t, s]) => `${f1(xOf(Math.min(Math.max(t, log.t0), log.t1)))},${f1(base - s * (h - 3))}`).join(" "), class: "evbar" }));
    svg.append(sv("line", { x1: L, x2: R, y1: base, y2: base, class: "ax" }));
    label(`${e.id}. ${kindLabel(e.p.kind)}`, y + 12, e.description);
    y += h + 6;
  });
  // moments
  label("moments", y + 11);
  for (const m of log.timeline) {
    const x = xOf(m.t_s), bad = m.what === "fix-lost";
    const d = sv("path", { d: `M${f1(x)} ${y + 2} l5 5 l-5 5 l-5 -5z`, class: `mom${bad ? " lost" : ""}` });
    d.append(sv("title", {}, `T+${Math.round(m.t_s)} s ${whatLabel(m.what)}: ${m.text}`));
    svg.append(d);
  }
  y += 22;
  // fix strip
  label("fix", y + 10);
  let a = 0;
  const T = log.track;
  for (let i = 1; i <= T.length; i++) {
    if (i === T.length || T[i].fixValid !== T[a].fixValid) {
      const x0 = xOf(T[a].t_s), x1 = i < T.length ? xOf(T[i].t_s) : xOf(T[T.length - 1].t_s);
      const rc = sv("rect", { x: x0, y, width: Math.max(1, x1 - x0), height: 12, class: T[a].fixValid ? "fix-ok" : "fix-lost" });
      rc.append(sv("title", {}, `${T[a].fixValid ? "fix reported" : "no fix"}, ${fmtT(T[a].t_s)} to ${fmtT(T[Math.min(i, T.length) - 1].t_s)}`));
      svg.append(rc); a = i;
    }
  }
  y += 24;
  // line charts
  const line = (name, unit, get, opts = {}) => {
    const h = opts.h || 44, top = y + 4, bot = y + h;
    const vals = T.map(get).filter((v) => v != null);
    let lo = 0, hi = Math.max(opts.min2 ?? 0.0001, opts.max ?? -Infinity);
    for (const v of vals) { if (v < lo) lo = v; if (v > hi) hi = v; }
    if (opts.min != null) lo = opts.min;
    const yv = (v) => bot - ((v - lo) / (hi - lo || 1)) * (bot - top);
    svg.append(sv("line", { x1: L, x2: R, y1: bot, y2: bot, class: "ax" }));
    if (lo < 0 && hi > 0) svg.append(sv("line", { x1: L, x2: R, y1: yv(0), y2: yv(0), class: "edge" }));
    label(name, y + 16, undefined);
    svg.append(sv("text", { x: L - 8, y: y + 28, "text-anchor": "end", class: "unit" }, `${unit}`));
    svg.append(sv("text", { x: R, y: top + 8, "text-anchor": "end", class: "unit" }, `max ${f1(hi)}`));
    let d = "", pen = false;
    for (const r of T) { const v = get(r); if (v == null) { pen = false; continue; } d += `${pen ? "L" : "M"}${f1(xOf(r.t_s))} ${f1(yv(v))}`; pen = true; }
    svg.append(sv("path", { d, class: `ln ${opts.cls || ""}` }));
    if (opts.get2) {
      let d2 = "", p2 = false;
      for (const r of T) { const v = opts.get2(r); if (v == null) { p2 = false; continue; } d2 += `${p2 ? "L" : "M"}${f1(xOf(r.t_s))} ${f1(yv(v))}`; p2 = true; }
      svg.append(sv("path", { d: d2, class: "ln dashed" }));
    }
    y += h + 10;
  };
  line("position error", "m", (r) => r.errM, { min: 0 });
  line("mean C/N0", "dB-Hz", (r) => r.cn0, { min: 0 });
  line("satellites", "used / tracked", (r) => r.nUsed, { min: 0, get2: (r) => r.nTracked, max: 1 });
  line("time offset", "s, reported minus true", (r) => r.timeOff, {});
  // axis
  const span = log.t1 - log.t0, step = [10, 30, 60, 120, 300, 600, 1800, 3600].find((s) => span / s <= 10) || 3600;
  for (let t = Math.ceil(log.t0 / step) * step; t <= log.t1; t += step) svg.append(sv("line", { x1: xOf(t), x2: xOf(t), y1: y, y2: y + 5, class: "ax" }), sv("text", { x: xOf(t), y: y + 17, "text-anchor": "middle" }, fmtT(t)));
  y += 24;
  svg.setAttribute("viewBox", `0 0 ${TL.W} ${y}`);
  dyn.cur = sv("line", { class: "cur", y1: 0, y2: y - 22 });
  svg.append(dyn.cur);
  svg.onpointerdown = (ev) => { svg.setPointerCapture?.(ev.pointerId); timePointer(ev); };
  svg.onpointermove = (ev) => { if (ev.buttons) timePointer(ev); };
  svg.onkeydown = keyStep;
  svg.setAttribute("aria-valuemax", String(log.track.length - 1));
}
function timePointer(ev) {
  const svg = ev.currentTarget, r = svg.getBoundingClientRect();
  const x = ((ev.clientX - r.left) / r.width) * TL.W;
  const t = log.t0 + ((x - TL.L) / (TL.R - TL.L)) * (log.t1 - log.t0);
  setCursor(nearestRow(log, Math.min(log.t1, Math.max(log.t0, t))));
}
function keyStep(ev) {
  const big = ev.shiftKey ? 10 : 1;
  let i = cur;
  if (ev.key === "ArrowRight" || ev.key === "ArrowUp") i += big;
  else if (ev.key === "ArrowLeft" || ev.key === "ArrowDown") i -= big;
  else if (ev.key === "Home") i = 0;
  else if (ev.key === "End") i = log.track.length - 1;
  else if (ev.key === "PageDown") { const m = stepTimeline(log, log.track[cur].t_s, 1); if (m) i = nearestRow(log, m.t_s); }
  else if (ev.key === "PageUp") { const m = stepTimeline(log, log.track[cur].t_s, -1); if (m) i = nearestRow(log, m.t_s); }
  else return;
  ev.preventDefault();
  setCursor(i);
}

function drawEvents() {
  const box = $("tr-events");
  box.replaceChildren();
  if (!log.events.length) { box.append(el("p", { class: "tr-none" }, "None: this is a clean run.")); return; }
  for (const e of log.events) {
    box.append(el("details", { class: "tr-ev", open: "" }, el("summary", {}, `${e.id}. ${kindLabel(e.p.kind)}${e.p.label ? `: ${e.p.label}` : ""}`),
      el("p", {}, e.description), e.startUtc ? el("p", { class: "tr-sub" }, `Onset ${e.startUtc}`) : null,
      el("dl", { class: "tr-kv" }, [...paramRows(e.p), ...eventExtraRows(e)].flatMap(([k, v]) => [el("dt", {}, k), el("dd", {}, v)]))));
  }
}
function drawTimelineList() {
  const ol = $("tr-tlist");
  ol.replaceChildren();
  if (!log.timeline.length) { ol.append(el("li", { class: "tr-none" }, "No moments recorded.")); return; }
  const shown = log.timeline.slice(0, MAX_MOMENTS_SHOWN);
  $("tr-tl-cap").textContent = log.timeline.length > shown.length ? `First ${shown.length} of ${log.timeline.length} moments shown.` : "";
  for (const m of shown) {
    const b = el("button", { type: "button", class: "tr-mom" }, el("b", {}, `T+${Math.round(m.t_s)} s`), " ", el("span", { class: `tr-what${m.what === "fix-lost" ? " lost" : ""}` }, whatLabel(m.what)), m.event != null ? ` (event ${m.event})` : "", el("span", { class: "tr-mtext" }, m.text));
    b.onclick = () => { stop(); setCursor(nearestRow(log, m.t_s)); $("tr-time-svg").scrollIntoView?.({ block: "nearest" }); };
    ol.append(el("li", {}, b));
  }
}

// ---------- the cursor ----------

function setCursor(i) {
  if (!log) return;
  cur = Math.max(0, Math.min(log.track.length - 1, i));
  const r = log.track[cur];
  const x = xOf(r.t_s);
  dyn.cur?.setAttribute("x1", x); dyn.cur?.setAttribute("x2", x);
  $("tr-slider").value = String(cur);
  const svg = $("tr-time-svg");
  svg.setAttribute("aria-valuenow", String(cur)); svg.setAttribute("aria-valuetext", describeRow(log, cur));
  $("tr-readout").textContent = `T+${fmtT(r.t_s)} · ${r.fixValid ? "fix" : "no fix"}${r.errM != null ? ` · ${r.errM < 10 ? r.errM.toFixed(1) : Math.round(r.errM)} m` : ""}`;
  if (!playing) $("tr-live").textContent = describeRow(log, cur);
  const [tx, ty] = dyn.px(r.truth);
  dyn.truDot.setAttribute("cx", tx); dyn.truDot.setAttribute("cy", ty);
  dyn.truDot.style.display = dyn.truthPath.style.display = showTruth ? "" : "none";
  if (r.rep) {
    const [rx, ry] = dyn.px(r.rep);
    dyn.repDot.setAttribute("cx", rx); dyn.repDot.setAttribute("cy", ry); dyn.repDot.style.display = "";
    dyn.repDot.setAttribute("stroke", BAND_VAR[errorBand(r.errM) || "small"]);
    dyn.link.setAttribute("x1", rx); dyn.link.setAttribute("y1", ry); dyn.link.setAttribute("x2", tx); dyn.link.setAttribute("y2", ty);
    dyn.link.style.display = showTruth ? "" : "none";
  } else { dyn.repDot.style.display = "none"; dyn.link.style.display = "none"; }
  drawNow();
}

function drawNow() {
  const r = log.track[cur], box = $("tr-now");
  box.replaceChildren();
  $("tr-now-note").textContent = `Log row ${cur + 1} of ${log.track.length}, ${r.utc || ""}`;
  const row = (k, a, b) => el("tr", {}, el("th", { scope: "row" }, k), el("td", {}, a), el("td", {}, b));
  const t = el("table", { class: "tbl tr-cmp" }, el("thead", {}, el("tr", {}, ["", "True", "Reported by the receiver"].map((h) => el("th", { scope: "col" }, h)))),
    el("tbody", {}, row("Position", `${r.truth[0].toFixed(5)}, ${r.truth[1].toFixed(5)}`, r.rep ? `${r.rep[0].toFixed(5)}, ${r.rep[1].toFixed(5)}` : "no fix: nothing reported"),
      row("Speed over ground, kn", num(r.trueSog), num(r.repSog)), row("Course over ground, deg", num(r.trueCog), num(r.repCog)),
      row("Heading (gyro), deg", num(r.trueHdg), "not touched by any event"),
      row("Position error, m", "", r.errM == null ? "none" : r.errM.toFixed(1)),
      row("Time offset, s", "", `${r.timeOff > 0 ? "+" : ""}${r.timeOff.toFixed(1)}`),
      row("Satellites used / tracked", "", `${r.nUsed} / ${r.nTracked}`), row("Mean C/N0, dB-Hz", "", num(r.cn0))));
  box.append(t);
  const cue = sensorCue(r);
  if (cue && (cue.courseMinusHeadingDeg != null || cue.sogMinusTrueKn != null)) {
    box.append(el("p", { class: "tr-cue" }, el("b", {}, "Debrief cue. "), `The gyro heading and the log speed are untouched by every event. Here the reported course differs from the gyro heading by ${cue.courseMinusHeadingDeg == null ? "an unknown amount" : Math.abs(cue.courseMinusHeadingDeg).toFixed(1) + "°"}${cue.sogMinusTrueKn == null ? "" : ` and the reported speed from the true speed by ${Math.abs(cue.sogMinusTrueKn).toFixed(1)} kn`}. A current also separates heading from course, so compare with the start of the run.`));
  }
  box.append(el("h4", {}, "Active events"));
  if (!r.active.length) box.append(el("p", { class: "tr-none" }, "None at this moment."));
  else box.append(el("ul", { class: "tr-act" }, r.active.map((id) => { const e = log.events.find((x) => x.id === id); return el("li", {}, e ? e.description : `Event ${id}`); })));
}

// ---------- playing ----------

function medianDt() {
  const d = [];
  for (let i = 1; i < Math.min(log.track.length, 200); i++) d.push(log.track[i].t_s - log.track[i - 1].t_s);
  d.sort((a, b) => a - b);
  return d.length ? d[d.length >> 1] || 1 : 1;
}
function tick(ts) {
  if (!playing) return;
  frac += (((ts - lastTs) / 1000) * (Number($("tr-speed").value) || 1)) / medianDt(); lastTs = ts;
  const steps = Math.floor(frac); frac -= steps;
  const i = Math.min(log.track.length - 1, cur + steps);
  if (i !== cur) setCursor(i);
  if (i >= log.track.length - 1) stop(); else raf = requestAnimationFrame(tick);
}
function play() {
  if (!log) return;
  if (cur >= log.track.length - 1) setCursor(0);
  playing = true; lastTs = performance.now(); frac = 0;
  $("tr-play").setAttribute("aria-label", "Pause"); $("tr-play").firstElementChild.firstElementChild.setAttribute("href", "#i-pause");
  raf = requestAnimationFrame(tick);
}
function stop() {
  playing = false; cancelAnimationFrame(raf);
  const b = $("tr-play"); b.setAttribute("aria-label", "Play"); b.firstElementChild.firstElementChild.setAttribute("href", "#i-play");
  if (log) $("tr-live").textContent = describeRow(log, cur);
}

function wire() {
  $("tr-demos").replaceChildren(...DEMOS.map(([n, t]) => { const b = el("button", { type: "button", class: "tr-demo" }, t); b.onclick = () => openDemo(n, t); return b; }));
  $("tr-files").addEventListener("change", (e) => { openFile(e.target.files[0]); e.target.value = ""; });
  const drop = $("tr-drop");
  for (const ev of ["dragenter", "dragover"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.add("over"); });
  for (const ev of ["dragleave", "drop"]) drop.addEventListener(ev, (e) => { e.preventDefault(); drop.classList.remove("over"); });
  drop.addEventListener("drop", (e) => openFile((e.dataTransfer?.files || [])[0]));
  // Replay is motion: with a reduced-motion preference it starts at 1x and says so.
  try { if (matchMedia("(prefers-reduced-motion: reduce)").matches) { $("tr-speed").value = "1"; $("tr-live").textContent = "Reduced motion is preferred, so replay starts at 1x. Use the slider or the arrow keys to move without animation."; } } catch (e) { /* no matchMedia */ }
  $("tr-play").addEventListener("click", () => (playing ? stop() : play()));
  $("tr-slider").addEventListener("input", (e) => { if (playing) stop(); setCursor(Number(e.target.value)); });
  $("tr-prev").addEventListener("click", () => { stop(); const m = stepTimeline(log, log.track[cur].t_s, -1); if (m) setCursor(nearestRow(log, m.t_s)); });
  $("tr-next").addEventListener("click", () => { stop(); const m = stepTimeline(log, log.track[cur].t_s, 1); if (m) setCursor(nearestRow(log, m.t_s)); });
  $("tr-truth").addEventListener("change", (e) => { showTruth = e.target.checked; if (log) setCursor(cur); });
  $("btn-theme").addEventListener("click", () => {
    const root = document.documentElement;
    const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
    root.dataset.theme = dark ? "light" : "dark";
    try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch (e) { /* storage blocked */ }
  });
  let rt = 0, lastW = 0;
  addEventListener("resize", () => { clearTimeout(rt); rt = setTimeout(() => { if (!log) return; const w = Math.round($("tr-time-svg").parentElement.clientWidth); if (w === lastW) return; lastW = w; layout(); drawTimeline(); setCursor(cur); }, 120); });
  const q = new URLSearchParams(location.search).get("demo");
  const hit = DEMOS.find(([n]) => n === q);
  if (hit) openDemo(hit[0], hit[1]);
}
wire();
