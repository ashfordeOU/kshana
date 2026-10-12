// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the training debrief page's data model. Run with `node lib/training.test.mjs`.
// The inline log mirrors the instructor log's shape; the library logs (training/demo/, written by the CLI)
// are checked too when present.
import assert from "node:assert/strict";
import fs from "node:fs";
import { parseInstructorLog, errorBand, ERROR_BANDS, eventStrength, eventShape, fixLostSpans, nearestRow, stepTimeline, angDiff, sensorCue, describeRow, paramRows, stats, kindLabel, whatLabel, MAX_ROWS, eventExtraRows, peakFacts } from "./training.mjs";

const row = (t, o = {}) => ({ t_s: t, utc: `2026-01-01T00:00:${String(t).padStart(2, "0")}.000Z`, true_lat_deg: 59 + t * 1e-4, true_lon_deg: 24, true_sog_kn: 10, true_cog_deg: 0, true_heading_deg: 3, fix_valid: true, reported_lat_deg: 59 + t * 1e-4, reported_lon_deg: 24, reported_sog_kn: 10, reported_cog_deg: 1, position_error_m: 2, time_offset_s: 0, n_used: 9, n_tracked: 11, mean_cn0_dbhz: 44, active_events: [], ...o });
const NO_FIX = { fix_valid: false, reported_lat_deg: null, reported_lon_deg: null, reported_sog_kn: null, reported_cog_deg: null, position_error_m: null, mean_cn0_dbhz: null, n_used: 2 };
const log0 = {
  schema: "kshana-nmea-training/1", warning: "Synthetic training data. Never feed to live navigation.", scenario: "t", description: "d", trainer_note: "note", seed: 7, start_utc: "2026-01-01T00:00:00.000Z", duration_s: 9,
  events: [
    { id: 1, description: "jamming: ...", start_utc: "2026-01-01T00:00:02.000Z", parameters: { kind: "jamming", start_s: 2, duration_s: 4, ramp_s: 1, recovery_s: 2, cn0_drop_db: 20, spread_db: 6 } },
    { id: 2, description: "time spoof", start_utc: "x", parameters: { kind: "time-spoof", start_s: 5, duration_s: 2, ramp_s: 0, recovery_s: 0, offset_s: 3, counterfeit_cn0_dbhz: null, label: "late" } },
  ],
  timeline: [{ t_s: 6, utc: "u", event: 1, what: "recovery-begins", text: "b" }, { t_s: 2, utc: "u", event: 1, what: "onset", text: "a" }, { t_s: 4, utc: "u", event: null, what: "fix-lost", text: "c" }],
  track: [row(0), row(1), row(2, { active_events: [1], position_error_m: 30 }), row(3, { active_events: [1], position_error_m: 120, mean_cn0_dbhz: 30 }), row(4, { ...NO_FIX, active_events: [1] }), row(5, { ...NO_FIX, active_events: [1, 2], time_offset_s: 3 }), row(6, { active_events: [1, 2], time_offset_s: 3 }), row(7), row(8), row(9)],
};
const ok = parseInstructorLog(JSON.stringify(log0), "t.instructor.json");
assert.equal(ok.error, undefined);
const log = ok.log;

// Reading: warning verbatim, events, a timeline sorted by time, track rows normalised.
assert.equal(log.warning, "Synthetic training data. Never feed to live navigation.");
assert.equal(log.trainerNote, "note");
assert.deepEqual(log.timeline.map((m) => m.t_s), [2, 4, 6]);
assert.equal(log.events.length, 2); assert.equal(log.track.length, 10);
assert.equal(log.track[4].rep, null, "no fix: nothing reported, not a zero position");
assert.equal(log.track[4].errM, null);
assert.deepEqual(log.track[2].truth, [59.0002, 24]);

