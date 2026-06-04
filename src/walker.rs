// SPDX-License-Identifier: Apache-2.0
//! Walker-delta constellation design on the validated SGP4 core.
//!
//! The synthetic Walker generator in [`crate::orbit`] emits analytic Keplerian
//! orbits. This module instead emits a designed Walker pattern as **SGP4 mean
//! elements**, so the constellation is propagated through the very same SGP4 path
//! validated to 4.12 mm against the AIAA 2006-6753 vectors. On top of the
//! generator it adds the two outputs a constellation reviewer expects: a
//! dilution-of-precision sweep over the design grid (planes × satellites ×
//! inclination) and coverage-fraction / revisit-time figures of merit.

use crate::frames::{geodetic_to_ecef, is_visible, teme_to_ecef, Geodetic};
use crate::orbit::{dop, Propagator};
use crate::sgp4::{wgs72, Sgp4};
use serde::{Deserialize, Serialize};
use std::f64::consts::TAU;

/// A Walker-delta constellation in the `i: T/P/F` convention: `planes` (P)
/// equally-spaced orbital planes, `sats_per_plane` satellites each (so the total
/// `T = planes * sats_per_plane`), a common circular `altitude_km` and
/// `inclination_deg` (i), and the inter-plane phasing parameter `phasing_f` (F,
/// in `0..planes`) that offsets the mean anomaly between adjacent planes.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
pub struct WalkerSgp4 {
    pub altitude_km: f64,
    pub inclination_deg: f64,
    pub planes: usize,
    pub sats_per_plane: usize,
    #[serde(default)]
    pub phasing_f: f64,
}

/// Julian date of the common Walker epoch (an arbitrary recent instant — the
/// pattern is a geometry, so only the shared epoch matters, not its value).
pub const WALKER_EPOCH_DAYS_1950: f64 = 25_000.0;
pub fn walker_epoch_jd() -> f64 {
    2_433_281.5 + WALKER_EPOCH_DAYS_1950
}

impl WalkerSgp4 {
    pub fn total(&self) -> usize {
        self.planes * self.sats_per_plane
    }

    /// The Kozai (Brouwer) mean motion in rad/min for a circular orbit at this
    /// altitude, chosen so SGP4's mean semi-major axis `a = (xke/n)^(2/3)` equals
    /// the target radius `R_earth + altitude`.
    pub fn mean_motion_kozai_rad_min(&self) -> f64 {
        let g = wgs72();
        let a_er = (g.radiusearthkm + self.altitude_km) / g.radiusearthkm;
        g.xke / a_er.powf(1.5)
    }

    /// Build the constellation as SGP4 propagators from circular mean elements
    /// (eccentricity and argument-of-perigee zero), all sharing one epoch so the
    /// inter-plane RAAN spacing is a pure inertial geometry. Each satellite is
    /// routed through the validated SGP4 core.
    pub fn satellites(&self) -> Vec<crate::orbit::Propagator> {
        let g = wgs72();
        let no_kozai = self.mean_motion_kozai_rad_min();
        let inclo = self.inclination_deg.to_radians();
        let total = self.total() as f64;
        let mut sats = Vec::with_capacity(self.total());
        for p in 0..self.planes {
            let nodeo = TAU * p as f64 / self.planes as f64;
            for s in 0..self.sats_per_plane {
                let mo = (TAU
                    * (s as f64 / self.sats_per_plane as f64 + self.phasing_f * p as f64 / total))
                    % TAU;
                let sgp4 = Sgp4::new(
                    g,
                    false,
                    WALKER_EPOCH_DAYS_1950,
                    0.0, // bstar (drag): a clean design pattern, no decay
                    0.0, // eccentricity: circular
                    0.0, // argp
                    inclo,
                    mo,
                    no_kozai,
                    nodeo,
                );
                sats.push(crate::orbit::Propagator::Sgp4(Box::new(sgp4)));
            }
        }
        sats
    }
}

