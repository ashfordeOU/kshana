#!/usr/bin/env node
// First-paint map test: the Studio's inline script writes "Recorded result · v<version>" before the modules load; the build puts the
// per-language words in the page head (tools/i18n.mjs firstpaint). Checks the map for en-XA and de against the catalogues, that the English
// the script falls back to is byte-identical to the English catalogue and to the old literal, and the language choice (?lang=, stored, browser).
//   node tools/i18n-firstpaint-test.mjs [--studio web/studio/index.html] [--root i18n]   (run `node tools/i18n.mjs pseudo` first for en-XA)
import { readFileSync, writeFileSync, mkdirSync, mkdtempSync, rmSync, existsSync } from 'node:fs';
import { join } from 'node:path';
import { tmpdir } from 'node:os';
import vm from 'node:vm';
import { firstpaintTree, FP_IDS } from './i18n.mjs';
import { bundleFor } from './i18n-lang.mjs';

const argv = process.argv.slice(2);
const opt = (k, d) => (argv.includes(k) ? argv[argv.indexOf(k) + 1] : d);
const studio = opt('--studio', 'web/studio/index.html'), root = opt('--root', 'i18n');
let fail = 0;
const ok = (c, m) => { if (!c) { fail++; console.log('FAIL ' + m); } };

const tree = mkdtempSync(join(tmpdir(), 'fp-'));
mkdirSync(join(tree, 'studio'), { recursive: true });
const src = readFileSync(studio, 'utf8');
const langs = ['de', 'fr', 'ja', 'pt-BR', 'zh-Hans', ...(existsSync(join(root, 'en-XA', 'studio-js.ftl')) ? ['en-XA'] : [])];
for (const l of langs) { mkdirSync(join(tree, l, 'studio'), { recursive: true }); writeFileSync(join(tree, l, 'studio', 'index.html'), '<!doctype html>'); }
writeFileSync(join(tree, 'studio', 'index.html'), src);

try {
  const built = await firstpaintTree(tree, root);
  ok(built && langs.every((l) => built.includes(l)), `map has ${langs.join(', ')} (got ${built})`);
  const html = readFileSync(join(tree, 'studio', 'index.html'), 'utf8');
  ok(html.indexOf('id="kshana-fp"') > html.indexOf('<meta charset') && html.indexOf('id="kshana-fp"') < html.indexOf('</head>'), 'the map sits after the charset meta, inside the head');
  await firstpaintTree(tree, root);
  ok(readFileSync(join(tree, 'studio', 'index.html'), 'utf8') === html, 'a second run changes nothing');

  const mapText = /<script id="kshana-fp">([\s\S]*?)<\/script>/.exec(html)[1];
  const sandbox = { window: {} };
  vm.runInNewContext(mapText, sandbox);
  const map = sandbox.window.kshanaFP;
  for (const l of langs) {
    const b = bundleFor(l, [join(root, l, 'studio-js.ftl')]);
    for (const [k, id] of Object.entries(FP_IDS)) {
      const want = b.formatPattern(b.getMessage(id).value, { version: '%V' });
      ok(map[l] && map[l][k] === want && want.includes('%V'), `${l} ${k}: ${map[l] && map[l][k]} vs ${want}`);
    }
  }
  ok(/Aufgezeichnetes Ergebnis · v%V$/.test(map.de.r) && /· Engine wird geladen$/.test(map.de.l), 'de words');
  ok(!map['en-XA'] || (map['en-XA'].r.startsWith('⟦') && map['en-XA'].l.startsWith('⟦') && map['en-XA'].l.length > map['en-XA'].r.length), 'en-XA words are the pseudo-locale (⟦ ⟧, longer)');

  // The English: the code's fallback is the old literal and the catalogue's English.
  const en = readFileSync(join(root, 'en', 'studio-js.ftl'), 'utf8');
  const enMsg = (id) => new RegExp('^' + id + ' = (.*)$', 'm').exec(en)[1].replace('{ $version }', '%V');
  ok(src.includes(`fpText("r", "${enMsg(FP_IDS.r)}", d.engine_version)`) && src.includes(`fpText("l", "${enMsg(FP_IDS.l)}", d.engine_version)`), 'the inline English equals the English catalogue');

  // Run the page's own fpText.
  const fnSrc = /function fpText\(kind, en, v\) \{[\s\S]*?\n  \}\n/.exec(src)[0];
  const run = (win, { search = '', store = null, langsList = ['en-US'] } = {}, kind = 'r') => {
    const ctx = { window: win, location: { search }, localStorage: { getItem: (k) => (k === 'kshana-lang' ? store : null) }, navigator: { languages: langsList, language: langsList[0] } };
    vm.runInNewContext(fnSrc, ctx);
    return vm.runInNewContext(`fpText(${JSON.stringify(kind)}, ${JSON.stringify(kind === 'r' ? 'Recorded result · v%V' : 'Recorded result · v%V · engine loading')}, "0.40.0")`, ctx);
  };
  const E = 'Recorded result · v0.40.0', EL = 'Recorded result · v0.40.0 · engine loading';
  ok(run({}) === E && run({}, {}, 'l') === EL, 'no map: English, byte-identical');
  ok(run({}, { search: '?lang=de', store: 'de' }) === E, 'no map and ?lang=de: still English');
  const w = { kshanaFP: map };
  ok(run(w) === E && run(w, {}, 'l') === EL, 'map, English browser: English');
  ok(run(w, { search: '?lang=de' }) === 'Aufgezeichnetes Ergebnis · v0.40.0', '?lang=de');
  ok(run(w, { search: '?lang=de' }, 'l') === 'Aufgezeichnetes Ergebnis · v0.40.0 · Engine wird geladen', '?lang=de, loading chip');
  ok(run(w, { store: 'fr' }) === map.fr.r.replace('%V', '0.40.0'), 'stored fr');
  ok(run(w, { store: 'en', langsList: ['de'] }) === E, 'stored English beats the browser');
  ok(run(w, { search: '?lang=ja', store: 'fr' }) === map.ja.r.replace('%V', '0.40.0'), '?lang beats the stored choice');
  ok(run(w, { langsList: ['de-AT'] }) === map.de.r.replace('%V', '0.40.0'), 'browser de-AT gives de');
  ok(run(w, { langsList: ['pt'] }) === map['pt-BR'].r.replace('%V', '0.40.0'), 'browser pt gives pt-BR');
  ok(run(w, { langsList: ['zh-CN'] }) === map['zh-Hans'].r.replace('%V', '0.40.0'), 'browser zh-CN gives zh-Hans');
  ok(run(w, { langsList: ['zh-TW'] }) === E, 'browser zh-TW gives English');
  ok(run(w, { langsList: ['xx', 'fr'] }) === map.fr.r.replace('%V', '0.40.0'), 'browser xx, fr gives fr');
  ok(run(w, { langsList: ['nl'] }) === E, 'a language without a map entry: English');
  ok(run(w, { search: '?lang=xx' }) === E, 'an unknown ?lang: English');
  if (map['en-XA']) ok(run(w, { search: '?lang=en-XA' }) === map['en-XA'].r.replace('%V', '0.40.0'), '?lang=en-XA');
  ok(run({ kshanaFP: { de: { r: 'x$&%V', l: 'y' } } }, { search: '?lang=de' }) === 'x$&0.40.0', 'a replacement pattern in a translation is not interpreted');
} finally { rmSync(tree, { recursive: true, force: true }); }
console.log(fail ? `first-paint: ${fail} failures` : 'first-paint: all checks passed');
process.exit(fail ? 1 : 0);
