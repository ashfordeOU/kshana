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

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ClockCfg {
    pub id: String,
    pub provenance: String,
    pub y0: f64,
    pub q_wf: f64,
    pub q_rw: f64,
    #[serde(default)]
    pub drift: f64,
}

#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct Scenario {
    pub seed: u64,
    pub threshold_ns: f64,
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
}
