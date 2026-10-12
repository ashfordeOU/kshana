//! Evidence packs: creation is deterministic, verification passes on an intact pack, and
//! changing one byte anywhere fails verification with the right reason.

use kshana::evidence::bundle::{chain_link, chain_start, ARTIFACTS};
use kshana::evidence::{
    create_bundle, public_key_hex, verify_bundle, EvidenceInput, Failure, Files, Manifest,
    VerifyOptions, Window,
};
use serde_json::json;
use sha2::{Digest, Sha256};

const SEED: [u8; 32] = [7u8; 32];

fn log() -> Vec<u8> {
    (0..400u32)
        .flat_map(|i| format!("$GPGGA,{i:06},synthetic*00\r\n").into_bytes())
        .collect()
}

fn input<'a>(log: &'a [u8], slice: Option<(usize, usize)>) -> EvidenceInput<'a> {
    EvidenceInput {
        title: "Synthetic test pack",
        engine_version: "0.0.0-test",
        log_format: "nmea",
        log_file_name: "/some/dir/session.nmea",
        log_bytes: log,
        start_label: Some("2026-01-01T00:00:00Z"),
        slice,
        window: Window { from_s: 10.0, to_s: 20.0 },
        config: json!({"monitor_config": {"cn0_drop_db": 6.0, "sats_lost": 4}}),
        epochs: (10..=20)
            .map(|t| json!({"t_s": t as f64, "state": if t > 15 {"degraded"} else {"nominal"}, "alarms": if t > 15 {vec!["cn0-drop"]} else {vec![]}}))
            .collect(),
        created_utc: Some("2026-01-02T00:00:00Z"),
    }
}

fn pack() -> Files {
    create_bundle(&input(&log(), None), &SEED, None).unwrap()
}

fn failures(f: &Files) -> Vec<Failure> {
    verify_bundle(f, &VerifyOptions::default()).failures
}

fn flip(f: &mut Files, name: &str, at: usize) {
    f.get_mut(name).unwrap()[at] ^= 0x01;
}

#[test]
fn intact_pack_verifies_and_creation_is_deterministic() {
    let a = pack();
    assert_eq!(a, pack());
    let r = verify_bundle(&a, &VerifyOptions::default());
    assert!(r.ok, "{:?}", r.failures);
    assert!(!r.signer_pinned);
    assert!(r.notes.iter().any(|n| n.contains("signer not pinned")));
    assert_eq!(r.engine_version.as_deref(), Some("0.0.0-test"));
}

#[test]
fn pinned_key_is_checked() {
    let a = pack();
    let good: [u8; 32] = hex::decode(public_key_hex(&SEED))
        .unwrap()
        .try_into()
        .unwrap();
    let r = verify_bundle(
        &a,
        &VerifyOptions {
            expected_public_key: Some(good),
            full_log: None,
            ..Default::default()
        },
    );
    assert!(r.ok && r.signer_pinned);
    let other: [u8; 32] = hex::decode(public_key_hex(&[8u8; 32]))
        .unwrap()
        .try_into()
        .unwrap();
    let r = verify_bundle(
        &a,
        &VerifyOptions {
            expected_public_key: Some(other),
            full_log: None,
            ..Default::default()
        },
    );
    assert!(r
        .failures
        .iter()
        .any(|x| matches!(x, Failure::PublicKeyMismatch { .. })));
    assert!(r.failures.contains(&Failure::SignatureInvalid));
}

#[test]
fn a_pack_re_signed_by_someone_else_is_caught_by_pinning() {
    let forged = create_bundle(&input(&log(), None), &[8u8; 32], None).unwrap();
    let r = verify_bundle(&forged, &VerifyOptions::default());
    assert!(r.ok, "intact against its own key");
    let good: [u8; 32] = hex::decode(public_key_hex(&SEED))
        .unwrap()
        .try_into()
        .unwrap();
    let r = verify_bundle(
        &forged,
        &VerifyOptions {
            expected_public_key: Some(good),
            full_log: None,
            ..Default::default()
        },
    );
    assert!(!r.ok);
}

