// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: run diff (0.42 U22). Run: node --test apps/desktop/shell/lib/rundiff.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { settings, inputsDiff, lineDiff, hunks, numericLeaves, resultDiff, overlaySeries, labelSeries, ghostOf, diffLines } from "./rundiff.mjs";

const A = 'kind = "jamming"\nseed = 7 # the seed\nname = "a # b"\n\n[receiver]\nthreshold = 28\n\n[[jammers]]\neirp_dbw = 10\n[jammers.waveform]\nbw = 2\n\n[[jammers]]\neirp_dbw = 0\n';
const B = 'kind = "jamming"\nseed = 8\nname = "a # b"\n\n[receiver]\nthreshold = 28\nnoise_figure_db = 2\n\n[[jammers]]\neirp_dbw = 12.5\n[jammers.waveform]\nbw = 2\n';

test("settings are read per section, array elements and their sub-tables numbered", () => {
  const s = settings(A);
  assert.equal(s.get("::seed"), "7");
  assert.equal(s.get("::name"), '"a # b"');
  assert.equal(s.get("receiver::threshold"), "28");
  assert.equal(s.get("jammers[0]::eirp_dbw"), "10");
  assert.equal(s.get("jammers[0].waveform::bw"), "2");
  assert.equal(s.get("jammers[1]::eirp_dbw"), "0");
});

test("the inputs diff: changed (with the numeric change), added, removed", () => {
  const d = inputsDiff(A, B);
  const by = Object.fromEntries(d.map((r) => [r.id, r]));
  assert.equal(by["::seed"].change, "changed");
  assert.equal(by["::seed"].delta, 1);
  assert.ok(Math.abs(by["jammers[0]::eirp_dbw"].pct - 25) < 1e-12);
  assert.equal(by["receiver::noise_figure_db"].change, "added");
  assert.equal(by["jammers[1]::eirp_dbw"].change, "removed");
  assert.ok(!by["::name"] && !by["receiver::threshold"], "unchanged settings are not listed");
  assert.deepEqual(inputsDiff(A, A), []);
});

test("the line diff keeps the common lines and the hunks keep context around changes", () => {
  const d = lineDiff("a\nb\nc\nd\ne\nf\ng", "a\nb\nX\nd\ne\nf\ng");
  assert.deepEqual(d.filter((x) => x.op !== " ").map((x) => x.op + x.text), ["-c", "+X"]);
  assert.equal(d.filter((x) => x.op === " ").length, 6);
  const h = hunks(d, 1);
  assert.deepEqual(h.map((x) => x.op), ["…", " ", "-", "+", " ", "…"]);
  assert.equal(h[0].skipped, 1);
  assert.equal(h.at(-1).skipped, 3);
  assert.deepEqual(hunks(lineDiff("a", "a")), []);
});

test("the result diff lists every number that changed, the largest relative change first, with units", () => {
  const ra = { fom: { t_s: 10, cn0: 30, same: 1 }, epochs: [{ v: 1 }, { v: 2 }], big: new Array(20).fill(0), units: { "fom.t_s": { unit: "s" }, "epochs[].v": { unit: "m" } } };
  const rb = { fom: { t_s: 12, cn0: 30.3, same: 1 }, epochs: [{ v: 1 }, { v: 4 }], big: new Array(21).fill(0), extra: 5 };
  const leaves = numericLeaves(ra);
  assert.equal(leaves.get("big.length"), 20, "a long array is compared by its length");
  assert.ok(!leaves.has("units.fom.t_s"));
  const d = resultDiff(ra, rb);
  assert.deepEqual(d.rows.map((r) => r.path), ["epochs[1].v", "fom.t_s", "big.length", "fom.cn0", "extra"]);
  assert.equal(d.rows[0].unit, "m");
  assert.equal(d.rows[1].unit, "s");
  assert.equal(d.rows[0].pct, 100);
  assert.equal(d.rows.at(-1).a, null);
  assert.equal(d.same, 2, "fom.same and epochs[0].v");
  assert.equal(resultDiff(ra, rb, { tol: 0.05 }).rows.some((r) => r.path === "fom.cn0"), false, "within the tolerance");
});

test("overlays: B's series dashed and relabelled, B's track as a ghost", () => {
  const s = overlaySeries([{ id: "s0", label: "C/N0", t: [0, 1], v: [1, 2] }]);
  assert.deepEqual([s[0].id, s[0].label, s[0].dash], ["b-s0", "B · C/N0", true]);
  assert.equal(labelSeries([{ id: "s0", label: "C/N0" }])[0].label, "A · C/N0");
  assert.equal(ghostOf(null), null);
  const g = ghostOf({ track: { t: [0, 1], lat: [1, 2], lon: [3, 4] } });
  assert.equal(g.label, "B");
  assert.deepEqual(diffLines(null, 2), { py: [], cli: [] });
  assert.match(diffLines(1, 2).py.join("\n"), /leaves\(result_1\), leaves\(result_2\)/);
});
