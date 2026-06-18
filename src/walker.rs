// SPDX-License-Identifier: AGPL-3.0-only
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

// ── Streets-of-coverage geometry (analytical, Rider/Beste) ───────────────────────

/// Earth-central **coverage half-angle** `λ` (rad) of a satellite at altitude
/// `altitude_km` seen at a minimum elevation `min_elev_deg`: the largest geocentric
/// angle from the sub-satellite point to a ground point that still sees the
/// satellite above the mask. From the slant-range triangle (Wertz, *SMAD*; Rider
/// 1985):
///
/// ```text
///   λ = arccos( (Re / (Re + h)) · cos ε ) − ε.
/// ```
///
/// At `ε = 0` this is the geometric-horizon half-angle `arccos(Re/(Re+h))`; raising
/// the mask shrinks it. Returns `None` for a non-physical altitude.
pub fn coverage_half_angle_rad(altitude_km: f64, min_elev_deg: f64) -> Option<f64> {
    if altitude_km <= 0.0 {
        return None;
    }
    let re = wgs72().radiusearthkm;
    let r = re + altitude_km;
    let eps = min_elev_deg.to_radians();
    let x = (re / r) * eps.cos();
    if !(-1.0..=1.0).contains(&x) {
        return None;
    }
    Some(x.acos() - eps)
}

/// Street-of-coverage **half-width** `c` (rad) for `sats_per_plane` satellites
/// equally spaced in one orbital plane, each with coverage half-angle `lambda_rad`:
///
/// ```text
///   cos c = cos λ / cos(π / s).
/// ```
///
/// The street is the band along the orbital plane kept continuously in view by the
/// plane's satellites (Rider/Beste). Returns `None` when the in-plane spacing leaves
/// a gap (`λ < π/s`, i.e. the satellites are too sparse for a continuous street),
/// which is exactly the condition `cos λ / cos(π/s) > 1`.
pub fn street_half_width_rad(lambda_rad: f64, sats_per_plane: usize) -> Option<f64> {
    if sats_per_plane == 0 {
        return None;
    }
    let half_spacing = std::f64::consts::PI / sats_per_plane as f64;
    let denom = half_spacing.cos();
    if denom == 0.0 {
        return None;
    }
    let cos_c = lambda_rad.cos() / denom;
    if !(-1.0..=1.0).contains(&cos_c) {
        return None; // λ < π/s: no continuous street.
    }
    Some(cos_c.acos())
}

// ── Constellation-design optimiser ───────────────────────────────────────────────

/// What a constellation-design search minimises (or maximises). The search ranges
/// over the same Walker design grid as [`pdop_sweep`] and selects the winning cell.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum DesignObjective {
    /// Fewest **total satellites** among designs whose coverage fraction (the share
    /// of time a ≥ 4-satellite fix exists) is at least `min_fraction`. Ties break to
    /// the smaller worst-case PDOP. This is "minimise satellite count for X% coverage".
    MinSatellitesForCoverage { min_fraction: f64 },
    /// The largest **coverage fraction** (best availability); ties break to fewer
    /// satellites, then smaller worst-case PDOP.
    MaxCoverage,
    /// The smallest **worst-case PDOP** (best worst-geometry) among designs that
    /// achieve a fix at all; ties break to fewer satellites.
    MinWorstPdop,
}

