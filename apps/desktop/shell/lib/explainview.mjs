// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the "where does this number come from?" card (0.42 U11), drawn from
// lib/explain.mjs. Any number of a result (the result strip, the key figures, the table, the
// values at the cursor) opens it: the figure, the model and its method page, the engine's own
// words, the inputs (the engine's headline settings first), the assumptions the result states,
// the evidence tier and its ledger rows, the hashes; and on request a sensitivity, computed by
// running the scenario again with each top input moved by ±10 %. Every text is set through
// textContent.
import { h } from "./dom.mjs";
import { explainFigure, sensitivityPlan, sensitivityOf } from "./explain.mjs";
import { runPool } from "./sweepgrid.mjs";

const pyIndex = (path) => String(path).split(".").map((p) => { const m = /^([^[\]]*)((?:\[\d+\])*)$/.exec(p); return m ? `${m[1] ? `[${JSON.stringify(m[1])}]` : ""}${m[2]}` : `[${JSON.stringify(p)}]`; }).join("");

/**
 * ctx: { t, meta(run) (a promise of { kind, modules, importance, pages }), fields(toml), fmt(v),
 * runJson(toml) (a promise of the result object), concurrency(), log(entry), copy(text),
 * toast(msg), patch(toml, field, value), metric(result, path) }.
 */
