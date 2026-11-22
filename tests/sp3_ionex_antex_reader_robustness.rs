//! SP3, IONEX and ANTEX: what a malformed or unusual file does, and what the SP3 writer emits,
//! beyond not panicking (which `tests/parser_robustness.rs` fuzzes).
//!
//! * SP3 writer: a `.` decimal mark in every language; epoch labels exactly on the grid; the
//!   five-record SP3-c `+` satellite list; a refusal past 85 satellites.
//! * SP3 reader: the (0, 0, 0) bad-position sentinel and a repeated epoch are not interpolation
//!   nodes; non-finite values are refused; a `V` record without its `P`, a repeated epoch, a
//!   missing `EOF` and an epoch count short of the header are reported.
//! * IONEX (`parse_ionex`): `9999` is no value, a map's own `EXPONENT` applies to it.
//! * ANTEX receiver antennas: a variation row is read by column, and a row with an unreadable
//!   value or a length off the zenith grid is left out and counted, not shifted.
//! * A seeded fuzz writing `NaN`, `inf`, overflowing exponents and `*` overflow fields into
//!   the fixtures: every value that comes back is finite.

use kshana::ionex::parse_ionex;
use kshana::orbit::{Orbit, Propagator};
use kshana::ppp_real::parse_antex_receiver;
use kshana::rinex::EpochUtc;
use kshana::sp3::{parse_sp3, Sp3File, MAX_SP3C_SATELLITES};

const SP3: &str = include_str!("fixtures/igs/igs_sample.sp3");
const IONEX: &str = include_str!("fixtures/ionex_code_gim/synthetic/map.18i");
const ATX: &str = include_str!("fixtures/gnss_wettzell_2025055/igs20_2025055_G_LEIAR25.atx");
const ANT: &str = "LEIAR25.R3      LEIT";

fn start() -> EpochUtc {
    EpochUtc {
        year: 2023,
        month: 1,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0.0,
    }
}

fn kepler_file(n_sats: usize, step_s: f64, n_epochs: usize) -> Sp3File {
    let sats: Vec<Propagator> = (0..n_sats)
        .map(|k| {
            Propagator::Kepler(Orbit::keplerian(
                26_560_000.0,
                0.01,
                0.9,
                0.3 + 0.1 * k as f64,
                0.2,
                0.4 + 0.2 * k as f64,
            ))
        })
        .collect();
    let ids: Vec<String> = (1..=n_sats).map(|i| format!("G{i:02}")).collect();
    let jd = kshana::timescales::julian_date(2023, 1, 1, 0, 0, 0.0);
    Sp3File::from_propagators(&ids, &sats, start(), jd, step_s, n_epochs)
}

#[test]
fn the_sp3_header_uses_a_point_in_every_language() {
    let f = kepler_file(2, 900.0, 4);
    for tag in ["de", "fr", "ru", "en"] {
        let text =
            kshana::i18n::with_lang(kshana::i18n::resolve(tag).unwrap(), || f.to_sp3_string());
        let first = text.lines().next().unwrap();
        assert!(first.contains(" 0.00000000"), "{tag}: {first}");
        assert!(!first.contains(','), "{tag}: {first}");
        parse_sp3(&text).unwrap_or_else(|e| panic!("{tag}: {e}"));
    }
}

#[test]
fn written_epochs_are_exactly_on_the_grid() {
    // PIN-SCOPE:    the epoch labels of a one-day 900 s export (288 epochs): every one at a
    //               whole quarter hour, second exactly 0.
    // PIN-EXCLUDES: the positions.
    let f = kepler_file(1, 900.0, 288);
    for (i, e) in f.epochs.iter().enumerate() {
        let sod = e.time.hour * 3600 + e.time.minute * 60;
        assert_eq!(e.time.second, 0.0, "epoch {i}: {:?}", e.time);
        assert_eq!(sod as usize, (i * 900) % 86_400, "epoch {i}: {:?}", e.time);
    }
    let text = f.to_sp3_string();
    assert!(!text.contains("59.9999"), "an off-grid label was written");
    // And across midnight.
    assert_eq!(f.epochs[96].time.day, 2);
}

