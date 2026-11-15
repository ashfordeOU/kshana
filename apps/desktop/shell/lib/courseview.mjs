// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: course mode pages (0.42 U29), on lib/course.mjs and
// data/course/lessons.json. The Course page lists the lessons with their progress; a lesson opens
// its bundled scenario in a tab with the lesson's panel above the result: the step's text, the
// setting to try (with its value field), and whether the step's checkpoint is met by the tab's
// own runs. Every text is set through textContent.
import { h } from "./dom.mjs";
import { checkStep } from "./course.mjs";

/**
 * The Course page. ctx: { t, lessons (the lessons file, or null while loading, or { error }),
 * progress ({ id: { step, done } }), start(lesson), active (the lesson in progress, or null) }.
 */
export function courseView(ctx) {
  const { t } = ctx;
  const page = h("section", { class: "page", "aria-labelledby": "co-h" },
    h("h1", { id: "co-h", text: t("js-desk-co-title", "Course") }),
    h("p", { class: "lede", text: t("js-desk-co-lede", "Guided lessons over the bundled scenarios: each step says what to run, where to look and what to change, and checks it in your own runs. The lessons explain the engine's models; they are teaching material, not an assessment or a qualification.") }));
  const doc = ctx.lessons;
  if (!doc) { page.append(h("p", { class: "busy", role: "status" }, h("span", { class: "spin", "aria-hidden": "true" }), t("js-desk-co-loading", "Loading the lessons…"))); return page; }
  if (doc.error) { page.append(h("p", { class: "notice error", text: t("js-desk-co-failed", "The lessons could not be read: { $reason }", { reason: doc.error }) })); return page; }
  page.append(h("p", { class: "hint", text: t("js-desk-co-english", "The lessons are written in English.") }));
  page.append(h("div", { class: "grid" }, ...doc.lessons.map((l) => {
    const pr = ctx.progress[l.id];
    const state = pr && pr.done ? t("js-desk-co-done", "done") : pr ? t("js-desk-co-at", "step { $n } of { $total }", { n: pr.step + 1, total: l.steps.length }) : t("js-desk-co-new", "{ $n } steps, about { $min } min", { n: l.steps.length, min: l.minutes || 10 });
    return h("article", { class: "card co-card" },
      h("h3", { text: l.title }), h("p", { text: l.summary }),
      h("p", { class: "muted mono", text: `${l.scenario} · ${state}` }),
      h("button", { class: "btn primary", type: "button", onclick: () => ctx.start(l) }, pr && !pr.done ? t("js-desk-co-continue", "Continue") : t("js-desk-co-start", "Start")));
  })));
  page.append(h("h2", { text: t("js-desk-co-more", "Also in the course") }),
    h("ul", {},
      h("li", { text: t("js-desk-co-kits", "Paper reproduction kits: the paper's scenarios and figures (paper/ and paper-artifacts/ in the repository) are run from the command line; a guided kit in this window is not made yet.") }),
      h("li", { text: t("js-desk-co-assistant", "An assistant that answers questions about a lesson is planned; it is not in this build.") })));
  return page;
}

/**
 * The lesson panel above a lesson's tab. ctx: { t, lesson, at (the step index), tab, base (the
 * lesson's first run in this tab, or null), field(toml, key), fieldRaw(toml, key), go(step),
 * finish(), leave(), setField(key, value) }.
 */
export function lessonPanel(ctx) {
  const { t, lesson, tab } = ctx;
  const step = lesson.steps[ctx.at];
  const r = checkStep(step, { run: tab.run ? { result: tab.run.result, toml: tab.run.toml } : null, view: tab.view, base: ctx.base, field: ctx.field });
  const last = ctx.at === lesson.steps.length - 1;
  const box = h("section", { class: "lesson", "aria-label": t("js-desk-co-lesson", "Lesson: { $title }", { title: lesson.title }) },
    h("header", {}, h("span", { class: "kicker", text: t("js-desk-co-step", "Lesson · step { $n } of { $total }", { n: ctx.at + 1, total: lesson.steps.length }) }),
      h("strong", { text: step.title || lesson.title }),
      h("button", { class: "linkish", type: "button", onclick: ctx.leave }, t("js-desk-co-leave", "Leave the lesson"))),
    h("p", { text: step.text }));
  if (step.try) {
    const cur = ctx.fieldRaw(tab.toml, step.try.key);
    const id = `co-try-${tab.id}`;
    const input = h("input", { class: "input mono", id, type: "text", inputmode: "decimal", spellcheck: "false", value: cur === undefined ? "" : String(cur) });
    input.addEventListener("change", () => { const v = Number(input.value.trim()); if (input.value.trim() && Number.isFinite(v)) ctx.setField(step.try.key, v); });
    const [section, key] = step.try.key.split("::");
    box.append(h("div", { class: "lesson-try" },
      h("label", { for: id }, t("js-desk-co-try", "Try changing"), " ", h("code", { text: section ? `[${section}] ${key}` : key })), input,
      h("button", { class: "btn", type: "button", onclick: () => ctx.setField(step.try.key, step.try.value) }, t("js-desk-co-try-set", "Set it to { $v } and run", { v: String(step.try.value) })),
      step.try.why ? h("p", { class: "hint", text: step.try.why }) : null));
  }
  const met = r.met;
  const shown = (v) => (typeof v === "number" ? String(+v.toPrecision(6)) : v === undefined ? "–" : String(v));
  const detail = r.value !== undefined && r.base !== undefined && step.check && /increased|decreased|changed/.test(step.check.op || "") ? t("js-desk-co-compare", "first run { $a } → this run { $b }", { a: shown(r.base), b: shown(r.value) }) : r.value !== undefined ? t("js-desk-co-value", "value { $v }", { v: shown(r.value) }) : "";
  box.append(h("div", { class: "lesson-foot" },
    h("span", { class: `lesson-check ${met ? "ok" : ""}`, role: "status" }, met ? t("js-desk-co-met", "✓ Done") : step.check ? t("js-desk-co-wait", "Waiting for this step") : "", detail ? h("span", { class: "muted", text: ` · ${detail}` }) : null),
    h("div", { class: "grow" }),
    ctx.at > 0 ? h("button", { class: "btn", type: "button", onclick: () => ctx.go(ctx.at - 1) }, t("js-desk-co-back", "Back")) : null,
    last ? h("button", { class: "btn primary", type: "button", disabled: met ? null : true, onclick: ctx.finish }, t("js-desk-co-finish", "Finish the lesson"))
      : h("button", { class: met ? "btn primary" : "btn", type: "button", onclick: () => ctx.go(ctx.at + 1) }, met ? t("js-desk-co-next", "Next") : t("js-desk-co-skip", "Skip this step"))));
  return box;
}
