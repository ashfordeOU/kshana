// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: project folders and runs on disk (0.42 U8). Run: node --test apps/desktop/shell/lib/project.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { webcrypto } from "node:crypto";
import { projectFiles, readProject, runUid, isRunUid, projectFolderName, joinPath, searchRuns, parseTags, replayCheck, sha256Text, removedPaths, runMeta } from "./project.mjs";

const digest = (b) => webcrypto.subtle.digest("SHA-256", b);
const result = { seed: 7, scenario_hash: "abc", quantum: { series: [{ t: 0, x: 1 }] } };
const json = JSON.stringify(result); // the engine's text, kept byte for byte
const run1 = { uid: runUid(Date.UTC(2026, 10, 14, 9, 30, 1, 250), 1), title: "Clock holdover", file: "clock-holdover.toml", domain: "timing", custom: false, edited: false, at: new Date(Date.UTC(2026, 10, 14, 9, 30, 1, 250)), ms: 41.6, engine: "native", engineVersion: "0.41.0", toml: 'kind = "clock"\n', json, result, summary: "ok", svg: "<svg/>", csv: "a,b\n1,2\n", tags: ["Holdover", "baltic test", "holdover"], pinned: true, note: "first", scenarioSha: "s1", resultSha: "r1" };
const run2 = { ...run1, uid: runUid(Date.UTC(2026, 10, 14, 9, 31), 2), title: "Jamming", file: "jamming-demo.toml", at: new Date(Date.UTC(2026, 10, 14, 9, 31)), tags: [], pinned: false, note: "", summary: "", svg: "", csv: "" };

test("run ids sort by time and are safe folder names", () => {
  assert.equal(run1.uid, "20261114T093001250-001");
  assert.ok(isRunUid(run1.uid) && !isRunUid("../x") && !isRunUid("20261114T093001250"));
  assert.ok(run1.uid < run2.uid);
  assert.equal(projectFolderName("Baltic: study / 2026"), "Baltic study 2026.kshana");
  assert.equal(projectFolderName(""), "Untitled.kshana");
  assert.equal(joinPath("/home/a/Kshana/", "B.kshana"), "/home/a/Kshana/B.kshana");
  assert.equal(joinPath("C:\\Users\\a\\Kshana", "B.kshana"), "C:\\Users\\a\\Kshana\\B.kshana");
});

test("close and reopen: the files written give back the tabs, runs, selection and clock", () => {
  const state = {
    name: "Study", created: "2026-11-14T09:00:00.000Z", runs: [run1, run2], route: "tab", active: "2", selected: [run2.uid, run1.uid, "bogus"],
    tabs: [
      { key: "1", file: "clock-holdover.toml", title: "Clock holdover", custom: false, domain: "timing", toml: run1.toml, baseToml: run1.toml, view: "timeline", ins: "result", runUid: run1.uid, clock: { t: 120.5, range: [60, 300], marks: [{ t: 90, label: "map" }] }, markers: [{ t: 60, series: "quantum" }, { t: 180, series: "quantum" }] },
      { key: "2", file: "jamming-demo.toml", title: "Jamming", custom: false, domain: "gnss", toml: 'kind = "jam"\nx = 2\n', baseToml: 'kind = "jam"\n', view: "map", runUid: run2.uid },
      { key: "3", file: "mine.toml", title: "mine", custom: true, toml: 'kind = "own"\n', baseToml: 'kind = "own"\n', view: "chart", runUid: null },
    ],
    links: [{ path: "/data/log.ubx", name: "log.ubx", format: "ubx", family: "receiver-log", bytes: 1234 }],
    notes: "# Notes\n", console: [{ at: "t", kind: "run", title: "Run 1", py: ["a"], cli: ["b"] }], consoleRuns: 1,
  };
  const files = projectFiles(state);
  const paths = files.map((f) => f.path);
  for (const p of ["project.json", `runs/${run1.uid}/run.json`, `runs/${run1.uid}/scenario.toml`, `runs/${run1.uid}/result.json`, `runs/${run1.uid}/chart.svg`, "layouts/session.json", "data/links.json", "notebooks/notes.md", "notebooks/console.json", "scenarios/jamming-demo-edited.toml", "scenarios/mine.toml"]) assert.ok(paths.includes(p), p);
  assert.ok(!paths.includes(`runs/${run2.uid}/chart.svg`), "no empty chart file");
  assert.equal(files.find((f) => f.path === `runs/${run1.uid}/result.json`).text, json, "the result is the engine's bytes");
  for (const p of paths) assert.ok(!p.includes("..") && !p.startsWith("/") && !p.split("/").some((s) => s.startsWith(".")), p);
  const back = readProject(files);
  assert.deepEqual(back.problems, []);
  assert.equal(back.name, "Study");
  assert.deepEqual(back.runs.map((r) => r.uid), [run1.uid, run2.uid], "oldest first");
  assert.equal(back.runs[0].json, json);
  assert.deepEqual(back.runs[0].result, result);
  assert.deepEqual(back.runs[0].tags, ["holdover", "baltic-test"]);
  assert.equal(back.runs[0].pinned, true);
  assert.equal(back.runs[0].note, "first");
  assert.equal(back.route, "tab");
  assert.equal(back.active, "2");
  assert.deepEqual(back.selected, [run2.uid, run1.uid]);
  assert.equal(back.tabs.length, 3);
  assert.deepEqual(back.tabs[0].clock, { t: 120.5, range: [60, 300], marks: [{ t: 90, label: "map" }] });
  assert.deepEqual(back.tabs[0].markers, [{ t: 60, series: "quantum" }, { t: 180, series: "quantum" }]);
  assert.equal(back.tabs[0].view, "timeline");
  assert.equal(back.tabs[0].ins, "result");
  assert.equal(back.tabs[0].toml, run1.toml, "an unedited tab takes its run's scenario");
  assert.equal(back.tabs[1].toml, 'kind = "jam"\nx = 2\n', "an edited tab keeps its edits");
  assert.equal(back.tabs[1].edited, true);
  assert.equal(back.tabs[2].toml, 'kind = "own"\n');
  assert.equal(back.links[0].format, "ubx");
  assert.equal(back.notes, "# Notes\n");
  assert.equal(back.console.length, 1);
  assert.equal(back.consoleRuns, 1);
  // writing what was read gives the same files
  const again = projectFiles({ ...back, runs: back.runs, tabs: back.tabs.map((t) => ({ ...t, baseToml: t.edited ? "" : t.toml })), consoleRuns: back.consoleRuns });
  assert.deepEqual(again.map((f) => f.path).sort(), paths.slice().sort());
  assert.deepEqual(removedPaths(paths, projectFiles({ ...state, runs: [run2] })), paths.filter((p) => p.startsWith(`runs/${run1.uid}/`)));
});

