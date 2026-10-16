// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the Maritime trust view's geometry lane (trust-geometry.mjs, and its use in trust.mjs), against the
// final 0.36 contract (engine feat/geometry-trust-0.36 debc5f33).
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import { readEpochGeometry, readClass, readGeometryModel, readGeometrySummary, countGeometry, statusKey, classKey, geometryUnder, geometryAt, geometryDeduction, describeGeometry, GEO_STATUSES, GEO_LABELS, CLASSES, UNKNOWN_TEXT, THRESHOLDS } from "./trust-geometry.mjs";
import { buildRun, reasonsAt, describeEpoch, parseLines } from "./trust.mjs";
import { maskedWith, maskedPhases, DEMO_PHASES, checksum } from "./trust-geometry-demo.mjs";

const g = (o = {}) => ({ status: "good", reasons: [], source: "derived", n_used: 13, in_view: 13, hdop: 0.8, pdop: 1.43, vdop: 1.19, open_fraction: null, max_azimuth_gap_deg: 40, age_s: 0, reported_hdop: 0.9, reported_derived_mismatch: false, note: "geometry good: HDOP 0.800, PDOP 1.430, VDOP 1.190, 13 satellites; not scored", signal_loss: false, label: "good", ...o });
const model = { nominal_min: 90, degraded_min: 55, onset_ratio: 0.5, full_ratio: 1.5, evidence_hold_s: 10, weights: { "loss-of-lock": 25, kinematic: 60, geometry: 15 } };
const ep = (t, state, score, ded, geo) => ({ t_s: t, state, alarms: [], marine: { position: [59 + t / 1000, 24], ratios: ded.map((d) => [d[0], d[1]]) }, score: score == null ? undefined : { score, band: state, deductions: ded.map((d) => ({ monitor: d[0], ratio: d[1], points: d[2], class: d[3] })) }, geometry: geo });

test("an epoch's geometry is read field by field", () => {
  const r = readEpochGeometry(g({ status: "degraded", label: "poor", reasons: ["sky-blocked", 5, "few-satellites"], n_used: 4, max_azimuth_gap_deg: 230, reported_derived_mismatch: true, signal_loss: true, open_fraction: 0.6 }));
  assert.equal(r.status, "degraded"); assert.equal(r.label, "poor");
  assert.deepEqual(r.reasons, ["sky-blocked", "few-satellites"]);
  assert.equal(r.nUsed, 4); assert.equal(r.gapDeg, 230); assert.equal(r.openFraction, 0.6);
  assert.equal(r.mismatch, true); assert.equal(r.signalLoss, true);
  assert.equal(readEpochGeometry(null), null, "an engine before 0.36 writes none");
  assert.equal(readEpochGeometry([1]), null);
  const odd = readEpochGeometry({ status: "excellent", label: "great", pdop: "1" });
  assert.equal(odd.status, "unknown", "a status this page does not know is never read as good");
  assert.equal(odd.label, "unknown");
  assert.equal(odd.odd, "excellent");
  assert.equal(odd.pdop, null);
  assert.equal(readEpochGeometry(g({ label: "superb" })).label, "unknown", "nor a label");
  assert.equal(readEpochGeometry(g({ n_used: -3, open_fraction: 2 })).nUsed, null);
  assert.equal(readEpochGeometry(g({ open_fraction: 2 })).openFraction, null);
  assert.equal(readClass("environment"), "environment");
  assert.equal(readClass("__proto__"), null);
});

test("unknown geometry says so and is never shown as good", () => {
  const e = { geometry: readEpochGeometry(g({ status: "unknown", label: "unknown", pdop: null, hdop: null, vdop: null, source: "none", note: null })), deductions: [] };
  const a = geometryAt(e);
  assert.equal(a.tone, "unknown");
  assert.match(a.heading, /^Geometry unknown: no GSV or GSA in the log/);
  assert.equal(describeGeometry(e), UNKNOWN_TEXT);
  assert.equal(statusKey(e), "unknown");
  assert.equal(geometryAt({ geometry: null, deductions: [] }).tone, "missing");
  assert.equal(statusKey({ geometry: null }), "missing");
  assert.equal(classKey({ geometry: null, deductions: [] }), "missing");
});

