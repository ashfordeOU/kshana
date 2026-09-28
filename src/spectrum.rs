// SPDX-License-Identifier: AGPL-3.0-only
//! **L-band spectrum model: signal and jammer power spectral densities, a
//! time-frequency waterfall, per-band carrier-to-noise density under interference, and
//! Welch spectral estimates of complex IQ.**
//!
//! A receiver's front end sees the whole L band as one power spectral density (PSD):
//! the thermal noise floor, the navigation signals (about 20 dB *below* that floor, which
//! is why despreading is needed at all) and whatever interference is present. This module
//! builds that density from closed forms, lets it evolve over a scripted timeline, and
//! reduces it to what a tracking loop cares about: the jammer-to-signal ratio (J/S) and
//! the effective carrier-to-noise density ratio (C/N₀) of each band.
//!
//! ## The pieces
//!
//! * **Signals.** GPS L1 C/A (binary phase-shift keying with a rectangular 1.023 Mchip/s
//!   chip, BPSK(1)), Galileo E1 open service (multiplexed binary offset carrier,
//!   MBOC(6,1,1/11), or plain BOC(1,1)), GPS L2 civil (L2C, BPSK(1) composite of the
//!   time-multiplexed CM and CL codes), GPS L5 and Galileo E5a (BPSK(10)). The unit-area
//!   densities are [`crate::navsignal::Modulation::psd`]; this module places them at their
//!   carriers with a received power. No other signal is claimed: GLONASS, BeiDou and
//!   Galileo E6 are not modelled.
//! * **Jammers** ([`Waveform`]): a continuous-wave (CW) tone, flat narrowband noise, a
//!   linear sawtooth chirp (swept jammer) and broadband noise whose spectrum matches a
//!   band's own modulation. Each has a centre, a bandwidth where it applies, a received
//!   power (given directly, or from an effective isotropic radiated power (EIRP) and a
//!   range through [`crate::jamming::free_space_path_loss_db`]) and an on/off time.
//! * **Interference to C/N₀.** The spectral separation coefficient (SSC)
//!   `κ = ∫_B G_s(f) G_j(f) df` over the receiver band `B` (Betz 2001; Kaplan & Hegarty,
//!   *Understanding GPS/GNSS*, 3rd ed., §9.4), and
//!   `(C/N₀)_eff = [1/(C/N₀) + Σ_j (J_j/S)·κ_j]⁻¹`. For one jammer that is exactly
//!   [`crate::jamming::effective_cn0_dbhz`] with `Q = 1/(R_c κ)`
//!   ([`crate::navsignal::q_from_ssc`]); the tests hold the two paths equal.
//! * **Noise floor.** `N₀ = k·T_sys` with `T_sys = T_ant + T₀(F − 1)`, `T₀ = 290 K` and
//!   `F` the receiver noise figure as a ratio.
//! * **Waterfall.** Frequency across, time down, each cell the bin- and row-averaged PSD
//!   in dBW/Hz. A chirp is averaged over the row exactly (whole sweeps plus the partial
//!   one), and a jammer switching on or off inside a row is weighted by its duty in that
//!   row, so the C/N₀ timeline and the picture come from the same numbers.
//! * **Welch estimate** ([`welch_psd`]): Hann-windowed, overlapped, averaged
//!   periodograms of complex IQ, density-scaled so a white input of variance σ² reads
//!   σ²/f_s. Together with [`crate::sigmf`] this lets a real recording be plotted beside
//!   the model.
//!
//! ## Honest scope
//!
//! Power spectral densities are the continuous closed forms: the fine line structure of
//! a periodic spreading code (1 kHz lines for C/A) is not modelled, so a CW tone is
//! scored against the smooth envelope, not against the nearest code line. A chirp's C/N₀
//! uses the row-averaged spectrum, which assumes the sweep is fast compared with the
//! tracking loop. No automatic gain control, quantisation, pulse blanking, notch filter
//! or antenna pattern acts on the jammer. Intra-system (multiple-access) interference
//! between satellites of the same band is not included.

use crate::jamming::{
    effective_cn0_dbhz, free_space_path_loss_db, j_over_s_db, lock_status, q_factor,
    BOLTZMANN_J_PER_K,
};
use crate::navsignal::{q_from_ssc, spectral_separation_coeff_offset, Modulation, F0_HZ};
use crate::sdr::Cf64;
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::f64::consts::PI;

/// Reference noise temperature `T₀` (K) for a noise figure (IEEE Std 145 convention).
pub const T0_K: f64 = 290.0;

// ───────────────────────────── bands ─────────────────────────────

/// One L-band navigation signal as the spectrum model places it.
#[derive(Clone, Debug, PartialEq)]
pub struct Band {
    /// Stable identifier, e.g. `gps-l1ca`.
    pub name: String,
    /// Carrier frequency (Hz).
    pub centre_hz: f64,
    /// Spreading modulation (unit-area PSD).
    pub modulation: Modulation,
    /// Received signal power at the antenna output (dBW).
    pub signal_power_dbw: f64,
    /// Double-sided receiver front-end bandwidth (Hz) over which the SSC is integrated.
    pub rx_bandwidth_hz: f64,
}

/// The band identifiers the engine models, in frequency order from the top.
pub const BAND_NAMES: &[&str] = &["gps-l1ca", "galileo-e1", "gps-l2c", "gps-l5", "galileo-e5a"];

/// Default parameters of a named band: carrier, modulation, the interface-specification
/// minimum received power, and a front-end bandwidth. Returns `None` for a name the
/// engine does not model.
///
/// Sources of the received-power figures (minimum user-received power, 0 dBic antenna):
/// IS-GPS-200 (L1 C/A −158.5 dBW, L2C −160.0 dBW), IS-GPS-705 (L5, each of I5 and Q5,
/// −157.9 dBW), Galileo Open Service Signal-in-Space Interface Control Document (E1 −157.0
/// dBW, E5a −155.0 dBW, each the total of data and pilot). The bandwidths are modelling
/// choices: the null-to-null main lobe for the BPSK signals and ±7.161 MHz for MBOC so
/// the BOC(6,1) lobes at about ±6.1 MHz are inside.
pub fn default_band(name: &str) -> Option<Band> {
    let (centre_mhz, modulation, p, bw_mhz) = match name {
        "gps-l1ca" => (1575.42, Modulation::BpskR { n: 1.0 }, -158.5, 2.046),
        "galileo-e1" => (1575.42, Modulation::Mboc { p: 1.0 / 11.0 }, -157.0, 14.322),
        "gps-l2c" => (1227.60, Modulation::BpskR { n: 1.0 }, -160.0, 2.046),
        "gps-l5" => (1176.45, Modulation::BpskR { n: 10.0 }, -157.9, 20.46),
        "galileo-e5a" => (1176.45, Modulation::BpskR { n: 10.0 }, -155.0, 20.46),
        _ => return None,
    };
    Some(Band {
        name: name.to_string(),
        centre_hz: centre_mhz * 1e6,
        modulation,
        signal_power_dbw: p,
        rx_bandwidth_hz: bw_mhz * 1e6,
    })
}

impl Band {
    /// Signal PSD (W/Hz) at absolute frequency `f_hz`.
    pub fn psd_w_per_hz(&self, f_hz: f64) -> f64 {
        db_to_lin(self.signal_power_dbw) * self.modulation.psd(f_hz - self.centre_hz)
    }

    /// Nominal C/N₀ (dB-Hz) against a thermal floor `n0_dbw_per_hz`.
    pub fn nominal_cn0_dbhz(&self, n0_dbw_per_hz: f64) -> f64 {
        self.signal_power_dbw - n0_dbw_per_hz
    }
}

/// Positive-frequency nulls of a unit-area PSD up to `f_max_hz`, located numerically:
/// a scan on a grid of `chip_rate/2000` for local minima below 1e-6 of the density's
/// peak, each refined by golden-section search. This is a measurement of the closed
/// form, not a restatement of where its zeros are expected, which is what lets the
/// tests hold it against the textbook main-lobe widths.
pub fn psd_nulls_hz(m: &Modulation, f_max_hz: f64) -> Vec<f64> {
    let step = m.chip_rate_hz() / 2000.0;
    let n = (f_max_hz / step).ceil() as usize;
    let vals: Vec<f64> = (0..=n).map(|i| m.psd(i as f64 * step)).collect();
    let peak = vals.iter().cloned().fold(0.0, f64::max);
    let mut out = Vec::new();
    for i in 1..n {
        if vals[i] <= vals[i - 1] && vals[i] <= vals[i + 1] && vals[i] < 1e-6 * peak {
            let f = golden_min(|f| m.psd(f), (i - 1) as f64 * step, (i + 1) as f64 * step);
            if out.last().is_none_or(|&l: &f64| (f - l).abs() > 2.0 * step) {
                out.push(f);
            }
        }
    }
    out
}

/// Positive frequency (Hz) of the PSD's maximum over `(0, f_max_hz]`, located by a
/// scan and a golden-section refinement.
pub fn psd_peak_hz(m: &Modulation, f_max_hz: f64) -> f64 {
    let step = m.chip_rate_hz() / 2000.0;
    let n = (f_max_hz / step).ceil() as usize;
    let mut best = (0usize, f64::NEG_INFINITY);
    for i in 1..=n {
        let v = m.psd(i as f64 * step);
        if v > best.1 {
            best = (i, v);
        }
    }
    let lo = (best.0 as f64 - 1.0).max(0.0) * step;
    let hi = (best.0 as f64 + 1.0) * step;
    golden_min(|f| -m.psd(f), lo, hi)
}

/// Main-lobe null-to-null width (Hz) of a spectrum centred on the carrier: twice its
/// first positive null. Meaningful for BPSK; for a split spectrum (BOC, MBOC) each main
/// lobe instead spans from the carrier null to the first positive null.
pub fn main_lobe_null_to_null_hz(m: &Modulation) -> f64 {
    let nulls = psd_nulls_hz(m, 4.0 * m.chip_rate_hz());
    nulls.first().map(|f| 2.0 * f).unwrap_or(f64::NAN)
}

fn golden_min(g: impl Fn(f64) -> f64, mut a: f64, mut b: f64) -> f64 {
    let r = (5f64.sqrt() - 1.0) / 2.0;
    let mut c = b - r * (b - a);
    let mut d = a + r * (b - a);
    for _ in 0..200 {
        if (b - a).abs() < 1e-9 * (1.0 + a.abs()) {
            break;
        }
        if g(c) < g(d) {
            b = d;
        } else {
            a = c;
        }
        c = b - r * (b - a);
        d = a + r * (b - a);
    }
    0.5 * (a + b)
}

// ───────────────────────────── jammers ─────────────────────────────

/// A jammer's waveform.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Waveform {
    /// Continuous-wave tone at the centre frequency.
    Cw,
    /// Flat (band-limited white) noise over `bandwidth_mhz` about the centre.
    Narrowband,
    /// Linear sawtooth chirp sweeping `bandwidth_mhz` about the centre every
    /// `sweep_period_us`.
    Chirp,
    /// Broadband noise whose spectrum is the `matched_to` band's own modulation,
    /// centred on the jammer's centre frequency.
    Matched,
}

impl Waveform {
    fn as_str(self) -> &'static str {
        match self {
            Waveform::Cw => "cw",
            Waveform::Narrowband => "narrowband",
            Waveform::Chirp => "chirp",
            Waveform::Matched => "matched",
        }
    }

    /// The jammer type the `jamming` kind's representative Q table uses for this
    /// waveform ([`crate::jamming::q_factor`]).
    pub fn jamming_kind_type(self) -> &'static str {
        match self {
            Waveform::Cw => "cw",
            Waveform::Narrowband => "narrowband",
            Waveform::Chirp => "swept",
            Waveform::Matched => "broadband",
        }
    }
}

fn default_rx_gain() -> f64 {
    0.0
}

/// A jammer in a scenario.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct JammerCfg {
    /// A label for the report and chart.
    #[serde(default)]
    pub name: Option<String>,
    /// The waveform.
    pub waveform: Waveform,
    /// Centre frequency (MHz).
    pub centre_mhz: f64,
    /// Occupied (narrowband) or swept (chirp) bandwidth (MHz).
    #[serde(default)]
    pub bandwidth_mhz: Option<f64>,
    /// Chirp sweep period (µs).
    #[serde(default)]
    pub sweep_period_us: Option<f64>,
    /// For `matched`: the band whose modulation spectrum the noise copies.
    #[serde(default)]
    pub matched_to: Option<String>,
    /// Received jammer power at the antenna output (dBW), total over its spectrum.
    #[serde(default)]
    pub received_power_dbw: Option<f64>,
    /// Effective isotropic radiated power toward the receiver (dBW); with `range_m`.
    #[serde(default)]
    pub eirp_dbw: Option<f64>,
    /// Jammer-to-receiver range (m); with `eirp_dbw`.
    #[serde(default)]
    pub range_m: Option<f64>,
    /// Receive-antenna gain toward the jammer (dBi); with `eirp_dbw`.
    #[serde(default = "default_rx_gain")]
    pub rx_gain_dbi: f64,
    /// Switch-on time (s).
    #[serde(default)]
    pub on_s: f64,
    /// Switch-off time (s); absent means on until the end.
    #[serde(default)]
    pub off_s: Option<f64>,
}

/// A jammer resolved into the quantities the model uses.
#[derive(Clone, Debug)]
pub struct Jammer {
    /// Label.
    pub name: String,
    /// Waveform.
    pub waveform: Waveform,
    /// Centre frequency (Hz).
    pub centre_hz: f64,
    /// Occupied or swept bandwidth (Hz); zero for a tone, the modulation's own for matched.
    pub bandwidth_hz: f64,
    /// Chirp sweep period (s); zero otherwise.
    pub sweep_period_s: f64,
    /// For matched noise, the spectrum it copies.
    pub matched: Option<Modulation>,
    /// Received power (dBW).
    pub received_power_dbw: f64,
    /// The link that produced it, when given as EIRP and range: (EIRP dBW, range m,
    /// receive gain dBi).
    pub link: Option<(f64, f64, f64)>,
    /// On time (s).
    pub on_s: f64,
    /// Off time (s), `+∞` when it never switches off.
    pub off_s: f64,
}

