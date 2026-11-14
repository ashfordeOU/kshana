// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the symbol set (0.42 U14; the design brief, "Symbols"). One drawn set
// for maps, globes, tables and the palette: the shape carries the type, the colour (CSS
// currentColor) carries trust or domain. Drawn on a 24-unit grid with 1.8-unit strokes so each
// reads at 16 px. Two symbols have a second tone (the untrusted part of a track, the reported
// position): those parts use --sym-2, which falls back to currentColor and is also told apart
// by its dashes, so the symbol still reads in one colour. Pure data plus two builders (an SVG
// string, a DOM node); tested in ../look.test.mjs.

const SVGNS = "http://www.w3.org/2000/svg";

// A part: d (path), kind "s" (stroke), "f" (fill) or "a" (an estimated area: faint fill and a
// dashed edge), tone 2 for the second tone, dash for a dashed stroke.
export const SYMBOLS = {
  gnss: { label: "GNSS satellite", parts: [{ d: "M9 9h6v6H9z", kind: "f" }, { d: "M2 9.5h5v5H2zM17 9.5h5v5h-5z", kind: "s" }, { d: "M7 12h2M15 12h2", kind: "s" }] },
  leo: { label: "LEO satellite", parts: [{ d: "M12 3.5l7 8.5-7 8.5-7-8.5z", kind: "f" }] },
  station: { label: "Ground station", parts: [{ d: "M5 8.5a7 7 0 0 0 14 0z", kind: "s" }, { d: "M12 8.5V4", kind: "s" }, { d: "M12 15.5V21M6 21h12", kind: "s" }] },
  receiver: { label: "Receiver", parts: [{ d: "M12 6.5a5.5 5.5 0 1 0 0 11 5.5 5.5 0 1 0 0-11z", kind: "s" }, { d: "M12 10a2 2 0 1 0 0 4 2 2 0 1 0 0-4z", kind: "f" }, { d: "M12 2v3M12 19v3M2 12h3M19 12h3", kind: "s" }] },
  clock: { label: "Clock or time server", parts: [{ d: "M12 3a9 9 0 1 0 0 18 9 9 0 1 0 0-18z", kind: "s" }, { d: "M12 7v5l3.5 2", kind: "s" }] },
  ship: { label: "Ship (heading)", parts: [{ d: "M12 2.5l6 18.5-6-3.5-6 3.5z", kind: "f" }] },
  aircraft: { label: "Aircraft", parts: [{ d: "M12 2c.9 0 1.4 1.2 1.4 3v3.6l8.1 4.3v2.2l-8.1-2.3v4.4l2.4 1.9v1.6L12 19.8l-3.8.9v-1.6l2.4-1.9v-4.4l-8.1 2.3v-2.2l8.1-4.3V5c0-1.8.5-3 1.4-3z", kind: "f" }] },
  jammer: { label: "Jammer (estimated area)", parts: [{ d: "M12 2a10 10 0 1 0 0 20 10 10 0 1 0 0-20z", kind: "a" }, { d: "M12 7l5 9H7z", kind: "f" }] },
  spoofer: { label: "Spoofer (suspected)", parts: [{ d: "M12 10l4.5 8h-9z", kind: "s" }, { d: "M12 14.2a1.3 1.3 0 1 0 0 2.6 1.3 1.3 0 1 0 0-2.6z", kind: "f" }, { d: "M2.5 19C5 6 19 6 21.5 19", kind: "s", dash: true }] },
  track: { label: "Track by trust", parts: [{ d: "M2.5 19c4-1 6-8 10.5-8", kind: "s" }, { d: "M13 11l8.5-5", kind: "s", tone: 2, dash: true }] },
  reported: { label: "Reported against true", parts: [{ d: "M3 19c3-8 15-8 18 0", kind: "s" }, { d: "M7 19l5-14 5 14", kind: "s", tone: 2, dash: true }] },
  alarm: { label: "Alarm", parts: [{ d: "M12 2.8L22 20.5H2z", kind: "s" }, { d: "M12 9v5.5", kind: "s" }, { d: "M12 17.2v.3", kind: "s" }] },
};
export const SYMBOL_IDS = Object.keys(SYMBOLS);

