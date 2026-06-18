// SPDX-License-Identifier: AGPL-3.0-only
//! The cross-validation gate. Self-skips when the DE440 kernel is absent (so it never reddens
//! offline); the full per-arc residual sweep lives in the `mars-od-xval` binary. Here we verify,
//! quickly, that the DE-grade Mars environment is correctly wired: the DE440 heliocentric Mars
//! ephemeris has the right magnitudes and matches **real JPL Horizons** truth, and the Sun-central
//! Kshana propagation seeded from DE440 stays close to the DE440 ephemeris over a short arc.

use kshana_anise_mars_od::kernel::resolve_spk;
use kshana_anise_mars_od::AniseMarsEnvironment;

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn vec_diff(a: Vec3, b: Vec3) -> f64 {
    norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]])
}

/// The seed epoch (JD TDB) the Horizons truth below was queried at: 2022-01-01.
const SEED_JD: f64 = 2_459_580.5;

/// **Real JPL Horizons** Mars-barycenter (NAIF 4) heliocentric state, queried from
/// `ssd.jpl.nasa.gov/api/horizons.api` with CENTER='500@10' (Sun), REF_PLANE='FRAME' (ICRF/J2000),
/// OUT_UNITS='KM-S', TIME_TYPE='TDB', at JD 2459580.5 (2022-Jan-01 00:00 TDB):
///   X =-1.296675053678975E+08, Y =-1.738333192979971E+08, Z =-7.623500499854270E+07 km
///   VX= 2.091575407438475E+01, VY=-1.033329164908945E+01, VZ=-5.303991314686368E+00 km/s
// Verbatim from Horizons output for provenance (beyond f64 precision).
#[allow(clippy::excessive_precision)]
const MARS_SUN_R_HORIZONS_KM: Vec3 = [
    -1.296675053678975e8,
    -1.738333192979971e8,
    -7.623500499854270e7,
];
#[allow(clippy::excessive_precision)]
const MARS_SUN_V_HORIZONS_KM_S: Vec3 = [
    2.091575407438475e1,
    -1.033329164908945e1,
    -5.303991314686368e0,
];

#[test]
fn de_grade_mars_environment_is_wired_and_matches_horizons() {
    let Some(spk) = resolve_spk() else {
        eprintln!(
            "SKIP de_grade_mars_environment: no DE440 SPK (set KSHANA_ANISE_DE440S or run \
             `cargo run --bin mars-od-xval` to fetch it)"
        );
        return;
    };
    let env = AniseMarsEnvironment::load(spk.to_str().unwrap()).expect("load DE-grade Mars env");

    // 1. The DE440 heliocentric Mars-barycenter state has physical magnitudes: ~2.3e11 m from the
    //    Sun (Mars semi-major axis 1.524 AU, perihelion ~2.07e11 m), ~24 km/s orbital speed.
    let s = env
        .try_mars_wrt_sun(SEED_JD)
        .expect("DE-grade Mars-wrt-Sun state");
    assert!(
        (1.9e11..2.5e11).contains(&norm(s.r)),
        "heliocentric Mars distance {} m off the ~2.2e11 m band",
        norm(s.r)
    );
    assert!(
        (1.5e4..3.0e4).contains(&norm(s.v)),
        "heliocentric Mars speed {} m/s off the ~24 km/s band",
        norm(s.v)
    );

    // 2. The crux: the DE440 ephemeris matches real JPL Horizons truth to < 1 km in position and
    //    < 1 mm/s in velocity — confirming we are reading the genuine DE440 Mars barycenter, not a
    //    mis-wired frame or body. Horizons km → m.
    let r_h = [
        MARS_SUN_R_HORIZONS_KM[0] * 1e3,
        MARS_SUN_R_HORIZONS_KM[1] * 1e3,
        MARS_SUN_R_HORIZONS_KM[2] * 1e3,
    ];
    let v_h = [
        MARS_SUN_V_HORIZONS_KM_S[0] * 1e3,
        MARS_SUN_V_HORIZONS_KM_S[1] * 1e3,
        MARS_SUN_V_HORIZONS_KM_S[2] * 1e3,
    ];
    let dr = vec_diff(s.r, r_h);
    let dv = vec_diff(s.v, v_h);
    eprintln!("DE440 vs Horizons @ JD {SEED_JD}: Mars |Δr|={dr:.3} m, |Δv|={dv:.6} m/s");
    assert!(
        dr < 1000.0,
        "DE440 heliocentric Mars position off Horizons by {dr:.3} m (> 1 km) — frame/body mismatch?"
    );
    assert!(
        dv < 1e-3,
        "DE440 heliocentric Mars velocity off Horizons by {dv:.6} m/s (> 1 mm/s)"
    );

    // 3. The Earth heliocentric state is physical too (~1 AU), so the same environment can back a
    //    geocentric Mars-range scenario.
    let e = env
        .try_earth_wrt_sun(SEED_JD)
        .expect("DE-grade Earth-wrt-Sun");
    assert!(
        (1.4e11..1.6e11).contains(&norm(e.r)),
        "heliocentric Earth distance {} m off ~1.5e11 m (1 AU)",
        norm(e.r)
    );
}

