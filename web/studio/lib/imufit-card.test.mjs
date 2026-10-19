import test from "node:test";
import assert from "node:assert/strict";
import { imuRows } from "./imufit-card.mjs";

test("the report's fit becomes rows with units, and nothing is invented", () => {
  const rows = imuRows({ samples: 6000, dt_s: 0.01, span_s: 59.99, q_va: 8.08e-8, bias: -1.52e-5, bias_instability: 0, q_arw: 8.58e-10, gyro_bias: 7e-6, accel_white_slope: -0.478, gyro_white_slope: -0.51, notes: ["a note"] });
  const m = Object.fromEntries(rows);
  assert.equal(m["Sample rate"], "100.0 Hz");
  assert.match(m["Accelerometer velocity random walk, q_va (m²/s³)"], /^8\.08e-8$/);
  assert.equal(m["Accelerometer Allan slope, early (about -0.5 for white noise)"], "-0.48");
  assert.equal(m["Note 1"], "a note");
});
test("odd input gives no rows", () => {
  assert.deepEqual(imuRows(null), []);
  assert.deepEqual(imuRows([1]), []);
  assert.deepEqual(imuRows({ q_va: "x", notes: "no" }), []);
});
