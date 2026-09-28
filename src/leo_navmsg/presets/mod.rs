// SPDX-License-Identifier: AGPL-3.0-only
//! Named presets for the `leo-navmsg` kind: an orbit, a carrier and, where one is
//! published, a message model and cadence. Presets are data; the engine runs with none of
//! them. Each lives in its own file with its sources, marked PUBLIC (a URL) or WORKSHOP
//! (presented at the ESA Navigation Innovation and Support Programme (NAVISP) LEO
//! positioning, navigation and timing (PNT) workshop, 2026).
//!
//! **To withhold the workshop-derived preset** from a release, delete `celeste_iod.rs` and
//! `scenarios/leo-navmsg-celeste-iod.toml`, then remove the four lines that name them:
//! `mod celeste_iod;`, its push in [`all`] and its arm in [`csv_schema`] below, and its line
//! in `src/bundled_scenarios.rs`. Every other capability, test and bundled scenario runs
//! without it.

use serde::Serialize;

mod atomic;
mod cband_generic;
mod centispace;
mod iridium;
mod starlink;
mod xona_pulsar;
// Workshop-derived: remove this line, the entry in `all()`, and the file to withhold it.
mod celeste_iod;

/// Where a preset's numbers come from.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum SourceKind {
    /// A public document, cited by URL.
    Public,
    /// Presented at the ESA NAVISP LEO-PNT workshop, 2026 (no public source).
    Workshop,
    /// Representative values for a system whose parameters are not public, labelled so.
    Representative,
}

/// Message-model defaults a preset carries.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct MessageDefaults {
    /// Ephemeris model code.
    pub model: &'static str,
    /// Correction-polynomial degrees `[along, cross, radial]` (kepler-rac).
    pub rac_degrees: [usize; 3],
    /// ECEF polynomial degree (ecef-poly).
    pub poly_degree: usize,
    /// Fit interval (s).
    pub fit_interval_s: f64,
    /// Message update period (s).
    pub update_period_s: f64,
    /// Whether the message carries no clock (the clock is steered on board).
    pub zero_clock: bool,
    /// One-sigma steering residual of a zero-clock satellite (m, times c).
    pub steered_sigma_m: f64,
}

/// One preset.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct Preset {
    /// Key used in a scenario (`preset = "…"`).
    pub key: &'static str,
    /// Display name.
    pub name: &'static str,
    /// Source class.
    pub source: SourceKind,
    /// Source URLs (empty for a workshop-only figure).
    pub source_urls: &'static [&'static str],
    /// Orbit altitude (km).
    pub altitude_km: f64,
    /// Orbit inclination (deg).
    pub inclination_deg: f64,
    /// Carrier the ionospheric service is scaled to (Hz).
    pub carrier_hz: f64,
    /// What the carrier is.
    pub carrier_label: &'static str,
    /// Message model and cadence, where the system publishes one; `None` when it does not
    /// (the scenario's own `[message]` settings, or Kshana's defaults, then apply).
    pub message: Option<MessageDefaults>,
    /// Notes on what is and is not known.
    pub notes: &'static str,
}

/// Every preset.
pub fn all() -> Vec<Preset> {
    let mut v = vec![
        xona_pulsar::PULSAR,
        xona_pulsar::PULSAR_0,
        iridium::IRIDIUM,
        starlink::STARLINK,
        centispace::CENTISPACE,
        cband_generic::CBAND,
        atomic::ATOMIC,
    ];
    v.push(celeste_iod::CELESTE_IOD);
    v
}

/// A preset by key.
pub fn by_key(key: &str) -> Option<Preset> {
    all().into_iter().find(|p| p.key == key)
}

/// Named CSV column schemas that presets supply (key, headers).
pub fn csv_schema(name: &str) -> Option<crate::leo_navmsg::text::CsvSchema> {
    match name {
        "celeste-iod" => Some(celeste_iod::csv_schema()),
        _ => None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_preset_names_its_source() {
        let all = all();
        let mut keys: Vec<&str> = all.iter().map(|p| p.key).collect();
        keys.sort_unstable();
        keys.dedup();
        assert_eq!(keys.len(), all.len(), "duplicate preset key");
        for p in &all {
            match p.source {
                SourceKind::Public => assert!(
                    p.source_urls.iter().all(|u| u.starts_with("https://"))
                        && !p.source_urls.is_empty(),
                    "{} is PUBLIC and must cite a URL",
                    p.key
                ),
                SourceKind::Workshop | SourceKind::Representative => {
                    assert!(!p.notes.is_empty(), "{} must explain its numbers", p.key)
                }
            }
            assert!(p.altitude_km > 150.0 && p.altitude_km < 2500.0, "{}", p.key);
            assert!(p.carrier_hz > 1e8, "{}", p.key);
        }
    }
}
