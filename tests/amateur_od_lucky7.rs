// SPDX-License-Identifier: AGPL-3.0-only
//! B2208: amateur-RF orbit determination and unknown-object identification for a 1U CubeSat.
//!
//! The published case is Lucky-7 (NORAD 44406, launched 2019-07-05 on Soyuz 2019-038), as worked
//! in public by D. Estévez, "Precise orbit determination for Lucky-7" (destevez.net, 15 August 2019)
//! and the notebook `Lucky-7 orbit.ipynb` of github.com/daniestevez/jupyter_notebooks (data
//! CC BY 4.0 where possible). The notebook ranks the Space-Track element sets of the 2019-038
//! objects against the satellite's own GPS fixes of 2019-07-22 and publishes the table: NORAD
//! 44406 best at 8.67616 km RMS, then 44404 at 51.3546 km and 44414 at 82.1203 km. The article
//! fits the first 330 fixes with GMAT and states the along-track (V) and cross-track (N) residuals
//! are "usually smaller than 5 m" ("metric level precision").
//!
//! Pre-registered bars (`docs/AMATEUR-RF-OD.md`, fixed before the first run on the data):
//! * identification: the same best object (44406), and the top three RMS values within 0.1 km of
//!   the published ones (Skyfield's 2019 TEME → ITRF chain had no polar motion; this one has);
//! * precise OD on the first 330 fixes: transverse and normal residual RMS each ≤ 5 m.
//!
//! Outcome of the first run (21 November 2026): identification MET (44406, 8.687 km); precise OD
//! NOT MET (transverse 5.17 m, normal 5.57 m). Both are pinned below.
//!
//! The two files are fetched by `scripts/fetch_lucky7.sh` (never committed: the GPS telemetry and
//! the Space-Track TLEs keep their original terms); the data tests run when `KSHANA_LUCKY7_DIR`
//! points at them and say so when skipped. The Doppler test below is synthetic and always runs.
//! All numbers are MODELLED.

use kshana::amateur_od::{
    cd_area_over_mass_from_bstar, doppler_model, fit_doppler, fixes_to_observations,
    parse_ecef_tow_csv, rank_tles, seed_velocity, station_gcrs, DopplerObs, Site,
};
use kshana::eop::EopSeries;
use kshana::integrator::Tolerance;
use kshana::precise_od::{fit, EstimatedParams, FitConfig, PreciseForceModel};

const EOP: &str = include_str!("fixtures/agency/eop/finals2000A_2019203.txt");
/// GPS week of the Lucky-7 track (2019-07-21 .. 27), as the notebook uses.
const WEEK: u32 = 2063;

fn data_dir() -> Option<std::path::PathBuf> {
    match std::env::var_os("KSHANA_LUCKY7_DIR") {
        Some(d) => Some(d.into()),
        None => {
            eprintln!(
                "KSHANA_LUCKY7_DIR not set: Lucky-7 data test skipped (scripts/fetch_lucky7.sh)"
            );
            None
        }
    }
}

/// The element sets the notebook ranks: the text between the triple quotes of its `tle_lines` cell.
fn notebook_tles(ipynb: &str) -> String {
    let nb: serde_json::Value = serde_json::from_str(ipynb).expect("notebook json");
    for cell in nb["cells"].as_array().expect("cells") {
        let src: String = cell["source"]
            .as_array()
            .map(|a| a.iter().filter_map(|l| l.as_str()).collect())
            .unwrap_or_default();
        if let Some(i) = src.find("tle_lines = \"\"\"") {
            let rest = &src[i + 15..];
            return rest[..rest.find("\"\"\"").expect("closing quotes")].to_string();
        }
    }
    panic!("no tle_lines cell in the notebook");
}

