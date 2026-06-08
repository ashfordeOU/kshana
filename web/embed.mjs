// SPDX-License-Identifier: Apache-2.0
// Embed / iframe (LMS) mode — pure URL + visibility logic. A page loaded with
// `?embed=1` hides its marketing chrome (topbar, footer, hero, capabilities,
// validation) and shows only the playground, optionally pre-loading a scenario,
// applying knob overrides, and selecting a tab — e.g.
//   ?embed=1&scenario=integrity-raim.toml&seed=7&tab=fom
// The whole thing gates on ?embed=1, so the default (non-embed) behaviour is
// untouched. Because the WebAssembly engine runs entirely client-side, the
// embedded iframe is self-contained: no server dependency, nothing uploaded.
// Pure logic, unit-tested; the class application + auto-load live in app.js.

// Known scalar knob keys that may be overridden via the query string. Restricting
// to this set keeps an embed link from injecting arbitrary keys, and each value
// is parsed as a number (non-numeric values are dropped, never NaN-injected).
const KNOB_KEYS = ["seed", "threshold_ns", "mask_deg", "step_s", "duration_s"];

/// True iff the query string contains `embed=1`.
export function isEmbed(search) {
  if (!search) return false;
  return new URLSearchParams(search).get("embed") === "1";
}

/// Parse an embed query string into a config:
///   { scenario, knobs:{<key>:<number>...}, hideChrome:true, tab }
/// `scenario` and `tab` are undefined when absent; `knobs` only carries the
/// recognised, numeric overrides. `hideChrome` is always true in embed mode.
export function embedConfig(search) {
  const p = new URLSearchParams(search || "");
  const knobs = {};
  for (const key of KNOB_KEYS) {
    if (!p.has(key)) continue;
    const v = parseFloat(p.get(key));
    if (Number.isFinite(v)) knobs[key] = v;
  }
  return {
    scenario: p.get("scenario") || undefined,
    tab: p.get("tab") || undefined,
    knobs,
    hideChrome: true,
  };
}

/// The body classes to add for an embed config. `["embed"]` when chrome should be
/// hidden (CSS then hides the topbar/footer/hero/other sections), else `[]`.
export function embedClassList(cfg) {
  return cfg && cfg.hideChrome ? ["embed"] : [];
}
