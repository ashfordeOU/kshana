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

use crate::frames::{ecef_to_geodetic, Geodetic, Vec3};
use crate::orbit::{invert4, los_unit};

/// Maximum Gauss-Newton iterations for the least-squares solve.
const MAX_ITERS: usize = 15;
/// Convergence threshold on the position step (m).
const CONVERGE_M: f64 = 1e-4;

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
