// SPDX-License-Identifier: Apache-2.0
// Tests for the chart-download helpers' pure logic (filename construction and
// SVG-size parsing). The DOM-bound parts (blob download, PNG rasterisation) are
// verified in the browser. Run with `node web/chartdl.test.mjs`.
import { chartFilename, svgSize } from "./chartdl.mjs";
import assert from "node:assert/strict";

// chartFilename: descriptive, provenance-stamped, and filesystem-safe.
{
  const meta = { ver: "0.12.0", hash: "820999dd0e8a1122334455" };
  assert.equal(
    chartFilename("holdover", meta, "svg"),
    "kshana-holdover-v0.12.0-820999dd0e8a.svg",
    "includes base, version and 12-char hash with the extension",
  );
  assert.equal(
    chartFilename("allan", meta, "png"),
    "kshana-allan-v0.12.0-820999dd0e8a.png",
    "honours the requested extension and base name",
  );
}

// chartFilename: degrades gracefully when provenance is missing.
{
  assert.equal(chartFilename("holdover", null, "svg"), "kshana-holdover.svg", "no meta -> bare name");
  assert.equal(
    chartFilename("allan", { ver: "1.2.3" }, "png"),
    "kshana-allan-v1.2.3.png",
    "version only, no hash",
  );
  assert.equal(
    chartFilename("allan", { hash: "deadbeefcafe9999" }, "svg"),
    "kshana-allan-deadbeefcafe.svg",
    "hash only, no version",
  );
}

// svgSize: reads the *root* <svg> width/height, not a later rect/line.
{
  const holdover = '<svg xmlns="http://www.w3.org/2000/svg" width="820" height="420" font-size="12"><rect width="820" height="420" fill="#0c0b08"/></svg>';
  assert.deepEqual(svgSize(holdover), { w: 820, h: 420 }, "holdover root size");

  const allan = '<svg xmlns="http://www.w3.org/2000/svg" width="760" height="360"><rect width="760" height="360"/><line x1="0" width="2"/></svg>';
  assert.deepEqual(svgSize(allan), { w: 760, h: 360 }, "allan root size, ignores inner width attrs");
}

// svgSize: tolerates fractional dimensions and a malformed/empty string.
{
  assert.deepEqual(svgSize('<svg width="100.5" height="50.25"></svg>'), { w: 100.5, h: 50.25 }, "fractional dims");
  assert.deepEqual(svgSize("not an svg"), { w: 0, h: 0 }, "missing dims -> zero");
}

console.log("chartdl.test.mjs: all assertions passed");