// Figures come only from the log.
assert.equal(log.stats.maxErrM, 120); assert.equal(log.stats.maxErrAtS, 3); assert.equal(log.stats.maxTimeOffS, 3);
assert.equal(log.stats.minUsed, 2); assert.equal(log.stats.rowsNoFix, 2);
assert.deepEqual(log.stats.spans, [{ from: 4, to: 5 }]);
assert.deepEqual(fixLostSpans({ track: [{ t_s: 0, fixValid: false }, { t_s: 1, fixValid: false }] }), [{ from: 0, to: 1 }], "a run that never ends is a span to the last row");
assert.deepEqual(stats(log).spans, log.stats.spans);

// Error bands and event strength follow the documented ramp, hold and recovery.
assert.deepEqual(ERROR_BANDS.map((b) => b.id), ["small", "medium", "large"]);
assert.equal(errorBand(24.9), "small"); assert.equal(errorBand(25), "medium"); assert.equal(errorBand(100), "large"); assert.equal(errorBand(null), null);
{
  const p = log.events[0].p;
  assert.equal(eventStrength(p, 1), 0); assert.equal(eventStrength(p, 2), 0);
  assert.equal(eventStrength(p, 2.5), 0.5); assert.equal(eventStrength(p, 3), 1); assert.equal(eventStrength(p, 6), 1);
  assert.equal(eventStrength(p, 7), 0.5); assert.equal(eventStrength(p, 8), 0); assert.equal(eventStrength(p, 20), 0);
  assert.deepEqual(eventShape(p), [[2, 0], [2, 0], [3, 1], [6, 1], [6, 1], [8, 0]]);
  const step = log.events[1].p;
  assert.equal(eventStrength(step, 5), 1, "a zero ramp is a step"); assert.equal(eventStrength(step, 7), 1); assert.equal(eventStrength(step, 7.1), 0);
  assert.deepEqual(eventShape(step), [[5, 0], [5, 1], [5, 1], [7, 1], [7, 0], [7, 0]]);
  assert.deepEqual(eventShape({}), []);
}
// Navigation of the log.
assert.equal(nearestRow(log, 3.4), 3); assert.equal(nearestRow(log, -5), 0); assert.equal(nearestRow(log, 99), 9);
assert.equal(stepTimeline(log, 2, 1).what, "fix-lost"); assert.equal(stepTimeline(log, 6, 1), null);
assert.equal(stepTimeline(log, 6, -1).what, "fix-lost"); assert.equal(stepTimeline(log, 2, -1), null);
assert.equal(stepTimeline(log, 0, 1).what, "onset");
// The debrief cue: heading and log speed are untouched; the page reports the gap, not a verdict.
assert.equal(angDiff(350, 10), 20); assert.equal(angDiff(10, 350), -20);
assert.deepEqual(sensorCue(log.track[2]), { courseMinusHeadingDeg: -2, sogMinusTrueKn: 0 });
assert.equal(sensorCue(log.track[4]), null);
assert.match(describeRow(log, 3), /T\+3 s, receiver reports a fix, reported position 120 m from true, 9 of 11 satellites used, mean C\/N0 30\.0 dB-Hz, active: Jamming/);
assert.match(describeRow(log, 4), /no fix/);
assert.match(describeRow(log, 5), /reported time ahead of true by 3\.0 s.*active: Jamming, Time spoof/);
assert.deepEqual(paramRows({ kind: "time-spoof", label: "late", offset_s: 3, counterfeit_cn0_dbhz: null }), [["Kind", "Time spoof"], ["Label", "late"], ["Time offset, s", "3"]]);

// Refusals say why; a missing warning is flagged, not invented.
assert.match(parseInstructorLog("{", "x").error, /not JSON/);
assert.match(parseInstructorLog("{}", "x").error, /no schema tag/);
assert.match(parseInstructorLog(JSON.stringify({ ...log0, schema: "other/1" }), "x").error, /unknown schema/);
assert.match(parseInstructorLog(JSON.stringify({ ...log0, schema: "kshana-nmea-training/2" }), "x").error, /newer or different/);
assert.match(parseInstructorLog(JSON.stringify({ ...log0, track: [] }), "x").error, /no track rows/);
{
  const r = parseInstructorLog(JSON.stringify({ ...log0, warning: "", track: [...log0.track, { t_s: "bad" }] }), "x");
  assert.equal(r.log.warning, "");
  assert.ok(r.log.warnings.some((w) => /no warning text/.test(w)) && r.log.warnings.some((w) => /1 track row/.test(w)));
}
assert.equal(parseInstructorLog(JSON.stringify({ ...log0, a_future_key: 1 }), "x").error, undefined, "unknown fields are ignored");
assert.equal(parseInstructorLog(JSON.stringify({ ...log0, events: [], timeline: [] }), "x").log.events.length, 0, "a clean run has no events");

