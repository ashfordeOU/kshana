import test from "node:test";
import assert from "node:assert/strict";
import { evidenceOf, badgeModel, renderBadge, csvHeader, withEvidenceCsv, countText, EVIDENCE_KEY } from "./evidence.mjs";

// a document with just enough DOM for the badge
class El { constructor(t) { this.tag = t; this.className = ""; this.children = []; this.attrs = {}; this.textContent = ""; } append(...k) { this.children.push(...k); } setAttribute(k, v) { this.attrs[k] = v; } }
const doc = { createElement: (t) => new El(t) };
const all = (e, out = []) => { out.push(e); for (const c of e.children) if (c instanceof El) all(c, out); return out; };
const text = (e) => all(e).map((x) => x.textContent + x.children.filter((c) => typeof c === "string").join("")).join(" ");

const RUN = { kind: "clock", evidence: { tier: "MODELLED", matrix: "docs/VERIFICATION-MATRIX.md", id_rule: "VM- plus eight hex digits", rows: [
  { id: "VM-aaaa0001", requirement: "Clock holdover", status: "MODELLED" }, { id: "VM-bbbb0002", requirement: "Allan estimator parity", status: "VALIDATED" } ] }, figure_tiers: { figures: [] } };

test("the label is read from result.evidence", () => {
  const e = evidenceOf(RUN);
  assert.equal(e.tier, "MODELLED"); assert.equal(e.rows.length, 2); assert.equal(e.rows[1].id, "VM-bbbb0002");
  assert.equal(EVIDENCE_KEY, "evidence");
});

test("missing key: an older recorded run shows nothing and raises nothing", () => {
  for (const r of [{ kind: "clock" }, {}, null, undefined, "x", { evidence: null }, { evidence: 3 }, { evidence: { tier: "WHATEVER", rows: [] } }, { evidence: { rows: [] } }]) {
    assert.equal(evidenceOf(r), null);
    assert.equal(badgeModel(r), null);
    assert.equal(renderBadge(doc, r), null);
    assert.equal(csvHeader(evidenceOf(r)), "");
  }
  assert.equal(withEvidenceCsv("t_s,v\n0,1\n", { kind: "clock" }), "t_s,v\n0,1\n", "the CSV of an older run is returned untouched");
  assert.equal(withEvidenceCsv(null, RUN), null);
});

test("the badge says the tier and the number of ledger rows, singular and plural", () => {
  assert.equal(countText(1), "1 ledger row"); assert.equal(countText(0), "0 ledger rows"); assert.equal(countText(5), "5 ledger rows");
  const m = badgeModel(RUN);
  assert.deepEqual([m.tier, m.cls, m.countText], ["MODELLED", "modelled", "2 ledger rows"]);
  const one = badgeModel({ evidence: { tier: "VALIDATED", matrix: "m", id_rule: "r", rows: [{ id: "VM-1", requirement: "x", status: "VALIDATED" }] } });
  assert.equal(one.countText, "1 ledger row"); assert.equal(one.cls, "validated");
  assert.equal(badgeModel({ evidence: { tier: "partner", rows: [] } }).cls, "partner", "the tier is read case-insensitively");
});

test("the badge element lists the rows (id, requirement, status) for hover, focus and tap", () => {
  const el = renderBadge(doc, RUN);
  assert.match(el.className, /\bevb\b/); assert.match(el.className, /evb-modelled/);
  assert.equal(el.attrs.tabindex, "0", "focusable, so the rows open from the keyboard");
  assert.match(el.attrs["aria-label"], /MODELLED, 2 ledger rows/);
  const t = text(el);
  assert.ok(t.includes("MODELLED") && t.includes("2 ledger rows"));
  for (const s of ["VM-aaaa0001", "Clock holdover", "VM-bbbb0002", "Allan estimator parity", "VALIDATED", "docs/VERIFICATION-MATRIX.md"]) assert.ok(t.includes(s), s);
  assert.equal(all(el).filter((x) => x.tag === "li").length, 2);
  assert.ok(all(el).some((x) => x.className.includes("evb-pop") && x.attrs.role === "tooltip"));
});

test("the CSV comment lines are the engine's, byte for byte", () => {
  const h = csvHeader(evidenceOf(RUN));
  assert.equal(h, "# evidence: MODELLED rows VM-aaaa0001;VM-bbbb0002\n# evidence-matrix: docs/VERIFICATION-MATRIX.md (VM- plus eight hex digits)\n");
});

test("a CSV that lacks the lines gets them; one that has them is not changed; the table still parses", () => {
  const body = "t_s,value\n0,1\n1,2\n";
  const out = withEvidenceCsv(body, RUN);
  assert.ok(out.startsWith("# evidence: MODELLED rows VM-aaaa0001;VM-bbbb0002\n# evidence-matrix:"));
  assert.equal(withEvidenceCsv(out, RUN), out, "idempotent: the engine's own CSV already carries them");
  assert.equal(out.split("\n").filter((l) => !l.startsWith("#")).join("\n"), body, "read with comment='#' the table is unchanged");
});

// The page readers keep the label on their models; a recording from an older engine has none and the model has none.
import { readFileSync } from "node:fs";
import { readSsv } from "./ssv.mjs";
import { readLi } from "./lunar-infra.mjs";
import { readOptical } from "./optical.mjs";
import { readHoldover } from "./holdover.mjs";
import { readReport } from "./lunar-station.mjs";
const rec = (f) => JSON.parse(readFileSync(new URL(`../recorded/${f}.json`, import.meta.url), "utf8"));
const withEv = (r) => { const j = JSON.parse(r.json); j.evidence = RUN.evidence; return { ...r, json: JSON.stringify(j) }; };
const READERS = [["gnss-ssv-heo", readSsv, (x) => x.model], ["lunar-infrastructure-od-consistency", readLi, (x) => x.model], ["optical-atmosphere-network", readOptical, (x) => x.model],
  ["holdover-test-example", readHoldover, (x) => x.model], ["lunar-station-coverage", readReport, (x) => x.report ? x : x]];

test("each page's reader passes the label to its model, and shows nothing for a recording without one", () => {
  for (const [file, read, pick] of READERS) {
    const old = rec(file);
    const a = read(old);
    assert.ok(!a.error, `${file}: ${a.error}`);
    assert.equal(badgeModel(pick(a)), null, `${file}: an older recording has no badge`);
    const b = read(withEv(old));
    assert.ok(!b.error, `${file}: ${b.error}`);
    const bm = badgeModel(pick(b));
    assert.ok(bm && bm.tier === "MODELLED" && bm.count === 2, `${file}: the label reaches the model`);
  }
});
