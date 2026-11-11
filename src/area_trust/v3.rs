// SPDX-License-Identifier: AGPL-3.0-only
//! Area trust, version 3 (`PREREGISTRATION-v3.md`, readings X4 to X7 in `xval/area-trust/README.md`):
//! a common-mode satellite-fault screen on the stations' fixes, then the v3 station state, then
//! version 2's area aggregation.
//!
//! * **X4.** In each epoch, with `N` stations that have a fix and `k = max(2, ⌈N/3⌉)`, the alarmed set
//!   `A` is the stations whose horizontal error exceeds `H_s`. When `|A| ≥ k`, a satellite used by
//!   every station of `A` explains the epoch when every station of `A`, re-solved without it, has a
//!   fix with horizontal error `≤ H_s`. Of the explaining satellites the one with the largest median
//!   |post-fit residual| over `A` (from the full fixes) is flagged, ties to the lowest PRN; every
//!   station that used it is re-solved without it, and its position alarm uses the re-solved fix.
//! * **X5.** A loss-of-lock alarm alone no longer makes a station `Degraded`; it stays in the
//!   station's record.
//! * **X6.** The station states are aggregated by version 2's rule.
//!
//! The input is a `kshana.area-measurements/1` document (per station and epoch the monitor flags and,
//! per GPS satellite, position, pseudorange, satellite clock, ionosphere, troposphere and weight). The
//! output is the oracle's (`xval/area-trust/oracle_v3.py`) JSON Lines: one `"kind":"epoch"` line per
//! epoch, then one `"kind":"area"` line per grid second.

use super::{timeline_with, AreaRule, AreaSecond, Station, StationState};
use serde::{Deserialize, Serialize};

/// The schema name of a measurements document.
pub const SCHEMA: &str = "kshana.area-measurements/1";

/// One satellite's measurement at a station.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Meas {
    /// Satellite, `G` and the PRN (`"G05"`).
    pub sat: String,
    /// Satellite position at transmission, ECEF, m.
    pub sat_ecef: [f64; 3],
    /// Pseudorange, m.
    pub pseudorange_m: f64,
    /// Satellite clock correction times c, m (subtracted from the prediction).
    pub sat_clock_m: f64,
    /// Ionospheric delay, m.
    pub iono_m: f64,
    /// Tropospheric delay, m.
    pub tropo_m: f64,
    /// Weight.
    pub weight: f64,
}

/// One station's report for an epoch.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Report {
    /// C/N0 template alarm.
    pub cn0_alarm: bool,
    /// AGC alarm.
    pub agc_alarm: bool,
    /// Jamming-indicator alarm.
    pub jam_alarm: bool,
    /// Loss-of-lock alarm.
    pub lock_alarm: bool,
    /// Clock alarm.
    pub clock_alarm: bool,
    /// OSNMA: `Some(false)` a failed tag, `Some(true)` verified, `None` unavailable.
    pub osnma_ok: Option<bool>,
    /// The measurements.
    pub meas: Vec<Meas>,
}

/// A station of the document.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct MeasStation {
    /// Identifier.
    pub id: String,
    /// Surveyed position, ECEF, m.
    pub p_s_ecef_m: [f64; 3],
    /// Position-alarm threshold `H_s`, m.
    pub h_s_m: f64,
}

/// One epoch: a report (or `None`) per station, in the order of the stations.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct MeasEpoch {
    /// Integer second.
    pub t: i64,
    /// One report per station.
    pub stations: Vec<Option<Report>>,
}

/// A `kshana.area-measurements/1` document.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Measurements {
    /// `kshana.area-measurements/1`.
    pub schema: String,
    /// `"v3"`.
    pub area_rule: String,
    /// The stations.
    pub stations: Vec<MeasStation>,
    /// The epochs, in increasing `t`.
    pub epochs: Vec<MeasEpoch>,
}

// ------------------------------------------------------------------ single-point solve

const MAX_ITERS: usize = 15;
const CONVERGE_M: f64 = 1e-4;

