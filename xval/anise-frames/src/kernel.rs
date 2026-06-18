// SPDX-License-Identifier: AGPL-3.0-only
//! Locating (and, on demand, fetching) the SPICE kernel ANISE needs.
//!
//! The high-precision Earth body-fixed frame (ITRF93) is only resolvable from JPL's
//! binary Earth-orientation PCK, `earth_latest_high_prec.bpc` (~5 MB). A pure
//! frame-to-frame rotation needs nothing else — no planetary ephemeris (`de440s.bsp`),
//! no constants file. We fetch it with `curl` (already a build/CI dependency for the
//! TLE/EOP scripts) rather than pulling an HTTP-client crate, which keeps ANISE's
//! `default-features = false` tree free of the TLS-root license crates.
//!
//! Resolution order (no network unless [`download_bpc`] is called explicitly):
//! 1. `$KSHANA_ANISE_BPC` if it points at a readable file;
//! 2. `<crate>/kernels/earth_latest_high_prec.bpc`.

use std::path::PathBuf;
use std::process::Command;

/// Filename of the high-precision Earth orientation BPC.
pub const BPC_FILENAME: &str = "earth_latest_high_prec.bpc";

/// Canonical NAIF download URL for the BPC.
pub const BPC_URL: &str =
    "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/earth_latest_high_prec.bpc";

/// The crate-local kernel cache directory (`<crate>/kernels`).
pub fn kernels_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("kernels")
}

/// Resolve the BPC path without touching the network. Returns `None` when no kernel is
/// available (the caller then skips the live cross-check or invokes [`download_bpc`]).
pub fn resolve_bpc() -> Option<PathBuf> {
    if let Ok(p) = std::env::var("KSHANA_ANISE_BPC") {
        let pb = PathBuf::from(p);
        if pb.is_file() {
            return Some(pb);
        }
    }
    let pb = kernels_dir().join(BPC_FILENAME);
    pb.is_file().then_some(pb)
}

/// Download the BPC into the crate-local cache with `curl`, returning its path. Used by
/// the `frame-xval` binary and the optional CI job; never called from unit tests.
pub fn download_bpc() -> Result<PathBuf, String> {
    let dir = kernels_dir();
    std::fs::create_dir_all(&dir).map_err(|e| format!("create {}: {e}", dir.display()))?;
    let dest = dir.join(BPC_FILENAME);
    let tmp = dir.join(format!("{BPC_FILENAME}.part"));
    let status = Command::new("curl")
        .args([
            "-fsSL",
            "--max-time",
            "180",
            "-o",
            tmp.to_str().ok_or("non-utf8 path")?,
            BPC_URL,
        ])
        .status()
        .map_err(|e| format!("spawn curl: {e}"))?;
    if !status.success() {
        let _ = std::fs::remove_file(&tmp);
        return Err(format!(
            "curl failed downloading {BPC_URL} (status {status})"
        ));
    }
    std::fs::rename(&tmp, &dest).map_err(|e| format!("rename into place: {e}"))?;
    Ok(dest)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kernels_dir_is_under_the_crate() {
        assert!(kernels_dir().ends_with("kernels"));
    }

    #[test]
    fn env_override_must_point_at_a_real_file() {
        // A non-existent override is ignored (falls through to the cache lookup).
        std::env::set_var("KSHANA_ANISE_BPC", "/no/such/kernel.bpc");
        // Either None (no cached kernel) or the cached path — never the bogus override.
        if let Some(p) = resolve_bpc() {
            assert_ne!(p, PathBuf::from("/no/such/kernel.bpc"));
        }
        std::env::remove_var("KSHANA_ANISE_BPC");
    }
}
