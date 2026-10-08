// SPDX-License-Identifier: AGPL-3.0-only
//! The `leo-pass` scenario kind: a LEO (low Earth orbit) satellite pass and its link budget,
//! band by band, next to the MEO (medium Earth orbit) GNSS (global navigation satellite
//! system) satellites in view.
//!
//! A user (ground, maritime, air or indoor) watches one or more LEO satellites over a window.
//! The satellites come from any of four sources: a **designed pass** (a circular orbit placed
//! so the user sees one pass of a chosen maximum elevation at a chosen time), explicit
//! **elements**, a **TLE** (two-line element set) through the engine's SGP4 (Simplified General
//! Perturbations 4) propagator, or a **Walker constellation** built by
//! the `constellation-design` code ([`crate::constellation::ConstellationCfg`]). Bands come from
//! a named preset in [`crate::leo_link::presets`] or are written into the scenario; the engine
//! needs no preset at all.
//!
//! For every satellite, band and epoch the report gives the look angles, range, range rate and
//! range acceleration; the free-space path loss; the transmit EIRP (effective isotropic
//! radiated power) and the satellite pattern gain toward the user (isoflux, Gaussian beam or
//! flat); the user antenna gain against elevation (patch, hemispherical or isotropic); gaseous
//! attenuation (ITU-R P.676, ITU-R being the International Telecommunication Union
//! Radiocommunication Sector), rain
//! attenuation (ITU-R P.838 and P.618), tropospheric scintillation (ITU-R P.618), building entry
//! loss for an indoor user (ITU-R P.2109) and polarisation mismatch; the system noise
//! temperature and the resulting C/N0 (carrier-to-noise density); the Doppler shift and Doppler
//! rate; and the first-order ionospheric group delay from a slant TEC (total electron content).
//! Band pairs get the ionosphere-free combination's coefficients and noise amplification. MEO
//! GNSS satellites from a published constellation preset are evaluated with the same user
//! antenna and noise model from their interface-document received power, so the LEO pass and
//! the GNSS carriers share one plot. An optional `[iot]` section adds time to first fix, energy
//! per fix and battery life against duty cycle.
//!
//! ## Labels
//!
//! **MODELLED** as a whole: the satellite EIRPs and patterns of every preset are published
//! received powers turned into an EIRP, or representative choices, never a measured pattern.
//! The component models that pin a published oracle are VALIDATED in the verification matrix:
//! the free-space loss, the ITU-R P.838 coefficients, the P.618 rain and scintillation
//! procedures, the P.2109 building entry loss, the first-order ionospheric scaling and the
//! static-user Doppler envelope against the Pulsar paper's Table 1.

use crate::constellation::{ConstellationCfg, Elements};
use crate::frames::Geodetic;
use crate::leo_link::antenna::{polarisation_loss_db, Polarisation, SatPattern, UserAntenna};
use crate::leo_link::energy::{
    duty_curve, fix_budget, DutyPoint, FixBudget, IotReceiver, IotSignal,
};
use crate::leo_link::geometry::{
    design_pass, doppler_hz, doppler_rate_hz_s, link_geometry, max_elevation,
    max_static_user_range_rate, numerical_check, sun_synchronous_inclination_rad, PassDirection,
    PassRequest, SatMotion, UserMotion,
};
use crate::leo_link::itu::{
    p2109_building_entry_loss_db, p618_rain_attenuation_db, p618_scintillation_db,
    p676_gaseous_attenuation_db, wet_refractivity, BuildingClass, Meteo, RainPath,
    ScintillationPath,
};
use crate::leo_link::presets::{self, gnss_meo, BandPreset, SystemPreset};
use crate::leo_link::{cn0_dbhz, fspl_db, iono, system_noise_temperature_k, RE_EARTH};
use crate::palette::chart::{
    AMBER, AXIS, BLUE, CORAL, CYAN, GRID, INK_2, INK_3, INK_4, LIME, MAGENTA, MUTED,
};
use serde::{Deserialize, Serialize};

/// Mean Earth radius for the pattern geometry and the Doppler envelope (m), the value the
/// Pulsar paper's Table 1 uses.
const RE_MEAN_M: f64 = 6_371_000.0;
/// Mean radiating temperature of the atmosphere for sky noise (K), ITU-R P.618-14 § 3.
const T_MR_K: f64 = 275.0;

// ── Scenario input ────────────────────────────────────────────────────────────────────────

/// The user.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct UserCfg {
    /// `ground` (default), `maritime`, `air` or `indoor`.
    #[serde(default)]
    pub environment: Option<String>,
    /// Geodetic latitude (deg). Default 48.1.
    #[serde(default)]
    pub lat_deg: Option<f64>,
    /// Longitude (deg east). Default 11.6.
    #[serde(default)]
    pub lon_deg: Option<f64>,
    /// Height above the ellipsoid (m). Default 0 (ground, indoor), 10 (maritime), 10000 (air).
    #[serde(default)]
    pub height_m: Option<f64>,
    /// Ground speed (m/s). Default 0, 8 (maritime), 230 (air).
    #[serde(default)]
    pub speed_m_s: Option<f64>,
    /// Heading clockwise from north (deg). Default 90.
    #[serde(default)]
    pub heading_deg: Option<f64>,
    /// Elevation mask (deg). Default 5.
    #[serde(default)]
    pub mask_deg: Option<f64>,
    /// `patch` (default), `hemispherical` or `isotropic`.
    #[serde(default)]
    pub antenna: Option<String>,
    /// Patch zenith gain (dBic). Default 3.
    #[serde(default)]
    pub zenith_gain_dbi: Option<f64>,
    /// Patch cosine-power exponent. Default 1.1.
    #[serde(default)]
    pub rolloff_exponent: Option<f64>,
    /// Patch floor (dBic). Default −10.
    #[serde(default)]
    pub min_gain_dbi: Option<f64>,
    /// Hemispherical gain (dBi). Default 0.
    #[serde(default)]
    pub gain_dbi: Option<f64>,
    /// `rhcp` (default), `lhcp` or `linear`.
    #[serde(default)]
    pub polarisation: Option<String>,
    /// Receive axial ratio (dB). Default 3.
    #[serde(default)]
    pub axial_ratio_db: Option<f64>,
    /// Receiver noise figure (dB). Default 2.
    #[serde(default)]
    pub noise_figure_db: Option<f64>,
    /// Antenna noise floor from the ground and sky outside the atmosphere term (K). Default 100.
    #[serde(default)]
    pub antenna_floor_k: Option<f64>,
    /// Implementation loss (dB). Default 1.
    #[serde(default)]
    pub implementation_loss_db: Option<f64>,
    /// Indoor: `traditional` (default) or `thermally-efficient`.
    #[serde(default)]
    pub building: Option<String>,
    /// Indoor: probability that the building entry loss is not exceeded. Default 0.5.
    #[serde(default)]
    pub building_probability: Option<f64>,
}

/// The atmosphere.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AtmosphereCfg {
    /// Surface pressure (hPa). Default 1013.
    #[serde(default)]
    pub pressure_hpa: Option<f64>,
    /// Surface temperature (°C). Default 15.
    #[serde(default)]
    pub temperature_c: Option<f64>,
    /// Surface water-vapour density (g/m³). Default 7.5.
    #[serde(default)]
    pub water_vapour_g_m3: Option<f64>,
    /// Relative humidity (%) for the wet refractivity when `n_wet` is absent. Default 60.
    #[serde(default)]
    pub humidity_percent: Option<f64>,
    /// Wet term of the surface refractivity (N-units); computed from the meteorology if absent.
    #[serde(default)]
    pub n_wet: Option<f64>,
    /// Rain rate exceeded 0.01 % of an average year, R0.01 (mm/h). Default 0 (clear sky).
    #[serde(default)]
    pub rain_rate_mm_h: Option<f64>,
    /// Rain height h_R (km), the ITU-R P.839 value at the site. Default 3.0.
    #[serde(default)]
    pub rain_height_km: Option<f64>,
    /// Percentage of an average year the rain attenuation is exceeded. Default 0.01.
    #[serde(default)]
    pub rain_exceedance_percent: Option<f64>,
    /// Percentage of time the scintillation fade is exceeded. Default 1.
    #[serde(default)]
    pub scintillation_percent: Option<f64>,
    /// Include the gaseous term. Default true.
    #[serde(default)]
    pub gas: Option<bool>,
    /// Include the scintillation term. Default true.
    #[serde(default)]
    pub scintillation: Option<bool>,
}

/// The ionosphere.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct IonosphereCfg {
    /// `klobuchar` (default), `vtec` or `none`.
    #[serde(default)]
    pub model: Option<String>,
    /// Klobuchar alpha coefficients. Default: the IS-GPS-200 example set.
    #[serde(default)]
    pub alpha: Option<[f64; 4]>,
    /// Klobuchar beta coefficients.
    #[serde(default)]
    pub beta: Option<[f64; 4]>,
    /// Vertical TEC (TECU) for the `vtec` model. Default 20.
    #[serde(default)]
    pub vtec_tecu: Option<f64>,
    /// Single-layer shell height for the `vtec` model (km). Default 350.
    #[serde(default)]
    pub shell_height_km: Option<f64>,
    /// Chapman peak height (km) for the fraction of TEC below a LEO satellite. Default 350.
    #[serde(default)]
    pub peak_height_km: Option<f64>,
    /// Chapman scale height (km). Default 100.
    #[serde(default)]
    pub scale_height_km: Option<f64>,
    /// Fixed fraction of TEC below LEO satellites, overriding the Chapman fraction.
    #[serde(default)]
    pub leo_fraction: Option<f64>,
}

/// A band written into the scenario, adding to or overriding a preset band of the same name.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct BandCfg {
    /// Band name.
    pub name: String,
    /// Carrier (MHz).
    #[serde(default)]
    pub frequency_mhz: Option<f64>,
    /// Peak EIRP (dBW).
    #[serde(default)]
    pub eirp_dbw: Option<f64>,
    /// `isoflux`, `gaussian` or `flat`.
    #[serde(default)]
    pub pattern: Option<String>,
    /// Gaussian half-power beamwidth (deg).
    #[serde(default)]
    pub hpbw_deg: Option<f64>,
    /// Isoflux edge-of-coverage elevation (deg).
    #[serde(default)]
    pub edge_elevation_deg: Option<f64>,
    /// Transmit polarisation.
    #[serde(default)]
    pub polarisation: Option<String>,
    /// Transmit axial ratio (dB).
    #[serde(default)]
    pub axial_ratio_db: Option<f64>,
    /// Chip rate (Mchip/s).
    #[serde(default)]
    pub chip_rate_mcps: Option<f64>,
    /// Code length (chips).
    #[serde(default)]
    pub code_length_chips: Option<f64>,
    /// Transmitted bandwidth (MHz).
    #[serde(default)]
    pub bandwidth_mhz: Option<f64>,
    /// Data rate (bit/s).
    #[serde(default)]
    pub data_rate_bps: Option<f64>,
    /// Whether the band supports code ranging.
    #[serde(default)]
    pub ranging: Option<bool>,
    /// A `leo-signal` design by name (for example `xona-x5`, from the public presets under
    /// `data/leo-signals/`, or a design handed in by the `leo-pnt-chain` kind). The band then
    /// takes the design's centre frequency (unless `frequency_mhz` is given), transmit
    /// bandwidth and tracked-component chip rate; its EIRP is split across the design's
    /// components by their power shares; and every epoch reports the tracked component's
    /// C/N0 and its band-limited code-tracking jitter (Betz & Kolodziejski 2009, the
    /// `leo-signal` kind's formula) as the ranging error.
    #[serde(default)]
    pub signal: Option<String>,
}

/// One LEO satellite.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SatelliteCfg {
    /// Label. Default LEO-1, LEO-2, ...
    #[serde(default)]
    pub id: Option<String>,
    /// Preset system for the bands and orbit defaults. Default `generic-leo`.
    #[serde(default)]
    pub system: Option<String>,
    /// Subset of the system's bands, by name. Default: all.
    #[serde(default)]
    pub bands: Option<Vec<String>>,
    /// Bands added or overridden.
    #[serde(default)]
    pub band: Vec<BandCfg>,
    /// `pass` (default), `elements` or `tle`.
    #[serde(default)]
    pub orbit: Option<String>,
    /// Altitude (km). Default: the system's first shell.
    #[serde(default)]
    pub altitude_km: Option<f64>,
    /// Inclination (deg). Default: the system's first shell (sun-synchronous if it says so).
    #[serde(default)]
    pub inclination_deg: Option<f64>,
    /// Force a sun-synchronous inclination at the altitude.
    #[serde(default)]
    pub sun_synchronous: Option<bool>,
    /// Pass: maximum elevation (deg). Default 75.
    #[serde(default)]
    pub max_elevation_deg: Option<f64>,
    /// Pass: time of closest approach (s). Default: the middle of the window.
    #[serde(default)]
    pub tca_s: Option<f64>,
    /// Pass: `ascending` (default) or `descending`.
    #[serde(default)]
    pub direction: Option<String>,
    /// Pass: ground track east (default) or `west` of the user.
    #[serde(default)]
    pub side: Option<String>,
    /// Elements: eccentricity.
    #[serde(default)]
    pub eccentricity: Option<f64>,
    /// Elements: node longitude at the epoch (deg).
    #[serde(default)]
    pub raan_deg: Option<f64>,
    /// Elements: argument of perigee (deg).
    #[serde(default)]
    pub argp_deg: Option<f64>,
    /// Elements: mean anomaly at the epoch (deg).
    #[serde(default)]
    pub mean_anomaly_deg: Option<f64>,
    /// TLE line 1.
    #[serde(default)]
    pub tle_line1: Option<String>,
    /// TLE line 2.
    #[serde(default)]
    pub tle_line2: Option<String>,
    /// Secular J2 drift for pass and elements orbits. Default true.
    #[serde(default)]
    pub j2: Option<bool>,
}

/// A Walker constellation of LEO satellites, built by the constellation-design code.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoConstellationCfg {
    /// Preset system for the bands (and the shells when `design` is absent).
    #[serde(default)]
    pub system: Option<String>,
    /// Subset of the system's bands.
    #[serde(default)]
    pub bands: Option<Vec<String>>,
    /// Bands added or overridden.
    #[serde(default)]
    pub band: Vec<BandCfg>,
    /// A constellation-design constellation (Walker shells, explicit satellites).
    #[serde(default)]
    pub design: Option<ConstellationCfg>,
    /// Secular J2 drift. Default true.
    #[serde(default)]
    pub j2: Option<bool>,
    /// Most satellites reported, highest pass first. Default 6.
    #[serde(default)]
    pub max_satellites: Option<usize>,
}

/// The MEO GNSS comparison.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct GnssCfg {
    /// Include it. Default true.
    #[serde(default)]
    pub enabled: Option<bool>,
    /// Constellation preset: `galileo` (default), `gps-baseline`, `gps-expandable`.
    #[serde(default)]
    pub constellation: Option<String>,
    /// Signal: E1 (default), E5a, E5b, E6 for Galileo; L1, L5 for GPS.
    #[serde(default)]
    pub band: Option<String>,
    /// Received power above the specified minimum (dB), before range scaling. Default 2.
    #[serde(default)]
    pub excess_power_db: Option<f64>,
    /// Most satellites reported, highest first. Default 8.
    #[serde(default)]
    pub max_satellites: Option<usize>,
}

/// The low-energy receiver.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct IotCfg {
    /// Active power (mW). Default 20.
    #[serde(default)]
    pub active_power_mw: Option<f64>,
    /// Sleep power (µW). Default 5.
    #[serde(default)]
    pub sleep_power_uw: Option<f64>,
    /// Battery capacity (mWh). Default 2000.
    #[serde(default)]
    pub battery_mwh: Option<f64>,
    /// Detection threshold (dB). Default 16.
    #[serde(default)]
    pub detection_snr_db: Option<f64>,
    /// Longest coherent integration (ms). Default 20.
    #[serde(default)]
    pub max_coherent_ms: Option<f64>,
    /// Parallel (FFT) code search. Default true.
    #[serde(default)]
    pub parallel_code_search: Option<bool>,
    /// Correlators for a serial search. Default 64.
    #[serde(default)]
    pub correlators: Option<usize>,
    /// Fix computation time (s). Default 0.1.
    #[serde(default)]
    pub fix_compute_s: Option<f64>,
    /// Doppler uncertainty with an almanac and a coarse position (Hz). Default 500.
    #[serde(default)]
    pub aided_doppler_uncertainty_hz: Option<f64>,
    /// Fix intervals for the duty-cycle curve (s).
    #[serde(default)]
    pub fix_intervals_s: Option<Vec<f64>>,
    /// C/N0 taken from the pass: `median` (default) or `peak`.
    #[serde(default)]
    pub cn0_from: Option<String>,
}

/// A spoofer and the receiver's consistency monitors (`[spoofer]`).
///
/// The spoofer counterfeits the signals a receiver would see at a *claimed* position that
/// leaves the true position at `onset_s` (an initial `offset_m` jump, then `push_rate_m_s`
/// horizontally toward `push_azimuth_deg`), self-consistently in range and range rate. The
/// receiver predicts from its own independent prior position (the true track, with a stated
/// 1-sigma uncertainty) and runs the monitors of [`crate::leo_link::spoof`].
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SpooferCfg {
    /// Spoofing onset (s after the epoch). Default a quarter of the window.
    #[serde(default)]
    pub onset_s: Option<f64>,
    /// Jump of the claimed position at the onset (m). Default 0.
    #[serde(default)]
    pub offset_m: Option<f64>,
    /// Horizontal push speed after the onset (m/s). Default 1.
    #[serde(default)]
    pub push_rate_m_s: Option<f64>,
    /// Direction of the push, clockwise from north (deg). Default 0.
    #[serde(default)]
    pub push_azimuth_deg: Option<f64>,
    /// LEO bands the spoofer counterfeits, by name. Default every band.
    #[serde(default)]
    pub bands: Option<Vec<String>>,
    /// Whether the spoofer also counterfeits the MEO GNSS signal. Default true.
    #[serde(default)]
    pub gnss: Option<bool>,
    /// Whether the spoofer adds the model ionospheric delay to its counterfeit signals (a
    /// ground transmitter's signal crosses no ionosphere). Default false.
    #[serde(default)]
    pub simulate_iono: Option<bool>,
    /// 1-sigma uncertainty of the receiver's independent prior position, per axis (m).
    /// Default 10.
    #[serde(default)]
    pub prior_sigma_m: Option<f64>,
    /// 1-sigma uncertainty of the receiver's independent prior velocity, per axis (m/s).
    /// Default 0.5.
    #[serde(default)]
    pub prior_velocity_sigma_m_s: Option<f64>,
    /// 1-sigma prior on the receiver's clock drift (m/s); absent means unknown, removed as a
    /// nuisance parameter.
    #[serde(default)]
    pub drift_sigma_m_s: Option<f64>,
    /// Length of the Doppler test's window (s): the channels of every epoch in the last
    /// `window_s` share one position and velocity error, so an abrupt change inside the
    /// window is seen as well as the error itself. Default one step: the snapshot test.
    #[serde(default)]
    pub window_s: Option<f64>,
    /// Frequency-lock-loop noise bandwidth (Hz). Default 2.
    #[serde(default)]
    pub fll_bandwidth_hz: Option<f64>,
    /// Frequency-lock-loop predetection time (s). Default 0.02.
    #[serde(default)]
    pub fll_integration_s: Option<f64>,
    /// Channels below this C/N0 are not tracked (dB-Hz). Default 25.
    #[serde(default)]
    pub tracking_threshold_dbhz: Option<f64>,
    /// False-alarm probability of each test at each epoch. Default 1e-5.
    #[serde(default)]
    pub p_fa: Option<f64>,
    /// Missed-detection probability: a test is declared to detect at the first epoch its
    /// detection probability reaches `1 − p_md`. Default 1e-3.
    #[serde(default)]
    pub p_md: Option<f64>,
    /// Unmodelled ionospheric rate the cross-band monitor tolerates (m/s). Default 0.01.
    #[serde(default)]
    pub iono_rate_bound_m_s: Option<f64>,
}

