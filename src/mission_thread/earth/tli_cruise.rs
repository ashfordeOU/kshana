// SPDX-License-Identifier: AGPL-3.0-only
//! `tli-and-cruise`: the trans-lunar injection burn and the cislunar cruise, with a covariance
//! propagated by a finite-difference state-transition matrix of the engine's Cowell propagator.
//!
//! **MODELLED.** The mean state is the propagator of [`crate::propagator`] with Earth point-mass
//! gravity and J2 and the Sun and Moon as third bodies. When the thread carries a Moon kernel that
//! covers the segment, the Moon's position comes from it (the Sun from the engine's analytic
//! series, which is the only body the kernel cut lacks); otherwise both are the analytic series,
//! and the phase says so in its events. The covariance goes through every `step_s` segment with a
//! forward-difference state-transition matrix (the nominal run and six perturbed runs, one per
//! state component) and a white acceleration noise of stated power spectral density.
//!
//! The burn is applied at the start of the phase along the entry velocity: its size error is a
//! stated fraction of the burn, and its pointing error a stated angle across it (two axes).
//! Neither is a model of any engine.
//!
//! Updates (a phase uses them only when the document lists the navigation source):
//!
//! * `gnss-ssv`: position fixes whose availability and geometry come from the engine's
//!   space-service-volume sweep ([`crate::ssv::sweep::run_trajectory`]) along an osculating
//!   Earth-orbit standing in for the arc, one sweep per `ssv_window_s`. The fix sigma is the median
//!   PDOP times the stated `ssv_uere_m`; the update variance is that sigma squared over three per
//!   axis, divided by the window's availability of four or more signals (the expected-information
//!   approximation, so the run stays deterministic). The osculating orbit stands in for the
//!   cislunar arc and stops being close to it once the Moon's pull matters; the row says so.
//! * `ground-tracking`: a range and a range rate along the geocentric direction (at cislunar
//!   distances the station direction differs from it by less than a degree), each of the stated
//!   sigma, every `ground_interval_s`, with the update variance divided by the tracking duty the
//!   ground-network overlay passes (or the stated `ground_duty`). Range observes only the line
//!   of sight: the plane of the sky is not observed, and the covariance there grows with the
//!   STM.
//!
//! The clock is a bias-and-drift holdover with the stated noises. The exit state is the mean state at
//! the end of the phase in GCRF with the filter's covariance.
//!
//! Model keys (`[phase.model]`): `tli_dv_mps`, `tli_dv_sigma_fraction`, `tli_pointing_sigma_rad`,
//! `step_s`, `process_q_acc` (optional, default 1e-13 (m/s^2)^2/Hz), `clock_q_f`, `clock_q_d`,
//! and, when the sources are used: `ssv_uere_m`, `ssv_window_s` (optional, default 21 600 s),
//! `ssv_step_min` (optional, default 10) and `ssv_cn0_min_dbhz` (optional, default 20); and
//! `ground_range_sigma_m`, `ground_range_rate_sigma_mps`, `ground_interval_s`, `ground_duty`
//! (optional).

// 6x6 covariance and STM loops index several matrices by one variable.
#![allow(clippy::needless_range_loop)]

use super::filter::ClockFilter;
use super::model::Model;
use super::rendezvous::{mul, transpose};
use crate::body::Body;
use crate::cw_dynamics::Mat6;
use crate::ephem_provider::{BuiltinEphemeris, EphemerisProvider, KernelEphemeris};
use crate::forces::MU_EARTH;
use crate::integrator::Tolerance;
use crate::mission_thread::budget::{BudgetRow, PhaseBudget};
use crate::mission_thread::phase::{
    Event, EvidenceLabel, Frame, NavSource, NavState, PhaseOutcome, Sample,
};
use crate::mission_thread::{MissionPhase, PhaseCtx, ThreadCtx};
use crate::propagator::{propagate_dop853, ForceModel};
use crate::ssv::constellations::{Band, Constellation};
use crate::ssv::pattern::{Axis, NamedAntenna, TxPattern, UserAntenna};
use crate::ssv::sweep::{run_trajectory, NoEffects, TrajectoryConfig, UserOrbit};
use std::sync::Arc;

/// The registered kind name.
pub const KIND: &str = "tli-and-cruise";

/// The most samples a phase's series keeps.
const MAX_SAMPLES: usize = 400;

/// Perturbation of a position component for the finite-difference STM, metres.
const DR_M: f64 = 2.0;
/// Perturbation of a velocity component for the finite-difference STM, metres per second.
const DV_MPS: f64 = 2.0e-4;

/// The ground-tracking numbers, stated in the model.
#[derive(Clone, Copy)]
struct Ground {
    range_sigma_m: f64,
    rate_sigma_mps: f64,
    interval_s: f64,
    duty: Option<f64>,
}

/// The gnss-ssv numbers, stated in the model.
#[derive(Clone, Copy)]
struct Ssv {
    uere_m: f64,
    window_s: f64,
    step_min: f64,
    cn0_min_dbhz: f64,
}

/// The tli-and-cruise phase.
pub struct TliCruise {
    pub(super) dv_mps: f64,
    dv_sigma_fraction: f64,
    pointing_sigma_rad: f64,
    step_s: f64,
    q_acc: f64,
    clock_q_f: f64,
    clock_q_d: f64,
    ground: Option<Ground>,
    ssv: Option<Ssv>,
}

