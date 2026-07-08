// SPDX-License-Identifier: AGPL-3.0-only
//! Cislunar PNT integrity: ARAIM for a LunaNet-style lunar navigation service.
//!
//! Reuses the Earth-side ARAIM engine ([`crate::raim::araim_raim`]) for the lunar case.
//! A lunar navigation signal is far weaker and the constellation far sparser than GPS, so
//! the user-range-error and per-satellite fault prior are an order(s) of magnitude larger
//! (LunaNet LNIS: `σ_URE ≈ 30 m` vs GPS `≈ 0.6 m`; `P_sat ≈ 1e-4/hr`). Because the
//! protection level scales linearly with `σ_URE`, lunar protection levels are
//! correspondingly larger for the same geometry — the quantitative statement of why lunar
//! PNT integrity is hard.
//!
//! This provides the lunar parameters, a selenocentric sky geometry helper, the lunar
//! ARAIM call, the MCI↔MCMF cislunar frame reduction and selenographic coordinates, and
//! a runnable south-pole protection-level pass ([`LunarScenario`], `kind =
//! "lunar-integrity"`). Scope (honest): the relay geometry is *representative*, not the
//! precise differential-corrected 9:2 LANS NRHO ephemeris (the three-body CR3BP core is
//! in [`crate::cr3bp`]); the LANS signal-in-space error budget, the physical libration /
//! precessing lunar pole (DE421/SPICE), and wiring real NRHO relays in are follow-ons.

use crate::raim::{araim_raim, AraimResult, FaultPriors, IntegrityBudget};
use serde::{Deserialize, Serialize};
use std::f64::consts::{FRAC_PI_2, TAU};

/// Mean lunar radius (m).
pub const R_MOON_M: f64 = 1_737_400.0;
/// LunaNet LNIS nominal user-range error (m) — ~50× the GPS value.
pub const LUNAR_SIGMA_URE_M: f64 = 30.0;
/// Per-satellite fault prior over the exposure interval for a lunar service.
pub const LUNAR_P_SAT: f64 = 1.0e-4;
/// Lunar sidereal rotation period (s): 27.321661 days. The Moon's rotation is
/// synchronous with its orbit, so this is also the orbital sidereal month.
pub const LUNAR_SIDEREAL_DAY_S: f64 = 27.321_661 * 86_400.0;
/// Lunar gravitational parameter `GM_Moon` (m³/s²). Source: JPL DE440 / NASA Moon
/// Fact Sheet, `GM = 4902.800 km³/s²`
/// (<https://nssdc.gsfc.nasa.gov/planetary/factsheet/moonfact.html>), converted
/// from km³/s² to m³/s² (×1e9). Used for the Keplerian relay mean motion.
pub const MOON_GM_M3_S2: f64 = 4.902_800_118e12;

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn unit(v: Vec3) -> Vec3 {
    let n = norm(v);
    [v[0] / n, v[1] / n, v[2] / n]
}

/// Spherical East/North/Up basis at a selenocentric position (Up = radial outward).
pub fn spherical_enu(pos: Vec3) -> (Vec3, Vec3, Vec3) {
    let up = unit(pos);
    // Use the body +z to seed East, unless the user is near a pole.
    let seed = if up[2].abs() < 0.99 {
        [0.0, 0.0, 1.0]
    } else {
        [1.0, 0.0, 0.0]
    };
    let east = unit(cross(seed, up));
    let north = cross(up, east);
    (east, north, up)
}

/// Build a lunar-orbiting constellation as seen from `user` (selenocentric metres): a
/// satellite at slant `range_m` in each `(azimuth, elevation)` direction (degrees).
pub fn lunar_sky_geometry(user: Vec3, range_m: f64, azels_deg: &[(f64, f64)]) -> Vec<Vec3> {
    let (east, north, up) = spherical_enu(user);
    azels_deg
        .iter()
        .map(|&(az, el)| {
            let (azr, elr) = (az.to_radians(), el.to_radians());
            let de = elr.cos() * azr.sin();
            let dn = elr.cos() * azr.cos();
            let du = elr.sin();
            [
                user[0] + range_m * (de * east[0] + dn * north[0] + du * up[0]),
                user[1] + range_m * (de * east[1] + dn * north[1] + du * up[1]),
                user[2] + range_m * (de * east[2] + dn * north[2] + du * up[2]),
            ]
        })
        .collect()
}

/// Mean lunar rotation angle (rad, in [0, 2π)) at `seconds` past the epoch at which
/// the Moon-centered inertial (MCI) and Moon-fixed (MCMF) frames are aligned. A
/// simplified mean-rotation model (the Moon turns uniformly at the sidereal rate);
/// it omits the physical libration and the precessing lunar pole of the full IAU /
/// DE421 lunar rotation model (see the module scope note).
pub fn lunar_rotation_angle(seconds: f64) -> f64 {
    (TAU / LUNAR_SIDEREAL_DAY_S * seconds).rem_euclid(TAU)
}

/// Rotate a 3-vector about the +z (lunar spin) axis by `theta` (R3 convention,
/// matching [`crate::frames::teme_to_ecef`]).
fn rot3(r: Vec3, theta: f64) -> Vec3 {
    let (s, c) = theta.sin_cos();
    [c * r[0] + s * r[1], -s * r[0] + c * r[1], r[2]]
}

/// Moon-centered inertial (MCI) → Moon-centered Moon-fixed (MCMF): rotate by the
/// lunar rotation angle about the spin axis. The MCMF analogue of ECI→ECEF.
pub fn mci_to_mcmf(r_mci: Vec3, seconds: f64) -> Vec3 {
    rot3(r_mci, lunar_rotation_angle(seconds))
}

/// Inverse of [`mci_to_mcmf`]: MCMF → MCI.
pub fn mcmf_to_mci(r_mcmf: Vec3, seconds: f64) -> Vec3 {
    rot3(r_mcmf, -lunar_rotation_angle(seconds))
}

/// A selenographic position: lunar latitude and longitude (radians) and height
/// above the mean lunar sphere (metres). The Moon is treated as a sphere of radius
/// [`R_MOON_M`] (its flattening is ~0.0012, well below this fidelity).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Selenographic {
    pub lat_rad: f64,
    pub lon_rad: f64,
    pub alt_m: f64,
}

/// MCMF (Moon-fixed Cartesian) → selenographic latitude/longitude/altitude.
pub fn mcmf_to_selenographic(r_mcmf: Vec3) -> Selenographic {
    let rad = norm(r_mcmf);
    let lon = r_mcmf[1].atan2(r_mcmf[0]);
    let lat = if rad > 0.0 {
        (r_mcmf[2] / rad).asin()
    } else {
        0.0
    };
    Selenographic {
        lat_rad: lat,
        lon_rad: lon,
        alt_m: rad - R_MOON_M,
    }
}

/// Selenographic latitude/longitude/altitude → MCMF (Moon-fixed Cartesian).
pub fn selenographic_to_mcmf(s: Selenographic) -> Vec3 {
    let r = R_MOON_M + s.alt_m;
    let (sla, cla) = s.lat_rad.sin_cos();
    let (slo, clo) = s.lon_rad.sin_cos();
    [r * cla * clo, r * cla * slo, r * sla]
}

