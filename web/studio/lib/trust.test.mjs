// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the maritime trust view's data model (trust.mjs). Run with `node lib/trust.test.mjs`.
import assert from "node:assert/strict";
import fs from "node:fs";
import {
  sniff, parseLines, parseTruth, parseTrustCsv, parseNmeaFixes, nmeaChecksumOk, enOffsetM, distanceM, niceLength,
  makeProjection, deriveGate, nearestIndex, joinFixes, joinTruth, buildRun, reasonsAt, epochsAboveOnset, stepIndex,
  describeEpoch, pkshtFor, bandRuns, monitorInfo, KNOWN_MONITORS, MONITOR_INFO, MAX_EPOCHS,
} from "./trust.mjs";

// A result in the shape `kshana receiver-trust` writes for a vessel: ten epochs, calibrating, then nominal,
// degraded, untrusted and a recovery.
const model = { nominal_min: 90, degraded_min: 55, onset_ratio: 0.5, full_ratio: 1.5, evidence_hold_s: 10, weights: { kinematic: 60, "heading-course": 40, "cn0-spread": 30 } };
const mk = (t, state, score, ded, pos) => ({
  t_s: t, state, alarms: ded.filter((d) => d[1] >= 1).map((d) => d[0]),
  marine: pos ? { position: pos, stats: {}, ratios: ded.map((d) => [d[0], d[1]]) } : undefined,
  score: score == null ? undefined : { score, band: state, deductions: ded.map((d) => ({ monitor: d[0], ratio: d[1], points: d[2] })) },
});
const result = {
  score_model: model, monitors_run: ["kinematic", "heading-course", "cn0-spread", "agc"], states: {}, events: [{ label: "drag", onset_s: 5, end_s: null }],
  epochs: [
    mk(0, "calibrating", null, [], [59.0, 24.0]), mk(1, "calibrating", null, [], [59.001, 24.0]),
    mk(2, "nominal", 100, [], [59.002, 24.0]), mk(3, "nominal", 95, [["agc", 0.4, 0]], [59.003, 24.0]),
    mk(4, "degraded", 70, [["cn0-spread", 1.1, 30]], [59.004, 24.0]), mk(5, "untrusted", 30, [["heading-course", 2, 40], ["cn0-spread", 1.6, 30]], [59.005, 24.001]),
    mk(6, "untrusted", 20, [["heading-course", 2, 40], ["kinematic", 1.2, 40]], [59.006, 24.002]), mk(7, "nominal", 100, [], [59.007, 24.002]),
    mk(8, "nominal", 100, [], [59.008, 24.002]), mk(9, "nominal", 100, [], [59.009, 24.002]),
  ],
};

// Sniffing by content.
assert.equal(sniff(JSON.stringify(result, null, 2)), "result");
assert.equal(sniff('{"seq":1,"t_s":0,"state":"calibrating","score":null}\n{"seq":2,"t_s":1}'), "lines");
assert.equal(sniff("$GPGGA,080000.00,5927.2,N,02446.2,E,1,12,0.9,16.7,M,21.0,M,,*5B"), "nmea");
assert.equal(sniff("t_s,true_lat_deg,true_lon_deg\n0,59,24"), "truth");
assert.equal(sniff("t_s,state,n_sats,alarms\n"), "csv");
assert.equal(sniff("  "), "empty");
assert.equal(sniff("hello"), "unknown");

