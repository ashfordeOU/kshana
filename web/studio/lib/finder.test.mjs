// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the field finder (finder.mjs) against the bundled scenario files.
// Run with `node lib/finder.test.mjs`.
import { readFileSync, readdirSync } from "node:fs";
import assert from "node:assert/strict";
import { synonymsFor, fieldIndex, findFields, fieldName, scenarioCount, filterControls } from "./finder.mjs";

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

// The synonym patterns are anchored on every alternative (a code-scanning finding: a pattern that anchored one
// alternative and left the others open). The anchored form must keep every key the old form matched, and the
// bypass shapes (a key that merely ends in or contains the fragment) must not match.
{
  const oldMask = /(^|_)(elev_)?mask(_deg)?$|elevation_mask|elev_mask/;
  const hit = (k) => synonymsFor(k).includes("elevation mask");
  for (const k of ["mask", "mask_deg", "elev_mask", "elev_mask_deg", "gnss_mask_deg", "min_elev_mask", "elevation_mask_deg", "x_elevation_mask", "elev_mask_extra"]) {
    assert.equal(hit(k), true, k);
    assert.equal(oldMask.test(k), true, `${k} matched before`);
  }
  for (const k of ["unmask", "mask_deg_x", "masked", "maskdeg", "nomask_deg", "amask", "", "elevation", "elev"]) {
    assert.equal(hit(k), false, k);
    assert.equal(oldMask.test(k) && !/elevation_mask|elev_mask/.test(k), false, `${k} did not match before`);
  }
  // seconds: a key that ends in _s, or contains duration; "_s" in the middle is not a time
  for (const k of ["t_s", "duration", "step_duration_x", "window_s"]) assert.ok(synonymsFor(k).includes("time"), k);
  for (const k of ["tracks_start", "x_s_y", "s", "dist"]) assert.ok(!synonymsFor(k).includes("time"), k);
}
console.log("finder.test.mjs: anchored synonym checks passed");
