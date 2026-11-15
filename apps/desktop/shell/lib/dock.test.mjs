// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: dockable panes and saved layouts (0.42 U20). Run: node --test apps/desktop/shell/lib/dock.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { PANE_VIEWS, MIN_SIZE, pane, split, preset, PRESETS, panes, normSizes, normalise, validate, pathOf, splitPane, closePane, setView, swapPanes, dockPane, resize, barDelta, layoutText, savedFile, readSaved, seedIds, paneId } from "./dock.mjs";
import { projectFiles, readProject } from "./project.mjs";

const sum = (a) => a.reduce((x, y) => x + y, 0);
const close = (a, b) => Math.abs(a - b) < 1e-9;

test("every preset is a valid layout of known views with unique ids", () => {
  for (const p of PRESETS) {
    const l = preset(p);
    const ps = panes(l);
    assert.ok(ps.length >= 3, p);
    assert.ok(ps.every((x) => PANE_VIEWS.includes(x.pane)), p);
    assert.equal(new Set(ps.map((x) => x.id)).size, ps.length, p);
    assert.deepEqual(validate(l), l, `${p} reads back unchanged`);
  }
  assert.equal(layoutText(preset("plot-map")), "((plot / map) | inspector)");
});

test("sizes are positive, at least the minimum, and add up to one", () => {
  const s = normSizes([0, -1, 5], 3);
  assert.ok(close(sum(s), 1));
  assert.ok(s.every((x) => x >= MIN_SIZE - 1e-12));
  assert.deepEqual(normSizes(undefined, 2), [0.5, 0.5]);
});

test("normalising collapses lone children and merges splits of one direction", () => {
  const a = pane("plot"), b = pane("map"), c = pane("sky");
  const n = normalise(split("row", [split("row", [a, b], [0.5, 0.5]), split("col", [c])], [0.5, 0.5]));
  assert.equal(n.split, "row");
  assert.deepEqual(n.kids.map((k) => k.pane), ["plot", "map", "sky"]);
  assert.ok(close(n.sizes[0], 0.25) && close(n.sizes[2], 0.5));
});

test("split, close, change view, swap", () => {
  let l = preset("plot-map");
  const [plot, map, ins] = panes(l);
  l = splitPane(l, plot.id, "row", "sky");
  assert.equal(panes(l).length, 4);
  assert.deepEqual(panes(l).map((p) => p.pane), ["plot", "sky", "map", "inspector"]);
  l = closePane(l, map.id);
  assert.deepEqual(panes(l).map((p) => p.pane), ["plot", "sky", "inspector"]);
  l = setView(l, ins.id, "console");
  assert.equal(panes(l)[2].pane, "console");
  assert.deepEqual(setView(l, ins.id, "nonsense"), l, "an unknown view is refused");
  l = swapPanes(l, plot.id, ins.id);
  assert.deepEqual(panes(l).map((p) => p.pane), ["console", "sky", "plot"]);
  let one = pane("map");
  assert.deepEqual(closePane(one, one.id), one, "the last pane stays");
});

test("docking a pane at a side of another moves it there", () => {
  let l = preset("plot-map");
  const [plot, map, ins] = panes(l);
  const d = dockPane(l, ins.id, plot.id, "left");
  assert.deepEqual(panes(d).map((p) => p.pane), ["inspector", "plot", "map"]);
  assert.equal(d.split, "col", "the inspector's old column is gone: plot and map stack, the inspector beside the plot");
  const top = dockPane(l, map.id, ins.id, "top");
  assert.deepEqual(panes(top).map((p) => p.pane), ["plot", "map", "inspector"]);
  assert.equal(pathOf(top, map.id).length, 2);
  assert.deepEqual(panes(dockPane(l, plot.id, ins.id, "center")).map((p) => p.pane), ["inspector", "map", "plot"], "center swaps");
  assert.deepEqual(dockPane(l, plot.id, plot.id, "left"), l);
  assert.deepEqual(dockPane(l, "p999999", plot.id, "left"), l);
});

test("dragging the bar between two panes resizes only those two, within the minimum", () => {
  const l = preset("plot-map");
  const r = resize(l, [], 0, 0.1);
  assert.ok(close(r.sizes[0], 0.82) && close(r.sizes[1], 0.18));
  const far = resize(l, [], 0, 5);
  assert.ok(close(far.sizes[1], MIN_SIZE));
  assert.deepEqual(resize(l, [], 3, 0.1), l, "no such bar");
  assert.ok(close(barDelta([0.5, 0.5], 0, 300, 1000), -0.2));
});

test("a layout read from a file is checked: unknown views, deep trees and duplicate ids are dealt with", () => {
  assert.equal(validate(null), null);
  assert.equal(validate({ pane: "evil" }), null);
  assert.equal(validate({ split: "row", kids: [] }), null);
  const v = validate({ split: "row", sizes: [1, 1, 1], kids: [{ pane: "plot", id: "p1" }, { pane: "map", id: "p1" }, { pane: "nope" }] });
  assert.equal(panes(v).length, 2);
  assert.notEqual(panes(v)[0].id, panes(v)[1].id);
  let deep = { pane: "plot", id: "p5" };
  for (let i = 0; i < 12; i++) deep = { split: i % 2 ? "row" : "col", kids: [deep, { pane: "map" }] };
  const depth = (n) => (n.pane ? 0 : 1 + Math.max(...n.kids.map(depth)));
  assert.ok(depth(validate(deep)) <= 6, "a subtree too deep is dropped");
  const many = { split: "row", kids: Array.from({ length: 30 }, () => ({ pane: "plot" })) };
  assert.equal(panes(validate(many)).length, 12, "at most twelve panes");
});

test("new pane ids never reuse one of a layout read back", () => {
  seedIds({ split: "row", kids: [{ pane: "plot", id: "p900" }, { pane: "map", id: "p3" }] });
  assert.ok(Number(paneId().slice(1)) > 900);
});

test("named layouts and each tab's panes are kept with the project", () => {
  const saved = { "Map work": preset("map-focus"), "": preset("four"), Bad: { pane: "x" } };
  const back = readSaved(savedFile(saved));
  assert.deepEqual(Object.keys(back), ["Map work"]);
  assert.deepEqual(readSaved("{"), {});
  const dock = preset("analysis");
  const files = projectFiles({ name: "P", runs: [], tabs: [{ key: 1, file: "a.toml", title: "A", toml: "x = 1\n", baseToml: "x = 1\n", view: "dock", dock }], savedLayouts: { "Map work": preset("map-focus") } });
  assert.ok(files.some((f) => f.path === "layouts/saved.json"));
  const p = readProject(files);
  assert.deepEqual(p.tabs[0].dock, dock);
  assert.deepEqual(Object.keys(p.savedLayouts), ["Map work"]);
});
