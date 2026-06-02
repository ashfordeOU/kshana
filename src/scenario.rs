// SPDX-License-Identifier: Apache-2.0
use crate::types::Seconds;
use serde::{Deserialize, Serialize};

#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum GnssState {
    Nominal,
    Degraded,
    Denied,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct GnssWindow {
    pub t0: Seconds,
    pub t1: Seconds,
    pub state: GnssState,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct GnssTimeline {
    pub windows: Vec<GnssWindow>,
}

impl GnssTimeline {
    /// Half-open lookup [t0, t1); any time outside all windows is treated as Denied.
    pub fn state_at(&self, t: Seconds) -> GnssState {
        for w in &self.windows {
            if t >= w.t0 && t < w.t1 {
                return w.state;
            }
        }
        GnssState::Denied
    }
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct TimeCfg {
    pub step_s: Seconds,
    pub duration_s: Seconds,
}

/// Upper bound on the number of time-grid samples a single run may allocate.
/// A scenario asking for more is rejected rather than allocating a multi-gigabyte
/// `Vec` (e.g. a 1-year duration at a 1 ms step would be ~31 billion samples).
pub const MAX_TIME_STEPS: usize = 50_000_000;

impl TimeCfg {
    /// Validate the time grid before any per-step allocation. Rejects a
    /// non-finite, zero, or negative step or duration, a step larger than the
    /// duration, and a step count exceeding [`MAX_TIME_STEPS`]. Returns the number
    /// of grid points (`n` such that the run iterates `0..=n`).
    pub fn validate(&self) -> Result<usize, String> {
        if !self.step_s.is_finite() || self.step_s <= 0.0 {
            return Err(format!(
                "time.step_s must be finite and > 0 (got {})",
                self.step_s
            ));
        }
        if !self.duration_s.is_finite() || self.duration_s <= 0.0 {
            return Err(format!(
                "time.duration_s must be finite and > 0 (got {})",
                self.duration_s
            ));
        }
        if self.step_s > self.duration_s {
            return Err(format!(
                "time.step_s ({}) must not exceed time.duration_s ({})",
                self.step_s, self.duration_s
            ));
        }
        let n = (self.duration_s / self.step_s).round();
        if !n.is_finite() || n > MAX_TIME_STEPS as f64 {
            return Err(format!(
                "time grid too large: {n} steps exceeds MAX_TIME_STEPS ({MAX_TIME_STEPS}); use a coarser step or shorter duration"
            ));
        }
        Ok(n as usize)
    }
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ClockCfg {
    pub id: String,
    pub provenance: String,
    pub y0: f64,
    pub q_wf: f64,
    pub q_rw: f64,
    #[serde(default)]
    pub drift: f64,
    /// Optional flicker (1/f) FM Allan-deviation floor. Zero/absent = no flicker.
    #[serde(default)]
    pub flicker_floor: f64,
}

fn default_runs() -> usize {
    1
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct Scenario {
    pub seed: u64,
    pub threshold_ns: f64,
    /// Number of Monte Carlo realizations. `1` (default) is a single deterministic
    /// run; `> 1` runs an ensemble and reports confidence bands.
    #[serde(default = "default_runs")]
    pub runs: usize,
    pub time: TimeCfg,
    pub gnss: GnssTimeline,
    pub clock_quantum: ClockCfg,
    pub clock_classical: ClockCfg,
}

#[cfg(test)]
mod tests {
    use super::*;
    fn tl() -> GnssTimeline {
        GnssTimeline {
            windows: vec![
                GnssWindow {
                    t0: 0.0,
                    t1: 1.0,
                    state: GnssState::Nominal,
                },
                GnssWindow {
                    t0: 1.0,
                    t1: 4.0,
                    state: GnssState::Denied,
                },
            ],
        }
    }
    #[test]
    fn state_lookup_is_half_open() {
        assert_eq!(tl().state_at(0.0), GnssState::Nominal);
        assert_eq!(tl().state_at(0.5), GnssState::Nominal);
        assert_eq!(tl().state_at(1.0), GnssState::Denied);
        assert_eq!(tl().state_at(2.0), GnssState::Denied);
        assert_eq!(tl().state_at(9.0), GnssState::Denied);
    }

    #[test]
    fn parses_toml_scenario() {
        let src = r#"
seed = 42
threshold_ns = 100.0
[time]
step_s = 10.0
duration_s = 60.0
[gnss]
windows = [ {t0=0.0,t1=30.0,state="nominal"}, {t0=30.0,t1=60.0,state="denied"} ]
[clock_quantum]
id = "optical"
provenance = "demo"
y0 = 1.0e-13
q_wf = 1.0e-26
q_rw = 1.0e-32
[clock_classical]
id = "csac"
provenance = "demo"
y0 = 1.0e-11
q_wf = 1.0e-24
q_rw = 1.0e-30
"#;
        let scn: Scenario = toml::from_str(src).unwrap();
        assert_eq!(scn.seed, 42);
        assert_eq!(scn.time.duration_s, 60.0);
        assert_eq!(scn.gnss.windows.len(), 2);
        assert_eq!(scn.clock_classical.id, "csac");
    }

    #[test]
    fn time_validate_rejects_bad_grids_and_caps_size() {
        let t = |s, d| TimeCfg {
            step_s: s,
            duration_s: d,
        };
        // Valid grid returns the step count.
        assert_eq!(t(10.0, 60.0).validate().unwrap(), 6);
        // Zero / negative / non-finite step or duration.
        assert!(t(0.0, 60.0).validate().is_err());
        assert!(t(-1.0, 60.0).validate().is_err());
        assert!(t(f64::NAN, 60.0).validate().is_err());
        assert!(t(10.0, 0.0).validate().is_err());
        assert!(t(10.0, f64::INFINITY).validate().is_err());
        // Step larger than the duration.
        assert!(t(61.0, 60.0).validate().is_err());
        // A one-year duration is fine at a sane step (no OOM)...
        assert!(t(10.0, 86_400.0 * 365.0).validate().is_ok());
        // ...but a sub-millisecond step over a year exceeds the sample cap.
        assert!(t(1e-3, 86_400.0 * 365.0).validate().is_err());
    }
}
