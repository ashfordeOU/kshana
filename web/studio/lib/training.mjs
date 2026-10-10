// SPDX-License-Identifier: AGPL-3.0-only
// The training debrief page's data model: reads the instructor log that `kshana nmea-scenario` writes
// (<prefix>.instructor.json, schema "kshana-nmea-training/1") and prepares what the page draws. Pure;
// tested in training.test.mjs.
//
// The log describes a SYNTHETIC stream made for training and testing. It must never be fed to a vessel's
// live navigation systems, and the file's own warning text is shown with it, verbatim. The page is for the
// debrief: the log shows what was injected, so a trainer shows it after the exercise, not before.

export const SCHEMA = "kshana-nmea-training/1";
const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const isObj = (x) => x && typeof x === "object" && !Array.isArray(x);
const str = (x) => (typeof x === "string" ? x : "");

// Limits a file is read within.
export const MAX_BYTES = 12 * 1024 * 1024;
export const MAX_BYTES_TEXT = "12 MiB";
export const MAX_ROWS = 20000;
// How many debrief moments are listed before "first N shown".
export const MAX_MOMENTS_SHOWN = 200;

// Labels looked up by a name that comes from the file: only the page's own entries count, so a kind or a
// "what" called "constructor" is shown as itself, not as a function from the prototype.
export const kindLabel = (k) => (typeof k === "string" && Object.hasOwn(KIND_LABEL, k) ? KIND_LABEL[k] : String(k));
export const whatLabel = (w) => (typeof w === "string" && Object.hasOwn(WHAT_LABEL, w) ? WHAT_LABEL[w] : String(w));

export const KIND_LABEL = { jamming: "Jamming", "drag-off": "Position drag-off", "time-spoof": "Time spoof", "replay-delay": "Replay delay" };
export const WHAT_LABEL = { onset: "Onset", "full-effect": "Full effect", "recovery-begins": "Recovery begins", recovered: "Recovered", "fix-lost": "Fix lost", "fix-regained": "Fix regained" };

// Position-error bands for colouring the reported track (metres). Stated on the page, not a standard.
export const ERROR_BANDS = Object.freeze([
  { id: "small", max: 25, label: "under 25 m" },
  { id: "medium", max: 100, label: "25 to 100 m" },
  { id: "large", max: Infinity, label: "over 100 m" },
]);
export const errorBand = (m) => (m == null ? null : ERROR_BANDS.find((b) => m < b.max).id);

