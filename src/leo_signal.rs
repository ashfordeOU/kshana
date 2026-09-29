// SPDX-License-Identifier: AGPL-3.0-only
//! **Low Earth orbit (LEO) positioning, navigation and timing (PNT) signal designs: a
//! parameterised signal library, band-limited spectra, code-tracking and acquisition
//! performance, compatibility with GNSS, and a band trade from UHF to C band.**
//!
//! A LEO-PNT signal is not one thing. Every system in orbit or in preparation picks its
//! own band, modulation, component structure and power split, and a system's own later
//! phases change them again. So nothing here is hard-coded to one system: a signal is a
//! [`SignalDesign`], data that any scenario can write inline or take from a preset file.
//!
//! ## A signal design
//!
//! * **Band:** centre frequency, transmit bandwidth (the spectrum is zero outside it) and
//!   the International Telecommunication Union (ITU) service allocation it sits in:
//!   Radio Navigation Satellite Service (RNSS), Radio Determination Satellite Service
//!   (RDSS), Mobile Satellite Service (MSS), Earth Exploration-Satellite Service (EESS), a
//!   non-RNSS band, or other.
//! * **Components:** any subset of an acquisition component (short, low-rate, easy to
//!   find), a data component (carries the navigation message) and a pilot component (no
//!   data, used for ranging). Each has a modulation (binary phase-shift keying BPSK(n) at
//!   `n × 1.023` Mchip/s, `n` may be a fraction; sine binary offset carrier BOC(m,n);
//!   multiplexed BOC; or a flat spectrum for an orthogonal frequency-division
//!   multiplexing (OFDM) beacon), a share of the power, optional frequency-division
//!   multiple access (FDMA) sub-carrier offsets, a code length and a data rate.
//!
//! ## What is computed for each signal
//!
//! * the band-limited power spectral density (PSD) and the fraction of each component's
//!   power the transmit band passes;
//! * the RMS (Gabor) bandwidth of the tracked component inside the band;
//! * the delay lock loop (DLL) thermal-noise code jitter against carrier-to-noise density
//!   ratio (C/N₀) and early-late correlator spacing, with the band-limited coherent
//!   early-late formula of Betz & Kolodziejski (2009) ([`crate::navsignal::dll_jitter_bandlimited_s`]),
//!   and the ranging accuracy in metres;
//! * the acquisition search space (Doppler bins × code bins) from the orbit's maximum
//!   Doppler, the detection probability of a square-law detector, and the mean
//!   acquisition time of a serial and a code-parallel search;
//! * the spectral separation coefficient (SSC) of the signal into GPS L1 C/A, Galileo E1,
//!   GPS L5, Galileo E5a, E5b and the E5 AltBOC signal, and of each GNSS signal into it,
//!   with the C/N₀ degradation each causes;
//! * the jammer-to-signal ratio (J/S) each jammer type may reach before the tracked
//!   component falls below the tracking threshold, from the `spectrum` kind's own SSC
//!   machinery ([`crate::spectrum::Jammer::ssc`]);
//! * a band trade: first-order ionospheric delay (∝ 1/f²), free-space loss, ranging
//!   accuracy at equal C/N₀ and at equal radiated power, and jammer tolerance.
//!
//! ## Presets
//!
//! Public presets live one per file under `data/leo-signals/`, each with its source URL,
//! and are compiled in ([`PRESET_FILES`]). None of them depends on any other; every
//! scenario, test and oracle of this module runs with only these public files.
//! Where a parameter is not published, the preset says so and labels its value
//! REPRESENTATIVE.
//!
//! ## Honest scope
//!
//! The transmit filter is an ideal brick wall; enhanced Feher quadrature phase-shift
//! keying (EFQPSK), code shift keying and OFDM spectra are approximated (a rectangular
//! chip envelope, a flat band); spreading-code line structure and multiple-access
//! cross-correlation are not modelled; the Doppler bound ignores Earth rotation; the
//! ionospheric delay is first order for a slant total electron content (TEC) the caller
//! supplies (a LEO satellite sees only the part of the ionosphere below it).

use crate::navsignal::{
    bpsk_gabor_bandwidth_closed_form_hz, bpsk_power_in_band_closed_form, dll_jitter_bandlimited_s,
    dll_jitter_small_spacing_limit_s, panels_for, parse_modulation, simpson, EarlyLate, Modulation,
    C_LIGHT_M_PER_S, F0_HZ,
};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::f64::consts::PI;

/// Earth's gravitational parameter (m³/s², the IERS/EGM value used across the crate).
const MU_EARTH: f64 = crate::forces::MU_EARTH;
/// Earth's equatorial radius (m, WGS-84).
const R_EARTH_M: f64 = crate::frames::WGS84_A;
/// First-order ionospheric group-delay constant (m·Hz²·m²/electron): `d = 40.3·TEC/f²`.
pub const IONO_K: f64 = 40.3;
/// One TEC unit (electrons/m²).
pub const TECU: f64 = 1e16;

// ───────────────────────────── vocabulary ─────────────────────────────

/// The ITU service allocation a signal's band sits in.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Allocation {
    /// Radio Navigation Satellite Service.
    Rnss,
    /// Radio Determination Satellite Service.
    Rdss,
    /// Mobile Satellite Service.
    Mss,
    /// Earth Exploration-Satellite Service.
    Eess,
    /// A band not allocated to RNSS (for example an extended C band).
    NonRnss,
    /// Any other service (for example a fixed-satellite downlink used as a signal of
    /// opportunity).
    Other,
}

impl Allocation {
    /// Stable label.
    pub fn as_str(self) -> &'static str {
        match self {
            Allocation::Rnss => "rnss",
            Allocation::Rdss => "rdss",
            Allocation::Mss => "mss",
            Allocation::Eess => "eess",
            Allocation::NonRnss => "non-rnss",
            Allocation::Other => "other",
        }
    }
}

/// A component's job in the signal.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Role {
    /// Low-complexity acquisition aid.
    Acquisition,
    /// Carries the navigation message.
    Data,
    /// Data-free, for ranging.
    Pilot,
}

impl Role {
    /// The role's lowercase name.
    pub fn as_str(self) -> &'static str {
        match self {
            Role::Acquisition => "acquisition",
            Role::Data => "data",
            Role::Pilot => "pilot",
        }
    }
}

/// Where a preset's numbers come from.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "UPPERCASE")]
pub enum SourceClass {
    /// A public document, cited by URL.
    Public,
    /// Parameters presented at a workshop, cleared for use, with no public document.
    Workshop,
    /// Not published: a representative value chosen for the trade, labelled as such.
    Representative,
}

impl SourceClass {
    fn as_str(self) -> &'static str {
        match self {
            SourceClass::Public => "PUBLIC",
            SourceClass::Workshop => "WORKSHOP",
            SourceClass::Representative => "REPRESENTATIVE",
        }
    }
}

/// A component's spectrum shape.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Shape {
    /// A spreading modulation with a unit-area closed-form PSD.
    Mod(Modulation),
    /// A flat spectrum of this width (Hz), the envelope of an OFDM beacon.
    Flat {
        /// Occupied bandwidth (Hz).
        bandwidth_hz: f64,
    },
}

impl Shape {
    /// Parse `BPSK(n)`, `BOC(m,n)`, `MBOC(6,1,p)` or `FLAT(<MHz>)`.
    pub fn parse(label: &str) -> Result<Shape, String> {
        let t = label.trim().to_ascii_uppercase().replace(' ', "");
        if let Some(rest) = t.strip_prefix("FLAT(") {
            let mhz: f64 = rest
                .strip_suffix(')')
                .and_then(|v| v.parse().ok())
                .ok_or_else(|| format!("modulation {label:?}: expected FLAT(<MHz>)"))?;
            if !(mhz.is_finite() && mhz > 0.0) {
                return Err(format!("modulation {label:?}: the width must be positive"));
            }
            return Ok(Shape::Flat {
                bandwidth_hz: mhz * 1e6,
            });
        }
        parse_modulation(label).map(Shape::Mod)
    }

    /// Unit-area PSD (1/Hz) at offset `f_hz`.
    pub fn psd(&self, f_hz: f64) -> f64 {
        match *self {
            Shape::Mod(m) => m.psd(f_hz),
            Shape::Flat { bandwidth_hz } => {
                if f_hz.abs() <= bandwidth_hz / 2.0 {
                    1.0 / bandwidth_hz
                } else {
                    0.0
                }
            }
        }
    }

    /// Chip rate (Hz); `None` for a flat (OFDM-like) spectrum.
    pub fn chip_rate_hz(&self) -> Option<f64> {
        match *self {
            Shape::Mod(m) => Some(m.chip_rate_hz()),
            Shape::Flat { .. } => None,
        }
    }

    /// The narrowest spectral feature (Hz), which sets the integration resolution.
    pub fn lobe_hz(&self) -> f64 {
        match *self {
            Shape::Mod(Modulation::BocSin { m, n }) => m.min(n) * F0_HZ,
            Shape::Mod(Modulation::Mboc { .. }) => F0_HZ,
            Shape::Mod(m) => m.chip_rate_hz(),
            Shape::Flat { bandwidth_hz } => bandwidth_hz / 4.0,
        }
    }

    /// Label, e.g. `BPSK(10)` or `FLAT(240 MHz)`.
    pub fn label(&self) -> String {
        match *self {
            Shape::Mod(m) => m.label(),
            Shape::Flat { bandwidth_hz } => format!("FLAT({} MHz)", bandwidth_hz / 1e6),
        }
    }
}

// ───────────────────────────── configuration ─────────────────────────────

fn one() -> f64 {
    1.0
}
fn yes() -> bool {
    true
}

/// A component as written in a preset file or a scenario.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ComponentCfg {
    /// `acquisition`, `data` or `pilot`.
    pub role: Role,
    /// `BPSK(n)`, `BOC(m,n)`, `MBOC(6,1,p)` or `FLAT(<MHz>)`.
    pub modulation: String,
    /// Share of the signal's unfiltered power (the shares of a signal sum to one).
    #[serde(default = "one")]
    pub power_fraction: f64,
    /// FDMA sub-carrier offsets from the band centre (MHz); empty means one carrier at
    /// the centre.
    #[serde(default)]
    pub fdma_offsets_mhz: Vec<f64>,
    /// Power shares of the sub-carriers (default equal); sum to one.
    #[serde(default)]
    pub fdma_shares: Vec<f64>,
    /// Spreading-code length (chips).
    #[serde(default)]
    pub code_length_chips: Option<u64>,
    /// Data rate (symbols/s).
    #[serde(default)]
    pub data_rate_sps: Option<f64>,
    /// Where the component's numbers come from, when it differs from the signal's.
    #[serde(default)]
    pub note: Option<String>,
}

/// A signal as written in a preset file or a scenario.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SignalCfg {
    /// Stable identifier, e.g. `xona-x5`.
    pub name: String,
    /// System, e.g. `Xona Pulsar`.
    #[serde(default)]
    pub system: Option<String>,
    /// PUBLIC, WORKSHOP or REPRESENTATIVE.
    pub source: SourceClass,
    /// URL or citation.
    #[serde(default)]
    pub source_ref: Option<String>,
    /// Centre frequency (MHz).
    pub centre_mhz: f64,
    /// Transmit bandwidth (MHz, double-sided).
    pub tx_bandwidth_mhz: f64,
    /// ITU allocation.
    pub allocation: Allocation,
    /// Reference (minimum) received power at the user antenna (dBW), in band.
    #[serde(default)]
    pub received_power_dbw: Option<f64>,
    /// Maximum received power (dBW), when published.
    #[serde(default)]
    pub received_power_max_dbw: Option<f64>,
    /// Orbit altitude of the constellation (km), for the Doppler bound.
    #[serde(default)]
    pub orbit_altitude_km: Option<f64>,
    /// `false` for a signal used for Doppler (or timing) only, with no code ranging.
    #[serde(default = "yes")]
    pub ranging: bool,
    /// Free-text notes: what is published, what is assumed.
    #[serde(default)]
    pub notes: Option<String>,
    /// Components.
    pub components: Vec<ComponentCfg>,
}

/// A preset file's header.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PresetMeta {
    /// Preset name, e.g. `xona-pulsar`.
    pub name: String,
    /// Human title.
    pub title: String,
    /// PUBLIC or REPRESENTATIVE for a compiled-in preset.
    pub source: SourceClass,
    /// Source URL.
    pub url: String,
    /// Notes.
    #[serde(default)]
    pub notes: Option<String>,
}

/// A preset file: a header and its signals.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PresetFile {
    /// Header.
    pub preset: PresetMeta,
    /// Signals.
    pub signals: Vec<SignalCfg>,
}

/// The compiled-in public presets: `(name, TOML text)`, one file each under
/// `data/leo-signals/`.
pub const PRESET_FILES: &[(&str, &str)] = &[
    (
        "xona-pulsar",
        include_str!("../data/leo-signals/xona-pulsar.toml"),
    ),
    (
        "iridium-stl",
        include_str!("../data/leo-signals/iridium-stl.toml"),
    ),
    (
        "starlink-soo",
        include_str!("../data/leo-signals/starlink-soo.toml"),
    ),
    (
        "centispace",
        include_str!("../data/leo-signals/centispace.toml"),
    ),
    (
        "generic-c-band",
        include_str!("../data/leo-signals/generic-c-band.toml"),
    ),
    (
        "generic-bands",
        include_str!("../data/leo-signals/generic-bands.toml"),
    ),
];

/// Parse a compiled-in preset by name.
pub fn preset(name: &str) -> Result<PresetFile, String> {
    let (_, text) = PRESET_FILES
        .iter()
        .find(|(n, _)| *n == name)
        .ok_or_else(|| {
            format!(
                "unknown signal preset {name:?}: the library has {}",
                preset_names().join(", ")
            )
        })?;
    let p: PresetFile =
        toml::from_str(text).map_err(|e| format!("preset {name}: invalid preset file: {e}"))?;
    if p.preset.name != name {
        return Err(format!(
            "preset file {name} names itself {:?}",
            p.preset.name
        ));
    }
    Ok(p)
}

/// Names of the compiled-in presets.
pub fn preset_names() -> Vec<&'static str> {
    PRESET_FILES.iter().map(|(n, _)| *n).collect()
}

