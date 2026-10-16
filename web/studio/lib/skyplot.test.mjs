// SPDX-License-Identifier: AGPL-3.0-only
import { test } from "node:test";
import assert from "node:assert/strict";
import { project, unproject, outlinePath, markerPath, niceExtent, ellipseAttrs, fmtDop, styleFor, SYSTEM_STYLE, SYSTEMS, SCALE_95 } from "./skyplot.mjs";

const near = (a, b, tol = 1e-9) => assert.ok(Math.abs(a - b) < tol, `${a} vs ${b}`);

test("projection: zenith at the centre, north up, east right, horizon on the rim", () => {
  const c = project(0, 90, 100, 100, 80);
  near(c.x, 100); near(c.y, 100);
  const n = project(0, 0, 100, 100, 80); near(n.x, 100); near(n.y, 20);
  const e = project(90, 0, 100, 100, 80); near(e.x, 180); near(e.y, 100);
  const s = project(180, 45, 100, 100, 80); near(s.x, 100); near(s.y, 140);
});

test("unproject inverts project, and clamps below the horizon", () => {
  for (const [az, el] of [[0, 10], [45, 30], [135.5, 60], [270, 1], [359, 80]]) {
    const p = project(az, el, 50, 60, 40);
    const q = unproject(p.x, p.y, 50, 60, 40);
    near(q.az, az, 1e-6); near(q.el, el, 1e-6);
  }
  assert.equal(unproject(500, 60, 50, 60, 40).el, 0);
  assert.deepEqual(unproject(50, 60, 50, 60, 40), { az: 0, el: 90 });
});

test("every constellation the address can name has its own colour, shape and label", () => {
  const shapes = new Set(), colours = new Set();
  for (const s of SYSTEMS) { const st = styleFor(s); assert.ok(st.label); shapes.add(st.shape); colours.add(st.color); }
  assert.equal(shapes.size, SYSTEMS.length);
  assert.equal(colours.size, SYSTEMS.length);
  assert.equal(styleFor("__proto__").color, "var(--ink-3)");
  assert.ok(Object.isFrozen(SYSTEM_STYLE));
  assert.deepEqual(SYSTEMS, ["gps", "galileo", "beidou", "leo", "tle"]);
  assert.ok(Math.abs(SCALE_95 - Math.sqrt(5.991)) < 1e-3);
});

test("paths are plain numbers and commands only", () => {
  for (const shape of ["circle", "square", "triangle", "diamond", "cross"]) assert.match(markerPath(shape, 10, 10, 4), /^[MLHVAZhvaLlz0-9.\s-]+$/);
  assert.equal(outlinePath([], 0, 0, 1), "");
  assert.match(outlinePath([{ az: 0, el: 10 }, { az: 180, el: 20 }], 100, 100, 80), /^M[^]*Z$/);
});

test("nice extents and the ellipse drawing", () => {
  assert.equal(niceExtent([0.3]), 1);
  assert.equal(niceExtent([3.2, -7]), 10);
  assert.equal(niceExtent([12]), 20);
  assert.equal(niceExtent([NaN, 40]), 50);
  const a = ellipseAttrs({ semiMajorM: 4, semiMinorM: 2, orientationDeg: 90 }, 0, 0, 10);
  assert.equal(a.rx, 40); assert.equal(a.ry, 20);
  assert.equal(a.transform, "rotate(0.000 0 0)", "a semi-major axis pointing east needs no rotation");
  assert.equal(ellipseAttrs({ semiMajorM: 1, semiMinorM: 1, orientationDeg: 0 }, 5, 5, 1).transform, "rotate(-90.000 5 5)");
  assert.equal(fmtDop(1.234), "1.23");
  assert.equal(fmtDop(1.2, 1), "1.2");
  assert.equal(fmtDop(null), "—");
});
