// SPDX-License-Identifier: AGPL-3.0-only
//! Earth-GNSS reception far above the constellation's service volume, with REAL satellite
//! positions, per-block transmit power and tabulated gain patterns, against the tracking
//! statistics Montenbruck et al. (2023) print for the GENESIS orbit.
//!
//! PRE-REGISTRATION (row M039, written 2026-10-02 before any Kshana value below was computed and
//! before the fixture generators were run; the engine functions were committed in 6851ddb2 with
//! unit tests on hand-made cases only).
//!
//! DISCLOSURE: to test the network route, the ESA orbit file and the IGS satellite metadata file
//! named below were downloaded once before this was written (2026-10-02 00:13 UTC) and not
//! opened. The paper's Fig. 3 and Fig. 4 were looked at as page renders to identify their
//! curves and axes; no value was read from them.
//!
//! ORACLE (Reference, P1 of docs/VALIDATION.md: a published simulation by an independent team,
//! its printed numbers): O. Montenbruck, P. Steigenberger, S. Thoelert, D. Arnold, G. Bury,
//! "GNSS visibility and performance implications for the GENESIS mission", Journal of Geodesy
//! 97:96, 2023, doi 10.1007/s00190-023-01784-4, CC BY 4.0 (reading copy SHA-256
//! 54190fa8...6d50ba). Table 3 (p. 10), row "Mean" and the rows "Mean (+3 dB)" and
//! "Mean (−3 dB)": mean number of tracked satellites per epoch, receiver with 12 or more channels
//! per antenna, for GPS L1 C/A and Galileo E1-C, zenith and nadir antennas:
//!   zenith L1 C/A 3.8 (4.7, 2.9); zenith E1-C 3.3 (3.7, 3.0);
//!   nadir  L1 C/A 5.8 (7.4, 5.0); nadir  E1-C 6.6 (7.3, 5.8).
//!
//! INPUTS (all from the paper unless stated; each a fixture in
//! `tests/fixtures/earth_gnss_measured_montenbruck/` with its generator and NOTICE.md):
//! - 24 h on 1 January 2023 (p. 8), epochs every 10 min from 00:00 to 23:50 GPS time (144; the
//!   paper does not state its step): positions of every GPS and Galileo satellite in the ESA/ESOC
//!   final multi-GNSS orbit ESA0MGNFIN_20230010000_01D_05M_ORB.SP3 (Earth-fixed), every second
//!   record. The paper used 31 GPS and 26 Galileo satellites; the counts in the file are reported.
//! - Satellite block on that date from the IGS satellite metadata file
//!   igs_satellite_metadata.snx (SATELLITE/IDENTIFIER and SATELLITE/PRN blocks): GPS-IIR-A,
//!   GPS-IIR-B, GPS-IIR-M, GPS-IIF, GPS-IIIA; GAL-1 (In-Orbit Validation, IOV), GAL-2 (Full
//!   Operational Capability, FOC). IOV-3 is GSAT0103 (SVN E103); IOV-1/2 are GSAT0101 and GSAT0102 (E101, E102).
//! - Transmit power, Table 2 (p. 6), dBW: L1 C/A IIR-A 14.5, IIR-B 14.5, IIR-M 14.5, IIF 14.0,
//!   III 13.5; E1-C IOV-1/2 10.5, IOV-3 9.0, FOC 14.5.
//! - Transmit gain: the azimuth-averaged L1/E1 curves of Fig. 3 (p. 5; IIR-A, IIR-B/M for both
//!   IIR-B and IIR-M, IIF, III, Galileo IOV, Galileo FOC), extracted from the PDF's vector paths:
//!   each curve is a filled stroke outline; its centre line is the mid-point between the upper
//!   and lower edges at each abscissa, sampled every 0.25 deg; axes calibrated from the panel's
//!   frame (x = -30 and +30 deg) and its labelled grid lines (y = -10, 0, 10 dB); the two
//!   mirrored halves are averaged where both exist. Where the curve leaves the panel (below
//!   -10 dB) and the PDF holds no path, the gain is undefined and the link is not counted.
//!   KNOWN DIFFERENCE, stated now: the paper used azimuth-dependent patterns for GPS (Table 1);
//!   only the azimuth averages are printed, so they are used here.
//! - Receive gain: the L1/E1 curve of Fig. 4 (p. 7), extracted the same way (frame x = -90 and
//!   +90 deg, grid lines y = -10 ... 10 dB), halves averaged, defined for z <= 90 deg.
//! - Noise factor T_eq + L_R = 28.5 dB (Eq. 6), 228.6 dB from Boltzmann's constant, L1/E1 at
//!   1575.42 MHz; Eq. (4) via `measured_link`. The +3 dB and -3 dB cases shift every C/N0.
//! - Thresholds 30 dB-Hz to acquire and 25 dB-Hz to keep tracking (p. 8) via
//!   `track_with_hysteresis`, per satellite and antenna, from the first epoch; no channel limit.
//! - GENESIS orbit (pp. 2 and 8): circular, height 6000 km above 6378.137 km, inclination
//!   95.5 deg, local time of the ascending node 14 h (right ascension of the node = Sun right
//!   ascension + 30 deg at 2023-01-01 00:00, Sun from `kshana::ephem::sun_position`), argument of
//!   latitude 0 at that instant (not stated by the paper), two-body motion, rotated to the
//!   Earth-fixed frame by Greenwich mean sidereal time (IAU 1982 expression, UT1 = GPS time -
//!   18 s).
//! - Antennas: zenith boresight along the radius, nadir boresight opposite. A link is counted
//!   only if the straight path clears a sphere of radius 6378.137 km (`occulted` false); for the
//!   nadir antenna also z >= 31.2 deg, the Earth obscuration angle the paper adopts (p. 3).
//!
//! TOLERANCE (fixed here, from the paper's own numbers): one decibel's worth of the paper's
//! sensitivity, per column: |Mean(+3 dB) - Mean(-3 dB)| / 6 dB x 1 dB, i.e. zenith L1 C/A 0.30,
//! zenith E1-C 0.117, nadir L1 C/A 0.40, nadir E1-C 0.25 satellites, applied to all three
//! rows of that column. One decibel is the accuracy the paper states for its own transmit-power
//! inputs (p. 7, "about 1 dB"). A pass is |Kshana - printed| <= tolerance for all 12 values.