// No fix, no reported position: a row that carries coordinates but fix_valid false draws nothing for the receiver.
{
  const withCoords = { ...log0, track: log0.track.map((r, i) => (i === 4 ? { ...r, fix_valid: false, reported_lat_deg: 59.5, reported_lon_deg: 24.5, reported_sog_kn: 9, reported_cog_deg: 7, position_error_m: 5000 } : r)) };
  const l = parseInstructorLog(JSON.stringify(withCoords), "x").log;
  assert.equal(l.track[4].fixValid, false);
  assert.equal(l.track[4].rep, null); assert.equal(l.track[4].errM, null); assert.equal(l.track[4].repSog, null); assert.equal(l.track[4].repCog, null);
  assert.equal(l.stats.maxErrM, 120, "an error from a row with no fix does not count");
  assert.equal(sensorCue(l.track[4]), null);
  // fix_valid as a string or a number is not a fix either
  const odd = parseInstructorLog(JSON.stringify({ ...log0, track: log0.track.map((r, i) => (i === 3 ? { ...r, fix_valid: "true" } : r)) }), "x").log;
  assert.equal(odd.track[3].rep, null);
}
// Names from the file that are prototype property names stay names.
assert.equal(kindLabel("constructor"), "constructor"); assert.equal(kindLabel("__proto__"), "__proto__"); assert.equal(kindLabel("jamming"), "Jamming");
assert.equal(whatLabel("toString"), "toString"); assert.equal(whatLabel("onset"), "Onset");
assert.deepEqual(paramRows({ constructor: 1, kind: "constructor" }), [["constructor", "1"], ["Kind", "constructor"]]);
{
  const l = parseInstructorLog(JSON.stringify({ ...log0, events: [{ id: 1, description: "d", parameters: { kind: "hasOwnProperty", start_s: 1, duration_s: 1 } }], timeline: [{ t_s: 1, what: "constructor", text: "t" }] }), "x").log;
  assert.match(describeRow({ ...l, track: [{ ...l.track[2], active: [1] }] }, 0), /active: hasOwnProperty/);
}
// A log with more rows than the page draws is refused with the limit.
assert.match(parseInstructorLog(JSON.stringify({ ...log0, track: Array.from({ length: MAX_ROWS + 1 }, (_, i) => row(i % 60)) }), "big").error, /at most 20000/);

// Fields the log computes: a drag-off's bearing as applied and peaks, and the run's peak speeds and accelerations.
{
  const withExtra = { ...log0, summary: { true_peak_sog_kn: 17.2, true_peak_accel_mps2: 0.021, reported_peak_sog_kn: 18.9, reported_peak_accel_mps2: 0.0314 },
    events: [{ id: 1, description: "drag", start_utc: "x", parameters: { kind: "drag-off", start_s: 2, duration_s: 4, ramp_s: 1, recovery_s: 2, final_offset_m: 800, relative_bearing_deg: 40 }, resolved_bearing_deg: 52.25, peak_drag_speed_mps: 1.5, peak_drag_accel_mps2: 0.012 },
      { id: 2, description: "jam", start_utc: "x", parameters: { kind: "jamming", start_s: 1, duration_s: 1, ramp_s: 0, recovery_s: 0, cn0_drop_db: 20 }, resolved_bearing_deg: null, peak_drag_speed_mps: null, peak_drag_accel_mps2: null }] };
  const l = parseInstructorLog(JSON.stringify(withExtra), "x").log;
  assert.deepEqual(eventExtraRows(l.events[0]), [["Bearing as applied, deg true", "52.3"], ["Peak speed the drag adds, m/s", "1.500"], ["Peak acceleration the drag adds, m/s²", "0.0120"]]);
  assert.deepEqual(eventExtraRows(l.events[1]), []);
  assert.deepEqual(peakFacts(l), [["Peak speed, true / reported", "17.2 / 18.9 kn"], ["Peak acceleration, true / reported", "0.0210 / 0.0314 m/s²"]]);
  // an older log has neither: nothing is invented
  assert.equal(parseInstructorLog(JSON.stringify(log0), "x").log.summary, null);
  assert.deepEqual(peakFacts(parseInstructorLog(JSON.stringify(log0), "x").log), []);
  assert.deepEqual(eventExtraRows(parseInstructorLog(JSON.stringify(log0), "x").log.events[0]), []);
  // a partial summary is not shown
  assert.equal(parseInstructorLog(JSON.stringify({ ...log0, summary: { true_peak_sog_kn: 1 } }), "x").log.summary, null);
}

