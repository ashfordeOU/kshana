// SPDX-License-Identifier: AGPL-3.0-only
//! Synthetic vessel NMEA 0183 logs: text only.
//!
//! A deterministic generator of the sentences a ship's receiver and instruments put on a
//! bus (GGA, RMC, VTG, HDT, VHW, ZDA, GSV), with the dynamics of a vessel following a
//! route: a bounded turn rate, a slowly varying speed, a steady current that makes the
//! heading differ from the course, a slowly wandering position error. Optionally a
//! position **drag-off** is applied to what the receiver reports: from an onset the
//! reported position departs from the truth along a stated bearing at a stated rate, and
//! the reported speed and course follow the counterfeit track (a receiver derives them
//! from its own solution), while the fix stays flagged valid. The gyro, the speed log and
//! the sea level are not affected, because they are not the receiver.
//!
//! This writes a file of text. It models no radio signal and transmits nothing. The log
//! is made up to exercise the monitors and to illustrate the format; it is not a
//! measurement.

use super::maritime::en_offset_m;

const WGS84_A: f64 = 6_378_137.0;
const WGS84_E2: f64 = 0.006_694_379_990_14;
const KN_TO_MPS: f64 = 1852.0 / 3600.0;

/// A position drag-off applied to the reported position.
#[derive(Clone, Debug)]
pub struct DragSpec {
    /// Onset, seconds from the start of the log.
    pub onset_s: f64,
    /// Rate at which the drag speeds up, m/s².
    pub accel_mps2: f64,
    /// Drag speed it settles at, m/s.
    pub speed_mps: f64,
    /// Direction of the drag relative to the vessel's course, degrees clockwise (90 =
    /// to starboard).
    pub bearing_rel_deg: f64,
    /// When set, the C/N0 of every tracked satellite is pulled towards this common value
    /// (a single transmitter arrives at near-equal power), dB-Hz.
    pub cn0_common_dbhz: Option<f64>,
    /// Time over which the C/N0 converges from the live values, s.
    pub cn0_ramp_s: f64,
}

/// What to generate.
#[derive(Clone, Debug)]
pub struct VoyageSpec {
    /// Route waypoints `(lat_deg, lon_deg)`; the vessel starts at the first and steers to
    /// each in turn.
    pub route: Vec<(f64, f64)>,
    /// Length of the log, s.
    pub duration_s: f64,
    /// Date of the first epoch `(year, month, day)` and its time of day `(h, m, s)` UTC.
    pub date: (i32, u32, u32),
    /// Start time of day, seconds after midnight UTC.
    pub start_tod_s: f64,
    /// Speed over ground the vessel makes good, kn.
    pub sog_kn: f64,
    /// Largest turn rate, deg/s.
    pub turn_rate_dps: f64,
    /// Steady current `(east, north)`, m/s.
    pub current_mps: (f64, f64),
    /// Antenna height above the waterline, m.
    pub antenna_height_m: f64,
    /// Geoid separation reported in GGA, m.
    pub geoid_sep_m: f64,
    /// Seed of the pseudo-random generator.
    pub seed: u64,
    /// Drag-off, if any.
    pub drag: Option<DragSpec>,
}

impl Default for VoyageSpec {
    fn default() -> Self {
        Self {
            route: vec![(54.60, 18.90), (54.90, 19.60)],
            duration_s: 900.0,
            date: (2025, 6, 14),
            start_tod_s: 8.0 * 3600.0,
            sog_kn: 15.0,
            turn_rate_dps: 0.4,
            current_mps: (0.2, -0.1),
            antenna_height_m: 18.0,
            geoid_sep_m: 26.5,
            seed: 1,
            drag: None,
        }
    }
}

