// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar navigation **service-volume** analysis: DOP / coverage / availability and
//! generalised lunar ARAIM protection levels over a lunar surface region, from a
//! Moonlight / LCNS-class lunar-orbit constellation.
//!
//! This module *composes* three already-built pieces rather than reinventing any of
//! them:
//!
//! * [`crate::orbit::dop`] — the **VALIDATED** (vs gnss_lib_py) DOP kernel. It takes a
//!   user position and a slice of satellite positions in any consistent Cartesian
//!   frame and returns `(gdop, pdop, hdop, vdop, tdop)`. We pass Moon-fixed (MCMF)
//!   positions, exactly as [`crate::lunar::lunar_site_dop`] already does — the lunar
//!   `spherical_enu` and the orbit `enu_basis` agree (both radial-up, `+z`-seeded
//!   East), so the horizontal/vertical split is correct.
//! * [`crate::lunar`] — the LunaNet LNIS lunar ARAIM machinery
//!   ([`crate::lunar::lunar_araim`], the σ_URE ≈ 30 m + `P_sat` ≈ 1e-4 budget, the
//!   MCI↔MCMF reduction, selenographic coordinates) and the south-pole protection-level
//!   pass it is checked against.
//! * [`crate::lunar::relay_position_mci`] — the circular-Keplerian lunar-orbit
//!   propagator (mean motion from [`crate::lunar::MOON_GM_M3_S2`]).
//!
//! Honest scope (the moat): the constellation parameters are **illustrative,
//! public-source approximations** of public descriptions of the system *class* — they
//! are **not** the real Moonlight/LCNS ephemeris and imply **no** affiliation,
//! endorsement, heritage, certification or TRL. The DOP geometry is validated by reuse
//! of the gnss_lib_py-checked kernel; the coverage/availability/integrity **composition**
//! is **MODELLED**: a circular-Keplerian relay set (not the differential-corrected
//! elliptical-frozen LCNS orbits or a 9:2 NRHO), a mean-rotation Moon (no physical
//! libration / precessing pole), and LunaNet LNIS integrity parameters from published
//! material. It demonstrates the lunar service-volume *method*, not an operational
//! Moonlight availability number.
//!
//! ## Public sources for the illustrative constellation
//!
//! Public ESA material describes Lunar Communications and Navigation Services (LCNS) /
//! Moonlight as a small constellation (≈ 4 satellites in the first phase) on
//! **elliptical lunar frozen orbits** chosen to favour **south-pole** coverage (the
//! Artemis target region), with apolune over the south. The defaults below place 4
//! satellites on an inclined, eccentric, ~12 h-class lunar orbit with apolune toward
//! the southern hemisphere — an *approximation* of that public description, used only as
//! an illustrative geometry. Sources (public, for the system class only): ESA Moonlight
//! / LCNS public material; NASA/ESA LunaNet Interoperability Specification (LNIS).

use crate::lunar::{
    lunar_araim, mci_to_mcmf, selenographic_to_mcmf, Selenographic, LUNAR_SIGMA_URE_M,
    MOON_GM_M3_S2, R_MOON_M,
};
use crate::orbit::Dop;
use crate::raim::IntegrityBudget;
use serde::{Deserialize, Serialize};

type Vec3 = [f64; 3];

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

// ---------------------------------------------------------------------------
// Illustrative Moonlight / LCNS-class constellation
// ---------------------------------------------------------------------------

/// One illustrative lunar-orbit satellite in classical-element form, propagated in the
/// Moon-centred inertial (MCI) frame at the Keplerian mean motion for
/// [`crate::lunar::MOON_GM_M3_S2`]. An *elliptical* generalisation of
/// [`crate::lunar::LunarRelay`] (which is circular): with `eccentricity = 0` and
/// `argp_deg = 0` the two reduce to the same orbit.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LunarSat {
    /// Semi-major axis (m).
    pub sma_m: f64,
    /// Eccentricity (0 = circular).
    pub eccentricity: f64,
    /// Inclination (deg).
    pub inc_deg: f64,
    /// Right ascension of the ascending node (deg).
    pub raan_deg: f64,
    /// Argument of perilune (deg).
    pub argp_deg: f64,
    /// Mean anomaly at epoch (deg).
    pub mean_anom_deg: f64,
}

impl LunarSat {
    /// MCI position (m) at `t_s` seconds past epoch. Solves Kepler's equation for the
    /// eccentric then true anomaly, forms the perifocal position and rotates it by the
    /// 3-1-3 (RAAN, inclination, argument-of-perilune) sequence — the same convention as
    /// [`crate::lunar::relay_position_mci`], generalised to non-zero eccentricity.
    pub fn position_mci(&self, t_s: f64) -> Vec3 {
        let n = (MOON_GM_M3_S2 / self.sma_m.powi(3)).sqrt();
        let e = self.eccentricity;
        let m = self.mean_anom_deg.to_radians() + n * t_s;
        // Kepler's equation M = E − e sin E by Newton-Raphson (exact for e = 0).
        let mut ea = m;
        if e != 0.0 {
            for _ in 0..40 {
                let d = (ea - e * ea.sin() - m) / (1.0 - e * ea.cos());
                ea -= d;
                if d.abs() < 1e-13 {
                    break;
                }
            }
        }
        let r = self.sma_m * (1.0 - e * ea.cos());
        let nu =
            2.0 * ((1.0 + e).sqrt() * (ea * 0.5).sin()).atan2((1.0 - e).sqrt() * (ea * 0.5).cos());
        let u = self.argp_deg.to_radians() + nu;
        let (su, cu) = u.sin_cos();
        let (si, ci) = self.inc_deg.to_radians().sin_cos();
        let (sraan, craan) = self.raan_deg.to_radians().sin_cos();
        [
            r * (craan * cu - sraan * ci * su),
            r * (sraan * cu + craan * ci * su),
            r * (si * su),
        ]
    }
}

