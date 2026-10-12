// SPDX-License-Identifier: AGPL-3.0-only
//! Ground-contact planning: access windows, adaptive coding and modulation (ACM) on each
//! pass, and a multi-satellite, multi-station contact scheduler with conflict resolution.
//!
//! Three layers, each usable on its own:
//!
//! 1. **Access.** Every satellite–station pair's visibility windows come from the apparent
//!    pass predictor the `passes` kind runs ([`crate::passes::predict_passes_apparent`]:
//!    SGP4, the IAU 2006/2000A Earth-fixed frame, ITU-R P.834-9 refraction, light time).
//! 2. **ACM link adaptation.** Along a pass the slant range and elevation change, so the
//!    downlink symbol energy to noise density `Es/N0` changes. [`es_n0_db`] evaluates the
//!    budget (EIRP, free-space loss, a cosecant-law atmospheric loss, other losses, `G/T`,
//!    Boltzmann's constant, symbol rate) and [`select_modcod`] picks the most efficient
//!    DVB-S2 MODCOD whose quasi-error-free threshold, plus an implementation margin, the
//!    link clears. The thresholds and frame parameters are those of ETSI EN 302 307-1
//!    V1.4.1 (2014-11), Table 13 (ideal `Es/N0` for normal 64 800-bit FECFRAMEs, AWGN,
//!    packet error rate 1e-7) and Table 5a (`K_bch`); the spectral efficiency is computed
//!    in closed form, `η = (K_bch − 80) / (64 800 / log2 M + 90)` bit/symbol (80-bit
//!    baseband header, 90-symbol physical-layer header, no pilots), and the table's printed
//!    efficiencies are kept beside it as a transcription check. A constant-coding (CCM)
//!    baseline uses the single MODCOD that closes at the mask elevation and the longest
//!    range, so the ACM gain over it is stated per pass.
//! 3. **Scheduling.** Each pass becomes a candidate contact carrying the data volume ACM
//!    can move in it. A station's antenna serves one satellite at a time and needs a
//!    turnaround (`setup_s`) between contacts; a satellite downlinks to one station at a
//!    time. Each satellite has a backlog and a priority weight; the objective is the
//!    priority-weighted delivered volume, with each satellite's delivery capped at its
//!    backlog. [`schedule_greedy`] is a lazy marginal-value greedy; [`schedule_optimal`]
//!    is an exact branch and bound, run when the candidate set is small enough
//!    ([`EXACT_LIMIT`]), so the greedy's optimality gap is reported rather than assumed.
//!    A chronological first-come baseline is reported beside both.
//!
//! What is not modelled: rain fade statistics (ITU-R P.618), pointing loss along the
//! pass, CCSDS 131.2 SCCC tables, uplink, onboard storage limits and data generation during
//! the window (the backlog is fixed at the start), contact splitting (a contact is taken
//! whole), and antenna slew time beyond the fixed turnaround. The scheduler is MODELLED:
//! its optimality is checked against its own exact solver, not an external tool.

use crate::frames::Geodetic;
use crate::jd2::Jd2;
use crate::orbit::R_EARTH_EQUATORIAL_M;
use crate::passes::{apparent_look_angles, predict_passes_apparent, ApparentOptions, Pass};
use crate::sgp4::{MeanElementSet, SgpOrbit};
use serde::Deserialize;

/// Boltzmann's constant in dBW/(K·Hz): `10·log10(1.380649e-23)`.
pub const BOLTZMANN_DBW_PER_K_HZ: f64 = -228.599_167_741_590_4;

/// Speed of light (m/s).
const C_M_S: f64 = 299_792_458.0;

/// Largest candidate-contact count the exact branch and bound is run on.
pub const EXACT_LIMIT: usize = 26;

/// One DVB-S2 MODCOD: its name, modulation order, `K_bch` (Table 5a, normal frames), the
/// ideal quasi-error-free `Es/N0` (Table 13) and the spectral efficiency Table 13 prints.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Modcod {
    /// Name, e.g. `"QPSK 1/2"`.
    pub name: &'static str,
    /// Bits per modulation symbol, `log2 M`.
    pub bits_per_symbol: u32,
    /// BCH-uncoded block length `K_bch` (bits).
    pub k_bch: u32,
    /// Ideal `Es/N0` (dB) for packet error rate 1e-7 in AWGN.
    pub es_n0_db: f64,
    /// Spectral efficiency (bit/symbol) as printed in Table 13, kept as a check.
    pub table_efficiency: f64,
}

impl Modcod {
    /// Spectral efficiency (bit/symbol), normal frames without pilots:
    /// `(K_bch − 80) / (64 800 / log2 M + 90)`.
    pub fn efficiency(&self) -> f64 {
        (self.k_bch as f64 - 80.0) / (64_800.0 / self.bits_per_symbol as f64 + 90.0)
    }
}

macro_rules! mc {
    ($n:expr, $b:expr, $k:expr, $e:expr, $t:expr) => {
        Modcod {
            name: $n,
            bits_per_symbol: $b,
            k_bch: $k,
            es_n0_db: $e,
            table_efficiency: $t,
        }
    };
}

/// The 28 DVB-S2 MODCODs of ETSI EN 302 307-1 V1.4.1 Table 13 (normal FECFRAME), in the
/// order of increasing threshold.
pub const DVB_S2_MODCODS: &[Modcod] = &[
    mc!("QPSK 1/4", 2, 16_008, -2.35, 0.490_243),
    mc!("QPSK 1/3", 2, 21_408, -1.24, 0.656_448),
    mc!("QPSK 2/5", 2, 25_728, -0.30, 0.789_412),
    mc!("QPSK 1/2", 2, 32_208, 1.00, 0.988_858),
    mc!("QPSK 3/5", 2, 38_688, 2.23, 1.188_304),
    mc!("QPSK 2/3", 2, 43_040, 3.10, 1.322_253),
    mc!("QPSK 3/4", 2, 48_408, 4.03, 1.487_473),
    mc!("QPSK 4/5", 2, 51_648, 4.68, 1.587_196),
    mc!("QPSK 5/6", 2, 53_840, 5.18, 1.654_663),
    mc!("8PSK 3/5", 3, 38_688, 5.50, 1.779_991),
    mc!("QPSK 8/9", 2, 57_472, 6.20, 1.766_451),
    mc!("QPSK 9/10", 2, 58_192, 6.42, 1.788_612),
    mc!("8PSK 2/3", 3, 43_040, 6.62, 1.980_636),
    mc!("8PSK 3/4", 3, 48_408, 7.91, 2.228_124),
    mc!("16APSK 2/3", 4, 43_040, 8.97, 2.637_201),
    mc!("8PSK 5/6", 3, 53_840, 9.35, 2.478_562),
    mc!("16APSK 3/4", 4, 48_408, 10.21, 2.966_728),
    mc!("8PSK 8/9", 3, 57_472, 10.69, 2.646_012),
    mc!("8PSK 9/10", 3, 58_192, 10.98, 2.679_207),
    mc!("16APSK 4/5", 4, 51_648, 11.03, 3.165_623),
    mc!("16APSK 5/6", 4, 53_840, 11.61, 3.300_184),
    mc!("32APSK 3/4", 5, 48_408, 12.73, 3.703_295),
    mc!("16APSK 8/9", 4, 57_472, 12.89, 3.523_143),
    mc!("16APSK 9/10", 4, 58_192, 13.13, 3.567_342),
    mc!("32APSK 4/5", 5, 51_648, 13.64, 3.951_571),
    mc!("32APSK 5/6", 5, 53_840, 14.28, 4.119_540),
    mc!("32APSK 8/9", 5, 57_472, 15.69, 4.397_854),
    mc!("32APSK 9/10", 5, 58_192, 16.05, 4.453_027),
];

/// The most spectrally efficient MODCOD whose threshold plus `margin_db` is at or below
/// `es_n0_db`, or `None` when even the most robust one does not close. Ties in threshold
/// order are resolved by efficiency, so a MODCOD dominated by a cheaper one is never chosen.
pub fn select_modcod(es_n0_db: f64, margin_db: f64) -> Option<&'static Modcod> {
    DVB_S2_MODCODS
        .iter()
        .filter(|m| m.es_n0_db + margin_db <= es_n0_db)
        .max_by(|a, b| a.efficiency().total_cmp(&b.efficiency()))
}

/// Free-space path loss (dB) over `range_m` at `freq_hz`: `20·log10(4π d f / c)`.
pub fn fspl_db(range_m: f64, freq_hz: f64) -> f64 {
    20.0 * (4.0 * std::f64::consts::PI * range_m * freq_hz / C_M_S).log10()
}

/// Cosecant-law slant atmospheric loss (dB) from a zenith loss: `A_z / sin(el)`, with the
/// elevation floored at 3° so the flat-Earth law is not taken below where it holds.
pub fn atmospheric_loss_db(zenith_loss_db: f64, el_rad: f64) -> f64 {
    zenith_loss_db / el_rad.max(3f64.to_radians()).sin()
}

