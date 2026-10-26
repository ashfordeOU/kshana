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
