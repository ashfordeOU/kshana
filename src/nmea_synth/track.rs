// SPDX-License-Identifier: AGPL-3.0-only
//! The true vessel track: waypoint steering with a rate-of-turn limit, a limit on how
//! quickly the rate of turn builds, a speed change limit, and a current.

use super::config::{TrainingScenario, KN_MPS};
use crate::frames::{wgs84_e2, WGS84_A};
use crate::portable_math::PortableFloat;
use std::f64::consts::PI;

const DEG: f64 = PI / 180.0;
/// Integration sub-steps per epoch.
const SUBSTEPS: usize = 10;

/// The vessel's true state at one epoch.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TruthState {
    /// Seconds from the start of the run.
    pub t_s: f64,
    /// Geodetic latitude, rad.
    pub lat_rad: f64,
    /// Longitude, rad.
    pub lon_rad: f64,
    /// Heading (gyro compass), degrees true in `[0, 360)`.
    pub heading_deg: f64,
    /// Speed through the water, m/s.
    pub stw_mps: f64,
    /// Velocity over ground, north, m/s.
    pub vn_mps: f64,
    /// Velocity over ground, east, m/s.
    pub ve_mps: f64,
    /// Rate of turn, degrees per minute (starboard positive).
    pub rot_deg_per_min: f64,
}

impl TruthState {
    /// Speed over ground, knots.
    pub fn sog_kn(&self) -> f64 {
        self.vn_mps.phypot(self.ve_mps) / KN_MPS
    }
    /// Course over ground, degrees true in `[0, 360)`; the heading when stationary.
    pub fn cog_deg(&self) -> f64 {
        if self.vn_mps.phypot(self.ve_mps) < 0.02 {
            return self.heading_deg;
        }
        wrap360(self.ve_mps.patan2(self.vn_mps) / DEG)
    }
}

/// Wrap an angle to `[0, 360)`.
pub fn wrap360(d: f64) -> f64 {
    let r = d.rem_euclid(360.0);
    if r >= 360.0 {
        0.0
    } else {
        r
    }
}

fn wrap180(d: f64) -> f64 {
    let r = wrap360(d);
    if r > 180.0 {
        r - 360.0
    } else {
        r
    }
}

/// Meridian and prime-vertical radii of curvature at latitude `lat`, m.
pub fn radii(lat_rad: f64) -> (f64, f64) {
    let e2 = wgs84_e2();
    let s = lat_rad.psin();
    let w = 1.0 - e2 * s * s;
    (WGS84_A * (1.0 - e2) / (w * w.sqrt()), WGS84_A / w.sqrt())
}

/// Local north/east offset in metres from `(lat0, lon0)` to `(lat1, lon1)`.
pub fn ne_offset_m(lat0: f64, lon0: f64, lat1: f64, lon1: f64) -> (f64, f64) {
    let lat_m = 0.5 * (lat0 + lat1);
    let (m, n) = radii(lat_m);
    ((lat1 - lat0) * m, wrap_pi(lon1 - lon0) * n * lat_m.pcos())
}

fn wrap_pi(a: f64) -> f64 {
    let mut x = a % (2.0 * PI);
    if x > PI {
        x -= 2.0 * PI;
    } else if x < -PI {
        x += 2.0 * PI;
    }
    x
}

/// Move `(lat, lon)` by `dn` metres north and `de` metres east.
pub fn move_ne(lat: f64, lon: f64, dn: f64, de: f64) -> (f64, f64) {
    let (m, n) = radii(lat);
    let lat2 = lat + dn / m;
    let lon2 = lon + de / (n * lat.pcos().max(1e-6));
    (lat2, wrap_pi(lon2))
}

/// Number of epochs in the run.
pub fn epoch_count(scn: &TrainingScenario) -> usize {
    (scn.scenario.duration_s * scn.scenario.rate_hz).round() as usize + 1
}

