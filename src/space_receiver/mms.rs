// SPDX-License-Identifier: AGPL-3.0-only
//! The MMS Phase 2B case: the `gnss-ssv` sweep set up like the Magnetospheric Multiscale
//! spacecraft's GPS receiver in its 1.2 × 25 Earth-radii orbit, and compared with the flight
//! results NASA published.
//!
//! **Published values** (Winternitz, Bamford and Price, *New High-Altitude GPS Navigation Results
//! from the Magnetospheric Multiscale Spacecraft and Simulations at Lunar Distances*, NASA
//! Goddard, NTRS 20170009487, 2017; days 142-149 of 2017, MMS observatory 1):
//!
//! * at least one GPS satellite tracked **99 %** of the time, four or more **70 %** of the time;
//! * about **three** signals tracked on average near apogee, up to eight recorded;
//! * the signals tracked near apogee are mostly sidelobe signals at **20 to 30 dB-Hz**;
//! * the orbit is 1.2 × 25 RE; the minimum tracked signal level requirement is −175 dBW.
//!
//! **The model.** GPS only, L1, two-body orbits from the booklet's annex C (not the 2017
//! constellation), the parametric shaped-beam-plus-sidelobe transmit pattern (so sidelobe links
//! count), a 0 dBi omnidirectional receive antenna standing in for MMS's four antennas around the
//! spinning body, and a 20 dB-Hz tracking threshold (the lower end of the published C/N0 band).
//! The inclination (28 degrees) and the phase of the orbit against the constellation are **to
//! confirm**: they are not in the paper. The tolerance was stated before the run: ±15 points on
//! each availability figure and ±1.5 signals on the mean near apogee (beyond 20 RE).
//!
//! The verdict is `reproduced` only when all three lie within it; the published values are cited
//! from the paper's text, and the flight data themselves are not redistributed or fetched here.

use crate::ssv::constellations::{Band, Constellation};
use crate::ssv::pattern::{ParametricPattern, TxPattern, UserAntenna};
use crate::ssv::sweep::{run_trajectory, NoEffects, TrajectoryConfig, UserOrbit};
use serde::Serialize;

/// The honesty label.
pub const LABEL: &str = "MODELLED against cited flight results: the published MMS Phase 2B figures are quoted from \
NTRS 20170009487 (days 142-149 of 2017); the model uses booklet two-body GPS orbits, a representative sidelobe \
pattern and an omni antenna. Inclination and orbit phase are to confirm.";

/// Earth radius used for the RE figures, km.
pub const RE_KM: f64 = 6378.137;

/// Published: percent of time at least one GPS satellite was tracked.
pub const PUBLISHED_AT_LEAST_1_PCT: f64 = 99.0;
/// Published: percent of time four or more were tracked.
pub const PUBLISHED_AT_LEAST_4_PCT: f64 = 70.0;
/// Published: average signals tracked near apogee.
pub const PUBLISHED_MEAN_NEAR_APOGEE: f64 = 3.0;
/// Tolerance on the availability figures, percentage points.
pub const TOL_PCT: f64 = 15.0;
/// Tolerance on the mean near apogee, signals.
pub const TOL_SIGNALS: f64 = 1.5;

/// An MMS-like orbit of perigee and apogee radii in Earth radii (inclination 28 degrees, to confirm).
pub fn orbit(perigee_re: f64, apogee_re: f64) -> UserOrbit {
    UserOrbit {
        a_km: (perigee_re + apogee_re) / 2.0 * RE_KM,
        e: (apogee_re - perigee_re) / (apogee_re + perigee_re),
        i_deg: 28.0,
        raan_deg: 0.0,
        argp_deg: 0.0,
        true_anomaly_deg: 180.0,
    }
}

/// The comparison.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// The orbit.
    pub orbit: UserOrbit,
    /// Orbits simulated.
    pub orbits: f64,
    /// Threshold, dB-Hz.
    pub cn0_min_dbhz: f64,
    /// Modelled: percent of epochs with at least one signal.
    pub at_least_1_pct: f64,
    /// Modelled: percent with four or more.
    pub at_least_4_pct: f64,
    /// Modelled: mean signals beyond 20 RE.
    pub mean_near_apogee: f64,
    /// Modelled: sidelobe share of the links.
    pub sidelobe_share: f64,
    /// Published values `[≥1 %, ≥4 %, mean near apogee]`.
    pub published: [f64; 3],
    /// Tolerances `[points, points, signals]`.
    pub tolerance: [f64; 3],
    /// `reproduced` or `not_reproduced` (the base setting: booklet minimum powers, 25 dB floor).
    pub verdict: &'static str,
    /// The same comparison with extra link margin and a shallower sidelobe floor.
    pub sensitivity: Vec<Sensitivity>,
    /// Source of the published values.
    pub source: &'static str,
}

/// One point of the sensitivity grid.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct Sensitivity {
    /// Extra link margin on every link, dB (the booklet powers are minimums).
    pub margin_db: f64,
    /// Sidelobe floor below the main lobe, dB.
    pub sidelobe_db: f64,
    /// Percent with at least one signal.
    pub at_least_1_pct: f64,
    /// Percent with four or more.
    pub at_least_4_pct: f64,
    /// Mean signals beyond 20 RE.
    pub mean_near_apogee: f64,
    /// Whether all three lie within the tolerance.
    pub within_tolerance: bool,
}

/// The grid of extra margin and sidelobe floor every report carries.
pub const GRID: [(f64, f64); 6] = [
    (0.0, 25.0),
    (5.0, 25.0),
    (10.0, 25.0),
    (0.0, 15.0),
    (5.0, 15.0),
    (10.0, 15.0),
];