// ---------------------------------------------------------------------------
// LunaNet LANS geometry: named surface sites, look angles, surface visibility,
// site DOP, a representative Keplerian relay model, and a coverage grid.
// ---------------------------------------------------------------------------

/// A named lunar surface site: selenographic latitude/longitude (degrees) and a
/// human label. Coordinates are mean-sphere selenographic; the IAU "Mean Earth /
/// polar axis" (ME) frame Kshana's MCMF approximates (Archinal et al. 2018, IAU
/// WGCCRE 2015 Report on Cartographic Coordinates and Rotational Elements).
/// Longitude is east-positive planetographic, the convention NASA site catalogs
/// use. Sources are cited per row on the constants below.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct LunarSite {
    pub name: &'static str,
    pub lat_deg: f64,
    pub lon_deg: f64,
}

impl LunarSite {
    /// Selenographic position at the mean lunar surface (alt = 0).
    pub fn selenographic(&self) -> Selenographic {
        Selenographic {
            lat_rad: self.lat_deg.to_radians(),
            lon_rad: self.lon_deg.to_radians(),
            alt_m: 0.0,
        }
    }
    /// MCMF (Moon-fixed Cartesian) position of the site at the mean surface.
    pub fn mcmf(&self) -> Vec3 {
        selenographic_to_mcmf(self.selenographic())
    }
}

/// Shackleton crater, on the lunar south-pole rim (the Artemis target region).
/// `89.67°S, 129.78°E` from the IAU Gazetteer-sourced infobox
/// (<https://en.wikipedia.org/wiki/Shackleton_(crater)>). Honest caveat: the
/// precise pole-proximate latitude is debated (some sources place the rim nearer
/// `89.9°S`); both values give `z ≈ −R_MOON_M`, so the polar geometry oracles do
/// not depend on the disputed digits.
pub const SHACKLETON_RIM: LunarSite = LunarSite {
    name: "Shackleton crater (south pole)",
    lat_deg: -89.67,
    lon_deg: 129.78,
};
/// Apollo 11 landing site, Mare Tranquillitatis. `0.67408°N, 23.47297°E`
/// (NASA NSSDCA; cross-checked mindat.org/loc-3256.html "0.67408°N, 23.47297°E").
pub const MARE_TRANQUILLITATIS_A11: LunarSite = LunarSite {
    name: "Apollo 11 (Mare Tranquillitatis)",
    lat_deg: 0.674_08,
    lon_deg: 23.472_97,
};
/// Apollo 15 landing site, Hadley-Apennine. `26.1322°N, 3.6339°E`
/// (NASA / Apollo 15 infobox 26°07′56″N 3°38′02″E) — a high-northern site.
pub const APOLLO_15_HADLEY: LunarSite = LunarSite {
    name: "Apollo 15 (Hadley-Apennine)",
    lat_deg: 26.1322,
    lon_deg: 3.6339,
};
/// Apollo 16 landing site, Descartes Highlands. `8.9730°S, 15.5002°E`
/// (NASA NSSDCA / LROC) — a southern non-polar contrast (note the negative
/// latitude: Descartes is in the southern highlands).
pub const APOLLO_16_DESCARTES: LunarSite = LunarSite {
    name: "Apollo 16 (Descartes)",
    lat_deg: -8.9730,
    lon_deg: 15.5002,
};

/// Canonical named lunar sites with authoritative selenographic coordinates.
pub const NAMED_SITES: [LunarSite; 4] = [
    SHACKLETON_RIM,
    MARE_TRANQUILLITATIS_A11,
    APOLLO_15_HADLEY,
    APOLLO_16_DESCARTES,
];

/// Topocentric azimuth/elevation/range of a relay seen from a lunar surface user.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct LunarAzEl {
    /// Azimuth (degrees), clockwise from selenographic North in `[0, 360)`.
    pub az_deg: f64,
    /// Elevation (degrees) above the local horizontal (radial-up).
    pub el_deg: f64,
    /// Slant range (m) from the user to the relay.
    pub range_m: f64,
}

/// Look angle from `user` (MCMF, on/near the surface) to `relay` (MCMF). Azimuth
/// is measured clockwise from selenographic North (0 = N, 90 = E); elevation is
/// above the local horizontal (radial-up). This is the exact inverse of the
/// `de = cos(el)·sin(az)`, `dn = cos(el)·cos(az)`, `du = sin(el)` build inside
/// [`lunar_sky_geometry`], using the same [`spherical_enu`] East/North/Up basis,
/// so the two round-trip. Near a pole, [`spherical_enu`] seeds East from the body
/// +x axis, so a polar azimuth is referenced to that seeded East, not true
/// selenographic East; the radial-overhead `el = 90°` case is azimuth-independent.
pub fn lunar_look_angle(user: Vec3, relay: Vec3) -> LunarAzEl {
    let (east, north, up) = spherical_enu(user);
    let d = [relay[0] - user[0], relay[1] - user[1], relay[2] - user[2]];
    let rng = norm(d);
    if rng == 0.0 {
        return LunarAzEl {
            az_deg: 0.0,
            el_deg: 0.0,
            range_m: 0.0,
        };
    }
    let dh = [d[0] / rng, d[1] / rng, d[2] / rng];
    let dot = |a: Vec3, b: Vec3| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    let de = dot(dh, east);
    let dn = dot(dh, north);
    let du = dot(dh, up);
    // Clamp to the asin domain (a float-rounded exactly-overhead relay can push
    // `du` to 1.0000000002 ⇒ NaN), mirroring `crate::orbit::elevation_deg`.
    let el = du.clamp(-1.0, 1.0).asin().to_degrees();
    // `rem_euclid(360)` can float-round up to exactly 360.0, breaking the documented [0,360)
    // invariant; fold that single edge back to 0.
    let mut az = de.atan2(dn).to_degrees().rem_euclid(360.0);
    if az >= 360.0 {
        az = 0.0;
    }
    LunarAzEl {
        az_deg: az,
        el_deg: el,
        range_m: rng,
    }
}

/// Count of relays (MCMF) visible from `user` (MCMF) above `mask_deg`. A relay is
/// visible iff its elevation `≥ mask_deg`. For a surface user (alt ≈ 0) the
/// `elevation ≥ 0` test already excludes relays behind the Moon's own limb (a
/// relay below the local horizon is occulted by the body), so unlike Earth's
/// `earth_occults` no separate limb-occultation test is needed here.
pub fn lunar_visible_count(user: Vec3, relays: &[Vec3], mask_deg: f64) -> usize {
    relays
        .iter()
        .filter(|&&r| lunar_look_angle(user, r).el_deg >= mask_deg)
        .count()
}

