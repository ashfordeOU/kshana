// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the Plots view of a run and the spectrum of an IQ recording (0.42 U25).
// A run's Allan deviation, MTIE and TDEV curves, Stanford points, spectra and waterfalls
// (lib/plots.mjs findPlots) are drawn with the chart library (log–log with confidence bands, the
// Stanford plot with its regions, the 2D ↔ 3D waterfall): hover values with units, markers,
// zoom, CSV/SVG/PNG. An IQ recording is read by the app's native side in blocks (read_range)
// and its Welch spectrum and waterfall drawn from lib/iq.mjs, in relative power.
import { h } from "./dom.mjs";
import { findPlots, plotCharts } from "./plots.mjs";
import { samplesOf, welch, waterfall, readPlan, formatOfDatatype, IQ_FORMATS } from "./iq.mjs";

/**
 * The Plots view of a run: one chart per group of curves, Stanford plot, spectrum and waterfall.
 * ctx: { t, createChart, createDual, presets, title }. Returns { el, charts, found }.
 */
export function plotsPane(ctx, result) {
  const { t } = ctx;
  const found = findPlots(result);
  const el = h("div", { class: "plots-pane" });
  const charts = [];
  if (!found.length) { el.append(h("p", { class: "panel-msg", text: t("js-desk-pl-none", "This result has no Allan deviation, MTIE, TDEV, Stanford or spectrum output.") })); return { el, charts, found }; }
  for (const c of plotCharts(found, ctx.presets, { title: ctx.title || "" })) {
    const cell = h("div", { class: "plots-cell" });
    el.append(cell);
    try {
      if (c.kind === "waterfall") charts.push(ctx.createDual(cell, { ...c.spec, height: 300 }, { xs: c.grid.f, ys: c.grid.t, zs: c.grid.z, x: { label: "frequency", unit: "MHz" }, y: { label: "time", unit: "s" }, z: { label: "PSD", unit: "dBW/Hz" }, map: "night", unit: "dBW/Hz", label: "PSD" }));
      else charts.push(ctx.createChart(cell, { ...c.spec, height: 320 }));
    } catch (e) { cell.append(h("p", { class: "panel-msg", text: String(e && e.message ? e.message : e) })); }
    cell.append(h("p", { class: "sky-note", text: t("js-desk-pl-from", "From { $paths } of the result, as the engine wrote it.", { paths: c.paths.join(", ") }) }));
    if (c.note) cell.append(h("p", { class: "sky-note", text: c.note }));
  }
  return { el, charts, found };
}

/** What an IQ data link needs to be read: { path (the samples), format, rate, centre } or null. */
export function iqSource(link) {
  if (!link || link.family !== "iq" || !link.path) return null;
  const ex = link.extra || {};
  const sig = /\.sigmf-meta$/i.test(link.path);
  const format = formatOfDatatype(link.format) || (IQ_FORMATS[link.format] ? link.format : null);
  if (!format) return null;
  return { path: sig ? link.path.replace(/\.sigmf-meta$/i, ".sigmf-data") : link.path, format, rate: Number(ex.sample_rate_hz) || 0, centre: Number(ex.centre_hz) || 0, name: link.name || link.path };
}

const fromB64 = (s) => { const bin = atob(s || ""); const b = new Uint8Array(bin.length); for (let i = 0; i < bin.length; i++) b[i] = bin.charCodeAt(i); return b; };

/**
 * The spectrum page of an IQ recording. ctx: { t, invoke, createChart, createDual, presets, src
 * (iqSource), state (kept per tab: { rate, offsetS, nfft, made }), render() }.
 */
