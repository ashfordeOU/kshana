// SPDX-License-Identifier: AGPL-3.0-only
//! `src/ionex.rs` on a real CODE global ionosphere map (FUT-22 / CAP-26).
//!
//! Pre-registration: `tests/fixtures/ionex_code_gim/PREREGISTRATION.md`, committed alone in
//! e4d8b1f before the fixture slice was generated, before the formula reference was written and
//! before any comparison was run. Bars (copied, not changed):
//!
//! - B1 structure: 25 maps = `# OF MAPS IN FILE`; map k at `EPOCH OF FIRST MAP` + k x 3600 s, the
//!   last at `EPOCH OF LAST MAP` (t = 86400 s); grid 11 x 73; band latitudes on the header grid.
//! - B2 node exactness: |parsed - printed integer x 10^EXPONENT| = 0 at every node of every TEC
//!   map, for `parse_ionex_file` and for the existing `parse_ionex` (identical node values).
//! - B3 vertical TEC vs the Python formula reference (IONEX 1.0 bilinear, eq. 2, eq. 3):
//!   |Delta| <= 1e-9 TECU at every sample; the existing `interpolate_tec_in_time` + `vtec_at`
//!   composition, given the true epochs, held to the same bar for eq. 2.
//! - B4 slant TEC |Delta| <= 1e-9 TECU and L1 delay |Delta| <= 1e-10 m on the eq. 3 samples.
//! - B5 discrimination: eq. 3 differs from eq. 2, and from a sign-flipped rotation, by more than
//!   0.1 TECU at some sample.
//! - B6 RTKLIB output, data-gated on `KSHANA_IONEX_RTKLIB_CSV`: |Delta| <= 1e-5 TECU per row.
//!
//! Oracle classes: B1/B2 are the file's own printed numbers (real data, structural). B3/B4 are
//! an independent re-implementation of a published formula (`reference_interp.py`, Python
//! standard library, written from the format description, not from Kshana's source): a
//! reference implementation, so the row stays MODELLED. B6 would be a third-party library
//! (RTKLIB, BSD-2-Clause) but this repository cannot run it; the harness skips when the CSV is
//! absent.
//!
//! Result (first comparison run 2026-10-12, after the fixture commit 0901cca): all bars held.
//! B1 25 maps, 3600 s apart, last at 86400 s, 11 x 73 grid. B2 20075 nodes exact (0 TECU) in
//! both readers. B3 max |Delta| 1.4e-14 TECU (bilinear at map epochs, 2025 samples), 3.5e-13
//! (eq. 2, 6885), 3.6e-13 (eq. 3, 6885), 3.5e-13 (existing composition, eq. 2). B4 slant TEC
//! 5.1e-13 TECU, L1 delay 5.2e-14 m. B5 eq. 3 vs eq. 2 up to 0.983 TECU, vs a flipped rotation
//! up to 2.860 TECU (Kshana's eq. 3 misses the flipped reference by 2.860 TECU). B6 not run
//! (no RTKLIB output available). The full decompressed `CODG1330.18I` (71 x 73, 25 maps) also
//! passed `full_gim_file_structure_data_gated` locally. Finding fixed with this test: the
//! existing `parse_ionex` returned `None` on every real IONEX file, because a full 16-value
//! record fills columns 61-80 and was read as a label and skipped; it now reads such records.
//!
//! Data: `codg1330_crop.18i`, a latitude crop (30.0 to 5.0 deg, all longitudes, all 25 TEC and
//! RMS maps) of CODE's `CODG1330.18I` for 2018-05-13; NOTICE.md gives source, SHA-256, terms.
//! A full decompressed GIM can be checked structurally with `KSHANA_IONEX_FULL_PATH`.

use kshana::ionex::{
    interpolate_tec_in_time, parse_ionex, parse_ionex_file, vtec_to_delay_m, IonexFile,
    IonexTimeInterp, GPS_L1_HZ,
};
use std::io::Read;
use std::path::PathBuf;

const B3_TECU: f64 = 1e-9;
const B4_STEC_TECU: f64 = 1e-9;
const B4_DELAY_M: f64 = 1e-10;
const B5_MIN_TECU: f64 = 0.1;
const B6_TECU: f64 = 1e-5;

fn fixture_dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/ionex_code_gim")
}

fn ionex_text() -> String {
    std::fs::read_to_string(fixture_dir().join("codg1330_crop.18i")).expect("fixture")
}

fn ionex() -> IonexFile {
    parse_ionex_file(&ionex_text()).expect("the CODE GIM slice parses")
}