/// MCMF positions of the relays visible from `user` above `mask_deg`
/// (geometry-ready for [`crate::orbit::dop`]). See [`lunar_visible_count`] for the
/// limb-occultation note.
pub fn lunar_visible(user: Vec3, relays: &[Vec3], mask_deg: f64) -> Vec<Vec3> {
    relays
        .iter()
        .copied()
        .filter(|&r| lunar_look_angle(user, r).el_deg >= mask_deg)
        .collect()
}

/// Geometric DOP at a lunar surface site (MCMF) from its visible relays. A thin
/// reuse of [`crate::orbit::dop`] — DOP is frame-agnostic (it takes `(user, sats)`
/// in any consistent Cartesian frame), and the lunar [`spherical_enu`] and the
/// orbit `enu_basis` agree (both radial-up, +z-seeded East), so passing MCMF
/// positions is correct. Returns `None` if fewer than four relays are visible.
pub fn lunar_site_dop(user: Vec3, relays: &[Vec3], mask_deg: f64) -> Option<crate::orbit::Dop> {
    let vis = lunar_visible(user, relays, mask_deg);
    crate::orbit::dop(user, &vis)
}

/// A representative LunaNet relay placed by classical-element-style parameters in
/// the Moon-centred inertial (MCI) frame: a circular relay at radius `radius_m`,
/// inclination `inc_deg`, RAAN `raan_deg`, and phase `phase_deg` at epoch,
/// advancing at the Keplerian mean motion for [`MOON_GM_M3_S2`]. Honest scope: a
/// circular Keplerian relay, NOT the differential-corrected 9:2 NRHO (which lives
/// in [`crate::cr3bp`]; see the module scope note). This is good enough for the
/// coverage / visibility / DOP geometry that LANS design studies need first.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LunarRelay {
    pub radius_m: f64,
    pub inc_deg: f64,
    pub raan_deg: f64,
    pub phase_deg: f64,
}

/// MCI position of the relay at `seconds` past epoch (circular Keplerian). The
/// mean motion is `n = sqrt(GM / a³)`; the true argument is `u = phase + n·t`. The
/// perifocal circular position `(R·cos u, R·sin u, 0)` is rotated by inclination
/// about +x then RAAN about +z (the standard 3-1-3 with argument-of-perigee folded
/// into `u`). At `seconds = 0` and inclination 0 the orbit lies in the equatorial
/// plane (`z = 0`); `|pos| = radius_m` exactly for all inputs.
pub fn relay_position_mci(r: &LunarRelay, seconds: f64) -> Vec3 {
    let n = (MOON_GM_M3_S2 / r.radius_m.powi(3)).sqrt();
    let u = r.phase_deg.to_radians() + n * seconds;
    let (su, cu) = u.sin_cos();
    let (si, ci) = r.inc_deg.to_radians().sin_cos();
    let (sraan, craan) = r.raan_deg.to_radians().sin_cos();
    let rr = r.radius_m;
    [
        rr * (craan * cu - sraan * ci * su),
        rr * (sraan * cu + craan * ci * su),
        rr * (si * su),
    ]
}

/// MCMF positions of a relay set at `seconds`: each relay is propagated in MCI by
/// [`relay_position_mci`] then reduced to MCMF with [`mci_to_mcmf`] so the rotating
/// surface site and the relays are in the same frame. (Mixing MCI relays with an
/// MCMF site rotates the geometry wrongly over a pass — always reduce first.)
pub fn relay_set_mcmf(relays: &[LunarRelay], seconds: f64) -> Vec<Vec3> {
    relays
        .iter()
        .map(|r| mci_to_mcmf(relay_position_mci(r, seconds), seconds))
        .collect()
}

/// One sampled surface point's instantaneous geometry against the relay set.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct CoverageCell {
    pub lat_deg: f64,
    pub lon_deg: f64,
    pub n_visible: usize,
    pub pdop: Option<f64>,
}

/// Lunar surface coverage: sample an `n_lat × n_lon` selenographic grid (latitude
/// `−90..=+90`, longitude `−180..=+180`), place the relay set at `seconds` in
/// MCMF, and report the visible relay count and PDOP per cell. This is the LANS
/// "coverage map" deliverable: a polar cell sees the same poor geometry as the
/// south-pole pass, while equatorial cells see a different relay subset, so the
/// map shows the latitude-dependence of LANS coverage.
pub fn lunar_coverage_grid(
    relays: &[LunarRelay],
    seconds: f64,
    n_lat: usize,
    n_lon: usize,
    mask_deg: f64,
) -> Vec<CoverageCell> {
    let sats = relay_set_mcmf(relays, seconds);
    let mut cells = Vec::with_capacity(n_lat.saturating_mul(n_lon));
    let lat_span = |i: usize| -> f64 {
        if n_lat <= 1 {
            0.0
        } else {
            -90.0 + 180.0 * (i as f64) / ((n_lat - 1) as f64)
        }
    };
    let lon_span = |j: usize| -> f64 {
        if n_lon <= 1 {
            0.0
        } else {
            -180.0 + 360.0 * (j as f64) / ((n_lon - 1) as f64)
        }
    };
    for i in 0..n_lat {
        let lat_deg = lat_span(i);
        for j in 0..n_lon {
            let lon_deg = lon_span(j);
            let user = selenographic_to_mcmf(Selenographic {
                lat_rad: lat_deg.to_radians(),
                lon_rad: lon_deg.to_radians(),
                alt_m: 0.0,
            });
            let n_visible = lunar_visible_count(user, &sats, mask_deg);
            let pdop = lunar_site_dop(user, &sats, mask_deg).map(|d| d.pdop);
            cells.push(CoverageCell {
                lat_deg,
                lon_deg,
                n_visible,
                pdop,
            });
        }
    }
    cells
}

/// One cell of the time-averaged polar GDOP map (L11 / P2 Figure 1a).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct GdopMapCell {
    pub lat_deg: f64,
    pub lon_deg: f64,
    /// Number of epochs at which the cell had a defined DOP (≥ 4 visible relays).
    pub n_defined: usize,
    /// Median GDOP over the defined-DOP epochs (`None` if never defined).
    pub gdop_median: Option<f64>,
    /// Median horizontal DOP over the defined-DOP epochs.
    pub hdop_median: Option<f64>,
    /// Median vertical DOP over the defined-DOP epochs.
    pub vdop_median: Option<f64>,
}

/// Median of a sample as an exact order statistic (`None` if empty).
fn median_of(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    let mid = v.len() / 2;
    Some(if v.len() % 2 == 0 {
        0.5 * (v[mid - 1] + v[mid])
    } else {
        v[mid]
    })
}