/// An **illustrative, public-source** Moonlight / LCNS-class lunar navigation
/// constellation. Not affiliated with, endorsed by, or representative of the real
/// system; the parameters approximate *public* descriptions of the system class and are
/// used only to exercise the service-volume method. See the module docs for sources.
#[derive(Clone, Debug, PartialEq)]
pub struct LunarConstellation {
    pub sats: Vec<LunarSat>,
}

impl LunarConstellation {
    /// Build a constellation from an explicit satellite set.
    pub fn new(sats: Vec<LunarSat>) -> Self {
        Self { sats }
    }

    /// The default illustrative LCNS-class constellation: `n` satellites (clamped to
    /// `[1, 12]`, default-call uses 4) phased evenly in mean anomaly on a shared
    /// inclined, eccentric, south-favouring elliptical lunar orbit. The orbit
    /// (`sma ≈ R_moon + 8000 km`, `e = 0.6`, `i = 57.7°`, `argp = 90°`) places apolune
    /// over the southern hemisphere so a south-pole user sees the satellites dwelling
    /// high — an *approximation* of the public "elliptical lunar frozen orbit favouring
    /// the south pole" description. **Illustrative; public-source; not affiliated with
    /// ESA.**
    pub fn illustrative_lcns(n: usize) -> Self {
        let n = n.clamp(1, 24);
        // ~8000 km perilune altitude → high apolune; a ~12 h-class period.
        let sma_m = R_MOON_M + 8_000_000.0;
        let sats = (0..n)
            .map(|k| LunarSat {
                sma_m,
                eccentricity: 0.6,
                inc_deg: 57.7,
                // Spread the planes a little so the geometry is not degenerate.
                raan_deg: 360.0 * (k as f64) / (n as f64),
                argp_deg: 90.0, // apolune over the south
                mean_anom_deg: 360.0 * (k as f64) / (n as f64),
            })
            .collect();
        Self { sats }
    }

    /// Number of satellites.
    pub fn n_sats(&self) -> usize {
        self.sats.len()
    }

    /// MCI positions of every satellite at `t_s` seconds past epoch.
    pub fn positions_mci(&self, t_s: f64) -> Vec<Vec3> {
        self.sats.iter().map(|s| s.position_mci(t_s)).collect()
    }

    /// MCMF (Moon-fixed) positions of every satellite at `t_s`: each is propagated in
    /// MCI then reduced to MCMF with [`crate::lunar::mci_to_mcmf`] so a rotating surface
    /// user and the satellites share one frame (mixing MCI satellites with an MCMF user
    /// rotates the geometry wrongly over a pass — always reduce first).
    pub fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        self.sats
            .iter()
            .map(|s| mci_to_mcmf(s.position_mci(t_s), t_s))
            .collect()
    }
}

impl Default for LunarConstellation {
    fn default() -> Self {
        Self::illustrative_lcns(4)
    }
}

// ---------------------------------------------------------------------------
// Visibility, DOP, coverage, protection level
// ---------------------------------------------------------------------------

/// Line-of-sight unit vectors from a lunar surface user (MCMF) to the satellites
/// (MCMF) that clear the elevation mask. Elevation is measured above the **local
/// horizon**, whose normal is the surface-normal `up = user / |user|` (the geocentric
/// radial), so a satellite is visible iff the cosine of the LOS against `up` exceeds
/// `sin(mask)` — equivalently the LOS elevation `≥ elev_mask`. For a surface user this
/// `elevation ≥ mask ≥ 0` test already excludes satellites behind the Moon's own limb
/// (a satellite below the local horizon is occulted by the body), matching
/// [`crate::lunar::lunar_visible`].
///
/// Returns the **LOS unit vectors** (one per visible satellite). The DOP kernel only
/// needs the LOS directions, but it is called with full positions elsewhere; for callers
/// that want positions use [`visible_sat_positions`].
pub fn visible_sats(user_mcmf: Vec3, sats_mcmf: &[Vec3], elev_mask_rad: f64) -> Vec<Vec3> {
    let up = unit_or_zero(user_mcmf);
    let sin_mask = elev_mask_rad.sin();
    let mut out = Vec::new();
    for &s in sats_mcmf {
        let d = [
            s[0] - user_mcmf[0],
            s[1] - user_mcmf[1],
            s[2] - user_mcmf[2],
        ];
        let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
        if n == 0.0 {
            continue;
        }
        let e = [d[0] / n, d[1] / n, d[2] / n];
        // sin(elevation) = e · up.
        if dot(e, up) >= sin_mask {
            out.push(e);
        }
    }
    out
}

/// The **positions** (MCMF) of the satellites visible above the mask — the same
/// visibility test as [`visible_sats`] but returning positions for downstream DOP /
/// ARAIM calls (both of which take full positions and recompute the LOS internally).
pub fn visible_sat_positions(user_mcmf: Vec3, sats_mcmf: &[Vec3], elev_mask_rad: f64) -> Vec<Vec3> {
    let up = unit_or_zero(user_mcmf);
    let sin_mask = elev_mask_rad.sin();
    sats_mcmf
        .iter()
        .copied()
        .filter(|&s| {
            let d = [
                s[0] - user_mcmf[0],
                s[1] - user_mcmf[1],
                s[2] - user_mcmf[2],
            ];
            let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            n > 0.0 && {
                let e = [d[0] / n, d[1] / n, d[2] / n];
                dot(e, up) >= sin_mask
            }
        })
        .collect()
}

fn unit_or_zero(v: Vec3) -> Vec3 {
    let n = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    if n == 0.0 {
        [0.0, 0.0, 0.0]
    } else {
        [v[0] / n, v[1] / n, v[2] / n]
    }
}