/// Generate the whole true track, one state per epoch.
pub fn generate(scn: &TrainingScenario) -> Vec<TruthState> {
    let v = &scn.vessel;
    let dt = 1.0 / scn.scenario.rate_hz;
    let n = epoch_count(scn);
    let h = dt / SUBSTEPS as f64;

    let (mut lat, mut lon) = (v.lat_deg * DEG, v.lon_deg * DEG);
    let first = scn.waypoints.first();
    let mut heading = v.heading_deg.map(wrap360).unwrap_or_else(|| {
        first.map_or(0.0, |w| {
            let (dn, de) = ne_offset_m(lat, lon, w.lat_deg * DEG, w.lon_deg * DEG);
            wrap360(de.patan2(dn) / DEG)
        })
    });
    let mut stw = v.speed_kn * KN_MPS;
    let mut rot = 0.0_f64; // deg/s
    let rot_max = v.max_rot_deg_per_min / 60.0;
    let rot_acc = v.max_rot_accel_deg_per_s2;
    let acc = v.max_accel_kn_per_min / 60.0 * KN_MPS;
    let cur_set = scn.environment.current_set_deg * DEG;
    let cur_n = scn.environment.current_speed_kn * KN_MPS * cur_set.pcos();
    let cur_e = scn.environment.current_speed_kn * KN_MPS * cur_set.psin();

    // Speed target of each leg: the waypoint's own, else the previous leg's, else the
    // starting speed.
    let mut leg_speed = Vec::with_capacity(scn.waypoints.len());
    let mut prev = v.speed_kn;
    for w in &scn.waypoints {
        prev = w.speed_kn.unwrap_or(prev);
        leg_speed.push(prev * KN_MPS);
    }

    let mut wp = 0usize;
    let mut finished = scn.waypoints.is_empty();
    let mut out = Vec::with_capacity(n);
    for k in 0..n {
        let (hs, hc) = (heading * DEG).psin_cos();
        let (vn, ve) = (stw * hc + cur_n, stw * hs + cur_e);
        out.push(TruthState {
            t_s: k as f64 * dt,
            lat_rad: lat,
            lon_rad: lon,
            heading_deg: heading,
            stw_mps: stw,
            vn_mps: vn,
            ve_mps: ve,
            rot_deg_per_min: rot * 60.0,
        });
        for _ in 0..SUBSTEPS {
            // Steering and speed target.
            let mut want_speed = leg_speed.last().copied().unwrap_or(stw);
            let mut want_rot = 0.0;
            if !finished {
                let w = &scn.waypoints[wp];
                let (dn, de) = ne_offset_m(lat, lon, w.lat_deg * DEG, w.lon_deg * DEG);
                let dist = dn.phypot(de);
                let last = wp + 1 == scn.waypoints.len();
                let turn_r = if rot_max > 0.0 {
                    stw / (rot_max * DEG)
                } else {
                    0.0
                };
                let arrive = if last {
                    30.0_f64.max(0.1 * turn_r)
                } else {
                    100.0_f64.max(0.7 * turn_r)
                };
                if dist < arrive {
                    if last {
                        finished = true;
                    } else {
                        wp += 1;
                    }
                } else {
                    let bearing = wrap360(de.patan2(dn) / DEG);
                    want_rot = (wrap180(bearing - heading) / 20.0).clamp(-rot_max, rot_max);
                }
                want_speed = leg_speed[wp.min(leg_speed.len() - 1)];
                if last && v.stop_at_end {
                    want_speed = want_speed.min((2.0 * acc * (dist - 30.0).max(0.0)).sqrt());
                }
            } else if v.stop_at_end {
                want_speed = 0.0;
            }
            // Rate of turn builds at a limited rate.
            let dr = (want_rot - rot).clamp(-rot_acc * h, rot_acc * h);
            rot += dr;
            heading = wrap360(heading + rot * h);
            let ds = (want_speed - stw).clamp(-acc * h, acc * h);
            stw = (stw + ds).max(0.0);
            let (hs, hc) = (heading * DEG).psin_cos();
            let (vn, ve) = (stw * hc + cur_n, stw * hs + cur_e);
            let (la, lo) = move_ne(lat, lon, vn * h, ve * h);
            lat = la;
            lon = lo;
        }
    }
    out
}

