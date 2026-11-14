// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the look (0.42 U14). Colour roles, the trust scale and the density
// setting, as data. Pure, no DOM; tested in ../look.test.mjs, which also checks that
// ../look.css declares exactly these values, that every pair of domain colours and the trust
// endpoints stay apart under protanopia and deuteranopia, and that the text colours meet
// WCAG AA on the shell's surfaces in both themes.
//
// Rules (the design brief, "Colour roles"): one meaning per colour. Domain colours say which
// area; evidence colours say how far to trust a result (outlined badges, never fills);
// constellation colours are fixed per constellation in every view; one trust scale, green
// to amber to red, for tracks, stations and areas. Red only ever means "bad now". The Pro
// accent marks what the Pro edition adds and nothing else.

/** The two themes. Surfaces and inks repeat ../../../../web/studio/tokens.css (the shell draws on them); the rest are the roles. */
export const THEMES = {
  dark: {
    surfaces: { bg: "#07080E", chrome: "#0D0F18", surface: "#12141F", "surface-2": "#181B28" },
    ink: { ink: "#F2F4FB", "ink-2": "#A6ADC4", "ink-3": "#858CA6" },
    domain: { int: "#FF5B54", tim: "#5A8CFF", itg: "#33CC78", orb: "#22C7D6", nav: "#FFB224" },
    pro: "#9C7DFF",
    evidence: { validated: "#33CC78", modelled: "#FFB224", partner: "#9C7DFF" },
    sat: { gps: "#5A8CFF", gal: "#22C7D6", bds: "#FFB224", glo: "#A6ADC4", leo: "#C9A2FF", qzss: "#FF7AB6", navic: "#B9D85A", sbas: "#858CA6" },
    trust: { good: "#33CC78", mid: "#FFB224", bad: "#FF5B54" },
    bad: "#FF5B54",
  },
  light: {
    surfaces: { bg: "#E8ECF3", chrome: "#DEE4EE", surface: "#F5F7FB", "surface-2": "#EDF1F7" },
    ink: { ink: "#182033", "ink-2": "#3A455E", "ink-3": "#4E5971" },
    domain: { int: "#BE1E3A", tim: "#2A4FD0", itg: "#08703E", orb: "#00668C", nav: "#704000" },
    pro: "#5B3BC4",
    evidence: { validated: "#08703E", modelled: "#704000", partner: "#5B3BC4" },
    sat: { gps: "#2A4FD0", gal: "#00668C", bds: "#704000", glo: "#3A455E", leo: "#6A3FC0", qzss: "#A31F63", navic: "#4A6400", sbas: "#4E5971" },
    trust: { good: "#08703E", mid: "#A86400", bad: "#BE1E3A" },
    bad: "#BE1E3A",
  },
};

/** The five domain roles, in the brief's order, with what each covers. */
export const DOMAIN_ROLES = [
  { role: "int", name: "Interference", covers: "jamming, spoofing" },
  { role: "tim", name: "Timing", covers: "clocks, holdover" },
  { role: "itg", name: "Integrity", covers: "HPL, RAIM, health" },
  { role: "orb", name: "Orbit", covers: "space, LEO, links" },
  { role: "nav", name: "Navigation", covers: "tracks, fusion" },
];

/** The constellations the engine models, with their fixed colour token. */
export const CONSTELLATIONS = [
  { id: "gps", name: "GPS" }, { id: "gal", name: "Galileo" }, { id: "bds", name: "BeiDou" }, { id: "glo", name: "GLONASS" },
  { id: "qzss", name: "QZSS" }, { id: "navic", name: "NavIC" }, { id: "sbas", name: "SBAS" }, { id: "leo", name: "LEO" },
];

// The Studio's scenario areas (web/studio/lib/catalog.mjs DOMAINS) on the five roles. An
// area that is none of them (campaigns, studies, an added group) keeps the catalogue's colour.
export const DOMAIN_ROLE = {
  interference: "int", spectrum: "int", spoofing: "int",
  timing: "tim",
  integrity: "itg",
  orbits: "orb", constellations: "orb", leo: "orb", "leo-missions": "orb", spaceops: "orb", deepspace: "orb", solar: "orb",
  navigation: "nav",
};
/** The role of a scenario area ("int", "tim", "itg", "orb", "nav"), or null. */
export const domainRole = (id) => (id && Object.prototype.hasOwnProperty.call(DOMAIN_ROLE, id) ? DOMAIN_ROLE[id] : null);
/** The CSS colour of a scenario area: its role's token, or `fallback` (the catalogue's colour). */
export const domainColour = (id, fallback = "var(--ink-3)") => { const r = domainRole(id); return r ? `var(--k-${r})` : fallback; };

