// SPDX-License-Identifier: AGPL-3.0-only
//! Checking a pack: every hash, the chain, the signature, and an optional timestamp token,
//! reporting exactly what fails.

use super::bundle::{
    chain_link, chain_start, fingerprint, sha256_hex, Files, Manifest, SliceKind, ARTIFACTS, FORMAT,
};
use super::tsr;
use ed25519_dalek::{Signature, VerifyingKey};
use serde::Serialize;

/// Options for [`verify_bundle`].
#[derive(Default)]
pub struct VerifyOptions<'a> {
    /// A public key the verifier already trusts (obtained from the signer by another
    /// route). Without it the signature proves only that the pack is intact against the
    /// key it names itself, which anyone can generate.
    pub expected_public_key: Option<[u8; 32]>,
    /// The full original log, to check its hash and that the slice came from it.
    pub full_log: Option<&'a [u8]>,
    /// Fail unless the pack carries a timestamp token. A token is stored beside the signed
    /// manifest, not inside it, so removing one cannot be detected without this.
    pub require_timestamp: bool,
}

/// One thing that is wrong.
#[derive(Clone, Debug, PartialEq, Serialize)]
#[serde(tag = "code", rename_all = "kebab-case")]
pub enum Failure {
    /// There is no `manifest.json`.
    ManifestMissing,
    /// `manifest.json` is not a valid manifest.
    ManifestMalformed {
        /// What the parser said.
        detail: String,
    },
    /// The manifest names a format this build does not know.
    UnsupportedFormat {
        /// The format named.
        found: String,
    },
    /// There is no `manifest.sig`.
    SignatureMissing,
    /// `manifest.sig` is not 64 bytes of hex.
    SignatureMalformed {
        /// What is wrong.
        detail: String,
    },
    /// The public key is not a valid Ed25519 key.
    PublicKeyMalformed {
        /// What is wrong.
        detail: String,
    },
    /// The signature does not verify over the bytes of `manifest.json`.
    SignatureInvalid,
    /// The manifest names a different signer than the key the verifier trusts.
    PublicKeyMismatch {
        /// Fingerprint of the trusted key.
        expected_fingerprint: String,
        /// Fingerprint the manifest names.
        found_fingerprint: String,
    },
    /// The manifest's artifact list is not the one this format defines.
    ArtifactListMalformed {
        /// What is wrong.
        detail: String,
    },
    /// A listed file is absent.
    FileMissing {
        /// File name.
        name: String,
    },
    /// A listed file has a different size from the manifest's.
    FileSizeMismatch {
        /// File name.
        name: String,
        /// Size in the manifest.
        expected: u64,
        /// Size found.
        actual: u64,
    },
    /// A listed file's SHA-256 differs from the manifest's.
    FileHashMismatch {
        /// File name.
        name: String,
        /// Hash in the manifest.
        expected: String,
        /// Hash found.
        actual: String,
    },
    /// A file is in the pack but not listed in the manifest.
    UnlistedFile {
        /// File name.
        name: String,
    },
    /// A hash-chain link in the manifest is not the one its inputs give.
    ChainMismatch {
        /// The file the link follows.
        name: String,
        /// Link recomputed from the manifest's hashes.
        expected: String,
        /// Link in the manifest.
        actual: String,
    },
    /// The manifest's chain head is not the last link.
    ChainHeadMismatch {
        /// Last link.
        expected: String,
        /// Head in the manifest.
        actual: String,
    },
    /// The manifest contradicts itself about the log slice.
    SliceRecordInconsistent {
        /// What is wrong.
        detail: String,
    },
    /// `epochs.json` does not hold the epoch count the manifest states.
    EpochCountMismatch {
        /// Count in the manifest.
        expected: usize,
        /// Count found.
        actual: usize,
    },
    /// The full log supplied does not have the SHA-256 the manifest records.
    FullLogHashMismatch {
        /// Hash in the manifest.
        expected: String,
        /// Hash of the log supplied.
        actual: String,
    },
    /// The slice bytes are not the stated range of the full log supplied.
    SliceNotFromFullLog,
    /// A timestamp token was required and the pack has none.
    TimestampMissing,
    /// `timestamp.tsr` could not be read.
    TimestampMalformed {
        /// What is wrong.
        detail: String,
    },
    /// The token's imprint is not the hash of `manifest.json`.
    TimestampImprintMismatch {
        /// Hash of `manifest.json` in the token's algorithm.
        expected: String,
        /// Imprint in the token.
        actual: String,
    },
}

