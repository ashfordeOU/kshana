// SPDX-License-Identifier: AGPL-3.0-only
//! RF interference (jamming) model: J/S → effective C/N₀ → loss of lock.
//!
//! A jammer raises the noise floor a GNSS receiver sees, degrading the
//! carrier-to-noise-density ratio (C/N₀) of every tracked satellite until the
//! tracking loops drop lock. This module models that chain from first
//! principles, so a scenario can ask "does this jammer, at this power and range,
//! deny GNSS to this receiver — and for how many satellites?".
//!
//! The chain (Kaplan & Hegarty, *Understanding GPS/GNSS*, 3rd ed., §9.4):
//!
//! 1. **Jammer-to-signal ratio** at the receiver, `J/S` (dB): the received
//!    jammer power (transmit power + antenna gains − free-space path loss) minus
//!    the received GNSS signal power.
//! 2. **Effective C/N₀** under that interference, via the standard anti-jam
//!    equation
//!    ```text
//!    (C/N₀)_eff = [ 1/(C/N₀) + (J/S) / (Q · Rc) ]⁻¹
//!    ```
//!    where `Rc` is the spreading-code chip rate (the processing gain) and `Q`
//!    is the spectral-separation (spread-spectrum adjustment) coefficient that
//!    depends on the jammer's spectrum.
//! 3. **Lock status**: a loop loses lock when its effective C/N₀ falls below a
//!    tracking threshold (≈ 25 dB-Hz for a typical C/A tracking loop; configurable).
//!
//! Honest scope: this is a **link-budget** interference model. It captures the
//! geometry (free-space path loss, per-satellite receive-antenna gain vs.
//! elevation) and the despreading processing gain, which is what determines
//! denial range. It does **not** model multipath, terrain shadowing of the
//! jammer, near/far AGC effects, adaptive nulling antennas, or the receiver's
//! acquisition (vs. tracking) threshold hysteresis — those are noted in
//! `docs/CAPABILITY.md` as out of scope.

use crate::frames::{geodetic_to_ecef, is_visible, look_angles, teme_to_ecef, Geodetic, Vec3};
use crate::scenario::{GnssState, TimeCfg};
use crate::walker::{walker_epoch_jd, WalkerSgp4};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::f64::consts::PI;

/// Speed of light (m/s).
pub const C_M_PER_S: f64 = 299_792_458.0;
/// GPS L1 carrier frequency (Hz).
pub const L1_HZ: f64 = 1_575_420_000.0;
/// GPS C/A spreading-code chip rate (chips/s) — the despreading processing gain.
pub const CA_CHIP_RATE_HZ: f64 = 1_023_000.0;
/// Boltzmann's constant (J/K).
pub const BOLTZMANN_J_PER_K: f64 = 1.380_649e-23;
/// Reference receiver system noise temperature (K).
pub const DEFAULT_TEMP_K: f64 = 290.0;
/// Minimum received GPS L1 C/A signal power at the antenna (dBW), IS-GPS-200.
pub const DEFAULT_SIGNAL_POWER_DBW: f64 = -158.5;
/// Default C/A code-tracking-loss threshold (dB-Hz).
pub const DEFAULT_TRACKING_THRESHOLD_DBHZ: f64 = 25.0;
/// Default extra margin (dB) above the loss threshold below which a satellite is
/// reported `Degraded` rather than fully `Locked`.
pub const DEFAULT_DEGRADED_MARGIN_DB: f64 = 6.0;

fn default_mask_deg() -> f64 {
    5.0
}
fn default_threshold() -> f64 {
    DEFAULT_TRACKING_THRESHOLD_DBHZ
}
fn default_degraded_margin() -> f64 {
    DEFAULT_DEGRADED_MARGIN_DB
}
fn default_signal_power() -> f64 {
    DEFAULT_SIGNAL_POWER_DBW
}
fn default_temp_k() -> f64 {
    DEFAULT_TEMP_K
}
fn default_freq() -> f64 {
    L1_HZ
}
fn default_chip_rate() -> f64 {
    CA_CHIP_RATE_HZ
}
fn default_jammer_type() -> String {
    "broadband".to_string()
}

