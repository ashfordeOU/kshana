// SPDX-License-Identifier: Apache-2.0
import init, { run, summary, chart_svg, version } from "./pkg/kshana.js";
import { encodeFragment, decodeFragment, readScalar, patchScalar } from "./share.mjs";
import { chartFilename, svgSize, svgBlob, triggerDownload, svgToPngBlob } from "./chartdl.mjs";
import { fomDeltas } from "./compare.mjs";
import { attachChartHover } from "./hover.mjs";

// Scenario catalogue: file in ./scenarios/ (copied from the repo at build) and a
// friendly label. The first entry is also embedded below so the page works on
// first paint and offline.
// Each: [file, dropdown label, card title, one-line question the scenario answers].
const SCENARIOS = [
  ["clock-holdover.toml", "Clock holdover — chip-scale vs optical clock",
    "Clock holdover", "How long can a clock keep time after GNSS drops out?"],
  ["imu-deadreckoning.toml", "Inertial dead-reckoning — cold-atom vs nav-grade",
    "Inertial dead-reckoning", "How far does position drift coasting on an IMU alone?"],
  ["timetransfer.toml", "Time transfer — optical vs RF link",
    "Time transfer", "How tightly can two sites stay synchronised over a link?"],
  ["hybrid-pnt.toml", "Hybrid PNT — combined clock + inertial suite",
    "Hybrid PNT", "What does a combined clock + inertial suite buy you?"],
  ["orbit-gnss-challenged.toml", "GNSS availability from orbital geometry",
    "GNSS availability", "When is a fix even possible from the satellite geometry?"],
  ["orbit-sgp4-gps.toml", "SGP4 GPS constellation — real two-line elements",
    "SGP4 orbits", "How does a real GPS-like constellation propagate over a day?"],
  ["fusion-pnt.toml", "Joint sensor fusion — combined Kalman PNT",
    "Sensor fusion", "What does a single joint estimator buy across clock + position?"],
  ["gnss-ins.toml", "GNSS/INS fusion — loosely-coupled error-state EKF",
    "GNSS/INS fusion", "How well does an aided inertial navigator coast through a GNSS outage?"],
  ["integrity-raim.toml", "GNSS integrity (RAIM) — HPL/VPL availability",
    "RAIM integrity", "Does the geometry meet the alert limits (HPL / VPL)?"],
  ["spoof-attack.toml", "Spoofing attack — clock-aided detection",
    "Spoof detection", "Is a ramping time-spoof caught before it reaches spec?"],
];

// Embedded default so the very first run needs no network fetch.
const DEFAULT_TOML = `# Kshana reference scenario: 2 h run, 10 min GNSS sync then ~1.8 h denied.
seed = 42
threshold_ns = 20.0

[time]
step_s = 10.0
duration_s = 7200.0

[gnss]
windows = [
  { t0 = 0.0,    t1 = 600.0,  state = "nominal" },
  { t0 = 600.0,  t1 = 7200.0, state = "denied" },
]

[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15"
y0   = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0

[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA.45s chip-scale atomic clock datasheet sigma_y(1s)=3e-10"
y0   = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
`;

const el = (id) => document.getElementById(id);
const statusEl = el("status");
const runBtn = el("run");
const shareBtn = el("share");
const tomlEl = el("toml");
const selectEl = el("scenario");
const presetsEl = el("presets");
const guidedEl = el("guided");
const resultsEl = document.querySelector(".results");
const errorEl = el("error");

let chartUrl = null;
// Latest run's chart SVGs + a snapshot of the latest run, for the A/B compare.
let lastHoldoverSvg = null;
let lastAllanSvg = null;
let lastRun = null;
let compareA = null;
let compareUrls = [];

function showError(message) {
  errorEl.textContent = message;
  errorEl.hidden = false;
  resultsEl.hidden = true;
}

function clearError() {
  errorEl.hidden = true;
  errorEl.textContent = "";
}

