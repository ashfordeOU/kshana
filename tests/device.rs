// SPDX-License-Identifier: AGPL-3.0-only
//! Sensor plug-in kit (L11): a made-up binary GNSS monitor, described only by
//! `examples/devices/example-monitor.device.toml` and mapped by `example-monitor.connect.toml`,
//! decodes from a stream (in pieces of any size, with junk and a corrupted frame) into rows that the
//! connect mapping turns into `kshana.obs/1`, with no Kshana code for the device. Its own test
//! vectors pass `kshana device check`.

use kshana::device::{Decoder, Device};
use std::path::Path;
use std::process::Command;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn device() -> Device {
    Device::parse(
        &std::fs::read_to_string(root().join("examples/devices/example-monitor.device.toml"))
            .unwrap(),
    )
    .unwrap()
}

fn crc(d: &[u8]) -> u16 {
    let mut c = 0xFFFFu16;
    for &b in d {
        c ^= u16::from(b) << 8;
        for _ in 0..8 {
            c = if c & 0x8000 != 0 {
                (c << 1) ^ 0x1021
            } else {
                c << 1
            };
        }
    }
    c
}

fn frame(id: u8, payload: &[u8]) -> Vec<u8> {
    let mut body = (payload.len() as u16).to_le_bytes().to_vec();
    body.push(id);
    body.extend(payload);
    let mut f = vec![0xA5, 0x5A];
    f.extend(&body);
    f.extend(crc(&body).to_be_bytes());
    f
}

/// 60 epochs: a fix and six C/N0 messages each, with junk, a false sync and one corrupted frame.
fn stream() -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..60u64 {
        let t = 1_794_009_600_000u64 + k * 1000;
        let mut p = t.to_le_bytes().to_vec();
        p.extend((594_375_000i32 + k as i32 * 10).to_le_bytes());
        p.extend(247_536_000i32.to_le_bytes());
        p.extend(30_500i32.to_le_bytes());
        p.extend((1200u16 - if (20..30).contains(&k) { 400 } else { 0 }).to_le_bytes());
        let mut f = frame(1, &p);
        if k == 33 {
            f[10] ^= 0x40; // corrupted: the checksum no longer matches
        }
        v.extend(f);
        for prn in 1..=6u8 {
            let mut c = t.to_le_bytes().to_vec();
            c.push(prn);
            let cn0 = if (20..30).contains(&k) { 280 } else { 440 } - u16::from(prn);
            c.extend(cn0.to_le_bytes());
            v.extend(frame(2, &c));
        }
        if k % 7 == 0 {
            v.extend([0x00, 0xA5, 0x13, 0xA5, 0x5A, 0xFF]); // junk with a false sync
        }
        if k % 11 == 0 {
            v.extend(frame(9, &[1, 2, 3])); // a message the file does not list
        }
    }
    v
}

#[test]
fn the_device_decodes_the_same_in_any_pieces_and_maps_to_obs() {
    let bytes = stream();
    let mut whole = Decoder::new(device());
    let mut rows = whole.push(&bytes);
    rows.extend(whole.finish());
    assert_eq!(rows.len(), 59 + 360, "one fix is corrupted");
    assert!(
        whole.bad >= 1 && whole.unknown == 6,
        "{} {}",
        whole.bad,
        whole.unknown
    );
    for size in [1usize, 3, 17, 500] {
        let mut d = Decoder::new(device());
        let mut got: Vec<_> = bytes.chunks(size).flat_map(|c| d.push(c)).collect();
        got.extend(d.finish());
        assert_eq!(got, rows, "pieces of {size}");
    }
    assert_eq!(rows[0]["message"], "fix");
    assert!((rows[0]["lat"].as_f64().unwrap() - 59.4375).abs() < 1e-9);
    assert_eq!(rows[1]["prn"], 1);

    // The rows, as JSON Lines, through the partner's mapping file: kshana.obs/1.
    let jsonl: String = rows.iter().map(|r| format!("{r}\n")).collect();
    let mapping = kshana::connect::parse_mapping(
        &std::fs::read_to_string(root().join("examples/devices/example-monitor.connect.toml"))
            .unwrap(),
    )
    .unwrap();
    let station: kshana::obs::Station =
        toml::from_str(&std::fs::read_to_string(root().join("examples/obs/station.toml")).unwrap())
            .unwrap();
    let recs = kshana::connect::map(&mapping, &jsonl, &station).unwrap();
    let text = kshana::obs::to_jsonl(&recs).unwrap();
    let (_, rep) = kshana::obs::check(&text).unwrap();
    assert_eq!(rep.epochs, 60);
    assert!(
        text.contains("\"G03\""),
        "satellites named from the mapping"
    );
}

#[test]
fn the_command_checks_the_vectors_and_decodes_a_capture() {
    let dev = root().join("examples/devices/example-monitor.device.toml");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["device", "check"])
        .arg(&dev)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    assert!(String::from_utf8_lossy(&o.stdout).contains("all 2 test vectors"));

    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["device", "decode"])
        .arg(&dev)
        .args(["--from", "-"])
        .env("KSHANA_LANG", "en")
        .stdin(std::process::Stdio::piped())
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::piped())
        .spawn()
        .unwrap();
    use std::io::Write;
    c.stdin.take().unwrap().write_all(&stream()).unwrap();
    let o = c.wait_with_output().unwrap();
    assert!(o.status.success());
    assert_eq!(String::from_utf8_lossy(&o.stdout).lines().count(), 419);

    // A broken device file is refused with the reason.
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let bad = std::env::temp_dir().join(format!(
        "kshana-device-bad-{}-{}.toml",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::write(
        &bad,
        "schema = \"kshana.device/1\"\nname = \"x\"\n[framing]\nsync = \"AA\"\nfixed_length = 8\nchecksum = { type = \"md5\" }\n",
    )
    .unwrap();
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["device", "check"])
        .arg(&bad)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert!(!o.status.success());
    assert!(String::from_utf8_lossy(&o.stderr).contains("unknown checksum md5"));
    let _ = std::fs::remove_file(&bad);
}
