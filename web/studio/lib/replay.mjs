// SPDX-License-Identifier: AGPL-3.0-only
// Bridge replay: two runs on one mission clock. This module holds everything the page decides, with no DOM:
// the clock, a panel for each kind of run (a Training instructor log scored by the engine, or a Maritime trust
// result with the true track and the NMEA log's own sky and heading), the state of a panel at a time, the view
// and the coastline under the track, and the verdict at the end. Every figure comes from a log or from the
// engine's result for it; the differences taken here (the time from an event's onset to the first score below
// nominal, a position error from two logged positions) are plain subtractions of logged values, said so on the
// page. Nothing is predicted or invented. Pure; tested in replay.test.mjs.
import { buildRun, parseTruth, makeProjection } from "./trust.mjs";
import { epochAt, unheardSectors } from "./gsv.mjs";
import { kindLabel } from "./training.mjs";

const isNum = (x) => typeof x === "number" && Number.isFinite(x);
const clamp = (v, lo, hi) => Math.min(hi, Math.max(lo, v));

// ---------- the clock ----------

// Mission seconds per real second. The clock is a plain value: functions return the next one.
export const SPEEDS = Object.freeze([1, 2, 5, 10, 30, 60, 120]);
export const DEFAULT_SPEED = 10;
export const makeClock = (t1, speed = DEFAULT_SPEED) => ({ t: 0, t1: Math.max(0, t1), speed: SPEEDS.includes(speed) ? speed : DEFAULT_SPEED, playing: false });
export const seek = (c, t) => ({ ...c, t: clamp(isNum(t) ? t : 0, 0, c.t1) });
export function advance(c, dtMs) {
  if (!c.playing) return c;
  const t = Math.min(c.t1, c.t + (Math.max(0, dtMs) / 1000) * c.speed);
  return { ...c, t, playing: t < c.t1 };
}
export const play = (c) => (c.t >= c.t1 ? { ...c, t: 0, playing: true } : { ...c, playing: true });
export const pause = (c) => ({ ...c, playing: false });
export const setSpeed = (c, s) => ({ ...c, speed: SPEEDS.includes(s) ? s : c.speed });
// One step of `dtS` mission seconds, either way; pauses the clock.
export const stepBy = (c, dtS) => seek({ ...c, playing: false }, c.t + dtS);
// The next (dir > 0) or previous moment in the sorted list of marks; the end or the start when there is none.
export function stepMark(c, dir, marks) {
  const eps = 1e-6;
  const to = dir > 0 ? marks.find((m) => m > c.t + eps) ?? c.t1 : [...marks].reverse().find((m) => m < c.t - eps) ?? 0;
  return seek({ ...c, playing: false }, to);
}
export const fmtT = (t) => (t >= 120 ? `${Math.floor(t / 60)}:${String(Math.round(t % 60)).padStart(2, "0")}` : `${Math.round(t)} s`);
// A length of time in words, for durations (fmtT is for clock times, T+7:10).
export const fmtDur = (s) => { const r = Math.round(s); return r < 120 ? `${r} s` : `${Math.floor(r / 60)} min${r % 60 ? ` ${r % 60} s` : ""}`; };

// ---------- panels ----------

const BAND_LABEL = Object.freeze({ calibrating: "calibrating", nominal: "nominal", degraded: "degraded", untrusted: "untrusted" });
export const bandLabel = (b) => (Object.hasOwn(BAND_LABEL, b) ? BAND_LABEL[b] : String(b));

// The scored run's epoch at or before t (the first if t is earlier), or null.
function epochOf(run, t) {
  if (!run || !run.epochs.length) return null;
  const ts = run.epochs.map((e) => e.t_s);
  return run.epochs[epochAt(t, ts)];
}

// The times of the moments worth stopping at, sorted: event onsets and ends, and every change of band after the
// calibration window.
export function marksOf(events, rows) {
  const s = new Set();
  for (const e of events) { if (isNum(e.onset)) s.add(e.onset); if (isNum(e.end)) s.add(e.end); }
  let prev = null;
  for (const r of rows) {
    if (r.band == null || r.band === "calibrating") continue;
    if (prev != null && r.band !== prev) s.add(r.t);
    prev = r.band;
  }
  return [...s].sort((a, b) => a - b);
}