/// The `leo-pass` scenario.
#[derive(Clone, Debug, Default, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoPassScenario {
    /// Scenario kind tag.
    #[serde(default)]
    pub kind: Option<String>,
    /// Scenario name.
    #[serde(default)]
    pub name: Option<String>,
    /// Free-text description.
    #[serde(default)]
    pub description: Option<String>,
    /// Epoch, ISO 8601 UTC. Default 2026-09-28T08:00:00.
    #[serde(default)]
    pub epoch: Option<String>,
    /// Window (s). Default 900.
    #[serde(default)]
    pub duration_s: Option<f64>,
    /// Step (s). Default 5.
    #[serde(default)]
    pub step_s: Option<f64>,
    /// The user.
    #[serde(default)]
    pub user: Option<UserCfg>,
    /// The atmosphere.
    #[serde(default)]
    pub atmosphere: Option<AtmosphereCfg>,
    /// The ionosphere.
    #[serde(default)]
    pub ionosphere: Option<IonosphereCfg>,
    /// LEO satellites. Default: one designed pass of the generic preset.
    #[serde(default)]
    pub satellite: Vec<SatelliteCfg>,
    /// LEO constellations.
    #[serde(default)]
    pub leo_constellation: Vec<LeoConstellationCfg>,
    /// The MEO GNSS comparison.
    #[serde(default)]
    pub gnss: Option<GnssCfg>,
    /// Band pairs for the ionosphere-free combination; default every pair of the first
    /// satellite's bands.
    #[serde(default)]
    pub iono_free_pairs: Option<Vec<[String; 2]>>,
    /// The low-energy receiver.
    #[serde(default)]
    pub iot: Option<IotCfg>,
    /// A spoofer and the receiver's consistency monitors.
    #[serde(default)]
    pub spoofer: Option<SpooferCfg>,
    /// Signal designs handed in by a caller (the `leo-pnt-chain` kind), looked up by a band's
    /// `signal` name before the public presets. Not a scenario field.
    #[serde(skip)]
    pub signal_designs: Vec<crate::leo_signal::SignalDesign>,
}

// ── Report ───────────────────────────────────────────────────────────────────────────────

/// A band as used.
#[derive(Clone, Debug, Serialize)]
pub struct BandOut {
    /// Band name, as in the preset or the scenario `[[satellite.band]]`.
    pub name: String,
    /// Carrier frequency (Hz).
    pub frequency_hz: f64,
    /// Peak EIRP toward the pattern maximum (dBW).
    pub eirp_dbw: f64,
    /// Satellite transmit pattern: `isoflux`, `gaussian` or `flat`.
    pub pattern: String,
    /// Transmit polarisation label (for example `rhcp`, `lhcp`, `linear`).
    pub polarisation: String,
    /// Ranging-code chip rate (chip/s).
    pub chip_rate_hz: f64,
    /// Transmitted bandwidth (Hz).
    pub bandwidth_hz: f64,
    /// Navigation-message data rate (bit/s).
    pub data_rate_bps: f64,
    /// Whether the band supports code ranging.
    pub ranging: bool,
    /// Provenance: `<system name> (<PUBLIC|REPRESENTATIVE|WORKSHOP>)` for a preset band, `scenario`
    /// for one written into the scenario.
    pub source: String,
    /// Largest Doppler (Hz) any static user on a 6371 km sphere can see from this orbit at 0°
    /// elevation; absent for a non-circular orbit.
    pub doppler_envelope_hz: Option<f64>,
    /// Highest C/N0 over the epochs above the elevation mask (dB-Hz); absent when the satellite
    /// never clears the mask.
    pub peak_cn0_dbhz: Option<f64>,
    /// Median C/N0 over the epochs above the elevation mask (dB-Hz).
    pub median_cn0_dbhz: Option<f64>,
    /// Lowest C/N0 over the epochs above the elevation mask (dB-Hz).
    pub min_cn0_dbhz: Option<f64>,
    /// Largest absolute carrier Doppler shift over the epochs above the mask (Hz).
    pub max_abs_doppler_hz: Option<f64>,
    /// Largest absolute Doppler rate over the epochs above the mask (Hz/s).
    pub max_abs_doppler_rate_hz_s: Option<f64>,
    /// First-order ionospheric group delay at the epoch of peak C/N0 on this band (m).
    pub iono_delay_at_peak_m: Option<f64>,
    /// The `leo-signal` design the band carries, when it names one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub signal_design: Option<SignalDesignOut>,
    /// Tracked-component C/N0 at the pass peak (dB-Hz), with a signal design.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub peak_tracked_cn0_dbhz: Option<f64>,
    /// Smallest code-tracking jitter over the pass (m, 1-sigma), with a signal design.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub min_code_jitter_m: Option<f64>,
    /// Median code-tracking jitter over the pass (m, 1-sigma), with a signal design.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub median_code_jitter_m: Option<f64>,
    /// Largest code-tracking jitter over the pass (m, 1-sigma), with a signal design.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub max_code_jitter_m: Option<f64>,
}

/// One component of a band's signal design and its share of the EIRP.
#[derive(Clone, Debug, Serialize)]
pub struct EirpShare {
    /// `acquisition`, `data` or `pilot`.
    pub role: String,
    /// Modulation label, e.g. `BPSK(10)`.
    pub modulation: String,
    /// Share of the transmitted power.
    pub share: f64,
    /// The component's EIRP (dBW): the band EIRP plus `10 log10(share)`.
    pub eirp_dbw: f64,
}

/// The `leo-signal` design a band carries.
#[derive(Clone, Debug, Serialize)]
pub struct SignalDesignOut {
    /// Design name, as looked up by the band's `signal`.
    pub name: String,
    /// Provenance of the design: its source reference, or `scenario` when it has none.
    pub source: String,
    /// Role of the component the receiver tracks (`acquisition`, `data` or `pilot`); absent when
    /// the design names none.
    pub tracked_component: Option<String>,
    /// Fraction of the transmitted power inside the transmit bandwidth.
    pub in_band_fraction: f64,
    /// Offset from the band's total C/N0 to the tracked component's (dB).
    pub tracked_cn0_offset_db: f64,
    /// Each component's power share and EIRP.
    pub eirp_split: Vec<EirpShare>,
    /// Delay-lock-loop settings of the jitter: spacing (chips), loop bandwidth (Hz),
    /// predetection time (s), coherent early-late.
    pub dll_spacing_chips: f64,
    /// Delay-lock-loop noise bandwidth used for the jitter (Hz).
    pub dll_loop_bandwidth_hz: f64,
    /// Delay-lock-loop predetection (coherent integration) time used for the jitter (s).
    pub dll_integration_s: f64,
}

/// Per-band terms at one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct BandEpoch {
    /// Carrier-to-noise density of the whole band after every loss and the implementation loss
    /// (dB-Hz).
    pub cn0_dbhz: f64,
    /// Received carrier power at the user antenna output (dBW): EIRP plus pattern and user gains,
    /// less path, atmospheric, building and polarisation losses.
    pub received_power_dbw: f64,
    /// Free-space path loss at this epoch (dB).
    pub fspl_db: f64,
    /// Satellite pattern gain toward the user relative to the pattern peak (dB, zero or negative).
    pub sat_gain_db: f64,
    /// User antenna gain at the satellite's elevation (dBi).
    pub user_gain_dbi: f64,
    /// Gaseous (oxygen and water-vapour) attenuation, ITU-R P.676 (dB); zero when disabled.
    pub gas_db: f64,
    /// Rain attenuation, ITU-R P.838 and P.618 (dB); zero in clear sky or below 1 GHz.
    pub rain_db: f64,
    /// Tropospheric scintillation fade, ITU-R P.618 (dB); zero when disabled.
    pub scintillation_db: f64,
    /// Building entry loss for an indoor user, ITU-R P.2109 (dB); zero outdoors.
    pub building_entry_db: f64,
    /// Polarisation mismatch loss between transmit and receive antennas (dB).
    pub polarisation_db: f64,
    /// System noise temperature at the antenna terminals (K).
    pub tsys_k: f64,
    /// Carrier Doppler shift (Hz), positive when the satellite approaches.
    pub doppler_hz: f64,
    /// Carrier Doppler rate (Hz/s).
    pub doppler_rate_hz_s: f64,
    /// First-order ionospheric group delay on this carrier (m).
    pub iono_delay_m: f64,
    /// Tracked-component C/N0 (dB-Hz), when the band carries a signal design.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub tracked_cn0_dbhz: Option<f64>,
    /// Code-tracking jitter of the tracked component (m, 1-sigma): the ranging error, when
    /// the band carries a signal design.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub code_jitter_m: Option<f64>,
}

/// One epoch of one satellite.
#[derive(Clone, Debug, Serialize)]
pub struct SatEpoch {
    /// Time since the scenario epoch (s).
    pub t_s: f64,
    /// Geodetic elevation of the satellite above the user's local horizon (deg).
    pub elevation_deg: f64,
    /// Azimuth of the satellite, clockwise from true north (deg).
    pub azimuth_deg: f64,
    /// Slant range from user to satellite (m).
    pub range_m: f64,
    /// Range rate (m/s), positive when receding.
    pub range_rate_m_s: f64,
    /// Range acceleration (m/s²).
    pub range_accel_m_s2: f64,
    /// Off-nadir angle at the satellite toward the user (deg), the pattern's input.
    pub nadir_angle_deg: f64,
    /// Slant TEC along the user-satellite path below the satellite (TEC units, 1e16 electrons/m²).
    pub stec_tecu: f64,
    /// Whether the satellite is at or above the elevation mask.
    pub visible: bool,
    /// Per band, in the order of the satellite's `bands`; empty below the mask.
    pub bands: Vec<BandEpoch>,
}

/// The pass as seen from the user.
#[derive(Clone, Debug, Serialize)]
pub struct PassOut {
    /// Maximum elevation of the pass (deg).
    pub max_elevation_deg: f64,
    /// Time of closest approach (maximum elevation), seconds since the epoch.
    pub tca_s: f64,
    /// Acquisition of signal: first epoch at or above the mask, seconds since the epoch; absent if
    /// never visible.
    pub aos_s: Option<f64>,
    /// Loss of signal: last epoch at or above the mask, seconds since the epoch; absent if never
    /// visible.
    pub los_s: Option<f64>,
    /// Time above the elevation mask: visible epochs times the step (s).
    pub duration_above_mask_s: f64,
}

/// Closed form against central differences over the run.
#[derive(Clone, Debug, Serialize)]
pub struct DopplerCheck {
    /// Largest difference between the closed-form and central-difference range rate (m/s).
    pub max_range_rate_diff_m_s: f64,
    /// Largest difference between the closed-form and central-difference range acceleration (m/s²).
    pub max_range_accel_diff_m_s2: f64,
    /// The range-rate difference at the highest band carrier (Hz).
    pub max_doppler_diff_hz: f64,
    /// The range-acceleration difference at the highest band carrier (Hz/s).
    pub max_doppler_rate_diff_hz_s: f64,
}

/// One LEO satellite.
#[derive(Clone, Debug, Serialize)]
pub struct SatOut {
    /// Satellite label.
    pub id: String,
    /// Preset system id, or `none` when the scenario names no system.
    pub system: String,
    /// Provenance class of the preset: `PUBLIC`, `REPRESENTATIVE`, `WORKSHOP`, or `SCENARIO`
    /// without a preset.
    pub source_kind: String,
    /// How the orbit was obtained: `designed pass`, `elements`, `TLE through SGP4` or `Walker
    /// (<source>)`.
    pub orbit_source: String,
    /// Altitude above the equatorial Earth radius at the epoch (m).
    pub altitude_m: f64,
    /// Orbit inclination at the epoch, from the angular-momentum vector (deg).
    pub inclination_deg: f64,
    /// The pass as seen from the user.
    pub pass: PassOut,
    /// Closed-form range rate and acceleration against central differences.
    pub doppler_check: DopplerCheck,
    /// The bands as used, with their pass summaries.
    pub bands: Vec<BandOut>,
    /// Every epoch of the window.
    pub series: Vec<SatEpoch>,
}

/// One GNSS epoch.
#[derive(Clone, Debug, Serialize)]
pub struct GnssEpoch {
    /// Time since the scenario epoch (s).
    pub t_s: f64,
    /// Geodetic elevation above the user's local horizon (deg).
    pub elevation_deg: f64,
    /// C/N0 of the GNSS signal (dB-Hz); absent below the elevation mask.
    pub cn0_dbhz: Option<f64>,
    /// Carrier Doppler shift (Hz), positive when the satellite approaches.
    pub doppler_hz: f64,
}

/// One GNSS satellite.
#[derive(Clone, Debug, Serialize)]
pub struct GnssSatOut {
    /// Satellite id within the constellation preset.
    pub id: String,
    /// Highest elevation over the window (deg).
    pub max_elevation_deg: f64,
    /// Every epoch of the window.
    pub series: Vec<GnssEpoch>,
}

/// The MEO GNSS comparison.
#[derive(Clone, Debug, Serialize)]
pub struct GnssOut {
    /// Constellation preset name (for example `galileo`, `gps-baseline`).
    pub constellation: String,
    /// Signal name (for example `E1`, `L1`).
    pub band: String,
    /// Carrier frequency (Hz).
    pub frequency_hz: f64,
    /// Interface-document minimum received power into a 0 dBi antenna (dBW).
    pub min_power_dbw: f64,
    /// Interface-document maximum received power into a 0 dBi antenna, the cap on the modelled
    /// power (dBW).
    pub max_power_dbw: f64,
    /// Received power assumed above the specified minimum before range scaling (dB).
    pub excess_power_db: f64,
    /// Reference for the specified received powers.
    pub source: String,
    /// Satellites that clear the elevation mask at some epoch, before truncation to
    /// `max_satellites`.
    pub satellites_in_view: usize,
    /// Median C/N0 over every reported satellite and epoch above the mask (dB-Hz).
    pub median_cn0_dbhz: Option<f64>,
    /// Lowest C/N0 over the reported satellites above the mask (dB-Hz).
    pub min_cn0_dbhz: Option<f64>,
    /// Highest C/N0 over the reported satellites above the mask (dB-Hz).
    pub max_cn0_dbhz: Option<f64>,
    /// Largest absolute Doppler shift over the reported satellites above the mask (Hz).
    pub max_abs_doppler_hz: Option<f64>,
    /// Reported satellites, highest maximum elevation first.
    pub satellites: Vec<GnssSatOut>,
}

/// LEO against GNSS in one line.
#[derive(Clone, Debug, Serialize)]
pub struct ComparisonOut {
    /// The first LEO satellite's label.
    pub leo_satellite: String,
    /// Its first band's name.
    pub leo_band: String,
    /// Peak C/N0 of that LEO band over the pass (dB-Hz).
    pub leo_peak_cn0_dbhz: f64,
    /// Median GNSS C/N0 (dB-Hz).
    pub gnss_median_cn0_dbhz: f64,
    /// Highest GNSS C/N0 (dB-Hz).
    pub gnss_max_cn0_dbhz: f64,
    /// LEO peak C/N0 minus GNSS median C/N0 (dB).
    pub leo_peak_above_gnss_median_db: f64,
    /// Time the LEO band's C/N0 exceeds the highest GNSS C/N0 (s).
    pub leo_seconds_above_gnss_max: f64,
    /// Time the LEO satellite is above the elevation mask (s).
    pub leo_pass_duration_s: f64,
}

/// One ionosphere-free band pair.
#[derive(Clone, Debug, Serialize)]
pub struct IonoFreePair {
    /// First band's name.
    pub band_1: String,
    /// Second band's name.
    pub band_2: String,
    /// Ionosphere-free coefficient of the first band, `f₁²/(f₁² − f₂²)` (dimensionless).
    pub a1: f64,
    /// Ionosphere-free coefficient of the second band, `−f₂²/(f₁² − f₂²)` (dimensionless).
    pub a2: f64,
    /// `√(a₁² + a₂²)`: amplification of equal, independent noise.
    pub noise_amplification_equal: f64,
    /// Thermal code noise of each band at the pass peak (m).
    pub code_noise_1_m: Option<f64>,
    /// Thermal code noise of the second band at the pass peak (m); the first band's is
    /// `code_noise_1_m`.
    pub code_noise_2_m: Option<f64>,
    /// Code noise of the combination at the pass peak (m).
    pub iono_free_code_noise_m: Option<f64>,
    /// First-order delay at the peak on each band (m), which the combination removes.
    pub iono_delay_1_m: Option<f64>,
    /// First-order delay at the peak on the second band (m).
    pub iono_delay_2_m: Option<f64>,
    /// Ionosphere sounding: the slant TEC the pair's geometry-free code combination gives at
    /// the peak, `(P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))`, in TEC units (equal to the model's
    /// slant TEC by construction: the combination is exact at first order).
    pub geometry_free_stec_tecu: Option<f64>,
    /// Its 1-sigma from the two bands' code noise at the peak, in TEC units.
    pub geometry_free_stec_sigma_tecu: Option<f64>,
}

/// Low-energy positioning for one signal.
#[derive(Clone, Debug, Serialize)]
pub struct IotRow {
    /// Signal label: `<satellite> <band>` for LEO, `<constellation> <band>` for GNSS.
    pub signal: String,
    /// C/N0 used for the budget, the pass median or peak (dB-Hz).
    pub cn0_dbhz: f64,
    /// Half-width of the Doppler search for a cold start (Hz).
    pub doppler_uncertainty_cold_hz: f64,
    /// Worst-case Doppler rate over the pass, which caps the coherent integration (Hz/s).
    pub doppler_rate_hz_s: f64,
    /// Acquisition, time to first fix and energy for a cold start.
    pub cold: FixBudget,
    /// Acquisition, time to first fix and energy for a hot (almanac-aided) start.
    pub hot: FixBudget,
    /// Hot-start duty cycle, average power and battery life against fix interval.
    pub duty_cycle_hot: Vec<DutyPoint>,
}

/// The low-energy section.
#[derive(Clone, Debug, Serialize)]
pub struct IotOut {
    /// The honesty label.
    pub label: String,
    /// Receiver power while active (mW).
    pub active_power_mw: f64,
    /// Receiver power while asleep (µW).
    pub sleep_power_uw: f64,
    /// Battery capacity (mWh).
    pub battery_mwh: f64,
    /// Receiver assumptions stated with the result.
    pub assumptions: Vec<String>,
    /// One row per LEO band of the first satellite, then the GNSS signal.
    pub rows: Vec<IotRow>,
}

/// The user as used.
#[derive(Clone, Debug, Serialize)]
pub struct UserOut {
    /// `ground`, `maritime`, `air` or `indoor`.
    pub environment: String,
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg east).
    pub lon_deg: f64,
    /// Height above the ellipsoid (m).
    pub height_m: f64,
    /// Ground speed (m/s).
    pub speed_m_s: f64,
    /// Elevation mask (deg).
    pub mask_deg: f64,
    /// User antenna model: `patch`, `hemispherical` or `isotropic`.
    pub antenna: String,
    /// Receiver noise figure (dB).
    pub noise_figure_db: f64,
    /// Implementation loss applied to C/N0 (dB).
    pub implementation_loss_db: f64,
    /// Indoor building class (`traditional` or `thermally-efficient`); absent outdoors.
    pub building: Option<String>,
    /// Indoor probability that the building entry loss is not exceeded; absent outdoors.
    pub building_probability: Option<f64>,
}