/// Time-averaged per-cell GDOP/HDOP/VDOP map over a selenographic latitude band and a
/// set of epochs (L11) — the P2 Figure 1a polar-coverage deliverable. For each cell of
/// the `[lat_min_deg, lat_max_deg] × [−180, 180]` grid the relay set is placed at every
/// epoch, the site DOP evaluated ([`lunar_site_dop`]), and the **median** of each DOP
/// component reported. The median is an order statistic robust to the sparse-polar heavy
/// tail (a few near-singular epochs), unlike the single-snapshot [`lunar_coverage_grid`].
/// Reuses the Validated DOP kernel and is deterministic.
pub fn lunar_gdop_map(
    relays: &[LunarRelay],
    times_s: &[f64],
    lat_min_deg: f64,
    lat_max_deg: f64,
    n_lat: usize,
    n_lon: usize,
    mask_deg: f64,
) -> Vec<GdopMapCell> {
    let lat_span = |i: usize| -> f64 {
        if n_lat <= 1 {
            0.5 * (lat_min_deg + lat_max_deg)
        } else {
            lat_min_deg + (lat_max_deg - lat_min_deg) * (i as f64) / ((n_lat - 1) as f64)
        }
    };
    let lon_span = |j: usize| -> f64 {
        if n_lon <= 1 {
            0.0
        } else {
            -180.0 + 360.0 * (j as f64) / ((n_lon - 1) as f64)
        }
    };
    // Reduce the relay set to MCMF once per epoch (shared across all cells).
    let sats_per_epoch: Vec<Vec<Vec3>> =
        times_s.iter().map(|&t| relay_set_mcmf(relays, t)).collect();

    let mut cells = Vec::with_capacity(n_lat.saturating_mul(n_lon));
    for i in 0..n_lat {
        let lat_deg = lat_span(i);
        for j in 0..n_lon {
            let lon_deg = lon_span(j);
            let user = selenographic_to_mcmf(Selenographic {
                lat_rad: lat_deg.to_radians(),
                lon_rad: lon_deg.to_radians(),
                alt_m: 0.0,
            });
            let mut gdops = Vec::new();
            let mut hdops = Vec::new();
            let mut vdops = Vec::new();
            for sats in &sats_per_epoch {
                if let Some(d) = lunar_site_dop(user, sats, mask_deg) {
                    gdops.push(d.gdop);
                    hdops.push(d.hdop);
                    vdops.push(d.vdop);
                }
            }
            cells.push(GdopMapCell {
                lat_deg,
                lon_deg,
                n_defined: gdops.len(),
                gdop_median: median_of(gdops),
                hdop_median: median_of(hdops),
                vdop_median: median_of(vdops),
            });
        }
    }
    cells
}

/// One epoch of a lunar-surface protection-level pass.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct LunarPassPoint {
    /// Seconds since the start of the pass.
    pub t_s: f64,
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
    /// `true` when HPL ≤ the alert limit (the surface user is available).
    pub available: bool,
}

/// Protection levels for a landed receiver at the lunar **south pole** (the Artemis
/// target region) seen against a representative LunaNet relay set, sampled over a
/// pass. At each epoch six relays are placed in a representative selenocentric sky
/// (azimuths and elevations evolving independently to exercise the changing
/// geometry) and run through [`lunar_araim`]; `available` compares HPL to
/// `alert_limit_m`. Honest scope: this is a *representative* relay geometry, not the
/// precise LANS NRHO ephemeris (a 3-body cislunar orbit Kshana does not yet model —
/// see `ROADMAP.md`); it demonstrates the lunar integrity budget, not an operational
/// LunaNet availability number.
pub fn south_pole_hpl_pass(
    step_s: f64,
    duration_s: f64,
    alert_limit_m: f64,
    budget: IntegrityBudget,
) -> Vec<LunarPassPoint> {
    let user = selenographic_to_mcmf(Selenographic {
        lat_rad: -FRAC_PI_2,
        lon_rad: 0.0,
        alt_m: 0.0,
    });
    // Representative relay sky and per-relay drift rates (deg/hr) and elevation
    // oscillation, so the relative geometry — and therefore the DOP — changes.
    let base: [(f64, f64); 6] = [
        (10.0, 70.0),
        (70.0, 35.0),
        (140.0, 55.0),
        (210.0, 28.0),
        (280.0, 60.0),
        (330.0, 40.0),
    ];
    let az_rate = [3.0, 5.5, 4.0, 6.5, 4.8, 5.2];
    let mut out = Vec::new();
    let mut t = 0.0;
    // Integer-counted fixed-step sampler; the break preserves the original stop.
    let n_steps = (((duration_s - 1e-6) / step_s).ceil().max(0.0) as usize).saturating_add(2);
    for _ in 0..n_steps {
        if t >= duration_s - 1e-6 {
            break;
        }
        let hours = t / 3600.0;
        let azels: Vec<(f64, f64)> = base
            .iter()
            .enumerate()
            .map(|(i, &(az, el))| {
                let a = (az + az_rate[i] * hours).rem_euclid(360.0);
                let e = (el + 8.0 * (0.3 * hours + i as f64).sin()).clamp(10.0, 88.0);
                (a, e)
            })
            .collect();
        let sats = lunar_sky_geometry(user, 6.0e6, &azels);
        let resid = vec![0.0; sats.len()];
        if let Some(r) = lunar_araim(user, &sats, &resid, budget) {
            out.push(LunarPassPoint {
                t_s: t,
                hpl_m: r.hpl_m,
                vpl_m: r.vpl_m,
                available: r.hpl_m <= alert_limit_m,
            });
        }
        t += step_s;
    }
    out
}

/// Lunar ARAIM protection levels: the Earth-side MHSS engine with the lunar
/// user-range-error and per-satellite fault prior.
pub fn lunar_araim(
    user: Vec3,
    sats: &[Vec3],
    range_residual_m: &[f64],
    budget: IntegrityBudget,
) -> Option<AraimResult> {
    araim_raim(
        user,
        sats,
        range_residual_m,
        LUNAR_SIGMA_URE_M,
        FaultPriors {
            p_sat: LUNAR_P_SAT,
            b_nom_m: 0.0,
        },
        budget,
    )
}

fn default_step_s() -> f64 {
    3600.0
}
fn default_duration_s() -> f64 {
    86_400.0
}
fn default_alert_m() -> f64 {
    50.0
}
fn default_p_hmi() -> f64 {
    1e-4
}

/// A runnable lunar-surface integrity scenario: a south-pole receiver against a
/// representative LunaNet relay set over a pass. The TOML `kind = "lunar-integrity"`
/// entry the engine dispatches to [`south_pole_hpl_pass`].
#[derive(Clone, Copy, Debug, Deserialize)]
pub struct LunarScenario {
    /// Sample step (s).
    #[serde(default = "default_step_s")]
    pub step_s: f64,
    /// Pass duration (s).
    #[serde(default = "default_duration_s")]
    pub duration_s: f64,
    /// Surface-ops alert limit (m) — LunaNet CONOPS uses ~50 m.
    #[serde(default = "default_alert_m")]
    pub alert_limit_m: f64,
    /// Integrity-risk budget `P_HMI` (lunar surface ops, ~1e-4 not aviation 1e-7).
    #[serde(default = "default_p_hmi")]
    pub p_hmi: f64,
}

/// The result of a [`LunarScenario`]: the south-pole protection-level pass plus its
/// availability and HPL envelope against the alert limit.
#[derive(Clone, Debug, Serialize)]
pub struct LunarReport {
    pub alert_limit_m: f64,
    pub sigma_ure_m: f64,
    pub samples_total: usize,
    pub samples_available: usize,
    pub min_hpl_m: f64,
    pub max_hpl_m: f64,
    pub pass: Vec<LunarPassPoint>,
}

