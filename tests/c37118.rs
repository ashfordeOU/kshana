// SPDX-License-Identifier: AGPL-3.0-only
//! IEEE C37.118.2 PMU time-sync health, against a stream built by an independent encoder
//! (`tests/fixtures/c37118/make_stream.py`, which shares no code with `src/c37118.rs`).

use kshana::c37118::{read_stream, sync_losses};
use serde_json::Value;

#[test]
fn every_time_report_matches_the_independent_encoder() {
    let s = read_stream(include_bytes!("fixtures/c37118/stream.bin"));
    let want: Value = serde_json::from_str(include_str!("fixtures/c37118/expected.json")).unwrap();
    assert_eq!(s.bad_crc as u64, want["bad_crc"].as_u64().unwrap());
    assert_eq!(
        s.data_without_config as u64,
        want["data_without_config"].as_u64().unwrap()
    );
    assert_eq!((s.size_mismatch, s.other), (0, 0));
    let cfg = s.config.as_ref().unwrap();
    assert_eq!(cfg.time_base, 1_000_000);
    assert_eq!(cfg.pmus.len(), 2);
    assert_eq!(cfg.pmus[1].station, "SUBSTATION B");
    let rows = want["reports"].as_array().unwrap();
    assert_eq!(s.reports.len(), rows.len());
    for (r, w) in s.reports.iter().zip(rows) {
        assert!((r.t_unix_s - w[0].as_f64().unwrap()).abs() < 1e-6);
        assert_eq!(r.pmu as u64, w[1].as_u64().unwrap());
        assert_eq!(r.sync_error, w[2].as_bool().unwrap());
        assert_eq!(r.pmu_time_quality as u64, w[3].as_u64().unwrap());
        assert_eq!(r.unlocked as u64, w[4].as_u64().unwrap());
        assert_eq!(r.msg_time_quality as u64, w[5].as_u64().unwrap());
    }
    let losses = sync_losses(&s.reports);
    let l = &want["loss"];
    assert_eq!(losses.len(), 1);
    assert_eq!(losses[0].pmu as u64, l[0].as_u64().unwrap());
    assert!((losses[0].from_unix_s - l[1].as_f64().unwrap()).abs() < 1e-6);
    assert!((losses[0].to_unix_s - l[2].as_f64().unwrap()).abs() < 1e-6);
    assert_eq!(losses[0].reports as u64, l[3].as_u64().unwrap());
}
