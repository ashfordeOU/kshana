//! CCSDS message readers and writers: what a malformed or unusual message does, beyond not
//! panicking (which `tests/parser_robustness.rs` fuzzes).
//!
//! * CDM convert (`kshana orbit-data convert --to cdm`): a value in a unit other than the
//!   standard's is refused, not relabelled.
//! * OMM writer: a `.` decimal mark in every language.
//! * OEM reader: non-finite state and covariance values are refused; an unclosed covariance block
//!   is an error instead of swallowing the rest of the segment.
//! * OEM to OCM: segments in different time systems are refused.
//! * TDM reader: a non-finite value, an extra token on a data line and a data line outside a
//!   data block are errors.
//! * ODM sections: a non-finite number is refused.
//! * A seeded fuzz writing `NaN`, `inf`, overflowing exponents into the OEM and TDM fixtures:
//!   every value returned is finite.

use std::path::PathBuf;
use std::sync::atomic::{AtomicU64, Ordering};

use kshana::ccsds_tdm::TdmFile;
use kshana::oem::{parse_covariance_block, parse_oem};
use kshana::omm::OmmFile;

const OEM: &str = include_str!("fixtures/ccsds_oem_interop/kshana_meo_eme2000_multiseg.oem");
const OEM_COV: &str = include_str!("fixtures/ccsds_cov/kshana_cov_leo.oem");
const TDM: &str = include_str!("fixtures/ccsds/tdm_503_b2_figE9.tdm");
const CDM: &str = include_str!("fixtures/orbit_data/cdm_508_b1_example_3_6_2.cdm");
const GPS_TLE: &str = include_str!("fixtures/celestrak/gps-ops_2026-06-07.txt");