// The library logs, as the CLI wrote them.
const dir = new URL("../training/demo/", import.meta.url);
if (fs.existsSync(dir)) {
  const files = fs.readdirSync(dir).filter((f) => f.endsWith(".instructor.json")).sort();
  assert.ok(files.length >= 4, "the four library scenarios");
  for (const f of files) {
    const r = parseInstructorLog(fs.readFileSync(new URL(f, dir), "utf8"), f);
    assert.equal(r.error, undefined, f);
    const l = r.log;
    assert.match(l.warning, /never feed this stream to a vessel's live navigation systems/);
    assert.ok(l.track.length > 20 && l.events.length >= 1 && l.timeline.length >= 2, f);
    assert.deepEqual(l.warnings, [], f);
    for (const e of l.events) assert.ok(["jamming", "drag-off", "time-spoof", "replay-delay"].includes(e.p.kind));
    for (const m of l.timeline) assert.ok(["onset", "full-effect", "recovery-begins", "recovered", "fix-lost", "fix-regained"].includes(m.what), m.what);
    // Every row's active events exist; a row with no fix reports nothing.
    for (const r2 of l.track) { for (const id of r2.active) assert.ok(l.events.some((e) => e.id === id)); if (!r2.fixValid) assert.equal(r2.rep, null); }
    // The first scripted onset appears in the timeline at its start time.
    const first = l.events.reduce((a, b) => (a.p.start_s <= b.p.start_s ? a : b));
    assert.ok(l.timeline.some((m) => m.what === "onset" && Math.abs(m.t_s - first.p.start_s) < 1.5), f + ": onset at the scripted time");
  }
  const by = Object.fromEntries(files.map((f) => [f.replace(".instructor.json", ""), parseInstructorLog(fs.readFileSync(new URL(f, dir), "utf8"), f).log]));
  if (by["open-sea-jamming"]) assert.ok(by["open-sea-jamming"].stats.spans.length >= 1, "jamming loses the fix");
  for (const l of Object.values(by)) {
    assert.ok(l.summary && l.summary.reportedPeakSogKn >= 0 && l.summary.truePeakSogKn > 0, l.scenario + ": summary present");
    for (const e of l.events) {
      if (e.p.kind === "drag-off") assert.ok(e.resolvedBearingDeg != null && e.peakDragSpeedMps != null && e.peakDragAccelMps2 != null, "drag-off carries bearing and peaks");
      else assert.ok(e.resolvedBearingDeg == null && e.peakDragSpeedMps == null && e.peakDragAccelMps2 == null, "other kinds carry none");
    }
  }
  if (by["coastal-drag-off"]) { assert.ok(by["coastal-drag-off"].stats.maxErrM > 500, "a drag-off walks the reported fix away"); assert.equal(by["coastal-drag-off"].stats.spans.length, 0, "while the receiver keeps a valid fix"); }
  if (by["port-approach-time-spoof"]) assert.ok(Math.abs(by["port-approach-time-spoof"].stats.maxTimeOffS) > 30, "time drifts away from true UTC");
}
console.log("training.test.mjs: ok");
