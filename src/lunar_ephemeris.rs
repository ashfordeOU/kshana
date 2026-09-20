// SPDX-License-Identifier: AGPL-3.0-only
//! Real, retrieved lunar constellation geometry for the service-volume sweep — an
//! **ephemeris or a published constellation definition** read from a file, in place of
//! the illustrative Keplerian set [`crate::lunar_service::LunarConstellation`] builds.
//!
//! Every service-volume figure the engine publishes — coverage, DOP, the protection-level
//! envelope, and the ranging-accuracy (σ_URE) requirement derived from it — has until now
//! rested on an *illustrative, public-source* LCNS-class Keplerian constellation. This
//! module lets the same, unchanged sweep run against geometry that came from somewhere
//! real, and it keeps the two distinguishable at the level of the emitted provenance
//! class, never by a reader's memory of which run was which.
//!
//! ## What it accepts
//!
//! One plain-text, `#`-commented file — the same convention the repository's agency
//! fixtures already use (`tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv`). The
//! first line names the format and version; subsequent `# key: value` lines carry the
//! provenance the report echoes; then a CSV header and rows. Two formats:
//!
//! * **`states`** — a tabulated Moon-centred state ephemeris: one row per
//!   `(satellite, epoch)` with a Cartesian position. This is what an SPK/BSP kernel
//!   *evaluates to*; the committed fixture is JPL Horizons' evaluation of NASA/JPL's own
//!   reconstructed SPK kernels for spacecraft that were really in lunar orbit. Positions
//!   between table epochs come from Lagrange interpolation
//!   ([`LAGRANGE_ORDER`]); the sweep is refused outright if its horizon runs past the end
//!   of the table, because an extrapolated state is not an ephemeris.
//!   Provenance class **`published-ephemeris`**.
//!
//! * **`elements`** — a published constellation *definition*: one row per satellite of
//!   classical elements. These are propagated by exactly the same Kepler solver
//!   ([`crate::lunar_service::LunarSat::position_mci`]) the illustrative set uses, so the
//!   only thing that differs between the two runs is the constellation design itself.
//!   Provenance class **`published-elements`**.
//!
//! This module deliberately contains **no binary-kernel parser**. The repository's SPICE
//! reader is [ANISE](https://github.com/nyx-space/anise), which is MPL-2.0 and edition
//! 2024 and therefore confined to the workspace-excluded `xval/` crates (it would break
//! both the `cargo deny` licence gate and the MSRV job if it entered this crate's
//! dependency graph — see `xval/anise-frames/Cargo.toml`). Writing a second, hand-rolled
//! DAF/SPK reader here to dodge that would be a new unvalidated numerical path in the
//! middle of a provenance story, so the file this module reads is the *evaluated* kernel,
//! with the evaluator (Horizons) and the query recorded in the file header.
//!
//! ## Frames, said out loud
//!
//! The service-volume sweep works in MCMF (Moon-fixed), and the users come from
//! [`crate::lunar::selenographic_to_mcmf`]. Each source reaches MCMF differently, and the
//! difference is a real fidelity difference, not a formatting one:
//!
//! * `states` with `frame: icrf` — reduced with the **IAU 2015 / WGCCRE** lunar
//!   orientation ([`crate::lunar_frame::icrf_to_iau_moon`]), i.e. the precessing pole and
//!   the analytic physical libration. This is *higher* fidelity than the mean-rotation
//!   Moon the Keplerian path uses.
//! * `states` with `frame: mci` — the mean-rotation reduction
//!   [`crate::lunar::mci_to_mcmf`], identical to the Keplerian path.
//! * `elements` with `elements_frame: icrf` (and the epoch the source states) — propagated
//!   in Moon-centred ICRF and reduced by the same IAU 2015 orientation. No frame
//!   approximation at all.
//! * `elements` with `elements_frame: mci` (the default) — propagated in MCI and reduced
//!   with [`crate::lunar::mci_to_mcmf`], identical to the Keplerian path.
//!
//! A published element set is stated in whatever frame its source used, and its phase as
//! either a mean or a **true** anomaly — both are accepted, so a fixture can carry exactly
//! the numbers its source printed ([`true_to_mean_anomaly_deg`] does the conversion at
//! read time). One committed fixture's source states the **OP** (Earth orbital plane)
//! frame of Ely (2005) / Ely and Lieb (2006), whose `z` axis is the Moon's orbit normal
//! about the Earth — not the lunar spin axis that MCI's `z` is here. Reading those
//! elements as MCI therefore tilts the constellation by the angle between those two axes.
//! [`published_frame_tie_angle_deg`] *computes* that angle from the crate's own lunar
//! ephemeris and IAU pole rather than quoting it, the report emits it, and the honesty
//! note says what it is. It is a bounded, stated approximation — not a correction, and
//! not something quietly absorbed.

use crate::lunar::{mci_to_mcmf, MOON_GM_M3_S2};
use crate::lunar_service::{LunarSat, PositionsMcmf};
use serde::Serialize;
use sha2::{Digest, Sha256};

type Vec3 = [f64; 3];

