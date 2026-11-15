// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the tools every figure carries (0.42 U10, U13): "copy the script that
// makes this" and the journal export (IEEE, ION or AIAA; SVG, PDF or PNG) of an interactive
// chart (lib/chart). The figure's data and drawing come from lib/chart/journal.mjs; this
// module is the buttons. Every text goes in through textContent.
import { journalFigure, journalSVG, journalPDF, pngSize, journalFilename, JOURNAL_STYLES, JOURNAL_FORMATS } from "./chart/journal.mjs";
import { paint } from "./chart/paint.mjs";
let journalBoxes = 0;

const el = (tag, cls, text) => { const n = document.createElement(tag); if (cls) n.className = cls; if (text !== undefined) n.textContent = text; return n; };

/** A PNG blob of a journal figure at `dpi`, painted from the same display list as the SVG and PDF. */
export function journalPNG(fig, dpi = 300) {
  const { width, height, scale } = pngSize(fig, dpi);
  const c = document.createElement("canvas");
  c.width = width; c.height = height;
  const g = c.getContext("2d");
  g.scale(scale, scale);
  paint(g, fig.list, { font: JOURNAL_STYLES[fig.style].font });
  return new Promise((res) => c.toBlob((b) => res(b), "image/png"));
}

/** The blob of a chart's journal figure in `format`. */
export async function journalBlob(chart, styleId, format, { columns = "single", title = "" } = {}) {
  const fig = journalFigure(chart.spec, chart.view, chart.hidden, styleId, { columns });
  if (format === "svg") return new Blob([journalSVG(fig, title)], { type: "image/svg+xml" });
  if (format === "pdf") return new Blob([journalPDF(fig, title)], { type: "application/pdf" });
  return journalPNG(fig, 300);
}

/**
 * A figure toolbar: [Copy the script] and, for a chart, [Journal ▾] with style, columns and
 * format. opts: { t, chart (or null), title, script: () => text, save(blob, name), copy(text),
 * log(entry) (the code mirror), icon }.
 */
export function figureTools({ t, chart = null, title = "figure", script, save, copy, log = null }) {
  const bar = el("div", "fig-tools");
  bar.setAttribute("role", "toolbar");
  bar.setAttribute("aria-label", t("js-desk-fig-tools", "Figure tools"));
  const b = el("button", "btn fig-btn", t("js-desk-fig-script", "Copy the script that makes this"));
  b.type = "button";
  b.addEventListener("click", () => { const s = script(); copy(s); if (log) log({ kind: "figure", title: t("js-desk-fig-script-log", "Script of { $title }", { title }), py: [`# the script that makes "${title}" was copied (${s.split("\n").length} lines)`], cli: [] }); });
  bar.append(b);
  if (chart && (chart.spec.type === "xy" || chart.spec.type === "polar")) {
    const det = el("details", "fig-journal");
    const sum = el("summary", "btn fig-btn", t("js-desk-fig-journal", "Export for a journal"));
    det.append(sum);
    const box = el("div", "fig-journal-box");
    const sel = (id, label, opts) => {
      const wrap = el("label", "fig-field");
      wrap.append(el("span", "", label));
      const s = el("select", "input");
      s.id = id;
      for (const [v, text] of opts) { const o = el("option", "", text); o.value = v; s.append(o); }
      wrap.append(s);
      box.append(wrap);
      return s;
    };
    const uid = String(++journalBoxes); // unique element ids for this window's labels; no randomness needed
    const style = sel(`fj-style-${uid}`, t("js-desk-fig-style", "Style"), Object.values(JOURNAL_STYLES).map((s) => [s.id, s.label]));
    const cols = sel(`fj-cols-${uid}`, t("js-desk-fig-width", "Width"), [["single", t("js-desk-fig-single", "one column")], ["double", t("js-desk-fig-double", "two columns")]]);
    const row = el("div", "fig-formats");
    for (const f of JOURNAL_FORMATS) {
      const fb = el("button", "btn", f.toUpperCase());
      fb.type = "button";
      fb.addEventListener("click", async () => {
        const blob = await journalBlob(chart, style.value, f, { columns: cols.value, title });
        if (!blob) return;
        const name = journalFilename(title, style.value, f);
        save(blob, name);
        if (log) log({ kind: "export", title: t("js-desk-fig-journal-log", "Journal figure { $name }", { name }), py: [`# ${name}: ${JOURNAL_STYLES[style.value].label} style, ${cols.value} column, the chart's visible window (its data are in the file's metadata)`], cli: [] });
      });
      row.append(fb);
    }
    box.append(row, el("p", "hint", t("js-desk-fig-journal-note", "The visible window of the chart, with its data embedded in the file. Check the figure against the journal's current author guide before submitting.")));
    det.append(box);
    bar.append(det);
  }
  return bar;
}