// Read one instructor log. Returns { log } or { error }.
export function parseInstructorLog(text, name = "file") {
  let o;
  try { o = JSON.parse(String(text).replace(/^﻿/, "")); } catch (e) { return { error: `${name}: not JSON (${e.message}).` }; }
  if (!isObj(o) || typeof o.schema !== "string") return { error: `${name}: not a Kshana training instructor log (no schema tag).` };
  if (!o.schema.startsWith("kshana-nmea-training/")) return { error: `${name}: unknown schema ${JSON.stringify(o.schema)}; this page reads ${SCHEMA}.` };
  if (o.schema !== SCHEMA) return { error: `${name}: schema ${o.schema} is newer or different from ${SCHEMA}, which this page reads. Update the Studio rather than guess at its fields.` };
  if (!Array.isArray(o.track) || !o.track.length) return { error: `${name}: the log has no track rows to draw.` };
  if (o.track.length > MAX_ROWS) return { error: `${name}: the log has ${o.track.length} track rows; this page draws at most ${MAX_ROWS}. Log less often (log_interval_s) or open an excerpt.` };
  const warnings = [];
  const track = [];
  let skipped = 0;
  for (const r of o.track) {
    if (!isObj(r) || !isNum(r.t_s) || !isNum(r.true_lat_deg) || !isNum(r.true_lon_deg)) { skipped++; continue; }
    // A receiver with no fix reports nothing, whatever a row's reported_* fields hold: they are read only when fix_valid is true.
    const fix = r.fix_valid === true;
    const rep = fix && isNum(r.reported_lat_deg) && isNum(r.reported_lon_deg) ? [r.reported_lat_deg, r.reported_lon_deg] : null;
    track.push({
      t_s: r.t_s, utc: str(r.utc), truth: [r.true_lat_deg, r.true_lon_deg], trueSog: num(r.true_sog_kn), trueCog: num(r.true_cog_deg), trueHdg: num(r.true_heading_deg),
      fixValid: fix, rep, repSog: fix ? num(r.reported_sog_kn) : null, repCog: fix ? num(r.reported_cog_deg) : null, errM: fix && rep ? num(r.position_error_m) : null,
      timeOff: isNum(r.time_offset_s) ? r.time_offset_s : 0, nUsed: isNum(r.n_used) ? r.n_used : 0, nTracked: isNum(r.n_tracked) ? r.n_tracked : 0,
      cn0: num(r.mean_cn0_dbhz), active: Array.isArray(r.active_events) ? r.active_events.filter(isNum) : [],
    });
  }
  if (!track.length) return { error: `${name}: no usable track rows.` };
  if (skipped) warnings.push(`${skipped} track row(s) were not valid and were skipped.`);
  track.sort((a, b) => a.t_s - b.t_s);
  const events = (Array.isArray(o.events) ? o.events : []).filter((e) => isObj(e) && isNum(e.id)).map((e) => ({
    id: e.id, description: str(e.description), startUtc: str(e.start_utc), p: isObj(e.parameters) ? e.parameters : {},
    // drag-off only (null for the other kinds, absent in older logs): the bearing as applied and the peaks the drag adds
    resolvedBearingDeg: num(e.resolved_bearing_deg), peakDragSpeedMps: num(e.peak_drag_speed_mps), peakDragAccelMps2: num(e.peak_drag_accel_mps2),
  }));
  const timeline = (Array.isArray(o.timeline) ? o.timeline : []).filter((t) => isObj(t) && isNum(t.t_s)).map((t) => ({
    t_s: t.t_s, utc: str(t.utc), event: isNum(t.event) ? t.event : null, what: str(t.what), text: str(t.text),
  })).sort((a, b) => a.t_s - b.t_s);
  if (!str(o.warning).trim()) warnings.push("This file carries no warning text. It is a training log: do not feed its stream to live navigation.");
  // Peaks of the true and the reported track over the run (absent in older logs).
  const sm = isObj(o.summary) ? o.summary : null;
  const summary = sm && [sm.true_peak_sog_kn, sm.true_peak_accel_mps2, sm.reported_peak_sog_kn, sm.reported_peak_accel_mps2].every(isNum)
    ? { truePeakSogKn: sm.true_peak_sog_kn, truePeakAccelMps2: sm.true_peak_accel_mps2, reportedPeakSogKn: sm.reported_peak_sog_kn, reportedPeakAccelMps2: sm.reported_peak_accel_mps2 } : null;
  const log = {
    summary, name, scenario: str(o.scenario), description: str(o.description), trainerNote: str(o.trainer_note), warning: str(o.warning),
    seed: o.seed, startUtc: str(o.start_utc), durationS: isNum(o.duration_s) ? o.duration_s : track[track.length - 1].t_s,
    events, timeline, track, warnings, t0: track[0].t_s, t1: track[track.length - 1].t_s,
  };
  log.stats = stats(log);
  return { log };
}
const num = (x) => (isNum(x) ? x : null);

// Figures for the summary: only what the log says, no judgement.
export function stats(log) {
  const t = log.track;
  let maxErr = null, maxErrT = null, maxOff = 0, minUsed = Infinity, lost = 0;
  for (const r of t) {
    if (r.errM != null && (maxErr == null || r.errM > maxErr)) { maxErr = r.errM; maxErrT = r.t_s; }
    if (Math.abs(r.timeOff) > Math.abs(maxOff)) maxOff = r.timeOff;
    minUsed = Math.min(minUsed, r.nUsed);
    if (!r.fixValid) lost++;
  }
  return { rows: t.length, maxErrM: maxErr, maxErrAtS: maxErrT, maxTimeOffS: maxOff, minUsed: isFinite(minUsed) ? minUsed : 0, rowsNoFix: lost, spans: fixLostSpans(log) };
}

// Runs of rows with no fix: [{from, to}] in seconds.
export function fixLostSpans(log) {
  const out = [];
  let s = null;
  log.track.forEach((r, i) => {
    if (!r.fixValid && s == null) s = r.t_s;
    if (r.fixValid && s != null) { out.push({ from: s, to: log.track[i - 1].t_s }); s = null; }
  });
  if (s != null) out.push({ from: s, to: log.track[log.track.length - 1].t_s });
  return out;
}

// Strength of an event at time t (0 to 1): rises linearly over ramp_s from start_s, holds until
// start_s + duration_s, then falls over recovery_s; 0 for a ramp is a step.
export function eventStrength(p, t) {
  const s = p.start_s, d = p.duration_s, ramp = p.ramp_s || 0, rec = p.recovery_s || 0;
  if (![s, d].every(isNum) || t < s) return 0;
  if (t < s + ramp) return ramp > 0 ? (t - s) / ramp : 1;
  if (t <= s + d) return 1;
  if (t < s + d + rec) return rec > 0 ? 1 - (t - (s + d)) / rec : 0;
  return 0;
}

// The outline of an event's strength over time as [t, strength] corner points, for drawing.
export function eventShape(p) {
  const s = p.start_s, d = p.duration_s, ramp = p.ramp_s || 0, rec = p.recovery_s || 0;
  if (![s, d].every(isNum)) return [];
  return [[s, 0], [s, ramp > 0 ? 0 : 1], [s + Math.max(ramp, 0), 1], [s + d, 1], [s + d, rec > 0 ? 1 : 0], [s + d + Math.max(rec, 0), 0]];
}

