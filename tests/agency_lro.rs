// SPDX-License-Identifier: AGPL-3.0-only
//! NASA LRO lunar-orbit validation (P4 Wave 4b) — Moon-centred precise orbit determination.
//!
//! The third precise agency dataset is a real NASA/JPL reconstructed trajectory of
//! the **Lunar Reconnaissance Orbiter** (NAIF id −85, `LRO_merged`), taken from the JPL
//! Horizons ephemeris service as geometric Moon-centered state vectors in the ICRF
//! (= J2000 to ~0.02″), 2022-01-01, ~98 km altitude. Horizons text vectors avoid any SPK
//! reader / SPICE dependency: the same definitive reconstructed orbit, in a frame Kshana's
//! force model can use directly.
//!
//! [`lro_lunar_orbit_fit_against_horizons_truth`] fits Kshana's Moon-centred force model
//! ([`kshana::lunar_od::LunarForceModel`]: the GRAIL GRGM660PRIM gravity field evaluated in the
//! lunar body-fixed principal-axis frame via [`kshana::lunar_frame`] + Earth/Sun third body) to
//! the arc through the same precise Gauss–Newton estimator the Earth datasets use, and
//! reports the honest post-fit RMS, dynamic and reduced-dynamic.
//!
//! Honesty note: unlike Galileo (0.13 m) and Swarm-A (0.10 m), the LRO fit lands at **~6.67 m**
//! reduced-dynamic (1+2-per-rev empirical) / ~12.05 m dynamic — *above* the < 5 m bar, and not for
//! want of estimator quality (identical at d/o 100/150 and `atol` 1e-6/1e-9). A DE-grade
//! cross-validation (`xval/anise-lunar-od`: DE440 lunar PA orientation + DE440 ephemeris via ANISE)
//! gave 12.0 m dynamic and 6.67 m reduced-dynamic. Since the 0.36 fix of the DE421 ME→PA offset
//! (it was applied in the wrong direction, about 208″ off; before the fix this test measured
//! 12.6 m and 6.65 m) the analytic stack gives 12.05 m and 6.67 m: it matches DE-grade on both
//! tiers. The operational ~6.67 m floor is therefore an empirical-tier-irreducible residual,
//! most consistent with LRO's unmodelled non-gravitational dynamics over the short arc, and the
//! lean analytic stack here already matches DE-grade for the reduced-dynamic orbit. Published as-is.
//! DS-LRO-10 then tested that reading with an opt-in macro-model (Sun-tracking array, Moon
//! shadow, lunar albedo and IR; `lro_macro_model_pre_registered_run`): it left the floor at
//! 6.668 m and missed every pre-registered bar, so solar/lunar radiation pressure of LRO's size
//! does not explain it (`docs/design/evidence/ds-lro-10-macro-model/RESULTS.md`).
//!
//! Fixtures (provenance + SHA-256 in `tests/fixtures/agency/NOTICE.md`):
//!   lro/LRO_2022001_Moon_ICRF_4h.csv    574e3518…d100f0
//!   lro/GRGM660PRIM_to150.gfc           0ff04184…f029977ae

use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::{integrate_dopri, Tolerance};
use kshana::lunar::{MOON_GM_M3_S2, R_MOON_M};
use kshana::lunar_od::{LunarForceModel, LunarMacroModel};
use kshana::precise_od::{fit, EstimatedParams, FitConfig, Observation};

const LRO: &str = include_str!("fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv");
/// GRAIL primary-mission lunar gravity field GRGM660PRIM, truncated to d/o 150 (provenance +
/// SHA-256 in `tests/fixtures/agency/NOTICE.md`). The principal-axis (PA / DE421) field.
const GRGM: &str = include_str!("fixtures/agency/lro/GRGM660PRIM_to150.gfc");

/// One Horizons state: TDB Julian Date and Moon-centered ICRF position (m) and velocity
/// (m/s). The fixture stores km / km/s; this converts to SI.
struct State {
    jd_tdb: f64,
    pos: [f64; 3],
    vel: [f64; 3],
}

