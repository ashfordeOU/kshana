// SPDX-License-Identifier: AGPL-3.0-only
//! Building a pack: the manifest, the hash chain and the signature.

use super::html;
use ed25519_dalek::{Signer, SigningKey};
use serde::{Deserialize, Serialize};
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;

/// Manifest format identifier.
pub const FORMAT: &str = "kshana-evidence/1";
/// Domain separator that starts the hash chain.
pub const CHAIN_DOMAIN: &[u8] = b"kshana-evidence-chain/1";
/// Stated in the manifest and the summary, and in the documentation.
pub const DISCLAIMER: &str = "This pack is a technical record of what the Kshana engine \
computed from the stated receiver log with the stated configuration. It is not a legal \
opinion, not a finding of fact about any event or its cause, and not a certification.";

/// The files of a pack, by name.
pub type Files = BTreeMap<String, Vec<u8>>;

/// Names of the files the manifest lists, in hash-chain order.
pub const ARTIFACTS: [(&str, &str); 4] = [
    ("log-slice.bin", "raw receiver-log bytes for the window"),
    ("config.json", "configuration and every threshold"),
    ("epochs.json", "per-epoch results and reasons"),
    ("summary.html", "human-readable summary"),
];

/// The time window of a pack, seconds since the first epoch of the log.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Window {
    /// Window start, s.
    pub from_s: f64,
    /// Window end, s.
    pub to_s: f64,
}

/// How the slice relates to the full log.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum SliceKind {
    /// The slice is a byte range of the full log.
    ByteRange,
    /// The slice is the whole log (the source could not give a byte range for the window);
    /// the window then limits only which epochs are reported, not which log bytes.
    WholeLog,
}

/// The slice record in the manifest.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SliceRecord {
    /// How the slice was taken.
    pub kind: SliceKind,
    /// First byte of the slice in the full log.
    pub start: u64,
    /// One past the last byte.
    pub end: u64,
    /// SHA-256 of the slice bytes, hex.
    pub sha256: String,
}

/// The log record in the manifest.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct LogRecord {
    /// Log format name.
    pub format: String,
    /// File name only (no directory).
    pub file_name: String,
    /// SHA-256 of the whole log, hex.
    pub full_sha256: String,
    /// Size of the whole log, bytes.
    pub full_bytes: u64,
    /// The first epoch's absolute time as the log states it, where known.
    pub start_label: Option<String>,
    /// The slice.
    pub slice: SliceRecord,
}

/// The signer record in the manifest.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SignerRecord {
    /// Always `ed25519`.
    pub algorithm: String,
    /// The public key, hex (32 bytes).
    pub public_key: String,
    /// First 16 hex digits of the SHA-256 of the public key.
    pub fingerprint: String,
}

/// One file the manifest lists.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Artifact {
    /// File name.
    pub name: String,
    /// What it is.
    pub role: String,
    /// Size, bytes.
    pub bytes: u64,
    /// SHA-256, hex.
    pub sha256: String,
    /// Hash-chain link after this file, hex.
    pub link: String,
}

/// `manifest.json`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Manifest {
    /// [`FORMAT`].
    pub format: String,
    /// Title chosen by the user.
    pub title: String,
    /// Engine version that produced the results.
    pub engine_version: String,
    /// Creation time, RFC 3339 UTC, if the caller gave one.
    pub created_utc: Option<String>,
    /// [`DISCLAIMER`].
    pub disclaimer: String,
    /// The window.
    pub window: Window,
    /// Epochs in the window.
    pub epochs_in_window: usize,
    /// The log.
    pub log: LogRecord,
    /// The signer.
    pub signer: SignerRecord,
    /// The files, in chain order.
    pub artifacts: Vec<Artifact>,
    /// The last chain link, hex.
    pub chain_head: String,
}

/// Why a pack could not be built.
#[derive(Debug, PartialEq)]
pub enum EvidenceError {
    /// The slice range is not inside the log.
    BadSlice(String),
    /// The window is empty or inverted.
    BadWindow(String),
    /// A value could not be serialised.
    Serialise(String),
}

impl std::fmt::Display for EvidenceError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            EvidenceError::BadSlice(s) => write!(f, "bad log slice: {s}"),
            EvidenceError::BadWindow(s) => write!(f, "bad window: {s}"),
            EvidenceError::Serialise(s) => write!(f, "cannot serialise: {s}"),
        }
    }
}

