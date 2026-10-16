// SPDX-License-Identifier: AGPL-3.0-only
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, statSync } from "node:fs";
import { createGeometryAdapter, chooseBackend, featuresFor, TLE_FIELDS, MAX_TLE_BYTES, readTleInput, tleEpochOk, buildInterimToml, parseInterimNmea, interimInstant, buildRequest, skylineRequest, systemOf, parseGeometry, parseMonteCarlo, parsePresets, parseProfile, INTERIM_SKYLINES, SKYLINE_LABELS, GEOMETRY_FNS, INTERIM_EPOCH } from "./geometry-adapter.mjs";
import { parseState, SKYLINE_PRESETS, DEFAULTS, LEO_PRESETS } from "./geometry-url.mjs";
import { emptyTable, brush, elAt, isOpen, BINS } from "./skyline-edit.mjs";
import { ENGINE_FNS, ENGINE_FNS_036 } from "./engine.mjs";

const fake = (fns, impl = {}) => ({ available: true, version: "9.9.9", has: (f) => fns.includes(f), call: async (f, ...a) => impl[f](...a) });
const state = (q = "") => parseState(q).state;

test("the backend is chosen from what the engine has, and features follow it", () => {
  assert.equal(chooseBackend(null), "none");
  assert.equal(chooseBackend({ available: false, has: () => true }), "none");
  assert.equal(chooseBackend(fake(["nmea_training"])), "interim");
  assert.equal(chooseBackend(fake(["nmea_training", "sky_geometry"])), "geometry");
  const fi = featuresFor("interim", fake(["nmea_training"]));
  assert.equal(fi.systems.leo, false);
  assert.equal(fi.skyline, false);
  assert.equal(fi.monteCarlo, false);
  const fg = featuresFor("geometry", fake(GEOMETRY_FNS));
  assert.ok(fg.systems.leo && fg.skyline && fg.canyon && fg.monteCarlo && fg.svg && fg.tle);
  assert.equal(featuresFor("geometry", fake(["sky_geometry"])).monteCarlo, false, "each optional function is checked on its own");
});

test("the 0.36 names are the design note's and W21's, and the worker allows exactly them", () => {
  assert.deepEqual([...GEOMETRY_FNS], ["sky_geometry", "sky_monte_carlo", "skyline_presets", "skyline_profile", "skyplot_svg"]);
  assert.deepEqual([...ENGINE_FNS_036], [...GEOMETRY_FNS]);
  assert.ok(GEOMETRY_FNS.every((f) => ENGINE_FNS.includes(f)));
});

test("every preset has a label and an interim outline below 90 degrees", () => {
  for (const s of SKYLINE_PRESETS) {
    assert.ok(SKYLINE_LABELS[s], s);
    const t = parseProfile(INTERIM_SKYLINES[s].map((p) => [p.az, p.el]));
    assert.ok(t && !isOpen(t), s);
  }
});

test("the interim scenario carries numbers and fixed names only, at the reference epoch plus the offset", () => {
  assert.equal(interimInstant(3600), "2026-10-12T01:00:00Z");
  assert.equal(interimInstant(0), INTERIM_EPOCH);
  const t = buildInterimToml(state("?site=89.9,-12.5,0&mask=45&sys=G,C,L:xona-pulsar&seed=77&t=60"));
  assert.match(t, /lat_deg = 89\n/);
  assert.match(t, /lon_deg = -12.5\n/);
  assert.match(t, /systems = \["gps", "beidou"\]/);
  assert.match(t, /seed = 77\n/);
  assert.match(t, /start_utc = "2026-10-12T00:01:00Z"/);
  assert.throws(() => buildInterimToml({ ...DEFAULTS, sys: ["gps"], lon: NaN }));
});

const NMEA = [
  "$PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION*3F",
  "$GNGSA,A,3,01,08,,,,,,,,,,,1.8,1.0,1.4,1*00",
  "$GNGSA,A,3,24,,,,,,,,,,,,1.8,1.0,1.4,3*00",
  "$GPGSV,1,1,03,01,83,154,46,08,36,185,42,14,10,000,36,1*00",
  "$GAGSV,1,1,02,24,53,073,43,09,75,227,45,7*00",
  "$GAGSV,1,1,01,99,91,000,43,7*00",
  "$GLGSV,1,1,01,05,10,010,30,1*00",
  "$GPGSV,1,1,01,01,<b>,154,46,1*00",
  "$GNGSA,A,3,14,,,,,,,,,,,,9.9,9.9,9.9,1*00",
  "$GPGSV,1,1,01,02,10,010,30,1*00",
].join("\n");

