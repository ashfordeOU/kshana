// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the field finder (finder.mjs) against the bundled scenario files.
// Run with `node lib/finder.test.mjs`.
import { readFileSync, readdirSync } from "node:fs";
import assert from "node:assert/strict";
import { fieldIndex, findFields, fieldName, scenarioCount, filterControls } from "./finder.mjs";

const dir = new URL("../scenarios/", import.meta.url);
const bundle = Object.fromEntries(readdirSync(dir).filter((f) => f.endsWith(".toml")).map((f) => [f, readFileSync(new URL(f, dir), "utf8")]));
const idx = fieldIndex(bundle);
assert.ok(idx.length > 500, `index has ${idx.length} fields`);

// The founder's words find the engine's keys.
const mask = findFields(idx, "elevation mask", 400);
assert.ok(mask.length >= 20, `elevation mask: ${mask.length} hits`);
assert.ok(mask.some((h) => h.file === "constellation-multi-gnss-coverage.toml" && h.id === "::mask_deg"), "the constellation's mask_deg is found");
assert.equal(mask[0].guided, true, "a guided control ranks first");
assert.ok(scenarioCount(mask) >= 20);
assert.ok(findFields(idx, "PDOP").some((h) => h.key === "pdop_threshold"), "PDOP finds pdop_threshold");
assert.ok(findFields(idx, "jammer power").length > 0, "jammer power");
assert.ok(findFields(idx, "noise figure").some((h) => /noise_figure/.test(h.key)), "noise figure");
assert.deepEqual(findFields(idx, "x"), [], "one letter finds nothing");
assert.deepEqual(findFields(idx, "zzqq nothing"), []);
// Every hit carries a real field of its file.
for (const h of mask) assert.ok(bundle[h.file].includes(h.key), `${h.file} has ${h.key}`);

assert.equal(fieldName("mask_deg"), "Mask (°)");
assert.equal(fieldName("jammer_power_dbw"), "Jammer power (dBW)");
assert.equal(fieldName("pdop_threshold"), "PDOP threshold");
assert.deepEqual(filterControls([{ id: "a", label: "Elevation mask (°)", key: "mask_deg" }, { id: "b", label: "Grid step", key: "grid_step_deg" }], "mask"), ["a"]);
assert.deepEqual(filterControls([{ id: "a", label: "x" }], ""), ["a"]);
console.log(`finder: ${idx.length} fields indexed; "elevation mask" in ${scenarioCount(mask)} scenarios: ok`);