// A panel from a Training instructor log (lib/training.mjs parseInstructorLog) and, when the run was scored, the
// engine's receiver-trust result for the same stream (a buildRun run). The rows are the instructor log's, so the
// true position, the error and the heading are its own; the score and band are the engine's at the same time.
export function panelFromTraining({ id, title, log, run = null, aux = null, region = null, source = "" }) {
  const rows = log.track.map((r) => {
    const e = epochOf(run, r.t_s);
    return { t: r.t_s, truth: r.truth, rep: r.rep, errM: r.errM, fixValid: r.fixValid, hdg: r.trueHdg, cog: r.repCog, sog: r.repSog,
      score: e ? e.score : null, band: e ? e.state : null, nUsed: r.nUsed, nTracked: r.nTracked, cn0: r.cn0 };
  });
  const events = log.events.map((e) => ({ label: kindLabel(e.p.kind), onset: isNum(e.p.start_s) ? e.p.start_s : null, end: isNum(e.p.start_s) && isNum(e.p.duration_s) ? e.p.start_s + e.p.duration_s : null }));
  return finish({ id, title, kind: "training", description: log.description, source, rows, events, run, aux, region, log });
}

// A panel from a Maritime trust run (buildRun), the NMEA log's sky and heading (lib/gsv.mjs parseAux, or the
// recorded file), and events the demo states (each {label, onset, end}).
export function panelFromTrust({ id, title, run, aux = null, events = [], region = null, description = "", source = "" }) {
  const rows = run.epochs.map((e) => {
    const k = aux ? epochAt(e.t_s, aux.t) : -1;
    return { t: e.t_s, truth: e.truth || null, rep: e.pos || null, errM: e.pos && e.truth ? e.offsetM : null, fixValid: !!e.pos,
      hdg: k >= 0 ? aux.hdt[k] : null, cog: k >= 0 ? aux.cog[k] : null, sog: k >= 0 ? aux.sog[k] : null,
      score: e.score, band: e.state, nUsed: e.geometry ? e.geometry.nUsed : null, nTracked: e.geometry ? e.geometry.inView : null, cn0: null };
  });
  return finish({ id, title, kind: "trust", description, source, rows, events, run, aux, region, log: null });
}

function finish(p) {
  const rows = p.rows;
  const out = {
    ...p, t0: rows[0].t, t1: rows[rows.length - 1].t,
    sampleS: medianDt(rows),
    hasScore: !!(p.run && rows.some((r) => r.score != null)),
    hasTruth: rows.some((r) => r.truth),
    hasSky: !!(p.aux && p.aux.t.length),
    marks: marksOf(p.events, rows),
  };
  out.verdict = verdict(out);
  return out;
}

function medianDt(rows) {
  const d = [];
  for (let i = 1; i < Math.min(rows.length, 400); i++) d.push(rows[i].t - rows[i - 1].t);
  d.sort((a, b) => a - b);
  return d.length ? d[d.length >> 1] || 1 : 1;
}

// The panel's state at mission time t: the last row at or before t (rows are held between samples, never
// interpolated), whether the run has ended, and the sky of the log at that time.
export function stateAt(panel, t) {
  const rows = panel.rows;
  let lo = 0, hi = rows.length - 1;
  while (lo < hi) { const m = (lo + hi + 1) >> 1; if (rows[m].t <= t) lo = m; else hi = m - 1; }
  const row = rows[lo];
  let sky = null;
  if (panel.hasSky) { const k = epochAt(t, panel.aux.t); sky = k >= 0 ? panel.aux.sky[k] : null; }
  return { i: lo, row, ended: t > panel.t1 + 1e-6, sky };
}

// ---------- where the log hears nothing ----------

