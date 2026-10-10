// SPDX-License-Identifier: AGPL-3.0-only
//! Opt-in conformance check against the official OSNMA test vectors published by the
//! European GNSS Service Centre as an annex to the Receiver Guidelines.
//!
//! The vectors are not part of this repository and no network access is used. To run:
//! download the archive yourself, unpack it, and point `KSHANA_OSNMA_VECTORS` at the
//! directory that contains `osnma_test_vectors/` and `cryptographic_material/`. Without
//! the variable the test does nothing and says so.
//!
//! The verifier is given only what a receiver would be given: a Merkle root and the
//! public keys of one tree. Chains are established from the signed DSM-KROOT in the
//! stream, so the whole path is exercised: Merkle, signature, key chain, MACSEQ, tags.

use kshana::osnma::input::{parse_vector_csv, start_from_filename};
use kshana::osnma::signature::PublicKey;
use kshana::osnma::tables::KeyType;
use kshana::osnma::verifier::{Config, Event, TagStatus, Verifier};
use kshana::osnma::OsnmaStatus;
use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

fn files_in(dir: &Path, ext: &str) -> Vec<PathBuf> {
    let mut v: Vec<PathBuf> = std::fs::read_dir(dir)
        .into_iter()
        .flatten()
        .flatten()
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|e| e == ext))
        .collect();
    v.sort();
    v
}

fn between<'a>(s: &'a str, open: &str, close: &str) -> Option<&'a str> {
    let a = s.find(open)? + open.len();
    let b = s[a..].find(close)? + a;
    Some(&s[a..b])
}

/// One Merkle tree directory of the archive: its root and its public keys.
struct Tree {
    name: String,
    root: [u8; 32],
    keys: Vec<PublicKey>,
}

fn load_trees(root: &Path) -> Vec<Tree> {
    let base = root.join("cryptographic_material");
    let mut out = Vec::new();
    for d in std::fs::read_dir(&base).into_iter().flatten().flatten() {
        let name = d.file_name().to_string_lossy().into_owned();
        let mut keys = Vec::new();
        for f in files_in(&d.path().join("PublicKey"), "xml") {
            let x = std::fs::read_to_string(&f).unwrap();
            let (Some(id), Some(pt), Some(ty)) = (
                between(&x, "<PKID>", "</PKID>"),
                between(&x, "<point>", "</point>"),
                between(&x, "<PKType>", "</PKType>"),
            ) else {
                continue;
            };
            let key_type = if ty.contains("P-256") {
                KeyType::P256
            } else {
                KeyType::P521
            };
            keys.push(PublicKey {
                pkid: id.parse().unwrap(),
                key_type,
                bytes: hex::decode(pt).unwrap(),
            });
        }
        // The Merkle root is the level-4 node of any tree file in the directory.
        let mut roots = Vec::new();
        for f in files_in(&d.path().join("MerkleTree"), "xml") {
            let x = std::fs::read_to_string(&f).unwrap();
            if let Some(n) = x.find("<TreeNode><j>4</j><i>0</i>") {
                if let Some(h) = between(&x[n..], "<x_ji>", "</x_ji>") {
                    roots.push(hex::decode(h).unwrap());
                }
            }
        }
        if let Some(r) = roots.first() {
            out.push(Tree {
                name,
                root: r.as_slice().try_into().unwrap(),
                keys,
            });
        }
    }
    out.sort_by(|a, b| a.name.cmp(&b.name));
    out
}

#[derive(Default, Debug)]
struct Tally {
    ok: u32,
    failed: u32,
    pending: u32,
    discarded: u32,
    ok_adkd: [u32; 16],
    kroot_ok: u32,
    pkr_ok: u32,
    time_rejected: u32,
    bad_crc: u32,
    key_rejected: u32,
    alert_verified: u32,
    revoked: u32,
    ok_after_revoke: u32,
    sats_auth: usize,
    sats: usize,
    /// (cid, pkid, maclt, hash, mac, key bits, tag bits) of every verified KROOT.
    chains: BTreeSet<String>,
    /// Authenticated tags by the sub-frame start of the tag, to see what follows a change.
    /// Authenticated tags sent in the last quarter of the scenario's time span.
    ok_late: u32,
}