test("the interim reader takes the first epoch's GSV and GSA only, strictly", () => {
  const r = parseInterimNmea(NMEA);
  assert.deepEqual(r.dop, { gdop: null, pdop: 1.8, hdop: 1, vdop: 1.4, tdop: null });
  assert.deepEqual(r.sats.map((s) => `${s.sys}${s.id}:${s.az}/${s.el}:${s.used ? "u" : "-"}`), ["gps1:154/83:u", "gps8:185/36:u", "gps14:0/10:-", "galileo9:227/75:-", "galileo24:73/53:u"]);
  assert.equal(r.nUsed, 3);
  assert.deepEqual(parseInterimNmea("garbage\n$GPGSV,not,a*ZZ").sats, []);
});

test("the interim compute says what needs engine 0.36", async () => {
  let got;
  const eng = fake(["nmea_training"], { nmea_training: (toml, seed) => { got = { toml, seed }; return JSON.stringify({ nmea: NMEA }); } });
  const a = createGeometryAdapter(eng);
  const r = await a.compute(state("?sys=G,E,L:iridium-stl&sky=p:fjord&seed=5"));
  assert.equal(got.seed, 5);
  assert.equal(r.backend, "interim");
  assert.equal(r.ellipse, null);
  assert.equal(r.openFraction, null);
  assert.ok(r.missing.includes("GDOP") && r.missing.includes("the Monte Carlo cloud") && r.missing.includes("the skyline"));
  assert.ok(r.notes.some((n) => /LEO: needs engine 0\.36/.test(n)) && r.notes.some((n) => /skyline is drawn but not applied/.test(n)));
  assert.equal((await a.compute(state("?sys=L:iridium-stl"))).sats.length, 0);
  assert.equal(await a.monteCarlo(state()), null);
  assert.equal(await a.svg(state()), null);
  assert.equal(await a.profile({ kind: "canyon" }), null);
  const p = await a.preset("fjord");
  assert.match(p.provenance, /Illustrative/);
  assert.ok(isOpen((await a.preset("__proto__")).table));
  await assert.rejects(() => createGeometryAdapter(fake(["nmea_training"], { nmea_training: () => "not json" })).compute(state()), /not JSON/);
});

test("no engine: an empty result that says why", async () => {
  const r = await createGeometryAdapter(null).compute(state());
  assert.equal(r.backend, "none");
  assert.match(r.notes[0], /not running/);
});

test("the 0.36 request is W21's: site, time_s, preset names, mask, UERE, 95 % and the skyline object", () => {
  const s = state("?site=1,2,3&t=60&sys=G,C,L:xona-pulsar&mask=7&uere=2&sky=c:35,18,24,40,1.5");
  assert.deepEqual(buildRequest(s), { site: { lat_deg: 1, lon_deg: 2, height_m: 3 }, time_s: 60, systems: ["gps-baseline", "beidou", "xona-pulsar"], mask_deg: 7, sigma_uere_m: 2, confidence: 0.95, skyline: { street_az_deg: 35, width_m: 18, height_left_m: 24, height_right_m: 40, antenna_m: 1.5 } });
  assert.deepEqual(skylineRequest({ kind: "preset", name: "fjord" }), { preset: "fjord" });
  assert.equal(skylineRequest({ kind: "none" }), null);
  const tab = skylineRequest({ kind: "table", table: brush(emptyTable(), 10, 20) }).table;
  assert.equal(tab.length, BINS);
  assert.deepEqual(tab[10], [10, 20]);
  assert.ok(tab.every((r, k) => r[0] === k), "azimuths strictly increasing in [0, 360)");
  assert.equal(buildRequest(state("?sky=none")).skyline, undefined);
  for (const [n, sys] of [["gps-baseline", "gps"], ["GPS", "gps"], ["galileo", "galileo"], ["beidou-meo", "beidou"], ["starlink-sop", "leo"], ["glonass", null], ["evil", null], [5, null]]) assert.equal(systemOf(n), sys, String(n));
});