/// Search a Walker design grid (`planes × sats_per_plane × inclination` at a fixed
/// altitude/phasing) and return the cell that best satisfies `objective`, together
/// with the full ranked table. This is a gradient-free grid optimiser over the
/// already-validated [`pdop_sweep`] geometry — deterministic, so the chosen design
/// is reproducible. `None` only if no grid cell satisfies the objective (e.g. no
/// design reaches `min_fraction`).
#[allow(clippy::too_many_arguments)]
pub fn optimize_walker_design(
    altitude_km: f64,
    planes_grid: &[usize],
    sats_grid: &[usize],
    inclination_grid: &[f64],
    phasing_f: f64,
    station: Geodetic,
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    objective: DesignObjective,
) -> Option<(SweepCell, Vec<SweepCell>)> {
    let cells = pdop_sweep(
        altitude_km,
        planes_grid,
        sats_grid,
        inclination_grid,
        phasing_f,
        station,
        step_s,
        duration_s,
        mask_deg,
    );
    let best = match objective {
        DesignObjective::MinSatellitesForCoverage { min_fraction } => cells
            .iter()
            .filter(|c| c.coverage_fraction >= min_fraction)
            .min_by(|a, b| {
                a.total
                    .cmp(&b.total)
                    .then_with(|| cmp_pdop(a.worst_pdop, b.worst_pdop))
            }),
        DesignObjective::MaxCoverage => cells.iter().max_by(|a, b| {
            a.coverage_fraction
                .total_cmp(&b.coverage_fraction)
                // higher coverage wins; on a tie prefer fewer sats (so reverse total)
                .then_with(|| b.total.cmp(&a.total))
        }),
        DesignObjective::MinWorstPdop => cells
            .iter()
            .filter(|c| c.worst_pdop.is_some())
            .min_by(|a, b| cmp_pdop(a.worst_pdop, b.worst_pdop).then(a.total.cmp(&b.total))),
    };
    best.cloned().map(|b| (b, cells))
}

/// Order PDOPs with `None` (no fix) sorting worst (after every real value).
fn cmp_pdop(a: Option<f64>, b: Option<f64>) -> std::cmp::Ordering {
    match (a, b) {
        (Some(x), Some(y)) => x.total_cmp(&y),
        (Some(_), None) => std::cmp::Ordering::Less,
        (None, Some(_)) => std::cmp::Ordering::Greater,
        (None, None) => std::cmp::Ordering::Equal,
    }
}

// ── Streets-of-coverage minimum-satellite sizing ─────────────────────────────────

/// An idealised streets-of-coverage constellation sizing: the minimum satellite count for
/// continuous single global coverage.
#[derive(Clone, Copy, Debug)]
pub struct StreetsCoverageDesign {
    /// Minimum number of (near-polar, evenly spaced) orbital planes.
    pub planes: usize,
    /// Satellites per plane (the input).
    pub sats_per_plane: usize,
    /// Total satellites, `planes × sats_per_plane`.
    pub total: usize,
    /// Per-satellite Earth-central coverage half-angle `λ` (rad).
    pub lambda_rad: f64,
    /// Per-plane street half-width `c` (rad).
    pub street_half_width_rad: f64,
}

/// Idealised **streets-of-coverage minimum-satellite** sizing for continuous single global
/// coverage with `sats_per_plane` satellites per plane at the given altitude and elevation
/// mask. Builds on the shipped coverage half-angle `λ` ([`coverage_half_angle_rad`]) and street
/// half-width `c` ([`street_half_width_rad`]): with near-polar planes whose ascending nodes are
/// spread evenly across `π` of longitude, the gap between adjacent planes (`π/p`) is closed when
/// each street reaches halfway, `c ≥ π/(2p)`, so the minimum plane count is `p = ⌈π / (2c)⌉` and
/// the total is `p · sats_per_plane`.
///
/// Returns `None` when the satellites are too sparse to form a continuous street
/// (`λ < π/sats_per_plane`). Honest scope: this is the idealised evenly-spaced co-rotating
/// estimate; the seam-exact Rider correction at the counter-rotating plane boundary (which can
/// nudge the real minimum up by a plane) is a documented follow-on.
pub fn min_satellites_streets_of_coverage(
    altitude_km: f64,
    min_elev_deg: f64,
    sats_per_plane: usize,
) -> Option<StreetsCoverageDesign> {
    let lambda = coverage_half_angle_rad(altitude_km, min_elev_deg)?;
    let c = street_half_width_rad(lambda, sats_per_plane)?;
    if c <= 0.0 {
        return None;
    }
    let planes = (std::f64::consts::PI / (2.0 * c)).ceil().max(1.0) as usize;
    Some(StreetsCoverageDesign {
        planes,
        sats_per_plane,
        total: planes * sats_per_plane,
        lambda_rad: lambda,
        street_half_width_rad: c,
    })
}

// ── Multi-constellation comparison tool ──────────────────────────────────────────

/// One constellation's figures of merit in a multi-constellation comparison.
#[derive(Clone, Debug)]
pub struct ConstellationComparison {
    /// A label for the design (e.g. `"GPS"`, `"Galileo"`).
    pub name: String,
    /// The swept geometry for this single design (coverage, PDOP, total satellites).
    pub cell: SweepCell,
}