fn run(pages: &[kshana::osnma::InavPage], tree: &Tree) -> Tally {
    let mut v = Verifier::new(Config {
        merkle_root: Some(tree.root),
        public_keys: tree.keys.clone(),
        ..Config::default()
    });
    let mut t = Tally::default();
    let (start, end) = (pages[0].gst, pages[pages.len() - 1].gst);
    let late = end - (end - start) / 4;
    for p in pages {
        for e in v.push_page(p) {
            match e {
                Event::Tag(x) => match x.status {
                    TagStatus::Authenticated => {
                        t.ok += 1;
                        t.ok_adkd[usize::from(x.adkd & 15)] += 1;
                        t.ok_late += u32::from(x.tag_gst >= late);
                        if t.revoked > 0 {
                            t.ok_after_revoke += 1;
                        }
                    }
                    TagStatus::Failed(_) => t.failed += 1,
                    TagStatus::Pending(_) => t.pending += 1,
                    TagStatus::Discarded(_) => t.discarded += 1,
                },
                Event::KrootVerified {
                    cid,
                    pkid,
                    hash,
                    mac,
                    key_bits,
                    tag_bits,
                    maclt,
                } => {
                    t.kroot_ok += 1;
                    t.chains.insert(format!(
                        "cid{cid}/pk{pkid}/maclt{maclt}/{hash:?}/{mac:?}/{key_bits}b/{tag_bits}b"
                    ));
                }
                Event::PublicKeyVerified { .. } => t.pkr_ok += 1,
                Event::AlertMessage { verified: true } => t.alert_verified += 1,
                Event::ChainRevoked { .. } | Event::PublicKeyRevoked { .. } => t.revoked += 1,
                Event::TimeRejected { .. } => t.time_rejected += 1,
                Event::BadCrc { .. } => t.bad_crc += 1,
                Event::KeyRejected { .. } => t.key_rejected += 1,
                _ => {}
            }
        }
    }
    let st = v.sat_status();
    t.sats = st.len();
    t.sats_auth = st
        .iter()
        .filter(|(_, s)| *s == OsnmaStatus::Authenticated)
        .count();
    t
}

#[derive(Clone, Copy, PartialEq)]
enum End {
    /// The scenario ends with the service usable: satellites authenticated at the end.
    Service,
    /// It ends with the chain or key revoked, or an alert: nothing may stay authenticated.
    Withdrawn,
}

struct Expect {
    scenario: &'static str,
    /// Lower bound on authenticated tags (about 97 % of what the vectors give).
    min_ok: u32,
    /// The chains the stream carries, as (cid, key id).
    chains: &'static [(u8, u8)],
    end: End,
    alert: bool,
    /// Lower bound on revocations announced by the NMA header.
    revoked: u32,
}

// Every official vector uses HMAC-SHA-256, a SHA-256 chain, 128-bit keys and 40-bit
// tags; the look-up entry is 33 in `configuration_1` and 34 elsewhere. The test checks
// this, so a change to the vectors or to the parameters the verifier reads shows up.
const EXPECT: [Expect; 18] = [
    e("configuration_1", 12_000, &[(3, 1)], End::Service, false, 0),
    e("configuration_2", 9_900, &[(0, 2)], End::Service, false, 0),
    e(
        "crev_step1",
        6_200,
        &[(0, 7), (1, 7)],
        End::Withdrawn,
        false,
        1,
    ),
    e("crev_step2", 6_400, &[(1, 7)], End::Service, false, 0),
    e("crev_step3", 12_900, &[(1, 7)], End::Service, false, 0),
    e(
        "eoc_step1",
        13_200,
        &[(0, 7), (3, 7)],
        End::Service,
        false,
        0,
    ),
    e(
        "eoc_step2",
        12_300,
        &[(0, 7), (3, 7)],
        End::Service,
        false,
        0,
    ),
    e("nmt_step1", 13_200, &[(2, 9)], End::Service, false, 0),
    e("nmt_step2", 13_100, &[(2, 9)], End::Service, false, 0),
    e("nmt_step3", 12_300, &[(2, 1)], End::Service, false, 0),
    e("npk_step1", 12_400, &[(1, 7)], End::Service, false, 0),
    e(
        "npk_step2",
        12_800,
        &[(1, 7), (1, 8)],
        End::Service,
        false,
        0,
    ),
    e("npk_step3", 12_800, &[(1, 8)], End::Service, false, 0),
    e("oam_step1", 6_200, &[(2, 1)], End::Withdrawn, true, 0),
    e("oam_step2", 0, &[(2, 1)], End::Withdrawn, true, 0),
    e(
        "pkrev_step1",
        6_300,
        &[(1, 8), (2, 9)],
        End::Withdrawn,
        false,
        2,
    ),
    e("pkrev_step2", 6_500, &[(2, 9)], End::Service, false, 0),
    e("pkrev_step3", 11_500, &[(2, 9)], End::Service, false, 0),
];

