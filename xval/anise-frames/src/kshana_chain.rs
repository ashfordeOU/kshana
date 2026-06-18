// SPDX-License-Identifier: AGPL-3.0-only
//! The `kshana` side of the cross-check: its IAU 2006/2000A CIO reduction.

use crate::compare::Mat3;
use crate::timeconv::Epoch;

/// The GCRS -> ITRS rotation from `kshana`'s CIO chain at `epoch`, given the IERS
/// polar-motion pole in arc seconds. Wraps [`kshana::cio::gcrs_to_itrs_matrix`]
/// (CIO based, SOFA `eraC2tcio`: `R = POM · R3(ERA) · C`), converting the pole from
/// arc seconds to radians via the crate's own [`kshana::frames::arcsec`].
pub fn gcrs_to_itrs(epoch: &Epoch, xp_arcsec: f64, yp_arcsec: f64) -> Mat3 {
    let xp = kshana::frames::arcsec(xp_arcsec);
    let yp = kshana::frames::arcsec(yp_arcsec);
    kshana::cio::gcrs_to_itrs_matrix(epoch.jd_tt, epoch.jd_ut1, xp, yp)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::compare::{relative_angle_rad, transpose};
    use crate::timeconv::from_utc;

    fn is_orthonormal(m: &Mat3) -> bool {
        let p = crate::compare::mat_mul(m, &transpose(m));
        for (i, row) in p.iter().enumerate() {
            for (j, &pij) in row.iter().enumerate() {
                let e = if i == j { 1.0 } else { 0.0 };
                if (pij - e).abs() > 1e-12 {
                    return false;
                }
            }
        }
        true
    }

    #[test]
    fn kshana_rotation_is_a_proper_orthonormal_matrix() {
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, -0.1771554);
        let m = gcrs_to_itrs(&e, 0.076577, 0.282336);
        assert!(is_orthonormal(&m), "GCRS->ITRS must be orthonormal");
    }

    #[test]
    fn polar_motion_perturbs_the_rotation_by_the_expected_arcseconds() {
        // Turning the pole on vs off must rotate the Earth-fixed frame by ~|(xp,yp)|.
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, -0.1771554);
        let with_pole = gcrs_to_itrs(&e, 0.076577, 0.282336);
        let no_pole = gcrs_to_itrs(&e, 0.0, 0.0);
        let dtheta = relative_angle_rad(&with_pole, &no_pole);
        let pole_mag =
            (0.076577_f64.powi(2) + 0.282336_f64.powi(2)).sqrt() / crate::compare::RAD_TO_ARCSEC;
        // The polar-motion rotation magnitude is ~the pole vector length (to within the
        // small s' TIO-locator term); agree to 1%.
        assert!(
            (dtheta - pole_mag).abs() < 0.01 * pole_mag,
            "polar-motion Δθ = {dtheta} rad, pole = {pole_mag} rad"
        );
    }
}
