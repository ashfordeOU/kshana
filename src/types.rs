use serde::{Deserialize, Serialize};

pub type Seconds = f64;

/// A regular time grid starting at t=0.
#[derive(Clone, Debug)]
pub struct TimeGrid {
    pub step: Seconds,
    pub duration: Seconds,
}

impl TimeGrid {
    /// Sample times from 0 to `duration` inclusive (n+1 points).
    pub fn times(&self) -> Vec<Seconds> {
        let n = (self.duration / self.step).round() as usize;
        (0..=n).map(|i| i as f64 * self.step).collect()
    }
}

/// Static description of an active model, with provenance for honesty/reporting.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct ModelSpec {
    pub id: String,
    pub kind: String,
    pub provenance: String,
    pub params: serde_json::Value,
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn time_grid_inclusive_endpoints() {
        let g = TimeGrid {
            step: 1.0,
            duration: 5.0,
        };
        assert_eq!(g.times(), vec![0.0, 1.0, 2.0, 3.0, 4.0, 5.0]);
    }
}
