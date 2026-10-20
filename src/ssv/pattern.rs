// SPDX-License-Identifier: AGPL-3.0-only
//! Transmit patterns of the GNSS satellites and receive patterns of the space user.
//!
//! Three transmit models, in the order of how much they claim:
//!
//! * [`TxPattern::Booklet`]: the ICG booklet's own model: constant power (the minimum radiated transmit power, MRTP) inside
//!   the reference off-boresight angle and nothing outside it. It is what the booklet's tables are computed with and is the
//!   only model the global-shell sweep supports.
//! * [`TxPattern::Parametric`]: a shaped main lobe and a sidelobe floor, labelled REPRESENTATIVE: the numbers are stand-ins
//!   (3 dB per degree beyond the edge, a floor 25 dB down), not any system's measured pattern. It exists so a sweep can
//!   count signals received through sidelobes, which the booklet's main-lobe-only model cannot.
//! * [`TxPattern::Table`]: a measured pattern the user supplies (for example the GPS Block IIR/IIR-M panel patterns the
//!   US Coast Guard Navigation Center publishes, extracted by `xval/gnss-ssv/extract_patterns.py` from files fetched, never
//!   vendored). Its shape is anchored so that its azimuth average at the reference angle equals the MRTP.

use crate::antenna::GainPattern2D;
use crate::portable_math::PortableFloat;
use std::sync::Arc;

/// A parametric shaped-beam pattern's two numbers (both representative stand-ins).
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct ParametricPattern {
    /// Fall-off beyond the reference off-boresight angle, dB per degree.
    pub edge_db_per_deg: f64,
    /// The sidelobe floor below the main lobe, dB (positive number).
    pub sidelobe_db: f64,
}

impl Default for ParametricPattern {
    fn default() -> Self {
        Self {
            edge_db_per_deg: 3.0,
            sidelobe_db: 25.0,
        }
    }
}

/// A transmit pattern.
#[derive(Clone, Debug)]
pub enum TxPattern {
    /// Constant MRTP inside the reference angle, nothing outside.
    Booklet,
    /// Shaped main lobe with a sidelobe floor (representative).
    Parametric(ParametricPattern),
    /// A tabulated measured pattern, anchored at the reference angle.
    Table(Arc<GainPattern2D>),
}

impl TxPattern {
    /// The radiated power (EIRP, dBW) toward a point `theta_deg` off the boresight, given the signal's MRTP and reference
    /// angle; `None` where the pattern radiates nothing usable (outside the booklet cone, beyond 90 degrees, outside the
    /// table). `az_deg` is the azimuth about the boresight, used by azimuth-dependent tables only.
    pub fn eirp_dbw(
        &self,
        mrtp_dbw: f64,
        beam_deg: f64,
        theta_deg: f64,
        az_deg: f64,
    ) -> Option<f64> {
        match self {
            TxPattern::Booklet => (theta_deg <= beam_deg).then_some(mrtp_dbw),
            TxPattern::Parametric(p) => {
                if theta_deg > 90.0 {
                    None
                } else if theta_deg <= beam_deg {
                    Some(mrtp_dbw)
                } else {
                    let drop = (p.edge_db_per_deg * (theta_deg - beam_deg)).min(p.sidelobe_db);
                    Some(mrtp_dbw - drop)
                }
            }
            TxPattern::Table(t) => {
                let g = t.gain_at(az_deg, theta_deg)?;
                let avg = t.azimuth_average();
                let edge = interp(&avg, beam_deg)?;
                Some(mrtp_dbw + g - edge)
            }
        }
    }

    /// Whether the pattern gives the booklet's constant-power cone (the only kind the shell sweep supports).
    pub fn is_booklet(&self) -> bool {
        matches!(self, TxPattern::Booklet)
    }

    /// A short label for reports.
    pub fn label(&self) -> &'static str {
        match self {
            TxPattern::Booklet => "booklet: constant minimum radiated power inside the reference angle (main lobe only)",
            TxPattern::Parametric(_) => "parametric shaped beam with a sidelobe floor (REPRESENTATIVE stand-in, not a measured pattern)",
            TxPattern::Table(_) => "tabulated pattern supplied by the user, anchored at the reference angle",
        }
    }
}

fn interp(avg: &[(f64, f64)], x: f64) -> Option<f64> {
    if avg.len() < 2 || x < avg[0].0 || x > avg[avg.len() - 1].0 {
        return None;
    }
    let k = avg.partition_point(|p| p.0 <= x).clamp(1, avg.len() - 1);
    let (x0, y0) = avg[k - 1];
    let (x1, y1) = avg[k];
    Some(y0 + (y1 - y0) * (x - x0) / (x1 - x0))
}

/// The user antennas of the booklet's table B10: gain against the angle from the antenna boresight.
const B10_ANGLES: [f64; 19] = [
    0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0,
    80.0, 85.0, 90.0,
];
const B10_PATCH: [f64; 19] = [
    2.8, 2.9, 3.3, 3.6, 4.0, 4.4, 4.5, 4.4, 4.1, 3.7, 2.8, 1.8, 0.8, -0.7, -1.7, -3.2, -5.2, -6.2,
    -8.7,
];
const B10_HIGH_L1: [f64; 19] = [
    9.00, 8.97, 8.90, 8.56, 8.02, 7.32, 6.46, 5.45, 4.33, 3.11, 1.82, 0.46, -0.93, -2.34, -3.74,
    -5.12, -6.47, -7.78, -9.03,
];
const B10_HIGH_L5: [f64; 19] = [
    8.25, 8.24, 8.05, 7.75, 7.33, 6.79, 6.15, 5.42, 4.61, 3.74, 2.81, 1.83, 0.83, -0.21, -1.25,
    -2.31, -3.38, -4.45, -5.52,
];

