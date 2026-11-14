// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): the Charts view, a gallery of every chart type of the
// library on real engine output (demo-data.json, made by apps/desktop/scripts/chart-demo-data.mjs
// from engine runs of the bundled scenarios). It is an extension of the shell (README,
// "Extending the shell"): a view, a sidebar item and a command palette entry.
//
// The time cursor: the window's clock (lib/clock.mjs, 0.42 U15) is injected when it is
// there (window.KshanaClock, the same interface: now, range, subscribe, set, setRange);
// until then this view makes a small one of its own for each data set's time span.
import { createChart } from "./chart2d.mjs";
import { createChart3D } from "./chart3d.mjs";
import { createDual } from "./dual.mjs";
import { createLinkGroup } from "./link.mjs";
import * as P from "./presets.mjs";
import { covariance } from "./mat3d.mjs";
import { fmtClock } from "./scale.mjs";

/** A clock with the time cursor's interface: { now, range, subscribe(fn), set(t), setRange(a, b) }. */
export function makeClock(range) {
  let now = range[0], r = [range[0], range[1]];
  const subs = new Set();
  const tell = () => { for (const f of [...subs]) { try { f(now); } catch (e) { console.error(e); } } };
  return {
    get now() { return now; }, get range() { return r; },
    subscribe(fn) { subs.add(fn); return () => subs.delete(fn); },
    set(t) { now = Math.max(range[0], Math.min(range[1], +t)); tell(); },
    setRange(a, b) { r = [Math.min(a, b), Math.max(a, b)]; if (now < r[0] || now > r[1]) now = r[0]; tell(); },
    full: range,
  };
}

const h = (tag, props = {}, ...kids) => {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (v === undefined || v === null || v === false) continue;
    if (k === "class") n.className = v; else if (k === "text") n.textContent = v; else if (k.startsWith("on")) n.addEventListener(k.slice(2), v); else n.setAttribute(k, v);
  }
  for (const c of kids.flat()) if (c) n.append(c.nodeType ? c : document.createTextNode(String(c)));
  return n;
};

/** A scrubber for a clock: a slider, the time, play and pause, the selected range. */
function clockBar(label, clock, step) {
  const out = h("output", { text: fmtClock(clock.now) });
  const range = h("span", { class: "muted" });
  const input = h("input", { type: "range", min: String(clock.full[0]), max: String(clock.full[1]), step: String(step), value: String(clock.now), "aria-label": `${label}: time cursor` });
  let playing = false;
  const play = h("button", { type: "button", class: "kc-btn", "aria-pressed": "false", text: "Play" });
  input.addEventListener("input", () => clock.set(+input.value));
  const reduced = typeof matchMedia === "function" && matchMedia("(prefers-reduced-motion: reduce)").matches;
  play.addEventListener("click", () => {
    playing = !playing; play.setAttribute("aria-pressed", String(playing)); play.textContent = playing ? "Pause" : "Play";
    let last = performance.now();
    const tick = (ts) => {
      if (!playing || !out.isConnected) return;
      const [a, b] = clock.range, span = b - a;
      let t = clock.now + ((ts - last) / 1000) * (span / (reduced ? 60 : 20));
      last = ts;
      if (t > b) t = a;
      clock.set(t);
      requestAnimationFrame(tick);
    };
    requestAnimationFrame(tick);
  });
  const reset = h("button", { type: "button", class: "kc-btn", text: "Whole span", title: "Set the range back to the whole span" });
  reset.addEventListener("click", () => clock.setRange(clock.full[0], clock.full[1]));
  clock.subscribe(() => {
    input.value = String(clock.now); out.textContent = fmtClock(clock.now);
    const [a, b] = clock.range;
    range.textContent = a === clock.full[0] && b === clock.full[1] ? "" : `range ${fmtClock(a)} – ${fmtClock(b)}`;
  });
  return h("div", { class: "kc-clock" }, h("span", { text: label }), input, out, play, reset, range);
}

let DATA = null;
async function data() {
  if (DATA) return DATA;
  const r = await fetch(new URL("./demo-data.json", import.meta.url));
  if (!r.ok) throw new Error(`demo data: HTTP ${r.status}`);
  DATA = await r.json();
  return DATA;
}

const SHORT = (id, system) => {
  const n = String(id).match(/(\d+)$/);
  return `${system === "galileo" ? "E" : system.startsWith("gps") ? "G" : "S"}${n ? n[1].padStart(2, "0") : id}`;
};

