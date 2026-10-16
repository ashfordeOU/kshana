// SPDX-License-Identifier: AGPL-3.0-only
// node --test lib/lunar-station.test.mjs
// The report below is hand-written test input in the engine's field names (src/lunar_station.rs), not an engine output.
import { test } from "node:test";
import assert from "node:assert/strict";
import { readReport, unwrap, percentileOf, textIsGeneric, HONESTY, parseState, buildSearch, withInputs, tomlNumber, stereo, cellsOf, cellPath, thresholdEdges, meets, destination, binOf, rangeEdges, binIn, dominantShare, pct, metres, INPUTS, REASONS } from "./lunar-station.mjs";

const point = (lat, lon, corrected, extra = {}) => ({ lat_deg: lat, lon_deg: lon, distance_km: 0, azimuth_deg: 0, area_weight: 1, availability: 1, coverage_fraction: 1, corrected_p_3d_m: corrected, corrected_p_h_m: corrected, corrected_p_v_m: corrected, uncorrected_p_3d_m: corrected == null ? null : corrected * 20, hpl_median_m: 3, hpl_max_m: 4, vpl_max_m: 5, hpl_below_alert_fraction: 1, unavailable: { user_lt4: 0, station_missing_sat: 0 }, ...extra });
// A pole, a ring of four at -89 and a ring of eight at -88: the pole and two of the -89 ring meet 1 m.
const report = () => ({
  kind: "lunar-station-coverage", label: "MODELLED", percentile: 95, n_sats: 8,
  error_model: { source: "orbit_and_clock", orbit_err_m: 100, clock_err_m: 30, los_sise_sigma_m: 40 },
  note: "MODELLED under stated public assumptions; not a statement about any real system; not affiliated.",
  inputs_echo: { station_lat_deg: -89, station_lon_deg: 0, accuracy_threshold_m: 1, percentile: 95, alert_limit_m: 10, grid_lat_max_deg: -88, grid_lat_step_deg: 1, n_trials: 50 },
  n_grid_points: 13, n_epochs: 144, n_trials: 50,
  region: { availability: 0.97, coverage_fraction: 0.6, corrected_p_3d_m: 1.4, corrected_p_h_m: 0.9, corrected_p_v_m: 1.1, uncorrected_p_3d_m: 28, improvement_factor: 20, hpl_max_m: 9, vpl_max_m: 12, hpl_below_alert_fraction: 0.9, worst_point: { lat_deg: -88, lon_deg: 180, corrected_p_3d_m: 3.2 } },
  coverage_radius_km: [{ azimuth_deg: 90, radius_km: 40, limited_by_grid: false, n_points: 3 }, { azimuth_deg: 0, radius_km: 55, limited_by_grid: true, n_points: 3 }, { azimuth_deg: 400, radius_km: 1 }],
  points: [
    point(-90, 0, 0.4),
    point(-89, 0, 0.5), point(-89, 90, 0.9), point(-89, 180, 1.5), point(-89, -90, 1.2),
    ...[0, 45, 90, 135, 180, -135, -90, -45].map((lon) => point(-88, lon, lon === 90 ? null : 2, lon === 90 ? { availability: 0.4, unavailable: { user_lt4: 80, station_missing_sat: 6 } } : {})),
  ],
  budget_at_station_and_at_edge: { epoch_s: 0, station: { total_m: 0.3 }, worst_point: { total_m: 2.9 } },
  units: { corrected_p_3d_m: "m" },
});

