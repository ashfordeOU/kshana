// A copy of the Studio's lib/t.mjs (site-next/explorations/2026-10-01-studio-rebuild/lib/t.mjs), served from the site's js/ folder. Keep identical.
// t(id, english, vars): a message in the current language, with its English written at the call site as the fallback.
//
//   t("js-app-engine-failed", "The engine could not load ({ $reason }).", { reason })
//   t("js-ledger-rows", { one: "{ $n } ledger row", other: "{ $n } ledger rows" }, { n })     // a count: plural categories
//
// The English text is also what `node tools/i18n.mjs jsx` writes into the catalogue (i18n/en/*-js.ftl), so the code and the English
// catalogue cannot differ. While no catalogue is loaded (the first paint, the module tests, English) the call site's English is used.
// Rules for the English text: a string literal (or a template literal without ${}), variables written { $name }, no HTML.
export function t(id, en, vars) {
  const l = globalThis.kshanaL10n;
  if (l && typeof l.has === "function" && l.has(id)) return l.t(id, vars);
  return english(en, vars);
}

const plural = new Intl.PluralRules("en");
export function english(en, vars) {
  let s = en;
  if (en && typeof en === "object") {
    const n = vars && vars.n !== undefined ? Number(vars.n) : 0;
    const cat = plural.select(n);
    s = en[cat] !== undefined ? en[cat] : en.other;
  }
  return String(s).replace(/\{ \$([A-Za-z0-9_-]+) \}/g, (_, k) => (vars && vars[k] !== undefined ? String(vars[k]) : ""));
}

/** Resolves when the page's first catalogue is loaded (immediately when none is being loaded): `await ready()` before building text once. */
export const ready = () => (globalThis.kshanaL10nReady ? Promise.race([globalThis.kshanaL10nReady, new Promise((r) => setTimeout(r, 4000))]) : Promise.resolve());

/** fetch() for a JSON file the build also writes in each language (i18n/data-spec.json): the current language's copy under /<lang>/ when it exists, else the English file. */
export async function fetchData(url, init) {
  const l = globalThis.kshanaL10n;
  const lang = (l && l.lang) || (typeof document !== "undefined" && document.documentElement.lang) || "en";
  if (lang && lang !== "en" && /^[a-z]{2,3}(-[A-Za-z0-9]+)?$/.test(lang) && typeof document !== "undefined") {
    try {
      const u = new URL(url, document.baseURI);
      if (u.origin === location.origin && !u.pathname.startsWith(`/${lang}/`)) { const r = await fetch(`/${lang}${u.pathname}${u.search}`, init); if (r.ok) return r; }
    } catch (e) { /* no language copy: the English file */ }
  }
  return fetch(url, init);
}

/** import() for a generated data module the build also writes in each language (i18n/data-spec.json, module files): the language's copy when it exists, else the English module. */
export async function importData(url) {
  const l = globalThis.kshanaL10n;
  const lang = (l && l.lang) || (typeof document !== "undefined" && document.documentElement.lang) || "en";
  if (lang && lang !== "en" && /^[a-z]{2,3}(-[A-Za-z0-9]+)?$/.test(lang) && typeof location !== "undefined") {
    try {
      const u = new URL(url, location.href);
      if (u.origin === location.origin && !u.pathname.startsWith(`/${lang}/`)) return await import(/* @vite-ignore */ `/${lang}${u.pathname}`);
    } catch (e) { /* no language copy: the English module */ }
  }
  return import(/* @vite-ignore */ url);
}