test("a damaged project reports its problems and keeps what it can", () => {
  const back = readProject([{ path: "project.json", text: "{" }, { path: `runs/${run1.uid}/run.json`, text: JSON.stringify(runMeta(run1)) }, { path: `runs/${run2.uid}/run.json`, text: JSON.stringify(runMeta(run2)) }, { path: `runs/${run2.uid}/result.json`, text: "{}" }]);
  assert.equal(back.runs.length, 1);
  assert.equal(back.problems.length, 2);
});

test("search, tags and pins", () => {
  const runs = [{ ...run1, id: 1 }, { ...run2, id: 2, tags: ["jamming"], note: "Baltic approach" }];
  assert.deepEqual(searchRuns(runs, "").map((r) => r.id), [1, 2], "pinned first");
  assert.deepEqual(searchRuns(runs, "baltic").map((r) => r.id), [1, 2]);
  assert.deepEqual(searchRuns(runs, "tag:jamming").map((r) => r.id), [2]);
  assert.deepEqual(searchRuns(runs, "is:pinned").map((r) => r.id), [1]);
  assert.deepEqual(searchRuns(runs, "approach jamming").map((r) => r.id), [2]);
  assert.deepEqual(searchRuns(runs, "#2").map((r) => r.id), [2]);
  assert.deepEqual(parseTags("Jamming, baltic  test,, ../x"), ["jamming", "baltic", "test"]);
});

test("replay is judged by the SHA-256 of the result bytes", async () => {
  const same = await replayCheck(json, JSON.stringify(result), digest);
  assert.equal(same.identical, true);
  assert.equal(same.before, await sha256Text(json, digest));
  const other = await replayCheck(json, json.replace("7", "8"), digest);
  assert.equal(other.identical, false);
  assert.equal((await sha256Text("", digest)).length, 64);
});

test("notebooks and region packs are kept in the project and read back (0.42 U23, U24)", () => {
  const files = projectFiles({ name: "N", created: "2026-11-15T00:00:00Z", runs: [], tabs: [], links: [], notes: "", console: [],
    notebookFiles: [{ file: "holdover.ipynb", text: '{"nbformat":4,"cells":[]}' }, { file: "../evil.ipynb", text: "x" }],
    packFiles: [{ file: "baltic.json", text: '{"format":"kshana-mappack/1"}' }, { file: "x.exe", text: "x" }] });
  const paths = files.map((f) => f.path);
  assert.ok(paths.includes("notebooks/holdover.ipynb"));
  assert.ok(paths.includes("packs/baltic.json"));
  assert.ok(!paths.some((p) => p.includes("evil") || p.endsWith(".exe")), "only safe names");
  const back = readProject(files);
  assert.deepEqual(back.notebookFiles, [{ file: "holdover.ipynb", text: '{"nbformat":4,"cells":[]}' }]);
  assert.deepEqual(back.packFiles, [{ file: "baltic.json", text: '{"format":"kshana-mappack/1"}' }]);
  // a notebook or pack the person removed is removed from the folder too
  assert.deepEqual(removedPaths(paths, files.filter((f) => !/^(notebooks\/holdover|packs\/)/.test(f.path))), ["notebooks/holdover.ipynb", "packs/baltic.json"]);
  assert.ok(!removedPaths(["notebooks/notes.md"], []).length, "the notes are never removed");
});
