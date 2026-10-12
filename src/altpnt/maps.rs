// SPDX-License-Identifier: AGPL-3.0-only
//! Real reference maps for the alt-PNT navigators, and the map-error model.
//!
//! The map-matching navigators in [`crate::gravimeter`] and [`super::terrain`] sample a
//! scalar field through a `Fn(lat_deg, lon_deg) -> value` closure. This module supplies the
//! gridded fields that closure can be built from:
//!
//! 1. [`GeoGrid`]: a regular geographic grid of one scalar (gravity anomaly in mGal,
//!    crustal magnetic anomaly in nT, ...) with the same edge-clamped bilinear sample as
//!    [`crate::ionex::TecGrid`] and [`super::terrain::DemGrid`], and a void mask;
//! 2. [`GeoGrid::from_emag2_csv`]: a reader for the NOAA NCEI **EMAG2v3** Earth Magnetic
//!    Anomaly Grid (2 arc-minute) comma-delimited format, either column (sea level, or
//!    upward-continued to 4 km);
//! 3. [`GeoGrid::gravity_anomaly_from_sh`]: a regional grid of the gravity anomaly in
//!    spherical approximation synthesised from any spherical-harmonic model
//!    ([`crate::gravity_sh::SphericalHarmonicField`]: the bundled EGM2008 to degree 70, or
//!    a user ICGEM `.gfc` loaded to high degree), so the navigator's many samples cost a
//!    bilinear lookup each instead of a full synthesis;
//! 4. [`correlated_error_field`]: a seeded, spatially correlated Gaussian random field, the
//!    map-representation error the map-error Monte Carlo adds to the stored map.
//!
//! ## Scope (honest)
//!
//! The EMAG2v3 grid is **not bundled**: its NCEI metadata carries a citation and use and
//! distribution disclaimers but no explicit licence, and the grid compiles third-party
//! surveys, so it is fetched at test time by `tools/fetch_emag2_tile.py` into the ignored
//! `tools/emag2/` directory. The committed tests read a small **synthetic** file in the same
//! format. The bundled EGM2008 coefficients stop at degree 70 (a half-wavelength of about
//! 285 km): that resolves the regional trend, not the tens-of-kilometre features a gravity
//! map matcher needs. A higher-degree model has to be loaded by the user from ICGEM. The
//! map-error field is a stationary Gaussian model with one correlation length; real map
//! error is neither stationary nor Gaussian, and its size is a configured input here,
//! not a property of any published map.

use crate::ionex::cell;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};

/// The EMAG2v3 no-data value (`99999` nT, data-source code `999`).
pub const EMAG2_VOID: f64 = 99_999.0;

/// A regular geographic grid of one scalar value. Rows run south to north from
/// `lat0_deg`, columns west to east from `lon0_deg`; `values[i * n_lon + j]` sits at
/// `(lat0 + i·dlat, lon0 + j·dlon)`. A NaN node is void.
#[derive(Clone, Debug, PartialEq)]
pub struct GeoGrid {
    /// Latitude of row 0 (deg).
    pub lat0_deg: f64,
    /// Longitude of column 0 (deg).
    pub lon0_deg: f64,
    /// Positive latitude step between rows (deg).
    pub dlat_deg: f64,
    /// Positive longitude step between columns (deg).
    pub dlon_deg: f64,
    /// Number of rows (at least 2).
    pub n_lat: usize,
    /// Number of columns (at least 2).
    pub n_lon: usize,
    /// Node values, row-major; NaN marks a void node.
    pub values: Vec<f64>,
}

/// Which EMAG2v3 anomaly column to read.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum Emag2Column {
    /// Column 5: the anomaly reduced to sea level (nT).
    SeaLevel,
    /// Column 6: the anomaly upward-continued to a constant 4 km altitude (nT).
    UpCont,
}