/// Multi-constellation comparison tool: evaluate each named Walker `design`
/// `(name, planes, sats_per_plane, inclination_deg)` against the same ground station and time
/// window and return their coverage / PDOP / size side by side. A thin orchestration over
/// [`pdop_sweep`], so each constellation is scored on exactly the same validated geometry as
/// the design trade table.
#[allow(clippy::too_many_arguments)]
pub fn compare_constellations(
    designs: &[(&str, usize, usize, f64)],
    altitude_km: f64,
    phasing_f: f64,
    station: Geodetic,
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
) -> Vec<ConstellationComparison> {
    designs
        .iter()
        .map(|&(name, planes, sats, incl)| {
            let cells = pdop_sweep(
                altitude_km,
                &[planes],
                &[sats],
                &[incl],
                phasing_f,
                station,
                step_s,
                duration_s,
                mask_deg,
            );
            ConstellationComparison {
                name: name.to_string(),
                cell: cells.into_iter().next().expect("one design cell"),
            }
        })
        .collect()
}

// ── Walker design sweep with coverage/revisit and a Pareto front ─────────────────

/// One design cell of a [`walker_design_sweep`]: the `planes × sats_per_plane`
/// design at the swept inclination, with both the geometry (coverage fraction and
/// worst-case PDOP) and the service (max/mean revisit gap) figures of merit a
/// constellation trade needs side by side.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct WalkerDesignCell {
    pub planes: usize,
    pub sats_per_plane: usize,
    pub inclination_deg: f64,
    pub total: usize,
    /// Fraction of samples with at least `min_sats` satellites visible.
    pub coverage_fraction: f64,
    /// Worst position dilution of precision over the window (`None` if never a fix).
    pub worst_pdop: Option<f64>,
    /// Longest stretch with fewer than `min_sats` satellites in view (s).
    pub max_revisit_gap_s: f64,
    /// Mean revisit gap (s).
    pub mean_revisit_gap_s: f64,
}

/// A Walker design sweep with the non-dominated (Pareto-optimal) designs flagged.
#[derive(Clone, Debug, Serialize)]
pub struct WalkerDesignReport {
    /// Every design cell in the swept grid, row-major over `planes × sats_per_plane`.
    pub cells: Vec<WalkerDesignCell>,
    /// Indices into `cells` of the Pareto-optimal designs (see [`pareto_front`]).
    pub pareto_indices: Vec<usize>,
}

impl WalkerDesignReport {
    /// Serialize the report (cells + Pareto front, including the revisit-time fields)
    /// as pretty JSON.
    pub fn to_json(&self) -> String {
        serde_json::to_string_pretty(self).expect("WalkerDesignReport serializes")
    }
}

/// The Pareto front (non-dominated set) of a design grid. A design `a` *dominates*
/// `b` when it is no worse on every objective — fewer or equal satellites, at least
/// as much coverage, no larger worst-case PDOP, no longer max revisit gap — and
/// strictly better on at least one. A missing PDOP (no fix ever) counts as the worst
/// possible. The returned indices are the designs no other design dominates.
pub fn pareto_front(cells: &[WalkerDesignCell]) -> Vec<usize> {
    let pdop = |c: &WalkerDesignCell| c.worst_pdop.unwrap_or(f64::INFINITY);
    let dominates = |a: &WalkerDesignCell, b: &WalkerDesignCell| {
        let no_worse = a.total <= b.total
            && a.coverage_fraction >= b.coverage_fraction
            && pdop(a) <= pdop(b)
            && a.max_revisit_gap_s <= b.max_revisit_gap_s;
        let strictly_better = a.total < b.total
            || a.coverage_fraction > b.coverage_fraction
            || pdop(a) < pdop(b)
            || a.max_revisit_gap_s < b.max_revisit_gap_s;
        no_worse && strictly_better
    };
    (0..cells.len())
        .filter(|&i| !(0..cells.len()).any(|j| j != i && dominates(&cells[j], &cells[i])))
        .collect()
}

