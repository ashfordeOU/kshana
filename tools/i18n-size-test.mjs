#!/usr/bin/env node
// Deploy size accounting and the byte savers that change no content: measureTree / `size`, applyData leaving out untranslated data
// files (the pages fall back to the English file), shareEngine keeping one copy of the wasm package. Temporary directories only.
import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, writeFileSync, readFileSync, existsSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join, dirname } from 'node:path';
import { spawnSync } from 'node:child_process';
import { measureTree } from './i18n-size.mjs';
import { applyData } from './i18n-data.mjs';
import { shareEngine, SHIM, stageCatalogues, RUNTIME_CATALOGUES } from './i18n-share.mjs';

const tmp = mkdtempSync(join(tmpdir(), 'size-'));
const put = (root, rel, data) => { const p = join(root, rel); mkdirSync(dirname(p), { recursive: true }); writeFileSync(p, data); };
const bytes = (n, c = 'x') => c.repeat(n);

// ---- measureTree: totals, top-level entries, classes, English versus language trees
const t1 = join(tmp, 't1');
put(t1, 'index.html', bytes(100)); put(t1, 'docs/a.html', bytes(200)); put(t1, 'pkg/kshana_bg.wasm', bytes(1000)); put(t1, 'studio/pkg/kshana_bg.wasm', bytes(1000));
put(t1, 'de/index.html', bytes(150)); put(t1, 'de/data/x.json', bytes(50)); put(t1, 'ja/index.html', bytes(160)); put(t1, 'zh-Hans/docs/a.html', bytes(10)); put(t1, 'docs/de/keep.html', bytes(7));
const m = measureTree(t1, ['de', 'ja', 'zh-Hans']);
assert.equal(m.total, 100 + 200 + 1000 + 1000 + 150 + 50 + 160 + 10 + 7);
assert.equal(m.byGroup.lang, 150 + 50 + 160 + 10, 'only top-level language directories are language trees (docs/de is English)');
assert.equal(m.byGroup.en, m.total - m.byGroup.lang);
assert.equal(m.byTop.get('studio'), 1000); assert.equal(m.byTop.get('(root files)'), 100);
assert.deepEqual(m.langs.sort(), ['de', 'ja', 'zh-Hans']);
assert.equal(m.byClass.get('wasm').en, 2000, 'both wasm copies are counted: the cap is on what is uploaded');
assert.equal(m.byClass.get('json').lang, 50);

// ---- `size`: counts the whole tree including pkg, fails over the cap, and refuses a tree without the engine
const cli = (...a) => spawnSync('node', ['tools/i18n.mjs', 'size', ...a], { encoding: 'utf8' });
let r = cli('--tree', t1, '--dist', join(tmp, 'none'), '--cap', '1');
assert.equal(r.status, 0, r.stdout + r.stderr);
assert.match(r.stdout, /engine package counted/);
r = cli('--tree', t1, '--dist', join(tmp, 'none'), '--cap', '0.002');
assert.equal(r.status, 1, 'over the cap fails'); assert.match(r.stdout, /OVER/);
const t2 = join(tmp, 't2'); put(t2, 'index.html', bytes(10));
r = cli('--tree', t2, '--dist', join(tmp, 'none'), '--cap', '1');
assert.equal(r.status, 1, 'a tree without the engine is not the deploy tree'); assert.match(r.stderr, /no pkg\/kshana_bg\.wasm/);
r = cli('--tree', t2, '--dist', join(tmp, 'none'), '--cap', '1', '--no-engine');
assert.equal(r.status, 0, 'explicit opt-out');
r = cli('--tree', t1, '--dist', join(tmp, 'none'), '--cap', '1', '--breakdown');
assert.match(r.stdout, /by top-level entry/); assert.match(r.stdout, /by class/);

