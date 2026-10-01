// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-look-angles-xval`: the ANISE oracle for the per-satellite look angles and slant
//! range a lunar surface user sees (the matrix row "Lunar joint communications-and-navigation
//! geometry").
//!
//! This binary calls NO Kshana function. It uses ANISE 0.10.2 (Nyx Space, MPL-2.0) alone:
//!
//! 1. the Moon's shape and GM from NAIF `pck00011.tpc` and `gm_de440.tpc`
//!    (`anise::naif::kpl::parser::convert_tpc`);
//! 2. eight lunar satellites as two-body Keplerian orbits in Moon J2000
//!    (`Orbit::try_keplerian_mean_anomaly`, `Orbit::at_epoch`), rotated into the DE440
//!    principal-axis frame MOON_PA_DE440 through the binary PCK
//!    `moon_pa_de440_200625.bpc` (`Almanac::transform_to`);
//! 3. each surface site from `Orbit::try_latlongalt` on the pck00011 Moon;
//! 4. azimuth, elevation and range from `Almanac::azimuth_elevation_range_sez` (no
//!    aberration correction, no obstruction test).
//!
//! It writes, per (site, epoch, satellite): the site and the satellite in MOON_PA_DE440 (km)
//! and ANISE's azimuth, elevation (deg) and range (km), all as 17 significant digits, to
//! `tests/fixtures/lunar_service_geometry_oracle/anise_look_angles_reference.txt`.
//!
//! Pre-registered tolerances (fixed before the first comparison, and checked by
//! `tests/lunar_service_geometry_oracle.rs`): site position 1 mm per axis; azimuth and
//! elevation 1e-6 deg; range 1 mm.
//!
//! Kernels: `$KSHANA_ORACLES/data/naif/{de440s.bsp, moon_pa_de440_200625.bpc, pck00011.tpc,
//! gm_de440.tpc}` (`source ~/Code/kshana-oracles/env.sh` first).
//!
//! Run: `cargo run --release --bin lunar-look-angles-xval` in this crate.

use anise::constants::frames::{MOON_J2000, MOON_PA_DE440_FRAME};
use anise::naif::kpl::parser::convert_tpc;
use anise::prelude::{Almanac, Orbit};
use hifitime::{Epoch, Unit};
use std::io::Write;
use std::path::PathBuf;

/// Sites: (label, latitude deg, longitude deg). The first four are Kshana's named sites
/// (typed here as inputs; the test checks they still match `lunar::NAMED_SITES`).
const SITES: [(&str, f64, f64); 8] = [
    ("shackleton", -89.67, 129.78),
    ("apollo11", 0.674_08, 23.472_97),
    ("apollo15", 26.1322, 3.6339),
    ("apollo16", -8.9730, 15.5002),
    ("equator0", 0.0, 0.0),
    ("n45w90", 45.0, -90.0),
    ("s30e170", -30.0, 170.0),
    ("n60w120", 60.0, -120.0),
];

/// Satellites: (sma km, ecc, inc deg, raan deg, aop deg, mean anomaly deg at the first epoch).
const SATS: [(f64, f64, f64, f64, f64, f64); 8] = [
    (1_837.4, 0.001, 89.5, 0.0, 0.0, 0.0),
    (1_837.4, 0.01, 85.0, 120.0, 30.0, 200.0),
    (2_237.4, 0.05, 30.0, 45.0, 90.0, 10.0),
    (3_737.4, 0.1, 60.0, 270.0, 180.0, 300.0),
    (6_142.4, 0.6, 57.7, 0.0, 90.0, 0.0),
    (9_737.4, 0.6, 57.7, 90.0, 90.0, 90.0),
    (9_737.4, 0.6, 57.7, 180.0, 270.0, 180.0),
    (5_000.0, 0.3, 120.0, 330.0, 45.0, 135.0),
];

fn naif(name: &str) -> PathBuf {
    let root = std::env::var("KSHANA_ORACLES")
        .unwrap_or_else(|_| format!("{}/Code/kshana-oracles", std::env::var("HOME").unwrap()));
    PathBuf::from(root).join("data").join("naif").join(name)
}