#[test]
fn the_satellite_list_is_five_records_of_seventeen() {
    let f = kepler_file(20, 900.0, 3);
    let text = f.to_sp3_string();
    let plus: Vec<&str> = text.lines().filter(|l| l.starts_with('+')).collect();
    assert_eq!(plus.len(), 5, "{plus:?}");
    assert!(plus[0].starts_with("+   20   G01G02"), "{}", plus[0]);
    assert!(plus[1].starts_with("+        G18G19G20  0"), "{}", plus[1]);
    assert!(plus.iter().all(|l| l.len() == 9 + 17 * 3));
    let back = parse_sp3(&text).unwrap();
    assert_eq!(back.header.sat_ids.len(), 20);
    assert_eq!(back.read.declared_sat_count, Some(20));
    assert_eq!(back.header.sat_ids, f.header.sat_ids);
}

#[test]
fn an_orbit_export_past_85_satellites_is_refused() {
    let base = include_str!("../scenarios/orbit-molniya.toml")
        .replace("duration_s = 43200.0", "duration_s = 240.0");
    let with = |n: usize| {
        base.replace("planes = 6", "planes = 1")
            .replace("sats_per_plane = 4", &format!("sats_per_plane = {n}"))
    };
    let scn: kshana::orbit::OrbitClockScenario =
        toml::from_str(&with(MAX_SP3C_SATELLITES + 1)).expect("orbit scenario");
    let e = scn.to_sp3_string().unwrap_err();
    assert!(e.contains("86 satellites") && e.contains("85"), "{e}");
    let scn: kshana::orbit::OrbitClockScenario =
        toml::from_str(&with(MAX_SP3C_SATELLITES)).unwrap();
    let back = parse_sp3(&scn.to_sp3_string().unwrap()).unwrap();
    assert_eq!(back.header.sat_ids.len(), MAX_SP3C_SATELLITES);
    assert_eq!(back.read.declared_sat_count, Some(MAX_SP3C_SATELLITES));
}

#[test]
fn the_bad_position_sentinel_is_not_an_interpolation_node() {
    let clean = parse_sp3(&kepler_file(1, 900.0, 24).to_sp3_string()).unwrap();
    let mut bad = clean.clone();
    bad.epochs[12].sats[0].pos_m = [0.0; 3];
    let (a, b) = (
        clean.interpolator("G01").unwrap(),
        bad.interpolator("G01").unwrap(),
    );
    for t in [
        10.0 * 900.0 + 450.0,
        12.0 * 900.0 + 100.0,
        13.0 * 900.0 + 450.0,
    ] {
        let (pa, pb) = (a.position_ecef(t), b.position_ecef(t));
        let d =
            ((pa[0] - pb[0]).powi(2) + (pa[1] - pb[1]).powi(2) + (pa[2] - pb[2]).powi(2)).sqrt();
        // One node fewer moves a 10th-order fit by far less than a metre; the sentinel used as a
        // node moved it by thousands of kilometres.
        assert!(d < 1.0, "t = {t}: {d} m");
    }
}

#[test]
fn a_repeated_epoch_is_counted_and_does_not_break_interpolation() {
    let text = kepler_file(1, 900.0, 16).to_sp3_string();
    let lines: Vec<&str> = text.lines().collect();
    let star = lines.iter().position(|l| l.starts_with('*')).unwrap() + 2 * 8;
    // Repeat the 9th epoch block (header + one P record).
    let block = format!("{}\n{}\n", lines[star], lines[star + 1]);
    let mut doubled = lines[..star + 2].join("\n") + "\n";
    doubled += &block;
    doubled += &(lines[star + 2..].join("\n") + "\n");
    let f = parse_sp3(&doubled).unwrap();
    assert_eq!(f.read.duplicate_epochs, 1);
    let p = f
        .interpolator("G01")
        .unwrap()
        .position_ecef(8.0 * 900.0 + 300.0);
    assert!(p.iter().all(|v| v.is_finite()), "{p:?}");
}