impl GeoGrid {
    /// A grid over `[south, north] × [west, east]` (deg) at `step_deg`, with every node
    /// computed by `f(lat_deg, lon_deg)`. The north and east edges are rounded out to a
    /// whole number of steps. Returns `Err` for a non-positive or non-finite step or an
    /// empty box.
    pub fn from_fn<F>(
        south: f64,
        north: f64,
        west: f64,
        east: f64,
        step_deg: f64,
        f: F,
    ) -> Result<Self, String>
    where
        F: Fn(f64, f64) -> f64,
    {
        let (n_lat, n_lon) = box_shape(south, north, west, east, step_deg)?;
        let mut values = Vec::with_capacity(n_lat * n_lon);
        for i in 0..n_lat {
            let lat = south + i as f64 * step_deg;
            for j in 0..n_lon {
                values.push(f(lat, west + j as f64 * step_deg));
            }
        }
        Ok(Self {
            lat0_deg: south,
            lon0_deg: west,
            dlat_deg: step_deg,
            dlon_deg: step_deg,
            n_lat,
            n_lon,
            values,
        })
    }

    /// The node value at row `i`, column `j`.
    pub fn node(&self, i: usize, j: usize) -> f64 {
        self.values[i * self.n_lon + j]
    }

    /// Latitude of the last row (deg).
    pub fn north_deg(&self) -> f64 {
        self.lat0_deg + (self.n_lat - 1) as f64 * self.dlat_deg
    }

    /// Longitude of the last column (deg).
    pub fn east_deg(&self) -> f64 {
        self.lon0_deg + (self.n_lon - 1) as f64 * self.dlon_deg
    }

    /// Whether `(lat, lon)` lies inside the grid's node box (edges included).
    pub fn contains(&self, lat_deg: f64, lon_deg: f64) -> bool {
        lat_deg >= self.lat0_deg
            && lat_deg <= self.north_deg()
            && lon_deg >= self.lon0_deg
            && lon_deg <= self.east_deg()
    }

    /// Bilinearly interpolated value at `(lat, lon)` (deg), edge-clamped like
    /// [`crate::ionex::TecGrid::vtec_at`]. NaN if any of the four enclosing nodes is void.
    pub fn value_at(&self, lat_deg: f64, lon_deg: f64) -> f64 {
        let (i0, fi) = cell(lat_deg, self.lat0_deg, self.dlat_deg, self.n_lat);
        let (j0, fj) = cell(lon_deg, self.lon0_deg, self.dlon_deg, self.n_lon);
        let v00 = self.node(i0, j0);
        let v01 = self.node(i0, j0 + 1);
        let v10 = self.node(i0 + 1, j0);
        let v11 = self.node(i0 + 1, j0 + 1);
        (1.0 - fi) * (1.0 - fj) * v00
            + (1.0 - fi) * fj * v01
            + fi * (1.0 - fj) * v10
            + fi * fj * v11
    }

