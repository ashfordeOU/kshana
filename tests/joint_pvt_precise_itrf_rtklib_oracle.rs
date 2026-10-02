// SPDX-License-Identifier: AGPL-3.0-only
//! Precise-product reference and library oracle for the joint multi-system pseudorange fix with
//! an inter-system bias (`leo_fusion::joint_pvt::solve`), on the real GPS + Galileo day of the
//! International GNSS Service (IGS) station ABMF used by `tests/joint_pvt_itrf_rtklib_oracle.rs`
//! and `tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs`.
//!
//! Why a new comparison (validation 0.30, round 2, batch "tools"; written 2026-10-02): the two
//! earlier runs missed the pre-registered 3 m / 95 % bar against the ITRF2020 coordinate, and
//! RTKLIB missed it by more on the same inputs (single frequency: Kshana 93.2 %, RTKLIB 88.2 %;
//! dual frequency: Kshana 79.9 %, RTKLIB 67.9 %). Both earlier inputs carried the broadcast
//! orbit and clock error (signal-in-space error of order 0.5 to 1 m per satellite) and, in the
//! dual-frequency run, an uncorrected GPS C/A-to-P(Y) code bias. Replacing the broadcast
//! ephemeris with precise IGS-format products (orbit, clock, satellite antenna offsets, P1−C1
//! code biases) removes those errors from the input of both tools: it is a STRICTER-INPUT
//! comparison of the same solver at the SAME bar, not a looser one. Both earlier results were
//! seen before this pre-registration was written; that is why it exists, and it is disclosed
//! here. The earlier tests and their findings stay as they are.
//!
//! Pre-registration (written before any precise product was fetched, before the fixture below was
//! cut, and before either tool was run on it).
//!
//! Observations: the committed dual-frequency slice
//! `tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/abmf_2018133_300s_GE_dual.rnx`
//! (2018-05-13, every 300 s; GPS `C1C`, `C2W`; Galileo `C1C`, `C5Q`, `C7Q`), unchanged.
//!
//! Products (to be fetched from the BKG IGS archive, https://igs.bkg.bund.de/root_ftp/IGS/, and
//! the IGS antenna archive; their SHA-256 values go into the fixture's NOTICE.md):
//! - the Center for Orbit Determination in Europe (CODE) multi-GNSS (MGEX) final orbit
//!   `products/mgex/2001/com20010.eph.Z` and clock `com20010.clk.Z` for 2018-05-13 (GPS week
//!   2001, day 0), with the neighbouring days' files (`com20006`, `com20011`) only to cover the
//!   transmit times and the interpolation window at the day boundaries;
//! - the CODE monthly P1−C1 code bias file `P1C11805.DCB` (already in the oracle data set);
//! - the IGS antenna file `igs14.atx` (satellite antennas only), the frame of the 2018 products.
//!
//! Fixture: `tests/fixtures/joint_pvt_precise_itrf_rtklib_oracle/make_fixture.py` cuts the GPS
//! and Galileo records of those files to 2018-05-12 21:00 to 2018-05-14 03:00 (orbit), the clock
//! records at and 30 s before each observation epoch (clock), and the GPS and Galileo satellite
//! antennas valid on the day (ANTEX). Both tools read the identical cut files.
//!
//! Processing, the same for both tools: dual-frequency ionosphere-free code (GPS L1 C/A with
//! L2 P(Y), the C/A code corrected to P1 with the P1−C1 bias; Galileo E1 with E5a), precise orbit
//! interpolated by an 11-point polynomial, clocks interpolated linearly, the ionosphere-free
//! satellite antenna offset in the nominal-yaw body frame, the periodic relativistic clock term,
//! no ionosphere model, Saastamoinen troposphere, 10 deg elevation mask, GPS + Galileo, receiver
//! antenna offsets not applied (the ITRF2020 marker is the antenna reference point of ABMF,
//! antenna height 0; the receiver phase-centre offset is about 0.1 m). Kshana:
//! `pvt::assemble_epoch_precise` then `joint_pvt::solve` with sigma = 1/sin(elevation) m, GPS the
//! reference clock and Galileo `SystemClock::Estimated`. RTKLIB v2.4.2-p13 `rnx2rtkp`
//! (BSD-2-Clause, run as a separate program), single mode, `pos1-sateph = precise`,
//! `pos1-ionoopt = dual-freq`, `file-satantfile` and `file-dcbfile` set to the cut files,
//! `$CLK` status records for the Galileo-minus-GPS offset. A satellite enters the Kshana solution
//! only when both its frequencies and its products are present.
//!
//! Reference: ITRF2020 ABMF solution 4 propagated to 2018-05-13 12:00 (as in the earlier tests).
//!
//! Tolerance, the same as both earlier pre-registrations (not loosened): (a) at least 100 epochs
//! solved and the 3-D error to the ITRF2020 coordinate at most 3 m at no fewer than 95 % of the
//! solved epochs; (b) the median over the epochs both tools solved of (Kshana ISB − RTKLIB ISB)
//! at most 1 ns in magnitude.
//!
//! Discrimination check, pre-registered: if the strict test passes, dropping the periodic
//! relativistic clock term (`clock_s: clk` in `PreciseProducts::state`) must turn it red.

