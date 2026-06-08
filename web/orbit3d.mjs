// SPDX-License-Identifier: Apache-2.0
// Dependency-free orthographic 3D orbit renderer. No Three.js, no WebGL, no
// CDN — the page must run offline and embedded with nothing fetched, so the
// orbit view is ~150 lines of pure SVG projection math, testable in Node and
// rendered through the same blob-<img> path as the engine charts (so SVG/PNG
// export, the report, and hover all keep working).
//
// Projection: orthographic of a 3-vector. The camera is defined by an azimuth
// `az` and elevation `el` (degrees). The view rotation R = Rx(-el)·Rz(-az)
// rotates the world (ECI, km) into the camera frame; the camera sits on the +x
// axis looking toward the origin, so the screen-right axis is the camera y, the
// screen-up axis is the camera z, and the camera x is the depth used for the
// painter's algorithm and back/front face culling. Rotation matrices are
// textbook (Vallado, Fundamentals of Astrodynamics and Applications, 4th ed.,
// §3.2) and oracle-able by hand.

/// WGS-84 equatorial Earth radius, km. Source: NIMA TR8350.2, "Department of
/// Defense World Geodetic System 1984", Table 3.1 (also IERS Conventions 2010).
/// Baked, not fetched, so the wireframe globe needs no network.
export const R_EARTH_KM = 6378.137;

/// Rotation about the x-axis by `rad`. 3×3 row-major number[][].
export function rotX(rad) {
  const c = Math.cos(rad), s = Math.sin(rad);
  return [
    [1, 0, 0],
    [0, c, -s],
    [0, s, c],
  ];
}

/// Rotation about the y-axis by `rad`. 3×3 row-major number[][].
export function rotY(rad) {
  const c = Math.cos(rad), s = Math.sin(rad);
  return [
    [c, 0, s],
    [0, 1, 0],
    [-s, 0, c],
  ];
}

/// Rotation about the z-axis by `rad`. 3×3 row-major number[][].
export function rotZ(rad) {
  const c = Math.cos(rad), s = Math.sin(rad);
  return [
    [c, -s, 0],
    [s, c, 0],
    [0, 0, 1],
  ];
}

/// Multiply a 3×3 matrix by a 3-vector.
export function matVec(m, v) {
  return [
    m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
    m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
    m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
  ];
}

/// Multiply two 3×3 matrices (a·b), row-major.
export function matMul(a, b) {
  const out = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];
  for (let i = 0; i < 3; i++)
    for (let j = 0; j < 3; j++)
      out[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
  return out;
}

const DEG = Math.PI / 180;

// Build the world→camera view rotation R = Rx(-el)·Rz(-az) for a view.
function viewRotation(view) {
  return matMul(rotX(-(view.el_deg || 0) * DEG), rotZ(-(view.az_deg || 0) * DEG));
}

/// Orthographic projection of an ECI point `p3` (km) for a `view`
/// = {az_deg, el_deg, scale, cx, cy}. Returns {x, y, z} where x,y are screen px
/// and z is the camera-depth used for back/front face culling (larger z = nearer
/// the camera). The camera looks down the world +x axis after R, so screen-x maps
/// to camera-y and screen-y to camera-z (negated, since SVG y points down).
export function orthographic(p3, view) {
  const R = viewRotation(view);
  const v = matVec(R, p3);
  const scale = view.scale;
  return {
    x: view.cx + scale * v[1],
    y: view.cy - scale * v[2],
    z: v[0],
  };
}

// Sample a great/small circle on a sphere of radius `radiusKm` and project it.
// `coords(t)` returns the [x,y,z] world point for parameter t in [0,1].
function projectCircle(coords, n, view) {
  const points = [];
  let zsum = 0;
  for (let i = 0; i <= n; i++) {
    const p = orthographic(coords(i / n), view);
    points.push(p);
    zsum += p.z;
  }
  return { points, meanZ: zsum / points.length };
}