    /// A `Fn(lat_deg, lon_deg) -> value` adapter for the map-match likelihood.
    pub fn sampler_deg(&self) -> impl Fn(f64, f64) -> f64 + '_ {
        move |lat_deg: f64, lon_deg: f64| self.value_at(lat_deg, lon_deg)
    }

    /// Number of void (NaN) nodes.
    pub fn void_count(&self) -> usize {
        self.values.iter().filter(|v| v.is_nan()).count()
    }

    /// Mean and population standard deviation of the non-void nodes, `(0, 0)` if all void.
    pub fn mean_std(&self) -> (f64, f64) {
        let vals: Vec<f64> = self.values.iter().copied().filter(|v| !v.is_nan()).collect();
        if vals.is_empty() {
            return (0.0, 0.0);
        }
        let n = vals.len() as f64;
        let mean = vals.iter().sum::<f64>() / n;
        let var = vals.iter().map(|v| (v - mean) * (v - mean)).sum::<f64>() / n;
        (mean, var.sqrt())
    }

    /// This grid plus `other` sampled at each node (bilinear, edge-clamped): how a stored
    /// map is built as truth plus an error field on a different lattice.
    pub fn plus(&self, other: &GeoGrid) -> GeoGrid {
        let mut out = self.clone();
        for i in 0..self.n_lat {
            let lat = self.lat0_deg + i as f64 * self.dlat_deg;
            for j in 0..self.n_lon {
                let lon = self.lon0_deg + j as f64 * self.dlon_deg;
                out.values[i * self.n_lon + j] += other.value_at(lat, lon);
            }
        }
        out
    }

    /// A regional grid of the **gravity anomaly in spherical approximation** (mGal, the ICGEM
    /// functional `gravity_anomaly_sa`) synthesised from a spherical-harmonic model over
    /// `[south, north] × [west, east]` (deg) at `step_deg`, on the ellipsoid (`h = 0`),
    /// relative to the normal field of `ell`, the degree-0 term kept when `zero_degree` is
    /// set. See [`SphericalHarmonicField::gravity_anomaly_sa_parallel_mgal`]; each parallel
    /// is one Legendre evaluation.
    ///
    /// [`SphericalHarmonicField::gravity_anomaly_sa_parallel_mgal`]:
    ///     crate::gravity_sh::SphericalHarmonicField::gravity_anomaly_sa_parallel_mgal
    #[allow(clippy::too_many_arguments)]
    pub fn gravity_anomaly_from_sh(
        field: &crate::gravity_sh::SphericalHarmonicField,
        ell: &crate::gravity_sh::LevelEllipsoid,
        zero_degree: bool,
        south: f64,
        north: f64,
        west: f64,
        east: f64,
        step_deg: f64,
    ) -> Result<Self, String> {
        let (n_lat, n_lon) = box_shape(south, north, west, east, step_deg)?;
        let lons: Vec<f64> = (0..n_lon)
            .map(|j| (west + j as f64 * step_deg).to_radians())
            .collect();
        let mut values = Vec::with_capacity(n_lat * n_lon);
        for i in 0..n_lat {
            let lat = (south + i as f64 * step_deg).to_radians();
            values.extend(field.gravity_anomaly_sa_parallel_mgal(ell, zero_degree, lat, 0.0, &lons));
        }
        Ok(Self {
            lat0_deg: south,
            lon0_deg: west,
            dlat_deg: step_deg,
            dlon_deg: step_deg,
            n_lat,
            n_lon,
            values,
        })
    }

    /// Parse an **EMAG2v3** comma-delimited grid (whole file or a crop of it).
    ///
    /// Columns, per NOAA's `EMAG2_readme.txt`: `i, j, LON, LAT, SeaLevel, UpCont, Code,
    /// Error`, longitude and latitude in WGS-84 decimal degrees, anomalies in nT. Lines
    /// starting with `#` and blank lines are skipped. The nodes must form a complete regular
    /// lattice (every latitude row carrying every longitude); the spacing is read from the
    /// data. A node whose chosen column is the no-data value `99999` becomes void (NaN).
    /// Longitudes are taken as given (`-180..180` in the published file), so a crop that
    /// straddles the antimeridian is refused rather than wrapped.
    pub fn from_emag2_csv(text: &str, column: Emag2Column) -> Result<Self, String> {
        let col = match column {
            Emag2Column::SeaLevel => 4,
            Emag2Column::UpCont => 5,
        };
        let mut rows: Vec<(f64, f64, f64)> = Vec::new();
        for (ln, line) in text.lines().enumerate() {
            let t = line.trim();
            if t.is_empty() || t.starts_with('#') {
                continue;
            }
            let p: Vec<&str> = t.split(',').map(str::trim).collect();
            if p.len() < 8 {
                return Err(format!(
                    "EMAG2 line {}: expected 8 comma-separated columns, found {}",
                    ln + 1,
                    p.len()
                ));
            }
            let num = |k: usize, what: &str| {
                p[k].parse::<f64>()
                    .map_err(|_| format!("EMAG2 line {}: bad {what} `{}`", ln + 1, p[k]))
            };
            let lon = num(2, "longitude")?;
            let lat = num(3, "latitude")?;
            let v = num(col, "anomaly")?;
            if !(lon.is_finite() && lat.is_finite() && v.is_finite()) {
                return Err(format!("EMAG2 line {}: non-finite value", ln + 1));
            }
            rows.push((lat, lon, if v == EMAG2_VOID { f64::NAN } else { v }));
        }
        if rows.is_empty() {
            return Err("EMAG2: no data rows".into());
        }
        let lats = distinct_sorted(rows.iter().map(|r| r.0));
        let lons = distinct_sorted(rows.iter().map(|r| r.1));
        let dlat = regular_step(&lats, "latitude")?;
        let dlon = regular_step(&lons, "longitude")?;
        let (n_lat, n_lon) = (lats.len(), lons.len());
        if rows.len() != n_lat * n_lon {
            return Err(format!(
                "EMAG2: {} rows do not fill the {n_lat} x {n_lon} lattice they span",
                rows.len()
            ));
        }
        let (lat0, lon0) = (lats[0], lons[0]);
        let mut values = vec![f64::NAN; n_lat * n_lon];
        let mut seen = vec![false; n_lat * n_lon];
        for (lat, lon, v) in rows {
            let i = ((lat - lat0) / dlat).round() as usize;
            let j = ((lon - lon0) / dlon).round() as usize;
            let k = i * n_lon + j;
            if seen[k] {
                return Err(format!("EMAG2: duplicate node at {lat}, {lon}"));
            }
            seen[k] = true;
            values[k] = v;
        }
        Ok(Self {
            lat0_deg: lat0,
            lon0_deg: lon0,
            dlat_deg: dlat,
            dlon_deg: dlon,
            n_lat,
            n_lon,
            values,
        })
    }
}

