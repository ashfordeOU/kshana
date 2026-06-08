// SPDX-License-Identifier: Apache-2.0
// Tests for the playground parameter-sweep helpers — the inclusive linspace, the
// per-step TOML patch, the figure-of-merit extractor, and the sweep-curve SVG.
// Pure logic; the loop that calls the wasm run() and renders/hovers the chart is
// verified in the browser. Run with `node web/sweep.test.mjs`.
import { sweepValues, sweepToml, extractFom, sweepCurveSvg } from "./sweep.mjs";
import { readScalar } from "./share.mjs";
import { readSectionScalar } from "./guided.mjs";
import assert from "node:assert/strict";

// sweepValues: inclusive linspace v_i = min + (max-min)·i/(steps-1). Arithmetic
// oracles — integer and even-step cases are exact.
{
  assert.deepEqual(sweepValues(0, 10, 11), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "0..10 step 1");
  assert.deepEqual(sweepValues(20, 100, 5), [20, 40, 60, 80, 100], "20..100 in 5");
  const v = sweepValues(0, 10, 11);
  assert.equal(v[0], 0, "first === min");
  assert.equal(v[v.length - 1], 10, "last === max");
  // A 2-step sweep is just the endpoints.
  assert.deepEqual(sweepValues(3, 9, 2), [3, 9], "2 steps -> endpoints");
}

// sweepToml: patch a top-level scalar, round-trip via readScalar.
{
  const base = "seed = 42\nthreshold_ns = 20.0\n[time]\nstep_s = 10.0\n";
  const out = sweepToml(base, { key: "seed", section: "" }, 9);
  assert.equal(readScalar(out, "seed"), "9", "top-level seed round-trips to 9");
  // The sectioned key is untouched by a top-level patch.
  assert.equal(readSectionScalar(out, "time", "step_s"), "10.0", "sectioned key untouched");
}

// sweepToml: patch a sectioned scalar via the guided.mjs helpers.
{
  const base = "seed = 42\n[time]\nstep_s = 10.0\nduration_s = 7200.0\n";
  const out = sweepToml(base, { key: "step_s", section: "time" }, 30);
  assert.equal(readSectionScalar(out, "time", "step_s"), "30", "sectioned step_s round-trips to 30");
  assert.equal(readScalar(out, "seed"), "42", "top-level key untouched");
}

// extractFom: pull one figure-of-merit scalar out of a run result; null when
// the clock or the metric is missing.
{
  const result = {
    quantum: { fom: { holdover_s: 42, timing_rms_ns: 0.7 } },
    classical: { fom: { holdover_s: 12 } },
  };
  assert.equal(extractFom(result, "quantum", "holdover_s"), 42, "reads quantum.fom.holdover_s");
  assert.equal(extractFom(result, "classical", "holdover_s"), 12, "reads classical.fom.holdover_s");
  assert.equal(extractFom(result, "quantum", "missing"), null, "missing metric -> null");
  assert.equal(extractFom(result, "absent", "holdover_s"), null, "missing clock -> null");
  assert.equal(extractFom(null, "quantum", "holdover_s"), null, "null result -> null");
  // A non-numeric value is treated as absent.
  assert.equal(extractFom({ quantum: { fom: { x: null } } }, "quantum", "x"), null, "null value -> null");
}

// sweepCurveSvg: a self-describing linear-linear chart string carrying the title.
{
  const axis = { xLabel: "seed", yLabel: "holdover (s)", title: "Holdover vs seed" };
  const svg = sweepCurveSvg([{ x: 0, y: 1 }, { x: 1, y: 2 }, { x: 2, y: 1.5 }], axis, { ver: "0.13.0", hash: "deadbeefcafe9999" });
  assert.ok(svg.startsWith("<svg"), "starts with <svg");
  assert.ok(svg.includes("Holdover vs seed"), "contains the axis title");
  assert.ok(svg.includes("seed"), "contains the x label");
  assert.ok(svg.includes("Kshana"), "carries the provenance line");
  assert.ok(svg.includes("<polyline"), "draws a polyline");
  assert.ok(svg.endsWith("</svg>"), "ends with </svg>");
}

// sweepCurveSvg: a single point (or empty) still returns a valid SVG (no throw).
{
  const axis = { xLabel: "x", yLabel: "y", title: "T" };
  assert.ok(sweepCurveSvg([{ x: 0, y: 0 }], axis, null).startsWith("<svg"), "single point ok");
  assert.ok(sweepCurveSvg([], axis, null).startsWith("<svg"), "empty points ok");
}

console.log("sweep.test.mjs: all assertions passed");
