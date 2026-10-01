// SPDX-License-Identifier: AGPL-3.0-only
//
// Capture the Kshana Studio screenshots used by the README, in the light and the dark theme.
//
// Two flow shots show how the Studio is used: the start screen (domain tiles and the search
// across scenarios, domains and fields) and the dashboard after a run (the five numbered
// steps Choose, Set, Run, Read results and Share, the key figures and the panels), both at a
// 1440 px wide window, plus one phone-width shot (390 px) of the bottom step bar. Each panel shot opens one bundled scenario, lets the engine run it in
// the browser (WebAssembly), selects the named result panel, moves the replay to a stated
// frame where the visual has one, and saves the panel row plus the first visual card of that
// panel. Every shot is a PNG at twice the CSS pixel size. Nothing is drawn or edited here: the pictures are
// what the Studio shows for a real run. The README's copies under docs/assets/readme/studio/
// are these PNG files scaled to at most 1600 px wide and saved as JPEG (quality 82).
//
// Usage:
//   node tools/capture_studio_shots.mjs --studio http://127.0.0.1:8851/ --out <dir>
//
// Requires Node.js 18+ and the `playwright` package (with its Chromium browser installed),
// resolvable from this script's location: copy the script next to a node_modules that has it. The Studio must be served over HTTP.
// Writes <out>/studio-<name>-<theme>.png and <out>/shots.json (URL, tab, frame, crop box).

import { chromium } from "playwright";
import { writeFileSync, mkdirSync } from "node:fs";
import { join } from "node:path";

const arg = (name, dflt) => {
  const i = process.argv.indexOf(`--${name}`);
  return i > 0 && process.argv[i + 1] ? process.argv[i + 1] : dflt;
};
const studio = arg("studio", "http://127.0.0.1:8851/");
const out = arg("out", "studio-shots");
mkdirSync(out, { recursive: true });

// name, scenario, tab, replay frame (null: leave the Studio's default frame)
const SHOTS = [
  { name: "lband", scenario: "l-band-waterfall-jamming", tab: "spectrum", frame: 31 },
  { name: "coverage", scenario: "constellation-multi-gnss-coverage", tab: "coverage", frame: "mid" },
  { name: "leo-chain", scenario: "leo-pnt-end-to-end", tab: "leo-chain", frame: null },
];
const VIEWPORT = { width: 1920, height: 1400 };
const FLOW_VIEWPORT = { width: 1440, height: 1000 };
const SCALE = 2;
// name, query, what to wait for, the element whose bottom ends the crop
const FLOW = [
  { name: "start", query: "?start=1", ready: "#start:not([hidden]) #start-tiles > *", bottom: null },
  { name: "dashboard", query: "?scenario=l-band-waterfall-jamming&tab=spectrum", ready: "#kpis-wrap:not([hidden]) #figs > *", bottom: "panel" },
];

// The phone shot: a 390 px wide screen after a run, with the bottom step bar.
const PHONE_VIEWPORT = { width: 390, height: 844 };
const PHONE = { name: "phone-steps", query: "?scenario=l-band-waterfall-jamming&tab=spectrum", ready: "#kpis-wrap:not([hidden]) #figs > *" };

