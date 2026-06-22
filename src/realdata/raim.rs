// SPDX-License-Identifier: AGPL-3.0-only
//! Pseudorange-RAIM adapter: per-epoch consistency statistic as a `raim` observation.
//!
//! "RAIM derivable from pseudoranges" means a full position solve, not a single
//! channel — so this adapter is a thin wire over the validated SPP/RAIM pipeline:
//! [`parse_obs`] + [`parse_nav`] → [`assemble_epoch`] (satellite ECEF, clock,
//! iono/tropo) → [`solve_spp`] → post-fit residuals → [`snapshot_raim`]. The per-epoch
//! `test_statistic` (`SSE/σ²`, χ²(n−4) under the no-fault null) is the detector score;
//! it rises with measurement inconsistency, so it is [`Orient::Raw`].
//!
//! Source: any RINEX-3 observation + broadcast-navigation pair (Yunnan University,
//! Jammertest 2024). One `raim` observation is emitted per epoch with ≥ 5 usable
//! satellites and a converged solve.

use super::{Observation, Orient};
use crate::gnss_sim::Meteo;
use crate::pvt::{
    assemble_epoch, klobuchar_from_nav_header, solve_spp, AtmosModel, SppMeasurement,
};
use crate::raim::snapshot_raim;
use crate::rinex::parse_nav;
use crate::rinex_obs::parse_obs;

/// Elevation mask (deg) used when assembling each epoch — matches the SPP default.
const MASK_DEG: f64 = 5.0;
/// Missed-detection probability for the RAIM protection levels (unused by the score,
/// which is the test statistic, but required by [`snapshot_raim`]).
const P_MD: f64 = 1e-3;

/// Predicted pseudorange at the solved receiver state, identical to the SPP solver's
/// model: geometric range + receiver clock − satellite clock + ionosphere + troposphere.
fn predicted_range_at(rx_ecef: [f64; 3], clock_bias_m: f64, m: &SppMeasurement) -> f64 {
    let dx = m.sat_ecef[0] - rx_ecef[0];
    let dy = m.sat_ecef[1] - rx_ecef[1];
    let dz = m.sat_ecef[2] - rx_ecef[2];
    (dx * dx + dy * dy + dz * dz).sqrt() + clock_bias_m - m.sat_clock_m + m.iono_m + m.tropo_m
}

/// Extract one `raim` observation per solvable epoch from a RINEX observation + broadcast
/// navigation pair. `apriori` seeds the solve (falls back to the observation header's
/// APPROX POSITION XYZ); `sigma_m` is the 1-σ pseudorange error normalising the χ²
/// statistic; `p_fa` sets the detection threshold (it does not change the score).
///
/// Returns an error only when the files are malformed or no a-priori position is
/// available; epochs with too few satellites or a singular geometry are simply skipped.
pub fn observations(
    obs_rinex: &str,
    nav_rinex: &str,
    apriori: Option<[f64; 3]>,
    sigma_m: f64,
    p_fa: f64,
) -> Result<Vec<Observation>, String> {
    let obs = parse_obs(obs_rinex)?;
    let ephs = parse_nav(nav_rinex)?;
    let atmos = AtmosModel {
        iono: klobuchar_from_nav_header(nav_rinex).unwrap_or_default(),
        meteo: Meteo::default(),
    };
    let apriori = apriori.or(obs.header.approx_xyz).ok_or_else(|| {
        "no a-priori position: pass one or supply an observation-header APPROX POSITION XYZ"
            .to_string()
    })?;

    let mut out = Vec::new();
    for idx in 0..obs.epochs.len() {
        let labeled = assemble_epoch(&obs, idx, &ephs, apriori, &atmos, MASK_DEG, true);
        let meas: Vec<SppMeasurement> = labeled.iter().map(|(_, m)| *m).collect();
        if meas.len() < 5 {
            continue; // RAIM needs redundancy (dof = n - 4 >= 1)
        }
        let Some(fix) = solve_spp(&meas, apriori) else {
            continue;
        };
        let sats: Vec<[f64; 3]> = meas.iter().map(|m| m.sat_ecef).collect();
        let resid: Vec<f64> = meas
            .iter()
            .map(|m| m.pseudorange_m - predicted_range_at(fix.ecef, fix.clock_bias_m, m))
            .collect();
        if let Some(r) = snapshot_raim(fix.ecef, &sats, &resid, sigma_m, p_fa, P_MD) {
            out.push(Observation::new("raim", r.test_statistic, Orient::Raw));
        }
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn missing_apriori_with_no_header_position_is_an_error() {
        // Junk obs has no APPROX POSITION XYZ and no apriori is passed.
        let err = observations("junk", "junk", None, 5.0, 1e-5);
        assert!(err.is_err());
    }

    #[test]
    fn malformed_observation_file_propagates_as_error_not_panic() {
        // An epoch-less observation file is rejected by the underlying parser; the
        // adapter surfaces that as Err rather than panicking.
        let obs = "x RINEX VERSION / TYPE\nEND OF HEADER\n";
        let out = observations(
            obs,
            "junk-nav",
            Some([2_919_786.0, -5_383_745.0, 1_774_604.0]),
            5.0,
            1e-5,
        );
        assert!(out.is_err());
    }

    // The real-data behaviour (statistic finite and positive over genuine IGS RINEX)
    // is covered by the integration test tests/realdata_raim_igs.rs, which drives this
    // adapter with the same ABMF fixtures the SPP solver is validated against.
}
