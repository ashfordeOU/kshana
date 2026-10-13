// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo I/NAV and F/NAV quantisation grid against published broadcast ephemerides.
//!
//! PRE-REGISTRATION (written 2026-10-12, committed alone, before the comparison was coded or
//! run, and before the input values were inspected against the encoder).
//!
//! INPUTS. The Galileo records of two files already vendored in this repository from the IGS
//! (International GNSS Service) daily broadcast navigation product for 2018 day 133:
//! `tests/fixtures/joint_pvt_itrf_rtklib_oracle/brdc_2018133_G_Einav.rnx` and
//! `tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/brdc_2018133_G_Efnav.rnx`, parsed by
//! `kshana::rinex::parse_nav`. A record is an I/NAV record when its RINEX data-sources field
//! has bit 0 or bit 2 set, an F/NAV record when bit 1 is set. Each record is mapped by
//! `kshana::gnss_navmsg::galileo::ephemeris_from_rinex`.
//!
//! WHY THIS IS AN EXTERNAL CHECK. The broadcast values were quantised by the Galileo ground
//! segment to the LSBs of the Galileo OS SIS ICD and decoded by the receivers of the IGS
//! network; RINEX prints them with 13 significant digits. If Kshana's LSB and width for a field
//! are right, every broadcast value is an integer multiple of Kshana's LSB to within the print
//! error (worst case computed before the run: about 2e-3 LSB, for `sqrt_a`), and fits the
//! field.
//!
//! CRITERIA (fixed here): G1 every I/NAV record encodes into word types 1 to 5 and every
//! F/NAV record into page types 1 to 3 without a range error; G2 for every scaled field those
//! words and pages carry from the record (`toe`, `toc`, `m0`, `e`, `sqrt_a`, `omega0`, `i0`,
//! `omega`, `idot`, `omega_dot`, `delta_n`, `cuc`, `cus`, `crc`, `crs`, `cic`, `cis`, `af0`,
//! `af1`, `af2`, `bgd_e1e5a`, and `bgd_e1e5b` for I/NAV), `r = value / LSB` satisfies
//! `|r - round(r)| <= 0.01`; G3 decoding the encoded bits returns the integer `round(r)`
//! exactly. Non-vacuity: at least 100 I/NAV and 100 F/NAV records, at least 20 distinct SVIDs.
//!
//! WHAT IT DOES NOT TEST. Bit positions (a transposed pair of equal-width fields passes), or an
//! LSB a power of two finer than the ICD's (broadcast integers stay integers on a finer grid).
//! It therefore does not promote the navigation-message row: the row stays MODELLED. A miss is
//! recorded below with its numbers, not tuned away.
//!
//! RESULT (run 2026-10-12 on 0901cca + this file's code, first run): G1, G2 and G3 HOLD and
//! the record count holds: 249 I/NAV records (5478 field values) and 247 F/NAV records (4693
//! field values), 0 range errors, 0 decode mismatches, worst `|r - round(r)|` = 3.62e-3 (E14,
//! t_oe 57600, eccentricity) against the 0.01 bar. FINDING: the SVID non-vacuity bar MISSED,
//! 15 distinct SVIDs against the pre-registered 20 (the files hold E01 E02 E03 E04 E05 E07 E08
//! E09 E12 E14 E18 E19 E24 E26 E30, the satellites broadcasting on that day); the bar was set
//! without checking the 2018 constellation and is not lowered. Also noted: the pre-run
//! estimate of the worst print error (about 2e-3 LSB, `sqrt_a`) was below the observed 3.62e-3
//! (`e` of E14, an eccentric-orbit satellite); the 0.01 bar was not changed. The check is
//! therefore recorded as a finding with the grid agreement above, and the test pins these
//! numbers; it does not promote anything.
//!
//! PIN-SCOPE: counts of records, SVIDs and field values on the two vendored files, and the
//! G1 to G3 outcome. PIN-EXCLUDES: bit positions; other dates.

use kshana::gnss_navmsg::galileo::{ephemeris_from_rinex, GalIono, GalTimeConversion, Gst};
use kshana::gnss_navmsg::{gal_fnav, gal_inav, get, Field};
use std::collections::BTreeSet;

const FILES: [&str; 2] = [
    "tests/fixtures/joint_pvt_itrf_rtklib_oracle/brdc_2018133_G_Einav.rnx",
    "tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/brdc_2018133_G_Efnav.rnx",
];

const SCALED: [&str; 22] = [
    "toe",
    "toc",
    "m0",
    "e",
    "sqrt_a",
    "omega0",
    "i0",
    "omega",
    "idot",
    "omega_dot",
    "delta_n",
    "cuc",
    "cus",
    "crc",
    "crs",
    "cic",
    "cis",
    "af0",
    "af1",
    "af2",
    "bgd_e1e5a",
    "bgd_e1e5b",
];

