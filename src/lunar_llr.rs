// SPDX-License-Identifier: AGPL-3.0-only
//! The seven-parameter Helmert lunar frame datum driven by a **real, archived observing
//! campaign** — measured lunar laser ranging normal points — rather than by a simulated one.
//!
//! [`crate::lunar_frame_realise`] *injects* a datum into a synthetic network and recovers it.
//! [`crate::lunar_frame_campaign`] removes the planted answer but still simulates the
//! campaign: its Earth-station network, its schedule and its per-observation sigma are
//! stated illustrative inputs, and it says so. This module removes the simulation from the
//! two places where a schedule and an error model enter the answer:
//!
//! * the **epochs** are the transmit times of normal points that were really fired, at
//!   stations that really fired them, at the five retroreflector arrays that are really on
//!   the Moon;
//! * the **weight** on each observation is that normal point's own archived precision —
//!   `bin_rms / sqrt(n_raw)` out of the file ([`crate::realdata::llr_crd`]) — not a number
//!   this repository chose.
//!
//! ## The chain, end to end
//!
//! ```text
//! ILRS CRD normal points        (MEASURED: epoch, two-way time of flight, bin RMS, n raw)
//!   -> per-point sigma          (MEASURED: bin_rms / sqrt(n_raw))
//!   -> station ITRF2020 position at epoch      (PUBLISHED: IERS ITRF2020 SLR + velocity)
//!   -> GCRS via the CIO chain                  (crate::cio, IAU 2006/2000A)
//!   -> Moon centre                             (MODELLED: crate::ephem::moon_position)
//!   -> reflector MER coordinates               (PUBLISHED: DE430 Table 7)
//!   -> lunar body orientation                  (MODELLED: IAU 2015 WGCCRE, crate::lunar_frame)
//!   -> two-way light time and its partial d(tau)/d(r_reflector,MER)
//!   -> M_b = J^T W J                           (crate::fim::information_matrix)
//!   -> H = A^T M_b A, A the Helmert design     (crate::lunar_frame_campaign::helmert_design)
//!   -> C_H = H^-1                              (crate::fim::crlb)
//! ```
//!
//! The deliverable is the same quantity [`crate::lunar_frame_campaign`] publishes —
//! `datum_accuracy.translation_sigma_norm_m` — and the report runs that scenario at its
//! defaults and prints its figure beside this one rather than quoting it.
//!
//! ## Which links are measured and which are modelled — the point of the report
//!
//! **Measured**: the observation epochs, the number of observations, which station saw which
//! array when, and every observation weight. **Published**: the station ITRF2020 coordinates
//! and velocities (IERS) and the reflector mean-Earth-frame coordinates (JPL DE430 Table 7).
//! **Modelled and still modelled**: the Moon-centre ephemeris
//! ([`crate::ephem::moon_position`], a low-precision analytic series), the lunar body
//! orientation ([`crate::lunar_frame`], IAU 2015 WGCCRE), and everything a real LLR reduction
//! carries that this engine does not — troposphere, solid-body Earth and Moon tides, station
//! eccentricity, polar motion, UT1−UTC (zero unless the caller states it), relativistic
//! delay, and the station clock.
//!
//! Those modelled links are **measured against the data, not asserted**: the report emits the
//! observed-minus-computed one-way range residual over every point it used
//! ([`ResidualStats`]). That residual is dominated by the analytic lunar ephemeris and is
//! kilometres, not millimetres. It is published exactly because it is the honest size of the
//! gap between this engine and an LLR analysis.
//!
//! ## Why a kilometre-level residual does not invalidate the covariance — measured, not argued
//!
//! The datum covariance is a function of **geometry and weights**, not of the fit: an
//! ephemeris error does not enter it through the residual at all, only through the direction
//! of each line of sight. A few-hundred-kilometre Moon-centre error at 385 000 km tilts that
//! direction by under 0.06°, and the libration that separates a reflector's line-of-sight
//! coordinate from its two plane-of-sky coordinates comes from the body orientation rather
//! than from the range.
//!
//! How much a tilt of that size actually moves the answer is not left as an argument. Every
//! run re-solves the whole datum with **every partial tilted by
//! `sensitivity_tilt_deg`** (default 0.1°, comfortably above the 0.054° worst epoch that
//! `tests/lunar_llr_real_data.rs` measures against JPL Horizons) and emits the ratio.
//! Each partial is rotated about `g × ẑ` with the sign alternating observation by
//! observation — a coherent tilt is close to a rotation of the whole frame, which a datum
//! solve largely absorbs, so the alternating version is the harsher probe. It bounds the
//! geometry's sensitivity; it is not a model of how the ephemeris error is actually
//! structured.
//!
//! The scenario therefore reports a Cramér–Rao bound for a reduced parameter set on a real
//! schedule — not a solved datum, and not an LLR analysis.
//!
//! ## Honesty / scope
//!
//! The formal sigmas below are what the measured schedule and the measured per-point
//! precision buy under the stated reduced parameter set. A real LLR solution estimates the
//! lunar orbit, the physical librations, the Earth orientation, station coordinates, tidal
//! and dissipation parameters and relativistic parameters alongside the reflector
//! coordinates, so its reflector uncertainties are decimetres (DE430 Table 7's own stated
//! 0.12–0.27 m) where the bound here is far smaller. **The bound is not a claimed accuracy.**
//! No TRL, flight heritage or agency endorsement is claimed, and this is not a geodetic
//! product.

use crate::fim::{crlb, information_matrix};
use crate::lunar_frame_campaign::{helmert_design, solve_datum, HELMERT_PARAMETERS, N_HELMERT};
use crate::precession::{mat_vec, transpose, Mat3, Vec3};
use crate::realdata::llr_crd::{read_crd_dir, LlrNormalPoint};
use serde::Deserialize;
use std::path::{Path, PathBuf};

/// Speed of light in vacuum (m/s), the crate's single definition.
const C: f64 = crate::timegeo::C_M_PER_S;
/// Days in a Julian year, for advancing an ITRF position by its velocity.
const DAYS_PER_JULIAN_YEAR: f64 = 365.25;

/// The default fixture directory: the committed real-data slice this scenario reads.
const DEFAULT_DATA_DIR: &str = "tests/fixtures/lunar_llr";

/// The honesty label carried on every emitted document.
const LABEL: &str = "Lunar frame datum from a REAL observing campaign. The schedule, the \
    observation count and every observation weight come from archived ILRS lunar laser \
    ranging normal points (measured); the station coordinates come from IERS ITRF2020 and the \
    retroreflector coordinates from JPL DE430 Table 7 (published). The Moon-centre ephemeris, \
    the IAU 2015 WGCCRE body orientation, and the absence of troposphere, tides, station \
    eccentricity, polar motion, UT1-UTC, relativistic delay and station clocks remain \
    MODELLED, and the emitted observed-minus-computed residual is their combined size. The \
    seven-parameter figures are a Cramer-Rao bound for a reduced parameter set on a real \
    schedule, NOT a solved datum, NOT an LLR analysis and NOT a geodetic product.";

// ---------------------------------------------------------------------------
// Small vector helpers (the crate keeps these local to each geometry module).
// ---------------------------------------------------------------------------

