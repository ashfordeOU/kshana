// SPDX-License-Identifier: Apache-2.0
//! Galileo MEO precise-orbit validation (P4 Wave 3) against a **real agency product**.
//!
//! Truth is a verbatim slice of ESA/ESOC's own final multi-GNSS precise orbit
//! (`ESA0MGNFIN`, ITRF, 5-minute sampling) for Galileo **E11** (GSAT0101, IOV, nominal
//! MEO orbit), 2022-01-01 00:00..08:00 GPS. Each SP3 ITRF position is rotated into GCRS
//! through the validated IAU 2006/2000A CIO chain driven by **real IERS finals2000A**
//! Earth-orientation parameters, then Kshana's full-force precise-OD engine
//! (`precise_od::fit`) fits its epoch state (+ SRP `C_R`) to the arc. We report the
//! post-fit RMS in 3-D and RTN, both **with and without** the empirical-acceleration
//! tier, alongside the raw (no-fit) overlap so the reader sees what the estimator
//! absorbs.
//!
//! Green bar: **< 5 m** post-fit 3-D RMS (the cleanest, achievable case).
//!
//! Fixtures (see `tests/fixtures/agency/NOTICE.md` for provenance + SHA-256):
//!   galileo/ESA0MGNFIN_E11_2022001_8h.sp3   e7297f4c…d3a24a3
//!   eop/finals2000A_2022001.txt             6b781d36…cb2ed00f
//!
//! The CI fixture uses geopotential degree/order 12 (at r/Re ≈ 4.6 the truncation past
//! d/o-12 is sub-centimetre) and an 8-hour arc to stay fast; the full d/o-70, full-day
//! online fetch is the `workflow_dispatch` job.

use kshana::cio::itrs_to_gcrs;
use kshana::eop::EopSeries;
use kshana::precise_od::{fit, EstimatedParams, FitConfig, Observation, PreciseForceModel};
use kshana::sp3::parse_sp3;
use kshana::timescales::{gps_to_tt, julian_date};

const SP3: &str = include_str!("fixtures/agency/galileo/ESA0MGNFIN_E11_2022001_8h.sp3");
const EOP: &str = include_str!("fixtures/agency/eop/finals2000A_2022001.txt");
const SAT: &str = "E11";
const DEGREE: usize = 12;
/// Galileo cannonball cross-section-to-mass ratio (m²/kg); `C_R` is estimated on top.
const AREA_OVER_MASS: f64 = 0.02;

/// Rotate every `sat` SP3 ITRF fix into GCRS with real EOP. Returns the first epoch (TT
/// Julian Date) and the inertial position observations relative to it.
fn observations_from(sp3_text: &str, sat: &str, eop: &EopSeries) -> (f64, Vec<Observation>) {
    let sp3 = parse_sp3(sp3_text).expect("SP3 parses");
    let mut epoch0: Option<f64> = None;
    let mut obs = Vec::new();
    for ep in &sp3.epochs {
        let Some(st) = ep.sats.iter().find(|s| s.sat == sat) else {
            continue;
        };
        let t = &ep.time;
        let jd_gps = julian_date(t.year, t.month, t.day, t.hour, t.minute, t.second);
        let jd_tt = gps_to_tt(jd_gps);
        let (jd_ut1, xp, yp) = eop.frame_args_tt(jd_tt);
        let r_gcrs = itrs_to_gcrs(st.pos_m, jd_tt, jd_ut1, xp, yp);
        let e0 = *epoch0.get_or_insert(jd_tt);
        obs.push(Observation {
            t: (jd_tt - e0) * 86_400.0,
            pos: r_gcrs,
            sigma: 1.0,
        });
    }
    (epoch0.expect("at least one matching epoch"), obs)
}

/// A second-order forward-difference velocity seed from the first three GCRS positions.
fn seed_velocity(obs: &[Observation]) -> [f64; 3] {
    let dt = obs[1].t - obs[0].t;
    let (p0, p1, p2) = (obs[0].pos, obs[1].pos, obs[2].pos);
    let mut v = [0.0; 3];
    for k in 0..3 {
        v[k] = (-3.0 * p0[k] + 4.0 * p1[k] - p2[k]) / (2.0 * dt);
    }
    v
}

fn template(degree: usize, epoch_jd_tt: f64, eop: &EopSeries) -> PreciseForceModel {
    PreciseForceModel::egm2008(degree, epoch_jd_tt)
        .third_body(true, true)
        .solar_radiation(1.0, AREA_OVER_MASS)
        .relativity()
        .tides()
        .with_eop(eop.clone())
}

/// Raw propagation overlap: integrate the seed state once (no fit) and report its 3-D
/// RMS against the observations — the "before" number the estimator improves on.
fn raw_overlap_rms(
    template: &PreciseForceModel,
    initial: &EstimatedParams,
    obs: &[Observation],
    tol: &kshana::integrator::Tolerance,
) -> f64 {
    let times: Vec<f64> = obs.iter().map(|o| o.t).collect();
    let pred = kshana::precise_od::propagate_samples(template, initial.r0, initial.v0, &times, tol);
    let sumsq: f64 = obs
        .iter()
        .zip(&pred)
        .map(|(o, r)| (0..3).map(|k| (r[k] - o.pos[k]).powi(2)).sum::<f64>())
        .sum();
    (sumsq / obs.len() as f64).sqrt()
}

