// SPDX-License-Identifier: Apache-2.0
use crate::scenario::{GnssState, GnssTimeline, TimeCfg};
use crate::types::{ModelSpec, Seconds};
use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Standard gravity (m/s^2), the conventional value (CGPM 1901).
pub const G_M_PER_S2: f64 = 9.806_65;

/// Inertial error model for dead-reckoning a static platform.
///
/// Accelerometer channel: a residual (post-GNSS-calibration) bias plus white
/// acceleration noise (velocity random walk). Gyro channel (optional): an
/// attitude error `theta` driven by a residual gyro bias and angular random
/// walk; a tilt error couples gravity into a horizontal specific-force error of
/// `g * theta` — the dominant error-growth mechanism in strapdown inertial
/// navigation (Groves). The specific-force error integrates twice, so `pos()`
/// is the accumulated dead-reckoning position error (m). Static-platform truth
/// (true acceleration = 0, true attitude rate = 0).
#[derive(Clone, Debug)]
pub struct AccelModel {
    pub id: String,
    pub provenance: String,
    pub bias: f64, // residual accel bias (m/s^2), post-GNSS-calibration (= bias stability)
    pub q_va: f64, // white acceleration PSD S_a ((m/s^2)^2/Hz) -> velocity random walk
    pub q_aa: f64, // acceleration random-walk PSD ((m/s^2)^2/s) -> rate random walk
    pub gyro_bias: f64, // residual gyro bias (rad/s)
    pub q_arw: f64, // white angular-rate PSD ((rad/s)^2/Hz) -> angular random walk
    bias_instability: Option<crate::models::Flicker>, // 1/f accel bias instability
    bias_rw: f64,  // accumulated acceleration random-walk bias (m/s^2)
    theta: f64,    // accumulated attitude (tilt) error (rad)
    vel: f64,
    pos: f64,
}

