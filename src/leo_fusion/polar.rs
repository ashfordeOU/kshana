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
//! ## Orbits
//!
//! Every satellite is propagated by SGP4/SDP4 ([`crate::sgp4::SgpOrbit`]) from its system's
//! element set at the sweep epoch, read as SGP4 mean elements with the node an Earth-fixed
//! longitude at the epoch, and carried to the Earth-fixed frame by the IAU 2006/2000A chain
//! with no Earth orientation parameters (UT1 = UTC, zero polar motion). The polar mode runs at
//! [`polar_epoch`]; [`latitude_sweep_at`] takes any epoch. A system's `j2` switch has no effect
//! here: SGP4 always carries the zonal harmonics it is defined with.
//!
//! ## Label
//!
//! MODELLED: geometry only, each system's own elevation mask, no terrain, no signal power and
//! no ionospheric scintillation (strong at high latitude and not modelled here).

use super::geom::{elevation, median, Site};
use super::joint_pvt::{dop, Dop, SystemClock};
use super::system::System;
use crate::jd2::Jd2;
use crate::sgp4::{teme_to_itrs_matrix, EarthFixedElements, MeanElementSet, SgpOrbit};
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

/// Earth-fixed satellite positions per epoch, each tagged with its system index:
/// `states[epoch][k] = (position (m), system)`.
pub type SatStates = Vec<Vec<([f64; 3], usize)>>;

/// The reference epoch of the `leo-pvt` polar mode: 2026-01-01T00:00:00 UTC. The scenario's
/// times are seconds after it.
pub fn polar_epoch() -> Jd2 {
    Jd2::from_utc_calendar(2026, 1, 1, 0, 0, 0.0).expect("a valid calendar date")
}

/// The SGP4 element set of every satellite of every system at `epoch`, each tagged with its
/// system index: the orbits the sweep propagates.
pub fn element_sets(systems: &[System], epoch: Jd2) -> Vec<(MeanElementSet, usize)> {
    systems
        .iter()
        .enumerate()
        .flat_map(|(k, s)| {
            s.orbits.iter().map(move |o| {
                let el = EarthFixedElements {
                    a_m: o.a,
                    e: o.e,
                    inc_rad: o.inc,
                    node_lon_rad: o.raan0,
                    argp_rad: o.argp0,
                    m0_rad: o.m0,
                };
                (MeanElementSet::from_earth_fixed(&el, epoch), k)
            })
        })
        .collect()
}

/// Earth-fixed positions of every satellite of every system at each epoch of `times_s`
/// (seconds after `epoch`), propagated by SGP4 and rotated to the ITRS. A satellite SGP4
/// cannot propagate at an instant (a decayed or non-physical orbit) is left out of that
/// instant.
pub fn satellite_states_at(systems: &[System], epoch: Jd2, times_s: &[f64]) -> SatStates {
    let orbits: Vec<(SgpOrbit, usize)> = element_sets(systems, epoch)
        .into_iter()
        .map(|(set, k)| (SgpOrbit::new(set), k))
        .collect();
    times_s
        .iter()
        .map(|&t| {
            let at = epoch.add_seconds(t);
            let m = teme_to_itrs_matrix(at);
            orbits
                .iter()
                .filter_map(|(o, k)| o.itrs_state_with(at, &m).ok().map(|(r, _)| (r, *k)))
                .collect()
        })
        .collect()
}

/// [`satellite_states_at`] at the polar mode's [`polar_epoch`].
pub fn satellite_states(systems: &[System], times_s: &[f64]) -> SatStates {
    satellite_states_at(systems, polar_epoch(), times_s)
}

/// One sample of the sweep: one site (latitude, longitude) at one epoch.
#[derive(Clone, Debug, PartialEq)]
pub struct Sample {
    /// Longitude (deg).
    pub lon_deg: f64,
    /// Index of the epoch in the states.
    pub epoch: usize,
    /// Satellites above their own system's mask, per system.
    pub in_view_by_system: Vec<usize>,
    /// Satellites in view per group: MEO GNSS, LEO, every system.
    pub in_view: [usize; 3],
    /// DOP per group, `None` when the group's geometry cannot resolve its unknowns.
    pub dop: [Option<Dop>; 3],
}

