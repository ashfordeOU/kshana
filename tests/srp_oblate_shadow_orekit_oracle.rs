// SPDX-License-Identifier: AGPL-3.0-only
//! The oblate-Earth SRP shadow (`srp_shadow::oblate_conical_shadow`, FUT-09/RM-11) and the
//! spherical baseline (`forces::conical_shadow`) against **Orekit 12.2**
//! `SolarRadiationPressure.getLightingRatio` with a WGS-84 (and a spherical) `OneAxisEllipsoid`,
//! over 2400 geometries across the shadow edge. Bars pre-registered in
//! `xval/srp-oblate-shadow-orekit/PREREGISTRATION.md` (6d6d269c); results in `RESULTS.md` there.
//!
//! PIN-SCOPE:    the 2400 Orekit lighting ratios of
//!               tests/fixtures/srp_oblate_shadow_orekit_oracle/srp_oblate_shadow_orekit_oracle.txt
//!               against the pre-registered 1e-6 bars and the 1e-2 sensitivity requirement.
//! PIN-EXCLUDES: every kshana report and scenario output; solar limb darkening (no oracle); the
//!               ellipsoid axis orientation (precession-nutation) on either side.

use kshana::forces::conical_shadow;
use kshana::srp_shadow::oblate_conical_shadow;

const REF: &str =
    include_str!("fixtures/srp_oblate_shadow_orekit_oracle/srp_oblate_shadow_orekit_oracle.txt");
const AU: f64 = 1.495_978_707e11;
const BAR: f64 = 1e-6;
const SENSITIVITY: f64 = 1e-2;

type Vec3 = [f64; 3];

/// The generator's geometry, rebuilt with the same formulas.
fn geometry(rho: f64, d_deg: f64, psi_deg: f64, th: f64) -> (Vec3, Vec3) {
    let (d, psi) = (d_deg.to_radians(), psi_deg.to_radians());
    let s = [AU * d.cos(), 0.0, AU * d.sin()];
    let a = [-d.cos(), 0.0, -d.sin()];
    let mut e1 = [-a[1], a[0], 0.0];
    let n = e1[0].hypot(e1[1]);
    e1 = [e1[0] / n, e1[1] / n, 0.0];
    let e2 = [
        a[1] * e1[2] - a[2] * e1[1],
        a[2] * e1[0] - a[0] * e1[2],
        a[0] * e1[1] - a[1] * e1[0],
    ];
    let u: Vec3 = std::array::from_fn(|k| psi.cos() * e1[k] + psi.sin() * e2[k]);
    let r: Vec3 = std::array::from_fn(|k| rho * (th.cos() * a[k] + th.sin() * u[k]));
    (r, s)
}

#[test]
fn oblate_and_spherical_shadows_match_orekit() {
    let (mut n, mut pen) = (0usize, 0usize);
    let (mut w_obl, mut w_sph, mut sens) = (0.0_f64, 0.0_f64, 0.0_f64);
    for line in REF.lines().filter(|l| !l.starts_with('#')) {
        let f: Vec<f64> = line
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        let (r, s) = geometry(f[1], f[2], f[3], f[4]);
        let (nu_w, nu_s) = (f[5], f[6]);
        w_obl = w_obl.max((oblate_conical_shadow(r, s, None) - nu_w).abs());
        w_sph = w_sph.max((conical_shadow(r, s) - nu_s).abs());
        sens = sens.max((nu_w - nu_s).abs());
        n += 1;
        pen += usize::from(nu_w > 0.0 && nu_w < 1.0);
    }
    println!(
        "{n} geometries ({pen} in penumbra): oblate worst {w_obl:.3e}, sphere worst {w_sph:.3e}, \
         Orekit WGS-84 vs sphere {sens:.3e}"
    );
    assert_eq!(n, 2400);
    assert!(
        sens > SENSITIVITY,
        "the set does not discriminate oblateness ({sens})"
    );
    assert!(w_sph <= BAR, "spherical baseline {w_sph} > {BAR}");
    assert!(w_obl <= BAR, "oblate {w_obl} > {BAR}");
}
