// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the extension registry behind window.KshanaShell (documented in
// apps/desktop/README.md, "Extending the shell"). Pure, no DOM; tested in ../shell.test.mjs.
// An extension (any module loaded into the shell's page) registers views, sidebar sections,
// command palette groups, status bar items and an edition box here; the shell reads them on
// every render. Nothing is registered by the shell itself, so with no extension the shell
// draws exactly what it draws without this module.

export const EVENTS = ["render", "runs-changed", "view-changed"];
export const SIDES = ["left", "right"];
const ID = /^[a-z][a-z0-9-]{0,47}$/;

const isFn = (f) => typeof f === "function";
function checkId(id, what) {
  if (typeof id !== "string" || !ID.test(id)) throw new TypeError(`${what}: an id is lower-case letters, digits and "-" (got ${JSON.stringify(id)})`);
  return id;
}
/** A value given as itself or as a function returning it; an extension's error never reaches the shell. */
function resolve(v, fallback, report) {
  if (!isFn(v)) return v ?? fallback;
  try { return v() ?? fallback; } catch (e) { report(e); return fallback; }
}
const str = (x) => (x === undefined || x === null ? "" : String(x));

/** A badge: a short text, a coloured dot, or both. */
function badgeOf(b) {
  if (!b) return null;
  if (typeof b === "string") return { text: b, dot: "", title: "" };
  if (typeof b !== "object") return null;
  const out = { text: str(b.text), dot: str(b.dot), title: str(b.title) };
  return out.text || out.dot ? out : null;
}
/** An icon: the name of one of the shell's icons, or a function returning a DOM node. */
const iconOf = (i) => (typeof i === "string" || isFn(i) ? i : null);

function navItem(it, sectionId) {
  if (!it || typeof it !== "object" || !str(it.label)) return null;
  return {
    id: `${sectionId}:${str(it.id) || str(it.label)}`, label: str(it.label), icon: iconOf(it.icon),
    badge: badgeOf(it.badge), view: typeof it.view === "string" ? it.view : null, onSelect: isFn(it.onSelect) ? it.onSelect : null,
  };
}
function paletteItem(it, groupId) {
  if (!it || typeof it !== "object" || !str(it.label) || !isFn(it.onSelect)) return null;
  return {
    id: `${groupId}:${str(it.id) || str(it.label)}`, label: str(it.label), keywords: str(it.keywords), icon: iconOf(it.icon),
    tag: str(it.tag), hint: str(it.hint), disabled: !!it.disabled, go: it.onSelect,
  };
}
function statusItem(it) {
  if (typeof it === "string") return it ? { text: it, title: "", dot: "" } : null;
  if (!it || typeof it !== "object" || !str(it.text)) return null;
  return { text: str(it.text), title: str(it.title), dot: str(it.dot) };
}

/**
 * The registry. `builtins` are the shell's own view ids (home, runs, …): an extension may
 * take one over with replaceView but may not register a view under its name.
 * `onChange()` is called after every registration, so the shell can render again; `report(e)`
 * receives an extension's errors (the shell logs them and goes on).
 */
