// SPDX-License-Identifier: AGPL-3.0-only
//! Named LEO-PNT system presets: data, one system per file, each carrying its source.
//!
//! The engine is system-agnostic. Every capability of the `leo-pass` kind runs from bands and
//! orbits written directly into a scenario; a preset is only a convenient, cited starting point
//! that a scenario may name and override field by field. Each preset states where every number
//! came from ([`SourceKind`]):
//!
//! * **PUBLIC**: a published paper, interface document or regulatory record, with its URL.
//! * **REPRESENTATIVE**: a documented engineering choice for a system whose parameters are not
//!   public (or for a generic design); never a claim about a real system.
//! * **WORKSHOP**: parameters presented at the ESA NAVISP LEO-PNT workshop, 2026, with no public
//!   source yet. Only the Celeste IOD (in-orbit demonstration) preset uses them, and all of them
//!   live in `celeste_iod.rs`, so that file (with its one scenario and the three lines marked
//!   `WORKSHOP-PRESET` below and in `bundled_scenarios.rs`) can be withheld from a release
//!   without touching anything else.
//!
//! The ATOMIC "zero-clock" polynomial broadcast-ephemeris model is a navigation-message preset
//! and belongs with the navigation-message code, not here.

use super::antenna::{Polarisation, SatPattern};

pub mod centispace;
pub mod generic;
pub mod generic_c_band;
pub mod gnss_meo;
pub mod iridium;
pub mod starlink;
pub mod xona_pulsar;
// WORKSHOP-PRESET: delete this line (and the file) to withhold the Celeste IOD preset.
pub mod celeste_iod;

/// Where a preset's numbers come from.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SourceKind {
    /// Published, with a URL.
    Public,
    /// A documented representative choice, not a claim about a real system.
    Representative,
    /// Presented at the ESA NAVISP LEO-PNT workshop, 2026; no public source yet.
    Workshop,
}

impl SourceKind {
    /// The label written into reports.
    pub fn as_str(&self) -> &'static str {
        match self {
            SourceKind::Public => "PUBLIC",
            SourceKind::Representative => "REPRESENTATIVE",
            SourceKind::Workshop => "WORKSHOP",
        }
    }
}

/// A source statement.
#[derive(Clone, Copy, Debug)]
pub struct PresetSource {
    /// PUBLIC, REPRESENTATIVE or WORKSHOP.
    pub kind: SourceKind,
    /// Human-readable citation.
    pub citation: &'static str,
    /// URLs of the public sources (empty for a workshop-only or representative preset).
    pub urls: &'static [&'static str],
}

/// One transmitted band of a system.
#[derive(Clone, Copy, Debug)]
pub struct BandPreset {
    /// Band name, unique within the system.
    pub name: &'static str,
    /// Carrier centre frequency (Hz).
    pub centre_hz: f64,
    /// Transmitted bandwidth (Hz).
    pub tx_bandwidth_hz: f64,
    /// Ranging-code chip rate (chip/s).
    pub chip_rate_hz: f64,
    /// Primary code length (chips).
    pub code_length_chips: f64,
    /// Navigation data rate (bit/s).
    pub data_rate_bps: f64,
    /// Peak equivalent isotropically radiated power (dBW).
    pub eirp_dbw: f64,
    /// Transmit pattern relative to the peak.
    pub pattern: SatPattern,
    /// Transmit polarisation.
    pub polarisation: Polarisation,
    /// Transmit axial ratio (dB).
    pub axial_ratio_db: f64,
    /// Radio service allocation the band sits in.
    pub allocation: &'static str,
    /// Whether the signal supports code ranging (false: Doppler-only signal of opportunity).
    pub ranging: bool,
    /// Where each number of this band comes from.
    pub basis: &'static str,
}