/// The ECEF positions of the constellation satellites visible from `station`
/// (above `mask_deg`) at `t_sec` after the common Walker epoch. The Walker
/// satellites are propagated through SGP4 in the inertial TEME frame, then rotated
/// to Earth-fixed with the sidereal time of the absolute instant, so the ground
/// track moves correctly over the window.
fn visible_ecef(
    sats: &[Propagator],
    station: Geodetic,
    t_sec: f64,
    mask_deg: f64,
) -> Vec<[f64; 3]> {
    let jd = walker_epoch_jd() + t_sec / 86_400.0;
    sats.iter()
        .map(|p| teme_to_ecef(p.position_eci(t_sec), jd))
        .filter(|&r| is_visible(station, r, mask_deg))
        .collect()
}

fn median_sorted(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// One cell of a constellation-design sweep: the design parameters and the
/// position-dilution statistics they produce over the sampled window.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SweepCell {
    pub planes: usize,
    pub sats_per_plane: usize,
    pub inclination_deg: f64,
    pub total: usize,
    /// Fraction of time samples at which a fix (≥ 4 visible satellites with a
    /// non-singular geometry) was possible.
    pub coverage_fraction: f64,
    /// Median and worst position dilution of precision over the samples with a fix.
    pub median_pdop: Option<f64>,
    pub worst_pdop: Option<f64>,
}

/// Sweep a Walker-delta design over a grid of `{planes × sats_per_plane ×
/// inclination}` (at a fixed altitude and phasing) and tabulate, for each
/// combination, the coverage fraction and the median/worst PDOP seen from
/// `station` across the time window. This is the standard constellation-design
/// trade table: how many planes and satellites, at what inclination, buy what
/// geometry.
#[allow(clippy::too_many_arguments)]
pub fn pdop_sweep(
    altitude_km: f64,
    planes_grid: &[usize],
    sats_grid: &[usize],
    inclination_grid: &[f64],
    phasing_f: f64,
    station: Geodetic,
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
) -> Vec<SweepCell> {
    let n = (duration_s / step_s).round() as usize;
    let mut cells = Vec::new();
    for &planes in planes_grid {
        for &sats_per_plane in sats_grid {
            for &inclination_deg in inclination_grid {
                let walker = WalkerSgp4 {
                    altitude_km,
                    inclination_deg,
                    planes,
                    sats_per_plane,
                    phasing_f,
                };
                let sats = walker.satellites();
                let mut pdops = Vec::new();
                for i in 0..=n {
                    let t = i as f64 * step_s;
                    if let Some(d) = dop(
                        geodetic_to_ecef(station),
                        &visible_ecef(&sats, station, t, mask_deg),
                    ) {
                        pdops.push(d.pdop);
                    }
                }
                let worst = pdops
                    .iter()
                    .copied()
                    .fold(None, |a: Option<f64>, p| Some(a.map_or(p, |x| x.max(p))));
                cells.push(SweepCell {
                    planes,
                    sats_per_plane,
                    inclination_deg,
                    total: walker.total(),
                    coverage_fraction: pdops.len() as f64 / (n as f64 + 1.0),
                    median_pdop: median_sorted(pdops.clone()),
                    worst_pdop: worst,
                });
            }
        }
    }
    cells
}

/// Coverage and revisit figures of merit for a constellation at a single ground
/// point over a time window. A sample "covers" the point when at least
/// `min_sats` satellites are visible above `mask_deg`. The revisit gaps are the
/// contiguous stretches with **no** coverage; the longest such gap is the worst
/// revisit interval a user at that point would experience.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CoverageReport {
    pub samples_total: usize,
    pub samples_covered: usize,
    pub coverage_fraction: f64,
    pub max_revisit_gap_s: f64,
    pub mean_revisit_gap_s: f64,
}