// A batch result.
{
  const { run, error } = buildRun({ result });
  assert.equal(error, undefined);
  assert.equal(run.epochs.length, 10);
  assert.equal(run.hasPosition, true);
  assert.equal(run.firstDeduction, 3);
  assert.equal(run.firstUntrusted, 5);
  assert.equal(run.gateDerived, true);
  assert.deepEqual(run.events, [{ label: "drag", onset_s: 5, end_s: null }]);
  assert.deepEqual(run.strips, ["kinematic", "heading-course", "cn0-spread", "agc"], "strips are the monitors that ran, in the documented order");
  // Reasons: largest first with the weight each monitor carries; faint = ran and cost nothing; not-run listed apart.
  const r = reasonsAt(run, 5);
  assert.deepEqual(r.ded.map((d) => [d.monitor, d.points, d.weight]), [["heading-course", 40, 40], ["cn0-spread", 30, 30]]);
  assert.deepEqual(r.faint.sort(), ["agc", "kinematic"]);
  assert.ok(r.notRun.includes("osnma") && !r.notRun.includes("agc"), "a monitor that did not run is never shown as passing");
  assert.equal(r.notRun.length + run.monitorsRun.length, KNOWN_MONITORS.length);
  // Above onset (ratio > onset_ratio): agc 0.4 is below it.
  assert.deepEqual(epochsAboveOnset(run, "cn0-spread"), [4, 5]);
  assert.deepEqual(epochsAboveOnset(run, "agc"), []);
  // Stepping honours the band filter.
  assert.equal(stepIndex(run, 0, 1, false), 1);
  assert.equal(stepIndex(run, 0, 1, true), 4);
  assert.equal(stepIndex(run, 6, 1, true), 6, "no later degraded or untrusted epoch: stay");
  assert.equal(stepIndex(run, 4, -1, true), 4);
  // Gate: untrusted at 5 and 6; released 30 s after leaving the band.
  const g = deriveGate(run.epochs, 30);
  assert.deepEqual(g.slice(0, 5), ["off", "off", "passed", "passed", "passed"]);
  assert.deepEqual(g.slice(5), ["withheld", "withheld", "withheld", "withheld", "withheld"], "held until gate_release_s has passed");
  const g2 = deriveGate(run.epochs, 1);
  assert.deepEqual(g2.slice(5), ["withheld", "withheld", "withheld", "passed", "passed"]);
  assert.match(describeEpoch(run, 5), /untrusted.*heading-course 40\.0 points.*gate withheld \(derived\)/);
}

// Runs by band share their joints so the line has no gaps.
{
  const { run } = buildRun({ result });
  const runs = bandRuns(run, false);
  assert.deepEqual(runs.map((r) => r.band), ["calibrating", "nominal", "degraded", "untrusted", "nominal"]);
  assert.equal(runs[1].idx[0], runs[0].idx[runs[0].idx.length - 1]);
  assert.deepEqual(bandRuns(run, true).map((r) => r.band), ["degraded", "untrusted"]);
}

// Refusals say why.
assert.match(buildRun({ result: { epochs: [] } }).error, /score_model|epochs/);
assert.match(buildRun({ result: { epochs: [{ t_s: 0, state: "nominal" }] } }).error, /static-platform/);
assert.match(buildRun({}).error, /Nothing to draw/);
assert.match(buildRun({ lines: [] }).error, /no epochs/);

