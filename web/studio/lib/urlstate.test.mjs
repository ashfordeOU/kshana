// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the URL state (urlstate.mjs). Run with `node lib/urlstate.test.mjs`.
import assert from "node:assert/strict";
import { parseState, buildSearch, isNewEntry, tabFromLink, scenarioFile, persistentExtras } from "./urlstate.mjs";

// The site's deep links: scenario with or without .toml, and a view.
{
  const s = parseState("?scenario=integrity-raim&tab=overview");
  assert.deepEqual([s.screen, s.scenario, s.tab], ["task", "integrity-raim.toml", "overview"]);
  const w = parseState("?scenario=l-band-waterfall-jamming&tab=spectrum&play=1");
  assert.equal(w.extra.play, "1");
  assert.equal(parseState("?scenario=clock-holdover.toml&tab=export").tab, "exports", "old view names still open");
}
assert.equal(parseState("").screen, "home");
assert.equal(parseState("?start=1").screen, "home");
assert.equal(parseState("?domain=timing").domain, "timing");
assert.deepEqual([parseState("?browse=1&q=orbit").screen, parseState("?browse=1&q=orbit").q], ["browse", "orbit"]);
assert.equal(parseState("?q=lunar").screen, "browse");
// Round trips.
for (const q of ["?scenario=integrity-raim&tab=timeseries", "?domain=timing", "?browse=1&q=coverage", ""]) assert.equal(buildSearch(parseState(q)), q);
assert.equal(buildSearch({ screen: "task", scenario: "clock-holdover.toml", tab: null }, { embed: "1" }), "?scenario=clock-holdover&embed=1");
assert.deepEqual(persistentExtras({ play: "1", engine: "recorded", embed: "1" }), { engine: "recorded", embed: "1" });
// History: a new screen or scenario is a new entry; a different view of the same scenario is not.
const a = parseState("?scenario=integrity-raim&tab=overview"), b = parseState("?scenario=integrity-raim&tab=timeseries");
assert.equal(isNewEntry(a, b), false);
assert.equal(isNewEntry(a, parseState("?scenario=clock-holdover")), true);
assert.equal(isNewEntry(parseState(""), a), true);
assert.equal(tabFromLink(null), null);
assert.equal(scenarioFile("x"), "x.toml");
console.log("urlstate.test.mjs: ok");
// ---------------------------------------------------------------- Simple <-> Advanced round trip
import { viewUrl, chooseView, readSwitch } from "./urlstate.mjs";
import { encodeFragment, decodeFragment } from "./share.mjs";
{
  const toml = 'kind = "integrity"\nal_h_m = 43.0   # edited\n';
  const frag = encodeFragment(toml);
  // Simple -> Advanced: scenario, view and the edited text all arrive.
  const toAdv = viewUrl("advanced", { scenario: "integrity-raim.toml", tab: "timeseries", fragment: frag });
  assert.ok(toAdv.startsWith("advanced/?scenario=integrity-raim&tab=timeseries#"), toAdv);
  const a = readSwitch("https://x.test/studio/" + toAdv);
  assert.deepEqual([a.view, a.scenario, a.tab], ["advanced", "integrity-raim.toml", "timeseries"]);
  assert.equal(decodeFragment(a.fragment), toml);
  // Advanced -> Simple, and back again: nothing is lost on the way.
  const toSimple = viewUrl("simple", { scenario: a.scenario, tab: a.tab, fragment: a.fragment });
  const s = readSwitch("https://x.test/studio/" + toSimple);
  assert.deepEqual([s.view, s.scenario, s.tab, decodeFragment(s.fragment)], ["simple", "integrity-raim.toml", "timeseries", toml]);
  assert.deepEqual(parseState(new URL("https://x.test/studio/" + toSimple).search).scenario, "integrity-raim.toml");
  const again = readSwitch("https://x.test/studio/" + viewUrl("advanced", { scenario: s.scenario, tab: s.tab, fragment: s.fragment }));
  assert.deepEqual(again, a);
  // No edit: no fragment. No scenario: the bare view.
  assert.equal(viewUrl("advanced", { scenario: "clock-holdover.toml" }), "advanced/?scenario=clock-holdover");
  assert.equal(viewUrl("simple", {}), "./");
  assert.equal(viewUrl("advanced", { scenario: "x", extra: { theme: "dark", play: "1" } }), "advanced/?scenario=x&theme=dark");
  // Which view opens.
  assert.equal(chooseView("?scenario=integrity-raim&tab=overview", "advanced"), "simple", "site deep links open Simple");
  assert.equal(chooseView("?scenario=integrity-raim&view=advanced", null), "advanced");
  assert.equal(chooseView("", "advanced"), "advanced", "the bare address opens the remembered view");
  assert.equal(chooseView("", null), "simple");
  assert.equal(chooseView("", "garbage"), "simple");
  assert.equal(chooseView("?view=simple", "advanced"), "simple");
}
console.log("urlstate.test.mjs: switch round trip ok");
