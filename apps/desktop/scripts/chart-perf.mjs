#!/usr/bin/env node
// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): frame timing of the 2D chart in Chromium, with Playwright.
// One foreground process: an in-process static server for apps/desktop/shell/lib/chart and a
// headless Chromium. Each case pans and zooms the chart on every animation frame (a full
// redraw: decimation, axes, series) for a fixed number of frames and reports the frame rate
// and the mean and 95th-percentile draw time.
//
//   node apps/desktop/scripts/chart-perf.mjs [--frames 240] [--json]
//
// Targets (U30): 1,000,000 points at 30 fps or more, 100,000 points at 60 fps. Headless
// Chromium paces animation frames at about 60 Hz, so the frame rate tops out there; the draw
// time says how much room is left. Exit status 1 when a target is missed.
import { createRequire } from "node:module";
import { createServer } from "node:http";
import { readFileSync, existsSync } from "node:fs";
import { join, dirname, extname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const require = createRequire(import.meta.url);
const { chromium } = require("playwright");
const LIB = resolve(dirname(fileURLToPath(import.meta.url)), "..", "shell", "lib", "chart");
const arg = (k, d) => { const i = process.argv.indexOf(k); return i > 0 ? process.argv[i + 1] : d; };
const FRAMES = +arg("--frames", 240);

const PAGE = `<!doctype html><meta charset="utf-8"><link rel="stylesheet" href="/lib/chart/chart.css">
<style>body{margin:0;background:#07080E} #host{width:1200px} .kc-stage{height:420px}</style>
<div id="host"></div>
<script type="module">
import { createChart } from "/lib/chart/chart2d.mjs";
window.measure = async (kind, n, frames) => {
  const host = document.getElementById("host"); host.replaceChildren();
  const x = new Float64Array(n), y = new Float64Array(n);
  let s = 7; const r = () => ((s = (s * 1103515245 + 12345) & 0x7fffffff) / 0x7fffffff);
  for (let i = 0; i < n; i++) { x[i] = i; y[i] = Math.sin(i / (n / 40)) * 50 + (r() - 0.5) * 20 + (i % 9973 === 0 ? 120 : 0); }
  const series = kind === "scatter" ? [{ id: "a", kind: "scatter", label: "a", x, y: y.map((v, i) => v + Math.sin(i) * 30), size: 3 }]
    : [{ id: "a", label: "a", x, y }, { id: "b", label: "b", x, y: y.map((v) => v * 0.5 + 10) }];
  const c = createChart(host, { type: "xy", title: kind + " " + n, x: { label: "index" }, y: { label: "value" }, series });
  await new Promise((res) => requestAnimationFrame(() => requestAnimationFrame(res)));
  const v0 = c.view, span = v0.x[1] - v0.x[0];
  const times = [], draws = [];
  let last = performance.now();
  await new Promise((done) => {
    let k = 0;
    const tick = (ts) => {
      // pan through the data and zoom in and out: every frame redraws the whole chart
      const f = 0.55 + 0.45 * Math.cos(k / 30), mid = v0.x[0] + span * (0.5 + 0.3 * Math.sin(k / 50));
      // the chart redraws in its own animation-frame callback (as with a wheel or a drag); its last draw time is read here
      if (k) draws.push(c.stats.baseMs);
      c.setView({ x: [mid - (span * f) / 2, mid + (span * f) / 2] });
      times.push(ts - last); last = ts;
      if (++k < frames) requestAnimationFrame(tick); else done();
    };
    requestAnimationFrame(tick);
  });
  times.shift();
  const mean = (a) => a.reduce((p, q) => p + q, 0) / a.length;
  const p95 = (a) => a.slice().sort((p, q) => p - q)[Math.floor(a.length * 0.95)];
  // hover at the centre: the readout of the nearest point per series
  const t1 = performance.now(); const items = c.pick(600, 200); const pickMs = performance.now() - t1;
  return { kind, n, frames: times.length, fps: 1000 / mean(times), drawMeanMs: mean(draws), drawP95Ms: p95(draws), pickMs, items: items.length };
};
window.ready = true;
</script>`;

const TYPES = { ".mjs": "text/javascript", ".css": "text/css", ".json": "application/json" };
const srv = createServer((req, res) => {
  const u = req.url.split("?")[0];
  if (u === "/" || u === "/perf.html") { res.writeHead(200, { "Content-Type": "text/html" }); res.end(PAGE); return; }
  const f = u.startsWith("/lib/chart/") ? join(LIB, u.slice(11)) : null;
  if (!f || !f.startsWith(LIB) || !existsSync(f)) { res.writeHead(404); res.end(); return; }
  res.writeHead(200, { "Content-Type": TYPES[extname(f)] || "application/octet-stream" }); res.end(readFileSync(f));
});
await new Promise((r) => srv.listen(0, "127.0.0.1", r));
const browser = await chromium.launch({ args: process.argv.includes("--gpu") ? [] : ["--disable-gpu-vsync"] });
const results = [];
try {
  const page = await browser.newPage({ viewport: { width: 1280, height: 600 }, deviceScaleFactor: 2 });
  page.on("pageerror", (e) => console.error("page error:", e.message));
  await page.goto(`http://127.0.0.1:${srv.address().port}/perf.html`);
  await page.waitForFunction(() => window.ready);
  for (const [kind, n, target] of [["line", 1_000_000, 30], ["line", 100_000, 60], ["scatter", 100_000, 60]]) {
    const r = await page.evaluate(([k, nn, fr]) => window.measure(k, nn, fr), [kind, n, FRAMES]);
    // the frame rate is capped by the ~60 Hz animation-frame pacing; allow 5 % for timer jitter
    r.target = target; r.pass = r.fps >= target * 0.95 && r.drawMeanMs < 1000 / target;
    results.push(r);
  }
} finally { await browser.close(); srv.close(); }
if (process.argv.includes("--json")) console.log(JSON.stringify(results, null, 2));
else for (const r of results) console.log(`${r.pass ? "PASS" : "FAIL"} ${r.kind} ${r.n.toLocaleString("en")} points: ${r.fps.toFixed(1)} fps (target ${r.target}), draw ${r.drawMeanMs.toFixed(1)} ms mean, ${r.drawP95Ms.toFixed(1)} ms p95, hover pick ${r.pickMs.toFixed(2)} ms, device pixel ratio 2`);
process.exit(results.every((r) => r.pass) ? 0 : 1);