#[test]
fn records_and_trailers_the_reader_reports() {
    // A V record with no P before it, no EOF, and fewer epochs than declared.
    let written = kepler_file(1, 900.0, 4).to_sp3_string();
    assert!(parse_sp3(&written).unwrap().read.ended_at_eof);
    let f = parse_sp3(&written.replace("EOF\n", "")).unwrap();
    assert!(!f.read.ended_at_eof);
    // The IGS sample in the fixtures is itself an excerpt with no EOF record.
    assert!(!parse_sp3(SP3).unwrap().read.ended_at_eof);
    let cut: String = SP3
        .lines()
        .take_while(|l| !l.starts_with('*') || !l.contains(" 0 15 "))
        .map(|l| format!("{l}\n"))
        .collect();
    let f = parse_sp3(&cut).unwrap();
    assert_eq!(f.missing_epochs(), f.header.num_epochs - f.epochs.len());
    assert!(f.missing_epochs() > 0);

    let first_p = SP3.lines().find(|l| l.starts_with('P')).unwrap();
    let v = format!("V{}", &first_p[1..]);
    let star = SP3.lines().find(|l| l.starts_with('*')).unwrap();
    let with_v = SP3.replacen(star, &format!("{star}\n{v}"), 1);
    assert_eq!(
        parse_sp3(&with_v).unwrap().read.velocity_without_position,
        1
    );
}

#[test]
fn non_finite_sp3_values_are_refused() {
    let first_p = SP3.lines().find(|l| l.starts_with('P')).unwrap();
    for bad in ["           NaN", "           inf"] {
        let line = format!("{}{}{}", &first_p[..4], bad, &first_p[18..]);
        assert!(
            parse_sp3(&SP3.replacen(first_p, &line, 1)).is_err(),
            "{line}"
        );
    }
}

#[test]
fn ionex_no_value_and_per_map_exponent() {
    let maps = parse_ionex(IONEX).unwrap();
    let first = maps[0].grid.vtec.clone();
    // A 9999 in the first value row is no value, not 999.9 TECU.
    let row = "  258  271  282  291  298  301  303  301  298  291  282  271  258  243  227  209";
    let holed = IONEX.replacen(row, &row.replacen("  258", " 9999", 1), 1);
    let maps2 = parse_ionex(&holed).unwrap();
    assert!(maps2[0].grid.vtec.iter().filter(|v| v.is_nan()).count() == 1);
    assert!(maps2[0].grid.vtec.iter().all(|v| v.is_nan() || *v < 100.0));
    // A map with its own EXPONENT -2 is scaled by 10^-2, not the header's 10^-1.
    let own = IONEX.replacen(
        "  2018     5    13     0     0     0                        EPOCH OF CURRENT MAP",
        "  2018     5    13     0     0     0                        EPOCH OF CURRENT MAP\n    -2                                                      EXPONENT",
        1,
    );
    let maps3 = parse_ionex(&own).unwrap();
    for (a, b) in first.iter().zip(&maps3[0].grid.vtec) {
        assert!((a / 10.0 - b).abs() < 1e-12, "{a} {b}");
    }
    assert_eq!(
        maps3[1].grid.vtec, maps[1].grid.vtec,
        "the next map keeps the header's"
    );
    // A NaN token is not a value: the map is short and refused.
    assert!(parse_ionex(&IONEX.replacen("  258", "  NaN", 1)).is_none());
}

