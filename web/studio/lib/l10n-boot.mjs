// Loads the page's catalogue and exposes it as window.kshanaL10n; included by every Studio page as a module script, and (through the
// site build) by every translated site page. window.kshanaL10nFiles names the catalogue files (default: the Studio's); the promise
// window.kshanaL10nReady resolves when the first language is loaded, for scripts that build text once.
import { createL10n, LANGS, STORAGE_KEY } from "./l10n.mjs";
import { mountLangSwitch } from "./lang-switch.mjs";

const base = new URL("../../i18n/", import.meta.url).href; // <site>/i18n/<lang>/ (the port copies i18n/ next to studio/)
const files = Array.isArray(window.kshanaL10nFiles) ? window.kshanaL10nFiles : undefined;
const l10n = createL10n({
  base,
  fetchText: async (u) => { const r = await fetch(u); if (!r.ok) throw new Error(String(r.status)); return r.text(); },
  storage: (() => { try { return window.localStorage; } catch { return null; } })(),
  languages: navigator.languages ? [...navigator.languages] : [navigator.language || "en"],
  doc: document,
  ...(files ? { files } : {}),
});
window.kshanaL10n = l10n; // the engine page calls l10n.attachEngine((tag, text) => wasm.register_catalogue(tag, text)) when it is ready
let resolveReady;
if (!window.kshanaL10nReady) window.kshanaL10nReady = new Promise((r) => { resolveReady = r; });
else resolveReady = window.kshanaL10nResolve || (() => {});

// A translated site page (/<lang>/...) shows its own language and leaves the stored choice alone; everything else follows ?lang=, the stored choice, then the browser.
const pathLang = (() => { const m = /^\/([\w-]+)\//.exec(location.pathname); return m && LANGS.includes(m[1]) ? m[1] : null; })();
const go = async () => {
  try { await (pathLang ? l10n.setLang(pathLang) : l10n.init(location.search)); } finally { resolveReady && resolveReady(l10n.lang); }
  if (!pathLang) mountLangSwitch(document, l10n);
};
if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", go, { once: true }); else go();
export default l10n;
