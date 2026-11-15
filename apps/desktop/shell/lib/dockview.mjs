// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the dock's view (0.42 U20), on lib/dock.mjs. The panes of a scenario tab
// laid out as the tab's layout says: a bar between two panes drags (or takes the arrow keys) to
// resize them; a pane's header drags onto another pane to dock it at that pane's side (or, in
// the middle, to swap the two); each pane can change its view, split, close, or be shown alone.
// The layouts built in, and the ones saved with the project, are one choice away. Every text is
// set through textContent.
import { h } from "./dom.mjs";
import { PANE_VIEWS, PRESETS, preset, panes, splitPane, closePane, setView, dockPane, resize, barDelta, layoutText, validate } from "./dock.mjs";

/**
 * ctx: { t, part(tab, view) (the element a pane shows), viewName(view), presetName(name),
 * change(tab, layout, what) (keep it and say what changed), saved() ({ name: layout }),
 * saveAs(name, layout), removeSaved(name), timeline(tab) (the clock strip, or null) }.
 */
export function dockView(ctx, tab) {
  const { t } = ctx;
  if (!tab.dock) tab.dock = preset("plot-map");
  const layout = tab.dock;
  const root = h("div", { class: "dock" });

  // ---------- the bar above the panes: layouts
  const choose = h("select", { class: "input", id: `dock-l-${tab.id}`, "aria-label": t("js-desk-dock-layout", "Layout") },
    h("option", { value: "", text: t("js-desk-dock-choose", "Choose a layout…") }),
    h("optgroup", { label: t("js-desk-dock-built-in", "Built in") }, ...PRESETS.map((p) => h("option", { value: `preset:${p}`, text: ctx.presetName(p) }))),
    ...(Object.keys(ctx.saved()).length ? [h("optgroup", { label: t("js-desk-dock-saved", "Saved with the project") }, ...Object.keys(ctx.saved()).map((n) => h("option", { value: `saved:${n}`, text: n })))] : []));
  choose.addEventListener("change", () => {
    const v = choose.value;
    if (v.startsWith("preset:")) ctx.change(tab, preset(v.slice(7)), ctx.presetName(v.slice(7)));
    else if (v.startsWith("saved:")) { const l = validate(ctx.saved()[v.slice(6)]); if (l) ctx.change(tab, l, v.slice(6)); }
  });
  const nameIn = h("input", { class: "input", id: `dock-n-${tab.id}`, type: "text", placeholder: t("js-desk-dock-name", "Name for this layout"), maxlength: "60", style: "width:14em" });
  const saveBtn = h("button", { class: "btn", type: "button", onclick: () => { const n = nameIn.value.trim(); if (n) ctx.saveAs(n, layout); } }, t("js-desk-dock-save", "Save layout"));
  nameIn.addEventListener("keydown", (e) => { if (e.key === "Enter") { e.preventDefault(); saveBtn.click(); } });
  const savedNames = Object.keys(ctx.saved());
  const delSel = savedNames.length ? h("button", { class: "btn fig-btn", type: "button", onclick: () => { const v = choose.value; if (v.startsWith("saved:")) ctx.removeSaved(v.slice(6)); } }, t("js-desk-dock-delete", "Delete the chosen saved layout")) : null;
  root.append(h("div", { class: "dock-bar row" }, choose, nameIn, saveBtn, delSel, h("span", { class: "hint", text: t("js-desk-dock-hint", "Drag a pane's title onto another pane to dock it there; drag the bars to resize.") })));
  const strip = ctx.timeline(tab);
  if (strip) root.append(h("div", { class: "dock-time" }, strip));

  // ---------- one pane alone
  if (tab.focusPane && !panes(layout).some((p) => p.id === tab.focusPane)) tab.focusPane = null;
  const area = h("div", { class: "dock-area" });
  root.append(area);
  if (tab.focusPane) {
    const p = panes(layout).find((x) => x.id === tab.focusPane);
    area.append(paneEl(p, true));
    return root;
  }
  area.append(nodeEl(layout, []));
  return root;

  function nodeEl(node, path) {
    if (node.pane) return paneEl(node, false);
    const box = h("div", { class: `dock-split ${node.split === "row" ? "horiz" : "vert"}` });
    node.kids.forEach((k, i) => {
      const cell = h("div", { class: "dock-cell", style: `flex:${node.sizes[i]} 1 0` }, nodeEl(k, [...path, i]));
      box.append(cell);
      if (i < node.kids.length - 1) box.append(barEl(node, path, i, box));
    });
    return box;
  }

  function barEl(node, path, k, box) {
    const pct = Math.round(node.sizes.slice(0, k + 1).reduce((a, b) => a + b, 0) * 100);
    const bar = h("div", { class: "dock-gutter", role: "separator", tabindex: "0", "aria-orientation": node.split === "row" ? "vertical" : "horizontal",
      "aria-valuemin": "0", "aria-valuemax": "100", "aria-valuenow": String(pct), "aria-label": t("js-desk-dock-resize", "Resize the panes") });
    bar.addEventListener("keydown", (e) => {
      const back = node.split === "row" ? "ArrowLeft" : "ArrowUp", fwd = node.split === "row" ? "ArrowRight" : "ArrowDown";
      if (e.key !== back && e.key !== fwd) return;
      e.preventDefault();
      ctx.change(tab, resize(layout, path, k, e.key === fwd ? 0.02 : -0.02), "resize", { quiet: true, focus: bar });
    });
    bar.addEventListener("pointerdown", (e) => {
      if (e.button !== 0) return;
      e.preventDefault();
      try { bar.setPointerCapture(e.pointerId); } catch { /* a synthetic pointer */ }
      const r = box.getBoundingClientRect();
      const extent = node.split === "row" ? r.width : r.height;
      let last = layout;
      const move = (ev) => {
        const pos = node.split === "row" ? ev.clientX - r.left : ev.clientY - r.top;
        last = resize(layout, path, k, barDelta(node.sizes, k, pos, extent));
        const n = path.reduce((x, i) => x.kids[i], last);
        // live: set the flex of the cells without a full render
        const cells = [...box.children].filter((c) => c.classList.contains("dock-cell"));
        cells.forEach((c, i) => { c.style.flex = `${n.sizes[i]} 1 0`; });
      };
      const up = () => { bar.removeEventListener("pointermove", move); bar.removeEventListener("pointerup", up); ctx.change(tab, last, "resize", { quiet: true }); };
      bar.addEventListener("pointermove", move);
      bar.addEventListener("pointerup", up);
    });
    return bar;
  }

  function paneEl(p, alone) {
    const sel = h("select", { class: "dock-view", "aria-label": t("js-desk-dock-view", "View in this pane") }, ...PANE_VIEWS.map((v) => { const o = h("option", { value: v, text: ctx.viewName(v) }); if (v === p.pane) o.selected = true; return o; }));
    sel.addEventListener("change", () => ctx.change(tab, setView(layout, p.id, sel.value), ctx.viewName(sel.value)));
    const tool = (text, label, fn) => h("button", { class: "lv-btn", type: "button", title: label, "aria-label": label, onclick: fn }, text);
    const title = h("div", { class: "dock-title", draggable: alone ? null : "true", title: alone ? null : t("js-desk-dock-drag", "Drag onto another pane to dock it there") }, h("span", { class: "dock-grip", "aria-hidden": "true", text: alone ? "" : "⠿" }), sel);
    const head = h("header", { class: "dock-head" }, title,
      alone ? null : tool("⇥", t("js-desk-dock-split-right", "Split: new pane to the right"), () => ctx.change(tab, splitPane(layout, p.id, "row", nextView(p.pane)), "split")),
      alone ? null : tool("⤓", t("js-desk-dock-split-down", "Split: new pane below"), () => ctx.change(tab, splitPane(layout, p.id, "col", nextView(p.pane)), "split")),
      tool(alone ? "⤡" : "⤢", alone ? t("js-desk-dock-unfocus", "Back to all panes") : t("js-desk-dock-focus", "Show this pane alone"), () => { tab.focusPane = alone ? null : p.id; ctx.change(tab, layout, alone ? "all panes" : "focus", { quiet: true }); }),
      alone || panes(layout).length <= 1 ? null : tool("×", t("js-desk-dock-close", "Close this pane"), () => ctx.change(tab, closePane(layout, p.id), "close")));
    const body = h("div", { class: `dock-body view-${p.pane}` });
    body.append(ctx.part(tab, p.pane));
    const el = h("section", { class: "dock-pane", "data-pane": p.id, "aria-label": ctx.viewName(p.pane) }, head, body);
    if (!alone) {
      title.addEventListener("dragstart", (e) => { e.dataTransfer.setData("application/x-kshana-pane", p.id); e.dataTransfer.effectAllowed = "move"; root.classList.add("dragging"); });
      title.addEventListener("dragend", () => root.classList.remove("dragging"));
      const zoneOf = (e) => {
        const r = el.getBoundingClientRect();
        const fx = (e.clientX - r.left) / r.width, fy = (e.clientY - r.top) / r.height;
        const m = Math.min(fx, 1 - fx, fy, 1 - fy);
        if (m > 0.25) return "center";
        return m === fx ? "left" : m === 1 - fx ? "right" : m === fy ? "top" : "bottom";
      };
      el.addEventListener("dragover", (e) => { if (![...(e.dataTransfer.types || [])].includes("application/x-kshana-pane")) return; e.preventDefault(); el.dataset.drop = zoneOf(e); });
      el.addEventListener("dragleave", (e) => { if (!el.contains(e.relatedTarget)) delete el.dataset.drop; });
      el.addEventListener("drop", (e) => {
        const src = e.dataTransfer.getData("application/x-kshana-pane");
        delete el.dataset.drop;
        if (!src || src === p.id) return;
        e.preventDefault();
        ctx.change(tab, dockPane(layout, src, p.id, zoneOf(e)), "dock");
      });
    }
    return el;
  }
  function nextView(v) {
    const used = new Set(panes(layout).map((p) => p.pane));
    return PANE_VIEWS.find((x) => !used.has(x)) || v;
  }
}

/** The layout as a comment line for the code console. */
export const dockLine = (layout, what) => `# panes (${what}): ${layoutText(layout)}`;
