// SPDX-License-Identifier: AGPL-3.0-only
//! Shared scalar and specification types used across the engine (e.g. `Seconds`,
//! `ModelSpec`).
use serde::{Deserialize, Serialize};

/// A duration or time in seconds.
pub type Seconds = f64;

/// A regular time grid starting at t=0.
#[derive(Clone, Debug)]
pub struct TimeGrid {
    /// Interval between grid points (s).
    pub step: Seconds,
    /// Total span of the grid (s).
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
    /// Stable identifier of the model.
    pub id: String,
    /// Kind of model, e.g. `time-transfer`.
    pub kind: String,
    /// Where the model figures come from.
    pub provenance: String,
    /// The model parameters, as JSON.
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
