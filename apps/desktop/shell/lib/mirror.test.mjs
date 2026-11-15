// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the code mirror (0.42 U10). Run: node --test apps/desktop/shell/lib/mirror.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { pyStr, shWord, runLines, editLines, exportLines, createMirror, sessionPython, sessionShell, findSeriesPath, figureScript, skyRequestLines, PY_HEADER } from "./mirror.mjs";

test("a Python string literal reads back as the same text", () => {
  const s = 'a = "b"\n[x]\ty = \'\'\'z\'\'\' \\ ünï ✓';
  // JSON and Python agree on these escapes; parse it back as JSON to check
  assert.equal(JSON.parse(pyStr(s)), s);
  assert.equal(shWord("clock-holdover.toml"), "clock-holdover.toml");
  assert.equal(shWord("it's here"), "'it'\\''s here'");
});

test("an unedited bundled scenario runs from the example; an edited one carries its whole text", () => {
  const a = runLines({ n: 3, file: "clock-holdover.toml", bundled: true, edited: false, resultSha: "ab12" });
  assert.deepEqual(a.py, [
    'toml_3 = kshana.get_example("clock-holdover")',
    "out_3 = kshana.run(toml_3)",
    "result_3 = json.loads(out_3)",
    'print("run 3 reproduced:", hashlib.sha256(out_3.encode()).hexdigest() == "ab12")',
  ]);
  assert.deepEqual(a.cli, ["kshana example clock-holdover > clock-holdover.toml", "kshana clock-holdover.toml"]);
  const toml = 'kind = "clock"\n[clock]\ny0 = 2e-10\n';
  const b = runLines({ n: 4, file: "clock-holdover.toml", bundled: true, edited: true, toml });
  assert.equal(b.py[0], `toml_4 = ${JSON.stringify(toml)}`);
  assert.equal(JSON.parse(b.py[0].slice("toml_4 = ".length)), toml);
  assert.deepEqual(b.cli.slice(0, 1), ["cat > clock-holdover.toml <<'KSHANA_EOF'"]);
  assert.deepEqual(b.cli.slice(-2), ["KSHANA_EOF", "kshana clock-holdover.toml"]);
  assert.equal(b.cli.length, 3 + 3);
});

test("the console keeps every action in order and writes the session as one script", () => {
  const m = createMirror(5);
  const seen = [];
  m.subscribe((e) => seen.push(e.length));
  const n = m.nextRun();
  m.push({ kind: "open", title: "Open clock-holdover", py: ["# open"], cli: [] });
  m.push({ kind: "run", title: "Run 1", ...runLines({ n, file: "clock-holdover.toml", resultSha: "ff" }) });
  m.push({ kind: "edit", title: "Edit", ...editLines({ section: "clock", key: "y0", raw: "1e-10", value: 2e-10, file: "clock-holdover.toml" }) });
  m.push({ kind: "export", title: "Export", ...exportLines({ n, what: "json", file: "clock-holdover.toml" }) });
  assert.equal(m.size, 4);
  assert.deepEqual(seen, [1, 2, 3, 4]);
  const py = sessionPython(m.list());
  assert.ok(py.startsWith(PY_HEADER.join("\n")));
  assert.ok(py.indexOf("toml_1 = kshana.get_example") < py.indexOf('with open("clock-holdover.result.json", "w") as f: f.write(out_1)'));
  const sh = sessionShell(m.list());
  assert.ok(sh.startsWith("#!/bin/sh\nset -e"));
  assert.match(sh, /kshana clock-holdover\.toml writes clock-holdover\.result\.json/);
  for (let i = 0; i < 4; i++) m.push({ title: `x${i}`, py: ["pass"] });
  assert.equal(m.size, 5, "the console keeps the newest entries");
  m.load([{ at: "t", kind: "run", title: "r", py: ["a"], cli: ["b"] }, { bad: 1 }], 7);
  assert.equal(m.size, 1);
  assert.equal(m.nextRun(), 8);
});

test("a figure's series is found in the result by its path and keys", () => {
  const result = { quantum: { series: [{ t: 0, bias_ns: 1 }, { t: 10, bias_ns: 2 }, { t: 20 }, { t: 30, bias_ns: 4 }] }, other: [1, 2, 3] };
  const hit = findSeriesPath(result, [[0, 1], [10, 2], [30, 4]]);
  assert.deepEqual(hit, { path: ["quantum", "series"], x: "t", y: "bias_ns" });
  assert.equal(findSeriesPath(result, [[0, 1], [10, 3]]), null, "different values are not a match");
  assert.equal(findSeriesPath({ epochs: [{ t_s: 1, visible: 5, tracking: 4 }, { t_s: 2, visible: 6, tracking: 6 }] }, [[1, 4], [2, 6]]).y, "tracking");
});

test("the script of a figure runs the scenario and takes the plotted data from the result", () => {
  const run = { file: "clock-holdover.toml", bundled: true, edited: false, resultSha: "aa", result: { error_growth: [{ t_s: 0, time_error_ns: 0 }, { t_s: 60, time_error_ns: 3.5 }] } };
  const s = figureScript(run, { kind: "series", title: "Predicted time error", series: [{ label: "oscillator", points: [[0, 0], [60, 3.5]] }, { label: "derived", points: [[0, 9], [1, 8]] }], xLabel: "time (s)", yLabel: "time error (ns)" });
  assert.match(s, /toml_1 = kshana\.get_example\("clock-holdover"\)/);
  assert.match(s, /s0 = \[\(r\["t_s"\], r\["time_error_ns"\]\) for r in result_1\["error_growth"\] if isinstance\(r\.get\("time_error_ns"\), \(int, float\)\)\]/);
  assert.match(s, /s1 = json\.loads\("\[\[0,9\],\[1,8\]\]"\)/, "a series not found in the result is written as drawn");
  assert.match(s, /ax\.set_ylabel\("time error \(ns\)"\)/);
  const chart = figureScript(run, { kind: "chart", title: "Chart" });
  assert.match(chart, /svg = kshana\.run_full\(toml_1\)\[1\]/);
  const sky = figureScript(run, { kind: "sky", title: "Sky", sky: { requests: [{ time_s: 0, site: { lat_deg: 1, lon_deg: 2, height_m: 0 } }] } });
  assert.match(sky, /skies = \[kshana\.sky_geometry\(q\) for q in requests\]/);
  const reqs = [0, 60, 120].map((time_s) => ({ site: { lat_deg: 1, lon_deg: 2, height_m: 0 }, time_s, systems: ["gps-baseline"], mask_deg: 5 }));
  const lines = skyRequestLines(reqs, "q");
  assert.deepEqual(lines.slice(1), ["q_times = [0,60,120]", "q = [dict(q_base, time_s=t) for t in q_times]"]);
  assert.deepEqual(JSON.parse(JSON.parse(lines[0].slice("q_base = json.loads(".length, -1))), { site: { lat_deg: 1, lon_deg: 2, height_m: 0 }, systems: ["gps-baseline"], mask_deg: 5 });
  assert.equal(skyRequestLines([reqs[0], { ...reqs[1], mask_deg: 9 }]).length, 1, "different requests are written as they are");
});