/// Sweep a Walker design over a `planes_grid × sats_grid` grid at a fixed
/// inclination, tabulating coverage, worst-case PDOP, and revisit gaps for each, and
/// flag the Pareto-optimal designs. This is the constellation-design trade study: it
/// runs the grid, reports every cell, and identifies the non-dominated frontier.
#[allow(clippy::too_many_arguments)]
pub fn walker_design_sweep(
    altitude_km: f64,
    planes_grid: &[usize],
    sats_grid: &[usize],
    inclination_deg: f64,
    phasing_f: f64,
    station: Geodetic,
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    min_sats: usize,
) -> WalkerDesignReport {
    let n = (duration_s / step_s).round() as usize;
    let mut cells = Vec::new();
    for &planes in planes_grid {
        for &sats_per_plane in sats_grid {
            let walker = WalkerSgp4 {
                altitude_km,
                inclination_deg,
                planes,
                sats_per_plane,
                phasing_f,
            };
            let sats = walker.satellites();
            let mut worst: Option<f64> = None;
            for i in 0..=n {
                let t = i as f64 * step_s;
                if let Some(d) = dop(
                    geodetic_to_ecef(station),
                    &visible_ecef(&sats, station, t, mask_deg),
                ) {
                    worst = Some(worst.map_or(d.pdop, |x| x.max(d.pdop)));
                }
            }
            let cov = coverage_revisit(&sats, station, step_s, duration_s, mask_deg, min_sats);
            cells.push(WalkerDesignCell {
                planes,
                sats_per_plane,
                inclination_deg,
                total: walker.total(),
                coverage_fraction: cov.coverage_fraction,
                worst_pdop: worst,
                max_revisit_gap_s: cov.max_revisit_gap_s,
                mean_revisit_gap_s: cov.mean_revisit_gap_s,
            });
        }
    }
    let pareto_indices = pareto_front(&cells);
    WalkerDesignReport {
        cells,
        pareto_indices,
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

    #[test]
    fn coverage_half_angle_matches_hand_geometry() {
        // GPS shell (20 180 km) at a 5° mask: λ = arccos(Re/r·cos ε) − ε. With
        // Re = 6378.135 km, r = 26 558.135 km, Re/r = 0.24016, cos 5° = 0.99619,
        // λ = arccos(0.23924) − 5° ≈ 76.16° − 5° = 71.16°.
        let lambda = coverage_half_angle_rad(20_180.0, 5.0).unwrap();
        assert!(
            (lambda.to_degrees() - 71.16).abs() < 0.3,
            "λ = {}°, expected ≈ 71.16°",
            lambda.to_degrees()
        );
        // At a 0° mask λ is the geometric-horizon half-angle arccos(Re/r) ≈ 76.10°,
        // and raising the mask must shrink the footprint.
        let horizon = coverage_half_angle_rad(20_180.0, 0.0).unwrap();
        assert!(
            (horizon.to_degrees() - 76.10).abs() < 0.3 && horizon > lambda,
            "horizon λ = {}°",
            horizon.to_degrees()
        );
        assert!(coverage_half_angle_rad(-1.0, 5.0).is_none());
    }

    #[test]
    fn street_half_width_matches_hand_geometry_and_detects_gaps() {
        // Four GPS satellites per plane (λ ≈ 71.16°): cos c = cos λ / cos(π/4) =
        // 0.32289 / 0.70711 = 0.45663, c = arccos(0.45663) ≈ 62.83°.
        let lambda = coverage_half_angle_rad(20_180.0, 5.0).unwrap();
        let c = street_half_width_rad(lambda, 4).unwrap();
        assert!(
            (c.to_degrees() - 62.83).abs() < 0.5,
            "street half-width {}°, expected ≈ 62.83°",
            c.to_degrees()
        );
        // More satellites per plane → a wider continuous street (c grows toward λ).
        let c6 = street_half_width_rad(lambda, 6).unwrap();
        assert!(c6 > c, "6 sats/plane should widen the street: {c6} vs {c}");
        // Too sparse for a continuous street: a small footprint with few sats leaves
        // a gap (λ = 20° < π/6 = 30° ⇒ cos λ / cos(π/6) > 1 ⇒ None).
        assert!(street_half_width_rad(20.0_f64.to_radians(), 6).is_none());
    }

    #[test]
    fn optimizer_selects_the_brute_force_best_for_each_objective() {
        // The optimiser must return exactly the grid cell a brute-force scan picks,
        // for each objective. Single sweep: it returns (best, full_table), so we
        // re-derive the winner from the table and assert equality (no nondeterminism).
        let planes = [4, 6];
        let sats = [3, 4];
        let inc = [55.0];
        let (best_cov, table) = optimize_walker_design(
            20_180.0,
            &planes,
            &sats,
            &inc,
            1.0,
            munich(),
            600.0,
            43_200.0,
            5.0,
            DesignObjective::MinSatellitesForCoverage { min_fraction: 0.99 },
        )
        .expect("a design reaches 99% coverage");
        // Brute force: fewest total among cells with coverage ≥ 0.99.
        let expect = table
            .iter()
            .filter(|c| c.coverage_fraction >= 0.99)
            .min_by(|a, b| {
                a.total
                    .cmp(&b.total)
                    .then(cmp_pdop(a.worst_pdop, b.worst_pdop))
            })
            .unwrap();
        assert_eq!(
            best_cov, *expect,
            "min-satellites pick disagrees with brute force"
        );

        let (best_pdop, table2) = optimize_walker_design(
            20_180.0,
            &planes,
            &sats,
            &inc,
            1.0,
            munich(),
            600.0,
            43_200.0,
            5.0,
            DesignObjective::MinWorstPdop,
        )
        .unwrap();
        let expect_pdop = table2
            .iter()
            .filter(|c| c.worst_pdop.is_some())
            .min_by(|a, b| cmp_pdop(a.worst_pdop, b.worst_pdop).then(a.total.cmp(&b.total)))
            .unwrap();
        assert_eq!(best_pdop, *expect_pdop, "min-worst-PDOP pick disagrees");
        // The best worst-PDOP design is no worse than any other cell's worst PDOP.
        for c in &table2 {
            if let (Some(b), Some(x)) = (best_pdop.worst_pdop, c.worst_pdop) {
                assert!(b <= x + 1e-12, "a cell beats the chosen worst-PDOP optimum");
            }
        }
    }

    #[test]
    fn worked_example_gps_walker_24_vs_18_degrades() {
        // The standard teaching scenario: a GPS Walker 24/6/1 (55°) versus a thinned
        // 18-satellite (6 planes × 3) design. Removing six satellites must not improve
        // either availability or worst-case geometry.
        let cells = pdop_sweep(
            20_180.0,
            &[6],
            &[3, 4],
            &[55.0],
            1.0,
            munich(),
            600.0,
            86_400.0,
            5.0,
        );
        let s18 = cells.iter().find(|c| c.total == 18).unwrap();
        let s24 = cells.iter().find(|c| c.total == 24).unwrap();
        assert!(
            s24.coverage_fraction >= s18.coverage_fraction,
            "24 sats must cover at least as well as 18: {} vs {}",
            s24.coverage_fraction,
            s18.coverage_fraction
        );
        assert!(
            (s24.coverage_fraction - 1.0).abs() < 1e-9,
            "the full 24-sat design should give continuous coverage, got {}",
            s24.coverage_fraction
        );
        if let (Some(w24), Some(w18)) = (s24.worst_pdop, s18.worst_pdop) {
            assert!(
                w24 <= w18 + 1e-9,
                "24-sat worst PDOP {w24} should beat 18-sat {w18}"
            );
        }
    }

    #[test]
    fn streets_of_coverage_sizes_a_global_constellation() {
        // A GPS-altitude satellite (20 180 km, 5° mask) sees an Earth-central cap of half-angle
        // λ ≈ 71.16°; four satellites per plane stretch that into a street ≈ 62.83° wide. Evenly
        // spaced near-polar planes then need ⌈π/(2c)⌉ = 2 planes ⇒ 8 satellites for the idealised
        // continuous single global coverage.
        let d = min_satellites_streets_of_coverage(20_180.0, 5.0, 4).expect("sizable");
        assert!((d.lambda_rad - 1.2420).abs() < 1e-3, "λ = {}", d.lambda_rad);
        assert!(
            (d.street_half_width_rad - 1.0965).abs() < 1e-3,
            "c = {}",
            d.street_half_width_rad
        );
        assert_eq!(d.planes, 2);
        assert_eq!(d.total, 8);
        // A denser plane (more satellites) makes a wider street, so it needs no more planes.
        let dense = min_satellites_streets_of_coverage(20_180.0, 5.0, 8).expect("sizable");
        assert!(dense.planes <= d.planes);
    }

    #[test]
    fn streets_of_coverage_rejects_under_population() {
        // Low orbit (500 km, 10° mask) gives a small λ ≈ 14°; three satellites per plane sit
        // 120° apart and cannot form a continuous street (λ < π/s) ⇒ no global sizing.
        assert!(min_satellites_streets_of_coverage(500.0, 10.0, 3).is_none());
    }

    #[test]
    fn compare_constellations_ranks_density() {
        // The comparison tool scores each named design on the same station/window. A full GPS
        // 24-satellite Walker must compare at least as well as a thinned 18-satellite design on
        // both availability and worst-case geometry, with the labels preserved.
        let cmp = compare_constellations(
            &[("GPS-24", 6, 4, 55.0), ("Thinned-18", 6, 3, 55.0)],
            20_180.0,
            1.0,
            munich(),
            600.0,
            43_200.0,
            5.0,
        );
        assert_eq!(cmp.len(), 2);
        let gps = cmp.iter().find(|c| c.name == "GPS-24").unwrap();
        let thin = cmp.iter().find(|c| c.name == "Thinned-18").unwrap();
        assert_eq!(gps.cell.total, 24);
        assert_eq!(thin.cell.total, 18);
        assert!(
            gps.cell.coverage_fraction >= thin.cell.coverage_fraction,
            "GPS-24 coverage {} vs thinned {}",
            gps.cell.coverage_fraction,
            thin.cell.coverage_fraction
        );
        if let (Some(wg), Some(wt)) = (gps.cell.worst_pdop, thin.cell.worst_pdop) {
            assert!(wg <= wt + 1e-9, "GPS-24 worst PDOP {wg} vs thinned {wt}");
        }
    }

    fn rot_z(v: [f64; 3], a: f64) -> [f64; 3] {
        let (sn, cs) = a.sin_cos();
        [v[0] * cs - v[1] * sn, v[0] * sn + v[1] * cs, v[2]]
    }

    fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
        ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
    }

    #[test]
    fn walker_formation_matches_the_formula_to_1km_over_24h() {
        // The Walker i:T/P/F formula places the P planes one RAAN step 2π/P apart. Two
        // satellites in the *same slot* of adjacent planes share their mean anomaly,
        // argument of perigee, inclination and semi-major axis at every instant — under
        // SGP4 those secular quantities drift at identical rates, so only the RAAN differs,
        // by a constant 2π/P. A RAAN difference is a rigid rotation about the inertial
        // z-axis, and because the shared argument of latitude makes the J2 short-period
        // perturbations identical, plane p maps onto plane 0 by R_z(2π·p/P) *exactly*. That
        // is the defining Walker invariant; verifying it to < 1 km at epoch and after a full
        // 24 h confirms the generated mean elements realise the formula and that SGP4's
        // secular drift preserves the pattern. (The 8 km J2 short-period radial breathing is
        // common-mode here, so it cancels — this is a genuine sub-km check, not a loose one.)
        let w = WalkerSgp4 {
            altitude_km: 1200.0,
            inclination_deg: 60.0,
            planes: 5,
            sats_per_plane: 3,
            phasing_f: 0.0,
        };
        let sats = w.satellites(); // plane-major: plane p, slot 0 is index p * sats_per_plane
        let s = w.sats_per_plane;
        let dphi = TAU / w.planes as f64;
        for &t in &[0.0, 43_200.0, 86_400.0] {
            let r0 = sats[0].position_eci(t); // plane 0, slot 0
            for p in 1..w.planes {
                let rp = sats[p * s].position_eci(t); // plane p, slot 0
                let expect = rot_z(r0, dphi * p as f64);
                let d = dist(rp, expect);
                assert!(
                    d < 1000.0,
                    "plane {p} at t={t}s: {d:.3} m from R_z(2π·{p}/{}) of plane 0",
                    w.planes
                );
            }
        }
    }

    #[test]
    fn walker_in_plane_slots_are_spaced_by_the_formula_in_the_mean() {
        // Within one plane the S slots are spaced 2π/S in mean anomaly. The *instantaneous*
        // geocentric separation breathes by ~0.1° as the J2 short-period perturbation acts at
        // each slot's own argument of latitude, but the *mean* separation is exactly 2π/S —
        // the short-period term integrates to zero over an orbit. Averaging the consecutive-
        // slot angle over the full 24 h (many orbits) recovers the mean spacing to well under
        // a hundredth of a degree, confirming the generated mean elements realise the in-plane
        // phasing of the formula. Single plane so RAAN is common to all four satellites.
        let w = WalkerSgp4 {
            altitude_km: 1200.0,
            inclination_deg: 60.0,
            planes: 1,
            sats_per_plane: 4,
            phasing_f: 0.0,
        };
        let sats = w.satellites();
        let sep = |t: f64, i: usize, j: usize| {
            let a = sats[i].position_eci(t);
            let b = sats[j].position_eci(t);
            let dot = a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
            let na = (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt();
            let nb = (b[0] * b[0] + b[1] * b[1] + b[2] * b[2]).sqrt();
            (dot / (na * nb)).clamp(-1.0, 1.0).acos().to_degrees()
        };
        let nsamp = 1440usize; // 24 h at 60 s
        for i in 0..3 {
            let mean: f64 = (0..nsamp)
                .map(|k| sep(k as f64 * 60.0, i, i + 1))
                .sum::<f64>()
                / nsamp as f64;
            // Consecutive slots are 360/4 = 90° apart in the mean.
            assert!(
                (mean - 90.0).abs() < 0.02,
                "slot {i}->{} mean sep {mean:.4}°",
                i + 1
            );
        }
    }

    #[test]
    fn pareto_front_selects_non_dominated_designs() {
        // A: cheap, good. B: dominated by A (more sats, no better anywhere). C: expensive but
        // best coverage/PDOP/revisit. Front = {A, C}; B is dominated out.
        let cells = vec![
            WalkerDesignCell {
                planes: 3,
                sats_per_plane: 3,
                inclination_deg: 55.0,
                total: 9,
                coverage_fraction: 0.90,
                worst_pdop: Some(2.0),
                max_revisit_gap_s: 100.0,
                mean_revisit_gap_s: 50.0,
            },
            WalkerDesignCell {
                planes: 4,
                sats_per_plane: 5,
                inclination_deg: 55.0,
                total: 20,
                coverage_fraction: 0.90,
                worst_pdop: Some(3.0),
                max_revisit_gap_s: 200.0,
                mean_revisit_gap_s: 90.0,
            },
            WalkerDesignCell {
                planes: 6,
                sats_per_plane: 5,
                inclination_deg: 55.0,
                total: 30,
                coverage_fraction: 0.99,
                worst_pdop: Some(1.5),
                max_revisit_gap_s: 50.0,
                mean_revisit_gap_s: 20.0,
            },
        ];
        let front = pareto_front(&cells);
        assert_eq!(
            front,
            vec![0, 2],
            "A and C are non-dominated; B is dominated by A"
        );
    }

    #[test]
    fn walker_design_sweep_emits_a_pareto_table_and_revisit_json() {
        // A 3×3 Walker grid (planes × sats), each design scored for coverage, PDOP and
        // revisit; the report serialises to JSON carrying the revisit-time fields and the
        // Pareto front. Short window keeps the smoke test fast.
        let report = walker_design_sweep(
            1500.0,
            &[3, 4, 6],
            &[2, 3, 4],
            55.0,
            1.0,
            munich(),
            120.0,
            7200.0,
            10.0,
            1,
        );
        assert_eq!(report.cells.len(), 9, "3×3 design grid");
        assert!(
            !report.pareto_indices.is_empty(),
            "a non-empty Pareto front"
        );
        // Every flagged design is genuinely non-dominated.
        assert_eq!(report.pareto_indices, pareto_front(&report.cells));
        let json = report.to_json();
        assert!(
            json.contains("max_revisit_gap_s"),
            "revisit-time appears in JSON"
        );
        assert!(json.contains("mean_revisit_gap_s"));
        assert!(json.contains("pareto_indices"));
        // The JSON round-trips through a generic parser.
        let parsed: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert!(parsed["cells"].as_array().unwrap().len() == 9);
        assert!(parsed["cells"][0]["max_revisit_gap_s"].is_number());
    }
}
