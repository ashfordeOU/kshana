// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U13): journal figures. Run: node --test apps/desktop/shell/lib/chart/journal.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { normalise, homeView, visibleRows } from "./data.mjs";
import { toCSV } from "./export.mjs";
import { journalFigure, journalSVG, journalPDF, csvOfSVG, pngSize, JOURNAL_STYLES, DENSE, journalFilename } from "./journal.mjs";

const spec = normalise({
  type: "xy", title: "Time error", x: { label: "time", unit: "s", time: true }, y: { label: "time error", unit: "ns" },
  series: [
    { id: "a", label: "quantum", x: [0, 10, 20, 30, 40, 50], y: [0, 1.5, 2.25, 3, 2.5, 4], unit: "ns" },
    { id: "b", label: "classical", x: [0, 10, 20, 30, 40, 50], y: [0, 3, 6, 9, 12, 15], unit: "ns" },
  ],
  overlays: [{ kind: "hline", y: 10, label: "threshold" }],
});

test("every preset draws the visible data and carries it as the chart's own CSV", () => {
  const view = { x: [10, 40], y: [0, 14], y2: null };
  for (const id of Object.keys(JOURNAL_STYLES)) {
    const fig = journalFigure(spec, view, [], id);
    const { header, rows } = visibleRows(spec, view, new Set());
    assert.equal(fig.csv, toCSV(header, rows), id);
    const svg = journalSVG(fig, "Time error");
    assert.equal(csvOfSVG(svg), fig.csv, `${id}: the SVG's data is the on-screen data`);
    assert.match(svg, /width="[\d.]+pt" height="[\d.]+pt"/);
    assert.equal(fig.w, JOURNAL_STYLES[id].width.single);
  }
});

test("each drawn vertex maps back to a data point exactly (no point moved, none invented)", () => {
  const view = { x: [10, 40], y: [0, 14], y2: null };
  const fig = journalFigure(spec, view, [], "ieee");
  const paths = fig.list.filter((p) => p.k === "path" && p.width === JOURNAL_STYLES.ieee.line && p.pts.length > 4);
  assert.equal(paths.length, 2);
  paths.forEach((p, k) => {
    const s = spec.series[k];
    // the window holds x = 10..40 and one point beyond each edge
    assert.equal(p.pts.length / 2, 6);
    for (let i = 0; i < p.pts.length; i += 2) {
      const x = fig.scales.x.inv(p.pts[i]), y = fig.scales.y.inv(p.pts[i + 1]);
      const j = s.x.indexOf(Math.round(x));
      assert.ok(j >= 0 && Math.abs(s.x[j] - x) < 1e-9 && Math.abs(s.y[j] - y) < 1e-9, `${s.id} vertex ${i / 2}`);
    }
  });
});

test("a hidden series is left out of the figure and of its data", () => {
  const fig = journalFigure(spec, homeView(spec), ["b"], "ion");
  assert.deepEqual(fig.series.map((s) => s.id), ["a"]);
  assert.ok(!fig.csv.includes("classical"));
});

test("a dense series keeps its extremes inside the window", () => {
  const n = DENSE * 5, x = new Float64Array(n), y = new Float64Array(n);
  for (let i = 0; i < n; i++) { x[i] = i; y[i] = Math.sin(i / 50); }
  y[54321] = 9; y[70001] = -7;
  const s = normalise({ type: "xy", series: [{ id: "d", x, y }] });
  const fig = journalFigure(s, { x: [0, n - 1], y: [-8, 10] }, [], "aiaa");
  const p = fig.list.find((q) => q.k === "path" && q.pts.length > 100);
  assert.ok(p.pts.length / 2 < n / 4, "reduced");
  const ys = []; for (let i = 1; i < p.pts.length; i += 2) if (p.pts[i] === p.pts[i]) ys.push(fig.scales.y.inv(p.pts[i]));
  assert.ok(Math.abs(Math.max(...ys) - 9) < 1e-9 && Math.abs(Math.min(...ys) + 7) < 1e-9, "the spikes are drawn at their values");
});

test("the PDF is one page of vectors with a correct cross-reference table and the data embedded", () => {
  const fig = journalFigure(spec, homeView(spec), [], "ieee", { columns: "double", title: true });
  const pdf = journalPDF(fig, "Time error (quantum, classical)");
  const text = Buffer.from(pdf).toString("latin1");
  assert.ok(text.startsWith("%PDF-1.4"));
  assert.ok(text.trimEnd().endsWith("%%EOF"));
  const xref = Number(/startxref\n(\d+)/.exec(text)[1]);
  assert.ok(text.slice(xref).startsWith("xref"));
  const offs = [...text.slice(xref).matchAll(/^(\d{10}) 00000 n $/gm)].map((m) => Number(m[1]));
  offs.forEach((o, i) => assert.ok(text.slice(o).startsWith(`${i + 1} 0 obj`), `object ${i + 1} at its offset`));
  assert.match(text, /\/MediaBox \[0 0 515\.5 /);
  assert.ok(text.includes(fig.csv), "the visible data rides along as a file");
  assert.match(text, /Time error \\\(quantum, classical\\\)/, "parentheses in text are escaped");
  for (const m of text.matchAll(/<< \/Length (\d+) >>\nstream\n/g)) {
    const start = m.index + m[0].length;
    assert.equal(text.slice(start + Number(m[1]), start + Number(m[1]) + 10), "\nendstream");
  }
});

test("a sky chart becomes a square figure; PNG sizes follow the resolution", () => {
  const sky = normalise({ type: "polar", title: "Sky", mask: 10, tracks: [{ id: "G01", az: [0, 45, 90], el: [10, 40, 70], t: [0, 60, 120] }] });
  const fig = journalFigure(sky, homeView(sky), [], "ieee");
  assert.equal(fig.w, fig.h);
  assert.equal(fig.csv.trim().split("\n").length, 4);
  assert.deepEqual(pngSize(fig, 300), { width: Math.round(fig.w * 300 / 72), height: Math.round(fig.h * 300 / 72), scale: 300 / 72 });
  assert.equal(journalFilename("Time error · run 3", "ion", "pdf"), "time-error-run-3-ion.pdf");
  assert.throws(() => journalFigure(normalise({ type: "heatmap", grid: { x: [0], y: [0], z: [[1]] } }), { x: [0, 1], y: [0, 1] }, [], "ieee"));
});