/// One consistency test at one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofTestEpoch {
    /// Channels tracked.
    pub n: usize,
    /// Non-centrality of the statistic (zero when authentic); absent with no degree of freedom.
    pub noncentrality: Option<f64>,
    /// Chi-square threshold.
    pub threshold: Option<f64>,
    /// Probability of an alarm at this epoch.
    pub p_detect: Option<f64>,
}

/// One epoch of the spoofing monitors.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofEpoch {
    /// Seconds after the epoch.
    pub t_s: f64,
    /// Horizontal distance of the claimed position from the true one (m).
    pub offset_m: f64,
    /// Doppler test on the MEO GNSS channels alone.
    pub gnss: SpoofTestEpoch,
    /// Doppler test on the LEO channels alone.
    pub leo: SpoofTestEpoch,
    /// Doppler test on every channel.
    pub fused: SpoofTestEpoch,
    /// Largest `|step|` over threshold of the cross-band tests (1 is the alarm line);
    /// absent when no band pair is tracked on consecutive epochs.
    pub cross_band_ratio: Option<f64>,
    /// Largest detection probability of the cross-band tests.
    pub cross_band_p_detect: Option<f64>,
}

/// One cross-band pair over the run.
#[derive(Clone, Debug, Serialize)]
pub struct CrossBandPairOut {
    /// The LEO satellite.
    pub satellite: String,
    /// The pair's first band.
    pub band_1: String,
    /// The pair's second band.
    pub band_2: String,
    /// Whether the spoofer counterfeits the first band.
    pub spoofed_1: bool,
    /// Whether the spoofer counterfeits the second band.
    pub spoofed_2: bool,
    /// Largest `|step|` of the model-corrected geometry-free combination (m).
    pub max_abs_step_m: Option<f64>,
    /// Smallest alarm threshold over the run (m).
    pub min_threshold_m: Option<f64>,
    /// First epoch the detection probability reaches `1 − p_md` (s).
    pub detect_time_s: Option<f64>,
}

/// When each monitor detects.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofDetection {
    /// First epoch at or after the onset with detection probability at least `1 − p_md` (s).
    pub detect_time_s: Option<f64>,
    /// Seconds from the onset to detection.
    pub delay_s: Option<f64>,
    /// Claimed-position offset at detection (m).
    pub offset_at_detection_m: Option<f64>,
}

/// The spoofing section of the report.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofOut {
    /// The honesty label.
    pub label: String,
    /// Spoofing onset (s after the epoch).
    pub onset_s: f64,
    /// Jump of the claimed position at the onset (m).
    pub offset_m: f64,
    /// Horizontal push speed after the onset (m/s).
    pub push_rate_m_s: f64,
    /// Direction of the push, clockwise from north (deg).
    pub push_azimuth_deg: f64,
    /// The LEO bands the spoofer counterfeits.
    pub spoofed_bands: Vec<String>,
    /// Whether the spoofer counterfeits the MEO GNSS signal.
    pub spoofs_gnss: bool,
    /// Whether the counterfeit pseudoranges carry the ionospheric delay.
    pub simulates_iono: bool,
    /// 1-sigma of the receiver's prior position, per axis (m).
    pub prior_sigma_m: f64,
    /// 1-sigma of the receiver's prior velocity, per axis (m/s).
    pub prior_velocity_sigma_m_s: f64,
    /// 1-sigma clock-drift prior (m/s); absent when the drift is a nuisance.
    pub drift_sigma_m_s: Option<f64>,
    /// Frequency-lock-loop noise bandwidth (Hz).
    pub fll_bandwidth_hz: f64,
    /// Frequency-lock-loop predetection time (s).
    pub fll_integration_s: f64,
    /// Channels below this C/N0 are not tracked (dB-Hz).
    pub tracking_threshold_dbhz: f64,
    /// False-alarm probability of each test at each epoch.
    pub p_fa: f64,
    /// Missed-detection probability defining detection.
    pub p_md: f64,
    /// Unmodelled ionospheric rate the cross-band monitor tolerates (m/s).
    pub iono_rate_bound_m_s: f64,
    /// Length of the Doppler test's window as used, a whole number of steps (s).
    pub window_s: f64,
    /// Median range-rate jitter of the tracked LEO channels (m/s, 1-sigma).
    pub median_leo_sigma_m_s: Option<f64>,
    /// Median range-rate jitter of the tracked GNSS channels (m/s, 1-sigma).
    pub median_gnss_sigma_m_s: Option<f64>,
    /// Median size of the LEO range-rate position gradient (range rate per metre, 1/s).
    pub median_leo_gradient_per_s: Option<f64>,
    /// Median size of the GNSS range-rate position gradient (range rate per metre, 1/s).
    pub median_gnss_gradient_per_s: Option<f64>,
    /// Detection by the Doppler test on the GNSS channels.
    pub gnss: SpoofDetection,
    /// Detection by the Doppler test on the LEO channels.
    pub leo: SpoofDetection,
    /// Detection by the Doppler test on every channel.
    pub fused: SpoofDetection,
    /// Detection by the cross-band test.
    pub cross_band: SpoofDetection,
    /// First detection by any monitor.
    pub first: SpoofDetection,
    /// Every LEO band pair over the run.
    pub pairs: Vec<CrossBandPairOut>,
    /// The monitors at every epoch.
    pub series: Vec<SpoofEpoch>,
    /// Assumptions stated with the result.
    pub notes: Vec<String>,
}

/// The `leo-pass` report.
#[derive(Clone, Debug, Serialize)]
pub struct LeoPassReport {
    /// The honesty label.
    pub label: String,
    /// Scenario epoch as given, ISO 8601 UTC.
    pub epoch: String,
    /// Scenario epoch as a Julian date, UTC (days).
    pub epoch_jd_utc: f64,
    /// Window length (s).
    pub duration_s: f64,
    /// Epoch step (s).
    pub step_s: f64,
    /// The user as used.
    pub user: UserOut,
    /// Wet term of the surface refractivity (N-units).
    pub n_wet: f64,
    /// Rain rate exceeded 0.01 % of an average year, R0.01 (mm/h).
    pub rain_rate_mm_h: f64,
    /// Rain height (km).
    pub rain_height_km: f64,
    /// Ionosphere model: `klobuchar`, `vtec` or `none`.
    pub ionosphere_model: String,
    /// Every LEO satellite.
    pub satellites: Vec<SatOut>,
    /// The MEO GNSS comparison, unless disabled.
    pub gnss: Option<GnssOut>,
    /// First LEO band against GNSS, when both have C/N0.
    pub comparison: Option<ComparisonOut>,
    /// Ionosphere-free band pairs on the first LEO satellite.
    pub iono_free: Vec<IonoFreePair>,
    /// The low-energy section, when the scenario has an `[iot]` section.
    pub iot: Option<IotOut>,
    /// The spoofing monitors, when the scenario has a `[spoofer]` section.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub spoof: Option<SpoofOut>,
    /// Caveats stated with the result.
    pub notes: Vec<String>,
}

// ── Resolution helpers ───────────────────────────────────────────────────────────────────

/// Parse `YYYY-MM-DDTHH:MM:SS[.fff][Z]` as a UTC Julian date.
pub fn parse_epoch_jd(s: &str) -> Result<f64, String> {
    let t = s.trim().trim_end_matches('Z');
    let (date, time) = t.split_once('T').unwrap_or((t, "00:00:00"));
    let d: Vec<&str> = date.split('-').collect();
    let h: Vec<&str> = time.split(':').collect();
    if d.len() != 3 || h.len() < 2 {
        return Err(format!("epoch '{s}' is not YYYY-MM-DDTHH:MM:SS"));
    }
    let bad = |_| format!("epoch '{s}' is not YYYY-MM-DDTHH:MM:SS");
    let y: i32 = d[0].parse().map_err(bad)?;
    let mo: u32 = d[1].parse().map_err(bad)?;
    let da: u32 = d[2].parse().map_err(bad)?;
    let hh: u32 = h[0].parse().map_err(bad)?;
    let mi: u32 = h[1].parse().map_err(bad)?;
    let ss: f64 = if h.len() > 2 {
        h[2].parse()
            .map_err(|_| format!("epoch '{s}' has a bad seconds field"))?
    } else {
        0.0
    };
    if !(1..=12).contains(&mo) || !(1..=31).contains(&da) || hh > 23 || mi > 59 || ss >= 61.0 {
        return Err(format!("epoch '{s}' is out of range"));
    }
    Ok(crate::timescales::julian_date(y, mo, da, hh, mi, ss))
}

/// A band after preset and scenario overrides.
#[derive(Clone, Debug)]
struct Band {
    name: String,
    f_hz: f64,
    eirp_dbw: f64,
    pattern: SatPattern,
    pol: Polarisation,
    ar_db: f64,
    chip_rate_hz: f64,
    code_length: f64,
    bandwidth_hz: f64,
    data_rate_bps: f64,
    ranging: bool,
    source: String,
    design: Option<crate::leo_signal::SignalDesign>,
}

/// Delay-lock-loop settings of a signal design's ranging jitter: half-chip coherent
/// early-late, 1 Hz loop bandwidth, 20 ms predetection (the settings `iono_free` uses).
const DLL_SPACING_CHIPS: f64 = 0.5;
const DLL_LOOP_BW_HZ: f64 = 1.0;
const DLL_INTEGRATION_S: f64 = 0.02;

/// Tracked-component C/N0 (dB-Hz) and code jitter (m) of a design at total in-band C/N0.
fn design_tracking(
    d: &crate::leo_signal::SignalDesign,
    cn0_dbhz: f64,
) -> (Option<f64>, Option<f64>) {
    let Some(i) = d.tracked_index() else {
        return (None, None);
    };
    let eta = d.in_band_fraction();
    let tracked = cn0_dbhz + d.component_cn0_offset_db(i, eta);
    let jitter = crate::leo_signal::code_jitter_m(
        d,
        i,
        eta,
        cn0_dbhz,
        DLL_SPACING_CHIPS,
        DLL_LOOP_BW_HZ,
        DLL_INTEGRATION_S,
        crate::navsignal::EarlyLate::Coherent,
    );
    (Some(tracked), jitter)
}

fn design_out(d: &crate::leo_signal::SignalDesign, eirp_dbw: f64) -> SignalDesignOut {
    let eta = d.in_band_fraction();
    let ti = d.tracked_index();
    SignalDesignOut {
        name: d.name.clone(),
        source: d
            .source_ref
            .clone()
            .unwrap_or_else(|| "scenario".to_string()),
        tracked_component: ti.map(|i| d.components[i].role.as_str().to_string()),
        in_band_fraction: eta,
        tracked_cn0_offset_db: ti.map_or(0.0, |i| d.component_cn0_offset_db(i, eta)),
        eirp_split: d
            .components
            .iter()
            .map(|c| EirpShare {
                role: c.role.as_str().to_string(),
                modulation: c.shape.label(),
                share: c.share,
                eirp_dbw: eirp_dbw + 10.0 * c.share.max(1e-300).log10(),
            })
            .collect(),
        dll_spacing_chips: DLL_SPACING_CHIPS,
        dll_loop_bandwidth_hz: DLL_LOOP_BW_HZ,
        dll_integration_s: DLL_INTEGRATION_S,
    }
}

fn band_from_preset(b: &BandPreset, source: &str) -> Band {
    Band {
        name: b.name.to_string(),
        f_hz: b.centre_hz,
        eirp_dbw: b.eirp_dbw,
        pattern: b.pattern,
        pol: b.polarisation,
        ar_db: b.axial_ratio_db,
        chip_rate_hz: b.chip_rate_hz,
        code_length: b.code_length_chips,
        bandwidth_hz: b.tx_bandwidth_hz,
        data_rate_bps: b.data_rate_bps,
        ranging: b.ranging,
        source: source.to_string(),
        design: None,
    }
}

fn apply_band_cfg(
    base: Option<Band>,
    c: &BandCfg,
    designs: &[crate::leo_signal::SignalDesign],
) -> Result<Band, String> {
    let design = match &c.signal {
        Some(n) => Some(
            designs
                .iter()
                .find(|d| d.name == *n)
                .cloned()
                .or_else(|| crate::leo_signal::public_signal(n))
                .ok_or_else(|| {
                    format!(
                        "band '{}': unknown signal design '{n}'; public designs: {}",
                        c.name,
                        crate::leo_signal::public_signal_names().join(", ")
                    )
                })?,
        ),
        None => None,
    };
    let mut b = match base {
        Some(b) => b,
        None => {
            let f = c
                .frequency_mhz
                .or_else(|| design.as_ref().map(|d| d.centre_hz / 1e6))
                .ok_or_else(|| {
                    format!(
                        "band '{}' is not in the system preset: give frequency_mhz and eirp_dbw",
                        c.name
                    )
                })?;
            let e = c
                .eirp_dbw
                .ok_or_else(|| format!("band '{}' needs eirp_dbw", c.name))?;
            Band {
                name: c.name.clone(),
                f_hz: f * 1e6,
                eirp_dbw: e,
                pattern: SatPattern::Flat,
                pol: Polarisation::Rhcp,
                ar_db: 1.0,
                chip_rate_hz: 1.023e6,
                code_length: 1023.0,
                bandwidth_hz: 2.046e6,
                data_rate_bps: 0.0,
                ranging: true,
                source: "scenario".to_string(),
                design: None,
            }
        }
    };
    if let Some(d) = design {
        b.f_hz = d.centre_hz;
        b.bandwidth_hz = d.tx_bandwidth_hz;
        if let Some(r) = d
            .tracked_index()
            .and_then(|i| d.components[i].shape.chip_rate_hz())
        {
            b.chip_rate_hz = r;
        }
        b.ranging = d.ranging;
        b.design = Some(d);
    }
    if let Some(f) = c.frequency_mhz {
        b.f_hz = f * 1e6;
    }
    if let Some(e) = c.eirp_dbw {
        b.eirp_dbw = e;
    }
    if let Some(p) = &c.pattern {
        b.pattern = match p.as_str() {
            "flat" => SatPattern::Flat,
            "gaussian" => SatPattern::Gaussian {
                hpbw_deg: c.hpbw_deg.unwrap_or(100.0),
                floor_db: -20.0,
            },
            "isoflux" => SatPattern::Isoflux {
                edge_elevation_deg: c.edge_elevation_deg.unwrap_or(10.0),
                rolloff_deg: 5.0,
            },
            o => {
                return Err(format!(
                    "pattern must be isoflux, gaussian or flat; got '{o}'"
                ))
            }
        };
    } else if let (Some(h), SatPattern::Gaussian { floor_db, .. }) = (c.hpbw_deg, b.pattern) {
        b.pattern = SatPattern::Gaussian {
            hpbw_deg: h,
            floor_db,
        };
    }
    if let Some(p) = &c.polarisation {
        b.pol = Polarisation::parse(p)?;
    }
    if let Some(a) = c.axial_ratio_db {
        b.ar_db = a;
    }
    if let Some(r) = c.chip_rate_mcps {
        b.chip_rate_hz = r * 1e6;
    }
    if let Some(l) = c.code_length_chips {
        b.code_length = l;
    }
    if let Some(w) = c.bandwidth_mhz {
        b.bandwidth_hz = w * 1e6;
    }
    if let Some(d) = c.data_rate_bps {
        b.data_rate_bps = d;
    }
    if let Some(r) = c.ranging {
        b.ranging = r;
    }
    if !(b.f_hz > 1e7 && b.f_hz < 1e11) {
        return Err(format!("band '{}' frequency out of range", b.name));
    }
    if b.base_source_is_scenario_override(c) {
        b.source = format!("{} (overridden in the scenario)", b.source);
    }
    Ok(b)
}

impl Band {
    fn base_source_is_scenario_override(&self, c: &BandCfg) -> bool {
        self.source != "scenario"
            && (c.frequency_mhz.is_some()
                || c.eirp_dbw.is_some()
                || c.pattern.is_some()
                || c.hpbw_deg.is_some())
    }
}

fn resolve_bands(
    system: Option<&'static SystemPreset>,
    subset: &Option<Vec<String>>,
    extra: &[BandCfg],
    designs: &[crate::leo_signal::SignalDesign],
) -> Result<Vec<Band>, String> {
    let mut bands: Vec<Band> = Vec::new();
    if let Some(p) = system {
        let src = format!("{} ({})", p.name, p.source.kind.as_str());
        match subset {
            Some(names) => {
                for n in names {
                    let b = p
                        .band(n)
                        .ok_or_else(|| format!("system '{}' has no band '{n}'", p.id))?;
                    bands.push(band_from_preset(b, &src));
                }
            }
            None => bands.extend(p.bands.iter().map(|b| band_from_preset(b, &src))),
        }
    }
    for c in extra {
        let idx = bands
            .iter()
            .position(|b| b.name.eq_ignore_ascii_case(&c.name));
        match idx {
            Some(i) => {
                let nb = apply_band_cfg(Some(bands[i].clone()), c, designs)?;
                bands[i] = nb;
            }
            None => bands.push(apply_band_cfg(None, c, designs)?),
        }
    }
    if bands.is_empty() {
        return Err("a LEO satellite needs at least one band".to_string());
    }
    if bands.len() > 12 {
        return Err("at most 12 bands per satellite".to_string());
    }
    Ok(bands)
}

fn system_by_name(name: Option<&str>) -> Result<Option<&'static SystemPreset>, String> {
    match name {
        None => Ok(None),
        Some("none") => Ok(None),
        Some(n) => presets::by_id(n).map(Some).ok_or_else(|| {
            let ids: Vec<&str> = presets::all().iter().map(|p| p.id).collect();
            format!(
                "unknown system '{n}'; presets in this build: {}",
                ids.join(", ")
            )
        }),
    }
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

fn max_of(v: impl Iterator<Item = f64>) -> Option<f64> {
    v.fold(None, |m, x| Some(m.map_or(x, |m: f64| m.max(x))))
}

fn min_of(v: impl Iterator<Item = f64>) -> Option<f64> {
    v.fold(None, |m, x| Some(m.map_or(x, |m: f64| m.min(x))))
}

/// Resolved environment shared by every link.
struct Env {
    user: UserMotion,
    mask_deg: f64,
    antenna: UserAntenna,
    rx_pol: Polarisation,
    rx_ar_db: f64,
    nf_db: f64,
    floor_k: f64,
    impl_db: f64,
    indoor: Option<(BuildingClass, f64)>,
    meteo: Meteo,
    gas: bool,
    scint: bool,
    n_wet: f64,
    rain_rate: f64,
    rain_height_km: f64,
    rain_p: f64,
    scint_p: f64,
    iono: IonoModel,
    jd0: f64,
}

enum IonoModel {
    None,
    Klobuchar(crate::gnss_sim::KlobucharCoeffs),
    Vtec { tecu: f64, shell_m: f64 },
}

impl Env {
    /// Slant TEC (electrons/m²) at the user toward a satellite at height `h_sat_m`.
    fn stec(&self, geo: &Geodetic, el_deg: f64, az_deg: f64, t: f64, frac: f64) -> f64 {
        let el = el_deg.max(0.0).to_radians();
        let full = match &self.iono {
            IonoModel::None => 0.0,
            IonoModel::Klobuchar(k) => {
                let sod = ((self.jd0 + 0.5).fract() * 86_400.0 + t).rem_euclid(86_400.0);
                iono::stec_from_klobuchar(k, geo.lat_rad, geo.lon_rad, el, az_deg.to_radians(), sod)
            }
            IonoModel::Vtec { tecu, shell_m } => {
                tecu * iono::TECU * iono::single_layer_mapping(el, RE_EARTH, *shell_m)
            }
        };
        full * frac
    }

