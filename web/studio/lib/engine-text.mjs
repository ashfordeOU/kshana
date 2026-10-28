// SPDX-License-Identifier: AGPL-3.0-only
// The engine's own text (a run's one-line summary and the chart it draws) in the reader's language.
//
// The WebAssembly engine embeds English only. For another language the page fetches i18n/<lang>/engine.ftl, registers it with the engine
// (register_catalogue(tag, ftl_text), through the engine client so the worker gets it) and asks for the text of a run in that language
// (run_human(toml, lang): the second run alone; the result document and the CSV stay the English run's, so numbers and tokens do not move).
// English never fetches a catalogue and never calls run_human: its run is the engine's native one, unchanged.
import { ready } from "./t.mjs";

/** Called once the engine client exists. Registers the current language's engine catalogue now and on every language change; never throws. */
export async function attachEngineText(client) {
  try {
    await ready();
    const l = globalThis.kshanaL10n;
    if (!l || typeof l.attachEngine !== "function" || !client || typeof client.register !== "function") return;
    await l.attachEngine((tag, text) => client.register(tag, text));
  } catch { /* the engine text stays English */ }
}

/** The language the engine's text should be in right now, or null for English (also when its catalogue could not be registered). */
export function engineLang(client) {
  const l = globalThis.kshanaL10n;
  return l && l.lang && l.lang !== "en" && !l.engineFallback && client && typeof client.register === "function" ? l.lang : null;
}

/** Put the run's summary and chart in the reader's language (live runs only: a recorded run has no engine to ask). Returns true when the run changed.
 *  The English text is kept on the run so a change back to English restores it. A failure leaves the English text. */
export async function localiseRun(client, run) {
  if (!run || run.mode !== "live") return false;
  const want = engineLang(client);
  if ((run.textLang || null) === want) return false;
  if (!run.en) run.en = { summary: run.summary, svg: run.svg };
  let next = run.en;
  if (want) {
    try {
      const h = await client.call("run_human", run.toml, want);
      if (h && typeof h.summary === "string" && typeof h.svg === "string") next = { summary: h.summary, svg: h.svg };
    } catch { next = run.en; }
  }
  if (engineLang(client) !== want) return false; // the language changed while the engine worked: the change's own call settles it
  run.summary = next.summary; run.svg = next.svg; run.textLang = want;
  return true;
}
