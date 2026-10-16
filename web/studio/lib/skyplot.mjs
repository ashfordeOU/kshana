// SPDX-License-Identifier: AGPL-3.0-only
// Drawing helpers for the Geometry view: the skyplot's polar projection (and its inverse, for dragging a
// skyline point), the constellation palette and marker shapes, and the plot frame of the error panel.
// No navigation quantity is computed here: positions, DOPs, the ellipse and the point cloud are the
// engine's (lib/geometry-adapter.mjs). Pure; tested in skyplot.test.mjs.

// Colour and shape per constellation. Colours are the Studio's own domain tokens (blue, amber, violet,
// teal), and every constellation also has its own marker shape and a text label, so no reading depends
// on telling colours apart.
export const SYSTEM_STYLE = Object.freeze({
  gps: { label: "GPS", color: "var(--tim)", shape: "circle" },
  galileo: { label: "Galileo", color: "var(--nav)", shape: "square" },
  beidou: { label: "BeiDou", color: "var(--spf)", shape: "triangle" },
  leo: { label: "LEO", color: "var(--orb)", shape: "cross" },
  tle: { label: "Your elements", color: "var(--ink-2)", shape: "diamond" },
});
export const SYSTEMS = Object.freeze(Object.keys(SYSTEM_STYLE));
export const styleFor = (sys) => (Object.hasOwn(SYSTEM_STYLE, sys) ? SYSTEM_STYLE[sys] : { label: String(sys), color: "var(--ink-3)", shape: "circle" });

// Polar projection: zenith at the centre, the horizon on a circle of radius R, north up, east right.
// Radius is linear in zenith angle.
export function project(az, el, cx, cy, R) {
  const r = ((90 - Math.min(90, Math.max(0, el))) / 90) * R;
  const a = (az * Math.PI) / 180;
  return { x: cx + r * Math.sin(a), y: cy - r * Math.cos(a) };
}

// The inverse: a point on the plot to {az, el} (az 0..360, el clamped to 0..90).
export function unproject(x, y, cx, cy, R) {
  const dx = x - cx, dy = cy - y;
  const r = Math.hypot(dx, dy);
  let az = (Math.atan2(dx, dy) * 180) / Math.PI;
  if (az < 0) az += 360;
  const el = Math.max(0, Math.min(90, 90 - (r / R) * 90));
  return { az: r === 0 ? 0 : az, el };
}

// A closed SVG path through outline points ({az, el}), projected; for the skyline polygon (the sky it hides
// lies between the outline and the horizon, so the path is the horizon circle with the outline cut out).
export function outlinePath(points, cx, cy, R) {
  if (!points.length) return "";
  const f = (v) => v.toFixed(2);
  const inner = points.map((p, i) => { const q = project(p.az, p.el, cx, cy, R); return `${i ? "L" : "M"}${f(q.x)} ${f(q.y)}`; }).join("") + "Z";
  const ring = `M${f(cx)} ${f(cy - R)}A${f(R)} ${f(R)} 0 1 1 ${f(cx)} ${f(cy + R)}A${f(R)} ${f(R)} 0 1 1 ${f(cx)} ${f(cy - R)}Z`;
  return ring + inner;
}

// Marker path for a shape centred at (x, y) with half-size s.
export function markerPath(shape, x, y, s) {
  const f = (v) => v.toFixed(2);
  switch (shape) {
    case "square": return `M${f(x - s)} ${f(y - s)}h${f(2 * s)}v${f(2 * s)}h${f(-2 * s)}Z`;
    case "triangle": return `M${f(x)} ${f(y - s * 1.15)}L${f(x + s * 1.1)} ${f(y + s * 0.8)}L${f(x - s * 1.1)} ${f(y + s * 0.8)}Z`;
    case "diamond": return `M${f(x)} ${f(y - s * 1.25)}L${f(x + s * 1.25)} ${f(y)}L${f(x)} ${f(y + s * 1.25)}L${f(x - s * 1.25)} ${f(y)}Z`;
    case "cross": { const t = s * 0.42; return `M${f(x - t)} ${f(y - s)}h${f(2 * t)}v${f(s - t)}h${f(s - t)}v${f(2 * t)}h${f(t - s)}v${f(s - t)}h${f(-2 * t)}v${f(t - s)}h${f(t - s)}v${f(-2 * t)}h${f(s - t)}Z`; }
    default: return `M${f(x - s)} ${f(y)}a${f(s)} ${f(s)} 0 1 0 ${f(2 * s)} 0a${f(s)} ${f(s)} 0 1 0 ${f(-2 * s)} 0Z`;
  }
}

// A "nice" half-width for the error panel (metres) that holds every value given, from a 1-2-5 ladder.
export function niceExtent(values, floor = 1) {
  const m = Math.max(floor, ...values.filter(Number.isFinite).map(Math.abs));
  const p = 10 ** Math.floor(Math.log10(m));
  for (const k of [1, 2, 5, 10]) if (k * p >= m) return k * p;
  return 10 * p;
}

// The drawing of an error ellipse the engine described by its semi-axes (metres) and the orientation of the
// semi-major axis (degrees clockwise from north): an SVG transform for an <ellipse> centred on (cx, cy) with
// `scale` pixels per metre. North is up, east is right.
export function ellipseAttrs(e, cx, cy, scale) {
  return { cx, cy, rx: e.semiMajorM * scale, ry: e.semiMinorM * scale, transform: `rotate(${(e.orientationDeg - 90).toFixed(3)} ${cx} ${cy})` };
}

// The 95 % horizontal ellipse is the 1-sigma one scaled by sqrt(5.991) = 2.448 (chi-square, 2 degrees of
// freedom, 0.95), the constant the design note states; the axes themselves are the engine's.
export const SCALE_95 = 2.448;

// Format a DOP for the readout: two decimals, or the engine's own precision when it gives fewer.
export function fmtDop(v, digits = 2) {
  return Number.isFinite(v) ? v.toFixed(digits) : "—";
}