    /// Every per-band term for one geometry.
    #[allow(clippy::too_many_arguments)]
    fn band_terms(
        &self,
        b: &Band,
        el_deg: f64,
        nadir_rad: f64,
        sat_r_m: f64,
        range_m: f64,
        rr: f64,
        ra: f64,
        stec: f64,
        lat_deg: f64,
    ) -> BandEpoch {
        let f_ghz = b.f_hz / 1e9;
        let fspl = fspl_db(range_m, b.f_hz);
        let g_sat = b.pattern.relative_gain_db(nadir_rad, sat_r_m, RE_MEAN_M);
        let g_user = self.antenna.gain_dbi(el_deg);
        let gas = if self.gas {
            p676_gaseous_attenuation_db(f_ghz.max(1.0), el_deg, &self.meteo)
                * if f_ghz < 1.0 { f_ghz * f_ghz } else { 1.0 }
        } else {
            0.0
        };
        let rain = if self.rain_rate > 0.0 && f_ghz >= 1.0 {
            p618_rain_attenuation_db(
                &RainPath {
                    f_ghz,
                    el_deg: el_deg.max(0.5),
                    lat_deg,
                    hs_km: self.user.start.alt_m / 1e3,
                    rain_height_km: self.rain_height_km,
                    r001_mm_h: self.rain_rate,
                    tau_deg: 45.0,
                },
                self.rain_p,
            )
        } else {
            0.0
        };
        let scint = if self.scint {
            p618_scintillation_db(
                &ScintillationPath {
                    f_ghz,
                    el_deg,
                    n_wet: self.n_wet,
                    diameter_m: 0.0,
                    efficiency: 0.5,
                },
                self.scint_p,
            )
            .0
        } else {
            0.0
        };
        let bel = match self.indoor {
            Some((class, p)) => p2109_building_entry_loss_db(f_ghz, p, class, el_deg.max(0.0)),
            None => 0.0,
        };
        let pol = polarisation_loss_db(b.pol, b.ar_db, self.rx_pol, self.rx_ar_db);
        let tsys = system_noise_temperature_k(self.floor_k, gas + rain, T_MR_K, self.nf_db);
        let c = b.eirp_dbw + g_sat - fspl - gas - rain - scint - bel - pol + g_user;
        let cn0 = cn0_dbhz(c, tsys, self.impl_db);
        let (tracked_cn0_dbhz, code_jitter_m) = match &b.design {
            Some(d) => design_tracking(d, cn0),
            None => (None, None),
        };
        BandEpoch {
            cn0_dbhz: cn0,
            tracked_cn0_dbhz,
            code_jitter_m,
            received_power_dbw: c,
            fspl_db: fspl,
            sat_gain_db: g_sat,
            user_gain_dbi: g_user,
            gas_db: gas,
            rain_db: rain,
            scintillation_db: scint,
            building_entry_db: bel,
            polarisation_db: pol,
            tsys_k: tsys,
            doppler_hz: doppler_hz(b.f_hz, rr),
            doppler_rate_hz_s: doppler_rate_hz_s(b.f_hz, ra),
            iono_delay_m: iono::group_delay_m(stec, b.f_hz),
        }
    }
}

struct LeoSat {
    id: String,
    system: String,
    source_kind: String,
    orbit_source: String,
    motion: SatMotion,
    bands: Vec<Band>,
    circular: Option<(f64, f64)>,
    altitude_m: f64,
    inclination_deg: f64,
}

fn inclination_for(
    sat: &SatelliteCfg,
    system: Option<&'static SystemPreset>,
    alt_m: f64,
) -> Result<f64, String> {
    let sso = sat.sun_synchronous.unwrap_or(false)
        || (sat.inclination_deg.is_none()
            && system
                .and_then(|p| p.shells.first())
                .is_some_and(|s| s.inclination_deg.is_none()));
    if sso {
        return sun_synchronous_inclination_rad(alt_m)
            .ok_or_else(|| format!("no sun-synchronous orbit at {:.0} km", alt_m / 1e3));
    }
    let i = sat
        .inclination_deg
        .or_else(|| {
            system
                .and_then(|p| p.shells.first())
                .and_then(|s| s.inclination_deg)
        })
        .unwrap_or(97.5);
    Ok(i.to_radians())
}

/// The satellites and the user of a pass on the run's own time grid, in ECI0 (see
/// [`crate::leo_link::geometry`]), for the interoperability exports.
#[derive(Clone, Debug)]
pub struct PassTracks {
    /// The scenario epoch as a UTC Julian date.
    pub epoch_jd_utc: f64,
    /// Where the epoch comes from.
    pub epoch_label: String,
    /// Sample times (s after the epoch).
    pub times_s: Vec<f64>,
    /// Satellite id, a one-line description, and the ECI0 state at every sample.
    pub satellites: Vec<(String, String, Vec<crate::leo_link::geometry::Kinematics>)>,
    /// The user's ECI0 state at every sample.
    pub user: Vec<crate::leo_link::geometry::Kinematics>,
    /// Whether the user moves.
    pub user_moving: bool,
    /// The user's geodetic latitude (deg), longitude (deg) and height (m) at the epoch.
    pub user_start: (f64, f64, f64),
    /// The user's environment (`ground`, `maritime`, `air` or `indoor`).
    pub user_environment: String,
}

/// What every run of a [`LeoPassScenario`] starts from.
struct RunSetup {
    /// The epoch as written, UTC.
    epoch: String,
    /// The epoch as a Julian date, UTC.
    jd0: f64,
    /// Run length, s.
    duration: f64,
    /// Epoch spacing, s.
    step: f64,
    /// The propagation environment.
    env: Env,
    /// The user the environment places.
    user_out: UserOut,
}

impl LeoPassScenario {
    /// The epoch (the scenario's or the kind's default), the duration and step after the
    /// grid checks, and the environment with the user it places: the start every run
    /// shares.
    fn setup(&self) -> Result<RunSetup, String> {
        let epoch = self
            .epoch
            .clone()
            .unwrap_or_else(|| "2026-09-28T08:00:00".to_string());
        let jd0 = parse_epoch_jd(&epoch)?;
        let duration = self.duration_s.unwrap_or(900.0);
        let step = self.step_s.unwrap_or(5.0);
        if !(duration > 0.0 && step > 0.0) || duration / step > 20_000.0 || duration > 86_400.0 {
            return Err(format!(
                "duration_s (at most 86400) and step_s must be positive with at most 20000 \
                 epochs; got {duration} and {step}"
            ));
        }
        let (env, user_out) = self.env(jd0)?;
        Ok(RunSetup {
            epoch,
            jd0,
            duration,
            step,
            env,
            user_out,
        })
    }

    /// The satellites and the user on the run's time grid, from the same propagators the
    /// run uses.
    pub fn tracks(&self) -> Result<PassTracks, String> {
        let RunSetup {
            epoch,
            jd0,
            duration,
            step,
            env,
            user_out,
        } = self.setup()?;
        let sats = self.leo_sats(&env, duration)?;
        let n = (duration / step).floor() as usize + 1;
        let times: Vec<f64> = (0..n).map(|k| k as f64 * step).collect();
        let mut out = Vec::new();
        for s in &sats {
            let mut st = Vec::with_capacity(n);
            for &t in &times {
                st.push(s.motion.state(t)?);
            }
            out.push((
                s.id.clone(),
                format!(
                    "{} LEO satellite, {:.0} km, {:.1} deg ({})",
                    s.system,
                    s.altitude_m / 1e3,
                    s.inclination_deg,
                    s.orbit_source
                ),
                st,
            ));
        }
        let user: Vec<crate::leo_link::geometry::Kinematics> =
            times.iter().map(|&t| env.user.state(t).kin).collect();
        Ok(PassTracks {
            epoch_jd_utc: jd0,
            epoch_label: if self.epoch.is_some() {
                format!("the scenario's `epoch` {epoch}, read as UTC")
            } else {
                format!("the kind's default epoch {epoch} UTC (the scenario gives none)")
            },
            times_s: times,
            satellites: out,
            user,
            user_moving: user_out.speed_m_s > 0.0,
            user_start: (user_out.lat_deg, user_out.lon_deg, user_out.height_m),
            user_environment: user_out.environment,
        })
    }

