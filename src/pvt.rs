// SPDX-License-Identifier: Apache-2.0
//! Single-point positioning (SPP): a position fix from real measurements.
//!
//! Where the rest of the engine *generates* pseudoranges from a known truth, this
//! module closes the loop the other way: it takes the pseudoranges a receiver
//! actually measured (RINEX observations) together with the broadcast ephemeris
//! the satellites transmitted (RINEX navigation), and *estimates the receiver's
//! position* — the measurement-to-position pipeline a real GNSS receiver runs.
//!
//! The estimator is classic single-point positioning: an iterated weighted
//! least-squares solve for the four unknowns `[x, y, z, c·δt_rx]` (receiver ECEF
//! position and clock offset) from the code pseudoranges, after removing the
//! satellite clock (with the `TGD` group delay for the single-frequency user),
//! the ionospheric delay (Klobuchar), the tropospheric delay
//! (Saastamoinen + Niell), and the Earth-rotation (Sagnac) correction over the
//! signal travel time. Measurements are weighted by `sin²(elevation)`.
//!
//! Scope (honest): single-frequency code SPP from **broadcast** ephemeris — not
//! carrier-phase PPP, not RTK, not dual-frequency. Its accuracy is the metre-level
//! a single-frequency code solution gives (validated against a surveyed IGS
//! station coordinate in `tests/pvt_abmf.rs`); for centimetre PPP/RTK use RTKLIB
//! or gLAB. What it provides is the genuine standards-format positioning path:
//! real observations in, a real position out.

use crate::frames::{ecef_to_geodetic, look_angles, Geodetic, Vec3};
use crate::gnss_sim::{klobuchar_delay_m, tropo_delay_m, KlobucharCoeffs, Meteo, C_M_PER_S};
use crate::orbit::{invert4, los_unit};
use crate::rinex::RinexEphemeris;
use crate::rinex_obs::RinexObs;

/// Maximum Gauss-Newton iterations for the least-squares solve.
const MAX_ITERS: usize = 15;
/// Convergence threshold on the position step (m).
const CONVERGE_M: f64 = 1e-4;
/// WGS-84 Earth rotation rate `Ω̇ₑ` (rad/s), for the Sagnac correction.
const OMEGA_E: f64 = 7.292_115_146_7e-5;
/// The L1 code-pseudorange observation codes tried, in priority order (C/A first,
/// then the semi-codeless and modernised L1 codes a station might log instead).
const L1_CODES: [&str; 5] = ["C1C", "C1W", "C1P", "C1X", "C1L"];
/// Maximum age (s) of a broadcast ephemeris record relative to the epoch for it to
/// be used (the broadcast fit interval is nominally ±2 h).
const MAX_EPH_AGE_S: f64 = 7200.0;

/// One satellite's contribution to a single-epoch SPP solve. All correction terms
/// are in metres and are evaluated once from the a-priori geometry (they change
/// negligibly over the metre-scale position update the solve makes):
///
/// - `sat_ecef` — the satellite ECEF position at signal transmission, already
///   rotated for Earth rotation over the travel time (the Sagnac correction).
/// - `pseudorange_m` — the measured code pseudorange.
/// - `sat_clock_m` — the satellite clock correction as a range, `c·δt_sv` (already
///   including the `−TGD` single-frequency group-delay term); it is *subtracted*
///   from the predicted pseudorange.
/// - `iono_m`, `tropo_m` — the slant ionospheric and tropospheric delays (≥ 0),
///   *added* to the predicted pseudorange.
/// - `weight` — the measurement weight (e.g. `sin²(elevation)`), > 0.
#[derive(Clone, Copy, Debug)]
pub struct SppMeasurement {
    pub sat_ecef: Vec3,
    pub pseudorange_m: f64,
    pub sat_clock_m: f64,
    pub iono_m: f64,
    pub tropo_m: f64,
    pub weight: f64,
}

/// The outcome of a single-epoch SPP solve.
#[derive(Clone, Copy, Debug)]
pub struct PvtFix {
    /// Estimated receiver position (ECEF, m).
    pub ecef: Vec3,
    /// Estimated receiver clock offset as a range, `c·δt_rx` (m).
    pub clock_bias_m: f64,
    /// The receiver position as WGS-84 geodetic latitude/longitude/height.
    pub geodetic: Geodetic,
    /// Number of satellites used.
    pub n_used: usize,
    /// Geometric, position, horizontal, and vertical dilution of precision.
    pub gdop: f64,
    pub pdop: f64,
    pub hdop: f64,
    pub vdop: f64,
    /// RMS of the post-fit pseudorange residuals (m).
    pub postfit_rms_m: f64,
    /// Iterations the solve took to converge.
    pub iterations: usize,
}

