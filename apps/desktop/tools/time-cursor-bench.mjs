#!/usr/bin/env node
// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop: the time cursor's frame-timing test and screenshots (0.42 U7, U15).
//
// Serves the staged frontend (apps/desktop/dist, from build-frontend.sh) from a server inside
// this process, opens it in Chromium through Playwright with the Desktop's native bridge
// stood in for by the engine's command line (each run_all and export_scenario is a real
// `kshana` run into a temporary directory), then:
//   1. runs a 24 h scenario sampled at 1 Hz (the bundled ephemeris example with step_s = 1
//      and duration_s = 86399: 86 400 epochs), opens it on the time cursor and scrubs the
//      whole day across the timeline strip, one position per animation frame, measuring the
//      time each frame's work takes and the interval between frames;
//   2. with --shots <dir>, saves screenshots of the run view (plot, map and timeline) at two
//      cursor times, with a range selected, and in the light theme.
//
//   apps/desktop/build-frontend.sh
//   cargo build --bin kshana
//   NODE_PATH="$(npm root -g)" node apps/desktop/tools/time-cursor-bench.mjs \
//       --kshana target/debug/kshana [--frames 600] [--shots /tmp/shots]
//
// The test fails when the 95th percentile of a frame's work is over 16.7 ms (60 fps). It needs
// a browser and the engine binary, so it is not part of the CI's node test step; the pure
// per-frame work is benchmarked there (apps/desktop/shell/lib/clock.test.mjs).
import { createServer } from "node:http";
import { readFileSync, writeFileSync, mkdtempSync, existsSync, statSync, mkdirSync, rmSync } from "node:fs";
import { join, dirname, extname, resolve, normalize } from "node:path";
import { tmpdir } from "node:os";
import { execFileSync } from "node:child_process";
import { createHash } from "node:crypto";
import { createRequire } from "node:module";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const repo = resolve(here, "..", "..", "..");
const arg = (name, d) => { const i = process.argv.indexOf(name); return i > 0 ? process.argv[i + 1] : d; };
const KSHANA = resolve(arg("--kshana", join(repo, "target", "debug", "kshana")));
const FRAMES = Number(arg("--frames", 600));
const SHOTS = arg("--shots", "");
const DIST = join(repo, "apps", "desktop", "dist");
if (!existsSync(join(DIST, "studio", "desktop", "index.html"))) { console.error("run apps/desktop/build-frontend.sh first"); process.exit(2); }
if (!existsSync(KSHANA)) { console.error(`no engine binary at ${KSHANA} (cargo build --bin kshana)`); process.exit(2); }
const { chromium } = createRequire(import.meta.url)("playwright");

// ---------------------------------------------------------------- the engine, by its command line
const work = mkdtempSync(join(tmpdir(), "kshana-time-cursor-"));
const runs = new Map();
function runCli(toml) {
  const id = createHash("sha256").update(toml).digest("hex").slice(0, 16);
  if (runs.has(id)) return runs.get(id);
  const dir = join(work, id);
  mkdirSync(dir, { recursive: true });
  writeFileSync(join(dir, "s.toml"), toml);
  let out = "", err = "";
  try {
    out = execFileSync(KSHANA, ["s.toml", "--export", "geojson"], { cwd: dir, maxBuffer: 1 << 26, encoding: "utf8", stdio: ["ignore", "pipe", "pipe"] });
  } catch (e) {
    out = String(e.stdout || "");
    err = String(e.stderr || e.message);
  }
  const read = (f) => (existsSync(join(dir, f)) ? readFileSync(join(dir, f), "utf8") : null);
  const json = read("s.result.json");
  const r = json === null ? { error: (err || out).trim().split("\n").pop() } : {
    json, svg: read("s.chart.svg") || "", summary: out.split("\n")[0] || "", csv: "",
    geojson: read("s.geojson"),
  };
  runs.set(id, r);
  return r;
}
const version = execFileSync(KSHANA, ["--version"], { encoding: "utf8" }).trim().split(/\s+/).pop();
const NATIVE = ["run", "run_all", "summary", "chart_svg", "export_scenario", "export_formats", "version", "register_catalogue"];
function engineCall(name, args) {
  if (name === "version") return version;
  if (name === "register_catalogue") return null;
  const r = runCli(String(args[0] || ""));
  if (r.error) throw new Error(r.error);
  if (name === "run_all") return JSON.stringify({ json: r.json, svg: r.svg, summary: r.summary, csv: r.csv });
  if (name === "run") return r.json;
  if (name === "summary") return r.summary;
  if (name === "chart_svg") return r.svg;
  if (name === "export_scenario") {
    if (!r.geojson) throw new Error("nothing to place on the Earth");
    return JSON.stringify({ format: "geojson", spec_url: "", files: [{ suffix: ".geojson", encoding: "utf-8", content: r.geojson }] });
  }
  throw new Error(`${name} is not stood in for`);
}