/// Node counts `(n_lat, n_lon)` of a `step`-spaced box, at least 2 each.
fn box_shape(south: f64, north: f64, west: f64, east: f64, step: f64) -> Result<(usize, usize), String> {
    if !(step.is_finite() && step > 0.0) {
        return Err(format!("grid step must be finite and positive, got {step}"));
    }
    if !(south.is_finite() && north.is_finite() && west.is_finite() && east.is_finite())
        || north <= south
        || east <= west
    {
        return Err(format!(
            "grid box must have north > south and east > west, got [{south}, {north}] x [{west}, {east}]"
        ));
    }
    let n = |span: f64| ((span / step - 1e-9).ceil() as usize + 1).max(2);
    let (n_lat, n_lon) = (n(north - south), n(east - west));
    if n_lat.saturating_mul(n_lon) > 50_000_000 {
        return Err(format!("grid of {n_lat} x {n_lon} nodes is too large"));
    }
    Ok((n_lat, n_lon))
}

/// The distinct values of `it`, sorted, merging values closer than 1e-7 deg.
fn distinct_sorted(it: impl Iterator<Item = f64>) -> Vec<f64> {
    let mut v: Vec<f64> = it.collect();
    v.sort_by(|a, b| a.total_cmp(b));
    v.dedup_by(|a, b| (*a - *b).abs() < 1e-7);
    v
}

/// The common spacing of sorted axis values, refusing an irregular axis.
fn regular_step(axis: &[f64], what: &str) -> Result<f64, String> {
    if axis.len() < 2 {
        return Err(format!("EMAG2: the {what} axis needs at least 2 distinct values"));
    }
    let step = (axis[axis.len() - 1] - axis[0]) / (axis.len() - 1) as f64;
    for w in axis.windows(2) {
        if ((w[1] - w[0]) - step).abs() > 1e-6 {
            return Err(format!(
                "EMAG2: the {what} axis is not regular ({} to {} against a mean step of {step})",
                w[0], w[1]
            ));
        }
    }
    Ok(step)
}

