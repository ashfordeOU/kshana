// SPDX-License-Identifier: AGPL-3.0-only
// Reads the scorecard `kshana jammertest score` writes (0.38; engine feat/referee-0.38, src/jammertest/score.rs): the receiver-trust
// run scored against the scheduled slots of a published test plan. The slots are the plan's, not recorded on-air times, so the card is
// MODELLED and says so; the page shows what the file states and decides nothing. A value the page does not know is shown as written,
// never as a pass. Pure; tested in jammertest-card.test.mjs.

import { t } from "./t.mjs";

export const MAX_BYTES = 8 * 1024 * 1024;
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const num = (x) => (isNum(x) ? x : null);
const str = (x, n = 300) => (typeof x === "string" ? x.slice(0, n) : "");
export const OUTCOMES = Object.freeze(["detected", "late", "missed", "not-evaluable"]);

// Text -> { card } or { error }.
export function readScorecard(text, name = "file") {
  if (String(text).length > MAX_BYTES) return { error: t("js-lib-jammertest-card-too-large", "{ $name }: larger than 8 MiB; this page reads a scorecard up to that size.", { name }) };
  let o;
  try { o = JSON.parse(String(text).replace(/^﻿/, "")); } catch (e) { return { error: t("js-lib-jammertest-card-not-json", "{ $name }: not JSON ({ $reason }).", { name, reason: e.message }) }; }
  if (!o || typeof o !== "object" || !Array.isArray(o.tests) || !o.summary || typeof o.summary !== "object") return { error: t("js-lib-jammertest-card-not-scorecard", "{ $name }: not a jammertest scorecard (it needs tests[] and summary).", { name }) };
  const s = o.summary;
  return {
    card: {
      label: str(o.label, 600), advisory: str(o.advisory, 600), hash: str(o.scenario_hash, 80), baselineContaminated: o.baseline_contaminated === true,
      options: { recoverHoldS: num(o.options && o.options.recover_hold_s), guardS: num(o.options && o.options.guard_s) },
      summary: { tests: num(s.tests), evaluable: num(s.evaluable), detected: num(s.detected), late: num(s.late), missed: num(s.missed), detectionRate: num(s.detection_rate), inTolRate: num(s.detected_in_tolerance_rate),
        medianLatencyS: num(s.median_latency_s), medianRecoverS: num(s.median_time_to_recover_s), falseAlarmRuns: num(s.false_alarm_runs), falseAlarmEpochs: num(s.false_alarm_epochs), cleanEpochs: num(s.clean_epochs), cleanHours: num(s.clean_hours),
        falseAlarmEpochRate: num(s.false_alarm_epoch_rate), falseAlarmRunsPerHour: num(s.false_alarm_runs_per_hour) },
      tests: o.tests.slice(0, 2000).filter((t) => t && typeof t === "object").map((t) => ({
        id: str(t.test_id, 40), name: str(t.test_name), year: num(t.year), location: num(t.location_id), planStatus: str(t.plan_status, 60), kind: typeof t.kind === "string" ? t.kind : t.kind ? JSON.stringify(t.kind).slice(0, 60) : "",
        onsetS: num(t.onset_s), endS: num(t.end_s), evaluable: t.evaluable === true, outcome: str(t.outcome, 40), latencyS: num(t.latency_s), firstMonitors: arr(t.first_monitors).map((m) => String(typeof m === "string" ? m : JSON.stringify(m)).slice(0, 40)),
        recovered: typeof t.recovered === "boolean" ? t.recovered : null, recoverS: num(t.time_to_recover_s) })),
    },
  };
}
const arr = (x) => (Array.isArray(x) ? x : []);
const na = () => t("js-lib-jammertest-card-na", "n/a");
const n = (v, d = 0) => (v == null ? na() : v.toFixed(d));
const pct = (v) => (v == null ? na() : `${(100 * v).toFixed(1)} %`);

// [label, value] rows for the summary. A rate with nothing to compute reads "n/a", which the page explains as "not assessable".
export function summaryRows(c) {
  const s = c.summary;
  return [
    [t("js-lib-jammertest-card-tests", "Tests in the plan slice"), n(s.tests)], [t("js-lib-jammertest-card-evaluable", "Evaluable"), n(s.evaluable)], [t("js-lib-jammertest-card-detected", "Detected in tolerance"), n(s.detected)], [t("js-lib-jammertest-card-late", "Late"), n(s.late)], [t("js-lib-jammertest-card-missed", "Missed"), n(s.missed)],
    [t("js-lib-jammertest-card-detection-rate", "Detection rate (any alarm)"), pct(s.detectionRate)], [t("js-lib-jammertest-card-in-tol-rate", "Detected in tolerance, rate"), pct(s.inTolRate)], [t("js-lib-jammertest-card-median-latency", "Median detection latency"), s.medianLatencyS == null ? na() : `${n(s.medianLatencyS, 1)} s`],
    [t("js-lib-jammertest-card-median-recover", "Median time to recover"), s.medianRecoverS == null ? na() : `${n(s.medianRecoverS, 1)} s`], [t("js-lib-jammertest-card-fa-runs", "False-alarm runs"), n(s.falseAlarmRuns)], [t("js-lib-jammertest-card-fa-epochs", "False-alarm epochs"), n(s.falseAlarmEpochs)],
    [t("js-lib-jammertest-card-clean-epochs", "Clean epochs"), n(s.cleanEpochs)], [t("js-lib-jammertest-card-clean-hours", "Clean hours"), n(s.cleanHours, 2)], [t("js-lib-jammertest-card-fa-per-hour", "False-alarm runs per hour"), n(s.falseAlarmRunsPerHour, 3)],
  ];
}

// Why the card says nothing, in one sentence, when it cannot: no evaluable test, so no rate.
export function assessability(c) {
  const s = c.summary;
  if (s.evaluable === 0 || s.evaluable == null) return t("js-lib-jammertest-card-not-assessable", "No test was evaluable in this log, so no detection rate or latency can be stated. That is a result, not a failure of the page: nothing here is a pass.");
  return "";
}
