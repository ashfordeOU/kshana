// SPDX-License-Identifier: AGPL-3.0-only
//! Content hashes for campaign provenance: SHA-256 of canonical JSON, and of files.
//!
//! Canonical JSON is `serde_json`'s compact form of a [`serde_json::Value`]. Its object
//! keys are sorted (the crate is built without `preserve_order`), and floats print in the
//! shortest form that round-trips. Two values that are equal therefore hash equal,
//! whatever order their keys were written in.

use sha2::{Digest, Sha256};
use std::io::Read;
use std::path::Path;

/// A lowercase hex SHA-256 digest.
pub type CanonicalHash = String;

/// SHA-256 (hex) of `bytes`.
pub fn sha256_hex(bytes: &[u8]) -> CanonicalHash {
    hex::encode(Sha256::digest(bytes))
}

/// SHA-256 (hex) of the canonical JSON of `v`.
pub fn canonical_hash(v: &serde_json::Value) -> CanonicalHash {
    sha256_hex(canonical_json(v).as_bytes())
}

/// The canonical (compact, key-sorted) JSON text of `v`.
pub fn canonical_json(v: &serde_json::Value) -> String {
    serde_json::to_string(v).unwrap_or_default()
}

/// SHA-256 (hex) of a file's contents, streamed in bounded memory.
pub fn sha256_file(path: &Path) -> Result<CanonicalHash, String> {
    let mut f = std::fs::File::open(path).map_err(|e| format!("{}: {e}", path.display()))?;
    let mut h = Sha256::new();
    let mut buf = vec![0u8; 1 << 20];
    loop {
        let n = f
            .read(&mut buf)
            .map_err(|e| format!("{}: {e}", path.display()))?;
        if n == 0 {
            break;
        }
        h.update(&buf[..n]);
    }
    Ok(hex::encode(h.finalize()))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn key_order_does_not_change_the_hash() {
        let a: serde_json::Value = serde_json::from_str(r#"{"b":1,"a":[1.5,2]}"#).unwrap();
        let b: serde_json::Value = serde_json::from_str(r#"{"a":[1.5,2],"b":1}"#).unwrap();
        assert_eq!(canonical_hash(&a), canonical_hash(&b));
        assert_eq!(canonical_json(&a), r#"{"a":[1.5,2],"b":1}"#);
    }
}