test("the report is read field by field; nothing is filled in", () => {
  const r = readReport(report());
  assert.equal(r.modelled, true);
  assert.equal(r.percentile, 95);
  assert.equal(r.region.corrected3d, 1.4); assert.equal(r.region.correctedH, 0.9); assert.equal(r.region.uncorrected3d, 28);
  assert.equal(r.region.improvement, 20); assert.deepEqual(r.region.worst, { lat: -88, lon: 180, value: 3.2 });
  assert.equal(r.points.length, 13);
  assert.deepEqual(r.points.find((p) => p.lat === -88 && p.lon === 90).reasons, [["user_lt4", 80], ["station_missing_sat", 6]]);
  assert.equal(r.points.find((p) => p.lat === -88 && p.lon === 90).corrected, null);
  assert.deepEqual(r.radius.map((x) => x.az), [0, 90], "sorted by azimuth; an azimuth above 360 is dropped");
  assert.deepEqual(r.radius.map((x) => x.limited), [true, false]);
  assert.equal(r.nSats, 8); assert.equal(r.errorModel.los_sise_sigma_m, 40);
  assert.deepEqual(r.points[0].reasons, [], "zero counts are not reasons");
  assert.deepEqual(r.station, { lat: -89, lon: 0 }); assert.equal(r.threshold, 1);
  const bare = readReport({ region: {}, points: [] });
  assert.equal(bare.percentile, null); assert.equal(bare.region.corrected3d, null); assert.equal(bare.modelled, false);
  assert.ok(Object.keys(REASONS).includes("user_lt4"));
});

test("a run_all reply, a recording and a bare report all open; anything else says why not", () => {
  const rep = report();
  assert.equal(unwrap({ summary: "x", json: JSON.stringify(rep), svg: "<svg/>" }).svg, "<svg/>");
  assert.equal(unwrap({ engine_version: "0.36.0", json: JSON.stringify(rep) }).engineVersion, "0.36.0");
  assert.ok(unwrap(JSON.stringify(rep)).report);
  assert.ok(unwrap({ report: rep }).report);
  assert.match(unwrap("{").error, /not JSON/);
  assert.match(unwrap({ n_sats: 8 }).error, /not a lunar-station-coverage report/);
  assert.match(readReport([1]).error, /not a JSON object/);
  assert.equal(percentileOf({ percentile: 99 }), 99);
  assert.equal(percentileOf({ inputs_echo: { percentile: 90 } }), 90);
  assert.match(unwrap({ kind: "lunar-differential-pnt", region: {}, points: [] }).error, /not a lunar-station-coverage report/);
});

test("generic names only: a note naming a programme or an agency is withheld, and the honesty block stays", () => {
  assert.equal(textIsGeneric("a lunar reference station"), true);
  for (const s of ["NovaMoon class", "Nova Moon", "ESA station", "the European Space Agency", "Moonlight service"]) assert.equal(textIsGeneric(s), false, s);
  const r = readReport({ ...report(), note: "A NovaMoon-class station." });
  assert.equal(r.note, ""); assert.equal(r.noteWithheld, true);
  assert.deepEqual(HONESTY, ["MODELLED.", "Under the stated public assumptions, not a statement about the performance of any real system.", "Not affiliated with or endorsed by any agency."]);
  assert.ok(HONESTY.every(textIsGeneric));
});

test("the address: only known inputs, in range, and the source", () => {
  const { state, notes } = parseState("?src=live&thr=2&trials=50&slat=-70&seed=1.5&bogus=1");
  assert.equal(state.src, "live");
  assert.deepEqual(state.set, { thr: 2, trials: 50 });
  assert.equal(notes.length, 2, "station latitude and a fractional seed are refused");
  assert.equal(buildSearch(state), "?src=live&thr=2&trials=50");
  assert.equal(buildSearch({ src: "recorded", set: {} }), "");
  assert.equal(parseState("?src=elsewhere").state.src, "recorded");
  assert.equal(parseState("?" + "x".repeat(600)).notes.length, 1);
  assert.equal(parseState("?thr=1e3").state.set.thr, undefined, "no exponent forms");
  for (const d of INPUTS) assert.ok(d.min < d.max && /^[a-z_]+$/.test(d.key));
});

