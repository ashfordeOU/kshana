// SPDX-License-Identifier: AGPL-3.0-only
//! Terrain-referenced navigation (TERCOM/SITAN) against an SRTM digital-elevation
//! model, and the combined gravity + magnetic + terrain GPS-denied navigator.
//!
//! Terrain-referenced navigation (TRN) is the oldest deployed map-aided alt-PNT
//! technique: a radar/baro altimeter measures the ground clearance under a vehicle, the
//! ground elevation it implies is matched against a stored digital elevation model (DEM),
//! and the constant inertial-drift offset that best aligns the measured relief profile
//! with the map is recovered — TERCOM (terrain contour matching) and SITAN (Sandia inertial
//! terrain-aided navigation) are the classic forms. This module composes the same pieces
//! the gravity-map matcher in [`crate::gravimeter`] uses:
//!
//! 1. [`DemGrid`] — a regular geographic elevation grid with bilinear sampling, the
//!    terrain analogue of [`crate::ionex::TecGrid`] (same `(i0, frac)` cell helper);
//! 2. [`crate::igrf::magnetic_field`] + synthetic crustal mascons — the magnetic channel;
//! 3. [`crate::gravimeter::GravityAnomalyModel`] — the gravity channel;
//! 4. [`crate::mapmatch`] + [`crate::particle_filter`] — the shared coarse-to-fine
//!    [`crate::mapmatch::hierarchical_offset_search`] both the gravity and combined paths run.
//!
//! ## Scope (honest)
//!
//! The `.hgt` parser is a correct, hand-rolled SRTM reader (16-bit signed **big-endian**,
//! row-major, north row first, void = -32768) validated against the GDAL SRTMHGT driver
//! spec; the bilinear sample is the closed-form interpolation validated by an exact midpoint
//! oracle; the matcher's recovery is validated against an **independently injected** drift
//! (the ground truth, never the DEM's own value — non-circular by construction). What Kshana
//! does **not** bundle is a 25 MB real SRTM tile (a tiny committed fixture exercises the
//! parser, and `#[ignore]`-gated tests fetch a real tile via `tools/fetch_srtm_tile.py` and
//! check it against published geodetic spot-heights). The magnetic channel uses the smooth
//! IGRF main field plus **synthetic crustal-anomaly mascons** — the real high-frequency
//! crustal magnetic-anomaly map is a follow-on (see `docs/CAPABILITY.md`). Datum note: SRTM
//! elevations are geoid-referenced (EGM96); TRN matches *relief*, not absolute height, so the
//! vertical datum is irrelevant to the match.

use crate::gravimeter::{GravityAnomalyModel, Mascon, M_PER_DEG};
use crate::igrf::magnetic_field;
use crate::ionex::cell;
use crate::mapmatch::{field_likelihood, hierarchical_offset_search};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

/// The SRTM void / no-data sentinel: cells with no measured elevation are coded -32768.
pub const SRTM_VOID: f64 = -32768.0;

// ---------------------------------------------------------------------------
// Digital elevation model grid
// ---------------------------------------------------------------------------

/// A regular geographic DEM grid: signed elevation in metres above the model's vertical
/// datum (SRTM/ETOPO use EGM96 geoid heights; for terrain matching we treat them as a scalar
/// field). Row-major in latitude then longitude, mirroring [`crate::ionex::TecGrid`].
#[derive(Clone, Debug)]
pub struct DemGrid {
    /// Latitude of row 0 (deg).
    pub lat0_deg: f64,
    /// Longitude of column 0 (deg).
    pub lon0_deg: f64,
    /// Positive latitude step between rows (deg).
    pub dlat_deg: f64,
    /// Positive longitude step between columns (deg).
    pub dlon_deg: f64,
    /// Number of latitude rows.
    pub n_lat: usize,
    /// Number of longitude columns.
    pub n_lon: usize,
    /// Elevation (m), `elev[i*n_lon + j]` at `(lat0 + i·dlat, lon0 + j·dlon)`.
    pub elev_m: Vec<f64>,
    /// Sentinel value that means "no data" (SRTM = -32768); `None` if the grid has none.
    pub void_value: Option<f64>,
}

impl DemGrid {
    /// The grid node value at row `i`, column `j`.
    pub fn node(&self, i: usize, j: usize) -> f64 {
        self.elev_m[i * self.n_lon + j]
    }

    /// Whether `v` is this grid's void sentinel.
    fn is_void(&self, v: f64) -> bool {
        match self.void_value {
            Some(s) => v == s,
            None => false,
        }
    }

    /// Bilinearly interpolated elevation (m) at `(lat, lon)` in degrees, edge-clamped (no
    /// extrapolation). The interpolation is identical to [`crate::ionex::TecGrid::vtec_at`].
    /// Returns [`f64::NAN`] if any of the four enclosing corners is the void sentinel — the
    /// caller must reject void cells rather than let a -32768 contaminate the match.
    pub fn elevation_at(&self, lat_deg: f64, lon_deg: f64) -> f64 {
        let (i0, fi) = cell(lat_deg, self.lat0_deg, self.dlat_deg, self.n_lat);
        let (j0, fj) = cell(lon_deg, self.lon0_deg, self.dlon_deg, self.n_lon);
        let v00 = self.node(i0, j0);
        let v01 = self.node(i0, j0 + 1);
        let v10 = self.node(i0 + 1, j0);
        let v11 = self.node(i0 + 1, j0 + 1);
        if self.is_void(v00) || self.is_void(v01) || self.is_void(v10) || self.is_void(v11) {
            return f64::NAN;
        }
        (1.0 - fi) * (1.0 - fj) * v00
            + (1.0 - fi) * fj * v01
            + fi * (1.0 - fj) * v10
            + fi * fj * v11
    }

