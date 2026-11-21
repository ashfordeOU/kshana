// SPDX-License-Identifier: AGPL-3.0-only
//! Signal dynamics seen by a receiver on a GEO, GTO, HEO, transfer or low orbit.
//!
//! For every GNSS satellite of the ICG booklet's constellations ([`crate::ssv::constellations`])
//! whose line of sight to the user is not blocked by the Earth and its 50 km atmosphere and lies
//! within `max_off_boresight_deg` of the satellite's nadir boresight (90 degrees: the whole
//! hemisphere the antenna faces, sidelobes included; the booklet's main lobe is about 23 degrees),
//! the range `ρ(t)` is sampled at `t ± h` and `t ± 2h` and differentiated by central differences to
//! give the range rate, its rate and its jerk. At the carrier frequency `f` these are the Doppler
//! `−ρ̇·f/c`, the Doppler rate `−ρ̈·f/c` and its derivative `−ρ⃛·f/c`, the quantities a tracking
//! loop and an acquisition search must cover. Both orbits are two-body and inertial; light time
//! and the receiver's own clock drift are not included (a clock frequency offset adds
//! `f·Δf/f` to every Doppler alike).
//!
//! High-dynamics presets add to the `gnss-ssv` ones ([`crate::ssv::scenario::preset_orbit`]):
//! `gto` (perigee 250 km, apogee 35,786 km, inclination 27 degrees) and `heo-perigee` (the HEO
//! orbit started 30 minutes before perigee), so the fastest part of a pass is sampled finely, and
//! the two Magnetospheric Multiscale orbits `mms-1` (1.2 × 12 Earth radii) and `mms-2b`
//! (1.2 × 25 Earth radii), started at apogee ([`super::mms`]).
//!
//! MODELLED: two-body orbits and booklet constellations; no signal-power cut is applied here (the
//! [`super::bench`] pairs these figures with the link-budget availability).

use crate::portable_math::PortableFloat;
use crate::ssv::constellations::{self, Band, Constellation, C_LIGHT};
use crate::ssv::geom;
use crate::ssv::sweep::UserOrbit;
use serde::Serialize;

/// The honesty label of every dynamics report.
pub const LABEL: &str = "MODELLED: two-body user and satellite orbits from the ICG booklet's tables, geometric \
visibility only (Earth and 50 km atmosphere blocking, a stated off-boresight limit), central differences of the range; \
light time and receiver clock drift are not included.";

/// The orbit presets this module knows, beyond `gnss-ssv`'s.
pub const PRESETS: &[&str] = &[
    "leo",
    "meo",
    "geo",
    "gto",
    "heo",
    "heo-perigee",
    "mms-1",
    "mms-2b",
    "lunar-transfer",
];

/// A preset orbit by name.
pub fn preset(name: &str) -> Option<UserOrbit> {
    match name {
        "gto" => {
            let rp = 6378.0 + 250.0;
            let ra = 6378.0 + 35_786.0;
            Some(UserOrbit {
                a_km: (rp + ra) / 2.0,
                e: (ra - rp) / (ra + rp),
                i_deg: 27.0,
                raan_deg: 0.0,
                argp_deg: 178.0,
                true_anomaly_deg: 0.0,
            })
        }
        "heo-perigee" => {
            let mut o = crate::ssv::scenario::preset_orbit("heo")?;
            // Thirty minutes before perigee: step the mean anomaly back and recover the true anomaly.
            let n = 2.0 * std::f64::consts::PI / (o.period_min() * 60.0);
            let m = -n * 1800.0;
            let ea = constellations::kepler_e(m, o.e);
            let nu = 2.0 * (((1.0 + o.e) / (1.0 - o.e)).sqrt() * (ea / 2.0).ptan()).patan();
            o.true_anomaly_deg = nu.to_degrees();
            Some(o)
        }
        "mms-1" => Some(super::mms::orbit(1.2, 12.0)),
        "mms-2b" => Some(super::mms::orbit(1.2, 25.0)),
        other => crate::ssv::scenario::preset_orbit(other),
    }
}

/// Receiver tracking limits to check against.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize)]
pub struct Limits {
    /// Largest Doppler the acquisition search covers, Hz.
    pub max_doppler_hz: Option<f64>,
    /// Largest Doppler rate the loops track, Hz/s.
    pub max_doppler_rate_hz_s: Option<f64>,
}

/// The dynamics run's inputs.
#[derive(Clone, Debug)]
pub struct Config {
    /// User orbit.
    pub orbit: UserOrbit,
    /// Duration, s.
    pub duration_s: f64,
    /// Step, s.
    pub step_s: f64,
    /// Constellations.
    pub constellations: Vec<Constellation>,
    /// Band (its carrier per constellation).
    pub band: Band,
    /// Visibility: largest angle off the satellite's nadir boresight, degrees.
    pub max_off_boresight_deg: f64,
    /// Limits to check.
    pub limits: Limits,
}

