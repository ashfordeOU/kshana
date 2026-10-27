// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-ascent`: the powered ascent from a south-polar surface site to the rendezvous orbit, and the
//! position-velocity covariance it carries back to orbit.
//!
//! **What is modelled.** The navigation error of the ascent stack is the five-state per-axis model of
//! [`crate::lunar_landing`] (`[position, velocity, accelerometer bias, attitude tilt, gyro bias]`, driven by the
//! specific force), run on all three site axes (east, north, up) instead of the two horizontal ones, from the
//! surface state the phase enters with: the entry covariance rotated into the site's frame, plus the IMU
//! terms. A static surface vehicle's velocity prior is small; its position prior is whatever the surface
//! phase left it with. An AFS position fix from the visible relays (standalone, or differential against a
//! reference station, exactly as in the descent, with the clock aided when only three relays are in view) takes
//! a fix at a stated interval; the time-tag error of the fix is `v_h(t) sigma_t` with the horizontal speed
//! rising linearly to the insertion speed. There is no terrain aid in the ascent.
//!
//! What is carried back to orbit is the **navigation** covariance at insertion, a full 6x6 in the Moon-centred
//! inertial frame with the position-velocity correlation of each axis kept. The engine cutoff dispersion
//! (`cutoff_sigma_m_s`) moves where the vehicle actually is and is reported beside it as the insertion
//! dispersion; it is not navigation knowledge and is not carried.
//!
//! The core is [`LunarAscentScenario::run_phase`], a function of `(config, entry state, thread context)`.
//!
//! **Honesty.** MODELLED. Every IMU, alignment, specific-force and cutoff value is ILLUSTRATIVE. The ascent
//! errors are held in the launch site's east-north-up axes: the downrange curvature of the path (some tens of
//! degrees of arc to a polar orbit) is not applied to the covariance, and the tilt coupling is the same on
//! all three axes. The nominal exit state is a stand-in at the site's local vertical at the insertion
//! altitude; only its covariance is the result. Advisory software, not certified navigation equipment.

// Small dense-matrix and per-axis loops read as the maths they implement when indexed; iterator chains would
// hide which index is which.
#![allow(clippy::needless_range_loop)]

use crate::lunar::{
    mci_to_mcmf, selenographic_to_mcmf, Selenographic, LUNAR_SIGMA_URE_M, MOON_GM_M3_S2, R_MOON_M,
};
use crate::lunar_dpnt::LunarDpntScenario;
use crate::lunar_landing::{axis_cov, enu_cofactor, predict, sigma_th, update};
use crate::lunar_phase::{
    age_clock, cov_is_valid, default_ctx, default_entry, epoch_jd, Cov6, Dm, Frame, NavState,
    Timescale,
};
use crate::lunar_service::{topocentric_basis, visible_sat_positions, LunarConstellation};
use crate::lunar_time::{LunarTimeScenario, RATE_BAND_HIGH_US_DAY, RATE_BAND_LOW_US_DAY};
use crate::mission_thread::ThreadCtx;
use serde::Deserialize;
use serde_json::{json, Value};

type Vec3 = [f64; 3];

const LABEL: &str = "MODELLED";
/// The registered kind name, standalone and as a thread phase.
pub const KIND: &str = "lunar-ascent";
const C_LIGHT: f64 = 299_792_458.0;
const NS: usize = 5;

/// The `lunar-ascent` scenario. Every field is optional.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarAscentScenario {
    /// Site selenographic latitude (deg). Default -89.5.
    pub site_lat_deg: Option<f64>,
    /// Site selenographic longitude (deg). Default 0.
    pub site_lon_deg: Option<f64>,
    /// Powered-ascent duration (s). Default 450.
    pub ascent_s: Option<f64>,
    /// Specific force along the ascent (m/s^2). Default 5.
    pub specific_force_m_s2: Option<f64>,
    /// Insertion altitude (km). Default 100.
    pub insertion_altitude_km: Option<f64>,
    /// Accelerometer bias 1-sigma (micro-g). Default 100.
    pub accel_bias_ug: Option<f64>,
    /// Initial attitude alignment 1-sigma (arcmin). Default 3.
    pub align_arcmin: Option<f64>,
    /// Gyro bias 1-sigma (deg/hour). Default 0.01.
    pub gyro_bias_deg_per_hr: Option<f64>,
    /// Surface position prior 1-sigma per axis (m) when run standalone. Default 10.
    pub surface_pos_sigma_m: Option<f64>,
    /// Surface velocity prior 1-sigma per axis (m/s) when run standalone. Default 0.01.
    pub surface_vel_sigma_m_s: Option<f64>,
    /// Engine cutoff velocity dispersion per axis, 1-sigma (m/s); reported, not carried. Default 1.
    pub cutoff_sigma_m_s: Option<f64>,
    /// AFS aiding: `off`, `standalone` (default) or `differential`.
    pub afs_mode: Option<String>,
    /// Relays in the illustrative constellation (3 to 24). Default 8.
    pub n_relays: Option<usize>,
    /// Elevation mask (deg). Default 5.
    pub mask_deg: Option<f64>,
    /// AFS carrier-to-noise density (dB-Hz). Default 35.
    pub afs_cn0_dbhz: Option<f64>,
    /// Signal-in-space user range error, 1-sigma (m), for `standalone`. Default the LNIS nominal 30 m.
    pub sis_ure_m: Option<f64>,
    /// First AFS fix after liftoff (s). Default 60.
    pub afs_first_fix_s: Option<f64>,
    /// Interval between AFS fixes (s). Default 30.
    pub afs_interval_s: Option<f64>,
    /// Reference-station baseline for `differential` (km). Default 10.
    pub baseline_km: Option<f64>,
    /// Lunar time: `off`, `ltc` (default) or `tt`.
    pub lunar_time_mode: Option<String>,
    /// Days since the vehicle clock was last synchronised. Default 3.
    pub time_since_sync_days: Option<f64>,
}