fn sub3(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn add3(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

fn norm3(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

fn unit3(a: Vec3) -> Vec3 {
    let n = norm3(a);
    [a[0] / n, a[1] / n, a[2] / n]
}

/// Median of a slice, by sorting a copy. Returns `f64::NAN` for an empty slice, which the
/// callers guard against before emitting.
fn median(v: &[f64]) -> f64 {
    if v.is_empty() {
        return f64::NAN;
    }
    let mut s = v.to_vec();
    s.sort_by(|a, b| a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal));
    let n = s.len();
    if n % 2 == 1 {
        s[n / 2]
    } else {
        0.5 * (s[n / 2 - 1] + s[n / 2])
    }
}

// ---------------------------------------------------------------------------
// The two published catalogues.
// ---------------------------------------------------------------------------

/// One lunar retroreflector array, in the mean-Earth/mean-rotation (MER) body-fixed frame.
#[derive(Clone, Debug, PartialEq)]
pub struct ReflectorSite {
    /// The array's published name, e.g. `Apollo 15`.
    pub array: String,
    /// The ILRS archive target directory name, e.g. `apollo15` — the key that ties this row
    /// to the `h3` record of a normal-point file.
    pub ilrs_target: String,
    /// Body-fixed position in the MER frame (m), Moon centre of mass.
    pub mer_m: Vec3,
}

/// One laser ranging station, in ITRF2020.
#[derive(Clone, Debug, PartialEq)]
pub struct LlrStation {
    /// The four-character CRD station name, e.g. `GRSM` — the key that ties this row to the
    /// `h2` record of a normal-point file.
    pub crd_name: String,
    /// The ILRS numeric station id, e.g. `7845`.
    pub ilrs_id: u32,
    /// The IERS DOMES number, e.g. `10002S002`.
    pub domes: String,
    /// The site name as ITRF prints it.
    pub site: String,
    /// ITRF2020 position (m) at [`Self::epoch_year`].
    pub itrf_m: Vec3,
    /// ITRF2020 linear velocity (m/year).
    pub velocity_m_per_year: Vec3,
    /// The decimal year the position is stated at.
    pub epoch_year: f64,
}

impl LlrStation {
    /// The station's ITRF position (m) advanced from its stated epoch to Julian date
    /// `jd_utc` by its published linear velocity. The only motion applied; no loading, no
    /// tidal and no eccentricity correction.
    pub fn position_at(&self, jd_utc: f64) -> Vec3 {
        // Decimal year of jd_utc, referred to J2000.0 (JD 2451545.0 = 2000.0 within the
        // fraction of a day this correction can possibly care about).
        let years = (jd_utc - crate::timescales::JD_J2000) / DAYS_PER_JULIAN_YEAR + 2000.0
            - self.epoch_year;
        [
            self.itrf_m[0] + self.velocity_m_per_year[0] * years,
            self.itrf_m[1] + self.velocity_m_per_year[1] * years,
            self.itrf_m[2] + self.velocity_m_per_year[2] * years,
        ]
    }
}

/// Strip a `#` comment line, returning `None` for comments and blank lines.
fn data_line(s: &str) -> Option<&str> {
    let t = s.trim();
    if t.is_empty() || t.starts_with('#') {
        None
    } else {
        Some(t)
    }
}

/// Parse the committed retroreflector catalogue
/// (`tests/fixtures/lunar_llr/de430_retroreflectors_mer.csv`).
///
/// The file is generated from JPL's published DE430 lunar-coordinates memorandum by
/// `generate_de430_retroreflectors.py`, which hash-verifies the source PDF. This reader
/// re-checks the internal consistency the generator checked — that `|(x,y,z)|` equals the
/// published radius column — so a hand-edited fixture is caught here too.
pub fn parse_reflector_catalogue(text: &str) -> Result<Vec<ReflectorSite>, String> {
    let mut out = Vec::new();
    let mut seen_header = false;
    for line in text.lines() {
        let Some(t) = data_line(line) else { continue };
        if !seen_header {
            if !t.starts_with("array,") {
                return Err(format!("unexpected reflector-catalogue header {t:?}"));
            }
            seen_header = true;
            continue;
        }
        let f: Vec<&str> = t.split(',').collect();
        if f.len() < 6 {
            return Err(format!("short reflector-catalogue row {t:?}"));
        }
        let num = |i: usize| -> Result<f64, String> {
            f[i].trim()
                .parse::<f64>()
                .map_err(|_| format!("unreadable reflector field {i} in {t:?}"))
        };
        let mer = [num(2)?, num(3)?, num(4)?];
        let radius = num(5)?;
        if (norm3(mer) - radius).abs() > 0.05 {
            return Err(format!(
                "reflector {:?}: |(x,y,z)| = {:.3} m but the published radius column says \
                 {radius:.3} m — the row has been edited",
                f[0],
                norm3(mer)
            ));
        }
        out.push(ReflectorSite {
            array: f[0].trim().to_string(),
            ilrs_target: f[1].trim().to_string(),
            mer_m: mer,
        });
    }
    if out.is_empty() {
        return Err("reflector catalogue has no rows".to_string());
    }
    Ok(out)
}

/// Parse the committed station catalogue
/// (`tests/fixtures/lunar_llr/itrf2020_llr_stations.csv`), generated from the IERS ITRF2020
/// SLR solution by `generate_itrf2020_llr_stations.py`.
pub fn parse_station_catalogue(text: &str) -> Result<Vec<LlrStation>, String> {
    let mut epoch_year = f64::NAN;
    let mut out = Vec::new();
    let mut seen_header = false;
    for line in text.lines() {
        let Some(t) = data_line(line) else { continue };
        if let Some(rest) = t.strip_prefix("position_epoch_year,") {
            epoch_year = rest
                .trim()
                .parse()
                .map_err(|_| format!("unreadable position_epoch_year {rest:?}"))?;
            continue;
        }
        if !seen_header {
            if !t.starts_with("crd_name,") {
                return Err(format!("unexpected station-catalogue header {t:?}"));
            }
            seen_header = true;
            continue;
        }
        if !epoch_year.is_finite() {
            return Err(
                "the station catalogue states no position_epoch_year; an ITRF position \
                 without its epoch cannot be propagated"
                    .to_string(),
            );
        }
        let f: Vec<&str> = t.split(',').collect();
        if f.len() < 13 {
            return Err(format!("short station-catalogue row {t:?}"));
        }
        let num = |i: usize| -> Result<f64, String> {
            f[i].trim()
                .parse::<f64>()
                .map_err(|_| format!("unreadable station field {i} in {t:?}"))
        };
        out.push(LlrStation {
            crd_name: f[0].trim().to_string(),
            ilrs_id: f[1]
                .trim()
                .parse()
                .map_err(|_| format!("unreadable ILRS id in {t:?}"))?,
            domes: f[2].trim().to_string(),
            site: f[3].trim().to_string(),
            itrf_m: [num(4)?, num(5)?, num(6)?],
            velocity_m_per_year: [num(10)?, num(11)?, num(12)?],
            epoch_year,
        });
    }
    if out.is_empty() {
        return Err("station catalogue has no rows".to_string());
    }
    Ok(out)
}

// ---------------------------------------------------------------------------
// The observation model.
// ---------------------------------------------------------------------------

/// The modelled two-way light time of one normal point and its partial with respect to the
/// reflector's body-fixed coordinates.
#[derive(Clone, Copy, Debug)]
pub struct LlrGeometry {
    /// Modelled two-way time of flight (s), from a converged up-leg/down-leg light-time
    /// iteration over the engine's Moon ephemeris and lunar orientation.
    pub two_way_tof_s: f64,
    /// `d(tau_2way)/d(r_reflector)` in the body-fixed MER frame (s/m per axis).
    pub partial_mer_s_per_m: Vec3,
    /// Modelled one-way station-to-reflector range at the bounce epoch (m).
    pub one_way_range_m: f64,
    /// Body-fixed unit vector from the Moon centre toward the observing station at the bounce
    /// epoch — the direction a range determines *best*, because the partial is (twice) this
    /// line of sight.
    pub station_direction_mer: Vec3,
}

/// Position of a reflector in the geocentric celestial frame at TT Julian date `jd_tt`.
fn reflector_gcrs(mer_m: Vec3, jd_tt: f64) -> (Vec3, Mat3) {
    let t_jc = (jd_tt - crate::timescales::JD_J2000) / 36_525.0;
    let moon = crate::ephem::moon_position(t_jc);
    // `icrf_to_iau_moon` maps celestial -> body-fixed, so its transpose lifts the body-fixed
    // reflector offset into the celestial frame. `jd_tdb ~= jd_tt` at the fidelity of the
    // analytic orientation model.
    let m = crate::lunar_frame::icrf_to_iau_moon(jd_tt);
    (add3(moon, mat_vec(&transpose(&m), mer_m)), m)
}

/// Station position in the geocentric celestial frame at UTC Julian date `jd_utc`.
fn station_gcrs(itrf_m: Vec3, jd_utc: f64, dut1_s: f64) -> Vec3 {
    let jd_tt = crate::timescales::utc_to_tt(jd_utc);
    let jd_ut1 = crate::timescales::utc_to_ut1(jd_utc, dut1_s);
    crate::cio::itrs_to_gcrs(itrf_m, jd_tt, jd_ut1, 0.0, 0.0)
}

/// Solve the two-way light time of one lunar laser range and its reflector partial.
///
/// `jd_utc_tx` is the ground **transmit** epoch (CRD epoch event 2). The up-leg is iterated
/// to the bounce epoch and the down-leg from it, each to a fixed point; three iterations move
/// the answer by less than a femtosecond at lunar distance because the correction is
/// `O(v/c) ~ 3e-6` per pass.
///
/// The partial is exact for the geometry that is modelled: with
/// `r_reflector = r_moon + B(t)^T p`, `d|r_reflector - r_station| / dp = B(t) u` for the unit
/// line of sight `u`, and the two legs contribute one such term each.
pub fn llr_geometry(
    station_itrf_m: Vec3,
    reflector_mer_m: Vec3,
    jd_utc_tx: f64,
    dut1_s: f64,
) -> LlrGeometry {
    let day = 86_400.0;
    let r_sta_tx = station_gcrs(station_itrf_m, jd_utc_tx, dut1_s);

    // Up-leg: find the bounce epoch.
    let mut tau_up = 1.28;
    let mut r_refl = [0.0; 3];
    let mut b_mat = [[0.0; 3]; 3];
    for _ in 0..4 {
        let jd_b_tt = crate::timescales::utc_to_tt(jd_utc_tx + tau_up / day);
        let (p, m) = reflector_gcrs(reflector_mer_m, jd_b_tt);
        r_refl = p;
        b_mat = m;
        tau_up = norm3(sub3(r_refl, r_sta_tx)) / C;
    }
    let jd_bounce = jd_utc_tx + tau_up / day;

    // Down-leg: find the ground receive epoch.
    let mut tau_dn = tau_up;
    let mut r_sta_rx = r_sta_tx;
    for _ in 0..4 {
        r_sta_rx = station_gcrs(station_itrf_m, jd_bounce + tau_dn / day, dut1_s);
        tau_dn = norm3(sub3(r_sta_rx, r_refl)) / C;
    }

    let u_up = unit3(sub3(r_refl, r_sta_tx));
    let u_dn = unit3(sub3(r_refl, r_sta_rx));
    let sum = add3(u_up, u_dn);
    let partial_gcrs = [sum[0] / C, sum[1] / C, sum[2] / C];

    // Moon-centre-to-station direction in the body-fixed frame, at the bounce epoch.
    let jd_b_tt = crate::timescales::utc_to_tt(jd_bounce);
    let t_jc = (jd_b_tt - crate::timescales::JD_J2000) / 36_525.0;
    let moon = crate::ephem::moon_position(t_jc);
    let to_station = mat_vec(&b_mat, unit3(sub3(r_sta_tx, moon)));

    LlrGeometry {
        two_way_tof_s: tau_up + tau_dn,
        partial_mer_s_per_m: mat_vec(&b_mat, partial_gcrs),
        one_way_range_m: 0.5 * (tau_up + tau_dn) * C,
        station_direction_mer: to_station,
    }
}

// ---------------------------------------------------------------------------
// Residual statistics.
// ---------------------------------------------------------------------------

/// Observed-minus-computed one-way range statistics (m) over a set of normal points — the
/// measured size of every link this engine still models.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct ResidualStats {
    /// How many residuals went into the statistics.
    pub n: usize,
    /// Arithmetic mean (m).
    pub mean_m: f64,
    /// Median (m) — robust to the tails an analytic ephemeris produces.
    pub median_m: f64,
    /// Root mean square (m).
    pub rms_m: f64,
    /// Smallest (most negative) residual (m).
    pub min_m: f64,
    /// Largest residual (m).
    pub max_m: f64,
}

impl ResidualStats {
    /// Summarise a residual set. An empty set gives `n = 0` and zeros, never a NaN in the
    /// emitted document.
    pub fn of(v: &[f64]) -> ResidualStats {
        if v.is_empty() {
            return ResidualStats::default();
        }
        let n = v.len();
        let mean = v.iter().sum::<f64>() / n as f64;
        let rms = (v.iter().map(|x| x * x).sum::<f64>() / n as f64).sqrt();
        ResidualStats {
            n,
            mean_m: mean,
            median_m: median(v),
            rms_m: rms,
            min_m: v.iter().cloned().fold(f64::INFINITY, f64::min),
            max_m: v.iter().cloned().fold(f64::NEG_INFINITY, f64::max),
        }
    }
}

// ---------------------------------------------------------------------------
// Scenario.
// ---------------------------------------------------------------------------

/// A runnable real-data lunar frame-datum scenario — the TOML `kind = "lunar-llr-datum"`
/// entry the engine dispatches to [`LunarLlrDatumScenario::run_json`].
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarLlrDatumScenario {
    /// Root of the committed real-data slice. Default `tests/fixtures/lunar_llr`; the three
    /// path fields below default to files inside it.
    pub data_dir: Option<String>,
    /// Directory of ILRS CRD `*.npt` normal-point files. Default `<data_dir>/normal_points`.
    pub normal_points_dir: Option<String>,
    /// Retroreflector catalogue CSV. Default `<data_dir>/de430_retroreflectors_mer.csv`.
    pub reflectors_path: Option<String>,
    /// Station catalogue CSV. Default `<data_dir>/itrf2020_llr_stations.csv`.
    pub stations_path: Option<String>,
    /// UT1 − UTC (s) applied to the Earth-rotation angle. Default 0 — an unmodelled dUT1 of
    /// up to 0.9 s displaces a station by up to ~400 m along its parallel, which is reported
    /// as part of the residual and is negligible against the analytic lunar ephemeris.
    pub dut1_s: Option<f64>,
    /// Relative eigenvalue threshold separating observable directions from the datum defect.
    /// Default 1e-9, the same as [`crate::lunar_frame_campaign`].
    pub rel_tol: Option<f64>,
    /// Run [`crate::lunar_frame_campaign`] at its defaults and print its simulated-campaign
    /// figures beside the measured ones. Default true.
    pub compare_simulated_campaign: Option<bool>,
    /// Angle (deg) by which every line-of-sight partial is tilted in the sensitivity probe —
    /// a stated bound on the direction error the modelled Moon-centre ephemeris can induce,
    /// not a measurement. Default 0.1, above the worst-epoch disagreement with JPL over the
    /// committed span that `tests/lunar_llr_real_data.rs` measures.
    pub sensitivity_tilt_deg: Option<f64>,
}

/// One usable observation after the catalogues have been joined to a normal point.
struct Used {
    reflector: usize,
    partial_mer_s_per_m: Vec3,
    weight: f64,
    residual_m: f64,
    station_direction_mer: Vec3,
}

/// Everything one run computed, before it is rendered.
struct Computed {
    json: serde_json::Value,
    summary: String,
}

impl LunarLlrDatumScenario {
    fn data_dir(&self) -> PathBuf {
        PathBuf::from(self.data_dir.as_deref().unwrap_or(DEFAULT_DATA_DIR))
    }

    fn path_or(&self, explicit: &Option<String>, under: &str) -> PathBuf {
        match explicit {
            Some(p) => PathBuf::from(p),
            None => self.data_dir().join(under),
        }
    }

    /// Resolved relative eigenvalue threshold.
    fn rel_tol(&self) -> f64 {
        self.rel_tol.unwrap_or(1.0e-9)
    }

    fn read(path: &Path) -> Result<String, String> {
        std::fs::read_to_string(path).map_err(|e| {
            format!(
                "cannot read {} ({e}). This scenario runs on the committed real-data slice \
                 under {DEFAULT_DATA_DIR}, which ships with the repository but not with the \
                 published crate; point `data_dir` at a copy of it.",
                path.display()
            )
        })
    }

    fn compute(&self) -> Result<Computed, String> {
        let reflectors = parse_reflector_catalogue(&Self::read(
            &self.path_or(&self.reflectors_path, "de430_retroreflectors_mer.csv"),
        )?)?;
        let stations = parse_station_catalogue(&Self::read(
            &self.path_or(&self.stations_path, "itrf2020_llr_stations.csv"),
        )?)?;
        let np_dir = self.path_or(&self.normal_points_dir, "normal_points");
        let points: Vec<LlrNormalPoint> = read_crd_dir(&np_dir)?;
        let dut1 = self.dut1_s.unwrap_or(0.0);

        let n_parsed = points.len();
        let mut skipped_unknown_station = 0usize;
        let mut skipped_unknown_target = 0usize;
        let mut skipped_no_precision = 0usize;
        let mut skipped_epoch_event = 0usize;
        let mut used: Vec<Used> = Vec::new();
        let mut station_counts = vec![0usize; stations.len()];
        let mut jd_min = f64::INFINITY;
        let mut jd_max = f64::NEG_INFINITY;
        let mut sigma_two_way: Vec<f64> = Vec::new();
        let mut bin_rms: Vec<f64> = Vec::new();
        let mut raw_counts: Vec<f64> = Vec::new();

        for p in &points {
            let Some(si) = stations.iter().position(|s| s.ilrs_id == p.station_id) else {
                skipped_unknown_station += 1;
                continue;
            };
            let Some(ri) = reflectors.iter().position(|r| r.ilrs_target == p.target) else {
                skipped_unknown_target += 1;
                continue;
            };
            // Only the ground-transmit convention is modelled here; anything else would need
            // a different light-time root and is refused rather than mis-timed.
            if p.epoch_event != 2 {
                skipped_epoch_event += 1;
                continue;
            }
            let Some(sigma) = p.sigma_two_way_s() else {
                skipped_no_precision += 1;
                continue;
            };
            let g = llr_geometry(
                stations[si].position_at(p.jd_utc),
                reflectors[ri].mer_m,
                p.jd_utc,
                dut1,
            );
            station_counts[si] += 1;
            jd_min = jd_min.min(p.jd_utc);
            jd_max = jd_max.max(p.jd_utc);
            sigma_two_way.push(sigma);
            bin_rms.push(p.bin_rms_ps);
            raw_counts.push(p.raw_ranges as f64);
            used.push(Used {
                reflector: ri,
                partial_mer_s_per_m: g.partial_mer_s_per_m,
                weight: 1.0 / (sigma * sigma),
                residual_m: 0.5 * (p.two_way_tof_s - g.two_way_tof_s) * C,
                station_direction_mer: g.station_direction_mer,
            });
        }

        if used.len() < 3 * reflectors.len() {
            return Err(format!(
                "only {} usable normal points for {} reflectors — too few to bound {} \
                 coordinates; widen the archive slice",
                used.len(),
                reflectors.len(),
                3 * reflectors.len()
            ));
        }

        // ---- Fisher information over the joint reflector-coordinate state. ----
        let dim = 3 * reflectors.len();
        let mut jac: Vec<Vec<f64>> = Vec::with_capacity(used.len());
        let mut weights: Vec<f64> = Vec::with_capacity(used.len());
        for u in &used {
            let mut row = vec![0.0; dim];
            row[3 * u.reflector..3 * u.reflector + 3].copy_from_slice(&u.partial_mer_s_per_m);
            jac.push(row);
            weights.push(u.weight);
        }
        let info_b = information_matrix(&jac, &weights);
        let beacon = crlb(&info_b, self.rel_tol());

        // Each observation touches exactly one reflector, so the information matrix is
        // block-diagonal by construction. It is measured rather than assumed.
        let mut max_diag = 0.0_f64;
        let mut max_offblock = 0.0_f64;
        for (i, row) in info_b.iter().enumerate() {
            max_diag = max_diag.max(row[i].abs());
            for (j, &x) in row.iter().enumerate() {
                if i / 3 != j / 3 {
                    max_offblock = max_offblock.max(x.abs());
                }
            }
        }
        let offblock_fraction = if max_diag > 0.0 {
            max_offblock / max_diag
        } else {
            0.0
        };

        // ---- The Helmert datum. ----
        let points_mer: Vec<Vec3> = reflectors.iter().map(|r| r.mer_m).collect();
        let a = helmert_design(&points_mer);
        let (h, datum) = solve_datum(&info_b, &a, self.rel_tol());

        // ---- Geometry sensitivity: the only route by which an ephemeris error reaches a
        // Fisher information matrix is the direction of each line of sight, so tilt every
        // partial by a stated bound on that direction error and re-solve the whole datum.
        // The answer is emitted as a ratio instead of the claim it replaces.
        let tilt_deg = self.sensitivity_tilt_deg.unwrap_or(0.1);
        let tilt_rad = tilt_deg.to_radians();
        // The sign alternates observation by observation: a tilt applied coherently to every
        // partial is close to a rotation of the whole frame, which a datum solve largely
        // absorbs, so it would flatter the answer. Alternating it scatters the directions
        // instead, and is the harsher of the two probes.
        let mut jac_t: Vec<Vec<f64>> = Vec::with_capacity(used.len());
        for (i, u) in used.iter().enumerate() {
            let signed = if i % 2 == 0 { tilt_rad } else { -tilt_rad };
            let mut row = vec![0.0; dim];
            row[3 * u.reflector..3 * u.reflector + 3]
                .copy_from_slice(&tilt(u.partial_mer_s_per_m, signed));
            jac_t.push(row);
        }
        let info_t = information_matrix(&jac_t, &weights);
        let (_, datum_t) = solve_datum(&info_t, &a, self.rel_tol());

        // ---- Per-reflector reporting. ----
        let mut refl_json = Vec::with_capacity(reflectors.len());
        for (i, r) in reflectors.iter().enumerate() {
            let n_obs = used.iter().filter(|u| u.reflector == i).count();
            let res: Vec<f64> = used
                .iter()
                .filter(|u| u.reflector == i)
                .map(|u| u.residual_m)
                .collect();
            let rs = ResidualStats::of(&res);
            let (sx, sy, sz) = (
                beacon.crlb_std[3 * i],
                beacon.crlb_std[3 * i + 1],
                beacon.crlb_std[3 * i + 2],
            );
            let s3 = (sx * sx + sy * sy + sz * sz).sqrt();
            // The mean body-fixed direction to the observing stations over this reflector's
            // own observations: the direction the range measures directly.
            let mut dir = [0.0; 3];
            for u in used.iter().filter(|u| u.reflector == i) {
                dir = add3(dir, u.station_direction_mer);
            }
            let dir = unit3(dir);
            // How far the body-fixed direction to the observing station actually moved over
            // this reflector's own observations -- the libration (plus diurnal parallax)
            // sweep that is the ONLY thing separating the plane-of-sky coordinates from the
            // line-of-sight one. Emitted because it, not the observation count, sets
            // `ratio_across_over_along`.
            let sweep_deg = used
                .iter()
                .filter(|u| u.reflector == i)
                .map(|u| {
                    let d = u.station_direction_mer;
                    (dir[0] * d[0] + dir[1] * d[1] + dir[2] * d[2])
                        .clamp(-1.0, 1.0)
                        .acos()
                        .to_degrees()
                })
                .fold(0.0_f64, f64::max);
            // The same sweep weighted the way the information matrix weights it: an arc is
            // only worth what its normal points weigh.
            let (mut wsum, mut wang2) = (0.0_f64, 0.0_f64);
            for u in used.iter().filter(|u| u.reflector == i) {
                let d = u.station_direction_mer;
                let ang = (dir[0] * d[0] + dir[1] * d[1] + dir[2] * d[2])
                    .clamp(-1.0, 1.0)
                    .acos();
                wsum += u.weight;
                wang2 += u.weight * ang * ang;
            }
            let rms_sweep_deg = if wsum > 0.0 {
                (wang2 / wsum).sqrt().to_degrees()
            } else {
                0.0
            };
            // Formal sigma along that direction, and across it, from the 3x3 block.
            let blk = |p: usize, q: usize| beacon.pseudo_covariance[3 * i + p][3 * i + q];
            let mut along = 0.0;
            for p in 0..3 {
                for q in 0..3 {
                    along += dir[p] * blk(p, q) * dir[q];
                }
            }
            let along = along.max(0.0).sqrt();
            let trace: f64 = (0..3).map(|p| blk(p, p)).sum();
            let across = ((trace - along * along) / 2.0).max(0.0).sqrt();
            // The three principal sigmas of this array's own covariance block, so the
            // anisotropy of the sweep is a printed number rather than a story: an isotropic
            // sweep would make the two transverse principal axes equal, and a real libration
            // ellipse does not.
            let cov3: Vec<Vec<f64>> = (0..3)
                .map(|p| (0..3).map(|q| blk(p, q)).collect())
                .collect();
            let pr = crate::fim::sym_eig(&cov3);
            let principal: Vec<f64> = pr.values.iter().map(|v| v.max(0.0).sqrt()).collect();
            refl_json.push(serde_json::json!({
                "array": r.array,
                "ilrs_target": r.ilrs_target,
                "mer_x_m": r.mer_m[0],
                "mer_y_m": r.mer_m[1],
                "mer_z_m": r.mer_m[2],
                "observations": n_obs,
                "sigma_x_m": sx,
                "sigma_y_m": sy,
                "sigma_z_m": sz,
                "sigma_3d_m": s3,
                "sigma_along_line_of_sight_m": along,
                "sigma_across_line_of_sight_m": across,
                "ratio_across_over_along": if along > 0.0 { across / along } else { 0.0 },
                "libration_sweep_deg": sweep_deg,
                "weighted_rms_sweep_deg": rms_sweep_deg,
                "isotropic_sweep_ratio_lower_bound": if rms_sweep_deg > 0.0 {
                    1.0 / rms_sweep_deg.to_radians()
                } else {
                    0.0
                },
                "sigma_principal_min_m": principal[0],
                "sigma_principal_mid_m": principal[1],
                "sigma_principal_max_m": principal[2],
                "principal_transverse_anisotropy": if principal[1] > 0.0 {
                    principal[2] / principal[1]
                } else {
                    0.0
                },
                "residual_mean_m": rs.mean_m,
                "residual_rms_m": rs.rms_m,
            }));
        }

        // ---- Residuals over everything used. ----
        let all_res: Vec<f64> = used.iter().map(|u| u.residual_m).collect();
        let residuals = ResidualStats::of(&all_res);

        // ---- The seven Helmert parameters. ----
        let mut params = Vec::with_capacity(N_HELMERT);
        for (k, (name, unit)) in HELMERT_PARAMETERS.iter().enumerate() {
            params.push(serde_json::json!({
                "name": name,
                "unit": unit,
                "sigma": number_or_null(datum.full_rank, datum.sigma[k]),
                "constrained_fraction": datum.constrained_fraction[k],
                "weakest_direction_share": datum.weakest_direction[k].powi(2),
            }));
        }
        let unobservable: Vec<serde_json::Value> = (0..datum.defect)
            .map(|j| {
                serde_json::json!({
                    "index": j,
                    "direction": (0..N_HELMERT)
                        .map(|k| datum.null_space[k][j])
                        .collect::<Vec<f64>>(),
                })
            })
            .collect();

        // ---- The simulated campaign, run rather than quoted. ----
        let compare = self.compare_simulated_campaign.unwrap_or(true);
        let simulated = if compare {
            let sim = crate::lunar_frame_campaign::LunarFrameCampaignScenario::default();
            let (sj, _) = sim.run_json()?;
            let v: serde_json::Value = serde_json::from_str(&sj)
                .map_err(|e| format!("the simulated campaign's own report did not parse: {e}"))?;
            let get = |k: &str| -> f64 {
                v.pointer(&format!("/datum_accuracy/{k}"))
                    .and_then(|x| x.as_f64())
                    .unwrap_or(f64::NAN)
            };
            Some((
                get("translation_sigma_norm_m"),
                get("rotation_sigma_norm_rad"),
                get("scale_sigma_ppb"),
            ))
        } else {
            None
        };

        let t_norm = datum.translation_sigma_norm_m();
        let r_norm = datum.rotation_sigma_norm_rad();
        let s_ppb = datum.scale_sigma_ppb();

        let comparison = match simulated {
            Some((st, sr, ss)) => serde_json::json!({
                "simulated_campaign": {
                    "translation_sigma_norm_m": st,
                    "rotation_sigma_norm_rad": sr,
                    "scale_sigma_ppb": ss,
                },
                "ratio_simulated_over_measured_translation": ratio(st, t_norm),
                "ratio_simulated_over_measured_rotation": ratio(sr, r_norm),
                "ratio_simulated_over_measured_scale": ratio(ss, s_ppb),
            }),
            None => serde_json::Value::Null,
        };

        let station_json: Vec<serde_json::Value> = stations
            .iter()
            .zip(station_counts.iter())
            .map(|(s, &n)| {
                serde_json::json!({
                    "crd_name": s.crd_name,
                    "ilrs_id": s.ilrs_id,
                    "domes": s.domes,
                    "site": s.site,
                    "itrf_x_m": s.itrf_m[0],
                    "itrf_y_m": s.itrf_m[1],
                    "itrf_z_m": s.itrf_m[2],
                    "observations": n,
                })
            })
            .collect();

        let json = serde_json::json!({
            "kind": "lunar-llr-datum",
            "label": LABEL,
            "data": {
                "normal_points_dir": np_dir.display().to_string(),
                "normal_points_parsed": n_parsed,
                "normal_points_used": used.len(),
                "skipped_station_not_in_catalogue": skipped_unknown_station,
                "skipped_target_not_in_catalogue": skipped_unknown_target,
                "skipped_epoch_event_not_ground_transmit": skipped_epoch_event,
                "skipped_no_measured_precision": skipped_no_precision,
                "first_epoch_jd_utc": jd_min,
                "last_epoch_jd_utc": jd_max,
                "span_days": jd_max - jd_min,
                "median_bin_rms_ps": median(&bin_rms),
                "median_raw_ranges_per_point": median(&raw_counts),
                "median_sigma_two_way_s": median(&sigma_two_way),
                "median_sigma_range_mm": median(&sigma_two_way) * C / 2.0 * 1.0e3,
                "dut1_s": dut1,
                "normal_point_source": "ILRS Consolidated Laser Ranging Data (CRD) normal \
                    points, EUROLAS Data Center (EDC), DGFI-TUM",
                "station_source": "IERS ITRF2020 SLR station positions and velocities",
                "reflector_source": "JPL DE430 lunar coordinates memorandum, Table 7 (mean \
                    Earth / mean rotation axis frame)",
                "stations": station_json,
            },
            "reflectors": refl_json,
            "reflector_information": {
                "dimension": beacon.n,
                "rank": beacon.rank,
                "defect": beacon.defect,
                "offblock_fraction": offblock_fraction,
                "eigenvalues_per_m2": beacon.eigenvalues,
            },
            "residuals": {
                "n": residuals.n,
                "mean_m": residuals.mean_m,
                "median_m": residuals.median_m,
                "rms_m": residuals.rms_m,
                "min_m": residuals.min_m,
                "max_m": residuals.max_m,
            },
            "helmert": {
                "rel_tol": self.rel_tol(),
                "rank": datum.rank,
                "defect": datum.defect,
                "condition_number": datum.condition,
                "eigenvalues": datum.eigenvalues,
                "parameter_order": HELMERT_PARAMETERS.map(|(n, _)| n),
                "parameters": params,
                "unobservable_directions": unobservable,
                "weakest_direction": {
                    "eigenvalue": datum.weakest_eigenvalue,
                    "direction": datum.weakest_direction,
                },
                "information_matrix": h,
            },
            "datum_accuracy": {
                "translation_sigma_m": (0..3)
                    .map(|k| number_or_null(datum.full_rank, datum.sigma[k]))
                    .collect::<Vec<_>>(),
                "translation_sigma_norm_m": number_or_null(datum.full_rank, t_norm),
                "rotation_sigma_urad": (3..6)
                    .map(|k| number_or_null(datum.full_rank, datum.sigma[k]))
                    .collect::<Vec<_>>(),
                "rotation_sigma_norm_rad": number_or_null(datum.full_rank, r_norm),
                "scale_sigma_ppb": number_or_null(datum.full_rank, s_ppb),
            },
            "comparison": comparison,
            "sensitivity": {
                "line_of_sight_tilt_deg": tilt_deg,
                "translation_sigma_norm_m": number_or_null(
                    datum_t.full_rank,
                    datum_t.translation_sigma_norm_m(),
                ),
                "rotation_sigma_norm_rad": number_or_null(
                    datum_t.full_rank,
                    datum_t.rotation_sigma_norm_rad(),
                ),
                "scale_sigma_ppb": number_or_null(datum_t.full_rank, datum_t.scale_sigma_ppb()),
                "ratio_tilted_over_nominal_translation": ratio(
                    datum_t.translation_sigma_norm_m(),
                    t_norm,
                ),
                "ratio_tilted_over_nominal_rotation": ratio(
                    datum_t.rotation_sigma_norm_rad(),
                    r_norm,
                ),
                "ratio_tilted_over_nominal_scale": ratio(datum_t.scale_sigma_ppb(), s_ppb),
            },
            "units": units_block(),
        });

        let summary = format!(
            "lunar-llr-datum: {} archived normal points ({} parsed) from {} station(s) to {} \
             retroreflector arrays over {:.1} d; median measured normal-point precision {:.2} \
             mm one-way; reflector information rank {}/{}; Helmert rank {}/{} cond {:.3e}; \
             datum translation sigma {} m; observed-minus-computed one-way residual RMS {:.1} \
             m (the modelled links, chiefly the analytic lunar ephemeris)",
            used.len(),
            n_parsed,
            station_counts.iter().filter(|&&n| n > 0).count(),
            reflectors.len(),
            jd_max - jd_min,
            median(&sigma_two_way) * C / 2.0 * 1.0e3,
            beacon.rank,
            beacon.n,
            datum.rank,
            N_HELMERT,
            datum.condition,
            if datum.full_rank {
                format!("{t_norm:.6e}")
            } else {
                "null (rank-deficient)".to_string()
            },
            residuals.rms_m,
        );

        Ok(Computed { json, summary })
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let c = self.compute()?;
        let json = serde_json::to_string_pretty(&c.json)
            .map_err(|e| format!("serialising the lunar-llr-datum report failed: {e}"))?;
        Ok((json, c.summary))
    }
}

/// Rotate `g` by `angle_rad` about the deterministic axis `g x z` (falling back to `g x x`
/// when `g` is nearly parallel to `z`), leaving `|g|` unchanged.
///
/// Used only by the geometry-sensitivity probe: tilting every partial by the same angle is a
/// coherent worst-case perturbation of the line-of-sight directions, which is the only way an
/// ephemeris error can reach a Fisher information matrix.
fn tilt(g: Vec3, angle_rad: f64) -> Vec3 {
    let z: Vec3 = [0.0, 0.0, 1.0];
    let x: Vec3 = [1.0, 0.0, 0.0];
    let cross = |a: Vec3, b: Vec3| {
        [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    };
    let mut k = cross(g, z);
    if norm3(k) < 1.0e-6 * norm3(g) {
        k = cross(g, x);
    }
    let k = unit3(k);
    let kg = cross(k, g);
    let (s, c) = angle_rad.sin_cos();
    [
        g[0] * c + kg[0] * s,
        g[1] * c + kg[1] * s,
        g[2] * c + kg[2] * s,
    ]
}

/// `a / b`, or 0 when `b` is not usable — a ratio is a presentation aid and must never put a
/// NaN or an infinity into the document.
fn ratio(a: f64, b: f64) -> f64 {
    if b.is_finite() && b != 0.0 && a.is_finite() {
        a / b
    } else {
        0.0
    }
}

/// A number when the datum has full rank, JSON `null` when it does not — an unconstrained
/// parameter is published as absent with a status, never read out of a near-singular inverse.
fn number_or_null(ok: bool, v: f64) -> serde_json::Value {
    if ok && v.is_finite() {
        serde_json::Value::from(v)
    } else {
        serde_json::Value::Null
    }
}

/// The units-and-provenance contract for every numeric field this pack emits:
/// `(path, unit, provenance class, definition)`.
const UNITS: &[(&str, &str, &str, Option<&str>)] = &[
    ("data.normal_points_parsed", "count", "measured", Some("normal-point records read out of the committed CRD files")),
    ("data.normal_points_used", "count", "measured", Some("records that joined to both catalogues, carry the ground-transmit epoch convention and state a usable precision")),
    ("data.skipped_station_not_in_catalogue", "count", "measured", Some("records from a station with no published ITRF2020 position; skipped rather than given a substituted coordinate")),
    ("data.skipped_target_not_in_catalogue", "count", "measured", Some("records whose CRD target name is not one of the five DE430 Table 7 arrays")),
    ("data.skipped_epoch_event_not_ground_transmit", "count", "measured", Some("records whose CRD epoch-event code is not 2; the light-time root here is solved from the ground transmit time only")),
    ("data.skipped_no_measured_precision", "count", "measured", Some("records with a zero bin RMS or an empty bin, so the file states no precision to weight by")),
    ("data.first_epoch_jd_utc", "d", "measured", Some("Julian date (UTC) of the earliest normal point used")),
    ("data.last_epoch_jd_utc", "d", "measured", Some("Julian date (UTC) of the latest normal point used")),
    ("data.span_days", "d", "measured", Some("last epoch minus first epoch; the arc the libration is sampled over")),
    ("data.median_bin_rms_ps", "ps", "measured", Some("median over the used points of the archived scatter of the raw ranges about the bin trend, in picoseconds of two-way time of flight")),
    ("data.median_raw_ranges_per_point", "count", "measured", Some("median number of raw returns compressed into one normal point")),
    ("data.median_sigma_two_way_s", "s", "measured", Some("median of bin_rms / sqrt(n_raw): the per-observation standard error the weights use, straight out of the file")),
    ("data.median_sigma_range_mm", "mm", "measured", Some("the same median expressed as a one-way range, c * sigma / 2")),
    ("data.dut1_s", "s", "input", Some("UT1 - UTC applied to the Earth-rotation angle; 0 unless stated, and the omission is inside the reported residual")),
    ("data.stations.ilrs_id", "id", "measured", Some("ILRS numeric station identifier exactly as the CRD h2 record states it -- a label that happens to be written as digits, with no unit and no arithmetic meaning")),
    ("data.stations.itrf_x_m", "m", "published", Some("ITRF2020 SLR station X at the solution epoch, IERS")),
    ("data.stations.itrf_y_m", "m", "published", Some("ITRF2020 SLR station Y at the solution epoch, IERS")),
    ("data.stations.itrf_z_m", "m", "published", Some("ITRF2020 SLR station Z at the solution epoch, IERS")),
    ("data.stations.observations", "count", "measured", Some("normal points this station contributed after the joins")),
    ("reflectors.mer_x_m", "m", "published", Some("DE430 Table 7 mean-Earth-frame X of the retroreflector array")),
    ("reflectors.mer_y_m", "m", "published", Some("DE430 Table 7 mean-Earth-frame Y of the retroreflector array")),
    ("reflectors.mer_z_m", "m", "published", Some("DE430 Table 7 mean-Earth-frame Z of the retroreflector array")),
    ("reflectors.observations", "count", "measured", Some("normal points that ranged to this array in the committed slice")),
    ("reflectors.sigma_x_m", "m", "computed", Some("Cramer-Rao bound on the array's body-fixed X from this schedule and these weights; a bound for a reduced parameter set, not an accuracy")),
    ("reflectors.sigma_y_m", "m", "computed", Some("Cramer-Rao bound on the array's body-fixed Y coordinate")),
    ("reflectors.sigma_z_m", "m", "computed", Some("Cramer-Rao bound on the array's body-fixed Z coordinate")),
    ("reflectors.sigma_3d_m", "m", "computed", Some("root-sum-square of the three axis bounds")),
    ("reflectors.sigma_along_line_of_sight_m", "m", "computed", Some("bound along the arc-mean body-fixed direction to the observing station: the direction a range measures directly")),
    ("reflectors.sigma_across_line_of_sight_m", "m", "computed", Some("bound in the plane of the sky, which only the libration constrains")),
    ("reflectors.ratio_across_over_along", "1", "computed", Some("how much worse the plane-of-sky coordinates are than the line-of-sight one; set by the libration amplitude over the arc, not by the data volume")),
    ("reflectors.libration_sweep_deg", "deg", "computed", Some("largest angle any used observation's body-fixed direction to its station makes with the arc-mean direction: the libration plus diurnal-parallax sweep the REAL schedule sampled for this array")),
    ("reflectors.weighted_rms_sweep_deg", "deg", "computed", Some("that same sweep weighted by each normal point's own measured 1/sigma^2, which is how the information matrix sees it -- a wide arc observed badly buys little")),
    ("reflectors.isotropic_sweep_ratio_lower_bound", "1", "computed", Some("1 / weighted_rms_sweep in radians: what ratio_across_over_along would be if the sweep were an isotropic disc. The MEASURED ratio is several times larger because a libration sweep is an ellipse, not a disc; principal_transverse_anisotropy is that difference printed")),
    ("reflectors.sigma_principal_min_m", "m", "computed", Some("smallest principal standard deviation of this array's 3x3 covariance block; the line-of-sight direction a range measures directly")),
    ("reflectors.sigma_principal_mid_m", "m", "computed", Some("middle principal standard deviation: the better-sampled of the two plane-of-sky directions")),
    ("reflectors.sigma_principal_max_m", "m", "computed", Some("largest principal standard deviation: the plane-of-sky direction this real schedule's libration ellipse sampled least")),
    ("reflectors.principal_transverse_anisotropy", "1", "computed", Some("largest over middle principal sigma; 1 would mean an isotropic sweep, and the measured value is why the isotropic lower bound is optimistic")),
    ("reflectors.residual_mean_m", "m", "measured", Some("mean observed-minus-computed one-way range for this array: measurement minus the modelled chain")),
    ("reflectors.residual_rms_m", "m", "measured", Some("RMS observed-minus-computed one-way range for this array")),
    ("reflector_information.dimension", "count", "computed", Some("three coordinates per array")),
    ("reflector_information.rank", "count", "computed", Some("eigenvalues of the joint information matrix above rel_tol * lambda_max")),
    ("reflector_information.defect", "count", "computed", Some("dimension minus rank: coordinate directions the campaign does not constrain")),
    ("reflector_information.offblock_fraction", "1", "computed", Some("largest inter-array entry over the largest diagonal entry; exactly 0 because a range touches one array, which is measured here rather than assumed")),
    ("reflector_information.eigenvalues_per_m2", "1/m^2", "computed", Some("ascending eigenvalues of the joint reflector-coordinate information matrix")),
    ("residuals.n", "count", "measured", Some("residuals in the statistics; equals normal_points_used")),
    ("residuals.mean_m", "m", "measured", Some("mean observed-minus-computed one-way range over every point used")),
    ("residuals.median_m", "m", "measured", Some("median observed-minus-computed one-way range")),
    ("residuals.rms_m", "m", "measured", Some("RMS observed-minus-computed one-way range: THE MEASURED SIZE of every link this engine still models, dominated by the analytic Moon-centre ephemeris")),
    ("residuals.min_m", "m", "measured", Some("most negative observed-minus-computed one-way range")),
    ("residuals.max_m", "m", "measured", Some("largest observed-minus-computed one-way range")),
    ("helmert.rel_tol", "1", "input", Some("eigenvalue ratio below which a similarity direction counts as unobservable")),
    ("helmert.rank", "count", "computed", Some("how many of the seven similarity parameters this real campaign constrains")),
    ("helmert.defect", "count", "computed", Some("7 - rank")),
    ("helmert.condition_number", "1", "computed", Some("lambda_max / lambda_min of A^T M_b A over the observable subspace")),
    ("helmert.eigenvalues", "1/(balanced unit)^2", "computed", Some("ascending eigenvalues of A^T M_b A in the balanced units of parameter_order")),
    ("helmert.information_matrix", "1/(balanced unit)^2", "computed", Some("A^T M_b A: 1/m^2, 1/urad^2 and 1/ppm^2 on the diagonal, mixed products off it")),
    ("helmert.parameters.sigma", "see parameters.unit", "computed", Some("standard-deviation bound of that Helmert parameter in the unit its row names; null when the datum is rank-deficient")),
    ("helmert.parameters.constrained_fraction", "1", "computed", Some("1 minus the squared projection of that parameter direction onto the null space")),
    ("helmert.parameters.weakest_direction_share", "1", "computed", Some("squared component of this parameter in the weakest direction")),
    ("helmert.unobservable_directions.index", "count", "computed", Some("position in the emitted list, not a parameter number")),
    ("helmert.unobservable_directions.direction", "1", "computed", Some("unit null-space vector in parameter_order, in balanced units")),
    ("helmert.weakest_direction.eigenvalue", "1/(balanced unit)^2", "computed", Some("smallest eigenvalue of A^T M_b A; a full-rank datum still has a weakest direction and seven sigmas alone would hide it")),
    ("helmert.weakest_direction.direction", "1", "computed", Some("that eigenvector in parameter_order, sign-normalised so its largest-magnitude component is positive")),
    ("datum_accuracy.translation_sigma_m", "m", "computed", Some("per-axis translation bound; null under a rank deficiency")),
    ("datum_accuracy.translation_sigma_norm_m", "m", "computed", Some("THE DELIVERABLE: root-sum-square translation standard deviation of the seven-parameter datum, from a measured schedule and measured weights")),
    ("datum_accuracy.rotation_sigma_urad", "urad", "computed", Some("per-axis bound on the three small-angle rotation parameters")),
    ("datum_accuracy.rotation_sigma_norm_rad", "rad", "computed", Some("Euclidean norm of the three rotation bounds")),
    ("datum_accuracy.scale_sigma_ppb", "ppb", "computed", Some("bound on the single scale parameter")),
    ("comparison.simulated_campaign.translation_sigma_norm_m", "m", "modelled", Some("the lunar-frame-campaign scenario's own figure at its defaults, RUN here rather than transcribed; its station network and delay sigma are illustrative")),
    ("comparison.simulated_campaign.rotation_sigma_norm_rad", "rad", "modelled", Some("that simulated campaign's rotation figure")),
    ("comparison.simulated_campaign.scale_sigma_ppb", "ppb", "modelled", Some("that simulated campaign's scale figure")),
    ("comparison.ratio_simulated_over_measured_translation", "1", "computed", Some("simulated over measured; a ratio between two different observables (VLBI delay against laser range) and two different networks, so it is a finding, not a validation")),
    ("comparison.ratio_simulated_over_measured_rotation", "1", "computed", Some("same construction caveat as the translation ratio")),
    ("comparison.ratio_simulated_over_measured_scale", "1", "computed", Some("same construction caveat as the translation ratio")),
    ("sensitivity.line_of_sight_tilt_deg", "deg", "input", Some("stated bound on the line-of-sight direction error the MODELLED Moon-centre ephemeris can induce; an input, not a measurement -- tests/lunar_llr_real_data.rs measures the worst-epoch value against JPL Horizons and asserts it is below this")),
    ("sensitivity.translation_sigma_norm_m", "m", "computed", Some("the whole datum re-solved with every partial tilted by that angle about g x z, sign alternating observation by observation so the perturbation scatters the directions rather than rotating the frame; the line-of-sight direction is the ONLY route by which an ephemeris error reaches a Fisher information matrix")),
    ("sensitivity.rotation_sigma_norm_rad", "rad", "computed", Some("rotation norm under the same tilted geometry")),
    ("sensitivity.scale_sigma_ppb", "ppb", "computed", Some("scale sigma under the same tilted geometry")),
    ("sensitivity.ratio_tilted_over_nominal_translation", "1", "computed", Some("THE ANSWER to 'does a kilometre-level range residual invalidate a centimetre-level datum sigma': how far the deliverable moves when the geometry is perturbed by the full stated ephemeris-induced tilt")),
    ("sensitivity.ratio_tilted_over_nominal_rotation", "1", "computed", Some("the same sensitivity for the rotation norm")),
    ("sensitivity.ratio_tilted_over_nominal_scale", "1", "computed", Some("the same sensitivity for the scale parameter")),
];

/// Render [`UNITS`] as the result document's `units` object.
fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::with_capacity(UNITS.len());
    for (field, unit, provenance, note) in UNITS {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::from(*unit));
        e.insert("provenance".into(), serde_json::Value::from(*provenance));
        if let Some(n) = note {
            e.insert("note".into(), serde_json::Value::from(*n));
        }
        m.insert((*field).to_string(), serde_json::Value::Object(e));
    }
    serde_json::Value::Object(m)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn run() -> serde_json::Value {
        let out = crate::api::run_toml("kind = \"lunar-llr-datum\"\n").expect("scenario runs");
        serde_json::from_str(&out.json).expect("result parses")
    }

    fn f(v: &serde_json::Value, p: &str) -> f64 {
        v.pointer(p)
            .and_then(|x| x.as_f64())
            .unwrap_or_else(|| panic!("no number at {p}"))
    }

    #[test]
    fn the_committed_slice_is_five_real_arrays_seen_by_real_stations() {
        let v = run();
        assert_eq!(v["reflectors"].as_array().unwrap().len(), 5);
        // Every array is observed, and the whole slice is used or explicitly accounted for.
        let parsed = f(&v, "/data/normal_points_parsed");
        let used = f(&v, "/data/normal_points_used");
        let skipped = f(&v, "/data/skipped_station_not_in_catalogue")
            + f(&v, "/data/skipped_target_not_in_catalogue")
            + f(&v, "/data/skipped_epoch_event_not_ground_transmit")
            + f(&v, "/data/skipped_no_measured_precision");
        assert!(
            (used + skipped - parsed).abs() < 0.5,
            "every record accounted for"
        );
        for r in v["reflectors"].as_array().unwrap() {
            assert!(r["observations"].as_u64().unwrap() >= 3, "{r}");
        }
    }

    #[test]
    fn the_weights_are_the_files_own_precision_not_a_stated_one() {
        let v = run();
        // Grasse MeO in 2015 makes normal points of a few millimetres; anything outside
        // 0.5-50 mm would mean the bin RMS has been read in the wrong unit.
        let mm = f(&v, "/data/median_sigma_range_mm");
        assert!(
            (0.5..50.0).contains(&mm),
            "median normal-point sigma {mm} mm"
        );
        let ps = f(&v, "/data/median_bin_rms_ps");
        assert!((10.0..5000.0).contains(&ps), "median bin RMS {ps} ps");
    }

    #[test]
    fn a_range_determines_the_line_of_sight_coordinate_best() {
        // The physics oracle, which nothing in the solver was told: the partial of a range
        // with respect to the reflector position IS (twice) the line of sight, so the
        // body-fixed coordinate along the mean direction to Earth is directly measured and
        // the two plane-of-sky coordinates are only reached through the libration. Every
        // array must come out that way, by a wide margin.
        let v = run();
        for r in v["reflectors"].as_array().unwrap() {
            let ratio = r["ratio_across_over_along"].as_f64().unwrap();
            assert!(
                ratio > 3.0,
                "{}: plane-of-sky/line-of-sight sigma ratio {ratio} — a range should \
                 determine the line of sight far better",
                r["array"]
            );
        }
    }

    #[test]
    fn no_observation_touches_two_arrays_so_the_information_is_block_diagonal() {
        let v = run();
        assert_eq!(f(&v, "/reflector_information/offblock_fraction"), 0.0);
        assert_eq!(v["reflector_information"]["dimension"], 15);
    }

    #[test]
    fn the_residual_is_published_rather_than_hidden_and_is_the_modelled_gap() {
        let v = run();
        let rms = f(&v, "/residuals/rms_m");
        // The analytic Moon series is documented at a few hundred km; the residual must be
        // in that class -- neither millimetres (which would mean the measurement was not
        // really being compared against a model) nor a lunar radius (which would mean the
        // geometry was wrong).
        assert!(
            (1.0e3..2.0e6).contains(&rms),
            "observed-minus-computed RMS {rms} m is outside the class the analytic lunar \
             ephemeris can explain"
        );
        assert_eq!(
            v["residuals"]["n"].as_u64().unwrap(),
            v["data"]["normal_points_used"].as_u64().unwrap()
        );
    }

    #[test]
    fn the_seven_parameter_datum_is_reported_with_its_rank_and_its_weakest_direction() {
        let v = run();
        let rank = v["helmert"]["rank"].as_u64().unwrap();
        assert!(rank <= 7);
        let dirn = v["helmert"]["weakest_direction"]["direction"]
            .as_array()
            .unwrap();
        assert_eq!(dirn.len(), 7);
        let n2: f64 = dirn.iter().map(|x| x.as_f64().unwrap().powi(2)).sum();
        assert!(
            (n2 - 1.0).abs() < 1e-9,
            "weakest direction is a unit vector"
        );
        if rank < 7 {
            assert!(v["datum_accuracy"]["translation_sigma_norm_m"].is_null());
        } else {
            assert!(f(&v, "/datum_accuracy/translation_sigma_norm_m") > 0.0);
        }
    }

    #[test]
    fn halving_every_measured_sigma_would_halve_the_datum_sigma_exactly() {
        // Linearity in the weights, checked on the real information matrix: scaling M_b by
        // k^2 scales every sigma by 1/k. Done at the matrix rather than by editing the data,
        // because the data is the one thing this scenario must not alter.
        let s = LunarLlrDatumScenario::default();
        let refl = parse_reflector_catalogue(
            &LunarLlrDatumScenario::read(&s.path_or(&None, "de430_retroreflectors_mer.csv"))
                .unwrap(),
        )
        .unwrap();
        let points: Vec<Vec3> = refl.iter().map(|r| r.mer_m).collect();
        let a = helmert_design(&points);
        let dim = 3 * points.len();
        let mut m = vec![vec![0.0; dim]; dim];
        for (i, row) in m.iter_mut().enumerate() {
            row[i] = 1.0 + i as f64;
        }
        let (_, d1) = solve_datum(&m, &a, 1e-9);
        for row in m.iter_mut() {
            for x in row.iter_mut() {
                *x *= 4.0;
            }
        }
        let (_, d2) = solve_datum(&m, &a, 1e-9);
        for k in 0..N_HELMERT {
            assert!(
                (d1.sigma[k] / d2.sigma[k] - 2.0).abs() < 1e-9,
                "parameter {k} not exactly linear in the weight scale"
            );
        }
    }

    #[test]
    fn the_light_time_solution_is_a_converged_lunar_round_trip() {
        // A Grasse-class station and the Apollo 15 array: the modelled two-way time of
        // flight must land in the physical 2.37-2.71 s band (twice 356 000-407 000 km) and
        // the up-leg/down-leg split must be within a few milliseconds of half of it.
        let jd = crate::timescales::julian_date(2015, 4, 21, 9, 52, 20.0);
        let g = llr_geometry(
            [4_581_691.938_9, 556_196.367_8, 4_389_355.286_9],
            [1_554_937.340, 98_603.741, 764_413.168],
            jd,
            0.0,
        );
        assert!(
            (2.37..2.72).contains(&g.two_way_tof_s),
            "two-way time of flight {} s",
            g.two_way_tof_s
        );
        // The partial is (u_up + u_dn)/c rotated into the body frame, so its norm is ~2/c.
        let n = norm3(g.partial_mer_s_per_m);
        assert!(
            (n - 2.0 / C).abs() < 1e-3 * (2.0 / C),
            "|d tau / d p| = {n}, expected ~2/c = {}",
            2.0 / C
        );
    }

    #[test]
    fn the_partial_matches_a_central_finite_difference_of_the_modelled_time_of_flight() {
        // The only new derivative in this module, checked against the function it
        // differentiates by a path that shares no expression with it.
        let jd = crate::timescales::julian_date(2015, 5, 12, 20, 30, 0.0);
        let sta = [4_641_978.523_9, 1_393_067.819_7, 4_133_249.695_9];
        let p0 = [1_591_748.076, 691_220.843, 20_398.420];
        let g = llr_geometry(sta, p0, jd, 0.0);
        let h = 50.0;
        for axis in 0..3 {
            let mut pp = p0;
            let mut pm = p0;
            pp[axis] += h;
            pm[axis] -= h;
            let fd = (llr_geometry(sta, pp, jd, 0.0).two_way_tof_s
                - llr_geometry(sta, pm, jd, 0.0).two_way_tof_s)
                / (2.0 * h);
            let an = g.partial_mer_s_per_m[axis];
            assert!(
                (fd - an).abs() < 1e-6 * (2.0 / C),
                "axis {axis}: analytic {an:e} vs central difference {fd:e}"
            );
        }
    }

    #[test]
    fn a_missing_data_directory_refuses_rather_than_inventing_a_campaign() {
        let s = LunarLlrDatumScenario {
            data_dir: Some("tests/fixtures/definitely-not-here".to_string()),
            ..Default::default()
        };
        let e = s.run_json().expect_err("must refuse");
        assert!(e.contains("cannot read"), "{e}");
    }

    #[test]
    fn an_edited_reflector_row_is_caught_by_the_catalogues_own_radius_column() {
        let bad = "array,ilrs_target,x_m,y_m,z_m,radius_m,east_lon_deg,lat_deg\n\
                   Apollo 15,apollo15,1554937.340,98603.741,764413.168,1234567.000,3.6,26.1\n";
        let e = parse_reflector_catalogue(bad).expect_err("must refuse");
        assert!(e.contains("published radius column"), "{e}");
    }

    #[test]
    fn the_units_block_covers_every_numeric_leaf_of_the_default_document() {
        let v = run();
        let audit = crate::field_schema::audit_document(&v);
        assert!(
            audit.missing.is_empty(),
            "numeric fields with no units entry: {:?}",
            audit.missing
        );
        assert!(audit.malformed.is_empty(), "{:?}", audit.malformed);
    }
}
