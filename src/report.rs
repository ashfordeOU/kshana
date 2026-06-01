use serde::Serialize;
use sha2::{Digest, Sha256};
use crate::fom::{FoMScores, Sample};
use crate::scenario::Scenario;
use crate::types::ModelSpec;

/// One clock's run: its spec, full error series, and scored FoMs.
#[derive(Clone, Debug, Serialize)]
pub struct ClockRun {
    pub spec: ModelSpec,
    pub series: Vec<Sample>,
    pub fom: FoMScores,
}

/// Top-level result artifact (versioned, self-describing, reproducible).
#[derive(Clone, Debug, Serialize)]
pub struct RunResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub quantum: ClockRun,
    pub classical: ClockRun,
}

/// sha256 hex over the canonical JSON of the scenario (field order is stable).
pub fn hash_scenario(scn: &Scenario) -> String {
    let canonical = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(canonical.as_bytes());
    hex::encode(h.finalize())
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::*;

    fn demo() -> Scenario {
        Scenario {
            seed: 1, threshold_ns: 100.0,
            time: TimeCfg { step_s: 10.0, duration_s: 60.0 },
            gnss: GnssTimeline { windows: vec![
                GnssWindow { t0: 0.0, t1: 30.0, state: GnssState::Nominal },
                GnssWindow { t0: 30.0, t1: 60.0, state: GnssState::Denied },
            ]},
            clock_quantum: ClockCfg { id: "q".into(), provenance: "d".into(), y0: 1e-13, q_wf: 1e-26, q_rw: 1e-32 },
            clock_classical: ClockCfg { id: "c".into(), provenance: "d".into(), y0: 1e-11, q_wf: 1e-24, q_rw: 1e-30 },
        }
    }

    #[test]
    fn scenario_hash_is_deterministic_and_sensitive() {
        let a = hash_scenario(&demo());
        let b = hash_scenario(&demo());
        assert_eq!(a, b);
        assert_eq!(a.len(), 64);
        let mut other = demo();
        other.seed = 2;
        assert_ne!(a, hash_scenario(&other));
    }
}