/// A signal from any compiled-in preset, by signal name.
pub fn public_signal(name: &str) -> Option<SignalDesign> {
    PRESET_FILES.iter().find_map(|(p, _)| {
        preset(p).ok().and_then(|f| {
            f.signals
                .iter()
                .find(|s| s.name == name)
                .and_then(|s| SignalDesign::from_cfg(s).ok())
        })
    })
}

/// Every signal name across the compiled-in presets.
pub fn public_signal_names() -> Vec<String> {
    PRESET_FILES
        .iter()
        .filter_map(|(p, _)| preset(p).ok())
        .flat_map(|f| f.signals.into_iter().map(|s| s.name))
        .collect()
}

// ───────────────────────────── resolved designs ─────────────────────────────

/// A resolved component.
#[derive(Clone, Debug, PartialEq)]
pub struct Component {
    /// Role.
    pub role: Role,
    /// Spectrum shape.
    pub shape: Shape,
    /// Share of the unfiltered power.
    pub share: f64,
    /// Sub-carriers: `(offset Hz, weight)`, weights summing to one.
    pub carriers: Vec<(f64, f64)>,
    /// Code length (chips).
    pub code_length_chips: Option<u64>,
    /// Data rate (symbols/s).
    pub data_rate_sps: Option<f64>,
    /// Note.
    pub note: Option<String>,
}

impl Component {
    /// Unfiltered unit-area PSD at offset `f` from the band centre (all sub-carriers).
    pub fn psd(&self, f: f64) -> f64 {
        self.carriers
            .iter()
            .map(|(o, w)| w * self.shape.psd(f - o))
            .sum()
    }

    /// Fraction of this component's power inside `|f| ≤ band/2` about the band centre.
    pub fn in_band_fraction(&self, band_hz: f64) -> f64 {
        let half = band_hz / 2.0;
        self.carriers
            .iter()
            .map(|(o, w)| {
                w * match self.shape {
                    Shape::Flat { bandwidth_hz } => {
                        let (a, b) = (o - bandwidth_hz / 2.0, o + bandwidth_hz / 2.0);
                        (b.min(half) - a.max(-half)).max(0.0) / bandwidth_hz
                    }
                    Shape::Mod(m) => simpson(
                        -half - o,
                        half - o,
                        panels_for(band_hz, self.shape.lobe_hz()),
                        |f| m.psd(f),
                    ),
                }
            })
            .sum()
    }
}

/// A resolved signal design.
#[derive(Clone, Debug, PartialEq)]
pub struct SignalDesign {
    /// Identifier.
    pub name: String,
    /// System.
    pub system: Option<String>,
    /// Source class.
    pub source: SourceClass,
    /// Source reference.
    pub source_ref: Option<String>,
    /// Centre frequency (Hz).
    pub centre_hz: f64,
    /// Transmit bandwidth (Hz).
    pub tx_bandwidth_hz: f64,
    /// Allocation.
    pub allocation: Allocation,
    /// Reference received power (dBW).
    pub received_power_dbw: Option<f64>,
    /// Maximum received power (dBW).
    pub received_power_max_dbw: Option<f64>,
    /// Orbit altitude (m).
    pub orbit_altitude_m: Option<f64>,
    /// Code ranging available.
    pub ranging: bool,
    /// Notes.
    pub notes: Option<String>,
    /// Components.
    pub components: Vec<Component>,
}

impl SignalDesign {
    /// Resolve and validate a configuration.
    pub fn from_cfg(c: &SignalCfg) -> Result<SignalDesign, String> {
        let name = &c.name;
        if !(c.centre_mhz.is_finite() && c.centre_mhz > 0.0) {
            return Err(format!("{name}: centre_mhz must be positive"));
        }
        if !(c.tx_bandwidth_mhz.is_finite() && c.tx_bandwidth_mhz > 0.0) {
            return Err(format!("{name}: tx_bandwidth_mhz must be positive"));
        }
        if c.components.is_empty() {
            return Err(format!("{name}: a signal needs at least one component"));
        }
        let mut comps = Vec::new();
        let mut total = 0.0;
        for (i, k) in c.components.iter().enumerate() {
            let shape = Shape::parse(&k.modulation).map_err(|e| format!("{name}: {e}"))?;
            if !(k.power_fraction.is_finite() && k.power_fraction > 0.0) {
                return Err(format!(
                    "{name}: component {} power_fraction must be positive",
                    i + 1
                ));
            }
            total += k.power_fraction;
            let carriers = if k.fdma_offsets_mhz.is_empty() {
                if !k.fdma_shares.is_empty() {
                    return Err(format!(
                        "{name}: component {} has fdma_shares but no fdma_offsets_mhz",
                        i + 1
                    ));
                }
                vec![(0.0, 1.0)]
            } else {
                let n = k.fdma_offsets_mhz.len();
                let shares = if k.fdma_shares.is_empty() {
                    vec![1.0 / n as f64; n]
                } else if k.fdma_shares.len() == n {
                    let s: f64 = k.fdma_shares.iter().sum();
                    if (s - 1.0).abs() > 1e-6 || k.fdma_shares.iter().any(|v| *v <= 0.0) {
                        return Err(format!(
                            "{name}: component {} fdma_shares must be positive and sum to one",
                            i + 1
                        ));
                    }
                    k.fdma_shares.clone()
                } else {
                    return Err(format!(
                        "{name}: component {} needs one fdma_share per offset",
                        i + 1
                    ));
                };
                k.fdma_offsets_mhz
                    .iter()
                    .zip(shares)
                    .map(|(o, w)| (o * 1e6, w))
                    .collect()
            };
            if let Some(r) = k.data_rate_sps {
                if !(r.is_finite() && r > 0.0) {
                    return Err(format!("{name}: data_rate_sps must be positive"));
                }
            }
            if k.code_length_chips == Some(0) {
                return Err(format!("{name}: code_length_chips must be positive"));
            }
            comps.push(Component {
                role: k.role,
                shape,
                share: k.power_fraction,
                carriers,
                code_length_chips: k.code_length_chips,
                data_rate_sps: k.data_rate_sps,
                note: k.note.clone(),
            });
        }
        if (total - 1.0).abs() > 1e-6 {
            return Err(format!(
                "{name}: component power fractions sum to {total}, not 1"
            ));
        }
        if let Some(h) = c.orbit_altitude_km {
            if !(h.is_finite() && h > 0.0) {
                return Err(format!("{name}: orbit_altitude_km must be positive"));
            }
        }
        Ok(SignalDesign {
            name: c.name.clone(),
            system: c.system.clone(),
            source: c.source,
            source_ref: c.source_ref.clone(),
            centre_hz: c.centre_mhz * 1e6,
            tx_bandwidth_hz: c.tx_bandwidth_mhz * 1e6,
            allocation: c.allocation,
            received_power_dbw: c.received_power_dbw,
            received_power_max_dbw: c.received_power_max_dbw,
            orbit_altitude_m: c.orbit_altitude_km.map(|h| h * 1e3),
            ranging: c.ranging,
            notes: c.notes.clone(),
            components: comps,
        })
    }

    /// The narrowest spectral feature over every component (Hz).
    pub fn lobe_hz(&self) -> f64 {
        self.components
            .iter()
            .map(|c| c.shape.lobe_hz())
            .fold(f64::INFINITY, f64::min)
    }

    /// Fraction of the unfiltered power inside the transmit band, `η = Σ s_c η_c`.
    pub fn in_band_fraction(&self) -> f64 {
        self.components
            .iter()
            .map(|c| c.share * c.in_band_fraction(self.tx_bandwidth_hz))
            .sum()
    }

    /// Band-limited PSD, unit area inside the transmit band (1/Hz), at offset `f`.
    pub fn psd_in_band(&self, f: f64, eta: f64) -> f64 {
        if f.abs() > self.tx_bandwidth_hz / 2.0 {
            return 0.0;
        }
        self.components
            .iter()
            .map(|c| c.share * c.psd(f))
            .sum::<f64>()
            / eta.max(1e-300)
    }

    /// Index of the component a receiver tracks for ranging: the pilot, else the data,
    /// else the acquisition component. `None` for a Doppler-only signal.
    pub fn tracked_index(&self) -> Option<usize> {
        if !self.ranging {
            return None;
        }
        [Role::Pilot, Role::Data, Role::Acquisition]
            .iter()
            .find_map(|r| self.components.iter().position(|c| c.role == *r))
    }

    /// Index of the component a receiver acquires first: the acquisition component, else
    /// the pilot, else the data component.
    pub fn acquisition_index(&self) -> usize {
        [Role::Acquisition, Role::Pilot, Role::Data]
            .iter()
            .find_map(|r| self.components.iter().position(|c| c.role == *r))
            .unwrap_or(0)
    }

    /// Offset (dB) from the total in-band C/N₀ to the C/N₀ that
    /// [`dll_jitter_bandlimited_s`] and the SSC chain take for component `i`: its share of
    /// the unfiltered power over the in-band fraction, `10 log₁₀(s_i/η)`.
    pub fn component_cn0_offset_db(&self, i: usize, eta: f64) -> f64 {
        10.0 * (self.components[i].share / eta.max(1e-300)).log10()
    }

    /// The signal as a [`crate::spectrum::Band`] at received power `power_dbw`: the
    /// tracked component as the band's modulation, every component drawn, band-limited
    /// to the transmit bandwidth, and the receiver bandwidth set to it. Refused for a
    /// flat (OFDM-like) component or a tracked component on an FDMA sub-carrier.
    pub fn to_spectrum_band(
        &self,
        label: &str,
        power_dbw: f64,
    ) -> Result<crate::spectrum::Band, String> {
        let t = self
            .tracked_index()
            .unwrap_or_else(|| self.acquisition_index());
        let tc = &self.components[t];
        let tracked = match tc.shape {
            Shape::Mod(m) => m,
            Shape::Flat { .. } => {
                return Err(format!(
                    "{}: a flat (OFDM-like) component cannot be placed in the spectrum model",
                    self.name
                ))
            }
        };
        if tc.carriers.len() != 1 || tc.carriers[0].0 != 0.0 {
            return Err(format!(
                "{}: the tracked component sits on FDMA sub-carriers; the spectrum model \
                 tracks a component at the band centre",
                self.name
            ));
        }
        let mut comps = Vec::new();
        for c in &self.components {
            let m = match c.shape {
                Shape::Mod(m) => m,
                Shape::Flat { .. } => {
                    return Err(format!(
                        "{}: a flat (OFDM-like) component cannot be placed in the spectrum model",
                        self.name
                    ))
                }
            };
            for (o, w) in &c.carriers {
                comps.push((m, *o, c.share * w));
            }
        }
        Ok(crate::spectrum::Band {
            name: label.to_string(),
            centre_hz: self.centre_hz,
            modulation: tracked,
            signal_power_dbw: power_dbw,
            rx_bandwidth_hz: self.tx_bandwidth_hz,
            design: Some(crate::spectrum::BandDesign {
                components: comps,
                tracked_share: tc.share,
                tx_bandwidth_hz: self.tx_bandwidth_hz,
                in_band_fraction: self.in_band_fraction(),
            }),
        })
    }
}

// ───────────────────────────── tracking ─────────────────────────────

/// Band-limited RMS (Gabor) bandwidth (Hz) of a component's baseband spectrum inside a
/// double-sided band: `√(∫ f² G df / ∫ G df)`.
pub fn gabor_bandwidth_hz(shape: &Shape, band_hz: f64) -> f64 {
    let half = band_hz / 2.0;
    match *shape {
        Shape::Flat { bandwidth_hz } => bandwidth_hz.min(band_hz) / 12f64.sqrt(),
        Shape::Mod(m) => {
            let n = panels_for(band_hz, shape.lobe_hz());
            let num = simpson(-half, half, n, |f| f * f * m.psd(f));
            let den = simpson(-half, half, n, |f| m.psd(f));
            (num / den.max(1e-300)).sqrt()
        }
    }
}

/// Code-tracking jitter (m, 1-σ) of component `i` of `sig` at total in-band C/N₀
/// `cn0_dbhz`, early-late spacing `spacing_chips` (in that component's chips), loop
/// bandwidth `loop_bw_hz` and predetection time `integ_s`, over the transmit band.
/// `None` for a flat component (no chip, no code tracking).
#[allow(clippy::too_many_arguments)]
pub fn code_jitter_m(
    sig: &SignalDesign,
    i: usize,
    eta: f64,
    cn0_dbhz: f64,
    spacing_chips: f64,
    loop_bw_hz: f64,
    integ_s: f64,
    mode: EarlyLate,
) -> Option<f64> {
    let c = &sig.components[i];
    let rc = c.shape.chip_rate_hz()?;
    let Shape::Mod(m) = c.shape else {
        return None;
    };
    let cn0 = cn0_dbhz + sig.component_cn0_offset_db(i, eta);
    let s = dll_jitter_bandlimited_s(
        |f| m.psd(f),
        sig.tx_bandwidth_hz,
        c.shape.lobe_hz(),
        cn0,
        loop_bw_hz,
        integ_s,
        spacing_chips / rc,
        mode,
    );
    Some(s * C_LIGHT_M_PER_S)
}

// ───────────────────────────── acquisition ─────────────────────────────

/// **Largest Doppler shift (Hz)** of a satellite in a circular orbit of altitude `alt_m`
/// on carrier `f_hz`, seen by a user on the Earth's surface above elevation `mask_deg`:
/// the range rate peaks at the mask on an overhead pass,
/// `v_r = v · R_E cos(el) / (R_E + h)` with `v = √(μ/(R_E + h))`, and `f_D = f v_r / c`.
/// Earth rotation (up to about ±0.46 km/s at the equator) is not included.
pub fn max_doppler_hz(f_hz: f64, alt_m: f64, mask_deg: f64) -> f64 {
    let r = R_EARTH_M + alt_m;
    let v = (MU_EARTH / r).sqrt();
    let vr = v * R_EARTH_M * mask_deg.to_radians().cos() / r;
    f_hz * vr / C_LIGHT_M_PER_S
}

/// `ln(k!)` by direct summation for small `k` and Stirling's series beyond.
fn ln_factorial(k: u64) -> f64 {
    if k < 64 {
        (2..=k).map(|i| (i as f64).ln()).sum()
    } else {
        let x = k as f64 + 1.0;
        (x - 0.5) * x.ln() - x + 0.5 * (2.0 * PI).ln() + 1.0 / (12.0 * x)
            - 1.0 / (360.0 * x * x * x)
    }
}

