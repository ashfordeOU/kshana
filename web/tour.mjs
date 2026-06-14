// SPDX-License-Identifier: Apache-2.0
// Interactive guided tour — a dependency-free spotlight walkthrough that highlights
// real regions of the page (capabilities, the playground controls, the result tabs,
// validation, agents). This module is the PURE core: the ordered step list and the
// tooltip-placement geometry, unit-tested in tour.test.mjs. The DOM driver (the
// dimmed overlay, scrolling, focus, and buttons) lives in app.js.

// Ordered steps. `target` is a CSS selector resolved at run time; a step whose target
// is missing or not on-screen is skipped by the driver, so steps that depend on a
// completed run (the tabs, the sweep panel) degrade gracefully on a fresh load.
// `side` is the preferred placement of the tooltip relative to the target.
export const TOUR_STEPS = [
  {
    target: "#capabilities",
    title: "One engine, the whole PNT stack",
    body: "Orbits, clocks, inertial, GNSS integrity, alt-PNT, single-point positioning, and deep-space / Mars radiometric nav — all one validated engine. Each card can load a worked scenario straight into the playground.",
    side: "bottom",
  },
  {
    target: "#presets",
    title: "Pick a question",
    body: "These one-click presets load a real scenario and run it on your machine. Nothing is uploaded — the engine runs as WebAssembly in your browser.",
    side: "bottom",
  },
  {
    target: "#run",
    title: "Run it",
    body: "Run the current scenario. Open “Advanced” to edit the TOML and change anything; “Copy share link” reproduces this exact run for someone else.",
    side: "bottom",
  },
  {
    target: "#guided",
    title: "Tune the sliders",
    body: "Guided knobs adapt to the scenario — seed, spec threshold, duration, elevation mask, orbit altitude — and every change re-runs instantly.",
    side: "bottom",
  },
  {
    target: "#tabs",
    title: "Read the results",
    body: "Switch between the figures of merit, the time-series chart, clock stability (Allan deviation), and — for orbit runs — an interactive 3-D orbit view.",
    side: "top",
  },
  {
    target: "#download-report",
    title: "Sweep, compare & export",
    body: "The Sweep tab varies one parameter across a range; “Pin to compare” overlays two or more runs side-by-side with the Δ between them (works across scenario types — clock, Mars-PNT, positioning…); and this button downloads the run as a self-contained, offline HTML report.",
    side: "top",
  },
  {
    target: "#validation",
    title: "Evidence, not adjectives",
    body: "Every claim is traced to a standard or a published reference and validated in CI — and whatever is not modelled is labelled honestly too.",
    side: "top",
  },
  {
    target: "#mcp",
    title: "Use it from an AI agent or your IDE",
    body: "An MCP server lets AI assistants run the validated engine instead of guessing; a JetBrains plugin runs scenarios from a right-click.",
    side: "top",
  },
];

/// Clamp a step index into [0, n).
export function clampStep(i, n) {
  if (!Number.isFinite(i)) return 0;
  return Math.max(0, Math.min(n - 1, Math.trunc(i)));
}

/// Pure tooltip placement. Given the target's rect, the tooltip's size, the viewport,
/// and a preferred side, return { top, left, side } in viewport (fixed) coordinates,
/// clamped so the card stays fully on screen with `margin` padding and a `gap` from
/// the target. Flips to the opposite side when the preferred side has no room; if
/// neither vertical side fits (a tall target on a short screen) it centres the card
/// in the viewport. The horizontal position aligns the card's centre to the target's,
/// then clamps to the screen.
export function placeTooltip(target, tip, viewport, side = "bottom", margin = 12, gap = 14) {
  const vw = viewport.width;
  const vh = viewport.height;

  const fitsBelow = target.top + target.height + gap + tip.height + margin <= vh;
  const fitsAbove = target.top - gap - tip.height - margin >= 0;

  let chosen = side === "top" || side === "bottom" ? side : "bottom";
  if (chosen === "bottom" && !fitsBelow && fitsAbove) chosen = "top";
  else if (chosen === "top" && !fitsAbove && fitsBelow) chosen = "bottom";

  let top;
  if (!fitsBelow && !fitsAbove) {
    top = (vh - tip.height) / 2;
    chosen = "center";
  } else if (chosen === "top") {
    top = target.top - gap - tip.height;
  } else {
    top = target.top + target.height + gap;
  }

  let left = target.left + target.width / 2 - tip.width / 2;
  left = Math.max(margin, Math.min(left, vw - tip.width - margin));
  top = Math.max(margin, Math.min(top, vh - tip.height - margin));
  return { top, left, side: chosen };
}