impl std::error::Error for EvidenceError {}

/// Everything a pack is built from.
pub struct EvidenceInput<'a> {
    /// Title shown in the summary and manifest.
    pub title: &'a str,
    /// Engine version that produced `epochs` (normally `env!("CARGO_PKG_VERSION")`).
    pub engine_version: &'a str,
    /// Log format name.
    pub log_format: &'a str,
    /// Log file name (a path is reduced to its last component).
    pub log_file_name: &'a str,
    /// The whole log.
    pub log_bytes: &'a [u8],
    /// The absolute time of the first epoch, where the log states one.
    pub start_label: Option<&'a str>,
    /// Byte range of the window within the log, or `None` when the source cannot give one
    /// (the whole log is then bundled and the manifest says so).
    pub slice: Option<(usize, usize)>,
    /// The window.
    pub window: Window,
    /// The configuration, with every threshold and score weight, as the run used it.
    pub config: Value,
    /// The per-epoch results and reasons in the window, as the run produced them.
    pub epochs: Vec<Value>,
    /// Creation time, RFC 3339 UTC; `None` leaves it out (keeps the pack reproducible).
    pub created_utc: Option<&'a str>,
}

/// The byte range of the log that holds every epoch in `[from_s, to_s]`, from the epochs'
/// source spans (`(t_s, [start, end))`, as `LogEpoch` reports them). `None` when no epoch
/// falls in the window or any of them has no span (a live feed, RINEX 2): the caller then
/// bundles the whole log and the manifest says so.
pub fn slice_for_window(
    epochs: impl IntoIterator<Item = (f64, Option<[usize; 2]>)>,
    from_s: f64,
    to_s: f64,
) -> Option<(usize, usize)> {
    let mut range: Option<(usize, usize)> = None;
    for (t, span) in epochs {
        if t < from_s || t > to_s {
            continue;
        }
        let [a, b] = span?;
        range = Some(match range {
            None => (a, b),
            Some((x, y)) => (x.min(a), y.max(b)),
        });
    }
    range
}