/// Outcome of one group of checks.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum Status {
    /// Passed.
    Pass,
    /// Failed (see `failures`).
    Fail,
    /// Not run, with the reason in `detail`.
    Skipped,
}

/// One group of checks.
#[derive(Clone, Debug, Serialize)]
pub struct Check {
    /// Group name.
    pub name: &'static str,
    /// Outcome.
    pub status: Status,
    /// One line of detail.
    pub detail: String,
}

/// What a token says, for the report.
#[derive(Clone, Debug, Serialize)]
pub struct TimestampReport {
    /// The token's imprint matches `manifest.json`.
    pub imprint_matches: bool,
    /// The time the authority stated, if the token parsed.
    pub gen_time: Option<String>,
    /// Always false in this build: timestamp authority signature not verified by Kshana (nor
    /// its certificate chain). Use `openssl ts -verify`.
    pub authority_signature_verified: bool,
}

/// The result of [`verify_bundle`].
#[derive(Clone, Debug, Serialize)]
pub struct VerifyReport {
    /// True when no check failed.
    pub ok: bool,
    /// Every failure found.
    pub failures: Vec<Failure>,
    /// The checks, in order.
    pub checks: Vec<Check>,
    /// Whether the signature verified over `manifest.json`: `Some(true)` or `Some(false)` when
    /// it was checked, `None` when it could not be (no usable key, or the signature file is
    /// absent or malformed).
    pub signature_valid: Option<bool>,
    /// Fingerprint of the key the manifest names, if it parsed.
    pub signer_fingerprint: Option<String>,
    /// True when the signature was checked against a key the verifier supplied.
    pub signer_pinned: bool,
    /// Engine version the manifest states.
    pub engine_version: Option<String>,
    /// The timestamp token, if the pack has one.
    pub timestamp: Option<TimestampReport>,
    /// Things worth knowing that are not failures.
    pub notes: Vec<String>,
}

/// Strict lower-case hex of exactly `N` bytes: no whitespace, no upper case, so no byte of
/// the encoding can change without being noticed.
/// Strict Ed25519 verification (RFC 8032 pure Ed25519, rejecting a non-canonical S): the
/// verification step of [`verify_bundle`], exposed so published test vectors can be run
/// through the same function. `Err` means `public_key` is not a valid public key; `Ok(false)`
/// means the signature does not verify.
pub fn verify_detached(public_key: &[u8; 32], msg: &[u8], sig: &[u8; 64]) -> Result<bool, String> {
    let vk = VerifyingKey::from_bytes(public_key).map_err(|e| e.to_string())?;
    Ok(vk.verify_strict(msg, &Signature::from_bytes(sig)).is_ok())
}

fn hex_fixed<const N: usize>(s: &str) -> Result<[u8; N], String> {
    if !s.bytes().all(|b| matches!(b, b'0'..=b'9' | b'a'..=b'f')) {
        return Err("not lower-case hex".into());
    }
    let v = hex::decode(s).map_err(|e| e.to_string())?;
    <[u8; N]>::try_from(v.as_slice()).map_err(|_| format!("expected {N} bytes, found {}", v.len()))
}

/// Bind an RFC 3161 timestamp token to a pack, in memory: the token is stored as
/// `timestamp.tsr` beside the signed manifest (not inside it). The pack with the token must
/// still verify, or nothing is attached. An existing token is kept unless `replace` is set.
/// This does NOT verify the timestamp authority's signature (use `openssl ts -verify`).
/// Returns the verification notes.
pub fn attach_timestamp(
    files: &mut Files,
    token: &[u8],
    replace: bool,
) -> Result<Vec<String>, String> {
    if files.contains_key("timestamp.tsr") && !replace {
        return Err("the pack already has a timestamp token; pass --replace to replace it".into());
    }
    let mut with = files.clone();
    with.insert("timestamp.tsr".into(), token.to_vec());
    let rep = verify_bundle(&with, &VerifyOptions::default());
    if !rep.ok {
        return Err(format!(
            "not attached: the pack with this token does not verify ({})",
            serde_json::to_string(&rep.failures).unwrap_or_default()
        ));
    }
    *files = with;
    Ok(rep.notes)
}

