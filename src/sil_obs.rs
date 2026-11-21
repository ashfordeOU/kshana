// SPDX-License-Identifier: AGPL-3.0-only
//! **Software-in-the-loop (SIL) observation generator with a street-canyon multipath and
//! NLOS model, and an observation-statistics comparison.** MODELLED.
//!
//! `kshana sil-obs generate` writes a RINEX 3.04 observation file a receiver-processing
//! pipeline (RTKLIB, gLAB, the engine's own `pvt` kind, a customer's positioning code) can
//! read in continuous integration, with no radio, no simulator hardware and no licence. The
//! satellites are the ones of a real broadcast navigation file: each pseudorange is built from
//! the broadcast orbit and clock at the signal transmit time, with the Earth's rotation during
//! the signal travel time, the single-frequency group delay (`TGD`, `BGD`), the Klobuchar
//! ionosphere of the file's header and the Saastamoinen/Niell troposphere of
//! [`crate::gnss_sim`]. A pipeline that removes those models recovers the stated antenna
//! position; the test suite does exactly that with [`crate::pvt`].
//!
//! On top of that clean signal the generator adds a **street canyon** ([`Canyon`]): two
//! parallel walls of stated heights along a street of stated axis and width, the antenna at a
//! stated offset from the centreline. For each satellite the direct ray is tested against the
//! wall on the satellite's side and a specular reflection off the opposite wall is traced
//! ([`canyon_paths`]):
//!
//! * **LOS**: direct ray clear, no reflection reaches the antenna;
//! * **LOS + multipath**: direct ray clear and a reflection arrives with excess path
//!   `2·d·cos(el)·|sin(az − axis)|` (`d` the antenna's distance to the reflecting wall) and
//!   relative amplitude set by the stated reflection loss. The code error is the coherent
//!   early-minus-late DLL error of a triangular correlation with that one reflection
//!   ([`dll_multipath_error_m`], the four-region envelope of Braasch, *Multipath effects*, in
//!   *Global Positioning System: Theory and Applications* vol. I, AIAA 1996); the carrier error
//!   is `atan2(α sinθ, 1 + α cosθ)·λ/2π`, and C/N0 takes the amplitude `|1 + α e^{jθ}|`;
//! * **NLOS**: direct ray blocked, the reflection arrives: code and carrier carry the whole
//!   excess path and C/N0 drops by the reflection loss;
//! * **blocked**: neither path; the satellite is not written.
//!
//! Thermal noise follows the C/N0 through the standard coherent DLL and PLL jitter formulas
//! (Kaplan & Hegarty, *Understanding GPS/GNSS*, 3rd ed., section 8.7). A path-state change or a
//! C/N0 below the tracking threshold breaks the carrier arc: the loss-of-lock indicator is set
//! and a new integer ambiguity is drawn. Every term written to the observation file is also
//! written, per satellite and epoch, to a JSON Lines truth file, so a CI test of an NLOS
//! detector or a multipath mitigation has its labels.
//!
//! `kshana sil-obs compare` reads two observation files (for example a recorded urban drive
//! and a simulation of it) and compares what can be measured from observations alone, with no
//! ephemeris: satellites per epoch, the C/N0 distribution, the detrended code-minus-carrier
//! (multipath plus code noise) distribution overall and per C/N0 bin, and arc breaks. The
//! distributions are compared with the two-sample Kolmogorov–Smirnov distance.
//!
//! **Honest scope.** The canyon is one infinite street with flat vertical walls: no street
//! ends, no diffraction over the roof edge, no ground reflection, no foliage, no diffuse
//! scattering. Galileo E1 BOC(1,1) is given the triangular correlation of a 1.023 Mchip/s
//! BPSK code, which over-states its multipath error. The C/N0 against elevation is a stated
//! straight line in `sin(el)`, not a receiver's. Nothing here has been compared with a
//! recorded urban dataset in this repository: `compare` is the tool for that (docs/SIL-OBS.md
//! gives the UrbanNav procedure), and until a comparison is published the generator's urban
//! output is MODELLED.

use crate::frames::{ecef_to_geodetic, geodetic_to_ecef, look_angles, Geodetic, Vec3};
use crate::gnss_sim::{klobuchar_delay_m, tropo_delay_m, KlobucharCoeffs, Meteo, C_M_PER_S};
use crate::portable_math::PortableFloat;
use crate::rinex::{EpochUtc, RinexEphemeris};
use crate::rinex_obs::RinexObs;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
use std::fmt::Write as _;

/// Schema id of the truth file's header line.
pub const TRUTH_SCHEMA: &str = "kshana.sil-obs-truth/1";
/// Schema id of the comparison document.
pub const COMPARE_SCHEMA: &str = "kshana.sil-obs-compare/1";
/// GPS L1 / Galileo E1 carrier (Hz).
pub const F_L1: f64 = 1_575_420_000.0;
/// GPS L2 carrier (Hz).
pub const F_L2: f64 = 1_227_600_000.0;
/// GPS L5 / Galileo E5a carrier (Hz).
pub const F_L5: f64 = 1_176_450_000.0;
/// Chip length of a 1.023 Mchip/s code (m).
const CHIP_1023_M: f64 = C_M_PER_S / 1.023e6;
/// Chip length of a 10.23 Mchip/s code (m).
const CHIP_1023X10_M: f64 = C_M_PER_S / 10.23e6;

// ─────────────────────────────── scenario ───────────────────────────────

/// A SIL observation scenario (TOML).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SilScenario {
    /// Run settings: start, duration, step, seed, systems, mask and marker (`[sil]`).
    pub sil: SilCfg,
    /// The antenna's start position, clock and motion (`[receiver]`).
    pub receiver: ReceiverCfg,
    /// Optional street canyon; without one every satellite above the mask is LOS (`[canyon]`).
    #[serde(default)]
    pub canyon: Option<Canyon>,
    /// C/N0, tracking-loop and noise settings (`[signal]`); defaults when absent.
    #[serde(default)]
    pub signal: SignalCfg,
}

/// Run settings.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SilCfg {
    /// First epoch, GPS time, `YYYY-MM-DDTHH:MM:SS`.
    pub start: String,
    /// Duration (s).
    pub duration_s: f64,
    /// Epoch interval (s).
    pub step_s: f64,
    /// Seed of the noise and ambiguity generator.
    #[serde(default)]
    pub seed: u64,
    /// Systems to simulate: `"G"` GPS, `"E"` Galileo.
    #[serde(default = "default_systems")]
    pub systems: Vec<String>,
    /// Write a second frequency (GPS L2C, Galileo E5a).
    #[serde(default)]
    pub dual_frequency: bool,
    /// Elevation mask (deg).
    #[serde(default = "default_mask")]
    pub mask_deg: f64,
    /// RINEX marker name.
    #[serde(default = "default_marker")]
    pub marker: String,
}

fn default_systems() -> Vec<String> {
    vec!["G".into()]
}
fn default_mask() -> f64 {
    5.0
}
fn default_marker() -> String {
    "SIL1".into()
}

/// The antenna: start position, clock and a constant-speed motion.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ReceiverCfg {
    /// WGS-84 geodetic latitude of the antenna at the first epoch (deg).
    pub lat_deg: f64,
    /// WGS-84 longitude of the antenna at the first epoch (deg).
    pub lon_deg: f64,
    /// Height of the antenna above the WGS-84 ellipsoid at the first epoch (m).
    pub height_m: f64,
    /// Receiver clock bias at the first epoch (m).
    #[serde(default)]
    pub clock_bias_m: f64,
    /// Receiver clock drift (m/s).
    #[serde(default)]
    pub clock_drift_m_per_s: f64,
    /// Speed (m/s) along `heading_deg`, or along the canyon axis when there is a canyon.
    #[serde(default)]
    pub speed_mps: f64,
    /// Heading (deg from north) when there is no canyon.
    #[serde(default)]
    pub heading_deg: f64,
}

/// One straight street with vertical walls on both sides. The canyon moves with the antenna
/// (an infinite street).
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Canyon {
    /// Azimuth of the street axis (deg from north). The right-hand wall is the one at
    /// `axis + 90°`.
    pub axis_az_deg: f64,
    /// Wall-to-wall width (m).
    pub width_m: f64,
    /// Height of the left-hand wall (m above the ground).
    pub height_left_m: f64,
    /// Height of the right-hand wall (m above the ground).
    pub height_right_m: f64,
    /// Antenna offset from the centreline toward the right-hand wall (m).
    #[serde(default)]
    pub offset_m: f64,
    /// Antenna height above the ground (m).
    #[serde(default = "default_ant_h")]
    pub antenna_height_m: f64,
    /// Power loss of the reflection (dB, positive).
    #[serde(default = "default_refl_loss")]
    pub reflection_loss_db: f64,
}

