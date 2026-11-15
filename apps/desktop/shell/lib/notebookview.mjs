// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the Python console and lab notebook page (0.42 U23), on lib/notebook.mjs
// and the app's native Python session (src-tauri/src/python.rs). The page says which Python it
// found and whether the kshana package imports there, or plainly that there is none. Notebooks
// are kept in the project folder (notebooks/<name>.ipynb); the console's history stays in the
// window. Every text reaches the page through textContent; a Markdown cell is drawn from
// lib/notebook.mjs markdownHtml (everything escaped first) with only its own tags kept.
import { h } from "./dom.mjs";
import { newNotebook, notebookFile, outputsOf, toIpynb, toHtml, toPdf, citation, mirrorCells, markdownHtml, cellId } from "./notebook.mjs";

const PY_KEY = "kshana-desk-python";
const MD_TAGS = new Set(["H1", "H2", "H3", "H4", "H5", "H6", "P", "UL", "OL", "LI", "PRE", "CODE", "STRONG", "EM", "BR"]);
const S = { probe: null, probing: false, sel: 0, busy: null, consoleIn: "", history: [], session: null, interp: null };
function interp() {
  if (S.interp === null) { try { S.interp = localStorage.getItem(PY_KEY) || ""; } catch { S.interp = ""; } }
  return S.interp;
}

/** Markdown drawn with only the tags lib/notebook.mjs writes (text is escaped there). */
function mdNode(md) {
  const doc = new DOMParser().parseFromString(`<div>${markdownHtml(md)}</div>`, "text/html");
  const copy = (n) => {
    if (n.nodeType === 3) return document.createTextNode(n.textContent);
    if (n.nodeType !== 1 || !MD_TAGS.has(n.tagName)) return document.createTextNode(n.textContent || "");
    const e = document.createElement(n.tagName.toLowerCase());
    for (const c of n.childNodes) e.append(copy(c));
    return e;
  };
  const out = h("div", { class: "nb-md" });
  for (const c of doc.body.firstChild.childNodes) out.append(copy(c));
  return out;
}

function outNodes(outputs) {
  return (outputs || []).map((o) => {
    if (o.type === "image") return h("img", { class: "nb-img", alt: "Figure", src: `data:image/png;base64,${o.png.replace(/[^A-Za-z0-9+/=]/g, "")}` });
    return h("pre", { class: `nb-out ${o.type === "error" ? "err" : o.name === "stderr" ? "warn" : ""}`, text: o.text });
  });
}

/**
 * The page. ctx: { t, invoke (or null), notebooks() ([{ file, nb }], the project's), setNotebooks(list),
 * projectDir(), engineVersion(), mirror() (the code mirror's entries), pyHeader, save(blob, name),
 * copy(text), toast(text), log(entry), render() }.
 */
