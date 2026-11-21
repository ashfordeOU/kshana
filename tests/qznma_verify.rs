// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana corrections qznma-verify` and the QZNMA RAND of every signal (IS-QZSS-SAS-001
//! sections 5 and 6), against signatures made here with a key made here.
//!
//! QZSS-generated signatures and the public keys are given only to registered users (SAS-001
//! Appendix A), so these tests check our composition of each signed message: a signature over
//! the messages as signed verifies against later copies whose time, parity or CRC changed
//! (bits the MASK drops, or the RTOW restores), and fails when a bit the MASK keeps changes.

use kshana::corrections::qznma::{parse_rds, Rds};
use kshana::corrections::qznma_nav::{self as nav, QzssSignature, Signal};
use kshana::corrections::qznma_verify::{self as qv, NavStore, Status};
use kshana::corrections::{bits, parse_frames};
use kshana::osnma::signature::PublicKey;
use kshana::osnma::tables::KeyType;
use p256::ecdsa::{signature::Signer, Signature, SigningKey, VerifyingKey};
use std::path::PathBuf;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

/// A fresh, unique scratch folder.
fn fresh() -> PathBuf {
    let d = std::env::temp_dir().join(format!(
        "kshana-qznma-verify-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn key() -> (SigningKey, PublicKey) {
    let sk = SigningKey::from_slice(&[0x5Au8; 32]).unwrap();
    let pk = PublicKey {
        pkid: 5,
        key_type: KeyType::P256,
        bytes: VerifyingKey::from(&sk)
            .to_sec1_point(false)
            .as_bytes()
            .to_vec(),
    };
    (sk, pk)
}

/// Deterministic pseudo-random bits.
fn noise(n: usize, seed: u32) -> Vec<u8> {
    let mut x = seed.wrapping_mul(2_654_435_761).wrapping_add(1);
    (0..n)
        .map(|_| {
            x ^= x << 13;
            x ^= x >> 17;
            x ^= x << 5;
            (x & 1) as u8
        })
        .collect()
}

fn set(b: &mut [u8], at: usize, n: usize, v: u64) {
    for i in 0..n {
        b[at + i] = ((v >> (n - 1 - i)) & 1) as u8;
    }
}

fn get(b: &[u8], at: usize, n: usize) -> u64 {
    b[at..at + n]
        .iter()
        .fold(0, |v, x| (v << 1) | u64::from(*x))
}

fn hexs(b: &[u8]) -> String {
    hex::encode(bits::to_bytes(b))
}

/// The parts of `sig` as signed (with their time fields set from `tow`), part IDs, and the
/// RTOW they give.
fn signed_parts(sig: Signal, seed: u32, tow: u64) -> (Vec<Vec<u8>>, Vec<u16>, u32) {
    let ids: Vec<u16> = match sig {
        Signal::GpsLnav | Signal::QzsLnav => vec![1, 2, 3],
        Signal::GpsCnav | Signal::QzsCnav => vec![10, 11, 32],
        Signal::GpsCnav2 | Signal::QzsCnav2 => vec![1, 2],
        Signal::GalInav => vec![1, 2, 3, 4, 5],
        Signal::GalFnav => vec![1, 2, 3, 4],
    };
    let mut parts: Vec<Vec<u8>> = sig
        .part_bits()
        .iter()
        .enumerate()
        .map(|(k, n)| noise(*n, seed + k as u32))
        .collect();
    let rtow = match sig {
        Signal::GpsLnav => {
            for (k, p) in parts.iter_mut().enumerate() {
                set(p, 30, 17, tow + k as u64);
            }
            tow
        }
        Signal::GpsCnav => {
            for (k, p) in parts.iter_mut().enumerate() {
                set(p, 20, 17, tow + 2 * k as u64);
            }
            tow
        }
        Signal::GpsCnav2 => {
            set(&mut parts[0], 0, 9, (tow >> 8) & 0x1FF);
            set(&mut parts[1], 13, 8, tow & 0xFF);
            tow & 0x1_FFFF
        }
        Signal::GalInav => {
            set(&mut parts[4], 85, 20, tow);
            tow
        }
        Signal::GalFnav => {
            for (k, at) in [167usize, 194, 186, 189].iter().enumerate() {
                set(&mut parts[k], *at, 20, tow + 10 * k as u64);
            }
            tow
        }
        _ => tow,
    };
    (parts, ids, rtow as u32)
}

/// A later copy as a receiver sees it: newer times (GNSS) and a changed CRC or parity bit.
fn received(sig: Signal, signed: &[Vec<u8>], later: u64) -> Vec<Vec<u8>> {
    let mut parts = signed.to_vec();
    match sig {
        Signal::GpsLnav => {
            for p in parts.iter_mut() {
                let t = get(p, 30, 17);
                set(p, 30, 17, t + later);
                p[29] ^= 1; // word 1 parity
            }
        }
        Signal::GpsCnav => {
            for p in parts.iter_mut() {
                let t = get(p, 20, 17);
                set(p, 20, 17, t + later);
                p[299] ^= 1; // CRC
            }
        }
        Signal::GpsCnav2 => {
            let (itow, toi) = (get(&parts[1], 13, 8), get(&parts[0], 0, 9));
            set(&mut parts[1], 13, 8, (itow + 3) & 0xFF);
            set(&mut parts[0], 0, 9, (toi + 1) & 0x1FF);
            parts[1][599] ^= 1;
        }
        Signal::GalInav => {
            let t = get(&parts[4], 85, 20);
            set(&mut parts[4], 85, 20, t + 6 * later);
        }
        Signal::GalFnav => {
            for (k, at) in [167usize, 194, 186, 189].iter().enumerate() {
                let t = get(&parts[k], *at, 20);
                set(&mut parts[k], *at, 20, t + 6 * later);
                parts[k][220] ^= 1; // CRC
            }
        }
        Signal::QzsLnav => parts[0][29] ^= 1,
        Signal::QzsCnav => parts[1][299] ^= 1,
        Signal::QzsCnav2 => parts[1][590] ^= 1,
    }
    parts
}

/// A bit the MASK keeps, in the second part.
fn kept_bit(sig: Signal) -> usize {
    (0..sig.part_bits()[1])
        .rev()
        .find(|b| nav::mask(sig, 1, *b) && *b > 100)
        .unwrap()
}

fn rds_bits(r: &Rds) -> Vec<u8> {
    let mut b = Vec::new();
    let mut push = |v: u64, n: usize| b.extend((0..n).rev().map(|i| ((v >> i) & 1) as u8));
    push(u64::from(r.nma_id), 4);
    push(u64::from(r.rtow), 20);
    push(u64::from(r.sv_id), 8);
    push(u64::from(r.message_type), 4);
    push(u64::from(r.ref_ephemeris1), 11);
    push(u64::from(r.ref_ephemeris2), 11);
    push(u64::from(r.ref_clock), 11);
    push(u64::from(r.key_id), 8);
    b.extend(bits::of_bytes(&hex::decode(&r.signature).unwrap()));
    let mut tail = Vec::new();
    tail.extend((0..16).rev().map(|i| ((r.salt >> i) & 1) as u8));
    b.extend(tail);
    b
}

/// An L6E QZNMA frame with two RDS (or zeros).
fn l6e_frame(prn: u8, rds: [Option<&Rds>; 2]) -> String {
    let mut b = Vec::new();
    let mut push = |v: u64, n: usize| b.extend((0..n).rev().map(|i| ((v >> i) & 1) as u8));
    push(0x1ACF_FC1D, 32);
    push(u64::from(prn), 8);
    push(0b0110_0001, 8);
    push(0, 1);
    for r in rds {
        match r {
            Some(r) => b.extend(rds_bits(r)),
            None => b.extend(vec![0u8; 605]),
        }
    }
    b.extend(vec![0u8; 485 + 256]);
    // PIN-SCOPE:    the length of one L6 message (IS-QZSS-SAS-001 6.8: 49 + 1695 + 256 bits).
    // PIN-EXCLUDES: the content of the frame, checked by the RDS round trip below.
    assert_eq!(b.len(), 2000);
    hexs(&b)
}

/// A signed GPS or Galileo RDS for `sig` over its messages, and the nav lines of a later copy.
fn gnss_case(sig: Signal, sat: &str, sv: u8, sk: &SigningKey, seed: u32) -> (Rds, String) {
    let mt = (1..=5)
        .find(|m| Signal::from_message_type(*m) == Some(sig))
        .unwrap();
    let (signed, ids, rtow) = signed_parts(sig, seed, 1000);
    let mut rds = Rds {
        nma_id: 0,
        rtow,
        sv_id: sv,
        sat: Some(sat.into()),
        message_type: mt,
        message_type_name: None,
        ref_ephemeris1: 77,
        ref_ephemeris2: 0,
        ref_clock: 12,
        key_id: 5,
        signature: String::new(),
        salt: 0x1234 + seed as u16,
        used: true,
    };
    let refs: Vec<&[u8]> = signed.iter().map(Vec::as_slice).collect();
    let rand = nav::gnss_rand(&rds, &refs).unwrap();
    assert_eq!(rand.len(), sig.rand_bits().div_ceil(8));
    let s: Signature = sk.sign(&rand);
    rds.signature = hex::encode(s.to_bytes());
    let later = received(sig, &signed, 100);
    let lines: String = later
        .iter()
        .zip(&ids)
        .map(|(p, id)| format!("{sat} {} {id} {}\n", sig.name(), hexs(p)))
        .collect();
    (rds, lines)
}

/// The three DSS messages that carry `q` (Figures 5-12, 5-24, 5-34), as nav lines.
fn qzss_dss_lines(q: &QzssSignature, sat: &str) -> String {
    let mut rds = Vec::new();
    rds.extend((0..8).rev().map(|i| (q.key_id >> i) & 1));
    rds.extend(bits::of_bytes(&hex::decode(&q.signature).unwrap()));
    rds.extend((0..16).rev().map(|i| ((q.salt >> i) & 1) as u8));
    let (seg, total) = match q.signal {
        Signal::QzsLnav => (180, 540),
        Signal::QzsCnav => (236, 708),
        _ => (234, 702),
    };
    rds.resize(total, 0);
    let mut out = String::new();
    for k in 0..3 {
        let mut dss = Vec::new();
        dss.extend([((k + 1) >> 1) as u8 & 1, (k + 1) as u8 & 1]);
        dss.extend_from_slice(&rds[k * seg..(k + 1) * seg]);
        let (msg, part) = match q.signal {
            Signal::QzsLnav => {
                let mut m = noise(300, 900 + k as u32);
                set(&mut m, 49, 3, 5); // subframe ID 5
                let mut data = vec![1u8, 1];
                data.extend([1, 1, 1, 1, 0, 0]); // SV ID 60
                data.extend(&dss);
                data.resize(192, 0);
                for (w, chunk) in data.chunks(24).enumerate() {
                    m[(w + 2) * 30..(w + 2) * 30 + 24].copy_from_slice(chunk);
                }
                (m, 5)
            }
            Signal::QzsCnav => {
                let mut m = noise(300, 910 + k as u32);
                set(&mut m, 14, 6, 60);
                m[38..276].copy_from_slice(&dss);
                (m, 60)
            }
            _ => {
                let mut m = noise(274, 920 + k as u32);
                set(&mut m, 8, 6, 60);
                m[14..250].copy_from_slice(&dss);
                (m, 3)
            }
        };
        out.push_str(&format!(
            "{sat} {} {part} {}\n",
            q.signal.name(),
            hexs(&msg)
        ));
    }
    out
}

fn qzss_case(sig: Signal, sat: &str, sk: &SigningKey, seed: u32) -> String {
    let (signed, ids, _) = signed_parts(sig, seed, 0);
    let mut q = QzssSignature {
        signal: sig,
        key_id: 5,
        salt: 0xA5A5,
        signature: String::new(),
    };
    let refs: Vec<&[u8]> = signed.iter().map(Vec::as_slice).collect();
    let rand = nav::qzss_rand(&q, &refs).unwrap();
    assert_eq!(rand.len(), sig.rand_bits().div_ceil(8));
    let s: Signature = sk.sign(&rand);
    q.signature = hex::encode(s.to_bytes());
    let later = received(sig, &signed, 0);
    let mut lines: String = later
        .iter()
        .zip(&ids)
        .map(|(p, id)| format!("{sat} {} {id} {}\n", sig.name(), hexs(p)))
        .collect();
    lines.push_str(&qzss_dss_lines(&q, sat));
    lines
}

#[test]
fn every_signal_verifies_against_later_copies_and_fails_on_changed_data() {
    let (sk, pk) = key();
    let keys: qv::Keys = [(5u8, pk.clone())].into_iter().collect();
    let gnss = [
        (Signal::GpsLnav, "G05", 5u8),
        (Signal::GpsCnav, "G07", 7),
        (Signal::GpsCnav2, "G09", 9),
        (Signal::GalInav, "E11", 75),
        (Signal::GalFnav, "E12", 76),
    ];
    let mut nav_text = String::new();
    let mut rdss = Vec::new();
    for (k, (sig, sat, sv)) in gnss.iter().enumerate() {
        let (rds, lines) = gnss_case(*sig, sat, *sv, &sk, 10 * k as u32 + 1);
        nav_text.push_str(&lines);
        rdss.push(rds);
    }
    for (k, (sig, sat)) in [
        (Signal::QzsLnav, "J02"),
        (Signal::QzsCnav, "J03"),
        (Signal::QzsCnav2, "J04"),
    ]
    .iter()
    .enumerate()
    {
        nav_text.push_str(&qzss_case(*sig, sat, &sk, 100 + 10 * k as u32));
    }
    let frames_text = [
        l6e_frame(205, [Some(&rdss[0]), Some(&rdss[1])]),
        l6e_frame(206, [Some(&rdss[2]), Some(&rdss[3])]),
        l6e_frame(207, [Some(&rdss[4]), None]),
    ]
    .join("\n");
    // The RDS survive the frame encoding.
    let frames = parse_frames(&frames_text).unwrap();
    let back = parse_rds(&frames[0].bits()[49..49 + 605]).unwrap();
    assert_eq!(
        back,
        Rds {
            message_type_name: Some("gps_lnav"),
            ..rdss[0].clone()
        }
    );
    let store = NavStore::parse(&nav_text).unwrap();
    let rep = qv::run(&frames, &store, &keys);
    assert_eq!(rep.checks.len(), 8, "{rep:#?}");
    assert_eq!(rep.verified, 8, "{rep:#?}");
    assert_eq!(rep.label, "MODELLED");
    for sig in [Signal::QzsLnav, Signal::QzsCnav, Signal::QzsCnav2] {
        assert!(rep.checks.iter().any(|c| c.signal == Some(sig)
            && c.source == "qzss_dss"
            && c.status == Status::Verified));
    }

    // A bit the MASK keeps, changed in every stored copy, fails that signature only.
    for (sig, sat, _) in gnss.iter() {
        let bit = kept_bit(*sig);
        let tampered: String = nav_text
            .lines()
            .map(|l| {
                let f: Vec<&str> = l.split(' ').collect();
                let second = sig.part_index(f[2].parse().unwrap()) == Some(1);
                if f[0] == *sat && f[1] == sig.name() && second {
                    let mut b = parse_frames(f[3]).unwrap()[0].bits();
                    b[bit] ^= 1;
                    format!(
                        "{} {} {} {}\n",
                        f[0],
                        f[1],
                        f[2],
                        hexs(&b[..sig.part_bits()[1]])
                    )
                } else {
                    format!("{l}\n")
                }
            })
            .collect();
        let rep = qv::run(&frames, &NavStore::parse(&tampered).unwrap(), &keys);
        assert_eq!((rep.verified, rep.failed), (7, 1), "{}", sig.name());
        let c = rep.checks.iter().find(|c| c.signal == Some(*sig)).unwrap();
        assert_eq!(c.status, Status::Failed);
    }

    // No key, and no navigation messages.
    let rep = qv::run(&frames, &store, &qv::Keys::new());
    assert_eq!(rep.no_key, 8);
    let rep = qv::run(&frames, &NavStore::default(), &keys);
    assert_eq!((rep.no_navigation, rep.checks.len()), (5, 5));
}

#[test]
fn nav_lines_and_keys_are_checked() {
    assert!(NavStore::parse("G05 gps_lnav 1").is_err());
    assert!(NavStore::parse("G05 gps_xnav 1 ab").is_err());
    assert!(NavStore::parse("G05 gps_lnav 4 ab").is_err());
    assert!(NavStore::parse("# only a comment\n\nG05 gps_cnav 33 ab\nJ01 qzs_cnav 60 ab").is_ok());
    let scratch_dir = fresh();
    let p = scratch_dir.join("not-a-key.der");
    std::fs::write(&p, b"nonsense").unwrap();
    assert!(qv::load_key(p.to_str().unwrap()).is_err());
    assert!(qv::load_key(&format!("7:{}", p.display())).is_err());
    let _ = std::fs::remove_dir_all(&scratch_dir);
}

#[test]
fn command_line_reports_each_signature() {
    let (sk, pk) = key();
    let (rds, lines) = gnss_case(Signal::GalFnav, "E12", 76, &sk, 7);
    let (rds2, lines2) = gnss_case(Signal::GpsLnav, "G05", 5, &sk, 8);
    let scratch_dir = fresh();
    let frames = scratch_dir.join("frames.txt");
    let navp = scratch_dir.join("nav.txt");
    let keyp = scratch_dir.join("005.der");
    std::fs::write(&frames, l6e_frame(205, [Some(&rds), Some(&rds2)]) + "\n").unwrap();
    // The Galileo messages only: the GPS signature has no navigation messages.
    std::fs::write(&navp, &lines).unwrap();
    let mut der = vec![
        0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2A, 0x86, 0x48, 0xCE, 0x3D, 0x02, 0x01, 0x06, 0x08,
        0x2A, 0x86, 0x48, 0xCE, 0x3D, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00,
    ];
    der.extend_from_slice(&pk.bytes);
    std::fs::write(&keyp, der).unwrap();
    let run = |extra: &[&str]| {
        let mut args = vec![
            "corrections".to_string(),
            "qznma-verify".into(),
            "--frames".into(),
            frames.display().to_string(),
            "--nav".into(),
            navp.display().to_string(),
        ];
        args.extend(extra.iter().map(|s| s.to_string()));
        std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(&args)
            .env("KSHANA_LANG", "en")
            .output()
            .unwrap()
    };
    let out = run(&["--pubkey", keyp.to_str().unwrap()]);
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["verified"], 1);
    assert_eq!(v["no_navigation"], 1);
    assert_eq!(v["checks"][0]["status"], "verified");
    assert_eq!(v["checks"][0]["signal"], "gal_fnav");
    assert_eq!(v["checks"][1]["status"], "no_navigation");
    assert!(String::from_utf8_lossy(&out.stderr).contains("2 signatures: 1 verified"));
    // A failed signature exits 1.
    std::fs::write(&navp, lines.replace("E12 gal_fnav 1 ", "E12 gal_fnav 1 ff")).unwrap();
    let out = run(&["--pubkey", &format!("5:{}", keyp.display())]);
    assert!(!out.status.success());
    let _ = std::fs::remove_dir_all(&scratch_dir);
    assert!(lines2.starts_with("G05 gps_lnav 1 "));
}
