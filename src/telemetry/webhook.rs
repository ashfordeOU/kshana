// SPDX-License-Identifier: AGPL-3.0-only
//! Signed webhook payloads (roadmap A4): a receiver can check that an alert (a CAP message, a trust
//! sample as JSON, any body) came from the holder of a shared secret, was not changed, and is fresh.
//!
//! Signature: HMAC-SHA256 (RFC 2104 with SHA-256) over the bytes `<t>.<body>`, where `<t>` is the UNIX time
//! of signing in whole seconds, sent in one header:
//!
//! `Kshana-Signature: t=<t>,v1=<lower-case hex>`
//!
//! Verification recomputes the HMAC, compares in constant time, and refuses a timestamp more than the
//! stated tolerance from the receiver's clock (a replay window). Several `v1=` values may be sent while
//! a secret is being rotated; any match passes. Delivery (HTTP POST, a queue) is the operator's.
//!
//! The HMAC is checked against the RFC 4231 test vectors in `tests/telemetry_webhook.rs`.
use hmac::{Hmac, Mac};
use sha2::Sha256;

/// The header name.
pub const HEADER: &str = "Kshana-Signature";

/// HMAC-SHA256 of `msg` under `key`.
pub fn hmac_sha256(key: &[u8], msg: &[u8]) -> [u8; 32] {
    let mut m = <Hmac<Sha256> as Mac>::new_from_slice(key).expect("HMAC accepts any key length");
    m.update(msg);
    m.finalize().into_bytes().into()
}

fn signed_bytes(t: i64, body: &[u8]) -> Vec<u8> {
    let mut v = t.to_string().into_bytes();
    v.push(b'.');
    v.extend_from_slice(body);
    v
}

/// The header value for `body` signed with `secret` at UNIX time `t`.
pub fn sign(body: &[u8], secret: &[u8], t: i64) -> String {
    format!(
        "t={t},v1={}",
        hex::encode(hmac_sha256(secret, &signed_bytes(t, body)))
    )
}

/// Why a signature was refused.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Refusal {
    /// The header is not `t=<int>,v1=<hex>[,v1=<hex>...]`.
    Malformed,
    /// The timestamp is further than the tolerance from now.
    Stale,
    /// No `v1` value matches.
    Mismatch,
}

fn ct_eq(a: &[u8], b: &[u8]) -> bool {
    a.len() == b.len() && a.iter().zip(b).fold(0u8, |acc, (x, y)| acc | (x ^ y)) == 0
}

/// Verify a header value for `body` against `secret`, at receiver time `now` (UNIX s), allowing
/// `tolerance_s` seconds of age or clock difference either way.
pub fn verify(
    body: &[u8],
    header: &str,
    secret: &[u8],
    now: i64,
    tolerance_s: i64,
) -> Result<(), Refusal> {
    let mut t = None;
    let mut sigs = Vec::new();
    for part in header.split(',') {
        match part.trim().split_once('=') {
            Some(("t", v)) => t = Some(v.parse::<i64>().map_err(|_| Refusal::Malformed)?),
            Some(("v1", v)) => sigs.push(hex::decode(v).map_err(|_| Refusal::Malformed)?),
            _ => return Err(Refusal::Malformed),
        }
    }
    let t = t.ok_or(Refusal::Malformed)?;
    if sigs.is_empty() {
        return Err(Refusal::Malformed);
    }
    if (now - t).abs() > tolerance_s {
        return Err(Refusal::Stale);
    }
    let want = hmac_sha256(secret, &signed_bytes(t, body));
    if sigs.iter().any(|s| ct_eq(s, &want)) {
        Ok(())
    } else {
        Err(Refusal::Mismatch)
    }
}