/// The downlink link parameters shared by every satellite (a satellite may override EIRP).
#[derive(Clone, Copy, Debug, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct LinkConfig {
    /// Carrier frequency (GHz).
    #[serde(default = "d_freq")]
    pub frequency_ghz: f64,
    /// Satellite EIRP (dBW), unless a satellite sets its own.
    #[serde(default = "d_eirp")]
    pub eirp_dbw: f64,
    /// Symbol rate (Msymbol/s).
    #[serde(default = "d_rs")]
    pub symbol_rate_msps: f64,
    /// Lumped other losses (dB): polarisation, pointing, implementation in the front end.
    #[serde(default = "d_other")]
    pub other_losses_db: f64,
    /// Zenith atmospheric loss (dB), scaled by the cosecant of the elevation.
    #[serde(default = "d_zen")]
    pub zenith_atm_loss_db: f64,
    /// Margin (dB) kept above each MODCOD's ideal threshold (implementation loss plus ACM
    /// hysteresis).
    #[serde(default = "d_margin")]
    pub implementation_margin_db: f64,
    /// Sample step (s) along a pass for the ACM integration.
    #[serde(default = "d_acm_step")]
    pub acm_step_s: f64,
}

fn d_freq() -> f64 {
    8.2
}
fn d_eirp() -> f64 {
    7.0
}
fn d_rs() -> f64 {
    20.0
}
fn d_other() -> f64 {
    2.0
}
fn d_zen() -> f64 {
    0.3
}
fn d_margin() -> f64 {
    1.0
}
fn d_acm_step() -> f64 {
    10.0
}

impl Default for LinkConfig {
    fn default() -> Self {
        LinkConfig {
            frequency_ghz: d_freq(),
            eirp_dbw: d_eirp(),
            symbol_rate_msps: d_rs(),
            other_losses_db: d_other(),
            zenith_atm_loss_db: d_zen(),
            implementation_margin_db: d_margin(),
            acm_step_s: d_acm_step(),
        }
    }
}

impl LinkConfig {
    fn validate(&self) -> Result<(), String> {
        let pos = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("link.{n} must be finite and positive"))
            }
        };
        let nonneg = |v: f64, n: &str| {
            if v.is_finite() && v >= 0.0 {
                Ok(())
            } else {
                Err(format!("link.{n} must be finite and >= 0"))
            }
        };
        pos(self.frequency_ghz, "frequency_ghz")?;
        pos(self.symbol_rate_msps, "symbol_rate_msps")?;
        pos(self.acm_step_s, "acm_step_s")?;
        nonneg(self.other_losses_db, "other_losses_db")?;
        nonneg(self.zenith_atm_loss_db, "zenith_atm_loss_db")?;
        nonneg(self.implementation_margin_db, "implementation_margin_db")?;
        if !self.eirp_dbw.is_finite() {
            return Err("link.eirp_dbw must be finite".into());
        }
        Ok(())
    }
}

/// Downlink `Es/N0` (dB) at slant range `range_m` and elevation `el_rad`.
pub fn es_n0_db(
    link: &LinkConfig,
    eirp_dbw: f64,
    g_over_t_db: f64,
    range_m: f64,
    el_rad: f64,
) -> f64 {
    eirp_dbw
        - fspl_db(range_m, link.frequency_ghz * 1e9)
        - atmospheric_loss_db(link.zenith_atm_loss_db, el_rad)
        - link.other_losses_db
        + g_over_t_db
        - BOLTZMANN_DBW_PER_K_HZ
        - 10.0 * (link.symbol_rate_msps * 1e6).log10()
}

/// The slant range (m) from a station at the given elevation to a satellite at
/// `sat_alt_m` on a spherical Earth of radius `R_EARTH_EQUATORIAL_M`: the worst-case range
/// a CCM design has to close at the mask.
pub fn slant_range_at_elevation(sat_alt_m: f64, el_rad: f64) -> f64 {
    let re = R_EARTH_EQUATORIAL_M;
    let r = re + sat_alt_m;
    (r * r - (re * el_rad.cos()).powi(2)).sqrt() - re * el_rad.sin()
}

/// A satellite of the scenario: a circular orbit, a backlog and a priority.
#[derive(Clone, Debug, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct SatelliteSpec {
    /// Identifier.
    pub name: String,
    /// Circular-orbit altitude (km).
    pub altitude_km: f64,
    /// Inclination (deg).
    pub inclination_deg: f64,
    /// Right ascension of the ascending node (deg, TEME).
    #[serde(default)]
    pub raan_deg: f64,
    /// Argument of latitude at the window start (deg).
    #[serde(default)]
    pub arg_lat_deg: f64,
    /// Data waiting to be downlinked at the window start (Mbit).
    #[serde(default = "d_backlog")]
    pub backlog_mbit: f64,
    /// Priority weight (> 0) applied to every Mbit this satellite delivers.
    #[serde(default = "d_one")]
    pub priority: f64,
    /// EIRP override (dBW).
    #[serde(default)]
    pub eirp_dbw: Option<f64>,
}

fn d_backlog() -> f64 {
    200_000.0
}
fn d_one() -> f64 {
    1.0
}

/// A ground station: location, mask, receive figure of merit and turnaround.
#[derive(Clone, Debug, Deserialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct StationSpec {
    /// Identifier.
    pub name: String,
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg, east).
    pub lon_deg: f64,
    /// Height (m), within the 0–3 km range of ITU-R P.834.
    #[serde(default)]
    pub alt_m: f64,
    /// Elevation mask (deg).
    #[serde(default = "d_mask")]
    pub mask_deg: f64,
    /// Receive `G/T` (dB/K).
    #[serde(default = "d_gt")]
    pub g_over_t_db: f64,
    /// Antenna turnaround between two contacts (s).
    #[serde(default = "d_setup")]
    pub setup_s: f64,
}

fn d_mask() -> f64 {
    5.0
}
fn d_gt() -> f64 {
    30.0
}
fn d_setup() -> f64 {
    120.0
}

impl SatelliteSpec {
    fn orbit(&self, start: Jd2) -> SgpOrbit {
        let g = crate::sgp4::wgs72();
        let a_er = (R_EARTH_EQUATORIAL_M + self.altitude_km * 1000.0) / 1000.0 / g.radiusearthkm;
        SgpOrbit::new(MeanElementSet {
            epoch_utc: start,
            no_kozai: g.xke / a_er.powf(1.5),
            ecco: 0.0,
            inclo: self.inclination_deg.to_radians(),
            nodeo: self.raan_deg.to_radians().rem_euclid(std::f64::consts::TAU),
            argpo: 0.0,
            mo: self
                .arg_lat_deg
                .to_radians()
                .rem_euclid(std::f64::consts::TAU),
            bstar: 0.0,
        })
    }
}

impl StationSpec {
    fn geodetic(&self) -> Geodetic {
        Geodetic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: self.alt_m,
        }
    }
}

/// The ACM evaluation of one pass.
#[derive(Clone, Debug, PartialEq)]
pub struct PassCapacity {
    /// The pass.
    pub pass: Pass,
    /// Data volume moved with ACM over the whole pass (Mbit).
    pub acm_volume_mbit: f64,
    /// Data volume moved with the CCM baseline MODCOD (Mbit); zero when no MODCOD closes at
    /// the mask.
    pub ccm_volume_mbit: f64,
    /// Minimum and maximum `Es/N0` (dB) along the pass.
    pub es_n0_min_db: f64,
    /// Maximum `Es/N0` (dB) along the pass.
    pub es_n0_max_db: f64,
    /// Time (s) spent on each MODCOD, indexed like [`DVB_S2_MODCODS`]; the time on no
    /// MODCOD (link below the most robust threshold) is in `outage_s`.
    pub modcod_time_s: Vec<f64>,
    /// Time (s) in the pass with no MODCOD closing.
    pub outage_s: f64,
}

/// The CCM baseline: the most efficient MODCOD that closes at the mask elevation and the
/// mask's slant range, or `None`.
pub fn ccm_modcod(
    link: &LinkConfig,
    eirp_dbw: f64,
    station: &StationSpec,
    sat_alt_m: f64,
) -> Option<&'static Modcod> {
    let el = station.mask_deg.to_radians();
    let range = slant_range_at_elevation(sat_alt_m, el);
    select_modcod(
        es_n0_db(link, eirp_dbw, station.g_over_t_db, range, el),
        link.implementation_margin_db,
    )
}

