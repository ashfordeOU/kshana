// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: a run on the time cursor (0.42 U7, U15). One clock (./clock.mjs) per
// run, and the views that follow it: the timeline strip, the time-series plot, the 2D map and
// the inspector's values at the cursor. The shell keeps one of these per open run and moves
// its element into the page on each render, so scrubbing never redraws the shell.
import { createClock, attachTicker, clockKey, applyKey, clockText } from "./clock.mjs";
import { timeModel, hasGeo, readoutAt, sceneLayers } from "./timemodel.mjs";
import { mapStyle, STYLE_VARS, styleForTheme } from "./map/style.mjs";
import { createMapView } from "./map/view.mjs";
import { mountPlot } from "./plot.mjs";
import { createTimeline } from "./timeline.mjs";
import { markersOf, markerRows, markerPlaces, markerRefs } from "./markers.mjs";

// ---------- the map style: follows the shell's theme unless the user picks one
const live = new Set();
let pick = null;
const themeNow = () => {
  const d = document.documentElement.dataset.theme;
  if (d === "dark" || d === "light") return d;
  return globalThis.matchMedia && matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
};
export const styleName = () => pick || styleForTheme(themeNow());
function restyleAll() { for (const v of live) v.restyle(); }
let watching = false;
function watchTheme() {
  if (watching || typeof MutationObserver !== "function") return;
  watching = true;
  new MutationObserver(() => { pick = null; restyleAll(); }).observe(document.documentElement, { attributes: true, attributeFilter: ["data-theme"] });
  if (globalThis.matchMedia) matchMedia("(prefers-color-scheme: dark)").addEventListener("change", () => restyleAll());
}
function currentStyle() {
  const cs = getComputedStyle(document.documentElement);
  const vals = new Map(STYLE_VARS.map((k) => [k, cs.getPropertyValue(k)]));
  return mapStyle(styleName(), (k) => vals.get(k) || cs.getPropertyValue(k));
}

/**
 * The linked views of one run. `seriesModel` is the Studio's line-chart model of the result
 * (or null); `scene` the parsed GeoJSON of the scenario's geometry, or a promise of it, or
 * null; `at` an instant to start the cursor at (the previous run's, when the scenario runs
 * again). `loadLand(scale)` gives the packed Natural Earth layer. Returns null when nothing in
 * the run runs over time.
 */