    /// A deterministic, synthetic-but-realistic DEM fixture on a 0.5°×0.5° patch at the
    /// gravity-nav track location, used by the self-contained CI tests (the terrain analogue
    /// of the gravity mascons — testable with zero external data). The relief is a sum of
    /// Gaussian land-/sea-mounts plus a tilted-plane ridge, sampled on a fine grid; `seed`
    /// jitters the feature placement so a small ensemble of distinct-but-comparable fields
    /// can be generated. Elevations span hundreds of metres of genuinely matchable relief.
    pub fn synthetic_fixture(seed: u64) -> Self {
        // 0.5°×0.5° patch centred on the gps-denied-gravity-nav start region, at a fine
        // 0.005° (~550 m) spacing so the sampled relief is smooth between nodes.
        let lat0_deg = 12.0;
        let lon0_deg = 20.0;
        let dlat_deg = 0.005;
        let dlon_deg = 0.005;
        let n_lat = 101usize;
        let n_lon = 101usize;

        // Deterministic LCG (no rand draw — bit-reproducible across platforms) to jitter
        // the Gaussian-feature centres by a few hundredths of a degree per seed.
        let jit = |k: u64| -> f64 {
            let x = seed
                .wrapping_mul(0x9E37_79B9_7F4A_7C15)
                .wrapping_add(k.wrapping_mul(0xD1B5_4A32_D192_ED03));
            // map the high bits to [-0.04, 0.04] degrees
            let u = ((x >> 11) as f64) / ((1u64 << 53) as f64); // [0,1)
            (u - 0.5) * 0.08
        };

        // Feature list: (lat, lon, amplitude m, sigma deg). Distinctive multi-scale relief.
        let feats = [
            (12.12 + jit(1), 20.10 + jit(2), 420.0, 0.06),
            (12.30 + jit(3), 20.34 + jit(4), -260.0, 0.05),
            (12.18 + jit(5), 20.40 + jit(6), 360.0, 0.045),
            (12.40 + jit(7), 20.14 + jit(8), 300.0, 0.07),
            (12.25 + jit(9), 20.25 + jit(10), -180.0, 0.04),
        ];

        let mut elev_m = vec![0.0_f64; n_lat * n_lon];
        for i in 0..n_lat {
            let lat = lat0_deg + dlat_deg * i as f64;
            let cos_lat = lat.to_radians().cos();
            for j in 0..n_lon {
                let lon = lon0_deg + dlon_deg * j as f64;
                // Tilted-plane regional ridge.
                let mut h = 600.0 + 800.0 * (lat - 12.0) - 500.0 * (lon - 20.0);
                // Sum of Gaussian features (metric east-west scaling).
                for &(flat, flon, amp, sig) in &feats {
                    let dlat = lat - flat;
                    let dlon = (lon - flon) * cos_lat;
                    let r2 = (dlat * dlat + dlon * dlon) / (2.0 * sig * sig);
                    h += amp * (-r2).exp();
                }
                elev_m[i * n_lon + j] = h;
            }
        }
        DemGrid {
            lat0_deg,
            lon0_deg,
            dlat_deg,
            dlon_deg,
            n_lat,
            n_lon,
            elev_m,
            void_value: Some(SRTM_VOID),
        }
    }

    /// Parse a raw SRTM `.hgt` tile into a [`DemGrid`]. The file is `samples_per_side²`
    /// 16-bit signed **big-endian** integers in row-major order with the **first row the
    /// northernmost** (lat = `ll_lat + 1°`); the void sentinel is -32768. `samples_per_side`
    /// is 3601 for 1-arc-second tiles or 1201 for 3-arc-second tiles, and the lower-left
    /// corner latitude/longitude (degrees) come from the filename (the caller supplies them).
    ///
    /// To keep the [`DemGrid`] convention (positive steps, row 0 at `lat0`, south-to-north)
    /// the rows are **flipped on load**: `lat0 = ll_lat`, `dlat = 1/(N−1)`, so the file's
    /// northernmost row ends up at the highest stored latitude. Longitude runs west-to-east
    /// directly: `lon0 = ll_lon`, `dlon = 1/(N−1)`.
    ///
    /// Returns `Err` if `bytes.len() != 2·N²`. Layout per the GDAL SRTMHGT driver spec
    /// (<https://gdal.org/en/stable/drivers/raster/srtmhgt.html>).
    pub fn from_srtm_hgt(
        bytes: &[u8],
        samples_per_side: usize,
        ll_lat_deg: f64,
        ll_lon_deg: f64,
    ) -> Result<Self, String> {
        let n = samples_per_side;
        if n < 2 {
            return Err(format!("samples_per_side must be >= 2, got {n}"));
        }
        if bytes.len() != 2 * n * n {
            return Err(format!(
                "SRTM .hgt length {} != 2*{n}*{n} = {}",
                bytes.len(),
                2 * n * n
            ));
        }
        let step = 1.0 / (n - 1) as f64;
        let mut elev_m = vec![0.0_f64; n * n];
        // File row r (r = 0 is north). Stored row i = (n-1-r) so the north row sits at the
        // highest latitude with positive dlat.
        for r in 0..n {
            let stored_i = n - 1 - r;
            for j in 0..n {
                let off = 2 * (r * n + j);
                let v = i16::from_be_bytes([bytes[off], bytes[off + 1]]) as f64;
                elev_m[stored_i * n + j] = v;
            }
        }
        Ok(DemGrid {
            lat0_deg: ll_lat_deg,
            lon0_deg: ll_lon_deg,
            dlat_deg: step,
            dlon_deg: step,
            n_lat: n,
            n_lon: n,
            elev_m,
            void_value: Some(SRTM_VOID),
        })
    }

    /// A `Fn(lat_deg, lon_deg) -> elev_m` adapter, matching the field-sampler signature the
    /// map-match likelihood expects.
    pub fn sampler_deg(&self) -> impl Fn(f64, f64) -> f64 + '_ {
        move |lat_deg: f64, lon_deg: f64| self.elevation_at(lat_deg, lon_deg)
    }

    /// Population standard deviation of the (non-void) elevations — a one-number measure of
    /// how much matchable relief the grid carries.
    pub fn relief_std_m(&self) -> f64 {
        let vals: Vec<f64> = self
            .elev_m
            .iter()
            .copied()
            .filter(|v| !self.is_void(*v))
            .collect();
        if vals.is_empty() {
            return 0.0;
        }
        let mean = vals.iter().sum::<f64>() / vals.len() as f64;
        let var = vals.iter().map(|v| (v - mean) * (v - mean)).sum::<f64>() / vals.len() as f64;
        var.sqrt()
    }
}

// ---------------------------------------------------------------------------
// Altimeter measurement model
// ---------------------------------------------------------------------------

/// A radar/baro altimeter measurement model. The sensor measures the terrain clearance
/// (above-ground level); the ground elevation it implies is `(aircraft MSL altitude) −
/// (measured clearance)`. The error is modelled as additive white noise, injected by the
/// caller (deterministic in tests) rather than drawn here.
#[derive(Clone, Copy, Debug)]
pub struct Altimeter {
    /// 1σ white measurement noise on the ground-elevation estimate (m).
    pub sigma_m: f64,
}