/// `P(Gamma(k, 1) > γ) = e^{-γ} Σ_{i<k} γ^i / i!`: the false-alarm probability of a
/// square-law detector summing `k` non-coherent looks of unit-power complex noise.
pub fn gamma_tail(k: u64, gamma: f64) -> f64 {
    if gamma <= 0.0 {
        return 1.0;
    }
    let mut sum = 0.0;
    for i in 0..k {
        sum += (-gamma + i as f64 * gamma.ln() - ln_factorial(i)).exp();
    }
    sum.min(1.0)
}

/// The detector threshold (normalised to the noise power) for a per-cell false-alarm
/// probability `pfa` with `n_nc` non-coherent looks, by bisection on [`gamma_tail`].
pub fn threshold_for_pfa(pfa: f64, n_nc: u64) -> f64 {
    let (mut lo, mut hi) = (0.0, 400.0);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if gamma_tail(n_nc, mid) > pfa {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// **Detection probability of a square-law detector** with `n_nc` non-coherent looks of
/// coherent signal-to-noise ratio `snr` (linear, `C/N₀ · T`) against threshold `gamma`:
/// the generalised Marcum Q-function, written as a Poisson mixture of gamma tails,
/// `P_d = Σ_j Pois(j; N·snr) · P(Gamma(N + j, 1) > γ)`.
pub fn detection_probability(snr: f64, n_nc: u64, gamma: f64) -> f64 {
    let mu = n_nc as f64 * snr.max(0.0);
    if mu <= 0.0 {
        return gamma_tail(n_nc, gamma);
    }
    let sd = mu.sqrt();
    let j0 = (mu - 12.0 * sd - 20.0).max(0.0) as u64;
    let j1 = (mu + 12.0 * sd + 40.0) as u64;
    let mut pd = 0.0;
    for j in j0..=j1 {
        let w = (-mu + j as f64 * mu.ln() - ln_factorial(j)).exp();
        if w < 1e-300 {
            continue;
        }
        pd += w * gamma_tail(n_nc + j, gamma);
    }
    pd.clamp(0.0, 1.0)
}

/// **Mean acquisition time** (s) of a single-dwell search over `q` cells, one of which
/// holds the signal, with a uniform prior: `T = [2 + (2 − P_d)(q − 1)(1 + K·P_fa)] τ /
/// (2 P_d)` (Holmes, *Coherent Spread Spectrum Systems*, 1982; Kaplan & Hegarty, 3rd ed.,
/// §8), `τ` the dwell and `K` the false-alarm penalty in dwells.
pub fn mean_acquisition_time_s(q: f64, pd: f64, pfa: f64, k_penalty: f64, dwell_s: f64) -> f64 {
    if pd <= 0.0 {
        return f64::INFINITY;
    }
    (2.0 + (2.0 - pd) * (q - 1.0).max(0.0) * (1.0 + k_penalty * pfa)) * dwell_s / (2.0 * pd)
}

// ───────────────────────────── GNSS victims ─────────────────────────────

#[derive(Clone, Copy, Debug, PartialEq)]
enum VictimSpectrum {
    Mod(Modulation),
    AltBoc,
}

/// A GNSS signal the compatibility analysis scores against.
#[derive(Clone, Debug, PartialEq)]
pub struct GnssVictim {
    /// Identifier.
    pub name: &'static str,
    /// Carrier (Hz).
    pub centre_hz: f64,
    spectrum: VictimSpectrum,
    /// Receiver bandwidth (Hz, double-sided).
    pub rx_bandwidth_hz: f64,
    /// Minimum received power (dBW) from the interface specification.
    pub received_power_dbw: f64,
    /// Where the numbers come from.
    pub source: &'static str,
}

/// The GNSS signals the compatibility analysis knows.
pub const GNSS_VICTIM_NAMES: &[&str] = &[
    "gps-l1ca",
    "galileo-e1",
    "gps-l5",
    "galileo-e5a",
    "galileo-e5b",
    "galileo-e5-altboc",
];

/// A GNSS victim by name. The first four come from [`crate::spectrum::default_band`].
pub fn gnss_victim(name: &str) -> Option<GnssVictim> {
    let from_band = |n: &'static str, src: &'static str| {
        crate::spectrum::default_band(n).map(|b| GnssVictim {
            name: n,
            centre_hz: b.centre_hz,
            spectrum: VictimSpectrum::Mod(b.modulation),
            rx_bandwidth_hz: b.rx_bandwidth_hz,
            received_power_dbw: b.signal_power_dbw,
            source: src,
        })
    };
    match name {
        "gps-l1ca" => from_band("gps-l1ca", "IS-GPS-200"),
        "galileo-e1" => from_band("galileo-e1", "Galileo OS SIS ICD"),
        "gps-l5" => from_band("gps-l5", "IS-GPS-705"),
        "galileo-e5a" => from_band("galileo-e5a", "Galileo OS SIS ICD"),
        "galileo-e5b" => Some(GnssVictim {
            name: "galileo-e5b",
            centre_hz: 1207.14e6,
            spectrum: VictimSpectrum::Mod(Modulation::BpskR { n: 10.0 }),
            rx_bandwidth_hz: 20.46e6,
            received_power_dbw: -155.0,
            source: "Galileo OS SIS ICD",
        }),
        "galileo-e5-altboc" => Some(GnssVictim {
            name: "galileo-e5-altboc",
            centre_hz: 1191.795e6,
            spectrum: VictimSpectrum::AltBoc,
            rx_bandwidth_hz: 51.15e6,
            received_power_dbw: -152.0,
            source: "Galileo OS SIS ICD (E5a plus E5b minimum powers)",
        }),
        _ => None,
    }
}

impl GnssVictim {
    /// Unit-area PSD at offset `f` from the victim's carrier.
    pub fn psd(&self, f: f64) -> f64 {
        match self.spectrum {
            VictimSpectrum::Mod(m) => m.psd(f),
            VictimSpectrum::AltBoc => crate::navsignal::altboc_15_10_psd(f),
        }
    }

    /// Modulation label.
    pub fn label(&self) -> String {
        match self.spectrum {
            VictimSpectrum::Mod(m) => m.label(),
            VictimSpectrum::AltBoc => "AltBOC(15,10)".into(),
        }
    }

    fn lobe_hz(&self) -> f64 {
        match self.spectrum {
            VictimSpectrum::Mod(m) => Shape::Mod(m).lobe_hz(),
            VictimSpectrum::AltBoc => 10.0 * F0_HZ,
        }
    }
}

/// SSC (1/Hz) of the band-limited LEO signal (unit power in band) into the GNSS victim,
/// over the victim's receiver band. Zero when the bands do not overlap.
pub fn ssc_leo_into_gnss(sig: &SignalDesign, eta: f64, v: &GnssVictim) -> f64 {
    let lo = (v.centre_hz - v.rx_bandwidth_hz / 2.0).max(sig.centre_hz - sig.tx_bandwidth_hz / 2.0);
    let hi = (v.centre_hz + v.rx_bandwidth_hz / 2.0).min(sig.centre_hz + sig.tx_bandwidth_hz / 2.0);
    if hi <= lo {
        return 0.0;
    }
    let n = panels_for(hi - lo, sig.lobe_hz().min(v.lobe_hz()));
    simpson(lo, hi, n, |f| {
        v.psd(f - v.centre_hz) * sig.psd_in_band(f - sig.centre_hz, eta)
    })
}

/// SSC (1/Hz) of a GNSS victim's signal (unit power, unfiltered) into component `i` of
/// the LEO signal, over the LEO receiver band (the transmit band).
pub fn ssc_gnss_into_leo(sig: &SignalDesign, i: usize, v: &GnssVictim) -> f64 {
    let lo = sig.centre_hz - sig.tx_bandwidth_hz / 2.0;
    let hi = sig.centre_hz + sig.tx_bandwidth_hz / 2.0;
    let c = &sig.components[i];
    let n = panels_for(hi - lo, c.shape.lobe_hz().min(v.lobe_hz()));
    simpson(lo, hi, n, |f| {
        c.psd(f - sig.centre_hz) * v.psd(f - v.centre_hz)
    })
}

// ───────────────────────────── scenario ─────────────────────────────

fn d_nf() -> f64 {
    2.0
}
fn d_tant() -> f64 {
    crate::spectrum::T0_K
}
fn d_cn0s() -> Vec<f64> {
    vec![30.0, 35.0, 40.0, 45.0, 50.0, 55.0]
}
fn d_ref_cn0() -> f64 {
    45.0
}
fn d_bl() -> f64 {
    1.0
}
fn d_t() -> f64 {
    0.02
}
fn d_spacings() -> Vec<f64> {
    vec![1.0, 0.5, 0.2, 0.1]
}
fn d_ref_spacing() -> f64 {
    0.5
}
fn d_el() -> String {
    "coherent".into()
}
fn d_thr() -> f64 {
    crate::jamming::DEFAULT_TRACKING_THRESHOLD_DBHZ
}
fn d_alt() -> f64 {
    550.0
}
fn d_ppm() -> f64 {
    0.5
}
fn d_coh_ms() -> f64 {
    1.0
}
fn d_nnc() -> u64 {
    1
}
fn d_pfa() -> f64 {
    1e-4
}
fn d_k() -> f64 {
    10.0
}
fn d_code_bin() -> f64 {
    0.5
}
fn d_tec() -> f64 {
    50.0
}
fn d_range_km() -> f64 {
    1000.0
}
fn d_agg() -> f64 {
    1.0
}
fn d_points() -> usize {
    241
}
fn d_null_depth() -> f64 {
    6.0
}

/// Receiver and tracking loop.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReceiverCfg {
    /// Noise figure (dB).
    #[serde(default = "d_nf")]
    pub noise_figure_db: f64,
    /// Antenna noise temperature (K).
    #[serde(default = "d_tant")]
    pub antenna_temp_k: f64,
    /// Total in-band C/N₀ values of the jitter sweep (dB-Hz).
    #[serde(default = "d_cn0s")]
    pub cn0_dbhz: Vec<f64>,
    /// C/N₀ used when a signal publishes no received power, and for the equal-C/N₀
    /// columns of the trade (dB-Hz).
    #[serde(default = "d_ref_cn0")]
    pub reference_cn0_dbhz: f64,
    /// DLL loop noise bandwidth (Hz).
    #[serde(default = "d_bl")]
    pub loop_bandwidth_hz: f64,
    /// Predetection integration time (s).
    #[serde(default = "d_t")]
    pub integration_time_s: f64,
    /// Early-late spacings of the sweep (chips of the tracked component).
    #[serde(default = "d_spacings")]
    pub correlator_spacings_chips: Vec<f64>,
    /// Spacing of the headline ranging accuracy (chips).
    #[serde(default = "d_ref_spacing")]
    pub reference_spacing_chips: f64,
    /// `coherent` or `non-coherent` early-minus-late.
    #[serde(default = "d_el")]
    pub early_late: String,
    /// C/N₀ below which a component is lost (dB-Hz).
    #[serde(default = "d_thr")]
    pub tracking_threshold_dbhz: f64,
}

impl Default for ReceiverCfg {
    fn default() -> Self {
        toml::from_str("").expect("defaults")
    }
}

/// Acquisition search.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AcquisitionCfg {
    /// Orbit altitude (km) for signals whose preset gives none.
    #[serde(default = "d_alt")]
    pub altitude_km: f64,
    /// Elevation mask (degrees).
    #[serde(default)]
    pub elevation_mask_deg: f64,
    /// Receiver oscillator frequency uncertainty (parts per million).
    #[serde(default = "d_ppm")]
    pub oscillator_ppm: f64,
    /// User speed (m/s) added to the Doppler range.
    #[serde(default)]
    pub user_speed_mps: f64,
    /// Coherent integration per look (ms).
    #[serde(default = "d_coh_ms")]
    pub coherent_ms: f64,
    /// Non-coherent looks per dwell.
    #[serde(default = "d_nnc")]
    pub noncoherent: u64,
    /// False-alarm probability per cell.
    #[serde(default = "d_pfa")]
    pub pfa_cell: f64,
    /// False-alarm penalty (dwells).
    #[serde(default = "d_k")]
    pub false_alarm_penalty_dwells: f64,
    /// Code-bin spacing (chips).
    #[serde(default = "d_code_bin")]
    pub code_bin_chips: f64,
    /// Acquisition C/N₀ (total, dB-Hz); default each signal's reference C/N₀.
    #[serde(default)]
    pub cn0_dbhz: Option<f64>,
}

impl Default for AcquisitionCfg {
    fn default() -> Self {
        toml::from_str("").expect("defaults")
    }
}

/// Compatibility with GNSS.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct CompatibilityCfg {
    /// GNSS signals to score against (default all of [`GNSS_VICTIM_NAMES`]).
    #[serde(default)]
    pub victims: Vec<String>,
    /// GNSS satellites whose signals add up at the LEO receiver (per-satellite at 1).
    #[serde(default = "d_agg")]
    pub gnss_aggregate_satellites: f64,
}

impl Default for CompatibilityCfg {
    fn default() -> Self {
        toml::from_str("").expect("defaults")
    }
}

/// The band trade.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TradeCfg {
    /// Reference signal for the ratios (default the first).
    #[serde(default)]
    pub reference_signal: Option<String>,
    /// Slant total electron content between satellite and user (TECU).
    #[serde(default = "d_tec")]
    pub slant_tec_tecu: f64,
    /// Slant range for the free-space loss (km).
    #[serde(default = "d_range_km")]
    pub slant_range_km: f64,
}

impl Default for TradeCfg {
    fn default() -> Self {
        toml::from_str("").expect("defaults")
    }
}

