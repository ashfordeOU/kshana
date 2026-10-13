// SPDX-License-Identifier: AGPL-3.0-only
//! Float precise point positioning (PPP) on real RINEX observations with precise products.
//!
//! Where [`crate::leo_fusion::ppp`] runs a PPP filter on simulated measurements, this module
//! runs one on what a geodetic receiver recorded: dual-frequency GPS code and carrier phase
//! from a RINEX observation file, with the satellite orbits, clocks and antenna offsets of
//! precise products ([`crate::precise_products::PreciseProducts`]).
//!
//! ## Measurement model
//!
//! Per satellite and epoch, the ionosphere-free combinations of code `P_IF` and phase `L_IF`
//! (metres) are modelled as
//!
//! `P_IF = ρ + c·dt_r − c·dt_s + T_h + m_w(ε)·Z_w + d_ant + d_tide + d_shapiro`
//! `L_IF = (same) + λ_NL·w + N`
//!
//! with the geometric range `ρ` from the station marker to the satellite antenna phase centre
//! (Earth rotation during the signal travel removed), the receiver clock `c·dt_r`, the satellite
//! clock `c·dt_s` with its periodic relativistic term, the hydrostatic delay `T_h` (Saastamoinen
//! zenith delay for a standard atmosphere at the station height, Niell hydrostatic mapping), the
//! zenith wet delay `Z_w` (estimated; Niell wet mapping), the receiver antenna correction
//! `d_ant` (antenna height, phase-centre offset and elevation-dependent variation of ANTEX,
//! ionosphere-free combination), the solid Earth tide displacement projected on the line of
//! sight `d_tide` (IERS Conventions 2010 §7.1.1, step 1, degree 2, with the permanent part, so the
//! coordinate is in the conventional tide-free frame), the Shapiro delay, the carrier phase
//! wind-up `w` in cycles (Wu et al., Manuscripta Geodaetica 18, 1993; the scheme of RTKLIB
//! `windupcorr`) on the narrow-lane wavelength `λ_NL = c/(f1+f2)`, and the float ambiguity `N`
//! (metres) of the satellite's arc.
//!
//! ## Filter
//!
//! An extended Kalman filter with the states `[x, y, z, c·dt_r, Z_w, N_1 … N_k]`: a static
//! position, a white-noise receiver clock (re-initialised every epoch), a random-walk zenith wet
//! delay, and one constant ambiguity per satellite arc, created from `P_IF − L_IF` with a large
//! variance and re-created on a cycle slip. Slips are detected from the loss-of-lock indicator,
//! a jump of the geometry-free phase, a departure of the Melbourne-Wübbena combination from its
//! running mean, or a data gap. Measurements are processed one at a time (their noise is
//! diagonal), with an innovation gate. The first epoch is initialised from a code solution
//! ([`crate::pvt::solve_spp`]).
//!
//! ## Not modelled
//!
//! Ocean tide loading, pole tide, satellite antenna phase-centre variations, second-order
//! ionosphere, receiver or satellite code biases beyond what the ionosphere-free clocks absorb,
//! and integer ambiguity resolution (this is float PPP).

use crate::frames::{ecef_to_geodetic, look_angles, Geodetic, Vec3};
use crate::gnss_sim::{niell_hydrostatic, niell_wet};
use crate::precise_products::{body_axes, sun_ecef, PreciseProducts};
use crate::pvt::{sagnac_rotate, solve_spp, SppMeasurement};
use crate::rinex_obs::RinexObs;
use serde::Serialize;
use std::collections::HashMap;

/// Speed of light (m/s).
const C: f64 = 299_792_458.0;
/// GPS L1 and L2 carrier frequencies (Hz).
const F1: f64 = 1_575_420_000.0;
const F2: f64 = 1_227_600_000.0;
/// Earth's gravitational parameter (m³/s²), for the Shapiro delay.
const GM_EARTH: f64 = 3.986_004_418e14;

