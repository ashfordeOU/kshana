// SPDX-License-Identifier: AGPL-3.0-only
//! The LunaNet Augmented Forward Signal codes (`src/iq/signals/lunanet.rs`) against the columns
//! LSIS-AFS V1.0 (29 January 2025, Applicable Document 1 Volume A of LNIS V5) prints next to
//! its generator parameters, under the bars of `xval/lunanet-afs/PREREGISTRATION.md`
//! (committed before the generator existed).
//!
//! The parameters (G2 delay, Weil index k, insertion index p, tertiary k) come from the same
//! tables, so this checks that the crate's construction turns the document's parameters into
//! the document's printed chips, not the parameters themselves. The Legendre sequences are
//! computed from their definition. A code that matches only after an inversion, a shift or a
//! relabelling is a miss. The document marks its code tables {LSIS-TBC}.
//!
//! PIN-SCOPE:    the printed first and last 24 chips of every code and the two printed Legendre
//!               sequences, of the cited edition.
//! PIN-EXCLUDES: the chips between the printed columns, the message and the LDPC coding.

use kshana::iq::signals::lunanet::*;
use std::path::PathBuf;

fn oracle(name: &str) -> Vec<Vec<String>> {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("xval/lunanet-afs/oracle")
        .join(name);
    std::fs::read_to_string(&p)
        .unwrap_or_else(|e| panic!("{}: {e}", p.display()))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("prn,"))
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

/// The first `n` bits of a hex string, first bit most significant.
fn hex_bits(hex: &str) -> Vec<u8> {
    hex.chars()
        .flat_map(|c| {
            let v = c.to_digit(16).expect("hex digit");
            (0..4).rev().map(move |k| ((v >> k) & 1) as u8)
        })
        .collect()
}

/// Misses of a code against its printed first and last 24 chips (hex columns `first`, `last`).
fn chip_misses(
    name: &str,
    rows: &[Vec<String>],
    first: usize,
    last: usize,
    code: impl Fn(u16) -> Vec<u8>,
) -> (usize, Vec<String>) {
    let mut misses = Vec::new();
    for r in rows {
        let prn: u16 = r[0].parse().unwrap();
        let c = code(prn);
        let (head, tail) = (&c[..24], &c[c.len() - 24..]);
        if head != hex_bits(&r[first]).as_slice() {
            misses.push(format!(
                "{name} PRN {prn}: first 24 chips differ from {}",
                r[first]
            ));
        }
        if tail != hex_bits(&r[last]).as_slice() {
            misses.push(format!(
                "{name} PRN {prn}: last 24 chips differ from {}",
                r[last]
            ));
        }
    }
    (rows.len() * 2, misses)
}

fn assert_all(name: &str, total: usize, misses: &[String]) {
    assert!(
        misses.is_empty(),
        "{name}: {} of {total} columns differ:\n{}",
        misses.len(),
        misses
            .iter()
            .take(12)
            .cloned()
            .collect::<Vec<_>>()
            .join("\n")
    );
}

#[test]
fn b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns() {
    let rows = oracle("afs_i_gold.csv");
    assert_eq!(rows.len(), 210);
    let (total, misses) = chip_misses("AFS-I", &rows, 3, 4, |p| afs_i_bits(p).unwrap());
    assert_eq!(total, 420);
    assert_all("B1", total, &misses);
}

/// B1b as pre-registered: the printed G2 initial state is the state reached by advancing the
/// all-ones register by the printed delay. **NOT MET: 0 of 210.** The claim had the direction
/// wrong (a delay of D chips means the register starts where the natural sequence will be D
/// chips later in the past, 2047 - D steps in); the miss is pinned here, not edited away. The
/// corrected relation is B1c below, a post-hoc finding that is not part of the pre-registration.
#[test]
fn b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay() {
    let rows = oracle("afs_i_gold.csv");
    let mut misses = 0;
    for r in &rows {
        let prn: u16 = r[0].parse().unwrap();
        let delay = usize::from(afs_i_g2_delay(prn).unwrap());
        if g2_state_after(delay) != afs_i_printed_g2_init(prn).unwrap() {
            misses += 1;
        }
    }
    assert_eq!(misses, 210, "B1b: no PRN agrees");
}

/// B1c, POST HOC (found after B1b missed; not part of the pre-registration): the printed G2
/// initial state is the state reached by advancing the all-ones register by 2047 minus the
/// printed delay, for all 210 PRNs.
#[test]
fn b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay() {
    for prn in 1..=MAX_PRN {
        let delay = usize::from(afs_i_g2_delay(prn).unwrap());
        assert_eq!(
            g2_state_after((2047 - delay) % 2047),
            afs_i_printed_g2_init(prn).unwrap(),
            "PRN {prn}"
        );
    }
}

#[test]
fn b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1() {
    let text = std::fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("xval/lunanet-afs/oracle/legendre_10223.hex"),
    )
    .unwrap();
    let hex = text.lines().find(|l| !l.starts_with('#')).unwrap().trim();
    // 10224 bits are printed; the single initial 0 is L(0)'s placeholder and is ignored.
    let printed = hex_bits(hex);
    assert_eq!(printed.len(), 10224);
    let l = legendre_bits(10223);
    assert_eq!(
        &printed[1..],
        l.as_slice(),
        "Legendre(10223) differs from Table D-1"
    );
}

