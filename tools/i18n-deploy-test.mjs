#!/usr/bin/env node
// The deployed tree in a real browser: the run-time catalogues load and the language is the page's.
//
//   node tools/i18n-deploy-test.mjs --tree <built deploy-style tree> --langs de,ja [--no-engine]
//
// The tree is what pages.yml uploads (tools/i18n.mjs apply ... english, share-engine, prune-data, catalogues): it is served as it is, with
// nothing from web/ behind it, so a file the deploy leaves out answers 404 here as it would on kshana.dev. For each language:
//   * /<lang>/ (a translated site page): window.kshanaL10n.lang equals the language, <html lang> too, /i18n/<lang>/{ui,glossary,site-js}.ftl and the English
//     fallbacks answer 200 and are not empty, the language's own page text is not English;
//   * /<lang>/evidence: no script error, the Orbit ladder draws its nine points (the page looks rows up by key, not by the words of a translated label)
//     and the SGP4 and Cowell figures are there;
//   * /<lang>/missions draws the cone with its two series and shows no campaign hash in the Engine chips; /<lang>/capabilities, /developers and the home page
//     draw without a script error; capabilities.json carries the constellation keys the page colours by;
//   * /studio/?lang=<lang>: kshanaL10n.lang equals the language, ui, glossary, studio-js and studio-pages answer 200, a [data-l10n] element shows the
//     language's text.
// Every same-origin request must answer 200 except the language-copy probes of fetchData/importData (a 404 on /<lang>/<path> falls back to the English
// file, by design) and, with --no-engine, the engine package. Needs Playwright (NODE_PATH=/opt/node22/lib/node_modules).
import http from 'node:http';
import { readFileSync, existsSync, statSync } from 'node:fs';
import { join, extname } from 'node:path';
import { createRequire } from 'node:module';

const argv = process.argv.slice(2);
const opt = { tree: '', langs: 'de,ja', noEngine: false };
for (let i = 0; i < argv.length; i++) { const k = argv[i].replace(/^--/, ''); if (k === 'no-engine') opt.noEngine = true; else opt[k.replace(/-(\w)/g, (_, c) => c.toUpperCase())] = argv[++i]; }
if (!opt.tree || !existsSync(opt.tree)) { console.error('usage: i18n-deploy-test.mjs --tree <deploy tree> [--langs de,ja] [--no-engine]'); process.exit(2); }
const langs = opt.langs.split(',').filter(Boolean);

const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript', '.mjs': 'text/javascript', '.css': 'text/css', '.json': 'application/json', '.svg': 'image/svg+xml', '.png': 'image/png', '.jpg': 'image/jpeg', '.webp': 'image/webp', '.woff2': 'font/woff2', '.wasm': 'application/wasm', '.ftl': 'text/plain; charset=utf-8', '.txt': 'text/plain', '.xml': 'application/xml', '.toml': 'text/plain', '.ico': 'image/x-icon' };
const resolveFile = (path) => {
  let rel; try { rel = decodeURIComponent(path.split('?')[0].split('#')[0]); } catch { return null; }
  if (rel.includes('..')) return null;
  const p = join(opt.tree, rel);
  for (const c of [p, p + '.html', join(p, 'index.html')]) if (existsSync(c) && statSync(c).isFile()) return c;
  return null;
};
const server = http.createServer((req, res) => {
  const f = resolveFile(req.url);
  if (!f) { res.writeHead(404, { 'content-type': 'text/plain' }); res.end('not found'); return; }
  res.writeHead(200, { 'content-type': MIME[extname(f)] || 'application/octet-stream' });
  res.end(readFileSync(f));
});
await new Promise((r) => server.listen(0, '127.0.0.1', r));
const base = `http://127.0.0.1:${server.address().port}`;

const require = createRequire(import.meta.url);
const { chromium } = require('playwright');
const browser = await chromium.launch();
let failures = 0, checks = 0;
const ok = (cond, msg) => { checks++; if (!cond) { failures++; console.error(`FAIL ${msg}`); } };