// --- core physics (deterministic, unit-testable in isolation) ---

/// Free-space path loss (dB) over distance `d_m` at frequency `f_hz`:
/// `20·log₁₀(d) + 20·log₁₀(f) + 20·log₁₀(4π/c)`.
pub fn free_space_path_loss_db(d_m: f64, f_hz: f64) -> f64 {
    let d = d_m.max(1e-3);
    20.0 * d.log10() + 20.0 * f_hz.log10() + 20.0 * (4.0 * PI / C_M_PER_S).log10()
}

/// Jammer-to-signal ratio (dB) at the receiver antenna output: the received
/// jammer power (transmit power + jammer antenna gain + receiver-antenna gain
/// **toward the jammer** − free-space path loss) minus the received GNSS signal
/// power (the isotropic received power + receiver-antenna gain **toward the
/// satellite**). Each link uses its own direction through the receive-antenna
/// pattern, so a low-elevation satellite (weaker) and a horizon jammer (the
/// receiver's reduced ground gain) are both accounted for.
#[allow(clippy::too_many_arguments)]
pub fn j_over_s_db(
    jammer_power_dbw: f64,
    jammer_gain_dbi: f64,
    rx_gain_toward_jammer_db: f64,
    distance_m: f64,
    f_hz: f64,
    signal_power_dbw: f64,
    rx_gain_toward_sat_db: f64,
) -> f64 {
    let jammer_rx = jammer_power_dbw + jammer_gain_dbi + rx_gain_toward_jammer_db
        - free_space_path_loss_db(distance_m, f_hz);
    let signal_rx = signal_power_dbw + rx_gain_toward_sat_db;
    jammer_rx - signal_rx
}

/// Inverse of [`j_over_s_db`] (L02): the transmit power (dBW) an interferer must
/// radiate to produce a target jammer-to-signal ratio `target_js_db` at the victim,
/// given its antenna gain `tx_gain_dbi`, the receiver gain toward it, the standoff
/// `distance_m`, carrier `f_hz`, the isotropic received signal power, and the receiver
/// gain toward the satellite. Solving `j_over_s_db(...) = target_js_db` for transmit
/// power gives `P_tx = J/S + P_sig + G_rx→sat + FSPL(d, f) − G_tx − G_rx→jam`. This
/// turns the P1 spoof (J/S = 3 dB) and jam (J/S = 30 dB) required-power-versus-standoff
/// curves into first-class engine output rather than a hand calculation.
#[allow(clippy::too_many_arguments)]
pub fn required_tx_power_dbw(
    target_js_db: f64,
    tx_gain_dbi: f64,
    rx_gain_toward_jammer_db: f64,
    distance_m: f64,
    f_hz: f64,
    signal_power_dbw: f64,
    rx_gain_toward_sat_db: f64,
) -> f64 {
    target_js_db
        + signal_power_dbw
        + rx_gain_toward_sat_db
        + free_space_path_loss_db(distance_m, f_hz)
        - tx_gain_dbi
        - rx_gain_toward_jammer_db
}

/// Thermal noise power spectral density (dBW/Hz) at temperature `temp_k`:
/// `10·log₁₀(k·T)`.
pub fn noise_density_dbw_per_hz(temp_k: f64) -> f64 {
    10.0 * (BOLTZMANN_J_PER_K * temp_k).log10()
}

/// Nominal (un-jammed) carrier-to-noise-density ratio (dB-Hz) for a received
/// signal of `signal_power_dbw` with `antenna_gain_db` of receive-antenna gain.
pub fn nominal_cn0_dbhz(signal_power_dbw: f64, antenna_gain_db: f64, temp_k: f64) -> f64 {
    signal_power_dbw + antenna_gain_db - noise_density_dbw_per_hz(temp_k)
}

/// Effective C/N₀ (dB-Hz) under interference of ratio `js_db`, despread at chip
/// rate `chip_rate_hz` with spectral-separation coefficient `q` — the standard
/// anti-jam equation `(C/N₀)_eff = [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹`.
pub fn effective_cn0_dbhz(cn0_nominal_dbhz: f64, js_db: f64, q: f64, chip_rate_hz: f64) -> f64 {
    let cn0_lin = 10f64.powf(cn0_nominal_dbhz / 10.0);
    let js_lin = 10f64.powf(js_db / 10.0);
    let denom = 1.0 / cn0_lin + js_lin / (q.max(1e-9) * chip_rate_hz);
    -10.0 * denom.log10()
}