    /// Run and render: JSON with a units block, a text summary and the SVG chart.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let r = self.compute()?;
        Ok((report_json(&r)?, summary(&r), to_svg(&r)))
    }

    fn env(&self, jd0: f64) -> Result<(Env, UserOut), String> {
        let u = self.user.clone().unwrap_or_default();
        let envname = u.environment.clone().unwrap_or_else(|| "ground".into());
        let (h_def, v_def) = match envname.as_str() {
            "ground" | "indoor" => (0.0, 0.0),
            "maritime" => (10.0, 8.0),
            "air" => (10_000.0, 230.0),
            o => {
                return Err(format!(
                    "user.environment must be ground, maritime, air or indoor; got '{o}'"
                ))
            }
        };
        let lat = u.lat_deg.unwrap_or(48.1);
        let lon = u.lon_deg.unwrap_or(11.6);
        if !(-90.0..=90.0).contains(&lat) {
            return Err("user.lat_deg must be within +/-90".into());
        }
        let height = u.height_m.unwrap_or(h_def);
        let speed = u.speed_m_s.unwrap_or(v_def);
        if !(0.0..=3000.0).contains(&speed) || !(-500.0..=100_000.0).contains(&height) {
            return Err("user speed must be 0 to 3000 m/s and height -500 to 100000 m".into());
        }
        let antenna = match u.antenna.as_deref().unwrap_or("patch") {
            "patch" => UserAntenna::Patch {
                zenith_gain_dbi: u.zenith_gain_dbi.unwrap_or(3.0),
                exponent: u.rolloff_exponent.unwrap_or(1.1),
                min_gain_dbi: u.min_gain_dbi.unwrap_or(-10.0),
            },
            "hemispherical" => UserAntenna::Hemispherical {
                gain_dbi: u.gain_dbi.unwrap_or(0.0),
            },
            "isotropic" => UserAntenna::Isotropic,
            o => {
                return Err(format!(
                    "user.antenna must be patch, hemispherical or isotropic; got '{o}'"
                ))
            }
        };
        let indoor = if envname == "indoor" {
            let class = BuildingClass::parse(u.building.as_deref().unwrap_or("traditional"))?;
            let p = u.building_probability.unwrap_or(0.5);
            if !(p > 0.0 && p < 1.0) {
                return Err("user.building_probability must be in (0, 1)".into());
            }
            Some((class, p))
        } else {
            None
        };
        let a = self.atmosphere.clone().unwrap_or_default();
        let meteo = Meteo {
            pressure_hpa: a.pressure_hpa.unwrap_or(1013.0),
            temperature_c: a.temperature_c.unwrap_or(15.0),
            water_vapour_g_m3: a.water_vapour_g_m3.unwrap_or(7.5),
        };
        let n_wet = a.n_wet.unwrap_or_else(|| {
            wet_refractivity(
                meteo.temperature_c,
                a.humidity_percent.unwrap_or(60.0),
                meteo.pressure_hpa,
            )
        });
        let rain_rate = a.rain_rate_mm_h.unwrap_or(0.0);
        let rain_p = a.rain_exceedance_percent.unwrap_or(0.01);
        let scint_p = a.scintillation_percent.unwrap_or(1.0);
        if rain_rate < 0.0 || !(0.001..=5.0).contains(&rain_p) || !(0.01..=50.0).contains(&scint_p)
        {
            return Err(
                "rain_rate_mm_h >= 0, rain_exceedance_percent in [0.001, 5] and \
                 scintillation_percent in [0.01, 50]"
                    .into(),
            );
        }
        let io = self.ionosphere.clone().unwrap_or_default();
        let iono = match io.model.as_deref().unwrap_or("klobuchar") {
            "none" => IonoModel::None,
            "klobuchar" => {
                let d = crate::gnss_sim::KlobucharCoeffs::default();
                IonoModel::Klobuchar(crate::gnss_sim::KlobucharCoeffs {
                    alpha: io.alpha.unwrap_or(d.alpha),
                    beta: io.beta.unwrap_or(d.beta),
                })
            }
            "vtec" => IonoModel::Vtec {
                tecu: io.vtec_tecu.unwrap_or(20.0),
                shell_m: io.shell_height_km.unwrap_or(350.0) * 1e3,
            },
            o => {
                return Err(format!(
                    "ionosphere.model must be klobuchar, vtec or none; got '{o}'"
                ))
            }
        };
        let env = Env {
            user: UserMotion {
                start: Geodetic {
                    lat_rad: lat.to_radians(),
                    lon_rad: lon.to_radians(),
                    alt_m: height,
                },
                speed_m_s: speed,
                heading_rad: u.heading_deg.unwrap_or(90.0).to_radians(),
            },
            mask_deg: u.mask_deg.unwrap_or(5.0),
            antenna,
            rx_pol: Polarisation::parse(u.polarisation.as_deref().unwrap_or("rhcp"))?,
            rx_ar_db: u.axial_ratio_db.unwrap_or(3.0),
            nf_db: u.noise_figure_db.unwrap_or(2.0),
            floor_k: u.antenna_floor_k.unwrap_or(100.0),
            impl_db: u.implementation_loss_db.unwrap_or(1.0),
            indoor,
            meteo,
            gas: a.gas.unwrap_or(true),
            scint: a.scintillation.unwrap_or(true),
            n_wet,
            rain_rate,
            rain_height_km: a.rain_height_km.unwrap_or(3.0),
            rain_p,
            scint_p,
            iono,
            jd0,
        };
        let uo = UserOut {
            environment: envname,
            lat_deg: lat,
            lon_deg: lon,
            height_m: height,
            speed_m_s: speed,
            mask_deg: env.mask_deg,
            antenna: antenna.name().to_string(),
            noise_figure_db: env.nf_db,
            implementation_loss_db: env.impl_db,
            building: indoor.map(|(c, _)| c.as_str().to_string()),
            building_probability: indoor.map(|(_, p)| p),
        };
        Ok((env, uo))
    }

    fn leo_sats(&self, env: &Env, duration: f64) -> Result<Vec<LeoSat>, String> {
        let mut out = Vec::new();
        let default_sat = [SatelliteCfg::default()];
        let sats: &[SatelliteCfg] =
            if self.satellite.is_empty() && self.leo_constellation.is_empty() {
                &default_sat
            } else {
                &self.satellite
            };
        for (k, s) in sats.iter().enumerate() {
            let system = system_by_name(Some(s.system.as_deref().unwrap_or("generic-leo")))?;
            let bands = resolve_bands(system, &s.bands, &s.band, &self.signal_designs)?;
            let id = s.id.clone().unwrap_or_else(|| format!("LEO-{}", k + 1));
            let j2 = s.j2.unwrap_or(true);
            let alt_m = s
                .altitude_km
                .or_else(|| system.and_then(|p| p.shells.first()).map(|x| x.altitude_km))
                .unwrap_or(550.0)
                * 1e3;
            let (motion, orbit_source, circular) = match s.orbit.as_deref().unwrap_or("pass") {
                "pass" => {
                    let inc = inclination_for(s, system, alt_m)?;
                    let req = PassRequest {
                        altitude_m: alt_m,
                        inclination_rad: inc,
                        max_elevation_deg: s.max_elevation_deg.unwrap_or(75.0),
                        tca_s: s.tca_s.unwrap_or(0.5 * duration),
                        direction: match s.direction.as_deref().unwrap_or("ascending") {
                            "ascending" => PassDirection::Ascending,
                            "descending" => PassDirection::Descending,
                            o => {
                                return Err(format!(
                                    "direction must be ascending or descending; got '{o}'"
                                ))
                            }
                        },
                        east: s.side.as_deref().unwrap_or("east") != "west",
                        j2,
                    };
                    let (el, _) = design_pass(&env.user, &req)?;
                    (
                        SatMotion::kepler(el, j2),
                        "designed pass".to_string(),
                        Some((alt_m, inc)),
                    )
                }
                "elements" => {
                    let inc = inclination_for(s, system, alt_m)?;
                    let e = s.eccentricity.unwrap_or(0.0);
                    let a = RE_EARTH + alt_m;
                    if !(0.0..0.9).contains(&e) || a * (1.0 - e) <= RE_EARTH + 100e3 {
                        return Err(format!("satellite {id}: bad eccentricity or perigee"));
                    }
                    let el = Elements {
                        a_m: a,
                        e,
                        i_rad: inc,
                        raan_rad: s.raan_deg.unwrap_or(0.0).to_radians(),
                        argp_rad: s.argp_deg.unwrap_or(0.0).to_radians(),
                        m0_rad: s.mean_anomaly_deg.unwrap_or(0.0).to_radians(),
                    };
                    (
                        SatMotion::kepler(el, j2),
                        "elements".to_string(),
                        (e == 0.0).then_some((alt_m, inc)),
                    )
                }
                "tle" => {
                    let (l1, l2) = match (&s.tle_line1, &s.tle_line2) {
                        (Some(a), Some(b)) => (a, b),
                        _ => {
                            return Err(format!(
                                "satellite {id}: tle needs tle_line1 and tle_line2"
                            ))
                        }
                    };
                    (
                        SatMotion::from_tle(l1, l2, env.jd0)?,
                        "TLE through SGP4".to_string(),
                        None,
                    )
                }
                o => return Err(format!("orbit must be pass, elements or tle; got '{o}'")),
            };
            let st0 = motion.state(0.0)?;
            let r0 = (st0.r[0] * st0.r[0] + st0.r[1] * st0.r[1] + st0.r[2] * st0.r[2]).sqrt();
            let hvec = [
                st0.r[1] * st0.v[2] - st0.r[2] * st0.v[1],
                st0.r[2] * st0.v[0] - st0.r[0] * st0.v[2],
                st0.r[0] * st0.v[1] - st0.r[1] * st0.v[0],
            ];
            let hn = (hvec[0] * hvec[0] + hvec[1] * hvec[1] + hvec[2] * hvec[2]).sqrt();
            out.push(LeoSat {
                id,
                system: system.map_or("none", |p| p.id).to_string(),
                source_kind: system
                    .map_or("SCENARIO", |p| p.source.kind.as_str())
                    .to_string(),
                orbit_source,
                motion,
                bands,
                circular,
                altitude_m: r0 - RE_EARTH,
                inclination_deg: (hvec[2] / hn).acos().to_degrees(),
            });
        }
        for c in &self.leo_constellation {
            let system = system_by_name(Some(c.system.as_deref().unwrap_or("generic-leo")))?;
            let bands = resolve_bands(system, &c.bands, &c.band, &self.signal_designs)?;
            let j2 = c.j2.unwrap_or(true);
            let body = crate::body::Body::earth();
            let design = match &c.design {
                Some(d) => d.clone(),
                None => {
                    let p = system.ok_or("leo_constellation needs a system or a design")?;
                    let shells = p
                        .shells
                        .iter()
                        .map(|s| -> Result<crate::constellation::ShellCfg, String> {
                            let inc = match s.inclination_deg {
                                Some(i) => i,
                                None => sun_synchronous_inclination_rad(s.altitude_km * 1e3)
                                    .ok_or("no sun-synchronous inclination")?
                                    .to_degrees(),
                            };
                            Ok(crate::constellation::ShellCfg {
                                pattern: if s.star {
                                    crate::constellation::WalkerPattern::Star
                                } else {
                                    crate::constellation::WalkerPattern::Delta
                                },
                                total: s.total,
                                planes: s.planes,
                                phasing: s.phasing,
                                altitude_km: Some(s.altitude_km),
                                semi_major_axis_km: None,
                                eccentricity: 0.0,
                                inclination_deg: inc,
                                raan0_deg: 0.0,
                                argp_deg: 0.0,
                                mean_anomaly0_deg: 0.0,
                            })
                        })
                        .collect::<Result<Vec<_>, String>>()?;
                    ConstellationCfg {
                        name: p.name.to_string(),
                        preset: None,
                        expanded: None,
                        shell: shells,
                        satellite: Vec::new(),
                    }
                }
            };
            let built = design.build(&body)?;
            if built.elements.len() > 5000 {
                return Err("leo_constellation: at most 5000 satellites".into());
            }
            // Rank by the highest elevation reached in the window, on a coarse grid.
            let mut ranked: Vec<(f64, usize)> = Vec::new();
            for (i, el) in built.elements.iter().enumerate() {
                let m = SatMotion::kepler(*el, j2);
                let mut best = f64::MIN;
                let mut t = 0.0;
                while t <= duration {
                    let s = m.state(t)?;
                    let g = link_geometry(&s, &env.user.state(t), t);
                    best = best.max(g.el_deg);
                    t += 30.0;
                }
                if best >= env.mask_deg {
                    ranked.push((best, i));
                }
            }
            ranked.sort_by(|a, b| b.0.total_cmp(&a.0).then(a.1.cmp(&b.1)));
            for (_, i) in ranked.into_iter().take(c.max_satellites.unwrap_or(6)) {
                let el = built.elements[i];
                out.push(LeoSat {
                    id: format!("{}/{}", built.name, built.ids[i]),
                    system: system.map_or("none", |p| p.id).to_string(),
                    source_kind: system
                        .map_or("SCENARIO", |p| p.source.kind.as_str())
                        .to_string(),
                    orbit_source: format!("Walker ({})", built.source),
                    motion: SatMotion::kepler(el, j2),
                    bands: bands.clone(),
                    circular: (el.e == 0.0).then_some((el.a_m - RE_EARTH, el.i_rad)),
                    altitude_m: el.a_m - RE_EARTH,
                    inclination_deg: el.i_rad.to_degrees(),
                });
            }
        }
        if out.is_empty() {
            return Err("no LEO satellite rises above the mask in the window".into());
        }
        Ok(out)
    }

    /// Compute the report.
    pub fn compute(&self) -> Result<LeoPassReport, String> {
        let RunSetup {
            epoch,
            jd0,
            duration,
            step,
            env,
            user_out,
        } = self.setup()?;
        let io = self.ionosphere.clone().unwrap_or_default();
        let peak_m = io.peak_height_km.unwrap_or(350.0) * 1e3;
        let scale_m = io.scale_height_km.unwrap_or(100.0) * 1e3;
        let sats = self.leo_sats(&env, duration)?;
        let n_epochs = (duration / step).floor() as usize + 1;
        let mut notes: Vec<String> = Vec::new();

        let mut sat_out = Vec::new();
        for s in &sats {
            let mut series = Vec::with_capacity(n_epochs);
            let (mut d_rr, mut d_ra) = (0.0_f64, 0.0_f64);
            for k in 0..n_epochs {
                let t = k as f64 * step;
                let st = s.motion.state(t)?;
                let us = env.user.state(t);
                let g = link_geometry(&st, &us, t);
                let visible = g.el_deg >= env.mask_deg;
                let frac = io.leo_fraction.unwrap_or_else(|| {
                    iono::fraction_below(g.sat_radius_m - RE_EARTH, peak_m, scale_m)
                });
                let stec = env.stec(&us.geo, g.el_deg, g.az_deg, t, frac);
                let bands = if visible {
                    let (c1, c2) = numerical_check(&s.motion, &env.user, t, 0.05)?;
                    d_rr = d_rr.max(c1);
                    d_ra = d_ra.max(c2);
                    s.bands
                        .iter()
                        .map(|b| {
                            env.band_terms(
                                b,
                                g.el_deg,
                                g.nadir_angle_rad,
                                g.sat_radius_m,
                                g.range_m,
                                g.range_rate_m_s,
                                g.range_accel_m_s2,
                                stec,
                                us.geo.lat_rad.to_degrees(),
                            )
                        })
                        .collect()
                } else {
                    Vec::new()
                };
                series.push(SatEpoch {
                    t_s: t,
                    elevation_deg: g.el_deg,
                    azimuth_deg: g.az_deg,
                    range_m: g.range_m,
                    range_rate_m_s: g.range_rate_m_s,
                    range_accel_m_s2: g.range_accel_m_s2,
                    nadir_angle_deg: g.nadir_angle_rad.to_degrees(),
                    stec_tecu: stec / iono::TECU,
                    visible,
                    bands,
                });
            }
            // Pass summary.
            let (maxel, tca) = max_elevation(&s.motion, &env.user, 0.5 * duration, 0.5 * duration)?;
            let vis: Vec<&SatEpoch> = series.iter().filter(|e| e.visible).collect();
            let aos = vis.first().map(|e| e.t_s);
            let los = vis.last().map(|e| e.t_s);
            let pass = PassOut {
                max_elevation_deg: maxel,
                tca_s: tca,
                aos_s: aos,
                los_s: los,
                duration_above_mask_s: vis.len() as f64 * step,
            };
            let f_max = s.bands.iter().map(|b| b.f_hz).fold(0.0, f64::max);
            let env_rr = s.circular.map(|(alt, inc)| {
                max_static_user_range_rate(alt + RE_EARTH - RE_MEAN_M, inc, RE_MEAN_M)
                    .max_range_rate_m_s
            });
            let bands_out: Vec<BandOut> = s
                .bands
                .iter()
                .enumerate()
                .map(|(bi, b)| {
                    let cn: Vec<f64> = vis.iter().map(|e| e.bands[bi].cn0_dbhz).collect();
                    let peak_idx = vis
                        .iter()
                        .enumerate()
                        .max_by(|a, b2| a.1.bands[bi].cn0_dbhz.total_cmp(&b2.1.bands[bi].cn0_dbhz))
                        .map(|(i, _)| i);
                    BandOut {
                        name: b.name.clone(),
                        frequency_hz: b.f_hz,
                        eirp_dbw: b.eirp_dbw,
                        pattern: b.pattern.name().to_string(),
                        polarisation: b.pol.as_str().to_string(),
                        chip_rate_hz: b.chip_rate_hz,
                        bandwidth_hz: b.bandwidth_hz,
                        data_rate_bps: b.data_rate_bps,
                        ranging: b.ranging,
                        source: b.source.clone(),
                        doppler_envelope_hz: env_rr.map(|v| v * b.f_hz / crate::leo_link::C_M_S),
                        peak_cn0_dbhz: max_of(cn.iter().copied()),
                        median_cn0_dbhz: median(cn.clone()),
                        min_cn0_dbhz: min_of(cn.iter().copied()),
                        max_abs_doppler_hz: max_of(
                            vis.iter().map(|e| e.bands[bi].doppler_hz.abs()),
                        ),
                        max_abs_doppler_rate_hz_s: max_of(
                            vis.iter().map(|e| e.bands[bi].doppler_rate_hz_s.abs()),
                        ),
                        iono_delay_at_peak_m: peak_idx.map(|i| vis[i].bands[bi].iono_delay_m),
                        signal_design: b.design.as_ref().map(|d| design_out(d, b.eirp_dbw)),
                        peak_tracked_cn0_dbhz: peak_idx
                            .and_then(|i| vis[i].bands[bi].tracked_cn0_dbhz),
                        min_code_jitter_m: min_of(
                            vis.iter().filter_map(|e| e.bands[bi].code_jitter_m),
                        ),
                        median_code_jitter_m: median(
                            vis.iter()
                                .filter_map(|e| e.bands[bi].code_jitter_m)
                                .collect(),
                        ),
                        max_code_jitter_m: max_of(
                            vis.iter().filter_map(|e| e.bands[bi].code_jitter_m),
                        ),
                    }
                })
                .collect();
            sat_out.push(SatOut {
                id: s.id.clone(),
                system: s.system.clone(),
                source_kind: s.source_kind.clone(),
                orbit_source: s.orbit_source.clone(),
                altitude_m: s.altitude_m,
                inclination_deg: s.inclination_deg,
                pass,
                doppler_check: DopplerCheck {
                    max_range_rate_diff_m_s: d_rr,
                    max_range_accel_diff_m_s2: d_ra,
                    max_doppler_diff_hz: d_rr * f_max / crate::leo_link::C_M_S,
                    max_doppler_rate_diff_hz_s: d_ra * f_max / crate::leo_link::C_M_S,
                },
                bands: bands_out,
                series,
            });
        }

        // MEO GNSS comparison.
        let gcfg = self.gnss.clone().unwrap_or_default();
        let gnss = if gcfg.enabled.unwrap_or(true) {
            Some(self.gnss_comparison(&env, &gcfg, n_epochs, step)?)
        } else {
            None
        };

        let comparison = match (&gnss, sat_out.first()) {
            (Some(g), Some(s)) => match (g.median_cn0_dbhz, g.max_cn0_dbhz, s.bands.first()) {
                (Some(gm), Some(gx), Some(b0)) => b0.peak_cn0_dbhz.map(|p| {
                    let above = s
                        .series
                        .iter()
                        .filter(|e| e.visible && e.bands[0].cn0_dbhz > gx)
                        .count() as f64
                        * step;
                    ComparisonOut {
                        leo_satellite: s.id.clone(),
                        leo_band: b0.name.clone(),
                        leo_peak_cn0_dbhz: p,
                        gnss_median_cn0_dbhz: gm,
                        gnss_max_cn0_dbhz: gx,
                        leo_peak_above_gnss_median_db: p - gm,
                        leo_seconds_above_gnss_max: above,
                        leo_pass_duration_s: s.pass.duration_above_mask_s,
                    }
                }),
                _ => None,
            },
            _ => None,
        };

        // Ionosphere-free pairs on the first satellite.
        let iono_free = self.iono_free(&sat_out)?;

        let iot = match &self.iot {
            Some(c) => Some(self.iot_section(c, &sats, &sat_out, gnss.as_ref())?),
            None => None,
        };

        let spoof = match &self.spoofer {
            Some(c) => {
                Some(self.spoof_section(c, &env, &sats, &sat_out, gnss.as_ref(), duration, step)?)
            }
            None => None,
        };

        if env.scint && sats.iter().any(|s| s.bands.iter().any(|b| b.f_hz < 4e9)) {
            notes.push(
                "Tropospheric scintillation below 4 GHz extrapolates ITU-R P.618 § 2.4.1 beyond \
                 its stated range (4 to 55 GHz); it is a small term there."
                    .into(),
            );
        }
        if sats.iter().any(|s| s.bands.iter().any(|b| b.f_hz < 1e9)) {
            notes.push(
                "Below 1 GHz the gaseous term is the 1 GHz value scaled by f squared (oxygen \
                 absorption falls as f squared there) and rain attenuation is taken as zero \
                 (ITU-R P.838 starts at 1 GHz)."
                    .into(),
            );
        }
        if sat_out.iter().any(|s| s.source_kind == "WORKSHOP") {
            notes.push(
                "A preset marked WORKSHOP carries parameters presented at the ESA NAVISP \
                 LEO-PNT workshop, 2026; its EIRP and beam are calibrated to a presented C/N0 \
                 trace, not measured."
                    .into(),
            );
        }
        notes.push(
            "The GNSS satellites are placed by their published constellation presets at the \
             scenario epoch; their phase is not a snapshot of the real constellation on that \
             date."
                .into(),
        );

        Ok(LeoPassReport {
            label: "MODELLED: LEO pass geometry and per-band link budget from stated EIRPs and \
                    idealised antenna patterns with ITU-R propagation terms; component models \
                    carry their own labels in the verification matrix. Not a measurement of \
                    any satellite."
                .to_string(),
            epoch,
            epoch_jd_utc: jd0,
            duration_s: duration,
            step_s: step,
            user: user_out,
            n_wet: env.n_wet,
            rain_rate_mm_h: env.rain_rate,
            rain_height_km: env.rain_height_km,
            ionosphere_model: match env.iono {
                IonoModel::None => "none",
                IonoModel::Klobuchar(_) => "klobuchar",
                IonoModel::Vtec { .. } => "vtec",
            }
            .to_string(),
            satellites: sat_out,
            gnss,
            comparison,
            iono_free,
            iot,
            spoof,
            notes,
        })
    }

    #[allow(clippy::too_many_arguments)]
    fn spoof_section(
        &self,
        c: &SpooferCfg,
        env: &Env,
        sats: &[LeoSat],
        out: &[SatOut],
        gnss: Option<&GnssOut>,
        duration: f64,
        step: f64,
    ) -> Result<SpoofOut, String> {
        use crate::leo_link::geometry::{ecef_to_eci0, Kinematics};
        use crate::leo_link::spoof as sp;
        let onset = c.onset_s.unwrap_or(0.25 * duration);
        let offset0 = c.offset_m.unwrap_or(0.0);
        let rate = c.push_rate_m_s.unwrap_or(1.0);
        let az = c.push_azimuth_deg.unwrap_or(0.0);
        let prior_p = c.prior_sigma_m.unwrap_or(10.0);
        let prior_v = c.prior_velocity_sigma_m_s.unwrap_or(0.5);
        let prior = sp::Prior {
            position_sigma_m: prior_p,
            velocity_sigma_m_s: prior_v,
            drift_sigma_m_s: c.drift_sigma_m_s,
        };
        let bn = c.fll_bandwidth_hz.unwrap_or(2.0);
        let tint = c.fll_integration_s.unwrap_or(0.02);
        let thr = c.tracking_threshold_dbhz.unwrap_or(25.0);
        let p_fa = c.p_fa.unwrap_or(1e-5);
        let p_md = c.p_md.unwrap_or(1e-3);
        let bound = c.iono_rate_bound_m_s.unwrap_or(0.01);
        let window = c.window_s.unwrap_or(step);
        if !(window > 0.0 && window <= 3600.0) {
            return Err("spoofer.window_s must be in (0, 3600]".into());
        }
        let wn = ((window / step).round() as usize).max(1);
        let sim_iono = c.simulate_iono.unwrap_or(false);
        let spoofs_gnss = c.gnss.unwrap_or(true);
        let valid = (0.0..=duration).contains(&onset)
            && (0.0..=1.0e6).contains(&offset0)
            && (0.0..=1000.0).contains(&rate)
            && prior_p > 0.0
            && prior_p.is_finite()
            && prior_v >= 0.0
            && prior_v.is_finite()
            && bn > 0.0
            && tint > 0.0
            && p_fa > 0.0
            && p_fa < 0.5
            && p_md > 0.0
            && p_md < 0.5
            && bound >= 0.0
            && c.drift_sigma_m_s.is_none_or(|d| d > 0.0 && d.is_finite());
        if !valid {
            return Err(
                "spoofer: onset_s within the window, offset_m in [0, 1e6], push_rate_m_s in \
                 [0, 1000], positive prior_sigma_m, drift_sigma_m_s, fll_bandwidth_hz and \
                 fll_integration_s, p_fa and p_md in (0, 0.5), iono_rate_bound_m_s >= 0"
                    .into(),
            );
        }
        let mut names: Vec<String> = Vec::new();
        for s in sats {
            for b in &s.bands {
                if !names.iter().any(|n| n.eq_ignore_ascii_case(&b.name)) {
                    names.push(b.name.clone());
                }
            }
        }
        let spoofed: Vec<String> = match &c.bands {
            Some(list) => {
                for b in list {
                    if !names.iter().any(|n| n.eq_ignore_ascii_case(b)) {
                        return Err(format!(
                            "spoofer.bands: '{b}' is not a band of any LEO satellite ({})",
                            names.join(", ")
                        ));
                    }
                }
                list.clone()
            }
            None => names.clone(),
        };
        let is_spoofed = |b: &str| spoofed.iter().any(|n| n.eq_ignore_ascii_case(b));

        // The MEO GNSS satellites the comparison reports, rebuilt from their preset.
        let mut gnss_sats: Vec<(SatMotion, &GnssSatOut, f64)> = Vec::new();
        if let Some(g) = gnss {
            let cfg = ConstellationCfg {
                name: g.constellation.clone(),
                preset: Some(g.constellation.clone()),
                expanded: None,
                shell: Vec::new(),
                satellite: Vec::new(),
            };
            let built = cfg.build(&crate::body::Body::earth())?;
            for gs in &g.satellites {
                if let Some(i) = built.ids.iter().position(|id| *id == gs.id) {
                    gnss_sats.push((
                        SatMotion::kepler(built.elements[i], false),
                        gs,
                        g.frequency_hz,
                    ));
                }
            }
        }

        let n_epochs = out.first().map_or(0, |s| s.series.len());
        let (sa, ca) = az.to_radians().sin_cos();
        let w = [0.0, 0.0, crate::leo_link::OMEGA_EARTH];
        let mut series = Vec::with_capacity(n_epochs);
        // Band pairs per satellite, with the previous epoch's model-corrected combination.
        struct Pair {
            sat: usize,
            i: usize,
            j: usize,
            prev: Option<f64>,
            max_step: Option<f64>,
            min_thr: Option<f64>,
            detect: Option<f64>,
        }
        let mut pairs: Vec<Pair> = Vec::new();
        for (si, s) in sats.iter().enumerate() {
            for i in 0..s.bands.len() {
                for j in i + 1..s.bands.len() {
                    if s.bands[i].ranging && s.bands[j].ranging {
                        pairs.push(Pair {
                            sat: si,
                            i,
                            j,
                            prev: None,
                            max_step: None,
                            min_thr: None,
                            detect: None,
                        });
                    }
                }
            }
        }
        let (mut leo_sig, mut gnss_sig, mut leo_grad, mut gnss_grad) =
            (Vec::new(), Vec::new(), Vec::new(), Vec::new());
        let norm3 = |g: [f64; 3]| (g[0] * g[0] + g[1] * g[1] + g[2] * g[2]).sqrt();
        let test_out = |hist: &[Vec<sp::DopplerChannel>]| -> SpoofTestEpoch {
            let from = hist.len().saturating_sub(wn);
            let win: Vec<&[sp::DopplerChannel]> =
                hist[from..].iter().map(|v| v.as_slice()).collect();
            let n_now = hist.last().map_or(0, |v| v.len());
            match sp::doppler_consistency_window(&win, &prior, p_fa) {
                Some(t) => SpoofTestEpoch {
                    n: n_now,
                    noncentrality: Some(t.noncentrality),
                    threshold: Some(t.threshold),
                    p_detect: Some(t.p_detect),
                },
                None => SpoofTestEpoch {
                    n: n_now,
                    noncentrality: None,
                    threshold: None,
                    p_detect: None,
                },
            }
        };
        let mut hist_g: Vec<Vec<sp::DopplerChannel>> = Vec::new();
        let mut hist_l: Vec<Vec<sp::DopplerChannel>> = Vec::new();
        let mut hist_f: Vec<Vec<sp::DopplerChannel>> = Vec::new();
        for k in 0..n_epochs {
            let t = k as f64 * step;
            let us = env.user.state(t);
            let active = t >= onset;
            let (off, offdot) = if active {
                (offset0 + rate * (t - onset), rate)
            } else {
                (0.0, 0.0)
            };
            let (sl, cl) = us.geo.lat_rad.sin_cos();
            let (so, co) = us.geo.lon_rad.sin_cos();
            let h = [-sl * co * ca - so * sa, -sl * so * ca + co * sa, cl * ca];
            let d = [h[0] * off, h[1] * off, h[2] * off];
            let dd = [h[0] * offdot, h[1] * offdot, h[2] * offdot];
            let wxd = [
                w[1] * d[2] - w[2] * d[1],
                w[2] * d[0] - w[0] * d[2],
                w[0] * d[1] - w[1] * d[0],
            ];
            let dr = ecef_to_eci0(d, t);
            let dv = ecef_to_eci0([dd[0] + wxd[0], dd[1] + wxd[1], dd[2] + wxd[2]], t);
            let claimed = Kinematics {
                r: [
                    us.kin.r[0] + dr[0],
                    us.kin.r[1] + dr[1],
                    us.kin.r[2] + dr[2],
                ],
                v: [
                    us.kin.v[0] + dv[0],
                    us.kin.v[1] + dv[1],
                    us.kin.v[2] + dv[2],
                ],
                a: us.kin.a,
            };
            let mut leo_ch = Vec::new();
            let mut states = Vec::with_capacity(sats.len());
            for (si, s) in sats.iter().enumerate() {
                let st = s.motion.state(t)?;
                states.push(st);
                let e = &out[si].series[k];
                if !e.visible {
                    continue;
                }
                let rr_t = sp::range_rate(&st, &us.kin);
                let rr_c = sp::range_rate(&st, &claimed);
                let grad = sp::range_rate_position_gradient(&st, &us.kin);
                let los = sp::line_of_sight(&st, &us.kin);
                for (bi, b) in s.bands.iter().enumerate() {
                    let cn0 = e.bands[bi].cn0_dbhz;
                    if cn0 < thr {
                        continue;
                    }
                    let sig = sp::range_rate_jitter_m_s(b.f_hz, cn0, bn, tint);
                    leo_sig.push(sig);
                    leo_grad.push(norm3(grad));
                    leo_ch.push(sp::DopplerChannel {
                        residual_m_s: if active && is_spoofed(&b.name) {
                            rr_c - rr_t
                        } else {
                            0.0
                        },
                        sigma_m_s: sig,
                        gradient: grad,
                        los,
                    });
                }
            }
            let mut gnss_ch = Vec::new();
            for (m, gs, f_hz) in &gnss_sats {
                let Some(cn0) = gs.series[k].cn0_dbhz else {
                    continue;
                };
                if cn0 < thr {
                    continue;
                }
                let st = m.state(t)?;
                let rr_t = sp::range_rate(&st, &us.kin);
                let rr_c = sp::range_rate(&st, &claimed);
                let grad = sp::range_rate_position_gradient(&st, &us.kin);
                let sig = sp::range_rate_jitter_m_s(*f_hz, cn0, bn, tint);
                gnss_sig.push(sig);
                gnss_grad.push(norm3(grad));
                gnss_ch.push(sp::DopplerChannel {
                    residual_m_s: if active && spoofs_gnss {
                        rr_c - rr_t
                    } else {
                        0.0
                    },
                    sigma_m_s: sig,
                    gradient: grad,
                    los: sp::line_of_sight(&st, &us.kin),
                });
            }
            let fused_ch: Vec<sp::DopplerChannel> =
                gnss_ch.iter().chain(leo_ch.iter()).copied().collect();

            let (mut cb_ratio, mut cb_p): (Option<f64>, Option<f64>) = (None, None);
            for p in pairs.iter_mut() {
                let s = &sats[p.sat];
                let e = &out[p.sat].series[k];
                let tracked =
                    e.visible && e.bands[p.i].cn0_dbhz >= thr && e.bands[p.j].cn0_dbhz >= thr;
                if !tracked {
                    p.prev = None;
                    continue;
                }
                let st = &states[p.sat];
                let rc = [
                    st.r[0] - claimed.r[0],
                    st.r[1] - claimed.r[1],
                    st.r[2] - claimed.r[2],
                ];
                let rho_c = norm3(rc);
                let rho_t = e.range_m;
                let pr = |bi: usize| {
                    let iono = e.bands[bi].iono_delay_m;
                    if active && is_spoofed(&s.bands[bi].name) {
                        rho_c + if sim_iono { iono } else { 0.0 }
                    } else {
                        rho_t + iono
                    }
                };
                let g =
                    (pr(p.i) - pr(p.j)) - (e.bands[p.i].iono_delay_m - e.bands[p.j].iono_delay_m);
                if let Some(prev) = p.prev {
                    let sig = |bi: usize| {
                        e.bands[bi].code_jitter_m.unwrap_or_else(|| {
                            iono::dll_code_noise_m(
                                s.bands[bi].chip_rate_hz,
                                e.bands[bi].cn0_dbhz,
                                1.0,
                                0.5,
                                0.02,
                            )
                        })
                    };
                    let tst = sp::cross_band_step(g - prev, sig(p.i), sig(p.j), bound, step, p_fa);
                    let ratio = tst.step_m.abs() / tst.threshold_m;
                    cb_ratio = Some(cb_ratio.map_or(ratio, |r: f64| r.max(ratio)));
                    cb_p = Some(cb_p.map_or(tst.p_detect, |q: f64| q.max(tst.p_detect)));
                    p.max_step = Some(
                        p.max_step
                            .map_or(tst.step_m.abs(), |m: f64| m.max(tst.step_m.abs())),
                    );
                    p.min_thr = Some(
                        p.min_thr
                            .map_or(tst.threshold_m, |m: f64| m.min(tst.threshold_m)),
                    );
                    if p.detect.is_none() && t >= onset && tst.p_detect >= 1.0 - p_md {
                        p.detect = Some(t);
                    }
                }
                p.prev = Some(g);
            }
            hist_g.push(gnss_ch);
            hist_l.push(leo_ch);
            hist_f.push(fused_ch);
            series.push(SpoofEpoch {
                t_s: t,
                offset_m: off,
                gnss: test_out(&hist_g),
                leo: test_out(&hist_l),
                fused: test_out(&hist_f),
                cross_band_ratio: cb_ratio,
                cross_band_p_detect: cb_p,
            });
        }
        let detection = |f: &dyn Fn(&SpoofEpoch) -> Option<f64>| -> SpoofDetection {
            let hit = series
                .iter()
                .find(|e| e.t_s >= onset && f(e).is_some_and(|p| p >= 1.0 - p_md));
            SpoofDetection {
                detect_time_s: hit.map(|e| e.t_s),
                delay_s: hit.map(|e| e.t_s - onset),
                offset_at_detection_m: hit.map(|e| e.offset_m),
            }
        };
        let gnss_d = detection(&|e| e.gnss.p_detect);
        let leo_d = detection(&|e| e.leo.p_detect);
        let fused_d = detection(&|e| e.fused.p_detect);
        let cb_d = detection(&|e| e.cross_band_p_detect);
        let first = [&gnss_d, &leo_d, &fused_d, &cb_d]
            .into_iter()
            .filter(|d| d.detect_time_s.is_some())
            .min_by(|a, b| {
                a.detect_time_s
                    .unwrap_or(f64::INFINITY)
                    .total_cmp(&b.detect_time_s.unwrap_or(f64::INFINITY))
            })
            .cloned()
            .unwrap_or(SpoofDetection {
                detect_time_s: None,
                delay_s: None,
                offset_at_detection_m: None,
            });
        let pairs_out = pairs
            .iter()
            .map(|p| {
                let s = &sats[p.sat];
                CrossBandPairOut {
                    satellite: s.id.clone(),
                    band_1: s.bands[p.i].name.clone(),
                    band_2: s.bands[p.j].name.clone(),
                    spoofed_1: is_spoofed(&s.bands[p.i].name),
                    spoofed_2: is_spoofed(&s.bands[p.j].name),
                    max_abs_step_m: p.max_step,
                    min_threshold_m: p.min_thr,
                    detect_time_s: p.detect,
                }
            })
            .collect();
        Ok(SpoofOut {
            label: "MODELLED: Doppler and pass-geometry consistency and cross-band consistency \
                    monitors against an idealised position-push spoofer; detection \
                    probabilities are exact for the stated Gaussian noise, evaluated on the \
                    noise-free mean residual. Not a measured attack."
                .into(),
            onset_s: onset,
            offset_m: offset0,
            push_rate_m_s: rate,
            push_azimuth_deg: az,
            spoofed_bands: spoofed,
            spoofs_gnss,
            simulates_iono: sim_iono,
            prior_sigma_m: prior_p,
            prior_velocity_sigma_m_s: prior_v,
            drift_sigma_m_s: c.drift_sigma_m_s,
            fll_bandwidth_hz: bn,
            fll_integration_s: tint,
            tracking_threshold_dbhz: thr,
            p_fa,
            p_md,
            iono_rate_bound_m_s: bound,
            window_s: wn as f64 * step,
            median_leo_sigma_m_s: median(leo_sig),
            median_gnss_sigma_m_s: median(gnss_sig),
            median_leo_gradient_per_s: median(leo_grad),
            median_gnss_gradient_per_s: median(gnss_grad),
            gnss: gnss_d,
            leo: leo_d,
            fused: fused_d,
            cross_band: cb_d,
            first,
            pairs: pairs_out,
            series,
            notes: vec![
                "The spoofer is self-consistent in range and range rate at the claimed \
                 position and compensates its own path to the receiver; its power, angle of \
                 arrival and correlation-peak signatures are not modelled."
                    .into(),
                "The receiver predicts from an independent prior position (the true track with \
                 the stated uncertainty); a receiver whose prior follows its own spoofed fixes \
                 does not have this test."
                    .into(),
                "The receiver's ionosphere model is the engine's, so the authentic cross-band \
                 residual is zero in the mean; iono_rate_bound_m_s stands for the rate of the \
                 model's error."
                    .into(),
                "A spoofer that counterfeits every band and simulates the ionosphere passes the \
                 cross-band monitor; only the Doppler monitor sees it."
                    .into(),
            ],
        })
    }

    fn gnss_comparison(
        &self,
        env: &Env,
        g: &GnssCfg,
        n_epochs: usize,
        step: f64,
    ) -> Result<GnssOut, String> {
        let cons = g.constellation.clone().unwrap_or_else(|| "galileo".into());
        let default_band = if cons.starts_with("gps") { "L1" } else { "E1" };
        let bname = g.band.clone().unwrap_or_else(|| default_band.to_string());
        let band = gnss_meo::gnss_band(&cons, &bname)
            .ok_or_else(|| format!("no GNSS signal '{bname}' for constellation '{cons}'"))?;
        let excess = g.excess_power_db.unwrap_or(2.0);
        let cfg = ConstellationCfg {
            name: cons.clone(),
            preset: Some(cons.clone()),
            expanded: None,
            shell: Vec::new(),
            satellite: Vec::new(),
        };
        let built = cfg.build(&crate::body::Body::earth())?;
        // Reference range for the specified minimum: the slant range at its elevation.
        let a_ref = built
            .elements
            .first()
            .map(|e| e.a_m)
            .ok_or("empty GNSS constellation")?;
        let rho_ref = presets::slant_range_m(a_ref - RE_EARTH, band.min_power_elevation_deg);
        let pol = polarisation_loss_db(band.polarisation, 1.0, env.rx_pol, env.rx_ar_db);
        let mut sats_out = Vec::new();
        for (i, el) in built.elements.iter().enumerate() {
            let m = SatMotion::kepler(*el, false);
            let mut series = Vec::with_capacity(n_epochs);
            let mut maxel = f64::MIN;
            for k in 0..n_epochs {
                let t = k as f64 * step;
                let st = m.state(t)?;
                let us = env.user.state(t);
                let geo = link_geometry(&st, &us, t);
                maxel = maxel.max(geo.el_deg);
                let cn0 = (geo.el_deg >= env.mask_deg).then(|| {
                    let p_iso =
                        (band.min_power_dbw + 20.0 * (rho_ref / geo.range_m).log10() + excess)
                            .min(band.max_power_dbw);
                    let f_ghz = band.centre_hz / 1e9;
                    let gas = if env.gas {
                        p676_gaseous_attenuation_db(f_ghz, geo.el_deg, &env.meteo)
                    } else {
                        0.0
                    };
                    let bel = match env.indoor {
                        Some((class, p)) => {
                            p2109_building_entry_loss_db(f_ghz, p, class, geo.el_deg)
                        }
                        None => 0.0,
                    };
                    let tsys = system_noise_temperature_k(env.floor_k, gas, T_MR_K, env.nf_db);
                    let c = p_iso + env.antenna.gain_dbi(geo.el_deg) - pol - gas - bel;
                    cn0_dbhz(c, tsys, env.impl_db)
                });
                series.push(GnssEpoch {
                    t_s: t,
                    elevation_deg: geo.el_deg,
                    cn0_dbhz: cn0,
                    doppler_hz: doppler_hz(band.centre_hz, geo.range_rate_m_s),
                });
            }
            if maxel >= env.mask_deg {
                sats_out.push(GnssSatOut {
                    id: built.ids[i].clone(),
                    max_elevation_deg: maxel,
                    series,
                });
            }
        }
        sats_out.sort_by(|a, b| b.max_elevation_deg.total_cmp(&a.max_elevation_deg));
        let in_view = sats_out.len();
        sats_out.truncate(g.max_satellites.unwrap_or(8));
        let all: Vec<f64> = sats_out
            .iter()
            .flat_map(|s| s.series.iter().filter_map(|e| e.cn0_dbhz))
            .collect();
        let dop = max_of(
            sats_out
                .iter()
                .flat_map(|s| s.series.iter().filter(|e| e.cn0_dbhz.is_some()))
                .map(|e| e.doppler_hz.abs()),
        );
        Ok(GnssOut {
            constellation: cons,
            band: band.name.to_string(),
            frequency_hz: band.centre_hz,
            min_power_dbw: band.min_power_dbw,
            max_power_dbw: band.max_power_dbw,
            excess_power_db: excess,
            source: band.source.to_string(),
            satellites_in_view: in_view,
            median_cn0_dbhz: median(all.clone()),
            min_cn0_dbhz: min_of(all.iter().copied()),
            max_cn0_dbhz: max_of(all.iter().copied()),
            max_abs_doppler_hz: dop,
            satellites: sats_out,
        })
    }

    fn iono_free(&self, sats: &[SatOut]) -> Result<Vec<IonoFreePair>, String> {
        let s = match sats.first() {
            Some(s) => s,
            None => return Ok(Vec::new()),
        };
        let names: Vec<String> = s.bands.iter().map(|b| b.name.clone()).collect();
        let pairs: Vec<(usize, usize)> = match &self.iono_free_pairs {
            Some(list) => list
                .iter()
                .map(|[a, b]| {
                    let ia = names.iter().position(|n| n.eq_ignore_ascii_case(a));
                    let ib = names.iter().position(|n| n.eq_ignore_ascii_case(b));
                    match (ia, ib) {
                        (Some(x), Some(y)) if x != y => Ok((x, y)),
                        _ => Err(format!(
                            "iono_free_pairs: '{a}'/'{b}' are not two distinct bands of {}",
                            s.id
                        )),
                    }
                })
                .collect::<Result<_, _>>()?,
            None => {
                let mut v = Vec::new();
                for i in 0..names.len() {
                    for j in i + 1..names.len() {
                        v.push((i, j));
                    }
                }
                v
            }
        };
        // The epoch of the first band's peak C/N0 is "the pass peak".
        let peak = s
            .series
            .iter()
            .filter(|e| e.visible)
            .max_by(|a, b| a.bands[0].cn0_dbhz.total_cmp(&b.bands[0].cn0_dbhz));
        Ok(pairs
            .into_iter()
            .map(|(i, j)| {
                let (bi, bj) = (&s.bands[i], &s.bands[j]);
                let (a1, a2) = iono::iono_free_coefficients(bi.frequency_hz, bj.frequency_hz);
                // Electrons/m^2 per metre of delay difference: d1 - d2 = 40.3 STEC (1/f1^2 - 1/f2^2).
                let (f1, f2) = (bi.frequency_hz, bj.frequency_hz);
                let k_gf = 1.0 / (40.3 * (1.0 / (f1 * f1) - 1.0 / (f2 * f2)));
                let noise = |k: usize, b: &BandOut| {
                    // A band with a signal design uses its own band-limited jitter.
                    peak.map(|e| {
                        e.bands[k].code_jitter_m.unwrap_or_else(|| {
                            iono::dll_code_noise_m(
                                b.chip_rate_hz,
                                e.bands[k].cn0_dbhz,
                                1.0,
                                0.5,
                                0.02,
                            )
                        })
                    })
                };
                let (n1, n2) = (noise(i, bi), noise(j, bj));
                IonoFreePair {
                    band_1: bi.name.clone(),
                    band_2: bj.name.clone(),
                    a1,
                    a2,
                    noise_amplification_equal: (a1 * a1 + a2 * a2).sqrt(),
                    code_noise_1_m: n1,
                    code_noise_2_m: n2,
                    iono_free_code_noise_m: match (n1, n2) {
                        (Some(x), Some(y)) => Some(iono::iono_free_noise_amplification(
                            bi.frequency_hz,
                            bj.frequency_hz,
                            x,
                            y,
                        )),
                        _ => None,
                    },
                    iono_delay_1_m: peak.map(|e| e.bands[i].iono_delay_m),
                    iono_delay_2_m: peak.map(|e| e.bands[j].iono_delay_m),
                    geometry_free_stec_tecu: peak.map(|e| {
                        // The modelled group delays stand in for the two pseudoranges (the
                        // geometry cancels); modelled delays carry no code bias.
                        iono::geometry_free_stec_tecu(
                            e.bands[j].iono_delay_m,
                            e.bands[i].iono_delay_m,
                            bj.frequency_hz,
                            bi.frequency_hz,
                            0.0,
                        )
                    }),
                    geometry_free_stec_sigma_tecu: match (n1, n2) {
                        (Some(x), Some(y)) => {
                            Some((x * x + y * y).sqrt() * k_gf.abs() / iono::TECU)
                        }
                        _ => None,
                    },
                }
            })
            .collect())
    }

    fn iot_section(
        &self,
        c: &IotCfg,
        sats: &[LeoSat],
        out: &[SatOut],
        gnss: Option<&GnssOut>,
    ) -> Result<IotOut, String> {
        let rx = IotReceiver {
            active_power_mw: c.active_power_mw.unwrap_or(20.0),
            sleep_power_uw: c.sleep_power_uw.unwrap_or(5.0),
            battery_mwh: c.battery_mwh.unwrap_or(2000.0),
            detection_snr_db: c.detection_snr_db.unwrap_or(16.0),
            max_coherent_s: c.max_coherent_ms.unwrap_or(20.0) * 1e-3,
            parallel_code_search: c.parallel_code_search.unwrap_or(true),
            correlators: c.correlators.unwrap_or(64),
            fix_compute_s: c.fix_compute_s.unwrap_or(0.1),
        };
        if !(rx.active_power_mw > 0.0 && rx.sleep_power_uw >= 0.0 && rx.battery_mwh > 0.0) {
            return Err("iot powers and battery must be positive".into());
        }
        let aided = c.aided_doppler_uncertainty_hz.unwrap_or(500.0);
        let intervals = c
            .fix_intervals_s
            .clone()
            .unwrap_or_else(|| vec![1.0, 10.0, 60.0, 600.0, 3600.0, 86_400.0]);
        let use_peak = match c.cn0_from.as_deref().unwrap_or("median") {
            "median" => false,
            "peak" => true,
            o => return Err(format!("iot.cn0_from must be median or peak; got '{o}'")),
        };
        let mut rows = Vec::new();
        if let (Some(s), Some(so)) = (sats.first(), out.first()) {
            let cold_bits = presets::by_id(&s.system).map_or(1000.0, |p| p.cold_start_bits);
            for (b, bo) in s.bands.iter().zip(&so.bands) {
                let cn0 = if use_peak {
                    bo.peak_cn0_dbhz
                } else {
                    bo.median_cn0_dbhz
                };
                let Some(cn0) = cn0 else { continue };
                let unc = bo
                    .doppler_envelope_hz
                    .or(bo.max_abs_doppler_hz)
                    .unwrap_or(0.0);
                let rate = bo.max_abs_doppler_rate_hz_s.unwrap_or(0.0);
                let sig = IotSignal {
                    cn0_dbhz: cn0,
                    code_length_chips: b.code_length,
                    doppler_uncertainty_hz: unc,
                    doppler_rate_hz_s: rate,
                    data_rate_bps: b.data_rate_bps,
                    cold_start_bits: cold_bits,
                };
                let cold = fix_budget(&sig, &rx, true);
                let hot = fix_budget(
                    &IotSignal {
                        doppler_uncertainty_hz: aided.min(unc).max(1.0),
                        ..sig
                    },
                    &rx,
                    false,
                );
                rows.push(IotRow {
                    signal: format!("{} {}", so.id, b.name),
                    cn0_dbhz: cn0,
                    doppler_uncertainty_cold_hz: unc,
                    doppler_rate_hz_s: rate,
                    duty_cycle_hot: duty_curve(&hot, &rx, &intervals),
                    cold,
                    hot,
                });
            }
        }
        if let Some(g) = gnss {
            let cn0 = if use_peak {
                g.max_cn0_dbhz
            } else {
                g.median_cn0_dbhz
            };
            if let (Some(cn0), Some(band)) = (cn0, gnss_meo::gnss_band(&g.constellation, &g.band)) {
                let unc = g.max_abs_doppler_hz.unwrap_or(5000.0).max(5000.0);
                let sig = IotSignal {
                    cn0_dbhz: cn0,
                    code_length_chips: band.code_length_chips,
                    doppler_uncertainty_hz: unc,
                    doppler_rate_hz_s: 1.0,
                    data_rate_bps: band.data_rate_bps,
                    cold_start_bits: gnss_meo::GNSS_COLD_START_S * band.data_rate_bps,
                };
                let cold = fix_budget(&sig, &rx, true);
                let hot = fix_budget(
                    &IotSignal {
                        doppler_uncertainty_hz: aided.min(unc),
                        ..sig
                    },
                    &rx,
                    false,
                );
                rows.push(IotRow {
                    signal: format!("{} {}", g.constellation, g.band),
                    cn0_dbhz: cn0,
                    doppler_uncertainty_cold_hz: unc,
                    doppler_rate_hz_s: 1.0,
                    duty_cycle_hot: duty_curve(&hot, &rx, &intervals),
                    cold,
                    hot,
                });
            }
        }
        Ok(IotOut {
            label: "MODELLED: acquisition, time to first fix and energy from stated receiver \
                    assumptions; not a measured receiver."
                .into(),
            active_power_mw: rx.active_power_mw,
            sleep_power_uw: rx.sleep_power_uw,
            battery_mwh: rx.battery_mwh,
            assumptions: vec![
                format!(
                    "detection threshold {:.1} dB after integration",
                    rx.detection_snr_db
                ),
                format!(
                    "coherent integration at most {:.0} ms, capped by the Doppler rate",
                    rx.max_coherent_s * 1e3
                ),
                if rx.parallel_code_search {
                    "parallel (FFT) code search: one Doppler bin per dwell".to_string()
                } else {
                    format!("serial search with {} correlators", rx.correlators)
                },
                "cold start: Doppler uncertainty is the orbit's static-user envelope (LEO) or \
                 the larger of the pass maximum and 5 kHz (GNSS); message demodulation added"
                    .to_string(),
                format!("hot start: Doppler known to +/-{aided:.0} Hz, ephemeris valid"),
                "C/N0 from the pass (median over the visible epochs unless peak is asked)"
                    .to_string(),
            ],
            rows,
        })
    }
}

