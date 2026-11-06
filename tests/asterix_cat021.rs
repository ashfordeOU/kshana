// SPDX-License-Identifier: AGPL-3.0-only
//! ASTERIX CAT021 against blocks from an independent encoder (`tests/fixtures/asterix_cat021/make_blocks.py`,
//! which shares no code with `src/asterix_cat021.rs`). Every record carries five extra items chosen at random,
//! among them the compound, repetitive and explicit-length ones, so a wrong length anywhere shifts every
//! later field and fails the comparison.

use kshana::asterix_cat021::{read, to_adsb_csv};
use serde_json::Value;

#[test]
fn every_kept_field_matches_the_independent_encoder() {
    let rec = read(include_bytes!("fixtures/asterix_cat021/blocks.bin"));
    let want: Value =
        serde_json::from_str(include_str!("fixtures/asterix_cat021/expected.json")).unwrap();
    assert_eq!(
        rec.other_category as u64,
        want["other_category"].as_u64().unwrap()
    );
    assert_eq!(rec.truncated, 0);
    let rows = want["reports"].as_array().unwrap();
    assert_eq!(rec.reports.len(), rows.len());
    for (r, w) in rec.reports.iter().zip(rows) {
        assert_eq!(r.time_of_day_s.unwrap(), w["tod"].as_f64().unwrap());
        assert_eq!(r.address.unwrap() as u64, w["addr"].as_u64().unwrap());
        let lsb = w["lsb"].as_f64().unwrap();
        assert!((r.lat_deg.unwrap() - w["lat"].as_f64().unwrap()).abs() <= lsb);
        assert!((r.lon_deg.unwrap() - w["lon"].as_f64().unwrap()).abs() <= lsb);
        assert_eq!(r.flight_level.unwrap(), w["fl"].as_f64().unwrap());
        assert_eq!(r.mops.unwrap() as u64, w["mops"].as_u64().unwrap());
        assert_eq!(r.nic.map(u64::from), w["nic"].as_u64());
        assert_eq!(r.nacp.unwrap() as u64, w["nacp"].as_u64().unwrap());
    }
    let csv = to_adsb_csv(&rec, 1_735_689_600);
    assert_eq!(csv.lines().count(), 1 + rows.len());
    assert!(csv.starts_with("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type\n"));
}

#[test]
fn a_cut_block_is_reported_not_read_past() {
    let b = include_bytes!("fixtures/asterix_cat021/blocks.bin");
    let rec = read(&b[..b.len() - 10]);
    assert_eq!(rec.truncated, 1);
}

#[test]
fn the_csv_is_read_by_the_interference_map_without_rejected_rows() {
    use kshana::interference_map::adsb::{AdsbAggregator, AdsbParams};
    use kshana::interference_map::grid::Grid;
    use kshana::interference_map::IdHasher;
    let rec = read(include_bytes!("fixtures/asterix_cat021/blocks.bin"));
    let csv = to_adsb_csv(&rec, 1_735_689_600);
    let mut agg = AdsbAggregator::new(Grid::new(0.5).unwrap(), AdsbParams::PREREGISTERED_V1, IdHasher::new());
    agg.read_csv(&csv).unwrap();
    let s = &agg.stats;
    assert_eq!(s.rows, 40);
    assert_eq!(s.rejected_malformed, 0);
    // MOPS 0 rows carry no NIC but do carry NACp, so none lacks an accuracy field.
    assert_eq!(s.excluded_no_accuracy_field, 0);
}