/// A qualitative shape check of a signal's band-limited composite PSD against a
/// described measurement: a central peak, nulls, sidelobes. MODELLED consistency, not
/// validation: the targets are shapes, not calibrated levels.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ShapeCheckCfg {
    /// Signal to check.
    pub signal: String,
    /// What the target describes, with its source.
    #[serde(default)]
    pub description: Option<String>,
    /// Minimum excess (dB) of the PSD at the centre over the PSD at
    /// `±central_peak_ref_offset_mhz`.
    #[serde(default)]
    pub central_peak_min_db: Option<f64>,
    /// Offset (MHz) the central peak is compared with.
    #[serde(default)]
    pub central_peak_ref_offset_mhz: Option<f64>,
    /// Expected null offsets (MHz, positive; both sides are checked).
    #[serde(default)]
    pub nulls_mhz: Vec<f64>,
    /// Tolerance on each null's position (MHz).
    #[serde(default)]
    pub null_tolerance_mhz: Option<f64>,
    /// Minimum depth (dB) of a null below the PSD two tolerances either side of it.
    #[serde(default = "d_null_depth")]
    pub null_depth_db: f64,
    /// Offset window (MHz, positive; both sides) holding the first sidelobes.
    #[serde(default)]
    pub sidelobe_window_mhz: Option<[f64; 2]>,
    /// Allowed range (dB) of the sidelobe maximum below the central PSD.
    #[serde(default)]
    pub sidelobe_below_peak_db: Option<[f64; 2]>,
}

/// The `leo-signal` scenario.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoSignalScenario {
    /// Always `leo-signal`.
    #[serde(default)]
    pub kind: Option<String>,
    /// Compiled-in presets whose signals to analyse.
    #[serde(default)]
    pub presets: Vec<String>,
    /// Signals written inline.
    #[serde(default)]
    pub signals: Vec<SignalCfg>,
    /// Receiver.
    #[serde(default)]
    pub receiver: ReceiverCfg,
    /// Acquisition.
    #[serde(default)]
    pub acquisition: AcquisitionCfg,
    /// Compatibility.
    #[serde(default)]
    pub compatibility: CompatibilityCfg,
    /// Band trade.
    #[serde(default)]
    pub trade: TradeCfg,
    /// Shape checks.
    #[serde(default)]
    pub shape_checks: Vec<ShapeCheckCfg>,
    /// PSD samples per signal in the report.
    #[serde(default = "d_points")]
    pub psd_points: usize,
}

fn round4(v: f64) -> f64 {
    (v * 1e4).round() / 1e4
}

fn finite(v: f64) -> Option<f64> {
    if v.is_finite() {
        Some(v)
    } else {
        None
    }
}

fn lin_db(x: f64) -> f64 {
    10.0 * x.max(1e-300).log10()
}

/// One signal's results, kept for the trade table and the chart.
struct SignalRun {
    design: SignalDesign,
    eta: f64,
    ref_cn0: f64,
    tracked: Option<usize>,
    gabor_hz: Option<f64>,
    jitter_ref_m: Option<f64>,
    sweep: Vec<Option<f64>>,
    psd_off: Vec<f64>,
    psd_db: Vec<Option<f64>>,
    json: serde_json::Value,
}

impl LeoSignalScenario {
    /// SHA-256 of the canonical JSON of the scenario.
    pub fn scenario_hash(&self) -> String {
        let c = serde_json::to_string(self).unwrap_or_default();
        let mut h = Sha256::new();
        h.update(c.as_bytes());
        hex::encode(h.finalize())
    }

    /// The signals: every preset's, then the inline ones; the default is the
    /// `generic-bands` preset when neither is given.
    pub fn resolve_signals(&self) -> Result<(Vec<SignalDesign>, Vec<serde_json::Value>), String> {
        let mut out = Vec::new();
        let mut sources = Vec::new();
        let presets: Vec<String> = if self.presets.is_empty() && self.signals.is_empty() {
            vec!["generic-bands".into()]
        } else {
            self.presets.clone()
        };
        for p in &presets {
            let f = preset(p)?;
            sources.push(serde_json::json!({
                "preset": f.preset.name,
                "title": f.preset.title,
                "source": f.preset.source.as_str(),
                "url": f.preset.url,
            }));
            for s in &f.signals {
                out.push(SignalDesign::from_cfg(s)?);
            }
        }
        for s in &self.signals {
            out.push(SignalDesign::from_cfg(s)?);
        }
        let mut names: Vec<&str> = out.iter().map(|s| s.name.as_str()).collect();
        names.sort_unstable();
        if let Some(w) = names.windows(2).find(|w| w[0] == w[1]) {
            return Err(format!("signal {:?} is given twice", w[0]));
        }
        if out.len() > 24 {
            return Err(format!("{} signals is more than the 24 allowed", out.len()));
        }
        Ok((out, sources))
    }

    fn validate(&self) -> Result<EarlyLate, String> {
        let r = &self.receiver;
        if !(r.loop_bandwidth_hz > 0.0 && r.integration_time_s > 0.0) {
            return Err(
                "receiver: loop_bandwidth_hz and integration_time_s must be positive".into(),
            );
        }
        if r.loop_bandwidth_hz * r.integration_time_s >= 1.0 {
            return Err("receiver: loop_bandwidth_hz x integration_time_s must be below 1".into());
        }
        if r.cn0_dbhz.is_empty() || r.cn0_dbhz.len() > 40 {
            return Err("receiver: give 1 to 40 cn0_dbhz values".into());
        }
        if r.correlator_spacings_chips.is_empty()
            || r.correlator_spacings_chips.len() > 12
            || r.correlator_spacings_chips
                .iter()
                .chain(std::iter::once(&r.reference_spacing_chips))
                .any(|d| !(*d > 0.0 && *d < 2.0))
        {
            return Err(
                "receiver: 1 to 12 correlator spacings, each (like reference_spacing_chips) \
                 between 0 and 2 chips"
                    .into(),
            );
        }
        let a = &self.acquisition;
        if !(a.coherent_ms > 0.0
            && a.noncoherent >= 1
            && a.noncoherent <= 1000
            && a.pfa_cell > 0.0
            && a.pfa_cell < 1.0
            && a.code_bin_chips > 0.0
            && a.altitude_km > 0.0
            && a.oscillator_ppm >= 0.0
            && a.user_speed_mps >= 0.0
            && (0.0..90.0).contains(&a.elevation_mask_deg))
        {
            return Err(
                "acquisition: coherent_ms > 0, 1 ≤ noncoherent ≤ 1000, 0 < pfa_cell < 1, \
                        code_bin_chips > 0, altitude_km > 0, oscillator_ppm and user_speed_mps \
                        ≥ 0, 0 ≤ elevation_mask_deg < 90"
                    .into(),
            );
        }
        if !(self.trade.slant_range_km > 0.0 && self.trade.slant_tec_tecu >= 0.0) {
            return Err("trade: slant_range_km > 0 and slant_tec_tecu ≥ 0".into());
        }
        if !(21..=2001).contains(&self.psd_points) {
            return Err("psd_points must be between 21 and 2001".into());
        }
        match r.early_late.as_str() {
            "coherent" => Ok(EarlyLate::Coherent),
            "non-coherent" => Ok(EarlyLate::NonCoherent),
            o => Err(format!(
                "receiver.early_late {o:?}: use \"coherent\" or \"non-coherent\""
            )),
        }
    }

    /// Run the scenario: the JSON report, the one-line summary and the SVG chart.
    pub fn run_all(&self) -> Result<(String, String, String), String> {
        let mode = self.validate()?;
        let (designs, sources) = self.resolve_signals()?;
        let r = &self.receiver;
        let t_sys = crate::spectrum::system_temp_k(r.antenna_temp_k, r.noise_figure_db);
        if !(t_sys.is_finite() && t_sys > 0.0) {
            return Err("the system noise temperature must be positive".into());
        }
        let n0_db = crate::spectrum::noise_density_dbw_per_hz(t_sys);
        let victims: Vec<GnssVictim> = if self.compatibility.victims.is_empty() {
            GNSS_VICTIM_NAMES
                .iter()
                .filter_map(|n| gnss_victim(n))
                .collect()
        } else {
            self.compatibility
                .victims
                .iter()
                .map(|n| {
                    gnss_victim(n).ok_or_else(|| {
                        format!(
                            "compatibility: unknown GNSS signal {n:?} (known: {})",
                            GNSS_VICTIM_NAMES.join(", ")
                        )
                    })
                })
                .collect::<Result<_, _>>()?
        };

        let mut runs = Vec::new();
        for d in designs {
            runs.push(self.run_signal(d, mode, n0_db, &victims)?);
        }

        // The band trade.
        let ref_idx = match &self.trade.reference_signal {
            None => 0,
            Some(n) => runs
                .iter()
                .position(|s| &s.design.name == n)
                .ok_or_else(|| format!("trade.reference_signal {n:?} is not a scenario signal"))?,
        };
        let range_m = self.trade.slant_range_km * 1e3;
        let fspl_ref =
            crate::jamming::free_space_path_loss_db(range_m, runs[ref_idx].design.centre_hz);
        let tec = self.trade.slant_tec_tecu * TECU;
        let iono_ref = IONO_K * tec / runs[ref_idx].design.centre_hz.powi(2);
        let mut trade_rows = Vec::new();
        for s in &runs {
            let f = s.design.centre_hz;
            let fspl = crate::jamming::free_space_path_loss_db(range_m, f);
            let iono = IONO_K * tec / (f * f);
            let eq_eirp_cn0 = r.reference_cn0_dbhz - (fspl - fspl_ref);
            let (j_eq_cn0, j_eq_eirp, tol) = match s.tracked {
                Some(i) => {
                    let jc = code_jitter_m(
                        &s.design,
                        i,
                        s.eta,
                        r.reference_cn0_dbhz,
                        r.reference_spacing_chips,
                        r.loop_bandwidth_hz,
                        r.integration_time_s,
                        mode,
                    );
                    let je = code_jitter_m(
                        &s.design,
                        i,
                        s.eta,
                        eq_eirp_cn0,
                        r.reference_spacing_chips,
                        r.loop_bandwidth_hz,
                        r.integration_time_s,
                        mode,
                    );
                    let tol = jammer_tolerance(
                        &s.design,
                        i,
                        s.eta,
                        eq_eirp_cn0,
                        r.tracking_threshold_dbhz,
                    );
                    (jc, je, tol)
                }
                None => (None, None, None),
            };
            trade_rows.push(serde_json::json!({
                "signal": s.design.name,
                "centre_hz": f,
                "allocation": s.design.allocation.as_str(),
                "tx_bandwidth_hz": s.design.tx_bandwidth_hz,
                "iono_delay_m": iono,
                "iono_delay_ratio": iono / iono_ref.max(1e-300),
                "free_space_loss_db": fspl,
                "free_space_loss_vs_reference_db": fspl - fspl_ref,
                "gabor_bandwidth_hz": s.gabor_hz,
                "jitter_equal_cn0_m": j_eq_cn0,
                "cn0_equal_eirp_dbhz": eq_eirp_cn0,
                "jitter_equal_eirp_m": j_eq_eirp,
                "cw_js_max_equal_eirp_db": tol.as_ref().and_then(|t| t.0),
                "wideband_js_max_equal_eirp_db": tol.as_ref().and_then(|t| t.1),
                "matched_js_max_equal_eirp_db": tol.as_ref().and_then(|t| t.2),
            }));
        }

        // Shape checks.
        let mut checks = Vec::new();
        for c in &self.shape_checks {
            let s = runs
                .iter()
                .find(|s| s.design.name == c.signal)
                .ok_or_else(|| {
                    format!("shape check: signal {:?} is not in the scenario", c.signal)
                })?;
            checks.push(shape_check(&s.design, s.eta, c)?);
        }
        let all_pass = checks.iter().all(|c| c["pass"].as_bool() == Some(true));

        let best = runs
            .iter()
            .filter_map(|s| {
                s.jitter_ref_m
                    .map(|j| (s.design.name.clone(), j, s.ref_cn0))
            })
            .min_by(|a, b| a.1.partial_cmp(&b.1).unwrap_or(std::cmp::Ordering::Equal));

        let doc = serde_json::json!({
            "kind": "leo-signal",
            "label": "MODELLED: parameterised low Earth orbit (LEO) positioning, navigation and \
                      timing (PNT) signal designs, band-limited to their transmit bandwidth. \
                      The closed forms underneath are VALIDATED (BPSK power in band and Gabor \
                      bandwidth, the band-limited early-late code-tracking jitter reducing to \
                      the textbook forms, the offset spectral separation coefficient, and the \
                      maximum LEO Doppler against Xona Pulsar and Iridium figures); every \
                      signal design, power split, C/N0 and jammer level is an input, and a \
                      preset marked WORKSHOP or REPRESENTATIVE is not a published \
                      specification.",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "scenario_hash": self.scenario_hash(),
            "sources": sources,
            "receiver": {
                "noise_figure_db": r.noise_figure_db,
                "antenna_temp_k": r.antenna_temp_k,
                "system_temp_k": t_sys,
                "noise_density_dbw_per_hz": n0_db,
                "reference_cn0_dbhz": r.reference_cn0_dbhz,
                "loop_bandwidth_hz": r.loop_bandwidth_hz,
                "integration_time_s": r.integration_time_s,
                "correlator_spacings_chips": r.correlator_spacings_chips,
                "reference_spacing_chips": r.reference_spacing_chips,
                "early_late": r.early_late,
                "tracking_threshold_dbhz": r.tracking_threshold_dbhz,
                "cn0_dbhz": r.cn0_dbhz,
            },
            "signals": runs.iter().map(|s| s.json.clone()).collect::<Vec<_>>(),
            "trade": {
                "reference_signal": runs[ref_idx].design.name,
                "slant_tec_tecu": self.trade.slant_tec_tecu,
                "slant_range_km": self.trade.slant_range_km,
                "rows": trade_rows,
            },
            "shape_checks": checks,
            "shape_checks_pass": all_pass,
            "not_modelled": NOT_MODELLED,
            "units": crate::field_schema::units_block(UNITS),
        });
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        let summary = format!(
            "scenario leo-signal | {} signals | noise floor {:.1} dBW/Hz{}{}",
            runs.len(),
            n0_db,
            match &best {
                Some((n, j, c)) => format!(" | finest ranging {n} {j:.3} m at {c:.1} dB-Hz"),
                None => String::new(),
            },
            if checks.is_empty() {
                String::new()
            } else {
                format!(
                    " | shape checks {}",
                    if all_pass {
                        "consistent"
                    } else {
                        "INCONSISTENT"
                    }
                )
            }
        );
        let svg = chart(&runs, &self.receiver);
        Ok((json, summary, svg))
    }

