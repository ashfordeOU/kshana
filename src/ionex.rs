// SPDX-License-Identifier: Apache-2.0
//! IONEX-style total-electron-content (TEC) maps and the ionospheric range delay.
//!
//! The shipped Klobuchar model (in [`crate::gnss_sim`]) is the *broadcast* single-frequency
//! ionosphere correction. This module adds the *measured* alternative: an IGS global
//! ionosphere map (GIM) as a regular latitude/longitude grid of vertical TEC, with bilinear
//! interpolation at an ionospheric pierce point, and the first-order delay
//! `Δ = 40.3·TEC/f²` (TEC in electrons/m², `f` in Hz).
//!
//! Scope (honest): the grid model and interpolation ship here; parsing the IONEX file
//! format itself, the time interpolation between successive maps, and the slant
//! (obliquity) mapping function are follow-ons (see `ROADMAP.md`).

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
/// on a regular axis, clamped so that `i0` and `i0+1` are valid (`n ≥ 2`).
fn cell(x: f64, x0: f64, dx: f64, n: usize) -> (usize, f64) {
    let t = (x - x0) / dx;
    let i = t.floor();
    let i0 = (i as isize).clamp(0, n as isize - 2) as usize;
    let f = (t - i0 as f64).clamp(0.0, 1.0);
    (i0, f)
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
}