// Build the per-chart download toolbar. The charts are self-describing SVGs, so
// "SVG" hands back the faithful, scalable original and "PNG" rasterises that same
// image (2x for crisp slides/docs). The buttons are rebuilt on every render so
// they always reference the latest chart and its provenance.
function mountChartTools(toolsId, svgText, base, meta) {
  const host = el(toolsId);
  if (!host) return;
  host.replaceChildren();
  const label = document.createElement("span");
  label.className = "chart-dl-label";
  label.textContent = "Download";
  host.append(label);

  const mkBtn = (text, title, onClick) => {
    const b = document.createElement("button");
    b.type = "button";
    b.className = "chart-dl";
    b.textContent = text;
    b.title = title;
    b.addEventListener("click", onClick);
    host.append(b);
    return b;
  };

  mkBtn("SVG", "Download the vector chart (scales without blur; includes title and provenance)", () => {
    triggerDownload(svgBlob(svgText), chartFilename(base, meta, "svg"));
  });

  const pngBtn = mkBtn("PNG", "Download a high-resolution bitmap for slides and documents", async () => {
    pngBtn.disabled = true;
    pngBtn.textContent = "PNG…";
    try {
      const { w, h } = svgSize(svgText);
      const blob = await svgToPngBlob(svgText, w, h, 2);
      triggerDownload(blob, chartFilename(base, meta, "png"));
    } catch (e) {
      showError("PNG export failed: " + (e && e.message ? e.message : e));
    } finally {
      pngBtn.disabled = false;
      pngBtn.textContent = "PNG";
    }
  });

  host.hidden = false;
}

// Render the engine-generated SVG as an <img>. SVG loaded via <img> cannot run
// script, so even a hand-crafted scenario string cannot inject behaviour here.
function renderChart(svgText, result) {
  lastHoldoverSvg = svgText;
  if (chartUrl) URL.revokeObjectURL(chartUrl);
  chartUrl = URL.createObjectURL(new Blob([svgText], { type: "image/svg+xml" }));
  const chart = el("chart");
  let img = chart.querySelector("img");
  if (!img) {
    img = document.createElement("img");
    img.alt = "Result chart";
    chart.replaceChildren(img);
  }
  img.src = chartUrl;
  const meta = result ? { ver: result.engine_version, hash: result.scenario_hash } : null;
  mountChartTools("chart-tools", svgText, "holdover", meta);
}

let adevUrl = null;

