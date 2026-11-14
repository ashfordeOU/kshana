// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop wording (0.42 U4): tests of apps/desktop/wording.mjs, and a scan of a staged
// Desktop frontend (web/studio and the shell copied the way build-frontend.sh copies them,
// then rewritten) for the phrases the Desktop must not say. web/ itself is not changed.
// Run: node apps/desktop/wording.test.mjs
import assert from "node:assert/strict";
import { mkdtempSync, cpSync, readFileSync, rmSync, mkdirSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { RULES, BANNED, rewrite, scan, rewriteTree, scanTree } from "./wording.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, "..", "..");
let n = 0;
const test = async (name, fn) => { try { await fn(); } catch (e) { e.message = `${name}: ${e.message}`; throw e; } n++; };

await test("the banned phrases are found, in any case", () => {
  for (const s of ["Runs in your browser.", "files stay in your browser", "Starting the engine in this browser…", "does not run in the browser", "written to your browser's memory", "browser-native", "asks no server", "so nothing is installed", "Try in the browser"]) assert.ok(scan(s).length, s);
  for (const s of ["The engine runs natively on this computer.", "Open the editions page", "a browser or host that blocks WebAssembly", "Works offline", "a server it never asks"]) assert.equal(scan(s).length, 0, s);
  assert.equal(scan("line one\nRuns in your browser")[0].line, 2);
});
await test("sentences become the Desktop's: native for the question view, this computer for the tool pages", () => {
  assert.equal(rewrite("Runs in your browser. Nothing is uploaded.").text, "The engine runs natively on this computer. Nothing is uploaded.");
  assert.equal(rewrite("The last run took { $ms } ms in your browser. Nothing is uploaded.").text, "The last run took { $ms } ms on this computer. Nothing is uploaded.");
  assert.equal(rewrite("The Rust engine runs in your browser as WebAssembly. Nothing is uploaded.").text, "The Rust engine runs on this computer as WebAssembly. Nothing is uploaded.", "the advanced page keeps WebAssembly: it runs that engine in the window");
  assert.equal(rewrite("Files stay in your browser.").text, "Files stay on this computer.");
  assert.equal(rewrite("This scenario does not run in the browser.").text, "This scenario does not run in this window.");
  assert.equal(rewrite("{ $n } file written to your browser's memory").text, "{ $n } file written to this app's memory");
  const chip = "The Kshana engine is running in this browser as WebAssembly";
  assert.equal(rewrite(chip, RULES, "app.js").text, "The Kshana engine is running natively on this computer", "the question view's runs are native");
  assert.equal(rewrite(chip, RULES, "advanced.js").text, "The Kshana engine is running on this computer as WebAssembly", "the advanced page's are not");
  // every replacement is itself clean
  for (const r of RULES) assert.equal(scan(r.to).length, 0, `rule output: ${r.to}`);
  assert.ok(BANNED.length >= 6);
});

// A staged frontend, as build-frontend.sh makes it (without the fonts and the redirect page).
const tmp = mkdtempSync(join(tmpdir(), "kshana-desktop-wording-"));
try {
  const out = join(tmp, "studio");
  cpSync(join(root, "web", "studio"), out, { recursive: true, filter: (p) => !/\.test\.mjs$/.test(p) && !/[\\/]pkg([\\/]|$)/.test(p) });
  mkdirSync(join(out, "desktop"), { recursive: true });
  cpSync(join(here, "shell"), join(out, "desktop"), { recursive: true, filter: (p) => !/\.test\.mjs$/.test(p) });
  const before = scanTree(out);
  await test("the Studio as staged says it runs in a browser (so the rewrite has work to do)", () => {
    assert.ok(before.length > 20, `${before.length} phrases`);
  });
  const r = rewriteTree(out);
  await test("every sentence rule still finds its sentence in the Studio", () => {
    assert.deepEqual(r.missing, [], "the Studio's text changed: update apps/desktop/wording.mjs");
    assert.ok(r.changed > 10);
  });
  await test("the staged Desktop frontend says nothing about a browser, no server or nothing installed", () => {
    const left = scanTree(out);
    assert.deepEqual(left.map((x) => `${x.file}:${x.line}: ${x.phrase}`), []);
  });
  await test("the Desktop says the engine runs natively on this computer", () => {
    const page = readFileSync(join(out, "index.html"), "utf8");
    assert.match(page, /The engine runs natively on this computer\. Nothing is uploaded\./);
    assert.match(readFileSync(join(out, "app.js"), "utf8"), /"The engine runs natively on this computer\. Nothing is uploaded\."/);
    assert.match(readFileSync(join(out, "desktop", "shell.js"), "utf8"), /natively, and works offline/);
    assert.doesNotThrow(() => JSON.parse(readFileSync(join(out, "channels.json"), "utf8")), "the data files stay valid JSON");
  });
} finally {
  rmSync(tmp, { recursive: true, force: true });
}
await test("web/ keeps the website's wording, and the build rewrites only the staged copy", () => {
  assert.match(readFileSync(join(root, "web", "studio", "app.js"), "utf8"), /"Runs in your browser\. Nothing is uploaded\."/);
  const build = readFileSync(join(here, "build-frontend.sh"), "utf8");
  assert.match(build, /node apps\/desktop\/wording\.mjs "\$out\/studio"/);
  assert.ok(build.indexOf("wording.mjs \"$out/studio\"") > build.indexOf("tar -xf -)"), "after staging");
});
console.log(`OK: ${n} desktop wording tests`);
