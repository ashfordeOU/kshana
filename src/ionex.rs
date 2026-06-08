// SPDX-License-Identifier: Apache-2.0
//! IONEX-style total-electron-content (TEC) maps and the ionospheric range delay.
//!
//! The shipped Klobuchar model (in [`crate::gnss_sim`]) is the *broadcast* single-frequency
//! ionosphere correction. This module adds the *measured* alternative: an IGS global
//! ionosphere map (GIM) as a regular latitude/longitude grid of vertical TEC, with bilinear
//! interpolation at an ionospheric pierce point, and the first-order delay
//! `Δ = 40.3·TEC/f²` (TEC in electrons/m², `f` in Hz).
//!
//! It also parses the IONEX file format into its sequence of TEC maps, interpolates the
//! vertical TEC between successive maps in time, and maps the vertical delay onto a slant ray
//! through the thin-shell obliquity factor. Scope (honest): strict I5 fixed-column value
//! packing and multi-day epoch arithmetic beyond seconds-of-day are refinements (see
//! `ROADMAP.md`).

/// GPS L1 carrier frequency (Hz).
pub const GPS_L1_HZ: f64 = 1_575.42e6;
/// GPS L2 carrier frequency (Hz).
pub const GPS_L2_HZ: f64 = 1_227.60e6;
/// Electrons per square metre in one TEC unit (TECU).
pub const TECU: f64 = 1.0e16;

/// First-order ionospheric range delay (m): `Δ = 40.3·TEC/f²`, with `vtec_tecu` in TECU
/// and `frequency_hz` in Hz. At L1, 1 TECU ≈ 0.162 m; the delay scales as `1/f²`.
pub fn vtec_to_delay_m(vtec_tecu: f64, frequency_hz: f64) -> f64 {
    40.3 * vtec_tecu * TECU / (frequency_hz * frequency_hz)
}

/// A regular latitude/longitude grid of vertical TEC (TECU), row-major in latitude then
/// longitude — an IGS global ionosphere map.
#[derive(Clone, Debug)]
pub struct TecGrid {
    /// Latitude of the first row (deg).
    pub lat0_deg: f64,
    /// Longitude of the first column (deg).
    pub lon0_deg: f64,
    /// Latitude step between rows (deg, > 0).
    pub dlat_deg: f64,
    /// Longitude step between columns (deg, > 0).
    pub dlon_deg: f64,
    /// Number of latitude rows.
    pub n_lat: usize,
    /// Number of longitude columns.
    pub n_lon: usize,
    /// Vertical TEC (TECU), `vtec[i*n_lon + j]` at `(lat0 + i·dlat, lon0 + j·dlon)`.
    pub vtec: Vec<f64>,
}

impl TecGrid {
    /// The grid node value at row `i`, column `j`.
    pub fn node(&self, i: usize, j: usize) -> f64 {
        self.vtec[i * self.n_lon + j]
    }