/// A phase's result.
#[derive(Clone, Debug)]
pub struct AscentOut {
    /// The state handed on at insertion: a nominal MCI state and the navigation covariance, the clock aged.
    pub exit: NavState,
    /// The 3-D navigation 1-sigmas over the ascent, `(t_s since liftoff, position m, velocity m/s)`.
    pub series: Vec<(f64, f64, f64)>,
    /// The result document.
    pub report: Value,
    /// One line for the terminal.
    pub summary: String,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum AfsMode {
    Off,
    Standalone,
    Differential,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum TimeMode {
    Off,
    Ltc,
    Tt,
}

struct Resolved {
    lat: f64,
    lon: f64,
    t_end: f64,
    s: f64,
    alt_m: f64,
    sig_ab: f64,
    sig_th0: f64,
    sig_gb: f64,
    cutoff: f64,
    afs: AfsMode,
    n_relays: usize,
    mask_rad: f64,
    sigma_afs_th: f64,
    sis: f64,
    afs_first: f64,
    afs_dt: f64,
    baseline_km: f64,
    time: TimeMode,
    sync_days: f64,
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// What the AFS aid delivers at the site: per-axis fix sigmas (east, north, up) and the bookkeeping.
struct AfsAid {
    sigma: Option<[f64; 3]>,
    relays_visible: usize,
    clock_aided: bool,
    dpnt_range_sigma_m: Option<f64>,
    ltc_offset_us: f64,
    clock_sigma_s: f64,
}

impl LunarAscentScenario {
    fn resolve(&self) -> Result<Resolved, String> {
        let lat = self.site_lat_deg.unwrap_or(-89.5);
        let lon = self.site_lon_deg.unwrap_or(0.0);
        if !((-90.0..=90.0).contains(&lat) && (-180.0..=360.0).contains(&lon)) {
            return Err(crate::terr!("e-lunar-ascent-site-latitude-must-be-in"));
        }
        let t_end = self.ascent_s.unwrap_or(450.0);
        if !(120.0..=1800.0).contains(&t_end) {
            return Err(crate::terr!("e-lunar-ascent-ascent-must-be-in-120"));
        }
        let pos = |v: Option<f64>, d: f64, name: &str| -> Result<f64, String> {
            let x = v.unwrap_or(d);
            if x.is_finite() && x >= 0.0 {
                Ok(x)
            } else {
                Err(crate::terr!(
                    "e-nma-budget-must-be-finite-and-non",
                    name = name
                ))
            }
        };
        let afs = match self.afs_mode.as_deref().unwrap_or("standalone") {
            "off" => AfsMode::Off,
            "standalone" => AfsMode::Standalone,
            "differential" => AfsMode::Differential,
            o => return Err(crate::terr!("e-lunar-ascent-afs-mode-must-be-off", o = o)),
        };
        let time = match self.lunar_time_mode.as_deref().unwrap_or("ltc") {
            "off" => TimeMode::Off,
            "ltc" => TimeMode::Ltc,
            "tt" => TimeMode::Tt,
            o => {
                return Err(crate::terr!(
                    "e-lunar-ascent-lunar-time-mode-must-be",
                    o = o
                ))
            }
        };
        let n_relays = self.n_relays.unwrap_or(8);
        if !(3..=24).contains(&n_relays) {
            return Err(crate::terr!("e-lunar-ascent-relays-must-be-in-24"));
        }
        let afs_dt = self.afs_interval_s.unwrap_or(30.0);
        let afs_first = self.afs_first_fix_s.unwrap_or(60.0);
        if !(afs_dt > 0.0 && afs_first >= 0.0) {
            return Err(crate::terr!("e-lunar-ascent-afs-interval-must-be-positive"));
        }
        let alt_km = pos(self.insertion_altitude_km, 100.0, "insertion_altitude_km")?;
        if !(10.0..=1000.0).contains(&alt_km) {
            return Err(crate::terr!("e-lunar-ascent-insertion-altitude-km-must-be"));
        }
        Ok(Resolved {
            lat,
            lon,
            t_end,
            s: pos(self.specific_force_m_s2, 5.0, "specific_force_m_s2")?,
            alt_m: alt_km * 1000.0,
            sig_ab: pos(self.accel_bias_ug, 100.0, "accel_bias_ug")? * 9.806_65e-6,
            sig_th0: pos(self.align_arcmin, 3.0, "align_arcmin")? / 60.0 * std::f64::consts::PI
                / 180.0,
            sig_gb: pos(self.gyro_bias_deg_per_hr, 0.01, "gyro_bias_deg_per_hr")?
                * std::f64::consts::PI
                / 180.0
                / 3600.0,
            cutoff: pos(self.cutoff_sigma_m_s, 1.0, "cutoff_sigma_m_s")?,
            afs,
            n_relays,
            mask_rad: pos(self.mask_deg, 5.0, "mask_deg")?.to_radians(),
            sigma_afs_th: sigma_th(pos(self.afs_cn0_dbhz, 35.0, "afs_cn0_dbhz")?),
            sis: pos(self.sis_ure_m, LUNAR_SIGMA_URE_M, "sis_ure_m")?,
            afs_first,
            afs_dt,
            baseline_km: pos(self.baseline_km, 10.0, "baseline_km")?,
            time,
            sync_days: pos(self.time_since_sync_days, 3.0, "time_since_sync_days")?,
        })
    }

    /// The entry state a standalone run starts from: a static surface vehicle with the scenario's own prior.
    pub fn standalone_entry(&self) -> NavState {
        let mut c = default_entry();
        c.p = crate::lunar_phase::diag6(
            self.surface_pos_sigma_m.unwrap_or(10.0),
            self.surface_vel_sigma_m_s.unwrap_or(0.01),
        );
        c
    }

    /// The ENU basis of the site in MCI at a mission time (the lunar axes are aligned at the thread's epoch).
    fn basis_mci(&self, cfg: &Resolved, seconds: f64) -> [Vec3; 3] {
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: cfg.lat.to_radians(),
            lon_rad: cfg.lon.to_radians(),
            alt_m: 0.0,
        });
        let (e, n, u) = topocentric_basis(site);
        let img = [
            mci_to_mcmf([1.0, 0.0, 0.0], seconds),
            mci_to_mcmf([0.0, 1.0, 0.0], seconds),
            mci_to_mcmf([0.0, 0.0, 1.0], seconds),
        ];
        let to_mci = |v: Vec3| -> Vec3 { [dot(v, img[0]), dot(v, img[1]), dot(v, img[2])] };
        [to_mci(e), to_mci(n), to_mci(u)]
    }

    /// The clock 1-sigma at the fixes and the LTC-TT offset, as in the descent.
    fn clock_sigma_s(&self, cfg: &Resolved, entry: &NavState) -> (f64, f64) {
        let ltc_us = LunarTimeScenario {
            horizon_days: cfg.sync_days,
            ..Default::default()
        }
        .run()
        .offset_at_horizon_us;
        let age_s = cfg.sync_days * 86_400.0;
        let drift_sigma = entry.clock.cov[1][1].max(0.0).sqrt();
        let base = entry.clock.cov[0][0].max(0.0) + (drift_sigma * age_s).powi(2);
        let extra = match cfg.time {
            TimeMode::Off => return (0.0, ltc_us),
            TimeMode::Tt => (ltc_us.abs() * 1e-6).powi(2),
            TimeMode::Ltc => {
                let sig = (RATE_BAND_HIGH_US_DAY - RATE_BAND_LOW_US_DAY) / 12f64.sqrt();
                (sig * cfg.sync_days * 1e-6).powi(2)
            }
        };
        ((base + extra).sqrt(), ltc_us)
    }

    fn afs_aid(&self, cfg: &Resolved, entry: &NavState) -> AfsAid {
        let (clock_sigma_s, ltc_offset_us) = self.clock_sigma_s(cfg, entry);
        let mut out = AfsAid {
            sigma: None,
            relays_visible: 0,
            clock_aided: false,
            dpnt_range_sigma_m: None,
            ltc_offset_us,
            clock_sigma_s,
        };
        if cfg.afs == AfsMode::Off {
            return out;
        }
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: cfg.lat.to_radians(),
            lon_rad: cfg.lon.to_radians(),
            alt_m: 0.0,
        });
        let relays = LunarConstellation::illustrative_lcns(cfg.n_relays).positions_mcmf(entry.t_s);
        let vis = visible_sat_positions(site, &relays, cfg.mask_rad);
        out.relays_visible = vis.len();
        let range_sigma = match cfg.afs {
            AfsMode::Differential => {
                let d = LunarDpntScenario {
                    ref_lat_deg: cfg.lat,
                    ref_lon_deg: cfg.lon,
                    baseline_km: cfg.baseline_km,
                    ..Default::default()
                }
                .run();
                let r = d.correction_link.total_with_residual_range_sigma_m;
                out.dpnt_range_sigma_m = Some(r);
                (r * r + cfg.sigma_afs_th * cfg.sigma_afs_th).sqrt()
            }
            _ => (cfg.sis * cfg.sis + cfg.sigma_afs_th * cfg.sigma_afs_th).sqrt(),
        };
        if let Some((q, w)) = enu_cofactor(site, &vis) {
            let mut var = [
                q.at(0, 0) * range_sigma * range_sigma,
                q.at(1, 1) * range_sigma * range_sigma,
                q.at(2, 2) * range_sigma * range_sigma,
            ];
            if let Some(w) = w {
                out.clock_aided = true;
                let cs = C_LIGHT * clock_sigma_s;
                for (v, wi) in var.iter_mut().zip(w) {
                    *v += (cs * wi).powi(2);
                }
            }
            out.sigma = Some([var[0].sqrt(), var[1].sqrt(), var[2].sqrt()]);
        }
        out
    }

    /// The per-axis fixes `(time, variance)` for the AFS aid, with the time-tag term.
    fn fixes(
        &self,
        cfg: &Resolved,
        aid: &AfsAid,
        use_afs: bool,
        v_end: f64,
    ) -> [Vec<(f64, f64)>; 3] {
        let mut out: [Vec<(f64, f64)>; 3] = [Vec::new(), Vec::new(), Vec::new()];
        if let (true, Some(sig)) = (use_afs, aid.sigma) {
            let mut t = cfg.afs_first;
            while t < cfg.t_end {
                let tt = (v_end * (t / cfg.t_end) * aid.clock_sigma_s).powi(2);
                for k in 0..3 {
                    out[k].push((t, sig[k] * sig[k] + tt));
                }
                t += cfg.afs_dt;
            }
        }
        out
    }

    fn prior(&self, cfg: &Resolved, sp: f64, sv: f64) -> Dm {
        let mut p = Dm::zeros(NS, NS);
        p.set(0, 0, sp * sp);
        p.set(1, 1, sv * sv);
        p.set(2, 2, cfg.sig_ab * cfg.sig_ab);
        p.set(3, 3, cfg.sig_th0 * cfg.sig_th0);
        p.set(4, 4, cfg.sig_gb * cfg.sig_gb);
        p
    }

    /// The phase core.
    pub fn run_phase(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<AscentOut, String> {
        let cfg = self.resolve()?;
        if entry.frame != Frame::Mci {
            return Err(crate::terr!(
                "e-lunar-ascent-expects-entry-covariance-in-mci"
            ));
        }
        if !cov_is_valid(&entry.p) {
            return Err(crate::terr!(
                "e-lunar-ascent-entry-covariance-is-not-symmetric"
            ));
        }
        if !matches!(entry.clock.timescale, Timescale::Ltc | Timescale::Tt) {
            return Err(crate::terr!(
                "e-lunar-ascent-lunar-ascent-expects-the-entry",
                timescale = format!("{:?}", entry.clock.timescale)
            ));
        }
        let _ = epoch_jd(ctx, entry.t_s)?;
        // Entry covariance into the site's ENU axes: position and velocity variance per axis, and the
        // per-axis position-velocity covariance, from the MCI blocks.
        let b0 = self.basis_mci(&cfg, entry.t_s);
        let quad = |b: Vec3, r0: usize, c0: usize| -> f64 {
            let mut s = 0.0;
            for i in 0..3 {
                for j in 0..3 {
                    s += b[i] * entry.p[r0 + i][c0 + j] * b[j];
                }
            }
            s
        };
        let mut priors: Vec<Dm> = Vec::new();
        for b in &b0 {
            let mut p = self.prior(
                &cfg,
                quad(*b, 0, 0).max(0.0).sqrt(),
                quad(*b, 3, 3).max(0.0).sqrt(),
            );
            let pv = quad(*b, 0, 3);
            p.set(0, 1, pv);
            p.set(1, 0, pv);
            priors.push(p);
        }
        let v_end = (MOON_GM_M3_S2 / (R_MOON_M + cfg.alt_m)).sqrt();
        let aid = self.afs_aid(&cfg, entry);
        let fx_all = self.fixes(&cfg, &aid, true, v_end);
        let fx_none = self.fixes(&cfg, &aid, false, v_end);
        let cov_at_end = |fx: &[Vec<(f64, f64)>; 3]| -> Vec<Dm> {
            (0..3)
                .map(|k| axis_cov(&priors[k], cfg.s, cfg.t_end, &fx[k]))
                .collect()
        };
        let p_all = cov_at_end(&fx_all);
        let p_none = cov_at_end(&fx_none);
        let sig3 = |ps: &[Dm], idx: usize| -> f64 {
            (0..3)
                .map(|k| ps[k].at(idx, idx))
                .sum::<f64>()
                .max(0.0)
                .sqrt()
        };

        // Series of the 3-D navigation 1-sigmas, every 10 s, each fix applied at its own time.
        let per_axis: Vec<Vec<(f64, f64, f64)>> = (0..3)
            .map(|k| axis_series(&priors[k], cfg.s, cfg.t_end, &fx_all[k], 10.0))
            .collect();
        let series: Vec<(f64, f64, f64)> = (0..per_axis[0].len())
            .map(|i| {
                let pv: f64 = (0..3).map(|k| per_axis[k][i].1).sum();
                let vv: f64 = (0..3).map(|k| per_axis[k][i].2).sum();
                (per_axis[0][i].0, pv.max(0.0).sqrt(), vv.max(0.0).sqrt())
            })
            .collect();

        // The covariance at insertion in MCI, rotated back with the basis at that time.
        let t_exit = entry.t_s + cfg.t_end;
        let b1 = self.basis_mci(&cfg, t_exit);
        let mut cov: Cov6 = [[0.0; 6]; 6];
        for (k, b) in b1.iter().enumerate() {
            let (pp, pv, vv) = (p_all[k].at(0, 0), p_all[k].at(0, 1), p_all[k].at(1, 1));
            for i in 0..3 {
                for j in 0..3 {
                    cov[i][j] += b[i] * pp * b[j];
                    cov[i][3 + j] += b[i] * pv * b[j];
                    cov[3 + i][j] += b[i] * pv * b[j];
                    cov[3 + i][3 + j] += b[i] * vv * b[j];
                }
            }
        }
        // The nominal insertion state: the site's local vertical at the insertion altitude, moving at the
        // circular speed towards the north of the site plus the Moon's turning; a stand-in, only the
        // covariance is the result.
        let r_ins = R_MOON_M + cfg.alt_m;
        let up = b1[2];
        let north = b1[1];
        let omega = std::f64::consts::TAU / crate::lunar::LUNAR_SIDEREAL_DAY_S;
        let pos = [r_ins * up[0], r_ins * up[1], r_ins * up[2]];
        let vel = [
            v_end * north[0] - omega * pos[1],
            v_end * north[1] + omega * pos[0],
            v_end * north[2],
        ];
        let mut exit = entry.clone();
        exit.t_s = t_exit;
        exit.x = [pos[0], pos[1], pos[2], vel[0], vel[1], vel[2]];
        exit.p = cov;
        exit.clock = age_clock(&entry.clock, cfg.t_end);

        let pos3 = sig3(&p_all, 0);
        let vel3 = sig3(&p_all, 1);
        let disp_vel3 = (vel3 * vel3 + 3.0 * cfg.cutoff * cfg.cutoff).sqrt();
        let axes = ["east", "north", "up"];
        let t = cfg.t_end;
        let sources: Vec<Value> = [
            ("surface position prior", priors[0].at(0, 0).sqrt()),
            (
                "surface velocity prior over the ascent",
                priors[0].at(1, 1).sqrt() * t,
            ),
            ("accelerometer bias", cfg.sig_ab * t * t / 2.0),
            (
                "initial attitude through the specific force",
                cfg.s * cfg.sig_th0 * t * t / 2.0,
            ),
            (
                "gyro bias through the specific force",
                cfg.s * cfg.sig_gb * t * t * t / 6.0,
            ),
        ]
        .iter()
        .map(|(n, s)| json!({ "source": n, "sigma_m": s }))
        .collect();
        let mut report = json!({
            "kind": KIND,
            "label": LABEL,
            "advisory": "Advisory software, not certified navigation equipment. MODELLED: illustrative IMU class, specific force, relay set and cutoff dispersion; not an ascent-accuracy prediction for any vehicle.",
            "site": { "lat_deg": cfg.lat, "lon_deg": cfg.lon },
            "ascent_s": cfg.t_end,
            "insertion_altitude_km": cfg.alt_m / 1000.0,
            "insertion_speed_m_s": v_end,
            "afs_mode": self.afs_mode.as_deref().unwrap_or("standalone"),
            "lunar_time_mode": self.lunar_time_mode.as_deref().unwrap_or("ltc"),
            "aids_available": aid.sigma.is_some(),
            "observability_lost": aid.sigma.is_none(),
            "inertial_sources_east": sources,
        });
        let part2 = json!({
            "aids": {
                "afs": {
                    "relays_visible": aid.relays_visible,
                    "clock_aided_three_relay_fix": aid.clock_aided,
                    "fix_sigma_east_m": aid.sigma.map(|s| s[0]),
                    "fix_sigma_north_m": aid.sigma.map(|s| s[1]),
                    "fix_sigma_up_m": aid.sigma.map(|s| s[2]),
                    "fixes_used": fx_all[0].len(),
                    "differential_range_sigma_m": aid.dpnt_range_sigma_m,
                },
                "time": {
                    "ltc_offset_us": aid.ltc_offset_us,
                    "clock_sigma_s": aid.clock_sigma_s,
                    "time_since_sync_days": cfg.sync_days,
                },
            },
            "ablation": [
                {
                    "aids": "none",
                    "nav_sigma_position_m": sig3(&p_none, 0),
                    "nav_sigma_velocity_m_s": sig3(&p_none, 1),
                },
                {
                    "aids": "afs",
                    "nav_sigma_position_m": pos3,
                    "nav_sigma_velocity_m_s": vel3,
                },
            ],
            "insertion": {
                "nav_sigma_position_m": pos3,
                "nav_sigma_velocity_m_s": vel3,
                "nav_sigma_position_by_axis_m": (0..3).map(|k| json!({ "axis": axes[k], "sigma_m": p_all[k].at(0, 0).max(0.0).sqrt() })).collect::<Vec<_>>(),
                "nav_sigma_velocity_by_axis_m_s": (0..3).map(|k| json!({ "axis": axes[k], "sigma_m_s": p_all[k].at(1, 1).max(0.0).sqrt() })).collect::<Vec<_>>(),
                "cutoff_sigma_per_axis_m_s": cfg.cutoff,
                "dispersion_velocity_m_s": disp_vel3,
            },
            "series": series.iter().map(|(t, p, v)| json!({ "t_s": t, "nav_sigma_position_m": p, "nav_sigma_velocity_m_s": v })).collect::<Vec<_>>(),
        });
        let part3 = json!({
            "exit_state": {
                "frame": "mci",
                "evidence": "MODELLED",
                "pos_sigma_m": [cov[0][0].sqrt(), cov[1][1].sqrt(), cov[2][2].sqrt()],
                "vel_sigma_m_s": [cov[3][3].sqrt(), cov[4][4].sqrt(), cov[5][5].sqrt()],
                "note": "nominal state is a stand-in at the site's local vertical; the covariance is the result",
            },
            "budget_rows": [
                { "source": "inertial drift, no aid, 3-D position", "sigma_m": sig3(&p_none, 0), "label": LABEL },
                { "source": "navigation at insertion with the enabled aid, 3-D position", "sigma_m": pos3, "label": LABEL },
                { "source": "cutoff dispersion, 3-D velocity (not carried)", "sigma_m": (3.0f64).sqrt() * cfg.cutoff, "label": LABEL },
            ],
            "units": units(),
        });
        if let (Some(base), Value::Object(p2), Value::Object(p3)) =
            (report.as_object_mut(), part2, part3)
        {
            base.extend(p2);
            base.extend(p3);
        }
        let summary = crate::t!(
            "lunar-ascent-summary",
            lat = crate::i18n::num(cfg.lat, 2),
            inertial_pos = crate::i18n::num(sig3(&p_none, 0), 0),
            inertial_vel = crate::i18n::num(sig3(&p_none, 1), 2),
            afs_pos = crate::i18n::num(pos3, 1),
            afs_vel = crate::i18n::num(vel3, 3),
            dispersion = crate::i18n::num(disp_vel3, 2)
        );
        Ok(AscentOut {
            exit,
            series,
            report,
            summary,
        })
    }

    /// The result's chart: 3-D navigation position 1-sigma over the ascent.
    pub fn chart_svg(&self, json: &str) -> String {
        use crate::lunar_phase::{line_chart_svg, ChartSeries};
        let v: Value = serde_json::from_str(json).unwrap_or(Value::Null);
        let pts: Vec<(f64, f64)> = v["series"]
            .as_array()
            .map(|a| {
                a.iter()
                    .filter_map(|r| Some((r["t_s"].as_f64()?, r["nav_sigma_position_m"].as_f64()?)))
                    .collect()
            })
            .unwrap_or_default();
        line_chart_svg(
            &crate::t!("lunar-ascent-chart-title"),
            &crate::t!("lunar-ascent-chart-subtitle"),
            &crate::t!("lunar-ascent-chart-x-axis"),
            &crate::t!("lunar-chart-y-axis-metres"),
            &[ChartSeries {
                name: &crate::t!("lunar-ascent-chart-series"),
                points: pts,
            }],
        )
    }

    /// Standalone entry.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let out = self.run_phase(&self.standalone_entry(), &default_ctx())?;
        let json = serde_json::to_string_pretty(&out.report).map_err(|e| e.to_string())?;
        Ok((json, out.summary))
    }
}