impl Altimeter {
    /// A ground-elevation estimate (m): truth + the caller-supplied noise sample.
    pub fn measure(&self, true_ground_elev_m: f64, noise_sample_m: f64) -> f64 {
        true_ground_elev_m + noise_sample_m
    }
}

// ---------------------------------------------------------------------------
// TERCOM/SITAN terrain-referenced navigation
// ---------------------------------------------------------------------------

fn default_refine_stages() -> usize {
    3
}
fn default_refine_factor() -> f64 {
    8.0
}

/// TERCOM/SITAN terrain-referenced navigation configuration (deserialised from
/// `scenarios/terrain-nav.toml`).
#[derive(Clone, Debug, Deserialize)]
pub struct TerrainNavCfg {
    /// Synthetic-DEM seed (self-contained; jitters [`DemGrid::synthetic_fixture`]).
    pub dem_seed: u64,
    /// Track start latitude (deg).
    pub start_lat_deg: f64,
    /// Track start longitude (deg).
    pub start_lon_deg: f64,
    /// Per-waypoint latitude step (deg).
    pub step_lat_deg: f64,
    /// Per-waypoint longitude step (deg).
    pub step_lon_deg: f64,
    /// Number of waypoints flown GPS-denied.
    pub waypoints: usize,
    /// True constant INS drift, latitude component (deg).
    pub drift_lat_deg: f64,
    /// True constant INS drift, longitude component (deg).
    pub drift_lon_deg: f64,
    /// Altimeter 1σ measurement noise (m).
    pub altimeter_sigma_m: f64,
    /// DEM representation error (m); combined with the altimeter noise into the matching σ.
    pub map_sigma_m: f64,
    /// Half-width of the offset search grid (deg).
    pub search_half_deg: f64,
    /// Offset search-grid step (deg).
    pub search_step_deg: f64,
    /// Coarse-to-fine refinement stages.
    #[serde(default = "default_refine_stages")]
    pub refine_stages: usize,
    /// Per-stage window/step shrink factor.
    #[serde(default = "default_refine_factor")]
    pub refine_factor: f64,
    /// Seed for the deterministic altimeter-noise sequence.
    #[serde(default)]
    pub noise_seed: u64,
}

/// Result of a TERCOM/SITAN terrain-referenced navigation run.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct TerrainNavResult {
    /// Position error of the unaided inertial solution (m) — the magnitude of the true drift.
    pub free_inertial_drift_m: f64,
    /// Position error after terrain matching (m).
    pub matched_error_m: f64,
    /// Effective matching 1σ used (m): `hypot(altimeter σ, map σ)`.
    pub measurement_sigma_m: f64,
}

/// The metric east-west scaling latitude for a track of `n` waypoints (its midpoint).
fn mid_lat(start_lat: f64, step_lat: f64, n: usize) -> f64 {
    start_lat + step_lat * (n as f64 - 1.0) / 2.0
}

/// Convert a (Δlat, Δlon) degree offset to metres at the representative latitude.
pub(crate) fn deg_offset_to_m(dlat: f64, dlon: f64, ref_lat_deg: f64) -> f64 {
    let cos_lat = ref_lat_deg.to_radians().cos();
    let north = dlat * M_PER_DEG;
    let east = dlon * M_PER_DEG * cos_lat;
    (north * north + east * east).sqrt()
}

/// Run the GPS-denied terrain-referenced navigation benchmark.
///
/// A vehicle flies a known-shape track with no GNSS, its inertial solution carrying an
/// unknown constant position drift `d`. A radar/baro altimeter measures the ground elevation
/// under each waypoint (with its real, seeded white-noise floor injected). A hierarchical
/// coarse-to-fine matcher searches over candidate offsets `δ`: for a candidate, the
/// hypothesised true track is `(INS-reported − δ)`, and the product likelihood over the
/// waypoint sequence peaks where `δ = d`. The recovered residual `|d − δ̂|` is reported.
///
/// Non-circular by construction: the injected `δ = drift` is the independent ground truth,
/// and recovery is checked against it — never against the DEM's own value. Waypoints whose
/// hypothesised cell falls on DEM void cells are skipped (a NaN sample is dropped) so a
/// -32768 never contaminates the likelihood.
pub fn run_terrain_nav(cfg: &TerrainNavCfg) -> TerrainNavResult {
    let dem = DemGrid::synthetic_fixture(cfg.dem_seed);
    let field = dem.sampler_deg();
    let alt = Altimeter {
        sigma_m: cfg.altimeter_sigma_m,
    };
    let sigma_m =
        (cfg.altimeter_sigma_m * cfg.altimeter_sigma_m + cfg.map_sigma_m * cfg.map_sigma_m).sqrt();

    // True track and its noisy altimeter ground-elevation measurements.
    let truth: Vec<(f64, f64)> = (0..cfg.waypoints)
        .map(|k| {
            (
                cfg.start_lat_deg + cfg.step_lat_deg * k as f64,
                cfg.start_lon_deg + cfg.step_lon_deg * k as f64,
            )
        })
        .collect();
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.noise_seed);
    let noise = Normal::new(0.0, cfg.altimeter_sigma_m.max(f64::MIN_POSITIVE)).unwrap();
    let measured: Vec<f64> = truth
        .iter()
        .map(|&(la, lo)| alt.measure(field(la, lo), noise.sample(&mut rng)))
        .collect();

    // INS-reported positions carry the true constant drift d.
    let ins: Vec<(f64, f64)> = truth
        .iter()
        .map(|&(la, lo)| (la + cfg.drift_lat_deg, lo + cfg.drift_lon_deg))
        .collect();

    // Product likelihood over the waypoint sequence for a candidate offset δ. Void/NaN
    // samples (either the measured truth or the hypothesised prediction) are skipped.
    let weigh = |delta: &[f64]| -> f64 {
        let mut like = 1.0;
        for (k, &(la, lo)) in ins.iter().enumerate() {
            let predicted = field(la - delta[0], lo - delta[1]);
            let m = measured[k];
            if predicted.is_nan() || m.is_nan() {
                continue;
            }
            like *= field_likelihood(predicted, m, sigma_m);
        }
        like
    };

    let est = hierarchical_offset_search(
        weigh,
        cfg.search_half_deg,
        cfg.search_step_deg,
        cfg.refine_stages,
        cfg.refine_factor,
    );

    let ref_lat = mid_lat(cfg.start_lat_deg, cfg.step_lat_deg, cfg.waypoints);
    TerrainNavResult {
        free_inertial_drift_m: deg_offset_to_m(cfg.drift_lat_deg, cfg.drift_lon_deg, ref_lat),
        matched_error_m: deg_offset_to_m(
            cfg.drift_lat_deg - est[0],
            cfg.drift_lon_deg - est[1],
            ref_lat,
        ),
        measurement_sigma_m: sigma_m,
    }
}

