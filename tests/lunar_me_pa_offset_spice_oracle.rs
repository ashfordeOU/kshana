// SPDX-License-Identifier: AGPL-3.0-only
//! The DE421 mean-Earth (ME) to principal-axis (PA) offset that `lunar_frame::icrf_to_moon_pa`
//! applies, against SPICE, and the analytic PA orientation end to end against the embedded DE440
//! PA series.
//!
//! Pre-registration: `docs/design/evidence/fut05b-me-pa-offset-sign/PREREGISTRATION.md`
//! (committed alone, e1ead19b). Oracle: `pxform('MOON_ME', 'MOON_PA', et)` of the NAIF SPICE
//! Toolkit on `moon_080317.tf` and `moon_pa_de421_1900-2050.bpc`
//! (`tests/fixtures/lunar_me_pa_offset_spice/`, provenance in its NOTICE.md).
//!
//! Bars: (1) the engine's PA<-ME factor, `icrf_to_moon_pa(jd) · icrf_to_iau_moon(jd)ᵀ`, within
//! 1e-12 rad of SPICE's matrix at the three fixture epochs; (2) `icrf_to_moon_pa` within 30" of
//! the embedded DE440 PA series at four epochs from 2014 to 2028.
//!
//! ## Result
//!
//! First run, 2026-10-13, on the shipped code: **NOT MET**. The PA<-ME factor is 207.70" (1.007e-3
//! rad) from SPICE at all three epochs, twice the 103.9" offset, and `icrf_to_moon_pa` is 208.8"
//! to 211.2" from DE440 PA. The pre-registered change (the transpose dropped) brought the factor to
//! 1.254e-7 rad (0.026") from SPICE, still outside the 1e-12 bar, and the end-to-end gap to
//! 5.96" to 8.30". Under the outcome rule the engine was left unchanged, and the change was
//! re-registered with the composition order SPICE documents (frames.req).

use kshana::lunar_frame::{icrf_to_iau_moon, icrf_to_moon_pa, try_icrf_to_moon_pa_de440};

type M = [[f64; 3]; 3];

fn matmul(a: &M, b: &M) -> M {
    let mut o = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            for k in 0..3 {
                o[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    o
}

fn transpose(a: &M) -> M {
    let mut o = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            o[i][j] = a[j][i];
        }
    }
    o
}

/// Rotation angle (rad) of `aᵀ b`, from the Frobenius norm of the difference (accurate at small
/// angles, unlike the trace form): `2 asin(|a - b|_F / (2 sqrt 2))`.
fn angle(a: &M, b: &M) -> f64 {
    let mut s = 0.0;
    for i in 0..3 {
        for j in 0..3 {
            s += (a[i][j] - b[i][j]).powi(2);
        }
    }
    2.0 * (s.sqrt() / (2.0 * 2f64.sqrt())).min(1.0).asin()
}

const ARCSEC: f64 = std::f64::consts::PI / 648_000.0;

fn spice_rows() -> Vec<(f64, M)> {
    let text = include_str!("fixtures/lunar_me_pa_offset_spice/spice_me_to_pa.csv");
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let v: Vec<f64> = l.split(',').map(|x| x.parse().expect("number")).collect();
            let mut m = [[0.0; 3]; 3];
            for i in 0..3 {
                for j in 0..3 {
                    m[i][j] = v[1 + 3 * i + j];
                }
            }
            (v[0], m)
        })
        .collect()
}

/// The engine's PA<-ME factor at the SPICE epochs: (epoch, angle to SPICE in rad).
fn offset_gaps() -> Vec<(f64, f64)> {
    spice_rows()
        .into_iter()
        .map(|(et, m)| {
            let jd = 2_451_545.0 + et / 86_400.0;
            let f = matmul(&icrf_to_moon_pa(jd), &transpose(&icrf_to_iau_moon(jd)));
            (et, angle(&f, &m))
        })
        .collect()
}

/// The analytic PA orientation against the embedded DE440 PA series: (jd, angle in arcsec).
fn de440_gaps() -> Vec<(f64, f64)> {
    [2_457_000.5, 2_459_580.5, 2_461_000.5, 2_462_000.5]
        .into_iter()
        .map(|jd| {
            let d = try_icrf_to_moon_pa_de440(jd).expect("inside the DE440 span");
            (jd, angle(&icrf_to_moon_pa(jd), &d) / ARCSEC)
        })
        .collect()
}

#[test]
#[ignore = "finding 2026-10-13: the shipped PA<-ME offset is 207.7\" from SPICE (applied in the wrong direction); fix re-registered"]
fn me_to_pa_offset_matches_spice_and_the_pa_orientation_tracks_de440() {
    let off = offset_gaps();
    let de = de440_gaps();
    for (et, a) in &off {
        println!(
            "PA<-ME offset at et {et:.0} s: {a:.3e} rad from SPICE ({:.2}\")",
            a / ARCSEC
        );
    }
    for (jd, a) in &de {
        println!("icrf_to_moon_pa vs DE440 PA at JD {jd}: {a:.2}\"");
    }
    assert_eq!(off.len(), 3);
    for (et, a) in &off {
        assert!(
            *a <= 1e-12,
            "PA<-ME offset at et {et}: {a:.3e} rad from SPICE"
        );
    }
    for (jd, a) in &de {
        assert!(
            *a <= 30.0,
            "icrf_to_moon_pa at JD {jd}: {a:.2}\" from DE440 PA"
        );
    }
}
