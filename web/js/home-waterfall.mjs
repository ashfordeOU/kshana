// Home · L-band console: the spectrum kind's waterfall, replayed from a real engine run.
// Data: assets/waterfall/home-waterfall.json, written by src/tools/gen_waterfall.py from
// l-band-waterfall-jamming.toml (and the campaign it drives). Nothing here is synthesised: every
// cell, C/N0, J/S and lock state is the engine's. Self-contained: no imports but the message helper (t.mjs), no shared state.
import { t, ready } from "./t.mjs";
await ready(); // the page's first catalogue is loaded before text is built
const root = document.getElementById("lband");
if (root) boot();

function boot() {
  const start = () => fetch("assets/waterfall/home-waterfall.json").then((r) => { if (!r.ok) throw new Error(r.status); return r.json(); }).then((d) => init(d)).catch((e) => {
    const n = root.querySelector(".lb-nojs"); if (n) n.textContent = t("js-site-waterfall-load-failed", "The recorded run could not be loaded. The engine's report below shows the same run.");
    console.warn("L-band console:", e);
  });
  if (!("IntersectionObserver" in window)) { start(); return; }
  const io = new IntersectionObserver((es) => { if (es.some((e) => e.isIntersecting)) { io.disconnect(); start(); } }, { rootMargin: "800px 0px" });
  io.observe(root);
}

const RM = matchMedia("(prefers-reduced-motion: reduce)");
const ROWS_PER_S = 4;          // playback: four one-second rows per second of wall time
const HOLD_S = 3;              // pause on the complete frame before the replay starts again
const ROWPX = 4;               // offscreen rows are repeated so row edges stay crisp when scaled
const GAP = 14, GL = 46, GR = 8, GT = 6, GB = 22;
// Perceptual ramps, monotonic in lightness (readable under colour-vision deficiency): viridis in
// the dark theme, a light-to-dark blue-green-violet ramp in the light theme.
const RAMP_DARK = ["#151C48", "#3B2F7A", "#3B528B", "#21918C", "#5EC962", "#FDE725"];
const RAMP_LIGHT = ["#E3E9F5", "#BFDCD3", "#6CC3A8", "#2A8C8C", "#33508A", "#3A0E5C"];
const GAMMA = 0.35;            // spreads the weak jammers (a few dB above the floor) across the ramp

// DOM builder: strings become text nodes, so no markup is ever parsed from data.
function el(tag, cls, ...kids) {
  const e = document.createElement(tag);
  if (cls) e.className = cls;
  for (const k of kids) if (k != null) e.append(k);
  return e;
}