/// The state at time `t` (seconds), interpolated between epochs and held at the ends.
pub fn at(track: &[TruthState], t: f64) -> TruthState {
    let dt = track[1].t_s - track[0].t_s;
    let x = (t / dt).clamp(0.0, (track.len() - 1) as f64);
    let i = (x.floor() as usize).min(track.len() - 2);
    let f = x - i as f64;
    let (a, b) = (&track[i], &track[i + 1]);
    let mix = |p: f64, q: f64| p + f * (q - p);
    TruthState {
        t_s: t.clamp(0.0, track[track.len() - 1].t_s),
        lat_rad: mix(a.lat_rad, b.lat_rad),
        lon_rad: a.lon_rad + f * wrap_pi(b.lon_rad - a.lon_rad),
        heading_deg: wrap360(a.heading_deg + f * wrap180(b.heading_deg - a.heading_deg)),
        stw_mps: mix(a.stw_mps, b.stw_mps),
        vn_mps: mix(a.vn_mps, b.vn_mps),
        ve_mps: mix(a.ve_mps, b.ve_mps),
        rot_deg_per_min: mix(a.rot_deg_per_min, b.rot_deg_per_min),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scn(extra: &str) -> TrainingScenario {
        TrainingScenario::parse(&format!(
            r#"
[scenario]
name = "t"
start_utc = "2026-05-14T06:00:00Z"
duration_s = 1200
[vessel]
lat_deg = 55.0
lon_deg = 3.0
speed_kn = 12
{extra}
"#
        ))
        .unwrap()
    }

    #[test]
    fn steady_course_matches_speed_and_heading() {
        let s = scn("heading_deg = 90\n");
        let t = generate(&s);
        assert_eq!(t.len(), 1201);
        let last = t.last().unwrap();
        // 12 kn due east for 1200 s is 7408 m.
        let (dn, de) = ne_offset_m(t[0].lat_rad, t[0].lon_rad, last.lat_rad, last.lon_rad);
        assert!((de - 12.0 * KN_MPS * 1200.0).abs() < 5.0, "de = {de}");
        assert!(dn.abs() < 20.0, "dn = {dn}");
        assert!((last.sog_kn() - 12.0).abs() < 1e-6);
    }

    #[test]
    fn turn_rate_and_acceleration_stay_within_limits() {
        let s =
            scn("heading_deg = 0\n\n[[waypoint]]\nlat_deg = 55.0\nlon_deg = 3.2\nspeed_kn = 18\n");
        let t = generate(&s);
        let max_rot = t
            .iter()
            .map(|s| s.rot_deg_per_min.abs())
            .fold(0.0, f64::max);
        assert!(max_rot <= 30.0 + 1e-6, "rate of turn {max_rot}");
        assert!(max_rot > 25.0, "the 90 degree turn should reach the limit");
        let max_acc = t
            .windows(2)
            .map(|w| ((w[1].stw_mps - w[0].stw_mps) / KN_MPS * 60.0).abs())
            .fold(0.0, f64::max);
        assert!(max_acc <= 6.0 + 1e-6, "acceleration {max_acc} kn/min");
        // The vessel ends up heading for the waypoint (east) at the new speed.
        let end = t.last().unwrap();
        assert!((end.stw_mps / KN_MPS - 18.0).abs() < 0.01);
    }

    #[test]
    fn current_separates_ground_from_water_speed() {
        let s =
            scn("heading_deg = 90\n\n[environment]\ncurrent_speed_kn = 2\ncurrent_set_deg = 90\n");
        let t = generate(&s);
        assert!((t[10].sog_kn() - 14.0).abs() < 1e-6);
        assert!((t[10].stw_mps / KN_MPS - 12.0).abs() < 1e-6);
    }

    #[test]
    fn stop_at_end_comes_to_rest_near_the_last_waypoint() {
        let mut s = scn(
            "heading_deg = 90\nstop_at_end = true\n\n[[waypoint]]\nlat_deg = 55.0\nlon_deg = 3.05\n",
        );
        s.scenario.duration_s = 1500.0;
        let t = generate(&s);
        let end = t.last().unwrap();
        assert!(end.stw_mps < 0.1, "still moving at {}", end.stw_mps);
        let (dn, de) = ne_offset_m(end.lat_rad, end.lon_rad, 55.0 * DEG, 3.05 * DEG);
        assert!(dn.phypot(de) < 150.0, "stopped {} m short", dn.phypot(de));
    }

    #[test]
    fn interpolation_is_between_epochs() {
        let s = scn("heading_deg = 90\n");
        let t = generate(&s);
        let mid = at(&t, 10.5);
        assert!(mid.lon_rad > t[10].lon_rad && mid.lon_rad < t[11].lon_rad);
        assert_eq!(at(&t, -5.0).lon_rad, t[0].lon_rad);
    }
}
