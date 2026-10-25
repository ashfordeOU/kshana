// Translation side of tools/i18n.mjs: load catalogues, apply them to the English tree, check, status, pseudo-locale.
// Pure functions of the English tree plus i18n/ (design v2, sections 2, 3, 5, 6, 8).

import { createHash } from 'node:crypto';
import { readFileSync, writeFileSync, mkdirSync, existsSync, readdirSync, copyFileSync, statSync } from 'node:fs';
import { join, dirname, relative, sep, posix } from 'node:path';
import { fileURLToPath } from 'node:url';
import { FluentBundle, FluentResource } from './vendor/fluent-bundle-0.19.1.mjs';
import { FluentParser, Junk, Message, Term, Pattern, Placeable, StringLiteral, VariableReference, TermReference, SelectExpression, TextElement } from './vendor/fluent-syntax-0.19.0.mjs';

export const LANGS = ['nl', 'pl', 'pt-BR', 'pt-PT', 'fi', 'sv', 'da', 'nb', 'cs', 'uk', 'ru', 'de', 'fr', 'es', 'et', 'ja', 'zh-Hans'];
// Plural categories a select needs per language (Intl is the authority; this is the fallback list for pt-PT, nb and the like).
export const BCP47 = { 'pt-BR': 'pt-BR', 'pt-PT': 'pt-PT', nb: 'nb', 'zh-Hans': 'zh-Hans' };
const parser = new FluentParser({ withSpans: false });

export const sha12 = (s) => createHash('sha256').update(s).digest('hex').slice(0, 12);
export const readText = (p) => readFileSync(p, 'utf8');
export const NUMLIT_RE = /^[\d.,   ]+$/;

/** Locale symbols for number text: {group, decimal}. */
export function symbols(lang) {
  const parts = new Intl.NumberFormat(BCP47[lang] || lang).formatToParts(1234567.8);
  return { group: parts.find((p) => p.type === 'group')?.value ?? ',', decimal: parts.find((p) => p.type === 'decimal')?.value ?? '.' };
}

/** English-format number text -> the locale's separators (digits unchanged, grouping only where English grouped). */
export function localiseNumber(text, lang) {
  if (!NUMLIT_RE.test(text) || /^\d+(\.\d+){2,}$/.test(text)) return text;
  const { group, decimal } = symbols(lang);
  // English: "," groups when followed by exactly three digits and preceded by digits; "." is the decimal mark.
  return text.replace(/[.,   ]/g, (c) => (c === '.' ? decimal : group));
}

/** Parse an .ftl file; returns {ast, junk}. */
export function parseFtl(text) {
  const ast = parser.parse(text);
  return { ast, junk: ast.body.filter((e) => e instanceof Junk) };
}

/** Catalogue of one language and one page: the glossary, ui and page resources, with number literals localised. */
export function bundleFor(lang, files) {
  const b = new FluentBundle(BCP47[lang] || lang, {
    useIsolating: false,
    functions: { NUMLIT: ([s]) => localiseNumber(String(s), lang) },
  });
  for (const f of files) {
    if (!f || !existsSync(f)) continue;
    const text = readText(f).replace(/\{ "([\d.,   ]+)" \}/g, (m, n) => (/^\d+(\.\d+){2,}$/.test(n) ? m : `{ NUMLIT("${n}") }`));
    b.addResource(new FluentResource(text), { allowOverrides: true });
  }
  return b;
}

const htmlEsc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const attrEsc = (s) => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;');

/** Render a translated message string (numbered tags) to HTML with the English element's own tags. Throws on a bad tag. */
export function renderHtml(str, tags) {
  const re = /<(\/?)(a\d+|s\d+|b|em)>|<(c\d+)\/>|<br\/>/g;
  let out = '', last = 0, m;
  const open = [];
  while ((m = re.exec(str))) {
    out += htmlEsc(str.slice(last, m.index));
    last = re.lastIndex;
    if (m[0] === '<br/>') out += '<br>';
    else if (m[3]) { if (!tags[m[3]]) throw new Error(`unknown tag <${m[3]}/>`); out += tags[m[3]].h; }
    else if (m[1]) { const t = open.pop(); if (t !== m[2]) throw new Error(`mismatched </${m[2]}>`); out += tags[t].c; }
    else { if (!tags[m[2]]) throw new Error(`unknown tag <${m[2]}>`); open.push(m[2]); out += tags[m[2]].o; }
  }
  out += htmlEsc(str.slice(last));
  if (open.length) throw new Error(`unclosed <${open.at(-1)}>`);
  return out;
}