/// A seeded, zero-mean, stationary Gaussian random field over a box, with standard
/// deviation `sigma` and a Gaussian correlation function `ρ(r) = exp(−r²/(2L²))` in
/// distance `r` (degrees of arc, the east-west axis scaled by the cosine of the box's
/// mid-latitude).
///
/// Built by smoothing white noise on a `step_deg` lattice with a separable Gaussian kernel
/// of width `L/√2` (the convolution of two such kernels is the width-`L` correlation),
/// then scaling by the kernel's exact sum of squares so the node variance is `sigma²`. The
/// noise lattice is padded by four kernel widths on every side, so every node sees the
/// kernel's full support and the field is stationary up to the box edge. Deterministic for
/// a fixed `seed`.
#[allow(clippy::too_many_arguments)]
pub fn correlated_error_field(
    south: f64,
    north: f64,
    west: f64,
    east: f64,
    step_deg: f64,
    sigma: f64,
    corr_len_deg: f64,
    seed: u64,
) -> Result<GeoGrid, String> {
    if !(sigma.is_finite() && sigma >= 0.0) {
        return Err(format!("error sigma must be finite and non-negative, got {sigma}"));
    }
    if !(corr_len_deg.is_finite() && corr_len_deg > 0.0) {
        return Err(format!(
            "correlation length must be finite and positive, got {corr_len_deg}"
        ));
    }
    let (n_lat, n_lon) = box_shape(south, north, west, east, step_deg)?;
    let cos_mid = ((south + north) / 2.0).to_radians().cos().max(1e-3);
    // Kernel half-widths in nodes along each axis: width L/√2 in arc, east-west widened by
    // 1/cos φ so the correlation is isotropic in distance rather than in degrees.
    let w_lat = corr_len_deg / std::f64::consts::SQRT_2 / step_deg;
    let w_lon = w_lat / cos_mid;
    let kernel = |w: f64| -> Vec<f64> {
        let half = (4.0 * w).ceil().max(1.0) as isize;
        (-half..=half)
            .map(|k| (-(k as f64) * (k as f64) / (2.0 * w * w)).exp())
            .collect()
    };
    let (k_lat, k_lon) = (kernel(w_lat), kernel(w_lon));
    let (h_lat, h_lon) = (k_lat.len() / 2, k_lon.len() / 2);
    let ss = |k: &[f64]| k.iter().map(|x| x * x).sum::<f64>();
    let scale = sigma / (ss(&k_lat) * ss(&k_lon)).sqrt();

    // White noise on the padded lattice.
    let (p_lat, p_lon) = (n_lat + 2 * h_lat, n_lon + 2 * h_lon);
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let white: Vec<f64> = (0..p_lat * p_lon)
        .map(|_| StandardNormal.sample(&mut rng))
        .collect();
    // Separable smoothing: along longitude on every padded row, then along latitude.
    let mut rows_smoothed = vec![0.0; p_lat * n_lon];
    for i in 0..p_lat {
        for j in 0..n_lon {
            let mut acc = 0.0;
            for (k, w) in k_lon.iter().enumerate() {
                acc += w * white[i * p_lon + j + k];
            }
            rows_smoothed[i * n_lon + j] = acc;
        }
    }
    let mut values = vec![0.0; n_lat * n_lon];
    for i in 0..n_lat {
        for j in 0..n_lon {
            let mut acc = 0.0;
            for (k, w) in k_lat.iter().enumerate() {
                acc += w * rows_smoothed[(i + k) * n_lon + j];
            }
            values[i * n_lon + j] = scale * acc;
        }
    }
    Ok(GeoGrid {
        lat0_deg: south,
        lon0_deg: west,
        dlat_deg: step_deg,
        dlon_deg: step_deg,
        n_lat,
        n_lon,
        values,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tiny() -> GeoGrid {
        // 2 x 3 nodes: rows at lat 10, 11; columns at lon 20, 21, 22.
        GeoGrid {
            lat0_deg: 10.0,
            lon0_deg: 20.0,
            dlat_deg: 1.0,
            dlon_deg: 1.0,
            n_lat: 2,
            n_lon: 3,
            values: vec![0.0, 10.0, 20.0, 100.0, 110.0, f64::NAN],
        }
    }

    #[test]
    fn bilinear_is_exact_at_nodes_and_midpoints() {
        let g = tiny();
        assert_eq!(g.value_at(10.0, 20.0), 0.0);
        assert_eq!(g.value_at(11.0, 21.0), 110.0);
        // Centre of the first cell: mean of 0, 10, 100, 110.
        assert!((g.value_at(10.5, 20.5) - 55.0).abs() < 1e-12);
        // A cell with a void corner samples NaN.
        assert!(g.value_at(10.5, 21.5).is_nan());
        assert_eq!(g.void_count(), 1);
    }

    #[test]
    fn from_fn_reproduces_a_plane_exactly() {
        let g = GeoGrid::from_fn(1.0, 2.0, 3.0, 4.0, 0.1, |la, lo| 3.0 * la - 2.0 * lo).unwrap();
        assert_eq!((g.n_lat, g.n_lon), (11, 11));
        // Bilinear interpolation of a plane is exact anywhere inside.
        let (la, lo) = (1.234, 3.567);
        assert!((g.value_at(la, lo) - (3.0 * la - 2.0 * lo)).abs() < 1e-12);
        assert!(GeoGrid::from_fn(1.0, 1.0, 3.0, 4.0, 0.1, |_, _| 0.0).is_err());
        assert!(GeoGrid::from_fn(1.0, 2.0, 3.0, 4.0, 0.0, |_, _| 0.0).is_err());
    }

    const EMAG2_SAMPLE: &str = "# synthetic test rows in the EMAG2v3 column layout\n\
        0,0,20.0,10.0,1.0,2.0,019,5.0\n\
        1,0,20.5,10.0,3.0,4.0,019,5.0\n\
        0,1,20.0,10.5,5.0,6.0,019,5.0\n\
        1,1,20.5,10.5,99999,99999,999,-999\n";

    #[test]
    fn emag2_reader_lays_out_the_lattice_and_masks_no_data() {
        let g = GeoGrid::from_emag2_csv(EMAG2_SAMPLE, Emag2Column::SeaLevel).unwrap();
        assert_eq!((g.n_lat, g.n_lon), (2, 2));
        assert_eq!((g.lat0_deg, g.lon0_deg), (10.0, 20.0));
        assert!((g.dlat_deg - 0.5).abs() < 1e-12 && (g.dlon_deg - 0.5).abs() < 1e-12);
        assert_eq!(g.node(0, 0), 1.0);
        assert_eq!(g.node(0, 1), 3.0);
        assert_eq!(g.node(1, 0), 5.0);
        assert!(g.node(1, 1).is_nan());
        let up = GeoGrid::from_emag2_csv(EMAG2_SAMPLE, Emag2Column::UpCont).unwrap();
        assert_eq!(up.node(0, 1), 4.0);
    }

    #[test]
    fn emag2_reader_refuses_broken_lattices() {
        // A missing node.
        let short = "0,0,20.0,10.0,1,2,19,5\n1,0,20.5,10.0,1,2,19,5\n0,1,20.0,10.5,1,2,19,5\n";
        assert!(GeoGrid::from_emag2_csv(short, Emag2Column::SeaLevel).is_err());
        // Too few columns.
        assert!(GeoGrid::from_emag2_csv("0,0,20.0,10.0,1\n", Emag2Column::SeaLevel).is_err());
        // Irregular spacing.
        let irregular = "0,0,20.0,10.0,1,2,19,5\n1,0,20.5,10.0,1,2,19,5\n2,0,21.5,10.0,1,2,19,5\n\
                         0,1,20.0,10.5,1,2,19,5\n1,1,20.5,10.5,1,2,19,5\n2,1,21.5,10.5,1,2,19,5\n";
        assert!(GeoGrid::from_emag2_csv(irregular, Emag2Column::SeaLevel).is_err());
        assert!(GeoGrid::from_emag2_csv("# only a comment\n", Emag2Column::SeaLevel).is_err());
    }

    #[test]
    fn error_field_has_the_configured_sigma_and_correlation() {
        // A 6 x 6 deg box at 0.02 deg with L = 0.1 deg holds ~ 3600 correlation areas, so
        // the sample moments sit close to the model's.
        let (s, n, w, e, step) = (0.0, 6.0, 0.0, 6.0, 0.02);
        let sigma = 3.0;
        let l = 0.1;
        let g = correlated_error_field(s, n, w, e, step, sigma, l, 7).unwrap();
        let (mean, sd) = g.mean_std();
        assert!(mean.abs() < 0.1, "mean {mean}");
        assert!((sd - sigma).abs() / sigma < 0.05, "sd {sd} vs {sigma}");
        // Lag-L correlation along latitude should be exp(-1/2) = 0.607 for a Gaussian ρ.
        let lag = (l / step).round() as usize;
        let (mut num, mut den) = (0.0, 0.0);
        for i in 0..g.n_lat - lag {
            for j in 0..g.n_lon {
                let a = g.node(i, j) - mean;
                num += a * (g.node(i + lag, j) - mean);
                den += a * a;
            }
        }
        let rho = num / den;
        assert!((rho - (-0.5_f64).exp()).abs() < 0.05, "rho(L) = {rho}");
        // Deterministic per seed, different across seeds.
        let again = correlated_error_field(s, n, w, e, step, sigma, l, 7).unwrap();
        assert_eq!(g, again);
        let other = correlated_error_field(s, n, w, e, step, sigma, l, 8).unwrap();
        assert_ne!(g.values, other.values);
        // sigma = 0 is the exact zero field.
        let zero = correlated_error_field(s, 1.0, w, 1.0, 0.1, 0.0, l, 7).unwrap();
        assert!(zero.values.iter().all(|v| *v == 0.0));
    }
}