#[test]
fn one_changed_byte_in_each_artifact_is_reported_as_that_files_hash_mismatch_only() {
    for (name, _) in ARTIFACTS {
        let len = pack()[name].len();
        for at in [0, len / 2, len - 1] {
            let mut f = pack();
            flip(&mut f, name, at);
            let got = failures(&f);
            assert!(
                matches!(got.as_slice(), [Failure::FileHashMismatch { name: n, .. }] if n == name),
                "{name}@{at}: {got:?}"
            );
        }
    }
}

#[test]
fn size_changes_are_reported_with_the_hash_failure() {
    let mut f = pack();
    f.get_mut("epochs.json").unwrap().pop();
    let got = failures(&f);
    assert!(got
        .iter()
        .any(|x| matches!(x, Failure::FileSizeMismatch { name, .. } if name == "epochs.json")));
    assert!(got
        .iter()
        .any(|x| matches!(x, Failure::FileHashMismatch { name, .. } if name == "epochs.json")));
}

#[test]
fn editing_a_manifest_value_fails_the_signature_only() {
    let mut f = pack();
    let text = String::from_utf8(f["manifest.json"].clone()).unwrap();
    let at = text.find("Synthetic").unwrap();
    flip(&mut f, "manifest.json", at);
    assert_eq!(failures(&f), vec![Failure::SignatureInvalid]);
}

#[test]
fn rehashing_after_editing_a_file_does_not_help_without_the_key() {
    // An attacker changes epochs.json and rewrites the manifest's hash and every chain link
    // to match. Everything is self-consistent; only the signature gives it away.
    let mut f = pack();
    f.get_mut("epochs.json").unwrap().extend_from_slice(b" ");
    let mut m: Manifest = serde_json::from_slice(&f["manifest.json"]).unwrap();
    let mut prev = chain_start();
    for a in &mut m.artifacts {
        let b = &f[&a.name];
        a.bytes = b.len() as u64;
        let d: [u8; 32] = Sha256::digest(b).into();
        a.sha256 = hex::encode(d);
        prev = chain_link(&prev, &a.name, &d);
        a.link = hex::encode(prev);
    }
    m.chain_head = hex::encode(prev);
    f.insert(
        "manifest.json".into(),
        serde_json::to_vec_pretty(&m).unwrap(),
    );
    assert_eq!(failures(&f), vec![Failure::SignatureInvalid]);
}

#[test]
fn a_wrong_chain_link_or_head_is_named() {
    // Same attack without fixing the chain: the signature fails and so does the chain.
    let mut f = pack();
    let mut m: Manifest = serde_json::from_slice(&f["manifest.json"]).unwrap();
    m.artifacts[1].link = "0".repeat(64);
    m.chain_head = "1".repeat(64);
    f.insert(
        "manifest.json".into(),
        serde_json::to_vec_pretty(&m).unwrap(),
    );
    let got = failures(&f);
    assert!(got.contains(&Failure::SignatureInvalid));
    assert!(got
        .iter()
        .any(|x| matches!(x, Failure::ChainMismatch { name, .. } if name == "config.json")));
    assert!(got
        .iter()
        .any(|x| matches!(x, Failure::ChainHeadMismatch { .. })));
}

#[test]
fn missing_extra_and_unsigned_packs() {
    let mut f = pack();
    f.remove("epochs.json");
    assert!(failures(&f).contains(&Failure::FileMissing {
        name: "epochs.json".into()
    }));

    let mut f = pack();
    f.insert("notes.txt".into(), b"added later".to_vec());
    assert_eq!(
        failures(&f),
        vec![Failure::UnlistedFile {
            name: "notes.txt".into()
        }]
    );

    let mut f = pack();
    f.remove("manifest.sig");
    assert_eq!(failures(&f), vec![Failure::SignatureMissing]);

    let mut f = pack();
    f.remove("manifest.json");
    assert_eq!(failures(&f), vec![Failure::ManifestMissing]);

    let mut f = pack();
    f.insert("manifest.json".into(), b"{".to_vec());
    assert!(failures(&f)
        .iter()
        .any(|x| matches!(x, Failure::ManifestMalformed { .. })));
}

