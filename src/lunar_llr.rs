// SPDX-License-Identifier: AGPL-3.0-only
//! LLR (Lunar Laser Ranging) geometry catalog for the datum-defect Fisher analysis.
//!
//! Provides the five near-side retroreflectors and four active LLR ground stations
//! as hard-coded catalogs that are WASM-safe (no filesystem I/O). The committed
//! CSV fixtures under `tests/fixtures/llr_geometry/` are the human-auditable
//! provenance copy; the functions here are the runtime source.
//!
//! # Retroreflector coordinates
//! PA (principal-axis) body-frame Cartesian positions in metres, taken directly from
//! the DE440 LLR reflector solution: Park, R. S. et al. (2021) "The JPL Planetary and
//! Lunar Ephemerides DE440 and DE441", AJ 161:105, Table 1 (doi:10.3847/1538-3881/abd414).
//!
//! # Station coordinates
//! ILRS geodetic coordinates (ITRF-aligned) for Grasse OCA, APOLLO/APO,
//! Wettzell WLRS, and Matera MLRO.

/// Three-element Cartesian vector (metres in body-frame or ECEF context).
pub type Vec3 = [f64; 3];

/// A lunar retroreflector with its PA body-frame Cartesian position.
#[derive(Debug, Clone, Copy)]
pub struct Reflector {
    /// Short mission name (e.g. `"Apollo11"`).
    pub name: &'static str,
    /// PA body-frame position [x, y, z] in metres.
    pub pa_body_m: Vec3,
}

/// An LLR ground station with geodetic coordinates.
#[derive(Debug, Clone, Copy)]
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
/// 760b8a9b846b5d142add68381a5e92ac219094c4ef03f9ae349b9b06b904a8d1).
pub fn reflectors() -> Vec<Reflector> {
    vec![
        Reflector {
            name: "Apollo11",
            pa_body_m: [1_591_967.049, 690_698.573, 21_004.461],
        },
        Reflector {
            name: "Apollo14",
            pa_body_m: [1_652_689.369, -520_998.431, -109_729.869],
        },
        Reflector {
            name: "Apollo15",
            pa_body_m: [1_554_678.104, 98_094.498, 765_005.863],
        },
        Reflector {
            name: "Lunokhod1",
            pa_body_m: [1_114_291.452, -781_299.273, 1_076_059.049],
        },
        Reflector {
            name: "Lunokhod2",
            pa_body_m: [1_339_363.598, 801_870.995, 756_359.260],
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

/// Reflector PA body coordinates → geocentric inertial position [m].
///
/// `r_inertial = r_moon_geocentric + R_body→inertial(t) · pa_body`
///
/// Uses `crate::ephem::moon_position` for the geocentric Moon position and
/// `crate::lunar::mcmf_to_mci` for the PA body → MCI rotation.
pub fn reflector_inertial(pa_body_m: Vec3, t_tt_jc: f64) -> Vec3 {
    let r_moon = crate::ephem::moon_position(t_tt_jc); // geocentric inertial [m]
    let seconds = t_tt_jc * 36_525.0 * 86_400.0; // seconds since J2000 for mean-rotation model
    let r_body_in_inertial = crate::lunar::mcmf_to_mci(pa_body_m, seconds);
    [
        r_moon[0] + r_body_in_inertial[0],
        r_moon[1] + r_body_in_inertial[1],
        r_moon[2] + r_body_in_inertial[2],
    ]
}

/// One-way geometric Earth-station → reflector range [m].
///
/// Two-way range = 2 × this; the factor cancels in the Fisher correlation (documented in Task 6).
pub fn llr_range_m(station: &Station, refl_pa_body_m: Vec3, t_tt_jc: f64, jd_ut1: f64) -> f64 {
    let jd_tt = t_tt_jc * 36_525.0 + 2_451_545.0;
    let g = crate::frames::Geodetic {
        lat_rad: station.lat_deg.to_radians(),
        lon_rad: station.lon_deg.to_radians(),
        alt_m: station.alt_m,
    };
    let r_sta = crate::lunar_vlbi::station_inertial_position(g, jd_tt, jd_ut1);
    let r_ref = reflector_inertial(refl_pa_body_m, t_tt_jc);
    let d = [
        r_ref[0] - r_sta[0],
        r_ref[1] - r_sta[1],
        r_ref[2] - r_sta[2],
    ];
    (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn llr_one_way_range_is_earth_moon_scale() {
        // 2024-01-01 12:00 TT ≈ JD 2460311.0; t in Julian centuries from J2000.
        let t_tt_jc = (2_460_311.0 - 2_451_545.0) / 36_525.0;
        let jd_ut1 = 2_460_311.0;
        let st = &stations()[0];
        let refl = reflectors()[2].pa_body_m; // Apollo 15
        let rng = llr_range_m(st, refl, t_tt_jc, jd_ut1);
        // Earth-Moon distance: perigee ~356,500 km to apogee ~406,700 km; surface station + reflector add <1e4 km.
        assert!(
            (3.4e8..4.2e8).contains(&rng),
            "one-way LLR range {rng} m out of Earth-Moon band"
        );
    }

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
