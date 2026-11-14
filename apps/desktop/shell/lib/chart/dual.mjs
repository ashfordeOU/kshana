// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): a grid shown as a 2D heatmap or waterfall, or as a 3D
// surface of the same numbers, with a 2D | 3D switch. The data are the same in both; the
// switch keeps the one in use and frees the other.
import { createChart } from "./chart2d.mjs";
import { createChart3D } from "./chart3d.mjs";

/**
 * host: the element to draw in. spec2d: a heatmap or waterfall spec (presets.mjs).
 * surface: { xs, ys, z, x: {label, unit}, y: {...}, z: {...}, map, unit, title }.
 * Returns { el, mode, set(mode), chart } where chart is the chart shown.
 */
export function createDual(host, spec2d, surface, { mode = "2d" } = {}) {
  const el = document.createElement("div");
  el.className = "kc-dual";
  const seg = document.createElement("div");
  seg.className = "kc-seg"; seg.setAttribute("role", "group"); seg.setAttribute("aria-label", "View as");
  const b2 = document.createElement("button"), b3 = document.createElement("button");
  b2.type = b3.type = "button"; b2.textContent = "2D"; b3.textContent = "3D";
  b2.title = "Flat view"; b3.title = "Surface in 3D";
  seg.append(b2, b3);
  host.append(el);
  const api = { el, mode: null, chart: null };
  api.set = (m) => {
    if (m === api.mode) return;
    if (api.chart) api.chart.destroy();
    api.mode = m;
    b2.setAttribute("aria-pressed", String(m === "2d")); b3.setAttribute("aria-pressed", String(m === "3d"));
    api.chart = m === "3d"
      ? createChart3D(el, { title: surface.title || spec2d.title, subtitle: "surface", aspect: "cube", height: spec2d.height, x: surface.x, y: surface.y, z: surface.z,
        layers: [{ kind: "surface", id: "surface", label: surface.label || "surface", xs: surface.xs, ys: surface.ys, z: surface.zs, map: surface.map || spec2d.grid.map, unit: surface.unit, valueLabel: surface.label }],
        camera: surface.camera })
      : createChart(el, spec2d);
    // the switch sits in the chart's header, before its tools
    const head = api.chart.el.querySelector(".kc-head");
    head.insertBefore(seg, head.querySelector(".kc-tools"));
  };
  b2.addEventListener("click", () => api.set("2d"));
  b3.addEventListener("click", () => api.set("3d"));
  api.set(mode);
  return api;
}