/// SHA-256 as lower-case hex.
pub fn sha256_hex(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

/// The hash-chain link that follows `prev` for a file.
pub fn chain_link(prev: &[u8; 32], name: &str, file_sha256: &[u8; 32]) -> [u8; 32] {
    let mut h = Sha256::new();
    h.update(prev);
    h.update(file_sha256);
    h.update((name.len() as u32).to_be_bytes());
    h.update(name.as_bytes());
    h.finalize().into()
}

/// The first link of every chain.
pub fn chain_start() -> [u8; 32] {
    Sha256::digest(CHAIN_DOMAIN).into()
}

/// SHA-256 of a public key, first 16 hex digits.
pub fn fingerprint(public_key: &[u8]) -> String {
    sha256_hex(public_key)[..16].to_string()
}

/// A fresh 32-byte signing-key seed from the operating system's random source.
pub fn generate_seed() -> [u8; 32] {
    use rand::RngCore;
    let mut s = [0u8; 32];
    rand::rngs::OsRng.fill_bytes(&mut s);
    s
}

/// The public key (hex) for a seed.
pub fn public_key_hex(seed: &[u8; 32]) -> String {
    hex::encode(SigningKey::from_bytes(seed).verifying_key().to_bytes())
}

fn json_bytes(v: &impl Serialize) -> Result<Vec<u8>, EvidenceError> {
    let mut b =
        serde_json::to_vec_pretty(v).map_err(|e| EvidenceError::Serialise(e.to_string()))?;
    b.push(b'\n');
    Ok(b)
}

/// Build and sign a pack. `seed` is the Ed25519 signing-key seed; `timestamp_token` is an
/// optional RFC 3161 token over the SHA-256 of `manifest.json` (see `docs/EVIDENCE-PACKS.md`).
pub fn create_bundle(
    input: &EvidenceInput<'_>,
    seed: &[u8; 32],
    timestamp_token: Option<&[u8]>,
) -> Result<Files, EvidenceError> {
    if !(input.window.from_s.is_finite() && input.window.to_s.is_finite())
        || input.window.from_s > input.window.to_s
    {
        return Err(EvidenceError::BadWindow(format!(
            "from {} to {}",
            input.window.from_s, input.window.to_s
        )));
    }
    let (kind, start, end) = match input.slice {
        Some((s, e)) => {
            if s > e || e > input.log_bytes.len() {
                return Err(EvidenceError::BadSlice(format!(
                    "{s}..{e} in a log of {} bytes",
                    input.log_bytes.len()
                )));
            }
            (SliceKind::ByteRange, s, e)
        }
        None => (SliceKind::WholeLog, 0, input.log_bytes.len()),
    };
    let slice_bytes = input.log_bytes[start..end].to_vec();
    let file_name = input
        .log_file_name
        .rsplit(['/', '\\'])
        .next()
        .unwrap_or_default();

    let config = json_bytes(&input.config)?;
    let epochs = json_bytes(&input.epochs)?;

    let key = SigningKey::from_bytes(seed);
    let pk = key.verifying_key().to_bytes();
    let signer = SignerRecord {
        algorithm: "ed25519".into(),
        public_key: hex::encode(pk),
        fingerprint: fingerprint(&pk),
    };
    let log = LogRecord {
        format: input.log_format.to_string(),
        file_name: file_name.to_string(),
        full_sha256: sha256_hex(input.log_bytes),
        full_bytes: input.log_bytes.len() as u64,
        start_label: input.start_label.map(str::to_string),
        slice: SliceRecord {
            kind,
            start: start as u64,
            end: end as u64,
            sha256: sha256_hex(&slice_bytes),
        },
    };
    let summary = html::render(&html::SummaryInput {
        title: input.title,
        engine_version: input.engine_version,
        created_utc: input.created_utc,
        window: input.window,
        log: &log,
        signer: &signer,
        config: &input.config,
        epochs: &input.epochs,
    });

    let summary = summary.into_bytes();
    let contents: [&Vec<u8>; 4] = [&slice_bytes, &config, &epochs, &summary];
    let mut artifacts = Vec::new();
    let mut prev = chain_start();
    for ((name, role), bytes) in ARTIFACTS.iter().zip(contents) {
        let digest: [u8; 32] = Sha256::digest(bytes).into();
        prev = chain_link(&prev, name, &digest);
        artifacts.push(Artifact {
            name: (*name).to_string(),
            role: (*role).to_string(),
            bytes: bytes.len() as u64,
            sha256: hex::encode(digest),
            link: hex::encode(prev),
        });
    }
    let manifest = Manifest {
        format: FORMAT.into(),
        title: input.title.to_string(),
        engine_version: input.engine_version.to_string(),
        created_utc: input.created_utc.map(str::to_string),
        disclaimer: DISCLAIMER.into(),
        window: input.window,
        epochs_in_window: input.epochs.len(),
        log,
        signer,
        artifacts,
        chain_head: hex::encode(prev),
    };
    let manifest_bytes = json_bytes(&manifest)?;
    let sig = key.sign(&manifest_bytes);

    let mut files = Files::new();
    for ((name, _), bytes) in ARTIFACTS.iter().zip(contents) {
        files.insert((*name).to_string(), bytes.clone());
    }
    files.insert("manifest.json".into(), manifest_bytes);
    files.insert(
        "manifest.sig".into(),
        format!("{}\n", hex::encode(sig.to_bytes())).into_bytes(),
    );
    if let Some(t) = timestamp_token {
        files.insert("timestamp.tsr".into(), t.to_vec());
    }
    Ok(files)
}

#[cfg(test)]
mod tests {
    use super::slice_for_window;

    #[test]
    fn window_slice_spans_the_epochs_inside_it() {
        let e = [
            (0.0, Some([0, 10])),
            (1.0, Some([10, 25])),
            (2.0, Some([25, 31])),
            (3.0, Some([31, 40])),
        ];
        assert_eq!(slice_for_window(e, 1.0, 2.0), Some((10, 31)));
        assert_eq!(
            slice_for_window(e, 0.5, 0.9),
            None,
            "no epoch in the window"
        );
    }

    #[test]
    fn a_missing_span_inside_the_window_forces_the_whole_log() {
        let e = [(0.0, Some([0, 10])), (1.0, None), (2.0, Some([20, 30]))];
        assert_eq!(slice_for_window(e, 0.0, 2.0), None);
        // A missing span outside the window does not matter.
        assert_eq!(slice_for_window(e, 2.0, 2.0), Some((20, 30)));
    }
}