/// The Earth wireframe (lat/long graticule) for `radiusKm`, already projected by
/// `view`. Meridians at λ ∈ {0,30,…,330}, parallels at φ ∈ {-60,-30,0,30,60},
/// each sampled at 48 points. Returns polylines tagged `front`/`back` by mean
/// camera-depth so the back hemisphere can be drawn first and dimmer (painter's
/// algorithm — a true hidden-line solve is overkill for a wireframe globe). The
/// equator (φ=0) is flagged `equator` so the renderer can draw it brighter as the
/// reference plane. A `view` must carry scale/cx/cy.
export function earthWireframe(radiusKm, view) {
  const N = 48;
  const out = [];
  const onSphere = (phi, lam) => [
    radiusKm * Math.cos(phi) * Math.cos(lam),
    radiusKm * Math.cos(phi) * Math.sin(lam),
    radiusKm * Math.sin(phi),
  ];
  // Meridians: constant longitude, θ from -90° to +90°.
  for (let d = 0; d < 360; d += 30) {
    const lam = d * DEG;
    const { points, meanZ } = projectCircle((t) => onSphere((-90 + 180 * t) * DEG, lam), N, view);
    out.push({ kind: "meridian", front: meanZ >= 0, points });
  }
  // Parallels: constant latitude, λ over the full circle.
  for (const phiDeg of [-60, -30, 0, 30, 60]) {
    const phi = phiDeg * DEG;
    const { points, meanZ } = projectCircle((t) => onSphere(phi, 360 * t * DEG), N, view);
    out.push({ kind: phiDeg === 0 ? "equator" : "parallel", front: meanZ >= 0, points });
  }
  return out;
}

/// Project a propagated ECI track (array of [x,y,z] km) into screen points
/// `[{x,y,z}]` using `view`. The z component is the camera depth, for occlusion
/// against the Earth disc.
export function projectTrack(eciKm, view) {
  return eciKm.map((p) => orthographic(p, view));
}

// Pick a square-plot scale (px/km) so the whole track and the Earth fit, and
// build the full view (centre + scale) from a partial {az_deg, el_deg}.
function fitView(model, W, H) {
  const partial = model.view || {};
  const all = (model.trackKm || []).concat(model.satsKm || []);
  let maxR = model.radiusKm || R_EARTH_KM;
  for (const p of all) maxR = Math.max(maxR, Math.hypot(p[0], p[1], p[2]));
  const plotRadiusPx = Math.min(W, H) / 2 - 18; // leave a small frame margin
  return {
    az_deg: partial.az_deg ?? 35,
    el_deg: partial.el_deg ?? 22,
    scale: plotRadiusPx / (maxR || 1),
    cx: W / 2,
    cy: H / 2,
  };
}

const NUM = (n) => (Math.round(n * 100) / 100).toString();

function polyline(points, stroke, width, opacity) {
  if (!points.length) return "";
  const pts = points.map((p) => `${NUM(p.x)},${NUM(p.y)}`).join(" ");
  const op = opacity != null ? ` opacity="${opacity}"` : "";
  return `<polyline fill="none" stroke="${stroke}" stroke-width="${width}"${op} points="${pts}"/>`;
}

