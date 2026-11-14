// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): the interactive 3D chart, a small hand-written WebGL2
// renderer (no library; the reasons are in apps/desktop/README.md, "Charts"). Layers:
//
//   { kind: "line",   pts: [x,y,z,...], values?, map?, domain?, color?, label, unit, t?, rows?(i) }   a trajectory, coloured by value
//   { kind: "points", pts, values?|colors?|color, size, label, unit, t?, rows?(i) }                 a 3D scatter
//   { kind: "ellipsoid", centre, cov, k, color, label, alpha }                                      a covariance ellipsoid (k-sigma)
//   { kind: "surface", xs, ys, z (rows over ys), map, domain, label, unit }                        a surface from a grid, picked per node
//   { kind: "sphere", r, centre?, color, alpha }                                                   a wireframe sphere (an Earth outline)
//   { kind: "segments", pts (pairs), color, alpha }                                                any line segments
//
// Data coordinates are mapped into the display box ("cube": each axis to ±1; "equal": one
// scale for all three, for positions in space). The axes are the box's edges with ticks and
// labels in data units. Interaction: drag rotates, Shift- or right-drag pans, the wheel zooms,
// double-click or 0 resets, F fits; arrows rotate (Shift: pan), + and − zoom; hover shows the
// exact values of the nearest point (projected with the same matrix that draws it), a click
// pins it; CSV saves the pickable data, PNG the view. Without WebGL2 the chart says so and
// keeps the data table.
import * as M from "./mat3d.mjs";
import { niceTicks, fmtTick, fmtValue, fmtClock } from "./scale.mjs";
import { themeOf, resolveColour, rampRGB, norm, parseColour, rgbCss } from "./colour.mjs";
import { toCSV, colName } from "./export.mjs";
import { saveBlob } from "./chart2d.mjs";
import { brushHas } from "./link.mjs";

const h = (tag, props = {}, ...kids) => {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (v === undefined || v === null || v === false) continue;
    if (k === "class") n.className = v;
    else if (k === "text") n.textContent = v;
    else if (k.startsWith("on")) n.addEventListener(k.slice(2), v);
    else n.setAttribute(k, v === true ? "" : v);
  }
  for (const c of kids.flat()) if (c !== null && c !== undefined && c !== false) n.append(c.nodeType ? c : document.createTextNode(String(c)));
  return n;
};
const reducedMotion = () => typeof matchMedia === "function" && matchMedia("(prefers-reduced-motion: reduce)").matches;
const raf = typeof requestAnimationFrame === "function" ? requestAnimationFrame : (f) => setTimeout(f, 16);
const unitSp = (u) => (u ? ` ${u}` : "");

const VS_FLAT = `#version 300 es
in vec3 aPos; in vec4 aCol; uniform mat4 uMVP; uniform float uSize;
out vec4 vCol;
void main(){ gl_Position = uMVP * vec4(aPos,1.0); gl_PointSize = uSize; vCol = aCol; }`;
const FS_FLAT = `#version 300 es
precision mediump float; in vec4 vCol; uniform float uRound; out vec4 o;
void main(){ if(uRound>0.5){ vec2 d=gl_PointCoord-vec2(0.5); if(dot(d,d)>0.25) discard; } o = vCol; }`;
const VS_LIT = `#version 300 es
in vec3 aPos; in vec4 aCol; in vec3 aNor; uniform mat4 uMVP;
out vec4 vCol; out vec3 vNor;
void main(){ gl_Position = uMVP * vec4(aPos,1.0); vCol = aCol; vNor = aNor; }`;
const FS_LIT = `#version 300 es
precision mediump float; in vec4 vCol; in vec3 vNor; uniform vec3 uLight; uniform float uAlpha; out vec4 o;
void main(){ float k = 0.42 + 0.58*abs(dot(normalize(vNor), uLight)); o = vec4(vCol.rgb*k, vCol.a*uAlpha); }`;

function program(gl, vs, fs) {
  const mk = (type, src) => { const s = gl.createShader(type); gl.shaderSource(s, src); gl.compileShader(s); if (!gl.getShaderParameter(s, gl.COMPILE_STATUS)) throw new Error(gl.getShaderInfoLog(s)); return s; };
  const p = gl.createProgram();
  gl.attachShader(p, mk(gl.VERTEX_SHADER, vs)); gl.attachShader(p, mk(gl.FRAGMENT_SHADER, fs));
  gl.bindAttribLocation(p, 0, "aPos"); gl.bindAttribLocation(p, 1, "aCol"); gl.bindAttribLocation(p, 2, "aNor");
  gl.linkProgram(p);
  if (!gl.getProgramParameter(p, gl.LINK_STATUS)) throw new Error(gl.getProgramInfoLog(p));
  return p;
}

