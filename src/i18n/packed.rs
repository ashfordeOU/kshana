// SPDX-License-Identifier: AGPL-3.0-only
//! The packed form of the translated engine catalogues, `data/i18n/catalogues.xz`.
//!
//! Not a module of the library: `build.rs` includes this file (`#[path]`) to decode the archive in a
//! build of the published crate, and `tests/i18n_packed.rs` includes it to check that decoding gives
//! back every `i18n/<lang>/engine.ftl` byte for byte. One decoder, so the test exercises exactly the
//! code the published build runs.
//!
//! `scripts/pack_catalogues.py` writes the archive: one xz stream (LZMA2, CRC32) of
//!
//! ```text
//! kshana-engine-catalogues 1\n
//! <tag> <byte length>\n        one line per language, in the order of TAGS
//! \n
//! <the catalogues, concatenated in that order>
//! ```

/// The translated languages, in the order of `LANGS` in `src/i18n/mod.rs` (English, the source, is
/// embedded as-is and is not packed). `tests/i18n_packed.rs` holds the two lists equal.
pub const TAGS: [&str; 17] = [
    "nl", "pl", "pt-BR", "pt-PT", "fi", "sv", "da", "nb", "cs", "uk", "ru", "de", "fr", "es", "et",
    "ja", "zh-Hans",
];

/// The first line of the decompressed archive: the format and its version.
pub const MAGIC: &str = "kshana-engine-catalogues 1";

/// Decode the archive into `(tag, catalogue text)` pairs, in the order of [`TAGS`]. The xz stream's
/// own CRC32 is checked, then the index: exactly the languages of [`TAGS`], in that order, lengths that
/// add up to the rest of the stream, and every catalogue valid UTF-8.
pub fn unpack(archive: &[u8]) -> Result<Vec<(String, String)>, String> {
    let mut raw: Vec<u8> = Vec::new();
    lzma_rs::xz_decompress(&mut &archive[..], &mut raw)
        .map_err(|e| format!("the packed catalogues do not decompress: {e:?}"))?;
    let text =
        String::from_utf8(raw).map_err(|e| format!("the packed catalogues are not UTF-8: {e}"))?;
    let (head, body) = text
        .split_once("\n\n")
        .ok_or("the packed catalogues have no index")?;
    let mut lines = head.lines();
    if lines.next() != Some(MAGIC) {
        return Err(format!("the packed catalogues do not start with `{MAGIC}`"));
    }
    let mut out = Vec::with_capacity(TAGS.len());
    let mut at = 0usize;
    for line in lines {
        let (tag, len) = line
            .split_once(' ')
            .ok_or_else(|| format!("bad index line `{line}`"))?;
        let len: usize = len
            .parse()
            .map_err(|_| format!("bad length in index line `{line}`"))?;
        let end = at
            .checked_add(len)
            .filter(|e| *e <= body.len())
            .ok_or_else(|| format!("`{tag}` runs past the end of the packed catalogues"))?;
        let ftl = body
            .get(at..end)
            .ok_or_else(|| format!("`{tag}` does not end on a character boundary"))?;
        out.push((tag.to_string(), ftl.to_string()));
        at = end;
    }
    if at != body.len() {
        return Err(format!(
            "{} bytes after the last packed catalogue",
            body.len() - at
        ));
    }
    let got: Vec<&str> = out.iter().map(|(t, _)| t.as_str()).collect();
    if got != TAGS {
        return Err(format!(
            "the packed catalogues hold {got:?}, not the languages {TAGS:?}"
        ));
    }
    Ok(out)
}
