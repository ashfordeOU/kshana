// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the sweep studio (0.42 U21). Run: node --test apps/desktop/shell/lib/sweepgrid.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { axisValues, defaultRange, gridCells, cellToml, metricOf, runPool, gridModel, shade, dottedKey, nestUnderBase, sweepNdToml, sweepLines, gridCsv, MAX_CELLS, MAX_STEPS } from "./sweepgrid.mjs";
import { numericFields, patchField } from "../../../../web/studio/lib/params.mjs";

const toml = 'kind = "jamming"\nseed = 7\nduration_s = 120\n\n[receiver]\ntracking_threshold_dbhz = 28\n\n[[jammers]]\neirp_dbw = 10\n\n[jammers.waveform]\nbandwidth_mhz = 2\n';
const fields = numericFields(toml);
const F = (id) => fields.find((f) => f.id === id);

test("axis values: exact ends, log spacing, integers without repeats, bounded steps", () => {
  assert.deepEqual(axisValues({ from: 0, to: 10, steps: 3 }), [0, 5, 10]);
  const log = axisValues({ from: 1, to: 100, steps: 3, scale: "log" });
  assert.equal(log[0], 1); assert.equal(log[2], 100); assert.ok(Math.abs(log[1] - 10) < 1e-12);
  assert.deepEqual(axisValues({ from: -1, to: 1, steps: 3, scale: "log" }), [-1, 0, 1], "a log axis through zero is linear");
  assert.deepEqual(axisValues({ from: 0, to: 2, steps: 9, integer: true }), [0, 1, 2]);
  assert.equal(axisValues({ from: 0, to: 1, steps: 1000 }).length, MAX_STEPS);
  assert.deepEqual(axisValues({ from: NaN, to: 1 }), []);
  assert.deepEqual(defaultRange({ value: 10 }), { from: 5, to: 20 });
  assert.deepEqual(defaultRange({ value: -4 }), { from: -8, to: -2 });
  assert.deepEqual(defaultRange({ value: 0, integer: true }), { from: 0, to: 10 });
});

test("cells are in the engine's order (row-major, the last axis fastest) and the grid is bounded", () => {
  const a = { field: F("::duration_s"), values: [60, 120] }, b = { field: F("receiver::tracking_threshold_dbhz"), values: [25, 30, 35] };
  const cells = gridCells([a, b]);
  assert.equal(cells.length, 6);
  assert.deepEqual(cells.slice(0, 4).map((c) => c.coords), [[60, 25], [60, 30], [60, 35], [120, 25]]);
  assert.equal(gridCells([{ values: new Array(31).fill(0) }, { values: new Array(31).fill(0) }]), null, `more than ${MAX_CELLS} cells`);
  assert.equal(gridCells([a]).length, 2);
});

test("a cell's scenario has each swept setting at its value and nothing else changed", () => {
  const axes = [{ field: F("::duration_s") }, { field: F("jammers[0]::eirp_dbw"), integer: false }];
  const text = cellToml(toml, axes, [90, -3.5], patchField);
  assert.match(cellToml(toml, [{ field: F("::seed") }], [7.6], patchField), /^seed = 8$/m, "a whole-number field stays whole by default");
  const after = numericFields(text);
  assert.equal(after.find((f) => f.id === "::duration_s").value, 90);
  assert.equal(after.find((f) => f.id === "jammers[0]::eirp_dbw").value, -3.5);
  assert.equal(text.split("\n").length, toml.split("\n").length);
  assert.equal(after.find((f) => f.id === "receiver::tracking_threshold_dbhz").value, 28);
});

test("the figure of a cell comes from its result's path", () => {
  assert.equal(metricOf({ fom: { x: 3 } }, "fom.x"), 3);
  assert.equal(metricOf({ fom: { x: "3" } }, "fom.x"), null);
  assert.equal(metricOf({ a: [{ b: 2 }] }, "a[0].b"), 2);
});