/// Minimum, largest magnitude and 95th percentile of the magnitude of one quantity.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Envelope {
    /// Smallest signed value.
    pub min: f64,
    /// Largest signed value.
    pub max: f64,
    /// 95th percentile of the magnitude.
    pub p95_abs: f64,
    /// Largest magnitude.
    pub max_abs: f64,
}

fn envelope(v: &mut [f64]) -> Option<Envelope> {
    if v.is_empty() {
        return None;
    }
    let min = v.iter().copied().fold(f64::INFINITY, f64::min);
    let max = v.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    let mut a: Vec<f64> = v.iter().map(|x| x.abs()).collect();
    a.sort_by(f64::total_cmp);
    let k = ((0.95 * (a.len() - 1) as f64).round()) as usize;
    Some(Envelope {
        min,
        max,
        p95_abs: a[k],
        max_abs: a[a.len() - 1],
    })
}

/// The dynamics report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// The orbit.
    pub orbit: UserOrbit,
    /// Perigee and apogee altitude above 6,378 km, km.
    pub perigee_alt_km: f64,
    /// Apogee altitude, km.
    pub apogee_alt_km: f64,
    /// Band.
    pub band: Band,
    /// Epochs.
    pub epochs: usize,
    /// Satellite-epoch links in view.
    pub links: usize,
    /// Epochs with no satellite in view.
    pub epochs_with_none: usize,
    /// User speed, m/s (largest).
    pub max_user_speed_m_s: f64,
    /// User gravitational acceleration, m/s² (largest).
    pub max_user_accel_m_s2: f64,
    /// Doppler, Hz.
    pub doppler_hz: Option<Envelope>,
    /// Doppler rate, Hz/s.
    pub doppler_rate_hz_s: Option<Envelope>,
    /// Derivative of the Doppler rate, Hz/s².
    pub doppler_jerk_hz_s2: Option<Envelope>,
    /// The limits checked.
    pub limits: Limits,
    /// Links beyond the Doppler limit.
    pub links_beyond_doppler: usize,
    /// Links beyond the Doppler-rate limit.
    pub links_beyond_doppler_rate: usize,
}

