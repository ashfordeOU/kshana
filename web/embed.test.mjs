// SPDX-License-Identifier: Apache-2.0
// Tests for the embed/iframe (LMS) mode helpers — pure URL + visibility logic.
// isEmbed gates the whole feature on ?embed=1; embedConfig parses the scenario,
// knob overrides and target tab; embedClassList yields the body classes that hide
// the page chrome via CSS. The engine runs client-side, so an embedded iframe is
// self-contained (no server dependency, nothing uploaded). The non-embed path is
// unaffected. Run with `node web/embed.test.mjs`.
import { isEmbed, embedConfig, embedClassList } from "./embed.mjs";
import assert from "node:assert/strict";

// isEmbed: true only when ?embed=1 is present.
{
  assert.equal(isEmbed("?embed=1"), true, "embed=1 -> true");
  assert.equal(isEmbed("?embed=1&scenario=x.toml"), true, "embed=1 among params -> true");
  assert.equal(isEmbed("?scenario=x.toml"), false, "no embed -> false");
  assert.equal(isEmbed("?embed=0"), false, "embed=0 -> false");
  assert.equal(isEmbed(""), false, "empty search -> false");
  assert.equal(isEmbed(undefined), false, "undefined -> false");
}

// embedConfig: parse scenario, tab and numeric knob overrides.
{
  const cfg = embedConfig("?embed=1&scenario=integrity-raim.toml&seed=7&threshold_ns=15&tab=fom");
  assert.equal(cfg.scenario, "integrity-raim.toml", "scenario parsed");
  assert.equal(cfg.tab, "fom", "tab parsed");
  assert.equal(cfg.hideChrome, true, "hideChrome always true in embed");
  assert.equal(cfg.knobs.seed, 7, "seed override parsed as number");
  assert.equal(cfg.knobs.threshold_ns, 15, "threshold_ns override parsed as number");
}

// embedConfig: missing optional params come back undefined / empty, never throw.
{
  const cfg = embedConfig("?embed=1");
  assert.equal(cfg.scenario, undefined, "no scenario -> undefined");
  assert.equal(cfg.tab, undefined, "no tab -> undefined");
  assert.deepEqual(cfg.knobs, {}, "no knob overrides -> empty object");
  assert.equal(cfg.hideChrome, true, "hideChrome still true");
}

// embedConfig: a non-numeric knob value is ignored (not NaN-injected).
{
  const cfg = embedConfig("?embed=1&seed=abc");
  assert.ok(!("seed" in cfg.knobs), "non-numeric seed is dropped");
}

// embedClassList: returns the body classes that hide the chrome.
{
  assert.deepEqual(embedClassList({ hideChrome: true }), ["embed"], "hideChrome -> ['embed']");
  assert.deepEqual(embedClassList({ hideChrome: false }), [], "no hideChrome -> []");
  assert.deepEqual(embedClassList({}), [], "empty cfg -> []");
}

console.log("embed.test.mjs: all assertions passed");
