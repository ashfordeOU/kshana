use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use crate::scenario::{GnssState, GnssTimeline, TimeCfg};
use crate::types::{ModelSpec, Seconds};

/// Accelerometer error model for dead-reckoning a static platform: a residual
/// (post-GNSS-calibration) bias plus white acceleration noise (velocity random
/// walk). Integrates twice, so `pos()` is the accumulated dead-reckoning
/// position error (m). Static-platform truth (true acceleration = 0).
#[derive(Clone, Debug)]
pub struct AccelModel {
    pub id: String,
    pub provenance: String,
    pub bias: f64, // residual bias (m/s^2), post-GNSS-calibration (= sensor bias stability)
    pub q_va: f64, // white acceleration PSD S_a ((m/s^2)^2/Hz) -> velocity random walk
    vel: f64,
    pos: f64,
}

impl AccelModel {
    pub fn new(id: &str, provenance: &str, bias: f64, q_va: f64) -> Self {
        Self { id: id.into(), provenance: provenance.into(), bias, q_va, vel: 0.0, pos: 0.0 }
    }
    /// Re-align to GNSS truth: zero the accumulated dead-reckoning error.
    pub fn reset(&mut self) { self.vel = 0.0; self.pos = 0.0; }
    pub fn pos(&self) -> f64 { self.pos }
    pub fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore) {
        if dt <= 0.0 { return; }
        self.vel += self.bias * dt;
        if self.q_va > 0.0 {
            // velocity random walk: integrating white accel (PSD S_a) over dt
            // adds a velocity increment of variance S_a*dt.
            let n = Normal::new(0.0, (self.q_va * dt).sqrt()).unwrap();
            self.vel += n.sample(rng);
        }
        self.pos += self.vel * dt;
    }
    pub fn spec(&self) -> ModelSpec {
        ModelSpec {
            id: self.id.clone(),
            kind: "accelerometer".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({ "bias": self.bias, "q_va": self.q_va }),
        }
    }
}

/// One scored sample: dead-reckoning position error (m) and GNSS state.
#[derive(Clone, Debug, Serialize)]
pub struct PosSample {
    pub t: Seconds,
    pub error_m: f64,
    pub gnss: GnssState,
}

/// Position figures of merit (Integrity/Security not modeled in this pack).
#[derive(Clone, Debug, Serialize)]
pub struct PositionFoM {
    pub pos_rms_m: f64,
    pub pos_p95_m: f64,
    pub holdover_s: f64,
    pub drift_slope_m_per_s: f64,
    pub availability: f64,
    pub integrity: Option<f64>,
    pub security: Option<f64>,
}

/// Score a position-error series against a position spec threshold (m).
/// Position RMS/p95 and drift are over the holdover (outage) window;
/// availability is over the whole run. `holdover_s` is grid-resolution-bounded.
pub fn score_position(samples: &[PosSample], threshold_m: f64) -> PositionFoM {
    let n = samples.len().max(1) as f64;
    let within = samples.iter().filter(|s| s.error_m.abs() <= threshold_m).count();
    let availability = within as f64 / n;

    let outage: Vec<&PosSample> =
        samples.iter().filter(|s| s.gnss != GnssState::Nominal).collect();
    if outage.is_empty() {
        return PositionFoM {
            pos_rms_m: 0.0, pos_p95_m: 0.0, holdover_s: 0.0,
            drift_slope_m_per_s: 0.0, availability, integrity: None, security: None,
        };
    }
    let m = outage.len() as f64;
    let sumsq: f64 = outage.iter().map(|s| s.error_m * s.error_m).sum();
    let pos_rms_m = (sumsq / m).sqrt();
    let mut abs: Vec<f64> = outage.iter().map(|s| s.error_m.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let pos_p95_m = abs.get(idx).copied().unwrap_or(0.0);
    let t0 = outage.first().unwrap().t;
    let holdover_s = match outage.iter().find(|s| s.error_m.abs() > threshold_m) {
        Some(s) => s.t - t0,
        None => outage.last().unwrap().t - t0,
    };
    let mean_t = outage.iter().map(|s| s.t).sum::<f64>() / m;
    let mean_y = outage.iter().map(|s| s.error_m.abs()).sum::<f64>() / m;
    let mut num = 0.0;
    let mut den = 0.0;
    for s in &outage {
        num += (s.t - mean_t) * (s.error_m.abs() - mean_y);
        den += (s.t - mean_t) * (s.t - mean_t);
    }
    let drift_slope_m_per_s = if den > 0.0 { num / den } else { 0.0 };
    PositionFoM { pos_rms_m, pos_p95_m, holdover_s, drift_slope_m_per_s, availability, integrity: None, security: None }
}

/// Accelerometer configuration in an inertial scenario file.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct AccelCfg {
    pub id: String,
    pub provenance: String,
    pub bias: f64,
    pub q_va: f64,
}

/// A dead-reckoning (GNSS-denied inertial navigation) scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct InertialScenario {
    pub seed: u64,
    pub threshold_m: f64,
    pub time: TimeCfg,
    pub gnss: GnssTimeline,
    pub accel_quantum: AccelCfg,
    pub accel_classical: AccelCfg,
}

/// One accelerometer's run: spec, position-error series, scored FoMs.
#[derive(Clone, Debug, Serialize)]
pub struct AccelRun {
    pub spec: ModelSpec,
    pub series: Vec<PosSample>,
    pub fom: PositionFoM,
}

/// Inertial result artifact.
#[derive(Clone, Debug, Serialize)]
pub struct InertialResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub threshold_m: f64,
    pub quantum: AccelRun,
    pub classical: AccelRun,
}

