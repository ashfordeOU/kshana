// SPDX-License-Identifier: Apache-2.0
use crate::types::{ModelSpec, Seconds};
use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Speed of light (m/s), exact.
pub const C_M_PER_S: f64 = 299_792_458.0;

/// One-way ranging error (m) from a timing error (s): range = c * dt.
pub fn range_error_m(timing_s: f64) -> f64 {
    timing_s * C_M_PER_S
}

/// A two-way time-transfer link with white timing jitter (1-sigma per measurement, s).
#[derive(Clone, Debug)]
pub struct TimeTransferLink {
    pub id: String,
    pub provenance: String,
    pub sigma_j: f64,
}

impl TimeTransferLink {
    pub fn new(id: &str, provenance: &str, sigma_j: f64) -> Self {
        Self {
            id: id.into(),
            provenance: provenance.into(),
            sigma_j,
        }
    }
    pub fn sample(&self, rng: &mut dyn RngCore) -> f64 {
        if self.sigma_j <= 0.0 {
            return 0.0;
        }
        Normal::new(0.0, self.sigma_j).unwrap().sample(rng)
    }
    pub fn spec(&self) -> ModelSpec {
        ModelSpec {
            id: self.id.clone(),
            kind: "time-transfer".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({ "sigma_j_s": self.sigma_j }),
        }
    }
}

/// One synchronization measurement: timing (sync) error in seconds at time t.
#[derive(Clone, Debug, Serialize)]
pub struct SyncSample {
    pub t: Seconds,
    pub sync_error_s: f64,
}

/// Time-transfer figures of merit.
#[derive(Clone, Debug, Serialize)]
pub struct LinkFoM {
    pub sync_rms_ps: f64,
    pub sync_p95_ps: f64,
    pub range_rms_mm: f64,
    pub range_p95_mm: f64,
    pub within_spec_fraction: f64,
}

/// Score a sync-error series against a one-way ranging spec (mm).
pub fn score_link(samples: &[SyncSample], range_spec_mm: f64) -> LinkFoM {
    let n = samples.len().max(1) as f64;
    let sumsq: f64 = samples
        .iter()
        .map(|s| s.sync_error_s * s.sync_error_s)
        .sum();
    let sync_rms_s = (sumsq / n).sqrt();
    let mut abs: Vec<f64> = samples.iter().map(|s| s.sync_error_s.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let sync_p95_s = abs.get(idx).copied().unwrap_or(0.0);
    let within = samples
        .iter()
        .filter(|s| range_error_m(s.sync_error_s.abs()) * 1000.0 <= range_spec_mm)
        .count();
    LinkFoM {
        sync_rms_ps: sync_rms_s * 1e12,
        sync_p95_ps: sync_p95_s * 1e12,
        range_rms_mm: range_error_m(sync_rms_s) * 1000.0,
        range_p95_mm: range_error_m(sync_p95_s) * 1000.0,
        within_spec_fraction: within as f64 / n,
    }
}

/// Link configuration in a time-transfer scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct LinkCfg {
    pub id: String,
    pub provenance: String,
    pub sigma_j_s: f64,
}

/// A time-transfer scenario: N synchronization measurements over an optical and an RF link.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct TimeTransferScenario {
    pub seed: u64,
    pub samples: usize,
    pub step_s: f64,
    pub range_spec_mm: f64,
    pub link_quantum: LinkCfg,
    pub link_classical: LinkCfg,
}

#[derive(Clone, Debug, Serialize)]
pub struct LinkRun {
    pub spec: ModelSpec,
    pub series: Vec<SyncSample>,
    pub fom: LinkFoM,
}

#[derive(Clone, Debug, Serialize)]
pub struct TimeTransferResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub range_spec_mm: f64,
    pub quantum: LinkRun,
    pub classical: LinkRun,
}

fn hash_tt(scn: &TimeTransferScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

fn run_link(scn: &TimeTransferScenario, cfg: &LinkCfg, seed: u64) -> LinkRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let link = TimeTransferLink::new(&cfg.id, &cfg.provenance, cfg.sigma_j_s);
    let mut series = Vec::with_capacity(scn.samples);
    for i in 0..scn.samples {
        let t = i as f64 * scn.step_s;
        let e = link.sample(&mut rng);
        series.push(SyncSample { t, sync_error_s: e });
    }
    let fom = score_link(&series, scn.range_spec_mm);
    LinkRun {
        spec: link.spec(),
        series,
        fom,
    }
}