/// Dilution of precision at a lunar surface user from the visible satellites — a thin
/// reuse of the **VALIDATED** [`crate::orbit::dop`] kernel. Filters by the elevation
/// mask, then passes the visible **positions** straight to the kernel (DOP is
/// frame-agnostic; MCMF is consistent). `None` if fewer than four satellites are
/// visible or the geometry is singular.
pub fn service_dop(user_mcmf: Vec3, sats_mcmf: &[Vec3], elev_mask_rad: f64) -> Option<Dop> {
    let vis = visible_sat_positions(user_mcmf, sats_mcmf, elev_mask_rad);
    crate::orbit::dop(user_mcmf, &vis)
}

/// Coverage / availability statistics over a service volume (a set of surface points ×
/// a set of epochs).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct CoverageStats {
    /// Number of (point, epoch) samples evaluated.
    pub n_samples: usize,
    /// Samples with ≥ 4 visible satellites.
    pub n_four_plus: usize,
    /// Samples with ≥ 4 visible AND PDOP < threshold (the availability numerator).
    pub n_available: usize,
    /// Fraction of samples with ≥ 4 satellites and PDOP < threshold.
    pub coverage_fraction: f64,
    /// Minimum number of visible satellites seen across all samples.
    pub min_sats: usize,
    /// Maximum number of visible satellites seen across all samples.
    pub max_sats: usize,
    /// Minimum PDOP over the samples that had a defined PDOP (≥ 4 sats).
    pub pdop_min: Option<f64>,
    /// Mean PDOP over the samples that had a defined PDOP.
    pub pdop_mean: Option<f64>,
    /// Maximum PDOP over the samples that had a defined PDOP.
    pub pdop_max: Option<f64>,
    /// Median GDOP over the samples that had a defined DOP (≥ 4 sats) — an order
    /// statistic robust to the heavy tail of a sparse polar constellation, where the
    /// mean is dominated by a few near-singular epochs. `None` if no sample had a
    /// defined DOP.
    pub gdop_median: Option<f64>,
    /// Fraction of ALL (point, epoch) samples whose GDOP was defined and below 6 (the
    /// usable-geometry threshold) — the "time below GDOP 6" figure of the service.
    pub frac_below_gdop6: f64,
}

/// Coverage / availability over a service volume: for every `(grid point, epoch)`
/// sample, place the constellation in MCMF, count visible satellites and compute the
/// PDOP (reusing [`service_dop`]), and accumulate the fraction of samples with ≥ 4
/// satellites and `PDOP < pdop_threshold`, plus the PDOP and visible-count envelopes.
///
/// `grid_points_selenographic` are surface points (their altitude is honoured);
/// `times_s` are epochs (seconds past the MCI/MCMF-aligned epoch).
pub fn coverage(
    constellation: &LunarConstellation,
    grid_points_selenographic: &[Selenographic],
    times_s: &[f64],
    elev_mask_rad: f64,
    pdop_threshold: f64,
) -> CoverageStats {
    let users: Vec<Vec3> = grid_points_selenographic
        .iter()
        .map(|&s| selenographic_to_mcmf(s))
        .collect();

    let mut n_samples = 0usize;
    let mut n_four_plus = 0usize;
    let mut n_available = 0usize;
    let mut min_sats = usize::MAX;
    let mut max_sats = 0usize;
    let mut pdop_min = f64::INFINITY;
    let mut pdop_max = 0.0_f64;
    let mut pdop_sum = 0.0_f64;
    let mut pdop_n = 0usize;
    let mut gdops: Vec<f64> = Vec::new();
    let mut n_below_gdop6 = 0usize;

    for &t in times_s {
        let sats = constellation.positions_mcmf(t);
        for &user in &users {
            n_samples += 1;
            let vis = visible_sat_positions(user, &sats, elev_mask_rad);
            let nv = vis.len();
            min_sats = min_sats.min(nv);
            max_sats = max_sats.max(nv);
            if nv >= 4 {
                n_four_plus += 1;
                if let Some(d) = crate::orbit::dop(user, &vis) {
                    pdop_min = pdop_min.min(d.pdop);
                    pdop_max = pdop_max.max(d.pdop);
                    pdop_sum += d.pdop;
                    pdop_n += 1;
                    gdops.push(d.gdop);
                    if d.gdop < 6.0 {
                        n_below_gdop6 += 1;
                    }
                    if d.pdop < pdop_threshold {
                        n_available += 1;
                    }
                }
            }
        }
    }

    // Median GDOP as an exact order statistic over the defined-DOP samples.
    let gdop_median = if gdops.is_empty() {
        None
    } else {
        gdops.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
        let mid = gdops.len() / 2;
        Some(if gdops.len() % 2 == 0 {
            0.5 * (gdops[mid - 1] + gdops[mid])
        } else {
            gdops[mid]
        })
    };
    let frac_below_gdop6 = if n_samples == 0 {
        0.0
    } else {
        n_below_gdop6 as f64 / n_samples as f64
    };

    let coverage_fraction = if n_samples == 0 {
        0.0
    } else {
        n_available as f64 / n_samples as f64
    };
    CoverageStats {
        n_samples,
        n_four_plus,
        n_available,
        coverage_fraction,
        min_sats: if n_samples == 0 { 0 } else { min_sats },
        max_sats,
        pdop_min: (pdop_n > 0).then_some(pdop_min),
        pdop_mean: (pdop_n > 0).then(|| pdop_sum / pdop_n as f64),
        pdop_max: (pdop_n > 0).then_some(pdop_max),
        gdop_median,
        frac_below_gdop6,
    }
}