/// Representative spectral-separation coefficient `Q` for a jammer type (Kaplan &
/// Hegarty, §9.4, Table 9.x — wideband Gaussian is the unit reference; a
/// continuous-wave / narrowband tone despreads less efficiently). The exact value
/// depends on the jammer's power spectral density relative to the C/A spectrum;
/// these are representative and may be overridden per scenario. For a
/// first-principles value, [`crate::navsignal::q_from_ssc`] derives `Q` from the
/// actual signal and jammer power spectra (`Q = 1/(R_c·κ)`); the broadband
/// reference here is cross-checked against it in the tests.
pub fn q_factor(jammer_type: &str, q_override: Option<f64>) -> f64 {
    if let Some(q) = q_override {
        return q.max(1e-9);
    }
    match jammer_type {
        // Wideband noise matched to the GNSS band: the canonical reference.
        "broadband" => 1.0,
        // A swept tone dwells across the band, wideband-like over an epoch.
        "swept" => 1.0,
        // A CW / narrowband tone is despread less efficiently than wideband noise.
        "narrowband" | "cw" => 1.5,
        _ => 1.0,
    }
}

/// A mild receive-antenna gain pattern (dB, relative to its zenith gain): flat
/// overhead, rolling off to −4 dB at the horizon. Representative of a GNSS patch
/// antenna; keeps low-elevation satellites slightly weaker (lost first).
pub fn rx_antenna_gain_db(el_rad: f64) -> f64 {
    let el = el_rad.clamp(0.0, PI / 2.0);
    -4.0 * (1.0 - el / (PI / 2.0))
}

/// Tracking-loop lock status for an effective C/N₀.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum LockStatus {
    Locked,
    Degraded,
    Lost,
}

impl LockStatus {
    fn label(self) -> &'static str {
        match self {
            LockStatus::Locked => "LOCKED",
            LockStatus::Degraded => "DEGRADED",
            LockStatus::Lost => "LOST",
        }
    }
}

/// Classify an effective C/N₀ against the loss threshold and degraded margin.
pub fn lock_status(cn0_eff_dbhz: f64, threshold_dbhz: f64, degraded_margin_db: f64) -> LockStatus {
    if cn0_eff_dbhz < threshold_dbhz {
        LockStatus::Lost
    } else if cn0_eff_dbhz < threshold_dbhz + degraded_margin_db {
        LockStatus::Degraded
    } else {
        LockStatus::Locked
    }
}

// --- scenario ---

/// A ground (or airborne) RF jammer.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct JammerCfg {
    /// Jammer position in ECEF (m).
    pub position_ecef_m: Vec3,
    /// Transmit power (dBW; e.g. a 10 W jammer is 10 dBW).
    pub power_dbw: f64,
    /// Jammer antenna gain toward the receiver (dBi).
    #[serde(default)]
    pub gain_dbi: f64,
    /// `broadband` (default), `narrowband` / `cw`, or `swept`.
    #[serde(default = "default_jammer_type")]
    pub jammer_type: String,
    /// Jammer bandwidth (MHz) — informational; recorded in the result.
    #[serde(default)]
    pub bandwidth_mhz: Option<f64>,
    /// Override the spectral-separation coefficient `Q` (else type-dependent).
    #[serde(default)]
    pub q_override: Option<f64>,
}

/// The receiver's geodetic position.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ReceiverCfg {
    pub lat_deg: f64,
    pub lon_deg: f64,
    #[serde(default)]
    pub alt_m: f64,
}