fn default_ant_h() -> f64 {
    1.5
}
fn default_refl_loss() -> f64 {
    6.0
}

/// Signal, tracking and noise settings.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SignalCfg {
    /// C/N0 at zenith in open sky (dB-Hz).
    #[serde(default = "default_cn0_zenith")]
    pub cn0_zenith_dbhz: f64,
    /// C/N0 lost from zenith to the horizon, linear in `sin(el)` (dB).
    #[serde(default = "default_cn0_slope")]
    pub cn0_slope_db: f64,
    /// Second-frequency C/N0 offset from the first (dB).
    #[serde(default = "default_cn0_f2")]
    pub cn0_f2_offset_db: f64,
    /// Below this C/N0 the signal is not tracked (dB-Hz).
    #[serde(default = "default_track")]
    pub track_threshold_dbhz: f64,
    /// DLL noise bandwidth (Hz).
    #[serde(default = "default_dll_bw")]
    pub dll_bandwidth_hz: f64,
    /// Early-late correlator spacing (chips, full spacing).
    #[serde(default = "default_spacing")]
    pub correlator_spacing_chips: f64,
    /// PLL noise bandwidth (Hz).
    #[serde(default = "default_pll_bw")]
    pub pll_bandwidth_hz: f64,
    /// Coherent integration time (s).
    #[serde(default = "default_tint")]
    pub integration_s: f64,
    /// Add thermal noise.
    #[serde(default = "default_true")]
    pub noise: bool,
}

fn default_cn0_zenith() -> f64 {
    48.0
}
fn default_cn0_slope() -> f64 {
    10.0
}
fn default_cn0_f2() -> f64 {
    -3.0
}
fn default_track() -> f64 {
    25.0
}
fn default_dll_bw() -> f64 {
    1.0
}
fn default_spacing() -> f64 {
    0.2
}
fn default_pll_bw() -> f64 {
    15.0
}
fn default_tint() -> f64 {
    0.02
}
fn default_true() -> bool {
    true
}

impl Default for SignalCfg {
    fn default() -> Self {
        Self {
            cn0_zenith_dbhz: default_cn0_zenith(),
            cn0_slope_db: default_cn0_slope(),
            cn0_f2_offset_db: default_cn0_f2(),
            track_threshold_dbhz: default_track(),
            dll_bandwidth_hz: default_dll_bw(),
            correlator_spacing_chips: default_spacing(),
            pll_bandwidth_hz: default_pll_bw(),
            integration_s: default_tint(),
            noise: true,
        }
    }
}

/// Parse a `YYYY-MM-DDTHH:MM:SS[.fff]` GPS-time epoch.
pub fn parse_epoch(s: &str) -> Option<EpochUtc> {
    let (d, t) = s.trim().trim_end_matches('Z').split_once('T')?;
    let mut dp = d.split('-');
    let year = dp.next()?.parse().ok()?;
    let month: u32 = dp.next()?.parse().ok()?;
    let day: u32 = dp.next()?.parse().ok()?;
    let mut tp = t.split(':');
    let hour: u32 = tp.next()?.parse().ok()?;
    let minute: u32 = tp.next()?.parse().ok()?;
    let second: f64 = tp.next()?.parse().ok()?;
    if dp.next().is_some()
        || tp.next().is_some()
        || !(1..=12).contains(&month)
        || !(1..=31).contains(&day)
        || hour > 23
        || minute > 59
        || !(0.0..60.0).contains(&second)
    {
        return None;
    }
    Some(EpochUtc {
        year,
        month,
        day,
        hour,
        minute,
        second,
    })
}

/// The calendar epoch `secs` seconds after `start` (GPS time, no leap seconds).
pub fn epoch_add(start: &EpochUtc, secs: f64) -> EpochUtc {
    let base_days = crate::gnss_time::days_from_civil(start.year as i64, start.month, start.day);
    let sod = start.hour as f64 * 3600.0 + start.minute as f64 * 60.0 + start.second + secs;
    // Round to 0.1 µs before the day carry, so a time a hair before midnight rounds to the
    // next day's 00:00:00 rather than to 24:00:00 (or 60 s) on this one.
    let sod = (sod * 1e7).round() / 1e7;
    let day_off = (sod / 86_400.0).floor();
    let rem = sod - day_off * 86_400.0;
    let (y, m, d) = crate::gnss_time::civil_from_days(base_days + day_off as i64);
    let hour = (rem / 3600.0).floor() as u32;
    let minute = ((rem - hour as f64 * 3600.0) / 60.0).floor() as u32;
    let second = rem - hour as f64 * 3600.0 - minute as f64 * 60.0;
    EpochUtc {
        year: y as i32,
        month: m,
        day: d,
        hour: hour.min(23),
        minute: minute.min(59),
        second,
    }
}

fn day_of_year(e: &EpochUtc) -> f64 {
    let d0 = crate::gnss_time::days_from_civil(e.year as i64, 1, 1);
    let d = crate::gnss_time::days_from_civil(e.year as i64, e.month, e.day);
    (d - d0 + 1) as f64
}

// ─────────────────────────────── canyon ───────────────────────────────

/// How a satellite's signal reaches the antenna.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum PathState {
    /// Direct ray only.
    Los,
    /// Direct ray and one wall reflection.
    LosMultipath,
    /// Reflection only.
    Nlos,
    /// Neither.
    Blocked,
}

impl PathState {
    /// The snake_case name of the state (as serialised), the key of the state counts.
    pub fn as_str(self) -> &'static str {
        match self {
            PathState::Los => "los",
            PathState::LosMultipath => "los_multipath",
            PathState::Nlos => "nlos",
            PathState::Blocked => "blocked",
        }
    }
}

/// The paths of one satellite in the canyon.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CanyonPaths {
    /// Which paths reach the antenna (direct, reflection, both or neither).
    pub state: PathState,
    /// Excess path of the reflection over the direct path (m); zero without one.
    pub excess_m: f64,
    /// Amplitude of the reflection relative to the unobstructed direct signal; zero
    /// without one.
    pub alpha: f64,
}

/// Trace the direct ray and the opposite-wall reflection of a satellite at azimuth `az_rad`
/// and elevation `el_rad` (see the module documentation). Without a canyon every satellite
/// above the horizon is LOS.
pub fn canyon_paths(c: Option<&Canyon>, az_rad: f64, el_rad: f64) -> CanyonPaths {
    let los = CanyonPaths {
        state: PathState::Los,
        excess_m: 0.0,
        alpha: 0.0,
    };
    let Some(c) = c else {
        return los;
    };
    // Lateral component of the satellite direction: positive toward the right-hand wall.
    let s = (az_rad - c.axis_az_deg.to_radians()).psin();
    if s.abs() < 1e-9 {
        return los;
    }
    let half = 0.5 * c.width_m;
    let (d_right, d_left) = (half - c.offset_m, half + c.offset_m);
    let (d_sat, h_sat, d_opp, h_opp) = if s > 0.0 {
        (d_right, c.height_right_m, d_left, c.height_left_m)
    } else {
        (d_left, c.height_left_m, d_right, c.height_right_m)
    };
    let tan_el = el_rad.ptan();
    let a = c.antenna_height_m;
    let s = s.abs();
    let direct_clear = a + tan_el * d_sat / s >= h_sat;
    // Specular reflection off the opposite wall: the reflection point must be on the wall,
    // and the ray after it must clear the satellite-side wall.
    let refl_height = a + tan_el * d_opp / s;
    let after_height = a + tan_el * (2.0 * d_opp + d_sat) / s;
    let reflects = refl_height <= h_opp && after_height >= h_sat;
    let alpha = 10f64.ppowf(-c.reflection_loss_db / 20.0);
    let excess = 2.0 * d_opp * el_rad.pcos() * s;
    match (direct_clear, reflects) {
        (true, false) => los,
        (true, true) => CanyonPaths {
            state: PathState::LosMultipath,
            excess_m: excess,
            alpha,
        },
        (false, true) => CanyonPaths {
            state: PathState::Nlos,
            excess_m: excess,
            alpha,
        },
        (false, false) => CanyonPaths {
            state: PathState::Blocked,
            excess_m: 0.0,
            alpha: 0.0,
        },
    }
}

