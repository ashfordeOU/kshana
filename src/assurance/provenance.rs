// SPDX-License-Identifier: AGPL-3.0-only
//! W3C-PROV-style provenance record with a deterministic SHA-256 Merkle root.
//!
//! A [`ProvRecord`] captures the inputs and environment that produced a result:
//! the engine commit, hashes of all inputs, the RNG seed (if any), free-text
//! notes about residual non-determinism, the dependency lockfile hash, an
//! optional caller-supplied timestamp, and an optional tolerance string.
//!
//! [`ProvRecord::merkle_root`] canonicalizes every field in a fixed, documented
//! order and folds them into a single 64-hex SHA-256 root via a length-prefixed
//! hash chain. The encoding is unambiguous (every segment is length-prefixed and
//! domain-labelled), so the root is stable across runs/platforms and changes if
//! and only if some field changes.
//!
//! The type is deterministic and `wasm32`-safe: it never calls
//! [`std::time::SystemTime::now`] (the timestamp is a caller-supplied field) and
//! uses only `std` collections.

use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// A W3C-PROV-style record of how a computation was produced.
#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct ProvRecord {
    /// Commit hash of the engine that produced the result.
    pub engine_commit: String,
    /// Content hashes of every input, in a caller-defined stable order.
    pub input_hashes: Vec<String>,
    /// RNG seed, if the computation was seeded.
    pub seed: Option<u64>,
    /// Free-text notes describing any residual sources of non-determinism.
    pub nondeterminism_notes: Vec<String>,
    /// Hash of the dependency lockfile (e.g. `Cargo.lock`).
    pub lockfile_hash: String,
    /// Caller-supplied timestamp (e.g. RFC-3339). Never generated internally.
    pub timestamp: Option<String>,
    /// Optional tolerance descriptor used when comparing against an oracle.
    pub tolerance: Option<String>,
}

/// Domain-separation tag mixed in before the field chain so this root cannot
/// collide with an unrelated hash chain that happens to share a prefix.
const DOMAIN_TAG: &[u8] = b"kshana.assurance.provenance.v1";

/// Absorb one length-prefixed, labelled segment into the running digest.
///
/// Each segment becomes `running || len(label) || label || len(bytes) || bytes`,
/// re-hashed with SHA-256. Length-prefixing makes the concatenation injective,
/// so distinct field layouts can never alias to the same running state.
fn absorb(running: [u8; 32], label: &[u8], bytes: &[u8]) -> [u8; 32] {
    let mut h = Sha256::new();
    h.update(running);
    h.update((label.len() as u64).to_le_bytes());
    h.update(label);
    h.update((bytes.len() as u64).to_le_bytes());
    h.update(bytes);
    h.finalize().into()
}

/// Absorb an `Option<&str>`: a tag byte (0 = None, 1 = Some) plus the value.
fn absorb_opt_str(running: [u8; 32], label: &[u8], value: Option<&str>) -> [u8; 32] {
    match value {
        None => absorb(running, label, &[0u8]),
        Some(v) => {
            let mut buf = Vec::with_capacity(1 + v.len());
            buf.push(1u8);
            buf.extend_from_slice(v.as_bytes());
            absorb(running, label, &buf)
        }
    }
}

/// Absorb a `&[String]`: the element count followed by each length-prefixed item.
fn absorb_str_vec(running: [u8; 32], label: &[u8], items: &[String]) -> [u8; 32] {
    let mut buf = Vec::new();
    buf.extend_from_slice(&(items.len() as u64).to_le_bytes());
    for item in items {
        buf.extend_from_slice(&(item.len() as u64).to_le_bytes());
        buf.extend_from_slice(item.as_bytes());
    }
    absorb(running, label, &buf)
}