/// A jamming scenario: a Walker constellation seen by a ground receiver, with an
/// optional jammer denying part or all of the visible set.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct JammingScenario {
    pub seed: u64,
    pub time: TimeCfg,
    pub receiver: ReceiverCfg,
    pub constellation: WalkerSgp4,
    /// The jammer. Absent ⇒ a clean-sky baseline (every visible satellite locks).
    #[serde(default)]
    pub jammer: Option<JammerCfg>,
    #[serde(default = "default_mask_deg")]
    pub mask_deg: f64,
    #[serde(default = "default_threshold")]
    pub tracking_threshold_dbhz: f64,
    #[serde(default = "default_degraded_margin")]
    pub degraded_margin_db: f64,
    #[serde(default = "default_signal_power")]
    pub signal_power_dbw: f64,
    #[serde(default = "default_temp_k")]
    pub temp_k: f64,
    #[serde(default = "default_freq")]
    pub freq_hz: f64,
    #[serde(default = "default_chip_rate")]
    pub chip_rate_hz: f64,
}

/// One satellite's link state at one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct SatLink {
    pub prn: usize,
    pub el_deg: f64,
    pub js_db: f64,
    pub cn0_nominal_dbhz: f64,
    pub cn0_effective_dbhz: f64,
    pub status: String,
}

/// One epoch: the visible set, how many stayed **tracking** (effective C/N₀ at or
/// above the loss threshold — i.e. `Locked` or `Degraded`, not `Lost`), and the
/// per-satellite links.
#[derive(Clone, Debug, Serialize)]
pub struct JammingEpoch {
    pub t: f64,
    pub visible: usize,
    /// Satellites whose effective C/N₀ stays at or above the tracking threshold.
    pub tracking: usize,
    pub gnss_state: GnssState,
    pub sats: Vec<SatLink>,
}

/// Figures of merit for a jamming run.
#[derive(Clone, Debug, Serialize)]
pub struct JammingFoM {
    /// Fraction of epochs with ≥ 4 satellites still **tracking** (above the loss
    /// threshold) under the jammer.
    pub availability_under_jamming: f64,
    /// Fraction of epochs with ≥ 4 satellites geometrically **visible** (the
    /// clean-sky ceiling for this geometry).
    pub availability_nominal: f64,
    /// Fewest satellites tracking at any epoch.
    pub min_tracking: usize,
    /// Mean J/S over all visible-satellite samples (dB); `NaN` with no jammer.
    pub mean_js_db: f64,
}

/// A jamming run result.
#[derive(Clone, Debug, Serialize)]
pub struct JammingResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub jammer_present: bool,
    pub fom: JammingFoM,
    pub epochs: Vec<JammingEpoch>,
}