impl AccelModel {
    pub fn new(id: &str, provenance: &str, bias: f64, q_va: f64) -> Self {
        Self {
            id: id.into(),
            provenance: provenance.into(),
            bias,
            q_va,
            q_aa: 0.0,
            gyro_bias: 0.0,
            q_arw: 0.0,
            bias_instability: None,
            bias_rw: 0.0,
            theta: 0.0,
            vel: 0.0,
            pos: 0.0,
        }
    }
    /// Builder: add a gyro channel with residual bias (rad/s) and angular-random-walk
    /// PSD `q_arw` ((rad/s)^2/Hz). Tilt error couples gravity into horizontal error.
    pub fn with_gyro(mut self, gyro_bias: f64, q_arw: f64) -> Self {
        self.gyro_bias = gyro_bias;
        self.q_arw = q_arw;
        self
    }
    /// Builder: add accelerometer **bias instability** — a 1/f flicker floor whose
    /// flat Allan deviation sits at `sigma_bi` (m/s^2), the standard IMU
    /// bias-instability coefficient. Zero is a no-op.
    pub fn with_bias_instability(mut self, sigma_bi: f64) -> Self {
        if sigma_bi > 0.0 {
            self.bias_instability = Some(crate::models::Flicker::new(sigma_bi, 1.0, 1e5, 4));
        }
        self
    }
    /// Builder: add **acceleration random walk** with PSD `q_aa` ((m/s^2)^2/s), the
    /// random-walk term of the Allan curve (rate random walk).
    pub fn with_accel_random_walk(mut self, q_aa: f64) -> Self {
        self.q_aa = q_aa;
        self
    }
    /// Re-align to GNSS truth: zero the accumulated dead-reckoning error, tilt, and
    /// the residual sensor-bias drift (the fix re-calibrates the bias estimate).
    pub fn reset(&mut self) {
        self.theta = 0.0;
        self.vel = 0.0;
        self.pos = 0.0;
        self.bias_rw = 0.0;
        if let Some(f) = &mut self.bias_instability {
            f.reset();
        }
    }
    pub fn pos(&self) -> f64 {
        self.pos
    }
    /// Accumulated attitude (tilt) error (rad).
    pub fn theta(&self) -> f64 {
        self.theta
    }
    /// Accumulated acceleration random-walk bias (m/s^2).
    pub fn accel_bias_rw(&self) -> f64 {
        self.bias_rw
    }
    pub fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore) {
        if dt <= 0.0 {
            return;
        }
        // Attitude error: gyro bias + angular random walk.
        self.theta += self.gyro_bias * dt;
        if self.q_arw > 0.0 {
            let n = Normal::new(0.0, (self.q_arw * dt).sqrt()).unwrap();
            self.theta += n.sample(rng);
        }
        // Acceleration random walk: the bias does a random walk (increment variance
        // q_aa*dt).
        if self.q_aa > 0.0 {
            let n = Normal::new(0.0, (self.q_aa * dt).sqrt()).unwrap();
            self.bias_rw += n.sample(rng);
        }
        // 1/f bias instability contribution (acceleration).
        let bi = self
            .bias_instability
            .as_mut()
            .map_or(0.0, |f| f.step(dt, rng));
        // Specific-force error: constant + random-walk + flicker bias, plus
        // tilt-coupled gravity (g * theta).
        self.vel += (self.bias + self.bias_rw + bi + G_M_PER_S2 * self.theta) * dt;
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
            kind: "inertial".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({
                "bias": self.bias,
                "q_va": self.q_va,
                "q_aa": self.q_aa,
                "gyro_bias": self.gyro_bias,
                "q_arw": self.q_arw,
                "bias_instability": self.bias_instability.is_some(),
            }),
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
    let within = samples
        .iter()
        .filter(|s| s.error_m.abs() <= threshold_m)
        .count();
    let availability = within as f64 / n;

    let outage: Vec<&PosSample> = samples
        .iter()
        .filter(|s| s.gnss != GnssState::Nominal)
        .collect();
    if outage.is_empty() {
        return PositionFoM {
            pos_rms_m: 0.0,
            pos_p95_m: 0.0,
            holdover_s: 0.0,
            drift_slope_m_per_s: 0.0,
            availability,
            integrity: None,
            security: None,
        };
    }
    let m = outage.len() as f64;
    let sumsq: f64 = outage.iter().map(|s| s.error_m * s.error_m).sum();
    let pos_rms_m = (sumsq / m).sqrt();
    let mut abs: Vec<f64> = outage.iter().map(|s| s.error_m.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let pos_p95_m = abs.get(idx).copied().unwrap_or(0.0);
    // Holdover: worst-case (shortest) coast across outage segments, grid-bounded.
    let segs: Vec<(Seconds, bool, bool)> = samples
        .iter()
        .map(|s| {
            (
                s.t,
                s.gnss != GnssState::Nominal,
                s.error_m.abs() > threshold_m,
            )
        })
        .collect();
    let holdover_s = crate::fom::worst_case_holdover(&segs);
    let mean_t = outage.iter().map(|s| s.t).sum::<f64>() / m;
    let mean_y = outage.iter().map(|s| s.error_m.abs()).sum::<f64>() / m;
    let mut num = 0.0;
    let mut den = 0.0;
    for s in &outage {
        num += (s.t - mean_t) * (s.error_m.abs() - mean_y);
        den += (s.t - mean_t) * (s.t - mean_t);
    }
    let drift_slope_m_per_s = if den > 0.0 { num / den } else { 0.0 };
    PositionFoM {
        pos_rms_m,
        pos_p95_m,
        holdover_s,
        drift_slope_m_per_s,
        availability,
        integrity: None,
        security: None,
    }
}

/// Inertial-sensor configuration in a scenario file.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct AccelCfg {
    pub id: String,
    pub provenance: String,
    pub bias: f64,
    pub q_va: f64,
    /// Optional residual gyro bias (rad/s). Zero/absent = no gyro channel.
    #[serde(default)]
    pub gyro_bias: f64,
    /// Optional angular-random-walk PSD ((rad/s)^2/Hz). Zero/absent = none.
    #[serde(default)]
    pub q_arw: f64,
    /// Optional acceleration-random-walk PSD ((m/s^2)^2/s). Zero/absent = none.
    #[serde(default)]
    pub q_aa: f64,
    /// Optional accelerometer bias-instability Allan floor (m/s^2). Zero/absent = none.
    #[serde(default)]
    pub bias_instability: f64,
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

fn run_accel(scn: &InertialScenario, cfg: &AccelCfg, seed: u64) -> AccelRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut a = AccelModel::new(&cfg.id, &cfg.provenance, cfg.bias, cfg.q_va)
        .with_gyro(cfg.gyro_bias, cfg.q_arw)
        .with_accel_random_walk(cfg.q_aa)
        .with_bias_instability(cfg.bias_instability);
    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let mut series = Vec::with_capacity(n + 1);
    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            a.step(dt, &mut rng);
        }
        let gnss = scn.gnss.state_at(t);
        let error_m = match gnss {
            GnssState::Nominal => {
                a.reset();
                0.0
            }
            _ => a.pos(),
        };
        series.push(PosSample { t, error_m, gnss });
    }
    let fom = score_position(&series, scn.threshold_m);
    AccelRun {
        spec: a.spec(),
        series,
        fom,
    }
}

