// The recorded kshana-mcp session as a stepped player: one component for Home (#assistant) and
// Developers (#mcp). Markup (ids mcpStage, mcpSteps, mcpLede, mcpStatus, mcpPlay, mcpPrev, mcpNext,
// inside a .mp root) is in the page; styles are the .mp block in site.css. The session is a real
// recording (src/tools/record_mcp_session.py -> src/data/mcp-session.json), passed in by the page.
// One step at a time: initialize -> tools/list -> validate_scenario -> run_scenario -> result.
// Each step shows the request and the reply's key fields; the recorded JSON sits behind "Show JSON".
import { fmt } from "../playground/lib/views.mjs";

const RM = matchMedia("(prefers-reduced-motion: reduce)").matches;
const SVGNS = "http://www.w3.org/2000/svg";
const $ = (s, r = document) => r.querySelector(s);
const clamp = (x, a = 0, b = 1) => Math.max(a, Math.min(b, x));
const el = (tag, cls, text) => { const e = document.createElement(tag); if (cls) e.className = cls; if (text != null) e.textContent = text; return e; };

export function mountPlayer(MCP) {
  const stage = $("#mcpStage"), stepList = $("#mcpSteps"), mpRoot = stage && stage.closest(".mp");
  if (!(stage && stepList && mpRoot && MCP)) return false;
  const clk = MCP.clocks.find((c) => c.role === "classical"), clkQ = MCP.clocks.find((c) => c.role === "quantum");
  $("#mcpLede").textContent = `Recorded ${MCP.recorded} · v${MCP.server.version} · standard input and output · protocol ${MCP.protocol} · exact messages only`;
  const json = (obj) => (typeof obj === "string" ? obj : JSON.stringify(obj, null, 2));
  const svg = (tag, attrs) => { const e = document.createElementNS(SVGNS, tag); for (const k in attrs) e.setAttribute(k, attrs[k]); return e; };
  // one key field: label + value
  const kv = (k, v, cls = "") => { const d = el("div", `mp-kv ${cls}`.trim()); d.append(el("span", "k", k), el("span", "v", v)); return d; };
  const msg = (dir, head, ...kids) => {
    const m = el("div", `mp-msg ${dir}`);
    const h = el("div", "mp-dir"); h.append(el("i"), el("span", "", dir === "req" ? "assistant → kshana-mcp" : "kshana-mcp → assistant"), el("b", "", head));
    m.append(h);
    if (kids.length) { const body = el("div", "mp-body"); body.append(...kids); m.append(body); }
    return m;
  };
  const showJson = (label, obj) => {
    const d = el("details", "mp-json"); const s = el("summary"); s.append(el("span", "", "Show JSON"), el("small", "", label)); d.append(s);
    const p = el("pre"); p.tabIndex = 0; p.setAttribute("aria-label", `Recorded JSON: ${label}`); p.append(el("code", "", json(obj))); d.append(p);
    return d;
  };
  const toml = `${MCP.tomlHead.join("\n")}\n… (${MCP.tomlLines - MCP.tomlHead.length} more lines of ${MCP.file})`;

  const tools = el("ul", "mp-tools");
  for (const t of MCP.tools) { const li = el("li"); li.append(el("code", "", t.name)); tools.append(li); }

  const fom = el("table", "mini mp-fom");
  fom.append(el("caption", "vh", "Figures of merit returned by run_scenario, per clock"));
  const hr = el("tr"); hr.append(el("th", "", "Figure of merit"), ...MCP.clocks.map((c) => el("th", "num", c.id))); fom.append(hr);
  for (const [k, lab] of [["holdover_s", "holdover (s)"], ["timing_p95_ns", "time error, 95th percentile (ns)"], ["timing_rms_ns", "time error, root mean square (ns)"], ["availability", "availability"]]) {
    const tr = el("tr"); tr.append(el("td", "", lab), ...MCP.clocks.map((c) => el("td", "num", fmt(c.fom[k])))); fom.append(tr);
  }
  const fig = el("figure", "mp-fig");
  const plot = el("div", "mp-plot"); plot.setAttribute("role", "img");
  plot.setAttribute("aria-label", `Time error of ${clkQ.id} and ${clk.id} returned by run_scenario, against the ${fmt(MCP.result.threshold_ns)} ns threshold; GNSS (global navigation satellite system) lost at ${fmt(clk.outage[0])} s`);
  fig.append(el("figcaption", "", "Drawn from the returned series: each clock's time error against the threshold"), plot);
  (() => {
    const all = MCP.clocks.flatMap((c) => c.series.map((p) => p[1]));
    const W = 520, H = 170, x1 = clk.series.at(-1)[0], y0 = Math.min(0, ...all), y1 = Math.max(...all, MCP.result.threshold_ns) * 1.08;
    const X = (x) => 6 + (x / x1) * (W - 12), Y = (y) => 8 + (1 - (y - y0) / (y1 - y0)) * (H - 16);
    const s = svg("svg", { viewBox: `0 0 ${W} ${H}`, class: "chart mini-chart", "aria-hidden": "true" });
    s.append(svg("rect", { class: "c-outage", x: X(clk.outage[0]).toFixed(1), y: 8, width: (X(clk.outage[1]) - X(clk.outage[0])).toFixed(1), height: H - 16 }));
    for (const k of [1, 2, 3]) { const y = (8 + k * (H - 16) / 4).toFixed(1); s.append(svg("line", { class: "c-grid", x1: 6, x2: W - 6, y1: y, y2: y })); }
    const yt = Y(MCP.result.threshold_ns).toFixed(1);
    s.append(svg("line", { class: "c-thr", x1: 6, x2: W - 6, y1: yt, y2: yt }));
    for (const [c, v] of [[clkQ, "--magenta"], [clk, "--cyan"]]) {
      s.append(svg("polyline", { fill: "none", "stroke-linejoin": "round", style: `stroke:var(${v});stroke-width:2`, points: c.series.map((p) => `${X(p[0]).toFixed(1)},${Y(p[1]).toFixed(1)}`).join(" ") }));
    }
    plot.append(s);
    // axis values, in HTML so they stay legible at any chart width
    const yl = (v, cls) => { const t = el("span", `mp-yl ${cls}`, `${fmt(v)} ns`); t.style.top = `${(Y(v) / H * 100).toFixed(1)}%`; t.setAttribute("aria-hidden", "true"); return t; };
    plot.append(yl(MCP.result.threshold_ns, "t"), yl(0, "z"));
    const ax = el("div", "mp-ax"); ax.setAttribute("aria-hidden", "true");
    ax.append(el("span", "", "0 s"), el("span", "", "mission time"), el("span", "", `${fmt(x1)} s`));
    fig.append(ax);
    const leg = el("p", "mp-leg");
    leg.append(el("span", "k-q", clkQ.id), el("span", "k-c", clk.id), el("span", "k-t", `threshold ${fmt(MCP.result.threshold_ns)} ns`), el("span", "k-o", `GNSS lost at ${fmt(clk.outage[0])} s`));
    fig.append(leg);
  })();
  const kind = (MCP.validate.match(/`([^`]+)`/) || [, "?"])[1];

  const steps = [
    { tab: "initialize", name: "initialize", body: [
      msg("req", "initialize", kv("protocolVersion", MCP.protocol)),
      msg("res", "server identity", kv("name", MCP.server.name, "hi"), kv("version", MCP.server.version, "hi")),
      showJson("serverInfo", { serverInfo: MCP.server }),
    ] },
    { tab: "tools/list", name: "tools/list", body: [
      msg("req", "tools/list"),
      msg("res", `${MCP.tools.length} tools`, tools),
      showJson(`${MCP.tools.length} tools with descriptions`, MCP.tools.map((t) => ({ name: t.name, description: t.does }))),
    ] },
    { tab: "validate", name: "validate_scenario", body: [
      msg("req", "validate_scenario", kv("scenario", MCP.file), kv("toml", `${MCP.tomlLines} lines`)),
      msg("res", "validate_scenario", kv("result", MCP.validate.split(":")[0], "ok"), kv("kind", kind, "hi")),
      showJson("arguments (excerpt)", { name: "validate_scenario", arguments: { toml } }),
    ] },
    { tab: "run", name: "run_scenario", body: [
      msg("req", "run_scenario", kv("scenario", MCP.file), kv("seed", String(MCP.result.seed))),
      msg("res", "run_scenario", kv("engine", MCP.result.engine_version, "hi"), kv("scenario hash", MCP.result.scenario_hash.slice(0, 12)), kv("threshold", `${fmt(MCP.result.threshold_ns)} ns`),
        ...MCP.clocks.map((c) => kv(`${c.id} holdover`, `${fmt(c.fom.holdover_s)} s`, c.role === "quantum" ? "hi q" : "hi c"))),
      showJson("summary line and result (excerpt)", `${MCP.summary}\n\n${json(MCP.result)}`),
    ] },
    { tab: "result", name: "result: figures of merit", body: (() => { const g = el("div", "mp-result"); const t = el("div", "mp-fomw"); t.append(fom); g.append(t, fig); return [g]; })() },
  ];

  // tabs (step dots) + panels
  const tabs = [], panels = [];
  steps.forEach((s, i) => {
    const b = el("button"); b.type = "button"; b.setAttribute("role", "tab");
    b.id = `mp-t${i}`; b.setAttribute("aria-controls", `mp-p${i}`);
    b.setAttribute("aria-selected", i === 0 ? "true" : "false"); b.tabIndex = i === 0 ? 0 : -1;
    b.setAttribute("aria-label", `Step ${i + 1} of ${steps.length}: ${s.name}`);
    b.append(el("span", "n", String(i + 1)), el("span", "l", s.tab), el("span", "pg"));
    tabs.push(b);
    const p = el("div", "mp-panel"); p.id = `mp-p${i}`; p.setAttribute("role", "tabpanel"); p.setAttribute("aria-labelledby", b.id); p.tabIndex = 0;
    p.hidden = i !== 0; p.append(...s.body); panels.push(p);
  });
  stepList.replaceChildren(...tabs);
  stage.replaceChildren(...panels);
  // fixed height = the tallest step at the current width (JSON folded), so no step scrolls and nothing jumps
  const fit = () => {
    stage.classList.add("mp-measure"); stage.style.height = "0px";
    let hMax = 0;
    for (const p of panels) { const was = p.hidden; p.hidden = false; hMax = Math.max(hMax, p.scrollHeight); p.hidden = was; }
    stage.classList.remove("mp-measure"); stage.style.height = `${Math.ceil(hMax) + 2}px`;
  };
  fit();
  if ("ResizeObserver" in window) { let lastW = 0; new ResizeObserver((es) => { const w = Math.round(es[0].contentRect.width); if (w !== lastW) { lastW = w; fit(); } }).observe(stage); }
  if (document.fonts && document.fonts.ready) document.fonts.ready.then(fit);

  const status = $("#mcpStatus"), play = $("#mcpPlay"), prev = $("#mcpPrev"), next = $("#mcpNext");
  const DWELL = 5200;
  mpRoot.style.setProperty("--mp-dwell", `${DWELL}ms`);
  let cur = 0, playing = false, timer = 0, userTouched = false;
  // aria-live is on only for a step change the viewer asked for, not for every autoplay tick
  const render = (i, announce) => {
    cur = i;
    tabs.forEach((t, k) => t.classList.toggle("past", k < i));
    status.setAttribute("aria-live", announce ? "polite" : "off");
    status.textContent = `Step ${i + 1} of ${steps.length} · ${steps[i].name}`;
    prev.disabled = i === 0; next.disabled = i === steps.length - 1;
  };
  const show = (i) => tabs.forEach((t, k) => { t.setAttribute("aria-selected", k === i ? "true" : "false"); t.tabIndex = k === i ? 0 : -1; panels[k].hidden = k !== i; });
  // roving focus, arrows, Home/End: the site's shared tab behaviour when present
  if (window.KStabs) window.KStabs(stepList, { onSelect: (t) => render(tabs.indexOf(t), !playing) });
  else tabs.forEach((t, i) => t.addEventListener("click", () => { show(i); render(i, true); }));
  const go = (i, announce) => { i = clamp(i, 0, steps.length - 1); show(i); render(i, announce); };
  const tick = () => {
    clearTimeout(timer);
    tabs.forEach((t) => t.classList.remove("run")); void tabs[cur].offsetWidth; tabs[cur].classList.add("run");
    timer = setTimeout(() => {
      if (!playing) return;
      if (cur >= steps.length - 1) { setPlaying(false); return; }
      go(cur + 1, false); tick();
    }, DWELL);
  };
  const setPlaying = (on) => {
    playing = on; clearTimeout(timer);
    if (!on) tabs.forEach((t) => t.classList.remove("run"));
    play.setAttribute("aria-pressed", on ? "true" : "false");
    play.querySelector("span").textContent = on ? "Pause" : "Play";
    mpRoot.classList.toggle("playing", on);
    if (on) tick();
  };
  // any direct use of the player stops the autoplay
  const stop = () => { userTouched = true; if (playing) setPlaying(false); };
  tabs.forEach((t) => { t.addEventListener("click", stop, true); t.addEventListener("keydown", (e) => { if (/^(Arrow|Home|End)/.test(e.key)) stop(); }, true); });
  stage.addEventListener("click", stop);
  prev.addEventListener("click", () => { stop(); go(cur - 1, true); });
  next.addEventListener("click", () => { stop(); go(cur + 1, true); });
  play.addEventListener("click", () => {
    userTouched = true;
    if (playing) { setPlaying(false); return; }
    if (cur >= steps.length - 1) go(0, false);
    setPlaying(true);
  });
  // keyboard focus inside the player (other than on Play) pauses it: a moving target is hard to read
  mpRoot.addEventListener("focusin", (e) => { if (e.target !== play && playing) stop(); });
  go(0, false);
  // autoplay once, when the player comes into view; never under reduced motion
  if (!RM && "IntersectionObserver" in window) {
    new IntersectionObserver((es) => {
      const vis = es[es.length - 1].isIntersecting;
      if (vis && !userTouched && !playing && cur < steps.length - 1) setPlaying(true);
      else if (!vis && playing) setPlaying(false);
    }, { threshold: 0.5 }).observe(mpRoot);
  }
  return true;
}