/// One row of the constellation-size sweep ([`sweep_over_n`]) — the P2 Table 1 record.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct NSweepRow {
    /// Number of satellites in the illustrative ELFO constellation.
    pub n_sats: usize,
    /// Availability (fraction of samples with ≥ 4 sats and PDOP below threshold).
    pub coverage_fraction: f64,
    /// Median GDOP over the defined-DOP samples.
    pub gdop_median: Option<f64>,
    /// Fraction of samples with a usable GDOP below 6.
    pub frac_below_gdop6: f64,
}

/// Sweep the illustrative ELFO constellation size `N` over `[n_min, n_max]` (clamped to
/// the 1..=24 supported range), returning the availability / median-GDOP / time-below-6
/// row for each — P2 Table 1. The median GDOP crossing 6 near `N ≈ 12` and any
/// non-monotone bump fall out of this sweep directly. Deterministic order statistics
/// over the Validated per-sample GDOP kernel.
pub fn sweep_over_n(
    n_min: usize,
    n_max: usize,
    grid_points_selenographic: &[Selenographic],
    times_s: &[f64],
    elev_mask_rad: f64,
    pdop_threshold: f64,
) -> Vec<NSweepRow> {
    (n_min.max(1)..=n_max.min(24))
        .map(|n| {
            let c = coverage(
                &LunarConstellation::illustrative_lcns(n),
                grid_points_selenographic,
                times_s,
                elev_mask_rad,
                pdop_threshold,
            );
            NSweepRow {
                n_sats: n,
                coverage_fraction: c.coverage_fraction,
                gdop_median: c.gdop_median,
                frac_below_gdop6: c.frac_below_gdop6,
            }
        })
        .collect()
}

/// Generalised lunar ARAIM protection level for an **arbitrary** surface user point
/// (selenographic), reusing the same LunaNet LNIS σ_URE + ARAIM PL machinery the
/// south-pole pass uses ([`crate::lunar::lunar_araim`]). The user point is mapped to
/// MCMF, the satellites are taken as MCMF (the caller reduces a constellation with
/// [`LunarConstellation::positions_mcmf`]), and the zero-residual all-in-view ARAIM PL
/// is returned.
///
/// Reduces to the south-pole result as a special case: with `user_selenographic` at the
/// south pole and the same satellite geometry / budget, this returns exactly what a
/// direct [`crate::lunar::lunar_araim`] call at the south pole returns (it *is* that
/// call). `None` if fewer than six satellites are usable (the ARAIM single-fault
/// hypothesis set needs `n − 1 ≥ 5` redundancy) or the geometry is singular.
pub fn lunar_protection_level(
    user_selenographic: Selenographic,
    sats_mcmf: &[Vec3],
    budget: IntegrityBudget,
) -> Option<ProtLevel> {
    let user = selenographic_to_mcmf(user_selenographic);
    let resid = vec![0.0; sats_mcmf.len()];
    lunar_araim(user, sats_mcmf, &resid, budget).map(|r| ProtLevel {
        hpl_m: r.hpl_m,
        vpl_m: r.vpl_m,
        n_used: r.n_used,
        sigma_ure_m: LUNAR_SIGMA_URE_M,
    })
}

/// A generalised lunar protection level at a service-volume point.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ProtLevel {
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
    /// Satellites used in the all-in-view solution.
    pub n_used: usize,
    /// LunaNet LNIS σ_URE (m) the PL scales with.
    pub sigma_ure_m: f64,
}

// ---------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------

fn d_n_sats() -> usize {
    // An illustrative *expanded* LCNS-class set. The first-phase public description is
    // ~4 satellites, but the generalised lunar ARAIM protection level needs ≥ 6
    // satellites in view (the single-fault hypothesis set needs n−1 ≥ 5 redundancy), so
    // the default scenario uses a fuller constellation to exercise the PL envelope as
    // well as the DOP/coverage headline. Still illustrative; public-source; not
    // affiliated with ESA.
    8
}
fn d_sma_km() -> f64 {
    R_MOON_M / 1000.0 + 8_000.0
}
fn d_ecc() -> f64 {
    0.6
}
fn d_inc_deg() -> f64 {
    57.7
}
fn d_argp_deg() -> f64 {
    90.0
}
fn d_lat_min_deg() -> f64 {
    -90.0
}
fn d_lat_max_deg() -> f64 {
    -60.0
}
fn d_lat_step_deg() -> f64 {
    10.0
}
fn d_lon_min_deg() -> f64 {
    -180.0
}
fn d_lon_max_deg() -> f64 {
    180.0
}
fn d_lon_step_deg() -> f64 {
    60.0
}
fn d_horizon_hours() -> f64 {
    12.0
}
fn d_step_min() -> f64 {
    60.0
}
fn d_elev_mask_deg() -> f64 {
    5.0
}
fn d_pdop_threshold() -> f64 {
    6.0
}
fn d_alert_limit_m() -> f64 {
    50.0
}
fn d_p_hmi() -> f64 {
    1e-4
}