/// Order of the Lagrange interpolation used between tabulated ephemeris epochs. Nine
/// points (order 8) is the classical choice for interpolating a sampled orbit; the
/// committed fixture's 5-minute sampling makes the scenario's own epochs fall exactly on
/// table nodes, where the interpolant is the node value by construction.
pub const LAGRANGE_ORDER: usize = 8;

/// Seconds in a day, for the table's `t_s` → Julian-date conversion.
const SECONDS_PER_DAY: f64 = 86_400.0;

/// The header magic every accepted file starts with.
const MAGIC: &str = "# kshana-lunar-constellation 1";

// ---------------------------------------------------------------------------
// The parsed file
// ---------------------------------------------------------------------------

/// Which of the two accepted payloads a file carries.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum EphemerisFormat {
    /// A tabulated Moon-centred state ephemeris (the evaluation of a real kernel).
    States,
    /// A published constellation definition in classical elements.
    Elements,
}

impl EphemerisFormat {
    /// The provenance class every figure derived from this payload carries. The two are
    /// deliberately distinct strings: a reader must be able to tell a kernel-derived
    /// figure from an element-derived one from the class alone.
    pub fn provenance_class(self) -> &'static str {
        match self {
            EphemerisFormat::States => "published-ephemeris",
            EphemerisFormat::Elements => "published-elements",
        }
    }

    /// The name used in the file header.
    pub fn as_str(self) -> &'static str {
        match self {
            EphemerisFormat::States => "states",
            EphemerisFormat::Elements => "elements",
        }
    }
}

/// The inertial frame a file's geometry is expressed in — the states of a `states` table,
/// or the elements of an `elements` set (`# elements_frame:`, default [`StateFrame::Mci`]).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum StateFrame {
    /// Moon-centred ICRF (what Horizons returns with `REF_PLANE=FRAME REF_SYSTEM=ICRF`),
    /// reduced to MCMF by the IAU 2015 / WGCCRE lunar orientation.
    Icrf,
    /// Already in the scenario's spin-axis-aligned Moon-centred inertial frame, reduced
    /// to MCMF by the mean-rotation [`crate::lunar::mci_to_mcmf`].
    Mci,
}

impl StateFrame {
    /// The name used in the file header.
    pub fn as_str(self) -> &'static str {
        match self {
            StateFrame::Icrf => "icrf",
            StateFrame::Mci => "mci",
        }
    }
}

/// Classical conversion of a **true** anomaly (deg) to the **mean** anomaly (deg) the
/// engine's Kepler propagator takes, at eccentricity `e`.
///
/// `tan(E/2) = √((1−e)/(1+e))·tan(ν/2)`, then Kepler's equation `M = E − e·sin E`. Exact
/// for `e = 0` (where all three anomalies coincide) and pinned in both directions by test.
/// Published element sets state one or the other; this lets a fixture carry whichever its
/// source actually printed instead of a converted number nobody can check against the page.
pub fn true_to_mean_anomaly_deg(true_anom_deg: f64, e: f64) -> f64 {
    let nu = true_anom_deg.to_radians();
    let ea = 2.0 * (((1.0 - e) / (1.0 + e)).sqrt() * (nu * 0.5).tan()).atan();
    (ea - e * ea.sin()).to_degrees()
}

/// One satellite's tabulated track: strictly increasing epochs (seconds past the file
/// epoch) and the Moon-centred position (metres) at each.
#[derive(Clone, Debug)]
struct Track {
    t_s: Vec<f64>,
    r_m: Vec<Vec3>,
}

impl Track {
    /// Lagrange-interpolate the position at `t` from the `LAGRANGE_ORDER + 1` table nodes
    /// centred on it. `t` is assumed inside `[first, last]`; the caller
    /// ([`LunarEphemeris::load`]) refuses a scenario horizon that leaves the table.
    fn at(&self, t: f64) -> Vec3 {
        let n = self.t_s.len();
        if n == 1 {
            return self.r_m[0];
        }
        let want = (LAGRANGE_ORDER + 1).min(n);
        // Index of the first node at or after t, then centre a window of `want` on it.
        let hi = self.t_s.partition_point(|&x| x < t);
        let start = hi.saturating_sub(want / 2 + 1).min(n.saturating_sub(want));
        let end = start + want;
        let mut out = [0.0f64; 3];
        for i in start..end {
            let mut w = 1.0f64;
            for j in start..end {
                if i != j {
                    w *= (t - self.t_s[j]) / (self.t_s[i] - self.t_s[j]);
                }
            }
            for (o, c) in out.iter_mut().zip(self.r_m[i]) {
                *o += w * c;
            }
        }
        out
    }
}

/// A constellation geometry read from a file: either a tabulated real ephemeris or a
/// published element set, plus the provenance the report echoes.
///
/// Implements [`PositionsMcmf`], so the *identical* service-volume sweep runs against it,
/// the illustrative Keplerian set and the perturbed twin.
#[derive(Clone, Debug)]
pub struct LunarEphemeris {
    format: EphemerisFormat,
    frame: StateFrame,
    epoch_jd_tdb: f64,
    sats: Vec<LunarSat>,
    tracks: Vec<Track>,
    meta: Vec<(String, String)>,
    sha256: String,
    path: String,
}

/// Pull a `# key: value` header field, or `""` when the file does not record one.
fn meta_of(meta: &[(String, String)], key: &str) -> String {
    meta.iter()
        .find(|(k, _)| k == key)
        .map(|(_, v)| v.clone())
        .unwrap_or_default()
}

