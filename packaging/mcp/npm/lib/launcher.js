// SPDX-License-Identifier: AGPL-3.0-only
"use strict";
// Download, verify and run the prebuilt kshana-mcp binary of THIS package's version.
//
// The binary is a GitHub release asset; SHA256SUMS (also a release asset, written by the same release run)
// lists its checksum. The download is refused when the checksum differs, so a damaged or swapped file is never
// run. That protects the transfer; it does not prove who built it: for that, `gh attestation verify <file>
// --repo ashfordeOU/kshana` checks the build provenance of the same file. Nothing is written to stdout except
// by the server itself (stdout is the MCP channel); all messages go to stderr.

const crypto = require("node:crypto");
const fs = require("node:fs");
const os = require("node:os");
const path = require("node:path");

const REPO = "ashfordeOU/kshana";

/** The release asset for a platform, or null. Linux x86-64 keeps its historical bare name. */
function assetFor(platform, arch, version) {
  void version;
  if (platform === "linux" && arch === "x64") return "kshana-mcp";
  if (platform === "linux" && arch === "arm64") return "kshana-mcp-aarch64-unknown-linux-gnu";
  if (platform === "darwin" && arch === "arm64") return "kshana-mcp-aarch64-apple-darwin";
  if (platform === "darwin" && arch === "x64") return "kshana-mcp-x86_64-apple-darwin";
  if (platform === "win32" && arch === "x64") return "kshana-mcp-x86_64-pc-windows-msvc.exe";
  return null;
}

/** `{ name: sha256 }` from the text of a SHA256SUMS file (sha256sum's "<hex>  <name>" lines). */
function parseSums(text) {
  const out = {};
  for (const line of text.split(/\r?\n/)) {
    const m = /^([0-9a-fA-F]{64})\s+\*?(.+)$/.exec(line.trim());
    if (m) out[m[2]] = m[1].toLowerCase();
  }
  return out;
}

function sha256Hex(buf) {
  return crypto.createHash("sha256").update(buf).digest("hex");
}

/** Throws unless `buf` is the file `name` that `sums` lists. */
function verify(buf, name, sums) {
  const want = sums[name];
  if (!want) throw new Error(`SHA256SUMS does not list ${name}; refusing to run an unlisted file`);
  const got = sha256Hex(buf);
  if (got !== want) throw new Error(`${name}: sha256 ${got} does not match SHA256SUMS ${want}; refusing to run it`);
}

function releaseBase(version, env) {
  return (env.KSHANA_MCP_RELEASE_BASE || `https://github.com/${REPO}/releases/download/v${version}`).replace(/\/+$/, "");
}

function cacheDir(version, env) {
  const root = env.KSHANA_MCP_CACHE_DIR || path.join(env.XDG_CACHE_HOME || path.join(os.homedir(), ".cache"), "kshana-mcp");
  return path.join(root, version);
}

async function fetchBuffer(url) {
  const res = await fetch(url, { redirect: "follow" });
  if (!res.ok) throw new Error(`GET ${url}: HTTP ${res.status}`);
  return Buffer.from(await res.arrayBuffer());
}

/** The path to a verified binary, downloading it first when it is not cached. */
async function ensureBinary(version, env = process.env, platform = process.platform, arch = process.arch) {
  const name = assetFor(platform, arch, version);
  if (!name) throw new Error(`no prebuilt kshana-mcp for ${platform}/${arch}; use the Docker image or cargo install kshana-mcp`);
  const dir = cacheDir(version, env);
  const target = path.join(dir, name);
  const base = releaseBase(version, env);
  const sums = parseSums((await fetchBuffer(`${base}/SHA256SUMS`)).toString("utf8"));
  if (fs.existsSync(target)) {
    try {
      verify(fs.readFileSync(target), name, sums);   // a cached file is re-checked every run
      return target;
    } catch (e) {
      process.stderr.write(`kshana-mcp: cached file rejected (${e.message}); downloading again\n`);
      fs.rmSync(target, { force: true });
    }
  }
  process.stderr.write(`kshana-mcp: downloading ${name} v${version}\n`);
  const buf = await fetchBuffer(`${base}/${name}`);
  verify(buf, name, sums);
  fs.mkdirSync(dir, { recursive: true });
  const tmp = `${target}.${process.pid}.tmp`;
  fs.writeFileSync(tmp, buf, { mode: 0o755 });
  fs.renameSync(tmp, target);
  return target;
}

module.exports = { assetFor, parseSums, sha256Hex, verify, releaseBase, cacheDir, ensureBinary };
