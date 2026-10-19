// SPDX-License-Identifier: AGPL-3.0-only
// The shape below is the engine's `SelfReportEpoch` and `SelfReportSummary` (feat/referee-0.38, src/receiver_trust/monitors.rs),
// written out by hand: a shape fixture for the reader, not data from any receiver.
import test from "node:test";
import assert from "node:assert/strict";
import { readSelfReport, readSelfSummary, selfReportAt, summaryLines, AGREEMENTS } from "./trust-selfreport.mjs";
import { buildRun, reasonsAt } from "./trust.mjs";

const ep = (t, state, sr) => ({ t_s: t, state, alarms: [], marine: { position: [59, 24], ratios: [] }, score: { score: 100, band: state, deductions: [] }, ...(sr ? { self_report: sr } : {}) });
const sr = (agreement, spoof = 1, jam = 1, flag = false, alarm = false) => ({ spoofing_state: spoof, jamming_state: jam, receiver_flag: flag, kshana_alarm: alarm, agreement });
const result = (withSr) => ({
  advisory: "x", score_model: { nominal_min: 90, degraded_min: 55, onset_ratio: 0.5, full_ratio: 1.5, evidence_hold_s: 10, weights: {} }, monitors_run: ["cn0-drop"], states: {}, events: [],
  ...(withSr ? { receiver_self_report: { note: "the receiver's own flags ... neither is ground truth, agreement is not validation", epochs_reported: 3, receiver_flag_epochs: 2, both: 1, receiver_only: 1, kshana_only: 0, neither: 1, spoofing_flag_epochs: 2, jamming_flag_epochs: 0, first_receiver_flag_s: 2, first_kshana_alarm_s: 2 } } : {}),
  epochs: [ep(0, "calibrating", withSr && sr("calibrating", null, null)), ep(1, "nominal", withSr && sr("neither")), ep(2, "untrusted", withSr && sr("both", 2, 1, true, true)), ep(3, "nominal", withSr && sr("receiver-only", 3, 1, true, false))],
});

test("a result with the engine's self-report fields is read, per epoch and as a summary", () => {
  const { run } = buildRun({ result: result(true) });
  assert.equal(run.hasSelfReport, true);
  assert.deepEqual(run.epochs.map((e) => e.selfReport.agreement), ["calibrating", "neither", "both", "receiver-only"]);
  assert.equal(run.epochs[3].selfReport.spoofing, 3); assert.equal(run.epochs[3].selfReport.receiverFlag, true); assert.equal(run.epochs[3].selfReport.kshanaAlarm, false);
  assert.equal(run.selfSummary.receiverFlagEpochs, 2); assert.equal(run.selfSummary.firstReceiverFlagS, 2); assert.match(run.selfSummary.note, /neither is ground truth/);
});
test("a result without them has no lane, never a lane of 'neither'", () => {
  const { run } = buildRun({ result: result(false) });
  assert.equal(run.hasSelfReport, false); assert.equal(run.selfSummary, null); assert.ok(run.epochs.every((e) => e.selfReport === null));
  assert.match(selfReportAt(run.epochs[1]).heading, /no receiver flag/);
});
test("an agreement or code this page does not know is not read as neither or as a state", () => {
  const r = readSelfReport({ agreement: "mostly", spoofing_state: 9, jamming_state: "2", receiver_flag: "yes" });
  assert.equal(r.agreement, "unknown"); assert.equal(r.odd, "mostly"); assert.equal(r.spoofing, null); assert.equal(r.jamming, null); assert.equal(r.receiverFlag, false);
  assert.equal(readSelfReport(null), null); assert.equal(readSelfReport([]), null); assert.equal(readSelfSummary("x"), null);
  assert.ok(AGREEMENTS.includes("receiver-only"));
});
test("the cursor words name the receiver's own codes and say whose flag it is", () => {
  const { run } = buildRun({ result: result(true) });
  const a = selfReportAt(run.epochs[2]);
  assert.match(a.heading, /both flag/); assert.deepEqual(a.rows[0], ["Receiver spoofing state", "2: indicated"]); assert.deepEqual(a.rows[2], ["Receiver flags", "yes (state 2 or more)"]);
  assert.equal(summaryLines(run.selfSummary).length, 10); assert.deepEqual(summaryLines(null), []);
});
test("the self-report is never listed among the monitors that did not run", () => {
  const { run } = buildRun({ result: result(true) });
  assert.ok(!reasonsAt(run, 2).notRun.includes("receiver-self-report"));
});