fn range_to(m: &Meas, x: &[f64; 4]) -> ([f64; 3], f64) {
    let d = [
        m.sat_ecef[0] - x[0],
        m.sat_ecef[1] - x[1],
        m.sat_ecef[2] - x[2],
    ];
    (d, (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt())
}

/// The modelled pseudorange of `m` from the state `x` (position and receiver clock, m).
pub fn predicted(m: &Meas, x: &[f64; 4]) -> f64 {
    range_to(m, x).1 + x[3] - m.sat_clock_m + m.iono_m + m.tropo_m
}

/// `n x = y` for a 4 × 4 system by Gaussian elimination with partial pivoting; `None` when singular.
fn solve4(mut n: [[f64; 4]; 4], mut y: [f64; 4]) -> Option<[f64; 4]> {
    for c in 0..4 {
        let p = (c..4).max_by(|&a, &b| n[a][c].abs().total_cmp(&n[b][c].abs()))?;
        if n[p][c].abs() < 1e-30 || !n[p][c].is_finite() {
            return None;
        }
        n.swap(c, p);
        y.swap(c, p);
        for r in 0..4 {
            if r != c {
                let pivot = n[c];
                let f = n[r][c] / pivot[c];
                for (v, q) in n[r][c..].iter_mut().zip(&pivot[c..]) {
                    *v -= f * q;
                }
                y[r] -= f * y[c];
            }
        }
    }
    let x = [
        y[0] / n[0][0],
        y[1] / n[1][1],
        y[2] / n[2][2],
        y[3] / n[3][3],
    ];
    x.iter().all(|v| v.is_finite()).then_some(x)
}

/// Weighted Gauss-Newton single-point solve from `apriori` with a zero clock: `[x, y, z, c·dt]`, or
/// `None` with fewer than four measurements or a singular normal matrix.
pub fn solve<'a, I>(meas: I, apriori: &[f64; 3]) -> Option<[f64; 4]>
where
    I: Iterator<Item = &'a Meas> + Clone,
{
    if meas.clone().count() < 4 {
        return None;
    }
    let mut x = [apriori[0], apriori[1], apriori[2], 0.0];
    for _ in 0..MAX_ITERS {
        let mut n = [[0.0f64; 4]; 4];
        let mut y = [0.0f64; 4];
        for m in meas.clone() {
            let (d, r) = range_to(m, &x);
            if r == 0.0 {
                return None;
            }
            let row = [-d[0] / r, -d[1] / r, -d[2] / r, 1.0];
            let res = m.pseudorange_m - predicted(m, &x);
            let w = m.weight.max(1e-12);
            for i in 0..4 {
                y[i] += w * row[i] * res;
                for j in 0..4 {
                    n[i][j] += w * row[i] * row[j];
                }
            }
        }
        let dx = solve4(n, y)?;
        for i in 0..4 {
            x[i] += dx[i];
        }
        if (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt() < CONVERGE_M {
            break;
        }
    }
    Some(x)
}

/// Horizontal distance of `x` from the surveyed point `p_s`, in the local frame of `p_s` (WGS 84).
pub fn horizontal_error(p_s: &[f64; 3], x: &[f64; 4]) -> f64 {
    let g = crate::frames::ecef_to_geodetic(*p_s);
    let (lat, lon) = (g.lat_rad, g.lon_rad);
    let d = [x[0] - p_s[0], x[1] - p_s[1], x[2] - p_s[2]];
    let (sl, cl) = lon.sin_cos();
    let (sp, cp) = lat.sin_cos();
    let e = -sl * d[0] + cl * d[1];
    let n = -sp * cl * d[0] - sp * sl * d[1] + cp * d[2];
    e.hypot(n)
}

fn err_of<'a, I>(st: &MeasStation, meas: I) -> Option<f64>
where
    I: Iterator<Item = &'a Meas> + Clone,
{
    solve(meas, &st.p_s_ecef_m).map(|x| horizontal_error(&st.p_s_ecef_m, &x))
}

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

fn prn(sat: &str) -> u32 {
    sat.get(1..)
        .and_then(|s| s.parse().ok())
        .unwrap_or(u32::MAX)
}

/// X4 on one epoch.
#[derive(Clone, Debug, PartialEq)]
pub struct Screen {
    /// The flagged satellite, if any.
    pub satellite_fault: Option<String>,
    /// Horizontal error of each station's full fix (`None`: no report or no fix).
    pub err_h_m: Vec<Option<f64>>,
    /// Horizontal error after the screen.
    pub err_h_screened_m: Vec<Option<f64>>,
}

/// X4: the satellite-fault screen of one epoch.
pub fn screen(stations: &[MeasStation], reports: &[Option<Report>]) -> Screen {
    let full_fix: Vec<Option<[f64; 4]>> = stations
        .iter()
        .zip(reports)
        .map(|(st, r)| {
            r.as_ref()
                .and_then(|r| solve(r.meas.iter(), &st.p_s_ecef_m))
        })
        .collect();
    let full_err: Vec<Option<f64>> = stations
        .iter()
        .zip(&full_fix)
        .map(|(st, x)| x.map(|x| horizontal_error(&st.p_s_ecef_m, &x)))
        .collect();
    let n_fix = full_err.iter().filter(|e| e.is_some()).count();
    let k = 2usize.max(n_fix.div_ceil(3));
    let alarmed: Vec<usize> = (0..stations.len())
        .filter(|&i| full_err[i].is_some_and(|e| e > stations[i].h_s_m))
        .collect();
    let mut flagged: Option<String> = None;
    if alarmed.len() >= k {
        let sats = |i: usize| -> Vec<&str> {
            reports[i]
                .as_ref()
                .map(|r| r.meas.iter().map(|m| m.sat.as_str()).collect())
                .unwrap_or_default()
        };
        let mut common: Vec<&str> = sats(alarmed[0]);
        for &i in &alarmed[1..] {
            let s = sats(i);
            common.retain(|c| s.contains(c));
        }
        common.sort_unstable();
        common.dedup();
        // (median |residual|, prn, sat) of each explaining satellite.
        let mut best: Option<(f64, u32, &str)> = None;
        for sat in common {
            let explains = alarmed.iter().all(|&i| {
                let r = reports[i]
                    .as_ref()
                    .expect("an alarmed station has a report");
                err_of(&stations[i], r.meas.iter().filter(|m| m.sat != sat))
                    .is_some_and(|e| e <= stations[i].h_s_m)
            });
            if !explains {
                continue;
            }
            let res: Vec<f64> = alarmed
                .iter()
                .map(|&i| {
                    let r = reports[i]
                        .as_ref()
                        .expect("an alarmed station has a report");
                    let m = r
                        .meas
                        .iter()
                        .find(|m| m.sat == sat)
                        .expect("a common satellite");
                    let x = full_fix[i].expect("an alarmed station has a fix");
                    (m.pseudorange_m - predicted(m, &x)).abs()
                })
                .collect();
            let cand = (median(res), prn(sat), sat);
            best = match best {
                None => Some(cand),
                Some(b) if cand.0 > b.0 || (cand.0 == b.0 && cand.1 < b.1) => Some(cand),
                keep => keep,
            };
        }
        flagged = best.map(|b| b.2.to_string());
    }
    let screened = (0..stations.len())
        .map(|i| match (&flagged, &reports[i]) {
            (Some(f), Some(r)) if r.meas.iter().any(|m| &m.sat == f) => {
                err_of(&stations[i], r.meas.iter().filter(|m| &m.sat != f))
            }
            _ => full_err[i],
        })
        .collect();
    Screen {
        satellite_fault: flagged,
        err_h_m: full_err,
        err_h_screened_m: screened,
    }
}

/// X5: the v3 station state from a report and its (screened) horizontal error.
pub fn station_state(r: &Report, err_h_m: Option<f64>, h_s_m: f64) -> StationState {
    let fix = err_h_m.is_some_and(|e| e > h_s_m) || r.clock_alarm || r.osnma_ok == Some(false);
    // Loss of lock alone no longer counts (X5); it stays in the record.
    let meas = r.cn0_alarm || r.agc_alarm || r.jam_alarm;
    if fix {
        StationState::Untrusted
    } else if meas {
        StationState::Degraded
    } else {
        StationState::Nominal
    }
}

/// One `"kind":"epoch"` line.
#[derive(Clone, Debug, Serialize)]
pub struct EpochLine {
    /// `"epoch"`.
    pub kind: &'static str,
    /// Second.
    pub t: i64,
    /// The flagged satellite.
    pub satellite_fault: Option<String>,
    /// Station states (`None`: no report).
    pub states: Vec<Option<StationState>>,
    /// Loss-of-lock flags.
    pub lock: Vec<bool>,
}

#[derive(Serialize)]
struct AreaLine<'a> {
    kind: &'static str,
    #[serde(flatten)]
    second: &'a AreaSecond,
}

#[derive(Serialize)]
struct DetailLine<'a> {
    t: i64,
    satellite_fault: &'a Option<String>,
    err_h_m: &'a [Option<f64>],
    err_h_screened_m: &'a [Option<f64>],
}