// The compass words for azimuth sectors [{from, to}]: each quarter of the horizon (north 315-45, east 45-135, south
// 135-225, west 225-315) that a sector covers by at least 30 degrees, in the order north, east, south, west.
export function sectorWords(sectors) {
  const quarters = [["north", 315, 405], ["east", 45, 135], ["south", 135, 225], ["west", 225, 315]];
  const names = quarters.filter(([, a, b]) => sectors.some((s) => [0, 360].some((o) => Math.min(b, s.to + o) - Math.max(a, s.from + o) >= 30))).map(([n]) => n);
  if (names.length === 4) return "every direction";
  return names.length > 1 ? `${names.slice(0, -1).join(", ")} and ${names[names.length - 1]}` : names[0] || "";
}

// The stretches of a run where the log lists satellites and hears none in some direction: [{t0, t1, i0, i1, words}],
// from the log's own GSV (lib/gsv.mjs unheardSectors). Gaps of up to `joinS` seconds are bridged, and a stretch shorter than
// `minS` is left out, so a single dropped satellite is not drawn. A blocked sky and a jammed signal look the same in a
// log, so the words say "no signal from", never "blocked".
export function quietSpans(panel, { minS = 30, joinS = 10 } = {}) {
  if (!panel.hasSky) return [];
  const flags = panel.rows.map((r) => { const k = epochAt(r.t, panel.aux.t); return k < 0 ? "" : sectorWords(unheardSectors(panel.aux.sky[k])); });
  const spans = [];
  flags.forEach((w, i) => {
    if (!w) return;
    const last = spans[spans.length - 1];
    if (last && last.words === w && panel.rows[i].t - panel.rows[last.i1].t <= joinS + panel.sampleS) last.i1 = i;
    else spans.push({ words: w, i0: i, i1: i });
  });
  return spans.map((x) => ({ ...x, t0: panel.rows[x.i0].t, t1: panel.rows[x.i1].t })).filter((x) => x.t1 - x.t0 >= minS);
}

// ---------- the verdict ----------

// What the log and the engine's score say about the whole run, from the numbers and nothing else. `latencyS` is the time from the
// first event's onset to the first score in the degraded or untrusted band (a subtraction of two logged times;
// null when the run states no event, or the band never left nominal, or it left before the onset).
export function verdict(panel) {
  const rows = panel.rows;
  const v = { lowest: null, firstBelowNominal: null, latencyS: null, onsetS: null, untrustedS: 0, degradedS: 0, peakErr: null, final: null, scored: panel.hasScore, lostS: 0 };
  const dt = panel.sampleS;
  for (const r of rows) {
    if (r.score != null && (v.lowest == null || r.score < v.lowest.score)) v.lowest = { score: r.score, t: r.t, band: r.band };
    if (r.band === "untrusted") v.untrustedS += dt;
    if (r.band === "degraded") v.degradedS += dt;
    if ((r.band === "degraded" || r.band === "untrusted") && v.firstBelowNominal == null) v.firstBelowNominal = r.t;
    if (r.errM != null && (v.peakErr == null || r.errM > v.peakErr.m)) v.peakErr = { m: r.errM, t: r.t };
    if (!r.fixValid) v.lostS += dt;
  }
  const last = [...rows].reverse().find((r) => r.score != null);
  if (last) v.final = { score: last.score, band: last.band };
  const onsets = panel.events.map((e) => e.onset).filter(isNum);
  if (onsets.length) {
    v.onsetS = Math.min(...onsets);
    if (v.firstBelowNominal != null && v.firstBelowNominal >= v.onsetS) v.latencyS = v.firstBelowNominal - v.onsetS;
  }
  v.text = verdictText(panel, v);
  return v;
}

