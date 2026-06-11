// SPDX-License-Identifier: Apache-2.0
import init, { run, summary, chart_svg, version } from "./pkg/kshana.js";
import { encodeFragment, decodeFragment, patchScalar } from "./share.mjs";
import { chartFilename, svgSize, svgBlob, triggerDownload, svgToPngBlob } from "./chartdl.mjs";
import { attachChartHover, parsePolylineXs } from "./hover.mjs";
import { knobsForToml, readKnob, patchSectionScalar } from "./guided.mjs";
import { orbit3dSvg } from "./orbit3d.mjs";
import { tabModel, buildFomRows } from "./tabs.mjs";
import { sweepValues, sweepToml, sweepMetrics, sweepCurveSvg, SWEEP_GEOM, MAX_SWEEP } from "./sweep.mjs";
import { overlayRows, overlaySeriesSvg, OVERLAY_COLORS } from "./overlay.mjs";
import { isEmbed, embedConfig, embedClassList } from "./embed.mjs";
import { buildReportHtml, reportFilename } from "./report.mjs";
import { TOUR_STEPS, clampStep, placeTooltip } from "./tour.mjs";

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
  ["ephemeris.toml", "Ephemeris & ground track — ISS state, frames & Doppler",
    "Ground track", "Where is the satellite, and when does it pass overhead?"],
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
const guidedKnobsEl = el("guided-knobs");
const resultsEl = document.querySelector(".results");
const errorEl = el("error");

let chartUrl = null;
// Latest run's chart SVGs + a snapshot of the latest run, for the overlay compare.
let lastHoldoverSvg = null;
let lastAllanSvg = null;
let lastOrbit3dSvg = null;
let lastSweepSvg = null;
let lastRun = null;
// Up to four pinned runs for the multi-run overlay (generalises the old single
// `compareA`).
let compareRuns = [];
const MAX_COMPARE = 4;
let compareUrls = [];
let orbit3dUrl = null;
let sweepChartUrl = null;
// The currently-selected output tab id; restored across re-runs when possible.
let activeTab = "fom";

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
  attachChartHover("chart", scenarioHoverModel(svgText, result));
}