fn parse(text: &str) -> Result<Measurements, String> {
    let doc: Measurements =
        serde_json::from_str(text).map_err(|e| crate::terr!("e-area-trust-stations", e = e))?;
    if doc.schema != SCHEMA || doc.area_rule != "v3" {
        return Err(crate::terr!("e-area-trust-measurements-rule"));
    }
    let mut last: Option<i64> = None;
    for ep in &doc.epochs {
        if last.is_some_and(|l| ep.t <= l) || ep.stations.len() != doc.stations.len() {
            return Err(crate::terr!("e-area-trust-measurements-epochs"));
        }
        last = Some(ep.t);
    }
    Ok(doc)
}

/// The v3 output of a measurements document as JSON Lines: the oracle's bytes. With `detail`, per
/// epoch each station's horizontal error before and after the screen instead (T1's tolerance
/// comparison, X12).
pub fn measurements_jsonl(text: &str, detail: bool) -> Result<String, String> {
    let doc = parse(text)?;
    let mut out = String::new();
    let mut per: Vec<Station> = doc
        .stations
        .iter()
        .map(|s| Station {
            id: s.id.clone(),
            epochs: Vec::new(),
        })
        .collect();
    let line = |out: &mut String, v: &dyn erased::Ser| -> Result<(), String> {
        out.push_str(&v.json()?);
        out.push('\n');
        Ok(())
    };
    for ep in &doc.epochs {
        let sc = screen(&doc.stations, &ep.stations);
        if detail {
            line(
                &mut out,
                &DetailLine {
                    t: ep.t,
                    satellite_fault: &sc.satellite_fault,
                    err_h_m: &sc.err_h_m,
                    err_h_screened_m: &sc.err_h_screened_m,
                },
            )?;
            continue;
        }
        let mut states = Vec::with_capacity(doc.stations.len());
        let mut lock = Vec::with_capacity(doc.stations.len());
        for (i, r) in ep.stations.iter().enumerate() {
            match r {
                None => {
                    states.push(None);
                    lock.push(false);
                }
                Some(r) => {
                    let s = station_state(r, sc.err_h_screened_m[i], doc.stations[i].h_s_m);
                    states.push(Some(s));
                    lock.push(r.lock_alarm);
                    per[i].epochs.push((ep.t as f64, s));
                }
            }
        }
        line(
            &mut out,
            &EpochLine {
                kind: "epoch",
                t: ep.t,
                satellite_fault: sc.satellite_fault,
                states,
                lock,
            },
        )?;
    }
    if !detail {
        for g in timeline_with(&per, AreaRule::V3) {
            line(
                &mut out,
                &AreaLine {
                    kind: "area",
                    second: &g,
                },
            )?;
        }
    }
    Ok(out)
}