// ---------------------------------------------------------------- the static server
const TYPES = { ".html": "text/html", ".js": "text/javascript", ".mjs": "text/javascript", ".css": "text/css", ".json": "application/json", ".svg": "image/svg+xml", ".woff2": "font/woff2", ".png": "image/png", ".wasm": "application/wasm" };
const server = createServer((req, res) => {
  if (req.method === "POST" && req.url === "/__engine") {
    let body = "";
    req.on("data", (c) => { body += c; });
    req.on("end", () => {
      try {
        const { cmd, args = {} } = JSON.parse(body);
        let value;
        if (cmd === "engine_native_fns") value = NATIVE;
        else if (cmd === "engine_call") value = engineCall(args.name, args.args || []);
        else if (cmd === "devices_list") value = [];
        else value = null;
        res.writeHead(200, { "content-type": "application/json" });
        res.end(JSON.stringify({ ok: true, value }));
      } catch (e) {
        res.writeHead(200, { "content-type": "application/json" });
        res.end(JSON.stringify({ ok: false, error: String(e.message || e) }));
      }
    });
    return;
  }
  const p = normalize(decodeURIComponent(new URL(req.url, "http://x").pathname)).replace(/^([/\\])+/, "");
  const f = join(DIST, p);
  if (!f.startsWith(DIST) || !existsSync(f) || statSync(f).isDirectory()) { res.writeHead(404); res.end(); return; }
  res.writeHead(200, { "content-type": TYPES[extname(f)] || "application/octet-stream" });
  res.end(readFileSync(f));
});
await new Promise((r) => server.listen(0, "127.0.0.1", r));
const base = `http://127.0.0.1:${server.address().port}`;

// The bridge the page sees: window.__TAURI_INTERNALS__.invoke, answered by the server above.
const bridge = `window.__TAURI_INTERNALS__ = { invoke: (cmd, args) => fetch("/__engine", { method: "POST", body: JSON.stringify({ cmd, args }) })
  .then((r) => r.json()).then((x) => (x.ok ? x.value : Promise.reject(new Error(x.error)))) };`;

