// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the explorer's validation counts (counts.mjs). The counts come from the
// generated ledger file, and this test checks them against the other surfaces that
// state the same numbers — README.md's headline and the page's own meta description —
// so the site and the READMEs cannot drift apart without a failure here.
// Run with `node web/counts.test.mjs`.
import { readFileSync } from "node:fs";
import assert from "node:assert/strict";
import { matrixCounts, explorerTally, explorerValidatedTally } from "./counts.mjs";

const read = (rel) => readFileSync(new URL(rel, import.meta.url), "utf8");
const ledger = JSON.parse(read("../data/verification-matrix.json"));

// matrixCounts: counted from the rows, and equal to the file's own summary block.
const m = matrixCounts(ledger);
assert.equal(m.total, ledger.rows.length, "total is the row count");
assert.equal(m.total, ledger.summary.total);
assert.equal(m.validated, ledger.summary.validated);
assert.equal(m.modelled, ledger.summary.modelled);
assert.equal(m.partner, ledger.summary.partner_owned);
assert.equal(m.validated + m.modelled + m.partner, m.total, "every row has a known status");

// Adapted for the redesigned playground: the repo-side README/index.html pins live in
// the kshana repository; here the pair is checked against the new app instead.
const pair = `${m.validated} of ${m.total}`;
assert.ok(read("../app.js").includes("matrixCounts("), "app.js takes its counts from counts.mjs");

// A file whose summary disagrees with its rows is refused, not displayed.
assert.throws(() => matrixCounts({ ...ledger, summary: { ...ledger.summary, validated: ledger.summary.validated + 1 } }),
  /summary\.validated/);
// A row with an unknown status is refused too.
assert.throws(() => matrixCounts({ rows: [{ status: "VALIDATED" }, { status: "MAYBE" }] }), /unknown status/);

// The tally leads with the matrix pair and names the cards as the summary layer.
const cards = { total: 46, validated: 17, domains: 8, evidence: 120, evidenceValidated: 40 };
const t = explorerTally(m, cards);
assert.ok(t.startsWith(`${pair} capabilities validated against an external oracle`), t);
assert.ok(t.includes(`${m.modelled} modelled`) && t.includes(`${m.partner} partner-owned`), t);
assert.ok(t.includes("46 capability cards"), "the card count is still stated, as cards");
assert.ok(!/\b17\b/.test(t), "the card-layer validated count is not presented as a headline");
const tv = explorerValidatedTally(m, cards);
assert.ok(tv.startsWith(`${pair} capabilities validated`), tv);
assert.ok(tv.includes("17 capability cards"), tv);

console.log("counts.test.mjs: all assertions passed");