    fn run_signal(
        &self,
        d: SignalDesign,
        mode: EarlyLate,
        n0_db: f64,
        victims: &[GnssVictim],
    ) -> Result<SignalRun, String> {
        let r = &self.receiver;
        let eta = d.in_band_fraction();
        let (ref_cn0, ref_src) = match d.received_power_dbw {
            Some(p) => (p - n0_db, "received power minus the noise density"),
            None => (r.reference_cn0_dbhz, "receiver.reference_cn0_dbhz"),
        };
        let b = d.tx_bandwidth_hz;
        let comps: Vec<serde_json::Value> = d
            .components
            .iter()
            .map(|c| {
                let bpsk_closed = match (c.shape, c.carriers.as_slice()) {
                    (Shape::Mod(Modulation::BpskR { n }), [(o, _)]) if *o == 0.0 => Some((
                        bpsk_power_in_band_closed_form(n * F0_HZ, b),
                        bpsk_gabor_bandwidth_closed_form_hz(n * F0_HZ, b),
                    )),
                    _ => None,
                };
                let first_null = match c.shape {
                    Shape::Mod(m) => {
                        crate::spectrum::psd_nulls_hz(&m, 3.0 * m.chip_rate_hz()).first().copied()
                    }
                    Shape::Flat { bandwidth_hz } => Some(bandwidth_hz / 2.0),
                };
                let rc = c.shape.chip_rate_hz();
                serde_json::json!({
                    "role": c.role.as_str(),
                    "modulation": c.shape.label(),
                    "chip_rate_hz": rc,
                    "power_fraction": c.share,
                    "fdma_offsets_hz": c.carriers.iter().filter(|_| c.carriers.len() > 1 || c.carriers[0].0 != 0.0).map(|x| x.0).collect::<Vec<_>>(),
                    "fdma_shares": c.carriers.iter().filter(|_| c.carriers.len() > 1 || c.carriers[0].0 != 0.0).map(|x| x.1).collect::<Vec<_>>(),
                    "code_length_chips": c.code_length_chips,
                    "code_period_s": match (c.code_length_chips, rc) {
                        (Some(l), Some(rc)) => Some(l as f64 / rc),
                        _ => None,
                    },
                    "data_rate_sps": c.data_rate_sps,
                    "first_null_hz": first_null,
                    "in_band_power_fraction": c.in_band_fraction(b),
                    "in_band_power_fraction_closed_form": bpsk_closed.map(|x| x.0),
                    "gabor_bandwidth_hz": gabor_bandwidth_hz(&c.shape, b),
                    "gabor_bandwidth_closed_form_hz": bpsk_closed.map(|x| x.1),
                    "note": c.note,
                })
            })
            .collect();

        // Tracking.
        let tracked = d.tracked_index();
        let (tracking, gabor, jitter_ref, sweep_ref) = match tracked {
            Some(i) if d.components[i].shape.chip_rate_hz().is_some() => {
                let c = &d.components[i];
                let Shape::Mod(m) = c.shape else {
                    unreachable!("chip rate implies a modulation")
                };
                let rc = m.chip_rate_hz();
                let off = d.component_cn0_offset_db(i, eta);
                let jit = |cn0: f64, dch: f64| {
                    code_jitter_m(
                        &d,
                        i,
                        eta,
                        cn0,
                        dch,
                        r.loop_bandwidth_hz,
                        r.integration_time_s,
                        mode,
                    )
                    .unwrap_or(f64::NAN)
                };
                let table: Vec<Vec<Option<f64>>> = r
                    .correlator_spacings_chips
                    .iter()
                    .map(|&dch| r.cn0_dbhz.iter().map(|&c0| finite(jit(c0, dch))).collect())
                    .collect();
                let unlimited: Option<Vec<Vec<f64>>> = match m {
                    Modulation::BpskR { .. } => Some(
                        r.correlator_spacings_chips
                            .iter()
                            .map(|&dch| {
                                r.cn0_dbhz
                                    .iter()
                                    .map(|&c0| {
                                        let cn = 10f64.powf((c0 + off) / 10.0);
                                        let bl = r.loop_bandwidth_hz
                                            * (1.0
                                                - 0.5 * r.loop_bandwidth_hz * r.integration_time_s);
                                        let mut var = bl * dch / (2.0 * cn);
                                        if mode == EarlyLate::NonCoherent {
                                            var *= 1.0
                                                + 2.0 / ((2.0 - dch) * r.integration_time_s * cn);
                                        }
                                        var.sqrt() * C_LIGHT_M_PER_S / rc
                                    })
                                    .collect()
                            })
                            .collect(),
                    ),
                    _ => None,
                };
                let limit: Vec<f64> = r
                    .cn0_dbhz
                    .iter()
                    .map(|&c0| {
                        dll_jitter_small_spacing_limit_s(
                            |f| m.psd(f),
                            b,
                            c.shape.lobe_hz(),
                            c0 + off,
                            r.loop_bandwidth_hz,
                            r.integration_time_s,
                        ) * C_LIGHT_M_PER_S
                    })
                    .collect();
                let jr = jit(ref_cn0, r.reference_spacing_chips);
                let sweep: Vec<Option<f64>> = r
                    .cn0_dbhz
                    .iter()
                    .map(|&c0| finite(jit(c0, r.reference_spacing_chips)))
                    .collect();
                let g = gabor_bandwidth_hz(&c.shape, b);
                (
                    serde_json::json!({
                        "component": c.role.as_str(),
                        "modulation": c.shape.label(),
                        "component_cn0_offset_db": off,
                        "chip_length_m": C_LIGHT_M_PER_S / rc,
                        "spacings_chips": r.correlator_spacings_chips,
                        "cn0_dbhz": r.cn0_dbhz,
                        "jitter_m": table,
                        "jitter_unlimited_band_m": unlimited,
                        "small_spacing_limit_m": limit,
                        "reference_cn0_dbhz": ref_cn0,
                        "reference_spacing_chips": r.reference_spacing_chips,
                        "ranging_accuracy_m": finite(jr),
                    }),
                    Some(g),
                    finite(jr),
                    sweep,
                )
            }
            _ => (
                serde_json::json!({
                    "component": serde_json::Value::Null,
                    "note": if d.ranging {
                        "no chip-rate component to track: code ranging is not modelled for this signal"
                    } else {
                        "Doppler-only signal: no code ranging (the preset marks ranging = false)"
                    },
                }),
                None,
                None,
                vec![None; r.cn0_dbhz.len()],
            ),
        };

        // Acquisition.
        let acquisition = self.acquisition_json(&d, eta, ref_cn0);

        // Compatibility.
        let compat: Vec<serde_json::Value> = victims
            .iter()
            .map(|v| {
                let k_lg = ssc_leo_into_gnss(&d, eta, v);
                let k_gl = tracked.map(|i| ssc_gnss_into_leo(&d, i, v));
                let n0 = 10f64.powf(n0_db / 10.0);
                let dgnss = d.received_power_dbw.and_then(|p| {
                    if k_lg > 0.0 {
                        Some(lin_db(1.0 + 10f64.powf(p / 10.0) * k_lg / n0))
                    } else {
                        None
                    }
                });
                let dleo = k_gl.and_then(|k| {
                    if k > 0.0 {
                        Some(lin_db(
                            1.0 + self.compatibility.gnss_aggregate_satellites
                                * 10f64.powf(v.received_power_dbw / 10.0)
                                * k
                                / n0,
                        ))
                    } else {
                        None
                    }
                });
                serde_json::json!({
                    "gnss": v.name,
                    "gnss_modulation": v.label(),
                    "gnss_centre_hz": v.centre_hz,
                    "gnss_rx_bandwidth_hz": v.rx_bandwidth_hz,
                    "gnss_received_power_dbw": v.received_power_dbw,
                    "gnss_source": v.source,
                    "ssc_leo_into_gnss_db_per_hz": if k_lg > 0.0 { Some(lin_db(k_lg)) } else { None },
                    "gnss_cn0_degradation_db": dgnss,
                    "ssc_gnss_into_leo_db_per_hz": k_gl.and_then(|k| if k > 0.0 { Some(lin_db(k)) } else { None }),
                    "leo_cn0_degradation_db": dleo,
                })
            })
            .collect();

        // Jammer tolerance at the reference C/N0.
        let tol =
            tracked.and_then(|i| jammer_tolerance(&d, i, eta, ref_cn0, r.tracking_threshold_dbhz));

        // PSD samples.
        let span = 0.6 * b;
        let npts = self.psd_points;
        let psd_off: Vec<f64> = (0..npts)
            .map(|k| -span + 2.0 * span * k as f64 / (npts - 1) as f64)
            .collect();
        let psd_db: Vec<Option<f64>> = psd_off
            .iter()
            .map(|&f| {
                let v = d.psd_in_band(f, eta);
                if v > 0.0 {
                    Some(round4(lin_db(v)))
                } else {
                    None
                }
            })
            .collect();

        let json = serde_json::json!({
            "name": d.name,
            "system": d.system,
            "source": d.source.as_str(),
            "source_ref": d.source_ref,
            "notes": d.notes,
            "centre_hz": d.centre_hz,
            "tx_bandwidth_hz": b,
            "allocation": d.allocation.as_str(),
            "received_power_dbw": d.received_power_dbw,
            "received_power_max_dbw": d.received_power_max_dbw,
            "orbit_altitude_m": d.orbit_altitude_m,
            "ranging": d.ranging,
            "in_band_power_fraction": eta,
            "reference_cn0_dbhz": ref_cn0,
            "reference_cn0_source": ref_src,
            "components": comps,
            "tracking": tracking,
            "acquisition": acquisition,
            "compatibility": compat,
            "jammer_tolerance": {
                "reference_cn0_dbhz": ref_cn0,
                "tracking_threshold_dbhz": r.tracking_threshold_dbhz,
                "cw_js_max_db": tol.as_ref().and_then(|t| t.0),
                "wideband_js_max_db": tol.as_ref().and_then(|t| t.1),
                "matched_js_max_db": tol.as_ref().and_then(|t| t.2),
            },
            "psd": {
                "offset_hz": psd_off,
                "db_per_hz": psd_db,
            },
        });
        Ok(SignalRun {
            design: d,
            eta,
            ref_cn0,
            tracked,
            gabor_hz: gabor,
            jitter_ref_m: jitter_ref,
            sweep: sweep_ref,
            psd_off,
            psd_db,
            json,
        })
    }

    fn acquisition_json(&self, d: &SignalDesign, eta: f64, ref_cn0: f64) -> serde_json::Value {
        let a = &self.acquisition;
        let i = d.acquisition_index();
        let c = &d.components[i];
        let alt_m = d.orbit_altitude_m.unwrap_or(a.altitude_km * 1e3);
        let fd_sat = max_doppler_hz(d.centre_hz, alt_m, a.elevation_mask_deg);
        let fd_osc = d.centre_hz * a.oscillator_ppm * 1e-6;
        let fd_user = d.centre_hz * a.user_speed_mps / C_LIGHT_M_PER_S;
        let half = fd_sat + fd_osc + fd_user;
        let t_coh = a.coherent_ms * 1e-3;
        let bin = 2.0 / (3.0 * t_coh);
        let nd = (2.0 * half / bin).ceil() + 1.0;
        let dwell = t_coh * a.noncoherent as f64;
        let cn0 = a.cn0_dbhz.unwrap_or(ref_cn0)
            + d.component_cn0_offset_db(i, eta)
            + lin_db(c.in_band_fraction(d.tx_bandwidth_hz));
        let snr = 10f64.powf(cn0 / 10.0) * t_coh;
        let gamma = threshold_for_pfa(a.pfa_cell, a.noncoherent);
        let pd_nom = detection_probability(snr, a.noncoherent, gamma);
        // Worst-case straddle: a quarter-bin code offset (0.75 amplitude for a 1/2-chip
        // bin on a triangular correlation) and a half-bin Doppler offset.
        let code_amp = (1.0 - a.code_bin_chips / 2.0).max(0.0);
        let dop_x = PI * (bin / 2.0) * t_coh;
        let dop_amp = dop_x.sin() / dop_x;
        let snr_worst = snr * (code_amp * dop_amp).powi(2);
        let pd_worst = detection_probability(snr_worst, a.noncoherent, gamma);
        let code_bins = match (c.code_length_chips, c.shape.chip_rate_hz()) {
            (Some(l), Some(_)) if d.ranging || c.role == Role::Acquisition => {
                Some((l as f64 / a.code_bin_chips).ceil())
            }
            _ => None,
        };
        let (cells, t_serial, t_par, pfa_dwell) = match code_bins {
            Some(nc) => {
                let q = nd * nc;
                let ts = mean_acquisition_time_s(
                    q,
                    pd_worst,
                    a.pfa_cell,
                    a.false_alarm_penalty_dwells,
                    dwell,
                );
                let pfa_dwell = 1.0 - (1.0 - a.pfa_cell).powf(nc);
                let tp = mean_acquisition_time_s(
                    nd,
                    pd_worst,
                    pfa_dwell,
                    a.false_alarm_penalty_dwells,
                    dwell,
                );
                (Some(q), finite(ts), finite(tp), Some(pfa_dwell))
            }
            None => (None, None, None, None),
        };
        serde_json::json!({
            "component": c.role.as_str(),
            "modulation": c.shape.label(),
            "orbit_altitude_m": alt_m,
            "elevation_mask_deg": a.elevation_mask_deg,
            "max_doppler_satellite_hz": fd_sat,
            "oscillator_doppler_hz": fd_osc,
            "user_doppler_hz": fd_user,
            "search_half_range_hz": half,
            "doppler_bin_hz": bin,
            "doppler_bins": nd,
            "code_bin_chips": a.code_bin_chips,
            "code_bins": code_bins,
            "cells": cells,
            "coherent_s": t_coh,
            "noncoherent": a.noncoherent,
            "dwell_s": dwell,
            "acquisition_cn0_dbhz": cn0,
            "coherent_snr_db": lin_db(snr),
            "pfa_cell": a.pfa_cell,
            "pfa_dwell_code_parallel": pfa_dwell,
            "threshold_over_noise": gamma,
            "pd_no_straddle": pd_nom,
            "pd_worst_straddle": pd_worst,
            "mean_time_serial_s": t_serial,
            "mean_time_code_parallel_s": t_par,
        })
    }
}

