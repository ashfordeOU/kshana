// SPDX-License-Identifier: AGPL-3.0-only
//! Evidence-pack cryptography against published test vectors.
//!
//! The oracle is the published standards themselves: RFC 8032 section 7.1 (Ed25519 test
//! vectors 1, 2, 3 and 1024) and the SHA-256 examples of FIPS 180-4. The vectors are
//! copied into `tests/fixtures/ed25519_rfc8032/vectors.json` by
//! `scripts/gen_ed25519_rfc8032_ref.py`, which takes them from the RFC text and cross-checks
//! them with two independent implementations (`cryptography` and `hashlib`). The RFC's
//! code components, which include these test vectors, are licensed under the Simplified
//! BSD licence (IETF Trust Legal Provisions, section 4); the copyright notice is kept in
//! the fixture.
//!
//! # PRE-REGISTERED comparison rules
//!
//! Registered in this file's first commit, before the fixture was generated and before any
//! comparison was run. They are not to be loosened after seeing a result.
//!
//! * Ed25519 public key from the secret key, and the signature of the message: **exact
//!   byte equality** with the RFC's values, tolerance zero, for all four vectors.
//! * `verify_detached` accepts every RFC (public key, message, signature) triple.
//! * Rejection: every one of the 512 signature bits and 256 public-key bits of TEST 1, and
//!   every 7th bit (starting at bit 0) of the signature, public key and message of the other
//!   three vectors, when flipped, is NOT accepted (`Ok(true)` never occurs). The signature
//!   with S replaced by S + L (L the group order, a non-canonical encoding) is rejected
//!   for all four vectors.
//! * SHA-256 (`sha256_hex`, the hash the pack chain and the manifest use): **exact digest
//!   equality** for the FIPS 180-4 examples (`abc`; the 448-bit message; one million `a`)
//!   and the empty message, and for the hashlib-computed digests of the 0 to 130 byte
//!   pattern ladder, which crosses the padding boundaries (55, 56, 63, 64, 65 bytes).
//! * A pack created from RFC TEST 1's secret key names RFC TEST 1's public key, and its
//!   `manifest.sig` verifies under that public key through `verify_detached` and through
//!   `verify_bundle` with the key pinned.

use kshana::evidence::bundle::sha256_hex;
use kshana::evidence::{
    create_bundle, public_key_hex, sign_detached, verify_bundle, verify_detached, EvidenceInput,
    VerifyOptions, Window,
};
use serde_json::Value;
use std::path::Path;

/// Group order of the Ed25519 base point, little-endian (RFC 8032 section 5.1).
const L_LE: [u8; 32] = [
    0xed, 0xd3, 0xf5, 0x5c, 0x1a, 0x63, 0x12, 0x58, 0xd6, 0x9c, 0xf7, 0xa2, 0xde, 0xf9, 0xde, 0x14,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x10,
];

fn vectors() -> Value {
    let p =
        Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/ed25519_rfc8032/vectors.json");
    let t = std::fs::read_to_string(&p).unwrap_or_else(|e| {
        panic!(
            "fixture {} missing ({e}); run scripts/gen_ed25519_rfc8032_ref.py",
            p.display()
        )
    });
    serde_json::from_str(&t).unwrap()
}

fn unhex(v: &Value) -> Vec<u8> {
    hex::decode(v.as_str().unwrap()).unwrap()
}

fn arr<const N: usize>(b: Vec<u8>) -> [u8; N] {
    b.try_into().unwrap()
}

struct V {
    name: String,
    sk: [u8; 32],
    pk: [u8; 32],
    msg: Vec<u8>,
    sig: [u8; 64],
}

fn ed25519() -> Vec<V> {
    vectors()["ed25519"]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| V {
            name: v["name"].as_str().unwrap().to_string(),
            sk: arr(unhex(&v["secret_key"])),
            pk: arr(unhex(&v["public_key"])),
            msg: unhex(&v["message"]),
            sig: arr(unhex(&v["signature"])),
        })
        .collect()
}

#[test]
fn rfc8032_vectors_1_2_3_and_1024_are_all_present() {
    let v = ed25519();
    let names: Vec<&str> = v.iter().map(|x| x.name.as_str()).collect();
    assert_eq!(names, ["TEST 1", "TEST 2", "TEST 3", "TEST 1024"]);
    let lens: Vec<usize> = v.iter().map(|x| x.msg.len()).collect();
    assert_eq!(lens, [0, 1, 2, 1023]);
}

#[test]
fn rfc8032_section_7_1_keys_and_signatures_match_exactly() {
    for v in ed25519() {
        assert_eq!(
            public_key_hex(&v.sk),
            hex::encode(v.pk),
            "{}: public key",
            v.name
        );
        assert_eq!(sign_detached(&v.sk, &v.msg), v.sig, "{}: signature", v.name);
        assert_eq!(
            verify_detached(&v.pk, &v.msg, &v.sig),
            Ok(true),
            "{}: verify",
            v.name
        );
    }
}

