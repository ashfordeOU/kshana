// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the tools hub helpers (tools35.mjs). Run with `node lib/tools35.test.mjs`.
import assert from "node:assert/strict";
import { exampleFileUrl, toBase64, fromBase64, packFilesJson, packProblems, parsePublicKey, verdictView, checkEpoch, benchEntries, scenarioKind, complianceRuns, BENCH_KINDS, FRAMEWORKS, COMPLIANCE_STATUS, complianceView, statusInfo, OSNMA_STATUS, gstParts, gstText, osnmaView, ubxLines } from "./tools35.mjs";

const te = (s) => new TextEncoder().encode(s);
// base64 round trips and matches Node's
for (const b of [[], [0], [255, 0], [1, 2, 3], [250, 251, 252, 253], Array.from({ length: 300 }, (_, i) => i % 256)]) {
  const u = Uint8Array.from(b);
  assert.equal(toBase64(u), Buffer.from(u).toString("base64"));
  assert.deepEqual([...fromBase64(toBase64(u))], b);
}
assert.throws(() => fromBase64("a$bc"), /not base64/); assert.throws(() => fromBase64("abc"), /not base64/);

// pack files: text as strings, binary as base64, the chosen folder's own name dropped
{
  const j = packFilesJson([{ path: "pack/manifest.json", bytes: te('{"a":1}') }, { path: "pack/log-slice.bin", bytes: Uint8Array.from([0xFF, 0xFE, 0, 1]) }, { path: "pack/summary.html", bytes: te("<p>é</p>") }]);
  assert.deepEqual(Object.keys(j).sort(), ["log-slice.bin", "manifest.json", "summary.html"]);
  assert.equal(j["manifest.json"], '{"a":1}');
  assert.deepEqual(j["log-slice.bin"], { base64: "//4AAQ==" });
  assert.equal(j["summary.html"], "<p>é</p>");
  // loose files keep their names; a BOM or other text that would not survive is sent as bytes
  const k = packFilesJson([{ name: "manifest.json", bytes: te("{}") }, { name: "bom.txt", bytes: Uint8Array.from([0xEF, 0xBB, 0xBF, 0x41]) }]);
  assert.equal(k["manifest.json"], "{}"); assert.deepEqual(k["bom.txt"], { base64: "77u/QQ==" });
  assert.throws(() => packFilesJson([{ name: "../x", bytes: te("") }]), /refused file name/);
  assert.throws(() => packFilesJson([{ name: "a", bytes: te("") }, { name: "a", bytes: te("") }]), /two files are named a/);
  assert.deepEqual(packProblems({ "manifest.json": "x" }), ["manifest.sig is not among the chosen files"]);
  assert.deepEqual(packProblems({ "manifest.json": "x", "manifest.sig": "y" }), []);
}
// public key
assert.deepEqual(parsePublicKey(""), { key: "" });
assert.equal(parsePublicKey("  " + "AB".repeat(32) + "\n").key, "ab".repeat(32));
assert.match(parsePublicKey("abc").error, /64 hex digits/); assert.match(parsePublicKey("zz".repeat(32)).error, /64 hex digits/);
// verdicts
assert.equal(verdictView({ verdict: "verified", message: "m" }).tone, "ok");
assert.equal(verdictView({ verdict: "intact-signer-not-pinned" }).tone, "warn");
assert.equal(verdictView({ verdict: "failed", message: "bad" }).text, "bad");
assert.equal(verdictView(null).tone, "bad");
// epoch
assert.deepEqual(checkEpoch(""), { epoch: "" });
assert.equal(checkEpoch("2025-03-01T10:00:00Z").epoch, "2025-03-01T10:00:00Z");
assert.equal(checkEpoch("2024-02-29T00:00:00").epoch, "2024-02-29T00:00:00");
for (const bad of ["2025-02-29T00:00:00", "1999-01-01T00:00:00", "2100-01-01T00:00:00", "2025-13-01T00:00:00", "2025-01-01T24:00:00", "tomorrow", "2025-01-01 10:00:00"]) assert.ok(checkEpoch(bad).error, bad);
// bench
{
  const e = benchEntries({ files: { "motion.csv": "a", nmea: "b", "events.toml": "c" } }, "run1");
  assert.deepEqual(e.map((x) => x.name), ["run1.events.toml", "run1.motion.csv", "run1.nmea"]);
  // the engine writes suffixes with their leading dot
  assert.deepEqual(benchEntries({ files: { ".motion.csv": "a", ".nmea": "b", ".waypoints.txt": "c" } }, "gnss-ins").map((x) => x.name), ["gnss-ins.motion.csv", "gnss-ins.nmea", "gnss-ins.waypoints.txt"]);
  assert.deepEqual(benchEntries(null, "x"), []);
  assert.deepEqual([...BENCH_KINDS], ["gnss-ins", "jamming", "gnss-sim"]);
  assert.equal(scenarioKind('# c\nkind = "gnss-ins"\n[x]'), "gnss-ins"); assert.equal(scenarioKind("name = 'x'"), null);
}
// compliance runs pair results with scenarios by name
{
  const r = complianceRuns([{ name: "a.result.json", text: "{}" }, { name: "a.toml", text: "kind='x'" }, { name: "b.result.json", text: "{}" }, { name: "c.toml", text: "" }]);
  assert.deepEqual(r.runs, [{ label: "a", result: "{}", scenario: "kind='x'" }, { label: "b", result: "{}" }]);
  assert.deepEqual(r.unusedScenarios, ["c"]);
}
// compliance view: rows grouped by framework in the documented order, counted by status; a status or framework it
// does not know is kept and counted as other, never hidden
{
  const rows = [{ id: "A1", framework: "imo-ships", status: "evidenced" }, { id: "B1", framework: "dhs-rpcf", status: "partly-evidenced" }, { id: "B2", framework: "dhs-rpcf", status: "not-evidenced" }, { id: "C1", framework: "future-fw", status: "mystery" }, { id: "D1", framework: "constructor", status: "constructor" }];
  const v = complianceView({ statement: "S", engine_version: "0.35.0", rows, runs: [{ label: "x" }], unrecognised: [] });
  assert.deepEqual(v.frameworks.map((f) => f.id), ["dhs-rpcf", "imo-ships", "future-fw", "constructor"]);
  assert.equal(v.frameworks[0].name, FRAMEWORKS["dhs-rpcf"]); assert.equal(v.frameworks[2].name, "future-fw"); assert.equal(v.frameworks[3].name, "constructor");
  assert.deepEqual(v.frameworks[0].counts, { evidenced: 0, "partly-evidenced": 1, "not-evidenced": 1, "out-of-scope": 0, other: 0 });
  assert.equal(v.frameworks[2].counts.other, 1); assert.equal(v.frameworks[3].counts.other, 1);
  assert.equal(v.statement, "S"); assert.equal(v.rowCount, 5);
  assert.equal(statusInfo("constructor").short, "constructor"); assert.equal(statusInfo("evidenced").short, "Evidenced");
  assert.ok(Object.values(COMPLIANCE_STATUS).every((s) => !/complian|conform|certif|met\b/i.test(s.label)), "no status label claims a framework is met");
  assert.equal(complianceView(null).rowCount, 0);
}
// OSNMA view, from the shape of kshana osnma verify --json
{
  const doc = { advisory: "Advisory: x", input: { path: "a", pages: 12 }, overall: "failed", nma_status: 1, alert: false,
    satellites: [{ sat: "E01", status: "authenticated", tags: { authenticated: 3, failed: 0, pending: 1, discarded: 0 }, last_authenticated_tag_gst: 1000 * 604800 + 345600 }, { sat: "E02", status: "failed", tags: { authenticated: 0, failed: 1, pending: 0, discarded: 0 }, last_authenticated_tag_gst: null }],
    events: [{ kind: "kroot_verified", cid: 1, pkid: 2, count: 1 }, { kind: "bad_crc", count: 4 }],
    tags: [{ prna: 1, prnd: 1, adkd: 0, ctr: 1, tag_gst: 5, data_gst: 5, nmas: 1, status: { state: "authenticated" } }, { prna: 2, prnd: 2, adkd: 0, ctr: 1, tag_gst: 5, data_gst: null, nmas: 1, status: { state: "failed", reason: "tag_mismatch" } }, { prna: 1, prnd: 1, adkd: 4, ctr: 2, tag_gst: 5, data_gst: null, nmas: 1, status: { state: "pending", reason: "awaiting_key" } }],
    pksos: "$PKSOS,F,E01:A,E02:F*00", ubx: { frames: 100, skipped_bytes: 0, inav_pages: 12, ignored_sfrbx: 3, bad_crc: 4, unstamped: 0, time_conflicts: 0 } };
  const v = osnmaView(doc);
  assert.equal(v.overall, "failed"); assert.equal(v.pages, 12); assert.equal(v.tagCount, 3);
  assert.deepEqual(v.totals, { authenticated: 1, failed: 1, pending: 1, discarded: 0 });
  assert.deepEqual(v.sats.map((s) => [s.sat, s.status]), [["E01", "authenticated"], ["E02", "failed"]]);
  assert.deepEqual(v.sats[1].reasons, ["failed: tag_mismatch (1)"]); assert.deepEqual(v.sats[0].reasons, ["pending: awaiting_key (1)"]);
  assert.deepEqual(v.events.map((e) => [e.kind, e.count, e.detail]), [["kroot_verified", 1, "cid 1, pkid 2"], ["bad_crc", 4, ""]]);
  assert.equal(v.advisory, "Advisory: x");
  assert.deepEqual(gstParts(1000 * 604800 + 345600), { week: 1000, tow: 345600 }); assert.equal(gstText(1000 * 604800 + 5), "week 1000, 5 s"); assert.equal(gstText(null), "none");
  assert.deepEqual(ubxLines(v.ubx), ["100 UBX frames; 12 I/NAV pages decoded.", "4 pages failed their CRC.", "3 SFRBX messages were ignored (other systems, E5b, alerts, bad checksums)."]);
  assert.deepEqual(ubxLines(null), []);
  assert.match(osnmaView({}).error, /not the JSON of kshana osnma verify/); assert.match(osnmaView(null).error, /not the JSON/);
  // names from a file that are prototype property names stay names
  const odd = osnmaView({ ...doc, tags: [{ prnd: 1, status: { state: "constructor", reason: "__proto__" } }, { prnd: 1, status: "failed" }] });
  assert.equal(odd.totals.failed, 1); assert.deepEqual(odd.sats[0].reasons, ["constructor: __proto__ (1)"]);
  assert.deepEqual(Object.keys(OSNMA_STATUS), ["authenticated", "failed", "unavailable", "pending", "discarded"]);
}
console.log("tools35.test.mjs: ok");

// Example file names read from an index.json never leave their folder.
{
  assert.equal(exampleFileUrl("evidence", "manifest.json"), "tools/examples/evidence/manifest.json");
  assert.equal(exampleFileUrl("osnma", "expected/pages-good.txt.json"), "tools/examples/osnma/expected/pages-good.txt.json");
  assert.equal(exampleFileUrl("compliance", "a-b_c.result.json"), "tools/examples/compliance/a-b_c.result.json");
  for (const bad of ["../x", "a/../b", "/etc/passwd", "https://evil.example/x", "//evil.example/x", "a/b", "expected/../x", "expected/", "", ".hidden", "x y", "x\n", null, undefined, 5, "a".repeat(120), "expected/expected/x"]) assert.throws(() => exampleFileUrl("osnma", bad), /not an example file name/, String(bad));
  for (const bad of ["__proto__", "constructor", "toString", "elsewhere", undefined]) assert.throws(() => exampleFileUrl(bad, "x.json"), /not an example file name/, String(bad));
}
console.log("tools35.test.mjs: example path checks passed");
