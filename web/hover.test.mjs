// SPDX-License-Identifier: Apache-2.0
// Tests for the chart-hover pure logic — mapping a cursor position over a chart
// image to the nearest data sample. The DOM overlay (crosshair + tooltip) is
// verified in the browser. Run with `node web/hover.test.mjs`.
import { nearestIndexByValue, cursorToPlotFraction } from "./hover.mjs";
import assert from "node:assert/strict";

// nearestIndexByValue: index of the closest value (ascending series).
{
  assert.equal(nearestIndexByValue(5, [0, 4, 8]), 1, "5 is closest to 4");
  assert.equal(nearestIndexByValue(7, [0, 4, 8]), 2, "7 is closest to 8");
  assert.equal(nearestIndexByValue(6, [0, 4, 8]), 2, "tie-ish leans to 8 (|6-8|=2=|6-4|, last wins on <=)");
  assert.equal(nearestIndexByValue(-3, [0, 4, 8]), 0, "below range clamps to first");
  assert.equal(nearestIndexByValue(100, [0, 4, 8]), 2, "above range clamps to last");
  assert.equal(nearestIndexByValue(2, [10]), 0, "single element");
  assert.equal(nearestIndexByValue(2, []), -1, "empty -> -1");
}

// cursorToPlotFraction: maps a cursor x (in CSS px, relative to the image's
// rendered box) to a 0..1 fraction across the plot area, accounting for the
// intrinsic margins scaled to the rendered width. Returns null outside the plot.
{
  // intrinsic width 820, left margin 70, right margin 20 -> plot [70,800] width 730.
  const geom = { wIntrinsic: 820, ml: 70, mr: 20 };
  // Rendered at half size: renderedWidth 410 -> scale 0.5. Plot in CSS px: [35, 400].
  const f = (cssX) => cursorToPlotFraction(cssX, 410, geom);
  assert.equal(f(35), 0, "left plot edge -> 0");
  assert.equal(f(400), 1, "right plot edge -> 1");
  assert.ok(Math.abs(f(217.5) - 0.5) < 1e-9, "centre -> 0.5");
  assert.equal(f(10), null, "left of plot -> null");
  assert.equal(f(405), null, "right of plot -> null");
}

console.log("hover.test.mjs: all assertions passed");
