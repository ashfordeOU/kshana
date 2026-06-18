// SPDX-License-Identifier: AGPL-3.0-only
//! The cross-validation gate. Self-skips when the kernels are absent (so it never reddens offline);
//! the heavy full fit lives in the `lunar-od-xval` binary. Here we verify, quickly, that the
//! DE-grade environment is correctly wired: the orientation is a valid rotation, the ephemeris has
//! the right magnitudes, and — the crux — the DE-grade lunar orientation genuinely differs from
//! Kshana's analytic one by the tens-of-arc-seconds the cross-validation exists to remove.

use kshana_anise_lunar_od::kernel::resolve_all;
use kshana_anise_lunar_od::AniseLunarEnvironment;

type Mat3 = [[f64; 3]; 3];

fn mul(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut o = [[0.0; 3]; 3];
    for (i, row) in o.iter_mut().enumerate() {
        for (j, e) in row.iter_mut().enumerate() {
            *e = (0..3).map(|k| a[i][k] * b[k][j]).sum();
        }
    }
    o
}

fn transpose(a: &Mat3) -> Mat3 {
    let mut o = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            o[i][j] = a[j][i];
        }
    }
    o
}

fn is_orthonormal(m: &Mat3) -> bool {
    let p = mul(m, &transpose(m));
    for (i, row) in p.iter().enumerate() {
        for (j, &pij) in row.iter().enumerate() {
            let e = if i == j { 1.0 } else { 0.0 };
            if (pij - e).abs() > 1e-9 {
                return false;
            }
        }
    }
    true
}

