// SPDX-License-Identifier: AGPL-3.0-only
//! The ANISE side of the cross-check: the high-precision Earth body-fixed rotation.
//!
//! Wraps an [`Almanac`] loaded from the Earth-orientation BPC and exposes the inertial
//! -> ITRF93 rotation as a plain `[[f64; 3]; 3]`, so the comparison code never depends
//! on ANISE's matrix type. ANISE reproduces SPICE's ITRF93 rotation at the centimetre
//! level (its own validation suite tolerances the DCM to 2e-9 vs SPICE `pxform`).

use anise::almanac::Almanac;
use anise::constants::frames::{EARTH_ITRF93, EME2000, GCRF};
use anise::math::Matrix3;
use anise::prelude::{Epoch as AniseEpoch, BPC};

use crate::compare::Mat3;
use crate::timeconv::Epoch;

/// Convert ANISE's nalgebra `Matrix3` rotation into a row-major `[[f64; 3]; 3]`.
fn matrix3_to_mat3(m: &Matrix3) -> Mat3 {
    let mut out = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            out[i][j] = m[(i, j)];
        }
    }
    out
}

/// Build the ANISE `Epoch` for a UTC calendar instant (leap seconds handled by hifitime
/// internally). Sub-second time is preserved via the nanosecond field.
fn anise_epoch(e: &Epoch) -> AniseEpoch {
    let whole = e.second.floor();
    let nanos = ((e.second - whole) * 1.0e9).round() as u32;
    AniseEpoch::from_gregorian_utc(
        e.year,
        e.month as u8,
        e.day as u8,
        e.hour as u8,
        e.minute as u8,
        whole as u8,
        nanos,
    )
}

/// ANISE's high-precision Earth, ready to produce inertial -> ITRF93 rotations.
pub struct AniseEarth {
    almanac: Almanac,
}

impl AniseEarth {
    /// Load from a high-precision Earth-orientation BPC (`earth_latest_high_prec.bpc`).
    pub fn from_bpc_path(path: &str) -> Result<Self, String> {
        let bpc = BPC::load(path).map_err(|e| format!("load BPC {path}: {e}"))?;
        Ok(Self {
            almanac: Almanac::from_bpc(bpc),
        })
    }

    /// The GCRF (ICRS) -> ITRF93 rotation matrix at `epoch`. GCRF is the ANISE frame
    /// that matches `kshana`'s GCRS input (both include the IERS/SOFA frame bias),
    /// making this the apples-to-apples counterpart of `kshana_chain::gcrs_to_itrs`.
    pub fn gcrf_to_itrf93(&self, epoch: &Epoch) -> Result<Mat3, String> {
        let dcm = self
            .almanac
            .rotate(GCRF, EARTH_ITRF93, anise_epoch(epoch))
            .map_err(|e| format!("rotate GCRF->ITRF93: {e}"))?;
        Ok(matrix3_to_mat3(&dcm.rot_mat))
    }

    /// The EME2000 (J2000) -> ITRF93 rotation matrix at `epoch`. EME2000 omits the
    /// ~tens-of-mas frame bias relative to GCRF; exposed for completeness / diagnosis.
    pub fn eme2000_to_itrf93(&self, epoch: &Epoch) -> Result<Mat3, String> {
        let dcm = self
            .almanac
            .rotate(EME2000, EARTH_ITRF93, anise_epoch(epoch))
            .map_err(|e| format!("rotate EME2000->ITRF93: {e}"))?;
        Ok(matrix3_to_mat3(&dcm.rot_mat))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::compare::{mat_mul, relative_angle_arcsec, transpose};
    use crate::kernel::resolve_bpc;
    use crate::timeconv::from_utc;

    fn is_orthonormal(m: &Mat3) -> bool {
        let p = mat_mul(m, &transpose(m));
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

    #[test]
    fn anise_itrf93_rotation_is_orthonormal_and_invertible() {
        let Some(path) = resolve_bpc() else {
            eprintln!("SKIP anise_itrf93_rotation: no BPC kernel (set KSHANA_ANISE_BPC or run `frame-xval`)");
            return;
        };
        let earth = AniseEarth::from_bpc_path(path.to_str().unwrap()).expect("load BPC");
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, -0.1771554);
        let m = earth.gcrf_to_itrf93(&e).expect("rotate");
        assert!(is_orthonormal(&m), "ANISE GCRF->ITRF93 must be orthonormal");
        // EME2000 vs GCRF differ only by the small constant frame bias (tens of mas).
        let m_j2000 = earth.eme2000_to_itrf93(&e).expect("rotate j2000");
        let bias = relative_angle_arcsec(&m, &m_j2000);
        assert!(
            bias < 0.1,
            "GCRF vs EME2000 should differ only by the ~mas frame bias, got {bias} arcsec"
        );
    }
}