/// The coherent early-minus-late DLL tracking error (m) for the direct signal plus one
/// reflection of relative amplitude `alpha`, excess delay `tau_m` and relative carrier phase
/// `theta_rad`, with an ideal triangular correlation of chip length `chip_m` and full
/// early-late spacing `spacing_chips` (at most one chip). The four regions of the envelope
/// (Braasch 1996): `x = αcτ/(1+αc)` while the late correlator is past the reflected peak,
/// the plateau `x = αc·d`, the decay `x = αc(L+d−τ)/(2−αc)`, and zero beyond `τ = L + d`,
/// with `c = cos θ` and `d` half the spacing in metres. `alpha` is clamped to `[0, 0.9]`.
pub fn dll_multipath_error_m(
    alpha: f64,
    tau_m: f64,
    theta_rad: f64,
    chip_m: f64,
    spacing_chips: f64,
) -> f64 {
    let ac = alpha.clamp(0.0, 0.9) * theta_rad.pcos();
    let l = chip_m;
    let d = 0.5 * spacing_chips.clamp(1e-3, 1.0) * l;
    let tau = tau_m.max(0.0);
    if tau <= d * (1.0 + ac) {
        ac * tau / (1.0 + ac)
    } else if tau <= l - d + ac * d {
        ac * d
    } else if tau < l + d {
        ac * (l + d - tau) / (2.0 - ac)
    } else {
        0.0
    }
}

/// Carrier-phase error (m) of the composite signal for a reflection of relative amplitude
/// `alpha` and relative phase `theta_rad`, at wavelength `lambda_m`.
pub fn carrier_multipath_error_m(alpha: f64, theta_rad: f64, lambda_m: f64) -> f64 {
    let a = alpha.clamp(0.0, 0.9);
    (a * theta_rad.psin()).patan2(1.0 + a * theta_rad.pcos()) * lambda_m
        / (2.0 * std::f64::consts::PI)
}

/// Coherent early-minus-late DLL code jitter (m), Kaplan & Hegarty 3rd ed. eq. 8.38 form:
/// `σ = L·sqrt(B·D/(2·C/N0)·(1 + 2/(T·C/N0·(2−D))))`.
pub fn dll_jitter_m(cn0_dbhz: f64, bw_hz: f64, spacing_chips: f64, t_s: f64, chip_m: f64) -> f64 {
    let cn0 = 10f64.ppowf(cn0_dbhz / 10.0);
    let dsp = spacing_chips.clamp(1e-3, 1.0);
    chip_m * (bw_hz * dsp / (2.0 * cn0) * (1.0 + 2.0 / (t_s * cn0 * (2.0 - dsp)))).sqrt()
}

/// PLL thermal jitter (m): `λ/2π·sqrt(B/(C/N0)·(1 + 1/(2T·C/N0)))`.
pub fn pll_jitter_m(cn0_dbhz: f64, bw_hz: f64, t_s: f64, lambda_m: f64) -> f64 {
    let cn0 = 10f64.ppowf(cn0_dbhz / 10.0);
    lambda_m / (2.0 * std::f64::consts::PI) * (bw_hz / cn0 * (1.0 + 1.0 / (2.0 * t_s * cn0))).sqrt()
}

// ─────────────────────────────── signals ───────────────────────────────

/// One simulated signal: its RINEX code suffix, carrier, chip length and band index.
#[derive(Clone, Copy, Debug)]
struct Sig {
    /// Band digit and attribute, e.g. `"1C"`.
    rinex: &'static str,
    freq_hz: f64,
    chip_m: f64,
    /// 0 for the first frequency (clock reference), 1 for the second.
    band: usize,
}

fn signals_for(system: char, dual: bool) -> Vec<Sig> {
    let mut v = vec![Sig {
        rinex: "1C",
        freq_hz: F_L1,
        chip_m: CHIP_1023_M,
        band: 0,
    }];
    if dual {
        v.push(match system {
            'E' => Sig {
                rinex: "5Q",
                freq_hz: F_L5,
                chip_m: CHIP_1023X10_M,
                band: 1,
            },
            _ => Sig {
                rinex: "2L",
                freq_hz: F_L2,
                chip_m: CHIP_1023_M,
                band: 1,
            },
        });
    }
    v
}

/// The satellite clock (s) seen on signal `sig`: the broadcast clock at the first frequency
/// minus the reference pair's group delay, and for the second frequency the further
/// `(γ − 1)·TGD` (`γ = (f1/f2)²`; GPS L1/L2 `TGD`, Galileo `BGD(E1,E5a)`).
fn sat_clock_s(eph: &RinexEphemeris, t_tx: f64, sig: &Sig) -> f64 {
    let c1 = eph.sv_clock_bias_s(t_tx) - eph.clock_reference_group_delay_s();
    if sig.band == 0 {
        c1
    } else {
        let g = (F_L1 / sig.freq_hz).ppowi(2);
        c1 - (g - 1.0) * eph.tgd
    }
}

/// Receiver position (ECEF) after `t` seconds.
fn receiver_at(scn: &SilScenario, t: f64) -> Vec3 {
    let g0 = Geodetic {
        lat_rad: scn.receiver.lat_deg.to_radians(),
        lon_rad: scn.receiver.lon_deg.to_radians(),
        alt_m: scn.receiver.height_m,
    };
    let p0 = geodetic_to_ecef(g0);
    let dist = scn.receiver.speed_mps * t;
    if dist == 0.0 {
        return p0;
    }
    let hdg = scn
        .canyon
        .as_ref()
        .map(|c| c.axis_az_deg)
        .unwrap_or(scn.receiver.heading_deg)
        .to_radians();
    let (e, n) = (dist * hdg.psin(), dist * hdg.pcos());
    let (sla, cla) = g0.lat_rad.psin_cos();
    let (slo, clo) = g0.lon_rad.psin_cos();
    [
        p0[0] - slo * e - sla * clo * n,
        p0[1] + clo * e - sla * slo * n,
        p0[2] + cla * n,
    ]
}

/// Geometric range and the satellite position (ECEF at reception) for reception at system
/// time `t_rx` (time of week, s): the transmit time is iterated on the light time and the
/// satellite position rotated by the Earth's rotation over the travel time.
fn light_time(eph: &RinexEphemeris, rx: Vec3, t_rx: f64) -> (f64, f64, Vec3) {
    let mut tau = 0.075;
    let mut sat = [0.0; 3];
    let mut rho = 0.0;
    for _ in 0..6 {
        let raw = eph.sv_position_ecef(t_rx - tau);
        sat = crate::pvt::sagnac_rotate(raw, tau);
        rho =
            ((sat[0] - rx[0]).powi(2) + (sat[1] - rx[1]).powi(2) + (sat[2] - rx[2]).powi(2)).sqrt();
        tau = rho / C_M_PER_S;
    }
    (rho, t_rx - tau, sat)
}

/// One satellite-signal sample of the truth file.
#[derive(Clone, Debug, Serialize)]
pub struct TruthRow {
    /// Time since the scenario start (s).
    pub t: f64,
    /// Satellite id, system letter and two-digit PRN (e.g. `G05`).
    pub sat: String,
    /// RINEX observation code suffix of the signal (e.g. `1C`).
    pub signal: String,
    /// Path state of the satellite in the canyon at this epoch.
    pub state: PathState,
    /// Elevation of the satellite seen from the antenna (deg).
    pub el_deg: f64,
    /// Azimuth of the satellite seen from the antenna (deg from north).
    pub az_deg: f64,
    /// Modelled C/N0 including the multipath or NLOS effect (dB-Hz); -1 when blocked.
    pub cn0_dbhz: f64,
    /// Excess path of the reflection over the direct path (m); zero without one.
    pub excess_path_m: f64,
    /// Code multipath error (m): the DLL error for LOS + multipath, the excess path for NLOS.
    pub code_multipath_m: f64,
    /// Carrier multipath error (m): the phase error for LOS + multipath, the excess path for NLOS.
    pub carrier_multipath_m: f64,
    /// Code noise added from the DLL jitter (m); zero when untracked or noise is off.
    pub code_noise_m: f64,
    /// Carrier noise added from the PLL jitter (m); zero when untracked or noise is off.
    pub carrier_noise_m: f64,
    /// Klobuchar ionospheric delay scaled to this signal's frequency (m).
    pub iono_m: f64,
    /// Saastamoinen/Niell tropospheric delay (m).
    pub tropo_m: f64,
    /// Geometric range from the satellite at transmit time to the antenna at reception (m).
    pub geometric_range_m: f64,
    /// Whether the signal is tracked (not blocked and C/N0 at or above the tracking threshold).
    pub tracked: bool,
    /// Whether a new carrier arc (fresh ambiguity) starts here: first tracked epoch, or
    /// entering or leaving NLOS.
    pub arc_break: bool,
}