#[test]
fn b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns() {
    let rows = oracle("afs_q_primary_weil.csv");
    assert_eq!(rows.len(), 210);
    let (total, misses) = chip_misses("AFS-Q", &rows, 3, 4, |p| afs_q_primary_bits(p).unwrap());
    assert_eq!(total, 420);
    assert_all("B3", total, &misses);
}

/// B4: the length-1499 Legendre sequence equals Table E-1 (MET) and the tertiary codes match
/// the printed first and last 24 chips for 419 of 420 columns. **NOT MET as registered (420 of
/// 420):** the printed last 24 chips of PRN 147 (A14850) are the same value the table prints for
/// PRN 151, whose code the generator reproduces; two distinct Weil indices (607 and 612) do not
/// give the same last 24 chips, so the PRN 147 entry is most likely a misprint in the document,
/// which cannot be settled without the separate Annex 3 code file. The miss is pinned.
#[test]
fn b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column() {
    let text = std::fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/lunanet-afs/oracle/legendre_1499.hex"),
    )
    .unwrap();
    let hex = text.lines().find(|l| !l.starts_with('#')).unwrap().trim();
    // The first hex symbol "2" is 3 bits (010); the rest are 4 bits each: 1499 in all.
    let mut printed = hex_bits(&hex[..1])[1..].to_vec();
    printed.extend(hex_bits(&hex[1..]));
    assert_eq!(printed.len(), 1499);
    assert_eq!(
        printed,
        legendre_bits(1499),
        "Legendre(1499) differs from Table E-1"
    );
    let rows = oracle("afs_q_tertiary_weil.csv");
    assert_eq!(rows.len(), 210);
    let (total, misses) = chip_misses("tertiary", &rows, 2, 3, |p| afs_q_tertiary_bits(p).unwrap());
    assert_eq!(total, 420);
    assert_eq!(
        misses,
        vec!["tertiary PRN 147: last 24 chips differ from A14850".to_string()]
    );
    let same: Vec<&str> = rows
        .iter()
        .filter(|r| r[3] == "A14850")
        .map(|r| r[0].as_str())
        .collect();
    assert_eq!(
        same,
        ["147", "151"],
        "the printed value appears for two PRNs"
    );
}

#[test]
fn b5_secondary_codes_are_table_10() {
    let want = ["1110", "0111", "1011", "1101"];
    for (s, w) in SECONDARY.iter().zip(want) {
        let got: String = s.iter().map(|b| char::from(b'0' + b)).collect();
        assert_eq!(got, w);
    }
}

#[test]
fn code_lengths_and_the_tiered_pilot_are_the_documents() {
    assert_eq!(afs_i_bits(1).unwrap().len(), 2046);
    assert_eq!(afs_q_primary_bits(1).unwrap().len(), 10_230);
    assert_eq!(afs_q_tertiary_bits(1).unwrap().len(), 1500);
    // Table 9: 10230 chips = 2 ms at 5.115 Mchip/s; 4 x 1500 primary periods = 12 s.
    assert_eq!(afs_q_overlay_bits(0, 1).unwrap().len(), 6000);
    use kshana::iq::SpreadingCode;
    let q = afs_q(1).unwrap();
    assert_eq!(q.primary_len(), 10_230);
    // The receiver replica is primary x secondary: 4 x 2 ms = 8 ms.
    assert_eq!(q.len_chips(), 4 * 10_230);
    assert!((q.len_chips() as f64 / q.chip_rate_hz() - 0.008).abs() < 1e-12);
    // The full pilot adds the 1500-chip tertiary code: 12 s.
    let full = afs_q_tiered(1, 0, 1).unwrap();
    assert_eq!(full.len_chips(), 10_230 * 4 * 1500);
    assert!((full.len_chips() as f64 / full.chip_rate_hz() - 12.0).abs() < 1e-9);
    assert!(afs_i_bits(0).is_err() && afs_i_bits(211).is_err());
    assert!(afs_q_with(1, 4, None).is_err() && afs_q_with(1, 4, Some(1)).is_err());
}

#[test]
fn the_spec_check_reports_every_bar_and_pins_the_b4_miss() {
    let r = kshana::iq::lunanet_afs::check_spec();
    let bars = r["bars"].as_array().unwrap();
    assert_eq!(bars.len(), 10);
    let status = |id: &str| {
        bars.iter().find(|b| b["bar"] == id).unwrap()["status"]
            .as_str()
            .unwrap()
            .to_string()
    };
    for id in ["B1", "B2", "B3", "B5", "B6", "B7", "B8", "B9", "B10"] {
        assert_eq!(status(id), "MET", "{id}: {}", r["bars"]);
    }
    assert_eq!(status("B4"), "NOT MET");
    let b4 = bars.iter().find(|b| b["bar"] == "B4").unwrap();
    assert_eq!(
        (b4["matched"].as_u64(), b4["total"].as_u64()),
        (Some(420), Some(421))
    );
    assert_eq!(r["all_met"], false);
    assert!(r["specification"]
        .as_str()
        .unwrap()
        .contains("V1.0, 29 January 2025"));
}