test("the 0.36 replies are checked field by field", async () => {
  const reply = {
    label: "MODELLED", statement: "Geometry only.", advisory: "Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.",
    skyline_source: "preset fjord", open_fraction: 0.62, n_visible: 1, n_masked: 1, n_below_horizon: 7,
    satellites: [{ id: "G03", system: "gps-baseline", az_deg: 370, el_deg: 40, cut_deg: 5, visible: true, masked: false }, { id: "L12", system: "xona-pulsar", az_deg: 10, el_deg: 15, cut_deg: 22, visible: false, masked: true }, { system: "evil", az_deg: 1, el_deg: 1 }, { system: "__proto__", az_deg: 1, el_deg: 1 }, { system: "gps-baseline", az_deg: "x", el_deg: 1 }],
    dop: { gdop: 2.1, pdop: 1.9, hdop: 1.1, vdop: 1.5, tdop: "1", tdop_by_clock: [0.6] },
    ellipse_1sigma: { semi_major_m: 2.6, semi_minor_m: 1.4, orientation_deg: 33 },
    ellipse: { sigma_uere_m: 2, confidence: 0.95, scale_k: 2.4477, semi_major_m: 6.36, semi_minor_m: 3.43, orientation_deg: 33 },
  };
  const r = parseGeometry(reply, "0.36.0");
  assert.deepEqual(r.sats.map((x) => [x.sys, x.id, x.az, x.used, x.masked]), [["gps", "G03", 10, true, false], ["leo", "L12", 10, false, true]]);
  assert.equal(r.nMasked, 1);
  assert.equal(r.nBelow, 7);
  assert.equal(r.dop.tdop, null);
  assert.deepEqual(r.ellipse, { semiMajorM: 2.6, semiMinorM: 1.4, orientationDeg: 33, confidence: null, scaleK: null, sigmaEastM: null, sigmaNorthM: null });
  assert.equal(r.ellipse95.semiMajorM, 6.36);
  assert.equal(r.ellipse95.scaleK, 2.4477);
  assert.equal(r.openFraction, 0.62);
  assert.equal(r.provenance.label, "MODELLED");
  assert.match(r.provenance.advisory, /IEC 61108, IEC 61162/);
  assert.ok(r.notes.some((n) => /3 satellite record/.test(n)) && r.notes.some((n) => /Skyline: preset fjord/.test(n)));
  assert.throws(() => parseGeometry(null));
  assert.throws(() => parseGeometry([]));
  assert.equal(parseGeometry({ open_fraction: 2 }).openFraction, null);

  const mc = parseMonteCarlo({ label: "MODELLED", seed: 9, n: 3, samples_enu_m: [[1, 2, 3], [0.5, -1, 0], [1, "x", 0], "no"], rms_horizontal_m: 2.2, predicted_rms_horizontal_m: 2.1, rms_3d_m: 3.3, predicted_rms_3d_m: 3.2, fraction_inside_95: 0.951 });
  assert.equal(mc.points.length, 2);
  assert.equal(mc.inside95, 0.951);
  assert.equal(mc.samples, 3);
  assert.equal(mc.predictedHorizontalM, 2.1);
  assert.equal(mc.provenance.label, "MODELLED");
  assert.throws(() => parseMonteCarlo("x"));

  const presets = parsePresets([{ name: "fjord", label: "REPRESENTATIVE", description: "d", provenance: "p", table: Array(BINS).fill(21.8), open_fraction: 0.7 }, { name: "evil", table: Array(BINS).fill(1) }]);
  assert.deepEqual(Object.keys(presets), ["fjord"]);
  assert.equal(elAt(presets.fjord.table, 100), 22);
  assert.equal(presets.fjord.provenance, "REPRESENTATIVE. d. p");
  assert.equal(parseProfile({ table: "x" }), null);

  const calls = [];
  const eng = fake(["nmea_training", ...GEOMETRY_FNS], {
    sky_geometry: (j) => { calls.push(["g", JSON.parse(j)]); return JSON.stringify(reply); },
    sky_monte_carlo: (j, seed, n) => { calls.push(["mc", seed, n]); return JSON.stringify({ seed, n, samples_enu_m: [[1, 1, 0]] }); },
    skyline_presets: () => JSON.stringify([{ name: "fjord", table: Array.from({ length: BINS }, (_, k) => (k % 180 === 90 ? 22 : 2)), provenance: "engine" }]),
    skyline_profile: (j) => { calls.push(["p", JSON.parse(j)]); return JSON.stringify({ table: Array(BINS).fill(30) }); },
    skyplot_svg: () => "<svg/>",
  });
  const a = createGeometryAdapter(eng);
  assert.equal(a.features.tle, true, "sky_geometry takes TLE text (TLE_FIELDS)");
  const s = state("?mc=500&seed=4");
  assert.equal((await a.compute(s)).ellipse.semiMajorM, 2.6);
  assert.equal((await a.monteCarlo(s)).points.length, 1);
  assert.deepEqual(calls[1], ["mc", 4, 500]);
  assert.equal(await a.monteCarlo(state("?mc=0")), null, "mc=0 switches the cloud off");
  const p = await a.preset("fjord");
  assert.equal(p.provenance, "engine");
  assert.equal(elAt(p.table, 90), 22);
  assert.equal(elAt(await a.profile({ kind: "canyon", streetAz: 0, widthM: 20, leftM: 30, rightM: 30, antennaM: 1.5 }), 5), 30);
  assert.equal(await a.svg(s), "<svg/>");
});