test("the label and metrics always; the deduction only when non-zero; the flags when set", () => {
  const fair = { geometry: readEpochGeometry(g({ status: "degraded", label: "fair", reasons: ["sky-blocked"], hdop: 2.87, note: "geometry fair: HDOP 2.870, PDOP 3.417, VDOP 1.855, 6 satellites; degraded by geometry" })), deductions: [{ monitor: "loss-of-lock", points: 25, class: "environment" }] };
  const a = geometryAt(fair);
  assert.match(a.heading, /^geometry fair: HDOP 2\.870/, "the engine's note, verbatim");
  const rows = Object.fromEntries(a.rows);
  assert.match(rows.Label, /^fair \(not scored\)/);
  assert.equal(rows.HDOP, "2.87");
  assert.match(rows.Status, /one side of the sky blocked/);
  assert.equal(rows["Geometry deduction"], undefined, "no geometry deduction row while it is zero");
  assert.deepEqual(a.flags, []);
  const poor = { geometry: readEpochGeometry(g({ status: "degraded", label: "poor", n_used: 4, hdop: 10.8, reported_derived_mismatch: true, signal_loss: true })), deductions: [{ monitor: "geometry", ratio: 2.7, points: 15, class: "inconsistency" }] };
  const b = geometryAt(poor);
  assert.equal(Object.fromEntries(b.rows)["Geometry deduction"], "15.0 points (inconsistency)");
  assert.deepEqual(b.flags.map((f) => f.kind), ["mismatch", "signal-loss"]);
  assert.match(b.flags[0].text, /counts as inconsistency/);
  assert.deepEqual(geometryDeduction(poor), { points: 15, class: "inconsistency", ratio: 2.7 });
  assert.equal(geometryDeduction({ deductions: [{ monitor: "geometry", points: 0 }] }), null);
  assert.equal(describeGeometry(poor), "geometry poor (HDOP 10.8), stated HDOP disagrees, geometry deduction 15.0 points");
});

test("the class strip shows the most serious class costing points, so an attack is never hidden behind a sky", () => {
  const e = (ded) => ({ geometry: readEpochGeometry(g()), deductions: ded });
  assert.equal(classKey(e([])), "none");
  assert.equal(classKey(e([{ monitor: "geometry", points: 5, class: "geometry" }])), "geometry");
  assert.equal(classKey(e([{ monitor: "geometry", points: 5, class: "geometry" }, { monitor: "loss-of-lock", points: 25, class: "environment" }])), "environment");
  assert.equal(classKey(e([{ monitor: "loss-of-lock", points: 25, class: "environment" }, { monitor: "speed-log", points: 40, class: "inconsistency" }])), "inconsistency");
  assert.equal(classKey(e([{ monitor: "speed-log", points: 0, class: "inconsistency" }])), "none", "a zero deduction is no deduction");
});

test("the model: every [geometry] field in a fixed order with its provenance; the summary", () => {
  const m = readGeometryModel({ hdop_max: 4, pdop_max: 6, min_used: 5, hdop_good: 2, pdop_good: 3, used_good: 6, azimuth_gap_deg: 180, low_elev_deg: 15, reported_vs_derived_tol: 1, reported_vs_derived_rel: 0.25, sigma_uere_m: 1.5, cap_points: 15, full_ratio: 1.5, floor: null, cap_in_force: 15, floor_in_force: 55, hold_s: 10, provenance: { hdop_max: "IEC 61108-1", cap_points: "15 points", odd: 5 }, classes: "geometry: ..." });
  assert.deepEqual(m.thresholds.map((t) => t.key), THRESHOLDS.map(([k]) => k));
  assert.equal(m.thresholds.find((t) => t.key === "floor").value, null);
  assert.deepEqual(m.provenance.map((p) => p.key), ["cap_points", "hdop_max"]);
  assert.equal(m.capInForce, 15); assert.equal(m.floorInForce, 55);
  assert.equal(m.classes, "geometry: ...");
  assert.equal(readGeometryModel("x"), null);
  const s = readGeometrySummary({ good: 600, degraded: 2401, unknown: 0, class_geometry: 0, class_environment: 2401, class_inconsistency: 1419, first_degraded_t_s: 600, label_good: 941, label_fair: 2060, label_poor: 0 });
  assert.deepEqual(s, { good: 600, degraded: 2401, unknown: 0, labelGood: 941, labelFair: 2060, labelPoor: 0, classGeometry: 0, classEnvironment: 2401, classInconsistency: 1419, firstDegradedS: 600 });
});