// Build the hover model for a Rust-generated scenario chart: snap to the data
// polyline's sample x-positions (parsed from the SVG, so no per-chart geometry is
// needed) and show t plus each suite's value at that sample. Returns null for
// charts without a quantum/classical time series (e.g. RAIM, sweep) — those get
// no overlay. The tooltip value is read from whichever series field the chart
// plots, matched to its unit, so the read-out matches the curve.
function scenarioHoverModel(svgText, result) {
  const q = result && result.quantum && result.quantum.series;
  const c = result && result.classical && result.classical.series;
  if (!Array.isArray(q) || !Array.isArray(c) || q.length < 2) return null;
  const xs = parsePolylineXs(svgText);
  if (xs.length < 2) return null;
  const w = parseFloat((svgText.match(/width="(\d+(?:\.\d+)?)"/) || [])[1]) || 820;
  const n = Math.min(xs.length, q.length, c.length);

  // Read the plotted value + unit from whichever field the series carries.
  const val = (s) => {
    if (!s) return null;
    if ("error_ns" in s) return `${fmtVal(s.error_ns)} ns`;
    if ("error_m" in s) return `${fmtVal(s.error_m)} m`;
    if ("sync_error_s" in s) return `${fmtVal(s.sync_error_s * 1e12)} ps`;
    if ("timing_ns" in s && "position_m" in s) return `${fmtVal(s.timing_ns)} ns / ${fmtVal(s.position_m)} m`;
    return null;
  };
  if (!val(q[0]) && !val(c[0])) return null; // unknown series shape -> no hover
  const qlabel = result.quantum.spec ? result.quantum.spec.id : "quantum";
  const clabel = result.classical.spec ? result.classical.spec.id : "classical";
  const label = (i) => {
    const t = (c[i] && c[i].t) ?? (q[i] && q[i].t) ?? 0;
    return `t=${Math.round(t)} s · ${qlabel} ${val(q[i]) ?? "—"} · ${clabel} ${val(c[i]) ?? "—"}`;
  };
  return { wIntrinsic: w, xs: xs.slice(0, n), label };
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

// --- Tabbed output --------------------------------------------------------
// The output panel is split into tabs (FoM / time series / stability / 3D orbit
// / sweep). Which tabs appear is decided purely by tabs.mjs from the result; the
// button row and panel show/hide are built here. Every value goes in via
// textContent and every chart via a blob <img>, so nothing from a scenario
// string is ever injected into the DOM as markup.

const TAB_PANEL = {
  fom: "tab-fom",
  timeseries: "tab-timeseries",
  stability: "tab-stability",
  orbit3d: "tab-orbit3d",
  sweep: "tab-sweep",
};

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

// The single-run figure-of-merit table, built with the same textContent-only
// pattern as the overlay table (no innerHTML for any scenario-derived string).
function buildFomTable(result) {
  const rows = buildFomRows(result);
  const table = document.createElement("table");
  table.className = "compare-table";
  const head = document.createElement("tr");
  for (const h of ["Clock", "Metric", "Value"]) {
    const th = document.createElement("th");
    th.textContent = h;
    head.append(th);
  }
  table.append(head);
  for (const r of rows) {
    const tr = document.createElement("tr");
    const cells = [r.clockLabel, r.unit ? `${r.label} (${r.unit})` : r.label, fmtVal(r.value)];
    cells.forEach((c, i) => {
      const td = document.createElement("td");
      td.textContent = c;
      if (i === 2) td.className = "num";
      tr.append(td);
    });
    table.append(tr);
  }
  return table;
}

// Show exactly one tab panel; sync the button aria-selected state.
function selectTab(id) {
  if (!(id in TAB_PANEL)) id = "fom";
  activeTab = id;
  for (const [tabId, panelId] of Object.entries(TAB_PANEL)) {
    const panel = el(panelId);
    if (panel) panel.hidden = tabId !== id;
  }
  const row = el("tabs");
  if (row) {
    for (const b of row.children) {
      const sel = b.dataset.tab === id;
      b.setAttribute("aria-selected", sel ? "true" : "false");
    }
  }
}

// Build the tab button row from tabs.mjs's model and reveal the active panel.
// Keeps the previously-active tab if it is still available, else falls back to
// the first tab.
function mountTabs(result) {
  const row = el("tabs");
  if (!row) return;
  // Offer the Sweep tab only when this scenario is actually sweepable — it has at
  // least one tunable knob AND at least one plottable figure of merit. That keeps
  // packs with neither (and the ones whose only metric is the chart) from showing a
  // control that plots nothing.
  const canSweep = knobsForToml(tomlEl.value).length > 0 && sweepMetrics(result).length > 0;
  const model = tabModel(result, { sweep: canSweep });
  row.replaceChildren();
  const ids = model.map((t) => t.id);
  for (const t of model) {
    const b = document.createElement("button");
    b.type = "button";
    b.className = "tab-btn";
    b.setAttribute("role", "tab");
    b.dataset.tab = t.id;
    b.textContent = t.label;
    b.addEventListener("click", () => selectTab(t.id));
    row.append(b);
  }
  if (!ids.includes(activeTab)) activeTab = ids[0] || "fom";
  selectTab(activeTab);
}

// --- 3D orbit tab ---------------------------------------------------------
// Render the dependency-free orthographic orbit view from the engine's eci_track.
// Rendered via the SAME blob-<img> path as the other charts, so SVG/PNG download
// (mountChartTools) works unchanged.
function renderOrbit3d(result) {
  const host = el("orbit3d");
  if (!host) return;
  const track = result && Array.isArray(result.eci_track) ? result.eci_track : [];
  if (!track.length) {
    lastOrbit3dSvg = null;
    host.replaceChildren();
    el("orbit3d-tools").hidden = true;
    return;
  }
  const model = { trackKm: track, satsKm: [], view: { az_deg: 35, el_deg: 22 } };
  const meta = result ? { ver: result.engine_version, hash: result.scenario_hash } : null;
  const svg = orbit3dSvg(model, meta);
  lastOrbit3dSvg = svg;
  if (orbit3dUrl) URL.revokeObjectURL(orbit3dUrl);
  orbit3dUrl = URL.createObjectURL(new Blob([svg], { type: "image/svg+xml" }));
  let img = host.querySelector("img");
  if (!img) { img = document.createElement("img"); img.alt = "3D orbit view"; host.replaceChildren(img); }
  img.src = orbit3dUrl;
  mountChartTools("orbit3d-tools", svg, "orbit3d", meta);
}

// --- Multi-run overlay ----------------------------------------------------
// Pin up to four runs; they are shown together with a long-form figure-of-merit
// table (best per metric highlighted) and a multi-color overlaid timeseries.
// Generalises the proven A/B compare (compare.mjs) to N runs (overlay.mjs).

function buildOverlayTable(runs) {
  const rows = overlayRows(runs);
  const table = document.createElement("table");
  table.className = "compare-table overlay-table";
  const head = document.createElement("tr");
  const headers = ["Clock", "Metric", ...runs.map((r) => r.label)];
  headers.forEach((h, i) => {
    const th = document.createElement("th");
    th.textContent = h;
    if (i >= 2) {
      const sw = document.createElement("span");
      sw.className = "ovl-swatch";
      sw.style.background = OVERLAY_COLORS[(i - 2) % OVERLAY_COLORS.length];
      th.prepend(sw);
    }
    head.append(th);
  });
  table.append(head);
  for (const r of rows) {
    const tr = document.createElement("tr");
    const lead = [r.clockLabel, r.unit ? `${r.label} (${r.unit})` : r.label];
    for (const c of lead) {
      const td = document.createElement("td");
      td.textContent = c;
      tr.append(td);
    }
    r.values.forEach((v, i) => {
      const td = document.createElement("td");
      td.className = "num" + (i === r.best ? " cmp-better" : "");
      td.textContent = fmtVal(v);
      tr.append(td);
    });
    table.append(tr);
  }
  return table;
}

function renderOverlay(runs) {
  const wrap = el("compare-wrap");
  if (!wrap) return;
  compareUrls.forEach(URL.revokeObjectURL);
  compareUrls = [];
  el("compare-table").replaceChildren(buildOverlayTable(runs));
  const charts = el("compare-charts");
  charts.replaceChildren();
  // A single overlaid timeseries (one polyline per run) when the runs carry a
  // clock error series; otherwise per-run holdover thumbnails.
  const meta = runs[0] ? { ver: runs[0].result.engine_version, hash: runs[0].result.scenario_hash } : null;
  const overlaySvg = overlaySeriesSvg(runs, "error_ns", meta);
  const wrapCol = document.createElement("div");
  wrapCol.className = "overlay-chart";
  wrapCol.append(chartImg(overlaySvg, "Overlaid timing-error series"));
  charts.append(wrapCol);
  // Hide the tabs while overlaying (the single-run charts would duplicate the
  // last pinned run); the overlay panel takes over.
  el("tabs").hidden = true;
  for (const panelId of Object.values(TAB_PANEL)) { const p = el(panelId); if (p) p.hidden = true; }
  wrap.hidden = false;
}

// Return to the single-run tabbed view (used when not overlaying, or on clear).
function exitCompareView() {
  const wrap = el("compare-wrap");
  if (wrap) wrap.hidden = true;
  el("tabs").hidden = false;
  if (lastRun) { mountTabs(lastRun.result); } else { selectTab(activeTab); }
}

function pinForCompare() {
  if (!lastRun) return;
  if (compareRuns.length >= MAX_COMPARE) compareRuns.shift();
  compareRuns.push(lastRun);
  if (compareRuns.length >= 2) renderOverlay(compareRuns);
  updateCompareControls();
  statusEl.textContent =
    compareRuns.length < 2
      ? `Pinned ${compareRuns.length} run. Run another scenario (up to ${MAX_COMPARE}) to overlay.`
      : `Overlaying ${compareRuns.length} runs.`;
  statusEl.classList.add("ran");
}

function clearCompare() {
  compareRuns = [];
  exitCompareView();
  updateCompareControls();
}

function updateCompareControls() {
  const host = el("compare-controls");
  if (!host) return;
  host.replaceChildren();
  if (!resultsEl || resultsEl.hidden) return;
  if (compareRuns.length < MAX_COMPARE) {
    const b = document.createElement("button");
    b.type = "button";
    b.className = "chart-dl";
    b.textContent = compareRuns.length ? `⊕ Pin (${compareRuns.length}/${MAX_COMPARE})` : "⊕ Pin to compare";
    b.title = `Pin this run, then run another scenario to overlay (up to ${MAX_COMPARE})`;
    b.addEventListener("click", pinForCompare);
    host.append(b);
  }
  if (compareRuns.length) {
    const chip = document.createElement("span");
    chip.className = "compare-chip";
    chip.textContent = `${compareRuns.length} pinned`;
    const x = document.createElement("button");
    x.type = "button";
    x.className = "chart-dl";
    x.textContent = "✕ clear";
    x.title = "Stop overlaying and return to the single-run view";
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
    renderOrbit3d(result);
    el("fom-table").replaceChildren(buildFomTable(result));
    el("json").textContent = JSON.stringify(result, null, 2);
    resultsEl.hidden = false;
    // A fresh run clears any sweep result; rebuild the tab set for this result.
    lastSweepSvg = null;
    lastRun = {
      label: currentScenarioLabel(),
      result,
      toml: src,
      summary: el("summary").textContent,
      holdoverSvg: lastHoldoverSvg,
      allanSvg: lastAllanSvg,
      orbit3dSvg: lastOrbit3dSvg,
    };
    mountTabs(result);
    if (compareRuns.length >= 2) renderOverlay(compareRuns);
    else exitCompareView();
    syncSweepControls();
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
// The guided knobs adapt to the scenario: clock scenarios show seed / threshold /
// duration / step / y0-ish; orbit scenarios show seed / mask / duration / step /
// inclination. The applicable set (≤6) is resolved by guided.mjs from the editor
// TOML, and the slider DOM is generated like the preset cards (count varies). A
// slider change writes back into the editor TOML (top-level via patchScalar,
// sectioned via patchSectionScalar) and re-runs.

function clamp(n, lo, hi) {
  return Math.min(hi, Math.max(lo, n));
}

// The knob set currently mounted, keyed for slider sync; rebuilt per scenario.
let mountedKnobs = [];

// Build the guided slider DOM from the resolved knob set, then sync values.
function buildGuided() {
  mountedKnobs = knobsForToml(tomlEl.value);
  guidedKnobsEl.replaceChildren();
  for (const k of mountedKnobs) {
    const wrap = document.createElement("div");
    wrap.className = "knob";
    const label = document.createElement("label");
    const id = `k-${k.section || "top"}-${k.key}`;
    label.setAttribute("for", id);
    label.textContent = k.label + " ";
    const hint = document.createElement("span");
    hint.className = "dim";
    hint.textContent = `— ${k.hint}`;
    label.append(hint);
    const input = document.createElement("input");
    input.type = "range";
    input.id = id;
    input.min = String(k.min);
    input.max = String(k.max);
    input.step = String(k.step);
    const out = document.createElement("output");
    out.id = `${id}-out`;
    input.addEventListener("input", () => onKnobInput(k, input, out));
    wrap.append(label, input, out);
    guidedKnobsEl.append(wrap);
  }
  syncGuided();
}

// Set every mounted slider from the current editor TOML. Hides the panel if no
// knob is present (a hand-pasted scenario might omit them all).
function syncGuided() {
  let any = false;
  for (const k of mountedKnobs) {
    const id = `k-${k.section || "top"}-${k.key}`;
    const input = el(id);
    const out = el(`${id}-out`);
    if (!input) continue;
    const raw = readKnob(tomlEl.value, k);
    const present = raw !== null && Number.isFinite(k.parse(raw));
    input.disabled = !present;
    out.textContent = present ? raw : "—";
    if (present) {
      any = true;
      input.value = String(clamp(k.parse(raw), Number(input.min), Number(input.max)));
    }
  }
  guidedEl.hidden = !any;
}

function onKnobInput(k, input, out) {
  const value = k.parse(input.value);
  out.textContent = String(value);
  tomlEl.value = k.section
    ? patchSectionScalar(tomlEl.value, k.section, k.key, value)
    : patchScalar(tomlEl.value, k.key, value);
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

// --- Parameter sweep ------------------------------------------------------
// Sweep one TOML scalar across an inclusive range, running the wasm engine for
// each value and plotting one figure of merit. All purely client-side (no new
// Rust), capped at MAX_SWEEP points so the synchronous loop stays sub-frame.

// Populate the sweep knob + metric selects from the current scenario's knobs and
// the last run's result. The metric list adapts to the scenario (clock FoMs, or
// the ground-track extrema), so it is rebuilt on every run rather than once.
function syncSweepControls() {
  const knobSel = el("sweep-knob");
  const metricSel = el("sweep-metric");
  if (!knobSel || !metricSel) return;
  const knobs = knobsForToml(tomlEl.value);
  const prevKnob = knobSel.value;
  knobSel.replaceChildren();
  for (const k of knobs) {
    const opt = document.createElement("option");
    opt.value = `${k.section}::${k.key}`;
    opt.textContent = k.label;
    knobSel.append(opt);
  }
  if ([...knobSel.options].some((o) => o.value === prevKnob)) knobSel.value = prevKnob;
  const prevMetric = metricSel.value;
  metricSel.replaceChildren();
  for (const m of sweepMetrics(lastRun && lastRun.result)) {
    const opt = document.createElement("option");
    opt.value = m.id;
    opt.textContent = m.label;
    metricSel.append(opt);
  }
  if ([...metricSel.options].some((o) => o.value === prevMetric)) metricSel.value = prevMetric;
  // Seed the from/to inputs from the current knob's value if blank.
  const selected = knobs.find((k) => `${k.section}::${k.key}` === knobSel.value) || knobs[0];
  if (selected) {
    const minEl = el("sweep-min");
    const maxEl = el("sweep-max");
    if (minEl && maxEl && minEl.value === "" && maxEl.value === "") {
      const raw = readKnob(tomlEl.value, selected);
      const v = raw !== null ? selected.parse(raw) : selected.min;
      minEl.value = String(selected.min);
      maxEl.value = String(Number.isFinite(v) ? Math.max(v, selected.max) : selected.max);
    }
  }
}

function runSweep() {
  const knobSel = el("sweep-knob");
  const metricSel = el("sweep-metric");
  const status = el("sweep-status");
  if (!knobSel || !knobSel.value) { status.textContent = "No sweepable parameter."; return; }
  const [section, key] = knobSel.value.split("::");
  const metrics = sweepMetrics(lastRun && lastRun.result);
  const metric = metrics.find((m) => m.id === metricSel.value) || metrics[0];
  if (!metric) { status.textContent = "No sweepable metric for this scenario."; return; }
  const min = parseFloat(el("sweep-min").value);
  const max = parseFloat(el("sweep-max").value);
  const steps = parseInt(el("sweep-steps").value, 10);
  if (!isFinite(min) || !isFinite(max)) { status.textContent = "Enter a numeric from/to range."; return; }

  const base = tomlEl.value;
  const knob = { key, section: section || "" };
  const values = sweepValues(min, max, steps);
  status.textContent = `Sweeping ${values.length} runs…`;
  const points = [];
  try {
    for (const v of values) {
      const result = JSON.parse(run(sweepToml(base, knob, v)));
      const fom = metric.get(result);
      if (fom !== null) points.push({ x: v, y: fom });
    }
  } catch (e) {
    status.textContent = "Sweep failed — check the range.";
    showError(String(e && e.message ? e.message : e));
    return;
  }
  const knobLabel = knobSel.options[knobSel.selectedIndex].textContent;
  const metricLabel = metric.label;
  const meta = lastRun ? { ver: lastRun.result.engine_version, hash: lastRun.result.scenario_hash } : null;
  const svg = sweepCurveSvg(points, { xLabel: knobLabel, yLabel: metricLabel, title: `${metricLabel} vs ${knobLabel}` }, meta);
  lastSweepSvg = svg;
  if (sweepChartUrl) URL.revokeObjectURL(sweepChartUrl);
  sweepChartUrl = URL.createObjectURL(new Blob([svg], { type: "image/svg+xml" }));
  const host = el("sweep-chart");
  let img = host.querySelector("img");
  if (!img) { img = document.createElement("img"); img.alt = "Sweep chart"; host.replaceChildren(img); }
  img.src = sweepChartUrl;
  mountChartTools("sweep-tools", svg, "sweep", meta);
  // Snap the hover to the sweep samples (geometry mirrors the chart's margins).
  const fmtSweep = (i) => `${knobLabel} ${fmtVal(points[i].x)} · ${metricLabel} ${fmtVal(points[i].y)}`;
  const span = points.length > 1 ? points[points.length - 1].x - points[0].x : 1;
  const fracs = points.map((p) => (span ? (p.x - points[0].x) / span : 0));
  attachChartHover("sweep-chart", { wIntrinsic: SWEEP_GEOM.wIntrinsic, ml: SWEEP_GEOM.ml, mr: SWEEP_GEOM.mr, fracs, label: fmtSweep });

  if (lastRun) mountTabs(lastRun.result);
  selectTab("sweep");
  status.textContent = `Swept ${points.length} of ${values.length} runs (max ${MAX_SWEEP}).`;
}

// --- Download report ------------------------------------------------------
// Gather the current run's charts, FoM rows, summary, and scenario TOML into a
// single self-contained, offline HTML report (report.mjs escapes every
// scenario-derived string; only OUR renderer SVGs go in as raw markup).
function downloadReport() {
  if (!lastRun) return;
  const r = lastRun.result;
  const svgs = [];
  if (lastRun.holdoverSvg) svgs.push({ title: "Timing error during outage", svg: lastRun.holdoverSvg });
  if (lastRun.allanSvg) svgs.push({ title: "Clock stability (Allan deviation)", svg: lastRun.allanSvg });
  if (lastRun.orbit3dSvg) svgs.push({ title: "Orbit (ECI, orthographic)", svg: lastRun.orbit3dSvg });
  if (lastSweepSvg) svgs.push({ title: "Parameter sweep", svg: lastSweepSvg });
  const html = buildReportHtml({
    engineVersion: r.engine_version,
    scenarioHash: r.scenario_hash,
    toml: lastRun.toml,
    summaryText: lastRun.summary,
    fomRows: buildFomRows(r),
    svgs,
    generatedIso: new Date().toISOString(),
  });
  const meta = { ver: r.engine_version, hash: r.scenario_hash };
  triggerDownload(new Blob([html], { type: "text/html" }), reportFilename(meta));
}

// --- Interactive guided tour ----------------------------------------------
// A dependency-free spotlight walkthrough: it scrolls to and highlights real regions
// of the page (capabilities, the playground controls, the result tabs, validation,
// agents) one step at a time, with a positioned tooltip. The ordered steps and the
// tooltip geometry are the pure, unit-tested core in tour.mjs; the overlay DOM,
// scrolling, and focus live here. "Seen" persists in localStorage so the tour
// auto-runs once; the playground's "Take the tour" button replays it. Storage can be
// blocked in an iframe (LMS) — reads/writes are wrapped so it degrades to "shows each
// time" rather than throwing.
const TOUR_KEY = "kshana_tour_seen";
function tourSeen() { try { return localStorage.getItem(TOUR_KEY) === "1"; } catch { return false; } }
function markTourSeen() { try { localStorage.setItem(TOUR_KEY, "1"); } catch { /* storage blocked */ } }

const tourState = { steps: [], i: 0, on: false, overlay: null, refs: null, reposition: null };

function reducedMotion() {
  return !!(window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches);
}

// Build the overlay once: a fixed catcher that blocks background clicks, a spotlight
// ring whose huge box-shadow dims everything but the target, and a tooltip card. All
// text is set via textContent (never innerHTML).
function buildTourOverlay() {
  if (tourState.overlay) return tourState.overlay;
  const ov = document.createElement("div");
  ov.id = "tour-overlay";
  ov.className = "tour-overlay";
  ov.setAttribute("role", "dialog");
  ov.setAttribute("aria-modal", "true");
  ov.setAttribute("aria-labelledby", "tour-tip-title");

  const spot = document.createElement("div");
  spot.className = "tour-spot";

  const tip = document.createElement("div");
  tip.className = "tour-tip";
  const eyebrow = document.createElement("p");
  eyebrow.className = "eyebrow";
  eyebrow.textContent = "Guided tour";
  const title = document.createElement("h3");
  title.id = "tour-tip-title";
  const body = document.createElement("p");
  body.className = "tour-tip-body";
  const foot = document.createElement("div");
  foot.className = "tour-tip-foot";
  const prog = document.createElement("span");
  prog.className = "tour-prog";
  const btns = document.createElement("div");
  btns.className = "tour-btns";
  const skip = document.createElement("button");
  skip.type = "button"; skip.className = "btn tour-skip"; skip.textContent = "Skip";
  const back = document.createElement("button");
  back.type = "button"; back.className = "btn tour-back"; back.textContent = "Back";
  const next = document.createElement("button");
  next.type = "button"; next.className = "btn primary tour-next"; next.textContent = "Next";
  btns.append(skip, back, next);
  foot.append(prog, btns);
  tip.append(eyebrow, title, body, foot);

  ov.append(spot, tip);
  document.body.append(ov);

  skip.addEventListener("click", endTour);
  back.addEventListener("click", () => gotoStep(tourState.i - 1));
  next.addEventListener("click", () => {
    if (tourState.i >= tourState.steps.length - 1) endTour();
    else gotoStep(tourState.i + 1);
  });
  ov.addEventListener("keydown", (e) => {
    if (e.key === "Escape") endTour();
    else if (e.key === "ArrowRight") next.click();
    else if (e.key === "ArrowLeft" && tourState.i > 0) back.click();
  });

  tourState.overlay = ov;
  tourState.refs = { spot, tip, title, body, prog, back, next };
  return ov;
}

// Place the spotlight ring + tooltip for the current step (also called on scroll/resize).
function positionTourStep() {
  if (!tourState.on) return;
  const step = tourState.steps[tourState.i];
  const targetEl = document.querySelector(step.target);
  if (!targetEl) return;
  const r = targetEl.getBoundingClientRect();
  const { spot, tip, title, body, prog, back, next } = tourState.refs;
  const pad = 8;
  const sTop = Math.max(0, r.top - pad);
  const sLeft = Math.max(0, r.left - pad);
  const sW = Math.min(window.innerWidth, r.right + pad) - sLeft;
  const sH = Math.min(window.innerHeight, r.bottom + pad) - sTop;
  spot.style.top = `${sTop}px`;
  spot.style.left = `${sLeft}px`;
  spot.style.width = `${Math.max(0, sW)}px`;
  spot.style.height = `${Math.max(0, sH)}px`;

  title.textContent = step.title;
  body.textContent = step.body;
  prog.textContent = `${tourState.i + 1} / ${tourState.steps.length}`;
  back.disabled = tourState.i === 0;
  next.textContent = tourState.i >= tourState.steps.length - 1 ? "Done" : "Next";

  const ts = tip.getBoundingClientRect();
  const pos = placeTooltip(
    { top: r.top, left: r.left, width: r.width, height: r.height },
    { width: ts.width, height: ts.height },
    { width: window.innerWidth, height: window.innerHeight },
    step.side,
  );
  tip.style.top = `${pos.top}px`;
  tip.style.left = `${pos.left}px`;
}

function gotoStep(n) {
  tourState.i = clampStep(n, tourState.steps.length);
  const targetEl = document.querySelector(tourState.steps[tourState.i].target);
  if (targetEl) {
    targetEl.scrollIntoView({ behavior: reducedMotion() ? "auto" : "smooth", block: "center", inline: "nearest" });
  }
  // Let a smooth scroll settle, then place the spotlight + tooltip.
  setTimeout(positionTourStep, reducedMotion() ? 0 : 360);
}

function startTour() {
  if (tourState.on) return;
  tourState.steps = TOUR_STEPS.filter((s) => {
    const t = document.querySelector(s.target);
    return t && t.getClientRects().length > 0;
  });
  if (tourState.steps.length === 0) return;
  buildTourOverlay();
  tourState.overlay.classList.add("on");
  tourState.on = true;
  tourState.reposition = () => positionTourStep();
  window.addEventListener("resize", tourState.reposition);
  window.addEventListener("scroll", tourState.reposition, { passive: true });
  tourState.overlay.setAttribute("tabindex", "-1");
  tourState.overlay.focus();
  gotoStep(0);
}

function endTour() {
  tourState.on = false;
  if (tourState.overlay) tourState.overlay.classList.remove("on");
  if (tourState.reposition) {
    window.removeEventListener("resize", tourState.reposition);
    window.removeEventListener("scroll", tourState.reposition);
    tourState.reposition = null;
  }
  markTourSeen();
}

async function loadScenario(file) {
  try {
    const res = await fetch(`scenarios/${file}`, { cache: "no-store" });
    if (!res.ok) throw new Error(String(res.status));
    tomlEl.value = await res.text();
    markActivePreset(file);
    // Reset sweep range seeds so they re-seed from the new scenario, and rebuild
    // the guided knobs (the applicable set varies between clock and orbit).
    el("sweep-min").value = "";
    el("sweep-max").value = "";
    buildGuided();
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

  // Embed / iframe (LMS) mode: gate purely on ?embed=1 so the default path is
  // untouched. In embed mode we hide the marketing chrome via body classes and
  // pre-load a scenario with optional knob overrides + a target tab. The engine
  // runs client-side, so the embedded iframe is fully self-contained.
  const embed = isEmbed(location.search);
  const cfg = embed ? embedConfig(location.search) : null;
  if (embed) {
    for (const c of embedClassList(cfg)) document.body.classList.add(c);
    const fab = el("tour-fab");
    if (fab) fab.hidden = true; // no marketing chrome inside an embedded iframe
  }

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
  el("sweep-run").addEventListener("click", runSweep);
  el("sweep-knob").addEventListener("change", syncSweepControls);
  el("download-report").addEventListener("click", downloadReport);
  // Both tour launchers — the in-context playground button and the persistent
  // floating button — start (or restart) the guided tour.
  for (const id of ["tour-launch", "tour-fab"]) {
    const btn = el(id);
    if (btn) btn.addEventListener("click", startTour);
  }

  if (shared && !embed) {
    el("advanced").open = true; // a shared run may be hand-tuned: show the source
    statusEl.textContent = "Loaded a shared scenario from the link.";
  }

  if (embed && cfg.scenario && knownScenario(cfg.scenario)) {
    // Load the requested scenario, apply numeric knob overrides, then run.
    selectEl.value = cfg.scenario;
    try {
      const res = await fetch(`scenarios/${cfg.scenario}`, { cache: "no-store" });
      if (res.ok) tomlEl.value = await res.text();
    } catch { /* keep the default/shared TOML if the fetch fails */ }
    for (const [key, val] of Object.entries(cfg.knobs || {})) {
      tomlEl.value = patchScalar(tomlEl.value, key, val);
    }
    buildGuided();
    runScenario();
    if (cfg.tab) selectTab(cfg.tab);
  } else {
    buildGuided();
    runScenario(); // show a result immediately
  }

  // Auto-run the guided tour once (non-embed only); persists via localStorage. A
  // short delay lets the first scenario render so the result tabs exist as targets.
  if (!embed && !tourSeen()) setTimeout(startTour, 900);
}

main();