/// Euclidean distance between two ECEF points.
fn dist(a: Vec3, b: Vec3) -> f64 {
    let (dx, dy, dz) = (a[0] - b[0], a[1] - b[1], a[2] - b[2]);
    (dx * dx + dy * dy + dz * dz).sqrt()
}

/// The local geodetic East/North/Up unit vectors (in ECEF) at latitude `lat` and
/// longitude `lon` (radians).
fn enu_axes(lat: f64, lon: f64) -> (Vec3, Vec3, Vec3) {
    let (sla, cla) = lat.sin_cos();
    let (slo, clo) = lon.sin_cos();
    let east = [-slo, clo, 0.0];
    let north = [-sla * clo, -sla * slo, cla];
    let up = [cla * clo, cla * slo, sla];
    (east, north, up)
}

/// Variance of the estimate along unit axis `u`, given the 3×3 ECEF position
/// cofactor block `q`: `uᵀ q u`.
fn axis_var(q: &[[f64; 3]; 3], u: Vec3) -> f64 {
    let mut v = 0.0;
    for i in 0..3 {
        for j in 0..3 {
            v += u[i] * q[i][j] * u[j];
        }
    }
    v.max(0.0)
}

/// Predicted pseudorange to one satellite for receiver state `x = [x,y,z,c·δt_rx]`:
/// geometric range + receiver clock − satellite clock + ionosphere + troposphere.
fn predicted_range(x: &[f64; 4], m: &SppMeasurement) -> f64 {
    let r_rx = [x[0], x[1], x[2]];
    dist(r_rx, m.sat_ecef) + x[3] - m.sat_clock_m + m.iono_m + m.tropo_m
}