const isEngine = (u) => /\/pkg\/|kshana_bg\.wasm/.test(u);
async function visit(path, label, after) {
  const ctx = await browser.newContext({ viewport: { width: 1440, height: 900 }, locale: 'en-US' });
  const page = await ctx.newPage();
  const errors = [], bad = [], seen = [];
  page.on('pageerror', (e) => { if (!(opt.noEngine && /pkg|wasm|engine|dynamically imported/i.test(String(e.message)))) errors.push(String(e.message).slice(0, 200)); });
  page.on('console', (m) => { if (m.type() === 'error' && !/Failed to load resource/.test(m.text()) && !(opt.noEngine && /pkg|wasm|engine/i.test(m.text()))) errors.push('console: ' + m.text().slice(0, 200)); });
  page.on('response', (r) => {
    const u = new URL(r.url());
    if (u.origin !== base) return;
    seen.push([u.pathname, r.status()]);
    if (r.status() >= 400 && !(opt.noEngine && isEngine(u.pathname))) bad.push([u.pathname, r.status()]);
  });
  await page.goto(base + path, { waitUntil: 'load' });
  try { await page.waitForFunction(() => window.kshanaL10n && window.kshanaL10n.lang, null, { timeout: 15000 }); } catch { /* checked below where it matters */ }
  await page.waitForTimeout(1500);
  await after(page, seen);
  ok(errors.length === 0, `${label}: script errors: ${errors.join(' | ')}`);
  // a 404 is allowed only for the language-copy probe of a data file (fetchData/importData fall back to the English file)
  const probe = (p) => langs.some((l) => p.startsWith(`/${l}/`)) && /\.(json|mjs)$/.test(p) && !p.startsWith(`/${langs.find((l) => p.startsWith(`/${l}/`))}/i18n/`);
  const unexpected = bad.filter(([p]) => !probe(p));
  ok(unexpected.length === 0, `${label}: unexpected failed requests: ${unexpected.map((x) => x.join(' ')).join(', ')}`);
  console.log(`  ${label}: ${seen.length} requests, ${bad.length} language-copy probe(s) fell back to English${errors.length ? ', ' + errors.length + ' script error(s)' : ''}`);
  await ctx.close();
  return { seen, bad };
}
const got = (seen, p) => seen.some(([u, s]) => u === p && s === 200);
const fileOk = (p) => { const f = join(opt.tree, p); return existsSync(f) && statSync(f).size > 0; };