/// Parse the vendored Horizons CSV (`JDTDB,X,Y,Z,VX,VY,VZ` in km / km·s⁻¹, `#` comments).
fn parse_lro_csv(text: &str) -> Vec<State> {
    let mut out = Vec::new();
    for line in text.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let f: Vec<f64> = line
            .split(',')
            .map(|t| t.trim().parse::<f64>().unwrap())
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

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

#[test]
fn lro_truth_geometry_is_sane() {
    let s = parse_lro_csv(LRO);
    assert_eq!(s.len(), 241, "expected 241 one-minute epochs over 4 h");

    // Time strictly increases by ~60 s (1-minute step, in days).
    for w in s.windows(2) {
        let dt_s = (w[1].jd_tdb - w[0].jd_tdb) * 86_400.0;
        assert!((dt_s - 60.0).abs() < 1e-3, "step {dt_s} s not ~60 s");
    }

    // Altitude band (~98 km mapping/extended orbit) and orbital speed (~1.6 km/s).
    for st in &s {
        let alt_km = (norm(st.pos) - R_MOON_M) / 1000.0;
        assert!(
            (70.0..130.0).contains(&alt_km),
            "altitude {alt_km} km off LRO orbit"
        );
        let spd = norm(st.vel);
        assert!(
            (1400.0..1800.0).contains(&spd),
            "speed {spd} m/s off LRO orbit"
        );
    }

    // The arc sweeps multiple revolutions: accumulate the angle between successive radius
    // vectors. LRO's period at ~98 km is ~118 min, so 4 h is ~2 revs (> 4π/… ≥ 1 full rev).
    let mut swept = 0.0;
    for w in s.windows(2) {
        let (a, b) = (w[0].pos, w[1].pos);
        let dot = (0..3).map(|k| a[k] * b[k]).sum::<f64>() / (norm(a) * norm(b));
        swept += dot.clamp(-1.0, 1.0).acos();
    }
    assert!(
        swept > 2.0 * std::f64::consts::PI,
        "arc swept only {swept} rad (< 1 rev)"
    );
}

/// Moon-centred ICRF position observations from the first `n_max` truth epochs, with the epoch
/// (TDB Julian Date) and the truth velocity at epoch (the Horizons-supplied seed).
fn lro_observations(text: &str, n_max: usize) -> (f64, Vec<Observation>, [f64; 3]) {
    let s = parse_lro_csv(text);
    let e0 = s[0].jd_tdb;
    let v0 = s[0].vel;
    let obs = s
        .iter()
        .take(n_max)
        .map(|st| Observation {
            t: (st.jd_tdb - e0) * 86_400.0,
            pos: st.pos,
            sigma: 1.0,
        })
        .collect();
    (e0, obs, v0)
}

/// Geopotential degree/order for the CI lunar fit. The field plateaus for orbit purposes by
/// d/o ~100 (d/o 150 gives an identical dynamic residual to the millimetre); the full d/o 150 is
/// the `workflow_dispatch` job.
const FIT_DEGREE: usize = 100;

/// Raw (no-fit) overlap: propagate the seed truth state once under the full model and report the
/// 3-D RMS against the observations — the "before" the fit improves on.
fn raw_overlap_rms(
    tmpl: &LunarForceModel,
    initial: &EstimatedParams,
    obs: &[Observation],
    tol: &Tolerance,
) -> f64 {
    let times: Vec<f64> = obs.iter().map(|o| o.t).collect();
    let pred = kshana::precise_od::propagate_samples(tmpl, initial.r0, initial.v0, &times, tol);
    let sumsq: f64 = obs
        .iter()
        .zip(&pred)
        .map(|(o, r)| (0..3).map(|k| (r[k] - o.pos[k]).powi(2)).sum::<f64>())
        .sum();
    (sumsq / obs.len() as f64).sqrt()
}

#[test]
fn lro_lunar_orbit_fit_against_horizons_truth() {
    // The third agency dataset, Moon-centred. Fit Kshana's lunar force model (GRGM660PRIM gravity
    // in the body-fixed PA frame + Earth/Sun third body) to the real NASA/JPL Horizons LRO
    // reconstructed orbit, seeded from the Horizons epoch state, and report the honest post-fit
    // RMS in 3-D and RTN, dynamic and reduced-dynamic (with the empirical tier), against the raw
    // overlap.
    let (epoch, obs, v0) = lro_observations(LRO, usize::MAX);
    assert_eq!(obs.len(), 241, "full 4 h LRO arc");
    let field = SphericalHarmonicField::from_gfc(GRGM, FIT_DEGREE).expect("GRGM field loads");
    let tmpl = LunarForceModel::new(field, epoch);
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

    // --- Dynamic: estimate the epoch state only, against the full lunar force model ---
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial, &obs, &cfg).expect("dynamic fit returns a report");
    eprintln!(
        "LRO (−85) 2022-001, GRGM660PRIM d/o {FIT_DEGREE} + Earth/Sun 3rd body, vs JPL Horizons \
         truth (4 h): raw overlap {raw:.1} m\n  Dynamic (state only): 3D RMS = {:.3} m | \
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
    assert!(rep.converged, "dynamic fit did not converge");
    assert!(rep.rms_3d < raw, "fit did not improve on the raw overlap");
    // Honest bound (measured ≈ 12.05 m since the 0.36 ME→PA fix, 12.6 m before; DE-grade inputs
    // give 12.0 m), above the < 5 m bar.
    assert!(
        rep.rms_3d < 25.0,
        "LRO dynamic 3D RMS {:.3} m off the expected ~12.05 m",
        rep.rms_3d
    );

    // --- Reduced-dynamic: + empirical CPR accelerations absorb the un-modelled lunar dynamics ---
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
    let rep2 = fit(&tmpl, initial2, &obs, &cfg2).expect("reduced-dynamic fit returns a report");
    eprintln!(
        "  Reduced-dynamic (+ empirical 1+2-per-rev CPR): 3D RMS = {:.3} m | RTN = [{:.3}, {:.3}, {:.3}] m | \
         iters {} converged {}",
        rep2.rms_3d,
        rep2.rms_rtn[0],
        rep2.rms_rtn[1],
        rep2.rms_rtn[2],
        rep2.iterations,
        rep2.converged,
    );
    assert!(rep2.converged, "reduced-dynamic fit did not converge");
    assert!(
        rep2.rms_3d <= rep.rms_3d + 1e-6,
        "empirical tier should not worsen the fit ({:.3} vs {:.3} m)",
        rep2.rms_3d,
        rep.rms_3d
    );
    // Honest bound (measured ≈ 6.67 m with the 1+2-per-rev empirical tier): the empirical terms
    // absorb the along-track mismodelling to a roughly isotropic floor, ABOVE the < 5 m bar Galileo
    // and Swarm-A meet. The DE-grade cross-validation (`xval/anise-lunar-od`) proved this floor is
    // NOT the analytic orientation/ephemeris (DE440 kernels leave it at 6.67 m) but an
    // empirical-tier-irreducible residual — most consistent with LRO's unmodelled non-gravitational
    // dynamics over the short arc. No field degree, frame upgrade, or empirical tier crosses it.
    assert!(
        rep2.rms_3d < 12.0,
        "LRO reduced-dynamic 3D RMS {:.3} m off the expected ~6.67 m",
        rep2.rms_3d
    );
}

/// Full-degree (d/o 150) lunar fit over the vendored arc (ignored by default to keep CI light;
/// the field is gravity-converged for orbit purposes by d/o ~100, so this is a confirmation run,
/// not a different result). Override the degree with `KSHANA_LRO_DEGREE`.
#[test]
#[ignore = "full-degree confirmation run (d/o 150); the CI test runs d/o 100"]
fn lro_full_degree_dispatch() {
    let degree: usize = std::env::var("KSHANA_LRO_DEGREE")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(150);
    let (epoch, obs, v0) = lro_observations(LRO, usize::MAX);
    let field = SphericalHarmonicField::from_gfc(GRGM, degree).expect("GRGM field loads");
    let tmpl = LunarForceModel::new(field, epoch);
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-8,
        ..Default::default()
    };
    let initial = EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let rep = fit(&tmpl, initial, &obs, &cfg).expect("reduced-dynamic fit");
    eprintln!(
        "LRO full-degree d/o {degree} ({} obs): reduced-dynamic 3D RMS = {:.3} m | \
         RTN = [{:.3}, {:.3}, {:.3}] m | iters {} converged {}",
        rep.n_obs,
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.iterations,
        rep.converged,
    );
    assert!(rep.converged, "full-degree fit did not converge");
    assert!(
        rep.rms_3d < 12.0,
        "full-degree reduced-dynamic {:.3} m",
        rep.rms_3d
    );
}