impl JammerCfg {
    /// Resolve against the scenario's bands.
    pub fn resolve(&self, idx: usize, bands: &[Band]) -> Result<Jammer, String> {
        let name = self
            .name
            .clone()
            .unwrap_or_else(|| format!("jammer-{}-{}", idx + 1, self.waveform.as_str()));
        let centre_hz = self.centre_mhz * 1e6;
        if !(centre_hz.is_finite() && centre_hz > 0.0) {
            return Err(format!("{name}: centre_mhz must be positive"));
        }
        let bw = |what: &str| -> Result<f64, String> {
            match self.bandwidth_mhz {
                Some(b) if b.is_finite() && b > 0.0 => Ok(b * 1e6),
                _ => Err(format!(
                    "{name}: a {what} jammer needs a positive bandwidth_mhz"
                )),
            }
        };
        let (bandwidth_hz, sweep_period_s, matched) = match self.waveform {
            Waveform::Cw => (0.0, 0.0, None),
            Waveform::Narrowband => (bw("narrowband")?, 0.0, None),
            Waveform::Chirp => {
                let t = match self.sweep_period_us {
                    Some(t) if t.is_finite() && t > 0.0 => t * 1e-6,
                    _ => {
                        return Err(format!(
                            "{name}: a chirp jammer needs a positive sweep_period_us"
                        ))
                    }
                };
                (bw("chirp")?, t, None)
            }
            Waveform::Matched => {
                let target = self.matched_to.as_deref().ok_or_else(|| {
                    format!("{name}: a matched jammer needs matched_to = \"<band name>\"")
                })?;
                let b = bands
                    .iter()
                    .find(|b| b.name == target)
                    .cloned()
                    .or_else(|| default_band(target))
                    .ok_or_else(|| format!("{name}: matched_to names unknown band {target:?}"))?;
                (
                    main_lobe_null_to_null_hz(&b.modulation),
                    0.0,
                    Some(b.modulation),
                )
            }
        };
        let (received_power_dbw, link) =
            match (self.received_power_dbw, self.eirp_dbw, self.range_m) {
                (Some(p), None, None) => (p, None),
                (None, Some(eirp), Some(r)) if r > 0.0 => (
                    eirp + self.rx_gain_dbi - free_space_path_loss_db(r, centre_hz),
                    Some((eirp, r, self.rx_gain_dbi)),
                ),
                _ => {
                    return Err(format!(
                        "{name}: give either received_power_dbw, or eirp_dbw with a positive \
                         range_m (not both)"
                    ))
                }
            };
        let off_s = self.off_s.unwrap_or(f64::INFINITY);
        if off_s <= self.on_s {
            return Err(format!("{name}: off_s must be later than on_s"));
        }
        Ok(Jammer {
            name,
            waveform: self.waveform,
            centre_hz,
            bandwidth_hz,
            sweep_period_s,
            matched,
            received_power_dbw,
            link,
            on_s: self.on_s,
            off_s,
        })
    }
}

/// How a jammer's power is spread over frequency during one time window: a list of
/// flat pieces `(f_lo, f_hi, weight)` whose weights sum to one, a tone, or a matched
/// modulation. A chirp over a window is flat pieces weighted by how long the sweep
/// spends in each.
#[derive(Clone, Debug)]
enum Spread {
    Tone(f64),
    Flat(Vec<(f64, f64, f64)>),
    Shaped(Modulation, f64),
}

impl Jammer {
    /// Fraction of the window `[t0, t0 + dt)` this jammer is on.
    pub fn duty(&self, t0: f64, dt: f64) -> f64 {
        if dt <= 0.0 {
            return if t0 >= self.on_s && t0 < self.off_s {
                1.0
            } else {
                0.0
            };
        }
        let a = t0.max(self.on_s);
        let b = (t0 + dt).min(self.off_s);
        ((b - a) / dt).clamp(0.0, 1.0)
    }

    fn spread(&self, t0: f64, dt: f64) -> Spread {
        let lo = self.centre_hz - self.bandwidth_hz / 2.0;
        match self.waveform {
            Waveform::Cw => Spread::Tone(self.centre_hz),
            Waveform::Narrowband => Spread::Flat(vec![(lo, lo + self.bandwidth_hz, 1.0)]),
            Waveform::Matched => Spread::Shaped(
                self.matched.unwrap_or(Modulation::BpskR { n: 1.0 }),
                self.centre_hz,
            ),
            Waveform::Chirp => {
                let (tp, bw) = (self.sweep_period_s, self.bandwidth_hz);
                if dt <= 0.0 {
                    // An instant: the sweep's instantaneous frequency, as a tone.
                    let ph = (t0 / tp).rem_euclid(1.0);
                    return Spread::Tone(lo + bw * ph);
                }
                // Whole sweeps cover the band uniformly; the remainder covers the part
                // of the band the sweep crosses in the leftover time, from the phase at
                // the start of the window.
                let cycles = dt / tp;
                let whole = cycles.floor();
                let part = cycles - whole;
                let mut pieces = Vec::new();
                if whole > 0.0 {
                    pieces.push((lo, lo + bw, whole / cycles));
                }
                if part > 1e-12 {
                    let ph0 = (t0 / tp).rem_euclid(1.0);
                    let w = part / cycles;
                    let end = ph0 + part;
                    if end <= 1.0 {
                        pieces.push((lo + bw * ph0, lo + bw * end, w));
                    } else {
                        let first = 1.0 - ph0;
                        pieces.push((lo + bw * ph0, lo + bw, w * first / part));
                        pieces.push((lo, lo + bw * (end - 1.0), w * (end - 1.0) / part));
                    }
                }
                Spread::Flat(pieces)
            }
        }
    }

    /// Fraction of this jammer's power inside `[f_lo, f_hi)` over the window.
    pub fn power_fraction_in(&self, f_lo: f64, f_hi: f64, t0: f64, dt: f64) -> f64 {
        match self.spread(t0, dt) {
            Spread::Tone(f) => {
                if f >= f_lo && f < f_hi {
                    1.0
                } else {
                    0.0
                }
            }
            Spread::Flat(pieces) => pieces
                .iter()
                .map(|&(a, b, w)| w * overlap(a, b, f_lo, f_hi) / (b - a).max(1e-300))
                .sum(),
            Spread::Shaped(m, fc) => integrate_range(f_lo - fc, f_hi - fc, 64, |f| m.psd(f)),
        }
    }

    /// Spectral separation coefficient `κ` (1/Hz) of this jammer, averaged over the
    /// window, against `band` over its receiver bandwidth.
    pub fn ssc(&self, band: &Band, t0: f64, dt: f64) -> f64 {
        let half = band.rx_bandwidth_hz / 2.0;
        let (lo, hi) = (band.centre_hz - half, band.centre_hz + half);
        let g = |f: f64| band.modulation.psd(f - band.centre_hz);
        let lobe = band.modulation.chip_rate_hz();
        match self.spread(t0, dt) {
            Spread::Tone(f) => {
                if f >= lo && f <= hi {
                    g(f)
                } else {
                    0.0
                }
            }
            Spread::Flat(pieces) => pieces
                .iter()
                .map(|&(a, b, w)| {
                    let (x0, x1) = (a.max(lo), b.min(hi));
                    if x1 <= x0 {
                        return 0.0;
                    }
                    let n = (((x1 - x0) / lobe) * 80.0).ceil().max(64.0) as usize;
                    w * integrate_range(x0, x1, n, g) / (b - a)
                })
                .sum(),
            Spread::Shaped(m, fc) => spectral_separation_coeff_offset(
                &band.modulation,
                &m,
                fc - band.centre_hz,
                band.rx_bandwidth_hz,
            ),
        }
    }

    /// Received power (W) scaled by the window duty.
    fn window_power_w(&self, t0: f64, dt: f64) -> f64 {
        db_to_lin(self.received_power_dbw) * self.duty(t0, dt)
    }

    /// J/S (dB) against `band`: total received jammer power over the band's received
    /// signal power. When the jammer is given as EIRP and range this is computed by the
    /// `jamming` kind's own [`crate::jamming::j_over_s_db`].
    pub fn js_db(&self, band: &Band) -> f64 {
        match self.link {
            Some((eirp, r, g)) => {
                j_over_s_db(eirp, 0.0, g, r, self.centre_hz, band.signal_power_dbw, 0.0)
            }
            None => self.received_power_dbw - band.signal_power_dbw,
        }
    }
}

/// `(C/N₀)_eff` (dB-Hz) with several interferers: `[1/(C/N₀) + Σ (J/S)_lin·κ]⁻¹`, each
/// term `(J/S in dB, κ in 1/Hz)`.
pub fn effective_cn0_multi_dbhz(cn0_nominal_dbhz: f64, terms: &[(f64, f64)]) -> f64 {
    let mut denom = 1.0 / db_to_lin(cn0_nominal_dbhz);
    for &(js_db, kappa) in terms {
        denom += db_to_lin(js_db) * kappa;
    }
    -10.0 * denom.log10()
}

/// System noise temperature (K): `T_ant + T₀(F − 1)`.
pub fn system_temp_k(antenna_temp_k: f64, noise_figure_db: f64) -> f64 {
    antenna_temp_k + T0_K * (db_to_lin(noise_figure_db) - 1.0)
}

/// Thermal noise density (dBW/Hz) `10·log₁₀(k·T)`.
pub fn noise_density_dbw_per_hz(temp_k: f64) -> f64 {
    10.0 * (BOLTZMANN_J_PER_K * temp_k).log10()
}

fn db_to_lin(db: f64) -> f64 {
    10f64.powf(db / 10.0)
}

fn lin_to_db(x: f64) -> f64 {
    10.0 * x.max(1e-300).log10()
}

fn overlap(a0: f64, a1: f64, b0: f64, b1: f64) -> f64 {
    (a1.min(b1) - a0.max(b0)).max(0.0)
}

/// Composite Simpson integral of `g` over `[a, b]` with `n` panels (forced even).
fn integrate_range(a: f64, b: f64, n: usize, g: impl Fn(f64) -> f64) -> f64 {
    if b <= a {
        return 0.0;
    }
    let n = if n % 2 == 0 { n.max(2) } else { n + 1 };
    let h = (b - a) / n as f64;
    let mut s = g(a) + g(b);
    for i in 1..n {
        s += if i % 2 == 1 { 4.0 } else { 2.0 } * g(a + i as f64 * h);
    }
    s * h / 3.0
}

// ───────────────────────────── the model ─────────────────────────────

/// Everything the spectrum is built from.
#[derive(Clone, Debug)]
pub struct SpectrumModel {
    /// Signals.
    pub bands: Vec<Band>,
    /// Interferers.
    pub jammers: Vec<Jammer>,
    /// Thermal noise density (W/Hz).
    pub n0_w_per_hz: f64,
}

impl SpectrumModel {
    /// Mean PSD (W/Hz) over the bin `[f_lo, f_hi)` and window `[t0, t0 + dt)`.
    pub fn bin_psd_w_per_hz(&self, f_lo: f64, f_hi: f64, t0: f64, dt: f64) -> f64 {
        let width = (f_hi - f_lo).max(1e-300);
        let mut p = self.n0_w_per_hz;
        for b in &self.bands {
            let pw = db_to_lin(b.signal_power_dbw);
            let frac = integrate_range(f_lo - b.centre_hz, f_hi - b.centre_hz, 16, |f| {
                b.modulation.psd(f)
            });
            p += pw * frac / width;
        }
        for j in &self.jammers {
            let pw = j.window_power_w(t0, dt);
            if pw > 0.0 {
                p += pw * j.power_fraction_in(f_lo, f_hi, t0, dt) / width;
            }
        }
        p
    }

    /// Effective C/N₀ of `band` over a window, and the in-band J/S: the duty-weighted
    /// power of every active jammer that falls inside the band's receiver bandwidth, over
    /// the signal power (`-∞` when none does). A jammer entirely outside the band adds
    /// nothing to either.
    pub fn band_state(&self, band: &Band, t0: f64, dt: f64) -> (f64, f64) {
        let n0_db = lin_to_db(self.n0_w_per_hz);
        let cn0 = band.nominal_cn0_dbhz(n0_db);
        let half = band.rx_bandwidth_hz / 2.0;
        let mut terms = Vec::new();
        let mut j_in_band = 0.0;
        for j in &self.jammers {
            let duty = j.duty(t0, dt);
            if duty <= 0.0 {
                continue;
            }
            let js = j.js_db(band) + lin_to_db(duty);
            let frac = j.power_fraction_in(band.centre_hz - half, band.centre_hz + half, t0, dt);
            j_in_band += db_to_lin(js) * frac;
            terms.push((js, j.ssc(band, t0, dt)));
        }
        let js_in_band = if j_in_band > 0.0 {
            lin_to_db(j_in_band)
        } else {
            f64::NEG_INFINITY
        };
        (effective_cn0_multi_dbhz(cn0, &terms), js_in_band)
    }
}

// ───────────────────────────── FFT and Welch ─────────────────────────────

/// In-place iterative radix-2 fast Fourier transform. `inverse` applies the `+j`
/// kernel without the `1/N` factor. The length must be a power of two.
pub fn fft_in_place(buf: &mut [Cf64], inverse: bool) {
    let n = buf.len();
    if n <= 1 {
        return;
    }
    debug_assert!(n.is_power_of_two(), "fft length {n} is not a power of two");
    let mut j = 0usize;
    for i in 1..n {
        let mut bit = n >> 1;
        while j & bit != 0 {
            j ^= bit;
            bit >>= 1;
        }
        j |= bit;
        if i < j {
            buf.swap(i, j);
        }
    }
    let sign = if inverse { 1.0 } else { -1.0 };
    let mut len = 2;
    while len <= n {
        let ang = sign * 2.0 * PI / len as f64;
        let (wr, wi) = (ang.cos(), ang.sin());
        for start in (0..n).step_by(len) {
            let (mut cr, mut ci) = (1.0f64, 0.0f64);
            for k in 0..len / 2 {
                let a = buf[start + k];
                let b = buf[start + k + len / 2];
                let tr = b.re * cr - b.im * ci;
                let ti = b.re * ci + b.im * cr;
                buf[start + k] = Cf64::new(a.re + tr, a.im + ti);
                buf[start + k + len / 2] = Cf64::new(a.re - tr, a.im - ti);
                let ncr = cr * wr - ci * wi;
                ci = cr * wi + ci * wr;
                cr = ncr;
            }
        }
        len <<= 1;
    }
}

