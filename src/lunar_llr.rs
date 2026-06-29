// SPDX-License-Identifier: AGPL-3.0-only
//! LLR (Lunar Laser Ranging) geometry catalog for the datum-defect Fisher analysis.
//!
//! Provides the five near-side retroreflectors and four active LLR ground stations
//! as hard-coded catalogs that are WASM-safe (no filesystem I/O). The committed
//! CSV fixtures under `tests/fixtures/llr_geometry/` are the human-auditable
//! provenance copy; the functions here are the runtime source.
//!
//! # Retroreflector coordinates
//! PA (principal-axis) body-frame Cartesian positions in metres, derived from the
//! DE440 LLR reflector solution (Park et al. 2021, AJ 161:105; Williams et al. 2008)
//! by converting selenographic lat/lon to Cartesian on a sphere of radius 1737.4 km:
//! `x = R·cos(φ)·cos(λ)`, `y = R·cos(φ)·sin(λ)`, `z = R·sin(φ)`.
//!
//! # Station coordinates
//! ILRS geodetic coordinates (ITRF-aligned) for Grasse OCA, APOLLO/APO,
//! Wettzell WLRS, and Matera MLRO.

/// Three-element Cartesian vector (metres in body-frame or ECEF context).
pub type Vec3 = [f64; 3];

/// A lunar retroreflector with its PA body-frame Cartesian position.
pub struct Reflector {
    /// Short mission name (e.g. `"Apollo11"`).
    pub name: &'static str,
    /// PA body-frame position [x, y, z] in metres.
    pub pa_body_m: Vec3,
}

/// An LLR ground station with geodetic coordinates.
pub struct Station {
    /// Station name / acronym (e.g. `"Grasse"`).
    pub name: &'static str,
    /// Geodetic latitude in degrees (positive North).
    pub lat_deg: f64,
    /// Geodetic longitude in degrees (positive East).
    pub lon_deg: f64,
    /// Geodetic altitude above the reference ellipsoid in metres.
    pub alt_m: f64,
}

/// Returns the five near-side LLR retroreflectors in PA body-frame Cartesian metres.
///
/// Coordinates match `tests/fixtures/llr_geometry/reflectors.csv` (SHA-256
/// b400df1e9f8e912a9ac73417c6a0b68bb800dc66ea7b3c5c22d87e8f428480ad).
pub fn reflectors() -> Vec<Reflector> {
    vec![
        Reflector {
            name: "Apollo11",
            pa_body_m: [1_593_553.737, 691_904.978, 20_316.182],
        },
        Reflector {
            name: "Apollo14",
            pa_body_m: [1_653_827.004, -520_815.036, -110_302.763],
        },
        Reflector {
            name: "Apollo15",
            pa_body_m: [1_556_703.214, 98_757.806, 765_167.145],
        },
        Reflector {
            name: "Lunokhod1",
            pa_body_m: [1_116_735.653, -781_946.722, 1_077_042.044],
        },
        Reflector {
            name: "Lunokhod2",
            pa_body_m: [1_341_576.667, 803_553.242, 756_989.429],
        },
    ]
}

/// Returns the four active LLR ground stations with ILRS geodetic coordinates.
///
/// Coordinates match `tests/fixtures/llr_geometry/stations.csv` (SHA-256
/// 945cdc3c5c2c5f1721df2f59bf4549005f152a98a9cf86936d2abe880295f416).
pub fn stations() -> Vec<Station> {
    vec![
        Station {
            name: "Grasse",
            lat_deg: 43.7546,
            lon_deg: 6.9215,
            alt_m: 1320.0,
        },
        Station {
            name: "APOLLO",
            lat_deg: 32.780,
            lon_deg: -105.820,
            alt_m: 2780.0,
        },
        Station {
            name: "Wettzell",
            lat_deg: 49.1450,
            lon_deg: 12.8780,
            alt_m: 665.0,
        },
        Station {
            name: "Matera",
            lat_deg: 40.6486,
            lon_deg: 16.7046,
            alt_m: 537.0,
        },
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn reflector_and_station_catalogs_are_well_formed() {
        let r = reflectors();
        assert_eq!(r.len(), 5, "five near-side LLR reflectors");
        // PA body coordinates lie on a ~1737.4 km sphere to within topography (a few km).
        for refl in &r {
            let radius =
                (refl.pa_body_m[0].powi(2) + refl.pa_body_m[1].powi(2) + refl.pa_body_m[2].powi(2))
                    .sqrt();
            assert!(
                (radius - 1_737_400.0).abs() < 10_000.0,
                "{} radius {radius}",
                refl.name
            );
        }
        let s = stations();
        assert_eq!(s.len(), 4, "four LLR stations");
        assert!(s
            .iter()
            .all(|st| st.lat_deg.abs() <= 90.0 && st.lon_deg.abs() <= 180.0));
    }
}