// ── Output ───────────────────────────────────────────────────────────────────────────────

/// Units and provenance for every numeric leaf.
const UNITS: &[(&str, &str, &str, &str)] = &[
    ("epoch_jd_utc", "day", "input", "scenario epoch as a UTC Julian date"),
    ("duration_s", "s", "input", "window length"),
    ("step_s", "s", "input", "epoch spacing"),
    ("user.lat_deg", "deg", "input", "user geodetic latitude"),
    ("user.lon_deg", "deg", "input", "user longitude, east positive"),
    ("user.height_m", "m", "input", "user height above the WGS-84 ellipsoid"),
    ("user.speed_m_s", "m/s", "input", "user ground speed"),
    ("user.mask_deg", "deg", "input", "elevation mask"),
    ("user.noise_figure_db", "dB", "modelled-input", "receiver noise figure"),
    ("user.implementation_loss_db", "dB", "modelled-input", "receiver implementation loss"),
    ("user.building_probability", "1", "input", "probability the building entry loss is not exceeded"),
    ("n_wet", "1", "input", "wet term of the surface refractivity in N-units (given, or from the meteorology through ITU-R P.453)"),
    ("rain_rate_mm_h", "mm/h", "input", "rain rate exceeded 0.01 % of an average year, R0.01"),
    ("rain_height_km", "km", "input", "rain height h_R, the ITU-R P.839 value at the site"),
    ("satellites[].altitude_m", "m", "computed", "satellite height above the equatorial radius at the epoch"),
    ("satellites[].inclination_deg", "deg", "computed", "orbit inclination from the epoch state"),
    ("satellites[].pass.max_elevation_deg", "deg", "computed", "highest elevation in the window"),
    ("satellites[].pass.tca_s", "s", "computed", "time of the highest elevation"),
    ("satellites[].pass.aos_s", "s", "computed", "first epoch above the mask"),
    ("satellites[].pass.los_s", "s", "computed", "last epoch above the mask"),
    ("satellites[].pass.duration_above_mask_s", "s", "computed", "epochs above the mask times the step"),
    ("satellites[].doppler_check.max_range_rate_diff_m_s", "m/s", "internal-consistency", "largest difference between the closed-form range rate and a central difference of the range"),
    ("satellites[].doppler_check.max_range_accel_diff_m_s2", "m/s^2", "internal-consistency", "largest difference between the closed-form range acceleration and a central difference of the range rate"),
    ("satellites[].doppler_check.max_doppler_diff_hz", "Hz", "internal-consistency", "the range-rate difference expressed at the highest band carrier"),
    ("satellites[].doppler_check.max_doppler_rate_diff_hz_s", "Hz/s", "internal-consistency", "the range-acceleration difference expressed at the highest band carrier"),
    ("satellites[].bands[].frequency_hz", "Hz", "input", "carrier frequency (preset or scenario)"),
    ("satellites[].bands[].eirp_dbw", "dBW", "modelled-input", "peak EIRP (published received power turned into an EIRP, or representative)"),
    ("satellites[].bands[].chip_rate_hz", "Hz", "input", "ranging-code chip rate"),
    ("satellites[].bands[].bandwidth_hz", "Hz", "input", "transmitted bandwidth"),
    ("satellites[].bands[].data_rate_bps", "bit/s", "input", "navigation data rate"),
    ("satellites[].bands[].doppler_envelope_hz", "Hz", "closed-form", "largest Doppler a static user on a 6371 km sphere sees from this circular orbit at 0 deg elevation"),
    ("satellites[].bands[].peak_cn0_dbhz", "dB-Hz", "computed", "highest C/N0 over the visible epochs"),
    ("satellites[].bands[].median_cn0_dbhz", "dB-Hz", "computed", "median C/N0 over the visible epochs"),
    ("satellites[].bands[].min_cn0_dbhz", "dB-Hz", "computed", "lowest C/N0 over the visible epochs"),
    ("satellites[].bands[].max_abs_doppler_hz", "Hz", "computed", "largest Doppler magnitude over the visible epochs"),
    ("satellites[].bands[].max_abs_doppler_rate_hz_s", "Hz/s", "computed", "largest Doppler-rate magnitude over the visible epochs"),
    ("satellites[].bands[].iono_delay_at_peak_m", "m", "computed", "first-order ionospheric group delay at the epoch of peak C/N0"),
    ("satellites[].bands[].signal_design.in_band_fraction", "1", "computed", "fraction of the design's transmitted power inside its transmit bandwidth"),
    ("satellites[].bands[].signal_design.tracked_cn0_offset_db", "dB", "computed", "offset from the band's total C/N0 to the tracked component's, 10 log10(share / in-band fraction)"),
    ("satellites[].bands[].signal_design.eirp_split[].share", "1", "input", "the component's share of the transmitted power, from the signal design"),
    ("satellites[].bands[].signal_design.eirp_split[].eirp_dbw", "dBW", "computed", "the component's EIRP: band EIRP plus 10 log10(share)"),
    ("satellites[].bands[].signal_design.dll_spacing_chips", "chip", "input", "early-late spacing of the ranging jitter"),
    ("satellites[].bands[].signal_design.dll_loop_bandwidth_hz", "Hz", "input", "delay-lock-loop bandwidth of the ranging jitter"),
    ("satellites[].bands[].signal_design.dll_integration_s", "s", "input", "predetection integration time of the ranging jitter"),
    ("satellites[].bands[].peak_tracked_cn0_dbhz", "dB-Hz", "computed", "tracked-component C/N0 at the epoch of peak C/N0"),
    ("satellites[].bands[].min_code_jitter_m", "m", "computed", "smallest code-tracking jitter over the pass (1-sigma)"),
    ("satellites[].bands[].median_code_jitter_m", "m", "computed", "median code-tracking jitter over the pass (1-sigma)"),
    ("satellites[].bands[].max_code_jitter_m", "m", "computed", "largest code-tracking jitter over the pass (1-sigma)"),
    ("satellites[].series[].t_s", "s", "computed", "seconds after the epoch"),
    ("satellites[].series[].elevation_deg", "deg", "computed", "geodetic elevation of the satellite"),
    ("satellites[].series[].azimuth_deg", "deg", "computed", "azimuth clockwise from true north"),
    ("satellites[].series[].range_m", "m", "computed", "slant range"),
    ("satellites[].series[].range_rate_m_s", "m/s", "closed-form", "range rate d.dv/rho, positive receding"),
    ("satellites[].series[].range_accel_m_s2", "m/s^2", "closed-form", "range acceleration (|dv|^2 - rho_dot^2 + d.da)/rho"),
    ("satellites[].series[].nadir_angle_deg", "deg", "computed", "nadir angle at the satellite toward the user"),
    ("satellites[].series[].stec_tecu", "1", "modelled", "slant total electron content below the satellite, in TEC units (1e16 electrons/m^2)"),
    ("satellites[].series[].bands[].cn0_dbhz", "dB-Hz", "computed", "carrier-to-noise density"),
    ("satellites[].series[].bands[].received_power_dbw", "dBW", "computed", "received carrier power at the antenna output"),
    ("satellites[].series[].bands[].fspl_db", "dB", "closed-form", "free-space path loss 20 log10(4 pi R f / c)"),
    ("satellites[].series[].bands[].sat_gain_db", "dB", "modelled", "satellite pattern gain toward the user relative to its peak"),
    ("satellites[].series[].bands[].user_gain_dbi", "dBi", "modelled", "user antenna gain at the satellite's elevation"),
    ("satellites[].series[].bands[].gas_db", "dB", "modelled", "gaseous attenuation, ITU-R P.676-10 Annex 2"),
    ("satellites[].series[].bands[].rain_db", "dB", "computed", "rain attenuation, ITU-R P.618-14 with P.838-3 coefficients"),
    ("satellites[].series[].bands[].scintillation_db", "dB", "computed", "tropospheric scintillation fade, ITU-R P.618-14 section 2.4.1"),
    ("satellites[].series[].bands[].building_entry_db", "dB", "computed", "building entry loss, ITU-R P.2109-2"),
    ("satellites[].series[].bands[].polarisation_db", "dB", "closed-form", "polarisation mismatch loss averaged over ellipse orientation"),
    ("satellites[].series[].bands[].tsys_k", "K", "modelled", "system noise temperature"),
    ("satellites[].series[].bands[].doppler_hz", "Hz", "closed-form", "carrier Doppler -f rho_dot / c"),
    ("satellites[].series[].bands[].doppler_rate_hz_s", "Hz/s", "closed-form", "carrier Doppler rate -f rho_ddot / c"),
    ("satellites[].series[].bands[].iono_delay_m", "m", "closed-form", "first-order ionospheric group delay 40.3 STEC / f^2"),
    ("satellites[].series[].bands[].tracked_cn0_dbhz", "dB-Hz", "computed", "tracked-component C/N0: total C/N0 plus the design's component offset"),
    ("satellites[].series[].bands[].code_jitter_m", "m", "modelled", "band-limited coherent early-late code-tracking jitter of the tracked component (Betz & Kolodziejski 2009), the ranging error"),
    ("gnss.frequency_hz", "Hz", "spec", "GNSS carrier"),
    ("gnss.min_power_dbw", "dBW", "spec", "interface-document minimum received power into 0 dBi"),
    ("gnss.max_power_dbw", "dBW", "spec", "interface-document maximum received power into 0 dBi"),
    ("gnss.excess_power_db", "dB", "modelled-input", "received power above the specified minimum before range scaling"),
    ("gnss.satellites_in_view", "count", "computed", "GNSS satellites above the mask at some epoch"),
    ("gnss.median_cn0_dbhz", "dB-Hz", "computed", "median GNSS C/N0 over the reported satellites and epochs"),
    ("gnss.min_cn0_dbhz", "dB-Hz", "computed", "lowest GNSS C/N0"),
    ("gnss.max_cn0_dbhz", "dB-Hz", "computed", "highest GNSS C/N0"),
    ("gnss.max_abs_doppler_hz", "Hz", "computed", "largest GNSS Doppler magnitude above the mask"),
    ("gnss.satellites[].max_elevation_deg", "deg", "computed", "highest elevation of the GNSS satellite in the window"),
    ("gnss.satellites[].series[].t_s", "s", "computed", "seconds after the epoch"),
    ("gnss.satellites[].series[].elevation_deg", "deg", "computed", "GNSS satellite elevation"),
    ("gnss.satellites[].series[].cn0_dbhz", "dB-Hz", "computed", "GNSS C/N0 with the same user antenna and noise model"),
    ("gnss.satellites[].series[].doppler_hz", "Hz", "closed-form", "GNSS carrier Doppler"),
    ("comparison.leo_peak_cn0_dbhz", "dB-Hz", "computed", "peak C/N0 of the first LEO satellite's first band"),
    ("comparison.gnss_median_cn0_dbhz", "dB-Hz", "computed", "median GNSS C/N0"),
    ("comparison.gnss_max_cn0_dbhz", "dB-Hz", "computed", "highest GNSS C/N0"),
    ("comparison.leo_peak_above_gnss_median_db", "dB", "computed", "LEO peak minus GNSS median"),
    ("comparison.leo_seconds_above_gnss_max", "s", "computed", "time the LEO C/N0 exceeds the strongest GNSS carrier"),
    ("comparison.leo_pass_duration_s", "s", "computed", "LEO time above the mask"),
    ("iono_free[].a1", "1", "closed-form", "ionosphere-free coefficient f1^2/(f1^2 - f2^2)"),
    ("iono_free[].a2", "1", "closed-form", "ionosphere-free coefficient -f2^2/(f1^2 - f2^2)"),
    ("iono_free[].noise_amplification_equal", "1", "closed-form", "sqrt(a1^2 + a2^2): amplification of equal independent noise"),
    ("iono_free[].code_noise_1_m", "m", "modelled", "thermal code noise of band 1 at the pass peak (early-minus-late power DLL, 1 Hz, 0.5 chip, 20 ms)"),
    ("iono_free[].code_noise_2_m", "m", "modelled", "thermal code noise of band 2 at the pass peak"),
    ("iono_free[].iono_free_code_noise_m", "m", "modelled", "code noise of the ionosphere-free combination at the pass peak"),
    ("iono_free[].iono_delay_1_m", "m", "computed", "first-order delay on band 1 at the peak"),
    ("iono_free[].iono_delay_2_m", "m", "computed", "first-order delay on band 2 at the peak"),
    ("iono_free[].geometry_free_stec_tecu", "1", "closed-form", "slant TEC from the pair's geometry-free code combination at the peak, in TEC units (1e16 electrons/m^2): ionosphere sounding"),
    ("iono_free[].geometry_free_stec_sigma_tecu", "1", "modelled", "1-sigma of that slant TEC from the two bands' code noise at the peak, in TEC units"),
    ("iot.active_power_mw", "mW", "modelled-input", "receiver power while acquiring and tracking"),
    ("iot.sleep_power_uw", "uW", "modelled-input", "receiver power asleep"),
    ("iot.battery_mwh", "mWh", "modelled-input", "battery capacity"),
    ("iot.rows[].cn0_dbhz", "dB-Hz", "computed", "C/N0 the acquisition uses"),
    ("iot.rows[].doppler_uncertainty_cold_hz", "Hz", "modelled", "cold-start Doppler search half-width"),
    ("iot.rows[].doppler_rate_hz_s", "Hz/s", "computed", "worst-case Doppler rate over the pass"),
    ("iot.rows[].cold.coherent_s", "s", "modelled", "coherent integration"),
    ("iot.rows[].cold.noncoherent_sums", "count", "modelled", "non-coherent sums per dwell"),
    ("iot.rows[].cold.doppler_bins", "count", "modelled", "Doppler bins searched"),
    ("iot.rows[].cold.acquisition_s", "s", "modelled", "acquisition time"),
    ("iot.rows[].cold.message_s", "s", "modelled", "navigation-message demodulation time"),
    ("iot.rows[].cold.ttff_s", "s", "modelled", "time to first fix"),
    ("iot.rows[].cold.energy_per_fix_mj", "mJ", "modelled", "energy per fix"),
    ("iot.rows[].hot.coherent_s", "s", "modelled", "coherent integration"),
    ("iot.rows[].hot.noncoherent_sums", "count", "modelled", "non-coherent sums per dwell"),
    ("iot.rows[].hot.doppler_bins", "count", "modelled", "Doppler bins searched"),
    ("iot.rows[].hot.acquisition_s", "s", "modelled", "acquisition time"),
    ("iot.rows[].hot.message_s", "s", "modelled", "zero on a hot start"),
    ("iot.rows[].hot.ttff_s", "s", "modelled", "time to first fix"),
    ("iot.rows[].hot.energy_per_fix_mj", "mJ", "modelled", "energy per fix"),
    ("iot.rows[].duty_cycle_hot[].fix_interval_s", "s", "input", "fix interval"),
    ("iot.rows[].duty_cycle_hot[].duty_cycle", "1", "modelled", "fraction of time active"),
    ("iot.rows[].duty_cycle_hot[].average_power_mw", "mW", "modelled", "average power"),
    ("iot.rows[].duty_cycle_hot[].battery_life_days", "day", "modelled", "battery life at that interval"),
    ("spoof.onset_s", "s", "input", "spoofing onset"),
    ("spoof.offset_m", "m", "input", "jump of the claimed position at the onset"),
    ("spoof.push_rate_m_s", "m/s", "input", "horizontal push speed of the claimed position after the onset"),
    ("spoof.push_azimuth_deg", "deg", "input", "direction of the push, clockwise from north"),
    ("spoof.prior_sigma_m", "m", "input", "1-sigma uncertainty of the receiver's independent prior position, per axis"),
    ("spoof.prior_velocity_sigma_m_s", "m/s", "input", "1-sigma uncertainty of the receiver's independent prior velocity, per axis"),
    ("spoof.drift_sigma_m_s", "m/s", "input", "1-sigma prior on the receiver clock drift (absent: unknown)"),
    ("spoof.fll_bandwidth_hz", "Hz", "input", "frequency-lock-loop noise bandwidth"),
    ("spoof.fll_integration_s", "s", "input", "frequency-lock-loop predetection time"),
    ("spoof.tracking_threshold_dbhz", "dB-Hz", "input", "channels below this C/N0 are not tracked"),
    ("spoof.p_fa", "1", "input", "false-alarm probability of each test at each epoch"),
    ("spoof.p_md", "1", "input", "missed-detection probability defining detection"),
    ("spoof.iono_rate_bound_m_s", "m/s", "input", "unmodelled ionospheric rate the cross-band monitor tolerates"),
    ("spoof.window_s", "s", "input", "length of the Doppler test window, a whole number of steps"),
    ("spoof.median_leo_sigma_m_s", "m/s", "modelled", "median range-rate jitter of the tracked LEO channels (frequency-lock-loop thermal noise, Kaplan & Hegarty 2006)"),
    ("spoof.median_gnss_sigma_m_s", "m/s", "modelled", "median range-rate jitter of the tracked GNSS channels"),
    ("spoof.median_leo_gradient_per_s", "1/s", "closed-form", "median size of the LEO range-rate gradient with respect to the user position: range rate per metre of push"),
    ("spoof.median_gnss_gradient_per_s", "1/s", "closed-form", "median size of the GNSS range-rate gradient with respect to the user position"),
    ("spoof.gnss.detect_time_s", "s", "computed", "first epoch the GNSS-only Doppler test detects"),
    ("spoof.gnss.delay_s", "s", "computed", "onset to GNSS-only detection"),
    ("spoof.gnss.offset_at_detection_m", "m", "computed", "claimed-position offset at GNSS-only detection"),
    ("spoof.leo.detect_time_s", "s", "computed", "first epoch the LEO-only Doppler test detects"),
    ("spoof.leo.delay_s", "s", "computed", "onset to LEO-only detection"),
    ("spoof.leo.offset_at_detection_m", "m", "computed", "claimed-position offset at LEO-only detection"),
    ("spoof.fused.detect_time_s", "s", "computed", "first epoch the Doppler test on every channel detects"),
    ("spoof.fused.delay_s", "s", "computed", "onset to fused detection"),
    ("spoof.fused.offset_at_detection_m", "m", "computed", "claimed-position offset at fused detection"),
    ("spoof.cross_band.detect_time_s", "s", "computed", "first epoch a cross-band test detects"),
    ("spoof.cross_band.delay_s", "s", "computed", "onset to cross-band detection"),
    ("spoof.cross_band.offset_at_detection_m", "m", "computed", "claimed-position offset at cross-band detection"),
    ("spoof.first.detect_time_s", "s", "computed", "first detection by any monitor"),
    ("spoof.first.delay_s", "s", "computed", "onset to the first detection"),
    ("spoof.first.offset_at_detection_m", "m", "computed", "claimed-position offset at the first detection"),
    ("spoof.pairs[].max_abs_step_m", "m", "computed", "largest step of the model-corrected geometry-free combination"),
    ("spoof.pairs[].min_threshold_m", "m", "computed", "smallest cross-band alarm threshold over the run"),
    ("spoof.pairs[].detect_time_s", "s", "computed", "first epoch this pair's test detects"),
    ("spoof.series[].t_s", "s", "computed", "seconds after the epoch"),
    ("spoof.series[].offset_m", "m", "computed", "horizontal distance of the claimed position from the true one"),
    ("spoof.series[].gnss.n", "count", "computed", "GNSS channels tracked"),
    ("spoof.series[].gnss.noncentrality", "1", "computed", "non-centrality of the GNSS-only Doppler statistic"),
    ("spoof.series[].gnss.threshold", "1", "computed", "chi-square threshold of the GNSS-only test"),
    ("spoof.series[].gnss.p_detect", "1", "computed", "probability the GNSS-only test alarms at this epoch"),
    ("spoof.series[].leo.n", "count", "computed", "LEO channels tracked"),
    ("spoof.series[].leo.noncentrality", "1", "computed", "non-centrality of the LEO-only Doppler statistic"),
    ("spoof.series[].leo.threshold", "1", "computed", "chi-square threshold of the LEO-only test"),
    ("spoof.series[].leo.p_detect", "1", "computed", "probability the LEO-only test alarms at this epoch"),
    ("spoof.series[].fused.n", "count", "computed", "channels tracked"),
    ("spoof.series[].fused.noncentrality", "1", "computed", "non-centrality of the Doppler statistic on every channel"),
    ("spoof.series[].fused.threshold", "1", "computed", "chi-square threshold of the fused test"),
    ("spoof.series[].fused.p_detect", "1", "computed", "probability the fused test alarms at this epoch"),
    ("spoof.series[].cross_band_ratio", "1", "computed", "largest |step| over threshold of the cross-band tests (1 is the alarm line)"),
    ("spoof.series[].cross_band_p_detect", "1", "computed", "largest detection probability of the cross-band tests"),
];