/// Sample a constellation's coverage of `station` over the window and summarise
/// the coverage fraction and revisit gaps (see [`CoverageReport`]).
pub fn coverage_revisit(
    sats: &[Propagator],
    station: Geodetic,
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    min_sats: usize,
) -> CoverageReport {
    let n = (duration_s / step_s).round() as usize;
    let mut covered = 0usize;
    let mut gaps: Vec<f64> = Vec::new();
    let mut current_gap = 0usize; // consecutive uncovered samples
    for i in 0..=n {
        let t = i as f64 * step_s;
        let visible = visible_ecef(sats, station, t, mask_deg).len();
        if visible >= min_sats {
            covered += 1;
            if current_gap > 0 {
                gaps.push(current_gap as f64 * step_s);
                current_gap = 0;
            }
        } else {
            current_gap += 1;
        }
    }
    if current_gap > 0 {
        gaps.push(current_gap as f64 * step_s);
    }
    let max_gap = gaps.iter().copied().fold(0.0_f64, f64::max);
    let mean_gap = if gaps.is_empty() {
        0.0
    } else {
        gaps.iter().sum::<f64>() / gaps.len() as f64
    };
    let total = n + 1;
    CoverageReport {
        samples_total: total,
        samples_covered: covered,
        coverage_fraction: covered as f64 / total as f64,
        max_revisit_gap_s: max_gap,
        mean_revisit_gap_s: mean_gap,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::orbit::Propagator;

    fn radius(p: [f64; 3]) -> f64 {
        (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt()
    }

    /// A GPS-like Walker: 24 satellites, 6 planes of 4, 55° inclination, MEO.
    fn gps_like() -> WalkerSgp4 {
        WalkerSgp4 {
            altitude_km: 20_180.0,
            inclination_deg: 55.0,
            planes: 6,
            sats_per_plane: 4,
            phasing_f: 1.0,
        }
    }

    #[test]
    fn walker_builds_sgp4_satellites_on_the_target_shell() {
        let w = gps_like();
        let sats = w.satellites();
        assert_eq!(sats.len(), 24, "6 planes x 4 sats");
        let target_r = (wgs72().radiusearthkm + w.altitude_km) * 1000.0;
        for s in &sats {
            assert!(
                matches!(s, Propagator::Sgp4(_)),
                "Walker must emit SGP4 propagators (the validated core)"
            );
            // At epoch the satellite sits on the requested circular shell. SGP4's
            // J2 un-Kozai shifts the mean motion slightly, so allow 1%.
            let r = radius(s.position_eci(0.0));
            assert!(
                (r - target_r).abs() / target_r < 0.01,
                "Walker SGP4 radius {r:.0} m vs target {target_r:.0} m"
            );
        }
    }

    #[test]
    fn walker_planes_are_equally_spaced_in_raan() {
        // Four planes, one satellite each, so the only difference between sats is
        // the ascending-node longitude. Recover each plane's RAAN from its orbit
        // normal and check the four are spaced exactly 90° apart.
        let w = WalkerSgp4 {
            altitude_km: 20_180.0,
            inclination_deg: 55.0,
            planes: 4,
            sats_per_plane: 1,
            phasing_f: 0.0,
        };
        let sats = w.satellites();
        assert_eq!(sats.len(), 4);
        // Orbit normal h = r x v points along (sin i sinΩ, -sin i cosΩ, cos i),
        // so the ascending-node longitude is Ω = atan2(h_x, -h_y).
        let raan_deg = |p: &Propagator| {
            let r = p.position_eci(0.0);
            let v = p.velocity_eci(0.0);
            let hx = r[1] * v[2] - r[2] * v[1];
            let hy = r[2] * v[0] - r[0] * v[2];
            hx.atan2(-hy).rem_euclid(TAU).to_degrees()
        };
        let raans: Vec<f64> = sats.iter().map(raan_deg).collect();
        for (k, &om) in raans.iter().enumerate() {
            let expect = 90.0 * k as f64;
            let diff = (om - expect).rem_euclid(360.0);
            let diff = diff.min(360.0 - diff);
            assert!(
                diff < 0.5,
                "plane {k} RAAN {om:.2}°, expected {expect:.0}° (off by {diff:.2}°)"
            );
        }
    }

    #[test]
    fn walker_mean_motion_matches_the_orbital_period() {
        // A 20 180 km circular orbit is the GPS half-sidereal-day orbit: period
        // ~11 h 58 m. Check the chosen mean motion reproduces it within 0.2%.
        let w = gps_like();
        let n_rad_min = w.mean_motion_kozai_rad_min();
        let period_min = TAU / n_rad_min;
        assert!(
            (period_min - 718.0).abs() < 2.0,
            "GPS-shell period {period_min:.1} min, expected ~718 min"
        );
    }

    fn munich() -> Geodetic {
        Geodetic {
            lat_rad: 48.0_f64.to_radians(),
            lon_rad: 11.0_f64.to_radians(),
            alt_m: 600.0,
        }
    }

    #[test]
    fn pdop_sweep_improves_with_more_satellites() {
        // Sweep the satellites-per-plane axis over a 12 h window. Adding
        // satellites must monotonically improve the geometry: coverage rises and
        // the median PDOP falls. This is the constellation-design trade table.
        let cells = pdop_sweep(
            20_180.0,
            &[6],
            &[2, 4, 6],
            &[55.0],
            1.0,
            munich(),
            600.0,
            43_200.0,
            5.0,
        );
        assert_eq!(cells.len(), 3);
        assert_eq!(
            cells.iter().map(|c| c.total).collect::<Vec<_>>(),
            vec![12, 24, 36]
        );
        let med: Vec<f64> = cells.iter().map(|c| c.median_pdop.unwrap()).collect();
        assert!(
            med[0] > med[1] && med[1] > med[2],
            "median PDOP must fall as satellites are added: {med:?}"
        );
        let cov: Vec<f64> = cells.iter().map(|c| c.coverage_fraction).collect();
        assert!(
            cov[0] <= cov[1] && cov[1] <= cov[2],
            "coverage must not fall as satellites are added: {cov:?}"
        );
        // The full 24-satellite GPS-like design gives continuous coverage at a
        // good dilution of precision, and the worst case never beats the median.
        let gps = &cells[1];
        assert_eq!(gps.total, 24);
        assert!(
            (gps.coverage_fraction - 1.0).abs() < 1e-9,
            "24-sat coverage {}",
            gps.coverage_fraction
        );
        let m = gps.median_pdop.unwrap();
        assert!((1.0..2.5).contains(&m), "24-sat median PDOP {m}");
        assert!(
            gps.worst_pdop.unwrap() >= m,
            "worst PDOP must dominate median"
        );
    }

    #[test]
    fn coverage_and_revisit_track_constellation_size() {
        // A full GPS-like constellation covers a ground point continuously (no
        // revisit gap); a thinned design leaves real gaps, and densifying it
        // strictly improves both coverage and the worst revisit interval.
        let dense = gps_like();
        let dr = coverage_revisit(&dense.satellites(), munich(), 600.0, 86_400.0, 5.0, 4);
        assert!(
            (dr.coverage_fraction - 1.0).abs() < 1e-9,
            "dense coverage {}",
            dr.coverage_fraction
        );
        assert_eq!(
            dr.max_revisit_gap_s, 0.0,
            "a full GPS-like constellation should have no coverage gaps"
        );

        let thin = WalkerSgp4 {
            altitude_km: 20_180.0,
            inclination_deg: 55.0,
            planes: 3,
            sats_per_plane: 3,
            phasing_f: 1.0,
        };
        let tr = coverage_revisit(&thin.satellites(), munich(), 600.0, 86_400.0, 5.0, 4);
        assert!(
            tr.coverage_fraction > 0.0 && tr.coverage_fraction < 1.0,
            "thin coverage {} should be partial",
            tr.coverage_fraction
        );
        assert!(
            tr.max_revisit_gap_s > 0.0 && tr.max_revisit_gap_s < 86_400.0,
            "thin max revisit gap {} should be a real finite gap",
            tr.max_revisit_gap_s
        );
        assert!(
            dr.coverage_fraction > tr.coverage_fraction,
            "densifying must raise coverage"
        );
        assert!(
            dr.max_revisit_gap_s < tr.max_revisit_gap_s,
            "densifying must shrink the worst revisit gap"
        );
        assert!(
            tr.mean_revisit_gap_s <= tr.max_revisit_gap_s,
            "mean gap cannot exceed the max gap"
        );
    }
}
