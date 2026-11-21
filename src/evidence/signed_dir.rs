// SPDX-License-Identifier: AGPL-3.0-only
//! Offline verification of a signed directory: a directory whose root holds `signature.json`,
//! an Ed25519 statement over the SHA-256 of every other regular file in it
//! (`kshana evidence verify-dir`, docs/SIGNED-DIRECTORY.md).
//!
//! `signature.json` (format `kshana-dossier-signature/1`) holds `format`, `signer`, `utc`,
//! `public_key` (64 hex, Ed25519), `key_id` (the first 16 hex digits of SHA-256 of the public key
//! bytes), `files` (`[{path, sha256}]`, `/`-separated relative paths, sorted by path) and
//! `signature` (128 hex). The signed bytes are the compact JSON of the statement without
//! `signature`, fields in the order above. `files` covers every regular file under the
//! directory except `signature.json` itself and `longterm.json`, which is added after signing
//! and protects itself with timestamps over the signature.
//!
//! Checks: the format; the key id against the key; the signature (`verify_strict`); every listed
//! file present with an equal hash; every present file listed; and whether the key is one the
//! caller trusts. The directory is walked once and hashed; a listed path is only ever compared,
//! never opened, so a path in the statement cannot reach outside the directory.

use serde::Serialize;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;
use std::path::Path;

/// The statement format this module verifies.
pub const FORMAT: &str = "kshana-dossier-signature/1";
/// The statement file at the directory root.
pub const SIGNATURE_FILE: &str = "signature.json";
/// Added after signing; not covered by the statement.
pub const LONGTERM_FILE: &str = "longterm.json";
/// An optional file describing the pack, reported for information.
pub const ENVELOPE_FILE: &str = "operating-envelope.json";

/// One listed file, as signed.
#[derive(Clone, Debug, PartialEq, Eq, Serialize, serde::Deserialize)]
pub struct FileEntry {
    /// `/`-separated path of the file relative to the directory root.
    pub path: String,
    /// SHA-256 of the file's bytes, as hex (compared case-insensitively).
    pub sha256: String,
}

/// The signed statement, fields in signing order.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct Statement {
    /// Statement format; [`FORMAT`] is the one this module verifies.
    pub format: String,
    /// Signer name as written in `signature.json`.
    pub signer: String,
    /// Signing time as written in `signature.json`.
    pub utc: String,
    /// Ed25519 public key, 64 hex digits.
    pub public_key: String,
    /// First 16 hex digits of SHA-256 of the public key bytes.
    pub key_id: String,
    /// Every covered file with its SHA-256, sorted by path.
    pub files: Vec<FileEntry>,
}

impl Statement {
    /// The bytes the signature covers: compact JSON in field order.
    pub fn signed_bytes(&self) -> Vec<u8> {
        serde_json::to_vec(self).unwrap_or_default()
    }
}

/// The key id of a public key: the first 16 hex digits of SHA-256 of its bytes.
pub fn key_id_of(public_key: &[u8; 32]) -> String {
    hex::encode(Sha256::digest(public_key))[..16].to_string()
}

/// What is wrong with the directory against the statement.
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case", tag = "kind")]
pub enum Problem {
    /// The statement's format is not [`FORMAT`].
    Format {
        /// The `format` value the statement carries.
        found: String,
    },
    /// `key_id` is not the first 16 hex digits of SHA-256 of the public key.
    KeyId {
        /// The `key_id` the statement carries.
        found: String,
        /// The key id computed from the statement's public key (16 hex digits).
        expected: String,
    },
    /// A listed file is not in the directory.
    Missing {
        /// Relative path of the listed file that is not in the directory.
        path: String,
    },
    /// A listed file has a different SHA-256.
    Changed {
        /// Relative path of the file.
        path: String,
        /// SHA-256 hex given for the file in the statement.
        listed: String,
        /// SHA-256 hex of the file as found in the directory.
        found: String,
    },
    /// A file in the directory is not listed.
    NotCovered {
        /// Relative path of the file found in the directory but not listed.
        path: String,
    },
    /// A listed path is listed more than once.
    Duplicate {
        /// The path listed more than once.
        path: String,
    },
    /// An entry in the directory that is not a regular file or directory (a symbolic link, for
    /// example): it is not covered and a reader could be misled by it.
    NotRegular {
        /// Relative path of the entry that is neither a regular file nor a directory.
        path: String,
    },
}