/// Run the dynamics sweep.
pub fn run(cfg: &Config) -> Result<Report, String> {
    if !(cfg.duration_s > 0.0 && cfg.step_s > 0.0) {
        return Err(crate::terr!("e-ssv-sweep-duration-min-and-step-min"));
    }
    let n = (cfg.duration_s / cfg.step_s).round() as usize + 1;
    let h = 2.0;
    let rb = geom::blocking_radius_m();
    let cos_max = cfg.max_off_boresight_deg.to_radians().pcos();
    let mut sats = Vec::new();
    for &c in &cfg.constellations {
        for s in constellations::satellites(c) {
            if let Some(spec) = constellations::signal_for(c, cfg.band, s.class) {
                sats.push((s, spec.freq_hz));
            }
        }
    }
    let (mut dop, mut rate, mut jerk) = (Vec::new(), Vec::new(), Vec::new());
    let mut none = 0usize;
    let (mut vmax, mut amax) = (0.0f64, 0.0f64);
    for k in 0..n {
        let t = k as f64 * cfg.step_s;
        let u = cfg.orbit.position(t);
        let v = geom::scale(
            geom::sub(cfg.orbit.position(t + h), cfg.orbit.position(t - h)),
            1.0 / (2.0 * h),
        );
        vmax = vmax.max(geom::norm(v));
        let r = geom::norm(u);
        amax = amax.max(constellations::MU_BOOKLET / (r * r));
        let mut seen = 0;
        for (s, f) in &sats {
            let sp = s.position(t);
            let bore = geom::scale(geom::unit(sp), -1.0);
            let l = geom::link(sp, bore, u, rb);
            if l.blocked || geom::dot(bore, l.line_of_sight) < cos_max {
                continue;
            }
            seen += 1;
            let rho =
                |dt: f64| geom::norm(geom::sub(cfg.orbit.position(t + dt), s.position(t + dt)));
            let (m2, m1, z, p1, p2) = (rho(-2.0 * h), rho(-h), l.range_m, rho(h), rho(2.0 * h));
            let d1 = (p1 - m1) / (2.0 * h);
            let d2 = (p1 - 2.0 * z + m1) / (h * h);
            let d3 = (p2 - 2.0 * p1 + 2.0 * m1 - m2) / (2.0 * h * h * h);
            let k_hz = -f / C_LIGHT;
            dop.push(k_hz * d1);
            rate.push(k_hz * d2);
            jerk.push(k_hz * d3);
        }
        if seen == 0 {
            none += 1;
        }
    }
    let beyond = |v: &[f64], lim: Option<f64>| match lim {
        Some(l) => v.iter().filter(|x| x.abs() > l).count(),
        None => 0,
    };
    let a = cfg.orbit.a_km;
    Ok(Report {
        schema: "kshana.space-receiver-dynamics/1",
        label: LABEL,
        orbit: cfg.orbit,
        perigee_alt_km: a * (1.0 - cfg.orbit.e) - 6378.0,
        apogee_alt_km: a * (1.0 + cfg.orbit.e) - 6378.0,
        band: cfg.band,
        epochs: n,
        links: dop.len(),
        epochs_with_none: none,
        max_user_speed_m_s: vmax,
        max_user_accel_m_s2: amax,
        links_beyond_doppler: beyond(&dop, cfg.limits.max_doppler_hz),
        links_beyond_doppler_rate: beyond(&rate, cfg.limits.max_doppler_rate_hz_s),
        doppler_hz: envelope(&mut dop),
        doppler_rate_hz_s: envelope(&mut rate),
        doppler_jerk_hz_s2: envelope(&mut jerk),
        limits: cfg.limits,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg(orbit: UserOrbit, duration_s: f64, step_s: f64) -> Config {
        Config {
            orbit,
            duration_s,
            step_s,
            constellations: vec![Constellation::Gps],
            band: Band::L1,
            max_off_boresight_deg: 90.0,
            limits: Limits::default(),
        }
    }

    #[test]
    fn a_leo_user_sees_the_known_gps_doppler_bound() {
        // A LEO user's Doppler is bounded by (v_user + v_sat_radial)·f/c: about 7.5 km/s plus
        // 0.9 km/s, under 45 kHz at L1.
        let r = run(&cfg(preset("leo").unwrap(), 6000.0, 60.0)).unwrap();
        let d = r.doppler_hz.unwrap();
        assert!(d.max_abs > 25_000.0 && d.max_abs < 45_000.0, "{d:?}");
        assert!(r.max_user_speed_m_s > 7400.0 && r.max_user_speed_m_s < 7500.0);
    }

    #[test]
    fn geo_has_small_doppler_and_gto_perigee_large() {
        let geo = run(&cfg(preset("geo").unwrap(), 86_400.0, 600.0)).unwrap();
        let gto = run(&cfg(preset("gto").unwrap(), 4.0 * 3600.0, 30.0)).unwrap();
        let g = geo.doppler_hz.unwrap().max_abs;
        let t = gto.doppler_hz.unwrap().max_abs;
        // A GEO user is nearly at rest against the GNSS satellites (3.9 km/s orbital speed).
        assert!(g < 20_000.0, "{g}");
        assert!(t > g + 10_000.0, "{t} {g}");
        assert!(t > 30_000.0, "{t}");
        assert!(gto.max_user_speed_m_s > 10_000.0);
        assert!(gto.doppler_rate_hz_s.unwrap().max_abs > geo.doppler_rate_hz_s.unwrap().max_abs);
    }

    #[test]
    fn heo_perigee_starts_before_perigee_and_limits_count() {
        let o = preset("heo-perigee").unwrap();
        assert!(
            o.true_anomaly_deg < 0.0 && o.true_anomaly_deg > -180.0,
            "{}",
            o.true_anomaly_deg
        );
        let mut c = cfg(o, 3600.0, 10.0);
        c.limits = Limits {
            max_doppler_hz: Some(5000.0),
            max_doppler_rate_hz_s: Some(1e9),
        };
        let r = run(&c).unwrap();
        assert!(r.links_beyond_doppler > 0);
        assert_eq!(r.links_beyond_doppler_rate, 0);
        assert!(r.links_beyond_doppler <= r.links);
    }

    #[test]
    fn central_differences_agree_with_a_circular_orbit_closed_form() {
        // A satellite-free check: the user's gravitational acceleration on a circular orbit.
        let r = run(&cfg(preset("meo").unwrap(), 600.0, 60.0)).unwrap();
        let rad = (6378.0 + 8000.0) * 1000.0;
        let g = constellations::MU_BOOKLET / (rad * rad);
        assert!((r.max_user_accel_m_s2 - g).abs() < 1e-9 * g);
        let v = (constellations::MU_BOOKLET / rad).sqrt();
        assert!(
            (r.max_user_speed_m_s - v).abs() < 1e-3,
            "{} {v}",
            r.max_user_speed_m_s
        );
    }

    #[test]
    fn every_preset_resolves() {
        for p in PRESETS {
            assert!(preset(p).is_some(), "{p}");
        }
        assert!(preset("mars").is_none());
    }
}
