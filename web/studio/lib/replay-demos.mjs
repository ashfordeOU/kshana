// SPDX-License-Identifier: AGPL-3.0-only
// The demos the Bridge replay opens, and how each becomes a panel from its files. `io` is given by the caller
// ({ json(path), text(path) }, paths relative to the Studio folder), so this module makes no request itself and
// runs the same in the page and in the tests. Synthetic data only; the files are written by tools_replay_data.mjs.
import { parseInstructorLog } from "./training.mjs";
import { buildRun } from "./trust.mjs";
import { panelFromTraining, trustDemoPanel, coastFor } from "./replay.mjs";
import { DEMO_PHASES } from "./trust-geometry-demo.mjs";

export const TRAINING_DEMOS = Object.freeze([
  ["open-sea-jamming", "Open-sea jamming"], ["coastal-drag-off", "Coastal drag-off"], ["port-approach-time-spoof", "Port-approach time spoof"],
  ["combined-event", "Combined event"], ["fjord-natural-degradation", "Fjord natural degradation"],
]);
// The Maritime trust demos: the stated events come from how the demo log was made (the drag-off from 1500 s is in
// the demo's session.toml header; the sky phases are lib/trust-geometry-demo.mjs DEMO_PHASES), not from the engine.
const DRAG = { label: "Position drag-off (stated by the demo)", onset: 1500, end: null };
export const TRUST_DEMOS = Object.freeze([
  { id: "tallinn-helsinki", title: "Ferry passage, position drag-off", events: [DRAG], result: "trust/demo/tallinn-helsinki.result.json", truth: "trust/demo/tallinn-helsinki.truth.csv",
    description: "A made-up ferry log, Tallinn to Helsinki, 1 Hz. From 1500 s a position drag-off pulls the reported position away while the receiver keeps reporting a valid fix." },
  { id: "masked-sky", title: "Ferry passage, half the sky masked", result: "trust/demo/masked-sky.result.json", truth: "trust/demo/tallinn-helsinki.truth.csv",
    events: [{ label: "Western half of the sky masked (stated)", onset: DEMO_PHASES[1].fromS, end: DEMO_PHASES[0].fromS }, { label: "Only azimuths below 130° kept (stated)", onset: DEMO_PHASES[0].fromS, end: DEMO_PHASES[0].toS }, { label: "Western half masked again (stated)", onset: DEMO_PHASES[0].toS, end: null }, DRAG],
    description: "The same ferry log with the western half of the sky silenced from 600 s, a narrower sky from 900 s to 1200 s, and the drag-off from 1500 s: one run with the sky, the signal and the position each failing in turn." },
]);
export const DEMO_LIST = Object.freeze([...TRAINING_DEMOS.map(([id, title]) => ({ id, title, kind: "training" })), ...TRUST_DEMOS.map((d) => ({ id: d.id, title: d.title, kind: "trust" }))]);
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
    const panel = panelFromTraining({ id, title: train[1], log: parsed.log, run: built.run, aux, source: `Synthetic scenario ${id}: the engine's nmea_training stream and instructor log, scored by its receiver-trust.` });
    panel.region = coastFor(panel, coast, world);
    return panel;
  }
  const d = TRUST_DEMOS.find((x) => x.id === id);
  if (!d) throw new Error(`no demo named ${id}`);
  return trustDemoPanel({ id, title: d.title, result: await io.json(d.result), truthText: await io.text(d.truth), aux, events: d.events, coast, world, description: d.description,
    source: `Synthetic log ${id}: made-up NMEA, scored by the engine's receiver-trust.` });
}
