// SPDX-License-Identifier: AGPL-3.0-only
//! Klobuchar broadcast-ionosphere reference test (external oracle).
//!
//! kshana's `klobuchar_delay_m` (the IS-GPS-200 §20.3.3.5.2.5 single-frequency
//! ionosphere model) is checked against an **independent third-party
//! implementation**: RTKLIB's `ionmodel` (tomojitakasu/RTKLIB, `src/rtkcmn.c`),
//! the de-facto open GNSS reference, compiled from source and run on the inputs
//! below. Reproducing RTKLIB's slant L1 delay across elevation, azimuth,
//! local-time and two coefficient sets makes the model externally validated, not
//! merely self-consistent. The reference numbers are the RTKLIB outputs to six
//! decimals; kshana matches to far better than the 1e-4 m gate.

use kshana::gnss_sim::{klobuchar_delay_m, KlobucharCoeffs};

const D2R: f64 = std::f64::consts::PI / 180.0;
const TOL_M: f64 = 1e-4;

/// (lat°, lon°, elevation°, azimuth°, GPS seconds-of-day, RTKLIB delay [m]).
struct Case(f64, f64, f64, f64, f64, f64);

fn check(coeffs: &KlobucharCoeffs, cases: &[Case], label: &str) {
    for (i, x) in cases.iter().enumerate() {
        let got = klobuchar_delay_m(coeffs, x.0 * D2R, x.1 * D2R, x.2 * D2R, x.3 * D2R, x.4);
        let d = (got - x.5).abs();
        assert!(
            d <= TOL_M,
            "{label}[{i}]: kshana {got:.6} m vs RTKLIB ionmodel {:.6} m (|Δ|={d:.2e} > {TOL_M:.0e})",
            x.5
        );
    }
}

#[test]
fn klobuchar_matches_rtklib_ionmodel_with_kshana_default_coeffs() {
    // kshana's KlobucharCoeffs::default() — the IS-GPS-200 worked-example set.
    check(
        &KlobucharCoeffs::default(),
        &[
            Case(40.0, -100.0, 45.0, 0.0, 50400.0, 5.232845),
            Case(40.0, -100.0, 80.0, 0.0, 50400.0, 4.196824),
            Case(40.0, -100.0, 10.0, 0.0, 50400.0, 7.888022),
            Case(0.0, 0.0, 90.0, 0.0, 7200.0, 1.499610),
        ],
        "kshana-default",
    );
}

#[test]
fn klobuchar_matches_rtklib_ionmodel_with_rtklib_default_coeffs() {
    // RTKLIB's own built-in default broadcast coefficients.
    let coeffs = KlobucharCoeffs {
        alpha: [0.1118e-7, -0.7451e-8, -0.5961e-7, 0.1192e-6],
        beta: [0.1167e6, -0.2294e6, -0.1311e6, 0.1049e7],
    };
    check(
        &coeffs,
        &[
            Case(40.0, 260.0, 20.0, 210.0, 518400.0, 6.127760),
            Case(40.0, 260.0, 80.0, 210.0, 518400.0, 2.606222),
            Case(40.0, 260.0, 5.0, 210.0, 518400.0, 9.339666),
            Case(40.0, 260.0, 45.0, 45.0, 7200.0, 2.025446),
            Case(0.0, 0.0, 30.0, 90.0, 43200.0, 8.167701),
            Case(-35.0, 150.0, 25.0, 300.0, 64800.0, 2.933828),
        ],
        "rtklib-default",
    );
}