/// A Welch power-spectral-density estimate of complex IQ.
#[derive(Clone, Debug)]
pub struct WelchPsd {
    /// Bin centre frequencies relative to the recording centre (Hz), ascending from
    /// `−f_s/2`.
    pub freq_hz: Vec<f64>,
    /// Two-sided density (input units squared per hertz).
    pub psd: Vec<f64>,
    /// Segments averaged.
    pub segments: usize,
    /// Segment (and transform) length.
    pub nfft: usize,
    /// Equivalent noise bandwidth of one bin (Hz): `f_s·Σw²/(Σw)²`.
    pub enbw_hz: f64,
}

/// Welch's averaged, overlapped, Hann-windowed periodogram (Welch 1967), density
/// scaled: each segment contributes `|FFT(w·x)|² / (f_s·Σw²)`, so a white input of
/// variance σ² reads σ²/f_s in every bin and a tone of power `A²` integrates to `A²`.
/// `nfft` must be a power of two no longer than the input; `overlap` is the fraction in
/// `[0, 0.95]`. The window is the periodic Hann window, the default of
/// `scipy.signal.welch`.
pub fn welch_psd(x: &[Cf64], fs_hz: f64, nfft: usize, overlap: f64) -> Result<WelchPsd, String> {
    if !(fs_hz.is_finite() && fs_hz > 0.0) {
        return Err("welch: the sample rate must be positive".into());
    }
    if nfft < 8 || !nfft.is_power_of_two() {
        return Err(format!(
            "welch: nfft = {nfft} must be a power of two, at least 8"
        ));
    }
    if x.len() < nfft {
        return Err(format!(
            "welch: {} samples is fewer than one {nfft}-point segment",
            x.len()
        ));
    }
    let ov = overlap.clamp(0.0, 0.95);
    let step = ((nfft as f64) * (1.0 - ov)).round().max(1.0) as usize;
    let w: Vec<f64> = (0..nfft)
        .map(|n| 0.5 - 0.5 * (2.0 * PI * n as f64 / nfft as f64).cos())
        .collect();
    let s1: f64 = w.iter().sum();
    let s2: f64 = w.iter().map(|v| v * v).sum();
    let mut acc = vec![0.0; nfft];
    let mut segments = 0usize;
    let mut buf = vec![Cf64::default(); nfft];
    let mut start = 0usize;
    while start + nfft <= x.len() {
        for k in 0..nfft {
            buf[k] = x[start + k] * w[k];
        }
        fft_in_place(&mut buf, false);
        for k in 0..nfft {
            acc[k] += buf[k].re * buf[k].re + buf[k].im * buf[k].im;
        }
        segments += 1;
        start += step;
    }
    let scale = 1.0 / (fs_hz * s2 * segments as f64);
    let half = nfft / 2;
    let mut freq_hz = Vec::with_capacity(nfft);
    let mut psd = Vec::with_capacity(nfft);
    for i in 0..nfft {
        let k = (i + half) % nfft;
        freq_hz.push((i as f64 - half as f64) * fs_hz / nfft as f64);
        psd.push(acc[k] * scale);
    }
    Ok(WelchPsd {
        freq_hz,
        psd,
        segments,
        nfft,
        enbw_hz: fs_hz * s2 / (s1 * s1),
    })
}

// ───────────────────────────── IQ synthesis ─────────────────────────────

/// Synthesise `n` complex baseband samples (in √W) of the model at instant `t_s`, seen
/// through an ideal front end of sample rate `fs_hz` centred on `centre_hz`. Thermal
/// noise, the signals and every noise-like jammer are drawn in the frequency domain with
/// the model's own density in each transform bin, so their Welch estimate converges on
/// the model; a tone and a chirp are added as deterministic waveforms, the chirp gated
/// to the band the front end passes (an ideal anti-alias filter). `n` must be a power
/// of two.
pub fn synthesise_iq(
    model: &SpectrumModel,
    centre_hz: f64,
    fs_hz: f64,
    n: usize,
    t_s: f64,
    seed: u64,
) -> Result<Vec<Cf64>, String> {
    use rand::SeedableRng;
    use rand_distr::{Distribution, StandardNormal};
    if !n.is_power_of_two() || n < 16 {
        return Err(format!("iq: n = {n} must be a power of two, at least 16"));
    }
    let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
    let df = fs_hz / n as f64;
    // Noise-like part: thermal floor, signals, and the active flat/matched jammers.
    let mut noise_only = model.clone();
    noise_only
        .jammers
        .retain(|j| matches!(j.waveform, Waveform::Narrowband | Waveform::Matched));
    let mut spec = vec![Cf64::default(); n];
    for (k, s) in spec.iter_mut().enumerate() {
        let off = if k < n / 2 {
            k as f64 * df
        } else {
            (k as f64 - n as f64) * df
        };
        let f = centre_hz + off;
        let dens = noise_only.bin_psd_w_per_hz(f - df / 2.0, f + df / 2.0, t_s, 0.0);
        let amp = (n as f64 * fs_hz * dens / 2.0).sqrt();
        let g1: f64 = StandardNormal.sample(&mut rng);
        let g2: f64 = StandardNormal.sample(&mut rng);
        *s = Cf64::new(amp * g1, amp * g2);
    }
    fft_in_place(&mut spec, true);
    let inv_n = 1.0 / n as f64;
    let mut x: Vec<Cf64> = spec.into_iter().map(|s| s * inv_n).collect();
    // Deterministic parts.
    for j in &model.jammers {
        if j.duty(t_s, 0.0) <= 0.0 {
            continue;
        }
        let a = db_to_lin(j.received_power_dbw).sqrt();
        match j.waveform {
            Waveform::Cw => {
                let fo = j.centre_hz - centre_hz;
                if fo.abs() < fs_hz / 2.0 {
                    let ph0 = 2.0 * PI * rand::Rng::gen::<f64>(&mut rng);
                    for (k, s) in x.iter_mut().enumerate() {
                        let ph = ph0 + 2.0 * PI * fo * k as f64 / fs_hz;
                        *s = *s + Cf64::new(a * ph.cos(), a * ph.sin());
                    }
                }
            }
            Waveform::Chirp => {
                let lo = j.centre_hz - j.bandwidth_hz / 2.0 - centre_hz;
                let (tp, bw) = (j.sweep_period_s, j.bandwidth_hz);
                let mut phase = 2.0 * PI * rand::Rng::gen::<f64>(&mut rng);
                let t_off = rand::Rng::gen::<f64>(&mut rng) * tp;
                for (k, s) in x.iter_mut().enumerate() {
                    let tau = t_off + k as f64 / fs_hz;
                    let fi = lo + bw * (tau / tp).rem_euclid(1.0);
                    if fi.abs() < fs_hz / 2.0 {
                        *s = *s + Cf64::new(a * phase.cos(), a * phase.sin());
                    }
                    phase += 2.0 * PI * fi / fs_hz;
                }
            }
            _ => {}
        }
    }
    Ok(x)
}

// ───────────────────────────── scenario ─────────────────────────────

fn d_duration() -> f64 {
    60.0
}
fn d_step() -> f64 {
    1.0
}
fn d_nf() -> f64 {
    2.0
}
fn d_tant() -> f64 {
    T0_K
}
fn d_thresh() -> f64 {
    crate::jamming::DEFAULT_TRACKING_THRESHOLD_DBHZ
}
fn d_margin() -> f64 {
    crate::jamming::DEFAULT_DEGRADED_MARGIN_DB
}
fn d_fmin() -> f64 {
    1160.0
}
fn d_fmax() -> f64 {
    1590.0
}
fn d_nfreq() -> usize {
    430
}
fn d_json_freq() -> usize {
    144
}
fn d_json_rows() -> usize {
    60
}
fn d_nfft() -> usize {
    1024
}
fn d_overlap() -> f64 {
    0.5
}
fn d_log2n() -> u32 {
    16
}
fn d_dtype() -> String {
    "cf32_le".into()
}
fn d_full_scale() -> f64 {
    1.0
}

/// Receiver noise and tracking parameters.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReceiverCfg {
    /// Receiver noise figure (dB).
    #[serde(default = "d_nf")]
    pub noise_figure_db: f64,
    /// Antenna noise temperature (K).
    #[serde(default = "d_tant")]
    pub antenna_temp_k: f64,
    /// Loss-of-lock threshold (dB-Hz).
    #[serde(default = "d_thresh")]
    pub tracking_threshold_dbhz: f64,
    /// Margin above the threshold reported as degraded (dB).
    #[serde(default = "d_margin")]
    pub degraded_margin_db: f64,
}

impl Default for ReceiverCfg {
    fn default() -> Self {
        ReceiverCfg {
            noise_figure_db: d_nf(),
            antenna_temp_k: d_tant(),
            tracking_threshold_dbhz: d_thresh(),
            degraded_margin_db: d_margin(),
        }
    }
}

/// The waterfall's frequency grid and the JSON downsampling caps.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct GridCfg {
    /// Lower edge (MHz).
    #[serde(default = "d_fmin")]
    pub f_min_mhz: f64,
    /// Upper edge (MHz).
    #[serde(default = "d_fmax")]
    pub f_max_mhz: f64,
    /// Frequency bins across.
    #[serde(default = "d_nfreq")]
    pub n_freq: usize,
    /// At most this many frequency columns in result.json (block-averaged in power).
    #[serde(default = "d_json_freq")]
    pub json_max_freq: usize,
    /// At most this many time rows in result.json (block-averaged in power).
    #[serde(default = "d_json_rows")]
    pub json_max_rows: usize,
}

impl Default for GridCfg {
    fn default() -> Self {
        GridCfg {
            f_min_mhz: d_fmin(),
            f_max_mhz: d_fmax(),
            n_freq: d_nfreq(),
            json_max_freq: d_json_freq(),
            json_max_rows: d_json_rows(),
        }
    }
}

/// A band entry: a name from [`BAND_NAMES`] with optional overrides.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct BandCfg {
    /// Band name.
    pub name: String,
    /// Received signal power (dBW), overriding the specification minimum.
    #[serde(default)]
    pub signal_power_dbw: Option<f64>,
    /// Receiver front-end bandwidth (MHz).
    #[serde(default)]
    pub rx_bandwidth_mhz: Option<f64>,
    /// For `galileo-e1`: `mboc` (default) or `boc11`.
    #[serde(default)]
    pub modulation: Option<String>,
}

/// Synthesise a snapshot of the model as IQ, write and read it back as SigMF, and
/// compare its Welch estimate with the model.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct IqCfg {
    /// Front-end centre frequency (MHz).
    pub centre_mhz: f64,
    /// Complex sample rate (MHz).
    pub sample_rate_mhz: f64,
    /// Snapshot instant on the timeline (s).
    pub t_s: f64,
    /// log₂ of the sample count.
    #[serde(default = "d_log2n")]
    pub log2_samples: u32,
    /// Welch segment length.
    #[serde(default = "d_nfft")]
    pub nfft: usize,
    /// Welch overlap fraction.
    #[serde(default = "d_overlap")]
    pub overlap: f64,
    /// SigMF data type for the round trip: `cf32_le` or `ci16_le`.
    #[serde(default = "d_dtype")]
    pub datatype: String,
}

/// A real recording to estimate and compare (native builds only).
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RecordingCfg {
    /// Path to the `.sigmf-meta` file.
    pub meta_path: String,
    /// Path to the `.sigmf-data` file; default the metadata path with that extension.
    #[serde(default)]
    pub data_path: Option<String>,
    /// Welch segment length.
    #[serde(default = "d_nfft")]
    pub nfft: usize,
    /// Welch overlap fraction.
    #[serde(default = "d_overlap")]
    pub overlap: f64,
    /// Magnitude the integer full-scale code represents.
    #[serde(default = "d_full_scale")]
    pub full_scale: f64,
    /// Timeline instant whose model spectrum the recording is compared with (s).
    #[serde(default)]
    pub compare_t_s: f64,
}

/// The `spectrum` scenario.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SpectrumScenario {
    /// Always `spectrum`.
    #[serde(default)]
    pub kind: Option<String>,
    /// Random seed for the IQ synthesis.
    #[serde(default)]
    pub seed: u64,
    /// Timeline length (s).
    #[serde(default = "d_duration")]
    pub duration_s: f64,
    /// Row duration (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// Receiver.
    #[serde(default)]
    pub receiver: ReceiverCfg,
    /// Frequency grid.
    #[serde(default)]
    pub grid: GridCfg,
    /// Bands; default all of [`BAND_NAMES`].
    #[serde(default)]
    pub bands: Vec<BandCfg>,
    /// Jammers.
    #[serde(default)]
    pub jammers: Vec<JammerCfg>,
    /// Optional synthetic IQ snapshot with a SigMF round trip.
    #[serde(default)]
    pub iq: Option<IqCfg>,
    /// Optional real recording.
    #[serde(default)]
    pub recording: Option<RecordingCfg>,
}

/// The mean absolute and median differences (dB) between an estimate and the model
/// over the bins where both are finite, plus the ratio of integrated powers.
fn compare_db(est: &[f64], model: &[f64]) -> (f64, f64, f64) {
    let mut d: Vec<f64> = est
        .iter()
        .zip(model)
        .map(|(e, m)| lin_to_db(*e) - lin_to_db(*m))
        .collect();
    let mean_abs = d.iter().map(|v| v.abs()).sum::<f64>() / d.len().max(1) as f64;
    d.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    let median = d.get(d.len() / 2).copied().unwrap_or(f64::NAN);
    let pe: f64 = est.iter().sum();
    let pm: f64 = model.iter().sum();
    (mean_abs, median, pe / pm.max(1e-300))
}

