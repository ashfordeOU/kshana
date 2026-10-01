// SPDX-License-Identifier: AGPL-3.0-only
// Tests for first-use abbreviation expansion (abbr.mjs). Run with `node lib/abbr.test.mjs`.
import assert from "node:assert/strict";
import { spellOut } from "./abbr.mjs";

const seen = new Set();
assert.equal(spellOut("Does RAIM meet the limits?", seen), "Does RAIM (receiver autonomous integrity monitoring) meet the limits?");
assert.equal(spellOut("RAIM again", seen), "RAIM again", "only the first use");
assert.equal(spellOut("GNSS (global navigation satellite system) is lost"), "GNSS (global navigation satellite system) is lost", "already expanded");
assert.equal(spellOut("ARAIM and RAIM"), "ARAIM (advanced receiver autonomous integrity monitoring) and RAIM (receiver autonomous integrity monitoring)");
assert.equal(spellOut("csac-sa45s and gps-l1ca"), "csac-sa45s and gps-l1ca", "identifiers are not words");
assert.equal(spellOut("the C/N0 drops"), "the C/N0 (carrier-to-noise density) drops");
assert.equal(spellOut("GNSS integrity (RAIM) availability"), "GNSS (global navigation satellite system) integrity (RAIM, receiver autonomous integrity monitoring) availability");
assert.equal(spellOut("limits (HPL / VPL)?"), "limits (HPL, horizontal protection level / VPL, vertical protection level)?");
console.log("abbr.test.mjs: ok");