// Build a log-log Allan-deviation chart (SVG string) from one or two named
// adev_curve arrays [{tau_s, adev, n_samples}]. Pure data -> geometry; rendered
// via a blob <img> like the engine chart, so no markup is injected into the DOM.
function adevSvg(curves, meta) {
  const pts = curves.flatMap((c) => c.curve);
  const taus = pts.map((p) => p.tau_s).filter((v) => v > 0);
  const advs = pts.map((p) => p.adev).filter((v) => v > 0);
  if (taus.length < 2 || advs.length < 2) return null;
  // Title + subtitle band at top (mt) and an x-axis-label + provenance band at
  // bottom (mb) so a downloaded/saved image is self-describing.
  const W = 760, H = 360, ml = 66, mr = 18, mt = 50, mb = 60;
  const x0 = Math.log10(Math.min(...taus)), x1 = Math.log10(Math.max(...taus));
  const y0 = Math.log10(Math.min(...advs)), y1 = Math.log10(Math.max(...advs));
  const px = (t) => ml + ((Math.log10(t) - x0) / (x1 - x0 || 1)) * (W - ml - mr);
  const py = (a) => mt + (1 - (Math.log10(a) - y0) / (y1 - y0 || 1)) * (H - mt - mb);
  const colors = ["#e0bd84", "#d2925e"];
  let s = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" font-family="system-ui,sans-serif" font-size="11">`;
  s += `<rect width="${W}" height="${H}" fill="#0c0b08"/>`;
  // Baked title + subtitle (so the saved image carries its own caption).
  s += `<text x="${ml}" y="22" font-size="15" font-weight="bold" fill="#bcb3a3">Clock stability (overlapping Allan deviation)</text>`;
  s += `<text x="${ml}" y="40" fill="#8c8273">Lower is better &#8212; fractional-frequency stability &#963;&#7464;(&#964;) vs averaging time</text>`;
  // Decade gridlines + labels. Loop only over decades *inside* the data range
  // (ceil(min)..floor(max)) so no label lands outside the plot and collides with
  // the opposite axis; anchor the edge x-labels inward so they clear the y-axis.
  for (let e = Math.ceil(x0); e <= Math.floor(x1); e++) {
    const x = px(10 ** e);
    s += `<line x1="${x}" y1="${mt}" x2="${x}" y2="${H - mb}" stroke="#262019"/>`;
    const anchor = x < ml + 16 ? "start" : x > W - mr - 16 ? "end" : "middle";
    const tx = anchor === "start" ? ml : anchor === "end" ? W - mr : x;
    s += `<text x="${tx}" y="${H - mb + 18}" text-anchor="${anchor}" fill="#8c8273">10^${e}s</text>`;
  }
  for (let e = Math.ceil(y0); e <= Math.floor(y1); e++) {
    const y = py(10 ** e);
    s += `<line x1="${ml}" y1="${y}" x2="${W - mr}" y2="${y}" stroke="#262019"/>`;
    s += `<text x="${ml - 9}" y="${y + 4}" text-anchor="end" fill="#8c8273">10^${e}</text>`;
  }
  // Axis titles, clear of the tick labels.
  s += `<text x="${ml + (W - ml - mr) / 2}" y="${H - 28}" text-anchor="middle" fill="#8c8273">averaging time &#964; (s)</text>`;
  // Baked provenance footer — version + scenario hash + source, for saved images.
  const prov = `Kshana${meta && meta.ver ? " v" + meta.ver : ""}${meta && meta.hash ? " · scenario " + meta.hash.slice(0, 12) : ""} · kshana.dev`;
  s += `<text x="${W - mr}" y="${H - 8}" text-anchor="end" fill="#62594b" font-size="10">${prov}</text>`;
  s += `<text x="16" y="${mt + (H - mt - mb) / 2}" text-anchor="middle" fill="#8c8273" transform="rotate(-90 16 ${mt + (H - mt - mb) / 2})">&#963;&#7464;(&#964;)</text>`;
  curves.forEach((c, i) => {
    const valid = c.curve.filter((p) => p.tau_s > 0 && p.adev > 0);
    if (!valid.length) return;
    const poly = valid.map((p) => `${px(p.tau_s).toFixed(1)},${py(p.adev).toFixed(1)}`).join(" ");
    const col = colors[i % colors.length];
    s += `<polyline points="${poly}" fill="none" stroke="${col}" stroke-width="2"/>`;
    valid.forEach((p) => { s += `<circle cx="${px(p.tau_s).toFixed(1)}" cy="${py(p.adev).toFixed(1)}" r="2.5" fill="${col}"/>`; });
    s += `<text x="${W - mr - 4}" y="${mt + 14 + i * 16}" text-anchor="end" fill="${col}" font-weight="600">${c.label}</text>`;
  });
  s += `</svg>`;
  return s;
}

function renderAdev(result) {
  const wrap = el("adev-wrap");
  const curves = [];
  if (result && result.quantum && Array.isArray(result.quantum.adev_curve) && result.quantum.adev_curve.length)
    curves.push({ label: result.quantum.spec ? result.quantum.spec.id : "quantum", curve: result.quantum.adev_curve });
  if (result && result.classical && Array.isArray(result.classical.adev_curve) && result.classical.adev_curve.length)
    curves.push({ label: result.classical.spec ? result.classical.spec.id : "classical", curve: result.classical.adev_curve });
  const meta = result ? { ver: result.engine_version, hash: result.scenario_hash } : null;
  const svg = curves.length ? adevSvg(curves, meta) : null;
  lastAllanSvg = svg;
  if (!svg) { wrap.hidden = true; attachChartHover("adev", { fracs: [] }); return; }
  if (adevUrl) URL.revokeObjectURL(adevUrl);
  adevUrl = URL.createObjectURL(new Blob([svg], { type: "image/svg+xml" }));
  const host = el("adev");
  let img = host.querySelector("img");
  if (!img) { img = document.createElement("img"); img.alt = "Allan deviation chart"; host.replaceChildren(img); }
  img.src = adevUrl;
  mountChartTools("adev-tools", svg, "allan", meta);
  attachChartHover("adev", adevHoverModel(curves));
  wrap.hidden = false;
}

