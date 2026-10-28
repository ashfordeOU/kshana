#!/usr/bin/env node
// `renumber` carries a translation over an English change that moved only digit runs: by value, the translation's own order and formatting kept;
// anything else is left. Runs in a temporary directory; no real i18n/<lang> file is touched.
import assert from 'node:assert/strict';
import { renumberText } from './i18n-lang.mjs';

const o = 'All { "192" } scenario files across { "92" } kinds; { "180" } are bundled';
const n = 'All { "193" } scenario files across { "92" } kinds; { "181" } are bundled';
assert.equal(renumberText(o, n, 'Alle { "192" } Szenariodateien in { "92" } Arten; { "180" } sind gebündelt'), 'Alle { "193" } Szenariodateien in { "92" } Arten; { "181" } sind gebündelt');
// a translation that reorders the numbers is carried by value
assert.equal(renumberText(o, n, '{ "180" } von { "192" } Dateien, { "92" } Arten'), '{ "181" } von { "193" } Dateien, { "92" } Arten');
// only a code span moved: the skeleton and so the text is unchanged
assert.equal(renumberText('Engine v{ $version }, build <c1/>', 'Engine v{ $version }, build <c1/>', 'Motor v{ $version }, Build <c1/>'), 'Motor v{ $version }, Build <c1/>');
// the translation's own formatting stays (a decimal comma)
assert.equal(renumberText('{ "1.5" } of { "192" }', '{ "1.5" } of { "193" }', '{ "1,5" } von { "192" }'), '{ "1,5" } von { "193" }');
// refused: other words changed
assert.equal(renumberText('{ "192" } files', '{ "193" } documents', 'x { "192" }'), null);
// refused: a different count of runs
assert.equal(renumberText('{ "192" } of { "92" }', '{ "193" } of { "92" }', '{ "192" }'), null);
assert.equal(renumberText('{ "192" } of { "92" }', '{ "193" } of { "92" }', '{ "192" } { "92" } { "7" }'), null);
// refused: the translation's numbers are not the English numbers
assert.equal(renumberText('{ "192" } of { "92" }', '{ "193" } of { "92" }', '{ "191" } von { "92" }'), null);
// refused: one old value would become two
assert.equal(renumberText('{ "5" } and { "5" }', '{ "6" } and { "5" }', '{ "5" } und { "5" }'), null);
// a digit-count change is fine
assert.equal(renumberText('{ "99" } rows', '{ "100" } rows', '{ "99" } Zeilen'), '{ "100" } Zeilen');
console.log('i18n-renumber-test: ok');
