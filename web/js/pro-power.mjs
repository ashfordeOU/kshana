// Kshana Pro section of Editions (#pro): readouts and switches over charts build.py drew from real
// Kshana Pro output (src/data/pro-power.json). Page data "editions".pro (#kpage): the front
// designs of each design study (with their free-engine re-run check) and the confidence band.
// Nothing is typed here; without this script every chart and figure is still on the page.
const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => [...r.querySelectorAll(s)];
let P = null;
try { P = JSON.parse($("#kpage").textContent).pro; } catch (e) { P = null; }
const root = $("#pro.pw");
if (root && P) init();
if (root) initTrio();

// ---- three more answers (#pro-ops): the switcher, campaign watch revisions, coexistence cells.
// Every readout is a string build.py wrote from the Pro output (data-reads); nothing is computed here.
function initTrio() {
  const tabs = $$("[data-pw3]", root), panels = $$("[data-pw3p]", root);
  if (!tabs.length) return;
  const pick = (i, focus) => {
    tabs.forEach((t, j) => { t.setAttribute("aria-selected", String(i === j)); t.tabIndex = i === j ? 0 : -1; });
    panels.forEach((p) => { p.hidden = +p.dataset.pw3p !== i; });
    if (focus) tabs[i].focus();
  };
  tabs.forEach((t, i) => {
    t.addEventListener("click", () => pick(i));
    t.addEventListener("keydown", (e) => {
      if (e.key === "ArrowRight" || e.key === "ArrowLeft") { e.preventDefault(); pick((i + (e.key === "ArrowRight" ? 1 : tabs.length - 1)) % tabs.length, true); }
    });
  });
  // a link to #pro-watch, #pro-coexist or #pro-jobs opens that panel
  const fromHash = () => {
    const id = decodeURIComponent(location.hash.slice(1));
    const k = panels.findIndex((p) => p.id === id);
    if (k < 0) return;
    pick(k);
    if (window.KSkeep) window.KSkeep(panels[k]); else panels[k].scrollIntoView({ block: "start" });
  };
  addEventListener("hashchange", fromHash);
  fromHash();

  const cw = $(".cw", root), cwRead = $("#pwWatchRead");
  if (cw && cwRead) {
    let reads = [];
    try { reads = JSON.parse(cw.dataset.reads); } catch (e) { reads = []; }
    $$("[data-cw-col]", cw).forEach((b) => b.addEventListener("click", () => {
      const i = b.dataset.cwCol;
      $$("[data-cw-col]", cw).forEach((x) => x.setAttribute("aria-pressed", String(x === b)));
      $$("[data-cw-cell]", cw).forEach((c) => c.classList.toggle("on", c.dataset.cwCell === i));
      if (reads[+i]) cwRead.innerHTML = reads[+i];
    }));
  }
  const cx = $(".cx", root), cxRead = $("#pwCoexistRead");
  if (cx && cxRead) {
    let reads = {};
    try { reads = JSON.parse(cx.dataset.reads); } catch (e) { reads = {}; }
    $$("[data-cx]", cx).forEach((b) => b.addEventListener("click", () => {
      $$("[data-cx]", cx).forEach((x) => x.classList.toggle("on", x === b));
      if (reads[b.dataset.cx]) cxRead.innerHTML = reads[b.dataset.cx];
    }));
  }
  $$("[data-cx-view]", root).forEach((b) => b.addEventListener("click", () => {
    $$("[data-cx-view]", root).forEach((x) => x.setAttribute("aria-pressed", String(x === b)));
    $$("[data-cx-panel]", root).forEach((x) => { x.hidden = x.dataset.cxPanel !== b.dataset.cxView; });
  }));
}

function fmt(x, d = 4) {
  if (Number.isInteger(x)) return x.toLocaleString("en-GB");
  return (+x.toFixed(d)).toLocaleString("en-GB", { maximumFractionDigits: d });
}
// Fill a readout from [text, tag?, class?] parts, with text nodes only (no markup strings).
function put(el, parts) {
  el.replaceChildren(...parts.map((p) => {
    if (typeof p === "string") return document.createTextNode(p);
    const n = document.createElement(p[1] || "b");
    if (p[2]) n.className = p[2];
    n.textContent = p[0];
    return n;
  }));
}