test("pasted elements: W21's fields, one epoch rule in the page and the request, and never sent while off", async () => {
  assert.deepEqual({ ...TLE_FIELDS }, { text: "tle", epoch: "epoch", system: "tle_system" });
  const s = state("?sys=G,E,L:xona-pulsar&t=60");
  const tle = { text: "ISS\n1 25544U ...\n2 25544 ...", epochUtc: "2026-10-12T06:00:00Z" };
  const r = buildRequest(s, tle);
  assert.equal(r.systems, undefined, "the presets are left out: the sky is the person's own");
  assert.equal(r.tle, tle.text);
  assert.equal(r.epoch, "2026-10-12T06:00:00Z");
  assert.equal(r.tle_system, "TLE");
  assert.equal(r.time_s, 60, "the offset still applies, counted from the epoch");
  assert.equal(buildRequest(s, tle, null).tle, undefined, "no field names, no elements in the request");
  assert.equal(buildRequest(s, { text: "x", epochUtc: "1999-12-31T23:59:59Z" }).tle, undefined, "an epoch outside 2000 to 2099 sends no elements");
  assert.equal(buildRequest(s, { text: "x".repeat(MAX_TLE_BYTES + 1), epochUtc: tle.epochUtc }).tle, undefined, "nor does text over the limit");
  // The page path: the same rule, said in words.
  assert.deepEqual(readTleInput("1 2\n2 3", "2026-10-12T06:00"), { tle: { text: "1 2\n2 3", epochUtc: "2026-10-12T06:00:00Z" } });
  assert.deepEqual(readTleInput("1 2", "2026-10-12T06:00:30").tle.epochUtc, "2026-10-12T06:00:30Z");
  for (const bad of ["1999-12-31T23:59", "2100-01-01T00:00", "2026-13-01T00:00", "2026-10-12T24:00", "", "2026-10-12 06:00", "2026-10-12T06:00Z"]) assert.equal(readTleInput("1 2", bad).error, "Give a UTC epoch from 2000 to 2099.", bad);
  assert.match(readTleInput("  ", "2026-10-12T06:00").error, /Paste/);
  assert.match(readTleInput("é".repeat(MAX_TLE_BYTES / 2 + 1), "2026-10-12T06:00").error, /4 MiB/, "the cap counts bytes, not characters");
  assert.ok(tleEpochOk("2000-01-01T00:00:00Z") && tleEpochOk("2099-12-31T23:59:59Z") && !tleEpochOk("2026-10-12T06:00:00"));
  assert.equal(systemOf("TLE"), "tle");
  let sent;
  const eng = fake(["nmea_training", ...GEOMETRY_FNS], { sky_geometry: (j) => { sent = JSON.parse(j); return JSON.stringify({ satellites: [{ id: "TLE-25544", system: "TLE", az_deg: 10, el_deg: 50, visible: true, masked: false }], sky_source: "tle-at-epoch", sky_statement: "The sky those element sets give at 2026-10-12T06:00:00Z; not a measurement.", epoch_utc: "2026-10-12T06:00:00.000000Z", tle_skipped: ["X: bad checksum"] }); } });
  const off = createGeometryAdapter(eng, null);
  assert.equal(off.features.tle, false);
  await off.compute(s, tle);
  assert.equal(sent.tle, undefined, "the adapter never sends elements while the feature is off");
  const on = createGeometryAdapter(eng);
  assert.equal(on.features.tle, true);
  const res = await on.compute(s, tle);
  assert.equal(sent.tle, tle.text);
  assert.deepEqual(res.sats.map((x) => [x.sys, x.id]), [["tle", "25544"]]);
  assert.equal(res.skySource, "tle-at-epoch");
  assert.match(res.skyStatement, /not a measurement/);
  assert.ok(res.notes.some((n) => /1 element set\(s\) were skipped: X: bad checksum/.test(n)));
  assert.equal(createGeometryAdapter(fake(["nmea_training"])).features.tle, false, "the 0.35 engine never offers it");
});