/** Draw the gallery into el (once). Returns the charts by name. */
export async function drawGallery(el, { clock = null } = {}) {
  const D = await data();
  const charts = {};
  const runClock = clock || makeClock([0, 43200]);
  const capClock = makeClock([D.waterfall.t[0], D.waterfall.t[D.waterfall.t.length - 1]]);
  const timing = createLinkGroup("timing"), integrity = createLinkGroup("integrity"), rf = createLinkGroup("rf");
  const cell = (cls = "") => h("div", { class: cls });
  const grid = h("div", { class: "kc-grid" });
  el.replaceChildren(h("div", { class: "kc-gallery" },
    h("h1", { text: "Charts" }),
    h("p", { class: "kc-lede", text: `Every chart type of the Desktop's chart library, on the output of engine runs (${D.engine}). Hover for exact values; click to pin; Alt-click twice for two markers and their difference; wheel to zoom, drag to pan, Shift-drag to box zoom, drag an axis to zoom it alone, double-click for the full view; Ctrl- or ⌘-drag selects epochs, highlighted in the linked charts. Each chart saves its visible data as CSV and itself as SVG or PNG.` }),
    clockBar("Run time", runClock, 60),
    grid,
    h("p", { class: "kc-help", text: `Sources: ${Object.values(D.sources).join(" · ")}.` })));
  const add = (cls = "") => { const c = cell(cls); grid.append(c); return c; };

  // 1. time series with p5–p95 bands, linked to the holdover chart
  charts.ensemble = createChart(add(), {
    type: "xy", title: "Time error · clock ensemble", subtitle: "p50 with p5–p95 band", x: { label: "time", unit: "s", time: true }, y: { label: "time error", unit: "ns" },
    series: D.ensemble.map((s, i) => ({ id: `e${i}`, label: s.label, color: i ? "nav" : "tim", x: s.t, y: s.p50, lo: s.p05, hi: s.p95, bandLabel: "p5–p95", unit: "ns" })),
    link: timing, linkX: true, clock: runClock,
  });
  // 2. holdover time error with the GNSS outage
  const ho = D.holdover;
  const outages = []; { let a = null; ho[0].gnss.forEach((g, i) => { if (g !== "nominal" && a === null) a = ho[0].t[i]; if (g === "nominal" && a !== null) { outages.push([a, ho[0].t[i]]); a = null; } }); if (a !== null) outages.push([a, ho[0].t[ho[0].t.length - 1]]); }
  charts.holdover = createChart(add(), {
    type: "xy", title: "Holdover · time error", subtitle: "GNSS outage shaded", x: { label: "time", unit: "s", time: true }, y: { label: "time error", unit: "ns" },
    series: ho.map((s, i) => ({ id: `h${i}`, label: s.label, color: i ? "nav" : "tim", x: s.t, y: s.err, unit: "ns" })),
    overlays: [...outages.map(([a, b]) => ({ kind: "span", x0: a, x1: b, color: "int", alpha: 0.1, label: "GNSS denied" })), ...(D.threshold_ns ? [{ kind: "hline", y: D.threshold_ns, label: `threshold ${D.threshold_ns} ns`, color: "bad", fit: false }] : [])],
    link: timing, linkX: true, clock: runClock,
  });
  // 3–4. integrity: protection levels over time, linked (brushing) to the Stanford plot
  const ig = D.integrity;
  charts.levels = createChart(add(), {
    type: "xy", title: "Integrity · protection levels", subtitle: `AL H ${ig.al_h_m} m · V ${ig.al_v_m} m`, x: { label: "time", unit: "s", time: true }, y: { label: "protection level", unit: "m" },
    series: [{ id: "hpl", label: "HPL", color: "tim", x: ig.t, y: ig.hpl, unit: "m" }, { id: "vpl", label: "VPL", color: "pro", x: ig.t, y: ig.vpl, unit: "m" },
      { id: "nvis", label: "satellites", kind: "step", color: "ink3", x: ig.t, y: ig.nvis, axis: "y2", unit: "" }],
    y2: { label: "satellites visible" },
    overlays: [{ kind: "hline", y: ig.al_h_m, label: `HAL ${ig.al_h_m} m`, color: "bad" }, { kind: "hline", y: ig.al_v_m, label: `VAL ${ig.al_v_m} m`, color: "nav" }],
    link: integrity, linkX: false, clock: runClock,
  });
  charts.stanford = createChart(add(), { ...P.stanford({ error: ig.error, pl: ig.pl, t: ig.t, alertLimit: ig.alert_limit_m, unit: "m", title: "Stanford plot · protection level", region: ig.region }), link: integrity });
  // 5. Allan deviation with confidence intervals
  charts.adev = createChart(add(), P.loglog({ title: "Allan deviation", yLabel: "σy(τ)", yUnit: "", curves: D.adev.map((c, i) => ({ id: `a${i}`, label: c.label, tau: c.tau, dev: c.adev, lo: c.lo, hi: c.hi, color: i ? "nav" : "tim", bandLabel: "confidence interval" })) }));
  // 6. MTIE against the mask, with TDEV
  charts.mtie = createChart(add(), P.loglog({ title: "MTIE · TDEV", yLabel: "MTIE, TDEV", yUnit: "ns", mask: { tau: D.mtieMask.tau, value: D.mtieMask.ns, label: D.mtieMask.label },
    curves: [{ id: "mtie", label: "MTIE", tau: D.mtie.tau, dev: D.mtie.mtie, color: "tim" }, { id: "tdev", label: "TDEV", tau: D.tdev.tau, dev: D.tdev.tdev, color: "itg", mask: false }] }));
  // 7. bars: time to exceed each holdover budget
  charts.bars = createChart(add(), {
    type: "xy", title: "Holdover budgets · time to exceed", subtitle: "24 h ePRTC holdover", x: { label: "budget", categories: D.budgets.map((b) => `${b.limit_ns} ns`) }, y: { label: "time to exceed", unit: "h" },
    series: [{ id: "b", kind: "bar", label: "time to exceed", color: "tim", x: D.budgets.map((_, i) => i), y: D.budgets.map((b) => b.hours), unit: "h", extra: (i) => [["budget", D.budgets[i].name], ["source", D.budgets[i].source]] }],
  });
  // 8–9. spectrum (the waterfall's row at the capture cursor, and the max hold), linked in x to the waterfall
  const W = D.waterfall;
  const rowAt = (t) => { let j = 0; while (j + 1 < W.t.length && W.t[j + 1] <= t) j++; return j; };
  const maxHold = W.f_mhz.map((_, i) => Math.max(...W.psd.map((r) => r[i])));
  const rfCell = add("wide");
  rfCell.append(clockBar("Capture time", capClock, 1));
  const specSpec = (t) => ({
    type: "xy", title: "Spectrum · L band", subtitle: `row at ${fmtClock(W.t[rowAt(t)])} · max hold`, x: { label: "frequency", unit: "MHz" }, y: { label: "PSD", unit: "dBW/Hz" },
    series: [{ id: "row", label: `row at cursor`, color: "int", x: W.f_mhz, y: W.psd[rowAt(t)], unit: "dBW/Hz" }, { id: "max", label: "max hold", color: "ink3", dash: [3, 3], width: 1, x: W.f_mhz, y: maxHold, unit: "dBW/Hz" }],
    overlays: [{ kind: "hline", y: W.noise_floor, label: "noise floor", color: "ink3", fit: false }, ...W.bands.filter((b, i, a) => a.findIndex((c) => c.centre_mhz === b.centre_mhz) === i).map((b) => ({ kind: "vline", x: b.centre_mhz, label: b.name, color: "nav", dash: [2, 4] }))],
    link: rf, linkX: true, height: 170,
  });
  charts.spectrum = createChart(rfCell, specSpec(capClock.now));
  capClock.subscribe((t) => charts.spectrum.update(specSpec(t)));
  charts.waterfall = createDual(rfCell, { ...P.waterfall({ title: "Waterfall · L band", f: W.f_mhz, t: W.t, z: W.psd, unit: "dBW/Hz" }), subtitle: W.jammers.map((j) => j.name).join(" · "), link: rf, linkX: true, clock: capClock, height: 260 },
    { xs: W.f_mhz, ys: W.t, zs: W.psd, x: { label: "frequency", unit: "MHz" }, y: { label: "time", unit: "s" }, z: { label: "PSD", unit: "dBW/Hz" }, map: "night", unit: "dBW/Hz", label: "PSD" });
  // 10. heatmap of a sweep (2D ↔ 3D)
  const sw = D.sweep;
  charts.sweep = createDual(add(), { ...P.heatmap({ title: "Sweep · holdover", xLabels: sw.x.map((v) => v.toPrecision(3)), yLabels: sw.y.map((v) => `${v} m`), z: sw.z, unit: "s", label: sw.metric, xTitle: sw.xKey, yTitle: sw.yKey, map: "viridis", format: (v) => `${Math.round(v)} s` }), subtitle: `${sw.yKey} × ${sw.xKey}` },
    { xs: sw.x, ys: sw.y, zs: sw.z, x: { label: sw.xKey }, y: { label: sw.yKey, unit: "m" }, z: { label: "holdover", unit: "s" }, unit: "s", label: "holdover", map: "viridis" });
  // 11. sky plot with trails up to the run clock
  charts.sky = createChart(add(), { ...P.sky({ title: `Sky · ${D.sky.site}`, mask: D.sky.mask_deg, tracks: D.sky.tracks.map((tr) => ({
    id: tr.id, label: tr.id, short: SHORT(tr.id, tr.system), group: tr.system, groupLabel: tr.system === "galileo" ? "Galileo" : "GPS", color: tr.system === "galileo" ? "gal" : "gps",
    az: tr.az, el: tr.el, t: tr.t, visible: tr.visible, extra: (i) => [["visible", tr.visible[i] ? "yes" : "no (masked)"]],
  })) }), clock: runClock, height: 300 });
  // 12. 3D trajectory coloured by altitude, with an Earth wireframe
  const O = D.orbit, R = 6378.137;
  const pts = O.xyz.flat(), alt = O.xyz.map((p) => Math.hypot(...p) - R), tt = O.xyz.map((_, i) => i * O.step_s);
  charts.orbit = createChart3D(add(), {
    title: `Orbit · ${O.label} (ECI)`, subtitle: "coloured by altitude", aspect: "equal", height: 300, clock: runClock,
    x: { label: "x", unit: "km" }, y: { label: "y", unit: "km" }, z: { label: "z", unit: "km" },
    layers: [{ kind: "sphere", id: "earth", label: "Earth (6378 km)", r: R, color: "ink3", alpha: 0.35 },
      { kind: "line", id: "track", label: "trajectory", pts, values: alt, valueLabel: "altitude", unit: "km", map: "viridis", t: tt }],
    camera: { pitch: 0.35, yaw: -1.1 },
  });
  // 13. 3D scatter with covariance ellipsoids (Monte Carlo position samples, ENU)
  const K95 = Math.sqrt(7.814727903251178); // 95 % of a 3D Gaussian
  const cols = ["tim", "nav", "itg", "pro"];
  charts.scatter3d = createChart3D(add(), {
    title: "Position error · Monte Carlo", subtitle: "ENU samples, 95 % ellipsoids", aspect: "equal", height: 300,
    x: { label: "east", unit: "m" }, y: { label: "north", unit: "m" }, z: { label: "up", unit: "m" },
    layers: D.mc.flatMap((m, k) => [
      { kind: "points", id: `mc${m.t}`, label: `samples t = ${fmtClock(m.t)}`, pts: m.samples.flat(), color: cols[k], size: 3, rows: () => [["epoch", fmtClock(m.t)]] },
      { kind: "ellipsoid", id: `el${m.t}`, label: `95 % t = ${fmtClock(m.t)}`, centre: covariance(m.samples.flat()).mean, cov: m.cov, k: K95, color: cols[k], alpha: 0.18 },
    ]),
  });
  return { charts, clocks: { run: runClock, capture: capClock }, groups: { timing, integrity, rf } };
}

