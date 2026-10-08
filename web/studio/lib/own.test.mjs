// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the own-key lookup (own.mjs). Run with `node lib/own.test.mjs`.
import assert from "node:assert/strict";
import { own } from "./own.mjs";

const table = { a: 1, f: () => 2 };
assert.equal(own(table, "a"), 1);
assert.equal(typeof own(table, "f"), "function");
assert.equal(own(table, "missing"), undefined);
// Names a plain object inherits are not entries.
for (const k of ["constructor", "__proto__", "toString", "hasOwnProperty", "valueOf", "isPrototypeOf"]) assert.equal(own(table, k), undefined, k);
// Only text is a key.
for (const k of [undefined, null, 0, {}, ["a"]]) assert.equal(own(table, k), undefined);
// A table that really has one of those names still answers for it.
assert.equal(own({ constructor: 7 }, "constructor"), 7);
console.log("own.test.mjs: all assertions passed");
