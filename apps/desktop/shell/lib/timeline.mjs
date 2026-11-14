// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop shell: the timeline strip of a run (0.42 U7): the run's whole time span with
// the cursor, the selected range and the markers; play and pause, the speed, the time at the
// cursor. Drag on the strip scrubs, Shift-drag selects a range. One canvas, redrawn on each
// clock change (a few rectangles and lines).
import { clockText, speedText } from "./clock.mjs";
import { timeTicks } from "./plot.mjs";

export function createTimeline({ t = (id, en) => en, clock, style, epochMs = NaN, icon = () => null }) {
  const root = document.createElement("div");
  root.className = "lv-timeline";
  const mk = (tag, cls, text) => { const n = document.createElement(tag); if (cls) n.className = cls; if (text !== undefined) n.textContent = text; return n; };
  const play = mk("button", "lv-btn lv-play");
  play.type = "button";
  const speed = mk("button", "lv-btn lv-speed");
  speed.type = "button";
  speed.title = t("js-desk-tl-speed", "Playback speed (L faster forward, J faster back)");
  const now = mk("output", "lv-now");
  now.setAttribute("aria-live", "off");
  const strip = mk("div", "lv-strip");
  const cv = mk("canvas");
  strip.append(cv);
  strip.tabIndex = 0;
  strip.setAttribute("role", "slider");
  strip.setAttribute("aria-label", t("js-desk-tl-cursor", "Time cursor"));
  strip.title = t("js-desk-tl-strip", "Drag to move the cursor, Shift-drag to select a range");
  const rangeOut = mk("span", "lv-range");
  const clear = mk("button", "lv-btn lv-clear", "×");
  clear.type = "button";
  clear.title = t("js-desk-tl-clear", "Clear the range (Escape)");
  clear.setAttribute("aria-label", clear.title);
  const mark = mk("button", "lv-btn", "M");
  mark.type = "button";
  mark.title = t("js-desk-tl-mark", "Drop a marker at the cursor (M)");
  mark.setAttribute("aria-label", mark.title);
  const keys = mk("span", "lv-keys", t("js-desk-tl-keys", "Space play · J K L · ← → step · M mark · [ ] range"));
  root.append(play, speed, now, strip, rangeOut, clear, mark, keys);

  let W = 0, H = 0, dpr = 1, st = style();
  const pad = 8;
  const X = (x) => pad + ((x - clock.start) / (clock.end - clock.start || 1)) * (W - 2 * pad);
  const T = (px) => clock.start + ((px - pad) / (W - 2 * pad || 1)) * (clock.end - clock.start);
  function size() {
    const r = strip.getBoundingClientRect();
    dpr = globalThis.devicePixelRatio || 1;
    W = Math.max(10, Math.round(r.width)); H = Math.max(10, Math.round(r.height));
    if (cv.width !== W * dpr || cv.height !== H * dpr) { cv.width = W * dpr; cv.height = H * dpr; cv.style.width = `${W}px`; cv.style.height = `${H}px`; }
  }
  let sel = null;
  function draw(s = clock.snapshot()) {
    const g = cv.getContext("2d");
    g.setTransform(dpr, 0, 0, dpr, 0, 0);
    g.clearRect(0, 0, W, H);
    const mid = Math.round(H * 0.42);
    g.fillStyle = st.grid; g.fillRect(pad, mid - 2, W - 2 * pad, 4);
    const r = sel ? [Math.min(sel.a, sel.b), Math.max(sel.a, sel.b)] : s.range;
    if (r) { g.fillStyle = st.range; g.fillRect(X(r[0]), 2, X(r[1]) - X(r[0]), H - 4); g.fillStyle = st.track; g.fillRect(X(r[0]), mid - 2, X(r[1]) - X(r[0]), 4); }
    g.font = `10px ${st.mono}`; g.fillStyle = st.gridText; g.textBaseline = "bottom"; g.textAlign = "center";
    for (const v of timeTicks(s.start, s.end, Math.max(2, Math.floor(W / 120)), Number.isFinite(epochMs) ? epochMs / 1000 : 0)) {
      const x = Math.round(X(v)) + 0.5;
      g.fillRect(x - 0.5, mid + 4, 1, 4);
      g.fillText(clockText(v, { epochMs }), Math.min(W - 34, Math.max(34, x)), H - 1);
    }
    for (const m of s.marks) {
      const x = Math.round(X(m.t)) + 0.5;
      g.fillStyle = st.mark;
      g.beginPath(); g.moveTo(x - 4, 1); g.lineTo(x + 4, 1); g.lineTo(x, 8); g.fill();
      g.fillRect(x - 0.5, 1, 1, mid + 4);
    }
    const x = X(s.t);
    g.fillStyle = st.cursor; g.fillRect(Math.round(x) - 1, 0, 2, mid + 8);
    g.beginPath(); g.arc(x, mid, 5, 0, Math.PI * 2); g.fill();
  }
  let shownPlaying = null;
  function text(s) {
    if (shownPlaying !== s.playing) { shownPlaying = s.playing; playIcon(s); }
    speed.textContent = `${s.dir < 0 ? "◀ " : ""}${speedText(s.speed)}`;
    now.textContent = clockText(s.t, { epochMs, ms: false });
    strip.setAttribute("aria-valuemin", String(s.start)); strip.setAttribute("aria-valuemax", String(s.end)); strip.setAttribute("aria-valuenow", String(s.t));
    strip.setAttribute("aria-valuetext", now.textContent);
    rangeOut.textContent = s.range ? `${clockText(s.range[0], { epochMs })} – ${clockText(s.range[1], { epochMs })}` : t("js-desk-tl-no-range", "whole run");
    clear.hidden = !s.range;
  }
  function playIcon(s) {
    play.replaceChildren();
    const ico = icon(s.playing ? "pause" : "play");
    if (ico) play.append(ico);
    const label = s.playing ? t("js-desk-tl-pause", "Pause (Space)") : t("js-desk-tl-play", "Play (Space)");
    play.title = label; play.setAttribute("aria-label", label);
    if (!ico) play.textContent = s.playing ? "❚❚" : "▶";
  }
  play.addEventListener("click", () => clock.toggle());
  speed.addEventListener("click", (e) => {
    if (e.shiftKey) { clock.setSpeed(Math.max(0.25, clock.speed / 2)); return; }
    if (clock.playing) clock.shuttle(clock.dir); else clock.setSpeed(clock.speed * 2 > 7200 ? 0.25 : clock.speed * 2);
  });
  clear.addEventListener("click", () => clock.clearRange());
  mark.addEventListener("click", () => clock.toggleMark(clock.t));
  const px = (e) => e.clientX - strip.getBoundingClientRect().left;
  strip.addEventListener("pointerdown", (e) => {
    if (e.button !== 0) return;
    try { strip.setPointerCapture(e.pointerId); } catch { /* a synthetic pointer */ }
    if (e.shiftKey) { sel = { a: T(px(e)), b: T(px(e)) }; draw(); }
    else { clock.pause(); clock.seek(T(px(e)), "scrub"); }
    strip.dataset.drag = "1";
  });
  strip.addEventListener("pointermove", (e) => {
    if (!strip.dataset.drag) return;
    if (sel) { sel.b = T(px(e)); draw(); } else clock.seek(T(px(e)), "scrub");
  });
  const up = () => {
    delete strip.dataset.drag;
    if (sel) { const s = sel; sel = null; clock.setRange(s.a, s.b); }
  };
  strip.addEventListener("pointerup", up);
  strip.addEventListener("pointercancel", up);
  strip.addEventListener("keydown", (e) => {
    if (e.key === "Home") { e.preventDefault(); clock.seek(clock.range ? clock.range[0] : clock.start); }
    else if (e.key === "End") { e.preventDefault(); clock.seek(clock.range ? clock.range[1] : clock.end); }
  });
  const ro = typeof ResizeObserver === "function" ? new ResizeObserver(() => { size(); draw(); }) : null;
  if (ro) ro.observe(strip);
  const ctl = {
    el: root,
    setClock(s) { text(s); draw(s); },
    restyle() { st = style(); draw(); },
    resize() { size(); draw(); },
    destroy() { if (ro) ro.disconnect(); },
  };
  return ctl;
}
