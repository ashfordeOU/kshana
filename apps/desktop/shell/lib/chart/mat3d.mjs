// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): the maths of the 3D charts. Pure, no DOM, no WebGL; tested
// in chart.test.mjs. Column-major 4×4 matrices (the WebGL layout), an orbit camera with z up,
// projection to screen pixels (used for picking and labels, so what is picked is exactly what
// is drawn), the eigen-decomposition of a symmetric 3×3 matrix (covariance ellipsoids) and the
// meshes: ellipsoids, a wireframe sphere, surfaces from a grid.

export const I4 = () => [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
export function mul(a, b) {
  const o = new Array(16);
  for (let c = 0; c < 4; c++) for (let r = 0; r < 4; r++) {
    let s = 0;
    for (let k = 0; k < 4; k++) s += a[k * 4 + r] * b[c * 4 + k];
    o[c * 4 + r] = s;
  }
  return o;
}
export function perspective(fovy, aspect, near, far) {
  const f = 1 / Math.tan(fovy / 2), nf = 1 / (near - far);
  return [f / aspect, 0, 0, 0, 0, f, 0, 0, 0, 0, (far + near) * nf, -1, 0, 0, 2 * far * near * nf, 0];
}
const sub = (a, b) => [a[0] - b[0], a[1] - b[1], a[2] - b[2]];
const cross = (a, b) => [a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0]];
const dot = (a, b) => a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
const unit = (a) => { const l = Math.hypot(a[0], a[1], a[2]) || 1; return [a[0] / l, a[1] / l, a[2] / l]; };
export function lookAt(eye, target, up) {
  const z = unit(sub(eye, target)), x = unit(cross(up, z)), y = cross(z, x);
  return [x[0], y[0], z[0], 0, x[1], y[1], z[1], 0, x[2], y[2], z[2], 0, -dot(x, eye), -dot(y, eye), -dot(z, eye), 1];
}
/** m × [x, y, z, 1]. */
export function transform(m, p) {
  const [x, y, z] = p;
  return [m[0] * x + m[4] * y + m[8] * z + m[12], m[1] * x + m[5] * y + m[9] * z + m[13], m[2] * x + m[6] * y + m[10] * z + m[14], m[3] * x + m[7] * y + m[11] * z + m[15]];
}
/** Screen position [px, py, depth] of a world point (null behind the camera); w×h in CSS pixels. */
export function project(mvp, p, w, h) {
  const c = transform(mvp, p);
  if (c[3] <= 1e-9) return null;
  const nx = c[0] / c[3], ny = c[1] / c[3], nz = c[2] / c[3];
  return [(nx * 0.5 + 0.5) * w, (1 - (ny * 0.5 + 0.5)) * h, nz];
}

// ---------------------------------------------------------------- orbit camera (z up)
export function camera(o = {}) { return { target: o.target || [0, 0, 0], dist: o.dist ?? 4, yaw: o.yaw ?? -0.9, pitch: o.pitch ?? 0.45, fov: o.fov ?? 0.7 }; }
export function eyeOf(c) {
  const cp = Math.cos(c.pitch);
  return [c.target[0] + c.dist * cp * Math.cos(c.yaw), c.target[1] + c.dist * cp * Math.sin(c.yaw), c.target[2] + c.dist * Math.sin(c.pitch)];
}
export function viewProj(c, aspect) {
  const near = Math.max(1e-4, c.dist * 0.01), far = c.dist * 100;
  return mul(perspective(c.fov, aspect, near, far), lookAt(eyeOf(c), c.target, [0, 0, 1]));
}
/** Rotate by a pointer drag of (dx, dy) pixels; pitch is kept short of the poles. */
export function rotate(c, dx, dy) {
  return { ...c, yaw: c.yaw - dx * 0.008, pitch: Math.max(-1.5, Math.min(1.5, c.pitch + dy * 0.008)) };
}
/** Move the target in the view plane by a drag of (dx, dy) pixels on a view h pixels high. */
export function pan(c, dx, dy, h) {
  const e = eyeOf(c), f = unit(sub(c.target, e)), r = unit(cross(f, [0, 0, 1])), u = cross(r, f);
  const k = (2 * c.dist * Math.tan(c.fov / 2)) / (h || 1);
  return { ...c, target: [c.target[0] - (r[0] * dx - u[0] * dy) * k, c.target[1] - (r[1] * dx - u[1] * dy) * k, c.target[2] - (r[2] * dx - u[2] * dy) * k] };
}
export const zoom = (c, f) => ({ ...c, dist: Math.max(1e-3, c.dist * f) });
/** The camera that frames a bounding box ([min, max]) at its current angles. */
export function fit(c, [mn, mx]) {
  const centre = [(mn[0] + mx[0]) / 2, (mn[1] + mx[1]) / 2, (mn[2] + mx[2]) / 2];
  const r = Math.hypot(mx[0] - mn[0], mx[1] - mn[1], mx[2] - mn[2]) / 2 || 1;
  return { ...c, target: centre, dist: (r / Math.sin(c.fov / 2)) * 1.05 };
}
/** Bounding box [min, max] of flat xyz arrays. */
export function bounds(...arrays) {
  const mn = [Infinity, Infinity, Infinity], mx = [-Infinity, -Infinity, -Infinity];
  for (const a of arrays) for (let i = 0; i + 2 < a.length; i += 3) for (let k = 0; k < 3; k++) { const v = a[i + k]; if (v === v) { if (v < mn[k]) mn[k] = v; if (v > mx[k]) mx[k] = v; } }
  for (let k = 0; k < 3; k++) if (!(mx[k] >= mn[k])) { mn[k] = -1; mx[k] = 1; } else if (mx[k] === mn[k]) { mn[k] -= 0.5; mx[k] += 0.5; }
  return [mn, mx];
}