struct Tally {
    records: usize,
    svids: BTreeSet<u32>,
    checked: usize,
    worst: (f64, String),
    failures: Vec<String>,
}

fn check(
    layout: &[Field],
    fields: &[kshana::gnss_navmsg::Decoded],
    value: impl Fn(&str) -> f64,
    tag: &str,
    t: &mut Tally,
) {
    for f in layout.iter().filter(|f| SCALED.contains(&f.name)) {
        let r = value(f.name) / f.lsb_si();
        let frac = (r - r.round()).abs();
        if frac > t.worst.0 {
            t.worst = (frac, format!("{tag} {}", f.name));
        }
        if frac > 0.01 {
            t.failures.push(format!("G2 {tag} {}: r = {r}", f.name));
        }
        let got = get(fields, f.name).unwrap().integer;
        if got != r.round() as i64 {
            t.failures.push(format!(
                "G3 {tag} {}: decoded {got}, want {}",
                f.name,
                r.round()
            ));
        }
        t.checked += 1;
    }
}

#[test]
fn broadcast_galileo_values_lie_on_the_icd_grid() {
    let (io, gst, tc) = (
        GalIono::default(),
        Gst::default(),
        GalTimeConversion::default(),
    );
    let mut inav = Tally {
        records: 0,
        svids: BTreeSet::new(),
        checked: 0,
        worst: (0.0, String::new()),
        failures: vec![],
    };
    let mut fnav = Tally {
        records: 0,
        svids: BTreeSet::new(),
        checked: 0,
        worst: (0.0, String::new()),
        failures: vec![],
    };
    for file in FILES {
        let text = std::fs::read_to_string(format!("{}/{file}", env!("CARGO_MANIFEST_DIR")))
            .expect("fixture");
        for r in kshana::rinex::parse_nav(&text)
            .expect("parse")
            .iter()
            .filter(|r| r.system == 'E')
        {
            let e = ephemeris_from_rinex(r).unwrap();
            let src = r.data_sources.max(0.0) as u32;
            let tag = format!("E{:02} toe {}", r.prn, r.toe);
            if src & 0b101 != 0 {
                inav.records += 1;
                inav.svids.insert(e.svid);
                for wt in 1..=5 {
                    match gal_inav::encode_word(wt, &e, &io, &gst) {
                        Err(m) => inav.failures.push(format!("G1 {tag} WT{wt}: {m}")),
                        Ok(w) => {
                            let (_, d) = gal_inav::decode_word(&w).unwrap();
                            check(
                                gal_inav::layout(wt).unwrap(),
                                &d,
                                |n| gal_inav::word_value(wt, &e, &io, &gst, n).unwrap(),
                                &tag,
                                &mut inav,
                            );
                        }
                    }
                }
            }
            if src & 0b010 != 0 {
                fnav.records += 1;
                fnav.svids.insert(e.svid);
                for pt in 1..=3 {
                    match gal_fnav::encode_data(pt, &e, &io, &gst, &tc) {
                        Err(m) => fnav.failures.push(format!("G1 {tag} PT{pt}: {m}")),
                        Ok(w) => {
                            let (_, d) = gal_fnav::decode_data(&w).unwrap();
                            check(
                                gal_fnav::layout(pt).unwrap(),
                                &d,
                                |n| gal_fnav::page_value(pt, &e, &io, &gst, &tc, n).unwrap(),
                                &tag,
                                &mut fnav,
                            );
                        }
                    }
                }
            }
        }
    }
    for (name, t) in [("I/NAV", &inav), ("F/NAV", &fnav)] {
        eprintln!(
            "{name}: {} records, {} SVIDs, {} field values, worst |r - round(r)| {:.2e} ({}), {} failures",
            t.records,
            t.svids.len(),
            t.checked,
            t.worst.0,
            t.worst.1,
            t.failures.len()
        );
        for f in t.failures.iter().take(20) {
            eprintln!("  {f}");
        }
    }
    let svids: BTreeSet<u32> = inav.svids.union(&fnav.svids).copied().collect();
    // G1 to G3 (pre-registered) and the record-count part of the non-vacuity bar.
    assert!(inav.failures.is_empty() && fnav.failures.is_empty());
    assert!(inav.records >= 100 && fnav.records >= 100);
    assert!(inav.worst.0 <= 0.01 && fnav.worst.0 <= 0.01);
    // FINDING, pinned: the pre-registered bar of at least 20 SVIDs is missed (15 on file).
    assert_eq!(
        svids.len(),
        15,
        "SVID count changed; revisit the recorded finding"
    );
    assert!(svids.len() < 20);
    assert_eq!(
        (inav.records, fnav.records, inav.checked, fnav.checked),
        (249, 247, 5478, 4693)
    );
}
