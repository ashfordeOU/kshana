// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the multi-run overlay logic — the N-way generalisation of the proven
// 2-way compare. overlayRows picks the best run per (clock, metric) honouring the
// metric direction; a metric missing on any run is skipped (no half rows, the
// compare.mjs invariant). Pure data -> rows; the table/charts are verified in the
// browser. Run with `node web/overlay.test.mjs`.
import { overlayRows, overlaySeriesSvg } from "./overlay.mjs";
import assert from "node:assert/strict";

const mk = (fom) => ({ quantum: { spec: { id: "optical" }, fom }, classical: { spec: { id: "csac" }, fom } });

// Best-pick across 3 runs, honouring direction.
//   holdover_s [50,150,90]  lowerBetter=false -> best idx 1 (arithmetic oracle)
//   timing_rms_ns [5,8,3]   lowerBetter=true  -> best idx 2 (arithmetic oracle)
{
  const runs = [
    { label: "A", result: mk({ holdover_s: 50, timing_rms_ns: 5, timing_p95_ns: 9, availability: 0.9 }) },
    { label: "B", result: mk({ holdover_s: 150, timing_rms_ns: 8, timing_p95_ns: 9, availability: 0.95 }) },
    { label: "C", result: mk({ holdover_s: 90, timing_rms_ns: 3, timing_p95_ns: 9, availability: 0.99 }) },
  ];
  const rows = overlayRows(runs).filter((r) => r.clock === "quantum");
  const by = (k) => rows.find((r) => r.metric === k);

  assert.deepEqual(by("holdover_s").values, [50, 150, 90], "holdover values per run");
  assert.equal(by("holdover_s").best, 1, "holdover: higher is better -> run B (idx 1)");

  assert.deepEqual(by("timing_rms_ns").values, [5, 8, 3], "timing_rms values per run");
  assert.equal(by("timing_rms_ns").best, 2, "timing_rms: lower is better -> run C (idx 2)");

  assert.equal(by("availability").best, 2, "availability: higher is better -> run C");
  // Carries the metric label/unit and the human clock label.
  assert.equal(by("holdover_s").label, "Holdover", "metric label");
  assert.equal(by("holdover_s").unit, "s", "metric unit");
  assert.equal(by("holdover_s").clockLabel, "optical", "clock label");
}

// A metric missing on ANY run is skipped entirely (no half rows).
{
  const runs = [
    { label: "A", result: mk({ holdover_s: 1, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 }) },
    { label: "B", result: mk({ holdover_s: 2, timing_rms_ns: 1, timing_p95_ns: 1 /* no availability */ }) },
    { label: "C", result: mk({ holdover_s: 3, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 }) },
  ];
  const rows = overlayRows(runs).filter((r) => r.clock === "quantum");
  assert.ok(!rows.some((r) => r.metric === "availability"), "availability skipped (missing on B)");
  assert.ok(rows.some((r) => r.metric === "holdover_s"), "holdover present on all -> kept");
  // Every kept row has exactly one value per run.
  for (const r of rows) assert.equal(r.values.length, runs.length, "one value per run");
}

// A clock missing on one run drops that clock entirely (mirrors compare's invariant).
{
  const runs = [
    { label: "A", result: { quantum: { spec: { id: "q" }, fom: { holdover_s: 1, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 } } } },
    { label: "B", result: mk({ holdover_s: 2, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 }) },
  ];
  const rows = overlayRows(runs);
  assert.ok(rows.every((r) => r.clock === "quantum"), "only the shared clock survives");
}

// overlaySeriesSvg: a multi-color overlaid timeseries with a baked legend.
{
  const series = (vals) => vals.map((e, i) => ({ t: i * 10, error_ns: e }));
  const runs = [
    { label: "A", result: { quantum: { series: series([0, 1, 2]) } } },
    { label: "B", result: { quantum: { series: series([0, 2, 4]) } } },
  ];
  const svg = overlaySeriesSvg(runs, "error_ns", { ver: "0.13.0", hash: "deadbeefcafe9999" });
  assert.ok(svg.startsWith("<svg"), "starts with <svg");
  assert.ok(svg.includes("Kshana"), "carries provenance");
  // One polyline per run.
  assert.equal((svg.match(/<polyline/g) || []).length, 2, "one polyline per run");
  // Legend carries the run labels.
  assert.ok(svg.includes("A") && svg.includes("B"), "legend has run labels");
  assert.ok(svg.endsWith("</svg>"), "ends with </svg>");
}

// Flat single-solution results (Mars-PNT result.fom / PVT result.fix) — no
// quantum/classical branches — must still compare on their numeric figures of
// merit, excluding bookkeeping (epochs/counts).
{
  const mk = (rms, relays) => ({ result: { fom: { converged_pos_rms_m: rms, mean_relays_in_view: relays, epochs: 100 } } });
  const runs = [{ label: "A", ...mk(0.21, 3.2) }, { label: "B", ...mk(0.40, 3.0) }];
  const rows = overlayRows(runs);
  const by = (k) => rows.find((r) => r.metric === k);
  assert.ok(by("converged_pos_rms_m"), "flat: position-RMS row present (no quantum/classical)");
  assert.deepEqual(by("converged_pos_rms_m").values, [0.21, 0.4], "flat: values per run");
  assert.equal(by("converged_pos_rms_m").best, 0, "flat: lower position RMS wins (A)");
  assert.equal(by("converged_pos_rms_m").unit, "m", "flat: inferred unit");
  assert.equal(by("mean_relays_in_view").best, 0, "flat: more relays-in-view wins (A)");
  assert.ok(!by("epochs"), "flat: bookkeeping (epochs) excluded");
}

console.log("overlay.test.mjs: all assertions passed");