/// Run a dead-reckoning scenario for both accelerometers.
pub fn run_inertial(scn: &InertialScenario) -> InertialResult {
    InertialResult {
        schema_version: "0.1".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_inertial(scn),
        seed: scn.seed,
        threshold_m: scn.threshold_m,
        quantum: run_accel(scn, &scn.accel_quantum, scn.seed),
        classical: run_accel(
            scn,
            &scn.accel_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
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
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |e: f64| mt + ph - (e.min(y_max) / y_max) * ph;
    let points = |series: &[PosSample]| {
        series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.error_m.abs())))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(result.threshold_m);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\">"));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"white\"/>"
    ));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Dead-reckoning position error during GNSS outage</text>", ml));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "position error (m)",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#888\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#888\"/>",
        ml + pw
    ));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#d33\" stroke-dasharray=\"6 4\"/>", ml + pw));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#d33\">spec {:.0} m</text>",
        ml + 4.0,
        thr_y - 4.0,
        result.threshold_m
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{}\"/>",
        points(c)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#2471a3\" stroke-width=\"2\" points=\"{}\"/>",
        points(q)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#c0392b\">classical: {}</text>",
        ml + 10.0,
        result.classical.spec.id
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#2471a3\">quantum: {}</text>",
        ml + 10.0,
        result.quantum.spec.id
    ));
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
        for _ in 0..4 {
            a.step(1.0, &mut rng);
        }
        assert!((a.pos() - 1e-2).abs() < 1e-15);
    }

    #[test]
    fn reset_zeroes_error() {
        let mut a = AccelModel::new("b", "unit", 1e-3, 0.0).with_gyro(1e-5, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..4 {
            a.step(1.0, &mut rng);
        }
        a.reset();
        assert_eq!(a.pos(), 0.0);
        assert_eq!(a.theta(), 0.0);
    }

    #[test]
    fn pure_gyro_bias_triple_integrates_through_gravity() {
        // Gyro bias b_g tilts the platform: theta_k = b_g*dt*k. The tilt couples
        // gravity into a horizontal specific-force error g*theta, which double
        // integrates. With theta updated before the velocity update each step,
        // pos_N = g * b_g * dt^3 * N(N+1)(N+2)/6.
        // b_g=1e-6, dt=1, N=4: g*1e-6*1*(4*5*6/6) = g*1e-6*20 = 9.80665e-6*20.
        let mut a = AccelModel::new("g", "unit", 0.0, 0.0).with_gyro(1e-6, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..4 {
            a.step(1.0, &mut rng);
        }
        let expected = G_M_PER_S2 * 1e-6 * 20.0;
        assert!((a.pos() - expected).abs() < 1e-15, "pos={}", a.pos());
    }

    #[test]
    fn angular_random_walk_attitude_grows_as_wiener() {
        // Pure ARW: theta is a Wiener process with Var(theta_T) = q_arw * T, so
        // sigma_theta(T) = sqrt(q_arw * T). Seed-averaged check.
        let q_arw = 4.0e-10;
        let dt = 1.0;
        let n = 100usize;
        let t_total = n as f64 * dt;
        let seeds: Vec<u64> = (1..=64).collect();
        let mut sumsq = 0.0;
        for &seed in &seeds {
            let mut a = AccelModel::new("arw", "unit", 0.0, 0.0).with_gyro(0.0, q_arw);
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            for _ in 0..n {
                a.step(dt, &mut rng);
            }
            sumsq += a.theta() * a.theta();
        }
        let sd = (sumsq / seeds.len() as f64).sqrt();
        let expected = (q_arw * t_total).sqrt();
        let rel = (sd - expected).abs() / expected;
        assert!(rel < 0.2, "ARW theta sd={sd} expected={expected} rel={rel}");
    }

    #[test]
    fn accel_random_walk_bias_grows_as_wiener() {
        // Pure acceleration random walk: the bias is a Wiener process with
        // Var(bias_rw(T)) = q_aa * T, so sigma = sqrt(q_aa * T). Seed-averaged.
        let q_aa = 9.0e-12;
        let dt = 1.0;
        let n = 100usize;
        let t_total = n as f64 * dt;
        let seeds: Vec<u64> = (1..=64).collect();
        let mut sumsq = 0.0;
        for &seed in &seeds {
            let mut a = AccelModel::new("rw", "unit", 0.0, 0.0).with_accel_random_walk(q_aa);
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            for _ in 0..n {
                a.step(dt, &mut rng);
            }
            sumsq += a.accel_bias_rw() * a.accel_bias_rw();
        }
        let sd = (sumsq / seeds.len() as f64).sqrt();
        let expected = (q_aa * t_total).sqrt();
        let rel = (sd - expected).abs() / expected;
        assert!(
            rel < 0.2,
            "accel-RW bias sd={sd} expected={expected} rel={rel}"
        );
    }

    #[test]
    fn zero_bias_instability_is_a_noop() {
        // with_bias_instability(0.0) must add nothing: identical position to the
        // base accelerometer for the same seed.
        let run = |bi: f64| {
            let mut a = AccelModel::new("b", "unit", 1e-4, 4e-8).with_bias_instability(bi);
            let mut rng = ChaCha8Rng::seed_from_u64(9);
            for _ in 0..200 {
                a.step(1.0, &mut rng);
            }
            a.pos()
        };
        assert_eq!(run(0.0), run(0.0));
        // A real bias-instability floor changes the trajectory and is reproducible.
        let with_bi = {
            let mut a = AccelModel::new("b", "unit", 1e-4, 4e-8).with_bias_instability(1e-5);
            let mut rng = ChaCha8Rng::seed_from_u64(9);
            for _ in 0..200 {
                a.step(1.0, &mut rng);
            }
            a.pos()
        };
        assert_ne!(with_bi, run(0.0));
    }

    #[test]
    fn reset_clears_bias_random_walk() {
        let mut a = AccelModel::new("b", "unit", 0.0, 0.0).with_accel_random_walk(1e-10);
        let mut rng = ChaCha8Rng::seed_from_u64(3);
        for _ in 0..50 {
            a.step(1.0, &mut rng);
        }
        a.reset();
        assert_eq!(a.accel_bias_rw(), 0.0);
        assert_eq!(a.pos(), 0.0);
    }

    #[test]
    fn same_seed_reproducible() {
        let run = || {
            let mut a = AccelModel::new("q", "unit", 0.0, 4e-8);
            let mut rng = ChaCha8Rng::seed_from_u64(5);
            for _ in 0..200 {
                a.step(1.0, &mut rng);
            }
            a.pos()
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn hand_derived_position_scores() {
        let s = |t: f64, e: f64| PosSample {
            t,
            error_m: e,
            gnss: Denied,
        };
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
            for _ in 0..n {
                a.step(dt, &mut rng);
            }
            sumsq += a.pos() * a.pos();
        }
        let sd = (sumsq / seeds.len() as f64).sqrt();
        let expected = (s_a * t_total.powi(3) / 3.0).sqrt();
        let rel = (sd - expected).abs() / expected;
        assert!(rel < 0.2, "VRW pos sd={sd} expected={expected} rel={rel}");
    }
}