// Build the hover model for the Allan chart: the plot-x fraction of each τ sample
// (log scale, matching adevSvg's geometry) and a tooltip showing τ and each
// clock's σ_y(τ). The geometry constants mirror adevSvg (W=760, ml=66, mr=18).
function adevHoverModel(curves) {
  const all = curves.flatMap((c) => c.curve).filter((p) => p.tau_s > 0 && p.adev > 0).map((p) => p.tau_s);
  if (all.length < 2) return { fracs: [] };
  const x0 = Math.log10(Math.min(...all));
  const x1 = Math.log10(Math.max(...all));
  const span = x1 - x0 || 1;
  const taus = curves[0].curve.filter((p) => p.tau_s > 0 && p.adev > 0).map((p) => p.tau_s);
  const fracs = taus.map((t) => (Math.log10(t) - x0) / span);
  const fmtTau = (t) => (t >= 1e4 ? t.toExponential(1) : String(Math.round(t)));
  const label = (i) => {
    const t = taus[i];
    const parts = curves.map((c) => {
      const p = c.curve.find((q) => q.tau_s === t);
      return p ? `${c.label} ${p.adev.toExponential(2)}` : null;
    }).filter(Boolean);
    return `τ=${fmtTau(t)} s · ${parts.join(" · ")}`;
  };
  return { wIntrinsic: 760, ml: 66, mr: 18, fracs, label };
}

// Render the per-clock Kalman filter-consistency health cards (NIS/NEES vs their
// 95% χ² bands). Every value is inserted as textContent, never innerHTML.
function renderFilterHealth(result) {
  const wrap = el("health-wrap");
  const host = el("health-cards");
  if (!wrap || !host) return;
  const clocks = [];
  for (const key of ["quantum", "classical"]) {
    const c = result && result[key];
    if (c && c.filter_health) {
      const label = c.spec && c.spec.id ? c.spec.id : key;
      clocks.push([label, c.filter_health]);
    }
  }
  if (!clocks.length) { wrap.hidden = true; return; }
  host.replaceChildren();
  for (const [label, h] of clocks) {
    const card = document.createElement("div");
    card.className = "health-card" + (h.consistent ? " ok" : " warn");

    const head = document.createElement("div");
    head.className = "health-head";
    const name = document.createElement("span");
    name.className = "health-name";
    name.textContent = label;
    const badge = document.createElement("span");
    badge.className = "health-badge";
    badge.textContent = h.consistent ? "✓ consistent" : "⚠ check tuning";
    head.append(name, badge);

    const fmt = (x) => (typeof x === "number" ? x.toFixed(3) : "—");
    const nis = document.createElement("p");
    nis.className = "health-stat";
    nis.textContent = `NIS ${fmt(h.nis_mean)}  (95% band ${fmt(h.nis_chi2_lower_95)}–${fmt(h.nis_chi2_upper_95)}, target 1.0)`;
    const nees = document.createElement("p");
    nees.className = "health-stat";
    nees.textContent = `NEES ${fmt(h.nees_mean)}  (95% band ${fmt(h.nees_chi2_lower_95)}–${fmt(h.nees_chi2_upper_95)}, target 2.0)`;

    card.append(head, nis, nees);
    host.append(card);
  }
  wrap.hidden = false;
}

// --- A/B compare ----------------------------------------------------------
// Pin the current run as baseline A; the next run becomes B and the two are
// shown side by side with a figure-of-merit delta table. Every value goes in via
// textContent and every chart via a blob <img>, so nothing from a scenario
// string is ever injected into the DOM as markup.

function currentScenarioLabel() {
  const file = selectEl ? selectEl.value : "";
  const entry = SCENARIOS.find((s) => s[0] === file);
  return entry ? entry[2] : "Scenario";
}

// Compact, human number: plain for mid-range values, exponential at the extremes.
function fmtVal(x) {
  if (typeof x !== "number" || !isFinite(x)) return "—";
  if (x !== 0 && (Math.abs(x) >= 1e4 || Math.abs(x) < 1e-2)) return x.toExponential(2);
  return String(Math.round(x * 1000) / 1000);
}

function chartImg(svgText, alt) {
  const url = URL.createObjectURL(svgBlob(svgText));
  compareUrls.push(url);
  const img = document.createElement("img");
  img.alt = alt;
  img.src = url;
  return img;
}