/// Integrate ACM (and the CCM baseline) over one pass, sampling the apparent geometry at
/// `link.acm_step_s` (midpoint rule on each sub-interval).
pub fn pass_capacity(
    link: &LinkConfig,
    eirp_dbw: f64,
    sat: &SgpOrbit,
    sat_alt_m: f64,
    station: &StationSpec,
    start: Jd2,
    pass: &Pass,
    opts: ApparentOptions,
) -> Result<PassCapacity, String> {
    let rs = link.symbol_rate_msps; // Msym/s -> Mbit/s via efficiency
    let ccm = ccm_modcod(link, eirp_dbw, station, sat_alt_m);
    let n = ((pass.duration_s / link.acm_step_s).ceil() as usize).max(1);
    let h = pass.duration_s / n as f64;
    let mut acm = 0.0;
    let mut ccm_v = 0.0;
    let mut emin = f64::INFINITY;
    let mut emax = f64::NEG_INFINITY;
    let mut times = vec![0.0; DVB_S2_MODCODS.len()];
    let mut outage = 0.0;
    for k in 0..n {
        let t = pass.aos_s + (k as f64 + 0.5) * h;
        let look = apparent_look_angles(sat, station.geodetic(), start.add_seconds(t), opts)?;
        let es = es_n0_db(
            link,
            eirp_dbw,
            station.g_over_t_db,
            look.look.range_m,
            look.look.el_rad,
        );
        emin = emin.min(es);
        emax = emax.max(es);
        match select_modcod(es, link.implementation_margin_db) {
            Some(m) => {
                acm += rs * m.efficiency() * h;
                let idx = DVB_S2_MODCODS
                    .iter()
                    .position(|x| x.name == m.name)
                    .unwrap_or(0);
                times[idx] += h;
            }
            None => outage += h,
        }
        if let Some(c) = ccm {
            if es >= c.es_n0_db + link.implementation_margin_db {
                ccm_v += rs * c.efficiency() * h;
            }
        }
    }
    Ok(PassCapacity {
        pass: pass.clone(),
        acm_volume_mbit: acm,
        ccm_volume_mbit: ccm_v,
        es_n0_min_db: emin,
        es_n0_max_db: emax,
        modcod_time_s: times,
        outage_s: outage,
    })
}

/// A candidate contact: one pass of one satellite over one station, with the volume it can
/// carry. Its usable interval is `[start_s, end_s]`; the station is busy until
/// `end_s + setup_s`.
#[derive(Clone, Debug, PartialEq)]
pub struct Candidate {
    /// Satellite index.
    pub sat: usize,
    /// Station index.
    pub station: usize,
    /// Contact start (s from the window start).
    pub start_s: f64,
    /// Contact end (s).
    pub end_s: f64,
    /// Station turnaround after the contact (s).
    pub setup_s: f64,
    /// Volume the contact can carry (Mbit).
    pub capacity_mbit: f64,
    /// Peak elevation (deg).
    pub max_elevation_deg: f64,
}

/// Whether two candidates cannot both be scheduled: same station with overlapping busy
/// intervals (contact plus turnaround), or same satellite with overlapping contacts.
pub fn conflicts(a: &Candidate, b: &Candidate) -> bool {
    if a.station == b.station {
        let a_busy = a.end_s + a.setup_s;
        let b_busy = b.end_s + b.setup_s;
        if a.start_s < b_busy && b.start_s < a_busy {
            return true;
        }
    }
    a.sat == b.sat && a.start_s < b.end_s && b.start_s < a.end_s
}

/// The objective of a selection: `Σ_i priority_i · min(backlog_i, Σ capacity of i's contacts)`.
pub fn objective(cands: &[Candidate], chosen: &[usize], backlog: &[f64], priority: &[f64]) -> f64 {
    delivered(cands, chosen, backlog)
        .iter()
        .zip(priority)
        .map(|(d, w)| d * w)
        .sum()
}

/// Delivered volume per satellite (Mbit) of a selection, each capped at its backlog.
pub fn delivered(cands: &[Candidate], chosen: &[usize], backlog: &[f64]) -> Vec<f64> {
    let mut raw = vec![0.0; backlog.len()];
    for &c in chosen {
        raw[cands[c].sat] += cands[c].capacity_mbit;
    }
    raw.iter().zip(backlog).map(|(r, b)| r.min(*b)).collect()
}

fn feasible_with(cands: &[Candidate], chosen: &[usize], c: usize) -> bool {
    chosen.iter().all(|&o| !conflicts(&cands[o], &cands[c]))
}

/// Chronological first-come baseline: contacts taken in start order whenever they do not
/// conflict and the satellite still has backlog.
pub fn schedule_chronological(cands: &[Candidate], backlog: &[f64]) -> Vec<usize> {
    let mut order: Vec<usize> = (0..cands.len()).collect();
    order.sort_by(|&a, &b| {
        cands[a]
            .start_s
            .total_cmp(&cands[b].start_s)
            .then(a.cmp(&b))
    });
    let mut chosen = Vec::new();
    let mut remaining = backlog.to_vec();
    for c in order {
        if remaining[cands[c].sat] > 0.0 && feasible_with(cands, &chosen, c) {
            remaining[cands[c].sat] -= cands[c].capacity_mbit;
            chosen.push(c);
        }
    }
    chosen.sort_unstable();
    chosen
}

/// Lazy marginal-value greedy: repeatedly take the feasible contact with the largest
/// `priority · min(capacity, remaining backlog)`, ties to the earlier start, until none adds
/// value.
pub fn schedule_greedy(cands: &[Candidate], backlog: &[f64], priority: &[f64]) -> Vec<usize> {
    let mut chosen: Vec<usize> = Vec::new();
    let mut remaining = backlog.to_vec();
    loop {
        let mut best: Option<(usize, f64)> = None;
        for (i, c) in cands.iter().enumerate() {
            if chosen.contains(&i) || !feasible_with(cands, &chosen, i) {
                continue;
            }
            let gain = priority[c.sat] * c.capacity_mbit.min(remaining[c.sat].max(0.0));
            if gain <= 0.0 {
                continue;
            }
            let better = match best {
                None => true,
                Some((j, g)) => gain > g || (gain == g && c.start_s < cands[j].start_s),
            };
            if better {
                best = Some((i, gain));
            }
        }
        match best {
            Some((i, _)) => {
                remaining[cands[i].sat] -= cands[i].capacity_mbit;
                chosen.push(i);
            }
            None => break,
        }
    }
    chosen.sort_unstable();
    chosen
}

/// Exact maximisation of [`objective`] over conflict-free selections by depth-first branch
/// and bound (include/exclude each candidate in start order; the bound adds every remaining
/// candidate's capped value). `None` when there are more than [`EXACT_LIMIT`] candidates.
pub fn schedule_optimal(
    cands: &[Candidate],
    backlog: &[f64],
    priority: &[f64],
) -> Option<(Vec<usize>, f64)> {
    if cands.len() > EXACT_LIMIT {
        return None;
    }
    let mut order: Vec<usize> = (0..cands.len()).collect();
    order.sort_by(|&a, &b| {
        cands[a]
            .start_s
            .total_cmp(&cands[b].start_s)
            .then(a.cmp(&b))
    });
    // Suffix sums of capped standalone values for the bound.
    let val: Vec<f64> = order
        .iter()
        .map(|&i| priority[cands[i].sat] * cands[i].capacity_mbit.min(backlog[cands[i].sat]))
        .collect();
    let mut suffix = vec![0.0; order.len() + 1];
    for k in (0..order.len()).rev() {
        suffix[k] = suffix[k + 1] + val[k];
    }
    struct Bb<'a> {
        cands: &'a [Candidate],
        order: &'a [usize],
        suffix: &'a [f64],
        backlog: &'a [f64],
        priority: &'a [f64],
        best: f64,
        best_set: Vec<usize>,
    }
    fn rec(bb: &mut Bb, k: usize, chosen: &mut Vec<usize>) {
        let cur = objective(bb.cands, chosen, bb.backlog, bb.priority);
        if cur > bb.best + 1e-9 {
            bb.best = cur;
            bb.best_set = chosen.clone();
        }
        if k == bb.order.len() || cur + bb.suffix[k] <= bb.best + 1e-9 {
            return;
        }
        let i = bb.order[k];
        if feasible_with(bb.cands, chosen, i) {
            chosen.push(i);
            rec(bb, k + 1, chosen);
            chosen.pop();
        }
        rec(bb, k + 1, chosen);
    }
    let mut bb = Bb {
        cands,
        order: &order,
        suffix: &suffix,
        backlog,
        priority,
        best: 0.0,
        best_set: Vec::new(),
    };
    rec(&mut bb, 0, &mut Vec::new());
    let mut set = bb.best_set;
    set.sort_unstable();
    Some((set, bb.best))
}

// ---------------------------------------------------------------------------------------
// Scenario kinds
// ---------------------------------------------------------------------------------------

fn d_epoch() -> [f64; 6] {
    [2024.0, 1.0, 1.0, 0.0, 0.0, 0.0]
}
fn d_hours() -> f64 {
    12.0
}
fn d_step() -> f64 {
    30.0
}
fn d_true() -> bool {
    true
}