function init(D) {
  const $ = (s) => root.querySelector(s);
  const scope = $("#lbScope"), wrap = $(".lb-canvas-wrap"), chips = $("#lbChips"), tip = $("#lbTip");
  const cv = document.createElement("canvas");
  cv.setAttribute("aria-hidden", "true");
  wrap.prepend(cv);
  const ctx = cv.getContext("2d");
  const N = D.t.length, thr = D.thr, above = D.peak - D.floor;
  const fmt = (x, n = 1) => (x == null ? "–" : Number(x).toFixed(n));
  const tLab = (s) => t("js-site-waterfall-run-time", "run T+{ $s } s", { s: String(Math.round(s)).padStart(2, "0") });

  // ---------------------------------------------------------------- derived, all from the run
  let col0 = 0;
  const segs = D.segs.map((s) => { const g = { ...s, cols: D.f.slice(col0, col0 + s.n), c0: col0 }; col0 += s.n; return g; });
  const bands = D.bands.map((b, i) => {
    const lostAt = b.st.indexOf("X");
    let rec = -1; if (lostAt >= 0) for (let k = lostAt; k < N; k++) if (b.st[k] === "L") { rec = k; break; }
    return { ...b, i, lostAt, rec, seg: segs.findIndex((s) => b.fc >= s.lo && b.fc <= s.hi) };
  });
  const state = (b, k) => (b.st[k] === "X" ? "lost" : b.lostAt >= 0 && k > b.lostAt ? "rec" : "ok");
  const STATE_TXT = { get ok() { return t("js-site-waterfall-state-ok", "Tracking"); }, get lost() { return t("js-site-waterfall-state-lost", "Lost lock"); }, get rec() { return t("js-site-waterfall-state-rec", "Recovered"); } };
  const STATE_LOW = { get ok() { return t("js-site-waterfall-state-ok-low", "tracking"); }, get lost() { return t("js-site-waterfall-state-lost-low", "lost lock"); }, get rec() { return t("js-site-waterfall-state-rec-low", "recovered"); } };
  const SHORT_TXT = { get ok() { return t("js-site-waterfall-short-ok", "track"); }, get lost() { return t("js-site-waterfall-short-lost", "lost"); }, get rec() { return t("js-site-waterfall-short-rec", "recov."); } };
  const chirp = D.jammers.find((j) => j.waveform === "chirp");
  const onsetEnd = D.campaign.phases[0].t1;
  const phaseAt = (ts) => (ts < onsetEnd ? 0 : chirp && chirp.off != null && ts < chirp.off ? 1 : 2);
  const short = (j) => (j.waveform === "chirp" ? t("js-site-waterfall-wave-chirp", "chirp") : j.waveform === "cw" ? t("js-site-waterfall-wave-cw", "CW tone") : t("js-site-waterfall-wave-noise", "noise"));
  // Rows where a window shows nothing above the noise floor. Satellite signals sit below the floor,
  // so such a stretch is an empty-looking rectangle; the draw labels it from the run (quietNote).
  const quiet = segs.map((s) => D.psd.map((row) => { for (let i = 0; i < s.n; i++) if (row[s.c0 + i] > 0) return false; return true; }));
  const marks = [];
  for (const j of D.jammers) {
    const seg = segs.findIndex((s) => j.fc >= s.lo && j.fc <= s.hi);
    marks.push({ row: j.on / D.step_s, seg, get txt() { return t("js-site-waterfall-jammer-on", "{ $what } on", { what: short(j) }); } });
    if (j.off != null) marks.push({ row: j.off / D.step_s, seg, get txt() { return t("js-site-waterfall-jammer-off", "{ $what } off", { what: short(j) }); } });
  }

  // ---------------------------------------------------------------- static text from the data
  const E = D.engine, S = D.spectrum, C = D.campaign;
  $("#lbSrc").replaceChildren(t("js-site-waterfall-engine-build", "Engine v{ $version } · build", { version: E.version }), " ", el("code", "", E.commit), " · ", el("code", "", `${S.file}.toml`), " · ", S.seed != null ? t("js-site-waterfall-seed", "seed { $seed }", { seed: S.seed }) : t("js-site-waterfall-no-seed", "deterministic, no seed"));
  $("#lbSrcC").replaceChildren(el("b", "", t("js-site-waterfall-campaign-drives", "Campaign it drives:")), " ", el("code", "", `${C.file}.toml`), " · ", t("js-site-waterfall-campaign-seed", "seed { $seed } · { $phases } phases over { $duration } s", { seed: C.seed, phases: C.phases.length, duration: C.duration_s }));
  $("#lbSrcS").replaceChildren(el("code", "", `${S.file}.toml`), ` · SHA-256 ${S.sha256.slice(0, 12)}…`);
  $("#lbTitleFile").textContent = `${S.file}.toml · ` + t("js-site-waterfall-seed", "seed { $seed }", { seed: S.seed });
  const ph = C.phases;
  const P = [
    { c: "var(--lime)", h: t("js-site-waterfall-onset-head", "Onset · { $t0 }–{ $t1 } s", { t0: ph[0].t0, t1: ph[0].t1 }), p: t("js-site-waterfall-onset-text", "All { $n } bands tracking, until the spectrum run first loses { $band } at { $s } s.", { n: bands.length, band: bands[0].name, s: bands[0].first_loss }) },
    { c: "var(--coral)", h: t("js-site-waterfall-holdover-head", "Holdover · { $s } s, chirp on", { s: ph[1].t1 - ph[1].t0 }), p: t("js-site-waterfall-holdover-text", "{ $band0 } { $v0 }, { $band1 } { $v1 } dB-Hz, under the floor. The clock free-runs: worst { $worst } ns against a { $guard } ns guard.", { band0: bands[0].name, v0: fmt(ph[1].ca_dbhz), band1: bands[1].name, v1: fmt(ph[1].e1_dbhz), worst: fmt(ph[1].te_max_ns, 2), guard: C.guard_ns }) },
    { c: "var(--cyan)", h: t("js-site-waterfall-fallback-head", "Galileo fallback · { $s } s, CW tone only", { s: ph[2].t1 - ph[2].t0 }), p: t("js-site-waterfall-fallback-text", "{ $band } back at { $v } dB-Hz. Integrity monitoring on Galileo alone: protection level { $min }–{ $max } m, under the { $limit } m alert limit.", { band: bands[1].name, v: fmt(ph[2].e1_dbhz), min: fmt(ph[2].pl_min_m), max: fmt(ph[2].pl_max_m), limit: C.al_m }) },
  ];
  const phEls = P.map((x) => { const li = el("li", "", el("b", "", x.h), x.p); li.style.setProperty("--c", x.c); return li; });
  $("#lbPhases").replaceChildren(...phEls);
  // A text version of the whole run for screen readers, one clause per band.
  $("#lbSummary").textContent = t("js-site-waterfall-summary-rows", "{ $n } rows of { $step } s.", { n: N, step: D.step_s }) + " " + bands.map((b) => b.lostAt < 0
    ? t("js-site-waterfall-summary-tracks", "{ $band } tracks throughout, lowest { $min } dB-Hz.", { band: b.name, min: fmt(b.min) })
    : b.rec >= 0
      ? t("js-site-waterfall-summary-recovers", "{ $band } loses lock at { $lost } s and recovers at { $rec } s, lowest { $min } dB-Hz.", { band: b.name, lost: D.t[b.lostAt], rec: D.t[b.rec], min: fmt(b.min) })
      : t("js-site-waterfall-summary-stays-lost", "{ $band } loses lock at { $lost } s and stays lost, lowest { $min } dB-Hz.", { band: b.name, lost: D.t[b.lostAt], min: fmt(b.min) })).join(" ");

  // side-panel bars, one per band in the result (E6 is not modelled, so it is never listed)
  const bars = $("#lbBars");
  const barEls = bands.map((b) => {
    const fill = el("i"), mark = el("u"), v = el("span", "v"), st = el("span", "st");
    mark.style.setProperty("--f", `${(thr / 50) * 100}%`);
    const li = el("li", "", el("span", "nm", b.name), el("span", "lb-bar", fill, mark), v, st);
    li.addEventListener("click", () => pin(pinned === b.i ? null : b.i));
    bars.append(li);
    return { li, fill, v, st };
  });
  $("#lbFloorTxt").textContent = t("js-site-waterfall-floor", "{ $thr } dB-Hz tracking floor", { thr });
  $("#lbMax").textContent = `+${Math.round(above)} dB`;
  $("#lbScaleCap").textContent = t("js-site-waterfall-scale-caption", "PSD above the { $floor } dBW/Hz floor · { $bin } MHz × { $step } s cells", { floor: fmt(D.floor), bin: D.bin_mhz, step: D.step_s });

  // band chips over their frequency windows
  const chipEls = [];
  const segEls = segs.map((s, si) => {
    const box = el("div", "lb-seg");
    for (const b of bands.filter((x) => x.seg === si)) {
      const btn = el("button", "lb-chip", b.name);
      btn.type = "button"; btn.setAttribute("aria-pressed", "false");
      btn.dataset.full = b.name; btn.dataset.short = b.name.replace(/^(GPS|Galileo) /, ""); btn.dataset.tiny = btn.dataset.short.split(" ")[0];
      btn.setAttribute("aria-label", t("js-site-waterfall-chip-aria", "{ $band }, { $fc } megahertz: show this band", { band: b.name, fc: b.fc }));
      btn.title = t("js-site-waterfall-chip-title", "{ $band } · { $fc } MHz · receiver bandwidth { $bw } MHz", { band: b.name, fc: b.fc, bw: b.bw });
      btn.addEventListener("click", () => pin(pinned === b.i ? null : b.i));
      box.append(btn); chipEls[b.i] = btn;
    }
    chips.append(box);
    return box;
  });

  // ---------------------------------------------------------------- theme-dependent paint
  let ramp = RAMP_DARK, imgs = [];
  const css = {};
  const hex = (h) => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16));
  const lerpRamp = (x) => {
    const r = ramp.map(hex), p = Math.min(0.9999, Math.max(0, x)) * (r.length - 1), i = Math.floor(p), f = p - i;
    return r[i].map((c, k) => Math.round(c + (r[i + 1][k] - c) * f));
  };
  const valT = (tenths) => Math.pow(Math.min(1, tenths / (above * 10)), GAMMA);
  function paintTheme() {
    const cs = getComputedStyle(document.documentElement);
    const dark = /dark/.test(cs.colorScheme || cs.getPropertyValue("color-scheme"));
    ramp = dark ? RAMP_DARK : RAMP_LIGHT;
    for (const k of ["ink", "ink-2", "ink-3", "line-2", "panel-solid", "cyan", "bg-2"]) css[k] = cs.getPropertyValue(`--${k}`).trim();
    imgs = segs.map((s) => {
      // Two copies of the run, newest row on top: the replay in progress over the tail of the
      // previous pass, so the scope is always full and scrolls like a live monitor.
      const o = document.createElement("canvas"); o.width = s.n; o.height = 2 * N * ROWPX;
      const c = o.getContext("2d"), im = c.createImageData(s.n, 2 * N * ROWPX);
      for (let rep = 0; rep < 2; rep++) for (let k = 0; k < N; k++) for (let i = 0; i < s.n; i++) {
        const rgb = lerpRamp(valT(D.psd[k][s.c0 + i]));
        for (let y = 0; y < ROWPX; y++) { const o4 = (((rep * N + N - 1 - k) * ROWPX + y) * s.n + i) * 4; im.data[o4] = rgb[0]; im.data[o4 + 1] = rgb[1]; im.data[o4 + 2] = rgb[2]; im.data[o4 + 3] = 255; }
      }
      c.putImageData(im, 0, 0);
      return o;
    });
    $("#lbRamp").style.background = `linear-gradient(90deg,${Array.from({ length: 11 }, (_, i) => `rgb(${lerpRamp(Math.pow(i / 10, GAMMA)).join(",")})`).join(",")})`;
  }

  // ---------------------------------------------------------------- layout
  let W = 0, H = 0, PW = 0, PH = 0, rowH = 1, L = [];
  function layout() {
    const r = cv.getBoundingClientRect(); W = r.width || wrap.clientWidth; H = r.height || wrap.clientHeight;
    const dpr = Math.min(3, window.devicePixelRatio || 1);
    cv.width = Math.max(1, Math.round(W * dpr)); cv.height = Math.max(1, Math.round(H * dpr));
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    PW = Math.max(60, W - GL - GR - GAP * (segs.length - 1)); PH = Math.max(40, H - GT - GB); rowH = PH / N;
    // widths in proportion to each window's MHz span, with a floor so a narrow window stays usable
    const span = segs.map((s) => s.hi - s.lo), tot = span.reduce((a, b) => a + b, 0), minW = Math.min(76, PW / segs.length);
    let ws = span.map((x) => (x / tot) * PW);
    if (ws.some((w) => w < minW)) {
      const give = ws.reduce((a, w) => a + Math.max(0, minW - w), 0), big = ws.reduce((a, w) => a + (w >= minW ? w : 0), 0);
      ws = ws.map((w) => (w < minW ? minW : w - (give * w) / big));
    }
    let x = GL; L = segs.map((s, i) => { const o = { x, w: ws[i], cw: ws[i] / s.n }; x += ws[i] + GAP; return o; });
    segEls.forEach((box, i) => {
      box.style.left = `${L[i].x}px`; box.style.width = `${L[i].w}px`;
      const bs = [...box.children];
      bs.forEach((b) => (b.textContent = b.dataset.full));
      if (box.scrollWidth > box.clientWidth + 1) bs.forEach((b) => (b.textContent = b.dataset.short));
      if (box.scrollWidth > box.clientWidth + 1) bs.forEach((b) => (b.textContent = b.dataset.tiny));
      box.style.justifyContent = box.scrollWidth > box.clientWidth + 1 ? "flex-start" : "center";
    });
  }
  // frequency to x through the column centres (the image is drawn column by column)
  function f2x(si, f) {
    const c = segs[si].cols, g = L[si];
    let i = 0; while (i < c.length - 2 && f > c[i + 1]) i++;
    const d = c[i + 1] - c[i] || D.bin_mhz;
    return g.x + (i + 0.5 + (f - c[i]) / d) * g.cw;
  }

  // ---------------------------------------------------------------- draw
  let tn = N, hold = 0, hover = null, pinned = null;
  function roundRect(x, y, w, h, r) { ctx.beginPath(); ctx.moveTo(x + r, y); ctx.arcTo(x + w, y, x + w, y + h, r); ctx.arcTo(x + w, y + h, x, y + h, r); ctx.arcTo(x, y + h, x, y, r); ctx.arcTo(x, y, x + w, y, r); ctx.closePath(); }
  function draw() {
    ctx.clearRect(0, 0, W, H);
    const vis = Math.min(N, tn), y0 = GT;
    ctx.font = "500 10px 'Geist Mono', ui-monospace, monospace";
    ctx.textBaseline = "middle"; ctx.lineWidth = 1;
    segs.forEach((s, i) => {
      const g = L[i];
      ctx.fillStyle = css["bg-2"]; ctx.globalAlpha = 0.6; ctx.fillRect(g.x, y0, g.w, PH); ctx.globalAlpha = 1;
      ctx.imageSmoothingEnabled = true; ctx.drawImage(imgs[i], 0, (N - vis) * ROWPX, s.n, N * ROWPX, g.x, y0, g.w, PH);
      ctx.strokeStyle = css["line-2"]; ctx.strokeRect(g.x + 0.5, y0 + 0.5, g.w - 1, PH - 1);
    });
    // carriers: a thin dashed line at each band group's centre
    ctx.setLineDash([2, 4]); ctx.strokeStyle = css["ink-3"]; ctx.globalAlpha = 0.6;
    segs.forEach((s, i) => { const x = Math.round(f2x(i, s.fc)) + 0.5; ctx.beginPath(); ctx.moveTo(x, y0); ctx.lineTo(x, y0 + PH); ctx.stroke(); });
    ctx.setLineDash([]); ctx.globalAlpha = 1;
    // the band on show: its receiver bandwidth as brackets at the top and bottom edges
    const sb = shownBand();
    if (sb != null) {
      const b = bands[sb], g = L[b.seg];
      const a = Math.max(g.x + 1, f2x(b.seg, b.fc - b.bw / 2)), z = Math.min(g.x + g.w - 1, f2x(b.seg, b.fc + b.bw / 2));
      ctx.strokeStyle = css.cyan; ctx.lineWidth = 2;
      ctx.beginPath(); ctx.moveTo(a, y0 + 7); ctx.lineTo(a, y0 + 1); ctx.lineTo(z, y0 + 1); ctx.lineTo(z, y0 + 7); ctx.stroke();
      ctx.beginPath(); ctx.moveTo(a, y0 + PH - 7); ctx.lineTo(a, y0 + PH - 1); ctx.lineTo(z, y0 + PH - 1); ctx.lineTo(z, y0 + PH - 7); ctx.stroke();
      ctx.lineWidth = 1;
    }
    // jammer switch events, riding down with their rows
    for (const m of marks) {
      if (m.seg < 0) continue;
      const y = y0 + (m.row <= vis ? vis - m.row : vis - m.row + N) * rowH, g = L[m.seg];
      if (y < y0 || y > y0 + PH - 2) continue;
      ctx.strokeStyle = css.ink; ctx.globalAlpha = 0.75; ctx.setLineDash([3, 3]);
      ctx.beginPath(); ctx.moveTo(g.x, Math.round(y) + 0.5); ctx.lineTo(g.x + g.w, Math.round(y) + 0.5); ctx.stroke();
      ctx.setLineDash([]); ctx.globalAlpha = 1;
      const tw = ctx.measureText(m.txt).width + 10;
      if (tw + 6 < g.w && y - 16 >= y0) {
        ctx.fillStyle = css["panel-solid"]; ctx.globalAlpha = 0.94; roundRect(g.x + 4, y - 16, tw, 14, 4); ctx.fill(); ctx.globalAlpha = 1;
        ctx.fillStyle = css.ink; ctx.textAlign = "left"; ctx.fillText(m.txt, g.x + 9, y - 9);
      }
    }
    segs.forEach((s, i) => quietNote(i, vis, y0));
    // where the replay restarted: the rows below it are the previous pass
    if (vis < N && vis * rowH > 18) {
      const y = Math.round(y0 + vis * rowH) + 0.5;
      ctx.strokeStyle = css.cyan; ctx.lineWidth = 1.5; ctx.beginPath(); ctx.moveTo(GL, y); ctx.lineTo(W - GR, y); ctx.stroke(); ctx.lineWidth = 1;
    }
    // inspected cell
    if (hover) {
      const g = L[hover.si], x = g.x + (hover.ci + 0.5) * g.cw, y = y0 + (rowsAbove(hover.k) + 0.5) * rowH;
      ctx.strokeStyle = css.ink; ctx.lineWidth = 1.5;
      ctx.strokeRect(Math.round(g.x + hover.ci * g.cw) + 0.5, Math.round(y - rowH / 2) + 0.5, Math.max(4, Math.round(g.cw) - 1), Math.max(4, Math.round(rowH) - 1));
      ctx.lineWidth = 1; ctx.globalAlpha = 0.4; ctx.beginPath(); ctx.moveTo(x, y0); ctx.lineTo(x, y0 + PH); ctx.moveTo(GL, y); ctx.lineTo(W - GR, y); ctx.stroke(); ctx.globalAlpha = 1;
    }
    // time axis: seconds before now, fixed and in order top to bottom (rows are one step each);
    // run time is in the panel header, and the restart line marks where the replay began
    ctx.fillStyle = css["ink-3"]; ctx.textAlign = "right";
    ctx.fillText(t("js-site-waterfall-axis-now", "now"), GL - 8, y0 + 5);
    for (let s = 10; s < N; s += 10) {
      const y = y0 + (s / D.step_s) * rowH;
      if (y > y0 + PH - 8) continue;
      ctx.fillText(`\u2212${s} s`, GL - 8, y);
      ctx.strokeStyle = css["ink-3"]; ctx.beginPath(); ctx.moveTo(GL - 5, Math.round(y) + 0.5); ctx.lineTo(GL - 1, Math.round(y) + 0.5); ctx.stroke();
    }
    // frequency axis (MHz), per window, with break marks between windows
    ctx.textAlign = "center";
    segs.forEach((s, i) => {
      const g = L[i];
      const step = [5, 10, 20, 50].find((st) => (g.w / (s.hi - s.lo)) * st >= 44) || 50;
      for (let f = Math.ceil(s.lo / step) * step; f <= s.hi; f += step) {
        const x = f2x(i, f); if (x < g.x + 12 || x > g.x + g.w - 12) continue;
        ctx.fillStyle = css["ink-3"]; ctx.fillText(String(f), x, y0 + PH + 13);
        ctx.strokeStyle = css["ink-3"]; ctx.beginPath(); ctx.moveTo(Math.round(x) + 0.5, y0 + PH); ctx.lineTo(Math.round(x) + 0.5, y0 + PH + 4); ctx.stroke();
      }
      if (i < segs.length - 1) {
        const bx = g.x + g.w + GAP / 2, yy = y0 + PH + 9; ctx.strokeStyle = css["ink-3"]; ctx.lineWidth = 1.2;
        ctx.beginPath(); ctx.moveTo(bx - 4, yy + 4); ctx.lineTo(bx - 1, yy - 4); ctx.moveTo(bx + 1, yy + 4); ctx.lineTo(bx + 4, yy - 4); ctx.stroke(); ctx.lineWidth = 1;
      }
    });
    ctx.textAlign = "right"; ctx.fillStyle = css["ink-3"]; ctx.fillText("MHz", GL - 8, y0 + PH + 13);
    panel();
  }

  // The longest stretch of on-screen rows in window si with nothing above the floor gets a quiet
  // label, centred in that stretch only, so it can never cover jammer energy. The wording comes from
  // the run: the jammer list and each band's C/N0 and lock state at the stretch's newest row.
  function quietNote(si, vis, y0) {
    const g = L[si], q = quiet[si];
    // rows in screen order, newest first: this pass (vis-1 … 0), then the previous one (N-1 … ceil(vis));
    // a row's top sits (vis-1-k) rows below the top edge (plus N for the previous pass). A run never
    // crosses the restart line between the two passes.
    const vc = Math.ceil(vis), order = [];
    for (let k = vc - 1; k >= 0; k--) order.push([k, vis - 1 - k, 0]);
    for (let k = N - 1; k >= vc; k--) order.push([k, vis - 1 - k + N, 1]);
    let best = null, run = null;
    for (const [k, p, pass] of order) {
      if (q[k] && run && run.pass === pass) run.p1 = p + 1;
      else run = q[k] ? { k, pass, p0: p, p1: p + 1 } : null;
      if (run) { const a = Math.max(0, run.p0), z = Math.min(N, run.p1); if (!best || z - a > best.z - best.a) best = { k: run.k, a, z }; }
    }
    if (!best) return;
    // keep clear of the jammer-event labels above a quiet stretch and of the restart line below it
    const top = y0 + best.a * rowH + (best.a > 0.01 ? 20 : 6), bot = y0 + best.z * rowH - (best.z < N - 0.01 ? 8 : 6);
    const maxW = g.w - 14; if (maxW < 56 || bot - top < 30) return;
    const inBand = bands.filter((b) => b.seg === si);
    const jam = D.jammers.some((j) => j.fc >= segs[si].lo && j.fc <= segs[si].hi && (j.on / D.step_s) <= best.k && (j.off == null || j.off / D.step_s > best.k));
    if (jam) return; // a jammer is on but under the floor: not an empty band, say nothing
    const head = t("js-site-waterfall-no-jammer-band", "No jammer in this band");
    const SANS = "500 11px 'Geist', ui-sans-serif, system-ui, sans-serif", MONO = "500 10px 'Geist Mono', ui-monospace, monospace";
    const wrap = (txt, font) => { ctx.font = font; const out = []; let cur = ""; for (const w of txt.split(" ")) { const tryL = cur ? `${cur} ${w}` : w; if (!cur || ctx.measureText(tryL).width <= maxW) cur = tryL; else { out.push(cur); cur = w; } } if (cur) out.push(cur); return out; };
    const lines = [];
    for (const l of wrap(head, SANS)) lines.push({ t: l, f: SANS, c: css.ink });
    for (const l of wrap(t("js-site-waterfall-below-floor", "signals sit below the noise floor"), MONO)) lines.push({ t: l, f: MONO, c: css["ink-2"] });
    const extra = [];
    for (const b of inBand) for (const l of wrap(t("js-site-waterfall-quiet-band", "{ $band } { $cn0 } dB-Hz · { $state }", { band: b.name, cn0: fmt(b.cn0[best.k]), state: STATE_LOW[state(b, best.k)] }), MONO)) extra.push({ t: l, f: MONO, c: css["ink-2"], gap: !extra.length });
    const LH = 14, room = bot - top - 12;
    let all = lines.concat(extra);
    if (all.length * LH + 4 > room) all = lines;
    if (all.length * LH > room) all = lines.slice(0, Math.max(1, Math.floor(room / LH)));
    if (!all.length || all.some((l) => { ctx.font = l.f; return ctx.measureText(l.t).width > maxW; })) return;
    let bw = 0; for (const l of all) { ctx.font = l.f; bw = Math.max(bw, ctx.measureText(l.t).width); }
    const h = all.length * LH + (all.some((l) => l.gap) ? 4 : 0) + 10, cx = g.x + g.w / 2, cy = (top + bot) / 2;
    ctx.fillStyle = css["panel-solid"]; ctx.globalAlpha = 0.72; roundRect(cx - bw / 2 - 7, cy - h / 2, bw + 14, h, 6); ctx.fill(); ctx.globalAlpha = 1;
    ctx.textAlign = "center"; ctx.textBaseline = "middle";
    let y = cy - h / 2 + 5 + LH / 2;
    for (const l of all) { if (l.gap) y += 4; ctx.font = l.f; ctx.fillStyle = l.c; ctx.fillText(l.t, cx, y); y += LH; }
    ctx.font = MONO;
  }

  // ---------------------------------------------------------------- side panel and phases
  const rowsAbove = (k) => { const v = Math.min(N, tn); return k < v ? v - k - 1 : v - k - 1 + N; };
  const curRow = () => (hover ? hover.k : Math.max(0, Math.min(N - 1, Math.ceil(Math.min(N, tn)) - 1)));
  function bandsAtCol(si, ci) {
    const f = segs[si].cols[ci], h = D.bin_mhz / 2;
    return bands.filter((b) => b.seg === si && f + h >= b.fc - b.bw / 2 && f - h <= b.fc + b.bw / 2);
  }
  function shownBand() {
    if (pinned != null) return pinned;
    if (hover) { const bs = bandsAtCol(hover.si, hover.ci); if (bs.length) return bs[0].i; }
    return null;
  }
  const cssColor = (s) => (s === "lost" ? "var(--coral)" : s === "rec" ? "var(--cyan)" : "var(--lime)");
  let lastKey = "";
  function panel() {
    const k = curRow(), sb = shownBand();
    const worst = bands.reduce((a, b) => (b.cn0[k] < a.cn0[k] ? b : a), bands[0]);
    const b = sb != null ? bands[sb] : worst;
    const key = `${k}|${b.i}|${sb != null}|${pinned}`;
    if (key === lastKey) return; lastKey = key;
    const s = state(b, k);
    $("#lbWho").textContent = sb != null ? (pinned != null ? t("js-site-waterfall-who-selected", "Selected band") : t("js-site-waterfall-who-cursor", "Band under the cursor")) : t("js-site-waterfall-who-worst", "Worst band");
    $("#lbT").textContent = tLab(D.t[k]);
    const big = $("#lbCn0"); big.firstChild.nodeValue = fmt(b.cn0[k]); big.style.setProperty("--c", cssColor(s));
    $("#lbBand").textContent = b.name;
    const st = $("#lbState"); st.dataset.s = s; st.textContent = STATE_TXT[s]; st.style.setProperty("--c", cssColor(s));
    $("#lbJs").textContent = b.js[k] == null ? t("js-site-waterfall-no-jammer-in-band", "no jammer in band") : `${fmt(b.js[k])} dB`;
    bands.forEach((x, i) => {
      const e = barEls[i], xs = state(x, k);
      e.fill.style.setProperty("--w", `${Math.max(1, Math.min(100, (x.cn0[k] / 50) * 100))}%`);
      e.fill.style.setProperty("--c", cssColor(xs));
      e.v.textContent = fmt(x.cn0[k]);
      e.st.textContent = SHORT_TXT[xs];
      e.li.title = x.js[k] == null ? t("js-site-waterfall-bar-title", "{ $band }: { $cn0 } dB-Hz, { $state }", { band: x.name, cn0: fmt(x.cn0[k]), state: STATE_LOW[xs] }) : t("js-site-waterfall-bar-title-js", "{ $band }: { $cn0 } dB-Hz, { $state }, J/S { $js } dB", { band: x.name, cn0: fmt(x.cn0[k]), state: STATE_LOW[xs], js: fmt(x.js[k]) });
      e.li.classList.toggle("sel", x.i === b.i);
    });
    const p = phaseAt(D.t[k]);
    phEls.forEach((li, i) => li.classList.toggle("on", i === p));
  }
  function pin(i) {
    pinned = i;
    chipEls.forEach((c, j) => c && c.setAttribute("aria-pressed", String(j === i)));
    lastKey = ""; draw();
  }

  // ---------------------------------------------------------------- tooltip and inspection
  const live = $("#lbLive");
  function hit(px, py) {
    const vis = Math.min(N, tn);
    const si = L.findIndex((g) => px >= g.x && px < g.x + g.w);
    if (si < 0 || py < GT || py >= GT + PH) return null;
    const ci = Math.min(segs[si].n - 1, Math.max(0, Math.floor((px - L[si].x) / L[si].cw)));
    let k = Math.floor(vis - (py - GT) / rowH);
    if (k < 0) k += N;
    if (k < 0 || k > N - 1) return null;
    return { si, ci, k };
  }
  function tipNodes(h) {
    const s = segs[h.si], f = s.cols[h.ci], v = D.psd[h.k][s.c0 + h.ci] / 10, bs = bandsAtCol(h.si, h.ci);
    const lo = Math.max(s.lo, f - D.bin_mhz / 2), hi = Math.min(s.hi, f + D.bin_mhz / 2);
    const out = [el("span", "tt-h", t("js-site-waterfall-tip-head", "{ $lo }–{ $hi } MHz · { $time }", { lo: fmt(lo), hi: fmt(hi), time: tLab(D.t[h.k]) }))];
    out.push(v < 0.05 ? t("js-site-waterfall-tip-at-floor", "At the thermal noise floor") : el("span", "", el("b", "", `+${fmt(v)} dB`), " ", t("js-site-waterfall-tip-above-floor", "above the noise floor")));
    for (const b of bs) out.push(el("span", "tt-b", el("b", "", b.name), " " + t("js-site-waterfall-tip-band", "{ $cn0 } dB-Hz · { $state }", { cn0: fmt(b.cn0[h.k]), state: STATE_LOW[state(b, h.k)] }) + (b.js[h.k] == null ? "" : " · " + t("js-site-waterfall-tip-js", "J/S { $js } dB", { js: fmt(b.js[h.k]) }))));
    if (!bs.length) out.push(el("span", "tt-b", t("js-site-waterfall-tip-no-band", "No modelled band's receiver bandwidth covers this column")));
    return out;
  }
  function showTip(h, px, py) {
    tip.replaceChildren(...tipNodes(h)); tip.classList.add("on");
    const sw = scope.clientWidth, tw = tip.offsetWidth, th = tip.offsetHeight, top = chips.offsetHeight;
    let x = px + 14, y = py + top + 14;
    if (x + tw > sw - 6) x = px - tw - 14;
    if (y + th > scope.clientHeight - 4) y = py + top - th - 12;
    tip.style.left = `${Math.max(4, x)}px`; tip.style.top = `${Math.max(4, y)}px`;
  }
  function inspect(h, px, py, say) {
    hover = h; lastKey = "";
    if (!h) { tip.classList.remove("on"); draw(); return; }
    showTip(h, px, py); draw();
    if (say) {
      const bs = bandsAtCol(h.si, h.ci);
      live.textContent = t("js-site-waterfall-live", "{ $freq } megahertz, { $time }: { $detail }", { freq: fmt(segs[h.si].cols[h.ci]), time: tLab(D.t[h.k]), detail: bs.map((b) => t("js-site-waterfall-live-band", "{ $band } { $cn0 } dB-Hz, { $state }", { band: b.name, cn0: fmt(b.cn0[h.k]), state: STATE_TXT[state(b, h.k)] })).join("; ") || t("js-site-waterfall-live-none", "no modelled band") });
    }
  }
  let hoverPause = false, sticky = false;
  const release = () => { sticky = false; hoverPause = false; inspect(null); loop(); };
  cv.addEventListener("pointermove", (e) => {
    if (e.pointerType !== "mouse" || sticky) return;
    const r = cv.getBoundingClientRect(), h = hit(e.clientX - r.left, e.clientY - r.top);
    hoverPause = !!h; inspect(h, e.clientX - r.left, e.clientY - r.top);
    if (!h) loop();
  });
  cv.addEventListener("pointerleave", (e) => { if (e.pointerType === "mouse" && !sticky) release(); });
  cv.addEventListener("pointerup", (e) => {
    if (e.pointerType === "mouse") return;
    // touch or pen: a tap pins the reading (and pauses) until a tap outside the rows
    const r = cv.getBoundingClientRect(), h = hit(e.clientX - r.left, e.clientY - r.top);
    if (!h) { release(); return; }
    sticky = true; hoverPause = true; inspect(h, e.clientX - r.left, e.clientY - r.top);
  });
  scope.addEventListener("keydown", (e) => {
    if (!["ArrowLeft", "ArrowRight", "ArrowUp", "ArrowDown", "Escape", "Home", "End"].includes(e.key)) return;
    e.preventDefault();
    if (e.key === "Escape") { release(); return; }
    const vis = Math.min(N, tn), top = Math.max(0, Math.ceil(vis) - 1);
    let h = hover || { si: segs.length - 1, ci: Math.floor(segs[segs.length - 1].n / 2), k: top };
    const flat = []; segs.forEach((s, si) => { for (let ci = 0; ci < s.n; ci++) flat.push([si, ci]); });
    let fi = flat.findIndex(([a, b]) => a === h.si && b === h.ci);
    if (hover) {
      if (e.key === "ArrowLeft") fi = Math.max(0, fi - 1);
      if (e.key === "ArrowRight") fi = Math.min(flat.length - 1, fi + 1);
      if (e.key === "Home") fi = 0;
      if (e.key === "End") fi = flat.length - 1;
      // time runs down the picture: Down steps to earlier rows, Up to later ones
      if (e.key === "ArrowDown") h = { ...h, k: Math.max(0, h.k - 1) };
      if (e.key === "ArrowUp") h = { ...h, k: Math.min(N - 1, h.k + 1) };
    }
    h = { ...h, si: flat[fi][0], ci: flat[fi][1] };
    sticky = true; hoverPause = true;
    const g = L[h.si];
    inspect(h, g.x + (h.ci + 0.5) * g.cw, GT + (rowsAbove(h.k) + 0.5) * rowH, true);
  });
  scope.addEventListener("blur", () => { if (sticky) release(); });

  // ---------------------------------------------------------------- playback
  const btn = $("#lbPlay"), icon = btn.querySelector("path");
  let userPaused = RM.matches, onScreen = true, raf = 0, last = 0;
  function setBtn() {
    btn.setAttribute("aria-label", userPaused ? t("js-site-waterfall-play", "Play the waterfall") : t("js-site-waterfall-pause", "Pause the waterfall"));
    icon.setAttribute("d", userPaused ? "M2 1l9 5-9 5z" : "M2.5 1h2.6v10H2.5zM6.9 1h2.6v10H6.9z");
  }
  btn.addEventListener("click", () => {
    userPaused = !userPaused; sticky = false; hoverPause = false; hover = null; tip.classList.remove("on");
    if (!userPaused && tn >= N) { tn = 0; hold = 0; }
    setBtn(); lastKey = ""; draw(); loop();
  });
  function frame(now) {
    raf = 0;
    if (!(!userPaused && onScreen && !hoverPause && !document.hidden)) return;
    const dt = Math.min(0.1, (now - (last || now)) / 1000); last = now;
    if (tn < N) tn = Math.min(N, tn + dt * ROWS_PER_S);
    else { hold += dt; if (hold >= HOLD_S) { tn = 0; hold = 0; } }
    draw();
    raf = requestAnimationFrame(frame);
  }
  function loop() {
    const go = !userPaused && onScreen && !hoverPause && !document.hidden;
    if (go && !raf) { last = 0; raf = requestAnimationFrame(frame); }
  }
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { onScreen = es[es.length - 1].isIntersecting; loop(); }).observe(scope);
  document.addEventListener("visibilitychange", loop);
  RM.addEventListener?.("change", () => { if (RM.matches) { userPaused = true; tn = N; setBtn(); lastKey = ""; draw(); } });

  // ---------------------------------------------------------------- theme and size
  const repaint = () => { paintTheme(); lastKey = ""; draw(); };
  new MutationObserver(repaint).observe(document.documentElement, { attributes: true, attributeFilter: ["data-theme"] });
  matchMedia("(prefers-color-scheme: dark)").addEventListener?.("change", repaint);
  const relayout = () => { layout(); if (hover) inspect(null); else draw(); };
  if ("ResizeObserver" in window) { const ro = new ResizeObserver(relayout); ro.observe(wrap); ro.observe(cv); }
  else addEventListener("resize", relayout);
  // Fonts change text widths (chips, labels): lay out again once they are in.
  document.fonts?.ready.then(relayout);

  paintTheme(); layout();
  // Reduced motion: the complete run as one static frame. Otherwise the replay starts from T+0.
  tn = RM.matches ? N : 0;
  setBtn();
  root.classList.add("lb-ready");
  draw(); loop();
}
