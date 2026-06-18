// SPDX-License-Identifier: AGPL-3.0-only
// Tests for the tabbed-output model. tabModel decides which tabs a result earns
// (FoM and timeseries always; stability iff an Allan curve exists; orbit3d iff an
// eci_track exists; sweep only in sweep mode). buildFomRows is the single-run FoM
// table model (reusing COMPARE_METRICS). Pure logic; the tab DOM lives in app.js.
// Run with `node web/tabs.test.mjs`.
import { tabModel, buildFomRows } from "./tabs.mjs";
import assert from "node:assert/strict";

const ids = (tabs) => tabs.map((t) => t.id);

// tabModel: a plain clock result earns FoM + timeseries + stability (Allan curve
// present), and NOT orbit3d (no eci_track).
{
  const result = {
    quantum: { spec: { id: "optical" }, fom: { holdover_s: 1 }, adev_curve: [{ tau_s: 1, adev: 1e-13 }] },
    classical: { spec: { id: "csac" }, fom: { holdover_s: 1 } },
  };
  const t = ids(tabModel(result));
  assert.ok(t.includes("fom"), "always FoM");
  assert.ok(t.includes("timeseries"), "always timeseries");
  assert.ok(t.includes("stability"), "stability when adev_curve present");
  assert.ok(!t.includes("orbit3d"), "no orbit3d without eci_track");
  assert.ok(!t.includes("sweep"), "no sweep tab outside sweep mode");
  // FoM and timeseries lead the order.
  assert.equal(t[0], "fom", "fom first");
  assert.equal(t[1], "timeseries", "timeseries second");
  // Every tab carries a human label.
  for (const tab of tabModel(result)) assert.equal(typeof tab.label, "string", "tab has a label");
}

// tabModel: an orbit result with a non-empty eci_track earns the orbit3d tab.
{
  const result = {
    quantum: { spec: { id: "optical" }, fom: { holdover_s: 1 } },
    classical: { spec: { id: "csac" }, fom: { holdover_s: 1 } },
    eci_track: [[7000, 0, 0], [0, 7000, 0]],
  };
  assert.ok(ids(tabModel(result)).includes("orbit3d"), "orbit3d when eci_track present");
}

// tabModel: an empty eci_track does NOT earn the orbit3d tab.
{
  const result = { quantum: { fom: {} }, classical: { fom: {} }, eci_track: [] };
  assert.ok(!ids(tabModel(result)).includes("orbit3d"), "empty eci_track -> no orbit3d");
}

// tabModel: sweep mode adds the sweep tab.
{
  const result = { quantum: { fom: {} }, classical: { fom: {} } };
  assert.ok(ids(tabModel(result, { sweep: true })).includes("sweep"), "sweep tab in sweep mode");
}

// tabModel: a result that earns NO figure-of-merit rows (e.g. the ephemeris /
// ground-track pack, or RAIM — neither carries quantum/classical `fom`) does not
// show an empty FoM tab; the time-series (here the ground track) leads instead.
{
  const ephemeris = {
    source: "sgp4 (TLE)",
    n_samples: 94,
    lat_min_deg: -51.8, lat_max_deg: 51.8,
    alt_min_km: 419, alt_max_km: 434,
    speed_min_m_s: 7653, speed_max_m_s: 7661,
    max_elevation_deg: 25.7, peak_doppler_hz: 34300,
    samples: [{ t_s: 0, lat_deg: 0, lon_deg: 0, alt_km: 420 }],
  };
  const t = ids(tabModel(ephemeris));
  assert.ok(!t.includes("fom"), "no FoM tab when there are no FoM rows");
  assert.equal(t[0], "timeseries", "timeseries leads when FoM is empty");
  assert.ok(t.includes("timeseries"), "timeseries still present");
  // A top-level-`fom` result (RAIM-shaped, no clocks) likewise earns no FoM tab.
  const raim = { fom: { raim_availability: 0.97 }, samples: [] };
  assert.ok(!ids(tabModel(raim)).includes("fom"), "top-level fom (no clocks) earns no FoM tab");
}

// buildFomRows: one row per (clock, metric) present-and-numeric, with the
// COMPARE_METRICS label/unit and the human clock label.
{
  const result = {
    quantum: { spec: { id: "optical" }, fom: { holdover_s: 120, timing_rms_ns: 0.7, timing_p95_ns: 1.2, availability: 0.99 } },
    classical: { spec: { id: "csac" }, fom: { holdover_s: 12, timing_rms_ns: 30, timing_p95_ns: 50, availability: 0.6 } },
  };
  const rows = buildFomRows(result);
  const q = rows.filter((r) => r.clockLabel === "optical");
  const by = (k) => q.find((r) => r.metric === k);
  assert.equal(by("holdover_s").value, 120, "quantum holdover value");
  assert.equal(by("holdover_s").label, "Holdover", "metric label");
  assert.equal(by("holdover_s").unit, "s", "metric unit");
  assert.equal(by("timing_rms_ns").value, 0.7, "quantum timing rms");
  // Both clocks appear.
  assert.ok(rows.some((r) => r.clockLabel === "csac"), "classical rows present");
  // 4 metrics × 2 clocks = 8 rows for a fully-populated result.
  assert.equal(rows.length, 8, "8 FoM rows");
}

// buildFomRows: a missing/non-numeric metric is skipped (no half rows).
{
  const result = {
    quantum: { spec: { id: "q" }, fom: { holdover_s: 1, timing_rms_ns: 1, timing_p95_ns: 1, availability: null } },
    classical: { spec: { id: "c" }, fom: { holdover_s: 2 } },
  };
  const rows = buildFomRows(result);
  assert.ok(!rows.some((r) => r.metric === "availability" && r.clockLabel === "q"), "null availability skipped");
  assert.equal(rows.filter((r) => r.clockLabel === "q").length, 3, "3 valid quantum rows");
  assert.equal(rows.filter((r) => r.clockLabel === "c").length, 1, "1 valid classical row");
}

console.log("tabs.test.mjs: all assertions passed");