const m0 = (m) => (m < 10 ? m.toFixed(1) : Math.round(m).toLocaleString("en-GB"));
function verdictText(panel, v) {
  const bits = [];
  if (v.scored) {
    if (v.lowest) bits.push(`Lowest trust score ${Math.round(v.lowest.score)} (${bandLabel(v.lowest.band)}) at T+${fmtT(v.lowest.t)}`);
    if (v.firstBelowNominal == null) bits.push("the score never left the nominal band");
    else if (v.latencyS != null) bits.push(`first below nominal at T+${fmtT(v.firstBelowNominal)}, ${fmtDur(v.latencyS)} after the first event began (T+${fmtT(v.onsetS)})`);
    else bits.push(`first below nominal at T+${fmtT(v.firstBelowNominal)}${v.onsetS != null ? `, before the first event's onset (T+${fmtT(v.onsetS)})` : ""}`);
    if (v.untrustedS) bits.push(`${fmtDur(v.untrustedS)} in the untrusted band`);
    else if (v.degradedS) bits.push(`${fmtDur(v.degradedS)} degraded, none untrusted`);
  } else bits.push("Not scored: the engine's trust score is shown for the library runs");
  if (v.peakErr) bits.push(`largest logged position error ${m0(v.peakErr.m)} m at T+${fmtT(v.peakErr.t)}`);
  if (v.lostS) bits.push(`no fix for ${fmtDur(v.lostS)}`);
  return bits.join("; ") + ".";
}

// ---------- the view and the coastline ----------

const R_EARTH = 6378137;
// Metres east and north of (lat0, lon0) to (lat, lon): the plain tangent-plane formula, for drawing only.
const eastNorth = (lat0, lon0, lat, lon) => [((lon - lon0) * Math.PI / 180) * R_EARTH * Math.cos(((lat + lat0) / 2) * Math.PI / 180), ((lat - lat0) * Math.PI / 180) * R_EARTH];

// The rings of land for a panel: the bundled windows (replay/data/coast.json) by the demo they were cut for,
// else the world file the Studio already carries (data/land.json, coarse) when it reaches the track. Returns
// { rings: [[[lon, lat], ...]], source, box } or null. Land from here is orientation only.
export function coastFor(panel, coast, world = []) {
  const reg = coast && coast.regions ? coast.regions.find((r) => r.demos.includes(panel.id)) : null;
  let found = null;
  if (reg) found = { rings: reg.rings, source: `Natural Earth 1:10 million, ${reg.name} window`, box: reg.box, scale: "1:10m" };
  else {
    const pts = panel.rows.flatMap((r) => [r.truth, r.rep]).filter(Boolean);
    if (!pts.length || !world.length) return null;
    let la0 = 90, la1 = -90, lo0 = 180, lo1 = -180;
    for (const [la, lo] of pts) { la0 = Math.min(la0, la); la1 = Math.max(la1, la); lo0 = Math.min(lo0, lo); lo1 = Math.max(lo1, lo); }
    const m = 1; // degrees of margin
    const rings = world.filter((ring) => ring.some(([lo, la]) => lo >= lo0 - m && lo <= lo1 + m && la >= la0 - m && la <= la1 + m));
    if (!rings.length) return null;
    found = { rings, source: "Natural Earth 1:110 million (the Studio's world outline), coarse", box: [la0 - m, la1 + m, lo0 - m, lo1 + m], scale: "1:110m" };
  }
  // A true track that runs over land at this scale (invented positions in a narrow fjord or a harbour mouth, a coast too
  // coarse to follow) would put the ship ashore. The coast is not drawn for that run, and the map says why.
  if (found.rings.length && trackOnLand(panel, found.rings)) return { rings: [], hidden: COAST_HIDDEN, source: found.source, box: found.box, scale: found.scale };
  return found;
}
export const COAST_HIDDEN = "coast hidden: this log's invented positions fall on land";
// Whether any logged true position (the reported one when there is no truth) lies on land; every row is tested.
export function trackOnLand(panel, rings) {
  for (const r of panel.rows) { const p = r.truth || r.rep; if (p && pointInLand(rings, p[1], p[0])) return true; }
  return false;
}

// Whether (lon, lat) is inside land: the even-odd rule over every ring.
export function pointInLand(rings, lon, lat) {
  let inside = false;
  for (const ring of rings) {
    for (let i = 0, j = ring.length - 1; i < ring.length; j = i++) {
      const [xi, yi] = ring[i], [xj, yj] = ring[j];
      if (yi > lat !== yj > lat && lon < ((xj - xi) * (lat - yi)) / (yj - yi) + xi) inside = !inside;
    }
  }
  return inside;
}

// A view of a panel's tracks in a `size` square: one scale on both axes, north up. With `rings`, the view
// widens (never beyond `maxWiden` times the track's span) to take in the nearest land vertex, so the track is
// seen against its coast; `widened` says so. px(p) maps [lat, lon] to [x, y]; mPerPx and scale are for the bar.
export function makeView(panel, { size = 600, pad = 36, rings = null, maxWiden = 6 } = {}) {
  const pts = panel.rows.flatMap((r) => [r.truth, r.rep]).filter(Boolean);
  const proj = makeProjection(pts);
  if (!proj) return null;
  let la0 = Infinity, la1 = -Infinity, lo0 = Infinity, lo1 = -Infinity;
  for (const [la, lo] of pts) { la0 = Math.min(la0, la); la1 = Math.max(la1, la); lo0 = Math.min(lo0, lo); lo1 = Math.max(lo1, lo); }
  const cLa = (la0 + la1) / 2, cLo = (lo0 + lo1) / 2;
  const track = Math.max(proj.widthM, proj.heightM, 1);
  let span = track, widened = false, nearestM = null;
  if (rings && rings.length) {
    let best = null;
    for (const ring of rings) for (const [lo, la] of ring) {
      const [e, n] = eastNorth(cLa, cLo, la, lo), half = Math.max(Math.abs(e), Math.abs(n));
      if (best == null || half < best) best = half;
    }
    if (best != null) {
      nearestM = best;
      const need = 2 * best * 1.15;
      if (need > span && need <= track * maxWiden) { span = need; widened = true; }
    }
  }
  const k = (size - 2 * pad) / span;
  const px = (p) => { const [e, n] = eastNorth(cLa, cLo, p[0], p[1]); return [size / 2 + e * k, size / 2 - n * k]; };
  return { size, pad, k, px, spanM: span, trackM: track, widened, nearestM, mPerPx: 1 / k, centre: [cLa, cLo] };
}

// ---------- the vessel ----------

// The glyph: a hull outline pointing at `hdgDeg` (clockwise from north) with its centre at (x, y), `len` px long.
export function vesselPath(x, y, hdgDeg, len = 18) {
  const a = ((isNum(hdgDeg) ? hdgDeg : 0) * Math.PI) / 180, s = Math.sin(a), c = Math.cos(a);
  const pts = [[0, -len * 0.55], [len * 0.2, -len * 0.05], [len * 0.2, len * 0.45], [-len * 0.2, len * 0.45], [-len * 0.2, -len * 0.05]];
  return pts.map(([px, py], i) => `${i ? "L" : "M"}${(x + px * c - py * s).toFixed(2)} ${(y + px * s + py * c).toFixed(2)}`).join("") + "Z";
}
// A ray of `len` px from (x, y) along a course (clockwise from north).
export function rayEnd(x, y, deg, len) { const a = (deg * Math.PI) / 180; return [x + Math.sin(a) * len, y - Math.cos(a) * len]; }

// The error ring: radius in px for an error in metres at the view's scale (the engine's or log's metres, drawn to
// scale), and whether it is too small to see.
export function ringPx(errM, view) { const r = errM * view.k; return { r, tiny: r < 3 }; }

// ---------- building the demo panels from files ----------

// A Maritime trust demo panel from the three files the Trust view already reads (its result JSON, the truth
// CSV) and the replay's own aux file. `result` and `aux` are parsed JSON, `truthText` is the CSV text.
export function trustDemoPanel({ id, title, result, truthText, aux, events, coast, world, description, source }) {
  const { run, error } = buildRun({ result, truth: parseTruth(truthText), demo: true });
  if (error) throw new Error(`${id}: ${error}`);
  return panelFromTrust({ id, title, run, aux, events, description, source, region: coastFor({ id, rows: run.epochs.map((e) => ({ truth: e.truth, rep: e.pos })) }, coast, world) });
}