fn hash_inertial(scn: &InertialScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

fn run_accel(scn: &InertialScenario, cfg: &AccelCfg) -> AccelRun {
    let mut rng = ChaCha8Rng::seed_from_u64(scn.seed);
    let mut a = AccelModel::new(&cfg.id, &cfg.provenance, cfg.bias, cfg.q_va);
    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 { a.step(dt, &mut rng); }
        let gnss = scn.gnss.state_at(t);
        let error_m = match gnss {
            GnssState::Nominal => { a.reset(); 0.0 }
            _ => a.pos(),
        };
        series.push(PosSample { t, error_m, gnss });
    }
    let fom = score_position(&series, scn.threshold_m);
    AccelRun { spec: a.spec(), series, fom }
}

/// Run a dead-reckoning scenario for both accelerometers.
pub fn run_inertial(scn: &InertialScenario) -> InertialResult {
    InertialResult {
        schema_version: "0.1".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_inertial(scn),
        seed: scn.seed,
        threshold_m: scn.threshold_m,
        quantum: run_accel(scn, &scn.accel_quantum),
        classical: run_accel(scn, &scn.accel_classical),
    }
}

/// Render the quantum-vs-classical position-error divergence as a standalone SVG.
pub fn to_svg(result: &InertialResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (80.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let c = &result.classical.series;
    let q = &result.quantum.series;
    let t_max = c.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    let mut y_max = result.threshold_m * 1.3;
    for s in c.iter().chain(q.iter()) {
        y_max = y_max.max(s.error_m.abs());
    }
    if y_max <= 0.0 { y_max = 1.0; }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |e: f64| mt + ph - (e.min(y_max) / y_max) * ph;
    let points = |series: &[PosSample]| {
        series.iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.error_m.abs())))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(result.threshold_m);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\">"));
    svg.push_str(&format!("<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"white\"/>"));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Dead-reckoning position error during GNSS outage</text>", ml));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#888\"/>"));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#888\"/>", ml + pw));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#d33\" stroke-dasharray=\"6 4\"/>", ml + pw));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#d33\">spec {:.0} m</text>", ml + 4.0, thr_y - 4.0, result.threshold_m));
    svg.push_str(&format!("<polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{}\"/>", points(c)));
    svg.push_str(&format!("<polyline fill=\"none\" stroke=\"#2471a3\" stroke-width=\"2\" points=\"{}\"/>", points(q)));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>", ml + pw / 2.0, h - 12.0));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"44\" fill=\"#c0392b\">classical: {}</text>", ml + 10.0, result.classical.spec.id));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"60\" fill=\"#2471a3\">quantum: {}</text>", ml + 10.0, result.quantum.spec.id));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::GnssState::Denied;

    #[test]
    fn pure_bias_double_integrates() {
        // bias b, no noise, dt=1: vel_k=b*k, pos_N=b*sum_{k=1}^N k = b*N(N+1)/2.
        // b=1e-3, N=4 -> 1e-3 * (4*5/2)=1e-3*10 = 1e-2.
        let mut a = AccelModel::new("b", "unit", 1e-3, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..4 { a.step(1.0, &mut rng); }
        assert!((a.pos() - 1e-2).abs() < 1e-15);
    }

    #[test]
    fn reset_zeroes_error() {
        let mut a = AccelModel::new("b", "unit", 1e-3, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..4 { a.step(1.0, &mut rng); }
        a.reset();
        assert_eq!(a.pos(), 0.0);
    }

    #[test]
    fn same_seed_reproducible() {
        let run = || {
            let mut a = AccelModel::new("q", "unit", 0.0, 4e-8);
            let mut rng = ChaCha8Rng::seed_from_u64(5);
            for _ in 0..200 { a.step(1.0, &mut rng); }
            a.pos()
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn hand_derived_position_scores() {
        let s = |t: f64, e: f64| PosSample { t, error_m: e, gnss: Denied };
        let samples = vec![s(0.0, 0.0), s(1.0, 100.0), s(2.0, 200.0)];
        let f = score_position(&samples, 150.0);
        assert!((f.pos_rms_m - 129.0994).abs() < 1e-3);
        assert_eq!(f.pos_p95_m, 200.0);
        assert!((f.availability - 2.0 / 3.0).abs() < 1e-9);
        assert_eq!(f.holdover_s, 2.0);
        assert!((f.drift_slope_m_per_s - 100.0).abs() < 1e-9);
    }

    #[test]
    fn vrw_position_sd_matches_groves() {
        // White accel PSD S_a: sigma_pos^2(T) = S_a * T^3 / 3 (Groves, AESS Tutorial eq.54).
        // Average over seeds to cut scatter, compare sigma (sqrt) to expected.
        let s_a = 4.0e-8;
        let dt = 1.0;
        let n = 100usize;
        let t_total = n as f64 * dt;
        let seeds: Vec<u64> = (1..=32).collect();
        let mut sumsq = 0.0;
        for &seed in &seeds {
            let mut a = AccelModel::new("vrw", "unit", 0.0, s_a);
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            for _ in 0..n { a.step(dt, &mut rng); }
            sumsq += a.pos() * a.pos();
        }
        let sd = (sumsq / seeds.len() as f64).sqrt();
        let expected = (s_a * t_total.powi(3) / 3.0).sqrt();
        let rel = (sd - expected).abs() / expected;
        assert!(rel < 0.2, "VRW pos sd={sd} expected={expected} rel={rel}");
    }
}
