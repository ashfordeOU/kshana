// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: tests of the look (0.42 U14): the colour roles and look.css, WCAG AA
// contrast of the text colours, the colour-blind separation of the domain colours and the
// trust endpoints, the trust scale, the symbol set, number formatting and the density switch.
// Run: node apps/desktop/shell/look.test.mjs
//
// The colour-blind check simulates protanopia and deuteranopia (and tritanopia, as a softer
// check) with the Machado, Oliveira and Fernandes (2009) matrices at full severity, applied
// to linear sRGB, and measures the difference of each pair in CIELAB (CIE76 ΔE, D65). The
// thresholds: ΔE ≥ 12 under each simulation for every pair of the five domain colours and for
// the trust endpoints (good against bad, and each against the amber middle), ΔE ≥ 20 with
// normal vision, and ΔE ≥ 8 under tritanopia. ΔE 12 is several times a just-noticeable
// difference (about 2.3), so two marks side by side on a map or in a table stay apart.
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { THEMES, DOMAIN_ROLES, DOMAIN_ROLE, CONSTELLATIONS, cssTokens, domainRole, domainColour, evidenceVar, constellationVar, trustColour, trustBand, TRUST_MID, readDensity, writeDensity, otherDensity, DENSITY_KEY } from "./lib/look.mjs";
import { SYMBOLS, SYMBOL_IDS, symbolMarkup, spriteMarkup, partAttrs, domainSymbol, DOMAIN_SYMBOL, isSymbol } from "./lib/symbols.mjs";
import { fmtNumber, fmtValue, fmtUtc, fmtDuration, fmtCount, roundUncertainty, siScale, splitFigure } from "./lib/format.mjs";

const here = dirname(fileURLToPath(import.meta.url));
let n = 0;
const test = async (name, fn) => { try { await fn(); } catch (e) { e.message = `${name}: ${e.message}`; throw e; } n++; };

// ---- colour science (only for the tests)
const rgb = (h) => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16) / 255);
const lin = (c) => (c <= 0.04045 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4);
const luminance = (h) => { const [r, g, b] = rgb(h).map(lin); return 0.2126 * r + 0.7152 * g + 0.0722 * b; };
const contrast = (a, b) => { const x = luminance(a), y = luminance(b); return (Math.max(x, y) + 0.05) / (Math.min(x, y) + 0.05); };
const CVD = {
  normal: [[1, 0, 0], [0, 1, 0], [0, 0, 1]],
  protanopia: [[0.152286, 1.052583, -0.204868], [0.114503, 0.786281, 0.099216], [-0.003882, -0.048116, 1.051998]],
  deuteranopia: [[0.367322, 0.860646, -0.227968], [0.280085, 0.672501, 0.047413], [-0.01182, 0.04294, 0.968881]],
  tritanopia: [[1.255528, -0.076749, -0.178779], [-0.078411, 0.930809, 0.147602], [0.004733, 0.691367, 0.3039]],
};
const simulate = (h, m) => { const v = rgb(h).map(lin); return CVD[m].map((r) => Math.min(1, Math.max(0, r[0] * v[0] + r[1] * v[1] + r[2] * v[2]))); };
function lab([r, g, b]) {
  const X = (0.4124 * r + 0.3576 * g + 0.1805 * b) / 0.95047, Y = 0.2126 * r + 0.7152 * g + 0.0722 * b, Z = (0.0193 * r + 0.1192 * g + 0.9505 * b) / 1.08883;
  const f = (t) => (t > 0.008856 ? Math.cbrt(t) : 7.787 * t + 16 / 116);
  return [116 * f(Y) - 16, 500 * (f(X) - f(Y)), 200 * (f(Y) - f(Z))];
}
const deltaE = (a, b, m) => { const p = lab(simulate(a, m)), q = lab(simulate(b, m)); return Math.hypot(p[0] - q[0], p[1] - q[1], p[2] - q[2]); };
const MIN_DE = { normal: 20, protanopia: 12, deuteranopia: 12, tritanopia: 8 };
const pairs = (o) => { const k = Object.keys(o); const out = []; for (let i = 0; i < k.length; i++) for (let j = i + 1; j < k.length; j++) out.push([k[i], k[j]]); return out; };
const HEX = /^#[0-9A-F]{6}$/;