fn report_json(r: &LeoPassReport) -> Result<String, String> {
    let mut doc = serde_json::to_value(r).map_err(|e| format!("serialising report: {e}"))?;
    match doc.as_object_mut() {
        Some(o) => {
            o.insert("units".into(), crate::solar_system::units_block_from(UNITS));
        }
        None => return Err("the report must serialise to a JSON object".to_string()),
    }
    serde_json::to_string_pretty(&doc).map_err(|e| format!("serialising report: {e}"))
}

fn opt(v: Option<f64>, unit: &str) -> String {
    v.map(|x| format!("{x:.1} {unit}"))
        .unwrap_or_else(|| "n/a".to_string())
}

/// The text summary.
pub fn summary(r: &LeoPassReport) -> String {
    let mut s = format!(
        "LEO pass link budget, {} user at {:.2}, {:.2}; {} LEO satellite(s), {} s window\n",
        r.user.environment,
        r.user.lat_deg,
        r.user.lon_deg,
        r.satellites.len(),
        r.duration_s
    );
    for sat in &r.satellites {
        s.push_str(&format!(
            "  {} [{} {}]: {:.0} km, max elevation {:.1} deg at {:.0} s, {:.0} s above the mask\n",
            sat.id,
            sat.system,
            sat.source_kind,
            sat.altitude_m / 1e3,
            sat.pass.max_elevation_deg,
            sat.pass.tca_s,
            sat.pass.duration_above_mask_s
        ));
        for b in &sat.bands {
            s.push_str(&format!(
                "    {:>8} {:>10.3} MHz: C/N0 peak {} median {}; |Doppler| max {}; iono {}\n",
                b.name,
                b.frequency_hz / 1e6,
                opt(b.peak_cn0_dbhz, "dB-Hz"),
                opt(b.median_cn0_dbhz, "dB-Hz"),
                opt(b.max_abs_doppler_hz.map(|x| x / 1e3), "kHz"),
                b.iono_delay_at_peak_m
                    .map(|x| format!("{x:.2} m"))
                    .unwrap_or_else(|| "n/a".into())
            ));
        }
    }
    if let Some(g) = &r.gnss {
        s.push_str(&format!(
            "  GNSS {} {}: {} in view, C/N0 {} to {} (median {})\n",
            g.constellation,
            g.band,
            g.satellites_in_view,
            opt(g.min_cn0_dbhz, "dB-Hz"),
            opt(g.max_cn0_dbhz, "dB-Hz"),
            opt(g.median_cn0_dbhz, "dB-Hz")
        ));
    }
    if let Some(c) = &r.comparison {
        s.push_str(&format!(
            "  LEO {} peak {:.1} dB-Hz is {:.1} dB above the GNSS median; above the strongest \
             GNSS carrier for {:.0} s\n",
            c.leo_band,
            c.leo_peak_cn0_dbhz,
            c.leo_peak_above_gnss_median_db,
            c.leo_seconds_above_gnss_max
        ));
    }
    if let Some(iot) = &r.iot {
        for row in &iot.rows {
            s.push_str(&format!(
                "  IoT {}: cold TTFF {:.1} s ({:.0} mJ), hot {:.2} s ({:.1} mJ)\n",
                row.signal,
                row.cold.ttff_s,
                row.cold.energy_per_fix_mj,
                row.hot.ttff_s,
                row.hot.energy_per_fix_mj
            ));
        }
    }
    if let Some(sp) = &r.spoof {
        let t = |d: &SpoofDetection| match (d.detect_time_s, d.offset_at_detection_m) {
            (Some(t), Some(o)) => format!("{t:.0} s ({o:.1} m)"),
            _ => "not detected".to_string(),
        };
        s.push_str(&format!(
            "  Spoofer from {:.0} s (jump {:.1} m, push {:.3} m/s): Doppler test GNSS {}, LEO \
             {}, fused {}; cross-band {}\n",
            sp.onset_s,
            sp.offset_m,
            sp.push_rate_m_s,
            t(&sp.gnss),
            t(&sp.leo),
            t(&sp.fused),
            t(&sp.cross_band)
        ));
    }
    s
}

