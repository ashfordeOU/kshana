// SPDX-License-Identifier: AGPL-3.0-only
//! SP3 satellite-clock interpolation (`Sp3File::clock_s`, `ClockRinex::from_sp3`) against the
//! published 30 s clocks of the International GNSS Service (IGS).
//!
//! PRE-REGISTRATION: `tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md`, committed on its
//! own (411526d) before the fixture was cut and before this test was first run. In short: the
//! IGS final 15 min orbit-and-clock product of 2025-02-24 is the input; the IGS final 30 s clock
//! combination of the same day is the oracle (clock values estimated at the query instants, not
//! interpolated). Over the GPS satellites: N, the median |SP3 − CLK| at the 15 min nodes, at most
//! 1e-12 s; I1, the root-mean-square of (linear interpolation − CLK) at the interval mid-points,
//! at most 0.15 ns; I2, its 95th percentile at most 0.30 ns; D, holding the earlier node instead
//! of interpolating gives at least twice the I1 root-mean-square; non-vacuity, at least 25
//! satellites and 2000 mid-point records.
//!
//! RESULT of the first run (2026-10-12), all bars held: 32 satellites; node median
//! |SP3 − CLK| 2.56e-13 s; 3038 mid-point records, root-mean-square 0.121 ns, 95th percentile
//! 0.265 ns; holding the earlier node instead gives 4.24 ns root-mean-square (35 times worse).

use kshana::precise_products::{parse_clock_rinex, ClockRinex};
use kshana::sp3::parse_sp3;
use std::path::PathBuf;

fn read(name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/sp3_clock_igs_oracle")
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

struct Stats {
    sats: usize,
    node_median_s: f64,
    mid_n: usize,
    mid_rms_s: f64,
    mid_p95_s: f64,
    hold_rms_s: f64,
}

fn rms(v: &[f64]) -> f64 {
    (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt()
}

fn percentile(v: &[f64], p: f64) -> f64 {
    let mut a: Vec<f64> = v.iter().map(|x| x.abs()).collect();
    a.sort_by(f64::total_cmp);
    a[((p * (a.len() - 1) as f64).round()) as usize]
}

fn compare() -> Stats {
    let sp3 = parse_sp3(&read("igs_2025055_G.sp3")).expect("SP3 parses");
    let clk = parse_clock_rinex(&read("igs_2025055_G_nodes_mid.clk")).expect("CLK parses");
    let from_sp3 = ClockRinex::from_sp3(&sp3);
    let s = sp3.header.start;
    let start = kshana::rinex::EpochUtc {
        year: s.year,
        month: s.month,
        day: s.day,
        hour: s.hour,
        minute: s.minute,
        second: s.second,
    }
    .seconds_from_gps_epoch();
    let (mut node, mut mid, mut hold) = (Vec::new(), Vec::new(), Vec::new());
    let mut sats = std::collections::BTreeSet::new();
    for (sat, recs) in &clk.sats {
        let nodes = sp3.clock_nodes(sat);
        for &(t, c) in recs {
            let ts = t - start;
            let Some(interp) = sp3.clock_s(sat, ts, 900.0) else {
                continue;
            };
            // The SP3-to-PreciseProducts path must give the identical value.
            assert_eq!(from_sp3.bias_s(sat, t, 900.0), Some(interp), "{sat} {ts}");
            let off = ts.rem_euclid(900.0);
            if off == 0.0 {
                node.push((interp - c).abs());
            } else if off == 450.0 {
                mid.push(interp - c);
                let i = nodes.partition_point(|&(tn, _)| tn < ts);
                hold.push(nodes[i - 1].1 - c);
                sats.insert(sat.clone());
            }
        }
    }
    node.sort_by(f64::total_cmp);
    Stats {
        sats: sats.len(),
        node_median_s: node[node.len() / 2],
        mid_n: mid.len(),
        mid_rms_s: rms(&mid),
        mid_p95_s: percentile(&mid, 0.95),
        hold_rms_s: rms(&hold),
    }
}

#[test]
fn sp3_clock_interpolation_matches_the_igs_30_s_clocks() {
    let s = compare();
    eprintln!(
        "satellites {}, node median |d| {:.3e} s, mid-points {}: rms {:.4} ns, p95 {:.4} ns; \
         hold-earlier-node rms {:.4} ns",
        s.sats,
        s.node_median_s,
        s.mid_n,
        s.mid_rms_s * 1e9,
        s.mid_p95_s * 1e9,
        s.hold_rms_s * 1e9
    );
    assert!(s.sats >= 25 && s.mid_n >= 2000, "non-vacuity");
    assert!(s.node_median_s <= 1e-12, "N");
    assert!(s.mid_rms_s <= 0.15e-9, "I1");
    assert!(s.mid_p95_s <= 0.30e-9, "I2");
    assert!(s.hold_rms_s >= 2.0 * s.mid_rms_s, "D");
}