/// Build a self-describing orbit SVG string from `model`
/// = {radiusKm, trackKm:[[x,y,z]…], satsKm:[[x,y,z]…], view:{az_deg,el_deg}}.
/// `meta` = {ver, hash} drives the provenance footer (identical wording to the
/// other charts). W=H=520 to match the square instrument aesthetic; palette
/// matches the existing charts. Pure: returns markup, performs no DOM work.
export function orbit3dSvg(model, meta) {
  const W = 520, H = 520;
  const view = fitView(model, W, H);
  const earthR = (model.radiusKm || R_EARTH_KM) * view.scale;

  // Colours from the existing palette.
  const C_TRACK = "#e0bd84";
  const C_WIRE = "#46586f";
  const C_SAT = "#cdb079";
  const BG = "#0c0b08";

  let s = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" font-family="system-ui,sans-serif" font-size="11">`;
  s += `<rect width="${W}" height="${H}" fill="${BG}"/>`;
  // Baked title + az/el read-out.
  s += `<text x="16" y="24" font-size="15" font-weight="bold" fill="#bcb3a3">Orbit (ECI, orthographic)</text>`;
  s += `<text x="16" y="42" fill="#8c8273">az ${NUM(view.az_deg)}° · el ${NUM(view.el_deg)}°</text>`;

  const wire = earthWireframe(model.radiusKm || R_EARTH_KM, view);

  // Painter's order: back wireframe (dimmer) → Earth disc → occluded track →
  // front wireframe → visible track → sats.
  for (const w of wire) if (!w.front) s += polyline(w.points, C_WIRE, 1, 0.28);
  // Earth disc (orthographic of a sphere is a flat circle of radius scale·R_E).
  s += `<circle cx="${NUM(view.cx)}" cy="${NUM(view.cy)}" r="${NUM(earthR)}" fill="#11161d" stroke="${C_WIRE}" stroke-opacity="0.5"/>`;

  // Project the track; split into occluded (behind the disc, far side) and
  // visible runs. "Occluded" iff projected radius < scale·R_E AND depth < 0
  // (camera-far side). Exact for orthographic + a sphere.
  const track = projectTrack(model.trackKm || [], view);
  const occluded = (p) => Math.hypot(p.x - view.cx, p.y - view.cy) < earthR && p.z < 0;
  // Dim the occluded portion by drawing it first, faintly, as its own polyline.
  const dimPts = track.filter(occluded);
  s += polyline(dimPts, C_TRACK, 1.4, 0.25);

  for (const w of wire) {
    if (w.front) s += polyline(w.points, w.kind === "equator" ? "#5b708c" : C_WIRE, w.kind === "equator" ? 1.4 : 1, w.kind === "equator" ? 0.8 : 0.55);
  }

  // The full track polyline on top (so the visible arc reads cleanly).
  s += polyline(track, C_TRACK, 2);

  // Perigee / apogee ticks (min / max |r| over the track) — derivable purely
  // from the track.
  if ((model.trackKm || []).length > 1) {
    let imin = 0, imax = 0, rmin = Infinity, rmax = -Infinity;
    model.trackKm.forEach((p, i) => {
      const r = Math.hypot(p[0], p[1], p[2]);
      if (r < rmin) { rmin = r; imin = i; }
      if (r > rmax) { rmax = r; imax = i; }
    });
    const tick = (idx, label) => {
      const p = track[idx];
      return `<circle cx="${NUM(p.x)}" cy="${NUM(p.y)}" r="3" fill="none" stroke="${C_TRACK}"/><text x="${NUM(p.x + 6)}" y="${NUM(p.y - 6)}" fill="#8c8273" font-size="10">${label}</text>`;
    };
    s += tick(imin, "perigee");
    s += tick(imax, "apogee");
    // Current / last sample as a filled dot.
    const last = track[track.length - 1];
    s += `<circle cx="${NUM(last.x)}" cy="${NUM(last.y)}" r="3.5" fill="${C_TRACK}"/>`;
  }

  // Satellites.
  for (const p of projectTrack(model.satsKm || [], view)) {
    s += `<circle cx="${NUM(p.x)}" cy="${NUM(p.y)}" r="2.6" fill="${C_SAT}"/>`;
  }

  // Provenance footer — identical wording to adevSvg's `prov` line.
  const prov = `Kshana${meta && meta.ver ? " v" + meta.ver : ""}${meta && meta.hash ? " · scenario " + String(meta.hash).slice(0, 12) : ""} · kshana.dev`;
  s += `<text x="${W - 8}" y="${H - 8}" text-anchor="end" fill="#62594b" font-size="10">${prov}</text>`;
  s += `</svg>`;
  return s;
}