mod erased {
    pub trait Ser {
        fn json(&self) -> Result<String, String>;
    }
    impl<T: serde::Serialize> Ser for T {
        fn json(&self) -> Result<String, String> {
            serde_json::to_string(self).map_err(|e| e.to_string())
        }
    }
}

/// Whether a document is a measurements document (it names [`SCHEMA`]).
pub fn is_measurements(text: &str) -> bool {
    #[derive(Deserialize)]
    struct Head {
        #[serde(default)]
        schema: Option<String>,
    }
    serde_json::from_str::<Head>(text)
        .ok()
        .and_then(|h| h.schema)
        .is_some_and(|s| s == SCHEMA)
}

// ------------------------------------------------------------------ the satellite-fault replays (X7)

/// What an epoch of a satellite-fault replay injects (X7).
#[derive(Clone, Debug, PartialEq, Serialize)]
#[serde(tag = "kind", rename_all = "kebab-case")]
pub enum Injection {
    /// Nothing.
    Clean,
    /// One satellite's range error at every station, m.
    CommonFault {
        /// The satellite.
        sat: String,
        /// The error, m.
        error_m: f64,
    },
    /// A range error at one station only.
    OneStation {
        /// The station index.
        station: usize,
        /// The satellite.
        sat: String,
        /// The error, m.
        error_m: f64,
    },
    /// Two satellites' errors at every station.
    TwoSatellites {
        /// The satellites.
        sats: [String; 2],
        /// The errors, m.
        errors_m: [f64; 2],
    },
    /// Loss-of-lock alarms alone at these stations.
    LockAlone {
        /// The station indices.
        stations: Vec<usize>,
    },
    /// Loss-of-lock with a C/N0 alarm at these stations.
    LockWithCn0 {
        /// The station indices.
        stations: Vec<usize>,
    },
}