impl LunarEphemeris {
    /// Read and parse the file at `path`, hashing its exact bytes so the report can tie
    /// every derived figure to them.
    pub fn load(path: &str) -> Result<Self, String> {
        let text = std::fs::read_to_string(path)
            .map_err(|e| format!("cannot read lunar ephemeris {path}: {e}"))?;
        let mut e = Self::parse(&text)?;
        e.path = path.to_string();
        Ok(e)
    }

    /// Parse an already-loaded file body. Separated from [`Self::load`] so the parser is
    /// testable without touching the filesystem.
    pub fn parse(text: &str) -> Result<Self, String> {
        let sha256 = hex::encode(Sha256::digest(text.as_bytes()));
        let mut meta: Vec<(String, String)> = Vec::new();
        let mut rows: Vec<&str> = Vec::new();
        let mut columns: Vec<String> = Vec::new();
        let mut saw_magic = false;
        for (lineno, raw) in text.lines().enumerate() {
            let line = raw.trim_end();
            if line.trim().is_empty() {
                continue;
            }
            if lineno == 0 {
                if line.trim() != MAGIC {
                    return Err(format!(
                        "lunar ephemeris: first line must be `{MAGIC}`, found `{}`",
                        line.trim()
                    ));
                }
                saw_magic = true;
                continue;
            }
            if let Some(rest) = line.strip_prefix('#') {
                if let Some((k, v)) = rest.split_once(':') {
                    let (k, v) = (k.trim(), v.trim());
                    // Only the first occurrence of a key counts, so a later prose comment
                    // containing a colon can never shadow a real header field.
                    if !k.is_empty() && !k.contains(' ') && !meta.iter().any(|(e, _)| e == k) {
                        meta.push((k.to_string(), v.to_string()));
                    }
                }
                continue;
            }
            if columns.is_empty() {
                columns = line.split(',').map(|s| s.trim().to_string()).collect();
            } else {
                rows.push(line);
            }
        }
        if !saw_magic {
            return Err("lunar ephemeris: file is empty".to_string());
        }
        let format = match meta_of(&meta, "format").as_str() {
            "states" => EphemerisFormat::States,
            "elements" => EphemerisFormat::Elements,
            other => {
                return Err(format!(
                    "lunar ephemeris: `# format:` must be `states` or `elements`, found `{other}`"
                ))
            }
        };
        if rows.is_empty() {
            return Err("lunar ephemeris: no data rows".to_string());
        }

        let mut out = LunarEphemeris {
            format,
            frame: StateFrame::Mci,
            epoch_jd_tdb: 0.0,
            sats: Vec::new(),
            tracks: Vec::new(),
            meta,
            sha256,
            path: "<in-memory>".to_string(),
        };
        match format {
            EphemerisFormat::Elements => out.parse_elements(&columns, &rows)?,
            EphemerisFormat::States => out.parse_states(&columns, &rows)?,
        }
        Ok(out)
    }

    fn column(columns: &[String], name: &str) -> Result<usize, String> {
        columns
            .iter()
            .position(|c| c == name)
            .ok_or_else(|| format!("lunar ephemeris: missing column `{name}`"))
    }

    fn parse_elements(&mut self, columns: &[String], rows: &[&str]) -> Result<(), String> {
        // An element set is stated in whatever frame its source used, and the two the
        // published sources here use need different reductions. Absent (the default) is
        // `mci`, so the first committed element fixture keeps its behaviour exactly.
        self.frame = match meta_of(&self.meta, "elements_frame").as_str() {
            "" | "mci" => StateFrame::Mci,
            "icrf" => StateFrame::Icrf,
            other => {
                return Err(format!(
                    "lunar ephemeris: `# elements_frame:` must be `icrf` or `mci`, found `{other}`"
                ))
            }
        };
        if self.frame == StateFrame::Icrf {
            self.epoch_jd_tdb =
                meta_of(&self.meta, "epoch_jd_tdb")
                    .parse::<f64>()
                    .map_err(|e| {
                        format!(
                            "lunar ephemeris: `elements_frame: icrf` needs `# epoch_jd_tdb:` (the \
                         epoch the elements are referred to, which is also where the \
                         ICRF-to-Moon-fixed rotation is evaluated): {e}"
                        )
                    })?;
        }
        let base = ["sat", "sma_km", "ecc", "inc_deg", "raan_deg", "argp_deg"];
        let idx: Vec<usize> = base
            .iter()
            .map(|c| Self::column(columns, c))
            .collect::<Result<_, _>>()?;
        // Sources state the phase as either a mean or a true anomaly. Take whichever the
        // file records, verbatim, and convert here — so a fixture never has to carry a
        // number its source did not print.
        let (anom_idx, anom_is_true) = match (
            Self::column(columns, "mean_anom_deg"),
            Self::column(columns, "true_anom_deg"),
        ) {
            (Ok(_), Ok(_)) => {
                return Err(
                    "lunar ephemeris: give exactly one of `mean_anom_deg` or `true_anom_deg`"
                        .to_string(),
                )
            }
            (Ok(i), Err(_)) => (i, false),
            (Err(_), Ok(i)) => (i, true),
            (Err(e), Err(_)) => return Err(e),
        };
        let mut sats = Vec::new();
        for (n, row) in rows.iter().enumerate() {
            let f: Vec<&str> = row.split(',').map(str::trim).collect();
            let at = |i: usize| -> Result<f64, String> {
                f.get(i)
                    .ok_or_else(|| format!("lunar ephemeris: short element row {}", n + 1))?
                    .parse::<f64>()
                    .map_err(|e| format!("lunar ephemeris: element row {}: {e}", n + 1))
            };
            let get = |k: usize| at(idx[k]);
            let sma_km = get(1)?;
            let ecc = get(2)?;
            if !(sma_km.is_finite() && sma_km > 0.0) {
                return Err(format!(
                    "lunar ephemeris: element row {} has a non-positive semi-major axis",
                    n + 1
                ));
            }
            if !(0.0..1.0).contains(&ecc) {
                return Err(format!(
                    "lunar ephemeris: element row {} has eccentricity {ecc}, outside [0, 1)",
                    n + 1
                ));
            }
            let anom = at(anom_idx)?;
            sats.push(LunarSat {
                sma_m: sma_km * 1000.0,
                eccentricity: ecc,
                inc_deg: get(3)?,
                raan_deg: get(4)?,
                argp_deg: get(5)?,
                mean_anom_deg: if anom_is_true {
                    true_to_mean_anomaly_deg(anom, ecc)
                } else {
                    anom
                },
            });
        }
        self.sats = sats;
        Ok(())
    }