/// A named receive-gain table.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum NamedAntenna {
    /// Table B10's patch antenna (L1 and L5).
    BookletPatch,
    /// Table B10's high-gain antenna (L1 column on L1, L5 column on L5).
    BookletHighGain,
}

/// Where the user antenna points.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Axis {
    /// Towards the Earth's centre.
    Nadir,
    /// Away from the Earth's centre.
    Zenith,
}

/// One receive antenna of the user spacecraft.
#[derive(Clone, Debug, PartialEq)]
pub enum UserAntenna {
    /// 0 dBi in every direction.
    Omni,
    /// 0 dBi inside the hemisphere around `axis`, nothing outside (the booklet's "hemispherical" antenna).
    Hemisphere(Axis),
    /// A gain table against the angle from the boresight (degrees, ascending), pointing along `axis`; no signal beyond the
    /// last tabulated angle.
    Table {
        /// Boresight direction.
        axis: Axis,
        /// `(angle from boresight deg, gain dBi)`.
        points: Vec<(f64, f64)>,
    },
}

impl UserAntenna {
    /// The booklet's table-B10 antenna for a band, pointing along `axis`.
    pub fn named(n: &NamedAntenna, band: super::constellations::Band, axis: Axis) -> Self {
        let g: &[f64; 19] = match (n, band) {
            (NamedAntenna::BookletPatch, _) => &B10_PATCH,
            (NamedAntenna::BookletHighGain, super::constellations::Band::L1) => &B10_HIGH_L1,
            (NamedAntenna::BookletHighGain, super::constellations::Band::L5) => &B10_HIGH_L5,
        };
        UserAntenna::Table {
            axis,
            points: B10_ANGLES.iter().copied().zip(g.iter().copied()).collect(),
        }
    }

    /// The gain (dBi) towards a transmitter. `u` is the user's inertial position (its radial direction defines nadir and
    /// zenith), `los_to_tx` the unit vector from the user to the transmitter. `None` when the antenna does not see it.
    pub fn gain_dbi(&self, u: [f64; 3], los_to_tx: [f64; 3]) -> Option<f64> {
        let up = super::geom::unit(u);
        let off_zenith = super::geom::dot(up, los_to_tx)
            .clamp(-1.0, 1.0)
            .pacos()
            .to_degrees();
        match self {
            UserAntenna::Omni => Some(0.0),
            UserAntenna::Hemisphere(axis) => {
                let off = match axis {
                    Axis::Zenith => off_zenith,
                    Axis::Nadir => 180.0 - off_zenith,
                };
                (off <= 90.0).then_some(0.0)
            }
            UserAntenna::Table { axis, points } => {
                let off = match axis {
                    Axis::Zenith => off_zenith,
                    Axis::Nadir => 180.0 - off_zenith,
                };
                if points.len() < 2 || off < points[0].0 || off > points[points.len() - 1].0 {
                    return None;
                }
                interp(points, off)
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn booklet_pattern_is_a_cone_and_the_parametric_one_falls_to_a_floor() {
        let b = TxPattern::Booklet;
        assert_eq!(b.eirp_dbw(9.0, 23.5, 20.0, 0.0), Some(9.0));
        assert_eq!(b.eirp_dbw(9.0, 23.5, 24.0, 0.0), None);
        let p = TxPattern::Parametric(ParametricPattern::default());
        assert_eq!(p.eirp_dbw(9.0, 23.5, 23.5, 0.0), Some(9.0));
        assert_eq!(p.eirp_dbw(9.0, 23.5, 25.5, 0.0), Some(3.0));
        assert_eq!(p.eirp_dbw(9.0, 23.5, 60.0, 0.0), Some(-16.0));
        assert_eq!(p.eirp_dbw(9.0, 23.5, 91.0, 0.0), None);
    }

    #[test]
    fn table_b10_antenna_reads_as_gain_against_angle_from_the_boresight() {
        let a = UserAntenna::named(
            &NamedAntenna::BookletHighGain,
            super::super::constellations::Band::L1,
            Axis::Nadir,
        );
        // A user on the +x axis: nadir is -x. A transmitter straight below has zero off-boresight angle.
        let g0 = a.gain_dbi([4.2e7, 0.0, 0.0], [-1.0, 0.0, 0.0]).unwrap();
        assert!((g0 - 9.0).abs() < 1e-12);
        let g90 = a.gain_dbi([4.2e7, 0.0, 0.0], [0.0, 1.0, 0.0]).unwrap();
        assert!((g90 + 9.03).abs() < 1e-12);
        assert!(a.gain_dbi([4.2e7, 0.0, 0.0], [1.0, 0.0, 0.0]).is_none());
        assert!(
            (a.gain_dbi([4.2e7, 0.0, 0.0], [-0.9961946981, 0.087155743, 0.0])
                .unwrap()
                - 8.97)
                .abs()
                < 1e-6
        );
    }
}
