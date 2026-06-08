// SPDX-License-Identifier: Apache-2.0
// Tests for the dependency-free orthographic 3D orbit renderer's pure math. The
// SVG markup itself is verified in the browser; here we pin the projection and
// rotation against textbook oracles. Run with `node web/orbit3d.test.mjs`.
import {
  rotX,
  rotY,
  rotZ,
  matVec,
  matMul,
  orthographic,
  earthWireframe,
  projectTrack,
  orbit3dSvg,
  R_EARTH_KM,
} from "./orbit3d.mjs";
import assert from "node:assert/strict";

const close = (a, b, tol, msg) => assert.ok(Math.abs(a - b) <= tol, `${msg}: ${a} vs ${b}`);
const HALF_PI = Math.PI / 2;

// Rotation-matrix identities (Vallado, Fundamentals of Astrodynamics and
// Applications, 4th ed., §3.2; any linear-algebra text). Exact to 1e-12.
{
  // Rz(90°)·[1,0,0]ᵀ = [0,1,0]ᵀ
  const a = matVec(rotZ(HALF_PI), [1, 0, 0]);
  close(a[0], 0, 1e-12, "Rz90 x->0");
  close(a[1], 1, 1e-12, "Rz90 x->y");
  close(a[2], 0, 1e-12, "Rz90 x->0z");
  // Rx(90°)·[0,1,0]ᵀ = [0,0,1]ᵀ
  const b = matVec(rotX(HALF_PI), [0, 1, 0]);
  close(b[0], 0, 1e-12, "Rx90 y->0");
  close(b[1], 0, 1e-12, "Rx90 y->0");
  close(b[2], 1, 1e-12, "Rx90 y->z");
  // Ry(90°)·[0,0,1]ᵀ = [1,0,0]ᵀ
  const c = matVec(rotY(HALF_PI), [0, 0, 1]);
  close(c[0], 1, 1e-12, "Ry90 z->x");
  close(c[1], 0, 1e-12, "Ry90 z->0");
  close(c[2], 0, 1e-12, "Ry90 z->0");
}

// matMul: composing two identity rotations is the identity, and Rz(θ)·Rz(-θ)=I.
{
  const i = matMul(rotZ(0), rotX(0));
  for (let r = 0; r < 3; r++)
    for (let c = 0; c < 3; c++) close(i[r][c], r === c ? 1 : 0, 1e-12, `I[${r}][${c}]`);
  const inv = matMul(rotZ(0.7), rotZ(-0.7));
  for (let r = 0; r < 3; r++)
    for (let c = 0; c < 3; c++) close(inv[r][c], r === c ? 1 : 0, 1e-12, `RzRz-1[${r}][${c}]`);
}

// Orthographic projection at az=0,el=0 (view rotation R = Rx(0)·Rz(0) = I).
// SVG y points down, so a +y world point projects below cy by -scale (i.e. to
// the left in screen-x by +scale·y), and a +z point maps to screen_y=cy-scale·z.
{
  const R = 6700; // an arbitrary radius in km
  const view = { az_deg: 0, el_deg: 0, scale: 0.01, cx: 260, cy: 260 };
  // A point on +y maps to screen_x = cx + scale·R, screen_y = cy.
  const py = orthographic([0, R, 0], view);
  close(py.x, 260 + 0.01 * R, 1e-9, "+y -> screen_x = cx + scale·R");
  close(py.y, 260, 1e-9, "+y -> screen_y = cy");
  // A point on +z maps to screen_y = cy - scale·R (SVG y is down), screen_x = cx.
  const pz = orthographic([0, 0, R], view);
  close(pz.x, 260, 1e-9, "+z -> screen_x = cx");
  close(pz.y, 260 - 0.01 * R, 1e-9, "+z -> screen_y = cy - scale·R");
  // Identity-view depth: a point at [R,0,0] is on the camera-near axis (depth=R)
  // and projects to the screen centre.
  const px = orthographic([R, 0, 0], view);
  close(px.x, 260, 1e-9, "[R,0,0] -> centre x");
  close(px.y, 260, 1e-9, "[R,0,0] -> centre y");
  close(px.z, R, 1e-9, "[R,0,0] -> depth = R (camera-near)");
}

// Depth ordering: with az=0,el=0 a +x point (depth +R) is nearer the camera than
// a -x point (depth -R). Sign oracle for the painter's algorithm.
{
  const view = { az_deg: 0, el_deg: 0, scale: 0.01, cx: 260, cy: 260 };
  const near = orthographic([6700, 0, 0], view);
  const far = orthographic([-6700, 0, 0], view);
  assert.ok(near.z > far.z, "near depth > far depth");
}

// Earth disc: orthographic of a sphere is a disc of the sphere's radius. The max
// projected screen radius of the equator polyline === scale·R_E (WGS-84). With
// scale=0.01 px/km → 63.78137 px. Oracle: NIMA TR8350.2 R_E + orthographic geom.
{
  const view = { az_deg: 35, el_deg: 20, scale: 0.01, cx: 260, cy: 260 };
  const polylines = earthWireframe(R_EARTH_KM, view);
  let maxR = 0;
  for (const pl of polylines) {
    for (const p of pl.points) {
      const r = Math.hypot(p.x - view.cx, p.y - view.cy);
      if (r > maxR) maxR = r;
    }
  }
  close(maxR, 0.01 * 6378.137, 1e-3, "max equator screen radius = scale·R_E");
}

// Exported WGS-84 equatorial radius constant (NIMA TR8350.2, Table 3.1).
{
  close(R_EARTH_KM, 6378.137, 1e-3, "R_EARTH_KM = 6378.137 (WGS-84)");
}

// projectTrack: each ECI vertex is projected; identity-view round-trip places a
// +y track sample at screen_x = cx + scale·r, screen_y = cy.
{
  const view = { az_deg: 0, el_deg: 0, scale: 0.01, cx: 260, cy: 260 };
  const pts = projectTrack([[0, 6700, 0]], view);
  assert.equal(pts.length, 1, "one sample -> one point");
  close(pts[0].x, 260 + 0.01 * 6700, 1e-9, "track +y -> screen_x");
  close(pts[0].y, 260, 1e-9, "track +y -> screen_y");
}

// orbit3dSvg: a self-describing SVG string with the baked title and provenance.
{
  const model = {
    radiusKm: R_EARTH_KM,
    trackKm: [
      [7000, 0, 0],
      [0, 7000, 0],
      [-7000, 0, 0],
    ],
    satsKm: [[0, 0, 7000]],
    view: { az_deg: 30, el_deg: 25 },
  };
  const svg = orbit3dSvg(model, { ver: "0.13.0", hash: "820999dd0e8a1122" });
  assert.ok(svg.startsWith("<svg"), "starts with <svg");
  assert.ok(svg.includes("Orbit"), "baked title contains 'Orbit'");
  assert.ok(svg.includes("Kshana"), "provenance line contains 'Kshana'");
  assert.ok(svg.includes("0.13.0"), "provenance carries the engine version");
  assert.ok(svg.endsWith("</svg>"), "ends with </svg>");
  // The track polyline is present (one polyline for the track).
  assert.ok(svg.includes("<polyline"), "renders a track polyline");
}

console.log("orbit3d.test.mjs: all assertions passed");
