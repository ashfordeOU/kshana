// SPDX-License-Identifier: AGPL-3.0-only
// The Studio's address is its state, so Back and Forward work and every screen can be linked.
//   (nothing)                 the opening screen
//   ?domain=<id>              one area's scenarios
//   ?browse=1[&q=<words>]     every scenario, optionally searched
//   ?scenario=<name>[&tab=]   a task screen (the site's existing deep links; .toml optional)
// Other parameters the Studio understands (play, view, field, frame, embed, engine, theme, seed)
// are kept as they are. Pure; tested in urlstate.test.mjs.

const SCREEN_KEYS = ["scenario", "tab", "domain", "browse", "q", "start"];

// Old names of views still open the matching panel.
const TAB_ALIAS = { fom: "overview", figures: "overview", chart: "timeseries", "engine-chart": "timeseries", export: "exports", animations: "animation" };
export const tabFromLink = (tab) => (tab && TAB_ALIAS[tab] ? TAB_ALIAS[tab] : tab || null);

// A scenario named with or without its .toml extension (site links omit it).
export const scenarioFile = (name) => (!name ? null : /\.toml$/.test(name) ? name : `${name}.toml`);
export const scenarioName = (file) => String(file || "").replace(/\.toml$/, "");

// Parse a query string into { screen, scenario, tab, domain, q, extra }.
export function parseState(search) {
  const p = new URLSearchParams(search || "");
  const extra = {};
  for (const [k, v] of p) if (!SCREEN_KEYS.includes(k)) extra[k] = v;
  const scenario = scenarioFile(p.get("scenario"));
  if (scenario && p.get("start") !== "1") return { screen: "task", scenario, tab: tabFromLink(p.get("tab")), domain: null, q: "", extra };
  if (p.get("domain")) return { screen: "domain", scenario: null, tab: null, domain: p.get("domain"), q: "", extra };
  if (p.get("browse") === "1" || p.has("q")) return { screen: "browse", scenario: null, tab: null, domain: null, q: p.get("q") || "", extra };
  return { screen: "home", scenario: null, tab: null, domain: null, q: "", extra };
}

// Build a query string (with the leading "?", or "" for the opening screen) from a state.
// `keep` lists extra parameters carried over (for example embed or engine).
export function buildSearch(state, keep = {}) {
  const p = new URLSearchParams();
  if (state.screen === "task" && state.scenario) {
    p.set("scenario", scenarioName(state.scenario));
    if (state.tab) p.set("tab", state.tab);
  } else if (state.screen === "domain" && state.domain) p.set("domain", state.domain);
  else if (state.screen === "browse") { p.set("browse", "1"); if (state.q) p.set("q", state.q); }
  for (const [k, v] of Object.entries(keep)) if (v !== undefined && v !== null && v !== "") p.set(k, v);
  const s = p.toString();
  return s ? `?${s}` : "";
}

// Parameters worth carrying from one screen to the next (they describe how the Studio runs,
// not which screen is open).
export function persistentExtras(extra = {}) {
  const out = {};
  for (const k of ["embed", "engine", "theme"]) if (extra[k]) out[k] = extra[k];
  return out;
}

// Should moving from state a to state b add a history entry? A new screen or scenario does;
// switching views of the same scenario replaces the entry, so Back leaves the scenario.
export function isNewEntry(a, b) {
  if (!a) return true;
  if (a.screen !== b.screen) return true;
  if (a.screen === "task") return a.scenario !== b.scenario;
  if (a.screen === "domain") return a.domain !== b.domain;
  return false;
}

// ---------------------------------------------------------------- the two views of one Studio
// Simple (the default, index.html) and Advanced (the full dashboard, advanced/). A switch
// carries the scenario, the view of the result and, when the reader changed it, the scenario
// text itself (in the fragment, as a share link does), so the other view opens on the same run.
// Paths are relative to the Studio's own folder: "advanced/" and "./".
export const VIEW_KEY = "kshana-studio-view";
export function viewUrl(target, { scenario = null, tab = null, fragment = "", extra = {} } = {}) {
  const p = new URLSearchParams();
  if (scenario) p.set("scenario", scenarioName(scenario));
  if (tab) p.set("tab", tab);
  for (const k of ["embed", "engine", "theme"]) if (extra[k]) p.set(k, extra[k]);
  const q = p.toString();
  return `${target === "advanced" ? "advanced/" : "./"}${q ? "?" + q : ""}${fragment && fragment.startsWith("#") ? fragment : ""}`;
}
// Which view a Studio link should open. A link that names view=advanced (or view=simple) wins;
// a link that names a scenario (the site's deep links) opens Simple; the bare Studio address
// opens the view this browser last chose, and Simple when nothing (or something else) is stored.
export function chooseView(search, stored) {
  const p = new URLSearchParams(search || "");
  const v = p.get("view");
  if (v === "advanced" || v === "simple") return v;
  if (p.get("scenario")) return "simple";
  return stored === "advanced" ? "advanced" : "simple";
}
// The state a switch carries, read back from the link it made (for tests and the receiving view).
export function readSwitch(href) {
  const u = new URL(href, "https://kshana.dev/studio/");
  const p = u.searchParams;
  return { view: /\/advanced\/$/.test(u.pathname) ? "advanced" : "simple", scenario: scenarioFile(p.get("scenario")), tab: tabFromLink(p.get("tab")), fragment: u.hash || "" };
}