/// Verify a pack. Never panics on malformed input.
pub fn verify_bundle(files: &Files, opts: &VerifyOptions<'_>) -> VerifyReport {
    let mut r = VerifyReport {
        ok: false,
        failures: Vec::new(),
        checks: Vec::new(),
        signature_valid: None,
        signer_fingerprint: None,
        signer_pinned: opts.expected_public_key.is_some(),
        engine_version: None,
        timestamp: None,
        notes: Vec::new(),
    };
    fn close(r: &mut VerifyReport, name: &'static str, from: usize, ok_detail: &str) {
        let n = r.failures.len() - from;
        r.checks.push(Check {
            name,
            status: if n == 0 { Status::Pass } else { Status::Fail },
            detail: if n == 0 {
                ok_detail.to_string()
            } else {
                format!("{n} failure(s)")
            },
        });
    }

    let Some(mbytes) = files.get("manifest.json") else {
        r.failures.push(Failure::ManifestMissing);
        r.checks.push(Check {
            name: "manifest",
            status: Status::Fail,
            detail: "manifest.json is absent".into(),
        });
        return r;
    };
    let from = r.failures.len();
    let manifest: Option<Manifest> = match serde_json::from_slice(mbytes) {
        Ok(m) => Some(m),
        Err(e) => {
            r.failures.push(Failure::ManifestMalformed {
                detail: e.to_string(),
            });
            None
        }
    };
    if let Some(m) = &manifest {
        r.engine_version = Some(m.engine_version.clone());
        if m.format != FORMAT {
            r.failures.push(Failure::UnsupportedFormat {
                found: m.format.clone(),
            });
        }
    }
    close(&mut r, "manifest", from, "parses, known format");

    // Signature: against the pinned key if given, else the key the manifest names.
    let from = r.failures.len();
    let named_key: Option<[u8; 32]> = match &manifest {
        Some(m) => match hex_fixed::<32>(&m.signer.public_key) {
            Ok(k) => {
                r.signer_fingerprint = Some(fingerprint(&k));
                if m.signer.fingerprint != fingerprint(&k) {
                    r.failures.push(Failure::PublicKeyMalformed {
                        detail: "fingerprint does not match the public key".into(),
                    });
                }
                Some(k)
            }
            Err(e) => {
                r.failures.push(Failure::PublicKeyMalformed { detail: e });
                None
            }
        },
        None => None,
    };
    if let (Some(pin), Some(named)) = (opts.expected_public_key, named_key) {
        if pin != named {
            r.failures.push(Failure::PublicKeyMismatch {
                expected_fingerprint: fingerprint(&pin),
                found_fingerprint: fingerprint(&named),
            });
        }
    }
    let key_bytes = opts.expected_public_key.or(named_key);
    match files.get("manifest.sig") {
        None => r.failures.push(Failure::SignatureMissing),
        Some(sb) => match (
            match String::from_utf8_lossy(sb).strip_suffix('\n') {
                Some(h) => hex_fixed::<64>(h),
                None => Err("the signature file does not end with a newline".into()),
            },
            key_bytes,
        ) {
            (Err(e), _) => r.failures.push(Failure::SignatureMalformed { detail: e }),
            (Ok(sig), Some(k)) => match verify_detached(&k, mbytes, &sig) {
                Err(detail) => r.failures.push(Failure::PublicKeyMalformed { detail }),
                Ok(false) => {
                    r.signature_valid = Some(false);
                    r.failures.push(Failure::SignatureInvalid);
                }
                Ok(true) => r.signature_valid = Some(true),
            },
            (Ok(_), None) => r.notes.push(
                "the signature could not be checked because the manifest names no usable key; supply the signer's key".into(),
            ),
        },
    }
    let sig_detail = if r.signer_pinned {
        "valid for the key you supplied"
    } else {
        "valid for the key the manifest names"
    };
    close(&mut r, "signature", from, sig_detail);
    if !r.signer_pinned {
        r.notes.push(format!(
            "signer not pinned: the signature proves the pack is intact against key {}, which the pack names itself. Compare that fingerprint with one you got from the signer, or pass the key.",
            r.signer_fingerprint.as_deref().unwrap_or("(none)")
        ));
    }

    let Some(m) = manifest else {
        r.ok = false;
        return r;
    };

    // Artifact list, files, hashes.
    let from = r.failures.len();
    let listed_ok = m.artifacts.len() == ARTIFACTS.len()
        && m.artifacts
            .iter()
            .zip(ARTIFACTS)
            .all(|(a, (n, _))| a.name == n);
    if !listed_ok {
        r.failures.push(Failure::ArtifactListMalformed {
            detail: format!("expected {:?}", ARTIFACTS.map(|(n, _)| n)),
        });
    }
    for a in &m.artifacts {
        match files.get(&a.name) {
            None => r.failures.push(Failure::FileMissing {
                name: a.name.clone(),
            }),
            Some(b) => {
                if b.len() as u64 != a.bytes {
                    r.failures.push(Failure::FileSizeMismatch {
                        name: a.name.clone(),
                        expected: a.bytes,
                        actual: b.len() as u64,
                    });
                }
                let h = sha256_hex(b);
                if h != a.sha256 {
                    r.failures.push(Failure::FileHashMismatch {
                        name: a.name.clone(),
                        expected: a.sha256.clone(),
                        actual: h,
                    });
                }
            }
        }
    }
    close(
        &mut r,
        "files",
        from,
        "every listed file present with the recorded size and SHA-256",
    );

    // Unlisted files.
    let from = r.failures.len();
    for name in files.keys() {
        let known = matches!(
            name.as_str(),
            "manifest.json" | "manifest.sig" | "timestamp.tsr"
        ) || m.artifacts.iter().any(|a| &a.name == name);
        if !known {
            r.failures
                .push(Failure::UnlistedFile { name: name.clone() });
        }
    }
    close(
        &mut r,
        "no-extra-files",
        from,
        "nothing in the pack is outside the manifest",
    );

    // Chain, recomputed from the hashes the manifest records.
    let from = r.failures.len();
    let mut prev = chain_start();
    let mut chain_ok = true;
    for a in &m.artifacts {
        match hex_fixed::<32>(&a.sha256) {
            Ok(d) => {
                prev = chain_link(&prev, &a.name, &d);
                if hex::encode(prev) != a.link {
                    r.failures.push(Failure::ChainMismatch {
                        name: a.name.clone(),
                        expected: hex::encode(prev),
                        actual: a.link.clone(),
                    });
                }
            }
            Err(e) => {
                chain_ok = false;
                r.failures.push(Failure::ManifestMalformed {
                    detail: format!("{}: {e}", a.name),
                });
            }
        }
    }
    if chain_ok && hex::encode(prev) != m.chain_head {
        r.failures.push(Failure::ChainHeadMismatch {
            expected: hex::encode(prev),
            actual: m.chain_head.clone(),
        });
    }
    close(
        &mut r,
        "hash-chain",
        from,
        "every link and the head recompute",
    );

    // Slice and epoch-count consistency.
    let from = r.failures.len();
    let s = &m.log.slice;
    let mut bad = |d: String| {
        r.failures
            .push(Failure::SliceRecordInconsistent { detail: d })
    };
    if s.start > s.end || s.end > m.log.full_bytes {
        bad(format!(
            "range {}..{} is not inside a log of {} bytes",
            s.start, s.end, m.log.full_bytes
        ));
    }
    if let Some(a) = m.artifacts.iter().find(|a| a.name == "log-slice.bin") {
        if a.sha256 != s.sha256 {
            bad("slice SHA-256 differs from the artifact entry".into());
        }
        if a.bytes != s.end.saturating_sub(s.start) {
            bad("slice length differs from its range".into());
        }
    }
    if s.kind == SliceKind::WholeLog
        && (s.start != 0 || s.end != m.log.full_bytes || s.sha256 != m.log.full_sha256)
    {
        bad("a whole-log slice must be the full log".into());
    }
    if let Some(eb) = files.get("epochs.json") {
        if let Ok(v) = serde_json::from_slice::<Vec<serde_json::Value>>(eb) {
            if v.len() != m.epochs_in_window {
                r.failures.push(Failure::EpochCountMismatch {
                    expected: m.epochs_in_window,
                    actual: v.len(),
                });
            }
        }
    }
    close(
        &mut r,
        "slice-and-epochs",
        from,
        "slice record and epoch count agree",
    );

    // Full log.
    match opts.full_log {
        None => r.checks.push(Check {
            name: "full-log",
            status: Status::Skipped,
            detail: "no full log supplied".into(),
        }),
        Some(full) => {
            let from = r.failures.len();
            let h = sha256_hex(full);
            if h != m.log.full_sha256 {
                r.failures.push(Failure::FullLogHashMismatch {
                    expected: m.log.full_sha256.clone(),
                    actual: h,
                });
            } else if let Some(slice) = files.get("log-slice.bin") {
                // Check in u64 before narrowing: `as usize` would truncate on 32-bit targets.
                let in_range = s.start <= s.end && s.end <= full.len() as u64;
                if !in_range || full[s.start as usize..s.end as usize] != slice[..] {
                    r.failures.push(Failure::SliceNotFromFullLog);
                }
            }
            close(
                &mut r,
                "full-log",
                from,
                "hash matches and the slice is that range of it",
            );
        }
    }

    // Timestamp.
    match files.get("timestamp.tsr") {
        None if opts.require_timestamp => {
            r.failures.push(Failure::TimestampMissing);
            r.checks.push(Check {
                name: "timestamp",
                status: Status::Fail,
                detail: "a timestamp token was required and the pack has none".into(),
            });
        }
        None => {
            r.notes.push(
                "no timestamp token: a token sits beside the signed manifest, so its absence cannot show whether one was ever attached; pass --require-timestamp to insist on one".into(),
            );
            r.checks.push(Check {
                name: "timestamp",
                status: Status::Skipped,
                detail: "no timestamp token in the pack".into(),
            })
        }
        Some(tok) => {
            let from = r.failures.len();
            match tsr::parse_token(tok) {
                Err(e) => {
                    r.failures.push(Failure::TimestampMalformed { detail: e });
                    r.timestamp = Some(TimestampReport {
                        imprint_matches: false,
                        gen_time: None,
                        authority_signature_verified: false,
                    });
                }
                Ok(info) => {
                    let want = tsr::imprint_of(&info.hash_alg, mbytes).unwrap_or_default();
                    let matches = want == info.imprint;
                    if !matches {
                        r.failures.push(Failure::TimestampImprintMismatch {
                            expected: want,
                            actual: info.imprint.clone(),
                        });
                    }
                    r.notes.push(format!(
                        "timestamp token states {}; its imprint {} manifest.json. Timestamp authority signature not verified by Kshana: check it with `openssl ts -verify`.",
                        info.gen_time,
                        if matches { "matches" } else { "does NOT match" }
                    ));
                    r.timestamp = Some(TimestampReport {
                        imprint_matches: matches,
                        gen_time: Some(info.gen_time),
                        authority_signature_verified: false,
                    });
                }
            }
            close(
                &mut r,
                "timestamp",
                from,
                "token parses and its imprint is the hash of manifest.json",
            );
        }
    }

    r.ok = r.failures.is_empty();
    r
}

