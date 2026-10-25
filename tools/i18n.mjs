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
import { readdirSync, readFileSync, writeFileSync, mkdirSync, existsSync, statSync, rmSync } from 'node:fs';
import { join, relative, dirname, sep } from 'node:path';

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
  const rawCode = (txt) => { codes.push(norm(txt).trim()); return `<c${++cnt.c}/>`; };
  const render = (n, first, last) => {
    if (n.k === 'text') { let v = n.v; return fmtText(v, true); }
    if (n.k === 'br') return '<br/>';
    if (n.k === 'code') return rawCode(n.v);
    if (isDeco(n)) return rawCode(textOf(n));
    let tag;
    if (n.name === 'a') tag = `a${++cnt.a}`; else if (n.name === 'strong' || n.name === 'b') tag = 'b'; else if (n.name === 'em' || n.name === 'i') tag = 'em'; else tag = `s${++cnt.s}`;
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
  return { skel, codes, start, end };
}

/** Segments of one page: [{skel, codes, kind, start, end | at, attr}] in document order. */
export function segments(html) {
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
      if (CODE.has(tk.name)) { run.code = { s: tk.s, v: '' }; run.depth = (run.depth || 0) + 1; continue; }
      run.nodes.push({ k: 'open', name: tk.name, attrs: tk.attrs, s: tk.s, e: tk.e });
      run.depth = (run.depth || 0) + 1;
      stack.push({ name: tk.name, inline: true });
    } else if (tk.t === 'close') {
      if (tk.name === 'head') { flush(); inHead = false; continue; }
      if (tk.name === 'title' && inHead) { flush(); continue; }
      if (inHead) continue;
      if (BLOCK.has(tk.name)) { flush(); const i = stack.map((s) => s.name).lastIndexOf(tk.name); if (i >= 0) stack.length = i; continue; }
      if (VOID.has(tk.name)) continue;
      if (CODE.has(tk.name) && run && run.code) { run.nodes.push({ k: 'code', v: run.code.v, s: run.code.s, e: tk.e }); run.code = null; run.depth--; continue; }
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

function fmtText(text, keepEdges = false) {
  let t = text.replace(/\s+/g, ' ');
  if (!keepEdges) t = t.trim();
  t = t.replace(/[{}]/g, (c) => `{ "${c}" }`);
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
  const opt = { src: 'web', out: 'i18n/en/pages', sharedMin: 25, skip: 'studio,playground' };
  for (let i = 0; i < args.length; i += 2) {
    const k = args[i].replace(/^--/, '').replace(/-([a-z])/g, (_, c) => c.toUpperCase());
    opt[k] = args[i + 1];
  }
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

const [cmd, ...rest] = process.argv.slice(2);
if (import.meta.url === `file://${process.argv[1]}`) {
  if (cmd === 'extract') extract(rest);
  else if (!cmd) { console.error('usage: node tools/i18n.mjs extract|apply|check|status|pseudo|csslint'); process.exit(2); }
  else { console.error(`i18n: '${cmd}' is not built yet`); process.exit(2); }
}