fn main() {
    let pck = naif("pck00011.tpc");
    let gm = naif("gm_de440.tpc");
    let planetary = convert_tpc(pck.to_str().unwrap(), gm.to_str().unwrap())
        .expect("convert pck00011.tpc + gm_de440.tpc");
    let almanac = Almanac::default()
        .load(naif("de440s.bsp").to_str().unwrap())
        .expect("load de440s.bsp")
        .load(naif("moon_pa_de440_200625.bpc").to_str().unwrap())
        .expect("load moon_pa_de440_200625.bpc")
        .with_planetary_data(planetary);

    let moon_j2000 = almanac
        .frame_info(MOON_J2000)
        .expect("Moon J2000 frame data");
    let moon_pa = almanac
        .frame_info(MOON_PA_DE440_FRAME)
        .expect("Moon PA frame data");
    let r_eq = moon_pa.semi_major_radius_km().unwrap();
    let flat = moon_pa.flattening().unwrap();
    let mu = moon_j2000.mu_km3_s2().unwrap();

    let e0 = Epoch::from_gregorian_hms(2025, 1, 1, 0, 0, 0, hifitime::TimeScale::TDB);
    let epochs: Vec<Epoch> = (0..12)
        .map(|k| e0 + Unit::Hour * (29.0 * k as f64))
        .collect();

    let out_path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("../../tests/fixtures/lunar_service_geometry_oracle/anise_look_angles_reference.txt");
    std::fs::create_dir_all(out_path.parent().unwrap()).unwrap();
    let mut f = std::fs::File::create(&out_path).expect("create fixture");
    writeln!(
        f,
        "# ANISE 0.10.2 look angles from lunar surface sites, MOON_PA_DE440 frame\n\
         # generator: xval/anise-service-geometry/src/bin/lunar_look_angles.rs (calls no Kshana code)\n\
         # kernels: de440s.bsp, moon_pa_de440_200625.bpc, pck00011.tpc, gm_de440.tpc (SHA-256 in NOTICE.md)\n\
         # Moon from pck00011: semi-major radius {r_eq:.6} km, flattening {flat:.3e}; GM from gm_de440: {mu:.10} km^3/s^2\n\
         # tolerances fixed before comparison: site 1 mm per axis; az, el 1e-6 deg; range 1 mm\n\
         # columns: site lat_deg lon_deg epoch_tdb sat site_x site_y site_z sat_x sat_y sat_z (km, MOON_PA_DE440) az_deg el_deg range_km"
    )
    .unwrap();

    let mut n = 0usize;
    for (label, lat, lon) in SITES {
        for epoch in &epochs {
            let site = Orbit::try_latlongalt(lat, lon, 0.0, *epoch, moon_pa).expect("site");
            for (k, (sma, ecc, inc, raan, aop, ma)) in SATS.iter().enumerate() {
                let sat0 = Orbit::try_keplerian_mean_anomaly(
                    *sma, *ecc, *inc, *raan, *aop, *ma, e0, moon_j2000,
                )
                .expect("keplerian");
                let sat_i = sat0.at_epoch(*epoch).expect("two-body propagation");
                let sat = almanac
                    .transform_to(sat_i, moon_pa, None)
                    .expect("Moon J2000 -> MOON_PA_DE440");
                let aer = almanac
                    .azimuth_elevation_range_sez(sat, site, None, None)
                    .expect("AER");
                let s = site.radius_km;
                let p = sat.radius_km;
                writeln!(
                    f,
                    "{label} {lat:.17e} {lon:.17e} {} {k} {:.16e} {:.16e} {:.16e} {:.16e} {:.16e} {:.16e} {:.16e} {:.16e} {:.16e}",
                    epoch.to_tdb_seconds(),
                    s.x,
                    s.y,
                    s.z,
                    p.x,
                    p.y,
                    p.z,
                    aer.azimuth_deg,
                    aer.elevation_deg,
                    aer.range_km
                )
                .unwrap();
                n += 1;
            }
        }
    }
    eprintln!("wrote {} ({n} samples)", out_path.display());
}