fn round2(v: f64) -> f64 {
    (v * 100.0).round() / 100.0
}

fn finite(v: f64) -> Option<f64> {
    if v.is_finite() {
        Some(v)
    } else {
        None
    }
}

#[cfg(not(target_arch = "wasm32"))]
fn read_recording_files(cfg: &RecordingCfg) -> Result<(String, Vec<u8>, String), String> {
    let meta = std::fs::read_to_string(&cfg.meta_path)
        .map_err(|e| format!("cannot read recording meta_path {:?}: {e}", cfg.meta_path))?;
    let data_path =
        cfg.data_path
            .clone()
            .unwrap_or_else(|| match cfg.meta_path.strip_suffix(".sigmf-meta") {
                Some(stem) => format!("{stem}.sigmf-data"),
                None => format!("{}.sigmf-data", cfg.meta_path),
            });
    let data = std::fs::read(&data_path)
        .map_err(|e| format!("cannot read recording data {data_path:?}: {e}"))?;
    Ok((meta, data, data_path))
}

#[cfg(target_arch = "wasm32")]
fn read_recording_files(_cfg: &RecordingCfg) -> Result<(String, Vec<u8>, String), String> {
    Err(
        "recording is not available in the WebAssembly build: pass the SigMF bytes to \
         kshana::sigmf::read and kshana::spectrum::welch_psd instead"
            .into(),
    )
}

impl SpectrumScenario {
    /// SHA-256 of the canonical JSON of the scenario.
    pub fn scenario_hash(&self) -> String {
        let c = serde_json::to_string(self).unwrap_or_default();
        let mut h = Sha256::new();
        h.update(c.as_bytes());
        hex::encode(h.finalize())
    }

    /// Resolve the bands.
    pub fn resolve_bands(&self) -> Result<Vec<Band>, String> {
        let cfgs: Vec<BandCfg> = if self.bands.is_empty() {
            BAND_NAMES
                .iter()
                .map(|n| BandCfg {
                    name: (*n).to_string(),
                    signal_power_dbw: None,
                    rx_bandwidth_mhz: None,
                    modulation: None,
                })
                .collect()
        } else {
            self.bands.clone()
        };
        let mut out = Vec::new();
        for c in cfgs {
            let mut b = default_band(&c.name).ok_or_else(|| {
                format!(
                    "unknown band {:?}: the spectrum model has {}",
                    c.name,
                    BAND_NAMES.join(", ")
                )
            })?;
            if let Some(p) = c.signal_power_dbw {
                b.signal_power_dbw = p;
            }
            if let Some(bw) = c.rx_bandwidth_mhz {
                if !(bw.is_finite() && bw > 0.0) {
                    return Err(format!("{}: rx_bandwidth_mhz must be positive", c.name));
                }
                b.rx_bandwidth_hz = bw * 1e6;
            }
            match (c.name.as_str(), c.modulation.as_deref()) {
                (_, None) => {}
                ("galileo-e1", Some("mboc")) => b.modulation = Modulation::Mboc { p: 1.0 / 11.0 },
                ("galileo-e1", Some("boc11")) => {
                    b.modulation = Modulation::BocSin { m: 1.0, n: 1.0 }
                }
                (n, Some(m)) => {
                    return Err(format!(
                        "{n}: modulation {m:?} is not selectable (only galileo-e1 takes \
                         \"mboc\" or \"boc11\")"
                    ))
                }
            }
            out.push(b);
        }
        Ok(out)
    }

    /// Build the model.
    pub fn model(&self) -> Result<SpectrumModel, String> {
        let bands = self.resolve_bands()?;
        let jammers = self
            .jammers
            .iter()
            .enumerate()
            .map(|(i, j)| j.resolve(i, &bands))
            .collect::<Result<Vec<_>, _>>()?;
        let t_sys = system_temp_k(self.receiver.antenna_temp_k, self.receiver.noise_figure_db);
        if !(t_sys.is_finite() && t_sys > 0.0) {
            return Err("the system noise temperature must be positive".into());
        }
        Ok(SpectrumModel {
            bands,
            jammers,
            n0_w_per_hz: BOLTZMANN_J_PER_K * t_sys,
        })
    }

    fn validate(&self) -> Result<(usize, usize), String> {
        if !(self.step_s.is_finite() && self.step_s > 0.0) {
            return Err("step_s must be positive".into());
        }
        if !(self.duration_s.is_finite() && self.duration_s >= self.step_s) {
            return Err("duration_s must be at least one step_s".into());
        }
        let rows = (self.duration_s / self.step_s).round() as usize;
        if rows > 5000 {
            return Err(format!("{rows} time rows is more than the 5000 allowed"));
        }
        let g = &self.grid;
        if g.f_max_mhz.partial_cmp(&g.f_min_mhz) != Some(std::cmp::Ordering::Greater)
            || g.n_freq < 2
            || g.n_freq > 4096
        {
            return Err("grid: need f_max_mhz > f_min_mhz and 2 ≤ n_freq ≤ 4096".into());
        }
        Ok((rows, g.n_freq))
    }

    /// Run the scenario: the JSON report, the one-line summary and the SVG chart.
    pub fn run_all(&self) -> Result<(String, String, String), String> {
        let (rows, cols) = self.validate()?;
        let model = self.model()?;
        let n0_db = lin_to_db(model.n0_w_per_hz);
        let t_sys = system_temp_k(self.receiver.antenna_temp_k, self.receiver.noise_figure_db);
        let dt = self.step_s;
        let (f0, f1) = (self.grid.f_min_mhz * 1e6, self.grid.f_max_mhz * 1e6);
        let bin = (f1 - f0) / cols as f64;
        let freq: Vec<f64> = (0..cols).map(|c| f0 + (c as f64 + 0.5) * bin).collect();
        let t_rows: Vec<f64> = (0..rows).map(|r| r as f64 * dt).collect();

        // The grid, in W/Hz.
        let grid: Vec<Vec<f64>> = t_rows
            .iter()
            .map(|&t| {
                (0..cols)
                    .map(|c| {
                        let lo = f0 + c as f64 * bin;
                        model.bin_psd_w_per_hz(lo, lo + bin, t, dt)
                    })
                    .collect()
            })
            .collect();

        // Per-band timeline.
        let thr = self.receiver.tracking_threshold_dbhz;
        let mut band_rows = Vec::new();
        let mut band_json = Vec::new();
        let mut worst: Option<(String, f64, f64)> = None;
        for b in &model.bands {
            let states: Vec<(f64, f64)> =
                t_rows.iter().map(|&t| model.band_state(b, t, dt)).collect();
            let cn0_nom = b.nominal_cn0_dbhz(n0_db);
            let (mut min_c, mut min_t) = (f64::INFINITY, 0.0);
            let mut first_loss = None;
            let mut tracking = 0usize;
            let mut worst_js = f64::NEG_INFINITY;
            for (i, &(c, js)) in states.iter().enumerate() {
                if c < min_c {
                    min_c = c;
                    min_t = t_rows[i];
                }
                if c >= thr {
                    tracking += 1;
                } else if first_loss.is_none() {
                    first_loss = Some(t_rows[i]);
                }
                worst_js = worst_js.max(js);
            }
            if worst.as_ref().is_none_or(|w| min_c < w.1) {
                worst = Some((b.name.clone(), min_c, worst_js));
            }
            band_rows.push(serde_json::json!({
                "name": b.name,
                "cn0_effective_dbhz": states.iter().map(|s| round2(s.0)).collect::<Vec<_>>(),
                "js_db": states.iter().map(|s| finite(s.1).map(round2)).collect::<Vec<_>>(),
                "status": states
                    .iter()
                    .map(|s| format!("{:?}", lock_status(s.0, thr, self.receiver.degraded_margin_db)).to_uppercase())
                    .collect::<Vec<_>>(),
                "min_cn0_dbhz": min_c,
                "min_cn0_t_s": min_t,
                "first_loss_t_s": first_loss,
                "tracking_fraction": tracking as f64 / rows as f64,
                "worst_js_db": finite(worst_js),
            }));
            let pk = psd_peak_hz(
                &b.modulation,
                3.0 * b.modulation.chip_rate_hz().max(7.0 * F0_HZ),
            );
            let nulls = psd_nulls_hz(&b.modulation, 3.0 * b.modulation.chip_rate_hz());
            band_json.push(serde_json::json!({
                "name": b.name,
                "modulation": b.modulation.label(),
                "centre_hz": b.centre_hz,
                "chip_rate_hz": b.modulation.chip_rate_hz(),
                "signal_power_dbw": b.signal_power_dbw,
                "rx_bandwidth_hz": b.rx_bandwidth_hz,
                "first_null_hz": nulls.first().copied(),
                "psd_peak_offset_hz": pk,
                "psd_peak_dbw_per_hz": lin_to_db(b.psd_w_per_hz(b.centre_hz + pk)),
                "nominal_cn0_dbhz": cn0_nom,
            }));
        }

        // Per jammer, per band: the steady-state (continuously on) interference, and
        // the cross-check with the `jamming` kind's chain.
        let mut jam_json = Vec::new();
        let mut cross = Vec::new();
        for j in &model.jammers {
            let mut per_band = Vec::new();
            for b in &model.bands {
                // Time-averaged spectrum: a window long enough to hold whole sweeps.
                let win = if j.sweep_period_s > 0.0 {
                    j.sweep_period_s
                } else {
                    1.0
                };
                let kappa = j.ssc(b, 0.0, win);
                let js = j.js_db(b);
                let half = b.rx_bandwidth_hz / 2.0;
                let frac = j.power_fraction_in(b.centre_hz - half, b.centre_hz + half, 0.0, win);
                let cn0_nom = b.nominal_cn0_dbhz(n0_db);
                let cn0_eff = effective_cn0_multi_dbhz(cn0_nom, &[(js, kappa)]);
                let rc = b.modulation.chip_rate_hz();
                let q = if kappa > 0.0 {
                    Some(q_from_ssc(kappa, rc))
                } else {
                    None
                };
                per_band.push(serde_json::json!({
                    "band": b.name,
                    "ssc_db_per_hz": if kappa > 0.0 { Some(lin_to_db(kappa)) } else { None },
                    "q": q,
                    "js_db": js,
                    "in_band_power_fraction": frac,
                    "js_in_band_db": if frac > 0.0 { Some(js + lin_to_db(frac)) } else { None },
                    "cn0_effective_dbhz": cn0_eff,
                }));
                if let (Some(q), Some((eirp, r, g))) = (q, j.link) {
                    // The jamming kind's own chain on the same inputs: its J/S, its
                    // anti-jam equation with Q taken from this spectrum, and with its
                    // representative Q table.
                    let js_k = j_over_s_db(eirp, 0.0, g, r, j.centre_hz, b.signal_power_dbw, 0.0);
                    let cn0_k = effective_cn0_dbhz(cn0_nom, js_k, q, rc);
                    let q_tab = q_factor(j.waveform.jamming_kind_type(), None);
                    cross.push(serde_json::json!({
                        "jammer": j.name,
                        "band": b.name,
                        "js_spectrum_db": js,
                        "js_jamming_kind_db": js_k,
                        "cn0_spectrum_dbhz": cn0_eff,
                        "cn0_jamming_kind_q_from_ssc_dbhz": cn0_k,
                        "abs_difference_db": (cn0_eff - cn0_k).abs().max((js - js_k).abs()),
                        "jamming_kind_table_q": q_tab,
                        "cn0_jamming_kind_table_q_dbhz": effective_cn0_dbhz(cn0_nom, js_k, q_tab, rc),
                    }));
                }
            }
            jam_json.push(serde_json::json!({
                "name": j.name,
                "waveform": j.waveform.as_str(),
                "centre_hz": j.centre_hz,
                "bandwidth_hz": j.bandwidth_hz,
                "sweep_period_s": if j.sweep_period_s > 0.0 { Some(j.sweep_period_s) } else { None },
                "received_power_dbw": j.received_power_dbw,
                "eirp_dbw": j.link.map(|l| l.0),
                "range_m": j.link.map(|l| l.1),
                "rx_gain_dbi": j.link.map(|l| l.2),
                "on_s": j.on_s,
                "off_s": finite(j.off_s),
                "per_band": per_band,
            }));
        }

        // Downsample the grid for JSON by block-averaging power.
        let fx = cols.div_ceil(self.grid.json_max_freq.max(1));
        let ty = rows.div_ceil(self.grid.json_max_rows.max(1));
        let jcols = cols.div_ceil(fx);
        let jrows = rows.div_ceil(ty);
        let mut wf = Vec::with_capacity(jrows);
        for r in 0..jrows {
            let mut row = Vec::with_capacity(jcols);
            for c in 0..jcols {
                let (mut s, mut n) = (0.0, 0usize);
                for grow in grid.iter().take(((r + 1) * ty).min(rows)).skip(r * ty) {
                    for v in grow.iter().take(((c + 1) * fx).min(cols)).skip(c * fx) {
                        s += v;
                        n += 1;
                    }
                }
                row.push(round2(lin_to_db(s / n as f64)));
            }
            wf.push(row);
        }
        let jfreq: Vec<f64> = (0..jcols)
            .map(|c| {
                let a = f0 + (c * fx) as f64 * bin;
                let b = f0 + (((c + 1) * fx).min(cols)) as f64 * bin;
                0.5 * (a + b)
            })
            .collect();
        let jt: Vec<f64> = (0..jrows).map(|r| (r * ty) as f64 * dt).collect();
        let peak_db = grid
            .iter()
            .flatten()
            .cloned()
            .fold(0.0, f64::max)
            .max(1e-300);

        let iq = match &self.iq {
            None => serde_json::Value::Null,
            Some(c) => self.run_iq(&model, c)?,
        };
        let recording = match &self.recording {
            None => serde_json::Value::Null,
            Some(c) => self.run_recording(&model, c)?,
        };

        let doc = serde_json::json!({
            "kind": "spectrum",
            "label": "MODELLED: an L-band power spectral density built from closed-form \
                      signal spectra (VALIDATED against the textbook main-lobe widths and \
                      spectral separation coefficients), jammer spectra and a kT noise \
                      floor, reduced to J/S and effective C/N0 by the spectral separation \
                      coefficient. The jammer powers, timeline and front-end bandwidths \
                      are scenario inputs, not measurements.",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "scenario_hash": self.scenario_hash(),
            "seed": self.seed,
            "duration_s": self.duration_s,
            "step_s": self.step_s,
            "receiver": {
                "noise_figure_db": self.receiver.noise_figure_db,
                "antenna_temp_k": self.receiver.antenna_temp_k,
                "system_temp_k": t_sys,
                "noise_density_dbw_per_hz": n0_db,
                "tracking_threshold_dbhz": thr,
                "degraded_margin_db": self.receiver.degraded_margin_db,
            },
            "bands": band_json,
            "jammers": jam_json,
            "jamming_kind_cross_check": cross,
            "timeline": {
                "t_s": t_rows,
                "bands": band_rows,
            },
            "waterfall": {
                "f_min_hz": f0,
                "f_max_hz": f1,
                "bin_width_hz": bin * fx as f64,
                "row_duration_s": dt * ty as f64,
                "source_n_freq": cols,
                "source_n_time": rows,
                "n_freq": jcols,
                "n_time": jrows,
                "noise_floor_dbw_per_hz": n0_db,
                "peak_dbw_per_hz": lin_to_db(peak_db),
                "freq_hz": jfreq,
                "t_s": jt,
                "psd_dbw_per_hz": wf,
            },
            "iq": iq,
            "recording": recording,
            "not_modelled": NOT_MODELLED,
            "units": crate::field_schema::units_block(UNITS),
        });
        let json = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
        let summary = match &worst {
            Some((name, c, js)) => format!(
                "scenario spectrum | {} bands | {} jammers | noise floor {:.1} dBW/Hz | worst band {} min C/N0 {:.1} dB-Hz{}",
                model.bands.len(),
                model.jammers.len(),
                n0_db,
                name,
                c,
                if js.is_finite() {
                    format!(" (J/S {js:.1} dB)")
                } else {
                    String::new()
                }
            ),
            None => format!(
                "scenario spectrum | no bands | noise floor {n0_db:.1} dBW/Hz"
            ),
        };
        let svg = waterfall_svg(
            &model,
            &freq,
            &t_rows,
            &grid,
            n0_db,
            thr,
            &doc["timeline"]["bands"],
        );
        Ok((json, summary, svg))
    }