/// A satellite-fault replay: the document, what each epoch injects, and how many epochs were redrawn
/// because two candidates tied or a horizontal error lay within 1e-6 m of `H_s` (X12).
#[derive(Clone, Debug)]
pub struct FaultReplay {
    /// The `kshana.area-measurements/1` document.
    pub doc: Measurements,
    /// One injection per epoch.
    pub injections: Vec<Injection>,
    /// Epochs redrawn.
    pub redrawn: usize,
}

/// Distance of the X12 boundary guard, m.
const NEAR_M: f64 = 1e-6;

/// Whether an epoch is drawn as X12 requires: no horizontal error (full, screened, or of a station of
/// the alarmed set without any one common satellite) within [`NEAR_M`] of `H_s`, and no two
/// explaining candidates with equal median |residual|.
fn well_drawn(stations: &[MeasStation], reports: &[Option<Report>]) -> bool {
    let near = |e: Option<f64>, h: f64| e.is_some_and(|e| (e - h).abs() <= NEAR_M);
    let sc = screen(stations, reports);
    for (i, st) in stations.iter().enumerate() {
        if near(sc.err_h_m[i], st.h_s_m) || near(sc.err_h_screened_m[i], st.h_s_m) {
            return false;
        }
    }
    let alarmed: Vec<usize> = (0..stations.len())
        .filter(|&i| sc.err_h_m[i].is_some_and(|e| e > stations[i].h_s_m))
        .collect();
    if alarmed.is_empty() {
        return true;
    }
    let mut common: Vec<String> = reports[alarmed[0]]
        .as_ref()
        .map(|r| r.meas.iter().map(|m| m.sat.clone()).collect())
        .unwrap_or_default();
    for &i in &alarmed[1..] {
        let r = reports[i].as_ref().expect("alarmed");
        common.retain(|c| r.meas.iter().any(|m| &m.sat == c));
    }
    let mut medians = Vec::new();
    for sat in &common {
        let mut explains = true;
        for &i in &alarmed {
            let r = reports[i].as_ref().expect("alarmed");
            let e = err_of(&stations[i], r.meas.iter().filter(|m| &m.sat != sat));
            if near(e, stations[i].h_s_m) {
                return false;
            }
            explains &= e.is_some_and(|e| e <= stations[i].h_s_m);
        }
        if explains {
            let res: Vec<f64> = alarmed
                .iter()
                .map(|&i| {
                    let r = reports[i].as_ref().expect("alarmed");
                    let m = r.meas.iter().find(|m| &m.sat == sat).expect("common");
                    let x =
                        solve(r.meas.iter(), &stations[i].p_s_ecef_m).expect("alarmed has a fix");
                    (m.pseudorange_m - predicted(m, &x)).abs()
                })
                .collect();
            medians.push(median(res));
        }
    }
    medians.sort_by(f64::total_cmp);
    medians.windows(2).all(|w| w[0] != w[1])
}