/// A receiver antenna from ANTEX: per frequency code (`"G01"`, `"G02"`), the phase-centre
/// offset (north, east, up; m) and the azimuth-independent variation (m) tabulated from zenith
/// angle `zen1` to `zen2` in steps of `dzen` (degrees).
#[derive(Clone, Debug, Default)]
pub struct ReceiverAntenna {
    /// Antenna type and radome, as the ANTEX `TYPE / SERIAL NO` field (20 characters, trimmed).
    pub name: String,
    /// First zenith angle of the variation table (deg).
    pub zen1: f64,
    /// Zenith-angle step of the variation table (deg).
    pub dzen: f64,
    /// Per frequency: (offset north/east/up in m, variation in m from `zen1`).
    pub freqs: HashMap<String, ([f64; 3], Vec<f64>)>,
}

impl ReceiverAntenna {
    /// The phase-centre correction (m) to add to the geometric range from the antenna reference
    /// point, for frequency `freq`, a unit line of sight `e_enu` (east, north, up) and an
    /// elevation `el_rad`: `−offset·e + variation(zenith)`. Zero when the frequency is absent.
    pub fn correction(&self, freq: &str, e_enu: [f64; 3], el_rad: f64) -> f64 {
        let Some((off, pcv)) = self.freqs.get(freq) else {
            return 0.0;
        };
        // ANTEX offsets are north, east, up.
        let pco = -(off[0] * e_enu[1] + off[1] * e_enu[0] + off[2] * e_enu[2]);
        let zen = 90.0 - el_rad.to_degrees();
        let pos = ((zen - self.zen1) / self.dzen).max(0.0);
        let i = (pos.floor() as usize).min(pcv.len().saturating_sub(2));
        let f = (pos - i as f64).clamp(0.0, 1.0);
        let var = if pcv.len() >= 2 {
            pcv[i] * (1.0 - f) + pcv[i + 1] * f
        } else {
            0.0
        };
        pco + var
    }
}

/// Parse the receiver antenna `name` (the 20-character ANTEX type-and-radome field, e.g.
/// `"LEIAR25.R3      LEIT"`) from an ANTEX file: offsets and `NOAZI` variation rows (mm → m).
pub fn parse_antex_receiver(text: &str, name: &str) -> Option<ReceiverAntenna> {
    let mut in_block = false;
    let mut ant = ReceiverAntenna::default();
    let mut freq: Option<String> = None;
    let mut found = false;
    for line in text.lines() {
        let label = line.get(60..).unwrap_or("").trim();
        match label {
            "START OF ANTENNA" => {
                in_block = false;
                freq = None;
            }
            "TYPE / SERIAL NO" => {
                in_block = line.get(0..20).map(str::trim) == Some(name.trim())
                    && line.get(20..40).map(str::trim).unwrap_or("").is_empty();
                if in_block {
                    found = true;
                    ant.name = name.trim().to_string();
                }
            }
            "END OF ANTENNA" if in_block => break,
            _ if !in_block => {}
            "ZEN1 / ZEN2 / DZEN" => {
                let v: Vec<f64> = line[..60]
                    .split_whitespace()
                    .filter_map(|s| s.parse().ok())
                    .collect();
                if v.len() == 3 {
                    ant.zen1 = v[0];
                    ant.dzen = v[2];
                }
            }
            "START OF FREQUENCY" => freq = Some(line[3..6].trim().to_string()),
            "END OF FREQUENCY" => freq = None,
            "NORTH / EAST / UP" => {
                let v: Vec<f64> = line[..30]
                    .split_whitespace()
                    .filter_map(|s| s.parse().ok())
                    .collect();
                if let (Some(f), 3) = (&freq, v.len()) {
                    ant.freqs.entry(f.clone()).or_default().0 =
                        [v[0] * 1e-3, v[1] * 1e-3, v[2] * 1e-3];
                }
            }
            _ => {
                if let Some(f) = &freq {
                    if line.get(3..8) == Some("NOAZI") {
                        let v: Vec<f64> = line[8..]
                            .split_whitespace()
                            .filter_map(|s| s.parse::<f64>().ok())
                            .map(|x| x * 1e-3)
                            .collect();
                        ant.freqs.entry(f.clone()).or_default().1 = v;
                    }
                }
            }
        }
    }
    found.then_some(ant)
}

