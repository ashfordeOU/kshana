// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: tests of the palette and runs models, and the wording and network
// rules of the Desktop frontend (0.42 U4/U5). Run: node apps/desktop/shell/shell.test.mjs
import assert from "node:assert/strict";
import { readFileSync, readdirSync, statSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { paletteRows, moveIndex, highlight, isPaletteKey, actionMatches } from "./lib/palette.mjs";
import { createRunLog, compareRows, reproduceLines, scenarioName, elapsed, packFiles, tabKeyIndex } from "./lib/runs.mjs";
import { createHash } from "node:crypto";

const here = dirname(fileURLToPath(import.meta.url));
let n = 0;
const test = async (name, fn) => { await fn(); n++; };

// ---- palette
await test("palette rows: scenarios then actions, numbered in order", () => {
  const entries = [{ file: "a.toml", domain: "timing", title: "Clock holdover", question: "?" }, { file: "b.toml", domain: "timing", title: "Telecom holdover", question: "?" }];
  const actions = [{ id: "run", label: "Run this scenario again" }, { id: "pro-fleet", label: "Holdover fleet view", keywords: "pro", pro: true }, { id: "x", label: "Export an evidence pack" }];
  const r = paletteRows("hold", { search: (q) => entries.filter((e) => e.title.toLowerCase().includes(q)), actions });
  assert.deepEqual(r.groups.map((g) => g.id), ["scenarios", "actions"]);
  assert.deepEqual(r.items.map((x) => x.index), [0, 1, 2]);
  assert.equal(r.items[2].pro, true);
  assert.equal(r.items[2].id, "action:pro-fleet");
  const empty = paletteRows("", { featured: [entries[0]], actions });
  assert.equal(empty.items.length, 4, "an empty query shows the featured scenarios and every action");
  assert.equal(paletteRows("zzz", { search: () => [], actions }).items.length, 0);
});
await test("action match needs every word", () => {
  assert.ok(actionMatches({ label: "Compare the 2 selected runs" }, "comp runs"));
  assert.ok(!actionMatches({ label: "Compare the 2 selected runs" }, "comp export"));
  assert.ok(actionMatches({ label: "Station fleet", keywords: "pro" }, "PRO"));
});
await test("moveIndex wraps and handles empty lists", () => {
  assert.equal(moveIndex(0, 1, 3), 1);
  assert.equal(moveIndex(2, 1, 3), 0);
  assert.equal(moveIndex(0, -1, 3), 2);
  assert.equal(moveIndex(-1, -1, 3), 2);
  assert.equal(moveIndex(0, 1, 0), -1);
});
await test("highlight marks the query's words", () => {
  assert.deepEqual(highlight("Clock holdover", "hold"), [{ text: "Clock ", hit: false }, { text: "hold", hit: true }, { text: "over", hit: false }]);
  assert.deepEqual(highlight("abc", ""), [{ text: "abc", hit: false }]);
  assert.equal(highlight("<b>x</b>", "b").map((s) => s.text).join(""), "<b>x</b>", "the text is kept as text");
});
await test("the palette key is Cmd+K or Ctrl+K", () => {
  assert.ok(isPaletteKey({ key: "k", metaKey: true }));
  assert.ok(isPaletteKey({ key: "K", ctrlKey: true }));
  assert.ok(!isPaletteKey({ key: "k" }));
  assert.ok(!isPaletteKey({ key: "k", ctrlKey: true, shiftKey: true }));
});
await test("tab keys move through a roving tab list", () => {
  assert.equal(tabKeyIndex("ArrowRight", 2, 3), 0);
  assert.equal(tabKeyIndex("ArrowLeft", 0, 3), 2);
  assert.equal(tabKeyIndex("Home", 2, 3), 0);
  assert.equal(tabKeyIndex("End", 0, 3), 2);
  assert.equal(tabKeyIndex("a", 0, 3), null);
  assert.equal(tabKeyIndex("ArrowLeft", 0, 0), null);
});

// ---- runs
await test("run log: newest first, capped, selection oldest first", () => {
  const log = createRunLog(3);
  const a = log.add({ title: "a" }), b = log.add({ title: "b" });
  log.add({ title: "c" });
  assert.deepEqual(log.list().map((r) => r.title), ["c", "b", "a"]);
  log.toggle(a.id, true); log.toggle(b.id);
  assert.deepEqual(log.selected().map((r) => r.title), ["a", "b"]);
  log.add({ title: "d" });
  assert.equal(log.size, 3);
  assert.equal(log.get(a.id), null, "the oldest run left the log");
  assert.deepEqual(log.selected().map((r) => r.title), ["b"], "and its selection with it");
  assert.equal(log.toggle(999), false);
});
await test("compareRows pairs figures by path and gives the change", () => {
  const A = [{ k: "Holdover", sub: "csac", v: 2610, unit: "s", path: "classical.fom.holdover_s" }, { k: "Only A", v: 1 }];
  const B = [{ k: "Holdover", sub: "csac", v: 6600, unit: "s", path: "classical.fom.holdover_s" }, { k: "Only B", v: 2 }];
  const r = compareRows(A, B);
  assert.equal(r.length, 3);
  assert.equal(r[0].delta, 3990);
  assert.ok(Math.abs(r[0].pct - 152.87) < 0.01);
  assert.equal(r[1].b, null); assert.equal(r[1].delta, null);
  assert.equal(r[2].a, null);
  assert.equal(compareRows([{ k: "x", v: 0 }], [{ k: "x", v: 1 }])[0].pct, null, "no percentage from zero");
});
await test("reproduce lines", () => {
  assert.deepEqual(reproduceLines({ file: "clock-holdover.toml" }), ["kshana example clock-holdover > clock-holdover.toml", "kshana clock-holdover.toml"]);
  assert.deepEqual(reproduceLines({ file: "clock-holdover.toml", edited: true }), ["kshana clock-holdover.toml"]);
  assert.deepEqual(reproduceLines({ file: "my file; rm -rf.toml", bundled: false }), ["kshana scenario.toml"], "a name that is not plain never reaches the command line");
  assert.equal(scenarioName("../x.toml"), "scenario");
});
await test("elapsed units", () => {
  assert.deepEqual(elapsed(0, 59000), { n: 59, unit: "s" });
  assert.deepEqual(elapsed(0, 61000), { n: 1, unit: "min" });
  assert.deepEqual(elapsed(0, 7200000), { n: 2, unit: "h" });
  assert.deepEqual(elapsed(0, 3 * 86400000), { n: 3, unit: "d" });
});
await test("pack files carry a manifest with each file's SHA-256", async () => {
  const digest = async (b) => createHash("sha256").update(b).digest().buffer;
  const run = { file: "clock-holdover.toml", toml: "a = 1\n", result: { engine_version: "0.41.0", seed: 42, scenario_hash: "abc" }, svg: "<svg/>", summary: "s", csv: "" };
  const files = await packFiles(run, { digest, readme: "r\n" });
  assert.deepEqual(files.map((f) => f.name), ["clock-holdover.toml", "clock-holdover.result.json", "summary.txt", "clock-holdover.chart.svg", "README.txt", "manifest.json"]);
  const m = JSON.parse(files.at(-1).data);
  assert.equal(m.signed, false);
  assert.equal(m.seed, 42);
  assert.equal(m.engine_version, "0.41.0");
  assert.equal(m.files[0].sha256, createHash("sha256").update("a = 1\n").digest("hex"));
  assert.equal(m.files.length, files.length - 1);
  await assert.rejects(() => packFiles(run, {}));
});

// ---- U4 and U5: the Desktop frontend's words and requests
const files = [];
const walk = (d) => { for (const e of readdirSync(d)) { const p = join(d, e); if (statSync(p).isDirectory()) walk(p); else if (/\.(m?js|html|css)$/.test(e) && !/\.test\.mjs$/.test(e)) files.push(p); } };
walk(here);
const build = readFileSync(join(here, "..", "build-frontend.sh"), "utf8");
await test("the Desktop frontend never says it runs in a browser or that nothing is uploaded", () => {
  assert.ok(files.length >= 5);
  for (const f of [...files, join(here, "..", "build-frontend.sh")]) {
    const text = readFileSync(f, "utf8");
    for (const bad of [/runs in your browser/i, /in your browser/i, /nothing is uploaded/i, /browser-native/i]) assert.ok(!bad.test(text), `${f}: ${bad}`);
  }
  const shell = readFileSync(join(here, "shell.js"), "utf8");
  assert.match(shell, /natively/);
  assert.match(shell, /works offline/i);
});
await test("the shell makes no outside request, has no checkout and shows no price", () => {
  for (const f of files) {
    const text = readFileSync(f, "utf8");
    assert.ok(!/fetch\(\s*["'`]https?:/.test(text), `${f}: fetch of an outside address`);
    assert.ok(!/<script[^>]+src=["']https?:/i.test(text) && !/@import\s+url\(["']?https?:/i.test(text) && !/<link[^>]+href=["']https?:/i.test(text), `${f}: outside script, style or font`);
    assert.ok(!/((?<!no )checkout|buy now|[$€£]\s?\d|per (month|year)|\/\s?(mo|yr)\b)/i.test(text), `${f}: checkout or price`);
    assert.ok(!/\b(compliant|conform|certified)\b/i.test(text), `${f}: claim words`);
  }
  const urls = files.flatMap((f) => [...readFileSync(f, "utf8").matchAll(/https?:\/\/[^\s"'`)]+/g)].map((m) => m[0])).filter((u) => u !== "http://www.w3.org/2000/svg"); // the SVG namespace names, it does not fetch
  assert.deepEqual([...new Set(urls)], ["https://kshana.dev/editions.html"], "the one outside address is the editions page, shown as a link");
});
await test("the Desktop opens the shell and stages it beside the Studio", () => {
  assert.match(build, /url=studio\/desktop\/index\.html/);
  assert.match(build, /--exclude='\*\.test\.mjs'/);
  const html = readFileSync(join(here, "index.html"), "utf8");
  assert.ok(!/<script>(?!<\/script>)/.test(html) && !/<script>\s*\S/.test(html), "no inline script (the window's policy allows the app's own files only)");
  assert.match(html, /role="tablist"/);
});
console.log(`OK: ${n} desktop shell tests`);
