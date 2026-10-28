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

/** The catalogues the pages and the Studio load at run time (`<site>/i18n/<lang>/<file>`, web/studio/lib/l10n-boot.mjs): English and each built language.
 *  The build does not stage them by itself; this does, for a deploy that serves translated scripts. Returns the bytes written. */
export const RUNTIME_CATALOGUES = ['ui.ftl', 'glossary.ftl', 'studio-js.ftl', 'studio-pages.ftl', 'site-js.ftl', 'engine.ftl'];
export function stageCatalogues(root, tree, langs) {
  let bytes = 0;
  for (const lang of ['en', ...langs.filter((l) => l && l !== 'en')]) {
    for (const f of RUNTIME_CATALOGUES) {
      const src = join(root, lang, f);
      if (!existsSync(src)) continue;
      const dst = join(tree, 'i18n', lang, f);
      mkdirSync(dirname(dst), { recursive: true });
      copyFileSync(src, dst);
      bytes += statSync(dst).size;
    }
  }
  return bytes;
}