// Against the real engine package, when it is checked out (not an LFS pointer).
const PKG = new URL("../pkg/", import.meta.url);
const havePkg = (() => { try { return statSync(new URL("kshana_bg.wasm", PKG)).size > 1024; } catch { return false; } })();
test("against the real engine package", { skip: !havePkg && "pkg/kshana_bg.wasm is not checked out" }, async () => {
  const mod = await import(new URL("kshana.js", PKG).href);
  await mod.default({ module_or_path: readFileSync(new URL("kshana_bg.wasm", PKG)) });
  // The page's engine only offers the functions ENGINE_FNS lists (lib/engine-page.mjs); do the same here.
  const eng = { available: true, version: mod.version(), has: (f) => ENGINE_FNS.includes(f) && typeof mod[f] === "function", call: async (f, ...a) => mod[f](...a) };
  const a = createGeometryAdapter(eng);
  assert.ok(["interim", "geometry"].includes(a.backend));
  const r = await a.compute(state("?mask=10"));
  assert.ok(r.sats.length >= 12, `only ${r.sats.length} satellites`);
  assert.ok(r.sats.every((x) => x.el >= 0 && x.el <= 90 && x.az >= 0 && x.az < 360));
  assert.ok(r.nUsed >= 4);
  assert.ok(r.dop.pdop > 0 && r.dop.hdop > 0 && r.dop.vdop > 0 && r.dop.pdop >= r.dop.hdop);
  assert.deepEqual(await a.compute(state("?mask=10")), r, "the same state gives the same answer");
  assert.notDeepEqual((await a.compute(state("?mask=10&t=10800"))).sats, r.sats, "the sky moves with the time offset");
});

