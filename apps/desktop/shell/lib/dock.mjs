// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: dockable, resizable panes and saved layouts (0.42 U20). A layout is a
// tree: a split ({ split: "row" | "col", sizes: [fractions], kids: [...] }) or a pane
// ({ pane: <view>, id }). The views a pane can show: the plot, the map, the sky plot, the
// engine's chart, the table of key figures, the inspector (values at the cursor and the
// figures) and the code console. A pane is split, closed, moved next to another (left, right,
// above, below) or swapped with it; a split's sizes change by dragging the bar between two
// panes or with the arrow keys on it. One pane can be shown alone (focus).
//
// The layout of each scenario tab is kept with the project (layouts/session.json), and named
// layouts in layouts/saved.json, so a job opens the way it was left. Pure, no DOM; tested in
// dock.test.mjs.

export const PANE_VIEWS = ["plot", "map", "sky", "chart", "table", "inspector", "console"];
export const MIN_SIZE = 0.08;
const MAX_DEPTH = 6, MAX_PANES = 12;

let seq = 0;
/** A new pane id (a counter, never random). */
export const paneId = () => `p${++seq}`;
/** Keep new ids above those of a layout read back (so a new pane never reuses one). */
export function seedIds(layout) { for (const p of panes(layout)) { const n = Number(String(p.id).slice(1)); if (Number.isFinite(n) && n > seq) seq = n; } }

export const pane = (view, id = paneId()) => ({ pane: PANE_VIEWS.includes(view) ? view : "plot", id });
export const split = (dir, kids, sizes) => ({ split: dir === "col" ? "col" : "row", sizes: sizes || kids.map(() => 1 / kids.length), kids });

/** The built-in layouts. */
export function preset(name) {
  switch (name) {
    case "map-focus": return split("row", [pane("map"), split("col", [pane("plot"), pane("inspector")])], [0.66, 0.34]);
    case "four": return split("col", [split("row", [pane("plot"), pane("map")]), split("row", [pane("sky"), pane("inspector")])]);
    case "analysis": return split("row", [split("col", [pane("plot"), pane("table")], [0.6, 0.4]), split("col", [pane("inspector"), pane("console")], [0.5, 0.5])], [0.62, 0.38]);
    default: return split("row", [split("col", [pane("plot"), pane("map")], [0.5, 0.5]), pane("inspector")], [0.72, 0.28]);
  }
}
export const PRESETS = ["plot-map", "map-focus", "four", "analysis"];

/** Every pane of a layout, in reading order. */
export function panes(node, out = []) {
  if (!node) return out;
  if (node.pane) out.push(node);
  else for (const k of node.kids || []) panes(k, out);
  return out;
}
const clone = (n) => JSON.parse(JSON.stringify(n));

/** Sizes that are positive, at least MIN_SIZE each and add up to 1. */
export function normSizes(sizes, n) {
  const s = Array.from({ length: n }, (_, i) => (Number.isFinite(sizes && sizes[i]) && sizes[i] > 0 ? sizes[i] : 1 / n));
  if (n * MIN_SIZE >= 1) return s.map(() => 1 / n);
  // the ones under the minimum get it; the others share the rest in proportion (repeated until none is under)
  const fixed = new Array(n).fill(false);
  for (let round = 0; round < n; round++) {
    const free = s.reduce((a, x, i) => a + (fixed[i] ? 0 : x), 0);
    const room = 1 - fixed.filter(Boolean).length * MIN_SIZE;
    let changed = false;
    for (let i = 0; i < n; i++) if (!fixed[i]) { s[i] = (s[i] / free) * room; if (s[i] < MIN_SIZE) { s[i] = MIN_SIZE; fixed[i] = true; changed = true; } }
    if (!changed) break;
  }
  return s;
}

/** Collapse a tree: splits of one child become the child, nested splits of the same direction merge. */
export function normalise(node) {
  if (!node) return null;
  if (node.pane) return node;
  let kids = [], sizes = [];
  const ns = normSizes(node.sizes, node.kids.length);
  node.kids.forEach((k, i) => {
    const c = normalise(k);
    if (!c) return;
    if (c.split === node.split) { const cs = normSizes(c.sizes, c.kids.length); c.kids.forEach((g, j) => { kids.push(g); sizes.push(ns[i] * cs[j]); }); }
    else { kids.push(c); sizes.push(ns[i]); }
  });
  if (!kids.length) return null;
  if (kids.length === 1) return kids[0];
  return { split: node.split, sizes: normSizes(sizes, kids.length), kids };
}

/** A layout read from a file, checked: views from PANE_VIEWS, ids unique, depth and pane count bounded; null when it is not a layout. */
export function validate(node, depth = 0, ids = new Set()) {
  if (!node || typeof node !== "object" || depth > MAX_DEPTH) return null;
  if (typeof node.pane === "string") {
    if (!PANE_VIEWS.includes(node.pane) || ids.size >= MAX_PANES) return null;
    let id = /^p\d{1,6}$/.test(String(node.id)) && !ids.has(String(node.id)) ? String(node.id) : null;
    if (!id) { do { id = paneId(); } while (ids.has(id)); }
    ids.add(id);
    return { pane: node.pane, id };
  }
  if ((node.split === "row" || node.split === "col") && Array.isArray(node.kids) && node.kids.length) {
    const kids = [], sizes = [];
    node.kids.forEach((k, i) => { const c = validate(k, depth + 1, ids); if (c) { kids.push(c); sizes.push(Array.isArray(node.sizes) ? node.sizes[i] : undefined); } });
    return kids.length ? normalise({ split: node.split, sizes: normSizes(sizes, kids.length), kids }) : null;
  }
  return null;
}

