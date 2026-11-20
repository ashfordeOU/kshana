// SPDX-License-Identifier: AGPL-3.0-only
//! The packed translated catalogues (`data/i18n/catalogues.xz`) decode to exactly the seventeen
//! `i18n/<lang>/engine.ftl` files, byte for byte.
//!
//! The published crate carries that one packed file in place of the seventeen, and its build script
//! decodes it (`build.rs`, `src/i18n/packed.rs`). This test packs the current catalogues with the same
//! generator the package job runs (`scripts/pack_catalogues.py`), decodes the result with the same
//! decoder the build script uses (this file includes `src/i18n/packed.rs`, as `build.rs` does), and
//! compares every catalogue with its source and with the text the library embeds.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

#[allow(dead_code)]
#[path = "../src/i18n/packed.rs"]
mod packed;

static SEQ: AtomicUsize = AtomicUsize::new(0);

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

/// A fresh scratch directory for one call.
fn scratch(what: &str) -> PathBuf {
    let seq = SEQ.fetch_add(1, Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-{what}-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).expect("create a scratch directory");
    dir
}

/// Run the generator into a scratch directory and return the archive bytes.
fn pack() -> Vec<u8> {
    let dir = scratch("i18n-pack");
    let out = dir.join("catalogues.xz");
    let run = Command::new("python3")
        .arg("-I")
        .arg(root().join("scripts/pack_catalogues.py"))
        .arg("--out")
        .arg(&out)
        .output()
        .expect("python3 runs scripts/pack_catalogues.py");
    assert!(
        run.status.success(),
        "pack_catalogues.py failed: {}",
        String::from_utf8_lossy(&run.stderr)
    );
    let check = Command::new("python3")
        .arg("-I")
        .arg(root().join("scripts/pack_catalogues.py"))
        .arg("--check")
        .arg("--out")
        .arg(&out)
        .output()
        .expect("python3 runs scripts/pack_catalogues.py --check");
    assert!(
        check.status.success(),
        "pack_catalogues.py --check refused its own output: {}",
        String::from_utf8_lossy(&check.stderr)
    );
    let bytes = std::fs::read(&out).expect("read the packed catalogues");
    let _ = std::fs::remove_dir_all(&dir);
    bytes
}

/// An archive with this decompressed payload, written by the decoder crate's own (simple) encoder.
fn xz(payload: &[u8]) -> Vec<u8> {
    let mut out = Vec::new();
    lzma_rs::xz_compress(&mut &payload[..], &mut out).expect("xz-compress");
    out
}

#[test]
fn the_packed_languages_are_the_translated_languages() {
    assert_eq!(packed::TAGS[..], kshana::i18n::LANGS[1..]);
    assert_eq!(kshana::i18n::LANGS[0], "en");
}

#[test]
fn packing_then_unpacking_gives_back_every_catalogue_byte_for_byte() {
    let archive = pack();
    let decoded = packed::unpack(&archive).expect("the packed catalogues decode");
    assert_eq!(decoded.len(), packed::TAGS.len());
    let mut total = 0usize;
    for (tag, text) in &decoded {
        let source = std::fs::read(root().join("i18n").join(tag).join("engine.ftl"))
            .expect("read the source catalogue");
        assert!(
            text.as_bytes() == source.as_slice(),
            "{tag}: the decoded catalogue differs from i18n/{tag}/engine.ftl"
        );
        let embedded = kshana::i18n::catalogue_source(tag).expect("an embedded catalogue");
        assert!(
            embedded == text,
            "{tag}: the decoded catalogue differs from the one the library embeds"
        );
        total += source.len();
    }
    // The point of packing: the archive is a fraction of the text (about 14 %).
    assert!(
        archive.len() * 4 < total,
        "{} bytes packed from {total}",
        archive.len()
    );
}

#[test]
fn a_damaged_or_mismatched_archive_is_refused() {
    let archive = pack();
    // One flipped bit inside the compressed data: the xz stream's CRC32 (or the LZMA decoder) refuses it.
    let mut bad = archive.clone();
    let mid = bad.len() / 2;
    bad[mid] ^= 0x10;
    assert!(packed::unpack(&bad).is_err());
    assert!(packed::unpack(&archive[..archive.len() - 1]).is_err());

    let body: String = packed::TAGS.iter().map(|t| format!("# {t}\n")).collect();
    let index = |tags: &[&str]| -> String {
        tags.iter()
            .map(|t| format!("{t} {}\n", t.len() + 3))
            .collect()
    };
    let good = format!("{}\n{}\n{body}", packed::MAGIC, index(&packed::TAGS));
    let ok = packed::unpack(&xz(good.as_bytes())).expect("a well-formed archive decodes");
    assert_eq!(ok[0], ("nl".to_string(), "# nl\n".to_string()));
    // Two languages swapped, a wrong format line, trailing bytes, a length past the end.
    let mut swapped = packed::TAGS;
    swapped.swap(0, 1);
    for wrong in [
        format!("{}\n{}\n{body}", packed::MAGIC, index(&swapped)),
        format!(
            "kshana-engine-catalogues 2\n{}\n{body}",
            index(&packed::TAGS)
        ),
        format!("{}\n{}\n{body}extra", packed::MAGIC, index(&packed::TAGS)),
        format!("{}\nnl 999999\n\n{body}", packed::MAGIC),
    ] {
        assert!(
            packed::unpack(&xz(wrong.as_bytes())).is_err(),
            "{wrong:.60}"
        );
    }
}

#[test]
fn the_packed_catalogues_are_generated_never_committed() {
    // A committed archive would have to be regenerated by every change to a catalogue, and would
    // conflict between every two such branches; the package job generates it instead.
    let Ok(out) = Command::new("git")
        .arg("-C")
        .arg(root())
        .args(["ls-files", "--", "data/i18n"])
        .output()
    else {
        return; // not a git checkout
    };
    if out.status.success() {
        assert!(
            out.stdout.is_empty(),
            "data/i18n/ is generated by scripts/pack_catalogues.py and must not be committed: {}",
            String::from_utf8_lossy(&out.stdout)
        );
    }
}

#[test]
fn the_package_leaves_out_every_packed_source() {
    // A language added to TAGS but not to Cargo.toml's `exclude` would ship twice: as text and packed.
    let manifest = std::fs::read_to_string(root().join("Cargo.toml")).expect("Cargo.toml");
    for tag in packed::TAGS {
        let line = format!("\"/i18n/{tag}/engine.ftl\",");
        assert!(
            manifest.contains(&line),
            "Cargo.toml does not exclude {line}"
        );
    }
    assert!(
        !manifest.contains("\"/i18n/en/engine.ftl\""),
        "English is embedded as-is"
    );
}
