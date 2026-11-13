// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the command palette's model (⌘K / Ctrl+K). Pure, no DOM; tested in
// ../shell.test.mjs. The shell hands it the scenario search (the Studio's catalogue,
// web/studio/lib/catalog.mjs searchScenarios) and the action list; this module ranks,
// groups and numbers the rows the listbox shows.

/** Lower-case words of a query. */
export const words = (q) => String(q || "").toLowerCase().split(/\s+/).filter(Boolean);

/** An action matches when every word of the query is in its label or its keywords. */
export function actionMatches(action, query) {
  const w = words(query);
  if (!w.length) return true;
  const hay = `${action.label} ${action.keywords || ""}`.toLowerCase();
  return w.every((x) => hay.includes(x));
}

/**
 * The palette's rows for a query.
 *   search(query) -> scenario entries [{file, domain, title, question}] best first (empty query: none)
 *   featured      -> the entries shown for an empty query
 *   actions       -> [{id, label, keywords?, pro?, disabled?, hint?}]
 *   more          -> further groups [{id, heading, items: [{id, label, tag?, disabled?, hint?, go}]}] (an extension's; already matched)
 * Returns { groups: [{id, items}], items } where items is the flat, numbered list of rows
 * (each { kind: "scenario"|"action", index, ... }) that the arrow keys move through.
 */
export function paletteRows(query, { search = () => [], featured = [], actions = [], more = [], maxScenarios = 6, maxActions = 8 } = {}) {
  const q = String(query || "").trim();
  const scen = (q ? search(q) : featured).slice(0, maxScenarios).map((e) => ({ kind: "scenario", id: `scenario:${e.file}`, entry: e, label: e.title }));
  const acts = actions.filter((a) => actionMatches(a, q)).slice(0, maxActions).map((a) => ({ kind: "action", id: `action:${a.id}`, action: a, label: a.label, pro: !!a.pro, disabled: !!a.disabled }));
  const groups = [];
  if (scen.length) groups.push({ id: "scenarios", items: scen });
  if (acts.length) groups.push({ id: "actions", items: acts });
  // Groups an extension added (lib/ext.mjs paletteGroups, already matched): after the shell's actions.
  for (const g of more) {
    const items = (g.items || []).map((a) => ({ kind: "action", id: `ext:${a.id}`, action: a, label: a.label, pro: false, tag: a.tag || "", disabled: !!a.disabled, ext: true }));
    if (items.length) groups.push({ id: g.id, heading: g.heading || "", items });
  }
  const items = groups.flatMap((g) => g.items);
  items.forEach((it, i) => { it.index = i; });
  return { groups, items };
}

/** The next row index when moving by `delta` through `n` rows (wraps; -1 when there are none). */
export function moveIndex(i, delta, n) {
  if (!n) return -1;
  if (i < 0) return delta > 0 ? 0 : n - 1;
  return (((i + delta) % n) + n) % n;
}

/** Split `text` into [{text, hit}] runs where the query's words occur, for a safe bold rendering. */
export function highlight(text, query) {
  const s = String(text || "");
  const w = words(query).filter((x) => x.length > 1);
  if (!w.length) return [{ text: s, hit: false }];
  const low = s.toLowerCase();
  const mark = new Array(s.length).fill(false);
  for (const x of w) {
    let i = low.indexOf(x);
    while (i >= 0) { for (let k = i; k < i + x.length; k++) mark[k] = true; i = low.indexOf(x, i + x.length); }
  }
  const out = [];
  for (let i = 0; i < s.length; i++) {
    const last = out[out.length - 1];
    if (last && last.hit === mark[i]) last.text += s[i];
    else out.push({ text: s[i], hit: mark[i] });
  }
  return out;
}

/** True when a keydown is the palette shortcut: ⌘K on macOS, Ctrl+K elsewhere (either is accepted). */
export const isPaletteKey = (e) => !!e && (e.metaKey || e.ctrlKey) && !e.altKey && !e.shiftKey && String(e.key).toLowerCase() === "k";
