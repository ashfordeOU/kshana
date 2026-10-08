// SPDX-License-Identifier: AGPL-3.0-only
// What the Studio lets into the page from chart markup. The engine and the builders write the
// charts, but text in a scenario (a clock's name, a title) is carried into them, so markup is
// adopted only after it is reduced to drawing: no scripts, no embedded documents, no event
// handlers, no link that leaves the file, and no document-type declaration (so no entities).
// The functions touch the tree only through the standard element interface (localName,
// attributes, children, remove, removeAttribute, textContent), so they run on a parsed XML
// document in the browser and on a plain stand-in tree in Node. Tested in svgsafe.test.mjs.

// Elements that are never drawing.
// A style element goes too: the page carries the chart rules, and no chart needs its own.
const DROPPED = new Set(["script", "foreignobject", "iframe", "object", "embed", "audio", "video", "canvas", "link", "meta", "base", "style"]);
// Elements that change an attribute over time: dropped when they aim at a handler or a link.
const ANIMATING = new Set(["animate", "set", "animatetransform", "animatemotion"]);

// A document-type declaration, or any markup declaration that defines something.
export const hasDeclaration = (markup) => /<!\s*(doctype|entity|element|attlist|notation)\b/i.test(String(markup));

// A reference that stays inside the file.
const localRef = (v) => /^\s*#/.test(v);
// A style that fetches something or runs something: an import, an expression, a script address, or a
// url() whose target is not inside the file (every url( must be a complete url(#id) to pass).
function reachingStyle(v) {
  if (/@import|expression\s*\(|javascript\s*:/i.test(v)) return true;
  const opened = (v.match(/url\(/gi) || []).length;
  let local = 0;
  for (const m of v.matchAll(/url\(\s*(?:'([^']*)'|"([^"]*)"|([^)'"]*))\s*\)/gi)) {
    const target = (m[1] ?? m[2] ?? m[3] ?? "").trim();
    if (!target.startsWith("#")) return true;
    local++;
  }
  return local !== opened;
}
// "javascript:" with the tabs, newlines and control characters a browser ignores put back in.
const scripted = (v) => /javascript\s*:/i.test(String(v).replace(/[\u0000- ]+/g, ""));

const lower = (s) => String(s || "").toLowerCase();

function keepAttribute(a) {
  const name = lower(a.name);
  const local = lower(a.localName || a.name);
  if (name.startsWith("on") || local.startsWith("on")) return false;
  if (local === "href" && !localRef(a.value)) return false;
  if (local === "src") return false;
  // Any value that names a url( (fill, filter, mask, clip-path, marker-*, cursor, style, animated values): only url(#id) stays.
  if (/url\(/i.test(a.value) && reachingStyle(a.value)) return false;
  if (local === "style" && reachingStyle(a.value)) return false;
  if (scripted(a.value)) return false;
  return true;
}

function keepElement(el) {
  const local = lower(el.localName);
  if (DROPPED.has(local)) return false;
  if (ANIMATING.has(local)) {
    const target = lower(el.getAttribute ? el.getAttribute("attributeName") : "");
    if (target.startsWith("on") || target.endsWith("href") || target === "style" || target === "src") return false;
  }
  return true;
}

// Reduce a parsed chart to drawing, in place. Returns how many elements and attributes were removed.
export function sanitizeSvg(root) {
  let removed = 0;
  const walk = (el) => {
    for (const a of Array.from(el.attributes || [])) {
      if (!keepAttribute(a)) { el.removeAttribute(a.name); removed++; }
    }
    for (const child of Array.from(el.children || [])) {
      if (!keepElement(child)) { child.remove(); removed++; } else walk(child);
    }
  };
  walk(root);
  return removed;
}