/// `(≥1 %, ≥4 %, mean near apogee, sidelobe share)` for one setting.
fn simulate(
    cn0_min_dbhz: f64,
    sidelobe_db: f64,
    orbits: f64,
    step_min: f64,
) -> Result<(f64, f64, f64, f64), String> {
    let o = orbit(1.2, 25.0);
    let cfg = TrajectoryConfig {
        orbit: o,
        duration_min: orbits * o.period_min(),
        step_min,
        cn0_min_dbhz: Some(cn0_min_dbhz),
        constellations: vec![Constellation::Gps],
        bands: vec![Band::L1],
        antennas: vec![(Band::L1, vec![UserAntenna::Omni])],
        tx: TxPattern::Parametric(ParametricPattern {
            sidelobe_db,
            ..ParametricPattern::default()
        }),
        mrtp_reference_alt_km: 36000.0,
        series_every_epochs: 1,
        collect_limb: false,
        beam_override_deg: Vec::new(),
        ablation: Default::default(),
    };
    let r = run_trajectory(&cfg, &NoEffects)?;
    let band = r
        .bands
        .first()
        .ok_or_else(|| crate::terr!("e-ssv-sweep-duration-min-and-step-min"))?;
    let comb = band
        .groups
        .iter()
        .find(|g| g.name == "combined")
        .ok_or_else(|| crate::terr!("e-ssv-sweep-duration-min-and-step-min"))?;
    let near: Vec<f64> = band
        .series
        .iter()
        .filter(|p| (p.altitude_km + 6378.0) / RE_KM > 20.0)
        .map(|p| p.combined as f64)
        .collect();
    let mean_near = if near.is_empty() {
        0.0
    } else {
        near.iter().sum::<f64>() / near.len() as f64
    };
    let links = (comb.main_lobe_links + comb.sidelobe_links).max(1) as f64;
    Ok((
        comb.availability.at_least_1_pct,
        comb.availability.at_least_4_pct,
        mean_near,
        comb.sidelobe_links as f64 / links,
    ))
}

fn within(a1: f64, a4: f64, m: f64) -> bool {
    (a1 - PUBLISHED_AT_LEAST_1_PCT).abs() <= TOL_PCT
        && (a4 - PUBLISHED_AT_LEAST_4_PCT).abs() <= TOL_PCT
        && (m - PUBLISHED_MEAN_NEAR_APOGEE).abs() <= TOL_SIGNALS
}

/// Run the MMS Phase 2B comparison over `orbits` orbits with a step of `step_min`, then the
/// sensitivity grid ([`GRID`]) over the same span.
pub fn run(cn0_min_dbhz: f64, orbits: f64, step_min: f64) -> Result<Report, String> {
    let o = orbit(1.2, 25.0);
    let (a1, a4, mean_near, side) = simulate(cn0_min_dbhz, 25.0, orbits, step_min)?;
    let mut sensitivity = Vec::new();
    for (m, sl) in GRID {
        let (b1, b4, bm, _) = simulate(cn0_min_dbhz - m, sl, orbits, step_min)?;
        sensitivity.push(Sensitivity {
            margin_db: m,
            sidelobe_db: sl,
            at_least_1_pct: b1,
            at_least_4_pct: b4,
            mean_near_apogee: bm,
            within_tolerance: within(b1, b4, bm),
        });
    }
    let ok = within(a1, a4, mean_near);
    Ok(Report {
        schema: "kshana.space-receiver-mms/1",
        label: LABEL,
        orbit: o,
        orbits,
        cn0_min_dbhz,
        at_least_1_pct: a1,
        at_least_4_pct: a4,
        mean_near_apogee: mean_near,
        sidelobe_share: side,
        published: [
            PUBLISHED_AT_LEAST_1_PCT,
            PUBLISHED_AT_LEAST_4_PCT,
            PUBLISHED_MEAN_NEAR_APOGEE,
        ],
        tolerance: [TOL_PCT, TOL_PCT, TOL_SIGNALS],
        verdict: if ok { "reproduced" } else { "not_reproduced" },
        sensitivity,
        source: SOURCE,
    })
}

/// The cited source.
pub const SOURCE: &str = "L. B. Winternitz, W. A. Bamford, S. R. Price, New High-Altitude GPS Navigation Results from \
the Magnetospheric Multiscale Spacecraft and Simulations at Lunar Distances, NASA GSFC, NTRS 20170009487 (2017)";

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_report_states_its_verdict_and_more_margin_never_loses_signals() {
        let r = run(20.0, 1.0, 10.0).unwrap();
        assert!(matches!(r.verdict, "reproduced" | "not_reproduced"));
        assert_eq!(r.sensitivity.len(), GRID.len());
        let s = &r.sensitivity;
        assert!(
            s[0].at_least_1_pct <= s[1].at_least_1_pct
                && s[1].at_least_1_pct <= s[2].at_least_1_pct
        );
        assert_eq!(r.published, [99.0, 70.0, 3.0]);
    }

    #[test]
    fn the_orbit_is_1_2_by_25_re_and_67_hours() {
        let o = orbit(1.2, 25.0);
        let rp = o.a_km * (1.0 - o.e) / RE_KM;
        let ra = o.a_km * (1.0 + o.e) / RE_KM;
        assert!((rp - 1.2).abs() < 1e-9 && (ra - 25.0).abs() < 1e-9);
        // The paper's sample orbit is 67 hours long.
        let h = o.period_min() / 60.0;
        assert!((h - 67.0).abs() < 1.5, "{h}");
    }
}
