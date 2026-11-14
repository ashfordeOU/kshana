#!/usr/bin/env node
// SPDX-License-Identifier: AGPL-3.0-only
// Kshana Desktop charts (0.42 U30): builds apps/desktop/shell/lib/chart/demo-data.json, the
// data of the Charts view, from real engine runs. Each scenario is copied into a temporary
// directory and run there with the engine's command line (its outputs land next to the copy;
// nothing is written into scenarios/), then reduced to the arrays the charts need and rounded
// to 6 significant digits. The temporary directory is removed afterwards.
//
//   node apps/desktop/scripts/chart-demo-data.mjs [--bin target/debug/kshana]
//
// The engine binary is --bin, $KSHANA_BIN, or target/debug/kshana (cargo build --bin kshana).
import { execFileSync } from "node:child_process";
import { mkdtempSync, copyFileSync, readFileSync, writeFileSync, rmSync, existsSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = resolve(dirname(fileURLToPath(import.meta.url)), "..", "..", "..");
const argBin = process.argv.indexOf("--bin");
const bin = resolve(argBin > 0 ? process.argv[argBin + 1] : process.env.KSHANA_BIN || join(root, "target", "debug", "kshana"));
if (!existsSync(bin)) { console.error(`no engine binary at ${bin}: build it with cargo build --bin kshana, or pass --bin`); process.exit(2); }
const version = execFileSync(bin, ["--version"], { encoding: "utf8" }).trim();
const tmp = mkdtempSync(join(tmpdir(), "kshana-chart-demo-"));
const r6 = (v) => (typeof v === "number" && Number.isFinite(v) ? +v.toPrecision(6) : v === null || v === undefined ? null : v);
const arr = (a) => a.map(r6);

function run(name) {
  const src = join(root, "scenarios", `${name}.toml`);
  const dst = join(tmp, `${name}.toml`);
  copyFileSync(src, dst);
  execFileSync(bin, [dst], { stdio: ["ignore", "ignore", "pipe"], timeout: 600000 });
  return JSON.parse(readFileSync(join(tmp, `${name}.result.json`), "utf8"));
}
function sky(args) { return JSON.parse(execFileSync(bin, ["sky", ...args], { encoding: "utf8", maxBuffer: 64 << 20, timeout: 120000 })); }

try {
  const out = { engine: version, made: "apps/desktop/scripts/chart-demo-data.mjs", sources: {} };
  const src = (k, what) => { out.sources[k] = what; };

  // Time series with p5–p95 bands: an ensemble of clocks (Monte Carlo band per epoch)
  const ens = run("clock-ensemble");
  out.ensemble = ["quantum", "classical"].map((k) => ({ label: ens[k].spec && ens[k].spec.id ? ens[k].spec.id : k, t: arr(ens[k].band.map((b) => b.t)), p05: arr(ens[k].band.map((b) => b.p05_ns)), p50: arr(ens[k].band.map((b) => b.p50_ns)), p95: arr(ens[k].band.map((b) => b.p95_ns)) }));
  src("ensemble", "scenarios/clock-ensemble.toml: quantum.band[], classical.band[] (p05/p50/p95 time error, ns)");

  // Holdover time error with GNSS outages, and the Allan deviation with its confidence interval
  const ho = run("clock-holdover");
  out.holdover = ["quantum", "classical"].map((k) => ({ label: ho[k].spec && ho[k].spec.id ? ho[k].spec.id : k, t: arr(ho[k].series.map((p) => p.t)), err: arr(ho[k].series.map((p) => p.error_ns)), gnss: ho[k].series.map((p) => p.gnss) }));
  out.adev = ["quantum", "classical"].map((k) => ({ label: ho[k].spec && ho[k].spec.id ? ho[k].spec.id : k, tau: arr(ho[k].adev_curve.map((p) => p.tau_s)), adev: arr(ho[k].adev_curve.map((p) => p.adev)), lo: arr(ho[k].adev_curve.map((p) => p.ci_lo)), hi: arr(ho[k].adev_curve.map((p) => p.ci_hi)), noise: ho[k].adev_curve.map((p) => p.noise) }));
  out.threshold_ns = ho.threshold_ns ?? null;
  src("holdover", "scenarios/clock-holdover.toml: quantum/classical series[] (error_ns, gnss) and adev_curve[] (adev, ci_lo, ci_hi)");

  // MTIE and TDEV of a 24 h ePRTC holdover, against the G.8272 PRTC-A MTIE mask
  const tel = run("telecom-prtc-holdover-24h");
  out.mtie = { tau: arr(tel.mtie.map((p) => p.tau_s)), mtie: arr(tel.mtie.map((p) => p.mtie_ns)) };
  out.tdev = { tau: arr(tel.tdev.map((p) => p.tau_s)), tdev: arr(tel.tdev.map((p) => p.tdev_ns)) };
  // G.8272 Table 1 (PRTC-A), as src/telecom_timing.rs states it: 0.275e-3·τ + 0.025 µs for 0.1 < τ ≤ 273 s, 0.10 µs above.
  const mt = [0.1, 0.3, 1, 3, 10, 30, 100, 273, 1000, 1e4, 1e5];
  out.mtieMask = { label: "G.8272 PRTC-A MTIE mask", tau: mt, ns: mt.map((t) => r6(t <= 273 ? 0.275 * t + 25 : 100)) };
  out.budgets = tel.budgets.map((b) => ({ name: b.name, limit_ns: r6(b.max_abs_te_ns), hours: r6(b.time_to_exceed_s / 3600), exceeded: b.exceeded, source: b.source }));
  out.masks = tel.masks.map((m) => ({ id: m.id, verdict: m.verdict, checks: m.checks.map((c) => ({ metric: c.metric, limit_ns: r6(c.limit_ns), value_ns: r6(c.value_ns), source: c.source })) }));
  src("telecom", "scenarios/telecom-prtc-holdover-24h.toml: mtie[], tdev[], budgets[]; the mask from src/telecom_timing.rs (G.8272 Table 1)");

  // Stanford plot and HPL time series of a RAIM run
  const ig = run("integrity-raim");
  out.integrity = { al_h_m: ig.al_h_m, al_v_m: ig.al_v_m, alert_limit_m: ig.stanford.alert_limit_m, t: arr(ig.epochs.map((e) => e.t_s)), hpl: arr(ig.epochs.map((e) => e.hpl_m)), vpl: arr(ig.epochs.map((e) => e.vpl_m)), nvis: ig.epochs.map((e) => e.n_visible), error: arr(ig.stanford.points.map((p) => p.error_m)), pl: arr(ig.stanford.points.map((p) => p.pl_m)), region: ig.stanford.points.map((p) => p.region) };
  src("integrity", "scenarios/integrity-raim.toml: epochs[] (hpl_m, vpl_m) and stanford.points[] (error_m, pl_m, region), one per epoch");

  // Spectrum and waterfall of an L-band jamming scene
  const wf = run("l-band-waterfall-jamming");
  out.waterfall = { f_mhz: arr(wf.waterfall.freq_hz.map((f) => f / 1e6)), t: arr(wf.waterfall.t_s), psd: wf.waterfall.psd_dbw_per_hz.map(arr), noise_floor: r6(wf.waterfall.noise_floor_dbw_per_hz), jammers: wf.jammers.map((j) => ({ name: j.name, on_s: j.on_s, off_s: j.off_s, centre_mhz: r6(j.centre_hz / 1e6) })), bands: wf.bands.map((b) => ({ name: b.name, centre_mhz: r6(b.centre_hz / 1e6) })) };
  src("waterfall", "scenarios/l-band-waterfall-jamming.toml: waterfall (freq_hz, t_s, psd_dbw_per_hz)");

  // A two-parameter sweep (heatmap)
  const sw = run("sweep-nd-inertial");
  const xs = [...new Set(sw.points.map((p) => p.coords[1]))].sort((a, b) => a - b), ys = [...new Set(sw.points.map((p) => p.coords[0]))].sort((a, b) => a - b);
  const z = ys.map((y) => xs.map((x) => { const p = sw.points.find((q) => q.coords[0] === y && q.coords[1] === x); return p ? r6(p.metrics[0]) : null; }));
  out.sweep = { xKey: sw.keys[1], yKey: sw.keys[0], metric: sw.metrics[0], x: arr(xs), y: arr(ys), z };
  src("sweep", "scenarios/sweep-nd-inertial.toml: points[] (coords, metrics[0] = classical.fom.holdover_s)");

  // An eccentric orbit in ECI (a Molniya revolution)
  const mo = run("orbit-molniya");
  out.orbit = { label: "Molniya", step_s: 120, xyz: mo.eci_track.map((p) => p.map(r6)) };
  src("orbit", "scenarios/orbit-molniya.toml: eci_track[][] (km), sampled every step_s = 120 s");

  // Sky geometry over an hour (tracks) and Monte Carlo position samples with their covariance
  const site = "59.44,24.75,30", systems = "gps-baseline,galileo";
  const times = Array.from({ length: 13 }, (_, i) => i * 300);
  const tracks = new Map();
  for (const t of times) {
    const s = sky(["--site", site, "--systems", systems, "--time", String(t)]);
    for (const sv of s.satellites) {
      if (!tracks.has(sv.id)) tracks.set(sv.id, { id: sv.id, system: sv.system, t: [], az: [], el: [], visible: [] });
      const tr = tracks.get(sv.id);
      tr.t.push(t); tr.az.push(r6(sv.az_deg)); tr.el.push(r6(sv.el_deg)); tr.visible.push(sv.visible ? 1 : 0);
    }
  }
  out.sky = { site, systems, mask_deg: 5, tracks: [...tracks.values()] };
  out.mc = [0, 1200, 2400, 3600].map((t) => {
    const m = sky(["--site", site, "--systems", systems, "--time", String(t), "--monte-carlo", "300", "--seed", "7"]);
    return { t, n: m.n, sigma_uere_m: m.sigma_uere_m, samples: m.samples_enu_m.map((p) => p.map(r6)), cov: m.empirical_covariance_enu_m2.map((r) => r.map(r6)), rms_3d_m: r6(m.rms_3d_m) };
  });
  src("sky", `kshana sky --site ${site} --systems ${systems} --time t (every 300 s to 3600 s); --monte-carlo 300 --seed 7 at 0, 1200, 2400, 3600 s`);

  const file = join(root, "apps", "desktop", "shell", "lib", "chart", "demo-data.json");
  writeFileSync(file, JSON.stringify(out));
  console.log(`wrote ${file} (${(JSON.stringify(out).length / 1024).toFixed(0)} KiB) from ${version}`);
} finally {
  rmSync(tmp, { recursive: true, force: true });
}
