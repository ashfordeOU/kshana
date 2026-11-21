//! RINEX readers: what a malformed or unusual file does, beyond not panicking (which
//! `tests/parser_robustness.rs` fuzzes). Each case is a file a real receiver, converter or
//! archive can produce, and the reader either decodes it, counts what it stepped over, or
//! refuses it, but never returns invented or non-finite data silently.
//!
//! * Observation files (`kshana::rinex_obs::parse_obs`): special-event records (epoch flags
//!   2-5), satellite counts that do not match the records, unreadable values, a COMMENT that
//!   names a header label, the `TIME OF FIRST OBS` time system, an unreadable epoch flag.
//! * Navigation files (`kshana::rinex::parse_nav`): a RINEX 2 file, non-finite fields.
//! * Clock files (`kshana::precise_products::parse_clock_rinex`): 3.04 labels in columns
//!   66-85, a missing `END OF HEADER`, non-finite values.
//! * A seeded fuzz over the three IGS fixtures that writes `NaN`, `inf`, overflowing exponents
//!   and `*` overflow fields into numeric columns: every value that comes back is finite.

use kshana::precise_products::parse_clock_rinex;
use kshana::rinex::parse_nav;
use kshana::rinex_obs::parse_obs;

fn h(content: &str, label: &str) -> String {
    format!("{content:<60}{label}\n")
}

fn obs_header(extra: &str) -> String {
    let mut s = String::new();
    s += &h(
        "     3.04           OBSERVATION DATA    G",
        "RINEX VERSION / TYPE",
    );
    s += &h("G    2 C1C L1C", "SYS / # / OBS TYPES");
    s += &h("    30.000", "INTERVAL");
    s += extra;
    s += &h(
        "  2021     1     1     0     0    0.0000000     GPS",
        "TIME OF FIRST OBS",
    );
    s += &h("", "END OF HEADER");
    s
}

fn epoch(sec: f64, flag: u8, n: usize) -> String {
    format!("> 2021 01 01 00 00{sec:11.7}  {flag}{n:3}\n")
}

fn sat(id: &str, c1: &str, l1: &str) -> String {
    format!("{id}{c1:>14}  {l1:>14}  \n")
}

fn two_sats() -> String {
    sat("G01", "20000000.000", "105000000.000") + &sat("G02", "21000000.000", "110000000.000")
}

#[test]
fn an_event_record_is_stepped_over_not_read_as_satellites() {
    let text = obs_header("")
        + &epoch(0.0, 0, 2)
        + &two_sats()
        + &epoch(15.0, 4, 2)
        + &h("Antenna moved", "COMMENT")
        + &h("GPS receiver restarted", "COMMENT")
        + &epoch(30.0, 0, 2)
        + &two_sats();
    let o = parse_obs(&text).unwrap();
    assert_eq!(o.epochs.len(), 2, "the event is not an epoch");
    assert_eq!(o.skipped.event_records, 1);
    assert_eq!(o.satellites(), vec!["G01".to_string(), "G02".to_string()]);
    assert!(o.epochs.iter().all(|e| e.flag == 0 && e.sats.len() == 2));
}

#[test]
fn a_satellite_count_that_runs_into_the_next_epoch_is_refused() {
    // The header says three, two follow: reading on would take the next epoch header as a
    // satellite and lose that epoch.
    let text = obs_header("") + &epoch(0.0, 0, 3) + &two_sats() + &epoch(30.0, 0, 2) + &two_sats();
    let e = parse_obs(&text).unwrap_err();
    assert!(e.contains("declares 3 records"), "{e}");
}

#[test]
fn records_beyond_the_declared_count_are_counted() {
    let text = obs_header("") + &epoch(0.0, 0, 1) + &two_sats() + &epoch(30.0, 0, 2) + &two_sats();
    let o = parse_obs(&text).unwrap();
    assert_eq!(o.epochs.len(), 2);
    assert_eq!(o.epochs[0].sats.len(), 1);
    assert_eq!(o.skipped.stray_lines, 1);
}

#[test]
fn a_cut_last_epoch_is_kept_and_counted() {
    let text = obs_header("")
        + &epoch(0.0, 0, 2)
        + &two_sats()
        + &epoch(30.0, 0, 2)
        + &sat("G01", "20000000.000", "");
    let o = parse_obs(&text).unwrap();
    assert_eq!(o.epochs.len(), 2);
    assert_eq!(o.epochs[1].sats.len(), 1);
    assert_eq!(o.skipped.truncated_epochs, 1);
}

