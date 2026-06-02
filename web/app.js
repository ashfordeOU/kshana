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

let adevUrl = null;

// Build a log-log Allan-deviation chart (SVG string) from one or two named
// adev_curve arrays [{tau_s, adev, n_samples}]. Pure data -> geometry; rendered
// via a blob <img> like the engine chart, so no markup is injected into the DOM.
function adevSvg(curves) {
  const pts = curves.flatMap((c) => c.curve);
  const taus = pts.map((p) => p.tau_s).filter((v) => v > 0);
  const advs = pts.map((p) => p.adev).filter((v) => v > 0);
  if (taus.length < 2 || advs.length < 2) return null;
  const W = 760, H = 320, ml = 64, mr = 16, mt = 16, mb = 44;
  const x0 = Math.log10(Math.min(...taus)), x1 = Math.log10(Math.max(...taus));
  const y0 = Math.log10(Math.min(...advs)), y1 = Math.log10(Math.max(...advs));
  const px = (t) => ml + ((Math.log10(t) - x0) / (x1 - x0 || 1)) * (W - ml - mr);
  const py = (a) => mt + (1 - (Math.log10(a) - y0) / (y1 - y0 || 1)) * (H - mt - mb);
  const colors = ["#2dd4bf", "#f59e0b"];
  let s = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" font-family="system-ui,sans-serif" font-size="11">`;
  s += `<rect width="${W}" height="${H}" fill="#0c1118"/>`;
  // decade gridlines + labels
  for (let e = Math.floor(x0); e <= Math.ceil(x1); e++) {
    const x = px(10 ** e);
    s += `<line x1="${x}" y1="${mt}" x2="${x}" y2="${H - mb}" stroke="#1b2230"/>`;
    s += `<text x="${x}" y="${H - mb + 16}" text-anchor="middle" fill="#8b97ad">10^${e}s</text>`;
  }
  for (let e = Math.floor(y0); e <= Math.ceil(y1); e++) {
    const y = py(10 ** e);
    s += `<line x1="${ml}" y1="${y}" x2="${W - mr}" y2="${y}" stroke="#1b2230"/>`;
    s += `<text x="${ml - 8}" y="${y + 4}" text-anchor="end" fill="#8b97ad">10^${e}</text>`;
  }
  s += `<text x="${ml}" y="${H - 6}" fill="#8b97ad">averaging time &#964; (s)</text>`;
  s += `<text x="14" y="${mt + 6}" fill="#8b97ad" transform="rotate(-90 14 ${mt + 6})">&#963;&#7464;(&#964;)</text>`;
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
  const svg = curves.length ? adevSvg(curves) : null;
  if (!svg) { wrap.hidden = true; return; }
  if (adevUrl) URL.revokeObjectURL(adevUrl);
  adevUrl = URL.createObjectURL(new Blob([svg], { type: "image/svg+xml" }));
  const host = el("adev");
  let img = host.querySelector("img");
  if (!img) { img = document.createElement("img"); img.alt = "Allan deviation chart"; host.replaceChildren(img); }
  img.src = adevUrl;
  wrap.hidden = false;
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
    renderChart(chart_svg(src));
    const result = JSON.parse(run(src));
    renderAdev(result);
    el("json").textContent = JSON.stringify(result, null, 2);
    resultsEl.hidden = false;
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