fn start_jd(e: [f64; 6]) -> Result<Jd2, String> {
    Jd2::from_utc_calendar(
        e[0] as i32,
        e[1] as u32,
        e[2] as u32,
        e[3] as u32,
        e[4] as u32,
        e[5],
    )
}

fn validate_sat(s: &SatelliteSpec) -> Result<(), String> {
    if !(s.altitude_km.is_finite() && s.altitude_km > 100.0 && s.altitude_km < 40_000.0) {
        return Err(format!(
            "satellite '{}': altitude_km must be in (100, 40000)",
            s.name
        ));
    }
    if !(0.0..=180.0).contains(&s.inclination_deg) {
        return Err(format!(
            "satellite '{}': inclination_deg must be in [0, 180]",
            s.name
        ));
    }
    if !(s.backlog_mbit.is_finite() && s.backlog_mbit >= 0.0) {
        return Err(format!("satellite '{}': backlog_mbit must be >= 0", s.name));
    }
    if !(s.priority.is_finite() && s.priority > 0.0) {
        return Err(format!("satellite '{}': priority must be > 0", s.name));
    }
    if let Some(e) = s.eirp_dbw {
        if !e.is_finite() {
            return Err(format!("satellite '{}': eirp_dbw must be finite", s.name));
        }
    }
    Ok(())
}

fn validate_station(s: &StationSpec) -> Result<(), String> {
    if !(-90.0..=90.0).contains(&s.lat_deg) || !s.lon_deg.is_finite() {
        return Err(format!(
            "station '{}': lat_deg in [-90, 90], lon_deg finite",
            s.name
        ));
    }
    if !(0.0..90.0).contains(&s.mask_deg) {
        return Err(format!("station '{}': mask_deg must be in [0, 90)", s.name));
    }
    if !(0.0..=3000.0).contains(&s.alt_m) {
        return Err(format!(
            "station '{}': alt_m must be in [0, 3000] (ITU-R P.834 range)",
            s.name
        ));
    }
    if !(s.setup_s.is_finite() && s.setup_s >= 0.0) || !s.g_over_t_db.is_finite() {
        return Err(format!(
            "station '{}': setup_s >= 0 and g_over_t_db finite",
            s.name
        ));
    }
    Ok(())
}

fn validate_window(hours: f64, step: f64) -> Result<(), String> {
    if !(hours.is_finite() && hours > 0.0 && hours <= 168.0) {
        return Err("duration_hours must be in (0, 168]".into());
    }
    if !(step.is_finite() && step > 0.0 && step <= 300.0) {
        return Err("step_s must be in (0, 300]".into());
    }
    Ok(())
}

fn default_sats() -> Vec<SatelliteSpec> {
    let s = |name: &str, alt, inc, raan, u, backlog, prio| SatelliteSpec {
        name: name.into(),
        altitude_km: alt,
        inclination_deg: inc,
        raan_deg: raan,
        arg_lat_deg: u,
        backlog_mbit: backlog,
        priority: prio,
        eirp_dbw: None,
    };
    vec![
        s("eo-sso-a", 550.0, 97.6, 0.0, 0.0, 400_000.0, 2.0),
        s("eo-sso-b", 550.0, 97.6, 0.0, 180.0, 400_000.0, 1.0),
        s("iot-mid", 700.0, 53.0, 60.0, 90.0, 60_000.0, 1.5),
    ]
}

fn default_stations() -> Vec<StationSpec> {
    let g = |name: &str, lat, lon, alt| StationSpec {
        name: name.into(),
        lat_deg: lat,
        lon_deg: lon,
        alt_m: alt,
        mask_deg: d_mask(),
        g_over_t_db: d_gt(),
        setup_s: d_setup(),
    };
    vec![
        g("polar-north", 78.2, 15.4, 450.0),
        g("mid-latitude", 52.2, 5.0, 10.0),
        g("southern", -33.9, 18.4, 100.0),
    ]
}

/// A computed pass with its ACM figures and the pair it belongs to.
struct PairPass {
    sat: usize,
    station: usize,
    cap: PassCapacity,
    ccm_name: Option<&'static str>,
}

fn compute_pairs(
    sats: &[SatelliteSpec],
    stations: &[StationSpec],
    link: &LinkConfig,
    start: Jd2,
    duration_s: f64,
    step_s: f64,
    opts: ApparentOptions,
) -> Result<Vec<PairPass>, String> {
    let mut out = Vec::new();
    for (i, s) in sats.iter().enumerate() {
        let orbit = s.orbit(start);
        let eirp = s.eirp_dbw.unwrap_or(link.eirp_dbw);
        for (j, g) in stations.iter().enumerate() {
            let passes = predict_passes_apparent(
                &orbit,
                g.geodetic(),
                start,
                duration_s,
                g.mask_deg,
                step_s,
                opts,
            )?;
            let ccm = ccm_modcod(link, eirp, g, s.altitude_km * 1000.0).map(|m| m.name);
            for p in &passes {
                if p.duration_s <= 0.0 {
                    continue;
                }
                let cap = pass_capacity(
                    link,
                    eirp,
                    &orbit,
                    s.altitude_km * 1000.0,
                    g,
                    start,
                    p,
                    opts,
                )?;
                out.push(PairPass {
                    sat: i,
                    station: j,
                    cap,
                    ccm_name: ccm,
                });
            }
        }
    }
    Ok(out)
}

fn apparent_opts(refraction: bool, light_time: bool) -> ApparentOptions {
    ApparentOptions {
        refraction,
        light_time,
        eop: Default::default(),
    }
}

/// The `contact-schedule` scenario: access windows of several satellites over several
/// stations, the ACM data volume of each, and a conflict-free contact plan.
#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ContactScheduleScenario {
    /// Scenario kind tag (`"contact-schedule"`).
    #[serde(default)]
    pub kind: Option<String>,
    /// Window start (UTC) as `[year, month, day, hour, minute, second]`.
    #[serde(default = "d_epoch")]
    pub epoch: [f64; 6],
    /// Planning window (hours).
    #[serde(default = "d_hours")]
    pub duration_hours: f64,
    /// Rise/set search step (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// ITU-R P.834 refraction on the elevation.
    #[serde(default = "d_true")]
    pub refraction: bool,
    /// Downlink light time.
    #[serde(default = "d_true")]
    pub light_time: bool,
    /// Downlink parameters.
    #[serde(default)]
    pub link: LinkConfig,
    /// The satellites.
    #[serde(default = "default_sats")]
    pub satellites: Vec<SatelliteSpec>,
    /// The ground stations.
    #[serde(default = "default_stations")]
    pub stations: Vec<StationSpec>,
}

