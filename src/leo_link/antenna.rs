// SPDX-License-Identifier: AGPL-3.0-only
//! Antenna gains and polarisation for a satellite-to-user link.
//!
//! * [`SatPattern`]: the transmit pattern of a nadir-pointing satellite antenna as a gain
//!   relative to its peak, as a function of the nadir angle (the angle at the satellite between
//!   the direction to the Earth's centre and the direction to the user). Three shapes:
//!   **isoflux** (gain rises off nadir exactly as the slant range grows, so the flux density on
//!   the ground is constant out to an edge-of-coverage elevation), a **Gaussian** main lobe
//!   `−12·(η/θ₃)²` dB (the parabolic main-lobe law of ITU-R S.672 and S.1528, `θ₃` the
//!   half-power beamwidth), and **flat** (constant gain over the whole visible Earth).
//! * [`UserAntenna`]: the receive gain of the user antenna against elevation: a **patch**
//!   modelled as `G_z + 10·q·log10(sin el)` dBic (a cosine-power roll-off from the zenith gain
//!   `G_z`, floored at a minimum gain), a **hemispherical** antenna (constant gain above the
//!   horizon), or an **isotropic** one.
//! * [`polarisation_loss_db`]: the polarisation mismatch loss between two elliptically
//!   polarised antennas from their axial ratios and senses, the standard polarisation loss
//!   factor averaged over the relative orientation of the two ellipses.
//!
//! **Label: MODELLED.** The pattern shapes are textbook idealisations; no satellite's measured
//! pattern is reproduced.

/// Transmit pattern of a nadir-pointing satellite antenna.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum SatPattern {
    /// Constant flux density on the ground down to `edge_elevation_deg`; beyond that edge the
    /// gain rolls off as a Gaussian of width `rolloff_deg`.
    Isoflux {
        /// Elevation at the edge of coverage (deg).
        edge_elevation_deg: f64,
        /// Roll-off width beyond the edge (deg of nadir angle to −12 dB).
        rolloff_deg: f64,
    },
    /// A Gaussian main lobe of half-power beamwidth `hpbw_deg` (full width), floored at
    /// `floor_db` below the peak.
    Gaussian {
        /// Full half-power beamwidth (deg).
        hpbw_deg: f64,
        /// Sidelobe floor relative to the peak (dB, negative).
        floor_db: f64,
    },
    /// Constant gain over the whole visible Earth.
    Flat,
}

/// Slant range (m) from a satellite at radius `rs` to the Earth's surface (radius `re`) along a
/// ray at nadir angle `eta` (rad), or `None` past the limb.
pub fn slant_range_at_nadir_angle(rs: f64, re: f64, eta: f64) -> Option<f64> {
    let s = eta.sin();
    let disc = re * re - rs * rs * s * s;
    (disc >= 0.0).then(|| rs * eta.cos() - disc.sqrt())
}

/// Nadir angle (rad) of the ray that reaches the surface at elevation `el` (rad):
/// `sin η = (re/rs)·cos el`.
pub fn nadir_angle_for_elevation(rs: f64, re: f64, el: f64) -> f64 {
    ((re / rs) * el.cos()).clamp(-1.0, 1.0).asin()
}

impl SatPattern {
    /// Gain relative to the pattern's peak (dB, at most 0) at nadir angle `eta_rad`, for a
    /// satellite at radius `rs_m` over a sphere of radius `re_m`.
    pub fn relative_gain_db(&self, eta_rad: f64, rs_m: f64, re_m: f64) -> f64 {
        let eta = eta_rad.abs();
        match *self {
            SatPattern::Flat => 0.0,
            SatPattern::Gaussian { hpbw_deg, floor_db } => {
                // −3·(η/(θ₃/2))² = −12·(η/θ₃)²: −3 dB at half the full beamwidth.
                (-12.0 * (eta.to_degrees() / hpbw_deg.max(1e-6)).powi(2)).max(floor_db)
            }
            SatPattern::Isoflux {
                edge_elevation_deg,
                rolloff_deg,
            } => {
                let eta_e = nadir_angle_for_elevation(rs_m, re_m, edge_elevation_deg.to_radians());
                let rho_e = slant_range_at_nadir_angle(rs_m, re_m, eta_e).unwrap_or(rs_m - re_m);
                if eta <= eta_e {
                    let rho = slant_range_at_nadir_angle(rs_m, re_m, eta).unwrap_or(rho_e);
                    20.0 * (rho / rho_e).log10()
                } else {
                    let x = (eta - eta_e).to_degrees() / rolloff_deg.max(1e-6);
                    (-12.0 * x * x).max(-40.0)
                }
            }
        }
    }