#[test]
fn a_flipped_bit_is_never_accepted() {
    for (i, v) in ed25519().iter().enumerate() {
        let stride = if i == 0 { 1 } else { 7 };
        let not_accepted =
            |pk: &[u8; 32], msg: &[u8], sig: &[u8; 64]| verify_detached(pk, msg, sig) != Ok(true);
        for bit in (0..512).step_by(stride) {
            let mut s = v.sig;
            s[bit / 8] ^= 1 << (bit % 8);
            assert!(
                not_accepted(&v.pk, &v.msg, &s),
                "{}: signature bit {bit}",
                v.name
            );
        }
        for bit in (0..256).step_by(stride) {
            let mut k = v.pk;
            k[bit / 8] ^= 1 << (bit % 8);
            assert!(
                not_accepted(&k, &v.msg, &v.sig),
                "{}: key bit {bit}",
                v.name
            );
        }
        for bit in (0..v.msg.len() * 8).step_by(stride) {
            let mut m = v.msg.clone();
            m[bit / 8] ^= 1 << (bit % 8);
            assert!(
                not_accepted(&v.pk, &m, &v.sig),
                "{}: message bit {bit}",
                v.name
            );
        }
    }
}

#[test]
fn a_non_canonical_s_is_rejected() {
    for v in ed25519() {
        // S + L encodes the same scalar but is not the canonical (reduced) form.
        let mut s_plus_l = v.sig;
        let mut carry = 0u16;
        for k in 0..32 {
            let t = u16::from(v.sig[32 + k]) + u16::from(L_LE[k]) + carry;
            s_plus_l[32 + k] = t as u8;
            carry = t >> 8;
        }
        assert_eq!(
            carry, 0,
            "{}: S + L must still fit 256 bits for this vector",
            v.name
        );
        assert_ne!(
            verify_detached(&v.pk, &v.msg, &s_plus_l),
            Ok(true),
            "{}",
            v.name
        );
    }
}

fn message_bytes(m: &Value) -> Vec<u8> {
    if let Some(h) = m.get("hex") {
        return unhex(h);
    }
    let a = m["ascii"].as_str().unwrap().as_bytes();
    let n = m["repeat"].as_u64().unwrap() as usize;
    a.repeat(n)
}

#[test]
fn sha256_published_vectors_and_the_hashlib_ladder_match_exactly() {
    let v = vectors();
    let published = v["sha256"].as_array().unwrap();
    let names: Vec<&str> = published
        .iter()
        .map(|x| x["name"].as_str().unwrap())
        .collect();
    assert_eq!(
        names,
        [
            "FIPS 180-4 B.1 abc",
            "FIPS 180-4 B.2 448-bit",
            "FIPS 180-4 B.3 one million a",
            "empty message"
        ]
    );
    for x in published {
        let d = sha256_hex(&message_bytes(&x["message"]));
        assert_eq!(d, x["digest"].as_str().unwrap(), "{}", x["name"]);
    }
    let ladder = v["sha256_pattern_ladder"].as_array().unwrap();
    assert_eq!(ladder.len(), 131);
    for x in ladder {
        let n = x["len"].as_u64().unwrap() as usize;
        let msg: Vec<u8> = (0..n).map(|i| (i % 251) as u8).collect();
        assert_eq!(
            sha256_hex(&msg),
            x["digest"].as_str().unwrap(),
            "length {n}"
        );
    }
}

#[test]
fn a_pack_signed_with_the_rfc_key_verifies_under_the_rfc_public_key() {
    let t1 = &ed25519()[0];
    let log = b"synthetic log\n".repeat(10);
    let input = EvidenceInput {
        title: "RFC 8032 TEST 1 key",
        engine_version: "0.0.0-test",
        log_format: "nmea",
        log_file_name: "x.nmea",
        log_bytes: &log,
        start_label: None,
        slice: None,
        window: Window {
            from_s: 0.0,
            to_s: 1.0,
        },
        config: serde_json::json!({}),
        epochs: vec![serde_json::json!({"t_s": 0.0})],
        created_utc: None,
    };
    let pack = create_bundle(&input, &t1.sk, None).unwrap();
    let manifest: Value = serde_json::from_slice(&pack["manifest.json"]).unwrap();
    assert_eq!(manifest["signer"]["public_key"], hex::encode(t1.pk));
    let sig_hex = String::from_utf8(pack["manifest.sig"].clone()).unwrap();
    let sig: [u8; 64] = arr(hex::decode(sig_hex.trim_end()).unwrap());
    assert_eq!(
        verify_detached(&t1.pk, &pack["manifest.json"], &sig),
        Ok(true)
    );
    let r = verify_bundle(
        &pack,
        &VerifyOptions {
            expected_public_key: Some(t1.pk),
            ..Default::default()
        },
    );
    assert!(r.ok && r.signature_valid == Some(true), "{:?}", r.failures);
}
