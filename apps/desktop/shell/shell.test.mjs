// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: tests of the palette, runs and extension models, and the wording and network
// rules of the Desktop frontend (0.42 U4/U5). Run: node apps/desktop/shell/shell.test.mjs
import assert from "node:assert/strict";
import { readFileSync, readdirSync, statSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { paletteRows, moveIndex, highlight, isPaletteKey, actionMatches } from "./lib/palette.mjs";
import { createRunLog, compareRows, reproduceLines, scenarioName, elapsed, packFiles, tabKeyIndex } from "./lib/runs.mjs";
import { createExtensions, EVENTS } from "./lib/ext.mjs";
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

// ---- extensions (lib/ext.mjs, window.KshanaShell)
const BUILT = ["home", "runs", "library", "devices", "evidence", "files", "upgrade"];
const reg = (opts = {}) => { const errors = []; let changes = 0; const r = createExtensions({ builtins: BUILT, onChange: () => changes++, report: (e) => errors.push(e), ...opts }); return { ...r, errors, changes: () => changes }; };
await test("extensions: nothing registered leaves every part to the shell", () => {
  const { shell } = reg();
  for (const v of [...BUILT, "anything"]) assert.equal(shell.viewFor(v), null);
  assert.deepEqual(shell.navSections(), []);
  assert.deepEqual(shell.paletteGroups("", actionMatches), []);
  assert.equal(shell.statusItems("left"), null);
  assert.equal(shell.statusItems("right"), null);
  assert.equal(shell.edition(), null);
  assert.equal(shell.titleOf("home"), "");
  assert.deepEqual(paletteRows("", { featured: [], actions: [{ id: "a", label: "A" }], more: shell.paletteGroups("", actionMatches) }).groups.map((g) => g.id), ["actions"], "the palette is the shell's alone");
});
await test("extensions: views, their own and in place of a built-in one", () => {
  const { api, shell, changes } = reg();
  const render = () => {};
  const off = api.registerView("account", { title: "Account", render });
  assert.equal(changes(), 1, "a registration asks the shell to render");
  assert.equal(shell.viewFor("account").render, render);
  assert.equal(shell.viewFor("account").replaces, null);
  assert.equal(shell.titleOf("account"), "Account");
  assert.equal(shell.viewFor("home"), null, "a registered view replaces nothing by itself");
  api.replaceView("home", "account");
  assert.equal(shell.viewFor("home").id, "account");
  assert.equal(shell.viewFor("home").replaces, "home");
  api.replaceView("upgrade", "missing");
  assert.equal(shell.viewFor("upgrade"), null, "a replacement by a view not registered keeps the shell's own");
  api.replaceView("home", null);
  assert.equal(shell.viewFor("home"), null, "null gives the view back");
  off();
  assert.equal(shell.viewFor("account"), null);
  assert.equal(shell.hasView("account"), false);
  assert.throws(() => api.registerView("home", { render }), /shell's own views/);
  assert.throws(() => api.registerView("tab", { render }));
  assert.throws(() => api.registerView("Bad Id", { render }), TypeError);
  assert.throws(() => api.registerView("x", {}), TypeError);
  assert.throws(() => api.replaceView("settings", "x"), /not one of the shell's views/);
});
await test("extensions: sidebar sections, items normalised, live and removable", () => {
  const { api, shell, errors } = reg();
  let n = 1;
  const off = api.registerNavSection({ heading: "EXTRA", items: () => [
    { id: "a", label: "Alpha", icon: "home", badge: "NEW", view: "account" },
    { id: "b", label: `Beta ${n}`, badge: { dot: "var(--itg)", title: "ok" }, onSelect: () => {} },
    { id: "c" }, null, "text"] });
  let [sec] = shell.navSections();
  assert.equal(sec.heading, "EXTRA");
  assert.deepEqual(sec.items.map((i) => i.label), ["Alpha", "Beta 1"], "items without a label are left out");
  assert.deepEqual(sec.items[0].badge, { text: "NEW", dot: "", title: "" });
  assert.equal(sec.items[0].view, "account");
  assert.equal(sec.items[1].badge.dot, "var(--itg)");
  assert.equal(typeof sec.items[1].onSelect, "function");
  n = 2;
  [sec] = shell.navSections();
  assert.equal(sec.items[1].label, "Beta 2", "a function of items is read on every render");
  api.registerNavSection({ heading: "BROKEN", items: () => { throw new Error("boom"); } });
  assert.equal(shell.navSections()[1].items.length, 0, "an extension's error leaves its section empty");
  assert.equal(errors.length, 1);
  off();
  assert.deepEqual(shell.navSections().map((s) => s.heading), ["BROKEN"]);
  assert.throws(() => api.registerNavSection(null), TypeError);
});
await test("extensions: palette groups follow the shell's actions and number on", () => {
  const { api, shell } = reg();
  api.registerPaletteGroup({ heading: "More", items: () => [
    { id: "one", label: "Open the account", keywords: "settings", tag: "EXT", onSelect: () => "one" },
    { id: "two", label: "Something else", onSelect: () => "two", disabled: true },
    { id: "bad", label: "No handler" }] });
  const all = shell.paletteGroups("", actionMatches);
  assert.equal(all.length, 1);
  assert.deepEqual(all[0].items.map((i) => i.label), ["Open the account", "Something else"], "an item needs onSelect");
  assert.equal(all[0].heading, "More");
  assert.deepEqual(shell.paletteGroups("settings", actionMatches)[0].items.map((i) => i.label), ["Open the account"], "keywords match");
  assert.deepEqual(shell.paletteGroups("zzz", actionMatches), [], "a group with no match is left out");
  const rows = paletteRows("", { featured: [{ file: "a.toml", title: "A" }], actions: [{ id: "run", label: "Run" }], more: all });
  assert.deepEqual(rows.groups.map((g) => g.id), ["scenarios", "actions", all[0].id]);
  assert.deepEqual(rows.items.map((r) => r.index), [0, 1, 2, 3], "the arrow keys move through the extension's rows too");
  assert.equal(rows.items[2].ext, true);
  assert.equal(rows.items[2].tag, "EXT");
  assert.equal(rows.items[2].action.go(), "one");
  assert.equal(rows.items[3].disabled, true);
  assert.equal(rows.groups[2].heading, "More");
  assert.throws(() => api.registerPaletteGroup({ heading: "x" }), TypeError);
});
await test("extensions: status items and the edition", () => {
  const { api, shell } = reg();
  api.setStatusItems("right", ["One", { text: "Two", dot: "red", title: "t" }, { text: "" }, 5]);
  assert.deepEqual(shell.statusItems("right"), [{ text: "One", title: "", dot: "" }, { text: "Two", title: "t", dot: "red" }]);
  assert.equal(shell.statusItems("left"), null, "the other side stays the shell's");
  let label = "a";
  api.setStatusItems("left", () => [label]);
  label = "b";
  assert.deepEqual(shell.statusItems("left").map((x) => x.text), ["b"]);
  api.setStatusItems("right", []);
  assert.deepEqual(shell.statusItems("right"), [], "an empty list clears the side");
  api.setStatusItems("right", null);
  assert.equal(shell.statusItems("right"), null, "null gives it back");
  assert.throws(() => api.setStatusItems("middle", []));
  assert.throws(() => api.setStatusItems("left", "text"), TypeError);
  api.setEdition({ appName: "Example App", tag: "EX", title: "Example edition", text: "Line", action: { label: "Manage", onSelect: () => 1 } });
  assert.deepEqual({ ...shell.edition(), action: shell.edition().action.label }, { appName: "Example App", tag: "EX", title: "Example edition", text: "Line", action: "Manage" });
  api.setEdition(() => ({ title: "T", action: { label: "no handler" } }));
  assert.equal(shell.edition().action, null);
  assert.equal(shell.edition().appName, "");
  api.setEdition(null);
  assert.equal(shell.edition(), null);
});
await test("extensions: events reach every listener, errors stay with the extension", () => {
  const { api, shell, errors } = reg();
  assert.deepEqual(EVENTS, ["render", "runs-changed", "view-changed"]);
  const got = [];
  const off = api.on("view-changed", (d) => got.push(d.view));
  api.on("view-changed", () => { throw new Error("listener"); });
  api.on("view-changed", (d) => got.push(`2:${d.view}`));
  shell.emit("view-changed", { view: "runs" });
  assert.deepEqual(got, ["runs", "2:runs"]);
  assert.equal(errors.length, 1);
  off();
  shell.emit("view-changed", { view: "home" });
  assert.deepEqual(got, ["runs", "2:runs", "2:home"]);
  shell.emit("render", {});
  assert.throws(() => api.on("click", () => {}));
  assert.throws(() => api.on("render", null), TypeError);
});
await test("the shell exposes the extension API and announces it", () => {
  const shell = readFileSync(join(here, "shell.js"), "utf8");
  assert.match(shell, /window\.KshanaShell = KshanaShell/);
  assert.match(shell, /new CustomEvent\("kshana-shell-ready"/);
  for (const m of ["registerView", "registerNavSection", "registerPaletteGroup", "setStatusItems", "replaceView", "setEdition", "on"]) assert.ok(typeof createExtensions().api[m] === "function", m);
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