    fn parse_states(&mut self, columns: &[String], rows: &[&str]) -> Result<(), String> {
        self.frame = match meta_of(&self.meta, "frame").as_str() {
            "icrf" => StateFrame::Icrf,
            "mci" => StateFrame::Mci,
            other => {
                return Err(format!(
                    "lunar ephemeris: a `states` file needs `# frame: icrf` or `# frame: mci`, found `{other}`"
                ))
            }
        };
        if self.frame == StateFrame::Icrf {
            self.epoch_jd_tdb =
                meta_of(&self.meta, "epoch_jd_tdb")
                    .parse::<f64>()
                    .map_err(|e| {
                        format!(
                            "lunar ephemeris: an `icrf` states file needs `# epoch_jd_tdb:`: {e}"
                        )
                    })?;
        }
        let want = ["sat", "t_s", "x_km", "y_km", "z_km"];
        let idx: Vec<usize> = want
            .iter()
            .map(|c| Self::column(columns, c))
            .collect::<Result<_, _>>()?;
        let mut tracks: Vec<Track> = Vec::new();
        for (n, row) in rows.iter().enumerate() {
            let f: Vec<&str> = row.split(',').map(str::trim).collect();
            let get = |k: usize| -> Result<f64, String> {
                f.get(idx[k])
                    .ok_or_else(|| format!("lunar ephemeris: short state row {}", n + 1))?
                    .parse::<f64>()
                    .map_err(|e| format!("lunar ephemeris: state row {}: {e}", n + 1))
            };
            let sat = get(0)? as usize;
            let t = get(1)?;
            let r = [get(2)? * 1000.0, get(3)? * 1000.0, get(4)? * 1000.0];
            if !(t.is_finite() && r.iter().all(|c| c.is_finite())) {
                return Err(format!(
                    "lunar ephemeris: state row {} is not finite",
                    n + 1
                ));
            }
            while tracks.len() <= sat {
                tracks.push(Track {
                    t_s: Vec::new(),
                    r_m: Vec::new(),
                });
            }
            let tr = &mut tracks[sat];
            if let Some(&last) = tr.t_s.last() {
                if t <= last {
                    return Err(format!(
                        "lunar ephemeris: state row {} for satellite {sat} goes back in time \
                         ({t} after {last}); epochs must be strictly increasing per satellite",
                        n + 1
                    ));
                }
            }
            tr.t_s.push(t);
            tr.r_m.push(r);
        }
        if tracks.iter().any(|t| t.t_s.is_empty()) {
            return Err(
                "lunar ephemeris: satellite indices must be contiguous from 0 with no gaps"
                    .to_string(),
            );
        }
        self.tracks = tracks;
        Ok(())
    }

    /// Which payload this file carries.
    pub fn format(&self) -> EphemerisFormat {
        self.format
    }

    /// Number of satellites in the file.
    pub fn n_sats(&self) -> usize {
        match self.format {
            EphemerisFormat::Elements => self.sats.len(),
            EphemerisFormat::States => self.tracks.len(),
        }
    }

    /// Number of tabulated epochs per satellite (`states` only; `None` for `elements`,
    /// which are closed-form and cover every epoch).
    pub fn n_epochs(&self) -> Option<usize> {
        match self.format {
            EphemerisFormat::Elements => None,
            EphemerisFormat::States => self.tracks.first().map(|t| t.t_s.len()),
        }
    }

    /// The last epoch the table covers, in seconds past the file epoch. `None` for an
    /// `elements` file, which is unbounded.
    pub fn covered_until_s(&self) -> Option<f64> {
        match self.format {
            EphemerisFormat::Elements => None,
            EphemerisFormat::States => self
                .tracks
                .iter()
                .filter_map(|t| t.t_s.last().copied())
                .fold(None, |acc: Option<f64>, v| {
                    Some(acc.map_or(v, |a: f64| a.min(v)))
                }),
        }
    }