// ---------------------------------------------------------------------------
// Combined gravity + magnetic + terrain navigator
// ---------------------------------------------------------------------------

/// One gravity-anomaly coefficient, for the combined-navigator TOML (mirrors
/// [`crate::gravimeter::CoeffEntry`] but local so the combined scenario is self-describing).
#[derive(Clone, Copy, Debug, Deserialize)]
pub struct CoeffEntry {
    /// Degree n.
    pub n: usize,
    /// Order m.
    pub m: usize,
    /// Normalised cosine coefficient.
    pub cbar: f64,
    /// Normalised sine coefficient.
    pub sbar: f64,
}

/// Combined gravity + magnetic + terrain GPS-denied navigator configuration (deserialised
/// from `scenarios/combined-altpnt.toml`).
#[derive(Clone, Debug, Deserialize)]
pub struct CombinedAltPntCfg {
    // ---- Track + drift + search (shared) ----
    /// Track start latitude (deg).
    pub start_lat_deg: f64,
    /// Track start longitude (deg).
    pub start_lon_deg: f64,
    /// Per-waypoint latitude step (deg).
    pub step_lat_deg: f64,
    /// Per-waypoint longitude step (deg).
    pub step_lon_deg: f64,
    /// Number of waypoints flown GPS-denied.
    pub waypoints: usize,
    /// True constant INS drift, latitude component (deg).
    pub drift_lat_deg: f64,
    /// True constant INS drift, longitude component (deg).
    pub drift_lon_deg: f64,
    /// Half-width of the offset search grid (deg).
    pub search_half_deg: f64,
    /// Offset search-grid step (deg).
    pub search_step_deg: f64,
    /// Coarse-to-fine refinement stages.
    #[serde(default = "default_refine_stages")]
    pub refine_stages: usize,
    /// Per-stage window/step shrink factor.
    #[serde(default = "default_refine_factor")]
    pub refine_factor: f64,
    /// Seed for the deterministic per-channel noise sequence.
    #[serde(default)]
    pub noise_seed: u64,

    // ---- Gravity channel ----
    /// Maximum spherical-harmonic degree/order of the reference gravity field.
    pub nmax: usize,
    /// Low-degree anomalous gravity coefficients (regional trend).
    #[serde(default)]
    pub coeffs: Vec<CoeffEntry>,
    /// Localized gravity mascons (the high-degree stand-in).
    #[serde(default)]
    pub mascons: Vec<Mascon>,
    /// Gravity-channel matching 1σ (mGal).
    pub gravity_sigma_mgal: f64,

    // ---- Magnetic channel ----
    /// IGRF decimal year for the smooth main field the crustal anomaly rides on.
    pub igrf_year: f64,
    /// Altitude for the IGRF evaluation (km).
    #[serde(default)]
    pub igrf_alt_km: f64,
    /// Synthetic crustal magnetic-anomaly mascons (nT), the high-frequency matchable signal.
    #[serde(default)]
    pub magnetic_mascons: Vec<Mascon>,
    /// Magnetic-channel matching 1σ (nT).
    pub magnetic_sigma_nt: f64,

    // ---- Terrain channel ----
    /// Synthetic-DEM seed.
    pub dem_seed: u64,
    /// Terrain-channel matching 1σ (m).
    pub terrain_sigma_m: f64,
}

/// Result of the combined gravity + magnetic + terrain navigator: the unaided drift, each
/// single-field matched residual, and the three-channel fused residual (all metres).
#[derive(Clone, Copy, Debug, Serialize)]
pub struct CombinedAltPntResult {
    /// Position error of the unaided inertial solution (m).
    pub free_inertial_drift_m: f64,
    /// Matched residual using the gravity channel alone (m).
    pub gravity_only_m: f64,
    /// Matched residual using the magnetic channel alone (m).
    pub magnetic_only_m: f64,
    /// Matched residual using the terrain channel alone (m).
    pub terrain_only_m: f64,
    /// Matched residual fusing all three channels (m).
    pub combined_m: f64,
}

/// A synthetic crustal magnetic-anomaly field: the smooth IGRF main field's total intensity
/// minus a regional mean, plus localized Gaussian magnetic mascons (nT). The IGRF main field
/// alone is too smooth to localise against — the crustal mascons are the high-frequency,
/// matchable signal (documented honestly; the real crustal anomaly map is a follow-on).
fn magnetic_anomaly_field(
    mascons: &[Mascon],
    year: f64,
    alt_km: f64,
    regional_mean_nt: f64,
) -> impl Fn(f64, f64) -> f64 + '_ {
    move |lat_deg: f64, lon_deg: f64| {
        let base = magnetic_field(lat_deg, lon_deg, alt_km, year).total_nt - regional_mean_nt;
        let cos_lat = lat_deg.to_radians().cos();
        let mut a = base;
        for ms in mascons {
            let dlat = lat_deg - ms.lat_deg;
            let dlon = (lon_deg - ms.lon_deg) * cos_lat;
            let r2 = (dlat * dlat + dlon * dlon) / (2.0 * ms.sigma_deg * ms.sigma_deg);
            // Mascon amplitude reused as the magnetic anomaly amplitude (nT here, not mGal).
            a += ms.amp_mgal * (-r2).exp();
        }
        a
    }
}