/// Builds the phase from its model table.
pub fn ctor(t: &toml::Table) -> Result<Box<dyn MissionPhase>, String> {
    Ok(Box::new(parse(t, KIND, true, &[])?))
}

/// Reads the coast model: the burn keys only when `with_burn`, plus `extra` keys another phase
/// that reuses the coast (the entry phase) reads itself.
pub(super) fn parse(
    t: &toml::Table,
    kind: &'static str,
    with_burn: bool,
    extra: &[&str],
) -> Result<TliCruise, String> {
    let m = Model::new(kind, t);
    let mut allowed = vec![
        "step_s",
        "process_q_acc",
        "clock_q_f",
        "clock_q_d",
        "ssv_uere_m",
        "ssv_window_s",
        "ssv_step_min",
        "ssv_cn0_min_dbhz",
        "ground_range_sigma_m",
        "ground_range_rate_sigma_mps",
        "ground_interval_s",
        "ground_duty",
    ];
    if with_burn {
        allowed.extend([
            "tli_dv_mps",
            "tli_dv_sigma_fraction",
            "tli_pointing_sigma_rad",
        ]);
    }
    allowed.extend(extra.iter().copied());
    m.only(&allowed)?;
    let ground = if t.contains_key("ground_range_sigma_m") {
        let duty = if t.contains_key("ground_duty") {
            let d = m.num("ground_duty")?;
            if !(0.0..=1.0).contains(&d) {
                return Err(format!("{KIND}: `ground_duty` must be in [0, 1], got {d}"));
            }
            Some(d)
        } else {
            None
        };
        Some(Ground {
            range_sigma_m: m.pos("ground_range_sigma_m")?,
            rate_sigma_mps: m.pos("ground_range_rate_sigma_mps")?,
            interval_s: m.pos("ground_interval_s")?,
            duty,
        })
    } else {
        None
    };
    let ssv = if t.contains_key("ssv_uere_m") {
        Some(Ssv {
            uere_m: m.pos("ssv_uere_m")?,
            window_s: m.num_or("ssv_window_s", 21_600.0)?,
            step_min: m.num_or("ssv_step_min", 10.0)?,
            cn0_min_dbhz: m.num_or("ssv_cn0_min_dbhz", 20.0)?,
        })
    } else {
        None
    };
    if let Some(s) = &ssv {
        if !(s.window_s > 0.0 && s.step_min > 0.0) {
            return Err(format!(
                "{KIND}: `ssv_window_s` and `ssv_step_min` must be above 0"
            ));
        }
    }
    let burn = |key: &str| if with_burn { m.nonneg(key) } else { Ok(0.0) };
    Ok(TliCruise {
        dv_mps: burn("tli_dv_mps")?,
        dv_sigma_fraction: burn("tli_dv_sigma_fraction")?,
        pointing_sigma_rad: burn("tli_pointing_sigma_rad")?,
        step_s: m.pos("step_s")?,
        q_acc: m.num_or("process_q_acc", 1.0e-13)?,
        clock_q_f: m.nonneg("clock_q_f")?,
        clock_q_d: m.nonneg("clock_q_d")?,
        ground,
        ssv,
    })
}

/// The Moon from a kernel, everything else from the analytic series: the provider the cut that has
/// no Sun in it can serve to the propagator's ephemeris tier.
#[derive(Debug)]
struct KernelMoonAnalyticSun {
    kernel: Arc<KernelEphemeris>,
}

impl EphemerisProvider for KernelMoonAnalyticSun {
    fn relative_position(&self, target: &Body, center: &Body, jd_tdb: f64) -> Option<[f64; 3]> {
        match (target.name, center.name) {
            ("Moon", "Earth") | ("Earth", "Moon") => {
                self.kernel.relative_position(target, center, jd_tdb)
            }
            _ => BuiltinEphemeris.relative_position(target, center, jd_tdb),
        }
    }

    fn relative_position_jd2(
        &self,
        target: &Body,
        center: &Body,
        jd_tdb: crate::jd2::Jd2,
    ) -> Option<[f64; 3]> {
        match (target.name, center.name) {
            ("Moon", "Earth") | ("Earth", "Moon") => {
                self.kernel.relative_position_jd2(target, center, jd_tdb)
            }
            _ => BuiltinEphemeris.relative_position(target, center, jd_tdb.total()),
        }
    }
}

/// The force model for a segment starting at `epoch_jd`: the Moon from the thread's kernel when it
/// serves the segment's start and end, else the analytic series. Returns whether the kernel was used.
fn segment_model(ctx: &ThreadCtx, epoch_jd: f64, dt_s: f64) -> (ForceModel, bool) {
    let base = |jd: f64| ForceModel::with_j2().third_body(true, true, jd);
    if let Some(k) = &ctx.moon_kernel {
        let provider: Arc<dyn EphemerisProvider + Send + Sync> =
            Arc::new(KernelMoonAnalyticSun { kernel: k.clone() });
        let end_jd = epoch_jd + dt_s / 86_400.0;
        let covers = |jd: f64| {
            provider
                .relative_position(&Body::moon(), &Body::earth(), jd)
                .is_some()
        };
        if covers(epoch_jd) && covers(end_jd) {
            if let Ok(m) = base(epoch_jd).with_ephemeris(provider) {
                return (m, true);
            }
        }
    }
    (base(epoch_jd), false)
}

