// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the sweep studio's view (0.42 U21), on lib/sweepgrid.mjs. One or two of
// the scenario's numeric settings, a range and a number of steps each, and the figure to read
// from every run; Run starts the runs (several at once on the native engine), Cancel stops
// between runs. One axis draws a curve, two a heat map; a failed run is a crossed cell; any
// cell opens as an ordinary run. Every text is set through textContent.
import { h } from "./dom.mjs";
import { axisValues, defaultRange, gridCells, cellToml, metricOf, runPool, gridModel, shade, sweepLines, gridCsv, MAX_CELLS, MAX_STEPS } from "./sweepgrid.mjs";
import { rampRGB, rgbCss, inkOn } from "./chart/colour.mjs";

const num = (x) => typeof x === "number" && Number.isFinite(x);
const KEEP_BYTES = 96 * 1024 * 1024; // results kept in memory for opening cells; beyond it a cell runs again when opened

/**
 * ctx: { t, fields(toml), figures(result) ([{ path, label, unit }]), patch, runAll(toml) (a
 * promise of { json, svg, summary, csv }), concurrency(), cancel(), fmt(v), createChart,
 * openCell(tab, toml, all, where), log(entry), nextSweep(), save(blob, name), render(), renderSoon() }.
 */
export function sweepView(ctx, tab) {
  const { t } = ctx;
  const run = tab.run;
  const fields = ctx.fields(tab.toml);
  const figs = run ? ctx.figures(run.result) : [];
  const sw = (tab.sweep ||= { axes: [], metric: "", cells: [], running: false, msg: "" });
  if (!sw.axes.length && fields.length) sw.axes = [axisOf(fields.find((f) => f.key !== "seed") || fields[0])];
  if (!sw.metric && figs.length) sw.metric = figs[0].path;
  const page = h("div", { class: "sweep" });
  if (!fields.length) { page.append(h("p", { class: "panel-msg", text: t("js-desk-sw-no-fields", "This scenario has no single-number setting to sweep.") })); return page; }
  if (!figs.length) { page.append(h("p", { class: "panel-msg", text: run ? t("js-desk-sw-no-figures", "This result has no number to read from each run.") : t("js-desk-sw-run-first", "Run the scenario once first: the figures to read come from its result.") })); return page; }

  function axisOf(f) { const r = defaultRange(f); return { id: f.id, from: r.from, to: r.to, steps: 7, scale: "lin", integer: !!f.integer }; }
  const fieldOf = (id) => fields.find((f) => f.id === id) || null;
  const label = (f) => `${f.section ? `[${f.section}] ` : ""}${f.key} = ${f.raw}`;

  // ---------- the form
  const form = h("div", { class: "sw-form" });
  const axesBox = h("div", { class: "sw-axes" });
  form.append(axesBox);
  sw.axes.forEach((ax, n) => {
    const sel = h("select", { class: "input", id: `sw-f-${tab.id}-${n}`, disabled: sw.running ? true : null }, ...fields.map((f) => { const o = h("option", { value: f.id, text: label(f) }); if (f.id === ax.id) o.selected = true; return o; }));
    sel.addEventListener("change", () => { const f = fieldOf(sel.value); if (f) Object.assign(ax, axisOf(f)); sw.cells = []; ctx.render(); });
    const numIn = (key, labelText, step) => {
      const id = `sw-${key}-${tab.id}-${n}`;
      const inp = h("input", { class: "input mono", id, type: "text", inputmode: "decimal", value: String(ax[key]), disabled: sw.running ? true : null, style: "width:9em" });
      inp.addEventListener("change", () => { const v = Number(inp.value); if (Number.isFinite(v) && (key !== "steps" || (v >= 2 && v <= MAX_STEPS))) { ax[key] = key === "steps" ? Math.round(v) : v; sw.cells = []; } else inp.value = String(ax[key]); ctx.render(); });
      return h("div", { class: "field" }, h("label", { for: id, text: labelText }), inp);
    };
    const log = h("input", { type: "checkbox", id: `sw-log-${tab.id}-${n}`, disabled: sw.running ? true : null });
    log.checked = ax.scale === "log";
    log.addEventListener("change", () => { ax.scale = log.checked ? "log" : "lin"; sw.cells = []; ctx.render(); });
    const whole = h("input", { type: "checkbox", id: `sw-int-${tab.id}-${n}`, disabled: sw.running ? true : null });
    whole.checked = !!ax.integer;
    whole.addEventListener("change", () => { ax.integer = whole.checked; sw.cells = []; ctx.render(); });
    axesBox.append(h("fieldset", { class: "sw-axis" },
      h("legend", { text: n === 0 ? t("js-desk-sw-axis-1", "Setting to sweep") : t("js-desk-sw-axis-2", "Second setting (heat map)") }),
      h("div", { class: "field" }, h("label", { for: sel.id, text: t("js-desk-sw-setting", "Setting") }), sel),
      h("div", { class: "row" }, numIn("from", t("js-desk-sw-from", "From")), numIn("to", t("js-desk-sw-to", "To")), numIn("steps", t("js-desk-sw-steps", "Steps"))),
      h("div", { class: "row" }, h("label", { class: "chk" }, log, t("js-desk-sw-log", "logarithmic spacing")), h("label", { class: "chk" }, whole, t("js-desk-sw-whole", "whole numbers only")),
        n === 1 ? h("button", { class: "btn fig-btn", type: "button", disabled: sw.running ? true : null, onclick: () => { sw.axes.splice(1, 1); sw.cells = []; ctx.render(); } }, t("js-desk-sw-remove", "Remove")) : null)));
  });
  if (sw.axes.length < 2 && fields.length > 1) form.append(h("button", { class: "btn", type: "button", disabled: sw.running ? true : null, onclick: () => { const used = new Set(sw.axes.map((a) => a.id)); const f = fields.find((x) => !used.has(x.id) && x.key !== "seed") || fields.find((x) => !used.has(x.id)) || fields[0]; sw.axes.push(axisOf(f)); sw.cells = []; ctx.render(); } }, t("js-desk-sw-add", "Add a second setting")));
  const msel = h("select", { class: "input", id: `sw-m-${tab.id}`, disabled: sw.running ? true : null }, ...figs.map((f) => { const o = h("option", { value: f.path, text: `${f.label}${f.unit ? ` (${f.unit})` : ""} · ${f.path}` }); if (f.path === sw.metric) o.selected = true; return o; }));
  msel.addEventListener("change", () => { sw.metric = msel.value; for (const c of sw.cells) if (c.result) c.value = metricOf(c.result, sw.metric); ctx.render(); });
  form.append(h("div", { class: "field" }, h("label", { for: msel.id, text: t("js-desk-sw-metric", "Figure to read from each run") }), msel));

  const axes = sw.axes.map((a) => ({ ...a, field: fieldOf(a.id), values: axisValues({ from: a.from, to: a.to, steps: a.steps, scale: a.scale, integer: a.integer }) })).filter((a) => a.field);
  const cells = gridCells(axes);
  const total = cells ? cells.length : 0;
  const status = h("p", { class: "hint", role: "status", text: sw.msg || (cells ? t("js-desk-sw-count", "{ $n } runs", { n: total }) : t("js-desk-sw-too-many", "More than { $max } runs: use fewer steps.", { max: MAX_CELLS })) });
  const go = h("button", { class: "btn primary", type: "button", disabled: sw.running || !cells || !total ? true : null, onclick: () => start(axes, cells) }, t("js-desk-sw-run", "Run the sweep"));
  const stop = h("button", { class: "btn", type: "button", disabled: sw.running ? null : true, onclick: () => { sw.stop = true; ctx.cancel(); sw.msg = t("js-desk-sw-stopping", "Stopping after the runs in progress…"); ctx.render(); } }, t("js-desk-cancel", "Cancel"));
  const csv = h("button", { class: "btn", type: "button", disabled: sw.cells.length && !sw.running ? null : true, onclick: () => ctx.save(new Blob([gridCsv(sw.ranAxes || axes, sw.cells, sw.metric)], { type: "text/csv" }), `${String(tab.file || "scenario").replace(/\.toml$/, "")}-sweep.csv`) }, t("js-desk-sw-csv", "Grid (.csv)"));
  form.append(h("div", { class: "row" }, go, stop, csv), status);
  page.append(form);

  // ---------- the result
  if (sw.cells.length) page.append(resultOf(sw.ranAxes, sw.cells));
  return page;

  function resultOf(ax, list) {
    const m = gridModel(ax, list);
    const f = figs.find((x) => x.path === sw.metric);
    const unit = f && f.unit ? f.unit : "";
    const box = h("div", { class: "sw-out" });
    box.append(h("p", { class: "hint", text: t("js-desk-sw-summary", "{ $ok } runs gave the figure, { $failed } failed. Range { $min } to { $max }{ $unit }.", { ok: m.ok, failed: m.failed, min: num(m.min) ? ctx.fmt(m.min) : "–", max: num(m.max) ? ctx.fmt(m.max) : "–", unit: unit ? ` ${unit}` : "" }) }));
    if (ax.length === 1 && !sw.running) {
      const host = h("div", { class: "sw-chart" });
      box.append(host);
      const xs = [], ys = [];
      m.x.forEach((x, i) => { if (num(m.z[0][i])) { xs.push(x); ys.push(m.z[0][i]); } });
      requestAnimationFrame(() => {
        if (!host.isConnected || xs.length < 1) return;
        ctx.createChart(host, { type: "xy", title: f ? f.label : sw.metric, height: 300,
          x: { label: ax[0].field.key, kind: ax[0].scale === "log" && ax[0].from > 0 ? "log" : "linear" }, y: { label: f ? f.label : sw.metric, unit },
          series: [{ id: "sweep", label: f ? f.label : sw.metric, unit, x: xs, y: ys, kind: "line" }, { id: "pts", label: t("js-desk-sw-runs", "runs"), unit, x: xs, y: ys, kind: "scatter" }] });
      });
    }
    // the grid of cells: each one a button that opens its run
    const nx = m.x.length, ny = m.y ? m.y.length : 1;
    const table = h("table", { class: "sw-grid", "aria-label": t("js-desk-sw-grid", "Sweep grid: each cell opens its run") });
    const head = h("tr", {}, h("th", { scope: "col", class: "mono", text: ax[1] ? `${ax[1].field.key} ↓ · ${ax[0].field.key} →` : ax[0].field.key }), ...m.x.map((x) => h("th", { scope: "col", class: "mono", text: ctx.fmt(x) })));
    table.append(h("thead", {}, head));
    const body = h("tbody");
    for (let j = 0; j < ny; j++) {
      const tr = h("tr", {}, h("th", { scope: "row", class: "mono", text: m.y ? ctx.fmt(m.y[j]) : sw.metric.split(".").pop() }));
      for (let i = 0; i < nx; i++) {
        const c = list.find((x) => x.i === i && x.j === j);
        const st = m.state[j][i], v = m.z[j][i];
        const k = shade(v, m.min, m.max);
        const rgb = num(k) ? rampRGB("viridis", k) : null;
        const bg = rgb ? rgbCss(rgb) : "";
        const txt = st === "ok" ? ctx.fmt(v) : st === "failed" ? "✕" : st === "missing" ? "–" : "…";
        const where = c ? c.coords.map((x, n) => `${ax[n].field.key} = ${ctx.fmt(x)}`).join(", ") : "";
        const b = h("button", { type: "button", class: `sw-cell ${st}`, style: bg ? `background:${bg};color:${inkOn(rgb)}` : null, disabled: st === "pending" ? true : null,
          title: `${where}: ${st === "failed" ? `${t("js-desk-sw-failed", "failed")}: ${c.error}` : txt}`, "aria-label": `${where}: ${st === "failed" ? t("js-desk-sw-failed", "failed") : txt}`, onclick: () => c && openCell(ax, c) }, txt);
        tr.append(h("td", {}, b));
      }
      body.append(tr);
    }
    table.append(body);
    box.append(h("div", { class: "sw-grid-wrap" }, table));
    if (ax.length === 2) box.append(h("div", { class: "sw-scale", "aria-hidden": "true" }, h("span", { text: num(m.min) ? ctx.fmt(m.min) : "" }), h("i", { style: `background:linear-gradient(90deg,${[0, 0.25, 0.5, 0.75, 1].map((q) => rgbCss(rampRGB("viridis", q))).join(",")})` }), h("span", { text: num(m.max) ? `${ctx.fmt(m.max)}${unit ? ` ${unit}` : ""}` : "" })));
    return box;
  }

  async function openCell(ax, c) {
    const toml = cellToml(tab.toml, ax, c.coords, ctx.patch);
    let all = c.all || null;
    if (!all) { try { all = await ctx.runAll(toml); } catch (e) { c.error = String(e && e.message || e); ctx.render(); return; } }
    ctx.openCell(tab, toml, all, ax.map((a, n) => `${a.field.key} = ${ctx.fmt(c.coords[n])}`).join(", "));
  }

  async function start(ax, list) {
    sw.running = true; sw.stop = false; sw.msg = ""; sw.ranAxes = ax;
    sw.cells = list.map((c) => ({ ...c }));
    let kept = 0, done = 0;
    const n = ctx.nextSweep();
    const lines = sweepLines({ n, toml: tab.toml, axes: ax, metricPath: sw.metric, name: tab.file });
    ctx.log({ kind: "sweep", title: t("js-desk-log-sweep", "Sweep { $n }: { $title }, { $cells } runs", { n, title: tab.title, cells: list.length }), py: lines.py, cli: lines.cli });
    ctx.render();
    const t0 = performance.now();
    const res = await runPool(sw.cells, {
      concurrency: ctx.concurrency(),
      stopped: () => sw.stop || tab.sweep !== sw,
      run: (c) => ctx.runAll(cellToml(tab.toml, ax, c.coords, ctx.patch)),
      onDone: (c, all, err) => {
        done++;
        if (err) c.error = String((err && err.message) || err).slice(0, 300);
        else {
          let result = null;
          try { result = JSON.parse(all.json); } catch { c.error = "result is not JSON"; }
          if (result) {
            c.value = metricOf(result, sw.metric);
            if (kept + all.json.length < KEEP_BYTES) { c.all = all; c.result = result; kept += all.json.length; }
          }
        }
        sw.msg = t("js-desk-sw-progress", "{ $done } of { $n } runs done", { done, n: list.length });
        ctx.renderSoon();
      },
    });
    sw.running = false;
    sw.msg = res.stopped ? t("js-desk-sw-stopped", "Stopped: { $done } of { $n } runs done.", { done: res.done, n: list.length }) : t("js-desk-sw-done", "{ $n } runs in { $s } s ({ $par } at once).", { n: res.done, s: ((performance.now() - t0) / 1000).toFixed(1), par: ctx.concurrency() });
    ctx.render();
  }
}
