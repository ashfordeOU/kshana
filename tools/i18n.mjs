#!/usr/bin/env node
// i18n tooling for kshana.dev, the docs, the Studio and the engine (design: kshana-pro docs/design/i18n-0.40-design.md, v2).
//
//   node tools/i18n.mjs extract [--src web] [--out i18n/en/pages] [--shared-min 25] [--skip studio,playground]
//
// extract: cuts every English page of the built tree into segments and writes one Fluent message per segment
// (id seg-<sha12>) into i18n/en/pages/<page>.ftl. A segment that appears on --shared-min or more pages is written
// once, to pages/_shared.ftl. No dependencies; Node 18 or later.
//
// Segment rules (design section 2):
//  - a segment is a run of text and inline elements between block boundaries, or a text attribute
//    (title, alt, aria-label, placeholder, the meta description and the social titles);
//  - inline elements become numbered tags that stand for the English element: <a1>..</a1> (link),
//    <b>..</b> (strong), <em>..</em>, <s1>..</s1> (any other inline element), <c1/> (a code span, kept verbatim,
//    its text given in the comment above the message); <br/> is kept;
//  - every standalone number and version is a placeable written as a string literal: { "1,408" };
//  - the id is seg- plus the first 12 hex digits of the SHA-256 of the skeleton and the code spans, so an
//    unchanged English segment keeps its id (translation memory) and a changed one gets a new id.

import { createHash } from 'node:crypto';
import { readdirSync, readFileSync, writeFileSync, mkdirSync, existsSync, statSync, rmSync, copyFileSync } from 'node:fs';
import { join, relative, dirname, sep } from 'node:path';
import { fileURLToPath } from 'node:url';

const BLOCK = new Set(['address', 'article', 'aside', 'blockquote', 'body', 'caption', 'dd', 'details', 'div', 'dl', 'dt',
  'fieldset', 'figcaption', 'figure', 'footer', 'form', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'header', 'hgroup', 'hr', 'html',
  'li', 'main', 'nav', 'ol', 'optgroup', 'option', 'p', 'section', 'summary', 'table', 'tbody', 'td', 'tfoot', 'th', 'thead',
  'tr', 'ul', 'legend', 'label', 'button', 'select', 'textarea', 'input', 'img', 'picture', 'video', 'audio', 'canvas',
  'iframe', 'object', 'dialog', 'menu', 'search', 'template', 'noscript', 'head', 'title', 'meta', 'link', 'base', 'col', 'colgroup']);
