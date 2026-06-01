use serde::{Deserialize, Serialize};
use crate::types::Seconds;

#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum GnssState { Nominal, Degraded, Denied }

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
            if t >= w.t0 && t < w.t1 { return w.state; }
        }
        GnssState::Denied
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    fn tl() -> GnssTimeline {
        GnssTimeline { windows: vec![
            GnssWindow { t0: 0.0, t1: 1.0, state: GnssState::Nominal },
            GnssWindow { t0: 1.0, t1: 4.0, state: GnssState::Denied },
        ]}
    }
    #[test]
    fn state_lookup_is_half_open() {
        assert_eq!(tl().state_at(0.0), GnssState::Nominal);
        assert_eq!(tl().state_at(0.5), GnssState::Nominal);
        assert_eq!(tl().state_at(1.0), GnssState::Denied);
        assert_eq!(tl().state_at(2.0), GnssState::Denied);
        assert_eq!(tl().state_at(9.0), GnssState::Denied);
    }
}