/// The solid Earth tide displacement (ECEF, m) of a station at `r` (ECEF, m), given the Sun and
/// Moon positions (ECEF, m): IERS Conventions (2010) eq. 7.5, degree 2 in-phase with the
/// latitude-dependent Love and Shida numbers `h2 = 0.6078 − 0.0006·(3 sin²φ − 1)/2`,
/// `l2 = 0.0847 + 0.0002·(3 sin²φ − 1)/2`, permanent part included.
pub fn solid_tide_ecef(r: Vec3, sun: Vec3, moon: Vec3) -> Vec3 {
    const GM_SUN: f64 = 1.327_124_400_41e20;
    const GM_MOON: f64 = 4.902_800_066e12;
    const RE: f64 = 6_378_136.6;
    let nr = norm(r);
    let rh = scale(r, 1.0 / nr);
    let sin_phi = rh[2];
    let p2 = (3.0 * sin_phi * sin_phi - 1.0) / 2.0;
    let h2 = 0.6078 - 0.0006 * p2;
    let l2 = 0.0847 + 0.0002 * p2;
    let mut d = [0.0; 3];
    for (body, gm) in [(sun, GM_SUN), (moon, GM_MOON)] {
        let nb = norm(body);
        let bh = scale(body, 1.0 / nb);
        let k = gm / GM_EARTH * RE.powi(4) / nb.powi(3);
        let c = dot(bh, rh);
        let radial = h2 * (1.5 * c * c - 0.5);
        for i in 0..3 {
            d[i] += k * (radial * rh[i] + 3.0 * l2 * c * (bh[i] - c * rh[i]));
        }
    }
    d
}

/// Low-precision Moon position (ECEF, m) at `t` seconds from the GPS epoch (the companion of
/// [`sun_ecef`]): the series of [`crate::ephem::moon_position`] rotated by Greenwich mean
/// sidereal time.
pub fn moon_ecef(t: f64) -> Vec3 {
    let jd = 2_444_244.5 + t / 86_400.0;
    let t_jc = (jd + (19.0 + 32.184) / 86_400.0 - 2_451_545.0) / 36_525.0;
    crate::frames::teme_to_ecef(crate::ephem::moon_position(t_jc), jd)
}

/// The carrier phase wind-up (cycles) for a satellite at `rs` with nominal-yaw body axes under
/// the Sun at `sun`, seen from a receiver at `rr` whose dipole is aligned north/west, continued
/// from the previous value `prev` so the result has no 1-cycle jumps (RTKLIB `windupcorr`).
pub fn phase_windup(rs: Vec3, rr: Vec3, sun: Vec3, prev: f64) -> f64 {
    let ek = unit(sub(rr, rs));
    let (exs, eys, _) = body_axes(rs, sun);
    let g = ecef_to_geodetic(rr);
    let (e, n, _) = enu_axes(g.lat_rad, g.lon_rad);
    let exr = n;
    let eyr = scale(e, -1.0);
    let eks = cross(ek, eys);
    let ekr = cross(ek, eyr);
    let ds = sub(sub(exs, scale(ek, dot(ek, exs))), eks);
    let dr = add(sub(exr, scale(ek, dot(ek, exr))), ekr);
    let cosp = (dot(ds, dr) / norm(ds) / norm(dr)).clamp(-1.0, 1.0);
    let mut ph = cosp.acos() / std::f64::consts::TAU;
    if dot(ek, cross(ds, dr)) < 0.0 {
        ph = -ph;
    }
    ph + (prev - ph + 0.5).floor()
}