/// A seeded satellite-fault replay of `n_stations` stations and `n_epochs` one-second epochs (X7):
/// GPS satellites above 15° over an area about 60 km across, range noise of 1 m (1 sigma), and per
/// epoch one injection drawn from [`Injection`]'s kinds (clean epochs most often). Same seed, same
/// document.
pub fn fault_replay(seed: u64, n_stations: usize, n_epochs: usize) -> FaultReplay {
    use crate::frames::{ecef_to_geodetic, geodetic_to_ecef, Geodetic};
    use rand::{Rng, SeedableRng};
    use rand_chacha::ChaCha20Rng;
    let mut rng = ChaCha20Rng::seed_from_u64(seed);
    let (lat0, lon0) = (52.0f64.to_radians(), 13.0f64.to_radians());
    let stations: Vec<MeasStation> = (0..n_stations)
        .map(|i| {
            let g = Geodetic {
                lat_rad: lat0 + rng.gen_range(-0.27f64..0.27).to_radians(),
                lon_rad: lon0 + rng.gen_range(-0.44f64..0.44).to_radians(),
                alt_m: rng.gen_range(50.0..300.0),
            };
            MeasStation {
                id: format!("s{i}"),
                p_s_ecef_m: geodetic_to_ecef(g),
                h_s_m: rng.gen_range(10.0..20.0),
            }
        })
        .collect();
    let centre = geodetic_to_ecef(Geodetic {
        lat_rad: lat0,
        lon_rad: lon0,
        alt_m: 0.0,
    });
    let up = {
        let g = ecef_to_geodetic(centre);
        let (sp, cp) = g.lat_rad.sin_cos();
        let (sl, cl) = g.lon_rad.sin_cos();
        (
            [cp * cl, cp * sl, sp],
            [-sl, cl, 0.0],
            [-sp * cl, -sp * sl, cp],
        )
    };
    let (u, e, n) = up;
    let mut epochs = Vec::with_capacity(n_epochs);
    let mut injections = Vec::with_capacity(n_epochs);
    let mut redrawn = 0usize;
    let mut t = 0i64;
    while epochs.len() < n_epochs {
        // Satellites: 7 to 10, PRNs distinct, azimuth uniform, elevation 15 to 85 degrees.
        let n_sat = rng.gen_range(7..=10usize);
        let mut prns: Vec<u32> = (1..=32).collect();
        for i in 0..n_sat {
            let j = rng.gen_range(i..32);
            prns.swap(i, j);
        }
        let mut sats: Vec<(String, [f64; 3], f64, f64)> = prns[..n_sat]
            .iter()
            .map(|&p| {
                let az: f64 = rng.gen_range(0.0..std::f64::consts::TAU);
                let el: f64 = rng.gen_range(15.0f64..85.0).to_radians();
                let dir = [
                    el.sin() * u[0] + el.cos() * (az.sin() * e[0] + az.cos() * n[0]),
                    el.sin() * u[1] + el.cos() * (az.sin() * e[1] + az.cos() * n[1]),
                    el.sin() * u[2] + el.cos() * (az.sin() * e[2] + az.cos() * n[2]),
                ];
                let r = rng.gen_range(20.2e6..25.5e6);
                let pos = [
                    centre[0] + r * dir[0],
                    centre[1] + r * dir[1],
                    centre[2] + r * dir[2],
                ];
                (format!("G{p:02}"), pos, rng.gen_range(-2.0e5..2.0e5), el)
            })
            .collect();
        sats.sort_by(|a, b| a.0.cmp(&b.0));
        let pick = |rng: &mut ChaCha20Rng| sats[rng.gen_range(0..sats.len())].0.clone();
        let log_err = |rng: &mut ChaCha20Rng| -> f64 {
            let sign = if rng.gen_bool(0.5) { 1.0 } else { -1.0 };
            sign * 10f64.powf(rng.gen_range(20f64.log10()..2.0e6f64.log10()))
        };
        let some_stations = |rng: &mut ChaCha20Rng| -> Vec<usize> {
            let m = rng.gen_range(1..=n_stations);
            let mut v: Vec<usize> = (0..n_stations).collect();
            for i in 0..m {
                let j = rng.gen_range(i..n_stations);
                v.swap(i, j);
            }
            let mut v = v[..m].to_vec();
            v.sort_unstable();
            v
        };
        let roll: f64 = rng.gen_range(0.0..1.0);
        let inj = if roll < 0.30 {
            Injection::Clean
        } else if roll < 0.60 {
            Injection::CommonFault {
                sat: pick(&mut rng),
                error_m: log_err(&mut rng),
            }
        } else if roll < 0.72 {
            Injection::OneStation {
                station: rng.gen_range(0..n_stations),
                sat: pick(&mut rng),
                error_m: log_err(&mut rng),
            }
        } else if roll < 0.84 {
            let a = pick(&mut rng);
            let mut b = pick(&mut rng);
            while b == a {
                b = pick(&mut rng);
            }
            Injection::TwoSatellites {
                sats: [a, b],
                errors_m: [log_err(&mut rng), log_err(&mut rng)],
            }
        } else if roll < 0.92 {
            Injection::LockAlone {
                stations: some_stations(&mut rng),
            }
        } else {
            Injection::LockWithCn0 {
                stations: some_stations(&mut rng),
            }
        };
        let reports: Vec<Option<Report>> = stations
            .iter()
            .enumerate()
            .map(|(i, st)| {
                let clk_rx: f64 = rng.gen_range(-1.0e5..1.0e5);
                let meas = sats
                    .iter()
                    .map(|(sat, pos, clk, el)| {
                        let d = [
                            pos[0] - st.p_s_ecef_m[0],
                            pos[1] - st.p_s_ecef_m[1],
                            pos[2] - st.p_s_ecef_m[2],
                        ];
                        let rho = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
                        let iono: f64 = rng.gen_range(2.0..10.0) / el.sin().max(0.2);
                        let tropo = 2.4 / el.sin().max(0.2);
                        let noise: f64 = {
                            // Box-Muller, 1 m sigma.
                            let a: f64 = rng.gen_range(f64::MIN_POSITIVE..1.0);
                            let b: f64 = rng.gen_range(0.0..1.0);
                            (-2.0 * a.ln()).sqrt() * (std::f64::consts::TAU * b).cos()
                        };
                        let mut err = 0.0;
                        match &inj {
                            Injection::CommonFault { sat: s, error_m } if s == sat => {
                                err = *error_m
                            }
                            Injection::OneStation {
                                station,
                                sat: s,
                                error_m,
                            } if *station == i && s == sat => err = *error_m,
                            Injection::TwoSatellites { sats: ss, errors_m } => {
                                for (s, e) in ss.iter().zip(errors_m) {
                                    if s == sat {
                                        err = *e;
                                    }
                                }
                            }
                            _ => {}
                        }
                        Meas {
                            sat: sat.clone(),
                            sat_ecef: *pos,
                            pseudorange_m: rho + clk_rx - clk + iono + tropo + noise + err,
                            sat_clock_m: *clk,
                            iono_m: iono,
                            tropo_m: tropo,
                            weight: el.sin() * el.sin(),
                        }
                    })
                    .collect();
                let (lock, cn0) = match &inj {
                    Injection::LockAlone { stations } => (stations.contains(&i), false),
                    Injection::LockWithCn0 { stations } => {
                        let on = stations.contains(&i);
                        (on, on)
                    }
                    _ => (false, false),
                };
                Some(Report {
                    cn0_alarm: cn0,
                    agc_alarm: false,
                    jam_alarm: false,
                    lock_alarm: lock,
                    clock_alarm: false,
                    osnma_ok: None,
                    meas,
                })
            })
            .collect();
        if !well_drawn(&stations, &reports) {
            redrawn += 1;
            continue;
        }
        epochs.push(MeasEpoch {
            t,
            stations: reports,
        });
        injections.push(inj);
        t += 1;
    }
    FaultReplay {
        doc: Measurements {
            schema: SCHEMA.to_string(),
            area_rule: "v3".to_string(),
            stations,
            epochs,
        },
        injections,
        redrawn,
    }
}