/// The relative rotation angle between two rotations, in arc-seconds: θ = acos((tr(AᵀB) − 1)/2).
fn relative_angle_arcsec(a: &Mat3, b: &Mat3) -> f64 {
    let atb = mul(&transpose(a), b);
    let trace = atb[0][0] + atb[1][1] + atb[2][2];
    let cos = ((trace - 1.0) / 2.0).clamp(-1.0, 1.0);
    cos.acos().to_degrees() * 3600.0
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

#[test]
fn de_grade_environment_is_wired_and_differs_from_the_analytic_one() {
    let Some((spk, bpc)) = resolve_all() else {
        eprintln!(
            "SKIP de_grade_environment: no kernels (set KSHANA_ANISE_DE440S / KSHANA_ANISE_MOON_PA \
             or run `cargo run --bin lunar-od-xval` to fetch them)"
        );
        return;
    };
    let env = AniseLunarEnvironment::load(spk.to_str().unwrap(), bpc.to_str().unwrap())
        .expect("load DE-grade environment");

    // 2022-001, inside the LRO arc.
    let jd = 2_459_580.5;

    // 1. The DE-grade orientation is a proper rotation.
    let de = env.try_icrf_to_moon_pa(jd).expect("DE-grade orientation");
    assert!(
        is_orthonormal(&de),
        "DE440 lunar PA rotation must be orthonormal"
    );

    // 2. The crux: it differs from Kshana's analytic IAU-2015 orientation by the tens-of-arc-seconds
    //    the cross-validation exists to remove. A near-zero difference would mean we are not actually
    //    feeding DE-grade orientation (a wiring bug); a huge one would mean a frame mismatch.
    let analytic = kshana::lunar_frame::icrf_to_moon_pa(jd);
    let d_arcsec = relative_angle_arcsec(&de, &analytic);
    assert!(
        (1.0..3600.0).contains(&d_arcsec),
        "DE-grade vs analytic lunar orientation differ by {d_arcsec:.1}″ — expected tens to a few \
         hundred arc-seconds (the analytic-libration error being removed); near-0 ⇒ DE-grade not \
         wired, huge ⇒ frame mismatch"
    );

    // 3. The ephemeris magnitudes are physical: Moon ~3.6e8 m, Sun ~1.5e11 m from Earth.
    let (sun, moon) = env.try_geocentric_sun_moon(jd).expect("DE-grade ephemeris");
    assert!(
        (3.4e8..4.1e8).contains(&norm(moon)),
        "geocentric Moon distance {} m off the ~3.8e8 m band",
        norm(moon)
    );
    assert!(
        (1.45e11..1.55e11).contains(&norm(sun)),
        "geocentric Sun distance {} m off the ~1.5e11 m band",
        norm(sun)
    );
}

/// Verify the ANISE DE440 ephemeris against **real JPL Horizons** geocentric truth — the core
/// `mc0725be3` done-criterion ("ANISE loads de440 and returns Moon/Sun positions matching Horizons
/// to < 1 km"). Truth queried from `ssd.jpl.nasa.gov/api/horizons.api` (CENTER=500@399, ICRF, km)
/// at JD 2459580.5 (TDB), 2022-01-01:
///   Moon (301): -9.186854363641670E+04, -3.150405577979277E+05, -1.453044276844276E+05 km
///   Sun  (10) :  2.612780096546947E+07, -1.328257092873096E+08, -5.757956049170333E+07 km
/// We test the geocentric **range** to < 1 km (a frame-rotation-invariant check of the DE440
/// ephemeris itself) and the full vector also to < 1 km; the tiny residual (Moon ~3 m, Sun ~31 m)
/// is the sub-0.05 mas J2000↔ICRF frame alignment, an orientation — not an ephemeris — effect.
// The truth constants are kept verbatim from Horizons output for provenance, beyond f64 precision.
#[allow(clippy::excessive_precision)]
#[test]
fn anise_de440_ephemeris_matches_horizons_truth() {
    let Some((spk, bpc)) = resolve_all() else {
        eprintln!("SKIP anise_de440_ephemeris: no kernels");
        return;
    };
    let env = AniseLunarEnvironment::load(spk.to_str().unwrap(), bpc.to_str().unwrap())
        .expect("load DE-grade environment");
    let jd = 2_459_580.5;
    let (sun, moon) = env.try_geocentric_sun_moon(jd).expect("DE-grade ephemeris");

    // Horizons truth, km -> m.
    let moon_h = [
        -9.186854363641670e4 * 1e3,
        -3.150405577979277e5 * 1e3,
        -1.453044276844276e5 * 1e3,
    ];
    let sun_h = [
        2.612780096546947e7 * 1e3,
        -1.328257092873096e8 * 1e3,
        -5.757956049170333e7 * 1e3,
    ];

    let vec_diff = |a: [f64; 3], b: [f64; 3]| norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]]);
    let moon_dr = (norm(moon) - norm(moon_h)).abs();
    let sun_dr = (norm(sun) - norm(sun_h)).abs();
    eprintln!(
        "DE440 vs Horizons @ JD {jd}: Moon |Δr|={:.3} m, vector Δ={:.1} m | Sun |Δr|={:.1} m, vector Δ={:.1} m",
        moon_dr,
        vec_diff(moon, moon_h),
        sun_dr,
        vec_diff(sun, sun_h)
    );

    // Range (ephemeris-only) must match Horizons to < 1 km — the mc0725be3 criterion. Measured:
    // Moon ~0.06 m, Sun ~0 m — the DE440 ephemeris is reproduced essentially exactly.
    assert!(
        moon_dr < 1000.0,
        "geocentric Moon range off Horizons by {moon_dr:.3} m (> 1 km)"
    );
    assert!(
        sun_dr < 1000.0,
        "geocentric Sun range off Horizons by {sun_dr:.3} m (> 1 km)"
    );
    // Full vector also < 1 km for both: the tiny residual (Moon ~3 m, Sun ~31 m) is the sub-0.05 mas
    // J2000↔ICRF frame alignment, an orientation effect, not an ephemeris error.
    assert!(
        vec_diff(moon, moon_h) < 1000.0,
        "geocentric Moon vector off Horizons (> 1 km)"
    );
    assert!(
        vec_diff(sun, sun_h) < 1000.0,
        "geocentric Sun vector off Horizons (> 1 km)"
    );
}