// The symbol of each Studio scenario area (web/studio/lib/catalog.mjs), where one fits.
export const DOMAIN_SYMBOL = {
  interference: "jammer", spectrum: "jammer", spoofing: "spoofer",
  timing: "clock",
  integrity: "alarm",
  navigation: "ship",
  orbits: "gnss", constellations: "gnss", deepspace: "gnss", solar: "gnss",
  leo: "leo", "leo-missions": "leo",
  spaceops: "station",
};
export const domainSymbol = (id) => (id && Object.prototype.hasOwnProperty.call(DOMAIN_SYMBOL, id) ? DOMAIN_SYMBOL[id] : null);
export const isSymbol = (id) => typeof id === "string" && Object.prototype.hasOwnProperty.call(SYMBOLS, id);

/** The SVG attributes of a part (presentation attributes, so a symbol draws without look.css too). */
export function partAttrs(p) {
  const a = { d: p.d };
  if (p.kind === "f") Object.assign(a, { fill: "currentColor", stroke: "none" });
  else if (p.kind === "a") Object.assign(a, { fill: "currentColor", "fill-opacity": "0.16", stroke: "currentColor", "stroke-width": "1.4", "stroke-dasharray": "2.5 2.5" });
  else Object.assign(a, { fill: "none", stroke: "currentColor", "stroke-width": "1.8", "stroke-linecap": "round", "stroke-linejoin": "round" });
  if (p.dash && p.kind !== "a") a["stroke-dasharray"] = "3 2.4";
  if (p.tone === 2) a.class = p.kind === "f" ? "f2" : "s2";
  return a;
}

const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" })[c]);
/** A symbol as SVG markup (for a sprite, a sheet, a test): `title` names it for assistive technology, else it is hidden. */
export function symbolMarkup(id, { title = "", size = 16, cls = "sym" } = {}) {
  const s = SYMBOLS[id];
  if (!s) return "";
  const parts = s.parts.map((p) => `<path ${Object.entries(partAttrs(p)).map(([k, v]) => `${k}="${esc(v)}"`).join(" ")}/>`).join("");
  const label = title ? ` role="img" aria-label="${esc(title)}"` : ` aria-hidden="true"`;
  return `<svg xmlns="${SVGNS}" viewBox="0 0 24 24" width="${size}" height="${size}" class="${esc(cls)}" data-sym="${id}"${label}>${title ? `<title>${esc(title)}</title>` : ""}${parts}</svg>`;
}
/** Every symbol as one sprite: <symbol id="k-sym-<id>"> each, to <use href="#k-sym-gnss">. */
export function spriteMarkup() {
  return `<svg xmlns="${SVGNS}" style="display:none">${SYMBOL_IDS.map((id) => `<symbol id="k-sym-${id}" viewBox="0 0 24 24">${SYMBOLS[id].parts.map((p) => `<path ${Object.entries(partAttrs(p)).map(([k, v]) => `${k}="${esc(v)}"`).join(" ")}/>`).join("")}</symbol>`).join("")}</svg>`;
}
/** A symbol as a DOM node in `doc` (document by default); null for an unknown id. */
export function symbolNode(id, { doc = globalThis.document, title = "", cls = "sym" } = {}) {
  const s = SYMBOLS[id];
  if (!s || !doc) return null;
  const svg = doc.createElementNS(SVGNS, "svg");
  svg.setAttribute("viewBox", "0 0 24 24");
  svg.setAttribute("class", cls);
  svg.setAttribute("data-sym", id);
  if (title) { svg.setAttribute("role", "img"); svg.setAttribute("aria-label", title); const tt = doc.createElementNS(SVGNS, "title"); tt.textContent = title; svg.append(tt); }
  else svg.setAttribute("aria-hidden", "true");
  for (const p of s.parts) {
    const path = doc.createElementNS(SVGNS, "path");
    for (const [k, v] of Object.entries(partAttrs(p))) path.setAttribute(k, v);
    svg.append(path);
  }
  return svg;
}
