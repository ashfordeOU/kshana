// Page decoration shared by every language tree (English included): lang and dir, hreflang and canonical, the language
// switcher, the language detection script, the notices, and links that stay inside the language (design v2, sections 3, 4, 9).

import { readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { renderHtml } from './i18n-lang.mjs';

const HERE = dirname(fileURLToPath(import.meta.url));
const asset = (n) => readFileSync(join(HERE, 'i18n-assets', n), 'utf8');

export const NAMES = { en: 'English', 'en-XA': 'Pseudo (en-XA)', de: 'Deutsch', fr: 'Français', es: 'Español', 'pt-BR': 'Português (Brasil)', 'pt-PT': 'Português (Portugal)', nl: 'Nederlands', da: 'Dansk', sv: 'Svenska', nb: 'Norsk bokmål', pl: 'Polski', cs: 'Čeština', uk: 'Українська', ru: 'Русский', fi: 'Suomi', et: 'Eesti', ja: '日本語', 'zh-Hans': '简体中文' };
const DIR = (lang) => (['ar', 'he', 'fa', 'ur'].includes(lang.split('-')[0]) ? 'rtl' : 'ltr');
const esc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/"/g, '&quot;');

export const pageUrl = (rel) => '/' + rel.replace(/(^|\/)index\.html$/, '$1').replace(/\.html$/, '');

const GLOBE = '<svg aria-hidden="true" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round"><circle cx="12" cy="12" r="9"/><path d="M3 12h18M12 3c3 3.2 3 14.8 0 18M12 3c-3 3.2-3 14.8 0 18"/></svg>';

export function switcherHtml(lang, here, langs, label) {
  const items = ['en', ...langs].map((l) => {
    const href = (l === 'en' ? '' : '/' + l) + here;
    return `<li><a href="${href}" hreflang="${l}" lang="${l}" data-lang-switch="${l}"${l === lang ? ' aria-current="true"' : ''}>${esc(NAMES[l])}<span class="lang-tag">${l}</span></a></li>`;
  }).join('');
  return `<details class="lang-menu"><summary class="icon-btn" aria-label="${esc(label)}: ${esc(NAMES[lang])}" title="${esc(label)}">${GLOBE}<span class="lang-code">${esc(lang)}</span></summary><ul>${items}</ul></details>`;
}

/**
 * @param ctx {lang, rel, pages, origin, langs, bundle, missing}  lang 'en' for the English tree.
 */
export function decoratePage(html, ctx) {
  const { lang, rel, pages, origin, langs, bundle, missing = 0 } = ctx;
  const here = pageUrl(rel);
  const pre = lang === 'en' ? '' : '/' + lang;
  const pageSet = new Set(pages.map(pageUrl));
  const dirOfPage = here.endsWith('/') ? here : here.slice(0, here.lastIndexOf('/') + 1);
  const msg = (id, vars) => { const m = bundle.getMessage(id); return m && m.value ? bundle.formatPattern(m.value, vars || {}) : null; };
  let out = html.replace(/<html\b[^>]*>/i, `<html lang="${lang}" dir="${DIR(lang)}">`);

  if (lang !== 'en') {
    // links to other site pages and in-page fragments stay inside the language (the <base> below would otherwise send fragments out)
    out = out.replace(/(<a\b[^>]*?\shref=)("([^"]*)"|'([^']*)')/gi, (m, a, q, d, s2) => {
      const href = d ?? s2;
      if (href.startsWith('#')) return `${a}"${pre}${here}${href}"`;
      if (/^[a-z][a-z0-9+.-]*:|^\/\//i.test(href)) return m;
      const u = new URL(href, 'https://x' + dirOfPage);
      const p = u.pathname.replace(/\/index\.html$/, '/').replace(/\.html$/, '');
      if (pageSet.has(p) || pageSet.has(p + '/') || pageSet.has(p.replace(/\/$/, ''))) return `${a}"${pre}${p}${u.search}${u.hash}"`;
      return m;
    });
    // relative asset and script URLs keep resolving against the page's own directory
    if (!/<base\b/i.test(out)) out = out.replace(/<head\b[^>]*>/i, (h) => `${h}<base href="${dirOfPage}">`);
  } else {
    const L = JSON.stringify(langs);
    const head = asset('lang-head.js').replace('@LANGS@', L).replace('@RE@', langs.join('|'));
    out = out.replace(/(<script>try\{var t=localStorage\.getItem\('kshana-theme'\)[^<]*<\/script>)/, `$1<script>${head}</script>`);
    if (!out.includes('kshana-lang')) out = out.replace(/<head\b[^>]*>/i, (h) => `${h}<script>${head}</script>`);
  }
  const alt = ['en', ...langs].map((l) => `<link rel="alternate" hreflang="${l}" href="${origin}${l === 'en' ? '' : '/' + l}${here}">`).join('') + `<link rel="alternate" hreflang="x-default" href="${origin}${here}">`;
  // a page with nothing translated is the English page with the notice: canonical to English, no hreflang for itself
  const untouched = lang !== 'en' && ctx.translated === 0;
  out = out.replace('</head>', `<link rel="stylesheet" href="/css/i18n.css">${untouched ? '' : alt}<link rel="canonical" href="${origin}${untouched || lang === 'en' ? '' : pre}${here}"></head>`);

  const label = msg('site-lang-label') || 'Language';
  const sw = switcherHtml(lang, here, langs, label);
  out = out.replace(/(<button class="icon-btn" id="themeBtn")/, `${sw}$1`);

  if (lang !== 'en') {
    const mt = msg('notice-machine-translation');
    const fb = missing ? msg('notice-fallback', { n: missing }) : null;
    const notice = `<div class="i18n-notice" role="note" lang="${lang}"><p>${esc(mt || '')}</p>${fb ? `<p>${esc(fb)}</p>` : ''}</div>`;
    out = out.replace(/(<main\b[^>]*>)/i, `$1${notice}`);
    const det = bundle.getMessage('notice-detected');
    let tpl = '';
    if (det && det.value) {
      const raw = bundle.formatPattern(det.value, { language: NAMES[lang] });
      tpl = `<template id="i18n-detected" data-dismiss="${esc(msg('notice-dismiss') || 'Dismiss')}">${renderHtml(raw, { a1: { o: `<a href="${here}" data-lang-switch="en">`, c: '</a>' } })}</template>`;
    }
    out = out.replace('</body>', `${tpl}<script>${asset('lang-tail.js')}</script></body>`);
  } else {
    out = out.replace('</body>', `<script>${asset('lang-tail.js')}</script></body>`);
  }
  return out;
}