    /// The `[iq]` snapshot as a SigMF recording, with the full-scale magnitude the
    /// integer encodings map to the largest code. The one synthesis both the run's SigMF
    /// round trip and the `--export sigmf` files come from, so the exported pair is the
    /// recording the result document describes.
    fn iq_recording(
        &self,
        model: &SpectrumModel,
        c: &IqCfg,
    ) -> Result<(crate::sigmf::Recording, f64), String> {
        if c.log2_samples < 10 || c.log2_samples > 20 {
            return Err("iq.log2_samples must be between 10 and 20".into());
        }
        let n = 1usize << c.log2_samples;
        let fs = c.sample_rate_mhz * 1e6;
        let fc = c.centre_mhz * 1e6;
        let dtype = crate::sigmf::DataType::parse(&c.datatype)?;
        if dtype == crate::sigmf::DataType::Ci8 {
            return Err("iq.datatype: use cf32_le or ci16_le".into());
        }
        let x = synthesise_iq(model, fc, fs, n, c.t_s, self.seed)?;
        // Full scale for integer output: four times the RMS keeps clipping negligible.
        let rms = (x.iter().map(|s| s.re * s.re + s.im * s.im).sum::<f64>() / n as f64).sqrt();
        let full_scale = 4.0 * rms.max(1e-300);
        let rec = crate::sigmf::Recording {
            meta: crate::sigmf::Meta::new(
                dtype,
                fs,
                fc,
                "kshana spectrum model snapshot (synthetic)",
            ),
            samples: x,
        };
        Ok((rec, full_scale))
    }

    /// The `[iq]` snapshot written as a SigMF pair: the `.sigmf-meta` JSON and the
    /// `.sigmf-data` bytes, exactly as the run writes and reads them back for its own
    /// round trip. `None` when the scenario has no `[iq]` block. This is the
    /// `--export sigmf` path; it reads no file and no clock.
    pub fn export_sigmf(&self) -> Result<Option<(String, Vec<u8>)>, String> {
        let Some(c) = &self.iq else {
            return Ok(None);
        };
        let model = self.model()?;
        let (rec, full_scale) = self.iq_recording(&model, c)?;
        let (meta_json, bytes, _clipped) = crate::sigmf::write(&rec, full_scale)?;
        Ok(Some((meta_json, bytes)))
    }

    fn run_iq(&self, model: &SpectrumModel, c: &IqCfg) -> Result<serde_json::Value, String> {
        let (rec, full_scale) = self.iq_recording(model, c)?;
        let n = rec.samples.len();
        let fs = c.sample_rate_mhz * 1e6;
        let fc = c.centre_mhz * 1e6;
        let dtype = rec.meta.datatype()?;
        let (meta_json, bytes, clipped) = crate::sigmf::write(&rec, full_scale)?;
        let back = crate::sigmf::read(&meta_json, &bytes, full_scale)?;
        let w = welch_psd(&back.samples, back.sample_rate_hz()?, c.nfft, c.overlap)?;
        let df = fs / c.nfft as f64;
        // The model averaged over the snapshot's own duration, so a chirp is the spectrum
        // its sweeps fill during the recording rather than one instantaneous frequency.
        let snap_s = n as f64 / fs;
        let model_psd: Vec<f64> = w
            .freq_hz
            .iter()
            .map(|&f| model.bin_psd_w_per_hz(fc + f - df / 2.0, fc + f + df / 2.0, c.t_s, snap_s))
            .collect();
        // A tone is a line: its Welch estimate is spread over the window's mainlobe,
        // while the model puts it all in one bin. Compare the densities away from any
        // tone, and compare total power over the whole band.
        let tones: Vec<f64> = model
            .jammers
            .iter()
            .filter(|j| j.waveform == Waveform::Cw && j.duty(c.t_s, 0.0) > 0.0)
            .map(|j| j.centre_hz - fc)
            .collect();
        let keep: Vec<usize> = (0..w.freq_hz.len())
            .filter(|&i| tones.iter().all(|t| (w.freq_hz[i] - t).abs() > 4.0 * df))
            .filter(|&i| w.freq_hz[i].abs() < 0.45 * fs)
            .collect();
        let est_k: Vec<f64> = keep.iter().map(|&i| w.psd[i]).collect();
        let mod_k: Vec<f64> = keep.iter().map(|&i| model_psd[i]).collect();
        let (mean_abs, median, _) = compare_db(&est_k, &mod_k);
        let (_, _, power_ratio) = compare_db(&w.psd, &model_psd);
        let step = (w.nfft / 256).max(1);
        Ok(serde_json::json!({
            "label": "Synthetic: the model drawn as IQ at one instant, written to SigMF and \
                      read back, then estimated by Welch. A consistency check of the \
                      synthesis, the SigMF codec and the estimator, not a measurement. A \
                      periodic chirp is drawn as a real sawtooth sweep, whose spectrum has \
                      lines at the sweep rate, Fresnel ripple and tails past its band edges; \
                      the model carries its smooth envelope, so bins near a chirp differ by \
                      design while total power agrees.",
            "centre_hz": fc,
            "sample_rate_hz": fs,
            "t_s": c.t_s,
            "n_samples": n,
            "nfft": w.nfft,
            "segments": w.segments,
            "enbw_hz": w.enbw_hz,
            "sigmf": {
                "datatype": dtype.as_str(),
                "data_bytes": bytes.len(),
                "clipped_components": clipped,
                "full_scale": full_scale,
                "meta": serde_json::from_str::<serde_json::Value>(&meta_json).map_err(|e| e.to_string())?,
            },
            "comparison": {
                "bins_compared": keep.len(),
                "mean_abs_difference_db": mean_abs,
                "median_difference_db": median,
                "integrated_power_ratio": power_ratio,
            },
            "freq_offset_hz": w.freq_hz.iter().step_by(step).cloned().collect::<Vec<_>>(),
            "welch_dbw_per_hz": w.psd.iter().step_by(step).map(|p| round2(lin_to_db(*p))).collect::<Vec<_>>(),
            "model_dbw_per_hz": model_psd.iter().step_by(step).map(|p| round2(lin_to_db(*p))).collect::<Vec<_>>(),
        }))
    }

    fn run_recording(
        &self,
        model: &SpectrumModel,
        c: &RecordingCfg,
    ) -> Result<serde_json::Value, String> {
        let (meta_json, data, data_path) = read_recording_files(c)?;
        let rec = crate::sigmf::read(&meta_json, &data, c.full_scale)?;
        let fs = rec.sample_rate_hz()?;
        let w = welch_psd(&rec.samples, fs, c.nfft, c.overlap)?;
        let centre = rec.meta.centre_hz();
        let df = fs / c.nfft as f64;
        let (model_db, cmp) = match centre {
            Some(fc) => {
                let m: Vec<f64> = w
                    .freq_hz
                    .iter()
                    .map(|&f| {
                        model.bin_psd_w_per_hz(
                            fc + f - df / 2.0,
                            fc + f + df / 2.0,
                            c.compare_t_s,
                            0.0,
                        )
                    })
                    .collect();
                let (mean_abs, median, ratio) = compare_db(&w.psd, &m);
                (
                    Some(m.iter().map(|p| round2(lin_to_db(*p))).collect::<Vec<_>>()),
                    serde_json::json!({
                        "median_offset_db": median,
                        "mean_abs_difference_db": mean_abs,
                        "integrated_power_ratio": ratio,
                        "note": "A SigMF recording carries no absolute power calibration, so \
                                 the median offset is the recording's unknown scale plus any \
                                 real difference; read the shape, not the level.",
                    }),
                )
            }
            None => (None, serde_json::Value::Null),
        };
        Ok(serde_json::json!({
            "meta_path": c.meta_path,
            "data_path": data_path,
            "datatype": rec.meta.global.datatype,
            "sample_rate_hz": fs,
            "centre_hz": centre,
            "n_samples": rec.samples.len(),
            "nfft": w.nfft,
            "segments": w.segments,
            "enbw_hz": w.enbw_hz,
            "freq_offset_hz": w.freq_hz,
            "welch_db_per_hz": w.psd.iter().map(|p| round2(lin_to_db(*p))).collect::<Vec<_>>(),
            "model_dbw_per_hz": model_db,
            "comparison": cmp,
        }))
    }
}

/// What the report states the model leaves out.
pub const NOT_MODELLED: &[&str] = &[
    "spreading-code line structure (for example the 1 kHz lines of C/A): tones are scored \
     against the smooth envelope",
    "automatic gain control, quantisation, pulse blanking and notch filtering",
    "the receive-antenna pattern toward the jammer beyond one gain figure",
    "intra-system multiple-access interference between satellites of one band",
    "GLONASS G1/G2, BeiDou B1/B2 and Galileo E6",
    "a chirp's effect on the loop at sweep rates comparable with the loop bandwidth: its \
     C/N0 uses the row-averaged spectrum",
];

// ───────────────────────────── chart ─────────────────────────────

/// Colour for a normalised value `u ∈ [0, 1]` on a dark-to-bright sequential ramp.
fn ramp_colour(u: f64) -> String {
    const STOPS: [(f64, [f64; 3]); 5] = [
        (0.0, [12.0, 11.0, 8.0]),
        (0.25, [66.0, 10.0, 104.0]),
        (0.5, [147.0, 38.0, 103.0]),
        (0.75, [221.0, 81.0, 58.0]),
        (1.0, [252.0, 255.0, 164.0]),
    ];
    let u = u.clamp(0.0, 1.0);
    let mut i = 0;
    while i + 1 < STOPS.len() - 1 && u > STOPS[i + 1].0 {
        i += 1;
    }
    let (a, ca) = STOPS[i];
    let (b, cb) = STOPS[i + 1];
    let t = ((u - a) / (b - a)).clamp(0.0, 1.0);
    let c: Vec<u8> = (0..3)
        .map(|k| (ca[k] + t * (cb[k] - ca[k])).round() as u8)
        .collect();
    format!("#{:02x}{:02x}{:02x}", c[0], c[1], c[2])
}

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