/// Rows of the formula reference, split on commas.
fn reference_rows() -> Vec<Vec<String>> {
    let f = std::fs::File::open(fixture_dir().join("reference_vtec.csv.gz")).expect("reference");
    let mut s = String::new();
    flate2::read::GzDecoder::new(f)
        .read_to_string(&mut s)
        .expect("gzip");
    s.lines()
        .map(|l| l.split(',').map(str::to_string).collect())
        .collect()
}

fn num(s: &str) -> f64 {
    s.parse().expect("number")
}

/// Printed integers of every TEC map, read independently of the crate: per map, a list of
/// (band latitude, 73 integers) in file order, by fixed I5 columns.
fn printed_tec_integers(text: &str, n_lon: usize) -> Vec<Vec<(f64, Vec<i64>)>> {
    let lines: Vec<&str> = text.lines().collect();
    let label = |l: &str| l.get(60..).unwrap_or("").trim().to_string();
    let mut maps = Vec::new();
    let mut k = lines
        .iter()
        .position(|l| label(l) == "END OF HEADER")
        .unwrap()
        + 1;
    let mut cur: Option<Vec<(f64, Vec<i64>)>> = None;
    while k < lines.len() {
        let lab = label(lines[k]);
        if lab == "START OF TEC MAP" {
            cur = Some(Vec::new());
        } else if lab == "END OF TEC MAP" {
            maps.push(cur.take().unwrap());
        } else if lab == "LAT/LON1/LON2/DLON/H" {
            let lat: f64 = lines[k][2..8].trim().parse().unwrap();
            let mut ints = Vec::new();
            let mut r = 0;
            while ints.len() < n_lon {
                r += 1;
                let rec = lines[k + r];
                let mut j = 0;
                while j + 5 <= rec.len() && ints.len() < n_lon {
                    ints.push(rec[j..j + 5].trim().parse::<i64>().unwrap());
                    j += 5;
                }
            }
            if let Some(m) = cur.as_mut() {
                m.push((lat, ints));
            }
            k += r;
        }
        k += 1;
    }
    maps
}

#[test]
fn b1_structure_matches_the_header() {
    let f = ionex();
    let h = &f.header;
    assert_eq!(h.n_maps, 25);
    assert_eq!(f.tec_maps.len(), 25, "TEC maps");
    assert_eq!(f.rms_maps.len(), 25, "RMS maps");
    assert_eq!(h.interval_s, 3600.0);
    assert_eq!(h.exponent, -1);
    assert_eq!(h.hgt_km, [450.0, 450.0, 0.0]);
    assert_eq!(h.mapping_function, "NONE");
    for (k, m) in f.tec_maps.iter().enumerate() {
        assert_eq!(m.index, k + 1);
        assert_eq!(m.t_s, 3600.0 * k as f64, "map {}", k + 1);
        assert_eq!(m.missing, 0);
        assert_eq!((m.grid.n_lat, m.grid.n_lon), (11, 73));
        assert_eq!((m.grid.lat0_deg, m.grid.dlat_deg), (5.0, 2.5));
        assert_eq!((m.grid.lon0_deg, m.grid.dlon_deg), (-180.0, 5.0));
    }
    let last = f.tec_maps.last().unwrap();
    assert_eq!(last.epoch, h.last_epoch);
    assert_eq!(last.t_s, h.last_epoch.seconds_since_day_of(&h.first_epoch));
    assert_eq!(last.t_s, 86_400.0);
    // Band latitudes on the header grid: checked by the parser (it refuses otherwise) and here.
    let printed = printed_tec_integers(&ionex_text(), 73);
    for m in &printed {
        let lats: Vec<f64> = m.iter().map(|b| b.0).collect();
        let want: Vec<f64> = (0..11).map(|i| 30.0 - 2.5 * i as f64).collect();
        assert_eq!(lats, want);
    }
}