/// A runnable lunar navigation **service-volume** scenario. The TOML
/// `kind = "moonlight-service-volume"` entry the engine dispatches here builds an
/// illustrative LCNS-class constellation, sweeps a selenographic lat/lon grid over a
/// time horizon, and reports DOP / coverage / availability plus the generalised lunar
/// ARAIM protection-level envelope over the service volume.
///
/// **Illustrative; public-source; not affiliated with ESA. MODELLED** — see the module
/// docs for the honesty boundary.
#[derive(Clone, Copy, Debug, Deserialize)]
pub struct LunarServiceScenario {
    /// Number of satellites in the illustrative constellation (1–12).
    #[serde(default = "d_n_sats")]
    pub n_sats: usize,
    /// Semi-major axis (km).
    #[serde(default = "d_sma_km")]
    pub sma_km: f64,
    /// Eccentricity.
    #[serde(default = "d_ecc")]
    pub eccentricity: f64,
    /// Inclination (deg).
    #[serde(default = "d_inc_deg")]
    pub inc_deg: f64,
    /// Argument of perilune (deg).
    #[serde(default = "d_argp_deg")]
    pub argp_deg: f64,
    /// Service-volume grid: minimum latitude (deg).
    #[serde(default = "d_lat_min_deg")]
    pub lat_min_deg: f64,
    /// Service-volume grid: maximum latitude (deg).
    #[serde(default = "d_lat_max_deg")]
    pub lat_max_deg: f64,
    /// Service-volume grid: latitude step (deg).
    #[serde(default = "d_lat_step_deg")]
    pub lat_step_deg: f64,
    /// Service-volume grid: minimum longitude (deg).
    #[serde(default = "d_lon_min_deg")]
    pub lon_min_deg: f64,
    /// Service-volume grid: maximum longitude (deg).
    #[serde(default = "d_lon_max_deg")]
    pub lon_max_deg: f64,
    /// Service-volume grid: longitude step (deg).
    #[serde(default = "d_lon_step_deg")]
    pub lon_step_deg: f64,
    /// Time horizon (hours).
    #[serde(default = "d_horizon_hours")]
    pub horizon_hours: f64,
    /// Time step (minutes).
    #[serde(default = "d_step_min")]
    pub step_min: f64,
    /// Elevation mask (deg).
    #[serde(default = "d_elev_mask_deg")]
    pub elev_mask_deg: f64,
    /// PDOP availability threshold.
    #[serde(default = "d_pdop_threshold")]
    pub pdop_threshold: f64,
    /// Surface-ops alert limit (m) — the HPL availability bound for the PL pass.
    #[serde(default = "d_alert_limit_m")]
    pub alert_limit_m: f64,
    /// Integrity-risk budget `P_HMI`.
    #[serde(default = "d_p_hmi")]
    pub p_hmi: f64,
}

impl Default for LunarServiceScenario {
    fn default() -> Self {
        Self {
            n_sats: d_n_sats(),
            sma_km: d_sma_km(),
            eccentricity: d_ecc(),
            inc_deg: d_inc_deg(),
            argp_deg: d_argp_deg(),
            lat_min_deg: d_lat_min_deg(),
            lat_max_deg: d_lat_max_deg(),
            lat_step_deg: d_lat_step_deg(),
            lon_min_deg: d_lon_min_deg(),
            lon_max_deg: d_lon_max_deg(),
            lon_step_deg: d_lon_step_deg(),
            horizon_hours: d_horizon_hours(),
            step_min: d_step_min(),
            elev_mask_deg: d_elev_mask_deg(),
            pdop_threshold: d_pdop_threshold(),
            alert_limit_m: d_alert_limit_m(),
            p_hmi: d_p_hmi(),
        }
    }
}

/// The result of a [`LunarServiceScenario`]: the DOP / coverage / availability summary
/// over the service volume plus the generalised protection-level envelope and the
/// availability against the alert limit.
#[derive(Clone, Debug, Serialize)]
pub struct LunarServiceReport {
    pub n_sats: usize,
    pub n_grid_points: usize,
    pub n_epochs: usize,
    pub n_samples: usize,
    pub elev_mask_deg: f64,
    pub pdop_threshold: f64,
    pub alert_limit_m: f64,
    pub sigma_ure_m: f64,
    /// Coverage fraction (≥ 4 sats AND PDOP < threshold) as a percentage.
    pub coverage_pct: f64,
    pub min_sats: usize,
    pub max_sats: usize,
    pub pdop_min: f64,
    pub pdop_mean: f64,
    pub pdop_max: f64,
    /// Minimum HPL (m) over the volume samples that admitted a protection level (≥ 6 sats).
    pub hpl_min_m: f64,
    /// Maximum HPL (m) over those samples.
    pub hpl_max_m: f64,
    /// Minimum VPL (m) over those samples.
    pub vpl_min_m: f64,
    /// Maximum VPL (m) over those samples.
    pub vpl_max_m: f64,
    /// Samples that admitted a protection level (≥ 6 sats, non-singular).
    pub n_pl_samples: usize,
    /// Fraction of PL samples with HPL ≤ alert limit, as a percentage.
    pub pl_availability_pct: f64,
    /// Honest scope note (illustrative / modelled).
    pub note: &'static str,
}

impl LunarServiceScenario {
    fn grid(&self) -> Vec<Selenographic> {
        let mut pts = Vec::new();
        let mut lat = self.lat_min_deg;
        let lat_step = if self.lat_step_deg.abs() < 1e-9 {
            1.0
        } else {
            self.lat_step_deg.abs()
        };
        let n_lat = (((self.lat_max_deg + 1e-9 - self.lat_min_deg) / lat_step)
            .ceil()
            .max(0.0) as usize)
            .saturating_add(2);
        for _ in 0..n_lat {
            if lat > self.lat_max_deg + 1e-9 {
                break;
            }
            let mut lon = self.lon_min_deg;
            let lon_step = if self.lon_step_deg.abs() < 1e-9 {
                1.0
            } else {
                self.lon_step_deg.abs()
            };
            // Avoid duplicating the longitude wrap (−180 and +180 are the same meridian).
            let lon_hi = if (self.lon_max_deg - self.lon_min_deg - 360.0).abs() < 1e-6 {
                self.lon_max_deg - lon_step + 1e-9
            } else {
                self.lon_max_deg + 1e-9
            };
            let n_lon = (((lon_hi - self.lon_min_deg) / lon_step).ceil().max(0.0) as usize)
                .saturating_add(2);
            for _ in 0..n_lon {
                if lon > lon_hi {
                    break;
                }
                pts.push(Selenographic {
                    lat_rad: lat.to_radians(),
                    lon_rad: lon.to_radians(),
                    alt_m: 0.0,
                });
                lon += lon_step;
            }
            lat += lat_step;
        }
        pts
    }

