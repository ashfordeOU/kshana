// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the DE440 lunar principal-axis orientation provider
//! (`lunar_orientation::de440_moon_pa`), against the NAIF SPICE Toolkit evaluating the
//! JPL binary PCK directly.
//!
//! ## Oracle (kind: Library)
//!
//! The NAIF SPICE Toolkit, CSPICE N0067 through spiceypy 8.2.0 (MIT,
//! <https://github.com/AndrewAnnex/SpiceyPy>): `pxform("MOON_PA_DE440", "J2000", et)` on
//! the JPL DE440 binary PCK `moon_pa_de440_200625.bpc`, with NAIF's own frame kernel
//! `moon_de440_250416.tf` and `naif0012.tls`. Kshana interpolates a committed daily series
//! (geodesic interpolation between the daily nodes, then a column Gram-Schmidt pass); SPICE
//! evaluates the kernel's Chebyshev segments at the exact epoch. The two share nothing but
//! the kernel. The first comparison, against the element-wise linear scheme the module used
//! before, measured 1.96e-4 rad and failed this bound; the bound was not changed.
//!
//! ## Epochs
//!
//! 2 000 epochs drawn uniformly (numpy `default_rng(20261001)`) between 2024-01-01 and
//! 2025-12-31 TDB, the window of the embedded series, so they fall between the daily nodes.
//! Kshana's argument is `(et / 86400) / 36525`, the convention the embedded series uses.
//!
//! ## Tolerance (fixed before the first comparison)
//!
//! The angle of the relative rotation `R_kshanaᵀ · R_spice` is at most **1.7e-5 rad**
//! (30 m at the 1 737.4 km mean lunar radius) at every epoch. The module documents no
//! tighter interpolation bound (its doc comment states about 0.06 deg before
//! renormalisation; the guard test bounds the one-day error below 600 m), so this is the
//! plan's bound.
//!
//! ## Fixture
//!
//! `tests/fixtures/lunar_pa_orientation_spice_oracle/spice_moon_pa_reference.csv`, written
//! by the committed `generate_lunar_pa_orientation_spice_oracle.py` (kernel SHA-256 values
//! in the file header and in `NOTICE.md`).

use kshana::lunar_orientation::de440_moon_pa;

const REF: &str =
    include_str!("fixtures/lunar_pa_orientation_spice_oracle/spice_moon_pa_reference.csv");

/// Pre-registered bound on the rotation angle between Kshana and SPICE (rad).
const ANGLE_TOL_RAD: f64 = 1.7e-5;

type M3 = [[f64; 3]; 3];

/// Rotation angle of `aᵀ·b`, computed from both the trace and the skew part so that it
/// stays accurate at small angles (a pure `acos` of the trace loses precision there).
fn relative_angle(a: &M3, b: &M3) -> f64 {
    let mut m = [[0.0; 3]; 3];
    for (i, row) in m.iter_mut().enumerate() {
        for (j, v) in row.iter_mut().enumerate() {
            *v = (0..3).map(|k| a[k][i] * b[k][j]).sum();
        }
    }
    let tr = m[0][0] + m[1][1] + m[2][2];
    let sx = m[2][1] - m[1][2];
    let sy = m[0][2] - m[2][0];
    let sz = m[1][0] - m[0][1];
    let s = 0.5 * (sx * sx + sy * sy + sz * sz).sqrt();
    s.atan2(0.5 * (tr - 1.0))
}

fn rows() -> Vec<(f64, M3)> {
    REF.lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("et_") && !l.trim().is_empty())
        .map(|l| {
            let v: Vec<f64> = l.split(',').map(|x| x.trim().parse().unwrap()).collect();
            assert_eq!(v.len(), 10, "malformed fixture row: {l}");
            (
                v[0],
                [[v[1], v[2], v[3]], [v[4], v[5], v[6]], [v[7], v[8], v[9]]],
            )
        })
        .collect()
}

#[test]
fn interpolated_rotation_matches_direct_kernel_evaluation_off_node() {
    let rows = rows();
    assert_eq!(
        rows.len(),
        2000,
        "the oracle fixture should hold 2 000 epochs"
    );

    let mut worst = 0.0_f64;
    let mut worst_et = 0.0;
    let mut sum_sq = 0.0;
    for (et, r_spice) in &rows {
        let t_jc = et / 86_400.0 / 36_525.0;
        let r_k = de440_moon_pa(t_jc);
        let ang = relative_angle(&r_k, r_spice);
        sum_sq += ang * ang;
        if ang > worst {
            worst = ang;
            worst_et = *et;
        }
    }
    let rms = (sum_sq / rows.len() as f64).sqrt();
    eprintln!(
        "M090 oracle: {} epochs, worst rotation angle {:.3e} rad ({:.2} m at 1737.4 km) at \
         et {:.1}, RMS {:.3e} rad ({:.2} m); tolerance {:.1e} rad",
        rows.len(),
        worst,
        worst * 1_737_400.0,
        worst_et,
        rms,
        rms * 1_737_400.0,
        ANGLE_TOL_RAD
    );
    assert!(
        worst <= ANGLE_TOL_RAD,
        "Kshana's interpolated MOON_PA_DE440 orientation departs from the SPICE evaluation \
         of the binary PCK by {worst:.3e} rad at et {worst_et}, above the pre-registered \
         {ANGLE_TOL_RAD:.1e} rad"
    );
}
