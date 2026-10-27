// SPDX-License-Identifier: AGPL-3.0-only
//! Signed, verifiable evidence packs for a GNSS trust event.
//!
//! A pack is a set of named files (a directory on disk, a `BTreeMap` in memory):
//!
//! | file | content |
//! |---|---|
//! | `log-slice.bin` | the raw receiver-log bytes for the window |
//! | `config.json` | the configuration every threshold came from |
//! | `epochs.json` | the per-epoch results and reasons in the window |
//! | `summary.html` | a human-readable summary |
//! | `manifest.json` | engine version, window, every file's SHA-256, the full log's SHA-256, and a hash chain over the files |
//! | `manifest.sig` | Ed25519 signature over the exact bytes of `manifest.json` |
//! | `timestamp.tsr` | optional RFC 3161 timestamp token over `manifest.json` |
//!
//! A pack made from a laboratory session can carry a `lab_attestation` in its signed manifest
//! ([`lab::LabAttestation`]): the operator's statement of the setup, recorded as given.
//!
//! [`create_bundle`] and [`verify_bundle`] are pure: bytes in, serialisable results out, no
//! file system, clock or process access, so the Python, WebAssembly and server surfaces can
//! call them unchanged. [`cli`] is the thin command-line wrapper.
//!
//! **A pack is a technical record of what the engine computed from a log. It is not a legal
//! opinion, not a finding of fact about any event, and not a certification.**

pub mod assemble;
pub mod bundle;
pub mod cli;
pub mod html;
pub mod lab;
#[cfg(not(target_arch = "wasm32"))]
pub mod roundtrip;
pub mod tsa;
pub mod tsr;
pub mod verify;

pub use assemble::{
    build_receiver_trust_pack, build_receiver_trust_pack_attested, build_receiver_trust_pack_full,
    build_receiver_trust_pack_with, PackRequest, PackSummary,
};
pub use bundle::{
    create_bundle, create_bundle_attested, generate_seed, public_key_hex, sign_detached,
    slice_for_window, EvidenceError, EvidenceInput, Files, Manifest, Window, DISCLAIMER, FORMAT,
};
pub use lab::LabAttestation;
#[cfg(not(target_arch = "wasm32"))]
pub use roundtrip::build_round_trip_pack;
pub use verify::{
    attach_timestamp, verify_bundle, verify_detached, EvidenceSummary, Failure, VerifyOptions,
    VerifyReport,
};
