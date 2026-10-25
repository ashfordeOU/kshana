#!/usr/bin/env node
// Checks the string-literal comparison of tools/i18n-lang.mjs: a literal repeated in every plural variant is accepted,
// a changed, dropped or added literal is still caught.   node tools/i18n-lits-test.mjs
import { signature, litsEqual } from './i18n-lang.mjs';
import { FluentParser } from './vendor/fluent-syntax-0.19.0.mjs';

const sig = (src) => signature(new FluentParser({ withSpans: false }).parse(src).body.find((e) => e.type === 'Message'));
const en = sig('m = At { $n } bodies{ "  " }{ "\\u000A" }\n');
const cases = [
  ['plural selector repeats the literals', 'm =\n    { $n ->\n        [one] Bei { $n } Körper{ "  " }{ "\\u000A" }\n       *[other] Bei { $n } Körpern{ "  " }{ "\\u000A" }\n    }\n', true],
  ['plain translation keeps them', 'm = Bei { $n } Körpern{ "  " }{ "\\u000A" }\n', true],
  ['plain translation drops one', 'm = Bei { $n } Körpern{ "  " }\n', false],
  ['selector changes a literal', 'm =\n    { $n ->\n        [one] Bei { $n }{ " " }{ "\\u000A" }\n       *[other] Bei { $n }{ " " }{ "\\u000A" }\n    }\n', false],
  ['selector adds a literal', 'm =\n    { $n ->\n        [one] Bei { $n }{ "  " }{ "\\u000A" }{ "x" }\n       *[other] Bei { $n }{ "  " }{ "\\u000A" }\n    }\n', false],
];
let bad = 0;
for (const [name, src, want] of cases) {
  const got = litsEqual(en, sig(src));
  if (got !== want) { bad++; console.error(`FAIL ${name}: litsEqual=${got}, want ${want}`); } else console.log(`ok   ${name}`);
}
process.exit(bad ? 1 : 0);