#[test]
fn b2_every_node_is_the_printed_integer_times_ten_to_the_exponent() {
    let text = ionex_text();
    let f = ionex();
    let legacy = parse_ionex(&text).expect("the existing reader parses a real CODE GIM");
    assert_eq!(legacy.len(), 25);
    let printed = printed_tec_integers(&text, 73);
    assert_eq!(printed.len(), 25);
    let scale = 10f64.powi(-1);
    let refsums: Vec<(i64, usize)> = reference_rows()
        .into_iter()
        .filter(|r| r[0] == "N")
        .map(|r| (r[3].parse().unwrap(), r[4].parse().unwrap()))
        .collect();
    let mut nodes = 0usize;
    for (m, bands) in printed.iter().enumerate() {
        let g = &f.tec_maps[m].grid;
        let lg = &legacy[m].grid;
        let mut sum = 0i64;
        for (b, (_, ints)) in bands.iter().enumerate() {
            let i = 10 - b; // file runs north to south; the grid south to north
            for (j, &n) in ints.iter().enumerate() {
                let v = g.node(i, j);
                assert_eq!(v - n as f64 * scale, 0.0, "map {} band {b} col {j}", m + 1);
                assert_eq!((v / scale).round() as i64, n);
                assert_eq!(lg.node(i, j).to_bits(), v.to_bits(), "legacy differs");
                sum += n;
                nodes += 1;
            }
        }
        // The Python reference's own reader saw the same integers.
        assert_eq!((sum, 803), refsums[m], "map {} checksum", m + 1);
    }
    assert_eq!(nodes, 25 * 11 * 73);
    println!("B2: {nodes} nodes exact (0 TECU) for parse_ionex_file and parse_ionex");
}

#[test]
fn b3_b4_b5_interpolation_matches_the_formula_reference() {
    let f = ionex();
    let legacy = parse_ionex(&ionex_text()).unwrap();
    let rows = reference_rows();
    let (mut ds, mut d2, mut d3, mut d2l, mut dst, mut ddl) = (0f64, 0f64, 0f64, 0f64, 0f64, 0f64);
    let (mut sep2, mut sepf, mut kshana_vs_flip) = (0f64, 0f64, 0f64);
    let (mut ns, mut nt) = (0, 0);
    for r in &rows {
        match r[0].as_str() {
            "S" => {
                let (t, lat, lon) = (num(&r[1]), num(&r[2]), num(&r[3]));
                let k = f.tec_maps.iter().position(|m| m.t_s == t).unwrap();
                let v = f.tec_maps[k].grid.vtec_at(lat, lon);
                ds = ds.max((v - num(&r[4])).abs());
                ns += 1;
            }
            "T" => {
                let (t, lat, lon, z) = (num(&r[1]), num(&r[2]), num(&r[3]), num(&r[4]));
                let (e2, e3, e3f) = (num(&r[5]), num(&r[6]), num(&r[7]));
                let v2 = f
                    .vtec_at(t, lat, lon, IonexTimeInterp::Consecutive)
                    .unwrap();
                let v3 = f
                    .vtec_at(t, lat, lon, IonexTimeInterp::RotatedConsecutive)
                    .unwrap();
                d2 = d2.max((v2 - e2).abs());
                d3 = d3.max((v3 - e3).abs());
                // The existing API, given the true epochs of the bracketing maps.
                let i = ((t / 3600.0).floor() as usize).min(23);
                let (a, b) = (&legacy[i].grid, &legacy[i + 1].grid);
                let g =
                    interpolate_tec_in_time(a, b, 3600.0 * i as f64, 3600.0 * (i + 1) as f64, t)
                        .unwrap();
                d2l = d2l.max((g.vtec_at(lat, lon) - e2).abs());
                let st = f
                    .slant_tec_at(t, lat, lon, z, IonexTimeInterp::RotatedConsecutive)
                    .unwrap();
                dst = dst.max((st - num(&r[8])).abs());
                ddl = ddl.max((vtec_to_delay_m(st, GPS_L1_HZ) - num(&r[9])).abs());
                sep2 = sep2.max((e3 - e2).abs());
                sepf = sepf.max((e3 - e3f).abs());
                kshana_vs_flip = kshana_vs_flip.max((v3 - e3f).abs());
                nt += 1;
            }
            _ => {}
        }
    }
    println!(
        "B3: spatial {ns} samples max |d| {ds:.3e} TECU; eq2 {nt} max {d2:.3e}; eq3 {nt} max \
         {d3:.3e}; legacy eq2 composition max {d2l:.3e}"
    );
    println!("B4: slant TEC max |d| {dst:.3e} TECU; L1 delay max |d| {ddl:.3e} m");
    println!(
        "B5: max |eq3 - eq2| {sep2:.3} TECU; max |eq3 - flipped| {sepf:.3} TECU; Kshana eq3 vs \
         flipped reference {kshana_vs_flip:.3} TECU"
    );
    assert_eq!((ns, nt), (25 * 81, 85 * 81));
    assert!(ds <= B3_TECU && d2 <= B3_TECU && d3 <= B3_TECU && d2l <= B3_TECU);
    assert!(dst <= B4_STEC_TECU && ddl <= B4_DELAY_M);
    assert!(sep2 > B5_MIN_TECU && sepf > B5_MIN_TECU && kshana_vs_flip > B3_TECU);
}

