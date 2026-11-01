// SPDX-License-Identifier: AGPL-3.0-only
// Lunar station view: the DOM layer. Reading the report, the address, the scenario inputs and the map's placement
// are lib/lunar-station.mjs; every figure shown is the engine's. Fetches only the two fixed files of this kind
// (the bundled scenario and its recording) from this site; a result file is read in the page.
import { readReport, parseState, buildSearch, withInputs, tomlNumber, stereo, cellsOf, cellPath, thresholdEdges, segmentPath, destination, binOf, rangeEdges, binIn, dominantShare, meets, pct, metres, INPUTS, REASONS, BINS, KIND, SCENARIO_FILE, RECORDED_FILE, MOON_RADIUS_M } from "../lib/lunar-station.mjs";
import { getEngine } from "../lib/engine-page.mjs";
import { mountBadge } from "../lib/evidence.mjs";
import { needsNewerEngine } from "../lib/catalog.mjs";
import { t, ready } from "../lib/t.mjs";
await ready(); // the page's first catalogue is loaded before text is built

const $ = (id) => document.getElementById(id);
const NS = "http://www.w3.org/2000/svg";
const R = 190, MAX_BYTES = 32 * 1024 * 1024;
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
const f1 = (x) => (x == null ? t("js-lunar-not-stated", "not stated") : (Math.round(x * 10) / 10).toString());

// ---------------------------------------------------------------- state
const first = parseState(location.search);
let state = first.state;
let toml = null;        // the bundled scenario's text, when this site has it
let rep = null, raw = null, from = "";   // from: "recorded", "run" or "file"
let engine = null, running = false;
function setNotes(list) { $("ls-url-notes").replaceChildren(...list.map((s) => el("li", {}, s))); }
setNotes(first.notes);
function writeAddress() { try { history.replaceState(null, "", location.pathname + buildSearch(state)); } catch { /* a sandboxed frame */ } }
const status = (s) => { $("ls-engine").textContent = s; };

// ---------------------------------------------------------------- inputs
function drawInputs() {
  $("ls-inputs").replaceChildren(...INPUTS.map((d) => {
    const fileV = toml ? tomlNumber(toml, d.key) : null;
    const v = state.set[d.q] ?? fileV;
    const inp = el("input", { id: `ls-in-${d.q}`, type: "number", inputmode: d.int ? "numeric" : "decimal", min: d.min, max: d.max, step: d.step, "data-q": d.q, disabled: toml && fileV == null ? "" : null });
    if (v != null) inp.value = String(v);
    return el("label", { class: "ls-f" }, d.label, inp, fileV == null ? null : el("small", {}, t("js-lunar-file-value", "file: { $value }", { value: fileV })));
  }));
  for (const r of document.querySelectorAll('input[name="ls-src"]')) r.checked = r.value === state.src;
}
$("ls-inputs").addEventListener("change", (ev) => {
  const tg = ev.target, d = INPUTS.find((x) => x.q === tg.dataset.q);
  if (!d) return;
  const v = Number(tg.value);
  const fileV = toml ? tomlNumber(toml, d.key) : null;
  if (tg.value === "" || !Number.isFinite(v) || v < d.min || v > d.max || (d.int && !Number.isInteger(v))) { setNotes([d.int ? t("js-lunar-give-whole-value", "{ $label }: give a value from { $min } to { $max } (a whole number).", { label: d.label, min: d.min, max: d.max }) : t("js-lunar-give-value", "{ $label }: give a value from { $min } to { $max }.", { label: d.label, min: d.min, max: d.max })]); delete state.set[d.q]; }
  else { setNotes([]); if (fileV != null && v === fileV) delete state.set[d.q]; else state.set[d.q] = v; }
  writeAddress();
});
$("ls-reset").addEventListener("click", () => { state.set = {}; writeAddress(); drawInputs(); setNotes([]); });
for (const r of document.querySelectorAll('input[name="ls-src"]')) r.addEventListener("change", () => { state.src = r.value; writeAddress(); load(); });