/// Run the combined gravity + magnetic + terrain GPS-denied navigator.
///
/// At each waypoint the platform takes **three** scalar measurements — gravity anomaly
/// (mGal), magnetic-anomaly total intensity (nT), and ground elevation (m). For a candidate
/// constant offset `δ` the joint per-candidate likelihood is the **product** of the three
/// field likelihoods, so information from all three channels adds: the joint posterior is
/// sharper (a lower CRLB) than any single field, which is exactly why the bounded-error
/// demo holds even where a single weak channel would not. Each channel's measurements carry
/// a deterministic seeded white-noise floor (decorrelated per channel), and the same
/// hierarchical coarse-to-fine [`crate::mapmatch::hierarchical_offset_search`] recovers δ̂.
///
/// Returns the unaided drift, each single-channel residual, and the fused residual — all in
/// metres, all checked against the **independently injected** drift (non-circular).
pub fn run_combined_altpnt(cfg: &CombinedAltPntCfg) -> CombinedAltPntResult {
    // Gravity reference field.
    let mut gmodel = GravityAnomalyModel::new(cfg.nmax);
    for c in &cfg.coeffs {
        gmodel.set_coeff(c.n, c.m, c.cbar, c.sbar);
    }
    for m in &cfg.mascons {
        gmodel.add_mascon(*m);
    }
    let gfield = gmodel.sampler_deg();

    // DEM reference field.
    let dem = DemGrid::synthetic_fixture(cfg.dem_seed);
    let tfield = dem.sampler_deg();

    // Magnetic reference field: regional mean evaluated at the track centre so the anomaly
    // is the high-frequency part (the crustal mascons dominate the matchable signal).
    let ref_lat = mid_lat(cfg.start_lat_deg, cfg.step_lat_deg, cfg.waypoints);
    let ref_lon = cfg.start_lon_deg + cfg.step_lon_deg * (cfg.waypoints as f64 - 1.0) / 2.0;
    let regional_mean_nt =
        magnetic_field(ref_lat, ref_lon, cfg.igrf_alt_km, cfg.igrf_year).total_nt;
    let bfield = magnetic_anomaly_field(
        &cfg.magnetic_mascons,
        cfg.igrf_year,
        cfg.igrf_alt_km,
        regional_mean_nt,
    );

    // True track.
    let truth: Vec<(f64, f64)> = (0..cfg.waypoints)
        .map(|k| {
            (
                cfg.start_lat_deg + cfg.step_lat_deg * k as f64,
                cfg.start_lon_deg + cfg.step_lon_deg * k as f64,
            )
        })
        .collect();

    // Decorrelated per-channel seeded noise sequences.
    let mut rng_g = ChaCha8Rng::seed_from_u64(cfg.noise_seed.wrapping_add(0x6772_6176)); // "grav"
    let mut rng_b = ChaCha8Rng::seed_from_u64(cfg.noise_seed.wrapping_add(0x6D61_6700)); // "mag"
    let mut rng_t = ChaCha8Rng::seed_from_u64(cfg.noise_seed.wrapping_add(0x7465_7272)); // "terr"
    let ng = Normal::new(0.0, cfg.gravity_sigma_mgal.max(f64::MIN_POSITIVE)).unwrap();
    let nb = Normal::new(0.0, cfg.magnetic_sigma_nt.max(f64::MIN_POSITIVE)).unwrap();
    let nt = Normal::new(0.0, cfg.terrain_sigma_m.max(f64::MIN_POSITIVE)).unwrap();

    let meas_g: Vec<f64> = truth
        .iter()
        .map(|&(la, lo)| gfield(la, lo) + ng.sample(&mut rng_g))
        .collect();
    let meas_b: Vec<f64> = truth
        .iter()
        .map(|&(la, lo)| bfield(la, lo) + nb.sample(&mut rng_b))
        .collect();
    let meas_t: Vec<f64> = truth
        .iter()
        .map(|&(la, lo)| tfield(la, lo) + nt.sample(&mut rng_t))
        .collect();

    // INS-reported positions carry the true constant drift d.
    let ins: Vec<(f64, f64)> = truth
        .iter()
        .map(|&(la, lo)| (la + cfg.drift_lat_deg, lo + cfg.drift_lon_deg))
        .collect();

    // Single-channel likelihood factory: products over the sequence, void/NaN-skipping.
    let channel_like =
        |delta: &[f64], field: &dyn Fn(f64, f64) -> f64, meas: &[f64], sigma: f64| -> f64 {
            let mut like = 1.0;
            for (k, &(la, lo)) in ins.iter().enumerate() {
                let predicted = field(la - delta[0], lo - delta[1]);
                let m = meas[k];
                if predicted.is_nan() || m.is_nan() {
                    continue;
                }
                like *= field_likelihood(predicted, m, sigma);
            }
            like
        };

    let weigh_g = |d: &[f64]| channel_like(d, &gfield, &meas_g, cfg.gravity_sigma_mgal);
    let weigh_b = |d: &[f64]| channel_like(d, &bfield, &meas_b, cfg.magnetic_sigma_nt);
    let weigh_t = |d: &[f64]| channel_like(d, &tfield, &meas_t, cfg.terrain_sigma_m);
    // Joint = product of the three channels (information adds).
    let weigh_joint = |d: &[f64]| weigh_g(d) * weigh_b(d) * weigh_t(d);

    let solve = |w: &dyn Fn(&[f64]) -> f64| -> f64 {
        let est = hierarchical_offset_search(
            w,
            cfg.search_half_deg,
            cfg.search_step_deg,
            cfg.refine_stages,
            cfg.refine_factor,
        );
        deg_offset_to_m(
            cfg.drift_lat_deg - est[0],
            cfg.drift_lon_deg - est[1],
            ref_lat,
        )
    };

    CombinedAltPntResult {
        free_inertial_drift_m: deg_offset_to_m(cfg.drift_lat_deg, cfg.drift_lon_deg, ref_lat),
        gravity_only_m: solve(&weigh_g),
        magnetic_only_m: solve(&weigh_b),
        terrain_only_m: solve(&weigh_t),
        combined_m: solve(&weigh_joint),
    }
}

// ---------------------------------------------------------------------------
// Minimal SVG drift charts (free-inertial vs matched bars)
// ---------------------------------------------------------------------------

/// Render a tiny horizontal-bar SVG comparing the free-inertial drift to the matched error
/// for a [`TerrainNavResult`] — the drift-reduction the terrain matcher buys.
pub fn terrain_nav_svg(r: &TerrainNavResult) -> String {
    bars_svg(
        "Terrain-referenced navigation (TERCOM/SITAN)",
        &[
            ("free-inertial drift", r.free_inertial_drift_m),
            ("terrain-matched", r.matched_error_m),
        ],
    )
}

/// Render the free-inertial-vs-gravity-matched bar SVG for a gravity-map alt-PNT run — a
/// gravity-titled sibling of [`terrain_nav_svg`] so the gravity-map chart is not mislabelled
/// as terrain-referenced.
pub fn gravity_nav_svg(free_inertial_drift_m: f64, gravity_matched_m: f64) -> String {
    bars_svg(
        "Gravity-map matched navigation",
        &[
            ("free-inertial drift", free_inertial_drift_m),
            ("gravity-matched", gravity_matched_m),
        ],
    )
}