const fn e(
    scenario: &'static str,
    min_ok: u32,
    chains: &'static [(u8, u8)],
    end: End,
    alert: bool,
    revoked: u32,
) -> Expect {
    Expect {
        scenario,
        min_ok,
        chains,
        end,
        alert,
        revoked,
    }
}

#[test]
fn official_vectors_authenticate() {
    let Ok(dir) = std::env::var("KSHANA_OSNMA_VECTORS") else {
        eprintln!("KSHANA_OSNMA_VECTORS is not set: official-vector test not run");
        return;
    };
    let root = Path::new(&dir);
    let trees = load_trees(root);
    assert!(
        !trees.is_empty(),
        "no Merkle trees under {dir}/cryptographic_material"
    );
    let mut scenarios: Vec<(String, PathBuf)> = Vec::new();
    for d in std::fs::read_dir(root.join("osnma_test_vectors"))
        .unwrap()
        .flatten()
    {
        for f in files_in(&d.path(), "csv") {
            scenarios.push((d.file_name().to_string_lossy().into_owned(), f));
        }
    }
    scenarios.sort();
    let names: Vec<&str> = scenarios.iter().map(|(s, _)| s.as_str()).collect();
    let expected: Vec<&str> = EXPECT.iter().map(|x| x.scenario).collect();
    assert_eq!(
        names, expected,
        "the vector sets are not the ones this test knows"
    );
    for (scenario, path) in scenarios {
        let x = EXPECT.iter().find(|x| x.scenario == scenario).unwrap();
        let name = path.file_name().unwrap().to_string_lossy().into_owned();
        let start = start_from_filename(&name).expect("start time from file name");
        let pages = parse_vector_csv(&std::fs::read_to_string(&path).unwrap(), start).unwrap();
        // The vector set says which tree applies by what verifies: pick the tree whose
        // keys let the most tags authenticate.
        let (best, t) = trees
            .iter()
            .map(|t| (t, run(&pages, t)))
            .max_by_key(|(_, t)| t.ok)
            .unwrap();
        eprintln!(
            "{scenario} [{name}] tree {}: tags ok {} failed {} pending {} discarded {}; KROOT verified {} PKR verified {}; satellites authenticated {}/{} timerej {} crc {} keyrej {}; ADKD ok 0/4/12 {}/{}/{}; late ok {}; alert {} revoked {}; chains {:?}",
            best.name, t.ok, t.failed, t.pending, t.discarded, t.kroot_ok, t.pkr_ok,
            t.sats_auth, t.sats, t.time_rejected, t.bad_crc, t.key_rejected,
            t.ok_adkd[0], t.ok_adkd[4], t.ok_adkd[12], t.ok_late, t.alert_verified,
            t.revoked, t.chains
        );
        // Genuine data must never fail a check or be dropped for its CRC or key chain.
        assert_eq!(
            (t.failed, t.bad_crc, t.key_rejected),
            (0, 0, 0),
            "{scenario}"
        );
        assert!(
            t.ok >= x.min_ok,
            "{scenario}: only {} tags authenticated",
            t.ok
        );
        if x.min_ok >= 1000 {
            for adkd in [0, 4, 12] {
                assert!(
                    t.ok_adkd[adkd] > 0,
                    "{scenario}: no ADKD {adkd} tag authenticated"
                );
            }
        }
        // Only the parameters the vectors use are exercised, and the chains and keys
        // are the ones the scenario announces.
        let want: BTreeSet<String> = x
            .chains
            .iter()
            .map(|(cid, pk)| {
                let maclt = if scenario == "configuration_1" {
                    33
                } else {
                    34
                };
                format!("cid{cid}/pk{pk}/maclt{maclt}/Sha256/HmacSha256/128b/40b")
            })
            .collect();
        assert_eq!(t.chains, want, "{scenario}: chains verified");
        assert_eq!(t.alert_verified >= 1, x.alert, "{scenario}: alert message");
        assert!(t.revoked >= x.revoked, "{scenario}: revocations");
        match x.end {
            End::Service => {
                // Authentication is there at the end, and resumed after any change.
                assert!(t.sats_auth >= 20, "{scenario}: {} satellites", t.sats_auth);
                assert!(t.ok_late > 0, "{scenario}: authentication did not resume");
                assert_eq!(t.time_rejected, 0, "{scenario}");
            }
            End::Withdrawn => {
                assert_eq!(t.sats_auth, 0, "{scenario}: still authenticated");
                assert_eq!(t.ok_late, 0, "{scenario}");
                assert_eq!(t.ok_after_revoke, 0, "{scenario}: tags of a revoked chain");
            }
        }
    }
}