/// Largest J/S (dB, jammer over the tracked component's power as the `spectrum` kind
/// refers it) at which component `i` stays at the tracking threshold, for a CW tone at
/// the carrier, flat noise over the transmit band and noise matched to the component,
/// from [`crate::spectrum::Jammer::ssc`]: `(J/S)_max = [1/C_th − 1/C] / κ`. `None` for a
/// jammer type when the component is already below the threshold, or for a signal the
/// spectrum model cannot hold.
pub fn jammer_tolerance(
    d: &SignalDesign,
    i: usize,
    eta: f64,
    cn0_total_dbhz: f64,
    threshold_dbhz: f64,
) -> Option<(Option<f64>, Option<f64>, Option<f64>)> {
    use crate::spectrum::{JammerCfg, Waveform};
    let band = d.to_spectrum_band(&d.name, 0.0).ok()?;
    if d.tracked_index() != Some(i) {
        return None;
    }
    let c = 10f64.powf((cn0_total_dbhz + d.component_cn0_offset_db(i, eta)) / 10.0);
    let cth = 10f64.powf(threshold_dbhz / 10.0);
    let margin = 1.0 / cth - 1.0 / c;
    let mk = |w: Waveform, bw: Option<f64>| JammerCfg {
        name: None,
        waveform: w,
        centre_mhz: d.centre_hz / 1e6,
        bandwidth_mhz: bw,
        sweep_period_us: None,
        matched_to: Some(d.name.clone()),
        received_power_dbw: Some(0.0),
        eirp_dbw: None,
        range_m: None,
        rx_gain_dbi: 0.0,
        on_s: 0.0,
        off_s: None,
    };
    let bands = [band.clone()];
    let js = |w: Waveform, bw: Option<f64>| -> Option<f64> {
        let j = mk(w, bw).resolve(0, &bands).ok()?;
        let k = j.ssc(&band, 0.0, 1.0);
        if margin > 0.0 && k > 0.0 {
            Some(lin_db(margin / k))
        } else {
            None
        }
    };
    Some((
        js(Waveform::Cw, None),
        js(Waveform::Wideband, Some(d.tx_bandwidth_hz / 1e6)),
        js(Waveform::Matched, None),
    ))
}

/// Evaluate a [`ShapeCheckCfg`] on a signal's band-limited composite PSD.
fn shape_check(d: &SignalDesign, eta: f64, c: &ShapeCheckCfg) -> Result<serde_json::Value, String> {
    let db = |f_mhz: f64| lin_db(d.psd_in_band(f_mhz * 1e6, eta));
    let step = (d.lobe_hz() / 1e6 / 200.0).clamp(1e-4, 0.05);
    let argmin = |a: f64, b: f64| -> (f64, f64) {
        let n = ((b - a) / step).ceil().max(2.0) as usize;
        (0..=n)
            .map(|k| a + (b - a) * k as f64 / n as f64)
            .map(|f| (f, db(f)))
            .fold((a, f64::INFINITY), |m, x| if x.1 < m.1 { x } else { m })
    };
    let argmax = |a: f64, b: f64| -> (f64, f64) {
        let n = ((b - a) / step).ceil().max(2.0) as usize;
        (0..=n)
            .map(|k| a + (b - a) * k as f64 / n as f64)
            .map(|f| (f, db(f)))
            .fold((a, f64::NEG_INFINITY), |m, x| if x.1 > m.1 { x } else { m })
    };
    let centre = db(0.0);
    let mut items = Vec::new();
    let mut pass = true;
    if let (Some(min_db), Some(off)) = (c.central_peak_min_db, c.central_peak_ref_offset_mhz) {
        let excess = centre - db(off).max(db(-off));
        let ok = excess >= min_db;
        pass &= ok;
        items.push(serde_json::json!({
            "check": "central peak",
            "measured_db": excess,
            "required_min_db": min_db,
            "ref_offset_hz": off * 1e6,
            "pass": ok,
        }));
    }
    let tol = c.null_tolerance_mhz.unwrap_or(0.5);
    for &n in &c.nulls_mhz {
        for sign in [-1.0, 1.0] {
            let (a, b) = if sign > 0.0 {
                (n - tol, n + tol)
            } else {
                (-n - tol, -n + tol)
            };
            let (f_min, v_min) = argmin(a, b);
            let shoulder = db(sign * n - 2.0 * tol).min(db(sign * n + 2.0 * tol));
            let depth = if v_min.is_finite() {
                shoulder - v_min
            } else {
                f64::INFINITY
            };
            let ok = depth >= c.null_depth_db;
            pass &= ok;
            items.push(serde_json::json!({
                "check": "null",
                "expected_offset_hz": sign * n * 1e6,
                "found_offset_hz": f_min * 1e6,
                "depth_db": finite(depth),
                "depth_unbounded": !depth.is_finite(),
                "required_depth_db": c.null_depth_db,
                "tolerance_hz": tol * 1e6,
                "pass": ok,
            }));
        }
    }
    if let (Some([a, b]), Some([lo, hi])) = (c.sidelobe_window_mhz, c.sidelobe_below_peak_db) {
        for sign in [-1.0, 1.0] {
            let (x0, x1) = if sign > 0.0 { (a, b) } else { (-b, -a) };
            let (f_pk, v_pk) = argmax(x0, x1);
            let below = centre - v_pk;
            let ok = below >= lo && below <= hi;
            pass &= ok;
            items.push(serde_json::json!({
                "check": "sidelobe",
                "window_hz": [x0 * 1e6, x1 * 1e6],
                "found_offset_hz": f_pk * 1e6,
                "below_centre_db": below,
                "allowed_db": [lo, hi],
                "pass": ok,
            }));
        }
    }
    Ok(serde_json::json!({
        "signal": d.name,
        "description": c.description,
        "label": "MODELLED consistency check of the band-limited model spectrum against a \
                  described shape; not a validation (no calibrated measurement is compared)",
        "items": items,
        "pass": pass,
    }))
}

/// What the report states the model leaves out.
pub const NOT_MODELLED: &[&str] = &[
    "the exact spectra of enhanced Feher QPSK, code shift keying and OFDM: a rectangular-chip \
     BPSK envelope or a flat band stands in, as each preset states",
    "spreading-code line structure and multiple-access cross-correlation between codes",
    "the transmit and receive filters beyond an ideal brick wall at the transmit bandwidth: \
     no out-of-band emission, no filter group delay",
    "multipath, receiver quantisation and automatic gain control",
    "Earth rotation in the Doppler bound (up to about 0.46 km/s of range rate at the equator)",
    "ionospheric delay beyond first order, and the split of the electron content above and \
     below a LEO satellite: the slant TEC is an input",
    "atmospheric, rain and polarisation losses: the free-space loss alone is compared (rain \
     matters at C band)",
    "acquisition beyond a single dwell with a false-alarm penalty: no multi-dwell \
     verification logic, a uniform code-phase prior, the worst-case straddle",
    "aggregate interference beyond a per-satellite count: one GNSS satellite unless \
     compatibility.gnss_aggregate_satellites says otherwise, one LEO satellite",
];

// ───────────────────────────── chart ─────────────────────────────

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

const PALETTE: [&str; 8] = [
    "#e0a64a", "#46b67e", "#5aa5e5", "#e5645a", "#b58ce0", "#d9d06a", "#6ad9c9", "#e58cb5",
];

/// Left: each signal's band-limited composite PSD (dB below its own peak, offset across
/// its own transmit band). Right: code jitter against C/N₀ at the reference spacing, on a
/// log scale.
fn chart(runs: &[SignalRun], r: &ReceiverCfg) -> String {
    let n = runs.len().max(1);
    let row_h = 64.0;
    let (w, h) = (1000.0_f64, (110.0 + n as f64 * row_h).max(560.0));
    let mut s = crate::chart::frame_open(
        w,
        h,
        "LEO-PNT signal designs",
        &format!(
            "left: band-limited PSD of each design (dB below peak, across its transmit band); right: code jitter vs total C/N0 at {} chip spacing",
            r.reference_spacing_chips
        ),
    );
    let (lx, lw) = (150.0, 360.0);
    for (k, run) in runs.iter().enumerate() {
        let top = 70.0 + k as f64 * row_h;
        let ph = row_h - 18.0;
        let colour = PALETTE[k % PALETTE.len()];
        let peak = run
            .psd_db
            .iter()
            .flatten()
            .cloned()
            .fold(f64::NEG_INFINITY, f64::max);
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"11\" fill=\"{colour}\">{}</text>\
             <text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"9\" fill=\"#8a8172\">{:.3} MHz, {} MHz</text>",
            lx - 8.0,
            top + ph / 2.0,
            esc(&run.design.name),
            lx - 8.0,
            top + ph / 2.0 + 12.0,
            run.design.centre_hz / 1e6,
            run.design.tx_bandwidth_hz / 1e6
        ));
        s.push_str(&format!(
            "<rect x=\"{lx:.1}\" y=\"{top:.1}\" width=\"{lw:.1}\" height=\"{ph:.1}\" fill=\"none\" stroke=\"#342c21\"/>"
        ));
        let span = run.psd_off.last().copied().unwrap_or(1.0).max(1.0);
        let mut pts = String::new();
        for (f, v) in run.psd_off.iter().zip(&run.psd_db) {
            let Some(v) = v else { continue };
            let x = lx + (f + span) / (2.0 * span) * lw;
            let rel = (v - peak).max(-50.0);
            let y = top + (-rel / 50.0) * ph;
            pts.push_str(&format!("{x:.1},{y:.1} "));
        }
        s.push_str(&format!(
            "<polyline points=\"{pts}\" fill=\"none\" stroke=\"{colour}\" stroke-width=\"1.2\"/>"
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\" fill=\"#8a8172\">offset across ±0.6 × transmit bandwidth; 0 to −50 dB below each peak</text>",
        lx + lw / 2.0,
        70.0 + n as f64 * row_h + 4.0
    ));
    // Jitter panel.
    let (px, py, pw, ph) = (590.0, 80.0, 370.0, 360.0);
    s.push_str(&crate::chart::panel_axes(
        px,
        py,
        pw,
        py + ph,
        "code jitter (m, log scale) vs total C/N0 (dB-Hz)",
    ));
    let cn0s = &r.cn0_dbhz;
    let (c_lo, c_hi) = (
        cn0s.iter().cloned().fold(f64::INFINITY, f64::min),
        cn0s.iter().cloned().fold(f64::NEG_INFINITY, f64::max),
    );
    let vals: Vec<f64> = runs
        .iter()
        .flat_map(|r| r.sweep.iter().flatten().cloned())
        .collect();
    let (lo, hi) = if vals.is_empty() {
        (-2.0, 1.0)
    } else {
        (
            vals.iter()
                .cloned()
                .fold(f64::INFINITY, f64::min)
                .log10()
                .floor(),
            vals.iter()
                .cloned()
                .fold(f64::NEG_INFINITY, f64::max)
                .log10()
                .ceil(),
        )
    };
    let hi = if hi <= lo { lo + 1.0 } else { hi };
    let xc = |c: f64| {
        px + if c_hi > c_lo {
            (c - c_lo) / (c_hi - c_lo)
        } else {
            0.5
        } * pw
    };
    let yj = |j: f64| py + ph - (j.log10() - lo) / (hi - lo) * ph;
    let mut dec = lo;
    while dec <= hi + 1e-9 {
        let y = py + ph - (dec - lo) / (hi - lo) * ph;
        s.push_str(&format!(
            "<line x1=\"{px:.1}\" y1=\"{y:.1}\" x2=\"{:.1}\" y2=\"{y:.1}\" stroke=\"#262019\"/>\
             <text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"10\" fill=\"#8a8172\">{}</text>",
            px + pw,
            px - 5.0,
            y + 3.0,
            if dec >= 0.0 {
                format!("{}", 10f64.powf(dec))
            } else {
                format!("{:.prec$}", 10f64.powf(dec), prec = (-dec) as usize)
            }
        ));
        dec += 1.0;
    }
    for c in cn0s {
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\" fill=\"#8a8172\">{c:.0}</text>",
            xc(*c),
            py + ph + 14.0
        ));
    }
    for (k, run) in runs.iter().enumerate() {
        let colour = PALETTE[k % PALETTE.len()];
        let pts: String = cn0s
            .iter()
            .zip(&run.sweep)
            .filter_map(|(c, j)| j.map(|j| format!("{:.1},{:.1} ", xc(*c), yj(j))))
            .collect();
        if !pts.is_empty() {
            s.push_str(&format!(
                "<polyline points=\"{pts}\" fill=\"none\" stroke=\"{colour}\" stroke-width=\"1.5\"/>"
            ));
        }
    }
    s.push_str("</svg>");
    s
}

