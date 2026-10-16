// SPDX-License-Identifier: AGPL-3.0-only
import { test } from "node:test";
import assert from "node:assert/strict";
import { BINS, MAX_HALF, ENCODED_LENGTH, emptyTable, binOf, snapHalf, elAt, isOpen, encodeTable, decodeTable, tableFromVertices, paint, brush, keyEdit, describe, outlinePoints } from "./skyline-edit.mjs";

test("snapping: 1 degree azimuth bins, 0.5 degree elevations below 90", () => {
  assert.equal(binOf(359.6), 0);
  assert.equal(binOf(-0.4), 0);
  assert.equal(binOf(-1), 359);
  assert.equal(snapHalf(12.26), 25);
  assert.equal(snapHalf(-3), 0);
  assert.equal(snapHalf(95), MAX_HALF);
  assert.equal(elAt(brush(emptyTable(), 10, 12.3), 10), 12.5);
});

test("the table encodes to 480 base64url characters and back, exactly", () => {
  const t = emptyTable();
  for (let k = 0; k < BINS; k++) t[k] = (k * 7) % (MAX_HALF + 1);
  const s = encodeTable(t);
  assert.equal(s.length, ENCODED_LENGTH);
  assert.match(s, /^[A-Za-z0-9_-]+$/);
  assert.deepEqual(decodeTable(s), t);
  assert.equal(encodeTable(emptyTable()), "A".repeat(ENCODED_LENGTH));
});

test("decoding refuses anything that is not exactly a valid table", () => {
  const good = encodeTable(emptyTable());
  assert.equal(decodeTable(good.slice(1)), null);
  assert.equal(decodeTable(good + "A"), null);
  assert.equal(decodeTable(good.slice(0, -1) + "="), null);
  assert.equal(decodeTable(good.slice(0, -1) + "+"), null);
  assert.equal(decodeTable("/".repeat(ENCODED_LENGTH)), null);
  // 0xB4 = 180 half-degrees = 90 degrees: refused.
  const t = emptyTable(); t[5] = 180;
  assert.equal(decodeTable(encodeTable(t)), null);
  assert.equal(decodeTable(null), null);
});

test("vertices to a table: linear between them, wrapping through north", () => {
  const t = tableFromVertices([{ az: 90, el: 10 }, { az: 270, el: 30 }]);
  assert.equal(elAt(t, 90), 10);
  assert.equal(elAt(t, 180), 20);
  assert.equal(elAt(t, 0), 20);
  assert.equal(elAt(t, 315), 25);
  assert.ok(isOpen(tableFromVertices([])));
  assert.equal(elAt(tableFromVertices([{ az: 5, el: 12 }]), 200), 12);
});

test("painting a stroke the short way round, across north", () => {
  const t = paint(emptyTable(), 350, 10, 10, 20);
  assert.equal(elAt(t, 350), 10);
  assert.equal(elAt(t, 0), 15);
  assert.equal(elAt(t, 10), 20);
  assert.equal(elAt(t, 180), 0, "the long way round is untouched");
  assert.equal(t.filter((v) => v > 0).length, 21);
  const dot = paint(emptyTable(), 45, 33.3, 45, 33.3);
  assert.equal(elAt(dot, 45), 33.5);
  assert.equal(dot.filter((v) => v > 0).length, 1);
});

test("keyboard editing at a cursor, with a brush width", () => {
  let r = keyEdit(emptyTable(), 0, "ArrowLeft");
  assert.equal(r.cursor, 359);
  r = keyEdit(r.table, r.cursor, "ArrowRight", true);
  assert.equal(r.cursor, 9);
  r = keyEdit(r.table, r.cursor, "ArrowUp", true, 2);
  assert.equal(elAt(r.table, 9), 5);
  assert.equal(r.table.filter((v) => v > 0).length, 5);
  r = keyEdit(r.table, r.cursor, "ArrowDown");
  assert.equal(elAt(r.table, 9), 4.5);
  r = keyEdit(r.table, r.cursor, "Delete", false, 2);
  assert.ok(isOpen(r.table));
  assert.equal(keyEdit(r.table, 50, "End").cursor, 359);
  assert.equal(keyEdit(r.table, 50, "x"), null);
  assert.equal(elAt(keyEdit(brush(emptyTable(), 3, 89.5), 3, "ArrowUp").table, 3), 89.5, "never reaches 90");
});

test("text alternative and outline", () => {
  assert.match(describe(emptyTable()), /Open horizon/);
  assert.equal(describe(brush(emptyTable(), 100, 20, 1)), "Skyline over 3 of 360 degrees of azimuth; highest 20° at azimuth 99°.");
  assert.equal(outlinePoints(emptyTable()).length, BINS);
});
