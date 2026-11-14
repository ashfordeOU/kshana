// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the look's small DOM pieces (0.42 U14), kept out of shell.js so its
// call sites stay one line each: a number with its unit and uncertainty, an area's mark (its
// symbol in its role colour), and the density switch on <html>. Text goes in through
// textContent only.
import { fmtValue, splitFigure } from "./format.mjs";
import { symbolNode, domainSymbol } from "./symbols.mjs";
import { DENSITIES, readDensity, writeDensity, otherDensity } from "./look.mjs";

const span = (cls, text) => { const s = document.createElement("span"); s.className = cls; if (text !== undefined) s.textContent = text; return s; };

/** Parts of a figure: a number (with `unit`, `u`) is formatted; a text the Studio already wrote is split into number and unit. */
export function figureParts(v, unit = "", opts = {}) {
  if (typeof v === "number") return fmtValue(v, unit, opts);
  const s = splitFigure(v, unit);
  return { value: s.value, pm: "", unit: s.unit, text: [s.value, s.unit].filter(Boolean).join(" ") };
}

/** A number set in Geist Mono with tabular digits, the uncertainty and the unit quieter: <span class="n">. */
export function numNode(v, unit = "", opts = {}) {
  const p = figureParts(v, unit, opts);
  const n = span("n");
  n.append(span("n-v", p.value));
  if (p.pm) n.append(span("n-pm", ` ${p.pm}`));
  if (p.unit) n.append(span("n-u", ` ${p.unit}`));
  n.title = p.text;
  return n;
}

/** A scenario area's mark: its symbol (lib/symbols.mjs) in `colour`, or a dot when no symbol fits the area. */
export function domainMark(id, colour, { dotClass = "dot" } = {}) {
  const sym = domainSymbol(id);
  const node = sym ? symbolNode(sym, { cls: "sym dom-sym" }) : span(dotClass);
  node.style.setProperty("--c", colour);
  return node;
}

// ---- density (Comfortable, Compact): data-density on <html>, remembered in this window's storage
const store = () => { try { return globalThis.localStorage; } catch { return null; } };
export const density = () => (document.documentElement.dataset.density === "compact" ? "compact" : "comfortable");
/** Apply a density (and remember it unless remember is false). */
export function setDensity(d, { remember = true } = {}) {
  const v = DENSITIES.includes(d) ? d : "comfortable";
  document.documentElement.dataset.density = v;
  if (remember) writeDensity(store(), v);
  return v;
}
export const toggleDensity = () => setDensity(otherDensity(density()));
/** The remembered density, applied (boot.js already set it before the first paint; this keeps the two in step). */
export const restoreDensity = () => setDensity(readDensity(store()), { remember: false });