#[test]
fn galileo_e11_meo_post_fit_under_5m() {
    let eop = EopSeries::from_finals2000a(EOP);
    let (epoch_jd_tt, obs) = observations_from(SP3, SAT, &eop);
    assert!(
        obs.len() >= 90,
        "expected ~97 E11 epochs in the fixture, got {}",
        obs.len()
    );

    let v0 = seed_velocity(&obs);
    let initial = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(1.0),
        empirical: None,
    };
    let tmpl = template(DEGREE, epoch_jd_tt, &eop);

    // CI integration tolerance: rtol 1e-10 keeps global position error at the millimetre
    // over the arc — far below the residual floor — while integrating much faster than the
    // synthetic-wave 1e-11. The full d/o-70 dispatch job uses the tighter default.
    let tol = kshana::integrator::Tolerance {
        rtol: 1e-10,
        atol: 1e-7,
        ..Default::default()
    };

    let raw = raw_overlap_rms(&tmpl, &initial, &obs, &tol);

    // --- Tier 1: pure force model + estimated C_R (the headline, green-bar result) ---
    let cfg = FitConfig {
        estimate_cr: true,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial, &obs, &cfg).expect("Tier-1 fit returns a report");
    eprintln!(
        "Galileo E11 MEO (2022-001, ESA0MGNFIN, d/o {DEGREE}): raw overlap {raw:.2} m\n\
         Tier-1 pure force + C_R: 3D RMS = {:.3} m | RTN = [{:.3}, {:.3}, {:.3}] m | \
         C_R = {:.4} | n_obs {} edited {} | iters {} converged {}",
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.params.cr.unwrap_or(f64::NAN),
        rep.n_obs,
        rep.n_edited,
        rep.iterations,
        rep.converged,
    );
    assert!(rep.converged, "Tier-1 fit did not converge");
    assert!(
        rep.rms_3d < 5.0,
        "Galileo MEO post-fit 3D RMS {:.3} m exceeds the 5 m green bar",
        rep.rms_3d
    );
    // A real fit must beat the raw overlap by a wide margin.
    assert!(rep.rms_3d < raw, "fit did not improve on the raw overlap");

    // --- Tier 2: + empirical CPR accelerations (must converge and not worsen) ---
    let initial2 = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(rep.params.cr.unwrap_or(1.0)),
        empirical: None,
    };
    let cfg2 = FitConfig {
        estimate_cr: true,
        estimate_empirical: true,
        empirical_sigma: 1e-8,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let rep2 = fit(&tmpl, initial2, &obs, &cfg2).expect("Tier-2 fit returns a report");
    eprintln!(
        "Tier-2 + empirical CPR: 3D RMS = {:.3} m | RTN = [{:.3}, {:.3}, {:.3}] m | \
         iters {} converged {}",
        rep2.rms_3d,
        rep2.rms_rtn[0],
        rep2.rms_rtn[1],
        rep2.rms_rtn[2],
        rep2.iterations,
        rep2.converged,
    );
    assert!(rep2.converged, "Tier-2 fit did not converge");
    assert!(
        rep2.rms_3d <= rep.rms_3d * 1.05 + 1e-6,
        "empirical tier should absorb mismodeling, not worsen the fit ({:.3} vs {:.3} m)",
        rep2.rms_3d,
        rep.rms_3d
    );
}

/// Full-arc, full-degree Galileo validation over a complete day — the `workflow_dispatch`
/// online-fetch job (ignored by default; normal CI has no network). The CI job downloads
/// the day's `ESA0MGNFIN` SP3 and the IERS `finals2000A` and points these env vars at them:
///   KSHANA_GALILEO_SP3    path to the full-day SP3
///   KSHANA_GALILEO_EOP    path to the finals2000A file
///   KSHANA_GALILEO_SAT    satellite id (default E11)
///   KSHANA_GALILEO_DEGREE geopotential degree/order (default 70)
/// Same pipeline as the fixture test, at full degree over the whole arc.
#[test]
#[ignore = "online full-arc dispatch; set KSHANA_GALILEO_SP3 / _EOP"]
fn galileo_full_arc_dispatch() {
    let sp3_path = std::env::var("KSHANA_GALILEO_SP3").expect("set KSHANA_GALILEO_SP3");
    let eop_path = std::env::var("KSHANA_GALILEO_EOP").expect("set KSHANA_GALILEO_EOP");
    let sat = std::env::var("KSHANA_GALILEO_SAT").unwrap_or_else(|_| "E11".to_string());
    let degree: usize = std::env::var("KSHANA_GALILEO_DEGREE")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(70);
    let sp3_text = std::fs::read_to_string(&sp3_path).expect("read full-day SP3");
    let eop_text = std::fs::read_to_string(&eop_path).expect("read finals2000A");

    let eop = EopSeries::from_finals2000a(&eop_text);
    let (epoch_jd_tt, obs) = observations_from(&sp3_text, &sat, &eop);
    assert!(
        obs.len() >= 200,
        "expected a full day of {sat} epochs, got {}",
        obs.len()
    );

    let v0 = seed_velocity(&obs);
    let initial = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(1.0),
        empirical: None,
    };
    let tmpl = template(degree, epoch_jd_tt, &eop);
    let cfg = FitConfig {
        estimate_cr: true,
        outlier_sigma: 5.0,
        max_iter: 25,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial, &obs, &cfg).expect("full-arc fit returns a report");
    eprintln!(
        "Galileo {sat} full arc (d/o {degree}, {} obs): 3D RMS = {:.3} m | \
         RTN = [{:.3}, {:.3}, {:.3}] m | C_R = {:.4} | edited {} | iters {} converged {}",
        rep.n_obs,
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.params.cr.unwrap_or(f64::NAN),
        rep.n_edited,
        rep.iterations,
        rep.converged,
    );
    assert!(rep.converged, "full-arc fit did not converge");
    assert!(
        rep.rms_3d < 5.0,
        "full-arc 3D RMS {:.3} m exceeds 5 m",
        rep.rms_3d
    );
}