/// Every sample of one latitude over `lons_deg` and every epoch of `states`.
pub fn latitude_samples(
    systems: &[System],
    states: &[Vec<([f64; 3], usize)>],
    lat_deg: f64,
    lons_deg: &[f64],
) -> Vec<Sample> {
    let clocks: Vec<SystemClock> = systems.iter().map(|s| s.clock).collect();
    let mut out = Vec::with_capacity(lons_deg.len() * states.len());
    for &lon in lons_deg {
        let site = Site {
            lat_deg,
            lon_deg: lon,
            height_m: 0.0,
        };
        let user = site.ecef();
        let up = site.enu().2;
        for (epoch, sats) in states.iter().enumerate() {
            let vis: Vec<([f64; 3], usize)> = sats
                .iter()
                .filter(|(p, k)| elevation(user, up, *p) >= systems[*k].mask_rad)
                .copied()
                .collect();
            let mut in_view_by_system = vec![0; systems.len()];
            for (_, k) in &vis {
                in_view_by_system[*k] += 1;
            }
            let mut in_view = [0; 3];
            let mut dops: [Option<Dop>; 3] = [None; 3];
            for g in 0..3 {
                let sel: Vec<([f64; 3], usize)> = vis
                    .iter()
                    .filter(|(_, k)| match g {
                        0 => systems[*k].role == "gnss",
                        1 => systems[*k].role == "leo",
                        _ => true,
                    })
                    .copied()
                    .collect();
                in_view[g] = sel.len();
                dops[g] = dop(user, &sel, &clocks);
            }
            out.push(Sample {
                lon_deg: lon,
                epoch,
                in_view_by_system,
                in_view,
                dop: dops,
            });
        }
    }
    out
}

/// Sweep latitudes over `lons_deg` and epochs `times_s` (seconds after [`polar_epoch`]), with
/// a PDOP threshold for availability.
pub fn latitude_sweep(
    systems: &[System],
    lats_deg: &[f64],
    lons_deg: &[f64],
    times_s: &[f64],
    pdop_threshold: f64,
) -> Vec<PolarRow> {
    latitude_sweep_at(
        systems,
        polar_epoch(),
        lats_deg,
        lons_deg,
        times_s,
        pdop_threshold,
    )
}

/// [`latitude_sweep`] with the times counted from `epoch` (UTC).
pub fn latitude_sweep_at(
    systems: &[System],
    epoch: Jd2,
    lats_deg: &[f64],
    lons_deg: &[f64],
    times_s: &[f64],
    pdop_threshold: f64,
) -> Vec<PolarRow> {
    let states = satellite_states_at(systems, epoch, times_s);
    latitude_sweep_on_states(systems, &states, lats_deg, lons_deg, pdop_threshold)
}

/// [`latitude_sweep`] on given Earth-fixed satellite states (only each system's role, mask
/// and clock model are read from `systems`).
pub fn latitude_sweep_on_states(
    systems: &[System],
    states: &[Vec<([f64; 3], usize)>],
    lats_deg: &[f64],
    lons_deg: &[f64],
    pdop_threshold: f64,
) -> Vec<PolarRow> {
    lats_deg
        .iter()
        .map(|&lat| {
            let mut acc: [GroupAcc; 3] = Default::default();
            for s in latitude_samples(systems, states, lat, lons_deg) {
                for (g, a) in acc.iter_mut().enumerate() {
                    a.3 += s.in_view[g];
                    a.5 += 1;
                    if let Some(d) = s.dop[g] {
                        a.0.push(d.pdop);
                        a.1.push(d.hdop);
                        a.2.push(d.vdop);
                        if d.pdop <= pdop_threshold {
                            a.4 += 1;
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