// ---- colour roles
await test("every role colour is a #RRGGBB in both themes, and the themes have the same roles", () => {
  const keys = (t) => Object.keys(cssTokens(t)).sort();
  assert.deepEqual(keys("dark"), keys("light"));
  for (const t of ["dark", "light"]) for (const [k, v] of Object.entries(cssTokens(t))) assert.match(v, HEX, `${t} ${k}`);
  assert.deepEqual(DOMAIN_ROLES.map((d) => d.role), ["int", "tim", "itg", "orb", "nav"]);
  for (const t of ["dark", "light"]) assert.equal(THEMES[t].bad, THEMES[t].domain.int, "red, the interference colour, is also the only 'bad now' colour");
  assert.deepEqual(CONSTELLATIONS.map((c) => c.id).sort(), Object.keys(THEMES.dark.sat).sort());
});
await test("look.css declares exactly the tokens of lib/look.mjs, light bare and dark twice (system and forced)", () => {
  const css = readFileSync(join(here, "look.css"), "utf8").replace(/\/\*[\s\S]*?\*\//g, "");
  const blocks = [];
  for (const m of css.matchAll(/([^{}]+)\{([^{}]*--k-int[^{}]*)\}/g)) blocks.push({ sel: m[1].trim(), decl: Object.fromEntries([...m[2].matchAll(/(--k-[a-z0-9-]+)\s*:\s*(#[0-9A-Fa-f]{6})/g)].map((x) => [x[1], x[2].toUpperCase()])) });
  assert.equal(blocks.length, 3, "three token blocks");
  assert.equal(blocks[0].sel, ":root");
  assert.deepEqual(blocks[0].decl, cssTokens("light"));
  assert.match(blocks[1].sel, /:root:not\(\[data-theme="light"\]\)/);
  assert.deepEqual(blocks[1].decl, cssTokens("dark"));
  assert.equal(blocks[2].sel, ':root[data-theme="dark"]');
  assert.deepEqual(blocks[2].decl, cssTokens("dark"));
  assert.match(css, /@media \(prefers-color-scheme: dark\)\{\s*:root:not\(\[data-theme="light"\]\)\{\s*--k-int/);
});
await test("the surfaces and inks repeat the Studio's tokens.css", () => {
  const tok = readFileSync(join(here, "..", "..", "..", "web", "studio", "tokens.css"), "utf8");
  const light = tok.slice(tok.indexOf(":root{"), tok.indexOf("@media (prefers-color-scheme: dark)"));
  const dark = tok.slice(tok.indexOf(':root[data-theme="dark"]{'));
  const val = (src, name) => { const m = src.match(new RegExp(`--${name}:(#[0-9A-Fa-f]{6})`)); return m && m[1].toUpperCase(); };
  for (const [t, src] of [["light", light], ["dark", dark]]) {
    const T = THEMES[t];
    assert.equal(T.surfaces.bg, val(src, "bg")); assert.equal(T.surfaces.chrome, val(src, "bg-2"));
    assert.equal(T.surfaces.surface, val(src, "surface")); assert.equal(T.surfaces["surface-2"], val(src, "surface-2"));
    for (const k of ["ink", "ink-2", "ink-3"]) assert.equal(T.ink[k], val(src, k), `${t} ${k}`);
  }
});
await test("text colours meet WCAG AA (4.5:1) on every surface of the shell, in both themes", () => {
  for (const t of ["dark", "light"]) {
    const T = THEMES[t];
    const text = { ...T.ink, ...Object.fromEntries(Object.entries(T.domain).map(([k, v]) => [`domain ${k}`, v])), pro: T.pro, bad: T.bad,
      ...Object.fromEntries(Object.entries(T.evidence).map(([k, v]) => [`evidence ${k}`, v])), ...Object.fromEntries(Object.entries(T.sat).map(([k, v]) => [`constellation ${k}`, v])) };
    for (const [name, c] of Object.entries(text)) for (const [s, bg] of Object.entries(T.surfaces)) {
      const r = contrast(c, bg);
      assert.ok(r >= 4.5, `${t}: ${name} ${c} on ${s} ${bg} is ${r.toFixed(2)}:1, under 4.5:1`);
    }
  }
});
await test("trust colours, drawn as marks, meet 3:1 (WCAG non-text contrast) on every surface", () => {
  for (const t of ["dark", "light"]) for (const [k, c] of Object.entries(THEMES[t].trust)) for (const bg of Object.values(THEMES[t].surfaces)) assert.ok(contrast(c, bg) >= 3, `${t} trust ${k} on ${bg}: ${contrast(c, bg).toFixed(2)}`);
});
await test("colour-blind check: every pair of domain colours stays apart (ΔE thresholds in the header)", () => {
  for (const t of ["dark", "light"]) for (const [a, b] of pairs(THEMES[t].domain)) for (const [m, min] of Object.entries(MIN_DE)) {
    const d = deltaE(THEMES[t].domain[a], THEMES[t].domain[b], m);
    assert.ok(d >= min, `${t}: ${a}/${b} under ${m}: ΔE ${d.toFixed(1)} < ${min}`);
  }
});
await test("colour-blind check: the trust endpoints and the amber middle stay apart", () => {
  for (const t of ["dark", "light"]) for (const [a, b] of pairs(THEMES[t].trust)) for (const [m, min] of Object.entries(MIN_DE)) {
    const d = deltaE(THEMES[t].trust[a], THEMES[t].trust[b], m);
    assert.ok(d >= min, `${t}: trust ${a}/${b} under ${m}: ΔE ${d.toFixed(1)} < ${min}`);
  }
  // the simulation itself: a grey stays grey, red and green collapse towards each other for a deuteranope
  assert.ok(deltaE("#808080", "#808080", "deuteranopia") < 1e-9);
  assert.ok(deltaE("#FF0000", "#00FF00", "deuteranopia") < deltaE("#FF0000", "#00FF00", "normal") / 2);
});
await test("areas map onto the five roles; others keep the catalogue's colour", () => {
  assert.equal(domainRole("interference"), "int"); assert.equal(domainRole("spoofing"), "int"); assert.equal(domainRole("timing"), "tim");
  assert.equal(domainRole("integrity"), "itg"); assert.equal(domainRole("leo"), "orb"); assert.equal(domainRole("navigation"), "nav");
  assert.equal(domainRole("studies"), null); assert.equal(domainRole("toString"), null); assert.equal(domainRole(null), null);
  assert.equal(domainColour("timing"), "var(--k-tim)");
  assert.equal(domainColour("studies", "var(--spf)"), "var(--spf)");
  for (const r of Object.values(DOMAIN_ROLE)) assert.ok(["int", "tim", "itg", "orb", "nav"].includes(r));
  // the catalogue's areas are all known here or deliberately left to the catalogue
  const cat = readFileSync(join(here, "..", "..", "..", "web", "studio", "lib", "catalog.mjs"), "utf8");
  const ids = [...cat.matchAll(/\{ id: "([a-z-]+)", get label\(\)/g)].map((m) => m[1]);
  assert.ok(ids.length >= 10);
  for (const id of ids) assert.ok(domainRole(id) || ["campaigns", "studies"].includes(id), `area ${id} has no role`);
  assert.equal(evidenceVar("VALIDATED"), "var(--k-ev-validated)"); assert.equal(evidenceVar("modelled"), "var(--k-ev-modelled)"); assert.equal(evidenceVar("x"), null);
  assert.equal(constellationVar("Galileo"), "var(--k-sat-gal)"); assert.equal(constellationVar("E"), "var(--k-sat-gal)"); assert.equal(constellationVar("NavIC"), "var(--k-sat-navic)"); assert.equal(constellationVar("?"), null);
});
await test("trustColour: green at 1, amber at the middle, red at 0, clamped, blended between", () => {
  for (const t of ["dark", "light"]) {
    const T = THEMES[t].trust;
    assert.equal(trustColour(1, t), T.good); assert.equal(trustColour(TRUST_MID, t), T.mid); assert.equal(trustColour(0, t), T.bad);
    assert.equal(trustColour(7, t), T.good); assert.equal(trustColour(-1, t), T.bad);
    assert.equal(trustColour(NaN, t), THEMES[t].ink["ink-3"]); assert.equal(trustColour(undefined, t), THEMES[t].ink["ink-3"]);
    const mid = trustColour(0.2, t);
    assert.match(mid, HEX);
    assert.ok(deltaE(mid, T.bad, "normal") > 3 && deltaE(mid, T.mid, "normal") > 3, "a blend lies between its stops");
    // monotonic: as trust rises the colour moves away from red
    let last = -1;
    for (let x = 0; x <= 1.0001; x += 0.05) { const d = deltaE(trustColour(x, t), T.bad, "normal"); assert.ok(d >= last - 1.5, `${t} at ${x.toFixed(2)}`); last = d; }
  }
  assert.equal(trustColour(1), THEMES.dark.trust.good, "dark is the default");
  assert.deepEqual([trustBand(0.9), trustBand(0.5), trustBand(0.18), trustBand(null)], ["good", "mid", "bad", ""]);
});

// ---- symbols
await test("the symbol set: the twelve of the brief, each drawn in currentColor on a 24 grid", () => {
  assert.deepEqual(SYMBOL_IDS, ["gnss", "leo", "station", "receiver", "clock", "ship", "aircraft", "jammer", "spoofer", "track", "reported", "alarm"]);
  for (const id of SYMBOL_IDS) {
    const s = SYMBOLS[id];
    assert.ok(s.label && s.parts.length, id);
    for (const p of s.parts) {
      const a = partAttrs(p);
      assert.ok(a.fill === "currentColor" || a.fill === "none", `${id} fill`);
      assert.ok(a.stroke === "currentColor" || a.stroke === "none", `${id} stroke`);
      if (a.stroke === "currentColor") assert.ok(Number(a["stroke-width"]) >= 1.4, `${id}: a stroke under 1.4 units is under 1 px at 16 px`);
      for (const num of p.d.match(/-?\d*\.?\d+/g)) assert.ok(Math.abs(Number(num)) <= 24, `${id}: ${num} off the grid`);
    }
    const svg = symbolMarkup(id);
    assert.match(svg, /viewBox="0 0 24 24"/); assert.match(svg, /width="16"/); assert.match(svg, /aria-hidden="true"/);
    assert.ok(!/#[0-9a-f]{3,6}\b|rgb\(/i.test(svg), `${id}: no fixed colour`);
  }
  assert.match(symbolMarkup("ship", { title: "Ship <A>" }), /role="img" aria-label="Ship &lt;A&gt;"><title>Ship &lt;A&gt;<\/title>/);
  assert.equal(symbolMarkup("nope"), "");
  assert.equal((spriteMarkup().match(/<symbol id="k-sym-/g) || []).length, 12);
  // the two-tone parts are dashed too, so they read in one colour
  for (const id of ["track", "reported"]) assert.ok(SYMBOLS[id].parts.some((p) => p.tone === 2 && p.dash), id);
  assert.equal(domainSymbol("timing"), "clock"); assert.equal(domainSymbol("spoofing"), "spoofer"); assert.equal(domainSymbol("studies"), null); assert.equal(domainSymbol("constructor"), null);
  for (const v of Object.values(DOMAIN_SYMBOL)) assert.ok(isSymbol(v));
  assert.ok(!isSymbol("home") && !isSymbol("__proto__"));
});

// ---- numbers
await test("numbers: significant digits, a true minus, groups from 10 000", () => {
  assert.equal(fmtNumber(14.2137), "14.21"); assert.equal(fmtNumber(-3.5), "−3.5"); assert.equal(fmtNumber(0), "0");
  assert.equal(fmtNumber(2610), "2610"); assert.equal(fmtNumber(123456.7), "123,457"); assert.equal(fmtNumber(1e-8), "1e-8"); assert.equal(fmtNumber(NaN), "–");
  assert.equal(fmtCount(1248), "1,248"); assert.equal(fmtCount(7), "7");
});
await test("values with units and uncertainty", () => {
  assert.equal(fmtValue(14.21, "m", { u: 0.43 }).text, "14.2 ± 0.4 m");
  assert.deepEqual(fmtValue(14.21, "m", { u: 0.43 }), { value: "14.2", pm: "± 0.4", unit: "m", text: "14.2 ± 0.4 m" });
  assert.equal(fmtValue(41.8, "dB").text, "41.8 dB");
  assert.equal(fmtValue(9.96, "m", { u: 0.97 }).text, "10 ± 1 m");
  assert.equal(fmtValue(3.14159, "m", { u: 0.0123 }).text, "3.142 ± 0.012 m", "two digits when the uncertainty starts with 1 or 2");
  assert.equal(fmtValue(1575.42e6, "Hz").text, "1.575 GHz");
  assert.equal(fmtValue(2500, "m").text, "2.5 km");
  assert.equal(fmtValue(0.004, "m").text, "4 mm");
  assert.equal(fmtValue(-3.2e-9, "s").text, "−3.2 ns");
  assert.equal(fmtValue(2610, "s").text, "2610 s", "long times are not kiloseconds");
  assert.equal(fmtValue(99.8, "%").text, "99.8 %");
  assert.equal(fmtValue(12, "m", { si: false, u: 2 }).text, "12.0 ± 2.0 m");
  assert.equal(fmtValue(undefined, "m").text, "–");
  assert.deepEqual(roundUncertainty(0.043), { u: 0.04, dp: 2 }); assert.equal(roundUncertainty(0), null);
  assert.deepEqual(siScale(5e-6, "s"), { factor: 1e-6, unit: "µs" }); assert.deepEqual(siScale(5e-7, "s"), { factor: 1e-9, unit: "ns" }); assert.deepEqual(siScale(5, "dB"), { factor: 1, unit: "dB" });
});
await test("times in UTC and durations", () => {
  const at = Date.UTC(2026, 10, 13, 14, 21, 7, 250);
  assert.equal(fmtUtc(at), "14:21:07.250 UTC");
  assert.equal(fmtUtc(new Date(at), { ms: false }), "14:21:07 UTC");
  assert.equal(fmtUtc(at, { date: true }), "2026-11-13 14:21:07.250 UTC");
  assert.equal(fmtUtc("not a time"), "–");
  assert.equal(fmtDuration(3 * 3600 + 12 * 60 + 5), "3 h 12 m");
  assert.equal(fmtDuration(2 * 86400 + 4 * 3600 + 7), "2 d 4 h");
  assert.equal(fmtDuration(247), "4 m 07 s");
  assert.equal(fmtDuration(3600), "1 h");
  assert.equal(fmtDuration(42.13), "42.1 s");
  assert.equal(fmtDuration(0.25), "250 ms");
  assert.equal(fmtDuration(12e-6), "12 µs");
  assert.equal(fmtDuration(-90), "−1 m 30 s");
  assert.equal(fmtDuration(0), "0 s");
});
await test("figures the Studio already wrote are split into number and unit", () => {
  assert.deepEqual(splitFigure("2610 s"), { value: "2610", unit: "s", numeric: true });
  assert.deepEqual(splitFigure("12.4 / 18.0", "m"), { value: "12.4 / 18.0", unit: "m", numeric: true });
  assert.deepEqual(splitFigure("-4.5", "dB"), { value: "−4.5", unit: "dB", numeric: true });
  assert.deepEqual(splitFigure("none"), { value: "none", unit: "", numeric: false });
});

// ---- density
await test("density: comfortable unless compact was stored; storage that throws is no storage", () => {
  const mem = () => { const m = new Map(); return { getItem: (k) => (m.has(k) ? m.get(k) : null), setItem: (k, v) => m.set(k, String(v)), m }; };
  const s = mem();
  assert.equal(readDensity(s), "comfortable");
  assert.ok(writeDensity(s, "compact"));
  assert.equal(s.m.get(DENSITY_KEY), "compact");
  assert.equal(readDensity(s), "compact");
  writeDensity(s, "huge");
  assert.equal(readDensity(s), "comfortable");
  const broken = { getItem() { throw new Error("denied"); }, setItem() { throw new Error("denied"); } };
  assert.equal(readDensity(broken), "comfortable");
  assert.equal(writeDensity(broken, "compact"), false);
  assert.equal(readDensity(null), "comfortable");
  assert.equal(otherDensity("compact"), "comfortable"); assert.equal(otherDensity("comfortable"), "compact");
  const boot = readFileSync(join(here, "boot.js"), "utf8");
  assert.match(boot, new RegExp(`localStorage\\.getItem\\("${DENSITY_KEY}"\\)`), "boot.js reads the same key before the first paint");
  const css = readFileSync(join(here, "look.css"), "utf8");
  assert.match(css, /:root\[data-density="compact"\]\{--d-text:12px; --d-row:24px/);
  assert.match(css, /--d-text:13px; --d-row:32px/);
  const html = readFileSync(join(here, "index.html"), "utf8");
  assert.ok(html.indexOf('href="look.css"') > html.indexOf('href="shell.css"'), "look.css loads after shell.css");
});
await test("the shell uses the look: roles, symbols, numbers and the density switch", () => {
  const shell = readFileSync(join(here, "shell.js"), "utf8");
  assert.match(shell, /domainColour\(id,/);
  assert.match(shell, /isSymbol\(name\)/, "ic() draws a symbol by name, so extensions get them through KshanaShell.icon too");
  assert.match(shell, /id: "density"/);
  assert.match(shell, /id: "btn-density"/);
  for (const f of ["numNode(", "fmtUtc(", "fmtDuration("]) assert.ok(shell.includes(f), f);
});
console.log(`OK: ${n} desktop look tests`);
