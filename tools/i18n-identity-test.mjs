#!/usr/bin/env node
// English identity check: render the same pages from two trees (the code before and after the string conversion), in English, and diff the
// visible text. Each page is loaded, left to settle, and every tab is opened in turn; the text of every state is compared.
//   node tools/i18n-identity-test.mjs --a <old tree> --b <new tree> [--urls studio/,studio/advanced/,...] [--scenarios 16] [--wait 3000]
// Reports each page whose text differs, with the first differing lines. Exit 1 when any differs. Needs Playwright.
import http from 'node:http';
import { readFileSync, existsSync, statSync, readdirSync } from 'node:fs';
import { join, extname } from 'node:path';
import { createRequire } from 'node:module';

const argv = process.argv.slice(2);
const opt = { a: '', b: '', urls: '', scenarios: '16', wait: '3000', tabs: 'true' };
for (let i = 0; i < argv.length; i += 2) opt[argv[i].replace(/^--/, '')] = argv[i + 1];
if (!opt.a || !opt.b) { console.error('usage: i18n-identity-test.mjs --a OLD --b NEW [--urls u1,u2] [--scenarios N]'); process.exit(2); }
const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.mjs': 'text/javascript', '.css': 'text/css', '.json': 'application/json', '.svg': 'image/svg+xml', '.png': 'image/png', '.woff2': 'font/woff2', '.ftl': 'text/plain; charset=utf-8', '.wasm': 'application/wasm', '.txt': 'text/plain' };
const serve = (root) => new Promise((res) => {
  const s = http.createServer((q, r) => {
    const p = join(root, decodeURIComponent(q.url.split('?')[0]));
    for (const c of [p, p + '.html', join(p, 'index.html')]) if (existsSync(c) && statSync(c).isFile()) { r.writeHead(200, { 'content-type': MIME[extname(c)] || 'application/octet-stream' }); return r.end(readFileSync(c)); }
    r.writeHead(404); r.end();
  }).listen(0, '127.0.0.1', () => res(s));
});
const A = await serve(opt.a), B = await serve(opt.b);
const { chromium } = createRequire(import.meta.url)('playwright');
const browser = await chromium.launch();

let urls = opt.urls ? opt.urls.split(',') : null;
if (!urls) {
  urls = ['', 'advanced/', 'geometry/', 'holdover/', 'interference/', 'lunar-infra/', 'lunar/', 'observatory/', 'optical/', 'replay/', 'ssv/', 'tools/', 'training/', 'trust/'].map((u) => `studio/${u}`);
  const rec = join(opt.a, 'studio', 'recorded');
  const files = existsSync(rec) ? readdirSync(rec).filter((f) => f.endsWith('.json')).map((f) => f.replace(/\.json$/, '')).sort() : [];
  const n = +opt.scenarios, step = Math.max(1, Math.floor(files.length / n));
  for (let i = 0; i < files.length && urls.length < 14 + 2 * n; i += step) { urls.push(`studio/?scenario=${files[i]}.toml`); urls.push(`studio/advanced/?scenario=${files[i]}.toml`); }
}

async function collect(base, url) {
  const ctx = await browser.newContext({ viewport: { width: 1280, height: 900 }, locale: 'en-GB' });
  await ctx.addInitScript(() => { try { localStorage.setItem('kshana-lang', 'en'); } catch {} Math.random = () => 0.5; });
  const page = await ctx.newPage();
  const errs = [];
  page.on('pageerror', (e) => errs.push(String(e).slice(0, 120)));
  await page.goto(`${base}/${url}`, { waitUntil: 'load' }).catch(() => {});
  await page.waitForTimeout(+opt.wait);
  const states = [];
  await page.addStyleTag({ content: '#lang-sel,.lang-menu{display:none!important}' }).catch(() => {});
  const grab = async (label) => states.push([label, (await page.evaluate(() => document.body.innerText).catch(() => '')).replace(/\d\d:\d\d:\d\d/g, 'hh:mm:ss').replace(/\s+/g, ' ').trim()]); // clock times differ between runs
  await grab('load');
  if (opt.tabs === 'true') {
    const tabs = await page.$$('[role=tab]:not([hidden])');
    for (let i = 0; i < Math.min(tabs.length, 14); i++) {
      try { const t2 = (await page.$$('[role=tab]:not([hidden])'))[i]; if (!t2 || !(await t2.isVisible())) continue; const nm = (await t2.textContent() || '').trim().slice(0, 30); await t2.click({ timeout: 2000 }); await page.waitForTimeout(500); await grab('tab:' + nm); } catch {}
    }
  }
  await ctx.close();
  return { states, errs };
}

let bad = 0, same = 0;
for (const u of urls) {
  const [a, b] = [await collect(`http://127.0.0.1:${A.address().port}`, u), await collect(`http://127.0.0.1:${B.address().port}`, u)];
  const m = new Map(a.states);
  const diffs = [];
  for (const [label, text] of b.states) {
    const old = m.get(label);
    if (old === undefined) { diffs.push(`state "${label}" exists only in the new code`); continue; }
    // whitespace is layout (a wrapper element can add or drop a space between flex items), the words are the text: compare without it
    const [wa, wb] = [old.replace(/\s+/g, ''), text.replace(/\s+/g, '')];
    if (wa !== wb) {
      let i = 0; while (i < wa.length && i < wb.length && wa[i] === wb[i]) i++;
      diffs.push(`${label}: first difference at character ${i} of ${wa.length} against ${wb.length}: old ...${JSON.stringify(wa.slice(Math.max(0, i - 40), i + 60))} new ...${JSON.stringify(wb.slice(Math.max(0, i - 40), i + 60))}`);
    }
  }
  for (const [label] of a.states) if (!b.states.some(([l]) => l === label)) diffs.push(`state "${label}" exists only in the old code`);
  const newErrs = b.errs.filter((e) => !a.errs.includes(e));
  if (diffs.length || newErrs.length) { bad++; console.log(`DIFF /${u}`); for (const d of diffs.slice(0, 4)) console.log('   ' + d.slice(0, 400)); for (const e of newErrs.slice(0, 2)) console.log('   new error: ' + e); }
  else same++;
}
console.log(`${same} of ${same + bad} pages render the same visible English text (all tabs)`);
await browser.close(); A.close(); B.close();
process.exit(bad ? 1 : 0);
