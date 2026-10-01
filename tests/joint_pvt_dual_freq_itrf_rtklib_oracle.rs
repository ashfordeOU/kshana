// SPDX-License-Identifier: AGPL-3.0-only
//! Dual-frequency reference and library oracle for the joint multi-system pseudorange fix with an
//! inter-system bias (`leo_fusion::joint_pvt::solve`), on the real GPS + Galileo day of the IGS
//! station ABMF already used by `tests/joint_pvt_itrf_rtklib_oracle.rs`.
//!
//! Why a new comparison (validation 0.30, round 2, batch "tools"): the single-frequency run of
//! that test put 93.2 % of epochs within 3 m against the 95 % required, and RTKLIB itself reached
//! only 88.2 % on the same slices, so the bar was beyond the single-frequency broadcast error
//! budget (Klobuchar ionosphere at a low-latitude station), not a measure of the solver. Removing
//! the ionosphere with dual-frequency ionosphere-free pseudoranges is a STRICTER-INPUT comparison
//! with the SAME bar; the bar is not loosened. It needed an engine change first:
//! `pvt::assemble_epoch` now forms the Galileo E1/E5a (else E1/E5b) ionosphere-free pair with the
//! broadcast group delay of the pair and of the clock reference (Galileo OS SIS ICD 2.0, 5.1.5).
//!
//! Pre-registration (written 2026-10-01 before the new slices were cut, before the source files
//! were re-fetched and before either tool was run on them).
//!
//! Data: the same two public files as the single-frequency fixture, re-fetched from the BKG IGS
//! archive and checked against the SHA-256 values recorded there before use:
//! `ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz` (caacbbcc...71b1) and
//! `BRDC00WRD_R_20181330000_01D_MN.rnx.gz` (83374f15...36f3). New slices, cut by
//! `tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/make_fixture.py`: epochs every 300 s;
//! GPS `C1C` and `C2W`, Galileo `C1C`, `C5Q` and `C7Q`; the GPS records and the Galileo F/NAV
//! records (clock referred to E1/E5a) issued on the hour, 2018-05-12 20:00 to 2018-05-14 02:59.
//!
//! Processing, the same for both tools: dual-frequency ionosphere-free code (GPS L1 C/A with
//! L2 P(Y); Galileo E1 with E5a), broadcast ephemeris and clock, no ionosphere model, Saastamoinen
//! troposphere, 10 deg elevation mask, GPS + Galileo. Kshana: `pvt::assemble_epoch(dual_freq =
//! true)` then `joint_pvt::solve` with sigma = 1/sin(elevation) m, GPS the reference clock and
//! Galileo `SystemClock::Estimated`. RTKLIB v2.4.2-p13 `rnx2rtkp` (BSD-2-Clause), single mode,
//! `pos1-frequency = l1+l2+l5`, `pos1-ionoopt = dual-freq` (its ionosphere-free combination uses
//! L1/L2 for GPS and E1/E5a for Galileo), `$CLK` status records for the Galileo-minus-GPS offset.
//!
//! A satellite enters the Kshana solution only when both of its frequencies are present (the
//! engine then forms the ionosphere-free pseudorange), as in RTKLIB's dual-frequency mode.
//!
//! Reference: ITRF2020 ABMF solution 4 propagated to 2018-05-13 12:00 (as in the single-frequency
//! test).
//!
//! Tolerance, the same as the single-frequency pre-registration (not loosened): (a) at least 100
//! epochs solved and the 3-D error to the ITRF2020 coordinate at most 3 m at no fewer than 95 % of
//! the solved epochs; (b) the median over the epochs both tools solved of (Kshana ISB - RTKLIB
//! ISB) at most 1 ns in magnitude.
//!
//! Discrimination check, pre-registered: combining Galileo E1 with E5a at the GPS L2 frequency
//! instead of the E5a frequency (a wrong ionosphere-free coefficient) must turn this test red.

use kshana::gnss_sim::Meteo;
use kshana::leo_fusion::joint_pvt::{solve, PseudorangeObs, SystemClock};
use kshana::pvt::{assemble_epoch, klobuchar_from_nav_header, AtmosModel};
use kshana::rinex::parse_nav;
use kshana::rinex_obs::parse_obs;

fn fixture(name: &str) -> String {
    let p = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle")
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

const C: f64 = 299_792_458.0;
/// Second-frequency codes `pvt::assemble_epoch` combines with L1/E1 (its priority lists).
const GPS_L2: [&str; 6] = ["C2W", "C2L", "C2S", "C2X", "C2P", "C2C"];
const GAL_E5: [&str; 6] = ["C5Q", "C5X", "C5I", "C7Q", "C7X", "C7I"];

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
    fixture("rtklib_spp_if.csv")
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

#[test]
#[ignore = "pre-registered; not yet run"]
fn dual_frequency_multi_gnss_fix_matches_itrf2020_and_rtklib() {
    let obs_text = fixture("abmf_2018133_300s_GE_dual.rnx");
    let nav_text = fixture("brdc_2018133_G_Efnav.rnx");
    let obs = parse_obs(&obs_text).expect("observation slice parses");
    let ephs = parse_nav(&nav_text).expect("navigation slice parses");
    let atmos = AtmosModel {
        iono: klobuchar_from_nav_header(&nav_text).unwrap_or_default(),
        meteo: Meteo::default(),
    };
    let apriori = obs.header.approx_xyz.expect("APPROX POSITION XYZ");
    let truth = truth();
    let rtk = rtklib_rows();
    let clocks = [SystemClock::Estimated, SystemClock::Estimated];

    let mut errors = Vec::new();
    let mut isb_diff_ns = Vec::new();
    let mut pos_diff = Vec::new();
    for idx in 0..obs.epochs.len() {
        let meas = assemble_epoch(&obs, idx, &ephs, apriori, &atmos, 10.0, true);
        let prs: Vec<PseudorangeObs> = meas
            .iter()
            .filter_map(|(id, m)| {
                let (system, second): (usize, &[&str]) = match id.chars().next()? {
                    'G' => (0, &GPS_L2),
                    'E' => (1, &GAL_E5),
                    _ => return None,
                };
                // Only satellites the engine combined ionosphere-free (both frequencies
                // present), as RTKLIB's dual-frequency mode does.
                second
                    .iter()
                    .find_map(|c| obs.observation(idx, id, c))
                    .filter(|&r| r > 0.0)?;
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
    eprintln!(
        "ABMF 2018-05-13 GPS+Galileo dual-frequency: {n} epochs solved; 3-D error to ITRF2020 median {:.2} m, \
         95th percentile {:.2} m, max {:.2} m; {within}/{n} = {:.1} % within 3 m",
        quantile(&errors, 0.5),
        quantile(&errors, 0.95),
        quantile(&errors, 1.0),
        100.0 * share
    );
    eprintln!(
        "RTKLIB on the same slices: {} epochs, 3-D error median {:.2} m, 95th percentile {:.2} m",
        rtk_err.len(),
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