    /// SHA-256 of the exact file bytes every figure in this run was derived from.
    pub fn sha256(&self) -> &str {
        &self.sha256
    }

    /// The path the file was read from (`<in-memory>` for [`Self::parse`]).
    pub fn path(&self) -> &str {
        &self.path
    }

    /// A `# key: value` header field, or `""` when the file does not record one.
    pub fn meta(&self, key: &str) -> String {
        meta_of(&self.meta, key)
    }

    /// The provenance class every figure derived from this file carries.
    pub fn provenance_class(&self) -> &'static str {
        self.format.provenance_class()
    }

    /// The inertial frame this file's geometry is expressed in — the states of a `states`
    /// table, or the elements of an `elements` set.
    pub fn state_frame(&self) -> StateFrame {
        self.frame
    }

    /// The published elements, when this is an `elements` file.
    pub fn elements(&self) -> &[LunarSat] {
        &self.sats
    }
}

impl PositionsMcmf for LunarEphemeris {
    fn positions_mcmf(&self, t_s: f64) -> Vec<Vec3> {
        // Inertial position first (propagated or interpolated), then ONE frame reduction
        // chosen by the file's declared frame — so the two payload kinds cannot drift
        // apart on how they reach the Moon-fixed frame the sweep works in.
        let inertial: Vec<Vec3> = match self.format {
            EphemerisFormat::Elements => self.sats.iter().map(|s| s.position_mci(t_s)).collect(),
            EphemerisFormat::States => self.tracks.iter().map(|tr| tr.at(t_s)).collect(),
        };
        match self.frame {
            StateFrame::Mci => inertial.into_iter().map(|r| mci_to_mcmf(r, t_s)).collect(),
            StateFrame::Icrf => {
                // The full IAU 2015 / WGCCRE orientation at this epoch: precessing pole
                // and analytic physical libration, not the mean-rotation Moon.
                let jd = self.epoch_jd_tdb + t_s / SECONDS_PER_DAY;
                let m = crate::lunar_frame::icrf_to_iau_moon(jd);
                inertial
                    .into_iter()
                    .map(|r| crate::precession::mat_vec(&m, r))
                    .collect()
            }
        }
    }
}

// ---------------------------------------------------------------------------
// The frame tie the published elements are read through
// ---------------------------------------------------------------------------

/// The angle (degrees) between the Moon's orbit normal about the Earth — the `z` axis of
/// the **OP** (Earth orbital plane) frame published element sets such as Ely (2005) /
/// Ely and Lieb (2006) are stated in — and the Moon's spin axis, which is what `z` means
/// in the Moon-centred inertial frame this engine propagates elements in.
///
/// It is the size of the tilt introduced by reading an OP-frame inclination and node as
/// if they were MCI, and it is **computed**, at `jd_tdb`, rather than quoted: the orbit
/// normal is `r × v` of the crate's own lunar ephemeris ([`crate::ephem::moon_position`],
/// differenced over `±1` hour), and the spin axis is the IAU 2015 / WGCCRE lunar pole
/// ([`crate::lunar_frame::lunar_pole_ra_dec`]). Both inputs are already in the crate; no
/// number here is transcribed.
pub fn published_frame_tie_angle_deg(jd_tdb: f64) -> f64 {
    // Julian centuries past J2000 for the crate's low-precision lunar ephemeris.
    let jc = |jd: f64| (jd - 2_451_545.0) / 36_525.0;
    let h = 1.0 / 24.0; // one hour, in days
    let rm = crate::ephem::moon_position(jc(jd_tdb));
    let rp = crate::ephem::moon_position(jc(jd_tdb + h));
    let rn = crate::ephem::moon_position(jc(jd_tdb - h));
    let v = [
        (rp[0] - rn[0]) / (2.0 * h),
        (rp[1] - rn[1]) / (2.0 * h),
        (rp[2] - rn[2]) / (2.0 * h),
    ];
    let n = [
        rm[1] * v[2] - rm[2] * v[1],
        rm[2] * v[0] - rm[0] * v[2],
        rm[0] * v[1] - rm[1] * v[0],
    ];
    let (ra, dec) = crate::lunar_frame::lunar_pole_ra_dec(jd_tdb);
    let pole = [dec.cos() * ra.cos(), dec.cos() * ra.sin(), dec.sin()];
    let nn = (n[0] * n[0] + n[1] * n[1] + n[2] * n[2]).sqrt();
    if nn == 0.0 {
        return 0.0;
    }
    let c = ((n[0] * pole[0] + n[1] * pole[1] + n[2] * pole[2]) / nn).clamp(-1.0, 1.0);
    c.acos().to_degrees()
}

// ---------------------------------------------------------------------------
// The provenance block the report emits
// ---------------------------------------------------------------------------

