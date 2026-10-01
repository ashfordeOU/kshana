// SPDX-License-Identifier: AGPL-3.0-only
//
// Capture the kshana.dev screenshots used by the README's "The site" strip, in the light and
// the dark theme.
//
// Three views of the site as it ships in web/: the Home hero (the mission console and the
// name line), Evidence "Published research" (the arXiv papers built on the engine) and
// Editions "Same engine, amplified" (what Kshana Pro adds). Each shot is the top of that page
// section at a 1440 px wide window, at twice the CSS pixel size, with motion reduced so the
// picture is the resting state. Nothing is drawn or edited here. tools/readme_shots.py turns
// the PNG files into the README's strip (docs/assets/readme/site/).
//
// Usage:
//   node tools/capture_site_shots.mjs --site http://127.0.0.1:8861/ --out <dir>
//
// Requires Node.js 18+ and the `playwright` package (with its Chromium browser installed),
// resolvable from this script's location: copy the script next to a node_modules that has it.
// Serve the site over HTTP first (for example the pages.yml staging tree of web/).
// Writes <out>/site-<name>-<theme>.png and <out>/shots.json (URL, section, crop box).

import { chromium } from "playwright";
import { writeFileSync, mkdirSync } from "node:fs";
import { join } from "node:path";

const arg = (name, dflt) => {
  const i = process.argv.indexOf(`--${name}`);
  return i > 0 && process.argv[i + 1] ? process.argv[i + 1] : dflt;
};
const site = arg("site", "http://127.0.0.1:8861/");
const out = arg("out", "site-shots");
mkdirSync(out, { recursive: true });

// name, page, the section to frame, the tallest crop (CSS px)
const SHOTS = [
  { name: "home", page: "index.html", section: "#top", maxHeight: 820 },
  { name: "research", page: "evidence.html", section: "#cite", maxHeight: 820 },
  { name: "editions", page: "editions.html", section: "#pro", maxHeight: 820 },
];
const VIEWPORT = { width: 1440, height: 1000 };
const SCALE = 2;

const browser = await chromium.launch();
const record = [];
for (const theme of ["light", "dark"]) {
  const ctx = await browser.newContext({ viewport: VIEWPORT, deviceScaleFactor: SCALE, colorScheme: theme, reducedMotion: "reduce" });
  // The site reads a remembered theme before first paint; set both keys it may use.
  await ctx.addInitScript((t) => {
    try { localStorage.setItem("kshana-theme", t); localStorage.setItem("theme", t); } catch (e) { /* private mode */ }
  }, theme);
  const page = await ctx.newPage();
  for (const s of SHOTS) {
    const url = new URL(s.page, site).href;
    await page.goto(url, { waitUntil: "networkidle" });
    await page.evaluate((t) => document.documentElement.setAttribute("data-theme", t), theme);
    await page.waitForSelector(s.section, { timeout: 60000 });
    // Scroll through the page once so every reveal-on-scroll element has been shown.
    await page.evaluate(async () => {
      for (let y = 0; y < document.body.scrollHeight; y += 600) { scrollTo(0, y); await new Promise((r) => setTimeout(r, 60)); }
      scrollTo(0, 0);
    });
    await page.evaluate(() => document.fonts && document.fonts.ready);
    await page.waitForTimeout(1500);
    const box = await page.evaluate(([sel, maxH]) => {
      const r = document.querySelector(sel).getBoundingClientRect();
      const y = Math.max(0, Math.floor(r.top + scrollY));
      return { x: 0, y, width: innerWidth, height: Math.min(Math.ceil(r.height), maxH) };
    }, [s.section, s.maxHeight]);
    // Hide the sticky header when the section is not at the top of the page.
    if (box.y > 0) {
      await page.addStyleTag({ content: "header, .nav, .site-nav, [data-sticky] { visibility: hidden !important; }" });
    }
    const file = `site-${s.name}-${theme}.png`;
    await page.screenshot({ path: join(out, file), clip: box, fullPage: true });
    record.push({ file, url, section: s.section, theme, viewport: VIEWPORT, device_scale_factor: SCALE, crop_css_px: box });
    console.log(file, JSON.stringify(box));
  }
  await ctx.close();
}
await browser.close();
writeFileSync(join(out, "shots.json"), JSON.stringify(record, null, 2) + "\n");