fn tolerance() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        h_min: 1e-6,
        h_max: 600.0,
    }
}

/// Propagates `x` by `dt` seconds and returns the end state and the forward-difference STM.
fn fd_stm(x: &[f64; 6], dt: f64, model: &ForceModel) -> Result<([f64; 6], Mat6), String> {
    let tol = tolerance();
    let run = |s: &[f64; 6]| -> Result<[f64; 6], String> {
        let (r, v) = propagate_dop853([s[0], s[1], s[2]], [s[3], s[4], s[5]], dt, model, &tol);
        let out = [r[0], r[1], r[2], v[0], v[1], v[2]];
        if out.iter().all(|c| c.is_finite()) {
            Ok(out)
        } else {
            Err(format!("{KIND}: the propagation did not reach {dt} s"))
        }
    };
    let nominal = run(x)?;
    let mut phi = [[0.0; 6]; 6];
    for j in 0..6 {
        let h = if j < 3 { DR_M } else { DV_MPS };
        let mut s = *x;
        s[j] += h;
        let e = run(&s)?;
        for i in 0..6 {
            phi[i][j] = (e[i] - nominal[i]) / h;
        }
    }
    Ok((nominal, phi))
}

fn add_noise(p: &mut Mat6, q: f64, dt: f64) {
    for i in 0..3 {
        p[i][i] += q * dt.powi(3) / 3.0;
        p[i][i + 3] += q * dt * dt / 2.0;
        p[i + 3][i] += q * dt * dt / 2.0;
        p[i + 3][i + 3] += q * dt;
    }
}

fn step_cov(p: &Mat6, phi: &Mat6) -> Mat6 {
    mul(&mul(phi, p), &transpose(phi))
}

/// A scalar measurement `z = h . x` of variance `r`, applied to the covariance `p`.
fn update_scalar(p: &mut Mat6, h: &[f64; 6], r: f64) {
    let mut ph = [0.0; 6];
    for i in 0..6 {
        ph[i] = (0..6).map(|j| p[i][j] * h[j]).sum();
    }
    let s: f64 = (0..6).map(|i| h[i] * ph[i]).sum::<f64>() + r;
    for i in 0..6 {
        for j in 0..6 {
            p[i][j] -= ph[i] * ph[j] / s;
        }
    }
}

fn rss_pos(p: &Mat6) -> f64 {
    (p[0][0] + p[1][1] + p[2][2]).max(0.0).sqrt()
}

fn rss_vel(p: &Mat6) -> f64 {
    (p[3][3] + p[4][4] + p[5][5]).max(0.0).sqrt()
}

