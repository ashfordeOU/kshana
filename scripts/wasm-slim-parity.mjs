// SPDX-License-Identifier: AGPL-3.0-only
// Parity of the feature-limited WebAssembly module (`--features wasm-slim`) with the full one.
//
//   node scripts/wasm-slim-parity.mjs <full-pkg-dir> <slim-pkg-dir> [calls.jsonl]
//
// Both directories are `wasm-pack build --target web` outputs (kshana.js + kshana_bg.wasm). The
// calls file (default tests/fixtures/wasm_slim/embedder_calls.jsonl) holds one JSON object per line,
// {"fn": "run" | "export_sp3", "toml": "..."}: a recorded set of engine calls from an embedder's
// validation cases (Galileo DOP, Klobuchar, a RINEX navigation import and two single-point fixes;
// 57 calls), recorded against kshana@0.41.0.
//
// It fails unless:
//   1. the slim module exports exactly version, run and export_sp3 (plus wasm-bindgen's own glue);
//   2. version() is the same in both;
//   3. every recorded call returns the same bytes from both modules (or throws the same message);
//   4. a kind the slim module does not carry is refused by it and still runs in the full one.
import { readFileSync } from 'node:fs';
import { createHash } from 'node:crypto';
import { resolve } from 'node:path';
import { pathToFileURL } from 'node:url';

const [fullDir, slimDir, callsArg] = process.argv.slice(2);
if (!fullDir || !slimDir) {
  console.error('usage: node scripts/wasm-slim-parity.mjs <full-pkg-dir> <slim-pkg-dir> [calls.jsonl]');
  process.exit(2);
}
const here = new URL('..', import.meta.url);
const callsPath = callsArg ?? new URL('tests/fixtures/wasm_slim/embedder_calls.jsonl', here);

async function load(dir) {
  const mod = await import(pathToFileURL(resolve(dir, 'kshana.js')).href);
  mod.initSync({ module: readFileSync(resolve(dir, 'kshana_bg.wasm')) });
  return mod;
}

const full = await load(fullDir);
const slim = await load(slimDir);
const failures = [];

// 1. The export surface. `default`, `initSync` are the loader wasm-bindgen generates.
const GLUE = new Set(['default', 'initSync']);
const WANT = ['export_sp3', 'run', 'version'];
const got = Object.keys(slim).filter((k) => !GLUE.has(k)).sort();
if (JSON.stringify(got) !== JSON.stringify(WANT)) failures.push(`slim exports ${got.join(', ')}; expected ${WANT.join(', ')}`);
const exportsWasm = WebAssembly.Module.exports(new WebAssembly.Module(readFileSync(resolve(slimDir, 'kshana_bg.wasm'))))
  .filter((e) => e.kind === 'function' && !e.name.startsWith('__wbindgen') && !e.name.startsWith('__wbg'))
  .map((e) => e.name)
  .sort();
console.log(`slim wasm function exports: ${exportsWasm.join(', ')}`);

// 2. The version.
if (full.version() !== slim.version()) failures.push(`version: full ${full.version()}, slim ${slim.version()}`);

// 3. Every recorded call.
const call = (m, fn, toml) => {
  try {
    return { ok: m[fn](toml) };
  } catch (e) {
    return { err: String(e?.message ?? e) };
  }
};
const sha = (s) => createHash('sha256').update(s ?? '').digest('hex').slice(0, 16);
const lines = readFileSync(callsPath, 'utf8').split('\n').filter(Boolean);
const tally = {};
for (const [i, line] of lines.entries()) {
  const { fn, toml } = JSON.parse(line);
  const kind = /^kind\s*=\s*"([^"]+)"/m.exec(toml)?.[1] ?? '?';
  const key = `${fn}/${kind}`;
  tally[key] ??= { n: 0, bytes: 0 };
  const a = call(full, fn, toml);
  const b = call(slim, fn, toml);
  if (a.err !== undefined || b.err !== undefined) {
    failures.push(`call ${i + 1} ${key}: full ${a.err ?? 'ok'}, slim ${b.err ?? 'ok'}`);
    continue;
  }
  if (a.ok !== b.ok) failures.push(`call ${i + 1} ${key}: output differs (full ${sha(a.ok)}, slim ${sha(b.ok)})`);
  tally[key].n += 1;
  tally[key].bytes += b.ok.length;
}
for (const [k, v] of Object.entries(tally)) console.log(`identical: ${v.n} ${k} calls (${v.bytes} bytes of output)`);

// 4. A kind the slim module does not carry.
const other = 'kind = "jamming"\n';
const fullOther = call(full, 'run', other);
const slimOther = call(slim, 'run', other);
if (slimOther.err === undefined || !slimOther.err.includes('jamming')) failures.push(`slim ran a kind it does not carry: ${JSON.stringify(slimOther).slice(0, 120)}`);
console.log(`refused by slim: jamming (${slimOther.err ?? 'not refused'}); full: ${fullOther.err ? 'error' : 'ran'}`);

if (failures.length) {
  console.error(`\nFAIL (${failures.length}):\n${failures.join('\n')}`);
  process.exit(1);
}
console.log(`\nPASS: ${lines.length} of ${lines.length} recorded calls byte-identical; exports ${WANT.join(', ')}`);
