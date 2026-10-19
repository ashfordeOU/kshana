// SPDX-License-Identifier: AGPL-3.0-only
//! The receiver's own spoofing/jamming flags (UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG) read
//! from synthetic UBX frames laid out per the u-blox interface descriptions, and the
//! `receiver-self-report` comparison against Kshana's monitors.
//!
//! PIN-SCOPE:    decoding of both messages (SEC-SIG versions 1 and 2, enable bits), and the
//!               both / receiver-only / kshana-only / neither accounting on a log known by construction
//! PIN-EXCLUDES: how well any real receiver's detector works

use kshana::receiver_trust::ingest::read_ubx;
use kshana::receiver_trust::scenario::{run_receiver_trust_bytes, ReceiverTrustScenario};

fn frame(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
    let mut f = vec![0xB5, 0x62, class, id];
    f.extend((payload.len() as u16).to_le_bytes());
    f.extend(payload);
    let (mut a, mut b) = (0u8, 0u8);
    for &x in &f[2..] {
        a = a.wrapping_add(x);
        b = b.wrapping_add(a);
    }
    f.push(a);
    f.push(b);
    f
}

fn nav_pvt(itow: u32) -> Vec<u8> {
    let mut p = vec![0u8; 92];
    p[..4].copy_from_slice(&itow.to_le_bytes());
    p[4..6].copy_from_slice(&2024u16.to_le_bytes());
    p[6] = 9;
    p[7] = 10;
    p[8] = 12;
    p[9] = (itow / 60_000 % 60) as u8;
    p[10] = (itow / 1000 % 60) as u8;
    p[11] = 0b11;
    p[20] = 3;
    p[23] = 8;
    p[24..28].copy_from_slice(&(160_000_000i32).to_le_bytes());
    p[28..32].copy_from_slice(&(690_000_000i32).to_le_bytes());
    frame(0x01, 0x07, &p)
}

fn nav_sat(itow: u32, cno: u8) -> Vec<u8> {
    let mut p = vec![0u8; 8 + 12 * 8];
    p[..4].copy_from_slice(&itow.to_le_bytes());
    p[5] = 8;
    for sv in 0..8usize {
        let b = &mut p[8 + sv * 12..20 + sv * 12];
        b[0] = 0;
        b[1] = sv as u8 + 1;
        b[2] = cno - (sv as u8 % 3);
        b[3] = 40;
    }
    frame(0x01, 0x35, &p)
}

fn nav_status(itow: u32, spoof: u8) -> Vec<u8> {
    let mut p = vec![0u8; 16];
    p[..4].copy_from_slice(&itow.to_le_bytes());
    p[4] = 3;
    p[7] = spoof << 3;
    frame(0x01, 0x03, &p)
}

fn sec_sig_v1(jam_flags: u8, spf_flags: u8) -> Vec<u8> {
    let mut p = vec![0u8; 12];
    p[0] = 1;
    p[4] = jam_flags;
    p[8] = spf_flags;
    frame(0x27, 0x09, &p)
}

fn sec_sig_v2(flags: u8, freqs: u8) -> Vec<u8> {
    let mut p = vec![0u8; 4 + 4 * usize::from(freqs)];
    p[0] = 2;
    p[1] = flags;
    p[3] = freqs;
    frame(0x27, 0x09, &p)
}

#[test]
fn nav_status_and_both_sec_sig_versions_decode() {
    let mut log = Vec::new();
    log.extend(nav_pvt(1000));
    log.extend(nav_status(1000, 2));
    log.extend(nav_pvt(2000));
    log.extend(nav_status(2000, 3));
    // SEC-SIG v1: jamming enabled, state 3; spoofing enabled, state 2 (flags are enable | state << 1).
    log.extend(nav_pvt(3000));
    log.extend(sec_sig_v1(1 | (3 << 1), 1 | (2 << 1)));
    // v2: jamming enabled state 2, spoofing enabled state 1, one centre-frequency group after it.
    log.extend(nav_pvt(4000));
    log.extend(sec_sig_v2(1 | (2 << 1) | (1 << 3) | (1 << 4), 1));
    // A detector that is not enabled reports nothing, whatever its state bits say.
    log.extend(nav_pvt(5000));
    log.extend(sec_sig_v1(3 << 1, 2 << 1));
    // An unknown version is skipped, not guessed.
    log.extend(nav_pvt(6000));
    log.extend(frame(0x27, 0x09, &[9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]));
    let tl = read_ubx(&log);
    let sr = |i: usize| tl.epochs[i].self_report;
    assert_eq!(
        (sr(0).unwrap().spoofing, sr(0).unwrap().jamming),
        (Some(2), None)
    );
    assert_eq!(sr(1).unwrap().spoofing, Some(3));
    assert_eq!(
        (sr(2).unwrap().spoofing, sr(2).unwrap().jamming),
        (Some(2), Some(3))
    );
    assert_eq!(
        (sr(3).unwrap().spoofing, sr(3).unwrap().jamming),
        (Some(1), Some(2))
    );
    assert_eq!(sr(4), None, "disabled detectors are not read");
    assert_eq!(sr(5), None);
    assert_eq!(
        tl.skipped_records, 1,
        "the unknown SEC-SIG version counts as skipped"
    );
    assert!(sr(0).unwrap().flagged() && sr(3).unwrap().spoofing.is_none_or(|v| v < 2));
}

#[test]
fn the_comparison_counts_both_receiver_only_kshana_only_and_neither() {
    let mut log = Vec::new();
    for t in 0..200u32 {
        let itow = 1000 * t;
        // C/N0 down 20 dB at 80..=90 (receiver silent) and 120..=130 (receiver flags).
        let drop = (80..=90).contains(&t) || (120..=130).contains(&t);
        // The receiver also flags 160..=165 with nothing changing in the signals.
        let flag = (120..=130).contains(&t) || (160..=165).contains(&t);
        log.extend(nav_pvt(itow));
        log.extend(nav_sat(itow, if drop { 25 } else { 45 }));
        log.extend(nav_status(itow, if flag { 2 } else { 1 }));
    }
    let scn: ReceiverTrustScenario =
        toml::from_str("[log]\nformat = \"ubx\"\ntext = \"\"\n").unwrap();
    let r = run_receiver_trust_bytes(&scn, &log, None).unwrap();
    let s = r.receiver_self_report.expect("the log carries flags");
    assert_eq!(s.receiver_flag_epochs, 11 + 6);
    assert_eq!(
        (s.both, s.receiver_only, s.kshana_only),
        (11, 6, 11),
        "{s:?}"
    );
    assert_eq!(s.spoofing_flag_epochs, 17);
    assert_eq!(s.jamming_flag_epochs, 0);
    assert_eq!(s.first_receiver_flag_s, Some(120.0));
    assert_eq!(s.first_kshana_alarm_s, Some(80.0));
    assert_eq!(s.epochs_reported, 200 - 60);
    assert!(s.note.contains("neither is ground truth"));
    // Every epoch carries it, in the per-epoch results.
    assert!(r.epochs.iter().all(|e| e.self_report.is_some()));
    assert_eq!(
        r.epochs[125].self_report.as_ref().unwrap().agreement,
        "both"
    );

    // A log without the messages has no section at all.
    let plain: Vec<u8> = (0..100u32)
        .flat_map(|t| [nav_pvt(1000 * t), nav_sat(1000 * t, 45)].concat())
        .collect();
    let r = run_receiver_trust_bytes(&scn, &plain, None).unwrap();
    assert!(r.receiver_self_report.is_none() && r.epochs.iter().all(|e| e.self_report.is_none()));
}
