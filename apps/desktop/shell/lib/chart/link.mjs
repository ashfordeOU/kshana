// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): linked x-axes and linked brushing. Pure, no DOM; tested in
// chart.test.mjs. Charts that join a group share
//   - their x window (when the chart's spec says linkX): zoom or pan one, the others follow;
//   - a brush: the epochs selected in one chart (Ctrl/⌘-drag), which every chart of the group
//     highlights on whatever carries the epochs (x for time series, the points' own epochs
//     for a scatter, rows for a waterfall, trails for a sky plot). A brush is a range
//     [t0, t1], or a set of epochs (a box drawn round points of a scatter) with its range.
// A member is { onX(domain, from), onBrush(brush, from) }; the sender is never called back.

/** A brush from a range [t0, t1] or a list of epochs: { range: [lo, hi], epochs: Set | null }; null for nothing. */
export function brushOf(b) {
  if (!b) return null;
  if (Array.isArray(b) && b.length === 2 && !Array.isArray(b[0])) {
    const lo = Math.min(b[0], b[1]), hi = Math.max(b[0], b[1]);
    return Number.isFinite(lo) && Number.isFinite(hi) ? { range: [lo, hi], epochs: null } : null;
  }
  const list = b.epochs ? [...b.epochs] : null;
  if (list) {
    if (!list.length) return null;
    let lo = Infinity, hi = -Infinity;
    for (const t of list) { if (t < lo) lo = t; if (t > hi) hi = t; }
    return { range: [lo, hi], epochs: new Set(list) };
  }
  return b.range ? brushOf(b.range) : null;
}
/** True when epoch t is in the brush. */
export const brushHas = (b, t) => !!b && (b.epochs ? b.epochs.has(t) : t >= b.range[0] && t <= b.range[1]);

export function createLinkGroup(name = "") {
  const members = new Set();
  let x = null, brush = null, busy = false;
  const send = (fn, from) => {
    if (busy) return; // a member that answers a change with its own change does not loop
    busy = true;
    try { for (const m of members) if (m !== from) { try { fn(m); } catch (e) { console.error(e); } } } finally { busy = false; }
  };
  return {
    name,
    get x() { return x; },
    get brush() { return brush; },
    get size() { return members.size; },
    join(m) { members.add(m); return () => members.delete(m); },
    /** Publish an x window; null resets the members to their own full view. */
    setX(domain, from = null) { x = domain ? [domain[0], domain[1]] : null; send((m) => m.onX && m.onX(x, from), from); },
    /** Publish a brush (a range, a list of epochs, or { epochs }) or null to clear it. */
    setBrush(b, from = null) { brush = brushOf(b); send((m) => m.onBrush && m.onBrush(brush, from), from); },
  };
}
