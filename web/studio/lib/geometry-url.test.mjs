// SPDX-License-Identifier: AGPL-3.0-only
import { test } from "node:test";
import assert from "node:assert/strict";
import { parseState, buildSearch, normaliseState, DEFAULTS, MAX_QUERY, MC_CHOICES } from "./geometry-url.mjs";
import { emptyTable, encodeTable, brush, ENCODED_LENGTH } from "./skyline-edit.mjs";

test("the bare address is the default state, and the default state is the bare address", () => {
  const { state, notes } = parseState("");
  assert.deepEqual(notes, []);
  assert.deepEqual(state.sys, [...DEFAULTS.sys]);
  assert.equal(buildSearch(state), "");
});

test("the design note's example address reads and writes back unchanged", () => {
  const q = "?site=59.91,10.75,5&t=3600&sys=G,E,C,L:xona-pulsar&mask=5&uere=1.5&sky=p:fjord&mc=2000&seed=36";
  const { state, notes } = parseState(q);
  assert.deepEqual(notes, []);
  assert.equal(state.t, 3600);
  assert.equal(state.leo, "xona-pulsar");
  assert.deepEqual(state.sky, { kind: "preset", name: "fjord" });
  assert.equal(state.mc, 2000);
  // Defaults are left out when written.
  assert.equal(buildSearch(state), "?t=3600&sys=G,E,C,L:xona-pulsar&sky=p:fjord&mc=2000");
});

test("every kind of state round-trips: state -> address -> state is the identity", () => {
  const table = brush(brush(emptyTable(), 90, 35, 20), 270, 12.5, 5);
  const states = [
    { ...DEFAULTS, lat: -33.8568, lon: 151.2153, h: 42.5, t: 604800, sys: ["galileo"], leo: "starlink-sop", mask: 12.5, uere: 0.75, sky: { kind: "table", table }, mc: 0, seed: 2147483647 },
    { ...DEFAULTS, sys: ["galileo"], leo: null, sky: { kind: "canyon", streetAz: 35, widthM: 18, leftM: 24, rightM: 40, antennaM: 1.5 } },
    { ...DEFAULTS, sky: { kind: "preset", name: "container-terminal" } },
  ];
  for (const s of states) {
    const q = buildSearch(s);
    const back = parseState(q);
    assert.deepEqual(back.notes, [], q);
    assert.deepEqual(back.state, s, q);
    assert.equal(buildSearch(back.state), q);
  }
  assert.equal(buildSearch(states[0]).length < MAX_QUERY, true, "a drawn skyline fits the length cap");
});

test("hostile and malformed values are dropped with a notice, never interpreted", () => {
  const cases = [
    "site=1e2,5", "site=91,5", "site=10", "site=10,20,30,40", "site=NaN,1", "site=0x10,1", "site=10,%2B5",
    "t=-1", "t=604801", "t=1.5", "mask=46", "uere=0", "seed=-1", "mc=1234", "mc=1e3",
    "sys=G,G", "sys=X", "sys=L:evil", "sys=L:xona-pulsar,L:iridium-stl", "sys=" + encodeURIComponent("G,<script>"), "sys=L:__proto__",
    "sky=p:../../etc", "sky=p:__proto__", "sky=q:fjord", "sky=t:AAAA", "sky=t:" + "/".repeat(ENCODED_LENGTH),
    "sky=c:1,2,3", "sky=c:400,10,10,10,1", "sky=c:0,0,10,10,1", "sky=" + encodeURIComponent('"><svg onload=alert(1)>'),
  ];
  for (const c of cases) {
    const { state, notes } = parseState("?" + c);
    assert.equal(notes.length, 1, `${c}: ${notes}`);
    const def = parseState("").state;
    assert.deepEqual(state, def, `${c}: the defaults stand`);
  }
});

test("a pasted-elements link opens the presets with a notice", () => {
  const { state, notes } = parseState("?sys=tle");
  assert.equal(state.tle, true);
  assert.deepEqual(state.sys, [...DEFAULTS.sys]);
  assert.match(notes[0], /own orbital elements/);
  assert.equal(buildSearch({ ...DEFAULTS, tle: true }), "?sys=tle");
});

test("unknown keys are ignored, theme is kept, a repeated key keeps its first value, an over-long address is not read", () => {
  const r = parseState("?theme=dark&foo=bar&mask=10&mask=20");
  assert.equal(r.state.mask, 10);
  assert.equal(r.notes.length, 1);
  assert.deepEqual(r.extra, { theme: "dark" });
  assert.equal(buildSearch(r.state, r.extra), "?mask=10&theme=dark");
  assert.deepEqual(parseState("?theme=" + encodeURIComponent("x;y")).extra, {});
  const long = parseState("?mask=10&x=" + "a".repeat(MAX_QUERY));
  assert.equal(long.state.mask, DEFAULTS.mask);
  assert.equal(long.notes.length, 1);
});

test("an empty constellation list is refused with a notice and never written; canonical order is", () => {
  const r = parseState("?sys=");
  assert.deepEqual(r.state.sys, [...DEFAULTS.sys]);
  assert.equal(r.notes.length, 1);
  assert.equal(buildSearch({ ...DEFAULTS, sys: [], leo: null }), "", "no sys= is ever written");
  assert.equal(buildSearch({ ...DEFAULTS, sys: [], leo: "starlink-sop" }), "?sys=L:starlink-sop");
  assert.equal(buildSearch({ ...DEFAULTS, sys: ["beidou", "gps"] }), "?sys=G,C");
  assert.ok(MC_CHOICES.includes(DEFAULTS.mc));
});

test("theme, like every key, keeps its first value", () => {
  assert.deepEqual(parseState("?theme=dark&theme=light").extra, { theme: "dark" });
});

test("normaliseState rounds to what a link can carry and names what it refused", () => {
  const r = normaliseState({ ...DEFAULTS, lat: 12.345678, mask: 80, uere: 2.346 });
  assert.equal(r.state.lat, 12.3457);
  assert.equal(r.state.mask, DEFAULTS.mask);
  assert.equal(r.state.uere, 2.35);
  assert.deepEqual(r.refused, ["mask"]);
  assert.equal(encodeTable(emptyTable()).length, ENCODED_LENGTH);
});

test("each skyline preset names the engine's scenarios under it, and each is in the picker and the scenarios folder", async () => {
  const { SKYLINE_PRESETS, SKYLINE_SCENARIOS } = await import("./geometry-url.mjs");
  const { SCENARIOS } = await import("./catalog.mjs");
  const { existsSync } = await import("node:fs");
  assert.deepEqual(Object.keys(SKYLINE_SCENARIOS).sort(), SKYLINE_PRESETS.slice().sort());
  for (const [preset, files] of Object.entries(SKYLINE_SCENARIOS)) for (const f of files) {
    assert.ok(SCENARIOS.some((s) => s[0] === f), `${preset}: ${f} is in the catalog`);
    assert.ok(existsSync(new URL(`../scenarios/${f}`, import.meta.url)), `${preset}: ${f} is in scenarios/`);
  }
});