/// The waterfall (frequency across, time down, colour = PSD) with band markers, and a
/// bar panel of each band's nominal and minimum effective C/N₀ against the threshold.
fn waterfall_svg(
    model: &SpectrumModel,
    freq: &[f64],
    t_rows: &[f64],
    grid: &[Vec<f64>],
    n0_db: f64,
    thr: f64,
    timeline_bands: &serde_json::Value,
) -> String {
    let (w, h) = (1000.0_f64, 540.0_f64);
    let (x0, y0, pw, ph) = (60.0, 70.0, 600.0, 400.0);
    let levels = 24usize;
    let lo_db = n0_db - 1.0;
    let hi_db = grid
        .iter()
        .flatten()
        .map(|p| lin_to_db(*p))
        .fold(lo_db + 10.0, f64::max);
    let cols = freq.len();
    let rows = t_rows.len();
    let cw = pw / cols as f64;
    let rh = ph / rows as f64;
    let mut s = crate::chart::frame_open(
        w,
        h,
        "L-band spectrum waterfall",
        &format!(
            "frequency across, time down, colour = power spectral density (dBW/Hz); noise floor {n0_db:.1} dBW/Hz"
        ),
    );
    // Cells, run-length merged per row on the quantised colour.
    s.push_str("<g shape-rendering=\"crispEdges\">");
    for (r, row) in grid.iter().enumerate() {
        let y = y0 + r as f64 * rh;
        let mut c = 0;
        while c < cols {
            let q = |p: f64| {
                let u = (lin_to_db(p) - lo_db) / (hi_db - lo_db);
                ((u * levels as f64).floor() as isize).clamp(0, levels as isize - 1) as usize
            };
            let lvl = q(row[c]);
            let mut e = c + 1;
            while e < cols && q(row[e]) == lvl {
                e += 1;
            }
            s.push_str(&format!(
                "<rect x=\"{:.2}\" y=\"{:.2}\" width=\"{:.2}\" height=\"{:.2}\" fill=\"{}\"/>",
                x0 + c as f64 * cw,
                y,
                (e - c) as f64 * cw + 0.3,
                rh + 0.3,
                ramp_colour((lvl as f64 + 0.5) / levels as f64)
            ));
            c = e;
        }
    }
    s.push_str("</g>");
    s.push_str(&crate::chart::panel_axes(x0, y0, pw, y0 + ph, ""));
    // Frequency ticks (MHz) and band markers.
    let (fa, fb) = (
        freq[0] - (freq[1] - freq[0]) / 2.0,
        freq[cols - 1] + (freq[1] - freq[0]) / 2.0,
    );
    let xf = |f: f64| x0 + (f - fa) / (fb - fa) * pw;
    for k in 0..=5 {
        let f = fa + (fb - fa) * k as f64 / 5.0;
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\" fill=\"#8a8172\">{:.0}</text>",
            xf(f),
            y0 + ph + 16.0,
            f / 1e6
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"12\" fill=\"#8a8172\">frequency (MHz)</text>",
        x0 + pw / 2.0,
        y0 + ph + 34.0
    ));
    let mut seen: Vec<f64> = Vec::new();
    for b in &model.bands {
        if b.centre_hz < fa || b.centre_hz > fb {
            continue;
        }
        let x = xf(b.centre_hz);
        let dup = seen
            .iter()
            .filter(|&&c| (c - b.centre_hz).abs() < 1.0)
            .count();
        seen.push(b.centre_hz);
        s.push_str(&format!(
            "<line x1=\"{x:.1}\" y1=\"{:.1}\" x2=\"{x:.1}\" y2=\"{y0:.1}\" stroke=\"#bcb3a3\"/>\
             <text x=\"{x:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\" fill=\"#bcb3a3\">{}</text>",
            y0 - 6.0,
            y0 - 9.0 - 11.0 * dup as f64,
            esc(&b.name)
        ));
    }
    // Time ticks.
    let t_end =
        t_rows.last().copied().unwrap_or(0.0) + (t_rows.get(1).copied().unwrap_or(1.0) - t_rows[0]);
    for k in 0..=4 {
        let t = t_end * k as f64 / 4.0;
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"11\" fill=\"#8a8172\">{:.0}</text>",
            x0 - 6.0,
            y0 + ph * k as f64 / 4.0 + 4.0,
            t
        ));
    }
    s.push_str(&format!(
        "<text x=\"16\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"12\" fill=\"#8a8172\" transform=\"rotate(-90 16 {:.1})\">time (s)</text>",
        y0 + ph / 2.0,
        y0 + ph / 2.0
    ));
    // Colour bar.
    let (bx, by, bw_, bh) = (x0, h - 26.0, 240.0, 10.0);
    for k in 0..levels {
        s.push_str(&format!(
            "<rect x=\"{:.1}\" y=\"{by:.1}\" width=\"{:.2}\" height=\"{bh:.1}\" fill=\"{}\"/>",
            bx + bw_ * k as f64 / levels as f64,
            bw_ / levels as f64 + 0.3,
            ramp_colour((k as f64 + 0.5) / levels as f64)
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\" fill=\"#8a8172\">{lo_db:.0}</text>\
         <text x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\" fill=\"#8a8172\">{hi_db:.0} dBW/Hz</text>",
        bx - 2.0 - 26.0,
        by + 9.0,
        bx + bw_ + 4.0,
        by + 9.0
    ));
    // Bars: nominal and minimum effective C/N0 per band.
    let (bx0, bpw) = (720.0, 250.0);
    s.push_str(&crate::chart::panel_axes(
        bx0,
        y0,
        bpw,
        y0 + ph,
        "C/N0 (dB-Hz): nominal (grey) / minimum",
    ));
    let cmax = 60.0;
    let xb = |c: f64| bx0 + (c.clamp(0.0, cmax) / cmax) * bpw;
    let n0 = model.bands.len().max(1) as f64;
    let slot = ph / n0;
    let n0_db_l = n0_db;
    for (i, b) in model.bands.iter().enumerate() {
        let yc = y0 + slot * (i as f64 + 0.5);
        let nom = b.nominal_cn0_dbhz(n0_db_l);
        let min_c = timeline_bands[i]["min_cn0_dbhz"].as_f64().unwrap_or(nom);
        let col = if min_c < thr {
            "#e5645a"
        } else if min_c < thr + 6.0 {
            "#e0a64a"
        } else {
            "#46b67e"
        };
        s.push_str(&format!(
            "<rect x=\"{bx0:.1}\" y=\"{:.1}\" width=\"{:.1}\" height=\"10\" fill=\"#5a5245\"/>\
             <rect x=\"{bx0:.1}\" y=\"{:.1}\" width=\"{:.1}\" height=\"10\" fill=\"{col}\"/>\
             <text x=\"{bx0:.1}\" y=\"{:.1}\" font-size=\"11\" fill=\"#bcb3a3\">{} {:.1} / {:.1}</text>",
            yc - 12.0,
            (xb(nom) - bx0).max(0.5),
            yc,
            (xb(min_c) - bx0).max(0.5),
            yc - 16.0,
            esc(&b.name),
            nom,
            min_c
        ));
    }
    let xt = xb(thr);
    s.push_str(&format!(
        "<line x1=\"{xt:.1}\" y1=\"{y0:.1}\" x2=\"{xt:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"5 4\"/>\
         <text x=\"{xt:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\" fill=\"#e5645a\">threshold {thr:.0}</text>",
        y0 + ph,
        y0 + ph + 16.0
    ));
    for k in 0..=3 {
        let c = cmax * k as f64 / 3.0;
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\" fill=\"#8a8172\">{c:.0}</text>",
            xb(c),
            y0 + ph + 30.0
        ));
    }
    s.push_str("</svg>");
    s
}

/// Unit and provenance class for every numeric field the report emits.
pub const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "seed", unit: "1", provenance: Input, definition: "random seed of the IQ synthesis; the spectrum and C/N0 timeline draw no random numbers" },
        FieldUnit { path: "duration_s", unit: "s", provenance: Input, definition: "timeline length" },
        FieldUnit { path: "step_s", unit: "s", provenance: Input, definition: "duration of one waterfall row; every row is averaged over it" },
        FieldUnit { path: "receiver.noise_figure_db", unit: "dB", provenance: Input, definition: "receiver noise figure" },
        FieldUnit { path: "receiver.antenna_temp_k", unit: "K", provenance: Input, definition: "antenna noise temperature" },
        FieldUnit { path: "receiver.system_temp_k", unit: "K", provenance: ClosedForm, definition: "T_ant + 290 K x (F - 1), F the noise figure as a ratio" },
        FieldUnit { path: "receiver.noise_density_dbw_per_hz", unit: "dBW/Hz", provenance: ClosedForm, definition: "thermal noise floor 10 log10(k T_sys)" },
        FieldUnit { path: "receiver.tracking_threshold_dbhz", unit: "dB-Hz", provenance: Input, definition: "effective C/N0 below which a band is reported lost" },
        FieldUnit { path: "receiver.degraded_margin_db", unit: "dB", provenance: Input, definition: "margin above the threshold reported as degraded" },
        FieldUnit { path: "bands[].centre_hz", unit: "Hz", provenance: Spec, definition: "carrier frequency from the signal's interface specification" },
        FieldUnit { path: "bands[].chip_rate_hz", unit: "Hz", provenance: Spec, definition: "spreading-code chip rate" },
        FieldUnit { path: "bands[].signal_power_dbw", unit: "dBW", provenance: Spec, definition: "received signal power: the interface-specification minimum unless the scenario overrides it" },
        FieldUnit { path: "bands[].rx_bandwidth_hz", unit: "Hz", provenance: ModelledInput, definition: "double-sided front-end bandwidth over which the spectral separation coefficient is integrated" },
        FieldUnit { path: "bands[].first_null_hz", unit: "Hz", provenance: Computed, definition: "first positive-frequency null of the unit-area PSD, located numerically" },
        FieldUnit { path: "bands[].psd_peak_offset_hz", unit: "Hz", provenance: Computed, definition: "offset from the carrier of the PSD maximum, located numerically" },
        FieldUnit { path: "bands[].psd_peak_dbw_per_hz", unit: "dBW/Hz", provenance: Computed, definition: "signal PSD at its maximum" },
        FieldUnit { path: "bands[].nominal_cn0_dbhz", unit: "dB-Hz", provenance: ClosedForm, definition: "un-jammed C/N0: signal power minus the noise density" },
        FieldUnit { path: "jammers[].centre_hz", unit: "Hz", provenance: Input, definition: "jammer centre frequency" },
        FieldUnit { path: "jammers[].bandwidth_hz", unit: "Hz", provenance: Input, definition: "occupied or swept bandwidth; zero for a tone; the matched modulation's main-lobe null-to-null width for matched noise" },
        FieldUnit { path: "jammers[].sweep_period_s", unit: "s", provenance: Input, definition: "chirp sweep period" },
        FieldUnit { path: "jammers[].received_power_dbw", unit: "dBW", provenance: Computed, definition: "received jammer power at the antenna output, total over its spectrum: the input, or EIRP + receive gain - free-space path loss" },
        FieldUnit { path: "jammers[].eirp_dbw", unit: "dBW", provenance: Input, definition: "effective isotropic radiated power toward the receiver" },
        FieldUnit { path: "jammers[].range_m", unit: "m", provenance: Input, definition: "jammer-to-receiver range" },
        FieldUnit { path: "jammers[].rx_gain_dbi", unit: "dBi", provenance: Input, definition: "receive-antenna gain toward the jammer" },
        FieldUnit { path: "jammers[].on_s", unit: "s", provenance: Input, definition: "switch-on time" },
        FieldUnit { path: "jammers[].off_s", unit: "s", provenance: Input, definition: "switch-off time; null when on to the end" },
        FieldUnit { path: "jammers[].per_band[].ssc_db_per_hz", unit: "dB(1/Hz)", provenance: Computed, definition: "spectral separation coefficient of the continuously-on jammer against the band, 10 log10 of the integral of G_s G_j over the receiver band; null when no jammer power reaches the band" },
        FieldUnit { path: "jammers[].per_band[].q", unit: "1", provenance: Computed, definition: "equivalent anti-jam coefficient Q = 1/(R_c kappa)" },
        FieldUnit { path: "jammers[].per_band[].js_db", unit: "dB", provenance: Computed, definition: "total received jammer power over the band's received signal power" },
        FieldUnit { path: "jammers[].per_band[].in_band_power_fraction", unit: "1", provenance: Computed, definition: "fraction of the jammer's power inside the band's receiver bandwidth" },
        FieldUnit { path: "jammers[].per_band[].js_in_band_db", unit: "dB", provenance: Computed, definition: "J/S counting only the jammer power inside the receiver bandwidth" },
        FieldUnit { path: "jammers[].per_band[].cn0_effective_dbhz", unit: "dB-Hz", provenance: Computed, definition: "effective C/N0 with only this jammer, continuously on" },
        FieldUnit { path: "jamming_kind_cross_check[].js_spectrum_db", unit: "dB", provenance: Computed, definition: "J/S from this kind" },
        FieldUnit { path: "jamming_kind_cross_check[].js_jamming_kind_db", unit: "dB", provenance: Computed, definition: "J/S from jamming::j_over_s_db on the same link inputs" },
        FieldUnit { path: "jamming_kind_cross_check[].cn0_spectrum_dbhz", unit: "dB-Hz", provenance: Computed, definition: "effective C/N0 from this kind's spectral separation coefficient" },
        FieldUnit { path: "jamming_kind_cross_check[].cn0_jamming_kind_q_from_ssc_dbhz", unit: "dB-Hz", provenance: Computed, definition: "effective C/N0 from jamming::effective_cn0_dbhz with Q = 1/(R_c kappa)" },
        FieldUnit { path: "jamming_kind_cross_check[].abs_difference_db", unit: "dB", provenance: InternalConsistency, definition: "larger of the J/S and C/N0 differences between the two chains; zero to rounding" },
        FieldUnit { path: "jamming_kind_cross_check[].jamming_kind_table_q", unit: "1", provenance: ModelledInput, definition: "the jamming kind's representative Q for this jammer type, jamming::q_factor" },
        FieldUnit { path: "jamming_kind_cross_check[].cn0_jamming_kind_table_q_dbhz", unit: "dB-Hz", provenance: Computed, definition: "effective C/N0 the jamming kind reports with its representative Q, for comparison" },
        FieldUnit { path: "timeline.t_s[]", unit: "s", provenance: Computed, definition: "start of each row" },
        FieldUnit { path: "timeline.bands[].cn0_effective_dbhz[]", unit: "dB-Hz", provenance: Computed, definition: "effective C/N0 of the band over each row, every active jammer duty-weighted" },
        FieldUnit { path: "timeline.bands[].js_db[]", unit: "dB", provenance: Computed, definition: "in-band J/S over each row: the duty-weighted power of the active jammers inside the receiver bandwidth over the signal power; null when none reaches the band" },
        FieldUnit { path: "timeline.bands[].min_cn0_dbhz", unit: "dB-Hz", provenance: Computed, definition: "lowest row C/N0" },
        FieldUnit { path: "timeline.bands[].min_cn0_t_s", unit: "s", provenance: Computed, definition: "start of the row with the lowest C/N0" },
        FieldUnit { path: "timeline.bands[].first_loss_t_s", unit: "s", provenance: Computed, definition: "start of the first row below the tracking threshold; null if never" },
        FieldUnit { path: "timeline.bands[].tracking_fraction", unit: "1", provenance: Computed, definition: "fraction of rows at or above the tracking threshold" },
        FieldUnit { path: "timeline.bands[].worst_js_db", unit: "dB", provenance: Computed, definition: "largest row in-band J/S; null when no jammer reaches the band" },
        FieldUnit { path: "waterfall.f_min_hz", unit: "Hz", provenance: Input, definition: "lower edge of the frequency grid" },
        FieldUnit { path: "waterfall.f_max_hz", unit: "Hz", provenance: Input, definition: "upper edge of the frequency grid" },
        FieldUnit { path: "waterfall.bin_width_hz", unit: "Hz", provenance: Computed, definition: "width of one emitted frequency column after downsampling" },
        FieldUnit { path: "waterfall.row_duration_s", unit: "s", provenance: Computed, definition: "duration of one emitted row after downsampling" },
        FieldUnit { path: "waterfall.source_n_freq", unit: "count", provenance: Input, definition: "frequency bins computed" },
        FieldUnit { path: "waterfall.source_n_time", unit: "count", provenance: Computed, definition: "rows computed" },
        FieldUnit { path: "waterfall.n_freq", unit: "count", provenance: Computed, definition: "frequency columns emitted" },
        FieldUnit { path: "waterfall.n_time", unit: "count", provenance: Computed, definition: "rows emitted" },
        FieldUnit { path: "waterfall.noise_floor_dbw_per_hz", unit: "dBW/Hz", provenance: ClosedForm, definition: "thermal noise density" },
        FieldUnit { path: "waterfall.peak_dbw_per_hz", unit: "dBW/Hz", provenance: Computed, definition: "largest cell of the full-resolution grid" },
        FieldUnit { path: "waterfall.freq_hz[]", unit: "Hz", provenance: Computed, definition: "centre of each emitted column" },
        FieldUnit { path: "waterfall.t_s[]", unit: "s", provenance: Computed, definition: "start of each emitted row" },
        FieldUnit { path: "waterfall.psd_dbw_per_hz[][]", unit: "dBW/Hz", provenance: Computed, definition: "power spectral density averaged over the cell in power: noise floor, signals and duty-weighted jammers" },
        FieldUnit { path: "iq.centre_hz", unit: "Hz", provenance: Input, definition: "front-end centre frequency of the synthetic snapshot" },
        FieldUnit { path: "iq.sample_rate_hz", unit: "Hz", provenance: Input, definition: "complex sample rate" },
        FieldUnit { path: "iq.t_s", unit: "s", provenance: Input, definition: "timeline instant of the snapshot" },
        FieldUnit { path: "iq.n_samples", unit: "count", provenance: Input, definition: "complex samples synthesised" },
        FieldUnit { path: "iq.nfft", unit: "count", provenance: Input, definition: "Welch segment length" },
        FieldUnit { path: "iq.segments", unit: "count", provenance: Computed, definition: "Welch segments averaged" },
        FieldUnit { path: "iq.enbw_hz", unit: "Hz", provenance: ClosedForm, definition: "equivalent noise bandwidth of one Welch bin, f_s sum(w^2)/sum(w)^2" },
        FieldUnit { path: "iq.sigmf.data_bytes", unit: "byte", provenance: Computed, definition: "size of the .sigmf-data buffer written and read back" },
        FieldUnit { path: "iq.sigmf.clipped_components", unit: "count", provenance: Computed, definition: "integer components saturated on encoding" },
        FieldUnit { path: "iq.sigmf.full_scale", unit: "sqrt(W)", provenance: Computed, definition: "sample magnitude mapped to the largest integer code: four times the RMS" },
        FieldUnit { path: "iq.sigmf.meta.global.core:sample_rate", unit: "Hz", provenance: Computed, definition: "core:sample_rate written to the SigMF metadata" },
        FieldUnit { path: "iq.sigmf.meta.captures[].core:sample_start", unit: "count", provenance: Computed, definition: "core:sample_start of the capture" },
        FieldUnit { path: "iq.sigmf.meta.captures[].core:frequency", unit: "Hz", provenance: Computed, definition: "core:frequency of the capture" },
        FieldUnit { path: "iq.comparison.bins_compared", unit: "count", provenance: Computed, definition: "Welch bins compared with the model: away from tones and inside 90 % of the Nyquist band" },
        FieldUnit { path: "iq.comparison.mean_abs_difference_db", unit: "dB", provenance: InternalConsistency, definition: "mean absolute Welch-minus-model difference over the compared bins" },
        FieldUnit { path: "iq.comparison.median_difference_db", unit: "dB", provenance: InternalConsistency, definition: "median Welch-minus-model difference; the estimator's bias, near zero" },
        FieldUnit { path: "iq.comparison.integrated_power_ratio", unit: "1", provenance: InternalConsistency, definition: "Welch total power over model total power across the band, tones included" },
        FieldUnit { path: "iq.freq_offset_hz[]", unit: "Hz", provenance: Computed, definition: "Welch bin frequency relative to the centre, decimated for the report" },
        FieldUnit { path: "iq.welch_dbw_per_hz[]", unit: "dBW/Hz", provenance: Computed, definition: "Welch estimate of the read-back IQ" },
        FieldUnit { path: "iq.model_dbw_per_hz[]", unit: "dBW/Hz", provenance: Computed, definition: "model PSD averaged over the same bin" },
        FieldUnit { path: "recording.sample_rate_hz", unit: "Hz", provenance: Measured, definition: "core:sample_rate of the recording" },
        FieldUnit { path: "recording.centre_hz", unit: "Hz", provenance: Measured, definition: "core:frequency of the recording's first capture" },
        FieldUnit { path: "recording.n_samples", unit: "count", provenance: Measured, definition: "complex samples read" },
        FieldUnit { path: "recording.nfft", unit: "count", provenance: Input, definition: "Welch segment length" },
        FieldUnit { path: "recording.segments", unit: "count", provenance: Computed, definition: "Welch segments averaged" },
        FieldUnit { path: "recording.enbw_hz", unit: "Hz", provenance: ClosedForm, definition: "equivalent noise bandwidth of one Welch bin" },
        FieldUnit { path: "recording.freq_offset_hz[]", unit: "Hz", provenance: Computed, definition: "Welch bin frequency relative to the recording centre" },
        FieldUnit { path: "recording.welch_db_per_hz[]", unit: "dB(units^2/Hz)", provenance: Measured, definition: "Welch estimate of the recording in its own uncalibrated units" },
        FieldUnit { path: "recording.model_dbw_per_hz[]", unit: "dBW/Hz", provenance: Computed, definition: "model PSD at the recording's frequencies" },
        FieldUnit { path: "recording.comparison.median_offset_db", unit: "dB", provenance: Computed, definition: "median recording-minus-model difference: the unknown scale plus any real difference" },
        FieldUnit { path: "recording.comparison.mean_abs_difference_db", unit: "dB", provenance: Computed, definition: "mean absolute recording-minus-model difference" },
        FieldUnit { path: "recording.comparison.integrated_power_ratio", unit: "1", provenance: Computed, definition: "recording total power over model total power, in uncalibrated units" },
    ]
};

