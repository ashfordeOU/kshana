// SPDX-License-Identifier: AGPL-3.0-only
import assert from "node:assert/strict";
import { readFileSync, readdirSync } from "node:fs";
import { numericFields, stepValue, formatValue, patchField, isLogScale } from "./params.mjs";

const toml = `seed = 42 # the draw
threshold_ns = 20.0
name = "x"

[time]
step_s = 10.0
duration_s = 7200.0

[clock_quantum]
y0   = 5.0e-17
q_rw = 0.0

[[sats]]
prn = 1
[[sats]]
prn = 2
`;
const f = numericFields(toml);
const ids = f.map((x) => x.id);
assert.deepEqual(ids, ["::seed", "::threshold_ns", "time::step_s", "time::duration_s", "clock_quantum::y0", "clock_quantum::q_rw", "sats[0]::prn", "sats[1]::prn"], "strings are excluded; [[...]] keys carry their table's position");
// An array-of-tables field is rewritten on its own line, and only there.
const prn2 = f.find((x) => x.id === "sats[1]::prn");
assert.equal(prn2.aot, true);
assert.ok(patchField(toml, prn2, 9).endsWith("[[sats]]\nprn = 1\n[[sats]]\nprn = 9\n"));
// A sub-table of an array element, and a nested array of tables, are addressed through it.
const nest = `[[c]]\nname = "a"\n[c.orbit]\nalt = 500.0\n[[c.shell]]\nn = 8\n[[c]]\n[c.orbit]\nalt = 700.0\n[[c.shell]]\nn = 6\n[later]\nalt = 1.0\n`;
assert.deepEqual(numericFields(nest).map((x) => x.id), ["c[0].orbit::alt", "c.shell[0]::n", "c[1].orbit::alt", "c.shell[1]::n", "later::alt"]);
assert.ok(patchField(nest, numericFields(nest)[2], 800).includes("[[c]]\n[c.orbit]\nalt = 800.0\n"));
const seed = f[0];
assert.equal(seed.integer, true);
assert.equal(seed.comment, "the draw");
// Patch keeps the inline comment and only touches that line.
const p = patchField(toml, seed, 7);
assert.ok(p.startsWith("seed = 7 # the draw\n"), p.split("\n")[0]);
assert.equal(p.split("\n").slice(1).join("\n"), toml.split("\n").slice(1).join("\n"));
// Sectioned float stays a float.
const step = f.find((x) => x.key === "step_s");
assert.equal(formatValue(step, 12), "12.0");
assert.ok(patchField(toml, step, 12).includes("step_s = 12.0"));
// Log-scale stepping for tiny magnitudes.
const y0 = f.find((x) => x.key === "y0");
assert.ok(isLogScale(y0));
assert.equal(stepValue(y0, 1), 5.0e-16);
assert.equal(formatValue(y0, 5e-16), "5e-16");
// Linear stepping.
assert.equal(stepValue(step, 1), 11);
assert.equal(stepValue(seed, -1), 41);
// A key duplicated in the helpers' view is not offered.
const dup = `[a]\nx = 1\n[[b]]\nx = 2\n`;
assert.deepEqual(numericFields(dup).map((x) => x.id), ["a::x", "b[0]::x"], "the array-of-tables key has its own address");
const dup2 = `[a]\nx = 1\n[a]\nx = 2\n`;
assert.deepEqual(numericFields(dup2).map((x) => x.id), [], "a (section, key) that appears twice is not offered");
// Every bundled scenario parses, and patching each field with its own value is a no-op
// on the numbers (round trip through parseFloat).
const dir = new URL("../scenarios/", import.meta.url);
for (const file of readdirSync(dir)) {
  const t = readFileSync(new URL(file, dir), "utf8");
  for (const fld of numericFields(t)) {
    const again = numericFields(patchField(t, fld, fld.value)).find((x) => x.id === fld.id);
    assert.ok(again && again.value === fld.value, `${file} ${fld.id}`);
  }
}
console.log("params.test.mjs: all assertions passed");