// ---------------------------------------------------------------- sources
async function loadRecorded() {
  let res;
  try { res = await fetch(RECORDED_FILE); } catch { res = null; }
  if (!res || !res.ok) { show(null); status(t("js-lunar-no-recording", "No recording of this study ships yet: it is made at the release with the 0.36 engine. Run it here with an engine that has the kind, or open a result file.")); return; }
  openText(await res.text(), t("js-lunar-what-recording", "the recording that ships with the Studio"), "recorded");
}
async function runHere() {
  if (running) return;
  if (!toml) { status(t("js-lunar-no-scenario", "This site has no { $file } yet: it arrives with the 0.36 engine. Open a result file instead.", { file: SCENARIO_FILE.replace(/^scenarios\//, "") })); return; }
  const w = withInputs(toml, state.set);
  if (w.error) { status(w.error); return; }
  engine = engine || await getEngine();
  if (!engine.available) { status(t("js-lunar-engine-no-start", "The engine could not start in this browser ({ $reason }). Open a result file instead.", { reason: engine.error })); return; }
  let kinds = null;
  try { kinds = new Set(JSON.parse(await engine.call("list_kinds")).map((x) => (x && typeof x === "object" ? x.name : x))); } catch { /* an engine without list_kinds: the version decides */ }
  const need = needsNewerEngine(`${KIND}.toml`, { version: engine.version, kinds, fns: null });
  if (need) { status(t("js-lunar-needs-newer-engine", "This study needs engine { $need } or later; the engine running here is v{ $version }. The recording, or a result file, can still be shown.", { need, version: engine.version })); return; }
  running = true; $("ls-run").disabled = true;
  const t0 = performance.now();
  const tick = setInterval(() => status(t("js-lunar-running-elapsed", "Running the study in this browser… { $seconds } s", { seconds: Math.round((performance.now() - t0) / 1000) })), 1000);
  status(t("js-lunar-running", "Running the study in this browser…"));
  try {
    const out = await engine.call("run_all", w.toml);
    openText(out, t("js-lunar-what-run", "a run in this browser (engine { $version })", { version: engine.version }), "run");
  } catch (e) {
    const m = String(e?.message || e).split("\n")[0].slice(0, 300);
    status(/unknown|not a known|unsupported/i.test(m) && /kind/i.test(m) ? t("js-lunar-engine-unknown-kind", "This engine ({ $version }) does not know the { $kind } kind; it needs engine 0.36.", { version: engine.version, kind: KIND }) : t("js-lunar-run-stopped", "The run stopped: { $message }", { message: m }));
  } finally { clearInterval(tick); running = false; $("ls-run").disabled = false; }
}
$("ls-run").addEventListener("click", () => { state.src = "live"; writeAddress(); drawInputs(); runHere(); });
$("ls-file").addEventListener("change", async (ev) => {
  const f = ev.target.files?.[0]; ev.target.value = "";
  if (!f) return;
  if (f.size > MAX_BYTES) { status(t("js-lunar-file-too-large", "{ $name }: larger than 32 MiB; this page reads result files up to that size.", { name: f.name })); return; }
  openText(await f.text(), t("js-lunar-what-file", "the file { $name }", { name: f.name.slice(0, 80) }), "file");
});
function openText(text, what, kind) {
  const r = readReport(text);
  if (r.error) { status(t("js-lunar-source-error", "{ $what }: { $error }", { what, error: r.error })); return; }
  rep = r; raw = text; from = kind;
  status(r.engineVersion ? t("js-lunar-showing-engine", "Showing { $what } (engine { $version }).", { what, version: r.engineVersion }) : t("js-lunar-showing", "Showing { $what }.", { what }));
  show(r);
}
async function load() {
  if (state.src === "live") { if (rep && from === "run") return; status(t("js-lunar-set-inputs", "Set the inputs and press Run it here.")); return; }
  await loadRecorded();
}

// ---------------------------------------------------------------- drawing
const percentKeys = () => ["100 %", t("js-lunar-key-99-or-more", "99 % or more"), t("js-lunar-key-95-or-more", "95 % or more"), t("js-lunar-key-90-or-more", "90 % or more"), t("js-lunar-key-50-or-more", "50 % or more"), t("js-lunar-key-below-50", "below 50 %")];
const LAYER = {
  range: { get title() { return t("js-lunar-layer-range", "corrected error over its own range"); }, cls: "ls-s", bin: (p, r, edges) => binIn(p.corrected, edges), keys: (r, edges) => (edges ? edges.map((e, i) => (i === 0 ? t("js-lunar-key-up-to", "up to { $value }", { value: metres(e) }) : t("js-lunar-key-between", "{ $from } to { $to }", { from: metres(edges[i - 1]), to: metres(e) }))).concat([t("js-lunar-key-above", "above { $value }", { value: metres(edges.at(-1)) })]) : []) },
  error: { get title() { return t("js-lunar-layer-error", "corrected error"); }, bin: (p, r) => binOf(p.corrected, r.threshold), keys: () => BINS.map((b, i) => (i === 0 ? t("js-lunar-key-up-to-threshold", "up to { $value } × threshold", { value: b }) : t("js-lunar-key-between-threshold", "{ $from } to { $to } × threshold", { from: BINS[i - 1], to: b }))).concat([t("js-lunar-key-above-threshold", "above { $value } × threshold", { value: BINS.at(-1) })]) },
  availability: { get title() { return t("js-lunar-layer-availability", "availability"); }, bin: (p) => (p.availability == null ? null : p.availability >= 0.9999 ? 0 : p.availability >= 0.99 ? 1 : p.availability >= 0.95 ? 2 : p.availability >= 0.9 ? 3 : p.availability >= 0.5 ? 4 : 5), keys: percentKeys },
  coverage: { get title() { return t("js-lunar-layer-coverage", "coverage"); }, bin: (p) => (p.coverage == null ? null : p.coverage >= 0.9999 ? 0 : p.coverage >= 0.99 ? 1 : p.coverage >= 0.95 ? 2 : p.coverage >= 0.9 ? 3 : p.coverage >= 0.5 ? 4 : 5), keys: percentKeys },
};
$("ls-layer").addEventListener("change", () => { if (rep) drawMap(rep); });

function show(r) {
  $("ls-save").hidden = !r;
  mountBadge($("ls-evb"), r || {});
  if (!r) { $("ls-map").replaceChildren(); $("ls-region").replaceChildren(); $("ls-radplot").replaceChildren(); $("ls-availfigs").replaceChildren(); $("ls-reasons").replaceChildren(); $("ls-points").tBodies[0].replaceChildren(); $("ls-legend").replaceChildren(); $("ls-map-note").textContent = ""; $("ls-rad-lim").textContent = ""; $("ls-counts").textContent = ""; return; }
  drawMap(r); drawRegion(r); drawRadius(r); drawAvailability(r); drawTable(r); drawMore(r);
}

function drawMap(r) {
  const svg = $("ls-map"), layer = LAYER[$("ls-layer").value] || LAYER.error;
  const info = cellsOf(r.points, r.grid.latStep);
  const rimLat = info.lats.length ? Math.min(0, info.lats.at(-1) + info.half) : -80;
  const kids = [sv("defs", {}, sv("clipPath", { id: "ls-clip" }, sv("circle", { cx: 0, cy: 0, r: R }))), sv("circle", { cx: 0, cy: 0, r: R, class: "ls-rim" })];
  const edges = rangeEdges(r.points.map((p) => p.corrected));
  const bins = info.cells.map((c) => layer.bin(c.p, r, edges));
  const one = dominantShare(bins);
  $("ls-map-note").textContent = layer === LAYER.error && one >= 0.95 ? t("js-lunar-map-note-one-band", "{ $share } % of the points fall in one band of the threshold scale, so the map shows little variation: colour by \"its own range\" to see how the error varies across the region.", { share: Math.round(one * 100) }) : "";
  for (const [ci, c] of info.cells.entries()) {
    const b = bins[ci];
    kids.push(sv("path", { d: cellPath(c, rimLat, R), class: b == null ? "ls-cell ls-none" : `ls-cell ${layer.cls || "ls-b"}${b}`, fill: b == null ? "url(#ls-hatch)" : null },
      sv("title", {}, t("js-lunar-cell-title", "{ $lat }°, { $lon }°: corrected { $corrected }, availability { $availability }, coverage { $coverage }", { lat: c.p.lat.toFixed(2), lon: c.p.lon.toFixed(2), corrected: metres(c.p.corrected), availability: pct(c.p.availability), coverage: pct(c.p.coverage) }))));
  }
  // graticule: rings every 2 degrees, meridians every 30
  for (let lat = -88; lat < rimLat - 1e-6; lat += 2) kids.push(sv("circle", { cx: 0, cy: 0, r: Math.abs(stereo(lat, 0, rimLat, R)[1]).toFixed(1), class: "ls-grat" }));
  for (let lon = 0; lon < 360; lon += 30) { const [x, y] = stereo(rimLat, lon, rimLat, R); kids.push(sv("line", { x1: 0, y1: 0, x2: x.toFixed(1), y2: y.toFixed(1), class: "ls-grat" })); }
  for (const [lon, label, anchor] of [[0, "0°", "middle"], [90, t("js-lunar-bearing-east", "90° E"), "start"], [180, "180°", "middle"], [-90, t("js-lunar-bearing-west", "90° W"), "end"]]) { const [x, y] = stereo(rimLat, lon, rimLat, R + (anchor === "middle" ? 12 : 6)); kids.push(sv("text", { x: x.toFixed(1), y: (y + 4).toFixed(1), "text-anchor": anchor, class: "ls-lbl" }, label)); }
  if (r.threshold != null) kids.push(sv("path", { d: segmentPath(thresholdEdges(info, r.threshold), rimLat, R), class: "ls-contour" }, sv("title", {}, t("js-lunar-threshold-title", "corrected error { $value } (the threshold)", { value: metres(r.threshold) }))));
  if (r.station.lat != null && r.station.lon != null && r.radius.length) {
    const rm = r.moonRadiusM ?? MOON_RADIUS_M;
    const line = r.radius.map((x) => destination(r.station.lat, r.station.lon, x.az, x.km, rm)).map(([la, lo]) => stereo(la, lo, rimLat, R));
    kids.push(sv("path", { d: `M${line.map(([x, y]) => `${x.toFixed(1)} ${y.toFixed(1)}`).join(" L")}${r.radius.length > 2 && r.radius[0].az === 0 && 360 - r.radius.at(-1).az <= 360 / r.radius.length + 1e-6 ? "Z" : ""}`, class: "ls-radius-line", "clip-path": "url(#ls-clip)" }, sv("title", {}, t("js-lunar-radius-per-azimuth", "coverage radius per azimuth"))));
  }
  if (r.region.worst) { const [x, y] = stereo(r.region.worst.lat, r.region.worst.lon, rimLat, R); kids.push(sv("circle", { cx: x.toFixed(1), cy: y.toFixed(1), r: 7, class: "ls-worst" }, sv("title", {}, t("js-lunar-worst-title", "worst point { $lat }°, { $lon }°: { $value }", { lat: r.region.worst.lat.toFixed(2), lon: r.region.worst.lon.toFixed(2), value: metres(r.region.worst.value) })))); }
  if (r.station.lat != null && r.station.lon != null) {
    const [x, y] = stereo(r.station.lat, r.station.lon, rimLat, R);
    kids.push(sv("path", { d: `M${x.toFixed(1)} ${(y - 8).toFixed(1)} L${(x + 7).toFixed(1)} ${(y + 5).toFixed(1)} L${(x - 7).toFixed(1)} ${(y + 5).toFixed(1)}Z`, class: "ls-station" }, sv("title", {}, t("js-lunar-station-title", "station { $lat }°, { $lon }°", { lat: r.station.lat, lon: r.station.lon }))),
      sv("text", { x: (x + 10).toFixed(1), y: (y + 4).toFixed(1), class: "ls-lbl ls-st-lbl" }, t("js-lunar-station", "station")));
  }
  svg.replaceChildren(...kids);
  const meet = r.points.filter((p) => meets(p, r.threshold)).length;
  $("ls-map-desc").textContent = t("js-lunar-map-desc", "{ $points } grid points from the pole to { $rim }° latitude. { $meet } of them have a corrected { $percentile } percentile error within the threshold of { $threshold }. Coloured by { $layer }. The station is at { $lat }°, { $lon }°.", { points: r.points.length, rim: rimLat.toFixed(1), meet, percentile: r.percentile ?? "", threshold: metres(r.threshold), layer: layer.title, lat: r.station.lat ?? "?", lon: r.station.lon ?? "?" });
  const keys = layer.keys(r, edges);
  $("ls-legend").replaceChildren(
    ...keys.map((k, i) => el("li", {}, el("i", { class: `${layer.cls || "ls-b"}${i}` }), k)),
    el("li", {}, el("i", { class: "ls-none" }), t("js-lunar-legend-no-figure", "no figure (unavailable throughout)")),
    el("li", {}, el("i", { class: "ls-k-contour" }), t("js-lunar-legend-threshold", "threshold, { $value }", { value: metres(r.threshold) })),
    el("li", {}, el("i", { class: "ls-k-radius" }), t("js-lunar-legend-radius", "coverage radius")),
    el("li", {}, el("i", { class: "ls-k-station" }), t("js-lunar-station", "station")),
    el("li", {}, el("i", { class: "ls-k-worst" }), t("js-lunar-legend-worst", "worst point")));
}

function fig(k, v, sub) { return el("div", {}, el("dt", {}, k), el("dd", {}, v), sub ? el("small", {}, sub) : null); }
function drawRegion(r) {
  const n = r.percentile ?? "?", g = r.region;
  $("ls-region").replaceChildren(
    fig(t("js-lunar-fig-corrected-3d", "Corrected error, { $n } %, 3\u2011D", { n }), metres(g.corrected3d), t("js-lunar-fig-horizontal-vertical", "horizontal { $h }, vertical { $v }", { h: metres(g.correctedH), v: metres(g.correctedV) })),
    fig(t("js-lunar-fig-uncorrected-3d", "Uncorrected error, { $n } %, 3\u2011D", { n }), metres(g.uncorrected3d)),
    fig(t("js-lunar-fig-improvement", "Improvement factor"), g.improvement == null ? t("js-lunar-not-stated", "not stated") : `${f1(g.improvement)} ×`),
    fig(t("js-lunar-fig-coverage", "Coverage"), pct(g.coverage), t("js-lunar-fig-epochs-within", "epochs within { $value }", { value: metres(r.threshold) })),
    fig(t("js-lunar-fig-hpl-vpl", "HPL, VPL at most"), `${metres(g.hplMax)}, ${metres(g.vplMax)}`),
    fig(t("js-lunar-fig-hpl-below-alert", "HPL below the alert limit"), pct(g.hplBelow), r.alert == null ? t("js-lunar-alert-not-stated", "alert limit not stated") : t("js-lunar-alert-limit", "alert limit { $value } (illustrative)", { value: metres(r.alert) })),
    fig(t("js-lunar-fig-worst-point", "Worst point"), g.worst ? metres(g.worst.value) : t("js-lunar-not-stated", "not stated"), g.worst ? t("js-lunar-worst-at", "at { $lat }°, { $lon }°", { lat: g.worst.lat.toFixed(2), lon: g.worst.lon.toFixed(2) }) : null));
  $("ls-counts").textContent = t("js-lunar-counts", "{ $sats } satellites, { $points } grid points, { $epochs } epochs, { $trials } Monte Carlo trials per epoch. Label: { $label }.", { sats: r.nSats ?? "?", points: r.nPoints ?? r.points.length, epochs: r.nEpochs ?? "?", trials: r.nTrials ?? "?", label: r.label || t("js-lunar-not-stated", "not stated") });
}

function drawRadius(r) {
  const svg = $("ls-radplot"), L = 46, Rr = 388, T = 14, B = 186;
  const max = Math.max(1, ...r.radius.map((x) => x.km));
  const top = [1, 2, 5].map((m) => m * 10 ** Math.floor(Math.log10(max))).concat([10 ** Math.ceil(Math.log10(max))]).find((v) => v >= max);
  const X = (az) => L + ((Rr - L) * az) / 360, Y = (km) => B - ((B - T) * km) / top;
  const kids = [];
  for (let k = 0; k <= 4; k++) { const v = (top * k) / 4; kids.push(sv("line", { x1: L, x2: Rr, y1: Y(v), y2: Y(v), class: "ls-grat" }), sv("text", { x: L - 6, y: Y(v) + 4, "text-anchor": "end", class: "ls-lbl" }, top < 5 ? String(Number(v.toFixed(2))) : f1(v))); }
  for (let az = 0; az <= 360; az += 90) kids.push(sv("text", { x: X(az), y: B + 16, "text-anchor": "middle", class: "ls-lbl" }, `${az}°`));
  kids.push(sv("text", { x: 8, y: T - 2, class: "ls-lbl" }, "km"));
  if (r.radius.length) kids.push(sv("path", { d: `M${r.radius.map((x) => `${X(x.az).toFixed(1)} ${Y(x.km).toFixed(1)}`).join(" L")}`, class: "ls-radius-plot" }));
  for (const x of r.radius) kids.push(sv("circle", { cx: X(x.az).toFixed(1), cy: Y(x.km).toFixed(1), r: 3, class: x.limited ? "ls-radius-dot ls-limited" : "ls-radius-dot" }, sv("title", {}, x.limited ? t("js-lunar-radius-point-limited", "{ $az }°: { $km } km (reaches the edge of the grid: at least this far)", { az: x.az, km: f1(x.km) }) : t("js-lunar-radius-point", "{ $az }°: { $km } km", { az: x.az, km: f1(x.km) }))));
  svg.replaceChildren(...kids);
  const lo = r.radius.length ? r.radius.reduce((a, b) => (b.km < a.km ? b : a)) : null, hi = r.radius.length ? r.radius.reduce((a, b) => (b.km > a.km ? b : a)) : null;
  const lim = r.radius.filter((x) => x.limited).length;
  $("ls-rad-desc").textContent = r.radius.length ? `${t("js-lunar-radius-desc", "Coverage radius over { $count } azimuths: shortest { $lo } km at { $loAz }°, longest { $hi } km at { $hiAz }°.", { count: r.radius.length, lo: f1(lo.km), loAz: lo.az, hi: f1(hi.km), hiAz: hi.az })}${lim ? ` ${t("js-lunar-radius-desc-limited", "{ $count } reach the edge of the grid, so coverage runs at least that far there.", { count: lim })}` : ""}` : t("js-lunar-radius-none", "The report states no coverage radius.");
  const none = r.radius.length && r.radius.every((x) => x.km === 0);
  $("ls-rad-lim").textContent = none ? t("js-lunar-radius-zero", "On every bearing coverage is below 95 % already at the station, so the radius is 0 km: the corrected error exceeds the threshold of { $value } there.", { value: metres(r.threshold) }) : lim ? t("js-lunar-radius-hollow", "Hollow points reach the edge of the grid: coverage holds at least that far along that bearing.") : "";
  $("ls-radtab").tBodies[0].replaceChildren(...r.radius.map((x) => el("tr", {}, el("td", {}, String(x.az)), el("td", {}, f1(x.km)), el("td", {}, x.limited ? t("js-lunar-yes-at-least", "yes: at least this far") : t("js-lunar-no", "no")), el("td", {}, x.n == null ? t("js-lunar-not-stated", "not stated") : String(x.n)))));
}

function drawAvailability(r) {
  const avail = r.points.map((p) => p.availability).filter((x) => x != null);
  const full = avail.filter((x) => x >= 0.9999).length;
  $("ls-availfigs").replaceChildren(
    fig(t("js-lunar-fig-availability-region", "Availability over the region"), pct(r.region.availability)),
    fig(t("js-lunar-fig-points-always-available", "Points available at every epoch"), t("js-lunar-full-of-total", "{ $full } of { $total }", { full, total: r.points.length })),
    fig(t("js-lunar-fig-lowest-point", "Lowest at a point"), avail.length ? pct(Math.min(...avail)) : t("js-lunar-not-stated", "not stated")));
  const tot = {};
  for (const p of r.points) for (const [k, c] of p.reasons) tot[k] = (tot[k] || 0) + (c ?? 1);
  $("ls-reasons").replaceChildren(...Object.entries(tot).sort((a, b) => b[1] - a[1]).map(([k, c]) => el("li", {}, el("b", {}, String(c)), " ", t("js-lunar-point-epochs-reason", "point-epochs: { $reason }", { reason: Object.hasOwn(REASONS, k) ? REASONS[k] : k }))));
}

function drawTable(r) {
  $("ls-th-corr").textContent = t("js-lunar-th-corrected", "Corrected error, { $n } %", { n: r.percentile ?? "?" });
  const rows = r.points.slice().sort((a, b) => (a.distKm ?? 1e9) - (b.distKm ?? 1e9));
  $("ls-points").tBodies[0].replaceChildren(...rows.map((p) => el("tr", {}, el("td", {}, p.lat.toFixed(2)), el("td", {}, p.lon.toFixed(2)), el("td", {}, f1(p.distKm)), el("td", {}, metres(p.corrected)), el("td", {}, metres(p.uncorrected)), el("td", {}, pct(p.availability)), el("td", {}, pct(p.coverage)), el("td", {}, metres(p.hplMedian)))));
  $("ls-tab-n").textContent = t("js-lunar-table-count", "{ $n } points, nearest the station first.", { n: rows.length });
}

function kv(box, entries, units) {
  box.replaceChildren(...entries.map(([k, v]) => el("div", {}, el("dt", {}, k), el("dd", {}, typeof v === "number" ? `${v}${units[k] ? ` ${units[k]}` : ""}` : String(v)))));
}
function flatten(o, pre = "", out = [], depth = 0) {
  for (const [k, v] of Object.entries(o || {})) {
    if (out.length >= 80) break;
    if (typeof v === "number" || typeof v === "boolean" || (typeof v === "string" && v.length <= 200)) out.push([pre + k, v]);
    else if (v && typeof v === "object" && !Array.isArray(v) && depth < 3) flatten(v, `${pre}${k}.`, out, depth + 1);
  }
  return out;
}
function drawMore(r) {
  $("ls-note").textContent = r.note ? r.note : r.noteWithheld ? t("js-lunar-note-withheld", "The file's own statement names a programme or an agency, so this page does not show it; the statement at the top of the page applies.") : t("js-lunar-note-none", "The file states no note.");
  kv($("ls-inputs-echo"), r.inputs, r.units);
  kv($("ls-errmodel"), flatten(r.errorModel), r.units);
  kv($("ls-budget"), flatten(r.budget), r.units);
}

// ---------------------------------------------------------------- page
$("ls-copy").addEventListener("click", async () => {
  try { await navigator.clipboard.writeText(location.href); $("ls-copy-out").textContent = t("js-lunar-link-copied", "Link copied."); } catch { $("ls-copy-out").textContent = t("js-lunar-copy-address", "Copy the address from the address bar."); }
});
$("ls-save").addEventListener("click", () => {
  if (!raw) return;
  const a = el("a", { href: URL.createObjectURL(new Blob([raw], { type: "application/json" })), download: `${KIND}.result.json` });
  document.body.append(a); a.click(); a.remove();
});
$("btn-theme").addEventListener("click", () => {
  const root = document.documentElement;
  const dark = root.dataset.theme ? root.dataset.theme === "dark" : matchMedia("(prefers-color-scheme: dark)").matches;
  root.dataset.theme = dark ? "light" : "dark";
  try { localStorage.setItem("kshana-theme", root.dataset.theme); } catch { /* storage blocked */ }
});
for (const a of document.querySelectorAll('a[href="lunar/#about"]')) a.addEventListener("click", (ev) => { ev.preventDefault(); $("about").scrollIntoView({ behavior: "smooth" }); $("ls-about-h").setAttribute("tabindex", "-1"); $("ls-about-h").focus({ preventScroll: true }); });

(async () => {
  try { const res = await fetch(SCENARIO_FILE); if (res.ok) toml = await res.text(); } catch { /* stated below */ }
  if (!toml) { $("ls-inputs-note").textContent = t("js-lunar-no-scenario-note", "This site has no { $file } yet (it arrives with the 0.36 engine), so a run here is not possible; open a result file instead.", { file: SCENARIO_FILE.replace(/^scenarios\//, "") }); $("ls-run").disabled = true; $("ls-inputs-fs").disabled = true; }
  drawInputs();
  await load();
})();