/// The synthetic demo of `examples/maritime-trust/`: a 50-minute excerpt of a ferry passage
/// from Tallinn towards Helsinki across the Gulf of Finland at about 17 kn, with a position drag-off partway through.
/// The parameters were written down before the log was generated and are not tuned.
///
/// The route is approximate and illustrative; nothing here is a chart or a measurement.
/// The drag-off starts at 1500 s, speeds up at 0.01 m/s² to 2.5 m/s and heads 40 degrees to
/// starboard of the course; the receiver's speed and course follow the counterfeit track, its
/// fix stays flagged valid, and the C/N0 of every satellite is pulled towards 46 dB-Hz over
/// two minutes (one transmitter arriving at near-equal power).
pub fn gulf_of_finland_demo_spec() -> VoyageSpec {
    VoyageSpec {
        route: vec![
            (59.455, 24.770), // off Tallinn
            (59.560, 24.830),
            (59.800, 24.900),
            (60.050, 24.960), // towards Helsinki
        ],
        duration_s: 3000.0,
        date: (2025, 6, 14),
        start_tod_s: 8.0 * 3600.0,
        sog_kn: 17.0,
        turn_rate_dps: 0.4,
        current_mps: (0.2, -0.1),
        antenna_height_m: 18.0,
        geoid_sep_m: 21.0,
        seed: 20_250_614,
        drag: Some(DragSpec {
            onset_s: 1500.0,
            accel_mps2: 0.01,
            speed_mps: 2.5,
            bearing_rel_deg: 40.0,
            cn0_common_dbhz: Some(46.0),
            cn0_ramp_s: 120.0,
        }),
    }
}

/// SplitMix64 with a Box-Muller normal.
struct Rng(u64);

