// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop map (0.42 U15): the two map styles, Night ops (dark, the default for long
// sessions) and Chart (light, a paper chart for daylight and reports), built from the shell's
// own colour variables so the map follows the theme. Colour is kept for meaning: trust from
// trusted (the integrity colour) to not trusted (the interference colour), interference
// areas in the interference colour. Pure; tested in ../clock.test.mjs.

/** The variables a style reads (getComputedStyle(document.documentElement)). */
export const STYLE_VARS = ["--bg", "--bg-2", "--surface", "--surface-2", "--ink", "--ink-2", "--ink-3", "--line", "--line-2",
  "--space", "--space-2", "--space-3", "--space-ink", "--space-ink-2", "--space-ink-3", "--space-line",
  "--s-int", "--s-itg", "--s-nav", "--s-orb", "--s-tim", "--s-spf", "--int", "--itg", "--nav", "--orb", "--tim", "--spf", "--nav-card", "--f-mono", "--f-text"];

/** A CSS colour (#rgb, #rrggbb, rgb(), rgba()) as [r, g, b, a], or null. */
export function parseColor(s) {
  const c = String(s || "").trim();
  let m = /^#([0-9a-f]{3})$/i.exec(c);
  if (m) return [...m[1]].map((x) => parseInt(x + x, 16)).concat(1);
  m = /^#([0-9a-f]{6})([0-9a-f]{2})?$/i.exec(c);
  if (m) return [0, 2, 4].map((i) => parseInt(m[1].slice(i, i + 2), 16)).concat(m[2] ? parseInt(m[2], 16) / 255 : 1);
  m = /^rgba?\(\s*([\d.]+)[\s,]+([\d.]+)[\s,]+([\d.]+)(?:[\s,/]+([\d.]+%?))?\s*\)$/i.exec(c);
  if (m) return [+m[1], +m[2], +m[3], m[4] === undefined ? 1 : m[4].endsWith("%") ? parseFloat(m[4]) / 100 : +m[4]];
  return null;
}
const css = ([r, g, b, a]) => (a >= 1 ? `rgb(${Math.round(r)},${Math.round(g)},${Math.round(b)})` : `rgba(${Math.round(r)},${Math.round(g)},${Math.round(b)},${+a.toFixed(3)})`);
/** `a` mixed toward `b` by f (0 = a, 1 = b), as a CSS colour. */
export function mix(a, b, f) {
  const x = parseColor(a), y = parseColor(b);
  if (!x || !y) return a || b || "";
  return css(x.map((v, i) => v + (y[i] - v) * f));
}
/** A colour with alpha `al`. */
export function alpha(c, al) {
  const x = parseColor(c);
  return x ? css([x[0], x[1], x[2], x[3] * al]) : c;
}

/** "night" or "chart" for a shell theme ("dark" or "light"). */
export const styleForTheme = (theme) => (theme === "light" ? "chart" : "night");

/**
 * The colours of a style from the variables (a function name → value): { name, sea, land,
 * coast, grid, gridText, text, halo, track, trackDim, trusted, degraded, untrusted, visible,
 * hidden, area, areaFill, areaBand, site, station, jammer, satellite, cursor, mark, range,
 * paper (the plot's ground), font, mono }.
 */
export function mapStyle(name, v) {
  const g = (k, d) => (v(k) || d).trim();
  const night = name !== "chart";
  const sea = night ? g("--space-2", "#0C0E18") : mix(g("--bg", "#E8ECF3"), g("--tim", "#1C4FE0"), 0.07);
  const land = night ? mix(g("--space-2", "#0C0E18"), g("--s-tim", "#6A98FF"), 0.17) : mix(g("--surface", "#F5F7FB"), g("--nav-card", "#F5A300") || "#F5A300", 0.1);
  const ink = night ? g("--space-ink", "#EEF0FA") : g("--ink", "#182033");
  const ink2 = night ? g("--space-ink-2", "#A3AAC2") : g("--ink-2", "#3A455E");
  const s = (k, kl, d) => (night ? g(k, d) : g(kl, d));
  return {
    name: night ? "night" : "chart",
    sea, land,
    coast: night ? alpha(g("--space-ink-2", "#A3AAC2"), 0.6) : alpha(g("--ink-2", "#3A455E"), 0.7),
    grid: night ? alpha(g("--space-ink-3", "#8088A6"), 0.22) : alpha(g("--ink-3", "#4E5971"), 0.2),
    gridText: night ? g("--space-ink-3", "#8088A6") : g("--ink-3", "#4E5971"),
    text: ink, text2: ink2,
    halo: alpha(sea, 0.85),
    panel: night ? alpha(g("--space-3", "#151826"), 0.88) : alpha(g("--surface", "#F5F7FB"), 0.9),
    paper: night ? g("--space-2", "#0C0E18") : g("--surface", "#F5F7FB"),
    track: s("--s-orb", "--orb", "#2CD0DE"),
    trackDim: alpha(s("--s-orb", "--orb", "#2CD0DE"), 0.35),
    trusted: s("--s-itg", "--itg", "#3DDC84"),
    degraded: s("--s-nav", "--nav", "#FFB224"),
    untrusted: s("--s-int", "--int", "#FF5B54"),
    visible: s("--s-nav", "--nav", "#FFB224"),
    hidden: s("--s-orb", "--orb", "#2CD0DE"),
    area: s("--s-int", "--int", "#FF5B54"),
    areaFill: alpha(s("--s-int", "--int", "#FF5B54"), night ? 0.2 : 0.16),
    areaBand: alpha(s("--s-int", "--int", "#FF5B54"), night ? 0.08 : 0.07),
    site: ink,
    station: s("--s-tim", "--tim", "#6A98FF"),
    jammer: s("--s-int", "--int", "#FF5B54"),
    satellite: s("--s-spf", "--spf", "#A58BFF"),
    cursor: ink,
    mark: s("--s-nav", "--nav", "#FFB224"),
    range: alpha(s("--s-tim", "--tim", "#6A98FF"), 0.18),
    font: g("--f-text", "system-ui, sans-serif"),
    mono: g("--f-mono", "ui-monospace, monospace"),
  };
}

/**
 * The colour of a track point: by trust (q from 1 trusted to 0 not trusted, the engine's
 * nominal and degraded bands at 0.9 and 0.55) or by station visibility; `track` without either.
 */
export function trackColor(st, kind, q) {
  if (Number.isNaN(q) || q === null || q === undefined) return st.track;
  if (kind === "visible") return q >= 1 ? st.visible : st.hidden;
  if (kind === "trust") return q >= 0.9 ? st.trusted : q >= 0.55 ? st.degraded : st.untrusted;
  return st.track;
}