/// A generated observation set.
#[derive(Clone, Debug)]
pub struct SilOutput {
    /// RINEX 3.04 observation text.
    pub rinex: String,
    /// JSON Lines truth text (header line first).
    pub truth: String,
    /// Epochs written to the RINEX file (those with at least one observation).
    pub n_epochs: usize,
    /// Satellite-signal samples written.
    pub n_obs: usize,
    /// Counts of path states over satellite-epochs above the mask.
    pub states: BTreeMap<&'static str, usize>,
}

/// Errors of [`generate`]; the CLI maps them to catalogue messages.
#[derive(Clone, Debug, PartialEq)]
pub enum SilError {
    /// The start epoch could not be parsed (the given text).
    BadStart(String),
    /// The step is not positive and finite, the duration is negative or not finite, or the
    /// run would exceed a million epochs.
    BadTiming,
    /// The navigation file has no satellite of the requested systems.
    NoSatellites,
    /// A system other than `G` or `E` was requested (the given text).
    UnknownSystem(String),
    /// A canyon parameter is not finite or out of range (width, offset, reflection loss,
    /// antenna height).
    BadCanyon,
}

/// Generate the observations of `scn` from the broadcast records `ephs` (and the nav file's
/// Klobuchar coefficients `iono`, the IS-GPS-200 example set when `None`).
pub fn generate(
    scn: &SilScenario,
    ephs: &[RinexEphemeris],
    iono: Option<KlobucharCoeffs>,
) -> Result<SilOutput, SilError> {
    let start =
        parse_epoch(&scn.sil.start).ok_or_else(|| SilError::BadStart(scn.sil.start.clone()))?;
    let step = scn.sil.step_s;
    if !(step > 0.0
        && step.is_finite()
        && scn.sil.duration_s >= 0.0
        && scn.sil.duration_s.is_finite())
        || scn.sil.duration_s / step > 1_000_000.0
    {
        return Err(SilError::BadTiming);
    }
    if let Some(c) = &scn.canyon {
        let ok = [
            c.axis_az_deg,
            c.width_m,
            c.height_left_m,
            c.height_right_m,
            c.offset_m,
            c.antenna_height_m,
            c.reflection_loss_db,
        ]
        .iter()
        .all(|v| v.is_finite())
            && c.width_m > 0.0
            && c.offset_m.abs() < 0.5 * c.width_m
            && c.reflection_loss_db >= 1.0
            && c.antenna_height_m >= 0.0;
        if !ok {
            return Err(SilError::BadCanyon);
        }
    }
    let mut systems: Vec<char> = Vec::new();
    for s in &scn.sil.systems {
        match s.as_str() {
            "G" => systems.push('G'),
            "E" => systems.push('E'),
            other => return Err(SilError::UnknownSystem(other.to_string())),
        }
    }
    // Satellites of the requested systems present in the nav file.
    let mut sats: Vec<(char, u8)> = ephs
        .iter()
        .filter(|e| systems.contains(&e.system))
        .map(|e| (e.system, e.prn))
        .collect();
    sats.sort();
    sats.dedup();
    if sats.is_empty() {
        return Err(SilError::NoSatellites);
    }
    let iono = iono.unwrap_or_default();
    let meteo = Meteo::default();
    let sig_cfg = &scn.signal;
    let mut rng = ChaCha8Rng::seed_from_u64(scn.sil.seed);
    let n = (scn.sil.duration_s / step).round() as usize;
    let doy = day_of_year(&start);

    // Per (sat, band): the current ambiguity and the previous path state / tracked flag.
    let mut arcs: BTreeMap<(char, u8, usize), (f64, Option<PathState>)> = BTreeMap::new();
    let mut states: BTreeMap<&'static str, usize> = BTreeMap::new();
    let mut epochs_text = String::new();
    let mut truth = String::new();
    let _ = writeln!(
        truth,
        "{}",
        serde_json::json!({
            "schema": TRUTH_SCHEMA,
            "label": "MODELLED",
            "start": scn.sil.start,
            "step_s": step,
            "seed": scn.sil.seed,
            "canyon": scn.canyon,
            "method": "broadcast orbit and clock at transmit time, Earth rotation, TGD/BGD, Klobuchar, Saastamoinen/Niell; street-canyon direct and opposite-wall reflection; coherent DLL/PLL multipath and jitter (docs/SIL-OBS.md)",
        })
    );
    let mut n_obs = 0usize;
    let mut n_written_epochs = 0usize;
    let mut first_epoch_written: Option<EpochUtc> = None;
    let mut by_sys_codes: BTreeMap<char, Vec<String>> = BTreeMap::new();
    for &sys in &systems {
        let mut codes = Vec::new();
        for s in signals_for(sys, scn.sil.dual_frequency) {
            for k in ["C", "L", "D", "S"] {
                codes.push(format!("{k}{}", s.rinex));
            }
        }
        by_sys_codes.insert(sys, codes);
    }

    for k in 0..=n {
        let t = k as f64 * step;
        let ep = epoch_add(&start, t);
        let tow_tag = ep.gps_time_of_week();
        let rx = receiver_at(scn, t);
        let station = ecef_to_geodetic(rx);
        let bias_m = scn.receiver.clock_bias_m + scn.receiver.clock_drift_m_per_s * t;
        // The tag is receiver time; true reception time is the tag minus the clock bias.
        let t_rx = tow_tag - bias_m / C_M_PER_S;
        let gps_sod = tow_tag.rem_euclid(86_400.0);
        let mut lines: Vec<String> = Vec::new();
        for &(sys, prn) in &sats {
            let Some(eph) = crate::pvt::select_ephemeris(ephs, sys, prn, t_rx) else {
                continue;
            };
            let (rho, t_tx, sat) = light_time(eph, rx, t_rx);
            let look = look_angles(station, sat);
            if look.el_rad.to_degrees() < scn.sil.mask_deg {
                continue;
            }
            let paths = canyon_paths(scn.canyon.as_ref(), look.az_rad, look.el_rad);
            *states.entry(paths.state.as_str()).or_default() += 1;
            // Range rate for the Doppler, by a central difference of the geometric range.
            let rr = {
                let (r_p, _, _) = light_time(eph, rx_plus(scn, t, 0.5), t_rx + 0.5);
                let (r_m, _, _) = light_time(eph, rx_plus(scn, t, -0.5), t_rx - 0.5);
                let clk_rate =
                    (eph.sv_clock_bias_s(t_tx + 0.5) - eph.sv_clock_bias_s(t_tx - 0.5)) * C_M_PER_S;
                (r_p - r_m) + scn.receiver.clock_drift_m_per_s - clk_rate
            };
            let iono_l1 = klobuchar_delay_m(
                &iono,
                station.lat_rad,
                station.lon_rad,
                look.el_rad,
                look.az_rad,
                gps_sod,
            );
            let tropo = tropo_delay_m(&meteo, station.lat_rad, station.alt_m, look.el_rad, doy);
            let sat_id = format!("{sys}{prn:02}");
            let mut fields: Vec<Option<(f64, u8, u8)>> = Vec::new();
            for sig in signals_for(sys, scn.sil.dual_frequency) {
                let lambda = C_M_PER_S / sig.freq_hz;
                let iono_f = iono_l1 * (F_L1 / sig.freq_hz).ppowi(2);
                let cn0_open = sig_cfg.cn0_zenith_dbhz
                    - sig_cfg.cn0_slope_db * (1.0 - look.el_rad.psin())
                    + if sig.band == 0 {
                        0.0
                    } else {
                        sig_cfg.cn0_f2_offset_db
                    };
                let theta =
                    2.0 * std::f64::consts::PI * paths.excess_m / lambda + std::f64::consts::PI;
                let (cn0, code_mp, carr_mp) = match paths.state {
                    PathState::Los => (cn0_open, 0.0, 0.0),
                    PathState::LosMultipath => {
                        let amp =
                            (1.0 + paths.alpha * paths.alpha + 2.0 * paths.alpha * theta.pcos())
                                .max(1e-6);
                        (
                            cn0_open + 10.0 * amp.plog10(),
                            dll_multipath_error_m(
                                paths.alpha,
                                paths.excess_m,
                                theta,
                                sig.chip_m,
                                sig_cfg.correlator_spacing_chips,
                            ),
                            carrier_multipath_error_m(paths.alpha, theta, lambda),
                        )
                    }
                    PathState::Nlos => (
                        cn0_open + 20.0 * paths.alpha.max(1e-6).plog10(),
                        paths.excess_m,
                        paths.excess_m,
                    ),
                    PathState::Blocked => (f64::NEG_INFINITY, 0.0, 0.0),
                };
                let tracked =
                    paths.state != PathState::Blocked && cn0 >= sig_cfg.track_threshold_dbhz;
                let key = (sys, prn, sig.band);
                let prev = arcs.get(&key).copied();
                let arc_break = tracked
                    && match prev {
                        None => true,
                        Some((_, None)) => true,
                        Some((_, Some(p))) => {
                            // Entering or leaving NLOS breaks the carrier arc.
                            (p == PathState::Nlos) != (paths.state == PathState::Nlos)
                        }
                    };
                if !tracked {
                    arcs.insert(key, (prev.map(|p| p.0).unwrap_or(0.0), None));
                    let _ = writeln!(
                        truth,
                        "{}",
                        serde_json::to_string(&TruthRow {
                            t,
                            sat: sat_id.clone(),
                            signal: sig.rinex.to_string(),
                            state: paths.state,
                            el_deg: look.el_rad.to_degrees(),
                            az_deg: look.az_rad.to_degrees(),
                            cn0_dbhz: if cn0.is_finite() { cn0 } else { -1.0 },
                            excess_path_m: paths.excess_m,
                            code_multipath_m: code_mp,
                            carrier_multipath_m: carr_mp,
                            code_noise_m: 0.0,
                            carrier_noise_m: 0.0,
                            iono_m: iono_f,
                            tropo_m: tropo,
                            geometric_range_m: rho,
                            tracked: false,
                            arc_break: false,
                        })
                        .unwrap_or_default()
                    );
                    fields.extend([None, None, None, None]);
                    continue;
                }
                let amb = if arc_break {
                    (rng.gen_range(-200_000i64..200_000i64)) as f64
                } else {
                    prev.map(|p| p.0).unwrap_or(0.0)
                };
                arcs.insert(key, (amb, Some(paths.state)));
                let (code_n, carr_n) = if sig_cfg.noise {
                    let sc = dll_jitter_m(
                        cn0,
                        sig_cfg.dll_bandwidth_hz,
                        sig_cfg.correlator_spacing_chips,
                        sig_cfg.integration_s,
                        sig.chip_m,
                    );
                    let sp =
                        pll_jitter_m(cn0, sig_cfg.pll_bandwidth_hz, sig_cfg.integration_s, lambda);
                    (
                        sc * crate::portable_math::standard_normal(&mut rng),
                        sp * crate::portable_math::standard_normal(&mut rng),
                    )
                } else {
                    (0.0, 0.0)
                };
                let clk = sat_clock_s(eph, t_tx, &sig) * C_M_PER_S;
                let code = rho + bias_m - clk + iono_f + tropo + code_mp + code_n;
                let phase_m = rho + bias_m - clk - iono_f + tropo + carr_mp + carr_n;
                let phase_cyc = phase_m / lambda + amb;
                let doppler = -rr / lambda;
                let ssi = ((cn0 / 6.0).floor() as i64).clamp(1, 9) as u8;
                let lli = if arc_break { 1 } else { 0 };
                fields.push(Some((code, 0, ssi)));
                fields.push(Some((phase_cyc, lli, ssi)));
                fields.push(Some((doppler, 0, ssi)));
                fields.push(Some((cn0, 0, 0)));
                n_obs += 1;
                let _ = writeln!(
                    truth,
                    "{}",
                    serde_json::to_string(&TruthRow {
                        t,
                        sat: sat_id.clone(),
                        signal: sig.rinex.to_string(),
                        state: paths.state,
                        el_deg: look.el_rad.to_degrees(),
                        az_deg: look.az_rad.to_degrees(),
                        cn0_dbhz: cn0,
                        excess_path_m: paths.excess_m,
                        code_multipath_m: code_mp,
                        carrier_multipath_m: carr_mp,
                        code_noise_m: code_n,
                        carrier_noise_m: carr_n,
                        iono_m: iono_f,
                        tropo_m: tropo,
                        geometric_range_m: rho,
                        tracked: true,
                        arc_break,
                    })
                    .unwrap_or_default()
                );
            }
            if fields.iter().any(Option::is_some) {
                let mut line = sat_id.clone();
                for f in &fields {
                    match f {
                        Some((v, lli, ssi)) => {
                            let _ = write!(line, "{v:14.3}");
                            line.push(if *lli > 0 {
                                char::from(b'0' + lli)
                            } else {
                                ' '
                            });
                            line.push(if *ssi > 0 {
                                char::from(b'0' + ssi)
                            } else {
                                ' '
                            });
                        }
                        None => line.push_str(&" ".repeat(16)),
                    }
                }
                lines.push(line.trim_end().to_string());
            }
        }
        if lines.is_empty() {
            continue;
        }
        if first_epoch_written.is_none() {
            first_epoch_written = Some(ep);
        }
        n_written_epochs += 1;
        let _ = writeln!(
            epochs_text,
            "> {:4} {:02} {:02} {:02} {:02}{:11.7}  0{:3}",
            ep.year,
            ep.month,
            ep.day,
            ep.hour,
            ep.minute,
            ep.second,
            lines.len()
        );
        for l in lines {
            let _ = writeln!(epochs_text, "{l}");
        }
    }

    let first = first_epoch_written.unwrap_or(start);
    let p0 = receiver_at(scn, 0.0);
    let mut h = String::new();
    let hl = |h: &mut String, body: &str, label: &str| {
        let _ = writeln!(h, "{body:<60}{label}");
    };
    hl(
        &mut h,
        &format!(
            "{:9.2}{:11}{:<20}{:<20}",
            3.04,
            "",
            "OBSERVATION DATA",
            if systems.len() > 1 {
                "M (MIXED)"
            } else if systems[0] == 'E' {
                "E (GALILEO)"
            } else {
                "G (GPS)"
            }
        ),
        "RINEX VERSION / TYPE",
    );
    hl(
        &mut h,
        &format!(
            "{:<20}{:<20}{:04}{:02}{:02} {:02}{:02}{:02} GPS",
            "kshana sil-obs",
            "kshana",
            start.year,
            start.month,
            start.day,
            start.hour,
            start.minute,
            start.second as u32
        ),
        "PGM / RUN BY / DATE",
    );
    hl(
        &mut h,
        "MODELLED synthetic observations: kshana sil-obs",
        "COMMENT",
    );
    if let Some(c) = &scn.canyon {
        hl(
            &mut h,
            &format!(
                "canyon axis {:.1} width {:.1} walls {:.1}/{:.1} off {:.1}",
                c.axis_az_deg, c.width_m, c.height_left_m, c.height_right_m, c.offset_m
            ),
            "COMMENT",
        );
    }
    hl(
        &mut h,
        &scn.sil.marker.chars().take(60).collect::<String>(),
        "MARKER NAME",
    );
    hl(
        &mut h,
        &format!("{:<20}{:<40}", "SIMULATED", "KSHANA"),
        "OBSERVER / AGENCY",
    );
    hl(
        &mut h,
        &format!(
            "{:<20}{:<20}{:<20}",
            "0",
            "KSHANA SIL",
            env!("CARGO_PKG_VERSION")
        ),
        "REC # / TYPE / VERS",
    );
    hl(
        &mut h,
        &format!("{:<20}{:<20}", "0", "ISOTROPIC       NONE"),
        "ANT # / TYPE",
    );
    hl(
        &mut h,
        &format!("{:14.4}{:14.4}{:14.4}", p0[0], p0[1], p0[2]),
        "APPROX POSITION XYZ",
    );
    hl(
        &mut h,
        &format!("{:14.4}{:14.4}{:14.4}", 0.0, 0.0, 0.0),
        "ANTENNA: DELTA H/E/N",
    );
    for (sys, codes) in &by_sys_codes {
        let mut body = format!("{sys}  {:3}", codes.len());
        for (i, c) in codes.iter().enumerate() {
            if i > 0 && i % 13 == 0 {
                hl(&mut h, &body, "SYS / # / OBS TYPES");
                body = "      ".to_string();
            }
            let _ = write!(body, " {c}");
        }
        hl(&mut h, &body, "SYS / # / OBS TYPES");
    }
    hl(&mut h, &format!("{step:10.3}"), "INTERVAL");
    hl(
        &mut h,
        &format!(
            "{:6}{:6}{:6}{:6}{:6}{:13.7}{:>8}",
            first.year, first.month, first.day, first.hour, first.minute, first.second, "GPS"
        ),
        "TIME OF FIRST OBS",
    );
    hl(&mut h, "", "END OF HEADER");
    h.push_str(&epochs_text);
    Ok(SilOutput {
        rinex: h,
        truth,
        n_epochs: n_written_epochs,
        n_obs,
        states,
    })
}