impl LunarReport {
    /// Fraction of epochs available (HPL ≤ alert limit).
    pub fn availability(&self) -> f64 {
        if self.samples_total == 0 {
            0.0
        } else {
            self.samples_available as f64 / self.samples_total as f64
        }
    }
}

impl LunarScenario {
    /// Run the south-pole protection-level pass and summarise it.
    pub fn run(&self) -> LunarReport {
        let budget = IntegrityBudget {
            p_hmi_vert: self.p_hmi,
            p_hmi_horz: self.p_hmi,
            p_fa: 1e-5,
        };
        let pass = south_pole_hpl_pass(self.step_s, self.duration_s, self.alert_limit_m, budget);
        let available = pass.iter().filter(|p| p.available).count();
        let min_hpl = pass.iter().map(|p| p.hpl_m).fold(f64::INFINITY, f64::min);
        let max_hpl = pass.iter().map(|p| p.hpl_m).fold(0.0_f64, f64::max);
        LunarReport {
            alert_limit_m: self.alert_limit_m,
            sigma_ure_m: LUNAR_SIGMA_URE_M,
            samples_total: pass.len(),
            samples_available: available,
            min_hpl_m: if min_hpl.is_finite() { min_hpl } else { 0.0 },
            max_hpl_m: max_hpl,
            pass,
        }
    }
}