use kshana::earth_gnss_lunar::{measured_link, track_with_hysteresis, GainTable};
use kshana::ephem::sun_position;
use std::collections::BTreeMap;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/earth_gnss_measured_montenbruck"
);
const RE: f64 = 6_378_137.0;
const MU: f64 = 3.986_004_418e14;
const L1: f64 = 1_575_420_000.0;
/// 2023-01-01 00:00:00 GPS time as a Julian date (GPS time scale).
const JD0_GPST: f64 = 2_459_945.5;

fn table(v: &serde_json::Value) -> GainTable {
    let pts: Vec<(f64, f64)> = v
        .as_array()
        .expect("points")
        .iter()
        .map(|p| (p[0].as_f64().expect("x"), p[1].as_f64().expect("y")))
        .collect();
    GainTable::new(&pts).expect("table")
}

/// GENESIS position (m, Earth-fixed) at `t_s` seconds after 2023-01-01 00:00 GPS time.
fn genesis_ecef(t_s: f64, raan: f64) -> [f64; 3] {
    let a = RE + 6_000_000.0;
    let n = (MU / (a * a * a)).sqrt();
    let u = n * t_s;
    let inc = 95.5f64.to_radians();
    let (su, cu) = u.sin_cos();
    let (so, co) = raan.sin_cos();
    let (si, ci) = inc.sin_cos();
    let r = [
        a * (cu * co - su * ci * so),
        a * (cu * so + su * ci * co),
        a * su * si,
    ];
    // Greenwich mean sidereal time, IAU 1982 (Vallado Eq. 3-47), UT1 = GPS time - 18 s.
    let jd_ut1 = JD0_GPST + (t_s - 18.0) / 86_400.0;
    let tu = (jd_ut1 - 2_451_545.0) / 36_525.0;
    let gmst_s =
        67_310.548_41 + (876_600.0 * 3_600.0 + 8_640_184.812_866) * tu + 0.093_104 * tu * tu
            - 6.2e-6 * tu * tu * tu;
    let g = (gmst_s.rem_euclid(86_400.0) / 240.0).to_radians();
    let (sg, cg) = g.sin_cos();
    [cg * r[0] + sg * r[1], -sg * r[0] + cg * r[1], r[2]]
}