/// The outcome.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DirReport {
    /// Report schema, [`REPORT_SCHEMA`].
    pub schema: &'static str,
    /// Statement `format`, as read from `signature.json`.
    pub format: String,
    /// Statement `signer`, as read from `signature.json`.
    pub signer: String,
    /// Statement `utc` (signing time), as read from `signature.json`.
    pub utc: String,
    /// Statement `public_key` (Ed25519, 64 hex), as read from `signature.json`.
    pub public_key: String,
    /// Statement `key_id`, as read; checked against the public key (see [`Problem::KeyId`]).
    pub key_id: String,
    /// The signature verified over the statement with the key it names.
    pub signature_valid: bool,
    /// The key is one of those given with `--trust`.
    pub trusted: bool,
    /// Files listed in the statement.
    pub files_listed: usize,
    /// Regular files found (excluding `signature.json` and `longterm.json`).
    pub files_found: usize,
    /// Every mismatch found between the directory and the statement; empty when none.
    pub problems: Vec<Problem>,
    /// `longterm.json` is present (not covered by the statement, not checked here).
    pub longterm_present: bool,
    /// Top-level fields of `signature.json` that are not part of the signed statement.
    pub unsigned_fields: Vec<String>,
    /// `format` and `family` of `operating-envelope.json`, when present; information only.
    pub envelope: BTreeMap<String, String>,
    /// Signature valid, no problems, and the key trusted.
    pub passed: bool,
}

/// Schema of the `--json` report.
pub const REPORT_SCHEMA: &str = "kshana.signed-dir-verify/1";

/// Errors that stop the check before it starts.
fn err_read(path: &Path, e: impl std::fmt::Display) -> String {
    crate::terr!(
        "e-evidence-dir-cannot-read",
        path = path.display().to_string(),
        e = e.to_string()
    )
}

/// Walk `root`, returning `/`-separated relative paths of regular files with their SHA-256, and
/// the relative paths of entries that are neither regular files nor directories.
fn walk(root: &Path) -> Result<(BTreeMap<String, String>, Vec<String>), String> {
    let mut files = BTreeMap::new();
    let mut odd = Vec::new();
    let mut stack = vec![(root.to_path_buf(), String::new())];
    while let Some((dir, rel)) = stack.pop() {
        let rd = std::fs::read_dir(&dir).map_err(|e| err_read(&dir, e))?;
        for e in rd {
            let e = e.map_err(|e| err_read(&dir, e))?;
            let name = e.file_name().to_string_lossy().to_string();
            let path = if rel.is_empty() {
                name.clone()
            } else {
                format!("{rel}/{name}")
            };
            let ty = e.file_type().map_err(|err| err_read(&e.path(), err))?;
            if ty.is_dir() {
                stack.push((e.path(), path));
            } else if ty.is_file() {
                let bytes = std::fs::read(e.path()).map_err(|err| err_read(&e.path(), err))?;
                files.insert(path, hex::encode(Sha256::digest(&bytes)));
            } else {
                odd.push(path);
            }
        }
    }
    odd.sort();
    Ok((files, odd))
}

fn str_field(doc: &Value, k: &str) -> Result<String, String> {
    doc.get(k)
        .and_then(Value::as_str)
        .map(str::to_string)
        .ok_or_else(|| crate::terr!("e-evidence-dir-bad-field", field = k.to_string()))
}

