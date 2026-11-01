#!/usr/bin/env node
// Language negotiation test (design v2, section 4): first-visit detection from navigator.languages, the stored choice,
// and that a direct /<lang>/ URL does not overwrite the stored choice.
//   node tools/i18n-negotiation-test.mjs [--en <decorated English tree>]
import http from 'node:http';
import { readFileSync, existsSync, statSync } from 'node:fs';
import { join, extname } from 'node:path';
import { createRequire } from 'node:module';

const argv = process.argv.slice(2);
const root = argv[argv.indexOf('--en') + 1];
if (!root) { console.error('usage: i18n-negotiation-test.mjs --en <tree>'); process.exit(2); }
const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.css': 'text/css' };
const file = (u) => { const p = join(root, decodeURIComponent(u.split('?')[0])); for (const c of [p, p + '.html', join(p, 'index.html')]) if (existsSync(c) && statSync(c).isFile()) return c; return null; };
const server = http.createServer((req, res) => { const f = file(req.url); if (!f) { res.writeHead(404, { 'content-type': 'text/html' }); res.end('<!doctype html><title>x</title>'); return; } res.writeHead(200, { 'content-type': MIME[extname(f)] || 'application/octet-stream' }); res.end(readFileSync(f)); });
await new Promise((r) => server.listen(0, '127.0.0.1', r));
const base = `http://127.0.0.1:${server.address().port}`;
const { chromium } = createRequire(import.meta.url)('playwright');
const browser = await chromium.launch();

const cases = [
  ['de-AT', null, '/docs/overview', '/de/docs/overview'],
  [['en-US', 'de'], null, '/docs/overview', '/docs/overview'],
  [['xx', 'fr'], null, '/', '/fr/'],
  ['pt-BR', null, '/', '/pt-BR/'],
  ['pt', null, '/', '/pt-BR/'],
  ['pt-PT', null, '/', '/pt-PT/'],
  ['no', null, '/', '/nb/'],
  ['nn-NO', null, '/', '/nb/'],
  ['zh-CN', null, '/', '/zh-Hans/'],
  ['zh-Hans-SG', null, '/', '/zh-Hans/'],
  ['zh-TW', null, '/', '/'],
  ['zh-HK', null, '/', '/'],
  ['ja', null, '/', '/ja/'],
  ['de', 'en', '/', '/'],            // an explicit English choice wins
  ['en', 'pl', '/', '/pl/'],         // a stored choice wins over detection
  ['de', null, '/docs/overview?lang=fi', '/fi/docs/overview'],
  ['de', null, '/studio/', '/studio/'], // the Studio negotiates for itself
];
let fail = 0;
for (const [langs, stored, path, want] of cases) {
  const ctx = await browser.newContext();
  const page = await ctx.newPage();
  const list = Array.isArray(langs) ? langs : [langs];
  await page.addInitScript(([l, s]) => {
    Object.defineProperty(navigator, 'languages', { get: () => l });
    Object.defineProperty(navigator, 'language', { get: () => l[0] });
    if (s && !sessionStorage.getItem('seeded')) { localStorage.setItem('kshana-lang', s); sessionStorage.setItem('seeded', '1'); }
  }, [list, stored]);
  await page.goto(base + path, { waitUntil: 'commit' }).catch(() => {});
  await page.waitForTimeout(400);
  const u = new URL(page.url());
  const got = u.pathname + (u.search && !u.search.includes('lang=') ? u.search : '');
  const ok = got === want;
  if (!ok) { fail++; console.log(`FAIL languages=${JSON.stringify(list)} stored=${stored} ${path}: got ${got}, want ${want}`); }
  await ctx.close();
}
// a ?lang= link or a direct /<lang>/ URL is not remembered (following a link must not make English unreachable); a switcher click is
{
  const ctx = await browser.newContext();
  const page = await ctx.newPage();
  await page.goto(base + '/docs/overview?lang=sv', { waitUntil: 'commit' }).catch(() => {});
  await page.waitForTimeout(300);
  const st = await page.evaluate(() => localStorage.getItem('kshana-lang')).catch(() => null);
  if (st !== null) { fail++; console.log(`FAIL ?lang=sv switches the page but must not be remembered, got ${st}`); }
  await ctx.close();
}
{
  const ctx = await browser.newContext();
  const page = await ctx.newPage();
  await page.goto(base + '/', { waitUntil: 'load' });
  const links = await page.$$eval('.lang-menu a', (a) => a.length);
  if (links !== 18) { fail++; console.log(`FAIL the switcher lists ${links} languages, want 18`); }
  await page.evaluate(() => document.querySelector('.lang-menu summary').click());
  await page.route('**/de/**', (r) => r.fulfill({ status: 200, contentType: 'text/html', body: '<!doctype html><title>de</title>' }));
  await page.click('.lang-menu a[hreflang="de"]');
  await page.waitForTimeout(300);
  const st = await page.evaluate(() => localStorage.getItem('kshana-lang'));
  if (st !== 'de') { fail++; console.log(`FAIL a switcher click should store de, got ${st}`); }
  await ctx.close();
}
await browser.close(); server.close();
console.log(fail ? `${fail} failures` : `negotiation test passed (${cases.length + 2} cases)`);
process.exit(fail ? 1 : 0);