test("a batch run carries the lane; each deduction keeps its class; the score is the engine's", () => {
  const result = {
    score_model: model, monitors_run: ["loss-of-lock", "kinematic", "geometry"], states: {}, events: [],
    geometry_model: { hdop_max: 4, pdop_max: 6, min_used: 5, cap_in_force: 15, floor_in_force: 55, hold_s: 10, provenance: {}, classes: "x" },
    geometry_summary: { good: 1, degraded: 2, unknown: 0, class_geometry: 1, class_environment: 1, class_inconsistency: 1, label_good: 1, label_fair: 1, label_poor: 1 },
    epochs: [
      ep(0, "nominal", 100, [], g()),
      ep(1, "degraded", 75, [["loss-of-lock", 1.75, 25, "environment"]], g({ status: "degraded", label: "fair", reasons: ["sky-blocked"] })),
      ep(2, "untrusted", 0, [["kinematic", 2, 60, "inconsistency"], ["loss-of-lock", 1.75, 25, "environment"], ["geometry", 2.7, 15, "geometry"]], g({ status: "degraded", label: "poor" })),
    ],
  };
  const { run } = buildRun({ result });
  assert.equal(run.hasGeometry, true);
  assert.equal(run.geometryModel.capInForce, 15);
  assert.equal(run.geometrySummary.classInconsistency, 1);
  assert.deepEqual(reasonsAt(run, 2).ded.map((d) => [d.monitor, d.points, d.class]), [["kinematic", 60, "inconsistency"], ["loss-of-lock", 25, "environment"], ["geometry", 15, "geometry"]]);
  assert.equal(run.epochs[1].score, 75);
  assert.match(describeEpoch(run, 1), /geometry fair/);
  const c = countGeometry(run.epochs);
  assert.equal(c.degraded, 2); assert.deepEqual(c.label, { good: 1, fair: 1, poor: 1, unknown: 0 }); assert.deepEqual(c.cls, { geometry: 1, environment: 2, inconsistency: 1 });
});

test("a run from an older engine has no lane, and nothing is drawn as good", () => {
  const { run } = buildRun({ result: { score_model: model, monitors_run: [], epochs: [ep(0, "nominal", 100, [])] } });
  assert.equal(run.hasGeometry, false);
  assert.equal(run.geometryModel, null);
  assert.equal(run.epochs[0].geometry, null);
  assert.ok(reasonsAt(run, 0).notRun.includes("geometry"));
});

test("an engine that leaves geometry out of monitors_run: the geometry monitor still counts as run", () => {
  const { run } = buildRun({ result: { score_model: model, monitors_run: ["loss-of-lock"], epochs: [ep(0, "degraded", 85, [["geometry", 2.7, 15, "inconsistency"]], g({ status: "degraded", label: "poor" }))] } });
  assert.ok(run.monitorsRun.includes("geometry"));
  assert.ok(!reasonsAt(run, 0).notRun.includes("geometry"));
  const { run: listed } = buildRun({ result: { score_model: model, monitors_run: ["loss-of-lock", "geometry"], epochs: [ep(0, "degraded", 85, [["geometry", 2.7, 15, "geometry"]], g({ status: "degraded", label: "poor" }))] } });
  assert.equal(listed.monitorsRun.filter((m) => m === "geometry").length, 1, "an engine that lists it: once, not twice");
  assert.ok(!reasonsAt(listed, 0).notRun.includes("geometry") && !reasonsAt(listed, 0).faint.includes("geometry"));
});

