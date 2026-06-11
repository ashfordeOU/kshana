// SPDX-License-Identifier: Apache-2.0
// Tests for the playground parameter-sweep helpers — the inclusive linspace, the
// per-step TOML patch, the figure-of-merit extractor, and the sweep-curve SVG.
// Pure logic; the loop that calls the wasm run() and renders/hovers the chart is
// verified in the browser. Run with `node web/sweep.test.mjs`.
import { sweepValues, sweepToml, extractFom, sweepMetrics, sweepCurveSvg } from "./sweep.mjs";
import { readScalar } from "./share.mjs";
import { readSectionScalar } from "./guided.mjs";
import assert from "node:assert/strict";

// sweepMetrics adapts the plottable figures of merit to the result shape: clock
// FoMs for a clock scenario, ground-track extrema for the ephemeris pack, and an
// empty list (so the caller hides the Sweep tab) when nothing is sweepable.
{
  const clock = {
    quantum: { spec: { id: "optical" }, fom: { holdover_s: 120, timing_rms_ns: 0.7, availability: 0.99 } },
    classical: { spec: { id: "csac" }, fom: { holdover_s: 12 } },
  };
  const cm = sweepMetrics(clock);
  assert.ok(cm.some((m) => m.id === "quantum::holdover_s"), "clock quantum holdover metric present");
  assert.ok(cm.some((m) => m.id === "classical::holdover_s"), "clock classical holdover metric present");
  assert.equal(cm.find((m) => m.id === "quantum::holdover_s").get(clock), 120, "clock metric extracts its value");
  assert.ok(cm.find((m) => m.id === "quantum::holdover_s").label.includes("optical"), "clock metric labelled by spec id");
  assert.ok(!cm.some((m) => m.id.startsWith("ephem::")), "no ephemeris metrics on a clock result");

  const ephem = {
    source: "sgp4 (TLE)", n_samples: 94,
    lat_min_deg: -51.8, lat_max_deg: 51.8, alt_min_km: 419, alt_max_km: 434,
    speed_min_m_s: 7653, speed_max_m_s: 7661, max_elevation_deg: 25.7, peak_doppler_hz: 34300,
    samples: [{ t_s: 0, lat_deg: 0, lon_deg: 0, alt_km: 420 }],
  };
  const em = sweepMetrics(ephem);
  assert.ok(em.some((m) => m.id === "ephem::max_elevation_deg"), "ephemeris max-elevation metric present");
  assert.ok(em.some((m) => m.id === "ephem::peak_doppler_hz"), "ephemeris peak-Doppler metric present");
  assert.ok(em.some((m) => m.id === "ephem::alt_max_km"), "ephemeris max-altitude metric present");
  assert.equal(em.find((m) => m.id === "ephem::max_elevation_deg").get(ephem), 25.7, "ephemeris metric extracts its value");
  assert.ok(!em.some((m) => m.id.startsWith("quantum::")), "no clock metrics on an ephemeris result");

  const noStation = { ...ephem, max_elevation_deg: undefined, peak_doppler_hz: undefined };
  const nm = sweepMetrics(noStation);
  assert.ok(!nm.some((m) => m.id === "ephem::max_elevation_deg"), "no max-elevation metric without a station");
  assert.ok(nm.some((m) => m.id === "ephem::alt_max_km"), "altitude metric still present without a station");

  assert.deepEqual(sweepMetrics(null), [], "null result -> no metrics");
  assert.deepEqual(sweepMetrics({ foo: 1 }), [], "an unrecognised result -> no metrics (Sweep tab hidden)");
}

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
