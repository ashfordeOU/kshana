// SPDX-License-Identifier: Apache-2.0
// Tests for the guided-mode knob helpers — sectioned TOML scalar read/patch and
// the knob auto-selection that adapts the slider panel to a scenario. Pure logic;
// the DOM panel is verified in the browser. Run with `node web/guided.test.mjs`.
import {
  GUIDED_KNOBS,
  readSectionScalar,
  patchSectionScalar,
  knobsForToml,
} from "./guided.mjs";
import assert from "node:assert/strict";

// readSectionScalar: read a `key = value` line inside a named [section], stopping
// at the next section header. Oracle: TOML-spec round-trip on a fixed string.
{
  const toml = "[time]\nstep_s = 10.0\nduration_s = 7200.0\n";
  assert.equal(readSectionScalar(toml, "time", "step_s"), "10.0", "reads step_s in [time]");
  assert.equal(readSectionScalar(toml, "time", "duration_s"), "7200.0", "reads duration_s");
  assert.equal(readSectionScalar(toml, "time", "absent"), null, "absent key -> null");
  assert.equal(readSectionScalar(toml, "nope", "step_s"), null, "absent section -> null");
}

// readSectionScalar: does not bleed across the next section header.
{
  const toml = "[a]\nx = 1\n[b]\nx = 2\n";
  assert.equal(readSectionScalar(toml, "a", "x"), "1", "reads [a].x");
  assert.equal(readSectionScalar(toml, "b", "x"), "2", "reads [b].x, not [a].x");
}

// readSectionScalar: trims an inline comment, like readScalar does for top-level.
{
  const toml = "[time]\nstep_s = 30.0  # seconds\n";
  assert.equal(readSectionScalar(toml, "time", "step_s"), "30.0", "trims inline comment");
}

// patchSectionScalar: replace the value, preserving the header and sibling keys.
// Oracle: string-equality on the hand-written expected output.
{
  const toml = "[time]\nstep_s = 10.0\nduration_s = 7200.0\n";
  const out = patchSectionScalar(toml, "time", "step_s", 30);
  assert.equal(out, "[time]\nstep_s = 30\nduration_s = 7200.0\n", "step_s patched, sibling untouched");
  // Re-read confirms the round-trip.
  assert.equal(readSectionScalar(out, "time", "step_s"), "30", "re-read patched value");
  assert.equal(readSectionScalar(out, "time", "duration_s"), "7200.0", "duration_s preserved");
}

// patchSectionScalar: only the first occurrence inside the named section.
{
  const toml = "[a]\nx = 1\n[b]\nx = 2\n";
  assert.equal(patchSectionScalar(toml, "b", "x", 9), "[a]\nx = 1\n[b]\nx = 9\n", "patches [b].x only");
  assert.equal(patchSectionScalar(toml, "a", "x", 9), "[a]\nx = 9\n[b]\nx = 2\n", "patches [a].x only");
}

// patchSectionScalar: absent key (or section) returns the input unchanged.
{
  const toml = "[time]\nstep_s = 10.0\n";
  assert.equal(patchSectionScalar(toml, "time", "absent", 5), toml, "absent key -> unchanged");
  assert.equal(patchSectionScalar(toml, "nope", "step_s", 5), toml, "absent section -> unchanged");
}

// knobsForToml: a clock scenario surfaces seed, threshold_ns, step_s, duration_s
// (membership oracle), capped at 6.
{
  const clock = `seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 7200.0
[clock_quantum]
y0 = 5.0e-17
[clock_classical]
y0 = 5.0e-10
`;
  const ks = knobsForToml(clock);
  const keys = ks.map((k) => k.key);
  assert.ok(keys.includes("seed"), "clock surfaces seed");
  assert.ok(keys.includes("threshold_ns"), "clock surfaces threshold_ns");
  assert.ok(keys.includes("step_s"), "clock surfaces [time].step_s");
  assert.ok(keys.includes("duration_s"), "clock surfaces [time].duration_s");
  assert.ok(ks.length <= 6, "caps at 6 knobs");
  // Sectioned knobs carry the right section; top-level ones carry "".
  assert.equal(ks.find((k) => k.key === "step_s").section, "time", "step_s is in [time]");
  assert.equal(ks.find((k) => k.key === "seed").section, "", "seed is top-level");
}

// knobsForToml: an orbit scenario surfaces the elevation mask (mask_deg) instead
// of clock y0 (membership oracle).
{
  const orbit = `kind = "orbit"
seed = 17
threshold_ns = 10.0
mask_deg = 5.0
[time]
step_s = 120.0
duration_s = 43200.0
[user]
altitude_km = 500.0
`;
  const keys = knobsForToml(orbit).map((k) => k.key);
  assert.ok(keys.includes("mask_deg"), "orbit surfaces mask_deg");
  assert.ok(keys.includes("seed"), "orbit still surfaces seed");
  assert.ok(keys.includes("step_s"), "orbit surfaces [time].step_s");
  assert.ok(!keys.includes("y0"), "orbit does not surface clock y0");
}

// GUIDED_KNOBS is a well-formed catalogue: every entry has key/label/parse/section.
{
  assert.ok(Array.isArray(GUIDED_KNOBS) && GUIDED_KNOBS.length >= 6, "at least 6 candidate knobs");
  for (const k of GUIDED_KNOBS) {
    assert.equal(typeof k.key, "string", "key is a string");
    assert.equal(typeof k.label, "string", "label is a string");
    assert.equal(typeof k.parse, "function", "parse is a function");
    assert.ok("section" in k, "carries a section (string, possibly empty)");
  }
}

// knobsForToml: the ephemeris / ground-track scenario carries its step/duration at
// the top level (not in a [time] section) plus a [station] — so it must still earn
// guided knobs (which also feed the parameter sweep). A regression here is what
// made the Sweep tab and guided sliders inert for the ground track.
{
  const ephemeris = `kind = "ephemeris"
tle = """
1 25544U 98067A   20045.18587073  .00000950  00000-0  25302-4 0  9990
2 25544  51.6443 242.0161 0004885 264.6060 207.3845 15.49165514212791
"""
step_s = 30.0
duration_s = 16740.0
dut1_s = 0.0
xp_arcsec = 0.0
yp_arcsec = 0.0
[station]
lat_deg = 49.8707
lon_deg = 8.6217
alt_m = 144.0
`;
  const knobs = knobsForToml(ephemeris);
  const keys = knobs.map((k) => `${k.section}::${k.key}`);
  assert.ok(knobs.length > 0, "ephemeris earns at least one guided knob (Sweep is not inert)");
  assert.ok(keys.includes("::step_s"), "top-level step_s is a knob");
  assert.ok(keys.includes("::duration_s"), "top-level duration_s is a knob");
  assert.ok(keys.includes("station::lat_deg"), "station latitude is a knob");
  assert.ok(keys.includes("station::lon_deg"), "station longitude is a knob");
  assert.ok(knobs.length <= 6, "still capped at 6 knobs");
}

console.log("guided.test.mjs: all assertions passed");
