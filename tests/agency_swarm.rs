// SPDX-License-Identifier: Apache-2.0
//! Swarm-A LEO precise-orbit validation (P4 Wave 4a) against a **real agency product**.
//!
//! Truth is a verbatim slice of ESA's own Swarm Level-2 reduced-dynamic precise science
//! orbit (`SW_OPER_SP3ACOM_2_`, GPS-derived, ITRF / IGb14, ~2 cm) for **Swarm-A** (SP3 id
//! `L47`), 2022-01-01 00:00..03:00 GPS, down-sampled to 60 s. Each SP3 ITRF position is
//! rotated into GCRS through the validated IAU 2006/2000A CIO chain driven by **real IERS
//! finals2000A** Earth-orientation parameters (the same 2022-001 series the Galileo arc
//! uses), then Kshana's full-force precise-OD engine (`precise_od::fit`) fits its epoch
//! state to the arc. Unlike the Galileo MEO case this is a ~430 km LEO arc, so the force
//! model adds **atmospheric drag**; we report the post-fit RMS in 3-D and RTN, both with
//! and without the empirical-acceleration tier, alongside the raw (no-fit) overlap.
//!
//! Honesty note: LEO is drag-dominated and Kshana's density model is a *static*
//! piecewise-exponential (no NRLMSISE-00 / space-weather drivers yet), so the empirical
//! cycle-per-revolution accelerations carry the un-modelled drag. The reduced-dynamic
//! (empirical) tier is the operationally meaningful number for LEO; the pure-force tier is
//! reported too, honestly, so the reader sees what the empirical terms absorb.
//!
//! Fixtures (see `tests/fixtures/agency/NOTICE.md` for provenance + SHA-256):
//!   swarm/SW_OPER_SP3ACOM_2_L47_2022001_3h.sp3   6cd84b78…acb733e
//!   eop/finals2000A_2022001.txt                  6b781d36…cb2ed00f

use kshana::cio::itrs_to_gcrs;
use kshana::eop::EopSeries;
use kshana::precise_od::{fit, EstimatedParams, FitConfig, Observation, PreciseForceModel};
use kshana::sp3::parse_sp3;
use kshana::timescales::{gps_to_tt, julian_date};

const SP3: &str = include_str!("fixtures/agency/swarm/SW_OPER_SP3ACOM_2_L47_2022001_3h.sp3");
const EOP: &str = include_str!("fixtures/agency/eop/finals2000A_2022001.txt");
const SAT: &str = "L47";
/// Geopotential degree/order for the CI fixture. LEO needs more field than MEO; the
/// full-degree (d/o-70) run is the `workflow_dispatch` job.
const DEGREE: usize = 70;
/// Swarm-A cannonball cross-section-to-mass ratio (m²/kg): ~1.0 m² over ~468 kg. `C_R`
/// (SRP) is estimated on top.
const AREA_OVER_MASS: f64 = 0.0021;
/// Fixed drag ballistic coefficient `C_D · A/m` (m²/kg): C_D ≈ 2.2 on the same A/m. The
/// empirical accelerations absorb the residual (static-density) drag mismodelling.
const DRAG_CD_AOM: f64 = 0.0047;

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
        .drag(DRAG_CD_AOM)
        .relativity()
        .tides()
        .with_eop(eop.clone())
}

