// SPDX-License-Identifier: AGPL-3.0-only
// Tests of lib/course.mjs and data/course/lessons.json (0.42 U29): every lesson names a bundled
// scenario, every setting it asks to change is a setting of that scenario (with the value the
// lesson starts from on the other side of its checkpoint), and checkpoints follow the tab.
// Run: node --test apps/desktop/shell/lib/course.test.mjs
import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { checkLessons, checkStep, compare, valueAt, readProgress, fieldOf } from "./course.mjs";
import { numericFields, patchField } from "../../../../web/studio/lib/params.mjs";

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, "../../../..");
const doc = JSON.parse(readFileSync(join(here, "../data/course/lessons.json"), "utf8"));
const field = (toml, key) => fieldOf(numericFields(toml), key);

test("the lessons file is well formed, in English, and labelled as teaching material", () => {
  const r = checkLessons(doc);
  assert.deepEqual(r.errors, []);
  assert.equal(doc.format, "kshana-course/1");
  assert.match(doc.note, /not an assessment/);
  assert.ok(!/certif|complian|conform/i.test(JSON.stringify(doc)), "no claim of certification or compliance");
  assert.ok(r.lessons.length >= 4);
});

test("every lesson's scenario is bundled, and its settings exist with the checkpoint unmet at the start", () => {
  for (const l of doc.lessons) {
    const path = join(root, "scenarios", l.scenario);
    assert.ok(existsSync(path), `${l.id}: ${l.scenario}`);
    const toml = readFileSync(path, "utf8");
    for (const s of l.steps) {
      for (const key of [s.check && s.check.kind === "setting" ? s.check.key : null, s.try ? s.try.key : null].filter(Boolean)) {
        assert.ok(field(toml, key) !== undefined, `${l.id}: ${key} is a setting of ${l.scenario}`);
      }
      if (s.check && s.check.kind === "setting") {
        assert.equal(compare(field(toml, s.check.key), s.check.op, s.check.value), false, `${l.id}: the bundled value does not already pass "${s.title}"`);
        if (s.try) {
          const f = numericFields(toml).find((x) => x.id === s.try.key);
          const changed = patchField(toml, f, s.try.value);
          assert.equal(compare(field(changed, s.check.key), s.check.op, s.check.value), true, `${l.id}: the suggested value passes "${s.title}"`);
        }
      }
    }
  }
  assert.ok(!checkLessons(doc, { scenarios: ["other.toml"] }).ok, "an unknown scenario is refused");
  // the window checks the lessons against the Studio's scenario catalogue
  const catalog = readFileSync(join(root, "web/studio/lib/catalog.mjs"), "utf8");
  for (const l of doc.lessons) assert.ok(catalog.includes(`row("${l.scenario}"`), `${l.scenario} is in the catalogue`);
});

test("checkpoints follow the tab: a run, the view, the setting used, a figure that changed from the first run", () => {
  const steps = doc.lessons[0].steps;
  const toml = readFileSync(join(root, "scenarios", "clock-holdover.toml"), "utf8");
  const first = { toml, result: { classical: { fom: { holdover_s: 2610 } } } };
  const st = (run, view = "chart") => ({ run, view, base: first, field });
  assert.equal(checkStep(steps[0], st(null)).met, false);
  assert.equal(checkStep(steps[0], st(first)).met, true);
  assert.equal(checkStep(steps[1], st(first, "timeline")).met, true);
  assert.equal(checkStep(steps[2], st(first)).met, true);
  assert.equal(checkStep(steps[3], st(first)).met, false);
  const f = numericFields(toml).find((x) => x.id === "clock_classical::q_wf");
  const second = { toml: patchField(toml, f, 9e-21), result: { classical: { fom: { holdover_s: 6600 } } } };
  assert.equal(checkStep(steps[3], st(second)).met, true);
  assert.equal(checkStep(steps[4], st(first)).met, false, "the first run is not a change");
  const r = checkStep(steps[4], st(second));
  assert.deepEqual([r.met, r.value, r.base], [true, 6600, 2610]);
  assert.equal(checkStep({ text: "read" }, st(null)).met, true);
});

test("comparisons, paths and kept progress", () => {
  assert.equal(compare(3, "<", 4), true);
  assert.equal(compare("x", "<", 4), false);
  assert.equal(compare(1, "==", 1 + 1e-15), true);
  assert.equal(compare(2, "increased", 0, 1), true);
  assert.equal(compare(2, "increased", 0, undefined), false);
  assert.equal(compare(undefined, "present"), false);
  assert.equal(valueAt({ a: [{ b: 5 }] }, "a.0.b"), 5);
  assert.equal(valueAt({ a: 1 }, "a.b"), undefined);
  assert.deepEqual(readProgress('{"holdover":{"step":2,"done":false},"BAD":{"step":1},"x":{"step":-1}}'), { holdover: { step: 2, done: false } });
  assert.deepEqual(readProgress("not json"), {});
});
