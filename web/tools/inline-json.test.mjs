// SPDX-License-Identifier: AGPL-3.0-only
// Plants the 0.32.0 corruption and checks the guard in web/tools/inline-json.mjs fires; checks
// it stays quiet on clean data; and, when the v0.32.0 tag is reachable, that it fails on that
// release's home page and passes on this tree's. Run with `node web/tools/inline-json.test.mjs`.
import { execFileSync } from "node:child_process";
import { readFileSync, readdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import assert from "node:assert/strict";
import { inlineJsonProblems, dataBlocks } from "./inline-json.mjs";

const WEB = dirname(dirname(fileURLToPath(import.meta.url)));
const REPO = dirname(WEB);
const page = (json, extra = "") => `<html><head><script type="application/ld+json">{"@type":"X","softwareVersion":"0.33.0"}</script></head><body><script type="application/json" id="kpage">${json}</script>${extra}</body></html>`;

// 1. Clean data, including version strings, passes; script blocks that are not data are ignored.
const grid = Array.from({ length: 40 }, (_, i) => `${3000 + i * 10}.0`).join(",");
assert.deepEqual(inlineJsonProblems(page(`{"t":[${grid}],"engine":"0.33.0","ip":"10.0.0.1"}`, "<script>var a = 0.1.2</script>"), "ok.html"), []);
assert.equal(dataBlocks(page("{}")).length, 2);

// 2. The release's own corruption: sed 's/0.31.0/0.32.0/g' over a time grid that runs through 3100.
const clean = `{"t":[${Array.from({ length: 20 }, (_, i) => `${3000 + i * 10}.0`).join(",")}],"v":"0.31.0"}`;
const unescaped = clean.replace(/0.31.0/g, "0.32.0");
assert.notEqual(unescaped, clean.replace(/0\.31\.0/g, "0.32.0"), "the unescaped substitution differs from the escaped one");
const bad = inlineJsonProblems(page(unescaped), "home.html");
assert.ok(bad.some((p) => p.includes("does not parse")), `unparseable data is reported: ${bad}`);
assert.ok(bad.some((p) => p.includes("signature")), `the bump signature is reported: ${bad}`);
assert.deepEqual(inlineJsonProblems(page(clean.replace(/0\.31\.0/g, "0.32.0")), "home.html"), [], "the escaped substitution is clean");
// The next patch release would hit the same trap at 3300 ("0,3300" matches 0.33.0).
const grid2 = Array.from({ length: 20 }, (_, i) => `${3200 + i * 10}.0`).join(",");
const next = `{"t":[${grid2}],"v":"0.33.0"}`.replace(/0.33.0/g, "0.33.1");
assert.ok(inlineJsonProblems(page(next)).length >= 2, "the 0.33.0 -> 0.33.1 bump trap is caught too");
// The signature alone, in data that still happens to parse (a string value).
assert.ok(inlineJsonProblems(page(`{"note":"3090.0.32.0.0.32.0.0.32.0"}`)).some((p) => p.includes("signature")));

// 3. Every page of this tree is clean.
const walk = (d) => readdirSync(join(WEB, d), { withFileTypes: true }).flatMap((e) => (e.isDirectory() ? walk(join(d, e.name)) : [join(d, e.name)]));
const pages = walk(".").filter((f) => f.endsWith(".html") && !/^(pkg|scenarios|studio[\\/]pkg)[\\/]/.test(f));
assert.ok(pages.length > 20, `${pages.length} pages`);
const here = pages.flatMap((f) => inlineJsonProblems(readFileSync(join(WEB, f), "utf8"), f));
assert.deepEqual(here, [], here.join("\n"));

// 4. The shipped v0.32.0 home page fails (skipped where the tag is not in the clone).
let shipped = null;
try {
  shipped = execFileSync("git", ["show", "v0.32.0:web/index.html"], { cwd: REPO, encoding: "utf8", maxBuffer: 1 << 28, stdio: ["ignore", "pipe", "ignore"] });
} catch {
  console.log("inline-json.test.mjs: v0.32.0 is not in this clone, skipped the shipped-page check");
}
if (shipped) {
  const p = inlineJsonProblems(shipped, "v0.32.0:web/index.html");
  assert.ok(p.some((x) => x.includes("kpage") && x.includes("does not parse")), `v0.32.0's kpage fails: ${p}`);
  assert.ok(p.some((x) => x.includes("signature")), `v0.32.0's kpage shows the signature: ${p}`);
}
console.log(`inline-json.test.mjs: all assertions passed (${pages.length} pages clean${shipped ? ", v0.32.0's home page fails as it should" : ""})`);