/// Verify the signed directory at `root` against the trusted keys.
pub fn verify_dir(root: &Path, trusted: &[[u8; 32]]) -> Result<DirReport, String> {
    let sig_path = root.join(SIGNATURE_FILE);
    let text = std::fs::read_to_string(&sig_path).map_err(|e| err_read(&sig_path, e))?;
    let doc: Value = serde_json::from_str(&text).map_err(|e| {
        crate::terr!(
            "e-evidence-dir-bad-json",
            path = sig_path.display().to_string(),
            e = e.to_string()
        )
    })?;
    let files: Vec<FileEntry> =
        serde_json::from_value(doc.get("files").cloned().ok_or_else(|| {
            crate::terr!("e-evidence-dir-bad-field", field = "files".to_string())
        })?)
        .map_err(|_| crate::terr!("e-evidence-dir-bad-field", field = "files".to_string()))?;
    let st = Statement {
        format: str_field(&doc, "format")?,
        signer: str_field(&doc, "signer")?,
        utc: str_field(&doc, "utc")?,
        public_key: str_field(&doc, "public_key")?,
        key_id: str_field(&doc, "key_id")?,
        files,
    };
    let signature = str_field(&doc, "signature")?;
    let unsigned_fields: Vec<String> = doc
        .as_object()
        .map(|o| {
            o.keys()
                .filter(|k| {
                    ![
                        "format",
                        "signer",
                        "utc",
                        "public_key",
                        "key_id",
                        "files",
                        "signature",
                    ]
                    .contains(&k.as_str())
                })
                .cloned()
                .collect()
        })
        .unwrap_or_default();

    let mut problems = Vec::new();
    if st.format != FORMAT {
        problems.push(Problem::Format {
            found: st.format.clone(),
        });
    }
    let mut pk = [0u8; 32];
    let pk_ok = st.public_key.len() == 64 && hex::decode_to_slice(&st.public_key, &mut pk).is_ok();
    if !pk_ok {
        return Err(crate::terr!(
            "e-evidence-dir-bad-field",
            field = "public_key".to_string()
        ));
    }
    let expected_kid = key_id_of(&pk);
    if st.key_id.to_ascii_lowercase() != expected_kid {
        problems.push(Problem::KeyId {
            found: st.key_id.clone(),
            expected: expected_kid,
        });
    }
    let mut sig = [0u8; 64];
    let signature_valid = signature.len() == 128
        && hex::decode_to_slice(&signature, &mut sig).is_ok()
        && crate::evidence::verify::verify_detached(&pk, &st.signed_bytes(), &sig).unwrap_or(false);

    let (mut found, odd) = walk(root)?;
    found.remove(SIGNATURE_FILE);
    let longterm_present = found.remove(LONGTERM_FILE).is_some();
    let mut seen: BTreeMap<&str, ()> = BTreeMap::new();
    for f in &st.files {
        if seen.insert(f.path.as_str(), ()).is_some() {
            problems.push(Problem::Duplicate {
                path: f.path.clone(),
            });
            continue;
        }
        match found.get(&f.path) {
            None => problems.push(Problem::Missing {
                path: f.path.clone(),
            }),
            Some(h) if *h != f.sha256.to_ascii_lowercase() => problems.push(Problem::Changed {
                path: f.path.clone(),
                listed: f.sha256.clone(),
                found: h.clone(),
            }),
            Some(_) => {}
        }
    }
    for p in found.keys() {
        if !seen.contains_key(p.as_str()) {
            problems.push(Problem::NotCovered { path: p.clone() });
        }
    }
    for p in odd {
        problems.push(Problem::NotRegular { path: p });
    }

    let mut envelope = BTreeMap::new();
    if found.contains_key(ENVELOPE_FILE) {
        if let Some(v) = std::fs::read_to_string(root.join(ENVELOPE_FILE))
            .ok()
            .and_then(|t| serde_json::from_str::<Value>(&t).ok())
        {
            for k in ["format", "family"] {
                if let Some(s) = v.get(k).and_then(Value::as_str) {
                    envelope.insert(k.to_string(), s.to_string());
                }
            }
        }
    }
    let trusted_key = trusted.contains(&pk);
    let passed = signature_valid && problems.is_empty() && trusted_key;
    Ok(DirReport {
        schema: REPORT_SCHEMA,
        format: st.format,
        signer: st.signer,
        utc: st.utc,
        public_key: st.public_key,
        key_id: st.key_id,
        signature_valid,
        trusted: trusted_key,
        files_listed: st.files.len(),
        files_found: found.len(),
        problems,
        longterm_present,
        unsigned_fields,
        envelope,
        passed,
    })
}

