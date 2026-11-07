// SPDX-License-Identifier: AGPL-3.0-only
//! The Bias-SINEX reader on two public files (CAS DSB of 2024 day 035, CODE MGEX OSB of 2022 day
//! 324; see `tests/fixtures/bias_sinex/NOTICE.md`). Data-gated: runs when `KSHANA_BIAS_SINEX_DIR`
//! names a directory filled by `tests/fixtures/bias_sinex/fetch.sh`, and says so when it skips.
//!
//! Every data line of `BIAS/SOLUTION` must be read, and its observable, estimate and standard
//! deviation must equal what an independent whitespace split of the same line gives. The header's
//! stated count of estimates is pinned beside the number of lines (they differ in both files).
//!
//! PIN-SCOPE:    the SHA-256 of each decompressed public file, so the check runs on the file the
//!               counts and findings were recorded for.
//! PIN-EXCLUDES: nothing the reader computes; the digests identify inputs only.

use kshana::bias_sinex::{read, BiasKind};
use sha2::{Digest, Sha256};

fn data_lines(text: &str) -> Vec<(usize, &str)> {
    let mut on = false;
    let mut out = Vec::new();
    for (i, l) in text.lines().enumerate() {
        if l.starts_with("+BIAS/SOLUTION") {
            on = true;
        } else if l.starts_with("-BIAS/SOLUTION") {
            on = false;
        } else if on && !l.starts_with('*') && !l.trim().is_empty() {
            out.push((i + 1, l));
        }
    }
    out
}

#[test]
fn public_files_read_every_line_with_the_printed_values() {
    let Some(dir) = std::env::var_os("KSHANA_BIAS_SINEX_DIR") else {
        eprintln!(
            "KSHANA_BIAS_SINEX_DIR is not set: the public-file check is skipped (see fetch.sh)"
        );
        return;
    };
    let dir = std::path::PathBuf::from(dir);
    for (name, sha, kind, stated, lines_want) in [
        (
            "CAS0OPSRAP_20240350000_01D_01D_DCB.BIA",
            "c221acee092d7c0c54b5813f6ec20499049808a8ebda47fe2bf3fe4ec4838de9",
            BiasKind::Dsb,
            5_611,
            5_665,
        ),
        (
            "com22370.bia",
            "4858ca378fc30774d4f37e33130ff328a78d9a6e10b3f1872ac9bac64f5cf0a4",
            BiasKind::Osb,
            6_712,
            6_668,
        ),
    ] {
        let bytes = std::fs::read(dir.join(name)).unwrap_or_else(|e| panic!("{name}: {e}"));
        assert_eq!(
            hex::encode(Sha256::digest(&bytes)),
            sha,
            "{name}: not the pinned file"
        );
        let text = String::from_utf8_lossy(&bytes);
        let f = read(&text).unwrap();
        let lines = data_lines(&text);
        assert!(
            f.unreadable.is_empty(),
            "{name}: {:?}",
            &f.unreadable[..3.min(f.unreadable.len())]
        );
        assert_eq!(
            (f.biases.len(), lines.len()),
            (lines_want, lines_want),
            "{name}"
        );
        // PIN-SCOPE:    the header's stated count of estimates against the data lines, as the
        //               producer wrote them; a finding about the file, not about the reader.
        assert_eq!(f.header.estimates, stated, "{name}");
        for (b, (n, l)) in f.biases.iter().zip(&lines) {
            assert_eq!(b.line, *n);
            assert_eq!(b.kind, kind, "{name}:{n}");
            // Independent reading: the last two whitespace tokens are the estimate and its
            // standard deviation (no slopes in these files), the token after the PRN or station
            // is OBS1.
            let t: Vec<&str> = l.split_whitespace().collect();
            let k = t.len();
            assert_eq!(b.value, t[k - 2].parse::<f64>().unwrap(), "{name}:{n}");
            assert_eq!(
                b.std_dev,
                Some(t[k - 1].parse::<f64>().unwrap()),
                "{name}:{n}"
            );
            assert_eq!(b.unit, t[k - 3], "{name}:{n}");
            assert!(t.contains(&b.obs1.as_str()), "{name}:{n}");
            assert!(b.slope.is_none());
            assert!(b.start.is_some() && b.end.is_some(), "{name}:{n}");
        }
    }
}