/// Everything the report says about where an `ephemeris_path` run's geometry came from:
/// the bytes, their hash, the upstream document, and the frame the numbers were published
/// in versus the frame they were read in.
#[derive(Clone, Debug, Serialize)]
pub struct EphemerisSourceBlock {
    /// Path the file was read from.
    pub path: String,
    /// SHA-256 of the exact file bytes this run's geometry came from.
    pub sha256: String,
    /// `states` or `elements`.
    pub format: String,
    /// The provenance class every figure derived from this file carries:
    /// `published-ephemeris` for a tabulated (kernel-evaluated) state table,
    /// `published-elements` for a published constellation definition.
    pub provenance_class: String,
    /// Frame the states are tabulated in and reduced from (`icrf` or `mci`). For an
    /// `elements` file this is the frame the elements are *interpreted* in, `mci`.
    pub frame: String,
    /// Satellites in the file.
    pub n_sats: usize,
    /// Tabulated epochs per satellite; absent for a closed-form `elements` file.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub n_epochs: Option<usize>,
    /// Last epoch the table covers, seconds past the file epoch; absent for `elements`.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub covered_until_s: Option<f64>,
    /// The file's own `# name:` line.
    pub name: String,
    /// The file's own `# source:` line — the upstream document or service.
    pub source: String,
    /// The file's own `# url:` line.
    pub url: String,
    /// The file's own `# retrieved:` line.
    pub retrieved: String,
    /// The file's own `# source_sha256:` line — the hash of the *upstream document*, when
    /// it records one. Empty for a service query with no fixed artifact.
    pub source_sha256: String,
    /// The frame the source itself states the numbers are in, verbatim from the file's
    /// `# published_frame:` line. Empty when the file does not record one.
    pub published_frame: String,
    /// Any caveat the **source** attaches to its own numbers, verbatim from the file's
    /// `# source_caveat:` line — a published reference constellation is often stated to
    /// be notional, and that statement travels with every figure derived from it. Empty
    /// when the source attaches none.
    pub source_caveat: String,
    /// Angle (deg) between the OP-frame `z` axis published element sets use (the Moon's
    /// orbit normal) and the lunar spin axis MCI `z` means here — the size of the tilt
    /// introduced by reading published OP-frame elements as MCI. Present only for an
    /// `elements` file whose `# published_frame:` names the OP frame; computed by
    /// [`published_frame_tie_angle_deg`], never quoted.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub published_frame_tie_angle_deg: Option<f64>,
    /// Honest scope note for this source.
    pub note: String,
}

/// Build the report's provenance block for a loaded file.
pub fn source_block(e: &LunarEphemeris) -> EphemerisSourceBlock {
    let published_frame = e.meta("published_frame");
    let tie = (e.format() == EphemerisFormat::Elements
        && published_frame.to_ascii_uppercase().starts_with("OP"))
    .then(|| {
        // J2000.0 — the epoch the published element set is referred to when, as here, the
        // source states no epoch of its own. The tie angle varies by only a fraction of a
        // degree over a decade, so the choice of epoch is not what makes it large.
        published_frame_tie_angle_deg(2_451_545.0)
    });
    let note = match e.format() {
        EphemerisFormat::States => format!(
            "Tabulated Moon-centred state ephemeris ({} frame), Lagrange-interpolated at \
             order {LAGRANGE_ORDER} between table epochs and reduced to MCMF by {}. The \
             states are NOT propagated by this engine. Provenance class \
             `published-ephemeris`: distinct from every element-derived figure.",
            e.state_frame().as_str(),
            match e.state_frame() {
                StateFrame::Icrf =>
                    "the IAU 2015 / WGCCRE lunar orientation (precessing pole, analytic libration)",
                StateFrame::Mci => "the mean-rotation lunar spin model",
            }
        ),
        EphemerisFormat::Elements if e.state_frame() == StateFrame::Icrf => format!(
            "Published constellation DEFINITION stated in Moon-centred ICRF (`{}`), \
             propagated by this engine's own Kepler solver in that same inertial frame and \
             reduced to MCMF by the IAU 2015 / WGCCRE lunar orientation (precessing pole, \
             analytic physical libration) at each epoch. NO frame approximation: the source \
             names the frame and the epoch, and both are used. Provenance class \
             `published-elements`: distinct from every kernel-derived figure.",
            if published_frame.is_empty() {
                "ICRF"
            } else {
                published_frame.as_str()
            }
        ),
        EphemerisFormat::Elements => format!(
            "Published constellation DEFINITION, propagated by this engine's own Kepler \
             solver and reduced by the mean-rotation lunar spin model — exactly the path \
             the illustrative constellation takes, so the only difference between the two \
             runs is the constellation design. The source states the elements in the `{}` \
             frame; they are read here as MCI, which tilts the constellation by \
             `published_frame_tie_angle_deg`. Provenance class `published-elements`: \
             distinct from every kernel-derived figure.",
            if published_frame.is_empty() {
                "(unstated)"
            } else {
                published_frame.as_str()
            }
        ),
    };
    EphemerisSourceBlock {
        path: e.path().to_string(),
        sha256: e.sha256().to_string(),
        format: e.format().as_str().to_string(),
        provenance_class: e.provenance_class().to_string(),
        frame: e.state_frame().as_str().to_string(),
        n_sats: e.n_sats(),
        n_epochs: e.n_epochs(),
        covered_until_s: e.covered_until_s(),
        name: e.meta("name"),
        source: e.meta("source"),
        url: e.meta("url"),
        retrieved: e.meta("retrieved"),
        source_sha256: e.meta("source_sha256"),
        published_frame,
        source_caveat: e.meta("source_caveat"),
        published_frame_tie_angle_deg: tie,
        note,
    }
}