// Against a 0.36 engine package with the Geometry functions (a wasm-pack build of the engine branch that adds
// them), when KSHANA_GEOMETRY_PKG names its folder. The Studio's own pkg/ is the release it ships.
const PKG036 = process.env.KSHANA_GEOMETRY_PKG ? new URL(`file://${process.env.KSHANA_GEOMETRY_PKG.replace(/\/?$/, "/")}`) : null;
test("the geometry backend against a 0.36 engine package", { skip: !PKG036 && "KSHANA_GEOMETRY_PKG is not set" }, async () => {
  const mod = await import(new URL("kshana.js", PKG036).href);
  await mod.default({ module_or_path: readFileSync(new URL("kshana_bg.wasm", PKG036)) });
  const eng = { available: true, version: mod.version(), has: (f) => ENGINE_FNS.includes(f) && typeof mod[f] === "function", call: async (f, ...a) => mod[f](...a) };
  const a = createGeometryAdapter(eng);
  assert.equal(a.backend, "geometry");
  assert.ok(a.features.monteCarlo && a.features.canyon && a.features.svg && a.features.systems.leo);
  const s = state("?sys=G,E,C,L:xona-pulsar&sky=p:fjord&mc=1000");
  const r = await a.compute(s);
  assert.ok(r.sats.length > 20 && r.sats.every((x) => ["gps", "galileo", "beidou", "leo"].includes(x.sys)));
  assert.ok(r.sats.some((x) => x.sys === "leo"), "the LEO layer is drawn");
  assert.ok(r.nMasked > 0 && r.sats.some((x) => x.masked), "the fjord hides satellites");
  assert.ok([r.dop.gdop, r.dop.pdop, r.dop.hdop, r.dop.vdop, r.dop.tdop].every((x) => x > 0));
  assert.ok(r.ellipse && r.ellipse95 && Math.abs(r.ellipse95.semiMajorM / r.ellipse.semiMajorM - r.ellipse95.scaleK) < 1e-9, "the 95 % ellipse is the 1-sigma one times the engine's stated scale");
  assert.ok(r.openFraction > 0 && r.openFraction < 1);
  assert.equal(r.provenance.label, "MODELLED");
  assert.equal(r.provenance.advisory, "Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.");
  const fewer = await a.compute(state("?sys=G,E,C,L:xona-pulsar"));
  assert.ok(fewer.nMasked === 0 && fewer.nUsed >= r.nUsed, "an open horizon hides nothing and uses at least as many satellites");
  assert.ok(fewer.dop.pdop <= r.dop.pdop + 1e-12, "a skyline never improves the DOP");
  for (const leo of LEO_PRESETS) {
    const r2 = await a.compute(state(`?sys=G,E,C,L:${leo}`));
    assert.ok(r2.sats.some((x) => x.sys === "leo"), `the ${leo} layer is drawn`);
    assert.ok((await a.monteCarlo(state(`?sys=G,E,C,L:${leo}&mc=100`))).points.length === 100, `${leo}: a cloud`);
  }
  const mc = await a.monteCarlo(s);
  assert.equal(mc.points.length, 1000);
  assert.ok(Math.abs(mc.rmsHorizontalM / mc.predictedHorizontalM - 1) < 0.1, "cloud RMS ≈ σ_UERE × HDOP");
  assert.ok(Math.abs(mc.predictedHorizontalM - s.uere * r.dop.hdop) < 1e-9, "the prediction is σ_UERE × HDOP");
  assert.deepEqual((await a.monteCarlo(s)).points, mc.points, "the same seed gives the same cloud");
  const p = await a.preset("city-street");
  assert.match(p.provenance, /REPRESENTATIVE/);
  const canyon = await a.profile({ kind: "canyon", streetAz: 0, widthM: 20, leftM: 30, rightM: 30, antennaM: 1.5 });
  assert.ok(elAt(canyon, 90) > 60 && elAt(canyon, 0) === 0, "a north-south street is open along it and walled across it");
  const drawn = brush(emptyTable(), 120, 40, 10);
  const back = await a.profile({ kind: "table", table: drawn });
  assert.deepEqual(back, drawn, "the engine uses exactly the drawn table");
  assert.match(await a.svg(s), /^<svg[\s>]/);
  // Pasted elements: the ISS set of scenarios/ephemeris.toml, dated near its own epoch, over Darmstadt.
  if (a.features.tle) {
    const iss = readFileSync(new URL("../scenarios/ephemeris.toml", import.meta.url), "utf8").match(/tle = """\n([\s\S]*?)"""/)[1];
    const at = state("?site=49.87,8.62,144&sys=G");
    const own = await a.compute(at, { text: `ISS (ZARYA)\n${iss}`, epochUtc: "2020-02-14T08:54:00Z" });
    assert.match(own.skySource, /^tle-at-epoch/);
    assert.match(own.skyStatement, /measurement/);
    assert.ok(own.sats.every((x) => x.sys === "tle"), "only the person's satellites: the presets are left out");
    assert.deepEqual(own.sats.map((x) => x.id), ["ISS (ZARYA)"], "the ISS is up over Darmstadt at 08:54 UTC");
    assert.ok(own.sats[0].el > 20);
    const later = await a.compute(state("?site=49.87,8.62,144&sys=G&t=60"), { text: `ISS (ZARYA)\n${iss}`, epochUtc: "2020-02-14T08:54:00Z" });
    assert.ok(later.sats.length === 0 || Math.abs(later.sats[0].az - own.sats[0].az) > 1, "the time offset moves a pasted sky (the ISS crosses the sky in minutes)");
    assert.match(later.skyStatement, /2020-02-14T08:5(4:59\.9|5:00)/, "the engine dates the sky at the epoch plus the offset");
    const bad = await a.compute(at, { text: "ISS\n1 25544U garbage\n2 25544 garbage", epochUtc: "2020-02-14T04:30:00Z" }).catch((e) => e);
    assert.ok(typeof bad === "string" || bad instanceof Error || (bad.sats.length === 0 && bad.notes.some((n) => /skipped/.test(n))), "a broken set is refused or reported, never drawn");
  }
});
