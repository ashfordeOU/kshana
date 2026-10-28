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
//   * the engine's own text (skipped with --no-engine: the deploy-tree job of i18n.yml builds without the WebAssembly package, pages.yml's real-tree step
//     runs it): the Studio runs the bundled scenario acm-link, in English on /studio/ and in each language on /<lang>/studio/ (the stub that carries the
//     language) then /studio/?scenario=acm-link&lang=<lang>. The page's summary and engine chart must equal what the same engine, loaded from the tree's
//     /pkg and given the tree's i18n/<lang>/engine.ftl, returns in Node (run_human); carry a phrase of that catalogue that English lacks; keep every
//     number and every caps token of the English run; the result JSON on the page must equal the English run's. The English page must not request any
//     engine.ftl and its summary and chart are byte-identical to the engine's own English (run_all in Node) and to the recording made by the native engine.
// Every same-origin request must answer 200 except the language-copy probes of fetchData/importData (a 404 on /<lang>/<path> falls back to the English
// file, by design) and, with --no-engine, the engine package. Needs Playwright (NODE_PATH=/opt/node22/lib/node_modules).
import http from 'node:http';
import { readFileSync, existsSync, statSync } from 'node:fs';
import { join, extname, dirname } from 'node:path';
import { createRequire } from 'node:module';
import { pathToFileURL, fileURLToPath } from 'node:url';
import { TIER_TOKENS } from './i18n-lang.mjs';

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

