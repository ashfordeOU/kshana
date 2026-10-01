// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the plain-meaning sentences and answer cards (meaning.mjs) on recorded runs.
// Run with `node lib/meaning.test.mjs`.
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { plainMeaning, plainDuration, signalName, genericCards } from "./meaning.mjs";
import { kpis } from "./kpi.mjs";
import { fmt } from "./views.mjs";
import { SCENARIOS, NOT_IN_BROWSER, registerGroup } from "./catalog.mjs";

const idx = JSON.parse(readFileSync(new URL("../recorded/index.json", import.meta.url), "utf8"));
const rec = (name) => { const d = JSON.parse(readFileSync(new URL(`../recorded/${name}.json`, import.meta.url), "utf8")); return { r: JSON.parse(d.json), toml: d.toml }; };

// Durations in words.
assert.equal(plainDuration(45), "45 s");
assert.equal(plainDuration(600), "10 min");
assert.equal(plainDuration(6600), "1 h 50 min");
assert.equal(plainDuration(43200), "12 h");
assert.equal(signalName("gps-l1ca"), "GPS L1CA");
assert.equal(signalName("galileo-e1"), "Galileo E1");

// RAIM: the share and the counts are the result's own samples.
{
  const { r, toml } = rec("integrity-raim");
  const m = plainMeaning(r, toml);
  assert.equal(m.kind, "integrity");
  const share = (100 * r.samples_available) / r.samples_total;
  assert.ok(m.big.includes(`${share.toFixed(1)} %`), m.big);
  assert.ok(m.line.includes(`${r.samples_available} of ${r.samples_total}`), m.line);
  assert.ok(m.line.includes(`${fmt(r.al_h_m)} m horizontal`));
  const misleading = r.stanford.points.filter((p) => /misleading/i.test(p.region)).length;
  assert.equal(m.cards.find((c) => c.label === "Misleading fixes").value, String(misleading));
  assert.ok(!m.cards.some((c) => /alert limit/i.test(c.label)), "no card only echoes an input");
}
// Coverage: every figure is a field of the global block.
{
  const { r, toml } = rec("constellation-multi-gnss-coverage");
  const m = plainMeaning(r, toml);
  assert.ok(m.big.includes(String(r.global.min_visible)) && m.big.includes(fmt(r.global.mean_visible, 2)), m.big);
  for (const n of r.constellations.map((c) => c.name)) assert.ok(m.line.includes(n), n);
}
// Spectrum: the signals lost are the bands whose lowest C/N0 is under the tracking threshold.
{
  const { r, toml } = rec("l-band-waterfall-jamming");
  const m = plainMeaning(r, toml);
  const thr = r.receiver.tracking_threshold_dbhz;
  const lost = r.timeline.bands.filter((b) => b.min_cn0_dbhz < thr).length;
  assert.ok(m.big.includes(`${lost} of ${r.timeline.bands.length}`), m.big);
}
// Clock holdover: both holdovers, in words, against the scenario's threshold.
{
  const { r, toml } = rec("clock-holdover");
  const m = plainMeaning(r, toml);
  assert.ok(m.big.includes(plainDuration(r.quantum.fom.holdover_s)) && m.big.includes(plainDuration(r.classical.fom.holdover_s)), m.big);
  assert.ok(m.big.includes(`${fmt(r.threshold_ns)} ns`));
}
// Every recorded run gets a sentence; a kind without a template states its first figure, read
// from the headline strip, and its cards are that strip's own values.
{
  let n = 0;
  for (const [f, e] of Object.entries(idx.runs)) {
    if (e.error) continue;
    const d = JSON.parse(readFileSync(new URL(`../recorded/${e.file}`, import.meta.url), "utf8"));
    const r = JSON.parse(d.json);
    const m = plainMeaning(r, d.toml);
    assert.ok(m && typeof m.big === "string" && m.big.length > 8, `${f} has a sentence`);
    assert.ok(m.cards.length <= 4, `${f}: at most 4 cards`);
    if (m.generic) assert.deepEqual(m.cards, genericCards(kpis(r, d.toml, 6)), `${f}: generic cards come from the strip`);
    n++;
  }
  assert.ok(n >= 130, `${n} runs`);
}
// Every scenario of the catalogue (the optional group too) gets a sentence from its recorded
// result, with no "undefined", "NaN", empty placeholder or raw object in it; only a file the
// browser cannot run and that has no recording (a command-line study suite) says why instead.
{
  const read = (f) => JSON.parse(readFileSync(new URL(`../${f}`, import.meta.url), "utf8"));
  for (const g of read("groups.json").groups) registerGroup({ ...read(g + "index.json"), dir: g });
  const recs = {};
  for (const dir of ["", ...read("groups.json").groups]) for (const [f, e] of Object.entries(read(dir + "recorded/index.json").runs)) if (!e.error) recs[f] = dir + "recorded/" + e.file;
  const BAD = /undefined|NaN|\bnull\b|\[object|\{|\}|—|\(\s*\)|\s[,.;]|^\s*$/;
  let sentences = 0, templated = 0, explained = 0;
  for (const [f] of SCENARIOS) {
    if (!recs[f]) { assert.ok(NOT_IN_BROWSER[f], `${f}: no recording and no reason`); explained++; continue; }
    const d = read(recs[f]);
    const m = plainMeaning(JSON.parse(d.json), d.toml);
    assert.ok(m && m.big && !BAD.test(m.big), `${f}: bad sentence "${m && m.big}"`);
    assert.ok(!m.line || !BAD.test(m.line), `${f}: bad line "${m.line}"`);
    for (const c of m.cards) assert.ok(!/undefined|NaN/.test(`${c.label} ${c.value} ${c.unit} ${c.sub}`), `${f}: bad card ${JSON.stringify(c)}`);
    sentences++;
    if (!m.generic) templated++;
  }
  assert.equal(sentences + explained, SCENARIOS.length);
  assert.ok(SCENARIOS.length >= 139, `${SCENARIOS.length} scenarios`);
  assert.equal(templated, sentences, "every recorded scenario has a kind template");
}
console.log("meaning.test.mjs: ok");
