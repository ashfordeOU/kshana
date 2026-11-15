// SPDX-License-Identifier: AGPL-3.0-only
//! The imagery tile cache of the globe (0.42 U24). Imagery is off unless the person turns it on;
//! the page then fetches each tile once from a source whose terms allow keeping it offline
//! (`apps/desktop/shell/lib/globe.mjs` `IMAGERY_SOURCES`) and keeps it here, under the app's
//! cache folder, so the globe draws it again with no network. Only tile files are written: a key
//! is `<source>/<level>/<row>/<col>.jpeg`, checked before any path is made of it.

use std::path::{Path, PathBuf};

use base64::Engine as _;

/// The largest tile kept.
pub const MAX_TILE_BYTES: usize = 4 * 1024 * 1024;

/// The relative path of a tile key, checked: `<source>/<level>/<row>/<col>.jpeg`.
pub fn tile_path(key: &str) -> Result<PathBuf, String> {
    let parts: Vec<&str> = key.split('/').collect();
    let ok = parts.len() == 4
        && !parts[0].is_empty()
        && parts[0].len() <= 64
        && parts[0]
            .bytes()
            .all(|b| b.is_ascii_lowercase() || b.is_ascii_digit() || b == b'-')
        && parts[1].len() <= 2
        && parts[1].bytes().all(|b| b.is_ascii_digit())
        && parts[2].len() <= 5
        && !parts[2].is_empty()
        && parts[2].bytes().all(|b| b.is_ascii_digit())
        && parts[3].strip_suffix(".jpeg").is_some_and(|c| {
            !c.is_empty() && c.len() <= 5 && c.bytes().all(|b| b.is_ascii_digit())
        });
    if !ok || parts[1].is_empty() {
        return Err(format!("{key:?} is not a tile key"));
    }
    Ok(parts.iter().collect())
}

/// The tile kept under `key` in `root`, as base64, or `None`.
pub fn get(root: &Path, key: &str) -> Result<Option<String>, String> {
    let p = root.join(tile_path(key)?);
    match std::fs::read(&p) {
        Ok(b) if b.len() <= MAX_TILE_BYTES => {
            Ok(Some(base64::engine::general_purpose::STANDARD.encode(b)))
        }
        Ok(_) => Ok(None),
        Err(_) => Ok(None),
    }
}

/// Keep a tile (`base64` of its bytes) under `key` in `root`: written to a temporary name with
/// mode 0644 and renamed.
pub fn put(root: &Path, key: &str, base64: &str) -> Result<(), String> {
    let rel = tile_path(key)?;
    let bytes = base64::engine::general_purpose::STANDARD
        .decode(base64.trim())
        .map_err(|e| format!("the tile is not base64: {e}"))?;
    if bytes.len() > MAX_TILE_BYTES || bytes.len() < 3 || bytes[..3] != [0xFF, 0xD8, 0xFF] {
        return Err("a tile is a JPEG image of at most 4 MiB".into());
    }
    let full = root.join(rel);
    if let Some(parent) = full.parent() {
        std::fs::create_dir_all(parent).map_err(|e| e.to_string())?;
    }
    let tmp = full.with_extension("jpeg-tmp");
    {
        use std::io::Write as _;
        let mut o = std::fs::OpenOptions::new();
        o.write(true).create(true).truncate(true);
        #[cfg(unix)]
        {
            use std::os::unix::fs::OpenOptionsExt as _;
            o.mode(0o644);
        }
        let mut f = o.open(&tmp).map_err(|e| e.to_string())?;
        f.write_all(&bytes).map_err(|e| e.to_string())?;
    }
    std::fs::rename(&tmp, &full).map_err(|e| e.to_string())
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::atomic::{AtomicU64, Ordering};

    static SEQ: AtomicU64 = AtomicU64::new(0);

    #[test]
    fn keys_are_checked_before_any_path_is_made() {
        assert!(tile_path("nasa-gibs-bluemarble/2/1/4.jpeg").is_ok());
        for bad in [
            "../x/2/1/4.jpeg",
            "a/2/1/4.png",
            "A/2/1/4.jpeg",
            "a/2/1/../4.jpeg",
            "a//1/4.jpeg",
            "/a/2/1/4.jpeg",
            "a/2/1/.jpeg",
            "a/123/1/4.jpeg",
        ] {
            assert!(tile_path(bad).is_err(), "{bad}");
        }
    }

    #[test]
    fn a_tile_is_kept_and_read_back() {
        let root = std::env::temp_dir().join(format!(
            "kshana-tiles-{}-{}",
            std::process::id(),
            SEQ.fetch_add(1, Ordering::Relaxed)
        ));
        let jpeg = [0xFF, 0xD8, 0xFF, 0xE0, 1, 2, 3];
        let b64 = base64::engine::general_purpose::STANDARD.encode(jpeg);
        assert_eq!(get(&root, "s/0/0/1.jpeg").unwrap(), None);
        put(&root, "s/0/0/1.jpeg", &b64).unwrap();
        assert_eq!(
            get(&root, "s/0/0/1.jpeg").unwrap().as_deref(),
            Some(b64.as_str())
        );
        #[cfg(unix)]
        {
            use std::os::unix::fs::PermissionsExt as _;
            let m = std::fs::metadata(root.join("s/0/0/1.jpeg"))
                .unwrap()
                .permissions()
                .mode();
            assert_eq!(m & 0o022, 0, "not writable by others");
        }
        assert!(
            put(&root, "s/0/0/2.jpeg", "aGVsbG8=").is_err(),
            "not a JPEG"
        );
        std::fs::remove_dir_all(&root).unwrap();
    }
}