/// Configuration of a PPP run.
#[derive(Clone, Debug)]
pub struct PppConfig {
    /// Elevation mask (deg).
    pub mask_deg: f64,
    /// Phase noise at zenith of one frequency (m); the ionosphere-free noise is three times this,
    /// scaled by `1 + 1/sin ε`.
    pub phase_sigma_m: f64,
    /// Code-to-phase noise ratio.
    pub code_phase_ratio: f64,
    /// Random-walk density of the zenith wet delay (m²/s).
    pub zwd_q_m2_s: f64,
    /// Use the carrier phase (false gives a code-only filter with the same models).
    pub use_phase: bool,
    /// The receiver antenna (None: no offset or variation applied).
    pub antenna: Option<ReceiverAntenna>,
    /// Antenna reference point above the marker (up, east, north; m), the RINEX `ANTENNA: DELTA H/E/N`.
    pub arp_une_m: [f64; 3],
    /// Apply the solid Earth tide.
    pub solid_tide: bool,
    /// Apply the phase wind-up.
    pub windup: bool,
    /// The L1 and L2 code and phase observation codes.
    pub codes: [&'static str; 4],
}

impl Default for PppConfig {
    fn default() -> Self {
        Self {
            mask_deg: 10.0,
            phase_sigma_m: 0.003,
            code_phase_ratio: 100.0,
            zwd_q_m2_s: 1e-8,
            use_phase: true,
            antenna: None,
            arp_une_m: [0.0; 3],
            solid_tide: true,
            windup: true,
            codes: ["C1C", "L1C", "C2W", "L2W"],
        }
    }
}

/// One epoch of a PPP run.
#[derive(Clone, Debug, Serialize)]
pub struct PppEpoch {
    /// Seconds from the GPS epoch (GPS time).
    pub t_gps_s: f64,
    /// Estimated marker position (ECEF, m).
    pub pos_ecef_m: [f64; 3],
    /// Estimated zenith total delay (m): the a-priori hydrostatic delay plus the estimated wet delay.
    pub ztd_m: f64,
    /// Receiver clock (m).
    pub clock_m: f64,
    /// Satellites whose measurements were used.
    pub n_sats: usize,
    /// Formal 3-D position standard deviation (m).
    pub sigma_3d_m: f64,
}

/// The outcome of a PPP run.
#[derive(Clone, Debug, Serialize)]
pub struct PppResult {
    /// Per processed epoch.
    pub epochs: Vec<PppEpoch>,
    /// Number of observation epochs offered.
    pub n_offered: usize,
    /// Number of cycle slips (ambiguity re-initialisations after the first).
    pub n_slips: usize,
}

#[derive(Clone, Debug)]
struct Arc {
    idx: usize,
    last_t: f64,
    gf: f64,
    mw_mean: f64,
    mw_n: f64,
    windup: f64,
}

struct Kf {
    x: Vec<f64>,
    p: Vec<Vec<f64>>,
}

impl Kf {
    fn add_state(&mut self, value: f64, var: f64) -> usize {
        let n = self.x.len();
        self.x.push(value);
        for row in &mut self.p {
            row.push(0.0);
        }
        let mut row = vec![0.0; n + 1];
        row[n] = var;
        self.p.push(row);
        n
    }

    fn reset_state(&mut self, i: usize, value: f64, var: f64) {
        self.x[i] = value;
        for k in 0..self.x.len() {
            self.p[i][k] = 0.0;
            self.p[k][i] = 0.0;
        }
        self.p[i][i] = var;
    }