export function createRunView({ t, icon, run, seriesModel = null, scene = null, at, loadLand, readoutLabel = (k) => k, fmt = (v) => String(v), onMarkers = null, overlay = null, onExplain = null }) {
  // A run diff (0.42 U22) lays a second run over this one: its series (relabelled) on the plot,
  // its track as a ghost on the map.
  const withOverlay = (m) => (m && overlay ? { ...m, series: [...m.series, ...(overlay.series || [])], ghosts: overlay.ghosts || [] } : m);
  let model = withOverlay(timeModel(run.result, seriesModel, scene && typeof scene.then !== "function" ? scene : null));
  if (!model) return null;
  watchTheme();
  const clock = createClock({ start: model.span[0], end: model.span[1], times: model.times, step: model.step, t: at });
  const stopTicker = attachTicker(clock, (fn) => requestAnimationFrame(fn), (id) => cancelAnimationFrame(id));

  const root = document.createElement("div");
  root.className = "lv";
  root.dataset.style = styleName();
  const views = document.createElement("div");
  views.className = "lv-views";
  const plotEl = document.createElement("div");
  plotEl.className = "lv-plot";
  const map = createMapView({ t, loadLand, style: currentStyle, styleName, setStyleName: (n) => { pick = n; restyleAll(); },
    readout: (x) => readoutAt(model, x).map((r) => ({ ...r, k: readoutLabel(r.k) })), valueText: fmt });
  let timeline = createTimeline({ t, clock, style: currentStyle, epochMs: model.epochMs, icon });
  views.append(plotEl, map.el);
  // The plot sits behind one function (lib/plot.mjs mountPlot): the interactive chart (U30),
  // whose markers A and B (U12) are read out below and placed on the map at their instants.
  let marks = [];
  const plot = mountPlot(plotEl, model, clock, { t, onMarkers: (items) => setMarks(markersOf(items)) });
  root.append(timeline.el, views);

  map.onMark = (x) => { clock.pause(); clock.seek(x, "map"); clock.addMark(x, t("js-desk-map-mark", "map")); };

  // The values at the cursor, for the inspector.
  const readout = document.createElement("section");
  readout.className = "lv-readout";
  const rHead = document.createElement("div");
  rHead.className = "lv-readout-head";
  const rTitle = document.createElement("span");
  rTitle.textContent = t("js-desk-at-cursor", "At the cursor");
  const rTime = document.createElement("span");
  rTime.className = "mono";
  rHead.append(rTitle, rTime);
  const dl = document.createElement("dl");
  dl.className = "kv";
  const mkHead = document.createElement("div");
  mkHead.className = "lv-readout-head";
  mkHead.textContent = t("js-desk-markers", "Markers");
  const mkDl = document.createElement("dl");
  mkDl.className = "kv lv-markers";
  const mkHint = document.createElement("p");
  mkHint.className = "hint";
  mkHint.textContent = t("js-desk-markers-hint", "On the plot: Alt-click or M places marker A, then B; Escape clears them. They show on the map at the same instants.");
  readout.append(rHead, dl, mkHead, mkDl, mkHint);
  function setMarks(m) {
    marks = m;
    drawMarks();
    if (onMarkers) onMarkers(marks);
  }
  function drawMarks() {
    map.setMarkers(markerPlaces(model, marks));
    mkDl.replaceChildren(...markerRows(marks, { epochMs: model.epochMs, t }).flatMap((r) => { const dt = document.createElement("dt"); dt.textContent = r.k; const dd = document.createElement("dd"); dd.className = "mono"; dd.textContent = r.v; return [dt, dd]; }));
    mkHint.hidden = marks.length > 0;
  }
  let rowsKey = "", lastRows = [];
  // A number at the cursor opens its explanation (0.42 U11): click or Enter on it.
  if (onExplain) {
    const pick = (e) => { const dd = e.target.closest && e.target.closest("dd"); if (!dd) return; const i = [...dl.querySelectorAll("dd")].indexOf(dd); const r = lastRows[i]; if (r && typeof r.v === "number") onExplain(r, dd); };
    dl.addEventListener("click", pick);
    dl.addEventListener("keydown", (e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); pick(e); } });
  }
  function drawReadout(s) {
    rTime.textContent = clockText(s.t, { epochMs: model.epochMs, ms: model.step > 0 && model.step < 1 });
    const rows = readoutAt(model, s.t);
    lastRows = rows;
    const key = rows.map((r) => r.k).join("|");
    if (key !== rowsKey) {
      rowsKey = key;
      dl.replaceChildren(...rows.flatMap((r) => { const dt = document.createElement("dt"); dt.textContent = readoutLabel(r.k); return [dt, document.createElement("dd")]; }));
    }
    const dds = dl.querySelectorAll("dd");
    rows.forEach((r, i) => {
      const v = typeof r.v === "number" ? `${fmt(r.v)}${r.unit ? ` ${r.unit}` : ""}` : String(r.v);
      if (dds[i].textContent !== v) dds[i].textContent = v;
      const cls = `${r.state ? `state-${r.state}` : ""}${onExplain && typeof r.v === "number" ? " num-x-dd" : ""}`.trim();
      if (dds[i].className !== cls) { dds[i].className = cls; if (onExplain && typeof r.v === "number") { dds[i].tabIndex = 0; dds[i].setAttribute("role", "button"); } else { dds[i].removeAttribute("tabindex"); dds[i].removeAttribute("role"); } }
    });
  }

  const views3 = [timeline, map];
  const off = clock.subscribe((s) => { for (const v of views3) v.setClock(s); drawReadout(s); });
  function setModel(m) {
    model = m;
    root.classList.toggle("lv-no-map", !hasGeo(m));
    root.classList.toggle("lv-no-plot", !m.series.length);
    plot.setModel(m);
    map.setModel(m);
    drawMarks();
    const s = clock.snapshot();
    for (const v of views3) v.setClock(s);
    drawReadout(s);
  }
  const ctl = {
    clock,
    get model() { return model; },
    get hasMap() { return hasGeo(model); },
    get el() { return root; },
    /** The element for a view: "timeline" (plot and map) or "map" (the map alone). */
    node(mode) {
      // parts lent to the dock come home
      if (timeline.el.parentNode !== root) root.prepend(timeline.el);
      if (plotEl.parentNode !== views) views.prepend(plotEl);
      if (map.el.parentNode !== views) views.append(map.el);
      root.classList.toggle("lv-mode-map", mode === "map");
      requestAnimationFrame(() => { plot.resize(); map.resize(); timeline.resize(); });
      return root;
    },
    readout: () => readout,
    /**
     * One part on its own, for a pane of the dock (0.42 U20): "timeline" (the clock strip),
     * "plot" or "map". The part leaves the run view's own layout until node() is asked again.
     */
    part(name) {
      const el = name === "timeline" ? timeline.el : name === "plot" ? plotEl : name === "map" ? map.el : null;
      if (el) requestAnimationFrame(() => { if (name === "plot") plot.resize(); else if (name === "map") map.resize(); else timeline.resize(); });
      return el;
    },
    /** The plot's markers A and B: [{ name, t, v, unit, series }]. */
    get markers() { return marks.slice(); },
    /** Place saved markers ([{ t, series }]) on the plot again. */
    restoreMarkers(saved) { if (saved && saved.length) plot.chart.setMarkers(markerRefs(plot.chart.spec.series, saved)); },
    /** The interactive chart of the plot (for the figure tools). */
    get chart() { return plot.chart; },
    /** Handle a key for the clock; true when it was used. */
    key(e) {
      const tg = e.target || {};
      const tag = (tg.tagName || "").toLowerCase();
      const act = clockKey(e, {
        inField: tag === "input" || tag === "textarea" || tag === "select" || !!tg.isContentEditable,
        onButton: tag === "button" || tag === "a" || tag === "summary",
        inTabList: !!(tg.closest && tg.closest('[role="tablist"]')),
      });
      return applyKey(clock, act);
    },
    restyle() { root.dataset.style = styleName(); plot.restyle(); map.restyle(); timeline.restyle(); },
    destroy() { off(); stopTicker(); clock.pause(); plot.destroy(); map.destroy(); timeline.destroy(); live.delete(ctl); },
  };
  live.add(ctl);
  setModel(model);
  // The scenario's geometry arrives after the run (the engine's GeoJSON export).
  if (scene && typeof scene.then === "function") {
    scene.then((fc) => {
      if (!fc || !live.has(ctl)) return;
      const m = withOverlay(timeModel(run.result, seriesModel, fc));
      if (!m) return;
      if (Number.isFinite(m.epochMs) && !Number.isFinite(model.epochMs)) {
        // The clock now reads in UTC: the strip is rebuilt with the scene's epoch.
        const old = timeline;
        timeline = createTimeline({ t, clock, style: currentStyle, epochMs: m.epochMs, icon });
        old.el.replaceWith(timeline.el);
        old.destroy();
        views3[0] = timeline;
      }
      setModel(m);
    }).catch(() => {});
  }
  return ctl;
}

export { sceneLayers };