/** Nearest projected point to (px, py) within maxDist pixels: { i, d } or null. `pts` are flat world xyz. */
export function pickNearest(mvp, pts, w, h, px, py, maxDist = 12) {
  let best = -1, bd = maxDist * maxDist, bz = Infinity;
  for (let i = 0, j = 0; i + 2 < pts.length; i += 3, j++) {
    const s = project(mvp, [pts[i], pts[i + 1], pts[i + 2]], w, h);
    if (!s || s[2] < -1 || s[2] > 1) continue;
    const dx = s[0] - px, dy = s[1] - py, d = dx * dx + dy * dy;
    if (d < bd - 1e-6 || (Math.abs(d - bd) <= 1e-6 && s[2] < bz)) { bd = d; best = j; bz = s[2]; }
  }
  return best < 0 ? null : { i: best, d: Math.sqrt(bd) };
}

// ---------------------------------------------------------------- symmetric 3×3 eigen (Jacobi)
/** Eigenvalues (descending) and unit eigenvectors (columns) of a symmetric 3×3 matrix given as [[a,b,c],[b,d,e],[c,e,f]]. */
export function eigenSym3(m) {
  const a = m.map((r) => r.slice());
  const v = [[1, 0, 0], [0, 1, 0], [0, 0, 1]];
  for (let sweep = 0; sweep < 50; sweep++) {
    const off = a[0][1] ** 2 + a[0][2] ** 2 + a[1][2] ** 2;
    if (off < 1e-30 * (a[0][0] ** 2 + a[1][1] ** 2 + a[2][2] ** 2 + 1e-300)) break;
    for (const [p, q] of [[0, 1], [0, 2], [1, 2]]) {
      if (Math.abs(a[p][q]) < 1e-300) continue;
      const th = (a[q][q] - a[p][p]) / (2 * a[p][q]);
      const t = Math.sign(th || 1) / (Math.abs(th) + Math.sqrt(th * th + 1));
      const c = 1 / Math.sqrt(t * t + 1), s = t * c;
      for (let k = 0; k < 3; k++) { const akp = a[k][p], akq = a[k][q]; a[k][p] = c * akp - s * akq; a[k][q] = s * akp + c * akq; }
      for (let k = 0; k < 3; k++) { const apk = a[p][k], aqk = a[q][k]; a[p][k] = c * apk - s * aqk; a[q][k] = s * apk + c * aqk; }
      for (let k = 0; k < 3; k++) { const vkp = v[k][p], vkq = v[k][q]; v[k][p] = c * vkp - s * vkq; v[k][q] = s * vkp + c * vkq; }
    }
  }
  const idx = [0, 1, 2].sort((i, j) => a[j][j] - a[i][i]);
  return { values: idx.map((i) => a[i][i]), vectors: idx.map((i) => [v[0][i], v[1][i], v[2][i]]) };
}

/** Covariance of flat xyz samples, as [[...],[...],[...]], and their mean. */
export function covariance(pts) {
  const n = Math.floor(pts.length / 3), m = [0, 0, 0];
  for (let i = 0; i < n; i++) for (let k = 0; k < 3; k++) m[k] += pts[3 * i + k] / n;
  const c = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
  for (let i = 0; i < n; i++) for (let a = 0; a < 3; a++) for (let b = 0; b < 3; b++) c[a][b] += ((pts[3 * i + a] - m[a]) * (pts[3 * i + b] - m[b])) / Math.max(1, n - 1);
  return { mean: m, cov: c };
}