test("live lines, schema 1.3: geometry at the end of each line, class on each deduction", () => {
  const text = [
    JSON.stringify({ schema: "1.3", seq: 1, t_s: 0, state: "nominal", score: 100, deductions: [], gate: "passed", position: { lat_deg: 59, lon_deg: 24 }, geometry: g() }),
    JSON.stringify({ schema: "1.3", seq: 2, t_s: 1, state: "degraded", score: 75, deductions: [{ monitor: "loss-of-lock", ratio: 1.75, points: 25, class: "environment" }], gate: "passed", position: { lat_deg: 59, lon_deg: 24 }, geometry: g({ status: "unknown", label: "unknown" }) }),
  ].join("\n");
  const { run } = buildRun({ lines: parseLines(text).epochs });
  assert.equal(run.hasGeometry, true);
  assert.deepEqual(run.epochs.map(statusKey), ["good", "unknown"]);
  assert.deepEqual(run.epochs.map(classKey), ["none", "environment"]);
  assert.equal(reasonsAt(run, 1).ded[0].class, "environment");
});

test("the demo generator edits the log as the engine's test does", () => {
  const body = (s) => `${s}*${checksum(s.slice(1))}`;
  const log = [
    body("$GPGGA,080000.00,5927.2998,N,02446.2017,E,1,13,0.9,37.7,M,17.8,M,,"),
    body("$GPGSV,1,1,02,01,40,090,45,02,30,200,44"),
    body("$GPGGA,081000.00,5927.2998,N,02446.2017,E,1,13,0.9,37.7,M,17.8,M,,"),
    body("$GPGSV,1,1,02,01,40,090,45,02,30,200,44"),
  ].join("\n");
  const out = maskedWith(log, 600, 0, "2.9").trim().split("\n");
  assert.equal(out[0], log.split("\n")[0], "before 600 s the log is unchanged");
  assert.match(out[2], /,1,13,2\.9,/, "GGA reports HDOP 2.9 from 600 s");
  assert.match(out[3], /^\$GPGSV,1,1,02,01,40,090,45,02,30,200,\*/, "the satellite at azimuth 200 loses its signal; the one at 90 keeps it");
  assert.match(maskedWith(log, 600, 0, "0.9", 60).trim().split("\n")[3], /^\$GPGSV,1,1,02,01,40,090,,02,30,200,\*/, "a narrower mask from azimuth 60");
  for (const l of out) assert.equal(l.split("*")[1], checksum(l.slice(1).split("*")[0]), "checksums recomputed");
  assert.equal(maskedPhases(log, [{ fromS: 600, fromAz: 180, dropDb: 0, ggaHdop: "2.9" }]), maskedWith(log, 600, 0, "2.9"), "one open phase is the engine test's edit");
  const ph = maskedPhases(log, [{ fromS: 0, toS: 300, fromAz: 60, dropDb: 0, ggaHdop: "4.5" }, { fromS: 300, fromAz: 180, dropDb: 0, ggaHdop: "2.9" }]).trim().split("\n");
  assert.match(ph[0], /,1,13,4\.5,/); assert.match(ph[1], /^\$GPGSV,1,1,02,01,40,090,,02,30,200,\*/, "first phase: the narrow mask");
  assert.match(ph[2], /,1,13,2\.9,/); assert.match(ph[3], /^\$GPGSV,1,1,02,01,40,090,45,02,30,200,\*/, "second phase: the half mask");
  assert.equal(DEMO_PHASES[0].fromS, 900); assert.equal(DEMO_PHASES[0].toS, 1200);
});

