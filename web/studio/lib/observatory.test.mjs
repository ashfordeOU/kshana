import test from "node:test";
import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readDay, readIncidents, readManifest, verifyFiles, dayAlt, dayNotes, cellRows, mapSvg, classifyName, safeHttps, withheld, STATES, NOT_CLEAR, cellKey } from "./observatory.mjs";

// An invented day in the shape the files have (docs/observatory/METHOD.md); every number is made up for the test.
const poly = (s, w, d = 0.5) => ({ type: "Polygon", coordinates: [[[w, s], [w + d, s], [w + d, s + d], [w, s + d], [w, s]]] });
const feat = (i, j, props, s, w) => ({ type: "Feature", properties: { cell_i: i, cell_j: j, ...props }, geometry: poly(s, w) });
function day(over = {}) {
  return {
    type: "FeatureCollection",
    kshana_observatory: {
      schema: "kshana-observatory-day/1", product: "kshana-observatory/adsb/v1", source_kind: "adsb", date: "2026-03-01", states: STATES,
      grid: { type: "fixed_lat_lon", cell_deg: 0.5 }, region: { south: 54, west: 10, north: 56, east: 14 },
      release: { min_delay_hours: 24, not_before_utc: "2026-03-02T00:00:00Z" },
      summary: { cells_published: 4, degraded: 1, not_degraded: 2, not_observed_published: 1, day_wide_effect: false },
      method: { scope: "region: the box's reports only" }, day: {}, data: { dataset: "custom", name: "Synthetic sample", licence: "ODbL-1.0", licence_url: "https://opendatacommons.org/licenses/odbl/1-0/", attribution: "synthetic sample", coverage_notes: "invented" },
      kshana_version: "0.38.0", notice: "A degraded cell means ... No cause is attributed.", ...over,
    },
    features: [
      feat(1, 1, { state: "degraded", aircraft_observed: 12, aircraft_sampled: 10, aircraft_affected: 7, affected_share: 0.7 }, 55, 12),
      feat(1, 2, { state: "not_degraded", aircraft_observed: 20, aircraft_sampled: 18, aircraft_affected: null, affected_share: null }, 55, 12.5),
      feat(1, 3, { state: "not_degraded", aircraft_observed: 9, aircraft_sampled: 8, aircraft_affected: null, affected_share: null }, 55, 13),
      feat(1, 4, { state: "not_observed", reason: "insufficient_sample", aircraft_observed: null, aircraft_sampled: null, aircraft_affected: null, affected_share: null }, 55, 13.5),
    ],
  };
}
const incidents = (over = {}) => ({ schema: "kshana-incident-report/1", product: "p", date: "2026-03-01", cause: "not attributed", day_wide_effect: false, reporting_cycle: "This file is an input to a report, confirm and notify cycle.", incidents: [{ id: "KOBS-2026-03-01-001", state: "degraded", cell_count: 1, bbox: { south: 55, west: 12, north: 55.5, east: 12.5 }, cells: [{ cell_i: 1, cell_j: 1, aircraft_sampled: 10, aircraft_affected: 7, affected_share: 0.7 }] }], ...over });
const J = JSON.stringify;

test("a day is read as written: three states, withheld counts stay withheld, never zero", () => {
  const { day: d, error } = readDay(J(day()));
  assert.equal(error, undefined);
  assert.equal(d.cells.length, 4); assert.equal(d.summaryMatchesCells, true);
  assert.equal(d.cells[1].affected, null);
  assert.equal(withheld(d.cells[1].affected), "withheld");
  const rows = cellRows(d);
  assert.equal(rows[1].affected, "withheld"); assert.equal(rows[1].share, "withheld"); assert.equal(rows[0].share, "70.0 %");
  assert.match(rows[3].why, /too few aircraft/);
  assert.equal(cellRows(d, "degraded").length, 1);
  assert.match(dayAlt(d), /^1 cells degraded, 2 not degraded, 1 not observed, on 2026-03-01\.$/);
});

test("a state outside the three, a non-polygon feature or a foreign schema is refused with a reason", () => {
  const bad = day(); bad.features[0].properties.state = "jammed";
  assert.match(readDay(J(bad)).error, /feature 1 has the state "jammed"/);
  const geo = day(); geo.features[0].geometry = { type: "Point", coordinates: [1, 2] };
  assert.match(readDay(J(geo)).error, /not a cell polygon/);
  assert.match(readDay(J({ type: "FeatureCollection", features: [] })).error, /not a kshana-observatory-day\/1 file/);
  assert.match(readDay("nope").error, /not JSON/);
  assert.match(readDay(J(day({ states: ["degraded", "not_degraded", "not_observed", "jammed"] }))).error, /other than the three/);
});

