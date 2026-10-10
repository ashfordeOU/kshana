// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the interference map page's data model. Run with `node lib/interference.test.mjs`.
// Fixtures: the CLI's own synthetic sample outputs (adsb-2026-03-01, ais-2026-03-01) and one synthetic
// confounded ADS-B day (adsb-2026-03-02), all in interference/demo/.
import assert from "node:assert/strict";
import fs from "node:fs";
import { parseMapFile, parseRouteExposure, statusCounts, stateCounts, stateOf, stateInfo, STATES, KEEP_CAVEATS, safeUrl, cellRows, cellBounds, groupBySource, describeMap, cellAt, cellsForTable, licenceBlock, statusInfo, STATUSES, showValue, pct } from "./interference.mjs";

const demo = (n) => fs.readFileSync(new URL(`../interference/demo/${n}`, import.meta.url), "utf8");
const a1 = parseMapFile(demo("adsb-custom-2026-03-01.geojson"), "adsb-custom-2026-03-01.geojson");
const a2 = parseMapFile(demo("adsb-custom-2026-03-02.geojson"), "adsb-custom-2026-03-02.geojson");
const s1 = parseMapFile(demo("ais-custom-2026-03-01.geojson"), "ais-custom-2026-03-01.geojson");
for (const r of [a1, a2, s1]) assert.equal(r.error, undefined);