struct Inputs {
    /// sat -> per-epoch Earth-fixed position (m), `None` when missing.
    orbits: BTreeMap<String, Vec<Option<[f64; 3]>>>,
    /// sat -> (power dBW, transmit pattern).
    tx: BTreeMap<String, (f64, GainTable)>,
    rx: GainTable,
    n_epochs: usize,
}

fn load() -> Inputs {
    let blocks: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{FIX}/blocks.json")).expect("blocks.json"),
    )
    .expect("json");
    let pats: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{FIX}/patterns.json")).expect("patterns.json"),
    )
    .expect("json");
    let csv = std::fs::read_to_string(format!("{FIX}/orbits_20230101_10min.csv")).expect("orbits");
    let n_epochs = 144;
    let mut orbits: BTreeMap<String, Vec<Option<[f64; 3]>>> = BTreeMap::new();
    for line in csv
        .lines()
        .filter(|l| !l.starts_with('#') && !l.starts_with("epoch"))
    {
        let f: Vec<&str> = line.split(',').collect();
        let k: usize = f[0].parse().expect("epoch");
        let p = [
            f[2].parse::<f64>().expect("x"),
            f[3].parse::<f64>().expect("y"),
            f[4].parse::<f64>().expect("z"),
        ];
        orbits
            .entry(f[1].to_string())
            .or_insert_with(|| vec![None; n_epochs])[k] = Some(p);
    }
    // Table 2 powers and the Fig. 3 curve each block uses.
    let spec = |block: &str, sat: &str, svn_name: &str| -> Option<(f64, &'static str)> {
        Some(match block {
            "GPS-IIR-A" => (14.5, "GPS IIR-A"),
            "GPS-IIR-B" => (14.5, "GPS IIR-B/M"),
            "GPS-IIR-M" => (14.5, "GPS IIR-B/M"),
            "GPS-IIF" => (14.0, "GPS IIF"),
            "GPS-IIIA" => (13.5, "GPS III"),
            "GAL-1" if svn_name == "E103" => (9.0, "Galileo IOV"),
            "GAL-1" => (10.5, "Galileo IOV"),
            "GAL-2" => (14.5, "Galileo FOC"),
            _ => {
                println!("{sat}: block {block} has no Table 2 entry; excluded");
                return None;
            }
        })
    };
    let mut tx = BTreeMap::new();
    for (sat, info) in blocks["satellites"].as_object().expect("satellites") {
        let block = info["block"].as_str().expect("block");
        let name = info["svn"].as_str().unwrap_or("");
        if let Some((p, curve)) = spec(block, sat, name) {
            tx.insert(sat.clone(), (p, table(&pats["transmit_l1_e1"][curve])));
        }
    }
    let rx = table(&pats["receive_l1_e1"]);
    Inputs {
        orbits,
        tx,
        rx,
        n_epochs,
    }
}

/// Mean tracked satellites per epoch: [(zenith, nadir)] for constellation prefix `c` at C/N0
/// offset `delta_db`.
fn mean_tracked(inp: &Inputs, c: char, delta_db: f64, raan: f64) -> (f64, f64) {
    let mut zen_tot = vec![0usize; inp.n_epochs];
    let mut nad_tot = vec![0usize; inp.n_epochs];
    let rcv: Vec<[f64; 3]> = (0..inp.n_epochs)
        .map(|k| genesis_ecef(600.0 * k as f64, raan))
        .collect();
    for (sat, pos) in inp.orbits.iter().filter(|(s, _)| s.starts_with(c)) {
        let Some((power, pattern)) = inp.tx.get(sat) else {
            continue;
        };
        for (nadir, tot) in [(false, &mut zen_tot), (true, &mut nad_tot)] {
            let cn0: Vec<Option<f64>> = (0..inp.n_epochs)
                .map(|k| {
                    let p = pos[k]?;
                    let r = rcv[k];
                    let b = if nadir { [-r[0], -r[1], -r[2]] } else { r };
                    let l =
                        measured_link(p, *power, pattern, r, b, &inp.rx, L1, 28.5 - delta_db, RE)?;
                    if l.occulted || (nadir && l.z_rx_deg < 31.2) {
                        return None;
                    }
                    l.cn0_dbhz
                })
                .collect();
            for (k, on) in track_with_hysteresis(&cn0, 30.0, 25.0).iter().enumerate() {
                if *on {
                    tot[k] += 1;
                }
            }
        }
    }
    let m = |v: &[usize]| v.iter().sum::<usize>() as f64 / v.len() as f64;
    (m(&zen_tot), m(&nad_tot))
}