    /// Scalar update with the sparse row `h` (index, coefficient), innovation `v` and noise
    /// variance `r`. Returns false (and does nothing) when the innovation fails the gate.
    fn update(&mut self, h: &[(usize, f64)], v: f64, r: f64, gate: f64) -> bool {
        let n = self.x.len();
        let mut ph = vec![0.0; n];
        for (k, ph_k) in ph.iter_mut().enumerate() {
            *ph_k = h.iter().map(|&(j, c)| self.p[k][j] * c).sum();
        }
        let s: f64 = h.iter().map(|&(j, c)| c * ph[j]).sum::<f64>() + r;
        if v * v > gate * gate * s {
            return false;
        }
        for (x, &phk) in self.x.iter_mut().zip(&ph) {
            *x += phk * v / s;
        }
        for (row, &phi) in self.p.iter_mut().zip(&ph) {
            for (pij, &phj) in row.iter_mut().zip(&ph) {
                *pij -= phi * phj / s;
            }
        }
        true
    }
}

/// Run float PPP over every epoch of `obs` with the products `prod`.
pub fn run_ppp(obs: &RinexObs, prod: &PreciseProducts, cfg: &PppConfig) -> PppResult {
    let (g1, g2) = (F1 * F1, F2 * F2);
    let (a1, a2) = (g1 / (g1 - g2), -g2 / (g1 - g2));
    let lam1 = C / F1;
    let lam2 = C / F2;
    let lam_nl = C / (F1 + F2);
    let lam_wl = C / (F1 - F2);
    let mut kf = Kf {
        x: vec![0.0; 5],
        p: vec![vec![0.0; 5]; 5],
    };
    let mut initialised = false;
    let mut arcs: HashMap<String, Arc> = HashMap::new();
    let mut out = Vec::new();
    let mut n_slips = 0;
    let mut last_t: Option<f64> = None;
    let sig_l = 3.0 * cfg.phase_sigma_m;
    let sig_p = sig_l * cfg.code_phase_ratio;

    for (ei, epoch) in obs.epochs.iter().enumerate() {
        if epoch.flag > 1 {
            continue;
        }
        let t_rx = epoch.time.seconds_from_gps_epoch();
        // Gather the satellite data.
        struct Sv {
            sat: String,
            p_if: f64,
            l_if: f64,
            gf: f64,
            mw: f64,
            lli: bool,
        }
        let mut svs = Vec::new();
        for sv in &epoch.sats {
            if !sv.sat.starts_with('G') {
                continue;
            }
            let get = |code: &str| -> Option<(f64, bool)> {
                let codes = obs.header.codes_for('G')?;
                let k = codes.iter().position(|c| c == code)?;
                let o = sv.obs.get(k)?.as_ref()?;
                (o.value != 0.0).then_some((o.value, o.lli.is_some_and(|f| f & 1 == 1)))
            };
            let (Some((p1, _)), Some((l1, s1)), Some((p2, _)), Some((l2, s2))) = (
                get(cfg.codes[0]),
                get(cfg.codes[1]),
                get(cfg.codes[2]),
                get(cfg.codes[3]),
            ) else {
                continue;
            };
            let (l1m, l2m) = (l1 * lam1, l2 * lam2);
            let mw = (F1 * l1m - F2 * l2m) / (F1 - F2) - (F1 * p1 + F2 * p2) / (F1 + F2);
            svs.push(Sv {
                sat: sv.sat.clone(),
                p_if: a1 * p1 + a2 * p2,
                l_if: a1 * l1m + a2 * l2m,
                gf: l1m - l2m,
                mw: mw / lam_wl,
                lli: s1 || s2,
            });
        }

        // Initialise the position from a code solution.
        if !initialised {
            let mut apriori = obs.header.approx_xyz.unwrap_or([0.0; 3]);
            let mut fix = None;
            for _ in 0..3 {
                let meas: Vec<SppMeasurement> = crate::pvt::assemble_epoch_precise(
                    obs,
                    ei,
                    prod,
                    apriori,
                    &crate::gnss_sim::Meteo::default(),
                    cfg.mask_deg,
                )
                .into_iter()
                .map(|(_, m)| m)
                .collect();
                fix = solve_spp(&meas, apriori);
                match fix {
                    Some(f) => apriori = f.ecef,
                    None => break,
                }
            }
            let Some(f) = fix else { continue };
            kf.x[0..3].copy_from_slice(&f.ecef);
            kf.x[3] = f.clock_bias_m;
            kf.x[4] = 0.1;
            for i in 0..3 {
                kf.p[i][i] = 100.0 * 100.0;
            }
            kf.p[4][4] = 0.3 * 0.3;
            initialised = true;
        }

        // Time update.
        let dt = last_t.map_or(0.0, |t| t_rx - t);
        last_t = Some(t_rx);
        kf.reset_state(3, kf.x[3], 1e10);
        kf.p[4][4] += cfg.zwd_q_m2_s * dt.max(0.0);

        let rr = [kf.x[0], kf.x[1], kf.x[2]];
        let geo = ecef_to_geodetic(rr);
        let (ee, en, eu) = enu_axes(geo.lat_rad, geo.lon_rad);
        let arp = [
            cfg.arp_une_m[0] * eu[0] + cfg.arp_une_m[1] * ee[0] + cfg.arp_une_m[2] * en[0],
            cfg.arp_une_m[0] * eu[1] + cfg.arp_une_m[1] * ee[1] + cfg.arp_une_m[2] * en[1],
            cfg.arp_une_m[0] * eu[2] + cfg.arp_une_m[1] * ee[2] + cfg.arp_une_m[2] * en[2],
        ];
        let sun = sun_ecef(t_rx);
        let tide = if cfg.solid_tide {
            solid_tide_ecef(rr, sun, moon_ecef(t_rx))
        } else {
            [0.0; 3]
        };
        let (zhd, _) = zenith_hydrostatic(geo);
        let doy = day_of_year_from_gps(t_rx);
        let mut used = 0;
        let mut seen = Vec::new();

        for sv in &svs {
            // Satellite state at transmit time.
            let mut t_tx = t_rx - sv.p_if / C;
            let Some(clk0) = prod.clock_s(&sv.sat, t_tx) else {
                continue;
            };
            t_tx -= clk0;
            let Some(st) = prod.state(&sv.sat, t_tx, ("G01", F1), ("G02", F2)) else {
                continue;
            };
            let r_ant = add(add(rr, arp), tide);
            let travel = norm(sub(st.pos_apc, r_ant)) / C;
            let rs = sagnac_rotate(st.pos_apc, travel);
            let look = look_angles(geo_of(r_ant), rs);
            if look.el_rad.to_degrees() < cfg.mask_deg {
                continue;
            }
            let los = sub(rs, r_ant);
            let rho = norm(los);
            let e = scale(los, 1.0 / rho);
            let e_enu = [dot(e, ee), dot(e, en), dot(e, eu)];
            let ant = cfg.antenna.as_ref().map_or(0.0, |a| {
                a1 * a.correction("G01", e_enu, look.el_rad)
                    + a2 * a.correction("G02", e_enu, look.el_rad)
            });
            let shapiro = {
                let (r1, r2) = (norm(rs), norm(r_ant));
                2.0 * GM_EARTH / (C * C) * ((r1 + r2 + rho) / (r1 + r2 - rho)).ln()
            };
            let mh = niell_hydrostatic(look.el_rad, geo.lat_rad, geo.alt_m, doy);
            let mw = niell_wet(look.el_rad, geo.lat_rad);
            let model = rho + kf.x[3] - C * st.clock_s + zhd * mh + mw * kf.x[4] + ant + shapiro;

            // Arc bookkeeping and slip detection.
            let prev = arcs.get(&sv.sat).cloned();
            let slip = match &prev {
                None => true,
                Some(a) => {
                    sv.lli
                        || t_rx - a.last_t > 90.0
                        || (sv.gf - a.gf).abs() > 0.05
                        || (a.mw_n >= 3.0 && (sv.mw - a.mw_mean).abs() > 4.0)
                }
            };
            let wu_prev = prev.as_ref().map_or(0.0, |a| a.windup);
            let wu = if cfg.windup {
                phase_windup(rs, r_ant, sun, wu_prev)
            } else {
                0.0
            };
            let amb_value = sv.l_if - sv.p_if;
            let idx = match (&prev, slip) {
                (Some(a), false) => a.idx,
                (Some(a), true) => {
                    n_slips += 1;
                    kf.reset_state(a.idx, amb_value, 30.0 * 30.0);
                    a.idx
                }
                (None, _) => kf.add_state(amb_value, 30.0 * 30.0),
            };
            let (mw_mean, mw_n) = match (&prev, slip) {
                (Some(a), false) => (
                    a.mw_mean + (sv.mw - a.mw_mean) / (a.mw_n + 1.0),
                    a.mw_n + 1.0,
                ),
                _ => (sv.mw, 1.0),
            };
            arcs.insert(
                sv.sat.clone(),
                Arc {
                    idx,
                    last_t: t_rx,
                    gf: sv.gf,
                    mw_mean,
                    mw_n,
                    windup: wu,
                },
            );
            seen.push(idx);

            let w_el = 1.0 + 1.0 / look.el_rad.sin();
            let h_pos = [(0, -e[0]), (1, -e[1]), (2, -e[2]), (3, 1.0), (4, mw)];
            let mut ok = kf.update(
                &h_pos,
                sv.p_if - model,
                (sig_p * w_el).powi(2),
                if out.len() < 10 { 1e6 } else { 8.0 },
            );
            if cfg.use_phase {
                let model_l = rho + kf.x[3] - C * st.clock_s
                    + zhd * mh
                    + mw * kf.x[4]
                    + ant
                    + shapiro
                    + lam_nl * wu
                    + kf.x[idx];
                // Relinearise the phase row about the state after the code update.
                let rr2 = [kf.x[0], kf.x[1], kf.x[2]];
                let dpos = sub(rr2, rr);
                let model_l = model_l - dot(e, dpos);
                let mut h = h_pos.to_vec();
                h.push((idx, 1.0));
                let v = sv.l_if - model_l;
                if !kf.update(&h, v, (sig_l * w_el).powi(2), 8.0) {
                    // A phase outlier is taken as an undetected slip.
                    n_slips += 1;
                    kf.reset_state(idx, kf.x[idx] + v, 30.0 * 30.0);
                    ok = kf.update(&h, 0.0, (sig_l * w_el).powi(2), 1e6) && ok;
                }
            }
            if ok {
                used += 1;
            }
        }
        // Retire the ambiguities of satellites not seen this epoch is unnecessary: their
        // states are left untouched and re-created on reappearance after a gap.
        let _ = seen;
        if used >= 4 {
            let sigma = (kf.p[0][0] + kf.p[1][1] + kf.p[2][2]).sqrt();
            out.push(PppEpoch {
                t_gps_s: t_rx,
                pos_ecef_m: [kf.x[0], kf.x[1], kf.x[2]],
                ztd_m: zhd + kf.x[4],
                clock_m: kf.x[3],
                n_sats: used,
                sigma_3d_m: sigma,
            });
        }
    }
    PppResult {
        epochs: out,
        n_offered: obs.epochs.len(),
        n_slips,
    }
}

/// Saastamoinen zenith hydrostatic delay (m) for the standard-atmosphere pressure at the
/// station height, `p = 1013.25·(1 − 2.2557e-5·h)^5.2568` hPa; also returns that pressure.
fn zenith_hydrostatic(g: Geodetic) -> (f64, f64) {
    let h = g.alt_m.max(0.0);
    let p = 1013.25 * (1.0 - 2.2557e-5 * h).powf(5.2568);
    let denom = 1.0 - 0.00266 * (2.0 * g.lat_rad).cos() - 0.00028 * (h / 1000.0);
    (0.0022768 * p / denom, p)
}

fn day_of_year_from_gps(t: f64) -> f64 {
    // Days since 1980-01-06 (day 6 of 1980); count whole years.
    let mut days = (t / 86_400.0).floor() as i64 + 5; // day-of-year index from 1980-01-01, 0-based
    let mut year = 1980;
    loop {
        let len = if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
            366
        } else {
            365
        };
        if days < len {
            break;
        }
        days -= len;
        year += 1;
    }
    (days + 1) as f64
}

