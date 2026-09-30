// Editions hero (R5, 2026-09-29): three editions on one engine.
// Data: build.py page data "editions" (#kpage): every scenario kind the open engine lists
// (src/api.rs list_scenario_kinds), its group as on Capabilities, its ledger rows (validated, total)
// from web/data/verification-matrix.json, and the kinds Kshana Pro and the custom study build on
// (build.py EXTENDS, the site's editions register). Nothing is typed here.
// Live: a cursor steps round the kind ring, reading out each kind and what builds on it; the links of
// the kind on show flow toward the Pro or study ring. The ring itself holds still, so every mark can be
// read (and measured) where it is. Reduced motion: the complete still frame.
const $ = (s, r = document) => r.querySelector(s);
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const NS = "http://www.w3.org/2000/svg";
const win = $("#eoWin");
let E = null;
try { E = JSON.parse($("#kpage").textContent); } catch (e) { E = null; }   // the page data is the editions block itself
if (win && E && E.kinds && E.kinds.length) init(E);

function S(tag, attrs, parent, text) {
  const e = document.createElementNS(NS, tag);
  for (const k in attrs) if (attrs[k] != null) e.setAttribute(k, attrs[k]);
  if (text != null) e.textContent = text;
  if (parent) parent.append(e);
  return e;
}