#[test]
fn grgm_lunar_field_loads_and_is_physically_lunar() {
    // The GRAIL GRGM660PRIM field (truncated to d/o 150) loads through the ICGEM `.gfc` reader
    // — exercising the `gravity_constant` keyword celestial-body models use — and reproduces
    // the Moon's gravitational parameter, reference radius, surface gravity, and the small
    // non-spherical perturbation the lunar orbit fit will model.
    let f = SphericalHarmonicField::from_gfc(GRGM, 150).expect("parse GRGM .gfc");
    assert_eq!(f.nmax, 150, "GRGM660PRIM truncated to d/o 150");
    assert!(
        (f.gm - 4.902_799_806_931_69e12).abs() / f.gm < 1e-12,
        "Moon GM {} (want GRGM660PRIM 4.90279980693e12)",
        f.gm
    );
    assert!(
        (f.re - 1_738_000.0).abs() < 1e-3,
        "reference radius {} (want 1738 km)",
        f.re
    );

    // Lunar surface gravity at the pole ≈ 1.62 m/s² (the textbook value), point-mass dominated
    // with the oblateness (C̄20 < 0) raising the poles slightly.
    let g_pole = norm(f.acceleration([0.0, 0.0, R_MOON_M]));
    assert!(
        (g_pole - 1.625).abs() < 0.03,
        "polar surface gravity {g_pole} m/s² (want ≈ 1.62)"
    );

    // Just above the reference sphere, off all axes (so tesserals contribute), the field is a
    // real but small perturbation on the central term — the J2/C22-dominated signal a Moon
    // point-mass model misses. Compare the full field to its own two-body part.
    let r = [1.50e6, 0.70e6, 0.55e6]; // |r| ≈ 1.744e6 m, just above the 1738 km sphere
    let a = f.acceleration(r);
    let rn = norm(r);
    let tb = [
        -f.gm * r[0] / rn.powi(3),
        -f.gm * r[1] / rn.powi(3),
        -f.gm * r[2] / rn.powi(3),
    ];
    let pert = norm([a[0] - tb[0], a[1] - tb[1], a[2] - tb[2]]);
    let rel = pert / norm(tb);
    assert!(
        rel > 1e-4 && rel < 1e-2,
        "GRGM non-spherical fraction {rel} (lunar J2/C22 band)"
    );
}

