// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: ships and aircraft on the map (0.42 U17). Run: node --test apps/desktop/shell/lib/traffic.test.mjs
// The decode below has the shape of the native `decode_tracks` answer (the kshana.tracks/1
// fields of src/interconnect, checked against the public samples by the desktop crate's
// bridge tests); its values are written for this test.
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { objectKind, parseDecode, trafficOf, trafficAt, pointAt, headingAt, courseDeg, trafficSeries, trafficResult, decodeLines, objectLabel, QUALITY } from "./traffic.mjs";
import { timeModel, hasGeo, readoutAt } from "./timemodel.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const fix = (source, id, t, lat, lon, q, extra = {}) => ({ source, id, t_unix_s: t, lat_deg: lat, lon_deg: lon, quality: {}, reported_quality: q, extra });
const decode = {
  schema: "kshana.tracks/1", source_format: "ais", read: 9, bad_checksum: 1, malformed: 0, other: 1,
  fixes: [
    fix("ais", "244660001", 1700000000, 51.95, 4.05, "good", { sog_kn: 12.3, cog_deg: 90 }),
    fix("ais", "244660001", 1700000060, 51.95, 4.07, "good", { sog_kn: 12.5, cog_deg: 91 }),
    fix("ais", "244660001", 1700000120, 51.95, 4.09, "intermediate", { sog_kn: 12.4, cog_deg: 90 }),
    fix("ais", "244660002", 1700000030, 51.98, 4.10, "degraded", { sog_kn: 0 }),
    fix("ais", "244660002", 1700000900, 51.98, 4.10, "nonsense"),
    fix("ais", "bad", 1700000000, 95, 4, "good"),
  ],
  records: [{ kind: "static", source: "ais", id: "244660001", name: "NORTH STAR@@@", callsign: "PD1234" }],
};

test("sources are vessels, aircraft or vehicles", () => {
  assert.equal(objectKind("ais"), "vessel");
  assert.equal(objectKind("canboat"), "vessel");
  assert.equal(objectKind("adsb"), "aircraft");
  assert.equal(objectKind("asterix-cat048"), "aircraft");
  assert.equal(objectKind("opensky-csv"), "aircraft");
  assert.equal(objectKind("mavlink"), "vehicle");
  assert.equal(objectKind("x"), "object");
});

test("a decode becomes one track per object, named from its static record, with the quality class per point", () => {
  assert.equal(parseDecode("not json"), null);
  assert.equal(parseDecode({}), null);
  const tr = trafficOf(JSON.stringify(decode));
  assert.equal(tr.objects.length, 2, "the fix outside the globe is left out");
  assert.ok(tr.timed);
  assert.equal(tr.epochMs, 1700000000 * 1000);
  const a = tr.objects[0];
  assert.equal(a.name, "NORTH STAR", "padding @ dropped");
  assert.equal(objectLabel(a), "NORTH STAR");
  assert.deepEqual(Array.from(a.t), [0, 60, 120]);
  assert.deepEqual(Array.from(a.q), [0, 0, 1]);
  assert.deepEqual(a.quality, { good: 2, intermediate: 1, degraded: 0, unknown: 0 });
  assert.equal(tr.objects[1].q[1], QUALITY.indexOf("unknown"), "an unknown class is unknown");
  assert.equal(tr.counts.badChecksum, 1);
  assert.equal(objectLabel(tr.objects[1]), "244660002");
});

test("a file without calendar times is drawn in message order", () => {
  const d = { ...decode, fixes: decode.fixes.slice(0, 3).map((f) => { const { t_unix_s: _t, ...rest } = f; return rest; }) };
  const tr = trafficOf(d);
  assert.equal(tr.timed, false);
  assert.ok(Number.isNaN(tr.epochMs));
  assert.deepEqual(Array.from(tr.objects[0].t), [0, 1, 2]);
});

test("at the cursor: who has reported, where, and which reports are old", () => {
  const tr = trafficOf(decode);
  assert.deepEqual(trafficAt(tr, -1), []);
  const at = trafficAt(tr, 100);
  assert.equal(at.length, 2);
  assert.equal(at[0].i, 1);
  assert.equal(at[0].lon, 4.07);
  assert.equal(pointAt(tr.objects[0], 120), 2);
  const late = trafficAt(tr, 800);
  assert.ok(late[1].stale, "the second ship's last report is 770 s old");
  assert.ok(late[0].stale, "the first one's is 680 s old");
  assert.ok(!trafficAt(tr, 130)[0].stale);
});

test("a symbol points along the reported course, else along the track", () => {
  const tr = trafficOf(decode);
  assert.equal(headingAt(tr.objects[0], 2), 90, "the last report's course over ground");
  assert.ok(Math.abs(headingAt(tr.objects[0], 0) - 90) < 0.1, "east along the track");
  assert.ok(Number.isNaN(courseDeg(1, 2, 1, 2)));
  assert.ok(Math.abs(courseDeg(0, 0, 1, 0)) < 1e-9, "north");
});

test("the time cursor model holds the traffic: span, epochs, map, readout and plot series", () => {
  const tr = trafficOf(decode);
  const m = timeModel(trafficResult(tr, { name: "ais.nmea" }), null, null);
  assert.ok(m);
  assert.deepEqual(m.span, [0, 900]);
  assert.deepEqual(Array.from(m.times), [0, 30, 60, 120, 900]);
  assert.equal(m.epochMs, 1700000000 * 1000);
  assert.ok(hasGeo(m));
  const rows = readoutAt(m, 100);
  assert.equal(rows.find((r) => r.k === "reporting").v, "2 / 2");
  assert.match(rows.find((r) => r.k === "quality (reported)").v, /1 good · 0 intermediate · 1 degraded/);
  const s = trafficSeries(tr);
  assert.equal(s.length, 1, "the second ship has one speed only: no line");
  assert.equal(s[0].unit, "kn");
  assert.equal(m.series.length, 1, "speed over ground of each vessel on the plot");
});

test("the code console names the engine's own command for the decode", () => {
  const l = decodeLines({ name: "my tracks.nmea", format: "ais" });
  assert.equal(l.cli[0], "kshana connect decode 'my tracks.nmea' --format ais --to geojson --out 'my tracks'.geojson");
  assert.match(l.py.join("\n"), /no Python binding yet/);
});

test("the shipped sample files are the engine's public samples, synthetic and with their provenance stated", () => {
  const notice = readFileSync(join(here, "../../../../examples/tracks/NOTICE.md"), "utf8");
  for (const f of ["ais.nmea", "adsb.avr", "adsb.beast", "opensky-states.json"]) assert.match(notice, new RegExp(`\`${f.replace(".", "\\.")}\``), f);
  assert.match(notice, /synthetic or a published worked example/);
  const build = readFileSync(join(here, "../../build-frontend.sh"), "utf8");
  assert.match(build, /examples\/tracks/, "the samples are staged with the shell");
});