/** Ellipsoid mesh of { centre, cov, k } (k-sigma): flat positions, normals and triangle indices. */
export function ellipsoidMesh(centre, cov, k = 1, nu = 24, nv = 14) {
  const { values, vectors } = eigenSym3(cov);
  const ax = values.map((l, i) => vectors[i].map((c) => c * k * Math.sqrt(Math.max(0, l))));
  const pos = [], nor = [], idx = [];
  const inv = values.map((l) => 1 / Math.max(1e-30, k * Math.sqrt(Math.max(0, l))));
  for (let j = 0; j <= nv; j++) {
    const th = (j / nv) * Math.PI, st = Math.sin(th), ct = Math.cos(th);
    for (let i = 0; i <= nu; i++) {
      const ph = (i / nu) * Math.PI * 2, u = [st * Math.cos(ph), st * Math.sin(ph), ct];
      for (let c = 0; c < 3; c++) pos.push(centre[c] + ax[0][c] * u[0] + ax[1][c] * u[1] + ax[2][c] * u[2]);
      // normal of x^T A^-1 x = 1: sum of eigvec_i * u_i / axis_i
      const n = [0, 1, 2].map((c) => vectors[0][c] * u[0] * inv[0] + vectors[1][c] * u[1] * inv[1] + vectors[2][c] * u[2] * inv[2]);
      const l = Math.hypot(...n) || 1;
      nor.push(n[0] / l, n[1] / l, n[2] / l);
    }
  }
  for (let j = 0; j < nv; j++) for (let i = 0; i < nu; i++) { const a = j * (nu + 1) + i, b = a + nu + 1; idx.push(a, b, a + 1, a + 1, b, b + 1); }
  return { positions: pos, normals: nor, indices: idx, axes: ax, values };
}

/** A wireframe sphere (latitude and longitude lines) as flat line-segment pairs. */
export function sphereWire(r, centre = [0, 0, 0], nLat = 9, nLon = 12, seg = 72) {
  const out = [];
  const P = (lat, lon) => [centre[0] + r * Math.cos(lat) * Math.cos(lon), centre[1] + r * Math.cos(lat) * Math.sin(lon), centre[2] + r * Math.sin(lat)];
  for (let i = 1; i < nLat; i++) {
    const lat = -Math.PI / 2 + (i / nLat) * Math.PI;
    for (let k = 0; k < seg; k++) out.push(...P(lat, (k / seg) * 2 * Math.PI), ...P(lat, ((k + 1) / seg) * 2 * Math.PI));
  }
  for (let j = 0; j < nLon; j++) {
    const lon = (j / nLon) * 2 * Math.PI;
    for (let k = 0; k < seg / 2; k++) out.push(...P(-Math.PI / 2 + (k / (seg / 2)) * Math.PI, lon), ...P(-Math.PI / 2 + ((k + 1) / (seg / 2)) * Math.PI, lon));
  }
  return out;
}

/** A surface from a grid z[j][i] over xs (i) and ys (j): node positions, normals and triangles; NaN nodes leave holes. */
export function surfaceMesh(xs, ys, z) {
  const nx = xs.length, ny = ys.length, pos = new Float32Array(nx * ny * 3), nor = new Float32Array(nx * ny * 3), idx = [];
  const Z = (i, j) => (Array.isArray(z[0]) || ArrayBuffer.isView(z[0]) ? z[j][i] : z[j * nx + i]);
  for (let j = 0; j < ny; j++) for (let i = 0; i < nx; i++) { const o = (j * nx + i) * 3; pos[o] = xs[i]; pos[o + 1] = ys[j]; pos[o + 2] = Z(i, j); }
  for (let j = 0; j < ny; j++) for (let i = 0; i < nx; i++) {
    const zx = (Z(Math.min(nx - 1, i + 1), j) - Z(Math.max(0, i - 1), j)) / ((xs[Math.min(nx - 1, i + 1)] - xs[Math.max(0, i - 1)]) || 1);
    const zy = (Z(i, Math.min(ny - 1, j + 1)) - Z(i, Math.max(0, j - 1))) / ((ys[Math.min(ny - 1, j + 1)] - ys[Math.max(0, j - 1)]) || 1);
    const n = unit([-(zx || 0), -(zy || 0), 1]), o = (j * nx + i) * 3;
    nor[o] = n[0]; nor[o + 1] = n[1]; nor[o + 2] = n[2];
  }
  for (let j = 0; j + 1 < ny; j++) for (let i = 0; i + 1 < nx; i++) {
    const a = j * nx + i, b = a + 1, c = a + nx, d = c + 1;
    if ([a, b, c, d].some((k) => !(pos[k * 3 + 2] === pos[k * 3 + 2]))) continue;
    idx.push(a, b, d, a, d, c);
  }
  return { positions: pos, normals: nor, indices: idx };
}

/** Map data coordinates into the display box: "cube" fits each axis to [-1, 1]; "equal" keeps one scale for all three. */
export function boxMap([mn, mx], aspect = "cube") {
  const c = [0, 1, 2].map((k) => (mn[k] + mx[k]) / 2);
  const span = [0, 1, 2].map((k) => (mx[k] - mn[k]) / 2 || 1);
  const s = aspect === "equal" ? Array(3).fill(1 / Math.max(...span)) : span.map((v) => 1 / v);
  return { centre: c, scale: s, to: (p) => [(p[0] - c[0]) * s[0], (p[1] - c[1]) * s[1], (p[2] - c[2]) * s[2]], from: (q) => [q[0] / s[0] + c[0], q[1] / s[1] + c[1], q[2] / s[2] + c[2]] };
}
