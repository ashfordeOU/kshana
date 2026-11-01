// Size accounting of a deploy tree (tools/i18n.mjs size, check.py rule 12b).
import { readdirSync, statSync, existsSync } from 'node:fs';
import { join } from 'node:path';

/** Sizes of a tree: total, by top-level entry (a language tree is one entry), by file class, split English / language (the top-level directories named `known`). */
export function measureTree(tree, known) {
  const langSet = new Set(known);
  const CLASS = { html: 'html', json: 'json', wasm: 'wasm', png: 'image', jpg: 'image', jpeg: 'image', webp: 'image', gif: 'image', avif: 'image', svg: 'svg', woff2: 'font', woff: 'font', ttf: 'font', otf: 'font', js: 'js', mjs: 'js', css: 'css', gz: 'gz', txt: 'text', toml: 'data', csv: 'data', nmea: 'data', xml: 'xml', pdf: 'pdf' };
  const r = { total: 0, files: 0, byTop: new Map(), byClass: new Map(), byGroup: { en: 0, lang: 0 }, langs: [] };
  const go = (d, top) => {
    if (!existsSync(d)) return;
    for (const e of readdirSync(d, { withFileTypes: true })) {
      const p = join(d, e.name), t = top ?? (e.isDirectory() ? e.name : '(root files)');
      if (e.isDirectory()) { go(p, t); continue; }
      const n = statSync(p).size, isLang = langSet.has(t);
      const c = CLASS[(e.name.split('.').pop() || '').toLowerCase()] || 'other';
      r.total += n; r.files++; r.byTop.set(t, (r.byTop.get(t) || 0) + n);
      const g = r.byClass.get(c) || { en: 0, lang: 0 }; g[isLang ? 'lang' : 'en'] += n; r.byClass.set(c, g);
      r.byGroup[isLang ? 'lang' : 'en'] += n;
      if (isLang && !r.langs.includes(t)) r.langs.push(t);
    }
  };
  go(tree, null);
  return r;
}