#[test]
fn lucky7_identification_reproduces_the_published_table() {
    let Some(dir) = data_dir() else { return };
    let csv = std::fs::read_to_string(dir.join("lucky7_posW15.csv")).unwrap();
    let nb = std::fs::read_to_string(dir.join("lucky7_orbit.ipynb")).unwrap();
    let fixes = parse_ecef_tow_csv(&csv).unwrap();
    let eop = EopSeries::from_finals2000a(EOP);
    let ranked = rank_tles(&notebook_tles(&nb), &fixes, WEEK, &eop);
    for m in ranked.iter().take(5) {
        eprintln!(
            "NORAD {} RMS {:.4} km  B* {:.4e}",
            m.norad, m.rms_km, m.bstar
        );
    }
    let published = [(44406, 8.67616), (44404, 51.3546), (44414, 82.1203)];
    for (m, (norad, rms)) in ranked.iter().zip(published) {
        assert_eq!(m.norad, norad, "ranking differs from the published table");
        assert!(
            (m.rms_km - rms).abs() <= 0.1,
            "NORAD {norad}: {:.4} km vs published {rms} km",
            m.rms_km
        );
    }
}

#[test]
fn lucky7_precise_od_from_gps_fixes_records_the_bar_outcome() {
    let Some(dir) = data_dir() else { return };
    let csv = std::fs::read_to_string(dir.join("lucky7_posW15.csv")).unwrap();
    let nb = std::fs::read_to_string(dir.join("lucky7_orbit.ipynb")).unwrap();
    let fixes = parse_ecef_tow_csv(&csv).unwrap();
    let eop = EopSeries::from_finals2000a(EOP);
    // The object's own element set gives the drag term (characterisation feeding the OD).
    let best = rank_tles(&notebook_tles(&nb), &fixes, WEEK, &eop)[0].clone();
    let cd_aom = cd_area_over_mass_from_bstar(best.bstar);
    // The article uses the first 330 fixes: a timestamp step follows (fraction .64 -> .65 s).
    let (epoch, obs) = fixes_to_observations(&fixes[..330], WEEK, &eop, 10.0).unwrap();
    let v0 = seed_velocity(&obs).unwrap();
    let tmpl = PreciseForceModel::egm2008(40, epoch)
        .third_body(true, true)
        .solar_radiation(1.0, cd_aom / 2.2)
        .drag(cd_aom.max(0.0))
        .with_eop(eop.clone());
    let cfg = FitConfig {
        estimate_empirical: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 30,
        tol: Tolerance {
            rtol: 1e-10,
            atol: 1e-6,
            ..Default::default()
        },
        ..Default::default()
    };
    let init = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(1.0),
        empirical: None,
    };
    let rep = fit(&tmpl, init, &obs, &cfg).expect("fit");
    eprintln!(
        "Lucky-7 GPS-fix OD: C_D·A/m from B* {:.5} m²/kg | 3D {:.2} m | RTN [{:.2}, {:.2}, {:.2}] m | \
         n {} edited {} | iters {} converged {}",
        cd_aom,
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.n_obs,
        rep.n_edited,
        rep.iterations,
        rep.converged
    );
    assert!(rep.converged);
    // The bar (transverse and normal RMS each <= 5 m) was NOT MET on the first run, 21 November
    // 2026: transverse 5.17 m, normal 5.57 m (docs/AMATEUR-RF-OD.md). The miss is pinned, not the
    // bar moved: a change to the model must update both numbers here and the record there.
    let met = rep.rms_rtn[1] <= 5.0 && rep.rms_rtn[2] <= 5.0;
    eprintln!(
        "bar (T and N RMS <= 5 m): {}",
        if met { "MET" } else { "NOT MET" }
    );
    assert!(
        (rep.rms_rtn[1] - 5.17).abs() <= 0.02,
        "transverse RMS {:.3} m",
        rep.rms_rtn[1]
    );
    assert!(
        (rep.rms_rtn[2] - 5.57).abs() <= 0.02,
        "normal RMS {:.3} m",
        rep.rms_rtn[2]
    );
    assert!(!met);
}

