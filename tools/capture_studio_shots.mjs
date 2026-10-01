// SPDX-License-Identifier: AGPL-3.0-only
//
// Capture the Kshana Studio screenshots used by the README, in the light and the dark theme.
//
// Three shots, each at a 1440 px wide window, after the engine has loaded in the browser
// (WebAssembly) and the Studio says "Live engine":
//   home      the Simple view's opening screen: the questions it answers, a recorded result
//             on the map, and every area of the engine with its evidence mix
//   task      the Simple view on one scenario (integrity-raim): the answer first, in one plain
//             sentence, its key figures, at most five settings, and the folded sections
//             "Advanced settings", "How this is computed" and "For researchers"
//   advanced  the Advanced view (the full dashboard) after a run of
//             constellation-multi-gnss-coverage: the scenario library, the steps, the key figures
//             with their PASS chips and the panel row, down to the first visual card of the
//             Coverage panel
// Every shot is a PNG at twice the CSS pixel size. Nothing is drawn or edited here: the pictures
// are what the Studio shows for a real run. The README's copies under docs/assets/readme/studio/
// are these PNG files scaled to at most 1600 px wide and saved as JPEG (quality 82) by
// tools/readme_shots.py.
//
// Usage:
//   node tools/capture_studio_shots.mjs --studio http://127.0.0.1:8851/studio/ --out <dir>
//
// Requires Node.js 18+ and the `playwright` package (with its Chromium browser installed),
// resolvable from this script's location: copy the script next to a node_modules that has it.
// The Studio must be served over HTTP (web/ after web/build.sh, for example).
// Writes <out>/studio-<name>-<theme>.png and <out>/shots.json (URL, scenario, tab, crop box).

import { chromium } from "playwright";
import { writeFileSync, mkdirSync } from "node:fs";
import { join } from "node:path";

const arg = (name, dflt) => {
  const i = process.argv.indexOf(`--${name}`);
  return i > 0 && process.argv[i + 1] ? process.argv[i + 1] : dflt;
};
const studio = arg("studio", "http://127.0.0.1:8851/studio/").replace(/\/?$/, "/");
const out = arg("out", "studio-shots");
mkdirSync(out, { recursive: true });

const VIEWPORT = { width: 1440, height: 1000 };
const SCALE = 2;
// name, address under the Studio, scenario and tab (for the record), what "ready" means, and
// the element whose bottom ends the crop (null: the window)
const SHOTS = [
  { name: "home", path: "", scenario: null, tab: null, ready: "home", bottom: null },
  { name: "task", path: "?scenario=integrity-raim", scenario: "integrity-raim", tab: null, ready: "task", bottom: null },
  { name: "advanced", path: "advanced/?scenario=constellation-multi-gnss-coverage&tab=coverage", scenario: "constellation-multi-gnss-coverage", tab: "coverage", ready: "advanced", bottom: "panel" },
];

const browser = await chromium.launch();
const record = [];
for (const theme of ["light", "dark"]) {
  const ctx = await browser.newContext({ viewport: VIEWPORT, deviceScaleFactor: SCALE, colorScheme: theme, reducedMotion: "reduce" });
  await ctx.addInitScript((t) => {
    try {
      localStorage.setItem("kshana-theme", t); // read before first paint
      localStorage.setItem("kshana-studio-view", "simple"); // a bare address opens the remembered view
      localStorage.setItem("kshana-studio-hint", "done"); // the Advanced view's first-visit hint
    } catch (e) { /* private mode */ }
  }, theme);
  const page = await ctx.newPage();
  for (const s of SHOTS) {
    const url = new URL(s.path || "index.html", studio).href.replace(/index\.html$/, "");
    await page.goto(url, { waitUntil: "networkidle" });
    await page.waitForFunction((ready) => {
      const live = /^Live engine/.test((document.getElementById("engine-label") || {}).textContent || "");
      if (!live) return false;
      if (ready === "advanced") { const k = document.getElementById("kpis-wrap"); return !!k && !k.hidden && !!document.querySelector("#figs > *"); }
      const scr = document.body.dataset.screen;
      if (ready === "home") return scr === "home" && !!document.querySelector("#hero-map svg") && document.querySelectorAll("#tiles .tile").length > 10;
      const big = (document.getElementById("m-big") || {}).textContent || "";
      return scr === "task" && /\S/.test(big) && !/^Opening/.test(big) && /Live result/.test(document.body.textContent);
    }, s.ready, { timeout: 120000 });
    await page.waitForTimeout(2500);
    const box = await page.evaluate((bottom) => {
      let h = innerHeight;
      if (bottom === "panel") {
        const p = [...document.querySelectorAll("[role=tabpanel]")].find((e) => !e.hidden && e.offsetHeight > 0);
        const c = p && [...p.querySelectorAll(".card")].find((e) => e.querySelector("svg:not(.icon), canvas, .chain") && !e.querySelector(".player"));
        if (c) h = Math.ceil(c.getBoundingClientRect().bottom + scrollY + 16);
      }
      // never past the page's own height: the Advanced view scrolls inside its panes, not as a page
      return { x: 0, y: 0, width: innerWidth, height: Math.min(h, 1500, Math.max(innerHeight, document.documentElement.scrollHeight)) };
    }, s.bottom);
    const file = `studio-${s.name}-${theme}.png`;
    await page.screenshot({ path: join(out, file), clip: box, fullPage: box.height > VIEWPORT.height });
    record.push({ file, url, scenario: s.scenario, tab: s.tab, replay_frame: null, theme, viewport: VIEWPORT, device_scale_factor: SCALE, crop_css_px: box });
    console.log(file, JSON.stringify(box));
  }
  await ctx.close();
}
await browser.close();
writeFileSync(join(out, "shots.json"), JSON.stringify(record, null, 2) + "\n");