/// One Walker shell of a system's constellation.
#[derive(Clone, Copy, Debug)]
pub struct ShellPreset {
    /// Altitude above the equatorial radius (km).
    pub altitude_km: f64,
    /// Inclination (deg); `None` for sun-synchronous at that altitude.
    pub inclination_deg: Option<f64>,
    /// Walker T.
    pub total: usize,
    /// Walker P.
    pub planes: usize,
    /// Walker F.
    pub phasing: usize,
    /// Nodes over 180° (star) instead of 360° (delta).
    pub star: bool,
}

/// A named system.
#[derive(Clone, Copy, Debug)]
pub struct SystemPreset {
    /// Identifier used in scenarios (`system = "..."`).
    pub id: &'static str,
    /// Display name.
    pub name: &'static str,
    /// Source of the numbers.
    pub source: PresetSource,
    /// Constellation shells (the first one is used for a single satellite's orbit).
    pub shells: &'static [ShellPreset],
    /// Where the orbit numbers come from.
    pub orbit_basis: &'static str,
    /// Transmitted bands.
    pub bands: &'static [BandPreset],
    /// Navigation-message bits a cold start must demodulate (for the IoT model).
    pub cold_start_bits: f64,
    /// Free-text notes.
    pub notes: &'static str,
}

impl SystemPreset {
    /// A band by name.
    pub fn band(&self, name: &str) -> Option<&'static BandPreset> {
        self.bands
            .iter()
            .find(|b| b.name.eq_ignore_ascii_case(name))
    }
}

/// Every preset compiled into this build.
pub fn all() -> Vec<&'static SystemPreset> {
    vec![
        &generic::PRESET,
        &generic_c_band::PRESET,
        &xona_pulsar::PRESET,
        &iridium::PRESET,
        &starlink::PRESET,
        &centispace::PRESET,
        // WORKSHOP-PRESET: delete this line with celeste_iod.rs.
        &celeste_iod::PRESET,
    ]
}

/// A preset by identifier (case-insensitive).
pub fn by_id(id: &str) -> Option<&'static SystemPreset> {
    all().into_iter().find(|p| p.id.eq_ignore_ascii_case(id))
}

/// Free-space loss (dB) between isotropic antennas, for deriving an EIRP from a published
/// received power in the preset files.
pub fn fspl_db(range_m: f64, f_hz: f64) -> f64 {
    crate::linkbudget::free_space_loss_db(range_m, f_hz)
}

/// Slant range (m) from a user on the equatorial-radius sphere to a satellite at `alt_m`,
/// seen at elevation `el_deg`.
pub fn slant_range_m(alt_m: f64, el_deg: f64) -> f64 {
    let re = super::RE_EARTH;
    let e = el_deg.to_radians();
    ((re + alt_m).powi(2) - (re * e.cos()).powi(2)).sqrt() - re * e.sin()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_preset_is_sourced_and_self_consistent() {
        let presets = all();
        let mut ids: Vec<&str> = presets.iter().map(|p| p.id).collect();
        ids.sort_unstable();
        ids.dedup();
        assert_eq!(ids.len(), presets.len(), "duplicate preset ids");
        for p in presets {
            assert!(!p.citation_is_empty(), "{} has no citation", p.id);
            if p.source.kind == SourceKind::Public {
                assert!(
                    !p.source.urls.is_empty(),
                    "{} is PUBLIC without a URL",
                    p.id
                );
            }
            assert!(!p.bands.is_empty() && !p.shells.is_empty(), "{}", p.id);
            for b in p.bands {
                assert!(
                    b.centre_hz > 1e8 && b.eirp_dbw.is_finite(),
                    "{}/{}",
                    p.id,
                    b.name
                );
                assert!(!b.basis.is_empty(), "{}/{} has no basis", p.id, b.name);
            }
        }
    }

    #[test]
    fn only_the_celeste_preset_is_sourced_from_the_workshop() {
        for p in all() {
            if p.source.kind == SourceKind::Workshop {
                assert_eq!(p.id, "celeste-iod");
            }
        }
    }

    impl SystemPreset {
        fn citation_is_empty(&self) -> bool {
            self.source.citation.trim().is_empty()
        }
    }
}
