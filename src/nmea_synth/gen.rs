// SPDX-License-Identifier: AGPL-3.0-only
//! Epoch-by-epoch generation: receiver state, scripted events, NMEA sentences.
//!
//! The whole run is generated up front, then written or streamed. Every random draw is a
//! hash of the seed and the draw's own coordinates (epoch, satellite, axis), so the output
//! does not depend on evaluation order and is the same for the same seed.

use super::clock::{iso, parse_utc, split};
use super::config::{EventCfg, EventKind, Phase, TrainingScenario, KN_MPS};
use super::log::{InstructorLog, TimelineEntry, TrackRow};
use super::nmea::{self, FixView, GsvSat};
use super::sky::{SkyModel, System};
use super::track::{self, ne_offset_m};
use crate::constellation::dop_at;
use crate::frames::{geodetic_to_ecef, look_angles, Geodetic};
use crate::portable_math::PortableFloat;
use std::f64::consts::PI;

const DEG: f64 = PI / 180.0;

/// The sentences of one epoch.
#[derive(Clone, Debug)]
pub struct Epoch {
    /// Seconds from the start of the run.
    pub t_s: f64,
    /// Sentences without line endings.
    pub lines: Vec<String>,
}

/// A finished run.
#[derive(Clone, Debug)]
pub struct Generated {
    /// One entry per epoch.
    pub epochs: Vec<Epoch>,
    /// The instructor log.
    pub log: InstructorLog,
}

impl Generated {
    /// The NMEA text, CRLF-terminated.
    pub fn nmea_text(&self) -> String {
        let mut s = String::new();
        for e in &self.epochs {
            for l in &e.lines {
                s.push_str(l);
                s.push_str("\r\n");
            }
        }
        s
    }
}