#[test]
fn unreadable_and_non_finite_values_are_absent_and_counted() {
    let text = obs_header("")
        + &epoch(0.0, 0, 3)
        + &sat("G01", "NaN", "105000000.000")
        + &sat("G02", "**************", "inf")
        + &sat("G03", "1.0D+400", "110000000.000");
    let o = parse_obs(&text).unwrap();
    assert_eq!(o.skipped.unreadable_values, 4);
    assert_eq!(o.observation(0, "G01", "C1C"), None);
    assert_eq!(o.observation(0, "G01", "L1C"), Some(105_000_000.0));
    assert_eq!(o.observation(0, "G02", "L1C"), None);
    assert_eq!(o.observation(0, "G03", "C1C"), None);
}

#[test]
fn a_satellite_of_an_undeclared_system_is_counted() {
    let text = obs_header("")
        + &epoch(0.0, 0, 2)
        + &sat("G01", "20000000.000", "")
        + &sat("E11", "23000000.000", "");
    let o = parse_obs(&text).unwrap();
    assert_eq!(o.skipped.undeclared_system_records, 1);
}

#[test]
fn a_comment_naming_a_label_does_not_overwrite_it_and_the_time_system_is_read() {
    let extra = h("  1.000 s INTERVAL after decimation", "COMMENT")
        + &h("TIME OF FIRST OBS is the first epoch kept", "COMMENT");
    let text = obs_header(&extra).replace(
        "    0.0000000     GPS         TIME OF FIRST OBS",
        "    0.0000000     BDT         TIME OF FIRST OBS",
    ) + &epoch(0.0, 0, 2)
        + &two_sats();
    let o = parse_obs(&text).unwrap();
    assert_eq!(o.header.interval_s, Some(30.0));
    assert_eq!(o.header.time_system.as_deref(), Some("BDT"));
}

#[test]
fn an_unreadable_epoch_flag_is_refused_not_read_as_zero() {
    let text = obs_header("") + &epoch(0.0, 0, 2).replacen("  0  2", "  X  2", 1) + &two_sats();
    let e = parse_obs(&text).unwrap_err();
    assert!(e.contains("epoch flag"), "{e}");
    let text = obs_header("") + &epoch(0.0, 0, 2).replacen("  0  2", "  9  2", 1) + &two_sats();
    assert!(parse_obs(&text).unwrap_err().contains("epoch flag"));
}

#[test]
fn a_non_finite_epoch_second_is_refused() {
    let text =
        obs_header("") + &epoch(0.0, 0, 2).replacen("  0.0000000", "        NaN", 1) + &two_sats();
    assert!(parse_obs(&text).is_err());
}

const NAV: &str = include_str!("fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx");
const OBS: &str = include_str!("fixtures/igs/ABMF00GLP_R_20181330000_01D_30S_MO.rnx");
const CLK: &str = include_str!("fixtures/clock_log/rinex_clk_304.clk");

#[test]
fn a_rinex_2_navigation_file_is_refused_not_read_as_empty() {
    let text = h(
        "     2.11           N: GPS NAV DATA",
        "RINEX VERSION / TYPE",
    ) + &h("", "END OF HEADER")
        + " 6 13  1  1  0  0  0.0-1.234567890123D-04 0.000000000000D+00 0.000000000000D+00\n";
    let e = parse_nav(&text).unwrap_err();
    assert!(e.contains("RINEX 2.11"), "{e}");
}

#[test]
fn a_non_finite_navigation_field_is_refused() {
    // The first GPS record's clock bias field (columns 24-42 of its first line).
    let first = NAV
        .lines()
        .position(|l| l.starts_with('G'))
        .expect("a GPS record");
    let mut lines: Vec<String> = NAV.lines().map(str::to_string).collect();
    let l = &lines[first];
    lines[first] = format!("{}{:>19}{}", &l[..23], "NaN", &l[42..]);
    let text = lines.join("\n") + "\n";
    assert!(parse_nav(&text).is_err());
}

