// SPDX-License-Identifier: AGPL-3.0-only
// The shape below is the engine's `Scorecard` (feat/referee-0.38, src/jammertest/score.rs) written out by hand: a shape fixture for the reader, not a result.
import test from "node:test";
import assert from "node:assert/strict";
import { readScorecard, summaryRows, assessability, OUTCOMES } from "./jammertest-card.mjs";

const card = (over = {}) => JSON.stringify({
  label: "MODELLED: scored against the scheduled slots of the published test plan", advisory: "Advisory", scenario_hash: "abc123", options: { recover_hold_s: 10, guard_s: 60 }, baseline_contaminated: false,
  tests: [
    { test_id: "1.1.1", test_name: "Jamming, low power", year: 2025, location_id: 1, plan_status: "", kind: "jamming", onset_s: 600, end_s: 900, evaluable: true, outcome: "detected", latency_s: 12, first_monitors: ["cn0-drop"], recovered: true, time_to_recover_s: 30 },
    { test_id: "1.2.1", test_name: "Spoofing", year: 2025, location_id: 1, plan_status: "", kind: "spoofing", onset_s: 20, end_s: 40, evaluable: false, outcome: "not-evaluable", latency_s: null, first_monitors: [], recovered: null, time_to_recover_s: null },
  ],
  summary: { tests: 2, evaluable: 1, detected: 1, late: 0, missed: 0, detection_rate: 1, detected_in_tolerance_rate: 1, median_latency_s: 12, median_time_to_recover_s: 30, false_alarm_runs: 0, false_alarm_epochs: 0, clean_epochs: 3000, clean_hours: 0.83, false_alarm_epoch_rate: 0, false_alarm_runs_per_hour: 0 },
  ...over,
});

test("a scorecard is read as the engine states it", () => {
  const { card: c, error } = readScorecard(card());
  assert.equal(error, undefined);
  assert.equal(c.tests.length, 2); assert.equal(c.tests[0].outcome, "detected"); assert.equal(c.tests[0].latencyS, 12); assert.deepEqual(c.tests[0].firstMonitors, ["cn0-drop"]);
  assert.equal(c.summary.detectionRate, 1); assert.equal(c.options.guardS, 60); assert.match(c.label, /^MODELLED/);
  assert.ok(OUTCOMES.includes(c.tests[1].outcome));
  assert.equal(summaryRows(c).find(([k]) => k === "Detection rate (any alarm)")[1], "100.0 %");
  assert.equal(assessability(c), "");
});
test("with nothing evaluable no rate is stated and the page says so rather than showing a pass", () => {
  const { card: c } = readScorecard(card({ summary: { tests: 2, evaluable: 0, detected: 0, late: 0, missed: 0, detection_rate: null, detected_in_tolerance_rate: null, median_latency_s: null, median_time_to_recover_s: null, false_alarm_runs: 0, false_alarm_epochs: 0, clean_epochs: 0, clean_hours: null, false_alarm_epoch_rate: null, false_alarm_runs_per_hour: null } }));
  assert.match(assessability(c), /No test was evaluable/); assert.equal(summaryRows(c).find(([k]) => k === "Detection rate (any alarm)")[1], "n/a");
});
test("anything that is not a scorecard is refused with a reason, and a value the page does not know is kept as written", () => {
  assert.match(readScorecard("{").error, /not JSON/); assert.match(readScorecard("{}").error, /not a jammertest scorecard/); assert.match(readScorecard("x".repeat(9 * 1024 * 1024)).error, /larger than 8 MiB/);
  const { card: c } = readScorecard(card({ tests: [{ test_id: "9", outcome: "weird", kind: { custom: 1 } }] }));
  assert.equal(c.tests[0].outcome, "weird"); assert.match(c.tests[0].kind, /custom/); assert.equal(c.tests[0].evaluable, false);
});