fn geo_of(r: Vec3) -> Geodetic {
    ecef_to_geodetic(r)
}

/// Local east, north, up unit vectors (ECEF) at geodetic latitude and longitude.
pub fn enu_axes(lat: f64, lon: f64) -> (Vec3, Vec3, Vec3) {
    let (sl, cl) = lat.sin_cos();
    let (so, co) = lon.sin_cos();
    (
        [-so, co, 0.0],
        [-sl * co, -sl * so, cl],
        [cl * co, cl * so, sl],
    )
}

/// The east, north and up components (m) of `est − truth` in the local frame at `truth`.
pub fn enu_error(truth: Vec3, est: Vec3) -> [f64; 3] {
    let d = sub(est, truth);
    let g = ecef_to_geodetic(truth);
    let (e, n, u) = enu_axes(g.lat_rad, g.lon_rad);
    [dot(d, e), dot(d, n), dot(d, u)]
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn scale(a: Vec3, k: f64) -> Vec3 {
    [a[0] * k, a[1] * k, a[2] * k]
}
fn unit(a: Vec3) -> Vec3 {
    scale(a, 1.0 / norm(a))
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn solid_tide_is_decimetre_scale_and_vanishes_without_bodies_far_away() {
        let r = [4_075_580.0, 931_854.0, 4_801_568.0];
        // Moon overhead at its mean distance: the radial displacement is h2·k·(3/2 − 1/2).
        let moon = scale(unit(r), 384_400e3);
        let far = scale(unit(r), 1e30);
        let d = solid_tide_ecef(r, far, moon);
        let up = dot(d, unit(r));
        let k = 4.902_800_066e12 / GM_EARTH * 6_378_136.6f64.powi(4) / 384_400e3f64.powi(3);
        let sin_phi = unit(r)[2];
        let h2 = 0.6078 - 0.0006 * (3.0 * sin_phi * sin_phi - 1.0) / 2.0;
        assert!((up - h2 * k).abs() < 1e-12, "{up}");
        assert!(up > 0.2 && up < 0.3, "{up}");
    }

    #[test]
    fn windup_is_continuous_across_the_branch_cut() {
        let rs = [15_000e3, 10_000e3, 20_000e3];
        let rr = [4_075_580.0, 931_854.0, 4_801_568.0];
        let sun = [1.5e11, 0.0, 0.0];
        let w = phase_windup(rs, rr, sun, 0.0);
        assert!(w.abs() <= 0.5);
        assert!((phase_windup(rs, rr, sun, 7.0) - (w + 7.0)).abs() < 1e-12);
    }

    #[test]
    fn day_of_year_counts_from_the_gps_epoch() {
        assert_eq!(day_of_year_from_gps(0.0), 6.0);
        // 2025-02-24 00:00 GPS is 16 492 days after 1980-01-06.
        let t = crate::rinex::EpochUtc {
            year: 2025,
            month: 2,
            day: 24,
            hour: 0,
            minute: 0,
            second: 0.0,
        }
        .seconds_from_gps_epoch();
        assert_eq!(day_of_year_from_gps(t + 3600.0), 55.0);
    }

    #[test]
    fn receiver_antenna_parses_offsets_and_noazi_rows() {
        let atx = "\
     1.4            M                                       ANTEX VERSION / SYST
                                                            END OF HEADER
                                                            START OF ANTENNA
TEST ANT        NONE                                        TYPE / SERIAL NO
     0.0  90.0   5.0                                        ZEN1 / ZEN2 / DZEN
   G01                                                      START OF FREQUENCY
      1.00      2.00     60.00                              NORTH / EAST / UP
   NOAZI    0.00   -1.00   -2.00   -3.00   -4.00   -5.00   -6.00   -7.00   -8.00   -9.00  -10.00  -11.00  -12.00  -13.00  -14.00  -15.00  -16.00  -17.00  -18.00
   G01                                                      END OF FREQUENCY
                                                            END OF ANTENNA
";
        let a = parse_antex_receiver(atx, "TEST ANT        NONE").expect("found");
        let (off, pcv) = &a.freqs["G01"];
        assert_eq!(*off, [1e-3, 2e-3, 60e-3]);
        assert_eq!(pcv.len(), 19);
        // Zenith: −up offset + 0 variation.
        let c = a.correction("G01", [0.0, 0.0, 1.0], std::f64::consts::FRAC_PI_2);
        assert!((c + 0.060).abs() < 1e-12, "{c}");
        // 7.5 deg zenith angle: variation halfway between −1 and −2 mm.
        let el = (90.0f64 - 7.5).to_radians();
        let c = a.correction("G01", [0.0, 0.0, 0.0], el);
        assert!((c + 1.5e-3).abs() < 1e-12, "{c}");
        assert!(parse_antex_receiver(atx, "OTHER").is_none());
    }
}
