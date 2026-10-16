// SPDX-License-Identifier: AGPL-3.0-only
//! The EMAG2v3 reader on the real grid (WP-10, RM-16), data-gated.
//!
//! EMAG2v3 (Meyer, Saltus and Chulliat 2017, NOAA NCEI, doi:10.7289/V5H70CVX) is not vendored
//! because its redistribution terms are not explicit. Fetch the zip (SHA-256 pinned in the
//! tool) and crop the box with
//! `python3 tools/fetch_emag2_tile.py 35.5 37.5 -118.0 -116.0`; the crop's own SHA-256 is
//! pinned below. This checks only that the reader lays out the real lattice and masks the
//! real voids. No navigation outcome is claimed on the real grid: that would need its own
//! pre-registration.

use kshana::altpnt::maps::{Emag2Column, GeoGrid};
use sha2::{Digest, Sha256};

const CROP: &str = "tools/emag2/EMAG2_V3_20170530_35.5_37.5_-118.0_-116.0.csv";
// PIN-SCOPE:    the bytes of the cropped EMAG2v3 CSV written by tools/fetch_emag2_tile.py
// PIN-EXCLUDES: the 1.17 GB source zip (its SHA-256 is pinned in the tool), and everything in this repo
const CROP_SHA256: &str = "8e29107f810f359395fdf87f4d1f9515824587f1aaf47e9aaddaf44077c8fa0b";

#[test]
#[ignore = "needs the EMAG2v3 crop from tools/fetch_emag2_tile.py (not vendored)"]
fn emag2v3_death_valley_crop_reads_as_a_regular_lattice() {
    let text = std::fs::read_to_string(CROP).unwrap_or_else(|_| panic!("fetch {CROP} first"));
    assert_eq!(hex::encode(Sha256::digest(text.as_bytes())), CROP_SHA256);

    let up = GeoGrid::from_emag2_csv(&text, Emag2Column::UpCont).expect("UpCont parses");
    assert_eq!((up.n_lat, up.n_lon), (60, 60));
    assert!((up.dlat_deg - 1.0 / 30.0).abs() < 1e-9 && (up.dlon_deg - 1.0 / 30.0).abs() < 1e-9);
    assert!((up.lat0_deg - (35.5 + 1.0 / 60.0)).abs() < 1e-9);
    assert!((up.lon0_deg - (242.0 + 1.0 / 60.0)).abs() < 1e-9);
    assert_eq!(up.void_count(), 0);
    // The first data rows of the crop, verbatim: (row, col, UpCont nT).
    assert_eq!(up.node(0, 0), 51.2803847270054);
    assert_eq!(up.node(0, 1), 30.5911261457326);
    assert_eq!(up.node(0, 2), 24.7611343500252);
    let (_, sd) = up.mean_std();
    assert!(sd > 10.0, "real crustal relief expected, std {sd} nT");

    // The sea-level column is void over this land box.
    let sl = GeoGrid::from_emag2_csv(&text, Emag2Column::SeaLevel).expect("SeaLevel parses");
    assert_eq!(sl.void_count(), 60 * 60);
}
