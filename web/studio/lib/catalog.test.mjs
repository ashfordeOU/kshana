// SPDX-License-Identifier: AGPL-3.0-only
import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";
import { SCENARIOS, DOMAINS, NOT_IN_BROWSER, RECORDED_NATIVELY, groupedLibrary, searchScenarios, entryFor, DEFAULT_SCENARIO, registerGroup, dirOf } from "./catalog.mjs";

const files = readdirSync(new URL("../scenarios/", import.meta.url)).filter((f) => f.endsWith(".toml")).sort();
const listed = SCENARIOS.map((s) => s[0]);
assert.equal(new Set(listed).size, listed.length, "no file listed twice");
assert.deepEqual([...listed].sort(), files, "every bundled scenario is in the library, and nothing else");
for (const s of SCENARIOS) assert.ok(DOMAINS.some((d) => d.id === s[1]), `${s[0]} has a known domain`);
assert.ok(entryFor(DEFAULT_SCENARIO));
// The files the library marks as not runnable in the browser are exactly the ones the
// recorder could not run through the WASM engine.
const idx = JSON.parse(readFileSync(new URL("../recorded/index.json", import.meta.url), "utf8"));
const failed = Object.entries(idx.runs).filter(([, r]) => r.error || r.source === "native").map(([f]) => f).sort();
assert.deepEqual(Object.keys(NOT_IN_BROWSER).sort(), failed);
// Those shown as a run recorded by the native engine are exactly the ones recorded that way.
assert.deepEqual([...RECORDED_NATIVELY].sort(), Object.entries(idx.runs).filter(([, r]) => r.source === "native").map(([f]) => f).sort());
// Search narrows and keeps domain order.
const all = groupedLibrary("");
assert.equal(all.reduce((n, g) => n + g.items.length, 0), files.length);
const j = groupedLibrary("jamm");
assert.ok(j.length >= 1 && j.every((g) => g.items.length));
assert.ok(j.flatMap((g) => g.items).some((e) => e.file === "jamming-demo.toml"));
// Ranked search: the same entries as the grouped filter, title and domain matches first.
const orbit = searchScenarios("orbit");
assert.equal(orbit.length, groupedLibrary("orbit").reduce((n, g) => n + g.items.length, 0), "ranking keeps every match");
const firstNonTitle = orbit.findIndex((e) => !e.title.toLowerCase().includes("orbit"));
assert.ok(firstNonTitle > 0 && orbit.slice(firstNonTitle).every((e) => !e.title.toLowerCase().includes("orbit")), "every title match ranks above every other match");
assert.ok(!/jamm/i.test(orbit[0].title), "a jamming scenario is not the first hit for orbit");
assert.deepEqual(searchScenarios("  "), []);
// An optional group adds its own domain and entries, and says which folder they live in.
const before = SCENARIOS.length;
assert.equal(registerGroup({ dir: "extra/", domain: { id: "extra", label: "Extra" }, scenarios: [["extra-one.toml", "One", "A question?"], ["jamming-demo.toml", "dup", "ignored"]] }), 1);
assert.equal(SCENARIOS.length, before + 1);
assert.equal(dirOf("extra-one.toml"), "extra/");
assert.equal(dirOf("jamming-demo.toml"), "");
assert.equal(entryFor("extra-one.toml").domain, "extra");
assert.equal(registerGroup(null), 0);
console.log("catalog.test.mjs: all assertions passed");
