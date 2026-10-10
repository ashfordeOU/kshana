// SPDX-License-Identifier: AGPL-3.0-only
//! Fixed latitude/longitude cell grid.
//!
//! A cell is `cell_deg` degrees on each side. East-west extent shrinks with latitude
//! (about 55 km at 0.5 degrees at the equator, about 28 km at 60 degrees north); the
//! method documents this and the cell index is stable, so maps from different days line up.

/// Integer cell index: `i` counts latitude cells up from -90, `j` longitude cells up from -180.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct CellId {
    /// Latitude cell index, counted up from -90 degrees.
    pub i: i32,
    /// Longitude cell index, counted up from -180 degrees.
    pub j: i32,
}

#[derive(Debug, Clone, Copy, PartialEq)]
/// A fixed latitude/longitude grid of square cells.
pub struct Grid {
    /// Cell side in degrees.
    pub cell_deg: f64,
}

/// The cell size of the pre-registered methods. Any other size is a different method.
pub const PREREGISTERED_CELL_DEG: f64 = 0.5;

/// Mean Earth radius in metres.
pub const EARTH_RADIUS_M: f64 = 6_371_008.8;

impl Grid {
    /// A grid of the given cell size, or `None` outside 0.01 to 10 degrees.
    pub fn new(cell_deg: f64) -> Option<Self> {
        if cell_deg.is_finite() && (0.01..=10.0).contains(&cell_deg) {
            Some(Self { cell_deg })
        } else {
            None
        }
    }

    /// The cell containing a latitude and longitude (degrees).
    pub fn cell_of(&self, lat: f64, lon: f64) -> CellId {
        // Latitude 90 belongs to the last row, not a row past the pole; longitude 180 is
        // the same meridian as -180.
        let rows = (180.0 / self.cell_deg).ceil() as i32;
        let lon = if lon >= 180.0 { lon - 360.0 } else { lon };
        CellId {
            i: (((lat + 90.0) / self.cell_deg).floor() as i32).min(rows - 1),
            j: ((lon + 180.0) / self.cell_deg).floor() as i32,
        }
    }

    /// `(south, west, north, east)` in degrees.
    pub fn bounds(&self, c: CellId) -> (f64, f64, f64, f64) {
        let s = c.i as f64 * self.cell_deg - 90.0;
        let w = c.j as f64 * self.cell_deg - 180.0;
        // The last row or column is narrower when the cell size does not divide 180 or 360.
        (
            s,
            w,
            (s + self.cell_deg).min(90.0),
            (w + self.cell_deg).min(180.0),
        )
    }

    /// The `(lat, lon)` centre of a cell.
    pub fn center(&self, c: CellId) -> (f64, f64) {
        let (s, w, n, e) = self.bounds(c);
        ((s + n) / 2.0, (w + e) / 2.0)
    }
}

/// Great-circle distance in metres (haversine).
pub fn haversine_m(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> f64 {
    let (p1, p2) = (lat1.to_radians(), lat2.to_radians());
    let dp = p2 - p1;
    let dl = (lon2 - lon1).to_radians();
    let a = (dp / 2.0).sin().powi(2) + p1.cos() * p2.cos() * (dl / 2.0).sin().powi(2);
    2.0 * EARTH_RADIUS_M * a.sqrt().min(1.0).asin()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn cells_are_stable_and_contain_their_points() {
        let g = Grid::new(0.5).unwrap();
        let c = g.cell_of(59.76, 24.9);
        let (s, w, n, e) = g.bounds(c);
        assert!(s <= 59.76 && 59.76 < n && w <= 24.9 && 24.9 < e);
        assert_eq!(g.cell_of(-90.0, -180.0), CellId { i: 0, j: 0 });
        assert!(Grid::new(0.0).is_none() && Grid::new(f64::NAN).is_none());
    }

    #[test]
    fn the_pole_and_the_antimeridian_stay_inside_the_grid() {
        let g = Grid::new(0.5).unwrap();
        assert_eq!(g.cell_of(90.0, 0.0).i, 359);
        assert_eq!(g.cell_of(0.0, 180.0), g.cell_of(0.0, -180.0));
        assert_eq!(g.cell_of(0.0, 180.0).j, 0);
        assert_eq!(g.cell_of(0.0, 179.99).j, 719);
        // A size that does not divide 180: 0.07 gives 2572 rows, the last one partial.
        let g = Grid::new(0.07).unwrap();
        let c = g.cell_of(90.0, 10.0);
        let (s, _, n, _) = g.bounds(c);
        assert!(s < 90.0 && n == 90.0, "{s} {n}");
        assert_eq!(c.i, (180.0_f64 / 0.07).ceil() as i32 - 1);
    }

    #[test]
    fn haversine_one_degree_of_latitude() {
        let d = haversine_m(0.0, 0.0, 1.0, 0.0);
        assert!((d - 111_195.0).abs() < 50.0, "{d}");
    }
}
