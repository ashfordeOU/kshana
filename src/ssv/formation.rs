// SPDX-License-Identifier: AGPL-3.0-only
//! Relative navigation of a multi-spacecraft formation in a highly elliptical orbit from GNSS pseudoranges (item H1.6).
//!
//! A chief and one or more deputies share an orbit, offset in true anomaly. Every craft runs the absolute filter of
//! [`super::nav`] on its own pseudoranges. The deputy's position relative to the chief is then estimated two ways: by
//! subtracting the independent absolute estimates, and by a relative filter that uses single-differenced pseudoranges of the
//! signals both craft track. Differencing removes what the two links share (the transmitter's errors and the bulk of the
//! medium's excess delay), and the relative dynamics are the difference of two nonlinear trajectories, so the relative
//! filter also coasts well when too few signals are in view. MODELLED: the same simulated truth, forces and noise as
//! `nav`; no flight formation data.

use super::geom::{self, V3};
use super::nav::{
    accel, measurements, rk4, signal_table, Ekf, NavConfig, N, SRP_PRESSURE, SRP_UNIT,
};
use super::sweep::{LinkEffects, UserOrbit};
use crate::portable_distr::{Distribution, StandardNormal};
use crate::portable_math::PortableFloat;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::Serialize;

const R: usize = 8;

/// The formation run's inputs.
#[derive(Clone, Debug)]
pub struct FormationConfig {
    /// The chief's navigation setup (orbit, signals, receiver, noise, seed).
    pub nav: NavConfig,
    /// True-anomaly offsets of the deputies from the chief, degrees.
    pub offsets_deg: Vec<f64>,
    /// Relative-acceleration process noise of the relative filter, m^2/s^3.
    pub rel_accel_psd: f64,
}

/// One deputy's relative-navigation errors.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DeputyResult {
    /// True-anomaly offset, degrees.
    pub offset_deg: f64,
    /// Mean chief-to-deputy distance, km.
    pub baseline_km: f64,
    /// Epochs on which both craft tracked at least four signals in common.
    pub epochs_common_4: usize,
    /// Mean number of signals tracked in common.
    pub common_signals_mean: f64,
    /// RMS relative position error from subtracting the absolute estimates, m.
    pub rel_rms_from_absolute_m: f64,
    /// RMS relative position error of the single-difference relative filter, m.
    pub rel_rms_filter_m: f64,
    /// RMS relative velocity error of the relative filter, m/s.
    pub rel_vel_rms_filter_ms: f64,
    /// RMS relative position error from subtracting the absolute estimates over the part of the run above 20,000 km
    /// altitude, m.
    pub rel_rms_from_absolute_above_gnss_m: Option<f64>,
    /// RMS relative position error of the relative filter over the part of the run above 20,000 km altitude, m.
    pub rel_rms_filter_above_gnss_m: Option<f64>,
    /// RMS absolute position error of the deputy's own filter, m.
    pub abs_rms_m: f64,
}

/// The formation run's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FormationResult {
    /// Epochs.
    pub epochs: usize,
    /// RMS absolute position error of the chief, m.
    pub chief_abs_rms_m: f64,
    /// One entry per deputy.
    pub deputies: Vec<DeputyResult>,
}

struct Craft {
    tr: V3,
    tv: V3,
    srp: f64,
    clock_b: f64,
    clock_d: f64,
    ekf: Ekf,
}

fn truth_state(o: &UserOrbit) -> (V3, V3) {
    (
        o.position(0.0),
        geom::sub(o.position(0.5), o.position(-0.5)),
    )
}