// The +10d Horizons truth literals below are quoted verbatim, beyond f64 precision, for provenance.
#[allow(clippy::excessive_precision)]
#[test]
fn sun_central_propagation_tracks_de440_over_a_short_arc() {
    let Some(spk) = resolve_spk() else {
        eprintln!("SKIP sun_central_propagation_tracks_de440: no DE440 SPK");
        return;
    };
    let env = AniseMarsEnvironment::load(spk.to_str().unwrap()).expect("load DE-grade Mars env");

    // Seed Kshana's Sun-central two-body propagator from the DE440 Mars state, propagate 10 days, and
    // compare against the DE440 truth at the later epoch. A two-body model omits the planetary
    // perturbations the DE440 barycenter ephemeris carries, so the residual is non-zero — but over
    // 10 days it must stay a *small fraction* of the ~2.3e11 m heliocentric distance (the Sun-central
    // machinery is correct; the residual is the honest unmodelled-n-body error, not an integrator bug).
    use kshana::body::Body;
    use kshana::integrator::Tolerance;
    use kshana::propagator::{propagate, ForceModel};

    let seed = env.try_mars_wrt_sun(SEED_JD).expect("seed Mars state");
    let model = ForceModel::two_body().with_body(Body::sun());
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-3,
        ..Tolerance::default()
    };
    let arc_days = 10.0;
    let (r_prop, _v) = propagate(seed.r, seed.v, arc_days * 86_400.0, &model, &tol);
    let truth = env
        .try_mars_wrt_sun(SEED_JD + arc_days)
        .expect("truth Mars state at +10d");
    let err = vec_diff(r_prop, truth.r);
    let rel = err / norm(seed.r);
    eprintln!("Sun-central 2-body vs DE440 over {arc_days} d: |Δr|={err:.1} m (rel {rel:e})");

    // The 10-day two-body residual is well under 0.1 % of the heliocentric distance (a real but small
    // modelling error), and far above zero (a zero residual would mean the propagation never moved or
    // the truth was re-read at the seed epoch — a wiring bug).
    assert!(
        rel < 1e-3,
        "10-day Sun-central two-body residual rel {rel:e} too large (> 0.1 % of helio r) — propagation suspect"
    );
    assert!(
        err > 1.0,
        "10-day residual {err} m implausibly small — two-body should differ from the n-body DE440 ephemeris"
    );

    // And the propagated state is also close to the **Horizons** truth at +10d (independent of DE440):
    //   JD 2459590.5: X=-1.110883039834882E+08, Y=-1.820346289986062E+08, Z=-8.049805891933380E+07 km
    // (CENTER='500@10', ICRF, TDB) — km → m. Same < 0.1 % bound, a second independent reference.
    let mars_p10_horizons_m = [
        -1.110883039834882e8 * 1e3,
        -1.820346289986062e8 * 1e3,
        -8.049805891933380e7 * 1e3,
    ];
    let err_h = vec_diff(r_prop, mars_p10_horizons_m);
    assert!(
        err_h / norm(seed.r) < 1e-3,
        "10-day Sun-central state off Horizons +10d truth by rel {:e}",
        err_h / norm(seed.r)
    );
}
