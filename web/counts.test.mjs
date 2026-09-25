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
const ledger = JSON.parse(read("./data/verification-matrix.json"));

// matrixCounts: counted from the rows, and equal to the file's own summary block.
const m = matrixCounts(ledger);
assert.equal(m.total, ledger.rows.length, "total is the row count");
assert.equal(m.total, ledger.summary.total);
assert.equal(m.validated, ledger.summary.validated);
assert.equal(m.modelled, ledger.summary.modelled);
assert.equal(m.partner, ledger.summary.partner_owned);
assert.equal(m.validated + m.modelled + m.partner, m.total, "every row has a known status");

// The same pair the READMEs and the page's descriptions state. README.md's headline
// line and badge are pinned to src/verification.rs by
// tests/readme_validation_counts_doc_sync.rs; the ledger file is pinned to it by
// tests/verification_artifacts_doc_sync.rs. This closes the triangle on the site side.
const pair = `${m.validated} of ${m.total}`;
assert.ok(read("../README.md").includes(`<strong>${pair}</strong> capabilities validated`),
  `README.md headline must state ${pair}`);
assert.ok(read("../README.md").includes(`${m.total} rows — ${m.validated} VALIDATED, ${m.modelled} MODELLED, ${m.partner} PARTNER`),
  "README.md matrix line must state the same split");
assert.ok(read("./index.html").includes(`${pair} capabilities validated against external oracles`),
  `web/index.html descriptions must state ${pair}`);

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

// app.js must take the explorer's headline from counts.mjs over the ledger, not
// rebuild a card-only tally of its own (the shape that produced "46 … 17" beside the
// READMEs' "64 of 168").
const app = read("./app.js");
assert.ok(app.includes("explorerTally(matrix, cardCounts)"), "app.js uses explorerTally");
assert.ok(app.includes("buildExplorer(data.capabilities, ledger)"), "app.js passes the ledger in");
assert.ok(!app.includes("backed by an external oracle`"), "no card-only oracle headline left in app.js");

console.log("counts.test.mjs: all assertions passed");