export function iqPane(ctx) {
  const { t, src } = ctx;
  const st = ctx.state;
  if (st.el) return st.el; // drawn once per tab: a render of the shell keeps it
  if (!st.rate) st.rate = src.rate || 0;
  if (!st.nfft) st.nfft = 1024;
  const el = h("div", { class: "plots-pane" });
  const rateIn = h("input", { class: "input mono", id: "iq-rate", type: "text", inputmode: "decimal", value: st.rate ? String(st.rate) : "" });
  const offIn = h("input", { class: "input mono", id: "iq-off", type: "text", inputmode: "decimal", value: String(st.offsetS || 0) });
  const nfftSel = h("select", { class: "input", id: "iq-nfft" }, ...[256, 512, 1024, 2048, 4096].map((n) => h("option", { value: String(n), text: String(n) })));
  nfftSel.value = String(st.nfft);
  const out = h("div", { class: "plots-out" });
  const draw = async () => {
    const rate = Number(rateIn.value.trim());
    if (!(rate > 0)) { out.replaceChildren(h("p", { class: "notice", text: t("js-desk-iq-need-rate", "Write the sample rate (samples per second): a raw recording does not carry it.") })); return; }
    st.rate = rate; st.offsetS = Math.max(0, Number(offIn.value) || 0); st.nfft = Number(nfftSel.value);
    out.replaceChildren(h("p", { class: "busy", role: "status" }, h("span", { class: "spin", "aria-hidden": "true" }), t("js-desk-iq-reading", "Reading the recording in blocks…")));
    try {
      const info = await ctx.invoke("file_info", { path: src.path });
      const bps = IQ_FORMATS[src.format];
      const plan = readPlan(info.bytes, src.format, { offset: Math.floor(st.offsetS * rate) * bps, maxBytes: 16 * 1024 * 1024 });
      if (plan.samples < st.nfft * 2) throw new Error(t("js-desk-iq-short", "Too few samples there for a spectrum."));
      const r = await ctx.invoke("read_range", { path: src.path, offset: plan.offset, len: plan.len });
      const iq = samplesOf(fromB64(r.base64), src.format);
      const sp = welch(iq, { nfft: st.nfft, rate });
      const wf = waterfall(iq, { nfft: Math.min(512, st.nfft), rate, rows: 64 });
      const f0 = src.centre;
      const mhz = (f) => (f0 + f) / 1e6;
      const seconds = plan.samples / rate;
      out.replaceChildren();
      const c1 = h("div", { class: "plots-cell" }), c2 = h("div", { class: "plots-cell" });
      out.append(c1, c2);
      ctx.createChart(c1, { type: "xy", title: t("js-desk-iq-spectrum", "Spectrum (Welch)"), subtitle: t("js-desk-iq-sub", "{ $n } segments of { $nfft } samples, Hann window, RBW { $rbw } Hz", { n: sp.segments, nfft: sp.nfft, rbw: Math.round(sp.rbw) }), x: { label: "frequency", unit: f0 ? "MHz" : "MHz offset" }, y: { label: "PSD", unit: "dBFS/Hz" }, series: [{ id: "psd", label: "PSD", color: "int", x: sp.f.map(mhz), y: sp.psd, unit: "dBFS/Hz" }], height: 300 });
      ctx.createDual(c2, { ...ctx.presets.waterfall({ title: t("js-desk-iq-waterfall", "Waterfall"), f: wf.f.map(mhz), t: wf.t.map((x) => x + st.offsetS), z: wf.z, unit: "dBFS/Hz" }), height: 300 },
        { xs: wf.f.map(mhz), ys: wf.t.map((x) => x + st.offsetS), zs: wf.z, x: { label: "frequency", unit: "MHz" }, y: { label: "time", unit: "s" }, z: { label: "PSD", unit: "dBFS/Hz" }, map: "night", unit: "dBFS/Hz", label: "PSD" });
      out.append(h("p", { class: "sky-note", text: t("js-desk-iq-note", "{ $s } s of the recording from { $from } s ({ $n } samples, { $fmt }). Power relative to a full-scale sample (dBFS/Hz): a recording carries no calibration.", { s: seconds.toFixed(3), from: st.offsetS, n: plan.samples, fmt: src.format }) }));
      st.made = true;
    } catch (e) { out.replaceChildren(h("p", { class: "notice error", text: t("js-desk-iq-failed", "The recording could not be read: { $reason }", { reason: String(e && e.message ? e.message : e) }) })); }
  };
  el.append(h("div", { class: "row iq-controls" },
    h("label", { for: "iq-rate", text: t("js-desk-iq-rate", "Sample rate (Hz)") }), rateIn,
    h("label", { for: "iq-off", text: t("js-desk-iq-offset", "From (s)") }), offIn,
    h("label", { for: "iq-nfft", text: t("js-desk-iq-nfft", "FFT size") }), nfftSel,
    h("button", { class: "btn primary", type: "button", onclick: draw }, t("js-desk-iq-draw", "Draw"))), out);
  if (st.rate) queueMicrotask(draw);
  st.el = el;
  return el;
}
