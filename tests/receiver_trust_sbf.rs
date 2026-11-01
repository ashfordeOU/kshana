// SPDX-License-Identifier: AGPL-3.0-only
//! The Septentrio SBF reader on synthetic blocks laid out as the SBF reference guide describes
//! them (header: sync `$@`, CRC-16-CCITT, block id and revision, length, time of week and week
//! number), cross-checked against the layouts decoded by the MIT-licensed `sbf-tools` crate: the
//! manufacturer's reference guide itself could not be downloaded when this was written (see
//! `docs/RECEIVER-PROTOCOLS.md`).
//!
//! PIN-SCOPE:    PVTGeodetic fix, MeasEpoch C/N0 per satellite and signal, RFStatus band count, GPST
//!               labels, a corrupt block counted as skipped, and the monitors running on the result
//! PIN-EXCLUDES: every other SBF block; whether a real receiver's blocks decode (no real log is used)

use kshana::receiver_trust::ingest::read_sbf;
use kshana::receiver_trust::monitors::Monitor;
use kshana::receiver_trust::scenario::{run_receiver_trust_bytes, ReceiverTrustScenario};

fn block(id: u16, rev: u8, tow_ms: u32, wnc: u16, body: &[u8]) -> Vec<u8> {
    // data = CRC(2) ID(2) LEN(2) TOW(4) WNc(2) body; the block is sync(2) + data, a multiple of 4.
    let mut data = vec![0u8; 2];
    data.extend((id | (u16::from(rev) << 13)).to_le_bytes());
    data.extend([0, 0]);
    data.extend(tow_ms.to_le_bytes());
    data.extend(wnc.to_le_bytes());
    data.extend(body);
    while !(data.len() + 2).is_multiple_of(4) {
        data.push(0);
    }
    let len = (data.len() + 2) as u16;
    data[4..6].copy_from_slice(&len.to_le_bytes());
    let crc = sbf_tools::crc::crc16_ccitt(&data[2..]);
    data[0..2].copy_from_slice(&crc.to_le_bytes());
    let mut out = vec![b'$', b'@'];
    out.extend(data);
    out
}

fn pvt(tow_ms: u32, wnc: u16) -> Vec<u8> {
    let mut b = vec![0u8; 83 - 12];
    b[0] = 4; // mode: standalone fix
    b[1] = 0; // no error
    b[2..10].copy_from_slice(&(69.0f64.to_radians()).to_le_bytes());
    b[10..18].copy_from_slice(&(16.0f64.to_radians()).to_le_bytes());
    b[18..26].copy_from_slice(&12.5f64.to_le_bytes());
    b[60] = 8; // NrSV
    block(4007, 0, tow_ms, wnc, &b)
}

fn meas(tow_ms: u32, wnc: u16, cn0_dbhz: f64) -> Vec<u8> {
    let raw = ((cn0_dbhz - 10.0) / 0.25) as u8;
    let mut b = vec![0u8; 5]; // N1, SB1Length, SB2Length, CommonFlags, CumClkJumps
    b[0] = 6;
    b[1] = 20;
    for svid in 1..=6u8 {
        let mut sb = [0u8; 20];
        sb[1] = 0; // type: signal index 0 (GPS L1 C/A)
        sb[2] = svid;
        sb[15] = raw;
        b.extend(sb);
    }
    block(4027, 0, tow_ms, wnc, &b)
}

fn rf(tow_ms: u32, wnc: u16, info: u8) -> Vec<u8> {
    let mut b = vec![0u8; 6]; // N, SBLength, reserved(4)
    b[0] = 1;
    b[1] = 8;
    b.extend(1_575_420_000u32.to_le_bytes());
    b.extend(2_000u16.to_le_bytes());
    b.push(info);
    b.push(0);
    block(4092, 0, tow_ms, wnc, &b)
}

fn log() -> Vec<u8> {
    let mut v = Vec::new();
    for t in 0..100u32 {
        let (tow, wnc) = (345_600_000 + 1000 * t, 2330);
        let hit = (70..=80).contains(&t);
        v.extend(pvt(tow, wnc));
        v.extend(meas(tow, wnc, if hit { 25.0 } else { 45.0 }));
        v.extend(rf(tow, wnc, u8::from(hit)));
    }
    v
}

#[test]
fn pvt_meas_epoch_and_rf_status_become_a_timeline() {
    let tl = read_sbf(&log());
    assert_eq!(tl.epochs.len(), 100);
    assert_eq!(tl.skipped_records, 0);
    let e = &tl.epochs[5];
    assert_eq!(e.t_s, 5.0);
    assert_eq!(e.cn0.len(), 6);
    assert!(
        e.cn0
            .iter()
            .all(|c| c.band == "L1CA" && (c.cn0_dbhz - 45.0).abs() < 0.3),
        "{:?}",
        e.cn0
    );
    assert_eq!(e.cn0[0].sat, "G01");
    let f = e.fix.expect("PVTGeodetic gives the fix");
    assert!(
        (f.lat_deg - 69.0).abs() < 1e-9 && (f.lon_deg - 16.0).abs() < 1e-9 && f.height_m == 12.5
    );
    assert_eq!(f.n_used, Some(8));
    // Week 2330, time of week 345600 s is Thursday 00:00:00 of that week.
    assert_eq!(
        tl.start_label.as_deref(),
        Some("2024-09-05T00:00:00.000 GPST")
    );
    assert_eq!(tl.epochs[5].self_report.unwrap().rf_bands_reported, Some(0));
    assert_eq!(
        tl.epochs[75].self_report.unwrap().rf_bands_reported,
        Some(1)
    );
    // The RF band count is carried, not interpreted: it does not make the receiver "flag".
    assert!(!tl.epochs[75].self_report.unwrap().flagged());
    assert!(
        tl.observables.contains(&"cn0".to_string()) && tl.observables.contains(&"fix".to_string())
    );
}

#[test]
fn a_corrupt_block_is_skipped_and_the_monitors_run_on_the_rest() {
    let mut v = log();
    let n = v.len();
    // Flip a byte inside the third block's body: its CRC no longer matches.
    v[60] ^= 0xFF;
    let tl = read_sbf(&v);
    assert!(tl.skipped_records >= 1, "{}", tl.skipped_records);
    assert!(tl.epochs.len() >= 99 && n > 1000);

    let scn: ReceiverTrustScenario =
        toml::from_str("[log]\nformat = \"sbf\"\ntext = \"\"\n").unwrap();
    let r = run_receiver_trust_bytes(&scn, &log(), None).unwrap();
    assert!(r.monitors_run.contains(&Monitor::Cn0Drop));
    let alarmed: Vec<f64> = r
        .epochs
        .iter()
        .filter(|e| e.alarms.contains(&Monitor::Cn0Drop))
        .map(|e| e.t_s)
        .collect();
    assert_eq!(
        (alarmed.first().copied(), alarmed.last().copied()),
        (Some(70.0), Some(80.0)),
        "{alarmed:?}"
    );
    assert_eq!(r.log.format, kshana::receiver_trust::LogFormat::Sbf);
    // No transmit path: the reader takes bytes and returns a timeline; there is nothing to write to.
}
