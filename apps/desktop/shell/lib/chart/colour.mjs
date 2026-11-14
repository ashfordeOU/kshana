// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): colour scales and the look's colour roles. The maps are
// pure (tested in chart.test.mjs); themeOf() reads the CSS variables of the look (the --k-*
// roles of look.css, U14, with the Studio's tokens as fallback) from the chart's element, so a
// chart follows the theme and the colour roles without naming a colour of its own.

const hex = (s) => { const h = s.replace("#", ""); return [0, 2, 4].map((i) => parseInt(h.slice(i, i + 2), 16)); };
/** Sequential, perceptually even (the viridis anchor values). */
const VIRIDIS = ["#440154", "#472c7a", "#3b518b", "#2c718e", "#21908d", "#27ad81", "#5cc863", "#aadc32", "#fde725"].map(hex);
/** Night ramp for spectra and waterfalls on the dark "space" surface: deep blue to signal pink and white. */
const NIGHT = ["#070a2a", "#0b1a6e", "#1c2fb8", "#3b3fd8", "#7a3fd0", "#c03aa8", "#ff4f9a", "#ffb0d0", "#fff4f8"].map(hex);
/** Good to bad, for metrics where higher is better (holdover time): red, amber, green. */
const TRUST = ["#d0393f", "#e8743a", "#e7a83a", "#7fb04a", "#2f9e5e"].map(hex);
export const MAPS = { viridis: VIRIDIS, night: NIGHT, trust: TRUST };

/** The [r, g, b] (0–255) of map `name` at t in [0, 1] (clamped; NaN gives null). */
export function rampRGB(name, t) {
  if (t !== t) return null;
  const m = MAPS[name] || VIRIDIS;
  const x = Math.min(1, Math.max(0, t)) * (m.length - 1);
  const i = Math.min(m.length - 2, Math.floor(x)), f = x - i;
  const a = m[i], b = m[i + 1];
  return [Math.round(a[0] + (b[0] - a[0]) * f), Math.round(a[1] + (b[1] - a[1]) * f), Math.round(a[2] + (b[2] - a[2]) * f)];
}
export const rgbCss = (c, a = 1) => (c ? (a === 1 ? `rgb(${c[0]},${c[1]},${c[2]})` : `rgba(${c[0]},${c[1]},${c[2]},${a})`) : "transparent");
/** Normalised position of v in [lo, hi], optionally in log space. */
export function norm(v, lo, hi, log = false) {
  if (log) { if (!(v > 0)) return NaN; v = Math.log10(v); lo = Math.log10(lo); hi = Math.log10(hi); }
  return hi === lo ? 0.5 : (v - lo) / (hi - lo);
}
/** Relative luminance of an [r, g, b] colour (WCAG). */
export function luminance([r, g, b]) {
  const f = (c) => { c /= 255; return c <= 0.03928 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4; };
  return 0.2126 * f(r) + 0.7152 * f(g) + 0.0722 * f(b);
}
/** Black or white text for a cell of colour c, whichever reads better. */
export const inkOn = (c) => (c && luminance(c) > 0.32 ? "#0b0d17" : "#f2f4fb");

// The colour roles a chart uses, with the variable names of look.css (U14) first and the
// Studio's tokens as fallback; the last value is used when neither is set.
export const ROLES = {
  bg: ["--space-2", "#0C0E18"], panel: ["--space-3", "#151826"],
  ink: ["--space-ink", "#EEF0FA"], ink2: ["--space-ink-2", "#A3AAC2"], ink3: ["--space-ink-3", "#8088A6"],
  grid: ["--space-line", "rgba(255,255,255,.08)"],
  tim: ["--k-tim", "--s-tim", "#5A8CFF"], int: ["--k-int", "--s-int", "#FF5B54"], itg: ["--k-itg", "--s-itg", "#33CC78"],
  orb: ["--k-orb", "--s-orb", "#22C7D6"], nav: ["--k-nav", "--s-nav", "#FFB224"], pro: ["--k-pro", "--s-spf", "#9C7DFF"],
  bad: ["--k-bad", "--s-int", "#FF5B54"], good: ["--k-trust-good", "--s-itg", "#33CC78"], mid: ["--k-trust-mid", "--s-nav", "#FFB224"],
  gps: ["--k-sat-gps", "--s-tim", "#5A8CFF"], gal: ["--k-sat-gal", "--s-orb", "#22C7D6"], leo: ["--k-sat-leo", "#C9A2FF"],
  bds: ["--k-sat-bds", "#FFB224"], glo: ["--k-sat-glo", "#A6ADC4"],
  mono: ["--f-mono", "Geist Mono, ui-monospace, monospace"],
};
/** The default order of series colours (the domain colours of the look). */
export const SERIES = ["tim", "nav", "itg", "pro", "orb", "int", "leo", "glo"];

/** Resolve the roles against an element's computed style (or defaults with no DOM). */
export function themeOf(el) {
  const cs = el && typeof getComputedStyle === "function" ? getComputedStyle(el) : null;
  const out = {};
  for (const [k, names] of Object.entries(ROLES)) {
    let v = "";
    for (const n of names) {
      if (!n.startsWith("--")) { v = n; break; }
      v = cs ? cs.getPropertyValue(n).trim() : "";
      if (v) break;
    }
    out[k] = v;
  }
  out.series = SERIES.map((k) => out[k]);
  return out;
}

/** A colour given as a role name ("tim"), a CSS variable ("var(--k-tim)") or a colour, made concrete. */
export function resolveColour(c, theme, el) {
  if (!c) return theme.ink;
  if (theme[c] && typeof theme[c] === "string") return theme[c];
  const m = /^var\((--[\w-]+)(?:\s*,\s*(.+))?\)$/.exec(String(c).trim());
  if (m) {
    const v = el && typeof getComputedStyle === "function" ? getComputedStyle(el).getPropertyValue(m[1]).trim() : "";
    return v || (m[2] ? resolveColour(m[2], theme, el) : theme.ink);
  }
  return c;
}

/** Parse "#rgb", "#rrggbb", "rgb()" or "rgba()" into [r, g, b, a]; null otherwise. */
export function parseColour(s) {
  s = String(s || "").trim();
  let m = /^#([0-9a-f]{3})$/i.exec(s);
  if (m) return [...m[1]].map((c) => parseInt(c + c, 16)).concat(1);
  m = /^#([0-9a-f]{6})([0-9a-f]{2})?$/i.exec(s);
  if (m) return hex(m[1]).concat(m[2] ? parseInt(m[2], 16) / 255 : 1);
  m = /^rgba?\(([^)]+)\)$/i.exec(s);
  if (m) { const p = m[1].split(/[\s,/]+/).filter(Boolean).map(Number); return [p[0], p[1], p[2], p[3] ?? 1]; }
  return null;
}
/** The colour with alpha a, as rgba() (unchanged when it cannot be parsed). */
export function withAlpha(c, a) {
  const p = parseColour(c);
  return p ? `rgba(${p[0]},${p[1]},${p[2]},${a})` : c;
}
