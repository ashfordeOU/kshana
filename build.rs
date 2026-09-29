// SPDX-License-Identifier: AGPL-3.0-only
//! Build script: one job. The optional Celeste IOD preset (`src/celeste_iod.rs`, the only
//! file carrying parameters presented at the ESA NAVISP LEO-PNT workshop, 2026) is compiled
//! in when that file exists, through the `kshana_celeste` configuration flag. Deleting the
//! file (with the `scenarios/*celeste-iod*.toml` files) withholds the preset from a build
//! without any source edit.

fn main() {
    println!("cargo::rustc-check-cfg=cfg(kshana_celeste)");
    // Watch the directory, so adding or deleting the preset file re-runs this script.
    println!("cargo::rerun-if-changed=src");
    if std::path::Path::new("src/celeste_iod.rs").exists() {
        println!("cargo::rustc-cfg=kshana_celeste");
    }
}