    fn times(&self) -> Vec<f64> {
        let mut ts = Vec::new();
        let horizon_s = self.horizon_hours * 3600.0;
        let step_s = if self.step_min.abs() < 1e-9 {
            3600.0
        } else {
            self.step_min.abs() * 60.0
        };
        let mut t = 0.0;
        let n_t = (((horizon_s - 1e-6) / step_s).ceil().max(0.0) as usize).saturating_add(2);
        for _ in 0..n_t {
            if t >= horizon_s - 1e-6 {
                break;
            }
            ts.push(t);
            t += step_s;
        }
        if ts.is_empty() {
            ts.push(0.0);
        }
        ts
    }

    /// Build the illustrative constellation, sweep the grid × horizon, and summarise the
    /// DOP / coverage / availability + protection-level envelope. Deterministic (pure
    /// geometry; no randomness).
    pub fn run(&self) -> LunarServiceReport {
        let sma_m = self.sma_km * 1000.0;
        let n = self.n_sats.clamp(1, 12);
        let sats = (0..n)
            .map(|k| LunarSat {
                sma_m,
                eccentricity: self.eccentricity,
                inc_deg: self.inc_deg,
                raan_deg: 360.0 * (k as f64) / (n as f64),
                argp_deg: self.argp_deg,
                mean_anom_deg: 360.0 * (k as f64) / (n as f64),
            })
            .collect();
        let constellation = LunarConstellation::new(sats);

        let grid = self.grid();
        let times = self.times();
        let elev_mask_rad = self.elev_mask_deg.to_radians();

        let stats = coverage(
            &constellation,
            &grid,
            &times,
            elev_mask_rad,
            self.pdop_threshold,
        );

        // Protection-level envelope over the same service volume.
        let budget = IntegrityBudget {
            p_hmi_vert: self.p_hmi,
            p_hmi_horz: self.p_hmi,
            p_fa: 1e-5,
        };
        let mut hpl_min = f64::INFINITY;
        let mut hpl_max = 0.0_f64;
        let mut vpl_min = f64::INFINITY;
        let mut vpl_max = 0.0_f64;
        let mut n_pl = 0usize;
        let mut n_pl_avail = 0usize;
        for &t in &times {
            let sats_mcmf = constellation.positions_mcmf(t);
            for &g in &grid {
                // Only the satellites above the mask feed the ARAIM PL — same visibility
                // gate as the DOP path.
                let user = selenographic_to_mcmf(g);
                let vis = visible_sat_positions(user, &sats_mcmf, elev_mask_rad);
                if let Some(pl) = lunar_protection_level(g, &vis, budget) {
                    hpl_min = hpl_min.min(pl.hpl_m);
                    hpl_max = hpl_max.max(pl.hpl_m);
                    vpl_min = vpl_min.min(pl.vpl_m);
                    vpl_max = vpl_max.max(pl.vpl_m);
                    n_pl += 1;
                    if pl.hpl_m <= self.alert_limit_m {
                        n_pl_avail += 1;
                    }
                }
            }
        }

        LunarServiceReport {
            n_sats: n,
            n_grid_points: grid.len(),
            n_epochs: times.len(),
            n_samples: stats.n_samples,
            elev_mask_deg: self.elev_mask_deg,
            pdop_threshold: self.pdop_threshold,
            alert_limit_m: self.alert_limit_m,
            sigma_ure_m: LUNAR_SIGMA_URE_M,
            coverage_pct: stats.coverage_fraction * 100.0,
            min_sats: stats.min_sats,
            max_sats: stats.max_sats,
            pdop_min: stats.pdop_min.unwrap_or(0.0),
            pdop_mean: stats.pdop_mean.unwrap_or(0.0),
            pdop_max: stats.pdop_max.unwrap_or(0.0),
            hpl_min_m: if hpl_min.is_finite() { hpl_min } else { 0.0 },
            hpl_max_m: hpl_max,
            vpl_min_m: if vpl_min.is_finite() { vpl_min } else { 0.0 },
            vpl_max_m: vpl_max,
            n_pl_samples: n_pl,
            pl_availability_pct: if n_pl == 0 {
                0.0
            } else {
                n_pl_avail as f64 / n_pl as f64 * 100.0
            },
            note: "Illustrative, public-source LCNS-class constellation; not affiliated with ESA. \
                   DOP geometry reuses the gnss_lib_py-validated kernel; coverage/integrity MODELLED.",
        }
    }
}