export function notebookView(ctx) {
  const { t } = ctx;
  const page = h("section", { class: "page nb-page", "aria-labelledby": "nb-h" },
    h("h1", { id: "nb-h", text: t("js-desk-nb-title", "Python notebook") }),
    h("p", { class: "lede", text: t("js-desk-nb-lede", "Python cells and notes kept with the project, run by the Python on this computer with the kshana package (pip install kshana). The cells share one session, started in the project folder.") }));
  if (!ctx.invoke) { page.append(h("p", { class: "notice", text: t("js-desk-nb-no-native", "Python runs through the app's native side, which this window does not have.") })); return page; }

  // ---- which Python
  const probe = () => {
    S.probing = true; ctx.render();
    ctx.invoke("python_probe", { interpreter: interp() || null }).then((p) => { S.probe = p; }).catch((e) => { S.probe = { found: false, error: String(e) }; }).finally(() => { S.probing = false; ctx.render(); });
  };
  if (!S.probe && !S.probing) probe();
  const p = S.probe;
  const pyIn = h("input", { class: "input mono", id: "nb-python", type: "text", spellcheck: "false", value: interp(), placeholder: "python3" });
  pyIn.addEventListener("change", () => { S.interp = pyIn.value.trim(); try { localStorage.setItem(PY_KEY, S.interp); } catch { /* not remembered */ } ctx.invoke("python_stop", {}).catch(() => {}); S.probe = null; probe(); });
  const status = S.probing ? t("js-desk-nb-probing", "Looking for Python…")
    : !p ? ""
    : !p.found ? t("js-desk-nb-no-python", "No Python was found on this computer (tried: { $tried }). Install Python 3 (python.org or your system's packages), then pip install kshana, and check again.", { tried: (p.tried || []).join(", ") || "python3" })
    : p.kshana ? t("js-desk-nb-found", "Python { $py } ({ $exe }) with the kshana package { $ver }.", { py: p.python, exe: p.executable || p.command, ver: p.kshana })
    : t("js-desk-nb-no-kshana", "Python { $py } ({ $exe }) runs, but the kshana package does not import there: pip install kshana. Cells that do not use it still run.", { py: p.python, exe: p.executable || p.command });
  page.append(h("div", { class: "card nb-py" },
    h("p", { class: p && !p.found ? "notice" : "muted", role: "status", style: "margin:0 0 8px", text: status }),
    h("div", { class: "row" }, h("label", { for: "nb-python", text: t("js-desk-nb-interp", "Python to use (empty: python3, then python)") }), pyIn,
      h("button", { class: "btn", type: "button", onclick: () => { S.probe = null; probe(); } }, t("js-desk-nb-check", "Check again")))));

  // ---- the notebooks of the project
  const list = ctx.notebooks();
  if (S.sel >= list.length) S.sel = Math.max(0, list.length - 1);
  const cur = list[S.sel] || null;
  const nameIn = h("input", { class: "input", id: "nb-new", type: "text", placeholder: t("js-desk-nb-new-ph", "Holdover study") });
  const pick = h("select", { class: "input", "aria-label": t("js-desk-nb-pick", "Notebook") }, ...list.map((x, i) => h("option", { value: String(i), text: x.nb.name })));
  pick.value = String(S.sel);
  pick.addEventListener("change", () => { S.sel = Number(pick.value); ctx.render(); });
  const add = () => {
    const name = nameIn.value.trim() || t("js-desk-nb-untitled", "Notebook { $n }", { n: list.length + 1 });
    let file = notebookFile(name), k = 2;
    while (list.some((x) => x.file === file)) file = notebookFile(`${name}-${k++}`);
    const nb = newNotebook(name);
    nb.engine = ctx.engineVersion();
    ctx.setNotebooks([...list, { file, nb }]);
    S.sel = list.length;
    ctx.render();
  };
  page.append(h("div", { class: "row nb-pickrow" }, list.length ? pick : h("span", { class: "muted", text: t("js-desk-nb-none", "No notebook in this project yet.") }), nameIn, h("button", { class: "btn primary", type: "button", onclick: add }, t("js-desk-nb-new", "New notebook"))));
  if (!cur) return consoleBox(ctx, page);

  const nb = cur.nb;
  const changed = () => ctx.setNotebooks(list.slice());
  const runCell = async (c) => {
    if (S.busy) return;
    S.busy = c.id; ctx.render();
    try {
      const a = await ctx.invoke("python_exec", { code: c.source, interpreter: interp() || null, cwd: ctx.projectDir() || null, timeoutS: 900 });
      S.session = a && a.session ? a.session : S.session;
      nb.cellCount = (nb.cellCount || 0) + 1;
      c.count = nb.cellCount;
      c.outputs = outputsOf(a);
      nb.engine = ctx.engineVersion() || nb.engine;
    } catch (e) { c.outputs = [{ type: "error", text: String(e && e.message ? e.message : e) }]; }
    S.busy = null; changed(); ctx.render();
  };
  const runAll = async () => { for (const c of nb.cells) if (c.type === "code") { await runCell(c); if ((c.outputs || []).some((o) => o.type === "error")) break; } };
  const stop = () => { ctx.invoke("python_stop", {}).then(() => { S.busy = null; S.session = null; ctx.toast(t("js-desk-nb-stopped", "The Python session was ended; the next cell starts a new one.")); ctx.render(); }); };
  const cite = () => {
    const c = citation(ctx.engineVersion() || nb.engine);
    nb.cells.push({ id: cellId(), type: "markdown", source: `## How to cite\n\n${c.markdown}`, outputs: [], count: null });
    changed(); ctx.copy(c.bibtex); ctx.render();
  };
  const fromMirror = () => {
    const cells = mirrorCells(ctx.mirror(), ctx.pyHeader);
    if (!cells.length) { ctx.toast(t("js-desk-nb-mirror-empty", "The console has no Python lines yet.")); return; }
    nb.cells.push(...cells); changed(); ctx.render();
  };
  const base = cur.file.replace(/\.ipynb$/, "");
  page.append(h("div", { class: "row nb-tools", role: "toolbar", "aria-label": t("js-desk-nb-tools", "Notebook tools") },
    h("button", { class: "btn primary", type: "button", disabled: S.busy ? true : null, onclick: runAll }, t("js-desk-nb-run-all", "Run all")),
    h("button", { class: "btn", type: "button", onclick: stop }, t("js-desk-nb-stop", "Stop the session")),
    h("button", { class: "btn", type: "button", onclick: () => { nb.cells.push({ id: cellId(), type: "code", source: "", outputs: [], count: null }); changed(); ctx.render(); } }, t("js-desk-nb-add-code", "Add code")),
    h("button", { class: "btn", type: "button", onclick: () => { nb.cells.push({ id: cellId(), type: "markdown", source: "", outputs: [], count: null }); changed(); ctx.render(); } }, t("js-desk-nb-add-text", "Add text")),
    h("button", { class: "btn", type: "button", onclick: fromMirror }, t("js-desk-nb-from-console", "Add the console's Python")),
    h("button", { class: "btn", type: "button", onclick: cite }, t("js-desk-nb-cite", "Cite")),
    h("button", { class: "btn", type: "button", onclick: () => ctx.save(new Blob([toIpynb(nb)], { type: "application/x-ipynb+json" }), `${base}.ipynb`) }, t("js-desk-nb-export-ipynb", "Jupyter")),
    h("button", { class: "btn", type: "button", onclick: () => ctx.save(new Blob([toHtml(nb, { made: new Date().toISOString().slice(0, 10) })], { type: "text/html" }), `${base}.html`) }, "HTML"),
    h("button", { class: "btn", type: "button", onclick: () => ctx.save(new Blob([toPdf(nb, { made: new Date().toISOString().slice(0, 10) })], { type: "application/pdf" }), `${base}.pdf`) }, "PDF")));
  page.append(h("p", { class: "hint", text: t("js-desk-nb-kept", "Kept as notebooks/{ $file } in the project; it opens in Jupyter as it is. The PDF holds the text of the cells and their output; figures are in the HTML and Jupyter files.", { file: cur.file }) }));

  const cellsBox = h("div", { class: "nb-cells" });
  nb.cells.forEach((c, i) => {
    const ta = h("textarea", { class: `input nb-src ${c.type === "code" ? "mono" : ""}`, rows: String(Math.min(18, Math.max(2, c.source.split("\n").length + 1))), spellcheck: c.type === "code" ? "false" : "true", "aria-label": c.type === "code" ? t("js-desk-nb-code", "Python cell { $n }", { n: i + 1 }) : t("js-desk-nb-text", "Text cell { $n }", { n: i + 1 }) });
    ta.value = c.source;
    ta.addEventListener("change", () => { c.source = ta.value; changed(); });
    ta.addEventListener("keydown", (e) => { if (e.key === "Enter" && (e.shiftKey || e.ctrlKey || e.metaKey) && c.type === "code") { e.preventDefault(); c.source = ta.value; runCell(c); } });
    const move = (d) => { const j = i + d; if (j < 0 || j >= nb.cells.length) return; [nb.cells[i], nb.cells[j]] = [nb.cells[j], nb.cells[i]]; changed(); ctx.render(); };
    const head = h("div", { class: "nb-cellhead" },
      h("span", { class: "mono muted", text: c.type === "code" ? `[${S.busy === c.id ? "*" : c.count ?? " "}]` : "¶" }),
      c.type === "code" ? h("button", { class: "btn", type: "button", disabled: S.busy ? true : null, onclick: () => { c.source = ta.value; runCell(c); } }, t("js-desk-nb-run", "Run")) : null,
      h("button", { class: "linkish", type: "button", "aria-label": t("js-desk-nb-up", "Move up"), onclick: () => move(-1) }, "↑"),
      h("button", { class: "linkish", type: "button", "aria-label": t("js-desk-nb-down", "Move down"), onclick: () => move(1) }, "↓"),
      h("button", { class: "linkish", type: "button", onclick: () => { nb.cells.splice(i, 1); changed(); ctx.render(); } }, t("js-desk-nb-delete", "delete")));
    cellsBox.append(h("article", { class: `nb-cell ${c.type}` }, head, ta, c.type === "markdown" && c.source.trim() ? mdNode(c.source) : null, ...outNodes(c.outputs)));
  });
  page.append(cellsBox);
  return consoleBox(ctx, page);
}

