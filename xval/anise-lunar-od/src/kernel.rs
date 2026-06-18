// SPDX-License-Identifier: AGPL-3.0-only
//! Locating (and, on demand, fetching) the two NAIF kernels the DE-grade lunar OD needs.
//!
//! - `de440s.bsp` — the JPL DE440 planetary ephemeris (short span, 1849–2150), for the
//!   Earth and Sun positions relative to the Moon (the lunar-orbit third bodies).
//! - `moon_pa_de440_200625.bpc` — the DE440 lunar **principal-axis** body orientation, the
//!   numerically-integrated libration that replaces Kshana's analytic IAU 2015 series.
//!
//! Both are public-domain NASA/JPL data, **referenced not redistributed**. We fetch them
//! with `curl` (already a CI dependency for the TLE/EOP scripts) rather than pulling an
//! HTTP-client crate, which keeps ANISE's `default-features = false` tree lean.
//!
//! Resolution order (no network unless [`download_all`] is called explicitly):
//! 1. `$KSHANA_ANISE_DE440S` / `$KSHANA_ANISE_MOON_PA` if they point at readable files;
//! 2. `<crate>/kernels/<filename>`.

use std::path::PathBuf;
use std::process::Command;

/// DE440 planetary ephemeris (short span) filename.
pub const SPK_FILENAME: &str = "de440s.bsp";
/// DE440 lunar principal-axis orientation BPC filename.
pub const BPC_FILENAME: &str = "moon_pa_de440_200625.bpc";

/// Canonical NAIF download URL for the DE440s SPK.
pub const SPK_URL: &str =
    "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp";
/// Canonical NAIF download URL for the DE440 lunar PA BPC.
pub const BPC_URL: &str =
    "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de440_200625.bpc";

/// The crate-local kernel cache directory (`<crate>/kernels`).
pub fn kernels_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("kernels")
}

/// Resolve a kernel path without touching the network: the env override (if it points at a
/// real file), else the crate-local cache. Returns `None` when neither exists.
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

/// Resolve the DE440s SPK path (env `KSHANA_ANISE_DE440S`, else the cache).
pub fn resolve_spk() -> Option<PathBuf> {
    resolve_one("KSHANA_ANISE_DE440S", SPK_FILENAME)
}

/// Resolve the lunar PA BPC path (env `KSHANA_ANISE_MOON_PA`, else the cache).
pub fn resolve_bpc() -> Option<PathBuf> {
    resolve_one("KSHANA_ANISE_MOON_PA", BPC_FILENAME)
}

/// Resolve both kernels at once, or `None` if either is missing (the caller then skips the
/// live cross-check or invokes [`download_all`]).
pub fn resolve_all() -> Option<(PathBuf, PathBuf)> {
    Some((resolve_spk()?, resolve_bpc()?))
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

/// Download both kernels into the crate-local cache with `curl`, returning their paths. Used
/// by the `lunar-od-xval` binary and the optional CI job; never called from unit tests.
pub fn download_all() -> Result<(PathBuf, PathBuf), String> {
    let dir = kernels_dir();
    let spk = dir.join(SPK_FILENAME);
    let bpc = dir.join(BPC_FILENAME);
    if !spk.is_file() {
        curl_to(SPK_URL, &spk, "300")?;
    }
    if !bpc.is_file() {
        curl_to(BPC_URL, &bpc, "180")?;
    }
    Ok((spk, bpc))
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
