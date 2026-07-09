// SPDX-License-Identifier: AGPL-3.0-only
import init, { run, summary, chart_svg, version, export_sp3, export_omm, export_oem } from "./pkg/kshana.js";
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
  ["hybrid-ukf.toml", "17-state hybrid quantum+classical UKF — filter self-consistency (modelled)",
    "Hybrid 17-state UKF", "Is the 17-state tightly-coupled UKF self-consistent (NEES + innovation-whiteness)? A self-consistency check, not an accuracy claim."],
  ["integrity-raim.toml", "GNSS integrity (RAIM) — HPL/VPL availability",
    "RAIM integrity", "Does the geometry meet the alert limits (HPL / VPL)?"],
  ["spoof-attack.toml", "Spoofing attack — clock-aided detection",
    "Spoof detection", "Is a ramping time-spoof caught before it reaches spec?"],
  ["pvt-abmf.toml", "Single-point positioning — real IGS observations (ABMF)",
    "Positioning (SPP)", "Can a real receiver position be solved from raw RINEX measurements?"],
  ["mars-pnt-lmo.toml", "Mars PNT — MARCONI relay constellation (Low-Mars-Orbit user)",
    "Mars PNT", "Can a MARCONI relay constellation navigate a user at Mars? (covariance FoM, not a certified PL)"],
  ["terrain-slam.toml", "Terrain-referenced nav — recursive SITAN particle filter",
    "Terrain SLAM", "Can a particle filter track a time-varying INS drift against a terrain map?"],
  ["impairment-eval.toml", "RF-impairment detection eval — ROC/AUC testbed",
    "RF-impairment eval", "How well does a detector separate jamming / spoofing / multipath from nominal? (modelled ROC/AUC)"],
  ["quantum-trade.toml", "Quantum-vs-classical PNT trade — holdover benefit",
    "Quantum PNT trade", "What timing / inertial holdover does a candidate clock buy over a classical baseline? (modelled)"],
  ["space-weather.toml", "Space weather — F10.7 / Kp, Jacchia-71 density",
    "Space weather", "How does solar / geomagnetic activity change thermospheric density? (modelled)"],
  ["launch-window.toml", "Launch window — azimuth, plane-change, opportunities",
    "Launch window", "What launch azimuth and dogleg Δv reach a target inclination from a site?"],
  ["reentry.toml", "Re-entry corridor — Allen-Eggers ballistic entry",
    "Re-entry corridor", "What peak-g and peak-heating velocity does a ballistic re-entry see?"],
  ["eo-coverage.toml", "EO coverage — swath, GSD, access & revisit",
    "EO coverage", "What swath, ground sample distance and revisit does an EO orbit give?"],
  ["passes.toml", "Ground-station passes — AOS / TCA / LOS prediction",
    "Ground passes", "When does a satellite rise and set over a station, and for how long?"],
  ["link-budget.toml", "Link budget — CCSDS / DSN C/N₀ & margin",
    "Link budget", "Does the one-way link close with margin at the given range and data rate?"],
  ["attitude-budget.toml", "Attitude & pointing budget — gravity-gradient + RSS",
    "Pointing budget", "What is the worst-case disturbance torque and pointing-error budget?"],
  ["space-packet.toml", "CCSDS Space Packet — TM/TC framing round-trip",
    "Space Packet", "Does a CCSDS 133.0 packet stream encode and decode bit-exactly?"],
  ["oem-interop.toml", "CCSDS OEM interop — import / round-trip bridge",
    "CCSDS OEM bridge", "Can an OEM ephemeris from GMAT / Orekit / STK be imported and round-tripped?"],
  ["gps-denied-gravity-nav.toml", "GNSS-free nav — gravity map-matching benchmark",
    "GNSS-free nav", "How far does position drift over a full hour without GNSS — and can a gravity map rein it in?"],
  ["lunanet-araim.toml", "Lunar integrity — LunaNet ARAIM at the south pole",
    "Lunar integrity", "Does a sparse lunar relay set meet the integrity limits for an Artemis-region receiver?"],
  ["gnss-sim-raim.toml", "GNSS measurements — pseudorange, ionosphere & troposphere → RAIM",
    "GNSS measurements", "How do the ionosphere and troposphere shape raw pseudoranges, and does RAIM still protect?"],
  // Resilience & security
  ["jamming-demo.toml", "Jamming — link-budget J/S → loss of lock",
    "Jamming", "At what jammer-to-signal ratio does the receiver lose lock?"],
  ["spoof-detect.toml", "Multi-layer spoof detection — fused RAIM + AGC + SQM monitor",
    "Multi-layer spoof detect", "Can a fused RF + measurement monitor catch a coordinated spoof?"],
  ["conflict-resilience.toml", "Conflict resilience — layered-PNT Monte-Carlo + per-vector survival (modelled)",
    "Conflict resilience", "How does a layered PNT architecture degrade under jamming / spoofing / kinetic / cyber threats? (modelled)"],
  // Alt-PNT (GPS-denied)
  ["terrain-nav.toml", "Terrain-referenced nav — TERCOM/SITAN batch match",
    "Terrain nav", "Can an altimeter fix INS drift by matching a terrain elevation profile?"],
  ["combined-altpnt.toml", "Combined alt-PNT — gravity + magnetic + terrain fusion",
    "Combined alt-PNT", "What does fusing three scalar map channels buy over any one alone?"],
  // Trade-study sweeps
  ["sweep-clock-stability.toml", "Trade sweep — 1-D clock-stability vs holdover",
    "Parameter sweep", "How does holdover change as one clock parameter is swept?"],
  ["sweep-nd-inertial.toml", "N-D trade sweep — any pack, any parameters",
    "N-D sweep", "How does a figure of merit vary across a multi-parameter grid?"],
  // Quantum-enabled PNT demonstrator
  ["quantum-time-transfer.toml", "Quantum time transfer — optical-clock + entanglement link (modelled)",
    "Quantum time transfer", "What does trusted quantum timing buy over a classical CSAC + RF chain? (modelled)"],
  ["quantum-gnss-free-nav.toml", "Quantum GNSS-free nav — cold-atom inertial coast (modelled)",
    "Quantum GNSS-free nav", "How far does a cold-atom navigator coast vs a nav-grade INS with no GNSS? (modelled)"],
  ["quantum-anomaly-detect.toml", "Quantum anomaly detection — fault ROC / AUC (modelled)",
    "Quantum anomaly detect", "How well are quantum-system faults detected at a fixed false-alarm rate? (modelled)"],
  // Optical/RF hybrid & cislunar
  ["hybrid-optical-rf.toml", "Optical/RF hybrid — cross-domain continuity & integrity (modelled)",
    "Optical/RF hybrid", "What continuity and integrity does combining optical and RF PNT buy? (modelled)"],
  ["cislunar-observability.toml", "Cislunar observability — DRO constellation Gramian + SRIF",
    "Cislunar observability", "How much of a cislunar spacecraft's state does an inter-satellite arc make observable?"],
  // Lunar-surface PNT suite
  ["lunar-time-offset.toml", "Lunar coordinate time — LTC/TCL secular offset",
    "Lunar time offset", "How fast does a lunar clock diverge from Earth time (~56–59 µs/day)?"],
  ["lunar-time-budget.toml", "Lunar time budget — LTC/TCL rate & error budget (modelled)",
    "Lunar time budget", "How large is the Earth–Moon coordinate-time offset, and its error budget? (modelled)"],
  ["lunar-vlbi.toml", "Lunar VLBI — Earth-baseline delay observable (modelled)",
    "Lunar VLBI", "What delay does an Earth-baseline VLBI pair see for a lunar surface beacon? (modelled)"],
  ["lunar-joint-od-clock.toml", "Lunar joint OD + clock — VLBI restores observability (modelled)",
    "Lunar joint OD+clock", "Does an Earth-baseline VLBI tie make a lunar station's absolute position observable? (modelled)"],
  ["lunar-frame-realisation.toml", "Lunar frame realisation — 7-parameter Helmert datum fit (modelled)",
    "Lunar frame", "Can a Helmert datum fit recover a lunar reference-frame transform? (modelled)"],
  ["moonlight-service-volume.toml", "Moonlight service volume — DOP / coverage / lunar ARAIM (modelled)",
    "Lunar service volume", "What DOP, coverage and integrity does a Moonlight/LCNS-class constellation give the south pole? (modelled)"],
  ["lunar-differential-pnt.toml", "Lunar differential PNT — DGNSS / SBAS analogue (modelled)",
    "Lunar differential PNT", "How much does differential correction cancel common-mode error vs baseline on the Moon? (modelled)"],
  ["lunar-interop-export.toml", "Lunar interop export — CCSDS OEM + LunaNet time in a KIF envelope",
    "Lunar interop export", "Can lunar frame / time / ephemeris round-trip through CCSDS OEM + a KIF envelope?"],
  // Real-time frame / Earth-orientation
  ["realtime-frame-eop.toml", "Real-time frame / EOP budget — predicted-EOP error (modelled)",
    "Real-time frame/EOP", "How much frame error does real-time (predicted) Earth-orientation introduce? (modelled)"],
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
  const hasClock = rows.some((r) => r.clockLabel);
  const leadN = hasClock ? 2 : 1; // number of lead (non-value) columns
  const table = document.createElement("table");
  table.className = "compare-table overlay-table";
  const head = document.createElement("tr");
  const headers = [...(hasClock ? ["Clock"] : []), "Metric", ...runs.map((r) => r.label)];
  headers.forEach((h, i) => {
    const th = document.createElement("th");
    th.textContent = h;
    if (i >= leadN) {
      const sw = document.createElement("span");
      sw.className = "ovl-swatch";
      sw.style.background = OVERLAY_COLORS[(i - leadN) % OVERLAY_COLORS.length];
      th.prepend(sw);
    }
    head.append(th);
  });
  table.append(head);
  for (const r of rows) {
    const tr = document.createElement("tr");
    const lead = [...(hasClock ? [r.clockLabel] : []), r.unit ? `${r.label} (${r.unit})` : r.label];
    for (const c of lead) {
      const td = document.createElement("td");
      td.textContent = c;
      tr.append(td);
    }
    const base = r.values[0];
    r.values.forEach((v, i) => {
      const td = document.createElement("td");
      td.className = "num" + (i === r.best ? " cmp-better" : "");
      td.append(document.createTextNode(fmtVal(v)));
      // Deviation vs the first (baseline) run — the side-by-side delta the
      // comparison exists to surface. Coloured by the metric's direction.
      if (i > 0 && typeof v === "number" && typeof base === "number") {
        const d = v - base;
        const pct = base !== 0 ? (d / Math.abs(base)) * 100 : null;
        const sign = d > 0 ? "+" : d < 0 ? "−" : "±";
        const span = document.createElement("span");
        span.style.display = "block";
        span.style.fontSize = "11px";
        span.style.color = d === 0 ? "#8c8273" : ((r.lowerBetter ? d < 0 : d > 0) ? "#7bb38a" : "#c98b8b");
        span.textContent =
          `Δ ${sign}${fmtVal(Math.abs(d))}` + (pct != null ? ` (${sign}${fmtVal(Math.abs(pct))}%)` : "");
        td.append(span);
      }
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
  if (!overlayRows(runs).length) {
    // No shared figures of merit — say so instead of showing a blank table.
    const p = document.createElement("p");
    p.className = "compare-empty";
    p.style.color = "#a89f8e";
    p.textContent =
      "These pinned runs share no comparable figures of merit. Pin runs of the same " +
      "scenario family (e.g. two clock runs, or two Mars-PNT runs) to see side-by-side numbers and deltas.";
    el("compare-table").replaceChildren(p);
  } else {
    el("compare-table").replaceChildren(buildOverlayTable(runs));
  }
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
    updateExportButtons();
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

// --- Shared domain spine -------------------------------------------------
// One vocabulary across the page; each section expresses it with a different
// lens (Capabilities = accordion, Playground = tab-strip, Validation = table).
// Short keys read as a recurring system rather than a repeated paragraph; the
// full descriptor is kept for sublabels/tooltips.
const DOMAIN_ORDER = ["Orbits", "Timing", "Inertial", "GNSS", "Resilience", "Lunar", "AI/ML", "Interop"];
const DOMAIN_FULL = {
  Orbits: "Orbits, OD & trajectory",
  Timing: "Time & frequency",
  Inertial: "Inertial, fusion & alt-PNT",
  GNSS: "GNSS integrity & positioning",
  Resilience: "Resilience & nav-signal",
  Lunar: "Lunar, cislunar & deep-space",
  "AI/ML": "AI/ML, anomaly & decision",
  Interop: "Interoperability & assurance",
};

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
// Standards-track exports (SP3 / CCSDS OMM / OEM) for the current run. The engine
// serialises them client-side from the same scenario TOML; a format button appears only
// when the run actually yields that artifact (orbit/constellation scenarios), so a clock
// or resilience run shows none. Nothing is uploaded.
const EXPORTERS = [
  ["SP3", export_sp3, "sp3", "SP3-c precise ephemeris"],
  ["OMM", export_omm, "omm", "CCSDS OMM mean-element catalogue"],
  ["OEM", export_oem, "oem", "CCSDS OEM 2.0 ephemeris (GMAT / Orekit / STK)"],
];

function updateExportButtons() {
  const tools = el("export-tools");
  if (!tools) return;
  tools.replaceChildren();
  const toml = lastRun && lastRun.toml;
  if (!toml) { tools.hidden = true; return; }
  const meta = { ver: lastRun.result.engine_version, hash: lastRun.result.scenario_hash };
  let any = false;
  for (const [label, fn, ext, title] of EXPORTERS) {
    let text;
    try { text = fn(toml); } catch { continue; }        // kind can't produce it → skip
    if (!text || !text.trim()) continue;
    any = true;
    const b = document.createElement("button");
    b.type = "button";
    b.className = "chart-dl";
    b.textContent = `⤓ ${label}`;
    b.title = `Export this constellation as ${title} — client-side, nothing uploaded`;
    b.addEventListener("click", () => triggerDownload(
      new Blob([text], { type: "text/plain" }), chartFilename(ext, meta, ext)));
    tools.appendChild(b);
  }
  tools.hidden = !any;
}

function downloadJson() {
  if (!lastRun) return;
  const meta = { ver: lastRun.result.engine_version, hash: lastRun.result.scenario_hash };
  triggerDownload(
    new Blob([el("json").textContent], { type: "application/json" }),
    chartFilename("result", meta, "json"));
}

async function copyJson() {
  const text = el("json").textContent;
  if (!text) return;
  try { await navigator.clipboard.writeText(text); flash(el("json-copy")); } catch { /* clipboard blocked */ }
}

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
    if (selectEl) selectEl.value = file;
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

// One capability: a compact, always-scannable tile (domain · status · action ·
// title · proof) plus a full-width detail band that holds the summary prose and is
// revealed on click. Tiles stay put; the band drops in directly below the clicked
// tile's visual row (one open at a time per domain), so the dense prose gets full
// width and the grid never leaves holes. The title is a real <button> (keyboard +
// aria-expanded); run/docs stay independently clickable. data-status drives the
// "Validated only" filter on both the tile and its band. The proof footer is a green
// ✓ only for validated capabilities; modelled show their check neutrally so the tick
// never reads as an external-oracle claim. Returns a fragment of [tile, detail].
function buildCapCard(c, idx) {
  const frag = document.createDocumentFragment();
  const validated = c.status === "validated";
  const status = validated ? "validated" : "modelled";
  const bodyId = `capbody-${c.group || "x"}-${idx}`.replace(/[^\w-]/g, "");

  const tile = document.createElement("article");
  tile.className = "card feat cap-tile";
  tile.dataset.status = status;

  const head = document.createElement("div");
  head.className = "feat-head";
  const dom = document.createElement("p");
  dom.className = "eyebrow";
  dom.textContent = c.domain;
  head.append(dom);

  const right = document.createElement("span");
  right.className = "feat-head-right";
  const pill = document.createElement("span");
  pill.className = validated ? "pill validated" : "pill modelled";
  pill.textContent = status;
  right.append(pill);
  if (c.run && knownScenario(c.run)) {
    const run = document.createElement("button");
    run.type = "button";
    run.className = "run";
    run.textContent = "▸ run";
    run.title = `Load and run ${c.name} in the playground`;
    run.addEventListener("click", (e) => {
      e.stopPropagation();
      selectEl.value = c.run;
      loadScenario(c.run);
      document.getElementById("playground").scrollIntoView({ behavior: "smooth" });
    });
    right.append(run);
  } else {
    // No bundled playground demo for this capability — link to its OWN reference
    // (the source module / test that backs it, via the card→matrix map) so each
    // card's "docs" points at distinct evidence instead of one generic page.
    const docs = document.createElement("a");
    docs.className = "cap-docs";
    docs.href = c.docs || capDocsHref(c) || "https://github.com/AshfordeOU/kshana/blob/main/docs/CAPABILITY.md";
    docs.target = "_blank";
    docs.rel = "noopener noreferrer";
    docs.textContent = "docs ↗";
    docs.title = `Reference documentation for ${c.name}`;
    docs.addEventListener("click", (e) => e.stopPropagation());
    right.append(docs);
  }
  head.append(right);

  // Title is the disclosure control (native <button> → free keyboard + a11y).
  const h = document.createElement("h3");
  const btn = document.createElement("button");
  btn.type = "button";
  btn.className = "cap-toggle";
  btn.setAttribute("aria-expanded", "false");
  btn.setAttribute("aria-controls", bodyId);
  const label = document.createElement("span");
  label.className = "cap-title-text";
  label.textContent = c.name;
  const chev = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  chev.setAttribute("class", "chev");
  chev.setAttribute("viewBox", "0 0 16 16");
  chev.setAttribute("aria-hidden", "true");
  const cp = document.createElementNS("http://www.w3.org/2000/svg", "path");
  cp.setAttribute("d", "M4 6l4 4 4-4");
  cp.setAttribute("fill", "none");
  cp.setAttribute("stroke", "currentColor");
  cp.setAttribute("stroke-width", "1.6");
  cp.setAttribute("stroke-linecap", "round");
  cp.setAttribute("stroke-linejoin", "round");
  chev.append(cp);
  btn.append(label, chev);
  h.append(btn);

  tile.append(head, h);
  if (c.proof) {
    const proof = document.createElement("span");
    proof.className = validated ? "proof" : "proof proof-modelled";
    proof.textContent = validated ? `✓ ${c.proof}` : c.proof;
    tile.append(proof);
  }

  // Full-width detail band (animated height; out of flow until opened).
  const detail = document.createElement("div");
  detail.className = "cap-detail";
  detail.id = bodyId;
  detail.dataset.status = status;
  detail.hidden = true;
  const inner = document.createElement("div");
  inner.className = "cap-detail-inner";
  const p = document.createElement("p");
  p.textContent = c.summary;
  inner.append(p);
  // Machine-checked evidence deep-links for this capability (test, source, provenance),
  // joined from the verification ledger; absent gracefully if the ledger didn't load.
  const ev = buildCapEvidence(c.name);
  if (ev) inner.append(ev);
  detail.append(inner);

  btn.addEventListener("click", () => toggleCap(tile, detail, btn));
  tile.addEventListener("click", (e) => {
    if (e.target.closest(".cap-toggle, .run, .cap-docs")) return;
    toggleCap(tile, detail, btn);
  });

  frag.append(tile, detail);
  return frag;
}

const capReduceMotion =
  typeof matchMedia === "function" && matchMedia("(prefers-reduced-motion: reduce)").matches;

// Hide a detail band, animating closed unless reduced-motion is requested.
function collapseDetail(detail) {
  detail.classList.remove("open");
  if (capReduceMotion) {
    detail.hidden = true;
    return;
  }
  const onEnd = (e) => {
    if (e.target !== detail || e.propertyName !== "grid-template-rows") return;
    detail.hidden = true;
    detail.removeEventListener("transitionend", onEnd);
  };
  detail.addEventListener("transitionend", onEnd);
}

// Close every open capability within `scope` (a grid, or the whole document).
function closeAllCaps(scope) {
  (scope || document).querySelectorAll(".cap-tile.open").forEach((t) => {
    t.classList.remove("open");
    const b = t.querySelector(".cap-toggle");
    if (b) b.setAttribute("aria-expanded", "false");
    const d = b && document.getElementById(b.getAttribute("aria-controls"));
    if (d) collapseDetail(d);
  });
}

// Toggle one capability open (accordion: one per grid). The band is placed right after
// the last tile in the clicked tile's visual row so it forms a clean full-width row
// with no holes, at any column count.
function toggleCap(tile, detail, btn) {
  const grid = tile.closest("[data-cards-for]") || tile.parentElement;
  const wasOpen = tile.classList.contains("open");

  // Close siblings instantly (keeps the row measurement below honest — an animating
  // band would still occupy flow and skew offsetTop).
  grid.querySelectorAll(".cap-tile.open").forEach((t) => {
    if (t === tile) return;
    t.classList.remove("open");
    const b = t.querySelector(".cap-toggle");
    if (b) b.setAttribute("aria-expanded", "false");
    const d = b && document.getElementById(b.getAttribute("aria-controls"));
    if (d) {
      d.classList.remove("open");
      d.hidden = true;
    }
  });

  if (wasOpen) {
    tile.classList.remove("open");
    btn.setAttribute("aria-expanded", "false");
    collapseDetail(detail);
    return;
  }

  const tiles = [...grid.querySelectorAll(".cap-tile")];
  const top = tile.offsetTop;
  let last = tile;
  for (const t of tiles) if (Math.abs(t.offsetTop - top) < 2) last = t;
  if (last.nextSibling !== detail) grid.insertBefore(detail, last.nextSibling);

  tile.classList.add("open");
  btn.setAttribute("aria-expanded", "true");
  detail.hidden = false;
  if (capReduceMotion) detail.classList.add("open");
  else requestAnimationFrame(() => requestAnimationFrame(() => detail.classList.add("open")));
  tile.scrollIntoView({ block: "nearest", behavior: capReduceMotion ? "auto" : "smooth" });
}

// Column count changes invalidate band placement — collapse everything on resize.
let capResizeTimer;
if (typeof window !== "undefined") {
  window.addEventListener("resize", () => {
    clearTimeout(capResizeTimer);
    capResizeTimer = setTimeout(() => {
      document.querySelectorAll(".cap-tile.open").forEach((t) => {
        t.classList.remove("open");
        const b = t.querySelector(".cap-toggle");
        if (b) b.setAttribute("aria-expanded", "false");
        const d = b && document.getElementById(b.getAttribute("aria-controls"));
        if (d) {
          d.classList.remove("open");
          d.hidden = true;
        }
      });
    }, 150);
  });
}

// Reveal scroll-in children that became visible while off-screen or hidden — the
// page's IntersectionObserver can't see content inside a hidden tab panel, so a
// panel's cards would otherwise stay at opacity 0 the first time its tab is shown.
function revealIn(node) {
  if (node.classList && node.classList.contains("reveal")) node.classList.add("in");
  node.querySelectorAll(".reveal:not(.in)").forEach((e) => e.classList.add("in"));
}

// The unified "Explore the stack" section. Capability cards (from capabilities.json)
// are injected into per-domain panels that also carry the authored evidence prose;
// a domain tab-strip shows one domain at a time, so the section stays a roughly
// constant height as the catalogue grows. A single "Validated only" filter spans the
// cards and the evidence together. The two nav doorways (Capabilities / Validation)
// both land here; the Validation link additionally opens the active domain's evidence
// and filters to the dataset-checked rows (wired in main()).
function buildExplorer(caps) {
  const root = el("explore");
  const tabsEl = el("xp-tabs");
  const panelsEl = el("xp-panels");
  if (!root || !tabsEl || !panelsEl) return;

  // Bucket capabilities by coarse domain (group), preserving first-seen order.
  const byGroup = new Map();
  for (const c of caps) {
    const g = c.group || c.domain || "Other";
    if (!byGroup.has(g)) byGroup.set(g, []);
    byGroup.get(g).push(c);
  }

  // Panels are authored in the page (they hold the evidence); drive the order and
  // the tab-strip from them, in the canonical spine order with any extras appended.
  const panels = [...panelsEl.querySelectorAll(".xp-panel")];
  const present = panels.map((p) => p.dataset.domain);
  const order = [
    ...DOMAIN_ORDER.filter((g) => present.includes(g)),
    ...present.filter((g) => !DOMAIN_ORDER.includes(g)),
  ];

  let totalEv = 0;
  let totalEvV = 0;
  const meta = new Map();
  for (const g of order) {
    const panel = panels.find((p) => p.dataset.domain === g);
    const arr = byGroup.get(g) || [];
    const grid = panel.querySelector("[data-cards-for]");
    if (grid) {
      grid.replaceChildren();
      arr.forEach((c, i) => grid.append(buildCapCard(c, i)));
    }
    const vCaps = arr.filter((c) => c.status === "validated").length;
    const runnable = arr.filter((c) => c.run && knownScenario(c.run)).length;
    const evRows = [...panel.querySelectorAll(".ev-row")];
    const evV = evRows.filter((r) => r.dataset.status === "validated").length;
    totalEv += evRows.length;
    totalEvV += evV;
    const head = panel.querySelector(".xp-dcount");
    const baseHead = `${arr.length} ${arr.length === 1 ? "capability" : "capabilities"} · ${vCaps} validated · ${runnable} runnable`;
    if (head) head.textContent = baseHead;
    const evc = panel.querySelector(".xp-evc");
    if (evc) evc.textContent = ` (${evRows.length})`;
    meta.set(g, { panel, arr, vCaps, evV, evTotal: evRows.length, evc, head, baseHead });
  }

  // Build the tab-strip from the present domains.
  tabsEl.replaceChildren();
  const tabByG = new Map();
  order.forEach((g, i) => {
    const tab = document.createElement("button");
    tab.type = "button";
    tab.className = "tab-btn";
    tab.setAttribute("role", "tab");
    tab.dataset.domain = g;
    tab.title = DOMAIN_FULL[g] || g;
    tab.setAttribute("aria-selected", i === 0 ? "true" : "false");
    tab.tabIndex = i === 0 ? 0 : -1;
    const n = document.createElement("span");
    n.textContent = g;
    const cnt = document.createElement("span");
    cnt.className = "tab-count";
    cnt.textContent = meta.get(g).arr.length;
    tab.append(n, cnt);
    tab.addEventListener("click", () => selectExploreDomain(g));
    tabsEl.append(tab);
    tabByG.set(g, tab);
  });

  function selectExploreDomain(g) {
    for (const gg of order) {
      const on = gg === g;
      const tab = tabByG.get(gg);
      tab.setAttribute("aria-selected", on ? "true" : "false");
      tab.tabIndex = on ? 0 : -1;
      const panel = meta.get(gg).panel;
      panel.hidden = !on;
      if (on) revealIn(panel);
    }
  }

  // Arrow-key roving focus across the tablist (WAI-ARIA tabs pattern).
  tabsEl.addEventListener("keydown", (e) => {
    const cur = order.indexOf(tabsEl.querySelector('[aria-selected="true"]')?.dataset.domain);
    let next = cur;
    if (e.key === "ArrowRight") next = (cur + 1) % order.length;
    else if (e.key === "ArrowLeft") next = (cur - 1 + order.length) % order.length;
    else return;
    e.preventDefault();
    selectExploreDomain(order[next]);
    tabByG.get(order[next]).focus();
  });

  // Running tally + the "Validated only" filter (spans cards and evidence; CSS hides
  // the modelled/info items and the counts retitle to validated-only totals).
  const totalV = caps.filter((c) => c.status === "validated").length;
  const tally = el("xp-tally");
  const baseTally = `${caps.length} capabilities · ${totalEv} evidence claims · ${order.length} domains · ${totalV} validated against external oracles`;
  if (tally) tally.textContent = baseTally;

  const cb = el("xp-validated-only");
  if (cb) {
    cb.addEventListener("change", () => {
      const only = cb.checked;
      closeAllCaps(root);
      root.classList.toggle("validated-only", only);
      if (tally) {
        tally.textContent = only
          ? `${totalV} validated capabilities · ${totalEvV} external-oracle evidence claims · ${order.length} domains`
          : baseTally;
      }
      for (const g of order) {
        const m = meta.get(g);
        tabByG.get(g).classList.toggle("tab-empty", only && m.vCaps === 0 && m.evV === 0);
        if (m.head) m.head.textContent = only ? `${m.vCaps} validated · ${m.evV} evidence` : m.baseHead;
        if (m.evc) m.evc.textContent = only ? ` (${m.evV})` : ` (${m.evTotal})`;
      }
    });
  }

  // Exposed for the Validation nav doorway (see main()).
  root._selectDomain = selectExploreDomain;
  root._activeDomain = () => tabsEl.querySelector('[aria-selected="true"]')?.dataset.domain || order[0];

  // Default: first domain visible, its cards revealed.
  selectExploreDomain(order[0]);
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

  // Load the ledger + card→matrix map first so each card can grow its own
  // machine-checked evidence deep-links (best-effort; cards still render without).
  await Promise.all([loadLedger(), loadCardMap(), loadStandardsMap()]);

  // Capability cards + per-domain evidence, unified into the explorer.
  if (Array.isArray(data.capabilities)) buildExplorer(data.capabilities);

  // Standards the engine speaks — each card links its VALIDATED badge to the ledger
  // row that proves it (when one exists), so the claim is one click from its evidence.
  const list = el("standards-list");
  if (list && Array.isArray(data.standards)) {
    list.replaceChildren();
    for (const s of data.standards) {
      const req = STANDARDS_MATRIX.get(s.name);
      const linked = !!req && LEDGER_BY_REQ.has(req);
      const row = document.createElement(linked ? "a" : "div");
      row.className = "std-row" + (linked ? " std-link" : "");
      if (linked) {
        row.href = `#ldg-${slug(req)}`;
        row.title = `See the validation evidence for ${s.name}`;
        row.addEventListener("click", () => {
          const d = el("ldg-details"); // open the fold so the evidence row is visible
          if (d) d.open = true;
        });
      }
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
    const sc = el("std-summary-count");
    if (sc) sc.textContent = t("standards.count", { count: data.standards.length });
  }
}


// --- Lightweight i18n (English baseline; structured to drop in more languages) ---
// UI strings are keyed; static elements opt in via data-i18n (textContent),
// data-i18n-html (innerHTML, trusted author strings only) or data-i18n-attr
// ("attr:key,attr2:key2"). Dynamic strings use t(key, params) with {token}
// interpolation. Language: ?lang= → localStorage → navigator.language → "en",
// falling back to "en" for any key/locale not present. Currently only the ledger
// section is keyed; add a locale block (e.g. I18N.fr = {...}) to translate it.
const I18N = {
  en: {
    "ledger.eyebrow": "Evidence ledger",
    "ledger.heading": "The complete validation matrix — every row, every proof",
    "ledger.intro":
      'All <span id="ldg-total">102</span> capabilities, generated from ' +
      "<code>src/verification.rs</code> and pinned to it in CI. Each row links to the " +
      "<strong>test</strong> that enforces it, the <strong>module</strong> that " +
      "implements it, and any committed <strong>fixture/provenance</strong> — so every " +
      'claim is one click from its evidence. <span class="pill validated">Validated</span> ' +
      '= checked against an independent external oracle; <span class="pill modelled">Modelled</span> ' +
      '= honest first-principles model (see <a target="_blank" rel="noopener noreferrer" ' +
      'href="https://github.com/AshfordeOU/kshana/blob/main/docs/MODELLED-RATIONALE.md">why</a>); ' +
      '<span class="pill partner">Partner</span> = consortium gap, no code by design.',
    "ledger.summary.open": "Open the full validation ledger",
    "ledger.summary.count": "({total} rows)",
    "ledger.search.placeholder": "Filter by capability, module, oracle…",
    "ledger.search.aria": "Filter the ledger",
    "ledger.status.aria": "Filter by status",
    "ledger.region.aria": "Validation ledger",
    "ledger.col.capability": "Capability",
    "ledger.col.status": "Status",
    "ledger.col.oracle": "Oracle",
    "ledger.col.evidence": "Evidence",
    "ledger.chip.all": "All ({count})",
    "ledger.chip.validated": "Validated ({count})",
    "ledger.chip.modelled": "Modelled ({count})",
    "ledger.chip.partner": "Partner ({count})",
    "ledger.tally": "{shown} of {total} capabilities",
    "ledger.sources": "Sources:",
    "ledger.empty": "Validation ledger could not be loaded.",
    "ledger.foot":
      "Generated from the matrix by <code>gen_validation_artifacts</code> and pinned by " +
      "<code>verification_artifacts_doc_sync</code> — the table cannot drift from the code. " +
      "Full tables: " +
      '<a target="_blank" rel="noopener noreferrer" href="https://github.com/AshfordeOU/kshana/blob/main/docs/VERIFICATION-MATRIX.md">VERIFICATION-MATRIX.md</a> · ' +
      '<a target="_blank" rel="noopener noreferrer" href="https://github.com/AshfordeOU/kshana/blob/main/docs/MODELLED-RATIONALE.md">MODELLED-RATIONALE.md</a> · ' +
      '<a target="_blank" rel="noopener noreferrer" href="https://github.com/AshfordeOU/kshana/blob/main/docs/VALIDATION.md">VALIDATION.md</a>',
    "cap.evidence": "Evidence",
    "standards.eyebrow": "Standards & interoperability",
    "standards.heading": "Speaks the formats your tools already use",
    "standards.intro":
      "Built on the open standards of the GNSS and timing community, so it drops into " +
      "existing workflows — and every standard below links to the test that proves it.",
    "standards.summary": "Show the validated formats & standards",
    "standards.count": "({count} validated)",
  },
};

function currentLang() {
  let l = null;
  try {
    l = new URLSearchParams(location.search).get("lang") || localStorage.getItem("lang");
  } catch {
    /* sandboxed / no storage — fall through */
  }
  l = l || (navigator.language || "en").slice(0, 2);
  return I18N[l] ? l : "en";
}

function t(key, params) {
  const lang = currentLang();
  let s = (I18N[lang] && I18N[lang][key]) || (I18N.en && I18N.en[key]) || key;
  if (params) {
    for (const [k, v] of Object.entries(params)) s = s.split(`{${k}}`).join(String(v));
  }
  return s;
}

function applyI18n(root = document) {
  root.querySelectorAll("[data-i18n]").forEach((node) => {
    node.textContent = t(node.getAttribute("data-i18n"));
  });
  root.querySelectorAll("[data-i18n-html]").forEach((node) => {
    node.innerHTML = t(node.getAttribute("data-i18n-html"));
  });
  root.querySelectorAll("[data-i18n-attr]").forEach((node) => {
    for (const pair of node.getAttribute("data-i18n-attr").split(",")) {
      const [attr, key] = pair.split(":").map((x) => x.trim());
      if (attr && key) node.setAttribute(attr, t(key));
    }
  });
}

// --- Validation ledger (data-driven from data/verification-matrix.json) --------
// The complete machine-checked matrix, rendered as a filterable table where every row
// deep-links to its test, module source and committed provenance on GitHub. The JSON is
// generated from src/verification.rs and pinned to it in CI, so the table cannot drift
// from the code. Loaded once and memoised; the capability cards reuse it (by matrix
// requirement) to grow their own evidence deep-links.
let _ledgerPromise = null;
const LEDGER_BY_REQ = new Map();

// External-source registry: maps the named oracles (Orekit, ANISE, RTKLIB, scipy,
// NIST SP 1065, …) to their canonical homepage/repo/dataset, so every oracle mention
// in the ledger links out to the actual external thing it was checked against. Loaded
// once and memoised; see web/data/oracle-references.json (validated in CI).
let _oracleRefsPromise = null;
let ORACLE_REFS = [];
function loadOracleRefs() {
  if (!_oracleRefsPromise) {
    _oracleRefsPromise = fetch("data/oracle-references.json", { cache: "no-store" })
      .then((r) => (r.ok ? r.json() : Promise.reject(new Error(`oracle-refs ${r.status}`))))
      .then((a) => {
        ORACLE_REFS = Array.isArray(a) ? a : [];
        return ORACLE_REFS;
      })
      .catch((e) => {
        console.warn("[kshana] oracle references unavailable:", e);
        return [];
      });
  }
  return _oracleRefsPromise;
}

// The external sources an oracle string names (case-sensitive substring match,
// de-duplicated by URL), each as a {label, url} link.
function oracleSources(oracleText) {
  if (!oracleText) return [];
  const out = [];
  const seen = new Set();
  for (const e of ORACLE_REFS) {
    if (seen.has(e.url)) continue;
    if ((e.match || []).some((m) => oracleText.includes(m))) {
      out.push(e);
      seen.add(e.url);
    }
  }
  return out;
}
function loadLedger() {
  if (!_ledgerPromise) {
    _ledgerPromise = fetch("data/verification-matrix.json", { cache: "no-store" })
      .then((r) => (r.ok ? r.json() : Promise.reject(new Error(`ledger ${r.status}`))))
      .then((d) => {
        for (const row of d.rows || []) LEDGER_BY_REQ.set(row.requirement, row);
        return d;
      })
      .catch((e) => {
        console.warn("[kshana] validation ledger unavailable:", e);
        return null;
      });
  }
  return _ledgerPromise;
}

// The card → matrix-requirement map (web/data/card-matrix-map.json, generated and
// pinned by a doc-sync test), so each capability card can surface the exact ledger
// rows that back it. Loaded once and memoised.
let _cardMapPromise = null;
const CARD_MATRIX = new Map();
function loadCardMap() {
  if (!_cardMapPromise) {
    _cardMapPromise = fetch("data/card-matrix-map.json", { cache: "no-store" })
      .then((r) => (r.ok ? r.json() : Promise.reject(new Error(`card-map ${r.status}`))))
      .then((m) => {
        for (const [name, reqs] of Object.entries(m)) CARD_MATRIX.set(name, reqs);
        return m;
      })
      .catch((e) => {
        console.warn("[kshana] card→matrix map unavailable:", e);
        return null;
      });
  }
  return _cardMapPromise;
}

// The standard → matrix-requirement map (web/data/standards-matrix-map.json), so each
// "Standards & interoperability" card can link its VALIDATED badge to the ledger row
// that actually proves it. Loaded once and memoised.
let _stdMapPromise = null;
const STANDARDS_MATRIX = new Map();
function loadStandardsMap() {
  if (!_stdMapPromise) {
    _stdMapPromise = fetch("data/standards-matrix-map.json", { cache: "no-store" })
      .then((r) => (r.ok ? r.json() : Promise.reject(new Error(`std-map ${r.status}`))))
      .then((m) => {
        for (const [name, req] of Object.entries(m)) STANDARDS_MATRIX.set(name, req);
        return m;
      })
      .catch((e) => {
        console.warn("[kshana] standards→matrix map unavailable:", e);
        return null;
      });
  }
  return _stdMapPromise;
}

// Build the "Evidence" block for a capability card: each backing matrix row, with a
// link to its ledger entry and deep-links to its test, module source and provenance.
// Returns null when no mapping/ledger data is available (the card still renders).
function buildCapEvidence(cardName) {
  const reqs = CARD_MATRIX.get(cardName);
  if (!reqs || !reqs.length || !LEDGER_BY_REQ.size) return null;
  const wrap = document.createElement("div");
  wrap.className = "cap-ev";
  const head = document.createElement("p");
  head.className = "cap-ev-head";
  head.textContent = t("cap.evidence");
  wrap.append(head);
  let any = false;
  for (const req of reqs) {
    const row = LEDGER_BY_REQ.get(req);
    if (!row) continue;
    any = true;
    const item = document.createElement("div");
    item.className = "cap-ev-item";
    const top = document.createElement("div");
    top.className = "cap-ev-top";
    const a = document.createElement("a");
    a.className = "cap-ev-req";
    a.href = `#ldg-${slug(req)}`;
    a.textContent = row.requirement;
    a.title = "Jump to this row in the validation ledger";
    a.addEventListener("click", (e) => {
      e.stopPropagation();
      const d = el("ldg-details"); // open the fold so the targeted row is visible
      if (d) d.open = true;
    });
    const pill = document.createElement("span");
    pill.className = `pill ${statusClass(row.status)}`;
    pill.textContent = String(row.status).toLowerCase();
    top.append(a, pill);
    item.append(top);
    const links = document.createElement("div");
    links.className = "cap-ev-links";
    for (const t of row.test_links || []) links.append(ledgerLink(t.path, t.url, "test"));
    for (const m of row.module_links || []) links.append(ledgerLink(m.path, m.url, "src"));
    if (row.fixture) {
      links.append(ledgerLink(`${row.fixture.path}/`, row.fixture.url, "fixture"));
      if (row.fixture.notice_url) links.append(ledgerLink("NOTICE", row.fixture.notice_url, "notice"));
    }
    if (links.childNodes.length) {
      links.addEventListener("click", (e) => e.stopPropagation());
      item.append(links);
    }
    wrap.append(item);
  }
  return any ? wrap : null;
}

// The per-capability "docs ↗" target: this card's own primary evidence on GitHub
// (its source module, else its reference test) resolved through the card→matrix map,
// so every non-runnable card links to distinct documentation rather than one generic
// page. Returns null when the card has no mapped ledger row (caller falls back).
function capDocsHref(c) {
  const reqs = CARD_MATRIX.get(c.name);
  if (!reqs || !reqs.length || !LEDGER_BY_REQ.size) return null;
  for (const req of reqs) {
    const row = LEDGER_BY_REQ.get(req);
    if (!row) continue;
    const link = (row.module_links && row.module_links[0]) || (row.test_links && row.test_links[0]);
    if (link && link.url) return link.url;
  }
  return null;
}

// A small GitHub-blob link chip (path text, opens in a new tab). `kind` styles the icon.
function ledgerLink(label, url, kind) {
  const a = document.createElement("a");
  a.className = `ldg-link ldg-link-${kind}`;
  a.href = url;
  a.target = "_blank";
  a.rel = "noopener noreferrer";
  a.textContent = label;
  return a;
}

function statusClass(status) {
  const s = String(status).toLowerCase();
  return s === "validated" ? "validated" : s === "modelled" ? "modelled" : "partner";
}

async function renderLedger() {
  const body = el("ldg-body");
  if (!body) return;
  const [data] = await Promise.all([loadLedger(), loadOracleRefs()]);
  if (!data) {
    const tr = document.createElement("tr");
    const td = document.createElement("td");
    td.colSpan = 4;
    td.className = "ldg-empty";
    td.textContent = t("ledger.empty");
    tr.append(td);
    body.append(tr);
    return;
  }

  const totalEl = el("ldg-total");
  if (totalEl) totalEl.textContent = String(data.summary.total);
  const summaryCount = el("ldg-summary-count");
  if (summaryCount) summaryCount.textContent = t("ledger.summary.count", { total: data.summary.total });

  // Build one table row per matrix row.
  const rows = data.rows.map((r) => {
    const tr = document.createElement("tr");
    tr.className = `ldg-row ldg-${statusClass(r.status)}`;
    tr.id = `ldg-${slug(r.requirement)}`;
    // searchable text blob (lowercased)
    tr._q = [r.requirement, r.capability, r.module, r.oracle, r.oracle_kind, r.status]
      .join(" ")
      .toLowerCase();
    tr._status = statusClass(r.status);

    // Capability cell: requirement (bold) + one-line capability.
    const cap = document.createElement("td");
    cap.className = "ldg-cap";
    cap.dataset.label = t("ledger.col.capability");
    const req = document.createElement("div");
    req.className = "ldg-req";
    req.textContent = r.requirement;
    const sub = document.createElement("div");
    sub.className = "ldg-sub";
    sub.textContent = r.capability;
    cap.append(req, sub);

    // Status cell: pill.
    const st = document.createElement("td");
    st.dataset.label = t("ledger.col.status");
    const pill = document.createElement("span");
    pill.className = `pill ${statusClass(r.status)}`;
    pill.textContent = String(r.status).toLowerCase();
    st.append(pill);

    // Oracle cell: oracle_kind badge + oracle prose.
    const orc = document.createElement("td");
    orc.className = "ldg-oracle";
    orc.dataset.label = t("ledger.col.oracle");
    if (r.oracle_kind) {
      const k = document.createElement("span");
      k.className = "ldg-kind";
      k.textContent = r.oracle_kind;
      orc.append(k);
    }
    if (r.oracle) {
      const o = document.createElement("span");
      o.className = "ldg-otext";
      o.textContent = r.oracle;
      orc.append(o);
    }
    if (!r.oracle && !r.oracle_kind) orc.textContent = "—";
    // External sources the oracle names → links to the actual dataset/library/standard.
    const srcs = oracleSources(r.oracle);
    if (srcs.length) {
      const sw = document.createElement("div");
      sw.className = "ldg-sources";
      const lbl = document.createElement("span");
      lbl.className = "ldg-sources-label";
      lbl.textContent = t("ledger.sources");
      sw.append(lbl);
      for (const s of srcs) sw.append(ledgerLink(s.label, s.url, "ext"));
      orc.append(sw);
    }

    // Evidence cell: deep-links to tests, module source and committed provenance.
    const ev = document.createElement("td");
    ev.className = "ldg-ev";
    ev.dataset.label = t("ledger.col.evidence");
    for (const t of r.test_links || []) ev.append(ledgerLink(t.path, t.url, "test"));
    for (const mlink of r.module_links || []) ev.append(ledgerLink(mlink.path, mlink.url, "src"));
    if (r.fixture) {
      ev.append(ledgerLink(`${r.fixture.path}/`, r.fixture.url, "fixture"));
      if (r.fixture.notice_url) ev.append(ledgerLink("NOTICE", r.fixture.notice_url, "notice"));
    }
    if (!ev.childNodes.length) ev.textContent = "—";

    tr.append(cap, st, orc, ev);
    return tr;
  });
  body.replaceChildren(...rows);

  // Status filter chips (All + one per status) and the text search.
  const search = el("ldg-search");
  const statuses = el("ldg-statuses");
  let activeStatus = "all";
  const counts = { all: rows.length, validated: 0, modelled: 0, partner: 0 };
  for (const tr of rows) counts[tr._status] += 1;

  function apply() {
    const q = (search && search.value ? search.value : "").trim().toLowerCase();
    let shown = 0;
    for (const tr of rows) {
      const okStatus = activeStatus === "all" || tr._status === activeStatus;
      const okText = !q || tr._q.includes(q);
      const vis = okStatus && okText;
      tr.hidden = !vis;
      if (vis) shown += 1;
    }
    const tally = el("ldg-tally");
    if (tally) tally.textContent = t("ledger.tally", { shown, total: rows.length });
  }

  if (statuses) {
    const defs = [
      ["all", t("ledger.chip.all", { count: counts.all })],
      ["validated", t("ledger.chip.validated", { count: counts.validated })],
      ["modelled", t("ledger.chip.modelled", { count: counts.modelled })],
      ["partner", t("ledger.chip.partner", { count: counts.partner })],
    ];
    statuses.replaceChildren();
    for (const [key, lbl] of defs) {
      const b = document.createElement("button");
      b.type = "button";
      b.className = "ldg-chip" + (key === "all" ? " active" : "");
      b.dataset.status = key;
      b.textContent = lbl;
      b.addEventListener("click", () => {
        activeStatus = key;
        for (const c of statuses.children) c.classList.toggle("active", c === b);
        apply();
      });
      statuses.append(b);
    }
  }
  if (search) search.addEventListener("input", apply);
  apply();

  // If the page was opened on a specific ledger row (or one is targeted later), make
  // sure the fold is open so the row is actually visible.
  openLedgerForRowHash();
}

// Open the (collapsed-by-default) ledger fold and scroll to a row when the URL hash
// targets one — "#ldg-<slug>" is a row; "#ledger" is just the section.
function openLedgerForRowHash() {
  if (!location.hash.startsWith("#ldg-")) return;
  const d = el("ldg-details");
  if (d) d.open = true;
  const row = document.getElementById(location.hash.slice(1));
  if (row) row.scrollIntoView({ block: "center" });
}
if (typeof window !== "undefined") window.addEventListener("hashchange", openLedgerForRowHash);

// Stable id/anchor slug from a requirement string.
function slug(s) {
  return String(s)
    .toLowerCase()
    .replace(/[^\w]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

async function main() {
  // Apply static i18n strings first (the dynamic ledger/card strings use t() directly).
  applyI18n();
  renderCapabilities();
  renderLedger();

  // The "Validation" nav link is the evidence doorway into the explorer: it scrolls
  // to the section (native #validation anchor), filters to the dataset-checked rows,
  // and opens the active domain's evidence drawer.
  const valLink = document.querySelector('.nav a[href="#validation"]');
  if (valLink) {
    valLink.addEventListener("click", () => {
      const cb = el("xp-validated-only");
      if (cb && !cb.checked) {
        cb.checked = true;
        cb.dispatchEvent(new Event("change"));
      }
      const root = el("explore");
      const g = root && root._activeDomain ? root._activeDomain() : null;
      const panel = g ? root.querySelector(`.xp-panel[data-domain="${g}"]`) : null;
      const ev = panel ? panel.querySelector(".xp-ev") : null;
      if (ev) ev.open = true;
    });
  }

  for (const [file, label] of SCENARIOS) {
    const opt = document.createElement("option");
    opt.value = file;
    opt.textContent = label;
    selectEl.appendChild(opt);
  }

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
  el("json-download").addEventListener("click", downloadJson);
  el("json-copy").addEventListener("click", copyJson);
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
