// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the run view's plot drawn by the interactive chart (0.42 U12, U30).
// Run: node --test apps/desktop/shell/lib/plot.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { plotSpec, chartClock } from "./plot.mjs";
import { createClock } from "./clock.mjs";
import { normalise, visibleRows } from "./chart/data.mjs";

const model = {
  title: "Timing error", yLabel: "time error (ns)", epochMs: Date.UTC(2026, 0, 1), threshold: 20, thresholdLabel: "threshold",
  series: [{ id: "s0", label: "quantum", unit: "ns", color: "var(--s-tim)", t: Float64Array.from([0, 10, 20]), v: Float64Array.from([0, 1, 2]) }],
};

test("the chart spec carries the model's series unchanged, a time axis in UTC and the threshold", () => {
  const spec = plotSpec(model);
  assert.equal(spec.type, "xy");
  assert.equal(spec.y.label, "time error");
  assert.equal(spec.y.unit, "ns");
  assert.equal(spec.x.time, true);
  assert.equal(spec.x.format(10), "00:00:10 UTC");
  assert.deepEqual(spec.overlays, [{ kind: "hline", y: 20, label: "threshold", color: "bad" }]);
  const n = normalise(spec);
  assert.deepEqual(visibleRows(n, { x: [0, 20], y: [0, 2] }).rows, [["quantum", 0, 0, "ns"], ["quantum", 10, 1, "ns"], ["quantum", 20, 2, "ns"]], "the plotted values are the model's");
  assert.equal(plotSpec({ ...model, epochMs: NaN }).x.format, null, "without a UTC epoch the chart's own run-time labels");
});

test("the chart's clock is the run's clock", () => {
  const clock = createClock({ start: 0, end: 100 });
  const cc = chartClock(clock);
  const seen = [];
  const off = cc.subscribe((s) => seen.push(s.reason));
  cc.set(40);
  assert.equal(clock.t, 40);
  assert.equal(cc.now, 40);
  cc.setRange(10, 60);
  assert.deepEqual(cc.range, [10, 60]);
  assert.deepEqual(seen, ["scrub", "range"]);
  off();
});