    /// A short name for reports.
    pub fn name(&self) -> &'static str {
        match self {
            SatPattern::Flat => "flat",
            SatPattern::Gaussian { .. } => "gaussian",
            SatPattern::Isoflux { .. } => "isoflux",
        }
    }
}

/// Receive antenna of the user.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum UserAntenna {
    /// `G(el) = zenith_gain + 10·exponent·log10(sin el)` dBic, floored at `min_gain`.
    Patch {
        /// Gain at the zenith (dBic).
        zenith_gain_dbi: f64,
        /// Cosine-power exponent `q`.
        exponent: f64,
        /// Floor (dBic), also the gain at and below the horizon.
        min_gain_dbi: f64,
    },
    /// Constant gain above the horizon (dBi).
    Hemispherical {
        /// Gain above the horizon (dBi).
        gain_dbi: f64,
    },
    /// 0 dBi in every direction.
    Isotropic,
}

impl UserAntenna {
    /// A typical survey-grade GNSS patch: +3 dBic at the zenith, `q = 1.1`, floored at
    /// −10 dBic, which gives about −5.4 dBic at 10° and −0.3 dBic at 30° elevation.
    pub fn default_patch() -> Self {
        UserAntenna::Patch {
            zenith_gain_dbi: 3.0,
            exponent: 1.1,
            min_gain_dbi: -10.0,
        }
    }

    /// Gain (dBi or dBic) at elevation `el_deg`.
    pub fn gain_dbi(&self, el_deg: f64) -> f64 {
        match *self {
            UserAntenna::Isotropic => 0.0,
            UserAntenna::Hemispherical { gain_dbi } => {
                if el_deg >= 0.0 {
                    gain_dbi
                } else {
                    gain_dbi - 20.0
                }
            }
            UserAntenna::Patch {
                zenith_gain_dbi,
                exponent,
                min_gain_dbi,
            } => {
                let s = el_deg.to_radians().sin();
                if s <= 0.0 {
                    return min_gain_dbi;
                }
                (zenith_gain_dbi + 10.0 * exponent * s.log10()).max(min_gain_dbi)
            }
        }
    }

    /// A short name for reports.
    pub fn name(&self) -> &'static str {
        match self {
            UserAntenna::Patch { .. } => "patch",
            UserAntenna::Hemispherical { .. } => "hemispherical",
            UserAntenna::Isotropic => "isotropic",
        }
    }
}

/// Polarisation of an antenna.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Polarisation {
    /// Right-hand circular.
    Rhcp,
    /// Left-hand circular.
    Lhcp,
    /// Linear.
    Linear,
}

impl Polarisation {
    /// Parse `rhcp`, `lhcp` or `linear`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "rhcp" => Ok(Self::Rhcp),
            "lhcp" => Ok(Self::Lhcp),
            "linear" => Ok(Self::Linear),
            o => Err(format!(
                "polarisation must be rhcp, lhcp or linear; got '{o}'"
            )),
        }
    }

    /// The wire name.
    pub fn as_str(&self) -> &'static str {
        match self {
            Self::Rhcp => "rhcp",
            Self::Lhcp => "lhcp",
            Self::Linear => "linear",
        }
    }
}

/// Signed axial ratio (linear, magnitude at least 1): positive for right-hand, negative for
/// left-hand, a large number for linear.
fn signed_axial_ratio(p: Polarisation, ar_db: f64) -> f64 {
    let r = 10f64.powf(ar_db.abs() / 20.0).max(1.0);
    match p {
        Polarisation::Rhcp => r,
        Polarisation::Lhcp => -r,
        Polarisation::Linear => 1.0e6,
    }
}