// ---- applyData: a data file in which nothing was translated is not written; a stale copy is removed; a translated one is written
const src = join(tmp, 'src'), out = join(tmp, 'out');
put(src, 'data/a.json', JSON.stringify({ title: 'The quick brown fox', id: 'not prose here' }));
put(src, 'data/b.json', JSON.stringify({ title: 'A second sentence here' }));
put(src, 'js/m.mjs', '// header\nexport default {"t":"Module prose text"};\n');
put(out, 'data/b.json', 'stale'); put(out, 'js/m.mjs', 'stale');
const spec = { skipKeys: ['id'], files: [{ file: 'data/a.json' }, { file: 'data/b.json' }, { file: 'js/m.mjs', module: true }, { file: 'data/missing.json' }] };
const res = applyData(src, out, spec, (s) => (s === 'The quick brown fox' ? 'Der schnelle braune Fuchs' : null));
assert.equal(res.replaced, 1); assert.equal(res.total, 3);
assert.deepEqual(res.shared.sort(), ['data/b.json', 'js/m.mjs']);
assert.equal(JSON.parse(readFileSync(join(out, 'data/a.json'), 'utf8')).title, 'Der schnelle braune Fuchs');
assert.equal(JSON.parse(readFileSync(join(out, 'data/a.json'), 'utf8')).id, 'not prose here');
assert.ok(!existsSync(join(out, 'data/b.json')) && !existsSync(join(out, 'js/m.mjs')), 'untranslated copies are not written, stale ones are removed');

// ---- shareEngine
const WASM = bytes(5000, 'w'), JS = 'export default function init(){}\n';
const mk = (name, studioWasm = WASM) => {
  const t = join(tmp, name);
  put(t, 'pkg/kshana_bg.wasm', WASM); put(t, 'pkg/kshana.js', JS);
  put(t, 'studio/pkg/kshana_bg.wasm', studioWasm); put(t, 'studio/pkg/kshana.js', JS); put(t, 'studio/pkg/package.json', '{}');
  put(t, 'studio/app.js', 'const w = await compileEngine(new URL("./pkg/kshana_bg.wasm", import.meta.url));\nimport("./pkg/kshana.js");\n');
  put(t, 'studio/lib/engine-page.mjs', "const w = await compileEngine(new URL('../pkg/kshana_bg.wasm', import.meta.url));\n");
  put(t, 'studio/recorded/x.json', '{"note":"pkg/kshana_bg.wasm is not read here"}');
  return t;
};
const t3 = mk('t3');
const s1 = shareEngine(t3);
assert.equal(s1.status, 'shared'); assert.equal(s1.saved, WASM.length + JS.length - SHIM.length); assert.deepEqual(s1.rewritten.sort(), ['studio/app.js', 'studio/lib/engine-page.mjs']);
assert.ok(!existsSync(join(t3, 'studio/pkg/kshana_bg.wasm')) && existsSync(join(t3, 'pkg/kshana_bg.wasm')));
assert.equal(readFileSync(join(t3, 'studio/pkg/kshana.js'), 'utf8'), SHIM);
assert.match(readFileSync(join(t3, 'studio/app.js'), 'utf8'), /new URL\("\/pkg\/kshana_bg\.wasm", import\.meta\.url\)/);
assert.match(readFileSync(join(t3, 'studio/lib/engine-page.mjs'), 'utf8'), /new URL\("\/pkg\/kshana_bg\.wasm", import\.meta\.url\)/);
assert.equal(shareEngine(t3).status, 'already shared', 'idempotent');
assert.throws(() => shareEngine(mk('t4', bytes(5000, 'v'))), /differs/, 'two different builds are never merged');
const t5 = mk('t5'); put(t5, 'studio/other.js', 'fetch(base + "pkg/kshana_bg.wasm")');
assert.throws(() => shareEngine(t5), /does not rewrite/);
assert.ok(existsSync(join(t5, 'studio/pkg/kshana_bg.wasm')) && readFileSync(join(t5, 'studio/app.js'), 'utf8').includes('"./pkg/kshana_bg.wasm"'), 'a refused run changes nothing');

// ---- stageCatalogues: English and the built languages, the six run-time files, nothing else
const cat = join(tmp, 'cat'), site = join(tmp, 'catsite');
for (const l of ['en', 'de', 'ja', 'fr']) for (const f of [...RUNTIME_CATALOGUES, 'data.ftl', 'REVIEW.md']) if (!(l === 'ja' && f === 'engine.ftl')) put(cat, `${l}/${f}`, bytes(10));
const n = stageCatalogues(cat, site, ['de', 'ja']);
assert.equal(n, 10 * (6 + 6 + 5), 'en, de and ja (ja has no engine.ftl); fr is not built');
assert.ok(existsSync(join(site, 'i18n/de/studio-js.ftl')) && !existsSync(join(site, 'i18n/de/data.ftl')) && !existsSync(join(site, 'i18n/fr')) && !existsSync(join(site, 'i18n/de/REVIEW.md')), 'only the run-time catalogues of built languages');
console.log('size test passed');