test("the notes say what the files license: a day-wide day is not clean, a day with no degraded cells says that and no more", () => {
  const dw = readDay(J(day({ summary: { cells_published: 4, degraded: 1, not_degraded: 2, not_observed_published: 1, day_wide_effect: true } }))).day;
  assert.ok(dayNotes(dw, null).some((t) => /no cell could be called that day.*not a statement that the sky was clean/.test(t)));
  const none = day(); none.features = none.features.slice(1); none.kshana_observatory.summary = { cells_published: 3, degraded: 0, not_degraded: 2, not_observed_published: 1, day_wide_effect: false };
  const d0 = readDay(J(none)).day;
  const notes = dayNotes(d0, readIncidents(J(incidents({ incidents: [] }))).incidents);
  assert.deepEqual(notes, ["No degraded cells this day."]);
  assert.ok(!notes.join(" ").match(/interference|jamming|clear/i), "never says no interference");
  const mism = readDay(J(day({ summary: { cells_published: 4, degraded: 3, not_degraded: 0, not_observed_published: 1, day_wide_effect: false } }))).day;
  assert.ok(dayNotes(mism, null).some((t) => /does not match the cells/.test(t)));
});

test("an incident file naming any cause is refused; one that says 'not attributed' is read", () => {
  assert.match(readIncidents(J(incidents({ cause: "hostile jamming" }))).error, /states a cause other than "not attributed"/);
  assert.match(readIncidents(J({ ...incidents(), schema: "x" })).error, /not a kshana-incident-report\/1 file/);
  const { incidents: inc } = readIncidents(J(incidents()));
  assert.equal(inc.cause, "not attributed"); assert.equal(inc.list[0].cells[0].i, 1); assert.equal(inc.list[0].bbox.north, 55.5);
});

test("the manifest's hashes are checked against the files opened, and an unopened file says so", async () => {
  const a = new TextEncoder().encode("one"), b = new TextEncoder().encode("two");
  const dig = (x) => createHash("sha256").update(x).digest("hex");
  const { manifest } = readManifest(J({ schema: "kshana-observatory-manifest/1", date: "2026-03-01", method_id: "kshana-observatory/adsb/v1", files: [{ name: "a.geojson", bytes: 3, sha256: dig(a) }, { name: "b.png", bytes: 3, sha256: dig(a) }, { name: "c.json", bytes: 3, sha256: dig(b) }], input_stats: { rows: 10, used: 5 } }));
  assert.deepEqual(manifest.stats, [["rows", 10], ["used", 5]]);
  const v = await verifyFiles(manifest, new Map([["a.geojson", a], ["b.png", b]]), dig);
  assert.deepEqual(v.map((x) => x.status), ["matches", "does not match", "not opened"]);
});

test("the map draws the three states with a hatch for not observed, a title per cell and no third-party address", () => {
  const d = readDay(J(day())).day;
  const svg = mapSvg(d, { selected: new Set([cellKey(d.cells[0])]) });
  assert.equal((svg.match(/class="ko-c ko-degraded/g) || []).length, 1);
  assert.equal((svg.match(/class="ko-c ko-not_degraded/g) || []).length, 2);
  assert.match(svg, /ko-not_observed[^>]*fill="url\(#ko-hatch\)"/);
  assert.match(svg, /ko-sel/); assert.match(svg, /<title>Not observed \(too few aircraft/);
  assert.ok(!/https?:|href=/.test(svg), "no address in the drawing");
  assert.match(mapSvg({ cells: [], summary: {}, date: "x" }), /No cells in this file/);
});

test("names classify, links must be https, and the legend sentence is exact", () => {
  assert.deepEqual(classifyName("observatory-adsb-adsb-lol-2026-09-15.incidents.json"), { kind: "incidents", date: "2026-09-15" });
  assert.equal(classifyName("observatory-adsb-x-2026-09-15.manifest.json").kind, "manifest");
  assert.equal(classifyName("observatory-adsb-x-2026-09-15.geojson").kind, "day");
  assert.equal(classifyName("x-2026-09-15.PNG").kind, "png");
  assert.equal(safeHttps("javascript:alert(1)"), null); assert.equal(safeHttps("http://x.invalid/"), null); assert.ok(safeHttps("https://opendatacommons.org/licenses/odbl/1-0/"));
  assert.equal(NOT_CLEAR, "Not observed is not clear.");
});
