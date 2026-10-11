// SPDX-License-Identifier: AGPL-3.0-only
"use strict";
const test = require("node:test");
const assert = require("node:assert");
const fs = require("node:fs");
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

// A local release as a directory read through file://: a fake "kshana-mcp" that prints its arguments,
// and the SHA256SUMS that lists it.
function release(files) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), "kshana-mcp-rel-"));
  for (const [n, b] of Object.entries(files)) fs.writeFileSync(path.join(dir, n), b);
  return require("node:url").pathToFileURL(dir).href;
}

test("ensureBinary downloads, verifies, caches and returns a runnable file; a bad checksum is refused", async () => {
  const name = L.assetFor(process.platform, process.arch, "0.0.0");
  if (!name) return;                                   // an unsupported test host
  const script = process.platform === "win32" ? "@echo off\r\necho ran %*\r\n" : "#!/bin/sh\necho ran \"$@\"\n";
  const good = Buffer.from(script);
  const cache = fs.mkdtempSync(path.join(os.tmpdir(), "kshana-mcp-test-"));
  const env = { KSHANA_MCP_CACHE_DIR: cache };
  env.KSHANA_MCP_RELEASE_BASE = release({ [name]: good, SHA256SUMS: `${L.sha256Hex(good)}  ${name}\n` });
  const bin = await L.ensureBinary("0.0.0", env);
  assert.ok(fs.existsSync(bin));
  assert.deepStrictEqual(fs.readFileSync(bin), good);
  const again = await L.ensureBinary("0.0.0", env);    // second call: from the cache, re-verified
  assert.strictEqual(again, bin);
  if (process.platform !== "win32") {
    const run = spawnSync(bin, ["a", "b"], { encoding: "utf8" });
    assert.strictEqual(run.stdout.trim(), "ran a b");
  }
  // a swapped file: SHA256SUMS lists the good checksum, the release holds other bytes
  fs.rmSync(cache, { recursive: true, force: true });
  env.KSHANA_MCP_RELEASE_BASE = release({ [name]: Buffer.from("evil"), SHA256SUMS: `${L.sha256Hex(good)}  ${name}\n` });
  await assert.rejects(L.ensureBinary("0.0.0", env), /does not match SHA256SUMS/);
  assert.ok(!fs.existsSync(path.join(cache, "0.0.0", name)), "a refused file is never written");
});

test("KSHANA_MCP_RELEASE_BASE accepts only https:// or file://, and announces itself", () => {
  const seen = [];
  const w = process.stderr.write.bind(process.stderr);
  process.stderr.write = (m) => { seen.push(String(m)); return true; };
  try {
    assert.throws(() => L.releaseBase("1.0.0", { KSHANA_MCP_RELEASE_BASE: "http://127.0.0.1:8000" }), /https:\/\/ or file:\/\//);
    assert.throws(() => L.releaseBase("1.0.0", { KSHANA_MCP_RELEASE_BASE: "ftp://x" }), /https:\/\/ or file:\/\//);
    assert.strictEqual(L.releaseBase("1.0.0", { KSHANA_MCP_RELEASE_BASE: "https://mirror.example/rel/" }), "https://mirror.example/rel");
    assert.ok(seen.some((m) => /NOTICE.*KSHANA_MCP_RELEASE_BASE/.test(m)), "override notice on stderr");
    seen.length = 0;
    assert.match(L.releaseBase("1.0.0", {}), /^https:\/\/github\.com\//);
    assert.strictEqual(seen.length, 0, "no notice without the override");
  } finally { process.stderr.write = w; }
});

test("a redirect to a non-https address is refused", async () => {
  const real = globalThis.fetch;
  globalThis.fetch = async () => ({ ok: true, url: "http://evil.example/kshana-mcp", headers: new Map(), body: null });
  try {
    await assert.rejects(L.fetchBuffer("https://github.com/x/SHA256SUMS", 1000), /non-https/);
  } finally { globalThis.fetch = real; }
});

function streamOf(bytes, chunk) {
  let i = 0;
  return { getReader: () => ({ read: async () => (i >= bytes ? { done: true } : { done: false, value: (i += chunk, new Uint8Array(chunk)) }), cancel: async () => {} }) };
}

test("size caps: a body over the limit is refused as it streams, and a declared length is refused at once", async () => {
  const real = globalThis.fetch;
  try {
    globalThis.fetch = async () => ({ ok: true, url: "https://x/y", headers: new Map(), body: streamOf(10_000, 1000) });
    await assert.rejects(L.fetchBuffer("https://x/y", 4000), /limit/);
    globalThis.fetch = async () => ({ ok: true, url: "https://x/y", headers: new Map([["content-length", "99999999999"]]), body: streamOf(10, 10) });
    await assert.rejects(L.fetchBuffer("https://x/y", 4000), /over the 4000-byte limit/);
    globalThis.fetch = async () => ({ ok: true, url: "https://x/y", headers: new Map(), body: streamOf(1000, 1000) });
    assert.strictEqual((await L.fetchBuffer("https://x/y", 4000)).length, 1000);
  } finally { globalThis.fetch = real; }
  assert.strictEqual(L.MAX_BINARY_BYTES, 100 * 1024 * 1024);
  assert.strictEqual(L.MAX_SUMS_BYTES, 64 * 1024);
  const f = release({ big: Buffer.alloc(5000) });
  await assert.rejects(L.fetchBuffer(`${f}/big`, 1000), /over the 1000-byte limit/);
});

test("a fetch that never answers times out", async () => {
  const real = globalThis.fetch;
  globalThis.fetch = (url, opts) => new Promise((_, reject) => opts.signal.addEventListener("abort", () => reject(new Error("aborted by timeout"))));
  const keepAlive = setInterval(() => {}, 1000);      // a real socket would keep the loop alive; the stub does not
  try {
    await assert.rejects(L.fetchBuffer("https://x/y", 1000, { KSHANA_MCP_FETCH_TIMEOUT_MS: "50" }), /aborted by timeout/);
  } finally { clearInterval(keepAlive); globalThis.fetch = real; }
});