export const slugOf = (rel) => rel.replace(/\.html$/, '').split(/[\\/]/).join('--');
export const segId = (s) => 'seg-' + sha12(s.skel + '\0' + s.codes.join('\0'));

/** Files that make up the catalogue of a page in a language. */
export const catalogueFiles = (root, lang, rel) => [
  join(root, lang, 'glossary.ftl'), join(root, lang, 'ui.ftl'),
  join(root, lang, 'pages', '_shared.ftl'), join(root, lang, 'pages', slugOf(rel) + '.ftl'),
];

/** Replace segments in html by their translations. Returns {html, translated, missing, errors}. */
export function applyPage({ html, segs, bundle, lang }) {
  const edits = [];
  let translated = 0, missing = 0;
  const errors = [];
  const text = [], attrs = [];
  const format = (s) => {
    const id = segId(s);
    const msg = bundle.getMessage(id);
    if (!msg || !msg.value) return null;
    const errs = [];
    let str;
    try { str = bundle.formatPattern(msg.value, {}, errs); } catch (e) { errors.push(`${id}: ${e.message}`); return null; }
    if (errs.length) { errors.push(`${id}: ${errs[0].message}`); return null; }
    return str;
  };
  // pass 1: text segments (rendered after the attributes inside them are applied to their English tags)
  for (const s of segs) if (!s.attr) { const str = format(s); text.push({ s, str }); }
  // pass 2: attributes (last in the document first, so offsets inside a kept element stay valid); one inside a translated
  // text segment is written into that segment's own tag, and several on one tag compose
  const own = new Map(); // tag offset -> current tag text of a standalone edit
  const done = new Set();
  for (const s of segs.filter((x) => x.attr).sort((x, y) => y.at - x.at)) {
    const str = format(s);
    if (str === null) { missing++; continue; }
    const re = new RegExp(`(\\s${s.attr}\\s*=\\s*)("[^"]*"|'[^']*')`, 'i');
    const put = (tag) => tag.replace(re, (_, a) => `${a}"${attrEsc(str)}"`);
    const owner = text.find((t) => t.str !== null && s.at >= t.s.start && s.at < t.s.end);
    if (owner) {
      let ok = false;
      for (const tg of Object.values(owner.s.tags)) {
        if (tg.o !== undefined && tg.at === s.at) { tg.o = put(tg.o); ok = true; break; }
        if (tg.h !== undefined && s.at >= tg.at && s.at < tg.at + tg.h.length) {
          const off = s.at - tg.at;
          const cur = tg.h.slice(off).match(/^<[^>]*>/)[0];
          tg.h = tg.h.slice(0, off) + put(cur) + tg.h.slice(off + cur.length);
          ok = true; break;
        }
      }
      if (ok) { translated++; continue; }
    }
    own.set(s.at, put(own.get(s.at) ?? html.slice(s.at).match(/^<[^>]*>/)[0]));
    translated++;
  }
  for (const [at, nt] of own) edits.push({ start: at, end: at + html.slice(at).match(/^<[^>]*>/)[0].length, text: nt });
  // pass 3: text segments
  for (const { s, str } of text) {
    if (str === null) { missing++; continue; }
    try { edits.push({ start: s.start, end: s.end, text: renderHtml(str, s.tags) }); translated++; }
    catch (e) { errors.push(`${segId(s)}: ${e.message}`); missing++; }
  }
  edits.sort((a, b) => b.start - a.start);
  let out = html;
  let lastStart = Infinity;
  for (const e of edits) {
    if (e.end > lastStart) { errors.push(`overlapping edits at ${e.start}`); continue; }
    out = out.slice(0, e.start) + e.text + out.slice(e.end);
    lastStart = e.start;
  }
  return { html: out, translated, missing, errors };
}

