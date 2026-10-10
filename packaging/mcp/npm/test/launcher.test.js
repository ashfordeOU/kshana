// SPDX-License-Identifier: AGPL-3.0-only
"use strict";
const test = require("node:test");
const assert = require("node:assert");
const fs = require("node:fs");
const http = require("node:http");
const os = require("node:os");
const path = require("node:path");
const { spawnSync } = require("node:child_process");
const L = require("../lib/launcher.js");

test("assetFor maps platforms to the release asset names", () => {
  assert.strictEqual(L.assetFor("linux", "x64", "0.35.0"), "kshana-mcp");
  assert.strictEqual(L.assetFor("linux", "arm64", "0.35.0"), "kshana-mcp-aarch64-unknown-linux-gnu");
  assert.strictEqual(L.assetFor("darwin", "arm64", "0.35.0"), "kshana-mcp-aarch64-apple-darwin");
  assert.strictEqual(L.assetFor("darwin", "x64", "0.35.0"), "kshana-mcp-x86_64-apple-darwin");
  assert.strictEqual(L.assetFor("win32", "x64", "0.35.0"), "kshana-mcp-x86_64-pc-windows-msvc.exe");
  assert.strictEqual(L.assetFor("freebsd", "x64", "0.35.0"), null);
});

test("parseSums and verify accept the listed file and refuse anything else", () => {
  const buf = Buffer.from("hello");
  const sum = L.sha256Hex(buf);
  const sums = L.parseSums(`${sum}  kshana-mcp\n${"0".repeat(64)} *other\nnot a line\n`);
  assert.strictEqual(sums["kshana-mcp"], sum);
  assert.strictEqual(sums.other, "0".repeat(64));
  L.verify(buf, "kshana-mcp", sums);
  assert.throws(() => L.verify(Buffer.from("tampered"), "kshana-mcp", sums), /does not match/);
  assert.throws(() => L.verify(buf, "missing", sums), /does not list/);
});

// A local release: a fake "kshana-mcp" that prints its arguments, and the SHA256SUMS that lists it.
function serve(files) {
  const srv = http.createServer((req, res) => {
    const name = decodeURIComponent(req.url.split("/").pop());
    if (!(name in files)) { res.writeHead(404); return res.end(); }
    res.writeHead(200); res.end(files[name]);
  });
  return new Promise((r) => srv.listen(0, "127.0.0.1", () => r(srv)));
}

test("ensureBinary downloads, verifies, caches and returns a runnable file; a bad checksum is refused", async () => {
  const name = L.assetFor(process.platform, process.arch, "0.0.0");
  if (!name) return;                                   // an unsupported test host
  const script = process.platform === "win32" ? "@echo off\r\necho ran %*\r\n" : "#!/bin/sh\necho ran \"$@\"\n";
  const good = Buffer.from(script);
  const cache = fs.mkdtempSync(path.join(os.tmpdir(), "kshana-mcp-test-"));
  const env = { KSHANA_MCP_CACHE_DIR: cache };
  let srv = await serve({ [name]: good, SHA256SUMS: `${L.sha256Hex(good)}  ${name}\n` });
  env.KSHANA_MCP_RELEASE_BASE = `http://127.0.0.1:${srv.address().port}`;
  const bin = await L.ensureBinary("0.0.0", env);
  assert.ok(fs.existsSync(bin));
  assert.deepStrictEqual(fs.readFileSync(bin), good);
  const again = await L.ensureBinary("0.0.0", env);    // second call: from the cache, re-verified
  assert.strictEqual(again, bin);
  if (process.platform !== "win32") {
    const run = spawnSync(bin, ["a", "b"], { encoding: "utf8" });
    assert.strictEqual(run.stdout.trim(), "ran a b");
  }
  srv.close();
  // a swapped file: SHA256SUMS lists the good checksum, the server serves other bytes
  fs.rmSync(cache, { recursive: true, force: true });
  srv = await serve({ [name]: Buffer.from("evil"), SHA256SUMS: `${L.sha256Hex(good)}  ${name}\n` });
  env.KSHANA_MCP_RELEASE_BASE = `http://127.0.0.1:${srv.address().port}`;
  await assert.rejects(L.ensureBinary("0.0.0", env), /does not match SHA256SUMS/);
  assert.ok(!fs.existsSync(path.join(cache, "0.0.0", name)), "a refused file is never written");
  srv.close();
});
