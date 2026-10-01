// SPDX-License-Identifier: AGPL-3.0-only
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
    title: "Explore the engine, one domain at a time",
    body: "Pick a domain tab — Orbits, Timing, Inertial, GNSS, Resilience, Lunar, AI/ML, Interop — to see its capabilities, each labelled Validated or Modelled, with a ▸ run button for the worked scenarios. Open “Evidence & provenance” in any domain to trace the proof, or flip “Validated only” to show just what is checked against an external oracle.",
    side: "bottom",
  },
  {
    target: "#playground",
    title: "Run it in your browser",
    body: "Pick a scenario from the dropdown — or hit ▸ run on any capability above — and the engine runs as WebAssembly on your machine. Nothing is uploaded.",
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
    body: "The same explorer is also the evidence ledger: every domain carries an “Evidence & provenance” drawer — the figure, the external oracle it is checked against, and an honest Validated / Modelled status per claim. “Validated only” filters to the dataset-checked rows.",
    side: "top",
  },
  {
    target: "#mcp",
    title: "Use it from an AI agent or your IDE",
    body: "An MCP server lets AI assistants run the validated engine instead of guessing; a JetBrains plugin runs scenarios from a right-click.",
    side: "top",
  },
  {
    target: "#cite",
    title: "Publications & how to cite",
    body: "Kshana is built to be referenced — a citable software release with a DOI, plus peer-style papers on the RF-impairment optimism gap and a conditional timing protection level. Copy the citation straight from here.",
    side: "top",
  },
  {
    target: "#ashforde",
    title: "From Ashforde OÜ",
    body: "Thank you for exploring Kshana. We build open, reproducible, evidence-first engineering for missions that cannot fail — honest about what is validated and what is modelled. Questions, a collaboration, or a study? Reach us at contact@ashforde.org.",
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
