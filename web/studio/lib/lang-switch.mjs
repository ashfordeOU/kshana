// The language control of the Studio header: a native <select> of the endonyms (accessible, no layout of its own), placed in the
// header's right-hand group. Choosing a language loads it without a reload and remembers it (localStorage key kshana-lang).
import { LANGS, NAMES } from "./l10n.mjs";

const CSS = `.lang-sel{height:34px;max-width:9.5rem;padding-inline:8px;border:1px solid var(--line-2,rgba(128,128,128,.35));border-radius:10px;background:var(--panel,transparent);color:var(--ink-2,inherit);font:inherit;font-size:13px;cursor:pointer}
.lang-sel:focus-visible{outline:2px solid var(--tim,#1C4FE0);outline-offset:2px}
@media (max-width:560px){.lang-sel{max-width:4.2rem}}`;

export function mountLangSwitch(doc, l10n) {
  if (!doc || doc.getElementById("lang-sel")) return null;
  const host = doc.querySelector(".bar-right") || doc.querySelector("header .nav-right") || doc.querySelector("header") || null;
  if (!host) return null;
  const style = doc.createElement("style"); style.textContent = CSS; doc.head.appendChild(style);
  const sel = doc.createElement("select");
  sel.id = "lang-sel"; sel.className = "lang-sel"; sel.setAttribute("translate", "no");
  for (const code of ["en", ...LANGS]) { const o = doc.createElement("option"); o.value = code; o.lang = code; o.textContent = NAMES[code]; sel.appendChild(o); }
  const label = () => { const s = l10n.t("site-lang-label"); sel.setAttribute("aria-label", s === "site-lang-label" ? "Language" : s); sel.title = sel.getAttribute("aria-label"); sel.value = l10n.lang; };
  sel.addEventListener("change", async () => {
    await l10n.setLang(sel.value, { remember: true });
    if (!l10n.handled) location.reload(); // a page that cannot rebuild its own text reloads in the new language (its address keeps its state)
  });
  l10n.onChange(label);
  label();
  host.insertBefore(sel, host.firstChild);
  return sel;
}