fn rx_plus(scn: &SilScenario, t: f64, dt: f64) -> Vec3 {
    receiver_at(scn, t + dt)
}

// ─────────────────────────────── compare ───────────────────────────────

/// The carrier frequency of a RINEX 3 observation code's band for a system, where the band
/// is unambiguous (GLONASS FDMA bands are not).
pub fn band_freq_hz(system: char, band: char) -> Option<f64> {
    Some(match (system, band) {
        ('G' | 'J' | 'E' | 'S', '1') => F_L1,
        ('G' | 'J', '2') => F_L2,
        ('G' | 'J' | 'E' | 'S' | 'C', '5') => F_L5,
        ('E', '7') | ('C', '7') => 1_207_140_000.0,
        ('E', '8') | ('C', '8') => 1_191_795_000.0,
        ('E', '6') => 1_278_750_000.0,
        ('J', '6') => 1_278_750_000.0,
        ('C', '2') => 1_561_098_000.0,
        ('C', '1') => F_L1,
        ('C', '6') => 1_268_520_000.0,
        _ => return None,
    })
}

/// Statistics of one observation file, from its observations alone.
#[derive(Clone, Debug, Serialize, Default)]
pub struct ObsStats {
    /// Epochs in the file.
    pub epochs: usize,
    /// Interval from the RINEX header (s), if stated.
    pub interval_s: Option<f64>,
    /// Mean number of satellites with a primary-signal code observation per epoch.
    pub sats_per_epoch_mean: f64,
    /// 10th percentile of satellites with a primary-signal code observation per epoch.
    pub sats_per_epoch_p10: f64,
    /// Median number of satellites with a primary-signal code observation per epoch.
    pub sats_per_epoch_p50: f64,
    /// 90th percentile of satellites with a primary-signal code observation per epoch.
    pub sats_per_epoch_p90: f64,
    /// Primary signals used (`system:code`), e.g. `G:1C`.
    pub signals: Vec<String>,
    /// Primary-signal C/N0 samples kept (strictly between 0 and 80 dB-Hz).
    pub cn0_samples: usize,
    /// Mean primary-signal C/N0 (dB-Hz).
    pub cn0_mean_dbhz: f64,
    /// 10th percentile of primary-signal C/N0 (dB-Hz).
    pub cn0_p10_dbhz: f64,
    /// Median primary-signal C/N0 (dB-Hz).
    pub cn0_p50_dbhz: f64,
    /// 90th percentile of primary-signal C/N0 (dB-Hz).
    pub cn0_p90_dbhz: f64,
    /// Detrended code-minus-carrier samples (arcs of at least 10 epochs).
    pub cmc_samples: usize,
    /// RMS of the detrended code-minus-carrier samples (m).
    pub cmc_rms_m: f64,
    /// Median absolute detrended code-minus-carrier (m).
    pub cmc_abs_p50_m: f64,
    /// 95th percentile of absolute detrended code-minus-carrier (m).
    pub cmc_abs_p95_m: f64,
    /// CMC RMS (m) per 5 dB-Hz C/N0 bin, keyed by the bin's lower edge.
    pub cmc_rms_by_cn0_m: BTreeMap<String, f64>,
    /// Carrier-arc breaks (loss-of-lock flag or gap) per 100 satellite-epochs.
    pub arc_breaks_per_100: f64,
    /// The C/N0 samples (dB-Hz), kept for the Kolmogorov-Smirnov comparison; not serialised.
    #[serde(skip)]
    pub cn0_values: Vec<f64>,
    /// Sorted absolute detrended CMC samples (m), for the Kolmogorov-Smirnov comparison;
    /// not serialised.
    #[serde(skip)]
    pub cmc_abs_values: Vec<f64>,
}