#[test]
fn existing_parse_ionex_reads_the_24h_map_as_second_zero() {
    // Known before the run (PREREGISTRATION.md), a recorded limitation not changed here:
    // `parse_ionex` keeps seconds of day, so a daily file's closing 24:00 map reads as 0 s.
    // PIN-SCOPE: the epoch `parse_ionex` reports for map 25 (2018-05-14 00:00:00) of the slice.
    // PIN-EXCLUDES: node values (B2) and `parse_ionex_file`, which reads 86400 s.
    let legacy = parse_ionex(&ionex_text()).unwrap();
    assert_eq!(legacy[24].epoch_sod, 0.0);
    assert_eq!(legacy[23].epoch_sod, 82_800.0);
}

#[test]
fn time_queries_outside_the_maps_are_refused_and_nearest_picks_the_closest_map() {
    let f = ionex();
    assert!(f
        .vtec_at(-1.0, 16.0, -61.0, IonexTimeInterp::Consecutive)
        .is_none());
    assert!(f
        .vtec_at(86_401.0, 16.0, -61.0, IonexTimeInterp::RotatedConsecutive)
        .is_none());
    let near = f
        .vtec_at(5000.0, 15.0, -60.0, IonexTimeInterp::Nearest)
        .unwrap();
    assert_eq!(near, f.tec_maps[1].grid.vtec_at(15.0, -60.0));
}

#[test]
fn b6_rtklib_iontec_output_data_gated() {
    let Ok(path) = std::env::var("KSHANA_IONEX_RTKLIB_CSV") else {
        eprintln!(
            "SKIP: KSHANA_IONEX_RTKLIB_CSV unset (CSV with header time,lat,lon,vtec from RTKLIB \
             iontec/interptec on tests/fixtures/ionex_code_gim/codg1330_crop.18i; time in s \
             since 2018-05-13 00:00:00 UT)"
        );
        return;
    };
    let mode = match std::env::var("KSHANA_IONEX_RTKLIB_MODE").as_deref() {
        Ok("consecutive") => IonexTimeInterp::Consecutive,
        _ => IonexTimeInterp::RotatedConsecutive,
    };
    let text = std::fs::read_to_string(&path).expect("RTKLIB CSV");
    let f = ionex();
    let mut lines = text.lines();
    let head: Vec<String> = lines
        .next()
        .expect("header row")
        .split(',')
        .map(|s| s.trim().to_lowercase())
        .collect();
    let idx = |n: &str| head.iter().position(|h| h == n).expect(n);
    let (it, ila, ilo, iv) = (idx("time"), idx("lat"), idx("lon"), idx("vtec"));
    let (mut n, mut worst) = (0, 0f64);
    for l in lines.filter(|l| !l.trim().is_empty()) {
        let c: Vec<f64> = l.split(',').map(|s| s.trim().parse().unwrap()).collect();
        let v = f
            .vtec_at(c[it], c[ila], c[ilo], mode)
            .expect("query inside the maps");
        worst = worst.max((v - c[iv]).abs());
        n += 1;
    }
    println!("B6: {n} RTKLIB rows ({mode:?}), max |d| {worst:.3e} TECU (bar {B6_TECU:e})");
    assert!(n >= 1, "no rows");
    assert!(worst <= B6_TECU, "B6 miss: {worst} TECU");
}

#[test]
fn full_gim_file_structure_data_gated() {
    let Ok(path) = std::env::var("KSHANA_IONEX_FULL_PATH") else {
        eprintln!("SKIP: KSHANA_IONEX_FULL_PATH unset (a decompressed full IONEX file, e.g. CODG1330.18I)");
        return;
    };
    let text = std::fs::read_to_string(&path).expect("IONEX file");
    let f = parse_ionex_file(&text).expect("parses");
    let g = &f.tec_maps[0].grid;
    let printed = printed_tec_integers(&text, g.n_lon);
    let scale = 10f64.powi(f.header.exponent);
    for (m, bands) in printed.iter().enumerate() {
        let map = &f.tec_maps[m];
        assert_eq!(
            map.exponent, f.header.exponent,
            "per-map EXPONENT not checked here"
        );
        for (b, (_, ints)) in bands.iter().enumerate() {
            let i = map.grid.n_lat - 1 - b;
            for (j, &n) in ints.iter().enumerate() {
                let v = map.grid.node(i, j);
                if n == 9999 {
                    assert!(v.is_nan());
                } else {
                    assert_eq!(v - n as f64 * scale, 0.0);
                }
            }
        }
    }
    println!(
        "full file: {} TEC maps of {} x {}, nodes exact",
        f.tec_maps.len(),
        g.n_lat,
        g.n_lon
    );
}