const CS_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "duration_hours", unit: "h", provenance: Input, definition: "planning window length" },
        FieldUnit { path: "step_s", unit: "s", provenance: Input, definition: "rise/set search sample step; crossings are refined below it" },
        FieldUnit { path: "link.frequency_ghz", unit: "GHz", provenance: Input, definition: "downlink carrier frequency" },
        FieldUnit { path: "link.eirp_dbw", unit: "dBW", provenance: ModelledInput, definition: "satellite effective isotropic radiated power unless a satellite overrides it" },
        FieldUnit { path: "link.symbol_rate_msps", unit: "Msymbol/s", provenance: Input, definition: "downlink symbol rate" },
        FieldUnit { path: "link.other_losses_db", unit: "dB", provenance: ModelledInput, definition: "lumped polarisation, pointing and front-end losses" },
        FieldUnit { path: "link.zenith_atm_loss_db", unit: "dB", provenance: ModelledInput, definition: "zenith atmospheric loss, scaled by the cosecant of the elevation" },
        FieldUnit { path: "link.implementation_margin_db", unit: "dB", provenance: ModelledInput, definition: "margin kept above each MODCOD's ideal Es/N0 threshold" },
        FieldUnit { path: "link.acm_step_s", unit: "s", provenance: Input, definition: "sample step of the ACM integration along a pass" },
        FieldUnit { path: "satellites[].altitude_km", unit: "km", provenance: Input, definition: "circular-orbit altitude" },
        FieldUnit { path: "satellites[].inclination_deg", unit: "deg", provenance: Input, definition: "orbital inclination" },
        FieldUnit { path: "satellites[].backlog_mbit", unit: "Mbit", provenance: Input, definition: "data waiting for downlink at the window start" },
        FieldUnit { path: "satellites[].priority", unit: "1", provenance: Input, definition: "weight applied to each delivered Mbit in the objective" },
        FieldUnit { path: "satellites[].eirp_dbw", unit: "dBW", provenance: Input, definition: "EIRP used for this satellite" },
        FieldUnit { path: "satellites[].access_s", unit: "s", provenance: Computed, definition: "total visibility time over all stations, overlaps counted once per station" },
        FieldUnit { path: "satellites[].acm_capacity_mbit", unit: "Mbit", provenance: Computed, definition: "data volume ACM could move over every pass to every station, before conflicts" },
        FieldUnit { path: "satellites[].delivered_mbit", unit: "Mbit", provenance: Computed, definition: "volume delivered by the greedy plan, capped at the backlog" },
        FieldUnit { path: "satellites[].unmet_mbit", unit: "Mbit", provenance: Computed, definition: "backlog left after the greedy plan" },
        FieldUnit { path: "satellites[].contacts", unit: "count", provenance: Computed, definition: "contacts the greedy plan gives this satellite" },
        FieldUnit { path: "stations[].lat_deg", unit: "deg", provenance: Input, definition: "geodetic latitude" },
        FieldUnit { path: "stations[].lon_deg", unit: "deg", provenance: Input, definition: "east longitude" },
        FieldUnit { path: "stations[].alt_m", unit: "m", provenance: Input, definition: "height above the ellipsoid" },
        FieldUnit { path: "stations[].mask_deg", unit: "deg", provenance: Input, definition: "apparent elevation mask" },
        FieldUnit { path: "stations[].g_over_t_db", unit: "dB/K", provenance: ModelledInput, definition: "receive gain-to-noise-temperature ratio" },
        FieldUnit { path: "stations[].setup_s", unit: "s", provenance: ModelledInput, definition: "antenna turnaround required between two contacts" },
        FieldUnit { path: "stations[].contacts", unit: "count", provenance: Computed, definition: "contacts in the greedy plan at this station" },
        FieldUnit { path: "stations[].busy_s", unit: "s", provenance: Computed, definition: "contact time scheduled at this station" },
        FieldUnit { path: "stations[].utilisation", unit: "1", provenance: Computed, definition: "busy_s over the window length" },
        FieldUnit { path: "candidate_contacts", unit: "count", provenance: Computed, definition: "satellite-station passes with positive duration, before conflict resolution" },
        FieldUnit { path: "conflicting_pairs", unit: "count", provenance: Computed, definition: "pairs of candidate contacts that cannot both be scheduled" },
        FieldUnit { path: "contacts[].start_s", unit: "s", provenance: Computed, definition: "scheduled contact start (AOS) from the window start" },
        FieldUnit { path: "contacts[].end_s", unit: "s", provenance: Computed, definition: "scheduled contact end (LOS) from the window start" },
        FieldUnit { path: "contacts[].max_elevation_deg", unit: "deg", provenance: Computed, definition: "peak apparent elevation of the pass" },
        FieldUnit { path: "contacts[].capacity_mbit", unit: "Mbit", provenance: Computed, definition: "ACM data volume the contact can carry" },
        FieldUnit { path: "plans.greedy.objective", unit: "Mbit", provenance: Computed, definition: "priority-weighted delivered volume of the marginal-value greedy plan (priority is dimensionless)" },
        FieldUnit { path: "plans.greedy.delivered_mbit", unit: "Mbit", provenance: Computed, definition: "total delivered volume of the greedy plan" },
        FieldUnit { path: "plans.greedy.contacts", unit: "count", provenance: Computed, definition: "contacts in the greedy plan" },
        FieldUnit { path: "plans.chronological.objective", unit: "Mbit", provenance: Computed, definition: "priority-weighted delivered volume of the first-come baseline" },
        FieldUnit { path: "plans.chronological.delivered_mbit", unit: "Mbit", provenance: Computed, definition: "total delivered volume of the first-come baseline" },
        FieldUnit { path: "plans.chronological.contacts", unit: "count", provenance: Computed, definition: "contacts in the first-come baseline" },
        FieldUnit { path: "plans.optimal.objective", unit: "Mbit", provenance: Computed, definition: "exact optimum of the objective by branch and bound (null above the size limit)" },
        FieldUnit { path: "plans.optimal.delivered_mbit", unit: "Mbit", provenance: Computed, definition: "total delivered volume of the exact optimum" },
        FieldUnit { path: "plans.optimal.contacts", unit: "count", provenance: Computed, definition: "contacts in the exact optimum" },
        FieldUnit { path: "plans.greedy_optimality_gap", unit: "1", provenance: InternalConsistency, definition: "1 - greedy objective / optimal objective; 0 when the greedy plan is optimal (null above the size limit)" },
        FieldUnit { path: "plans.exact_limit", unit: "count", provenance: Constant, definition: "largest candidate count the exact solver is run on" },
    ]
};

fn plan_json(
    cands: &[Candidate],
    chosen: &[usize],
    backlog: &[f64],
    prio: &[f64],
) -> serde_json::Value {
    let d = delivered(cands, chosen, backlog);
    serde_json::json!({
        "objective": objective(cands, chosen, backlog, prio),
        "delivered_mbit": d.iter().sum::<f64>(),
        "contacts": chosen.len(),
    })
}

