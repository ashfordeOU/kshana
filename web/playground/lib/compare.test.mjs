// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the A/B compare logic — figure-of-merit deltas between two runs.
// Pure data -> rows; the table/chart rendering is verified in the browser.
// Run with `node web/compare.test.mjs`.
import { fomDeltas } from "./compare.mjs";
import assert from "node:assert/strict";

const mk = (q, c) => ({
  quantum: { spec: { id: "optical" }, fom: q },
  classical: { spec: { id: "csac" }, fom: c },
});

// Mixed better/worse, both clocks present, with the "lower is better" /
// "higher is better" direction correctly classified.
{
  const a = mk(
    { holdover_s: 100, timing_rms_ns: 5, timing_p95_ns: 9, availability: 0.9 },
    { holdover_s: 50, timing_rms_ns: 20, timing_p95_ns: 40, availability: 0.7 },
  );
  const b = mk(
    { holdover_s: 150, timing_rms_ns: 8, timing_p95_ns: 9, availability: 1.0 },
    { holdover_s: 50, timing_rms_ns: 12, timing_p95_ns: 30, availability: 0.7 },
  );
  const rows = fomDeltas(a, b);
  const q = rows.filter((r) => r.clock === "quantum");
  const by = (k) => q.find((r) => r.metric === k);

  // holdover: higher is better, B larger -> B wins
  assert.equal(by("holdover_s").delta, 50);
  assert.equal(by("holdover_s").pct, 50);
  assert.equal(by("holdover_s").better, "b");
  assert.equal(by("holdover_s").lowerBetter, false);

  // timing_rms: lower is better, B larger -> A wins
  assert.equal(by("timing_rms_ns").delta, 3);
  assert.equal(by("timing_rms_ns").better, "a");
  assert.equal(by("timing_rms_ns").lowerBetter, true);

  // equal value -> "equal", delta 0
  assert.equal(by("timing_p95_ns").delta, 0);
  assert.equal(by("timing_p95_ns").better, "equal");

  // availability: higher is better
  assert.equal(by("availability").better, "b");

  // carries the human clock label for the table header
  assert.equal(by("holdover_s").clockLabel, "optical");
}

// A clock missing on one side is skipped entirely (no half rows).
{
  const a = { quantum: { spec: { id: "x" }, fom: { holdover_s: 1, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 } } };
  const b = mk(
    { holdover_s: 2, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 },
    { holdover_s: 2, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 },
  );
  const rows = fomDeltas(a, b);
  assert.ok(rows.every((r) => r.clock === "quantum"), "only the shared clock compared");
}

// Non-numeric / absent metrics (e.g. integrity = null) are skipped, and a zero
// baseline yields a null percentage (no divide-by-zero) but still a signed delta.
{
  const a = mk(
    { holdover_s: 0, timing_rms_ns: 0, timing_p95_ns: 5, availability: 1, integrity: null },
    { holdover_s: 1, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 },
  );
  const b = mk(
    { holdover_s: 10, timing_rms_ns: 5, timing_p95_ns: 5, availability: 1 },
    { holdover_s: 1, timing_rms_ns: 1, timing_p95_ns: 1, availability: 1 },
  );
  const q = fomDeltas(a, b).filter((r) => r.clock === "quantum");
  const rms = q.find((r) => r.metric === "timing_rms_ns");
  assert.equal(rms.pct, null, "zero baseline -> null pct");
  assert.equal(rms.delta, 5);
  assert.equal(rms.better, "a", "rms went up from 0 -> A (lower) wins");
  assert.ok(!q.some((r) => r.metric === "integrity"), "non-FoM keys not emitted");
}

console.log("compare.test.mjs: all assertions passed");
