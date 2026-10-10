// SPDX-License-Identifier: AGPL-3.0-only
//! Opt-in conformance check against the official OSNMA test vectors published by the
//! European GNSS Service Centre as an annex to the Receiver Guidelines.
//!
//! The vectors are not part of this repository and no network access is used. To run:
//! download the archive yourself, unpack it, and point `KSHANA_OSNMA_VECTORS` at the
//! directory that contains `osnma_test_vectors/`. Without the variable the test does
//! nothing and says so.
//!
//! Until ECDSA support is built in, the chain parameters are taken from the DSM-KROOT
//! in the stream without checking its signature; everything below that (TESLA keys,
//! MACSEQ, tags, navigation data) is verified normally.

use kshana::osnma::dsm::{DsmAssembler, DsmKroot};
use kshana::osnma::input::{parse_vector_csv, start_from_filename};
use kshana::osnma::subframe::SubframeAssembler;
use kshana::osnma::tables;
use kshana::osnma::verifier::{Chain, Config, Event, TagStatus, Verifier};
use kshana::osnma::{InavPage, OsnmaStatus};
use std::path::{Path, PathBuf};

fn vector_files(root: &Path) -> Vec<(String, PathBuf)> {
    let base = root.join("osnma_test_vectors");
    let mut out = Vec::new();
    if let Ok(dirs) = std::fs::read_dir(&base) {
        for d in dirs.flatten() {
            if let Ok(files) = std::fs::read_dir(d.path()) {
                for f in files.flatten() {
                    if f.path().extension().is_some_and(|e| e == "csv") {
                        out.push((d.file_name().to_string_lossy().into_owned(), f.path()));
                    }
                }
            }
        }
    }
    out.sort();
    out
}

/// The first DSM-KROOT found in the stream, parsed with whichever signature length
/// matches its declared block count.
fn first_kroot(pages: &[InavPage]) -> Option<(DsmKroot, u8)> {
    let mut sf = SubframeAssembler::new();
    let mut dsm = DsmAssembler::new();
    for p in pages {
        let Some(s) = sf.push(p) else { continue };
        if !s.has_osnma || !matches!(s.nma_header().nmas, 1 | 2) {
            continue;
        }
        let h = s.dsm_header();
        let Some(d) = dsm.push(h.dsm_id, h.block_id, s.dsm_block()) else {
            continue;
        };
        if d.dsm_id > 11 {
            continue;
        }
        for sig_bits in [512, 1056] {
            let Ok(k) = DsmKroot::parse(&d.bytes, sig_bits) else {
                continue;
            };
            let l = 104 * (1 + (k.key_bits + sig_bits).div_ceil(104));
            if tables::kroot_blocks(d.bytes[0] >> 4).map(|b| b * 104) == Some(l) {
                return Some((k, s.hkroot[0]));
            }
        }
    }
    None
}

#[test]
fn official_vectors_authenticate() {
    let Ok(dir) = std::env::var("KSHANA_OSNMA_VECTORS") else {
        eprintln!("KSHANA_OSNMA_VECTORS is not set: official-vector test not run");
        return;
    };
    let files = vector_files(Path::new(&dir));
    assert!(
        !files.is_empty(),
        "no vectors under {dir}/osnma_test_vectors"
    );
    for (scenario, path) in files {
        let name = path.file_name().unwrap().to_string_lossy().into_owned();
        let start = start_from_filename(&name).expect("start time from file name");
        let pages = parse_vector_csv(&std::fs::read_to_string(&path).unwrap(), start).unwrap();
        let Some((kroot, _)) = first_kroot(&pages) else {
            eprintln!("{scenario}: no DSM-KROOT in stream");
            continue;
        };
        let cfg = Config {
            trusted_chain: Some(Chain::from_kroot(&kroot)),
            ..Config::default()
        };
        let mut v = Verifier::new(cfg);
        let (mut ok, mut bad, mut pending, mut discarded) = (0, 0, 0, 0);
        let mut first_fail = None;
        for p in &pages {
            for e in v.push_page(p) {
                if let Event::Tag(t) = e {
                    match t.status {
                        TagStatus::Authenticated => ok += 1,
                        TagStatus::Failed(_) => {
                            bad += 1;
                            first_fail.get_or_insert(t);
                        }
                        TagStatus::Pending(_) => pending += 1,
                        TagStatus::Discarded(_) => discarded += 1,
                    }
                }
            }
        }
        let st = v.sat_status();
        let auth = st
            .iter()
            .filter(|(_, s)| *s == OsnmaStatus::Authenticated)
            .count();
        eprintln!(
            "{scenario}: tags ok {ok} failed {bad} pending {pending} discarded {discarded}; satellites authenticated {auth}/{}",
            st.len()
        );
        if let Some(t) = first_fail {
            eprintln!("  first failure: {t:?}");
        }
        assert!(ok > 0, "{scenario}: nothing authenticated");
        assert_eq!(
            bad, 0,
            "{scenario}: genuine vector data must not fail a check"
        );
    }
}
