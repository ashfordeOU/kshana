// SPDX-License-Identifier: AGPL-3.0-only
// The maritime trust view's data model: reads what `kshana receiver-trust` writes and turns it
// into one list of epochs the view draws. Pure and synchronous; the page (trust/trust.js) only
// draws. Tested in trust.test.mjs.
//
// Inputs, all read in the browser from files the person picks (nothing is uploaded):
//   * a batch result JSON (`kshana receiver-trust session.toml` -> session.result.json), which
//     carries score_model, monitors_run, states and epochs[] with score and marine.position;
//   * the live JSON lines (`receiver-trust live --json`), schema version 1 (no position) and
//     later versions that add keys at the end, one object per epoch;
//   * an NMEA 0183 log, only to take the receiver-reported track for a live JSON-lines run, joined
//     on t_s;
//   * a truth file (t_s,true_lat_deg,true_lon_deg), which exists only for synthetic data.
// Advisory software: nothing here is a measure of how the checks do on real interference.

export const BANDS = ["calibrating", "nominal", "degraded", "untrusted"];

// One line per monitor, from docs/MARITIME-TRUST.md ("What each check catches"), for hover text.
export const MONITOR_INFO = Object.freeze({
  kinematic: "Compares each position step with the reported speed and course, and with the vessel's stated speed, acceleration and turn-rate limits.",
  "heading-course": "Compares the track's direction with where the ship points, within the stated crab angle.",
  "speed-log": "Compares speed over ground with speed through the water, within the stated current allowance.",
  "sea-level": "Checks that the altitude is where the sea surface and the stated antenna height put it.",
  "cn0-spread": "Looks for the signature of one transmitter: signal strength across the satellites collapsing together against the calibration baseline.",
  "cn0-rise": "Looks for the signature of one transmitter: signal strength across the satellites rising together against the baseline.",
  "time-consistency": "Checks the receiver's time for irregular steps or running backwards, and against this computer's clock for real-time streams.",
  osnma: "Reads a reported OSNMA authentication failure. The status is read, not verified.",
  "cn0-drop": "Power denial: signal strength fallen against the calibration baseline.",
  "loss-of-lock": "Loss of tracked satellites.",
  agc: "Automatic gain control moved against its baseline.",
  "jam-ind": "The receiver's own jamming indicator.",
  "position-jump": "A step in the reported position larger than the baseline allows.",
  raim: "The receiver autonomous integrity monitoring test statistic against its threshold.",
  clock: "The clock-aided monitor: the receiver clock against its predicted line.",
  "solve-failure": "The position solution could not be computed.",
});
export const KNOWN_MONITORS = Object.freeze(Object.keys(MONITOR_INFO));

export const monitorInfo = (name) =>
  (Object.hasOwn(MONITOR_INFO, name) && MONITOR_INFO[name]) || "A monitor this view does not have a description for (newer than the page). Treat it as a monitor.";

// Limits a file is read within: a larger file is refused with a stated reason rather than left to hang the page.
export const MAX_BYTES = 24 * 1024 * 1024;
export const MAX_EPOCHS = 20000;
export const MAX_BYTES_TEXT = "24 MiB";

const isNum = (x) => typeof x === "number" && Number.isFinite(x);

// The release hold the gate applies when it has withheld a fix (the session's [live] gate_release_s).
export const DEFAULT_GATE_RELEASE_S = 30;

// ---------- reading files ----------

// Which of the four inputs is this text? Looks at the content, never the name.
export function sniff(text) {
  let t = String(text || "").replace(/^﻿/, "").trimStart();
  // trust.csv from a vessel run starts with a "#" comment line carrying the advisory statement: skip comment lines.
  while (t[0] === "#") { const nl = t.indexOf("\n"); t = nl < 0 ? "" : t.slice(nl + 1).trimStart(); }
  if (!t) return "empty";
  if (t[0] === "$" || t[0] === "!") return "nmea";
  if (/^t_s\s*,\s*true_lat_deg\s*,\s*true_lon_deg/i.test(t)) return "truth";
  if (/^t_s\s*,\s*state\s*,/i.test(t)) return "csv";
  if (t[0] === "{") {
    // One object spanning the whole text is a result; objects on every line are JSON lines.
    const nl = t.indexOf("\n");
    const first = nl < 0 ? t : t.slice(0, nl);
    try {
      const o = JSON.parse(first);
      if (o && typeof o === "object" && "seq" in o && "t_s" in o && "state" in o) return "lines";
    } catch (e) { /* the first line is not a whole object: a pretty-printed result */ }
    return "result";
  }
  return "unknown";
}

