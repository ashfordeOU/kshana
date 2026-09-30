// SPDX-License-Identifier: AGPL-3.0-only
//
// Capture the Kshana Studio screenshots used by the README, in the light and the dark theme.
//
// Each shot opens one bundled scenario in Kshana Studio, lets the engine run it in the
// browser (WebAssembly), selects the named result tab, moves the replay to a stated frame
// where the visual has one, and saves the tab row plus the first visual card of that tab
// as a PNG at twice the CSS pixel size. Nothing is drawn or edited here: the pictures are
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
const SCALE = 2;

const browser = await chromium.launch();
const record = [];
for (const theme of ["light", "dark"]) {
  const ctx = await browser.newContext({ viewport: VIEWPORT, deviceScaleFactor: SCALE, colorScheme: theme, reducedMotion: "reduce" });
  // The Studio reads a remembered theme from localStorage before first paint.
  await ctx.addInitScript((t) => { try { localStorage.setItem("kshana-theme", t); } catch (e) { /* private mode */ } }, theme);
  const page = await ctx.newPage();
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
      // The first card of the tab is its main visual, with its own header and controls.
      const c = p.querySelector(".card").getBoundingClientRect();
      const pad = 16;
      const x = Math.max(0, Math.floor(c.left - pad)), y = Math.max(0, Math.floor(tl.top + scrollY - pad));
      return { x, y, width: Math.ceil(c.right + pad) - x, height: Math.ceil(c.bottom + scrollY + 8) - y };
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