impl Rng {
    fn next(&mut self) -> u64 {
        self.0 = self.0.wrapping_add(0x9E37_79B9_7F4A_7C15);
        let mut z = self.0;
        z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
        z ^ (z >> 31)
    }
    fn unit(&mut self) -> f64 {
        (self.next() >> 11) as f64 / (1u64 << 53) as f64
    }
    fn normal(&mut self) -> f64 {
        let (u1, u2) = (self.unit().max(1e-12), self.unit());
        (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

/// A first-order Gauss-Markov error with stationary standard deviation `sigma` and time
/// constant `tau` seconds, stepped at 1 s.
struct GaussMarkov {
    x: f64,
    phi: f64,
    q: f64,
}

impl GaussMarkov {
    fn new(sigma: f64, tau: f64, rng: &mut Rng) -> Self {
        let phi = (-1.0 / tau).exp();
        Self {
            x: sigma * rng.normal(),
            phi,
            q: sigma * (1.0 - phi * phi).sqrt(),
        }
    }
    fn step(&mut self, rng: &mut Rng) -> f64 {
        self.x = self.phi * self.x + self.q * rng.normal();
        self.x
    }
}

/// A satellite in view: constellation talker, number, base azimuth and elevation.
struct Sat {
    talker: &'static str,
    n: u32,
    az0: f64,
    el0: f64,
    el_amp: f64,
    phase: f64,
}

fn constellation() -> Vec<Sat> {
    // Spread in azimuth, elevations from a few degrees to near zenith: a plausible open-sea
    // sky for a mid-latitude antenna. GPS under the GP talker, Galileo under GA.
    let table: [(&str, u32, f64, f64); 13] = [
        ("GP", 3, 40.0, 62.0),
        ("GP", 8, 95.0, 35.0),
        ("GP", 11, 150.0, 18.0),
        ("GP", 14, 205.0, 48.0),
        ("GP", 17, 262.0, 71.0),
        ("GP", 22, 310.0, 27.0),
        ("GP", 28, 350.0, 12.0),
        ("GP", 31, 120.0, 55.0),
        ("GA", 4, 70.0, 44.0),
        ("GA", 9, 180.0, 31.0),
        ("GA", 12, 235.0, 66.0),
        ("GA", 24, 285.0, 15.0),
        ("GA", 31, 20.0, 24.0),
    ];
    table
        .iter()
        .enumerate()
        .map(|(i, (t, n, az, el))| Sat {
            talker: t,
            n: *n,
            az0: *az,
            el0: *el,
            el_amp: 6.0,
            phase: i as f64 * 0.9,
        })
        .collect()
}

fn checksum(body: &str) -> u8 {
    body.bytes().fold(0, |a, b| a ^ b)
}

fn sentence(body: &str) -> String {
    format!("${body}*{:02X}\n", checksum(body))
}

fn fmt_lat(lat: f64) -> String {
    let a = lat.abs();
    let d = a.trunc();
    format!(
        "{:02}{:08.5},{}",
        d as u32,
        (a - d) * 60.0,
        if lat >= 0.0 { 'N' } else { 'S' }
    )
}

fn fmt_lon(lon: f64) -> String {
    let a = lon.abs();
    let d = a.trunc();
    format!(
        "{:03}{:08.5},{}",
        d as u32,
        (a - d) * 60.0,
        if lon >= 0.0 { 'E' } else { 'W' }
    )
}

fn fmt_tod(tod: f64) -> String {
    let t = tod.rem_euclid(86_400.0);
    format!(
        "{:02}{:02}{:05.2}",
        (t / 3600.0) as u32,
        (t / 60.0) as u32 % 60,
        t % 60.0
    )
}

fn bearing_deg(de: f64, dn: f64) -> f64 {
    de.atan2(dn).to_degrees().rem_euclid(360.0)
}

fn ang_step(from: f64, to: f64, max: f64) -> f64 {
    let d = (to - from + 540.0).rem_euclid(360.0) - 180.0;
    (from + d.clamp(-max, max)).rem_euclid(360.0)
}

/// Move a position by `(east, north)` metres.
fn displace(lat: f64, lon: f64, east: f64, north: f64) -> (f64, f64) {
    let phi = lat.to_radians();
    let w = (1.0 - WGS84_E2 * phi.sin().powi(2)).sqrt();
    let n_radius = WGS84_A / w;
    let m_radius = WGS84_A * (1.0 - WGS84_E2) / (w * w * w);
    (
        lat + (north / m_radius).to_degrees(),
        // Longitude stays in [-180, 180): a track across the antimeridian wraps.
        (lon + (east / (n_radius * phi.cos())).to_degrees() + 540.0).rem_euclid(360.0) - 180.0,
    )
}

/// The generated log as NMEA 0183 text, one cycle per second.
pub fn synth_voyage(spec: &VoyageSpec) -> String {
    synth_voyage_with_truth(spec).0
}

/// The log and the vessel's true position `[latitude, longitude]` at each epoch, which a
/// real log never has: it is what the drag-off is measured against in the demo.
pub fn synth_voyage_with_truth(spec: &VoyageSpec) -> (String, Vec<[f64; 2]>) {
    let mut truth = Vec::new();
    let mut rng = Rng(spec.seed ^ 0xA5A5_5A5A_1234_5678);
    let sats = constellation();
    let (mut lat, mut lon) = spec.route[0];
    let mut wp = 1usize;
    let mut course = match spec.route.get(1) {
        Some(&(la, lo)) => {
            let (e, n) = en_offset_m(lat, lon, la, lo);
            bearing_deg(e, n)
        }
        None => 0.0,
    };
    let mut gm_e = GaussMarkov::new(2.0, 300.0, &mut rng);
    let mut gm_n = GaussMarkov::new(2.0, 300.0, &mut rng);
    let mut gm_u = GaussMarkov::new(1.5, 200.0, &mut rng);
    let mut gm_cn: Vec<GaussMarkov> = sats
        .iter()
        .map(|_| GaussMarkov::new(0.8, 60.0, &mut rng))
        .collect();
    let (year, month, day) = spec.date;
    let mut out = String::new();
    // Counterfeit offset and its rate, m and m/s.
    let (mut off_e, mut off_n) = (0.0_f64, 0.0_f64);
    let (mut drag_v, mut prev_off) = (0.0_f64, (0.0_f64, 0.0_f64));
    let n_epochs = spec.duration_s as usize;
    for k in 0..=n_epochs {
        let t = k as f64;
        // --- vessel: steer to the waypoint, bounded turn rate, slowly varying speed -----
        if let Some(&(wla, wlo)) = spec.route.get(wp) {
            let (e, n) = en_offset_m(lat, lon, wla, wlo);
            if e.hypot(n) < 400.0 {
                wp += 1;
            }
        }
        if let Some(&(wla, wlo)) = spec.route.get(wp) {
            let (e, n) = en_offset_m(lat, lon, wla, wlo);
            course = ang_step(course, bearing_deg(e, n), spec.turn_rate_dps);
        }
        let sog =
            spec.sog_kn * KN_TO_MPS * (1.0 + 0.012 * (std::f64::consts::TAU * t / 300.0).sin());
        let (sc, cc) = course.to_radians().sin_cos();
        let g = (sog * sc, sog * cc);
        let w = (g.0 - spec.current_mps.0, g.1 - spec.current_mps.1);
        let stw_kn = w.0.hypot(w.1) / KN_TO_MPS;
        let heading = bearing_deg(w.0, w.1);

        // --- the drag-off ---------------------------------------------------------------
        let mut cn_pull = 0.0;
        if let Some(d) = &spec.drag {
            if t >= d.onset_s {
                drag_v = (drag_v + d.accel_mps2).min(d.speed_mps);
                let b = (course + d.bearing_rel_deg).to_radians();
                off_e += drag_v * b.sin();
                off_n += drag_v * b.cos();
                cn_pull = ((t - d.onset_s) / d.cn0_ramp_s.max(1.0)).min(1.0);
            }
        }
        let drag_vel = (off_e - prev_off.0, off_n - prev_off.1);
        prev_off = (off_e, off_n);

        // --- what the receiver reports -------------------------------------------------
        let (ee, en) = (
            gm_e.step(&mut rng) + 0.4 * rng.normal(),
            gm_n.step(&mut rng) + 0.4 * rng.normal(),
        );
        let (rl, ro) = displace(lat, lon, ee + off_e, en + off_n);
        let rep_v = (
            g.0 + drag_vel.0 + 0.04 * rng.normal(),
            g.1 + drag_vel.1 + 0.04 * rng.normal(),
        );
        let rep_sog_kn = rep_v.0.hypot(rep_v.1) / KN_TO_MPS;
        let rep_cog = bearing_deg(rep_v.0, rep_v.1);
        let alt = spec.antenna_height_m + gm_u.step(&mut rng) + 0.3 * rng.normal();
        let hdop = 0.9 + 0.2 * (std::f64::consts::TAU * t / 700.0).sin().abs();
        let tod = spec.start_tod_s + t;
        let ts = fmt_tod(tod);
        let cn_noise: Vec<f64> = gm_cn.iter_mut().map(|g| g.step(&mut rng)).collect();
        let heading_rep = (heading + 0.25 * rng.normal()).rem_euclid(360.0);
        let stw_rep = (stw_kn + 0.08 * rng.normal()).max(0.0);

        // --- sentences ------------------------------------------------------------------
        let n_used = sats.len().min(12);
        out.push_str(&sentence(&format!(
            "GPGGA,{ts},{},{},1,{n_used:02},{hdop:.1},{alt:.1},M,{:.1},M,,",
            fmt_lat(rl),
            fmt_lon(ro),
            spec.geoid_sep_m
        )));
        let date = format!("{:02}{:02}{:02}", day, month, year % 100);
        out.push_str(&sentence(&format!(
            "GPRMC,{ts},A,{},{},{rep_sog_kn:.2},{rep_cog:.1},{date},,,A",
            fmt_lat(rl),
            fmt_lon(ro)
        )));
        out.push_str(&sentence(&format!(
            "GPVTG,{rep_cog:.1},T,,M,{rep_sog_kn:.2},N,{:.2},K,A",
            rep_sog_kn * 1.852
        )));
        out.push_str(&sentence(&format!("HEHDT,{heading_rep:.1},T")));
        out.push_str(&sentence(&format!(
            "VWVHW,{heading_rep:.1},T,,M,{stw_rep:.2},N,{:.2},K",
            stw_rep * 1.852
        )));
        if k % 5 == 0 {
            // GSV for each constellation, four satellites a sentence.
            for talker in ["GP", "GA"] {
                let group: Vec<(usize, &Sat)> = sats
                    .iter()
                    .enumerate()
                    .filter(|(_, s)| s.talker == talker)
                    .collect();
                let pages = group.len().div_ceil(4);
                for (page, chunk) in group.chunks(4).enumerate() {
                    let mut body = format!("{talker}GSV,{pages},{},{:02}", page + 1, group.len());
                    for (i, s) in chunk {
                        let el = (s.el0
                            + s.el_amp * (std::f64::consts::TAU * t / 14_400.0 + s.phase).sin())
                        .clamp(5.0, 88.0);
                        let az = (s.az0 + 0.004 * t).rem_euclid(360.0);
                        let live = 33.0
                            + 17.0 * (el.to_radians().sin()).powf(0.7)
                            + cn_noise[*i]
                            + 0.5 * rng.normal();
                        let cn = match &spec.drag {
                            Some(DragSpec {
                                cn0_common_dbhz: Some(c),
                                ..
                            }) => live + cn_pull * (c + 0.4 * rng.normal() - live),
                            _ => live,
                        };
                        body.push_str(&format!(",{:02},{:02.0},{:03.0},{:02.0}", s.n, el, az, cn));
                    }
                    out.push_str(&sentence(&body));
                }
            }
            out.push_str(&sentence(&format!(
                "GPZDA,{ts},{day:02},{month:02},{year:04},00,00"
            )));
        }

        truth.push([lat, lon]);
        // --- advance the vessel -------------------------------------------------------
        let (nl, no) = displace(lat, lon, g.0, g.1);
        lat = nl;
        lon = no;
    }
    (out, truth)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::receiver_trust::ingest::read_nmea;

    #[test]
    fn deterministic_and_parses_back() {
        let spec = VoyageSpec {
            duration_s: 120.0,
            ..Default::default()
        };
        let a = synth_voyage(&spec);
        assert_eq!(a, synth_voyage(&spec));
        let tl = read_nmea(&a).unwrap();
        assert_eq!(tl.skipped_records, 0);
        assert_eq!(tl.epochs.len(), 121);
        let m = tl.epochs[10].marine.as_ref().unwrap();
        assert_eq!(m.fix_valid, Some(true));
        assert!((m.sog_kn.unwrap() - 15.0).abs() < 1.0);
        assert!(m.heading_deg.is_some() && m.stw_kn.is_some() && m.alt_msl_m.is_some());
        assert_eq!(tl.epochs[5].cn0.len(), 13);
    }

    #[test]
    fn the_vessel_makes_about_the_stated_speed_and_follows_the_route() {
        let spec = VoyageSpec {
            duration_s: 600.0,
            ..Default::default()
        };
        let tl = read_nmea(&synth_voyage(&spec)).unwrap();
        let (a, b) = (
            tl.epochs[0].fix.unwrap(),
            tl.epochs.last().unwrap().fix.unwrap(),
        );
        let (e, n) = en_offset_m(a.lat_deg, a.lon_deg, b.lat_deg, b.lon_deg);
        let v_kn = e.hypot(n) / 600.0 / KN_TO_MPS;
        assert!((v_kn - 15.0).abs() < 1.0, "{v_kn}");
    }

    #[test]
    fn the_drag_moves_the_reported_position_but_not_the_validity() {
        let mut spec = VoyageSpec {
            duration_s: 400.0,
            ..Default::default()
        };
        let clean = read_nmea(&synth_voyage(&spec)).unwrap();
        spec.drag = Some(DragSpec {
            onset_s: 100.0,
            accel_mps2: 0.02,
            speed_mps: 3.0,
            bearing_rel_deg: 90.0,
            cn0_common_dbhz: None,
            cn0_ramp_s: 60.0,
        });
        let spoofed = read_nmea(&synth_voyage(&spec)).unwrap();
        let (c, s) = (
            clean.epochs[400].fix.unwrap(),
            spoofed.epochs[400].fix.unwrap(),
        );
        let (e, n) = en_offset_m(c.lat_deg, c.lon_deg, s.lat_deg, s.lon_deg);
        assert!(e.hypot(n) > 500.0, "{}", e.hypot(n));
        assert!(spoofed
            .epochs
            .iter()
            .all(|x| x.marine.as_ref().unwrap().fix_valid == Some(true)));
    }
}