#[test]
fn clock_labels_in_the_3_04_columns_are_found_and_a_missing_end_of_header_is_refused() {
    // Move every header label from column 61 to column 66, as 3.04 writes them.
    let mut moved = String::new();
    let mut in_header = true;
    for line in CLK.lines() {
        if in_header && line.len() > 60 {
            moved += &format!("{}     {}\n", &line[..60], &line[60..]);
            in_header = !line.contains("END OF HEADER");
        } else {
            moved += line;
            moved += "\n";
        }
    }
    let a = parse_clock_rinex(CLK).unwrap();
    let b = parse_clock_rinex(&moved).unwrap();
    assert!(!a.sats.is_empty());
    assert_eq!(a.sats, b.sats);

    let no_end: String = CLK
        .lines()
        .filter(|l| !l.contains("END OF HEADER"))
        .map(|l| format!("{l}\n"))
        .collect();
    let e = parse_clock_rinex(&no_end).unwrap_err();
    assert!(e.contains("END OF HEADER"), "{e}");

    let nan = CLK.replacen("5.616193085726E-10", "NaN", 1);
    assert!(parse_clock_rinex(&nan).is_err());
}

/// SplitMix64: a small deterministic generator for the fuzz below.
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

const POISON: [&str; 6] = [
    "NaN",
    "inf",
    "-inf",
    "1.0D+400",
    "**************",
    "infinity",
];

/// Replace one numeric token of a random data line (after the header) with a poison value of
/// the same width, so the column layout is kept.
fn poison(text: &str, rng: &mut Rng, hits: usize) -> String {
    let mut lines: Vec<String> = text.lines().map(str::to_string).collect();
    let start = lines
        .iter()
        .position(|l| l.contains("END OF HEADER"))
        .map_or(0, |i| i + 1);
    if start >= lines.len() {
        return text.to_string();
    }
    for _ in 0..hits {
        let k = start + rng.below(lines.len() - start);
        let line = lines[k].clone();
        let spans: Vec<(usize, usize)> = token_spans(&line)
            .into_iter()
            .filter(|&(a, b)| line[a..b].contains(['.', 'E', 'D']))
            .collect();
        if spans.is_empty() {
            continue;
        }
        let (a, b) = spans[rng.below(spans.len())];
        let p = POISON[rng.below(POISON.len())];
        let w = b - a;
        let rep = if p.len() >= w {
            p[..w].to_string()
        } else {
            format!("{p:>w$}")
        };
        lines[k] = format!("{}{}{}", &line[..a], rep, &line[b..]);
    }
    lines.join("\n") + "\n"
}

fn token_spans(line: &str) -> Vec<(usize, usize)> {
    let b = line.as_bytes();
    let mut out = Vec::new();
    let mut i = 0;
    while i < b.len() {
        if b[i] == b' ' {
            i += 1;
            continue;
        }
        let s = i;
        while i < b.len() && b[i] != b' ' {
            i += 1;
        }
        if line.is_char_boundary(s) && line.is_char_boundary(i) {
            out.push((s, i));
        }
    }
    out
}

fn assert_finite_debug(what: &str, debug: &str, input: &str) {
    for bad in [
        ": NaN", ": inf", ": -inf", "(NaN", "(inf", "(-inf", " NaN,", " inf,", " -inf,",
    ] {
        assert!(
            !debug.contains(bad),
            "{what}: a non-finite value came back ({bad}) from input:\n{input}"
        );
    }
}

#[test]
fn poisoned_numeric_fields_never_come_back_as_values() {
    // PIN-SCOPE:    for the three IGS fixtures with up to three numeric fields replaced by NaN,
    //               inf, an overflowing exponent or a `*` overflow field (seeded, 300 cases per
    //               reader), every reader returns finite values or an error.
    // PIN-EXCLUDES: which error, and whether the poisoned record is dropped or refused.
    let mut rng = Rng(0x5EED_2026_1121);
    for case in 0..300 {
        let hits = 1 + case % 3;
        let nav = poison(NAV, &mut rng, hits);
        if let Ok(eph) = parse_nav(&nav) {
            assert_finite_debug("nav", &format!("{eph:?}"), &nav);
        }
        let obs = poison(OBS, &mut rng, hits);
        if let Ok(o) = parse_obs(&obs) {
            assert_finite_debug("obs", &format!("{:?}", o.epochs), &obs);
        }
        let clk = poison(CLK, &mut rng, hits);
        if let Ok(c) = parse_clock_rinex(&clk) {
            for (s, v) in &c.sats {
                assert!(
                    v.iter().all(|(t, x)| t.is_finite() && x.is_finite()),
                    "clock {s}: non-finite from\n{clk}"
                );
            }
        }
    }
}