// Live JSON lines (schema 1): no position, a gate, and the model is assumed.
{
  const lines = [
    { seq: 1, t_s: 0, time: "2025-06-14T08:00:00.000Z", state: "calibrating", score: null, deductions: [], alarms: [], gate: "off", note: null },
    { seq: 2, t_s: 1, time: "2025-06-14T08:00:01.000Z", state: "nominal", score: 100, deductions: [], alarms: [], gate: "passed", note: null },
    { seq: 3, t_s: 2, time: "2025-06-14T08:00:02.000Z", state: "untrusted", score: 23.4, deductions: [{ monitor: "heading-course", ratio: 2, points: 40 }], alarms: ["heading-course"], gate: "withheld", note: null },
    { seq: 4, t_s: 3, time: "2025-06-14T08:00:03.000Z", state: "untrusted", score: 20, deductions: [{ monitor: "future-monitor", ratio: 3, points: 20 }], alarms: ["future-monitor"], gate: "withheld", note: null },
  ];
  const p = parseLines(lines.map((l) => JSON.stringify(l)).join("\n") + "\nnot json\n");
  assert.equal(p.epochs.length, 4); assert.equal(p.skipped, 1);
  // The track comes from the NMEA the stream was read from, joined on time.
  const nmea = ["$GPGGA,080000.00,5927.29982,N,02446.20166,E,1,12,0.9,16.7,M,21.0,M,,", "$GPGGA,080001.00,5927.30464,N,02446.20304,E,1,12,0.9,16.7,M,21.0,M,,", "$GPGGA,080002.00,5927.30866,N,02446.20648,E,0,12,0.9,16.5,M,21.0,M,,", "$GPGGA,080003.00,5927.31333,N,02446.20820,E,1,12,0.9,16.0,M,21.0,M,,"]
    .map((b) => { let c = 0; for (let i = 1; i < b.length; i++) c ^= b.charCodeAt(i); return `${b}*${c.toString(16).toUpperCase().padStart(2, "0")}`; }).join("\r\n");
  const fixes = parseNmeaFixes(nmea);
  assert.equal(fixes.fixes.length, 4);
  assert.equal(fixes.fixes[2].valid, false, "a fix the receiver flags invalid is not drawn");
  assert.ok(Math.abs(fixes.fixes[0].lat - (59 + 27.29982 / 60)) < 1e-9 && Math.abs(fixes.fixes[0].lon - (24 + 46.20166 / 60)) < 1e-9);
  const { run } = buildRun({ lines: p.epochs, nmea: fixes });
  assert.equal(run.gateDerived, false, "the stream's own gate is used");
  assert.equal(run.epochs[2].pos, null, "the invalid-quality fix leaves no point");
  assert.ok(run.epochs[3].pos && run.epochs[0].pos);
  assert.equal(run.model.assumed, true);
  assert.equal(run.monitorsRun, null);
  assert.deepEqual(reasonsAt(run, 3).notRun, [], "not stated, so nothing is claimed as not run");
  assert.ok(run.strips.includes("future-monitor"), "an unknown monitor name is a monitor");
  assert.match(monitorInfo("future-monitor"), /does not have a description/);
  assert.ok(run.notes.some((n) => /does not state which monitors ran/.test(n)));
  assert.match(pkshtFor(run.epochs[2], run), /^\$PKSHT,1,080002\.00,23\.4,U,W,heading-course:40\.0\*[0-9A-F]{2}$/);
  // Later schema versions add a position key at the end.
  // Schema 1.1 writes the position as an object {lat_deg, lon_deg, height_m}; an array and flat keys are accepted too.
  const v11 = buildRun({ lines: p.epochs.map((e, i) => ({ ...e, position: { lat_deg: 59 + i * 0.001, lon_deg: 24, height_m: 17.2 } })) }).run;
  assert.equal(v11.hasPosition, true); assert.deepEqual(v11.epochs[2].pos, [59.002, 24]);
  assert.deepEqual(buildRun({ lines: p.epochs.map((e, i) => ({ ...e, position: [59 + i * 0.001, 24] })) }).run.epochs[2].pos, [59.002, 24]);
  assert.deepEqual(buildRun({ lines: p.epochs.map((e, i) => ({ ...e, lat_deg: 59 + i * 0.001, lon_deg: 24 })) }).run.epochs[2].pos, [59.002, 24]);
  assert.equal(buildRun({ lines: p.epochs.map((e) => ({ ...e, position: { lat_deg: "x", lon_deg: 24 } })) }).run.hasPosition, false);
}