test("inputs are written into the scenario file on their own lines; a key the file lacks is refused", () => {
  const toml = 'kind = "lunar-station-coverage"\nstation_lat_deg = -89.0   # S1\naccuracy_threshold_m = 1.0\nn_trials = 200\n';
  assert.equal(tomlNumber(toml, "station_lat_deg"), -89);
  assert.equal(tomlNumber(toml, "latency_s"), null);
  const w = withInputs(toml, { thr: 2.5, trials: 20 });
  assert.equal(tomlNumber(w.toml, "accuracy_threshold_m"), 2.5); assert.equal(tomlNumber(w.toml, "n_trials"), 20);
  assert.match(w.toml, /station_lat_deg = -89\.0   # S1/, "untouched lines and comments stay");
  assert.match(withInputs(toml, { lat: 2 }).error, /has no latency_s/);
  assert.match(withInputs(toml, { trials: 5000 }).error, /out of range/);
  assert.equal(withInputs(toml, {}).toml, toml);
});

test("the map: the pole in the centre, the rim at the grid edge, 0 up and 90 east to the right", () => {
  assert.ok(Math.hypot(...stereo(-90, 0)) < 1e-9);
  const [x0, y0] = stereo(-80, 0); assert.ok(Math.abs(x0) < 1e-9 && Math.abs(y0 + 180) < 1e-9);
  const [x1, y1] = stereo(-80, 90); assert.ok(Math.abs(x1 - 180) < 1e-9 && Math.abs(y1) < 1e-9);
  assert.ok(Math.hypot(...stereo(-85, 33)) < 180 && Math.hypot(...stereo(-85, 33)) > Math.hypot(...stereo(-87, 33)));
});

test("cells and the threshold boundary follow the report's points", () => {
  const r = readReport(report());
  const info = cellsOf(r.points, 1);
  assert.equal(info.cells.length, 13); assert.deepEqual(info.lats, [-90, -89, -88]);
  const pole = info.cells.find((c) => c.pole); assert.equal(pole.lat1, -89.5);
  assert.match(cellPath(pole, -88, 180), /^M.* A.*Z$/);
  assert.match(cellPath(info.cells[3], -88, 180), /^M[-\d. L]+Z$/);
  assert.equal(meets(r.points[0], 1), true); assert.equal(meets(r.points.find((p) => p.corrected == null), 1), false, "an unavailable point never meets the threshold");
  const segs = thresholdEdges(info, 1);
  assert.ok(segs.length > 0);
  const ring895 = segs.filter(([a, , b]) => a === -89.5 && b === -89.5);
  assert.ok(ring895.length > 0, "round the pole, where the -89 cells fail");
  assert.ok(ring895.every(([, x0, , x1]) => Math.abs((x0 + x1) / 2) > 45), "not beside the -89 cell at 0 degrees, which meets 1 m like the pole");
  assert.ok(segs.some(([a, , b]) => a === -88.5 && b === -88.5), "between the -89 ring and the -88 ring");
  assert.ok(segs.some(([a, lo, b, lo2]) => a !== b && lo === lo2), "a side between a meeting and a failing cell in the -89 ring");
  assert.ok(segs.every(([a, , b]) => a < -87.6 && b < -87.6), "the rim is never a boundary");
  assert.ok(thresholdEdges(info, 100).length <= 6, "at 100 m only the unavailable cell differs");
});

test("the coverage radius is placed along its azimuth; colour bins are multiples of the threshold", () => {
  const [lat, lon] = destination(-89, 0, 0, 30.3);
  assert.ok(Math.abs(lat - -88) < 0.01 && Math.abs(lon) < 1e-6, `${lat} ${lon}`);
  const [, lonE] = destination(-89, 0, 90, 10); assert.ok(lonE > 0, "east is east");
  assert.deepEqual([0.1, 0.4, 1, 1.5, 3, 9].map((v) => binOf(v, 1)), [0, 1, 2, 3, 4, 5]);
  assert.equal(binOf(null, 1), null); assert.equal(binOf(1, 0), null);
  assert.equal(pct(0.5), "50.0 %"); assert.equal(pct(0.9996), "99.96 %"); assert.equal(pct(null), "not stated");
  assert.equal(metres(0.512), "0.51 m"); assert.equal(metres(28.04), "28.0 m");
});

test("the own-range colouring spreads the values' range evenly in the logarithm; one-colour maps are detected", () => {
  const e = rangeEdges([1, 64, null, -3, 8]);
  assert.equal(e.length, 5);
  assert.ok(Math.abs(e[0] - 2) < 1e-9 && Math.abs(e[4] - 32) < 1e-9, e.join());
  assert.deepEqual([1, 2.5, 64, null].map((v) => binIn(v, e)), [0, 1, 5, null]);
  assert.equal(rangeEdges([null, 0]), null);
  assert.deepEqual(rangeEdges([3, 3]), [3]);
  assert.equal(dominantShare([5, 5, 5, 4, null]), 0.75);
  assert.equal(dominantShare([]), 0);
});
