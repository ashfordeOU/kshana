// SPDX-License-Identifier: Apache-2.0
//! The DE-grade LRO fit: identical to `tests/agency_lro.rs` except the force model carries an
//! [`AniseLunarEnvironment`] instead of the analytic one. Same estimator, same gravity field, same
//! truth, same config (degree 100, empirical 1σ = 1e-7). The only variable is the frame fidelity.

use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::lunar_od::LunarForceModel;
use kshana::precise_od::{
    fit, propagate_samples, EstimatedParams, FitConfig, Observation, OdReport,
};

use crate::anise_env::AniseLunarEnvironment;
use crate::report::{Report, TierResult};
use crate::truth;

/// GRAIL primary-mission lunar gravity field GRGM660PRIM (d/o 150 fixture, PA frame). Same file the
/// analytic fit reads — only the orientation that *places* this field changes here.
const GRGM: &str = include_str!("../../../tests/fixtures/agency/lro/GRGM660PRIM_to150.gfc");

/// Geopotential degree/order, matching the analytic CI fit (`agency_lro::FIT_DEGREE`).
const FIT_DEGREE: usize = 100;

/// The < 5 m reference-grade bar.
const BAR_M: f64 = 5.0;

fn raw_overlap_rms(
    tmpl: &LunarForceModel<AniseLunarEnvironment>,
    initial: &EstimatedParams,
    obs: &[Observation],
    tol: &Tolerance,
) -> f64 {
    let times: Vec<f64> = obs.iter().map(|o| o.t).collect();
    let pred = propagate_samples(tmpl, initial.r0, initial.v0, &times, tol);
    let sumsq: f64 = obs
        .iter()
        .zip(&pred)
        .map(|(o, r)| (0..3).map(|k| (r[k] - o.pos[k]).powi(2)).sum::<f64>())
        .sum();
    (sumsq / obs.len() as f64).sqrt()
}

fn tier(name: &str, rep: &OdReport) -> TierResult {
    TierResult {
        tier: name.to_string(),
        rms_3d: rep.rms_3d,
        rms_rtn: rep.rms_rtn,
        iterations: rep.iterations,
        converged: rep.converged,
        n_obs: rep.n_obs,
        n_edited: rep.n_edited,
    }
}

/// Run the dynamic and reduced-dynamic DE-grade fits and assemble the honest report.
pub fn run(
    env: AniseLunarEnvironment,
    kernel_sha256: Vec<(String, String)>,
) -> Result<Report, String> {
    let (epoch, obs, v0) = truth::observations(truth::LRO_CSV);
    let field = SphericalHarmonicField::from_gfc(GRGM, FIT_DEGREE)
        .map_err(|e| format!("load GRGM660PRIM d/o {FIT_DEGREE}: {e}"))?;
    let tmpl = LunarForceModel::with_env(field, epoch, env);
    let tol = Tolerance {
        rtol: 1e-10,
        atol: 1e-6,
        ..Default::default()
    };

    let initial = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let raw = raw_overlap_rms(&tmpl, &initial, &obs, &tol);

    // Dynamic: estimate the epoch state only.
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let dyn_rep = fit(&tmpl, initial, &obs, &cfg).ok_or("dynamic fit returned no report")?;

    // Reduced-dynamic: + 1-and-2-per-rev empirical accelerations, a-priori 1σ held at the
    // Swarm-consistent 1e-7 — NOT tuned to chase the bar.
    let initial2 = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let cfg2 = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let red_rep =
        fit(&tmpl, initial2, &obs, &cfg2).ok_or("reduced-dynamic fit returned no report")?;

    let reduced = tier("reduced-dynamic", &red_rep);
    let meets_bar = reduced.converged && reduced.rms_3d < BAR_M;

    Ok(Report {
        dataset: "LRO (NAIF −85), 2022-001, Moon-centred ICRF, 4 h / 241 epochs".to_string(),
        truth: "JPL Horizons reconstructed orbit (DE-grade)".to_string(),
        orientation: "DE440 lunar principal axis (moon_pa_de440_200625.bpc, via ANISE)".to_string(),
        ephemeris: "JPL DE440 (de440s.bsp, via ANISE)".to_string(),
        gravity_field: "GRAIL GRGM660PRIM".to_string(),
        fit_degree: FIT_DEGREE,
        empirical_sigma: 1e-7,
        n_obs: obs.len(),
        raw_overlap_rms_m: raw,
        dynamic: tier("dynamic", &dyn_rep),
        reduced_dynamic: reduced,
        bar_m: BAR_M,
        meets_bar,
        kernel_sha256,
    })
}