// Index of the track row nearest to t.
export function nearestRow(log, t) {
  const a = log.track;
  let lo = 0, hi = a.length - 1;
  while (lo < hi) { const m = (lo + hi) >> 1; if (a[m].t_s < t) lo = m + 1; else hi = m; }
  if (lo > 0 && Math.abs(a[lo - 1].t_s - t) <= Math.abs(a[lo].t_s - t)) lo--;
  return lo;
}

// The next/previous timeline entry after/before a time: returns the entry or null.
export function stepTimeline(log, t, dir) {
  const eps = 1e-6;
  if (dir > 0) return log.timeline.find((e) => e.t_s > t + eps) || null;
  for (let i = log.timeline.length - 1; i >= 0; i--) if (log.timeline[i].t_s < t - eps) return log.timeline[i];
  return null;
}

// Smallest signed angle b - a in degrees, [-180, 180).
export const angDiff = (a, b) => (((b - a + 540) % 360) + 360) % 360 - 180;

// The cue the instructor log is built around: HDT and VBW (a gyro and a log) are untouched by every event,
// so GNSS course and speed that disagree with them are a debrief cue. Heading vs course differs by the
// current's crab angle even in a clean run; the page says so.
export function sensorCue(r) {
  if (r.repCog == null && r.repSog == null) return null;
  return {
    courseMinusHeadingDeg: r.repCog != null && r.trueHdg != null ? angDiff(r.trueHdg, r.repCog) : null,
    sogMinusTrueKn: r.repSog != null && r.trueSog != null ? r.repSog - r.trueSog : null,
  };
}

// A sentence for the row at the cursor (read aloud by the page).
export function describeRow(log, i) {
  const r = log.track[i];
  const bits = [`T+${Math.round(r.t_s)} s`, r.fixValid ? "receiver reports a fix" : "no fix"];
  if (r.errM != null) bits.push(`reported position ${r.errM < 10 ? r.errM.toFixed(1) : Math.round(r.errM)} m from true`);
  if (Math.abs(r.timeOff) >= 0.05) bits.push(`reported time ${r.timeOff > 0 ? "ahead of" : "behind"} true by ${Math.abs(r.timeOff).toFixed(1)} s`);
  bits.push(`${r.nUsed} of ${r.nTracked} satellites used`);
  if (r.cn0 != null) bits.push(`mean C/N0 ${r.cn0.toFixed(1)} dB-Hz`);
  if (r.active.length) bits.push(`active: ${r.active.map((id) => { const e = log.events.find((x) => x.id === id); return e ? kindLabel(e.p.kind) : `event ${id}`; }).join(", ")}`);
  return bits.join(", ");
}

// One-line facts of an event's parameters for the list, in the order the log gives them.
export function paramRows(p) {
  const label = { kind: "Kind", label: "Label", start_s: "Onset, s", duration_s: "Duration, s", ramp_s: "Onset ramp, s", recovery_s: "Recovery ramp, s", cn0_drop_db: "C/N0 drop, dB", spread_db: "Per-satellite spread, dB", final_offset_m: "Final offset, m", bearing_deg: "Bearing, deg true", relative_bearing_deg: "Bearing relative to course, deg", offset_s: "Time offset, s", delay_s: "Delay, s", affect_time: "Affects time", counterfeit_cn0_dbhz: "Counterfeit C/N0, dB-Hz" };
  return Object.entries(p).filter(([, v]) => v !== null && v !== undefined).map(([k, v]) => [(Object.hasOwn(label, k) && label[k]) || k.replace(/_/g, " "), k === "kind" ? kindLabel(v) : String(v)]);
}

// Extra rows of an event that the log computes (drag-off): the bearing as applied and the peaks the drag adds
// to the false track. Empty for other kinds and for older logs.
export function eventExtraRows(e) {
  const rows = [];
  if (e.resolvedBearingDeg != null) rows.push(["Bearing as applied, deg true", e.resolvedBearingDeg.toFixed(1)]);
  if (e.peakDragSpeedMps != null) rows.push(["Peak speed the drag adds, m/s", e.peakDragSpeedMps.toFixed(3)]);
  if (e.peakDragAccelMps2 != null) rows.push(["Peak acceleration the drag adds, m/s²", e.peakDragAccelMps2.toFixed(4)]);
  return rows;
}

// The summary line shown in the facts panel: peak speed and acceleration, true against reported.
export function peakFacts(log) {
  const s = log.summary;
  if (!s) return [];
  return [["Peak speed, true / reported", `${s.truePeakSogKn.toFixed(1)} / ${s.reportedPeakSogKn.toFixed(1)} kn`], ["Peak acceleration, true / reported", `${s.truePeakAccelMps2.toFixed(4)} / ${s.reportedPeakAccelMps2.toFixed(4)} m/s²`]];
}