#[cfg(test)]
mod tests {
    use super::super::bundle::{create_bundle, EvidenceInput, Window};
    use super::super::tsr::test_token::token;
    use super::*;

    fn pack() -> Files {
        let log = b"synthetic log bytes\n".repeat(20);
        let input = EvidenceInput {
            title: "t",
            engine_version: "0.0.0-test",
            log_format: "nmea",
            log_file_name: "dir/x.nmea",
            log_bytes: &log,
            start_label: None,
            slice: None,
            window: Window {
                from_s: 0.0,
                to_s: 2.0,
            },
            config: serde_json::json!({"cn0_drop_db": 6.0}),
            epochs: vec![serde_json::json!({"t_s": 1.0, "state": "nominal", "alarms": []})],
            created_utc: None,
        };
        create_bundle(&input, &[9u8; 32], None).unwrap()
    }

    fn stamped(files: &mut Files, digest_of: &[u8]) {
        let d = <sha2::Sha256 as sha2::Digest>::digest(digest_of);
        files.insert("timestamp.tsr".into(), token(&d, "20260102030405Z", true));
    }

    #[test]
    fn matching_token_binds_and_says_authority_is_unchecked() {
        let mut f = pack();
        let m = f["manifest.json"].clone();
        stamped(&mut f, &m);
        let r = verify_bundle(&f, &VerifyOptions::default());
        assert!(r.ok, "{:?}", r.failures);
        let t = r.timestamp.unwrap();
        assert!(t.imprint_matches && !t.authority_signature_verified);
        assert_eq!(t.gen_time.as_deref(), Some("2026-01-02T03:04:05Z"));
        assert!(r
            .notes
            .iter()
            .any(|n| n.contains("Timestamp authority signature not verified by Kshana")));
    }