const RAW = new Set(['script', 'style', 'svg', 'pre', 'textarea', 'template', 'math', 'head']);
const CODE = new Set(['code', 'kbd', 'samp', 'var', 'tt']);
const VOID = new Set(['area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'param', 'source', 'track', 'wbr']);
const ATTRS = ['title', 'alt', 'aria-label', 'placeholder'];
const META = new Set(['description', 'og:title', 'og:description', 'twitter:title', 'twitter:description', 'og:image:alt', 'twitter:image:alt']);

const sha12 = (s) => createHash('sha256').update(s).digest('hex').slice(0, 12);
const decode = (s) => s
  .replace(/&#x([0-9a-f]+);/gi, (_, h) => String.fromCodePoint(parseInt(h, 16)))
  .replace(/&#(\d+);/g, (_, d) => String.fromCodePoint(+d))
  .replace(/&(nbsp|amp|lt|gt|quot|apos|middot|ndash|mdash|hellip|rarr|larr|times|copy|reg|trade|deg|plusmn|minus|laquo|raquo|lsquo|rsquo|ldquo|rdquo|bull|check|zwj);/g,
    (_, n) => ({ nbsp: ' ', amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", middot: '·', ndash: '–', mdash: '—', hellip: '…',
      rarr: '→', larr: '←', times: '×', copy: '©', reg: '®', trade: '™', deg: '°', plusmn: '±', minus: '−', laquo: '«', raquo: '»',
      lsquo: '‘', rsquo: '’', ldquo: '“', rdquo: '”', bull: '•', check: '✓', zwj: '‍' })[n]);

// A standalone number or version: not part of an identifier (L1, E5a, kshana-0.39, 2x).
const NUM = /(?<![\p{L}\p{N}_.\-/#$])(?:\d+(?:\.\d+)?[eE][-+]?\d+|v?\d+(?:\.\d+){2,}|\d+(?:[.,   ]\d{3})*(?:[.,]\d+)?)(?![\p{L}\p{N}_\-/]|[.,]\d)/gu;
// A lone token that is an identifier, a unit or a formula (csac-sa45s, 1/s, s^2/s) is data, not prose.
const IDENT = /^[\p{L}\p{N}_.:/^*+=<>()%[\]-]+$/u;
const isData = (skel) => !/\s/.test(skel) && !/[<{]/.test(skel) && IDENT.test(skel) && /[-_.:/^0-9]/.test(skel);

const esc = (s) => s.replace(/\\/g, '\\\\').replace(/"/g, '\\"');

/** Tokenise HTML into {t:'text'|'open'|'close'|'raw', s, e (offsets into html), ...}. */
function* tokens(html) {
  const re = /<!--[\s\S]*?-->|<!doctype[^>]*>|<\/?([a-zA-Z][a-zA-Z0-9:-]*)((?:"[^"]*"|'[^']*'|[^'">])*)>/gi;
  let last = 0, m;
  while ((m = re.exec(html))) {
    if (m.index > last) yield { t: 'text', v: html.slice(last, m.index), s: last, e: m.index };
    last = re.lastIndex;
    if (!m[1]) continue;
    const name = m[1].toLowerCase();
    if (m[0][1] === '/') { yield { t: 'close', name, s: m.index, e: last }; continue; }
    const attrs = {};
    for (const a of m[2].matchAll(/([a-zA-Z_:][-a-zA-Z0-9_:.]*)(?:\s*=\s*(?:"([^"]*)"|'([^']*)'|([^\s"'>]+)))?/g)) attrs[a[1].toLowerCase()] = a[2] ?? a[3] ?? a[4] ?? '';
    const selfClose = VOID.has(name) || m[0].endsWith('/>');
    yield { t: 'open', name, attrs, selfClose, s: m.index, e: last };
    if (RAW.has(name) && !selfClose) { // swallow to the matching close
      const close = new RegExp(`</${name}\\s*>`, 'gi');
      close.lastIndex = last;
      const c = close.exec(html);
      const end = c ? c.index : html.length;
      yield { t: 'raw', name, v: html.slice(last, end), s: last, e: end };
      last = c ? close.lastIndex : html.length;
      re.lastIndex = last;
      yield { t: 'close', name, s: end, e: last };
    }
  }
  if (last < html.length) yield { t: 'text', v: html.slice(last), s: last, e: html.length };
}

let CUR = '';
const STOP = new Set(['the', 'and', 'of', 'for', 'with', 'is', 'are', 'to', 'in', 'on', 'a', 'an', 'as', 'by', 'from', 'at', 'or', 'not', 'that', 'this', 'each', 'all']);
// Prose inside a code element (a test description, not a command or engine output): at least six plain words and a function word.
const looksLikeProse = (v) => { if (!/^[\w:./-]+(?: and [\w:./-]+)* \(/.test(norm(v).trim())) return false; const w = norm(v).trim().split(' '); const plain = w.filter((x) => /^[A-Za-z][a-z]{2,}[,.;:]?$|^[a-z]{1,3}$/.test(x)); return plain.length >= 6 && plain.some((x) => STOP.has(x.replace(/[,.;:]$/, ''))); };
const norm = (t) => t.replace(/\s+/g, ' ');
const hasLetters = (t) => /\p{L}/u.test(t);

/** Tree of a run's nodes: elements {name, attrs, kids, s (open start), os (open end), cs (close start), ce}, text {v, s, e}. */
function buildTree(nodes) {
  const root = { kids: [] };
  const st = [root];
  for (const n of nodes) {
    const top = st[st.length - 1];
    if (n.k === 'open') { const el = { k: 'el', name: n.name, attrs: n.attrs, kids: [], s: n.s, os: n.e }; top.kids.push(el); st.push(el); }
    else if (n.k === 'close') {
      const i = st.map((x) => x.name).lastIndexOf(n.name);
      if (i > 0) { st[i].cs = n.s; st[i].ce = n.e; st.length = i; }
    } else top.kids.push(n);
  }
  return root;
}
const textOf = (n) => (n.k === 'el' ? n.kids.map(textOf).join('') : n.k === 'code' || n.k === 'text' ? n.v : n.k === 'br' ? ' ' : '');
const isDeco = (n) => (n.k === 'el' && !hasLetters(textOf(n))) || n.k === 'br' && false;
const isBlankText = (n) => n.k === 'text' && !/\S/.test(n.v);

/** Reduce a run to its segment: strip edge decorations, unwrap a lone wrapper element, render the skeleton. Null if nothing translatable. */
function segmentOf(nodes) {
  const root = buildTree(nodes);
  let kids = root.kids;
  const strip = () => {
    for (;;) {
      if (kids.length && (isBlankText(kids[0]) || isDeco(kids[0]) || kids[0].k === 'br')) kids = kids.slice(1);
      else if (kids.length && (isBlankText(kids[kids.length - 1]) || isDeco(kids[kids.length - 1]) || kids[kids.length - 1].k === 'br')) kids = kids.slice(0, -1);
      else break;
    }
  };
  strip();
  while (kids.length === 1 && kids[0].k === 'el' && kids[0].cs !== undefined && /^(a|span|strong|b|em|i|small|abbr|mark|u|sup|sub|time|bdi|cite|q|dfn|label)$/.test(kids[0].name)) { kids = kids[0].kids; strip(); }
  if (!kids.length) return null;
  const cnt = { a: 0, s: 0, c: 0 };
  const codes = [];
  const tags = {}; // tag name -> raw English html: {o, c} for a pair, {h} for a verbatim placeholder
  const rawCode = (txt, n) => {
    codes.push(norm(txt).trim());
    const name = `c${++cnt.c}`;
    tags[name] = { at: n.s, h: n.k === 'el' ? CUR.slice(n.s, n.ce ?? n.os) + (n.ce === undefined ? n.kids.map((x) => CUR.slice(x.s, x.e)).join('') : '') : CUR.slice(n.s, n.e) };
    return `<${name}/>`;
  };
  const render = (n, first, last) => {
    if (n.k === 'text') { let v = n.v; return fmtText(v, true); }
    if (n.k === 'br') return '<br/>';
    if (n.k === 'code' && looksLikeProse(n.v)) { // prose inside a code element: translatable text, the element kept around it
      const tag = `s${++cnt.s}`;
      tags[tag] = { at: n.s, o: CUR.slice(n.s, n.os).replace(/^<(\w+)/, '<$1 data-i18n-t'), c: `</${n.name}>` };
      return `<${tag}>${fmtText(n.v, true)}</${tag}>`;
    }
    if (n.k === 'code') return rawCode(n.v, n);
    if (isDeco(n)) return rawCode(textOf(n), n);
    let tag;
    if (n.name === 'a') tag = `a${++cnt.a}`; else if (n.name === 'strong' || n.name === 'b') tag = 'b'; else if (n.name === 'em' || n.name === 'i') tag = 'em'; else tag = `s${++cnt.s}`;
    tags[tag] = { at: n.s, o: CUR.slice(n.s, n.os), c: n.cs !== undefined ? CUR.slice(n.cs, n.ce) : '' };
    return `<${tag}>${n.kids.map((k) => render(k)).join('')}</${tag}>`;
  };
  const skel = norm(kids.map((k) => render(k)).join('')).trim();
  const letters = skel.replace(/\{ "[^"]*" \}/g, '').replace(/<[^>]*>/g, '');
  if (!hasLetters(letters) || skel.length < 2 || isData(skel)) return null;
  // source range of the kept nodes (the apply step replaces exactly this range)
  const startOf = (n) => (n.k === 'el' ? n.s : n.s), endOf = (n) => (n.k === 'el' ? (n.ce ?? n.kids.length ? (n.ce ?? endOf(n.kids[n.kids.length - 1])) : n.os) : n.e);
  const f = kids[0], l = kids[kids.length - 1];
  let start = startOf(f), end = endOf(l);
  if (f.k === 'text') start += f.v.length - f.v.trimStart().length;
  if (l.k === 'text') end -= l.v.length - l.v.trimEnd().length;
  return { skel, codes, tags, start, end };
}

/** Segments of one page: [{skel, codes, kind, start, end | at, attr}] in document order. */
export function segments(html) {
  CUR = html;
  const out = [];
  let run = null;
  const stack = [];
  const flush = () => {
    if (run) {
      const sg = segmentOf(run.nodes);
      if (sg) out.push({ ...sg, kind: run.title ? 'title' : 'text' });
    }
    run = null;
  };
  const attrSeg = (tk, a, kind) => {
    const text = decode(tk.attrs[a]).replace(/\s+/g, ' ').trim();
    if (!hasLetters(text) || /^(https?:|\/|#|\.|data:)/.test(text)) return;
    out.push({ skel: fmtText(text), codes: [], kind, at: tk.s, attr: a });
  };
  let inHead = false;
  const skipping = () => stack.some((s) => s.skip);
  for (const tk of tokens(html)) {
    if (tk.t === 'open') {
      if (tk.name === 'head') inHead = true;
      if (tk.name === 'body') { inHead = false; }
      if (tk.name === 'meta' && inHead) {
        const k = (tk.attrs.name || tk.attrs.property || '').toLowerCase();
        if (META.has(k) && tk.attrs.content) attrSeg(tk, 'content', `meta:${k}`);
        continue;
      }
      if (!inHead) for (const a of ATTRS) if (tk.attrs[a]) attrSeg(tk, a, `attr:${a}`);
      if (tk.name === 'title' && inHead) { flush(); run = { nodes: [], title: true }; continue; }
      if (inHead) continue;
      if (tk.attrs['data-no-i18n'] !== undefined || tk.attrs.translate === 'no') { stack.push({ name: tk.name, skip: true }); flush(); continue; }
      if (BLOCK.has(tk.name)) { flush(); if (!tk.selfClose) stack.push({ name: tk.name }); continue; }
      if (skipping()) { if (!VOID.has(tk.name)) stack.push({ name: tk.name, skip: false, dummy: true }); continue; }
      if (!run) run = { nodes: [] };
      if (tk.name === 'br') { run.nodes.push({ k: 'br', s: tk.s, e: tk.e }); continue; }
      if (VOID.has(tk.name)) continue;
      // A new link or span right after a finished sibling element starts a new segment (nav items, breadcrumbs).
      if (!run.depth && run.nodes.length && lastIsElement(run)) { flush(); run = { nodes: [] }; }
      if (CODE.has(tk.name)) { run.code = { s: tk.s, os: tk.e, name: tk.name, v: '' }; run.depth = (run.depth || 0) + 1; continue; }
      run.nodes.push({ k: 'open', name: tk.name, attrs: tk.attrs, s: tk.s, e: tk.e });
      run.depth = (run.depth || 0) + 1;
      stack.push({ name: tk.name, inline: true });
    } else if (tk.t === 'close') {
      if (tk.name === 'head') { flush(); inHead = false; continue; }
      if (tk.name === 'title' && inHead) { flush(); continue; }
      if (inHead) continue;
      if (BLOCK.has(tk.name)) { flush(); const i = stack.map((s) => s.name).lastIndexOf(tk.name); if (i >= 0) stack.length = i; continue; }
      if (VOID.has(tk.name)) continue;
      if (CODE.has(tk.name) && run && run.code) { run.nodes.push({ k: 'code', v: run.code.v, s: run.code.s, os: run.code.os, name: run.code.name, e: tk.e }); run.code = null; run.depth--; continue; }
      const i = stack.map((s) => s.name).lastIndexOf(tk.name);
      if (i >= 0) { const s = stack[i]; stack.length = i; if (s.skip || s.dummy) continue; }
      if (run) { run.nodes.push({ k: 'close', name: tk.name, s: tk.s, e: tk.e }); run.depth = Math.max(0, (run.depth || 1) - 1); }
    } else if (tk.t === 'raw') {
      if (!inHead) flush();
    } else if (tk.t === 'text') {
      if (inHead && !(run && run.title)) continue;
      if (skipping()) continue;
      const text = decode(tk.v);
      if (!run) run = { nodes: [] };
      if (run.code) { run.code.v += text; continue; }
      if (!run.depth && /\S/.test(text)) run.topText = true;
      run.nodes.push({ k: 'text', v: text, s: tk.s, e: tk.e });
    }
  }
  flush();
  return out;
}

function lastIsElement(run) {
  // true when the run so far is only closed elements (no text of its own), so a new sibling element starts a new segment
  if (run.topText) return false;
  const nodes = run.nodes;
  let i = nodes.length - 1;
  while (i >= 0 && nodes[i].k === 'text' && !/\S/.test(nodes[i].v)) i--;
  return i >= 0 && (nodes[i].k === 'close' || nodes[i].k === 'code');
}

// The engine version in running text is the variable { $version }, so a segment keeps its id (and its translations) from one
// release to the next. Set by the commands from --version or the root Cargo.toml.
let VERSION = '';
export function setVersion(v) { VERSION = v || ''; }
function readVersion(opt) {
  if (opt.version) return opt.version;
  try { return /^version\s*=\s*"([^"]+)"/m.exec(readFileSync('Cargo.toml', 'utf8'))?.[1] || ''; } catch { return ''; }
}
function fmtText(text, keepEdges = false) {
  let t = text.replace(/\s+/g, ' ');
  if (!keepEdges) t = t.trim();
  t = t.replace(/[{}]/g, (c) => `{ "${c}" }`);
  if (VERSION) t = t.replace(new RegExp(`(?<![\\p{L}\\p{N}_.\\-/#$])(v?)${VERSION.replace(/\./g, '\\.')}(?![\\p{L}\\p{N}_\\-/]|[.,]\\d)`, 'gu'), '$1{ $version }');
  t = t.replace(NUM, (n) => `{ "${esc(n)}" }`);
  return t;
}

const slugOf = (rel) => rel.replace(/\.html$/, '').split(sep).join('--');

function walk(dir, skip, base = dir, acc = []) {
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    const p = join(dir, e.name);
    const rel = relative(base, p).split(sep).join('/');
    if (e.isDirectory()) { if (!skip.some((s) => rel === s || rel.startsWith(s + '/'))) walk(p, skip, base, acc); }
    else if (e.name.endsWith('.html')) acc.push(rel);
  }
  return acc.sort();
}

function extract(args) {
  const opt = { src: 'web', out: 'i18n/en/pages', sharedMin: 25, skip: 'studio,playground,assets', version: '' };
  for (let i = 0; i < args.length; i += 2) {
    const k = args[i].replace(/^--/, '').replace(/-([a-z])/g, (_, c) => c.toUpperCase());
    opt[k] = args[i + 1];
  }
  setVersion(readVersion(opt));
  console.log(`extract: engine version ${VERSION || '(none)'} is the variable { $version }`);
  opt.sharedMin = +opt.sharedMin;
  const skip = String(opt.skip).split(',').filter(Boolean);
  const pages = walk(opt.src, skip);
  const msgs = new Map(); // id -> {skel, codes, kinds:Set, pages:Set}
  const perPage = new Map(); // rel -> [id] in order
  for (const rel of pages) {
    const html = readFileSync(join(opt.src, rel), 'utf8');
    const ids = [];
    for (const s of segments(html)) {
      const id = 'seg-' + sha12(s.skel + '\0' + s.codes.join('\0'));
      if (!msgs.has(id)) msgs.set(id, { skel: s.skel, codes: s.codes, kinds: new Set(), pages: new Set() });
      const m = msgs.get(id);
      m.kinds.add(s.kind);
      m.pages.add(rel);
      if (!ids.includes(id)) ids.push(id);
    }
    perPage.set(rel, ids);
  }
  const shared = new Set([...msgs].filter(([, m]) => m.pages.size >= opt.sharedMin).map(([id]) => id));
  const render = (title, ids) => {
    const lines = [`# ${title}`, '# Generated by tools/i18n.mjs extract from the built English pages. Do not edit; translate in i18n/<lang>/pages/.', ''];
    for (const id of ids) {
      const m = msgs.get(id);
      const note = [...m.kinds].sort().join(', ');
      lines.push(`# ${note}`);
      m.codes.forEach((c, i) => lines.push(`# c${i + 1}: ${c.replace(/\n/g, ' ')}`));
      lines.push(`${id} = ${m.skel}`, '');
    }
    return lines.join('\n');
  };
  mkdirSync(opt.out, { recursive: true });
  const written = new Set();
  const put = (name, text) => {
    const p = join(opt.out, name);
    written.add(name);
    if (!existsSync(p) || readFileSync(p, 'utf8') !== text) writeFileSync(p, text);
  };
  put('_shared.ftl', render(`segments on ${opt.sharedMin} or more pages (site chrome and repeated text)`, [...shared]));
  let total = shared.size;
  for (const [rel, ids] of perPage) {
    const own = ids.filter((id) => !shared.has(id));
    if (!own.length) continue;
    total += own.length;
    put(slugOf(rel) + '.ftl', render(`page: ${rel}`, own));
  }
  for (const f of readdirSync(opt.out)) if (f.endsWith('.ftl') && !written.has(f)) rmSync(join(opt.out, f)); // pages that no longer exist
  const index = { generated_from: opt.src, pages: Object.fromEntries([...perPage].map(([rel, ids]) => [rel, { file: shared.size && ids.every((i) => shared.has(i)) ? '_shared.ftl' : slugOf(rel) + '.ftl', segments: ids }])), shared: [...shared] };
  put('_index.json', JSON.stringify(index) + '\n');
  console.log(`extract: ${pages.length} pages, ${msgs.size} distinct segments (${shared.size} shared), ${written.size - 1} files in ${opt.out}`);
}


// ---- apply, check, status, pseudo ----

function args2opt(args, defaults) {
  const opt = { ...defaults }, pos = [];
  for (let i = 0; i < args.length; i++) {
    if (args[i].startsWith('--')) { const k = args[i].slice(2).replace(/-([a-z])/g, (_, c) => c.toUpperCase()); opt[k] = typeof defaults[k] === 'boolean' ? true : args[++i]; }
    else pos.push(args[i]);
  }
  return { opt, pos };
}

async function lang() { return import('./i18n-lang.mjs'); }
async function site() { return import('./i18n-site.mjs'); }

const NAMES = { de: 'Deutsch', fr: 'Français', es: 'Español', 'pt-BR': 'Português (Brasil)', 'pt-PT': 'Português (Portugal)', nl: 'Nederlands', da: 'Dansk', sv: 'Svenska', nb: 'Norsk bokmål', pl: 'Polski', cs: 'Čeština', uk: 'Українська', ru: 'Русский', fi: 'Suomi', et: 'Eesti', ja: '日本語', 'zh-Hans': '简体中文' };

async function status(args) {
  const L = await lang();
  const { opt, pos } = args2opt(args, { root: 'i18n', json: false });
  const langs = pos.length ? pos : L.LANGS;
  const res = langs.map((l) => L.statusLang(opt.root, l));
  if (opt.json) { console.log(JSON.stringify(res, null, 1)); return; }
  console.log('lang      translated   missing  total   pages not started  orphans');
  for (const r of res) console.log(`${r.lang.padEnd(8)} ${String(r.translated).padStart(10)} ${String(r.missing).padStart(9)} ${String(r.total).padStart(6)} ${String(r.pagesNotStarted).padStart(18)} ${String(r.orphans.length).padStart(8)}`);
}

async function check(args) {
  const L = await lang();
  const { opt, pos } = args2opt(args, { root: 'i18n' });
  const langs = pos.length ? pos : L.LANGS.filter((l) => existsSync(join(opt.root, l)));
  let bad = 0;
  for (const l of langs) {
    const r = L.checkLang(opt.root, l);
    for (const e of r.errors.slice(0, 200)) console.log('ERROR ' + e);
    if (r.errors.length > 200) console.log(`... ${r.errors.length - 200} more errors`);
    if (r.warnings.length) console.log(`${l}: ${r.warnings.length} warnings (orphans and the like)`);
    console.log(`${l}: ${r.count} messages checked, ${r.errors.length} errors`);
    bad += r.errors.length;
  }
  if (bad) process.exit(1);
}

async function pseudo(args) {
  const L = await lang();
  const { opt } = args2opt(args, { root: 'i18n', lang: 'en-XA' });
  const out = join(opt.root, opt.lang);
  let n = 0;
  const go = (rel) => {
    const src = join(opt.root, 'en', rel);
    if (statSync(src).isDirectory()) { for (const f of readdirSync(src)) go(join(rel, f)); return; }
    if (!src.endsWith('.ftl')) return;
    const dst = join(out, rel);
    mkdirSync(dirname(dst), { recursive: true });
    writeFileSync(dst, rel === 'glossary.ftl' ? readFileSync(src, 'utf8') : L.pseudoFtl(readFileSync(src, 'utf8')));
    n++;
  };
  for (const f of readdirSync(join(opt.root, 'en'))) go(f);
  console.log(`pseudo: ${n} files in ${out}`);
}

/** apply: write the translated tree of one language next to the English tree. */
async function apply(args) {
  const L = await lang();
  const S = await site();
  const { opt, pos } = args2opt(args, { src: 'web', root: 'i18n', out: 'dist', skip: 'studio,playground,assets', origin: 'https://kshana.dev', langs: null, version: '' });
  setVersion(readVersion(opt));
  const skip = [...String(opt.skip).split(',').filter(Boolean), ...L.LANGS, 'en-XA'];
  const pages = walk(opt.src, skip);
  const langs = pos.length ? pos : L.LANGS;
  const offered = opt.langs != null ? opt.langs.split(',').filter(Boolean) : [...new Set([...L.LANGS, ...langs])];
  const report = [];
  for (const lang of langs) {
    let T = 0, M = 0;
    const listed = [];
    for (const rel of pages) {
      const html = readFileSync(join(opt.src, rel), 'utf8');
      const segs = segments(html);
      const bundle = L.bundleFor(lang, L.catalogueFiles(opt.root, lang, rel));
      const r = L.applyPage({ html, segs, bundle, lang, vars: { version: VERSION } });
      for (const e of r.errors.slice(0, 3)) console.error(`${lang}/${rel}: ${e}`);
      T += r.translated; M += r.missing;
      if (rel !== '404.html' && segs.length && r.translated / segs.length >= 0.8) listed.push(rel);
      const dst = join(opt.out, lang, rel);
      mkdirSync(dirname(dst), { recursive: true });
      writeFileSync(dst, S.decoratePage(r.html, { lang, rel, bundle, missing: r.missing, translated: r.translated, pages, origin: opt.origin, langs: offered }));
    }
    // /<lang>/studio/... stubs: set the language and go to the Studio (which reads ?lang=)
    const studioPages = existsSync(join(opt.src, 'studio')) ? walk(join(opt.src, 'studio'), ['recorded', 'pkg', 'assets', 'data', 'lib']).filter((r) => /^([\w-]+\/)?index\.html$/.test(r)).map((r) => 'studio/' + r) : [];
    const sbundle = L.bundleFor(lang, [join(opt.root, lang, 'glossary.ftl'), join(opt.root, lang, 'ui.ftl')]);
    const stitle = (() => { try { const m = sbundle.getMessage('studio-title'); return m && m.value ? sbundle.formatPattern(m.value, {}) : 'Kshana Studio'; } catch { return 'Kshana Studio'; } })();
    for (const rel of studioPages) {
      const target = '/' + rel.replace(/index\.html$/, '');
      const dst = join(opt.out, lang, rel);
      mkdirSync(dirname(dst), { recursive: true });
      writeFileSync(dst, `<!doctype html><html lang="${lang}"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="robots" content="noindex"><title>${stitle.replace(/</g, '&lt;')}</title><link rel="canonical" href="${opt.origin}${target}"><script>location.replace(${JSON.stringify(target + '?lang=' + lang)}+location.hash)</script></head><body><a href="${target}?lang=${lang}">${stitle.replace(/</g, '&lt;')}</a></body></html>\n`);
    }
    const loc = (rel) => `${opt.origin}/${lang}${S.pageUrl(rel)}`;
    writeFileSync(join(opt.out, lang, 'sitemap.xml'), `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${listed.map((rel) => `  <url><loc>${loc(rel)}</loc></url>`).join('\n')}\n</urlset>\n`);
    report.push(`${lang}: ${T} segments translated, ${M} left in English, ${pages.length} pages`);
  }
  console.log(report.join('\n'));
}

/** english: decorate the English tree in place (or into --out): language script, switcher, hreflang. Run after the site build. */
async function english(args) {
  const L = await lang();
  const S = await site();
  const { opt } = args2opt(args, { src: 'web', root: 'i18n', out: '', skip: 'studio,playground,assets', origin: 'https://kshana.dev', langs: null });
  const offered = opt.langs != null ? opt.langs.split(',').filter(Boolean) : L.LANGS;
  const out = opt.out || opt.src;
  const pages = walk(opt.src, [...String(opt.skip).split(',').filter(Boolean), ...L.LANGS]);
  const all = walk(opt.src, []);
  for (const rel of all) {
    const html = readFileSync(join(opt.src, rel), 'utf8');
    const inScope = pages.includes(rel);
    const bundle = L.bundleFor('en', L.catalogueFiles(opt.root, 'en', rel));
    const res = inScope ? S.decoratePage(html, { lang: 'en', rel, bundle, pages, origin: opt.origin, langs: offered }) : html;
    const dst = join(out, rel);
    mkdirSync(dirname(dst), { recursive: true });
    writeFileSync(dst, res);
  }
  mkdirSync(join(out, 'css'), { recursive: true });
  copyFileSync(join(dirname(fileURLToPath(import.meta.url)), 'i18n-assets', 'i18n.css'), join(out, 'css', 'i18n.css'));
  console.log(`english: ${pages.length} pages decorated in ${out}`);
}

/** images: every inlined image of 4 KB or more becomes one shared file assets/img/<sha12>.<ext> (run on the English tree, before extract and apply). */
function images(args) {
  const { opt } = args2opt(args, { tree: 'web', min: '4096', dir: 'assets/img' });
  const min = +opt.min;
  const EXT = { 'image/png': 'png', 'image/jpeg': 'jpg', 'image/webp': 'webp', 'image/gif': 'gif', 'image/svg+xml': 'svg', 'image/avif': 'avif' };
  const outDir = join(opt.tree, opt.dir);
  mkdirSync(outDir, { recursive: true });
  const files = walk(opt.tree, []);
  let before = 0, after = 0, uses = 0;
  const distinct = new Set();
  const reAttr = /(\s(?:src|href|xlink:href|poster)=)(["'])data:(image\/[a-z+]+)(?:;[a-z0-9-]+=[a-z0-9-]+)*(;base64)?,([\s\S]*?)\2/g;
  const reUrl = /url\((["']?)data:(image\/[a-z+]+)(?:;[a-z0-9-]+=[a-z0-9-]+)*(;base64)?,([\s\S]*?)\1\)/g;
  const take = (whole, mime, b64, data, prefix) => {
    if (whole.length < min || !EXT[mime]) return null;
    const buf = b64 ? Buffer.from(data, 'base64') : Buffer.from(decodeURIComponent(data.replace(/&amp;/g, '&')), 'utf8');
    const name = sha12(buf.toString('latin1')) + '.' + EXT[mime];
    const dst = join(outDir, name);
    if (!existsSync(dst)) writeFileSync(dst, buf);
    distinct.add(name); uses++;
    return `${prefix}${opt.dir}/${name}`;
  };
  for (const rel of files) {
    const p = join(opt.tree, rel);
    const html = readFileSync(p, 'utf8');
    before += html.length;
    const prefix = '../'.repeat(rel.split('/').length - 1);
    let out = html.replace(reAttr, (m, a, q, mime, b64, data) => { const u = take(m, mime, b64, data, prefix); return u ? `${a}${q}${u}${q}` : m; });
    out = out.replace(reUrl, (m, q, mime, b64, data) => { const u = take(m, mime, b64, data, prefix); return u ? `url(${q}${u}${q})` : m; });
    after += out.length;
    if (out !== html) writeFileSync(p, out);
  }
  console.log(`images: ${uses} inlined images (${distinct.size} distinct files in ${opt.dir}); HTML ${(before / 1e6).toFixed(1)} MB -> ${(after / 1e6).toFixed(1)} MB`);
}

/** size: bytes of the English tree and of each language tree; fails when the whole deploy tree is over the cap (check.py rule 12 says 500 MB). */
function size(args) {
  const { opt } = args2opt(args, { tree: 'web', dist: 'dist', cap: '500' });
  const du = (d) => { let n = 0; if (!existsSync(d)) return 0; for (const e of readdirSync(d, { withFileTypes: true })) { const p = join(d, e.name); n += e.isDirectory() ? du(p) : statSync(p).size; } return n; };
  const en = du(opt.tree);
  console.log(`English tree: ${(en / 1e6).toFixed(1)} MB (${opt.tree})`);
  let langs = 0;
  if (existsSync(opt.dist)) for (const l of readdirSync(opt.dist)) { const n = du(join(opt.dist, l)); langs += n; console.log(`  ${l}: ${(n / 1e6).toFixed(1)} MB`); }
  const total = en + langs, cap = +opt.cap * 1e6;
  console.log(`total ${(total / 1e6).toFixed(1)} MB, cap ${opt.cap} MB: ${total > cap ? 'OVER' : 'ok'}`);
  if (total > cap) process.exit(1);
}

/** sitemaps: sitemap.xml becomes an index of sitemap-en.xml and every <lang>/sitemap.xml (pages at least 80 % translated only). */
function sitemaps(args) {
  const { opt } = args2opt(args, { tree: 'site', origin: 'https://kshana.dev' });
  const root = join(opt.tree, 'sitemap.xml'), en = join(opt.tree, 'sitemap-en.xml');
  if (!existsSync(en)) { if (!existsSync(root)) { console.error('sitemaps: no sitemap.xml'); process.exit(1); } writeFileSync(en, readFileSync(root)); }
  const maps = ['sitemap-en.xml'];
  for (const e of readdirSync(opt.tree, { withFileTypes: true })) if (e.isDirectory() && existsSync(join(opt.tree, e.name, 'sitemap.xml'))) maps.push(`${e.name}/sitemap.xml`);
  writeFileSync(root, `<?xml version="1.0" encoding="UTF-8"?>\n<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${maps.map((m) => `  <sitemap><loc>${opt.origin}/${m}</loc></sitemap>`).join('\n')}\n</sitemapindex>\n`);
  console.log(`sitemaps: index of ${maps.length} sitemaps`);
}

/** langs: the languages to build, those whose catalogue covers at least --min of the English segments (a comma list on stdout). */
async function langsCmd(args) {
  const L = await lang();
  const { opt } = args2opt(args, { root: 'i18n', min: '0.25' });
  const out = L.LANGS.filter((l) => { const r = L.statusLang(opt.root, l); return r.total && r.translated / r.total >= +opt.min; });
  console.log(out.join(','));
}

/** verify: compare every page of a language tree with its English page: the multiset of numeric values (separators ignored),
 *  code spans and link targets must be equal, and the machine-translation notice must be present (design v2, section 5). */
async function verify(args) {
  const L = await lang();
  const { opt, pos } = args2opt(args, { src: 'web', dist: 'dist', skip: 'studio,playground,assets' });
  const pages = walk(opt.src, [...String(opt.skip).split(',').filter(Boolean), ...L.LANGS, 'en-XA']);
  const langs = pos.length ? pos : L.LANGS.filter((l) => existsSync(join(opt.dist, l)));
  const visible = (h) => h.replace(/<(script|style|svg|template|head)\b[\s\S]*?<\/\1>/gi, ' ').replace(/<[^>]*>/g, ' ');
  // digit runs: invariant under the locale's group and decimal separators, which is all a translation may change
  const nums = (h) => (visible(h).replace(/&[a-z#0-9]+;/gi, ' ').match(/\d+/g) || []).sort().join(' ');
  const codes = (h) => (h.match(/<code\b[^>]*>[\s\S]*?<\/code>/gi) || []).filter((c) => !/^<code\b[^>]*data-i18n-t/i.test(c)).map((c) => c.replace(/<[^>]*>/g, '').replace(/\s+/g, ' ').trim()).filter((c) => !looksLikeProse(c.replace(/&[a-z#0-9]+;/gi, ' '))).sort().join('\n');
  const hrefs = (h, pre) => (h.match(/<a\b[^>]*?\shref="([^"]*)"/gi) || []).map((a) => a.match(/href="([^"]*)"/)[1].replace(new RegExp('^' + pre), '')).filter((x) => !x.startsWith('#')).sort().join('\n');
  let bad = 0;
  for (const lang of langs) {
    let n = 0;
    for (const rel of pages) {
      const p = join(opt.dist, lang, rel);
      if (!existsSync(p)) { console.log(`ERROR ${lang}/${rel}: page missing`); bad++; continue; }
      const en = readFileSync(join(opt.src, rel), 'utf8'), tr = readFileSync(p, 'utf8');
      // the notices and the switcher are added by apply: drop them before comparing
      const strip = (h) => h.replace(/<div class="i18n-notice"[\s\S]*?<\/div>/, '').replace(/<details class="lang-menu"[\s\S]*?<\/details>/, '').replace(/<template id="i18n-detected"[\s\S]*?<\/template>/, '');
      const t = strip(tr);
      const diff = (x, y, sep) => { const cnt = new Map(); for (const k of x.split(sep)) cnt.set(k, (cnt.get(k) || 0) + 1); for (const k of y.split(sep)) cnt.set(k, (cnt.get(k) || 0) - 1); return [...cnt].filter(([, v]) => v).slice(0, 4).map(([k, v]) => `${v > 0 ? '-' : '+'}${JSON.stringify(k.slice(0, 60))}`).join(' '); };
      if (nums(en) !== nums(t)) { bad++; n++; console.log(`ERROR ${lang}/${rel}: the numeric values differ from the English page (${diff(nums(en), nums(t), ' ')})`); }
      if (codes(en) !== codes(t)) { bad++; n++; console.log(`ERROR ${lang}/${rel}: the code spans differ from the English page (${diff(codes(en), codes(t), '\n')})`); }
      const here = '/' + rel.replace(/(^|\/)index\.html$/, '$1').replace(/\.html$/, '');
      const norm = (h, pre) => { let x = pre ? h.replace(new RegExp('^' + pre + '(?=/)'), '') : h; if (x.startsWith(here + '#')) x = x.slice(here.length); return x; };
      const all = (h) => (h.match(/<a\b[^>]*?\shref="([^"]*)"/gi) || []).map((x) => x.match(/href="([^"]*)"/)[1]);
      const a = all(en).map((h) => norm(h, '')).filter((h) => !/^[a-z]+:/i.test(h)).sort();
      const b = all(t).map((h) => norm(h, '/' + lang)).filter((h) => !/^[a-z]+:/i.test(h)).sort();
      if (a.join('\n') !== b.join('\n')) { bad++; n++; console.log(`ERROR ${lang}/${rel}: the link targets differ from the English page`); }
      if (!/class="i18n-notice"/.test(tr)) { bad++; n++; console.log(`ERROR ${lang}/${rel}: the machine-translation notice is missing`); }
    }
    console.log(`${lang}: ${pages.length} pages verified, ${n} problems`);
  }
  if (bad) process.exit(1);
}

/** csslint: physical properties that have a logical form (design v2, section 9). `--fix` converts the safe ones in place:
 *  margin/padding/border -left/-right, left:/right: (inset-inline-*), text-align and float left/right. Reports what is left
 *  (four-value shorthands, border radii, physical values written by script). Pass files or directories. */
function csslint(args) {
  const { opt, pos } = args2opt(args, { fix: false, max: '' });
  const files = [];
  const gather = (p) => { const st = statSync(p); if (st.isDirectory()) { for (const e of readdirSync(p)) gather(join(p, e)); } else if (p.endsWith('.css')) files.push(p); };
  for (const p of pos) gather(p);
  const MAP = [
    [/(?<![-\w])margin-left(?=\s*:)/g, 'margin-inline-start'], [/(?<![-\w])margin-right(?=\s*:)/g, 'margin-inline-end'],
    [/(?<![-\w])padding-left(?=\s*:)/g, 'padding-inline-start'], [/(?<![-\w])padding-right(?=\s*:)/g, 'padding-inline-end'],
    [/(?<![-\w])border-left(?=(?:-(?:color|width|style))?\s*:)/g, 'border-inline-start'], [/(?<![-\w])border-right(?=(?:-(?:color|width|style))?\s*:)/g, 'border-inline-end'],
    [/(?<![-\w])left(?=\s*:)/g, 'inset-inline-start'], [/(?<![-\w])right(?=\s*:)/g, 'inset-inline-end'],
    [/(?<![-\w])(text-align\s*:\s*)left\b/g, '$1start'], [/(?<![-\w])(text-align\s*:\s*)right\b/g, '$1end'],
    [/(?<![-\w])(float\s*:\s*)left\b/g, '$1inline-start'], [/(?<![-\w])(float\s*:\s*)right\b/g, '$1inline-end'],
    [/(?<![-\w])(clear\s*:\s*)left\b/g, '$1inline-start'], [/(?<![-\w])(clear\s*:\s*)right\b/g, '$1inline-end'],
  ];
  let fixed = 0;
  const left = [];
  for (const f of files) {
    let t = readFileSync(f, 'utf8');
    const orig = t;
    if (opt.fix) for (const [re, to] of MAP) { const m = t.match(re); if (m) { fixed += m.length; t = t.replace(re, to); } }
    if (opt.fix) { // four-value margin and padding: top right bottom left -> block and inline pairs
      t = t.replace(/(?<![-\w])(margin|padding)\s*:\s*([^;}]+)/g, (m, prop, val) => {
        const imp = /\s*!important\s*$/.test(val) ? ' !important' : '';
        const parts = []; let depth = 0, cur = '';
        for (const ch of val.replace(/\s*!important\s*$/, '').trim()) { if (ch === '(') depth++; if (ch === ')') depth--; if (/\s/.test(ch) && depth === 0) { if (cur) parts.push(cur); cur = ''; } else cur += ch; }
        if (cur) parts.push(cur);
        if (parts.length !== 4) return m;
        const [a, r, b, l] = parts;
        fixed++;
        return `${prop}-block:${a === b ? a : a + ' ' + b}${imp};${prop}-inline:${l === r ? l : l + ' ' + r}${imp}`;
      });
    }
    if (opt.fix && t !== orig) writeFileSync(f, t);
    // what remains
    const lines = t.split('\n');
    lines.forEach((ln, i) => {
      const hits = [];
      if (/(?<![-\w])(margin|padding)\s*:\s*[^;}]+\s+[^;}]+\s+[^;}]+\s+[^;}]+/.test(ln)) hits.push('four-value margin/padding');
      if (/border-(top|bottom)-(left|right)-radius/.test(ln)) hits.push('physical border radius');
      if (/(?<![-\w])(margin-left|margin-right|padding-left|padding-right|border-left|border-right)(?=[-\w]*\s*:)/.test(ln)) hits.push('physical property');
      if (/(?<![-\w])(left|right)(?=\s*:)/.test(ln)) hits.push('left/right');
      if (/text-align\s*:\s*(left|right)/.test(ln)) hits.push('text-align');
      if (/(^|[;{\s])(transition[^;]*\b(left|right)\b)/.test(ln)) hits.push('transition on left/right');
      for (const h of hits) left.push(`${f}:${i + 1}: ${h}`);
    });
  }
  if (opt.fix) console.log(`csslint: ${fixed} properties converted in ${files.length} files`);
  console.log(`csslint: ${left.length} physical properties remain in ${files.length} files`);
  for (const l of left.slice(0, 40)) console.log('  ' + l);
  if (opt.max !== '' && left.length > +opt.max) process.exit(1);
}

const [cmd, ...rest] = process.argv.slice(2);
if (import.meta.url === `file://${process.argv[1]}`) {
  const run = { extract: async () => extract(rest), status: () => status(rest), check: () => check(rest), pseudo: () => pseudo(rest), apply: () => apply(rest), images: async () => images(rest), csslint: async () => csslint(rest), verify: () => verify(rest), langs: () => langsCmd(rest), sitemaps: async () => sitemaps(rest), size: async () => size(rest), english: () => english(rest) }[cmd];
  if (run) await run();
  else if (!cmd) { console.error('usage: node tools/i18n.mjs extract|apply|check|status|pseudo|csslint'); process.exit(2); }
  else { console.error(`i18n: '${cmd}' is not built yet`); process.exit(2); }
}