/// Osculating `[a_km, e, i_deg, raan_deg, argp_deg, nu_deg]` about the Earth.
fn elements(x: &[f64; 6]) -> Result<[f64; 6], String> {
    let r = [x[0], x[1], x[2]];
    let v = [x[3], x[4], x[5]];
    let dot = |a: &[f64; 3], b: &[f64; 3]| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    let cross = |a: &[f64; 3], b: &[f64; 3]| {
        [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    };
    let rn = dot(&r, &r).sqrt();
    let h = cross(&r, &v);
    let hn = dot(&h, &h).sqrt();
    let energy = dot(&v, &v) / 2.0 - MU_EARTH / rn;
    if energy >= 0.0 {
        return Err(format!(
            "{KIND}: the post-burn orbit is not bound (specific energy {energy:.0} J/kg); the \
             gnss-ssv standing-in orbit needs an elliptic one"
        ));
    }
    let a = -MU_EARTH / (2.0 * energy);
    let ev = {
        let c = cross(&v, &h);
        [
            c[0] / MU_EARTH - r[0] / rn,
            c[1] / MU_EARTH - r[1] / rn,
            c[2] / MU_EARTH - r[2] / rn,
        ]
    };
    let e = dot(&ev, &ev).sqrt();
    let inc = (h[2] / hn).clamp(-1.0, 1.0).acos();
    let node = [-h[1], h[0], 0.0];
    let nn = dot(&node, &node).sqrt();
    let raan = if nn > 1e-9 {
        node[1].atan2(node[0])
    } else {
        0.0
    };
    let argp = if e > 1e-9 && nn > 1e-9 {
        let c = (dot(&node, &ev) / (nn * e)).clamp(-1.0, 1.0).acos();
        if ev[2] < 0.0 {
            2.0 * std::f64::consts::PI - c
        } else {
            c
        }
    } else {
        0.0
    };
    let nu = if e > 1e-9 {
        let c = (dot(&ev, &r) / (e * rn)).clamp(-1.0, 1.0).acos();
        if dot(&r, &v) < 0.0 {
            2.0 * std::f64::consts::PI - c
        } else {
            c
        }
    } else {
        0.0
    };
    Ok([
        a / 1e3,
        e,
        inc.to_degrees(),
        raan.to_degrees(),
        argp.to_degrees(),
        nu.to_degrees(),
    ])
}

/// The availability and fix sigma of the gnss-ssv sweep in a window.
struct SsvWindow {
    t0_s: f64,
    avail: f64,
    fix_sigma_m: Option<f64>,
}

fn ssv_windows(s: &Ssv, orbit: &[f64; 6], duration_s: f64) -> Result<Vec<SsvWindow>, String> {
    let (a_km, e) = (orbit[0], orbit[1]);
    let n = (MU_EARTH / (a_km * 1e3).powi(3)).sqrt();
    let nu0 = orbit[5].to_radians();
    let ea0 = ((1.0 - e * e).sqrt() * nu0.sin()).atan2(e + nu0.cos());
    let m0 = ea0 - e * ea0.sin();
    let ants: Vec<(Band, Vec<UserAntenna>)> = [Band::L1]
        .into_iter()
        .map(|b| {
            (
                b,
                vec![UserAntenna::named(
                    &NamedAntenna::BookletHighGain,
                    b,
                    Axis::Nadir,
                )],
            )
        })
        .collect();
    let mut out = Vec::new();
    let mut t = 0.0;
    while t < duration_s - 1e-9 {
        let len = s.window_s.min(duration_s - t);
        let m = (m0 + n * t).rem_euclid(2.0 * std::f64::consts::PI);
        let ea = crate::ephem::solve_kepler(m, e);
        let nu = (((1.0 - e * e).sqrt() * ea.sin()).atan2(ea.cos() - e)).to_degrees();
        let cfg = TrajectoryConfig {
            orbit: UserOrbit {
                a_km,
                e,
                i_deg: orbit[2],
                raan_deg: orbit[3],
                argp_deg: orbit[4],
                true_anomaly_deg: nu,
            },
            duration_min: len / 60.0,
            step_min: s.step_min.min(len / 60.0),
            cn0_min_dbhz: Some(s.cn0_min_dbhz),
            constellations: Constellation::ALL.to_vec(),
            bands: vec![Band::L1],
            antennas: ants.clone(),
            tx: TxPattern::Booklet,
            mrtp_reference_alt_km: 36_000.0,
            series_every_epochs: 0,
            collect_limb: false,
            beam_override_deg: Vec::new(),
        };
        let r = run_trajectory(&cfg, &NoEffects)?;
        let band = r
            .bands
            .first()
            .ok_or_else(|| format!("{KIND}: the gnss-ssv sweep returned no band"))?;
        let combined = band
            .groups
            .iter()
            .find(|g| g.name == "combined")
            .or_else(|| band.groups.last())
            .ok_or_else(|| format!("{KIND}: the gnss-ssv sweep returned no group"))?;
        out.push(SsvWindow {
            t0_s: t,
            avail: combined.availability.at_least_4_pct / 100.0,
            fix_sigma_m: band.pdop_median.map(|p| p * s.uere_m),
        });
        t += len;
    }
    Ok(out)
}

fn unit(v: [f64; 3]) -> [f64; 3] {
    let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    [v[0] / n, v[1] / n, v[2] / n]
}

/// The covariance contribution of the burn error along `u`: size `sm` along it, `sp` across it on
/// each of the two perpendicular axes.
fn burn_cov(u: [f64; 3], sm: f64, sp: f64) -> Mat6 {
    let mut p = [[0.0; 6]; 6];
    for i in 0..3 {
        for j in 0..3 {
            let uu = u[i] * u[j];
            let d = if i == j { 1.0 } else { 0.0 };
            p[3 + i][3 + j] = sm * sm * uu + sp * sp * (d - uu);
        }
    }
    p
}

impl MissionPhase for TliCruise {
    fn kind(&self) -> &'static str {
        KIND
    }

    fn run(
        &self,
        entry: &NavState,
        ctx: &ThreadCtx,
        phase: &PhaseCtx,
    ) -> Result<PhaseOutcome, String> {
        self.coast(KIND, true, entry, ctx, phase)
    }
}

