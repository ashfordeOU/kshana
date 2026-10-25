#!/usr/bin/env node
// Pseudo-locale test (design v2, section 8): serve an applied en-XA tree over the English site and fail on
//   (a) visible text of a page that lacks the pseudo markers (a hard-coded or untranslated string),
//   (b) horizontal overflow at 1440 and 390 px,
//   (c) a missing id (fallback to English in the pseudo-locale build).
//
//   node tools/i18n-pseudo-test.mjs [--dist dist] [--src web] [--lang en-XA] [--pages docs/agents,index,...] [--all]
//
// Needs Playwright (require('playwright')). Pages are given as site paths without .html.

import http from 'node:http';
import { readFileSync, existsSync, statSync, readdirSync } from 'node:fs';
import { join, extname, relative, sep } from 'node:path';
import { createRequire } from 'node:module';

const argv = process.argv.slice(2);
const opt = { dist: 'dist', src: 'web', lang: 'en-XA', pages: 'index,docs/agents,docs/verification-matrix,docs/kind-clock,evidence,docs/overview', all: false };
for (let i = 0; i < argv.length; i++) { const k = argv[i].replace(/^--/, ''); if (k === 'all') opt.all = true; else opt[k] = argv[++i]; }

const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.mjs': 'text/javascript', '.css': 'text/css', '.json': 'application/json', '.svg': 'image/svg+xml', '.png': 'image/png', '.woff2': 'font/woff2', '.wasm': 'application/wasm', '.txt': 'text/plain' };
const resolveFile = (root, path) => {
  let p = join(root, decodeURIComponent(path.split('?')[0]));
  for (const c of [p, p + '.html', join(p, 'index.html')]) if (existsSync(c) && statSync(c).isFile()) return c;
  return null;
};
const server = http.createServer((req, res) => {
  const url = req.url;
  const inLang = url === '/' + opt.lang || url.startsWith('/' + opt.lang + '/');
  const f = inLang ? resolveFile(opt.dist, url) : resolveFile(opt.src, url);
  if (!f) { res.writeHead(404); res.end('not found'); return; }
  res.writeHead(200, { 'content-type': MIME[extname(f)] || 'application/octet-stream' });
  res.end(readFileSync(f));
});
await new Promise((r) => server.listen(0, '127.0.0.1', r));
const base = `http://127.0.0.1:${server.address().port}`;

const walkPages = (dir, acc = [], root = dir) => {
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    if (e.isDirectory()) walkPages(join(dir, e.name), acc, root);
    else if (e.name.endsWith('.html')) acc.push(relative(root, join(dir, e.name)).split(sep).join('/').replace(/\.html$/, ''));
  }
  return acc;
};
const pages = opt.all ? walkPages(join(opt.dist, opt.lang)) : opt.pages.split(',');

const require = createRequire(import.meta.url);
const { chromium } = require('playwright');
const browser = await chromium.launch();
let failures = 0, dynamic = 0;
const probe = () => {
  const LEAF = 'p,li,h1,h2,h3,h4,h5,h6,td,th,dt,dd,figcaption,summary,button,label,caption,blockquote,option,legend';
  const bad = [];
  for (const el of document.body.querySelectorAll(LEAF)) {
    if (el.closest('script,style,svg,pre,code,textarea,[data-no-i18n],[translate=no],[data-engine-output],.lang-menu')) continue;
    if (el.querySelector(LEAF)) continue;
    const st = getComputedStyle(el);
    if (st.display === 'none' || st.visibility === 'hidden') continue;
    const cl = el.cloneNode(true);
    for (const c of cl.querySelectorAll('code,kbd,samp,var,tt')) c.remove();
    const t = cl.textContent.replace(/\s+/g, ' ').trim().replace(/#$/, '');
    if (!/\p{L}/u.test(t.replace(/\b[A-Z]{3,}\b/g, ''))) continue;
    const isId = (w) => /^[\p{L}\p{N}_.:/^*+=<>()%[\]-]+$/u.test(w) && /[-_.:/^0-9]/.test(w);
    if (t.split(/[\s,;|·]+/).filter(Boolean).every(isId)) continue; // identifiers, file names, formulas
    if (!t.includes('⟦')) bad.push(t.slice(0, 80));
  }
  const de = document.documentElement;
  const wide = [];
  if (de.scrollWidth > de.clientWidth + 1) {
    const clipped = (e) => { for (let a = e.parentElement; a && a !== document.body; a = a.parentElement) if (getComputedStyle(a).overflowX !== 'visible') return true; return false; };
    for (const e of document.body.querySelectorAll('*')) { const r = e.getBoundingClientRect(); if (r.right > de.clientWidth + 1 && r.width > 0 && !clipped(e)) wide.push(`${e.tagName.toLowerCase()}${e.className ? '.' + String(e.className).split(' ')[0] : ''} right=${Math.round(r.right)}`); }
  }
  return { bad, width: de.scrollWidth, client: de.clientWidth, wide: wide.slice(0, 5) };
};
for (const width of [1440, 390]) {
  for (const js of [false, true]) {
    const ctx = await browser.newContext({ viewport: { width, height: 900 }, javaScriptEnabled: js });
    const page = await ctx.newPage();
    for (const p of pages) {
      const path = p === 'index' ? '' : p;
      await page.goto(`${base}/${opt.lang}/${path}`, { waitUntil: 'load' });
      if (js) await page.waitForTimeout(300);
      const r = await page.evaluate(probe);
      if (!js) {
        await page.goto(`${base}/${path}`, { waitUntil: 'load' });
        const en = await page.evaluate(probe);
        if (r.width > en.width + 2) { failures++; console.log(`FAIL ${width}px /${opt.lang}/${p}: horizontal overflow (${r.width} against ${en.width} in English; widest: ${r.wide.join(', ')})`); }
        if (r.bad.length) { failures++; console.log(`FAIL ${width}px /${opt.lang}/${p}: ${r.bad.length} static text blocks without markers, e.g. ${JSON.stringify(r.bad.slice(0, 3))}`); }
      } else if (r.bad.length && width === 1440) {
        dynamic += r.bad.length;
        console.log(`note /${opt.lang}/${p}: ${r.bad.length} script-written text blocks without markers, e.g. ${JSON.stringify(r.bad.slice(0, 2))}`);
      }
    }
    await ctx.close();
  }
}
await browser.close();
server.close();
console.log(failures ? `${failures} failures` : `pseudo-locale test passed on ${pages.length} pages`, `(${dynamic} script-written blocks to move into catalogues)`);
process.exit(failures ? 1 : 0);