/// Solve single-point positioning from a set of single-epoch measurements, starting
/// the iteration from the a-priori ECEF position `apriori` (clock 0).
///
/// Returns `None` when there are fewer than four satellites (the four-state solve
/// needs four measurements), the a-priori coincides with a satellite, or the
/// geometry is singular.
pub fn solve_spp(meas: &[SppMeasurement], apriori: Vec3) -> Option<PvtFix> {
    let n = meas.len();
    if n < 4 {
        return None;
    }
    let mut x = [apriori[0], apriori[1], apriori[2], 0.0];
    let mut iterations = 0;
    for it in 0..MAX_ITERS {
        iterations = it + 1;
        let r_rx = [x[0], x[1], x[2]];
        let mut gtwg = [[0.0_f64; 4]; 4];
        let mut gtwy = [0.0_f64; 4];
        for m in meas {
            let e = los_unit(r_rx, m.sat_ecef)?;
            let row = [-e[0], -e[1], -e[2], 1.0];
            let resid = m.pseudorange_m - predicted_range(&x, m);
            let w = m.weight.max(1e-12);
            for i in 0..4 {
                for j in 0..4 {
                    gtwg[i][j] += w * row[i] * row[j];
                }
                gtwy[i] += w * row[i] * resid;
            }
        }
        let inv = invert4(gtwg)?;
        let mut dx = [0.0_f64; 4];
        for i in 0..4 {
            for k in 0..4 {
                dx[i] += inv[i][k] * gtwy[k];
            }
        }
        for i in 0..4 {
            x[i] += dx[i];
        }
        let dpos = (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt();
        if dpos < CONVERGE_M {
            break;
        }
    }

    // Post-fit residuals and the (unweighted) geometry for DOP.
    let r_rx = [x[0], x[1], x[2]];
    let mut sse = 0.0;
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(n);
    for m in meas {
        let e = los_unit(r_rx, m.sat_ecef)?;
        let resid = m.pseudorange_m - predicted_range(&x, m);
        sse += resid * resid;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    let postfit_rms_m = (sse / n as f64).sqrt();

    let mut gtg = [[0.0_f64; 4]; 4];
    for row in &g {
        for i in 0..4 {
            for j in 0..4 {
                gtg[i][j] += row[i] * row[j];
            }
        }
    }
    let q = invert4(gtg)?;
    let geodetic = ecef_to_geodetic(r_rx);
    let (east, north, up) = enu_axes(geodetic.lat_rad, geodetic.lon_rad);
    let qpos = [
        [q[0][0], q[0][1], q[0][2]],
        [q[1][0], q[1][1], q[1][2]],
        [q[2][0], q[2][1], q[2][2]],
    ];
    let edop2 = axis_var(&qpos, east);
    let ndop2 = axis_var(&qpos, north);
    let vdop2 = axis_var(&qpos, up);
    let tdop2 = q[3][3].max(0.0);
    let hdop = (edop2 + ndop2).sqrt();
    let vdop = vdop2.sqrt();
    let pdop = (edop2 + ndop2 + vdop2).sqrt();
    let gdop = (pdop * pdop + tdop2).sqrt();

    Some(PvtFix {
        ecef: r_rx,
        clock_bias_m: x[3],
        geodetic,
        n_used: n,
        gdop,
        pdop,
        hdop,
        vdop,
        postfit_rms_m,
        iterations,
    })
}

/// Rotate an ECEF satellite position computed at signal-transmit time into the
/// ECEF frame at reception, accounting for Earth rotation `Ω̇ₑ` over the travel
/// time `travel_s` (the Sagnac / Earth-rotation correction). This is the standard
/// `Rz(Ω̇ₑ·τ)` rotation applied in single-point positioning.
pub fn sagnac_rotate(r: Vec3, travel_s: f64) -> Vec3 {
    let theta = OMEGA_E * travel_s;
    let (s, c) = theta.sin_cos();
    [r[0] * c + r[1] * s, -r[0] * s + r[1] * c, r[2]]
}

/// Day of year (1–366) for a calendar date.
fn day_of_year(year: i32, month: u32, day: u32) -> f64 {
    let leap = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    const CUM: [u32; 12] = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    let mut d = CUM[(month.clamp(1, 12) - 1) as usize] + day;
    if leap && month > 2 {
        d += 1;
    }
    d as f64
}

/// The atmospheric models used to correct the pseudoranges: the broadcast
/// Klobuchar ionosphere coefficients and the surface meteorology for the
/// Saastamoinen + Niell troposphere.
#[derive(Clone, Copy, Debug, Default)]
pub struct AtmosModel {
    pub iono: KlobucharCoeffs,
    pub meteo: Meteo,
}

/// Parse the broadcast GPS Klobuchar ionosphere coefficients (`GPSA` α, `GPSB` β)
/// from a RINEX 3 navigation-file header, if present. These are the coefficients a
/// single-frequency receiver actually uses; falling back to a representative set
/// when the header omits them is the caller's choice.
pub fn klobuchar_from_nav_header(text: &str) -> Option<KlobucharCoeffs> {
    let mut alpha = None;
    let mut beta = None;
    for line in text.lines() {
        if line.contains("END OF HEADER") {
            break;
        }
        if !line.contains("IONOSPHERIC CORR") {
            continue;
        }
        let tag = line.get(0..4).unwrap_or("").trim();
        // Four D/E-exponent values in the 12-wide fields starting at column 5.
        let mut v = [0.0_f64; 4];
        let mut ok = true;
        for (k, vk) in v.iter_mut().enumerate() {
            let lo = 5 + k * 12;
            match line.get(lo..lo + 12).map(crate::rinex::parse_d) {
                Some(Ok(x)) => *vk = x,
                _ => {
                    ok = false;
                    break;
                }
            }
        }
        if !ok {
            continue;
        }
        match tag {
            "GPSA" => alpha = Some(v),
            "GPSB" => beta = Some(v),
            _ => {}
        }
    }
    Some(KlobucharCoeffs {
        alpha: alpha?,
        beta: beta?,
    })
}

/// Select the broadcast ephemeris record for satellite `system`/`prn` whose
/// reference time `Toe` is closest to the GPS time-of-week `tow_s`, within the
/// fit interval [`MAX_EPH_AGE_S`]. Returns `None` if the satellite has no record
/// inside the window. Week rollover is folded so a `Toe` just across a week
/// boundary still matches.
pub fn select_ephemeris(
    ephs: &[RinexEphemeris],
    system: char,
    prn: u8,
    tow_s: f64,
) -> Option<&RinexEphemeris> {
    let mut best: Option<(&RinexEphemeris, f64)> = None;
    for e in ephs {
        if e.system != system || e.prn != prn {
            continue;
        }
        let mut d = (e.toe - tow_s).abs();
        if d > 302_400.0 {
            d = 604_800.0 - d;
        }
        if d > MAX_EPH_AGE_S {
            continue;
        }
        if best.map_or(true, |(_, bd)| d < bd) {
            best = Some((e, d));
        }
    }
    best.map(|(e, _)| e)
}

/// The first available L1 code pseudorange for `sat` at epoch `epoch_idx`, trying
/// the codes in [`L1_CODES`] order.
fn l1_pseudorange(obs: &RinexObs, epoch_idx: usize, sat: &str) -> Option<f64> {
    L1_CODES
        .iter()
        .find_map(|code| obs.observation(epoch_idx, sat, code))
}

/// Assemble the single-epoch SPP measurements from a parsed observation file and a
/// set of broadcast ephemerides. For each satellite observed at `epoch_idx` that
/// has an L1 code pseudorange and a broadcast ephemeris within the fit window, this
/// computes the satellite position at transmit time (Sagnac-corrected), the
/// satellite clock correction (including `−TGD` for the single-frequency user), and
/// the Klobuchar / Saastamoinen-Niell atmospheric delays — all evaluated from the
/// a-priori receiver position `apriori`. Satellites below `mask_deg` elevation are
/// dropped. Returns `(satellite id, measurement)` pairs.
///
/// Only the Keplerian broadcast systems the ephemeris parser decodes (GPS,
/// Galileo, QZSS, BeiDou) are considered; the satellite-clock `TGD` term is the
/// GPS L1 / Galileo E1 group delay carried in the record.
pub fn assemble_epoch(
    obs: &RinexObs,
    epoch_idx: usize,
    ephs: &[RinexEphemeris],
    apriori: Vec3,
    atmos: &AtmosModel,
    mask_deg: f64,
) -> Vec<(String, SppMeasurement)> {
    let epoch = match obs.epochs.get(epoch_idx) {
        Some(e) => e,
        None => return Vec::new(),
    };
    let tow = epoch.time.gps_time_of_week();
    let gps_sod = tow.rem_euclid(86_400.0);
    let doy = day_of_year(epoch.time.year, epoch.time.month, epoch.time.day);
    let station = ecef_to_geodetic(apriori);
    let mut out = Vec::new();
    for sv in &epoch.sats {
        let system = match sv.sat.chars().next() {
            Some(c) => c,
            None => continue,
        };
        let prn: u8 = match sv.sat.get(1..3).and_then(|s| s.trim().parse().ok()) {
            Some(p) => p,
            None => continue,
        };
        let rho = match l1_pseudorange(obs, epoch_idx, &sv.sat) {
            Some(r) if r > 0.0 => r,
            _ => continue,
        };
        let eph = match select_ephemeris(ephs, system, prn, tow) {
            Some(e) => e,
            None => continue,
        };
        // Transmit time: first guess from the pseudorange, then corrected for the
        // satellite clock so the broadcast position is evaluated at the true GPS
        // system time of transmission (IS-GPS-200 user algorithm).
        let mut t_tx = tow - rho / C_M_PER_S;
        t_tx -= eph.sv_clock_bias_s(t_tx);
        let sat_raw = eph.sv_position_ecef(t_tx);
        // Sagnac correction uses the *geometric* travel time (from the a-priori
        // position), which is independent of the satellite clock bias the
        // pseudorange carries.
        let geo_travel = dist(apriori, sat_raw) / C_M_PER_S;
        let sat_ecef = sagnac_rotate(sat_raw, geo_travel);
        let look = look_angles(station, sat_ecef);
        if look.el_rad.to_degrees() < mask_deg {
            continue;
        }
        let sat_clock_m = C_M_PER_S * (eph.sv_clock_bias_s(t_tx) - eph.tgd);
        let iono_m = klobuchar_delay_m(
            &atmos.iono,
            station.lat_rad,
            station.lon_rad,
            look.el_rad,
            look.az_rad,
            gps_sod,
        );
        let tropo_m = tropo_delay_m(
            &atmos.meteo,
            station.lat_rad,
            station.alt_m,
            look.el_rad,
            doy,
        );
        let weight = look.el_rad.sin().powi(2).max(1e-3);
        out.push((
            sv.sat.clone(),
            SppMeasurement {
                sat_ecef,
                pseudorange_m: rho,
                sat_clock_m,
                iono_m,
                tropo_m,
                weight,
            },
        ));
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A truth receiver near the ABMF IGS station (Guadeloupe), on the ellipsoid.
    fn truth_receiver() -> Vec3 {
        [2_919_786.0, -5_383_745.0, 1_774_604.0]
    }

    /// Build `n` synthetic satellites at GPS altitude spread over the receiver's
    /// local sky from `(elevation_deg, azimuth_deg)` pairs, so the geometry is
    /// well-conditioned and every satellite is above the horizon. Returns their
    /// ECEF positions.
    fn synthetic_sats(rx: Vec3, el_az_deg: &[(f64, f64)]) -> Vec<Vec3> {
        let g = ecef_to_geodetic(rx);
        let (east, north, up) = enu_axes(g.lat_rad, g.lon_rad);
        let range = 22_000_000.0; // ~ GPS user range
        el_az_deg
            .iter()
            .map(|&(el, az)| {
                let (el, az) = (el.to_radians(), az.to_radians());
                let (ce, se) = (el.cos(), el.sin());
                let (sa, ca) = (az.sin(), az.cos());
                // LOS direction in ECEF: up·sinEl + (east·sinAz + north·cosAz)·cosEl.
                let dir = [
                    up[0] * se + ce * (east[0] * sa + north[0] * ca),
                    up[1] * se + ce * (east[1] * sa + north[1] * ca),
                    up[2] * se + ce * (east[2] * sa + north[2] * ca),
                ];
                [
                    rx[0] + range * dir[0],
                    rx[1] + range * dir[1],
                    rx[2] + range * dir[2],
                ]
            })
            .collect()
    }

    const GEOMETRY: [(f64, f64); 6] = [
        (80.0, 0.0),
        (30.0, 60.0),
        (45.0, 150.0),
        (25.0, 240.0),
        (60.0, 300.0),
        (15.0, 30.0),
    ];

    fn measurements(rx: Vec3, sats: &[Vec3], clock_m: f64) -> Vec<SppMeasurement> {
        sats.iter()
            .map(|&s| SppMeasurement {
                sat_ecef: s,
                pseudorange_m: dist(rx, s) + clock_m,
                sat_clock_m: 0.0,
                iono_m: 0.0,
                tropo_m: 0.0,
                weight: 1.0,
            })
            .collect()
    }

    #[test]
    fn recovers_known_receiver_from_perfect_pseudoranges() {
        let rx = truth_receiver();
        let sats = synthetic_sats(rx, &GEOMETRY);
        let meas = measurements(rx, &sats, 0.0);
        // Start ~150 m away in each axis.
        let apriori = [rx[0] + 150.0, rx[1] - 150.0, rx[2] + 150.0];
        let fix = solve_spp(&meas, apriori).expect("solves");
        let err = dist(fix.ecef, rx);
        assert!(err < 1e-3, "3D error {err:.6} m should be sub-mm");
        assert!(
            fix.clock_bias_m.abs() < 1e-3,
            "clock {:.6}",
            fix.clock_bias_m
        );
    }

    #[test]
    fn recovers_injected_receiver_clock_bias() {
        let rx = truth_receiver();
        let sats = synthetic_sats(rx, &GEOMETRY);
        // Every pseudorange long by c·δt_rx = +1000 m.
        let meas = measurements(rx, &sats, 1000.0);
        let fix = solve_spp(&meas, rx).expect("solves");
        assert!(
            dist(fix.ecef, rx) < 1e-3,
            "position drifts under clock bias"
        );
        assert!(
            (fix.clock_bias_m - 1000.0).abs() < 1e-3,
            "clock {:.6} should be 1000",
            fix.clock_bias_m
        );
    }

    #[test]
    fn removes_modelled_corrections() {
        let rx = truth_receiver();
        let sats = synthetic_sats(rx, &GEOMETRY);
        // Pseudorange carries sat-clock, iono and tropo terms the solver must
        // remove via the supplied corrections to recover the truth.
        let meas: Vec<_> = sats
            .iter()
            .enumerate()
            .map(|(i, &s)| {
                let sat_clock_m = 1500.0 - 100.0 * i as f64; // c·δt_sv (subtracted)
                let iono_m = 3.0 + 0.5 * i as f64;
                let tropo_m = 2.4 + 0.2 * i as f64;
                SppMeasurement {
                    sat_ecef: s,
                    pseudorange_m: dist(rx, s) - sat_clock_m + iono_m + tropo_m,
                    sat_clock_m,
                    iono_m,
                    tropo_m,
                    weight: 1.0,
                }
            })
            .collect();
        let fix = solve_spp(&meas, rx).expect("solves");
        assert!(
            dist(fix.ecef, rx) < 1e-3,
            "3D error {:.6} m after removing corrections",
            dist(fix.ecef, rx)
        );
    }

    #[test]
    fn too_few_satellites_returns_none() {
        let rx = truth_receiver();
        let sats = synthetic_sats(rx, &GEOMETRY[..3]);
        let meas = measurements(rx, &sats, 0.0);
        assert!(solve_spp(&meas, rx).is_none());
    }

    #[test]
    fn dop_is_finite_and_reasonable_for_good_geometry() {
        let rx = truth_receiver();
        let sats = synthetic_sats(rx, &GEOMETRY);
        let meas = measurements(rx, &sats, 0.0);
        let fix = solve_spp(&meas, rx).expect("solves");
        assert!(fix.gdop.is_finite() && fix.pdop.is_finite());
        assert!(fix.hdop.is_finite() && fix.vdop.is_finite());
        // A six-satellite all-sky spread gives single-digit DOPs.
        assert!(fix.gdop > 0.0 && fix.gdop < 10.0, "GDOP {:.2}", fix.gdop);
        assert!(
            fix.pdop <= fix.gdop,
            "PDOP {} <= GDOP {}",
            fix.pdop,
            fix.gdop
        );
        assert!(fix.postfit_rms_m < 1e-3, "postfit {:.6}", fix.postfit_rms_m);
    }
}

#[cfg(test)]
mod assembly_tests {
    use super::*;
    use crate::rinex::{parse_nav, EpochUtc};
    use crate::rinex_obs::{ObsEpoch, ObsHeader, Observation, RinexObs, SatObs};

    // One GPS broadcast ephemeris record (RINEX 3), reused to build test cases.
    const NAV_SAMPLE: &str = "\
     3.04           N: GNSS NAV DATA    G: GPS              RINEX VERSION / TYPE
                                                            END OF HEADER
G01 2023 01 01 00 00 00 4.567890123456D-04 1.136868377216D-12 0.000000000000D+00
     6.500000000000D+01-1.234375000000D+01 4.567890123456D-09-1.234567890123D+00
    -6.146728992462D-07 1.234567890123D-02 7.430091500282D-06 5.153679868698D+03
     1.728000000000D+05 1.117587089539D-08-1.234567890123D+00 7.450580596924D-09
     9.876543210987D-01 2.612500000000D+02 5.678901234567D-01-8.123456789012D-09
    -2.345678901234D-10 1.000000000000D+00 2.244000000000D+03 0.000000000000D+00
     2.000000000000D+00 0.000000000000D+00-1.117587089539D-08 6.500000000000D+01
     1.674000000000D+05 4.000000000000D+00 0.000000000000D+00 0.000000000000D+00";

    fn norm(v: Vec3) -> Vec3 {
        let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        [v[0] / n, v[1] / n, v[2] / n]
    }

    #[test]
    fn sagnac_rotation_is_zero_at_zero_travel_and_about_z() {
        let r = [1.0e7, 2.0e7, 3.0e7];
        // No travel ⇒ no rotation.
        let r0 = sagnac_rotate(r, 0.0);
        assert!((0..3).all(|k| (r0[k] - r[k]).abs() < 1e-9));
        // A finite travel rotates about z (the z component is invariant, the norm
        // is preserved).
        let r1 = sagnac_rotate(r, 0.07);
        assert!((r1[2] - r[2]).abs() < 1e-9);
        let n0 = (r[0] * r[0] + r[1] * r[1]).sqrt();
        let n1 = (r1[0] * r1[0] + r1[1] * r1[1]).sqrt();
        assert!((n0 - n1).abs() < 1e-6);
    }

    #[test]
    fn select_ephemeris_picks_nearest_toe_within_window() {
        let base = parse_nav(NAV_SAMPLE).unwrap()[0];
        let mut e1 = base;
        e1.toe = 172_800.0;
        let mut e2 = base;
        e2.toe = 180_000.0; // 7200 s later
        let mut other = base;
        other.prn = 2;
        other.toe = 173_000.0;
        let ephs = vec![e1, e2, other];
        // tow nearer e1.
        let s = select_ephemeris(&ephs, 'G', 1, 174_000.0).unwrap();
        assert!((s.toe - 172_800.0).abs() < 1.0);
        // tow nearer e2.
        let s = select_ephemeris(&ephs, 'G', 1, 178_000.0).unwrap();
        assert!((s.toe - 180_000.0).abs() < 1.0);
        // PRN 2 is resolved independently of PRN 1.
        let s = select_ephemeris(&ephs, 'G', 2, 173_000.0).unwrap();
        assert_eq!(s.prn, 2);
    }

    #[test]
    fn select_ephemeris_rejects_outside_fit_window() {
        let base = parse_nav(NAV_SAMPLE).unwrap()[0];
        let mut e1 = base;
        e1.toe = 172_800.0;
        let ephs = vec![e1];
        // 3 h away — beyond the ±2 h fit window.
        assert!(select_ephemeris(&ephs, 'G', 1, 172_800.0 + 10_800.0).is_none());
        // A different PRN is never returned.
        assert!(select_ephemeris(&ephs, 'G', 7, 172_800.0).is_none());
    }

    #[test]
    fn klobuchar_from_nav_header_parses_gpsa_gpsb() {
        let f = |s: &str| format!("{s:>12}");
        let header = format!(
            "     3.04           N: GNSS NAV DATA                         RINEX VERSION / TYPE\n\
             GPSA {}{}{}{}       IONOSPHERIC CORR\n\
             GPSB {}{}{}{}       IONOSPHERIC CORR\n\
             {:60}END OF HEADER\n",
            f("1.0245D-08"),
            f("-7.4506D-09"),
            f("-5.9605D-08"),
            f("1.1921D-07"),
            f("9.0112D+04"),
            f("-6.5536D+04"),
            f("-1.3107D+05"),
            f("4.5875D+05"),
            ""
        );
        let k = klobuchar_from_nav_header(&header).expect("parses iono header");
        assert!((k.alpha[0] - 1.0245e-8).abs() < 1e-13);
        assert!((k.alpha[3] - 1.1921e-7).abs() < 1e-12);
        assert!((k.beta[0] - 9.0112e4).abs() < 1.0);
        assert!((k.beta[3] - 4.5875e5).abs() < 1.0);
        // A header without the iono records yields None.
        assert!(klobuchar_from_nav_header(NAV_SAMPLE).is_none());
    }

    #[test]
    fn assemble_epoch_extracts_pseudorange_position_and_clock() {
        let eph = parse_nav(NAV_SAMPLE).unwrap()[0];
        // GPS time-of-week 172 800 s = the ephemeris reference time (Toe).
        let tow = 172_800.0;
        let approx_tx = eph.sv_position_ecef(tow - 0.075);
        // Receiver at the sub-satellite point so the satellite is near zenith.
        let rx = {
            let u = norm(approx_tx);
            [u[0] * 6_371_000.0, u[1] * 6_371_000.0, u[2] * 6_371_000.0]
        };
        let rho = dist(rx, approx_tx);
        // 2023-01-03 00:00:00 has GPS time-of-week 172 800 s (two days into the week).
        let epoch_time = EpochUtc {
            year: 2023,
            month: 1,
            day: 3,
            hour: 0,
            minute: 0,
            second: 0.0,
        };
        let obs = RinexObs {
            header: ObsHeader {
                version: 3.04,
                system: 'G',
                obs_types: vec![('G', vec!["C1C".to_string()])],
                approx_xyz: Some(rx),
                interval_s: Some(30.0),
                time_of_first_obs: Some(epoch_time),
            },
            epochs: vec![ObsEpoch {
                time: epoch_time,
                flag: 0,
                sats: vec![SatObs {
                    sat: "G01".to_string(),
                    obs: vec![Some(Observation {
                        value: rho,
                        lli: None,
                        ssi: None,
                    })],
                }],
            }],
        };
        let m = assemble_epoch(&obs, 0, &[eph], rx, &AtmosModel::default(), 5.0);
        assert_eq!(m.len(), 1, "one visible satellite");
        let (id, sm) = &m[0];
        assert_eq!(id, "G01");
        assert!((sm.pseudorange_m - rho).abs() < 1e-6);
        // The satellite position matches the Sagnac-rotated broadcast position at
        // the transmit time the assembler derives from the pseudorange (corrected
        // for the satellite clock), rotated by the geometric travel time.
        let mut t_tx = tow - rho / C_M_PER_S;
        t_tx -= eph.sv_clock_bias_s(t_tx);
        let sat_raw = eph.sv_position_ecef(t_tx);
        let exp = sagnac_rotate(sat_raw, dist(rx, sat_raw) / C_M_PER_S);
        assert!((0..3).all(|k| (sm.sat_ecef[k] - exp[k]).abs() < 1e-3));
        let exp_clk = C_M_PER_S * (eph.sv_clock_bias_s(t_tx) - eph.tgd);
        assert!((sm.sat_clock_m - exp_clk).abs() < 1e-6);
        assert!(sm.iono_m >= 0.0 && sm.tropo_m > 0.0);
        // Near zenith the elevation weight is close to 1.
        assert!(sm.weight > 0.9, "weight {:.3}", sm.weight);
    }

    #[test]
    fn assemble_then_solve_recovers_receiver() {
        // Six satellites spread across the sky by varying the node and mean
        // anomaly of one broadcast record, then a forward simulation of the
        // physical pseudorange (geometry + Sagnac + satellite clock + Klobuchar +
        // troposphere), and finally assemble + solve must recover the receiver.
        let base = parse_nav(NAV_SAMPLE).unwrap()[0];
        let tow = 172_800.0;
        // One satellite at zenith plus a ring of eight around it (small node /
        // mean-anomaly offsets keep them within view), for a well-conditioned solve.
        let mut ephs = vec![base];
        for k in 0..8u8 {
            let ang = k as f64 * std::f64::consts::FRAC_PI_4;
            let mut e = base;
            e.prn = k + 2;
            e.omega0 = base.omega0 + 0.45 * ang.cos();
            e.m0 = base.m0 + 0.45 * ang.sin();
            ephs.push(e);
        }
        // Receiver at the sub-satellite point of the zenith satellite.
        let rx = {
            let u = norm(base.sv_position_ecef(tow));
            [u[0] * 6_371_000.0, u[1] * 6_371_000.0, u[2] * 6_371_000.0]
        };
        let c_dt_rx = 30.0; // a steered-receiver clock offset (0.1 µs), as a range
        let atmos = AtmosModel::default();
        let station = ecef_to_geodetic(rx);
        let doy = 3.0;
        let sod = tow.rem_euclid(86_400.0);

        let mut sats = Vec::new();
        for e in &ephs {
            // Transmit time by iterating the geometric range.
            let mut tau = dist(rx, e.sv_position_ecef(tow)) / C_M_PER_S;
            for _ in 0..3 {
                let s = sagnac_rotate(e.sv_position_ecef(tow - tau), tau);
                tau = dist(rx, s) / C_M_PER_S;
            }
            let s = sagnac_rotate(e.sv_position_ecef(tow - tau), tau);
            let look = look_angles(station, s);
            if look.el_rad.to_degrees() < 5.0 {
                continue;
            }
            let geo = dist(rx, s);
            let sat_clk = C_M_PER_S * (e.sv_clock_bias_s(tow - tau) - e.tgd);
            let iono = klobuchar_delay_m(
                &atmos.iono,
                station.lat_rad,
                station.lon_rad,
                look.el_rad,
                look.az_rad,
                sod,
            );
            let tropo = tropo_delay_m(
                &atmos.meteo,
                station.lat_rad,
                station.alt_m,
                look.el_rad,
                doy,
            );
            let rho = geo + c_dt_rx - sat_clk + iono + tropo;
            sats.push((e.prn, rho));
        }
        assert!(
            sats.len() >= 4,
            "need ≥4 visible satellites, got {}",
            sats.len()
        );

        let epoch_time = EpochUtc {
            year: 2023,
            month: 1,
            day: 3,
            hour: 0,
            minute: 0,
            second: 0.0,
        };
        let obs = RinexObs {
            header: ObsHeader {
                version: 3.04,
                system: 'G',
                obs_types: vec![('G', vec!["C1C".to_string()])],
                approx_xyz: Some(rx),
                interval_s: Some(30.0),
                time_of_first_obs: Some(epoch_time),
            },
            epochs: vec![ObsEpoch {
                time: epoch_time,
                flag: 0,
                sats: sats
                    .iter()
                    .map(|&(prn, rho)| SatObs {
                        sat: format!("G{prn:02}"),
                        obs: vec![Some(Observation {
                            value: rho,
                            lli: None,
                            ssi: None,
                        })],
                    })
                    .collect(),
            }],
        };
        let meas: Vec<_> = assemble_epoch(&obs, 0, &ephs, rx, &atmos, 5.0)
            .into_iter()
            .map(|(_, m)| m)
            .collect();
        assert_eq!(meas.len(), sats.len());
        let fix = solve_spp(&meas, rx).expect("solves");
        assert!(
            dist(fix.ecef, rx) < 0.05,
            "3D error {:.4} m recovering the receiver",
            dist(fix.ecef, rx)
        );
        assert!(
            (fix.clock_bias_m - c_dt_rx).abs() < 0.05,
            "clock {:.4} should be {c_dt_rx}",
            fix.clock_bias_m
        );
    }
}