/// One axis stepped on a grid with the fixes applied at their own times: `(t, position variance, velocity
/// variance)` at every grid time from zero to `t_end`.
pub(crate) fn axis_series(
    p0: &Dm,
    s: f64,
    t_end: f64,
    fixes: &[(f64, f64)],
    step: f64,
) -> Vec<(f64, f64, f64)> {
    let mut p = p0.clone();
    let mut t = 0.0;
    let mut out = vec![(0.0, p.at(0, 0), p.at(1, 1))];
    let mut fi = 0usize;
    let mut next_grid = step;
    loop {
        let t_grid = next_grid.min(t_end);
        if let Some(&(tf, r)) = fixes.get(fi) {
            if tf <= t_grid && tf <= t_end {
                p = predict(&p, tf - t, s);
                p = update(&p, r);
                t = tf;
                fi += 1;
                continue;
            }
        }
        p = predict(&p, t_grid - t, s);
        t = t_grid;
        out.push((t, p.at(0, 0), p.at(1, 1)));
        if t >= t_end - 1e-9 {
            break;
        }
        next_grid += step;
    }
    out
}

fn units() -> Value {
    const ROWS: &[(&str, &str, &str, &str)] = &[
        (
            "site.lat_deg",
            "deg",
            "input",
            "site selenographic latitude",
        ),
        (
            "site.lon_deg",
            "deg",
            "input",
            "site selenographic longitude",
        ),
        ("ascent_s", "s", "input", "powered-ascent duration"),
        ("insertion_altitude_km", "km", "input", "insertion altitude"),
        (
            "insertion_speed_m_s",
            "m/s",
            "closed-form",
            "circular speed at the insertion altitude",
        ),
        (
            "inertial_sources_east.sigma_m",
            "m",
            "closed-form",
            "position 1-sigma at insertion from one inertial source",
        ),
        (
            "aids.afs.relays_visible",
            "1",
            "computed",
            "relays above the mask at the site",
        ),
        (
            "aids.afs.fix_sigma_east_m",
            "m",
            "computed",
            "AFS position fix 1-sigma, east, before the time-tag term",
        ),
        (
            "aids.afs.fix_sigma_north_m",
            "m",
            "computed",
            "AFS position fix 1-sigma, north, before the time-tag term",
        ),
        (
            "aids.afs.fix_sigma_up_m",
            "m",
            "computed",
            "AFS position fix 1-sigma, up, before the time-tag term",
        ),
        (
            "aids.afs.fixes_used",
            "1",
            "computed",
            "AFS fixes taken during the ascent",
        ),
        (
            "aids.afs.differential_range_sigma_m",
            "m",
            "computed",
            "range-domain 1-sigma of the differential correction link, from lunar-differential-pnt",
        ),
        (
            "aids.time.ltc_offset_us",
            "us",
            "computed",
            "accumulated LTC-TT offset over the time since synchronisation, from lunar-time-offset",
        ),
        (
            "aids.time.clock_sigma_s",
            "s",
            "computed",
            "vehicle clock 1-sigma at the fixes",
        ),
        (
            "aids.time.time_since_sync_days",
            "d",
            "input",
            "time since the vehicle clock was synchronised",
        ),
        (
            "ablation.nav_sigma_position_m",
            "m",
            "computed",
            "3-D navigation position 1-sigma at insertion for that aid set",
        ),
        (
            "ablation.nav_sigma_velocity_m_s",
            "m/s",
            "computed",
            "3-D navigation velocity 1-sigma at insertion for that aid set",
        ),
        (
            "insertion.nav_sigma_position_m",
            "m",
            "computed",
            "3-D navigation position 1-sigma at insertion",
        ),
        (
            "insertion.nav_sigma_velocity_m_s",
            "m/s",
            "computed",
            "3-D navigation velocity 1-sigma at insertion",
        ),
        (
            "insertion.nav_sigma_position_by_axis_m.sigma_m",
            "m",
            "computed",
            "position 1-sigma per site axis at insertion",
        ),
        (
            "insertion.nav_sigma_velocity_by_axis_m_s.sigma_m_s",
            "m/s",
            "computed",
            "velocity 1-sigma per site axis at insertion",
        ),
        (
            "insertion.cutoff_sigma_per_axis_m_s",
            "m/s",
            "modelled-input",
            "engine cutoff velocity dispersion per axis",
        ),
        (
            "insertion.dispersion_velocity_m_s",
            "m/s",
            "computed",
            "3-D velocity dispersion at insertion, navigation and cutoff in quadrature",
        ),
        ("series.t_s", "s", "computed", "time since liftoff"),
        (
            "series.nav_sigma_position_m",
            "m",
            "computed",
            "3-D navigation position 1-sigma",
        ),
        (
            "series.nav_sigma_velocity_m_s",
            "m/s",
            "computed",
            "3-D navigation velocity 1-sigma",
        ),
        (
            "exit_state.pos_sigma_m",
            "m",
            "computed",
            "carried position 1-sigma per MCI axis at insertion",
        ),
        (
            "exit_state.vel_sigma_m_s",
            "m/s",
            "computed",
            "carried velocity 1-sigma per MCI axis at insertion",
        ),
        (
            "budget_rows.sigma_m",
            "m",
            "computed",
            "per-source 1-sigma in the budget table",
        ),
    ];
    let mut m = serde_json::Map::new();
    for (path, unit, prov, note) in ROWS {
        m.insert(
            (*path).to_string(),
            json!({ "unit": unit, "provenance": prov, "note": note }),
        );
    }
    Value::Object(m)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn quick() -> LunarAscentScenario {
        LunarAscentScenario::default()
    }

    #[test]
    fn default_runs_modelled_with_the_advisory_line() {
        let s = quick();
        let out = s.run_phase(&s.standalone_entry(), &default_ctx()).unwrap();
        assert_eq!(out.report["kind"], KIND);
        assert_eq!(out.report["label"], "MODELLED");
        assert!(out.report["advisory"]
            .as_str()
            .unwrap()
            .contains("not certified navigation equipment"));
        assert!(cov_is_valid(&out.exit.p));
        assert_eq!(out.exit.t_s, 450.0);
    }

    #[test]
    fn the_same_inputs_give_identical_documents() {
        assert_eq!(quick().run_json().unwrap().0, quick().run_json().unwrap().0);
    }

    /// With no aid the 3-D position sigma at insertion is the closed form of the five inertial sources, per
    /// axis in quadrature, to 1e-9.
    #[test]
    fn with_no_aid_the_insertion_error_is_the_closed_form_inertial_drift() {
        let s = LunarAscentScenario {
            afs_mode: Some("off".into()),
            ..Default::default()
        };
        let out = s.run_phase(&s.standalone_entry(), &default_ctx()).unwrap();
        let cfg = s.resolve().unwrap();
        let t = cfg.t_end;
        // Isotropic standalone prior: every axis has the same sigma.
        let (sp, sv) = (10.0, 0.01);
        let per_axis = (sp * sp
            + (sv * t).powi(2)
            + (cfg.sig_ab * t * t / 2.0).powi(2)
            + (cfg.s * cfg.sig_th0 * t * t / 2.0).powi(2)
            + (cfg.s * cfg.sig_gb * t.powi(3) / 6.0).powi(2))
        .sqrt();
        let want = 3f64.sqrt() * per_axis;
        let got = out.report["ablation"][0]["nav_sigma_position_m"]
            .as_f64()
            .unwrap();
        assert!(((got - want) / want).abs() < 1e-9, "{got} vs {want}");
    }

    #[test]
    fn the_aid_never_hurts_and_the_velocity_is_carried_with_its_correlation() {
        let s = quick();
        let out = s.run_phase(&s.standalone_entry(), &default_ctx()).unwrap();
        let none = out.report["ablation"][0]["nav_sigma_position_m"]
            .as_f64()
            .unwrap();
        let afs = out.report["ablation"][1]["nav_sigma_position_m"]
            .as_f64()
            .unwrap();
        assert!(afs <= none + 1e-9, "{afs} vs {none}");
        // The position-velocity block of the exit covariance is not zero: the tilt and bias drive both.
        let cross: f64 = (0..3).map(|i| out.exit.p[i][3 + i].abs()).sum();
        assert!(cross > 0.0);
    }

    #[test]
    fn a_stale_tt_clock_costs_a_three_relay_fix() {
        let run = |mode: &str, days: f64| {
            let s = LunarAscentScenario {
                n_relays: Some(4),
                lunar_time_mode: Some(mode.into()),
                time_since_sync_days: Some(days),
                ..Default::default()
            };
            let r = s
                .run_phase(&s.standalone_entry(), &default_ctx())
                .unwrap()
                .report;
            assert_eq!(r["aids"]["afs"]["clock_aided_three_relay_fix"], true);
            r["aids"]["afs"]["fix_sigma_east_m"].as_f64().unwrap()
        };
        assert!(run("off", 0.1) < run("ltc", 0.1) && run("ltc", 0.1) < run("ltc", 30.0));
        assert!(run("tt", 3.0) > run("ltc", 3.0));
    }

    #[test]
    fn bad_inputs_are_rejected() {
        for s in [
            LunarAscentScenario {
                afs_mode: Some("x".into()),
                ..Default::default()
            },
            LunarAscentScenario {
                lunar_time_mode: Some("x".into()),
                ..Default::default()
            },
            LunarAscentScenario {
                ascent_s: Some(5.0),
                ..Default::default()
            },
            LunarAscentScenario {
                site_lat_deg: Some(-95.0),
                ..Default::default()
            },
            LunarAscentScenario {
                insertion_altitude_km: Some(1.0),
                ..Default::default()
            },
        ] {
            assert!(s.run_phase(&s.standalone_entry(), &default_ctx()).is_err());
        }
        let mut c = quick().standalone_entry();
        c.frame = Frame::Mcmf;
        assert!(quick().run_phase(&c, &default_ctx()).is_err());
    }
}