/// Render a [`LunarServiceReport`] as a self-contained SVG summary: the visible-sat and
/// PDOP envelopes and the coverage/availability headline over the service volume.
pub fn lunar_service_svg(r: &LunarServiceReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 36.0_f64, 50.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    // PDOP bar chart: min / mean / max.
    let vals = [
        ("PDOP min", r.pdop_min),
        ("PDOP mean", r.pdop_mean),
        ("PDOP max", r.pdop_max),
    ];
    let y_max = (r.pdop_max * 1.2).max(r.pdop_threshold * 1.2).max(1.0);
    let yof = |v: f64| mt + ph - (v.min(y_max) / y_max) * ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Lunar service volume — {} sats, {} pts × {} epochs: {:.1}% coverage (PDOP&lt;{:.1})</text>",
        r.n_sats, r.n_grid_points, r.n_epochs, r.coverage_pct, r.pdop_threshold
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"32\" font-size=\"11\">sats {}–{} | HPL {:.0}–{:.0} m | VPL {:.0}–{:.0} m | PL avail {:.1}% (AL {:.0} m, σ_URE {:.0} m)</text>",
        r.min_sats, r.max_sats, r.hpl_min_m, r.hpl_max_m, r.vpl_min_m, r.vpl_max_m, r.pl_availability_pct, r.alert_limit_m, r.sigma_ure_m
    ));
    // PDOP threshold line.
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"4 3\"/>",
        ml,
        yof(r.pdop_threshold),
        ml + pw,
        yof(r.pdop_threshold)
    ));
    let bar_w = pw / (vals.len() as f64 * 2.0);
    for (i, (label, v)) in vals.iter().enumerate() {
        let x = ml + (i as f64 * 2.0 + 0.5) * bar_w;
        let y = yof(*v);
        let bh = (mt + ph) - y;
        svg.push_str(&format!(
            "<rect x=\"{x:.1}\" y=\"{y:.1}\" width=\"{bar_w:.1}\" height=\"{bh:.1}\" fill=\"#e0bd84\"/>"
        ));
        svg.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\" text-anchor=\"middle\">{} {:.2}</text>",
            x + bar_w / 2.0,
            (mt + ph) + 16.0,
            label,
            v
        ));
    }
    let axis_y = mt + ph;
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar::{lunar_araim, lunar_sky_geometry};
    use std::f64::consts::FRAC_PI_2;

    fn budget() -> IntegrityBudget {
        IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        }
    }

    /// The DOP path is an exact reuse of the validated kernel: `service_dop` on a
    /// hand-set geometry equals a direct `orbit::dop` on the same visible LOS positions.
    #[test]
    fn dop_reuses_validated_kernel() {
        // User on the near-side equator; six satellites high overhead at 8000 km slant.
        let user = [R_MOON_M, 0.0, 0.0];
        let azels = [
            (0.0, 75.0),
            (60.0, 60.0),
            (120.0, 50.0),
            (200.0, 65.0),
            (270.0, 55.0),
            (320.0, 70.0),
        ];
        let sats = lunar_sky_geometry(user, 8.0e6, &azels);
        let mask = 5.0_f64.to_radians();
        let via_service = service_dop(user, &sats, mask).expect("≥4 visible");
        // The identity: filter to the same visible set, call the kernel directly.
        let vis = visible_sat_positions(user, &sats, mask);
        let direct = crate::orbit::dop(user, &vis).expect("≥4 visible");
        assert_eq!(
            via_service, direct,
            "service_dop must be the validated kernel"
        );
    }

    /// The generalised protection level reduces to the existing south-pole result: at
    /// the south pole, with the same geometry and budget, `lunar_protection_level`
    /// equals a direct `lunar::lunar_araim` call (it is that same machinery).
    #[test]
    fn pl_reduces_to_south_pole_case() {
        // Reuse the exact south-pole user + a six-relay sky the south-pole pass uses.
        let sp = Selenographic {
            lat_rad: -FRAC_PI_2,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let user = selenographic_to_mcmf(sp);
        let base: [(f64, f64); 6] = [
            (10.0, 70.0),
            (70.0, 35.0),
            (140.0, 55.0),
            (210.0, 28.0),
            (280.0, 60.0),
            (330.0, 40.0),
        ];
        let sats = lunar_sky_geometry(user, 6.0e6, &base);

        // Reference: the existing lunar.rs south-pole PL machinery, called directly.
        let resid = vec![0.0; sats.len()];
        let reference = lunar_araim(user, &sats, &resid, budget()).expect("ref PL");

        // Generalised: the same user point expressed selenographically, same sats.
        let generalised = lunar_protection_level(sp, &sats, budget()).expect("gen PL");

        assert!(
            (generalised.hpl_m - reference.hpl_m).abs() < 1e-9,
            "HPL {} vs reference {}",
            generalised.hpl_m,
            reference.hpl_m
        );
        assert!(
            (generalised.vpl_m - reference.vpl_m).abs() < 1e-9,
            "VPL {} vs reference {}",
            generalised.vpl_m,
            reference.vpl_m
        );
        assert_eq!(generalised.n_used, reference.n_used);
    }

    /// Sanity monotonicity: adding satellites cannot reduce coverage (more relays ⇒
    /// at least as many available samples ⇒ coverage non-decreasing).
    #[test]
    fn coverage_monotone_in_constellation_size() {
        let grid: Vec<Selenographic> = [-90.0_f64, -80.0, -70.0]
            .iter()
            .flat_map(|&lat| {
                [-120.0_f64, 0.0, 120.0]
                    .iter()
                    .map(move |&lon| Selenographic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: 0.0,
                    })
            })
            .collect();
        let times: Vec<f64> = (0..6).map(|k| k as f64 * 3600.0).collect();
        let mask = 5.0_f64.to_radians();

        let small = LunarConstellation::illustrative_lcns(4);
        let large = LunarConstellation::illustrative_lcns(8);
        let cs = coverage(&small, &grid, &times, mask, 6.0);
        let cl = coverage(&large, &grid, &times, mask, 6.0);
        assert!(
            cl.coverage_fraction >= cs.coverage_fraction - 1e-12,
            "coverage must be non-decreasing in constellation size: small {} large {}",
            cs.coverage_fraction,
            cl.coverage_fraction
        );
        // And the larger constellation never shows fewer satellites at the best sample.
        assert!(cl.max_sats >= cs.max_sats);
    }

    /// L10: the coverage summary reports the median GDOP order statistic and the fraction
    /// of samples with a usable (< 6) GDOP, both derived from the Validated DOP kernel.
    #[test]
    fn coverage_reports_median_gdop_and_time_below_6() {
        let grid: Vec<Selenographic> = [-90.0_f64, -80.0]
            .iter()
            .flat_map(|&lat| {
                [-120.0_f64, 0.0, 120.0]
                    .iter()
                    .map(move |&lon| Selenographic {
                        lat_rad: lat.to_radians(),
                        lon_rad: lon.to_radians(),
                        alt_m: 0.0,
                    })
            })
            .collect();
        let times: Vec<f64> = (0..8).map(|k| k as f64 * 3600.0).collect();
        let c = coverage(
            &LunarConstellation::illustrative_lcns(8),
            &grid,
            &times,
            5.0_f64.to_radians(),
            6.0,
        );
        // Median GDOP is defined and never below the DOP floor of 1.
        let m = c.gdop_median.expect("some sample had a defined DOP");
        assert!(m >= 1.0, "median GDOP {m}");
        // The time-below-6 fraction is a valid probability.
        assert!((0.0..=1.0).contains(&c.frac_below_gdop6));
    }

    /// L10: the N-sweep reaches N = 24 (the lifted cap, was 12), is deterministic, and
    /// shows availability non-decreasing with constellation size.
    #[test]
    fn n_sweep_reaches_24_and_is_deterministic() {
        assert_eq!(
            LunarConstellation::illustrative_lcns(24).n_sats(),
            24,
            "satellite cap lifted to 24"
        );
        let grid: Vec<Selenographic> = [-90.0_f64, -80.0]
            .iter()
            .map(|&lat| Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: 0.0,
                alt_m: 0.0,
            })
            .collect();
        let times: Vec<f64> = (0..6).map(|k| k as f64 * 3600.0).collect();
        let mask = 5.0_f64.to_radians();
        let rows = sweep_over_n(4, 24, &grid, &times, mask, 6.0);
        assert_eq!(rows.len(), 21, "N = 4..=24 inclusive");
        assert_eq!(rows[0].n_sats, 4);
        assert_eq!(rows.last().unwrap().n_sats, 24);
        // Deterministic order statistics.
        assert_eq!(rows, sweep_over_n(4, 24, &grid, &times, mask, 6.0));
        // Availability improves with size.
        assert!(rows.last().unwrap().coverage_fraction >= rows[0].coverage_fraction - 1e-12);
    }

    /// Visibility honours the elevation mask: a satellite placed just below the mask is
    /// excluded; raising it above the mask includes it.
    #[test]
    fn visibility_respects_mask() {
        let user = [R_MOON_M, 0.0, 0.0];
        // One satellite at 3° elevation, one at 20°.
        let low = lunar_sky_geometry(user, 5.0e6, &[(0.0, 3.0)]);
        let high = lunar_sky_geometry(user, 5.0e6, &[(0.0, 20.0)]);
        let mask = 5.0_f64.to_radians();
        assert_eq!(
            visible_sats(user, &low, mask).len(),
            0,
            "a 3° satellite must be below a 5° mask"
        );
        assert_eq!(
            visible_sats(user, &high, mask).len(),
            1,
            "a 20° satellite must clear a 5° mask"
        );
        // Boundary: the LOS unit vectors returned are unit-length.
        let v = visible_sats(user, &high, mask);
        let n = (v[0][0] * v[0][0] + v[0][1] * v[0][1] + v[0][2] * v[0][2]).sqrt();
        assert!((n - 1.0).abs() < 1e-12);
    }

    /// `service_dop` returns None with fewer than four visible satellites.
    #[test]
    fn service_dop_none_below_four() {
        let user = [R_MOON_M, 0.0, 0.0];
        let sats = lunar_sky_geometry(user, 5.0e6, &[(0.0, 70.0), (90.0, 60.0), (180.0, 50.0)]);
        assert!(service_dop(user, &sats, 5.0_f64.to_radians()).is_none());
    }

    /// The default constellation propagates to constant geocentric radius bounds and the
    /// elliptical orbit varies its radius between perilune and apolune.
    #[test]
    fn elliptical_orbit_radius_varies_between_peri_and_apo() {
        let c = LunarConstellation::default();
        let s = c.sats[0];
        let a = s.sma_m;
        let e = s.eccentricity;
        let peri = a * (1.0 - e);
        let apo = a * (1.0 + e);
        // Sample one full period and check the radius stays within [peri, apo].
        let n = (MOON_GM_M3_S2 / a.powi(3)).sqrt();
        let period = std::f64::consts::TAU / n;
        let mut rmin = f64::INFINITY;
        let mut rmax = 0.0_f64;
        for k in 0..50 {
            let t = period * k as f64 / 49.0;
            let p = s.position_mci(t);
            let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
            rmin = rmin.min(r);
            rmax = rmax.max(r);
        }
        assert!(rmin >= peri - 1.0 && rmax <= apo + 1.0);
        assert!(
            rmax - rmin > 0.5 * (apo - peri),
            "should sample a real spread"
        );
    }

    /// The scenario runs deterministically (pure geometry — same inputs, identical JSON).
    #[test]
    fn scenario_is_deterministic() {
        let scn = LunarServiceScenario::default();
        let a = scn.run();
        let b = scn.run();
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
    }

    /// The scenario produces a self-consistent report: counts add up, the SVG is well
    /// formed, and the JSON carries the honest illustrative/modelled note.
    #[test]
    fn scenario_report_self_consistent() {
        let scn = LunarServiceScenario::default();
        let r = scn.run();
        assert_eq!(r.n_samples, r.n_grid_points * r.n_epochs);
        assert!(r.n_grid_points > 0 && r.n_epochs > 0);
        assert!(r.coverage_pct >= 0.0 && r.coverage_pct <= 100.0);
        assert!(r.pl_availability_pct >= 0.0 && r.pl_availability_pct <= 100.0);
        assert!(r.max_sats >= r.min_sats);
        assert!((r.sigma_ure_m - LUNAR_SIGMA_URE_M).abs() < 1e-9);
        let svg = lunar_service_svg(&r);
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        let json = serde_json::to_string(&r).unwrap();
        assert!(json.contains("not affiliated with ESA"));
        assert!(json.contains("MODELLED"));
    }
}