fn raan_ltan_14h() -> f64 {
    let t_tt_jc = (JD0_GPST + 51.184 / 86_400.0 - 2_451_545.0) / 36_525.0;
    let s = sun_position(t_tt_jc);
    s[1].atan2(s[0]) + 30f64.to_radians()
}

#[test]
#[ignore = "FINDING (2026-10-02 first run): zenith agrees on 5 of 6 (E1-C 3.250/3.632/2.951 vs 3.3/3.7/3.0; L1 C/A +3 dB 4.417 vs 4.7, -3 dB 2.715 vs 2.9) but zenith L1 C/A nominal is 3.340 vs 3.8 (tol 0.30) and every nadir mean is 1.0 to 2.4 satellites HIGH (L1 C/A 8.153/9.771/7.167 vs 5.8/7.4/5.0, E1-C 7.715/8.500/6.819 vs 6.6/7.3/5.8); pinned by finding_genesis_nadir_counts_exceed_the_paper"]
fn genesis_table_3_mean_tracked_satellites() {
    let inp = load();
    let raan = raan_ltan_14h();
    let gps = inp.orbits.keys().filter(|s| s.starts_with('G')).count();
    let gal = inp.orbits.keys().filter(|s| s.starts_with('E')).count();
    println!("satellites in the orbit file: GPS {gps}, Galileo {gal} (paper: 31, 26)");
    // (constellation, column name, printed zenith [nominal, +3, -3], printed nadir, tolerances)
    let cases = [
        ('G', "L1 C/A", [3.8, 4.7, 2.9], [5.8, 7.4, 5.0]),
        ('E', "E1-C", [3.3, 3.7, 3.0], [6.6, 7.3, 5.8]),
    ];
    let mut failures = Vec::new();
    for (c, name, zen, nad) in cases {
        let tol_z = (zen[1] - zen[2]) / 6.0;
        let tol_n = (nad[1] - nad[2]) / 6.0;
        for (i, delta) in [0.0, 3.0, -3.0].into_iter().enumerate() {
            let (mz, mn) = mean_tracked(&inp, c, delta, raan);
            for (ant, got, printed, tol) in
                [("zenith", mz, zen[i], tol_z), ("nadir", mn, nad[i], tol_n)]
            {
                let ok = (got - printed).abs() <= tol;
                println!(
                    "{name:<7} {ant:<6} {delta:+.0} dB  printed {printed:>4.1}  kshana {got:>6.3}  tol {tol:.3}  {}",
                    if ok { "ok" } else { "FAIL" }
                );
                if !ok {
                    failures.push(format!("{name} {ant} {delta:+} dB: {got:.3} vs {printed}"));
                }
            }
        }
    }
    assert!(failures.is_empty(), "outside tolerance: {failures:#?}");
}

/// FINDING, pinned (2026-10-02): with the inputs the paper prints (Table 2 powers, the
/// azimuth-averaged Fig. 3 patterns, the Fig. 4 receive pattern, Eq. 6 noise factor, the stated
/// thresholds and orbit) the zenith-antenna statistics largely reproduce Table 3, but the
/// nadir-antenna means exceed it by 1.0 to 2.4 satellites. The nadir links sit at transmit angles
/// of 13.9 to 28 deg, in the side-lobe region where the paper used azimuth-DEPENDENT GPS patterns
/// (Table 1) and only azimuth averages are published; the unstated orbit phase and sampling are
/// the other undocumented inputs. The gap is not closable from published data.
#[test]
fn finding_genesis_nadir_counts_exceed_the_paper() {
    let inp = load();
    let raan = raan_ltan_14h();
    let (gz, gn) = mean_tracked(&inp, 'G', 0.0, raan);
    let (ez, en) = mean_tracked(&inp, 'E', 0.0, raan);
    assert!(
        (gz - 3.340).abs() < 0.001 && (ez - 3.250).abs() < 0.001,
        "{gz} {ez}"
    );
    assert!(
        (gn - 8.153).abs() < 0.001 && (en - 7.715).abs() < 0.001,
        "{gn} {en}"
    );
    assert!(gn - 5.8 > 1.0 && en - 6.6 > 1.0);
}