/// Polarisation loss factor between a transmitter and a receiver at relative ellipse
/// orientation `delta_rad`:
/// `PLF = 1/2 + [4·r₁·r₂ + (1 − r₁²)(1 − r₂²)·cos 2Δ] / [2(1 + r₁²)(1 + r₂²)]`,
/// with signed axial ratios (the sign is the sense of rotation).
pub fn polarisation_loss_factor(
    tx: Polarisation,
    tx_ar_db: f64,
    rx: Polarisation,
    rx_ar_db: f64,
    delta_rad: f64,
) -> f64 {
    let r1 = signed_axial_ratio(tx, tx_ar_db);
    let r2 = signed_axial_ratio(rx, rx_ar_db);
    // Normalise large ratios to avoid overflow for linear polarisation.
    let (a1, b1) = (1.0 / (1.0 + r1 * r1), r1 * r1 / (1.0 + r1 * r1));
    let (a2, b2) = (1.0 / (1.0 + r2 * r2), r2 * r2 / (1.0 + r2 * r2));
    let cross = 4.0 * r1 * r2 * a1 * a2;
    let diff = (a1 - b1) * (a2 - b2) * (2.0 * delta_rad).cos();
    (0.5 + 0.5 * (cross + diff)).clamp(0.0, 1.0)
}

/// Polarisation mismatch loss (dB, non-negative) averaged over the relative ellipse orientation
/// (`cos 2Δ = 0`), floored at 40 dB for orthogonal polarisations.
pub fn polarisation_loss_db(
    tx: Polarisation,
    tx_ar_db: f64,
    rx: Polarisation,
    rx_ar_db: f64,
) -> f64 {
    let plf = polarisation_loss_factor(tx, tx_ar_db, rx, rx_ar_db, std::f64::consts::FRAC_PI_4);
    (-10.0 * plf.max(1e-4).log10()).max(0.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    const RE: f64 = 6_378_137.0;

    #[test]
    fn isoflux_gain_exactly_cancels_the_range_growth_inside_coverage() {
        let rs = RE + 510e3;
        let p = SatPattern::Isoflux {
            edge_elevation_deg: 10.0,
            rolloff_deg: 3.0,
        };
        let eta_e = nadir_angle_for_elevation(rs, RE, 10f64.to_radians());
        let rho_e = slant_range_at_nadir_angle(rs, RE, eta_e).unwrap();
        for k in 0..20 {
            let eta = eta_e * k as f64 / 20.0;
            let rho = slant_range_at_nadir_angle(rs, RE, eta).unwrap();
            let flux = p.relative_gain_db(eta, rs, RE) - 20.0 * rho.log10();
            assert!((flux + 20.0 * rho_e.log10()).abs() < 1e-9);
        }
        assert!(p.relative_gain_db(eta_e + 0.05, rs, RE) < 0.0);
    }

    #[test]
    fn gaussian_is_minus_three_db_at_half_the_beamwidth() {
        let p = SatPattern::Gaussian {
            hpbw_deg: 60.0,
            floor_db: -30.0,
        };
        assert!((p.relative_gain_db(30f64.to_radians(), RE + 5e5, RE) + 3.0).abs() < 1e-12);
        assert_eq!(p.relative_gain_db(0.0, RE + 5e5, RE), 0.0);
        assert_eq!(p.relative_gain_db(170f64.to_radians(), RE + 5e5, RE), -30.0);
    }

    #[test]
    fn patch_gain_rolls_off_toward_the_horizon() {
        let a = UserAntenna::default_patch();
        assert!((a.gain_dbi(90.0) - 3.0).abs() < 1e-12);
        assert!(a.gain_dbi(30.0) < a.gain_dbi(60.0));
        assert!((a.gain_dbi(10.0) + 5.37).abs() < 0.05);
        assert_eq!(a.gain_dbi(-5.0), -10.0);
    }

    #[test]
    fn polarisation_losses_have_their_textbook_limits() {
        use Polarisation::*;
        // Matched circular: no loss. Circular into linear: 3 dB. Opposite senses: floored.
        assert!(polarisation_loss_db(Rhcp, 0.0, Rhcp, 0.0) < 1e-9);
        assert!((polarisation_loss_db(Rhcp, 0.0, Linear, 0.0) - 3.0103).abs() < 1e-3);
        assert!(polarisation_loss_db(Rhcp, 0.0, Lhcp, 0.0) >= 39.9);
        // Linear to linear, aligned and crossed.
        assert!((polarisation_loss_factor(Linear, 0.0, Linear, 0.0, 0.0) - 1.0).abs() < 1e-9);
        assert!(
            polarisation_loss_factor(Linear, 0.0, Linear, 0.0, std::f64::consts::FRAC_PI_2) < 1e-9
        );
        // Axial ratios cost a fraction of a dB.
        let l = polarisation_loss_db(Rhcp, 1.0, Rhcp, 3.0);
        assert!(l > 0.0 && l < 0.5, "{l}");
    }
}