#[test]
fn every_byte_of_the_signature_is_covered() {
    let n = pack()["manifest.sig"].len();
    for at in 0..n {
        let mut f = pack();
        flip(&mut f, "manifest.sig", at);
        let got = failures(&f);
        assert!(
            matches!(
                got.as_slice(),
                [Failure::SignatureInvalid] | [Failure::SignatureMalformed { .. }]
            ),
            "byte {at}: {got:?}"
        );
    }
    // Case-folding a hex digit is also a change.
    let mut f = pack();
    let at = f["manifest.sig"]
        .iter()
        .position(|b| b.is_ascii_lowercase())
        .unwrap();
    f.get_mut("manifest.sig").unwrap()[at] ^= 0x20;
    assert!(!verify_bundle(&f, &VerifyOptions::default()).ok);
}

#[test]
fn a_changed_byte_anywhere_fails_verification() {
    let base = pack();
    for (name, bytes) in &base {
        let stride = (bytes.len() / 40).max(1);
        for at in (0..bytes.len()).step_by(stride).chain([bytes.len() - 1]) {
            let mut f = base.clone();
            flip(&mut f, name, at);
            assert!(
                !verify_bundle(&f, &VerifyOptions::default()).ok,
                "{name}@{at} went unnoticed"
            );
        }
    }
}

#[test]
fn full_log_check_and_byte_range_slices() {
    let log = log();
    let f = create_bundle(&input(&log, Some((100, 400))), &SEED, None).unwrap();
    assert_eq!(f["log-slice.bin"], log[100..400]);
    let opt = |l: &'static [u8]| VerifyOptions {
        expected_public_key: None,
        full_log: Some(l),
        ..Default::default()
    };
    let leaked: &'static [u8] = Box::leak(log.clone().into_boxed_slice());
    assert!(verify_bundle(&f, &opt(leaked)).ok);
    let mut other = log.clone();
    other[5] ^= 1;
    let other: &'static [u8] = Box::leak(other.into_boxed_slice());
    assert!(verify_bundle(&f, &opt(other))
        .failures
        .iter()
        .any(|x| matches!(x, Failure::FullLogHashMismatch { .. })));

    let m: Manifest = serde_json::from_slice(&f["manifest.json"]).unwrap();
    assert_eq!(m.log.full_sha256, hex::encode(Sha256::digest(&log)));
    assert_eq!(
        m.log.file_name, "session.nmea",
        "directories are not recorded"
    );
}

#[test]
fn whole_log_fallback_is_stated_and_checked() {
    let f = pack();
    let m: Manifest = serde_json::from_slice(&f["manifest.json"]).unwrap();
    assert_eq!(serde_json::to_value(m.log.slice.kind).unwrap(), "whole-log");
    assert_eq!(m.log.slice.sha256, m.log.full_sha256);
    assert!(m.disclaimer.contains("not a legal opinion"));
    let html = String::from_utf8(f["summary.html"].clone()).unwrap();
    assert!(html.contains("not a legal opinion"));
    assert!(html.contains("WholeLog"));
}

#[test]
fn bad_inputs_are_refused() {
    let l = log();
    assert!(create_bundle(&input(&l, Some((10, l.len() + 1))), &SEED, None).is_err());
    assert!(create_bundle(&input(&l, Some((20, 10))), &SEED, None).is_err());
    let mut i = input(&l, None);
    i.window = Window {
        from_s: 5.0,
        to_s: 1.0,
    };
    assert!(create_bundle(&i, &SEED, None).is_err());
}

