// SPDX-License-Identifier: AGPL-3.0-only
//! The CGGTTS reader on a real BIPM file (AGGO, GPS, January 2025).
//!
//! The file is public BIPM data without an explicit redistribution licence, so it is not
//! vendored. Fetch it with `scripts/fetch_cggtts.sh` (into `realdata-cache/cggtts/`), or
//! point `KSHANA_CGGTTS_PATH` at it. Without the file the test prints a skip notice and
//! passes; with `KSHANA_REQUIRE_REALDATA=1` a missing file fails.
//!
//! Checks (pre-registration R6.1, P1 and P2): every data line's checksum holds under the
//! rule in `src/cggtts.rs`, the number of tracks equals an independent count of data
//! lines, and the all-in-view series has the expected 16-minute spacing.

use kshana::cggtts::{all_in_view, read_tracks};

fn data() -> Option<String> {
    let path = std::env::var("KSHANA_CGGTTS_PATH")
        .unwrap_or_else(|_| "realdata-cache/cggtts/aggo2501.p3".to_string());
    match std::fs::read_to_string(&path) {
        Ok(t) => Some(t),
        Err(_) => {
            if std::env::var("KSHANA_REQUIRE_REALDATA").as_deref() == Ok("1") {
                panic!("KSHANA_REQUIRE_REALDATA=1 but {path} is missing (scripts/fetch_cggtts.sh)");
            }
            eprintln!("skip: {path} not present (run scripts/fetch_cggtts.sh)");
            None
        }
    }
}

#[test]
fn every_data_line_of_a_bipm_file_passes_its_checksum() {
    let Some(text) = data() else { return };
    // Independent count: lines whose first field is a GNSS satellite id like G04.
    let data_lines = text
        .lines()
        .filter(|l| {
            let b = l.as_bytes();
            b.len() > 100
                && b[0] == b'G'
                && b[1].is_ascii_digit()
                && b[2].is_ascii_digit()
                && b[3] == b' '
        })
        .count();
    let f = read_tracks(&text);
    assert_eq!(f.bad_checksum, 0, "checksum failures");
    assert_eq!(f.malformed, 0, "malformed lines");
    assert_eq!(f.tracks.len(), data_lines);
    // PIN-SCOPE:    the track count of the one pinned BIPM file (aggo2501.p3, sha256 pinned in
    //               scripts/fetch_cggtts.sh): every one of its 25 388 GPS data lines is read.
    // PIN-EXCLUDES: any other file, constellation or month; a new file needs its own count.
    assert_eq!(f.tracks.len(), 25_388);
    let s = all_in_view(&f.tracks, None);
    let mut gaps: Vec<f64> = s.windows(2).map(|w| w[1].t - w[0].t).collect();
    gaps.sort_by(|a, b| a.total_cmp(b));
    assert_eq!(gaps[gaps.len() / 2], 960.0, "median spacing");
}