/// Sign `root` with `seed` as `signer` at `utc`, writing `signature.json`. For tests and for
/// producing test vectors; the files list follows the same rules as the check.
pub fn sign_dir(root: &Path, seed: &[u8; 32], signer: &str, utc: &str) -> Result<(), String> {
    let (mut found, _) = walk(root)?;
    found.remove(SIGNATURE_FILE);
    found.remove(LONGTERM_FILE);
    let pk_hex = crate::evidence::bundle::public_key_hex(seed);
    let mut pk = [0u8; 32];
    hex::decode_to_slice(&pk_hex, &mut pk).map_err(|e| e.to_string())?;
    let st = Statement {
        format: FORMAT.into(),
        signer: signer.into(),
        utc: utc.into(),
        public_key: pk_hex,
        key_id: key_id_of(&pk),
        files: found
            .into_iter()
            .map(|(path, sha256)| FileEntry { path, sha256 })
            .collect(),
    };
    let sig = crate::evidence::bundle::sign_detached(seed, &st.signed_bytes());
    let mut v = serde_json::to_value(&st).map_err(|e| e.to_string())?;
    v["signature"] = Value::String(hex::encode(sig));
    let out = serde_json::to_string_pretty(&v).map_err(|e| e.to_string())?;
    std::fs::write(root.join(SIGNATURE_FILE), out + "\n").map_err(|e| {
        crate::terr!(
            "e-evidence-cli-cannot-write",
            path = root.join(SIGNATURE_FILE).display(),
            e = e
        )
    })
}

/// The text form of a report.
pub fn to_text(r: &DirReport) -> String {
    let mut out = Vec::new();
    out.push(crate::t!(
        "evidence-dir-statement",
        format = r.format.clone(),
        signer = r.signer.clone(),
        utc = r.utc.clone(),
        key_id = r.key_id.clone(),
        n = r.files_listed
    ));
    out.push(if r.signature_valid {
        crate::t!("evidence-dir-signature-valid", key = r.public_key.clone())
    } else {
        crate::t!("evidence-dir-signature-invalid", key = r.public_key.clone())
    });
    for p in &r.problems {
        out.push(crate::t!(
            "evidence-dir-problem",
            p = serde_json::to_string(p).unwrap_or_default()
        ));
    }
    if r.longterm_present {
        out.push(crate::t!("evidence-dir-longterm-present"));
    }
    if !r.unsigned_fields.is_empty() {
        out.push(crate::t!(
            "evidence-dir-unsigned-fields",
            fields = r.unsigned_fields.join(", ")
        ));
    }
    for (k, v) in &r.envelope {
        out.push(crate::t!(
            "evidence-dir-envelope",
            key = k.clone(),
            value = v.clone()
        ));
    }
    out.push(if r.passed {
        crate::t!("evidence-dir-passed")
    } else if r.signature_valid && r.problems.is_empty() {
        crate::t!("evidence-dir-intact-untrusted", key = r.public_key.clone())
    } else {
        crate::t!("evidence-dir-failed", n = r.problems.len())
    });
    out.join("\n")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn signed_bytes_keep_the_field_order() {
        let st = Statement {
            format: FORMAT.into(),
            signer: "s".into(),
            utc: "u".into(),
            public_key: "p".into(),
            key_id: "k".into(),
            files: vec![FileEntry {
                path: "a/b".into(),
                sha256: "h".into(),
            }],
        };
        assert_eq!(
            String::from_utf8(st.signed_bytes()).unwrap(),
            r#"{"format":"kshana-dossier-signature/1","signer":"s","utc":"u","public_key":"p","key_id":"k","files":[{"path":"a/b","sha256":"h"}]}"#
        );
    }
}
