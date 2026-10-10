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
    kroot_ok: u32,
    pkr_ok: u32,
    sats_auth: usize,
    sats: usize,
}

fn run(pages: &[kshana::osnma::InavPage], tree: &Tree) -> Tally {
    let mut v = Verifier::new(Config {
        merkle_root: Some(tree.root),
        public_keys: tree.keys.clone(),
        ..Config::default()
    });
    let mut t = Tally::default();
    for p in pages {
        for e in v.push_page(p) {
            match e {
                Event::Tag(x) => match x.status {
                    TagStatus::Authenticated => t.ok += 1,
                    TagStatus::Failed(_) => t.failed += 1,
                    TagStatus::Pending(_) => t.pending += 1,
                    TagStatus::Discarded(_) => t.discarded += 1,
                },
                Event::KrootVerified { .. } => t.kroot_ok += 1,
                Event::PublicKeyVerified { .. } => t.pkr_ok += 1,
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
    assert!(
        !scenarios.is_empty(),
        "no vectors under {dir}/osnma_test_vectors"
    );
    for (scenario, path) in scenarios {
        let name = path.file_name().unwrap().to_string_lossy().into_owned();
        let start = start_from_filename(&name).expect("start time from file name");
        let pages = parse_vector_csv(&std::fs::read_to_string(&path).unwrap(), start).unwrap();
        // The vector set says which tree applies by what verifies: pick the tree whose
        // keys let the most tags authenticate.
        let (best, tally) = trees
            .iter()
            .map(|t| (t, run(&pages, t)))
            .max_by_key(|(_, t)| t.ok)
            .unwrap();
        eprintln!(
            "{scenario} [{name}] tree {}: tags ok {} failed {} pending {} discarded {}; KROOT verified {} PKR verified {}; satellites authenticated {}/{}",
            best.name, tally.ok, tally.failed, tally.pending, tally.discarded,
            tally.kroot_ok, tally.pkr_ok, tally.sats_auth, tally.sats
        );
        assert_eq!(
            tally.failed, 0,
            "{scenario}: genuine vector data must not fail a check"
        );
        if scenario != "oam_step2" {
            assert!(tally.ok > 0, "{scenario}: nothing authenticated");
        }
    }
}