    /// Bilinearly interpolated vertical TEC (TECU) at `(lat, lon)` in degrees. Queries
    /// outside the grid are clamped to the nearest edge (no extrapolation).
    pub fn vtec_at(&self, lat_deg: f64, lon_deg: f64) -> f64 {
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

    /// Ionospheric delay (m) at a pierce point for a given carrier frequency.
    pub fn delay_at(&self, lat_deg: f64, lon_deg: f64, frequency_hz: f64) -> f64 {
        vtec_to_delay_m(self.vtec_at(lat_deg, lon_deg), frequency_hz)
    }
}

/// Locate the lower cell index `i0` and the in-cell fraction `f ∈ [0,1]` for a coordinate
/// on a regular axis, clamped so that `i0` and `i0+1` are valid (`n ≥ 2`). Promoted to
/// `pub(crate)` so the [`crate::altpnt::terrain`] DEM grid reuses the identical clamp helper
/// rather than copy-pasting the body (one shared definition, no divergent edge handling).
pub(crate) fn cell(x: f64, x0: f64, dx: f64, n: usize) -> (usize, f64) {
    // A degenerate grid with a single sample along this axis (n < 2) has no interval to
    // interpolate within; `clamp(0, n-2)` would be `clamp(0, -1)` and panic (min > max). Pin to
    // the only cell with a zero fraction instead.
    if n < 2 {
        return (0, 0.0);
    }
    let t = (x - x0) / dx;
    let i = t.floor();
    let i0 = (i as isize).clamp(0, n as isize - 2) as usize;
    let f = (t - i0 as f64).clamp(0.0, 1.0);
    (i0, f)
}

// ── IONEX file parsing, time interpolation, and the slant obliquity mapping ───────────

/// A single IONEX TEC map: its epoch (seconds of day) and the vertical-TEC grid.
#[derive(Clone, Debug)]
pub struct IonexMap {
    /// Epoch of the map as seconds of day (`hh·3600 + mm·60 + ss`).
    pub epoch_sod: f64,
    /// The vertical-TEC grid.
    pub grid: TecGrid,
}

/// The label field of an IONEX record begins at column 60.
fn ionex_label(line: &str) -> &str {
    if line.len() >= 60 {
        line[60..].trim()
    } else {
        ""
    }
}

fn nums_before_label(line: &str) -> Vec<f64> {
    let body = &line[..line.len().min(60)];
    body.split_whitespace()
        .filter_map(|t| t.parse().ok())
        .collect()
}

/// Parse an IONEX (IONosphere map EXchange) text into its sequence of TEC maps. Reads the
/// header grid definition (`LAT1 / LAT2 / DLAT`, `LON1 / LON2 / DLON`, `EXPONENT`) and each
/// `START OF TEC MAP … END OF TEC MAP` block, normalising the latitude rows to increasing
/// order so the resulting [`TecGrid`] keeps positive steps (IONEX lists latitude north-to-south
/// with a negative `DLAT`). Vertical-TEC values are whitespace-separated and scaled by
/// `10^EXPONENT` to TECU. Returns `None` on a malformed header or a map whose value count does
/// not match the grid.
pub fn parse_ionex(text: &str) -> Option<Vec<IonexMap>> {
    let mut lat1 = None;
    let mut lat2 = None;
    let mut dlat = None;
    let mut lon1 = None;
    let mut lon2 = None;
    let mut dlon = None;
    let mut exponent: i32 = 0;
    let mut lines = text.lines();

    for line in lines.by_ref() {
        let nums = nums_before_label(line);
        match ionex_label(line) {
            "LAT1 / LAT2 / DLAT" => {
                lat1 = nums.first().copied();
                lat2 = nums.get(1).copied();
                dlat = nums.get(2).copied();
            }
            "LON1 / LON2 / DLON" => {
                lon1 = nums.first().copied();
                lon2 = nums.get(1).copied();
                dlon = nums.get(2).copied();
            }
            "EXPONENT" => exponent = nums.first().copied().unwrap_or(0.0) as i32,
            "END OF HEADER" => break,
            _ => {}
        }
    }
    let (lat1, lat2, dlat, lon1, lon2, dlon) = (lat1?, lat2?, dlat?, lon1?, lon2?, dlon?);
    if dlat == 0.0 || dlon == 0.0 {
        return None;
    }
    let n_lat = ((lat2 - lat1) / dlat).round() as i64 + 1;
    let n_lon = ((lon2 - lon1) / dlon).round() as i64 + 1;
    if n_lat < 2 || n_lon < 2 {
        return None;
    }
    let (n_lat, n_lon) = (n_lat as usize, n_lon as usize);
    let scale = 10f64.powi(exponent);

    let mut maps = Vec::new();
    let mut in_map = false;
    let mut in_band = false;
    let mut epoch_sod = 0.0;
    let mut vals: Vec<f64> = Vec::new();
    for line in lines {
        match ionex_label(line) {
            "START OF TEC MAP" => {
                in_map = true;
                in_band = false;
                vals.clear();
            }
            "EPOCH OF CURRENT MAP" => {
                let e = nums_before_label(line);
                let h = e.get(3).copied().unwrap_or(0.0);
                let m = e.get(4).copied().unwrap_or(0.0);
                let s = e.get(5).copied().unwrap_or(0.0);
                epoch_sod = h * 3600.0 + m * 60.0 + s;
            }
            "LAT/LON1/LON2/DLON/H" => in_band = true,
            "END OF TEC MAP" => {
                if vals.len() != n_lat * n_lon {
                    return None;
                }
                let grid = build_grid(lat1, lat2, dlat, lon1, dlon, n_lat, n_lon, &vals);
                maps.push(IonexMap { epoch_sod, grid });
                in_map = false;
                in_band = false;
            }
            "" if in_map && in_band => {
                for t in nums_before_label(line) {
                    vals.push(t * scale);
                }
            }
            _ => {}
        }
    }
    Some(maps)
}

/// Build a positive-step [`TecGrid`] from the file-order (north-to-south) value rows, reversing
/// the latitude rows when `DLAT` is negative so the stored grid runs south-to-north.
#[allow(clippy::too_many_arguments)]
fn build_grid(
    lat1: f64,
    lat2: f64,
    dlat: f64,
    lon1: f64,
    dlon: f64,
    n_lat: usize,
    n_lon: usize,
    vals: &[f64],
) -> TecGrid {
    let reverse = dlat < 0.0;
    let lat0 = if reverse { lat2 } else { lat1 };
    let mut vtec = vec![0.0; n_lat * n_lon];
    for (i, row) in vtec.chunks_mut(n_lon).enumerate() {
        let src = if reverse { n_lat - 1 - i } else { i };
        row.copy_from_slice(&vals[src * n_lon..src * n_lon + n_lon]);
    }
    TecGrid {
        lat0_deg: lat0,
        lon0_deg: lon1,
        dlat_deg: dlat.abs(),
        dlon_deg: dlon.abs(),
        n_lat,
        n_lon,
        vtec,
    }
}

/// Linearly interpolate the vertical TEC between two same-shaped maps at epochs `ta` and `tb`
/// to the query epoch `t` (clamped to `[ta, tb]`). Returns `None` if the grids differ in shape.
pub fn interpolate_tec_in_time(
    a: &TecGrid,
    b: &TecGrid,
    ta: f64,
    tb: f64,
    t: f64,
) -> Option<TecGrid> {
    if a.n_lat != b.n_lat || a.n_lon != b.n_lon || a.vtec.len() != b.vtec.len() {
        return None;
    }
    let w = if (tb - ta).abs() < 1e-12 {
        0.0
    } else {
        ((t - ta) / (tb - ta)).clamp(0.0, 1.0)
    };
    let vtec = a
        .vtec
        .iter()
        .zip(&b.vtec)
        .map(|(&x, &y)| x + (y - x) * w)
        .collect();
    Some(TecGrid { vtec, ..a.clone() })
}

/// Mean Earth radius used in the single-layer (thin-shell) ionosphere mapping (km).
pub const IONO_SHELL_RE_KM: f64 = 6371.0;

/// Single-layer (thin-shell) **obliquity / mapping factor** `M(z) = 1/cos(z′)` that converts a
/// vertical delay to the slant delay along a ray at zenith angle `zenith_deg`, with the
/// ionospheric shell at `iono_height_km`. The ray pierces the shell at the reduced zenith angle
/// `z′` where `sin z′ = (Rₑ/(Rₑ+H))·sin z`. Unity at the zenith, growing toward the horizon.
pub fn obliquity_factor(zenith_deg: f64, iono_height_km: f64) -> f64 {
    let z = zenith_deg.to_radians();
    let ratio = IONO_SHELL_RE_KM / (IONO_SHELL_RE_KM + iono_height_km);
    let sin_zp = (ratio * z.sin()).clamp(-1.0, 1.0);
    1.0 / sin_zp.asin().cos()
}

/// Slant TEC (TECU) along a ray: the vertical TEC scaled by the [`obliquity_factor`].
pub fn slant_tec(vtec_tecu: f64, zenith_deg: f64, iono_height_km: f64) -> f64 {
    vtec_tecu * obliquity_factor(zenith_deg, iono_height_km)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn grid() -> TecGrid {
        // 3×3 grid from (0°,0°) at 10° spacing; TEC = 10·i + j (so nodes are distinct).
        let mut vtec = Vec::new();
        for i in 0..3 {
            for j in 0..3 {
                vtec.push(10.0 * i as f64 + j as f64);
            }
        }
        TecGrid {
            lat0_deg: 0.0,
            lon0_deg: 0.0,
            dlat_deg: 10.0,
            dlon_deg: 10.0,
            n_lat: 3,
            n_lon: 3,
            vtec,
        }
    }

    #[test]
    fn delay_is_40_3_tec_over_f_squared() {
        // 1 TECU at L1 ≈ 0.16237 m; the delay scales as 1/f² (L2 is larger than L1).
        let l1 = vtec_to_delay_m(1.0, GPS_L1_HZ);
        assert!((l1 - 0.162_37).abs() < 1e-4, "L1 delay = {l1} m");
        let l2 = vtec_to_delay_m(1.0, GPS_L2_HZ);
        assert!((l2 / l1 - (GPS_L1_HZ / GPS_L2_HZ).powi(2)).abs() < 1e-9);
        assert!(l2 > l1, "L2 delay {l2} should exceed L1 {l1}");
        // Linear in TEC.
        assert!((vtec_to_delay_m(10.0, GPS_L1_HZ) - 10.0 * l1).abs() < 1e-12);
    }

    #[test]
    fn interpolation_is_exact_at_nodes() {
        let g = grid();
        assert!((g.vtec_at(0.0, 0.0) - 0.0).abs() < 1e-12);
        assert!((g.vtec_at(10.0, 20.0) - 12.0).abs() < 1e-12); // node (1,2) = 10·1+2
        assert!((g.vtec_at(20.0, 10.0) - 21.0).abs() < 1e-12);
    }

    #[test]
    fn bilinear_midpoints_average_the_corners() {
        let g = grid();
        // Cell-centre of the (0,0)-(1,1) cell: average of nodes 0,1,10,11 = 5.5.
        assert!(
            (g.vtec_at(5.0, 5.0) - 5.5).abs() < 1e-12,
            "centre = {}",
            g.vtec_at(5.0, 5.0)
        );
        // Edge midpoint between nodes (0,0)=0 and (0,1)=1 → 0.5.
        assert!((g.vtec_at(0.0, 5.0) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn queries_outside_the_grid_clamp_to_the_edge() {
        let g = grid();
        // Far south-west clamps to node (0,0).
        assert!((g.vtec_at(-90.0, -90.0) - 0.0).abs() < 1e-12);
        // Far north-east clamps to node (2,2) = 22.
        assert!((g.vtec_at(90.0, 90.0) - 22.0).abs() < 1e-12);
        // delay_at composes cleanly without panicking.
        assert!(g.delay_at(5.0, 5.0, GPS_L1_HZ) > 0.0);
    }

    // Build an IONEX record line: data in the first 60 columns, label from column 60.
    fn rec(data: &str, label: &str) -> String {
        format!("{data:<60}{label}")
    }

    // A minimal but format-valid IONEX: a 3×4 grid (lat 10/0/−10 north-to-south, dlat −10;
    // lon 0…30, dlon 10), EXPONENT −1, one map at 02:00:00 with TEC in 0.1-TECU integers.
    fn sample_ionex() -> String {
        [
            rec("1.0    IONOSPHERE MAPS     GPS", "IONEX VERSION / TYPE"),
            rec("10.0 -10.0 -10.0", "LAT1 / LAT2 / DLAT"),
            rec("0.0 30.0 10.0", "LON1 / LON2 / DLON"),
            rec("-1", "EXPONENT"),
            rec("", "END OF HEADER"),
            rec("1", "START OF TEC MAP"),
            rec("2020 1 1 2 0 0", "EPOCH OF CURRENT MAP"),
            rec("10.0 0.0 30.0 10.0 450.0", "LAT/LON1/LON2/DLON/H"),
            rec("100 110 120 130", ""),
            rec("0.0 0.0 30.0 10.0 450.0", "LAT/LON1/LON2/DLON/H"),
            rec("200 210 220 230", ""),
            rec("-10.0 0.0 30.0 10.0 450.0", "LAT/LON1/LON2/DLON/H"),
            rec("300 310 320 330", ""),
            rec("1", "END OF TEC MAP"),
        ]
        .join("\n")
    }

    #[test]
    fn parse_ionex_reads_grid_epoch_and_normalises_latitude() {
        let maps = parse_ionex(&sample_ionex()).expect("valid IONEX");
        assert_eq!(maps.len(), 1);
        assert_eq!(maps[0].epoch_sod, 2.0 * 3600.0);
        let g = &maps[0].grid;
        assert_eq!((g.n_lat, g.n_lon), (3, 4));
        // Stored south-to-north with positive steps despite the file's negative DLAT.
        assert_eq!(g.lat0_deg, -10.0);
        assert_eq!(g.dlat_deg, 10.0);
        // Values scaled by 10^−1. The northern row (lat 10) is the file's first band.
        assert!((g.vtec_at(10.0, 20.0) - 12.0).abs() < 1e-12); // 120 × 0.1
        assert!((g.vtec_at(-10.0, 0.0) - 30.0).abs() < 1e-12); // 300 × 0.1
        assert!((g.vtec_at(0.0, 10.0) - 21.0).abs() < 1e-12); // 210 × 0.1
    }

    #[test]
    fn time_interpolation_blends_successive_maps() {
        let a = grid(); // nodes 0..22
        let mut b = grid();
        for v in b.vtec.iter_mut() {
            *v += 10.0; // a uniformly higher map two hours later
        }
        // Halfway between the two epochs ⇒ the average of the two maps.
        let mid = interpolate_tec_in_time(&a, &b, 0.0, 7200.0, 3600.0).expect("same shape");
        assert!((mid.vtec_at(10.0, 10.0) - (11.0 + 21.0) / 2.0).abs() < 1e-12);
        // Clamped before the first / after the last epoch.
        let before = interpolate_tec_in_time(&a, &b, 0.0, 7200.0, -100.0).unwrap();
        assert!((before.vtec_at(10.0, 10.0) - 11.0).abs() < 1e-12);
    }

    #[test]
    fn obliquity_maps_vertical_to_slant() {
        // A ray straight up sees the vertical TEC unchanged; a low ray sees more.
        assert!((obliquity_factor(0.0, 350.0) - 1.0).abs() < 1e-12);
        let m60 = obliquity_factor(60.0, 350.0);
        assert!(m60 > 1.0, "M(60°) = {m60}");
        assert!((slant_tec(10.0, 60.0, 350.0) - 10.0 * m60).abs() < 1e-12);
        // The reduced zenith angle keeps the factor finite even near the horizon.
        assert!(obliquity_factor(89.0, 350.0).is_finite());
    }
}