#[test]
fn lro_two_body_overlap_shows_perturbation_signal() {
    let s = parse_lro_csv(LRO);
    let t0 = s[0].jd_tdb;

    // Moon point-mass two-body field: a = −μ·r/|r|³.
    let f = |_t: f64, y: &[f64]| -> Vec<f64> {
        let r = [y[0], y[1], y[2]];
        let rn = norm(r);
        let k = -MOON_GM_M3_S2 / (rn * rn * rn);
        vec![y[3], y[4], y[5], k * r[0], k * r[1], k * r[2]]
    };
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-6,
        ..Default::default()
    };

    // March the seed state through every epoch, comparing two-body to truth.
    let mut y = vec![
        s[0].pos[0],
        s[0].pos[1],
        s[0].pos[2],
        s[0].vel[0],
        s[0].vel[1],
        s[0].vel[2],
    ];
    let mut t_prev = 0.0;
    let mut sumsq = 0.0;
    let mut max_d = 0.0_f64;
    for st in s.iter().skip(1) {
        let t = (st.jd_tdb - t0) * 86_400.0;
        let sol = integrate_dopri(&f, t_prev, &y, t, (t - t_prev).min(10.0), &tol);
        y = sol.y;
        t_prev = t;
        let d =
            ((y[0] - st.pos[0]).powi(2) + (y[1] - st.pos[1]).powi(2) + (y[2] - st.pos[2]).powi(2))
                .sqrt();
        sumsq += d * d;
        max_d = max_d.max(d);
    }
    let rms = (sumsq / (s.len() - 1) as f64).sqrt();
    eprintln!(
        "LRO (−85) 2022-001, Moon point-mass two-body vs JPL Horizons truth over 4 h: \
         3D RMS {:.1} m, max {:.1} m — the lunar non-spherical field + Earth/Sun third body \
         left unmodelled (the W4b force-model target).",
        rms, max_d
    );
    // Real signal: the perturbations push two-body well off truth (sanity floor), but the
    // integration stays finite and bounded (no blow-up) — the data and pipeline are sound.
    assert!(
        rms > 100.0,
        "two-body RMS {rms} m unexpectedly small — fixture/units suspect"
    );
    assert!(
        rms < 1.0e6,
        "two-body RMS {rms} m unbounded — integration/parse broken"
    );
    assert!(max_d.is_finite());
}