fn mix(mut x: u64) -> u64 {
    x = x.wrapping_add(0x9E37_79B9_7F4A_7C15);
    x = (x ^ (x >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
    x = (x ^ (x >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
    x ^ (x >> 31)
}

fn hash(seed: u64, a: u64, b: u64, c: u64) -> u64 {
    mix(seed ^ mix(a ^ mix(b ^ mix(c))))
}

/// Uniform on the open interval (0, 1).
fn uni(h: u64) -> f64 {
    ((h >> 11) as f64 + 0.5) / (1u64 << 53) as f64
}

/// Standard normal from two hashed uniforms.
fn gauss(seed: u64, a: u64, b: u64, c: u64) -> f64 {
    let u1 = uni(hash(seed, a, b, c ^ 0x1111));
    let u2 = uni(hash(seed, a, b, c ^ 0x2222));
    (-2.0 * libm::log(u1)).sqrt() * (2.0 * PI * u2).pcos()
}

fn r1(x: f64) -> f64 {
    (x * 10.0).round() / 10.0
}
fn r2(x: f64) -> f64 {
    (x * 100.0).round() / 100.0
}
fn r6(x: f64) -> f64 {
    (x * 1e6).round() / 1e6
}

struct Seen {
    sys: System,
    num: u32,
    el_deg: f64,
    az_deg: f64,
    cn0: f64,
    tracked: bool,
    used: bool,
    pos: [f64; 3],
}

/// Generate the epochs and the instructor log for a scenario.
pub fn generate(scn: &TrainingScenario) -> Result<Generated, String> {
    scn.validate()?;
    let start_ms = parse_utc(&scn.scenario.start_utc)?;
    let rate = scn.scenario.rate_hz;
    let dt_ms = (1000.0 / rate).round() as i64;
    let seed = scn.scenario.seed;
    let rc = &scn.receiver;
    let env = &scn.environment;
    let truth = track::generate(scn);
    let n = truth.len();

    let mut systems: Vec<System> = rc
        .systems
        .iter()
        .map(|s| System::parse(s))
        .collect::<Result<_, _>>()?;
    systems.sort();
    systems.dedup();
    let sky = SkyModel::new(&systems)?;
    let talker = if systems.len() == 1 {
        systems[0].talker()
    } else {
        "GN"
    };
    let want = |name: &str| scn.output.sentences.iter().any(|s| s == name);
    let evs: Vec<&EventCfg> = scn.events.iter().collect();

    let mut log = InstructorLog::new(scn, start_ms);
    let mut epochs = Vec::with_capacity(n);
    let log_every = ((scn.output.log_interval_s * rate).round() as usize).max(1);

    let mut fix_valid = false;
    let mut reacq = 0usize;
    let mut prev_phase = vec![Phase::Idle; evs.len()];
    let (mut ne, mut nn, mut nu) = (0.0_f64, 0.0_f64, 0.0_f64);
    let rho = (-(1.0 / rate) / rc.noise_corr_s).exp();
    let mut geo_valid_pos: Option<(f64, f64)> = None;

    for k in 0..n {
        let t = k as f64 / rate;
        let tr = truth[k];
        let true_ms = start_ms + k as i64 * dt_ms;

        // ---- scripted events at this instant ----
        let mut jam: Option<(f64, f64, usize)> = None; // (drop dB, spread dB, event idx)
        let (mut off_n, mut off_e, mut off_rate_n, mut off_rate_e) = (0.0, 0.0, 0.0, 0.0);
        let mut time_off_s = 0.0;
        let mut delay_s = 0.0;
        let mut locked = false;
        let mut level: Option<f64> = None;
        let mut active = Vec::new();
        for (i, e) in evs.iter().enumerate() {
            let w = e.window();
            let s = w.strength(t);
            let ph = w.phase(t);
            if ph != prev_phase[i] {
                let id = i + 1;
                let (what, text) = match (prev_phase[i], ph) {
                    (Phase::Idle, Phase::Ramping) | (Phase::Idle, Phase::Full) => {
                        ("onset", format!("{} begins", e.kind.name()))
                    }
                    (_, Phase::Full) => ("full-effect", "full strength reached".to_string()),
                    (_, Phase::Recovering) => (
                        "recovery-begins",
                        "the injection is being removed".to_string(),
                    ),
                    (_, Phase::Idle) => ("recovered", format!("{} has ended", e.kind.name())),
                    _ => ("onset", String::new()),
                };
                log.timeline.push(TimelineEntry {
                    t_s: t,
                    utc: iso(true_ms),
                    event: Some(id),
                    what: what.to_string(),
                    text,
                });
                prev_phase[i] = ph;
            }
            if s <= 0.0 {
                continue;
            }
            active.push(i + 1);
            match e.kind {
                EventKind::Jamming => {
                    let d = e.cn0_drop_db.unwrap_or(0.0) * s;
                    if jam.is_none_or(|j| d > j.0) {
                        jam = Some((d, e.spread_db.unwrap_or(6.0), i));
                    }
                }
                EventKind::DragOff => {
                    let b = match (e.bearing_deg, e.relative_bearing_deg) {
                        (Some(b), _) => b,
                        (_, Some(r)) => tr.cog_deg() + r,
                        _ => 0.0,
                    } * DEG;
                    let m = e.final_offset_m.unwrap_or(0.0);
                    let (sb, cb) = b.psin_cos();
                    off_n += m * s * cb;
                    off_e += m * s * sb;
                    let sr = w.strength_rate(t);
                    off_rate_n += m * sr * cb;
                    off_rate_e += m * sr * sb;
                }
                EventKind::TimeSpoof => time_off_s += e.offset_s.unwrap_or(0.0) * s,
                EventKind::ReplayDelay => {
                    let d = e.delay_s.unwrap_or(0.0) * s;
                    delay_s += d;
                    if e.affect_time.unwrap_or(true) {
                        time_off_s -= d;
                    }
                }
            }
            if e.kind.counterfeit() {
                locked = true;
                if level.is_none() {
                    level = e.counterfeit_cn0_dbhz;
                }
            }
        }

        let base = track::at(&truth, t - delay_s);
        let rep_ms = true_ms + (time_off_s * 1000.0).round() as i64;
        let rep_utc = split(rep_ms);

        // ---- geometry as the receiver believes it ----
        let (geo_lat, geo_lon) = match (fix_valid, geo_valid_pos) {
            (true, _) => {
                let (la, lo) = track::move_ne(base.lat_rad, base.lon_rad, off_n, off_e);
                (la, lo)
            }
            (false, Some(p)) => p,
            _ => (tr.lat_rad, tr.lon_rad),
        };
        let height = rc.antenna_height_m + env.geoid_separation_m;
        let geo = Geodetic {
            lat_rad: geo_lat,
            lon_rad: geo_lon,
            alt_m: height,
        };
        let user_ecef = geodetic_to_ecef(geo);
        let positions = sky.positions(rep_ms as f64 / 1000.0);

        // ---- signal levels ----
        let mut seen: Vec<Seen> = Vec::new();
        for def in &sky.sats {
            let la = look_angles(geo, positions[def.idx]);
            let el = la.el_rad / DEG;
            if el < rc.elevation_mask_deg {
                continue;
            }
            let i = def.idx as u64;
            let sat_off = (uni(hash(seed, i, 7, 0)) * 2.0 - 1.0) * 1.5;
            let ph1 = uni(hash(seed, i, 8, 0)) * 2.0 * PI;
            let ph2 = uni(hash(seed, i, 9, 0)) * 2.0 * PI;
            let fade =
                0.8 * (t / 97.0 * 2.0 * PI + ph1).psin() + 0.5 * (t / 31.0 * 2.0 * PI + ph2).psin();
            let genuine = rc.nominal_cn0_zenith_dbhz - 14.0 * (1.0 - la.el_rad.psin())
                + sat_off
                + fade
                + 0.3 * gauss(seed, k as u64, i, 1);
            let cn0 = if locked {
                match level {
                    Some(l) => l + 0.3 * gauss(seed, k as u64, i, 2),
                    None => genuine,
                }
            } else if let Some((drop, spread, ei)) = jam {
                let u = uni(hash(seed, i, 10, ei as u64)) * 2.0 - 1.0;
                // `drop` already carries the event strength; scale the spread the same way.
                let s_now = if let Some(e) = evs.get(ei) {
                    e.window().strength(t)
                } else {
                    1.0
                };
                genuine - (drop + spread * u * s_now).max(0.0)
            } else {
                genuine
            };
            let cn0 = cn0.round().clamp(0.0, 55.0);
            seen.push(Seen {
                sys: def.sys,
                num: def.num,
                el_deg: el,
                az_deg: la.az_rad / DEG,
                cn0,
                tracked: cn0 >= rc.track_threshold_dbhz,
                used: false,
                pos: positions[def.idx],
            });
        }
        // Used set: highest elevations first within each system.
        for sys in &systems {
            let mut idx: Vec<usize> = (0..seen.len())
                .filter(|&i| {
                    seen[i].sys == *sys && seen[i].tracked && seen[i].cn0 >= rc.use_threshold_dbhz
                })
                .collect();
            idx.sort_by(|&a, &b| {
                seen[b]
                    .el_deg
                    .total_cmp(&seen[a].el_deg)
                    .then(seen[a].num.cmp(&seen[b].num))
            });
            for &i in idx.iter().take(rc.max_used_per_system) {
                seen[i].used = true;
            }
        }
        let n_used = seen.iter().filter(|s| s.used).count();
        let n_tracked = seen.iter().filter(|s| s.tracked).count();

        // ---- fix state ----
        let signal_ok = n_used >= 4;
        let was_valid = fix_valid;
        if k == 0 {
            fix_valid = signal_ok;
        } else if fix_valid {
            if !signal_ok {
                fix_valid = false;
                reacq = 0;
            }
        } else if signal_ok {
            reacq += 1;
            if reacq as f64 / rate >= rc.reacquire_s {
                fix_valid = true;
            }
        } else {
            reacq = 0;
        }
        if k > 0 && was_valid != fix_valid {
            let (what, text) = if fix_valid {
                (
                    "fix-regained",
                    format!("the receiver reports a fix again ({n_used} satellites used)"),
                )
            } else {
                (
                    "fix-lost",
                    format!("the receiver has no fix ({n_used} usable satellites, four needed)"),
                )
            };
            log.timeline.push(TimelineEntry {
                t_s: t,
                utc: iso(true_ms),
                event: None,
                what: what.to_string(),
                text,
            });
        }

        // ---- the reported fix ----
        let used_pos: Vec<([f64; 3], usize)> = seen
            .iter()
            .filter(|s| s.used)
            .map(|s| (s.pos, systems.iter().position(|x| *x == s.sys).unwrap_or(0)))
            .collect();
        let dop = dop_at(user_ecef, &used_pos);
        let (hdop, pdop, vdop) = dop.map_or((9.9, 9.9, 9.9), |d| (d.hdop.max(0.5), d.pdop, d.vdop));
        let sigma = rc.position_noise_m * hdop.clamp(0.8, 10.0);
        let q = (1.0 - rho * rho).sqrt();
        let kk = k as u64;
        ne = rho * ne + q * sigma * gauss(seed, kk, 1000, 1);
        nn = rho * nn + q * sigma * gauss(seed, kk, 1000, 2);
        nu = rho * nu + q * 2.0 * sigma * gauss(seed, kk, 1000, 3);

        let fix = if fix_valid {
            let (la, lo) = track::move_ne(base.lat_rad, base.lon_rad, off_n + nn, off_e + ne);
            geo_valid_pos = Some((geo_lat, geo_lon));
            let (vn, ve) = (base.vn_mps + off_rate_n, base.ve_mps + off_rate_e);
            let sog = vn.phypot(ve) / KN_MPS;
            let cog = if sog < 0.04 {
                base.heading_deg
            } else {
                track::wrap360(ve.patan2(vn) / DEG)
            };
            Some(FixView {
                lat_deg: la / DEG,
                lon_deg: lo / DEG,
                alt_msl_m: rc.antenna_height_m + nu,
                sog_kn: sog,
                cog_deg: cog,
                n_used,
                hdop,
            })
        } else {
            None
        };

        // ---- sentences ----
        let mut lines: Vec<String> = Vec::new();
        if scn.output.marker && k % (10 * rate as usize) == 0 {
            lines.push(nmea::marker());
        }
        let fx = fix.as_ref();
        let mag = env.magnetic_variation_deg;
        let sep = env.geoid_separation_m;
        let modes: String = [
            System::Gps,
            System::Glonass,
            System::Galileo,
            System::Beidou,
        ]
        .iter()
        .map(|s| {
            if fix_valid && seen.iter().any(|x| x.sys == *s && x.used) {
                'A'
            } else {
                'N'
            }
        })
        .collect();
        if want("RMC") {
            lines.push(nmea::rmc(talker, &rep_utc, fx, mag));
        }
        if want("GGA") {
            lines.push(nmea::gga(talker, &rep_utc, fx, sep));
        }
        if want("GNS") {
            lines.push(nmea::gns(talker, &rep_utc, fx, &modes, sep));
        }
        if want("GSA") {
            if fix_valid {
                for sys in &systems {
                    let mut used: Vec<u32> = seen
                        .iter()
                        .filter(|s| s.sys == *sys && s.used)
                        .map(|s| s.num)
                        .collect();
                    used.sort();
                    if used.is_empty() {
                        continue;
                    }
                    lines.push(nmea::gsa(
                        talker,
                        Some(true),
                        &used,
                        (r1(pdop), r1(hdop), r1(vdop)),
                        sys.gsa_id(),
                    ));
                }
            } else {
                lines.push(nmea::gsa(
                    talker,
                    None,
                    &[],
                    (0.0, 0.0, 0.0),
                    systems[0].gsa_id(),
                ));
            }
        }
        if want("GSV") {
            for sys in &systems {
                let mut v: Vec<&Seen> = seen.iter().filter(|s| s.sys == *sys).collect();
                v.sort_by_key(|s| s.num);
                if v.is_empty() {
                    continue;
                }
                let gs: Vec<GsvSat> = v
                    .iter()
                    .map(|s| GsvSat {
                        num: s.num,
                        el_deg: s.el_deg.round().clamp(0.0, 90.0) as u32,
                        az_deg: (s.az_deg.round() as u32) % 360,
                        snr: s.tracked.then_some(s.cn0 as u32),
                    })
                    .collect();
                lines.extend(nmea::gsv(sys.talker(), sys.signal_id(), &gs));
            }
        }
        if want("VTG") {
            lines.push(nmea::vtg(talker, fx, mag));
        }
        // Gyro compass and Doppler log: independent of GNSS, so no event touches them.
        let hdg = track::wrap360(tr.heading_deg + 0.05 * gauss(seed, kk, 2000, 1));
        if want("HDT") {
            lines.push(nmea::hdt(hdg));
        }
        if want("VBW") {
            let (sh, ch) = (tr.heading_deg * DEG).psin_cos();
            let gl = tr.vn_mps * ch + tr.ve_mps * sh;
            let gt = tr.ve_mps * ch - tr.vn_mps * sh;
            let lee = 0.03 * gauss(seed, kk, 2000, 2);
            lines.push(nmea::vbw(
                tr.stw_mps / KN_MPS,
                lee,
                gl / KN_MPS,
                gt / KN_MPS,
            ));
        }
        if want("ZDA") {
            lines.push(nmea::zda(talker, &rep_utc));
        }
        epochs.push(Epoch { t_s: t, lines });

        // ---- instructor track row ----
        if k % log_every == 0 {
            let (perr, rl) = match &fix {
                Some(f) => {
                    let (dn, de) =
                        ne_offset_m(tr.lat_rad, tr.lon_rad, f.lat_deg * DEG, f.lon_deg * DEG);
                    (Some(r1(dn.phypot(de))), Some(f))
                }
                None => (None, None),
            };
            let tracked: Vec<f64> = seen.iter().filter(|s| s.tracked).map(|s| s.cn0).collect();
            log.track.push(TrackRow {
                t_s: t,
                utc: iso(true_ms),
                true_lat_deg: r6(tr.lat_rad / DEG),
                true_lon_deg: r6(tr.lon_rad / DEG),
                true_sog_kn: r2(tr.sog_kn()),
                true_cog_deg: r1(tr.cog_deg()),
                true_heading_deg: r1(tr.heading_deg),
                fix_valid,
                reported_lat_deg: rl.map(|f| r6(f.lat_deg)),
                reported_lon_deg: rl.map(|f| r6(f.lon_deg)),
                reported_sog_kn: rl.map(|f| r2(f.sog_kn)),
                reported_cog_deg: rl.map(|f| r1(f.cog_deg)),
                position_error_m: perr,
                time_offset_s: r2(time_off_s),
                n_used,
                n_tracked,
                mean_cn0_dbhz: (!tracked.is_empty())
                    .then(|| r1(tracked.iter().sum::<f64>() / tracked.len() as f64)),
                active_events: active,
            });
        }
    }
    Ok(Generated { epochs, log })
}
