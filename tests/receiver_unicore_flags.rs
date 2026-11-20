// SPDX-License-Identifier: AGPL-3.0-only
//! Unicore's own jamming flags (`JAMSTATUS` `CWFlag`) and AGC reach `receiver-trust` as inputs:
//! the `receiver-self-report` comparison counts them beside Kshana's monitors, as it does UBX-SEC-SIG.
//!
//! PIN-SCOPE:    a self-derived Unicore N4 binary log (OBSVM, AGC, JAMSTATUS from the N4 manual R1.13
//!               layouts) whose flag and C/N0 change together at a known epoch
//! PIN-EXCLUDES: how well any real Unicore receiver's detector works

use kshana::receiver_trust::machines::unicore::{record, ID_AGC, ID_JAMSTATUS, ID_OBSVM};
use kshana::receiver_trust::scenario::{run_receiver_trust_bytes, ReceiverTrustScenario};

/// One OBSVM observation of GPS PRN `prn` on L1 with C/N0 `cn0` dB-Hz.
fn obs(prn: u16, cn0: f64) -> Vec<u8> {
    let mut o = Vec::new();
    o.extend(0u16.to_le_bytes()); // frequency channel
    o.extend(prn.to_le_bytes());
    o.extend(2.2e7f64.to_le_bytes());
    o.extend((-1.1e8f64).to_le_bytes());
    o.extend([10u8, 0, 20, 0]); // pseudorange and phase standard deviations
    o.extend((-500.0f32).to_le_bytes());
    o.extend(((cn0 * 100.0) as u16).to_le_bytes());
    o.extend(0u16.to_le_bytes());
    o.extend(40.0f32.to_le_bytes());
    o.extend(0u32.to_le_bytes()); // tracking status: GPS, L1 C/A
    o
}

fn log() -> Vec<u8> {
    let mut s = Vec::new();
    for k in 0..240u32 {
        let jammed = k >= 150;
        let ms = 100_000 + 1000 * k;
        let mut data = 8u32.to_le_bytes().to_vec();
        for prn in [3u16, 7, 11, 14, 19, 22, 25, 30] {
            let cn0 = if jammed { 30.0 } else { 45.0 } + f64::from(prn % 3) * 0.25;
            data.extend(obs(prn, cn0));
        }
        s.extend(record(ID_OBSVM, 2350, ms, &data).unwrap());
        let level: i16 = if jammed { 20 } else { 60 + (k % 3) as i16 };
        let mut agc = Vec::new();
        for v in [level, level, -1, -1, -1, -1, -1, -1, -1, -1] {
            agc.extend(v.to_le_bytes());
        }
        s.extend(record(ID_AGC, 2350, ms, &agc).unwrap());
        let mut js = 16u32.to_le_bytes().to_vec();
        js.extend([if jammed { 180 } else { 5 }, u8::from(jammed) * 2, 0, 0]);
        s.extend(record(ID_JAMSTATUS, 2350, ms, &js).unwrap());
    }
    s
}

#[test]
fn unicore_jamming_flags_enter_the_self_report_comparison() {
    let scn: ReceiverTrustScenario =
        toml::from_str("[log]\nformat = \"unicore\"\ntext = \"\"\n").unwrap();
    let r = run_receiver_trust_bytes(&scn, &log(), None).unwrap();
    let s = r.receiver_self_report.expect("the log carries flags");
    assert!(s.note.contains("Unicore"), "{}", s.note);
    assert_eq!(s.spoofing_flag_epochs, 0);
    assert_eq!(s.jamming_flag_epochs, 90, "{s:?}");
    assert!(s.both > 0, "Kshana's monitors alarm with the flag: {s:?}");
    assert_eq!(s.first_receiver_flag_s, Some(150.0));
    // the AGC reached the monitors
    assert!(r.epochs.iter().any(|e| e.agc.is_some()));
}