/// Run a time-transfer scenario for the optical (quantum) and RF (classical) links.
pub fn run_timetransfer(scn: &TimeTransferScenario) -> TimeTransferResult {
    TimeTransferResult {
        schema_version: "0.7".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_tt(scn),
        seed: scn.seed,
        range_spec_mm: scn.range_spec_mm,
        quantum: run_link(scn, &scn.link_quantum, scn.seed),
        classical: run_link(
            scn,
            &scn.link_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
    }
}

/// Render the optical-vs-RF synchronization-error divergence as a standalone SVG.
pub fn to_svg(result: &TimeTransferResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (80.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let c = &result.classical.series;
    let q = &result.quantum.series;
    let t_max = c.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    // spec threshold expressed in ps
    let spec_ps = (result.range_spec_mm / 1000.0 / C_M_PER_S) * 1e12;
    let mut y_max = spec_ps * 1.3;
    for s in c.iter().chain(q.iter()) {
        y_max = y_max.max(s.sync_error_s.abs() * 1e12);
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |ps: f64| mt + ph - (ps.min(y_max) / y_max) * ph;
    let points = |series: &[SyncSample]| {
        series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.sync_error_s.abs() * 1e12)))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(spec_ps);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#cdd6e0\">"));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0e131b\"/>"
    ));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Time-transfer synchronization error (optical vs RF)</text>", ml));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "sync error (ps)",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>",
        ml + pw
    ));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#d33\" stroke-dasharray=\"6 4\"/>", ml + pw));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#d33\">spec {:.0} mm = {:.1} ps</text>",
        ml + 4.0,
        thr_y - 4.0,
        result.range_spec_mm,
        spec_ps
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{}\"/>",
        points(c)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#5cb8d6\" stroke-width=\"2\" points=\"{}\"/>",
        points(q)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">measurement time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#c0392b\">RF: {}</text>",
        ml + 10.0,
        result.classical.spec.id
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#5cb8d6\">optical: {}</text>",
        ml + 10.0,
        result.quantum.spec.id
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn one_way_ranging_conversion() {
        // 1 ps one-way -> 0.299792458 mm.
        let mm = range_error_m(1e-12) * 1000.0;
        assert!((mm - 0.299792458).abs() < 1e-9, "mm={mm}");
    }

    #[test]
    fn sync_rms_matches_jitter() {
        let link = TimeTransferLink::new("opt", "unit", 1e-12);
        let mut rng = ChaCha8Rng::seed_from_u64(7);
        let series: Vec<SyncSample> = (0..10000)
            .map(|i| SyncSample {
                t: i as f64,
                sync_error_s: link.sample(&mut rng),
            })
            .collect();
        let f = score_link(&series, 10.0);
        // RMS of N(0, (1 ps)^2) -> ~1 ps.
        assert!(
            (f.sync_rms_ps - 1.0).abs() / 1.0 < 0.05,
            "rms={}",
            f.sync_rms_ps
        );
    }

    #[test]
    fn hand_derived_link_scores() {
        let s = |e_ps: f64| SyncSample {
            t: 0.0,
            sync_error_s: e_ps * 1e-12,
        };
        let series = vec![s(0.0), s(100.0), s(200.0)];
        let f = score_link(&series, 1000.0);
        // RMS of [0,100,200] ps = 129.0994 ps; range_rms_mm = 129.0994 * 0.299792458
        assert!(
            (f.sync_rms_ps - 129.0994).abs() < 1e-3,
            "sync_rms_ps={}",
            f.sync_rms_ps
        );
        assert_eq!(f.sync_p95_ps, 200.0);
        assert!(
            (f.range_rms_mm - 129.0994 * 0.299792458).abs() < 1e-3,
            "range_rms_mm={}",
            f.range_rms_mm
        );
    }

    #[test]
    fn white_noise_mean_averages_down() {
        // Std of the sample mean of N iid jitter samples ~ sigma/sqrt(N). Seed-averaged check.
        let sigma = 1e-12;
        let n = 400usize;
        let link = TimeTransferLink::new("opt", "unit", sigma);
        let seeds: Vec<u64> = (1..=64).collect();
        let mut sumsq_mean = 0.0;
        for &seed in &seeds {
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            let mean: f64 = (0..n).map(|_| link.sample(&mut rng)).sum::<f64>() / n as f64;
            sumsq_mean += mean * mean;
        }
        let sd_of_mean = (sumsq_mean / seeds.len() as f64).sqrt();
        let expected = sigma / (n as f64).sqrt();
        assert!(
            (sd_of_mean - expected).abs() / expected < 0.2,
            "sd={sd_of_mean} expected={expected}"
        );
    }
}