// Licence, attribution, coverage and notice come through verbatim, per file.
{
  const m = a1.map;
  assert.equal(m.kind, "adsb"); assert.equal(m.date, "2026-03-01");
  assert.equal(m.licence.attribution, "Synthetic data generated for Kshana documentation. Not real observations.");
  assert.equal(m.licence.licence, "CC0-1.0");
  assert.equal(m.licence.licenceUrl, "https://creativecommons.org/publicdomain/zero/1.0/");
  assert.deepEqual(m.licence.coverage, ["Coverage of a user-supplied dataset is not described by Kshana."]);
  assert.match(m.licence.notice, /A missing cell was not observed/);
  assert.match(m.method.id, /^kshana-interference-map\/adsb\/v2$/);
  assert.ok(m.method.caveats.length > 0 && Object.keys(m.method.parameters).length > 5);
}
// The four states, none merged: the sample files show degraded, clear, unassessed, and a cell that is not there.
{
  const c = stateCounts(a1.map);
  assert.ok(c.degraded === 1 && c.clear === 6 && c.unassessed === 4);
  assert.equal(a1.map.cells.length, 11);
  assert.equal(a1.map.day.cells_suppressed_below_min_distinct, 1, "one cell is below the publication minimum: not observed, not drawn");
  assert.equal(cellAt(a1.map, -48.75, 30.25), a1.map.cells.findIndex((x) => x.i === 240 && x.j === 262));
  assert.equal(cellAt(a1.map, 0, 0), -1);
  assert.deepEqual(STATES.map((s) => s.id), ["degraded", "clear", "unassessed", "notobserved"]);
  assert.equal(stateOf("degraded"), "degraded"); assert.equal(stateOf("anomalous"), "degraded");
  assert.equal(stateOf("not_degraded"), "clear"); assert.equal(stateOf("not_anomalous"), "clear");
  assert.equal(stateOf("insufficient_sample"), "unassessed"); assert.equal(stateOf("withheld_day_confounded"), "unassessed");
  assert.equal(stateInfo("ais", "degraded").label, "Anomalous"); assert.equal(stateInfo("adsb", "degraded").label, "Degraded");
  assert.equal(statusCounts(a1.map).insufficient_sample, 4);
  for (const cell of a1.map.cells) assert.equal(cell.degraded, cell.status === "degraded");
}
// Methods v2: counts below the publication minimum are null and read "withheld (fewer than 5)", never zero.
{
  const nul = a1.map.cells.find((c) => c.props.aircraft_sampled === null);
  assert.ok(nul, "the sample has a cell with withheld counts");
  const rows = cellRows(a1.map, nul);
  for (const k of ["Aircraft sampled", "Aircraft affected", "Affected share"]) assert.equal(rows.find(([l]) => l === k)[1], "withheld (fewer than 5)", k);
  assert.equal(rows.find(([l]) => l === "Aircraft observed")[1], 28);
  assert.ok(!rows.some(([, v]) => v === 0 || v === "0%" || v === ""), "no withheld count is shown as zero or blank");
  assert.equal(statusInfo("adsb", nul.status).label, "Too few aircraft");
  // a withheld AIS count too
  const wa = s1.map.cells.find((c) => Object.values(c.props.vessels_flagged).every((v) => v === null));
  assert.ok(wa && cellRows(s1.map, wa).filter(([k]) => /^Flagged/.test(k)).every(([, v]) => v === "withheld (fewer than 5)"));
}
// withheld_no_background is a fifth ADS-B status that reads as unassessed (the day's background could not be estimated).
{
  const nb = JSON.parse(demo("adsb-custom-2026-03-01.geojson"));
  nb.features.find((f) => f.properties.status === "not_degraded").properties.status = "withheld_no_background";
  const r = parseMapFile(JSON.stringify(nb), "nb");
  assert.deepEqual(r.map.warnings.filter((w) => /does not know/.test(w)), []);
  assert.equal(stateOf("withheld_no_background"), "unassessed");
  assert.equal(stateCounts(r.map).unassessed, 5); assert.equal(stateCounts(r.map).clear, 5);
  assert.match(statusInfo("adsb", "withheld_no_background").text, /background .* could not be estimated/);
  assert.equal(STATUSES.adsb.length, 5);
}
// A grid that is not the pre-registered cell size is said so.
{
  assert.ok(!a1.map.warnings.some((w) => /pre-registered/.test(w)));
  const g = JSON.parse(demo("adsb-custom-2026-03-01.geojson")); g.kshana_interference_map.grid = { type: "fixed_lat_lon", cell_deg: 0.25, preregistered_cell_deg: 0.5, is_preregistered: false };
  const r = parseMapFile(JSON.stringify(g), "g");
  assert.ok(r.map.warnings.some((w) => /cell size of 0\.25° that is not the pre-registered one \(0\.5°\)/.test(w)));
}
// A confounded day declares no cell degraded, says so plainly, and keeps the withheld cells as unassessed.
{
  assert.equal(a2.map.day.day_confounded, true);
  const c = statusCounts(a2.map);
  assert.equal(c.degraded, 0); assert.ok(c.withheld_day_confounded > 0);
  assert.equal(stateCounts(a2.map).degraded, 0);
  assert.ok(a2.map.warnings.some((w) => /no cell was called degraded because of the day/.test(w)));
  assert.ok(a2.map.cells.every((x) => x.props.aircraft_observed >= 5));
}
// AIS: a null flagged count is shown as withheld (fewer than 3), never as zero; anomalous cells list detectors.
{
  const c = stateCounts(s1.map);
  assert.ok(c.degraded === 2 && c.clear === 5);
  const withheld = s1.map.cells.find((x) => Object.values(x.props.vessels_flagged).some((v) => v === null));
  assert.ok(withheld);
  const rows = cellRows(s1.map, withheld);
  assert.ok(rows.some(([k, v]) => /^Flagged/.test(k) && v === "withheld (fewer than 5)"));
  assert.ok(!rows.some(([k, v]) => /^Flagged/.test(k) && v === null));
  const hot = s1.map.cells.filter((x) => x.status === "anomalous");
  assert.deepEqual(hot.map((x) => x.props.detectors[0]).sort(), ["circle", "on_land"]);
  assert.equal(s1.map.day.on_land_detector, "enabled");
}
// ADS-B and AIS are grouped, never merged.
{
  const groups = groupBySource([s1.map, a2.map, a1.map]);
  assert.deepEqual(groups.map((g) => [g.kind, g.maps.map((m) => m.date)]), [["adsb", ["2026-03-01", "2026-03-02"]], ["ais", ["2026-03-01"]]]);
  assert.equal(groups[0].maps[0].cells.length, 11);
}
// Reading a file: schema prefix and a supported format_version, else a stated refusal; unknown fields ignored.
assert.match(parseMapFile("{", "x").error, /not JSON/);
assert.match(parseMapFile(JSON.stringify({ type: "FeatureCollection", features: [] }), "x").error, /not a Kshana interference map/);
const doc = JSON.parse(demo("ais-custom-2026-03-01.geojson"));
const withM = (patch) => JSON.stringify({ ...doc, kshana_interference_map: { ...doc.kshana_interference_map, ...patch } });
assert.match(parseMapFile(withM({ schema: "other/v1" }), "x").error, /unknown schema/);
// The page gates on format_version: a newer schema label with a supported format_version still reads.
assert.equal(parseMapFile(withM({ schema: "kshana-interference-map/v2" }), "x").error, undefined);
assert.match(parseMapFile(withM({ format_version: 2 }), "x").error, /not a supported Kshana interference map/);
assert.match(parseMapFile(withM({ format_version: undefined }), "x").error, /not a supported Kshana interference map/);
assert.match(parseMapFile(withM({ format_version: "1" }), "x").error, /not a supported Kshana interference map/);
assert.match(parseMapFile(withM({ source_kind: "radar" }), "x").error, /neither adsb nor ais/);
assert.equal(parseMapFile(withM({ a_future_field: { x: 1 } }), "x").error, undefined, "unknown fields are ignored");
// A degraded flag that disagrees with the status is reported; the status is what is drawn.
{
  const bad = JSON.parse(demo("adsb-custom-2026-03-01.geojson")); bad.features[0].properties.degraded = true;
  const r = parseMapFile(JSON.stringify(bad), "bad");
  assert.ok(r.map.warnings.some((w) => /1 cell\(s\) have a "degraded" flag that disagrees/.test(w)));
  assert.equal(r.map.cells[0].degraded, true);
}
// A status that is a prototype property name is an unknown status, treated as unassessed.
{
  const odd = JSON.parse(demo("adsb-custom-2026-03-01.geojson")); const clear = odd.features.filter((f) => f.properties.status === "not_degraded"); clear[0].properties.status = "constructor"; clear[1].properties.status = "__proto__";
  const r = parseMapFile(JSON.stringify(odd), "odd");
  assert.equal(stateOf("constructor"), "unassessed"); assert.equal(stateOf("__proto__"), "unassessed"); assert.equal(typeof stateOf("toString"), "string");
  assert.ok(r.map.warnings.some((w) => /constructor/.test(w)));
  assert.equal(stateCounts(r.map).unassessed, 4 + 2);
}
// A file with no licence text is shown with a warning, not given one.
{
  const r = parseMapFile(withM({ data: { dataset: "custom" } }), "bare.geojson");
  assert.equal(r.map.licence.licence, ""); assert.equal(r.map.licence.attribution, "");
  assert.ok(r.map.warnings.some((w) => /no licence or attribution text/.test(w)));
}
// An unknown status is kept, treated as unassessed (no call), and reported.
{
  const odd = JSON.parse(demo("adsb-custom-2026-03-01.geojson")); odd.features[0].properties.status = "mystery";
  const r = parseMapFile(JSON.stringify(odd), "odd");
  assert.ok(r.map.warnings.some((w) => /mystery/.test(w)));
  assert.equal(stateOf("mystery"), "unassessed");
  assert.equal(statusInfo("adsb", "mystery").tone, "none");
}
// Links only for http(s); the caveats the spec keeps visible are all present.
assert.equal(safeUrl("https://creativecommons.org/publicdomain/zero/1.0/"), "https://creativecommons.org/publicdomain/zero/1.0/");
assert.equal(safeUrl("javascript:alert(1)"), null); assert.equal(safeUrl(""), null); assert.equal(safeUrl("data:text/html,x"), null);
assert.equal(KEEP_CAVEATS.length, 4);
assert.ok(KEEP_CAVEATS[1].includes("not evidence that the area was clear"));
// Cell geometry, tables and descriptions.
{
  const cell = a1.map.cells[0], b = cellBounds(cell);
  assert.ok(Math.abs(b.east - b.west - 0.5) < 1e-9 && Math.abs(b.north - b.south - 0.5) < 1e-9);
  assert.equal(cellAt(a1.map, (b.west + b.east) / 2, (b.north + b.south) / 2), 0);
  assert.match(describeMap(a1.map), /ADS-B map for 2026-03-01: 11 cells drawn.*Cells not drawn were not observed/);
  const t = cellsForTable(a1.map);
  assert.equal(t[0].c.status, "degraded"); assert.equal(t.length, 11);
  assert.deepEqual(licenceBlock({}, undefined), { dataset: "", name: "", licence: "", licenceUrl: "", attribution: "", coverage: [], notice: "" });
  assert.equal(showValue(null), "none"); assert.equal(showValue({ a: 1 }), '{"a":1}');
  assert.ok(STATUSES.adsb.length === 5 && STATUSES.ais.length === 2);
}
// Route exposure: all four shares kept together, licence and attribution per row, caveats shown.
{
  const rep = { kshana_route_exposure: { schema: "kshana-route-exposure/v1", date_range: { from: "2026-03-01", to: "2026-03-02" }, kshana_version: "0.33.1", caveats: ["c1", "c2"], rows: [
    { date: "2026-03-02", source_kind: "adsb", route_km: 120.5, share_degraded: 0, share_not_degraded: 0.5, share_unassessed: 0.25, share_not_observed: 0.25, map_licence: "CC0-1.0", map_attribution: "A" },
    { date: "2026-03-01", source_kind: "ais", route_km: 120.5, share_degraded: 0.1, share_not_degraded: 0.4, share_unassessed: 0, share_not_observed: 0.5, map_licence: "NLOD-2.0", map_attribution: "B" },
    { date: "2026-03-01", source_kind: "bad" }] } };
  const r = parseRouteExposure(JSON.stringify(rep), "route.json");
  assert.equal(r.error, undefined);
  assert.deepEqual(r.report.rows.map((x) => [x.date, x.kind]), [["2026-03-01", "ais"], ["2026-03-02", "adsb"]], "rows by day, sources kept apart");
  assert.equal(r.report.skipped, 1);
  for (const x of r.report.rows) assert.ok(Math.abs(Object.values(x.shares).reduce((a, b) => a + b, 0) - 1) < 1e-9);
  assert.equal(r.report.rows[0].licence, "NLOD-2.0"); assert.equal(r.report.rows[1].attribution, "A");
  assert.deepEqual(r.report.caveats, ["c1", "c2"]);
  assert.equal(pct(0.1234), "12.3%");
  assert.match(parseRouteExposure("{}", "x").error, /not a Kshana route-exposure report/);
  assert.match(parseRouteExposure(JSON.stringify({ kshana_route_exposure: { schema: "kshana-route-exposure/v9", rows: [] } }), "x").error, /is not kshana-route-exposure\/v1/);
}
console.log("interference.test.mjs: ok");
