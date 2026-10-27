#!/usr/bin/env node
// Wraps the engine's result of a mission-thread scenario as the Studio's recorded run (recorded/<name>.json), like the other recorded results.
//   node tools_mission_thread.mjs --result <scenario.result.json> --scenario mission-thread-artemis-class --engine-commit <40 hex> [--engine-version 0.40.0]
// The result is produced by `kshana scenarios/mission-thread-artemis-class.toml` (it writes <name>.result.json) from the engine checkout named by
// --engine-commit; the recorded run is stamped with that commit so a re-record at a newer engine is visible.
import { readFileSync, writeFileSync } from "node:fs";
const a = process.argv.slice(2); const opt = {};
for (let i = 0; i < a.length; i += 2) opt[a[i].replace(/^--/, "")] = a[i + 1];
if (!opt.result || !opt.scenario || !/^[0-9a-f]{40}$/.test(opt["engine-commit"] || "")) { console.error("usage: tools_mission_thread.mjs --result F --scenario NAME --engine-commit <40 hex> [--engine-version X.Y.Z]"); process.exit(2); }
const json = readFileSync(opt.result, "utf8");
const r = JSON.parse(json);
if (r.schema !== "kshana-mission-thread/1") { console.error("not a mission-thread result"); process.exit(1); }
const w = r.weakest_link || {};
const summary = `mission-thread | ${r.phases.length} phases | ${r.title} | weakest link ${w.phase_id} | ${r.label && r.label.tier}`;
writeFileSync(`recorded/${opt.scenario}.json`, JSON.stringify({ file: `${opt.scenario}.toml`, engine_version: opt["engine-version"] || "", engine_commit: opt["engine-commit"], summary, json: JSON.stringify(r) }));
console.log(`recorded/${opt.scenario}.json: ${r.phases.length} phases, ${r.timeline.length} timeline samples`);