/** The console: one line (or several, with Shift+Enter) run in the same session; its history stays in this window. */
function consoleBox(ctx, page) {
  const { t } = ctx;
  const ta = h("textarea", { class: "input mono nb-console-in", id: "nb-console", rows: "2", spellcheck: "false", placeholder: ">>> kshana.list_kinds()" });
  ta.value = S.consoleIn;
  ta.addEventListener("input", () => { S.consoleIn = ta.value; });
  const run = async () => {
    const code = ta.value;
    if (!code.trim() || S.busy) return;
    S.busy = "console"; S.consoleIn = ""; ctx.render();
    let out;
    try { out = outputsOf(await ctx.invoke("python_exec", { code, interpreter: interp() || null, cwd: ctx.projectDir() || null, timeoutS: 900 })); }
    catch (e) { out = [{ type: "error", text: String(e && e.message ? e.message : e) }]; }
    S.history.push({ code, out });
    if (S.history.length > 200) S.history.shift();
    S.busy = null; ctx.render();
    const el = document.getElementById("nb-console"); if (el) el.focus();
  };
  ta.addEventListener("keydown", (e) => { if (e.key === "Enter" && !e.shiftKey) { e.preventDefault(); S.consoleIn = ta.value; run(); } });
  page.append(h("h2", { text: t("js-desk-nb-console", "Console") }),
    h("p", { class: "hint", text: t("js-desk-nb-console-note", "Enter runs; Shift+Enter starts a new line. The console shares the notebook's session; its history is not kept in the project.") }),
    h("div", { class: "nb-history", role: "log", "aria-live": "polite" }, ...S.history.slice(-40).flatMap((x) => [h("pre", { class: "nb-in", text: `>>> ${x.code}` }), ...outNodes(x.out)])),
    ta, h("div", { class: "row" }, h("button", { class: "btn", type: "button", disabled: S.busy ? true : null, onclick: () => { S.consoleIn = ta.value; run(); } }, t("js-desk-nb-run", "Run")), S.busy ? h("span", { class: "busy" }, h("span", { class: "spin", "aria-hidden": "true" }), t("js-desk-nb-running", "Running…")) : null));
  return page;
}