/// One carrier arc being collected: times, code-minus-carrier values and C/N0.
type CmcArc = (Vec<f64>, Vec<f64>, Vec<f64>);

fn quantile(sorted: &[f64], q: f64) -> f64 {
    if sorted.is_empty() {
        return f64::NAN;
    }
    let pos = q * (sorted.len() - 1) as f64;
    let lo = pos.floor() as usize;
    let hi = pos.ceil() as usize;
    sorted[lo] + (sorted[hi] - sorted[lo]) * (pos - lo as f64)
}

/// Two-sample Kolmogorov–Smirnov distance `sup |F_a − F_b|` (NaN when either is empty).
pub fn ks_distance(a: &[f64], b: &[f64]) -> f64 {
    if a.is_empty() || b.is_empty() {
        return f64::NAN;
    }
    let mut a: Vec<f64> = a.iter().copied().filter(|v| v.is_finite()).collect();
    let mut b: Vec<f64> = b.iter().copied().filter(|v| v.is_finite()).collect();
    if a.is_empty() || b.is_empty() {
        return f64::NAN;
    }
    a.sort_by(f64::total_cmp);
    b.sort_by(f64::total_cmp);
    let (mut i, mut j, mut d) = (0usize, 0usize, 0.0f64);
    while i < a.len() && j < b.len() {
        let x = a[i].min(b[j]);
        while i < a.len() && a[i] <= x {
            i += 1;
        }
        while j < b.len() && b[j] <= x {
            j += 1;
        }
        d = d.max((i as f64 / a.len() as f64 - j as f64 / b.len() as f64).abs());
    }
    d
}

/// Remove a least-squares line from `ys` sampled at `ts`.
fn detrend(ts: &[f64], ys: &[f64]) -> Vec<f64> {
    let n = ts.len() as f64;
    let mt = ts.iter().sum::<f64>() / n;
    let my = ys.iter().sum::<f64>() / n;
    let (mut sxy, mut sxx) = (0.0, 0.0);
    for (t, y) in ts.iter().zip(ys) {
        sxy += (t - mt) * (y - my);
        sxx += (t - mt) * (t - mt);
    }
    let b = if sxx > 0.0 { sxy / sxx } else { 0.0 };
    ts.iter()
        .zip(ys)
        .map(|(t, y)| y - my - b * (t - mt))
        .collect()
}