/// The opt-in in-crate DE-grade environment (`lunar_od::De440LunarEnvironment`: the embedded
/// DE440 lunar PA orientation and the geocentric Sun and Moon read from a committed de440s cut by
/// the crate's own SPK reader) on the same arc and configuration. Information only: the numbers
/// are printed, and the comparison against the ANISE environment is
/// `xval/anise-lunar-od/src/bin/in_crate_parity.rs`
/// (`docs/design/evidence/fut05-de440-lunar-env/`). The bars are the analytic test's.
/// Ignored in the gating CI for its run time; it runs in the manual `lro-de440-opt-in` job of
/// `.github/workflows/agency-od-validation.yml`.
#[test]
#[ignore = "information only, about 200 s: the opt-in DE440 environment on the LRO arc (11.959 m / 6.665 m on 2026-10-13)"]
fn lro_fit_with_the_opt_in_de440_environment() {
    use kshana::ephem_provider::KernelEphemeris;
    use kshana::lunar_od::De440LunarEnvironment;
    let (epoch, obs, v0) = lro_observations(LRO, usize::MAX);
    let kernel = KernelEphemeris::open(std::path::Path::new(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/lunar_od_de440/de440s_2021-12-31_2022-01-02.bsp"
    )))
    .expect("the committed de440s cut opens");
    let env = De440LunarEnvironment::new(kernel);
    let end = epoch + obs.last().expect("observations").t / 86_400.0;
    env.check_covers(epoch, end)
        .expect("the cut and the orientation cover the arc");
    let field = SphericalHarmonicField::from_gfc(GRGM, FIT_DEGREE).expect("GRGM field loads");
    let tmpl = LunarForceModel::with_env(field, epoch, env);
    let tol = Tolerance {
        rtol: 1e-10,
        atol: 1e-6,
        ..Default::default()
    };
    let initial = || EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial(), &obs, &cfg).expect("dynamic fit");
    let cfg2 = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let rep2 = fit(&tmpl, initial(), &obs, &cfg2).expect("reduced-dynamic fit");
    eprintln!(
        "LRO with De440LunarEnvironment (in-crate DE440 PA + de440s cut): dynamic {:.3} m, \
         reduced-dynamic {:.3} m",
        rep.rms_3d, rep2.rms_3d
    );
    assert!(rep.converged && rep2.converged);
    assert!(rep.rms_3d < 25.0 && rep2.rms_3d < 12.0);
}

/// Information only (DS-LRO-11): the same dynamic and reduced-dynamic fits with the optional
/// lunar solid tide (k2 = 0.02405, Konopliv et al. 2013) and the selenocentric Schwarzschild term
/// switched on. No bar beyond the analytic test's; prints the change. Ignored for run time
/// (about 400 s); `KSHANA_LRO_DEGREE` overrides the degree.
#[test]
#[ignore = "information only, about 400 s: the LRO fit with the lunar k2 tide and relativity"]
fn lro_fit_with_lunar_tide_and_relativity() {
    let degree: usize = std::env::var("KSHANA_LRO_DEGREE")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(FIT_DEGREE);
    let (epoch, obs, v0) = lro_observations(LRO, usize::MAX);
    let field = SphericalHarmonicField::from_gfc(GRGM, degree).expect("GRGM field loads");
    let tmpl = LunarForceModel::new(field, epoch)
        .lunar_tide(0.02405)
        .relativity();
    let tol = Tolerance {
        rtol: 1e-10,
        atol: 1e-6,
        ..Default::default()
    };
    let initial = || EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial(), &obs, &cfg).expect("dynamic fit");
    let cfg2 = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let rep2 = fit(&tmpl, initial(), &obs, &cfg2).expect("reduced-dynamic fit");
    eprintln!(
        "LRO d/o {degree} + lunar k2 tide + relativity: dynamic {:.3} m, reduced-dynamic {:.3} m",
        rep.rms_3d, rep2.rms_3d
    );
    assert!(rep.converged && rep2.converged);
    assert!(rep.rms_3d < 25.0 && rep2.rms_3d < 12.0);
}

