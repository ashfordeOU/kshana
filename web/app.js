// SPDX-License-Identifier: Apache-2.0
import init, { run, summary, chart_svg, version } from "./pkg/kshana.js";

// Scenario catalogue: file in ./scenarios/ (copied from the repo at build) and a
// friendly label. The first entry is also embedded below so the page works on
// first paint and offline.
const SCENARIOS = [
  ["clock-holdover.toml", "Clock holdover — chip-scale vs optical clock"],
  ["imu-deadreckoning.toml", "Inertial dead-reckoning — cold-atom vs nav-grade"],
  ["timetransfer.toml", "Time transfer — optical vs RF link"],
  ["hybrid-pnt.toml", "Hybrid PNT — combined clock + inertial suite"],
  ["orbit-gnss-challenged.toml", "GNSS availability from orbital geometry"],
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
const tomlEl = el("toml");
const selectEl = el("scenario");
const resultsEl = document.querySelector(".results");
const errorEl = el("error");

let chartUrl = null;

function showError(message) {
  errorEl.textContent = message;
  errorEl.hidden = false;
  resultsEl.hidden = true;
}

function clearError() {
  errorEl.hidden = true;
  errorEl.textContent = "";
}

// Render the engine-generated SVG as an <img>. SVG loaded via <img> cannot run
// script, so even a hand-crafted scenario string cannot inject behaviour here.
function renderChart(svgText) {
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
}

function runScenario() {
  clearError();
  const src = tomlEl.value;
  try {
    el("summary").textContent = summary(src);
    renderChart(chart_svg(src));
    el("json").textContent = JSON.stringify(JSON.parse(run(src)), null, 2);
    resultsEl.hidden = false;
  } catch (e) {
    showError(String(e && e.message ? e.message : e));
  }
}

async function loadScenario(file) {
  try {
    const res = await fetch(`scenarios/${file}`, { cache: "no-store" });
    if (!res.ok) throw new Error(String(res.status));
    tomlEl.value = await res.text();
    runScenario();
  } catch {
    // No server / file missing: keep whatever is already in the editor.
    statusEl.textContent = `Could not load ${file}; edit the panel and run.`;
  }
}

async function main() {
  for (const [file, label] of SCENARIOS) {
    const opt = document.createElement("option");
    opt.value = file;
    opt.textContent = label;
    selectEl.appendChild(opt);
  }
  tomlEl.value = DEFAULT_TOML;

  try {
    await init();
    el("version").textContent = version();
    statusEl.textContent = "Ready — runs locally in your browser.";
    runBtn.disabled = false;
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
  selectEl.addEventListener("change", () => loadScenario(selectEl.value));
  runScenario(); // show a result immediately
}

main();
