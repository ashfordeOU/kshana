// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: drop anything in (0.42 U9). Run: node --test apps/desktop/shell/lib/detective.test.mjs
// The answers below have the shape of the native detective's (src-tauri/src/detective.rs, whose
// own tests read the repository's sample files with the engine's readers).
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { detectiveRows, scenarioFor, flattenAnswers, linkOf, tomlStr, familyLabel } from "./detective.mjs";

const nmea = { ok: true, format: "nmea", label: "NMEA 0183 receiver log", family: "receiver-log", epochs: 3001, span: { start: "2025-06-14T08:00:00.000Z", end: "2025-06-14T08:50:00.000Z", seconds: 3000 }, interval_s: 1, constellations: ["GPS", "Galileo"], satellites: 18, gaps: [{ from_s: 600, to_s: 660, seconds: 60 }], n_gaps: 1, opens_as: { kind: "receiver-trust", format: "nmea" }, name: "tallinn helsinki.nmea", path: "C:\\logs\\tallinn helsinki.nmea", bytes: 900000, whole: true, read_bytes: 900000 };
const clk = { ok: true, format: "rinex-clk", label: "clock log (rinex-clk)", family: "clock-log", epochs: 288, span: { start: null, end: null, seconds: 86100 }, interval_s: 300, n_gaps: 0, gaps: [], opens_as: { kind: "clock-log", format: "rinex-clk" }, extra: { clock: "G01", clocks_in_file: 31 }, name: "igs.clk", path: "/data/igs.clk", whole: true };
const unknown = { ok: false, format: null, family: null, name: "notes.txt", reason: "the engine does not read this file" };

test("the detective's rows: format, span, epochs, interval, constellations and gaps", () => {
  const rows = detectiveRows(nmea);
  const k = Object.fromEntries(rows.map((r) => [r.k, r.v]));
  assert.equal(k.format, "NMEA 0183 receiver log");
  assert.match(k.span, /^2025-06-14T08:00:00\.000Z → 2025-06-14T08:50:00\.000Z \(50 m/);
  assert.equal(k.epochs, "3,001");
  assert.equal(k.constellations, "GPS, Galileo · 18 satellites");
  assert.match(k.gaps, /^1: 10 m/);
  assert.ok(rows.find((r) => r.k === "gaps").warn);
  const part = detectiveRows({ ...nmea, whole: false, read_bytes: 8 * 1048576, bytes: 40 * 1048576 });
  assert.match(part.at(-1).v, /first 8 MiB of 40 MiB/);
  const iq = detectiveRows({ ok: true, family: "iq", format: "ci16_le", label: "IQ recording", span: { seconds: 2 }, interval_s: 2.5e-7, extra: { samples: 8e6, sample_rate_hz: 4e6, centre_hz: 1575.42e6 } });
  assert.ok(iq.some((r) => r.k === "sample rate" && r.v === "4 MHz"));
  assert.ok(!iq.some((r) => r.k === "gaps"), "an IQ file has no epochs to have gaps");
  assert.equal(familyLabel("orbit"), "precise orbits");
});

test("an unknown file gets a clear message", () => {
  const rows = detectiveRows(unknown);
  assert.equal(rows.length, 1);
  assert.equal(rows[0].warn, true);
  assert.match(rows[0].v, /does not read/);
  assert.equal(scenarioFor(unknown), null);
});

test("a receiver log opens as a receiver-trust run of its own path", () => {
  const s = scenarioFor(nmea);
  assert.match(s.toml, /^kind = "receiver-trust"$/m);
  assert.match(s.toml, /^format = "nmea"$/m);
  assert.ok(s.toml.includes(`path = ${JSON.stringify(nmea.path)}`), "the Windows path is escaped for TOML");
  assert.equal(s.file, "tallinn-helsinki.nmea.toml");
  assert.equal(tomlStr('a"b\\c'), '"a\\"b\\\\c"');
});

test("a clock log opens beside the bundled clock simulation", () => {
  const tpl = readFileSync(new URL("../../../../scenarios/clock-measured-log.toml", import.meta.url), "utf8");
  const s = scenarioFor(clk, { clockTemplate: tpl });
  assert.ok(s.toml.startsWith(tpl.slice(0, tpl.indexOf("[clock_log]"))), "the simulation is the bundled one");
  assert.match(s.toml, /\[clock_log\]\nformat = "rinex-clk"\npath = "\/data\/igs.clk"\ngaps = "longest"\nclock = "G01"\n$/);
  assert.equal((s.toml.match(/\[clock_log\]/g) || []).length, 1);
  assert.equal(scenarioFor(clk), null, "without the template nothing is made up");
  assert.equal(scenarioFor({ ...nmea, opens_as: null }), null, "navigation, orbit and IQ files are data links");
});

test("a dropped folder lists its files, readable first; links keep path, format and size", () => {
  const list = flattenAnswers([unknown, { family: "folder", name: "day1", entries: [unknown, nmea] }]);
  assert.deepEqual(list.map((a) => a.ok), [true, false, false]);
  assert.equal(list[0].folder, "day1");
  const l = linkOf(nmea, new Date(0));
  assert.deepEqual(l, { path: nmea.path, name: nmea.name, format: "nmea", family: "receiver-log", bytes: 900000, added: "1970-01-01T00:00:00.000Z" });
});