/** The path (child indexes) to the pane with id, or null. */
export function pathOf(node, id, path = []) {
  if (!node) return null;
  if (node.pane) return node.id === id ? path : null;
  for (let i = 0; i < node.kids.length; i++) { const p = pathOf(node.kids[i], id, [...path, i]); if (p) return p; }
  return null;
}
const at = (node, path) => path.reduce((n, i) => n.kids[i], node);

/** Replace the pane `id` by `fn(pane)` (which returns a node or null to remove it). */
function replacePane(layout, id, fn) {
  const rec = (n) => {
    if (n.pane) return n.id === id ? fn(n) : n;
    const kids = [], sizes = [];
    n.kids.forEach((k, i) => { const c = rec(k); if (c) { kids.push(c); sizes.push(n.sizes[i]); } });
    return kids.length ? { ...n, kids, sizes } : null;
  };
  return normalise(rec(clone(layout)));
}

/** Split pane `id` in two: the new pane shows `view`, `dir` "row" (side by side) or "col" (one above the other), placed after (or before). */
export function splitPane(layout, id, dir, view, { before = false } = {}) {
  if (panes(layout).length >= MAX_PANES) return layout;
  const fresh = pane(view);
  return replacePane(layout, id, (p) => split(dir, before ? [fresh, p] : [p, fresh]));
}
/** Close pane `id` (the last pane is kept). */
export function closePane(layout, id) {
  if (panes(layout).length <= 1) return layout;
  return replacePane(layout, id, () => null) || layout;
}
/** Show another view in pane `id`. */
export function setView(layout, id, view) {
  if (!PANE_VIEWS.includes(view)) return layout;
  return replacePane(layout, id, (p) => ({ ...p, pane: view }));
}
/** Swap the views of two panes. */
export function swapPanes(layout, a, b) {
  const pa = panes(layout).find((p) => p.id === a), pb = panes(layout).find((p) => p.id === b);
  if (!pa || !pb || a === b) return layout;
  const va = pa.pane, vb = pb.pane;
  return replacePane(replacePane(layout, a, (p) => ({ ...p, pane: vb })), b, (p) => ({ ...p, pane: va }));
}
/**
 * Dock pane `src` at a side of pane `dst`: "left", "right", "top", "bottom" (src leaves its place
 * and takes half of dst's), or "center" (the two swap).
 */
export function dockPane(layout, src, dst, side) {
  if (src === dst) return layout;
  if (side === "center") return swapPanes(layout, src, dst);
  const p = panes(layout).find((x) => x.id === src);
  if (!p || !pathOf(layout, dst)) return layout;
  const without = replacePane(layout, src, () => null);
  if (!without || !pathOf(without, dst)) return layout;
  const dir = side === "left" || side === "right" ? "row" : "col";
  const before = side === "left" || side === "top";
  return replacePane(without, dst, (d) => split(dir, before ? [{ ...p }, d] : [d, { ...p }]));
}
/**
 * Move the bar between children k and k+1 of the split at `path` by `delta` (a fraction of the
 * split): the two neighbours change, every child keeps at least MIN_SIZE.
 */
export function resize(layout, path, k, delta) {
  const out = clone(layout);
  const n = at(out, path);
  if (!n || n.pane || k < 0 || k + 1 >= n.kids.length || !Number.isFinite(delta)) return layout;
  const s = normSizes(n.sizes, n.kids.length);
  const total = s[k] + s[k + 1];
  const a = Math.min(total - MIN_SIZE, Math.max(MIN_SIZE, s[k] + delta));
  s[k] = a; s[k + 1] = total - a;
  n.sizes = s;
  return out;
}
/** The fraction of the split a pointer at `pos` (pixels from the split's start, of `extent` pixels) puts the bar k at. */
export function barDelta(sizes, k, pos, extent) {
  const s = normSizes(sizes, sizes.length);
  const start = s.slice(0, k).reduce((a, b) => a + b, 0);
  return Math.max(0, Math.min(1, pos / Math.max(1, extent))) - (start + s[k]);
}

/** A short text of a layout for the code console and the saved list: "plot | map / inspector". */
export function layoutText(node) {
  if (!node) return "";
  if (node.pane) return node.pane;
  return `(${node.kids.map(layoutText).join(node.split === "row" ? " | " : " / ")})`;
}

/** Named layouts as kept in layouts/saved.json: { format, layouts: { name: tree } }, each checked. */
export const SAVED_FORMAT = "kshana-layouts/1";
export function savedFile(saved) {
  const layouts = {};
  for (const [name, tree] of Object.entries(saved || {})) { const v = validate(tree); const nm = String(name).trim().slice(0, 60); if (v && nm) layouts[nm] = v; }
  return JSON.stringify({ format: SAVED_FORMAT, layouts }, null, 2) + "\n";
}
export function readSaved(text) {
  let o;
  try { o = JSON.parse(text); } catch { return {}; }
  if (!o || o.format !== SAVED_FORMAT || !o.layouts || typeof o.layouts !== "object") return {};
  const out = {};
  for (const [name, tree] of Object.entries(o.layouts)) { const v = validate(tree); if (v && String(name).trim()) out[String(name).trim().slice(0, 60)] = v; }
  return out;
}