/// Information only (DS-LRO-09): the same dynamic and reduced-dynamic fits over a 24 h arc
/// (`fixtures/agency/lro/LRO_2022001_Moon_ICRF_24h_horizons.txt`, the raw JPL Horizons response,
/// 1 441 epochs; `KSHANA_LRO_ARC` may point at another Horizons vector response in the same
/// format). Protocol: `docs/design/evidence/ds-lro-09-11-longer-arc/PROTOCOL.md`. Ignored for
/// run time; it runs in the manual `lro-de440-opt-in` CI job.
#[test]
#[ignore = "information only, long: the LRO fit over a 24 h arc"]
fn lro_fit_over_a_longer_arc() {
    let path = std::env::var("KSHANA_LRO_ARC").unwrap_or_else(|_| {
        concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_24h_horizons.txt"
        )
        .to_string()
    });
    let raw = std::fs::read_to_string(&path).expect("the Horizons response reads");
    let a = raw.find("$$SOE").expect("SOE") + 5;
    let b = raw.find("$$EOE").expect("EOE");
    // JDTDB, calendar date, X, Y, Z, VX, VY, VZ -> the 4 h fixture's JDTDB,X,Y,Z,VX,VY,VZ
    let csv: String = raw[a..b]
        .lines()
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').map(str::trim).collect();
            format!(
                "{},{},{},{},{},{},{}\n",
                f[0], f[2], f[3], f[4], f[5], f[6], f[7]
            )
        })
        .collect();
    let (epoch, obs, v0) = lro_observations(&csv, usize::MAX);
    let field = SphericalHarmonicField::from_gfc(GRGM, FIT_DEGREE).expect("GRGM field loads");
    let tmpl = LunarForceModel::new(field, epoch);
    let tol = Tolerance {
        rtol: 1e-10,
        atol: 1e-6,
        ..Default::default()
    };
    let initial = || EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_cr: false,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let rep = fit(&tmpl, initial(), &obs, &cfg).expect("dynamic fit");
    let cfg2 = FitConfig {
        estimate_cr: false,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let rep2 = fit(&tmpl, initial(), &obs, &cfg2).expect("reduced-dynamic fit");
    eprintln!(
        "LRO {} epochs: dynamic {:.3} m (RTN {:.3} {:.3} {:.3}, converged {}), reduced-dynamic \
         {:.3} m (RTN {:.3} {:.3} {:.3}, converged {})",
        obs.len(),
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.converged,
        rep2.rms_3d,
        rep2.rms_rtn[0],
        rep2.rms_rtn[1],
        rep2.rms_rtn[2],
        rep2.converged
    );
}

/// One DS-LRO-10 run: the dynamic and reduced-dynamic fits of the 4 h arc with `tmpl`, `C_R`
/// estimated in both tiers. Returns `(dynamic RMS, reduced-dynamic RMS, C_R dyn, C_R red,
/// both converged)`.
fn macro_model_run(tmpl: &LunarForceModel) -> (f64, f64, f64, f64, bool) {
    let (_, obs, v0) = lro_observations(LRO, usize::MAX);
    let tol = Tolerance {
        rtol: 1e-10,
        atol: 1e-6,
        ..Default::default()
    };
    let initial = || EstimatedParams {
        r0: obs[0].pos,
        v0,
        cr: Some(1.0),
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_cr: true,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
        ..Default::default()
    };
    let rep = fit(tmpl, initial(), &obs, &cfg).expect("dynamic fit");
    let cfg2 = FitConfig {
        estimate_cr: true,
        estimate_empirical: true,
        estimate_empirical_2cpr: true,
        empirical_sigma: 1e-7,
        outlier_sigma: 5.0,
        max_iter: 25,
        tol,
    };
    let rep2 = fit(tmpl, initial(), &obs, &cfg2).expect("reduced-dynamic fit");
    let (c1, c2) = (rep.params.cr.unwrap(), rep2.params.cr.unwrap());
    eprintln!(
        "  dynamic {:.3} m (RTN {:.3} {:.3} {:.3}, C_R {c1:.4}, iters {}), reduced-dynamic {:.3} m \
         (RTN {:.3} {:.3} {:.3}, C_R {c2:.4}, iters {})",
        rep.rms_3d,
        rep.rms_rtn[0],
        rep.rms_rtn[1],
        rep.rms_rtn[2],
        rep.iterations,
        rep2.rms_3d,
        rep2.rms_rtn[0],
        rep2.rms_rtn[1],
        rep2.rms_rtn[2],
        rep2.iterations,
    );
    (
        rep.rms_3d,
        rep2.rms_3d,
        c1,
        c2,
        rep.converged && rep2.converged,
    )
}