impl ContactScheduleScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        validate_window(self.duration_hours, self.step_s)?;
        self.link.validate()?;
        if self.satellites.is_empty() || self.stations.is_empty() {
            return Err("at least one satellite and one station are required".into());
        }
        if self.satellites.len() > 32 || self.stations.len() > 32 {
            return Err("at most 32 satellites and 32 stations".into());
        }
        for s in &self.satellites {
            validate_sat(s)?;
        }
        for g in &self.stations {
            validate_station(g)?;
        }
        let start = start_jd(self.epoch)?;
        let duration_s = self.duration_hours * 3600.0;
        let opts = apparent_opts(self.refraction, self.light_time);
        let pairs = compute_pairs(
            &self.satellites,
            &self.stations,
            &self.link,
            start,
            duration_s,
            self.step_s,
            opts,
        )?;
        let cands: Vec<Candidate> = pairs
            .iter()
            .map(|p| Candidate {
                sat: p.sat,
                station: p.station,
                start_s: p.cap.pass.aos_s,
                end_s: p.cap.pass.los_s,
                setup_s: self.stations[p.station].setup_s,
                capacity_mbit: p.cap.acm_volume_mbit,
                max_elevation_deg: p.cap.pass.max_elevation_deg,
            })
            .collect();
        let backlog: Vec<f64> = self.satellites.iter().map(|s| s.backlog_mbit).collect();
        let prio: Vec<f64> = self.satellites.iter().map(|s| s.priority).collect();
        let mut n_conf = 0usize;
        for a in 0..cands.len() {
            for b in (a + 1)..cands.len() {
                if conflicts(&cands[a], &cands[b]) {
                    n_conf += 1;
                }
            }
        }
        let greedy = schedule_greedy(&cands, &backlog, &prio);
        let chrono = schedule_chronological(&cands, &backlog);
        let optimal = schedule_optimal(&cands, &backlog, &prio);
        let g_obj = objective(&cands, &greedy, &backlog, &prio);
        let d_greedy = delivered(&cands, &greedy, &backlog);

        let sats: Vec<serde_json::Value> = self
            .satellites
            .iter()
            .enumerate()
            .map(|(i, s)| {
                let access: f64 = pairs
                    .iter()
                    .filter(|p| p.sat == i)
                    .map(|p| p.cap.pass.duration_s)
                    .sum();
                let cap: f64 = pairs
                    .iter()
                    .filter(|p| p.sat == i)
                    .map(|p| p.cap.acm_volume_mbit)
                    .sum();
                serde_json::json!({
                    "name": s.name,
                    "altitude_km": s.altitude_km,
                    "inclination_deg": s.inclination_deg,
                    "backlog_mbit": s.backlog_mbit,
                    "priority": s.priority,
                    "eirp_dbw": s.eirp_dbw.unwrap_or(self.link.eirp_dbw),
                    "access_s": access,
                    "acm_capacity_mbit": cap,
                    "delivered_mbit": d_greedy[i],
                    "unmet_mbit": (s.backlog_mbit - d_greedy[i]).max(0.0),
                    "contacts": greedy.iter().filter(|&&c| cands[c].sat == i).count(),
                })
            })
            .collect();
        let stations: Vec<serde_json::Value> = self
            .stations
            .iter()
            .enumerate()
            .map(|(j, g)| {
                let busy: f64 = greedy
                    .iter()
                    .filter(|&&c| cands[c].station == j)
                    .map(|&c| cands[c].end_s - cands[c].start_s)
                    .sum();
                serde_json::json!({
                    "name": g.name,
                    "lat_deg": g.lat_deg,
                    "lon_deg": g.lon_deg,
                    "alt_m": g.alt_m,
                    "mask_deg": g.mask_deg,
                    "g_over_t_db": g.g_over_t_db,
                    "setup_s": g.setup_s,
                    "contacts": greedy.iter().filter(|&&c| cands[c].station == j).count(),
                    "busy_s": busy,
                    "utilisation": busy / duration_s,
                })
            })
            .collect();
        let mut plan_order = greedy.clone();
        plan_order.sort_by(|&a, &b| cands[a].start_s.total_cmp(&cands[b].start_s));
        let contacts: Vec<serde_json::Value> = plan_order
            .iter()
            .map(|&c| {
                let k = &cands[c];
                serde_json::json!({
                    "satellite": self.satellites[k.sat].name,
                    "station": self.stations[k.station].name,
                    "start_s": k.start_s,
                    "end_s": k.end_s,
                    "max_elevation_deg": k.max_elevation_deg,
                    "capacity_mbit": k.capacity_mbit,
                    "ccm_modcod": pairs[c].ccm_name,
                })
            })
            .collect();
        let (opt_json, gap) = match &optimal {
            Some((set, obj)) => (
                plan_json(&cands, set, &backlog, &prio),
                serde_json::json!(if *obj > 0.0 { 1.0 - g_obj / obj } else { 0.0 }),
            ),
            None => (serde_json::Value::Null, serde_json::Value::Null),
        };
        let total_backlog: f64 = backlog.iter().sum();
        let total_del: f64 = d_greedy.iter().sum();
        let json = serde_json::json!({
            "kind": "contact-schedule",
            "label": "MODELLED — multi-satellite, multi-station contact plan: apparent access \
                      windows (SGP4, IAU 2006/2000A, ITU-R P.834 refraction, light time), DVB-S2 \
                      ACM data volume per pass from a clear-sky link budget (ETSI EN 302 307-1 \
                      Table 13 thresholds), and conflict resolution (one satellite per antenna \
                      with turnaround, one station per satellite) by a marginal-value greedy \
                      checked against an exact branch and bound; no rain fade, no onboard \
                      data generation, contacts taken whole",
            "units": crate::field_schema::units_block(CS_UNITS),
            "duration_hours": self.duration_hours,
            "step_s": self.step_s,
            "refraction": self.refraction,
            "light_time": self.light_time,
            "link": {
                "frequency_ghz": self.link.frequency_ghz,
                "eirp_dbw": self.link.eirp_dbw,
                "symbol_rate_msps": self.link.symbol_rate_msps,
                "other_losses_db": self.link.other_losses_db,
                "zenith_atm_loss_db": self.link.zenith_atm_loss_db,
                "implementation_margin_db": self.link.implementation_margin_db,
                "acm_step_s": self.link.acm_step_s,
            },
            "satellites": sats,
            "stations": stations,
            "candidate_contacts": cands.len(),
            "conflicting_pairs": n_conf,
            "contacts": contacts,
            "plans": {
                "greedy": plan_json(&cands, &greedy, &backlog, &prio),
                "chronological": plan_json(&cands, &chrono, &backlog, &prio),
                "optimal": opt_json,
                "greedy_optimality_gap": gap,
                "exact_limit": EXACT_LIMIT,
            },
        });
        let summary = format!(
            "contact-schedule: {} satellites x {} stations over {:.0} h -> {} candidate \
             contacts, {} scheduled; {:.0} of {:.0} Mbit delivered{} (MODELLED)",
            self.satellites.len(),
            self.stations.len(),
            self.duration_hours,
            cands.len(),
            greedy.len(),
            total_del,
            total_backlog,
            match &optimal {
                Some((_, o)) if *o > 0.0 => format!(
                    "; greedy within {:.2}% of optimum",
                    100.0 * (1.0 - g_obj / o)
                ),
                _ => String::new(),
            }
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

fn d_acm_sat() -> SatelliteSpec {
    default_sats().remove(0)
}
fn d_acm_station() -> StationSpec {
    default_stations().remove(1)
}

/// The `acm-link` scenario: one satellite over one station, each pass's `Es/N0` range and
/// the data volume DVB-S2 ACM moves against the constant-coding baseline.
#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AcmLinkScenario {
    /// Scenario kind tag (`"acm-link"`).
    #[serde(default)]
    pub kind: Option<String>,
    /// Window start (UTC).
    #[serde(default = "d_epoch")]
    pub epoch: [f64; 6],
    /// Window (hours).
    #[serde(default = "d_hours")]
    pub duration_hours: f64,
    /// Rise/set search step (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// ITU-R P.834 refraction.
    #[serde(default = "d_true")]
    pub refraction: bool,
    /// Downlink light time.
    #[serde(default = "d_true")]
    pub light_time: bool,
    /// Downlink parameters.
    #[serde(default)]
    pub link: LinkConfig,
    /// The satellite.
    #[serde(default = "d_acm_sat")]
    pub satellite: SatelliteSpec,
    /// The station.
    #[serde(default = "d_acm_station")]
    pub station: StationSpec,
}

const ACM_UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "duration_hours", unit: "h", provenance: Input, definition: "window length" },
        FieldUnit { path: "step_s", unit: "s", provenance: Input, definition: "rise/set search sample step" },
        FieldUnit { path: "link.frequency_ghz", unit: "GHz", provenance: Input, definition: "downlink carrier frequency" },
        FieldUnit { path: "link.eirp_dbw", unit: "dBW", provenance: ModelledInput, definition: "satellite EIRP unless the satellite overrides it" },
        FieldUnit { path: "link.symbol_rate_msps", unit: "Msymbol/s", provenance: Input, definition: "downlink symbol rate" },
        FieldUnit { path: "link.other_losses_db", unit: "dB", provenance: ModelledInput, definition: "lumped polarisation, pointing and front-end losses" },
        FieldUnit { path: "link.zenith_atm_loss_db", unit: "dB", provenance: ModelledInput, definition: "zenith atmospheric loss, cosecant-scaled" },
        FieldUnit { path: "link.implementation_margin_db", unit: "dB", provenance: ModelledInput, definition: "margin kept above each MODCOD's ideal threshold" },
        FieldUnit { path: "link.acm_step_s", unit: "s", provenance: Input, definition: "sample step of the ACM integration along a pass" },
        FieldUnit { path: "altitude_km", unit: "km", provenance: Input, definition: "circular-orbit altitude" },
        FieldUnit { path: "inclination_deg", unit: "deg", provenance: Input, definition: "orbital inclination" },
        FieldUnit { path: "eirp_dbw", unit: "dBW", provenance: Input, definition: "EIRP used for the satellite" },
        FieldUnit { path: "station_lat_deg", unit: "deg", provenance: Input, definition: "station geodetic latitude" },
        FieldUnit { path: "station_lon_deg", unit: "deg", provenance: Input, definition: "station east longitude" },
        FieldUnit { path: "mask_deg", unit: "deg", provenance: Input, definition: "apparent elevation mask" },
        FieldUnit { path: "g_over_t_db", unit: "dB/K", provenance: ModelledInput, definition: "receive G/T" },
        FieldUnit { path: "ccm_es_n0_at_mask_db", unit: "dB", provenance: ClosedForm, definition: "Es/N0 at the mask elevation and the spherical-Earth slant range there, the design point of the CCM baseline" },
        FieldUnit { path: "pass_count", unit: "count", provenance: Computed, definition: "passes in the window" },
        FieldUnit { path: "acm_volume_mbit", unit: "Mbit", provenance: Computed, definition: "data volume ACM moves over all passes" },
        FieldUnit { path: "ccm_volume_mbit", unit: "Mbit", provenance: Computed, definition: "data volume the CCM baseline MODCOD moves over all passes" },
        FieldUnit { path: "acm_gain", unit: "1", provenance: Computed, definition: "ACM volume over CCM volume (null when CCM moves nothing)" },
        FieldUnit { path: "outage_s", unit: "s", provenance: Computed, definition: "pass time with no MODCOD closing" },
        FieldUnit { path: "passes[].aos_s", unit: "s", provenance: Computed, definition: "acquisition of signal from the window start" },
        FieldUnit { path: "passes[].los_s", unit: "s", provenance: Computed, definition: "loss of signal from the window start" },
        FieldUnit { path: "passes[].duration_s", unit: "s", provenance: Computed, definition: "pass duration" },
        FieldUnit { path: "passes[].max_elevation_deg", unit: "deg", provenance: Computed, definition: "peak apparent elevation" },
        FieldUnit { path: "passes[].es_n0_min_db", unit: "dB", provenance: Computed, definition: "lowest Es/N0 sampled along the pass" },
        FieldUnit { path: "passes[].es_n0_max_db", unit: "dB", provenance: Computed, definition: "highest Es/N0 sampled along the pass" },
        FieldUnit { path: "passes[].acm_volume_mbit", unit: "Mbit", provenance: Computed, definition: "ACM data volume of the pass" },
        FieldUnit { path: "passes[].ccm_volume_mbit", unit: "Mbit", provenance: Computed, definition: "CCM baseline data volume of the pass" },
        FieldUnit { path: "passes[].outage_s", unit: "s", provenance: Computed, definition: "time in the pass with no MODCOD closing" },
        FieldUnit { path: "modcod_usage[].time_s", unit: "s", provenance: Computed, definition: "time over all passes spent on this MODCOD" },
        FieldUnit { path: "modcod_usage[].es_n0_threshold_db", unit: "dB", provenance: Published, definition: "ideal quasi-error-free Es/N0 of the MODCOD, ETSI EN 302 307-1 Table 13" },
        FieldUnit { path: "modcod_usage[].efficiency_bit_per_symbol", unit: "bit/symbol", provenance: ClosedForm, definition: "(K_bch - 80) / (64800 / log2 M + 90), normal frames without pilots" },
    ]
};

