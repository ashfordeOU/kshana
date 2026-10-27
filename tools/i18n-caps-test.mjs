#!/usr/bin/env node
// Caps-token rule: a translation carries each all-caps tier, verdict, status and source-label word exactly as often as the English.
import assert from 'node:assert/strict';
import { capsCounts, TIER_TOKENS } from './i18n-lang.mjs';

for (const w of ['ILLUSTRATIVE', 'PUBLIC', 'REPRESENTATIVE', 'WORKSHOP', 'MIXED', 'MEASURED', 'GREEN']) {
  assert.ok(TIER_TOKENS.includes(w), w + ' is counted');
  assert.deepEqual(capsCounts(`Source ${w} and ${w}.`), { [w]: 2 });
  assert.deepEqual(capsCounts(`Quelle ${w}, ${w}.`), { [w]: 2 }, 'kept as written: same count');
  assert.notDeepEqual(capsCounts('Quelle ' + w.toLowerCase()), capsCounts(`Source ${w}`), 'a translated or lowercased word changes the count');
}
assert.deepEqual(capsCounts('a public source'), {}, 'a lowercase word is a word');
assert.deepEqual(capsCounts('MIXED — VALIDATED blocks'), { MIXED: 1, VALIDATED: 1 });
console.log('caps test passed');
assert.deepEqual(capsCounts('MEASURED_UNITS and PUBLIC_KEY'), {}, 'an identifier with an underscore is not a label');
assert.deepEqual(capsCounts('MEASURED log, MODELLED assessment'), { MEASURED: 1, MODELLED: 1 });
assert.deepEqual(capsCounts('status NEEDS INPUT, then NEEDS INPUT'), { 'NEEDS INPUT': 2 }, 'a two-word label counts once per occurrence');
assert.deepEqual(capsCounts('NEEDS  INPUT'), {}, 'only the exact label');
assert.deepEqual(capsCounts('GREEN_CHECK and AGREEN and status_GREEN'), {}, 'GREEN inside an identifier or word is not the label');
assert.deepEqual(capsCounts('CI is GREEN'), { GREEN: 1 });
console.log('caps test (NEEDS INPUT, GREEN) passed');