// the engine's own text in the Studio (real WebAssembly package; not in the --no-engine tree)
if (!opt.noEngine) {
  const SCEN = 'acm-link';
  const eng = await import(pathToFileURL(join(opt.tree, 'pkg', 'kshana.js')).href);
  await eng.default({ module_or_path: readFileSync(join(opt.tree, 'pkg', 'kshana_bg.wasm')) });
  const toml = readFileSync(join(opt.tree, 'studio', 'scenarios', `${SCEN}.toml`), 'utf8');
  const nativeEn = JSON.parse(eng.run_all(toml));
  const recorded = JSON.parse(readFileSync(join(opt.tree, 'studio', 'recorded', `${SCEN}.json`), 'utf8'));
  const digits = (x) => x.match(/\d+/g) || [];
  const tokens = (x) => { const out = []; let rest = x; for (const tk of [...TIER_TOKENS].sort((a, b) => b.length - a.length)) { const re = new RegExp(`(?<![A-Z])${tk}(?![A-Z])`, 'g'); out.push(...(rest.match(re) || []).map(() => tk)); rest = rest.replace(re, ' '); } return out.sort(); };
  const svgText = (x) => [...x.matchAll(/>([^<>]+)</g)].map((m) => m[1]).join(' '); // the words and numbers a chart prints, not its coordinates
  const PHRASE = { de: 'gegenüber', ja: 'パス' }; // a phrase of the summary that i18n/<lang>/engine.ftl supplies and English lacks
  // run the scenario on a page; resolve with what the page shows once the live run (and, in a language, its translated text) has settled
  const studioRun = async (path, label, expect) => {
    const out = {};
    await visit(path, label, async (page, seen) => {
      const read = () => page.evaluate(async () => {
        const img = document.querySelector('#ts-engine img');
        return { live: !!document.querySelector('#hl-badges .badge.live'), summary: (document.querySelector('#summary') || {}).textContent || '', json: (document.querySelector('#json') || {}).textContent || '',
          svg: img ? await (await fetch(img.src)).text() : '', lang: window.kshanaL10n && window.kshanaL10n.lang, fallback: window.kshanaL10n && window.kshanaL10n.engineFallback };
      });
      const t0 = Date.now(); let r = await read();
      while ((!r.live || r.summary !== expect.summary || r.svg !== expect.svg) && Date.now() - t0 < 120000) { await page.waitForTimeout(500); r = await read(); }
      await page.waitForTimeout(2500); // a later change (a second render, a stray fetch) would show here
      const r2 = await read();
      out.page = r2; out.settled = r.live && r.summary === expect.summary && r.svg === expect.svg; out.seen = seen.map(([u]) => u);
    });
    return out;
  };
  // English: untouched
  let enPage = null;
  {
    const r = await studioRun(`/studio/?scenario=${SCEN}`, `/studio/?scenario=${SCEN} (English)`, { summary: nativeEn.summary, svg: nativeEn.svg });
    ok(r.page.live, `English Studio: the live engine ran ${SCEN}`);
    ok(r.page.lang === 'en', `English Studio: kshanaL10n.lang is "${r.page.lang}"`);
    ok(r.page.summary === nativeEn.summary, `English Studio: the summary is the engine's own English ("${r.page.summary}")`);
    ok(r.page.svg === nativeEn.svg, 'English Studio: the engine chart is byte-identical to the engine\'s own English');
    ok(r.page.summary === recorded.summary && r.page.svg === recorded.svg, 'English Studio: summary and chart equal the recording made by the native engine');
    ok(r.page.json.length > 100, 'English Studio: the result JSON is shown');
    ok(!r.seen.some((u) => /engine\.ftl$/.test(u)), `English Studio: no engine.ftl is requested (${r.seen.filter((u) => /\.ftl$/.test(u)).join(', ')})`);
    enPage = r.page;
  }
  for (const lang of langs) {
    eng.register_catalogue(lang, readFileSync(join(opt.tree, 'i18n', lang, 'engine.ftl'), 'utf8'));
    const want = eng.run_human(toml, lang);
    // the stub the language switch and the links use carries the language to the Studio
    await visit(`/${lang}/studio/`, `/${lang}/studio/`, async (page) => {
      const r = await page.evaluate(() => ({ path: location.pathname, search: location.search, lang: window.kshanaL10n && window.kshanaL10n.lang }));
      ok(r.path === '/studio/' && r.search.includes(`lang=${lang}`) && r.lang === lang, `/${lang}/studio/ opens the Studio in ${lang} (${r.path}${r.search}, lang ${r.lang})`);
    });
    const r = await studioRun(`/studio/?scenario=${SCEN}&lang=${lang}`, `/studio/?scenario=${SCEN}&lang=${lang}`, want);
    const p = r.page, L = `${lang} Studio`;
    ok(p.live && p.lang === lang && !p.fallback, `${L}: live engine, language ${p.lang}, no English fallback for the engine text`);
    ok(r.seen.includes(`/i18n/${lang}/engine.ftl`), `${L}: /i18n/${lang}/engine.ftl was requested and answered 200`);
    ok(fileOk(`i18n/${lang}/engine.ftl`), `${L}: i18n/${lang}/engine.ftl ships in the tree`);
    ok(!r.seen.includes('/i18n/en/engine.ftl'), `${L}: English engine.ftl is not requested`);
    ok(r.settled && p.summary === want.summary, `${L}: the summary is the engine's ${lang} text ("${p.summary}", expected "${want.summary}")`);
    ok(p.svg === want.svg, `${L}: the engine chart is the engine's ${lang} text`);
    ok(p.summary !== nativeEn.summary && p.svg !== nativeEn.svg, `${L}: engine text differs from English`);
    const cat = readFileSync(join(opt.tree, 'i18n', lang, 'engine.ftl'), 'utf8');
    ok(cat.includes(PHRASE[lang]) && p.summary.includes(PHRASE[lang]) && !nativeEn.summary.includes(PHRASE[lang]), `${L}: the summary carries "${PHRASE[lang]}" from i18n/${lang}/engine.ftl`);
    ok(JSON.stringify(digits(p.summary)) === JSON.stringify(digits(nativeEn.summary)), `${L}: summary numbers unchanged (${digits(p.summary)} vs ${digits(nativeEn.summary)})`);
    ok(JSON.stringify(digits(svgText(p.svg))) === JSON.stringify(digits(svgText(nativeEn.svg))), `${L}: the chart's numbers are unchanged (${digits(svgText(p.svg))} vs ${digits(svgText(nativeEn.svg))})`);
    ok(JSON.stringify(tokens(p.summary)) === JSON.stringify(tokens(nativeEn.summary)) && tokens(p.summary).length > 0, `${L}: summary caps tokens unchanged (${tokens(p.summary)})`);
    ok(JSON.stringify(tokens(svgText(p.svg))) === JSON.stringify(tokens(svgText(nativeEn.svg))), `${L}: chart caps tokens unchanged`);
    ok(p.json === enPage.json, `${L}: the result JSON is the English run's`);
  }
}
// the Studio's verification matrix: "how it was verified" lists the matrix rows of the scenario's engine kinds. The Studio asks the shared
// /data/verification-matrix.json (lib/t.mjs fetchData), so a language page reads /<lang>/data/verification-matrix.json (the build keeps that copy);
// English reads the English file and asks for no language copy. A scenario with matrix rows, so the rows are there on every page (needs the engine: the
// rows are looked up by the engine's kind-to-module table).
if (!opt.noEngine) {
  const MX = 'clock-holdover';
  const digits = (x) => x.match(/\d+/g) || [];
  const tokens = (x) => { const out = []; for (const tk of [...TIER_TOKENS].sort((a, b) => b.length - a.length)) out.push(...(x.match(new RegExp(`(?<![A-Z])${tk}(?![A-Z])`, 'g')) || []).map(() => tk)); return out; };
  const en = JSON.parse(readFileSync(join(opt.tree, 'data', 'verification-matrix.json'), 'utf8')).rows;
  const showRows = async (path, label) => {
    const out = {};
    await visit(path, label, async (page, seen) => {
      const read = () => page.evaluate(() => [...document.querySelectorAll('#how-level ul.mx li')].map((li) => ({ text: li.querySelector(':scope > span:not(.lvl)').textContent, tier: (li.querySelector('.lvl') || {}).className || '' })));
      const t0 = Date.now(); let rows = await read();
      while (!rows.length && Date.now() - t0 < 90000) { await page.waitForTimeout(500); rows = await read(); }
      await page.waitForTimeout(1500);
      out.rows = await read(); out.seen = seen.map(([u]) => u);
    });
    return out;
  };
  const e = await showRows(`/studio/?scenario=${MX}`, `/studio/?scenario=${MX} (matrix, English)`);
  ok(e.rows.length > 0 && e.rows.every((m) => en.some((x) => x.requirement === m.text)), `English Studio: the ${e.rows.length} matrix rows shown are the English ledger's`);
  ok(e.seen.includes('/data/verification-matrix.json'), 'English Studio: /data/verification-matrix.json (the shared ledger) was fetched');
  ok(!e.seen.some((u) => langs.some((l) => u.startsWith(`/${l}/data/`))), `English Studio: no /<lang>/data/ file is fetched (${e.seen.filter((u) => /\/data\//.test(u)).join(', ')})`);
  for (const lang of langs) {
    const L = `${lang} Studio matrix`;
    const tr = JSON.parse(readFileSync(join(opt.tree, lang, 'data', 'verification-matrix.json'), 'utf8')).rows;
    const ftl = readFileSync(join(dirname(fileURLToPath(import.meta.url)), '..', 'i18n', lang, 'data.ftl'), 'utf8');
    const r = await showRows(`/studio/?scenario=${MX}&lang=${lang}`, `/studio/?scenario=${MX}&lang=${lang} (matrix)`);
    ok(r.seen.includes(`/${lang}/data/verification-matrix.json`), `${L}: /${lang}/data/verification-matrix.json was requested and answered 200`);
    ok(r.rows.length === e.rows.length && r.rows.length > 0, `${L}: the same ${e.rows.length} rows are shown (${r.rows.length})`);
    for (const m of r.rows) {
      const i = tr.findIndex((x) => x.requirement === m.text);
      ok(i >= 0, `${L}: shown row "${m.text.slice(0, 50)}" is in /${lang}/data/verification-matrix.json`);
      if (i < 0) continue;
      ok(m.text !== en[i].requirement && ftl.includes(m.text), `${L}: row ${i} is the ${lang} text of i18n/${lang}/data.ftl ("${m.text.slice(0, 60)}"), not the English`);
      ok(!r.rows.some((x) => x.text === en[i].requirement), `${L}: the English text of row ${i} is not shown`);
      ok(JSON.stringify(digits(m.text)) === JSON.stringify(digits(en[i].requirement)), `${L}: row ${i} numbers unchanged (${digits(m.text)} vs ${digits(en[i].requirement)})`);
      ok(JSON.stringify(tokens(m.text)) === JSON.stringify(tokens(en[i].requirement)), `${L}: row ${i} caps tokens unchanged (${tokens(m.text)})`);
      ok(m.tier.includes(en[i].status.toLowerCase()), `${L}: row ${i} keeps its tier (${m.tier} for ${en[i].status})`);
    }
    ok(r.rows.some((m) => m.text !== en.find((x) => x.requirement === m.text)?.requirement), `${L}: matrix text is not English`);
  }
}
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
// the catalogues in the tree: only the files the browser fetches, only built languages; engine.ftl for the built languages only (English is built into the engine)
for (const lang of ['en', ...langs]) for (const f of ['ui.ftl', 'glossary.ftl', 'studio-js.ftl', 'studio-pages.ftl', 'site-js.ftl']) ok(fileOk(`i18n/${lang}/${f}`), `i18n/${lang}/${f} ships`);
for (const lang of langs) ok(fileOk(`i18n/${lang}/engine.ftl`), `i18n/${lang}/engine.ftl ships (the Studio registers it with the engine)`);
ok(!existsSync(join(opt.tree, 'i18n', 'en', 'engine.ftl')), 'i18n/en/engine.ftl does not ship (the English catalogue is compiled into the engine)');
for (const lang of ['en', ...langs]) ok(!existsSync(join(opt.tree, 'i18n', lang, 'data.ftl')), `i18n/${lang}/data.ftl does not ship (no page fetches it)`);
await browser.close(); server.close();
console.log(`${checks} checks, ${failures} failure(s)`);
process.exit(failures ? 1 : 0);