fn new_craft(
    cfg: &NavConfig,
    o: &UserOrbit,
    srp_scale: f64,
    clock_b: f64,
    g: &mut dyn FnMut() -> f64,
) -> Craft {
    let (tr, tv) = truth_state(o);
    let mut ekf = Ekf {
        x: [0.0; N],
        p: [[0.0; N]; N],
    };
    for i in 0..3 {
        ekf.x[i] = tr[i] + cfg.init_pos_sigma_m * g();
        ekf.x[3 + i] = tv[i] + cfg.init_vel_sigma_ms * g();
        ekf.p[i][i] = cfg.init_pos_sigma_m * cfg.init_pos_sigma_m;
        ekf.p[3 + i][3 + i] = cfg.init_vel_sigma_ms * cfg.init_vel_sigma_ms;
    }
    ekf.p[6][6] = 3000.0 * 3000.0;
    ekf.p[7][7] = 1.0;
    ekf.p[8][8] = 25.0;
    Craft {
        tr,
        tv,
        srp: cfg.srp_area_to_mass * srp_scale * SRP_PRESSURE,
        clock_b,
        clock_d: 0.3,
        ekf,
    }
}

struct RelEkf {
    x: [f64; R],
    p: [[f64; R]; R],
}

impl RelEkf {
    fn predict(&mut self, t: f64, dt: f64, rc: V3, vc: V3, srp: f64, cfg: &FormationConfig) {
        let h = 500.0;
        let mut f = [[0.0; R]; R];
        for i in 0..3 {
            f[i][3 + i] = 1.0;
        }
        for j in 0..3 {
            let (mut rp, mut rm) = (rc, rc);
            rp[j] += h;
            rm[j] -= h;
            let (ap, am) = (accel(rp, t, srp, false), accel(rm, t, srp, false));
            for i in 0..3 {
                f[3 + i][j] = (ap[i] - am[i]) / (2.0 * h);
            }
        }
        f[6][7] = 1.0;
        let mut phi = [[0.0; R]; R];
        for i in 0..R {
            phi[i][i] = 1.0;
            for j in 0..R {
                phi[i][j] +=
                    f[i][j] * dt + (0..R).map(|k| f[i][k] * f[k][j]).sum::<f64>() * dt * dt / 2.0;
            }
        }
        let add = |a: V3, b: V3| [a[0] + b[0], a[1] + b[1], a[2] + b[2]];
        let (rd, vd) = rk4(
            add(rc, [self.x[0], self.x[1], self.x[2]]),
            add(vc, [self.x[3], self.x[4], self.x[5]]),
            t,
            dt,
            srp,
            false,
        );
        let (rc2, vc2) = rk4(rc, vc, t, dt, srp, false);
        for i in 0..3 {
            self.x[i] = rd[i] - rc2[i];
            self.x[3 + i] = vd[i] - vc2[i];
        }
        self.x[6] += self.x[7] * dt;
        let mut p = mm(&mm(&phi, &self.p), &tr(&phi));
        let q = cfg.rel_accel_psd;
        for i in 0..3 {
            p[i][i] += q * dt * dt * dt / 3.0;
            p[3 + i][3 + i] += q * dt;
            p[i][3 + i] += q * dt * dt / 2.0;
            p[3 + i][i] += q * dt * dt / 2.0;
        }
        let qd = 2.0 * cfg.nav.clock_drift_walk * cfg.nav.clock_drift_walk;
        p[6][6] += qd * dt * dt * dt / 3.0;
        p[7][7] += qd * dt;
        p[6][7] += qd * dt * dt / 2.0;
        p[7][6] += qd * dt * dt / 2.0;
        self.p = p;
    }

    fn update(&mut self, rc: V3, sat: V3, z_sd: f64, sigma: f64) {
        let dr = [self.x[0], self.x[1], self.x[2]];
        let rd = [rc[0] + dr[0], rc[1] + dr[1], rc[2] + dr[2]];
        let (dd, dc) = (geom::sub(rd, sat), geom::sub(rc, sat));
        let (nd, nc) = (geom::norm(dd), geom::norm(dc));
        let mut hrow = [0.0; R];
        for i in 0..3 {
            hrow[i] = dd[i] / nd;
        }
        hrow[6] = 1.0;
        let innov = z_sd - (nd - nc + self.x[6]);
        let ph: Vec<f64> = (0..R)
            .map(|i| (0..R).map(|j| self.p[i][j] * hrow[j]).sum())
            .collect();
        let s: f64 = (0..R).map(|i| hrow[i] * ph[i]).sum::<f64>() + sigma * sigma;
        if innov * innov > 25.0 * s {
            return;
        }
        for i in 0..R {
            self.x[i] += ph[i] / s * innov;
            for j in 0..R {
                self.p[i][j] -= ph[i] * ph[j] / s;
            }
        }
        for i in 0..R {
            for j in (i + 1)..R {
                let m = 0.5 * (self.p[i][j] + self.p[j][i]);
                self.p[i][j] = m;
                self.p[j][i] = m;
            }
        }
    }
}