impl TliCruise {
    /// The coast: the burn when `with_burn`, then the propagation with its updates. The entry
    /// phase runs it with no burn under its own kind name.
    pub(super) fn coast(
        &self,
        kind: &'static str,
        with_burn: bool,
        entry: &NavState,
        ctx: &ThreadCtx,
        phase: &PhaseCtx,
    ) -> Result<PhaseOutcome, String> {
        if entry.frame != Frame::Gcrf {
            return Err(format!(
                "{KIND}: expects a GCRF entry state, got {:?}; state the entry in gcrf",
                entry.frame
            ));
        }
        let use_ssv = phase.uses(NavSource::GnssSsv) && self.ssv.is_some();
        let use_ground = phase.uses(NavSource::GroundTracking) && self.ground.is_some();
        if !phase.nav.is_empty() {
            if phase.nav.contains(&NavSource::GnssSsv) && self.ssv.is_none() {
                return Err(format!(
                    "{KIND}: the phase lists gnss-ssv, so the model needs `ssv_uere_m`"
                ));
            }
            if phase.nav.contains(&NavSource::GroundTracking) && self.ground.is_none() {
                return Err(format!(
                    "{KIND}: the phase lists ground-tracking, so the model needs `ground_range_sigma_m`, \
                     `ground_range_rate_sigma_mps` and `ground_interval_s`"
                ));
            }
        }
        let t0 = entry.t_s;
        let jd0 = crate::lunar_phase::epoch_jd(ctx, t0)?;
        let dur = phase.duration_s;

        // The burn.
        let u = unit([entry.x[3], entry.x[4], entry.x[5]]);
        let mut x = entry.x;
        for i in 0..3 {
            x[3 + i] += self.dv_mps * u[i];
        }
        let sm = self.dv_sigma_fraction * self.dv_mps;
        let sp = self.pointing_sigma_rad * self.dv_mps;
        let p_burn = burn_cov(u, sm, sp);
        let mut p = entry.p;
        for i in 0..6 {
            for j in 0..6 {
                p[i][j] += p_burn[i][j];
            }
        }
        let mut events = Vec::new();
        if with_burn {
            events.push(Event {
                t_s: t0,
                what: format!(
                    "TLI burn of {:.1} m/s along the velocity: size error {:.2} m/s, pointing error {:.2} m/s per cross axis",
                    self.dv_mps, sm, sp
                ),
            });
        }

        // The standing-in orbit and the gnss-ssv windows.
        let ssv_w: Vec<SsvWindow> = match (&self.ssv, use_ssv) {
            (Some(s), true) => ssv_windows(s, &elements(&x)?, dur)?,
            _ => Vec::new(),
        };

        // The ground duty.
        let duty = self
            .ground
            .as_ref()
            .map(|g| phase.ground_duty.or(g.duty).unwrap_or(1.0))
            .unwrap_or(0.0);
        if use_ground {
            events.push(Event {
                t_s: t0,
                what: format!("ground tracking at a duty of {:.0} %", 100.0 * duty),
            });
        }

        let mut clock = ClockFilter { p: entry.clock.cov };
        let mut phi_tot: Mat6 = [[0.0; 6]; 6];
        for (i, row) in phi_tot.iter_mut().enumerate() {
            row[i] = 1.0;
        }
        let mut p_q = [[0.0; 6]; 6];
        let mut p_free = p;
        let mut all = vec![Sample {
            t_s: t0,
            sigma_pos_m: rss_pos(&p),
            sigma_vel_mps: rss_vel(&p),
            sigma_time_s: clock.sigma_bias(),
        }];
        let (entry_pos, entry_vel) = (rss_pos(&entry.p), rss_vel(&entry.p));
        let mut t = 0.0;
        let mut kernel_segments = 0usize;
        let mut segments = 0usize;
        let mut ground_since_update = 0.0;
        let mut ssv_last_avail: Option<bool> = None;
        while t < dur - 1e-9 {
            let dt = self.step_s.min(dur - t);
            let (model, used_kernel) = segment_model(ctx, jd0 + t / 86_400.0, dt);
            segments += 1;
            if used_kernel {
                kernel_segments += 1;
            }
            let (x1, phi) = fd_stm(&x, dt, &model)?;
            x = x1;
            p = step_cov(&p, &phi);
            add_noise(&mut p, self.q_acc, dt);
            p_free = step_cov(&p_free, &phi);
            add_noise(&mut p_free, self.q_acc, dt);
            p_q = step_cov(&p_q, &phi);
            add_noise(&mut p_q, self.q_acc, dt);
            phi_tot = mul(&phi, &phi_tot);
            clock.predict(dt, self.clock_q_f, self.clock_q_d);
            t += dt;

            if use_ssv {
                let w = ssv_w
                    .iter()
                    .rev()
                    .find(|w| w.t0_s <= t - dt + 1e-9)
                    .or_else(|| ssv_w.first());
                if let Some(w) = w {
                    let avail_now = w.avail > 0.0 && w.fix_sigma_m.is_some();
                    if ssv_last_avail != Some(avail_now) {
                        events.push(Event {
                            t_s: t0 + t - dt,
                            what: if avail_now {
                                format!(
                                    "gnss-ssv fixes available ({:.0} % of epochs with four or more signals, fix sigma {:.0} m)",
                                    100.0 * w.avail,
                                    w.fix_sigma_m.unwrap_or(f64::NAN)
                                )
                            } else {
                                "gnss-ssv unavailable: fewer than four signals".to_string()
                            },
                        });
                        ssv_last_avail = Some(avail_now);
                    }
                    if let (true, Some(fs)) = (avail_now, w.fix_sigma_m) {
                        let r = fs * fs / 3.0 / w.avail;
                        for k in 0..3 {
                            let mut h = [0.0; 6];
                            h[k] = 1.0;
                            update_scalar(&mut p, &h, r);
                        }
                    }
                }
            }
            if use_ground && duty > 0.0 {
                if let Some(g) = &self.ground {
                    ground_since_update += dt;
                    if ground_since_update + 1e-9 >= g.interval_s {
                        ground_since_update = 0.0;
                        let rn = (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
                        let ur = [x[0] / rn, x[1] / rn, x[2] / rn];
                        let h_rho = [ur[0], ur[1], ur[2], 0.0, 0.0, 0.0];
                        let h_rate = [0.0, 0.0, 0.0, ur[0], ur[1], ur[2]];
                        update_scalar(&mut p, &h_rho, g.range_sigma_m.powi(2) / duty);
                        update_scalar(&mut p, &h_rate, g.rate_sigma_mps.powi(2) / duty);
                    }
                }
            }
            all.push(Sample {
                t_s: t0 + t,
                sigma_pos_m: rss_pos(&p),
                sigma_vel_mps: rss_vel(&p),
                sigma_time_s: clock.sigma_bias(),
            });
        }
        let last = *all
            .last()
            .ok_or_else(|| format!("{KIND}: the phase produced no samples"))?;
        let peak = |f: fn(&Sample) -> f64| all.iter().map(f).fold(0.0, f64::max);
        events.push(Event {
            t_s: t0,
            what: if kernel_segments == segments {
                "Moon from the thread's kernel, Sun from the analytic series".to_string()
            } else if kernel_segments == 0 {
                "Moon and Sun from the analytic series (no kernel covers the phase): the Moon's position carries its series error"
                    .to_string()
            } else {
                format!(
                    "Moon from the thread's kernel for {kernel_segments} of {segments} segments, the analytic series for the rest"
                )
            },
        });
        events.push(Event {
            t_s: t0 + dur,
            what: format!(
                "end of cruise: position sigma {:.1} km, velocity sigma {:.3} m/s",
                last.sigma_pos_m / 1e3,
                last.sigma_vel_mps
            ),
        });

        // Budget rows: the contributions propagated to the end with no tracking, then the aids.
        let prop = |p0: &Mat6| rss_pos(&step_cov(p0, &phi_tot));
        let mut rows = vec![
            BudgetRow {
                source: "entry covariance propagated to the end of the phase, no tracking"
                    .to_string(),
                sigma: prop(&entry.p),
                unit: "m".to_string(),
                label: EvidenceLabel::modelled(),
            },
            BudgetRow {
                source: format!(
                    "TLI burn error ({:.1} % of {:.0} m/s, pointing {:.2} mrad) propagated to the end, no tracking",
                    100.0 * self.dv_sigma_fraction,
                    self.dv_mps,
                    1e3 * self.pointing_sigma_rad
                ),
                sigma: prop(&p_burn),
                unit: "m".to_string(),
                label: EvidenceLabel::modelled(),
            },
            BudgetRow {
                source: format!(
                    "unmodelled acceleration noise ({:e} (m/s^2)^2/Hz) over the phase",
                    self.q_acc
                ),
                sigma: rss_pos(&p_q),
                unit: "m".to_string(),
                label: EvidenceLabel::modelled(),
            },
            BudgetRow {
                source: "everything above together, no tracking".to_string(),
                sigma: rss_pos(&p_free),
                unit: "m".to_string(),
                label: EvidenceLabel::modelled(),
            },
        ];
        if !with_burn {
            rows.retain(|r| !r.source.starts_with("TLI burn error"));
        }
        if use_ground {
            if let Some(g) = &self.ground {
                rows.push(BudgetRow {
                    source: format!(
                        "ground tracking range, one per {:.0} s at a duty of {:.0} %: line of sight only, the plane of the sky is not observed",
                        g.interval_s,
                        100.0 * duty
                    ),
                    sigma: g.range_sigma_m,
                    unit: "m".to_string(),
                    label: EvidenceLabel::modelled(),
                });
                rows.push(BudgetRow {
                    source: "ground tracking range rate".to_string(),
                    sigma: g.rate_sigma_mps,
                    unit: "m/s".to_string(),
                    label: EvidenceLabel::modelled(),
                });
            }
        }
        if use_ssv {
            let fixes: Vec<f64> = ssv_w.iter().filter_map(|w| w.fix_sigma_m).collect();
            if !fixes.is_empty() {
                let mean_avail = ssv_w.iter().map(|w| w.avail).sum::<f64>() / ssv_w.len() as f64;
                rows.push(BudgetRow {
                    source: format!(
                        "gnss-ssv fix (median PDOP times UERE; four or more signals in {:.0} % of epochs; the osculating orbit stands in for the arc)",
                        100.0 * mean_avail
                    ),
                    sigma: fixes.iter().copied().fold(f64::INFINITY, f64::min),
                    unit: "m".to_string(),
                    label: EvidenceLabel::modelled(),
                });
            }
        }
        let limiting = if use_ground || use_ssv {
            if last.sigma_pos_m > 0.5 * rss_pos(&p_free) {
                "tracking geometry"
            } else if use_ground {
                "ground tracking"
            } else {
                "gnss-ssv"
            }
        } else if with_burn {
            "TLI burn error (untracked growth)"
        } else {
            "entry covariance (untracked growth)"
        };
        let mut exit = entry.clone();
        exit.t_s = t0 + dur;
        exit.frame = Frame::Gcrf;
        exit.x = x;
        exit.p = p;
        exit.clock.cov = clock.p;
        exit.upstream = entry.upstream.clone().weaker(EvidenceLabel::modelled());
        let nav = if phase.nav.is_empty() {
            let mut v = Vec::new();
            if use_ssv {
                v.push(NavSource::GnssSsv);
            }
            if use_ground {
                v.push(NavSource::GroundTracking);
            }
            if v.is_empty() {
                v.push(NavSource::Inertial);
            }
            v
        } else {
            phase.nav.clone()
        };
        let budget = PhaseBudget {
            phase_id: phase.id.clone(),
            kind: kind.to_string(),
            entry_sigma_pos_m: entry_pos,
            entry_sigma_vel_mps: entry_vel,
            entry_sigma_time_s: entry.sigma_time_s(),
            exit_sigma_pos_m: last.sigma_pos_m,
            exit_sigma_vel_mps: last.sigma_vel_mps,
            exit_sigma_time_s: last.sigma_time_s,
            peak_sigma_pos_m: peak(|s| s.sigma_pos_m),
            peak_sigma_vel_mps: peak(|s| s.sigma_vel_mps),
            peak_sigma_time_s: peak(|s| s.sigma_time_s),
            nav_sources: nav,
            time_source: phase.time,
            limiting_source: Some(limiting.to_string()),
            rows,
            label: EvidenceLabel::modelled(),
        };
        let series = thin(&all, MAX_SAMPLES);
        Ok(PhaseOutcome {
            exit,
            budget,
            series,
            events,
            label: EvidenceLabel::modelled(),
        })
    }
}

fn thin(all: &[Sample], max: usize) -> Vec<Sample> {
    if all.len() <= max {
        return all.to_vec();
    }
    let stride = all.len().div_ceil(max);
    let mut out: Vec<Sample> = all.iter().copied().step_by(stride).collect();
    if let (Some(last), Some(kept)) = (all.last(), out.last()) {
        if kept.t_s != last.t_s {
            out.push(*last);
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::Timescale;

    /// A 185 km circular parking orbit at 28.5 degrees, ready for the burn.
    fn entry() -> NavState {
        let x = super::super::orbit::circular_state(185_000.0, 28.5, 10.0, 0.0);
        NavState::diagonal(0.0, Frame::Gcrf, x, 10.0, 0.01, Timescale::Utc, 1e-7, 1e-12)
    }

    fn model(extra: &str) -> toml::Table {
        toml::from_str(&format!(
            "tli_dv_mps = 3130.0\ntli_dv_sigma_fraction = 0.001\ntli_pointing_sigma_rad = 0.001\n\
             step_s = 3600.0\nclock_q_f = 1e-22\nclock_q_d = 1e-30\n{extra}"
        ))
        .unwrap()
    }

    fn run_nav(extra: &str, nav: Vec<NavSource>, dur: f64) -> PhaseOutcome {
        let phase = ctor(&model(extra)).unwrap();
        let ctx = ThreadCtx::new("2028-01-10T00:00:00Z", 3);
        let mut pctx = ctx.phase_ctx(0, "tli", dur);
        pctx.nav = nav;
        phase.run(&entry(), &ctx, &pctx).unwrap()
    }

    #[test]
    fn the_stm_is_symplectic_for_the_conservative_part_and_matches_a_finer_difference() {
        // Two-body, no third bodies: det(STM) = 1 (Liouville) and a half-size perturbation gives the
        // same matrix to the difference's own truncation error.
        let x = [7.0e6, 0.0, 0.0, 0.0, 7546.0, 0.0];
        let model = ForceModel::two_body();
        let (_, phi) = fd_stm(&x, 3000.0, &model).unwrap();
        let det = det6(&phi);
        // A forward difference has a first-order truncation error: 2 m and 0.2 mm/s over half an
        // orbit leave the determinant within 2e-3 of one.
        assert!((det - 1.0).abs() < 2e-3, "{det}");
        // An independent check of the first column: shifting x by 10 m moves the state by the
        // first column times 10 m.
        let (a, _) = fd_stm(&x, 3000.0, &model).unwrap();
        let mut y = x;
        y[0] += 1.0;
        let (b, _) = fd_stm(&y, 3000.0, &model).unwrap();
        for i in 0..6 {
            let dd = b[i] - a[i];
            assert!(
                (dd - phi[i][0]).abs() < 1e-4 * (1.0 + phi[i][0].abs()),
                "{i}: {dd} {}",
                phi[i][0]
            );
        }
    }

    fn det6(m: &Mat6) -> f64 {
        let mut a = *m;
        let mut det = 1.0;
        for c in 0..6 {
            let piv = (c..6)
                .max_by(|&i, &j| a[i][c].abs().total_cmp(&a[j][c].abs()))
                .unwrap_or(c);
            if a[piv][c] == 0.0 {
                return 0.0;
            }
            if piv != c {
                a.swap(piv, c);
                det = -det;
            }
            det *= a[c][c];
            for r in c + 1..6 {
                let f = a[r][c] / a[c][c];
                for k in c..6 {
                    a[r][k] -= f * a[c][k];
                }
            }
        }
        det
    }

    #[test]
    fn with_no_tracking_the_covariance_is_the_stm_propagation_of_the_entry_and_the_burn() {
        let o = run_nav("process_q_acc = 0.0\n", vec![NavSource::Inertial], 7200.0);
        let rows = &o.budget.rows;
        let all = rows
            .iter()
            .find(|r| r.source.starts_with("everything above together"))
            .unwrap();
        // The final sigma is that row; the burn and the entry rows are smaller than the sum.
        assert!((o.budget.exit_sigma_pos_m - all.sigma).abs() < 1e-6 * all.sigma);
        let entry_row = rows
            .iter()
            .find(|r| r.source.starts_with("entry covariance"))
            .unwrap();
        let burn_row = rows
            .iter()
            .find(|r| r.source.starts_with("TLI burn error"))
            .unwrap();
        assert!(
            burn_row.sigma > entry_row.sigma,
            "{} {}",
            burn_row.sigma,
            entry_row.sigma
        );
        assert!(all.sigma <= entry_row.sigma + burn_row.sigma + 1e-6);
        assert!(all.sigma >= entry_row.sigma.max(burn_row.sigma) * 0.999);
        assert_eq!(
            o.budget.limiting_source.as_deref(),
            Some("TLI burn error (untracked growth)")
        );
        assert_eq!(o.exit.t_s, 7200.0);
    }

    #[test]
    fn range_tracking_shrinks_the_line_of_sight_and_leaves_the_plane_of_the_sky() {
        let ground = "ground_range_sigma_m = 10.0\nground_range_rate_sigma_mps = 0.001\nground_interval_s = 3600.0\n";
        let free = run_nav("", vec![NavSource::Inertial], 4.0 * 3600.0);
        let tracked = run_nav(ground, vec![NavSource::GroundTracking], 4.0 * 3600.0);
        assert!(tracked.budget.exit_sigma_pos_m < free.budget.exit_sigma_pos_m);
        // A tenth of the duty is worse than continuous tracking.
        let half = {
            let phase = ctor(&model(ground)).unwrap();
            let ctx = ThreadCtx::new("2028-01-10T00:00:00Z", 3);
            let mut pctx = ctx.phase_ctx(0, "tli", 4.0 * 3600.0);
            pctx.nav = vec![NavSource::GroundTracking];
            pctx.ground_duty = Some(0.1);
            phase.run(&entry(), &ctx, &pctx).unwrap()
        };
        assert!(half.budget.exit_sigma_pos_m >= tracked.budget.exit_sigma_pos_m);
        assert!(tracked
            .budget
            .rows
            .iter()
            .any(|r| r.source.contains("plane of the sky is not observed")));
    }

    #[test]
    fn a_phase_that_lists_a_source_the_model_lacks_is_refused_and_unknown_keys_too() {
        let phase = ctor(&model("")).unwrap();
        let ctx = ThreadCtx::new("2028-01-10T00:00:00Z", 3);
        let mut pctx = ctx.phase_ctx(0, "tli", 3600.0);
        pctx.nav = vec![NavSource::GroundTracking];
        let e = phase.run(&entry(), &ctx, &pctx).err().unwrap();
        assert!(e.contains("ground_range_sigma_m"), "{e}");
        pctx.nav = vec![NavSource::GnssSsv];
        let e = phase.run(&entry(), &ctx, &pctx).err().unwrap();
        assert!(e.contains("ssv_uere_m"), "{e}");
        assert!(ctor(&model("surprise = 1\n"))
            .err()
            .unwrap()
            .contains("unknown model key"));
        let mut e = entry();
        e.frame = Frame::Mci;
        pctx.nav = vec![NavSource::Inertial];
        assert!(phase
            .run(&e, &ctx, &pctx)
            .err()
            .unwrap()
            .contains("GCRF entry"));
    }

    #[test]
    fn the_elements_of_a_circular_orbit_come_back_and_an_unbound_one_is_refused() {
        let x = super::super::orbit::circular_state(400_000.0, 51.6, 30.0, 70.0);
        let el = elements(&x).unwrap();
        assert!((el[0] - 6778.137).abs() < 1e-6 && el[1] < 1e-9 && (el[2] - 51.6).abs() < 1e-9);
        let mut hyper = x;
        hyper[3] *= 2.0;
        hyper[4] *= 2.0;
        hyper[5] *= 2.0;
        assert!(elements(&hyper).err().unwrap().contains("not bound"));
    }

    #[test]
    fn the_thread_kernel_serves_the_moon_inside_its_window_and_the_series_outside() {
        let kernel = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("tests/fixtures/mission_thread/de440s_moon_2028-01-01_2028-04-01.bsp");
        let phase = ctor(&model("")).unwrap();
        let ctx = ThreadCtx::new("2028-01-10T00:00:00Z", 3)
            .with_moon_kernel_file(&kernel)
            .unwrap();
        let mut pctx = ctx.phase_ctx(0, "tli", 7200.0);
        pctx.nav = vec![NavSource::Inertial];
        let inside = phase.run(&entry(), &ctx, &pctx).unwrap();
        assert!(inside
            .events
            .iter()
            .any(|e| e.what.starts_with("Moon from the thread's kernel")));
        // The same phase a year later is outside the cut and says so.
        let late = ThreadCtx::new("2029-01-10T00:00:00Z", 3)
            .with_moon_kernel_file(&kernel)
            .unwrap();
        let outside = phase
            .run(&entry(), &late, &late.phase_ctx(0, "tli", 7200.0))
            .unwrap();
        assert!(outside
            .events
            .iter()
            .any(|e| e.what.contains("analytic series (no kernel covers")));
    }

    #[test]
    fn gnss_ssv_fixes_are_applied_where_the_sweep_finds_four_signals() {
        let extra = "ssv_uere_m = 5.0\nssv_window_s = 7200.0\nssv_step_min = 10.0\n";
        let free = run_nav("", vec![NavSource::Inertial], 7200.0);
        let aided = run_nav(extra, vec![NavSource::GnssSsv], 7200.0);
        assert!(
            aided.events.iter().any(|e| e.what.starts_with("gnss-ssv")),
            "{:?}",
            aided.events
        );
        // In low Earth orbit the fixes are plentiful: the aided sigma is far below the free one.
        assert!(
            aided.budget.exit_sigma_pos_m < 0.5 * free.budget.exit_sigma_pos_m,
            "{} {}",
            aided.budget.exit_sigma_pos_m,
            free.budget.exit_sigma_pos_m
        );
    }
}
