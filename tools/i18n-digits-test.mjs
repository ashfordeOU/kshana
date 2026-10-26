#!/usr/bin/env node
// Digit-integrity rule of check/merge: a translation keeps the English digit runs and may add only the value of an English
// number word (zero to twenty, hundred, thousand) or the month number of an English month name, in the same message.
import assert from 'node:assert/strict';
import { digitsOk } from './i18n-lang.mjs';

assert.ok(digitsOk('January 29', '1月29日'), 'month name -> month number');
assert.ok(digitsOk('18 March 2023', '2023年3月18日'));
assert.ok(digitsOk('one or two cells', '1つまたは2つのセル'), 'number words');
assert.ok(digitsOk('a 1,408 m run', '1,408 m'), 'unchanged digits');
assert.ok(!digitsOk('January 29', '1月30日'), 'a wrong number is still caught');
assert.ok(!digitsOk('January 29', '2月29日'), 'wrong month number is caught');
assert.ok(digitsOk('January 29', '29日'), 'a month number need not be added');
assert.ok(!digitsOk('January 29', '1月'), 'a dropped English digit is caught');
assert.ok(!digitsOk('January 29', '1月1月29日'), 'an allowed number used twice is caught');
assert.ok(!digitsOk('see the table', '3表を見る'), 'no number word or month in the English: nothing may be added');
assert.ok(!digitsOk('one cell', '3つのセル'), 'wrong value for a number word');
console.log('digits test passed');

// built-page case: verify applies the same rule per text block
import { mkdtempSync, mkdirSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { spawnSync } from 'node:child_process';
const tmp = mkdtempSync(join(tmpdir(), 'digits-'));
const mk = (dir, body) => { mkdirSync(dir, { recursive: true }); writeFileSync(join(dir, 'p.html'), `<!doctype html><html><body><div class="i18n-notice">MT</div><main>${body}</main></body></html>`); };
const run = (tr) => {
  mk(join(tmp, 'src'), '<p>Launch on January 29 with 3 cells.</p><p>Total 1,408.</p>');
  mk(join(tmp, 'dist', 'ja'), tr);
  return spawnSync('node', ['tools/i18n.mjs', 'verify', 'ja', '--src', join(tmp, 'src'), '--dist', join(tmp, 'dist'), '--root', join(tmp, 'none')], { encoding: 'utf8' }).stdout;
};
const out1 = run('<p>1月29日に3セルで打ち上げ。</p><p>合計1,408。</p>');
assert.ok(!/numeric values/.test(out1), 'verify accepts the month number in its block: ' + out1);
const out2 = run('<p>1月30日に3セルで打ち上げ。</p><p>合計1,408。</p>');
assert.ok(/numeric values/.test(out2), 'verify still catches a wrong number');
const out3 = run('<p>1月29日に3セルで打ち上げ。</p><p>合計1,408。1月</p>');
assert.ok(/numeric values/.test(out3), 'a month number cannot move to a block whose English has no month');
console.log('built-page digits test passed');
