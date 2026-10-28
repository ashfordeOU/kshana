#!/usr/bin/env node
// The run-time catalogues of the deploy tree: only the files the browser fetches, comments and blank lines stripped with identical
// messages, only the per-language data files a page can request. The lists in tools/i18n-share.mjs are pinned against the sources here.
import assert from 'node:assert/strict';
import { readFileSync, readdirSync, existsSync, mkdtempSync, mkdirSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join, dirname } from 'node:path';
import { FluentParser } from './vendor/fluent-syntax-0.19.0.mjs';
import { stripFtl, stageCatalogues, pruneData, RUNTIME_CATALOGUES, RUNTIME_DATA, ENGINE_CATALOGUE } from './i18n-share.mjs';

const read = (p) => readFileSync(p, 'utf8');
const put = (root, rel, data) => { const p = join(root, rel); mkdirSync(dirname(p), { recursive: true }); writeFileSync(p, data); };

// ---- stripFtl keeps every message, term and attribute (and so every pattern, multi-line ones included)
const entries = (text) => {
  const res = new FluentParser({ withSpans: false }).parse(text);
  const out = new Map(); let junk = 0;
  for (const e of res.body) {
    if (e.type === 'Junk') { junk++; continue; }
    if (e.type === 'Message' || e.type === 'Term') out.set(`${e.type}:${e.id.name}`, JSON.stringify({ value: e.value, attributes: e.attributes }));
  }
  return { out, junk };
};
const sample = '### file comment\n\n# a comment\nhello = Hello\n    .title = Title\n\n## group\nmulti =\n    First line\n\n    Third line after a blank\n-term = Term\nsel = { $n ->\n    [one] One\n   *[other] Other\n}\n';
{ const s = stripFtl(sample); assert.ok(!/^#/m.test(s) && !/\n\n(?!\s)/.test(s.replace(/\n\n    Third/, '\n    Third')), 'comments and blank lines gone');
  const a = entries(sample), b = entries(s); assert.deepEqual([...b.out], [...a.out]); assert.equal(b.junk, a.junk); assert.ok(a.out.get('Message:multi').includes('\\n')); }
let total = 0, stripped = 0, checked = 0;
for (const lang of readdirSync('i18n')) {
  for (const f of RUNTIME_CATALOGUES) {
    const p = join('i18n', lang, f);
    if (!existsSync(p)) continue;
    const text = read(p), s = stripFtl(text);
    const a = entries(text), b = entries(s);
    assert.equal(b.out.size, a.out.size, `${p}: same number of entries`);
    for (const [k, v] of a.out) assert.equal(b.out.get(k), v, `${p}: ${k} identical after stripping`);
    assert.equal(b.junk, a.junk, `${p}: no new junk`);
    assert.ok(s.length <= text.length); total += text.length; stripped += s.length; checked++;
  }
}
assert.ok(checked >= 5, 'real catalogues were compared');
assert.ok(readdirSync('i18n').filter((l) => l !== 'en' && existsSync(join('i18n', l, ENGINE_CATALOGUE))).length >= 17, 'engine.ftl of every language is among the compared files');
console.log(`stripped ${checked} catalogue files identical in messages: ${total} -> ${stripped} bytes`);

// ---- the run-time list against the sources
const l10n = read('web/studio/lib/l10n.mjs');
const defaults = /files = \[([^\]]*)\]/.exec(l10n)[1].match(/"([^"]+)"/g).map((x) => x.slice(1, -1));
const siteFiles = /kshanaL10nFiles=\[([^\]]*)\]/.exec(read('tools/i18n-site.mjs'))[1].match(/"([^"]+)"/g).map((x) => x.slice(1, -1));
assert.deepEqual([...new Set([...defaults, ...siteFiles, ENGINE_CATALOGUE])].sort(), [...RUNTIME_CATALOGUES].sort(), 'the shipped catalogues are exactly the Studio default files, the translated site pages files and engine.ftl');
// engine.ftl is fetched only through attachEngine, and the only page code that calls it is the Studio's engine-text module, which app.js and advanced.js start
const callers = [];
const walk = (d) => { for (const e of readdirSync(d, { withFileTypes: true })) { const p = join(d, e.name); if (e.isDirectory()) { if (e.name !== 'pkg' && e.name !== 'node_modules') walk(p); } else if (/\.(m?js|html)$/.test(e.name) && !/\.test\.mjs$/.test(e.name) && /attachEngine\(|registerEngine\s*:/.test(read(p).replace(/\/\/.*$/gm, ''))) callers.push(p); } };
walk('web');
assert.deepEqual(callers.filter((p) => !/studio\/lib\/l10n\.mjs$/.test(p)), ['web/studio/lib/engine-text.mjs'], 'the only caller of attachEngine is the Studio engine-text module');
for (const f of ['web/studio/app.js', 'web/studio/advanced.js']) assert.ok(/attachEngineText\(S\.engine\)/.test(read(f)) && /localiseEngineText\(run\)/.test(read(f)), `${f} registers the engine catalogue and localises each live run`);
assert.ok(/l\.lang !== "en"/.test(read('web/studio/lib/engine-text.mjs')) && /if \(lang === "en"\) return/.test(l10n), 'English never registers an engine catalogue: attachEngine skips it, engine-text answers null');
assert.ok(RUNTIME_CATALOGUES.includes('engine.ftl') && !RUNTIME_CATALOGUES.includes('data.ftl'));
// the loader asks for nothing but `${base}${lang}/${file}` (and engine.ftl above)
assert.deepEqual([...l10n.matchAll(/fetchText\(`([^`]+)`\)/g)].map((m) => m[1]).sort(), ['${base}${code}/${f}', '${base}${lang}/engine.ftl']);

// ---- the data copies against the sources
const spec = JSON.parse(read('i18n/data-spec.json')).files.map((f) => f.file);
const must = [
  ['data/series.json', 'web/site.js', 'fetchData(ROOT + "data/series.json")'], ['data/search.json', 'web/site.js', 'fetchData(ROOT + "data/search.json")'],
  ['assets/capabilities/capabilities.json', 'web/js/capabilities.mjs', 'fetchData(ROOT + "assets/capabilities/capabilities.json")'], ['assets/capabilities/capabilities.json', 'web/js/cap-hero.mjs', 'fetchData(ROOT + "assets/capabilities/capabilities.json")'],
  ['js/evidence-data.mjs', 'web/js/evidence.mjs', 'importData(new URL("./evidence-data.mjs"'], ['js/developers-data.mjs', 'web/js/developers.mjs', 'importData(new URL("./developers-data.mjs"'], ['js/missions-runs.mjs', 'web/js/missions.mjs', 'importData(new URL("./missions-runs.mjs"'],
  ['studio/channels.json', 'web/studio/app.js', 'fetchData("channels.json")'],
];
for (const [f, src, needle] of must) { assert.ok(read(src).includes(needle), `${src} requests ${f}`); assert.ok(RUNTIME_DATA.includes(f) && spec.includes(f)); }
assert.deepEqual([...new Set(must.map((m) => m[0]))].sort(), [...RUNTIME_DATA].sort());
// a file outside RUNTIME_DATA is named by no fetchData/importData call that would resolve to it
const calls = [];
const scan = (d) => { for (const e of readdirSync(d, { withFileTypes: true })) { const p = join(d, e.name); if (e.isDirectory()) { if (e.name !== 'pkg' && e.name !== 'node_modules' && e.name !== 'assets') scan(p); } else if (/\.(m?js|html)$/.test(e.name) && !/\.test\.mjs$/.test(e.name) && !/(^|\/)t\.mjs$/.test(p)) for (const m of read(p).matchAll(/(fetchData|importData)\(([^)]*)\)/g)) calls.push({ p, arg: m[2] }); } };
scan('web');
for (const f of spec.filter((x) => !RUNTIME_DATA.includes(x))) {
  const base = f.split('/').pop();
  const hits = calls.filter((c) => c.arg.includes(base)).filter((c) => !(f.startsWith('data/') && c.p.startsWith('web/studio/')) && !(f.startsWith('studio/') && !c.p.startsWith('web/studio/')));
  assert.deepEqual(hits, [], `${f} is not requested by fetchData/importData: its language copies are not shipped`);
}
console.log(`data copies: ${RUNTIME_DATA.length} of ${spec.length} listed files are requested at run time`);

// ---- stage and prune on a scratch tree
const tmp = mkdtempSync(join(tmpdir(), 'cat-')), cat = join(tmp, 'cat'), site = join(tmp, 'site');
for (const l of ['en', 'de', 'ja', 'fr']) for (const f of [...RUNTIME_CATALOGUES, 'engine.ftl', 'data.ftl', 'REVIEW.md']) put(cat, `${l}/${f}`, `# c\n\nmsg = ${l} ${f}\n`);
const n = stageCatalogues(cat, site, ['de', 'ja']);
assert.equal(n, ['en', 'de', 'ja'].reduce((a, l) => a + RUNTIME_CATALOGUES.filter((f) => !(l === 'en' && f === ENGINE_CATALOGUE)).reduce((b, f) => b + `msg = ${l} ${f}\n`.length, 0), 0));
for (const l of ['en', 'de', 'ja']) for (const f of RUNTIME_CATALOGUES.filter((f) => !(l === 'en' && f === ENGINE_CATALOGUE))) assert.equal(read(join(site, 'i18n', l, f)), `msg = ${l} ${f}\n`);
for (const x of ['i18n/en/engine.ftl', 'i18n/de/data.ftl', 'i18n/de/REVIEW.md', 'i18n/fr']) assert.ok(!existsSync(join(site, x)), `${x} is not shipped`);
const dt = join(tmp, 'dt');
for (const f of spec) put(dt, `de/${f}`, 'x');
const r = pruneData(dt, ['de'], 'i18n/data-spec.json');
assert.equal(r.removed.length, spec.length - RUNTIME_DATA.length);
for (const f of spec) assert.equal(existsSync(join(dt, 'de', f)), RUNTIME_DATA.includes(f), f);
console.log('catalogues test passed');