function buildCompareTable(rows) {
  const table = document.createElement("table");
  table.className = "compare-table";
  const head = document.createElement("tr");
  for (const h of ["Clock", "Metric", "A", "B", "Δ (B−A)"]) {
    const th = document.createElement("th");
    th.textContent = h;
    head.append(th);
  }
  table.append(head);
  for (const r of rows) {
    const tr = document.createElement("tr");
    for (const c of [r.clockLabel, r.unit ? `${r.label} (${r.unit})` : r.label, fmtVal(r.a), fmtVal(r.b)]) {
      const td = document.createElement("td");
      td.textContent = c;
      tr.append(td);
    }
    const dtd = document.createElement("td");
    const sign = r.delta > 0 ? "+" : "";
    const pct = r.pct === null ? "" : ` (${sign}${Math.round(r.pct)}%)`;
    dtd.textContent = `${sign}${fmtVal(r.delta)}${pct}`;
    dtd.className = "cmp-delta " + (r.better === "b" ? "cmp-better" : r.better === "a" ? "cmp-worse" : "cmp-eq");
    tr.append(dtd);
    table.append(tr);
  }
  return table;
}

function renderCompare(A, B) {
  const wrap = el("compare-wrap");
  if (!wrap) return;
  compareUrls.forEach(URL.revokeObjectURL);
  compareUrls = [];
  el("compare-table").replaceChildren(buildCompareTable(fomDeltas(A.result, B.result)));
  const charts = el("compare-charts");
  charts.replaceChildren();
  for (const [tag, run] of [["A", A], ["B", B]]) {
    const col = document.createElement("div");
    col.className = "compare-col";
    const title = document.createElement("p");
    title.className = "compare-col-title";
    title.textContent = `${tag}: ${run.label}`;
    col.append(title);
    if (run.holdoverSvg) col.append(chartImg(run.holdoverSvg, `${tag} holdover chart`));
    if (run.allanSvg) col.append(chartImg(run.allanSvg, `${tag} stability chart`));
    charts.append(col);
  }
  // Compare mode replaces the single-run charts to avoid showing B twice.
  el("chart").hidden = true;
  el("chart-tools").hidden = true;
  el("adev-wrap").hidden = true;
  wrap.hidden = false;
}

// Return to the single-run chart view (used when not comparing, or on clear).
function exitCompareView() {
  const wrap = el("compare-wrap");
  if (wrap) wrap.hidden = true;
  el("chart").hidden = false;
  el("chart-tools").hidden = false;
  el("adev-wrap").hidden = !lastAllanSvg;
}

function pinForCompare() {
  if (!lastRun) return;
  compareA = lastRun;
  updateCompareControls();
  statusEl.textContent = `Pinned A: ${compareA.label}. Run another scenario to compare.`;
  statusEl.classList.add("ran");
}

function clearCompare() {
  compareA = null;
  exitCompareView();
  updateCompareControls();
}

function updateCompareControls() {
  const host = el("compare-controls");
  if (!host) return;
  host.replaceChildren();
  if (!resultsEl || resultsEl.hidden) return;
  if (!compareA) {
    const b = document.createElement("button");
    b.type = "button";
    b.className = "chart-dl";
    b.textContent = "⊕ Pin for compare";
    b.title = "Pin this run as baseline A, then run another scenario to compare A vs B";
    b.addEventListener("click", pinForCompare);
    host.append(b);
  } else {
    const chip = document.createElement("span");
    chip.className = "compare-chip";
    chip.textContent = `A: ${compareA.label}`;
    const x = document.createElement("button");
    x.type = "button";
    x.className = "chart-dl";
    x.textContent = "✕ clear compare";
    x.title = "Stop comparing and return to the single-run view";
    x.addEventListener("click", clearCompare);
    host.append(chip, x);
  }
}

let runCount = 0;

// Re-trigger the CSS flash animation on a node (remove, force reflow, re-add).
function flash(node) {
  node.classList.remove("updated");
  void node.offsetWidth;
  node.classList.add("updated");
}