#[test]
fn antex_variation_rows_are_read_by_column_and_bad_rows_are_counted() {
    let good = parse_antex_receiver(ATX, ANT).unwrap();
    assert_eq!(good.dropped_tables, 0);
    let (_, pcv) = &good.freqs["G01"];
    assert_eq!(pcv.len(), 19);
    assert_eq!((good.zen1, good.zen2, good.dzen), (0.0, 90.0, 5.0));

    // Find this antenna's first NOAZI row and break it two ways.
    let start = ATX
        .find(&format!(
            "{ANT}                                        TYPE / SERIAL NO"
        ))
        .unwrap();
    let rel = ATX[start..].find("   NOAZI").unwrap();
    let row_start = start + rel;
    let row_end = row_start + ATX[row_start..].find('\n').unwrap();
    let row = &ATX[row_start..row_end];
    // (a) Two values that abut ("-0.12-10.25"): by column they are two values.
    let mut fields: Vec<String> = (0..19)
        .map(|k| row[8 + 8 * k..16 + 8 * k].to_string())
        .collect();
    fields[3] = "-1000.25".to_string();
    fields[4] = "-1000.50".to_string();
    let abut = format!("   NOAZI{}", fields.concat());
    let a = parse_antex_receiver(&ATX.replacen(row, &abut, 1), ANT).unwrap();
    assert_eq!(a.dropped_tables, 0);
    assert_eq!(a.freqs["G01"].1.len(), 19);
    assert!((a.freqs["G01"].1[4] + 1.0005).abs() < 1e-12);
    // (b) An unreadable value: the table is left out, not shifted.
    fields[6] = "   ****".to_string() + " ";
    let broken = format!("   NOAZI{}", fields.concat());
    let b = parse_antex_receiver(&ATX.replacen(row, &broken, 1), ANT).unwrap();
    assert_eq!(b.dropped_tables, 1);
    assert!(b.freqs["G01"].1.is_empty());
    assert_eq!(b.freqs["G01"].0, good.freqs["G01"].0, "the offset is kept");
    // (c) A row one value short of the grid.
    let short = row[..row.len() - 8].to_string();
    let c = parse_antex_receiver(&ATX.replacen(row, &short, 1), ANT).unwrap();
    assert_eq!(c.dropped_tables, 1);
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

const POISON: [&str; 6] = ["NaN", "inf", "-inf", "1.0E+400", "********", "infinity"];

/// Replace numeric tokens on random lines from `from` on with poison of the same width.
fn poison(text: &str, rng: &mut Rng, from: usize, hits: usize) -> String {
    let mut lines: Vec<String> = text.lines().map(str::to_string).collect();
    for _ in 0..hits {
        let k = from + rng.below(lines.len() - from);
        let line = lines[k].clone();
        let b = line.as_bytes();
        let mut spans = Vec::new();
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
            if line[s..i].bytes().any(|c| c.is_ascii_digit())
                && line.is_char_boundary(s)
                && line.is_char_boundary(i)
            {
                spans.push((s, i));
            }
        }
        if spans.is_empty() {
            continue;
        }
        let (s, e) = spans[rng.below(spans.len())];
        let p = POISON[rng.below(POISON.len())];
        let w = e - s;
        let rep = if p.len() >= w {
            p[..w].to_string()
        } else {
            format!("{p:>w$}")
        };
        lines[k] = format!("{}{}{}", &line[..s], rep, &line[e..]);
    }
    lines.join("\n") + "\n"
}

#[test]
fn poisoned_numeric_fields_never_come_back_as_values() {
    // PIN-SCOPE:    SP3, IONEX and ANTEX fixtures with up to three numeric fields replaced by
    //               NaN, inf, an overflowing exponent or a `*` field (seeded, 300 cases per
    //               reader): every value returned is finite (IONEX: or NaN where the file
    //               says 9999, which these inputs never do).
    // PIN-EXCLUDES: which error, and whether the poisoned record is dropped or refused.
    let sp3_body = SP3.lines().position(|l| l.starts_with('*')).unwrap();
    let ionex_body = IONEX
        .lines()
        .position(|l| l.contains("END OF HEADER"))
        .unwrap()
        + 1;
    let atx_body = ATX.find(ANT).map(|i| ATX[..i].lines().count()).unwrap();
    let mut rng = Rng(0x05EE_D5B3_2026);
    for case in 0..300 {
        let hits = 1 + case % 3;
        let s = poison(SP3, &mut rng, sp3_body, hits);
        if let Ok(f) = parse_sp3(&s) {
            for e in &f.epochs {
                for st in &e.sats {
                    assert!(
                        st.pos_m.iter().chain([&st.clock_us]).all(|v| v.is_finite()),
                        "sp3:\n{s}"
                    );
                    if let Some(v) = st.vel_m_s {
                        assert!(v.iter().all(|x| x.is_finite()), "sp3 vel:\n{s}");
                    }
                }
            }
            for id in &f.header.sat_ids {
                if let Some(ip) = f.interpolator(id) {
                    let p = ip.position_ecef(1800.0);
                    assert!(p.iter().all(|v| v.is_finite()), "sp3 interp {id}:\n{s}");
                }
            }
        }
        let t = poison(IONEX, &mut rng, ionex_body, hits);
        if let Some(maps) = parse_ionex(&t) {
            for m in &maps {
                assert!(m.grid.vtec.iter().all(|v| v.is_finite()), "ionex:\n{t}");
            }
        }
        let a = poison(ATX, &mut rng, atx_body, hits);
        if let Some(ant) = parse_antex_receiver(&a, ANT) {
            for (off, pcv) in ant.freqs.values() {
                assert!(off.iter().chain(pcv.iter()).all(|v| v.is_finite()), "antex");
            }
        }
    }
}