/// Unit and provenance class for every numeric field the report emits.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "receiver.noise_figure_db", unit: "dB", provenance: Input, definition: "receiver noise figure" },
        FieldUnit { path: "receiver.antenna_temp_k", unit: "K", provenance: Input, definition: "antenna noise temperature" },
        FieldUnit { path: "receiver.system_temp_k", unit: "K", provenance: ClosedForm, definition: "T_ant + 290 K x (F - 1)" },
        FieldUnit { path: "receiver.noise_density_dbw_per_hz", unit: "dBW/Hz", provenance: ClosedForm, definition: "thermal noise floor 10 log10(k T_sys)" },
        FieldUnit { path: "receiver.reference_cn0_dbhz", unit: "dB-Hz", provenance: Input, definition: "total in-band C/N0 used when a signal publishes no received power, and for the equal-C/N0 trade columns" },
        FieldUnit { path: "receiver.loop_bandwidth_hz", unit: "Hz", provenance: Input, definition: "delay lock loop noise bandwidth B_L" },
        FieldUnit { path: "receiver.integration_time_s", unit: "s", provenance: Input, definition: "predetection integration time T" },
        FieldUnit { path: "receiver.correlator_spacings_chips[]", unit: "chip", provenance: Input, definition: "early-late correlator spacings of the jitter sweep, in chips of the tracked component" },
        FieldUnit { path: "receiver.reference_spacing_chips", unit: "chip", provenance: Input, definition: "early-late spacing of the headline ranging accuracy" },
        FieldUnit { path: "receiver.tracking_threshold_dbhz", unit: "dB-Hz", provenance: Input, definition: "C/N0 below which the tracked component is lost" },
        FieldUnit { path: "receiver.cn0_dbhz[]", unit: "dB-Hz", provenance: Input, definition: "total in-band C/N0 values of the jitter sweep" },
        FieldUnit { path: "signals[].centre_hz", unit: "Hz", provenance: Spec, definition: "centre frequency of the signal design (its preset's source class says whether published)" },
        FieldUnit { path: "signals[].tx_bandwidth_hz", unit: "Hz", provenance: Spec, definition: "transmit bandwidth; the spectrum is zero outside it" },
        FieldUnit { path: "signals[].received_power_dbw", unit: "dBW", provenance: Spec, definition: "reference (minimum) received in-band power at the user antenna" },
        FieldUnit { path: "signals[].received_power_max_dbw", unit: "dBW", provenance: Spec, definition: "maximum received power, when published" },
        FieldUnit { path: "signals[].orbit_altitude_m", unit: "m", provenance: Spec, definition: "constellation orbit altitude given by the preset" },
        FieldUnit { path: "signals[].in_band_power_fraction", unit: "1", provenance: Computed, definition: "fraction eta of the unfiltered power inside the transmit band, sum of share x component fraction" },
        FieldUnit { path: "signals[].reference_cn0_dbhz", unit: "dB-Hz", provenance: Computed, definition: "total in-band C/N0: received power minus the noise density, or the receiver's reference C/N0" },
        FieldUnit { path: "signals[].components[].chip_rate_hz", unit: "Hz", provenance: Spec, definition: "spreading-code chip rate; null for a flat (OFDM-like) spectrum" },
        FieldUnit { path: "signals[].components[].power_fraction", unit: "1", provenance: Spec, definition: "component share of the unfiltered power" },
        FieldUnit { path: "signals[].components[].fdma_offsets_hz[]", unit: "Hz", provenance: Spec, definition: "frequency-division multiple access sub-carrier offsets from the band centre" },
        FieldUnit { path: "signals[].components[].fdma_shares[]", unit: "1", provenance: Spec, definition: "power share of each sub-carrier" },
        FieldUnit { path: "signals[].components[].code_length_chips", unit: "chip", provenance: Spec, definition: "spreading-code length" },
        FieldUnit { path: "signals[].components[].code_period_s", unit: "s", provenance: ClosedForm, definition: "code length over chip rate" },
        FieldUnit { path: "signals[].components[].data_rate_sps", unit: "symbol/s", provenance: Spec, definition: "data (symbol) rate" },
        FieldUnit { path: "signals[].components[].first_null_hz", unit: "Hz", provenance: Computed, definition: "first positive null of the unfiltered unit-area PSD, located numerically (half the width for a flat spectrum)" },
        FieldUnit { path: "signals[].components[].in_band_power_fraction", unit: "1", provenance: Computed, definition: "fraction of the component's power the transmit band passes, integrated numerically over every sub-carrier" },
        FieldUnit { path: "signals[].components[].in_band_power_fraction_closed_form", unit: "1", provenance: ClosedForm, definition: "BPSK closed form (2/pi)[Si(pi B Tc) - sin^2(pi B Tc/2)/(pi B Tc/2)], for a BPSK component at the centre; null otherwise" },
        FieldUnit { path: "signals[].components[].gabor_bandwidth_hz", unit: "Hz", provenance: Computed, definition: "RMS (Gabor) bandwidth of the component's baseband spectrum inside the transmit band" },
        FieldUnit { path: "signals[].components[].gabor_bandwidth_closed_form_hz", unit: "Hz", provenance: ClosedForm, definition: "BPSK closed form sqrt([B/2 - sin(pi B Tc)/(2 pi Tc)]/(pi^2 Tc eta)); null otherwise" },
        FieldUnit { path: "signals[].tracking.component_cn0_offset_db", unit: "dB", provenance: ClosedForm, definition: "10 log10(share/eta): the tracked component's C/N0 relative to the total in-band C/N0, in the convention the tracking formula takes" },
        FieldUnit { path: "signals[].tracking.chip_length_m", unit: "m", provenance: ClosedForm, definition: "c / chip rate" },
        FieldUnit { path: "signals[].tracking.spacings_chips[]", unit: "chip", provenance: Input, definition: "early-late spacings, one row of jitter_m each" },
        FieldUnit { path: "signals[].tracking.cn0_dbhz[]", unit: "dB-Hz", provenance: Input, definition: "total in-band C/N0, one column of jitter_m each" },
        FieldUnit { path: "signals[].tracking.jitter_m[][]", unit: "m", provenance: Computed, definition: "band-limited early-late code-tracking thermal-noise jitter (Betz & Kolodziejski 2009), 1-sigma, per spacing and C/N0" },
        FieldUnit { path: "signals[].tracking.jitter_unlimited_band_m[][]", unit: "m", provenance: ClosedForm, definition: "the same with an unlimited front end, the textbook BPSK form sqrt(B_L(1 - B_L T/2) d/(2 C/N0)) chips (with the non-coherent squaring loss when selected); null for non-BPSK" },
        FieldUnit { path: "signals[].tracking.small_spacing_limit_m[]", unit: "m", provenance: ClosedForm, definition: "vanishing-spacing (Gabor bandwidth) bound on the coherent early-late jitter, per C/N0" },
        FieldUnit { path: "signals[].tracking.reference_cn0_dbhz", unit: "dB-Hz", provenance: Computed, definition: "C/N0 of the headline ranging accuracy" },
        FieldUnit { path: "signals[].tracking.reference_spacing_chips", unit: "chip", provenance: Input, definition: "spacing of the headline ranging accuracy" },
        FieldUnit { path: "signals[].tracking.ranging_accuracy_m", unit: "m", provenance: Computed, definition: "code-tracking thermal-noise ranging accuracy (1-sigma) at the reference C/N0 and spacing" },
        FieldUnit { path: "signals[].acquisition.orbit_altitude_m", unit: "m", provenance: Input, definition: "orbit altitude of the Doppler bound (preset or acquisition.altitude_km)" },
        FieldUnit { path: "signals[].acquisition.elevation_mask_deg", unit: "deg", provenance: Input, definition: "elevation mask of the Doppler bound" },
        FieldUnit { path: "signals[].acquisition.max_doppler_satellite_hz", unit: "Hz", provenance: ClosedForm, definition: "largest satellite Doppler on an overhead pass at the mask, circular orbit, no Earth rotation" },
        FieldUnit { path: "signals[].acquisition.oscillator_doppler_hz", unit: "Hz", provenance: ClosedForm, definition: "carrier x oscillator uncertainty" },
        FieldUnit { path: "signals[].acquisition.user_doppler_hz", unit: "Hz", provenance: ClosedForm, definition: "carrier x user speed / c" },
        FieldUnit { path: "signals[].acquisition.search_half_range_hz", unit: "Hz", provenance: Computed, definition: "half-width of the Doppler search: satellite + oscillator + user" },
        FieldUnit { path: "signals[].acquisition.doppler_bin_hz", unit: "Hz", provenance: ClosedForm, definition: "Doppler bin width 2/(3 T_coh)" },
        FieldUnit { path: "signals[].acquisition.doppler_bins", unit: "count", provenance: Computed, definition: "Doppler bins across the search range" },
        FieldUnit { path: "signals[].acquisition.code_bin_chips", unit: "chip", provenance: Input, definition: "code-bin spacing" },
        FieldUnit { path: "signals[].acquisition.code_bins", unit: "count", provenance: Computed, definition: "code bins over one code period; null without a code length" },
        FieldUnit { path: "signals[].acquisition.cells", unit: "count", provenance: Computed, definition: "Doppler bins x code bins" },
        FieldUnit { path: "signals[].acquisition.coherent_s", unit: "s", provenance: Input, definition: "coherent integration per look" },
        FieldUnit { path: "signals[].acquisition.noncoherent", unit: "count", provenance: Input, definition: "non-coherent looks per dwell" },
        FieldUnit { path: "signals[].acquisition.dwell_s", unit: "s", provenance: Computed, definition: "dwell per cell (serial) or per Doppler bin (code-parallel)" },
        FieldUnit { path: "signals[].acquisition.acquisition_cn0_dbhz", unit: "dB-Hz", provenance: Computed, definition: "C/N0 of the acquired component's in-band power" },
        FieldUnit { path: "signals[].acquisition.coherent_snr_db", unit: "dB", provenance: Computed, definition: "C/N0 x T_coh" },
        FieldUnit { path: "signals[].acquisition.pfa_cell", unit: "1", provenance: Input, definition: "false-alarm probability per cell" },
        FieldUnit { path: "signals[].acquisition.pfa_dwell_code_parallel", unit: "1", provenance: Computed, definition: "false-alarm probability of one code-parallel dwell over every code bin" },
        FieldUnit { path: "signals[].acquisition.threshold_over_noise", unit: "1", provenance: Computed, definition: "square-law threshold over the noise power for the per-cell false-alarm probability" },
        FieldUnit { path: "signals[].acquisition.pd_no_straddle", unit: "1", provenance: Computed, definition: "detection probability with the signal centred in its cell (generalised Marcum Q)" },
        FieldUnit { path: "signals[].acquisition.pd_worst_straddle", unit: "1", provenance: Computed, definition: "detection probability at a quarter-bin code offset and a half-bin Doppler offset" },
        FieldUnit { path: "signals[].acquisition.mean_time_serial_s", unit: "s", provenance: Computed, definition: "mean acquisition time of a serial single-dwell search at the worst-case straddle (Holmes)" },
        FieldUnit { path: "signals[].acquisition.mean_time_code_parallel_s", unit: "s", provenance: Computed, definition: "mean acquisition time when every code phase is tested at once per Doppler bin" },
        FieldUnit { path: "signals[].compatibility[].gnss_centre_hz", unit: "Hz", provenance: Spec, definition: "GNSS signal carrier" },
        FieldUnit { path: "signals[].compatibility[].gnss_rx_bandwidth_hz", unit: "Hz", provenance: ModelledInput, definition: "GNSS receiver bandwidth of the SSC integral" },
        FieldUnit { path: "signals[].compatibility[].gnss_received_power_dbw", unit: "dBW", provenance: Spec, definition: "GNSS minimum received power from its interface specification" },
        FieldUnit { path: "signals[].compatibility[].ssc_leo_into_gnss_db_per_hz", unit: "dB(1/Hz)", provenance: Computed, definition: "SSC of the band-limited LEO signal (unit power) into the GNSS signal over the GNSS receiver band; null when the bands do not overlap" },
        FieldUnit { path: "signals[].compatibility[].gnss_cn0_degradation_db", unit: "dB", provenance: Computed, definition: "GNSS C/N0 loss 10 log10(1 + P_leo kappa / N0) from one LEO satellite at its reference received power" },
        FieldUnit { path: "signals[].compatibility[].ssc_gnss_into_leo_db_per_hz", unit: "dB(1/Hz)", provenance: Computed, definition: "SSC of the GNSS signal (unit power) into the LEO tracked component over the LEO receiver band" },
        FieldUnit { path: "signals[].compatibility[].leo_cn0_degradation_db", unit: "dB", provenance: Computed, definition: "LEO C/N0 loss from the GNSS signal at its minimum power, times the aggregate satellite count" },
        FieldUnit { path: "signals[].jammer_tolerance.reference_cn0_dbhz", unit: "dB-Hz", provenance: Computed, definition: "total in-band C/N0 the tolerance starts from" },
        FieldUnit { path: "signals[].jammer_tolerance.tracking_threshold_dbhz", unit: "dB-Hz", provenance: Input, definition: "threshold the tolerance runs to" },
        FieldUnit { path: "signals[].jammer_tolerance.cw_js_max_db", unit: "dB", provenance: Computed, definition: "largest J/S of a CW tone at the carrier before the tracked component reaches the threshold (J over the tracked power)" },
        FieldUnit { path: "signals[].jammer_tolerance.wideband_js_max_db", unit: "dB", provenance: Computed, definition: "the same for flat noise over the transmit band" },
        FieldUnit { path: "signals[].jammer_tolerance.matched_js_max_db", unit: "dB", provenance: Computed, definition: "the same for noise matched to the tracked component's spectrum" },
        FieldUnit { path: "signals[].psd.offset_hz[]", unit: "Hz", provenance: Computed, definition: "offset from the centre of each PSD sample" },
        FieldUnit { path: "signals[].psd.db_per_hz[]", unit: "dB(1/Hz)", provenance: Computed, definition: "band-limited composite PSD, unit area inside the transmit band; null outside it" },
        FieldUnit { path: "trade.slant_tec_tecu", unit: "TECU", provenance: Input, definition: "slant total electron content, 1 TECU = 1e16 electrons/m^2" },
        FieldUnit { path: "trade.slant_range_km", unit: "km", provenance: Input, definition: "slant range of the free-space loss" },
        FieldUnit { path: "trade.rows[].centre_hz", unit: "Hz", provenance: Spec, definition: "centre frequency" },
        FieldUnit { path: "trade.rows[].tx_bandwidth_hz", unit: "Hz", provenance: Spec, definition: "transmit bandwidth" },
        FieldUnit { path: "trade.rows[].iono_delay_m", unit: "m", provenance: ClosedForm, definition: "first-order ionospheric group delay 40.3 TEC / f^2" },
        FieldUnit { path: "trade.rows[].iono_delay_ratio", unit: "1", provenance: ClosedForm, definition: "ionospheric delay over the reference signal's, (f_ref/f)^2" },
        FieldUnit { path: "trade.rows[].free_space_loss_db", unit: "dB", provenance: ClosedForm, definition: "free-space path loss 20 log10(4 pi d f / c) at the slant range" },
        FieldUnit { path: "trade.rows[].free_space_loss_vs_reference_db", unit: "dB", provenance: ClosedForm, definition: "free-space loss minus the reference signal's, 20 log10(f/f_ref)" },
        FieldUnit { path: "trade.rows[].gabor_bandwidth_hz", unit: "Hz", provenance: Computed, definition: "Gabor bandwidth of the tracked component inside the transmit band" },
        FieldUnit { path: "trade.rows[].jitter_equal_cn0_m", unit: "m", provenance: Computed, definition: "ranging accuracy at the receiver's reference C/N0 for every signal" },
        FieldUnit { path: "trade.rows[].cn0_equal_eirp_dbhz", unit: "dB-Hz", provenance: Computed, definition: "C/N0 if every signal left the satellite at the reference signal's EIRP with isotropic antennas: reference C/N0 minus the free-space loss difference" },
        FieldUnit { path: "trade.rows[].jitter_equal_eirp_m", unit: "m", provenance: Computed, definition: "ranging accuracy at that C/N0" },
        FieldUnit { path: "trade.rows[].cw_js_max_equal_eirp_db", unit: "dB", provenance: Computed, definition: "CW J/S tolerance at the equal-EIRP C/N0" },
        FieldUnit { path: "trade.rows[].wideband_js_max_equal_eirp_db", unit: "dB", provenance: Computed, definition: "wideband-noise J/S tolerance at the equal-EIRP C/N0" },
        FieldUnit { path: "trade.rows[].matched_js_max_equal_eirp_db", unit: "dB", provenance: Computed, definition: "matched-noise J/S tolerance at the equal-EIRP C/N0" },
        FieldUnit { path: "shape_checks[].items[].measured_db", unit: "dB", provenance: InternalConsistency, definition: "centre PSD over the PSD at the reference offset" },
        FieldUnit { path: "shape_checks[].items[].required_min_db", unit: "dB", provenance: Input, definition: "minimum central-peak excess of the target" },
        FieldUnit { path: "shape_checks[].items[].ref_offset_hz", unit: "Hz", provenance: Input, definition: "offset the central peak is compared with" },
        FieldUnit { path: "shape_checks[].items[].expected_offset_hz", unit: "Hz", provenance: Input, definition: "null offset of the target" },
        FieldUnit { path: "shape_checks[].items[].found_offset_hz", unit: "Hz", provenance: InternalConsistency, definition: "offset of the model's minimum (null) or maximum (sidelobe) in the window" },
        FieldUnit { path: "shape_checks[].items[].depth_db", unit: "dB", provenance: InternalConsistency, definition: "null depth below the PSD two tolerances either side; null when the model's null is exact (unbounded)" },
        FieldUnit { path: "shape_checks[].items[].required_depth_db", unit: "dB", provenance: Input, definition: "minimum null depth" },
        FieldUnit { path: "shape_checks[].items[].tolerance_hz", unit: "Hz", provenance: Input, definition: "null position tolerance" },
        FieldUnit { path: "shape_checks[].items[].window_hz[]", unit: "Hz", provenance: Input, definition: "sidelobe search window" },
        FieldUnit { path: "shape_checks[].items[].below_centre_db", unit: "dB", provenance: InternalConsistency, definition: "centre PSD minus the sidelobe maximum" },
        FieldUnit { path: "shape_checks[].items[].allowed_db[]", unit: "dB", provenance: Input, definition: "allowed range of the sidelobe level below the centre" },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> serde_json::Value {
        let scn: LeoSignalScenario = toml::from_str(src).expect("parses");
        let (json, _, svg) = scn.run_all().expect("runs");
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        serde_json::from_str(&json).expect("json")
    }

    // ── Every compiled-in preset parses, resolves and names a URL ──────────────
    #[test]
    fn every_public_preset_parses_and_cites_a_url() {
        for name in preset_names() {
            let p = preset(name).unwrap_or_else(|e| panic!("{e}"));
            assert!(p.preset.url.starts_with("https://"), "{name}: url");
            assert_ne!(
                p.preset.source,
                SourceClass::Workshop,
                "{name}: compiled-in presets are public"
            );
            assert!(!p.signals.is_empty());
            for s in &p.signals {
                SignalDesign::from_cfg(s).unwrap_or_else(|e| panic!("{name}: {e}"));
                assert_ne!(s.source, SourceClass::Workshop, "{name}/{}", s.name);
            }
        }
        assert!(public_signal("xona-x5").is_some());
        assert!(public_signal("no-such-signal").is_none());
    }

    // ── ORACLE: max LEO Doppler reproduces the published Xona and Iridium figures ──
    // Xona Pulsar X1 (1593.3225 MHz, ~1080 km): maximum Doppler 32 to 34 kHz (Leclère,
    // Marathe & Reid, ION GNSS+ 2025, arXiv 2509.19551). Iridium (1616 to 1626 MHz,
    // ~780 km): Doppler up to ±36 kHz (RNTF, "Recent PNT Improvements and Test Results
    // Based on Low Earth Orbit Satellites"). Both from the preset files' own carrier and
    // altitude, mask 0°, no Earth rotation (which shifts the figure by up to ±2.3 kHz).
    #[test]
    fn max_doppler_matches_published_xona_and_iridium_figures() {
        let x1 = public_signal("xona-x1").unwrap();
        let fd = max_doppler_hz(x1.centre_hz, x1.orbit_altitude_m.unwrap(), 0.0);
        assert!(
            (32_000.0..=34_000.0).contains(&fd),
            "Xona X1 max Doppler {fd:.0} Hz"
        );
        let ir = public_signal("iridium-stl").unwrap();
        let fd = max_doppler_hz(ir.centre_hz, ir.orbit_altitude_m.unwrap(), 0.0);
        assert!(
            (fd - 36_000.0).abs() < 500.0,
            "Iridium max Doppler {fd:.0} Hz"
        );
    }

    // ── Detection probability: no signal is the false-alarm rate; more SNR detects ──
    #[test]
    fn detector_reduces_to_pfa_and_grows_with_snr() {
        for n in [1u64, 4] {
            let g = threshold_for_pfa(1e-3, n);
            assert!((gamma_tail(n, g) - 1e-3).abs() < 1e-9);
            assert!((detection_probability(0.0, n, g) - 1e-3).abs() < 1e-9);
            let p1 = detection_probability(5.0, n, g);
            let p2 = detection_probability(20.0, n, g);
            assert!(p2 > p1 && p1 > 1e-3 && p2 <= 1.0);
        }
        // N = 1 closed form: P_d = Q1(sqrt(2 snr), sqrt(2 gamma)); at gamma = 0 it is 1.
        assert!((detection_probability(3.0, 1, 0.0) - 1.0).abs() < 1e-12);
        // N = 1, snr = 0: exp(-gamma).
        assert!((gamma_tail(1, 2.0) - (-2.0f64).exp()).abs() < 1e-15);
    }

    // ── Holmes mean time: a sure detector with no false alarm takes (q+1)/2 dwells ──
    #[test]
    fn mean_time_of_a_perfect_detector_is_half_the_cells() {
        let t = mean_acquisition_time_s(101.0, 1.0, 0.0, 10.0, 1e-3);
        assert!((t - 51.0e-3).abs() < 1e-12, "{t}");
    }

    // ── The spectrum band of a design reproduces its in-band PSD and tracked power ─
    #[test]
    fn to_spectrum_band_is_consistent_with_the_design() {
        let d = public_signal("xona-x5").unwrap();
        let eta = d.in_band_fraction();
        let b = d.to_spectrum_band("x5", -140.0).unwrap();
        for f in [-9e6, -3e6, 0.0, 1e6, 7e6] {
            assert!((b.unit_psd(f) - d.psd_in_band(f, eta)).abs() < 1e-18);
        }
        let t = d.tracked_index().unwrap();
        assert!(
            (b.tracked_power_dbw() - (-140.0 + d.component_cn0_offset_db(t, eta))).abs() < 1e-9
        );
    }

    // ── Jammer tolerance: a CW tone at the BPSK peak is the worst, per the SSCs ────
    #[test]
    fn jammer_tolerance_orders_cw_matched_wideband() {
        let d = public_signal("generic-l").unwrap();
        let eta = d.in_band_fraction();
        let t = d.tracked_index().unwrap();
        let (cw, wide, matched) = jammer_tolerance(&d, t, eta, 45.0, 25.0).unwrap();
        let (cw, wide, matched) = (cw.unwrap(), wide.unwrap(), matched.unwrap());
        assert!(
            cw < matched && matched < wide,
            "cw {cw} matched {matched} wide {wide}"
        );
        // Below threshold: none.
        let (a, b, c) = jammer_tolerance(&d, t, eta, 20.0, 25.0).unwrap();
        assert!(a.is_none() && b.is_none() && c.is_none());
    }

    // ── LEO into GNSS: an E5-centred BPSK(10) overlaps E5a and E5b symmetrically ──
    #[test]
    fn e5_centred_signal_hits_e5a_and_e5b_equally() {
        let d = public_signal("generic-l").unwrap();
        let eta = d.in_band_fraction();
        let a = ssc_leo_into_gnss(&d, eta, &gnss_victim("galileo-e5a").unwrap());
        let b = ssc_leo_into_gnss(&d, eta, &gnss_victim("galileo-e5b").unwrap());
        assert!(a > 0.0 && (lin_db(a) - lin_db(b)).abs() < 0.05, "{a} {b}");
        // Far from L1: no overlap.
        assert_eq!(
            ssc_leo_into_gnss(&d, eta, &gnss_victim("gps-l1ca").unwrap()),
            0.0
        );
    }

    // ── The default scenario (generic bands, no preset asked for) runs ────────────
    #[test]
    fn defaults_run_on_the_generic_band_preset() {
        let v = run("kind = \"leo-signal\"\n");
        assert_eq!(v["kind"], "leo-signal");
        assert!(v["signals"].as_array().unwrap().len() >= 5);
        assert_eq!(v["sources"][0]["preset"], "generic-bands");
    }

    // ── Detection probability with several non-coherent looks, against an independent
    // evaluation of the non-central chi-square tail. With N looks of unit-power complex
    // noise and per-look coherent SNR `snr`, the detector statistic is half a
    // non-central chi-square with 2N degrees of freedom and non-centrality 2N·snr, so
    // P_d = P(χ'²(2N, 2N·snr) > 2γ). Reference values from SciPy 1.x
    // (`scipy.special.gammainccinv(N, 1e-3)` for γ, `scipy.stats.ncx2.sf(2γ, 2N, 2N·snr)`
    // for P_d). The N = 1 test above cannot see an error in how the looks combine.
    #[test]
    fn detection_probability_with_several_looks_matches_the_noncentral_chi_square() {
        let g4 = threshold_for_pfa(1e-3, 4);
        assert!((g4 - 13.062_240_779_188_071).abs() < 1e-9, "{g4}");
        for (snr, want) in [
            (1.0, 0.084_925_087_405_210_85),
            (2.0, 0.368_805_341_807_539_77),
            (5.0, 0.966_470_579_217_159_8),
        ] {
            let pd = detection_probability(snr, 4, g4);
            assert!((pd - want).abs() < 1e-9, "N 4, snr {snr}: {pd} vs {want}");
        }
        let g1 = threshold_for_pfa(1e-3, 1);
        let pd = detection_probability(5.0, 1, g1);
        assert!((pd - 0.342_062_813_861_983).abs() < 1e-9, "N 1: {pd}");
    }

    // ── The compatibility SSCs pin their magnitudes, not only their symmetry ──────
    // A BPSK(10) signal at the Galileo E5 centre (1191.795 MHz, 51.15 MHz transmit band)
    // against Galileo E5a (BPSK(10) at 1176.45 MHz, 20.46 MHz receiver band), 15.345 MHz
    // apart. LEO into E5a: ∫ over the overlap of G(f − f_L)·G(f − f_V) / η, η the in-band
    // fraction; E5a into LEO: the same product over the whole transmit band, unfiltered.
    // Reference values by adaptive quadrature in SciPy (`scipy.integrate.quad`, relative
    // tolerance 1e-13, split at every spectral null): η = 0.959157, −86.2139 dB/Hz and
    // −83.5744 dB/Hz. The second sits within 0.011 dB of the infinite-band offset closed
    // form, −83.5636 dB/Hz, as it should for a band this wide.
    #[test]
    fn compatibility_ssc_magnitudes_match_independent_quadrature() {
        let cfg: SignalCfg = toml::from_str(
            r#"
name = "e5-centred-bpsk10"
source = "REPRESENTATIVE"
centre_mhz = 1191.795
tx_bandwidth_mhz = 51.15
allocation = "rnss"
[[components]]
role = "pilot"
modulation = "BPSK(10)"
"#,
        )
        .unwrap();
        let d = SignalDesign::from_cfg(&cfg).unwrap();
        let eta = d.in_band_fraction();
        assert!((eta - 0.959_157_381_468_747).abs() < 1e-7, "{eta}");
        let v = gnss_victim("galileo-e5a").unwrap();
        let into = lin_db(ssc_leo_into_gnss(&d, eta, &v));
        assert!((into - (-86.213_914_5)).abs() < 0.01, "LEO into E5a {into}");
        let from = lin_db(ssc_gnss_into_leo(&d, 0, &v));
        assert!((from - (-83.574_350_9)).abs() < 0.01, "E5a into LEO {from}");
    }

    // ── Inline signals, bad inputs refused ──────────────────────────────────────
    #[test]
    fn inline_signal_and_bad_inputs() {
        let ok = r#"
kind = "leo-signal"
[[signals]]
name = "test-s"
source = "REPRESENTATIVE"
centre_mhz = 2492.028
tx_bandwidth_mhz = 16.5
allocation = "rdss"
[[signals.components]]
role = "pilot"
modulation = "BPSK(5)"
power_fraction = 0.5
code_length_chips = 5115
[[signals.components]]
role = "acquisition"
modulation = "BPSK(1/3)"
power_fraction = 0.5
fdma_offsets_mhz = [-5.0, 5.0]
code_length_chips = 341
"#;
        let v = run(ok);
        let s = &v["signals"][0];
        assert_eq!(s["components"][1]["modulation"], "BPSK(1/3)");
        assert_eq!(s["acquisition"]["component"], "acquisition");
        assert!(s["tracking"]["ranging_accuracy_m"].as_f64().unwrap() > 0.0);
        let bad = ok.replace("power_fraction = 0.5\nfdma", "power_fraction = 0.6\nfdma");
        let scn: LeoSignalScenario = toml::from_str(&bad).unwrap();
        assert!(scn.run_all().unwrap_err().contains("sum to"));
        let scn: LeoSignalScenario =
            toml::from_str("kind = \"leo-signal\"\npresets = [\"nope\"]\n").unwrap();
        assert!(scn.run_all().unwrap_err().contains("unknown signal preset"));
    }
}