/// Observation statistics of a parsed RINEX observation file. For each system the primary
/// signal is the first band-1 (band-2 for BeiDou B1I files without band 1) code with a
/// matching `L` and `S` observation.
pub fn obs_stats(obs: &RinexObs) -> ObsStats {
    let mut st = ObsStats {
        epochs: obs.epochs.len(),
        interval_s: obs.header.interval_s,
        ..Default::default()
    };
    // Primary signal per system: (C index, L index, S index, wavelength).
    let mut prim: BTreeMap<char, (usize, usize, Option<usize>, f64)> = BTreeMap::new();
    for (sys, codes) in &obs.header.obs_types {
        for (ci, c) in codes.iter().enumerate() {
            if !c.starts_with('C') || c.len() != 3 {
                continue;
            }
            let suffix = &c[1..];
            let band = suffix.chars().next().unwrap_or(' ');
            let Some(f) = band_freq_hz(*sys, band) else {
                continue;
            };
            let Some(li) = codes.iter().position(|x| x == &format!("L{suffix}")) else {
                continue;
            };
            let si = codes.iter().position(|x| x == &format!("S{suffix}"));
            let better = !prim.contains_key(sys);
            if better {
                prim.insert(*sys, (ci, li, si, C_M_PER_S / f));
                st.signals.push(format!("{sys}:{suffix}"));
            }
        }
    }
    let interval = obs.header.interval_s.unwrap_or_else(|| {
        let mut d: Vec<f64> = obs
            .epochs
            .windows(2)
            .map(|w| w[1].time.seconds_from_gps_epoch() - w[0].time.seconds_from_gps_epoch())
            .filter(|d| *d > 0.0)
            .collect();
        d.sort_by(f64::total_cmp);
        d.first().copied().unwrap_or(1.0)
    });
    let mut per_epoch = Vec::new();
    // Arcs: sat -> (times, cmc, cn0, last t)
    let mut arcs: BTreeMap<String, CmcArc> = BTreeMap::new();
    let mut cmc_pairs: Vec<(f64, f64)> = Vec::new(); // (|cmc| residual signed, cn0)
    let mut breaks = 0usize;
    let mut sat_epochs = 0usize;
    let flush = |arc: &mut CmcArc, out: &mut Vec<(f64, f64)>| {
        if arc.0.len() >= 10 {
            let r = detrend(&arc.0, &arc.1);
            for (v, c) in r.into_iter().zip(arc.2.iter()) {
                out.push((v, *c));
            }
        }
        arc.0.clear();
        arc.1.clear();
        arc.2.clear();
    };
    for ep in &obs.epochs {
        if ep.flag > 1 {
            continue;
        }
        let t = ep.time.seconds_from_gps_epoch();
        let mut n_here = 0usize;
        for sv in &ep.sats {
            let Some(sys) = sv.sat.chars().next() else {
                continue;
            };
            let Some(&(ci, li, si, lambda)) = prim.get(&sys) else {
                continue;
            };
            let c = sv.obs.get(ci).copied().flatten();
            let l = sv.obs.get(li).copied().flatten();
            let s = si.and_then(|i| sv.obs.get(i).copied().flatten());
            if c.is_none() {
                continue;
            }
            n_here += 1;
            sat_epochs += 1;
            let cn0 = s.map(|o| o.value).filter(|v| *v > 0.0 && *v < 80.0);
            if let Some(v) = cn0 {
                st.cn0_values.push(v);
            }
            let arc = arcs.entry(sv.sat.clone()).or_default();
            match (c, l) {
                (Some(c), Some(l)) if c.value > 0.0 && l.value != 0.0 => {
                    let slip = l.lli.is_some_and(|f| f & 1 == 1);
                    let gap = arc.0.last().is_some_and(|lt| t - lt > 1.5 * interval);
                    if (slip || gap) && !arc.0.is_empty() {
                        breaks += 1;
                        flush(arc, &mut cmc_pairs);
                    }
                    arc.0.push(t);
                    arc.1.push(c.value - l.value * lambda);
                    arc.2.push(cn0.unwrap_or(f64::NAN));
                }
                _ => {
                    if !arc.0.is_empty() {
                        breaks += 1;
                        flush(arc, &mut cmc_pairs);
                    }
                }
            }
        }
        per_epoch.push(n_here as f64);
    }
    for arc in arcs.values_mut() {
        flush(arc, &mut cmc_pairs);
    }
    per_epoch.sort_by(f64::total_cmp);
    if !per_epoch.is_empty() {
        st.sats_per_epoch_mean = per_epoch.iter().sum::<f64>() / per_epoch.len() as f64;
        st.sats_per_epoch_p10 = quantile(&per_epoch, 0.1);
        st.sats_per_epoch_p50 = quantile(&per_epoch, 0.5);
        st.sats_per_epoch_p90 = quantile(&per_epoch, 0.9);
    }
    let mut cn0s = st.cn0_values.clone();
    cn0s.sort_by(f64::total_cmp);
    st.cn0_samples = cn0s.len();
    if !cn0s.is_empty() {
        st.cn0_mean_dbhz = cn0s.iter().sum::<f64>() / cn0s.len() as f64;
        st.cn0_p10_dbhz = quantile(&cn0s, 0.1);
        st.cn0_p50_dbhz = quantile(&cn0s, 0.5);
        st.cn0_p90_dbhz = quantile(&cn0s, 0.9);
    }
    st.cmc_samples = cmc_pairs.len();
    if !cmc_pairs.is_empty() {
        st.cmc_rms_m =
            (cmc_pairs.iter().map(|(v, _)| v * v).sum::<f64>() / cmc_pairs.len() as f64).sqrt();
        let mut abs: Vec<f64> = cmc_pairs.iter().map(|(v, _)| v.abs()).collect();
        abs.sort_by(f64::total_cmp);
        st.cmc_abs_p50_m = quantile(&abs, 0.5);
        st.cmc_abs_p95_m = quantile(&abs, 0.95);
        st.cmc_abs_values = abs;
        let mut bins: BTreeMap<i64, (f64, usize)> = BTreeMap::new();
        for (v, c) in &cmc_pairs {
            if c.is_finite() {
                let b = (c / 5.0).floor() as i64 * 5;
                let e = bins.entry(b).or_default();
                e.0 += v * v;
                e.1 += 1;
            }
        }
        for (b, (ss, n)) in bins {
            if n >= 5 {
                st.cmc_rms_by_cn0_m
                    .insert(format!("{b}"), (ss / n as f64).sqrt());
            }
        }
    }
    st.arc_breaks_per_100 = if sat_epochs > 0 {
        100.0 * breaks as f64 / sat_epochs as f64
    } else {
        0.0
    };
    st
}

/// The comparison document of two observation files.
pub fn compare_doc(name_a: &str, a: &ObsStats, name_b: &str, b: &ObsStats) -> serde_json::Value {
    let mut rms_ratio = serde_json::Map::new();
    for (k, va) in &a.cmc_rms_by_cn0_m {
        if let Some(vb) = b.cmc_rms_by_cn0_m.get(k) {
            if *va > 0.0 {
                rms_ratio.insert(k.clone(), serde_json::json!(vb / va));
            }
        }
    }
    serde_json::json!({
        "schema": COMPARE_SCHEMA,
        "label": "MODELLED",
        "note": "statistics computed from the two observation files alone (no ephemeris); a small distance is agreement of these statistics, not validation of every effect",
        "a": {"file": name_a, "stats": a},
        "b": {"file": name_b, "stats": b},
        "ks_cn0": ks_distance(&a.cn0_values, &b.cn0_values),
        "ks_cmc_abs": ks_distance(&a.cmc_abs_values, &b.cmc_abs_values),
        "sats_per_epoch_mean_diff": b.sats_per_epoch_mean - a.sats_per_epoch_mean,
        "cn0_p50_diff_db": b.cn0_p50_dbhz - a.cn0_p50_dbhz,
        "cmc_rms_ratio_b_over_a": if a.cmc_rms_m > 0.0 { serde_json::json!(b.cmc_rms_m / a.cmc_rms_m) } else { serde_json::Value::Null },
        "cmc_rms_ratio_by_cn0_b_over_a": rms_ratio,
        "arc_breaks_per_100_diff": b.arc_breaks_per_100 - a.arc_breaks_per_100,
    })
}

// ─────────────────────────────── CLI ───────────────────────────────

/// `kshana sil-obs <generate|compare> ...`. Returns the process exit code.
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn opt_value<'a>(args: &'a [String], i: &mut usize) -> Result<&'a str, String> {
    *i += 1;
    args.get(*i)
        .map(String::as_str)
        .ok_or_else(|| crate::terr!("e-sil-obs-missing-value", option = args[*i - 1].as_str()))
}

fn read(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path)
        .map_err(|e| crate::terr!("e-sil-obs-cannot-read", path = path, e = e))
}

fn write(path: &str, body: &str) -> Result<(), String> {
    std::fs::write(path, body)
        .map_err(|e| crate::terr!("e-sil-obs-cannot-write", path = path, e = e))
}

