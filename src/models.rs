use rand::RngCore;
use rand_distr::{Distribution, Normal};
use crate::types::{ModelSpec, Seconds};

/// A sensor/clock error model: evolve internal error state, expose a spec.
pub trait ErrorModel {
    fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore);
    fn spec(&self) -> ModelSpec;
}

/// Clock error model: deterministic fractional-frequency offset `y0`, linear
/// aging `drift` (per second), white FM (`q_wf`), and random-walk FM (`q_rw`).
#[derive(Clone, Debug)]
pub struct ClockModel {
    pub id: String,
    pub provenance: String,
    pub y0: f64,
    pub q_wf: f64,
    pub q_rw: f64,
    pub drift: f64,
    phase: Seconds,
    freq: f64,
    t: Seconds,
}

impl ClockModel {
    pub fn new(id: &str, provenance: &str, y0: f64, q_wf: f64, q_rw: f64) -> Self {
        Self { id: id.into(), provenance: provenance.into(), y0, q_wf, q_rw,
               drift: 0.0, phase: 0.0, freq: 0.0, t: 0.0 }
    }
    /// Builder: set linear fractional-frequency aging rate (per second).
    pub fn with_drift(mut self, drift: f64) -> Self { self.drift = drift; self }
    pub fn phase(&self) -> Seconds { self.phase }
    /// Instantaneous deterministic (calibratable) frequency = y0 + drift*t.
    pub fn det_freq(&self) -> f64 { self.y0 + self.drift * self.t }
    /// Deterministic aging rate (per second).
    pub fn drift_rate(&self) -> f64 { self.drift }
}

impl ErrorModel for ClockModel {
    fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore) {
        if dt <= 0.0 { return; }
        if self.q_rw > 0.0 {
            let n = Normal::new(0.0, (self.q_rw * dt).sqrt()).unwrap();
            self.freq += n.sample(rng);
        }
        let y_det = self.y0 + self.drift * self.t;
        let mut dx = (y_det + self.freq) * dt;
        if self.q_wf > 0.0 {
            let n = Normal::new(0.0, (self.q_wf * dt).sqrt()).unwrap();
            dx += n.sample(rng);
        }
        self.phase += dx;
        self.t += dt;
    }
    fn spec(&self) -> ModelSpec {
        ModelSpec {
            id: self.id.clone(),
            kind: "clock".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({ "y0": self.y0, "q_wf": self.q_wf, "q_rw": self.q_rw, "drift": self.drift }),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    #[test]
    fn deterministic_freq_offset_no_noise() {
        let mut c = ClockModel::new("test", "unit", 1e-9, 0.0, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..10 { c.step(1.0, &mut rng); }
        assert!((c.phase() - 1e-8).abs() < 1e-18);
    }

    #[test]
    fn same_seed_is_reproducible() {
        let run = || {
            let mut c = ClockModel::new("q", "unit", 0.0, 1e-20, 1e-24);
            let mut rng = ChaCha8Rng::seed_from_u64(42);
            for _ in 0..100 { c.step(1.0, &mut rng); }
            c.phase()
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn pure_aging_accumulates_quadratically() {
        // drift d, y0=0, no noise, dt=1, N steps: phase = d * sum_{i=0}^{N-1} i = d*N(N-1)/2
        let mut c = ClockModel::new("age", "unit", 0.0, 0.0, 0.0).with_drift(1e-9);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        for _ in 0..4 { c.step(1.0, &mut rng); } // 1e-9 * (4*3/2)=6 -> 6e-9
        assert!((c.phase() - 6e-9).abs() < 1e-20);
    }
}