export function createExtensions({ builtins = [], onChange = () => {}, report = () => {} } = {}) {
  const BUILTIN = new Set(builtins);
  const views = new Map();
  const replaced = new Map();
  const sections = [];
  const groups = [];
  const status = { left: null, right: null };
  const listeners = Object.fromEntries(EVENTS.map((e) => [e, new Set()]));
  let edition = null;
  let seq = 0;
  const changed = () => { try { onChange(); } catch (e) { report(e); } };
  const remover = (fn) => () => { fn(); changed(); };

  const api = {
    /** A view in the centre: { title, render(el, ctx) }. Opened with show(id), or in place of a built-in one (replaceView). */
    registerView(id, spec) {
      checkId(id, "registerView");
      if (BUILTIN.has(id) || id === "tab") throw new Error(`registerView: "${id}" is one of the shell's own views; use replaceView("${id}", …)`);
      if (!spec || !isFn(spec.render)) throw new TypeError("registerView: the view needs a render(el, ctx) function");
      views.set(id, { id, title: spec.title, render: spec.render });
      changed();
      return remover(() => { if (views.get(id)?.render === spec.render) views.delete(id); });
    },
    /** Show the registered view `viewId` wherever the shell would show its own view `builtinId`; null gives it back. */
    replaceView(builtinId, viewId) {
      if (!BUILTIN.has(builtinId)) throw new Error(`replaceView: "${builtinId}" is not one of the shell's views (${[...BUILTIN].join(", ")})`);
      if (viewId === null || viewId === undefined) replaced.delete(builtinId);
      else replaced.set(builtinId, checkId(viewId, "replaceView"));
      changed();
      return remover(() => { if (replaced.get(builtinId) === viewId) replaced.delete(builtinId); });
    },
    /** A sidebar section: { heading, items } where items is a list (or a function returning one) of { id, label, icon, badge, view, onSelect }. */
    registerNavSection(spec) {
      if (!spec || typeof spec !== "object") throw new TypeError("registerNavSection: a section is { heading, items }");
      const s = { id: `s${++seq}`, spec };
      sections.push(s);
      changed();
      return remover(() => { const i = sections.indexOf(s); if (i >= 0) sections.splice(i, 1); });
    },
    /** A command palette group after the shell's actions: { heading, items: () => [{ id, label, keywords, icon, tag, hint, disabled, onSelect }] }. */
    registerPaletteGroup(spec) {
      if (!spec || typeof spec !== "object" || !(Array.isArray(spec.items) || isFn(spec.items))) throw new TypeError("registerPaletteGroup: a group is { heading, items }");
      const g = { id: `g${++seq}`, spec };
      groups.push(g);
      changed();
      return remover(() => { const i = groups.indexOf(g); if (i >= 0) groups.splice(i, 1); });
    },
    /**
     * Status bar items: "left" items follow the shell's own (engine, device, cores); "right"
     * items take the place of the shell's edition items. A list, or a function returning one,
     * of strings or { text, title, dot }; null gives the side back to the shell.
     */
    setStatusItems(side, items) {
      if (!SIDES.includes(side)) throw new Error(`setStatusItems: the side is "left" or "right" (got ${JSON.stringify(side)})`);
      if (items !== null && items !== undefined && !Array.isArray(items) && !isFn(items)) throw new TypeError("setStatusItems: a list, a function returning one, or null");
      status[side] = items ?? null;
      changed();
    },
    /**
     * The edition this window runs: { appName, tag, title, text, action: { label, onSelect } }
     * (or a function returning it). The sidebar shows its box in place of the shell's own
     * edition box and the shell's section on other editions; `tag` follows the brand and
     * `appName` names the window. null gives the shell's own back.
     */
    setEdition(spec) {
      if (spec !== null && spec !== undefined && typeof spec !== "object" && !isFn(spec)) throw new TypeError("setEdition: an object, a function returning one, or null");
      edition = spec ?? null;
      changed();
    },
    /** Listen to "render", "runs-changed" or "view-changed"; returns the function that stops listening. */
    on(event, fn) {
      if (!EVENTS.includes(event)) throw new Error(`on: the events are ${EVENTS.join(", ")}`);
      if (!isFn(fn)) throw new TypeError("on: a function");
      listeners[event].add(fn);
      return () => listeners[event].delete(fn);
    },
  };

  const shell = {
    /** Call the listeners of `event`; one listener's error stops neither the others nor the shell. */
    emit(event, detail) {
      for (const fn of [...(listeners[event] || [])]) { try { fn(detail); } catch (e) { report(e); } }
    },
    /** The registered view to draw for `route`: a view of its own, or the one that replaces a built-in view. */
    viewFor(route) {
      const id = BUILTIN.has(route) ? replaced.get(route) : route;
      const v = id ? views.get(id) : null;
      return v ? { ...v, replaces: BUILTIN.has(route) ? route : null } : null;
    },
    hasView: (id) => views.has(id),
    /** The title of a registered view (for the window title), or "". */
    titleOf(route) { const v = views.get(route); return v ? str(resolve(v.title, "", report)) : ""; },
    navSections() {
      return sections.map((s) => {
        const items = resolve(s.spec.items, [], report);
        return { id: s.id, heading: str(resolve(s.spec.heading, "", report)), items: (Array.isArray(items) ? items : []).map((it) => navItem(it, s.id)).filter(Boolean) };
      }).filter((s) => s.items.length || s.heading);
    },
    /** The palette groups for a query (matched with `match(item, query)`), each at most `max` items; empty groups are left out. */
    paletteGroups(query, match, max = 8) {
      return groups.map((g) => {
        const items = resolve(g.spec.items, [], report);
        const list = (Array.isArray(items) ? items : []).map((it) => paletteItem(it, g.id)).filter((it) => it && match(it, query)).slice(0, max);
        return { id: g.id, heading: str(resolve(g.spec.heading, "", report)), items: list };
      }).filter((g) => g.items.length);
    },
    /** The status items of a side, or null when the shell keeps its own. */
    statusItems(side) {
      if (status[side] === null) return null;
      const items = resolve(status[side], [], report);
      return (Array.isArray(items) ? items : []).map(statusItem).filter(Boolean);
    },
    edition() {
      if (!edition) return null;
      const e = resolve(edition, null, report);
      if (!e || typeof e !== "object") return null;
      const a = e.action && typeof e.action === "object" && str(e.action.label) && isFn(e.action.onSelect) ? { label: str(e.action.label), onSelect: e.action.onSelect } : null;
      return { appName: str(e.appName), tag: str(e.tag), title: str(e.title), text: str(e.text), action: a };
    },
  };
  return { api, shell };
}