fn mm(a: &[[f64; R]; R], b: &[[f64; R]; R]) -> [[f64; R]; R] {
    let mut c = [[0.0; R]; R];
    for i in 0..R {
        for k in 0..R {
            for j in 0..R {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    c
}

fn tr(a: &[[f64; R]; R]) -> [[f64; R]; R] {
    let mut t = [[0.0; R]; R];
    for i in 0..R {
        for j in 0..R {
            t[j][i] = a[i][j];
        }
    }
    t
}

#[derive(Default)]
struct Tally {
    n: usize,
    abs_sq: f64,
    rel_abs_sq: f64,
    rel_f_sq: f64,
    relv_sq: f64,
    hi_n: usize,
    hi_abs_sq: f64,
    hi_f_sq: f64,
    common_sum: f64,
    common4: usize,
    baseline_sum: f64,
}

/// Run the formation.
pub fn run_formation(
    cfg: &FormationConfig,
    fx: &dyn LinkEffects,
) -> Result<FormationResult, String> {
    let nav = &cfg.nav;
    if cfg.offsets_deg.is_empty() {
        return Err(crate::terr!("e-ssv-formation-formation-needs-at-least-one"));
    }
    if !(nav.duration_min > 0.0 && nav.step_s > 0.0) {
        return Err(crate::terr!("e-ssv-formation-duration-min-and-step-must"));
    }
    let sats = signal_table(nav)?;
    let mut rng = ChaCha8Rng::seed_from_u64(nav.seed);
    let mut g = move || -> f64 { StandardNormal.sample(&mut rng) };

    let mut chief = new_craft(nav, &nav.orbit, 1.0, 1000.0, &mut g);
    let mut deputies: Vec<Craft> = Vec::new();
    for (i, off) in cfg.offsets_deg.iter().enumerate() {
        let mut o = nav.orbit;
        o.true_anomaly_deg += off;
        // A few percent different area-to-mass, and its own clock.
        deputies.push(new_craft(
            nav,
            &o,
            1.0 + 0.03 * (i as f64 + 1.0),
            -500.0 - 300.0 * i as f64,
            &mut g,
        ));
    }
    let mut rels: Vec<RelEkf> = deputies
        .iter()
        .map(|d| {
            let mut x = [0.0; R];
            for (i, xi) in x.iter_mut().enumerate().take(6) {
                *xi = d.ekf.x[i] - chief.ekf.x[i];
            }
            let mut p = [[0.0; R]; R];
            for i in 0..3 {
                p[i][i] = 2.0 * nav.init_pos_sigma_m * nav.init_pos_sigma_m;
                p[3 + i][3 + i] = 2.0 * nav.init_vel_sigma_ms * nav.init_vel_sigma_ms;
            }
            p[6][6] = 2.0 * 3000.0 * 3000.0;
            p[7][7] = 2.0;
            RelEkf { x, p }
        })
        .collect();
    let mut tallies: Vec<Tally> = deputies.iter().map(|_| Tally::default()).collect();
    let mut chief_sq = 0.0;
    let n_epochs = (nav.duration_min * 60.0 / nav.step_s).round() as usize + 1;
    let sigma_of =
        |cn0: f64| (nav.sigma_35_dbhz_m * 10f64.ppowf((35.0 - cn0) / 20.0)).clamp(0.3, 100.0);

    for k in 0..n_epochs {
        let t = k as f64 * nav.step_s;
        if k > 0 {
            let t0 = t - nav.step_s;
            let n_sub = (nav.step_s / 20.0).ceil().max(1.0) as usize;
            let h = nav.step_s / n_sub as f64;
            for c in std::iter::once(&mut chief).chain(deputies.iter_mut()) {
                for s in 0..n_sub {
                    let (a, b) = rk4(c.tr, c.tv, t0 + s as f64 * h, h, c.srp, true);
                    c.tr = a;
                    c.tv = b;
                }
                c.clock_b += c.clock_d * nav.step_s;
                c.clock_d += nav.clock_drift_walk * nav.step_s.sqrt() * g();
            }
            let n_f = (nav.step_s / 30.0).ceil().max(1.0) as usize;
            let hf = nav.step_s / n_f as f64;
            for s in 0..n_f {
                let ts = t0 + s as f64 * hf;
                let rc = [chief.ekf.x[0], chief.ekf.x[1], chief.ekf.x[2]];
                let vc = [chief.ekf.x[3], chief.ekf.x[4], chief.ekf.x[5]];
                let srp = chief.ekf.x[8] * SRP_UNIT;
                for r in rels.iter_mut() {
                    r.predict(ts, hf, rc, vc, srp, cfg);
                }
                chief.ekf.predict(ts, hf, nav);
                for d in deputies.iter_mut() {
                    d.ekf.predict(ts, hf, nav);
                }
            }
        }
        // Measurements: every craft's own links; absolute updates; then the single differences.
        let mc = measurements(nav, &sats, t, chief.tr, fx);
        let zc: Vec<(usize, f64, f64, V3)> = mc
            .iter()
            .map(|m| {
                let sg = sigma_of(m.cn0);
                (
                    m.id,
                    m.range_m + chief.clock_b + m.delay_m + sg * g(),
                    sg,
                    m.sat,
                )
            })
            .collect();
        for (_, z, sg, sat) in &zc {
            chief.ekf.update(*sat, *z, *sg);
        }
        let rc_post = [chief.ekf.x[0], chief.ekf.x[1], chief.ekf.x[2]];
        let alt = geom::norm(chief.tr) - super::constellations::RE_BOOKLET_M;
        let ce = geom::sub(rc_post, chief.tr);
        chief_sq += geom::dot(ce, ce);
        for (di, d) in deputies.iter_mut().enumerate() {
            let md = measurements(nav, &sats, t, d.tr, fx);
            let mut common = 0usize;
            for m in &md {
                let sg = sigma_of(m.cn0);
                let z = m.range_m + d.clock_b + m.delay_m + sg * g();
                d.ekf.update(m.sat, z, sg);
                if let Some((_, zcv, sgc, _)) = zc.iter().find(|c| c.0 == m.id) {
                    common += 1;
                    rels[di].update(rc_post, m.sat, z - zcv, (sg * sg + sgc * sgc).sqrt());
                }
            }
            let tl = &mut tallies[di];
            tl.n += 1;
            tl.common_sum += common as f64;
            if common >= 4 {
                tl.common4 += 1;
            }
            let truth_rel = geom::sub(d.tr, chief.tr);
            tl.baseline_sum += geom::norm(truth_rel);
            let est_abs = [
                d.ekf.x[0] - chief.ekf.x[0],
                d.ekf.x[1] - chief.ekf.x[1],
                d.ekf.x[2] - chief.ekf.x[2],
            ];
            let e_abs = geom::sub(est_abs, truth_rel);
            let e_f = geom::sub([rels[di].x[0], rels[di].x[1], rels[di].x[2]], truth_rel);
            let truth_relv = geom::sub(d.tv, chief.tv);
            let e_v = geom::sub([rels[di].x[3], rels[di].x[4], rels[di].x[5]], truth_relv);
            let da = geom::sub([d.ekf.x[0], d.ekf.x[1], d.ekf.x[2]], d.tr);
            tl.abs_sq += geom::dot(da, da);
            tl.rel_abs_sq += geom::dot(e_abs, e_abs);
            tl.rel_f_sq += geom::dot(e_f, e_f);
            tl.relv_sq += geom::dot(e_v, e_v);
            if alt >= 20_000e3 {
                tl.hi_n += 1;
                tl.hi_abs_sq += geom::dot(e_abs, e_abs);
                tl.hi_f_sq += geom::dot(e_f, e_f);
            }
        }
    }
    let n = n_epochs as f64;
    Ok(FormationResult {
        epochs: n_epochs,
        chief_abs_rms_m: (chief_sq / n).sqrt(),
        deputies: tallies
            .iter()
            .zip(&cfg.offsets_deg)
            .map(|(t, off)| DeputyResult {
                offset_deg: *off,
                baseline_km: t.baseline_sum / t.n as f64 / 1000.0,
                epochs_common_4: t.common4,
                common_signals_mean: t.common_sum / t.n as f64,
                rel_rms_from_absolute_m: (t.rel_abs_sq / t.n as f64).sqrt(),
                rel_rms_filter_m: (t.rel_f_sq / t.n as f64).sqrt(),
                rel_vel_rms_filter_ms: (t.relv_sq / t.n as f64).sqrt(),
                rel_rms_from_absolute_above_gnss_m: (t.hi_n > 0)
                    .then(|| (t.hi_abs_sq / t.hi_n as f64).sqrt()),
                rel_rms_filter_above_gnss_m: (t.hi_n > 0)
                    .then(|| (t.hi_f_sq / t.hi_n as f64).sqrt()),
                abs_rms_m: (t.abs_sq / t.n as f64).sqrt(),
            })
            .collect(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ssv::constellations::{Band, Constellation};
    use crate::ssv::pattern::{Axis, NamedAntenna, TxPattern, UserAntenna};
    use crate::ssv::sweep::NoEffects;

    fn cfg(minutes: f64) -> FormationConfig {
        let ants = |b| {
            (
                b,
                vec![
                    UserAntenna::named(&NamedAntenna::BookletHighGain, b, Axis::Nadir),
                    UserAntenna::named(&NamedAntenna::BookletPatch, b, Axis::Zenith),
                ],
            )
        };
        FormationConfig {
            nav: NavConfig {
                orbit: crate::ssv::scenario::preset_orbit("heo").unwrap(),
                duration_min: minutes,
                step_s: 60.0,
                cn0_min_dbhz: 20.0,
                constellations: vec![
                    Constellation::Gps,
                    Constellation::Galileo,
                    Constellation::Glonass,
                    Constellation::Bds,
                ],
                bands: vec![Band::L1, Band::L5],
                antennas: vec![ants(Band::L1), ants(Band::L5)],
                tx: TxPattern::Booklet,
                sigma_35_dbhz_m: 3.0,
                srp_area_to_mass: 0.02,
                init_pos_sigma_m: 1000.0,
                init_vel_sigma_ms: 1.0,
                accel_psd: 1e-11,
                clock_drift_walk: 1e-4,
                seed: 11,
                series_every_epochs: 0,
                beam_override_deg: Vec::new(),
            },
            offsets_deg: vec![0.02, 0.05],
            rel_accel_psd: 1e-13,
        }
    }

    #[test]
    fn differencing_beats_subtracting_absolute_estimates_and_is_deterministic() {
        let a = run_formation(&cfg(240.0), &NoEffects).unwrap();
        let b = run_formation(&cfg(240.0), &NoEffects).unwrap();
        assert_eq!(a, b);
        assert_eq!(a.deputies.len(), 2);
        for d in &a.deputies {
            assert!(d.baseline_km > 1.0, "{d:?}");
            assert!(d.common_signals_mean > 2.0, "{d:?}");
            // The relative filter does at least as well as subtracting two independent absolute fixes.
            assert!(d.rel_rms_filter_m <= d.rel_rms_from_absolute_m, "{d:?}");
        }
    }
}