#[cfg(test)]
mod tests {
    use super::*;
    use crate::navsignal::spectral_separation_coeff;

    const RC: f64 = F0_HZ;

    fn l1() -> Band {
        default_band("gps-l1ca").unwrap()
    }

    // ── ORACLE: BPSK(n) main lobe is 2·n·1.023 MHz null to null ──────────────────
    // Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., §2.4 / §9.4 (the sinc² C/A
    // spectrum, first nulls at ±R_c); Betz 2001. Located numerically on the closed form.
    #[test]
    fn bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz() {
        for n in [1.0, 10.0] {
            let w = main_lobe_null_to_null_hz(&Modulation::BpskR { n });
            let want = 2.0 * n * 1.023e6;
            assert!(
                (w - want).abs() < 1e-3 * n,
                "BPSK({n}): {w} Hz vs {want} Hz"
            );
        }
        assert!((main_lobe_null_to_null_hz(&l1().modulation) - 2.046e6).abs() < 1e-3);
        let l5 = default_band("gps-l5").unwrap();
        assert!((main_lobe_null_to_null_hz(&l5.modulation) - 20.46e6).abs() < 1e-2);
    }

    // ── ORACLE: sine-BOC(1,1) lobes centred at ±1.023 MHz ────────────────────────
    // Betz 2001: the BOC(m,n) main lobes are centred at ±f_s = ±m·1.023 MHz. For
    // BOC(1,1) the spectrum is T_c sin⁴(y)/y², y = πf/(2R_c): nulls at f = 0 and
    // f = 2R_c = 2.046 MHz, so each main lobe spans [0, 2.046] MHz, centred at 1.023 MHz.
    // Its exact maximum sits lower, where tan y = 2y (y* = 1.16556), at 0.7590 MHz: the
    // lobe is skewed toward the carrier by the 1/f² envelope. Both are pinned.
    #[test]
    fn boc11_lobes_are_centred_at_plus_minus_1_023_mhz() {
        let m = Modulation::BocSin { m: 1.0, n: 1.0 };
        let nulls = psd_nulls_hz(&m, 3.0 * RC);
        assert!(m.psd(0.0) == 0.0, "sine-BOC has a carrier null");
        let first = nulls[0];
        assert!((first - 2.046e6).abs() < 1e-3, "first null {first}");
        let centre = 0.5 * (0.0 + first);
        assert!((centre - 1.023e6).abs() < 1e-3, "lobe centre {centre}");
        // Closed-form maximum: solve tan y = 2y independently by Newton.
        let mut y = 1.2f64;
        for _ in 0..50 {
            let f = y.tan() - 2.0 * y;
            let d = 1.0 / y.cos().powi(2) - 2.0;
            y -= f / d;
        }
        let f_star = 2.0 * y * RC / PI;
        let pk = psd_peak_hz(&m, 3.0 * RC);
        assert!(
            (pk - f_star).abs() < 1.0,
            "peak {pk} vs closed form {f_star}"
        );
        assert!((f_star - 0.7590e6).abs() < 1e3);
        // Symmetric about the carrier.
        assert!((m.psd(pk) - m.psd(-pk)).abs() < 1e-18);
    }

    // ── ORACLE: spectral separation coefficients (Parseval closed forms) ─────────
    // κ = ∫G_s G_i df = ∫R_s(τ) R_i(τ) dτ. With the triangular C/A autocorrelation and
    // the BOC(1,1) autocorrelation (1 − 3|u| to −½ at u = ½, back to 0 at u = 1):
    //   C/A × C/A     = 2/(3R_c)  → −61.86 dB/Hz
    //   BOC × BOC     = 1/(3R_c)  → −64.87 dB/Hz
    //   C/A × BOC(1,1)= 1/(6R_c)  → −67.88 dB/Hz
    // the infinite-bandwidth values behind the published −61.8 / −64.8 / −67.8 dB/Hz
    // (Betz 2001; Hein et al., Inside GNSS 2006). Computed over a ±100 R_c band.
    #[test]
    fn ssc_matches_parseval_closed_forms() {
        let ca = Modulation::BpskR { n: 1.0 };
        let boc = Modulation::BocSin { m: 1.0, n: 1.0 };
        let band = 200.0 * RC;
        let cases = [
            (ca, ca, 2.0 / (3.0 * RC), -61.86),
            (boc, boc, 1.0 / (3.0 * RC), -64.87),
            (ca, boc, 1.0 / (6.0 * RC), -67.88),
        ];
        for (s, i, want, want_db) in cases {
            let k = spectral_separation_coeff_offset(&s, &i, 0.0, band);
            let err_db = (lin_to_db(k) - lin_to_db(want)).abs();
            assert!(
                err_db < 0.02,
                "{} x {}: {} dB vs {} dB",
                s.label(),
                i.label(),
                lin_to_db(k),
                lin_to_db(want)
            );
            assert!((lin_to_db(want) - want_db).abs() < 0.01);
        }
        // The offset form reduces to the existing centred one.
        let a = spectral_separation_coeff_offset(&ca, &boc, 0.0, 24.0 * RC);
        let b = spectral_separation_coeff(&ca, &boc, 24.0 * RC);
        assert!((a / b - 1.0).abs() < 1e-3);
    }

    // ── ORACLE: Kaplan & Hegarty Q values ────────────────────────────────────────
    // Kaplan & Hegarty 3rd ed. §9.4 (anti-jam equation): Q = 1 for a narrowband (CW)
    // jammer at the carrier, Q = 1.5 for a spread-spectrum jammer matched to C/A, and
    // Q ≈ 2 for wideband Gaussian noise. With Q = 1/(R_c κ): a tone at the carrier has
    // κ = G(0) = T_c → Q = 1; matched noise has κ = 2/(3R_c) → Q = 1.5; flat noise over
    // the null-to-null band has κ = 0.9028/(2R_c) → Q = 2.215 (Q = 2 is the idealised
    // all-power-in-band limit).
    #[test]
    fn q_values_match_kaplan_hegarty() {
        let mut b = l1();
        b.rx_bandwidth_hz = 200.0 * RC;
        let mk = |w: Waveform, bw: Option<f64>| {
            JammerCfg {
                name: None,
                waveform: w,
                centre_mhz: 1575.42,
                bandwidth_mhz: bw,
                sweep_period_us: Some(10.0),
                matched_to: Some("gps-l1ca".into()),
                received_power_dbw: Some(-120.0),
                eirp_dbw: None,
                range_m: None,
                rx_gain_dbi: 0.0,
                on_s: 0.0,
                off_s: None,
            }
            .resolve(0, std::slice::from_ref(&b))
            .unwrap()
        };
        let q = |j: &Jammer| q_from_ssc(j.ssc(&b, 0.0, 1.0), RC);
        let q_cw = q(&mk(Waveform::Cw, None));
        let q_matched = q(&mk(Waveform::Matched, None));
        assert!((q_cw - 1.0).abs() < 1e-9, "CW Q {q_cw}");
        assert!((q_matched - 1.5).abs() < 0.01, "matched Q {q_matched}");
        let q_flat = q(&mk(Waveform::Narrowband, Some(2.046)));
        assert!((q_flat - 2.215).abs() < 0.01, "flat Q {q_flat}");
        // A chirp averaged over whole sweeps is the same flat spectrum.
        let q_chirp = q_from_ssc(mk(Waveform::Chirp, Some(2.046)).ssc(&b, 0.0, 10e-6), RC);
        assert!((q_chirp - q_flat).abs() < 1e-6);
    }

