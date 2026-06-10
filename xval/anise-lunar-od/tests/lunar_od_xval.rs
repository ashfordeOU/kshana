// SPDX-License-Identifier: Apache-2.0
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