use kshana::gnss_sim::Meteo;
use kshana::leo_fusion::joint_pvt::{solve, PseudorangeObs, SystemClock};
use kshana::precise_products::{
    parse_antex_satellites, parse_clock_rinex, parse_code_dcb, PreciseProducts,
};
use kshana::pvt::assemble_epoch_precise;
use kshana::rinex_obs::parse_obs;
use kshana::sp3::parse_sp3;
use std::path::PathBuf;

fn read(dir: &str, name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures")
        .join(dir)
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

const DIR: &str = "joint_pvt_precise_itrf_rtklib_oracle";
const C: f64 = 299_792_458.0;

/// ITRF2020 ABMF solution 4 (valid from 2015:118): position at 2015.0 (m) and velocity (m/yr).
const ITRF_POS_2015: [f64; 3] = [2_919_785.753_8, -5_383_745.010_5, 1_774_604.786_7];
const ITRF_VEL: [f64; 3] = [0.00718, 0.00980, 0.01425];
/// 2018-05-13 12:00 as a decimal year (day 133 of a 365-day year, mid-day).
const EPOCH_YEAR: f64 = 2018.0 + 132.5 / 365.0;

fn truth() -> [f64; 3] {
    let dt = EPOCH_YEAR - 2015.0;
    [
        ITRF_POS_2015[0] + ITRF_VEL[0] * dt,
        ITRF_POS_2015[1] + ITRF_VEL[1] * dt,
        ITRF_POS_2015[2] + ITRF_VEL[2] * dt,
    ]
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// RTKLIB rows: (GPS time of week, ECEF position, Galileo-minus-GPS offset in ns).
fn rtklib_rows() -> Vec<(f64, [f64; 3], f64)> {
    read(DIR, "rtklib_spp_precise.csv")
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let t: Vec<f64> = l.split(',').map(|x| x.parse().expect("number")).collect();
            (t[0], [t[1], t[2], t[3]], t[6])
        })
        .collect()
}

fn quantile(v: &[f64], q: f64) -> f64 {
    let mut s = v.to_vec();
    s.sort_by(|a, b| a.total_cmp(b));
    let k = ((s.len() - 1) as f64 * q).round() as usize;
    s[k]
}

/// Measured statistics of one run of the precise-product comparison.
struct Stats {
    n: usize,
    share: f64,
    med_isb: f64,
    rtk_share: f64,
}