fn run_inner(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("sil-obs-usage");
    let Some(sub) = args.first() else {
        return Err(usage());
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(());
    }
    let mut positional = Vec::new();
    let (mut nav, mut out, mut truth, mut json) = (None, None, None, false);
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--nav" => nav = Some(opt_value(args, &mut i)?.to_string()),
            "--out" => out = Some(opt_value(args, &mut i)?.to_string()),
            "--truth" => truth = Some(opt_value(args, &mut i)?.to_string()),
            "--json" => json = true,
            s if s.starts_with('-') => {
                return Err(crate::terr!("e-sil-obs-unknown-option", option = s))
            }
            s => positional.push(s.to_string()),
        }
        i += 1;
    }
    match sub.as_str() {
        "generate" => {
            let [scn_path] = positional.as_slice() else {
                return Err(usage());
            };
            let (Some(nav), Some(out)) = (nav, out) else {
                return Err(usage());
            };
            let scn: SilScenario = toml::from_str(&read(scn_path)?).map_err(|e| {
                crate::terr!("e-sil-obs-bad-scenario", path = scn_path.as_str(), e = e)
            })?;
            let nav_text = read(&nav)?;
            let ephs = crate::rinex::parse_nav(&nav_text)
                .map_err(|e| crate::terr!("e-sil-obs-bad-nav", path = nav.as_str(), e = e))?;
            let iono = crate::pvt::klobuchar_from_nav_header(&nav_text);
            let r = generate(&scn, &ephs, iono).map_err(|e| match e {
                SilError::BadStart(s) => crate::terr!("e-sil-obs-bad-start", value = s),
                SilError::BadTiming => crate::terr!("e-sil-obs-bad-timing"),
                SilError::NoSatellites => {
                    crate::terr!("e-sil-obs-no-satellites", path = nav.as_str())
                }
                SilError::UnknownSystem(s) => crate::terr!("e-sil-obs-unknown-system", value = s),
                SilError::BadCanyon => crate::terr!("e-sil-obs-bad-canyon"),
            })?;
            write(&out, &r.rinex)?;
            if let Some(tp) = truth {
                write(&tp, &r.truth)?;
            }
            eprintln!(
                "{}",
                crate::t!(
                    "sil-obs-summary",
                    n_epochs = r.n_epochs,
                    n_obs = r.n_obs,
                    n_nlos = r.states.get("nlos").copied().unwrap_or(0),
                    n_blocked = r.states.get("blocked").copied().unwrap_or(0)
                )
            );
            Ok(())
        }
        "compare" => {
            let [a, b] = positional.as_slice() else {
                return Err(usage());
            };
            let pa = crate::rinex_obs::parse_obs(&read(a)?)
                .map_err(|e| crate::terr!("e-sil-obs-bad-obs", path = a.as_str(), e = e))?;
            let pb = crate::rinex_obs::parse_obs(&read(b)?)
                .map_err(|e| crate::terr!("e-sil-obs-bad-obs", path = b.as_str(), e = e))?;
            let doc = compare_doc(a, &obs_stats(&pa), b, &obs_stats(&pb));
            let text = if json {
                serde_json::to_string(&doc).unwrap_or_default()
            } else {
                serde_json::to_string_pretty(&doc).unwrap_or_default()
            };
            match out {
                Some(p) => write(&p, &(text + "\n")),
                None => {
                    println!("{text}");
                    Ok(())
                }
            }
        }
        _ => Err(usage()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn canyon() -> Canyon {
        Canyon {
            axis_az_deg: 0.0,
            width_m: 20.0,
            height_left_m: 30.0,
            height_right_m: 30.0,
            offset_m: 0.0,
            antenna_height_m: 0.0,
            reflection_loss_db: 6.0,
        }
    }

    #[test]
    fn epoch_add_carries_a_rounded_midnight_into_the_next_day() {
        let start = EpochUtc {
            year: 2024,
            month: 12,
            day: 31,
            hour: 23,
            minute: 59,
            second: 59.0,
        };
        // 0.99999996 s later rounds to midnight: the next day (and year) at 00:00:00.
        let e = epoch_add(&start, 0.999_999_96);
        assert_eq!(
            (e.year, e.month, e.day, e.hour, e.minute),
            (2025, 1, 1, 0, 0)
        );
        assert!(e.second.abs() < 1e-9, "{}", e.second);
    }

    #[test]
    fn canyon_geometry_cases() {
        let c = canyon();
        // Satellite straight along the street: never blocked, no reflection.
        let p = canyon_paths(Some(&c), 0.0, 10f64.to_radians());
        assert_eq!(p.state, PathState::Los);
        // Across the street (east), low: wall 10 m away and 30 m high needs el >= 71.57 deg.
        let p = canyon_paths(Some(&c), 90f64.to_radians(), 30f64.to_radians());
        assert_eq!(p.state, PathState::Blocked);
        let p = canyon_paths(Some(&c), 90f64.to_radians(), 72f64.to_radians());
        assert_ne!(p.state, PathState::Blocked);
        // A reflection off the west wall: point at 10 m (height 10·tan el) must be <= 30, the
        // ray after it must clear the east wall at 30 m horizontal: 30·tan(el) >= 30, el >= 45.
        let p = canyon_paths(Some(&c), 90f64.to_radians(), 50f64.to_radians());
        assert_eq!(p.state, PathState::Nlos);
        let expect = 2.0 * 10.0 * 50f64.to_radians().cos();
        assert!((p.excess_m - expect).abs() < 1e-9);
        // High: direct clear and the reflection point above the west wall's top.
        let p = canyon_paths(Some(&c), 90f64.to_radians(), 80f64.to_radians());
        assert_eq!(p.state, PathState::Los);
        // Between: direct clear, reflection point 10·tan(72°)=30.8 > 30, so LOS; at a
        // lower west wall the reflection would be gone too; with a taller west wall it exists.
        let mut tall = c.clone();
        tall.height_left_m = 40.0;
        let p = canyon_paths(Some(&tall), 90f64.to_radians(), 72f64.to_radians());
        assert_eq!(p.state, PathState::LosMultipath);
    }

    #[test]
    fn dll_envelope_is_continuous_and_matches_its_regions() {
        let l = CHIP_1023_M;
        // The envelope's slope is at most |αc|/(1+αc), which is 1 for α = 0.5.
        for &alpha in &[0.2, 0.5] {
            for &theta in &[0.0, 1.0, std::f64::consts::PI] {
                let mut prev = dll_multipath_error_m(alpha, 0.0, theta, l, 1.0);
                assert!(prev.abs() < 1e-12);
                let mut tau = 0.0;
                while tau < 1.6 * l {
                    tau += 0.5;
                    let v = dll_multipath_error_m(alpha, tau, theta, l, 1.0);
                    assert!(
                        (v - prev).abs() <= 0.5 + 1e-9,
                        "jump at tau {tau}: {prev} -> {v}"
                    );
                    prev = v;
                }
                assert_eq!(dll_multipath_error_m(alpha, 1.6 * l, theta, l, 1.0), 0.0);
            }
        }
        // Small delay, in phase: alpha·tau/(1+alpha).
        let v = dll_multipath_error_m(0.5, 10.0, 0.0, l, 1.0);
        assert!((v - 0.5 * 10.0 / 1.5).abs() < 1e-12);
        // Plateau with a 0.1-chip correlator: alpha·d.
        let v = dll_multipath_error_m(0.5, 100.0, 0.0, l, 0.1);
        assert!((v - 0.5 * 0.05 * l).abs() < 1e-9);
    }

    /// The DLL envelope against a direct numerical solution of the discriminator zero.
    #[test]
    fn dll_envelope_matches_a_numerical_discriminator() {
        let l = CHIP_1023_M;
        let tri = |u: f64| (1.0 - u.abs() / l).max(0.0);
        let mut checked = 0;
        for &(alpha, theta, spacing) in &[(0.5, 0.0, 1.0), (0.3, 2.5, 0.5), (0.8, 0.7, 0.2)] {
            let ac = alpha * f64::cos(theta);
            let d = 0.5 * spacing * l;
            for k in 1..40 {
                let tau = k as f64 * l / 25.0;
                let r = |x: f64| tri(x) + ac * tri(x - tau);
                let f = |x: f64| r(x - d) - r(x + d);
                // Bisection on [-d/2, tau + d/2] for the zero nearest the peak.
                let (mut lo, mut hi) = (-0.5 * d, tau.min(d * 2.0) + 0.5 * d);
                if f(lo).signum() == f(hi).signum() {
                    continue;
                }
                for _ in 0..200 {
                    let mid = 0.5 * (lo + hi);
                    if f(mid).signum() == f(lo).signum() {
                        lo = mid;
                    } else {
                        hi = mid;
                    }
                }
                let num = 0.5 * (lo + hi);
                let env = dll_multipath_error_m(alpha, tau, theta, l, spacing);
                assert!(
                    (num - env).abs() < 1e-6 * l,
                    "a {alpha} th {theta} D {spacing} tau {tau}: {num} vs {env}"
                );
                checked += 1;
            }
        }
        assert!(checked > 60, "only {checked} delays bracketed");
    }

    #[test]
    fn jitter_formulas() {
        // 45 dB-Hz, 1 Hz DLL, 1 chip spacing, 20 ms: about 0.0067 chip -> ~1.96 m.
        let s = dll_jitter_m(45.0, 1.0, 1.0, 0.02, CHIP_1023_M);
        let cn0 = 10f64.powf(4.5);
        let expect = CHIP_1023_M * (1.0 / (2.0 * cn0) * (1.0 + 2.0 / (0.02 * cn0))).sqrt();
        assert!((s - expect).abs() < 1e-12);
        assert!(pll_jitter_m(45.0, 15.0, 0.02, 0.19) < 0.003);
    }

    #[test]
    fn epochs_add_across_days() {
        let s = parse_epoch("2018-12-31T23:59:30").unwrap();
        let e = epoch_add(&s, 45.0);
        assert_eq!(
            (e.year, e.month, e.day, e.hour, e.minute),
            (2019, 1, 1, 0, 0)
        );
        assert!((e.second - 15.0).abs() < 1e-9);
        assert!(parse_epoch("2018-13-01T00:00:00").is_none());
        assert!(parse_epoch("nonsense").is_none());
    }

    #[test]
    fn ks_distance_basics() {
        let a = [1.0, 2.0, 3.0, 4.0];
        assert_eq!(ks_distance(&a, &a), 0.0);
        assert!((ks_distance(&a, &[10.0, 11.0]) - 1.0).abs() < 1e-12);
        assert!(ks_distance(&a, &[]).is_nan());
    }
}
