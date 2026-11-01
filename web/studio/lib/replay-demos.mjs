// SPDX-License-Identifier: AGPL-3.0-only
// The demos the Bridge replay opens, and how each becomes a panel from its files. `io` is given by the caller
// ({ json(path), text(path) }, paths relative to the Studio folder), so this module makes no request itself and
// runs the same in the page and in the tests. Synthetic data only; the files are written by tools_replay_data.mjs.
import { parseInstructorLog } from "./training.mjs";
import { buildRun } from "./trust.mjs";
import { panelFromTraining, trustDemoPanel, coastFor } from "./replay.mjs";
import { DEMO_PHASES } from "./trust-geometry-demo.mjs";
import { t } from "./t.mjs";

// A [id, title] pair whose title is looked up when it is read, so it follows the language chosen after this module loaded.
const pair = (id, title) => { const p = [id, undefined]; Object.defineProperty(p, 1, { get: title, enumerable: true }); return p; };
export const TRAINING_DEMOS = Object.freeze([
  pair("open-sea-jamming", () => t("js-lib-replay-demos-open-sea-jamming", "Open-sea jamming")), pair("coastal-drag-off", () => t("js-lib-replay-demos-coastal-drag-off", "Coastal drag-off")),
  pair("port-approach-time-spoof", () => t("js-lib-replay-demos-port-approach", "Port-approach time spoof")),
  pair("combined-event", () => t("js-lib-replay-demos-combined-event", "Combined event")), pair("fjord-natural-degradation", () => t("js-lib-replay-demos-fjord", "Fjord natural degradation")),
]);
// The Maritime trust demos: the stated events come from how the demo log was made (the drag-off from 1500 s is in
// the demo's session.toml header; the sky phases are lib/trust-geometry-demo.mjs DEMO_PHASES), not from the engine.
const DRAG = { get label() { return t("js-lib-replay-demos-drag-off-stated", "Position drag-off (stated by the demo)"); }, onset: 1500, end: null };
export const TRUST_DEMOS = Object.freeze([
  { id: "tallinn-helsinki", get title() { return t("js-lib-replay-demos-ferry-drag-off", "Ferry passage, position drag-off"); }, events: [DRAG], result: "trust/demo/tallinn-helsinki.result.json", truth: "trust/demo/tallinn-helsinki.truth.csv",
    get description() { return t("js-lib-replay-demos-ferry-drag-off-description", "A made-up ferry log, Tallinn to Helsinki, 1 Hz. From 1500 s a position drag-off pulls the reported position away while the receiver keeps reporting a valid fix."); } },
  { id: "masked-sky", get title() { return t("js-lib-replay-demos-masked-sky", "Ferry passage, half the sky masked"); }, result: "trust/demo/masked-sky.result.json", truth: "trust/demo/tallinn-helsinki.truth.csv",
    events: [{ get label() { return t("js-lib-replay-demos-west-masked", "Western half of the sky masked (stated)"); }, onset: DEMO_PHASES[1].fromS, end: DEMO_PHASES[0].fromS }, { get label() { return t("js-lib-replay-demos-below-130", "Only azimuths below 130° kept (stated)"); }, onset: DEMO_PHASES[0].fromS, end: DEMO_PHASES[0].toS }, { get label() { return t("js-lib-replay-demos-west-masked-again", "Western half masked again (stated)"); }, onset: DEMO_PHASES[0].toS, end: null }, DRAG],
    get description() { return t("js-lib-replay-demos-masked-sky-description", "The same ferry log with the western half of the sky silenced from 600 s, a narrower sky from 900 s to 1200 s, and the drag-off from 1500 s: one run with the sky, the signal and the position each failing in turn."); } },
]);
export const DEMO_LIST = Object.freeze([...TRAINING_DEMOS.map(([id], i) => ({ id, get title() { return TRAINING_DEMOS[i][1]; }, kind: "training" })), ...TRUST_DEMOS.map((d) => ({ id: d.id, get title() { return d.title; }, kind: "trust" }))]);
export const DEFAULT_PAIR = Object.freeze(["fjord-natural-degradation", "coastal-drag-off"]);

// One demo -> a panel. Throws an Error naming the file when something does not load or parse.
export async function loadDemo(id, io, coast = null, world = []) {
  const aux = await io.json(`replay/data/${id}.aux.json`);
  const train = TRAINING_DEMOS.find(([n]) => n === id);
  if (train) {
    const parsed = parseInstructorLog(await io.text(`training/demo/${id}.instructor.json`), `${id}.instructor.json`);
    if (parsed.error) throw new Error(parsed.error);
    const built = buildRun({ result: await io.json(`replay/data/${id}.trust.json`), demo: true });
    if (built.error) throw new Error(`${id}: ${built.error}`);
    const panel = panelFromTraining({ id, title: train[1], log: parsed.log, run: built.run, aux, source: t("js-lib-replay-demos-source-training", "Synthetic scenario { $id }: the engine's nmea_training stream and instructor log, scored by its receiver-trust.", { id }) });
    panel.region = coastFor(panel, coast, world);
    return panel;
  }
  const d = TRUST_DEMOS.find((x) => x.id === id);
  if (!d) throw new Error(`no demo named ${id}`);
  return trustDemoPanel({ id, title: d.title, result: await io.json(d.result), truthText: await io.text(d.truth), aux, events: d.events, coast, world, description: d.description,
    source: t("js-lib-replay-demos-source-trust", "Synthetic log { $id }: made-up NMEA, scored by the engine's receiver-trust.", { id }) });
}