/** ---- check ---- */

const PLURAL_NEEDS = (lang) => new Intl.PluralRules(BCP47[lang] || lang).resolvedOptions().pluralCategories;
const TOKENS = ['NOT CORROBORATED', 'NOT MET', 'VALIDATED', 'MODELLED', 'PARTNER', 'EXPLORATORY', 'MET', 'PREDICTION', 'CORROBORATED', 'REFUSED', 'DEGRADED', 'DEFICIENT', 'OBSERVED', 'LOST', 'MISMATCH', 'VERIFIED', 'CONSISTENT', 'INCONSISTENT'];

/** What a message must keep: variables, terms, string literals, and (for page text) tags. */
export function signature(entry) {
  const vars = [], terms = [], lits = [], selects = [];
  const walk = (n) => {
    if (!n) return;
    if (n instanceof Pattern) n.elements.forEach(walk);
    else if (n instanceof Placeable) walk(n.expression);
    else if (n instanceof VariableReference) vars.push(n.id.name);
    else if (n instanceof TermReference) terms.push(n.id.name + (n.attribute ? '.' + n.attribute.name : ''));
    else if (n instanceof StringLiteral) lits.push(n.value);
    else if (n instanceof SelectExpression) { selects.push(n); walk(n.selector); n.variants.forEach((v) => walk(v.value)); }
    else if (n.expression) walk(n.expression);
  };
  walk(entry.value);
  for (const a of entry.attributes || []) walk(a.value);
  return { vars: [...new Set(vars)].sort(), terms: [...new Set(terms)].sort(), lits: lits.sort(), selects };
}
const textOfPattern = (p) => (p ? p.elements.filter((e) => e instanceof TextElement).map((e) => e.value).join(' ') : '');
const tagsOf = (str) => (str.match(/<\/?(?:a\d+|s\d+|b|em)>|<c\d+\/>|<br\/>/g) || []).sort().join(' ');
const digits = (t) => (t.replace(/<[^>]*>/g, ' ').match(/\d+/g) || []).sort().join(' ');

function entriesOf(file) {
  if (!existsSync(file)) return null;
  const { ast, junk } = parseFtl(readText(file));
  return { map: new Map(ast.body.filter((e) => e instanceof Message || e instanceof Term).map((e) => [(e instanceof Term ? '-' : '') + e.id.name, e])), junk };
}