fn hash_scenario(scn: &JammingScenario) -> String {
    let c = serde_json::to_string(scn).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Run a jamming scenario: propagate the constellation, and at each epoch score
/// every visible satellite's effective C/N₀ under the jammer (if any) and its
/// resulting lock status. Deterministic.
pub fn run_jamming(scn: &JammingScenario) -> JammingResult {
    let station = Geodetic {
        lat_rad: scn.receiver.lat_deg.to_radians(),
        lon_rad: scn.receiver.lon_deg.to_radians(),
        alt_m: scn.receiver.alt_m,
    };
    let station_ecef = geodetic_to_ecef(station);
    let sats = scn.constellation.satellites();

    // The jammer is static, so its geometry (range and the receiver-antenna gain
    // toward it) is computed once. A near-/below-horizon ground jammer sees the
    // antenna's reduced ground gain.
    let jammer_geom = scn.jammer.as_ref().map(|j| {
        let d = dist(station_ecef, j.position_ecef_m);
        let el = look_angles(station, j.position_ecef_m).el_rad;
        (j, d, rx_antenna_gain_db(el))
    });

    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;

    let mut epochs = Vec::with_capacity(n + 1);
    let (mut avail_jam, mut avail_nom, mut min_tracking) = (0usize, 0usize, usize::MAX);
    let (mut js_sum, mut js_count) = (0.0f64, 0usize);

    for i in 0..=n {
        let t = i as f64 * dt;
        let jd = walker_epoch_jd() + t / 86_400.0;
        let mut links = Vec::new();
        for (prn, p) in sats.iter().enumerate() {
            let sat_ecef = teme_to_ecef(p.position_eci(t), jd);
            if !is_visible(station, sat_ecef, scn.mask_deg) {
                continue;
            }
            let look = look_angles(station, sat_ecef);
            let gain = rx_antenna_gain_db(look.el_rad);
            let cn0_nom = nominal_cn0_dbhz(scn.signal_power_dbw, gain, scn.temp_k);
            let (js_db, cn0_eff) = match &jammer_geom {
                Some((j, d, rx_gain_jammer)) => {
                    let js = j_over_s_db(
                        j.power_dbw,
                        j.gain_dbi,
                        *rx_gain_jammer,
                        *d,
                        scn.freq_hz,
                        scn.signal_power_dbw,
                        gain,
                    );
                    let q = q_factor(&j.jammer_type, j.q_override);
                    js_sum += js;
                    js_count += 1;
                    (js, effective_cn0_dbhz(cn0_nom, js, q, scn.chip_rate_hz))
                }
                None => (f64::NEG_INFINITY, cn0_nom),
            };
            let status = lock_status(cn0_eff, scn.tracking_threshold_dbhz, scn.degraded_margin_db);
            links.push(SatLink {
                prn,
                el_deg: look.el_rad.to_degrees(),
                js_db,
                cn0_nominal_dbhz: cn0_nom,
                cn0_effective_dbhz: cn0_eff,
                status: status.label().into(),
            });
        }
        let visible = links.len();
        // A satellite is still tracking while its effective C/N₀ holds at or above
        // the loss threshold — `Locked` or `Degraded`, but not `Lost`.
        let tracking = links.iter().filter(|l| l.status != "LOST").count();
        if visible >= 4 {
            avail_nom += 1;
        }
        if tracking >= 4 {
            avail_jam += 1;
        }
        min_tracking = min_tracking.min(tracking);
        epochs.push(JammingEpoch {
            t,
            visible,
            tracking,
            gnss_state: gnss_state_of(tracking),
            sats: links,
        });
    }

    let denom = (n + 1) as f64;
    JammingResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_scenario(scn),
        seed: scn.seed,
        jammer_present: scn.jammer.is_some(),
        fom: JammingFoM {
            availability_under_jamming: avail_jam as f64 / denom,
            availability_nominal: avail_nom as f64 / denom,
            min_tracking: if min_tracking == usize::MAX {
                0
            } else {
                min_tracking
            },
            mean_js_db: if js_count > 0 {
                js_sum / js_count as f64
            } else {
                f64::NAN
            },
        },
        epochs,
    }
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// Map a tracking-satellite count to a GNSS solution state (≥4 ⇒ a full fix).
fn gnss_state_of(tracking: usize) -> GnssState {
    match tracking {
        0 => GnssState::Denied,
        1..=3 => GnssState::Degraded,
        _ => GnssState::Nominal,
    }
}

/// Render the visible vs. locked satellite count over time as an SVG, with the
/// 4-satellite availability line.
pub fn to_svg(result: &JammingResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (60.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let ep = &result.epochs;
    let t_max = ep.iter().map(|e| e.t).fold(1.0_f64, f64::max);
    let y_max = ep.iter().map(|e| e.visible).max().unwrap_or(8).max(4) as f64 + 1.0;
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |v: f64| mt + ph - (v / y_max) * ph;
    let poly = |sel: &dyn Fn(&JammingEpoch) -> f64| {
        ep.iter()
            .map(|e| format!("{:.1},{:.1}", xof(e.t), yof(sel(e))))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\"><rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"));
    svg.push_str(&format!("<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Satellites visible vs. tracking under jamming</text>"));
    svg.push_str(&crate::chart::y_axis(ml, mt, pw, ph, y_max, "satellites"));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/><line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>", ml + pw));
    let four_y = yof(4.0);
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{four_y:.1}\" x2=\"{:.0}\" y2=\"{four_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/><text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">4-SV fix</text>", ml + pw, ml + 4.0, four_y - 4.0));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#8c8273\" stroke-width=\"2\" points=\"{}\"/>",
        poly(&|e| e.visible as f64)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#46b67e\" stroke-width=\"2\" points=\"{}\"/>",
        poly(&|e| e.tracking as f64)
    ));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"44\" fill=\"#8c8273\">visible</text><text x=\"{:.0}\" y=\"60\" fill=\"#46b67e\">tracking</text>", ml + 10.0, ml + 10.0));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn representative_broadband_q_matches_psd_derived_value() {
        // Cross-check the representative broadband Q = 1.0 against the
        // first-principles value derived from the C/A power spectrum and a
        // wideband (white) jammer matched to ±1 chip rate.
        use crate::navsignal::{q_from_ssc, ssc_vs_white, Modulation, F0_HZ};
        let ca = Modulation::BpskR { n: 1.0 };
        let kappa = ssc_vs_white(&ca, 2.0 * F0_HZ);
        let q_psd = q_from_ssc(kappa, CA_CHIP_RATE_HZ);
        let q_table = q_factor("broadband", None);
        // Same order of magnitude as the representative unit reference.
        assert!(
            (q_psd / q_table).abs() > 0.3 && (q_psd / q_table).abs() < 3.0,
            "PSD-derived broadband Q {q_psd:.3} vs representative {q_table:.3}"
        );
    }

    #[test]
    fn narrowband_jammer_is_despread_more_than_broadband() {
        // The representative table says a CW/narrowband tone is less effective
        // (higher Q) than matched wideband noise — the despreading spreads the
        // tone's power. Confirm the ordering the anti-jam equation relies on.
        assert!(q_factor("narrowband", None) > q_factor("broadband", None));
    }

    #[test]
    fn free_space_path_loss_matches_the_textbook_formula() {
        // L1 at 1 km: 20log10(1000) + 20log10(1.57542e9) + 20log10(4π/c).
        let fspl = free_space_path_loss_db(1000.0, L1_HZ);
        assert!((fspl - 96.395).abs() < 0.01, "FSPL = {fspl}");
        // +40 dB per decade of range: 100 km is 40 dB more than 1 km.
        let fspl_100km = free_space_path_loss_db(100_000.0, L1_HZ);
        assert!((fspl_100km - fspl - 40.0).abs() < 1e-6);
    }

    #[test]
    fn j_over_s_and_effective_cn0_match_hand_computation() {
        // 10 W (10 dBW) jammer, 0 dBi gains, 1 km, L1, signal −158.5 dBW.
        let js = j_over_s_db(10.0, 0.0, 0.0, 1000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0);
        assert!((js - 72.105).abs() < 0.01, "J/S = {js}");
        // Nominal C/N0 at zenith (0 dB antenna gain), 290 K: −158.5 − (−203.975).
        let cn0 = nominal_cn0_dbhz(DEFAULT_SIGNAL_POWER_DBW, 0.0, DEFAULT_TEMP_K);
        assert!((cn0 - 45.475).abs() < 0.01, "C/N0 = {cn0}");
        // Effective C/N0 under that J/S with broadband Q=1, C/A chip rate.
        let eff = effective_cn0_dbhz(cn0, js, 1.0, CA_CHIP_RATE_HZ);
        assert!((eff - (-12.0)).abs() < 0.1, "eff C/N0 = {eff}");
        assert_eq!(
            lock_status(
                eff,
                DEFAULT_TRACKING_THRESHOLD_DBHZ,
                DEFAULT_DEGRADED_MARGIN_DB
            ),
            LockStatus::Lost
        );
    }

    #[test]
    fn distant_jammer_leaves_a_healthy_link() {
        // The same 10 W jammer at 100 km: J/S ≈ 32.1 dB, effective C/N0 ≈ 27.9
        // dB-Hz — above the 25 dB-Hz tracking threshold, so still locked.
        let js = j_over_s_db(
            10.0,
            0.0,
            0.0,
            100_000.0,
            L1_HZ,
            DEFAULT_SIGNAL_POWER_DBW,
            0.0,
        );
        assert!((js - 32.105).abs() < 0.01, "J/S = {js}");
        let cn0 = nominal_cn0_dbhz(DEFAULT_SIGNAL_POWER_DBW, 0.0, DEFAULT_TEMP_K);
        let eff = effective_cn0_dbhz(cn0, js, 1.0, CA_CHIP_RATE_HZ);
        assert!((eff - 27.9).abs() < 0.1, "eff C/N0 = {eff}");
        // 27.9 dB-Hz is above the 25 dB-Hz loss threshold but within the 6 dB
        // degraded band [25, 31): still tracking, not lost.
        assert_eq!(
            lock_status(
                eff,
                DEFAULT_TRACKING_THRESHOLD_DBHZ,
                DEFAULT_DEGRADED_MARGIN_DB
            ),
            LockStatus::Degraded
        );
        assert!(eff >= DEFAULT_TRACKING_THRESHOLD_DBHZ, "must not lose lock");
    }

    fn gps_like() -> WalkerSgp4 {
        // A GPS-like Walker shell (24 satellites) so several are always visible.
        WalkerSgp4 {
            altitude_km: 20_200.0,
            inclination_deg: 55.0,
            planes: 6,
            sats_per_plane: 4,
            phasing_f: 1.0,
        }
    }

    fn scenario(jammer: Option<JammerCfg>) -> JammingScenario {
        JammingScenario {
            seed: 1,
            time: TimeCfg {
                step_s: 5.0,
                duration_s: 30.0,
            },
            receiver: ReceiverCfg {
                lat_deg: 52.0,
                lon_deg: 4.0,
                alt_m: 0.0,
            },
            constellation: gps_like(),
            jammer,
            mask_deg: 5.0,
            tracking_threshold_dbhz: DEFAULT_TRACKING_THRESHOLD_DBHZ,
            degraded_margin_db: DEFAULT_DEGRADED_MARGIN_DB,
            signal_power_dbw: DEFAULT_SIGNAL_POWER_DBW,
            temp_k: DEFAULT_TEMP_K,
            freq_hz: L1_HZ,
            chip_rate_hz: CA_CHIP_RATE_HZ,
        }
    }

    /// A jammer at `distance_m` straight out along ECEF-X from the receiver (the
    /// J/S depends only on range, so the direction is immaterial).
    fn jammer_at(scn: &JammingScenario, distance_m: f64, power_dbw: f64) -> JammerCfg {
        let station = Geodetic {
            lat_rad: scn.receiver.lat_deg.to_radians(),
            lon_rad: scn.receiver.lon_deg.to_radians(),
            alt_m: scn.receiver.alt_m,
        };
        let s = geodetic_to_ecef(station);
        JammerCfg {
            position_ecef_m: [s[0] + distance_m, s[1], s[2]],
            power_dbw,
            gain_dbi: 0.0,
            jammer_type: "broadband".into(),
            bandwidth_mhz: Some(20.0),
            q_override: None,
        }
    }

    #[test]
    fn near_jammer_denies_at_least_two_satellites_within_30s() {
        let base = scenario(None);
        let j = jammer_at(&base, 1000.0, 10.0); // 10 W at 1 km
        let scn = scenario(Some(j));
        let r = run_jamming(&scn);
        // The clean-sky baseline genuinely sees ≥ 4 satellites the whole window.
        let nom = run_jamming(&base);
        assert!(
            nom.epochs.iter().all(|e| e.visible >= 4),
            "baseline geometry should keep ≥4 visible"
        );
        // Under the near jammer, at least two satellites lose lock within 30 s.
        let max_lost = scn_lost_within(&r, 30.0);
        assert!(
            max_lost >= 2,
            "expected ≥2 satellites to lose lock; max lost was {max_lost}"
        );
        // It is in fact a full denial: never 4 locked, availability 0.
        assert_eq!(r.fom.availability_under_jamming, 0.0);
        assert!(r.fom.availability_nominal > 0.0);
    }

    #[test]
    fn distant_jammer_causes_no_lock_loss() {
        let base = scenario(None);
        let j = jammer_at(&base, 100_000.0, 10.0); // 10 W at 100 km
        let scn = scenario(Some(j));
        let r = run_jamming(&scn);
        // No satellite is LOST (every visible one stays at or above the tracking
        // threshold), so tracking == visible at every epoch — even though they are
        // degraded relative to clean sky.
        for e in &r.epochs {
            assert_eq!(
                e.tracking, e.visible,
                "no lock loss expected at 100 km (t={})",
                e.t
            );
            assert!(
                e.sats.iter().all(|s| s.status != "LOST"),
                "no satellite should be LOST at 100 km"
            );
        }
        assert_eq!(r.fom.availability_under_jamming, r.fom.availability_nominal);
    }

    #[test]
    fn no_jammer_is_a_clean_sky_baseline_and_run_is_deterministic() {
        let scn = scenario(None);
        let r = run_jamming(&scn);
        assert!(!r.jammer_present);
        // With no jammer every visible satellite tracks, so jammed availability
        // equals the nominal ceiling and the mean J/S is undefined.
        assert_eq!(r.fom.availability_under_jamming, r.fom.availability_nominal);
        assert!(r.fom.mean_js_db.is_nan());
        for e in &r.epochs {
            assert_eq!(e.tracking, e.visible);
            // Clean-sky C/N₀ (≈ 41.7–45.5 dB-Hz) is well above the degraded band,
            // so every visible satellite is fully LOCKED.
            assert!(e.sats.iter().all(|s| s.status == "LOCKED"));
        }
        // Deterministic.
        let a = serde_json::to_string(&run_jamming(&scn)).unwrap();
        let b = serde_json::to_string(&run_jamming(&scn)).unwrap();
        assert_eq!(a, b);
    }

    /// The greatest number of satellites actually LOST at any epoch at or before
    /// `t_limit` seconds.
    fn scn_lost_within(r: &JammingResult, t_limit: f64) -> usize {
        r.epochs
            .iter()
            .filter(|e| e.t <= t_limit + 1e-9)
            .map(|e| e.sats.iter().filter(|s| s.status == "LOST").count())
            .max()
            .unwrap_or(0)
    }

    // --- L02 required-transmit-power inverse solver -----------------------

    #[test]
    fn required_tx_power_round_trips_j_over_s() {
        // Oracle: feed the solved transmit power back through j_over_s_db and recover
        // the target J/S exactly — the two functions are algebraic inverses.
        for &target in &[3.0, 10.0, 30.0] {
            for &d in &[1_000.0, 20_000.0, 100_000.0] {
                let p_tx = required_tx_power_dbw(target, 6.0, 3.0, d, 2.4e9, -143.6, 3.0);
                let js = j_over_s_db(p_tx, 6.0, 3.0, d, 2.4e9, -143.6, 3.0);
                assert!(
                    (js - target).abs() < 1e-9,
                    "round-trip target={target} d={d}"
                );
            }
        }
    }

    #[test]
    fn spoof_and_jam_power_reproduce_p1_table() {
        // Reproduces the P1 attacker-power table (Sec 3): AFS carrier 2.4 GHz, received
        // signal −140.6 dBW (= −143.6 dBW isotropic + 3 dBi user gain), attacker antenna
        // +6 dBi (the value that reproduces every tabulated figure). Spoof capture
        // J/S = 3 dB; denial jam J/S = 30 dB.
        let f = 2.4e9;
        let p_sig_iso = -143.6; // −140.6 dBW P_rx with the +3 dBi user gain removed
        let g_user = 3.0;
        let g_tx = 6.0;
        let watts = |dbw: f64| 10f64.powf(dbw / 10.0);
        let spoof = |d: f64| {
            watts(required_tx_power_dbw(
                3.0, g_tx, g_user, d, f, p_sig_iso, g_user,
            ))
        };
        assert!(
            (spoof(1_000.0) * 1e3 - 0.022).abs() < 0.002,
            "spoof 1km = {} mW",
            spoof(1_000.0) * 1e3
        );
        assert!(
            (spoof(20_000.0) * 1e3 - 8.9).abs() < 0.4,
            "spoof 20km = {} mW",
            spoof(20_000.0) * 1e3
        );
        assert!(
            (spoof(100_000.0) - 0.222).abs() < 0.01,
            "spoof 100km = {} W",
            spoof(100_000.0)
        );
        let jam = |d: f64| {
            watts(required_tx_power_dbw(
                30.0, g_tx, g_user, d, f, p_sig_iso, g_user,
            ))
        };
        assert!(
            (jam(1_000.0) - 0.011).abs() < 0.001,
            "jam 1km = {} W",
            jam(1_000.0)
        );
        assert!(
            (jam(100_000.0) - 111.0).abs() < 3.0,
            "jam 100km = {} W",
            jam(100_000.0)
        );
    }
}