test("the pool runs at most n at once, reports each end, and a stop starts no more", async () => {
  let live = 0, peak = 0;
  const seen = [];
  const r = await runPool([1, 2, 3, 4, 5, 6], { concurrency: 3, run: async (x) => { live++; peak = Math.max(peak, live); await new Promise((ok) => setTimeout(ok, 5)); live--; if (x === 4) throw new Error("bad"); return x * 10; }, onDone: (x, v, e) => seen.push([x, v, e ? e.message : null]) });
  assert.equal(peak, 3);
  assert.deepEqual(r, { done: 6, failed: 1, stopped: false });
  assert.deepEqual(seen.find((s) => s[0] === 4), [4, null, "bad"]);
  let stop = false;
  const r2 = await runPool([1, 2, 3, 4, 5], { concurrency: 1, run: async (x) => { if (x === 2) stop = true; return x; }, stopped: () => stop });
  assert.deepEqual(r2, { done: 2, failed: 0, stopped: true });
});

test("the grid model: values, failures, cells that gave no number, still to run", () => {
  const axes = [{ values: [1, 2, 3] }, { values: [10, 20] }];
  const cells = gridCells(axes);
  cells[0].value = 5; cells[1].value = 7; cells[2].error = "x"; cells[3].value = null;
  const m = gridModel(axes, cells);
  assert.deepEqual(m.z[0].slice(0, 1), [5]);
  assert.equal(m.z[1][0], 7);
  assert.equal(m.state[0][1], "failed");
  assert.equal(m.state[1][1], "missing");
  assert.equal(m.state[0][2], "pending");
  assert.deepEqual([m.min, m.max, m.ok, m.failed], [5, 7, 2, 1]);
  assert.equal(shade(6, 5, 7), 0.5);
  assert.equal(shade(1, 1, 1), 0.5);
  assert.ok(Number.isNaN(shade(null, 0, 1)));
});

test("the sweep is written as the engine's own sweep-nd scenario", () => {
  assert.equal(dottedKey(F("jammers[0]::eirp_dbw")), "jammers.0.eirp_dbw");
  assert.equal(dottedKey(F("jammers[0].waveform::bandwidth_mhz")), "jammers.0.waveform.bandwidth_mhz");
  assert.equal(dottedKey(F("::seed")), "seed");
  const nested = nestUnderBase('kind = "x"\n[a]\nb = 1\n[[c]]\nd = 2\ns = """\n[not a table]\n"""\n');
  assert.equal(nested, '[base]\nkind = "x"\n[base.a]\nb = 1\n[[base.c]]\nd = 2\ns = """\n[not a table]\n"""\n');
  const axes = [{ field: F("::duration_s"), from: 60, to: 120, values: [60, 90, 120] }, { field: F("receiver::tracking_threshold_dbhz"), from: 1, to: 100, scale: "log", values: [1, 10, 100] }];
  const text = sweepNdToml(toml, axes, "fom.time_to_loss_s");
  assert.match(text, /^# The window's sweep/);
  assert.match(text, /kind = "sweep-nd"\nmetrics = \["fom\.time_to_loss_s"\]/);
  assert.match(text, /\[\[axes\]\]\nkey = "duration_s"\nstart = 60\.0\nstop = 120\.0\nsteps = 3\n/);
  assert.match(text, /key = "receiver\.tracking_threshold_dbhz"\nstart = 1\.0\nstop = 100\.0\nsteps = 3\nscale = "log"/);
  assert.match(text, /\[base\]\nkind = "jamming"/);
  assert.match(text, /\[base\.receiver\]/);
  assert.match(text, /\[\[base\.jammers\]\]/);
  assert.match(text, /\[base\.jammers\.waveform\]/);
  const lines = sweepLines({ n: 2, toml, axes, metricPath: "fom.time_to_loss_s", name: "jamming-demo.toml" });
  assert.equal(JSON.parse(lines.py[0].slice("sweep_2_toml = ".length)), text);
  assert.equal(lines.cli[0], "cat > jamming-demo-sweep.toml <<'KSHANA_EOF'");
  assert.equal(lines.cli.at(-1), "kshana jamming-demo-sweep.toml");
});

test("the grid as CSV", () => {
  const axes = [{ field: { section: "", key: "a" }, values: [1, 2] }];
  const cells = gridCells(axes);
  cells[0].value = 0.5; cells[1].error = "boom";
  assert.equal(gridCsv(axes, cells, "time to loss, s"), 'a,"time to loss, s",state\n1,0.5,ok\n2,,failed\n');
});
