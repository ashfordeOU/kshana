// SPDX-License-Identifier: AGPL-3.0-only
//! Named LEO positioning, navigation and timing (PNT) systems as **data**.
//!
//! The engine is generic: a constellation is a list of Walker shells, a signal is a carrier,
//! a modulation, a chip rate and a received-power or carrier-to-noise density (C/N0) range,
//! and an error budget is a signal-in-space range error (SISRE). A preset fills those inputs
//! for one system. Each preset lives in its **own file** with its sources, and each source is
//! marked [`SourceKind::Public`] (a URL anyone can read) or [`SourceKind::Workshop`]
//! (parameters presented at the ESA Navigation Innovation and Support Programme (NAVISP)
//! LEO-PNT workshop, 2026). Parameters that no source states are listed in the preset's
//! `representative` field and must be read as illustrative.
//!
//! | id | file | sources |
//! |---|---|---|
//! | `xona-pulsar` | `xona_pulsar.rs` | public |
//! | `iridium-stl` | `iridium_stl.rs` | public |
//! | `starlink-sop` | `starlink_sop.rs` | public |
//! | `centispace` | `centispace.rs` | public |
//! | `generic-c-band` | `generic_cband.rs` | representative, one public allocation |
//! | `atomic-zero-clock` | `atomic_zero_clock.rs` | public (ephemeris and clock model only) |
//! | `celeste-iod` | `celeste_iod.rs` | public orbit, workshop signal parameters |
//!
//! ## Withholding the workshop preset
//!
//! Every workshop-derived number sits in `celeste_iod.rs` and in the one scenario that uses
//! it, `scenarios/celeste-iod-fused-pvt.toml`. To publish without it: delete those two files,
//! the `mod celeste_iod;` line and the `&celeste_iod::PRESET` entry below, and the scenario's
//! line in `src/bundled_scenarios.rs`. No other code, test or scenario refers to it (a
//! source-text test in this module enforces that).

mod atomic_zero_clock;
mod celeste_iod;
mod centispace;
mod generic_cband;
mod iridium_stl;
mod starlink_sop;
mod xona_pulsar;

use serde::Serialize;

/// Whether a source can be read by anyone.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum SourceKind {
    /// A public document with a URL.
    Public,
    /// Presented at the ESA NAVISP LEO-PNT workshop, 2026 (no public document).
    Workshop,
    /// A value computed from other stated values (the derivation is in the note).
    Derived,
}

/// One source of a preset.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct PresetSource {
    /// Public, workshop or derived.
    pub kind: SourceKind,
    /// What the source is and what it supports.
    pub citation: &'static str,
    /// URL of a public source.
    pub url: Option<&'static str>,
}

/// One Walker shell of a preset constellation.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct PresetShell {
    /// `delta` (nodes over 360 deg) or `star` (over 180 deg).
    pub pattern: &'static str,
    /// Satellites in the shell (Walker T).
    pub total: usize,
    /// Planes (Walker P).
    pub planes: usize,
    /// Phasing (Walker F).
    pub phasing: usize,
    /// Altitude (km).
    pub altitude_km: f64,
    /// Inclination (deg).
    pub inclination_deg: f64,
}

/// One signal of a preset.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct PresetSignal {
    /// Signal name within the system.
    pub name: &'static str,
    /// Carrier frequency (Hz).
    pub carrier_hz: f64,
    /// Modulation as the source states it.
    pub modulation: &'static str,
    /// Ranging code chip rate (chip/s); `None` for a signal used for Doppler only.
    pub chip_rate_hz: Option<f64>,
    /// Occupied or transmitted bandwidth (Hz).
    pub bandwidth_hz: f64,
    /// Received power range at the user antenna, minimum and maximum (dBW).
    pub rx_power_dbw: Option<(f64, f64)>,
    /// C/N0 range, low and high (dB-Hz), when a source states it directly.
    pub cn0_dbhz: Option<(f64, f64)>,
}

/// A named LEO PNT system.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct LeoPreset {
    /// Identifier used in scenarios.
    pub id: &'static str,
    /// Display name.
    pub name: &'static str,
    /// One-line description.
    pub summary: &'static str,
    /// Sources, each marked public, workshop or derived.
    pub sources: &'static [PresetSource],
    /// Parameters no source states, filled with representative values.
    pub representative: &'static [&'static str],
    /// Constellation shells (empty for an ephemeris-and-clock model preset).
    pub shells: &'static [PresetShell],
    /// Signals; the first is the default.
    pub signals: &'static [PresetSignal],
    /// Doppler-only system (no usable code or carrier-phase ranging).
    pub doppler_only: bool,
    /// One-sigma Doppler measurement error (Hz), when a source states it.
    pub sigma_doppler_hz: Option<f64>,
    /// One-sigma signal-in-space range error of orbit and clock (m).
    pub sisre_m: f64,
    /// The broadcast ephemeris model.
    pub ephemeris_model: &'static str,
    /// The satellite clock model.
    pub clock_model: &'static str,
}