export function createChart3D(host, spec0 = {}) {
  let S = { aspect: "cube", ...spec0 };
  const pins = [];
  let cam = M.camera(S.camera), home = cam, hover = null, drag = null, brush = null;
  let W = 0, H = 0, T = null, mvp = M.I4(), box = null, items = [], gl = null, progs = null, queued = false, err = "";
  const listeners = {};
  const emit = (ev, d) => (listeners[ev] || []).forEach((f) => { try { f(d); } catch (e) { console.error(e); } });

  const titleId = `k3-${Math.random().toString(36).slice(2, 8)}`;
  const btn = (label, title, onclick) => h("button", { type: "button", class: "kc-btn", title, "aria-label": title, onclick }, label);
  const glc = h("canvas", { class: "kc-base", "aria-hidden": "true" });
  const over = h("canvas", { class: "kc-over", tabindex: "0", role: "img" });
  const tip = h("div", { class: "kc-tip", "aria-hidden": "true", hidden: true });
  const live = h("p", { class: "kc-vh", "aria-live": "polite" });
  const msg = h("p", { class: "kc-msg", hidden: true });
  const stage = h("div", { class: "kc-stage" }, glc, over, tip, msg);
  const tableBox = h("div", { class: "kc-tablebox" });
  const details = h("details", { class: "kc-table" }, h("summary", { text: "Data table" }), tableBox);
  const legend = h("div", { class: "kc-legend", role: "group", "aria-label": "Layers" });
  const titleEl = h("span", { class: "kc-title", id: titleId, text: S.title || "" });
  const subEl = h("span", { class: "kc-sub", text: S.subtitle || "" });
  const tools = h("div", { class: "kc-tools", role: "toolbar", "aria-label": "Chart tools" },
    btn("⟲", "Reset the view (double-click, 0)", () => reset(true)), btn("Fit", "Fit the data (F)", () => fitAll(true)),
    btn("CSV", "Save the data as CSV", () => saveBlob(new Blob([api.toCSV()], { type: "text/csv" }), `${slug()}.csv`)),
    btn("PNG", "Save the view as PNG", () => api.toPNG().then((b) => b && saveBlob(b, `${slug()}.png`))));
  const fig = h("figure", { class: "kc kc-3d", role: "group", "aria-labelledby": titleId }, h("header", { class: "kc-head" }, titleEl, subEl, tools), legend, stage, details, live);
  if (S.height) stage.style.height = `${S.height}px`;
  host.append(fig);
  const ctx = over.getContext("2d");
  const slug = () => String(S.title || "chart-3d").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 60);
  const hidden = new Set();

  try {
    gl = glc.getContext("webgl2", { antialias: true, preserveDrawingBuffer: true, premultipliedAlpha: false });
    if (!gl) throw new Error("WebGL2 is not available on this machine's graphics driver.");
    progs = { flat: program(gl, VS_FLAT, FS_FLAT), lit: program(gl, VS_LIT, FS_LIT) };
  } catch (e) {
    err = e.message || String(e); gl = null;
    msg.textContent = `The 3D view needs WebGL2: ${err} The data table below has the values.`; msg.hidden = false;
  }

  // ---------------------------------------------------------------- data → buffers
  function colourOf(c, a = 1) { const p = parseColour(resolveColour(c, T, fig)) || [200, 200, 200, 1]; return [p[0] / 255, p[1] / 255, p[2] / 255, (p[3] ?? 1) * a]; }
  function build() {
    T = themeOf(fig);
    for (const it of items) for (const b of it.bufs || []) gl && gl.deleteBuffer(b);
    // the box: data bounds of every layer except spheres drawn for context (which count when equal)
    const all = [];
    for (const L of S.layers || []) {
      if (L.kind === "surface") { for (let j = 0; j < L.ys.length; j++) for (let i = 0; i < L.xs.length; i++) { const v = zAt(L, i, j); if (v === v) all.push(L.xs[i], L.ys[j], v); } }
      else if (L.kind === "ellipsoid") { const m = M.ellipsoidMesh(L.centre, L.cov, L.k ?? 1, 12, 8); all.push(...m.positions); }
      else if (L.kind === "sphere") { const r = L.r, c = L.centre || [0, 0, 0]; all.push(c[0] - r, c[1] - r, c[2] - r, c[0] + r, c[1] + r, c[2] + r); }
      else if (L.pts) for (let k = 0; k < L.pts.length; k++) all.push(L.pts[k]);
    }
    const bb = S.bounds || M.bounds(all);
    box = { bounds: bb, map: M.boxMap(bb, S.aspect) };
    const to = box.map.to;
    items = (S.layers || []).map((L, li) => {
      const it = { L, id: L.id || `l${li}`, label: L.label || L.kind, kind: L.kind, pick: null, bufs: [] };
      const flat = (pts) => { const o = new Float32Array(pts.length); for (let i = 0; i + 2 < pts.length; i += 3) { const q = to([pts[i], pts[i + 1], pts[i + 2]]); o[i] = q[0]; o[i + 1] = q[1]; o[i + 2] = q[2]; } return o; };
      const valCol = (vals, map, dom, n, fallback) => {
        const out = new Float32Array(n * 4);
        const d = dom || (vals ? [Math.min(...vals.filter((v) => v === v)), Math.max(...vals.filter((v) => v === v))] : null);
        for (let i = 0; i < n; i++) {
          const rgb = vals ? rampRGB(map || "viridis", norm(vals[i], d[0], d[1])) : null;
          const c = rgb ? [rgb[0] / 255, rgb[1] / 255, rgb[2] / 255, 1] : fallback;
          out.set(c, i * 4);
        }
        return { cols: out, domain: d };
      };
      if (L.kind === "line" || L.kind === "points" || L.kind === "segments" || L.kind === "sphere") {
        const pts = L.kind === "sphere" ? M.sphereWire(L.r, L.centre || [0, 0, 0], L.lat ?? 9, L.lon ?? 12) : L.pts;
        const n = pts.length / 3;
        const base = colourOf(L.color || (L.kind === "sphere" ? "ink3" : "tim"), L.alpha ?? 1);
        const { cols, domain } = L.colors ? { cols: Float32Array.from(L.colors.flatMap((c) => colourOf(c))), domain: null } : valCol(L.values, L.map, L.domain, n, base);
        it.domain = domain; it.n = n; it.world = flat(pts); it.cols = cols;
        if (L.kind === "line" || L.kind === "points") it.pick = it.world;
      } else if (L.kind === "ellipsoid") {
        const m = M.ellipsoidMesh(L.centre, L.cov, L.k ?? 1, 28, 16);
        const c = colourOf(L.color || "pro", 1);
        it.world = flat(m.positions); it.nor = new Float32Array(m.normals.length);
        for (let i = 0; i < m.normals.length; i += 3) { const n = [m.normals[i] / box.map.scale[0], m.normals[i + 1] / box.map.scale[1], m.normals[i + 2] / box.map.scale[2]]; const l = Math.hypot(...n) || 1; it.nor.set([n[0] / l, n[1] / l, n[2] / l], i); } it.idx = Uint32Array.from(m.indices);
        it.cols = new Float32Array((m.positions.length / 3) * 4); for (let i = 0; i < it.cols.length; i += 4) it.cols.set(c, i);
        it.alpha = L.alpha ?? 0.28; it.axes = m.axes; it.values = m.values;
        // the ellipsoid's centre and the ends of its axes are pickable
        const ends = [L.centre]; m.axes.forEach((a) => ends.push([L.centre[0] + a[0], L.centre[1] + a[1], L.centre[2] + a[2]]));
        it.pick = flat(ends.flat()); it.pickData = ends;
      } else if (L.kind === "surface") {
        const m = M.surfaceMesh(L.xs, L.ys, L.z);
        const zs = []; for (let k = 2; k < m.positions.length; k += 3) zs.push(m.positions[k]);
        const { cols, domain } = valCol(zs, L.map || "viridis", L.domain, zs.length, colourOf("tim"));
        it.domain = domain; it.world = flat(m.positions); it.nor = new Float32Array(m.normals.length);
        for (let i = 0; i < m.normals.length; i += 3) { const n = [m.normals[i] / box.map.scale[0], m.normals[i + 1] / box.map.scale[1], m.normals[i + 2] / box.map.scale[2]]; const l = Math.hypot(...n) || 1; it.nor.set([n[0] / l, n[1] / l, n[2] / l], i); }
        it.idx = Uint32Array.from(m.indices); it.cols = cols; it.alpha = L.alpha ?? 1; it.pick = it.world; it.n = zs.length;
      }
      if (gl && it.world) {
        const buf = (data, target = gl.ARRAY_BUFFER) => { const b = gl.createBuffer(); gl.bindBuffer(target, b); gl.bufferData(target, data, gl.STATIC_DRAW); it.bufs.push(b); return b; };
        it.bPos = buf(it.world); it.bCol = buf(it.cols);
        if (it.nor) it.bNor = buf(it.nor);
        if (it.idx) it.bIdx = buf(it.idx, gl.ELEMENT_ARRAY_BUFFER);
        if (it.kind === "line" && brush && it.L.t) { /* brushed epochs are drawn as points, below */ }
      }
      return it;
    });
    axisSegments();
    drawLegend();
  }
  const zAt = (L, i, j) => (Array.isArray(L.z[0]) || ArrayBuffer.isView(L.z[0]) ? L.z[j][i] : L.z[j * L.xs.length + i]);

  // the box edges and ticks, in world coordinates (labels are drawn on the 2D layer)
  let axes = null;
  function axisSegments() {
    const [mn, mx] = box.bounds, to = box.map.to;
    const seg = [];
    const E = (a, b) => seg.push(...to(a), ...to(b));
    // three axes along the near-bottom edges, plus the floor rectangle
    E([mn[0], mn[1], mn[2]], [mx[0], mn[1], mn[2]]); E([mn[0], mn[1], mn[2]], [mn[0], mx[1], mn[2]]); E([mn[0], mn[1], mn[2]], [mn[0], mn[1], mx[2]]);
    E([mx[0], mn[1], mn[2]], [mx[0], mx[1], mn[2]]); E([mn[0], mx[1], mn[2]], [mx[0], mx[1], mn[2]]);
    const ticks = [0, 1, 2].map((k) => niceTicks(mn[k], mx[k], 5));
    const labels = [];
    ticks[0].ticks.forEach((v) => { if (v < mn[0] || v > mx[0]) return; const a = [v, mn[1], mn[2]]; E(a, [v, mx[1], mn[2]]); labels.push({ p: to([v, mn[1] - (mx[1] - mn[1]) * 0.06, mn[2]]), text: fmtTick(v, ticks[0].step), axis: 0 }); });
    ticks[1].ticks.forEach((v) => { if (v < mn[1] || v > mx[1]) return; E([mn[0], v, mn[2]], [mx[0], v, mn[2]]); labels.push({ p: to([mn[0] - (mx[0] - mn[0]) * 0.06, v, mn[2]]), text: fmtTick(v, ticks[1].step), axis: 1 }); });
    ticks[2].ticks.forEach((v) => { if (v < mn[2] || v > mx[2]) return; E([mn[0], mn[1], v], [mn[0] - (mx[0] - mn[0]) * 0.03, mn[1], v]); labels.push({ p: to([mn[0] - (mx[0] - mn[0]) * 0.07, mn[1], v]), text: fmtTick(v, ticks[2].step), axis: 2 }); });
    const ax = [S.x, S.y, S.z].map((a, k) => (a ? [a.label, a.unit ? `(${a.unit})` : ""].filter(Boolean).join(" ") || "xyz"[k] : "xyz"[k]));
    labels.push({ p: to([(mn[0] + mx[0]) / 2, mn[1] - (mx[1] - mn[1]) * 0.16, mn[2]]), text: ax[0], title: true });
    labels.push({ p: to([mn[0] - (mx[0] - mn[0]) * 0.16, (mn[1] + mx[1]) / 2, mn[2]]), text: ax[1], title: true });
    labels.push({ p: to([mn[0] - (mx[0] - mn[0]) * 0.1, mn[1], mx[2] + (mx[2] - mn[2]) * 0.08]), text: ax[2], title: true });
    const cols = new Float32Array((seg.length / 3) * 4), c = colourOf("ink3", 0.7);
    for (let i = 0; i < cols.length; i += 4) cols.set(c, i);
    if (axes && gl) for (const b of axes.bufs) gl.deleteBuffer(b);
    axes = { world: new Float32Array(seg), cols, labels, bufs: [] };
    if (gl) {
      const b1 = gl.createBuffer(); gl.bindBuffer(gl.ARRAY_BUFFER, b1); gl.bufferData(gl.ARRAY_BUFFER, axes.world, gl.STATIC_DRAW);
      const b2 = gl.createBuffer(); gl.bindBuffer(gl.ARRAY_BUFFER, b2); gl.bufferData(gl.ARRAY_BUFFER, cols, gl.STATIC_DRAW);
      axes.bPos = b1; axes.bCol = b2; axes.bufs = [b1, b2];
    }
  }

  // ---------------------------------------------------------------- drawing
  function layout() {
    const r = stage.getBoundingClientRect();
    W = Math.max(120, Math.round(r.width)); H = Math.max(100, Math.round(r.height));
    const dpr = Math.min(3, (typeof devicePixelRatio === "number" && devicePixelRatio) || 1);
    for (const c of [glc, over]) { if (c.width !== Math.round(W * dpr)) c.width = Math.round(W * dpr); if (c.height !== Math.round(H * dpr)) c.height = Math.round(H * dpr); c.style.width = `${W}px`; c.style.height = `${H}px`; }
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
    mvp = M.viewProj(cam, W / H);
  }
  function bindAttr(loc, buf, size) { gl.bindBuffer(gl.ARRAY_BUFFER, buf); gl.enableVertexAttribArray(loc); gl.vertexAttribPointer(loc, size, gl.FLOAT, false, 0, 0); }
  function drawGL() {
    if (!gl) return;
    gl.viewport(0, 0, glc.width, glc.height);
    const bg = parseColour(T.bg) || [12, 14, 24, 1];
    gl.clearColor(bg[0] / 255, bg[1] / 255, bg[2] / 255, 1);
    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
    gl.enable(gl.DEPTH_TEST); gl.enable(gl.BLEND); gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    const dpr = glc.width / W;
    const flat = progs.flat;
    gl.useProgram(flat);
    gl.uniformMatrix4fv(gl.getUniformLocation(flat, "uMVP"), false, new Float32Array(mvp));
    const uSize = gl.getUniformLocation(flat, "uSize"), uRound = gl.getUniformLocation(flat, "uRound");
    gl.disableVertexAttribArray(2);
    if (axes && axes.bPos) { bindAttr(0, axes.bPos, 3); bindAttr(1, axes.bCol, 4); gl.uniform1f(uRound, 0); gl.drawArrays(gl.LINES, 0, axes.world.length / 3); }
    for (const it of items) {
      if (hidden.has(it.id) || !it.bPos || it.idx) continue;
      bindAttr(0, it.bPos, 3); bindAttr(1, it.bCol, 4);
      if (it.kind === "points") { gl.uniform1f(uSize, (it.L.size ?? 4) * dpr); gl.uniform1f(uRound, 1); gl.drawArrays(gl.POINTS, 0, it.n); }
      else if (it.kind === "line") {
        gl.uniform1f(uRound, 0); gl.drawArrays(gl.LINE_STRIP, 0, it.n);
        gl.uniform1f(uSize, 2.5 * dpr); gl.uniform1f(uRound, 1); gl.drawArrays(gl.POINTS, 0, it.n);
      } else { gl.uniform1f(uRound, 0); gl.drawArrays(gl.LINES, 0, it.world.length / 3); }
    }
    // meshes: opaque first, then translucent without depth writes
    const lit = progs.lit;
    gl.useProgram(lit);
    gl.uniformMatrix4fv(gl.getUniformLocation(lit, "uMVP"), false, new Float32Array(mvp));
    const e = M.eyeOf(cam), l = [e[0] - cam.target[0], e[1] - cam.target[1], e[2] - cam.target[2] + cam.dist * 0.6], ll = Math.hypot(...l) || 1;
    gl.uniform3f(gl.getUniformLocation(lit, "uLight"), l[0] / ll, l[1] / ll, l[2] / ll);
    const uA = gl.getUniformLocation(lit, "uAlpha");
    for (const pass of [0, 1]) {
      for (const it of items) {
        if (hidden.has(it.id) || !it.idx || (it.alpha < 1) !== !!pass) continue;
        bindAttr(0, it.bPos, 3); bindAttr(1, it.bCol, 4); bindAttr(2, it.bNor, 3);
        gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, it.bIdx);
        gl.uniform1f(uA, it.alpha);
        gl.depthMask(!pass);
        gl.drawElements(gl.TRIANGLES, it.idx.length, gl.UNSIGNED_INT, 0);
      }
    }
    gl.depthMask(true);
    gl.disableVertexAttribArray(2);
  }
  function drawLabels() {
    ctx.clearRect(0, 0, W, H);
    ctx.font = `10.5px ${T.mono}`;
    // axis titles first, then the tick labels that do not collide with a label already drawn
    const taken = [];
    const free = (x, y, w) => { const r = [x - w / 2 - 3, y - 8, x + w / 2 + 3, y + 8]; if (taken.some((q) => r[0] < q[2] && r[2] > q[0] && r[1] < q[3] && r[3] > q[1])) return false; taken.push(r); return true; };
    for (const lb of [...axes.labels].sort((a, b) => !!b.title - !!a.title)) {
      const s = M.project(mvp, lb.p, W, H);
      if (!s || !free(s[0], s[1], ctx.measureText(lb.text).width)) continue;
      ctx.fillStyle = lb.title ? T.ink2 : T.ink3;
      ctx.textAlign = "center"; ctx.textBaseline = "middle";
      ctx.fillText(lb.text, s[0], s[1]);
    }
    // colour bar of the first coloured layer
    const cb = items.find((it) => it.domain && !hidden.has(it.id));
    if (cb) {
      const x = W - 26, y0 = 16, y1 = H - 30, n = 40;
      for (let k = 0; k < n; k++) { ctx.fillStyle = rgbCss(rampRGB(cb.L.map || "viridis", (k + 0.5) / n)); ctx.fillRect(x, y1 - ((k + 1) * (y1 - y0)) / n, 9, (y1 - y0) / n + 0.5); }
      ctx.fillStyle = T.ink3; ctx.textAlign = "right"; ctx.textBaseline = "middle";
      ctx.fillText(fmtValue(cb.domain[1], 3), x - 4, y0 + 4); ctx.fillText(fmtValue(cb.domain[0], 3), x - 4, y1 - 4);
      if (cb.L.unit) { ctx.textBaseline = "bottom"; ctx.textAlign = "right"; ctx.fillText(`${cb.L.valueLabel || ""} ${cb.L.unit}`.trim(), W - 6, H - 8); }
    }
    // brushed epochs of trajectories and scatters
    if (brush) for (const it of items) {
      if (hidden.has(it.id) || !it.L.t || !it.pick) continue;
      ctx.fillStyle = resolveColour("ink", T, fig);
      for (let i = 0; i < it.L.t.length; i++) if (brushHas(brush, it.L.t[i])) { const s = M.project(mvp, [it.pick[3 * i], it.pick[3 * i + 1], it.pick[3 * i + 2]], W, H); if (s) ctx.fillRect(s[0] - 2, s[1] - 2, 4, 4); }
    }
    // clock: the point of each trajectory at clock.now
    const tn = S.clock && Number.isFinite(S.clock.now) ? S.clock.now : null;
    if (tn !== null) for (const it of items) {
      if (hidden.has(it.id) || !it.L.t || it.kind !== "line") continue;
      let i = 0; while (i + 1 < it.L.t.length && it.L.t[i + 1] <= tn) i++;
      const s = M.project(mvp, [it.pick[3 * i], it.pick[3 * i + 1], it.pick[3 * i + 2]], W, H);
      if (s) { ctx.strokeStyle = T.ink; ctx.lineWidth = 2; ctx.beginPath(); ctx.arc(s[0], s[1], 6, 0, Math.PI * 2); ctx.stroke(); }
    }
    const mark = (ref, filled) => {
      const it = items.find((x) => x.id === ref.id); if (!it || !it.pick) return null;
      const s = M.project(mvp, [it.pick[3 * ref.i], it.pick[3 * ref.i + 1], it.pick[3 * ref.i + 2]], W, H); if (!s) return null;
      ctx.beginPath(); ctx.arc(s[0], s[1], filled ? 5 : 6, 0, Math.PI * 2);
      ctx.strokeStyle = T.ink; ctx.lineWidth = 2; ctx.stroke();
      return s;
    };
    for (const p of pins) {
      const s = mark(p, true); if (!s) continue;
      const text = info(p).short, w = ctx.measureText(text).width + 10;
      const bx = s[0] + 10 + w > W ? s[0] - 10 - w : s[0] + 10;
      ctx.fillStyle = T.panel; ctx.fillRect(bx, s[1] - 20, w, 17); ctx.strokeStyle = T.grid; ctx.strokeRect(bx, s[1] - 20, w, 17);
      ctx.fillStyle = T.ink; ctx.textAlign = "left"; ctx.textBaseline = "middle"; ctx.fillText(text, bx + 5, s[1] - 11.5);
    }
    if (hover) mark(hover, false);
  }
  function draw() {
    layout();
    drawGL();
    drawLabels();
    over.setAttribute("aria-label", `${S.ariaLabel || S.title}. 3D chart: ${items.filter((i) => !hidden.has(i.id)).map((i) => i.label).join(", ")}. Keys: arrows rotate, Shift and arrows pan, plus and minus zoom, 0 resets, F fits, comma and full stop step through points, Enter pins, T opens the data table.`);
  }
  function schedule() { if (queued) return; queued = true; raf(() => { queued = false; if (fig.isConnected) draw(); }); }

  // ---------------------------------------------------------------- picking and readouts
  function info(ref) {
    const it = items.find((x) => x.id === ref.id), L = it.L, i = ref.i;
    let p, rows;
    if (it.kind === "ellipsoid") {
      p = it.pickData[i];
      const names = ["centre", "major axis end", "middle axis end", "minor axis end"];
      rows = [[L.label || "ellipsoid", names[i]], ["x", `${fmtValue(p[0])}${unitSp(S.x && S.x.unit)}`], ["y", `${fmtValue(p[1])}${unitSp(S.y && S.y.unit)}`], ["z", `${fmtValue(p[2])}${unitSp(S.z && S.z.unit)}`]];
      if (i > 0) rows.push(["semi-axis", `${fmtValue((L.k ?? 1) * Math.sqrt(Math.max(0, it.values[i - 1])))}${unitSp(S.x && S.x.unit)} (${L.k ?? 1}σ)`]);
    } else {
      p = box.map.from([it.pick[3 * i], it.pick[3 * i + 1], it.pick[3 * i + 2]]);
      if (it.kind === "surface") { const nx = L.xs.length; p = [L.xs[i % nx], L.ys[Math.floor(i / nx)], zAt(L, i % nx, Math.floor(i / nx))]; }
      else if (L.pts) p = [L.pts[3 * i], L.pts[3 * i + 1], L.pts[3 * i + 2]];
      rows = [[it.label, ""], [S.x?.label || "x", `${fmtValue(p[0])}${unitSp(S.x && S.x.unit)}`], [S.y?.label || "y", `${fmtValue(p[1])}${unitSp(S.y && S.y.unit)}`], [S.z?.label || "z", `${fmtValue(p[2])}${unitSp(S.z && S.z.unit)}`]];
      if (L.values) rows.push([L.valueLabel || "value", `${fmtValue(L.values[i])}${unitSp(L.unit)}`]);
      if (L.t) rows.push(["epoch", fmtClock(L.t[i])]);
      if (L.rows) rows.push(...L.rows(i));
    }
    const short = it.kind === "surface" ? `${fmtValue(p[0], 4)}, ${fmtValue(p[1], 4)} → ${fmtValue(p[2], 4)}${unitSp(S.z && S.z.unit)}` : L.values ? `${it.label} ${fmtValue(L.values[i], 4)}${unitSp(L.unit)}` : `${it.label} (${fmtValue(p[0], 3)}, ${fmtValue(p[1], 3)}, ${fmtValue(p[2], 3)})`;
    return { id: ref.id, i, p, rows, short, label: it.label };
  }
  function pick(px, py) {
    let best = null;
    for (const it of items) {
      if (hidden.has(it.id) || !it.pick) continue;
      const r = M.pickNearest(mvp, it.pick, W, H, px, py, it.kind === "surface" ? 18 : 12);
      if (r && (!best || r.d < best.d)) best = { id: it.id, i: r.i, d: r.d };
    }
    return best;
  }
  function showTip(px, py, ref) {
    hover = ref;
    if (!ref) { tip.hidden = true; schedule(); return; }
    const inf = info(ref);
    tip.replaceChildren(...inf.rows.map(([k, v]) => h("div", { class: "kc-tip-r" }, h("span", { text: k }), h("b", { text: v }))));
    tip.hidden = false;
    const tw = tip.offsetWidth || 160, th = tip.offsetHeight || 60;
    let tx = px + 14, ty = py + 14;
    if (tx + tw > W - 4) tx = px - tw - 14;
    if (ty + th > H - 4) ty = py - th - 14;
    tip.style.transform = `translate(${Math.max(2, tx)}px,${Math.max(2, ty)}px)`;
    schedule();
  }

  // ---------------------------------------------------------------- camera
  let anim = 0;
  function setCam(c, animate = false) {
    if (animate && !reducedMotion()) {
      const a = cam, t0 = performance.now(), my = ++anim;
      const step = () => {
        if (my !== anim) return;
        const f = Math.min(1, (performance.now() - t0) / 220), e = 1 - (1 - f) ** 3;
        cam = { ...c, yaw: a.yaw + (c.yaw - a.yaw) * e, pitch: a.pitch + (c.pitch - a.pitch) * e, dist: a.dist + (c.dist - a.dist) * e, target: a.target.map((v, k) => v + (c.target[k] - v) * e) };
        draw();
        if (f < 1) raf(step);
      };
      raf(step);
      return;
    }
    cam = c; schedule();
  }
  // the display box's half-extents (±1 on every axis for "cube"; less on the short axes for "equal")
  const ext = (pad = 1) => [0, 1, 2].map((k) => pad * (box ? Math.abs((box.map.scale[k] * (box.bounds[1][k] - box.bounds[0][k])) / 2) : 1));
  function fitAll(animate) { const e = ext(1.15); setCam(M.fit(cam, [e.map((v) => -v), e]), animate); }
  function reset(animate) { setCam(home, animate); }

  const local = (e) => { const r = over.getBoundingClientRect(); return [e.clientX - r.left, e.clientY - r.top]; };
  over.addEventListener("contextmenu", (e) => e.preventDefault());
  over.addEventListener("pointerdown", (e) => {
    const [px, py] = local(e);
    over.setPointerCapture(e.pointerId); over.focus({ preventScroll: true });
    drag = { x: px, y: py, x0: px, y0: py, mode: e.shiftKey || e.button === 2 ? "pan" : "rotate", moved: false };
    tip.hidden = true;
  });
  over.addEventListener("pointermove", (e) => {
    const [px, py] = local(e);
    if (!drag) { showTip(px, py, pick(px, py)); return; }
    const dx = px - drag.x, dy = py - drag.y;
    if (Math.abs(px - drag.x0) + Math.abs(py - drag.y0) > 3) drag.moved = true;
    drag.x = px; drag.y = py;
    cam = drag.mode === "pan" ? M.pan(cam, dx, dy, H) : M.rotate(cam, dx, dy);
    hover = null;
    schedule();
  });
  over.addEventListener("pointerup", (e) => {
    const d = drag; drag = null;
    const [px, py] = local(e);
    if (d && !d.moved) { const r = pick(px, py); if (r) togglePin(r); }
    showTip(px, py, pick(px, py));
  });
  over.addEventListener("pointerleave", () => { if (!drag) showTip(0, 0, null); });
  over.addEventListener("dblclick", () => reset(true));
  over.addEventListener("wheel", (e) => { e.preventDefault(); const dy = e.deltaMode === 1 ? e.deltaY * 16 : e.deltaY; cam = M.zoom(cam, Math.exp(Math.max(-0.4, Math.min(0.4, dy * 0.0015)))); schedule(); }, { passive: false });
  function togglePin(r) {
    const k = pins.findIndex((p) => p.id === r.id && p.i === r.i);
    if (k >= 0) pins.splice(k, 1); else pins.push({ id: r.id, i: r.i });
    live.textContent = k >= 0 ? "Pin removed" : `Pinned ${info(r).short}`;
    emit("pin", { pins: pins.map(info) });
    schedule();
  }
  let kb = -1;
  over.addEventListener("keydown", (e) => {
    const k = e.key; let used = true;
    if (k === "ArrowLeft") cam = e.shiftKey ? M.pan(cam, 20, 0, H) : M.rotate(cam, 20, 0);
    else if (k === "ArrowRight") cam = e.shiftKey ? M.pan(cam, -20, 0, H) : M.rotate(cam, -20, 0);
    else if (k === "ArrowUp") cam = e.shiftKey ? M.pan(cam, 0, 20, H) : M.rotate(cam, 0, 20);
    else if (k === "ArrowDown") cam = e.shiftKey ? M.pan(cam, 0, -20, H) : M.rotate(cam, 0, -20);
    else if (k === "+" || k === "=") cam = M.zoom(cam, 0.85);
    else if (k === "-" || k === "_") cam = M.zoom(cam, 1.18);
    else if (k === "0") reset(true);
    else if (k === "f" || k === "F") fitAll(true);
    else if (k === "," || k === ".") {
      const it = items.find((x) => x.pick && !hidden.has(x.id)); if (!it) return;
      const n = it.pick.length / 3; kb = kb < 0 ? 0 : Math.max(0, Math.min(n - 1, kb + (k === "," ? -1 : 1) * (e.shiftKey ? 10 : 1)));
      const s = M.project(mvp, [it.pick[3 * kb], it.pick[3 * kb + 1], it.pick[3 * kb + 2]], W, H);
      if (s) showTip(s[0], s[1], { id: it.id, i: kb });
      live.textContent = info({ id: it.id, i: kb }).rows.map((r) => r.join(" ")).join(", ");
    } else if (k === "Enter" && hover) togglePin(hover);
    else if (k === "t" || k === "T") { details.open = !details.open; }
    else if (k === "Escape") { pins.length = 0; schedule(); }
    else used = false;
    if (used) { e.preventDefault(); schedule(); }
  });

  // ---------------------------------------------------------------- legend, table, export
  function drawLegend() {
    const keys = items.filter((it) => it.kind !== "segments" || it.L.label);
    legend.replaceChildren(...keys.map((it) => h("button", { type: "button", class: "kc-key", "aria-pressed": String(!hidden.has(it.id)), onclick: () => { if (hidden.has(it.id)) hidden.delete(it.id); else hidden.add(it.id); drawLegend(); schedule(); } },
      h("i", { style: `background:${it.domain ? rgbCss(rampRGB(it.L.map || "viridis", 0.7)) : resolveColour(it.L.color || (it.kind === "sphere" ? "ink3" : "tim"), T, fig)}` }), h("span", { text: it.label }))));
  }
  function rows() {
    const out = [];
    for (const it of items) {
      if (!it.pick || hidden.has(it.id)) continue;
      const n = it.pick.length / 3;
      for (let i = 0; i < n; i++) { const inf = info({ id: it.id, i }); out.push([it.label, inf.p[0], inf.p[1], inf.p[2], it.L.values ? it.L.values[i] : "", it.L.t ? it.L.t[i] : ""]); }
    }
    return out;
  }
  const header = () => ["layer", colName(S.x?.label || "x", S.x?.unit), colName(S.y?.label || "y", S.y?.unit), colName(S.z?.label || "z", S.z?.unit), "value", "epoch"];
  details.addEventListener("toggle", () => {
    if (!details.open) return;
    const r = rows(), LIMIT = 500;
    tableBox.replaceChildren(h("p", { class: "kc-note", text: r.length > LIMIT ? `The first ${LIMIT} of ${r.length} rows; CSV saves them all.` : `${r.length} rows.` }),
      h("table", {}, h("thead", {}, h("tr", {}, ...header().map((c) => h("th", { scope: "col", text: c })))), h("tbody", {}, ...r.slice(0, LIMIT).map((row) => h("tr", {}, ...row.map((v) => h("td", { text: typeof v === "number" ? fmtValue(v, 7) : String(v) })))))));
  });

  let unsub = null;
  function attachClock(c) {
    if (unsub) { try { unsub(); } catch { /* the clock's own */ } unsub = null; }
    if (c && typeof c.subscribe === "function") { const r = c.subscribe(() => schedule()); unsub = typeof r === "function" ? r : null; }
  }
  let leave = null;
  const member = { onX() {}, onBrush(b) { brush = b; schedule(); } };
  function joinGroup(g) { if (leave) leave(); leave = g ? g.join(member) : null; if (g && g.brush) brush = g.brush; }

  const ro = typeof ResizeObserver === "function" ? new ResizeObserver(() => schedule()) : null;
  if (ro) ro.observe(stage);
  layout();
  build();
  { const e = ext(0.8); cam = M.fit(cam, [e.map((v) => -v), e]); } // the box fills the view; labels outside it stay visible
  if (S.camera) cam = { ...cam, ...S.camera };
  home = cam;
  attachClock(S.clock);
  joinGroup(S.link);
  schedule();

  const api = {
    el: fig, canvas: over,
    get error() { return err; },
    get camera() { return { ...cam }; },
    get pins() { return pins.map(info); },
    get spec() { return S; },
    update(next) { S = { ...S, ...next }; titleEl.textContent = S.title || ""; subEl.textContent = S.subtitle || ""; build(); if (next.clock !== undefined) attachClock(next.clock); schedule(); },
    setCamera(c) { setCam({ ...cam, ...c }); },
    reset: () => reset(false), fit: () => fitAll(false),
    /** The readout at a pixel (as hover shows it), or null. */
    pick(px, py) { layout(); const r = pick(px, py); return r ? info(r) : null; },
    hoverAt(px, py) { layout(); showTip(px, py, pick(px, py)); },
    /** Screen position of a layer's point (for tests and automation). */
    screenOf(id, i) { layout(); const it = items.find((x) => x.id === id); return it && it.pick ? M.project(mvp, [it.pick[3 * i], it.pick[3 * i + 1], it.pick[3 * i + 2]], W, H) : null; },
    toggle(id) { if (hidden.has(id)) hidden.delete(id); else hidden.add(id); drawLegend(); schedule(); },
    on(ev, fn) { (listeners[ev] ||= []).push(fn); return () => { listeners[ev] = listeners[ev].filter((f) => f !== fn); }; },
    toCSV: () => toCSV(header(), rows()),
    toPNG() {
      draw();
      const c = document.createElement("canvas"); c.width = glc.width; c.height = glc.height;
      const x = c.getContext("2d"); x.drawImage(glc, 0, 0); x.drawImage(over, 0, 0);
      return new Promise((res) => (c.toBlob ? c.toBlob(res, "image/png") : res(null)));
    },
    drawNow: () => draw(),
    destroy() { if (ro) ro.disconnect(); attachClock(null); if (leave) leave(); fig.remove(); },
  };
  return api;
}