impl AcmLinkScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        validate_window(self.duration_hours, self.step_s)?;
        self.link.validate()?;
        validate_sat(&self.satellite)?;
        validate_station(&self.station)?;
        let start = start_jd(self.epoch)?;
        let opts = apparent_opts(self.refraction, self.light_time);
        let pairs = compute_pairs(
            std::slice::from_ref(&self.satellite),
            std::slice::from_ref(&self.station),
            &self.link,
            start,
            self.duration_hours * 3600.0,
            self.step_s,
            opts,
        )?;
        let eirp = self.satellite.eirp_dbw.unwrap_or(self.link.eirp_dbw);
        let alt_m = self.satellite.altitude_km * 1000.0;
        let mask = self.station.mask_deg.to_radians();
        let es_mask = es_n0_db(
            &self.link,
            eirp,
            self.station.g_over_t_db,
            slant_range_at_elevation(alt_m, mask),
            mask,
        );
        let ccm = ccm_modcod(&self.link, eirp, &self.station, alt_m);
        let acm: f64 = pairs.iter().map(|p| p.cap.acm_volume_mbit).sum();
        let ccm_v: f64 = pairs.iter().map(|p| p.cap.ccm_volume_mbit).sum();
        let outage: f64 = pairs.iter().map(|p| p.cap.outage_s).sum();
        let mut usage = vec![0.0; DVB_S2_MODCODS.len()];
        for p in &pairs {
            for (u, t) in usage.iter_mut().zip(&p.cap.modcod_time_s) {
                *u += t;
            }
        }
        let modcod_usage: Vec<serde_json::Value> = DVB_S2_MODCODS
            .iter()
            .zip(&usage)
            .filter(|(_, &t)| t > 0.0)
            .map(|(m, &t)| {
                serde_json::json!({
                    "modcod": m.name,
                    "time_s": t,
                    "es_n0_threshold_db": m.es_n0_db,
                    "efficiency_bit_per_symbol": m.efficiency(),
                })
            })
            .collect();
        let passes: Vec<serde_json::Value> = pairs
            .iter()
            .map(|p| {
                serde_json::json!({
                    "aos_s": p.cap.pass.aos_s,
                    "los_s": p.cap.pass.los_s,
                    "duration_s": p.cap.pass.duration_s,
                    "max_elevation_deg": p.cap.pass.max_elevation_deg,
                    "es_n0_min_db": p.cap.es_n0_min_db,
                    "es_n0_max_db": p.cap.es_n0_max_db,
                    "acm_volume_mbit": p.cap.acm_volume_mbit,
                    "ccm_volume_mbit": p.cap.ccm_volume_mbit,
                    "outage_s": p.cap.outage_s,
                })
            })
            .collect();
        let gain = if ccm_v > 0.0 {
            serde_json::json!(acm / ccm_v)
        } else {
            serde_json::Value::Null
        };
        let json = serde_json::json!({
            "kind": "acm-link",
            "label": "MODELLED — DVB-S2 adaptive coding and modulation over the passes of one \
                      satellite at one station: clear-sky Es/N0 along each apparent pass, the most \
                      efficient MODCOD clearing its ETSI EN 302 307-1 Table 13 threshold plus a \
                      margin, against the constant-coding MODCOD that closes at the mask; no rain \
                      fade or pointing loss along the pass",
            "units": crate::field_schema::units_block(ACM_UNITS),
            "duration_hours": self.duration_hours,
            "step_s": self.step_s,
            "link": {
                "frequency_ghz": self.link.frequency_ghz,
                "eirp_dbw": self.link.eirp_dbw,
                "symbol_rate_msps": self.link.symbol_rate_msps,
                "other_losses_db": self.link.other_losses_db,
                "zenith_atm_loss_db": self.link.zenith_atm_loss_db,
                "implementation_margin_db": self.link.implementation_margin_db,
                "acm_step_s": self.link.acm_step_s,
            },
            "satellite": self.satellite.name,
            "station": self.station.name,
            "altitude_km": self.satellite.altitude_km,
            "inclination_deg": self.satellite.inclination_deg,
            "eirp_dbw": eirp,
            "station_lat_deg": self.station.lat_deg,
            "station_lon_deg": self.station.lon_deg,
            "mask_deg": self.station.mask_deg,
            "g_over_t_db": self.station.g_over_t_db,
            "ccm_es_n0_at_mask_db": es_mask,
            "ccm_modcod": ccm.map(|m| m.name),
            "pass_count": pairs.len(),
            "acm_volume_mbit": acm,
            "ccm_volume_mbit": ccm_v,
            "acm_gain": gain,
            "outage_s": outage,
            "passes": passes,
            "modcod_usage": modcod_usage,
        });
        let summary = format!(
            "acm-link: {} pass(es); ACM {:.0} Mbit vs CCM {} {:.0} Mbit{} (MODELLED)",
            pairs.len(),
            acm,
            ccm.map(|m| m.name).unwrap_or("none"),
            ccm_v,
            if ccm_v > 0.0 {
                format!(" -> gain x{:.2}", acm / ccm_v)
            } else {
                String::new()
            }
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn modcod_efficiency_closed_form_matches_the_printed_table() {
        for m in DVB_S2_MODCODS {
            assert!(
                (m.efficiency() - m.table_efficiency).abs() < 1e-6,
                "{}: {} vs table {}",
                m.name,
                m.efficiency(),
                m.table_efficiency
            );
        }
        assert_eq!(DVB_S2_MODCODS.len(), 28);
        // Thresholds are in non-decreasing order.
        for w in DVB_S2_MODCODS.windows(2) {
            assert!(
                w[0].es_n0_db <= w[1].es_n0_db,
                "{} {}",
                w[0].name,
                w[1].name
            );
        }
    }

    #[test]
    fn modcod_selection_is_monotone_and_honours_the_margin() {
        assert!(select_modcod(-3.0, 0.0).is_none());
        assert_eq!(select_modcod(-2.35, 0.0).unwrap().name, "QPSK 1/4");
        assert!(select_modcod(-2.35, 0.5).is_none());
        // Dominated MODCODs are never chosen: at 6.30 dB, QPSK 8/9 (1.766) is below
        // 8PSK 3/5 (1.780), which has the lower threshold.
        assert_eq!(select_modcod(6.30, 0.0).unwrap().name, "8PSK 3/5");
        let mut last = 0.0;
        let mut e = -3.0;
        while e < 20.0 {
            let eff = select_modcod(e, 1.0).map(|m| m.efficiency()).unwrap_or(0.0);
            assert!(eff >= last, "efficiency fell at {e} dB");
            last = eff;
            e += 0.01;
        }
        assert_eq!(select_modcod(30.0, 1.0).unwrap().name, "32APSK 9/10");
    }

    #[test]
    fn link_budget_pieces_have_closed_forms() {
        // FSPL at 1000 km, 8.2 GHz: 20 log10(4 pi d f / c) = 170.724 dB.
        let l = fspl_db(1.0e6, 8.2e9);
        assert!((l - 170.7241).abs() < 1e-3, "{l}");
        // Doubling the range adds 6.0206 dB.
        assert!((fspl_db(2.0e6, 8.2e9) - l - 6.020_599_913).abs() < 1e-9);
        assert!((atmospheric_loss_db(0.3, std::f64::consts::FRAC_PI_2) - 0.3).abs() < 1e-12);
        assert!((atmospheric_loss_db(0.3, 30f64.to_radians()) - 0.6).abs() < 1e-12);
        // Slant range at zenith is the altitude; at the horizon sqrt((Re+h)^2 - Re^2).
        assert!(
            (slant_range_at_elevation(550e3, std::f64::consts::FRAC_PI_2) - 550e3).abs() < 1e-6
        );
        let re = R_EARTH_EQUATORIAL_M;
        let hz = ((re + 550e3).powi(2) - re * re).sqrt();
        assert!((slant_range_at_elevation(550e3, 0.0) - hz).abs() < 1e-6);
        // Es/N0 identity: one dB more EIRP is one dB more Es/N0; doubling Rs costs 3.01 dB.
        let link = LinkConfig::default();
        let a = es_n0_db(&link, 7.0, 30.0, 1.0e6, 0.5);
        let b = es_n0_db(&link, 8.0, 30.0, 1.0e6, 0.5);
        assert!((b - a - 1.0).abs() < 1e-12);
        let link2 = LinkConfig {
            symbol_rate_msps: 40.0,
            ..link
        };
        let c = es_n0_db(&link2, 7.0, 30.0, 1.0e6, 0.5);
        assert!((a - c - 10.0 * 2f64.log10()).abs() < 1e-12);
    }

    fn cand(sat: usize, station: usize, s: f64, e: f64, cap: f64) -> Candidate {
        Candidate {
            sat,
            station,
            start_s: s,
            end_s: e,
            setup_s: 60.0,
            capacity_mbit: cap,
            max_elevation_deg: 45.0,
        }
    }

    #[test]
    fn conflicts_cover_turnaround_and_one_station_per_satellite() {
        let a = cand(0, 0, 0.0, 600.0, 1.0);
        // Same station, starts inside the turnaround: conflict.
        assert!(conflicts(&a, &cand(1, 0, 630.0, 900.0, 1.0)));
        // Same station, after the turnaround: no conflict.
        assert!(!conflicts(&a, &cand(1, 0, 661.0, 900.0, 1.0)));
        // Same satellite at another station overlapping: conflict.
        assert!(conflicts(&a, &cand(0, 1, 500.0, 900.0, 1.0)));
        // Same satellite, another station, after: no conflict (no satellite turnaround).
        assert!(!conflicts(&a, &cand(0, 1, 600.0, 900.0, 1.0)));
        // Different satellite and station: never.
        assert!(!conflicts(&a, &cand(1, 1, 0.0, 600.0, 1.0)));
    }

    #[test]
    fn greedy_is_feasible_and_the_exact_solver_beats_or_ties_it() {
        // A classic greedy trap: one big contact blocks two that together are worth more.
        let cands = vec![
            cand(0, 0, 0.0, 1000.0, 10.0),
            cand(1, 0, 0.0, 450.0, 6.0),
            cand(2, 0, 520.0, 1000.0, 6.0),
        ];
        let backlog = vec![100.0; 3];
        let prio = vec![1.0; 3];
        let g = schedule_greedy(&cands, &backlog, &prio);
        assert_eq!(g, vec![0]);
        let (o, obj) = schedule_optimal(&cands, &backlog, &prio).unwrap();
        assert_eq!(o, vec![1, 2]);
        assert!((obj - 12.0).abs() < 1e-12);
        // Backlog caps the value: satellite 0 only needs 3 Mbit.
        let backlog = vec![3.0, 100.0, 100.0];
        let g = schedule_greedy(&cands, &backlog, &prio);
        assert_eq!(g, vec![1, 2]);
    }

    /// Exhaustive check on pseudo-random small instances: the branch and bound equals the
    /// brute-force optimum, and every plan is conflict-free.
    #[test]
    fn exact_solver_matches_brute_force_and_plans_are_feasible() {
        let mut seed: u64 = 0x5eed_1234;
        let mut rnd = || {
            seed ^= seed << 13;
            seed ^= seed >> 7;
            seed ^= seed << 17;
            (seed >> 11) as f64 / (1u64 << 53) as f64
        };
        for _ in 0..60 {
            let n = 4 + (rnd() * 9.0) as usize;
            let cands: Vec<Candidate> = (0..n)
                .map(|_| {
                    let s = rnd() * 5000.0;
                    cand(
                        (rnd() * 3.0) as usize,
                        (rnd() * 2.0) as usize,
                        s,
                        s + 200.0 + rnd() * 600.0,
                        1.0 + rnd() * 10.0,
                    )
                })
                .collect();
            let backlog: Vec<f64> = (0..3).map(|_| 2.0 + rnd() * 20.0).collect();
            let prio: Vec<f64> = (0..3).map(|_| 0.5 + rnd() * 2.0).collect();
            let mut brute = 0.0f64;
            for mask in 0u32..(1 << n) {
                let set: Vec<usize> = (0..n).filter(|i| mask & (1 << i) != 0).collect();
                let ok = set.iter().enumerate().all(|(k, &a)| {
                    set[k + 1..]
                        .iter()
                        .all(|&b| !conflicts(&cands[a], &cands[b]))
                });
                if ok {
                    brute = brute.max(objective(&cands, &set, &backlog, &prio));
                }
            }
            let (opt, obj) = schedule_optimal(&cands, &backlog, &prio).unwrap();
            assert!((obj - brute).abs() < 1e-9, "B&B {obj} vs brute {brute}");
            for plan in [
                opt,
                schedule_greedy(&cands, &backlog, &prio),
                schedule_chronological(&cands, &backlog),
            ] {
                for (k, &a) in plan.iter().enumerate() {
                    for &b in &plan[k + 1..] {
                        assert!(!conflicts(&cands[a], &cands[b]));
                    }
                }
                assert!(objective(&cands, &plan, &backlog, &prio) <= brute + 1e-9);
            }
        }
    }

    #[test]
    fn exact_solver_declines_above_the_limit() {
        let cands: Vec<Candidate> = (0..EXACT_LIMIT + 1)
            .map(|k| cand(0, 0, k as f64 * 1000.0, k as f64 * 1000.0 + 100.0, 1.0))
            .collect();
        assert!(schedule_optimal(&cands, &[1e9], &[1.0]).is_none());
    }

    #[test]
    fn contact_schedule_defaults_run_reproducibly() {
        let scn: ContactScheduleScenario = toml::from_str("kind = \"contact-schedule\"").unwrap();
        let (j1, s) = scn.run_json().unwrap();
        let (j2, _) = scn.run_json().unwrap();
        assert_eq!(j1, j2);
        assert!(s.contains("MODELLED"));
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "contact-schedule");
        assert!(!j1.contains("VALIDATED"));
        let n = v["candidate_contacts"].as_u64().unwrap();
        assert!(n > 10, "only {n} candidates");
        let g = v["plans"]["greedy"]["objective"].as_f64().unwrap();
        let c = v["plans"]["chronological"]["objective"].as_f64().unwrap();
        assert!(g > 0.0 && c > 0.0);
        if let Some(o) = v["plans"]["optimal"]["objective"].as_f64() {
            assert!(o + 1e-6 >= g && o + 1e-6 >= c);
        }
        // Delivered never exceeds backlog, utilisation within [0, 1].
        for s in v["satellites"].as_array().unwrap() {
            assert!(
                s["delivered_mbit"].as_f64().unwrap() <= s["backlog_mbit"].as_f64().unwrap() + 1e-9
            );
        }
        for g in v["stations"].as_array().unwrap() {
            let u = g["utilisation"].as_f64().unwrap();
            assert!((0.0..=1.0).contains(&u));
        }
    }

    #[test]
    fn acm_link_defaults_run_and_acm_beats_ccm() {
        let scn: AcmLinkScenario = toml::from_str("kind = \"acm-link\"").unwrap();
        let (j, _) = scn.run_json().unwrap();
        let v: serde_json::Value = serde_json::from_str(&j).unwrap();
        assert_eq!(v["kind"], "acm-link");
        assert!(v["pass_count"].as_u64().unwrap() >= 2);
        let acm = v["acm_volume_mbit"].as_f64().unwrap();
        let ccm = v["ccm_volume_mbit"].as_f64().unwrap();
        assert!(ccm > 0.0, "CCM must close at the mask by default");
        // ACM can only add: every sample closes at least the CCM MODCOD.
        assert!(acm >= ccm);
        assert!(v["acm_gain"].as_f64().unwrap() >= 1.0);
        let used: f64 = v["modcod_usage"]
            .as_array()
            .unwrap()
            .iter()
            .map(|m| m["time_s"].as_f64().unwrap())
            .sum::<f64>()
            + v["outage_s"].as_f64().unwrap();
        let dur: f64 = v["passes"]
            .as_array()
            .unwrap()
            .iter()
            .map(|p| p["duration_s"].as_f64().unwrap())
            .sum();
        assert!((used - dur).abs() < 1e-6, "time accounted {used} vs {dur}");
    }

    #[test]
    fn scenarios_reject_bad_inputs() {
        for src in [
            "kind = \"contact-schedule\"\nduration_hours = 0.0",
            "kind = \"contact-schedule\"\nsatellites = []",
            "kind = \"contact-schedule\"\n[link]\nsymbol_rate_msps = -1.0",
            "kind = \"acm-link\"\n[station]\nname = \"x\"\nlat_deg = 95.0\nlon_deg = 0.0",
            "kind = \"acm-link\"\n[satellite]\nname = \"x\"\naltitude_km = 50.0\ninclination_deg = 50.0",
        ] {
            let r = if src.contains("acm-link") {
                toml::from_str::<AcmLinkScenario>(src).map_err(|e| e.to_string()).and_then(|s| s.run_json())
            } else {
                toml::from_str::<ContactScheduleScenario>(src).map_err(|e| e.to_string()).and_then(|s| s.run_json())
            };
            assert!(r.is_err(), "{src} should be rejected");
        }
    }
}