/** The CSS token of an evidence tier (VALIDATED, MODELLED, PARTNER), or null. */
export function evidenceVar(tier) {
  const k = String(tier || "").toLowerCase();
  return ["validated", "modelled", "partner"].includes(k) ? `var(--k-ev-${k})` : null;
}
/** The CSS token of a constellation by id or name (GPS, Galileo, gal, E, …), or null. */
export function constellationVar(x) {
  const k = String(x || "").trim().toLowerCase();
  const alias = { g: "gps", gps: "gps", e: "gal", gal: "gal", galileo: "gal", c: "bds", b: "bds", bds: "bds", beidou: "bds", compass: "bds", r: "glo", glo: "glo", glonass: "glo", j: "qzss", qzss: "qzss", i: "navic", irnss: "navic", navic: "navic", s: "sbas", sbas: "sbas", leo: "leo" };
  return alias[k] ? `var(--k-sat-${alias[k]})` : null;
}

// ---- the trust scale: 1 = believe it, 0 = do not
const hexRgb = (h) => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16) / 255);
const toLin = (c) => (c <= 0.04045 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4);
const fromLin = (c) => (c <= 0.0031308 ? 12.92 * c : 1.055 * c ** (1 / 2.4) - 0.055);
const rgbHex = (v) => `#${v.map((x) => Math.round(Math.min(1, Math.max(0, x)) * 255).toString(16).padStart(2, "0")).join("").toUpperCase()}`;
// OKLab (Björn Ottosson), so the blend between two stops keeps an even lightness.
function toOklab(h) {
  const [r, g, b] = hexRgb(h).map(toLin);
  const l = Math.cbrt(0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b);
  const m = Math.cbrt(0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b);
  const s = Math.cbrt(0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b);
  return [0.2104542553 * l + 0.793617785 * m - 0.0040720468 * s, 1.9779984951 * l - 2.428592205 * m + 0.4505937099 * s, 0.0259040371 * l + 0.7827717662 * m - 0.808675766 * s];
}
function fromOklab([L, A, B]) {
  const l = (L + 0.3963377774 * A + 0.2158037573 * B) ** 3, m = (L - 0.1055613458 * A - 0.0638541728 * B) ** 3, s = (L - 0.0894841775 * A - 1.291485548 * B) ** 3;
  return rgbHex([4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s, -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s, -0.0041960863 * l - 0.7034186147 * m + 1.707614701 * s].map(fromLin));
}
/** Where the amber stop sits on the trust scale (the brief's gradient puts it 55 % of the way from trusted). */
export const TRUST_MID = 0.45;
/**
 * The colour of a trust value x in 0..1 (1 trusted, green; TRUST_MID amber; 0 not trusted,
 * red), as #RRGGBB for `theme` ("dark" or "light"). Out-of-range values are clamped; a value
 * that is not a number has no trust colour and gets the theme's quiet ink.
 */
export function trustColour(x, theme = "dark") {
  const T = THEMES[theme] || THEMES.dark;
  if (typeof x !== "number" || !Number.isFinite(x)) return T.ink["ink-3"];
  const v = Math.min(1, Math.max(0, x));
  const [a, b, f] = v >= TRUST_MID ? [T.trust.mid, T.trust.good, (v - TRUST_MID) / (1 - TRUST_MID)] : [T.trust.bad, T.trust.mid, v / TRUST_MID];
  if (f <= 0) return a;
  if (f >= 1) return b;
  const p = toOklab(a), q = toOklab(b);
  return fromOklab(p.map((c, i) => c + (q[i] - c) * f));
}
/** A trust value's band: "good", "mid" or "bad" (or "" for no value). */
export const trustBand = (x) => (typeof x !== "number" || !Number.isFinite(x) ? "" : x >= 0.7 ? "good" : x >= 0.3 ? "mid" : "bad");

// ---- the CSS tokens (../look.css declares these for each theme; the test keeps them equal)
/** The custom properties of a theme: { "--k-int": "#…", … }. */
export function cssTokens(theme) {
  const T = THEMES[theme];
  const out = {};
  for (const [k, v] of Object.entries(T.domain)) out[`--k-${k}`] = v;
  out["--k-pro"] = T.pro;
  for (const [k, v] of Object.entries(T.evidence)) out[`--k-ev-${k}`] = v;
  for (const [k, v] of Object.entries(T.sat)) out[`--k-sat-${k}`] = v;
  for (const [k, v] of Object.entries(T.trust)) out[`--k-trust-${k}`] = v;
  out["--k-bad"] = T.bad;
  return out;
}

// ---- density: Comfortable (13 px text, 32 px rows) for analysis, Compact (12 px, 24 px rows) for operations
export const DENSITIES = ["comfortable", "compact"];
export const DENSITY_KEY = "kshana-desk-density";
/** The remembered density (storage may be missing or throw): "comfortable" unless "compact" was stored. */
export function readDensity(storage) {
  try { return storage && storage.getItem(DENSITY_KEY) === "compact" ? "compact" : "comfortable"; } catch { return "comfortable"; }
}
/** Remember a density; false when it could not be stored. */
export function writeDensity(storage, d) {
  try { if (!storage) return false; storage.setItem(DENSITY_KEY, DENSITIES.includes(d) ? d : "comfortable"); return true; } catch { return false; }
}
export const otherDensity = (d) => (d === "compact" ? "comfortable" : "compact");
