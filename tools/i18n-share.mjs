// One copy of the engine package in the deploy tree. build.sh stages the wasm-pack package twice, at web/pkg (the public address
// kshana.dev/pkg/) and at web/studio/pkg (where the Studio imports it from): two byte-identical 17.9 MB wasm files. The deploy keeps
// the public one and makes the Studio read it: studio/pkg/kshana.js becomes a re-export of /pkg/kshana.js, the Studio's three
// `new URL("<rel>/pkg/kshana_bg.wasm", import.meta.url)` fetches point at /pkg/kshana_bg.wasm, and studio/pkg/kshana_bg.wasm is dropped.
// Nothing the visitor sees changes. Run on the deploy tree after the build, never on web/ (the committed sources stay as they are).

import { readFileSync, writeFileSync, existsSync, readdirSync, rmSync, statSync, mkdirSync, copyFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { createHash } from 'node:crypto';

const sha = (p) => createHash('sha256').update(readFileSync(p)).digest('hex');
const WASM_URL = /new URL\((["'])(?:\.{1,2}\/)+pkg\/kshana_bg\.wasm\1, import\.meta\.url\)/g;
export const SHIM = '// Deploy shim (tools/i18n.mjs share-engine): the engine package is served once, from /pkg/.\nexport * from "/pkg/kshana.js";\nexport { default } from "/pkg/kshana.js";\n';

function walkText(dir, skip, out = []) {
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    if (e.isDirectory()) { if (!skip.has(e.name)) walkText(join(dir, e.name), skip, out); continue; }
    if (/\.(m?js|html)$/.test(e.name)) out.push(join(dir, e.name));
  }
  return out;
}

/** Returns { saved, rewritten, status }. Throws when the two copies differ or a Studio file still names the Studio's own wasm. */
export function shareEngine(tree) {
  const pub = join(tree, 'pkg'), stu = join(tree, 'studio', 'pkg');
  const w = 'kshana_bg.wasm';
  if (!existsSync(join(stu, w))) return { saved: 0, rewritten: [], status: existsSync(join(stu, 'kshana.js')) && readFileSync(join(stu, 'kshana.js'), 'utf8') === SHIM ? 'already shared' : 'no studio/pkg wasm' };
  if (!existsSync(join(pub, w)) || !existsSync(join(pub, 'kshana.js'))) throw new Error('share-engine: pkg/kshana_bg.wasm and pkg/kshana.js are missing from the tree (run build.sh first)');
  if (sha(join(stu, w)) !== sha(join(pub, w))) throw new Error('share-engine: studio/pkg/kshana_bg.wasm differs from pkg/kshana_bg.wasm, so it cannot be shared');
  if (sha(join(stu, 'kshana.js')) !== sha(join(pub, 'kshana.js'))) throw new Error('share-engine: studio/pkg/kshana.js differs from pkg/kshana.js, so it cannot be shared');
  const files = walkText(join(tree, 'studio'), new Set(['pkg', 'recorded', 'data', 'native', 'trust', 'replay']));
  const plan = [];
  for (const f of files) {
    const t = readFileSync(f, 'utf8');
    if (!t.includes('kshana_bg.wasm')) continue;
    const n = t.replace(WASM_URL, 'new URL("/pkg/kshana_bg.wasm", import.meta.url)');
    const left = n.split(w).length - 1, done = (n.match(/new URL\("\/pkg\/kshana_bg\.wasm", import\.meta\.url\)/g) || []).length;
    if (left !== done) throw new Error(`share-engine: ${f} names the engine file in a form this tool does not rewrite`);
    if (n !== t) plan.push([f, n]);
  }
  if (!plan.length) throw new Error('share-engine: no Studio file fetches pkg/kshana_bg.wasm; refusing to delete the Studio copy');
  const before = statSync(join(stu, w)).size + statSync(join(stu, 'kshana.js')).size;
  for (const [f, n] of plan) writeFileSync(f, n);
  writeFileSync(join(stu, 'kshana.js'), SHIM);
  rmSync(join(stu, w));
  return { saved: before - SHIM.length, rewritten: plan.map(([f]) => f.slice(tree.length + 1)), status: 'shared' };
}

/** The engine's catalogue (the file name; English is built into the engine, so it is staged for built languages only). */
export const ENGINE_CATALOGUE = 'engine.ftl';
/** The catalogues the browser fetches at run time (`<site>/i18n/<lang>/<file>`), for English and each built language.
 *  Who fetches what (web/studio/lib/l10n-boot.mjs makes the loader; web/studio/lib/l10n.mjs `load` fetches `${base}${lang}/${file}`):
 *    ui.ftl, glossary.ftl      every Studio page (default `files`) and every translated site page (kshanaL10nFiles, tools/i18n-site.mjs)
 *    studio-js.ftl, studio-pages.ftl   the Studio pages only (the default `files` of createL10n)
 *    site-js.ftl               the translated site pages only (kshanaL10nFiles = ui, glossary, site-js)
 *  The language and English are both loaded (English is the per-id fallback), so each of these five exists for `en` and for every built language.
 *    engine.ftl                the Studio's engine text: a non-English Studio page fetches /i18n/<lang>/engine.ftl once the WebAssembly engine has loaded and
 *                              registers it (register_catalogue; web/studio/lib/engine-text.mjs, l10n.mjs `registerCurrent`). Built languages only: the English
 *                              catalogue is compiled into the engine and register_catalogue refuses "en", so an English page never fetches one and none ships.
 *  Not fetched, so not shipped: data.ftl and pages/*.ftl (applied into static files at build time). The tests pin this list against the sources. */
export const RUNTIME_CATALOGUES = ['ui.ftl', 'glossary.ftl', 'studio-js.ftl', 'studio-pages.ftl', 'site-js.ftl', ENGINE_CATALOGUE];

/** A catalogue without comments and blank lines: the same messages, terms and attributes (the test compares both with @fluent/syntax).
 *  Comment lines start in column 0 with `#`; a blank line is kept only where the next non-blank line is indented, because there it
 *  belongs to a multi-line pattern. */
export function stripFtl(text) {
  const lines = text.split('\n');
  const out = [];
  for (let i = 0; i < lines.length; i++) {
    const l = lines[i];
    if (/^#/.test(l)) continue;
    if (/^\s*$/.test(l)) {
      let j = i + 1;
      while (j < lines.length && /^\s*$/.test(lines[j])) j++;
      if (out.length && j < lines.length && /^[ \t]/.test(lines[j])) out.push('');
      continue;
    }
    out.push(l);
  }
  return out.join('\n') + '\n';
}

export function stageCatalogues(root, tree, langs) {
  let bytes = 0;
  for (const lang of ['en', ...langs.filter((l) => l && l !== 'en')]) {
    for (const f of RUNTIME_CATALOGUES) {
      if (f === ENGINE_CATALOGUE && lang === 'en') continue;
      const src = join(root, lang, f);
      if (!existsSync(src)) continue;
      const dst = join(tree, 'i18n', lang, f);
      mkdirSync(dirname(dst), { recursive: true });
      writeFileSync(dst, stripFtl(readFileSync(src, 'utf8')));
      bytes += statSync(dst).size;
    }
  }
  return bytes;
}

/** The per-language copies of data files that a page can request (lib/t.mjs fetchData / importData; a translated page /<lang>/... resolves the
 *  relative path to its own copy, the Studio asks /<lang>/studio/<path>). Consumers, from the sources:
 *    data/series.json                      web/site.js, web/js/missions.mjs (fetchData)
 *    data/search.json                      web/site.js (fetchData)
 *    assets/capabilities/capabilities.json web/js/cap-hero.mjs, web/js/capabilities.mjs (fetchData)
 *    js/evidence-data.mjs, js/developers-data.mjs, js/missions-runs.mjs   web/js/{evidence,developers,missions}.mjs (importData)
 *    studio/channels.json                  web/studio/app.js, advanced.js (fetchData("channels.json") from /studio/)
 *    data/verification-matrix.json         web/studio/app.js, advanced.js (fetchData("/data/verification-matrix.json"): the shared ledger at the
 *                                          site root, so /<lang>/studio/ reads /<lang>/data/verification-matrix.json; the Studio's own
 *                                          studio/data/verification-matrix.json is the English fallback for a Studio served on its own)
 *  Every other file i18n/data-spec.json lists is applied at build time or read only in English:
 *  data/card-matrix-map.json, data/standards-matrix-map.json (no fetchData or importData names them), studio/data/capabilities.json (nothing reads it),
 *  studio/data/areas.json (read with a plain fetch, so always the English file). */
export const RUNTIME_DATA = ['data/series.json', 'data/search.json', 'assets/capabilities/capabilities.json', 'js/evidence-data.mjs', 'js/developers-data.mjs', 'js/missions-runs.mjs', 'studio/channels.json', 'data/verification-matrix.json'];

/** Remove the language copies no page requests (run after `verify`). Returns { removed: [path], bytes }. */
export function pruneData(tree, langs, specFile) {
  const spec = JSON.parse(readFileSync(specFile, 'utf8'));
  const drop = spec.files.map((f) => f.file).filter((f) => !RUNTIME_DATA.includes(f));
  let bytes = 0; const removed = [];
  for (const lang of langs) for (const f of drop) {
    const p = join(tree, lang, f);
    if (!existsSync(p)) continue;
    bytes += statSync(p).size; rmSync(p); removed.push(`${lang}/${f}`);
  }
  return { removed, bytes };
}