/// Render a [`LunarReport`] as a self-contained SVG: HPL over the pass against the
/// surface-ops alert limit.
pub fn lunar_report_svg(r: &LunarReport) -> String {
    let (w, h) = (820.0_f64, 360.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let (pw, ph) = (w - ml - mr, h - mt - mb);
    let t_max = r.pass.iter().map(|p| p.t_s).fold(1.0_f64, f64::max);
    let y_max = (r.max_hpl_m.max(r.alert_limit_m) * 1.15).max(1.0);
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |v: f64| mt + ph - (v.min(y_max) / y_max) * ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Lunar south-pole HPL ({:.0}% available, AL {:.0} m, σ_URE {:.0} m)</text>",
        r.availability() * 100.0,
        r.alert_limit_m,
        r.sigma_ure_m
    ));
    // Alert-limit line.
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"4 3\"/>",
        xof(0.0),
        yof(r.alert_limit_m),
        xof(t_max),
        yof(r.alert_limit_m)
    ));
    // HPL polyline.
    let pts: Vec<String> = r
        .pass
        .iter()
        .map(|p| format!("{:.1},{:.1}", xof(p.t_s), yof(p.hpl_m)))
        .collect();
    if pts.len() > 1 {
        svg.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"#e0bd84\" points=\"{}\"/>",
            pts.join(" ")
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

// --- Airless-body horizon / line-of-sight geometry (L01) ------------------
//
// The Moon has no atmosphere, so there is no refractive horizon extension and no
// skywave path: radio line of sight is the bare geometric tangent to the sphere. The
// same identity bounds both surface ranging (how far a surface beacon stays usable)
// and surface attacks (how far a ground spoofer/jammer reaches), so it is the shared
// geometric core of the P1 attack-surface reach table and P2 beacon-siting range.

/// Straight-line (radio line-of-sight) distance, in metres, from an object of height
/// `height_m` above a sphere of radius `radius_m` to its horizon tangent point:
/// `d = sqrt(2 R h + h^2)`. This is the tangent length from the elevated object to the
/// point where the line grazes the sphere (`R^2 + d^2 = (R + h)^2`), i.e. the maximum
/// range at which the object has line of sight to a point *at the surface*.
pub fn horizon_los_distance_m(radius_m: f64, height_m: f64) -> f64 {
    (2.0 * radius_m * height_m + height_m * height_m)
        .max(0.0)
        .sqrt()
}

/// Great-circle (surface arc) distance, in metres, from the sub-object point to the
/// horizon, `d = R * acos(R / (R + h))`. Use this for footprint/coverage *areas* on the
/// surface; use [`horizon_los_distance_m`] for the slant line-of-sight *range*.
pub fn horizon_ground_range_m(radius_m: f64, height_m: f64) -> f64 {
    radius_m * (radius_m / (radius_m + height_m)).acos()
}

/// Maximum surface-to-surface radio line-of-sight distance (m) between two objects of
/// heights `height_a_m` and `height_b_m` on a sphere of radius `radius_m`: the sum of
/// each object's horizon LOS distance, `sqrt(2 R h_a + h_a^2) + sqrt(2 R h_b + h_b^2)`.
/// This is the reach of a raised transmitter (mast/ridge) to a surface receiver of
/// finite antenna height, which the airless Moon leaves purely geometric.
pub fn surface_los_max_m(radius_m: f64, height_a_m: f64, height_b_m: f64) -> f64 {
    horizon_los_distance_m(radius_m, height_a_m) + horizon_los_distance_m(radius_m, height_b_m)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn setup() -> (Vec3, Vec<Vec3>, Vec<f64>, IntegrityBudget) {
        // User on the lunar near side; six relay satellites at ~5000 km slant range.
        let user = [R_MOON_M, 0.0, 0.0];
        let azels = [
            (0.0, 75.0),
            (60.0, 30.0),
            (120.0, 50.0),
            (200.0, 25.0),
            (270.0, 55.0),
            (320.0, 35.0),
        ];
        let sats = lunar_sky_geometry(user, 5.0e6, &azels);
        let resid = vec![0.0; sats.len()];
        let budget = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        (user, sats, resid, budget)
    }

    // --- WE4 LunaNet LANS geometry oracles ---------------------------------

    #[test]
    fn moon_radius_matches_iau() {
        // Oracle: IAU WGCCRE 2015 / NASA NSSDC mean lunar radius 1737.4 km.
        assert!((R_MOON_M - 1_737_400.0).abs() < 1.0);
    }

    #[test]
    fn named_sites_round_trip_selenographic() {
        // Oracle: exact MCMF↔selenographic inverse identity; site coordinates from
        // NASA NSSDCA / IAU Gazetteer (cited on each NAMED_SITES constant).
        for site in NAMED_SITES {
            let s = mcmf_to_selenographic(site.mcmf());
            let want = site.selenographic();
            assert!((s.lat_rad - want.lat_rad).abs() < 1e-9, "{} lat", site.name);
            assert!((s.lon_rad - want.lon_rad).abs() < 1e-9, "{} lon", site.name);
        }
    }

    #[test]
    fn apollo11_z_component_oracle() {
        // Oracle: hand-computed z = R·sin(0.67408°) from NASA NSSDCA 0.67408°N
        // (≈ 1_737_400 · 0.011765 ≈ 20_440 m).
        let m = MARE_TRANQUILLITATIS_A11.mcmf();
        let z_expected = 1_737_400.0 * 0.674_08_f64.to_radians().sin();
        assert!((m[2] - z_expected).abs() < 50.0, "z = {}", m[2]);
        assert!((m[2] - 20_440.0).abs() < 100.0, "≈20.44 km, got {}", m[2]);
    }

    #[test]
    fn apollo15_is_northern_shackleton_is_polar() {
        // Oracle: published latitudes 26.1322°N (z ≈ R·sin26.13° ≈ 765 km) and
        // 89.67°S (z ≈ −R near the south pole).
        assert!(
            APOLLO_15_HADLEY.mcmf()[2] > 7.0e5,
            "Apollo 15 northern: z = {}",
            APOLLO_15_HADLEY.mcmf()[2]
        );
        assert!(
            SHACKLETON_RIM.mcmf()[2] < -1.737e6,
            "Shackleton polar: z = {}",
            SHACKLETON_RIM.mcmf()[2]
        );
    }

    #[test]
    fn overhead_relay_is_ninety_degrees() {
        // THE required sanity oracle: a relay placed directly radially outward from
        // any surface site has the line of sight parallel to Up ⇒ elevation 90.000°
        // (exact geometric identity), independent of azimuth — safe even at the
        // pole. Mirrors the existing `geometry_places_satellites_at_the_slant_range`
        // el = 90 ⇒ straight-up test. The relay is built as `user + range·Up` using
        // the SAME radial unit `spherical_enu` recovers, so the line of sight is the
        // radial direction. The achievable tolerance is set by `asin` at its
        // endpoint, NOT by the geometry: `sin(el)` lands within one ULP of 1.0, and
        // `d(asin)/dx → ∞` as x → 1 amplifies that ~1e-16 to ~8.5e-7° (the
        // unavoidable f64 floor; assert 1e-5° with margin). The radial identity
        // itself is exact — `sin(el) = 1` — which we verify directly below.
        for site in NAMED_SITES {
            let u = site.mcmf();
            let (_, _, up) = spherical_enu(u);
            let range = 0.5 * norm(u);
            let relay = [
                u[0] + range * up[0],
                u[1] + range * up[1],
                u[2] + range * up[2],
            ];
            let la = lunar_look_angle(u, relay);
            assert!(
                (la.el_deg - 90.0).abs() < 1e-5,
                "{} el = {} (asin endpoint floor ~8.5e-7°)",
                site.name,
                la.el_deg
            );
            // The geometric identity sin(el) = 1 holds to full f64 precision, free
            // of the asin amplification.
            assert!(
                (la.el_deg.to_radians().sin() - 1.0).abs() < 1e-12,
                "{} sin(el) = {}",
                site.name,
                la.el_deg.to_radians().sin()
            );
            assert!(
                (la.range_m - range).abs() < 1e-3,
                "{} range = {}",
                site.name,
                la.range_m
            );
        }
    }

    #[test]
    fn look_angle_inverts_sky_geometry() {
        // Oracle: round-trip against the shipped forward `lunar_sky_geometry`. The
        // new inverse must recover each (az, el) the forward function placed.
        let u = MARE_TRANQUILLITATIS_A11.mcmf();
        let azels = [(0.0_f64, 75.0_f64), (120.0, 40.0), (250.0, 20.0)];
        let relays = lunar_sky_geometry(u, 6.0e6, &azels);
        for (&(az, el), relay) in azels.iter().zip(relays.iter()) {
            let la = lunar_look_angle(u, *relay);
            assert!(
                (la.az_deg - az).abs() < 1e-6,
                "az want {az} got {}",
                la.az_deg
            );
            assert!(
                (la.el_deg - el).abs() < 1e-6,
                "el want {el} got {}",
                la.el_deg
            );
            assert!(
                (la.range_m - 6.0e6).abs() < 1e-3,
                "range want 6e6 got {}",
                la.range_m
            );
        }
    }

    #[test]
    fn visibility_respects_mask() {
        // Oracle: definitional mask cut — relays at el {5,15,45,80}° against a 10°
        // mask leave exactly three visible, the 5° one excluded.
        let u = MARE_TRANQUILLITATIS_A11.mcmf();
        let azels = [(0.0, 5.0), (90.0, 15.0), (180.0, 45.0), (270.0, 80.0)];
        let relays = lunar_sky_geometry(u, 6.0e6, &azels);
        assert_eq!(lunar_visible_count(u, &relays, 10.0), 3);
        // The el = 5° relay (the first one) must be the one excluded.
        let vis = lunar_visible(u, &relays, 10.0);
        assert_eq!(vis.len(), 3);
        assert!(
            !vis.iter().any(|&r| {
                (r[0] - relays[0][0]).abs() < 1e-9
                    && (r[1] - relays[0][1]).abs() < 1e-9
                    && (r[2] - relays[0][2]).abs() < 1e-9
            }),
            "the 5° relay must be masked out"
        );
    }

    #[test]
    fn relay_keplerian_period_matches_gm() {
        // Oracle: hand-computed Kepler third-law period from DE440 GM_Moon. For
        // a = 3.0e6 m: a³ = 2.7e19 m⁹, a³/GM = 2.7e19 / 4.902800118e12 = 5.5071e6 s²,
        // T = 2π·√(a³/GM) = 2π·2346.7 s = 14_744.8 s (≈ 4.096 h). A factor-1e9 GM
        // unit slip (km³/s² left unconverted) would miss this by ~31600×, so the
        // tight 1% band also guards the m³/s² conversion of MOON_GM_M3_S2.
        let r = LunarRelay {
            radius_m: 3.0e6,
            inc_deg: 0.0,
            raan_deg: 0.0,
            phase_deg: 0.0,
        };
        let n = (MOON_GM_M3_S2 / r.radius_m.powi(3)).sqrt();
        let period = TAU / n;
        assert!(
            (period - 14_744.8).abs() / 14_744.8 < 0.01,
            "period = {period} s (want ≈ 14_744.8)"
        );
        // |pos| = radius exactly at epoch; inclination 0 ⇒ equatorial (z ≈ 0).
        let p0 = relay_position_mci(&r, 0.0);
        assert!((norm(p0) - r.radius_m).abs() < 1e-3, "|pos| = {}", norm(p0));
        assert!(p0[2].abs() < 1e-6, "inc=0 ⇒ z≈0, got {}", p0[2]);
        // Magnitude is conserved as the relay advances.
        let pt = relay_position_mci(&r, 12_345.0);
        assert!(
            (norm(pt) - r.radius_m).abs() < 1e-3,
            "|pos(t)| = {}",
            norm(pt)
        );
    }

    #[test]
    fn four_relay_dop_is_finite_and_above_unity() {
        // Oracle: DOP ≥ 1 lower bound (Parkinson/Kaplan, *GPS Theory & Practice*) +
        // the four-satellite redundancy requirement. One overhead plus four spread
        // relays gives a finite PDOP > 1; with only three visible, DOP is undefined.
        let u = MARE_TRANQUILLITATIS_A11.mcmf();
        let azels = [
            (0.0, 90.0),
            (0.0, 45.0),
            (90.0, 35.0),
            (180.0, 50.0),
            (270.0, 40.0),
        ];
        let relays = lunar_sky_geometry(u, 6.0e6, &azels);
        let d = lunar_site_dop(u, &relays, 5.0).expect("≥4 relays ⇒ Some");
        assert!(d.pdop.is_finite() && d.pdop > 1.0, "pdop = {}", d.pdop);
        // Only three relays visible ⇒ None.
        let three = lunar_sky_geometry(u, 6.0e6, &[(0.0, 90.0), (90.0, 35.0), (180.0, 50.0)]);
        assert!(lunar_site_dop(u, &three, 5.0).is_none());
    }

    #[test]
    fn coverage_grid_shape_and_pole_is_sparse() {
        // Oracle: structural shape + the known latitude-dependence of LANS coverage.
        // An equatorial-ish relay set leaves the poles seeing no more relays than
        // the median cell.
        let relays = [
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 15.0,
                raan_deg: 0.0,
                phase_deg: 0.0,
            },
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 15.0,
                raan_deg: 90.0,
                phase_deg: 60.0,
            },
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 15.0,
                raan_deg: 180.0,
                phase_deg: 120.0,
            },
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 15.0,
                raan_deg: 270.0,
                phase_deg: 200.0,
            },
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 15.0,
                raan_deg: 45.0,
                phase_deg: 300.0,
            },
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 15.0,
                raan_deg: 135.0,
                phase_deg: 30.0,
            },
        ];
        let cells = lunar_coverage_grid(&relays, 0.0, 19, 36, 5.0);
        assert_eq!(cells.len(), 19 * 36);
        // Median visible count across all cells.
        let mut counts: Vec<usize> = cells.iter().map(|c| c.n_visible).collect();
        counts.sort_unstable();
        let median = counts[counts.len() / 2];
        // South-pole row (lat = −90°, the first 36 cells) sees ≤ the median.
        let pole_max = cells[..36].iter().map(|c| c.n_visible).max().unwrap_or(0);
        assert!(
            pole_max <= median,
            "pole row max {pole_max} should be ≤ median {median}"
        );
    }

    #[test]
    fn coverage_grid_seconds_zero_matches_no_rotation() {
        // Guards the MCI→MCMF frame reduction: at seconds = 0 the MCMF reduction is
        // the identity (`mci_to_mcmf(r, 0) = r`), so the relay set must equal the
        // raw MCI positions — catches the "forgot to reduce frames" bug.
        let relays = [
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 20.0,
                raan_deg: 30.0,
                phase_deg: 10.0,
            },
            LunarRelay {
                radius_m: 5.0e6,
                inc_deg: 20.0,
                raan_deg: 120.0,
                phase_deg: 80.0,
            },
        ];
        for r in &relays {
            let mci = relay_position_mci(r, 0.0);
            let mcmf = mci_to_mcmf(mci, 0.0);
            for k in 0..3 {
                assert!((mci[k] - mcmf[k]).abs() < 1e-6, "component {k}");
            }
        }
    }

    #[test]
    fn spherical_enu_is_orthonormal() {
        let (e, n, u) = spherical_enu([R_MOON_M, 2.0e5, -3.0e5]);
        assert!(
            (norm(e) - 1.0).abs() < 1e-12
                && (norm(n) - 1.0).abs() < 1e-12
                && (norm(u) - 1.0).abs() < 1e-12
        );
        let dot = |a: Vec3, b: Vec3| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
        assert!(dot(e, n).abs() < 1e-12 && dot(e, u).abs() < 1e-12 && dot(n, u).abs() < 1e-12);
    }

    #[test]
    fn geometry_places_satellites_at_the_slant_range() {
        let user = [R_MOON_M, 0.0, 0.0];
        let sats = lunar_sky_geometry(user, 5.0e6, &[(0.0, 90.0)]);
        // Elevation 90° ⇒ straight up ⇒ exactly range_m above the user radially.
        let d = norm([
            sats[0][0] - user[0],
            sats[0][1] - user[1],
            sats[0][2] - user[2],
        ]);
        assert!((d - 5.0e6).abs() < 1e-3, "slant = {d}");
    }

    #[test]
    fn selenographic_round_trips_and_cardinal_points() {
        // Prime meridian / equator at the surface sits on +x at the lunar radius.
        let eq = selenographic_to_mcmf(Selenographic {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!((eq[0] - R_MOON_M).abs() < 1e-6 && eq[1].abs() < 1e-6 && eq[2].abs() < 1e-6);
        // The lunar south pole (Artemis target) sits on −z at the lunar radius.
        let sp = selenographic_to_mcmf(Selenographic {
            lat_rad: -std::f64::consts::FRAC_PI_2,
            lon_rad: 0.0,
            alt_m: 0.0,
        });
        assert!(sp[0].abs() < 1e-6 && sp[1].abs() < 1e-6 && (sp[2] + R_MOON_M).abs() < 1e-6);
        // Round-trip a few selenographic positions through MCMF.
        for &(lat, lon, alt) in &[
            (12.0_f64, 45.0_f64, 0.0_f64),
            (-89.0, -120.0, 1500.0),
            (60.0, 175.0, 30000.0),
        ] {
            let s = Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: alt,
            };
            let back = mcmf_to_selenographic(selenographic_to_mcmf(s));
            assert!((back.lat_rad - s.lat_rad).abs() < 1e-12, "lat {lat}");
            assert!((back.lon_rad - s.lon_rad).abs() < 1e-12, "lon {lon}");
            assert!((back.alt_m - s.alt_m).abs() < 1e-6, "alt {alt}");
        }
    }

    #[test]
    fn mci_mcmf_rotation_is_identity_at_epoch_and_period() {
        let r = [1.2e6, -8.0e5, 4.0e5];
        // At the alignment epoch (t = 0) the two frames coincide.
        let at0 = mci_to_mcmf(r, 0.0);
        for k in 0..3 {
            assert!((at0[k] - r[k]).abs() < 1e-6, "t=0 component {k}");
        }
        // After one sidereal rotation the Moon has turned a full 2π → identity again.
        let at_period = mci_to_mcmf(r, LUNAR_SIDEREAL_DAY_S);
        for k in 0..3 {
            assert!((at_period[k] - r[k]).abs() < 1e-3, "t=T component {k}");
        }
        // Round-trip at an arbitrary epoch, and the rotation preserves magnitude.
        let t = 0.37 * LUNAR_SIDEREAL_DAY_S;
        let back = mcmf_to_mci(mci_to_mcmf(r, t), t);
        for k in 0..3 {
            assert!((back[k] - r[k]).abs() < 1e-6, "round-trip {k}");
        }
        assert!((norm(mci_to_mcmf(r, t)) - norm(r)).abs() < 1e-6);
        // Over one day the Moon turns ≈ 360°/27.32 ≈ 13.176°.
        let deg = lunar_rotation_angle(86_400.0).to_degrees();
        assert!((deg - 13.176_358).abs() < 1e-3, "1-day rotation = {deg}°");
    }

    #[test]
    fn south_pole_pass_shows_the_lunar_integrity_gap() {
        // A landed receiver at the lunar south pole, a representative LunaNet relay
        // set above it, sampled over 24 h. With the nominal LANS σ_URE = 30 m the
        // protection level is finite but *exceeds* a 50 m surface-ops alert limit —
        // the honest quantitative statement that lunar PNT integrity is not yet met.
        let budget = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        let pass = south_pole_hpl_pass(3600.0, 86_400.0, 50.0, budget);
        assert_eq!(pass.len(), 24, "24 hourly samples");
        assert!(
            pass.iter().all(|p| p.hpl_m.is_finite() && p.hpl_m > 0.0),
            "every epoch yields a finite protection level"
        );
        // The geometry varies over the pass (HPL is not constant).
        let hmin = pass.iter().map(|p| p.hpl_m).fold(f64::INFINITY, f64::min);
        let hmax = pass.iter().map(|p| p.hpl_m).fold(0.0_f64, f64::max);
        assert!(hmax > hmin, "HPL should vary across the pass");
        // The honest gap: with 30 m ranging the HPL is well over the 50 m alert limit,
        // so the surface user is *not* available — every epoch flags unavailable.
        assert!(
            pass.iter().all(|p| !p.available && p.hpl_m > 50.0),
            "30 m LANS σ_URE cannot meet a 50 m alert limit"
        );
    }

    #[test]
    fn lunar_protection_levels_are_finite_and_scale_with_sigma_ure() {
        let (user, sats, resid, budget) = setup();
        let lunar = lunar_araim(user, &sats, &resid, budget).expect("lunar araim runs");
        assert!(
            lunar.hpl_m.is_finite() && lunar.hpl_m > 0.0,
            "HPL {}",
            lunar.hpl_m
        );
        assert!(
            lunar.vpl_m.is_finite() && lunar.vpl_m > 0.0,
            "VPL {}",
            lunar.vpl_m
        );
        // Hold the fault prior fixed and drop σ_URE to the GPS 0.6 m: the protection level
        // scales linearly with σ_URE alone, so the ratio is exactly 30/0.6 = 50. (The lunar
        // case is harder still because its per-satellite prior is also ~10× larger.)
        let ref_06 = araim_raim(
            user,
            &sats,
            &resid,
            0.6,
            FaultPriors {
                p_sat: LUNAR_P_SAT,
                b_nom_m: 0.0,
            },
            budget,
        )
        .expect("reference araim runs");
        let ratio = lunar.hpl_m / ref_06.hpl_m;
        assert!(
            (ratio - 50.0).abs() < 0.5,
            "HPL ratio = {ratio} (want ≈ 50)"
        );
    }

    // --- L01 airless-body horizon / line-of-sight geometry ----------------

    #[test]
    fn horizon_los_matches_earth_textbook() {
        // Oracle: the standard terrestrial "distance to the horizon" for a 2 m eye
        // height is ~5.05 km (≈3.14 statute miles), a widely published value. The same
        // closed form at the mean Earth radius must reproduce it — validating the
        // formula independently of the lunar application.
        const R_EARTH_M: f64 = 6_371_000.0;
        let d = horizon_los_distance_m(R_EARTH_M, 2.0);
        assert!(
            (d - 5048.0).abs() < 10.0,
            "earth horizon {d} m (want ~5048)"
        );
    }

    #[test]
    fn horizon_los_satisfies_tangent_identity() {
        // Oracle: exact right-triangle tangent identity R^2 + d^2 = (R + h)^2.
        for &h in &[1.0, 2.0, 10.0, 100.0, 1000.0, 2000.0] {
            let d = horizon_los_distance_m(R_MOON_M, h);
            let lhs = R_MOON_M * R_MOON_M + d * d;
            let rhs = (R_MOON_M + h) * (R_MOON_M + h);
            assert!((lhs - rhs).abs() / rhs < 1e-12, "tangent identity h={h}");
        }
    }

    #[test]
    fn horizon_ground_range_consistent_with_slant() {
        // Oracle: both distances derive from the same horizon central angle θ where
        // cos θ = R / (R + h): ground = R·θ, slant = (R + h)·sin θ. Two independent
        // implementations must agree through θ.
        for &h in &[10.0, 100.0, 1000.0] {
            let theta = (R_MOON_M / (R_MOON_M + h)).acos();
            let ground = horizon_ground_range_m(R_MOON_M, h);
            let slant = horizon_los_distance_m(R_MOON_M, h);
            assert!((ground - R_MOON_M * theta).abs() < 1e-6, "ground h={h}");
            assert!(
                (slant - (R_MOON_M + h) * theta.sin()).abs() < 1e-3,
                "slant h={h}"
            );
        }
    }

    #[test]
    fn lunar_mast_reach_reproduces_p1_table() {
        // Reproduces the P1 attack-surface reach table (Sec 4): a raised transmitter of
        // height h reaches a surface user out to sqrt(2Rh+h^2) + sqrt(2R·h_u+h_u^2) with
        // a standing-user / rover antenna height h_u ≈ 1.6 m. Paper values (rounded to
        // 1 km): 2 m→5 km, 10 m→8 km, 100 m→21 km, 1000 m→61 km.
        let h_u = 1.6;
        let cases = [(2.0, 5.0), (10.0, 8.0), (100.0, 21.0), (1000.0, 61.0)];
        for &(h, want_km) in &cases {
            let reach_km = surface_los_max_m(R_MOON_M, h, h_u) / 1000.0;
            assert!(
                (reach_km - want_km).abs() < 0.6,
                "h={h} m reach={reach_km:.1} km (want {want_km})"
            );
        }
    }

    // --- L11 time-averaged polar GDOP/HDOP/VDOP map -----------------------

    #[test]
    fn gdop_map_covers_polar_band_and_is_deterministic() {
        // Oracle: reuses the Validated lunar_site_dop kernel; the per-cell medians are
        // deterministic order statistics; DOP >= 1 always; the requested latitude band
        // is honoured. A 6-relay ELFO-like set over a -90..-70 band, several epochs.
        let relays: Vec<LunarRelay> = (0..6)
            .map(|k| LunarRelay {
                radius_m: R_MOON_M + 8_000_000.0,
                inc_deg: 57.7,
                raan_deg: 60.0 * k as f64,
                phase_deg: 60.0 * k as f64,
            })
            .collect();
        let times: Vec<f64> = (0..6).map(|k| k as f64 * 3600.0).collect();
        let cells = lunar_gdop_map(&relays, &times, -90.0, -70.0, 3, 4, 5.0);
        assert_eq!(cells.len(), 12, "3 lat x 4 lon cells");
        for c in &cells {
            assert!(
                c.lat_deg >= -90.0 - 1e-9 && c.lat_deg <= -70.0 + 1e-9,
                "lat {} outside band",
                c.lat_deg
            );
            if let Some(g) = c.gdop_median {
                assert!(g >= 1.0, "GDOP {g} below the DOP floor");
            }
        }
        assert_eq!(
            cells,
            lunar_gdop_map(&relays, &times, -90.0, -70.0, 3, 4, 5.0)
        );
    }
}