/** Check one language against English. Returns {errors:[], warnings:[], stats}. */
export function checkLang(root, lang) {
  const errors = [], warnings = [];
  const need = PLURAL_NEEDS(lang);
  const names = ['ui.ftl', 'glossary.ftl'];
  const langDir = join(root, lang);
  const files = [];
  for (const n of names) files.push(n);
  const pdir = join(langDir, 'pages');
  if (existsSync(pdir)) for (const f of readdirSync(pdir)) if (f.endsWith('.ftl')) files.push('pages/' + f);
  const engine = existsSync(join(langDir, 'engine.ftl')) ? ['engine.ftl'] : [];
  const gloss = entriesOf(join(langDir, 'glossary.ftl'));
  const enGloss = entriesOf(join(root, 'en', 'glossary.ftl'));
  const render = (id) => { // the language's rendering of a tier or verdict token
    const e = (gloss && gloss.map.get(id)) || enGloss.map.get(id);
    return e ? textOfPattern(e.value) : null;
  };
  const tokenTerm = (t) => '-' + (['VALIDATED', 'MODELLED', 'PARTNER', 'EXPLORATORY'].includes(t) ? 'tier-' : ['MET', 'NOT MET'].includes(t) ? 'verdict-' : 'status-') + t.toLowerCase().replace(/ /g, '-');
  let n = 0;
  for (const f of [...files, ...engine]) {
    const en = entriesOf(join(root, 'en', f));
    const tr = entriesOf(join(langDir, f));
    if (!tr) continue;
    for (const j of tr.junk) errors.push(`${lang}/${f}: syntax error near "${j.content.split('\n')[0].slice(0, 60)}"`);
    if (!en) { warnings.push(`${lang}/${f}: no English file`); continue; }
    for (const [id, e] of tr.map) {
      n++;
      const src = en.map.get(id);
      if (!src) { warnings.push(`${lang}/${f}: orphan id ${id}`); continue; }
      const a = signature(src), b = signature(e);
      const here = `${lang}/${f}: ${id}`;
      if (a.vars.join() !== b.vars.join()) errors.push(`${here}: variables differ (English: ${a.vars.join(', ') || 'none'}; here: ${b.vars.join(', ') || 'none'})`);
      if (a.lits.join('\0') !== b.lits.join('\0')) errors.push(`${here}: string-literal placeables differ (numbers, versions and symbols must be kept)`);
      for (const t of a.terms) if (!b.terms.includes(t) && f !== 'glossary.ftl' && !/^-(tier|verdict|status)-/.test(id)) { /* a term may be replaced by its rendering; checked by token below */ }
      for (const sel of b.selects) {
        const keys = sel.variants.map((v) => (v.key.name ? v.key.name : null)).filter(Boolean);
        const def = sel.variants.find((v) => v.default)?.key.name;
        const have = new Set([...keys, def]);
        if (/^\$/.test('$') && sel.selector instanceof VariableReference) for (const c of need) if (!have.has(c)) errors.push(`${here}: select lacks the plural category [${c}] (${lang} needs ${need.join(', ')})`);
      }
      if (f.startsWith('pages/') || f === 'ui.ftl') {
        const enText = flat(src), trText = flat(e);
        if (tagsOf(enText) !== tagsOf(trText) && !a.selects.length) errors.push(`${here}: markup tags differ (English: ${tagsOf(enText) || 'none'}; here: ${tagsOf(trText) || 'none'})`);
        if (f.startsWith('pages/') && digits(strip(enText)) !== digits(strip(trText))) errors.push(`${here}: digits in the text differ from the English (numbers must stay in their placeables)`);
        if (f.startsWith('pages/')) for (const t of TOKENS) {
          const re = new RegExp(`(?<![A-Z])${t}(?![A-Z])`);
          const en2 = t === 'MET' ? enText.replace(/NOT MET/g, '') : enText;
          if (re.test(en2)) { const r = render(tokenTerm(t)); if (r && !trText.includes(r) && !(t === 'MET' && trText.includes('NOT MET'))) errors.push(`${here}: the term ${t} must appear as "${r}"`); }
        }
      }
    }
  }
  return { errors, warnings, count: n };
}
const flat = (e) => e.value ? e.value.elements.map((x) => (x instanceof TextElement ? x.value : x instanceof Placeable && x.expression instanceof StringLiteral ? `{ "${x.expression.value}" }` : x instanceof Placeable && x.expression instanceof TermReference ? `{ -${x.expression.id.name} }` : '')).join('') : '';
const strip = (t) => t.replace(/\{ "[^"]*" \}/g, ' ').replace(/\{ -[\w-]+ \}/g, ' ');

/** ---- status ---- */

export function statusLang(root, lang) {
  const idx = JSON.parse(readText(join(root, 'en', 'pages', '_index.json')));
  const have = new Map();
  const load = (f) => {
    const p = join(root, lang, 'pages', f);
    if (!existsSync(p)) return new Set();
    if (!have.has(f)) have.set(f, new Set(parseFtl(readText(p)).ast.body.filter((e) => e instanceof Message).map((e) => e.id.name)));
    return have.get(f);
  };
  const shared = load('_shared.ftl');
  const sharedEn = new Set(idx.shared);
  const rows = [];
  const seenT = new Set(), seenM = new Set();
  let T = 0, M = 0;
  for (const [rel, info] of Object.entries(idx.pages)) {
    const own = load(slugOf(rel) + '.ftl');
    let t = 0, m = 0;
    for (const id of info.segments) if ((sharedEn.has(id) ? shared : own).has(id)) { t++; seenT.add(id); } else { m++; seenM.add(id); }
    rows.push({ page: rel, translated: t, missing: m, started: own.size > 0 || t > 0 });
  }
  const orphans = [];
  for (const [f, ids] of have) {
    const enp = join(root, 'en', 'pages', f);
    if (!existsSync(enp)) { orphans.push(`${f}: no English file`); continue; }
    const en = new Set(parseFtl(readText(enp)).ast.body.filter((e) => e instanceof Message).map((e) => e.id.name));
    for (const id of ids) if (!en.has(id)) orphans.push(`${f}:${id}`);
  }
  return { lang, translated: seenT.size, missing: seenM.size, total: seenT.size + seenM.size, pagesNotStarted: rows.filter((r) => !r.started).length, orphans, rows };
}

/** ---- pseudo-locale ---- */

const ACCENT = { a: 'à', b: 'ƀ', c: 'ç', d: 'ď', e: 'é', f: 'ƒ', g: 'ĝ', h: 'ĥ', i: 'ï', j: 'ĵ', k: 'ķ', l: 'ļ', m: 'ɱ', n: 'ñ', o: 'ö', p: 'þ', q: 'ɋ', r: 'ŕ', s: 'š', t: 'ţ', u: 'ü', v: 'ṽ', w: 'ŵ', x: 'ẋ', y: 'ý', z: 'ž',
  A: 'À', B: 'Ɓ', C: 'Ç', D: 'Ď', E: 'É', F: 'Ƒ', G: 'Ĝ', H: 'Ĥ', I: 'Ï', J: 'Ĵ', K: 'Ķ', L: 'Ļ', M: 'Ṁ', N: 'Ñ', O: 'Ö', P: 'Þ', Q: 'Ɋ', R: 'Ŕ', S: 'Š', T: 'Ţ', U: 'Ü', V: 'Ṽ', W: 'Ŵ', X: 'Ẍ', Y: 'Ý', Z: 'Ž' };

/** Accent and lengthen the translatable text of one message value line; placeables, tags and all-caps tokens are left alone. */
export function pseudoText(text) {
  const keep = /(\{[^{}]*\}|<[^<>]*>|\b[A-Z]{3,}(?: [A-Z]{2,})*\b)/g;
  const parts = text.split(keep);
  let out = '', letters = 0;
  for (let i = 0; i < parts.length; i++) {
    const p = parts[i];
    if (i % 2) { out += p; continue; }
    out += p.replace(/\p{L}/gu, (c) => { letters++; return ACCENT[c] ?? c; });
  }
  const pad = Math.min(Math.round(letters * 0.35), 60); // breakable padding: runs of up to 5 tildes between spaces
  const runs = []; for (let n = pad; n > 0; n -= 5) runs.push('~'.repeat(Math.min(5, n)));
  return out + (runs.length ? ' ' + runs.join(' ') : '');
}

/** Pseudo-locale catalogue text from an English .ftl text: values wrapped in ⟦ ⟧, structure untouched. */
export function pseudoFtl(text) {
  const out = [];
  for (const line of text.split('\n')) {
    let m;
    if (/^\s*#/.test(line) || !line.trim()) { out.push(line); continue; }
    if ((m = line.match(/^(-?[\w-]+\s*=\s*)(.*)$/)) && m[2]) { out.push(m[1] + '⟦' + pseudoText(m[2]) + '⟧'); continue; }
    if ((m = line.match(/^(\s*\.[\w-]+\s*=\s*)(.*)$/)) && m[2]) { out.push(m[1] + '⟦' + pseudoText(m[2]) + '⟧'); continue; }
    if ((m = line.match(/^(\s*\*?\[[^\]]+\]\s*)(.*)$/))) { out.push(m[1] + '⟦' + pseudoText(m[2]) + '⟧'); continue; }
    if (/^\s*\{.*->\s*$/.test(line) || /^\s*\}\s*$/.test(line)) { out.push(line); continue; }
    if (/^\s+\S/.test(line)) { out.push(line.replace(/^(\s+)(.*)$/, (_, a, b) => a + '⟦' + pseudoText(b) + '⟧')); continue; }
    out.push(line);
  }
  return out.join('\n');
}