// ------------------------------------------------------------------ the extension
function attach(shell) {
  if (!shell || shell.version !== 1) return;
  // The gallery is drawn once and kept: opening the view again shows the same charts (with
  // their zoom, pins and markers), and a render of the shell never draws a second set.
  let page = null, made = null;
  shell.registerView("charts", {
    title: "Charts",
    render(el) {
      if (page && el.firstChild === page) return;
      if (page) { el.replaceChildren(page); return; }
      page = h("div", { class: "kc-page" }, h("p", { class: "kc-help", style: "padding:24px", text: "Loading the chart data…" }));
      el.replaceChildren(page);
      made = drawGallery(page, { clock: typeof window !== "undefined" && window.KshanaClock ? window.KshanaClock : null }).catch((e) => {
        page.replaceChildren(h("p", { class: "kc-help", style: "padding:24px", text: `The chart gallery could not load its data: ${e.message}` }));
      });
      if (typeof window !== "undefined") window.__kshanaCharts = made;
    },
  });
  shell.registerNavSection({ heading: "", items: [{ id: "charts", label: "Charts", icon: "scorecards", view: "charts" }] });
  shell.registerPaletteGroup({ heading: "Charts", items: [{ id: "gallery", label: "Open the chart gallery", keywords: "charts plot graph 3d heatmap waterfall stanford allan sky", onSelect: () => shell.show("charts") }] });
}
if (typeof window !== "undefined") {
  if (window.KshanaShell) attach(window.KshanaShell);
  else window.addEventListener("kshana-shell-ready", (e) => attach(e.detail), { once: true });
}
