// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana lunanet-afs-check`: generate a stream, check it, damage it, and read the spec report.

use std::process::Command;

fn kshana(args: &[&str]) -> std::process::Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap()
}

#[test]
fn generate_check_and_damage_round_trip_through_the_command_line() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-afs-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let f = dir.join("afs.txt");
    let g = kshana(&[
        "lunanet-afs-check",
        "generate",
        "--frames",
        "3",
        "--toi0",
        "7",
        "--out",
        f.to_str().unwrap(),
    ]);
    assert!(g.status.success(), "{}", String::from_utf8_lossy(&g.stderr));
    let ok = kshana(&[
        "lunanet-afs-check",
        "symbols",
        f.to_str().unwrap(),
        "--json",
    ]);
    assert!(ok.status.success());
    let v: serde_json::Value = serde_json::from_slice(&ok.stdout).unwrap();
    assert_eq!(v["frames_found"], 3);
    assert_eq!(v["frames"][2]["toi"], 9);
    assert!(v["not_checked"].as_str().unwrap().contains("LDPC"));
    // Drop the middle frame: spacing and TOI problems, exit status 1.
    let text = std::fs::read_to_string(&f).unwrap();
    let s: Vec<&str> = text.split_whitespace().collect();
    let s = s.concat();
    let cut = format!("{}{}", &s[..6000], &s[12000..]);
    std::fs::write(&f, cut).unwrap();
    let bad = kshana(&["lunanet-afs-check", "symbols", f.to_str().unwrap()]);
    assert_eq!(bad.status.code(), Some(1));
    assert!(String::from_utf8_lossy(&bad.stdout).contains("expected 8"));
    // Garbage is refused with the usage text.
    std::fs::write(&f, "01x").unwrap();
    assert_eq!(
        kshana(&["lunanet-afs-check", "symbols", f.to_str().unwrap()])
            .status
            .code(),
        Some(2)
    );
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn the_spec_report_names_the_pin_and_keeps_the_b4_miss() {
    let o = kshana(&["lunanet-afs-check", "spec"]);
    assert!(o.status.success());
    let t = String::from_utf8_lossy(&o.stdout);
    assert!(t.contains("LSIS-AFS) V1.0, 29 January 2025"));
    assert!(t.contains("B4   NOT MET"));
    assert!(t.contains("most likely a misprint"));
    assert!(t.contains("Advisory:"));
    // --strict turns the documented miss into a failing exit status.
    assert_eq!(
        kshana(&["lunanet-afs-check", "spec", "--strict"])
            .status
            .code(),
        Some(1)
    );
    assert_eq!(
        kshana(&["lunanet-afs-check", "frobnicate"]).status.code(),
        Some(2)
    );
}