/// Render a tiny horizontal-bar SVG comparing free-inertial drift, each single-channel
/// matched residual, and the fused residual for a [`CombinedAltPntResult`].
pub fn combined_altpnt_svg(r: &CombinedAltPntResult) -> String {
    bars_svg(
        "Combined gravity + magnetic + terrain alt-PNT",
        &[
            ("free-inertial drift", r.free_inertial_drift_m),
            ("gravity only", r.gravity_only_m),
            ("magnetic only", r.magnetic_only_m),
            ("terrain only", r.terrain_only_m),
            ("combined (fused)", r.combined_m),
        ],
    )
}

/// A minimal labelled horizontal-bar chart (metres), log-scaled so a 70 km bar and a 100 m
/// bar are both legible. No external chart dependency — plain SVG text, like the other packs.
fn bars_svg(title: &str, rows: &[(&str, f64)]) -> String {
    let w = 720.0;
    let h = 60.0 + rows.len() as f64 * 34.0;
    let x0 = 220.0;
    let bar_w = w - x0 - 90.0;
    let max = rows
        .iter()
        .map(|&(_, v)| v.max(1.0))
        .fold(1.0_f64, f64::max);
    let lmax = (max).log10();
    let mut s = String::new();
    s.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" \
         viewBox=\"0 0 {w} {h}\" font-family=\"sans-serif\">"
    ));
    s.push_str(&format!(
        "<text x=\"16\" y=\"28\" font-size=\"16\" font-weight=\"bold\">{title}</text>"
    ));
    for (i, &(label, v)) in rows.iter().enumerate() {
        let y = 50.0 + i as f64 * 34.0;
        let frac = if v <= 1.0 {
            0.0
        } else {
            (v.log10() / lmax).clamp(0.0, 1.0)
        };
        let len = (bar_w * frac).max(2.0);
        s.push_str(&format!(
            "<text x=\"16\" y=\"{:.0}\" font-size=\"12\">{label}</text>",
            y + 14.0
        ));
        s.push_str(&format!(
            "<rect x=\"{x0}\" y=\"{y:.0}\" width=\"{len:.0}\" height=\"20\" \
             fill=\"#3b6ea5\" rx=\"3\"/>"
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" font-size=\"12\">{:.0} m</text>",
            x0 + len + 6.0,
            y + 14.0,
            v
        ));
    }
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    // --- ORACLE A: DEM loader / spot-elevation (parser + bilinear, closed-form) ---

    #[test]
    fn bilinear_midpoint_is_exact() {
        // 2x2 grid with corners [100, 200; 300, 400] over a unit cell. The centre is the
        // average of the four corners = 250.0 (closed-form bilinear oracle, exact).
        let dem = DemGrid {
            lat0_deg: 0.0,
            lon0_deg: 0.0,
            dlat_deg: 1.0,
            dlon_deg: 1.0,
            n_lat: 2,
            n_lon: 2,
            // row 0 (lat 0): [100, 200]; row 1 (lat 1): [300, 400]
            elev_m: vec![100.0, 200.0, 300.0, 400.0],
            void_value: Some(SRTM_VOID),
        };
        assert!((dem.elevation_at(0.5, 0.5) - 250.0).abs() < 1e-12);
        // Nodes recover exactly.
        assert!((dem.elevation_at(0.0, 0.0) - 100.0).abs() < 1e-12);
        assert!((dem.elevation_at(1.0, 1.0) - 400.0).abs() < 1e-12);
        // Edge midpoint between 100 and 200 → 150.
        assert!((dem.elevation_at(0.0, 0.5) - 150.0).abs() < 1e-12);
    }

    #[test]
    fn srtm_hgt_roundtrip_big_endian() {
        // Oracle: GDAL SRTMHGT driver spec — 16-bit signed BIG-ENDIAN, row-major, NORTH row
        // first, void -32768 (https://gdal.org/en/stable/drivers/raster/srtmhgt.html).
        // Build a 2x2 .hgt: file row 0 (NORTH) = [100, 200]; file row 1 (SOUTH) = [300, 400].
        let mut bytes = Vec::new();
        for &v in &[100i16, 200, 300, 400] {
            bytes.extend_from_slice(&v.to_be_bytes());
        }
        let dem = DemGrid::from_srtm_hgt(&bytes, 2, 36.0, -119.0).expect("parses");
        assert_eq!((dem.n_lat, dem.n_lon), (2, 2));
        // Row-flip puts the NORTH file-row (lat = ll+1 = 37) at the highest stored latitude,
        // i.e. stored row index n_lat-1. So stored node(1,*) = the file's NORTH row.
        assert_eq!(dem.node(1, 0), 100.0); // north-west
        assert_eq!(dem.node(1, 1), 200.0); // north-east
        assert_eq!(dem.node(0, 0), 300.0); // south-west (lat0 = ll = 36)
        assert_eq!(dem.node(0, 1), 400.0); // south-east
                                           // The northern row really is at the highest latitude.
        let lat_north = dem.lat0_deg + dem.dlat_deg * (dem.n_lat as f64 - 1.0);
        assert!((lat_north - 37.0).abs() < 1e-12);
        assert!((dem.elevation_at(37.0, -119.0) - 100.0).abs() < 1e-12);
        assert!((dem.elevation_at(36.0, -119.0) - 300.0).abs() < 1e-12);

        // Endianness guard: the SAME bytes read little-endian would be garbage, so a
        // deliberately big-endian-decoded 0x0064 must equal 100, not 0x6400 = 25600.
        assert_eq!(i16::from_be_bytes([0x00, 0x64]), 100);
        assert_ne!(i16::from_le_bytes([0x00, 0x64]), 100);

        // Wrong length is rejected.
        assert!(DemGrid::from_srtm_hgt(&bytes[..7], 2, 0.0, 0.0).is_err());
    }

    #[test]
    fn void_sentinel_propagates_nan() {
        // A void corner ⇒ any cell touching it samples NaN (must be rejected by the matcher).
        let dem = DemGrid {
            lat0_deg: 0.0,
            lon0_deg: 0.0,
            dlat_deg: 1.0,
            dlon_deg: 1.0,
            n_lat: 2,
            n_lon: 2,
            elev_m: vec![SRTM_VOID, 200.0, 300.0, 400.0],
            void_value: Some(SRTM_VOID),
        };
        assert!(dem.elevation_at(0.5, 0.5).is_nan());
        assert!(dem.elevation_at(0.0, 0.0).is_nan());
        // A grid with no declared void treats -32768 as a literal value (no NaN).
        let mut d2 = dem.clone();
        d2.void_value = None;
        assert!(d2.elevation_at(0.5, 0.5).is_finite());
    }

    #[test]
    fn altimeter_measures_truth_plus_noise() {
        let alt = Altimeter { sigma_m: 5.0 };
        assert!((alt.measure(500.0, 3.0) - 503.0).abs() < 1e-12);
        assert!((alt.measure(500.0, 0.0) - 500.0).abs() < 1e-12);
    }

    #[test]
    fn synthetic_fixture_is_deterministic_and_distinctive() {
        // Same seed ⇒ bit-identical grid; the relief carries > 50 m of matchable variation.
        let a = DemGrid::synthetic_fixture(7);
        let b = DemGrid::synthetic_fixture(7);
        assert_eq!(a.elev_m.len(), b.elev_m.len());
        for (x, y) in a.elev_m.iter().zip(&b.elev_m) {
            assert_eq!(x.to_bits(), y.to_bits());
        }
        assert!(
            a.relief_std_m() > 50.0,
            "relief std = {} m",
            a.relief_std_m()
        );
        // Different seeds give a genuinely different (but comparable) field.
        let c = DemGrid::synthetic_fixture(8);
        assert!(a.elev_m.iter().zip(&c.elev_m).any(|(x, y)| x != y));
    }

    // --- ORACLE B: TERCOM/SITAN convergence (injected offset is the truth) ---

    /// A self-contained terrain-nav config with a hand-derived ~70 km injected drift.
    fn terrain_cfg() -> TerrainNavCfg {
        TerrainNavCfg {
            dem_seed: 1,
            start_lat_deg: 12.05,
            start_lon_deg: 20.05,
            step_lat_deg: 0.004,
            step_lon_deg: 0.003,
            waypoints: 60,
            // Injected drift: 0.5° N, -0.4° E. At ~12.17° lat (cos≈0.9776):
            //   north = 0.5·111319.49 = 55659.7 m; east = 0.4·111319.49·0.9776 = 43533 m
            //   |d| = hypot(55659.7, 43533) ≈ 70 654 m → in [60_000, 80_000].
            drift_lat_deg: 0.5,
            drift_lon_deg: -0.4,
            altimeter_sigma_m: 8.0,
            map_sigma_m: 15.0,
            // ±0.8° at 0.08°, 3 stages × 8 ⇒ floor 0.08/64 = 0.00125° ≈ 139 m < 500 m.
            search_half_deg: 0.8,
            search_step_deg: 0.08,
            refine_stages: 3,
            refine_factor: 8.0,
            noise_seed: 1,
        }
    }

    #[test]
    fn terrain_match_recovers_known_offset() {
        let r = run_terrain_nav(&terrain_cfg());
        // Hand-derived free-inertial drift magnitude (independent of any field value).
        assert!(
            (60_000.0..80_000.0).contains(&r.free_inertial_drift_m),
            "drift = {} m",
            r.free_inertial_drift_m
        );
        assert!(
            r.matched_error_m < 500.0,
            "matched {} m must beat 500 m",
            r.matched_error_m
        );
        // A genuine fix, not a marginal trim: at least 100× the free-inertial drift.
        assert!(
            r.matched_error_m < r.free_inertial_drift_m / 100.0,
            "matched {} m vs drift {} m",
            r.matched_error_m,
            r.free_inertial_drift_m
        );
        assert!(r.measurement_sigma_m > 0.0 && r.measurement_sigma_m.is_finite());
    }

    #[test]
    fn hierarchical_refinement_breaks_the_500m_barrier() {
        // A single coarse grid (step 0.08° ≈ 9 km) cannot reach 500 m; the coarse-to-fine
        // refinement is what buys sub-grid resolution (same field + noise, only stages vary).
        let mut single = terrain_cfg();
        single.refine_stages = 1;
        let coarse = run_terrain_nav(&single);
        let refined = run_terrain_nav(&terrain_cfg());
        assert!(
            coarse.matched_error_m > 500.0,
            "single-stage {} m should NOT already meet target",
            coarse.matched_error_m
        );
        assert!(refined.matched_error_m < 500.0);
        assert!(
            refined.matched_error_m < coarse.matched_error_m / 4.0,
            "refinement {} m must sharply beat single-stage {} m",
            refined.matched_error_m,
            coarse.matched_error_m
        );
    }

    #[test]
    fn terrain_recovery_stable_across_noise_seeds() {
        let mut errs = Vec::new();
        for seed in 1..=5u64 {
            let mut cfg = terrain_cfg();
            cfg.noise_seed = seed;
            let r = run_terrain_nav(&cfg);
            assert!(
                r.matched_error_m < 500.0,
                "seed {seed}: {} m",
                r.matched_error_m
            );
            errs.push(r.matched_error_m);
        }
        let max = errs.iter().cloned().fold(f64::MIN, f64::max);
        let min = errs.iter().cloned().fold(f64::MAX, f64::min);
        assert!(max - min < 50.0, "spread {} m across seeds", max - min);
    }

    #[test]
    fn run_is_deterministic_for_fixed_seed() {
        let a = run_terrain_nav(&terrain_cfg());
        let b = run_terrain_nav(&terrain_cfg());
        assert_eq!(a.matched_error_m.to_bits(), b.matched_error_m.to_bits());
    }

    // --- ORACLE C: bounded-error / fusion gain (vs literature TERCOM CEP regime) ---

    /// A self-contained combined gravity+magnetic+terrain config.
    fn combined_cfg() -> CombinedAltPntCfg {
        CombinedAltPntCfg {
            start_lat_deg: 12.05,
            start_lon_deg: 20.05,
            step_lat_deg: 0.004,
            step_lon_deg: 0.003,
            waypoints: 60,
            drift_lat_deg: 0.5,
            drift_lon_deg: -0.4,
            search_half_deg: 0.8,
            search_step_deg: 0.08,
            refine_stages: 3,
            refine_factor: 8.0,
            noise_seed: 1,
            nmax: 3,
            coeffs: vec![
                CoeffEntry {
                    n: 2,
                    m: 0,
                    cbar: 6.0e-6,
                    sbar: 0.0,
                },
                CoeffEntry {
                    n: 3,
                    m: 1,
                    cbar: 3.0e-6,
                    sbar: 2.0e-6,
                },
            ],
            mascons: vec![
                Mascon {
                    lat_deg: 12.18,
                    lon_deg: 20.16,
                    amp_mgal: 45.0,
                    sigma_deg: 0.05,
                },
                Mascon {
                    lat_deg: 12.26,
                    lon_deg: 20.22,
                    amp_mgal: -38.0,
                    sigma_deg: 0.045,
                },
            ],
            gravity_sigma_mgal: 3.0,
            igrf_year: 2025.0,
            igrf_alt_km: 0.0,
            magnetic_mascons: vec![
                Mascon {
                    lat_deg: 12.20,
                    lon_deg: 20.18,
                    amp_mgal: 250.0,
                    sigma_deg: 0.05,
                },
                Mascon {
                    lat_deg: 12.24,
                    lon_deg: 20.20,
                    amp_mgal: -200.0,
                    sigma_deg: 0.045,
                },
            ],
            magnetic_sigma_nt: 30.0,
            dem_seed: 1,
            terrain_sigma_m: 40.0,
        }
    }

    #[test]
    fn combined_filter_bounded_and_beats_each_single_field() {
        // Published TERCOM/TRN CEP is "as low as tens of metres" (en.wikipedia.org/wiki/TERCOM;
        // PeerJ 2024 ESKF-TERCOM, peerj.com/articles/cs-3118/). The fused solution must be
        // bounded under 500 m over the outage (beats free-inertial by >100×) AND, on average,
        // never worse than the best single field — the information-additivity oracle (the joint
        // posterior is sharper / lower-CRLB than any single channel).
        //
        // The "combined ≤ min(singles)" relation holds *in expectation*: a single noise
        // realisation can put one channel exactly at the grid-resolution floor while the fused
        // point estimate lands a metre off it. So — exactly as the gravity stability test does
        // — we assert the relation on the SEED-AVERAGED residuals (deterministic, honest) and
        // the < 500 m / > 100× bound on every individual seed.
        let mut drift = 0.0;
        let (mut sg, mut sb, mut st, mut sc) = (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
        let seeds = 1..=5u64;
        let n = 5.0;
        for seed in seeds {
            let mut cfg = combined_cfg();
            cfg.noise_seed = seed;
            let r = run_combined_altpnt(&cfg);
            drift = r.free_inertial_drift_m;
            assert!(
                (60_000.0..80_000.0).contains(&r.free_inertial_drift_m),
                "seed {seed}: drift = {} m",
                r.free_inertial_drift_m
            );
            // Bounded per seed.
            assert!(
                r.combined_m < 500.0,
                "seed {seed}: combined {} m must beat 500 m",
                r.combined_m
            );
            assert!(
                r.combined_m < r.free_inertial_drift_m / 100.0,
                "seed {seed}: combined {} m vs drift {} m",
                r.combined_m,
                r.free_inertial_drift_m
            );
            // Every single channel is itself bounded (all weaker than fused but still < drift).
            assert!(r.gravity_only_m < r.free_inertial_drift_m);
            assert!(r.magnetic_only_m < r.free_inertial_drift_m);
            assert!(r.terrain_only_m < r.free_inertial_drift_m);
            sg += r.gravity_only_m;
            sb += r.magnetic_only_m;
            st += r.terrain_only_m;
            sc += r.combined_m;
        }
        let (mg, mb, mt, mc) = (sg / n, sb / n, st / n, sc / n);
        let best_single_mean = mg.min(mb).min(mt);
        // Fusion is, on average, no worse than the best single channel — and here strictly
        // better than each weak single field (the demonstrable fusion gain).
        assert!(
            mc <= best_single_mean,
            "mean combined {mc} m must be <= mean best single {best_single_mean} m (g {mg}, b {mb}, t {mt})"
        );
        assert!(mc < 500.0, "mean combined {mc} m");
        assert!(
            mc < drift / 100.0,
            "mean combined {mc} m vs drift {drift} m"
        );
    }

    #[test]
    fn combined_run_is_deterministic() {
        let a = run_combined_altpnt(&combined_cfg());
        let b = run_combined_altpnt(&combined_cfg());
        assert_eq!(a.combined_m.to_bits(), b.combined_m.to_bits());
    }

    // --- Committed scenarios + fixture parser ---

    #[test]
    fn committed_terrain_scenario_loads_and_runs() {
        let cfg: TerrainNavCfg = toml::from_str(include_str!("../../scenarios/terrain-nav.toml"))
            .expect("terrain-nav scenario parses");
        let r = run_terrain_nav(&cfg);
        assert!(r.free_inertial_drift_m > 10_000.0);
        assert!(r.matched_error_m < 500.0, "matched {} m", r.matched_error_m);
        assert!(r.matched_error_m < r.free_inertial_drift_m / 100.0);

        let ccfg: CombinedAltPntCfg =
            toml::from_str(include_str!("../../scenarios/combined-altpnt.toml"))
                .expect("combined-altpnt scenario parses");
        let cr = run_combined_altpnt(&ccfg);
        assert!(cr.combined_m < 500.0, "combined {} m", cr.combined_m);
        assert!(cr.free_inertial_drift_m > 10_000.0);
        assert!(cr.combined_m < cr.free_inertial_drift_m / 100.0);
        // The fused estimate is no worse than the best single channel up to one grid cell
        // (final resolution ≈ search_step/factor² ≈ 140 m); the strict averaged-expectation
        // form of the fusion-gain oracle is asserted in
        // `combined_filter_bounded_and_beats_each_single_field`.
        let best = cr
            .gravity_only_m
            .min(cr.magnetic_only_m)
            .min(cr.terrain_only_m);
        let grid_floor_m = ccfg.search_step_deg / ccfg.refine_factor.powi(2) * M_PER_DEG;
        assert!(
            cr.combined_m <= best + grid_floor_m,
            "combined {} m vs best single {} m (floor {} m)",
            cr.combined_m,
            best,
            grid_floor_m
        );
    }

    // NOTE: the committed `.hgt`-fixture parser test (`mini_hgt_fixture_parses`, via
    // `include_bytes!`) lives in `tests/terrain_nav_validation.rs` — kept OUT of `src/` so the
    // published crate (which excludes `/tests/fixtures`) never depends on the fixture, exactly
    // like the `tests/sgp4_crate_comparison.rs` head-to-head. The self-contained synthetic
    // fixture above covers the same parser/sampler paths for CI.
}