/// Raw propagation overlap: integrate the seed state once (no fit) and report its 3-D RMS
/// against the observations — the "before" number the estimator improves on.
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
fn swarm_a_leo_reduced_dynamic_fit() {
    let eop = EopSeries::from_finals2000a(EOP);
    let (epoch_jd_tt, obs) = observations_from(SP3, SAT, &eop);
    assert!(
        obs.len() >= 170,
        "expected ~181 L47 epochs in the fixture, got {}",
        obs.len()
    );

    let v0 = seed_velocity(&obs);
    // SRP `C_R` is held at 1.0 (not estimated): at ~430 km drag dominates and SRP is
    // poorly separable from it over a 3 h arc, so estimating C_R against the static-density
    // drag mismodelling is ill-conditioned. The empirical tier carries that mismodelling.
    let initial = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(1.0),
        empirical: None,
    };
    let tmpl = template(DEGREE, epoch_jd_tt, &eop);
    let tol = kshana::integrator::Tolerance {
        rtol: 1e-10,
        atol: 1e-7,
        ..Default::default()
    };

    let raw = raw_overlap_rms(&tmpl, &initial, &obs, &tol);

    // --- Tier 1 (dynamic): estimate epoch state only, against the full static force model ---
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 30,
        tol,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial, &obs, &cfg).expect("Tier-1 fit returns a report");
    eprintln!(
        "Swarm-A L47 LEO (2022-001, SW_OPER_SP3ACOM_2_, d/o {DEGREE}): raw overlap {raw:.2} m\n\
         Tier-1 dynamic (force incl. static drag, C_R=1): 3D RMS = {:.3} m | \
         RTN = [{:.3}, {:.3}, {:.3}] m | n_obs {} edited {} | iters {} converged {}",
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.n_obs,
        rep.n_edited,
        rep.iterations,
        rep.converged,
    );
    assert!(rep.converged, "Tier-1 fit did not converge");
    assert!(rep.rms_3d < raw, "fit did not improve on the raw overlap");
    // Even the pure-dynamic fit (static density, no empirical accelerations) clears the
    // 5 m bar; the ~2.5 m residual is almost entirely along-track (the drag signature).
    assert!(
        rep.rms_3d < 5.0,
        "Swarm-A dynamic 3D RMS {:.3} m exceeds the 5 m bar",
        rep.rms_3d
    );

    // --- Tier 2 (reduced-dynamic): + empirical CPR accelerations absorb un-modelled drag ---
    let initial2 = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(1.0),
        empirical: None,
    };
    let cfg2 = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: false,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 30,
        tol,
    };
    let rep2 = fit(&tmpl, initial2, &obs, &cfg2).expect("Tier-2 fit returns a report");
    eprintln!(
        "Tier-2 + empirical CPR (reduced-dynamic): 3D RMS = {:.3} m | \
         RTN = [{:.3}, {:.3}, {:.3}] m | iters {} converged {}",
        rep2.rms_3d,
        rep2.rms_rtn[0],
        rep2.rms_rtn[1],
        rep2.rms_rtn[2],
        rep2.iterations,
        rep2.converged,
    );
    assert!(rep2.converged, "Tier-2 fit did not converge");
    assert!(
        rep2.rms_3d <= rep.rms_3d + 1e-6,
        "empirical tier should not worsen the fit ({:.3} vs {:.3} m)",
        rep2.rms_3d,
        rep.rms_3d
    );
    // The reduced-dynamic (empirical) tier is the operational LEO orbit: against ESA's own
    // ~2 cm product it fits to ~0.1 m. Assert a sub-decimetre-scale bound with comfortable
    // margin (measured ≈ 0.10 m at d/o-70) so the test pins the quality without flaking on
    // cross-platform floating-point step adaptation.
    assert!(
        rep2.rms_3d < 0.5,
        "Swarm-A reduced-dynamic 3D RMS {:.3} m exceeds the 0.5 m bound",
        rep2.rms_3d
    );
}

/// Full-arc, full-degree Swarm-A validation over a complete day (ignored by default; normal
/// CI has no network). Unlike the Galileo full-arc job there is no plain-`curl` auto-fetch:
/// the ESA dissemination server serves `SW_OPER_SP3ACOM_2_` only through its file-browser
/// session, so download the day's product manually from
/// `https://swarm-diss.eo.esa.int/` → `Level2daily/Latest_baselines/POD/RD/Sat_A/`,
/// unzip the `.sp3`, fetch the IERS `finals2000A.all`, and point these env vars at them:
///   KSHANA_SWARM_SP3    path to the full-day SP3
///   KSHANA_SWARM_EOP    path to the finals2000A file
///   KSHANA_SWARM_SAT    satellite id (default L47 = Swarm-A)
///   KSHANA_SWARM_DEGREE geopotential degree/order (default 70)
/// Same dynamic → reduced-dynamic pipeline as the fixture test, over the whole arc.
#[test]
#[ignore = "online full-arc dispatch; download Swarm SP3 and set KSHANA_SWARM_SP3 / _EOP"]
fn swarm_full_arc_dispatch() {
    let sp3_path = std::env::var("KSHANA_SWARM_SP3").expect("set KSHANA_SWARM_SP3");
    let eop_path = std::env::var("KSHANA_SWARM_EOP").expect("set KSHANA_SWARM_EOP");
    let sat = std::env::var("KSHANA_SWARM_SAT").unwrap_or_else(|_| "L47".to_string());
    let degree: usize = std::env::var("KSHANA_SWARM_DEGREE")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(70);
    let sp3_text = std::fs::read_to_string(&sp3_path).expect("read full-day SP3");
    let eop_text = std::fs::read_to_string(&eop_path).expect("read finals2000A");

    let eop = EopSeries::from_finals2000a(&eop_text);
    let (epoch_jd_tt, obs) = observations_from(&sp3_text, &sat, &eop);
    assert!(
        obs.len() >= 1000,
        "expected a full day of {sat}, got {}",
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
        estimate_cr: false,
        estimate_empirical: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 30,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial, &obs, &cfg).expect("full-arc reduced-dynamic fit");
    eprintln!(
        "Swarm-A {sat} full arc (d/o {degree}, {} obs): reduced-dynamic 3D RMS = {:.3} m | \
         RTN = [{:.3}, {:.3}, {:.3}] m | edited {} | iters {} converged {}",
        rep.n_obs,
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.n_edited,
        rep.iterations,
        rep.converged,
    );
    assert!(rep.converged, "full-arc fit did not converge");
    assert!(
        rep.rms_3d < 5.0,
        "full-arc reduced-dynamic 3D RMS {:.3} m exceeds 5 m",
        rep.rms_3d
    );
}