const browser = await chromium.launch();
let failed = false;
try {
  const ctx = await browser.newContext({ viewport: { width: 1440, height: 900 }, deviceScaleFactor: 1 });
  await ctx.addInitScript(bridge);
  const page = await ctx.newPage();
  page.on("pageerror", (e) => console.error("page error:", e.message));
  const offline = [];
  page.on("request", (r) => { const u = r.url(); if (!u.startsWith(base) && !u.startsWith("data:")) offline.push(u); });

  const openTab = async (scenario, theme = "dark") => {
    await page.goto(`${base}/studio/desktop/index.html?scenario=${scenario}`);
    await page.evaluate((th) => { document.documentElement.dataset.theme = th; }, theme);
    await page.waitForSelector("#btn-run:not([disabled])", { timeout: 600000 });
  };
  const showTimeline = async () => {
    await page.locator(".doc-head .seg button", { hasText: "Timeline" }).click();
    await page.waitForSelector(".lv .lv-map canvas, .lv .lv-plot canvas");
    await page.waitForTimeout(1500);
  };
  const stripSeek = async (f) => {
    const box = await page.locator(".lv-strip").boundingBox();
    await page.mouse.click(box.x + 8 + f * (box.width - 16), box.y + box.height / 2);
    await page.waitForTimeout(200);
  };
  const shot = async (name) => { if (SHOTS) { mkdirSync(SHOTS, { recursive: true }); await page.screenshot({ path: join(SHOTS, name) }); console.log(`  shot ${join(SHOTS, name)}`); } };

  if (SHOTS) {
    await openTab("ephemeris");
    await showTimeline();
    await stripSeek(0.18); await shot("01-ephemeris-cursor-a.png");
    await stripSeek(0.62); await shot("02-ephemeris-cursor-b.png");
    const box = await page.locator(".lv-strip").boundingBox();
    await page.keyboard.down("Shift");
    await page.mouse.move(box.x + 8 + 0.3 * (box.width - 16), box.y + box.height / 2);
    await page.mouse.down(); await page.mouse.move(box.x + 8 + 0.55 * (box.width - 16), box.y + box.height / 2, { steps: 8 }); await page.mouse.up();
    await page.keyboard.up("Shift");
    await page.keyboard.press("m");
    await page.waitForTimeout(300);
    await shot("03-ephemeris-range.png");
    await openTab("maritime-strait-jamming");
    await showTimeline();
    await stripSeek(0.4); await shot("04-jamming-area-night.png");
    await openTab("maritime-strait-jamming", "light");
    await showTimeline();
    await stripSeek(0.7); await shot("05-jamming-area-chart-light.png");
    await openTab("ephemeris", "light");
    await showTimeline();
    await stripSeek(0.45); await shot("06-ephemeris-chart-light.png");
    await page.locator(".doc-head .seg button", { hasText: "Map" }).click();
    await page.waitForTimeout(1200);
    await shot("07-ephemeris-map-view-light.png");
  }

  // ---------- the frame test: 24 h at 1 Hz
  const toml = readFileSync(join(repo, "scenarios", "ephemeris.toml"), "utf8").replace(/^step_s = .*$/m, "step_s = 1.0").replace(/^duration_s = .*$/m, "duration_s = 86399.0");
  const file = join(work, "ephemeris-24h-1hz.toml");
  writeFileSync(file, toml);
  await page.goto(`${base}/studio/desktop/index.html`);
  await page.evaluate(() => { document.documentElement.dataset.theme = "dark"; });
  await page.waitForFunction(() => document.querySelector(".chip") && /\d/.test(document.querySelector(".chip").textContent));
  await page.locator(".nav-item", { hasText: "Files" }).click();
  await page.setInputFiles("#file-in", file);
  await page.waitForSelector("#btn-run:not([disabled])", { timeout: 900000 });
  await showTimeline();
  const epochs = await page.evaluate(() => document.querySelector(".lv-strip").getAttribute("aria-valuemax"));
  const res = await page.evaluate(async (frames) => {
    const strip = document.querySelector(".lv-strip");
    const r = strip.getBoundingClientRect();
    const y = r.top + r.height / 2;
    const ev = (type, x) => new PointerEvent(type, { clientX: x, clientY: y, pointerId: 1, bubbles: true, button: 0, isPrimary: true });
    strip.dispatchEvent(ev("pointerdown", r.left + 8));
    const work = [], gaps = [];
    let last = 0;
    await new Promise((done) => {
      let f = 0;
      const step = (now) => {
        if (last) gaps.push(now - last);
        last = now;
        const x = r.left + 8 + ((f % frames) / frames) * (r.width - 16);
        const t0 = performance.now();
        strip.dispatchEvent(ev("pointermove", x));
        work.push(performance.now() - t0);
        if (++f < frames) requestAnimationFrame(step); else done();
      };
      requestAnimationFrame(step);
    });
    strip.dispatchEvent(ev("pointerup", r.right - 8));
    const q = (a, p) => { const s = [...a].sort((m, n) => m - n); return s[Math.min(s.length - 1, Math.floor(p * s.length))]; };
    return { frames, workP50: q(work, 0.5), workP95: q(work, 0.95), workMax: Math.max(...work), gapP50: q(gaps, 0.5), gapP95: q(gaps, 0.95) };
  }, FRAMES);
  if (SHOTS) await shot("08-24h-1hz-scrubbed.png");
  console.log(`24 h at 1 Hz (${Number(epochs) + 1} s span, engine ${version}): ${res.frames} scrub frames; work per frame p50 ${res.workP50.toFixed(2)} ms, p95 ${res.workP95.toFixed(2)} ms, max ${res.workMax.toFixed(2)} ms; frame interval p50 ${res.gapP50.toFixed(1)} ms, p95 ${res.gapP95.toFixed(1)} ms`);
  if (!(res.workP95 <= 16.7)) { console.error("FAIL: a scrub frame's work is over the 60 fps budget"); failed = true; }
  if (offline.length) { console.error(`FAIL: requests outside the app: ${[...new Set(offline)].join(", ")}`); failed = true; }
  else console.log("no request left the app (the map's base layers are bundled)");
} finally {
  await browser.close();
  server.close();
  rmSync(work, { recursive: true, force: true });
}
process.exit(failed ? 1 : 0);
