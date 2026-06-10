// SPDX-License-Identifier: Apache-2.0
//! The LRO truth: the same vendored NASA/JPL Horizons reconstructed orbit the analytic fit uses
//! (`tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv`), so the DE-grade and analytic results
//! are compared against an *identical* reference — only the force model's frame inputs differ.
//!
//! Columns: `JDTDB, X, Y, Z, VX, VY, VZ` in km / km·s⁻¹, Moon-centred ICRF, `#` comments.

use kshana::precise_od::Observation;

/// The vendored 4-hour, 1-minute LRO arc (241 epochs). Read at compile time from the main crate's
/// fixture tree; this crate is workspace-excluded and never published, so the fixture-exclusion of
/// the `kshana` package does not apply here.
pub const LRO_CSV: &str =
    include_str!("../../../tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv");

/// One Horizons state: TDB Julian Date and Moon-centred ICRF position (m) and velocity (m/s).
pub struct State {
    pub jd_tdb: f64,
    pub pos: [f64; 3],
    pub vel: [f64; 3],
}

/// Parse the Horizons CSV into SI states (km → m, km/s → m/s).
pub fn parse(text: &str) -> Vec<State> {
    let mut out = Vec::new();
    for line in text.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let f: Vec<f64> = line
            .split(',')
            .map(|t| t.trim().parse::<f64>().expect("numeric Horizons field"))
            .collect();
        assert_eq!(f.len(), 7, "expected 7 columns, got {}: {line:?}", f.len());
        out.push(State {
            jd_tdb: f[0],
            pos: [f[1] * 1000.0, f[2] * 1000.0, f[3] * 1000.0],
            vel: [f[4] * 1000.0, f[5] * 1000.0, f[6] * 1000.0],
        });
    }
    out
}

/// Moon-centred ICRF position observations across the whole arc, the epoch (TDB Julian Date), and
/// the Horizons-supplied seed velocity at epoch — matching `agency_lro::lro_observations` exactly.
pub fn observations(text: &str) -> (f64, Vec<Observation>, [f64; 3]) {
    let s = parse(text);
    let e0 = s[0].jd_tdb;
    let v0 = s[0].vel;
    let obs = s
        .iter()
        .map(|st| Observation {
            t: (st.jd_tdb - e0) * 86_400.0,
            pos: st.pos,
            sigma: 1.0,
        })
        .collect();
    (e0, obs, v0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn truth_parses_to_241_epochs_at_one_minute() {
        let s = parse(LRO_CSV);
        assert_eq!(s.len(), 241, "full 4 h LRO arc");
        for w in s.windows(2) {
            let dt = (w[1].jd_tdb - w[0].jd_tdb) * 86_400.0;
            assert!((dt - 60.0).abs() < 1e-3, "step {dt} s not ~60 s");
        }
    }
}