export function createExplainer(ctx) {
  const { t } = ctx;
  let layer = null, back = null, current = null, cancelled = false;

  function close() {
    if (!layer) return;
    cancelled = true;
    layer.remove();
    layer = null; current = null;
    if (back && document.contains(back)) back.focus();
  }

  const section = (title, ...kids) => h("section", { class: "x-sec" }, h("h3", { text: title }), ...kids);
  const kv = (rows) => h("dl", { class: "kv" }, ...rows.filter(Boolean).flatMap(([k, v]) => [h("dt", { text: k }), h("dd", { text: v })]));

  async function open({ run, fig, state = null, tierHint = null }, anchor) {
    close();
    cancelled = false;
    back = anchor || document.activeElement;
    let meta = { modules: null, importance: null, pages: [] };
    try { meta = await ctx.meta(run); } catch { /* the explanation shows what the result itself says */ }
    const fields = ctx.fields(run.toml || "");
    const x = explainFigure(fig, { result: run.result, toml: run.toml, fields, kind: meta.kind || "", modules: meta.modules, importance: meta.importance, pages: meta.pages, state, tier: tierHint,
      run: { scenarioSha: run.scenarioSha, resultSha: run.resultSha, engineVersion: run.engineVersion, engine: run.engine } }, t);
    current = { run, x, fields };
    const valueText = typeof x.value === "number" ? `${ctx.fmt(x.value)}${x.unit ? ` ${x.unit}` : ""}` : `${x.text || x.value}${x.unit ? ` ${x.unit}` : ""}`;
    const close1 = h("button", { class: "btn x-close", type: "button", "aria-label": t("js-desk-x-close", "Close"), onclick: close }, "×");
    const head = h("header", { class: "x-head" }, h("div", {}, h("p", { class: "kicker", text: t("js-desk-x-kicker", "Where this number comes from") }), h("h2", { id: "x-title", text: x.label }), h("p", { class: "x-val", text: x.shown || valueText })), close1);
    const body = h("div", { class: "x-body" });
    // the figure
    body.append(section(t("js-desk-x-figure-h", "The figure"), kv([
      [t("js-desk-x-value", "value in the result"), valueText],
      [t("js-desk-x-path", "path in the result"), x.path ? `${x.path}${x.byValue ? ` (${t("js-desk-x-by-value", "found by its value")})` : ""}` : t("js-desk-x-no-path", "not stated: the window derived it")],
      x.provenance ? [t("js-desk-x-provenance", "provenance"), `${x.provenance.cls}: ${x.provenance.text}`] : [t("js-desk-x-provenance", "provenance"), t("js-desk-x-no-units", "the result has no units entry for it")],
      x.echo ? [t("js-desk-x-echo-k", "echo"), t("js-desk-x-echo", "this is one of your settings, given back")] : null,
    ])));
    // the model
    body.append(section(t("js-desk-x-model-h", "The model"), kv([
      [t("js-desk-x-kind", "scenario kind"), x.model.kind || t("js-desk-x-none", "not stated")],
      [t("js-desk-x-modules", "engine modules"), x.model.modules.length ? x.model.modules.map((m) => `src/${m}`).join(", ") : t("js-desk-x-none", "not stated")],
      [t("js-desk-x-method", "method page"), x.model.page || t("js-desk-x-no-page", "none for this kind")],
    ]), x.model.page ? h("div", { class: "row" }, h("button", { class: "btn fig-btn", type: "button", onclick: () => ctx.copy(x.model.page) }, t("js-desk-x-copy-page", "Copy the method page path"))) : null));
    // the engine's words
    const wordName = { definition: t("js-desk-x-w-definition", "definition"), state: t("js-desk-x-w-state", "pass or fail"), tier: t("js-desk-x-w-tier", "figure tier"), label: t("js-desk-x-w-label", "the result's label") };
    body.append(section(t("js-desk-x-words-h", "The engine's own words"), x.words.length ? kv(x.words.map((w) => [wordName[w.k] || w.k, w.text])) : h("p", { class: "hint", text: t("js-desk-x-no-words", "The engine wrote no definition or note for this figure.") })));
    // inputs
    const ins = x.inputs.length ? h("table", { class: "tbl x-ins" }, h("thead", {}, h("tr", {}, h("th", { scope: "col", text: t("js-desk-x-col-setting", "Setting") }), h("th", { scope: "col", class: "num", text: t("js-desk-x-col-value", "Value") }), h("th", { scope: "col", text: t("js-desk-x-col-note", "Note") }))),
      h("tbody", {}, ...x.inputs.map((f) => h("tr", {}, h("td", { class: "mono", text: `${f.section ? `[${f.section}] ` : ""}${f.key}` }), h("td", { class: "num mono", text: f.raw }), h("td", { text: [f.headline ? t("js-desk-x-headline", "ranked first by the engine") : "", f.echo ? t("js-desk-x-echoed", "echoed by this figure") : "", f.comment].filter(Boolean).join(" · ") }))))) : h("p", { class: "hint", text: t("js-desk-x-no-inputs", "The scenario has no single-number settings.") });
    const sensOut = h("div", { class: "x-sens", role: "status" });
    const sensBtn = h("button", { class: "btn", type: "button", disabled: typeof x.value === "number" && x.path && x.inputs.length ? null : true, onclick: () => sensitivity(sensBtn, sensOut) }, t("js-desk-x-sens", "Sensitivity: run again with each top setting ±10 %"));
    body.append(section(t("js-desk-x-inputs-h", "The inputs"), ins, h("div", { class: "row" }, sensBtn), sensOut));
    // assumptions
    if (x.caveats.length) body.append(section(t("js-desk-x-caveats-h", "Assumptions and limits the result states"), h("ul", { class: "x-list" }, ...x.caveats.map((c) => h("li", { text: c })))));
    // evidence
    body.append(section(t("js-desk-x-evidence-h", "Evidence"), kv([
      [t("js-desk-x-tier", "tier"), x.tier ? `${x.tier}${x.tierFrom === "figure" ? ` (${t("js-desk-x-tier-figure", "this figure's own")})` : x.tierFrom === "result" ? ` (${t("js-desk-x-tier-result", "the whole result's")})` : ""}` : t("js-desk-x-no-tier", "the result states no tier")],
      x.applicable ? null : [t("js-desk-x-applicable", "applicable"), t("js-desk-x-not-applicable", "the engine marks this figure not applicable to the run")],
    ]), x.evidence.rows.length ? h("ul", { class: "x-list" }, ...x.evidence.rows.map((r) => h("li", {}, h("b", { class: "mono", text: r.id }), ` ${r.status} · ${r.requirement}`))) : null,
    x.evidence.rows.length ? h("p", { class: "hint", text: t("js-desk-x-oracle", "The oracle of each row (the outside reference it is checked against, or why there is none) is in { $matrix } under the row's id.", { matrix: x.evidence.matrix || "docs/VERIFICATION-MATRIX.md" }) }) : null));
    // hashes
    body.append(section(t("js-desk-x-hashes-h", "Reproduce"), kv([
      [t("js-desk-x-engine", "engine"), `${x.hashes.engine || "?"}${x.hashes.where ? ` (${x.hashes.where})` : ""}`],
      x.hashes.scenario ? [t("js-desk-x-scenario-sha", "scenario SHA-256"), x.hashes.scenario] : null,
      x.hashes.result ? [t("js-desk-x-result-sha", "result SHA-256"), x.hashes.result] : null,
      x.hashes.seed !== null ? [t("js-desk-x-seed", "seed"), String(x.hashes.seed)] : null,
    ])));
    const card = h("div", { class: "x-card", role: "dialog", "aria-modal": "true", "aria-labelledby": "x-title" }, head, body);
    layer = h("div", { class: "palette-layer x-layer" }, card);
    layer.addEventListener("mousedown", (e) => { if (e.target === layer) close(); });
    layer.addEventListener("keydown", (e) => {
      if (e.key === "Escape") { e.preventDefault(); e.stopPropagation(); close(); return; }
      if (e.key === "Tab") { // keep the focus inside the card
        const f = [...card.querySelectorAll("button:not([disabled])")];
        if (!f.length) return;
        if (e.shiftKey && document.activeElement === f[0]) { e.preventDefault(); f[f.length - 1].focus(); }
        else if (!e.shiftKey && document.activeElement === f[f.length - 1]) { e.preventDefault(); f[0].focus(); }
      }
    });
    document.body.append(layer);
    close1.focus();
    if (run.console && x.path) ctx.log({ kind: "explain", title: t("js-desk-log-explain", "Explain { $path } of run { $n }", { path: x.path, n: run.console }), py: [`print(result_${run.console}${pyIndex(x.path)}, result_${run.console}.get("units", {}).get(${JSON.stringify(x.path.replace(/\[\d+\]/g, "[]"))}))`], cli: [] });
  }

  async function sensitivity(btn, out) {
    if (!current) return;
    const { run, x, fields } = current;
    const plan = sensitivityPlan(x.inputs, fields, { n: 4 });
    if (!plan.length) { out.textContent = t("js-desk-x-sens-none", "No setting to move: every top setting is zero or echoed by this figure."); return; }
    btn.disabled = true;
    out.replaceChildren(h("p", { class: "hint", text: t("js-desk-x-sens-running", "Running { $n } scenarios…", { n: plan.length * 2 }) }));
    const tasks = plan.flatMap((p) => [{ p, side: "lo" }, { p, side: "hi" }]);
    const got = new Map();
    await runPool(tasks, {
      concurrency: ctx.concurrency(),
      stopped: () => cancelled,
      run: (task) => ctx.runJson(ctx.patch(run.toml, task.p.field, task.p[task.side])),
      onDone: (task, result) => { got.set(`${task.p.id}:${task.side}`, result ? ctx.metric(result, x.path) : null); },
    });
    if (cancelled || !current || current.x !== x) return;
    const rows = plan.map((p) => ({ p, s: sensitivityOf(p.field.value, x.value, p.lo, got.get(`${p.id}:lo`), p.hi, got.get(`${p.id}:hi`)) }));
    out.replaceChildren(h("table", { class: "tbl" },
      h("thead", {}, h("tr", {}, h("th", { scope: "col", text: t("js-desk-x-col-setting", "Setting") }), h("th", { scope: "col", class: "num", text: "−10 %" }), h("th", { scope: "col", class: "num", text: "+10 %" }), h("th", { scope: "col", class: "num", text: t("js-desk-x-col-elasticity", "Elasticity") }))),
      h("tbody", {}, ...rows.map(({ p, s }) => h("tr", {}, h("td", { class: "mono", text: `${p.field.section ? `[${p.field.section}] ` : ""}${p.field.key}` }),
        h("td", { class: "num", text: s.ylo === null ? "–" : ctx.fmt(s.ylo) }), h("td", { class: "num", text: s.yhi === null ? "–" : ctx.fmt(s.yhi) }), h("td", { class: "num", text: s.elasticity === null ? "–" : ctx.fmt(s.elasticity) }))))),
    h("p", { class: "hint", text: t("js-desk-x-sens-note", "Elasticity: the relative change of the figure for a relative change of the setting (central difference over ±10 %). Each value is a fresh run of the engine; none is estimated.") }));
    btn.disabled = false;
    if (run.console) ctx.log({ kind: "explain", title: t("js-desk-log-sens", "Sensitivity of { $path } (run { $n })", { path: x.path, n: run.console }), py: [`# ${rows.map(({ p, s }) => `${p.field.key}: elasticity ${s.elasticity === null ? "n/a" : s.elasticity.toPrecision(4)}`).join("; ")}`], cli: [] });
  }

  return { open, close, get isOpen() { return !!layer; } };
}

/** Make a value element open the explainer: a button that keeps the value's look. */
export function explainable(node, onOpen, label) {
  const b = h("button", { class: "num-x", type: "button", title: label, "aria-label": `${label}: ${node.textContent || ""}` }, node);
  b.addEventListener("click", (e) => { e.stopPropagation(); onOpen(b); });
  return b;
}