/// Moon gravitational parameter (m³/s²) the element path propagates at — re-exported so a
/// caller reading a published element set can check the paper's assumed GM against the
/// one the propagation actually uses.
pub const PROPAGATION_MOON_GM_M3_S2: f64 = MOON_GM_M3_S2;

#[cfg(test)]
mod tests {
    use super::*;

    const ELEMENTS: &str = "\
# kshana-lunar-constellation 1
# format: elements
# name: two-satellite test set
# published_frame: OP (Earth orbital plane frame)
sat,sma_km,ecc,inc_deg,raan_deg,argp_deg,mean_anom_deg
0,6143,0.6,51.7,0,90,0
1,6143,0.6,51.7,180,90,90
";

    const STATES: &str = "\
# kshana-lunar-constellation 1
# format: states
# frame: mci
# epoch_jd_tdb: 2459945.5
sat,t_s,x_km,y_km,z_km
0,0,1000,0,0
0,600,1000,600,0
0,1200,1000,1200,0
1,0,0,2000,0
1,600,0,2000,600
1,1200,0,2000,1200
";

    /// The same two satellites as `ELEMENTS`, but declared in ICRF at an epoch — the
    /// second published-element frame convention.
    const ELEMENTS_ICRF: &str = "\
# kshana-lunar-constellation 1
# format: elements
# elements_frame: icrf
# epoch_jd_tdb: 2461406.5
# published_frame: ICRF, as stated by the source
sat,sma_km,ecc,inc_deg,raan_deg,argp_deg,true_anom_deg
0,6143,0.6,51.7,0,90,0
1,6143,0.6,51.7,180,90,90
";

    #[test]
    fn elements_parse_into_the_same_kepler_satellites_the_scenario_uses() {
        let e = LunarEphemeris::parse(ELEMENTS).expect("parses");
        assert_eq!(e.format(), EphemerisFormat::Elements);
        assert_eq!(e.n_sats(), 2);
        assert_eq!(e.provenance_class(), "published-elements");
        assert_eq!(e.elements()[1].raan_deg, 180.0);
        assert_eq!(e.elements()[0].sma_m, 6_143_000.0);
        // The geometry is literally the LunarSat path, not a reimplementation.
        let want: Vec<_> = e
            .elements()
            .iter()
            .map(|s| mci_to_mcmf(s.position_mci(1234.0), 1234.0))
            .collect();
        assert_eq!(e.positions_mcmf(1234.0), want);
    }

    #[test]
    fn states_parse_and_interpolate_exactly_at_table_nodes() {
        let e = LunarEphemeris::parse(STATES).expect("parses");
        assert_eq!(e.format(), EphemerisFormat::States);
        assert_eq!(e.provenance_class(), "published-ephemeris");
        assert_eq!(e.n_sats(), 2);
        assert_eq!(e.n_epochs(), Some(3));
        assert_eq!(e.covered_until_s(), Some(1200.0));
        // At a node the interpolant must return the node, exactly (up to rounding).
        let at600 = e.positions_mcmf(600.0);
        let want0 = mci_to_mcmf([1_000_000.0, 600_000.0, 0.0], 600.0);
        for k in 0..3 {
            assert!(
                (at600[0][k] - want0[k]).abs() < 1e-6,
                "node value not reproduced: {:?} vs {want0:?}",
                at600[0]
            );
        }
    }

    /// A linear track must interpolate exactly at a non-node epoch too: Lagrange of any
    /// order reproduces a polynomial of lower degree, so this catches a windowing or
    /// weight bug that node-only checks would miss.
    #[test]
    fn states_interpolate_a_linear_track_exactly_off_node() {
        let e = LunarEphemeris::parse(STATES).expect("parses");
        let got = e.positions_mcmf(300.0);
        let want = mci_to_mcmf([1_000_000.0, 300_000.0, 0.0], 300.0);
        for k in 0..3 {
            assert!(
                (got[0][k] - want[k]).abs() < 1e-6,
                "off-node interpolation wrong: {:?} vs {want:?}",
                got[0]
            );
        }
    }

    #[test]
    fn a_hash_is_taken_over_the_exact_bytes() {
        let a = LunarEphemeris::parse(ELEMENTS).unwrap();
        let b = LunarEphemeris::parse(&format!("{ELEMENTS}# trailing comment\n")).unwrap();
        assert_ne!(a.sha256(), b.sha256(), "the hash must follow the bytes");
        assert_eq!(a.sha256().len(), 64);
    }

