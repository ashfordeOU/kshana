// SPDX-License-Identifier: AGPL-3.0-only
//! Locating (and, on demand, fetching) the NAIF kernel the DE-grade Mars cross-check needs.
//!
//! - `de440s.bsp` — the JPL DE440 planetary ephemeris (short span, 1849–2150). It carries the
//!   **Mars-system barycenter** (NAIF 4) relative to the Solar-System barycenter, and the Sun
//!   (NAIF 10), which is all the heliocentric Mars-vs-DE440 cross-check requires.
//!
//! The check compares Kshana's Sun-central two-body Mars propagation against the DE440 Mars
//! **barycenter** position. (The barycenter, not the Mars body centre 499, because `de440s.bsp`
//! contains body 4 but not 499; the Mars-body-centre offset from its barycenter is the tiny pull of
//! Phobos/Deimos, ~ tens of metres, far below the heliocentric two-body residual being measured. The
//! Mars body centre 499 would need the additional Mars-system SPK `mar097.bsp` — resolvable here via
//! the optional `$KSHANA_ANISE_MAR097` override and documented by [`MAR097_URL`] — but the core
//! cross-check deliberately uses the barycenter so it needs only the one DE440 kernel the lunar
//! cross-check already uses.)
//!
//! This is public-domain NASA/JPL data, **referenced not redistributed**. We fetch it with `curl`
//! (already a CI dependency for the TLE/EOP scripts) rather than pulling an HTTP-client crate, which
//! keeps ANISE's `default-features = false` tree lean.
//!
//! Resolution order (no network unless [`download_spk`] is called explicitly):
//! 1. `$KSHANA_ANISE_DE440S` if it points at a readable file;
//! 2. `<crate>/kernels/<filename>`.
//!
//! The `$KSHANA_ANISE_DE440S` variable is the **same** one `xval/anise-lunar-od` resolves, so a
//! single local DE440 copy serves both cross-checks.

use std::path::PathBuf;
use std::process::Command;

/// DE440 planetary ephemeris (short span) filename — carries the Mars barycenter and the Sun.
pub const SPK_FILENAME: &str = "de440s.bsp";
/// Mars-system SPK filename (the optional, Mars-body-centre 499 path; not needed for the barycenter
/// cross-check). Resolved via `$KSHANA_ANISE_MAR097` when present.
pub const MAR097_FILENAME: &str = "mar097.bsp";

/// Canonical NAIF download URL for the DE440s SPK.
pub const SPK_URL: &str =
    "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp";
/// Canonical NAIF download URL for the Mars-system SPK (documentation; only needed for the optional
/// Mars-body-centre 499 variant).
pub const MAR097_URL: &str =
    "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/mar097.bsp";

/// The crate-local kernel cache directory (`<crate>/kernels`).
pub fn kernels_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("kernels")
}

/// Resolve a kernel path without touching the network: the env override (if it points at a real
/// file), else the crate-local cache. Returns `None` when neither exists.
fn resolve_one(env_var: &str, filename: &str) -> Option<PathBuf> {
    if let Ok(p) = std::env::var(env_var) {
        let pb = PathBuf::from(p);
        if pb.is_file() {
            return Some(pb);
        }
    }
    let pb = kernels_dir().join(filename);
    pb.is_file().then_some(pb)
}

/// Resolve the DE440s SPK path (env `KSHANA_ANISE_DE440S`, else the cache). This is the single
/// kernel the barycenter cross-check needs; `None` ⇒ the caller skips the live check cleanly.
pub fn resolve_spk() -> Option<PathBuf> {
    resolve_one("KSHANA_ANISE_DE440S", SPK_FILENAME)
}

/// Resolve the optional Mars-system SPK path (env `KSHANA_ANISE_MAR097`, else the cache), for the
/// Mars-body-centre 499 variant. `None` is normal — the core cross-check does not use it.
pub fn resolve_mar097() -> Option<PathBuf> {
    resolve_one("KSHANA_ANISE_MAR097", MAR097_FILENAME)
}

fn curl_to(url: &str, dest: &PathBuf, max_secs: &str) -> Result<(), String> {
    let dir = dest.parent().ok_or("kernel dest has no parent")?;
    std::fs::create_dir_all(dir).map_err(|e| format!("create {}: {e}", dir.display()))?;
    let tmp = dest.with_extension("part");
    let status = Command::new("curl")
        .args([
            "-fsSL",
            "--max-time",
            max_secs,
            "-o",
            tmp.to_str().ok_or("non-utf8 path")?,
            url,
        ])
        .status()
        .map_err(|e| format!("spawn curl: {e}"))?;
    if !status.success() {
        let _ = std::fs::remove_file(&tmp);
        return Err(format!("curl failed downloading {url} (status {status})"));
    }
    std::fs::rename(&tmp, dest).map_err(|e| format!("rename into place: {e}"))?;
    Ok(())
}

/// Download the DE440 SPK into the crate-local cache with `curl`, returning its path. Used by the
/// `mars-od-xval` binary and the optional CI job; never called from unit tests.
pub fn download_spk() -> Result<PathBuf, String> {
    let dir = kernels_dir();
    let spk = dir.join(SPK_FILENAME);
    if !spk.is_file() {
        curl_to(SPK_URL, &spk, "300")?;
    }
    Ok(spk)
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
        std::env::set_var("KSHANA_ANISE_DE440S", "/no/such/de440s.bsp");
        if let Some(p) = resolve_spk() {
            assert_ne!(p, PathBuf::from("/no/such/de440s.bsp"));
        }
        std::env::remove_var("KSHANA_ANISE_DE440S");
    }
}