function init(E) {
  const svg = $("#eoSvg"), read = $("#eoRead");
  win.classList.add("ready");
  const cx = 260, cy = 210, R0 = 72, RK = 106, RP = 146, RC = 186;
  // kinds in group order, a gap between groups
  const G = E.groups.map((g) => g[0]).concat(["Other"]);
  const kinds = E.kinds.map(([k, gi, v, tot]) => ({ k, g: gi < 0 ? G.length - 1 : gi, v, tot }))
    .sort((a, b) => a.g - b.g);
  const gaps = new Set(kinds.map((x, i) => (i && x.g !== kinds[i - 1].g ? i : -1)).filter((i) => i > 0));
  const slots = kinds.length + gaps.size * 1.6;
  let s = 0;
  kinds.forEach((x, i) => { if (gaps.has(i)) s += 1.6; x.a = (s / slots) * 2 * Math.PI - Math.PI / 2; s++; });
  const byKind = Object.fromEntries(kinds.map((x) => [x.k, x]));
  const ext = E.extends.map(([lab, href, ks]) => ({ lab, href, ks: ks.filter((k) => byKind[k]), pro: /^Pro/.test(lab) }));
  for (const e of ext) for (const k of e.ks) (byKind[k].by ||= []).push(e);
  const pol = (r, a) => [cx + r * Math.cos(a), cy + r * Math.sin(a)];

  // static rings (Pro, custom study) with their labels
  S("circle", { cx, cy, r: RC, class: "eo-rc" }, svg);
  S("circle", { cx, cy, r: RP, class: "eo-rp" }, svg);
  const lbl = (x, y, t, cls, anchor) => S("text", { x, y, class: cls, "text-anchor": anchor }, svg, t);
  { const [px, py] = pol(RC + 10, Math.PI * 0.2); lbl(px, py + 4, "Kshana Pro", "eo-lt p", "start"); }
  { const [px, py] = pol(RC + 10, Math.PI * 0.8); lbl(px, py + 4, "Custom study", "eo-lt c", "end"); }
  // the turning group: kind marks and the links to the rings
  const rot = S("g", { class: "eo-rot" }, svg);
  const links = S("g", { class: "eo-links" }, rot);
  for (const x of kinds) {
    for (const e of x.by || []) {
      const r1 = e.pro ? RP - 6 : RC - 5, [x0, y0] = pol(RK + 10, x.a), [x1, y1] = pol(r1, x.a);
      const ln = S("line", { x1: x0, y1: y0, x2: x1, y2: y1, class: `eo-ln ${e.pro ? "p" : "c"}` }, links);
      S("circle", { cx: x1, cy: y1, r: 3.2, class: `eo-end ${e.pro ? "p" : "c"}` }, links);
      (x.lines ||= []).push(ln);
    }
  }
  const marks = S("g", {}, rot);
  for (const x of kinds) {
    const [mx, my] = pol(RK, x.a), st = x.tot ? (x.v > 0 ? "v" : "m") : "u";
    x.st = st;
    const deg = (x.a * 180) / Math.PI;
    if (st === "v") x.el = S("rect", { x: mx - 5, y: my - 5, width: 10, height: 10, rx: 2, class: "eo-mk v", transform: `rotate(${deg} ${mx} ${my})` }, marks);
    else if (st === "m") x.el = S("rect", { x: mx - 4.2, y: my - 4.2, width: 8.4, height: 8.4, rx: 1.6, class: "eo-mk m", transform: `rotate(${deg} ${mx} ${my})` }, marks);
    else { const [a0, b0] = pol(RK - 6, x.a), [a1, b1] = pol(RK + 6, x.a); x.el = S("line", { x1: a0, y1: b0, x2: a1, y2: b1, class: "eo-mk u" }, marks); }
  }
  const cursor = S("circle", { r: 11, class: "eo-cur" }, rot);
  // the core
  S("circle", { cx, cy, r: R0, class: "eo-core" }, svg);
  S("text", { x: cx, y: cy - 16, class: "eo-c1", "text-anchor": "middle" }, svg, "Open core");
  S("text", { x: cx, y: cy + 8, class: "eo-c2", "text-anchor": "middle" }, svg, `${E.kinds.length} kinds`);
  S("text", { x: cx, y: cy + 26, class: "eo-c3", "text-anchor": "middle" }, svg, `${E.summary.validated} of ${E.summary.total}`);
  S("text", { x: cx, y: cy + 39, class: "eo-c3", "text-anchor": "middle" }, svg, "validated");

  const LAB = { v: "has validated ledger rows", m: "ledger rows are Modelled", u: "no ledger module matches it by name" };
  let cur = -1, ang = 0;
  function show(i) {
    if (cur >= 0) { kinds[cur].el.classList.remove("on"); (kinds[cur].lines || []).forEach((l) => l.classList.remove("on")); }
    cur = i; const x = kinds[i]; x.el.classList.add("on"); (x.lines || []).forEach((l) => l.classList.add("on"));
    const [px, py] = pol(RK, x.a); cursor.setAttribute("cx", px); cursor.setAttribute("cy", py);
    read.replaceChildren();
    const c = document.createElement("code"); c.textContent = x.k;
    const g = document.createElement("span"); g.className = "eo-g"; g.textContent = G[x.g];
    const st = document.createElement("span"); st.className = `eo-st ${x.st}`;
    st.textContent = x.tot ? `${x.v} of ${x.tot} ledger rows validated` : LAB.u;
    const by = document.createElement("span"); by.className = "eo-by";
    by.textContent = x.by ? x.by.map((e) => `${e.lab.replace(/^Pro: /, "Kshana Pro: ")} builds on it`).join(" · ") : "Free in the open core, like every kind";
    read.append(c, g, st, by);
  }
  // step round the ring, stopping on every kind that Pro or a study builds on
  const order = kinds.map((_, i) => i);
  let oi = kinds.findIndex((x) => x.by);
  show(Math.max(0, oi));
  let playing = !RM, visible = true, last = 0, acc = 0;
  const btn = $("#eoPlay");
  const setBtn = () => { btn.setAttribute("aria-pressed", String(playing)); btn.setAttribute("aria-label", playing ? "Pause the rings" : "Play the rings"); };
  btn.addEventListener("click", () => { playing = !playing; setBtn(); });
  setBtn();
  if (RM) { btn.hidden = true; return; }
  function frame(ts) {
    requestAnimationFrame(frame);
    const dt = Math.min(0.1, (ts - (last || ts)) / 1000); last = ts;
    if (!playing || !visible) return;
    acc += dt;
    const hold = kinds[cur] && kinds[cur].by ? 2.8 : 0.9;
    if (acc > hold) { acc = 0; oi = (oi + 1) % order.length; show(order[oi]); }
  }
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { visible = es[es.length - 1].isIntersecting && !document.hidden; }).observe(svg);
  document.addEventListener("visibilitychange", () => { visible = !document.hidden; });
  requestAnimationFrame(frame);
}
