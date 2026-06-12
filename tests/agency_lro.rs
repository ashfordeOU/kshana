// SPDX-License-Identifier: Apache-2.0
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
//! Honesty note: unlike Galileo (0.13 m) and Swarm-A (0.10 m), the LRO fit lands at **~6.6 m**
//! reduced-dynamic (1+2-per-rev empirical) / ~12.6 m dynamic — *above* the < 5 m bar, and not for
//! want of estimator quality (identical at d/o 100/150 and `atol` 1e-6/1e-9). A DE-grade
//! cross-validation (`xval/anise-lunar-od`: DE440 lunar PA orientation + DE440 ephemeris via ANISE)
//! found the analytic orientation/ephemeris limits the *dynamic* fit (12.6 → 12.0 m with DE-grade)
//! but **not** the *reduced-dynamic* one (6.65 → 6.67 m, unchanged) — the empirical tier already
//! absorbs it. The operational ~6.6 m floor is therefore an empirical-tier-irreducible residual,
//! most consistent with LRO's unmodelled non-gravitational dynamics over the short arc, and the
//! lean analytic stack here already matches DE-grade for the reduced-dynamic orbit. Published as-is.
//!
//! Fixtures (provenance + SHA-256 in `tests/fixtures/agency/NOTICE.md`):
//!   lro/LRO_2022001_Moon_ICRF_4h.csv    574e3518…d100f0
//!   lro/GRGM660PRIM_to150.gfc           0ff04184…f029977ae

use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::{integrate_dopri, Tolerance};
use kshana::lunar::{MOON_GM_M3_S2, R_MOON_M};
use kshana::lunar_od::LunarForceModel;
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
    // Honest bound (measured ≈ 12.6 m): the dynamic residual is dominated by the analytic lunar
    // orientation + low-precision (Montenbruck–Gill) ephemeris fidelity, above the < 5 m bar.
    assert!(
        rep.rms_3d < 25.0,
        "LRO dynamic 3D RMS {:.3} m off the expected ~12.6 m",
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
    // Honest bound (measured ≈ 6.6 m with the 1+2-per-rev empirical tier): the empirical terms
    // absorb the along-track mismodelling to a roughly isotropic floor, ABOVE the < 5 m bar Galileo
    // and Swarm-A meet. The DE-grade cross-validation (`xval/anise-lunar-od`) proved this floor is
    // NOT the analytic orientation/ephemeris (DE440 kernels leave it at 6.67 m) but an
    // empirical-tier-irreducible residual — most consistent with LRO's unmodelled non-gravitational
    // dynamics over the short arc. No field degree, frame upgrade, or empirical tier crosses it.
    assert!(
        rep2.rms_3d < 12.0,
        "LRO reduced-dynamic 3D RMS {:.3} m off the expected ~6.6 m",
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