function runScenario() {
  clearError();
  const src = tomlEl.value;
  // The engine runs synchronously and in well under a frame, so there is no need
  // to defer the call (deferring via requestAnimationFrame would also wedge the
  // UI if the tab is backgrounded, since rAF does not fire there). The button's
  // :active state gives the press feedback; the status line and the result flash
  // below confirm completion — so every click is visible even when the output is
  // byte-for-byte identical (the engine is deterministic).
  try {
    el("summary").textContent = summary(src);
    const result = JSON.parse(run(src));
    renderChart(chart_svg(src), result);
    renderAdev(result);
    renderFilterHealth(result);
    el("json").textContent = JSON.stringify(result, null, 2);
    resultsEl.hidden = false;
    lastRun = { label: currentScenarioLabel(), result, holdoverSvg: lastHoldoverSvg, allanSvg: lastAllanSvg };
    if (compareA) renderCompare(compareA, lastRun);
    else exitCompareView();
    updateCompareControls();
    runCount += 1;
    const t = new Date().toLocaleTimeString();
    statusEl.textContent = `Ran locally at ${t} — run ${runCount}.`;
    statusEl.classList.add("ran");
    flash(el("summary"));
  } catch (e) {
    showError(String(e && e.message ? e.message : e));
    statusEl.textContent = "Run failed — see the error below.";
    statusEl.classList.remove("ran");
  }
}

// --- Guided sliders -------------------------------------------------------
// Reflect the editor's universal top-level knobs (seed, threshold_ns) into the
// sliders, and write slider changes back into the editor TOML. These keys exist
// at the top level of every bundled scenario, so the guided panel works for all
// of them without parsing the whole document.
const KNOBS = [
  { key: "seed", input: "k-seed", out: "k-seed-out", parse: (v) => parseInt(v, 10) },
  { key: "threshold_ns", input: "k-thresh", out: "k-thresh-out", parse: (v) => parseFloat(v) },
];

function clamp(n, lo, hi) {
  return Math.min(hi, Math.max(lo, n));
}

// Set sliders from the current editor TOML. Hides the panel only if neither key
// is present (it always is for bundled scenarios, but a hand-pasted scenario
// might omit one).
function syncGuided() {
  let any = false;
  for (const k of KNOBS) {
    const input = el(k.input);
    const raw = readScalar(tomlEl.value, k.key);
    const present = raw !== null && Number.isFinite(k.parse(raw));
    input.disabled = !present;
    el(k.out).textContent = present ? raw : "—";
    if (present) {
      any = true;
      input.value = String(clamp(k.parse(raw), Number(input.min), Number(input.max)));
    }
  }
  guidedEl.hidden = !any;
}

function onKnobInput(k) {
  const input = el(k.input);
  const value = k.parse(input.value);
  el(k.out).textContent = String(value);
  tomlEl.value = patchScalar(tomlEl.value, k.key, value);
  runScenario();
}

// --- One-click preset cards ----------------------------------------------
function buildPresets() {
  for (const [file, , title, question] of SCENARIOS) {
    const card = document.createElement("button");
    card.type = "button";
    card.className = "preset";
    card.dataset.file = file;
    card.innerHTML = `<span class="preset-title"></span><span class="preset-q"></span>`;
    card.querySelector(".preset-title").textContent = title;
    card.querySelector(".preset-q").textContent = question;
    card.addEventListener("click", () => {
      selectEl.value = file;
      loadScenario(file);
    });
    presetsEl.appendChild(card);
  }
}

function markActivePreset(file) {
  for (const c of presetsEl.children) {
    c.classList.toggle("is-active", c.dataset.file === file);
  }
}

// --- Shareable link -------------------------------------------------------
async function copyShareLink() {
  const url = location.origin + location.pathname + encodeFragment(tomlEl.value);
  // Reflect it in the address bar so a reload / bookmark reproduces the run.
  history.replaceState(null, "", url);
  try {
    await navigator.clipboard.writeText(url);
    shareBtn.textContent = "Link copied ✓";
  } catch {
    shareBtn.textContent = "Copied to address bar";
  }
  setTimeout(() => (shareBtn.textContent = "Copy share link"), 1800);
}