    // ── CROSS-CHECK: the jamming kind's chain gives the same J/S and C/N₀ ─────────
    #[test]
    fn agrees_with_the_jamming_kind_chain() {
        let b = l1();
        let j = JammerCfg {
            name: None,
            waveform: Waveform::Narrowband,
            centre_mhz: 1575.42,
            bandwidth_mhz: Some(1.0),
            sweep_period_us: None,
            matched_to: None,
            received_power_dbw: None,
            eirp_dbw: Some(10.0),
            range_m: Some(100_000.0),
            rx_gain_dbi: 0.0,
            on_s: 0.0,
            off_s: None,
        }
        .resolve(0, std::slice::from_ref(&b))
        .unwrap();
        // The jamming kind's hand-computed anchor: 10 dBW at 100 km → J/S 32.105 dB.
        let js = j.js_db(&b);
        let js_k = j_over_s_db(10.0, 0.0, 0.0, 100_000.0, 1575.42e6, -158.5, 0.0);
        assert!((js - js_k).abs() < 1e-12 && (js - 32.105).abs() < 0.01);
        // Received power route agrees with the link route.
        assert!((j.received_power_dbw - b.signal_power_dbw - js).abs() < 1e-9);
        let n0 = noise_density_dbw_per_hz(290.0);
        let cn0 = b.nominal_cn0_dbhz(n0);
        let kappa = j.ssc(&b, 0.0, 1.0);
        let ours = effective_cn0_multi_dbhz(cn0, &[(js, kappa)]);
        let theirs = effective_cn0_dbhz(cn0, js_k, q_from_ssc(kappa, RC), RC);
        assert!((ours - theirs).abs() < 1e-9, "{ours} vs {theirs}");
        // And the jamming kind's nominal C/N0 is this kind's at T_sys = 290 K.
        let theirs_nom = crate::jamming::nominal_cn0_dbhz(-158.5, 0.0, 290.0);
        assert!((cn0 - theirs_nom).abs() < 1e-12);
    }

    #[test]
    fn noise_floor_is_kt0f() {
        // T_ant = T0 ⇒ T_sys = T0·F; kT0 = −203.98 dBW/Hz, +2 dB of noise figure.
        let t = system_temp_k(290.0, 2.0);
        assert!((t - 290.0 * 10f64.powf(0.2)).abs() < 1e-9);
        assert!((noise_density_dbw_per_hz(290.0) + 203.975).abs() < 0.01);
        assert!(
            (noise_density_dbw_per_hz(t) - (noise_density_dbw_per_hz(290.0) + 2.0)).abs() < 1e-9
        );
    }

    #[test]
    fn mboc_is_a_unit_area_one_eleventh_mix() {
        let m = Modulation::Mboc { p: 1.0 / 11.0 };
        let area = integrate_range(-60.0 * RC, 60.0 * RC, 400_000, |f| m.psd(f));
        assert!((area - 1.0).abs() < 0.02, "MBOC area {area}");
        let f = 6.0 * RC;
        let want = (10.0 / 11.0) * Modulation::BocSin { m: 1.0, n: 1.0 }.psd(f)
            + (1.0 / 11.0) * Modulation::BocSin { m: 6.0, n: 1.0 }.psd(f);
        assert!((m.psd(f) - want).abs() < 1e-18);
        assert_eq!(m.label(), "MBOC(6,1,1/11)");
    }

    #[test]
    fn chirp_window_splits_whole_and_partial_sweeps() {
        let j = Jammer {
            name: "c".into(),
            waveform: Waveform::Chirp,
            centre_hz: 1575.42e6,
            bandwidth_hz: 10e6,
            sweep_period_s: 1.0,
            matched: None,
            received_power_dbw: 0.0,
            link: None,
            on_s: 0.0,
            off_s: f64::INFINITY,
        };
        let lo = 1575.42e6 - 5e6;
        // Half a sweep from phase 0 covers only the lower half of the band.
        assert!((j.power_fraction_in(lo, lo + 5e6, 0.0, 0.5) - 1.0).abs() < 1e-12);
        assert!(j.power_fraction_in(lo + 5e6, lo + 10e6, 0.0, 0.5).abs() < 1e-12);
        // 1.5 sweeps: 2/3 uniform plus 1/3 on the lower half ⇒ lower half holds 2/3.
        let lower = j.power_fraction_in(lo, lo + 5e6, 0.0, 1.5);
        assert!((lower - 2.0 / 3.0).abs() < 1e-12, "{lower}");
        // A partial sweep wrapping past the top edge.
        let top = j.power_fraction_in(lo + 7.5e6, lo + 10e6, 0.75, 0.5);
        assert!((top - 0.5).abs() < 1e-12, "{top}");
    }

    #[test]
    fn duty_weights_partial_rows() {
        let mut j = Jammer {
            name: "c".into(),
            waveform: Waveform::Cw,
            centre_hz: 1.0e9,
            bandwidth_hz: 0.0,
            sweep_period_s: 0.0,
            matched: None,
            received_power_dbw: 0.0,
            link: None,
            on_s: 10.25,
            off_s: 20.0,
        };
        assert_eq!(j.duty(9.0, 1.0), 0.0);
        assert!((j.duty(10.0, 1.0) - 0.75).abs() < 1e-12);
        assert_eq!(j.duty(15.0, 1.0), 1.0);
        j.off_s = 19.5;
        assert!((j.duty(19.0, 1.0) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn fft_matches_a_direct_dft() {
        let n = 64;
        let x: Vec<Cf64> = (0..n)
            .map(|k| Cf64::new((0.3 * k as f64).sin(), (0.11 * (k * k) as f64).cos()))
            .collect();
        let mut y = x.clone();
        fft_in_place(&mut y, false);
        for (k, yk) in y.iter().enumerate() {
            let (mut re, mut im) = (0.0, 0.0);
            for (t, xt) in x.iter().enumerate() {
                let a = -2.0 * PI * (k * t) as f64 / n as f64;
                re += xt.re * a.cos() - xt.im * a.sin();
                im += xt.re * a.sin() + xt.im * a.cos();
            }
            assert!((yk.re - re).abs() < 1e-9 && (yk.im - im).abs() < 1e-9);
        }
        fft_in_place(&mut y, true);
        for (a, b) in x.iter().zip(&y) {
            assert!((a.re - b.re / n as f64).abs() < 1e-12);
        }
    }

    #[test]
    fn welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power() {
        use rand::SeedableRng;
        use rand_distr::{Distribution, StandardNormal};
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(3);
        let fs = 1.0e6;
        let n = 1 << 16;
        let sigma2 = 2.0; // complex variance: 1 per component
        let tone_a = 0.5f64; // tone power 0.25
        let f_t = 125_000.0;
        let x: Vec<Cf64> = (0..n)
            .map(|k| {
                let g1: f64 = StandardNormal.sample(&mut rng);
                let g2: f64 = StandardNormal.sample(&mut rng);
                let ph = 2.0 * PI * f_t * k as f64 / fs;
                Cf64::new(g1 + tone_a * ph.cos(), g2 + tone_a * ph.sin())
            })
            .collect();
        let w = welch_psd(&x, fs, 1024, 0.5).unwrap();
        let df = fs / 1024.0;
        let away: Vec<f64> = w
            .freq_hz
            .iter()
            .zip(&w.psd)
            .filter(|(f, _)| (**f - f_t).abs() > 8.0 * df)
            .map(|(_, p)| *p)
            .collect();
        let mean = away.iter().sum::<f64>() / away.len() as f64;
        assert!(
            (mean / (sigma2 / fs) - 1.0).abs() < 0.02,
            "floor {mean} vs {}",
            sigma2 / fs
        );
        // Parseval: the whole estimate integrates to the total power.
        let total: f64 = w.psd.iter().sum::<f64>() * df;
        assert!(
            (total / (sigma2 + tone_a * tone_a) - 1.0).abs() < 0.02,
            "total {total}"
        );
        // The tone sits in its bin.
        let (imax, _) = w
            .psd
            .iter()
            .enumerate()
            .fold((0, 0.0), |a, (i, p)| if *p > a.1 { (i, *p) } else { a });
        assert!((w.freq_hz[imax] - f_t).abs() < df);
        // Hann ENBW = 1.5 bins.
        assert!((w.enbw_hz / df - 1.5).abs() < 1e-9);
    }

    fn demo() -> SpectrumScenario {
        toml::from_str(include_str!("../scenarios/l-band-waterfall-jamming.toml")).unwrap()
    }

    #[test]
    fn synthesised_iq_through_sigmf_reproduces_the_model_spectrum() {
        let scn = demo();
        let (json, _, _) = scn.run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let c = &v["iq"]["comparison"];
        let med = c["median_difference_db"].as_f64().unwrap();
        let ratio = c["integrated_power_ratio"].as_f64().unwrap();
        // The snapshot is dominated by a periodic chirp, whose true spectrum carries
        // lines at the sweep rate, Fresnel ripple and tails past its band edges that the
        // smooth model does not; the median still sits within 1 dB and total power
        // within 2 %.
        assert!(med.abs() < 1.0, "median Welch - model {med} dB");
        assert!((ratio - 1.0).abs() < 0.02, "power ratio {ratio}");
        assert_eq!(v["iq"]["sigmf"]["clipped_components"].as_u64(), Some(0));
    }

    #[test]
    fn noise_like_synthesis_is_unbiased_through_welch() {
        // Thermal floor, signals, a flat jammer and a tone: every density except the tone
        // is drawn per transform bin, so the Welch estimate converges on the model.
        let scn: SpectrumScenario = toml::from_str(
            "kind = \"spectrum\"\n[[jammers]]\nwaveform = \"narrowband\"\ncentre_mhz = 1576.42\n\
             bandwidth_mhz = 3.0\nreceived_power_dbw = -140.0\n[[jammers]]\nwaveform = \"cw\"\n\
             centre_mhz = 1573.0\nreceived_power_dbw = -150.0\n[iq]\ncentre_mhz = 1575.42\n\
             sample_rate_mhz = 8.192\nt_s = 5.0\ndatatype = \"ci16_le\"\n",
        )
        .unwrap();
        let (json, _, _) = scn.run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        let c = &v["iq"]["comparison"];
        let med = c["median_difference_db"].as_f64().unwrap();
        let ratio = c["integrated_power_ratio"].as_f64().unwrap();
        assert!(med.abs() < 0.1, "median {med} dB");
        assert!((ratio - 1.0).abs() < 0.02, "ratio {ratio}");
        assert_eq!(v["iq"]["sigmf"]["datatype"], "ci16_le");
        assert_eq!(v["iq"]["sigmf"]["clipped_components"].as_u64(), Some(0));
    }

    #[test]
    fn demo_scenario_runs_and_denies_l1_while_l5_survives() {
        let scn = demo();
        let (json, summary, svg) = scn.run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert!(summary.contains("spectrum"));
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        let bands = v["timeline"]["bands"].as_array().unwrap();
        let get = |n: &str| bands.iter().find(|b| b["name"] == n).unwrap();
        assert!(get("gps-l1ca")["first_loss_t_s"].is_number());
        assert!(get("gps-l5")["first_loss_t_s"].is_null());
        for cc in v["jamming_kind_cross_check"].as_array().unwrap() {
            assert!(cc["abs_difference_db"].as_f64().unwrap() < 1e-9);
        }
        // No jammer before the first switch-on: the row is at the nominal C/N0.
        let l1 = get("gps-l1ca");
        let nom = v["bands"][0]["nominal_cn0_dbhz"].as_f64().unwrap();
        assert!((l1["cn0_effective_dbhz"][0].as_f64().unwrap() - nom).abs() < 0.01);
        // Every emitted numeric field has a unit.
        let audit = crate::field_schema::audit_document(&v);
        assert!(
            audit.missing.is_empty(),
            "missing units: {:?}",
            audit.missing
        );
        assert!(
            audit.malformed.is_empty(),
            "malformed: {:?}",
            audit.malformed
        );
    }

    #[test]
    fn defaults_run_with_no_jammer() {
        let scn: SpectrumScenario = toml::from_str("kind = \"spectrum\"\n").unwrap();
        let (json, _, _) = scn.run_all().unwrap();
        let v: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["bands"].as_array().unwrap().len(), 5);
        for b in v["timeline"]["bands"].as_array().unwrap() {
            assert!(b["first_loss_t_s"].is_null());
            assert_eq!(b["tracking_fraction"].as_f64(), Some(1.0));
        }
    }

    #[test]
    fn bad_inputs_are_refused() {
        let bad = [
            "kind = \"spectrum\"\n[[bands]]\nname = \"glonass-g1\"\n",
            "kind = \"spectrum\"\n[[jammers]]\nwaveform = \"chirp\"\ncentre_mhz = 1575.42\nbandwidth_mhz = 2\nreceived_power_dbw = -100\n",
            "kind = \"spectrum\"\n[[jammers]]\nwaveform = \"cw\"\ncentre_mhz = 1575.42\n",
            "kind = \"spectrum\"\n[[bands]]\nname = \"gps-l5\"\nmodulation = \"boc11\"\n",
        ];
        for src in bad {
            let scn: SpectrumScenario = toml::from_str(src).unwrap();
            assert!(scn.run_all().is_err(), "should refuse: {src}");
        }
    }
}
