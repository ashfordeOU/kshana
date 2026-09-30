// Developers (R4): the recorded kshana-mcp session as the same stepped player as Home's #assistant
// (one shared module, js/mcp-player.mjs; styles in site.css). The installer tabs, copy buttons and
// library tabs are site.js. Data: build.py page data (#kpage, from src/data/mcp-session.json);
// js/developers-data.mjs (src/tools/gen_developers_data.py) is kept only as a fallback.
import { mountPlayer } from "./mcp-player.mjs";
import GEN from "./developers-data.mjs";

let D = GEN;
try { const k = document.getElementById("kpage"); if (k) { const j = JSON.parse(k.textContent); if (j && j.mcp) D = j; } } catch (e) { /* keep the generated module */ }
mountPlayer(D.mcp || null);

// ================================================================== R5 hero instrument (was its own module; one file keeps the publish list under the host's limit)
{
// Developers hero (R5, 2026-09-29): a terminal replaying a real kshana session.
// Data: build.py page data "cli" (#kpage) = src/data/cli-session.json, written by
// src/tools/record_cli_session.py, which ran the engine's release binary on byte copies of bundled
// scenarios and kept every command, its output lines as printed, its exit code and its wall time.
// Nothing is typed here: the replay prints those lines. Reduced motion: the whole session at once.
// The channel chips under the terminal open the matching "Ways in" tab.
const $ = (s, r = document) => r.querySelector(s);
const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const win = $("#dtWin");
let C = null;
try { C = JSON.parse($("#kpage").textContent).cli; } catch (e) { C = null; }
if (win && C && C.steps && C.steps.length) init(C);

// channel chips: select the tab in the "Ways in" block, then scroll to it
for (const a of document.querySelectorAll(".dt-chip[data-way]")) {
  a.addEventListener("click", () => { const t = document.getElementById("wt-" + a.dataset.way); if (t) t.click(); });
}

function init(C) {
  const code = $("#dtCode"), term = $("#dtTerm");
  win.classList.add("ready");
  // provenance: engine, build, capture, and each scenario with its seed
  const pv = $("#dtProv"), src = document.createElement("span"); src.className = "prov-src";
  const cd = (t) => { const c = document.createElement("code"); c.textContent = t; return c; };
  src.append(`Engine v${C.engine.version}, build `, cd(C.engine.commit), ` · captured ${C.recorded} from `, cd(C.engine.binary), " · ");
  Object.entries(C.scenarios).forEach(([f, s], i) => { if (i) src.append(", "); src.append(cd(f), ` (${s.seed == null ? "deterministic, no seed" : "seed " + s.seed})`); });
  const more = document.createElement("a"); more.className = "prov-open"; more.href = "#cli"; more.textContent = "What every run writes";
  pv.append(src, more);

  const line = (cls, text) => { const s = document.createElement("span"); s.className = cls; s.textContent = text; return s; };
  const prompt = () => { const p = document.createElement("span"); p.className = "dt-l"; p.append(line("dt-ps", "$ ")); return p; };
  const stamp = (s) => line("dt-l dt-dim", `exit ${s.rc} · ${s.ms.toLocaleString("en-GB", { maximumFractionDigits: 1 })} ms`);
  const toBottom = () => { term.scrollTop = term.scrollHeight; };
  function full(upto = C.steps.length) {              // the session so far, as a static frame
    code.replaceChildren();
    for (const s of C.steps.slice(0, upto)) {
      const p = prompt(); p.append(line("dt-cmd", s.cmd)); code.append(p, "\n");
      for (const o of s.out) code.append(line("dt-l dt-out", o), "\n");
      code.append(stamp(s), "\n");
    }
    toBottom();
  }
  if (RM) { full(); term.scrollTop = 0; $("#dtPlay").hidden = true; return; }   // read from the top   // the complete frame; nothing moves

  let playing = true, visible = true, timer = 0, si = 0, phase = "type", ci = 0, oi = 0, cur = null;
  const sleep = (ms) => { timer = setTimeout(tick, ms); };
  function tick() {
    if (!playing || !visible) return;
    if (si >= C.steps.length) {                     // hold, then replay on: the terminal scrolls, it never blanks
      if (phase !== "hold") { phase = "hold"; return sleep(3200); }
      code.append(line("dt-l dt-dim", "# replaying the recorded session"), "\n");
      while (code.childNodes.length > 120) code.firstChild.remove();
      si = 0; phase = "type"; ci = 0; oi = 0; cur = null; return sleep(600);
    }
    const s = C.steps[si];
    if (phase === "type") {
      if (!cur) { cur = prompt(); cur.append(line("dt-cmd", ""), line("dt-caret", " ")); code.append(cur); }
      ci++; cur.querySelector(".dt-cmd").textContent = s.cmd.slice(0, ci); toBottom();
      if (ci >= s.cmd.length) { cur.querySelector(".dt-caret").remove(); code.append("\n"); phase = "out"; return sleep(380 + Math.min(900, s.ms * 4)); }
      return sleep(26 + Math.random() * 40);
    }
    if (phase === "out") {
      if (oi < s.out.length) { code.append(line("dt-l dt-out", s.out[oi]), "\n"); oi++; toBottom(); return sleep(260); }
      code.append(stamp(s), "\n"); toBottom();
      si++; phase = "type"; ci = 0; oi = 0; cur = null; return sleep(1300);
    }
  }
  function setupBtn(on) {
    const b = $("#dtPlay"); playing = on;
    const set = () => { b.setAttribute("aria-pressed", String(playing)); b.setAttribute("aria-label", playing ? "Pause the replay" : "Play the replay"); };
    b.addEventListener("click", () => {
      playing = !playing; set(); clearTimeout(timer);
      if (playing) tick();
    });
    set();
  }
  setupBtn(true);
  full(2); si = 2;                                   // open on the first two commands already run
  if ("IntersectionObserver" in window) new IntersectionObserver((es) => { const v = es[es.length - 1].isIntersecting && !document.hidden; if (v && !visible) { visible = true; clearTimeout(timer); tick(); } else visible = v; }).observe(term);
  document.addEventListener("visibilitychange", () => { const v = !document.hidden; if (v && !visible) { visible = true; clearTimeout(timer); tick(); } else visible = v; });
  sleep(500);
}
}
