// SPDX-License-Identifier: AGPL-3.0-only
//! Coverage and dilution of precision (DOP) against latitude, for the medium-Earth-orbit
//! (MEO) GNSS systems alone, the LEO systems alone, and both fused.
//!
//! GNSS orbits are inclined 55 to 65 deg, so a user above about 70 deg latitude sees every
//! MEO satellite on the equatorward half of the sky and at low elevation: the vertical
//! geometry weakens. A LEO shell near 90 deg inclination converges over the poles and fills
//! the sky there. [`latitude_sweep`] samples a band of longitudes and epochs at each latitude
//! and reports, for each of the three groups, the mean number of satellites in view, the
//! median PDOP, HDOP and VDOP, and the availability (a fix with PDOP at or below a threshold).
//! Each system keeps its own clock model (an estimated inter-system bias or a known offset),
//! as in [`super::joint_pvt::dop`].
//!
//! ## Label
//!
//! MODELLED: geometry only, two-body orbits with J2 drift, each system's own elevation mask,
//! no terrain, no signal power and no ionospheric scintillation (strong at high latitude and
//! not modelled here).

use super::geom::{elevation, median, Site};
use super::joint_pvt::{dop, SystemClock};
use super::system::System;
use serde::Serialize;

/// Running sums for one group: PDOPs, HDOPs, VDOPs, satellites in view, available samples,
/// samples.
type GroupAcc = (Vec<f64>, Vec<f64>, Vec<f64>, usize, usize, usize);

/// Figures for one group of systems at one latitude.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GroupStats {
    /// Mean satellites in view.
    pub mean_in_view: f64,
    /// Median PDOP over samples with a fix.
    pub median_pdop: Option<f64>,
    /// Median HDOP.
    pub median_hdop: Option<f64>,
    /// Median VDOP.
    pub median_vdop: Option<f64>,
    /// Fraction of samples with a fix and PDOP at or below the threshold.
    pub availability: f64,
}

/// One latitude of the sweep.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PolarRow {
    /// Latitude (deg).
    pub lat_deg: f64,
    /// MEO GNSS systems only.
    pub gnss: GroupStats,
    /// LEO systems only.
    pub leo: GroupStats,
    /// Every system.
    pub fused: GroupStats,
}

/// Sweep latitudes over `lons_deg` and epochs `times_s`, with a PDOP threshold for
/// availability.
pub fn latitude_sweep(
    systems: &[System],
    lats_deg: &[f64],
    lons_deg: &[f64],
    times_s: &[f64],
    pdop_threshold: f64,
) -> Vec<PolarRow> {
    let clocks: Vec<SystemClock> = systems.iter().map(|s| s.clock).collect();
    // Satellite positions per epoch, once: (epoch) -> [(position, system)].
    let states: Vec<Vec<([f64; 3], usize)>> = times_s
        .iter()
        .map(|&t| {
            systems
                .iter()
                .enumerate()
                .flat_map(|(k, s)| s.orbits.iter().map(move |o| (o.state(t).0, k)))
                .collect()
        })
        .collect();
    lats_deg
        .iter()
        .map(|&lat| {
            let mut acc: [GroupAcc; 3] = Default::default();
            for &lon in lons_deg {
                let site = Site {
                    lat_deg: lat,
                    lon_deg: lon,
                    height_m: 0.0,
                };
                let user = site.ecef();
                let up = site.enu().2;
                for sats in &states {
                    let vis: Vec<([f64; 3], usize)> = sats
                        .iter()
                        .filter(|(p, k)| elevation(user, up, *p) >= systems[*k].mask_rad)
                        .copied()
                        .collect();
                    for (g, a) in acc.iter_mut().enumerate() {
                        let sel: Vec<([f64; 3], usize)> = vis
                            .iter()
                            .filter(|(_, k)| match g {
                                0 => systems[*k].role == "gnss",
                                1 => systems[*k].role == "leo",
                                _ => true,
                            })
                            .copied()
                            .collect();
                        a.3 += sel.len();
                        a.5 += 1;
                        if let Some(d) = dop(user, &sel, &clocks) {
                            a.0.push(d.pdop);
                            a.1.push(d.hdop);
                            a.2.push(d.vdop);
                            if d.pdop <= pdop_threshold {
                                a.4 += 1;
                            }
                        }
                    }
                }
            }
            let stats = |a: &GroupAcc| GroupStats {
                mean_in_view: a.3 as f64 / a.5.max(1) as f64,
                median_pdop: median(a.0.clone()),
                median_hdop: median(a.1.clone()),
                median_vdop: median(a.2.clone()),
                availability: a.4 as f64 / a.5.max(1) as f64,
            };
            PolarRow {
                lat_deg: lat,
                gnss: stats(&acc[0]),
                leo: stats(&acc[1]),
                fused: stats(&acc[2]),
            }
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::leo_fusion::system::SystemCfg;

    fn sys(src: &str) -> System {
        toml::from_str::<SystemCfg>(src).unwrap().build().unwrap()
    }

    #[test]
    fn gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it() {
        let gps = sys("name = \"GPS\"\npreset = \"gps-baseline\"\n");
        let leo = sys(
            "name = \"Polar\"\n[[shell]]\npattern = \"star\"\ntotal = 66\nplanes = 6\nphasing = 2\n\
             altitude_km = 780.0\ninclination_deg = 86.4\n",
        );
        let rows = latitude_sweep(
            &[gps, leo],
            &[0.0, 89.0],
            &[0.0, 90.0, 180.0, 270.0],
            &[0.0, 1800.0, 3600.0, 5400.0],
            6.0,
        );
        let eq = &rows[0];
        let pole = &rows[1];
        let (v_eq, v_pole) = (eq.gnss.median_vdop.unwrap(), pole.gnss.median_vdop.unwrap());
        assert!(v_pole > v_eq, "GNSS VDOP equator {v_eq} pole {v_pole}");
        // The polar LEO shell has more satellites in view at the pole than at the equator.
        assert!(pole.leo.mean_in_view > eq.leo.mean_in_view);
        assert!(pole.fused.median_vdop.unwrap() < v_pole);
    }
}