    #[test]
    fn token_over_something_else_fails_with_imprint_mismatch() {
        let mut f = pack();
        stamped(&mut f, b"not the manifest");
        let r = verify_bundle(&f, &VerifyOptions::default());
        assert!(matches!(
            r.failures.as_slice(),
            [Failure::TimestampImprintMismatch { .. }]
        ));
    }

    #[test]
    fn garbage_token_fails_as_malformed() {
        let mut f = pack();
        f.insert("timestamp.tsr".into(), b"junk".to_vec());
        let r = verify_bundle(&f, &VerifyOptions::default());
        assert!(matches!(
            r.failures.as_slice(),
            [Failure::TimestampMalformed { .. }]
        ));
    }

    #[test]
    fn editing_the_manifest_after_stamping_breaks_signature_and_imprint() {
        let mut f = pack();
        let m = f["manifest.json"].clone();
        stamped(&mut f, &m);
        let at = String::from_utf8_lossy(&m).find("\"t\"").unwrap() + 1;
        f.get_mut("manifest.json").unwrap()[at] = b'u';
        let r = verify_bundle(&f, &VerifyOptions::default());
        assert!(r.failures.contains(&Failure::SignatureInvalid));
        assert!(r
            .failures
            .iter()
            .any(|x| matches!(x, Failure::TimestampImprintMismatch { .. })));
    }