    #[test]
    fn bad_files_are_refused_rather_than_guessed_at() {
        for (src, why) in [
            ("nonsense\n", "first line"),
            (
                "# kshana-lunar-constellation 1\n# format: nope\nsat\n0\n",
                "format",
            ),
            (
                "# kshana-lunar-constellation 1\n# format: states\n# frame: galactic\nsat,t_s,x_km,y_km,z_km\n0,0,1,1,1\n",
                "frame",
            ),
            (
                "# kshana-lunar-constellation 1\n# format: elements\nsat,sma_km,ecc,inc_deg,raan_deg,argp_deg\n0,1,2,3,4,5\n",
                "missing column",
            ),
            (
                "# kshana-lunar-constellation 1\n# format: elements\nsat,sma_km,ecc,inc_deg,raan_deg,argp_deg,mean_anom_deg\n0,6143,1.4,51,0,90,0\n",
                "eccentricity",
            ),
            (
                "# kshana-lunar-constellation 1\n# format: states\n# frame: mci\nsat,t_s,x_km,y_km,z_km\n0,100,1,1,1\n0,50,1,1,1\n",
                "back in time",
            ),
            (
                "# kshana-lunar-constellation 1\n# format: elements\n# elements_frame: icrf\nsat,sma_km,ecc,inc_deg,raan_deg,argp_deg,mean_anom_deg\n0,6143,0.6,51,0,90,0\n",
                "epoch_jd_tdb",
            ),
            (
                "# kshana-lunar-constellation 1\n# format: elements\nsat,sma_km,ecc,inc_deg,raan_deg,argp_deg,mean_anom_deg,true_anom_deg\n0,6143,0.6,51,0,90,0,0\n",
                "exactly one",
            ),
        ] {
            let e = LunarEphemeris::parse(src).expect_err("must be refused");
            assert!(e.contains(why), "error {e:?} does not mention {why:?}");
        }
    }

    /// A published element set stated in ICRF at an epoch is propagated in ICRF and
    /// reduced by the IAU 2015 orientation — a materially different, and more rigorous,
    /// reduction than the mean-rotation one. If the two agreed, one of them would not be
    /// doing what it says.
    #[test]
    fn icrf_elements_take_the_iau_reduction_not_the_mean_rotation_one() {
        let icrf = LunarEphemeris::parse(ELEMENTS_ICRF).expect("parses");
        assert_eq!(icrf.state_frame(), StateFrame::Icrf);
        assert_eq!(icrf.n_sats(), 2);
        let mci = LunarEphemeris::parse(ELEMENTS).expect("parses");
        // Same elements (sat 0 has true = mean = 0), so any difference is the frame.
        assert_eq!(icrf.elements()[0].sma_m, mci.elements()[0].sma_m);
        assert_eq!(icrf.elements()[0].mean_anom_deg, 0.0);
        let a = icrf.positions_mcmf(3600.0)[0];
        let b = mci.positions_mcmf(3600.0)[0];
        let sep = ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt();
        assert!(
            sep > 1.0e6,
            "the ICRF reduction is indistinguishable from the mean-rotation one ({sep} m apart)"
        );
        // And the ICRF path really used the IAU rotation at the file epoch.
        let jd = 2_461_406.5 + 3600.0 / SECONDS_PER_DAY;
        let want = crate::precession::mat_vec(
            &crate::lunar_frame::icrf_to_iau_moon(jd),
            icrf.elements()[0].position_mci(3600.0),
        );
        assert_eq!(a, want);
    }

    /// The true-to-mean anomaly conversion is exact at the three points where the anomalies
    /// coincide, and inverts Kepler's equation everywhere else — checked by solving Kepler
    /// forward, which is a different expression from the closed form under test.
    #[test]
    fn true_to_mean_anomaly_inverts_keplers_equation() {
        for e in [0.0, 0.1, 0.6, 0.721] {
            for nu in [0.0, 180.0, -180.0] {
                assert!(
                    (true_to_mean_anomaly_deg(nu, e) - nu).abs() < 1e-9,
                    "at nu={nu} the anomalies must coincide for any eccentricity"
                );
            }
            for nu in [-147.49, -119.79, -5.0, 37.0, 90.0, 151.3] {
                let m = true_to_mean_anomaly_deg(nu, e).to_radians();
                // Solve M = E - e sin E forward, then E back to the true anomaly.
                let mut ea = m;
                for _ in 0..80 {
                    ea -= (ea - e * ea.sin() - m) / (1.0 - e * ea.cos());
                }
                let back = 2.0
                    * ((1.0 + e).sqrt() * (ea * 0.5).sin())
                        .atan2((1.0 - e).sqrt() * (ea * 0.5).cos());
                assert!(
                    (back.to_degrees() - nu).abs() < 1e-8,
                    "e={e}, nu={nu}: round-trip gave {}",
                    back.to_degrees()
                );
            }
        }
    }

    /// The OP-frame tie is a real, computed angle of a few degrees — not zero (which would
    /// mean the two axes had been silently conflated) and not a large number (which would
    /// mean the computation was wrong). Both bounds follow from lunar geometry: the Moon's
    /// orbit is inclined ~5 deg to the ecliptic and its equator ~1.5 deg the other way.
    #[test]
    fn the_published_frame_tie_is_computed_and_small_but_not_zero() {
        let a = published_frame_tie_angle_deg(2_451_545.0);
        assert!(
            (1.0..15.0).contains(&a),
            "OP-frame tie angle {a} deg is outside the physically possible band"
        );
        // It moves with epoch (the node regresses), so it is genuinely being computed.
        let b = published_frame_tie_angle_deg(2_451_545.0 + 3000.0);
        assert!((a - b).abs() > 1e-6, "the tie angle is not epoch-dependent");
    }
}
