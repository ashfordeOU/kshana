// SPDX-License-Identifier: AGPL-3.0-only
import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";
import { SCENARIOS, DOMAINS, NOT_IN_BROWSER, groupedLibrary, entryFor, DEFAULT_SCENARIO } from "./catalog.mjs";

const files = readdirSync(new URL("../scenarios/", import.meta.url)).filter((f) => f.endsWith(".toml")).sort();
const listed = SCENARIOS.map((s) => s[0]);
assert.equal(new Set(listed).size, listed.length, "no file listed twice");
assert.deepEqual([...listed].sort(), files, "every bundled scenario is in the library, and nothing else");
for (const s of SCENARIOS) assert.ok(DOMAINS.some((d) => d.id === s[1]), `${s[0]} has a known domain`);
assert.ok(entryFor(DEFAULT_SCENARIO));
// The files the library marks as not runnable in the browser are exactly the ones the
// recorder could not run through the WASM engine.
const idx = JSON.parse(readFileSync(new URL("../recorded/index.json", import.meta.url), "utf8"));
const failed = Object.entries(idx.runs).filter(([, r]) => r.error).map(([f]) => f).sort();
assert.deepEqual(Object.keys(NOT_IN_BROWSER).sort(), failed);
// Search narrows and keeps domain order.
const all = groupedLibrary("");
assert.equal(all.reduce((n, g) => n + g.items.length, 0), files.length);
const j = groupedLibrary("jamm");
assert.ok(j.length >= 1 && j.every((g) => g.items.length));
assert.ok(j.flatMap((g) => g.items).some((e) => e.file === "jamming-demo.toml"));
console.log("catalog.test.mjs: all assertions passed");