const browser = await chromium.launch();
const record = [];
for (const theme of ["light", "dark"]) {
  const ctx = await browser.newContext({ viewport: VIEWPORT, deviceScaleFactor: SCALE, colorScheme: theme, reducedMotion: "reduce" });
  // The Studio reads a remembered theme from localStorage before first paint.
  await ctx.addInitScript((t) => { try { localStorage.setItem("kshana-theme", t); } catch (e) { /* private mode */ } }, theme);
  // The first-visit hint is closed: the numbered steps it explains are in the shot.
  await ctx.addInitScript(() => { try { localStorage.setItem("kshana-studio-hint", "done"); } catch (e) { /* private mode */ } });
  const page = await ctx.newPage();
  await page.setViewportSize(FLOW_VIEWPORT);
  for (const f of FLOW) {
    const url = new URL(f.query, studio).href;
    await page.goto(url, { waitUntil: "networkidle" });
    await page.waitForSelector(f.ready, { timeout: 60000 });
    await page.waitForTimeout(2000);
    const box = await page.evaluate((bottom) => {
      let h = innerHeight;
      if (bottom === "panel") {
        const p = [...document.querySelectorAll("[role=tabpanel]")].find((e) => !e.hidden && e.offsetHeight > 0);
        const c = p && [...p.querySelectorAll(".card")].find((e) => e.querySelector("svg:not(.icon), canvas, .chain") && !e.querySelector(".player"));
        if (c) h = Math.ceil(c.getBoundingClientRect().bottom + scrollY + 16);
      }
      return { x: 0, y: 0, width: innerWidth, height: Math.min(h, 1500) };
    }, f.bottom);
    const file = `studio-${f.name}-${theme}.png`;
    await page.screenshot({ path: join(out, file), clip: box, fullPage: true });
    record.push({ file, url, scenario: null, tab: null, replay_frame: null, theme, viewport: FLOW_VIEWPORT, device_scale_factor: SCALE, crop_css_px: box });
    console.log(file, JSON.stringify(box));
  }
  // One phone-width shot: after a run, the five steps become the step bar fixed to the
  // bottom of the screen (.mob). The crop is the whole phone screen.
  {
    await page.setViewportSize(PHONE_VIEWPORT);
    const url = new URL(PHONE.query, studio).href;
    await page.goto(url, { waitUntil: "networkidle" });
    await page.waitForSelector(PHONE.ready, { timeout: 60000 });
    await page.waitForSelector(".mob", { state: "visible", timeout: 60000 });
    await page.waitForTimeout(2000);
    const box = { x: 0, y: 0, width: PHONE_VIEWPORT.width, height: PHONE_VIEWPORT.height };
    const file = `studio-${PHONE.name}-${theme}.png`;
    await page.screenshot({ path: join(out, file), clip: box });
    record.push({ file, url, scenario: "l-band-waterfall-jamming", tab: null, replay_frame: null, theme, viewport: PHONE_VIEWPORT, device_scale_factor: SCALE, crop_css_px: box });
    console.log(file, JSON.stringify(box));
  }
  await page.setViewportSize(VIEWPORT);
  for (const s of SHOTS) {
    const url = new URL(`?scenario=${s.scenario}&tab=${s.tab}`, studio).href;
    await page.goto(url, { waitUntil: "networkidle" });
    // The run is finished when the requested tab is selected and its panel has a visual card.
    await page.waitForSelector(`#tab-${s.tab}[aria-selected="true"]`, { timeout: 60000 });
    await page.waitForFunction(() => {
      const p = [...document.querySelectorAll("[role=tabpanel]")].find((e) => !e.hidden && e.offsetHeight > 0);
      return p && p.querySelector("svg, canvas, .chain");
    }, null, { timeout: 60000 });
    await page.waitForTimeout(1500);
    const frameSet = await page.evaluate((frame) => {
      if (frame === null) return null;
      const p = [...document.querySelectorAll("[role=tabpanel]")].find((e) => !e.hidden && e.offsetHeight > 0);
      const r = p && p.querySelector(".player input[type=range]");
      if (!r) return null;
      const k = frame === "mid" ? Math.round(Number(r.max) / 2) : Math.min(Number(r.max), frame);
      r.value = String(k);
      r.dispatchEvent(new Event("input", { bubbles: true }));
      return k;
    }, s.frame);
    await page.waitForTimeout(800);
    const box = await page.evaluate((tab) => {
      const tl = document.getElementById(`tab-${tab}`).closest("[role=tablist]").getBoundingClientRect();
      const p = [...document.querySelectorAll("[role=tabpanel]")].find((e) => !e.hidden && e.offsetHeight > 0);
      // The first card of the panel that holds a visual is its main visual, with its own header
      // and controls (the replay bar above it, where the panel has one, is kept in the crop).
      const c = ([...p.querySelectorAll(".card")].find((e) => e.querySelector("svg, canvas, .chain") && !e.querySelector(".player input[type=range]")) || p.querySelector(".card")).getBoundingClientRect();
      const pad = 16;
      const pl = p.querySelector(".player");
      const right = Math.max(c.right, pl ? pl.getBoundingClientRect().right : 0);
      const x = Math.max(0, Math.floor(c.left - pad)), y = Math.max(0, Math.floor(tl.top + scrollY - pad));
      return { x, y, width: Math.ceil(right + pad) - x, height: Math.ceil(c.bottom + scrollY + 8) - y };
    }, s.tab);
    const file = `studio-${s.name}-${theme}.png`;
    await page.screenshot({ path: join(out, file), clip: box, fullPage: true });
    record.push({ file, url, scenario: s.scenario, tab: s.tab, replay_frame: frameSet, theme, viewport: VIEWPORT, device_scale_factor: SCALE, crop_css_px: box });
    console.log(file, JSON.stringify(box), frameSet);
  }
  await ctx.close();
}
await browser.close();
writeFileSync(join(out, "shots.json"), JSON.stringify(record, null, 2) + "\n");