impl LeoPreset {
    /// The signal of that name (case-insensitive), or the first signal when `name` is `None`.
    pub fn signal(&self, name: Option<&str>) -> Result<&'static PresetSignal, String> {
        match name {
            None => self
                .signals
                .first()
                .ok_or_else(|| format!("preset {} carries no signal", self.id)),
            Some(n) => self
                .signals
                .iter()
                .find(|s| s.name.eq_ignore_ascii_case(n))
                .ok_or_else(|| {
                    format!(
                        "preset {} has no signal {n:?}; it has {:?}",
                        self.id,
                        self.signals.iter().map(|s| s.name).collect::<Vec<_>>()
                    )
                }),
        }
    }

    /// Whether any source is a workshop source.
    pub fn uses_workshop_material(&self) -> bool {
        self.sources.iter().any(|s| s.kind == SourceKind::Workshop)
    }
}

/// Every preset, in a fixed order.
pub fn all() -> Vec<&'static LeoPreset> {
    vec![
        &xona_pulsar::PRESET,
        &iridium_stl::PRESET,
        &starlink_sop::PRESET,
        &centispace::PRESET,
        &generic_cband::PRESET,
        &atomic_zero_clock::PRESET,
        &celeste_iod::PRESET,
    ]
}

/// The preset with that id (case-insensitive).
pub fn by_id(id: &str) -> Result<&'static LeoPreset, String> {
    all()
        .into_iter()
        .find(|p| p.id.eq_ignore_ascii_case(id.trim()))
        .ok_or_else(|| {
            format!(
                "unknown LEO preset {id:?}; known: {:?}",
                all().iter().map(|p| p.id).collect::<Vec<_>>()
            )
        })
}

/// Thermal noise density `k T` for a system noise temperature (dBW/Hz).
pub fn noise_density_dbw_hz(t_sys_k: f64) -> f64 {
    10.0 * (1.380_649e-23 * t_sys_k).log10()
}

/// The C/N0 range of a signal (dB-Hz), low and high: stated directly when the source does,
/// otherwise the received power over `k T_sys` with a 0 dBi user antenna.
pub fn cn0_range_dbhz(sig: &PresetSignal, t_sys_k: f64) -> Option<(f64, f64)> {
    sig.cn0_dbhz.or_else(|| {
        sig.rx_power_dbw.map(|(lo, hi)| {
            let n0 = noise_density_dbw_hz(t_sys_k);
            (lo - n0, hi - n0)
        })
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_preset_has_a_source_and_every_public_source_a_url() {
        for p in all() {
            assert!(!p.sources.is_empty(), "{}", p.id);
            for s in p.sources {
                if s.kind == SourceKind::Public {
                    assert!(
                        s.url.is_some_and(|u| u.starts_with("https://")),
                        "{}: {}",
                        p.id,
                        s.citation
                    );
                }
            }
            for sig in p.signals {
                assert!(sig.carrier_hz > 1e8 && sig.bandwidth_hz > 0.0, "{}", p.id);
            }
            for sh in p.shells {
                assert!(sh.total % sh.planes == 0, "{}", p.id);
                assert!(sh.altitude_km > 150.0 && sh.altitude_km < 2000.0);
            }
            assert!(p.sisre_m > 0.0);
        }
        assert!(by_id("XONA-PULSAR").is_ok());
        assert!(by_id("galileo").is_err());
    }

    #[test]
    fn only_one_preset_uses_workshop_material() {
        for p in all() {
            assert_eq!(
                p.uses_workshop_material(),
                p.id == "celeste-iod",
                "{}",
                p.id
            );
        }
    }

    /// The workshop preset must be removable by deleting its file and the scenario that
    /// uses it: no other source file of the pack and no other scenario may name it.
    #[test]
    fn nothing_else_refers_to_the_workshop_preset() {
        let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
        let mut offenders = Vec::new();
        for dir in ["src", "scenarios", "tests"] {
            let mut stack = vec![root.join(dir)];
            while let Some(d) = stack.pop() {
                for e in std::fs::read_dir(&d).unwrap().flatten() {
                    let p = e.path();
                    if p.is_dir() {
                        stack.push(p);
                        continue;
                    }
                    let rel = p
                        .strip_prefix(root)
                        .unwrap()
                        .to_string_lossy()
                        .replace('\\', "/");
                    let allowed = [
                        "src/leo_fusion/presets/celeste_iod.rs",
                        "src/leo_fusion/presets/mod.rs",
                        "scenarios/celeste-iod-fused-pvt.toml",
                        "src/bundled_scenarios.rs",
                    ];
                    if allowed.contains(&rel.as_str()) {
                        continue;
                    }
                    let Ok(text) = std::fs::read_to_string(&p) else {
                        continue;
                    };
                    if text.contains("celeste-iod") || text.contains("celeste_iod") {
                        offenders.push(rel);
                    }
                }
            }
        }
        assert!(
            offenders.is_empty(),
            "files naming the workshop preset: {offenders:?}"
        );
    }

    #[test]
    fn noise_density_at_290_k_is_minus_204_dbw_per_hz() {
        assert!((noise_density_dbw_hz(290.0) + 203.975).abs() < 1e-3);
    }
}