fn lro_template() -> LunarForceModel {
    let (epoch, _, _) = lro_observations(LRO, 1);
    let field = SphericalHarmonicField::from_gfc(GRGM, FIT_DEGREE).expect("GRGM field loads");
    LunarForceModel::new(field, epoch)
}

/// DS-LRO-10 information runs 2 and 3 (pre-registration
/// `docs/design/evidence/ds-lro-10-macro-model/PREREGISTRATION.md`): the array-only macro-model
/// without albedo/IR, and the cannonball with the same A/m and the Moon's shadow.
#[test]
#[ignore = "information only, about 10 min: DS-LRO-10 runs 2 and 3"]
fn lro_macro_model_information_runs() {
    eprintln!("DS-LRO-10 run 2 (array direct radiation + Moon shadow):");
    macro_model_run(&lro_template().macro_model(LunarMacroModel::lro_generic(false), 1.0));
    eprintln!("DS-LRO-10 run 3 (cannonball, A/m = 10.7/1060, Moon shadow):");
    macro_model_run(&lro_template().solar_radiation(1.0, 10.7 / 1060.0));
}

/// DS-LRO-10 primary run (pre-registration
/// `docs/design/evidence/ds-lro-10-macro-model/PREREGISTRATION.md`, bars B1 to B3): the generic
/// LRO macro-model (Sun-tracking array, Moon shadow, lunar albedo and IR) with `C_R` estimated.
///
/// **NOT MET (finding, recorded 2026-10-14 in `RESULTS.md` beside the pre-registration).** This
/// test pins the measured miss: dynamic 11.937 m (B2 ≤ 10.84 m), reduced-dynamic 6.668 m
/// (B1 ≤ 6.00 m), `C_R` 20.93 dynamic and −21.81 reduced-dynamic (B3: within [0.3, 3.0]). The
/// bars are unchanged; the macro-model stays opt-in.
#[test]
fn lro_macro_model_pre_registered_run() {
    eprintln!("DS-LRO-10 run 1 (array + Moon shadow + lunar albedo + IR):");
    let (dyn_rms, red_rms, cr_dyn, cr_red, converged) =
        macro_model_run(&lro_template().macro_model(LunarMacroModel::lro_generic(true), 1.0));
    assert!(converged, "both tiers converged in the recorded run");
    // The recorded numbers (tolerances cover cross-platform floating-point drift only).
    assert!(
        (dyn_rms - 11.937).abs() < 0.01,
        "dynamic {dyn_rms} vs recorded 11.937 m"
    );
    assert!(
        (red_rms - 6.668).abs() < 0.005,
        "reduced-dynamic {red_rms} vs recorded 6.668 m"
    );
    assert!(
        (cr_dyn - 20.93).abs() < 0.2,
        "dynamic C_R {cr_dyn} vs recorded 20.93"
    );
    assert!(
        (cr_red + 21.81).abs() < 0.2,
        "reduced-dynamic C_R {cr_red} vs recorded -21.81"
    );
    // The pre-registered bars, as written, are missed.
    let (b1, b2) = (6.00, 10.84);
    let b3 = |c: f64| (0.3..=3.0).contains(&c);
    assert!(
        red_rms > b1,
        "B1 now met ({red_rms} m): re-record DS-LRO-10"
    );
    assert!(
        dyn_rms > b2,
        "B2 now met ({dyn_rms} m): re-record DS-LRO-10"
    );
    assert!(
        !b3(cr_dyn) && !b3(cr_red),
        "B3 now met ({cr_dyn}, {cr_red}): re-record DS-LRO-10"
    );
}