// NMEA: a corrupt checksum is skipped, southern and western hemispheres are signed.
{
  assert.equal(nmeaChecksumOk("$GPGGA,080000.00,5927.29982,N,02446.20166,E,1,12,0.9,16.7,M,21.0,M,,*5B"), true);
  assert.equal(nmeaChecksumOk("$GPGGA,080000.00,5927.29982,N,02446.20166,E,1,12,0.9,16.7,M,21.0,M,,*5C"), false);
  const body = "GPGGA,010203.50,3355.50000,S,15112.00000,W,1,08,1.0,5.0,M,0.0,M,,";
  let c = 0; for (const ch of body) c ^= ch.charCodeAt(0);
  const f = parseNmeaFixes(`$${body}*${c.toString(16).toUpperCase()}\n$${body}*00\n`);
  assert.equal(f.fixes.length, 1); assert.equal(f.skipped, 1);
  assert.ok(f.fixes[0].lat < 0 && f.fixes[0].lon < 0 && Math.abs(f.fixes[0].tod - (3723.5)) < 1e-9);
}

// Truth: joined by time; the offset is the engine's tangent-plane distance.
{
  const truth = parseTruth("t_s,true_lat_deg,true_lon_deg\n0,59.0,24.0\n1,59.001,24.0\n2,59.002,24.0\n3,59.003,24.0\n4,59.004,24.0\n5,59.005,24.0\n");
  assert.equal(truth.t.length, 6);
  const { run } = buildRun({ result, truth });
  assert.equal(run.hasTruth, true);
  assert.equal(run.epochs[5].offsetM > 50 && run.epochs[5].offsetM < 90, true, "0.001 degree of longitude at 59 N is about 57 m");
  assert.equal(run.epochs[3].offsetM, 0);
  assert.equal(run.epochs[8].truth, undefined, "no truth beyond the file");
  assert.match(buildRun({ result, truth: parseTruth("t_s,true_lat_deg,true_lon_deg\n500,1,1\n") }).run.notes.join(" "), /match no epoch/);
}

// Geometry.
{
  const [e, n] = enOffsetM(59, 24, 59, 24.001);
  assert.ok(Math.abs(n) < 1e-9 && e > 56 && e < 58);
  assert.ok(Math.abs(distanceM([59, 24], [59.001, 24]) - 111.4) < 0.5);
  assert.equal(niceLength(7300), 5000); assert.equal(niceLength(1999), 1000); assert.equal(niceLength(0), 0);
  const pr = makeProjection([[59, 24], [59.01, 24.02]]);
  assert.ok(pr.widthM > 1100 && pr.widthM < 1200 && pr.heightM > 1100 && pr.heightM < 1130);
  assert.equal(makeProjection([null]), null);
  assert.equal(nearestIndex([0, 1, 2, 3], 1.4), 1); assert.equal(nearestIndex([0, 1, 2, 3], 9, 0.5), -1);
}

// trust.csv: scores and reasons only.
{
  const csv = "t_s,state,n_sats,cn0_mean_dbhz,cn0_drop_db,agc,agc_z,jam_ind,position_offset_m,raim_stat,raim_thr,clock_innov_ns,clock_bound_ns,alarms,score,score_reasons\n0,calibrating,8,,,,,,,,,,,,,\n1,untrusted,8,,,,,,,,,,,heading-course;cn0-spread,23.4,heading-course:40.0;cn0-spread:30.0\n";
  const c = parseTrustCsv(csv);
  assert.equal(c.epochs.length, 2); assert.equal(c.epochs[0].score, null);
  assert.deepEqual(c.epochs[1].deductions, [{ monitor: "heading-course", ratio: null, points: 40 }, { monitor: "cn0-spread", ratio: null, points: 30 }]);
  assert.deepEqual(c.epochs[1].alarms, ["heading-course", "cn0-spread"]);
  const { run } = buildRun({ csv: c });
  assert.equal(run.hasPosition, false);
}

// Every monitor named in the documentation has a description (16).
assert.equal(KNOWN_MONITORS.length, 16);
for (const m of KNOWN_MONITORS) assert.ok(MONITOR_INFO[m].length > 20, m);