async function loadScenario(file) {
  try {
    const res = await fetch(`scenarios/${file}`, { cache: "no-store" });
    if (!res.ok) throw new Error(String(res.status));
    tomlEl.value = await res.text();
    markActivePreset(file);
    syncGuided();
    runScenario();
  } catch {
    // No server / file missing: keep whatever is already in the editor.
    statusEl.textContent = `Could not load ${file}; edit the panel and run.`;
  }
}

// --- Capabilities (data-driven from capabilities.json) -------------------
// Product content: confident feature cards + the standards the engine speaks.
// Progressive enhancement — if the fetch fails the page still works. Every data
// field is inserted as textContent (never innerHTML) so the source can't inject
// markup.
function knownScenario(file) {
  return SCENARIOS.some((s) => s[0] === file);
}

async function renderCapabilities() {
  let data;
  try {
    const res = await fetch("capabilities.json", { cache: "no-store" });
    if (!res.ok) return;
    data = await res.json();
  } catch {
    return;
  }

  // Capability feature cards.
  const cards = el("capability-cards");
  if (cards && Array.isArray(data.capabilities)) {
    cards.replaceChildren();
    for (const c of data.capabilities) {
      const card = document.createElement("div");
      card.className = "card feat";

      const head = document.createElement("div");
      head.className = "feat-head";
      const dom = document.createElement("p");
      dom.className = "eyebrow";
      dom.textContent = c.domain;
      head.append(dom);
      if (c.run && knownScenario(c.run)) {
        const run = document.createElement("button");
        run.type = "button";
        run.className = "run";
        run.textContent = "▸ run";
        run.title = `Load and run ${c.name} in the playground`;
        run.addEventListener("click", () => {
          selectEl.value = c.run;
          loadScenario(c.run);
          document.getElementById("playground").scrollIntoView({ behavior: "smooth" });
        });
        head.append(run);
      }

      const h = document.createElement("h3");
      h.textContent = c.name;

      const p = document.createElement("p");
      p.textContent = c.summary;

      card.append(head, h, p);
      if (c.proof) {
        const proof = document.createElement("span");
        proof.className = "proof";
        proof.textContent = `✓ ${c.proof}`;
        card.append(proof);
      }
      cards.append(card);
    }
  }

  // Standards the engine speaks (no status labels — confident support list).
  const list = el("standards-list");
  if (list && Array.isArray(data.standards)) {
    list.replaceChildren();
    for (const s of data.standards) {
      const row = document.createElement("div");
      row.className = "std-row";
      const n = document.createElement("div");
      n.className = "n";
      n.textContent = s.name;
      if (s.note) {
        const note = document.createElement("small");
        note.textContent = s.note;
        n.append(note);
      }
      row.append(n);
      if (s.proof) {
        const chip = document.createElement("span");
        chip.className = "pill validated";
        chip.textContent = "validated";
        row.append(chip);
      }
      list.append(row);
    }
  }
}

async function main() {
  renderCapabilities();
  for (const [file, label] of SCENARIOS) {
    const opt = document.createElement("option");
    opt.value = file;
    opt.textContent = label;
    selectEl.appendChild(opt);
  }
  buildPresets();

  // A shared link (scenario in the URL fragment) wins over the default scenario.
  const shared = decodeFragment(location.hash);
  tomlEl.value = shared || DEFAULT_TOML;

  try {
    await init();
    const v = version();
    el("version").textContent = v;
    const chip = el("ver-chip");
    if (chip) chip.textContent = `v${v}`;
    statusEl.textContent = "Ready — runs locally in your browser.";
    runBtn.disabled = false;
    shareBtn.disabled = false;
  } catch (e) {
    statusEl.textContent = "";
    showError(
      "The WebAssembly engine failed to load. Serve this folder over HTTP " +
        "(e.g. `python3 -m http.server`) rather than opening the file directly.\n\n" +
        String(e),
    );
    return;
  }

  runBtn.addEventListener("click", runScenario);
  shareBtn.addEventListener("click", copyShareLink);
  selectEl.addEventListener("change", () => loadScenario(selectEl.value));
  for (const k of KNOBS) el(k.input).addEventListener("input", () => onKnobInput(k));

  if (shared) {
    el("advanced").open = true; // a shared run may be hand-tuned: show the source
    statusEl.textContent = "Loaded a shared scenario from the link.";
  }
  syncGuided();
  runScenario(); // show a result immediately
}

main();