#[test]
fn summary_escapes_hostile_text() {
    let l = log();
    let mut i = input(&l, None);
    i.title = "<script>alert(1)</script>";
    i.epochs = vec![json!({"t_s": 1.0, "state": "<b>x</b>", "alarms": ["<img src=x>"]})];
    let f = create_bundle(&i, &SEED, None).unwrap();
    let html = String::from_utf8(f["summary.html"].clone()).unwrap();
    assert!(!html.contains("<script>") && !html.contains("<img") && !html.contains("<b>x"));
    assert!(html.contains("&lt;script&gt;"));
}

#[test]
fn renaming_a_file_is_a_missing_file_and_an_unlisted_one() {
    let mut f = pack();
    let b = f.remove("epochs.json").unwrap();
    f.insert("epochs-renamed.json".into(), b);
    let got = failures(&f);
    assert!(got.contains(&Failure::FileMissing {
        name: "epochs.json".into()
    }));
    assert!(got.contains(&Failure::UnlistedFile {
        name: "epochs-renamed.json".into()
    }));
    assert_eq!(got.len(), 2, "{got:?}");
}

#[test]
fn swapping_two_files_contents_names_both() {
    let mut f = pack();
    let a = f["config.json"].clone();
    let b = f["epochs.json"].clone();
    f.insert("config.json".into(), b);
    f.insert("epochs.json".into(), a);
    let got = failures(&f);
    for name in ["config.json", "epochs.json"] {
        assert!(
            got.iter()
                .any(|x| matches!(x, Failure::FileHashMismatch { name: n, .. } if n == name)),
            "{name}: {got:?}"
        );
    }
    assert!(
        !got.contains(&Failure::SignatureInvalid),
        "the manifest itself is untouched"
    );
}

#[test]
fn reordering_the_manifest_entries_fails_the_signature_and_the_list_check() {
    let mut f = pack();
    let mut m: Manifest = serde_json::from_slice(&f["manifest.json"]).unwrap();
    m.artifacts.swap(1, 2);
    f.insert(
        "manifest.json".into(),
        serde_json::to_vec_pretty(&m).unwrap(),
    );
    let got = failures(&f);
    assert!(got.contains(&Failure::SignatureInvalid));
    assert!(got
        .iter()
        .any(|x| matches!(x, Failure::ArtifactListMalformed { .. })));
}

#[test]
fn the_fingerprint_is_128_bits() {
    let m: Manifest = serde_json::from_slice(&pack()["manifest.json"]).unwrap();
    assert_eq!(m.signer.fingerprint.len(), 32);
    assert!(m.signer.fingerprint.bytes().all(|b| b.is_ascii_hexdigit()));
}

#[test]
fn the_creation_time_must_be_a_real_utc_time() {
    let l = log();
    for bad in [
        "yesterday-ish",
        "2026-02-30T00:00:00Z",
        "2026-01-01T00:00:00",
        "",
        "99999-01-01T00:00:00Z",
    ] {
        let mut i = input(&l, None);
        i.created_utc = Some(bad);
        assert!(
            create_bundle(&i, &SEED, None).is_err(),
            "{bad:?} was accepted"
        );
    }
    let mut i = input(&l, None);
    i.created_utc = Some("2026-01-02T03:04:05Z");
    assert!(create_bundle(&i, &SEED, None).is_ok());
}

#[test]
fn a_junk_token_is_refused_at_creation() {
    let l = log();
    let e = create_bundle(&input(&l, None), &SEED, Some(b"junk")).unwrap_err();
    assert!(e.to_string().contains("timestamp token"), "{e}");
}

#[test]
fn a_signature_without_its_newline_says_so() {
    let mut f = pack();
    f.get_mut("manifest.sig").unwrap().pop();
    let got = failures(&f);
    assert!(
        matches!(got.as_slice(), [Failure::SignatureMalformed { detail }] if detail.contains("newline")),
        "{got:?}"
    );
}
