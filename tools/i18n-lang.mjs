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
export function bundleFor(lang, files, { localise = true } = {}) {
  const b = new FluentBundle(BCP47[lang] || lang, {
    useIsolating: false,
    functions: { NUMLIT: ([s]) => localiseNumber(String(s), lang) },
  });
  for (const f of files) {
    if (!f || !existsSync(f)) continue;
    const text = localise ? readText(f).replace(/\{ "([\d.,   ]+)" \}/g, (m, n) => (/^\d+(\.\d+){2,}$/.test(n) ? m : `{ NUMLIT("${n}") }`)) : readText(f); // data keeps every number exactly as written
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
export function applyPage({ html, segs, bundle, lang, vars = {} }) {
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
    try { str = bundle.formatPattern(msg.value, vars, errs); } catch (e) { errors.push(`${id}: ${e.message}`); return null; }
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
const TOKENS = ['NOT CORROBORATED', 'NOT MET', 'VALIDATED', 'MODELLED', 'PARTNER', 'EXPLORATORY', 'MET', 'PREDICTION', 'CORROBORATED', 'REFUSED', 'DEGRADED', 'DEFICIENT', 'OBSERVED', 'LOST', 'MISMATCH', 'VERIFIED', 'CONSISTENT', 'INCONSISTENT', 'ILLUSTRATIVE', 'PUBLIC', 'REPRESENTATIVE', 'WORKSHOP', 'MIXED', 'MEASURED', 'NEEDS INPUT', 'GREEN'];

/** How many times each all-caps tier, verdict and status token stands in a message text (a { -tier-modelled } term counts as its token; NOT MET is not MET).
 *  A translation must have exactly the English counts: a lowercase "validated" or "modelled" is a word and stays a word, never the label. */
export function capsCounts(text, rend = {}) {
  let t = text.replace(/\{ -(tier|verdict|status)-([a-z-]+) \}/g, (_, k, n) => n.toUpperCase().replace(/-/g, ' '));
  const out = {};
  for (const tk of TOKENS) {
    const forms = [...new Set([tk, rend[tk] || tk])];
    let c = 0;
    for (const f of forms) { let i = 0; for (;;) { i = t.indexOf(f, i); if (i < 0) break; const pre = t[i - 1] || ' ', post = t[i + f.length] || ' '; if (!/[A-Za-z_]/.test(pre) && !/[A-Za-z_]/.test(post)) c++; i += f.length; } }
    if (tk === 'MET') for (const f of new Set(['NOT MET', rend['NOT MET'] || 'NOT MET'])) { let i = 0; for (;;) { i = t.indexOf(f, i); if (i < 0) break; c--; i += f.length; } }
    if (c) out[tk] = c;
  }
  return out;
}
const capsDiff = (a, b) => { const ks = new Set([...Object.keys(a), ...Object.keys(b)]); const d = []; for (const k of ks) if ((a[k] || 0) !== (b[k] || 0)) d.push(`${k}: ${b[k] || 0} instead of ${a[k] || 0}`); return d.join(', '); };

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
/** String literals must match; a plural selector repeats a literal in every variant, so with a selector on either side compare the distinct literals. */
export const litsEqual = (a, b) => {
  const key = (x) => ((a.selects.length || b.selects.length) ? [...new Set(x.lits)] : x.lits).join('\0');
  return key(a) === key(b);
};
const textOfPattern = (p) => (p ? p.elements.filter((e) => e instanceof TextElement).map((e) => e.value).join(' ') : '');
const tagsOf = (str) => (str.match(/<\/?(?:a\d+|s\d+|b|em)>|<c\d+\/>|<br\/>/g) || []).sort().join(' ');
const digits = (t) => (t.replace(/<[^>]*>/g, ' ').match(/\d+/g) || []).sort().join(' ');

const NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty', 'hundred', 'thousand'];
const NUMBER_WORD_VALUE = { hundred: '100', thousand: '1000' };
const MONTHS = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'];
/** Digit runs a translation may add: the value of an English number word (zero to twenty, hundred, thousand) or the month
 *  number of an English month name, both in the same message ("January 29" -> "1月29日"). Everything else is rejected. */
const allowedExtraDigits = (en) => {
  const out = [];
  for (const w of en.replace(/<[^>]*>/g, ' ').toLowerCase().match(/[a-z]+/g) || []) {
    const n = NUMBER_WORDS.indexOf(w);
    if (n >= 0) out.push(NUMBER_WORD_VALUE[w] || String(n));
    const m = MONTHS.indexOf(w);
    if (m >= 0) out.push(String(m + 1));
  }
  return out;
};
/** True when the translation's digit runs are the English ones, plus only runs allowed by allowedExtraDigits (each used once). */
export const digitsOk = (en, tr) => {
  const have = (tr.replace(/<[^>]*>/g, ' ').match(/\d+/g) || []);
  const want = (en.replace(/<[^>]*>/g, ' ').match(/\d+/g) || []);
  const extra = allowedExtraDigits(en);
  for (const d of want) { const i = have.indexOf(d); if (i < 0) return false; have.splice(i, 1); }
  for (const d of have) { const i = extra.indexOf(d); if (i < 0) return false; extra.splice(i, 1); }
  return true;
};

function entriesOf(file) {
  if (!existsSync(file)) return null;
  const { ast, junk } = parseFtl(readText(file));
  return { map: new Map(ast.body.filter((e) => e instanceof Message || e instanceof Term).map((e) => [(e instanceof Term ? '-' : '') + e.id.name, e])), junk };
}

/** Check one language against English. Returns {errors:[], warnings:[], stats}. */
export function checkLang(root, lang) {
  const errors = [], warnings = [];
  const need = PLURAL_NEEDS(lang);
  const names = existsSync(join(root, 'en')) ? readdirSync(join(root, 'en')).filter((f) => f.endsWith('.ftl') && f !== 'engine.ftl').sort() : ['ui.ftl', 'glossary.ftl'];
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
  const rendMap = tokenRenderings(root, lang);
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
      if (!litsEqual(a, b)) errors.push(`${here}: string-literal placeables differ (numbers, versions and symbols must be kept)`);
      for (const t of a.terms) if (!b.terms.includes(t) && f !== 'glossary.ftl' && !/^-(tier|verdict|status)-/.test(id)) { /* a term may be replaced by its rendering; checked by token below */ }
      for (const sel of b.selects) {
        const keys = sel.variants.map((v) => (v.key.name ? v.key.name : null)).filter(Boolean);
        const def = sel.variants.find((v) => v.default)?.key.name;
        const have = new Set([...keys, def]);
        if (/^\$/.test('$') && sel.selector instanceof VariableReference) for (const c of need) if (!have.has(c)) errors.push(`${here}: select lacks the plural category [${c}] (${lang} needs ${need.join(', ')})`);
      }
      if (f.startsWith('pages/') || (f !== 'glossary.ftl' && f !== 'engine.ftl')) {
        const enText = flat(src), trText = flat(e);
        if (tagsOf(enText) !== tagsOf(trText) && !a.selects.length) errors.push(`${here}: markup tags differ (English: ${tagsOf(enText) || 'none'}; here: ${tagsOf(trText) || 'none'})`);
        if (f.startsWith('pages/') && !digitsOk(strip(enText), strip(trText))) errors.push(`${here}: digits in the text differ from the English (numbers must stay in their placeables)`);
        if (!a.selects.length) { const cd = capsDiff(capsCounts(enText), capsCounts(trText, rendMap)); if (cd) errors.push(`${here}: the tier, verdict and status words differ from the English (${cd}); a lowercase word stays a word`); }
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


/** ---- todo and merge (the translators' loop) ---- */

/** Every English page message with its comments, and where it lives: Map id -> {text, files:Set}. */
export function pageMessages(root) {
  const idx = JSON.parse(readText(join(root, 'en', 'pages', '_index.json')));
  const sharedEn = new Set(idx.shared);
  const where = new Map(); // id -> Set of file names
  for (const [rel, info] of Object.entries(idx.pages)) for (const id of info.segments) { if (!where.has(id)) where.set(id, new Set()); where.get(id).add(sharedEn.has(id) ? '_shared.ftl' : slugOf(rel) + '.ftl'); }
  const msgs = new Map(); // id -> {block (comments plus the message), entry}
  for (const f of new Set([...where.values()].flatMap((s) => [...s]))) {
    const text = readText(join(root, 'en', 'pages', f));
    const blocks = text.split(/\n\n+/);
    for (const b of blocks) { const m = /^seg-[0-9a-f]{12}/m.exec(b); if (m && !msgs.has(m[0])) msgs.set(m[0], b.trim()); }
  }
  return { where, msgs };
}

/** The English messages a language lacks, as chunks of about chunkKb: [{name, text, ids}]. A page filter is a slug prefix. */
export function todoChunks(root, lang, { chunkKb = 26, page = '' } = {}) {
  const { where, msgs } = pageMessages(root);
  const have = new Set();
  const dir = join(root, lang, 'pages');
  if (existsSync(dir)) for (const f of readdirSync(dir)) if (f.endsWith('.ftl')) for (const e of parseFtl(readText(join(dir, f))).ast.body) if (e instanceof Message) have.add(e.id.name + '@' + f);
  const need = [];
  for (const [id, files] of where) {
    if (page && ![...files].some((f) => f.startsWith(page))) continue;
    if ([...files].every((f) => have.has(id + '@' + f))) continue;
    need.push(id);
  }
  const chunks = [];
  let cur = [], size = 0;
  for (const id of need) {
    const b = msgs.get(id);
    if (!b) continue;
    cur.push(id); size += b.length + 2;
    if (size >= chunkKb * 1024) { chunks.push(cur); cur = []; size = 0; }
  }
  if (cur.length) chunks.push(cur);
  return chunks.map((ids, i) => ({ name: String(i + 1).padStart(3, '0') + '.ftl', ids, text: ids.map((id) => msgs.get(id)).join('\n\n') + '\n' }));
}

/** Merge translated page messages into i18n/<lang>/pages/: each into every page file that holds its id. Rejects (and reports) any message that breaks
 *  the English message's variables, literals, tags or digits. Returns {added, rejected:[{id, why}], unknown:[id]}. */
export function mergeTranslations(root, lang, texts, { replace = false } = {}) {
  const { where } = pageMessages(root);
  const enIndex = new Map();
  for (const f of new Set([...where.values()].flatMap((s) => [...s]))) for (const e of parseFtl(readText(join(root, 'en', 'pages', f))).ast.body) if (e instanceof Message) enIndex.set(e.id.name, e);
  const out = new Map(); // file -> Map id -> text
  const rejected = [], unknown = [];
  let added = 0;
  const rend0 = tokenRenderings(root, lang);
  const gl = (() => { const g = entriesOf(join(root, lang, 'glossary.ftl')), en = entriesOf(join(root, 'en', 'glossary.ftl')); return (id) => { const e = (g && g.map.get(id)) || (en && en.map.get(id)); return e ? textOfPattern(e.value) : null; }; })();
  const tokenTerm = (t) => '-' + (['VALIDATED', 'MODELLED', 'PARTNER', 'EXPLORATORY'].includes(t) ? 'tier-' : ['MET', 'NOT MET'].includes(t) ? 'verdict-' : 'status-') + t.toLowerCase().replace(/ /g, '-');
  for (const text of texts) {
    const p = new FluentParser({ withSpans: true }).parse(text);
    for (const e of p.body) {
      if (e instanceof Junk) { rejected.push({ id: '(junk)', why: 'syntax error near "' + e.content.split('\n')[0].slice(0, 50) + '"' }); continue; }
      if (!(e instanceof Message)) continue;
      const id = e.id.name;
      const src = enIndex.get(id);
      if (!src || !where.has(id)) { unknown.push(id); continue; }
      const a = signature(src), b = signature(e);
      let why = null;
      if (a.vars.join() !== b.vars.join()) why = 'variables differ';
      else if (!litsEqual(a, b)) why = 'string-literal placeables differ';
      else if (!a.selects.length && tagsOf(flat(src)) !== tagsOf(flat(e))) why = 'markup tags differ';
      else if (!digitsOk(strip(flat(src)), strip(flat(e)))) why = 'digits differ';
      else if (!a.selects.length && capsDiff(capsCounts(flat(src)), capsCounts(flat(e), rend0))) why = `the tier, verdict and status words differ (${capsDiff(capsCounts(flat(src)), capsCounts(flat(e), rend0))}); a lowercase word stays a word`;
      else {
        const t = flat(e);
        for (const tk of TOKENS) {
          const re = new RegExp(`(?<![A-Z])${tk}(?![A-Z])`);
          const en2 = tk === 'MET' ? flat(src).replace(/NOT MET/g, '') : flat(src);
          if (re.test(en2)) { const r = gl(tokenTerm(tk)); if (r && !t.includes(r) && !(tk === 'MET' && t.includes('NOT MET'))) { why = `the term ${tk} must appear as "${r}"`; break; } }
        }
      }
      if (why) { rejected.push({ id, why }); continue; }
      const body = text.slice(e.span.start, e.span.end).trim();
      for (const f of where.get(id)) { if (!out.has(f)) out.set(f, new Map()); out.get(f).set(id, body); }
    }
  }
  const dir = join(root, lang, 'pages');
  mkdirSync(dir, { recursive: true });
  for (const [f, add] of out) {
    const p = join(dir, f);
    const old = existsSync(p) ? readText(p) : `# ${f.replace(/\.ftl$/, '')}: translations (${lang})\n\n`;
    const have = new Map();
    for (const b of old.split(/\n\n+/)) { const m = /^(seg-[0-9a-f]{12})/m.exec(b); if (m) have.set(m[1], b.trim()); }
    let next = old.trimEnd() + '\n\n';
    let changed = false;
    if (replace) { // rewrite the file with replaced messages
      const kept = old.split(/\n\n+/).filter((b) => { const m = /^(seg-[0-9a-f]{12})/m.exec(b); return !(m && add.has(m[1])); });
      next = kept.join('\n\n').trimEnd() + '\n\n';
    }
    for (const [id, body] of add) { if (have.has(id) && !replace) continue; next += body + '\n\n'; added++; changed = true; }
    if (changed) writeFileSync(p, next.trimEnd() + '\n');
  }
  return { added, rejected, unknown };
}


/** ---- legal sentences and tier tokens (verify) ---- */

/** Plain text of a message pattern: text, string literals, terms resolved through `terms` (id -> text). Null if it has variables or selectors. */
export function plainText(pattern, terms = new Map()) {
  if (!pattern) return null;
  let out = '';
  for (const el of pattern.elements) {
    if (el instanceof TextElement) out += el.value;
    else if (el instanceof Placeable && el.expression instanceof StringLiteral) out += el.expression.value;
    else if (el instanceof Placeable && el.expression instanceof TermReference && !el.expression.attribute && terms.has('-' + el.expression.id.name)) out += terms.get('-' + el.expression.id.name);
    else return null;
  }
  return out;
}

/** The sentences a page must carry complete: the engine-legal-* messages (the engine's own advisories and notices) and the
 *  glossary's -advisory family, in English and in `lang`. Returns [{id, en, tr}] (tr null when the language lacks it). */
export function legalSentences(root, lang) {
  const out = [];
  const terms = (file) => { const e = entriesOf(file); const m = new Map(); if (e) for (const [id, v] of e.map) if (id.startsWith('-') && v.value) { const t = plainText(v.value); if (t !== null) m.set(id, t); } return m; };
  const tEn = terms(join(root, 'en', 'glossary.ftl')), tLang = lang === 'en' ? tEn : terms(join(root, lang, 'glossary.ftl'));
  const norm = (t) => t.replace(/\s+/g, ' ').trim();
  const eng = entriesOf(join(root, 'en', 'engine.ftl')), engL = lang === 'en' ? eng : entriesOf(join(root, lang, 'engine.ftl'));
  if (eng) for (const [id, e] of eng.map) {
    if (!id.startsWith('engine-legal-')) continue;
    const en = plainText(e.value, tEn);
    if (en === null) continue;
    const tr = engL && engL.map.get(id) ? plainText(engL.map.get(id).value, tLang) : null;
    out.push({ id, en: norm(en), tr: tr === null ? null : norm(tr) });
  }
  const g = entriesOf(join(root, 'en', 'glossary.ftl')), gl = lang === 'en' ? g : entriesOf(join(root, lang, 'glossary.ftl'));
  for (const name of ['-advisory']) {
    const e = g && g.map.get(name); if (!e) continue;
    const el = gl && gl.map.get(name);
    const one = (ent, attr) => plainText(attr ? ent.attributes.find((a) => a.id.name === attr)?.value : ent.value, lang === 'en' ? tEn : tLang);
    for (const attr of [null, 'maritime', 'research-test', 'short']) {
      const en = one(e, attr); if (en === null) continue;
      const tr = el ? one(el, attr) : null;
      out.push({ id: name + (attr ? '.' + attr : ''), en: norm(en), tr: tr === null ? null : norm(tr) });
    }
  }
  return out;
}

export const TIER_TOKENS = TOKENS;
export function tokenRenderings(root, lang) {
  const g = entriesOf(join(root, lang, 'glossary.ftl')), en = entriesOf(join(root, 'en', 'glossary.ftl'));
  const term = (t) => '-' + (['VALIDATED', 'MODELLED', 'PARTNER', 'EXPLORATORY'].includes(t) ? 'tier-' : ['MET', 'NOT MET'].includes(t) ? 'verdict-' : 'status-') + t.toLowerCase().replace(/ /g, '-');
  const out = {};
  for (const t of TOKENS) { const e = (g && g.map.get(term(t))) || (en && en.map.get(term(t))); out[t] = e ? plainText(e.value) || t : t; }
  return out;
}

/** The language's rendering of a glossary term (null when the language has not translated it) and a stem that survives inflection. */
export function termStem(root, lang, id) {
  const g = entriesOf(join(root, lang, 'glossary.ftl'));
  const e = g && g.map.get(id);
  const t = e && e.value ? plainText(e.value) : null;
  if (!t) return null;
  const low = t.toLowerCase();
  const cut = low.length > 8 ? 3 : low.length > 5 ? 2 : 0;
  return low.slice(0, low.length - cut);
}


/** ---- migrate: carry translations to the ids a segment moved to ---- */

import { execFileSync } from 'node:child_process';

/** The English page messages of a git revision: Map id -> skeleton. */
export function oldEnglish(rev, root = 'i18n') {
  const git = (...a) => execFileSync('git', a, { encoding: 'utf8', maxBuffer: 1 << 28 });
  const files = git('ls-tree', '--name-only', `${rev}:${root}/en/pages`).split('\n').filter((f) => f.endsWith('.ftl'));
  const map = new Map();
  for (const f of files) for (const m of git('show', `${rev}:${root}/en/pages/${f}`).matchAll(/^(seg-[0-9a-f]{12}) = (.*)$/gm)) map.set(m[1], m[2]);
  return map;
}

const plainKey = (skel) => skel.replace(/<\/?[a-z]+\d*\/?>/g, '').replace(/\{ "([^"]*)" \}/g, '$1').replace(/\{ \$version \}/g, 'VERSION').replace(/\s+/g, ' ').trim();

/** Adapt a translation's numbered tags to the new English skeleton: a placeholder <cN/> the new skeleton lacks is dropped (a decoration that left the
 *  segment), a pair it lacks is unwrapped (the segment lost its lone wrapper). Null when the tag sets still differ. */
function adaptTags(tr, newSkel) {
  const want = tagsOf(newSkel);
  let out = tr;
  for (let i = 0; i < 8 && tagsOf(out) !== want; i++) {
    const has = (t) => new RegExp(`<${t}>|<${t}/>`).test(newSkel);
    out = out.replace(/<(c\d+)\/>/g, (m, t) => (has(t) ? m : ''));
    out = out.replace(/<((?:a|s)\d+)>([\s\S]*?)<\/\1>/g, (m, t, inner) => (has(t) ? m : inner));
    out = out.replace(/\s+/g, ' ').trim();
  }
  return tagsOf(out) === want ? out : null;
}

/** Carry the translations of `lang` whose English segment moved id (same text, new id) to the new id; drop the orphans.
 *  `old` is oldEnglish(rev). Returns {moved, dropped:[ids], unmatched:[ids], retag:[ids]}; with dryRun nothing is written. */
export function migrateLang(root, lang, old, { dryRun = false } = {}) {
  const { where } = pageMessages(root);
  const en = new Map();
  for (const f of new Set([...where.values()].flatMap((x) => [...x]))) for (const m of readText(join(root, 'en', 'pages', f)).matchAll(/^(seg-[0-9a-f]{12}) = (.*)$/gm)) en.set(m[1], m[2]);
  const byKey = new Map();
  for (const [id, skel] of en) { const k = plainKey(skel); if (!byKey.has(k)) byKey.set(k, []); byKey.get(k).push(id); }
  const dir = join(root, lang, 'pages');
  const moved = [], dropped = [], unmatched = [], retag = [], chunks = [], orphanBlocks = [];
  const used = new Set();
  const files = existsSync(dir) ? readdirSync(dir).filter((f) => f.endsWith('.ftl')) : [];
  const have = new Set();
  for (const f of files) for (const m of readText(join(dir, f)).matchAll(/^(seg-[0-9a-f]{12}) =/gm)) have.add(m[1]);
  let merged = 0;
  for (const f of files) {
    const text = readText(join(dir, f));
    const keep = [];
    let changed = false;
    for (const b of text.split(/\n\n+/)) {
      const m = /^(seg-[0-9a-f]{12}) = ([\s\S]*)$/m.exec(b);
      if (!m || en.has(m[1])) { keep.push(b); continue; }
      changed = true;
      const oskel = old.get(m[1]);
      const cands = oskel ? byKey.get(plainKey(oskel)) : null;
      if (!cands || cands.length !== 1) { (oskel ? unmatched : dropped).push(m[1]); orphanBlocks.push(`# ${oskel || '(not in the old English either)'}\n${b.trim()}`); continue; }
      const nid = cands[0];
      if (have.has(nid)) { merged++; continue; } // the same text already has its own translation under that id
      if (used.has(nid) && !chunks.some((c) => c.startsWith(nid))) { dropped.push(m[1]); continue; }
      const val = adaptTags(m[2].trim(), en.get(nid));
      if (val === null) { retag.push(m[1]); orphanBlocks.push(`# ${oskel}\n${b.trim()}`); continue; }
      used.add(nid);
      chunks.push(`${nid} = ${val}`);
      moved.push([m[1], nid]);
    }
    if (changed && !dryRun) writeFileSync(join(dir, f), keep.join('\n\n').trimEnd() + '\n');
  }
  if (orphanBlocks.length && !dryRun) {
    // Append to what is there: an earlier migration's orphans are recoverable work, not to be overwritten. A block whose id is already kept is not repeated.
    const op = join(root, lang, '_orphans.txt'), head = '# Translations whose English segment no longer exists (the English changed, or it could not be carried over). Kept so work can be recovered; not read by the build.';
    const prev = existsSync(op) ? readText(op).replace(head, '').trim() : '';
    const kept = new Set([...prev.matchAll(/^(seg-[0-9a-f]{12}) =/gm)].map((x) => x[1]));
    const fresh = orphanBlocks.filter((b) => { const m = /^(seg-[0-9a-f]{12}) =/m.exec(b); if (m && kept.has(m[1])) return false; if (m) kept.add(m[1]); return true; });
    writeFileSync(op, `${head}\n\n${[...(prev ? [prev] : []), ...fresh].join('\n\n')}\n`);
  }
  if (chunks.length && !dryRun) {
    const r = mergeTranslations(root, lang, [chunks.join('\n\n') + '\n']);
    if (r.rejected.length) retag.push(...r.rejected.map((x) => x.id));
  }
  return { moved: moved.length, merged, pairs: moved, dropped, unmatched, retag };
}


/** ---- todo and merge for a whole-file catalogue (ui, glossary, studio-js, site-js, studio-pages, data) ---- */

const blockId = (b) => { const m = /^(-?[A-Za-z][\w-]*) =/m.exec(b); return m ? m[1] : null; };

/** The messages of an .ftl text with their attached comments: [{id, text}] in file order. */
function messageBlocks(text) {
  const p = new FluentParser({ withSpans: true }).parse(text);
  const out = [];
  for (const e of p.body) {
    if (!(e instanceof Message) && !(e instanceof Term)) continue;
    const start = e.comment && e.comment.span ? e.comment.span.start : e.span.start;
    out.push({ id: (e instanceof Term ? '-' : '') + e.id.name, text: text.slice(start, e.span.end).trim() });
  }
  return out;
}

/** Chunks of the English messages that `lang`'s copy of `file` lacks. */
export function todoFileChunks(root, lang, file, chunkKb = 26) {
  const lp = join(root, lang, file);
  const have = new Set(existsSync(lp) ? messageBlocks(readText(lp)).map((m) => m.id) : []);
  const need = messageBlocks(readText(join(root, 'en', file))).filter((m) => !have.has(m.id)).map((m) => m.text);
  const chunks = [];
  let cur = [], size = 0;
  for (const b of need) { cur.push(b); size += b.length + 2; if (size >= chunkKb * 1024) { chunks.push(cur); cur = []; size = 0; } }
  if (cur.length) chunks.push(cur);
  return chunks.map((c, i) => ({ name: String(i + 1).padStart(3, '0') + '.ftl', count: c.length, text: c.join('\n\n') + '\n' }));
}

/** Append translated messages to i18n/<lang>/<file> after the checks of `check` (variables, literals, tags, digits for text files). */
export function mergeFile(root, lang, file, texts) {
  const enE = entriesOf(join(root, 'en', file));
  const rendF = tokenRenderings(root, lang);
  const lp = join(root, lang, file);
  const old = existsSync(lp) ? readText(lp) : `# ${file} (${lang}): translations\n\n`;
  const have = new Set(existsSync(lp) ? messageBlocks(readText(lp)).map((m) => m.id) : []);
  const rejected = [], unknown = [];
  let add = '', n = 0;
  for (const text of texts) {
    const p = new FluentParser({ withSpans: true }).parse(text);
    for (const e of p.body) {
      if (e instanceof Junk) { rejected.push({ id: '(junk)', why: 'syntax error near "' + e.content.split('\n')[0].slice(0, 50) + '"' }); continue; }
      if (!(e instanceof Message) && !(e instanceof Term)) continue;
      const id = (e instanceof Term ? '-' : '') + e.id.name;
      const src = enE.map.get(id);
      if (!src) { unknown.push(id); continue; }
      if (have.has(id)) continue;
      const a = signature(src), b = signature(e);
      let why = null;
      if (a.vars.join() !== b.vars.join()) why = 'variables differ';
      else if (!litsEqual(a, b)) why = 'string-literal placeables differ';
      else if (file !== 'glossary.ftl' && !a.selects.length && tagsOf(flat(src)) !== tagsOf(flat(e))) why = 'markup tags differ';
      else if (file !== 'glossary.ftl' && !a.selects.length && !digitsOk(strip(flat(src)), strip(flat(e)))) why = 'digits differ';
      else if (file !== 'glossary.ftl' && file !== 'engine.ftl' && !a.selects.length && capsDiff(capsCounts(flat(src)), capsCounts(flat(e), rendF))) why = `the tier, verdict and status words differ (${capsDiff(capsCounts(flat(src)), capsCounts(flat(e), rendF))}); a lowercase word stays a word`;
      if (why) { rejected.push({ id, why }); continue; }
      add += text.slice(e.span.start, e.span.end).trim() + '\n\n'; have.add(id); n++;
    }
  }
  if (n) { mkdirSync(dirname(lp), { recursive: true }); writeFileSync(lp, old.trimEnd() + '\n\n' + add.trimEnd() + '\n'); }
  return { added: n, rejected, unknown };
}


/** Coverage of the whole-file catalogues of a language: [{file, translated, total}]. */
export function statusFiles(root, lang) {
  const files = readdirSync(join(root, 'en')).filter((f) => f.endsWith('.ftl') && f !== 'engine.ftl').sort();
  const rows = [];
  for (const f of files) {
    const en = messageBlocks(readText(join(root, 'en', f))).map((m) => m.id);
    const lp = join(root, lang, f);
    const have = new Set(existsSync(lp) ? messageBlocks(readText(lp)).map((m) => m.id) : []);
    rows.push({ file: f, translated: en.filter((i) => have.has(i)).length, total: en.length });
  }
  const ep = join(root, 'en', 'engine.ftl');
  if (existsSync(ep)) { const en = messageBlocks(readText(ep)).map((m) => m.id); const lp = join(root, lang, 'engine.ftl'); const have = new Set(existsSync(lp) ? messageBlocks(readText(lp)).map((m) => m.id) : []); rows.push({ file: 'engine.ftl', translated: en.filter((i) => have.has(i)).length, total: en.length }); }
  return rows;
}