fn run() -> Stats {
    let obs = parse_obs(&read(
        "joint_pvt_dual_freq_itrf_rtklib_oracle",
        "abmf_2018133_300s_GE_dual.rnx",
    ))
    .expect("observation slice parses");
    let sp3 = parse_sp3(&read(DIR, "com_2018133_GE.sp3")).expect("orbit parses");
    let clk = parse_clock_rinex(&read(DIR, "com_2018133_GE.clk")).expect("clock parses");
    let atx = parse_antex_satellites(&read(DIR, "igs14_2018133_GE_sat.atx")).expect("ANTEX");
    let dcb = parse_code_dcb(&read(DIR, "P1C11805.DCB"));
    let products = PreciseProducts::new(&sp3, clk, atx, dcb, 60.0);
    let apriori = obs.header.approx_xyz.expect("APPROX POSITION XYZ");
    let truth = truth();
    let rtk = rtklib_rows();
    let clocks = [SystemClock::Estimated, SystemClock::Estimated];
    let meteo = Meteo::default();

    let mut errors = Vec::new();
    let mut isb_diff_ns = Vec::new();
    let mut pos_diff = Vec::new();
    for idx in 0..obs.epochs.len() {
        let meas = assemble_epoch_precise(&obs, idx, &products, apriori, &meteo, 10.0);
        let prs: Vec<PseudorangeObs> = meas
            .iter()
            .filter_map(|(id, m)| {
                let system = match id.chars().next()? {
                    'G' => 0,
                    'E' => 1,
                    _ => return None,
                };
                Some(PseudorangeObs {
                    sat_pos: m.sat_ecef,
                    pseudorange_m: m.pseudorange_m + m.sat_clock_m - m.iono_m - m.tropo_m,
                    sigma_m: 1.0 / m.weight.sqrt(),
                    system,
                })
            })
            .collect();
        let has_gal = prs.iter().any(|p| p.system == 1);
        let has_gps = prs.iter().any(|p| p.system == 0);
        if !(has_gal && has_gps) {
            continue;
        }
        let fix = match solve(&prs, &clocks, apriori, 10) {
            Ok(f) => f,
            Err(_) => continue,
        };
        errors.push(dist(fix.position, truth));
        let tow = obs.epochs[idx].time.gps_time_of_week();
        let isb_ns = fix
            .isb_m
            .iter()
            .find(|(s, _)| *s == 1)
            .map(|(_, b)| b / C * 1e9)
            .expect("a Galileo bias");
        if let Some((_, rpos, risb)) = rtk.iter().find(|(t, _, _)| (t - tow).abs() < 1e-3) {
            isb_diff_ns.push(isb_ns - risb);
            pos_diff.push(dist(fix.position, *rpos));
        }
    }

    let n = errors.len();
    let within = errors.iter().filter(|&&e| e <= 3.0).count();
    let share = within as f64 / n.max(1) as f64;
    let med_isb = quantile(&isb_diff_ns, 0.5);
    let abs_isb: Vec<f64> = isb_diff_ns.iter().map(|d| d.abs()).collect();
    let rtk_err: Vec<f64> = rtk.iter().map(|(_, p, _)| dist(*p, truth)).collect();
    let rtk_within = rtk_err.iter().filter(|&&e| e <= 3.0).count();
    let rtk_share = rtk_within as f64 / rtk_err.len().max(1) as f64;
    eprintln!(
        "ABMF 2018-05-13 GPS+Galileo precise products: {n} epochs solved; 3-D error to ITRF2020 \
         median {:.2} m, 95th percentile {:.2} m, max {:.2} m; {within}/{n} = {:.1} % within 3 m",
        quantile(&errors, 0.5),
        quantile(&errors, 0.95),
        quantile(&errors, 1.0),
        100.0 * share
    );
    eprintln!(
        "RTKLIB on the same inputs: {rtk_within}/{} = {:.1} % within 3 m; 3-D error median {:.2} m, \
         95th percentile {:.2} m",
        rtk_err.len(),
        100.0 * rtk_share,
        quantile(&rtk_err, 0.5),
        quantile(&rtk_err, 0.95)
    );
    eprintln!(
        "ISB (Galileo - GPS), Kshana - RTKLIB over {} common epochs: median {:+.3} ns, per-epoch \
         |difference| 95th percentile {:.3} ns (reported only); position difference to RTKLIB \
         median {:.2} m, 95th percentile {:.2} m (reported only)",
        isb_diff_ns.len(),
        med_isb,
        quantile(&abs_isb, 0.95),
        quantile(&pos_diff, 0.5),
        quantile(&pos_diff, 0.95)
    );
    Stats {
        n,
        share,
        med_isb,
        rtk_share,
    }
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn precise_product_multi_gnss_fix_matches_itrf2020_and_rtklib() {
    let Stats {
        n,
        share,
        med_isb,
        rtk_share,
    } = run();
    eprintln!("RTKLIB share within 3 m: {:.3}", rtk_share);
    assert!(n >= 100, "only {n} epochs solved");
    assert!(
        share >= 0.95,
        "{:.1} % of epochs within 3 m of ITRF2020 (need 95 %)",
        100.0 * share
    );
    assert!(
        med_isb.abs() <= 1.0,
        "median ISB difference to RTKLIB {med_isb:+.3} ns exceeds 1 ns"
    );
}