/// Synthetic one-way Doppler self-recovery on a Lucky-7-like orbit: the state the notebook
/// prints for 2019-07-22 14:05:49.64 UTC (km, km/s; used here as a GCRS seed), two receiving
/// sites, six hours, 10 s sampling above 10° elevation. The truth is recovered from a 2 km /
/// 2 m/s / 2 kHz perturbed start, which checks the model, the STM Jacobian and the estimator
/// together; it says nothing about real amateur Doppler noise.
#[test]
fn doppler_od_recovers_a_synthetic_truth() {
    let eop = EopSeries::from_finals2000a(EOP);
    let epoch = kshana::amateur_od::gps_week_tow_to_jd_tt(WEEK, 137_149.64);
    let fm = PreciseForceModel::egm2008(4, epoch).with_eop(eop.clone());
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-7,
        ..Default::default()
    };
    let truth = [
        2_936_517.5,
        -130_583.2,
        6_253_580.5,
        -6_653.803,
        -2_247.915,
        3_052.102,
        435_525_000.0,
        435_526_500.0,
    ];
    let sites = [
        Site {
            id: 1,
            lat_deg: 50.08,
            lon_deg: 14.42,
            alt_m: 250.0,
        },
        Site {
            id: 2,
            lat_deg: 40.42,
            lon_deg: -3.70,
            alt_m: 650.0,
        },
    ];
    let mut obs = Vec::new();
    let positions = kshana::precise_od::propagate_samples(
        &fm,
        [truth[0], truth[1], truth[2]],
        [truth[3], truth[4], truth[5]],
        &(0..2160).map(|k| f64::from(k) * 10.0).collect::<Vec<_>>(),
        &tol,
    );
    for (k, r) in positions.iter().enumerate() {
        let t = k as f64 * 10.0;
        for (si, s) in sites.iter().enumerate() {
            let (sp, sv) = station_gcrs(s.itrs(), epoch + t / 86_400.0, &eop);
            let d = [r[0] - sp[0], r[1] - sp[1], r[2] - sp[2]];
            let dn = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            let sn = (sp[0] * sp[0] + sp[1] * sp[1] + sp[2] * sp[2]).sqrt();
            let sin_el = (d[0] * sp[0] + d[1] * sp[1] + d[2] * sp[2]) / (dn * sn);
            if sin_el > 10f64.to_radians().sin() {
                obs.push(DopplerObs {
                    t,
                    freq_hz: 0.0,
                    site_index: si,
                    st_pos: sp,
                    st_vel: sv,
                });
            }
        }
    }
    assert!(obs.len() > 100, "too few visible samples: {}", obs.len());
    let (h, _) = doppler_model(&fm, &obs, &truth, &tol).unwrap();
    for (o, f) in obs.iter_mut().zip(h) {
        o.freq_hz = f;
    }
    let mut x0 = truth;
    x0[0] += 2_000.0;
    x0[4] -= 2.0;
    x0[6] += 2_000.0;
    x0[7] -= 2_000.0;
    let fitres = fit_doppler(&fm, &obs, &x0, 1.0, 20, &tol).expect("doppler fit");
    let dr: f64 = (0..3)
        .map(|k| (fitres.r0[k] - truth[k]).powi(2))
        .sum::<f64>()
        .sqrt();
    eprintln!(
        "synthetic Doppler OD: {} samples, |dr0| {:.4} m, carriers {:?}, rms {:.2e} Hz, iters {}",
        obs.len(),
        dr,
        fitres.carrier_hz,
        fitres.rms_hz,
        fitres.iterations
    );
    assert!(fitres.converged);
    assert!(dr < 1.0, "position error {dr} m");
    assert!((fitres.carrier_hz[0] - truth[6]).abs() < 0.01);
    assert!((fitres.carrier_hz[1] - truth[7]).abs() < 0.01);
}