for (const lang of langs) {
  console.log(`${lang}:`);
  // a translated site page
  await visit(`/${lang}/`, `/${lang}/`, async (page, seen) => {
    const r = await page.evaluate(() => ({ lang: window.kshanaL10n && window.kshanaL10n.lang, html: document.documentElement.lang, ready: typeof window.kshanaL10nReady }));
    ok(r.lang === lang, `/${lang}/: kshanaL10n.lang is "${r.lang}", expected "${lang}"`);
    ok(r.html === lang, `/${lang}/: <html lang> is "${r.html}"`);
    for (const f of ['ui.ftl', 'glossary.ftl', 'site-js.ftl']) for (const l of [lang, 'en']) { ok(got(seen, `/i18n/${l}/${f}`), `/${lang}/: /i18n/${l}/${f} answered 200`); ok(fileOk(`i18n/${l}/${f}`), `/i18n/${l}/${f} is in the tree and not empty`); }
    const n = await page.evaluate(() => window.kshanaL10n.t('site-lang-label'));
    ok(n && n !== 'site-lang-label', `/${lang}/: the catalogue has site-lang-label ("${n}")`);
  });
  // the Evidence page: the ladder looks rows up by key
  await visit(`/${lang}/evidence`, `/${lang}/evidence`, async (page) => {
    const r = await page.evaluate(() => ({
      pts: document.querySelectorAll('.ev-vis[data-vis="ladder"] svg .ld-pt').length,
      labs: [...document.querySelectorAll('.ev-vis[data-vis="ladder"] svg .ev-lab')].map((e) => e.textContent),
      sgp4: document.querySelectorAll('.ev-vis[data-vis="sgp4"] svg').length, cowell: document.querySelectorAll('.ev-vis[data-vis="cowell"] svg').length,
      lang: window.kshanaL10n && window.kshanaL10n.lang }));
    ok(r.lang === lang, `/${lang}/evidence: kshanaL10n.lang is "${r.lang}"`);
    ok(r.pts === 9, `/${lang}/evidence: the ladder draws 9 points (got ${r.pts})`);
    ok(r.labs.length === 6 && r.labs.every((x) => x && x.length > 3), `/${lang}/evidence: six lane labels (${JSON.stringify(r.labs)})`);
    ok(r.sgp4 >= 1 && r.cowell >= 1, `/${lang}/evidence: the SGP4 and Cowell figures draw`);
  });
  for (const pg of ['missions', 'capabilities', 'developers', 'index']) {
    await visit(`/${lang}/${pg}`, `/${lang}/${pg}`, async (page) => {
      if (pg === 'missions') {
        await page.evaluate(() => document.querySelector('[data-mx="cone"]') && document.querySelector('[data-mx="cone"]').scrollIntoView()); await page.waitForTimeout(1500);
        // the cone draws its two inertial series and a legend of two: the budget line is found by its numbers, not by the words of its translated name
        const c = await page.evaluate(() => { const f = document.querySelector('[data-mx="cone"]'); return f ? [f.querySelectorAll('.mx-cone').length, f.querySelectorAll('.c-legend').length] : null; });
        ok(c && c[0] === 2 && c[1] === 2, `/${lang}/missions: the cone draws two series and two legend entries (${JSON.stringify(c)})`);
        // the Engine chip drops the summary's leading tag ("campaign <hash>", "scenario <name>" in the language) by position
        const hex = await page.evaluate(() => [...document.querySelectorAll('.sc-next[data-run]')].filter((x) => /\b[0-9a-f]{12}\b/.test(x.textContent)).map((x) => x.getAttribute('data-run')));
        ok(hex.length === 0, `/${lang}/missions: no card shows the hash of its campaign tag (${hex.join(', ')})`);
      }
    });
  }
  // the Studio
  await visit(`/studio/?lang=${lang}`, `/studio/?lang=${lang}`, async (page, seen) => {
    const r = await page.evaluate(() => ({ lang: window.kshanaL10n && window.kshanaL10n.lang, html: document.documentElement.lang, n: document.querySelectorAll('[data-l10n]').length }));
    ok(r.lang === lang, `/studio/?lang=${lang}: kshanaL10n.lang is "${r.lang}", expected "${lang}"`);
    ok(r.html === lang, `/studio/?lang=${lang}: <html lang> is "${r.html}"`);
    ok(r.n > 0, `/studio/?lang=${lang}: the page has data-l10n elements`);
    for (const f of ['ui.ftl', 'glossary.ftl', 'studio-js.ftl', 'studio-pages.ftl']) for (const l of [lang, 'en']) { ok(got(seen, `/i18n/${l}/${f}`), `/studio/?lang=${lang}: /i18n/${l}/${f} answered 200`); ok(fileOk(`i18n/${l}/${f}`), `/i18n/${l}/${f} is in the tree and not empty`); }
    const changed = await page.evaluate(() => { let c = 0; const l = window.kshanaL10n; for (const el of document.querySelectorAll('[data-l10n]')) { const id = el.getAttribute('data-l10n'); if (l.has(id) && el.textContent === l.t(id, JSON.parse(el.getAttribute('data-l10n-args') || '{}'))) c++; } return c; });
    ok(changed > 0, `/studio/?lang=${lang}: data-l10n elements show the ${lang} text (${changed})`);
  });
}
// the English Studio loads its own catalogue and stays English
await visit('/studio/?lang=en', '/studio/?lang=en', async (page) => { const l = await page.evaluate(() => window.kshanaL10n && window.kshanaL10n.lang); ok(l === 'en', `/studio/?lang=en: kshanaL10n.lang is "${l}"`); });

// the constellation designer colours constellations by key: every key of every language copy of capabilities.json is one the page knows
{
  const src = readFileSync(join(opt.tree, 'js', 'capabilities.mjs'), 'utf8');
  const known = [...(/const CONST_C = \{([^}]*)\}/.exec(src)?.[1] || '').matchAll(/"?([a-z-]+)"?\s*:/g)].map((m) => m[1]);
  ok(known.length >= 6, `capabilities.mjs: CONST_C keys found (${known.join(', ')})`);
  for (const lang of ['en', ...langs]) {
    const f = join(opt.tree, lang === 'en' ? '' : lang, 'assets/capabilities/capabilities.json');
    const d = JSON.parse(readFileSync(f, 'utf8'));
    const keys = d.constellations.flatMap((c) => [...c.constellations.map((k) => k.key), ...c.sats.map((s) => s.key)]);
    ok(keys.length > 100 && keys.every((k) => known.includes(k)), `${lang}: every constellation and satellite key of capabilities.json is one CONST_C knows`);
  }
}
// the catalogues in the tree: only the five files the browser fetches, only built languages
for (const lang of ['en', ...langs]) for (const f of ['ui.ftl', 'glossary.ftl', 'studio-js.ftl', 'studio-pages.ftl', 'site-js.ftl']) ok(fileOk(`i18n/${lang}/${f}`), `i18n/${lang}/${f} ships`);
for (const lang of ['en', ...langs]) for (const f of ['engine.ftl', 'data.ftl']) ok(!existsSync(join(opt.tree, 'i18n', lang, f)), `i18n/${lang}/${f} does not ship (no page fetches it)`);
await browser.close(); server.close();
console.log(`${checks} checks, ${failures} failure(s)`);
process.exit(failures ? 1 : 0);
