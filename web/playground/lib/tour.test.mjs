// SPDX-License-Identifier: AGPL-3.0-only
// Unit tests for the pure tour core (tour.mjs). Run: `node web/tour.test.mjs`.
import assert from "node:assert/strict";
import { TOUR_STEPS, clampStep, placeTooltip } from "./tour.mjs";

// --- Steps are well-formed ------------------------------------------------
assert.ok(TOUR_STEPS.length >= 6, "tour has several steps");
for (const s of TOUR_STEPS) {
  assert.ok(typeof s.target === "string" && s.target.startsWith("#"), `step target is a selector: ${s.target}`);
  assert.ok(s.title && s.body, "step has a title and body");
  assert.ok(s.side === "top" || s.side === "bottom", `step side is top/bottom: ${s.side}`);
}

// --- clampStep ------------------------------------------------------------
assert.equal(clampStep(-3, 8), 0, "clamps below 0");
assert.equal(clampStep(99, 8), 7, "clamps to n-1");
assert.equal(clampStep(3, 8), 3, "passes a valid index");
assert.equal(clampStep(NaN, 8), 0, "NaN -> 0");

// --- placeTooltip ---------------------------------------------------------
const vp = { width: 1000, height: 800 };
const tip = { width: 320, height: 160 };

// Below the target when there is room.
{
  const t = { top: 100, left: 400, width: 120, height: 40 };
  const p = placeTooltip(t, tip, vp, "bottom");
  assert.equal(p.side, "bottom");
  assert.ok(p.top >= t.top + t.height, "sits below the target");
  assert.ok(p.left >= 12 && p.left + tip.width <= vp.width - 12, "fully on screen");
}

// Flips above when there is no room below.
{
  const t = { top: 720, left: 400, width: 120, height: 60 };
  const p = placeTooltip(t, tip, vp, "bottom");
  assert.equal(p.side, "top", "flips above when below doesn't fit");
  assert.ok(p.top + tip.height <= t.top, "sits above the target");
}

// Horizontal clamp — target hard against the left edge.
{
  const t = { top: 100, left: 0, width: 40, height: 40 };
  const p = placeTooltip(t, tip, vp, "bottom");
  assert.equal(p.left, 12, "clamped to the left margin");
}

// Horizontal clamp — target hard against the right edge.
{
  const t = { top: 100, left: 980, width: 20, height: 40 };
  const p = placeTooltip(t, tip, vp, "bottom");
  assert.equal(p.left, vp.width - tip.width - 12, "clamped to the right margin");
}

// Centre fallback — a tall target on a short screen fits on neither side.
{
  const shortVp = { width: 1000, height: 200 };
  const t = { top: 20, left: 400, width: 120, height: 160 };
  const p = placeTooltip(t, tip, shortVp, "bottom");
  assert.equal(p.side, "center", "centres when neither side fits");
  assert.ok(p.top >= 12 && p.top + tip.height <= shortVp.height - 12, "stays on the short screen");
}

console.log("tour.test.mjs: all assertions passed");
