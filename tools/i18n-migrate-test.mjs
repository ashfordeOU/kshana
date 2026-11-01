#!/usr/bin/env node
// `migrate` keeps orphans: i18n/<lang>/_orphans.txt is appended to and deduplicated by id, never overwritten, and a dry run writes nothing.
// Runs in a temporary directory; no real i18n/<lang> file is touched.
import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, writeFileSync, readFileSync, existsSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { migrateLang } from './i18n-lang.mjs';

const A = 'seg-aaaaaaaaaaaa', B = 'seg-bbbbbbbbbbbb', C = 'seg-cccccccccccc', D = 'seg-dddddddddddd', E = 'seg-eeeeeeeeeeee';
const HEAD = '# Translations whose English segment no longer exists (the English changed, or it could not be carried over). Kept so work can be recovered; not read by the build.';
const root = mkdtempSync(join(tmpdir(), 'migrate-'));
const w = (rel, text) => { mkdirSync(join(root, rel, '..'), { recursive: true }); writeFileSync(join(root, rel), text); };
const r = (rel) => readFileSync(join(root, rel), 'utf8');
const count = (text, s) => text.split(s).length - 1;

// English: one page with one segment (A). The index names the page and its segment.
w('en/pages/_index.json', JSON.stringify({ pages: { 'p.html': { file: 'p.ftl', segments: [A] } }, shared: [] }));
w('en/pages/p.ftl', `${A} = Hello world\n`);
// The language: A is current; B is not in the old English either (dropped); C was in the old English with text that no longer exists (unmatched); D is from an earlier migration.
w('de/pages/p.ftl', `${A} = Hallo Welt\n\n${B} = Alt eins\n\n${C} = Alt zwei\n`);
w('de/_orphans.txt', `${HEAD}\n\n# Old text of D\n${D} = Alt drei\n\n${B} = Alt eins (earlier copy)\n`);
const old = new Map([[C, 'A sentence that is gone']]);

// a dry run reports and writes nothing
const dry = migrateLang(root, 'de', old, { dryRun: true });
assert.deepEqual([dry.dropped, dry.unmatched], [[B], [C]]);
assert.ok(r('de/pages/p.ftl').includes(B), 'dry run keeps the page file');
assert.equal(count(r('de/_orphans.txt'), D), 1, 'dry run keeps the orphans file');
assert.ok(!r('de/_orphans.txt').includes(C), 'dry run adds nothing');

// the real run appends: D stays, B (already kept) is not repeated, C is added once, the header stays single
const res = migrateLang(root, 'de', old);
assert.deepEqual([res.dropped, res.unmatched], [[B], [C]]);
const o1 = r('de/_orphans.txt');
assert.equal(count(o1, HEAD), 1, 'one header');
assert.equal(count(o1, `${D} = Alt drei`), 1, 'the earlier orphan is kept');
assert.equal(count(o1, `${B} =`), 1, 'an id already kept is not repeated');
assert.ok(o1.includes('Alt eins (earlier copy)'), 'the earlier text of B stays, not replaced by the new block');
assert.equal(count(o1, `${C} = Alt zwei`), 1, 'the new orphan is appended');
assert.ok(o1.includes('# A sentence that is gone'), 'the old English is kept as the comment');
assert.ok(o1.indexOf(D) < o1.indexOf(C), 'new orphans come after the old ones');
assert.ok(!r('de/pages/p.ftl').includes(B) && !r('de/pages/p.ftl').includes(C) && r('de/pages/p.ftl').includes(A), 'orphans leave the page file, the live segment stays');

// running again changes nothing (the blocks are no longer in the page file)
const res2 = migrateLang(root, 'de', old);
assert.equal(res2.dropped.length + res2.unmatched.length, 0);
assert.equal(r('de/_orphans.txt'), o1, 'a second run leaves the file as it was');

// a language with no earlier orphans file gets one, with the header, and a second language is independent
w('fr/pages/p.ftl', `${A} = Bonjour\n\n${E} = Ancien\n`);
migrateLang(root, 'fr', old);
const f1 = r('fr/_orphans.txt');
assert.ok(f1.startsWith(HEAD) && count(f1, `${E} = Ancien`) === 1);
assert.ok(!f1.includes(D), 'orphans stay per language');
// the same id orphaned twice in one run is written once
w('fr/pages/p.ftl', `${A} = Bonjour\n\n${E} = Ancien deux\n`);
migrateLang(root, 'fr', old);
assert.equal(count(r('fr/_orphans.txt'), `${E} =`), 1, 'deduplicated by id across runs');
assert.ok(!existsSync(join(root, 'es', '_orphans.txt')));
console.log('migrate orphans test passed');