// The recorded demo, when it is present: the engine's own result for the synthetic ferry log.
const demo = new URL("../trust/demo/tallinn-helsinki.result.json", import.meta.url);
const demoTruth = new URL("../trust/demo/tallinn-helsinki.truth.csv", import.meta.url);
if (fs.existsSync(demo)) {
  const { run, error } = buildRun({ result: JSON.parse(fs.readFileSync(demo, "utf8")), truth: parseTruth(fs.readFileSync(demoTruth, "utf8")) });
  assert.equal(error, undefined);
  assert.ok(run.hasPosition && run.hasTruth);
  assert.equal(run.epochs[0].state, "calibrating");
  assert.ok(run.firstUntrusted > 1500 / 1, "the drag-off begins at 1500 s, so nothing before it is untrusted");
  assert.ok(run.epochs.slice(0, 1500).every((e) => e.state !== "untrusted"), "no untrusted epoch before the drag-off");
  assert.ok(run.epochs[2900].offsetM > 100, "reported and true positions have separated by the end");
  assert.ok(run.epochs[1000].offsetM < 30, "and are close before the drag-off");
  assert.ok(run.epochs.every((e) => e.pos), "every epoch has a reported position");
  assert.match(run.advisory, /^Advisory software, not type-approved navigation equipment/, "the recorded result carries the advisory statement (schema 1.2)");
}
// Robustness: a malformed file never throws; it is counted or refused with a reason.
{
  // epochs without a numeric t_s, deductions without a monitor name or points
  const messy = { ...result, epochs: [null, 3, { state: "nominal" }, ...result.epochs.map((e, i) => (i === 5 ? { ...e, score: { score: 30, band: "untrusted", deductions: [{ monitor: 7, points: 1 }, { monitor: "kinematic" }, null, { monitor: "kinematic", ratio: 2, points: 40 }] } } : e))] };
  const r = buildRun({ result: messy });
  assert.equal(r.error, undefined);
  assert.equal(r.run.epochs.length, 10);
  assert.ok(r.run.notes.some((n) => /3 epoch\(s\) without a numeric t_s were skipped/.test(n)));
  assert.deepEqual(r.run.epochs[5].deductions, [{ monitor: "kinematic", ratio: 2, points: 40 }]);
  const noObjs = buildRun({ lines: [null, 5, "x"] });
  assert.match(noObjs.error, /no epochs/);
  // monitor names that are prototype property names
  const proto = { ...result, monitors_run: ["constructor", "__proto__", "toString"], epochs: result.epochs.map((e, i) => (i === 5 ? { ...e, marine: { ...e.marine, ratios: [["constructor", 2], ["__proto__", 1.5], ["toString", 0.9]] }, score: { score: 10, band: "untrusted", deductions: [{ monitor: "constructor", ratio: 2, points: 40 }, { monitor: "__proto__", ratio: 1.5, points: 30 }, { monitor: "hasOwnProperty", ratio: 1, points: 5 }] } } : e)) };
  const q = buildRun({ result: proto });
  assert.equal(q.error, undefined);
  assert.match(monitorInfo("constructor"), /does not have a description/);
  assert.match(monitorInfo("__proto__"), /does not have a description/);
  assert.equal(q.run.epochs[5].ratios.constructor, 2);
  assert.equal(reasonsAt(q.run, 5).ded[0].weight, null, "a weight is only one the file states");
  assert.deepEqual(epochsAboveOnset(q.run, "constructor"), [5]);
  assert.ok(q.run.strips.includes("constructor"));
  // a state this page does not know is drawn as calibrating and said so; CSV states are normalised too
  const odd = buildRun({ result: { ...result, epochs: result.epochs.map((e, i) => (i === 4 ? { ...e, state: "Weird" } : i === 5 ? { ...e, state: "UNTRUSTED" } : e)) } }).run;
  assert.equal(odd.epochs[4].state, "calibrating"); assert.equal(odd.epochs[5].state, "untrusted");
  assert.ok(odd.notes.some((n) => /1 epoch\(s\) carry a state this page does not know \(Weird\)/.test(n)));
  const csv = parseTrustCsv("t_s,state,alarms,score,score_reasons\n0,CALIBRATING,,,\n1,Untrusted,x,20,kinematic:40.0\n2,mystery,,50,\n");
  const cr = buildRun({ csv }).run;
  assert.deepEqual(cr.epochs.map((e) => e.state), ["calibrating", "untrusted", "calibrating"]);
  assert.ok(cr.notes.some((n) => /1 epoch\(s\) carry a state this page does not know \(mystery\)/.test(n)));
  assert.match(pkshtFor(cr.epochs[1], cr), /,U,/);
  // epoch cap
  const many = Array.from({ length: MAX_EPOCHS + 1 }, (_, i) => ({ seq: i + 1, t_s: i, state: "nominal", score: 100, deductions: [], alarms: [], gate: "off" }));
  assert.match(buildRun({ lines: many }).error, /at most 20000/);
  // NMEA: a GGA with no comma is skipped, the rest still read
  const f = parseNmeaFixes("$GPGGAxxxx\n$GPGGA,,,,,\n$GPGGA,010203.00,3355.50000,S,15112.00000,W,1,08,1.0,5.0,M,0.0,M,,\n");
  assert.equal(f.fixes.length, 1); assert.equal(f.skipped, 2);
  // truth: an empty latitude or longitude is a gap, not 0, 0
  const t = parseTruth("t_s,true_lat_deg,true_lon_deg\n0,59,24\n1,,\n2,59.1,\n3,,24\n4,95,24\n5,59.2,24.2\n");
  assert.deepEqual(t.t, [0, 5]);
}
// Schema 1.2: every vessel output carries the advisory statement; the page shows the file's own text verbatim.
{
  const ADV = "Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.";
  // batch result
  const r = buildRun({ result: { ...result, advisory: ADV } }).run;
  assert.equal(r.advisory, ADV);
  // live lines 1.2: the advisory key sits after position on every line; the object position still reads
  const lines = [0, 1, 2].map((i) => ({ seq: i + 1, t_s: i, time: null, state: i ? "nominal" : "calibrating", score: i ? 100 : null, deductions: [], alarms: [], gate: "off", note: null, position: { lat_deg: 59 + i * 1e-3, lon_deg: 24, height_m: 17 }, advisory: ADV }));
  assert.equal(sniff(lines.map((l) => JSON.stringify(l)).join("\n")), "lines");
  const l = buildRun({ lines: parseLines(lines.map((x) => JSON.stringify(x)).join("\n")).epochs }).run;
  assert.equal(l.advisory, ADV); assert.equal(l.hasPosition, true);
  // a line stream whose lines disagree says so, and shows the first
  const d = buildRun({ lines: lines.map((x, i) => (i === 2 ? { ...x, advisory: "other" } : x)) }).run;
  assert.equal(d.advisory, ADV); assert.ok(d.notes.some((n) => /2 different advisory statements/.test(n)));
  // trust.csv: the advisory is a first "#" comment line; the file still sniffs as a csv and reads
  const csvText = `# ${ADV}\nt_s,state,alarms,score,score_reasons\n0,calibrating,,,\n1,nominal,,100,\n`;
  assert.equal(sniff(csvText), "csv");
  const c = parseTrustCsv(csvText);
  assert.equal(c.advisory, ADV); assert.equal(c.epochs.length, 2);
  assert.equal(buildRun({ csv: c }).run.advisory, ADV);
  // older outputs carry none: empty, nothing invented
  assert.equal(buildRun({ result }).run.advisory, "");
  assert.equal(buildRun({ csv: parseTrustCsv("t_s,state,alarms,score,score_reasons\n0,nominal,,100,\n") }).run.advisory, "");
  assert.equal(buildRun({ result: { ...result, advisory: 7 } }).run.advisory, "");
}
console.log("trust.test.mjs: ok");