impl ProvRecord {
    /// Deterministic 64-hex SHA-256 Merkle root over all fields.
    ///
    /// Fields are folded in a fixed order: `engine_commit`, `input_hashes`,
    /// `seed`, `nondeterminism_notes`, `lockfile_hash`, `timestamp`,
    /// `tolerance`. The result is stable for fixed inputs and changes whenever
    /// any field changes.
    pub fn merkle_root(&self) -> String {
        // Seed the chain with the domain tag.
        let mut running = {
            let mut h = Sha256::new();
            h.update(DOMAIN_TAG);
            let out: [u8; 32] = h.finalize().into();
            out
        };

        running = absorb(running, b"engine_commit", self.engine_commit.as_bytes());
        running = absorb_str_vec(running, b"input_hashes", &self.input_hashes);
        running = match self.seed {
            None => absorb(running, b"seed", &[0u8]),
            Some(s) => {
                let mut buf = [0u8; 9];
                buf[0] = 1;
                buf[1..].copy_from_slice(&s.to_le_bytes());
                absorb(running, b"seed", &buf)
            }
        };
        running = absorb_str_vec(running, b"nondeterminism_notes", &self.nondeterminism_notes);
        running = absorb(running, b"lockfile_hash", self.lockfile_hash.as_bytes());
        running = absorb_opt_str(running, b"timestamp", self.timestamp.as_deref());
        running = absorb_opt_str(running, b"tolerance", self.tolerance.as_deref());

        hex::encode(running)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample() -> ProvRecord {
        ProvRecord {
            engine_commit: "4c07fedabc".to_string(),
            input_hashes: vec!["aa11".to_string(), "bb22".to_string()],
            seed: Some(42),
            nondeterminism_notes: vec!["thread scheduling".to_string()],
            lockfile_hash: "deadbeef".to_string(),
            timestamp: Some("2026-06-29T00:00:00Z".to_string()),
            tolerance: Some("1e-9".to_string()),
        }
    }

    #[test]
    fn merkle_root_is_stable_for_fixed_inputs() {
        let r = sample();
        let a = r.merkle_root();
        let b = r.merkle_root();
        assert_eq!(a, b, "root must be deterministic for identical inputs");
        assert_eq!(a.len(), 64, "root must be 64 hex chars (SHA-256)");
        assert!(a.chars().all(|c| c.is_ascii_hexdigit()));
    }

    #[test]
    fn changing_any_field_changes_the_root() {
        let base = sample();
        let base_root = base.merkle_root();

        // engine_commit
        let mut r = sample();
        r.engine_commit = "0000000000".to_string();
        assert_ne!(r.merkle_root(), base_root, "engine_commit must affect root");

        // input_hashes
        let mut r = sample();
        r.input_hashes = vec!["aa11".to_string(), "bb23".to_string()];
        assert_ne!(r.merkle_root(), base_root, "input_hashes must affect root");

        // seed
        let mut r = sample();
        r.seed = Some(43);
        assert_ne!(r.merkle_root(), base_root, "seed value must affect root");

        // seed None vs Some
        let mut r = sample();
        r.seed = None;
        assert_ne!(r.merkle_root(), base_root, "seed presence must affect root");

        // nondeterminism_notes
        let mut r = sample();
        r.nondeterminism_notes = vec!["thread scheduling".to_string(), "fma".to_string()];
        assert_ne!(r.merkle_root(), base_root, "notes must affect root");

        // lockfile_hash
        let mut r = sample();
        r.lockfile_hash = "feedface".to_string();
        assert_ne!(r.merkle_root(), base_root, "lockfile_hash must affect root");

        // timestamp
        let mut r = sample();
        r.timestamp = Some("2026-06-30T00:00:00Z".to_string());
        assert_ne!(r.merkle_root(), base_root, "timestamp must affect root");

        // timestamp None vs Some
        let mut r = sample();
        r.timestamp = None;
        assert_ne!(r.merkle_root(), base_root, "timestamp presence must affect root");

        // tolerance
        let mut r = sample();
        r.tolerance = Some("1e-6".to_string());
        assert_ne!(r.merkle_root(), base_root, "tolerance must affect root");

        // tolerance None vs Some
        let mut r = sample();
        r.tolerance = None;
        assert_ne!(r.merkle_root(), base_root, "tolerance presence must affect root");
    }

    #[test]
    fn field_boundary_is_unambiguous() {
        // Moving a character across a field boundary must change the root:
        // length-prefixing prevents "ab"+"c" from aliasing "a"+"bc".
        let mut r1 = sample();
        r1.engine_commit = "ab".to_string();
        r1.lockfile_hash = "c".to_string();
        let mut r2 = sample();
        r2.engine_commit = "a".to_string();
        r2.lockfile_hash = "bc".to_string();
        assert_ne!(r1.merkle_root(), r2.merkle_root());
    }

    #[test]
    fn serde_json_round_trip_preserves_record() {
        let r = sample();
        let json = serde_json::to_string(&r).expect("serialize");
        let back: ProvRecord = serde_json::from_str(&json).expect("deserialize");
        assert_eq!(back.engine_commit, r.engine_commit);
        assert_eq!(back.input_hashes, r.input_hashes);
        assert_eq!(back.seed, r.seed);
        assert_eq!(back.nondeterminism_notes, r.nondeterminism_notes);
        assert_eq!(back.lockfile_hash, r.lockfile_hash);
        assert_eq!(back.timestamp, r.timestamp);
        assert_eq!(back.tolerance, r.tolerance);
        // Root survives the round trip too.
        assert_eq!(back.merkle_root(), r.merkle_root());
    }
}