// The recorded demo (tools_trust_geometry_demo.mjs) through the view's own reader.
const DEMO = new URL("../trust/demo/masked-sky.result.json", import.meta.url);
test("the masked-sky demo: a fair sky costs nothing; a poor one is classed geometry; the drag-off stays attack-like", { skip: !existsSync(DEMO) && "trust/demo/masked-sky.result.json is not there" }, () => {
  const result = JSON.parse(readFileSync(DEMO, "utf8"));
  const { run, error } = buildRun({ result, demo: true });
  assert.equal(error, undefined);
  assert.equal(run.hasGeometry, true);
  assert.ok(run.epochs.every((e) => e.geometry && GEO_STATUSES.includes(e.geometry.status) && GEO_LABELS.includes(e.geometry.label) && !e.geometry.odd));
  assert.ok(run.epochs.every((e) => e.deductions.every((d) => CLASSES.includes(d.class))), "every deduction carries a class");
  const at = (t) => run.epochs.find((e) => e.t_s === t);
  assert.equal(at(300).geometry.label, "good");
  assert.equal(at(700).geometry.status, "degraded");
  assert.ok(at(700).geometry.reasons.includes("sky-blocked"));
  assert.match(at(700).geometry.note, /^geometry (fair|good|poor): HDOP [\d.]+, PDOP [\d.]+, VDOP [\d.]+, \d+ satellites/, "the note opens with the label and the metrics");
  assert.ok(run.epochs.every((e) => e.geometry.label === "poor" || !geometryDeduction(e)), "no geometry deduction unless the label is poor");
  assert.ok(run.epochs.some((e) => e.t_s > 1500 && classKey(e) === "inconsistency"), "the drag-off stays attack-like under the masked sky");
  assert.equal(at(700).geometry.label, "fair"); assert.equal(geometryDeduction(at(700)), null, "fair: no geometry deduction");
  const poor = at(1000);
  assert.equal(poor.geometry.label, "poor"); assert.equal(poor.geometry.mismatch, false); assert.equal(poor.geometry.signalLoss, false);
  assert.equal(geometryDeduction(poor).class, "geometry", "a poor sky with a stated HDOP that agrees: the deduction is the sky's");
  assert.ok(geometryDeduction(poor).points > 0 && geometryDeduction(poor).points <= 15);
  assert.equal(at(1300).geometry.label, "fair", "the half mask again after 1200 s");
  assert.equal(classKey(poor), "environment"); assert.equal(geometryUnder(poor), true, "the strip's colour is environment; the sky's share is underlined");
  assert.equal(geometryUnder(at(700)), false);
  assert.ok(run.geometrySummary.classGeometry > 0 && run.geometrySummary.classEnvironment > 0 && run.geometrySummary.classInconsistency > 0, "all three classes in one run");
  const c = countGeometry(run.epochs), s = run.geometrySummary;
  assert.equal(c.good, s.good); assert.equal(c.degraded, s.degraded); assert.equal(c.unknown, s.unknown);
  assert.equal(c.label.good, s.labelGood); assert.equal(c.label.fair, s.labelFair); assert.equal(c.label.poor, s.labelPoor);
  assert.equal(c.cls.geometry, s.classGeometry); assert.equal(c.cls.environment, s.classEnvironment); assert.equal(c.cls.inconsistency, s.classInconsistency);
  assert.match(result.advisory, /Advisory software, not type-approved navigation equipment \(IEC 61108, IEC 61162\)/);
  assert.equal(run.geometryModel.thresholds.find((t) => t.key === "hdop_max").value, 4);
  assert.equal(run.geometryModel.capInForce, 15);
  assert.ok(run.geometryModel.provenance.length >= 5 && run.geometryModel.classes.length > 50);
});

const POOR = new URL("../REVIEW/fixtures/poor-geometry.result.json", import.meta.url);
test("the poor-geometry fixture: the deduction, capped, and the mismatch flag", { skip: !existsSync(POOR) && "REVIEW/fixtures/poor-geometry.result.json is not there" }, () => {
  const { run } = buildRun({ result: JSON.parse(readFileSync(POOR, "utf8")) });
  const e = run.epochs.find((x) => x.t_s === 900);
  assert.equal(e.geometry.label, "poor");
  const d = geometryDeduction(e);
  assert.ok(d && d.points > 0 && d.points <= run.geometryModel.capInForce, "a poor sky costs points, within the cap in force");
  assert.ok(e.geometry.mismatch && geometryAt(e).flags.some((f) => f.kind === "mismatch"));
  assert.equal(d.class, "inconsistency", "a stated HDOP the sky contradicts is classed inconsistency");
});