export function parseLines(text) {
  const out = [];
  let bad = 0;
  for (const raw of String(text).split("\n")) {
    const s = raw.trim();
    if (!s) continue;
    try {
      const o = JSON.parse(s);
      if (o && typeof o === "object" && isNum(o.t_s)) out.push(o);
      else bad++;
    } catch (e) { bad++; }
  }
  return { epochs: out, skipped: bad };
}

export function parseTruth(text) {
  const t = [], lat = [], lon = [];
  const lines = String(text).replace(/^﻿/, "").split(/\r?\n/);
  for (let i = 1; i < lines.length; i++) {
    const p = lines[i].split(",");
    if (p.length < 3) continue;
    if (p[0].trim() === "" || p[1].trim() === "" || p[2].trim() === "") continue; // an empty field is not 0
    const a = Number(p[0]), b = Number(p[1]), c = Number(p[2]);
    if (isNum(a) && isNum(b) && isNum(c) && Math.abs(b) <= 90 && Math.abs(c) <= 180) { t.push(a); lat.push(b); lon.push(c); }
  }
  return { t, lat, lon };
}

// trust.csv from a batch run: scores and reasons only, no position.
export function parseTrustCsv(text) {
  const lines = String(text).replace(/^﻿/, "").split(/\r?\n/).filter(Boolean);
  // Leading "#" comment lines: the advisory statement every vessel output carries (readers skip them as comments).
  const comments = [];
  while (lines.length && lines[0].startsWith("#")) comments.push(lines.shift().replace(/^#\s?/, "").trim());
  const advisory = comments.filter(Boolean).join(" ");
  const head = (lines.shift() || "").split(",");
  const col = (n) => head.indexOf(n);
  const [it, is, ia, ic, ir] = ["t_s", "state", "alarms", "score", "score_reasons"].map(col);
  const epochs = [];
  for (const l of lines) {
    const p = l.split(",");
    const t_s = Number(p[it]);
    if (!isNum(t_s)) continue;
    const sc = ic >= 0 && p[ic] !== "" && p[ic] != null ? Number(p[ic]) : null;
    const deductions = [];
    for (const r of (ir >= 0 ? p[ir] || "" : "").split(";")) {
      const m = /^([a-z0-9-]+):([0-9.]+)$/.exec(r);
      if (m) deductions.push({ monitor: m[1], ratio: null, points: Number(m[2]) });
    }
    epochs.push({ t_s, state: normState(p[is]), rawState: p[is], score: isNum(sc) ? sc : null, deductions, alarms: (p[ia] || "").split(";").filter(Boolean) });
  }
  return { epochs, hasScore: ic >= 0, advisory };
}

// NMEA ddmm.mmmm / dddmm.mmmm with a hemisphere letter to signed degrees.
function nmeaDeg(v, h) {
  if (!v) return null;
  const dot = v.indexOf(".");
  const degLen = (dot < 0 ? v.length : dot) - 2;
  if (degLen < 2) return null;
  const d = Number(v.slice(0, degLen)), m = Number(v.slice(degLen));
  if (!isNum(d) || !isNum(m)) return null;
  const x = d + m / 60;
  return h === "S" || h === "W" ? -x : x;
}

// The checksum is checked when there is one: a corrupt sentence is skipped, not drawn.
export function nmeaChecksumOk(line) {
  const i = line.indexOf("*");
  if (i < 0) return true;
  let c = 0;
  for (let k = 1; k < i; k++) c ^= line.charCodeAt(k);
  return c === parseInt(line.slice(i + 1, i + 3), 16);
}

// Receiver-reported fixes from an NMEA log: [{tod, lat, lon, valid}] from GGA (time of day in s).
// A fix the receiver flags invalid (quality 0) is kept with valid=false and no position use.
export function parseNmeaFixes(text) {
  const fixes = [];
  let skipped = 0;
  for (const raw of String(text).split("\n")) {
    const line = raw.trim();
    if (line.length < 8 || line[0] !== "$" || line.slice(3, 6) !== "GGA") continue;
    if (!nmeaChecksumOk(line)) { skipped++; continue; }
    const f = line.split("*")[0].split(",");
    if (f.length < 7 || typeof f[1] !== "string" || f[1].length < 6) { skipped++; continue; } // "$GPGGAxxxx": not a GGA
    const hh = Number(f[1].slice(0, 2)), mm = Number(f[1].slice(2, 4)), ss = Number(f[1].slice(4));
    const lat = nmeaDeg(f[2], f[3]), lon = nmeaDeg(f[4], f[5]);
    if (![hh, mm, ss].every(isNum) || lat == null || lon == null) { skipped++; continue; }
    fixes.push({ tod: hh * 3600 + mm * 60 + ss, lat, lon, valid: Number(f[6]) > 0 });
  }
  return { fixes, skipped };
}

// ---------- geometry ----------

// East and north metres from point 0 to point 1 (the engine's own mid-latitude tangent-plane
// formula, WGS84 radii), good to well under a metre over tens of kilometres.
const WGS84_A = 6378137.0, WGS84_E2 = 0.00669437999014;
export function enOffsetM(lat0, lon0, lat1, lon1) {
  const phi = ((lat0 + lat1) / 2) * Math.PI / 180;
  const s2 = Math.sin(phi) ** 2;
  const w = Math.sqrt(1 - WGS84_E2 * s2);
  const n = WGS84_A / w, m = WGS84_A * (1 - WGS84_E2) / (w * w * w);
  const dlon = ((lon1 - lon0 + 540) % 360 + 360) % 360 - 180;
  return [dlon * Math.PI / 180 * n * Math.cos(phi), (lat1 - lat0) * Math.PI / 180 * m];
}
export const distanceM = (a, b) => {
  const [e, n] = enOffsetM(a[0], a[1], b[0], b[1]);
  return Math.hypot(e, n);
};

// A "nice" scale-bar length (1, 2 or 5 x 10^k metres) no longer than `maxM`.
export function niceLength(maxM) {
  if (!(maxM > 0)) return 0;
  const k = 10 ** Math.floor(Math.log10(maxM));
  for (const m of [5, 2, 1]) if (m * k <= maxM) return m * k;
  return k;
}

// Project lat/lon to a plane, north up, one scale on both axes (x = east metres * cos handled by
// enOffsetM). Returns {x(),y() in metres from the centre, bbox}.
export function makeProjection(points) {
  const pts = points.filter(Boolean);
  if (!pts.length) return null;
  let la0 = Infinity, la1 = -Infinity, lo0 = Infinity, lo1 = -Infinity;
  for (const [la, lo] of pts) { la0 = Math.min(la0, la); la1 = Math.max(la1, la); lo0 = Math.min(lo0, lo); lo1 = Math.max(lo1, lo); }
  const cla = (la0 + la1) / 2, clo = (lo0 + lo1) / 2;
  const to = (p) => enOffsetM(cla, clo, p[0], p[1]);
  const [w] = enOffsetM(cla, lo0, cla, lo1), [, h] = enOffsetM(la0, clo, la1, clo);
  return { to, widthM: Math.abs(w), heightM: Math.abs(h) };
}

// ---------- the run ----------

// A state this page does not know is drawn as calibrating (never scored) and counted, so the page can say so.
const normState = (s) => (typeof s === "string" && BANDS.includes(s.toLowerCase()) ? s.toLowerCase() : "calibrating");
const knownState = (s) => typeof s === "string" && BANDS.includes(s.toLowerCase());
// Monitor-keyed tables from a file: no prototype, so a monitor named "constructor" or "__proto__" is just a name.
const table = () => Object.create(null);
const cleanDeductions = (list) => (Array.isArray(list) ? list : []).filter((d) => d && typeof d === "object" && typeof d.monitor === "string" && isNum(d.points)).map((d) => ({ monitor: d.monitor, ratio: isNum(d.ratio) ? d.ratio : null, points: d.points }));

// Normalise a batch result's epoch.
function fromResultEpoch(e) {
  const sc = e.score && typeof e.score === "object" ? e.score : null;
  const ratios = table();
  const m = e.marine && typeof e.marine === "object" ? e.marine : null;
  for (const r of (m && Array.isArray(m.ratios) && m.ratios) || []) if (Array.isArray(r) && typeof r[0] === "string" && isNum(r[1])) ratios[r[0]] = r[1];
  return {
    t_s: e.t_s,
    state: normState(e.state), unknownState: knownState(e.state) ? null : String(e.state),
    score: sc && isNum(sc.score) ? sc.score : null,
    deductions: sc ? cleanDeductions(sc.deductions) : [],
    alarms: (Array.isArray(e.alarms) ? e.alarms : []).filter((x) => typeof x === "string"),
    ratios,
    pos: m && Array.isArray(m.position) && isNum(m.position[0]) && isNum(m.position[1]) ? [m.position[0], m.position[1]] : null,
    gate: null,
    note: null,
  };
}

function fromLineEpoch(e) {
  const ratios = table();
  const ded = cleanDeductions(e.deductions);
  for (const d of ded) if (d.ratio != null) ratios[d.monitor] = d.ratio;
  // A position, from schema 1.1 on: an object {lat_deg, lon_deg, height_m} (the documented shape); an array
  // [lat, lon] or top-level lat_deg/lon_deg are accepted too.
  let pos = null;
  const p = e.position !== undefined ? e.position : e.pos;
  if (p && typeof p === "object" && !Array.isArray(p) && isNum(p.lat_deg) && isNum(p.lon_deg)) pos = [p.lat_deg, p.lon_deg];
  else if (Array.isArray(p) && isNum(p[0]) && isNum(p[1])) pos = [p[0], p[1]];
  else if (isNum(e.lat_deg) && isNum(e.lon_deg)) pos = [e.lat_deg, e.lon_deg];
  else if (isNum(e.lat) && isNum(e.lon)) pos = [e.lat, e.lon];
  return {
    t_s: e.t_s,
    state: normState(e.state), unknownState: knownState(e.state) ? null : String(e.state),
    score: isNum(e.score) ? e.score : null,
    deductions: ded,
    alarms: (Array.isArray(e.alarms) ? e.alarms : []).filter((x) => typeof x === "string"),
    ratios,
    pos,
    gate: ["off", "passed", "withheld"].includes(e.gate) ? e.gate : null,
    note: typeof e.note === "string" ? e.note : null,
    time: typeof e.time === "string" ? e.time : null,
  };
}

// Where a batch run's gate would have withheld the fix: untrusted epochs, held until the epochs
// have been out of the untrusted band for `releaseS`. Derived, not read from a gate.
export function deriveGate(epochs, releaseS = DEFAULT_GATE_RELEASE_S) {
  const out = new Array(epochs.length);
  let withheld = false, clearSince = null;
  for (let i = 0; i < epochs.length; i++) {
    const e = epochs[i];
    if (e.state === "calibrating") { out[i] = "off"; continue; }
    if (e.state === "untrusted") { withheld = true; clearSince = null; }
    else if (withheld) {
      if (clearSince == null) clearSince = e.t_s;
      if (e.t_s - clearSince >= releaseS) { withheld = false; clearSince = null; }
    }
    out[i] = withheld ? "withheld" : "passed";
  }
  return out;
}

// Index of the entry of sorted numeric array `a` nearest to x, or -1 if none lies within tol.
export function nearestIndex(a, x, tol = Infinity) {
  if (!a.length) return -1;
  let lo = 0, hi = a.length - 1;
  while (lo < hi) { const mid = (lo + hi) >> 1; if (a[mid] < x) lo = mid + 1; else hi = mid; }
  let best = lo;
  if (lo > 0 && Math.abs(a[lo - 1] - x) <= Math.abs(a[lo] - x)) best = lo - 1;
  return Math.abs(a[best] - x) <= tol ? best : -1;
}

// Receiver-reported fixes joined to a JSON-lines run by t_s: the first line's time of day anchors
// the log. The lines' own `time` (hh:mm:ss.mmm or an ISO string) is used when present, else the
// first fix is t_s 0, which is how the stream defines t_s.
export function joinFixes(epochs, fixes, tolS = 0.5) {
  const usable = fixes.filter((f) => f.valid);
  if (!usable.length || !epochs.length) return 0;
  const tod = (e) => {
    const m = e.time && /(\d{2}):(\d{2}):(\d{2}(?:\.\d+)?)/.exec(e.time);
    return m ? Number(m[1]) * 3600 + Number(m[2]) * 60 + Number(m[3]) : null;
  };
  // The stream's t_s 0 is the first epoch of the stream: the first fix, valid or not.
  let t0 = fixes[0].tod;
  const first = tod(epochs[0]);
  if (first != null) t0 = first - epochs[0].t_s;
  const ts = [];
  let wrap = 0, prev = null;
  for (const f of usable) {
    let v = f.tod + wrap;
    if (prev != null && v < prev - 43200) { wrap += 86400; v += 86400; }
    prev = v;
    ts.push(v - t0);
  }
  let n = 0;
  for (const e of epochs) {
    if (e.pos) continue;
    const i = nearestIndex(ts, e.t_s, tolS);
    if (i >= 0) { e.pos = [usable[i].lat, usable[i].lon]; n++; }
  }
  return n;
}

// Truth joined to the epochs by t_s: adds e.truth = [lat, lon] and e.offsetM (reported minus true).
export function joinTruth(epochs, truth, tolS = 0.5) {
  let n = 0;
  for (const e of epochs) {
    const i = nearestIndex(truth.t, e.t_s, tolS);
    if (i < 0) continue;
    e.truth = [truth.lat[i], truth.lon[i]];
    e.offsetM = e.pos ? distanceM(e.truth, e.pos) : null;
    n++;
  }
  return n;
}

// Build the run the view draws. `inputs`: { result?, lines?, csv?, nmea?, truth? }, each already
// parsed. Returns { run } or { error }.
export function buildRun(inputs) {
  const notes = [];
  let advisory = "";
  let epochs, model = null, monitorsRun = null, events = [], source, states = null;
  if (inputs.result) {
    const r = inputs.result;
    if (!Array.isArray(r.epochs)) return { error: "This result file has no epochs[]. It needs to come from `kshana receiver-trust <session.toml>` for a vessel session." };
    if (!r.score_model) return { error: "This result has no score_model, so it is a static-platform run with no trust score. The view draws vessel (moving-platform) runs." };
    const good = r.epochs.filter((e) => e && typeof e === "object" && isNum(e.t_s));
    if (good.length < r.epochs.length) notes.push(`${r.epochs.length - good.length} epoch(s) without a numeric t_s were skipped.`);
    epochs = good.map(fromResultEpoch);
    if (typeof r.advisory === "string") advisory = r.advisory;
    model = r.score_model;
    monitorsRun = Array.isArray(r.monitors_run) ? r.monitors_run.slice() : null;
    events = (r.events || []).filter((e) => isNum(e.onset_s)).map((e) => ({ label: e.label, onset_s: e.onset_s, end_s: e.end_s ?? null }));
    states = r.states || null;
    source = "result";
  } else if (inputs.lines) {
    const ok = inputs.lines.filter((e) => e && typeof e === "object" && isNum(e.t_s));
    epochs = ok.map(fromLineEpoch);
    // schema 1.2 puts the advisory statement on every line; the first is shown, a different later one is said
    const advs = [...new Set(ok.map((e) => e.advisory).filter((a) => typeof a === "string" && a.trim()))];
    if (advs.length) advisory = advs[0];
    if (advs.length > 1) notes.push(`The lines carry ${advs.length} different advisory statements; the first is shown.`);
    source = "lines";
    notes.push("A live stream does not state which monitors ran or the score model; the band edges below are the documented defaults and the monitor strips show only monitors that cost points.");
  } else if (inputs.csv) {
    advisory = typeof inputs.csv.advisory === "string" ? inputs.csv.advisory : "";
    epochs = inputs.csv.epochs.map((e) => ({ ...e, unknownState: knownState(e.rawState) ? null : String(e.rawState), deductions: cleanDeductions(e.deductions), ratios: table(), pos: null, gate: null, note: null }));
    source = "csv";
    notes.push("trust.csv carries scores and reasons but not ratios or positions.");
  } else return { error: "Nothing to draw: pick a result JSON, JSON lines or trust.csv." };
  if (!epochs.length) return { error: "The file has no epochs." };
  if (epochs.length > MAX_EPOCHS) return { error: `The file has ${epochs.length} epochs; this page draws at most ${MAX_EPOCHS}. Open an excerpt.` };
  const unknown = epochs.filter((e) => e.unknownState);
  if (unknown.length) notes.push(`${unknown.length} epoch(s) carry a state this page does not know (${[...new Set(unknown.map((e) => e.unknownState))].slice(0, 5).join(", ")}); they are drawn as calibrating, never scored.`);
  epochs.sort((a, b) => a.t_s - b.t_s);

  if (!model) model = { nominal_min: 90, degraded_min: 55, onset_ratio: 0.5, full_ratio: 1.5, evidence_hold_s: 10, weights: null, assumed: true };
  let positions = epochs.filter((e) => e.pos).length;
  if (!positions && inputs.nmea) {
    const j = joinFixes(epochs, inputs.nmea.fixes);
    positions = j;
    if (inputs.nmea.skipped) notes.push(`${inputs.nmea.skipped} NMEA sentence(s) with a bad checksum or fields were skipped.`);
    if (!j) notes.push("No NMEA fix could be matched to an epoch by time.");
  }
  let truthN = 0;
  if (inputs.truth) {
    truthN = joinTruth(epochs, inputs.truth);
    if (!truthN) notes.push("The truth file's times match no epoch.");
  }
  const gateDerived = !epochs.some((e) => e.gate);
  if (gateDerived) {
    const g = deriveGate(epochs, inputs.gateReleaseS ?? DEFAULT_GATE_RELEASE_S);
    epochs.forEach((e, i) => { e.gate = g[i]; });
  }
  // Monitors to draw as strips: those that ran (batch) or those seen costing points (stream).
  const seen = new Set();
  for (const e of epochs) for (const k of Object.keys(e.ratios)) seen.add(k);
  const strips = (monitorsRun || [...seen]).filter((m) => seen.has(m) || monitorsRun);
  const weights = model.weights && typeof model.weights === "object" ? model.weights : {};
  const run = {
    source, epochs, model, monitorsRun, events, states, notes,
    strips: strips.slice().sort((a, b) => KNOWN_MONITORS.indexOf(a) - KNOWN_MONITORS.indexOf(b)),
    weights,
    hasPosition: positions > 0,
    demo: inputs.demo === true,
    advisory,
    hasTruth: truthN > 0,
    gateDerived,
    t0: epochs[0].t_s,
    t1: epochs[epochs.length - 1].t_s,
    firstDeduction: epochs.findIndex((e) => e.deductions.length > 0),
    firstUntrusted: epochs.findIndex((e) => e.state === "untrusted"),
  };
  return { run };
}

// What the cursor's epoch says, for the reasons panel: deductions largest first with the weight each
// monitor carries; monitors that ran and cost nothing; monitors that did not run.
export function reasonsAt(run, i) {
  const e = run.epochs[i];
  const ded = e.deductions.slice().sort((a, b) => b.points - a.points).map((d) => ({ ...d, weight: Object.hasOwn(run.weights, d.monitor) && isNum(run.weights[d.monitor]) ? run.weights[d.monitor] : null }));
  const names = new Set(ded.map((d) => d.monitor));
  let faint = [], notRun = [];
  if (run.monitorsRun) {
    faint = run.monitorsRun.filter((m) => !names.has(m));
    notRun = KNOWN_MONITORS.filter((m) => !run.monitorsRun.includes(m));
  }
  return { ded, faint, notRun, calibrating: e.state === "calibrating", note: e.note };
}

// Epoch indices at which `monitor` was above its onset (the ratio where it starts to cost points).
export function epochsAboveOnset(run, monitor) {
  const onset = isNum(run.model.onset_ratio) ? run.model.onset_ratio : 0.5;
  const out = [];
  run.epochs.forEach((e, i) => {
    const r = e.ratios[monitor];
    if (isNum(r) ? r > onset : e.deductions.some((d) => d.monitor === monitor && d.points > 0)) out.push(i);
  });
  return out;
}

// Step to the next epoch (dir +1/-1) honouring the band filter (only degraded and untrusted).
export function stepIndex(run, i, dir, onlyBad) {
  let k = i + dir;
  while (k >= 0 && k < run.epochs.length) {
    const s = run.epochs[k].state;
    if (!onlyBad || s === "degraded" || s === "untrusted") return k;
    k += dir;
  }
  return i;
}

// A line the page reads aloud for the epoch under the cursor.
export function describeEpoch(run, i) {
  const e = run.epochs[i];
  const bits = [`${Math.round(e.t_s)} s`, e.state];
  if (e.score != null) bits.push(`score ${e.score.toFixed(1)}`);
  if (e.deductions.length) bits.push("reasons: " + e.deductions.slice().sort((a, b) => b.points - a.points).slice(0, 3).map((d) => `${d.monitor} ${d.points.toFixed(1)} points`).join(", "));
  if (e.gate && e.gate !== "off") bits.push(`gate ${e.gate}${run.gateDerived ? " (derived)" : ""}`);
  if (e.offsetM != null) bits.push(`reported position ${Math.round(e.offsetM)} m from true`);
  return bits.join(", ");
}

// The latest $PKSHT for an epoch (the layout in MARITIME-TRUST.md). Built from the epoch, so a
// batch run shows what the stream would carry.
export function pkshtFor(e, run) {
  const tod = (() => {
    const m = e.time && /(\d{2}):(\d{2}):(\d{2}(?:\.\d+)?)/.exec(e.time);
    return m ? m[1] + m[2] + (m[3].includes(".") ? m[3].padEnd(5, "0").slice(0, 5) : m[3] + ".00") : "";
  })();
  const band = { calibrating: "C", nominal: "N", degraded: "D", untrusted: "U" }[e.state];
  const gate = { off: "-", passed: "P", withheld: "W" }[e.gate] || "-";
  const reasons = e.deductions.slice().sort((a, b) => b.points - a.points).slice(0, 2).map((d) => `${d.monitor}:${d.points.toFixed(1)}`).join("/");
  const body = `PKSHT,1,${tod},${e.score != null ? e.score.toFixed(1) : ""},${band},${gate},${reasons}`;
  let c = 0;
  for (let k = 0; k < body.length; k++) c ^= body.charCodeAt(k);
  return `$${body}*${c.toString(16).toUpperCase().padStart(2, "0")}`;
}

// Segments of equal band along the track, for drawing a few paths instead of one per epoch.
export function bandRuns(run, filter) {
  const runs = [];
  let cur = null;
  run.epochs.forEach((e, i) => {
    if (!e.pos) { cur = null; return; }
    const band = e.state;
    if (cur && cur.band === band) cur.idx.push(i);
    else {
      // Share the joint so the line has no gaps between runs.
      cur = { band, idx: cur ? [cur.idx[cur.idx.length - 1], i] : [i] };
      runs.push(cur);
    }
  });
  return filter ? runs.filter((r) => r.band === "degraded" || r.band === "untrusted") : runs;
}
