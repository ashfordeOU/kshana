// SPDX-License-Identifier: Apache-2.0
// A/B compare logic for the playground: given two run results (the pinned
// baseline A and the current run B), produce the per-clock figure-of-merit
// deltas that drive the side-by-side comparison table. Pure data -> rows; the
// table and the paired charts are rendered (and security-reviewed) in app.js.

// The headline figures of merit, each tagged with whether smaller is better, so
// the comparison can colour the winner correctly. `availability` and `holdover`
// are "more is better"; the timing errors are "less is better".
export const COMPARE_METRICS = [
  { key: "holdover_s", label: "Holdover", unit: "s", lowerBetter: false },
  { key: "timing_rms_ns", label: "Timing RMS", unit: "ns", lowerBetter: true },
  { key: "timing_p95_ns", label: "Timing p95", unit: "ns", lowerBetter: true },
  { key: "availability", label: "Availability", unit: "", lowerBetter: false },
];

/// Compare two run results clock-by-clock. Returns one row per (clock, metric)
/// present-and-numeric on BOTH sides: { clock, clockLabel, metric, label, unit,
/// lowerBetter, a, b, delta (b-a), pct (null if a==0), better ('a'|'b'|'equal') }.
/// A clock or metric missing on either side is skipped, so the table never shows
/// a half comparison.
export function fomDeltas(a, b) {
  const rows = [];
  for (const clock of ["quantum", "classical"]) {
    const ca = a && a[clock];
    const cb = b && b[clock];
    const fa = ca && ca.fom;
    const fb = cb && cb.fom;
    if (!fa || !fb) continue;
    const clockLabel = (ca.spec && ca.spec.id) || clock;
    for (const m of COMPARE_METRICS) {
      const av = fa[m.key];
      const bv = fb[m.key];
      if (typeof av !== "number" || typeof bv !== "number") continue;
      const delta = bv - av;
      const pct = av !== 0 ? (delta / Math.abs(av)) * 100 : null;
      let better = "equal";
      if (delta !== 0) {
        const bWins = m.lowerBetter ? bv < av : bv > av;
        better = bWins ? "b" : "a";
      }
      rows.push({
        clock,
        clockLabel,
        metric: m.key,
        label: m.label,
        unit: m.unit,
        lowerBetter: m.lowerBetter,
        a: av,
        b: bv,
        delta,
        pct,
        better,
      });
    }
  }
  return rows;
}
