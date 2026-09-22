// SPDX-License-Identifier: AGPL-3.0-only
//! Cross-platform comparison helpers for the byte-identity guards, integration-test side.
//!
//! This is the twin of `src/test_support.rs`, which serves the unit tests inside `src/`.
//! The duplication is deliberate and not avoidable cheaply: a `#[cfg(test)]` module in the
//! library is invisible to an integration test, and the only ways to share it are to make
//! it part of the crate's public API or to hide it behind a feature flag. Neither is worth
//! exporting test scaffolding into the published surface of a library other people depend
//! on. Keep the two in step by hand; each is under a hundred lines and the contract — a
//! relative comparison, and a digit-stripped skeleton — is small enough to hold in the head.
//!
//! See `src/test_support.rs` for the full reasoning: transcendentals are not correctly
//! rounded, every platform's libm rounds them its own way, and so a pin captured on one
//! host is a statement about that host.
#![allow(dead_code)]

/// True on the host every byte-exact literal in this repository was captured on.
pub const ON_BASELINE_HOST: bool = cfg!(all(target_arch = "aarch64", target_os = "macos"));

/// Do two `f64` agree to within `rel` relative, or to within a floor absolutely?
///
/// The floor exists for quantities that are a cancellation residue rather than a value:
/// two hosts can disagree by 100% relatively on a difference of nearly-equal numbers while
/// agreeing to 1e-15 absolutely.
pub fn close_within(a: f64, b: f64, rel: f64) -> bool {
    if a.is_nan() || b.is_nan() {
        return a.is_nan() && b.is_nan();
    }
    if a == b {
        return true;
    }
    if a.is_infinite() || b.is_infinite() {
        return false;
    }
    let diff = (a - b).abs();
    diff <= 1e-12 || diff <= rel * a.abs().max(b.abs())
}

/// A text emission reduced to the part that cannot move between platforms: every numeric
/// literal collapsed to `#`, leaving the document's keys, prose and punctuation.
///
/// Returned with it: how many numeric tokens were found, and the sum of their absolute
/// values. A number only counts when it is delimited — without that, the hex scenario
/// fingerprint in an SVG footer reads "62e71" as six point two times ten to the seventy
/// first, and a dotted version hands over its patch segment.
pub fn numeric_skeleton(s: &str) -> (String, usize, f64) {
    let (skel, vals) = numeric_values(s);
    let sum = vals.iter().map(|v| v.abs()).sum();
    (skel, vals.len(), sum)
}

/// As [`numeric_skeleton`], but handing back the values themselves so a caller can choose
/// its own aggregate. Needed because a single sentinel ruins a plain sum: these emissions
/// carry 1e22 for an unset covariance, and once that is in the total, a relative comparison
/// tolerates absolute changes of order 1e19 and every real value becomes invisible.
pub fn numeric_values(s: &str) -> (String, Vec<f64>) {
    let b = s.as_bytes();
    let mut skel = String::with_capacity(s.len());
    let mut vals: Vec<f64> = Vec::new();
    let mut i = 0usize;
    while i < b.len() {
        let prev_is_ident =
            i > 0 && (b[i - 1].is_ascii_alphanumeric() || b[i - 1] == b'_' || b[i - 1] == b'.');
        let starts = !prev_is_ident
            && (b[i].is_ascii_digit()
                || ((b[i] == b'-' || b[i] == b'.')
                    && i + 1 < b.len()
                    && b[i + 1].is_ascii_digit()));
        if !starts {
            skel.push(b[i] as char);
            i += 1;
            continue;
        }
        let start = i;
        if b[i] == b'-' {
            i += 1;
        }
        while i < b.len() && b[i].is_ascii_digit() {
            i += 1;
        }
        if i < b.len() && b[i] == b'.' {
            i += 1;
            while i < b.len() && b[i].is_ascii_digit() {
                i += 1;
            }
        }
        if i < b.len() && (b[i] == b'e' || b[i] == b'E') {
            let mut j = i + 1;
            if j < b.len() && (b[j] == b'+' || b[j] == b'-') {
                j += 1;
            }
            if j < b.len() && b[j].is_ascii_digit() {
                while j < b.len() && b[j].is_ascii_digit() {
                    j += 1;
                }
                i = j;
            }
        }
        if i < b.len() && (b[i].is_ascii_alphanumeric() || b[i] == b'_') {
            skel.push_str(&s[start..i]);
            continue;
        }
        vals.push(s[start..i].parse::<f64>().unwrap_or(f64::NAN));
        skel.push('#');
    }
    (skel, vals)
}

/// FNV-1a over bytes: small, dependency-free, and stable across platforms and releases.
/// Not a cryptographic hash and not used as one.
pub fn fnv1a64(bytes: &[u8]) -> u64 {
    let mut h: u64 = 0xcbf2_9ce4_8422_2325;
    for &x in bytes {
        h ^= x as u64;
        h = h.wrapping_mul(0x1000_0000_01b3);
    }
    h
}