    #[test]
    fn a_stripped_token_is_noticed_only_when_one_is_required() {
        let mut f = pack();
        let m = f["manifest.json"].clone();
        stamped(&mut f, &m);
        assert!(verify_bundle(&f, &VerifyOptions::default()).ok);
        f.remove("timestamp.tsr");
        // The token sits beside the signed manifest, so by default its absence is a note...
        let r = verify_bundle(&f, &VerifyOptions::default());
        assert!(r.ok);
        assert!(r.notes.iter().any(|n| n.contains("--require-timestamp")));
        // ...and a failure when the verifier insists on one.
        let r = verify_bundle(
            &f,
            &VerifyOptions {
                require_timestamp: true,
                ..Default::default()
            },
        );
        assert_eq!(r.failures, vec![Failure::TimestampMissing]);
    }

    #[test]
    fn a_replaced_token_over_other_bytes_is_caught() {
        let mut f = pack();
        let m = f["manifest.json"].clone();
        stamped(&mut f, &m);
        stamped(&mut f, b"a different document");
        let r = verify_bundle(&f, &VerifyOptions::default());
        assert!(matches!(
            r.failures.as_slice(),
            [Failure::TimestampImprintMismatch { .. }]
        ));
    }

    #[test]
    fn creation_accepts_only_a_token_over_the_same_manifest() {
        let input = || EvidenceInput {
            title: "t",
            engine_version: "0.0.0-test",
            log_format: "nmea",
            log_file_name: "x.nmea",
            log_bytes: b"abc",
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
        let plain = create_bundle(&input(), &[9u8; 32], None).unwrap();
        let d = <sha2::Sha256 as sha2::Digest>::digest(&plain["manifest.json"]);
        let good = token(&d, "20260102030405Z", true);
        let stamped = create_bundle(&input(), &[9u8; 32], Some(&good)).unwrap();
        assert!(verify_bundle(&stamped, &VerifyOptions::default()).ok);
        let other = token(&[0u8; 32], "20260102030405Z", true);
        assert!(create_bundle(&input(), &[9u8; 32], Some(&other)).is_err());
    }
}