const COLOURS: [&str; 8] = [CYAN, BLUE, LIME, MAGENTA, INK_2, AMBER, CORAL, INK_3];

/// Two panels over time: C/N0 of every band of the first LEO satellite with the GNSS carriers
/// in grey, and the Doppler of each LEO satellite's first band.
pub fn to_svg(r: &LeoPassReport) -> String {
    let (w, h) = (900.0, 520.0);
    let sub = match &r.comparison {
        Some(c) => format!(
            "{} user · LEO peak {:.1} dB-Hz, {:.1} dB above the GNSS median · MODELLED",
            r.user.environment, c.leo_peak_cn0_dbhz, c.leo_peak_above_gnss_median_db
        ),
        None => format!("{} user · MODELLED", r.user.environment),
    };
    let mut s = crate::chart::frame_open(w, h, "LEO pass: C/N0 per band and Doppler", &sub);
    let (ml, pw) = (70.0, 800.0);
    let x = |t: f64| ml + pw * t / r.duration_s.max(1.0);
    // Panel 1: C/N0.
    let (top1, ph1) = (70.0, 230.0);
    let (lo, hi) = (20.0, 80.0);
    let y1 = |v: f64| top1 + ph1 - ph1 * ((v - lo) / (hi - lo)).clamp(0.0, 1.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top1,
        pw,
        top1 + ph1,
        "C/N0 (dB-Hz, 20 to 80): LEO bands in colour, GNSS in grey",
    ));
    for v in [30.0, 40.0, 50.0, 60.0, 70.0] {
        s.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{:.1}\" x2=\"{:.0}\" y2=\"{:.1}\" stroke=\"{GRID}\"/>\
             <text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"10\" fill=\"{MUTED}\">{v:.0}</text>",
            y1(v),
            ml + pw,
            y1(v),
            ml - 6.0,
            y1(v) + 3.0
        ));
    }
    if let Some(g) = &r.gnss {
        for gs in &g.satellites {
            let pts: Vec<String> = gs
                .series
                .iter()
                .filter_map(|e| e.cn0_dbhz.map(|c| format!("{:.1},{:.1}", x(e.t_s), y1(c))))
                .collect();
            if pts.len() > 1 {
                s.push_str(&format!(
                    "<polyline fill=\"none\" stroke=\"{INK_4}\" stroke-width=\"1\" points=\"{}\"/>",
                    pts.join(" ")
                ));
            }
        }
    }
    if let Some(sat) = r.satellites.first() {
        for (bi, b) in sat.bands.iter().enumerate() {
            let pts: Vec<String> = sat
                .series
                .iter()
                .filter(|e| e.visible)
                .map(|e| format!("{:.1},{:.1}", x(e.t_s), y1(e.bands[bi].cn0_dbhz)))
                .collect();
            let col = COLOURS[bi % COLOURS.len()];
            if pts.len() > 1 {
                s.push_str(&format!(
                    "<polyline fill=\"none\" stroke=\"{col}\" stroke-width=\"2\" points=\"{}\"/>",
                    pts.join(" ")
                ));
            }
            s.push_str(&format!(
                "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"11\" fill=\"{col}\">{}</text>",
                ml + 8.0 + 70.0 * bi as f64,
                top1 + 14.0,
                b.name
            ));
        }
    }
    // Panel 2: Doppler of the first band of each LEO satellite.
    let (top2, ph2) = (340.0, 140.0);
    let dmax = r
        .satellites
        .iter()
        .flat_map(|s| s.bands.first().and_then(|b| b.max_abs_doppler_hz))
        .fold(1.0_f64, f64::max);
    let y2 = |v: f64| top2 + ph2 / 2.0 - (ph2 / 2.0) * (v / dmax).clamp(-1.0, 1.0);
    s.push_str(&crate::chart::panel_axes(
        ml,
        top2,
        pw,
        top2 + ph2,
        &format!(
            "Doppler of each LEO satellite's first band (±{:.1} kHz full scale)",
            dmax / 1e3
        ),
    ));
    s.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{:.1}\" x2=\"{:.0}\" y2=\"{:.1}\" stroke=\"{AXIS}\"/>",
        top2 + ph2 / 2.0,
        ml + pw,
        top2 + ph2 / 2.0
    ));
    for (si, sat) in r.satellites.iter().enumerate() {
        let pts: Vec<String> = sat
            .series
            .iter()
            .filter(|e| e.visible)
            .map(|e| format!("{:.1},{:.1}", x(e.t_s), y2(e.bands[0].doppler_hz)))
            .collect();
        if pts.len() > 1 {
            s.push_str(&format!(
                "<polyline fill=\"none\" stroke=\"{}\" stroke-width=\"1.6\" points=\"{}\"/>",
                COLOURS[si % COLOURS.len()],
                pts.join(" ")
            ));
        }
    }
    s.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"505\" font-size=\"10\" fill=\"{MUTED}\">time since epoch, 0 to {:.0} s</text></svg>",
        r.duration_s
    ));
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run(src: &str) -> LeoPassReport {
        let scn: LeoPassScenario = toml::from_str(src).expect("toml");
        scn.compute().expect("compute")
    }

    #[test]
    fn defaults_run_with_no_preset_named_and_every_number_has_a_unit() {
        let (json, text, svg) = LeoPassScenario::default().run_output().unwrap();
        let doc: serde_json::Value = serde_json::from_str(&json).unwrap();
        let audit = crate::field_schema::audit_document(&doc);
        assert!(
            audit.is_complete(),
            "missing {:?} malformed {:?}",
            audit.missing,
            audit.malformed
        );
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert!(text.contains("LEO pass"));
        assert_eq!(doc["satellites"][0]["system"], "generic-leo");
    }

    #[test]
    fn a_fully_custom_band_needs_no_preset() {
        let r = run(
            "kind = \"leo-pass\"\n[[satellite]]\nsystem = \"none\"\naltitude_km = 700.0\n\
             inclination_deg = 60.0\n[[satellite.band]]\nname = \"K\"\nfrequency_mhz = 1500.0\n\
             eirp_dbw = 3.0\npattern = \"isoflux\"\nedge_elevation_deg = 15.0\n[gnss]\nenabled = false\n",
        );
        assert_eq!(r.satellites[0].bands[0].name, "K");
        assert_eq!(r.satellites[0].source_kind, "SCENARIO");
        assert!(r.satellites[0].bands[0].peak_cn0_dbhz.is_some());
    }

    #[test]
    fn the_leo_pass_is_a_bell_above_flat_gnss() {
        let r =
            run("kind = \"leo-pass\"\n[[satellite]]\nbands = [\"L\"]\nmax_elevation_deg = 80.0\n");
        let s = &r.satellites[0];
        let vis: Vec<&SatEpoch> = s.series.iter().filter(|e| e.visible).collect();
        let cn: Vec<f64> = vis.iter().map(|e| e.bands[0].cn0_dbhz).collect();
        let (imax, _) = cn
            .iter()
            .enumerate()
            .max_by(|a, b| a.1.total_cmp(b.1))
            .unwrap();
        // Rises to the peak and falls after it (allowing flat steps).
        assert!(cn[..imax].windows(2).all(|w| w[1] >= w[0] - 1e-9));
        assert!(cn[imax..].windows(2).all(|w| w[1] <= w[0] + 1e-9));
        let c = r.comparison.unwrap();
        assert!(c.leo_peak_above_gnss_median_db > 3.0, "{c:?}");
        let g = r.gnss.unwrap();
        assert!(
            g.min_cn0_dbhz.unwrap() > 30.0 && g.max_cn0_dbhz.unwrap() < 56.0,
            "{g:?}"
        );
        // A pass of minutes.
        assert!((120.0..900.0).contains(&s.pass.duration_above_mask_s));
    }

    #[test]
    fn closed_form_doppler_agrees_with_the_numerical_derivative() {
        let r = run("kind = \"leo-pass\"\n[[satellite]]\nj2 = false\n[gnss]\nenabled = false\n");
        let c = &r.satellites[0].doppler_check;
        assert!(c.max_doppler_diff_hz < 0.01, "{c:?}");
        assert!(c.max_doppler_rate_diff_hz_s < 0.01, "{c:?}");
    }

    #[test]
    fn indoor_uhf_suffers_less_building_loss_than_c_band() {
        let r = run(
            "kind = \"leo-pass\"\n[user]\nenvironment = \"indoor\"\n[[satellite]]\nbands = [\"UHF\", \"C\"]\n",
        );
        let s = &r.satellites[0];
        let e = s.series.iter().find(|e| e.visible).unwrap();
        assert!(e.bands[0].building_entry_db < e.bands[1].building_entry_db);
    }

    #[test]
    fn rain_attenuates_c_band_more_than_s_band() {
        let r = run(
            "kind = \"leo-pass\"\n[atmosphere]\nrain_rate_mm_h = 50.0\n[[satellite]]\nbands = [\"S\", \"C\"]\n",
        );
        let e = r.satellites[0].series.iter().find(|e| e.visible).unwrap();
        assert!(e.bands[1].rain_db > e.bands[0].rain_db && e.bands[0].rain_db > 0.0);
    }

    #[test]
    fn iono_delay_scales_as_one_over_f_squared_across_bands() {
        let r = run("kind = \"leo-pass\"\n[gnss]\nenabled = false\n");
        let s = &r.satellites[0];
        let e = s.series.iter().find(|e| e.visible).unwrap();
        let (f0, f1) = (s.bands[0].frequency_hz, s.bands[1].frequency_hz);
        let ratio = e.bands[0].iono_delay_m / e.bands[1].iono_delay_m;
        assert!((ratio - (f1 / f0).powi(2)).abs() < 1e-9 * ratio);
        assert!(!r.iono_free.is_empty());
    }

    #[test]
    fn a_walker_constellation_and_a_tle_satellite_both_run() {
        let r = run(
            "kind = \"leo-pass\"\nduration_s = 1800.0\nstep_s = 10.0\n[gnss]\nenabled = false\n\
             [[leo_constellation]]\nsystem = \"generic-c-band\"\nmax_satellites = 3\n",
        );
        assert!(!r.satellites.is_empty() && r.satellites.len() <= 3);
    }

    #[test]
    fn the_run_is_deterministic_and_bad_inputs_are_rejected() {
        let a = run("kind = \"leo-pass\"\n[iot]\n");
        let b = run("kind = \"leo-pass\"\n[iot]\n");
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
        assert!(a.iot.is_some_and(|i| !i.rows.is_empty()));
        for bad in [
            "kind = \"leo-pass\"\n[user]\nenvironment = \"space\"\n",
            "kind = \"leo-pass\"\nstep_s = 0.0\n",
            "kind = \"leo-pass\"\n[[satellite]]\nsystem = \"nope\"\n",
            "kind = \"leo-pass\"\n[[satellite]]\nbands = [\"Q\"]\n",
            "kind = \"leo-pass\"\n[[satellite]]\norbit = \"tle\"\n",
            "kind = \"leo-pass\"\n[user]\nlat_deg = 80.0\n[[satellite]]\ninclination_deg = 30.0\nsun_synchronous = false\n",
            "kind = \"leo-pass\"\nepoch = \"yesterday\"\n",
        ] {
            let scn: LeoPassScenario = toml::from_str(bad).unwrap();
            assert!(scn.compute().is_err(), "{bad}");
        }
    }
}
