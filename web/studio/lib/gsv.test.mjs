// SPDX-License-Identifier: AGPL-3.0-only
import test from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { parseAux, epochAt, unheardSectors, skyCounts } from "./gsv.mjs";
import { maskedPhases, DEMO_PHASES, checksum } from "./trust-geometry-demo.mjs";

const here = new URL("../", import.meta.url).pathname;
const nmea = readFileSync(here + "trust/demo/tallinn-helsinki.nmea", "utf8");
const sent = (b) => `$${b}*${checksum(b)}`;

test("an epoch starts at each GGA and carries that second's GSV, HDT and RMC", () => {
  const text = [
    sent("GPGGA,080000.00,5927.2,N,02446.2,E,1,12,0.9,16.7,M,21.0,M,,"), sent("GPRMC,080000.00,A,5927.2,N,02446.2,E,17.13,16.3,140625,,,A"),
    sent("HEHDT,14.9,T"), sent("GPGSV,1,1,02,03,62,040,50,08,40,095,"), sent("GAGSV,1,1,01,04,49,070,44"),
    sent("GPGGA,080001.00,5927.3,N,02446.2,E,1,12,0.9,16.7,M,21.0,M,,"), sent("HEHDT,15.3,T"),
  ].join("\n");
  const a = parseAux(text);
  assert.equal(a.n, 2);
  assert.deepEqual(a.t, [0, 1]);
  assert.deepEqual(a.hdt, [14.9, 15.3]);
  assert.deepEqual([a.cog[0], a.sog[0]], [16.3, 17.13]);
  assert.deepEqual(a.sky[0], [["gps", 3, 62, 40, 50], ["gps", 8, 40, 95, null], ["galileo", 4, 49, 70, 44]]);
  assert.deepEqual(a.sky[1], []);
});

test("a bad checksum is skipped and counted, never read", () => {
  const good = sent("GPGGA,080000.00,5927.2,N,02446.2,E,1,12,0.9,16.7,M,21.0,M,,");
  const a = parseAux(good + "\n$GPGSV,1,1,01,03,62,040,50*00\n");
  assert.equal(a.skipped, 1);
  assert.deepEqual(a.sky[0], []);
});

test("midnight rollover keeps t increasing", () => {
  const a = parseAux([sent("GPGGA,235959.00,0,N,0,E,1,1,1,1,M,1,M,,"), sent("GPGGA,000000.00,0,N,0,E,1,1,1,1,M,1,M,,")].join("\n"));
  assert.deepEqual(a.t, [0, 1]);
});

test("stepS thins the epochs but keeps the first", () => {
  const a = parseAux(nmea, { stepS: 5 });
  assert.equal(a.t[0], 0);
  assert.ok(a.t.slice(1).every((t) => Math.round(t) % 5 === 0));
  const all = parseAux(nmea);
  assert.equal(a.n, Math.floor(all.t[all.n - 1] / 5) + 1);
});

test("epochAt holds the last epoch at or before t", () => {
  assert.equal(epochAt(7, [0, 5, 10]), 1);
  assert.equal(epochAt(-3, [0, 5, 10]), 0);
  assert.equal(epochAt(99, [0, 5, 10]), 2);
  assert.equal(epochAt(1, []), -1);
});

test("the masked-sky demo's western half has no signal from 600 s, and the sky before is fully heard", () => {
  const a = parseAux(maskedPhases(nmea, DEMO_PHASES), { stepS: 5 });
  const at = (t) => a.sky[epochAt(t, a.t)];
  const before = at(595), after = at(600);
  assert.ok(before.length >= 8 && before.every((s) => s[4] != null), "everything heard before 600 s");
  const west = after.filter((s) => s[3] >= 180), east = after.filter((s) => s[3] < 180);
  assert.ok(west.length >= 3 && west.every((s) => s[4] == null), "the western half is listed and silent from 600 s");
  assert.ok(east.length >= 3 && east.every((s) => s[4] != null));
  assert.equal(skyCounts(after).listed, before.length, "the same satellites are listed");
  const sec = unheardSectors(after);
  assert.ok(sec.length >= 1 && sec.every((s) => s.from >= 150), JSON.stringify(sec));
  assert.deepEqual(unheardSectors(before), []);
});

test("unheardSectors joins neighbouring bins", () => {
  const sats = [["gps", 1, 30, 185, null], ["gps", 2, 30, 215, null], ["gps", 3, 30, 40, 44]];
  assert.deepEqual(unheardSectors(sats), [{ from: 180, to: 240 }]);
});
