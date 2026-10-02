// SPDX-License-Identifier: AGPL-3.0-only
//! **The LSIS V1.0 data this module needs at run time, fetched and verified, never committed.**
//!
//! The LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 and its attachments carry no
//! reuse terms, so nothing copied from them is part of this repository. The few things the
//! generator needs that only the standard defines (the low-density parity-check (LDPC)
//! submatrix tables of [Annex1], the AFS-I Gold and AFS-Q tertiary code files of [Annex3])
//! are read at run time from a local cache filled by `xval/lunar-afs/fetch_lsis.sh`, which
//! downloads the NASA-hosted PDF, checks its SHA-256 and extracts its embedded attachments.
//! Every file is checked here against the digest pinned in [`PINNED`] before it is used; a
//! missing or altered file is an error that says how to fetch it.
//!
//! Cache directory: `$KSHANA_LSIS_DIR`, else `$HOME/.cache/kshana/lsis`.

use sha2::{Digest, Sha256};
use std::path::PathBuf;

/// URL of the standard (NASA-hosted).
pub const LSIS_PDF_URL: &str = "https://www.nasa.gov/wp-content/uploads/2025/02/lunanet-signal-in-space-recommended-standard-augmented-forward-signal-vol-a.pdf";

/// File name and SHA-256 of every cached file the engine reads (the PDF itself, then its
/// embedded attachments under the names `pdfdetach -saveall` gives them).
pub const PINNED: &[(&str, &str)] = &[
    (
        "lsis.pdf",
        "986e07959f527d24280d87b5477298424ffdf754c4625f08041b5749592e61b6",
    ),
    (
        "003a_lunanet_sf2_ldpc_submatrix_a_ind.csv",
        "db0c4478c5e6298b5d6dc97c5531b963b1796276f538a291917a474867815178",
    ),
    (
        "003b_lunanet_sf2_ldpc_submatrix_b_ind.csv",
        "44d406028978a6b3c6ec5e5921638fadf6011f752f30c17185cb1cfe400e97a7",
    ),
    (
        "003c_lunanet_sf2_ldpc_submatrix_b_inv_ind.csv",
        "0629c6c7f7f3bc1d627de427f2a0ab750b8292ef28d4b347755d61df8d6ab34c",
    ),
    (
        "003d_lunanet_sf2_ldpc_submatrix_c_ind.csv",
        "6852fa56d3ab21aebe6ee653b215202434043ff7d2566e8ed3dab16f9d34e69e",
    ),
    (
        "003e_lunanet_sf2_ldpc_submatrix_d_ind.csv",
        "535abcbe02673d035798b2205643a6315635b258556499982cab08ea60ebd2b3",
    ),
    (
        "003f_lunanet_sf3_ldpc_submatrix_a_ind.csv",
        "fa08d5efebb1194cae80da3368ba586391690b98a8fc87471cebc75d650f905e",
    ),
    (
        "003g_lunanet_sf3_ldpc_submatrix_b_ind.csv",
        "d61faf1e1d9b9b2153e120788e9ad350d9908df801604af2d5dc3ea51de2bc90",
    ),
    (
        "003h_lunanet_sf3_ldpc_submatrix_b_inv_ind.csv",
        "0ce68708d8decc1fc529f3c83389aa9c6c993d36009ae2c28d1c023bf9ed384b",
    ),
    (
        "003i_lunanet_sf3_ldpc_submatrix_c_ind.csv",
        "3e9cbbd017635c9a475c4c676fd08c9f331acc28b54c21217be0dffff98e17c9",
    ),
    (
        "003j_lunanet_sf3_ldpc_submatrix_d_ind.csv",
        "2830e76e8407fa07510c320c306d1c1ee281081cc857f11fef9e52fa26ae8415",
    ),
    (
        "006_GoldCode2046hex210prns.txt",
        "3b7f997e9ca7671a3ab7636104a6daf838420818da0e738fc34e60608ddffdbd",
    ),
    (
        "007_l1cp_hex210prns.txt",
        "d7fad990fae6773d1515da6a0fabf0cf8b19980aed627eb2c63192799241a912",
    ),
    (
        "008_Weil1500hex210prns.txt",
        "a9634c22d964924238d5dcb0a5ec6f3d48587a45c28a8088f7194911723536a8",
    ),
];

/// The cache directory: `$KSHANA_LSIS_DIR`, else `$HOME/.cache/kshana/lsis`.
pub fn cache_dir() -> PathBuf {
    if let Some(d) = std::env::var_os("KSHANA_LSIS_DIR") {
        return PathBuf::from(d);
    }
    let home = std::env::var_os("HOME").unwrap_or_default();
    PathBuf::from(home).join(".cache/kshana/lsis")
}

/// Whether every pinned file is present in the cache (not verified; [`read_verified`] does
/// that). Data-gated tests use this to decide whether to skip.
pub fn cache_present() -> bool {
    let d = cache_dir();
    PINNED.iter().all(|(n, _)| d.join(n).is_file())
}

/// The message a missing or altered cache produces.
pub fn fetch_hint() -> String {
    format!(
        "the LSIS V1.0 data is not in {} (set KSHANA_LSIS_DIR or run xval/lunar-afs/fetch_lsis.sh, \
         which downloads {LSIS_PDF_URL} and extracts its attachments; they are not redistributed \
         with Kshana)",
        cache_dir().display()
    )
}

/// Read a pinned cache file and check its SHA-256.
pub fn read_verified(name: &str) -> Result<Vec<u8>, String> {
    let want = PINNED
        .iter()
        .find(|(n, _)| *n == name)
        .map(|(_, h)| *h)
        .ok_or_else(|| format!("{name} is not a pinned LSIS file"))?;
    let path = cache_dir().join(name);
    let bytes =
        std::fs::read(&path).map_err(|e| format!("{}: {e}; {}", path.display(), fetch_hint()))?;
    let got: String = Sha256::digest(&bytes)
        .iter()
        .map(|b| format!("{b:02x}"))
        .collect();
    if got != want {
        return Err(format!(
            "{} has SHA-256 {got}, expected {want} (pinned to LSIS V1.0 of 29 January 2025); {}",
            path.display(),
            fetch_hint()
        ));
    }
    Ok(bytes)
}

/// [`read_verified`] as text.
pub fn read_verified_text(name: &str) -> Result<String, String> {
    String::from_utf8(read_verified(name)?).map_err(|e| format!("{name}: {e}"))
}

/// The long hexadecimal runs of an Annex 3 code file, one per PRN in file order.
pub fn annex3_hex_lines(text: &str, min_len: usize) -> Vec<String> {
    text.lines()
        .filter_map(|l| {
            let run: String = l.chars().filter(|c| c.is_ascii_hexdigit()).collect();
            (run.len() >= min_len).then(|| run.to_ascii_uppercase())
        })
        .collect()
}

/// Bits of a hexadecimal string, most significant first, keeping the last `n`.
pub fn hex_bits_last(hex: &str, n: usize) -> Vec<u8> {
    let bits: Vec<u8> = hex
        .chars()
        .filter_map(|c| c.to_digit(16))
        .flat_map(|v| (0..4).rev().map(move |k| ((v >> k) & 1) as u8))
        .collect();
    bits[bits.len().saturating_sub(n)..].to_vec()
}
