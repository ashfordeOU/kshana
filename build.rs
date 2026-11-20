// SPDX-License-Identifier: AGPL-3.0-only
//! Build script: two jobs.
//!
//! 1. The optional Celeste IOD preset (`src/celeste_iod.rs`, the only file carrying parameters
//!    presented at the ESA NAVISP LEO-PNT workshop, 2026) is compiled in when that file exists,
//!    through the `kshana_celeste` configuration flag. Deleting the file (with the
//!    `scenarios/*celeste-iod*.toml` files) withholds the preset from a build without any source edit.
//! 2. The translated engine catalogues. `src/i18n/mod.rs` embeds them through a list this script
//!    writes to `OUT_DIR/engine_catalogues.rs`. In a checkout the list names `i18n/<lang>/engine.ftl`
//!    themselves (as the `include_str!`s it replaces did). The published crate leaves those files out
//!    and carries `data/i18n/catalogues.xz` instead (crates.io's 10 MiB limit; see
//!    `scripts/pack_catalogues.py`): there this script decodes it into `OUT_DIR` and the list names the
//!    decoded files. Either way the library embeds the same bytes and does no decoding at run time.
//!    The WebAssembly build embeds English only and needs neither.

use std::path::{Path, PathBuf};

#[path = "src/i18n/packed.rs"]
mod packed;

fn main() {
    println!("cargo::rustc-check-cfg=cfg(kshana_celeste)");
    // Watch the directory, so adding or deleting the preset file re-runs this script.
    println!("cargo::rerun-if-changed=src");
    if Path::new("src/celeste_iod.rs").exists() {
        println!("cargo::rustc-cfg=kshana_celeste");
    }
    catalogues();
}

fn catalogues() {
    let out_dir = PathBuf::from(std::env::var_os("OUT_DIR").expect("cargo sets OUT_DIR"));
    let list = out_dir.join("engine_catalogues.rs");
    if std::env::var("CARGO_CFG_TARGET_ARCH").as_deref() == Ok("wasm32") {
        return;
    }
    let root = PathBuf::from(std::env::var_os("CARGO_MANIFEST_DIR").expect("cargo sets it"));
    let sources: Vec<PathBuf> = packed::TAGS
        .iter()
        .map(|t| root.join("i18n").join(t).join("engine.ftl"))
        .collect();
    // Only paths that exist are watched: cargo treats a missing watched path as changed on every build.
    let files: Vec<PathBuf> = if sources.iter().all(|p| p.is_file()) {
        for p in &sources {
            println!("cargo::rerun-if-changed={}", p.display());
        }
        sources
    } else {
        let archive = root.join("data/i18n/catalogues.xz");
        let bytes = std::fs::read(&archive).unwrap_or_else(|e| {
            let missing: Vec<String> = sources
                .iter()
                .filter(|p| !p.is_file())
                .map(|p| p.display().to_string())
                .collect();
            panic!(
                "the translated engine catalogues are missing ({}) and so is {} ({e}). In a checkout, \
                 restore i18n/<lang>/engine.ftl; to package the crate, run \
                 `python3 scripts/pack_catalogues.py` first",
                missing.join(", "),
                archive.display()
            )
        });
        println!("cargo::rerun-if-changed={}", archive.display());
        let decoded =
            packed::unpack(&bytes).unwrap_or_else(|e| panic!("{}: {e}", archive.display()));
        let dir = out_dir.join("engine-catalogues");
        std::fs::create_dir_all(&dir).expect("create OUT_DIR/engine-catalogues");
        decoded
            .iter()
            .map(|(tag, ftl)| {
                let p = dir.join(format!("{tag}.ftl"));
                std::fs::write(&p, ftl).expect("write a decoded catalogue to OUT_DIR");
                p
            })
            .collect()
    };
    let mut src = String::from("&[\n");
    for (tag, p) in packed::TAGS.iter().zip(&files) {
        let path = p.to_str().expect("a UTF-8 path");
        src.push_str(&format!("    ({tag:?}, include_str!({path:?})),\n"));
    }
    src.push_str("]\n");
    std::fs::write(&list, src).expect("write OUT_DIR/engine_catalogues.rs");
}