function init() {
  // ---- design optimiser: region switch and the front-design readout
  const read = $("#pwFrontRead");
  let region = 0;
  const show = (ri, pi) => {
    const pt = P.design[ri].points[pi];
    const d = pt.designs[0];
    const more = pt.designs.length > 1 ? ` (+${pt.designs.length - 1} more front design${pt.designs.length > 2 ? "s" : ""} at this point)` : "";
    put(read, [[`Front design ${d.id}${d.knee ? " · knee" : ""}`], `${more} · ${fmt(pt.sat)} satellites, ${fmt(pt.av)} % availability · ` +
      `${fmt(d.v.planes)} planes at ${fmt(d.v.altitude_km)} km, ${fmt(d.v.inclination_deg)}° · re-run in the free engine: `,
      d.free ? [d.sha ? `same SHA-256 ${d.sha.slice(0, 8)}…` : "same result SHA-256 as the index", "span", "ok"] : "not re-run"]);
    $$(".pw-pt", root).forEach((c) => c.classList.toggle("on", c.dataset.pwPt === `${ri}:${pi}`));
  };
  const kneeOf = (ri) => P.design[ri].points.findIndex((p) => p.designs.some((d) => d.knee));
  $$("[data-pw-region-btn]", root).forEach((b) => b.addEventListener("click", () => {
    region = +b.dataset.pwRegionBtn;
    $$("[data-pw-region-btn]", root).forEach((x) => x.setAttribute("aria-pressed", String(x === b)));
    $$("[data-pw-region]", root).forEach((x) => { x.hidden = +x.dataset.pwRegion !== region; });
    $$("[data-pw-region-cap]", root).forEach((x) => { x.hidden = +x.dataset.pwRegionCap !== region; });
    show(region, kneeOf(region));
  }));
  $$(".pw-pt", root).forEach((c) => {
    const [ri, pi] = c.dataset.pwPt.split(":").map(Number);
    const go = () => show(ri, pi);
    c.addEventListener("pointerenter", go);
    c.addEventListener("focus", go);
    c.addEventListener("click", go);
    c.addEventListener("keydown", (e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); go(); } });
  });
  show(0, kneeOf(0));

  // ---- uncertainty: tabs, the output switch, the band scrubber
  const tabs = $$("[data-pw-tab]", root);
  const pick = (i, focus) => {
    tabs.forEach((t, j) => { t.setAttribute("aria-selected", String(i === j)); t.tabIndex = i === j ? 0 : -1; });
    $$("[data-pw-tabp]", root).forEach((p) => { p.hidden = +p.dataset.pwTabp !== i; });
    if (focus) tabs[i].focus();
  };
  tabs.forEach((t, i) => {
    t.addEventListener("click", () => pick(i));
    t.addEventListener("keydown", (e) => {
      if (e.key === "ArrowRight" || e.key === "ArrowLeft") { e.preventDefault(); pick((i + (e.key === "ArrowRight" ? 1 : tabs.length - 1)) % tabs.length, true); }
    });
  });
  $$("[data-pw-out-btn]", root).forEach((b) => b.addEventListener("click", () => {
    $$("[data-pw-out-btn]", root).forEach((x) => x.setAttribute("aria-pressed", String(x === b)));
    $$("[data-pw-out]", root).forEach((x) => { x.hidden = x.dataset.pwOut !== b.dataset.pwOutBtn; });
  }));

  const B = P.band, g = B.geo, svg = $("#pwBand svg"), hit = svg && $("[data-pw-hit]", svg), sc = svg && $("[data-pw-scrub]", svg);
  if (!svg || !hit || !sc) return;
  const tEnd = B.t[B.t.length - 1];
  const X = (t) => g.L + (t / tEnd) * (g.w - g.L - g.R);
  const Y = (v) => g.T + (1 - (v + g.ym) / (2 * g.ym)) * (g.H1 - g.T);
  const SY = (v) => g.S0 + (1 - v) * (g.S1 - g.S0);
  const bread = $("#pwBandRead");
  const line = sc.querySelector("line");
  const [dp, ds] = sc.querySelectorAll("circle");
  const at = (i, text) => {
    const x = X(B.t[i]);
    line.setAttribute("x1", x); line.setAttribute("x2", x);
    dp.setAttribute("cx", x); dp.setAttribute("cy", Y(B.p50[i]));
    ds.setAttribute("cx", x); ds.setAttribute("cy", SY(B.share[i]));
    if (text) put(bread, [`At ${fmt(B.t[i] / 60, 1)} minutes: 5th to 95th percentile `, [`${fmt(B.p05[i], 1)} to ${fmt(B.p95[i], 1)} ${B.unit}`], " · ",
      [`${fmt(B.share[i] * 100, 2)} %`], ` of ${fmt(B.n)} runs within ±${fmt(B.limit)} ${B.unit}`]);
  };
  const near = (ev) => {
    const r = svg.getBoundingClientRect();
    const vx = ((ev.clientX - r.left) / r.width) * g.w;
    const t = Math.max(0, Math.min(tEnd, ((vx - g.L) / (g.w - g.L - g.R)) * tEnd));
    let best = 0;
    for (let i = 0; i < B.t.length; i++) if (Math.abs(B.t[i] - t) < Math.abs(B.t[best] - t)) best = i;
    return best;
  };
  hit.addEventListener("pointermove", (e) => at(near(e), true));
  hit.addEventListener("pointerdown", (e) => at(near(e), true));
  at(B.t.length - 1, false);
  sc.style.display = "";   // the build's own readout (the final probability) stays until the pointer moves
}