fn temp_dir(tag: &str) -> PathBuf {
    static N: AtomicU64 = AtomicU64::new(0);
    let scratch_dir = std::env::temp_dir().join(format!(
        "kshana-ccsds-robust-{tag}-{}-{}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&scratch_dir).unwrap();
    scratch_dir
}

fn convert_cdm(text: &str) -> Result<u8, String> {
    let dir = temp_dir("cdm");
    let path = dir.join("in.cdm");
    std::fs::write(&path, text).unwrap();
    let r = kshana::orbit_data::cli::run(&[
        "convert".to_string(),
        path.to_string_lossy().into_owned(),
        "--to".to_string(),
        "cdm".to_string(),
    ]);
    let _ = std::fs::remove_dir_all(&dir);
    r
}

#[test]
fn cdm_convert_refuses_a_value_in_another_unit() {
    // The standard's unit converts.
    convert_cdm(CDM).expect("the published example converts");
    // `0.715 [km]` would have been written as `0.715 [m]`.
    let km = CDM.replacen(
        "MISS_DISTANCE                   = 715   [m]",
        "MISS_DISTANCE                   = 0.715 [km]",
        1,
    );
    assert_ne!(km, CDM);
    let e = convert_cdm(&km).unwrap_err();
    assert!(e.contains("MISS_DISTANCE") && e.contains("km"), "{e}");
}

#[test]
fn the_omm_writer_uses_a_point_in_every_language() {
    let block: String = GPS_TLE.lines().take(3).map(|l| format!("{l}\n")).collect();
    let omm = &OmmFile::from_tle_block(&block, "KSHANA", "2026-06-07T00:00:00").unwrap()[0];
    let en = omm.to_omm_kvn();
    for tag in ["de", "fr", "ru", "pt-BR"] {
        let text =
            kshana::i18n::with_lang(kshana::i18n::resolve(tag).unwrap(), || omm.to_omm_kvn());
        for key in [
            "MEAN_MOTION",
            "RA_OF_ASC_NODE",
            "ARG_OF_PERICENTER",
            "MEAN_ANOMALY",
        ] {
            let line = text.lines().find(|l| l.starts_with(key)).unwrap();
            assert!(!line.contains(','), "{tag}: {line}");
            assert!(line.contains('.'), "{tag}: {line}");
            let en_line = en.lines().find(|l| l.starts_with(key)).unwrap();
            assert_eq!(
                line.split('=').nth(1).map(str::trim),
                en_line.split('=').nth(1).map(str::trim),
                "{tag}: {key}"
            );
        }
    }
}

#[test]
fn non_finite_oem_values_are_refused() {
    let line = OEM
        .lines()
        .find(|l| l.starts_with(char::is_numeric) && l.split_whitespace().count() >= 7)
        .unwrap();
    let toks: Vec<&str> = line.split_whitespace().collect();
    for bad in ["NaN", "inf", "-inf", "1.0e400"] {
        let poisoned = line.replacen(toks[2], bad, 1);
        assert!(
            parse_oem(&OEM.replacen(line, &poisoned, 1)).is_err(),
            "{bad}"
        );
    }
    // Covariance terms too.
    let start = OEM_COV.find("COVARIANCE_START").unwrap();
    let stop = OEM_COV.find("COVARIANCE_STOP").unwrap() + "COVARIANCE_STOP".len();
    let block = &OEM_COV[start..stop];
    parse_covariance_block(block).expect("the fixture's block reads");
    let last_num = block
        .split_whitespace()
        .rfind(|t| t.parse::<f64>().is_ok())
        .unwrap();
    let nan = block.replacen(last_num, "NaN", 1);
    assert!(parse_covariance_block(&nan).is_err());
}

#[test]
fn an_unclosed_covariance_block_is_an_error() {
    parse_oem(OEM_COV).expect("the fixture reads");
    let unclosed = OEM_COV.replacen("COVARIANCE_STOP", "", 1);
    let e = parse_oem(&unclosed).unwrap_err();
    assert!(e.contains("COVARIANCE_STOP"), "{e}");
}

#[test]
fn oem_to_ocm_refuses_segments_in_different_time_systems() {
    kshana::orbit_data::convert::oem_to_ocm(OEM).expect("one time system converts");
    let i = OEM.rfind("TIME_SYSTEM = UTC").unwrap();
    let mixed = format!(
        "{}TIME_SYSTEM = TAI{}",
        &OEM[..i],
        &OEM[i + "TIME_SYSTEM = UTC".len()..]
    );
    let e = kshana::orbit_data::convert::oem_to_ocm(&mixed).unwrap_err();
    assert!(e.contains("UTC") && e.contains("TAI"), "{e}");
}

#[test]
fn tdm_values_tokens_and_stray_lines() {
    let ok = TdmFile::parse(TDM).unwrap();
    assert!(ok
        .segments
        .iter()
        .flat_map(|s| s.data.iter())
        .all(|o| o.value.is_finite()));
    let line = TDM.lines().find(|l| l.starts_with("RANGE =")).unwrap();
    let val = line.split_whitespace().last().unwrap();
    for bad in ["NaN", "inf", "1e400"] {
        let t = TDM.replacen(line, &line.replacen(val, bad, 1), 1);
        assert!(TdmFile::parse(&t).is_err(), "{bad}");
    }
    // `epoch value extra`: the extra token was dropped.
    let t = TDM.replacen(line, &format!("{line} 2.0"), 1);
    assert!(TdmFile::parse(&t).is_err());
    // A data line after DATA_STOP and before the next META_START.
    let t = TDM.replacen("DATA_STOP", &format!("DATA_STOP\n{line}"), 1);
    let e = TdmFile::parse(&t).unwrap_err();
    assert!(e.contains("DATA_START"), "{e}");
}

#[test]
fn odm_sections_refuse_non_finite_numbers() {
    let mut s = kshana::odm::Section::new();
    s.set("X", "6678.137").set("Y", "NaN").set("Z", "inf");
    assert_eq!(s.num("X").unwrap(), Some(6678.137));
    assert!(s.num("Y").is_err());
    assert!(s.num("Z").is_err());
    assert_eq!(s.num("W").unwrap(), None);
}

/// SplitMix64.
struct Rng(u64);
impl Rng {
    fn next(&mut self) -> u64 {
        self.0 = self.0.wrapping_add(0x9E37_79B9_7F4A_7C15);
        let mut z = self.0;
        z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
        z ^ (z >> 31)
    }
    fn below(&mut self, n: usize) -> usize {
        (self.next() % n as u64) as usize
    }
}

const POISON: [&str; 5] = ["NaN", "inf", "-inf", "1.0E+400", "infinity"];

/// Replace one numeric token (not a date) of a random line with a poison value.
fn poison(text: &str, rng: &mut Rng, hits: usize) -> String {
    let mut lines: Vec<String> = text.lines().map(str::to_string).collect();
    for _ in 0..hits {
        let k = rng.below(lines.len());
        let toks: Vec<String> = lines[k].split_whitespace().map(str::to_string).collect();
        let nums: Vec<usize> = toks
            .iter()
            .enumerate()
            .filter(|(_, t)| t.parse::<f64>().is_ok())
            .map(|(i, _)| i)
            .collect();
        if nums.is_empty() {
            continue;
        }
        let i = nums[rng.below(nums.len())];
        let mut t = toks.clone();
        t[i] = POISON[rng.below(POISON.len())].to_string();
        lines[k] = t.join(" ");
    }
    lines.join("\n") + "\n"
}

#[test]
fn poisoned_numeric_fields_never_come_back_as_values() {
    // PIN-SCOPE:    the OEM (states, covariance) and TDM fixtures with up to three numeric
    //               tokens replaced by NaN, inf or an overflowing exponent (seeded, 300 cases
    //               each): every value returned is finite.
    // PIN-EXCLUDES: which error.
    let mut rng = Rng(0x05EE_DCC5_2026);
    for case in 0..300 {
        let hits = 1 + case % 3;
        for src in [OEM, OEM_COV] {
            let t = poison(src, &mut rng, hits);
            if let Ok(f) = parse_oem(&t) {
                for s in &f.segments {
                    for l in &s.states {
                        assert!(
                            l.pos_km.iter().chain(&l.vel_km_s).all(|v| v.is_finite()),
                            "oem:\n{t}"
                        );
                    }
                }
            }
        }
        let t = poison(TDM, &mut rng, hits);
        if let Ok(f) = TdmFile::parse(&t) {
            for o in f.segments.iter().flat_map(|s| s.data.iter()) {
                assert!(o.value.is_finite(), "tdm:\n{t}");
            }
        }
    }
}
